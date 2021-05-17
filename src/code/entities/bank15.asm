; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Reset all values for a given entity to zero.
; Inputs:
;   bc   entity slot index
ResetEntity::
    call ClearEntitySpeed                         ; $4000: $CD $7F $3D
    ld   hl, wEntitiesSpeedZAccTable              ; $4003: $21 $30 $C3
    add  hl, bc                                   ; $4006: $09
    ld   [hl], b                                  ; $4007: $70
    ld   hl, wEntitiesSpeedXAccTable              ; $4008: $21 $60 $C2
    add  hl, bc                                   ; $400B: $09
    ld   [hl], b                                  ; $400C: $70
    ld   hl, wEntitiesSpeedYAccTable              ; $400D: $21 $70 $C2
    add  hl, bc                                   ; $4010: $09
    ld   [hl], b                                  ; $4011: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4012: $21 $20 $C3
    add  hl, bc                                   ; $4015: $09
    ld   [hl], b                                  ; $4016: $70
    ld   hl, wEntitiesStateTable                  ; $4017: $21 $90 $C2
    add  hl, bc                                   ; $401A: $09
    ld   [hl], b                                  ; $401B: $70
    ld   hl, wEntitiesCollisionsTable             ; $401C: $21 $A0 $C2
    add  hl, bc                                   ; $401F: $09
    ld   [hl], b                                  ; $4020: $70
    ld   hl, wEntitiesPrivateState1Table          ; $4021: $21 $B0 $C2
    add  hl, bc                                   ; $4024: $09
    ld   [hl], b                                  ; $4025: $70
    ld   hl, wEntitiesPrivateState2Table          ; $4026: $21 $C0 $C2
    add  hl, bc                                   ; $4029: $09
    ld   [hl], b                                  ; $402A: $70
    ld   hl, wEntitiesUnknownTableD               ; $402B: $21 $D0 $C2
    add  hl, bc                                   ; $402E: $09
    ld   [hl], b                                  ; $402F: $70
    ld   hl, wEntitiesUnknowTableP                ; $4030: $21 $40 $C4
    add  hl, bc                                   ; $4033: $09
    ld   [hl], b                                  ; $4034: $70
    ld   hl, wEntitiesUnknowTableR                ; $4035: $21 $90 $C3
    add  hl, bc                                   ; $4038: $09
    ld   [hl], b                                  ; $4039: $70
    ld   hl, wEntitiesTransitionCountdownTable    ; $403A: $21 $E0 $C2
    add  hl, bc                                   ; $403D: $09
    ld   [hl], b                                  ; $403E: $70
    ld   hl, wEntitiesPrivateCountdown1Table      ; $403F: $21 $F0 $C2
    add  hl, bc                                   ; $4042: $09
    ld   [hl], b                                  ; $4043: $70
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4044: $21 $00 $C3
    add  hl, bc                                   ; $4047: $09
    ld   [hl], b                                  ; $4048: $70
    ld   hl, wEntitiesPosZTable                   ; $4049: $21 $10 $C3
    add  hl, bc                                   ; $404C: $09
    ld   [hl], b                                  ; $404D: $70
    ld   hl, wEntitiesDirectionTable              ; $404E: $21 $80 $C3
    add  hl, bc                                   ; $4051: $09
    ld   [hl], b                                  ; $4052: $70
    xor  a                                        ; $4053: $AF
    call SetEntitySpriteVariant                   ; $4054: $CD $0C $3B
    ld   hl, wEntitiesUnknowTableY                ; $4057: $21 $D0 $C3
    add  hl, bc                                   ; $405A: $09
    ld   [hl], b                                  ; $405B: $70
    ld   hl, wEntitiesHealthTable                 ; $405C: $21 $60 $C3
    add  hl, bc                                   ; $405F: $09
    ld   [hl], b                                  ; $4060: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4061: $21 $10 $C4
    add  hl, bc                                   ; $4064: $09
    ld   [hl], b                                  ; $4065: $70
    ld   hl, wEntitiesPosXSignTable               ; $4066: $21 $20 $C2
    add  hl, bc                                   ; $4069: $09
    ld   [hl], b                                  ; $406A: $70
    ld   hl, wEntitiesPosYSignTable               ; $406B: $21 $30 $C2
    add  hl, bc                                   ; $406E: $09
    ld   [hl], b                                  ; $406F: $70
    ld   hl, wEntitiesUnknowTableI                ; $4070: $21 $70 $C4
    add  hl, bc                                   ; $4073: $09
    ld   [hl], b                                  ; $4074: $70
    ld   hl, wEntitiesDropTimerTable              ; $4075: $21 $50 $C4
    add  hl, bc                                   ; $4078: $09
    ld   [hl], b                                  ; $4079: $70
    ld   hl, wEntitiesUnknowTableV                ; $407A: $21 $80 $C4
    add  hl, bc                                   ; $407D: $09
    ld   [hl], b                                  ; $407E: $70
    ld   hl, wEntitiesUnknowTableW                ; $407F: $21 $90 $C4
    add  hl, bc                                   ; $4082: $09
    ld   [hl], b                                  ; $4083: $70
    ld   hl, wEntitiesFlashCountdownTable         ; $4084: $21 $20 $C4
    add  hl, bc                                   ; $4087: $09
    ld   [hl], b                                  ; $4088: $70
    ld   hl, wEntitiesDroppedItemTable            ; $4089: $21 $E0 $C4
    add  hl, bc                                   ; $408C: $09
    ld   [hl], b                                  ; $408D: $70
    ld   hl, wEntitiesUnknowTableJ                ; $408E: $21 $F0 $C4
    add  hl, bc                                   ; $4091: $09
    ld   [hl], b                                  ; $4092: $70
    ld   hl, wC5D0                                ; $4093: $21 $D0 $C5
    add  hl, bc                                   ; $4096: $09
    ld   [hl], $FF                                ; $4097: $36 $FF
    ld   hl, wEntitiesUnknowTableZ                ; $4099: $21 $A0 $C4
    add  hl, bc                                   ; $409C: $09
    ld   [hl], b                                  ; $409D: $70
    ret                                           ; $409E: $C9

include "code/entities/kanalet_castle_gate_switch.asm"
include "code/entities/moving_block.asm"

Data_015_4320::
    db   $58, $03, $58, $23

CrystalSwitchEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $4324: $21 $60 $C3
    add  hl, bc                                   ; $4327: $09
    ld   [hl], $FF                                ; $4328: $36 $FF
    call GetEntityTransitionCountdown             ; $432A: $CD $05 $0C
    rla                                           ; $432D: $17
    and  OAMF_PAL1 ; $432E: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4330: $E0 $ED
    ld   de, Data_015_4320                        ; $4332: $11 $20 $43
    call RenderActiveEntitySpritesPair            ; $4335: $CD $C0 $3B
    call func_015_7B0D                            ; $4338: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $433B: $CD $56 $0C
    call label_3B70                               ; $433E: $CD $70 $3B
    call func_015_7A6E                            ; $4341: $CD $6E $7A
    call label_3B23                               ; $4344: $CD $23 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $4347: $21 $20 $C4
    add  hl, bc                                   ; $434A: $09
    ld   a, [hl]                                  ; $434B: $7E
    and  a                                        ; $434C: $A7
    jr   z, jr_015_4364                           ; $434D: $28 $15

    ld   [hl], b                                  ; $434F: $70
    ld   a, [wSwitchableObjectAnimationStage]     ; $4350: $FA $F8 $D6
    and  a                                        ; $4353: $A7
    jr   nz, jr_015_4364                          ; $4354: $20 $0E

    ld   a, $01                                   ; $4356: $3E $01
    ld   [wSwitchableObjectAnimationStage], a     ; $4358: $EA $F8 $D6
    call GetEntityTransitionCountdown             ; $435B: $CD $05 $0C
    ld   [hl], $18                                ; $435E: $36 $18
    ld   a, $0E                                   ; $4360: $3E $0E
    ldh  [hWaveSfx], a                            ; $4362: $E0 $F3

jr_015_4364:
    ret                                           ; $4364: $C9

BouldersEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $4365: $F0 $F0
    and  a                                        ; $4367: $A7
    jp   nz, label_015_43CA                       ; $4368: $C2 $CA $43

    call func_015_7B0D                            ; $436B: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $436E: $CD $05 $0C
    jr   nz, jr_015_43AD                          ; $4371: $20 $3A

    call GetRandomByte                            ; $4373: $CD $0D $28
    and  $3F                                      ; $4376: $E6 $3F
    add  $30                                      ; $4378: $C6 $30
    ld   [hl], a                                  ; $437A: $77
    ldh  a, [hLinkPositionY]                      ; $437B: $F0 $99
    cp   $18                                      ; $437D: $FE $18
    ret  c                                        ; $437F: $D8

    ld   a, ENTITY_BOULDERS                       ; $4380: $3E $45
    call SpawnNewEntity_trampoline                ; $4382: $CD $86 $3B
    ret  c                                        ; $4385: $D8

    call GetRandomByte                            ; $4386: $CD $0D $28
    rla                                           ; $4389: $17
    rla                                           ; $438A: $17
    rla                                           ; $438B: $17
    rla                                           ; $438C: $17
    and  $70                                      ; $438D: $E6 $70
    add  $18                                      ; $438F: $C6 $18
    ld   hl, wEntitiesPosXTable                   ; $4391: $21 $00 $C2
    add  hl, de                                   ; $4394: $19
    ld   [hl], a                                  ; $4395: $77
    ld   hl, wEntitiesPosYTable                   ; $4396: $21 $10 $C2
    add  hl, de                                   ; $4399: $19
    ld   [hl], $10                                ; $439A: $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ; $439C: $21 $40 $C3
    add  hl, de                                   ; $439F: $19
    ld   [hl], $12                                ; $43A0: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $43A2: $21 $50 $C3
    add  hl, de                                   ; $43A5: $19
    set  7, [hl]                                  ; $43A6: $CB $FE
    ld   hl, wEntitiesStateTable                  ; $43A8: $21 $90 $C2
    add  hl, de                                   ; $43AB: $19
    inc  [hl]                                     ; $43AC: $34

jr_015_43AD:
    ret                                           ; $43AD: $C9

Data_015_43AE::
    db   $5C, $00, $5E, $00, $5E, $20, $5C, $20   ; $43AE
    db   $5E, $60, $5C, $60, $5C, $40, $5E, $40   ; $43B6

Data_015_43BE::
    db   $0C, $F4, $05, $FB

Data_015_43C2::
    db   $08, $0A, $06, $0C

Data_015_43C6::
    db   $18, $20, $1C, $28

label_015_43CA:
    ld   de, Data_015_43AE                        ; $43CA: $11 $AE $43
    call RenderActiveEntitySpritesPair            ; $43CD: $CD $C0 $3B
    call func_015_7B0D                            ; $43D0: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $43D3: $CD $56 $0C
    call label_3B39                               ; $43D6: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $43D9: $F0 $E7
    rra                                           ; $43DB: $1F

jr_015_43DC:
    rra                                           ; $43DC: $1F
    rra                                           ; $43DD: $1F
    and  $03                                      ; $43DE: $E6 $03
    call SetEntitySpriteVariant                   ; $43E0: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $43E3: $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ; $43E6: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $43E9: $21 $20 $C3
    add  hl, bc                                   ; $43EC: $09
    dec  [hl]                                     ; $43ED: $35
    dec  [hl]                                     ; $43EE: $35
    ld   hl, wEntitiesPosZTable                   ; $43EF: $21 $10 $C3
    add  hl, bc                                   ; $43F2: $09
    ld   a, [hl]                                  ; $43F3: $7E
    and  $80                                      ; $43F4: $E6 $80
    jr   z, jr_015_4430                           ; $43F6: $28 $38

    ld   [hl], b                                  ; $43F8: $70
    call GetRandomByte                            ; $43F9: $CD $0D $28
    and  $03                                      ; $43FC: $E6 $03
    ld   e, a                                     ; $43FE: $5F
    ld   d, b                                     ; $43FF: $50
    ld   hl, Data_015_43BE                        ; $4400: $21 $BE $43
    add  hl, de                                   ; $4403: $19
    ld   a, [hl]                                  ; $4404: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4405: $21 $40 $C2
    add  hl, bc                                   ; $4408: $09
    ld   [hl], a                                  ; $4409: $77
    call GetRandomByte                            ; $440A: $CD $0D $28
    and  $03                                      ; $440D: $E6 $03
    ld   e, a                                     ; $440F: $5F
    ld   d, b                                     ; $4410: $50

jr_015_4411:
    ld   hl, Data_015_43C2                        ; $4411: $21 $C2 $43
    add  hl, de                                   ; $4414: $19

jr_015_4415:
    ld   a, [hl]                                  ; $4415: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4416: $21 $50 $C2
    add  hl, bc                                   ; $4419: $09
    ld   [hl], a                                  ; $441A: $77
    call GetRandomByte                            ; $441B: $CD $0D $28
    and  $03                                      ; $441E: $E6 $03
    ld   e, a                                     ; $4420: $5F
    ld   d, b                                     ; $4421: $50
    ld   hl, Data_015_43C6                        ; $4422: $21 $C6 $43
    add  hl, de                                   ; $4425: $19
    ld   a, [hl]                                  ; $4426: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4427: $21 $20 $C3
    add  hl, bc                                   ; $442A: $09
    ld   [hl], a                                  ; $442B: $77
    ld   a, JINGLE_BIG_BUMP                       ; $442C: $3E $20
    ldh  [hJingle], a                             ; $442E: $E0 $F2

jr_015_4430:
    ldh  a, [hActiveEntityPosX]                   ; $4430: $F0 $EE
    cp   $A8                                      ; $4432: $FE $A8
    jp   nc, ClearEntityStatus_15                       ; $4434: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $4437: $F0 $EC
    cp   $84                                      ; $4439: $FE $84
    jp   nc, ClearEntityStatus_15                       ; $443B: $D2 $31 $7C

    ret                                           ; $443E: $C9

YarnaTalkingBonesEntityHandler::
    call func_015_7B0D                            ; $443F: $CD $0D $7B
    ld   e, $0F                                   ; $4442: $1E $0F
    ld   d, b                                     ; $4444: $50

jr_015_4445:
    ld   hl, wEntitiesStatusTable                 ; $4445: $21 $80 $C2
    add  hl, de                                   ; $4448: $19
    ld   a, [hl]                                  ; $4449: $7E
    cp   $05                                      ; $444A: $FE $05
    jr   nz, jr_015_448C                          ; $444C: $20 $3E

    ld   hl, wEntitiesTypeTable                   ; $444E: $21 $A0 $C3
    add  hl, de                                   ; $4451: $19
    ld   a, [hl]                                  ; $4452: $7E
    cp   $08                                      ; $4453: $FE $08
    jr   nz, jr_015_448C                          ; $4455: $20 $35

    ld   hl, wEntitiesTransitionCountdownTable    ; $4457: $21 $E0 $C2
    add  hl, de                                   ; $445A: $19
    ld   a, [hl]                                  ; $445B: $7E
    cp   $08                                      ; $445C: $FE $08
    jr   nz, jr_015_448C                          ; $445E: $20 $2C

    ld   hl, wEntitiesPosXTable                   ; $4460: $21 $00 $C2
    add  hl, de                                   ; $4463: $19
    ldh  a, [hActiveEntityPosX]                   ; $4464: $F0 $EE
    sub  [hl]                                     ; $4466: $96
    add  $08                                      ; $4467: $C6 $08
    cp   $10                                      ; $4469: $FE $10
    jr   nc, jr_015_448C                          ; $446B: $30 $1F

    ld   hl, wEntitiesPosYTable                   ; $446D: $21 $10 $C2
    add  hl, de                                   ; $4470: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4471: $F0 $EC
    sub  [hl]                                     ; $4473: $96
    add  $08                                      ; $4474: $C6 $08
    cp   $10                                      ; $4476: $FE $10
    jr   nc, jr_015_448C                          ; $4478: $30 $12

    ldh  a, [hMapRoom]                            ; $447A: $F0 $F6
    cp   UNKNOWN_ROOM_DF                          ; $447C: $FE $DF
    ld   a, $92                                   ; $447E: $3E $92
    jr   z, jr_015_4489                           ; $4480: $28 $07

    ld   a, [wIsGhostFollowingLink]               ; $4482: $FA $79 $DB
    and  a                                        ; $4485: $A7
    ret  nz                                       ; $4486: $C0

    ld   a, $43                                   ; $4487: $3E $43

jr_015_4489:
    jp   OpenDialog                               ; $4489: $C3 $85 $23

jr_015_448C:
    dec  e                                        ; $448C: $1D
    ld   a, e                                     ; $448D: $7B
    cp   $FF                                      ; $448E: $FE $FF
    jr   nz, jr_015_4445                          ; $4490: $20 $B3

    ret                                           ; $4492: $C9

SeashellMansionTreesEntityHandler::
    call func_015_7B0D                            ; $4493: $CD $0D $7B
    call ShouldLinkTalkToEntity                   ; $4496: $CD $BC $7A
    ret  nc                                       ; $4499: $D0

    jp_open_dialog $012                           ; $449A

Data_015_449F::
    db   $FF, $00, $FF, $00, $54, $00, $56, $00, $58, $00, $5A, $00, $56, $20, $54, $20
    db   $5A, $20, $58, $20

Data_015_44B3::
    db   $5C, $00, $5C, $20, $5E, $00, $5E, $00

FishEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $44BB: $F0 $F1
    cp   $FF                                      ; $44BD: $FE $FF
    jr   z, jr_015_44D7                           ; $44BF: $28 $16

    cp   $05                                      ; $44C1: $FE $05
    jr   c, jr_015_44D1                           ; $44C3: $38 $0C

    sub  $05                                      ; $44C5: $D6 $05
    ldh  [hActiveEntitySpriteVariant], a          ; $44C7: $E0 $F1
    ld   de, Data_015_44B3                        ; $44C9: $11 $B3 $44
    call RenderActiveEntitySprite                 ; $44CC: $CD $77 $3C
    jr   jr_015_44D7                              ; $44CF: $18 $06

jr_015_44D1:
    ld   de, Data_015_449F                        ; $44D1: $11 $9F $44
    call RenderActiveEntitySpritesPair            ; $44D4: $CD $C0 $3B

jr_015_44D7:
    call func_015_7B0D                            ; $44D7: $CD $0D $7B
    call func_015_7B3E                            ; $44DA: $CD $3E $7B
    call UpdateEntityPosWithSpeed_15              ; $44DD: $CD $88 $7B
    call label_3B23                               ; $44E0: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $44E3: $F0 $F0
    JP_TABLE                                      ; $44E5
._00 dw func_015_44EC                             ; $44E6
._01 dw func_015_4500                             ; $44E8
._02 dw func_015_4553                             ; $44EA

func_015_44EC::
    ld   hl, wEntitiesSpeedXTable                 ; $44EC: $21 $40 $C2
    add  hl, bc                                   ; $44EF: $09
    ld   [hl], $08                                ; $44F0: $36 $08
    call GetEntityTransitionCountdown             ; $44F2: $CD $05 $0C
    call GetRandomByte                            ; $44F5: $CD $0D $28
    and  $7F                                      ; $44F8: $E6 $7F
    add  $40                                      ; $44FA: $C6 $40
    ld   [hl], a                                  ; $44FC: $77
    jp   IncrementEntityState                     ; $44FD: $C3 $12 $3B

func_015_4500::
    call label_3B44                               ; $4500: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $4503: $CD $05 $0C
    jr   nz, jr_015_4530                          ; $4506: $20 $28

    ld   hl, wEntitiesPhysicsFlagsTable           ; $4508: $21 $40 $C3
    add  hl, bc                                   ; $450B: $09
    ld   [hl], $12                                ; $450C: $36 $12
    ld   hl, wEntitiesSpeedZTable                 ; $450E: $21 $20 $C3
    add  hl, bc                                   ; $4511: $09
    ld   [hl], $18                                ; $4512: $36 $18
    call IncrementEntityState                     ; $4514: $CD $12 $3B
    ld   hl, wEntitiesSpeedXTable                 ; $4517: $21 $40 $C2
    add  hl, bc                                   ; $451A: $09
    sla  [hl]                                     ; $451B: $CB $26

func_015_451D::
    ld   a, JINGLE_WATER_DIVE                     ; $451D: $3E $0E
    ldh  [hJingle], a                             ; $451F: $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ; $4521: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4523: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4525: $F0 $EC
    add  $00                                      ; $4527: $C6 $00
    ldh  [hMultiPurpose1], a                      ; $4529: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $452B: $3E $01
    jp   AddTranscientVfx                         ; $452D: $C3 $C7 $0C

jr_015_4530:
    ld   hl, wEntitiesCollisionsTable             ; $4530: $21 $A0 $C2
    add  hl, bc                                   ; $4533: $09
    ld   a, [hl]                                  ; $4534: $7E
    and  $03                                      ; $4535: $E6 $03
    jr   z, jr_015_4541                           ; $4537: $28 $08

    ld   hl, wEntitiesSpeedXTable                 ; $4539: $21 $40 $C2
    add  hl, bc                                   ; $453C: $09
    ld   a, [hl]                                  ; $453D: $7E
    cpl                                           ; $453E: $2F
    inc  a                                        ; $453F: $3C
    ld   [hl], a                                  ; $4540: $77

jr_015_4541:
    ld   hl, wEntitiesSpeedXTable                 ; $4541: $21 $40 $C2
    add  hl, bc                                   ; $4544: $09
    ld   e, $06                                   ; $4545: $1E $06
    ld   a, [hl]                                  ; $4547: $7E
    and  $80                                      ; $4548: $E6 $80
    jr   z, jr_015_454E                           ; $454A: $28 $02

    ld   e, $05                                   ; $454C: $1E $05

jr_015_454E:
    ld   a, e                                     ; $454E: $7B
    jp   SetEntitySpriteVariant                   ; $454F: $C3 $0C $3B

    ret                                           ; $4552: $C9

func_015_4553::
    call label_3B39                               ; $4553: $CD $39 $3B
    call AddEntityZSpeedToPos_15                  ; $4556: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4559: $21 $20 $C3
    add  hl, bc                                   ; $455C: $09
    dec  [hl]                                     ; $455D: $35
    ld   hl, wEntitiesPosZTable                   ; $455E: $21 $10 $C3
    add  hl, bc                                   ; $4561: $09
    ld   a, [hl]                                  ; $4562: $7E
    and  $80                                      ; $4563: $E6 $80
    jr   z, jr_015_4588                           ; $4565: $28 $21

    ld   [hl], b                                  ; $4567: $70
    call func_015_451D                            ; $4568: $CD $1D $45
    call GetEntityTransitionCountdown             ; $456B: $CD $05 $0C
    call GetRandomByte                            ; $456E: $CD $0D $28
    and  $7F                                      ; $4571: $E6 $7F
    add  $50                                      ; $4573: $C6 $50
    ld   [hl], a                                  ; $4575: $77
    ld   hl, wEntitiesSpeedXTable                 ; $4576: $21 $40 $C2
    add  hl, bc                                   ; $4579: $09
    sra  [hl]                                     ; $457A: $CB $2E
    ld   hl, wEntitiesPhysicsFlagsTable           ; $457C: $21 $40 $C3
    add  hl, bc                                   ; $457F: $09
    ld   [hl], $52                                ; $4580: $36 $52
    call IncrementEntityState                     ; $4582: $CD $12 $3B
    ld   [hl], $01                                ; $4585: $36 $01
    ret                                           ; $4587: $C9

jr_015_4588:
    ld   e, $01                                   ; $4588: $1E $01
    ld   hl, wEntitiesSpeedXTable                 ; $458A: $21 $40 $C2
    add  hl, bc                                   ; $458D: $09
    ld   a, [hl]                                  ; $458E: $7E
    and  $80                                      ; $458F: $E6 $80
    jr   nz, jr_015_4595                          ; $4591: $20 $02

    ld   e, $03                                   ; $4593: $1E $03

jr_015_4595:
    ld   hl, wEntitiesSpeedZTable                 ; $4595: $21 $20 $C3
    add  hl, bc                                   ; $4598: $09
    ld   a, [hl]                                  ; $4599: $7E
    and  $80                                      ; $459A: $E6 $80
    jr   z, jr_015_459F                           ; $459C: $28 $01

    inc  e                                        ; $459E: $1C

jr_015_459F:
    ld   a, e                                     ; $459F: $7B
    jp   SetEntitySpriteVariant                   ; $45A0: $C3 $0C $3B

Data_015_45A3::
    db   $00, $00, $46, $07, $00, $08, $7E, $07, $F0, $00, $46, $07, $F0, $08, $7E, $07
    db   $E0, $00, $46, $07, $E0, $08, $7E, $07, $D0, $00, $46, $07, $D0, $08, $7E, $07
    db   $C0, $00, $46, $07, $C0, $08, $7E, $07

label_015_45CB:
    ld   hl, wEntitiesUnknowTableY                ; $45CB: $21 $D0 $C3
    add  hl, bc                                   ; $45CE: $09
    ld   a, [hl]                                  ; $45CF: $7E
    add  $01                                      ; $45D0: $C6 $01
    sla  a                                        ; $45D2: $CB $27
    ld   c, a                                     ; $45D4: $4F
    ld   hl, Data_015_45A3                        ; $45D5: $21 $A3 $45
    call RenderActiveEntitySpritesRect            ; $45D8: $CD $E6 $3C
    ld   a, $0A                                   ; $45DB: $3E $0A
    call label_3DA0                               ; $45DD: $CD $A0 $3D
    call func_015_7B0D                            ; $45E0: $CD $0D $7B
    ld   a, [wGameplayType]                       ; $45E3: $FA $95 $DB
    cp   $01                                      ; $45E6: $FE $01
    ret  z                                        ; $45E8: $C8

    ldh  a, [hActiveEntityState]                  ; $45E9: $F0 $F0
    JP_TABLE                                      ; $45EB
._00 dw func_015_45F6                             ; $45EC
._01 dw func_015_45FE                             ; $45EE
._02 dw func_015_4627                             ; $45F0
._03 dw func_015_463D                             ; $45F2
._04 dw func_015_4660                             ; $45F4

func_015_45F6::
    call GetEntityTransitionCountdown             ; $45F6: $CD $05 $0C
    ld   [hl], $C0                                ; $45F9: $36 $C0
    jp   IncrementEntityState                     ; $45FB: $C3 $12 $3B

func_015_45FE::
    call GetEntityTransitionCountdown             ; $45FE: $CD $05 $0C
    cp   $40                                      ; $4601: $FE $40
    jr   nz, jr_015_460B                          ; $4603: $20 $06

    dec  [hl]                                     ; $4605: $35
    jp_open_dialog $0D7                           ; $4606

jr_015_460B:
    and  a                                        ; $460B: $A7
    ret  nz                                       ; $460C: $C0

    ld   a, $50                                   ; $460D: $3E $50
    dec  a                                        ; $460F: $3D
    ldh  [hMultiPurpose0], a                      ; $4610: $E0 $D7
    ld   a, $30                                   ; $4612: $3E $30
    ldh  [hMultiPurpose1], a                      ; $4614: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4616: $3E $02
    call AddTranscientVfx                         ; $4618: $CD $C7 $0C
    ld   a, JINGLE_POOF                           ; $461B: $3E $2F
    ldh  [hJingle], a                             ; $461D: $E0 $F2
    ld   a, $00                                   ; $461F: $3E $00
    call SetEntitySpriteVariant                   ; $4621: $CD $0C $3B
    jp   IncrementEntityState                     ; $4624: $C3 $12 $3B

func_015_4627::
    ldh  a, [hLinkPositionX]                      ; $4627: $F0 $98
    sub  $50                                      ; $4629: $D6 $50
    add  $08                                      ; $462B: $C6 $08
    cp   $10                                      ; $462D: $FE $10
    jr   nc, jr_015_463A                          ; $462F: $30 $09

    ldh  a, [hLinkPositionY]                      ; $4631: $F0 $99
    sub  $30                                      ; $4633: $D6 $30
    add  $08                                      ; $4635: $C6 $08
    cp   $10                                      ; $4637: $FE $10
    ret  c                                        ; $4639: $D8

jr_015_463A:
    jp   IncrementEntityState                     ; $463A: $C3 $12 $3B

func_015_463D::
    ldh  a, [hLinkPositionX]                      ; $463D: $F0 $98
    sub  $50                                      ; $463F: $D6 $50
    add  $08                                      ; $4641: $C6 $08
    cp   $10                                      ; $4643: $FE $10
    jr   nc, jr_015_465F                          ; $4645: $30 $18

    ldh  a, [hLinkPositionY]                      ; $4647: $F0 $99
    sub  $30                                      ; $4649: $D6 $30
    add  $08                                      ; $464B: $C6 $08
    cp   $10                                      ; $464D: $FE $10
    jr   nc, jr_015_465F                          ; $464F: $30 $0E

    ld   a, [wIsLinkInTheAir]                     ; $4651: $FA $46 $C1
    and  a                                        ; $4654: $A7
    ret  nz                                       ; $4655: $C0

    call IncrementEntityState                     ; $4656: $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $4659: $21 $B0 $C2
    add  hl, bc                                   ; $465C: $09
    ld   [hl], $30                                ; $465D: $36 $30

jr_015_465F:
    ret                                           ; $465F: $C9

func_015_4660::
    ld   a, $02                                   ; $4660: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4662: $E0 $A1
    ld   [wC167], a                               ; $4664: $EA $67 $C1
    ld   hl, wEntitiesPrivateState1Table          ; $4667: $21 $B0 $C2
    add  hl, bc                                   ; $466A: $09
    ld   a, [hl]                                  ; $466B: $7E
    ldh  [hLinkPositionY], a                      ; $466C: $E0 $99
    ld   a, $50                                   ; $466E: $3E $50
    ldh  [hLinkPositionX], a                      ; $4670: $E0 $98
    ldh  a, [hFrameCounter]                       ; $4672: $F0 $E7
    and  $07                                      ; $4674: $E6 $07
    jr   nz, jr_015_4682                          ; $4676: $20 $0A

    ld   hl, wEntitiesUnknowTableY                ; $4678: $21 $D0 $C3
    add  hl, bc                                   ; $467B: $09
    ld   a, [hl]                                  ; $467C: $7E
    cp   $04                                      ; $467D: $FE $04
    jr   z, jr_015_4682                           ; $467F: $28 $01

    inc  [hl]                                     ; $4681: $34

jr_015_4682:
    ldh  a, [hFrameCounter]                       ; $4682: $F0 $E7
    and  $03                                      ; $4684: $E6 $03
    jr   nz, jr_015_469C                          ; $4686: $20 $14

    ld   hl, wEntitiesPrivateState1Table          ; $4688: $21 $B0 $C2
    add  hl, bc                                   ; $468B: $09
    dec  [hl]                                     ; $468C: $35
    ld   a, [hl]                                  ; $468D: $7E
    cp   $12                                      ; $468E: $FE $12
    jr   nc, jr_015_469C                          ; $4690: $30 $0A

    xor  a                                        ; $4692: $AF
    ld   [wGameplaySubtype], a                    ; $4693: $EA $96 $DB
    ld   a, $01                                   ; $4696: $3E $01
    ld   [wGameplayType], a                       ; $4698: $EA $95 $DB
    ret                                           ; $469B: $C9

jr_015_469C:
    ld   a, $02                                   ; $469C: $3E $02
    ldh  [hLinkDirection], a                      ; $469E: $E0 $9E
    ldh  a, [hFrameCounter]                       ; $46A0: $F0 $E7
    and  $08                                      ; $46A2: $E6 $08
    ld   [wConsecutiveStepsCount], a                               ; $46A4: $EA $20 $C1
    push bc                                       ; $46A7: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $46A8: $CD $F0 $0B
    pop  bc                                       ; $46AB: $C1
    call ResetSpinAttack                          ; $46AC: $CD $AF $0C
    ; a = 0
    ; wSwordAnimationState = SWORD_ANIMATION_STATE_NONE
    ld   [wSwordAnimationState], a                ; $46AF: $EA $37 $C1
    ld   [wC16A], a                               ; $46B2: $EA $6A $C1
    ret                                           ; $46B5: $C9

MoblinKingEntityHandler::
    ld   a, [wIsBowWowFollowingLink]              ; $46B6: $FA $56 $DB
    cp   $80                                      ; $46B9: $FE $80
    jp   nz, ClearEntityStatus_15           ; $46BB: $C2 $31 $7C

    ld   hl, wEntitiesDirectionTable              ; $46BE: $21 $80 $C3
    add  hl, bc                                   ; $46C1: $09
    ld   a, [hl]                                  ; $46C2: $7E
    and  a                                        ; $46C3: $A7
    jr   nz, jr_015_46D0                          ; $46C4: $20 $0A

    ldh  a, [hActiveEntitySpriteVariant]          ; $46C6: $F0 $F1
    cp   $0C                                      ; $46C8: $FE $0C
    jr   nc, jr_015_46D0                          ; $46CA: $30 $04

    add  $06                                      ; $46CC: $C6 $06
    ldh  [hActiveEntitySpriteVariant], a          ; $46CE: $E0 $F1

jr_015_46D0:
    call func_015_4AC9                            ; $46D0: $CD $C9 $4A
    ldh  a, [hActiveEntityStatus]                 ; $46D3: $F0 $EA
    cp   $01                                      ; $46D5: $FE $01
    jr   nz, jr_015_46E1                          ; $46D7: $20 $08

    ld   a, $0C                                   ; $46D9: $3E $0C
    call func_015_48B6                            ; $46DB: $CD $B6 $48
    jp   label_015_7C37                           ; $46DE: $C3 $37 $7C

jr_015_46E1:
    call label_394D                               ; $46E1: $CD $4D $39
    call func_015_7B0D                            ; $46E4: $CD $0D $7B
    call func_015_7B3E                            ; $46E7: $CD $3E $7B
    call label_3B39                               ; $46EA: $CD $39 $3B
    ld   hl, wEntitiesOptions1Table               ; $46ED: $21 $30 $C4
    add  hl, bc                                   ; $46F0: $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $46F1: $CB $F6
    ld   hl, wEntitiesPhysicsFlagsTable           ; $46F3: $21 $40 $C3
    add  hl, bc                                   ; $46F6: $09
    res  7, [hl]                                  ; $46F7: $CB $BE
    call UpdateEntityPosWithSpeed_15              ; $46F9: $CD $88 $7B
    call label_3B23                               ; $46FC: $CD $23 $3B
    call AddEntityZSpeedToPos_15                  ; $46FF: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4702: $21 $20 $C3
    add  hl, bc                                   ; $4705: $09
    dec  [hl]                                     ; $4706: $35
    dec  [hl]                                     ; $4707: $35
    dec  [hl]                                     ; $4708: $35
    ld   hl, wEntitiesPosZTable                   ; $4709: $21 $10 $C3
    add  hl, bc                                   ; $470C: $09
    ld   a, [hl]                                  ; $470D: $7E
    and  $80                                      ; $470E: $E6 $80
    ldh  [hMultiPurposeG], a                               ; $4710: $E0 $E8
    jr   z, jr_015_471A                           ; $4712: $28 $06

    ld   [hl], b                                  ; $4714: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4715: $21 $20 $C3
    add  hl, bc                                   ; $4718: $09
    ld   [hl], b                                  ; $4719: $70

jr_015_471A:
    ld   hl, wEntitiesStateTable                  ; $471A: $21 $90 $C2
    add  hl, bc                                   ; $471D: $09
    ld   a, [hl]                                  ; $471E: $7E
    JP_TABLE                                      ; $471F
._00 dw func_015_4734                             ; $4720
._01 dw func_015_4750                             ; $4722
._02 dw func_015_4780                             ; $4724
._03 dw func_015_483F                             ; $4726
._04 dw func_015_4873                             ; $4728
._05 dw func_015_48CF                             ; $472A
._06 dw func_015_494C                             ; $472C
._07 dw func_015_4977                             ; $472E
._08 dw func_015_499C                             ; $4730
._09 dw func_015_49C2                             ; $4732

func_015_4734::
    call GetEntityTransitionCountdown
    ld   [hl], $20                                ; $4737: $36 $20
    xor  a                                        ; $4739: $AF
    ld   [wD228], a                               ; $473A: $EA $28 $D2
    call SetEntitySpriteVariant                   ; $473D: $CD $0C $3B
    call IncrementEntityState                     ; $4740: $CD $12 $3B

func_015_4743::
    call func_015_7BDB                            ; $4743: $CD $DB $7B
    ld   a, e                                     ; $4746: $7B
    ld   [wD227], a                               ; $4747: $EA $27 $D2
    ld   hl, wEntitiesDirectionTable              ; $474A: $21 $80 $C3
    add  hl, bc                                   ; $474D: $09

jr_015_474E:
    ld   [hl], a                                  ; $474E: $77
    ret                                           ; $474F: $C9

func_015_4750::
    call GetEntityTransitionCountdown             ; $4750: $CD $05 $0C
    ret  nz                                       ; $4753: $C0

    call_open_dialog $191                         ; $4754
    ld   hl, wDialogState                         ; $4759: $21 $9F $C1

jr_015_475C:
    res  7, [hl]                                  ; $475C: $CB $BE
    call IncrementEntityState                     ; $475E: $CD $12 $3B
    call GetEntityDropTimer                       ; $4761: $CD $FB $0B
    ld   [hl], $30                                ; $4764: $36 $30
    ld   hl, wEntitiesOptions1Table               ; $4766: $21 $30 $C4
    add  hl, bc                                   ; $4769: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IS_MINI_BOSS                                ; $476A: $36 $84
    ld   a, $01                                   ; $476C: $3E $01
    ld   [wD228], a                               ; $476E: $EA $28 $D2
    ld   a, $01                                   ; $4771: $3E $01
    jp   SetEntitySpriteVariant                   ; $4773: $C3 $0C $3B

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
    call GetEntityPrivateCountdown1               ; $4780: $CD $00 $0C
    jr   z, jr_015_47E3                           ; $4783: $28 $5E

    cp   $0C                                      ; $4785: $FE $0C
    jr   nz, jr_015_47D1                          ; $4787: $20 $48

    ld   a, ENTITY_MOBLIN_ARROW                   ; $4789: $3E $0C
    call SpawnNewEntity_trampoline                ; $478B: $CD $86 $3B
    jr   c, jr_015_47D1                           ; $478E: $38 $41

    ld   a, $0A                                   ; $4790: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4792: $E0 $F4
    push bc                                       ; $4794: $C5
    ldh  a, [hMultiPurpose2]                      ; $4795: $F0 $D9
    ld   c, a                                     ; $4797: $4F
    ld   hl, Data_015_4776                        ; $4798: $21 $76 $47
    add  hl, bc                                   ; $479B: $09
    ldh  a, [hMultiPurpose0]                      ; $479C: $F0 $D7
    add  [hl]                                     ; $479E: $86
    ld   hl, wEntitiesPosXTable                   ; $479F: $21 $00 $C2
    add  hl, de                                   ; $47A2: $19
    ld   [hl], a                                  ; $47A3: $77
    ld   hl, Data_015_4778                        ; $47A4: $21 $78 $47
    add  hl, bc                                   ; $47A7: $09
    ldh  a, [hMultiPurpose1]                      ; $47A8: $F0 $D8
    add  [hl]                                     ; $47AA: $86
    ld   hl, wEntitiesPosYTable                   ; $47AB: $21 $10 $C2
    add  hl, de                                   ; $47AE: $19
    ld   [hl], a                                  ; $47AF: $77
    ld   hl, Data_015_477A                        ; $47B0: $21 $7A $47
    add  hl, bc                                   ; $47B3: $09
    ld   a, [hl]                                  ; $47B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $47B5: $21 $40 $C2
    add  hl, de                                   ; $47B8: $19
    ld   [hl], a                                  ; $47B9: $77
    ld   hl, Data_015_477C                        ; $47BA: $21 $7C $47
    add  hl, bc                                   ; $47BD: $09
    ld   a, [hl]                                  ; $47BE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $47BF: $21 $50 $C2
    add  hl, de                                   ; $47C2: $19
    ld   [hl], a                                  ; $47C3: $77
    ldh  a, [hMultiPurpose2]                      ; $47C4: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $47C6: $21 $B0 $C3
    add  hl, de                                   ; $47C9: $19
    ld   [hl], a                                  ; $47CA: $77
    ld   hl, wEntitiesDirectionTable              ; $47CB: $21 $80 $C3
    add  hl, de                                   ; $47CE: $19
    ld   [hl], a                                  ; $47CF: $77
    pop  bc                                       ; $47D0: $C1

jr_015_47D1:
    call GetEntityPrivateCountdown1               ; $47D1: $CD $00 $0C
    ld   e, $00                                   ; $47D4: $1E $00
    cp   $0C                                      ; $47D6: $FE $0C
    jr   c, jr_015_47DC                           ; $47D8: $38 $02

    ld   e, $02                                   ; $47DA: $1E $02

jr_015_47DC:
    ld   a, e                                     ; $47DC: $7B
    call SetEntitySpriteVariant                   ; $47DD: $CD $0C $3B
    jp   ClearEntitySpeed                         ; $47E0: $C3 $7F $3D

jr_015_47E3:
    call GetEntityDropTimer                       ; $47E3: $CD $FB $0B
    jr   nz, jr_015_47F3                          ; $47E6: $20 $0B

    call GetEntityTransitionCountdown             ; $47E8: $CD $05 $0C
    ld   [hl], $30                                ; $47EB: $36 $30
    call ClearEntitySpeed                         ; $47ED: $CD $7F $3D
    jp   IncrementEntityState                     ; $47F0: $C3 $12 $3B

jr_015_47F3:
    ldh  a, [hMultiPurposeG]                               ; $47F3: $F0 $E8
    and  a                                        ; $47F5: $A7
    jr   z, jr_015_4816                           ; $47F6: $28 $1E

    ldh  a, [hLinkPositionX]                      ; $47F8: $F0 $98
    push af                                       ; $47FA: $F5
    call func_015_7BDB                            ; $47FB: $CD $DB $7B
    ld   d, b                                     ; $47FE: $50
    ld   hl, Data_015_477E                        ; $47FF: $21 $7E $47
    add  hl, de                                   ; $4802: $19
    ldh  a, [hLinkPositionX]                      ; $4803: $F0 $98
    add  [hl]                                     ; $4805: $86
    ldh  [hLinkPositionX], a                      ; $4806: $E0 $98
    ld   a, $0C                                   ; $4808: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $480A: $CD $AA $3B
    pop  af                                       ; $480D: $F1
    ldh  [hLinkPositionX], a                      ; $480E: $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ; $4810: $21 $20 $C3
    add  hl, bc                                   ; $4813: $09
    ld   [hl], $10                                ; $4814: $36 $10

jr_015_4816:
    ldh  a, [hFrameCounter]                       ; $4816: $F0 $E7
    rra                                           ; $4818: $1F
    rra                                           ; $4819: $1F
    rra                                           ; $481A: $1F
    rra                                           ; $481B: $1F
    and  $01                                      ; $481C: $E6 $01
    call SetEntitySpriteVariant                   ; $481E: $CD $0C $3B
    ld   [wD228], a                               ; $4821: $EA $28 $D2
    call func_015_4743                            ; $4824: $CD $43 $47
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4827: $21 $00 $C3
    add  hl, bc                                   ; $482A: $09
    ld   a, [hl]                                  ; $482B: $7E
    and  a                                        ; $482C: $A7
    jr   nz, jr_015_483C                          ; $482D: $20 $0D

    call GetRandomByte                            ; $482F: $CD $0D $28
    and  $3F                                      ; $4832: $E6 $3F
    add  $30                                      ; $4834: $C6 $30
    ld   [hl], a                                  ; $4836: $77
    call GetEntityPrivateCountdown1               ; $4837: $CD $00 $0C
    ld   [hl], $18                                ; $483A: $36 $18

jr_015_483C:
    ret                                           ; $483C: $C9

Data_015_483D::
    db   $28, $D8

func_015_483F::
    call GetEntityTransitionCountdown             ; $483F: $CD $05 $0C
    jr   nz, jr_015_485C                          ; $4842: $20 $18

    ld   [hl], $22                                ; $4844: $36 $22
    call ClearEntitySpeed                         ; $4846: $CD $7F $3D
    ld   hl, wEntitiesDirectionTable              ; $4849: $21 $80 $C3
    add  hl, bc                                   ; $484C: $09
    ld   e, [hl]                                  ; $484D: $5E
    ld   d, b                                     ; $484E: $50
    ld   hl, Data_015_483D                        ; $484F: $21 $3D $48
    add  hl, de                                   ; $4852: $19
    ld   a, [hl]                                  ; $4853: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4854: $21 $40 $C2
    add  hl, bc                                   ; $4857: $09
    ld   [hl], a                                  ; $4858: $77
    jp   IncrementEntityState                     ; $4859: $C3 $12 $3B

jr_015_485C:
    and  $07                                      ; $485C: $E6 $07
    jr   nz, jr_015_4864                          ; $485E: $20 $04

    ld   a, JINGLE_BUMP                           ; $4860: $3E $09
    ldh  [hJingle], a                             ; $4862: $E0 $F2

jr_015_4864:
    call ClearEntitySpeed                         ; $4864: $CD $7F $3D
    ldh  a, [hFrameCounter]                       ; $4867: $F0 $E7
    rra                                           ; $4869: $1F
    rra                                           ; $486A: $1F
    rra                                           ; $486B: $1F
    and  $01                                      ; $486C: $E6 $01
    add  $02                                      ; $486E: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4870: $C3 $0C $3B

func_015_4873::
    call GetEntityTransitionCountdown             ; $4873: $CD $05 $0C
    jr   nz, jr_015_487E                          ; $4876: $20 $06

    call IncrementEntityState                     ; $4878: $CD $12 $3B
    jp   IncrementEntityState                     ; $487B: $C3 $12 $3B

jr_015_487E:
    ld   hl, wEntitiesCollisionsTable             ; $487E: $21 $A0 $C2
    add  hl, bc                                   ; $4881: $09
    ld   a, [hl]                                  ; $4882: $7E
    and  $03                                      ; $4883: $E6 $03
    jr   z, jr_015_48AE                           ; $4885: $28 $27

    xor  a                                        ; $4887: $AF
    ld   [wC158], a                               ; $4888: $EA $58 $C1
    ld   a, $20                                   ; $488B: $3E $20
    ld   [wC157], a                               ; $488D: $EA $57 $C1
    ld   a, JINGLE_HUGE_BUMP                      ; $4890: $3E $0B
    ldh  [hJingle], a                             ; $4892: $E0 $F2
    ld   hl, wEntitiesSpeedXTable                 ; $4894: $21 $40 $C2
    add  hl, bc                                   ; $4897: $09
    sra  [hl]                                     ; $4898: $CB $2E
    sra  [hl]                                     ; $489A: $CB $2E
    ld   a, [hl]                                  ; $489C: $7E
    cpl                                           ; $489D: $2F
    inc  a                                        ; $489E: $3C
    ld   [hl], a                                  ; $489F: $77
    ld   hl, wEntitiesSpeedZTable                 ; $48A0: $21 $20 $C3
    add  hl, bc                                   ; $48A3: $09
    ld   [hl], $28                                ; $48A4: $36 $28
    call IncrementEntityState                     ; $48A6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $48A9: $CD $05 $0C
    ld   [hl], $60                                ; $48AC: $36 $60

jr_015_48AE:
    ldh  a, [hFrameCounter]                       ; $48AE: $F0 $E7
    rra                                           ; $48B0: $1F
    rra                                           ; $48B1: $1F
    and  $01                                      ; $48B2: $E6 $01
    add  $04                                      ; $48B4: $C6 $04

func_015_48B6::
    call SetEntitySpriteVariant                   ; $48B6: $CD $0C $3B
    ld   a, $FF                                   ; $48B9: $3E $FF
    ld   [wD228], a                               ; $48BB: $EA $28 $D2
    ret                                           ; $48BE: $C9

Data_015_48BF::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02

Data_015_48C7::
    db   $00, $04, $08, $0C, $10, $0C, $08, $04

func_015_48CF::
    ld   hl, wEntitiesOptions1Table               ; $48CF: $21 $30 $C4
    add  hl, bc                                   ; $48D2: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $48D3: $CB $B6
    ld   hl, wEntitiesPhysicsFlagsTable           ; $48D5: $21 $40 $C3
    add  hl, bc                                   ; $48D8: $09
    set  7, [hl]                                  ; $48D9: $CB $FE
    call GetEntityTransitionCountdown             ; $48DB: $CD $05 $0C
    jr   nz, jr_015_48F0                          ; $48DE: $20 $10

    ld   [hl], $40                                ; $48E0: $36 $40
    call IncrementEntityState                     ; $48E2: $CD $12 $3B
    call IncrementEntityState                     ; $48E5: $CD $12 $3B
    ld   a, $00                                   ; $48E8: $3E $00
    ld   [wD228], a                               ; $48EA: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $48ED: $C3 $0C $3B

jr_015_48F0:
    ldh  a, [hMultiPurposeG]                               ; $48F0: $F0 $E8
    and  a                                        ; $48F2: $A7
    jr   z, jr_015_48F8                           ; $48F3: $28 $03

    call ClearEntitySpeed                         ; $48F5: $CD $7F $3D

jr_015_48F8:
    ldh  a, [hFrameCounter]                       ; $48F8: $F0 $E7
    rra                                           ; $48FA: $1F
    rra                                           ; $48FB: $1F
    rra                                           ; $48FC: $1F
    and  $01                                      ; $48FD: $E6 $01
    add  $0C                                      ; $48FF: $C6 $0C
    call SetEntitySpriteVariant                   ; $4901: $CD $0C $3B
    ld   a, [wOAMNextAvailableSlot]               ; $4904: $FA $C0 $C3
    ld   e, a                                     ; $4907: $5F
    ld   d, b                                     ; $4908: $50
    ld   hl, wDynamicOAMBuffer                    ; $4909: $21 $30 $C0
    add  hl, de                                   ; $490C: $19
    ldh  a, [hFrameCounter]                       ; $490D: $F0 $E7
    rra                                           ; $490F: $1F
    rra                                           ; $4910: $1F
    rra                                           ; $4911: $1F
    and  $07                                      ; $4912: $E6 $07
    call func_015_491C                            ; $4914: $CD $1C $49
    ld   a, $02                                   ; $4917: $3E $02
    jp   label_3DA0                               ; $4919: $C3 $A0 $3D

func_015_491C::
    call func_015_4928                            ; $491C: $CD $28 $49
    ldh  a, [hFrameCounter]                       ; $491F: $F0 $E7
    rra                                           ; $4921: $1F
    rra                                           ; $4922: $1F
    rra                                           ; $4923: $1F
    add  $04                                      ; $4924: $C6 $04
    and  $07                                      ; $4926: $E6 $07

func_015_4928::
    push bc                                       ; $4928: $C5
    push hl                                       ; $4929: $E5
    ld   e, a                                     ; $492A: $5F
    ld   d, $00                                   ; $492B: $16 $00
    ld   hl, Data_015_48BF                        ; $492D: $21 $BF $48
    add  hl, de                                   ; $4930: $19
    ld   b, [hl]                                  ; $4931: $46
    ld   hl, Data_015_48C7                        ; $4932: $21 $C7 $48
    add  hl, de                                   ; $4935: $19
    ld   c, [hl]                                  ; $4936: $4E
    pop  hl                                       ; $4937: $E1
    ldh  a, [hActiveEntityVisualPosY]             ; $4938: $F0 $EC
    add  b                                        ; $493A: $80
    add  $F6                                      ; $493B: $C6 $F6
    ld   [hl+], a                                 ; $493D: $22
    ldh  a, [hActiveEntityPosX]                   ; $493E: $F0 $EE
    add  c                                        ; $4940: $81
    add  $FC                                      ; $4941: $C6 $FC
    ld   [hl+], a                                 ; $4943: $22
    ld   [hl], $24                                ; $4944: $36 $24
    inc  hl                                       ; $4946: $23
    ld   [hl], $00                                ; $4947: $36 $00
    inc  hl                                       ; $4949: $23
    pop  bc                                       ; $494A: $C1
    ret                                           ; $494B: $C9

func_015_494C::
    ld   hl, wEntitiesSpeedXTable                 ; $494C: $21 $40 $C2
    add  hl, bc                                   ; $494F: $09
    ld   a, [hl]                                  ; $4950: $7E
    and  $FE                                      ; $4951: $E6 $FE
    jr   nz, jr_015_4960                          ; $4953: $20 $0B

    call ClearEntitySpeed                         ; $4955: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $4958: $CD $05 $0C
    ld   [hl], $40                                ; $495B: $36 $40
    jp   IncrementEntityState                     ; $495D: $C3 $12 $3B

jr_015_4960:
    ld   hl, wEntitiesSpeedXTable                 ; $4960: $21 $40 $C2
    add  hl, bc                                   ; $4963: $09
    ld   a, [hl]                                  ; $4964: $7E
    and  $80                                      ; $4965: $E6 $80
    jr   z, jr_015_496D                           ; $4967: $28 $04

    inc  [hl]                                     ; $4969: $34
    inc  [hl]                                     ; $496A: $34
    inc  [hl]                                     ; $496B: $34
    inc  [hl]                                     ; $496C: $34

jr_015_496D:
    dec  [hl]                                     ; $496D: $35
    dec  [hl]                                     ; $496E: $35
    ld   a, $00                                   ; $496F: $3E $00
    ld   [wD228], a                               ; $4971: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $4974: $C3 $0C $3B

func_015_4977::
    call ClearEntitySpeed                         ; $4977: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $497A: $CD $05 $0C
    jr   nz, jr_015_4990                          ; $497D: $20 $11

label_015_497F:
    call GetEntityDropTimer                       ; $497F: $CD $FB $0B
    call GetRandomByte                            ; $4982: $CD $0D $28
    and  $1F                                      ; $4985: $E6 $1F
    add  $20                                      ; $4987: $C6 $20
    ld   [hl], a                                  ; $4989: $77
    call IncrementEntityState                     ; $498A: $CD $12 $3B
    ld   [hl], $02                                ; $498D: $36 $02
    ret                                           ; $498F: $C9

jr_015_4990:
    ldh  a, [hFrameCounter]                       ; $4990: $F0 $E7
    rra                                           ; $4992: $1F
    rra                                           ; $4993: $1F
    rra                                           ; $4994: $1F
    rra                                           ; $4995: $1F
    and  $01                                      ; $4996: $E6 $01
    ld   [wD227], a                               ; $4998: $EA $27 $D2
    ret                                           ; $499B: $C9

func_015_499C::
    call IncrementEntityState                     ; $499C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $499F: $CD $05 $0C
    ld   [hl], $60                                ; $49A2: $36 $60
    ld   hl, wEntitiesSpeedXTable                 ; $49A4: $21 $40 $C2
    add  hl, bc                                   ; $49A7: $09
    ld   a, [hl]                                  ; $49A8: $7E
    ldh  [hLinkSpeedX], a                         ; $49A9: $E0 $9A
    ld   a, $28                                   ; $49AB: $3E $28
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $49AD: $EA $3E $C1
    ld   a, $40                                   ; $49B0: $3E $40
    ld   [wInvincibilityCounter], a               ; $49B2: $EA $C7 $DB
    ld   a, [wSubtractHealthBuffer]               ; $49B5: $FA $94 $DB
    add  $08                                      ; $49B8: $C6 $08
    ld   [wSubtractHealthBuffer], a               ; $49BA: $EA $94 $DB
    ld   a, JINGLE_HUGE_BUMP                      ; $49BD: $3E $0B
    ldh  [hJingle], a                             ; $49BF: $E0 $F2
    ret                                           ; $49C1: $C9

func_015_49C2::
    call ClearEntitySpeed                         ; $49C2: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $49C5: $CD $05 $0C
    jr   nz, jr_015_49CD                          ; $49C8: $20 $03

    jp   label_015_497F                           ; $49CA: $C3 $7F $49

jr_015_49CD:
    cp   $40                                      ; $49CD: $FE $40
    ld   a, $00                                   ; $49CF: $3E $00
    jr   nc, jr_015_49DC                          ; $49D1: $30 $09

    ldh  a, [hFrameCounter]                       ; $49D3: $F0 $E7
    rra                                           ; $49D5: $1F
    rra                                           ; $49D6: $1F
    rra                                           ; $49D7: $1F
    rra                                           ; $49D8: $1F
    rra                                           ; $49D9: $1F
    and  $01                                      ; $49DA: $E6 $01

jr_015_49DC:
    call SetEntitySpriteVariant                   ; $49DC: $CD $0C $3B
    ld   [wD228], a                               ; $49DF: $EA $28 $D2
    jp   func_015_4743                            ; $49E2: $C3 $43 $47

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
    ld   a, [wD227]                               ; $4AC9: $FA $27 $D2
    sla  a                                        ; $4ACC: $CB $27
    ld   e, a                                     ; $4ACE: $5F
    ld   a, [wD228]                               ; $4ACF: $FA $28 $D2
    cp   $FF                                      ; $4AD2: $FE $FF
    jr   z, jr_015_4AEB                           ; $4AD4: $28 $15

    add  e                                        ; $4AD6: $83
    rla                                           ; $4AD7: $17
    rla                                           ; $4AD8: $17
    and  $FC                                      ; $4AD9: $E6 $FC
    ld   e, a                                     ; $4ADB: $5F
    rla                                           ; $4ADC: $17
    and  $F8                                      ; $4ADD: $E6 $F8
    add  e                                        ; $4ADF: $83
    ld   e, a                                     ; $4AE0: $5F
    ld   d, b                                     ; $4AE1: $50
    ld   hl, Data_015_49E5                        ; $4AE2: $21 $E5 $49
    add  hl, de                                   ; $4AE5: $19
    ld   c, $03                                   ; $4AE6: $0E $03
    call RenderActiveEntitySpritesRect            ; $4AE8: $CD $E6 $3C

jr_015_4AEB:
    ldh  a, [hActiveEntitySpriteVariant]          ; $4AEB: $F0 $F1
    rla                                           ; $4AED: $17
    rla                                           ; $4AEE: $17
    and  $FC                                      ; $4AEF: $E6 $FC
    ld   e, a                                     ; $4AF1: $5F
    rla                                           ; $4AF2: $17
    and  $F8                                      ; $4AF3: $E6 $F8
    add  e                                        ; $4AF5: $83
    ld   e, a                                     ; $4AF6: $5F
    ld   d, b                                     ; $4AF7: $50
    ld   hl, Data_015_4A15                        ; $4AF8: $21 $15 $4A
    add  hl, de                                   ; $4AFB: $19
    ld   c, $03                                   ; $4AFC: $0E $03
    call RenderActiveEntitySpritesRect            ; $4AFE: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $4B01: $21 $10 $C3
    add  hl, bc                                   ; $4B04: $09
    ld   a, [hl]                                  ; $4B05: $7E
    and  a                                        ; $4B06: $A7
    ret  z                                        ; $4B07: $C8

    ldh  a, [hActiveEntityPosY]                   ; $4B08: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $4B0A: $E0 $EC
    ld   hl, Data_015_4ABD                        ; $4B0C: $21 $BD $4A
    ld   c, $03                                   ; $4B0F: $0E $03
    call RenderActiveEntitySpritesRect            ; $4B11: $CD $E6 $3C

jr_015_4B14:
    jp   CopyEntityPositionToActivePosition       ; $4B14: $C3 $8A $3D

Data_015_4B17::
    db   $E8, $FE, $74, $00, $E8, $06, $74, $20, $F4, $01, $76, $00, $F4, $09, $76, $20
    db   $00, $00, $76, $00, $00, $08, $76, $20, $E8, $00, $74, $00, $E8, $08, $74, $20
    db   $F4, $00, $76, $00, $F4, $08, $76, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $E8, $02, $74, $00, $E8, $0A, $74, $20, $F4, $FF, $76, $00, $F4, $07, $76, $20
    db   $00, $00, $76, $00, $00, $08, $76, $20, $E8, $00, $74, $00, $E8, $08, $74, $20
    db   $F4, $00, $76, $00, $F4, $08, $76, $20, $00, $00, $76, $00, $00, $08, $76, $20

Data_015_4B77::
    db   $F4, $FF, $74, $00, $F4, $07, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $00, $74, $00, $F4, $08, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $01, $74, $00, $F4, $09, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $00, $74, $00, $F4, $08, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20

Data_015_4BB7::
    db   $00, $FF, $74, $00, $00, $07, $74, $20, $00, $00, $74, $00, $00, $08, $74, $20
    db   $00, $01, $74, $00, $00, $09, $74, $20, $00, $00, $74, $00, $00, $08, $74, $20

Data_015_4BD7::
    db   $FA, $FC

Data_015_4BD9::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

PokeyEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4BE1: $21 $B0 $C2
    add  hl, bc                                   ; $4BE4: $09
    ld   a, [hl]                                  ; $4BE5: $7E
    and  a                                        ; $4BE6: $A7
    jp   nz, label_015_4CD9                                ; $4BE7: $C2 $D9 $4C

    call func_015_4C85                            ; $4BEA: $CD $85 $4C
    call func_015_7B0D                            ; $4BED: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $4BF0: $21 $D0 $C3
    add  hl, bc                                   ; $4BF3: $09
    ld   a, [hl]                                  ; $4BF4: $7E
    cp   $02                                      ; $4BF5: $FE $02
    jr   nc, jr_015_4C49                          ; $4BF7: $30 $50

    ld   hl, wEntitiesHealthTable                 ; $4BF9: $21 $60 $C3
    add  hl, bc                                   ; $4BFC: $09
    ld   [hl], $02                                ; $4BFD: $36 $02
    ld   hl, wEntitiesFlashCountdownTable         ; $4BFF: $21 $20 $C4
    add  hl, bc                                   ; $4C02: $09
    ld   a, [hl]                                  ; $4C03: $7E
    cp   $14                                      ; $4C04: $FE $14
    jr   nz, jr_015_4C49                          ; $4C06: $20 $41

    dec  [hl]                                     ; $4C08: $35
    ld   hl, wEntitiesUnknowTableY                ; $4C09: $21 $D0 $C3
    add  hl, bc                                   ; $4C0C: $09
    inc  [hl]                                     ; $4C0D: $34

    ld   a, ENTITY_POKEY                          ; $4C0E: $3E $E3
    call SpawnNewEntity_trampoline                ; $4C10: $CD $86 $3B
    jr   c, jr_015_4C49                           ; $4C13: $38 $34

    ldh  a, [hMultiPurpose0]                      ; $4C15: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4C17: $21 $00 $C2
    add  hl, de                                   ; $4C1A: $19
    ld   [hl], a                                  ; $4C1B: $77
    ldh  a, [hMultiPurpose1]                      ; $4C1C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4C1E: $21 $10 $C2
    add  hl, de                                   ; $4C21: $19
    ld   [hl], a                                  ; $4C22: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4C23: $21 $B0 $C2
    add  hl, de                                   ; $4C26: $19
    inc  [hl]                                     ; $4C27: $34
    push bc                                       ; $4C28: $C5
    ld   c, e                                     ; $4C29: $4B
    ld   b, d                                     ; $4C2A: $42
    ld   a, $20                                   ; $4C2B: $3E $20
    call GetVectorTowardsLink_trampoline          ; $4C2D: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ; $4C30: $F0 $D8
    cpl                                           ; $4C32: $2F
    inc  a                                        ; $4C33: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $4C34: $21 $40 $C2
    add  hl, bc                                   ; $4C37: $09
    ld   [hl], a                                  ; $4C38: $77
    ldh  a, [hMultiPurpose0]                      ; $4C39: $F0 $D7
    cpl                                           ; $4C3B: $2F
    inc  a                                        ; $4C3C: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $4C3D: $21 $50 $C2
    add  hl, bc                                   ; $4C40: $09
    ld   [hl], a                                  ; $4C41: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4C42: $21 $E0 $C2
    add  hl, bc                                   ; $4C45: $09
    ld   [hl], $18                                ; $4C46: $36 $18
    pop  bc                                       ; $4C48: $C1

jr_015_4C49:
    call DecrementEntityIgnoreHitsCountdown       ; $4C49: $CD $56 $0C
    call label_3B39                               ; $4C4C: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $4C4F: $F0 $E7
    rra                                           ; $4C51: $1F
    rra                                           ; $4C52: $1F
    rra                                           ; $4C53: $1F
    nop                                           ; $4C54: $00
    and  $03                                      ; $4C55: $E6 $03
    call SetEntitySpriteVariant                   ; $4C57: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $4C5A: $CD $05 $0C
    jr   nz, jr_015_4C7F                          ; $4C5D: $20 $20

    call GetRandomByte                            ; $4C5F: $CD $0D $28
    and  $3F                                      ; $4C62: $E6 $3F
    add  $30                                      ; $4C64: $C6 $30
    ld   [hl], a                                  ; $4C66: $77
    and  $07                                      ; $4C67: $E6 $07
    ld   e, a                                     ; $4C69: $5F
    ld   d, b                                     ; $4C6A: $50
    ld   hl, Data_015_4BD9                        ; $4C6B: $21 $D9 $4B
    add  hl, de                                   ; $4C6E: $19
    ld   a, [hl]                                  ; $4C6F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4C70: $21 $40 $C2
    add  hl, bc                                   ; $4C73: $09
    ld   [hl], a                                  ; $4C74: $77
    ld   hl, Data_015_4BD7                        ; $4C75: $21 $D7 $4B
    add  hl, de                                   ; $4C78: $19
    ld   a, [hl]                                  ; $4C79: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4C7A: $21 $50 $C2
    add  hl, bc                                   ; $4C7D: $09
    ld   [hl], a                                  ; $4C7E: $77

jr_015_4C7F:
    call UpdateEntityPosWithSpeed_15              ; $4C7F: $CD $88 $7B
    jp   label_3B23                               ; $4C82: $C3 $23 $3B

func_015_4C85::
    ld   d, b                                     ; $4C85: $50
    ld   hl, wEntitiesUnknowTableY                ; $4C86: $21 $D0 $C3
    add  hl, bc                                   ; $4C89: $09
    ld   a, [hl]                                  ; $4C8A: $7E
    and  a                                        ; $4C8B: $A7
    jr   nz, jr_015_4CA9                          ; $4C8C: $20 $1B

    ldh  a, [hActiveEntitySpriteVariant]          ; $4C8E: $F0 $F1
    rla                                           ; $4C90: $17
    rla                                           ; $4C91: $17
    rla                                           ; $4C92: $17
    and  $F8                                      ; $4C93: $E6 $F8
    ld   e, a                                     ; $4C95: $5F
    rla                                           ; $4C96: $17
    and  $F0                                      ; $4C97: $E6 $F0
    add  e                                        ; $4C99: $83
    ld   e, a                                     ; $4C9A: $5F
    ld   hl, Data_015_4B17                        ; $4C9B: $21 $17 $4B
    add  hl, de                                   ; $4C9E: $19
    ld   c, $06                                   ; $4C9F: $0E $06
    call RenderActiveEntitySpritesRect            ; $4CA1: $CD $E6 $3C
    ld   a, $04                                   ; $4CA4: $3E $04
    jp   label_3DA0                               ; $4CA6: $C3 $A0 $3D

jr_015_4CA9:
    cp   $02                                      ; $4CA9: $FE $02
    jr   z, jr_015_4CC4                           ; $4CAB: $28 $17

    ldh  a, [hActiveEntitySpriteVariant]          ; $4CAD: $F0 $F1
    rla                                           ; $4CAF: $17
    rla                                           ; $4CB0: $17
    rla                                           ; $4CB1: $17
    rla                                           ; $4CB2: $17
    and  $F0                                      ; $4CB3: $E6 $F0
    ld   e, a                                     ; $4CB5: $5F
    ld   hl, Data_015_4B77                        ; $4CB6: $21 $77 $4B
    add  hl, de                                   ; $4CB9: $19
    ld   c, $04                                   ; $4CBA: $0E $04
    call RenderActiveEntitySpritesRect            ; $4CBC: $CD $E6 $3C
    ld   a, $02                                   ; $4CBF: $3E $02
    jp   label_3DA0                               ; $4CC1: $C3 $A0 $3D

jr_015_4CC4:
    ldh  a, [hActiveEntitySpriteVariant]          ; $4CC4: $F0 $F1
    rla                                           ; $4CC6: $17
    rla                                           ; $4CC7: $17
    rla                                           ; $4CC8: $17
    and  $F8                                      ; $4CC9: $E6 $F8
    ld   e, a                                     ; $4CCB: $5F
    ld   hl, Data_015_4BB7                        ; $4CCC: $21 $B7 $4B
    add  hl, de                                   ; $4CCF: $19
    ld   c, $02                                   ; $4CD0: $0E $02
    jp   RenderActiveEntitySpritesRect           ; $4CD2: $C3 $E6 $3C

Data_015_4CD5::
    db   $76, $00, $76, $20

label_015_4CD9:
    ld   de, Data_015_4CD5
    call RenderActiveEntitySpritesPair            ; $4CDC: $CD $C0 $3B
    call func_015_7B0D                            ; $4CDF: $CD $0D $7B
    call func_015_7B3E                            ; $4CE2: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4CE5: $CD $05 $0C
    jr   nz, jr_015_4CED                          ; $4CE8: $20 $03

    call label_3B39                               ; $4CEA: $CD $39 $3B

jr_015_4CED:
    call UpdateEntityPosWithSpeed_15              ; $4CED: $CD $88 $7B
    call label_3B23                               ; $4CF0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4CF3: $21 $A0 $C2
    add  hl, bc                                   ; $4CF6: $09
    ld   a, [hl]                                  ; $4CF7: $7E
    and  $03                                      ; $4CF8: $E6 $03
    jr   z, jr_015_4D03                           ; $4CFA: $28 $07

    ld   hl, wEntitiesSpeedXTable                 ; $4CFC: $21 $40 $C2
    call func_015_4D0F                            ; $4CFF: $CD $0F $4D
    ret  c                                        ; $4D02: $D8

jr_015_4D03:
    ld   hl, wEntitiesCollisionsTable             ; $4D03: $21 $A0 $C2
    add  hl, bc                                   ; $4D06: $09
    ld   a, [hl]                                  ; $4D07: $7E
    and  $0C                                      ; $4D08: $E6 $0C
    jr   z, jr_015_4D39                           ; $4D0A: $28 $2D

    ld   hl, wEntitiesSpeedYTable                 ; $4D0C: $21 $50 $C2

func_015_4D0F::
    add  hl, bc                                   ; $4D0F: $09
    ld   a, [hl]                                  ; $4D10: $7E
    cpl                                           ; $4D11: $2F
    inc  a                                        ; $4D12: $3C
    ld   [hl], a                                  ; $4D13: $77
    ld   a, JINGLE_BUMP                           ; $4D14: $3E $09
    ldh  [hJingle], a                             ; $4D16: $E0 $F2
    ld   hl, wEntitiesUnknowTableY                ; $4D18: $21 $D0 $C3
    add  hl, bc                                   ; $4D1B: $09
    ld   a, [hl]                                  ; $4D1C: $7E
    inc  a                                        ; $4D1D: $3C
    ld   [hl], a                                  ; $4D1E: $77
    cp   $03                                      ; $4D1F: $FE $03
    jr   c, jr_015_4D39                           ; $4D21: $38 $16

    ldh  a, [hActiveEntityPosX]                   ; $4D23: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4D25: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4D27: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4D29: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4D2B: $3E $02
    call AddTranscientVfx                         ; $4D2D: $CD $C7 $0C
    ld   a, JINGLE_POOF                           ; $4D30: $3E $2F
    ldh  [hJingle], a                             ; $4D32: $E0 $F2
    call ClearEntityStatus_15                        ; $4D34: $CD $31 $7C
    scf                                           ; $4D37: $37
    ret                                           ; $4D38: $C9

jr_015_4D39:
    and  a                                        ; $4D39: $A7
    ret                                           ; $4D3A: $C9

Data_015_4D3B::
    db   $70, $02, $70, $22, $72, $03, $72, $23

FlameShooterEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4D43: $21 $B0 $C2
    add  hl, bc                                   ; $4D46: $09
    ld   a, [hl]                                  ; $4D47: $7E
    and  a                                        ; $4D48: $A7
    jp   nz, label_015_4DB5                       ; $4D49: $C2 $B5 $4D

    ld   de, Data_015_4D3B                        ; $4D4C: $11 $3B $4D
    call RenderActiveEntitySpritesPair            ; $4D4F: $CD $C0 $3B
    call GetEntityPrivateCountdown1               ; $4D52: $CD $00 $0C
    ld   e, $00                                   ; $4D55: $1E $00
    and  a                                        ; $4D57: $A7
    jr   z, jr_015_4D5B                           ; $4D58: $28 $01

    inc  e                                        ; $4D5A: $1C

jr_015_4D5B:
    ld   a, e                                     ; $4D5B: $7B
    call SetEntitySpriteVariant                   ; $4D5C: $CD $0C $3B
    call func_015_7B0D                            ; $4D5F: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $4D62: $21 $D0 $C3
    add  hl, bc                                   ; $4D65: $09
    inc  [hl]                                     ; $4D66: $34
    ld   a, [hl]                                  ; $4D67: $7E
    and  $0F                                      ; $4D68: $E6 $0F
    jr   nz, jr_015_4D9C                          ; $4D6A: $20 $30

    call GetEntityPrivateCountdown1               ; $4D6C: $CD $00 $0C
    ld   [hl], $08                                ; $4D6F: $36 $08

    ld   a, ENTITY_FLAME_SHOOTER                  ; $4D71: $3E $E2
    call SpawnNewEntity_trampoline                ; $4D73: $CD $86 $3B
    ret  c                                        ; $4D76: $D8

    ld   a, $12                                   ; $4D77: $3E $12
    ldh  [hNoiseSfx], a                           ; $4D79: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $4D7B: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4D7D: $21 $00 $C2
    add  hl, de                                   ; $4D80: $19
    ld   [hl], a                                  ; $4D81: $77
    ldh  a, [hMultiPurpose1]                      ; $4D82: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4D84: $21 $10 $C2
    add  hl, de                                   ; $4D87: $19
    add  $04                                      ; $4D88: $C6 $04
    ld   [hl], a                                  ; $4D8A: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4D8B: $21 $B0 $C2
    add  hl, de                                   ; $4D8E: $19
    inc  [hl]                                     ; $4D8F: $34
    ld   hl, wEntitiesSpeedYTable                 ; $4D90: $21 $50 $C2
    add  hl, de                                   ; $4D93: $19
    ld   [hl], $10                                ; $4D94: $36 $10
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D96: $21 $E0 $C2
    add  hl, de                                   ; $4D99: $19
    ld   [hl], $30                                ; $4D9A: $36 $30

jr_015_4D9C:
    ret                                           ; $4D9C: $C9

Data_015_4D9D::
    db   $78, $02, $78, $22, $76, $02, $76, $22, $74, $02, $74, $22

Data_015_4DA9::
    db   $7A, $02, $7C, $02, $7C, $22, $7A, $22

Data_015_4DB1::
    db   $FC, $04

Data_015_4DB3::
    db   $F4, $0C

label_015_4DB5:
    cp   $02                                      ; $4DB5: $FE $02
    jp   z, label_015_4E62                        ; $4DB7: $CA $62 $4E

    ldh  a, [hFrameCounter]                       ; $4DBA: $F0 $E7
    rla                                           ; $4DBC: $17
    rla                                           ; $4DBD: $17
    and  OAMF_PAL1 ; $4DBE: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4DC0: $E0 $ED
    ld   de, Data_015_4D9D                        ; $4DC2: $11 $9D $4D
    call RenderActiveEntitySpritesPair            ; $4DC5: $CD $C0 $3B
    call func_015_7B0D                            ; $4DC8: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $4DCB: $CD $56 $0C
    call label_3B70                               ; $4DCE: $CD $70 $3B
    ld   a, [wInvincibilityCounter]               ; $4DD1: $FA $C7 $DB
    push af                                       ; $4DD4: $F5
    call CheckLinkCollisionWithEnemy_trampoline   ; $4DD5: $CD $5A $3B
    pop  af                                       ; $4DD8: $F1
    ld   e, a                                     ; $4DD9: $5F
    ld   a, [wInvincibilityCounter]               ; $4DDA: $FA $C7 $DB
    cp   e                                        ; $4DDD: $BB
    jr   z, jr_015_4DF2                           ; $4DDE: $28 $12

    cp   $20                                      ; $4DE0: $FE $20
    jr   c, jr_015_4DF2                           ; $4DE2: $38 $0E

    ld   a, $1F                                   ; $4DE4: $3E $1F
    ld   [wInvincibilityCounter], a               ; $4DE6: $EA $C7 $DB
    ld   a, $30                                   ; $4DE9: $3E $30
    call GetVectorTowardsLink_trampoline          ; $4DEB: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4DEE: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $4DF0: $E0 $9B

jr_015_4DF2:
    call UpdateEntityYPosWithSpeed_15             ; $4DF2: $CD $8B $7B
    ldh  a, [hActiveEntityState]                  ; $4DF5: $F0 $F0
    and  a                                        ; $4DF7: $A7
    jr   z, jr_015_4E49                           ; $4DF8: $28 $4F

    xor  a                                        ; $4DFA: $AF

jr_015_4DFB:
    ldh  [hMultiPurposeG], a                               ; $4DFB: $E0 $E8
    ld   a, ENTITY_FLAME_SHOOTER                  ; $4DFD: $3E $E2
    call SpawnNewEntity_trampoline                ; $4DFF: $CD $86 $3B
    jr   c, jr_015_4E46                           ; $4E02: $38 $42

    ld   hl, wEntitiesPrivateState1Table          ; $4E04: $21 $B0 $C2
    add  hl, de                                   ; $4E07: $19
    ld   [hl], $02                                ; $4E08: $36 $02
    push bc                                       ; $4E0A: $C5
    ldh  a, [hMultiPurposeG]                               ; $4E0B: $F0 $E8
    ld   c, a                                     ; $4E0D: $4F
    ld   hl, wEntitiesSpriteVariantTable          ; $4E0E: $21 $B0 $C3
    add  hl, de                                   ; $4E11: $19
    ld   [hl], a                                  ; $4E12: $77
    ld   hl, Data_015_4DB1                        ; $4E13: $21 $B1 $4D
    add  hl, bc                                   ; $4E16: $09
    ldh  a, [hMultiPurpose0]                      ; $4E17: $F0 $D7
    add  [hl]                                     ; $4E19: $86
    ld   hl, wEntitiesPosXTable                   ; $4E1A: $21 $00 $C2
    add  hl, de                                   ; $4E1D: $19
    ld   [hl], a                                  ; $4E1E: $77
    ld   hl, Data_015_4DB3                        ; $4E1F: $21 $B3 $4D
    add  hl, bc                                   ; $4E22: $09
    ld   a, [hl]                                  ; $4E23: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4E24: $21 $40 $C2
    add  hl, de                                   ; $4E27: $19
    ld   [hl], a                                  ; $4E28: $77
    ldh  a, [hMultiPurpose1]                      ; $4E29: $F0 $D8
    add  $00                                      ; $4E2B: $C6 $00
    ld   hl, wEntitiesPosYTable                   ; $4E2D: $21 $10 $C2
    add  hl, de                                   ; $4E30: $19
    ld   [hl], a                                  ; $4E31: $77
    ld   hl, wEntitiesSpeedYTable                 ; $4E32: $21 $50 $C2
    add  hl, de                                   ; $4E35: $19
    ld   [hl], $0C                                ; $4E36: $36 $0C
    ld   hl, wEntitiesTransitionCountdownTable    ; $4E38: $21 $E0 $C2
    add  hl, de                                   ; $4E3B: $19
    ld   [hl], $20                                ; $4E3C: $36 $20
    pop  bc                                       ; $4E3E: $C1
    ldh  a, [hMultiPurposeG]                               ; $4E3F: $F0 $E8
    inc  a                                        ; $4E41: $3C
    cp   $02                                      ; $4E42: $FE $02
    jr   c, jr_015_4DFB                           ; $4E44: $38 $B5

jr_015_4E46:
    jp   ClearEntityStatus_15               ; $4E46: $C3 $31 $7C

jr_015_4E49:
    call GetEntityTransitionCountdown             ; $4E49: $CD $05 $0C
    jp   z, ClearEntityStatus_15            ; $4E4C: $CA $31 $7C

    ld   hl, wEntitiesSpriteVariantTable          ; $4E4F: $21 $B0 $C3
    add  hl, bc                                   ; $4E52: $09
    cp   $10                                      ; $4E53: $FE $10
    jr   z, jr_015_4E5B                           ; $4E55: $28 $04

    cp   $20                                      ; $4E57: $FE $20
    jr   nz, jr_015_4E61                          ; $4E59: $20 $06

jr_015_4E5B:
    ld   a, [hl]                                  ; $4E5B: $7E
    cp   $02                                      ; $4E5C: $FE $02
    jr   z, jr_015_4E61                           ; $4E5E: $28 $01

    inc  [hl]                                     ; $4E60: $34

jr_015_4E61:
    ret                                           ; $4E61: $C9

label_015_4E62:
    ldh  a, [hFrameCounter]                       ; $4E62: $F0 $E7
    rla                                           ; $4E64: $17
    rla                                           ; $4E65: $17
    and  OAMF_PAL1 ; $4E66: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4E68: $E0 $ED
    ld   de, Data_015_4DA9                        ; $4E6A: $11 $A9 $4D
    call RenderActiveEntitySpritesPair            ; $4E6D: $CD $C0 $3B
    call func_015_7B0D                            ; $4E70: $CD $0D $7B
    call UpdateEntityPosWithSpeed_15              ; $4E73: $CD $88 $7B
    call GetEntityTransitionCountdown             ; $4E76: $CD $05 $0C
    jp   z, ClearEntityStatus_15            ; $4E79: $CA $31 $7C

    ret                                           ; $4E7C: $C9

Data_015_4E7D::
    db   $4A, $01, $4C, $01, $4C, $21, $4A, $21, $4E, $01, $4E, $21

Data_015_4E89::
    db   $00, $06, $FA, $FA, $06

Data_015_4E8E::
    db   $48, $01, $48, $61, $48, $41, $48, $21

StalfosEvasiveEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4E96: $21 $B0 $C2
    add  hl, bc                                   ; $4E99: $09
    ld   a, [hl]                                  ; $4E9A: $7E
    and  a                                        ; $4E9B: $A7
    jr   z, jr_015_4EEE                           ; $4E9C: $28 $50

    ld   de, Data_015_4E8E                        ; $4E9E: $11 $8E $4E
    call RenderActiveEntitySpritesPair            ; $4EA1: $CD $C0 $3B
    call func_015_7B0D                            ; $4EA4: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $4EA7: $F0 $E7
    rra                                           ; $4EA9: $1F
    rra                                           ; $4EAA: $1F
    rra                                           ; $4EAB: $1F
    and  $01                                      ; $4EAC: $E6 $01
    call SetEntitySpriteVariant                   ; $4EAE: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $4EB1: $CD $88 $7B
    call label_3B23                               ; $4EB4: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4EB7: $21 $A0 $C2
    add  hl, bc                                   ; $4EBA: $09
    ld   a, [hl]                                  ; $4EBB: $7E
    and  a                                        ; $4EBC: $A7
    jp   nz, label_015_4ECB                       ; $4EBD: $C2 $CB $4E

    call label_3B39                               ; $4EC0: $CD $39 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4EC3: $21 $10 $C4
    add  hl, bc                                   ; $4EC6: $09
    ld   a, [hl]                                  ; $4EC7: $7E
    and  a                                        ; $4EC8: $A7
    jr   z, jr_015_4EDF                           ; $4EC9: $28 $14

label_015_4ECB:
    ldh  a, [hActiveEntityPosX]                   ; $4ECB: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4ECD: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4ECF: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4ED1: $E0 $D8
    ld   a, JINGLE_SWORD_POKING                   ; $4ED3: $3E $07
    ldh  [hJingle], a                             ; $4ED5: $E0 $F2
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $4ED7: $3E $05
    call AddTranscientVfx                         ; $4ED9: $CD $C7 $0C
    jp   ClearEntityStatus_15               ; $4EDC: $C3 $31 $7C

jr_015_4EDF:
    ldh  a, [hActiveEntityPosX]                   ; $4EDF: $F0 $EE
    cp   $A8                                      ; $4EE1: $FE $A8
    jp   nc, ClearEntityStatus_15                       ; $4EE3: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $4EE6: $F0 $EC
    cp   $84                                      ; $4EE8: $FE $84
    jp   nc, ClearEntityStatus_15                       ; $4EEA: $D2 $31 $7C

    ret                                           ; $4EED: $C9

jr_015_4EEE:
    ld   de, Data_015_4E7D                        ; $4EEE: $11 $7D $4E
    call RenderActiveEntitySpritesPair            ; $4EF1: $CD $C0 $3B
    call func_015_7B0D                            ; $4EF4: $CD $0D $7B
    call func_015_7B3E                            ; $4EF7: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4EFA: $CD $05 $0C
    jr   nz, jr_015_4F02                          ; $4EFD: $20 $03

    call label_3B39                               ; $4EFF: $CD $39 $3B

jr_015_4F02:
    call GetEntityPrivateCountdown1               ; $4F02: $CD $00 $0C
    cp   $01                                      ; $4F05: $FE $01
    jr   nz, jr_015_4F50                          ; $4F07: $20 $47

    ldh  a, [hMapId]                              ; $4F09: $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ; $4F0B: $FE $03
    ret  c                                        ; $4F0D: $D8

    ld   a, ENTITY_STALFOS_EVASIVE                ; $4F0E: $3E $1E
    call SpawnNewEntity_trampoline                ; $4F10: $CD $86 $3B
    ret  c                                        ; $4F13: $D8

    ld   a, $0A                                   ; $4F14: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4F16: $E0 $F4
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4F18: $21 $10 $C4
    add  hl, de                                   ; $4F1B: $19
    ld   [hl], b                                  ; $4F1C: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4F1D: $21 $40 $C3
    add  hl, de                                   ; $4F20: $19
    set  6, [hl]                                  ; $4F21: $CB $F6
    set  4, [hl]                                  ; $4F23: $CB $E6
    ld   hl, wEntitiesOptions1Table               ; $4F25: $21 $30 $C4
    add  hl, de                                   ; $4F28: $19
    set  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl]                                  ; $4F29: $CB $CE
    set  4, [hl]                                  ; $4F2B: $CB $E6
    ldh  a, [hMultiPurpose0]                      ; $4F2D: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4F2F: $21 $00 $C2
    add  hl, de                                   ; $4F32: $19
    ld   [hl], a                                  ; $4F33: $77
    ldh  a, [hMultiPurpose1]                      ; $4F34: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4F36: $21 $10 $C2
    add  hl, de                                   ; $4F39: $19
    ld   [hl], a                                  ; $4F3A: $77
    ldh  a, [hMultiPurpose3]                      ; $4F3B: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $4F3D: $21 $10 $C3
    add  hl, de                                   ; $4F40: $19
    ld   [hl], a                                  ; $4F41: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4F42: $21 $B0 $C2
    add  hl, de                                   ; $4F45: $19
    inc  [hl]                                     ; $4F46: $34
    push bc                                       ; $4F47: $C5
    ld   c, e                                     ; $4F48: $4B
    ld   b, d                                     ; $4F49: $42
    ld   a, $18                                   ; $4F4A: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $4F4C: $CD $AA $3B
    pop  bc                                       ; $4F4F: $C1

jr_015_4F50:
    ld   hl, wEntitiesUnknowTableY                ; $4F50: $21 $D0 $C3
    add  hl, bc                                   ; $4F53: $09
    ld   a, [hl]                                  ; $4F54: $7E
    JP_TABLE                                      ; $4F55
._00 dw func_015_4F5A                             ; $4F56
._01 dw func_015_501A                             ; $4F58

func_015_4F5A::
    call UpdateEntityPosWithSpeed_15              ; $4F5A: $CD $88 $7B
    call label_3B23                               ; $4F5D: $CD $23 $3B
    ldh  a, [hJoypadState]                        ; $4F60: $F0 $CC
    and  J_A | J_B                                ; $4F62: $E6 $30
    jr   z, jr_015_4FAE                           ; $4F64: $28 $48

    call func_015_7BDB                            ; $4F66: $CD $DB $7B
    add  $24                                      ; $4F69: $C6 $24
    cp   $48                                      ; $4F6B: $FE $48
    jr   nc, jr_015_4FAE                          ; $4F6D: $30 $3F

    call func_015_7BEB                            ; $4F6F: $CD $EB $7B
    add  $24                                      ; $4F72: $C6 $24
    cp   $48                                      ; $4F74: $FE $48
    jr   nc, jr_015_4FAE                          ; $4F76: $30 $36

    call GetEntityTransitionCountdown             ; $4F78: $CD $05 $0C
    ld   [hl], $08                                ; $4F7B: $36 $08
    call GetEntityPrivateCountdown1               ; $4F7D: $CD $00 $0C
    ld   [hl], b                                  ; $4F80: $70
    ld   hl, wEntitiesUnknowTableY                ; $4F81: $21 $D0 $C3
    add  hl, bc                                   ; $4F84: $09
    inc  [hl]                                     ; $4F85: $34
    ld   hl, wEntitiesSpeedZTable                 ; $4F86: $21 $20 $C3
    add  hl, bc                                   ; $4F89: $09
    ld   [hl], $15                                ; $4F8A: $36 $15
    ld   a, JINGLE_JUMP                           ; $4F8C: $3E $24
    ldh  [hJingle], a                             ; $4F8E: $E0 $F2
    ld   a, $12                                   ; $4F90: $3E $12
    call GetVectorTowardsLink_trampoline          ; $4F92: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4F95: $F0 $D7
    cpl                                           ; $4F97: $2F
    inc  a                                        ; $4F98: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $4F99: $21 $50 $C2
    add  hl, bc                                   ; $4F9C: $09
    ld   [hl], a                                  ; $4F9D: $77
    ldh  a, [hMultiPurpose1]                      ; $4F9E: $F0 $D8
    cpl                                           ; $4FA0: $2F
    inc  a                                        ; $4FA1: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $4FA2: $21 $40 $C2
    add  hl, bc                                   ; $4FA5: $09
    ld   [hl], a                                  ; $4FA6: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $4FA7: $21 $B0 $C3
    add  hl, bc                                   ; $4FAA: $09
    ld   [hl], $02                                ; $4FAB: $36 $02
    ret                                           ; $4FAD: $C9

jr_015_4FAE:
    ld   hl, wEntitiesCollisionsTable             ; $4FAE: $21 $A0 $C2
    add  hl, bc                                   ; $4FB1: $09
    ld   a, [hl]                                  ; $4FB2: $7E
    and  $03                                      ; $4FB3: $E6 $03
    jr   nz, jr_015_4FC6                          ; $4FB5: $20 $0F

    ld   a, [hl]                                  ; $4FB7: $7E
    and  $0C                                      ; $4FB8: $E6 $0C
    jr   z, jr_015_4FCE                           ; $4FBA: $28 $12

    ld   hl, wEntitiesSpeedYTable                 ; $4FBC: $21 $50 $C2
    add  hl, bc                                   ; $4FBF: $09
    ld   a, [hl]                                  ; $4FC0: $7E
    xor  $F0                                      ; $4FC1: $EE $F0
    ld   [hl], a                                  ; $4FC3: $77
    jr   jr_015_4FCE                              ; $4FC4: $18 $08

jr_015_4FC6:
    ld   hl, wEntitiesSpeedXTable                 ; $4FC6: $21 $40 $C2
    add  hl, bc                                   ; $4FC9: $09
    ld   a, [hl]                                  ; $4FCA: $7E
    xor  $F0                                      ; $4FCB: $EE $F0
    ld   [hl], a                                  ; $4FCD: $77

jr_015_4FCE:
    ld   hl, wEntitiesStateTable                  ; $4FCE: $21 $90 $C2
    add  hl, bc                                   ; $4FD1: $09
    ld   a, [hl]                                  ; $4FD2: $7E
    and  a                                        ; $4FD3: $A7
    jr   nz, jr_015_4FDD                          ; $4FD4: $20 $07

    call GetRandomByte                            ; $4FD6: $CD $0D $28
    and  $2F                                      ; $4FD9: $E6 $2F
    jr   nz, jr_015_500A                          ; $4FDB: $20 $2D

jr_015_4FDD:
    xor  a                                        ; $4FDD: $AF
    ld   hl, wEntitiesSpeedYTable                 ; $4FDE: $21 $50 $C2
    add  hl, bc                                   ; $4FE1: $09
    ld   [hl], a                                  ; $4FE2: $77
    call GetRandomByte                            ; $4FE3: $CD $0D $28
    and  $03                                      ; $4FE6: $E6 $03
    ld   e, a                                     ; $4FE8: $5F
    ld   d, b                                     ; $4FE9: $50
    ld   hl, Data_015_4E89                        ; $4FEA: $21 $89 $4E
    add  hl, de                                   ; $4FED: $19
    ld   a, [hl]                                  ; $4FEE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4FEF: $21 $40 $C2
    add  hl, bc                                   ; $4FF2: $09
    ld   [hl], a                                  ; $4FF3: $77
    and  a                                        ; $4FF4: $A7
    jr   nz, jr_015_500A                          ; $4FF5: $20 $13

    call GetRandomByte                            ; $4FF7: $CD $0D $28
    and  $01                                      ; $4FFA: $E6 $01
    add  $03                                      ; $4FFC: $C6 $03
    ld   e, a                                     ; $4FFE: $5F
    ld   d, b                                     ; $4FFF: $50
    ld   hl, Data_015_4E89                        ; $5000: $21 $89 $4E
    add  hl, de                                   ; $5003: $19
    ld   a, [hl]                                  ; $5004: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5005: $21 $50 $C2
    add  hl, bc                                   ; $5008: $09
    ld   [hl], a                                  ; $5009: $77

jr_015_500A:
    ld   hl, wEntitiesStateTable                  ; $500A: $21 $90 $C2
    add  hl, bc                                   ; $500D: $09
    xor  a                                        ; $500E: $AF
    ld   [hl], a                                  ; $500F: $77
    ldh  a, [hFrameCounter]                       ; $5010: $F0 $E7
    rra                                           ; $5012: $1F
    rra                                           ; $5013: $1F
    rra                                           ; $5014: $1F
    and  $01                                      ; $5015: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5017: $C3 $0C $3B

func_015_501A::
    call UpdateEntityPosWithSpeed_15              ; $501A: $CD $88 $7B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $501D: $21 $10 $C4
    add  hl, bc                                   ; $5020: $09
    ld   a, [hl]                                  ; $5021: $7E
    push hl                                       ; $5022: $E5
    ld   [hl], $01                                ; $5023: $36 $01
    call label_3B23                               ; $5025: $CD $23 $3B
    pop  hl                                       ; $5028: $E1
    ld   [hl], b                                  ; $5029: $70
    call AddEntityZSpeedToPos_15                  ; $502A: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $502D: $21 $20 $C3
    add  hl, bc                                   ; $5030: $09
    dec  [hl]                                     ; $5031: $35
    ld   hl, wEntitiesPosZTable                   ; $5032: $21 $10 $C3
    add  hl, bc                                   ; $5035: $09
    ld   a, [hl]                                  ; $5036: $7E
    and  $80                                      ; $5037: $E6 $80
    jr   z, jr_015_5057                           ; $5039: $28 $1C

    ld   [hl], b                                  ; $503B: $70
    ld   hl, wEntitiesSpeedZTable                 ; $503C: $21 $20 $C3
    add  hl, bc                                   ; $503F: $09
    ld   [hl], b                                  ; $5040: $70
    ld   hl, wEntitiesSpeedYTable                 ; $5041: $21 $50 $C2
    add  hl, bc                                   ; $5044: $09
    ld   [hl], $08                                ; $5045: $36 $08
    ld   hl, wEntitiesSpeedXTable                 ; $5047: $21 $40 $C2
    add  hl, bc                                   ; $504A: $09
    ld   [hl], $08                                ; $504B: $36 $08
    ld   hl, wEntitiesUnknowTableY                ; $504D: $21 $D0 $C3
    add  hl, bc                                   ; $5050: $09
    ld   [hl], b                                  ; $5051: $70
    call GetEntityPrivateCountdown1               ; $5052: $CD $00 $0C
    ld   [hl], $10                                ; $5055: $36 $10

jr_015_5057:
    ret                                           ; $5057: $C9

Data_015_5058::
    db   $EA, $EB, $EA, $EB, $EC, $ED, $EE, $EF, $F0, $F1, $F2, $F3

func_015_5064::
    ld   a, [wFinalNightmareForm]                 ; $5064: $FA $19 $D2
    rla                                           ; $5067: $17
    and  $FE                                      ; $5068: $E6 $FE
    ld   e, a                                     ; $506A: $5F
    ld   d, b                                     ; $506B: $50
    ld   hl, Data_015_5058                        ; $506C: $21 $58 $50
    add  hl, de                                   ; $506F: $19
    ld   a, [hl+]                                 ; $5070: $2A
    ld   [wLoadedEntitySpritesheets+2], a                             ; $5071: $EA $95 $C1
    ld   a, [hl]                                  ; $5074: $7E
    ld   [wLoadedEntitySpritesheets+3], a                             ; $5075: $EA $96 $C1
    ld   a, TRUE                                  ; $5078: $3E $01
    ldh  [hNeedsUpdatingEntityTilesA], a         ; $507A: $E0 $91
    ld   [wNeedsUpdatingEntityTilesB], a              ; $507C: $EA $0E $C1
    ret                                           ; $507F: $C9

; Note: this entity, unlike most others, use all 4 spriteslots available.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
;
; It also switches out sprites even during the battle.
FinalNightmareEntityHandler::
    ld   a, [wRoomTransitionState]                ; $5080: $FA $24 $C1
    and  a                                        ; $5083: $A7
    jr   nz, jr_015_5093                          ; $5084: $20 $0D

    ld   a, [wC116]                               ; $5086: $FA $16 $C1
    and  a                                        ; $5089: $A7
    jr   nz, jr_015_5093                          ; $508A: $20 $07

    inc  a                                        ; $508C: $3C
    ld   [wC116], a                               ; $508D: $EA $16 $C1
    call func_015_5064                            ; $5090: $CD $64 $50

jr_015_5093:
    ld   hl, wEntitiesUnknowTableR                ; $5093: $21 $90 $C3
    add  hl, bc                                   ; $5096: $09
    ld   a, [hl]                                  ; $5097: $7E
    cp   $02                                      ; $5098: $FE $02
    jp   z, label_015_45CB                        ; $509A: $CA $CB $45

    and  a                                        ; $509D: $A7
    jp   nz, label_015_54D6                       ; $509E: $C2 $D6 $54

    ld   a, [wFinalNightmareForm]                               ; $50A1: $FA $19 $D2
    JP_TABLE                                      ; $50A4: $C7
._00 dw FinalNightmareForm1Handler
._01 dw FinalNightmareForm2Handler
._02 dw FinalNightmareForm3Handler
._03 dw FinalNightmareForm4Handler
._04 dw FinalNightmareForm5Handler
._05 dw FinalNightmareForm6Handler

FinalNightmareForm1Handler::
    ldh  a, [hActiveEntityState]                  ; $50B1: $F0 $F0
    JP_TABLE                                      ; $50B3
._00 dw func_015_50C2                             ; $50B4
._01 dw func_015_511D                             ; $50B6
._02 dw func_015_5138                             ; $50B8
._03 dw func_015_5153                             ; $50BA
._04 dw func_015_516E                             ; $50BC
._05 dw func_015_5191                             ; $50BE
._06 dw func_015_51B5                             ; $50C0

; Final boss dialog related
func_015_50C2::
    ld   a, [wIsLinkInTheAir]                     ; $50C2: $FA $46 $C1
    and  a                                        ; $50C5: $A7
    ret  nz                                       ; $50C6: $C0

IF __PATCH_0__
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    ret  nz
ENDC

    ld   a, MUSIC_FINAL_BOSS_DIALOG               ; $50C7: $3E $5D
    ld   [wMusicTrackToPlay], a                   ; $50C9: $EA $68 $D3
    ld   hl, wIndoorBRoomStatus + $74                                ; $50CC: $21 $74 $DA
    set  6, [hl]                                  ; $50CF: $CB $F6
    call_open_dialog $0F5                         ; $50D1
    call GetEntityTransitionCountdown             ; $50D6: $CD $05 $0C
    ld   [hl], $50                                ; $50D9: $36 $50
    ldh  a, [hLinkPositionX]                      ; $50DB: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $50DD: $21 $00 $C2
    add  hl, bc                                   ; $50E0: $09
    ld   [hl], a                                  ; $50E1: $77
    ld   e, $80                                   ; $50E2: $1E $80
    ld   hl, wIsFileSelectionArrowShifted         ; $50E4: $21 $00 $D0

jr_015_50E7:
    ld   [hl+], a                                 ; $50E7: $22
    dec  e                                        ; $50E8: $1D
    jr   nz, jr_015_50E7                          ; $50E9: $20 $FC

    ldh  a, [hLinkPositionY]                      ; $50EB: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $50ED: $21 $10 $C2
    add  hl, bc                                   ; $50F0: $09
    ld   [hl], a                                  ; $50F1: $77
    ld   e, $80                                   ; $50F2: $1E $80
    ld   hl, wD100                                ; $50F4: $21 $00 $D1

jr_015_50F7:
    ld   [hl+], a                                 ; $50F7: $22
    dec  e                                        ; $50F8: $1D
    jr   nz, jr_015_50F7                          ; $50F9: $20 $FC

    xor  a                                        ; $50FB: $AF
    ld   [wD21A], a                               ; $50FC: $EA $1A $D2
    ld   [wD21B], a                               ; $50FF: $EA $1B $D2
    ld   [wD21C], a                               ; $5102: $EA $1C $D2
    ld   [wD21D], a                               ; $5105: $EA $1D $D2
    ld   [wD21E], a                               ; $5108: $EA $1E $D2

jr_015_510B:
    ld   [wD21F], a                               ; $510B: $EA $1F $D2
    ld   [wD220], a                               ; $510E: $EA $20 $D2
    ld   [wD221], a                               ; $5111: $EA $21 $D2
    ld   [wD222], a                               ; $5114: $EA $22 $D2
    ld   [wD223], a                               ; $5117: $EA $23 $D2
    jp   IncrementEntityState                     ; $511A: $C3 $12 $3B

func_015_511D::
    call func_015_5631                            ; $511D: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5120: $CD $05 $0C
    jr   nz, jr_015_512D                          ; $5123: $20 $08

    call IncrementEntityState                     ; $5125: $CD $12 $3B

func_015_5128::
    ld   a, JINGLE_SHADOW_NEXT                    ; $5128: $3E $35
    ldh  [hJingle], a                             ; $512A: $E0 $F2
    ret                                           ; $512C: $C9

; Final boss music initalization???
jr_015_512D:
    cp   $30                                      ; $512D: $FE $30
    jr   nz, jr_015_5137                          ; $512F: $20 $06

    dec  [hl]                                     ; $5131: $35
    ld   a, MUSIC_FINAL_BOSS                      ; $5132: $3E $23
    ld   [wMusicTrackToPlay], a                   ; $5134: $EA $68 $D3

jr_015_5137:
    ret                                           ; $5137: $C9

func_015_5138::
    call func_015_5631                            ; $5138: $CD $31 $56
    call func_015_7B0D                            ; $513B: $CD $0D $7B
    ld   hl, wEntitiesSpeedYTable                 ; $513E: $21 $50 $C2
    add  hl, bc                                   ; $5141: $09
    dec  [hl]                                     ; $5142: $35
    ld   a, [hl]                                  ; $5143: $7E
    cp   $E8                                      ; $5144: $FE $E8
    jr   nz, jr_015_5150                          ; $5146: $20 $08

    call GetEntityTransitionCountdown             ; $5148: $CD $05 $0C
    ld   [hl], $08                                ; $514B: $36 $08
    call IncrementEntityState                     ; $514D: $CD $12 $3B

jr_015_5150:
    jp   UpdateEntityYPosWithSpeed_15             ; $5150: $C3 $8B $7B

func_015_5153::
    call func_015_5631                            ; $5153: $CD $31 $56
    call func_015_7B0D                            ; $5156: $CD $0D $7B
    call UpdateEntityYPosWithSpeed_15             ; $5159: $CD $8B $7B
    call GetEntityTransitionCountdown             ; $515C: $CD $05 $0C
    ret  nz                                       ; $515F: $C0

    ld   hl, wEntitiesSpeedYTable                 ; $5160: $21 $50 $C2
    add  hl, bc                                   ; $5163: $09
    inc  [hl]                                     ; $5164: $34
    ret  nz                                       ; $5165: $C0

    call GetEntityTransitionCountdown             ; $5166: $CD $05 $0C
    ld   [hl], $80                                ; $5169: $36 $80
    jp   IncrementEntityState                     ; $516B: $C3 $12 $3B

func_015_516E::
    call func_015_5631                            ; $516E: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5171: $CD $05 $0C
    jr   z, jr_015_5184                           ; $5174: $28 $0E

    and  $07                                      ; $5176: $E6 $07
    jr   nz, jr_015_5184                          ; $5178: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable          ; $517A: $21 $B0 $C3
    add  hl, bc                                   ; $517D: $09
    ld   a, [hl]                                  ; $517E: $7E
    cp   $05                                      ; $517F: $FE $05
    jr   z, jr_015_5185                           ; $5181: $28 $02

    inc  [hl]                                     ; $5183: $34

jr_015_5184:
    ret                                           ; $5184: $C9

jr_015_5185:
    call GetEntityTransitionCountdown             ; $5185: $CD $05 $0C
    ld   [hl], $C0                                ; $5188: $36 $C0
    jp   IncrementEntityState                     ; $518A: $C3 $12 $3B

Data_015_518D::
    db   $06, $05, $07, $05

func_015_5191::
    call func_015_569F                            ; $5191: $CD $9F $56
    ldh  a, [hFrameCounter]                       ; $5194: $F0 $E7
    rra                                           ; $5196: $1F
    rra                                           ; $5197: $1F
    rra                                           ; $5198: $1F
    rra                                           ; $5199: $1F
    and  $03                                      ; $519A: $E6 $03
    ld   e, a                                     ; $519C: $5F
    ld   d, b                                     ; $519D: $50
    ld   hl, Data_015_518D                        ; $519E: $21 $8D $51
    add  hl, de                                   ; $51A1: $19
    ld   a, [hl]                                  ; $51A2: $7E
    call SetEntitySpriteVariant                   ; $51A3: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $51A6: $CD $05 $0C
    ret  nz                                       ; $51A9: $C0

    ld   [hl], $2F                                ; $51AA: $36 $2F
    jp   IncrementEntityState                     ; $51AC: $C3 $12 $3B

Data_015_51AF::
    db   $08, $00, $01, $02, $03, $04

func_015_51B5::
    call func_015_569F                            ; $51B5: $CD $9F $56
    call GetEntityTransitionCountdown             ; $51B8: $CD $05 $0C
    jr   nz, jr_015_51D0                          ; $51BB: $20 $13

    ld   hl, wFinalNightmareForm                  ; $51BD: $21 $19 $D2
    inc  [hl]                                     ; $51C0: $34
    xor  a                                        ; $51C1: $AF
    call SetEntitySpriteVariant                   ; $51C2: $CD $0C $3B
    call IncrementEntityState                     ; $51C5: $CD $12 $3B
    ld   [hl], b                                  ; $51C8: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $51C9: $21 $40 $C3
    add  hl, bc                                   ; $51CC: $09
    res  7, [hl]                                  ; $51CD: $CB $BE
    ret                                           ; $51CF: $C9

jr_015_51D0:
    rra                                           ; $51D0: $1F
    rra                                           ; $51D1: $1F
    rra                                           ; $51D2: $1F
    and  $0F                                      ; $51D3: $E6 $0F
    ld   e, a                                     ; $51D5: $5F
    ld   d, b                                     ; $51D6: $50
    ld   hl, Data_015_51AF                        ; $51D7: $21 $AF $51
    add  hl, de                                   ; $51DA: $19
    ld   a, [hl]                                  ; $51DB: $7E
    jp   SetEntitySpriteVariant                   ; $51DC: $C3 $0C $3B

FinalNightmareForm2Handler::
    call func_015_572B                            ; $51DF: $CD $2B $57
    call func_015_7B0D                            ; $51E2: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $51E5: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $51E8: $F0 $F0
    JP_TABLE                                      ; $51EA
._00 dw func_015_51FF                             ; $51EB
._01 dw func_015_520C                             ; $51ED
._02 dw func_015_522C                             ; $51EF
._03 dw func_015_528A                             ; $51F1
._04 dw func_015_52AA                             ; $51F3
._05 dw func_015_52B6                             ; $51F5
._06 dw func_015_5370                             ; $51F7
._07 dw func_015_53E1                             ; $51F9
._08 dw func_015_5317                             ; $51FB
._09 dw func_015_5330                             ; $51FD

func_015_51FF::
    call GetEntityTransitionCountdown             ; $51FF: $CD $05 $0C
    ld   [hl], $80                                ; $5202: $36 $80
    ld   hl, wEntitiesUnknowTableY                ; $5204: $21 $D0 $C3
    add  hl, bc                                   ; $5207: $09
    ld   [hl], b                                  ; $5208: $70
    jp   IncrementEntityState                     ; $5209: $C3 $12 $3B

func_015_520C::
    call GetEntityTransitionCountdown             ; $520C: $CD $05 $0C
    ret  nz                                       ; $520F: $C0

    ldh  a, [hFrameCounter]                       ; $5210: $F0 $E7
    and  $07                                      ; $5212: $E6 $07
    ret  nz                                       ; $5214: $C0

    ld   hl, wEntitiesSpriteVariantTable          ; $5215: $21 $B0 $C3
    add  hl, bc                                   ; $5218: $09
    inc  [hl]                                     ; $5219: $34
    ld   a, [hl]                                  ; $521A: $7E
    cp   $03                                      ; $521B: $FE $03
    ret  nz                                       ; $521D: $C0

    ld   hl, wEntitiesSpeedZTable                 ; $521E: $21 $20 $C3
    add  hl, bc                                   ; $5221: $09
    ld   [hl], $28                                ; $5222: $36 $28
    ld   a, $08                                   ; $5224: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $5226: $CD $AA $3B
    jp   IncrementEntityState                     ; $5229: $C3 $12 $3B

func_015_522C::
    call func_015_5435                            ; $522C: $CD $35 $54
    call label_3B39                               ; $522F: $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ; $5232: $CD $88 $7B
    call label_3B23                               ; $5235: $CD $23 $3B
    call AddEntityZSpeedToPos_15                  ; $5238: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $523B: $21 $20 $C3
    add  hl, bc                                   ; $523E: $09
    dec  [hl]                                     ; $523F: $35
    dec  [hl]                                     ; $5240: $35
    ld   hl, wEntitiesPosZTable                   ; $5241: $21 $10 $C3
    add  hl, bc                                   ; $5244: $09
    ld   a, [hl]                                  ; $5245: $7E
    and  $80                                      ; $5246: $E6 $80
    jr   z, jr_015_527A                           ; $5248: $28 $30

    ld   [hl], b                                  ; $524A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $524B: $21 $20 $C3
    add  hl, bc                                   ; $524E: $09
    ld   [hl], b                                  ; $524F: $70
    ld   hl, wEntitiesUnknowTableY                ; $5250: $21 $D0 $C3
    add  hl, bc                                   ; $5253: $09
    ld   a, [hl]                                  ; $5254: $7E
    inc  a                                        ; $5255: $3C
    ld   [hl], a                                  ; $5256: $77
    and  $01                                      ; $5257: $E6 $01
    jr   nz, jr_015_526E                          ; $5259: $20 $13

    call GetRandomByte                            ; $525B: $CD $0D $28
    and  $01                                      ; $525E: $E6 $01
    jr   nz, jr_015_526E                          ; $5260: $20 $0C

    call GetEntityTransitionCountdown             ; $5262: $CD $05 $0C
    ld   [hl], $1F                                ; $5265: $36 $1F
    call IncrementEntityState                     ; $5267: $CD $12 $3B
    ld   [hl], $08                                ; $526A: $36 $08
    jr   jr_015_527A                              ; $526C: $18 $0C

jr_015_526E:
    ld   a, JINGLE_BIG_BUMP                       ; $526E: $3E $20
    ldh  [hJingle], a                             ; $5270: $E0 $F2
    call GetEntityTransitionCountdown             ; $5272: $CD $05 $0C
    ld   [hl], $30                                ; $5275: $36 $30
    call IncrementEntityState                     ; $5277: $CD $12 $3B

jr_015_527A:
    ld   e, $03                                   ; $527A: $1E $03
    ld   hl, wEntitiesPosZTable                   ; $527C: $21 $10 $C3
    add  hl, bc                                   ; $527F: $09
    ld   a, [hl]                                  ; $5280: $7E
    cp   $0C                                      ; $5281: $FE $0C
    jr   c, jr_015_5286                           ; $5283: $38 $01

    inc  e                                        ; $5285: $1C

jr_015_5286:
    ld   a, e                                     ; $5286: $7B
    jp   SetEntitySpriteVariant                   ; $5287: $C3 $0C $3B

func_015_528A::
    ld   a, $05                                   ; $528A: $3E $05
    call SetEntitySpriteVariant                   ; $528C: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $528F: $CD $05 $0C
    jr   nz, jr_015_52A4                          ; $5292: $20 $10

    ld   a, $0C                                   ; $5294: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $5296: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $5299: $21 $20 $C3
    add  hl, bc                                   ; $529C: $09
    ld   [hl], $20                                ; $529D: $36 $20
    call IncrementEntityState                     ; $529F: $CD $12 $3B
    dec  [hl]                                     ; $52A2: $35
    dec  [hl]                                     ; $52A3: $35

jr_015_52A4:
    call func_015_5435                            ; $52A4: $CD $35 $54
    jp   label_3B39                               ; $52A7: $C3 $39 $3B

func_015_52AA::
    call GetEntityTransitionCountdown             ; $52AA: $CD $05 $0C
    ret  nz                                       ; $52AD: $C0

    jp   label_015_5335                           ; $52AE: $C3 $35 $53

func_015_52B1::
    ld   a, $23                                   ; $52B1: $3E $23
    ldh  [hWaveSfx], a                            ; $52B3: $E0 $F3
    ret                                           ; $52B5: $C9

func_015_52B6::
    call GetEntityTransitionCountdown             ; $52B6: $CD $05 $0C
    jr   nz, jr_015_52FF                          ; $52B9: $20 $44

func_015_52BB::
    ld   a, [wFinalNightmareForm]                 ; $52BB: $FA $19 $D2
    inc  a                                        ; $52BE: $3C
    ld   [wFinalNightmareForm], a                 ; $52BF: $EA $19 $D2
    call func_015_5064                            ; $52C2: $CD $64 $50
    xor  a                                        ; $52C5: $AF
    ld   [wD221], a                               ; $52C6: $EA $21 $D2
    ld   [wD222], a                               ; $52C9: $EA $22 $D2
    ld   [wD223], a                               ; $52CC: $EA $23 $D2
    ld   [wD220], a                               ; $52CF: $EA $20 $D2
    ld   hl, wEntitiesPosZTable                   ; $52D2: $21 $10 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $52D7: $21 $40 $C3
    add  hl, bc                                   ; $52DA: $09
    ld   [hl], $C0                                ; $52DB: $36 $C0
    ld   a, $02                                   ; $52DD: $3E $02
    ld   [wEntityTilesSpriteslotIndexA], a        ; $52DF: $EA $97 $C1
    inc  a                                        ; $52E2: $3C
    ld   [wEntityTilesSpriteslotIndexB], a        ; $52E3: $EA $0D $C1
    ld   a, $FF                                   ; $52E6: $3E $FF
    call SetEntitySpriteVariant                   ; $52E8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $52EB: $CD $05 $0C
    ld   [hl], $40                                ; $52EE: $36 $40
    ld   hl, wEntitiesPrivateState1Table          ; $52F0: $21 $B0 $C2
    add  hl, bc                                   ; $52F3: $09
    ld   [hl], b                                  ; $52F4: $70
    call IncrementEntityState                     ; $52F5: $CD $12 $3B
    ld   [hl], b                                  ; $52F8: $70
    ld   a, $01                                   ; $52F9: $3E $01
    ld   [wD21A], a                               ; $52FB: $EA $1A $D2
    ret                                           ; $52FE: $C9

jr_015_52FF:
    cp   $18                                      ; $52FF: $FE $18
    ret  nc                                       ; $5301: $D0

    cp   $17                                      ; $5302: $FE $17
    jr   nz, jr_015_530B                          ; $5304: $20 $05

    ld   hl, hJingle                              ; $5306: $21 $F2 $FF
    ld   [hl], JINGLE_SHADOW_NEXT                 ; $5309: $36 $35

jr_015_530B:
    rra                                           ; $530B: $1F
    rra                                           ; $530C: $1F
    rra                                           ; $530D: $1F
    and  $03                                      ; $530E: $E6 $03
    jp   SetEntitySpriteVariant                   ; $5310: $C3 $0C $3B

Data_015_5313::
    db   $FF, $00, $01, $02

func_015_5317::
    call GetEntityTransitionCountdown             ; $5317: $CD $05 $0C
    jr   nz, jr_015_5321                          ; $531A: $20 $05

    ld   [hl], $80                                ; $531C: $36 $80
    jp   IncrementEntityState                     ; $531E: $C3 $12 $3B

jr_015_5321:
    rra                                           ; $5321: $1F
    rra                                           ; $5322: $1F
    rra                                           ; $5323: $1F
    and  $03                                      ; $5324: $E6 $03
    ld   e, a                                     ; $5326: $5F
    ld   d, b                                     ; $5327: $50
    ld   hl, Data_015_5313                        ; $5328: $21 $13 $53
    add  hl, de                                   ; $532B: $19
    ld   a, [hl]                                  ; $532C: $7E
    jp   SetEntitySpriteVariant                   ; $532D: $C3 $0C $3B

func_015_5330::
    call GetEntityTransitionCountdown             ; $5330: $CD $05 $0C
    jr   nz, jr_015_5355                          ; $5333: $20 $20

label_015_5335:
    call GetRandomByte                            ; $5335: $CD $0D $28
    and  $07                                      ; $5338: $E6 $07
    ld   e, a                                     ; $533A: $5F
    ld   d, b                                     ; $533B: $50
    ld   hl, Data_015_5911                        ; $533C: $21 $11 $59
    add  hl, de                                   ; $533F: $19
    ld   a, [hl]                                  ; $5340: $7E
    ld   hl, wEntitiesPosXTable                   ; $5341: $21 $00 $C2
    add  hl, bc                                   ; $5344: $09
    ld   [hl], a                                  ; $5345: $77
    ld   hl, Data_015_5919                        ; $5346: $21 $19 $59
    add  hl, de                                   ; $5349: $19
    ld   a, [hl]                                  ; $534A: $7E
    ld   hl, wEntitiesPosYTable                   ; $534B: $21 $10 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    call IncrementEntityState                     ; $5350: $CD $12 $3B
    ld   [hl], $01                                ; $5353: $36 $01

jr_015_5355:
    ret                                           ; $5355: $C9

Data_015_5356::
    db   $00, $00, $00, $00, $00, $00, $00, $00

Data_015_535E::
    db   $00, $00, $00, $00, $00, $00, $00, $00

Data_015_5366::
    db   $00, $18

Data_015_5368::
    db   $20, $18, $00, $E8, $E0, $E8, $00, $18

func_015_5370::
    ld   a, $FF                                   ; $5370: $3E $FF
    call SetEntitySpriteVariant                   ; $5372: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5375: $CD $05 $0C
    ld   [hl], $80                                ; $5378: $36 $80
    call IncrementEntityState                     ; $537A: $CD $12 $3B
    ld   [hl], $04                                ; $537D: $36 $04
    ld   a, $21                                   ; $537F: $3E $21
    ldh  [hWaveSfx], a                            ; $5381: $E0 $F3

func_015_5383::
    xor  a                                        ; $5383: $AF

jr_015_5384:
    ldh  [hMultiPurposeG], a                               ; $5384: $E0 $E8
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $5386: $3E $E6
    call SpawnNewEntity_trampoline                ; $5388: $CD $86 $3B
    ret  c                                        ; $538B: $D8

    push bc                                       ; $538C: $C5
    ldh  a, [hMultiPurposeG]                               ; $538D: $F0 $E8
    ld   c, a                                     ; $538F: $4F
    ldh  a, [hMultiPurpose0]                      ; $5390: $F0 $D7
    ld   hl, Data_015_5356                        ; $5392: $21 $56 $53
    add  hl, bc                                   ; $5395: $09
    add  [hl]                                     ; $5396: $86
    ld   hl, wEntitiesPosXTable                   ; $5397: $21 $00 $C2
    add  hl, de                                   ; $539A: $19
    ld   [hl], a                                  ; $539B: $77
    ldh  a, [hMultiPurpose1]                      ; $539C: $F0 $D8
    ld   hl, Data_015_535E                        ; $539E: $21 $5E $53
    add  hl, bc                                   ; $53A1: $09
    add  [hl]                                     ; $53A2: $86
    ld   hl, wEntitiesPosYTable                   ; $53A3: $21 $10 $C2
    add  hl, de                                   ; $53A6: $19
    ld   [hl], a                                  ; $53A7: $77
    ldh  a, [hMultiPurpose3]                      ; $53A8: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $53AA: $21 $10 $C3
    add  hl, de                                   ; $53AD: $19
    ld   [hl], a                                  ; $53AE: $77

jr_015_53AF:
    ld   hl, Data_015_5368                        ; $53AF: $21 $68 $53
    add  hl, bc                                   ; $53B2: $09
    ld   a, [hl]                                  ; $53B3: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $53B4: $21 $40 $C2
    add  hl, de                                   ; $53B7: $19
    ld   [hl], a                                  ; $53B8: $77
    ld   hl, Data_015_5366                        ; $53B9: $21 $66 $53
    add  hl, bc                                   ; $53BC: $09
    ld   a, [hl]                                  ; $53BD: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $53BE: $21 $50 $C2
    add  hl, de                                   ; $53C1: $19
    ld   [hl], a                                  ; $53C2: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $53C3: $21 $E0 $C2
    add  hl, de                                   ; $53C6: $19
    ld   [hl], $2F                                ; $53C7: $36 $2F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $53C9: $21 $40 $C3
    add  hl, de                                   ; $53CC: $19
    ld   [hl], $C2                                ; $53CD: $36 $C2
    ld   hl, wEntitiesUnknowTableR                ; $53CF: $21 $90 $C3
    add  hl, de                                   ; $53D2: $19
    inc  [hl]                                     ; $53D3: $34
    pop  bc                                       ; $53D4: $C1
    ldh  a, [hMultiPurposeG]                               ; $53D5: $F0 $E8
    inc  a                                        ; $53D7: $3C
    cp   $08                                      ; $53D8: $FE $08
    jr   nz, jr_015_5384                          ; $53DA: $20 $A8

    ret                                           ; $53DC: $C9

Data_015_53DD::
    db   $05, $03, $04, $03

func_015_53E1::
    call AddEntityZSpeedToPos_15                  ; $53E1: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $53E4: $21 $20 $C3
    add  hl, bc                                   ; $53E7: $09
    dec  [hl]                                     ; $53E8: $35
    dec  [hl]                                     ; $53E9: $35
    ld   hl, wEntitiesPosZTable                   ; $53EA: $21 $10 $C3
    add  hl, bc                                   ; $53ED: $09
    ld   a, [hl]                                  ; $53EE: $7E
    and  $80                                      ; $53EF: $E6 $80
    jr   z, jr_015_53F9                           ; $53F1: $28 $06

    ld   [hl], b                                  ; $53F3: $70
    ld   hl, wEntitiesSpeedZTable                 ; $53F4: $21 $20 $C3
    add  hl, bc                                   ; $53F7: $09
    ld   [hl], b                                  ; $53F8: $70

jr_015_53F9:
    call GetEntityTransitionCountdown             ; $53F9: $CD $05 $0C
    jr   z, jr_015_540E                           ; $53FC: $28 $10

    rra                                           ; $53FE: $1F
    nop                                           ; $53FF: $00
    nop                                           ; $5400: $00
    nop                                           ; $5401: $00
    and  $03                                      ; $5402: $E6 $03
    ld   e, a                                     ; $5404: $5F
    ld   d, b                                     ; $5405: $50
    ld   hl, Data_015_53DD                        ; $5406: $21 $DD $53
    add  hl, de                                   ; $5409: $19
    ld   a, [hl]                                  ; $540A: $7E
    jp   SetEntitySpriteVariant                   ; $540B: $C3 $0C $3B

jr_015_540E:
    ld   a, [wD220]                               ; $540E: $FA $20 $D2
    inc  a                                        ; $5411: $3C
    ld   [wD220], a                               ; $5412: $EA $20 $D2
    cp   $03                                      ; $5415: $FE $03
    jr   nc, jr_015_541F                          ; $5417: $30 $06

    call IncrementEntityState                     ; $5419: $CD $12 $3B
    ld   [hl], $02                                ; $541C: $36 $02
    ret                                           ; $541E: $C9

jr_015_541F:
    ld   a, $06                                   ; $541F: $3E $06
    call SetEntitySpriteVariant                   ; $5421: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5424: $CD $05 $0C
    ld   [hl], $80                                ; $5427: $36 $80
    call IncrementEntityState                     ; $5429: $CD $12 $3B
    ld   [hl], $05                                ; $542C: $36 $05

func_015_542E::
    ld   a, $37                                   ; $542E: $3E $37
    ldh  [hNoiseSfx], a                           ; $5430: $E0 $F4
    jp   func_015_5383                            ; $5432: $C3 $83 $53

func_015_5435::
    ld   a, [wHasToadstool]                       ; $5435: $FA $4B $DB
    and  a                                        ; $5438: $A7
    jr   z, jr_015_5465                           ; $5439: $28 $2A

    ld   a, [wBButtonSlot]                        ; $543B: $FA $00 $DB
    cp   INVENTORY_MAGIC_POWDER                   ; $543E: $FE $0C
    jr   nz, jr_015_5450                          ; $5440: $20 $0E

    ldh  a, [hJoypadState]                        ; $5442: $F0 $CC
    and  J_B                                      ; $5444: $E6 $20
    jr   z, jr_015_5465                           ; $5446: $28 $1D

    ld   a, $03                                   ; $5448: $3E $03
    ld   [wD220], a                               ; $544A: $EA $20 $D2
    jp   label_015_54A2                           ; $544D: $C3 $A2 $54

jr_015_5450:
    ld   a, [wAButtonSlot]                        ; $5450: $FA $01 $DB
    cp   $0C                                      ; $5453: $FE $0C
    jr   nz, jr_015_5465                          ; $5455: $20 $0E

    ldh  a, [hJoypadState]                        ; $5457: $F0 $CC
    and  J_A                                      ; $5459: $E6 $10
    jr   z, jr_015_5465                           ; $545B: $28 $08

    ld   a, $03                                   ; $545D: $3E $03
    ld   [wD220], a                               ; $545F: $EA $20 $D2
    jp   label_015_54A2                           ; $5462: $C3 $A2 $54

jr_015_5465:
    ld   e, $0F                                   ; $5465: $1E $0F
    ld   d, b                                     ; $5467: $50

jr_015_5468:
    ld   hl, wEntitiesStatusTable                 ; $5468: $21 $80 $C2
    add  hl, de                                   ; $546B: $19
    ld   a, [hl]                                  ; $546C: $7E
    cp   $05                                      ; $546D: $FE $05
    jr   nz, jr_015_54B7                          ; $546F: $20 $46

    ld   hl, wEntitiesTypeTable                   ; $5471: $21 $A0 $C3
    add  hl, de                                   ; $5474: $19
    ld   a, [hl]                                  ; $5475: $7E
    cp   $08                                      ; $5476: $FE $08
    jr   nz, jr_015_54B7                          ; $5478: $20 $3D

    ld   hl, wEntitiesTransitionCountdownTable    ; $547A: $21 $E0 $C2
    add  hl, de                                   ; $547D: $19
    ld   a, [hl]                                  ; $547E: $7E
    cp   $08                                      ; $547F: $FE $08
    jr   nz, jr_015_54B7                          ; $5481: $20 $34

    ld   hl, wEntitiesPosXTable                   ; $5483: $21 $00 $C2
    add  hl, de                                   ; $5486: $19
    ldh  a, [hActiveEntityPosX]                   ; $5487: $F0 $EE
    sub  [hl]                                     ; $5489: $96
    add  $0C                                      ; $548A: $C6 $0C
    cp   $18                                      ; $548C: $FE $18
    jr   nc, jr_015_54B7                          ; $548E: $30 $27

    ld   hl, wEntitiesPosYTable                   ; $5490: $21 $10 $C2
    add  hl, de                                   ; $5493: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5494: $F0 $EC
    sub  [hl]                                     ; $5496: $96
    add  $0C                                      ; $5497: $C6 $0C
    cp   $18                                      ; $5499: $FE $18
    jr   nc, jr_015_54B7                          ; $549B: $30 $1A

    call GetEntityTransitionCountdown             ; $549D: $CD $05 $0C
    ld   [hl], $80                                ; $54A0: $36 $80

label_015_54A2:
    ld   hl, wEntitiesFlashCountdownTable         ; $54A2: $21 $20 $C4
    add  hl, bc                                   ; $54A5: $09
    ld   [hl], $14                                ; $54A6: $36 $14
    ld   a, $07                                   ; $54A8: $3E $07
    ldh  [hWaveSfx], a                            ; $54AA: $E0 $F3
    ld   a, JINGLE_SHADOW_1_HURT                  ; $54AC: $3E $37
    ldh  [hJingle], a                             ; $54AE: $E0 $F2
    call IncrementEntityState                     ; $54B0: $CD $12 $3B
    ld   [hl], $07                                ; $54B3: $36 $07
    pop  af                                       ; $54B5: $F1
    ret                                           ; $54B6: $C9

jr_015_54B7:
    dec  e                                        ; $54B7: $1D
    ld   a, e                                     ; $54B8: $7B
    cp   $FF                                      ; $54B9: $FE $FF
    jr   nz, jr_015_5468                          ; $54BB: $20 $AB

    ret                                           ; $54BD: $C9

Data_015_54BE::
    db   $4E, $00, $4E, $20, $4C, $00, $4C, $20, $4A, $00, $4A, $20

Data_015_54CA::
    db   $02, $02, $02, $01, $01, $00

Data_015_54D0::
    db   $0F, $07, $03, $01, $00, $00

label_015_54D6:
    ld   de, Data_015_54BE                        ; $54D6: $11 $BE $54
    call RenderActiveEntitySpritesPair            ; $54D9: $CD $C0 $3B
    call func_015_7B0D                            ; $54DC: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $54DF: $CD $05 $0C
    jp   z, ClearEntityStatus_15            ; $54E2: $CA $31 $7C

    rra                                           ; $54E5: $1F
    rra                                           ; $54E6: $1F
    rra                                           ; $54E7: $1F
    and  $07                                      ; $54E8: $E6 $07
    ld   e, a                                     ; $54EA: $5F
    ld   d, b                                     ; $54EB: $50
    ld   hl, Data_015_54CA                        ; $54EC: $21 $CA $54
    add  hl, de                                   ; $54EF: $19
    push de                                       ; $54F0: $D5
    ld   a, [hl]                                  ; $54F1: $7E
    call SetEntitySpriteVariant                   ; $54F2: $CD $0C $3B
    pop  de                                       ; $54F5: $D1
    ld   hl, Data_015_54D0                        ; $54F6: $21 $D0 $54
    add  hl, de                                   ; $54F9: $19
    ldh  a, [hFrameCounter]                       ; $54FA: $F0 $E7
    and  [hl]                                     ; $54FC: $A6
    ret  nz                                       ; $54FD: $C0

    jp   UpdateEntityPosWithSpeed_15              ; $54FE: $C3 $88 $7B

Data_015_5501::
    db   $00, $00, $4C, $00, $00, $08, $4C, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60
    db   $F8, $F8, $7A, $00, $F8, $00, $7C, $00, $F8, $08, $7C, $20, $F8, $10, $7A, $20
    db   $08, $F8, $7A, $40, $08, $00, $7C, $40, $08, $08, $7C, $60, $08, $10, $7A, $60
    db   $F8, $F8, $76, $00, $F8, $00, $78, $00, $F8, $08, $78, $20, $F8, $10, $76, $20
    db   $08, $F8, $76, $40, $08, $00, $78, $40, $08, $08, $78, $60, $08, $10, $76, $60
    db   $F8, $F8, $72, $00, $F8, $00, $74, $00, $F8, $08, $74, $20, $F8, $10, $72, $20
    db   $08, $F8, $72, $40, $08, $00, $74, $40, $08, $08, $74, $60, $08, $10, $72, $60
    db   $F8, $F8, $66, $00, $F8, $00, $68, $00, $F8, $08, $68, $20, $F8, $10, $66, $20
    db   $08, $F8, $66, $40, $08, $00, $6A, $00, $08, $08, $6A, $20, $08, $10, $66, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $64, $00, $08, $08, $64, $20, $08, $10, $60, $60
    db   $F8, $F8, $6C, $00, $F8, $00, $6E, $00, $F8, $08, $6E, $20, $F8, $10, $6C, $20
    db   $08, $F8, $6C, $40, $08, $00, $70, $00, $08, $08, $70, $20, $08, $10, $6C, $60
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60

Data_015_5621::
    db   $4C, $00, $4C, $20

Data_015_5625::
    db   $48, $00, $48, $20

Data_015_5629::
    db   $28, $23, $1E, $19, $14, $0F, $0A, $05

func_015_5631::
    ld   hl, wEntitiesUnknowTableY                ; $5631: $21 $D0 $C3
    add  hl, bc                                   ; $5634: $09
    ld   a, [hl]                                  ; $5635: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $5636: $E0 $E9
    xor  a                                        ; $5638: $AF

jr_015_5639:
    ldh  [hMultiPurposeG], a                               ; $5639: $E0 $E8
    ld   e, a                                     ; $563B: $5F
    ld   d, b                                     ; $563C: $50
    ld   hl, Data_015_5629                        ; $563D: $21 $29 $56
    add  hl, de                                   ; $5640: $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $5641: $F0 $E9
    sub  [hl]                                     ; $5643: $96
    and  $7F                                      ; $5644: $E6 $7F
    ld   e, a                                     ; $5646: $5F
    ld   d, b                                     ; $5647: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5648: $21 $00 $D0
    add  hl, de                                   ; $564B: $19
    ld   a, [hl]                                  ; $564C: $7E
    ldh  [hActiveEntityPosX], a                   ; $564D: $E0 $EE
    ld   hl, wD100                                ; $564F: $21 $00 $D1

jr_015_5652:
    add  hl, de                                   ; $5652: $19
    ld   a, [hl]                                  ; $5653: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5654: $E0 $EC
    ld   de, Data_015_5625                        ; $5656: $11 $25 $56
    ldh  a, [hMultiPurposeG]                               ; $5659: $F0 $E8
    cp   $00                                      ; $565B: $FE $00
    jr   z, jr_015_566B                           ; $565D: $28 $0C

    ld   hl, wEntitiesPosYTable                   ; $565F: $21 $10 $C2
    add  hl, bc                                   ; $5662: $09
    ldh  a, [hActiveEntityVisualPosY]             ; $5663: $F0 $EC
    cp   [hl]                                     ; $5665: $BE
    jr   z, jr_015_5676                           ; $5666: $28 $0E

    ld   de, Data_015_5621                        ; $5668: $11 $21 $56

jr_015_566B:
    xor  a                                        ; $566B: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $566C: $E0 $F1

jr_015_566E:
    call RenderActiveEntitySpritesPair            ; $566E: $CD $C0 $3B
    ld   a, $02                                   ; $5671: $3E $02
    call label_3DA0                               ; $5673: $CD $A0 $3D

jr_015_5676:
    ldh  a, [hMultiPurposeG]                               ; $5676: $F0 $E8
    inc  a                                        ; $5678: $3C
    cp   $08                                      ; $5679: $FE $08
    jr   nz, jr_015_5639                          ; $567B: $20 $BC

    call CopyEntityPositionToActivePosition       ; $567D: $CD $8A $3D
    call func_015_569F                            ; $5680: $CD $9F $56
    call func_015_7B0D                            ; $5683: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $5686: $21 $D0 $C3
    add  hl, bc                                   ; $5689: $09
    ld   a, [hl]                                  ; $568A: $7E
    inc  [hl]                                     ; $568B: $34
    and  $7F                                      ; $568C: $E6 $7F
    ld   e, a                                     ; $568E: $5F
    ld   d, b                                     ; $568F: $50
    ldh  a, [hActiveEntityVisualPosY]             ; $5690: $F0 $EC
    ld   hl, wD100                                ; $5692: $21 $00 $D1
    add  hl, de                                   ; $5695: $19
    ld   [hl], a                                  ; $5696: $77
    ldh  a, [hActiveEntityPosX]                   ; $5697: $F0 $EE
    ld   hl, wIsFileSelectionArrowShifted         ; $5699: $21 $00 $D0
    add  hl, de                                   ; $569C: $19
    ld   [hl], a                                  ; $569D: $77
    ret                                           ; $569E: $C9

func_015_569F::
    ld   hl, wEntitiesSpriteVariantTable          ; $569F: $21 $B0 $C3
    add  hl, bc                                   ; $56A2: $09
    ld   a, [hl]                                  ; $56A3: $7E
    rla                                           ; $56A4: $17
    rla                                           ; $56A5: $17
    rla                                           ; $56A6: $17
    rla                                           ; $56A7: $17
    rla                                           ; $56A8: $17
    and  $E0                                      ; $56A9: $E6 $E0
    ld   e, a                                     ; $56AB: $5F
    ld   d, b                                     ; $56AC: $50
    ld   hl, Data_015_5501                        ; $56AD: $21 $01 $55
    add  hl, de                                   ; $56B0: $19
    ld   c, $08                                   ; $56B1: $0E $08
    call RenderActiveEntitySpritesRect            ; $56B3: $CD $E6 $3C
    ld   a, $08                                   ; $56B6: $3E $08
    jp   label_3DA0                               ; $56B8: $C3 $A0 $3D

Data_015_56BB::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $00, $00, $4C, $00, $00, $08, $4C, $20, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $00, $00, $FF, $00, $00, $00, $FF, $20
    db   $F0, $00, $5C, $00, $F0, $08, $5C, $20, $00, $00, $5E, $00, $00, $08, $5E, $20
    db   $F0, $00, $44, $00, $F0, $08, $44, $20, $00, $00, $44, $40, $00, $08, $44, $60
    db   $00, $FC, $40, $00, $00, $04, $42, $00, $00, $0C, $40, $20, $00, $00, $FF, $00
    db   $00, $00, $48, $00, $00, $08, $48, $20, $00, $00, $FF, $00, $00, $00, $FF, $20

func_015_572B::
    ldh  a, [hActiveEntitySpriteVariant]          ; $572B: $F0 $F1
    rla                                           ; $572D: $17
    rla                                           ; $572E: $17
    rla                                           ; $572F: $17
    rla                                           ; $5730: $17
    and  $F0                                      ; $5731: $E6 $F0
    ld   e, a                                     ; $5733: $5F
    ld   d, b                                     ; $5734: $50
    ld   hl, Data_015_56BB                        ; $5735: $21 $BB $56
    add  hl, de                                   ; $5738: $19
    ld   c, $04                                   ; $5739: $0E $04
    call RenderActiveEntitySpritesRect            ; $573B: $CD $E6 $3C
    ld   a, $04                                   ; $573E: $3E $04
    jp   label_3DA0                               ; $5740: $C3 $A0 $3D

FinalNightmareForm3Handler::
    ld   hl, wEntitiesUnknowTableP                ; $5743: $21 $40 $C4
    add  hl, bc                                   ; $5746: $09
    ld   a, [hl]                                  ; $5747: $7E
    cp   $02                                      ; $5748: $FE $02
    jp   z, label_015_5DD5                        ; $574A: $CA $D5 $5D

    and  a                                        ; $574D: $A7
    jp   nz, label_015_5DED                       ; $574E: $C2 $ED $5D

    ld   a, c                                     ; $5751: $79
    ld   [$D201], a                               ; $5752: $EA $01 $D2
    ld   a, [wD21A]                               ; $5755: $FA $1A $D2
    and  a                                        ; $5758: $A7
    jr   nz, jr_015_575E                          ; $5759: $20 $03

    call func_015_5A67                            ; $575B: $CD $67 $5A

jr_015_575E:
    call func_015_7B0D                            ; $575E: $CD $0D $7B
    call func_015_7B3E                            ; $5761: $CD $3E $7B
    ldh  a, [hActiveEntityState]                  ; $5764: $F0 $F0
    JP_TABLE                                      ; $5766
._00 dw func_015_577B                             ; $5767
._01 dw func_015_57CF                             ; $5769
._02 dw func_015_580B                             ; $576B
._03 dw func_015_5854                             ; $576D
._04 dw func_015_58ED                             ; $576F
._05 dw func_015_5926                             ; $5771
._06 dw func_015_5963                             ; $5773
._07 dw func_015_59B9                             ; $5775
._08 dw func_015_5A05                             ; $5777
._09 dw func_015_5A1F                             ; $5779

func_015_577B::
    xor  a                                        ; $577B: $AF
    call SetEntitySpriteVariant                   ; $577C: $CD $0C $3B
    call func_015_572B                            ; $577F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5782: $F0 $98
    push af                                       ; $5784: $F5
    ldh  a, [hLinkPositionY]                      ; $5785: $F0 $99
    push af                                       ; $5787: $F5
    ld   a, $50                                   ; $5788: $3E $50
    ldh  [hLinkPositionX], a                      ; $578A: $E0 $98
    ld   a, $30                                   ; $578C: $3E $30
    ldh  [hLinkPositionY], a                      ; $578E: $E0 $99
    ld   a, $10                                   ; $5790: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $5792: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5795: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $5798: $F0 $EC
    sub  [hl]                                     ; $579A: $96
    add  $03                                      ; $579B: $C6 $03
    cp   $06                                      ; $579D: $FE $06
    jr   nc, jr_015_57B7                          ; $579F: $30 $16

    ld   hl, hLinkPositionX                       ; $57A1: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $57A4: $F0 $EE
    sub  [hl]                                     ; $57A6: $96
    add  $03                                      ; $57A7: $C6 $03
    cp   $06                                      ; $57A9: $FE $06
    jr   nc, jr_015_57B7                          ; $57AB: $30 $0A

    call GetEntityTransitionCountdown             ; $57AD: $CD $05 $0C
    ld   [hl], $50                                ; $57B0: $36 $50
    call IncrementEntityState                     ; $57B2: $CD $12 $3B
    ld   [hl], $01                                ; $57B5: $36 $01

jr_015_57B7:
    pop  af                                       ; $57B7: $F1
    ldh  [hLinkPositionY], a                      ; $57B8: $E0 $99
    pop  af                                       ; $57BA: $F1
    ldh  [hLinkPositionX], a                      ; $57BB: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $57BD: $C3 $88 $7B

Data_015_57C0::
    db   $04, $03, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_57CF::
    call GetEntityTransitionCountdown             ; $57CF: $CD $05 $0C
    jr   z, jr_015_57E5                           ; $57D2: $28 $11

    rra                                           ; $57D4: $1F
    rra                                           ; $57D5: $1F
    rra                                           ; $57D6: $1F
    and  $0F                                      ; $57D7: $E6 $0F
    ld   e, a                                     ; $57D9: $5F
    ld   d, b                                     ; $57DA: $50
    ld   hl, Data_015_57C0                        ; $57DB: $21 $C0 $57
    add  hl, de                                   ; $57DE: $19
    ld   a, [hl]                                  ; $57DF: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $57E0: $E0 $F1
    jp   func_015_572B                            ; $57E2: $C3 $2B $57

jr_015_57E5:
    xor  a                                        ; $57E5: $AF
    ld   [wD21A], a                               ; $57E6: $EA $1A $D2
    call func_015_5819                            ; $57E9: $CD $19 $58
    ld   hl, wEntitiesPosYTable                   ; $57EC: $21 $10 $C2
    add  hl, bc                                   ; $57EF: $09
    ld   a, [hl]                                  ; $57F0: $7E
    sub  $08                                      ; $57F1: $D6 $08
    ld   [hl], a                                  ; $57F3: $77
    call GetEntityTransitionCountdown             ; $57F4: $CD $05 $0C
    ld   [hl], $40                                ; $57F7: $36 $40
    call IncrementEntityState                     ; $57F9: $CD $12 $3B
    ld   hl, wEntitiesUnknownTableD               ; $57FC: $21 $D0 $C2
    add  hl, bc                                   ; $57FF: $09
    ld   a, [hl]                                  ; $5800: $7E
    and  a                                        ; $5801: $A7
    ret  nz                                       ; $5802: $C0

    inc  [hl]                                     ; $5803: $34
    jp   func_015_52B1                            ; $5804: $C3 $B1 $52

Data_015_5807::
    db   $0F, $0A, $05, $00

func_015_580B::
    call GetEntityTransitionCountdown             ; $580B: $CD $05 $0C
    jr   nz, func_015_5819                        ; $580E: $20 $09

    ld   a, $22                                   ; $5810: $3E $22
    ldh  [hWaveSfx], a                            ; $5812: $E0 $F3
    ld   [hl], $C0                                ; $5814: $36 $C0
    jp   IncrementEntityState                     ; $5816: $C3 $12 $3B

func_015_5819::
    call func_015_7C0A                            ; $5819: $CD $0A $7C
    ld   a, e                                     ; $581C: $7B
    ld   [wD21E], a                               ; $581D: $EA $1E $D2
    ld   d, b                                     ; $5820: $50
    ld   hl, Data_015_5807                        ; $5821: $21 $07 $58
    add  hl, de                                   ; $5824: $19
    ld   a, [hl]                                  ; $5825: $7E
    ld   hl, wEntitiesDirectionTable              ; $5826: $21 $80 $C3
    add  hl, bc                                   ; $5829: $09
    ld   [hl], a                                  ; $582A: $77

label_015_582B:
    ld   hl, wEntitiesDirectionTable              ; $582B: $21 $80 $C3
    add  hl, bc                                   ; $582E: $09
    ld   a, [hl]                                  ; $582F: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $5830: $21 $B0 $C2
    add  hl, bc                                   ; $5833: $09
    add  [hl]                                     ; $5834: $86
    jp   SetEntitySpriteVariant                   ; $5835: $C3 $0C $3B

    nop                                           ; $5838: $00
    ld   bc, $0302                                ; $5839: $01 $02 $03

Data_015_583C::
    db   $03, $03, $03, $03, $02, $02, $02, $02, $01, $01, $01, $01, $00, $00, $00, $00

Data_015_584C::
    db   $18, $E8, $00, $00

Data_015_5850::
    db   $00, $00, $F0, $00

func_015_5854::
    call GetEntityTransitionCountdown             ; $5854: $CD $05 $0C
    jr   nz, jr_015_58C0                          ; $5857: $20 $67

    ld   [wD21D], a                               ; $5859: $EA $1D $D2
    ld   [hl], $50                                ; $585C: $36 $50
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $585E: $3E $E6
    call SpawnNewEntity_trampoline                ; $5860: $CD $86 $3B
    ld   hl, wEntitiesUnknowTableP                ; $5863: $21 $40 $C4
    add  hl, de                                   ; $5866: $19
    inc  [hl]                                     ; $5867: $34
    push bc                                       ; $5868: $C5
    ld   a, [wD21E]                               ; $5869: $FA $1E $D2
    ld   c, a                                     ; $586C: $4F
    ld   hl, Data_015_584C                        ; $586D: $21 $4C $58
    add  hl, bc                                   ; $5870: $09
    ldh  a, [hMultiPurpose0]                      ; $5871: $F0 $D7
    add  [hl]                                     ; $5873: $86
    ld   hl, wEntitiesPosXTable                   ; $5874: $21 $00 $C2
    add  hl, de                                   ; $5877: $19
    ld   [hl], a                                  ; $5878: $77
    ld   hl, Data_015_5850                        ; $5879: $21 $50 $58
    add  hl, bc                                   ; $587C: $09
    ldh  a, [hMultiPurpose1]                      ; $587D: $F0 $D8
    add  [hl]                                     ; $587F: $86
    ld   hl, wEntitiesPosYTable                   ; $5880: $21 $10 $C2
    add  hl, de                                   ; $5883: $19
    ld   [hl], a                                  ; $5884: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5885: $21 $40 $C3
    add  hl, de                                   ; $5888: $19
    ld   [hl], $42                                ; $5889: $36 $42
    ld   hl, wEntitiesHitboxFlagsTable            ; $588B: $21 $50 $C3
    add  hl, de                                   ; $588E: $19
    ld   [hl], d                                  ; $588F: $72
    ld   a, $38                                   ; $5890: $3E $38
    ldh  [hNoiseSfx], a                           ; $5892: $E0 $F4
    ld   a, [wD220]                               ; $5894: $FA $20 $D2
    cp   $02                                      ; $5897: $FE $02
    jr   c, jr_015_58B5                           ; $5899: $38 $1A

    ldh  a, [hLinkPositionX]                      ; $589B: $F0 $98
    ld   hl, hFrameCounter                        ; $589D: $21 $E7 $FF
    add  [hl]                                     ; $58A0: $86
    and  $01                                      ; $58A1: $E6 $01
    jr   nz, jr_015_58B5                          ; $58A3: $20 $10

    ld   hl, wEntitiesStateTable                  ; $58A5: $21 $90 $C2
    add  hl, de                                   ; $58A8: $19
    ld   [hl], $03                                ; $58A9: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $58AB: $21 $E0 $C2
    add  hl, de                                   ; $58AE: $19
    ld   [hl], $1C                                ; $58AF: $36 $1C
    ld   a, $39                                   ; $58B1: $3E $39
    ldh  [hNoiseSfx], a                           ; $58B3: $E0 $F4

jr_015_58B5:
    ld   c, e                                     ; $58B5: $4B
    ld   b, d                                     ; $58B6: $42
    ld   a, $18                                   ; $58B7: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $58B9: $CD $AA $3B
    pop  bc                                       ; $58BC: $C1
    jp   IncrementEntityState                     ; $58BD: $C3 $12 $3B

jr_015_58C0:
    rra                                           ; $58C0: $1F
    rra                                           ; $58C1: $1F
    rra                                           ; $58C2: $1F
    and  $03                                      ; $58C3: $E6 $03
    ld   hl, wEntitiesPrivateState1Table          ; $58C5: $21 $B0 $C2
    add  hl, bc                                   ; $58C8: $09
    ld   [hl], a                                  ; $58C9: $77
    call GetEntityTransitionCountdown             ; $58CA: $CD $05 $0C
    rra                                           ; $58CD: $1F
    rra                                           ; $58CE: $1F
    rra                                           ; $58CF: $1F
    rra                                           ; $58D0: $1F
    and  $0F                                      ; $58D1: $E6 $0F
    ld   e, a                                     ; $58D3: $5F
    ld   d, b                                     ; $58D4: $50
    ld   hl, Data_015_583C                        ; $58D5: $21 $3C $58
    add  hl, de                                   ; $58D8: $19
    ld   a, [hl]                                  ; $58D9: $7E
    ld   [wD21D], a                               ; $58DA: $EA $1D $D2
    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    cp   $40                                      ; $58E0: $FE $40
    jp   c, label_015_582B                        ; $58E2: $DA $2B $58

    and  $1F                                      ; $58E5: $E6 $1F
    jp   z, func_015_5819                         ; $58E7: $CA $19 $58

    jp   label_015_582B                           ; $58EA: $C3 $2B $58

func_015_58ED::
    call GetEntityTransitionCountdown             ; $58ED: $CD $05 $0C
    jr   nz, jr_015_5908                          ; $58F0: $20 $16

    ld   [hl], $27                                ; $58F2: $36 $27
    ld   a, JINGLE_SHADOW_NEXT                    ; $58F4: $3E $35
    ldh  [hJingle], a                             ; $58F6: $E0 $F2
    ld   hl, wEntitiesPosYTable                   ; $58F8: $21 $10 $C2
    add  hl, bc                                   ; $58FB: $09
    ld   a, [hl]                                  ; $58FC: $7E
    add  $08                                      ; $58FD: $C6 $08
    ld   [hl], a                                  ; $58FF: $77
    ld   a, $01                                   ; $5900: $3E $01
    ld   [wD21A], a                               ; $5902: $EA $1A $D2
    jp   IncrementEntityState                     ; $5905: $C3 $12 $3B

jr_015_5908:
    ld   hl, wEntitiesPrivateState1Table          ; $5908: $21 $B0 $C2
    add  hl, bc                                   ; $590B: $09
    ld   [hl], $04                                ; $590C: $36 $04
    jp   label_015_582B                           ; $590E: $C3 $2B $58

Data_015_5911::
    db   $50, $28, $78, $18, $88, $38, $68, $50

Data_015_5919::
    db   $30, $30, $30, $50, $50, $70, $70, $74

Data_015_5921::
    db   $00, $01, $02, $03, $04

func_015_5926::
    call GetEntityTransitionCountdown             ; $5926: $CD $05 $0C
    jr   nz, jr_015_594A                          ; $5929: $20 $1F

    call GetRandomByte                            ; $592B: $CD $0D $28
    and  $07                                      ; $592E: $E6 $07
    ld   e, a                                     ; $5930: $5F
    ld   d, b                                     ; $5931: $50
    ld   hl, Data_015_5911                        ; $5932: $21 $11 $59
    add  hl, de                                   ; $5935: $19
    ld   a, [hl]                                  ; $5936: $7E
    ld   [wD21B], a                               ; $5937: $EA $1B $D2
    ld   hl, Data_015_5919                        ; $593A: $21 $19 $59
    add  hl, de                                   ; $593D: $19
    ld   a, [hl]                                  ; $593E: $7E
    ld   [wD21C], a                               ; $593F: $EA $1C $D2
    call GetEntityTransitionCountdown             ; $5942: $CD $05 $0C
    ld   [hl], $1F                                ; $5945: $36 $1F
    jp   IncrementEntityState                     ; $5947: $C3 $12 $3B

jr_015_594A:
    rra                                           ; $594A: $1F

jr_015_594B:
    rra                                           ; $594B: $1F
    rra                                           ; $594C: $1F
    and  $0F                                      ; $594D: $E6 $0F
    ld   e, a                                     ; $594F: $5F
    ld   d, b                                     ; $5950: $50
    ld   hl, Data_015_5921                        ; $5951: $21 $21 $59
    add  hl, de                                   ; $5954: $19
    ld   a, [hl]                                  ; $5955: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $5956: $E0 $F1
    jp   func_015_572B                            ; $5958: $C3 $2B $57

Data_015_595B::
    db   $18, $14, $10, $0C, $08, $05, $02, $01

func_015_5963::
    xor  a                                        ; $5963: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $5964: $E0 $F1
    call func_015_572B                            ; $5966: $CD $2B $57
    ldh  a, [hLinkPositionY]                      ; $5969: $F0 $99
    push af                                       ; $596B: $F5
    ldh  a, [hLinkPositionX]                      ; $596C: $F0 $98
    push af                                       ; $596E: $F5
    ld   a, [wD21B]                               ; $596F: $FA $1B $D2
    ldh  [hLinkPositionX], a                      ; $5972: $E0 $98
    ld   a, [wD21C]                               ; $5974: $FA $1C $D2
    ldh  [hLinkPositionY], a                      ; $5977: $E0 $99
    call GetEntityTransitionCountdown             ; $5979: $CD $05 $0C
    rra                                           ; $597C: $1F
    rra                                           ; $597D: $1F
    and  $07                                      ; $597E: $E6 $07

jr_015_5980:
    ld   e, a                                     ; $5980: $5F
    ld   d, b                                     ; $5981: $50
    ld   hl, Data_015_595B                        ; $5982: $21 $5B $59
    add  hl, de                                   ; $5985: $19
    ld   a, [hl]                                  ; $5986: $7E
    call ApplyVectorTowardsLink_trampoline        ; $5987: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $598A: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $598D: $F0 $EC
    sub  [hl]                                     ; $598F: $96
    add  $03                                      ; $5990: $C6 $03
    cp   $06                                      ; $5992: $FE $06
    jr   nc, jr_015_59AC                          ; $5994: $30 $16

    ld   hl, hLinkPositionX                       ; $5996: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $5999: $F0 $EE
    sub  [hl]                                     ; $599B: $96
    add  $03                                      ; $599C: $C6 $03
    cp   $06                                      ; $599E: $FE $06
    jr   nc, jr_015_59AC                          ; $59A0: $30 $0A

    call GetEntityTransitionCountdown             ; $59A2: $CD $05 $0C
    ld   [hl], $50                                ; $59A5: $36 $50
    call IncrementEntityState                     ; $59A7: $CD $12 $3B
    ld   [hl], $01                                ; $59AA: $36 $01

jr_015_59AC:
    pop  af                                       ; $59AC: $F1
    ldh  [hLinkPositionX], a                      ; $59AD: $E0 $98
    pop  af                                       ; $59AF: $F1
    ldh  [hLinkPositionY], a                      ; $59B0: $E0 $99
    jp   UpdateEntityPosWithSpeed_15              ; $59B2: $C3 $88 $7B

Data_015_59B5::
    db   $00, $0A, $0F, $05

func_015_59B9::
    call GetEntityTransitionCountdown             ; $59B9: $CD $05 $0C
    jr   nz, jr_015_59D3                          ; $59BC: $20 $15

    call func_015_542E                            ; $59BE: $CD $2E $54
    ld   a, $01                                   ; $59C1: $3E $01
    ld   [wD21A], a                               ; $59C3: $EA $1A $D2
    ld   a, $06                                   ; $59C6: $3E $06
    call SetEntitySpriteVariant                   ; $59C8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $59CB: $CD $05 $0C
    ld   [hl], $50                                ; $59CE: $36 $50
    jp   IncrementEntityState                     ; $59D0: $C3 $12 $3B

jr_015_59D3:
    ld   a, [wD221]                               ; $59D3: $FA $21 $D2
    cp   $80                                      ; $59D6: $FE $80
    jr   nc, jr_015_59DE                          ; $59D8: $30 $04

    inc  a                                        ; $59DA: $3C
    ld   [wD221], a                               ; $59DB: $EA $21 $D2

jr_015_59DE:
    ld   a, [wD221]                               ; $59DE: $FA $21 $D2
    ld   hl, wD222                                ; $59E1: $21 $22 $D2
    add  [hl]                                     ; $59E4: $86
    ld   [hl], a                                  ; $59E5: $77
    jr   nc, jr_015_59EC                          ; $59E6: $30 $04

    ld   hl, wD223                                ; $59E8: $21 $23 $D2
    inc  [hl]                                     ; $59EB: $34

jr_015_59EC:
    ld   a, [wD223]                               ; $59EC: $FA $23 $D2
    and  $03                                      ; $59EF: $E6 $03
    ld   e, a                                     ; $59F1: $5F
    ld   d, b                                     ; $59F2: $50
    ld   hl, Data_015_59B5                        ; $59F3: $21 $B5 $59
    add  hl, de                                   ; $59F6: $19
    ld   a, [hl]                                  ; $59F7: $7E
    ld   hl, wEntitiesDirectionTable              ; $59F8: $21 $80 $C3
    add  hl, bc                                   ; $59FB: $09
    ld   [hl], a                                  ; $59FC: $77
    ld   hl, wEntitiesPrivateState1Table          ; $59FD: $21 $B0 $C2
    add  hl, bc                                   ; $5A00: $09
    ld   [hl], b                                  ; $5A01: $70
    jp   label_015_582B                           ; $5A02: $C3 $2B $58

func_015_5A05::
    call GetEntityTransitionCountdown             ; $5A05: $CD $05 $0C
    jr   nz, jr_015_5A10                          ; $5A08: $20 $06

    call func_015_5128                            ; $5A0A: $CD $28 $51
    jp   IncrementEntityState                     ; $5A0D: $C3 $12 $3B

jr_015_5A10:
    cp   $18                                      ; $5A10: $FE $18
    jr   nc, jr_015_5A1C                          ; $5A12: $30 $08

    rra                                           ; $5A14: $1F
    rra                                           ; $5A15: $1F
    rra                                           ; $5A16: $1F
    and  $03                                      ; $5A17: $E6 $03
    call SetEntitySpriteVariant                   ; $5A19: $CD $0C $3B

jr_015_5A1C:
    jp   func_015_572B                            ; $5A1C: $C3 $2B $57

func_015_5A1F::
    call func_015_572B                            ; $5A1F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5A22: $F0 $98
    push af                                       ; $5A24: $F5
    ldh  a, [hLinkPositionY]                      ; $5A25: $F0 $99
    push af                                       ; $5A27: $F5
    ld   a, $50                                   ; $5A28: $3E $50
    ldh  [hLinkPositionX], a                      ; $5A2A: $E0 $98
    ld   a, $30                                   ; $5A2C: $3E $30
    ldh  [hLinkPositionY], a                      ; $5A2E: $E0 $99
    ld   a, $10                                   ; $5A30: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $5A32: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5A35: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $5A38: $F0 $EC
    sub  [hl]                                     ; $5A3A: $96
    add  $03                                      ; $5A3B: $C6 $03
    cp   $06                                      ; $5A3D: $FE $06
    jr   nc, jr_015_5A5E                          ; $5A3F: $30 $1D

    ld   hl, hLinkPositionX                       ; $5A41: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $5A44: $F0 $EE
    sub  [hl]                                     ; $5A46: $96
    add  $03                                      ; $5A47: $C6 $03
    cp   $06                                      ; $5A49: $FE $06
    jr   nc, jr_015_5A5E                          ; $5A4B: $30 $11

    call func_015_52BB                            ; $5A4D: $CD $BB $52
    call GetEntityTransitionCountdown             ; $5A50: $CD $05 $0C
    ld   [hl], $31                                ; $5A53: $36 $31
    ld   hl, wEntitiesHealthTable                 ; $5A55: $21 $60 $C3
    add  hl, bc                                   ; $5A58: $09
    ld   [hl], $FF                                ; $5A59: $36 $FF
    call func_015_5F9A                            ; $5A5B: $CD $9A $5F

jr_015_5A5E:
    pop  af                                       ; $5A5E: $F1
    ldh  [hLinkPositionY], a                      ; $5A5F: $E0 $99
    pop  af                                       ; $5A61: $F1
    ldh  [hLinkPositionX], a                      ; $5A62: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $5A64: $C3 $88 $7B

func_015_5A67::
    call func_015_5D8D                            ; $5A67: $CD $8D $5D
    call func_015_5B2C                            ; $5A6A: $CD $2C $5B
    call func_015_5B0B                            ; $5A6D: $CD $0B $5B
    jp   label_015_5D48                           ; $5A70: $C3 $48 $5D

Data_015_5A73::
    db   $6A, $00, $6C, $00, $6C, $20, $6A, $20, $6A, $00, $FF, $FF, $6A, $20, $FF, $FF

Data_015_5A83::
    db   $00, $00, $6A, $00, $08, $08, $7A, $00, $08, $00, $7A, $20, $00, $08, $6A, $20

Data_015_5A93::
    db   $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $04, $04, $04, $04, $04, $05
    db   $05, $05, $05, $05

Data_015_5AA7::
    db   $F0, $F3, $F3, $F0, $F5, $F0, $F3, $F3, $F0, $F5, $F1, $F0, $F1, $F2, $F0, $0F
    db   $10, $0F, $0E, $10

Data_015_5ABB::
    db   $ED, $ED, $F1, $F1, $FD, $ED, $ED, $F1, $F1, $FD, $F4, $F6, $F7, $F6, $F8, $F4
    db   $F6, $F7, $F6, $F8

Data_015_5ACF::
    db   $01, $01, $01, $01, $03, $01, $01, $01, $01, $03, $02, $02, $02, $02, $02, $03
    db   $03, $03, $03, $03

Data_015_5AE3::
    db   $10, $0D, $0D, $10, $13, $10, $0D, $0D, $10, $13, $F5, $F6, $F5, $F4, $F3, $13
    db   $12, $13, $14, $15

Data_015_5AF7::
    db   $ED, $ED, $F1, $F1, $FD, $ED, $ED, $F1, $F1, $FD, $EB, $EC, $ED, $EC, $F2, $EB
    db   $EC, $ED, $EC, $F2

func_015_5B0B::
    ld   hl, wEntitiesSpriteVariantTable          ; $5B0B: $21 $B0 $C3
    add  hl, bc                                   ; $5B0E: $09
    ld   a, [hl]                                  ; $5B0F: $7E
    ld   e, a                                     ; $5B10: $5F
    ld   d, b                                     ; $5B11: $50
    ld   hl, Data_015_5AE3                        ; $5B12: $21 $E3 $5A
    add  hl, de                                   ; $5B15: $19
    ldh  a, [hActiveEntityPosX]                   ; $5B16: $F0 $EE
    add  [hl]                                     ; $5B18: $86
    ldh  [hActiveEntityPosX], a                   ; $5B19: $E0 $EE
    ld   hl, Data_015_5AF7                        ; $5B1B: $21 $F7 $5A
    add  hl, de                                   ; $5B1E: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5B1F: $F0 $EC
    add  $08                                      ; $5B21: $C6 $08
    add  [hl]                                     ; $5B23: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5B24: $E0 $EC
    ld   hl, Data_015_5ACF                        ; $5B26: $21 $CF $5A
    add  hl, de                                   ; $5B29: $19
    jr   jr_015_5B4B                              ; $5B2A: $18 $1F

func_015_5B2C::
    ld   hl, wEntitiesSpriteVariantTable          ; $5B2C: $21 $B0 $C3
    add  hl, bc                                   ; $5B2F: $09
    ld   a, [hl]                                  ; $5B30: $7E
    ld   e, a                                     ; $5B31: $5F
    ld   d, b                                     ; $5B32: $50
    ld   hl, Data_015_5AA7                        ; $5B33: $21 $A7 $5A
    add  hl, de                                   ; $5B36: $19
    ldh  a, [hActiveEntityPosX]                   ; $5B37: $F0 $EE
    add  [hl]                                     ; $5B39: $86
    ldh  [hActiveEntityPosX], a                   ; $5B3A: $E0 $EE
    ld   hl, Data_015_5ABB                        ; $5B3C: $21 $BB $5A
    add  hl, de                                   ; $5B3F: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5B40: $F0 $EC
    add  $08                                      ; $5B42: $C6 $08
    add  [hl]                                     ; $5B44: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5B45: $E0 $EC
    ld   hl, Data_015_5A93                        ; $5B47: $21 $93 $5A
    add  hl, de                                   ; $5B4A: $19

jr_015_5B4B:
    ld   a, [hl]                                  ; $5B4B: $7E
    cp   $04                                      ; $5B4C: $FE $04
    jr   nc, jr_015_5B5A                          ; $5B4E: $30 $0A

    ldh  [hActiveEntitySpriteVariant], a          ; $5B50: $E0 $F1
    ld   de, Data_015_5A73                        ; $5B52: $11 $73 $5A
    call RenderActiveEntitySpritesPair            ; $5B55: $CD $C0 $3B
    jr   jr_015_5B6C                              ; $5B58: $18 $12

jr_015_5B5A:
    sub  $04                                      ; $5B5A: $D6 $04
    rla                                           ; $5B5C: $17
    rla                                           ; $5B5D: $17
    rla                                           ; $5B5E: $17
    and  $F8                                      ; $5B5F: $E6 $F8
    ld   e, a                                     ; $5B61: $5F
    ld   d, b                                     ; $5B62: $50
    ld   hl, Data_015_5A83                        ; $5B63: $21 $83 $5A
    add  hl, de                                   ; $5B66: $19
    ld   c, $02                                   ; $5B67: $0E $02
    call RenderActiveEntitySpritesRect            ; $5B69: $CD $E6 $3C

jr_015_5B6C:
    ld   a, $02                                   ; $5B6C: $3E $02
    call label_3DA0                               ; $5B6E: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5B71: $C3 $8A $3D

Data_015_5B74::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $05, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $05, $10, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $05, $F9, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $05, $0F, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $06, $F9, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $06, $0F, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $06, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $06, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $62, $00, $FA, $08, $62, $20, $FA, $10, $60, $20
    db   $08, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $08, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $05, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $05, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $05, $F9, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $05, $0F, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $06, $F9, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $06, $0F, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $06, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $06, $10, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $66, $00, $F8, $08, $66, $20, $F8, $10, $60, $20
    db   $04, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $04, $10, $6E, $20
    db   $F8, $FC, $72, $00, $F8, $04, $74, $00, $08, $00, $76, $00, $08, $08, $78, $00
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FA, $FB, $72, $00, $FA, $03, $74, $00, $08, $00, $76, $00, $08, $08, $78, $00
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $04, $74, $20, $F8, $0C, $72, $20, $08, $00, $78, $20, $08, $08, $76, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FA, $05, $74, $20, $FA, $0D, $72, $20, $08, $00, $78, $20, $08, $08, $76, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Data_015_5D34::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0A, $0A, $0A, $0B, $0C
    db   $0C, $0C, $0C, $0D

label_015_5D48:
    ld   hl, wEntitiesSpriteVariantTable          ; $5D48: $21 $B0 $C3
    add  hl, bc                                   ; $5D4B: $09
    ld   a, [hl]                                  ; $5D4C: $7E
    ld   e, a                                     ; $5D4D: $5F
    ld   d, b                                     ; $5D4E: $50
    ld   hl, Data_015_5D34                        ; $5D4F: $21 $34 $5D
    add  hl, de                                   ; $5D52: $19
    ld   a, [hl]                                  ; $5D53: $7E
    ld   d, $00                                   ; $5D54: $16 $00
    ld   e, a                                     ; $5D56: $5F
    sla  e                                        ; $5D57: $CB $23
    rl   d                                        ; $5D59: $CB $12
    sla  e                                        ; $5D5B: $CB $23
    rl   d                                        ; $5D5D: $CB $12
    sla  e                                        ; $5D5F: $CB $23
    rl   d                                        ; $5D61: $CB $12
    sla  e                                        ; $5D63: $CB $23
    rl   d                                        ; $5D65: $CB $12
    sla  e                                        ; $5D67: $CB $23
    rl   d                                        ; $5D69: $CB $12
    ld   hl, Data_015_5B74                        ; $5D6B: $21 $74 $5B
    add  hl, de                                   ; $5D6E: $19
    ld   c, $08                                   ; $5D6F: $0E $08
    call RenderActiveEntitySpritesRect            ; $5D71: $CD $E6 $3C
    ld   a, $08                                   ; $5D74: $3E $08
    jp   label_3DA0                               ; $5D76: $C3 $A0 $3D

Data_015_5D79::
    db   $1E, $00, $1E, $60, $7C, $00, $7C, $20, $7E, $00, $7E, $20

Data_015_5D85::
    db   $14, $EC, $00, $00

Data_015_5D89::
    db   $00, $00, $F0, $04

func_015_5D8D::
    ldh  a, [hActiveEntityFlipAttribute]          ; $5D8D: $F0 $ED
    push af                                       ; $5D8F: $F5
    call func_015_5D97                            ; $5D90: $CD $97 $5D
    pop  af                                       ; $5D93: $F1
    ldh  [hActiveEntityFlipAttribute], a          ; $5D94: $E0 $ED
    ret                                           ; $5D96: $C9

func_015_5D97::
    ld   a, [wD21D]                               ; $5D97: $FA $1D $D2

jr_015_5D9A:
    and  a                                        ; $5D9A: $A7
    ret  z                                        ; $5D9B: $C8

    dec  a                                        ; $5D9C: $3D
    ldh  [hActiveEntitySpriteVariant], a          ; $5D9D: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $5D9F: $F0 $E7
    rla                                           ; $5DA1: $17
    rla                                           ; $5DA2: $17
    rla                                           ; $5DA3: $17
    and  $50                                      ; $5DA4: $E6 $50
    ldh  [hActiveEntityFlipAttribute], a          ; $5DA6: $E0 $ED
    ld   a, [wD21E]                               ; $5DA8: $FA $1E $D2
    ld   e, a                                     ; $5DAB: $5F
    ld   d, b                                     ; $5DAC: $50
    ld   hl, Data_015_5D85                        ; $5DAD: $21 $85 $5D
    add  hl, de                                   ; $5DB0: $19
    ldh  a, [hActiveEntityPosX]                   ; $5DB1: $F0 $EE
    add  [hl]                                     ; $5DB3: $86
    ldh  [hActiveEntityPosX], a                   ; $5DB4: $E0 $EE
    ld   hl, Data_015_5D89                        ; $5DB6: $21 $89 $5D
    add  hl, de                                   ; $5DB9: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5DBA: $F0 $EC
    add  [hl]                                     ; $5DBC: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5DBD: $E0 $EC
    ld   de, Data_015_5D79                        ; $5DBF: $11 $79 $5D
    call RenderActiveEntitySpritesPair            ; $5DC2: $CD $C0 $3B
    ld   a, $02                                   ; $5DC5: $3E $02
    call label_3DA0                               ; $5DC7: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5DCA: $C3 $8A $3D

Data_015_5DCD::
    db   $46, $00, $46, $60, $70, $00, $FF, $FF

label_015_5DD5:
    ld   de, Data_015_5DCD                        ; $5DD5: $11 $CD $5D
    ret                                           ; $5DD8: $C9

Data_015_5DD9::
    db   $7E, $00, $7E, $20, $7C, $00, $7C, $20, $1E, $00, $1E, $60, $58, $00, $58, $20
    db   $5A, $00, $5A, $20

label_015_5DED:
    ldh  a, [hFrameCounter]                       ; $5DED: $F0 $E7
    rla                                           ; $5DEF: $17
    rla                                           ; $5DF0: $17
    rla                                           ; $5DF1: $17
    and  $50                                      ; $5DF2: $E6 $50
    ldh  [hActiveEntityFlipAttribute], a          ; $5DF4: $E0 $ED
    ld   de, Data_015_5DD9                        ; $5DF6: $11 $D9 $5D
    call RenderActiveEntitySpritesPair            ; $5DF9: $CD $C0 $3B
    call func_015_7B0D                            ; $5DFC: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $5DFF: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $5E02: $F0 $F0
    cp   $04                                      ; $5E04: $FE $04
    jr   nz, jr_015_5E24                          ; $5E06: $20 $1C

    call GetEntityPrivateCountdown1               ; $5E08: $CD $00 $0C
    jp   z, ClearEntityStatus_15            ; $5E0B: $CA $31 $7C

    xor  c                                        ; $5E0E: $A9
    bit  0, a                                     ; $5E0F: $CB $47
    ld   e, $FF                                   ; $5E11: $1E $FF
    jr   z, jr_015_5E20                           ; $5E13: $28 $0B

    call GetEntityPrivateCountdown1               ; $5E15: $CD $00 $0C
    ld   e, $01                                   ; $5E18: $1E $01
    cp   $08                                      ; $5E1A: $FE $08
    jr   nc, jr_015_5E20                          ; $5E1C: $30 $02

    ld   e, $02                                   ; $5E1E: $1E $02

jr_015_5E20:
    ld   a, e                                     ; $5E20: $7B
    jp   SetEntitySpriteVariant                   ; $5E21: $C3 $0C $3B

jr_015_5E24:
    call UpdateEntityPosWithSpeed_15              ; $5E24: $CD $88 $7B
    call label_3B23                               ; $5E27: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $5E2A: $F0 $F0
    JP_TABLE                                      ; $5E2C
._00 dw func_015_5E35                             ; $5E2D
._01 dw func_015_5E85                             ; $5E2F
._02 dw func_015_5EAC                             ; $5E31
._03 dw func_015_5F22                             ; $5E33

func_015_5E35::
    call label_3B39                               ; $5E35: $CD $39 $3B

func_015_5E38::
    ld   hl, wEntitiesUnknowTableY                ; $5E38: $21 $D0 $C3
    add  hl, bc                                   ; $5E3B: $09
    ld   a, [hl]                                  ; $5E3C: $7E
    inc  a                                        ; $5E3D: $3C
    ld   [hl], a                                  ; $5E3E: $77
    and  $03                                      ; $5E3F: $E6 $03
    jr   nz, jr_015_5E79                          ; $5E41: $20 $36

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $5E43: $3E $E6
    call SpawnNewEntity_trampoline                ; $5E45: $CD $86 $3B
    ret  c                                        ; $5E48: $D8

    ld   hl, wEntitiesPhysicsFlagsTable           ; $5E49: $21 $40 $C3
    add  hl, de                                   ; $5E4C: $19
    ld   [hl], $C2                                ; $5E4D: $36 $C2
    ld   hl, wEntitiesHitboxFlagsTable            ; $5E4F: $21 $50 $C3
    add  hl, de                                   ; $5E52: $19
    ld   [hl], d                                  ; $5E53: $72
    ld   hl, wEntitiesUnknowTableP                ; $5E54: $21 $40 $C4
    add  hl, de                                   ; $5E57: $19
    inc  [hl]                                     ; $5E58: $34
    ldh  a, [hMultiPurpose0]                      ; $5E59: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5E5B: $21 $00 $C2
    add  hl, de                                   ; $5E5E: $19
    ld   [hl], a                                  ; $5E5F: $77
    ldh  a, [hMultiPurpose1]                      ; $5E60: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5E62: $21 $10 $C2
    add  hl, de                                   ; $5E65: $19
    ld   [hl], a                                  ; $5E66: $77
    ld   hl, wEntitiesPrivateCountdown1Table      ; $5E67: $21 $F0 $C2
    add  hl, de                                   ; $5E6A: $19
    ld   [hl], $0F                                ; $5E6B: $36 $0F
    ld   hl, wEntitiesSpriteVariantTable          ; $5E6D: $21 $B0 $C3
    add  hl, de                                   ; $5E70: $19
    ld   [hl], $01                                ; $5E71: $36 $01
    ld   hl, wEntitiesStateTable                  ; $5E73: $21 $90 $C2
    add  hl, de                                   ; $5E76: $19
    ld   [hl], $04                                ; $5E77: $36 $04

jr_015_5E79:
    ld   hl, wEntitiesCollisionsTable             ; $5E79: $21 $A0 $C2
    add  hl, bc                                   ; $5E7C: $09
    ld   a, [hl]                                  ; $5E7D: $7E
    and  a                                        ; $5E7E: $A7
    jr   z, jr_015_5E84                           ; $5E7F: $28 $03

    jp   ClearEntityStatus_15               ; $5E81: $C3 $31 $7C

jr_015_5E84:
    ret                                           ; $5E84: $C9

func_015_5E85::
    ld   a, $08                                   ; $5E85: $3E $08
    ldh  [hNoiseSfx], a                           ; $5E87: $E0 $F4
    ld   a, $18                                   ; $5E89: $3E $18
    call GetVectorTowardsLink_trampoline          ; $5E8B: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $5E8E: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $5E90: $E0 $9B
    cpl                                           ; $5E92: $2F
    inc  a                                        ; $5E93: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $5E94: $21 $50 $C2
    add  hl, bc                                   ; $5E97: $09
    ld   [hl], a                                  ; $5E98: $77
    ldh  a, [hMultiPurpose1]                      ; $5E99: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $5E9B: $E0 $9A
    cpl                                           ; $5E9D: $2F
    inc  a                                        ; $5E9E: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $5E9F: $21 $40 $C2
    add  hl, bc                                   ; $5EA2: $09
    ld   [hl], a                                  ; $5EA3: $77
    ld   a, $10                                   ; $5EA4: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $5EA6: $EA $3E $C1
    jp   IncrementEntityState                     ; $5EA9: $C3 $12 $3B

func_015_5EAC::
    call func_015_5E38                            ; $5EAC: $CD $38 $5E
    ld   a, [wD21A]                               ; $5EAF: $FA $1A $D2
    and  a                                        ; $5EB2: $A7
    ret  nz                                       ; $5EB3: $C0

    ld   a, [$D201]                               ; $5EB4: $FA $01 $D2
    ld   e, a                                     ; $5EB7: $5F
    ld   d, b                                     ; $5EB8: $50
    ld   hl, wEntitiesPosXTable                   ; $5EB9: $21 $00 $C2
    add  hl, de                                   ; $5EBC: $19
    ldh  a, [hActiveEntityPosX]                   ; $5EBD: $F0 $EE
    sub  [hl]                                     ; $5EBF: $96
    add  $10                                      ; $5EC0: $C6 $10
    cp   $20                                      ; $5EC2: $FE $20
    jr   nc, jr_015_5F19                          ; $5EC4: $30 $53

    ld   hl, wEntitiesPosYTable                   ; $5EC6: $21 $10 $C2
    add  hl, de                                   ; $5EC9: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5ECA: $F0 $EC
    sub  [hl]                                     ; $5ECC: $96
    add  $0C                                      ; $5ECD: $C6 $0C
    cp   $18                                      ; $5ECF: $FE $18
    jr   nc, jr_015_5F19                          ; $5ED1: $30 $46

    ld   hl, wEntitiesSpeedXTable                 ; $5ED3: $21 $40 $C2
    add  hl, bc                                   ; $5ED6: $09
    ld   a, [hl]                                  ; $5ED7: $7E
    sla  a                                        ; $5ED8: $CB $27
    ld   hl, wC3F0                                ; $5EDA: $21 $F0 $C3
    add  hl, de                                   ; $5EDD: $19
    ld   [hl], a                                  ; $5EDE: $77
    ld   hl, wEntitiesSpeedYTable                 ; $5EDF: $21 $50 $C2
    add  hl, bc                                   ; $5EE2: $09
    ld   a, [hl]                                  ; $5EE3: $7E
    sla  a                                        ; $5EE4: $CB $27
    ld   hl, wEntitiesUnknowTableS                ; $5EE6: $21 $00 $C4
    add  hl, de                                   ; $5EE9: $19
    ld   [hl], a                                  ; $5EEA: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5EEB: $21 $10 $C4
    add  hl, de                                   ; $5EEE: $19
    ld   [hl], $12                                ; $5EEF: $36 $12
    call ClearEntityStatus_15                        ; $5EF1: $CD $31 $7C
    ld   a, [wD220]                               ; $5EF4: $FA $20 $D2
    inc  a                                        ; $5EF7: $3C
    ld   [wD220], a                               ; $5EF8: $EA $20 $D2
    cp   $04                                      ; $5EFB: $FE $04
    jr   c, jr_015_5F0F                           ; $5EFD: $38 $10

    ld   hl, wEntitiesStateTable                  ; $5EFF: $21 $90 $C2

jr_015_5F02:
    add  hl, de                                   ; $5F02: $19
    ld   [hl], $07                                ; $5F03: $36 $07
    ld   hl, wEntitiesTransitionCountdownTable    ; $5F05: $21 $E0 $C2
    add  hl, de                                   ; $5F08: $19
    ld   [hl], $C0                                ; $5F09: $36 $C0
    ld   a, JINGLE_SHADOW_2_DEFEAT                ; $5F0B: $3E $36
    ldh  [hJingle], a                             ; $5F0D: $E0 $F2

jr_015_5F0F:
    ld   hl, wEntitiesFlashCountdownTable         ; $5F0F: $21 $20 $C4
    add  hl, de                                   ; $5F12: $19
    ld   [hl], $14                                ; $5F13: $36 $14
    ld   a, $07                                   ; $5F15: $3E $07
    ldh  [hWaveSfx], a                            ; $5F17: $E0 $F3

jr_015_5F19:
    ret                                           ; $5F19: $C9

Data_015_5F1A::
    db   $20, $20, $E0, $E0

Data_015_5F1E::
    db   $20, $E0, $20, $E0

func_015_5F22::
    call label_3B44                               ; $5F22: $CD $44 $3B
    ldh  a, [hFrameCounter]                       ; $5F25: $F0 $E7
    rra                                           ; $5F27: $1F
    rra                                           ; $5F28: $1F
    rra                                           ; $5F29: $1F
    and  $01                                      ; $5F2A: $E6 $01
    add  $03                                      ; $5F2C: $C6 $03
    call SetEntitySpriteVariant                   ; $5F2E: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5F31: $CD $05 $0C
    jr   z, jr_015_5F3F                           ; $5F34: $28 $09

    and  $01                                      ; $5F36: $E6 $01
    jr   nz, jr_015_5F3F                          ; $5F38: $20 $05

    ld   a, $18                                   ; $5F3A: $3E $18

jr_015_5F3C:
    call ApplyVectorTowardsLink_trampoline        ; $5F3C: $CD $AA $3B

jr_015_5F3F:
    ld   hl, wEntitiesCollisionsTable             ; $5F3F: $21 $A0 $C2
    add  hl, bc                                   ; $5F42: $09
    ld   a, [hl]                                  ; $5F43: $7E
    and  a                                        ; $5F44: $A7
    jr   z, jr_015_5F99                           ; $5F45: $28 $52

    ld   a, $36                                   ; $5F47: $3E $36
    ldh  [hNoiseSfx], a                           ; $5F49: $E0 $F4
    xor  a                                        ; $5F4B: $AF

jr_015_5F4C:
    ldh  [hMultiPurposeG], a                               ; $5F4C: $E0 $E8
    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $5F4E: $3E $7D
    call SpawnNewEntity_trampoline                ; $5F50: $CD $86 $3B
    jr   c, jr_015_5F96                           ; $5F53: $38 $41

    ldh  a, [hMultiPurpose0]                      ; $5F55: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5F57: $21 $00 $C2
    add  hl, de                                   ; $5F5A: $19
    ld   [hl], a                                  ; $5F5B: $77
    ldh  a, [hMultiPurpose1]                      ; $5F5C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F5E: $21 $10 $C2
    add  hl, de                                   ; $5F61: $19
    ld   [hl], a                                  ; $5F62: $77
    ld   hl, wEntitiesPrivateState1Table          ; $5F63: $21 $B0 $C2
    add  hl, de                                   ; $5F66: $19
    inc  [hl]                                     ; $5F67: $34
    push bc                                       ; $5F68: $C5
    ldh  a, [hMultiPurpose0]                      ; $5F69: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5F6B: $21 $00 $C2
    add  hl, de                                   ; $5F6E: $19
    ld   [hl], a                                  ; $5F6F: $77
    ldh  a, [hMultiPurpose1]                      ; $5F70: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F72: $21 $10 $C2
    add  hl, de                                   ; $5F75: $19
    ld   [hl], a                                  ; $5F76: $77
    ldh  a, [hMultiPurposeG]                               ; $5F77: $F0 $E8
    ld   c, a                                     ; $5F79: $4F
    ld   hl, Data_015_5F1A                        ; $5F7A: $21 $1A $5F
    add  hl, bc                                   ; $5F7D: $09
    ld   a, [hl]                                  ; $5F7E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5F7F: $21 $40 $C2
    add  hl, de                                   ; $5F82: $19
    ld   [hl], a                                  ; $5F83: $77
    ld   hl, Data_015_5F1E                        ; $5F84: $21 $1E $5F
    add  hl, bc                                   ; $5F87: $09
    ld   a, [hl]                                  ; $5F88: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5F89: $21 $50 $C2
    add  hl, de                                   ; $5F8C: $19
    ld   [hl], a                                  ; $5F8D: $77
    pop  bc                                       ; $5F8E: $C1
    ldh  a, [hMultiPurposeG]                               ; $5F8F: $F0 $E8
    inc  a                                        ; $5F91: $3C
    cp   $04                                      ; $5F92: $FE $04
    jr   nz, jr_015_5F4C                          ; $5F94: $20 $B6

jr_015_5F96:
    jp   ClearEntityStatus_15               ; $5F96: $C3 $31 $7C

jr_015_5F99:
    ret                                           ; $5F99: $C9

func_015_5F9A::
    ld   e, $80                                   ; $5F9A: $1E $80
    ld   hl, wD100                                ; $5F9C: $21 $00 $D1

jr_015_5F9F:
    xor  a                                        ; $5F9F: $AF
    ld   [hl+], a                                 ; $5FA0: $22
    dec  e                                        ; $5FA1: $1D
    jr   nz, jr_015_5F9F                          ; $5FA2: $20 $FB

    ret                                           ; $5FA4: $C9

Data_015_5FA5::
    db   $03, $03, $05, $05, $00, $00, $04, $04, $02, $02, $06, $06, $01, $01, $07, $07

Data_015_5FB5::
    db   $00, $06, $0C, $0E

Data_015_5FB9::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

Data_015_5FC9::
    db   $06, $07, $00, $01, $02, $03, $04, $05

func_015_5FD1::
    call func_015_7B0D                            ; $5FD1: $CD $0D $7B
    jp   label_3B39                               ; $5FD4: $C3 $39 $3B

FinalNightmareForm4Handler::
    ldh  a, [hActiveEntityState]                  ; $5FD7: $F0 $F0
    JP_TABLE                                      ; $5FD9
._00 dw func_015_604A                             ; $5FDA
._01 dw func_015_60D4                             ; $5FDC
._02 dw func_015_60C1                             ; $5FDE
._03 dw func_015_608C                             ; $5FE0

Data_015_5FE2::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $4C, $00, $00, $08, $4C, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $F8, $78, $00, $F8, $00, $7A, $00
    db   $F8, $08, $7A, $20, $00, $10, $78, $20, $08, $00, $7C, $00, $08, $08, $7C, $20

Data_015_6042::
    db   $03, $03, $02, $01, $00, $00, $00, $00

func_015_604A::
    xor  a                                        ; $604A: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $604B: $E0 $F1
    call GetEntityTransitionCountdown             ; $604D: $CD $05 $0C
    jr   nz, jr_015_6055                          ; $6050: $20 $03

    jp   IncrementEntityState                     ; $6052: $C3 $12 $3B

jr_015_6055:
    cp   $20                                      ; $6055: $FE $20
    jr   nz, jr_015_605F                          ; $6057: $20 $06

    dec  [hl]                                     ; $6059: $35
    call func_015_52B1                            ; $605A: $CD $B1 $52
    ld   a, $20                                   ; $605D: $3E $20

jr_015_605F:
    rra                                           ; $605F: $1F
    rra                                           ; $6060: $1F
    rra                                           ; $6061: $1F
    and  $07                                      ; $6062: $E6 $07
    ld   e, a                                     ; $6064: $5F
    ld   d, b                                     ; $6065: $50
    ld   hl, Data_015_6042                        ; $6066: $21 $42 $60

jr_015_6069:
    add  hl, de                                   ; $6069: $19
    ld   a, [hl]                                  ; $606A: $7E
    rla                                           ; $606B: $17
    rla                                           ; $606C: $17
    rla                                           ; $606D: $17
    and  $F8                                      ; $606E: $E6 $F8
    ld   e, a                                     ; $6070: $5F
    rla                                           ; $6071: $17
    and  $F0                                      ; $6072: $E6 $F0
    add  e                                        ; $6074: $83
    ld   e, a                                     ; $6075: $5F
    ld   hl, Data_015_5FE2                        ; $6076: $21 $E2 $5F
    add  hl, de                                   ; $6079: $19
    ld   c, $06                                   ; $607A: $0E $06
    call RenderActiveEntitySpritesRect            ; $607C: $CD $E6 $3C
    ld   a, $06                                   ; $607F: $3E $06
    jp   label_3DA0                               ; $6081: $C3 $A0 $3D

Data_015_6084::
    db   $00, $00, $01, $01, $02, $02, $03, $03

func_015_608C::
    xor  a                                        ; $608C: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $608D: $E0 $F1
    call GetEntityTransitionCountdown             ; $608F: $CD $05 $0C
    jr   nz, jr_015_60B5                          ; $6092: $20 $21

    call func_015_52BB                            ; $6094: $CD $BB $52
    call func_015_5128                            ; $6097: $CD $28 $51
    ld   hl, wEntitiesHealthTable                 ; $609A: $21 $60 $C3
    add  hl, bc                                   ; $609D: $09
    ld   [hl], $FF                                ; $609E: $36 $FF
    ld   hl, wEntitiesPhysicsFlagsTable           ; $60A0: $21 $40 $C3
    add  hl, bc                                   ; $60A3: $09
    ld   [hl], $40                                ; $60A4: $36 $40
    ld   hl, wEntitiesHitboxFlagsTable            ; $60A6: $21 $50 $C3
    add  hl, bc                                   ; $60A9: $09
    ld   [hl], $0A                                ; $60AA: $36 $0A
    ld   hl, wEntitiesOptions1Table               ; $60AC: $21 $30 $C4
    add  hl, bc                                   ; $60AF: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IMMUNE_WATER_PIT                                ; $60B0: $36 $90
    jp   ConfigureEntityHitbox                    ; $60B2: $C3 $EA $3A

jr_015_60B5:
    rra                                           ; $60B5: $1F
    rra                                           ; $60B6: $1F
    rra                                           ; $60B7: $1F
    and  $07                                      ; $60B8: $E6 $07
    ld   e, a                                     ; $60BA: $5F
    ld   d, b                                     ; $60BB: $50
    ld   hl, Data_015_6084                        ; $60BC: $21 $84 $60
    jr   jr_015_6069                              ; $60BF: $18 $A8

func_015_60C1::
    ld   hl, wEntitiesUnknowTableV                ; $60C1: $21 $80 $C4
    add  hl, bc                                   ; $60C4: $09
    ld   a, [hl]                                  ; $60C5: $7E
    and  a                                        ; $60C6: $A7
    jr   nz, func_015_60D4                          ; $60C7: $20 $0B

    call GetEntityTransitionCountdown             ; $60C9: $CD $05 $0C
    ld   [hl], $1F                                ; $60CC: $36 $1F
    call func_015_542E                            ; $60CE: $CD $2E $54
    jp   IncrementEntityState                     ; $60D1: $C3 $12 $3B

func_015_60D4::
    call func_015_5FD1                            ; $60D4: $CD $D1 $5F
    call func_015_6245                            ; $60D7: $CD $45 $62
    call DecrementEntityIgnoreHitsCountdown       ; $60DA: $CD $56 $0C
    call CopyEntityPositionToActivePosition       ; $60DD: $CD $8A $3D
    call func_015_7B0D                            ; $60E0: $CD $0D $7B
    xor  a                                        ; $60E3: $AF
    ld   [wD3D6], a                               ; $60E4: $EA $D6 $D3
    ld   e, $0C                                   ; $60E7: $1E $0C
    ld   hl, wEntitiesPrivateCountdown2Table      ; $60E9: $21 $00 $C3
    add  hl, bc                                   ; $60EC: $09
    ld   a, [hl]                                  ; $60ED: $7E
    and  a                                        ; $60EE: $A7
    jr   z, jr_015_60FB                           ; $60EF: $28 $0A

    call jr_015_6109                              ; $60F1: $CD $09 $61
    ld   a, $01                                   ; $60F4: $3E $01
    ld   [wD3D6], a                               ; $60F6: $EA $D6 $D3
    ld   e, $0C                                   ; $60F9: $1E $0C

jr_015_60FB:
    ld   hl, $D202                                ; $60FB: $21 $02 $D2
    ld   a, [hl]                                  ; $60FE: $7E
    inc  a                                        ; $60FF: $3C
    ld   [hl], a                                  ; $6100: $77
    cp   e                                        ; $6101: $BB
    jr   c, jr_015_6109                           ; $6102: $38 $05

    ld   [hl], b                                  ; $6104: $70
    ld   a, JINGLE_SHADOW_3_BG                    ; $6105: $3E $38
    ldh  [hJingle], a                             ; $6107: $E0 $F2

jr_015_6109:
    ld   hl, wEntitiesUnknowTableY                ; $6109: $21 $D0 $C3
    add  hl, bc                                   ; $610C: $09
    ld   a, [hl]                                  ; $610D: $7E
    inc  a                                        ; $610E: $3C
    and  $7F                                      ; $610F: $E6 $7F
    ld   [hl], a                                  ; $6111: $77
    ld   e, a                                     ; $6112: $5F
    ld   d, b                                     ; $6113: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6114: $21 $00 $D0
    add  hl, de                                   ; $6117: $19
    ldh  a, [hActiveEntityPosX]                   ; $6118: $F0 $EE
    ld   [hl], a                                  ; $611A: $77
    ld   hl, wD100                                ; $611B: $21 $00 $D1
    add  hl, de                                   ; $611E: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $611F: $F0 $EC
    ld   [hl], a                                  ; $6121: $77
    call func_015_6331                            ; $6122: $CD $31 $63
    ld   hl, wEntitiesPrivateState1Table          ; $6125: $21 $B0 $C2
    add  hl, bc                                   ; $6128: $09
    ld   e, [hl]                                  ; $6129: $5E
    srl  e                                        ; $612A: $CB $3B
    ld   d, b                                     ; $612C: $50
    ld   hl, Data_015_5FC9                        ; $612D: $21 $C9 $5F
    add  hl, de                                   ; $6130: $19
    ld   a, [hl]                                  ; $6131: $7E
    jp   SetEntitySpriteVariant                   ; $6132: $C3 $0C $3B

Data_015_6135::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $64, $00, $08, $00, $66, $00, $08, $08, $66, $20, $08, $10, $64, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $6C, $00, $08, $00, $6E, $00, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $68, $00, $F8, $00, $6A, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $68, $40, $08, $00, $6A, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $6C, $40, $F8, $00, $6E, $40, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $64, $40, $F8, $00, $66, $40, $F8, $08, $66, $60, $F8, $10, $64, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6E, $60, $F8, $10, $6C, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6A, $20, $F8, $10, $68, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6A, $60, $08, $10, $68, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6E, $20, $08, $10, $6C, $20

Data_015_6235::
    db   $70, $00, $70, $20, $72, $00, $72, $20, $74, $00, $74, $20, $76, $00, $76, $20

func_015_6245::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6245: $21 $40 $C3
    add  hl, bc                                   ; $6248: $09
    ld   [hl], $48                                ; $6249: $36 $48
    ld   hl, wEntitiesSpriteVariantTable          ; $624B: $21 $B0 $C3
    add  hl, bc                                   ; $624E: $09
    ld   a, [hl]                                  ; $624F: $7E
    rla                                           ; $6250: $17
    rla                                           ; $6251: $17
    rla                                           ; $6252: $17
    rla                                           ; $6253: $17
    rla                                           ; $6254: $17
    and  $E0                                      ; $6255: $E6 $E0
    ld   e, a                                     ; $6257: $5F
    ld   d, b                                     ; $6258: $50
    ld   hl, Data_015_6135                        ; $6259: $21 $35 $61
    add  hl, de                                   ; $625C: $19
    ld   c, $08                                   ; $625D: $0E $08
    call RenderActiveEntitySpritesRect            ; $625F: $CD $E6 $3C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6262: $21 $40 $C3
    add  hl, bc                                   ; $6265: $09
    ld   [hl], $42                                ; $6266: $36 $42
    ld   hl, wEntitiesUnknowTableY                ; $6268: $21 $D0 $C3
    add  hl, bc                                   ; $626B: $09
    ld   a, [hl]                                  ; $626C: $7E
    ldh  [hMultiPurpose0], a                      ; $626D: $E0 $D7
    ldh  a, [hMultiPurpose0]                      ; $626F: $F0 $D7
    sub  $0C                                      ; $6271: $D6 $0C
    and  $7F                                      ; $6273: $E6 $7F
    ld   e, a                                     ; $6275: $5F
    ld   d, b                                     ; $6276: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6277: $21 $00 $D0
    add  hl, de                                   ; $627A: $19
    ld   a, [hl]                                  ; $627B: $7E
    ldh  [hActiveEntityPosX], a                   ; $627C: $E0 $EE
    ld   hl, wD100                                ; $627E: $21 $00 $D1
    add  hl, de                                   ; $6281: $19
    ld   a, [hl]                                  ; $6282: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6283: $E0 $EC
    ld   a, $00                                   ; $6285: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $6287: $E0 $F1
    ld   de, Data_015_6235                        ; $6289: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $628C: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $628F: $F0 $D7
    sub  $18                                      ; $6291: $D6 $18
    and  $7F                                      ; $6293: $E6 $7F
    ld   e, a                                     ; $6295: $5F
    ld   d, b                                     ; $6296: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6297: $21 $00 $D0
    add  hl, de                                   ; $629A: $19
    ld   a, [hl]                                  ; $629B: $7E
    ldh  [hActiveEntityPosX], a                   ; $629C: $E0 $EE
    ld   hl, wD100                                ; $629E: $21 $00 $D1
    add  hl, de                                   ; $62A1: $19
    ld   a, [hl]                                  ; $62A2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62A3: $E0 $EC
    ld   a, $00                                   ; $62A5: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $62A7: $E0 $F1
    ld   de, Data_015_6235                        ; $62A9: $11 $35 $62

jr_015_62AC:
    call RenderActiveEntitySpritesPair            ; $62AC: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $62AF: $F0 $D7
    sub  $24                                      ; $62B1: $D6 $24
    and  $7F                                      ; $62B3: $E6 $7F
    ld   e, a                                     ; $62B5: $5F
    ld   d, b                                     ; $62B6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62B7: $21 $00 $D0
    add  hl, de                                   ; $62BA: $19
    ld   a, [hl]                                  ; $62BB: $7E
    ldh  [hActiveEntityPosX], a                   ; $62BC: $E0 $EE
    ld   hl, wD100                                ; $62BE: $21 $00 $D1
    add  hl, de                                   ; $62C1: $19
    ld   a, [hl]                                  ; $62C2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62C3: $E0 $EC
    ld   a, $01                                   ; $62C5: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $62C7: $E0 $F1
    ld   de, Data_015_6235                        ; $62C9: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $62CC: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $62CF: $F0 $D7
    sub  $2E                                      ; $62D1: $D6 $2E
    and  $7F                                      ; $62D3: $E6 $7F
    ld   e, a                                     ; $62D5: $5F
    ld   d, b                                     ; $62D6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62D7: $21 $00 $D0
    add  hl, de                                   ; $62DA: $19
    ld   a, [hl]                                  ; $62DB: $7E
    ldh  [hActiveEntityPosX], a                   ; $62DC: $E0 $EE
    ld   hl, wD100                                ; $62DE: $21 $00 $D1
    add  hl, de                                   ; $62E1: $19
    ld   a, [hl]                                  ; $62E2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62E3: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $62E5: $F0 $E7
    rra                                           ; $62E7: $1F
    rra                                           ; $62E8: $1F
    rra                                           ; $62E9: $1F
    and  $01                                      ; $62EA: $E6 $01
    add  $02                                      ; $62EC: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $62EE: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $62F0: $F0 $E7
    rla                                           ; $62F2: $17
    rla                                           ; $62F3: $17
    and  OAMF_PAL1 ; $62F4: $E6 $10
    ld   hl, hActiveEntityFlipAttribute           ; $62F6: $21 $ED $FF
    xor  [hl]                                     ; $62F9: $AE
    ld   [hl], a                                  ; $62FA: $77
    ld   de, Data_015_6235                        ; $62FB: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $62FE: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $6301: $F0 $F0
    cp   $02                                      ; $6303: $FE $02
    jr   nc, jr_015_6330                          ; $6305: $30 $29

    ld   hl, wEntitiesFlashCountdownTable         ; $6307: $21 $20 $C4
    add  hl, bc                                   ; $630A: $09
    ld   a, [hl]                                  ; $630B: $7E
    and  a                                        ; $630C: $A7
IF __PATCH_0__
    jr   nz, jr_015_6324
ELSE
    jr   nz, jr_015_6330                          ; $630D: $20 $21
ENDC

    ld   hl, wEntitiesOptions1Table               ; $630F: $21 $30 $C4
    add  hl, bc                                   ; $6312: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IMMUNE_WATER_PIT                                ; $6313: $36 $90
    call label_3B70                               ; $6315: $CD $70 $3B
    ld   hl, wEntitiesOptions1Table               ; $6318: $21 $30 $C4
    add  hl, bc                                   ; $631B: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IMMUNE_WATER_PIT                                ; $631C: $36 $D0

jr_015_6324:
    ld   hl, wEntitiesHealthTable                 ; $631E: $21 $60 $C3
    add  hl, bc                                   ; $6321: $09
    ld   a, [hl]                                  ; $6322: $7E
    cp   $F0                                      ; $6323: $FE $F0
    jr   nc, jr_015_6330                          ; $6325: $30 $09

    call IncrementEntityState                     ; $6327: $CD $12 $3B
    ld   hl, wEntitiesUnknowTableV                ; $632A: $21 $80 $C4
    add  hl, bc                                   ; $632D: $09
    ld   [hl], $50                                ; $632E: $36 $50

jr_015_6330:
    ret                                           ; $6330: $C9

func_015_6331::
    ldh  a, [hActiveEntityState]                  ; $6331: $F0 $F0
    cp   $02                                      ; $6333: $FE $02
    jr   nc, jr_015_6342                          ; $6335: $30 $0B

    ld   hl, wEntitiesFlashCountdownTable         ; $6337: $21 $20 $C4
    add  hl, bc                                   ; $633A: $09
    ld   a, [hl]                                  ; $633B: $7E
    and  a                                        ; $633C: $A7
    jr   nz, jr_015_6342                          ; $633D: $20 $03

    call UpdateEntityPosWithSpeed_15              ; $633F: $CD $88 $7B

jr_015_6342:
    call label_3B23                               ; $6342: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6345: $21 $A0 $C2
    add  hl, bc                                   ; $6348: $09
    ld   a, [hl]                                  ; $6349: $7E
    and  a                                        ; $634A: $A7
    jr   z, jr_015_6379                           ; $634B: $28 $2C

    ld   e, $08                                   ; $634D: $1E $08
    bit  0, a                                     ; $634F: $CB $47
    jr   nz, jr_015_6361                          ; $6351: $20 $0E

    ld   e, $00                                   ; $6353: $1E $00
    bit  1, a                                     ; $6355: $CB $4F
    jr   nz, jr_015_6361                          ; $6357: $20 $08

    ld   e, $04                                   ; $6359: $1E $04
    bit  2, a                                     ; $635B: $CB $57
    jr   nz, jr_015_6361                          ; $635D: $20 $02

    ld   e, $0C                                   ; $635F: $1E $0C

jr_015_6361:
    ld   hl, wEntitiesPrivateState1Table          ; $6361: $21 $B0 $C2
    add  hl, bc                                   ; $6364: $09
    ld   [hl], e                                  ; $6365: $73
    call GetRandomByte                            ; $6366: $CD $0D $28
    rra                                           ; $6369: $1F
    jr   c, jr_015_6374                           ; $636A: $38 $08

    ld   hl, wEntitiesPrivateState2Table          ; $636C: $21 $C0 $C2
    add  hl, bc                                   ; $636F: $09
    ld   a, [hl]                                  ; $6370: $7E
    cpl                                           ; $6371: $2F
    inc  a                                        ; $6372: $3C
    ld   [hl], a                                  ; $6373: $77

jr_015_6374:
    call GetEntityTransitionCountdown             ; $6374: $CD $05 $0C
    ld   [hl], $10                                ; $6377: $36 $10

jr_015_6379:
    call GetEntityPrivateCountdown1               ; $6379: $CD $00 $0C
    jr   nz, jr_015_63AF                          ; $637C: $20 $31

    ld   [hl], $06                                ; $637E: $36 $06
    ld   hl, wEntitiesPrivateState2Table          ; $6380: $21 $C0 $C2
    add  hl, bc                                   ; $6383: $09
    ld   a, [hl]                                  ; $6384: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6385: $21 $B0 $C2
    add  hl, bc                                   ; $6388: $09
    add  [hl]                                     ; $6389: $86
    and  $0F                                      ; $638A: $E6 $0F
    ld   [hl], a                                  ; $638C: $77
    ld   hl, wEntitiesPrivateState1Table          ; $638D: $21 $B0 $C2
    add  hl, bc                                   ; $6390: $09
    ld   e, [hl]                                  ; $6391: $5E
    ld   d, b                                     ; $6392: $50
    ld   hl, Data_015_5FA5                        ; $6393: $21 $A5 $5F
    add  hl, de                                   ; $6396: $19
    ld   a, [hl]                                  ; $6397: $7E
    call SetEntitySpriteVariant                   ; $6398: $CD $0C $3B
    ld   hl, Data_015_5FB5                        ; $639B: $21 $B5 $5F
    add  hl, de                                   ; $639E: $19
    ld   a, [hl]                                  ; $639F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $63A0: $21 $50 $C2
    add  hl, bc                                   ; $63A3: $09
    ld   [hl], a                                  ; $63A4: $77
    ld   hl, Data_015_5FB9                        ; $63A5: $21 $B9 $5F
    add  hl, de                                   ; $63A8: $19
    ld   a, [hl]                                  ; $63A9: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $63AA: $21 $40 $C2
    add  hl, bc                                   ; $63AD: $09
    ld   [hl], a                                  ; $63AE: $77

jr_015_63AF:
    call GetEntityTransitionCountdown             ; $63AF: $CD $05 $0C
    jr   nz, jr_015_63C7                          ; $63B2: $20 $13

    call GetRandomByte                            ; $63B4: $CD $0D $28
    and  $1F                                      ; $63B7: $E6 $1F
    add  $10                                      ; $63B9: $C6 $10
    ld   [hl], a                                  ; $63BB: $77
    call GetRandomByte                            ; $63BC: $CD $0D $28
    and  $02                                      ; $63BF: $E6 $02
    dec  a                                        ; $63C1: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $63C2: $21 $C0 $C2
    add  hl, bc                                   ; $63C5: $09
    ld   [hl], a                                  ; $63C6: $77

jr_015_63C7:
    ret                                           ; $63C7: $C9

FinalNightmareForm5Handler::
    ld   hl, wEntitiesPrivateState1Table          ; $63C8: $21 $B0 $C2
    add  hl, bc                                   ; $63CB: $09
    ld   a, [hl]                                  ; $63CC: $7E
    cp   $03                                      ; $63CD: $FE $03
    jp   z, label_015_6D40                        ; $63CF: $CA $40 $6D

    cp   $02                                      ; $63D2: $FE $02
    jp   z, label_015_6D6E                        ; $63D4: $CA $6E $6D

    and  a                                        ; $63D7: $A7
    jp   nz, label_015_6C61                       ; $63D8: $C2 $61 $6C

    ldh  a, [hActiveEntityState]                  ; $63DB: $F0 $F0
    cp   $02                                      ; $63DD: $FE $02
    jr   c, jr_015_6425                           ; $63DF: $38 $44

    cp   $0B                                      ; $63E1: $FE $0B
    jr   z, jr_015_63E9                           ; $63E3: $28 $04

    cp   $0C                                      ; $63E5: $FE $0C
    jr   nz, jr_015_63F2                          ; $63E7: $20 $09

jr_015_63E9:
    ld   a, $06                                   ; $63E9: $3E $06
    ldh  [hActiveEntitySpriteVariant], a          ; $63EB: $E0 $F1
    call func_015_572B                            ; $63ED: $CD $2B $57
    jr   jr_015_63F5                              ; $63F0: $18 $03

jr_015_63F2:
    call func_015_692A                            ; $63F2: $CD $2A $69

jr_015_63F5:
    call func_015_7B0D                            ; $63F5: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $63F8: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $63FB: $F0 $F0
    cp   $09                                      ; $63FD: $FE $09
    jr   nc, jr_015_6425                          ; $63FF: $30 $24

    call label_3B39                               ; $6401: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6404: $21 $60 $C3
    add  hl, bc                                   ; $6407: $09
    ld   a, [hl]                                  ; $6408: $7E
    cp   $E8                                      ; $6409: $FE $E8
    jr   nc, jr_015_6425                          ; $640B: $30 $18

    call IncrementEntityState                     ; $640D: $CD $12 $3B
    ld   [hl], $09                                ; $6410: $36 $09
    ld   a, $09                                   ; $6412: $3E $09
    ldh  [hActiveEntityState], a                  ; $6414: $E0 $F0
    ld   a, $10                                   ; $6416: $3E $10
    ldh  [hWaveSfx], a                            ; $6418: $E0 $F3
    call GetEntityTransitionCountdown             ; $641A: $CD $05 $0C
    ld   [hl], $80                                ; $641D: $36 $80
    ld   hl, wEntitiesFlashCountdownTable         ; $641F: $21 $20 $C4
    add  hl, bc                                   ; $6422: $09
    ld   [hl], $80                                ; $6423: $36 $80

jr_015_6425:
    ldh  a, [hActiveEntityState]                  ; $6425: $F0 $F0
    JP_TABLE                                      ; $6427
._00 dw func_015_64BC                             ; $6428
._01 dw func_015_650E                             ; $642A
._02 dw func_015_6553                             ; $642C
._03 dw func_015_65A6                             ; $642E
._04 dw func_015_6618                             ; $6430
._05 dw func_015_66CC                             ; $6432
._06 dw func_015_6753                             ; $6434
._07 dw func_015_678F                             ; $6436
._08 dw func_015_67E2                             ; $6438
._09 dw func_015_67E3                             ; $643A
._0A dw func_015_67FA                             ; $643C
._0B dw func_015_6811                             ; $643E
._0C dw func_015_6896                             ; $6440
._0D dw func_015_68E7                             ; $6442

Data_015_6444::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $4C, $00, $00, $08, $4C, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0, $00, $5C, $00, $F0, $08, $5C, $20
    db   $00, $00, $5E, $00, $00, $08, $5E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $FC, $6A, $00, $00, $04, $6C, $20, $00, $0C, $6A, $20, $F3, $FC, $50, $00
    db   $F3, $04, $52, $00, $F3, $0C, $6E, $00

func_015_64BC::
    xor  a                                        ; $64BC: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $64BD: $E0 $F1
    call SetEntitySpriteVariant                   ; $64BF: $CD $0C $3B
    call func_015_572B                            ; $64C2: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $64C5: $F0 $98
    push af                                       ; $64C7: $F5
    ldh  a, [hLinkPositionY]                      ; $64C8: $F0 $99
    push af                                       ; $64CA: $F5
    ld   a, $50                                   ; $64CB: $3E $50
    ldh  [hLinkPositionX], a                      ; $64CD: $E0 $98
    ld   a, $30                                   ; $64CF: $3E $30
    ldh  [hLinkPositionY], a                      ; $64D1: $E0 $99
    ld   a, $10                                   ; $64D3: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $64D5: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $64D8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $64DB: $F0 $EC
    sub  [hl]                                     ; $64DD: $96
    add  $03                                      ; $64DE: $C6 $03
    cp   $06                                      ; $64E0: $FE $06
    jr   nc, jr_015_64F8                          ; $64E2: $30 $14

    ld   hl, hLinkPositionX                       ; $64E4: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $64E7: $F0 $EE
    sub  [hl]                                     ; $64E9: $96
    add  $03                                      ; $64EA: $C6 $03
    cp   $06                                      ; $64EC: $FE $06
    jr   nc, jr_015_64F8                          ; $64EE: $30 $08

    call GetEntityTransitionCountdown             ; $64F0: $CD $05 $0C
    ld   [hl], $60                                ; $64F3: $36 $60
    call IncrementEntityState                     ; $64F5: $CD $12 $3B

jr_015_64F8:
    pop  af                                       ; $64F8: $F1
    ldh  [hLinkPositionY], a                      ; $64F9: $E0 $99
    pop  af                                       ; $64FB: $F1
    ldh  [hLinkPositionX], a                      ; $64FC: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $64FE: $C3 $88 $7B

Data_015_6501::
    db   $04, $03, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_650E::
    call GetEntityTransitionCountdown             ; $650E: $CD $05 $0C
    jr   nz, jr_015_652E                          ; $6511: $20 $1B

    ld   [wD224], a                               ; $6513: $EA $24 $D2
    ld   hl, wEntitiesPosYTable                   ; $6516: $21 $10 $C2
    add  hl, bc                                   ; $6519: $09
    ld   a, [hl]                                  ; $651A: $7E
    sub  $08                                      ; $651B: $D6 $08
    ld   [hl], a                                  ; $651D: $77
    call GetEntityTransitionCountdown             ; $651E: $CD $05 $0C
    ld   [hl], $08                                ; $6521: $36 $08
    ld   a, $04                                   ; $6523: $3E $04
    call SetEntitySpriteVariant                   ; $6525: $CD $0C $3B
    call func_015_52B1                            ; $6528: $CD $B1 $52
    jp   IncrementEntityState                     ; $652B: $C3 $12 $3B

jr_015_652E:
    rra                                           ; $652E: $1F
    rra                                           ; $652F: $1F
    rra                                           ; $6530: $1F
    and  $0F                                      ; $6531: $E6 $0F
    ld   e, a                                     ; $6533: $5F
    ld   d, b                                     ; $6534: $50
    ld   hl, Data_015_6501                        ; $6535: $21 $01 $65
    add  hl, de                                   ; $6538: $19
    ld   a, [hl]                                  ; $6539: $7E
    rla                                           ; $653A: $17
    rla                                           ; $653B: $17
    rla                                           ; $653C: $17
    and  $F8                                      ; $653D: $E6 $F8
    ld   e, a                                     ; $653F: $5F
    rla                                           ; $6540: $17
    and  $F0                                      ; $6541: $E6 $F0
    add  e                                        ; $6543: $83
    ld   e, a                                     ; $6544: $5F
    ld   hl, Data_015_6444                        ; $6545: $21 $44 $64
    add  hl, de                                   ; $6548: $19
    ld   c, $06                                   ; $6549: $0E $06
    call RenderActiveEntitySpritesRect            ; $654B: $CD $E6 $3C
    ld   a, $06                                   ; $654E: $3E $06
    jp   label_3DA0                               ; $6550: $C3 $A0 $3D

func_015_6553::
    call GetEntityTransitionCountdown             ; $6553: $CD $05 $0C
    jr   nz, jr_015_6565                          ; $6556: $20 $0D

    ld   [hl], $7F                                ; $6558: $36 $7F
    jp   IncrementEntityState                     ; $655A: $C3 $12 $3B

func_015_655D::
    call func_015_7BDB                            ; $655D: $CD $DB $7B
    ld   a, e                                     ; $6560: $7B
    ld   [wD21E], a                               ; $6561: $EA $1E $D2
    ret                                           ; $6564: $C9

jr_015_6565:
    ret                                           ; $6565: $C9

Data_015_6566::
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_015_6586::
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $02, $07, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_65A6::
    ld   a, $00                                   ; $65A6: $3E $00
    ld   [wD21E], a                               ; $65A8: $EA $1E $D2
    call GetEntityTransitionCountdown             ; $65AB: $CD $05 $0C
    jr   nz, jr_015_65BB                          ; $65AE: $20 $0B

    call GetEntityDropTimer                       ; $65B0: $CD $FB $0B
    ld   [hl], $4C                                ; $65B3: $36 $4C
    call func_015_655D                            ; $65B5: $CD $5D $65
    jp   IncrementEntityState                     ; $65B8: $C3 $12 $3B

jr_015_65BB:
    cp   $40                                      ; $65BB: $FE $40
    jr   nz, jr_015_65C4                          ; $65BD: $20 $05

    ld   hl, hNoiseSfx                            ; $65BF: $21 $F4 $FF
    ld   [hl], $19                                ; $65C2: $36 $19

jr_015_65C4:
    cp   $58                                      ; $65C4: $FE $58
    jr   nz, jr_015_65CD                          ; $65C6: $20 $05

    ld   hl, hJingle                              ; $65C8: $21 $F2 $FF
    ld   [hl], JINGLE_SHADOW_4_INTRO              ; $65CB: $36 $39

jr_015_65CD:
    rra                                           ; $65CD: $1F
    rra                                           ; $65CE: $1F
    and  $3F                                      ; $65CF: $E6 $3F
    ld   e, a                                     ; $65D1: $5F
    ld   d, b                                     ; $65D2: $50
    ld   hl, Data_015_6586                        ; $65D3: $21 $86 $65
    add  hl, de                                   ; $65D6: $19
    ld   a, [hl]                                  ; $65D7: $7E
    ld   [wD224], a                               ; $65D8: $EA $24 $D2
    ld   hl, Data_015_6566                        ; $65DB: $21 $66 $65
    add  hl, de                                   ; $65DE: $19
    ld   a, [hl]                                  ; $65DF: $7E
    call SetEntitySpriteVariant                   ; $65E0: $CD $0C $3B
    ld   a, [wD224]                               ; $65E3: $FA $24 $D2

jr_015_65E6:
    cp   $05                                      ; $65E6: $FE $05
    jr   z, jr_015_65F5                           ; $65E8: $28 $0B

    ld   a, $F3                                   ; $65EA: $3E $F3
    ld   [wD225], a                               ; $65EC: $EA $25 $D2
    ld   a, $F0                                   ; $65EF: $3E $F0
    ld   [wD226], a                               ; $65F1: $EA $26 $D2
    ret                                           ; $65F4: $C9

jr_015_65F5:
    ld   a, $F8                                   ; $65F5: $3E $F8
    ld   [wD225], a                               ; $65F7: $EA $25 $D2
    ld   a, $FE                                   ; $65FA: $3E $FE
    ld   [wD226], a                               ; $65FC: $EA $26 $D2
    ret                                           ; $65FF: $C9

Data_015_6600::
    db   $03, $02, $01, $00

Data_015_6604::
    db   $00, $01, $02, $03

Data_015_6608::
    db   $E8, $00, $18, $18, $00, $E8, $E8, $00

Data_015_6610::
    db   $10, $18, $10, $F0, $E8, $F0, $10, $18

func_015_6618::
    call GetEntityDropTimer                       ; $6618: $CD $FB $0B
    jr   nz, jr_015_6628                          ; $661B: $20 $0B

    ld   [wD221], a                               ; $661D: $EA $21 $D2
    call GetEntityTransitionCountdown             ; $6620: $CD $05 $0C

jr_015_6623:
    ld   [hl], $30                                ; $6623: $36 $30
    jp   IncrementEntityState                     ; $6625: $C3 $12 $3B

jr_015_6628:
    ld   a, [wD21E]                               ; $6628: $FA $1E $D2
    and  a                                        ; $662B: $A7
    ld   a, $F5                                   ; $662C: $3E $F5
    jr   z, jr_015_6632                           ; $662E: $28 $02

    ld   a, $0B                                   ; $6630: $3E $0B

jr_015_6632:
    ld   [wD225], a                               ; $6632: $EA $25 $D2
    ld   a, $EE                                   ; $6635: $3E $EE
    ld   [wD226], a                               ; $6637: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $663A: $F0 $E7
    rra                                           ; $663C: $1F
    rra                                           ; $663D: $1F
    rra                                           ; $663E: $1F
    nop                                           ; $663F: $00
    and  $01                                      ; $6640: $E6 $01
    call SetEntitySpriteVariant                   ; $6642: $CD $0C $3B
    ld   a, [wD21E]                               ; $6645: $FA $1E $D2
    and  a                                        ; $6648: $A7
    ld   hl, Data_015_6600                        ; $6649: $21 $00 $66
    jr   z, jr_015_6651                           ; $664C: $28 $03

    ld   hl, Data_015_6604                        ; $664E: $21 $04 $66

jr_015_6651:
    ldh  a, [hFrameCounter]                       ; $6651: $F0 $E7
    rra                                           ; $6653: $1F
    rra                                           ; $6654: $1F
    rra                                           ; $6655: $1F
    nop                                           ; $6656: $00
    nop                                           ; $6657: $00
    and  $03                                      ; $6658: $E6 $03
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    add  hl, de                                   ; $665C: $19
    ld   a, [hl]                                  ; $665D: $7E
    inc  a                                        ; $665E: $3C
    ld   [wD224], a                               ; $665F: $EA $24 $D2
    ldh  a, [hFrameCounter]                       ; $6662: $F0 $E7
    and  $1F                                      ; $6664: $E6 $1F
    jr   nz, jr_015_66C7                          ; $6666: $20 $5F

    ld   a, [wD221]                               ; $6668: $FA $21 $D2
    cp   $06                                      ; $666B: $FE $06
    jr   nc, jr_015_66C7                          ; $666D: $30 $58

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $666F: $3E $E6
    call SpawnNewEntity_trampoline                ; $6671: $CD $86 $3B
    ret  c                                        ; $6674: $D8

    ld   hl, wEntitiesTransitionCountdownTable    ; $6675: $21 $E0 $C2
    add  hl, de                                   ; $6678: $19
    ld   [hl], $30                                ; $6679: $36 $30
    ld   hl, wEntitiesPrivateState1Table          ; $667B: $21 $B0 $C2
    add  hl, de                                   ; $667E: $19
    ld   [hl], $02                                ; $667F: $36 $02
    push bc                                       ; $6681: $C5
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6682: $21 $40 $C3
    add  hl, de                                   ; $6685: $19
    ld   [hl], $42                                ; $6686: $36 $42
    ld   hl, wEntitiesHitboxFlagsTable            ; $6688: $21 $50 $C3
    add  hl, de                                   ; $668B: $19
    ld   [hl], $00                                ; $668C: $36 $00
    push de                                       ; $668E: $D5
    ld   c, e                                     ; $668F: $4B
    ld   b, d                                     ; $6690: $42
    call ConfigureEntityHitbox                    ; $6691: $CD $EA $3A
    pop  de                                       ; $6694: $D1
    ld   a, [wD21E]                               ; $6695: $FA $1E $D2
    and  a                                        ; $6698: $A7
    ld   a, [wD221]                               ; $6699: $FA $21 $D2
    jr   nz, jr_015_66A0                          ; $669C: $20 $02

    xor  $07                                      ; $669E: $EE $07

jr_015_66A0:
    ld   c, a                                     ; $66A0: $4F
    ld   hl, Data_015_6610                        ; $66A1: $21 $10 $66
    add  hl, bc                                   ; $66A4: $09
    ld   a, [wD225]                               ; $66A5: $FA $25 $D2
    add  [hl]                                     ; $66A8: $86
    ld   hl, hMultiPurpose0                            ; $66A9: $21 $D7 $FF
    add  [hl]                                     ; $66AC: $86
    ld   hl, wEntitiesPosXTable                   ; $66AD: $21 $00 $C2
    add  hl, de                                   ; $66B0: $19
    ld   [hl], a                                  ; $66B1: $77
    ld   hl, Data_015_6608                        ; $66B2: $21 $08 $66
    add  hl, bc                                   ; $66B5: $09
    ld   a, [hl]                                  ; $66B6: $7E
    sub  $0C                                      ; $66B7: $D6 $0C
    ld   hl, hMultiPurpose1                            ; $66B9: $21 $D8 $FF
    add  [hl]                                     ; $66BC: $86
    ld   hl, wEntitiesPosYTable                   ; $66BD: $21 $10 $C2
    add  hl, de                                   ; $66C0: $19
    ld   [hl], a                                  ; $66C1: $77
    ld   hl, wD221                                ; $66C2: $21 $21 $D2
    inc  [hl]                                     ; $66C5: $34
    pop  bc                                       ; $66C6: $C1

jr_015_66C7:
    ret                                           ; $66C7: $C9

Data_015_66C8::
    db   $0B, $0A, $02, $0A

func_015_66CC::
    ld   a, [wD21E]                               ; $66CC: $FA $1E $D2
    and  a                                        ; $66CF: $A7
    ld   a, $FD                                   ; $66D0: $3E $FD
    jr   z, jr_015_66D6                           ; $66D2: $28 $02

    ld   a, $03                                   ; $66D4: $3E $03

jr_015_66D6:
    ld   [wD225], a                               ; $66D6: $EA $25 $D2
    ld   a, $EC                                   ; $66D9: $3E $EC
    ld   [wD226], a                               ; $66DB: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $66DE: $F0 $E7
    rra                                           ; $66E0: $1F
    rra                                           ; $66E1: $1F
    rra                                           ; $66E2: $1F
    nop                                           ; $66E3: $00
    nop                                           ; $66E4: $00
    and  $03                                      ; $66E5: $E6 $03
    ld   e, a                                     ; $66E7: $5F
    ld   d, b                                     ; $66E8: $50
    ld   hl, Data_015_66C8                        ; $66E9: $21 $C8 $66
    add  hl, de                                   ; $66EC: $19
    ld   a, [hl]                                  ; $66ED: $7E
    inc  a                                        ; $66EE: $3C
    ld   [wD224], a                               ; $66EF: $EA $24 $D2
    call GetEntityTransitionCountdown             ; $66F2: $CD $05 $0C
    jr   nz, jr_015_674E                          ; $66F5: $20 $57

    ld   [hl], $40                                ; $66F7: $36 $40
    xor  a                                        ; $66F9: $AF
    ld   [wD224], a                               ; $66FA: $EA $24 $D2
    call IncrementEntityState                     ; $66FD: $CD $12 $3B
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6700: $3E $E6
    call SpawnNewEntity_trampoline                ; $6702: $CD $86 $3B
    jr   c, jr_015_674E                           ; $6705: $38 $47

    ld   hl, wEntitiesPrivateState1Table          ; $6707: $21 $B0 $C2
    add  hl, de                                   ; $670A: $19
    inc  [hl]                                     ; $670B: $34
    ldh  a, [hMultiPurpose1]                      ; $670C: $F0 $D8
    sub  $10                                      ; $670E: $D6 $10
    ld   hl, wEntitiesPosYTable                   ; $6710: $21 $10 $C2
    add  hl, de                                   ; $6713: $19
    ld   [hl], a                                  ; $6714: $77
    ld   a, [wD21E]                               ; $6715: $FA $1E $D2
    ld   hl, wEntitiesDirectionTable              ; $6718: $21 $80 $C3
    add  hl, de                                   ; $671B: $19
    ld   [hl], a                                  ; $671C: $77
    and  a                                        ; $671D: $A7
    ld   a, $08                                   ; $671E: $3E $08
    jr   nz, jr_015_6724                          ; $6720: $20 $02

    ld   a, $F8                                   ; $6722: $3E $F8

jr_015_6724:
    ld   hl, hMultiPurpose0                            ; $6724: $21 $D7 $FF
    add  [hl]                                     ; $6727: $86
    ld   hl, wEntitiesPosXTable                   ; $6728: $21 $00 $C2
    add  hl, de                                   ; $672B: $19
    ld   [hl], a                                  ; $672C: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $672D: $21 $40 $C3
    add  hl, de                                   ; $6730: $19
    ld   [hl], $40                                ; $6731: $36 $40
    ld   hl, wEntitiesHitboxFlagsTable            ; $6733: $21 $50 $C3
    add  hl, de                                   ; $6736: $19
    ld   [hl], $08                                ; $6737: $36 $08
    push bc                                       ; $6739: $C5
    ld   c, e                                     ; $673A: $4B
    ld   b, d                                     ; $673B: $42
    call ConfigureEntityHitbox                    ; $673C: $CD $EA $3A
    ld   a, $18                                   ; $673F: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $6741: $CD $AA $3B
    call GetEntityTransitionCountdown             ; $6744: $CD $05 $0C
    ld   [hl], $30                                ; $6747: $36 $30
    ld   a, $27                                   ; $6749: $3E $27
    ldh  [hNoiseSfx], a                           ; $674B: $E0 $F4
    pop  bc                                       ; $674D: $C1

jr_015_674E:
    ld   a, $02                                   ; $674E: $3E $02
    jp   SetEntitySpriteVariant                   ; $6750: $C3 $0C $3B

func_015_6753::
    call GetEntityTransitionCountdown             ; $6753: $CD $05 $0C
    jr   nz, jr_015_676A                          ; $6756: $20 $12

    ld   [hl], $1F                                ; $6758: $36 $1F
    call GetRandomByte                            ; $675A: $CD $0D $28
    and  $07                                      ; $675D: $E6 $07
    ld   hl, wEntitiesPrivateState2Table          ; $675F: $21 $C0 $C2
    add  hl, bc                                   ; $6762: $09
    ld   [hl], a                                  ; $6763: $77
    call func_015_5128                            ; $6764: $CD $28 $51
    call IncrementEntityState                     ; $6767: $CD $12 $3B

jr_015_676A:
    ld   a, $03                                   ; $676A: $3E $03
    jp   SetEntitySpriteVariant                   ; $676C: $C3 $0C $3B

Data_015_676F::
    db   $28, $50, $78, $28, $78, $28, $50, $78

Data_015_6777::
    db   $20, $28, $20, $30, $30, $50, $50, $50

Data_015_677F::
    db   $20, $1E, $1C, $1A, $18, $16, $14, $12, $10, $0E, $0C, $0A, $08, $06, $04, $02

func_015_678F::
    ld   a, $04                                   ; $678F: $3E $04
    call SetEntitySpriteVariant                   ; $6791: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $6794: $F0 $98
    push af                                       ; $6796: $F5
    ldh  a, [hLinkPositionY]                      ; $6797: $F0 $99
    push af                                       ; $6799: $F5
    ld   hl, wEntitiesPrivateState2Table          ; $679A: $21 $C0 $C2
    add  hl, bc                                   ; $679D: $09
    ld   e, [hl]                                  ; $679E: $5E

jr_015_679F:
    ld   d, b                                     ; $679F: $50
    ld   hl, Data_015_676F                        ; $67A0: $21 $6F $67
    add  hl, de                                   ; $67A3: $19
    ld   a, [hl]                                  ; $67A4: $7E
    ldh  [hLinkPositionX], a                      ; $67A5: $E0 $98
    ld   hl, Data_015_6777                        ; $67A7: $21 $77 $67
    add  hl, de                                   ; $67AA: $19

jr_015_67AB:
    ld   a, [hl]                                  ; $67AB: $7E
    ldh  [hLinkPositionY], a                      ; $67AC: $E0 $99
    call GetEntityTransitionCountdown             ; $67AE: $CD $05 $0C
    rra                                           ; $67B1: $1F
    and  $0F                                      ; $67B2: $E6 $0F
    ld   e, a                                     ; $67B4: $5F
    ld   d, b                                     ; $67B5: $50
    ld   hl, Data_015_677F                        ; $67B6: $21 $7F $67
    add  hl, de                                   ; $67B9: $19
    ld   a, [hl]                                  ; $67BA: $7E
    call ApplyVectorTowardsLink_trampoline        ; $67BB: $CD $AA $3B
    ld   hl, hActiveEntityPosX                    ; $67BE: $21 $EE $FF

jr_015_67C1:
    ldh  a, [hLinkPositionX]                      ; $67C1: $F0 $98
    sub  [hl]                                     ; $67C3: $96
    add  $03                                      ; $67C4: $C6 $03

jr_015_67C6:
    cp   $06                                      ; $67C6: $FE $06
    jr   nc, jr_015_67D9                          ; $67C8: $30 $0F

    ld   hl, hActiveEntityVisualPosY              ; $67CA: $21 $EC $FF

jr_015_67CD:
    ldh  a, [hLinkPositionY]                      ; $67CD: $F0 $99
    sub  [hl]                                     ; $67CF: $96
    add  $03                                      ; $67D0: $C6 $03
    cp   $06                                      ; $67D2: $FE $06
    jr   nc, jr_015_67D9                          ; $67D4: $30 $03

    call IncrementEntityState                     ; $67D6: $CD $12 $3B

jr_015_67D9:
    pop  af                                       ; $67D9: $F1
    ldh  [hLinkPositionY], a                      ; $67DA: $E0 $99
    pop  af                                       ; $67DC: $F1
    ldh  [hLinkPositionX], a                      ; $67DD: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $67DF: $C3 $88 $7B

func_015_67E2::
    ret                                           ; $67E2: $C9

func_015_67E3::
    call GetEntityTransitionCountdown             ; $67E3: $CD $05 $0C
    jr   nz, jr_015_67F9                          ; $67E6: $20 $11

    ld   [hl], $40                                ; $67E8: $36 $40
    call func_015_542E                            ; $67EA: $CD $2E $54
    call IncrementEntityState                     ; $67ED: $CD $12 $3B
    ld   a, $00                                   ; $67F0: $3E $00
    call SetEntitySpriteVariant                   ; $67F2: $CD $0C $3B
    xor  a                                        ; $67F5: $AF
    ld   [wD224], a                               ; $67F6: $EA $24 $D2

jr_015_67F9:
    ret                                           ; $67F9: $C9

func_015_67FA::
    ld   a, $06                                   ; $67FA: $3E $06
    ldh  [hActiveEntitySpriteVariant], a          ; $67FC: $E0 $F1
    call func_015_572B                            ; $67FE: $CD $2B $57
    call GetEntityTransitionCountdown             ; $6801: $CD $05 $0C
    ret  nz                                       ; $6804: $C0

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6805: $21 $40 $C3
    add  hl, bc                                   ; $6808: $09
    res  6, [hl]                                  ; $6809: $CB $B6
    call IncrementEntityState                     ; $680B: $CD $12 $3B
    jp   ClearEntitySpeed                         ; $680E: $C3 $7F $3D

func_015_6811::
    call label_3B39                               ; $6811: $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ; $6814: $CD $88 $7B
    call label_3B23                               ; $6817: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $681A: $F0 $E7
    and  $01                                      ; $681C: $E6 $01
    jr   nz, jr_015_683F                          ; $681E: $20 $1F

    ld   a, $18                                   ; $6820: $3E $18
    call GetVectorTowardsLink_trampoline          ; $6822: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6825: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $6827: $21 $50 $C2
    sub  [hl]                                     ; $682A: $96
    bit  7, a                                     ; $682B: $CB $7F
    jr   z, jr_015_6831                           ; $682D: $28 $02

    dec  [hl]                                     ; $682F: $35
    dec  [hl]                                     ; $6830: $35

jr_015_6831:
    inc  [hl]                                     ; $6831: $34
    ldh  a, [hMultiPurpose1]                      ; $6832: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $6834: $21 $40 $C2
    sub  [hl]                                     ; $6837: $96
    bit  7, a                                     ; $6838: $CB $7F
    jr   z, jr_015_683E                           ; $683A: $28 $02

    dec  [hl]                                     ; $683C: $35
    dec  [hl]                                     ; $683D: $35

jr_015_683E:
    inc  [hl]                                     ; $683E: $34

jr_015_683F:
    ld   hl, wEntitiesFlashCountdownTable         ; $683F: $21 $20 $C4
    add  hl, bc                                   ; $6842: $09
    ld   a, [hl]                                  ; $6843: $7E
    and  a                                        ; $6844: $A7
    jr   z, jr_015_685F                           ; $6845: $28 $18

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6847: $21 $40 $C3
    add  hl, bc                                   ; $684A: $09
    set  6, [hl]                                  ; $684B: $CB $F6
    call GetEntityTransitionCountdown             ; $684D: $CD $05 $0C
    ld   [hl], $80                                ; $6850: $36 $80
    call label_27F2                               ; $6852: $CD $F2 $27
    ld   a, $10                                   ; $6855: $3E $10
    ldh  [hWaveSfx], a                            ; $6857: $E0 $F3
    call func_015_5383                            ; $6859: $CD $83 $53
    jp   IncrementEntityState                     ; $685C: $C3 $12 $3B

jr_015_685F:
    ld   hl, wEntitiesUnknowTableY                ; $685F: $21 $D0 $C3
    add  hl, bc                                   ; $6862: $09
    ld   a, [hl]                                  ; $6863: $7E
    inc  a                                        ; $6864: $3C
    ld   [hl], a                                  ; $6865: $77
    and  $07                                      ; $6866: $E6 $07
    ret  nz                                       ; $6868: $C0

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6869: $3E $E6
    call SpawnNewEntity_trampoline                ; $686B: $CD $86 $3B
    ret  c                                        ; $686E: $D8

    ldh  a, [hMultiPurpose0]                      ; $686F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6871: $21 $00 $C2
    add  hl, de                                   ; $6874: $19
    ld   [hl], a                                  ; $6875: $77
    ldh  a, [hMultiPurpose1]                      ; $6876: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6878: $21 $10 $C2
    add  hl, de                                   ; $687B: $19
    ld   [hl], a                                  ; $687C: $77
    ld   hl, wEntitiesPrivateState1Table          ; $687D: $21 $B0 $C2
    add  hl, de                                   ; $6880: $19
    ld   [hl], $03                                ; $6881: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6883: $21 $E0 $C2
    add  hl, de                                   ; $6886: $19
    ld   [hl], $1F                                ; $6887: $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6889: $21 $40 $C3
    add  hl, de                                   ; $688C: $19
    ld   [hl], $C2                                ; $688D: $36 $C2
    ld   hl, wEntitiesSpriteVariantTable          ; $688F: $21 $B0 $C3
    add  hl, de                                   ; $6892: $19
    ld   [hl], $01                                ; $6893: $36 $01
    ret                                           ; $6895: $C9

func_015_6896::
    call GetEntityTransitionCountdown             ; $6896: $CD $05 $0C
    cp   $01                                      ; $6899: $FE $01
    jr   nz, jr_015_68A1                          ; $689B: $20 $04

    dec  [hl]                                     ; $689D: $35
    jp   func_015_5128                            ; $689E: $C3 $28 $51

jr_015_68A1:
    and  a                                        ; $68A1: $A7
    ret  nz                                       ; $68A2: $C0

    ldh  a, [hLinkPositionX]                      ; $68A3: $F0 $98
    push af                                       ; $68A5: $F5
    ldh  a, [hLinkPositionY]                      ; $68A6: $F0 $99
    push af                                       ; $68A8: $F5
    ld   a, $50                                   ; $68A9: $3E $50
    ldh  [hLinkPositionX], a                      ; $68AB: $E0 $98
    ld   a, $30                                   ; $68AD: $3E $30
    ldh  [hLinkPositionY], a                      ; $68AF: $E0 $99
    ld   a, $0C                                   ; $68B1: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $68B3: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $68B6: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $68B9: $F0 $EC
    sub  [hl]                                     ; $68BB: $96
    add  $03                                      ; $68BC: $C6 $03
    cp   $06                                      ; $68BE: $FE $06
    jr   nc, jr_015_68D6                          ; $68C0: $30 $14

    ld   hl, hLinkPositionX                       ; $68C2: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $68C5: $F0 $EE
    sub  [hl]                                     ; $68C7: $96
    add  $03                                      ; $68C8: $C6 $03
    cp   $06                                      ; $68CA: $FE $06
    jr   nc, jr_015_68D6                          ; $68CC: $30 $08

    call GetEntityTransitionCountdown             ; $68CE: $CD $05 $0C
    ld   [hl], $5F                                ; $68D1: $36 $5F
    call IncrementEntityState                     ; $68D3: $CD $12 $3B

jr_015_68D6:
    pop  af                                       ; $68D6: $F1
    ldh  [hLinkPositionY], a                      ; $68D7: $E0 $99
    pop  af                                       ; $68D9: $F1
    ldh  [hLinkPositionX], a                      ; $68DA: $E0 $98
    jp   UpdateEntityPosWithSpeed_15                            ; $68DC: $C3 $88 $7B

Data_015_68DF::
    db   $00, $00, $00, $01, $01, $01, $02, $02

func_015_68E7::
    call GetEntityTransitionCountdown             ; $68E7: $CD $05 $0C
    jr   nz, jr_015_6914                          ; $68EA: $20 $28

    call ClearEntitySpeed                         ; $68EC: $CD $7F $3D
    call func_015_52BB                            ; $68EF: $CD $BB $52
    ld   hl, wEntitiesHealthTable                 ; $68F2: $21 $60 $C3
    add  hl, bc                                   ; $68F5: $09
    ld   [hl], $FF                                ; $68F6: $36 $FF
    ld   hl, wEntitiesPhysicsFlagsTable           ; $68F8: $21 $40 $C3
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], $00                                ; $68FC: $36 $00
    ld   hl, wEntitiesOptions1Table               ; $68FE: $21 $30 $C4
    add  hl, bc                                   ; $6901: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF                                ; $6902: $36 $C0
    call GetEntityDropTimer                       ; $6904: $CD $FB $0B
    ld   [hl], $90                                ; $6907: $36 $90
    xor  a                                        ; $6909: $AF
    ld   [wD223], a                               ; $690A: $EA $23 $D2
    ld   hl, wEntitiesPrivateCountdown2Table      ; $690D: $21 $00 $C3
    add  hl, bc                                   ; $6910: $09
    ld   [hl], $3F                                ; $6911: $36 $3F
    ret                                           ; $6913: $C9

jr_015_6914:
    cp   $20                                      ; $6914: $FE $20
    jr   c, jr_015_691A                           ; $6916: $38 $02

    ld   a, $1F                                   ; $6918: $3E $1F

jr_015_691A:
    rra                                           ; $691A: $1F
    rra                                           ; $691B: $1F
    and  $07                                      ; $691C: $E6 $07
    ld   e, a                                     ; $691E: $5F
    ld   d, b                                     ; $691F: $50
    ld   hl, Data_015_68DF                        ; $6920: $21 $DF $68
    add  hl, de                                   ; $6923: $19
    ld   a, [hl]                                  ; $6924: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $6925: $E0 $F1
    jp   func_015_572B                            ; $6927: $C3 $2B $57

func_015_692A::
    ldh  a, [hActiveEntityState]                  ; $692A: $F0 $F0
    cp   $0A                                      ; $692C: $FE $0A
    ret  nc                                       ; $692E: $D0

    ldh  a, [hActiveEntitySpriteVariant]          ; $692F: $F0 $F1
    inc  a                                        ; $6931: $3C
    ret  z                                        ; $6932: $C8

    ld   a, [wD21E]                               ; $6933: $FA $1E $D2
    and  a                                        ; $6936: $A7
    ldh  a, [hActiveEntitySpriteVariant]          ; $6937: $F0 $F1
    jr   z, jr_015_693D                           ; $6939: $28 $02

    add  $05                                      ; $693B: $C6 $05

jr_015_693D:
    ldh  [hActiveEntitySpriteVariant], a          ; $693D: $E0 $F1
    call func_015_69D2                            ; $693F: $CD $D2 $69
    call func_015_6A69                            ; $6942: $CD $69 $6A
    jp   func_015_6C10                            ; $6945: $C3 $10 $6C

Data_015_6948::
    db   $F8, $FC, $50, $00, $F8, $04, $52, $00, $F8, $0C, $6E, $00, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $FB, $FE, $50, $00, $FB, $06, $52, $00, $FB, $0E, $6E, $00, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $F8, $FC, $6E, $20, $F8, $04, $52, $20, $F8, $0C, $50, $20, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $FB, $FA, $6E, $20, $FB, $02, $52, $20, $FB, $0A, $50, $20, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF

Data_015_69C8::
    db   $00, $00, $02, $01, $00, $02, $02, $00, $03, $02

func_015_69D2::
    ldh  a, [hActiveEntitySpriteVariant]          ; $69D2: $F0 $F1
    ld   e, a                                     ; $69D4: $5F
    ld   d, b                                     ; $69D5: $50
    ld   hl, Data_015_69C8                        ; $69D6: $21 $C8 $69
    add  hl, de                                   ; $69D9: $19
    ld   a, [hl]                                  ; $69DA: $7E
    rla                                           ; $69DB: $17
    rla                                           ; $69DC: $17
    rla                                           ; $69DD: $17
    rla                                           ; $69DE: $17
    rla                                           ; $69DF: $17
    and  $70                                      ; $69E0: $E6 $70
    ld   e, a                                     ; $69E2: $5F
    ld   hl, Data_015_6948                        ; $69E3: $21 $48 $69
    add  hl, de                                   ; $69E6: $19
    ld   c, $07                                   ; $69E7: $0E $07
    call RenderActiveEntitySpritesRect            ; $69E9: $CD $E6 $3C
    ld   a, $07                                   ; $69EC: $3E $07
    jp   label_3DA0                               ; $69EE: $C3 $A0 $3D

Data_015_69F1::
    db   $F4, $F8, $64, $00, $FE, $11, $60, $00, $FE, $19, $62, $00, $F4, $F9, $64, $00
    db   $FE, $11, $60, $00, $FE, $19, $62, $00, $F0, $00, $64, $20, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $10, $60, $00, $FB, $18, $62, $00
    db   $00, $F8, $66, $00, $FE, $10, $66, $20, $FF, $FF, $FF, $FF, $F4, $10, $64, $20
    db   $FE, $EF, $62, $20, $FE, $F7, $60, $20, $F4, $0F, $64, $20, $FE, $EF, $62, $20
    db   $FE, $F7, $60, $20, $F0, $08, $64, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FB, $F0, $62, $20, $FB, $F8, $60, $20, $FE, $F8, $66, $00
    db   $00, $10, $66, $20, $FF, $FF, $FF, $FF

func_015_6A69::
    ldh  a, [hActiveEntitySpriteVariant]          ; $6A69: $F0 $F1
    rla                                           ; $6A6B: $17
    rla                                           ; $6A6C: $17
    and  $FC                                      ; $6A6D: $E6 $FC
    ld   e, a                                     ; $6A6F: $5F
    rla                                           ; $6A70: $17
    and  $F8                                      ; $6A71: $E6 $F8
    add  e                                        ; $6A73: $83
    ld   e, a                                     ; $6A74: $5F
    ld   d, b                                     ; $6A75: $50
    ld   hl, Data_015_69F1                        ; $6A76: $21 $F1 $69
    add  hl, de                                   ; $6A79: $19
    ld   c, $03                                   ; $6A7A: $0E $03
    call RenderActiveEntitySpritesRect            ; $6A7C: $CD $E6 $3C
    ld   a, $03                                   ; $6A7F: $3E $03
    jp   label_3DA0                               ; $6A81: $C3 $A0 $3D

Data_015_6A84::
    db   $EC, $00, $70, $00, $EC, $08, $70, $20, $F4, $00, $7C, $00, $F4, $08, $7C, $20
    db   $08, $00, $7C, $40, $08, $08, $7C, $60, $14, $00, $70, $40, $14, $08, $70, $60
    db   $00, $00, $7E, $40, $00, $08, $7E, $20, $F3, $0D, $78, $20, $F3, $15, $76, $20
    db   $0D, $F3, $76, $40, $0D, $FB, $78, $40, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $EC, $72, $00, $00, $F4, $74, $00, $00, $FC, $7A, $00, $00, $0C, $7A, $00
    db   $00, $14, $74, $20, $00, $1C, $72, $20, $00, $00, $FF, $FF, $00, $00, $FF, $FF
    db   $00, $00, $7E, $00, $00, $08, $7E, $60, $F3, $F3, $76, $00, $F3, $FB, $78, $00
    db   $0D, $0D, $78, $60, $0D, $15, $76, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F1, $0F, $78, $20, $F1, $17, $76, $20, $0D, $F3, $76, $40, $0D, $FB, $78, $40
    db   $00, $00, $FF, $FF, $00, $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F1, $F1, $76, $00, $F1, $F9, $78, $00, $0D, $0D, $78, $60, $0D, $15, $76, $60
    db   $00, $00, $FF, $FF, $00, $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $08, $78, $20, $F8, $10, $76, $20, $08, $F8, $76, $40, $08, $00, $78, $40
    db   $00, $00, $FF, $40, $00, $08, $FF, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FC, $04, $78, $20, $FC, $0C, $76, $20, $04, $FC, $76, $40, $04, $04, $78, $40
    db   $00, $00, $FF, $40, $00, $08, $FF, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $F8, $76, $00, $F8, $00, $78, $00, $08, $08, $78, $60, $08, $10, $76, $60
    db   $00, $00, $FF, $00, $00, $08, $FF, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FC, $FC, $76, $00, $FC, $04, $78, $00, $04, $04, $78, $60, $04, $0C, $76, $60
    db   $00, $00, $FF, $00, $00, $08, $FF, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $F8, $72, $00, $00, $00, $74, $00, $00, $08, $74, $20, $00, $10, $72, $20
    db   $00, $08, $FF, $FF, $00, $10, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF
    db   $00, $FB, $72, $00, $00, $03, $74, $00, $00, $05, $74, $20, $00, $0D, $72, $20
    db   $00, $FC, $FF, $FF, $00, $0C, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF

Data_015_6C04::
    db   $08, $06, $06, $06, $04, $04, $04, $04, $04, $04, $04, $04

func_015_6C10::
    ld   a, [wD224]                               ; $6C10: $FA $24 $D2
    and  a                                        ; $6C13: $A7
    ret  z                                        ; $6C14: $C8

    ld   a, [wD225]                               ; $6C15: $FA $25 $D2
    ld   hl, hActiveEntityPosX                    ; $6C18: $21 $EE $FF
    add  [hl]                                     ; $6C1B: $86
    ld   [hl], a                                  ; $6C1C: $77
    ld   a, [wD226]                               ; $6C1D: $FA $26 $D2
    ld   hl, hActiveEntityVisualPosY              ; $6C20: $21 $EC $FF
    add  [hl]                                     ; $6C23: $86
    ld   [hl], a                                  ; $6C24: $77
    ld   a, [wD224]                               ; $6C25: $FA $24 $D2
    dec  a                                        ; $6C28: $3D
    ld   e, a                                     ; $6C29: $5F
    ld   d, b                                     ; $6C2A: $50
    ld   hl, Data_015_6C04                        ; $6C2B: $21 $04 $6C
    add  hl, de                                   ; $6C2E: $19
    ld   c, [hl]                                  ; $6C2F: $4E
    ld   d, b                                     ; $6C30: $50
    sla  e                                        ; $6C31: $CB $23
    rl   d                                        ; $6C33: $CB $12
    sla  e                                        ; $6C35: $CB $23
    rl   d                                        ; $6C37: $CB $12
    sla  e                                        ; $6C39: $CB $23
    rl   d                                        ; $6C3B: $CB $12
    sla  e                                        ; $6C3D: $CB $23
    rl   d                                        ; $6C3F: $CB $12
    sla  e                                        ; $6C41: $CB $23
    rl   d                                        ; $6C43: $CB $12
    ld   a, e                                     ; $6C45: $7B
    and  $E0                                      ; $6C46: $E6 $E0
    ld   e, a                                     ; $6C48: $5F
    ld   hl, Data_015_6A84                        ; $6C49: $21 $84 $6A
    add  hl, de                                   ; $6C4C: $19
    push bc                                       ; $6C4D: $C5
    call RenderActiveEntitySpritesRect            ; $6C4E: $CD $E6 $3C
    pop  de                                       ; $6C51: $D1
    ld   a, e                                     ; $6C52: $7B
    call label_3DA0                               ; $6C53: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $6C56: $C3 $8A $3D

Data_015_6C59::
    db   $03, $02, $01, $00

Data_015_6C5D::
    db   $00, $01, $02, $03

label_015_6C61:
    ld   a, [$D201]                               ; $6C61: $FA $01 $D2
    ld   e, a                                     ; $6C64: $5F
    ld   d, b                                     ; $6C65: $50
    ld   hl, wEntitiesStateTable                  ; $6C66: $21 $90 $C2
    add  hl, de                                   ; $6C69: $19
    ld   a, [hl]                                  ; $6C6A: $7E
    cp   $09                                      ; $6C6B: $FE $09
    jp   nc, ClearEntityStatus_15                       ; $6C6D: $D2 $31 $7C

    ld   hl, wEntitiesUnknowTableY                ; $6C70: $21 $D0 $C3
    add  hl, bc                                   ; $6C73: $09
    ld   a, [hl]                                  ; $6C74: $7E
    rra                                           ; $6C75: $1F
    rra                                           ; $6C76: $1F
    rra                                           ; $6C77: $1F
    and  $03                                      ; $6C78: $E6 $03
    ld   e, a                                     ; $6C7A: $5F
    ld   d, b                                     ; $6C7B: $50
    ld   hl, wEntitiesDirectionTable              ; $6C7C: $21 $80 $C3
    add  hl, bc                                   ; $6C7F: $09
    ld   a, [hl]                                  ; $6C80: $7E
    and  a                                        ; $6C81: $A7
    ld   hl, Data_015_6C59                        ; $6C82: $21 $59 $6C
    jr   z, jr_015_6C8A                           ; $6C85: $28 $03

    ld   hl, Data_015_6C5D                        ; $6C87: $21 $5D $6C

jr_015_6C8A:
    add  hl, de                                   ; $6C8A: $19
    ld   a, [hl]                                  ; $6C8B: $7E
    inc  a                                        ; $6C8C: $3C
    ld   [wD224], a                               ; $6C8D: $EA $24 $D2
    xor  a                                        ; $6C90: $AF
    ld   [wD225], a                               ; $6C91: $EA $25 $D2
    ld   [wD226], a                               ; $6C94: $EA $26 $D2
    call func_015_6C10                            ; $6C97: $CD $10 $6C
    xor  a                                        ; $6C9A: $AF
    ld   [wD224], a                               ; $6C9B: $EA $24 $D2
    call func_015_7B0D                            ; $6C9E: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $6CA1: $F0 $E7
    and  $0F                                      ; $6CA3: $E6 $0F
    jr   nz, jr_015_6CAB                          ; $6CA5: $20 $04

    ld   a, $3A                                   ; $6CA7: $3E $3A
    ldh  [hNoiseSfx], a                           ; $6CA9: $E0 $F4

jr_015_6CAB:
    ld   hl, wEntitiesUnknowTableY                ; $6CAB: $21 $D0 $C3
    add  hl, bc                                   ; $6CAE: $09
    inc  [hl]                                     ; $6CAF: $34
    call UpdateEntityPosWithSpeed_15              ; $6CB0: $CD $88 $7B
    call label_3B44                               ; $6CB3: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $6CB6: $CD $05 $0C
    jr   z, jr_015_6CBC                           ; $6CB9: $28 $01

    ret                                           ; $6CBB: $C9

jr_015_6CBC:
    ldh  a, [hLinkPositionX]                      ; $6CBC: $F0 $98
    push af                                       ; $6CBE: $F5
    ldh  a, [hLinkPositionY]                      ; $6CBF: $F0 $99
    push af                                       ; $6CC1: $F5
    ld   a, [$D201]                               ; $6CC2: $FA $01 $D2
    ld   e, a                                     ; $6CC5: $5F
    ld   d, b                                     ; $6CC6: $50
    ld   hl, wEntitiesPosXTable                   ; $6CC7: $21 $00 $C2
    add  hl, de                                   ; $6CCA: $19
    ld   a, [hl]                                  ; $6CCB: $7E
    ldh  [hLinkPositionX], a                      ; $6CCC: $E0 $98
    ld   hl, wEntitiesPosYTable                   ; $6CCE: $21 $10 $C2
    add  hl, de                                   ; $6CD1: $19
    ld   a, [hl]                                  ; $6CD2: $7E
    sub  $0C                                      ; $6CD3: $D6 $0C
    ldh  [hLinkPositionY], a                      ; $6CD5: $E0 $99
    ld   a, $10                                   ; $6CD7: $3E $10
    call GetVectorTowardsLink_trampoline          ; $6CD9: $CD $B5 $3B
    ld   hl, wEntitiesSpeedYTable                 ; $6CDC: $21 $50 $C2
    add  hl, bc                                   ; $6CDF: $09
    ldh  a, [hMultiPurpose0]                      ; $6CE0: $F0 $D7
    sub  [hl]                                     ; $6CE2: $96
    and  $80                                      ; $6CE3: $E6 $80
    jr   nz, jr_015_6CE9                          ; $6CE5: $20 $02

    inc  [hl]                                     ; $6CE7: $34
    inc  [hl]                                     ; $6CE8: $34

jr_015_6CE9:
    dec  [hl]                                     ; $6CE9: $35
    ld   hl, wEntitiesSpeedXTable                 ; $6CEA: $21 $40 $C2
    add  hl, bc                                   ; $6CED: $09
    ldh  a, [hMultiPurpose1]                      ; $6CEE: $F0 $D8
    sub  [hl]                                     ; $6CF0: $96
    and  $80                                      ; $6CF1: $E6 $80
    jr   nz, jr_015_6CF7                          ; $6CF3: $20 $02

    inc  [hl]                                     ; $6CF5: $34
    inc  [hl]                                     ; $6CF6: $34

jr_015_6CF7:
    dec  [hl]                                     ; $6CF7: $35
    ld   hl, hLinkPositionY                       ; $6CF8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $6CFB: $F0 $EC
    sub  [hl]                                     ; $6CFD: $96
    add  $03                                      ; $6CFE: $C6 $03
    cp   $06                                      ; $6D00: $FE $06
    jr   nc, jr_015_6D29                          ; $6D02: $30 $25

    ld   hl, hLinkPositionX                       ; $6D04: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $6D07: $F0 $EE
    sub  [hl]                                     ; $6D09: $96
    add  $03                                      ; $6D0A: $C6 $03
    cp   $06                                      ; $6D0C: $FE $06
    jr   nc, jr_015_6D29                          ; $6D0E: $30 $19

    ld   a, [$D201]                               ; $6D10: $FA $01 $D2
    ld   e, a                                     ; $6D13: $5F
    ld   d, b                                     ; $6D14: $50
    ld   hl, wEntitiesStateTable                  ; $6D15: $21 $90 $C2
    add  hl, de                                   ; $6D18: $19
    ld   a, [hl]                                  ; $6D19: $7E
    cp   $08                                      ; $6D1A: $FE $08
    jr   nz, jr_015_6D29                          ; $6D1C: $20 $0B

    ld   [hl], $03                                ; $6D1E: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6D20: $21 $E0 $C2
    add  hl, de                                   ; $6D23: $19
    ld   [hl], $4C                                ; $6D24: $36 $4C
    call ClearEntityStatus_15                        ; $6D26: $CD $31 $7C

jr_015_6D29:
    pop  af                                       ; $6D29: $F1
    ldh  [hLinkPositionY], a                      ; $6D2A: $E0 $99
    pop  af                                       ; $6D2C: $F1
    ldh  [hLinkPositionX], a                      ; $6D2D: $E0 $98
    ret                                           ; $6D2F: $C9

Data_015_6D30::
    db   $4A, $00, $4A, $20, $4C, $00, $4C, $20   ; $6D30
    db   $4E, $00, $4E, $20                       ; $6D38

Data_015_6D3C::
    db   $00, $00, $01, $01

label_015_6D40:
    ld   de, Data_015_6D30                        ; $6D40: $11 $30 $6D
    call RenderActiveEntitySpritesPair            ; $6D43: $CD $C0 $3B
    call func_015_7B0D                            ; $6D46: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $6D49: $CD $05 $0C
    jp   z, ClearEntityStatus_15            ; $6D4C: $CA $31 $7C

    rra                                           ; $6D4F: $1F
    rra                                           ; $6D50: $1F
    rra                                           ; $6D51: $1F
    and  $03                                      ; $6D52: $E6 $03
    ld   e, a                                     ; $6D54: $5F
    ld   d, b                                     ; $6D55: $50
    ld   hl, Data_015_6D3C                        ; $6D56: $21 $3C $6D
    add  hl, de                                   ; $6D59: $19
    ld   a, [hl]                                  ; $6D5A: $7E
    jp   SetEntitySpriteVariant                   ; $6D5B: $C3 $0C $3B

Data_015_6D5E::
    db   $1E, $00, $1E, $60, $34, $00, $34, $20, $54, $00, $54, $20, $56, $00, $56, $20

label_015_6D6E:
    ldh  a, [hFrameCounter]                       ; $6D6E: $F0 $E7
    rla                                           ; $6D70: $17
    rla                                           ; $6D71: $17
    and  OAMF_PAL1 ; $6D72: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $6D74: $E0 $ED
    ld   de, Data_015_6D5E                        ; $6D76: $11 $5E $6D
    call RenderActiveEntitySpritesPair            ; $6D79: $CD $C0 $3B
    call func_015_7B0D                            ; $6D7C: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6D7F: $F0 $F0

jr_015_6D81:
    JP_TABLE                                      ; $6D81
._00 dw func_015_6D86                             ; $6D82
._01 dw func_015_6D9C                             ; $6D84

func_015_6D86::
    call GetEntityTransitionCountdown             ; $6D86: $CD $05 $0C
    jr   nz, jr_015_6D90                          ; $6D89: $20 $05

    ld   [hl], $20                                ; $6D8B: $36 $20
    jp   IncrementEntityState                     ; $6D8D: $C3 $12 $3B

jr_015_6D90:
    ld   e, $00                                   ; $6D90: $1E $00
    cp   $18                                      ; $6D92: $FE $18
    jr   nc, jr_015_6D98                          ; $6D94: $30 $02

    ld   e, $01                                   ; $6D96: $1E $01

jr_015_6D98:
    ld   a, e                                     ; $6D98: $7B
    jp   SetEntitySpriteVariant                   ; $6D99: $C3 $0C $3B

func_015_6D9C::
    ldh  a, [hFrameCounter]                       ; $6D9C: $F0 $E7
    rra                                           ; $6D9E: $1F
    rra                                           ; $6D9F: $1F
    rra                                           ; $6DA0: $1F
    and  $01                                      ; $6DA1: $E6 $01
    add  $02                                      ; $6DA3: $C6 $02
    call SetEntitySpriteVariant                   ; $6DA5: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DA8: $CD $05 $0C
    cp   $01                                      ; $6DAB: $FE $01
    jr   nz, jr_015_6DB8                          ; $6DAD: $20 $09

    ld   a, $28                                   ; $6DAF: $3E $28
    ldh  [hNoiseSfx], a                           ; $6DB1: $E0 $F4
    ld   a, $30                                   ; $6DB3: $3E $30
    call ApplyVectorTowardsLink_trampoline        ; $6DB5: $CD $AA $3B

jr_015_6DB8:
    ldh  a, [hFrameCounter]                       ; $6DB8: $F0 $E7
    xor  c                                        ; $6DBA: $A9

jr_015_6DBB:
    rra                                           ; $6DBB: $1F
    jr   nc, jr_015_6DC4                          ; $6DBC: $30 $06

    call UpdateEntityPosWithSpeed_15              ; $6DBE: $CD $88 $7B

jr_015_6DC1:
    call label_3B44                               ; $6DC1: $CD $44 $3B

jr_015_6DC4:
    ldh  a, [hActiveEntityPosX]                   ; $6DC4: $F0 $EE
    cp   $A8                                      ; $6DC6: $FE $A8
    jp   nc, ClearEntityStatus_15                       ; $6DC8: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $6DCB: $F0 $EC
    cp   $88                                      ; $6DCD: $FE $88
    jp   nc, ClearEntityStatus_15                       ; $6DCF: $D2 $31 $7C

    ret                                           ; $6DD2: $C9

Data_015_6DD3::
    db   $01, $02, $03, $03, $03, $03, $02, $01

Data_015_6DDB::
    db   $20, $23, $26, $29, $2C, $2F, $32, $35, $38, $38, $38, $38, $38, $38, $38, $38
    db   $38, $38, $38, $38, $38, $38, $38, $38

Data_015_6DF3::
    db   $20, $23, $26, $29, $2C, $2F, $32, $34, $34, $34, $34, $34, $34, $34, $34, $34
    db   $34, $34, $34, $34, $34, $34, $34, $34

Data_015_6E0B::
    db   $28, $27, $26, $25, $24, $23, $22, $21, $20, $1F, $1E, $1D, $1C, $1B, $1A, $19
    db   $18, $18, $18, $18, $18, $18, $18, $18

Data_015_6E23::
    db   $03, $02, $01, $00, $00, $00, $00, $00

FinalNightmareForm6Handler::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6E2B: $21 $00 $C3
    add  hl, bc                                   ; $6E2E: $09
    ld   a, [hl]                                  ; $6E2F: $7E
    and  a                                        ; $6E30: $A7
    jr   z, jr_015_6E4E                           ; $6E31: $28 $1B

    cp   $10                                      ; $6E33: $FE $10

jr_015_6E35:
    jr   nz, jr_015_6E3D                          ; $6E35: $20 $06

jr_015_6E37:
    dec  [hl]                                     ; $6E37: $35
    call func_015_52B1                            ; $6E38: $CD $B1 $52

jr_015_6E3B:
    ld   a, $10                                   ; $6E3B: $3E $10

jr_015_6E3D:
    rra                                           ; $6E3D: $1F
    rra                                           ; $6E3E: $1F
    rra                                           ; $6E3F: $1F
    and  $07                                      ; $6E40: $E6 $07
    ld   e, a                                     ; $6E42: $5F
    ld   d, b                                     ; $6E43: $50
    ld   hl, Data_015_6E23                        ; $6E44: $21 $23 $6E
    add  hl, de                                   ; $6E47: $19
    ld   a, [hl]                                  ; $6E48: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $6E49: $E0 $F1
    jp   func_015_572B                            ; $6E4B: $C3 $2B $57

jr_015_6E4E:
    call func_015_7056                            ; $6E4E: $CD $56 $70
IF !__PATCH_0__
    ldh  a, [hActiveEntityState]                  ; $6E51: $F0 $F0
    and  a                                        ; $6E53: $A7
    jr   z, jr_015_6E5A                           ; $6E54: $28 $04

    xor  a                                        ; $6E56: $AF
    ld   [wSubtractHealthBuffer], a               ; $6E57: $EA $94 $DB
ENDC

jr_015_6E5A:
    call func_015_7B0D                            ; $6E5A: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6E5D: $F0 $F0
    JP_TABLE                                      ; $6E5F
._00 dw func_015_6E66                             ; $6E60
._01 dw func_015_6FA1                             ; $6E62
._02 dw func_015_6FBC                             ; $6E64

; After a boss is defeated??? Scream and defeated boss' dialog
func_015_6E66::
    ld   hl, wEntitiesHealthTable                 ; $6E66: $21 $60 $C3
    add  hl, bc                                   ; $6E69: $09
    ld   a, [hl]                                  ; $6E6A: $7E
    cp   $F0                                      ; $6E6B: $FE $F0
    jr   nc, jr_015_6E9B                          ; $6E6D: $30 $2C

    ld   a, $03                                   ; $6E6F: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $6E71: $EA $A7 $C5
    call_open_dialog $0F6                         ; $6E74
    ld   a, MUSIC_BOSS_WARNING                    ; $6E79: $3E $5E
    ld   [wMusicTrackToPlay], a                   ; $6E7B: $EA $68 $D3
    call GetEntityTransitionCountdown             ; $6E7E: $CD $05 $0C
    ld   [hl], $80                                ; $6E81: $36 $80
    ld   hl, wEntitiesFlashCountdownTable         ; $6E83: $21 $20 $C4
    add  hl, bc                                   ; $6E86: $09
    ld   [hl], $80                                ; $6E87: $36 $80
    ld   hl, wEntitiesHitboxFlagsTable            ; $6E89: $21 $50 $C3
    add  hl, bc                                   ; $6E8C: $09
    res  7, [hl]                                  ; $6E8D: $CB $BE
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6E8F: $21 $40 $C3
    add  hl, bc                                   ; $6E92: $09
    set  6, [hl]                                  ; $6E93: $CB $F6
    call label_27F2                               ; $6E95: $CD $F2 $27
    jp   IncrementEntityState                     ; $6E98: $C3 $12 $3B

; Miniboss initalization???
jr_015_6E9B:
    ldh  a, [hFrameCounter]                       ; $6E9B: $F0 $E7
    and  $0F                                      ; $6E9D: $E6 $0F
    jr   nz, jr_015_6EB5                          ; $6E9F: $20 $14

    ld   a, [wD223]                               ; $6EA1: $FA $23 $D2
    cp   $04                                      ; $6EA4: $FE $04
    jr   nc, jr_015_6EB5                          ; $6EA6: $30 $0D

    inc  a                                        ; $6EA8: $3C
    ld   [wD223], a                               ; $6EA9: $EA $23 $D2
    cp   $01                                      ; $6EAC: $FE $01
    jr   nz, jr_015_6EB5                          ; $6EAE: $20 $05

    ld   hl, wMusicTrackToPlay                    ; $6EB0: $21 $68 $D3
    ld   [hl], MUSIC_MINIBOSS                     ; $6EB3: $36 $50

jr_015_6EB5:
    call DecrementEntityIgnoreHitsCountdown       ; $6EB5: $CD $56 $0C
    ld   hl, wEntitiesHealthTable                 ; $6EB8: $21 $60 $C3
    add  hl, bc                                   ; $6EBB: $09
    ld   a, [hl]                                  ; $6EBC: $7E
    cpl                                           ; $6EBD: $2F
    cp   $17                                      ; $6EBE: $FE $17
    jr   c, jr_015_6EC4                           ; $6EC0: $38 $02

    ld   a, $17                                   ; $6EC2: $3E $17

jr_015_6EC4:
    ld   e, a                                     ; $6EC4: $5F
    ld   d, b                                     ; $6EC5: $50
    ld   hl, Data_015_6DDB                        ; $6EC6: $21 $DB $6D
    add  hl, de                                   ; $6EC9: $19
    ld   a, [hl]                                  ; $6ECA: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6ECB: $21 $B0 $C2
    add  hl, bc                                   ; $6ECE: $09
    ld   [hl], a                                  ; $6ECF: $77
    ld   hl, Data_015_6DF3                        ; $6ED0: $21 $F3 $6D
    add  hl, de                                   ; $6ED3: $19
    ld   a, [hl]                                  ; $6ED4: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $6ED5: $21 $C0 $C2
    add  hl, bc                                   ; $6ED8: $09
    ld   [hl], a                                  ; $6ED9: $77
    ld   hl, Data_015_6E0B                        ; $6EDA: $21 $0B $6E
    add  hl, de                                   ; $6EDD: $19
    ld   a, [$D210]                               ; $6EDE: $FA $10 $D2
    inc  a                                        ; $6EE1: $3C
    cp   [hl]                                     ; $6EE2: $BE
    jr   c, jr_015_6EEA                           ; $6EE3: $38 $05

    ld   a, JINGLE_SHADOW_6_BG                    ; $6EE5: $3E $3D
    ldh  [hJingle], a                             ; $6EE7: $E0 $F2
    xor  a                                        ; $6EE9: $AF

jr_015_6EEA:
    ld   [$D210], a                               ; $6EEA: $EA $10 $D2
    ld   a, $00                                   ; $6EED: $3E $00
    call SetEntitySpriteVariant                   ; $6EEF: $CD $0C $3B
    call GetEntityDropTimer                       ; $6EF2: $CD $FB $0B
    jr   nz, jr_015_6F0B                          ; $6EF5: $20 $14

    call GetRandomByte                            ; $6EF7: $CD $0D $28
    and  $0F                                      ; $6EFA: $E6 $0F
    add  $20                                      ; $6EFC: $C6 $20
    ld   [hl], a                                  ; $6EFE: $77
    call GetRandomByte                            ; $6EFF: $CD $0D $28
    and  $01                                      ; $6F02: $E6 $01
    jr   nz, jr_015_6F0B                          ; $6F04: $20 $05

    call GetEntityPrivateCountdown1               ; $6F06: $CD $00 $0C
    ld   [hl], $7F                                ; $6F09: $36 $7F

jr_015_6F0B:
    ld   hl, wEntitiesHitboxFlagsTable            ; $6F0B: $21 $50 $C3
    add  hl, bc                                   ; $6F0E: $09
    set  7, [hl]                                  ; $6F0F: $CB $FE
    call GetEntityPrivateCountdown1               ; $6F11: $CD $00 $0C
    jr   z, jr_015_6F30                           ; $6F14: $28 $1A

    rra                                           ; $6F16: $1F
    rra                                           ; $6F17: $1F
    rra                                           ; $6F18: $1F
    rra                                           ; $6F19: $1F
    and  $07                                      ; $6F1A: $E6 $07
    ld   e, a                                     ; $6F1C: $5F
    ld   d, b                                     ; $6F1D: $50
    ld   hl, Data_015_6DD3                        ; $6F1E: $21 $D3 $6D
    add  hl, de                                   ; $6F21: $19
    ld   a, [hl]                                  ; $6F22: $7E
    call SetEntitySpriteVariant                   ; $6F23: $CD $0C $3B
    cp   $03                                      ; $6F26: $FE $03
    jr   nz, jr_015_6F30                          ; $6F28: $20 $06

    ld   hl, wEntitiesHitboxFlagsTable            ; $6F2A: $21 $50 $C3
    add  hl, bc                                   ; $6F2D: $09
    res  7, [hl]                                  ; $6F2E: $CB $BE

jr_015_6F30:
    call label_3B39                               ; $6F30: $CD $39 $3B
    ld   e, $0F                                   ; $6F33: $1E $0F
    ld   hl, wEntitiesHealthTable                 ; $6F35: $21 $60 $C3
    add  hl, bc                                   ; $6F38: $09
    ld   a, [hl]                                  ; $6F39: $7E
    cp   $F8                                      ; $6F3A: $FE $F8
    jr   nc, jr_015_6F40                          ; $6F3C: $30 $02

    ld   e, $07                                   ; $6F3E: $1E $07

jr_015_6F40:
    ldh  a, [hFrameCounter]                       ; $6F40: $F0 $E7
    and  e                                        ; $6F42: $A3
    jr   nz, jr_015_6F70                          ; $6F43: $20 $2B

    ldh  a, [hLinkPositionY]                      ; $6F45: $F0 $99
    push af                                       ; $6F47: $F5
    sub  $20                                      ; $6F48: $D6 $20
    ldh  [hLinkPositionY], a                      ; $6F4A: $E0 $99
    ld   a, $08                                   ; $6F4C: $3E $08
    call GetVectorTowardsLink_trampoline          ; $6F4E: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6F51: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $6F53: $21 $50 $C2
    add  hl, bc                                   ; $6F56: $09
    sub  [hl]                                     ; $6F57: $96
    and  $80                                      ; $6F58: $E6 $80
    jr   nz, jr_015_6F5E                          ; $6F5A: $20 $02

    inc  [hl]                                     ; $6F5C: $34
    inc  [hl]                                     ; $6F5D: $34

jr_015_6F5E:
    dec  [hl]                                     ; $6F5E: $35
    ldh  a, [hMultiPurpose1]                      ; $6F5F: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $6F61: $21 $40 $C2
    add  hl, bc                                   ; $6F64: $09
    sub  [hl]                                     ; $6F65: $96
    and  $80                                      ; $6F66: $E6 $80
    jr   nz, jr_015_6F6C                          ; $6F68: $20 $02

    inc  [hl]                                     ; $6F6A: $34
    inc  [hl]                                     ; $6F6B: $34

jr_015_6F6C:
    dec  [hl]                                     ; $6F6C: $35
    pop  af                                       ; $6F6D: $F1
    ldh  [hLinkPositionY], a                      ; $6F6E: $E0 $99

jr_015_6F70:
    call UpdateEntityPosWithSpeed_15              ; $6F70: $CD $88 $7B
    call label_3B23                               ; $6F73: $CD $23 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $6F76: $21 $B0 $C2
    add  hl, bc                                   ; $6F79: $09
    ld   e, [hl]                                  ; $6F7A: $5E
    ld   hl, wEntitiesUnknowTableY                ; $6F7B: $21 $D0 $C3
    add  hl, bc                                   ; $6F7E: $09
    ld   a, [hl]                                  ; $6F7F: $7E
    add  e                                        ; $6F80: $83
    ld   [hl], a                                  ; $6F81: $77
    jr   nc, jr_015_6F8B                          ; $6F82: $30 $07

    ld   a, [wD221]                               ; $6F84: $FA $21 $D2
    inc  a                                        ; $6F87: $3C
    ld   [wD221], a                               ; $6F88: $EA $21 $D2

jr_015_6F8B:
    ld   hl, wEntitiesPrivateState2Table          ; $6F8B: $21 $C0 $C2
    add  hl, bc                                   ; $6F8E: $09
    ld   e, [hl]                                  ; $6F8F: $5E
    ld   hl, wEntitiesUnknownTableD               ; $6F90: $21 $D0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    add  e                                        ; $6F95: $83
    ld   [hl], a                                  ; $6F96: $77
    jr   nc, jr_015_6FA0                          ; $6F97: $30 $07

    ld   a, [wD222]                               ; $6F99: $FA $22 $D2
    dec  a                                        ; $6F9C: $3D
    ld   [wD222], a                               ; $6F9D: $EA $22 $D2

jr_015_6FA0:
    ret                                           ; $6FA0: $C9

func_015_6FA1::
    call GetEntityTransitionCountdown             ; $6FA1: $CD $05 $0C
    cp   $02                                      ; $6FA4: $FE $02
    jr   nz, jr_015_6FAD                          ; $6FA6: $20 $05

    ld   hl, wMusicTrackToPlay                    ; $6FA8: $21 $68 $D3
    ld   [hl], MUSIC_FINAL_BOSS_DEFEATED          ; $6FAB: $36 $5F

jr_015_6FAD:
    and  a                                        ; $6FAD: $A7
    ret  nz                                       ; $6FAE: $C0

    ld   [hl], $80                                ; $6FAF: $36 $80
    ld   a, $3D                                   ; $6FB1: $3E $3D
    ldh  [hNoiseSfx], a                           ; $6FB3: $E0 $F4
    ld   a, $10                                   ; $6FB5: $3E $10
    ldh  [hWaveSfx], a                            ; $6FB7: $E0 $F3
    jp   IncrementEntityState                     ; $6FB9: $C3 $12 $3B

func_015_6FBC::
    call GetEntityTransitionCountdown             ; $6FBC: $CD $05 $0C
    and  $0F                                      ; $6FBF: $E6 $0F
    jr   nz, jr_015_6FF5                          ; $6FC1: $20 $32

    ld   a, [wD223]                               ; $6FC3: $FA $23 $D2
    cp   $00                                      ; $6FC6: $FE $00
    jr   nz, jr_015_6FF1                          ; $6FC8: $20 $27

    call PlayBombExplosionSfx                     ; $6FCA: $CD $4B $0C
    call func_015_5383                            ; $6FCD: $CD $83 $53
    call ClearEntityStatus_15                        ; $6FD0: $CD $31 $7C
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6FD3: $3E $E6
    call SpawnNewEntity_trampoline                ; $6FD5: $CD $86 $3B
    ld   hl, wEntitiesUnknowTableR                ; $6FD8: $21 $90 $C3
    add  hl, de                                   ; $6FDB: $19
    ld   [hl], $02                                ; $6FDC: $36 $02
    ld   hl, wEntitiesPosYTable                   ; $6FDE: $21 $10 $C2
    add  hl, de                                   ; $6FE1: $19
    ld   [hl], $30                                ; $6FE2: $36 $30
    ld   hl, wEntitiesPosXTable                   ; $6FE4: $21 $00 $C2
    add  hl, de                                   ; $6FE7: $19
    ld   [hl], $50                                ; $6FE8: $36 $50
    ld   hl, wEntitiesSpriteVariantTable          ; $6FEA: $21 $B0 $C3
    add  hl, de                                   ; $6FED: $19
    ld   [hl], $FF                                ; $6FEE: $36 $FF
    ret                                           ; $6FF0: $C9

jr_015_6FF1:
    dec  a                                        ; $6FF1: $3D
    ld   [wD223], a                               ; $6FF2: $EA $23 $D2

jr_015_6FF5:
    ret                                           ; $6FF5: $C9

Data_015_6FF6::
    db   $F0, $FC, $60, $00, $F0, $04, $62, $00, $F0, $0C, $60, $20, $F0, $FC, $64, $00
    db   $F0, $04, $66, $00, $F0, $0C, $64, $20, $F0, $FC, $68, $00, $F0, $04, $6A, $00
    db   $F0, $0C, $68, $20, $F0, $FC, $64, $00, $F0, $04, $66, $00, $F0, $0C, $64, $20

Data_015_7026::
    db   $00, $FC, $6C, $00, $00, $04, $6E, $00, $00, $0C, $6C, $20, $00, $FC, $70, $00
    db   $00, $04, $72, $00, $00, $0C, $70, $20, $00, $FC, $74, $00, $00, $04, $76, $00
    db   $00, $0C, $74, $20, $00, $FC, $78, $00, $00, $04, $7A, $00, $00, $0C, $78, $20

func_015_7056::
    ldh  a, [hFrameCounter]                       ; $7056: $F0 $E7
    rra                                           ; $7058: $1F
    rra                                           ; $7059: $1F
    rra                                           ; $705A: $1F
    and  $03                                      ; $705B: $E6 $03
    rla                                           ; $705D: $17
    rla                                           ; $705E: $17
    and  $FC                                      ; $705F: $E6 $FC
    ld   e, a                                     ; $7061: $5F
    rla                                           ; $7062: $17
    and  $F8                                      ; $7063: $E6 $F8
    add  e                                        ; $7065: $83
    ld   e, a                                     ; $7066: $5F
    ld   d, b                                     ; $7067: $50
    ld   hl, Data_015_6FF6                        ; $7068: $21 $F6 $6F
    add  hl, de                                   ; $706B: $19
    ld   c, $03                                   ; $706C: $0E $03
    call RenderActiveEntitySpritesRect            ; $706E: $CD $E6 $3C
    ld   a, $03                                   ; $7071: $3E $03
    call label_3DA0                               ; $7073: $CD $A0 $3D
    ldh  a, [hActiveEntitySpriteVariant]          ; $7076: $F0 $F1
    rla                                           ; $7078: $17
    rla                                           ; $7079: $17
    and  $FC                                      ; $707A: $E6 $FC
    ld   e, a                                     ; $707C: $5F
    rla                                           ; $707D: $17
    and  $F8                                      ; $707E: $E6 $F8
    add  e                                        ; $7080: $83
    ld   e, a                                     ; $7081: $5F
    ld   d, b                                     ; $7082: $50
    ld   hl, Data_015_7026                        ; $7083: $21 $26 $70
    add  hl, de                                   ; $7086: $19
    ld   c, $03                                   ; $7087: $0E $03
    call RenderActiveEntitySpritesRect            ; $7089: $CD $E6 $3C
    ld   a, $03                                   ; $708C: $3E $03
    call label_3DA0                               ; $708E: $CD $A0 $3D
    ld   hl, wEntitiesPosYTable                   ; $7091: $21 $10 $C2
    add  hl, bc                                   ; $7094: $09
    ld   a, [hl]                                  ; $7095: $7E
    push af                                       ; $7096: $F5
    push hl                                       ; $7097: $E5
    sub  $08                                      ; $7098: $D6 $08
    ld   [hl], a                                  ; $709A: $77
    call CopyEntityPositionToActivePosition       ; $709B: $CD $8A $3D
    call func_015_717B                            ; $709E: $CD $7B $71
    pop  hl                                       ; $70A1: $E1
    pop  af                                       ; $70A2: $F1
    ld   [hl], a                                  ; $70A3: $77
    jp   CopyEntityPositionToActivePosition       ; $70A4: $C3 $8A $3D

Data_015_70A7::
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7

Data_015_70AF::
    db   $00, $09, $12, $1A, $21, $27, $2C, $2F, $30, $2F, $2C, $27, $21, $1A, $12, $09
    db   $00, $F7, $EE, $E6, $DF, $D9, $D4, $D1, $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7

Data_015_70CF::
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9

Data_015_70D7::
    db   $00, $07, $0E, $15, $1A, $1F, $23, $25, $26, $25, $23, $1F, $1A, $15, $0E, $07
    db   $00, $F9, $F2, $EB, $E6, $E1, $DD, $DB, $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9

Data_015_70F7::
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB

Data_015_70FF::
    db   $00, $05, $0A, $0F, $13, $17, $19, $1B, $1C, $1B, $19, $17, $13, $0F, $0A, $05
    db   $00, $FB, $F6, $F1, $ED, $E9, $E7, $E5, $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB

Data_015_711F::
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD

Data_015_7127::
    db   $00, $03, $06, $0A, $0C, $0E, $10, $11, $12, $11, $10, $0E, $0C, $0A, $06, $03
    db   $00, $FD, $FA, $F6, $F4, $F2, $F0, $EF, $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF, $00, $01, $03, $04, $05, $05, $06, $07
    db   $08, $07, $06, $05, $05, $04, $03, $01, $00, $FF, $FD, $FC, $FB, $FB, $FA, $F9
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF

Data_015_716F::
    db   $4E, $00, $4E, $20, $4C, $00, $4C, $20, $7C, $02, $7C, $22

func_015_717B::
    ld   a, [wD223]                               ; $717B: $FA $23 $D2
    cp   $04                                      ; $717E: $FE $04
    jr   c, jr_015_71A0                           ; $7180: $38 $1E

    ld   a, [wD221]                               ; $7182: $FA $21 $D2
    and  $1F                                      ; $7185: $E6 $1F
    ld   e, a                                     ; $7187: $5F
    ld   d, b                                     ; $7188: $50
    ld   hl, Data_015_70AF                        ; $7189: $21 $AF $70
    add  hl, de                                   ; $718C: $19
    ldh  a, [hActiveEntityPosX]                   ; $718D: $F0 $EE
    add  [hl]                                     ; $718F: $86
    ldh  [hActiveEntityPosX], a                   ; $7190: $E0 $EE
    ld   hl, Data_015_70A7                        ; $7192: $21 $A7 $70
    add  hl, de                                   ; $7195: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7196: $F0 $EC
    add  [hl]                                     ; $7198: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7199: $E0 $EC
    ld   a, $02                                   ; $719B: $3E $02
    call func_015_72CF                            ; $719D: $CD $CF $72

jr_015_71A0:
    ld   a, [wD223]                               ; $71A0: $FA $23 $D2
    cp   $03                                      ; $71A3: $FE $03
    jr   c, jr_015_71C5                           ; $71A5: $38 $1E

    ld   a, [wD221]                               ; $71A7: $FA $21 $D2
    and  $1F                                      ; $71AA: $E6 $1F
    ld   e, a                                     ; $71AC: $5F
    ld   d, b                                     ; $71AD: $50
    ld   hl, Data_015_70D7                        ; $71AE: $21 $D7 $70
    add  hl, de                                   ; $71B1: $19
    ldh  a, [hActiveEntityPosX]                   ; $71B2: $F0 $EE
    add  [hl]                                     ; $71B4: $86
    ldh  [hActiveEntityPosX], a                   ; $71B5: $E0 $EE
    ld   hl, Data_015_70CF                        ; $71B7: $21 $CF $70
    add  hl, de                                   ; $71BA: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $71BB: $F0 $EC
    add  [hl]                                     ; $71BD: $86
    ldh  [hActiveEntityVisualPosY], a             ; $71BE: $E0 $EC

jr_015_71C0:
    ld   a, $01                                   ; $71C0: $3E $01
    call func_015_72CF                            ; $71C2: $CD $CF $72

jr_015_71C5:
    ld   a, [wD223]                               ; $71C5: $FA $23 $D2
    cp   $02                                      ; $71C8: $FE $02
    jr   c, jr_015_71EA                           ; $71CA: $38 $1E

    ld   a, [wD221]                               ; $71CC: $FA $21 $D2
    and  $1F                                      ; $71CF: $E6 $1F
    ld   e, a                                     ; $71D1: $5F
    ld   d, b                                     ; $71D2: $50
    ld   hl, Data_015_70FF                        ; $71D3: $21 $FF $70
    add  hl, de                                   ; $71D6: $19
    ldh  a, [hActiveEntityPosX]                   ; $71D7: $F0 $EE
    add  [hl]                                     ; $71D9: $86
    ldh  [hActiveEntityPosX], a                   ; $71DA: $E0 $EE
    ld   hl, Data_015_70F7                        ; $71DC: $21 $F7 $70
    add  hl, de                                   ; $71DF: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $71E0: $F0 $EC
    add  [hl]                                     ; $71E2: $86
    ldh  [hActiveEntityVisualPosY], a             ; $71E3: $E0 $EC
    ld   a, $01                                   ; $71E5: $3E $01
    call func_015_72CF                            ; $71E7: $CD $CF $72

jr_015_71EA:
    ld   a, [wD223]                               ; $71EA: $FA $23 $D2
    cp   $01                                      ; $71ED: $FE $01
    jr   c, jr_015_7226                           ; $71EF: $38 $35

    ld   a, [wD221]                               ; $71F1: $FA $21 $D2

jr_015_71F4:
    and  $0F                                      ; $71F4: $E6 $0F
    cp   $07                                      ; $71F6: $FE $07
    jr   z, jr_015_7202                           ; $71F8: $28 $08

    cp   $08                                      ; $71FA: $FE $08
    jr   z, jr_015_7202                           ; $71FC: $28 $04

    cp   $09                                      ; $71FE: $FE $09
    jr   nz, jr_015_7208                          ; $7200: $20 $06

jr_015_7202:
    ldh  a, [hFrameCounter]                       ; $7202: $F0 $E7
    and  $01                                      ; $7204: $E6 $01
    jr   nz, jr_015_7226                          ; $7206: $20 $1E

jr_015_7208:
    ld   a, [wD221]                               ; $7208: $FA $21 $D2
    and  $1F                                      ; $720B: $E6 $1F
    ld   e, a                                     ; $720D: $5F
    ld   d, b                                     ; $720E: $50
    ld   hl, Data_015_7127                        ; $720F: $21 $27 $71
    add  hl, de                                   ; $7212: $19
    ldh  a, [hActiveEntityPosX]                   ; $7213: $F0 $EE
    add  [hl]                                     ; $7215: $86
    ldh  [hActiveEntityPosX], a                   ; $7216: $E0 $EE
    ld   hl, Data_015_711F                        ; $7218: $21 $1F $71
    add  hl, de                                   ; $721B: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $721C: $F0 $EC
    add  [hl]                                     ; $721E: $86
    ldh  [hActiveEntityVisualPosY], a             ; $721F: $E0 $EC
    ld   a, $00                                   ; $7221: $3E $00
    call func_015_72CF                            ; $7223: $CD $CF $72

jr_015_7226:
    ld   a, [wD223]                               ; $7226: $FA $23 $D2
    cp   $04                                      ; $7229: $FE $04
    jr   c, jr_015_724B                           ; $722B: $38 $1E

    ld   a, [wD222]                               ; $722D: $FA $22 $D2
    and  $1F                                      ; $7230: $E6 $1F
    ld   e, a                                     ; $7232: $5F
    ld   d, b                                     ; $7233: $50
    ld   hl, Data_015_70AF                        ; $7234: $21 $AF $70
    add  hl, de                                   ; $7237: $19
    ldh  a, [hActiveEntityPosX]                   ; $7238: $F0 $EE
    add  [hl]                                     ; $723A: $86
    ldh  [hActiveEntityPosX], a                   ; $723B: $E0 $EE
    ld   hl, Data_015_70A7                        ; $723D: $21 $A7 $70
    add  hl, de                                   ; $7240: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7241: $F0 $EC
    add  [hl]                                     ; $7243: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7244: $E0 $EC
    ld   a, $02                                   ; $7246: $3E $02
    call func_015_72CF                            ; $7248: $CD $CF $72

jr_015_724B:
    ld   a, [wD223]                               ; $724B: $FA $23 $D2
    cp   $03                                      ; $724E: $FE $03
    jr   c, jr_015_7270                           ; $7250: $38 $1E

    ld   a, [wD222]                               ; $7252: $FA $22 $D2
    and  $1F                                      ; $7255: $E6 $1F
    ld   e, a                                     ; $7257: $5F
    ld   d, b                                     ; $7258: $50
    ld   hl, Data_015_70D7                        ; $7259: $21 $D7 $70
    add  hl, de                                   ; $725C: $19
    ldh  a, [hActiveEntityPosX]                   ; $725D: $F0 $EE
    add  [hl]                                     ; $725F: $86
    ldh  [hActiveEntityPosX], a                   ; $7260: $E0 $EE
    ld   hl, Data_015_70CF                        ; $7262: $21 $CF $70
    add  hl, de                                   ; $7265: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7266: $F0 $EC
    add  [hl]                                     ; $7268: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7269: $E0 $EC
    ld   a, $01                                   ; $726B: $3E $01
    call func_015_72CF                            ; $726D: $CD $CF $72

jr_015_7270:
    ld   a, [wD223]                               ; $7270: $FA $23 $D2
    cp   $02                                      ; $7273: $FE $02
    jr   c, jr_015_7295                           ; $7275: $38 $1E

    ld   a, [wD222]                               ; $7277: $FA $22 $D2
    and  $1F                                      ; $727A: $E6 $1F
    ld   e, a                                     ; $727C: $5F
    ld   d, b                                     ; $727D: $50
    ld   hl, Data_015_70FF                        ; $727E: $21 $FF $70
    add  hl, de                                   ; $7281: $19
    ldh  a, [hActiveEntityPosX]                   ; $7282: $F0 $EE
    add  [hl]                                     ; $7284: $86
    ldh  [hActiveEntityPosX], a                   ; $7285: $E0 $EE
    ld   hl, Data_015_70F7                        ; $7287: $21 $F7 $70
    add  hl, de                                   ; $728A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $728B: $F0 $EC
    add  [hl]                                     ; $728D: $86
    ldh  [hActiveEntityVisualPosY], a             ; $728E: $E0 $EC
    ld   a, $01                                   ; $7290: $3E $01
    call func_015_72CF                            ; $7292: $CD $CF $72

jr_015_7295:
    ld   a, [wD223]                               ; $7295: $FA $23 $D2
    cp   $01                                      ; $7298: $FE $01
    ret  c                                        ; $729A: $D8

    ld   a, [wD222]                               ; $729B: $FA $22 $D2
    and  $0F                                      ; $729E: $E6 $0F
    cp   $07                                      ; $72A0: $FE $07
    jr   z, jr_015_72AC                           ; $72A2: $28 $08

    cp   $08                                      ; $72A4: $FE $08
    jr   z, jr_015_72AC                           ; $72A6: $28 $04

    cp   $09                                      ; $72A8: $FE $09
    jr   nz, jr_015_72B1                          ; $72AA: $20 $05

jr_015_72AC:
    ldh  a, [hFrameCounter]                       ; $72AC: $F0 $E7
    and  $01                                      ; $72AE: $E6 $01
    ret  z                                        ; $72B0: $C8

jr_015_72B1:
    ld   a, [wD222]                               ; $72B1: $FA $22 $D2
    and  $1F                                      ; $72B4: $E6 $1F
    ld   e, a                                     ; $72B6: $5F
    ld   d, b                                     ; $72B7: $50
    ld   hl, Data_015_7127                        ; $72B8: $21 $27 $71
    add  hl, de                                   ; $72BB: $19
    ldh  a, [hActiveEntityPosX]                   ; $72BC: $F0 $EE
    add  [hl]                                     ; $72BE: $86
    ldh  [hActiveEntityPosX], a                   ; $72BF: $E0 $EE
    ld   hl, Data_015_711F                        ; $72C1: $21 $1F $71
    add  hl, de                                   ; $72C4: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $72C5: $F0 $EC
    add  [hl]                                     ; $72C7: $86
    ldh  [hActiveEntityVisualPosY], a             ; $72C8: $E0 $EC
    ld   a, $00                                   ; $72CA: $3E $00
    jp   func_015_72CF                            ; $72CC: $C3 $CF $72

func_015_72CF::
    ldh  [hActiveEntitySpriteVariant], a          ; $72CF: $E0 $F1
    ld   de, Data_015_716F                        ; $72D1: $11 $6F $71
    call RenderActiveEntitySpritesPair            ; $72D4: $CD $C0 $3B
    ld   a, $02                                   ; $72D7: $3E $02
    call label_3DA0                               ; $72D9: $CD $A0 $3D

IF __PATCH_0__
    ldh  a, [hActiveEntityState]
    and  a
    jr   nz, jr_015_731D
ENDC

    ld   hl, hLinkPositionX                       ; $72DC: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $72DF: $F0 $EE
    sub  [hl]                                     ; $72E1: $96
    add  $08                                      ; $72E2: $C6 $08
    cp   $10                                      ; $72E4: $FE $10
    jr   nc, jr_015_731D                          ; $72E6: $30 $35

    ld   hl, hLinkPositionY                       ; $72E8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $72EB: $F0 $EC
    sub  [hl]                                     ; $72ED: $96
    add  $08                                      ; $72EE: $C6 $08
    cp   $10                                      ; $72F0: $FE $10
    jr   nc, jr_015_731D                          ; $72F2: $30 $29

    ld   hl, wIsLinkInTheAir                      ; $72F4: $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ; $72F7: $FA $C7 $DB
    or   [hl]                                     ; $72FA: $B6
    jr   nz, jr_015_731D                          ; $72FB: $20 $20

    ld   a, $08                                   ; $72FD: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $72FF: $EA $94 $DB
    ld   a, $20                                   ; $7302: $3E $20
    call GetVectorTowardsLink_trampoline          ; $7304: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7307: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $7309: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $730B: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $730D: $E0 $9A
    ld   a, $10                                   ; $730F: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7311: $EA $3E $C1
    ld   a, $30                                   ; $7314: $3E $30
    ld   [wInvincibilityCounter], a               ; $7316: $EA $C7 $DB
    ld   a, $03                                   ; $7319: $3E $03
    ldh  [hWaveSfx], a                            ; $731B: $E0 $F3

jr_015_731D:
    jp   CopyEntityPositionToActivePosition       ; $731D: $C3 $8A $3D

Data_015_7320::
    db   $58, $02, $58, $22, $5A, $02, $5A, $22

Data_015_7328::
    db   $10, $F0, $00, $00

Data_015_732C::
    db   $00, $00, $FB, $05

SandCrabEntityHandler::
    ld   de, Data_015_7320                        ; $7330: $11 $20 $73
    call RenderActiveEntitySpritesPair            ; $7333: $CD $C0 $3B
    call func_015_7B0D                            ; $7336: $CD $0D $7B
    call func_015_7B3E                            ; $7339: $CD $3E $7B
    call UpdateEntityPosWithSpeed_15              ; $733C: $CD $88 $7B
    call label_3B23                               ; $733F: $CD $23 $3B
    call label_3B39                               ; $7342: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $7345: $F0 $E7
    rra                                           ; $7347: $1F
    rra                                           ; $7348: $1F
    rra                                           ; $7349: $1F
    and  $01                                      ; $734A: $E6 $01
    call SetEntitySpriteVariant                   ; $734C: $CD $0C $3B
    ld   hl, wEntitiesCollisionsTable             ; $734F: $21 $A0 $C2
    add  hl, bc                                   ; $7352: $09
    ld   a, [hl]                                  ; $7353: $7E
    and  a                                        ; $7354: $A7
    jr   nz, jr_015_735C                          ; $7355: $20 $05

    call GetEntityTransitionCountdown             ; $7357: $CD $05 $0C
    jr   nz, jr_015_7382                          ; $735A: $20 $26

jr_015_735C:
    call GetEntityTransitionCountdown             ; $735C: $CD $05 $0C
    call GetRandomByte                            ; $735F: $CD $0D $28
    and  $7F                                      ; $7362: $E6 $7F
    add  $30                                      ; $7364: $C6 $30
    ld   [hl], a                                  ; $7366: $77
    call GetRandomByte                            ; $7367: $CD $0D $28
    and  $03                                      ; $736A: $E6 $03
    ld   e, a                                     ; $736C: $5F
    ld   d, b                                     ; $736D: $50
    ld   hl, Data_015_7328                        ; $736E: $21 $28 $73
    add  hl, de                                   ; $7371: $19
    ld   a, [hl]                                  ; $7372: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7373: $21 $40 $C2
    add  hl, bc                                   ; $7376: $09
    ld   [hl], a                                  ; $7377: $77
    ld   hl, Data_015_732C                        ; $7378: $21 $2C $73
    add  hl, de                                   ; $737B: $19
    ld   a, [hl]                                  ; $737C: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $737D: $21 $50 $C2
    add  hl, bc                                   ; $7380: $09
    ld   [hl], a                                  ; $7381: $77

jr_015_7382:
    ret                                           ; $7382: $C9

Data_015_7383::
    db   $5C, $03, $5E, $03, $5E, $23, $5C, $23, $5E, $63, $5C, $63, $5C, $43, $5E, $43

Data_015_7393::
    db   $2C, $03, $2E, $03, $2E, $23, $2C, $23, $2E, $63, $2C, $63, $2C, $43, $2E, $43

Data_015_73A3::
    db   $FD, $03, $00, $00

Data_015_73A7::
    db   $00, $00, $03, $FD

UrchinEntityHandler::
    ld   de, Data_015_7383                        ; $73AB: $11 $83 $73
    ld   a, [wGameplayType]                       ; $73AE: $FA $95 $DB
    cp   $01                                      ; $73B1: $FE $01
    jr   nz, jr_015_73B8                          ; $73B3: $20 $03

    ld   de, Data_015_7393                        ; $73B5: $11 $93 $73

jr_015_73B8:
    call RenderActiveEntitySpritesPair            ; $73B8: $CD $C0 $3B
    call func_015_7B0D                            ; $73BB: $CD $0D $7B
    call func_015_7B3E                            ; $73BE: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $73C1: $F0 $E7
    rra                                           ; $73C3: $1F
    rra                                           ; $73C4: $1F
    rra                                           ; $73C5: $1F
    rra                                           ; $73C6: $1F
    and  $03                                      ; $73C7: $E6 $03
    call SetEntitySpriteVariant                   ; $73C9: $CD $0C $3B
    call func_015_7C0A                            ; $73CC: $CD $0A $7C
    ld   hl, wEntitiesDirectionTable              ; $73CF: $21 $80 $C3
    add  hl, bc                                   ; $73D2: $09
    ld   [hl], e                                  ; $73D3: $73
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73D4: $21 $40 $C3
    add  hl, bc                                   ; $73D7: $09
    res  7, [hl]                                  ; $73D8: $CB $BE
    ld   a, [wIsUsingShield]                      ; $73DA: $FA $5B $C1
    and  a                                        ; $73DD: $A7
    jr   z, jr_015_73E9                           ; $73DE: $28 $09

    ldh  a, [hLinkDirection]                      ; $73E0: $F0 $9E
    xor  $01                                      ; $73E2: $EE $01
    cp   e                                        ; $73E4: $BB
    jr   nz, jr_015_73E9                          ; $73E5: $20 $02

    set  7, [hl]                                  ; $73E7: $CB $FE

jr_015_73E9:
    call CheckLinkCollisionWithEnemy_trampoline   ; $73E9: $CD $5A $3B
    jr   nc, jr_015_7428                          ; $73EC: $30 $3A

    call CopyLinkFinalPositionToPosition          ; $73EE: $CD $BE $0C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73F1: $21 $40 $C3
    add  hl, bc                                   ; $73F4: $09
    ld   a, [hl]                                  ; $73F5: $7E
    and  $80                                      ; $73F6: $E6 $80
    ret  z                                        ; $73F8: $C8

    ld   hl, wEntitiesDirectionTable              ; $73F9: $21 $80 $C3
    add  hl, bc                                   ; $73FC: $09
    ld   e, [hl]                                  ; $73FD: $5E
    ld   d, b                                     ; $73FE: $50
    ld   hl, Data_015_73A3                        ; $73FF: $21 $A3 $73
    add  hl, de                                   ; $7402: $19
    ld   a, [hl]                                  ; $7403: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7404: $21 $40 $C2
    add  hl, bc                                   ; $7407: $09

jr_015_7408:
    ld   [hl], a                                  ; $7408: $77
    ld   hl, Data_015_73A7                        ; $7409: $21 $A7 $73
    add  hl, de                                   ; $740C: $19
    ld   a, [hl]                                  ; $740D: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $740E: $21 $50 $C2
    add  hl, bc                                   ; $7411: $09
    ld   [hl], a                                  ; $7412: $77
    ld   a, JINGLE_URCHIN_PUSH                    ; $7413: $3E $3E
    ldh  [hJingle], a                             ; $7415: $E0 $F2
    call UpdateEntityPosWithSpeed_15              ; $7417: $CD $88 $7B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $741A: $21 $10 $C4
    add  hl, bc                                   ; $741D: $09
    ld   [hl], $03                                ; $741E: $36 $03
    call label_3B23                               ; $7420: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7423: $21 $10 $C4
    add  hl, bc                                   ; $7426: $09
    ld   [hl], b                                  ; $7427: $70

jr_015_7428:
    ld   a, [wC16A]                               ; $7428: $FA $6A $C1
    and  a                                        ; $742B: $A7
    jr   nz, jr_015_7433                          ; $742C: $20 $05

    ld   a, [wIsUsingShield]                      ; $742E: $FA $5B $C1
    and  a                                        ; $7431: $A7
    ret  nz                                       ; $7432: $C0

jr_015_7433:
    jp   label_3B70                               ; $7433: $C3 $70 $3B

Data_015_7436::
    db   $30, $D0

Entity68Handler::
    call func_015_7B0D                            ; $7438: $CD $0D $7B
    ld   hl, wEntitiesDirectionTable              ; $743B: $21 $80 $C3
    add  hl, bc                                   ; $743E: $09
    ld   e, [hl]                                  ; $743F: $5E
    ld   d, b                                     ; $7440: $50
    ld   hl, Data_015_7436                        ; $7441: $21 $36 $74
    add  hl, de                                   ; $7444: $19
    ld   a, [hl]                                  ; $7445: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7446: $21 $50 $C2
    add  hl, bc                                   ; $7449: $09
    ld   [hl], a                                  ; $744A: $77
    call UpdateEntityYPosWithSpeed_15             ; $744B: $CD $8B $7B
    call label_3B23                               ; $744E: $CD $23 $3B
    ldh  a, [hObjectUnderEntity]                  ; $7451: $F0 $AF
    cp   $9D                                      ; $7453: $FE $9D
    jr   z, jr_015_746A                           ; $7455: $28 $13

    ld   e, a                                     ; $7457: $5F
    ld   d, $01                                   ; $7458: $16 $01
    call GetObjectPhysicsFlags_trampoline         ; $745A: $CD $26 $2A
    and  a                                        ; $745D: $A7
    jr   nz, jr_015_746A                          ; $745E: $20 $0A

    call ClearEntityStatus_15                        ; $7460: $CD $31 $7C
    ld   hl, wEntitiesStatusTable                 ; $7463: $21 $80 $C2
    add  hl, bc                                   ; $7466: $09
    ld   a, [hl]                                  ; $7467: $7E
    ldh  [hActiveEntityStatus], a                 ; $7468: $E0 $EA

jr_015_746A:
    ldh  a, [hActiveEntityPosX]                   ; $746A: $F0 $EE
    sub  $08                                      ; $746C: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $746E: $E0 $CE
    swap a                                        ; $7470: $CB $37
    and  $0F                                      ; $7472: $E6 $0F
    ld   e, a                                     ; $7474: $5F
    ldh  a, [hActiveEntityVisualPosY]             ; $7475: $F0 $EC
    add  $04                                      ; $7477: $C6 $04
    sub  $10                                      ; $7479: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $747B: $E0 $CD
    and  $F0                                      ; $747D: $E6 $F0
    or   e                                        ; $747F: $B3
    ld   e, a                                     ; $7480: $5F
    ld   d, $00                                   ; $7481: $16 $00
    ld   hl, wRoomObjects                         ; $7483: $21 $11 $D7
    add  hl, de                                   ; $7486: $19
    ld   [hl], $9D                                ; $7487: $36 $9D
    call label_2887                               ; $7489: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $748C: $F0 $FE
    and  a                                        ; $748E: $A7
    jr   z, jr_015_749D                           ; $748F: $28 $0C

    push bc                                       ; $7491: $C5
    ld   a, $9D                                   ; $7492: $3E $9D
    ld   [wDDD8], a                               ; $7494: $EA $D8 $DD
    ld   a, $15                                   ; $7497: $3E $15
    call func_91D                                ; $7499: $CD $1D $09
    pop  bc                                       ; $749C: $C1

jr_015_749D:
    ld   hl, wRequestDestinationHigh              ; $749D: $21 $01 $D6
    ld   a, [wRequests]                           ; $74A0: $FA $00 $D6
    ld   e, a                                     ; $74A3: $5F
    add  $0A                                      ; $74A4: $C6 $0A
    ld   [wRequests], a                           ; $74A6: $EA $00 $D6
    ld   d, $00                                   ; $74A9: $16 $00
    add  hl, de                                   ; $74AB: $19
    ldh  a, [hFFCF]                               ; $74AC: $F0 $CF
    ld   [hl+], a                                 ; $74AE: $22
    ldh  a, [hFFD0]                               ; $74AF: $F0 $D0
    ld   [hl+], a                                 ; $74B1: $22
    ld   a, $81                                   ; $74B2: $3E $81
    ld   [hl+], a                                 ; $74B4: $22
    push hl                                       ; $74B5: $E5
    ld   hl, wEntitiesDirectionTable              ; $74B6: $21 $80 $C3
    add  hl, bc                                   ; $74B9: $09
    ld   a, [hl]                                  ; $74BA: $7E
    pop  hl                                       ; $74BB: $E1
    and  a                                        ; $74BC: $A7
    jr   nz, jr_015_74E6                          ; $74BD: $20 $27

    ld   a, $04                                   ; $74BF: $3E $04
    ld   [hl+], a                                 ; $74C1: $22
    ldh  a, [hActiveEntityStatus]                 ; $74C2: $F0 $EA
    and  a                                        ; $74C4: $A7
    ld   a, $08                                   ; $74C5: $3E $08
    jr   nz, jr_015_74CB                          ; $74C7: $20 $02

    ld   a, $04                                   ; $74C9: $3E $04

jr_015_74CB:
    ld   [hl+], a                                 ; $74CB: $22
    ldh  a, [hFFCF]                               ; $74CC: $F0 $CF
    ld   [hl+], a                                 ; $74CE: $22
    ldh  a, [hFFD0]                               ; $74CF: $F0 $D0
    inc  a                                        ; $74D1: $3C
    ld   [hl+], a                                 ; $74D2: $22
    ld   a, $81                                   ; $74D3: $3E $81
    ld   [hl+], a                                 ; $74D5: $22
    ld   a, $05                                   ; $74D6: $3E $05
    ld   [hl+], a                                 ; $74D8: $22
    ldh  a, [hActiveEntityStatus]                 ; $74D9: $F0 $EA
    and  a                                        ; $74DB: $A7
    ld   a, $09                                   ; $74DC: $3E $09
    jr   nz, jr_015_74E2                          ; $74DE: $20 $02

    ld   a, $05                                   ; $74E0: $3E $05

jr_015_74E2:
    ld   [hl+], a                                 ; $74E2: $22
    ld   [hl], $00                                ; $74E3: $36 $00
    ret                                           ; $74E5: $C9

jr_015_74E6:
    ldh  a, [hActiveEntityStatus]                 ; $74E6: $F0 $EA
    and  a                                        ; $74E8: $A7
    ld   a, $0A                                   ; $74E9: $3E $0A
    jr   nz, jr_015_74EF                          ; $74EB: $20 $02

    ld   a, $04                                   ; $74ED: $3E $04

jr_015_74EF:
    ld   [hl+], a                                 ; $74EF: $22
    ld   a, $04                                   ; $74F0: $3E $04
    ld   [hl+], a                                 ; $74F2: $22
    ldh  a, [hFFCF]                               ; $74F3: $F0 $CF
    ld   [hl+], a                                 ; $74F5: $22
    ldh  a, [hFFD0]                               ; $74F6: $F0 $D0
    inc  a                                        ; $74F8: $3C
    ld   [hl+], a                                 ; $74F9: $22
    ld   a, $81                                   ; $74FA: $3E $81
    ld   [hl+], a                                 ; $74FC: $22
    ldh  a, [hActiveEntityStatus]                 ; $74FD: $F0 $EA
    and  a                                        ; $74FF: $A7
    ld   a, $0B                                   ; $7500: $3E $0B
    jr   nz, jr_015_7506                          ; $7502: $20 $02

    ld   a, $05                                   ; $7504: $3E $05

jr_015_7506:
    ld   [hl+], a                                 ; $7506: $22
    ld   a, $05                                   ; $7507: $3E $05
    ld   [hl+], a                                 ; $7509: $22
    ld   [hl], $00                                ; $750A: $36 $00
    ret                                           ; $750C: $C9

BeetleSpawnerEntityHandler::
    ld   hl, wEntitiesUnknownTableD               ; $750D: $21 $D0 $C2
    add  hl, bc                                   ; $7510: $09
    ld   a, [hl]                                  ; $7511: $7E
    and  a                                        ; $7512: $A7
    jp   nz, label_015_757F                       ; $7513: $C2 $7F $75

    call func_015_7B0D                            ; $7516: $CD $0D $7B
    call func_015_7BDB                            ; $7519: $CD $DB $7B
    add  $20                                      ; $751C: $C6 $20
    cp   $40                                      ; $751E: $FE $40
    jr   nc, jr_015_756E                          ; $7520: $30 $4C

    call func_015_7BEB                            ; $7522: $CD $EB $7B
    add  $20                                      ; $7525: $C6 $20
    cp   $40                                      ; $7527: $FE $40
    jr   nc, jr_015_756E                          ; $7529: $30 $43

    ld   hl, wEntitiesUnknowTableY                ; $752B: $21 $D0 $C3
    add  hl, bc                                   ; $752E: $09
    ld   a, [hl]                                  ; $752F: $7E
    inc  a                                        ; $7530: $3C
    ld   [hl], a                                  ; $7531: $77
    and  $3F                                      ; $7532: $E6 $3F
    jr   nz, jr_015_756E                          ; $7534: $20 $38

    ld   a, $B2                                   ; $7536: $3E $B2
    ld   e, $04                                   ; $7538: $1E $04
    call SpawnNewEntityInRange_trampoline         ; $753A: $CD $98 $3B
    jr   c, jr_015_756E                           ; $753D: $38 $2F

    ldh  a, [hMultiPurpose0]                      ; $753F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7541: $21 $00 $C2
    add  hl, de                                   ; $7544: $19
    ld   [hl], a                                  ; $7545: $77
    ldh  a, [hMultiPurpose1]                      ; $7546: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7548: $21 $10 $C2
    add  hl, de                                   ; $754B: $19
    ld   [hl], a                                  ; $754C: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $754D: $21 $40 $C3
    add  hl, de                                   ; $7550: $19
    ld   [hl], $12                                ; $7551: $36 $12
    ld   hl, wEntitiesUnknownTableD               ; $7553: $21 $D0 $C2
    add  hl, de                                   ; $7556: $19
    ld   [hl], $01                                ; $7557: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $7559: $21 $E0 $C2
    add  hl, de                                   ; $755C: $19
    ld   [hl], $18                                ; $755D: $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $755F: $21 $F0 $C2
    add  hl, de                                   ; $7562: $19
    ld   [hl], $20                                ; $7563: $36 $20
    push bc                                       ; $7565: $C5
    ld   c, e                                     ; $7566: $4B
    ld   b, d                                     ; $7567: $42
    ld   a, $08                                   ; $7568: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $756A: $CD $AA $3B
    pop  bc                                       ; $756D: $C1

jr_015_756E:
    ret                                           ; $756E: $C9

Data_015_756F::
    db   $08, $F8, $00, $00

Data_015_7573::
    db   $00, $00, $F8, $08

Data_015_7577::
    db   $70, $00, $72, $00, $72, $20, $70, $20

label_015_757F:
    ld   de, Data_015_7577                        ; $757F: $11 $77 $75
    call RenderActiveEntitySpritesPair            ; $7582: $CD $C0 $3B
    call func_015_7B0D                            ; $7585: $CD $0D $7B
    call func_015_7B3E                            ; $7588: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $758B: $F0 $E7
    rra                                           ; $758D: $1F
    rra                                           ; $758E: $1F
    rra                                           ; $758F: $1F
    and  $01                                      ; $7590: $E6 $01
    call SetEntitySpriteVariant                   ; $7592: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $7595: $CD $88 $7B
    call GetEntityPrivateCountdown1               ; $7598: $CD $00 $0C
    jr   nz, jr_015_75A0                          ; $759B: $20 $03

    call label_3B23                               ; $759D: $CD $23 $3B

jr_015_75A0:
    call label_3B39                               ; $75A0: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $75A3: $CD $05 $0C
    jr   nz, jr_015_75CB                          ; $75A6: $20 $23

    call GetRandomByte                            ; $75A8: $CD $0D $28
    and  $1F                                      ; $75AB: $E6 $1F
    add  $20                                      ; $75AD: $C6 $20
    ld   [hl], a                                  ; $75AF: $77
    call GetRandomByte                            ; $75B0: $CD $0D $28
    and  $03                                      ; $75B3: $E6 $03
    ld   e, a                                     ; $75B5: $5F
    ld   d, b                                     ; $75B6: $50
    ld   hl, Data_015_756F                        ; $75B7: $21 $6F $75
    add  hl, de                                   ; $75BA: $19
    ld   a, [hl]                                  ; $75BB: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75BC: $21 $40 $C2
    add  hl, bc                                   ; $75BF: $09
    ld   [hl], a                                  ; $75C0: $77
    ld   hl, Data_015_7573                        ; $75C1: $21 $73 $75
    add  hl, de                                   ; $75C4: $19
    ld   a, [hl]                                  ; $75C5: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $75C6: $21 $50 $C2
    add  hl, bc                                   ; $75C9: $09
    ld   [hl], a                                  ; $75CA: $77

jr_015_75CB:
    ret                                           ; $75CB: $C9

    ld   a, $01                                   ; $75CC: $3E $01

Data_015_75CE::
    db   $F8, $08, $00, $00

Data_015_75D2::
    db   $00, $00, $08, $F8

LaserBeamEntityHandler::
    call func_015_7B0D                            ; $75D6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $75D9: $F0 $F0
    and  a                                        ; $75DB: $A7
    jr   nz, jr_015_75E1                          ; $75DC: $20 $03

    call CheckLinkCollisionWithProjectile_trampoline; $75DE: $CD $4F $3B

jr_015_75E1:
    call UpdateEntityPosWithSpeed_15              ; $75E1: $CD $88 $7B
    call label_3B2E                               ; $75E4: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $75E7: $21 $A0 $C2
    add  hl, bc                                   ; $75EA: $09
    ld   a, [hl]                                  ; $75EB: $7E
    and  a                                        ; $75EC: $A7
    jr   z, jr_015_7639                           ; $75ED: $28 $4A

    push hl                                       ; $75EF: $E5
    ldh  a, [hActiveEntityPosX]                   ; $75F0: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $75F2: $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ; $75F4: $F0 $EF
    ldh  [hMultiPurpose1], a                      ; $75F6: $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $75F8: $3E $05
    call AddTranscientVfx                         ; $75FA: $CD $C7 $0C
    pop  hl                                       ; $75FD: $E1
    ld   a, [hl]                                  ; $75FE: $7E
    cp   $02                                      ; $75FF: $FE $02
    jp   nz, ClearEntityStatus_15           ; $7601: $C2 $31 $7C

    ld   [hl], $00                                ; $7604: $36 $00
    ld   hl, wEntitiesStateTable                  ; $7606: $21 $90 $C2
    add  hl, bc                                   ; $7609: $09
    ld   [hl], a                                  ; $760A: $77
    ldh  a, [hLinkDirection]                      ; $760B: $F0 $9E
    and  $02                                      ; $760D: $E6 $02
    jr   nz, jr_015_7616                          ; $760F: $20 $05

    ld   hl, wEntitiesSpeedXTable                 ; $7611: $21 $40 $C2
    jr   jr_015_7619                              ; $7614: $18 $03

jr_015_7616:
    ld   hl, wEntitiesSpeedYTable                 ; $7616: $21 $50 $C2

jr_015_7619:
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    cpl                                           ; $761B: $2F
    inc  a                                        ; $761C: $3C
    ld   [hl], a                                  ; $761D: $77
    call ResetSpinAttack                          ; $761E: $CD $AF $0C
    ld   a, $10                                   ; $7621: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7623: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7626: $F0 $9E
    ld   e, a                                     ; $7628: $5F
    ld   d, b                                     ; $7629: $50
    ld   hl, Data_015_75CE                        ; $762A: $21 $CE $75
    add  hl, de                                   ; $762D: $19
    ld   a, [hl]                                  ; $762E: $7E
    ldh  [hLinkSpeedX], a                         ; $762F: $E0 $9A
    ld   hl, Data_015_75D2                        ; $7631: $21 $D2 $75
    add  hl, de                                   ; $7634: $19
    ld   a, [hl]                                  ; $7635: $7E
    ldh  [hLinkSpeedY], a                         ; $7636: $E0 $9B
    ret                                           ; $7638: $C9

jr_015_7639:
    ldh  a, [hActiveEntityPosX]                   ; $7639: $F0 $EE
    add  $04                                      ; $763B: $C6 $04
    ldh  [hMultiPurpose0], a                      ; $763D: $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ; $763F: $F0 $EF
    ldh  [hMultiPurpose1], a                      ; $7641: $E0 $D8
    ld   a, TRANSCIENT_VFX_LASER_BEAM             ; $7643: $3E $06
    call AddTranscientVfx                         ; $7645: $CD $C7 $0C
    ld   [hl], $10                                ; $7648: $36 $10
    ret                                           ; $764A: $C9

Data_015_764B::
    db   $00, $00, $74, $02, $00, $08, $74, $22, $00, $00, $FF, $02, $F0, $08, $7A, $02
    db   $00, $00, $76, $02, $00, $08, $78, $02, $F0, $00, $7A, $22, $00, $00, $78, $22
    db   $00, $08, $76, $22, $00, $00, $74, $42, $00, $08, $74, $62, $00, $00, $FF, $02

MonkeyEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $767B: $21 $B0 $C2
    add  hl, bc                                   ; $767E: $09
    ld   a, [hl]                                  ; $767F: $7E
    and  a                                        ; $7680: $A7
    jp   nz, label_015_7825                       ; $7681: $C2 $25 $78

    ld   hl, Data_015_764B                        ; $7684: $21 $4B $76
    ldh  a, [hActiveEntitySpriteVariant]          ; $7687: $F0 $F1
    rla                                           ; $7689: $17
    rla                                           ; $768A: $17
    and  $FC                                      ; $768B: $E6 $FC
    ld   e, a                                     ; $768D: $5F
    rla                                           ; $768E: $17
    add  e                                        ; $768F: $83
    ld   e, a                                     ; $7690: $5F
    ld   d, b                                     ; $7691: $50
    add  hl, de                                   ; $7692: $19
    ld   c, $03                                   ; $7693: $0E $03
    call RenderActiveEntitySpritesRect            ; $7695: $CD $E6 $3C
    call label_3CD9                               ; $7698: $CD $D9 $3C
    ldh  a, [hActiveEntityState]                  ; $769B: $F0 $F0
    cp   $02                                      ; $769D: $FE $02
    jr   nc, jr_015_76EF                          ; $769F: $30 $4E

    ld   a, [wC157]                               ; $76A1: $FA $57 $C1
    and  a                                        ; $76A4: $A7
    jr   z, jr_015_76EF                           ; $76A5: $28 $48

    ld   a, [wC178]                               ; $76A7: $FA $78 $C1
    and  a                                        ; $76AA: $A7
    jr   z, jr_015_76EF                           ; $76AB: $28 $42

    ldh  a, [hActiveEntityPosX]                   ; $76AD: $F0 $EE
    add  $08                                      ; $76AF: $C6 $08
    ld   hl, wC179                                ; $76B1: $21 $79 $C1
    sub  [hl]                                     ; $76B4: $96
    add  $10                                      ; $76B5: $C6 $10
    cp   $20                                      ; $76B7: $FE $20
    jr   nc, jr_015_76EF                          ; $76B9: $30 $34

    ldh  a, [hActiveEntityPosY]                   ; $76BB: $F0 $EF
    add  $08                                      ; $76BD: $C6 $08
    ld   hl, wC17A                                ; $76BF: $21 $7A $C1
    sub  [hl]                                     ; $76C2: $96
    add  $10                                      ; $76C3: $C6 $10
    cp   $20                                      ; $76C5: $FE $20
    jr   nc, jr_015_76EF                          ; $76C7: $30 $26

    ld   hl, wEntitiesPosYTable                   ; $76C9: $21 $10 $C2
    add  hl, bc                                   ; $76CC: $09
    ld   a, [hl]                                  ; $76CD: $7E
    add  $18                                      ; $76CE: $C6 $18
    ld   [hl], a                                  ; $76D0: $77
    ld   hl, wEntitiesPosZTable                   ; $76D1: $21 $10 $C3
    add  hl, bc                                   ; $76D4: $09
    ld   [hl], $18                                ; $76D5: $36 $18
    call IncrementEntityState                     ; $76D7: $CD $12 $3B
    ld   [hl], $02                                ; $76DA: $36 $02
    ld   hl, wEntitiesSpeedZTable                 ; $76DC: $21 $20 $C3
    add  hl, bc                                   ; $76DF: $09
    ld   [hl], $15                                ; $76E0: $36 $15
    ld   hl, wEntitiesSpeedYTable                 ; $76E2: $21 $50 $C2
    add  hl, bc                                   ; $76E5: $09
    ld   [hl], $0C                                ; $76E6: $36 $0C
    ld   hl, wEntitiesSpeedXTable                 ; $76E8: $21 $40 $C2
    add  hl, bc                                   ; $76EB: $09
    ld   [hl], $FA                                ; $76EC: $36 $FA
    ret                                           ; $76EE: $C9

jr_015_76EF:
    ldh  a, [hActiveEntityState]                  ; $76EF: $F0 $F0
    JP_TABLE                                      ; $76F1
._00 dw func_015_76FA                             ; $76F2
._01 dw func_015_770A                             ; $76F4
._02 dw func_015_7793                             ; $76F6
._03 dw func_015_77BF                             ; $76F8

func_015_76FA::
    ld   hl, wEntitiesPosXTable                   ; $76FA: $21 $00 $C2
    add  hl, bc                                   ; $76FD: $09
    ld   a, [hl]                                  ; $76FE: $7E
    add  $08                                      ; $76FF: $C6 $08
    ld   [hl], a                                  ; $7701: $77
    call GetEntityTransitionCountdown             ; $7702: $CD $05 $0C
    ld   [hl], $80                                ; $7705: $36 $80
    jp   IncrementEntityState                     ; $7707: $C3 $12 $3B

func_015_770A::
    call func_015_7B0D                            ; $770A: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $770D: $CD $05 $0C
    ret  nz                                       ; $7710: $C0

    ld   [hl], $50                                ; $7711: $36 $50
    ld   hl, wEntitiesSpriteVariantTable          ; $7713: $21 $B0 $C3
    add  hl, bc                                   ; $7716: $09
    ld   a, [hl]                                  ; $7717: $7E
    inc  a                                        ; $7718: $3C
    cp   $03                                      ; $7719: $FE $03
    jr   nz, jr_015_771E                          ; $771B: $20 $01

    xor  a                                        ; $771D: $AF

jr_015_771E:
    ld   [hl], a                                  ; $771E: $77
    ldh  [hActiveEntitySpriteVariant], a          ; $771F: $E0 $F1
    cp   $00                                      ; $7721: $FE $00
    jr   z, jr_015_7792                           ; $7723: $28 $6D

    call GetEntityTransitionCountdown             ; $7725: $CD $05 $0C
    ld   [hl], $28                                ; $7728: $36 $28
    ld   hl, wEntitiesUnknowTableY                ; $772A: $21 $D0 $C3
    add  hl, bc                                   ; $772D: $09
    inc  [hl]                                     ; $772E: $34
    ld   a, [hl]                                  ; $772F: $7E
    and  $0F                                      ; $7730: $E6 $0F
    jr   nz, jr_015_7738                          ; $7732: $20 $04

    ld   a, $02                                   ; $7734: $3E $02
    jr   jr_015_773A                              ; $7736: $18 $02

jr_015_7738:
    ld   a, $E0                                   ; $7738: $3E $E0

jr_015_773A:
    call SpawnNewEntity_trampoline                ; $773A: $CD $86 $3B
    ret  c                                        ; $773D: $D8

    ldh  a, [hMultiPurpose0]                      ; $773E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7740: $21 $00 $C2
    add  hl, de                                   ; $7743: $19
    ld   [hl], a                                  ; $7744: $77
    ldh  a, [hMultiPurpose1]                      ; $7745: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7747: $21 $10 $C2
    add  hl, de                                   ; $774A: $19
    sub  $0C                                      ; $774B: $D6 $0C
    add  $18                                      ; $774D: $C6 $18
    ld   [hl], a                                  ; $774F: $77
    ld   hl, wEntitiesPosZTable                   ; $7750: $21 $10 $C3
    add  hl, de                                   ; $7753: $19
    ld   [hl], $18                                ; $7754: $36 $18
    ld   hl, wEntitiesPrivateState1Table          ; $7756: $21 $B0 $C2
    add  hl, de                                   ; $7759: $19
    inc  [hl]                                     ; $775A: $34
    ld   hl, wEntitiesSpeedZTable                 ; $775B: $21 $20 $C3
    add  hl, de                                   ; $775E: $19
    ld   [hl], $20                                ; $775F: $36 $20
    ldh  a, [hActiveEntitySpriteVariant]          ; $7761: $F0 $F1
    cp   $01                                      ; $7763: $FE $01
    ld   a, $F8                                   ; $7765: $3E $F8
    jr   z, jr_015_776B                           ; $7767: $28 $02

    ld   a, $08                                   ; $7769: $3E $08

jr_015_776B:
    ld   hl, wEntitiesSpeedXTable                 ; $776B: $21 $40 $C2
    add  hl, de                                   ; $776E: $19
    ld   [hl], a                                  ; $776F: $77
    ld   hl, wEntitiesSpeedYTable                 ; $7770: $21 $50 $C2
    add  hl, de                                   ; $7773: $19
    ld   [hl], $0C                                ; $7774: $36 $0C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7776: $21 $40 $C3
    add  hl, de                                   ; $7779: $19
    ld   [hl], $12                                ; $777A: $36 $12
    ld   hl, wEntitiesOptions1Table               ; $777C: $21 $30 $C4
    add  hl, de                                   ; $777F: $19
    set  ENTITY_OPT1_B_MOVE_PIT_WATER, [hl]       ; $7780: $CB $C6
    ld   a, JINGLE_JUMP_DOWN                      ; $7782: $3E $08
    ldh  [hJingle], a                             ; $7784: $E0 $F2
    ld   hl, wEntitiesTransitionCountdownTable    ; $7786: $21 $E0 $C2
    add  hl, de                                   ; $7789: $19
    ld   [hl], $60                                ; $778A: $36 $60
    ld   hl, wEntitiesUnknowTableP                ; $778C: $21 $40 $C4
    add  hl, de                                   ; $778F: $19
    ld   [hl], $01                                ; $7790: $36 $01

jr_015_7792:
    ret                                           ; $7792: $C9

func_015_7793::
    ld   a, $03                                   ; $7793: $3E $03
    call SetEntitySpriteVariant                   ; $7795: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $7798: $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ; $779B: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $779E: $21 $20 $C3
    add  hl, bc                                   ; $77A1: $09
    dec  [hl]                                     ; $77A2: $35
    dec  [hl]                                     ; $77A3: $35
    ld   hl, wEntitiesPosZTable                   ; $77A4: $21 $10 $C3
    add  hl, bc                                   ; $77A7: $09
    ld   a, [hl]                                  ; $77A8: $7E
    and  $80                                      ; $77A9: $E6 $80
    jr   z, jr_015_77BE                           ; $77AB: $28 $11

    ld   [hl], b                                  ; $77AD: $70
    ld   hl, wEntitiesSpeedZTable                 ; $77AE: $21 $20 $C3
    add  hl, bc                                   ; $77B1: $09
    ld   [hl], $20                                ; $77B2: $36 $20
    call ClearEntitySpeed                         ; $77B4: $CD $7F $3D
    call IncrementEntityState                     ; $77B7: $CD $12 $3B

jr_015_77BA:
    ld   a, $14                                   ; $77BA: $3E $14
    ldh  [hWaveSfx], a                            ; $77BC: $E0 $F3

jr_015_77BE:
    ret                                           ; $77BE: $C9

func_015_77BF::
    ld   a, $00                                   ; $77BF: $3E $00
    call SetEntitySpriteVariant                   ; $77C1: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $77C4: $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ; $77C7: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $77CA: $21 $20 $C3
    add  hl, bc                                   ; $77CD: $09
    dec  [hl]                                     ; $77CE: $35
    dec  [hl]                                     ; $77CF: $35
    ld   hl, wEntitiesPosZTable                   ; $77D0: $21 $10 $C3
    add  hl, bc                                   ; $77D3: $09
    ld   a, [hl]                                  ; $77D4: $7E
    and  $80                                      ; $77D5: $E6 $80
    jr   z, jr_015_77FE                           ; $77D7: $28 $25

    ld   [hl], $01                                ; $77D9: $36 $01
    call GetRandomByte                            ; $77DB: $CD $0D $28
    and  $0F                                      ; $77DE: $E6 $0F
    add  $08                                      ; $77E0: $C6 $08
    ld   hl, wEntitiesSpeedZTable                 ; $77E2: $21 $20 $C3
    add  hl, bc                                   ; $77E5: $09
    ld   [hl], a                                  ; $77E6: $77
    ld   a, $10                                   ; $77E7: $3E $10
    call GetVectorTowardsLink_trampoline          ; $77E9: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $77EC: $F0 $D7
    cpl                                           ; $77EE: $2F
    inc  a                                        ; $77EF: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $77F0: $21 $50 $C2
    add  hl, bc                                   ; $77F3: $09
    ld   [hl], a                                  ; $77F4: $77
    ldh  a, [hMultiPurpose1]                      ; $77F5: $F0 $D8
    cpl                                           ; $77F7: $2F
    inc  a                                        ; $77F8: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $77F9: $21 $40 $C2
    add  hl, bc                                   ; $77FC: $09
    ld   [hl], a                                  ; $77FD: $77

jr_015_77FE:
    ldh  a, [hActiveEntityPosX]                   ; $77FE: $F0 $EE
    cp   $A8                                      ; $7800: $FE $A8
    jp   nc, ClearEntityStatus_15                       ; $7802: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $7805: $F0 $EC
    cp   $80                                      ; $7807: $FE $80
    jp   nc, ClearEntityStatus_15                       ; $7809: $D2 $31 $7C

    ldh  a, [hFrameCounter]                       ; $780C: $F0 $E7
    and  $0F                                      ; $780E: $E6 $0F
    jr   z, jr_015_77BA                           ; $7810: $28 $A8

    ret                                           ; $7812: $C9

Data_015_7813::
    db   $7C, $01, $7E, $01, $7E, $21, $7C, $21

Data_015_781B::
    db   $00, $0C

Data_015_781D::
    db   $10, $0C, $00, $F4, $F0, $F4, $00, $0C

label_015_7825:
    ld   de, Data_015_7813                        ; $7825: $11 $13 $78
    call RenderActiveEntitySpritesPair            ; $7828: $CD $C0 $3B
    call func_015_7B0D                            ; $782B: $CD $0D $7B
    call func_015_7B3E                            ; $782E: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $7831: $F0 $E7
    rra                                           ; $7833: $1F
    rra                                           ; $7834: $1F
    rra                                           ; $7835: $1F
    rra                                           ; $7836: $1F
    and  $01                                      ; $7837: $E6 $01
    call SetEntitySpriteVariant                   ; $7839: $CD $0C $3B
    call label_3B39                               ; $783C: $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ; $783F: $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ; $7842: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $7845: $21 $20 $C3
    add  hl, bc                                   ; $7848: $09
    dec  [hl]                                     ; $7849: $35
    dec  [hl]                                     ; $784A: $35
    ld   hl, wEntitiesPosZTable                   ; $784B: $21 $10 $C3
    add  hl, bc                                   ; $784E: $09
    ld   a, [hl]                                  ; $784F: $7E
    and  $80                                      ; $7850: $E6 $80
    jr   z, jr_015_788C                           ; $7852: $28 $38

    ld   [hl], b                                  ; $7854: $70
    call GetRandomByte                            ; $7855: $CD $0D $28
    and  $0F                                      ; $7858: $E6 $0F
    add  $10                                      ; $785A: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $785C: $21 $20 $C3
    add  hl, bc                                   ; $785F: $09
    ld   [hl], a                                  ; $7860: $77
    call GetRandomByte                            ; $7861: $CD $0D $28
    and  $07                                      ; $7864: $E6 $07
    ld   e, a                                     ; $7866: $5F
    ld   d, b                                     ; $7867: $50
    ld   hl, Data_015_781D                        ; $7868: $21 $1D $78
    add  hl, de                                   ; $786B: $19
    ld   a, [hl]                                  ; $786C: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $786D: $21 $40 $C2
    add  hl, bc                                   ; $7870: $09
    ld   [hl], a                                  ; $7871: $77
    ld   hl, Data_015_781B                        ; $7872: $21 $1B $78
    add  hl, de                                   ; $7875: $19
    ld   a, [hl]                                  ; $7876: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7877: $21 $50 $C2
    add  hl, bc                                   ; $787A: $09
    ld   [hl], a                                  ; $787B: $77
    ld   hl, wEntitiesUnknowTableY                ; $787C: $21 $D0 $C3
    add  hl, bc                                   ; $787F: $09
    ld   a, [hl]                                  ; $7880: $7E
    inc  [hl]                                     ; $7881: $34
    ld   a, [hl]                                  ; $7882: $7E
    cp   $04                                      ; $7883: $FE $04
    jp   z, ClearEntityStatus_15            ; $7885: $CA $31 $7C

    ld   a, JINGLE_BUMP                           ; $7888: $3E $09
    ldh  [hJingle], a                             ; $788A: $E0 $F2

jr_015_788C:
    ret                                           ; $788C: $C9

Data_015_788D::
    db   $50, $03, $52, $03, $54, $03, $56, $03, $52, $23, $50, $23, $56, $23, $54, $23

WitchRatEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $789D: $21 $80 $C3
    add  hl, bc                                   ; $78A0: $09
    ld   a, [hl]                                  ; $78A1: $7E
    and  a                                        ; $78A2: $A7
    jr   nz, jr_015_78AB                          ; $78A3: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $78A5: $F0 $F1
    add  $02                                      ; $78A7: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $78A9: $E0 $F1

jr_015_78AB:
    ld   de, Data_015_788D                        ; $78AB: $11 $8D $78
    call RenderActiveEntitySpritesPair            ; $78AE: $CD $C0 $3B
    call func_015_7B0D                            ; $78B1: $CD $0D $7B
    call AddEntityZSpeedToPos_15                  ; $78B4: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $78B7: $21 $20 $C3
    add  hl, bc                                   ; $78BA: $09
    dec  [hl]                                     ; $78BB: $35
    dec  [hl]                                     ; $78BC: $35
    ld   hl, wEntitiesPosZTable                   ; $78BD: $21 $10 $C3
    add  hl, bc                                   ; $78C0: $09
    ld   a, [hl]                                  ; $78C1: $7E
    and  $80                                      ; $78C2: $E6 $80
    ldh  [hMultiPurposeG], a                               ; $78C4: $E0 $E8
    jr   z, jr_015_78CF                           ; $78C6: $28 $07

    xor  a                                        ; $78C8: $AF
    ld   [hl], a                                  ; $78C9: $77
    ld   hl, wEntitiesSpeedZTable                 ; $78CA: $21 $20 $C3
    add  hl, bc                                   ; $78CD: $09
    ld   [hl], a                                  ; $78CE: $77

jr_015_78CF:
    ldh  a, [hActiveEntityState]                  ; $78CF: $F0 $F0
    JP_TABLE                                      ; $78D1
._00 dw func_015_78DE                             ; $78D2
._01 dw func_015_792E                             ; $78D4

Data_015_78D6::
    db   $02, $08, $0C, $08, $FE, $F8, $F4, $F8

func_015_78DE::
    call GetEntityTransitionCountdown             ; $78DE: $CD $05 $0C
    jr   nz, jr_015_791A                          ; $78E1: $20 $37

    call GetRandomByte                            ; $78E3: $CD $0D $28
    and  $07                                      ; $78E6: $E6 $07
    ld   e, a                                     ; $78E8: $5F
    ld   d, b                                     ; $78E9: $50
    ld   hl, Data_015_78D6                        ; $78EA: $21 $D6 $78
    add  hl, de                                   ; $78ED: $19
    ld   a, [hl]                                  ; $78EE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $78EF: $21 $40 $C2
    add  hl, bc                                   ; $78F2: $09
    ld   [hl], a                                  ; $78F3: $77
    ld   a, e                                     ; $78F4: $7B
    and  $04                                      ; $78F5: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $78F7: $21 $80 $C3
    add  hl, bc                                   ; $78FA: $09
    ld   [hl], a                                  ; $78FB: $77
    call GetRandomByte                            ; $78FC: $CD $0D $28
    and  $07                                      ; $78FF: $E6 $07
    ld   e, a                                     ; $7901: $5F
    ld   hl, Data_015_78D6                        ; $7902: $21 $D6 $78
    add  hl, de                                   ; $7905: $19
    ld   a, [hl]                                  ; $7906: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7907: $21 $50 $C2
    add  hl, bc                                   ; $790A: $09
    ld   [hl], a                                  ; $790B: $77
    call GetEntityTransitionCountdown             ; $790C: $CD $05 $0C
    call GetRandomByte                            ; $790F: $CD $0D $28
    and  $1F                                      ; $7912: $E6 $1F
    add  $30                                      ; $7914: $C6 $30
    ld   [hl], a                                  ; $7916: $77
    jp   IncrementEntityState                     ; $7917: $C3 $12 $3B

jr_015_791A:
    ld   a, $01                                   ; $791A: $3E $01
    call SetEntitySpriteVariant                   ; $791C: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $791F: $F0 $E7
    and  $1F                                      ; $7921: $E6 $1F
    jr   nz, jr_015_792D                          ; $7923: $20 $08

    ld   hl, wEntitiesDirectionTable              ; $7925: $21 $80 $C3
    add  hl, bc                                   ; $7928: $09
    ld   a, [hl]                                  ; $7929: $7E
    xor  $04                                      ; $792A: $EE $04
    ld   [hl], a                                  ; $792C: $77

jr_015_792D:
    ret                                           ; $792D: $C9

func_015_792E::
    call UpdateEntityPosWithSpeed_15              ; $792E: $CD $88 $7B
    call label_3B23                               ; $7931: $CD $23 $3B
    ldh  a, [hMultiPurposeG]                               ; $7934: $F0 $E8
    and  a                                        ; $7936: $A7
    jr   z, jr_015_7950                           ; $7937: $28 $17

    call GetEntityTransitionCountdown             ; $7939: $CD $05 $0C
    jr   nz, jr_015_7945                          ; $793C: $20 $07

    ld   [hl], $48                                ; $793E: $36 $48
    call IncrementEntityState                     ; $7940: $CD $12 $3B
    ld   [hl], b                                  ; $7943: $70
    ret                                           ; $7944: $C9

jr_015_7945:
    ld   hl, wEntitiesSpeedZTable                 ; $7945: $21 $20 $C3
    add  hl, bc                                   ; $7948: $09
    ld   [hl], $08                                ; $7949: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $794B: $21 $10 $C3
    add  hl, bc                                   ; $794E: $09
    inc  [hl]                                     ; $794F: $34

jr_015_7950:
    ld   a, $00                                   ; $7950: $3E $00
    jp   SetEntitySpriteVariant                   ; $7952: $C3 $0C $3B

Data_015_7955::
    db   $00, $08, $10, $18, $20, $28, $30, $38

func_015_795D::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $795D: $21 $40 $C3
    add  hl, bc                                   ; $7960: $09
    ld   a, [hl]                                  ; $7961: $7E
    and  $0F                                      ; $7962: $E6 $0F

func_015_7964::
    sla  a                                        ; $7964: $CB $27
    sla  a                                        ; $7966: $CB $27
    ld   e, a                                     ; $7968: $5F
    ld   a, [wOAMNextAvailableSlot]               ; $7969: $FA $C0 $C3
    add  e                                        ; $796C: $83
    cp   $60                                      ; $796D: $FE $60
    jr   c, jr_015_7973                           ; $796F: $38 $02

    sub  $60                                      ; $7971: $D6 $60

jr_015_7973:
    ld   [wOAMNextAvailableSlot], a               ; $7973: $EA $C0 $C3
    ld   a, [wC3C1]                               ; $7976: $FA $C1 $C3
    add  e                                        ; $7979: $83
    ld   [wC3C1], a                               ; $797A: $EA $C1 $C3
    cp   $60                                      ; $797D: $FE $60
    jr   c, jr_015_7994                           ; $797F: $38 $13

    ldh  a, [hFrameCounter]                       ; $7981: $F0 $E7

jr_015_7983:
    ld   hl, wActiveEntityIndex                   ; $7983: $21 $23 $C1
    add  [hl]                                     ; $7986: $86
    and  $07                                      ; $7987: $E6 $07
    ld   e, a                                     ; $7989: $5F
    ld   d, $00                                   ; $798A: $16 $00
    ld   hl, Data_015_7955                        ; $798C: $21 $55 $79
    add  hl, de                                   ; $798F: $19
    ld   a, [hl]                                  ; $7990: $7E
    ld   [wOAMNextAvailableSlot], a               ; $7991: $EA $C0 $C3

jr_015_7994:
    ret                                           ; $7994: $C9

func_015_7995::
    ldh  a, [hActiveEntityStatus]                 ; $7995: $F0 $EA
    cp   ENTITY_STATUS_LIFTED                     ; $7997: $FE $07
    ret  z                                        ; $7999: $C8

    ld   hl, wEntitiesUnknowTableI                ; $799A: $21 $70 $C4
    add  hl, bc                                   ; $799D: $09
    ld   a, [hl]                                  ; $799E: $7E
    cp   $02                                      ; $799F: $FE $02
    jp   z, label_015_79DF                        ; $79A1: $CA $DF $79

    cp   $03                                      ; $79A4: $FE $03
    jp   z, label_015_7A27                        ; $79A6: $CA $27 $7A

    ld   hl, wEntitiesPosZTable                   ; $79A9: $21 $10 $C3
    add  hl, bc                                   ; $79AC: $09
    ld   a, [hl]                                  ; $79AD: $7E
    and  a                                        ; $79AE: $A7
    ret  z                                        ; $79AF: $C8

    ldh  a, [hIsSideScrolling]                    ; $79B0: $F0 $F9
    and  a                                        ; $79B2: $A7
    ret  nz                                       ; $79B3: $C0

    ld   hl, wEntitiesPhysicsFlagsTable           ; $79B4: $21 $40 $C3
    add  hl, bc                                   ; $79B7: $09
    ld   a, [hl]                                  ; $79B8: $7E
    and  $10                                      ; $79B9: $E6 $10
    ret  z                                        ; $79BB: $C8

    ldh  a, [hFrameCounter]                       ; $79BC: $F0 $E7
    xor  c                                        ; $79BE: $A9
    and  $01                                      ; $79BF: $E6 $01
    ret  nz                                       ; $79C1: $C0

    ld   a, [wOAMNextAvailableSlot]               ; $79C2: $FA $C0 $C3
    ld   l, a                                     ; $79C5: $6F
    ld   h, $00                                   ; $79C6: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79C8: $11 $30 $C0
    add  hl, de                                   ; $79CB: $19
    ldh  a, [hActiveEntityPosY]                   ; $79CC: $F0 $EF
    add  $0A                                      ; $79CE: $C6 $0A
    ld   [hl+], a                                 ; $79D0: $22
    ldh  a, [hActiveEntityPosX]                   ; $79D1: $F0 $EE
    add  $04                                      ; $79D3: $C6 $04
    ld   [hl+], a                                 ; $79D5: $22
    ld   a, $26                                   ; $79D6: $3E $26
    ld   [hl+], a                                 ; $79D8: $22
    ld   [hl], b                                  ; $79D9: $70
    ld   a, $01                                   ; $79DA: $3E $01
    jp   func_015_7964                            ; $79DC: $C3 $64 $79

label_015_79DF:
    ldh  a, [hActiveEntityType]                   ; $79DF: $F0 $EB
    cp   ENTITY_BOMB                              ; $79E1: $FE $02
    jr   nz, func_015_79F0                        ; $79E3: $20 $0B

    ld   hl, hActiveEntityVisualPosY                                ; $79E5: $21 $EC $FF
    dec  [hl]                                     ; $79E8: $35
    dec  [hl]                                     ; $79E9: $35
    call func_015_79F0                            ; $79EA: $CD $F0 $79
    jp   CopyEntityPositionToActivePosition       ; $79ED: $C3 $8A $3D

func_015_79F0::
    ld   a, [wOAMNextAvailableSlot]               ; $79F0: $FA $C0 $C3
    ld   l, a                                     ; $79F3: $6F
    ld   h, $00                                   ; $79F4: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79F6: $11 $30 $C0
    add  hl, de                                   ; $79F9: $19
IF __PATCH_0__
    ld   e, $03
ELSE
    ld   e, $00                                   ; $79FA: $1E $00
ENDC
    ldh  a, [hFrameCounter]                       ; $79FC: $F0 $E7
    and  $04                                      ; $79FE: $E6 $04
    jr   z, jr_015_7A04                           ; $7A00: $28 $02

IF __PATCH_0__
    ld   e, $15
ELSE
    ld   e, $10                                   ; $7A02: $1E $10
ENDC

jr_015_7A04:
    ldh  a, [hActiveEntityVisualPosY]             ; $7A04: $F0 $EC
    add  $0B                                      ; $7A06: $C6 $0B
    ld   [hl+], a                                 ; $7A08: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A09: $F0 $EE
    ld   [hl+], a                                 ; $7A0B: $22
    ld   a, $1C                                   ; $7A0C: $3E $1C
    ld   [hl+], a                                 ; $7A0E: $22
    ld   a, e                                     ; $7A0F: $7B
    ld   [hl+], a                                 ; $7A10: $22
    ldh  a, [hActiveEntityVisualPosY]             ; $7A11: $F0 $EC
    add  $0B                                      ; $7A13: $C6 $0B
    ld   [hl+], a                                 ; $7A15: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A16: $F0 $EE
    add  $08                                      ; $7A18: $C6 $08
    ld   [hl+], a                                 ; $7A1A: $22
    ld   a, $1C                                   ; $7A1B: $3E $1C
    ld   [hl+], a                                 ; $7A1D: $22
    ld   a, e                                     ; $7A1E: $7B
    or   $20                                      ; $7A1F: $F6 $20
    ld   [hl+], a                                 ; $7A21: $22
    ld   a, $02                                   ; $7A22: $3E $02
    jp   func_015_7964                            ; $7A24: $C3 $64 $79

label_015_7A27:
    push bc                                       ; $7A27: $C5
    ld   hl, wEntitiesUnknowTableY                ; $7A28: $21 $D0 $C3
    add  hl, bc                                   ; $7A2B: $09
    ld   e, [hl]                                  ; $7A2C: $5E
    ld   hl, wEntitiesSpeedXTable                 ; $7A2D: $21 $40 $C2
    add  hl, bc                                   ; $7A30: $09
    ld   a, [hl]                                  ; $7A31: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7A32: $21 $50 $C2
    add  hl, bc                                   ; $7A35: $09
    ld   c, b                                     ; $7A36: $48
    or   [hl]                                     ; $7A37: $B6
    jr   z, jr_015_7A40                           ; $7A38: $28 $06

    ld   a, e                                     ; $7A3A: $7B
    rla                                           ; $7A3B: $17
    rla                                           ; $7A3C: $17
    and  $20                                      ; $7A3D: $E6 $20
    ld   c, a                                     ; $7A3F: $4F

jr_015_7A40:
    ld   a, [wOAMNextAvailableSlot]               ; $7A40: $FA $C0 $C3
    ld   l, a                                     ; $7A43: $6F
    ld   h, $00                                   ; $7A44: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $7A46: $11 $30 $C0
    add  hl, de                                   ; $7A49: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7A4A: $F0 $EC
    add  $08                                      ; $7A4C: $C6 $08
    ld   [hl+], a                                 ; $7A4E: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A4F: $F0 $EE
    dec  a                                        ; $7A51: $3D
    ld   [hl+], a                                 ; $7A52: $22
    ld   a, $1A                                   ; $7A53: $3E $1A
    ld   [hl+], a                                 ; $7A55: $22
    ld   a, c                                     ; $7A56: $79
    ld   [hl+], a                                 ; $7A57: $22
    ldh  a, [hActiveEntityVisualPosY]             ; $7A58: $F0 $EC
    add  $08                                      ; $7A5A: $C6 $08
    ld   [hl+], a                                 ; $7A5C: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A5D: $F0 $EE
    add  $07                                      ; $7A5F: $C6 $07
    ld   [hl+], a                                 ; $7A61: $22
    ld   a, $1A                                   ; $7A62: $3E $1A
    ld   [hl+], a                                 ; $7A64: $22
    ld   a, c                                     ; $7A65: $79
    ld   [hl], a                                  ; $7A66: $77
    pop  bc                                       ; $7A67: $C1
    ld   a, $02                                   ; $7A68: $3E $02
    jp   func_015_7964                            ; $7A6A: $C3 $64 $79

    ret                                           ; $7A6D: $C9

func_015_7A6E::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7A6E: $CD $5A $3B
    jr   nc, jr_015_7A9A                          ; $7A71: $30 $27

    call CopyLinkFinalPositionToPosition          ; $7A73: $CD $BE $0C
    ld   a, [wC1A6]                               ; $7A76: $FA $A6 $C1
    and  a                                        ; $7A79: $A7
    jr   z, jr_015_7A8D                           ; $7A7A: $28 $11

    ld   e, a                                     ; $7A7C: $5F
    ld   d, b                                     ; $7A7D: $50
    ld   hl, wEntitiesUnknowTableR+15                                ; $7A7E: $21 $9F $C3
    add  hl, de                                   ; $7A81: $19
    ld   a, [hl]                                  ; $7A82: $7E
    cp   $03                                      ; $7A83: $FE $03
    jr   nz, jr_015_7A8D                          ; $7A85: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $7A87: $21 $8F $C2
    add  hl, de                                   ; $7A8A: $19
    ld   [hl], $00                                ; $7A8B: $36 $00

jr_015_7A8D:
    ld   a, [wIsRunningWithPegasusBoots]          ; $7A8D: $FA $4A $C1
    ld   e, a                                     ; $7A90: $5F
    call ResetPegasusBoots                        ; $7A91: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $7A94: $CD $8E $17
    ld   a, e                                     ; $7A97: $7B
    scf                                           ; $7A98: $37
    ret                                           ; $7A99: $C9

jr_015_7A9A:
    and  a                                        ; $7A9A: $A7
    ret                                           ; $7A9B: $C9

Data_015_7A9C::
    db   $06, $04, $02, $00

label_015_7AA0:
    ld   hl, wEntitiesDirectionTable              ; $7AA0: $21 $80 $C3
    add  hl, bc                                   ; $7AA3: $09
    ld   e, [hl]                                  ; $7AA4: $5E
    ld   d, b                                     ; $7AA5: $50
    ld   hl, Data_015_7A9C                        ; $7AA6: $21 $9C $7A
    add  hl, de                                   ; $7AA9: $19
    push hl                                       ; $7AAA: $E5
    ld   hl, wEntitiesUnknowTableY                ; $7AAB: $21 $D0 $C3
    add  hl, bc                                   ; $7AAE: $09
    inc  [hl]                                     ; $7AAF: $34
    ld   a, [hl]                                  ; $7AB0: $7E
    rra                                           ; $7AB1: $1F
    rra                                           ; $7AB2: $1F
    rra                                           ; $7AB3: $1F
    rra                                           ; $7AB4: $1F
    pop  hl                                       ; $7AB5: $E1
    and  $01                                      ; $7AB6: $E6 $01
    or   [hl]                                     ; $7AB8: $B6
    jp   SetEntitySpriteVariant                   ; $7AB9: $C3 $0C $3B

; Tell if the player is currently trying to talk to an entity.
; That is when:
;  - Link is close to the entity
;  - Link is facing the entity
;  - A dialog box can appear at this time
;  - The A button is pressed
;
; Return:
;   The carry flag is set if Link is trying to talk to the entity.
;   It is not set otherwise.
ShouldLinkTalkToEntity::
    ld   e, b                                     ; $7ABC: $58
    ldh  a, [hLinkPositionY]                      ; $7ABD: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $7ABF: $21 $EF $FF
    sub  [hl]                                     ; $7AC2: $96
    add  $14                                      ; $7AC3: $C6 $14
    cp   $28                                      ; $7AC5: $FE $28
    jr   nc, jr_015_7B0B                          ; $7AC7: $30 $42

    ldh  a, [hLinkPositionX]                      ; $7AC9: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7ACB: $21 $EE $FF
    sub  [hl]                                     ; $7ACE: $96
    add  $10                                      ; $7ACF: $C6 $10
    cp   $20                                      ; $7AD1: $FE $20
    jr   nc, jr_015_7B0B                          ; $7AD3: $30 $36

    inc  e                                        ; $7AD5: $1C
    push de                                       ; $7AD6: $D5
    call func_015_7C0A                            ; $7AD7: $CD $0A $7C
    ldh  a, [hLinkDirection]                      ; $7ADA: $F0 $9E
    xor  $01                                      ; $7ADC: $EE $01
    cp   e                                        ; $7ADE: $BB
    pop  de                                       ; $7ADF: $D1
    jr   nz, jr_015_7B0B                          ; $7AE0: $20 $29

    ld   hl, wC1AD                                ; $7AE2: $21 $AD $C1
    ld   [hl], $01                                ; $7AE5: $36 $01
    ld   a, [wDialogState]                        ; $7AE7: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7AEA: $21 $4F $C1
    or   [hl]                                     ; $7AED: $B6
    ld   hl, wIsLinkInTheAir                      ; $7AEE: $21 $46 $C1
    or   [hl]                                     ; $7AF1: $B6
    ld   hl, wC134                                ; $7AF2: $21 $34 $C1
    or   [hl]                                     ; $7AF5: $B6
    ld   hl, $DE05                                ; $7AF6: $21 $05 $DE
    or   [hl]                                     ; $7AF9: $B6
    jr   nz, jr_015_7B0B                          ; $7AFA: $20 $0F

    ld   a, [wWindowY]                            ; $7AFC: $FA $9A $DB
    cp   $80                                      ; $7AFF: $FE $80
    jr   nz, jr_015_7B0B                          ; $7B01: $20 $08

    ldh  a, [hJoypadState]                        ; $7B03: $F0 $CC
    and  J_A                                      ; $7B05: $E6 $10
    jr   z, jr_015_7B0B                           ; $7B07: $28 $02

    scf                                           ; $7B09: $37
    ret                                           ; $7B0A: $C9

jr_015_7B0B:
    and  a                                        ; $7B0B: $A7
    ret                                           ; $7B0C: $C9

func_015_7B0D::
    ldh  a, [hActiveEntityStatus]                 ; $7B0D: $F0 $EA
    cp   $05                                      ; $7B0F: $FE $05
    jr   nz, jr_015_7B3C                          ; $7B11: $20 $29

func_015_7B13::
    ld   a, [wGameplayType]                       ; $7B13: $FA $95 $DB
    cp   $07                                      ; $7B16: $FE $07
    jr   z, jr_015_7B3C                           ; $7B18: $28 $22

    cp   $01                                      ; $7B1A: $FE $01
    jr   z, jr_015_7B29                           ; $7B1C: $28 $0B

    cp   $0B                                      ; $7B1E: $FE $0B
    jr   nz, jr_015_7B3C                          ; $7B20: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7B22: $FA $6B $C1
    cp   $04                                      ; $7B25: $FE $04
    jr   nz, jr_015_7B3C                          ; $7B27: $20 $13

jr_015_7B29:
    ld   hl, wC1A8                                ; $7B29: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7B2C: $FA $9F $C1
    or   [hl]                                     ; $7B2F: $B6
    ld   hl, wInventoryAppearing                  ; $7B30: $21 $4F $C1
    or   [hl]                                     ; $7B33: $B6
    jr   nz, jr_015_7B3C                          ; $7B34: $20 $06

    ld   a, [wRoomTransitionState]                ; $7B36: $FA $24 $C1
    and  a                                        ; $7B39: $A7
    jr   z, jr_015_7B3D                           ; $7B3A: $28 $01

jr_015_7B3C:
    pop  af                                       ; $7B3C: $F1

jr_015_7B3D:
    ret                                           ; $7B3D: $C9

func_015_7B3E::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7B3E: $21 $10 $C4
    add  hl, bc                                   ; $7B41: $09
    ld   a, [hl]                                  ; $7B42: $7E
    and  a                                        ; $7B43: $A7
    jr   z, jr_015_7B87                           ; $7B44: $28 $41

    dec  a                                        ; $7B46: $3D
    ld   [hl], a                                  ; $7B47: $77
    call label_3E8E                               ; $7B48: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                 ; $7B4B: $21 $40 $C2
    add  hl, bc                                   ; $7B4E: $09
    ld   a, [hl]                                  ; $7B4F: $7E
    push af                                       ; $7B50: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $7B51: $21 $50 $C2
    add  hl, bc                                   ; $7B54: $09
    ld   a, [hl]                                  ; $7B55: $7E
    push af                                       ; $7B56: $F5
    ld   hl, wC3F0                                ; $7B57: $21 $F0 $C3
    add  hl, bc                                   ; $7B5A: $09
    ld   a, [hl]                                  ; $7B5B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7B5C: $21 $40 $C2
    add  hl, bc                                   ; $7B5F: $09
    ld   [hl], a                                  ; $7B60: $77
    ld   hl, wEntitiesUnknowTableS                ; $7B61: $21 $00 $C4
    add  hl, bc                                   ; $7B64: $09
    ld   a, [hl]                                  ; $7B65: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7B66: $21 $50 $C2
    add  hl, bc                                   ; $7B69: $09
    ld   [hl], a                                  ; $7B6A: $77
    call UpdateEntityPosWithSpeed_15              ; $7B6B: $CD $88 $7B
    ld   hl, wEntitiesOptions1Table               ; $7B6E: $21 $30 $C4
    add  hl, bc                                   ; $7B71: $09
    ld   a, [hl]                                  ; $7B72: $7E
    and  $20                                      ; $7B73: $E6 $20
    jr   nz, jr_015_7B7A                          ; $7B75: $20 $03

    call label_3B23                               ; $7B77: $CD $23 $3B

jr_015_7B7A:
    ld   hl, wEntitiesSpeedYTable                 ; $7B7A: $21 $50 $C2
    add  hl, bc                                   ; $7B7D: $09
    pop  af                                       ; $7B7E: $F1
    ld   [hl], a                                  ; $7B7F: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7B80: $21 $40 $C2
    add  hl, bc                                   ; $7B83: $09
    pop  af                                       ; $7B84: $F1
    ld   [hl], a                                  ; $7B85: $77
    pop  af                                       ; $7B86: $F1

jr_015_7B87:
    ret                                           ; $7B87: $C9

UpdateEntityPosWithSpeed_15::
    call AddEntitySpeedToPos_15                   ; $7B88: $CD $95 $7B

UpdateEntityYPosWithSpeed_15::
    push bc                                       ; $7B8B: $C5
    ld   a, c                                     ; $7B8C: $79
    add  $10                                      ; $7B8D: $C6 $10
    ld   c, a                                     ; $7B8F: $4F
    call AddEntitySpeedToPos_15                   ; $7B90: $CD $95 $7B
    pop  bc                                       ; $7B93: $C1
    ret                                           ; $7B94: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_15::
    ld   hl, wEntitiesSpeedXTable                 ; $7B95: $21 $40 $C2
    add  hl, bc                                   ; $7B98: $09
    ld   a, [hl]                                  ; $7B99: $7E
    and  a                                        ; $7B9A: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7B9B: $28 $23

    push af                                       ; $7B9D: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7B9E: $CB $37
    and  $F0                                      ; $7BA0: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7BA2: $21 $60 $C2
    add  hl, bc                                   ; $7BA5: $09
    add  [hl]                                     ; $7BA6: $86
    ld   [hl], a                                  ; $7BA7: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7BA8: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7BAA: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7BAD: $09
    pop  af                                       ; $7BAE: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7BAF: $1E $00
    bit  7, a                                     ; $7BB1: $CB $7F
    jr   z, .positive                             ; $7BB3: $28 $02

    ld   e, $F0                                   ; $7BB5: $1E $F0

.positive
    swap a                                        ; $7BB7: $CB $37
    and  $0F                                      ; $7BB9: $E6 $0F
    or   e                                        ; $7BBB: $B3
    ; Get carry back from d
    rr   d                                        ; $7BBC: $CB $1A
    adc  [hl]                                     ; $7BBE: $8E
    ld   [hl], a                                  ; $7BBF: $77

.return
    ret                                           ; $7BC0: $C9

AddEntityZSpeedToPos_15::
    ld   hl, wEntitiesSpeedZTable                 ; $7BC1: $21 $20 $C3
    add  hl, bc                                   ; $7BC4: $09
    ld   a, [hl]                                  ; $7BC5: $7E
    and  a                                        ; $7BC6: $A7
    jr   z, AddEntitySpeedToPos_15.return         ; $7BC7: $28 $F7

    push af                                       ; $7BC9: $F5
    swap a                                        ; $7BCA: $CB $37
    and  $F0                                      ; $7BCC: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7BCE: $21 $30 $C3
    add  hl, bc                                   ; $7BD1: $09
    add  [hl]                                     ; $7BD2: $86
    ld   [hl], a                                  ; $7BD3: $77
    rl   d                                        ; $7BD4: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7BD6: $21 $10 $C3
    jr   AddEntitySpeedToPos_15.updatePosition    ; $7BD9: $18 $D2

func_015_7BDB::
    ld   e, $00                                   ; $7BDB: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7BDD: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7BDF: $21 $00 $C2
    add  hl, bc                                   ; $7BE2: $09
    sub  [hl]                                     ; $7BE3: $96
    bit  7, a                                     ; $7BE4: $CB $7F
    jr   z, jr_015_7BE9                           ; $7BE6: $28 $01

    inc  e                                        ; $7BE8: $1C

jr_015_7BE9:
    ld   d, a                                     ; $7BE9: $57
    ret                                           ; $7BEA: $C9

func_015_7BEB::
    ld   e, $02                                   ; $7BEB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BED: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7BEF: $21 $10 $C2
    add  hl, bc                                   ; $7BF2: $09
    sub  [hl]                                     ; $7BF3: $96
    bit  7, a                                     ; $7BF4: $CB $7F
    jr   nz, jr_015_7BF9                          ; $7BF6: $20 $01

    inc  e                                        ; $7BF8: $1C

jr_015_7BF9:
    ld   d, a                                     ; $7BF9: $57
    ret                                           ; $7BFA: $C9

    ld   e, $02                                   ; $7BFB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BFD: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7BFF: $21 $EC $FF
    sub  [hl]                                     ; $7C02: $96
    bit  7, a                                     ; $7C03: $CB $7F
    jr   nz, jr_015_7C08                          ; $7C05: $20 $01

    inc  e                                        ; $7C07: $1C

jr_015_7C08:
    ld   d, a                                     ; $7C08: $57
    ret                                           ; $7C09: $C9

func_015_7C0A::
    call func_015_7BDB                            ; $7C0A: $CD $DB $7B
    ld   a, e                                     ; $7C0D: $7B
    ldh  [hMultiPurpose0], a                      ; $7C0E: $E0 $D7
    ld   a, d                                     ; $7C10: $7A
    bit  7, a                                     ; $7C11: $CB $7F
    jr   z, jr_015_7C17                           ; $7C13: $28 $02

    cpl                                           ; $7C15: $2F
    inc  a                                        ; $7C16: $3C

jr_015_7C17:
    push af                                       ; $7C17: $F5
    call func_015_7BEB                            ; $7C18: $CD $EB $7B
    ld   a, e                                     ; $7C1B: $7B
    ldh  [hMultiPurpose1], a                      ; $7C1C: $E0 $D8
    ld   a, d                                     ; $7C1E: $7A
    bit  7, a                                     ; $7C1F: $CB $7F
    jr   z, jr_015_7C25                           ; $7C21: $28 $02

    cpl                                           ; $7C23: $2F
    inc  a                                        ; $7C24: $3C

jr_015_7C25:
    pop  de                                       ; $7C25: $D1
    cp   d                                        ; $7C26: $BA
    jr   nc, jr_015_7C2D                          ; $7C27: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7C29: $F0 $D7
    jr   jr_015_7C2F                              ; $7C2B: $18 $02

jr_015_7C2D:
    ldh  a, [hMultiPurpose1]                      ; $7C2D: $F0 $D8

jr_015_7C2F:
    ld   e, a                                     ; $7C2F: $5F
    ret                                           ; $7C30: $C9

; Reset the entity status to 0, thus removing the entity.
;
; Inputs:
;   bc   entity index
ClearEntityStatus_15::
    ld   hl, wEntitiesStatusTable                 ; $7C31: $21 $80 $C2
    add  hl, bc                                   ; $7C34: $09
    ld   [hl], b                                  ; $7C35: $70
    ret                                           ; $7C36: $C9

label_015_7C37:
    ld   hl, wEntitiesPrivateState2Table          ; $7C37: $21 $C0 $C2
    add  hl, bc                                   ; $7C3A: $09
    ld   a, [hl]                                  ; $7C3B: $7E
    JP_TABLE                                      ; $7C3C
._00 dw func_015_7C43                             ; $7C3D
._01 dw func_015_7C54                             ; $7C3F
._02 dw func_015_7C63                             ; $7C41

func_015_7C43::
    call GetEntityTransitionCountdown             ; $7C43: $CD $05 $0C
    ld   [hl], $A0                                ; $7C46: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7C48: $21 $20 $C4
    add  hl, bc                                   ; $7C4B: $09
    ld   [hl], $FF                                ; $7C4C: $36 $FF

label_015_7C4E:
    ld   hl, wEntitiesPrivateState2Table          ; $7C4E: $21 $C0 $C2
    add  hl, bc                                   ; $7C51: $09
    inc  [hl]                                     ; $7C52: $34
    ret                                           ; $7C53: $C9

func_015_7C54::
    call GetEntityTransitionCountdown             ; $7C54: $CD $05 $0C
    ret  nz                                       ; $7C57: $C0

    ld   [hl], $C0                                ; $7C58: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7C5A: $21 $20 $C4
    add  hl, bc                                   ; $7C5D: $09
    ld   [hl], $FF                                ; $7C5E: $36 $FF
    jp   label_015_7C4E                           ; $7C60: $C3 $4E $7C

func_015_7C63::
    call GetEntityTransitionCountdown             ; $7C63: $CD $05 $0C
    jr   nz, jr_015_7C6E                          ; $7C66: $20 $06

    call PlayBombExplosionSfx                     ; $7C68: $CD $4B $0C
    jp   DidKillEnemy                             ; $7C6B: $C3 $50 $3F

jr_015_7C6E:
    jp   label_015_7C71                           ; $7C6E: $C3 $71 $7C

label_015_7C71:
    and  $07                                      ; $7C71: $E6 $07
    ret  nz                                       ; $7C73: $C0

    call GetRandomByte                            ; $7C74: $CD $0D $28
    and  $1F                                      ; $7C77: $E6 $1F
    sub  $10                                      ; $7C79: $D6 $10
    ld   e, a                                     ; $7C7B: $5F
    ld   hl, hActiveEntityPosX                    ; $7C7C: $21 $EE $FF
    add  [hl]                                     ; $7C7F: $86
    ld   [hl], a                                  ; $7C80: $77
    call GetRandomByte                            ; $7C81: $CD $0D $28
    and  $1F                                      ; $7C84: $E6 $1F
    sub  $14                                      ; $7C86: $D6 $14
    ld   e, a                                     ; $7C88: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7C89: $21 $EC $FF
    add  [hl]                                     ; $7C8C: $86
    ld   [hl], a                                  ; $7C8D: $77
    jp   label_015_7C91                           ; $7C8E: $C3 $91 $7C

label_015_7C91:
    call func_015_7B13                            ; $7C91: $CD $13 $7B
    ldh  a, [hActiveEntityPosX]                   ; $7C94: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7C96: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7C98: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7C9A: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7C9C: $3E $02
    call AddTranscientVfx                         ; $7C9E: $CD $C7 $0C
    ld   a, $13                                   ; $7CA1: $3E $13
    ldh  [hNoiseSfx], a                           ; $7CA3: $E0 $F4
    ret                                           ; $7CA5: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7CA6: $3E $36
    call SpawnNewEntity_trampoline                ; $7CA8: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7CAB: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7CAD: $21 $00 $C2
    add  hl, de                                   ; $7CB0: $19
    ld   [hl], a                                  ; $7CB1: $77
    ldh  a, [hMultiPurpose1]                      ; $7CB2: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7CB4: $21 $10 $C2
    add  hl, de                                   ; $7CB7: $19
    ld   [hl], a                                  ; $7CB8: $77
    ldh  a, [hIsSideScrolling]                    ; $7CB9: $F0 $F9
    and  a                                        ; $7CBB: $A7
    jr   z, jr_015_7CC6                           ; $7CBC: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7CBE: $21 $50 $C2
    add  hl, bc                                   ; $7CC1: $09
    ld   [hl], $F0                                ; $7CC2: $36 $F0
    jr   jr_015_7CD2                              ; $7CC4: $18 $0C

jr_015_7CC6:
    ld   hl, wEntitiesSpeedZTable                 ; $7CC6: $21 $20 $C3
    add  hl, de                                   ; $7CC9: $19
    ld   [hl], $10                                ; $7CCA: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7CCC: $21 $10 $C3
    add  hl, de                                   ; $7CCF: $19
    ld   [hl], $08                                ; $7CD0: $36 $08

jr_015_7CD2:
    call ClearEntityStatus_15                        ; $7CD2: $CD $31 $7C
    ld   hl, hNoiseSfx                            ; $7CD5: $21 $F4 $FF
    ld   [hl], $1A                                ; $7CD8: $36 $1A
    ret                                           ; $7CDA: $C9

func_015_7CDB::
    ld   hl, wOverworldRoomStatus                 ; $7CDB: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7CDE: $F0 $F6
    ld   e, a                                     ; $7CE0: $5F
    ld   a, [wIsIndoor]                           ; $7CE1: $FA $A5 $DB
    ld   d, a                                     ; $7CE4: $57

    ldh  a, [hMapId]                              ; $7CE5: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $7CE7: $FE $1A
    jr   nc, jr_015_7CF0                          ; $7CE9: $30 $05

    cp   MAP_INDOORS_B_START                      ; $7CEB: $FE $06
    jr   c, jr_015_7CF0                           ; $7CED: $38 $01

    inc  d                                        ; $7CEF: $14

jr_015_7CF0:
    add  hl, de                                   ; $7CF0: $19
    ld   a, [hl]                                  ; $7CF1: $7E
    or   ROOM_STATUS_EVENT_2                      ; $7CF2: $F6 $20
    ld   [hl], a                                  ; $7CF4: $77
    ldh  [hRoomStatus], a                         ; $7CF5: $E0 $F8
    ret                                           ; $7CF7: $C9

DreamShrineBedEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $7CF8: $F0 $F0
    JP_TABLE                                      ; $7CFA
._00 dw func_015_7D01                             ; $7CFB
._01 dw func_015_7D78                             ; $7CFD
._02 dw func_015_7E31                             ; $7CFF

; Dream Shrine transition sequence?
func_015_7D01::
    call func_015_7BDB                            ; $7D02: $DB
    add  $0E                                      ; $7D04: $C6 $0E
    cp   $1C                                      ; $7D06: $FE $1C
    jr   nc, jr_015_7D4F                          ; $7D08: $30 $45

    call func_015_7BEB                            ; $7D0A: $CD $EB $7B
    add  $0C                                      ; $7D0D: $C6 $0C
    cp   $18                                      ; $7D0F: $FE $18
    jr   nc, jr_015_7D4F                          ; $7D11: $30 $3C

    ldh  a, [hLinkDirection]                      ; $7D13: $F0 $9E
    and  a                                        ; $7D15: $A7
    jr   nz, jr_015_7D4F                          ; $7D16: $20 $37

    ld   a, [wCollisionType]                      ; $7D18: $FA $33 $C1
    and  a                                        ; $7D1B: $A7
    jr   z, jr_015_7D4F                           ; $7D1C: $28 $31

    call IncrementEntityState                     ; $7D1E: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7D21: $CD $05 $0C
    ld   [hl], $A0                                ; $7D24: $36 $A0
    ld   a, $01                                   ; $7D26: $3E $01
    ldh  [hLinkPositionZ], a                      ; $7D28: $E0 $A2
    ld   a, $02                                   ; $7D2A: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $7D2C: $EA $46 $C1
    ld   a, $12                                   ; $7D2F: $3E $12
    ldh  [hLinkVelocityZ], a                               ; $7D31: $E0 $A3
    ld   a, $0C                                   ; $7D33: $3E $0C
    ldh  [hLinkSpeedX], a                         ; $7D35: $E0 $9A
    xor  a                                        ; $7D37: $AF
    ldh  [hLinkSpeedY], a                         ; $7D38: $E0 $9B
    ld   a, $00                                   ; $7D3A: $3E $00
    ldh  [hLinkDirection], a                      ; $7D3C: $E0 $9E
    ld   a, $01                                   ; $7D3E: $3E $01
    ld   [wC10A], a                               ; $7D40: $EA $0A $C1
    ld   a, MUSIC_DREAMING                        ; $7D43: $3E $1E
    ld   [wMusicTrackToPlay], a                   ; $7D45: $EA $68 $D3
    xor  a                                        ; $7D48: $AF
    ld   [wTransitionSequenceCounter], a          ; $7D49: $EA $6B $C1
    ld   [wC16C], a                               ; $7D4C: $EA $6C $C1

jr_015_7D4F:
    ret                                           ; $7D4F: $C9

Data_015_7D50::
    db   $50, $07, $52, $07, $54, $00, $56, $00

Data_015_7D58::
    db   $50, $07, $52, $07, $54, $02, $56, $02

Data_015_7D60::
    db   $50, $07, $52, $07, $54, $03, $56, $03

Data_015_7D68::
    db   $00, $00, $5E, $06, $00, $08, $5E, $26

Data_015_7D70::
    db   $98, $42, $98, $50, $99, $90, $99, $82

func_015_7D78::
    ld   a, [wIsLinkInTheAir]                     ; $7D78: $FA $46 $C1
    and  a                                        ; $7D7B: $A7
    ret  nz                                       ; $7D7C: $C0

    call GetEntityTransitionCountdown             ; $7D7D: $CD $05 $0C
    jr   nz, jr_015_7D94                          ; $7D80: $20 $12

    ld   a, $01                                   ; $7D82: $3E $01
    ld   [wTransitionGfx], a                      ; $7D84: $EA $7F $C1
    xor  a                                        ; $7D87: $AF
    ld   [wTransitionGfxFrameCount], a            ; $7D88: $EA $80 $C1
    ld   a, $08                                   ; $7D8B: $3E $08
    ld   [wC3CA], a                               ; $7D8D: $EA $CA $C3
    call IncrementEntityState                     ; $7D90: $CD $12 $3B
    xor  a                                        ; $7D93: $AF

jr_015_7D94:
    push af                                       ; $7D94: $F5
    cp   $80                                      ; $7D95: $FE $80
    jr   nc, jr_015_7DEC                          ; $7D97: $30 $53

    push af                                       ; $7D99: $F5
    and  $1F                                      ; $7D9A: $E6 $1F
    jr   nz, jr_015_7DAF                          ; $7D9C: $20 $11

    ld   a, [wTransitionSequenceCounter]          ; $7D9E: $FA $6B $C1
    cp   $02                                      ; $7DA1: $FE $02
    jr   z, jr_015_7DAF                           ; $7DA3: $28 $0A

    ld   a, $03                                   ; $7DA5: $3E $03
    ld   [wC16C], a                               ; $7DA7: $EA $6C $C1
    push bc                                       ; $7DAA: $C5
    call func_1A22                               ; $7DAB: $CD $22 $1A
    pop  bc                                       ; $7DAE: $C1

jr_015_7DAF:
    pop  af                                       ; $7DAF: $F1
    and  $0F                                      ; $7DB0: $E6 $0F
    jr   nz, jr_015_7DEC                          ; $7DB2: $20 $38

    ld   hl, wEntitiesPrivateState2Table          ; $7DB4: $21 $C0 $C2
    add  hl, bc                                   ; $7DB7: $09
    ld   a, [hl]                                  ; $7DB8: $7E
    cp   $04                                      ; $7DB9: $FE $04
    jr   z, jr_015_7DEC                           ; $7DBB: $28 $2F

    ld   a, [wRequests]                           ; $7DBD: $FA $00 $D6
    ld   e, a                                     ; $7DC0: $5F
    ld   d, b                                     ; $7DC1: $50
    add  $05                                      ; $7DC2: $C6 $05
    ld   [wRequests], a                           ; $7DC4: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $7DC7: $21 $01 $D6
    add  hl, de                                   ; $7DCA: $19
    push hl                                       ; $7DCB: $E5
    ld   hl, wEntitiesPrivateState2Table          ; $7DCC: $21 $C0 $C2
    add  hl, bc                                   ; $7DCF: $09
    ld   a, [hl]                                  ; $7DD0: $7E
    inc  [hl]                                     ; $7DD1: $34
    sla  a                                        ; $7DD2: $CB $27
    ld   e, a                                     ; $7DD4: $5F
    ld   d, b                                     ; $7DD5: $50
    ld   hl, Data_015_7D70                        ; $7DD6: $21 $70 $7D
    add  hl, de                                   ; $7DD9: $19
    ld   e, l                                     ; $7DDA: $5D
    ld   d, h                                     ; $7DDB: $54
    pop  hl                                       ; $7DDC: $E1
    ld   a, [de]                                  ; $7DDD: $1A
    inc  de                                       ; $7DDE: $13
    ld   [hl+], a                                 ; $7DDF: $22
    ld   a, [de]                                  ; $7DE0: $1A
    ld   [hl+], a                                 ; $7DE1: $22
    ld   a, $01                                   ; $7DE2: $3E $01
    ld   [hl+], a                                 ; $7DE4: $22
    ld   a, $64                                   ; $7DE5: $3E $64
    ld   [hl+], a                                 ; $7DE7: $22
    ld   a, $65                                   ; $7DE8: $3E $65
    ld   [hl+], a                                 ; $7DEA: $22
    ld   [hl], b                                  ; $7DEB: $70

jr_015_7DEC:
    pop  af                                       ; $7DEC: $F1
    ld   e, $00                                   ; $7DED: $1E $00
    cp   $80                                      ; $7DEF: $FE $80
    jr   c, jr_015_7DF4                           ; $7DF1: $38 $01

    inc  e                                        ; $7DF3: $1C

jr_015_7DF4:
    ld   a, e                                     ; $7DF4: $7B

func_015_7DF5::
    ldh  [hActiveEntitySpriteVariant], a          ; $7DF5: $E0 $F1
    ld   a, $58                                   ; $7DF7: $3E $58
    ldh  [hActiveEntityPosX], a                   ; $7DF9: $E0 $EE
    ldh  [hLinkPositionX], a                      ; $7DFB: $E0 $98
    ld   a, $44                                   ; $7DFD: $3E $44
    ldh  [hActiveEntityVisualPosY], a             ; $7DFF: $E0 $EC
    ldh  [hLinkPositionY], a                      ; $7E01: $E0 $99
    ld   a, $02                                   ; $7E03: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7E05: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_NO_UPDATE       ; $7E07: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $7E09: $E0 $9D
    ld   de, Data_015_7D50                        ; $7E0B: $11 $50 $7D
    ld   a, [wTunicType]                          ; $7E0E: $FA $0F $DC
    and  a                                        ; $7E11: $A7
    jr   z, jr_015_7E1E                           ; $7E12: $28 $0A

    ld   de, Data_015_7D58                        ; $7E14: $11 $58 $7D
    cp   $01                                      ; $7E17: $FE $01
    jr   z, jr_015_7E1E                           ; $7E19: $28 $03

    ld   de, Data_015_7D60                        ; $7E1B: $11 $60 $7D

jr_015_7E1E:
    call RenderActiveEntitySpritesPair            ; $7E1E: $CD $C0 $3B
    ldh  a, [hIsGBC]                              ; $7E21: $F0 $FE
    and  a                                        ; $7E23: $A7
    jr   z, jr_015_7E2E                           ; $7E24: $28 $08

    ld   hl, Data_015_7D68                        ; $7E26: $21 $68 $7D
    ld   c, $02                                   ; $7E29: $0E $02
    call RenderActiveEntitySpritesRect            ; $7E2B: $CD $E6 $3C

jr_015_7E2E:
    jp   CopyEntityPositionToActivePosition       ; $7E2E: $C3 $8A $3D

func_015_7E31::
    xor  a                                        ; $7E31: $AF
    call func_015_7DF5                            ; $7E32: $CD $F5 $7D
    ld   a, [wTransitionGfx]                      ; $7E35: $FA $7F $C1
    and  a                                        ; $7E38: $A7
    ret  nz                                       ; $7E39: $C0

    xor  a                                        ; $7E3A: $AF
    ldh  [hLinkAnimationState], a                 ; $7E3B: $E0 $9D
    ld   hl, wWarpStructs                         ; $7E3D: $21 $01 $D4
    ld   a, $01                                   ; $7E40: $3E $01
    ld   [hl+], a                                 ; $7E42: $22
    ldh  a, [hMapId]                              ; $7E43: $F0 $F7
    ld   [hl+], a                                 ; $7E45: $22
    ld   a, $CE                                   ; $7E46: $3E $CE
    ld   [hl+], a                                 ; $7E48: $22
    ld   a, $50                                   ; $7E49: $3E $50
    ld   [hl+], a                                 ; $7E4B: $22
    ld   a, $7C                                   ; $7E4C: $3E $7C
    ld   [hl], a                                  ; $7E4E: $77
    call ClearEntityStatus_15                        ; $7E4F: $CD $31 $7C
    jp   disableMovementInTransition              ; $7E52: $C3 $9E $0C

Data_015_7E55:
    db   $58, $00

Data_015_7E57:
    db   $58, $01

Data_015_7E59:
    db   $58, $02

Data_015_7E5B:
    db   $58, $03

Data_015_7E5D:
    db   $58, $01

Data_015_7E5F::
    dw   Data_015_7E55
    dw   Data_015_7E57
    dw   Data_015_7E59
    dw   Data_015_7E5B
    dw   Data_015_7E59
    dw   Data_015_7E5B
    dw   Data_015_7E55

Data_015_7E6D::
    dw   Data_015_7E5D

Data_015_7E6F::
    db   $58, $00, $5A, $00, $5A, $20

BookEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7E75: $F0 $F1
    and  a                                        ; $7E77: $A7
    jr   z, jr_015_7E82                           ; $7E78: $28 $08

    ld   de, Data_015_7E6D                        ; $7E7A: $11 $6D $7E
    call RenderActiveEntitySpritesPair            ; $7E7D: $CD $C0 $3B
    jr   jr_015_7EA6                              ; $7E80: $18 $24

jr_015_7E82:
    ldh  a, [hIsGBC]                              ; $7E82: $F0 $FE
    and  a                                        ; $7E84: $A7
    jr   z, jr_015_7EA0                           ; $7E85: $28 $19

    push bc                                       ; $7E87: $C5
    ld   hl, Data_015_7E5F                        ; $7E88: $21 $5F $7E
    ldh  a, [hMapRoom]                            ; $7E8B: $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ; $7E8D: $FE $B5
    jr   z, jr_015_7E96                           ; $7E8F: $28 $05

    sla  c                                        ; $7E91: $CB $21
    rl   b                                        ; $7E93: $CB $10
    add  hl, bc                                   ; $7E95: $09

jr_015_7E96:
    ld   a, [hl+]                                 ; $7E96: $2A
    ld   e, a                                     ; $7E97: $5F
    ld   a, [hl]                                  ; $7E98: $7E
    ld   d, a                                     ; $7E99: $57
    pop  bc                                       ; $7E9A: $C1
    call RenderActiveEntitySprite                 ; $7E9B: $CD $77 $3C
    jr   jr_015_7EA6                              ; $7E9E: $18 $06

jr_015_7EA0:
    ld   de, Data_015_7E6F                        ; $7EA0: $11 $6F $7E
    call RenderActiveEntitySprite                 ; $7EA3: $CD $77 $3C

jr_015_7EA6:
    call func_015_7B0D                            ; $7EA6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $7EA9: $F0 $F0
    JP_TABLE                                      ; $7EAB
._00 dw func_015_7EB9                             ; $7EAC
._01 dw func_015_7F04                             ; $7EAE

Data_015_7EB0::
    db   $02, $04, $06, $00, $0A, $08, $0C, $0D, $2B

func_015_7EB9::
    ld   a, [wGameplayType]                       ; $7EB9: $FA $95 $DB
    cp   $07                                      ; $7EBC: $FE $07
    jr   z, jr_015_7EC4                           ; $7EBE: $28 $04

    xor  a                                        ; $7EC0: $AF
    ld   [wC5A2], a                               ; $7EC1: $EA $A2 $C5

jr_015_7EC4:
    xor  a                                        ; $7EC4: $AF
    call SetEntitySpriteVariant                   ; $7EC5: $CD $0C $3B
    call ShouldLinkTalkToEntity                   ; $7EC8: $CD $BC $7A
    ret  nc                                       ; $7ECB: $D0

    ldh  a, [hMapRoom]                            ; $7ECC: $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ; $7ECE: $FE $B5
    jr   nz, jr_015_7ED6                          ; $7ED0: $20 $04

    ld   e, $08                                   ; $7ED2: $1E $08
    jr   jr_015_7EF3                              ; $7ED4: $18 $1D

jr_015_7ED6:
    ld   e, $00                                   ; $7ED6: $1E $00
    ldh  a, [hActiveEntityPosX]                   ; $7ED8: $F0 $EE
    cp   $20                                      ; $7EDA: $FE $20
    jr   c, jr_015_7EE9                           ; $7EDC: $38 $0B

    inc  e                                        ; $7EDE: $1C
    cp   $40                                      ; $7EDF: $FE $40
    jr   c, jr_015_7EE9                           ; $7EE1: $38 $06

    inc  e                                        ; $7EE3: $1C
    cp   $70                                      ; $7EE4: $FE $70
    jr   c, jr_015_7EE9                           ; $7EE6: $38 $01

    inc  e                                        ; $7EE8: $1C

jr_015_7EE9:
    ldh  a, [hActiveEntityPosY]                   ; $7EE9: $F0 $EF
    cp   $40                                      ; $7EEB: $FE $40
    jr   c, jr_015_7EF3                           ; $7EED: $38 $04

    ld   a, e                                     ; $7EEF: $7B
    add  $04                                      ; $7EF0: $C6 $04
    ld   e, a                                     ; $7EF2: $5F

jr_015_7EF3:
    ld   d, b                                     ; $7EF3: $50
    ld   hl, Data_015_7EB0                        ; $7EF4: $21 $B0 $7E
    add  hl, de                                   ; $7EF7: $19
    ld   a, [hl]                                  ; $7EF8: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $7EF9: $21 $B0 $C2
    add  hl, bc                                   ; $7EFC: $09
    ld   [hl], a                                  ; $7EFD: $77
    call OpenDialogInTable2                       ; $7EFE: $CD $7C $23
    jp   IncrementEntityState                     ; $7F01: $C3 $12 $3B

func_015_7F04::
    ld   a, $01                                   ; $7F04: $3E $01
    call SetEntitySpriteVariant                   ; $7F06: $CD $0C $3B
    ld   a, [wDialogState]                        ; $7F09: $FA $9F $C1
    and  a                                        ; $7F0C: $A7
    ret  nz                                       ; $7F0D: $C0

    call IncrementEntityState                     ; $7F0E: $CD $12 $3B
    ld   [hl], b                                  ; $7F11: $70
    ld   a, [wDialogAskSelectionIndex]            ; $7F12: $FA $77 $C1
    and  a                                        ; $7F15: $A7
    jr   nz, jr_015_7F82                          ; $7F16: $20 $6A

    ld   hl, wEntitiesPrivateState1Table          ; $7F18: $21 $B0 $C2
    add  hl, bc                                   ; $7F1B: $09
    ld   a, [hl]                                  ; $7F1C: $7E
    inc  a                                        ; $7F1D: $3C
    ld   e, a                                     ; $7F1E: $5F
    cp   $0E                                      ; $7F1F: $FE $0E
    jr   nz, jr_015_7F4F                          ; $7F21: $20 $2C

    ld   a, [wTradeSequenceItem]                  ; $7F23: $FA $0E $DB
    cp   $0E                                      ; $7F26: $FE $0E
    jr   nz, jr_015_7F4F                          ; $7F28: $20 $25

    ld   a, [$DB7F]                               ; $7F2A: $FA $7F $DB
    and  a                                        ; $7F2D: $A7
    jr   nz, jr_015_7F4F                          ; $7F2E: $20 $1F

    ldh  a, [hRoomStatus]                         ; $7F30: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $7F32: $E6 $20
    jr   nz, jr_015_7F44                          ; $7F34: $20 $0E

    call func_015_7CDB                            ; $7F36: $CD $DB $7C
    call GetRandomByte                            ; $7F39: $CD $0D $28
    rla                                           ; $7F3C: $17
    rla                                           ; $7F3D: $17
    rla                                           ; $7F3E: $17
    and  $18                                      ; $7F3F: $E6 $18
    ld   [wWindFishEggMazeSequenceOffset], a      ; $7F41: $EA $7C $DB

jr_015_7F44:
    ld   a, [wWindFishEggMazeSequenceOffset]      ; $7F44: $FA $7C $DB
    rra                                           ; $7F47: $1F
    rra                                           ; $7F48: $1F
    rra                                           ; $7F49: $1F
    and  $03                                      ; $7F4A: $E6 $03
    add  $17                                      ; $7F4C: $C6 $17
    ld   e, a                                     ; $7F4E: $5F

jr_015_7F4F:
    ldh  a, [hMapRoom]                            ; $7F4F: $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ; $7F51: $FE $B5
    jr   z, jr_015_7F72                           ; $7F53: $28 $1D

    ld   a, e                                     ; $7F55: $7B
    cp   $0D                                      ; $7F56: $FE $0D
    jr   nz, jr_015_7F6F                          ; $7F58: $20 $15

    xor  a                                        ; $7F5A: $AF
    ld   [wTransitionSequenceCounter], a          ; $7F5B: $EA $6B $C1
    ld   [wC16C], a                               ; $7F5E: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $7F61: $EA $96 $DB
    ld   a, $07                                   ; $7F64: $3E $07
    ld   [wGameplayType], a                       ; $7F66: $EA $95 $DB
    ld   a, $01                                   ; $7F69: $3E $01
    ld   [wC5A2], a                               ; $7F6B: $EA $A2 $C5
    ret                                           ; $7F6E: $C9

jr_015_7F6F:
    jp   OpenDialogInTable2                       ; $7F6F: $C3 $7C $23

jr_015_7F72:
    xor  a                                        ; $7F72: $AF
    ld   [wTransitionSequenceCounter], a          ; $7F73: $EA $6B $C1
    ld   [wC16C], a                               ; $7F76: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $7F79: $EA $96 $DB
    ld   a, $0D                                   ; $7F7C: $3E $0D
    ld   [wGameplayType], a                       ; $7F7E: $EA $95 $DB
    ret                                           ; $7F81: $C9

jr_015_7F82:
    xor  a                                        ; $7F82: $AF
    jp   SetEntitySpriteVariant                   ; $7F83: $C3 $0C $3B

Data_015_7F86::
    db   $74, $03, $76, $03, $70, $03, $72, $03, $76, $23, $74, $23, $72, $23, $70, $23

AnimalD1EntityHandler::
    ld   a, [$DB74]                               ; $7F96: $FA $74 $DB
    and  a                                        ; $7F99: $A7
    jp   z, ClearEntityStatus_15            ; $7F9A: $CA $31 $7C

    ld   de, Data_015_7F86                        ; $7F9D: $11 $86 $7F
    call RenderActiveEntitySpritesPair            ; $7FA0: $CD $C0 $3B
    ld   a, [wC50F]                               ; $7FA3: $FA $0F $C5
    ld   e, a                                     ; $7FA6: $5F
    ld   d, b                                     ; $7FA7: $50
    ld   hl, wEntitiesPosXTable                   ; $7FA8: $21 $00 $C2
    add  hl, de                                   ; $7FAB: $19
    ldh  a, [hActiveEntityPosX]                   ; $7FAC: $F0 $EE
    ld   e, $00                                   ; $7FAE: $1E $00
    cp   [hl]                                     ; $7FB0: $BE
    jr   nc, jr_015_7FB5                          ; $7FB1: $30 $02

    ld   e, $02                                   ; $7FB3: $1E $02

jr_015_7FB5:
    ldh  a, [hFrameCounter]                       ; $7FB5: $F0 $E7
    rra                                           ; $7FB7: $1F
    rra                                           ; $7FB8: $1F
    rra                                           ; $7FB9: $1F
    rra                                           ; $7FBA: $1F
    rra                                           ; $7FBB: $1F
    and  $01                                      ; $7FBC: $E6 $01
    add  e                                        ; $7FBE: $83
    call SetEntitySpriteVariant                   ; $7FBF: $CD $0C $3B
    call func_015_7A6E                            ; $7FC2: $CD $6E $7A

    call ShouldLinkTalkToEntity                   ; $7FC5: $CD $BC $7A
    ret  nc                                       ; $7FC8: $D0
    jp_open_dialog $196                           ; $7FC9
