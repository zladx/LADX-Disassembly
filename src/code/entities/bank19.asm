
; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis


Data_019_4000::
    db   $F0, $00, $48, $06, $F0, $08, $48, $26, $00, $00, $4A, $06, $00, $08, $4A, $26

Data_019_4010::
    db   $F0, $00, $78, $06, $F0, $08, $78, $26, $00, $00, $7A, $06, $00, $08, $7A, $26

Data_019_4020::
    ld   d, $01                                   ; $4020: $16 $01

LiftableStatueEntityHandler::
    ld   hl, wEntitiesSubstate1Table              ; $4022: $21 $B0 $C2
    add  hl, bc                                   ; $4025: $09
    ld   a, [hl]                                  ; $4026: $7E
    and  a                                        ; $4027: $A7
    jr   z, jr_019_404A                           ; $4028: $28 $20

    ld   de, Data_019_4020                        ; $402A: $11 $20 $40
    call RenderSimpleEntityWithSpriteVariantToOAM ; $402D: $CD $77 $3C
    call func_019_7D3D                            ; $4030: $CD $3D $7D
    call func_019_7DB8                            ; $4033: $CD $B8 $7D
    call func_019_7DF1                            ; $4036: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $4039: $21 $20 $C3
    add  hl, bc                                   ; $403C: $09
    dec  [hl]                                     ; $403D: $35
    dec  [hl]                                     ; $403E: $35
    ld   hl, wEntitiesPosZTable                   ; $403F: $21 $10 $C3
    add  hl, bc                                   ; $4042: $09
    ld   a, [hl]                                  ; $4043: $7E
    and  $80                                      ; $4044: $E6 $80
    jp   nz, label_019_7E61                       ; $4046: $C2 $61 $7E

    ret                                           ; $4049: $C9

jr_019_404A:
    ld   hl, Data_019_4000                        ; $404A: $21 $00 $40
    ldh  a, [hMapId]                              ; $404D: $F0 $F7
    cp   $01                                      ; $404F: $FE $01
    jr   nz, jr_019_4056                          ; $4051: $20 $03

    ld   hl, Data_019_4010                        ; $4053: $21 $10 $40

jr_019_4056:
    ld   c, $04                                   ; $4056: $0E $04
    call label_3CE6                               ; $4058: $CD $E6 $3C
    call label_3CD9                               ; $405B: $CD $D9 $3C
    call func_019_7D3D                            ; $405E: $CD $3D $7D
    call label_C56                                ; $4061: $CD $56 $0C
    call label_3B70                               ; $4064: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $4067: $F0 $F0
    rst  $00                                      ; $4069: $C7
    ld   [hl], b                                  ; $406A: $70
    ld   b, b                                     ; $406B: $40
    inc  hl                                       ; $406C: $23
    ld   b, c                                     ; $406D: $41
    inc  hl                                       ; $406E: $23
    ld   b, c                                     ; $406F: $41
    call label_3B23                               ; $4070: $CD $23 $3B
    call func_019_7CA2                            ; $4073: $CD $A2 $7C
    call func_019_7E0B                            ; $4076: $CD $0B $7E
    add  $10                                      ; $4079: $C6 $10
    cp   $20                                      ; $407B: $FE $20
    jp   nc, label_019_411C                       ; $407D: $D2 $1C $41

    call func_019_7E1B                            ; $4080: $CD $1B $7E
    add  $20                                      ; $4083: $C6 $20
    cp   $30                                      ; $4085: $FE $30
    jp   nc, label_019_411C                       ; $4087: $D2 $1C $41

    ld   a, [$C19B]                               ; $408A: $FA $9B $C1
    and  a                                        ; $408D: $A7
    jp   nz, label_019_411C                       ; $408E: $C2 $1C $41

    ld   a, [wAButtonSlot]                        ; $4091: $FA $00 $DB
    cp   $03                                      ; $4094: $FE $03
    jr   nz, jr_019_40A0                          ; $4096: $20 $08

    ldh  a, [hPressedButtonsMask]                 ; $4098: $F0 $CB
    and  $20                                      ; $409A: $E6 $20
    jr   nz, jr_019_40AD                          ; $409C: $20 $0F

    jr   jr_019_411C                              ; $409E: $18 $7C

jr_019_40A0:
    ld   a, [wBButtonSlot]                        ; $40A0: $FA $01 $DB
    cp   $03                                      ; $40A3: $FE $03
    jr   nz, jr_019_411C                          ; $40A5: $20 $75

    ldh  a, [hPressedButtonsMask]                 ; $40A7: $F0 $CB
    and  $10                                      ; $40A9: $E6 $10
    jr   z, jr_019_411C                           ; $40AB: $28 $6F

jr_019_40AD:
    ld   a, [$C3CF]                               ; $40AD: $FA $CF $C3
    and  a                                        ; $40B0: $A7
    jr   nz, jr_019_411C                          ; $40B1: $20 $69

    ld   a, $01                                   ; $40B3: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40B5: $E0 $A1
    ld   [$C3CF], a                               ; $40B7: $EA $CF $C3
    ldh  a, [hLinkDirection]                      ; $40BA: $F0 $9E
    ld   e, a                                     ; $40BC: $5F
    ld   d, $00                                   ; $40BD: $16 $00
    ld   hl, data_1F51                            ; $40BF: $21 $51 $1F
    add  hl, de                                   ; $40C2: $19
    ld   a, [hl]                                  ; $40C3: $7E
    ldh  [hLinkAnimationState], a                 ; $40C4: $E0 $9D
    ld   hl, data_1F55                            ; $40C6: $21 $55 $1F
    add  hl, de                                   ; $40C9: $19
    ldh  a, [hPressedButtonsMask]                 ; $40CA: $F0 $CB
    and  [hl]                                     ; $40CC: $A6
    jr   z, jr_019_411C                           ; $40CD: $28 $4D

    ld   hl, data_1F59                            ; $40CF: $21 $59 $1F
    add  hl, de                                   ; $40D2: $19
    ld   a, [hl]                                  ; $40D3: $7E
    ld   [$C13C], a                               ; $40D4: $EA $3C $C1
    ld   hl, data_1F5D                            ; $40D7: $21 $5D $1F
    add  hl, de                                   ; $40DA: $19
    ld   a, [hl]                                  ; $40DB: $7E
    ld   [$C13B], a                               ; $40DC: $EA $3B $C1
    ld   hl, hLinkAnimationState                  ; $40DF: $21 $9D $FF
    inc  [hl]                                     ; $40E2: $34
    ld   a, [wPowerBraceletLevel]                 ; $40E3: $FA $43 $DB
    cp   $02                                      ; $40E6: $FE $02
    jr   nz, jr_019_411C                          ; $40E8: $20 $32

    ld   e, $08                                   ; $40EA: $1E $08
    ld   a, [wActivePowerUp]                      ; $40EC: $FA $7C $D4
    and  a                                        ; $40EF: $A7
    jr   z, jr_019_40F4                           ; $40F0: $28 $02

    ld   e, $03                                   ; $40F2: $1E $03

jr_019_40F4:
    ld   hl, wEntitiesUnknowTableY                ; $40F4: $21 $D0 $C3
    add  hl, bc                                   ; $40F7: $09
    inc  [hl]                                     ; $40F8: $34
    ld   a, [hl]                                  ; $40F9: $7E
    cp   e                                        ; $40FA: $BB
    jr   c, jr_019_4122                           ; $40FB: $38 $25

    call IncrementEntityState                     ; $40FD: $CD $12 $3B
    ld   [hl], $02                                ; $4100: $36 $02
    ld   hl, wEntitiesStatusTable                        ; $4102: $21 $80 $C2
    add  hl, bc                                   ; $4105: $09
    ld   [hl], $07                                ; $4106: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $4108: $21 $90 $C4
    add  hl, bc                                   ; $410B: $09
    ld   [hl], b                                  ; $410C: $70
    ldh  a, [hLinkDirection]                      ; $410D: $F0 $9E
    ld   [wC15D], a                               ; $410F: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $4112: $CD $05 $0C
    ld   [hl], $02                                ; $4115: $36 $02
    ld   hl, hWaveSfx                             ; $4117: $21 $F3 $FF
    ld   [hl], $02                                ; $411A: $36 $02

label_019_411C:
jr_019_411C:
    ld   hl, wEntitiesUnknowTableY                ; $411C: $21 $D0 $C3
    add  hl, bc                                   ; $411F: $09
    ld   [hl], b                                  ; $4120: $70
    ret                                           ; $4121: $C9

jr_019_4122:
    ret                                           ; $4122: $C9

    call func_019_7DB8                            ; $4123: $CD $B8 $7D
    call func_019_7DF1                            ; $4126: $CD $F1 $7D
    call label_3B23                               ; $4129: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $412C: $21 $20 $C3
    add  hl, bc                                   ; $412F: $09
    dec  [hl]                                     ; $4130: $35
    dec  [hl]                                     ; $4131: $35
    ld   hl, wEntitiesCollisionsTable             ; $4132: $21 $A0 $C2
    add  hl, bc                                   ; $4135: $09
    ld   a, [hl]                                  ; $4136: $7E
    and  $0F                                      ; $4137: $E6 $0F
    jr   nz, jr_019_4143                          ; $4139: $20 $08

    ld   hl, wEntitiesPosZTable                   ; $413B: $21 $10 $C3
    add  hl, bc                                   ; $413E: $09
    ld   a, [hl]                                  ; $413F: $7E
    and  $80                                      ; $4140: $E6 $80
    ret  z                                        ; $4142: $C8

jr_019_4143:
    call func_019_4183                            ; $4143: $CD $83 $41
    ld   a, [wRoomEvent]                          ; $4146: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $4149: $E6 $1F
    cp   TRIGGER_THROW_AT_DOOR                    ; $414B: $FE $0B
    ret  nz                                       ; $414D: $C0

    ld   a, [$C50D]                               ; $414E: $FA $0D $C5
    cp   $35                                      ; $4151: $FE $35
    jr   c, jr_019_4159                           ; $4153: $38 $04

    cp   $3D                                      ; $4155: $FE $3D
    jr   c, jr_019_4162                           ; $4157: $38 $09

jr_019_4159:
    ld   a, [$C503]                               ; $4159: $FA $03 $C5
    cp   $35                                      ; $415C: $FE $35
    ret  c                                        ; $415E: $D8

    cp   $3D                                      ; $415F: $FE $3D
    ret  nc                                       ; $4161: $D0

jr_019_4162:
    jp   MarkTriggerAsResolved                    ; $4162: $C3 $60 $0C

    nop                                           ; $4165: $00
    ld   [$800], sp                          ; $4166: $08 $00 $08
    nop                                           ; $4169: $00
    ld   [$F8F8], sp                              ; $416A: $08 $F8 $F8
    nop                                           ; $416D: $00
    nop                                           ; $416E: $00
    ld   [$FC08], sp                              ; $416F: $08 $08 $FC
    dec  b                                        ; $4172: $05
    ld   a, [$FB06]                               ; $4173: $FA $06 $FB
    inc  b                                        ; $4176: $04
    db   $FC                                      ; $4177: $FC
    ld   hl, sp-$02                               ; $4178: $F8 $FE
    rst  $38                                      ; $417A: $FF
    inc  bc                                       ; $417B: $03
    ld   [bc], a                                  ; $417C: $02
    jr   jr_019_4193                              ; $417D: $18 $14

    inc  de                                       ; $417F: $13
    ld   d, $12                                   ; $4180: $16 $12
    inc  d                                        ; $4182: $14

func_019_4183:
    ld   a, $00                                   ; $4183: $3E $00

jr_019_4185:
    ldh  [hFFE8], a                               ; $4185: $E0 $E8
    ld   a, $9D                                   ; $4187: $3E $9D
    call SpawnNewEntity_trampoline                ; $4189: $CD $86 $3B
    jr   c, jr_019_41E2                           ; $418C: $38 $54

    ld   hl, wEntitiesSubstate1Table              ; $418E: $21 $B0 $C2
    add  hl, de                                   ; $4191: $19
    inc  [hl]                                     ; $4192: $34

jr_019_4193:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4193: $21 $40 $C3
    add  hl, de                                   ; $4196: $19
    ld   [hl], $C1                                ; $4197: $36 $C1
    push bc                                       ; $4199: $C5
    ldh  a, [hFFE8]                               ; $419A: $F0 $E8
    ld   c, a                                     ; $419C: $4F
    ld   hl, $4165                                ; $419D: $21 $65 $41
    add  hl, bc                                   ; $41A0: $09
    ldh  a, [hScratch0]                           ; $41A1: $F0 $D7
    add  [hl]                                     ; $41A3: $86
    ld   hl, wEntitiesPosXTable                         ; $41A4: $21 $00 $C2
    add  hl, de                                   ; $41A7: $19
    ld   [hl], a                                  ; $41A8: $77
    ld   hl, $416B                                ; $41A9: $21 $6B $41
    add  hl, bc                                   ; $41AC: $09
    ldh  a, [hScratch1]                           ; $41AD: $F0 $D8
    add  [hl]                                     ; $41AF: $86
    ld   hl, wEntitiesPosYTable                         ; $41B0: $21 $10 $C2
    add  hl, de                                   ; $41B3: $19
    ld   [hl], a                                  ; $41B4: $77
    ldh  a, [hScratch3]                           ; $41B5: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $41B7: $21 $10 $C3
    add  hl, de                                   ; $41BA: $19
    ld   [hl], a                                  ; $41BB: $77
    ld   hl, $4171                                ; $41BC: $21 $71 $41
    add  hl, bc                                   ; $41BF: $09
    ld   a, [hl]                                  ; $41C0: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $41C1: $21 $40 $C2
    add  hl, de                                   ; $41C4: $19
    ld   [hl], a                                  ; $41C5: $77
    ld   hl, $4177                                ; $41C6: $21 $77 $41
    add  hl, bc                                   ; $41C9: $09
    ld   a, [hl]                                  ; $41CA: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $41CB: $21 $50 $C2
    add  hl, de                                   ; $41CE: $19
    ld   [hl], a                                  ; $41CF: $77
    ld   hl, $417D                                ; $41D0: $21 $7D $41
    add  hl, bc                                   ; $41D3: $09
    ld   a, [hl]                                  ; $41D4: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $41D5: $21 $20 $C3
    add  hl, de                                   ; $41D8: $19
    ld   [hl], a                                  ; $41D9: $77
    pop  bc                                       ; $41DA: $C1
    ldh  a, [hFFE8]                               ; $41DB: $F0 $E8
    inc  a                                        ; $41DD: $3C
    cp   $06                                      ; $41DE: $FE $06
    jr   nz, jr_019_4185                          ; $41E0: $20 $A3

jr_019_41E2:
    ld   a, $29                                   ; $41E2: $3E $29
    ldh  [hNoiseSfx], a                           ; $41E4: $E0 $F4
    ldh  a, [wActiveEntityPosX]                   ; $41E6: $F0 $EE
    ldh  [hScratch0], a                           ; $41E8: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $41EA: $F0 $EC
    ldh  [hScratch1], a                           ; $41EC: $E0 $D8
    ld   a, $02                                   ; $41EE: $3E $02
    call label_CC7                                ; $41F0: $CD $C7 $0C
    ldh  a, [wActiveEntityPosY]                   ; $41F3: $F0 $EC
    sub  $10                                      ; $41F5: $D6 $10
    ldh  [hScratch1], a                           ; $41F7: $E0 $D8
    ld   a, $02                                   ; $41F9: $3E $02
    call label_CC7                                ; $41FB: $CD $C7 $0C
    jp   label_019_7E61                           ; $41FE: $C3 $61 $7E

    rla                                           ; $4201: $17
    ld   de, $2836                                ; $4202: $11 $36 $28
    ld   b, l                                     ; $4205: $45
    ld   d, d                                     ; $4206: $52
    ld   a, d                                     ; $4207: $7A
    ld   h, h                                     ; $4208: $64
    sub  e                                        ; $4209: $93
    and  c                                        ; $420A: $A1
    push bc                                       ; $420B: $C5
    call nc, $0E28                                ; $420C: $D4 $28 $0E
    ccf                                           ; $420F: $3F
    ld   e, l                                     ; $4210: $5D

WarpEntityHandler::
    ld   a, [wIsIndoor]                           ; $4211: $FA $A5 $DB
    and  a                                        ; $4214: $A7
    jr   nz, jr_019_4279                          ; $4215: $20 $62

    ldh  a, [hMapRoom]                            ; $4217: $F0 $F6
    cp   $CF                                      ; $4219: $FE $CF
    jr   z, jr_019_4226                           ; $421B: $28 $09

    cp   $DE                                      ; $421D: $FE $DE
    jr   z, jr_019_4226                           ; $421F: $28 $05

    cp   $CE                                      ; $4221: $FE $CE
    jp   nz, label_019_4406                       ; $4223: $C2 $06 $44

jr_019_4226:
    call func_019_7D3D                            ; $4226: $CD $3D $7D
    ld   a, [$C146]                               ; $4229: $FA $46 $C1
    and  a                                        ; $422C: $A7
    ret  nz                                       ; $422D: $C0

    ldh  a, [hLinkPositionX]                      ; $422E: $F0 $98
    sub  $50                                      ; $4230: $D6 $50
    add  $03                                      ; $4232: $C6 $03
    cp   $06                                      ; $4234: $FE $06
    ret  nc                                       ; $4236: $D0

    ldh  a, [hLinkPositionY]                      ; $4237: $F0 $99
    sub  $46                                      ; $4239: $D6 $46
    add  $04                                      ; $423B: $C6 $04
    cp   $08                                      ; $423D: $FE $08
    ret  nc                                       ; $423F: $D0

    ld   a, $01                                   ; $4240: $3E $01
    ld   [wWarpStructs], a                        ; $4242: $EA $01 $D4
    ld   a, $1F                                   ; $4245: $3E $1F
    ld   [wWarp0Map], a                           ; $4247: $EA $02 $D4
    ld   a, $F8                                   ; $424A: $3E $F8
    ld   [wWarp0Room], a                          ; $424C: $EA $03 $D4
    ld   a, $50                                   ; $424F: $3E $50
    ld   [wWarp0DestinationX], a                  ; $4251: $EA $04 $D4
    ldh  [hLinkPositionX], a                      ; $4254: $E0 $98
    ld   a, $48                                   ; $4256: $3E $48
    ld   [wWarp0DestinationY], a                  ; $4258: $EA $05 $D4
    ldh  [hLinkPositionY], a                      ; $425B: $E0 $99
    ld   a, $45                                   ; $425D: $3E $45
    ld   [wWarp0PositionTileIndex], a             ; $425F: $EA $16 $D4
    ld   a, $06                                   ; $4262: $3E $06
    ld   [wLinkMotionState], a                    ; $4264: $EA $1C $C1
    call ResetSpinAttack                                ; $4267: $CD $AF $0C
    ld   [$C198], a                               ; $426A: $EA $98 $C1
    ld   a, $51                                   ; $426D: $3E $51
    ld   [$DBCB], a                               ; $426F: $EA $CB $DB
    ld   a, $0C                                   ; $4272: $3E $0C
    ldh  [hWaveSfx], a                            ; $4274: $E0 $F3
    jp   label_019_7E61                           ; $4276: $C3 $61 $7E

jr_019_4279:
    ld   a, $01                                   ; $4279: $3E $01
    ld   [$C19D], a                               ; $427B: $EA $9D $C1
    ldh  a, [hMapId]                              ; $427E: $F0 $F7
    ld   e, a                                     ; $4280: $5F
    ld   d, b                                     ; $4281: $50
    ld   hl, wHasInstrument1                      ; $4282: $21 $65 $DB
    add  hl, de                                   ; $4285: $19
    ld   a, [hl]                                  ; $4286: $7E
    and  $01                                      ; $4287: $E6 $01
    jp   z, label_019_42E0                        ; $4289: $CA $E0 $42

    call func_019_43A9                            ; $428C: $CD $A9 $43
    ldh  a, [hActiveEntityState]                  ; $428F: $F0 $F0
    rst  $00                                      ; $4291: $C7
    sbc  d                                        ; $4292: $9A
    ld   b, d                                     ; $4293: $42
    and  e                                        ; $4294: $A3
    ld   b, d                                     ; $4295: $42
    cp   b                                        ; $4296: $B8
    ld   b, d                                     ; $4297: $42
    push af                                       ; $4298: $F5
    ld   b, d                                     ; $4299: $42
    call IncrementEntityState                     ; $429A: $CD $12 $3B
    ld   a, $1B                                   ; $429D: $3E $1B
    ld   [wActiveMusicTrack], a                   ; $429F: $EA $68 $D3
    ret                                           ; $42A2: $C9

    call func_019_7E0B                            ; $42A3: $CD $0B $7E
    add  $04                                      ; $42A6: $C6 $04
    cp   $08                                      ; $42A8: $FE $08
    jp   nc, IncrementEntityState           ; $42AA: $D2 $12 $3B

    call func_019_7E1B                            ; $42AD: $CD $1B $7E
    add  $04                                      ; $42B0: $C6 $04
    cp   $08                                      ; $42B2: $FE $08
    ret  c                                        ; $42B4: $D8

    jp   IncrementEntityState                     ; $42B5: $C3 $12 $3B

    ldh  a, [hLinkPositionZ]                      ; $42B8: $F0 $A2
    and  a                                        ; $42BA: $A7
    jr   nz, jr_019_42E0                          ; $42BB: $20 $23

    call func_019_7E0B                            ; $42BD: $CD $0B $7E
    add  $03                                      ; $42C0: $C6 $03
    cp   $06                                      ; $42C2: $FE $06
    jr   nc, jr_019_42E0                          ; $42C4: $30 $1A

    call func_019_7E1B                            ; $42C6: $CD $1B $7E
    add  $03                                      ; $42C9: $C6 $03
    cp   $06                                      ; $42CB: $FE $06
    jr   nc, jr_019_42E0                          ; $42CD: $30 $11

    call IncrementEntityState                     ; $42CF: $CD $12 $3B
    ld   a, $20                                   ; $42D2: $3E $20
    ld   [$C1C6], a                               ; $42D4: $EA $C6 $C1
    call GetEntityTransitionCountdown             ; $42D7: $CD $05 $0C
    ld   [hl], $50                                ; $42DA: $36 $50
    ld   a, $1C                                   ; $42DC: $3E $1C
    ldh  [hJingle], a                             ; $42DE: $E0 $F2

label_019_42E0:
jr_019_42E0:
    ret                                           ; $42E0: $C9

    db   $E4                                      ; $42E1: $E4
    db   $E4                                      ; $42E2: $E4
    db   $E4                                      ; $42E3: $E4
    db   $E4                                      ; $42E4: $E4
    sub  h                                        ; $42E5: $94
    sub  h                                        ; $42E6: $94
    sub  h                                        ; $42E7: $94
    sub  h                                        ; $42E8: $94
    ld   d, h                                     ; $42E9: $54
    ld   d, h                                     ; $42EA: $54
    ld   d, h                                     ; $42EB: $54
    ld   d, h                                     ; $42EC: $54
    nop                                           ; $42ED: $00
    nop                                           ; $42EE: $00
    nop                                           ; $42EF: $00
    nop                                           ; $42F0: $00
    nop                                           ; $42F1: $00
    inc  bc                                       ; $42F2: $03
    ld   bc, $CD02                                ; $42F3: $01 $02 $CD
    xor  a                                        ; $42F6: $AF
    inc  c                                        ; $42F7: $0C
    ld   [wDB94], a                               ; $42F8: $EA $94 $DB
    ld   [$DBC7], a                               ; $42FB: $EA $C7 $DB
    ld   [$C13E], a                               ; $42FE: $EA $3E $C1
    ld   [wSwordAnimationState], a                ; $4301: $EA $37 $C1
    ld   [wC16A], a                               ; $4304: $EA $6A $C1
    ld   [wLinkPlayingOcarinaCountdown], a        ; $4307: $EA $66 $C1
    ld   [wDialogGotItem], a                      ; $430A: $EA $A9 $C1
    inc  a                                        ; $430D: $3C
    ld   [wC167], a                               ; $430E: $EA $67 $C1
    ldh  a, [wActiveEntityPosX]                   ; $4311: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $4313: $E0 $98
    ldh  a, [wActiveEntityPosY]                   ; $4315: $F0 $EC
    ldh  [hLinkPositionY], a                      ; $4317: $E0 $99
    call GetEntityTransitionCountdown             ; $4319: $CD $05 $0C
    jr   nz, jr_019_4355                          ; $431C: $20 $37

    ld   hl, wWarpStructs                         ; $431E: $21 $01 $D4
    ld   a, $01                                   ; $4321: $3E $01
    ld   [hl+], a                                 ; $4323: $22
    ldh  a, [hMapId]                              ; $4324: $F0 $F7
    ld   [hl+], a                                 ; $4326: $22
    inc  hl                                       ; $4327: $23
    ld   a, $50                                   ; $4328: $3E $50
    ld   [hl+], a                                 ; $432A: $22
    push hl                                       ; $432B: $E5
    ldh  a, [hMapId]                              ; $432C: $F0 $F7
    ld   e, a                                     ; $432E: $5F
    sla  e                                        ; $432F: $CB $23
    ld   d, $00                                   ; $4331: $16 $00
    ld   hl, $4201                                ; $4333: $21 $01 $42
    add  hl, de                                   ; $4336: $19
    ldh  a, [hMapRoom]                            ; $4337: $F0 $F6
    cp   [hl]                                     ; $4339: $BE
    jr   nz, jr_019_433D                          ; $433A: $20 $01

    inc  hl                                       ; $433C: $23

jr_019_433D:
    ld   a, [hl]                                  ; $433D: $7E
    ld   [wWarp0Room], a                          ; $433E: $EA $03 $D4
    pop  hl                                       ; $4341: $E1
    cp   $64                                      ; $4342: $FE $64
    ld   a, $48                                   ; $4344: $3E $48
    jr   nz, jr_019_434A                          ; $4346: $20 $02

    ld   a, $28                                   ; $4348: $3E $28

jr_019_434A:
    ld   [hl], a                                  ; $434A: $77
    xor  a                                        ; $434B: $AF
    ld   [wC167], a                               ; $434C: $EA $67 $C1
    call func_019_7E61                            ; $434F: $CD $61 $7E
    jp   label_C9E                                ; $4352: $C3 $9E $0C

jr_019_4355:
    ld   hl, hLinkInteractiveMotionBlocked                                ; $4355: $21 $A1 $FF
    ld   [hl], $01                                ; $4358: $36 $01
    push af                                       ; $435A: $F5
    ldh  a, [hFrameCounter]                       ; $435B: $F0 $E7
    rra                                           ; $435D: $1F
    rra                                           ; $435E: $1F
    rra                                           ; $435F: $1F
    and  $03                                      ; $4360: $E6 $03
    ld   e, a                                     ; $4362: $5F
    ld   d, b                                     ; $4363: $50
    ld   hl, $42F1                                ; $4364: $21 $F1 $42
    add  hl, de                                   ; $4367: $19
    ld   a, [hl]                                  ; $4368: $7E
    ldh  [hLinkDirection], a                      ; $4369: $E0 $9E
    push bc                                       ; $436B: $C5
    call $0BF0                                    ; $436C: $CD $F0 $0B
    pop  bc                                       ; $436F: $C1
    ld   hl, wEntitiesUnknowTableP                ; $4370: $21 $40 $C4
    add  hl, bc                                   ; $4373: $09
    pop  af                                       ; $4374: $F1
    cp   $40                                      ; $4375: $FE $40
    jr   nc, jr_019_4383                          ; $4377: $30 $0A

    and  $03                                      ; $4379: $E6 $03
    jr   nz, jr_019_4383                          ; $437B: $20 $06

    ld   a, [hl]                                  ; $437D: $7E
    cp   $0C                                      ; $437E: $FE $0C
    jr   z, jr_019_4383                           ; $4380: $28 $01

    inc  [hl]                                     ; $4382: $34

jr_019_4383:
    ldh  a, [hFrameCounter]                       ; $4383: $F0 $E7
    and  $03                                      ; $4385: $E6 $03
    add  [hl]                                     ; $4387: $86
    ld   e, a                                     ; $4388: $5F
    ld   d, b                                     ; $4389: $50
    ld   hl, $42E1                                ; $438A: $21 $E1 $42
    add  hl, de                                   ; $438D: $19
    ld   a, [hl]                                  ; $438E: $7E
    ld   [wBGPalette], a                          ; $438F: $EA $97 $DB
    ret                                           ; $4392: $C9

    ld   e, $02                                   ; $4393: $1E $02
    ld   e, $62                                   ; $4395: $1E $62
    ld   e, $42                                   ; $4397: $1E $42
    ld   e, $22                                   ; $4399: $1E $22
    ld   hl, sp-$06                               ; $439B: $F8 $FA
    nop                                           ; $439D: $00
    ld   b, $08                                   ; $439E: $06 $08
    ld   b, $00                                   ; $43A0: $06 $00
    ld   a, [$FAF8]                               ; $43A2: $FA $F8 $FA
    inc  h                                        ; $43A5: $24
    ld   bc, $0124                                ; $43A6: $01 $24 $01

func_019_43A9:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $43A9: $21 $40 $C3
    add  hl, bc                                   ; $43AC: $09
    ld   [hl], $C2                                ; $43AD: $36 $C2
    ldh  a, [hFrameCounter]                       ; $43AF: $F0 $E7
    rra                                           ; $43B1: $1F
    rra                                           ; $43B2: $1F
    rra                                           ; $43B3: $1F
    and  $01                                      ; $43B4: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a               ; $43B6: $E0 $F1
    ld   de, $4393                                ; $43B8: $11 $93 $43
    call RenderAnimatedActiveEntity                               ; $43BB: $CD $C0 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $43BE: $21 $40 $C3
    add  hl, bc                                   ; $43C1: $09
    ld   [hl], $C1                                ; $43C2: $36 $C1
    xor  a                                        ; $43C4: $AF

jr_019_43C5:
    ldh  [hFFE8], a                               ; $43C5: $E0 $E8
    ld   e, a                                     ; $43C7: $5F
    call func_019_43D4                            ; $43C8: $CD $D4 $43
    ldh  a, [hFFE8]                               ; $43CB: $F0 $E8
    add  $02                                      ; $43CD: $C6 $02
    and  $07                                      ; $43CF: $E6 $07
    jr   nz, jr_019_43C5                          ; $43D1: $20 $F2

    ret                                           ; $43D3: $C9

func_019_43D4:
    ldh  a, [hFrameCounter]                       ; $43D4: $F0 $E7
    rra                                           ; $43D6: $1F
    rra                                           ; $43D7: $1F
    rra                                           ; $43D8: $1F
    nop                                           ; $43D9: $00
    add  e                                        ; $43DA: $83
    and  $07                                      ; $43DB: $E6 $07
    ld   e, a                                     ; $43DD: $5F
    ld   d, b                                     ; $43DE: $50
    ld   hl, $439D                                ; $43DF: $21 $9D $43
    add  hl, de                                   ; $43E2: $19
    ldh  a, [wActiveEntityPosX]                   ; $43E3: $F0 $EE
    add  [hl]                                     ; $43E5: $86
    ldh  [wActiveEntityPosX], a                   ; $43E6: $E0 $EE
    ld   hl, $439B                                ; $43E8: $21 $9B $43
    add  hl, de                                   ; $43EB: $19
    ldh  a, [wActiveEntityPosY]                   ; $43EC: $F0 $EC
    add  [hl]                                     ; $43EE: $86
    ldh  [wActiveEntityPosY], a                   ; $43EF: $E0 $EC
    ld   de, $43A5                                ; $43F1: $11 $A5 $43
    call RenderSimpleEntityWithSpriteVariantToOAM ; $43F4: $CD $77 $3C
    jp   label_3D8A                               ; $43F7: $C3 $8A $3D

    ld   a, [$00FC]                               ; $43FA: $FA $FC $00
    inc  b                                        ; $43FD: $04
    ld   b, $04                                   ; $43FE: $06 $04
    nop                                           ; $4400: $00
    db   $FC                                      ; $4401: $FC
    ld   a, [$3EFC]                               ; $4402: $FA $FC $3E
    nop                                           ; $4405: $00

label_019_4406:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4406: $21 $40 $C3
    add  hl, bc                                   ; $4409: $09
    ld   [hl], $C1                                ; $440A: $36 $C1
    ldh  a, [hFrameCounter]                       ; $440C: $F0 $E7
    rla                                           ; $440E: $17
    rla                                           ; $440F: $17
    and  $10                                      ; $4410: $E6 $10
    ldh  [$FFED], a                               ; $4412: $E0 $ED
    ldh  a, [wActiveEntityPosX]                   ; $4414: $F0 $EE
    ldh  [$FFE5], a                               ; $4416: $E0 $E5
    ldh  a, [wActiveEntityPosY]                   ; $4418: $F0 $EC
    ldh  [hFreeWarpDataAddress], a                ; $441A: $E0 $E6
    xor  a                                        ; $441C: $AF

jr_019_441D:
    ldh  [hFFE8], a                               ; $441D: $E0 $E8
    ld   e, a                                     ; $441F: $5F
    call func_019_442C                            ; $4420: $CD $2C $44
    ldh  a, [hFFE8]                               ; $4423: $F0 $E8
    add  $02                                      ; $4425: $C6 $02
    and  $07                                      ; $4427: $E6 $07
    jr   nz, jr_019_441D                          ; $4429: $20 $F2

    ret                                           ; $442B: $C9

func_019_442C:
    ldh  a, [hFrameCounter]                       ; $442C: $F0 $E7
    rra                                           ; $442E: $1F
    rra                                           ; $442F: $1F
    rra                                           ; $4430: $1F
    nop                                           ; $4431: $00
    add  e                                        ; $4432: $83
    and  $07                                      ; $4433: $E6 $07
    ld   e, a                                     ; $4435: $5F
    ld   d, b                                     ; $4436: $50
    ld   hl, $43FC                                ; $4437: $21 $FC $43
    add  hl, de                                   ; $443A: $19
    ldh  a, [$FFE5]                               ; $443B: $F0 $E5
    add  [hl]                                     ; $443D: $86
    ldh  [wActiveEntityPosX], a                   ; $443E: $E0 $EE
    ld   hl, $43FA                                ; $4440: $21 $FA $43
    add  hl, de                                   ; $4443: $19
    ldh  a, [hFreeWarpDataAddress]                ; $4444: $F0 $E6
    add  [hl]                                     ; $4446: $86
    add  $04                                      ; $4447: $C6 $04
    ldh  [wActiveEntityPosY], a                   ; $4449: $E0 $EC
    ld   de, $4404                                ; $444B: $11 $04 $44
    jp   RenderSimpleEntityWithSpriteVariantToOAM                               ; $444E: $C3 $77 $3C

    jr   c, @+$16                                 ; $4451: $38 $14

    jr   c, jr_019_4489                           ; $4453: $38 $34

    and  h                                        ; $4455: $A4
    inc  d                                        ; $4456: $14
    rst  $38                                      ; $4457: $FF
    rst  $38                                      ; $4458: $FF
    jr   c, @+$56                                 ; $4459: $38 $54

    jr   c, jr_019_44D1                           ; $445B: $38 $74

    rst  $38                                      ; $445D: $FF
    rst  $38                                      ; $445E: $FF
    and  h                                        ; $445F: $A4
    inc  [hl]                                     ; $4460: $34

include "code/entities/boomerang.asm"

    nop                                           ; $44FC: $00
    nop                                           ; $44FD: $00
    ld   [$0020], sp                              ; $44FE: $08 $20 $00
    ld   [$2006], sp                              ; $4501: $08 $06 $20
    nop                                           ; $4504: $00
    nop                                           ; $4505: $00
    ld   b, $00                                   ; $4506: $06 $00
    nop                                           ; $4508: $00
    ld   [$0008], sp                              ; $4509: $08 $08 $00
    nop                                           ; $450C: $00
    inc  b                                        ; $450D: $04
    inc  b                                        ; $450E: $04
    ld   b, b                                     ; $450F: $40
    rst  $38                                      ; $4510: $FF
    rst  $38                                      ; $4511: $FF
    rst  $38                                      ; $4512: $FF
    rst  $38                                      ; $4513: $FF
    nop                                           ; $4514: $00
    inc  b                                        ; $4515: $04
    inc  b                                        ; $4516: $04
    nop                                           ; $4517: $00
    rst  $38                                      ; $4518: $FF
    rst  $38                                      ; $4519: $FF
    rst  $38                                      ; $451A: $FF
    rst  $38                                      ; $451B: $FF
    nop                                           ; $451C: $00
    nop                                           ; $451D: $00
    db   $FC                                      ; $451E: $FC
    inc  b                                        ; $451F: $04
    ld   bc, $0001                                ; $4520: $01 $01 $00
    nop                                           ; $4523: $00

SwordBeamEntityHandler::
    ld   hl, wActiveProjectileCount               ; $4524: $21 $4D $C1
    inc  [hl]                                     ; $4527: $34
    ldh  a, [hActiveEntityState]                  ; $4528: $F0 $F0
    and  a                                        ; $452A: $A7
    jr   nz, jr_019_4562                          ; $452B: $20 $35

    ldh  a, [hLinkDirection]                      ; $452D: $F0 $9E
    ld   e, a                                     ; $452F: $5F
    ld   d, b                                     ; $4530: $50
    ld   hl, $451C                                ; $4531: $21 $1C $45
    add  hl, de                                   ; $4534: $19
    ldh  a, [hLinkPositionX]                      ; $4535: $F0 $98
    add  [hl]                                     ; $4537: $86
    ld   hl, wEntitiesPosXTable                         ; $4538: $21 $00 $C2
    add  hl, bc                                   ; $453B: $09
    ld   [hl], a                                  ; $453C: $77
    ld   hl, $4520                                ; $453D: $21 $20 $45
    add  hl, de                                   ; $4540: $19
    ldh  a, [hLinkPositionY]                      ; $4541: $F0 $99
    add  [hl]                                     ; $4543: $86
    ld   hl, wEntitiesPosYTable                         ; $4544: $21 $10 $C2
    add  hl, bc                                   ; $4547: $09
    ld   [hl], a                                  ; $4548: $77
    ld   hl, wEntitiesSpeedXTable                       ; $4549: $21 $40 $C2
    add  hl, bc                                   ; $454C: $09
    sla  [hl]                                     ; $454D: $CB $26
    ld   hl, wEntitiesSpeedYTable                       ; $454F: $21 $50 $C2
    add  hl, bc                                   ; $4552: $09
    sla  [hl]                                     ; $4553: $CB $26
    ld   hl, wEntitiesFlashCountdownTable         ; $4555: $21 $20 $C4
    add  hl, bc                                   ; $4558: $09
    ld   [hl], $FF                                ; $4559: $36 $FF
    ld   a, $3B                                   ; $455B: $3E $3B
    ldh  [hJingle], a                             ; $455D: $E0 $F2
    jp   IncrementEntityState                     ; $455F: $C3 $12 $3B

jr_019_4562:
    call func_019_45B2                            ; $4562: $CD $B2 $45
    call func_019_7D3D                            ; $4565: $CD $3D $7D
    ld   a, $01                                   ; $4568: $3E $01
    ld   [$C19E], a                               ; $456A: $EA $9E $C1
    call label_3B7B                               ; $456D: $CD $7B $3B
    call func_019_7DB8                            ; $4570: $CD $B8 $7D
    call label_3B2E                               ; $4573: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $4576: $21 $A0 $C2
    add  hl, bc                                   ; $4579: $09
    ld   a, [hl]                                  ; $457A: $7E
    and  a                                        ; $457B: $A7
    jr   nz, jr_019_45A0                          ; $457C: $20 $22

    ldh  a, [hFrameCounter]                       ; $457E: $F0 $E7
    inc  a                                        ; $4580: $3C
    and  $03                                      ; $4581: $E6 $03
    jr   nz, jr_019_459F                          ; $4583: $20 $1A

    ldh  a, [wActiveEntityPosX]                   ; $4585: $F0 $EE
    ldh  [hScratch0], a                           ; $4587: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4589: $F0 $EC
    ldh  [hScratch1], a                           ; $458B: $E0 $D8
    ld   a, $0D                                   ; $458D: $3E $0D
    call label_CC7                                ; $458F: $CD $C7 $0C
    ld   hl, $C520                                ; $4592: $21 $20 $C5
    add  hl, de                                   ; $4595: $19
    ld   [hl], $08                                ; $4596: $36 $08
    ldh  a, [hActiveEntitySpriteVariant]               ; $4598: $F0 $F1
    ld   hl, $C590                                ; $459A: $21 $90 $C5
    add  hl, de                                   ; $459D: $19
    ld   [hl], a                                  ; $459E: $77

jr_019_459F:
    ret                                           ; $459F: $C9

jr_019_45A0:
    call func_019_7E61                            ; $45A0: $CD $61 $7E

func_019_45A3:
    ldh  a, [wActiveEntityPosX]                   ; $45A3: $F0 $EE
    ldh  [hScratch0], a                           ; $45A5: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $45A7: $F0 $EC
    add  $03                                      ; $45A9: $C6 $03
    ldh  [hScratch1], a                           ; $45AB: $E0 $D8
    ld   a, $05                                   ; $45AD: $3E $05
    jp   label_CC7                                ; $45AF: $C3 $C7 $0C

func_019_45B2:
    ldh  a, [hActiveEntitySpriteVariant]               ; $45B2: $F0 $F1
    rla                                           ; $45B4: $17
    rla                                           ; $45B5: $17
    rla                                           ; $45B6: $17
    and  $F8                                      ; $45B7: $E6 $F8
    ld   e, a                                     ; $45B9: $5F
    ld   d, b                                     ; $45BA: $50
    ld   hl, $44FC                                ; $45BB: $21 $FC $44
    add  hl, de                                   ; $45BE: $19
    ld   c, $02                                   ; $45BF: $0E $02
    jp   label_3CE6                               ; $45C1: $C3 $E6 $3C

    ld   h, b                                     ; $45C4: $60
    ld   bc, $0162                                ; $45C5: $01 $62 $01
    ld   h, d                                     ; $45C8: $62
    ld   hl, $2160                                ; $45C9: $21 $60 $21
    ld   h, h                                     ; $45CC: $64
    ld   bc, $0166                                ; $45CD: $01 $66 $01
    ld   h, [hl]                                  ; $45D0: $66
    ld   hl, $2164                                ; $45D1: $21 $64 $21
    ld   l, b                                     ; $45D4: $68
    ld   bc, $016A                                ; $45D5: $01 $6A $01
    ld   l, h                                     ; $45D8: $6C
    ld   bc, Start.notGBC                         ; $45D9: $01 $6E $01
    ld   l, d                                     ; $45DC: $6A
    ld   hl, $2168                                ; $45DD: $21 $68 $21
    ld   l, [hl]                                  ; $45E0: $6E
    ld   hl, $216C                                ; $45E1: $21 $6C $21

label_019_45E4:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $45E4: $21 $40 $C3
    add  hl, bc                                   ; $45E7: $09
    set  6, [hl]                                  ; $45E8: $CB $F6
    set  7, [hl]                                  ; $45EA: $CB $FE
    ld   a, [wTradeSequenceItem]                  ; $45EC: $FA $0E $DB
    cp   $0E                                      ; $45EF: $FE $0E
    jp   nz, label_019_7E61                       ; $45F1: $C2 $61 $7E

    ld   a, [$DB7F]                               ; $45F4: $FA $7F $DB
    and  a                                        ; $45F7: $A7
    jp   nz, label_019_7E61                       ; $45F8: $C2 $61 $7E

    ld   hl, wEntitiesPosXTable                         ; $45FB: $21 $00 $C2
    add  hl, bc                                   ; $45FE: $09
    ld   [hl], $50                                ; $45FF: $36 $50
    ld   de, $45C4                                ; $4601: $11 $C4 $45
    call RenderAnimatedActiveEntity                               ; $4604: $CD $C0 $3B
    call func_019_7CD4                            ; $4607: $CD $D4 $7C
    ldh  a, [hFrameCounter]                       ; $460A: $F0 $E7
    and  $3F                                      ; $460C: $E6 $3F
    jr   nz, jr_019_4618                          ; $460E: $20 $08

    call func_019_7E3A                            ; $4610: $CD $3A $7E
    ld   hl, wEntitiesDirectionTable              ; $4613: $21 $80 $C3
    add  hl, bc                                   ; $4616: $09
    ld   [hl], e                                  ; $4617: $73

jr_019_4618:
    call func_019_7CA2                            ; $4618: $CD $A2 $7C
    ldh  a, [hActiveEntityState]                  ; $461B: $F0 $F0
    rst  $00                                      ; $461D: $C7
    ld   h, $46                                   ; $461E: $26 $46
    sub  b                                        ; $4620: $90
    ld   b, [hl]                                  ; $4621: $46
    ld   b, a                                     ; $4622: $47
    ld   b, a                                     ; $4623: $47
    rst  $20                                      ; $4624: $E7
    ld   b, [hl]                                  ; $4625: $46
    call func_019_7D3D                            ; $4626: $CD $3D $7D
    ld   e, b                                     ; $4629: $58
    ldh  a, [hLinkPositionY]                      ; $462A: $F0 $99
    ld   hl, $FFEF                                ; $462C: $21 $EF $FF
    sub  [hl]                                     ; $462F: $96
    add  $26                                      ; $4630: $C6 $26
    cp   $4C                                      ; $4632: $FE $4C
    call func_019_7CFB                            ; $4634: $CD $FB $7C
    ret  nc                                       ; $4637: $D0

    ld   a, [$DB7D]                               ; $4638: $FA $7D $DB
    cp   $00                                      ; $463B: $FE $00
    jr   z, jr_019_4643                           ; $463D: $28 $04

    cp   $0D                                      ; $463F: $FE $0D
    jr   nz, @+$22                                ; $4641: $20 $20

jr_019_4643:
    call_open_dialog $221                         ; $4643
    jp   IncrementEntityState                     ; $4648: $C3 $12 $3B

    di                                            ; $464B: $F3
    ld   d, c                                     ; $464C: $51
    ld   h, a                                     ; $464D: $67
    jr   z, jr_019_4643                           ; $464E: $28 $F3

    ld   d, c                                     ; $4650: $51
    ld   h, a                                     ; $4651: $67
    jr   z, @-$25                                 ; $4652: $28 $D9

    ld   de, $10CE                                ; $4654: $11 $CE $10
    rla                                           ; $4657: $17
    inc  d                                        ; $4658: $14
    ld   [$D910], sp                              ; $4659: $08 $10 $D9
    ld   de, $10CE                                ; $465C: $11 $CE $10
    di                                            ; $465F: $F3
    ld   d, c                                     ; $4660: $51
    ld   h, a                                     ; $4661: $67
    jr   z, jr_019_46A2                           ; $4662: $28 $3E

    dec  h                                        ; $4664: $25
    call OpenDialogInTable2                       ; $4665: $CD $7C $23
    ld   a, [$DB7D]                               ; $4668: $FA $7D $DB
    sla  a                                        ; $466B: $CB $27
    sla  a                                        ; $466D: $CB $27
    ld   e, a                                     ; $466F: $5F
    ld   d, $00                                   ; $4670: $16 $00
    ld   hl, $4633                                ; $4672: $21 $33 $46
    add  hl, de                                   ; $4675: $19
    ld   e, l                                     ; $4676: $5D
    ld   d, h                                     ; $4677: $54
    ld   hl, $DC8A                                ; $4678: $21 $8A $DC

jr_019_467B:
    ld   a, [de]                                  ; $467B: $1A
    ld   [hl+], a                                 ; $467C: $22
    inc  de                                       ; $467D: $13
    ld   a, l                                     ; $467E: $7D
    and  $0F                                      ; $467F: $E6 $0F
    cp   $0E                                      ; $4681: $FE $0E
    jr   nz, jr_019_467B                          ; $4683: $20 $F6

    ld   a, $02                                   ; $4685: $3E $02
    ld   [wPaletteDataFlags], a                    ; $4687: $EA $D1 $DD
    call IncrementEntityState                     ; $468A: $CD $12 $3B
    ld   [hl], $03                                ; $468D: $36 $03
    ret                                           ; $468F: $C9

    call func_019_7D3D                            ; $4690: $CD $3D $7D
    call IncrementEntityState                     ; $4693: $CD $12 $3B
    ld   a, [wC177]                               ; $4696: $FA $77 $C1
    and  a                                        ; $4699: $A7
    jr   nz, jr_019_46DB                          ; $469A: $20 $3F

    ld   a, [wAButtonSlot]                        ; $469C: $FA $00 $DB
    and  a                                        ; $469F: $A7
    jr   z, jr_019_46DB                           ; $46A0: $28 $39

jr_019_46A2:
    cp   $01                                      ; $46A2: $FE $01
    jr   z, jr_019_46E1                           ; $46A4: $28 $3B

    cp   $04                                      ; $46A6: $FE $04
    jr   z, jr_019_46E1                           ; $46A8: $28 $37

    cp   $03                                      ; $46AA: $FE $03
    jr   z, jr_019_46E1                           ; $46AC: $28 $33

    cp   $02                                      ; $46AE: $FE $02
    jr   z, jr_019_46E1                           ; $46B0: $28 $2F

    cp   $09                                      ; $46B2: $FE $09
    jr   z, jr_019_46E1                           ; $46B4: $28 $2B

    cp   $0C                                      ; $46B6: $FE $0C
    jr   z, jr_019_46E1                           ; $46B8: $28 $27

    cp   $05                                      ; $46BA: $FE $05
    jr   z, jr_019_46E1                           ; $46BC: $28 $23

    ld   [$DB7D], a                               ; $46BE: $EA $7D $DB
    ld   a, $0D                                   ; $46C1: $3E $0D
    ld   [wAButtonSlot], a                        ; $46C3: $EA $00 $DB
    ld   hl, wEntitiesSubstate1Table              ; $46C6: $21 $B0 $C2
    add  hl, bc                                   ; $46C9: $09
    ld   [hl], a                                  ; $46CA: $77
    call GetEntityTransitionCountdown             ; $46CB: $CD $05 $0C
    ld   [hl], $80                                ; $46CE: $36 $80
    ld   a, $01                                   ; $46D0: $3E $01
    ld   [wC167], a                               ; $46D2: $EA $67 $C1
    ld   a, $10                                   ; $46D5: $3E $10
    ld   [wActiveMusicTrack], a                   ; $46D7: $EA $68 $D3
    ret                                           ; $46DA: $C9

jr_019_46DB:
    ld   [hl], b                                  ; $46DB: $70
    jp_open_dialog $223                           ; $46DC

jr_019_46E1:
    ld   [hl], b                                  ; $46E1: $70
    jp_open_dialog $227                           ; $46E2

    call func_019_7D3D                            ; $46E7: $CD $3D $7D
    call IncrementEntityState                     ; $46EA: $CD $12 $3B
    ld   [hl], $02                                ; $46ED: $36 $02
    ld   a, [wC177]                               ; $46EF: $FA $77 $C1
    and  a                                        ; $46F2: $A7
    jr   nz, jr_019_4725                          ; $46F3: $20 $30

    ld   hl, wAButtonSlot                         ; $46F5: $21 $00 $DB
    ld   de, $0000                                ; $46F8: $11 $00 $00

jr_019_46FB:
    ld   a, [hl]                                  ; $46FB: $7E
    cp   $0D                                      ; $46FC: $FE $0D
    jr   z, jr_019_4707                           ; $46FE: $28 $07

    inc  hl                                       ; $4700: $23
    inc  e                                        ; $4701: $1C
    ld   a, e                                     ; $4702: $7B
    cp   $0C                                      ; $4703: $FE $0C
    jr   nz, jr_019_46FB                          ; $4705: $20 $F4

jr_019_4707:
    ld   a, [$DB7D]                               ; $4707: $FA $7D $DB
    ld   [hl], a                                  ; $470A: $77
    ld   hl, wEntitiesSubstate1Table              ; $470B: $21 $B0 $C2
    add  hl, bc                                   ; $470E: $09
    ld   [hl], a                                  ; $470F: $77
    ld   a, $0D                                   ; $4710: $3E $0D
    ld   [$DB7D], a                               ; $4712: $EA $7D $DB
    call GetEntityTransitionCountdown             ; $4715: $CD $05 $0C
    ld   [hl], $80                                ; $4718: $36 $80
    ld   a, $01                                   ; $471A: $3E $01
    ld   [wC167], a                               ; $471C: $EA $67 $C1
    ld   a, $10                                   ; $471F: $3E $10
    ld   [wActiveMusicTrack], a                   ; $4721: $EA $68 $D3
    ret                                           ; $4724: $C9

jr_019_4725:
    ld   [hl], b                                  ; $4725: $70
    jp_open_dialog $223                           ; $4726

    nop                                           ; $472B: $00
    rla                                           ; $472C: $17
    add  h                                        ; $472D: $84
    rla                                           ; $472E: $17
    add  b                                        ; $472F: $80
    rla                                           ; $4730: $17
    add  d                                        ; $4731: $82
    rla                                           ; $4732: $17
    add  [hl]                                     ; $4733: $86
    rla                                           ; $4734: $17
    adc  b                                        ; $4735: $88
    rla                                           ; $4736: $17
    adc  d                                        ; $4737: $8A
    inc  d                                        ; $4738: $14
    adc  h                                        ; $4739: $8C
    inc  d                                        ; $473A: $14
    sbc  b                                        ; $473B: $98
    rla                                           ; $473C: $17
    sub  b                                        ; $473D: $90
    rla                                           ; $473E: $17
    sub  d                                        ; $473F: $92
    rla                                           ; $4740: $17
    sub  [hl]                                     ; $4741: $96
    rla                                           ; $4742: $17
    adc  [hl]                                     ; $4743: $8E
    rla                                           ; $4744: $17
    and  h                                        ; $4745: $A4
    inc  d                                        ; $4746: $14
    call GetEntityTransitionCountdown             ; $4747: $CD $05 $0C
    jr   nz, jr_019_4755                          ; $474A: $20 $09

    xor  a                                        ; $474C: $AF
    ld   [wC167], a                               ; $474D: $EA $67 $C1
    call IncrementEntityState                     ; $4750: $CD $12 $3B
    ld   [hl], b                                  ; $4753: $70
    ret                                           ; $4754: $C9

jr_019_4755:
    cp   $08                                      ; $4755: $FE $08
    jr   nz, jr_019_476A                          ; $4757: $20 $11

    dec  [hl]                                     ; $4759: $35
    ld   hl, wEntitiesSubstate1Table              ; $475A: $21 $B0 $C2
    add  hl, bc                                   ; $475D: $09
    ld   a, [hl]                                  ; $475E: $7E
    cp   $0D                                      ; $475F: $FE $0D
    ld   a, $24                                   ; $4761: $3E $24
    jr   z, jr_019_4767                           ; $4763: $28 $02

    ld   a, $26                                   ; $4765: $3E $26

jr_019_4767:
    call OpenDialogInTable2                       ; $4767: $CD $7C $23

jr_019_476A:
    ldh  a, [hLinkPositionX]                      ; $476A: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $476C: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $476E: $F0 $99
    sub  $0C                                      ; $4770: $D6 $0C
    ldh  [wActiveEntityPosY], a                   ; $4772: $E0 $EC
    ldh  a, [hLinkPositionZ]                      ; $4774: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $4776: $21 $10 $C3
    add  hl, bc                                   ; $4779: $09
    ld   [hl], a                                  ; $477A: $77
    ld   a, $6C                                   ; $477B: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $477D: $E0 $9D
    ld   a, $02                                   ; $477F: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4781: $E0 $A1
    call ResetSpinAttack                                ; $4783: $CD $AF $0C
    ld   hl, wEntitiesSubstate1Table              ; $4786: $21 $B0 $C2
    add  hl, bc                                   ; $4789: $09
    ld   a, [hl]                                  ; $478A: $7E
    ldh  [hActiveEntitySpriteVariant], a               ; $478B: $E0 $F1
    ld   de, $472B                                ; $478D: $11 $2B $47
    call RenderSimpleEntityWithSpriteVariantToOAM ; $4790: $CD $77 $3C
    jp   label_3D8A                               ; $4793: $C3 $8A $3D

    ld   l, d                                     ; $4796: $6A
    ld   [hl+], a                                 ; $4797: $22
    ld   l, b                                     ; $4798: $68
    ld   [hl+], a                                 ; $4799: $22
    ld   l, [hl]                                  ; $479A: $6E
    ld   [hl+], a                                 ; $479B: $22
    ld   l, h                                     ; $479C: $6C
    ld   [hl+], a                                 ; $479D: $22
    ld   l, b                                     ; $479E: $68
    ld   [bc], a                                  ; $479F: $02
    ld   l, d                                     ; $47A0: $6A
    ld   [bc], a                                  ; $47A1: $02
    ld   l, h                                     ; $47A2: $6C
    ld   [bc], a                                  ; $47A3: $02
    ld   l, [hl]                                  ; $47A4: $6E
    ld   [bc], a                                  ; $47A5: $02
    ld   h, h                                     ; $47A6: $64
    ld   [bc], a                                  ; $47A7: $02
    ld   h, [hl]                                  ; $47A8: $66
    ld   [bc], a                                  ; $47A9: $02
    ld   h, [hl]                                  ; $47AA: $66
    ld   [hl+], a                                 ; $47AB: $22
    ld   h, h                                     ; $47AC: $64
    ld   [hl+], a                                 ; $47AD: $22
    ld   h, b                                     ; $47AE: $60
    ld   [bc], a                                  ; $47AF: $02
    ld   h, d                                     ; $47B0: $62
    ld   [bc], a                                  ; $47B1: $02
    ld   h, d                                     ; $47B2: $62
    ld   [hl+], a                                 ; $47B3: $22
    ld   h, b                                     ; $47B4: $60
    ld   [hl+], a                                 ; $47B5: $22
    nop                                           ; $47B6: $00
    db   $F4                                      ; $47B7: $F4
    inc  c                                        ; $47B8: $0C
    nop                                           ; $47B9: $00
    inc  c                                        ; $47BA: $0C
    db   $F4                                      ; $47BB: $F4

; Entity handler for both the Masked Mimic and Goriya
MaskedMimicGoriyaEntityHandler::
    ldh  a, [hMapId]                              ; $47BC: $F0 $F7
    cp   $1F                                      ; $47BE: $FE $1F
    jp   z, label_019_45E4                        ; $47C0: $CA $E4 $45

    ld   de, $4796                                ; $47C3: $11 $96 $47
    call RenderAnimatedActiveEntity                               ; $47C6: $CD $C0 $3B
    call func_019_7D3D                            ; $47C9: $CD $3D $7D
    call func_019_7D6E                            ; $47CC: $CD $6E $7D
    ld   hl, wEntitiesUnknowTableH                ; $47CF: $21 $30 $C4
    add  hl, bc                                   ; $47D2: $09
    ld   [hl], $48                                ; $47D3: $36 $48
    call func_019_7E3A                            ; $47D5: $CD $3A $7E
    ld   hl, wEntitiesDirectionTable              ; $47D8: $21 $80 $C3
    add  hl, bc                                   ; $47DB: $09
    ld   a, [hl]                                  ; $47DC: $7E
    xor  $01                                      ; $47DD: $EE $01
    cp   e                                        ; $47DF: $BB
    jr   nz, jr_019_47E8                          ; $47E0: $20 $06

    ld   hl, wEntitiesUnknowTableH                ; $47E2: $21 $30 $C4
    add  hl, bc                                   ; $47E5: $09
    ld   [hl], $08                                ; $47E6: $36 $08

jr_019_47E8:
    call label_3B39                               ; $47E8: $CD $39 $3B
    ld   a, [wCollisionType]                      ; $47EB: $FA $33 $C1
    and  a                                        ; $47EE: $A7
    ret  nz                                       ; $47EF: $C0

    ldh  a, [hPressedButtonsMask]                 ; $47F0: $F0 $CB
    and  $0F                                      ; $47F2: $E6 $0F
    ret  z                                        ; $47F4: $C8

    and  $03                                      ; $47F5: $E6 $03
    ld   e, a                                     ; $47F7: $5F
    ld   d, b                                     ; $47F8: $50
    ld   hl, $47B6                                ; $47F9: $21 $B6 $47
    add  hl, de                                   ; $47FC: $19
    ld   a, [hl]                                  ; $47FD: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $47FE: $21 $40 $C2
    add  hl, bc                                   ; $4801: $09
    ld   [hl], a                                  ; $4802: $77
    ldh  a, [hPressedButtonsMask]                 ; $4803: $F0 $CB
    rra                                           ; $4805: $1F
    rra                                           ; $4806: $1F
    and  $03                                      ; $4807: $E6 $03
    ld   e, a                                     ; $4809: $5F
    ld   d, b                                     ; $480A: $50
    ld   hl, $47B9                                ; $480B: $21 $B9 $47
    add  hl, de                                   ; $480E: $19
    ld   a, [hl]                                  ; $480F: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4810: $21 $50 $C2
    add  hl, bc                                   ; $4813: $09
    ld   [hl], a                                  ; $4814: $77
    call func_019_7DB8                            ; $4815: $CD $B8 $7D
    call label_3B23                               ; $4818: $CD $23 $3B
    ldh  a, [hLinkDirection]                      ; $481B: $F0 $9E
    xor  $01                                      ; $481D: $EE $01
    ld   hl, wEntitiesDirectionTable              ; $481F: $21 $80 $C3
    add  hl, bc                                   ; $4822: $09
    ld   [hl], a                                  ; $4823: $77
    rla                                           ; $4824: $17
    and  $06                                      ; $4825: $E6 $06
    ld   e, a                                     ; $4827: $5F
    ld   hl, wEntitiesUnknowTableY                ; $4828: $21 $D0 $C3
    add  hl, bc                                   ; $482B: $09
    inc  [hl]                                     ; $482C: $34
    ld   a, [hl]                                  ; $482D: $7E
    rra                                           ; $482E: $1F
    rra                                           ; $482F: $1F
    rra                                           ; $4830: $1F
    rra                                           ; $4831: $1F
    and  $01                                      ; $4832: $E6 $01
    or   e                                        ; $4834: $B3
    jp   SetEntitySpriteVariant                   ; $4835: $C3 $0C $3B

    ld   [bc], a                                  ; $4838: $02
    ld   de, $30C0                                ; $4839: $11 $C0 $30
    inc  d                                        ; $483C: $14
    ld   [bc], a                                  ; $483D: $02
    ld   de, $50C1                                ; $483E: $11 $C1 $50
    inc  d                                        ; $4841: $14
    ld   [bc], a                                  ; $4842: $02
    rrca                                          ; $4843: $0F
    push af                                       ; $4844: $F5
    sub  h                                        ; $4845: $94
    ld   d, d                                     ; $4846: $52

Entity97Handler::
    call func_019_7D3D                            ; $4847: $CD $3D $7D
    call GetEntityTransitionCountdown             ; $484A: $CD $05 $0C
    jr   z, jr_019_4869                           ; $484D: $28 $1A

    cp   $01                                      ; $484F: $FE $01
    jr   nz, jr_019_485C                          ; $4851: $20 $09

    ld   a, [wLinkMotionState]                    ; $4853: $FA $1C $C1
    ld   [$D463], a                               ; $4856: $EA $63 $D4
    call func_019_4891                            ; $4859: $CD $91 $48

jr_019_485C:
    ld   a, $02                                   ; $485C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $485E: $E0 $A1
    ld   [wC167], a                               ; $4860: $EA $67 $C1
    ld   a, $04                                   ; $4863: $3E $04
    ld   [$C13B], a                               ; $4865: $EA $3B $C1
    ret                                           ; $4868: $C9

jr_019_4869:
    ld   a, [wLinkMotionState]                    ; $4869: $FA $1C $C1
    cp   $01                                      ; $486C: $FE $01
    jr   nz, jr_019_4890                          ; $486E: $20 $20

    ldh  a, [hFF9C]                               ; $4870: $F0 $9C
    and  a                                        ; $4872: $A7
    jr   z, jr_019_4890                           ; $4873: $28 $1B

    call func_019_7E0B                            ; $4875: $CD $0B $7E
    add  $0C                                      ; $4878: $C6 $0C
    cp   $18                                      ; $487A: $FE $18
    jr   nc, jr_019_4890                          ; $487C: $30 $12

    call func_019_7E1B                            ; $487E: $CD $1B $7E
    add  $0C                                      ; $4881: $C6 $0C
    cp   $18                                      ; $4883: $FE $18
    jr   nc, jr_019_4890                          ; $4885: $30 $09

    xor  a                                        ; $4887: $AF
    ld   [wLinkPlayingOcarinaCountdown], a        ; $4888: $EA $66 $C1
    call GetEntityTransitionCountdown             ; $488B: $CD $05 $0C
    ld   [hl], $10                                ; $488E: $36 $10

jr_019_4890:
    ret                                           ; $4890: $C9

func_019_4891:
    ld   de, $4842                                ; $4891: $11 $42 $48
    ldh  a, [hMapRoom]                            ; $4894: $F0 $F6
    cp   $EA                                      ; $4896: $FE $EA
    jr   z, jr_019_48A6                           ; $4898: $28 $0C

    ld   de, $4838                                ; $489A: $11 $38 $48
    ldh  a, [hLinkPositionX]                      ; $489D: $F0 $98
    cp   $30                                      ; $489F: $FE $30
    jr   c, jr_019_48A6                           ; $48A1: $38 $03

    ld   de, $483D                                ; $48A3: $11 $3D $48

jr_019_48A6:
    ld   hl, wWarpStructs                         ; $48A6: $21 $01 $D4
    push bc                                       ; $48A9: $C5
    ld   c, $05                                   ; $48AA: $0E $05

jr_019_48AC:
    ld   a, [de]                                  ; $48AC: $1A
    inc  de                                       ; $48AD: $13
    ld   [hl+], a                                 ; $48AE: $22
    dec  c                                        ; $48AF: $0D
    jr   nz, jr_019_48AC                          ; $48B0: $20 $FA

    pop  bc                                       ; $48B2: $C1
    call func_019_7E61                            ; $48B3: $CD $61 $7E
    ldh  a, [hLinkPositionX]                      ; $48B6: $F0 $98
    swap a                                        ; $48B8: $CB $37
    and  $0F                                      ; $48BA: $E6 $0F
    ld   e, a                                     ; $48BC: $5F
    ldh  a, [hLinkPositionY]                      ; $48BD: $F0 $99
    sub  $08                                      ; $48BF: $D6 $08
    and  $F0                                      ; $48C1: $E6 $F0
    or   e                                        ; $48C3: $B3
    ld   [wWarp0PositionTileIndex], a             ; $48C4: $EA $16 $D4
    jp   label_C83                                ; $48C7: $C3 $83 $0C

    ld   e, b                                     ; $48CA: $58
    ld   bc, $015A                                ; $48CB: $01 $5A $01
    ld   e, b                                     ; $48CE: $58
    ld   bc, $015C                                ; $48CF: $01 $5C $01
    ld   e, d                                     ; $48D2: $5A
    ld   hl, $2158                                ; $48D3: $21 $58 $21
    ld   e, h                                     ; $48D6: $5C
    ld   hl, $2158                                ; $48D7: $21 $58 $21

DogEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $48DA: $21 $60 $C3
    add  hl, bc                                   ; $48DD: $09
    ld   [hl], $4C                                ; $48DE: $36 $4C
    ld   hl, wEntitiesDirectionTable              ; $48E0: $21 $80 $C3
    add  hl, bc                                   ; $48E3: $09
    ld   a, [hl]                                  ; $48E4: $7E
    and  a                                        ; $48E5: $A7
    jr   nz, jr_019_48EE                          ; $48E6: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]               ; $48E8: $F0 $F1
    add  $02                                      ; $48EA: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a               ; $48EC: $E0 $F1

jr_019_48EE:
    ld   de, $48CA                                ; $48EE: $11 $CA $48
    call RenderAnimatedActiveEntity                               ; $48F1: $CD $C0 $3B
    call func_019_7D3D                            ; $48F4: $CD $3D $7D
    call label_C56                                ; $48F7: $CD $56 $0C
    call func_019_7DF1                            ; $48FA: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $48FD: $21 $20 $C3
    add  hl, bc                                   ; $4900: $09
    dec  [hl]                                     ; $4901: $35
    dec  [hl]                                     ; $4902: $35
    ld   hl, wEntitiesPosZTable                   ; $4903: $21 $10 $C3
    add  hl, bc                                   ; $4906: $09
    ld   a, [hl]                                  ; $4907: $7E
    and  $80                                      ; $4908: $E6 $80
    ldh  [hFFE8], a                               ; $490A: $E0 $E8
    jr   z, jr_019_4914                           ; $490C: $28 $06

    ld   [hl], b                                  ; $490E: $70
    ld   hl, wEntitiesSpeedZTable                 ; $490F: $21 $20 $C3
    add  hl, bc                                   ; $4912: $09
    ld   [hl], b                                  ; $4913: $70

jr_019_4914:
    ld   a, [$C3C8]                               ; $4914: $FA $C8 $C3
    and  a                                        ; $4917: $A7
    jr   z, jr_019_4947                           ; $4918: $28 $2D

    ld   hl, wEntitiesPhysicsFlagsTable           ; $491A: $21 $40 $C3
    add  hl, bc                                   ; $491D: $09
    set  6, [hl]                                  ; $491E: $CB $F6
    ld   a, [$C50F]                               ; $4920: $FA $0F $C5
    ld   e, a                                     ; $4923: $5F
    ld   d, b                                     ; $4924: $50
    ld   hl, wEntitiesPosXTable                         ; $4925: $21 $00 $C2
    add  hl, de                                   ; $4928: $19
    ldh  a, [wActiveEntityPosX]                   ; $4929: $F0 $EE
    ld   e, $00                                   ; $492B: $1E $00
    cp   [hl]                                     ; $492D: $BE
    jr   c, jr_019_4931                           ; $492E: $38 $01

    inc  e                                        ; $4930: $1C

jr_019_4931:
    ld   hl, wEntitiesDirectionTable              ; $4931: $21 $80 $C3
    add  hl, bc                                   ; $4934: $09
    ld   [hl], e                                  ; $4935: $73
    ldh  a, [hFrameCounter]                       ; $4936: $F0 $E7
    and  $3F                                      ; $4938: $E6 $3F
    jr   nz, jr_019_4942                          ; $493A: $20 $06

    ld   hl, wEntitiesSpeedZTable                 ; $493C: $21 $20 $C3
    add  hl, bc                                   ; $493F: $09
    ld   [hl], $0C                                ; $4940: $36 $0C

jr_019_4942:
    call func_019_49FD                            ; $4942: $CD $FD $49
    jr   jr_019_494A                              ; $4945: $18 $03

jr_019_4947:
    call label_3B70                               ; $4947: $CD $70 $3B

jr_019_494A:
    ld   hl, wEntitiesFlashCountdownTable         ; $494A: $21 $20 $C4
    add  hl, bc                                   ; $494D: $09
    ld   a, [hl]                                  ; $494E: $7E
    and  a                                        ; $494F: $A7
    jr   z, jr_019_4963                           ; $4950: $28 $11

    cp   $08                                      ; $4952: $FE $08
    jr   nz, jr_019_4963                          ; $4954: $20 $0D

    call IncrementEntityState                     ; $4956: $CD $12 $3B
    ld   a, $02                                   ; $4959: $3E $02
    ld   [hl], a                                  ; $495B: $77
    ldh  [hActiveEntityState], a                  ; $495C: $E0 $F0
    call GetEntityTransitionCountdown             ; $495E: $CD $05 $0C
    ld   [hl], $10                                ; $4961: $36 $10

jr_019_4963:
    ldh  a, [hActiveEntityState]                  ; $4963: $F0 $F0
    cp   $02                                      ; $4965: $FE $02
    jr   nc, jr_019_4980                          ; $4967: $30 $17

    call func_019_7CF0                            ; $4969: $CD $F0 $7C
    jr   nc, jr_019_4980                          ; $496C: $30 $12

    ld   a, [$C3C8]                               ; $496E: $FA $C8 $C3
    and  a                                        ; $4971: $A7
    ld   a, $20                                   ; $4972: $3E $20
    jr   z, jr_019_497D                           ; $4974: $28 $07

    call_open_dialog $196                         ; $4976
    jr   jr_019_4980                              ; $497B: $18 $03

jr_019_497D:
    call OpenDialog                               ; $497D: $CD $85 $23

jr_019_4980:
    ld   a, [$C3C8]                               ; $4980: $FA $C8 $C3
    and  a                                        ; $4983: $A7
    ret  nz                                       ; $4984: $C0

    ldh  a, [hActiveEntityState]                  ; $4985: $F0 $F0
    rst  $00                                      ; $4987: $C7
    sbc  b                                        ; $4988: $98
    ld   c, c                                     ; $4989: $49
    db   $DB                                      ; $498A: $DB
    ld   c, c                                     ; $498B: $49
    rlca                                          ; $498C: $07
    ld   c, d                                     ; $498D: $4A
    inc  l                                        ; $498E: $2C
    ld   c, d                                     ; $498F: $4A
    ld   [bc], a                                  ; $4990: $02
    ld   [SwitchBank], sp                         ; $4991: $08 $0C $08
    cp   $F8                                      ; $4994: $FE $F8
    db   $F4                                      ; $4996: $F4
    ld   hl, sp-$51                               ; $4997: $F8 $AF
    call SetEntitySpriteVariant                   ; $4999: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $499C: $CD $05 $0C
    jr   nz, jr_019_49D8                          ; $499F: $20 $37

    call GetRandomByte                            ; $49A1: $CD $0D $28
    and  $07                                      ; $49A4: $E6 $07
    ld   e, a                                     ; $49A6: $5F
    ld   d, b                                     ; $49A7: $50
    ld   hl, $4990                                ; $49A8: $21 $90 $49
    add  hl, de                                   ; $49AB: $19
    ld   a, [hl]                                  ; $49AC: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $49AD: $21 $40 $C2
    add  hl, bc                                   ; $49B0: $09
    ld   [hl], a                                  ; $49B1: $77
    ld   a, e                                     ; $49B2: $7B
    and  $04                                      ; $49B3: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $49B5: $21 $80 $C3
    add  hl, bc                                   ; $49B8: $09
    ld   [hl], a                                  ; $49B9: $77
    call GetRandomByte                            ; $49BA: $CD $0D $28
    and  $07                                      ; $49BD: $E6 $07
    ld   e, a                                     ; $49BF: $5F
    ld   hl, $4990                                ; $49C0: $21 $90 $49
    add  hl, de                                   ; $49C3: $19
    ld   a, [hl]                                  ; $49C4: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $49C5: $21 $50 $C2
    add  hl, bc                                   ; $49C8: $09
    ld   [hl], a                                  ; $49C9: $77
    call GetEntityTransitionCountdown             ; $49CA: $CD $05 $0C
    call GetRandomByte                            ; $49CD: $CD $0D $28
    and  $1F                                      ; $49D0: $E6 $1F
    add  $30                                      ; $49D2: $C6 $30
    ld   [hl], a                                  ; $49D4: $77
    call IncrementEntityState                     ; $49D5: $CD $12 $3B

jr_019_49D8:
    jp   label_019_49FD                           ; $49D8: $C3 $FD $49

    call func_019_7DB8                            ; $49DB: $CD $B8 $7D
    call label_3B23                               ; $49DE: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $49E1: $F0 $E8
    and  a                                        ; $49E3: $A7
    jr   z, jr_019_49FD                           ; $49E4: $28 $17

    call GetEntityTransitionCountdown             ; $49E6: $CD $05 $0C
    jr   nz, jr_019_49F2                          ; $49E9: $20 $07

    ld   [hl], $30                                ; $49EB: $36 $30
    call IncrementEntityState                     ; $49ED: $CD $12 $3B
    ld   [hl], b                                  ; $49F0: $70
    ret                                           ; $49F1: $C9

jr_019_49F2:
    ld   hl, wEntitiesSpeedZTable                 ; $49F2: $21 $20 $C3
    add  hl, bc                                   ; $49F5: $09
    ld   [hl], $08                                ; $49F6: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $49F8: $21 $10 $C3
    add  hl, bc                                   ; $49FB: $09
    inc  [hl]                                     ; $49FC: $34

func_019_49FD:
label_019_49FD:
jr_019_49FD:
    ldh  a, [hFrameCounter]                       ; $49FD: $F0 $E7
    rra                                           ; $49FF: $1F
    rra                                           ; $4A00: $1F
    rra                                           ; $4A01: $1F
    and  $01                                      ; $4A02: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4A04: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $4A07: $CD $05 $0C
    jr   nz, jr_019_4A23                          ; $4A0A: $20 $17

    call IncrementEntityState                     ; $4A0C: $CD $12 $3B
    ld   a, $24                                   ; $4A0F: $3E $24
    call ApplyVectorTowardsLink_trampoline        ; $4A11: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $4A14: $21 $20 $C3
    add  hl, bc                                   ; $4A17: $09
    ld   [hl], $18                                ; $4A18: $36 $18
    call func_019_7E0B                            ; $4A1A: $CD $0B $7E
    ld   hl, wEntitiesDirectionTable              ; $4A1D: $21 $80 $C3
    add  hl, bc                                   ; $4A20: $09
    ld   a, e                                     ; $4A21: $7B
    ld   [hl], a                                  ; $4A22: $77

jr_019_4A23:
    ldh  a, [hFrameCounter]                       ; $4A23: $F0 $E7
    rra                                           ; $4A25: $1F
    rra                                           ; $4A26: $1F
    and  $01                                      ; $4A27: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4A29: $C3 $0C $3B

    call func_019_7DB8                            ; $4A2C: $CD $B8 $7D
    call label_3B23                               ; $4A2F: $CD $23 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A32: $21 $40 $C3
    add  hl, bc                                   ; $4A35: $09
    ld   [hl], $52                                ; $4A36: $36 $52
    call label_3B44                               ; $4A38: $CD $44 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A3B: $21 $40 $C3
    add  hl, bc                                   ; $4A3E: $09
    ld   [hl], $92                                ; $4A3F: $36 $92
    ldh  a, [hFFE8]                               ; $4A41: $F0 $E8
    and  a                                        ; $4A43: $A7
    jr   z, jr_019_4A4F                           ; $4A44: $28 $09

    call IncrementEntityState                     ; $4A46: $CD $12 $3B
    ld   [hl], b                                  ; $4A49: $70
    call GetEntityTransitionCountdown             ; $4A4A: $CD $05 $0C
    ld   [hl], $20                                ; $4A4D: $36 $20

jr_019_4A4F:
    ret                                           ; $4A4F: $C9

    add  b                                        ; $4A50: $80
    ld   h, $95                                   ; $4A51: $26 $95
    ld   h, e                                     ; $4A53: $63
    jr   nz, jr_019_4A90                          ; $4A54: $20 $3A

    ld   [hl], l                                  ; $4A56: $75
    ld   l, e                                     ; $4A57: $6B
    and  b                                        ; $4A58: $A0
    ld   d, c                                     ; $4A59: $51
    dec  [hl]                                     ; $4A5A: $35
    ld   [hl], e                                  ; $4A5B: $73
    ld   [$187D], sp                              ; $4A5C: $08 $7D $18
    ld   a, a                                     ; $4A5F: $7F
    xor  l                                        ; $4A60: $AD
    ld   a, b                                     ; $4A61: $78
    ld   sp, hl                                   ; $4A62: $F9
    ld   a, [hl]                                  ; $4A63: $7E
    ld   d, b                                     ; $4A64: $50
    ld   e, h                                     ; $4A65: $5C
    jp   c, $1276                                 ; $4A66: $DA $76 $12

    ld   b, b                                     ; $4A69: $40
    cp   e                                        ; $4A6A: $BB
    ld   l, d                                     ; $4A6B: $6A
    dec  d                                        ; $4A6C: $15
    jr   nc, @-$42                                ; $4A6D: $30 $BC

    ld   h, [hl]                                  ; $4A6F: $66
    rla                                           ; $4A70: $17
    inc  d                                        ; $4A71: $14
    cp   l                                        ; $4A72: $BD
    ld   e, [hl]                                  ; $4A73: $5E
    rst  $10                                      ; $4A74: $D7
    inc  b                                        ; $4A75: $04
    db   $FD                                      ; $4A76: $FD
    ld   d, [hl]                                  ; $4A77: $56
    scf                                           ; $4A78: $37
    dec  b                                        ; $4A79: $05
    dec  e                                        ; $4A7A: $1D
    ld   d, a                                     ; $4A7B: $57
    sub  a                                        ; $4A7C: $97
    add  hl, bc                                   ; $4A7D: $09
    dec  a                                        ; $4A7E: $3D
    ld   e, e                                     ; $4A7F: $5B
    push af                                       ; $4A80: $F5
    add  hl, bc                                   ; $4A81: $09
    ld   e, h                                     ; $4A82: $5C
    ld   e, e                                     ; $4A83: $5B
    db   $10                                      ; $4A84: $10
    ld   a, [bc]                                  ; $4A85: $0A
    ld   e, d                                     ; $4A86: $5A
    ld   e, e                                     ; $4A87: $5B
    ld   c, e                                     ; $4A88: $4B
    ld   b, $79                                   ; $4A89: $06 $79
    ld   d, a                                     ; $4A8B: $57
    and  b                                        ; $4A8C: $A0
    ld   [bc], a                                  ; $4A8D: $02
    sub  l                                        ; $4A8E: $95
    ld   d, a                                     ; $4A8F: $57

func_019_4A90:
jr_019_4A90:
    ldh  a, [hIsGBC]                              ; $4A90: $F0 $FE
    and  a                                        ; $4A92: $A7
    ret  z                                        ; $4A93: $C8

    ld   a, [wPaletteUnknownE]                    ; $4A94: $FA $D5 $DD
    ld   a, [wTransitionSequenceCounter]          ; $4A97: $FA $6B $C1
    cp   $04                                      ; $4A9A: $FE $04
    ret  nz                                       ; $4A9C: $C0

    ldh  a, [hFrameCounter]                       ; $4A9D: $F0 $E7
    srl  a                                        ; $4A9F: $CB $3F
    and  $3C                                      ; $4AA1: $E6 $3C
    ld   e, a                                     ; $4AA3: $5F
    ld   d, $00                                   ; $4AA4: $16 $00
    ld   hl, $4A50                                ; $4AA6: $21 $50 $4A
    add  hl, de                                   ; $4AA9: $19
    ld   de, $DC84                                ; $4AAA: $11 $84 $DC

jr_019_4AAD:
    ld   a, [hl+]                                 ; $4AAD: $2A
    ld   [de], a                                  ; $4AAE: $12
    inc  de                                       ; $4AAF: $13
    ld   a, e                                     ; $4AB0: $7B
    and  $03                                      ; $4AB1: $E6 $03
    jr   nz, jr_019_4AAD                          ; $4AB3: $20 $F8

    ld   a, $02                                   ; $4AB5: $3E $02
    ld   [wPaletteDataFlags], a                    ; $4AB7: $EA $D1 $DD
    ret                                           ; $4ABA: $C9

    ld   h, b                                     ; $4ABB: $60
    ld   a, b                                     ; $4ABC: $78
    ld   a, b                                     ; $4ABD: $78
    ld   h, b                                     ; $4ABE: $60
    ld   b, b                                     ; $4ABF: $40
    jr   z, jr_019_4AEA                           ; $4AC0: $28 $28

    ld   b, b                                     ; $4AC2: $40
    jr   nz, jr_019_4AFD                          ; $4AC3: $20 $38

    ld   e, b                                     ; $4AC5: $58
    ld   a, b                                     ; $4AC6: $78
    ld   a, b                                     ; $4AC7: $78
    ld   e, b                                     ; $4AC8: $58
    jr   c, jr_019_4AEB                           ; $4AC9: $38 $20

EggSongEventEntityHandler::
    ld   hl, wEntitiesSubstate1Table              ; $4ACB: $21 $B0 $C2
    add  hl, bc                                   ; $4ACE: $09
    ld   a, [hl]                                  ; $4ACF: $7E
    and  a                                        ; $4AD0: $A7
    jp   nz, $4BCC                                ; $4AD1: $C2 $CC $4B

    ld   a, c                                     ; $4AD4: $79
    ld   [$D461], a                               ; $4AD5: $EA $61 $D4
    ldh  a, [hRoomStatus]                         ; $4AD8: $F0 $F8
    and  $10                                      ; $4ADA: $E6 $10
    jp   nz, label_019_7E61                       ; $4ADC: $C2 $61 $7E

    ldh  a, [hActiveEntityState]                  ; $4ADF: $F0 $F0
    rst  $00                                      ; $4AE1: $C7
    db   $EC                                      ; $4AE2: $EC
    ld   c, d                                     ; $4AE3: $4A
    dec  c                                        ; $4AE4: $0D
    ld   c, e                                     ; $4AE5: $4B
    dec  de                                       ; $4AE6: $1B
    ld   c, e                                     ; $4AE7: $4B
    ccf                                           ; $4AE8: $3F
    ld   c, e                                     ; $4AE9: $4B

jr_019_4AEA:
    ld   l, l                                     ; $4AEA: $6D

jr_019_4AEB:
    ld   c, e                                     ; $4AEB: $4B
    ld   a, [wOcarinaSongFlags]                  ; $4AEC: $FA $49 $DB
    and  $04                                      ; $4AEF: $E6 $04
    ret  z                                        ; $4AF1: $C8

    ld   a, [$DB4A]                               ; $4AF2: $FA $4A $DB
    cp   $00                                      ; $4AF5: $FE $00
    ret  nz                                       ; $4AF7: $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $4AF8: $FA $66 $C1
    cp   $01                                      ; $4AFB: $FE $01

jr_019_4AFD:
    ret  nz                                       ; $4AFD: $C0

    call label_27F2                               ; $4AFE: $CD $F2 $27
    call GetEntityTransitionCountdown             ; $4B01: $CD $05 $0C
    ld   [hl], $30                                ; $4B04: $36 $30
    xor  a                                        ; $4B06: $AF
    ld   [$C5A3], a                               ; $4B07: $EA $A3 $C5
    jp   IncrementEntityState                     ; $4B0A: $C3 $12 $3B

    ld   a, $02                                   ; $4B0D: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B0F: $E0 $A1
    ld   [wC167], a                               ; $4B11: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $4B14: $CD $05 $0C
    ret  nz                                       ; $4B17: $C0

    jp   IncrementEntityState                     ; $4B18: $C3 $12 $3B

    ld   a, $02                                   ; $4B1B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B1D: $E0 $A1
    call GetEntityTransitionCountdown             ; $4B1F: $CD $05 $0C
    ret  nz                                       ; $4B22: $C0

    ld   hl, wEntitiesUnknowTableY                ; $4B23: $21 $D0 $C3
    add  hl, bc                                   ; $4B26: $09
    ld   a, [hl]                                  ; $4B27: $7E
    inc  [hl]                                     ; $4B28: $34
    cp   $08                                      ; $4B29: $FE $08
    jr   nz, jr_019_4B36                          ; $4B2B: $20 $09

    ld   [hl], b                                  ; $4B2D: $70
    call GetEntityTransitionCountdown             ; $4B2E: $CD $05 $0C
    ld   [hl], $40                                ; $4B31: $36 $40
    jp   IncrementEntityState                     ; $4B33: $C3 $12 $3B

jr_019_4B36:
    call func_019_4B6E                            ; $4B36: $CD $6E $4B
    call GetEntityTransitionCountdown             ; $4B39: $CD $05 $0C
    ld   [hl], $20                                ; $4B3C: $36 $20
    ret                                           ; $4B3E: $C9

    ld   a, $02                                   ; $4B3F: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B41: $E0 $A1
    call GetEntityTransitionCountdown             ; $4B43: $CD $05 $0C
    ret  nz                                       ; $4B46: $C0

    ld   e, $41                                   ; $4B47: $1E $41
    ld   hl, wHasInstrument3                      ; $4B49: $21 $67 $DB

jr_019_4B4C:
    ld   a, [hl+]                                 ; $4B4C: $2A
    and  $02                                      ; $4B4D: $E6 $02
    jr   z, jr_019_4B57                           ; $4B4F: $28 $06

    inc  e                                        ; $4B51: $1C
    ld   a, e                                     ; $4B52: $7B
    cp   $47                                      ; $4B53: $FE $47
    jr   nz, jr_019_4B4C                          ; $4B55: $20 $F5

jr_019_4B57:
    ld   a, e                                     ; $4B57: $7B
    ld   [wActiveMusicTrack], a                   ; $4B58: $EA $68 $D3
    ld   [$D465], a                               ; $4B5B: $EA $65 $D4
    ld   a, $FF                                   ; $4B5E: $3E $FF
    ld   [wLinkPlayingOcarinaCountdown], a        ; $4B60: $EA $66 $C1
    xor  a                                        ; $4B63: $AF
    ld   [$D210], a                               ; $4B64: $EA $10 $D2
    ld   [$D211], a                               ; $4B67: $EA $11 $D2
    jp   IncrementEntityState                     ; $4B6A: $C3 $12 $3B

    ret                                           ; $4B6D: $C9

func_019_4B6E:
    ldh  [hFFE8], a                               ; $4B6E: $E0 $E8
    ld   e, a                                     ; $4B70: $5F
    ld   d, b                                     ; $4B71: $50
    ld   hl, wHasInstrument1                      ; $4B72: $21 $65 $DB
    add  hl, de                                   ; $4B75: $19
    ld   a, [hl]                                  ; $4B76: $7E
    and  $02                                      ; $4B77: $E6 $02
    jr   z, jr_019_4BAB                           ; $4B79: $28 $30

    ld   a, $DE                                   ; $4B7B: $3E $DE
    call SpawnNewEntity_trampoline                ; $4B7D: $CD $86 $3B
    ret  c                                        ; $4B80: $D8

    ld   a, $2B                                   ; $4B81: $3E $2B
    ldh  [hNoiseSfx], a                           ; $4B83: $E0 $F4
    push bc                                       ; $4B85: $C5
    ldh  a, [hFFE8]                               ; $4B86: $F0 $E8
    ld   c, a                                     ; $4B88: $4F
    ld   hl, $4ABB                                ; $4B89: $21 $BB $4A
    add  hl, bc                                   ; $4B8C: $09
    ld   a, [hl]                                  ; $4B8D: $7E
    ld   hl, wEntitiesPosXTable                         ; $4B8E: $21 $00 $C2
    add  hl, de                                   ; $4B91: $19
    add  $08                                      ; $4B92: $C6 $08
    ld   [hl], a                                  ; $4B94: $77
    ld   hl, $4AC3                                ; $4B95: $21 $C3 $4A
    add  hl, bc                                   ; $4B98: $09
    ld   a, [hl]                                  ; $4B99: $7E
    ld   hl, wEntitiesPosYTable                         ; $4B9A: $21 $10 $C2
    add  hl, de                                   ; $4B9D: $19
    ld   [hl], a                                  ; $4B9E: $77
    ld   a, c                                     ; $4B9F: $79
    ld   hl, wEntitiesSpriteVariantTable               ; $4BA0: $21 $B0 $C3
    add  hl, de                                   ; $4BA3: $19
    ld   [hl], a                                  ; $4BA4: $77
    ld   hl, wEntitiesSubstate1Table              ; $4BA5: $21 $B0 $C2
    add  hl, de                                   ; $4BA8: $19
    inc  [hl]                                     ; $4BA9: $34
    pop  bc                                       ; $4BAA: $C1

jr_019_4BAB:
    ret                                           ; $4BAB: $C9

    ld   d, b                                     ; $4BAC: $50
    ld   b, $52                                   ; $4BAD: $06 $52
    ld   b, $54                                   ; $4BAF: $06 $54
    ld   b, $56                                   ; $4BB1: $06 $56
    ld   b, $58                                   ; $4BB3: $06 $58
    ld   b, $5A                                   ; $4BB5: $06 $5A
    ld   b, $5C                                   ; $4BB7: $06 $5C
    ld   b, $5E                                   ; $4BB9: $06 $5E
    ld   b, $60                                   ; $4BBB: $06 $60
    ld   b, $62                                   ; $4BBD: $06 $62
    ld   b, $64                                   ; $4BBF: $06 $64
    ld   b, $66                                   ; $4BC1: $06 $66
    ld   b, $68                                   ; $4BC3: $06 $68
    ld   b, $6A                                   ; $4BC5: $06 $6A
    ld   b, $6C                                   ; $4BC7: $06 $6C
    ld   b, $6E                                   ; $4BC9: $06 $6E
    ld   b, $21                                   ; $4BCB: $06 $21
    or   b                                        ; $4BCD: $B0
    jp   nz, label_019_7E09                       ; $4BCE: $C2 $09 $7E

    cp   $02                                      ; $4BD1: $FE $02
    jp   z, label_019_4CFF                        ; $4BD3: $CA $FF $4C

    ldh  a, [hActiveEntityState]                  ; $4BD6: $F0 $F0
    and  a                                        ; $4BD8: $A7
    jr   nz, jr_019_4C21                          ; $4BD9: $20 $46

    call func_019_4A90                            ; $4BDB: $CD $90 $4A
    ld   a, [$C5A3]                               ; $4BDE: $FA $A3 $C5
    cp   $03                                      ; $4BE1: $FE $03
    jr   z, jr_019_4BF7                           ; $4BE3: $28 $12

    ld   hl, hActiveEntitySpriteVariant                ; $4BE5: $21 $F1 $FF
    ldh  a, [hFrameCounter]                       ; $4BE8: $F0 $E7
    rra                                           ; $4BEA: $1F
    rra                                           ; $4BEB: $1F
    rra                                           ; $4BEC: $1F
    xor  [hl]                                     ; $4BED: $AE
    and  $03                                      ; $4BEE: $E6 $03
    ret  z                                        ; $4BF0: $C8

    ld   de, $4BAC                                ; $4BF1: $11 $AC $4B
    jp   RenderAnimatedActiveEntity                               ; $4BF4: $C3 $C0 $3B

jr_019_4BF7:
    ldh  a, [hActiveEntitySpriteVariant]               ; $4BF7: $F0 $F1
    cp   $07                                      ; $4BF9: $FE $07
    jp   nz, label_019_7E61                       ; $4BFB: $C2 $61 $7E

    ld   e, $08                                   ; $4BFE: $1E $08
    ld   hl, wHasInstrument1                      ; $4C00: $21 $65 $DB

jr_019_4C03:
    ld   a, [hl+]                                 ; $4C03: $2A
    and  $02                                      ; $4C04: $E6 $02
    jr   z, jr_019_4C1A                           ; $4C06: $28 $12

    dec  e                                        ; $4C08: $1D
    jr   nz, jr_019_4C03                          ; $4C09: $20 $F8

    ldh  a, [hRoomStatus]                         ; $4C0B: $F0 $F8
    and  $10                                      ; $4C0D: $E6 $10
    jp   nz, label_019_7E61                       ; $4C0F: $C2 $61 $7E

    call GetEntityTransitionCountdown             ; $4C12: $CD $05 $0C
    ld   [hl], $A0                                ; $4C15: $36 $A0
    jp   IncrementEntityState                     ; $4C17: $C3 $12 $3B

jr_019_4C1A:
    xor  a                                        ; $4C1A: $AF
    ld   [$C5A3], a                               ; $4C1B: $EA $A3 $C5
    jp   label_019_7E61                           ; $4C1E: $C3 $61 $7E

jr_019_4C21:
    ld   a, $02                                   ; $4C21: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4C23: $E0 $A1
    ld   [wC167], a                               ; $4C25: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $4C28: $CD $05 $0C
    jp   nz, label_019_4CEA                       ; $4C2B: $C2 $EA $4C

    ld   [wScreenShakeHorizontal], a              ; $4C2E: $EA $55 $C1
    ld   [$C5A3], a                               ; $4C31: $EA $A3 $C5
    ld   hl, $D736                                ; $4C34: $21 $36 $D7
    ld   a, $C1                                   ; $4C37: $3E $C1
    ld   [hl], a                                  ; $4C39: $77
    ld   a, $99                                   ; $4C3A: $3E $99
    call label_B2F                                ; $4C3C: $CD $2F $0B
    ld   hl, $D746                                ; $4C3F: $21 $46 $D7
    ld   a, $CB                                   ; $4C42: $3E $CB
    ld   [hl], a                                  ; $4C44: $77
    ld   a, $99                                   ; $4C45: $3E $99
    call label_B2F                                ; $4C47: $CD $2F $0B
    ld   a, $50                                   ; $4C4A: $3E $50
    ldh  [hSwordIntersectedAreaX], a              ; $4C4C: $E0 $CE
    ld   a, $20                                   ; $4C4E: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $4C50: $E0 $CD
    call label_2887                               ; $4C52: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $4C55: $F0 $FE
    and  a                                        ; $4C57: $A7
    jr   z, jr_019_4C88                           ; $4C58: $28 $2E

    push bc                                       ; $4C5A: $C5
    ld   a, $C1                                   ; $4C5B: $3E $C1
    ld   [$DDD8], a                               ; $4C5D: $EA $D8 $DD
    ld   a, $19                                   ; $4C60: $3E $19
    call label_91D                                ; $4C62: $CD $1D $09
    ldh  a, [$FFCF]                               ; $4C65: $F0 $CF
    ld   h, a                                     ; $4C67: $67
    ldh  a, [$FFD0]                               ; $4C68: $F0 $D0
    ld   l, a                                     ; $4C6A: $6F
    push hl                                       ; $4C6B: $E5
    ld   de, $0040                                ; $4C6C: $11 $40 $00
    add  hl, de                                   ; $4C6F: $19
    ld   a, h                                     ; $4C70: $7C
    ldh  [$FFCF], a                               ; $4C71: $E0 $CF
    ld   a, l                                     ; $4C73: $7D
    ldh  [$FFD0], a                               ; $4C74: $E0 $D0
    ld   a, $CB                                   ; $4C76: $3E $CB
    ld   [$DDD8], a                               ; $4C78: $EA $D8 $DD
    ld   a, $19                                   ; $4C7B: $3E $19
    call label_91D                                ; $4C7D: $CD $1D $09
    pop  hl                                       ; $4C80: $E1
    ld   a, h                                     ; $4C81: $7C
    ldh  [$FFCF], a                               ; $4C82: $E0 $CF
    ld   a, l                                     ; $4C84: $7D
    ldh  [$FFD0], a                               ; $4C85: $E0 $D0
    pop  bc                                       ; $4C87: $C1

jr_019_4C88:
    ld   hl, wRequestDestinationHigh              ; $4C88: $21 $01 $D6
    ld   a, [wRequests]                           ; $4C8B: $FA $00 $D6
    ld   e, a                                     ; $4C8E: $5F
    add  $07                                      ; $4C8F: $C6 $07
    ld   [wRequests], a                           ; $4C91: $EA $00 $D6
    ld   d, $00                                   ; $4C94: $16 $00
    add  hl, de                                   ; $4C96: $19
    ldh  a, [$FFCF]                               ; $4C97: $F0 $CF
    ld   [hl+], a                                 ; $4C99: $22
    ldh  a, [$FFD0]                               ; $4C9A: $F0 $D0
    ld   [hl+], a                                 ; $4C9C: $22
    ld   a, $83                                   ; $4C9D: $3E $83
    ld   [hl+], a                                 ; $4C9F: $22
    ld   a, $7F                                   ; $4CA0: $3E $7F
    ld   [hl+], a                                 ; $4CA2: $22
    ld   a, $0F                                   ; $4CA3: $3E $0F
    ld   [hl+], a                                 ; $4CA5: $22
    ld   a, $7E                                   ; $4CA6: $3E $7E
    ld   [hl+], a                                 ; $4CA8: $22
    ld   a, $1F                                   ; $4CA9: $3E $1F
    ld   [hl+], a                                 ; $4CAB: $22
    ldh  a, [$FFCF]                               ; $4CAC: $F0 $CF
    ld   [hl+], a                                 ; $4CAE: $22
    ldh  a, [$FFD0]                               ; $4CAF: $F0 $D0
    inc  a                                        ; $4CB1: $3C
    ld   [hl+], a                                 ; $4CB2: $22
    ld   a, $83                                   ; $4CB3: $3E $83
    ld   [hl+], a                                 ; $4CB5: $22
    ld   a, $7F                                   ; $4CB6: $3E $7F
    ld   [hl+], a                                 ; $4CB8: $22
    ld   a, $0F                                   ; $4CB9: $3E $0F
    ld   [hl+], a                                 ; $4CBB: $22
    ld   a, $7E                                   ; $4CBC: $3E $7E
    ld   [hl+], a                                 ; $4CBE: $22
    ld   a, $1F                                   ; $4CBF: $3E $1F
    ld   [hl+], a                                 ; $4CC1: $22
    ld   [hl], b                                  ; $4CC2: $70
    call label_27F2                               ; $4CC3: $CD $F2 $27
    ld   a, $23                                   ; $4CC6: $3E $23
    ldh  [hJingle], a                             ; $4CC8: $E0 $F2
    call $4D45                                    ; $4CCA: $CD $45 $4D
    call PlayBombExplosionSfx                     ; $4CCD: $CD $4B $0C
    ld   de, $DC5C                                ; $4CD0: $11 $5C $DC
    ld   hl, $FF70                                ; $4CD3: $21 $70 $FF

jr_019_4CD6:
    ld   [hl], $02                                ; $4CD6: $36 $02
    ld   a, [de]                                  ; $4CD8: $1A
    ld   [hl], $00                                ; $4CD9: $36 $00
    ld   [de], a                                  ; $4CDB: $12
    inc  e                                        ; $4CDC: $1C
    ld   a, e                                     ; $4CDD: $7B
    and  $03                                      ; $4CDE: $E6 $03
    jr   nz, jr_019_4CD6                          ; $4CE0: $20 $F4

    ld   a, $02                                   ; $4CE2: $3E $02
    ld   [wPaletteDataFlags], a                    ; $4CE4: $EA $D1 $DD
    jp   label_019_7E61                           ; $4CE7: $C3 $61 $7E

label_019_4CEA:
    ld   e, $01                                   ; $4CEA: $1E $01
    and  $04                                      ; $4CEC: $E6 $04
    jr   z, jr_019_4CF2                           ; $4CEE: $28 $02

    ld   e, $FF                                   ; $4CF0: $1E $FF

jr_019_4CF2:
    ld   a, e                                     ; $4CF2: $7B
    ld   [wScreenShakeHorizontal], a              ; $4CF3: $EA $55 $C1
    ret                                           ; $4CF6: $C9

    ld   d, $00                                   ; $4CF7: $16 $00
    ld   d, $20                                   ; $4CF9: $16 $20
    ld   d, $60                                   ; $4CFB: $16 $60
    ld   d, $40                                   ; $4CFD: $16 $40

label_019_4CFF:
    ld   de, $4CF7                                ; $4CFF: $11 $F7 $4C
    call RenderSimpleEntityWithSpriteVariantToOAM ; $4D02: $CD $77 $3C
    call func_019_7DB8                            ; $4D05: $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                       ; $4D08: $21 $50 $C2
    add  hl, bc                                   ; $4D0B: $09
    inc  [hl]                                     ; $4D0C: $34
    call GetEntityTransitionCountdown             ; $4D0D: $CD $05 $0C
    ld   [wC167], a                               ; $4D10: $EA $67 $C1
    jr   z, jr_019_4D1A                           ; $4D13: $28 $05

    ld   a, $02                                   ; $4D15: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4D17: $E0 $A1
    ret                                           ; $4D19: $C9

jr_019_4D1A:
    ld   hl, $D806                                ; $4D1A: $21 $06 $D8
    set  4, [hl]                                  ; $4D1D: $CB $E6
    ld   a, [hl]                                  ; $4D1F: $7E
    ldh  [hRoomStatus], a                         ; $4D20: $E0 $F8
    jp   label_019_7E61                           ; $4D22: $C3 $61 $7E

    nop                                           ; $4D25: $00
    inc  b                                        ; $4D26: $04
    ld   [$800], sp                          ; $4D27: $08 $00 $08
    nop                                           ; $4D2A: $00
    inc  b                                        ; $4D2B: $04
    ld   [$0000], sp                              ; $4D2C: $08 $00 $00
    nop                                           ; $4D2F: $00
    inc  b                                        ; $4D30: $04
    inc  b                                        ; $4D31: $04
    ld   [$808], sp                          ; $4D32: $08 $08 $08
    ldh  a, [hFFFC]                               ; $4D35: $F0 $FC
    db   $10                                      ; $4D37: $10
    ldh  a, [rNR10]                               ; $4D38: $F0 $10
    ldh  a, [rDIV]                                ; $4D3A: $F0 $04
    db   $10                                      ; $4D3C: $10
    ldh  a, [hFFE8]                               ; $4D3D: $F0 $E8
    ldh  a, [hRoomStatus]                         ; $4D3F: $F0 $F8
    ld   hl, sp+$08                               ; $4D41: $F8 $08
    inc  c                                        ; $4D43: $0C
    ld   [$E0AF], sp                              ; $4D44: $08 $AF $E0
    add  sp, $3E                                  ; $4D47: $E8 $3E
    sbc  $CD                                      ; $4D49: $DE $CD
    add  [hl]                                     ; $4D4B: $86
    dec  sp                                       ; $4D4C: $3B
    ret  c                                        ; $4D4D: $D8

    ld   hl, wEntitiesSubstate1Table              ; $4D4E: $21 $B0 $C2
    add  hl, de                                   ; $4D51: $19
    ld   [hl], $02                                ; $4D52: $36 $02
    call GetRandomByte                            ; $4D54: $CD $0D $28
    and  $1F                                      ; $4D57: $E6 $1F
    add  $30                                      ; $4D59: $C6 $30
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D5B: $21 $E0 $C2
    add  hl, de                                   ; $4D5E: $19
    ld   [hl], a                                  ; $4D5F: $77
    push bc                                       ; $4D60: $C5
    ldh  a, [hFFE8]                               ; $4D61: $F0 $E8
    ld   c, a                                     ; $4D63: $4F
    ld   hl, $4D25                                ; $4D64: $21 $25 $4D
    add  hl, bc                                   ; $4D67: $09
    ld   a, [hl]                                  ; $4D68: $7E
    ld   hl, wEntitiesPosXTable                         ; $4D69: $21 $00 $C2
    add  hl, de                                   ; $4D6C: $19
    add  $54                                      ; $4D6D: $C6 $54
    ld   [hl], a                                  ; $4D6F: $77
    ld   hl, $4D2D                                ; $4D70: $21 $2D $4D
    add  hl, bc                                   ; $4D73: $09
    ld   a, [hl]                                  ; $4D74: $7E
    ld   hl, wEntitiesPosYTable                         ; $4D75: $21 $10 $C2
    add  hl, de                                   ; $4D78: $19
    add  $3C                                      ; $4D79: $C6 $3C
    ld   [hl], a                                  ; $4D7B: $77
    ld   hl, $4D35                                ; $4D7C: $21 $35 $4D
    add  hl, bc                                   ; $4D7F: $09
    ld   a, [hl]                                  ; $4D80: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4D81: $21 $40 $C2
    add  hl, de                                   ; $4D84: $19
    ld   [hl], a                                  ; $4D85: $77
    ld   hl, $4D3D                                ; $4D86: $21 $3D $4D
    add  hl, bc                                   ; $4D89: $09
    ld   a, [hl]                                  ; $4D8A: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4D8B: $21 $50 $C2
    add  hl, de                                   ; $4D8E: $19
    sub  $08                                      ; $4D8F: $D6 $08
    ld   [hl], a                                  ; $4D91: $77
    pop  bc                                       ; $4D92: $C1
    ldh  a, [hFFE8]                               ; $4D93: $F0 $E8
    inc  a                                        ; $4D95: $3C
    cp   $08                                      ; $4D96: $FE $08
    jr   nz, @-$52                                ; $4D98: $20 $AC

    ret                                           ; $4D9A: $C9

label_019_4D9B:
    ldh  a, [hRoomStatus]                         ; $4D9B: $F0 $F8
    and  $20                                      ; $4D9D: $E6 $20
    jp   nz, label_019_7E61                       ; $4D9F: $C2 $61 $7E

    ld   hl, wEntitiesSubstate1Table              ; $4DA2: $21 $B0 $C2
    add  hl, bc                                   ; $4DA5: $09
    ld   a, [hl]                                  ; $4DA6: $7E
    and  a                                        ; $4DA7: $A7
    jp   nz, label_019_4F30                       ; $4DA8: $C2 $30 $4F

    ldh  a, [hActiveEntityState]                  ; $4DAB: $F0 $F0
    rst  $00                                      ; $4DAD: $C7
    cp   h                                        ; $4DAE: $BC
    ld   c, l                                     ; $4DAF: $4D
    nop                                           ; $4DB0: $00
    ld   c, [hl]                                  ; $4DB1: $4E
    add  hl, bc                                   ; $4DB2: $09
    ld   c, [hl]                                  ; $4DB3: $4E
    ld   b, e                                     ; $4DB4: $43
    ld   c, [hl]                                  ; $4DB5: $4E
    ld   [hl], h                                  ; $4DB6: $74
    ld   c, [hl]                                  ; $4DB7: $4E
    ld   h, b                                     ; $4DB8: $60
    rlca                                          ; $4DB9: $07
    ld   h, d                                     ; $4DBA: $62
    rlca                                          ; $4DBB: $07
    ld   a, c                                     ; $4DBC: $79
    ld   [$D201], a                               ; $4DBD: $EA $01 $D2
    ld   hl, wEntitiesPosXTable                         ; $4DC0: $21 $00 $C2
    add  hl, bc                                   ; $4DC3: $09
    ld   [hl], $50                                ; $4DC4: $36 $50
    call func_019_4E00                            ; $4DC6: $CD $00 $4E
    ld   a, [wOcarinaSongFlags]                  ; $4DC9: $FA $49 $DB
    and  $01                                      ; $4DCC: $E6 $01
    ret  z                                        ; $4DCE: $C8

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $4DCF: $FA $66 $C1
    cp   $01                                      ; $4DD2: $FE $01
    ret  nz                                       ; $4DD4: $C0

    ld   a, [$DB4A]                               ; $4DD5: $FA $4A $DB
    cp   $02                                      ; $4DD8: $FE $02
    ret  nz                                       ; $4DDA: $C0

    ld   a, $DC                                   ; $4DDB: $3E $DC
    call SpawnNewEntity_trampoline                ; $4DDD: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $4DE0: $21 $00 $C2
    add  hl, de                                   ; $4DE3: $19
    ld   [hl], $94                                ; $4DE4: $36 $94
    ld   hl, wEntitiesPosYTable                         ; $4DE6: $21 $10 $C2
    add  hl, de                                   ; $4DE9: $19
    ld   [hl], $D8                                ; $4DEA: $36 $D8
    ld   hl, wEntitiesSubstate1Table              ; $4DEC: $21 $B0 $C2
    add  hl, de                                   ; $4DEF: $19
    inc  [hl]                                     ; $4DF0: $34
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4DF1: $21 $40 $C3
    add  hl, de                                   ; $4DF4: $19
    ld   [hl], $C1                                ; $4DF5: $36 $C1
    ld   a, $55                                   ; $4DF7: $3E $55
    ld   [wActiveMusicTrack], a                   ; $4DF9: $EA $68 $D3
    jp   IncrementEntityState                     ; $4DFC: $C3 $12 $3B

    ret                                           ; $4DFF: $C9

func_019_4E00:
    ld   de, $4DB8                                ; $4E00: $11 $B8 $4D
    call RenderAnimatedActiveEntity                               ; $4E03: $CD $C0 $3B
    jp   label_019_7CA2                           ; $4E06: $C3 $A2 $7C

    ld   a, $02                                   ; $4E09: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4E0B: $E0 $A1
    ld   [wC167], a                               ; $4E0D: $EA $67 $C1
    call func_019_4E00                            ; $4E10: $CD $00 $4E
    call GetEntityTransitionCountdown             ; $4E13: $CD $05 $0C
    jr   nz, jr_019_4E36                          ; $4E16: $20 $1E

    ld   [hl], $A0                                ; $4E18: $36 $A0
    call IncrementEntityState                     ; $4E1A: $CD $12 $3B
    ld   a, $02                                   ; $4E1D: $3E $02
    call SpawnNewEntity_trampoline                ; $4E1F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $4E22: $21 $00 $C2
    add  hl, de                                   ; $4E25: $19
    ldh  a, [hScratch0]                           ; $4E26: $F0 $D7
    ld   [hl], a                                  ; $4E28: $77
    ld   hl, wEntitiesPosYTable                         ; $4E29: $21 $10 $C2
    add  hl, de                                   ; $4E2C: $19
    ldh  a, [hScratch1]                           ; $4E2D: $F0 $D8
    ld   [hl], a                                  ; $4E2F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4E30: $21 $E0 $C2
    add  hl, de                                   ; $4E33: $19
    ld   [hl], $20                                ; $4E34: $36 $20

jr_019_4E36:
    ret                                           ; $4E36: $C9

    ldh  a, [rP1]                                 ; $4E37: $F0 $00
    ld   h, h                                     ; $4E39: $64
    inc  bc                                       ; $4E3A: $03
    nop                                           ; $4E3B: $00
    nop                                           ; $4E3C: $00
    ld   h, [hl]                                  ; $4E3D: $66
    inc  bc                                       ; $4E3E: $03
    nop                                           ; $4E3F: $00
    ld   [$0368], sp                              ; $4E40: $08 $68 $03
    ld   a, $02                                   ; $4E43: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4E45: $E0 $A1
    ld   [wC167], a                               ; $4E47: $EA $67 $C1
    ld   hl, $4E37                                ; $4E4A: $21 $37 $4E
    ld   c, $03                                   ; $4E4D: $0E $03
    call label_3CE6                               ; $4E4F: $CD $E6 $3C
    call GetEntityTransitionCountdown             ; $4E52: $CD $05 $0C
    jp   z, label_019_4E62                        ; $4E55: $CA $62 $4E

    cp   $70                                      ; $4E58: $FE $70
    jr   nz, jr_019_4E61                          ; $4E5A: $20 $05

    ld   a, $10                                   ; $4E5C: $3E $10
    ld   [wActiveMusicTrack], a                   ; $4E5E: $EA $68 $D3

jr_019_4E61:
    ret                                           ; $4E61: $C9

label_019_4E62:
    ldh  a, [hLinkPositionY]                      ; $4E62: $F0 $99
    push af                                       ; $4E64: $F5
    ld   a, $10                                   ; $4E65: $3E $10
    ldh  [hLinkPositionY], a                      ; $4E67: $E0 $99
    call_open_dialog $16D                         ; $4E69
    pop  af                                       ; $4E6E: $F1
    ldh  [hLinkPositionY], a                      ; $4E6F: $E0 $99
    jp   IncrementEntityState                     ; $4E71: $C3 $12 $3B

    ld   a, $02                                   ; $4E74: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4E76: $E0 $A1
    ld   [wC167], a                               ; $4E78: $EA $67 $C1
    ld   hl, $4E37                                ; $4E7B: $21 $37 $4E
    ld   c, $03                                   ; $4E7E: $0E $03
    call label_3CE6                               ; $4E80: $CD $E6 $3C
    ld   a, [wDialogState]                        ; $4E83: $FA $9F $C1
    and  a                                        ; $4E86: $A7
    ret  nz                                       ; $4E87: $C0

    ld   a, $D5                                   ; $4E88: $3E $D5
    call SpawnNewEntity_trampoline                ; $4E8A: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $4E8D: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4E8F: $21 $00 $C2
    add  hl, de                                   ; $4E92: $19
    ld   [hl], a                                  ; $4E93: $77
    ldh  a, [hScratch1]                           ; $4E94: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $4E96: $21 $10 $C2
    add  hl, de                                   ; $4E99: $19
    ld   [hl], a                                  ; $4E9A: $77
    ld   a, $01                                   ; $4E9B: $3E $01
    ld   [wIsRoosterFollowingLink], a             ; $4E9D: $EA $7B $DB
    xor  a                                        ; $4EA0: $AF
    ld   [wC167], a                               ; $4EA1: $EA $67 $C1
    call func_019_7F0E                            ; $4EA4: $CD $0E $7F
    jp   label_019_7E61                           ; $4EA7: $C3 $61 $7E

    ld   l, d                                     ; $4EAA: $6A
    ld   b, $6C                                   ; $4EAB: $06 $6C
    ld   b, $6E                                   ; $4EAD: $06 $6E
    ld   b, $02                                   ; $4EAF: $06 $02
    ld   [bc], a                                  ; $4EB1: $02
    ld   bc, $0401                                ; $4EB2: $01 $01 $04
    inc  b                                        ; $4EB5: $04
    inc  b                                        ; $4EB6: $04
    inc  b                                        ; $4EB7: $04
    inc  b                                        ; $4EB8: $04
    inc  b                                        ; $4EB9: $04
    inc  b                                        ; $4EBA: $04
    inc  b                                        ; $4EBB: $04
    dec  b                                        ; $4EBC: $05
    ld   b, $07                                   ; $4EBD: $06 $07
    ld   [$0607], sp                              ; $4EBF: $08 $07 $06
    dec  b                                        ; $4EC2: $05
    inc  b                                        ; $4EC3: $04
    inc  b                                        ; $4EC4: $04
    inc  b                                        ; $4EC5: $04
    inc  bc                                       ; $4EC6: $03
    ld   [bc], a                                  ; $4EC7: $02
    ld   bc, $0100                                ; $4EC8: $01 $00 $01
    ld   [bc], a                                  ; $4ECB: $02
    inc  bc                                       ; $4ECC: $03
    inc  b                                        ; $4ECD: $04
    dec  b                                        ; $4ECE: $05
    ld   b, $07                                   ; $4ECF: $06 $07
    ld   [$808], sp                          ; $4ED1: $08 $08 $08
    add  hl, bc                                   ; $4ED4: $09
    ld   a, [bc]                                  ; $4ED5: $0A
    dec  bc                                       ; $4ED6: $0B
    inc  c                                        ; $4ED7: $0C
    inc  c                                        ; $4ED8: $0C
    inc  c                                        ; $4ED9: $0C
    dec  bc                                       ; $4EDA: $0B
    ld   a, [bc]                                  ; $4EDB: $0A
    add  hl, bc                                   ; $4EDC: $09
    ld   [$0607], sp                              ; $4EDD: $08 $07 $06
    dec  b                                        ; $4EE0: $05
    inc  b                                        ; $4EE1: $04
    dec  b                                        ; $4EE2: $05
    ld   b, $07                                   ; $4EE3: $06 $07
    ld   [$0A09], sp                              ; $4EE5: $08 $09 $0A
    dec  bc                                       ; $4EE8: $0B
    dec  bc                                       ; $4EE9: $0B
    ld   a, [bc]                                  ; $4EEA: $0A
    add  hl, bc                                   ; $4EEB: $09
    ld   [$0607], sp                              ; $4EEC: $08 $07 $06
    dec  b                                        ; $4EEF: $05
    inc  b                                        ; $4EF0: $04
    inc  bc                                       ; $4EF1: $03
    ld   [bc], a                                  ; $4EF2: $02
    ld   bc, $0100                                ; $4EF3: $01 $00 $01
    ld   [bc], a                                  ; $4EF6: $02
    inc  bc                                       ; $4EF7: $03
    inc  b                                        ; $4EF8: $04
    inc  b                                        ; $4EF9: $04
    inc  b                                        ; $4EFA: $04
    inc  b                                        ; $4EFB: $04
    inc  b                                        ; $4EFC: $04
    inc  b                                        ; $4EFD: $04
    inc  b                                        ; $4EFE: $04
    inc  b                                        ; $4EFF: $04
    inc  b                                        ; $4F00: $04
    inc  b                                        ; $4F01: $04
    inc  b                                        ; $4F02: $04
    inc  b                                        ; $4F03: $04
    inc  b                                        ; $4F04: $04
    inc  b                                        ; $4F05: $04
    inc  b                                        ; $4F06: $04
    inc  b                                        ; $4F07: $04
    inc  b                                        ; $4F08: $04
    inc  b                                        ; $4F09: $04
    inc  b                                        ; $4F0A: $04
    inc  b                                        ; $4F0B: $04
    inc  b                                        ; $4F0C: $04
    inc  b                                        ; $4F0D: $04
    inc  b                                        ; $4F0E: $04
    inc  b                                        ; $4F0F: $04
    inc  b                                        ; $4F10: $04
    inc  b                                        ; $4F11: $04
    inc  b                                        ; $4F12: $04
    inc  b                                        ; $4F13: $04
    inc  b                                        ; $4F14: $04
    inc  b                                        ; $4F15: $04
    inc  b                                        ; $4F16: $04
    inc  b                                        ; $4F17: $04
    inc  b                                        ; $4F18: $04
    inc  b                                        ; $4F19: $04
    inc  b                                        ; $4F1A: $04
    inc  b                                        ; $4F1B: $04
    nop                                           ; $4F1C: $00
    inc  bc                                       ; $4F1D: $03
    ld   b, $07                                   ; $4F1E: $06 $07
    ld   [$0607], sp                              ; $4F20: $08 $07 $06
    inc  bc                                       ; $4F23: $03
    nop                                           ; $4F24: $00
    db   $FD                                      ; $4F25: $FD
    ld   a, [$F8F9]                               ; $4F26: $FA $F9 $F8
    ld   sp, hl                                   ; $4F29: $F9
    ld   a, [$00FD]                               ; $4F2A: $FA $FD $00
    inc  bc                                       ; $4F2D: $03
    ld   b, $07                                   ; $4F2E: $06 $07

label_019_4F30:
    ldh  a, [hFrameCounter]                       ; $4F30: $F0 $E7
    rla                                           ; $4F32: $17
    rla                                           ; $4F33: $17
    and  $10                                      ; $4F34: $E6 $10
    ldh  [$FFED], a                               ; $4F36: $E0 $ED
    ld   de, $4EAA                                ; $4F38: $11 $AA $4E
    call RenderSimpleEntityWithSpriteVariantToOAM ; $4F3B: $CD $77 $3C
    call func_019_7D3D                            ; $4F3E: $CD $3D $7D
    call GetEntityTransitionCountdown             ; $4F41: $CD $05 $0C
    jr   z, jr_019_4F5A                           ; $4F44: $28 $14

    cp   $01                                      ; $4F46: $FE $01
    jp   z, label_019_7E61                        ; $4F48: $CA $61 $7E

    rra                                           ; $4F4B: $1F
    rra                                           ; $4F4C: $1F
    rra                                           ; $4F4D: $1F
    and  $03                                      ; $4F4E: $E6 $03
    ld   e, a                                     ; $4F50: $5F
    ld   d, b                                     ; $4F51: $50
    ld   hl, $4EB0                                ; $4F52: $21 $B0 $4E
    add  hl, de                                   ; $4F55: $19
    ld   a, [hl]                                  ; $4F56: $7E
    jp   SetEntitySpriteVariant                   ; $4F57: $C3 $0C $3B

jr_019_4F5A:
    ld   a, $02                                   ; $4F5A: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4F5C: $E0 $A1
    ld   [wC167], a                               ; $4F5E: $EA $67 $C1
    ld   hl, wEntitiesUnknowTableY                ; $4F61: $21 $D0 $C3
    add  hl, bc                                   ; $4F64: $09
    ld   a, [hl]                                  ; $4F65: $7E
    inc  a                                        ; $4F66: $3C
    ld   [hl], a                                  ; $4F67: $77
    and  $07                                      ; $4F68: $E6 $07
    jr   nz, jr_019_4F8F                          ; $4F6A: $20 $23

    ld   hl, wEntitiesUnknownTableC               ; $4F6C: $21 $C0 $C2
    add  hl, bc                                   ; $4F6F: $09
    inc  [hl]                                     ; $4F70: $34
    ld   a, [hl]                                  ; $4F71: $7E
    cp   $49                                      ; $4F72: $FE $49
    jr   nz, jr_019_4F8F                          ; $4F74: $20 $19

    ld   a, [$D201]                               ; $4F76: $FA $01 $D2
    ld   e, a                                     ; $4F79: $5F
    ld   d, b                                     ; $4F7A: $50
    ld   hl, wEntitiesStateTable                  ; $4F7B: $21 $90 $C2
    add  hl, de                                   ; $4F7E: $19
    inc  [hl]                                     ; $4F7F: $34
    ld   hl, wEntitiesFlashCountdownTable         ; $4F80: $21 $20 $C4
    add  hl, de                                   ; $4F83: $19
    ld   [hl], $40                                ; $4F84: $36 $40
    ld   hl, wEntitiesTransitionCountdownTable    ; $4F86: $21 $E0 $C2
    add  hl, de                                   ; $4F89: $19
    ld   [hl], $80                                ; $4F8A: $36 $80
    jp   label_019_7E61                           ; $4F8C: $C3 $61 $7E

jr_019_4F8F:
    ld   hl, wEntitiesUnknownTableC               ; $4F8F: $21 $C0 $C2
    add  hl, bc                                   ; $4F92: $09
    ld   e, [hl]                                  ; $4F93: $5E
    ld   d, b                                     ; $4F94: $50
    ld   hl, $4EB4                                ; $4F95: $21 $B4 $4E
    add  hl, de                                   ; $4F98: $19
    ld   e, [hl]                                  ; $4F99: $5E
    ld   hl, $4F20                                ; $4F9A: $21 $20 $4F
    add  hl, de                                   ; $4F9D: $19
    ld   a, [hl]                                  ; $4F9E: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4F9F: $21 $40 $C2
    add  hl, bc                                   ; $4FA2: $09
    ld   [hl], a                                  ; $4FA3: $77
    ld   hl, $4F1C                                ; $4FA4: $21 $1C $4F
    add  hl, de                                   ; $4FA7: $19
    ld   a, [hl]                                  ; $4FA8: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4FA9: $21 $50 $C2
    add  hl, bc                                   ; $4FAC: $09
    ld   [hl], a                                  ; $4FAD: $77
    call func_019_7DB8                            ; $4FAE: $CD $B8 $7D
    ld   hl, wEntitiesUnknowTableY                ; $4FB1: $21 $D0 $C3
    add  hl, bc                                   ; $4FB4: $09
    ld   a, [hl]                                  ; $4FB5: $7E
    and  $07                                      ; $4FB6: $E6 $07
    jr   nz, jr_019_4FDA                          ; $4FB8: $20 $20

    ld   a, $DC                                   ; $4FBA: $3E $DC
    call SpawnNewEntity_trampoline                ; $4FBC: $CD $86 $3B
    ret  c                                        ; $4FBF: $D8

    ldh  a, [hScratch0]                           ; $4FC0: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4FC2: $21 $00 $C2
    add  hl, de                                   ; $4FC5: $19
    ld   [hl], a                                  ; $4FC6: $77
    ldh  a, [hScratch1]                           ; $4FC7: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $4FC9: $21 $10 $C2
    add  hl, de                                   ; $4FCC: $19
    ld   [hl], a                                  ; $4FCD: $77
    ld   hl, wEntitiesSubstate1Table              ; $4FCE: $21 $B0 $C2
    add  hl, de                                   ; $4FD1: $19
    ld   [hl], $01                                ; $4FD2: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FD4: $21 $E0 $C2
    add  hl, de                                   ; $4FD7: $19
    ld   [hl], $1F                                ; $4FD8: $36 $1F

jr_019_4FDA:
    ret                                           ; $4FDA: $C9

    ld   h, b                                     ; $4FDB: $60
    nop                                           ; $4FDC: $00
    ld   h, d                                     ; $4FDD: $62
    nop                                           ; $4FDE: $00
    ld   h, h                                     ; $4FDF: $64
    nop                                           ; $4FE0: $00
    ld   h, [hl]                                  ; $4FE1: $66
    nop                                           ; $4FE2: $00
    ld   h, d                                     ; $4FE3: $62
    jr   nz, @+$62                                ; $4FE4: $20 $60

    jr   nz, jr_019_504E                          ; $4FE6: $20 $66

    jr   nz, jr_019_504E                          ; $4FE8: $20 $64

    jr   nz, @+$6A                                ; $4FEA: $20 $68

    nop                                           ; $4FEC: $00
    ld   l, d                                     ; $4FED: $6A
    nop                                           ; $4FEE: $00
    ld   l, h                                     ; $4FEF: $6C
    nop                                           ; $4FF0: $00
    ld   l, [hl]                                  ; $4FF1: $6E
    nop                                           ; $4FF2: $00
    ld   l, d                                     ; $4FF3: $6A
    jr   nz, jr_019_505E                          ; $4FF4: $20 $68

    jr   nz, jr_019_5066                          ; $4FF6: $20 $6E

    jr   nz, jr_019_5066                          ; $4FF8: $20 $6C

    jr   nz, jr_019_506C                          ; $4FFA: $20 $70

    inc  bc                                       ; $4FFC: $03
    ld   [hl], d                                  ; $4FFD: $72
    inc  bc                                       ; $4FFE: $03
    ld   [hl], h                                  ; $4FFF: $74
    inc  bc                                       ; $5000: $03
    db   $76                                      ; $5001: $76
    inc  bc                                       ; $5002: $03
    ld   [hl], d                                  ; $5003: $72
    inc  hl                                       ; $5004: $23
    ld   [hl], b                                  ; $5005: $70
    inc  hl                                       ; $5006: $23
    db   $76                                      ; $5007: $76
    inc  hl                                       ; $5008: $23
    ld   [hl], h                                  ; $5009: $74
    inc  hl                                       ; $500A: $23
    ld   a, [c]                                   ; $500B: $F2
    ld   c, $21                                   ; $500C: $0E $21
    ld   b, b                                     ; $500E: $40
    jp   $3609                                    ; $500F: $C3 $09 $36

    jp   nc, $DB11                                ; $5012: $D2 $11 $DB

    ld   c, a                                     ; $5015: $4F
    call RenderAnimatedActiveEntity                               ; $5016: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableD               ; $5019: $21 $D0 $C2
    add  hl, bc                                   ; $501C: $09
    ld   a, [hl]                                  ; $501D: $7E
    and  a                                        ; $501E: $A7
    jr   nz, jr_019_5027                          ; $501F: $20 $06

    inc  [hl]                                     ; $5021: $34
    ld   a, $57                                   ; $5022: $3E $57
    ld   [wActiveMusicTrack], a                   ; $5024: $EA $68 $D3

jr_019_5027:
    ld   a, [wIsRoosterFollowingLink]             ; $5027: $FA $7B $DB
    and  a                                        ; $502A: $A7
    jr   nz, jr_019_5034                          ; $502B: $20 $07

    ld   a, [wHasInstrument7]                     ; $502D: $FA $6B $DB
    and  a                                        ; $5030: $A7
    jp   nz, $50C4                                ; $5031: $C2 $C4 $50

jr_019_5034:
    call func_019_7D3D                            ; $5034: $CD $3D $7D
    call func_019_7CA2                            ; $5037: $CD $A2 $7C
    ldh  a, [hFrameCounter]                       ; $503A: $F0 $E7
    and  $7F                                      ; $503C: $E6 $7F
    jr   nz, jr_019_504A                          ; $503E: $20 $0A

    call GetRandomByte                            ; $5040: $CD $0D $28
    and  $02                                      ; $5043: $E6 $02
    ld   hl, wEntitiesDirectionTable              ; $5045: $21 $80 $C3
    add  hl, bc                                   ; $5048: $09
    ld   [hl], a                                  ; $5049: $77

jr_019_504A:
    ldh  a, [hFrameCounter]                       ; $504A: $F0 $E7
    ld   e, $00                                   ; $504C: $1E $00

jr_019_504E:
    and  $30                                      ; $504E: $E6 $30
    jr   z, jr_019_5053                           ; $5050: $28 $01

    inc  e                                        ; $5052: $1C

jr_019_5053:
    ld   hl, wEntitiesDirectionTable              ; $5053: $21 $80 $C3
    add  hl, bc                                   ; $5056: $09
    ld   a, e                                     ; $5057: $7B
    add  [hl]                                     ; $5058: $86
    call SetEntitySpriteVariant                   ; $5059: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $505C: $F0 $E7

jr_019_505E:
    and  $3F                                      ; $505E: $E6 $3F
    cp   $0F                                      ; $5060: $FE $0F
    jr   nz, jr_019_5093                          ; $5062: $20 $2F

    ld   a, $08                                   ; $5064: $3E $08

jr_019_5066:
    call SpawnNewEntity_trampoline                ; $5066: $CD $86 $3B
    jr   c, jr_019_5092                           ; $5069: $38 $27

    push bc                                       ; $506B: $C5

jr_019_506C:
    ld   hl, wEntitiesDirectionTable              ; $506C: $21 $80 $C3
    add  hl, bc                                   ; $506F: $09
    ld   c, [hl]                                  ; $5070: $4E
    srl  c                                        ; $5071: $CB $39
    ld   hl, $500B                                ; $5073: $21 $0B $50
    add  hl, bc                                   ; $5076: $09
    ldh  a, [hScratch0]                           ; $5077: $F0 $D7
    add  [hl]                                     ; $5079: $86
    ld   hl, wEntitiesPosXTable                         ; $507A: $21 $00 $C2
    add  hl, de                                   ; $507D: $19
    ld   [hl], a                                  ; $507E: $77
    ldh  a, [hScratch1]                           ; $507F: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5081: $21 $10 $C2
    add  hl, de                                   ; $5084: $19
    ld   [hl], a                                  ; $5085: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $5086: $21 $E0 $C2
    add  hl, de                                   ; $5089: $19
    ld   [hl], $17                                ; $508A: $36 $17
    ld   hl, wEntitiesUnknowTableP                ; $508C: $21 $40 $C4
    add  hl, de                                   ; $508F: $19
    inc  [hl]                                     ; $5090: $34
    pop  bc                                       ; $5091: $C1

jr_019_5092:
    ret                                           ; $5092: $C9

jr_019_5093:
    call func_019_7CF0                            ; $5093: $CD $F0 $7C
    ret  nc                                       ; $5096: $D0

    ld   a, [wIsRoosterFollowingLink]             ; $5097: $FA $7B $DB
    and  a                                        ; $509A: $A7
    ld   a, $8B                                   ; $509B: $3E $8B
    jr   z, jr_019_50A1                           ; $509D: $28 $02

    ld   a, $8C                                   ; $509F: $3E $8C

jr_019_50A1:
    jp   OpenDialogInTable1                       ; $50A1: $C3 $73 $23

    db   $10                                      ; $50A4: $10
    ld   de, $1312                                ; $50A5: $11 $12 $13
    inc  de                                       ; $50A8: $13
    ld   [de], a                                  ; $50A9: $12
    ld   de, $0010                                ; $50AA: $11 $10 $00
    add  hl, bc                                   ; $50AD: $09
    ld   [bc], a                                  ; $50AE: $02
    add  hl, bc                                   ; $50AF: $09
    nop                                           ; $50B0: $00
    rst  $30                                      ; $50B1: $F7
    cp   $F7                                      ; $50B2: $FE $F7
    inc  c                                        ; $50B4: $0C
    add  hl, bc                                   ; $50B5: $09
    ld   a, [bc]                                  ; $50B6: $0A
    rst  $30                                      ; $50B7: $F7
    db   $F4                                      ; $50B8: $F4
    rst  $30                                      ; $50B9: $F7
    or   $09                                      ; $50BA: $F6 $09
    inc  bc                                       ; $50BC: $03
    ld   bc, $0000                                ; $50BD: $01 $00 $00
    nop                                           ; $50C0: $00
    nop                                           ; $50C1: $00
    ld   bc, $F003                                ; $50C2: $01 $03 $F0
    ldh  a, [hAnimatedTilesDataOffset]            ; $50C5: $F0 $A7
    jr   nz, jr_019_50D2                          ; $50C7: $20 $09

    ld   hl, wEntitiesPosYTable                         ; $50C9: $21 $10 $C2
    add  hl, bc                                   ; $50CC: $09
    ld   [hl], $50                                ; $50CD: $36 $50
    call IncrementEntityState                     ; $50CF: $CD $12 $3B

jr_019_50D2:
    ld   e, $00                                   ; $50D2: $1E $00
    ld   hl, wEntitiesSpeedXTable                       ; $50D4: $21 $40 $C2
    add  hl, bc                                   ; $50D7: $09
    ld   a, [hl]                                  ; $50D8: $7E
    and  $80                                      ; $50D9: $E6 $80
    jr   nz, jr_019_50DF                          ; $50DB: $20 $02

    ld   e, $02                                   ; $50DD: $1E $02

jr_019_50DF:
    ld   hl, wEntitiesDirectionTable              ; $50DF: $21 $80 $C3
    add  hl, bc                                   ; $50E2: $09
    ld   [hl], e                                  ; $50E3: $73
    ldh  a, [hFrameCounter]                       ; $50E4: $F0 $E7
    rra                                           ; $50E6: $1F
    rra                                           ; $50E7: $1F
    rra                                           ; $50E8: $1F
    and  $07                                      ; $50E9: $E6 $07
    ld   e, a                                     ; $50EB: $5F
    ld   d, b                                     ; $50EC: $50
    ld   hl, $50A4                                ; $50ED: $21 $A4 $50
    add  hl, de                                   ; $50F0: $19
    ld   a, [hl]                                  ; $50F1: $7E
    sub  $03                                      ; $50F2: $D6 $03
    ld   hl, wEntitiesPosZTable                   ; $50F4: $21 $10 $C3
    add  hl, bc                                   ; $50F7: $09
    ld   [hl], a                                  ; $50F8: $77
    ld   hl, wEntitiesDirectionTable              ; $50F9: $21 $80 $C3
    add  hl, bc                                   ; $50FC: $09
    ldh  a, [hFrameCounter]                       ; $50FD: $F0 $E7
    and  $20                                      ; $50FF: $E6 $20
    ld   a, $04                                   ; $5101: $3E $04
    jr   nz, jr_019_5107                          ; $5103: $20 $02

    ld   a, $05                                   ; $5105: $3E $05

jr_019_5107:
    add  [hl]                                     ; $5107: $86
    call SetEntitySpriteVariant                   ; $5108: $CD $0C $3B
    ldh  a, [wActiveEntityPosY]                   ; $510B: $F0 $EC
    sub  $10                                      ; $510D: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $510F: $E0 $EC
    ld   hl, wEntitiesDirectionTable              ; $5111: $21 $80 $C3
    add  hl, bc                                   ; $5114: $09
    ldh  a, [hFrameCounter]                       ; $5115: $F0 $E7
    rra                                           ; $5117: $1F
    rra                                           ; $5118: $1F
    and  $01                                      ; $5119: $E6 $01
    add  [hl]                                     ; $511B: $86
    ldh  [hActiveEntitySpriteVariant], a               ; $511C: $E0 $F1
    ld   hl, wEntitiesPhysicsFlagsTable           ; $511E: $21 $40 $C3
    add  hl, bc                                   ; $5121: $09
    res  4, [hl]                                  ; $5122: $CB $A6
    ld   de, $4FFB                                ; $5124: $11 $FB $4F
    call RenderAnimatedActiveEntity                               ; $5127: $CD $C0 $3B
    call label_3D8A                               ; $512A: $CD $8A $3D
    call func_019_7D3D                            ; $512D: $CD $3D $7D
    ldh  a, [hFrameCounter]                       ; $5130: $F0 $E7
    and  $3F                                      ; $5132: $E6 $3F
    jr   nz, jr_019_5158                          ; $5134: $20 $22

    call GetRandomByte                            ; $5136: $CD $0D $28
    and  $01                                      ; $5139: $E6 $01
    jr   nz, jr_019_5158                          ; $513B: $20 $1B

    call GetRandomByte                            ; $513D: $CD $0D $28
    and  $07                                      ; $5140: $E6 $07
    ld   e, a                                     ; $5142: $5F
    ld   d, b                                     ; $5143: $50
    ld   hl, $50B4                                ; $5144: $21 $B4 $50
    add  hl, de                                   ; $5147: $19
    ld   a, [hl]                                  ; $5148: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5149: $21 $40 $C2
    add  hl, bc                                   ; $514C: $09
    ld   [hl], a                                  ; $514D: $77
    ld   hl, $50AC                                ; $514E: $21 $AC $50
    add  hl, de                                   ; $5151: $19
    ld   a, [hl]                                  ; $5152: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5153: $21 $50 $C2
    add  hl, bc                                   ; $5156: $09
    ld   [hl], a                                  ; $5157: $77

jr_019_5158:
    ldh  a, [hFrameCounter]                       ; $5158: $F0 $E7
    rra                                           ; $515A: $1F
    rra                                           ; $515B: $1F
    rra                                           ; $515C: $1F
    nop                                           ; $515D: $00
    nop                                           ; $515E: $00
    and  $07                                      ; $515F: $E6 $07
    ld   e, a                                     ; $5161: $5F
    ld   d, b                                     ; $5162: $50
    ld   hl, $50BC                                ; $5163: $21 $BC $50
    add  hl, de                                   ; $5166: $19
    ldh  a, [hFrameCounter]                       ; $5167: $F0 $E7
    and  [hl]                                     ; $5169: $A6
    call z, func_019_7DB8                         ; $516A: $CC $B8 $7D
    call label_3B23                               ; $516D: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $5170: $21 $A0 $C2
    add  hl, bc                                   ; $5173: $09
    ld   a, [hl]                                  ; $5174: $7E
    and  $03                                      ; $5175: $E6 $03
    jr   z, jr_019_5181                           ; $5177: $28 $08

    ld   hl, wEntitiesSpeedXTable                       ; $5179: $21 $40 $C2
    add  hl, bc                                   ; $517C: $09
    ld   a, [hl]                                  ; $517D: $7E
    cpl                                           ; $517E: $2F
    inc  a                                        ; $517F: $3C
    ld   [hl], a                                  ; $5180: $77

jr_019_5181:
    ld   hl, wEntitiesCollisionsTable             ; $5181: $21 $A0 $C2
    add  hl, bc                                   ; $5184: $09
    ld   a, [hl]                                  ; $5185: $7E
    and  $0C                                      ; $5186: $E6 $0C
    jr   z, jr_019_5192                           ; $5188: $28 $08

    ld   hl, wEntitiesSpeedYTable                       ; $518A: $21 $50 $C2
    add  hl, bc                                   ; $518D: $09
    ld   a, [hl]                                  ; $518E: $7E
    cpl                                           ; $518F: $2F
    inc  a                                        ; $5190: $3C
    ld   [hl], a                                  ; $5191: $77

jr_019_5192:
    call func_019_7E0B                            ; $5192: $CD $0B $7E
    add  $12                                      ; $5195: $C6 $12
    cp   $24                                      ; $5197: $FE $24
    ret  nc                                       ; $5199: $D0

    call func_019_7E1B                            ; $519A: $CD $1B $7E
    add  $10                                      ; $519D: $C6 $10
    cp   $20                                      ; $519F: $FE $20
    ret  nc                                       ; $51A1: $D0

    call GetEntityTransitionCountdown             ; $51A2: $CD $05 $0C
    ret  nz                                       ; $51A5: $C0

    ld   [hl], $80                                ; $51A6: $36 $80
    jp_open_dialog $18D                           ; $51A8

    ldh  a, [rP1]                                 ; $51AD: $F0 $00
    ld   a, b                                     ; $51AF: $78
    rlca                                          ; $51B0: $07
    ldh  a, [$FF08]                               ; $51B1: $F0 $08
    ld   a, d                                     ; $51B3: $7A
    rlca                                          ; $51B4: $07
    nop                                           ; $51B5: $00
    nop                                           ; $51B6: $00
    ld   a, h                                     ; $51B7: $7C
    rlca                                          ; $51B8: $07
    nop                                           ; $51B9: $00
    ld   [$077E], sp                              ; $51BA: $08 $7E $07

FlyingRoosterEventsEntityHandler::
    ld   a, [wIsIndoor]                           ; $51BD: $FA $A5 $DB
    and  a                                        ; $51C0: $A7
    jr   z, jr_019_51D2                           ; $51C1: $28 $0F

    ldh  a, [hMapRoom]                            ; $51C3: $F0 $F6
    cp   $E4                                      ; $51C5: $FE $E4
    jp   z, label_019_4D9B                        ; $51C7: $CA $9B $4D

    cp   $F4                                      ; $51CA: $FE $F4
    jp   z, label_019_4D9B                        ; $51CC: $CA $9B $4D

    jp   $500D                                    ; $51CF: $C3 $0D $50

jr_019_51D2:
    ldh  a, [hRoomStatus]                         ; $51D2: $F0 $F8
    and  $20                                      ; $51D4: $E6 $20
    jp   nz, label_019_7E61                       ; $51D6: $C2 $61 $7E

    ldh  a, [hActiveEntityState]                  ; $51D9: $F0 $F0
    rst  $00                                      ; $51DB: $C7
    ldh  [rHDMA1], a                              ; $51DC: $E0 $51
    or   c                                        ; $51DE: $B1
    ld   d, d                                     ; $51DF: $52
    call func_019_7D3D                            ; $51E0: $CD $3D $7D
    ld   a, [wPowerBraceletLevel]                 ; $51E3: $FA $43 $DB
    cp   $02                                      ; $51E6: $FE $02
    ret  c                                        ; $51E8: $D8

    call func_019_7E0B                            ; $51E9: $CD $0B $7E
    add  $08                                      ; $51EC: $C6 $08
    cp   $10                                      ; $51EE: $FE $10
    jp   nc, label_019_52AB                       ; $51F0: $D2 $AB $52

    call func_019_7E1B                            ; $51F3: $CD $1B $7E
    add  $10                                      ; $51F6: $C6 $10
    cp   $20                                      ; $51F8: $FE $20
    jp   nc, label_019_52AB                       ; $51FA: $D2 $AB $52

    ld   a, [wCollisionType]                      ; $51FD: $FA $33 $C1
    and  a                                        ; $5200: $A7
    jp   z, label_019_52AB                        ; $5201: $CA $AB $52

    ldh  a, [hLinkDirection]                      ; $5204: $F0 $9E
    cp   $02                                      ; $5206: $FE $02
    jp   nz, label_019_52AB                       ; $5208: $C2 $AB $52

    ld   hl, wEntitiesUnknowTableY                ; $520B: $21 $D0 $C3
    add  hl, bc                                   ; $520E: $09
    ld   a, [hl]                                  ; $520F: $7E
    inc  a                                        ; $5210: $3C
    ld   [hl], a                                  ; $5211: $77
    cp   $18                                      ; $5212: $FE $18
    ret  nz                                       ; $5214: $C0

    call GetEntityTransitionCountdown             ; $5215: $CD $05 $0C
    ld   [hl], $40                                ; $5218: $36 $40
    ld   hl, $D746                                ; $521A: $21 $46 $D7
    ld   [hl], $0C                                ; $521D: $36 $0C
    ld   hl, $D756                                ; $521F: $21 $56 $D7
    ld   [hl], $C6                                ; $5222: $36 $C6
    ld   a, $99                                   ; $5224: $3E $99
    call label_B2F                                ; $5226: $CD $2F $0B
    ld   a, $50                                   ; $5229: $3E $50
    ldh  [hSwordIntersectedAreaX], a              ; $522B: $E0 $CE
    ld   a, $30                                   ; $522D: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $522F: $E0 $CD
    call label_2887                               ; $5231: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5234: $F0 $FE
    and  a                                        ; $5236: $A7
    jr   z, jr_019_5267                           ; $5237: $28 $2E

    push bc                                       ; $5239: $C5
    ld   a, $0C                                   ; $523A: $3E $0C
    ld   [$DDD8], a                               ; $523C: $EA $D8 $DD
    ld   a, $19                                   ; $523F: $3E $19
    call label_91D                                ; $5241: $CD $1D $09
    ldh  a, [$FFCF]                               ; $5244: $F0 $CF
    ld   h, a                                     ; $5246: $67
    ldh  a, [$FFD0]                               ; $5247: $F0 $D0
    ld   l, a                                     ; $5249: $6F
    push hl                                       ; $524A: $E5
    ld   de, $0040                                ; $524B: $11 $40 $00
    add  hl, de                                   ; $524E: $19
    ld   a, h                                     ; $524F: $7C
    ldh  [$FFCF], a                               ; $5250: $E0 $CF
    ld   a, l                                     ; $5252: $7D
    ldh  [$FFD0], a                               ; $5253: $E0 $D0
    ld   a, $C6                                   ; $5255: $3E $C6
    ld   [$DDD8], a                               ; $5257: $EA $D8 $DD
    ld   a, $19                                   ; $525A: $3E $19
    call label_91D                                ; $525C: $CD $1D $09
    pop  hl                                       ; $525F: $E1
    ld   a, h                                     ; $5260: $7C
    ldh  [$FFCF], a                               ; $5261: $E0 $CF
    ld   a, l                                     ; $5263: $7D
    ldh  [$FFD0], a                               ; $5264: $E0 $D0
    pop  bc                                       ; $5266: $C1

jr_019_5267:
    ld   hl, wRequestDestinationHigh              ; $5267: $21 $01 $D6
    ld   a, [wRequests]                           ; $526A: $FA $00 $D6
    ld   e, a                                     ; $526D: $5F
    add  $0E                                      ; $526E: $C6 $0E
    ld   [wRequests], a                           ; $5270: $EA $00 $D6
    ld   d, $00                                   ; $5273: $16 $00
    add  hl, de                                   ; $5275: $19
    ldh  a, [$FFCF]                               ; $5276: $F0 $CF
    ld   [hl+], a                                 ; $5278: $22
    ldh  a, [$FFD0]                               ; $5279: $F0 $D0
    ld   [hl+], a                                 ; $527B: $22
    ld   a, $83                                   ; $527C: $3E $83
    ld   [hl+], a                                 ; $527E: $22
    ld   a, $0F                                   ; $527F: $3E $0F
    ld   [hl+], a                                 ; $5281: $22
    ld   a, $0F                                   ; $5282: $3E $0F
    ld   [hl+], a                                 ; $5284: $22
    ld   a, $68                                   ; $5285: $3E $68
    ld   [hl+], a                                 ; $5287: $22
    ld   a, $77                                   ; $5288: $3E $77
    ld   [hl+], a                                 ; $528A: $22
    ldh  a, [$FFCF]                               ; $528B: $F0 $CF
    ld   [hl+], a                                 ; $528D: $22
    ldh  a, [$FFD0]                               ; $528E: $F0 $D0
    inc  a                                        ; $5290: $3C
    ld   [hl+], a                                 ; $5291: $22
    ld   a, $83                                   ; $5292: $3E $83
    ld   [hl+], a                                 ; $5294: $22
    ld   a, $0F                                   ; $5295: $3E $0F
    ld   [hl+], a                                 ; $5297: $22
    ld   a, $0F                                   ; $5298: $3E $0F
    ld   [hl+], a                                 ; $529A: $22
    ld   a, $69                                   ; $529B: $3E $69
    ld   [hl+], a                                 ; $529D: $22
    ld   a, $4B                                   ; $529E: $3E $4B
    ld   [hl+], a                                 ; $52A0: $22
    ld   [hl], b                                  ; $52A1: $70
    ld   a, $11                                   ; $52A2: $3E $11
    ldh  [hNoiseSfx], a                           ; $52A4: $E0 $F4
    call IncrementEntityState                     ; $52A6: $CD $12 $3B
    jr   jr_019_52B1                              ; $52A9: $18 $06

label_019_52AB:
    ld   hl, wEntitiesUnknowTableY                ; $52AB: $21 $D0 $C3
    add  hl, bc                                   ; $52AE: $09
    ld   [hl], b                                  ; $52AF: $70
    ret                                           ; $52B0: $C9

jr_019_52B1:
    call func_019_7D3D                            ; $52B1: $CD $3D $7D
    ld   a, $02                                   ; $52B4: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $52B6: $E0 $A1
    ld   [wC167], a                               ; $52B8: $EA $67 $C1
    ld   hl, $51AD                                ; $52BB: $21 $AD $51
    ld   c, $04                                   ; $52BE: $0E $04
    call label_3CE6                               ; $52C0: $CD $E6 $3C
    call GetEntityTransitionCountdown             ; $52C3: $CD $05 $0C
    jp   nz, label_019_5363                       ; $52C6: $C2 $63 $53

    ld   [wC167], a                               ; $52C9: $EA $67 $C1
    ld   hl, $D736                                ; $52CC: $21 $36 $D7
    ld   [hl], $91                                ; $52CF: $36 $91
    ld   a, $99                                   ; $52D1: $3E $99
    call label_B2F                                ; $52D3: $CD $2F $0B
    ld   hl, $D746                                ; $52D6: $21 $46 $D7
    ld   [hl], $5E                                ; $52D9: $36 $5E
    ld   a, $99                                   ; $52DB: $3E $99
    call label_B2F                                ; $52DD: $CD $2F $0B
    ld   a, $50                                   ; $52E0: $3E $50
    ldh  [hSwordIntersectedAreaX], a              ; $52E2: $E0 $CE
    ld   a, $20                                   ; $52E4: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $52E6: $E0 $CD
    call label_2887                               ; $52E8: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $52EB: $F0 $FE
    and  a                                        ; $52ED: $A7
    jr   z, jr_019_531E                           ; $52EE: $28 $2E

    push bc                                       ; $52F0: $C5
    ld   a, $91                                   ; $52F1: $3E $91
    ld   [$DDD8], a                               ; $52F3: $EA $D8 $DD
    ld   a, $19                                   ; $52F6: $3E $19
    call label_91D                                ; $52F8: $CD $1D $09
    ldh  a, [$FFCF]                               ; $52FB: $F0 $CF
    ld   h, a                                     ; $52FD: $67
    ldh  a, [$FFD0]                               ; $52FE: $F0 $D0
    ld   l, a                                     ; $5300: $6F
    push hl                                       ; $5301: $E5
    ld   de, $0040                                ; $5302: $11 $40 $00
    add  hl, de                                   ; $5305: $19
    ld   a, h                                     ; $5306: $7C
    ldh  [$FFCF], a                               ; $5307: $E0 $CF
    ld   a, l                                     ; $5309: $7D
    ldh  [$FFD0], a                               ; $530A: $E0 $D0
    ld   a, $5E                                   ; $530C: $3E $5E
    ld   [$DDD8], a                               ; $530E: $EA $D8 $DD
    ld   a, $19                                   ; $5311: $3E $19
    call label_91D                                ; $5313: $CD $1D $09
    pop  hl                                       ; $5316: $E1
    ld   a, h                                     ; $5317: $7C
    ldh  [$FFCF], a                               ; $5318: $E0 $CF
    ld   a, l                                     ; $531A: $7D
    ldh  [$FFD0], a                               ; $531B: $E0 $D0
    pop  bc                                       ; $531D: $C1

jr_019_531E:
    ld   hl, wRequestDestinationHigh              ; $531E: $21 $01 $D6
    ld   a, [wRequests]                           ; $5321: $FA $00 $D6
    ld   e, a                                     ; $5324: $5F
    add  $0E                                      ; $5325: $C6 $0E
    ld   [wRequests], a                           ; $5327: $EA $00 $D6
    ld   d, $00                                   ; $532A: $16 $00
    add  hl, de                                   ; $532C: $19
    ldh  a, [$FFCF]                               ; $532D: $F0 $CF
    ld   [hl+], a                                 ; $532F: $22
    ldh  a, [$FFD0]                               ; $5330: $F0 $D0
    ld   [hl+], a                                 ; $5332: $22
    ld   a, $83                                   ; $5333: $3E $83
    ld   [hl+], a                                 ; $5335: $22
    ld   a, $00                                   ; $5336: $3E $00
    ld   [hl+], a                                 ; $5338: $22
    ld   a, $10                                   ; $5339: $3E $10
    ld   [hl+], a                                 ; $533B: $22
    ld   a, $02                                   ; $533C: $3E $02
    ld   [hl+], a                                 ; $533E: $22
    ld   a, $12                                   ; $533F: $3E $12
    ld   [hl+], a                                 ; $5341: $22
    ldh  a, [$FFCF]                               ; $5342: $F0 $CF
    ld   [hl+], a                                 ; $5344: $22
    ldh  a, [$FFD0]                               ; $5345: $F0 $D0
    inc  a                                        ; $5347: $3C
    ld   [hl+], a                                 ; $5348: $22
    ld   a, $83                                   ; $5349: $3E $83
    ld   [hl+], a                                 ; $534B: $22
    ld   a, $6C                                   ; $534C: $3E $6C
    ld   [hl+], a                                 ; $534E: $22
    ld   a, $6D                                   ; $534F: $3E $6D
    ld   [hl+], a                                 ; $5351: $22
    ld   a, $03                                   ; $5352: $3E $03
    ld   [hl+], a                                 ; $5354: $22
    ld   a, $13                                   ; $5355: $3E $13
    ld   [hl+], a                                 ; $5357: $22
    ld   [hl], b                                  ; $5358: $70
    ld   a, $23                                   ; $5359: $3E $23
    ldh  [hJingle], a                             ; $535B: $E0 $F2
    call func_019_7F0E                            ; $535D: $CD $0E $7F
    jp   label_019_7E61                           ; $5360: $C3 $61 $7E

label_019_5363:
    ld   hl, wEntitiesSpeedYTable                       ; $5363: $21 $50 $C2
    add  hl, bc                                   ; $5366: $09
    ld   [hl], $FC                                ; $5367: $36 $FC
    jp   label_019_7DBB                           ; $5369: $C3 $BB $7D

    ld   hl, sp-$08                               ; $536C: $F8 $F8
    ld   h, b                                     ; $536E: $60
    nop                                           ; $536F: $00
    ld   hl, sp+$00                               ; $5370: $F8 $00
    ld   h, d                                     ; $5372: $62
    nop                                           ; $5373: $00
    ld   hl, sp+$08                               ; $5374: $F8 $08
    ld   h, d                                     ; $5376: $62
    jr   nz, @-$06                                ; $5377: $20 $F8

    db   $10                                      ; $5379: $10
    ld   h, b                                     ; $537A: $60
    jr   nz, @+$0A                                ; $537B: $20 $08

    ld   hl, sp+$60                               ; $537D: $F8 $60
    ld   b, b                                     ; $537F: $40
    ld   [$6200], sp                              ; $5380: $08 $00 $62
    ld   b, b                                     ; $5383: $40
    ld   [$6208], sp                              ; $5384: $08 $08 $62
    ld   h, b                                     ; $5387: $60
    ld   [$6010], sp                              ; $5388: $08 $10 $60
    ld   h, b                                     ; $538B: $60
    nop                                           ; $538C: $00
    inc  b                                        ; $538D: $04
    db   $08, $04                                 ; $538E: $08 $04

GiantBubbleEntityHandler::
    db   $F0
    rst  $20                                      ; $5391: $E7
    rla                                           ; $5392: $17
    rla                                           ; $5393: $17
    and  $10                                      ; $5394: $E6 $10
    ldh  [$FFED], a                               ; $5396: $E0 $ED
    ldh  a, [hFrameCounter]                       ; $5398: $F0 $E7
    rra                                           ; $539A: $1F
    rra                                           ; $539B: $1F
    rra                                           ; $539C: $1F
    rra                                           ; $539D: $1F
    and  $03                                      ; $539E: $E6 $03
    ld   e, a                                     ; $53A0: $5F
    ld   d, b                                     ; $53A1: $50
    ld   hl, $538C                                ; $53A2: $21 $8C $53
    add  hl, de                                   ; $53A5: $19
    ld   a, [hl]                                  ; $53A6: $7E
    ldh  [hFFF5], a                               ; $53A7: $E0 $F5
    ld   hl, $536C                                ; $53A9: $21 $6C $53
    ld   c, $08                                   ; $53AC: $0E $08
    call label_3CE6                               ; $53AE: $CD $E6 $3C
    call func_019_7D3D                            ; $53B1: $CD $3D $7D
    call label_3B44                               ; $53B4: $CD $44 $3B
    call func_019_7DB8                            ; $53B7: $CD $B8 $7D
    call label_3B23                               ; $53BA: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $53BD: $21 $A0 $C2
    add  hl, bc                                   ; $53C0: $09
    ld   a, [hl]                                  ; $53C1: $7E
    and  $03                                      ; $53C2: $E6 $03
    jr   z, jr_019_53CE                           ; $53C4: $28 $08

    ld   hl, wEntitiesSpeedXTable                       ; $53C6: $21 $40 $C2
    add  hl, bc                                   ; $53C9: $09
    ld   a, [hl]                                  ; $53CA: $7E
    cpl                                           ; $53CB: $2F
    inc  a                                        ; $53CC: $3C
    ld   [hl], a                                  ; $53CD: $77

jr_019_53CE:
    ld   hl, wEntitiesCollisionsTable             ; $53CE: $21 $A0 $C2
    add  hl, bc                                   ; $53D1: $09
    ld   a, [hl]                                  ; $53D2: $7E
    and  $0C                                      ; $53D3: $E6 $0C
    jr   z, jr_019_53DF                           ; $53D5: $28 $08

    ld   hl, wEntitiesSpeedYTable                       ; $53D7: $21 $50 $C2
    add  hl, bc                                   ; $53DA: $09
    ld   a, [hl]                                  ; $53DB: $7E
    cpl                                           ; $53DC: $2F
    inc  a                                        ; $53DD: $3C
    ld   [hl], a                                  ; $53DE: $77

jr_019_53DF:
    ret                                           ; $53DF: $C9

    ld   a, d                                     ; $53E0: $7A
    ld   b, d                                     ; $53E1: $42
    ld   a, d                                     ; $53E2: $7A
    ld   h, d                                     ; $53E3: $62
    ld   a, d                                     ; $53E4: $7A
    ld   d, h                                     ; $53E5: $54
    ld   a, d                                     ; $53E6: $7A
    ld   [hl], h                                  ; $53E7: $74
    ld   a, d                                     ; $53E8: $7A
    ld   [bc], a                                  ; $53E9: $02
    ld   a, d                                     ; $53EA: $7A
    ld   [hl+], a                                 ; $53EB: $22
    ld   a, d                                     ; $53EC: $7A
    inc  d                                        ; $53ED: $14
    ld   a, d                                     ; $53EE: $7A
    inc  [hl]                                     ; $53EF: $34

PodobooEntityHandler::
    ld   hl, wEntitiesSubstate1Table              ; $53F0: $21 $B0 $C2
    add  hl, bc                                   ; $53F3: $09
    ld   a, [hl]                                  ; $53F4: $7E
    and  a                                        ; $53F5: $A7
    jp   nz, label_019_54FD                       ; $53F6: $C2 $FD $54

    ldh  a, [hActiveEntityState]                  ; $53F9: $F0 $F0
    rst  $00                                      ; $53FB: $C7
    ld   [bc], a                                  ; $53FC: $02
    ld   d, h                                     ; $53FD: $54
    ld   d, $54                                   ; $53FE: $16 $54
    ld   l, a                                     ; $5400: $6F
    ld   d, h                                     ; $5401: $54
    call GetEntityTransitionCountdown             ; $5402: $CD $05 $0C
    call GetRandomByte                            ; $5405: $CD $0D $28
    and  $3F                                      ; $5408: $E6 $3F
    add  $30                                      ; $540A: $C6 $30
    ld   [hl], a                                  ; $540C: $77
    jp   IncrementEntityState                     ; $540D: $C3 $12 $3B

    rst  $38                                      ; $5410: $FF
    ld   bc, $03FD                                ; $5411: $01 $FD $03
    db   $F4                                      ; $5414: $F4
    db   $F4                                      ; $5415: $F4
    call GetEntityTransitionCountdown             ; $5416: $CD $05 $0C
    jr   nz, jr_019_546E                          ; $5419: $20 $53

    ld   a, [$C5A1]                               ; $541B: $FA $A1 $C5
    cp   $02                                      ; $541E: $FE $02
    ret  nc                                       ; $5420: $D0

    ld   hl, wEntitiesSpeedYTable                       ; $5421: $21 $50 $C2
    add  hl, bc                                   ; $5424: $09
    ld   [hl], $D0                                ; $5425: $36 $D0
    call IncrementEntityState                     ; $5427: $CD $12 $3B

func_019_542A:
    ld   a, $01                                   ; $542A: $3E $01

jr_019_542C:
    ldh  [hDungeonFloorTile], a                   ; $542C: $E0 $E9
    ld   a, $DA                                   ; $542E: $3E $DA
    call SpawnNewEntity_trampoline                ; $5430: $CD $86 $3B
    ret  c                                        ; $5433: $D8

    ldh  a, [hScratch1]                           ; $5434: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5436: $21 $10 $C2
    add  hl, de                                   ; $5439: $19
    ld   [hl], a                                  ; $543A: $77
    ld   hl, wEntitiesSubstate1Table              ; $543B: $21 $B0 $C2
    add  hl, de                                   ; $543E: $19
    ld   [hl], $02                                ; $543F: $36 $02
    push bc                                       ; $5441: $C5
    ldh  a, [hDungeonFloorTile]                   ; $5442: $F0 $E9
    ld   c, a                                     ; $5444: $4F
    ld   hl, $5410                                ; $5445: $21 $10 $54
    add  hl, bc                                   ; $5448: $09
    ldh  a, [hScratch0]                           ; $5449: $F0 $D7
    add  [hl]                                     ; $544B: $86
    ld   hl, wEntitiesPosXTable                         ; $544C: $21 $00 $C2
    add  hl, de                                   ; $544F: $19
    ld   [hl], a                                  ; $5450: $77
    ld   hl, $5412                                ; $5451: $21 $12 $54
    add  hl, bc                                   ; $5454: $09
    ld   a, [hl]                                  ; $5455: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5456: $21 $40 $C2
    add  hl, de                                   ; $5459: $19
    ld   [hl], a                                  ; $545A: $77
    ld   hl, $5414                                ; $545B: $21 $14 $54
    add  hl, bc                                   ; $545E: $09
    ld   a, [hl]                                  ; $545F: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5460: $21 $50 $C2
    add  hl, de                                   ; $5463: $19
    ld   [hl], a                                  ; $5464: $77
    pop  bc                                       ; $5465: $C1
    ldh  a, [hDungeonFloorTile]                   ; $5466: $F0 $E9
    dec  a                                        ; $5468: $3D
    cp   $FF                                      ; $5469: $FE $FF
    jr   nz, jr_019_542C                          ; $546B: $20 $BF

    ret                                           ; $546D: $C9

jr_019_546E:
    ret                                           ; $546E: $C9

    ld   hl, $C5A0                                ; $546F: $21 $A0 $C5
    inc  [hl]                                     ; $5472: $34
    ld   de, $53E0                                ; $5473: $11 $E0 $53
    call RenderAnimatedActiveEntity                               ; $5476: $CD $C0 $3B
    call func_019_7D3D                            ; $5479: $CD $3D $7D
    call label_3B44                               ; $547C: $CD $44 $3B
    call func_019_7DBB                            ; $547F: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $5482: $21 $50 $C2
    add  hl, bc                                   ; $5485: $09
    inc  [hl]                                     ; $5486: $34
    ld   e, $00                                   ; $5487: $1E $00
    ld   a, [hl]                                  ; $5489: $7E
    and  $80                                      ; $548A: $E6 $80
    jr   nz, jr_019_5490                          ; $548C: $20 $02

    ld   e, $02                                   ; $548E: $1E $02

jr_019_5490:
    ldh  a, [hFrameCounter]                       ; $5490: $F0 $E7
    rra                                           ; $5492: $1F
    rra                                           ; $5493: $1F
    and  $01                                      ; $5494: $E6 $01
    add  e                                        ; $5496: $83
    call SetEntitySpriteVariant                   ; $5497: $CD $0C $3B
    ld   hl, wEntitiesPosYTable                         ; $549A: $21 $10 $C2
    add  hl, bc                                   ; $549D: $09
    ld   a, [hl]                                  ; $549E: $7E
    cp   $70                                      ; $549F: $FE $70
    jr   c, jr_019_54AC                           ; $54A1: $38 $09

    ld   [hl], $70                                ; $54A3: $36 $70
    call IncrementEntityState                     ; $54A5: $CD $12 $3B
    ld   [hl], b                                  ; $54A8: $70
    call func_019_542A                            ; $54A9: $CD $2A $54

jr_019_54AC:
    ldh  a, [hFrameCounter]                       ; $54AC: $F0 $E7
    xor  c                                        ; $54AE: $A9
    and  $0F                                      ; $54AF: $E6 $0F
    ret  nz                                       ; $54B1: $C0

    ld   a, $DA                                   ; $54B2: $3E $DA
    call SpawnNewEntity_trampoline                ; $54B4: $CD $86 $3B
    ret  c                                        ; $54B7: $D8

    ldh  a, [hScratch0]                           ; $54B8: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $54BA: $21 $00 $C2
    add  hl, de                                   ; $54BD: $19
    ld   [hl], a                                  ; $54BE: $77
    ldh  a, [hScratch1]                           ; $54BF: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $54C1: $21 $10 $C2
    add  hl, de                                   ; $54C4: $19
    ld   [hl], a                                  ; $54C5: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $54C6: $21 $E0 $C2
    add  hl, de                                   ; $54C9: $19
    ld   [hl], $18                                ; $54CA: $36 $18
    ld   hl, wEntitiesSubstate1Table              ; $54CC: $21 $B0 $C2
    add  hl, de                                   ; $54CF: $19
    ld   [hl], $01                                ; $54D0: $36 $01
    ldh  a, [hActiveEntitySpriteVariant]               ; $54D2: $F0 $F1
    rla                                           ; $54D4: $17
    and  $04                                      ; $54D5: $E6 $04
    ld   hl, wEntitiesSpriteVariantTable               ; $54D7: $21 $B0 $C3
    add  hl, de                                   ; $54DA: $19
    ld   [hl], a                                  ; $54DB: $77
    ret                                           ; $54DC: $C9

    ld   a, h                                     ; $54DD: $7C
    ld   b, d                                     ; $54DE: $42
    ld   a, h                                     ; $54DF: $7C
    ld   h, d                                     ; $54E0: $62
    ld   a, h                                     ; $54E1: $7C
    ld   d, h                                     ; $54E2: $54
    ld   a, h                                     ; $54E3: $7C
    ld   [hl], h                                  ; $54E4: $74
    ld   a, [hl]                                  ; $54E5: $7E
    ld   b, d                                     ; $54E6: $42
    ld   a, [hl]                                  ; $54E7: $7E
    ld   h, d                                     ; $54E8: $62
    ld   a, [hl]                                  ; $54E9: $7E
    ld   d, h                                     ; $54EA: $54
    ld   a, [hl]                                  ; $54EB: $7E
    ld   [hl], h                                  ; $54EC: $74
    ld   a, h                                     ; $54ED: $7C
    ld   [bc], a                                  ; $54EE: $02
    ld   a, h                                     ; $54EF: $7C
    ld   [hl+], a                                 ; $54F0: $22
    ld   a, h                                     ; $54F1: $7C
    inc  d                                        ; $54F2: $14
    ld   a, h                                     ; $54F3: $7C
    inc  [hl]                                     ; $54F4: $34
    ld   a, [hl]                                  ; $54F5: $7E
    ld   [bc], a                                  ; $54F6: $02
    ld   a, [hl]                                  ; $54F7: $7E
    ld   [hl+], a                                 ; $54F8: $22
    ld   a, [hl]                                  ; $54F9: $7E
    inc  d                                        ; $54FA: $14
    ld   a, [hl]                                  ; $54FB: $7E
    inc  [hl]                                     ; $54FC: $34

label_019_54FD:
    cp   $02                                      ; $54FD: $FE $02
    jr   z, jr_019_552D                           ; $54FF: $28 $2C

    ldh  a, [hFrameCounter]                       ; $5501: $F0 $E7
    xor  c                                        ; $5503: $A9
    rra                                           ; $5504: $1F
    jr   c, jr_019_5519                           ; $5505: $38 $12

    ldh  a, [hFrameCounter]                       ; $5507: $F0 $E7
    rra                                           ; $5509: $1F
    rra                                           ; $550A: $1F
    and  $01                                      ; $550B: $E6 $01
    ld   e, a                                     ; $550D: $5F
    ldh  a, [hActiveEntitySpriteVariant]               ; $550E: $F0 $F1
    add  e                                        ; $5510: $83
    ldh  [hActiveEntitySpriteVariant], a               ; $5511: $E0 $F1
    ld   de, $54DD                                ; $5513: $11 $DD $54
    call RenderAnimatedActiveEntity                               ; $5516: $CD $C0 $3B

jr_019_5519:
    call func_019_7D3D                            ; $5519: $CD $3D $7D
    call GetEntityTransitionCountdown             ; $551C: $CD $05 $0C
    jp   z, label_019_7E61                        ; $551F: $CA $61 $7E

    cp   $08                                      ; $5522: $FE $08
    jr   nz, jr_019_552C                          ; $5524: $20 $06

    ld   hl, wEntitiesSpriteVariantTable               ; $5526: $21 $B0 $C3
    add  hl, bc                                   ; $5529: $09
    inc  [hl]                                     ; $552A: $34
    inc  [hl]                                     ; $552B: $34

jr_019_552C:
    ret                                           ; $552C: $C9

jr_019_552D:
    ld   de, $54F5                                ; $552D: $11 $F5 $54
    call RenderAnimatedActiveEntity                               ; $5530: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $5533: $F0 $E7
    rra                                           ; $5535: $1F
    rra                                           ; $5536: $1F
    and  $01                                      ; $5537: $E6 $01
    call SetEntitySpriteVariant                   ; $5539: $CD $0C $3B
    call func_019_7DB8                            ; $553C: $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                       ; $553F: $21 $50 $C2
    add  hl, bc                                   ; $5542: $09
    inc  [hl]                                     ; $5543: $34
    ld   a, [hl]                                  ; $5544: $7E
    cp   $10                                      ; $5545: $FE $10
    ret  nz                                       ; $5547: $C0

    jp   label_019_7E61                           ; $5548: $C3 $61 $7E

    nop                                           ; $554B: $00
    nop                                           ; $554C: $00
    ld   d, b                                     ; $554D: $50
    ld   [bc], a                                  ; $554E: $02
    nop                                           ; $554F: $00
    ld   [$0252], sp                              ; $5550: $08 $52 $02
    nop                                           ; $5553: $00
    db   $10                                      ; $5554: $10
    ld   d, d                                     ; $5555: $52
    ld   [hl+], a                                 ; $5556: $22
    nop                                           ; $5557: $00
    jr   @+$52                                    ; $5558: $18 $50

    ld   [hl+], a                                 ; $555A: $22
    stop                                          ; $555B: $10 $00
    ld   d, h                                     ; $555D: $54
    ld   [bc], a                                  ; $555E: $02
    db   $10                                      ; $555F: $10
    ld   [$0256], sp                              ; $5560: $08 $56 $02
    db   $10                                      ; $5563: $10
    db   $10                                      ; $5564: $10
    ld   d, [hl]                                  ; $5565: $56
    ld   [hl+], a                                 ; $5566: $22
    db   $10                                      ; $5567: $10
    jr   jr_019_55BE                              ; $5568: $18 $54

    ld   [hl+], a                                 ; $556A: $22
    nop                                           ; $556B: $00
    nop                                           ; $556C: $00
    ld   d, b                                     ; $556D: $50
    inc  bc                                       ; $556E: $03
    nop                                           ; $556F: $00
    ld   [$0352], sp                              ; $5570: $08 $52 $03
    nop                                           ; $5573: $00
    db   $10                                      ; $5574: $10
    ld   d, d                                     ; $5575: $52
    inc  hl                                       ; $5576: $23
    nop                                           ; $5577: $00
    jr   jr_019_55CA                              ; $5578: $18 $50

    inc  hl                                       ; $557A: $23
    stop                                          ; $557B: $10 $00
    ld   d, h                                     ; $557D: $54
    inc  bc                                       ; $557E: $03
    db   $10                                      ; $557F: $10
    ld   [$0356], sp                              ; $5580: $08 $56 $03
    db   $10                                      ; $5583: $10
    db   $10                                      ; $5584: $10
    ld   d, [hl]                                  ; $5585: $56
    inc  hl                                       ; $5586: $23
    db   $10                                      ; $5587: $10
    jr   @+$56                                    ; $5588: $18 $54

    inc  hl                                       ; $558A: $23

ThwompRammableEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $558B: $F0 $F1
    and  a                                        ; $558D: $A7
    ld   a, $00                                   ; $558E: $3E $00
    jr   z, jr_019_5594                           ; $5590: $28 $02

    ld   a, $08                                   ; $5592: $3E $08

jr_019_5594:
    ldh  [hFFF5], a                               ; $5594: $E0 $F5
    ld   hl, $554B                                ; $5596: $21 $4B $55
    ldh  a, [hActiveEntityState]                  ; $5599: $F0 $F0
    and  a                                        ; $559B: $A7
    jr   z, jr_019_55A1                           ; $559C: $28 $03

    ld   hl, $556B                                ; $559E: $21 $6B $55

jr_019_55A1:
    ld   c, $08                                   ; $55A1: $0E $08
    call label_3CE6                               ; $55A3: $CD $E6 $3C
    call func_019_7D3D                            ; $55A6: $CD $3D $7D
    call label_C56                                ; $55A9: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $55AC: $F0 $F0
    rst  $00                                      ; $55AE: $C7
    or   l                                        ; $55AF: $B5
    ld   d, l                                     ; $55B0: $55
    db   $DD                                      ; $55B1: $DD
    ld   d, l                                     ; $55B2: $55
    jr   c, jr_019_560B                           ; $55B3: $38 $56

    call func_019_7CA2                            ; $55B5: $CD $A2 $7C
    ret  nc                                       ; $55B8: $D0

    and  a                                        ; $55B9: $A7
    ret  z                                        ; $55BA: $C8

    call ResetSpinAttack                                ; $55BB: $CD $AF $0C

jr_019_55BE:
    ldh  a, [hLinkPositionXIncrement]             ; $55BE: $F0 $9A
    cpl                                           ; $55C0: $2F
    inc  a                                        ; $55C1: $3C
    sra  a                                        ; $55C2: $CB $2F
    sra  a                                        ; $55C4: $CB $2F
    ldh  [hLinkPositionXIncrement], a             ; $55C6: $E0 $9A
    ld   a, $E8                                   ; $55C8: $3E $E8

jr_019_55CA:
    ldh  [hLinkPositionYIncrement], a             ; $55CA: $E0 $9B
    call GetEntityTransitionCountdown             ; $55CC: $CD $05 $0C
    ld   [hl], $20                                ; $55CF: $36 $20
    ld   a, $01                                   ; $55D1: $3E $01
    call SetEntitySpriteVariant                   ; $55D3: $CD $0C $3B
    ld   a, $0B                                   ; $55D6: $3E $0B
    ldh  [hJingle], a                             ; $55D8: $E0 $F2
    jp   IncrementEntityState                     ; $55DA: $C3 $12 $3B

    call func_019_7CA2                            ; $55DD: $CD $A2 $7C
    call GetEntityTransitionCountdown             ; $55E0: $CD $05 $0C
    cp   $01                                      ; $55E3: $FE $01
    jr   nz, jr_019_55EC                          ; $55E5: $20 $05

    ld   hl, hJingle                              ; $55E7: $21 $F2 $FF
    ld   [hl], $08                                ; $55EA: $36 $08

jr_019_55EC:
    and  a                                        ; $55EC: $A7
    ret  nz                                       ; $55ED: $C0

    call func_019_7DBB                            ; $55EE: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $55F1: $21 $50 $C2
    add  hl, bc                                   ; $55F4: $09
    ld   a, [hl]                                  ; $55F5: $7E
    cp   $70                                      ; $55F6: $FE $70
    jr   nc, jr_019_55FD                          ; $55F8: $30 $03

    add  $03                                      ; $55FA: $C6 $03
    ld   [hl], a                                  ; $55FC: $77

jr_019_55FD:
    ld   hl, wEntitiesPosYTable                         ; $55FD: $21 $10 $C2
    add  hl, bc                                   ; $5600: $09
    ld   a, [hl]                                  ; $5601: $7E
    add  $10                                      ; $5602: $C6 $10
    ld   [hl], a                                  ; $5604: $77
    ldh  a, [$FFEF]                               ; $5605: $F0 $EF
    add  $10                                      ; $5607: $C6 $10
    ldh  [$FFEF], a                               ; $5609: $E0 $EF

jr_019_560B:
    call label_3B23                               ; $560B: $CD $23 $3B
    ld   hl, wEntitiesPosYTable                         ; $560E: $21 $10 $C2
    add  hl, bc                                   ; $5611: $09
    ld   a, [hl]                                  ; $5612: $7E
    sub  $10                                      ; $5613: $D6 $10
    ld   [hl], a                                  ; $5615: $77
    ldh  a, [$FFEF]                               ; $5616: $F0 $EF
    sub  $10                                      ; $5618: $D6 $10
    ldh  [$FFEF], a                               ; $561A: $E0 $EF
    ld   hl, wEntitiesCollisionsTable             ; $561C: $21 $A0 $C2
    add  hl, bc                                   ; $561F: $09
    ld   a, [hl]                                  ; $5620: $7E
    and  a                                        ; $5621: $A7
    ret  z                                        ; $5622: $C8

    call PlayBombExplosionSfx                     ; $5623: $CD $4B $0C
    call GetEntityTransitionCountdown             ; $5626: $CD $05 $0C
    ld   [hl], $30                                ; $5629: $36 $30
    ld   a, $30                                   ; $562B: $3E $30
    ld   [$C157], a                               ; $562D: $EA $57 $C1
    ld   a, $04                                   ; $5630: $3E $04
    ld   [$C158], a                               ; $5632: $EA $58 $C1
    jp   IncrementEntityState                     ; $5635: $C3 $12 $3B

    jp   label_019_58A2                           ; $5638: $C3 $A2 $58

    nop                                           ; $563B: $00
    nop                                           ; $563C: $00
    ld   bc, $0101                                ; $563D: $01 $01 $01
    ld   [bc], a                                  ; $5640: $02
    ld   [bc], a                                  ; $5641: $02
    ld   [bc], a                                  ; $5642: $02
    nop                                           ; $5643: $00
    nop                                           ; $5644: $00
    rrca                                          ; $5645: $0F
    rrca                                          ; $5646: $0F
    rrca                                          ; $5647: $0F
    ld   c, $0E                                   ; $5648: $0E $0E
    ld   c, $08                                   ; $564A: $0E $08
    ld   [$0707], sp                              ; $564C: $08 $07 $07
    rlca                                          ; $564F: $07
    ld   b, $06                                   ; $5650: $06 $06
    ld   b, $08                                   ; $5652: $06 $08
    ld   [$0909], sp                              ; $5654: $08 $09 $09
    add  hl, bc                                   ; $5657: $09
    ld   a, [bc]                                  ; $5658: $0A
    ld   a, [bc]                                  ; $5659: $0A
    ld   a, [bc]                                  ; $565A: $0A
    inc  b                                        ; $565B: $04
    inc  b                                        ; $565C: $04
    inc  bc                                       ; $565D: $03
    inc  bc                                       ; $565E: $03
    inc  bc                                       ; $565F: $03
    ld   [bc], a                                  ; $5660: $02
    ld   [bc], a                                  ; $5661: $02
    ld   [bc], a                                  ; $5662: $02
    inc  c                                        ; $5663: $0C
    inc  c                                        ; $5664: $0C
    dec  c                                        ; $5665: $0D
    dec  c                                        ; $5666: $0D
    dec  c                                        ; $5667: $0D
    ld   c, $0E                                   ; $5668: $0E $0E
    ld   c, $04                                   ; $566A: $0E $04
    inc  b                                        ; $566C: $04
    dec  b                                        ; $566D: $05
    dec  b                                        ; $566E: $05
    dec  b                                        ; $566F: $05
    ld   b, $06                                   ; $5670: $06 $06
    ld   b, $0C                                   ; $5672: $06 $0C
    inc  c                                        ; $5674: $0C
    dec  bc                                       ; $5675: $0B
    dec  bc                                       ; $5676: $0B
    dec  bc                                       ; $5677: $0B
    ld   a, [bc]                                  ; $5678: $0A
    ld   a, [bc]                                  ; $5679: $0A
    ld   a, [bc]                                  ; $567A: $0A

func_019_567B:
    ldh  a, [hScratch0]                           ; $567B: $F0 $D7
    rlca                                          ; $567D: $07
    and  $01                                      ; $567E: $E6 $01
    ld   e, a                                     ; $5680: $5F
    ldh  a, [hScratch1]                           ; $5681: $F0 $D8
    rlca                                          ; $5683: $07
    rla                                           ; $5684: $17
    and  $02                                      ; $5685: $E6 $02
    or   e                                        ; $5687: $B3
    rla                                           ; $5688: $17
    rla                                           ; $5689: $17
    rla                                           ; $568A: $17
    and  $18                                      ; $568B: $E6 $18
    ld   h, a                                     ; $568D: $67
    ldh  a, [hScratch1]                           ; $568E: $F0 $D8
    bit  7, a                                     ; $5690: $CB $7F
    jr   z, jr_019_5696                           ; $5692: $28 $02

    cpl                                           ; $5694: $2F
    inc  a                                        ; $5695: $3C

jr_019_5696:
    ld   d, a                                     ; $5696: $57
    ldh  a, [hScratch0]                           ; $5697: $F0 $D7
    bit  7, a                                     ; $5699: $CB $7F
    jr   z, jr_019_569F                           ; $569B: $28 $02

    cpl                                           ; $569D: $2F
    inc  a                                        ; $569E: $3C

jr_019_569F:
    cp   d                                        ; $569F: $BA
    jr   nc, jr_019_56AF                          ; $56A0: $30 $0D

    sra  a                                        ; $56A2: $CB $2F
    sra  a                                        ; $56A4: $CB $2F
    add  h                                        ; $56A6: $84
    ld   e, a                                     ; $56A7: $5F
    ld   d, b                                     ; $56A8: $50
    ld   hl, $563B                                ; $56A9: $21 $3B $56
    add  hl, de                                   ; $56AC: $19
    ld   a, [hl]                                  ; $56AD: $7E
    ret                                           ; $56AE: $C9

jr_019_56AF:
    ld   a, d                                     ; $56AF: $7A
    sra  a                                        ; $56B0: $CB $2F
    sra  a                                        ; $56B2: $CB $2F
    add  h                                        ; $56B4: $84
    ld   e, a                                     ; $56B5: $5F
    ld   d, b                                     ; $56B6: $50
    ld   hl, $565B                                ; $56B7: $21 $5B $56
    add  hl, de                                   ; $56BA: $19
    ld   a, [hl]                                  ; $56BB: $7E
    ret                                           ; $56BC: $C9

    ld   e, d                                     ; $56BD: $5A
    inc  bc                                       ; $56BE: $03
    ld   e, d                                     ; $56BF: $5A
    inc  hl                                       ; $56C0: $23
    ld   e, b                                     ; $56C1: $58
    ld   [bc], a                                  ; $56C2: $02
    ld   e, b                                     ; $56C3: $58
    ld   [hl+], a                                 ; $56C4: $22

ThwimpEntityHandler::
    ld   de, $56BD                                ; $56C5: $11 $BD $56
    call RenderAnimatedActiveEntity                               ; $56C8: $CD $C0 $3B
    call func_019_7D3D                            ; $56CB: $CD $3D $7D
    call label_C56                                ; $56CE: $CD $56 $0C
    call label_3B39                               ; $56D1: $CD $39 $3B
    xor  a                                        ; $56D4: $AF
    call SetEntitySpriteVariant                   ; $56D5: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $56D8: $F0 $F0
    rst  $00                                      ; $56DA: $C7
    db   $E3                                      ; $56DB: $E3
    ld   d, [hl]                                  ; $56DC: $56
    db   $ED                                      ; $56DD: $ED
    ld   d, [hl]                                  ; $56DE: $56
    db   $10                                      ; $56DF: $10
    ld   d, a                                     ; $56E0: $57
    ld   c, b                                     ; $56E1: $48
    ld   d, a                                     ; $56E2: $57
    ldh  a, [wActiveEntityPosY]                   ; $56E3: $F0 $EC
    ld   hl, wEntitiesSubstate1Table              ; $56E5: $21 $B0 $C2
    add  hl, bc                                   ; $56E8: $09
    ld   [hl], a                                  ; $56E9: $77
    call IncrementEntityState                     ; $56EA: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $56ED: $CD $05 $0C
    ret  nz                                       ; $56F0: $C0

    call func_019_7E0B                            ; $56F1: $CD $0B $7E
    ld   e, a                                     ; $56F4: $5F
    add  $28                                      ; $56F5: $C6 $28
    cp   $50                                      ; $56F7: $FE $50
    ret  nc                                       ; $56F9: $D0

    ld   a, $01                                   ; $56FA: $3E $01
    call SetEntitySpriteVariant                   ; $56FC: $CD $0C $3B
    ld   a, e                                     ; $56FF: $7B
    add  $18                                      ; $5700: $C6 $18
    cp   $30                                      ; $5702: $FE $30
    ret  nc                                       ; $5704: $D0

    call ClearEntitySpeed                         ; $5705: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $5708: $CD $05 $0C
    ld   [hl], $08                                ; $570B: $36 $08
    jp   IncrementEntityState                     ; $570D: $C3 $12 $3B

    ld   a, $01                                   ; $5710: $3E $01
    call SetEntitySpriteVariant                   ; $5712: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5715: $CD $05 $0C
    cp   $01                                      ; $5718: $FE $01
    jr   nz, jr_019_5721                          ; $571A: $20 $05

    ld   hl, hJingle                              ; $571C: $21 $F2 $FF
    ld   [hl], $08                                ; $571F: $36 $08

jr_019_5721:
    and  a                                        ; $5721: $A7
    ret  nz                                       ; $5722: $C0

    call func_019_7DBB                            ; $5723: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $5726: $21 $50 $C2
    add  hl, bc                                   ; $5729: $09
    ld   a, [hl]                                  ; $572A: $7E
    cp   $70                                      ; $572B: $FE $70
    jr   nc, jr_019_5732                          ; $572D: $30 $03

    add  $03                                      ; $572F: $C6 $03
    ld   [hl], a                                  ; $5731: $77

jr_019_5732:
    call label_3B23                               ; $5732: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $5735: $21 $A0 $C2
    add  hl, bc                                   ; $5738: $09
    ld   a, [hl]                                  ; $5739: $7E
    and  a                                        ; $573A: $A7
    ret  z                                        ; $573B: $C8

    ld   a, $09                                   ; $573C: $3E $09
    ldh  [hJingle], a                             ; $573E: $E0 $F2
    call GetEntityTransitionCountdown             ; $5740: $CD $05 $0C
    ld   [hl], $30                                ; $5743: $36 $30
    jp   IncrementEntityState                     ; $5745: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $5748: $CD $05 $0C
    ret  nz                                       ; $574B: $C0

    ld   hl, wEntitiesSubstate1Table              ; $574C: $21 $B0 $C2
    add  hl, bc                                   ; $574F: $09
    ldh  a, [wActiveEntityPosY]                   ; $5750: $F0 $EC
    cp   [hl]                                     ; $5752: $BE
    jr   nz, jr_019_575F                          ; $5753: $20 $0A

    call IncrementEntityState                     ; $5755: $CD $12 $3B
    ld   [hl], b                                  ; $5758: $70
    call GetEntityTransitionCountdown             ; $5759: $CD $05 $0C
    ld   [hl], $20                                ; $575C: $36 $20
    ret                                           ; $575E: $C9

jr_019_575F:
    ld   hl, wEntitiesSpeedYTable                       ; $575F: $21 $50 $C2
    add  hl, bc                                   ; $5762: $09
    ld   [hl], $F8                                ; $5763: $36 $F8
    jp   label_019_7DBB                           ; $5765: $C3 $BB $7D

    nop                                           ; $5768: $00
    nop                                           ; $5769: $00
    ld   [hl], b                                  ; $576A: $70
    rlca                                          ; $576B: $07
    nop                                           ; $576C: $00
    ld   [$0772], sp                              ; $576D: $08 $72 $07
    nop                                           ; $5770: $00
    db   $10                                      ; $5771: $10
    ld   [hl], d                                  ; $5772: $72
    daa                                           ; $5773: $27
    nop                                           ; $5774: $00
    jr   jr_019_57E7                              ; $5775: $18 $70

    daa                                           ; $5777: $27
    stop                                          ; $5778: $10 $00
    ld   [hl], h                                  ; $577A: $74
    rlca                                          ; $577B: $07
    db   $10                                      ; $577C: $10
    ld   [$0776], sp                              ; $577D: $08 $76 $07
    db   $10                                      ; $5780: $10
    db   $10                                      ; $5781: $10
    db   $76                                      ; $5782: $76
    daa                                           ; $5783: $27
    db   $10                                      ; $5784: $10
    jr   jr_019_57FB                              ; $5785: $18 $74

    daa                                           ; $5787: $27
    rst  $38                                      ; $5788: $FF
    rlca                                          ; $5789: $07
    rst  $38                                      ; $578A: $FF
    rlca                                          ; $578B: $07
    ld   l, [hl]                                  ; $578C: $6E
    rlca                                          ; $578D: $07
    ld   a, [hl]                                  ; $578E: $7E
    rlca                                          ; $578F: $07
    ld   a, d                                     ; $5790: $7A
    rlca                                          ; $5791: $07
    ld   a, d                                     ; $5792: $7A
    daa                                           ; $5793: $27
    ld   a, [hl]                                  ; $5794: $7E
    daa                                           ; $5795: $27
    ld   l, [hl]                                  ; $5796: $6E
    daa                                           ; $5797: $27
    ld   a, [hl]                                  ; $5798: $7E
    daa                                           ; $5799: $27
    ld   a, h                                     ; $579A: $7C
    daa                                           ; $579B: $27
    ld   a, [hl]                                  ; $579C: $7E
    daa                                           ; $579D: $27
    ld   l, h                                     ; $579E: $6C
    daa                                           ; $579F: $27
    ld   a, b                                     ; $57A0: $78
    rlca                                          ; $57A1: $07
    ld   a, b                                     ; $57A2: $78
    daa                                           ; $57A3: $27
    ld   l, h                                     ; $57A4: $6C
    rlca                                          ; $57A5: $07
    ld   a, [hl]                                  ; $57A6: $7E
    rlca                                          ; $57A7: $07
    ld   a, h                                     ; $57A8: $7C
    rlca                                          ; $57A9: $07
    ld   a, [hl]                                  ; $57AA: $7E
    rlca                                          ; $57AB: $07
    inc  b                                        ; $57AC: $04
    dec  b                                        ; $57AD: $05
    ld   b, $07                                   ; $57AE: $06 $07
    ld   [$0201], sp                              ; $57B0: $08 $01 $02
    inc  bc                                       ; $57B3: $03

ThwompEntityHandler::
    ldh  a, [wActiveEntityPosY]                   ; $57B4: $F0 $EC
    add  $08                                      ; $57B6: $C6 $08
    ldh  [wActiveEntityPosY], a                   ; $57B8: $E0 $EC
    ldh  a, [wActiveEntityPosX]                   ; $57BA: $F0 $EE
    add  $08                                      ; $57BC: $C6 $08
    ldh  [wActiveEntityPosX], a                   ; $57BE: $E0 $EE
    ld   de, $5788                                ; $57C0: $11 $88 $57
    call RenderAnimatedActiveEntity                               ; $57C3: $CD $C0 $3B
    call label_3D8A                               ; $57C6: $CD $8A $3D
    ld   hl, $5768                                ; $57C9: $21 $68 $57
    ld   c, $08                                   ; $57CC: $0E $08
    call label_3CE6                               ; $57CE: $CD $E6 $3C
    ld   a, $06                                   ; $57D1: $3E $06
    call label_3DA0                               ; $57D3: $CD $A0 $3D
    call func_019_7D3D                            ; $57D6: $CD $3D $7D
    call label_C56                                ; $57D9: $CD $56 $0C
    call label_3B70                               ; $57DC: $CD $70 $3B
    call func_019_58A2                            ; $57DF: $CD $A2 $58
    ldh  a, [hActiveEntityState]                  ; $57E2: $F0 $F0
    rst  $00                                      ; $57E4: $C7
    db   $ED                                      ; $57E5: $ED
    ld   d, a                                     ; $57E6: $57

jr_019_57E7:
    rst  $30                                      ; $57E7: $F7
    ld   d, a                                     ; $57E8: $57
    scf                                           ; $57E9: $37
    ld   e, b                                     ; $57EA: $58
    add  c                                        ; $57EB: $81
    ld   e, b                                     ; $57EC: $58
    ldh  a, [wActiveEntityPosY]                   ; $57ED: $F0 $EC
    ld   hl, wEntitiesSubstate1Table              ; $57EF: $21 $B0 $C2
    add  hl, bc                                   ; $57F2: $09
    ld   [hl], a                                  ; $57F3: $77
    call IncrementEntityState                     ; $57F4: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $57F7: $CD $05 $0C
    ret  nz                                       ; $57FA: $C0

jr_019_57FB:
    call func_019_7E0B                            ; $57FB: $CD $0B $7E
    add  $F8                                      ; $57FE: $C6 $F8
    ld   e, a                                     ; $5800: $5F
    add  $28                                      ; $5801: $C6 $28
    cp   $50                                      ; $5803: $FE $50
    jr   nc, jr_019_581D                          ; $5805: $30 $16

    ld   a, e                                     ; $5807: $7B
    add  $18                                      ; $5808: $C6 $18
    cp   $30                                      ; $580A: $FE $30
    jr   nc, jr_019_581D                          ; $580C: $30 $0F

    call ClearEntitySpeed                         ; $580E: $CD $7F $3D
    ld   a, $08                                   ; $5811: $3E $08
    ldh  [hJingle], a                             ; $5813: $E0 $F2
    ld   a, $00                                   ; $5815: $3E $00
    call SetEntitySpriteVariant                   ; $5817: $CD $0C $3B
    jp   IncrementEntityState                     ; $581A: $C3 $12 $3B

jr_019_581D:
    ldh  a, [hFrameCounter]                       ; $581D: $F0 $E7
    and  $07                                      ; $581F: $E6 $07
    ret  nz                                       ; $5821: $C0

    ld   a, $1F                                   ; $5822: $3E $1F
    call GetVectorTowardsLink_trampoline          ; $5824: $CD $B5 $3B
    call func_019_567B                            ; $5827: $CD $7B $56
    rra                                           ; $582A: $1F
    and  $07                                      ; $582B: $E6 $07
    ld   e, a                                     ; $582D: $5F
    ld   d, b                                     ; $582E: $50
    ld   hl, $57AC                                ; $582F: $21 $AC $57
    add  hl, de                                   ; $5832: $19
    ld   a, [hl]                                  ; $5833: $7E
    jp   SetEntitySpriteVariant                   ; $5834: $C3 $0C $3B

    call func_019_7DBB                            ; $5837: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $583A: $21 $50 $C2
    add  hl, bc                                   ; $583D: $09
    ld   a, [hl]                                  ; $583E: $7E
    cp   $70                                      ; $583F: $FE $70
    jr   nc, jr_019_5846                          ; $5841: $30 $03

    add  $03                                      ; $5843: $C6 $03
    ld   [hl], a                                  ; $5845: $77

jr_019_5846:
    ld   hl, wEntitiesPosYTable                         ; $5846: $21 $10 $C2
    add  hl, bc                                   ; $5849: $09
    ld   a, [hl]                                  ; $584A: $7E
    add  $10                                      ; $584B: $C6 $10
    ld   [hl], a                                  ; $584D: $77
    ldh  a, [$FFEF]                               ; $584E: $F0 $EF
    add  $10                                      ; $5850: $C6 $10
    ldh  [$FFEF], a                               ; $5852: $E0 $EF
    call label_3B23                               ; $5854: $CD $23 $3B
    ld   hl, wEntitiesPosYTable                         ; $5857: $21 $10 $C2
    add  hl, bc                                   ; $585A: $09
    ld   a, [hl]                                  ; $585B: $7E
    sub  $10                                      ; $585C: $D6 $10
    ld   [hl], a                                  ; $585E: $77
    ldh  a, [$FFEF]                               ; $585F: $F0 $EF
    sub  $10                                      ; $5861: $D6 $10
    ldh  [$FFEF], a                               ; $5863: $E0 $EF
    ld   hl, wEntitiesCollisionsTable             ; $5865: $21 $A0 $C2
    add  hl, bc                                   ; $5868: $09
    ld   a, [hl]                                  ; $5869: $7E
    and  a                                        ; $586A: $A7
    ret  z                                        ; $586B: $C8

    call PlayBombExplosionSfx                     ; $586C: $CD $4B $0C
    call GetEntityTransitionCountdown             ; $586F: $CD $05 $0C
    ld   [hl], $30                                ; $5872: $36 $30
    ld   a, $30                                   ; $5874: $3E $30
    ld   [$C157], a                               ; $5876: $EA $57 $C1
    ld   a, $04                                   ; $5879: $3E $04
    ld   [$C158], a                               ; $587B: $EA $58 $C1
    jp   IncrementEntityState                     ; $587E: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $5881: $CD $05 $0C
    ret  nz                                       ; $5884: $C0

    ld   hl, wEntitiesSubstate1Table              ; $5885: $21 $B0 $C2
    add  hl, bc                                   ; $5888: $09
    ldh  a, [wActiveEntityPosY]                   ; $5889: $F0 $EC
    cp   [hl]                                     ; $588B: $BE
    jr   nz, jr_019_5899                          ; $588C: $20 $0B

    call IncrementEntityState                     ; $588E: $CD $12 $3B
    ld   [hl], $01                                ; $5891: $36 $01
    call GetEntityTransitionCountdown             ; $5893: $CD $05 $0C
    ld   [hl], $20                                ; $5896: $36 $20
    ret                                           ; $5898: $C9

jr_019_5899:
    ld   hl, wEntitiesSpeedYTable                       ; $5899: $21 $50 $C2
    add  hl, bc                                   ; $589C: $09
    ld   [hl], $F8                                ; $589D: $36 $F8
    jp   label_019_7DBB                           ; $589F: $C3 $BB $7D

func_019_58A2:
label_019_58A2:
    call label_3B5A                               ; $58A2: $CD $5A $3B
    ret  nc                                       ; $58A5: $D0

    call func_019_7E1B                            ; $58A6: $CD $1B $7E
    add  $08                                      ; $58A9: $C6 $08
    bit  7, a                                     ; $58AB: $CB $7F
    jr   nz, jr_019_58C0                          ; $58AD: $20 $11

    call label_3B18                               ; $58AF: $CD $18 $3B
    ld   a, $10                                   ; $58B2: $3E $10
    call GetVectorTowardsLink_trampoline          ; $58B4: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $58B7: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $58B9: $E0 $9B
    ldh  a, [hScratch1]                           ; $58BB: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $58BD: $E0 $9A
    ret                                           ; $58BF: $C9

jr_019_58C0:
    ldh  a, [hLinkPositionYIncrement]             ; $58C0: $F0 $9B
    and  $80                                      ; $58C2: $E6 $80
    jr   nz, jr_019_58D8                          ; $58C4: $20 $12

    ld   hl, wEntitiesPosYTable                         ; $58C6: $21 $10 $C2
    add  hl, bc                                   ; $58C9: $09
    ld   a, [hl]                                  ; $58CA: $7E
    sub  $10                                      ; $58CB: $D6 $10
    ldh  [hLinkPositionY], a                      ; $58CD: $E0 $99
    ld   a, $02                                   ; $58CF: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $58D1: $E0 $9B
    ld   a, $01                                   ; $58D3: $3E $01
    ld   [$C147], a                               ; $58D5: $EA $47 $C1

jr_019_58D8:
    ret                                           ; $58D8: $C9

    ld   e, [hl]                                  ; $58D9: $5E
    ld   b, $5E                                   ; $58DA: $06 $5E
    db   $26                                      ; $58DC: $26

SideViewPotEntityHandler::
    db   $11, $D9
    ld   e, b                                     ; $58DF: $58
    call RenderAnimatedActiveEntity               ; $58E0: $CD $C0 $3B
    call func_019_7D3D                            ; $58E3: $CD $3D $7D
    ldh  a, [hActiveEntityState]                  ; $58E6: $F0 $F0
    rst  $00                                      ; $58E8: $C7
    rst  $28                                      ; $58E9: $EF
    ld   e, b                                     ; $58EA: $58
    ld   a, c                                     ; $58EB: $79
    ld   e, c                                     ; $58EC: $59
    ld   a, c                                     ; $58ED: $79
    ld   e, c                                     ; $58EE: $59
    call label_3B5A                               ; $58EF: $CD $5A $3B
    jr   nc, jr_019_5922                          ; $58F2: $30 $2E

    call func_019_7E1B                            ; $58F4: $CD $1B $7E
    ld   e, a                                     ; $58F7: $5F
    add  $03                                      ; $58F8: $C6 $03
    cp   $06                                      ; $58FA: $FE $06
    jr   nc, jr_019_5901                          ; $58FC: $30 $03

    call func_019_599B                            ; $58FE: $CD $9B $59

jr_019_5901:
    ldh  a, [hLinkPositionYIncrement]             ; $5901: $F0 $9B
    and  $80                                      ; $5903: $E6 $80
    jr   nz, jr_019_5922                          ; $5905: $20 $1B

    call func_019_7E1B                            ; $5907: $CD $1B $7E
    add  $08                                      ; $590A: $C6 $08
    bit  7, a                                     ; $590C: $CB $7F
    jr   z, jr_019_5922                           ; $590E: $28 $12

    ld   hl, wEntitiesPosYTable                         ; $5910: $21 $10 $C2
    add  hl, bc                                   ; $5913: $09
    ld   a, [hl]                                  ; $5914: $7E
    sub  $10                                      ; $5915: $D6 $10
    ldh  [hLinkPositionY], a                      ; $5917: $E0 $99
    ld   a, $02                                   ; $5919: $3E $02
    ldh  [hLinkPositionYIncrement], a             ; $591B: $E0 $9B
    ld   a, $01                                   ; $591D: $3E $01
    ld   [$C147], a                               ; $591F: $EA $47 $C1

jr_019_5922:
    call func_019_7E0B                            ; $5922: $CD $0B $7E
    add  $12                                      ; $5925: $C6 $12
    cp   $24                                      ; $5927: $FE $24
    ret  nc                                       ; $5929: $D0

    call func_019_7E1B                            ; $592A: $CD $1B $7E
    add  $12                                      ; $592D: $C6 $12
    cp   $24                                      ; $592F: $FE $24
    ret  nc                                       ; $5931: $D0

    ld   a, [$C19B]                               ; $5932: $FA $9B $C1
    and  a                                        ; $5935: $A7
    ret  nz                                       ; $5936: $C0

    ld   a, [wAButtonSlot]                        ; $5937: $FA $00 $DB
    cp   $03                                      ; $593A: $FE $03
    jr   nz, jr_019_5945                          ; $593C: $20 $07

    ldh  a, [hJoypadState]                               ; $593E: $F0 $CC
    and  $20                                      ; $5940: $E6 $20
    jr   nz, jr_019_5950                          ; $5942: $20 $0C

    ret                                           ; $5944: $C9

jr_019_5945:
    ld   a, [wBButtonSlot]                        ; $5945: $FA $01 $DB
    cp   $03                                      ; $5948: $FE $03
    ret  nz                                       ; $594A: $C0

    ldh  a, [hJoypadState]                               ; $594B: $F0 $CC
    and  $10                                      ; $594D: $E6 $10
    ret  z                                        ; $594F: $C8

jr_019_5950:
    ld   a, [$C3CF]                               ; $5950: $FA $CF $C3
    and  a                                        ; $5953: $A7
    ret  nz                                       ; $5954: $C0

    inc  a                                        ; $5955: $3C
    ld   [$C3CF], a                               ; $5956: $EA $CF $C3
    ld   hl, wEntitiesStatusTable                        ; $5959: $21 $80 $C2
    add  hl, bc                                   ; $595C: $09
    ld   [hl], $07                                ; $595D: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $595F: $21 $90 $C4
    add  hl, bc                                   ; $5962: $09
    ld   [hl], b                                  ; $5963: $70
    call GetEntityTransitionCountdown             ; $5964: $CD $05 $0C
    ld   [hl], $02                                ; $5967: $36 $02
    ld   hl, hWaveSfx                             ; $5969: $21 $F3 $FF
    ld   [hl], $02                                ; $596C: $36 $02
    call IncrementEntityState                     ; $596E: $CD $12 $3B
    ld   [hl], $02                                ; $5971: $36 $02
    ldh  a, [hLinkDirection]                      ; $5973: $F0 $9E
    ld   [wC15D], a                               ; $5975: $EA $5D $C1
    ret                                           ; $5978: $C9

    call func_019_7DB8                            ; $5979: $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                       ; $597C: $21 $50 $C2
    add  hl, bc                                   ; $597F: $09
    ld   a, [hl]                                  ; $5980: $7E
    bit  7, a                                     ; $5981: $CB $7F
    jr   nz, jr_019_5989                          ; $5983: $20 $04

    cp   $40                                      ; $5985: $FE $40
    jr   nc, jr_019_598B                          ; $5987: $30 $02

jr_019_5989:
    inc  [hl]                                     ; $5989: $34
    inc  [hl]                                     ; $598A: $34

jr_019_598B:
    call label_3B23                               ; $598B: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $598E: $21 $A0 $C2
    add  hl, bc                                   ; $5991: $09
    ld   a, [hl]                                  ; $5992: $7E
    and  a                                        ; $5993: $A7
    ret  z                                        ; $5994: $C8

    call label_3E34                               ; $5995: $CD $34 $3E
    jp   label_019_7E61                           ; $5998: $C3 $61 $7E

func_019_599B:
    call ResetPegasusBoots                                ; $599B: $CD $B6 $0C
    ld   a, [$C146]                               ; $599E: $FA $46 $C1
    and  a                                        ; $59A1: $A7
    jr   nz, jr_019_59B7                          ; $59A2: $20 $13

    ld   a, $02                                   ; $59A4: $3E $02
    ld   [$C13E], a                               ; $59A6: $EA $3E $C1
    call func_019_7E0B                            ; $59A9: $CD $0B $7E
    ld   a, e                                     ; $59AC: $7B
    and  a                                        ; $59AD: $A7
    ld   a, $10                                   ; $59AE: $3E $10
    jr   z, jr_019_59B4                           ; $59B0: $28 $02

    ld   a, $F0                                   ; $59B2: $3E $F0

jr_019_59B4:
    ldh  [hLinkPositionXIncrement], a             ; $59B4: $E0 $9A
    ret                                           ; $59B6: $C9

jr_019_59B7:
    ldh  a, [hLinkFinalPositionX]                 ; $59B7: $F0 $9F
    ldh  [hLinkPositionX], a                      ; $59B9: $E0 $98
    ret                                           ; $59BB: $C9

    ld   b, d                                     ; $59BC: $42
    inc  hl                                       ; $59BD: $23
    ld   b, b                                     ; $59BE: $40
    inc  hl                                       ; $59BF: $23
    ld   b, [hl]                                  ; $59C0: $46
    inc  hl                                       ; $59C1: $23
    ld   b, h                                     ; $59C2: $44
    inc  hl                                       ; $59C3: $23
    ld   b, b                                     ; $59C4: $40
    inc  bc                                       ; $59C5: $03
    ld   b, d                                     ; $59C6: $42
    inc  bc                                       ; $59C7: $03
    ld   b, h                                     ; $59C8: $44
    inc  bc                                       ; $59C9: $03
    ld   b, [hl]                                  ; $59CA: $46
    inc  bc                                       ; $59CB: $03
    ld   c, h                                     ; $59CC: $4C
    inc  bc                                       ; $59CD: $03
    ld   c, h                                     ; $59CE: $4C
    inc  hl                                       ; $59CF: $23
    ld   c, [hl]                                  ; $59D0: $4E
    inc  bc                                       ; $59D1: $03
    ld   c, [hl]                                  ; $59D2: $4E
    inc  hl                                       ; $59D3: $23
    ld   c, b                                     ; $59D4: $48
    inc  bc                                       ; $59D5: $03
    ld   c, b                                     ; $59D6: $48
    inc  hl                                       ; $59D7: $23
    ld   c, d                                     ; $59D8: $4A
    inc  bc                                       ; $59D9: $03
    ld   c, d                                     ; $59DA: $4A
    inc  hl                                       ; $59DB: $23

RoosterEntityHandler::
    ld   a, [wIsRoosterFollowingLink]             ; $59DC: $FA $7B $DB
    and  a                                        ; $59DF: $A7
    jp   z, label_019_7E61                        ; $59E0: $CA $61 $7E

    ldh  a, [hMapRoom]                            ; $59E3: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $59E5: $21 $E0 $C3
    add  hl, bc                                   ; $59E8: $09
    ld   [hl], a                                  ; $59E9: $77
    ld   hl, wEntitiesPosXSignTable                                ; $59EA: $21 $20 $C2
    add  hl, bc                                   ; $59ED: $09
    ld   [hl], b                                  ; $59EE: $70
    ld   hl, wEntitiesPosYSignTable                                ; $59EF: $21 $30 $C2
    add  hl, bc                                   ; $59F2: $09
    ld   [hl], b                                  ; $59F3: $70
    ld   de, $59BC                                ; $59F4: $11 $BC $59
    call RenderAnimatedActiveEntity                               ; $59F7: $CD $C0 $3B
    ldh  a, [hActiveEntityStatus]                 ; $59FA: $F0 $EA
    cp   $07                                      ; $59FC: $FE $07
    jp   z, label_019_5B3C                        ; $59FE: $CA $3C $5B

    ld   a, [wLinkMotionState]                    ; $5A01: $FA $1C $C1
    cp   $01                                      ; $5A04: $FE $01
    jr   nz, jr_019_5A0D                          ; $5A06: $20 $05

    call func_019_5B00                            ; $5A08: $CD $00 $5B
    jr   jr_019_5A31                              ; $5A0B: $18 $24

jr_019_5A0D:
    call func_019_7DF1                            ; $5A0D: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $5A10: $21 $20 $C3
    add  hl, bc                                   ; $5A13: $09
    dec  [hl]                                     ; $5A14: $35
    ld   hl, wEntitiesPosZTable                   ; $5A15: $21 $10 $C3
    add  hl, bc                                   ; $5A18: $09
    ld   a, [hl]                                  ; $5A19: $7E
    and  $80                                      ; $5A1A: $E6 $80
    jr   z, jr_019_5A35                           ; $5A1C: $28 $17

    ld   [hl], b                                  ; $5A1E: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5A1F: $21 $20 $C3
    add  hl, bc                                   ; $5A22: $09
    ld   [hl], $10                                ; $5A23: $36 $10
    ld   a, [$C146]                               ; $5A25: $FA $46 $C1
    ld   e, a                                     ; $5A28: $5F
    ld   a, [wIsRunningWithPegasusBoots]          ; $5A29: $FA $4A $C1
    or   e                                        ; $5A2C: $B3
    jr   z, jr_019_5A31                           ; $5A2D: $28 $02

    ld   [hl], $20                                ; $5A2F: $36 $20

jr_019_5A31:
    call IncrementEntityState                     ; $5A31: $CD $12 $3B
    ld   [hl], b                                  ; $5A34: $70

jr_019_5A35:
    call func_019_7D3D                            ; $5A35: $CD $3D $7D
    ldh  a, [hActiveEntityState]                  ; $5A38: $F0 $F0
    and  a                                        ; $5A3A: $A7
    jr   nz, jr_019_5A85                          ; $5A3B: $20 $48

    call func_019_7E3A                            ; $5A3D: $CD $3A $7E
    sla  e                                        ; $5A40: $CB $23
    ldh  a, [hFrameCounter]                       ; $5A42: $F0 $E7
    rra                                           ; $5A44: $1F
    rra                                           ; $5A45: $1F
    rra                                           ; $5A46: $1F
    and  $01                                      ; $5A47: $E6 $01
    add  e                                        ; $5A49: $83
    call SetEntitySpriteVariant                   ; $5A4A: $CD $0C $3B
    call func_019_7E0B                            ; $5A4D: $CD $0B $7E
    add  $12                                      ; $5A50: $C6 $12
    cp   $24                                      ; $5A52: $FE $24
    jr   nc, jr_019_5A5F                          ; $5A54: $30 $09

    call func_019_7E1B                            ; $5A56: $CD $1B $7E
    add  $12                                      ; $5A59: $C6 $12
    cp   $24                                      ; $5A5B: $FE $24
    jr   c, jr_019_5A9F                           ; $5A5D: $38 $40

jr_019_5A5F:
    ldh  a, [hFrameCounter]                       ; $5A5F: $F0 $E7
    and  $07                                      ; $5A61: $E6 $07
    jr   nz, jr_019_5A7F                          ; $5A63: $20 $1A

    ld   a, [wIsRunningWithPegasusBoots]          ; $5A65: $FA $4A $C1
    and  a                                        ; $5A68: $A7
    ld   a, $0C                                   ; $5A69: $3E $0C
    jr   z, jr_019_5A6F                           ; $5A6B: $28 $02

    ld   a, $20                                   ; $5A6D: $3E $20

jr_019_5A6F:
    ld   e, a                                     ; $5A6F: $5F
    ld   hl, wEntitiesPosZTable                   ; $5A70: $21 $10 $C3
    add  hl, bc                                   ; $5A73: $09
    ld   a, [hl]                                  ; $5A74: $7E
    push af                                       ; $5A75: $F5
    push hl                                       ; $5A76: $E5
    ld   [hl], b                                  ; $5A77: $70
    ld   a, e                                     ; $5A78: $7B
    call ApplyVectorTowardsLink_trampoline        ; $5A79: $CD $AA $3B
    pop  hl                                       ; $5A7C: $E1
    pop  af                                       ; $5A7D: $F1
    ld   [hl], a                                  ; $5A7E: $77

jr_019_5A7F:
    call func_019_7DB8                            ; $5A7F: $CD $B8 $7D
    jp   label_3B23                               ; $5A82: $C3 $23 $3B

jr_019_5A85:
    ld   hl, wEntitiesSpeedXTable                       ; $5A85: $21 $40 $C2
    add  hl, bc                                   ; $5A88: $09
    ld   a, [hl]                                  ; $5A89: $7E
    and  $80                                      ; $5A8A: $E6 $80
    jr   z, jr_019_5A90                           ; $5A8C: $28 $02

    inc  [hl]                                     ; $5A8E: $34
    inc  [hl]                                     ; $5A8F: $34

jr_019_5A90:
    dec  [hl]                                     ; $5A90: $35
    ld   hl, wEntitiesSpeedYTable                       ; $5A91: $21 $50 $C2
    add  hl, bc                                   ; $5A94: $09
    ld   a, [hl]                                  ; $5A95: $7E
    and  $80                                      ; $5A96: $E6 $80
    jr   z, jr_019_5A9C                           ; $5A98: $28 $02

    inc  [hl]                                     ; $5A9A: $34
    inc  [hl]                                     ; $5A9B: $34

jr_019_5A9C:
    dec  [hl]                                     ; $5A9C: $35
    jr   jr_019_5A7F                              ; $5A9D: $18 $E0

jr_019_5A9F:
    call ClearEntitySpeed                         ; $5A9F: $CD $7F $3D
    call label_3B5A                               ; $5AA2: $CD $5A $3B
    ret  nc                                       ; $5AA5: $D0

    ld   a, [$C19B]                               ; $5AA6: $FA $9B $C1
    and  a                                        ; $5AA9: $A7
    ret  nz                                       ; $5AAA: $C0

    ld   a, [wAButtonSlot]                        ; $5AAB: $FA $00 $DB
    cp   $03                                      ; $5AAE: $FE $03
    jr   nz, jr_019_5AB9                          ; $5AB0: $20 $07

    ldh  a, [hJoypadState]                               ; $5AB2: $F0 $CC
    and  $20                                      ; $5AB4: $E6 $20
    jr   nz, jr_019_5AC4                          ; $5AB6: $20 $0C

    ret                                           ; $5AB8: $C9

jr_019_5AB9:
    ld   a, [wBButtonSlot]                        ; $5AB9: $FA $01 $DB
    cp   $03                                      ; $5ABC: $FE $03
    ret  nz                                       ; $5ABE: $C0

    ldh  a, [hJoypadState]                               ; $5ABF: $F0 $CC
    and  $10                                      ; $5AC1: $E6 $10
    ret  z                                        ; $5AC3: $C8

jr_019_5AC4:
    ld   a, [wLinkMotionState]                    ; $5AC4: $FA $1C $C1
    cp   $02                                      ; $5AC7: $FE $02
    ret  nc                                       ; $5AC9: $D0

    ld   a, [$C3CF]                               ; $5ACA: $FA $CF $C3
    and  a                                        ; $5ACD: $A7
    ret  nz                                       ; $5ACE: $C0

    ld   [wLinkMotionState], a                    ; $5ACF: $EA $1C $C1
    inc  a                                        ; $5AD2: $3C
    ld   [$C3CF], a                               ; $5AD3: $EA $CF $C3
    ld   hl, wEntitiesStatusTable                        ; $5AD6: $21 $80 $C2
    add  hl, bc                                   ; $5AD9: $09
    ld   [hl], $07                                ; $5ADA: $36 $07
    ld   hl, wEntitiesUnknowTableW                ; $5ADC: $21 $90 $C4
    add  hl, bc                                   ; $5ADF: $09
    ld   [hl], b                                  ; $5AE0: $70
    call GetEntityTransitionCountdown             ; $5AE1: $CD $05 $0C
    ld   [hl], $02                                ; $5AE4: $36 $02
    ld   hl, hWaveSfx                             ; $5AE6: $21 $F3 $FF
    ld   [hl], $02                                ; $5AE9: $36 $02
    call IncrementEntityState                     ; $5AEB: $CD $12 $3B
    ld   [hl], $01                                ; $5AEE: $36 $01
    ld   a, $02                                   ; $5AF0: $3E $02
    ldh  [hLinkPositionZ], a                      ; $5AF2: $E0 $A2
    ld   [$C146], a                               ; $5AF4: $EA $46 $C1
    ret                                           ; $5AF7: $C9

    ld   b, $07                                   ; $5AF8: $06 $07
    ld   [$0909], sp                              ; $5AFA: $08 $09 $09
    ld   [$0607], sp                              ; $5AFD: $08 $07 $06

func_019_5B00:
    ld   hl, wEntitiesSpeedZTable                 ; $5B00: $21 $20 $C3
    add  hl, bc                                   ; $5B03: $09
    ld   [hl], b                                  ; $5B04: $70
    ldh  a, [hFrameCounter]                       ; $5B05: $F0 $E7
    rra                                           ; $5B07: $1F
    rra                                           ; $5B08: $1F
    rra                                           ; $5B09: $1F
    and  $07                                      ; $5B0A: $E6 $07
    ld   e, a                                     ; $5B0C: $5F
    ld   d, b                                     ; $5B0D: $50
    ld   hl, $5AF8                                ; $5B0E: $21 $F8 $5A
    add  hl, de                                   ; $5B11: $19
    ld   e, [hl]                                  ; $5B12: $5E
    ld   hl, wEntitiesPosZTable                   ; $5B13: $21 $10 $C3
    add  hl, bc                                   ; $5B16: $09
    ld   a, [hl]                                  ; $5B17: $7E
    sub  e                                        ; $5B18: $93
    ret  z                                        ; $5B19: $C8

    ld   e, a                                     ; $5B1A: $5F
    ldh  a, [hFrameCounter]                       ; $5B1B: $F0 $E7
    and  $01                                      ; $5B1D: $E6 $01
    ret  nz                                       ; $5B1F: $C0

    ld   a, e                                     ; $5B20: $7B
    and  $80                                      ; $5B21: $E6 $80
    jr   z, jr_019_5B27                           ; $5B23: $28 $02

    inc  [hl]                                     ; $5B25: $34
    inc  [hl]                                     ; $5B26: $34

jr_019_5B27:
    dec  [hl]                                     ; $5B27: $35
    ret                                           ; $5B28: $C9

    rrca                                          ; $5B29: $0F
    nop                                           ; $5B2A: $00
    ld   bc, $020F                                ; $5B2B: $01 $0F $02
    rrca                                          ; $5B2E: $0F
    rrca                                          ; $5B2F: $0F
    rrca                                          ; $5B30: $0F
    inc  bc                                       ; $5B31: $03
    rrca                                          ; $5B32: $0F
    rrca                                          ; $5B33: $0F
    inc  d                                        ; $5B34: $14
    inc  d                                        ; $5B35: $14
    dec  d                                        ; $5B36: $15
    ld   d, $17                                   ; $5B37: $16 $17
    rla                                           ; $5B39: $17
    ld   d, $15                                   ; $5B3A: $16 $15

label_019_5B3C:
    ldh  a, [hLinkDirection]                      ; $5B3C: $F0 $9E
    rla                                           ; $5B3E: $17
    and  $06                                      ; $5B3F: $E6 $06
    ld   e, a                                     ; $5B41: $5F
    ldh  a, [hFrameCounter]                       ; $5B42: $F0 $E7
    rra                                           ; $5B44: $1F
    rra                                           ; $5B45: $1F
    and  $01                                      ; $5B46: $E6 $01
    add  e                                        ; $5B48: $83
    call SetEntitySpriteVariant                   ; $5B49: $CD $0C $3B
    ld   a, $02                                   ; $5B4C: $3E $02
    ld   [$C146], a                               ; $5B4E: $EA $46 $C1
    xor  a                                        ; $5B51: $AF
    ldh  [$FFA3], a                               ; $5B52: $E0 $A3
    ldh  a, [hFrameCounter]                       ; $5B54: $F0 $E7
    and  $03                                      ; $5B56: $E6 $03
    jr   nz, jr_019_5B75                          ; $5B58: $20 $1B

    ldh  a, [hFrameCounter]                       ; $5B5A: $F0 $E7
    rra                                           ; $5B5C: $1F
    rra                                           ; $5B5D: $1F
    and  $07                                      ; $5B5E: $E6 $07
    ld   e, a                                     ; $5B60: $5F
    ld   d, b                                     ; $5B61: $50
    ld   hl, $5B34                                ; $5B62: $21 $34 $5B
    add  hl, de                                   ; $5B65: $19
    ld   e, [hl]                                  ; $5B66: $5E
    ld   hl, hLinkPositionZ                                ; $5B67: $21 $A2 $FF
    ld   a, [hl]                                  ; $5B6A: $7E
    sub  e                                        ; $5B6B: $93
    jr   z, jr_019_5B75                           ; $5B6C: $28 $07

    and  $80                                      ; $5B6E: $E6 $80
    jr   z, jr_019_5B74                           ; $5B70: $28 $02

    inc  [hl]                                     ; $5B72: $34
    inc  [hl]                                     ; $5B73: $34

jr_019_5B74:
    dec  [hl]                                     ; $5B74: $35

jr_019_5B75:
    ldh  a, [hPressedButtonsMask]                 ; $5B75: $F0 $CB
    and  $0F                                      ; $5B77: $E6 $0F
    ld   e, a                                     ; $5B79: $5F
    ld   d, b                                     ; $5B7A: $50
    ld   hl, $5B29                                ; $5B7B: $21 $29 $5B
    add  hl, de                                   ; $5B7E: $19
    ld   a, [hl]                                  ; $5B7F: $7E
    cp   $0F                                      ; $5B80: $FE $0F
    jr   z, jr_019_5B89                           ; $5B82: $28 $05

    ldh  [hLinkDirection], a                      ; $5B84: $E0 $9E
    ld   [wC15D], a                               ; $5B86: $EA $5D $C1

jr_019_5B89:
    ld   a, [wCollisionType]                      ; $5B89: $FA $33 $C1
    and  $03                                      ; $5B8C: $E6 $03
    jr   z, jr_019_5B93                           ; $5B8E: $28 $03

    xor  a                                        ; $5B90: $AF
    ldh  [hLinkPositionYIncrement], a             ; $5B91: $E0 $9B

jr_019_5B93:
    ld   a, [wCollisionType]                      ; $5B93: $FA $33 $C1
    and  $0C                                      ; $5B96: $E6 $0C
    jr   z, jr_019_5B9D                           ; $5B98: $28 $03

    xor  a                                        ; $5B9A: $AF
    ldh  [hLinkPositionXIncrement], a             ; $5B9B: $E0 $9A

jr_019_5B9D:
    jp   PlayBoomerangSfx_trampoline               ; $5B9D: $C3 $F8 $29

    ld   h, h                                     ; $5BA0: $64
    nop                                           ; $5BA1: $00
    ld   h, h                                     ; $5BA2: $64
    jr   nz, jr_019_5C0B                          ; $5BA3: $20 $66

    nop                                           ; $5BA5: $00
    ld   h, [hl]                                  ; $5BA6: $66
    jr   nz, @+$62                                ; $5BA7: $20 $60

    nop                                           ; $5BA9: $00
    ld   h, b                                     ; $5BAA: $60
    jr   nz, @+$64                                ; $5BAB: $20 $62

    nop                                           ; $5BAD: $00
    ld   h, d                                     ; $5BAE: $62
    jr   nz, @+$6A                                ; $5BAF: $20 $68

    nop                                           ; $5BB1: $00
    ld   l, d                                     ; $5BB2: $6A
    nop                                           ; $5BB3: $00
    ld   l, h                                     ; $5BB4: $6C
    nop                                           ; $5BB5: $00
    ld   l, [hl]                                  ; $5BB6: $6E
    nop                                           ; $5BB7: $00
    ld   l, d                                     ; $5BB8: $6A
    jr   nz, jr_019_5C23                          ; $5BB9: $20 $68

    jr   nz, jr_019_5C2B                          ; $5BBB: $20 $6E

    jr   nz, jr_019_5C2B                          ; $5BBD: $20 $6C

    db   $20                                      ; $5BBF: $20

RichardFrogEntityHandler::
    db   $11
    and  b                                        ; $5BC1: $A0
    ld   e, e                                     ; $5BC2: $5B
    call RenderAnimatedActiveEntity                               ; $5BC3: $CD $C0 $3B
    call func_019_7D3D                            ; $5BC6: $CD $3D $7D
    call func_019_7DB8                            ; $5BC9: $CD $B8 $7D
    call func_019_7DF1                            ; $5BCC: $CD $F1 $7D
    call label_3B23                               ; $5BCF: $CD $23 $3B

jr_019_5BD2:
    ld   hl, wEntitiesSpeedZTable                 ; $5BD2: $21 $20 $C3
    add  hl, bc                                   ; $5BD5: $09
    dec  [hl]                                     ; $5BD6: $35
    dec  [hl]                                     ; $5BD7: $35
    ld   hl, wEntitiesPosZTable                   ; $5BD8: $21 $10 $C3
    add  hl, bc                                   ; $5BDB: $09
    ld   a, [hl]                                  ; $5BDC: $7E
    and  $80                                      ; $5BDD: $E6 $80
    ldh  [hFFE8], a                               ; $5BDF: $E0 $E8
    jr   z, jr_019_5BE9                           ; $5BE1: $28 $06

    ld   [hl], b                                  ; $5BE3: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5BE4: $21 $20 $C3
    add  hl, bc                                   ; $5BE7: $09
    ld   [hl], b                                  ; $5BE8: $70

jr_019_5BE9:
    ldh  a, [hActiveEntityState]                  ; $5BE9: $F0 $F0
    rst  $00                                      ; $5BEB: $C7
    ld   [$495C], sp                              ; $5BEC: $08 $5C $49
    ld   e, h                                     ; $5BEF: $5C
    nop                                           ; $5BF0: $00
    stop                                          ; $5BF1: $10 $00
    ldh  a, [$FF0C]                               ; $5BF3: $F0 $0C
    inc  c                                        ; $5BF5: $0C
    db   $F4                                      ; $5BF6: $F4
    db   $F4                                      ; $5BF7: $F4
    ldh  a, [rP1]                                 ; $5BF8: $F0 $00
    stop                                          ; $5BFA: $10 $00
    db   $F4                                      ; $5BFC: $F4
    inc  c                                        ; $5BFD: $0C
    inc  c                                        ; $5BFE: $0C
    db   $F4                                      ; $5BFF: $F4
    nop                                           ; $5C00: $00
    ld   b, $02                                   ; $5C01: $06 $02
    inc  b                                        ; $5C03: $04
    nop                                           ; $5C04: $00
    ld   b, $02                                   ; $5C05: $06 $02
    inc  b                                        ; $5C07: $04
    call GetEntityTransitionCountdown             ; $5C08: $CD $05 $0C

jr_019_5C0B:
    jr   nz, jr_019_5C41                          ; $5C0B: $20 $34

    call IncrementEntityState                     ; $5C0D: $CD $12 $3B
    call GetRandomByte                            ; $5C10: $CD $0D $28
    and  $1F                                      ; $5C13: $E6 $1F
    or   $10                                      ; $5C15: $F6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $5C17: $21 $20 $C3
    add  hl, bc                                   ; $5C1A: $09
    ld   [hl], a                                  ; $5C1B: $77
    call GetRandomByte                            ; $5C1C: $CD $0D $28
    and  $07                                      ; $5C1F: $E6 $07
    ld   e, a                                     ; $5C21: $5F
    ld   d, b                                     ; $5C22: $50

jr_019_5C23:
    ld   hl, $5BF0                                ; $5C23: $21 $F0 $5B
    add  hl, de                                   ; $5C26: $19
    ld   a, [hl]                                  ; $5C27: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5C28: $21 $40 $C2

jr_019_5C2B:
    add  hl, bc                                   ; $5C2B: $09
    ld   [hl], a                                  ; $5C2C: $77
    ld   hl, $5BF8                                ; $5C2D: $21 $F8 $5B
    add  hl, de                                   ; $5C30: $19
    ld   a, [hl]                                  ; $5C31: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5C32: $21 $50 $C2
    add  hl, bc                                   ; $5C35: $09
    ld   [hl], a                                  ; $5C36: $77
    ld   hl, $5C00                                ; $5C37: $21 $00 $5C
    add  hl, de                                   ; $5C3A: $19
    ld   a, [hl]                                  ; $5C3B: $7E
    ld   hl, wEntitiesDirectionTable              ; $5C3C: $21 $80 $C3
    add  hl, bc                                   ; $5C3F: $09
    ld   [hl], a                                  ; $5C40: $77

jr_019_5C41:
    ld   hl, wEntitiesDirectionTable              ; $5C41: $21 $80 $C3
    add  hl, bc                                   ; $5C44: $09
    ld   a, [hl]                                  ; $5C45: $7E
    jp   SetEntitySpriteVariant                   ; $5C46: $C3 $0C $3B

    ldh  a, [hFFE8]                               ; $5C49: $F0 $E8
    and  a                                        ; $5C4B: $A7
    jr   z, jr_019_5C61                           ; $5C4C: $28 $13

    call GetEntityTransitionCountdown             ; $5C4E: $CD $05 $0C
    call GetRandomByte                            ; $5C51: $CD $0D $28
    and  $1F                                      ; $5C54: $E6 $1F
    add  $10                                      ; $5C56: $C6 $10
    ld   [hl], a                                  ; $5C58: $77
    call ClearEntitySpeed                         ; $5C59: $CD $7F $3D
    call IncrementEntityState                     ; $5C5C: $CD $12 $3B
    ld   [hl], b                                  ; $5C5F: $70
    ret                                           ; $5C60: $C9

jr_019_5C61:
    ld   hl, wEntitiesDirectionTable              ; $5C61: $21 $80 $C3
    add  hl, bc                                   ; $5C64: $09
    ld   a, [hl]                                  ; $5C65: $7E
    inc  a                                        ; $5C66: $3C
    jp   SetEntitySpriteVariant                   ; $5C67: $C3 $0C $3B

    nop                                           ; $5C6A: $00
    inc  l                                        ; $5C6B: $2C
    nop                                           ; $5C6C: $00
    nop                                           ; $5C6D: $00
    nop                                           ; $5C6E: $00
    nop                                           ; $5C6F: $00
    nop                                           ; $5C70: $00
    nop                                           ; $5C71: $00
    nop                                           ; $5C72: $00
    nop                                           ; $5C73: $00
    nop                                           ; $5C74: $00
    nop                                           ; $5C75: $00
    nop                                           ; $5C76: $00
    nop                                           ; $5C77: $00
    nop                                           ; $5C78: $00
    nop                                           ; $5C79: $00
    nop                                           ; $5C7A: $00
    nop                                           ; $5C7B: $00
    nop                                           ; $5C7C: $00
    nop                                           ; $5C7D: $00
    nop                                           ; $5C7E: $00
    nop                                           ; $5C7F: $00
    nop                                           ; $5C80: $00
    nop                                           ; $5C81: $00
    nop                                           ; $5C82: $00
    nop                                           ; $5C83: $00
    nop                                           ; $5C84: $00
    nop                                           ; $5C85: $00
    nop                                           ; $5C86: $00
    nop                                           ; $5C87: $00
    nop                                           ; $5C88: $00
    nop                                           ; $5C89: $00
    nop                                           ; $5C8A: $00
    nop                                           ; $5C8B: $00
    nop                                           ; $5C8C: $00
    nop                                           ; $5C8D: $00
    nop                                           ; $5C8E: $00
    nop                                           ; $5C8F: $00
    nop                                           ; $5C90: $00
    nop                                           ; $5C91: $00
    nop                                           ; $5C92: $00
    nop                                           ; $5C93: $00
    nop                                           ; $5C94: $00
    nop                                           ; $5C95: $00
    db   $EC                                      ; $5C96: $EC
    nop                                           ; $5C97: $00
    nop                                           ; $5C98: $00
    nop                                           ; $5C99: $00
    nop                                           ; $5C9A: $00
    nop                                           ; $5C9B: $00
    nop                                           ; $5C9C: $00
    nop                                           ; $5C9D: $00
    nop                                           ; $5C9E: $00
    nop                                           ; $5C9F: $00
    nop                                           ; $5CA0: $00
    nop                                           ; $5CA1: $00
    nop                                           ; $5CA2: $00
    nop                                           ; $5CA3: $00
    nop                                           ; $5CA4: $00
    nop                                           ; $5CA5: $00
    nop                                           ; $5CA6: $00
    nop                                           ; $5CA7: $00
    nop                                           ; $5CA8: $00
    nop                                           ; $5CA9: $00
    nop                                           ; $5CAA: $00
    nop                                           ; $5CAB: $00
    nop                                           ; $5CAC: $00
    nop                                           ; $5CAD: $00
    nop                                           ; $5CAE: $00
    nop                                           ; $5CAF: $00
    nop                                           ; $5CB0: $00
    nop                                           ; $5CB1: $00
    nop                                           ; $5CB2: $00
    nop                                           ; $5CB3: $00
    nop                                           ; $5CB4: $00
    nop                                           ; $5CB5: $00
    nop                                           ; $5CB6: $00
    nop                                           ; $5CB7: $00
    nop                                           ; $5CB8: $00
    nop                                           ; $5CB9: $00
    nop                                           ; $5CBA: $00
    nop                                           ; $5CBB: $00
    nop                                           ; $5CBC: $00
    nop                                           ; $5CBD: $00
    nop                                           ; $5CBE: $00
    nop                                           ; $5CBF: $00
    nop                                           ; $5CC0: $00
    nop                                           ; $5CC1: $00
    nop                                           ; $5CC2: $00
    nop                                           ; $5CC3: $00
    nop                                           ; $5CC4: $00
    nop                                           ; $5CC5: $00
    nop                                           ; $5CC6: $00
    nop                                           ; $5CC7: $00
    nop                                           ; $5CC8: $00
    nop                                           ; $5CC9: $00
    nop                                           ; $5CCA: $00
    nop                                           ; $5CCB: $00
    nop                                           ; $5CCC: $00
    nop                                           ; $5CCD: $00
    nop                                           ; $5CCE: $00
    nop                                           ; $5CCF: $00
    nop                                           ; $5CD0: $00
    nop                                           ; $5CD1: $00
    nop                                           ; $5CD2: $00
    nop                                           ; $5CD3: $00
    nop                                           ; $5CD4: $00
    nop                                           ; $5CD5: $00
    nop                                           ; $5CD6: $00
    nop                                           ; $5CD7: $00
    nop                                           ; $5CD8: $00
    nop                                           ; $5CD9: $00
    nop                                           ; $5CDA: $00
    nop                                           ; $5CDB: $00
    nop                                           ; $5CDC: $00
    nop                                           ; $5CDD: $00
    nop                                           ; $5CDE: $00
    nop                                           ; $5CDF: $00
    nop                                           ; $5CE0: $00
    nop                                           ; $5CE1: $00
    nop                                           ; $5CE2: $00
    nop                                           ; $5CE3: $00
    nop                                           ; $5CE4: $00
    nop                                           ; $5CE5: $00
    nop                                           ; $5CE6: $00
    nop                                           ; $5CE7: $00
    nop                                           ; $5CE8: $00
    nop                                           ; $5CE9: $00
    nop                                           ; $5CEA: $00
    nop                                           ; $5CEB: $00
    nop                                           ; $5CEC: $00
    nop                                           ; $5CED: $00
    nop                                           ; $5CEE: $00
    nop                                           ; $5CEF: $00
    nop                                           ; $5CF0: $00
    nop                                           ; $5CF1: $00
    nop                                           ; $5CF2: $00
    nop                                           ; $5CF3: $00
    nop                                           ; $5CF4: $00
    nop                                           ; $5CF5: $00
    nop                                           ; $5CF6: $00
    nop                                           ; $5CF7: $00
    nop                                           ; $5CF8: $00
    nop                                           ; $5CF9: $00
    nop                                           ; $5CFA: $00
    nop                                           ; $5CFB: $00
    nop                                           ; $5CFC: $00
    nop                                           ; $5CFD: $00
    nop                                           ; $5CFE: $00
    ld   bc, $0000                                ; $5CFF: $01 $00 $00
    nop                                           ; $5D02: $00
    nop                                           ; $5D03: $00
    nop                                           ; $5D04: $00
    nop                                           ; $5D05: $00
    nop                                           ; $5D06: $00
    nop                                           ; $5D07: $00
    nop                                           ; $5D08: $00
    nop                                           ; $5D09: $00
    nop                                           ; $5D0A: $00
    nop                                           ; $5D0B: $00
    nop                                           ; $5D0C: $00
    nop                                           ; $5D0D: $00
    nop                                           ; $5D0E: $00
    nop                                           ; $5D0F: $00
    nop                                           ; $5D10: $00
    nop                                           ; $5D11: $00
    nop                                           ; $5D12: $00
    nop                                           ; $5D13: $00
    nop                                           ; $5D14: $00
    nop                                           ; $5D15: $00
    nop                                           ; $5D16: $00
    nop                                           ; $5D17: $00
    nop                                           ; $5D18: $00
    nop                                           ; $5D19: $00
    nop                                           ; $5D1A: $00
    nop                                           ; $5D1B: $00
    nop                                           ; $5D1C: $00
    nop                                           ; $5D1D: $00
    nop                                           ; $5D1E: $00
    nop                                           ; $5D1F: $00
    nop                                           ; $5D20: $00
    nop                                           ; $5D21: $00
    nop                                           ; $5D22: $00
    nop                                           ; $5D23: $00
    nop                                           ; $5D24: $00
    nop                                           ; $5D25: $00
    nop                                           ; $5D26: $00
    nop                                           ; $5D27: $00
    nop                                           ; $5D28: $00
    nop                                           ; $5D29: $00
    nop                                           ; $5D2A: $00
    nop                                           ; $5D2B: $00
    nop                                           ; $5D2C: $00
    nop                                           ; $5D2D: $00
    nop                                           ; $5D2E: $00
    nop                                           ; $5D2F: $00
    nop                                           ; $5D30: $00
    nop                                           ; $5D31: $00
    nop                                           ; $5D32: $00
    nop                                           ; $5D33: $00
    nop                                           ; $5D34: $00
    nop                                           ; $5D35: $00
    nop                                           ; $5D36: $00
    nop                                           ; $5D37: $00
    nop                                           ; $5D38: $00
    nop                                           ; $5D39: $00
    nop                                           ; $5D3A: $00
    nop                                           ; $5D3B: $00
    nop                                           ; $5D3C: $00
    nop                                           ; $5D3D: $00
    nop                                           ; $5D3E: $00
    nop                                           ; $5D3F: $00
    nop                                           ; $5D40: $00
    nop                                           ; $5D41: $00
    nop                                           ; $5D42: $00
    nop                                           ; $5D43: $00
    nop                                           ; $5D44: $00
    nop                                           ; $5D45: $00
    nop                                           ; $5D46: $00
    nop                                           ; $5D47: $00
    nop                                           ; $5D48: $00
    nop                                           ; $5D49: $00
    nop                                           ; $5D4A: $00
    nop                                           ; $5D4B: $00
    nop                                           ; $5D4C: $00
    nop                                           ; $5D4D: $00
    nop                                           ; $5D4E: $00
    nop                                           ; $5D4F: $00
    nop                                           ; $5D50: $00
    nop                                           ; $5D51: $00
    nop                                           ; $5D52: $00
    nop                                           ; $5D53: $00
    nop                                           ; $5D54: $00
    nop                                           ; $5D55: $00
    sub  l                                        ; $5D56: $95
    nop                                           ; $5D57: $00
    nop                                           ; $5D58: $00
    nop                                           ; $5D59: $00
    nop                                           ; $5D5A: $00
    nop                                           ; $5D5B: $00
    nop                                           ; $5D5C: $00
    nop                                           ; $5D5D: $00
    nop                                           ; $5D5E: $00
    nop                                           ; $5D5F: $00
    nop                                           ; $5D60: $00
    nop                                           ; $5D61: $00
    nop                                           ; $5D62: $00
    nop                                           ; $5D63: $00
    nop                                           ; $5D64: $00
    nop                                           ; $5D65: $00
    nop                                           ; $5D66: $00
    nop                                           ; $5D67: $00
    nop                                           ; $5D68: $00
    nop                                           ; $5D69: $00

func_019_5D6A::
    ld   a, $01                                   ; $5D6A: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5D6C: $E0 $A1
    ld   [wC167], a                               ; $5D6E: $EA $67 $C1
    call ClearLinkPositionIncrement               ; $5D71: $CD $8E $17
    ldh  a, [hFF9C]                               ; $5D74: $F0 $9C
    rst  $00                                      ; $5D76: $C7
    ld   a, l                                     ; $5D77: $7D
    ld   e, l                                     ; $5D78: $5D
    adc  a                                        ; $5D79: $8F
    ld   e, l                                     ; $5D7A: $5D
    xor  h                                        ; $5D7B: $AC
    ld   e, l                                     ; $5D7C: $5D
    ldh  a, [$FFB7]                               ; $5D7D: $F0 $B7
    and  a                                        ; $5D7F: $A7
    jr   nz, jr_019_5D8A                          ; $5D80: $20 $08

    ld   a, $01                                   ; $5D82: $3E $01
    ldh  [hFF9C], a                               ; $5D84: $E0 $9C
    ld   a, $25                                   ; $5D86: $3E $25
    ldh  [hJingle], a                             ; $5D88: $E0 $F2

jr_019_5D8A:
    ret                                           ; $5D8A: $C9

    nop                                           ; $5D8B: $00
    inc  bc                                       ; $5D8C: $03
    ld   bc, $F002                                ; $5D8D: $01 $02 $F0
    or   a                                        ; $5D90: $B7
    and  a                                        ; $5D91: $A7
    jr   nz, jr_019_5D99                          ; $5D92: $20 $05

    ld   a, $02                                   ; $5D94: $3E $02
    ldh  [hFF9C], a                               ; $5D96: $E0 $9C
    ret                                           ; $5D98: $C9

func_019_5D99:
jr_019_5D99:
    ldh  a, [hFrameCounter]                       ; $5D99: $F0 $E7
    rra                                           ; $5D9B: $1F
    rra                                           ; $5D9C: $1F
    and  $03                                      ; $5D9D: $E6 $03
    ld   e, a                                     ; $5D9F: $5F
    ld   d, $00                                   ; $5DA0: $16 $00
    ld   hl, $5D8B                                ; $5DA2: $21 $8B $5D
    add  hl, de                                   ; $5DA5: $19
    ld   a, [hl]                                  ; $5DA6: $7E
    ldh  [hLinkDirection], a                      ; $5DA7: $E0 $9E
    jp   $0BF0                                    ; $5DA9: $C3 $F0 $0B

    call func_019_5D99                            ; $5DAC: $CD $99 $5D
    ldh  a, [hLinkPositionZ]                      ; $5DAF: $F0 $A2
    add  $04                                      ; $5DB1: $C6 $04
    ldh  [hLinkPositionZ], a                      ; $5DB3: $E0 $A2
    cp   $78                                      ; $5DB5: $FE $78
    jr   c, jr_019_5DF7                           ; $5DB7: $38 $3E

    ld   [$DBC8], a                               ; $5DB9: $EA $C8 $DB
    ldh  a, [hMapRoom]                            ; $5DBC: $F0 $F6
    ld   e, a                                     ; $5DBE: $5F
    ld   d, $00                                   ; $5DBF: $16 $00

jr_019_5DC1:
    ld   hl, $5C6A                                ; $5DC1: $21 $6A $5C
    add  hl, de                                   ; $5DC4: $19
    ld   e, [hl]                                  ; $5DC5: $5E
    ld   hl, wOverworldRoomStatus                 ; $5DC6: $21 $00 $D8
    add  hl, de                                   ; $5DC9: $19
    ld   a, [hl]                                  ; $5DCA: $7E
    and  $80                                      ; $5DCB: $E6 $80
    jr   z, jr_019_5DC1                           ; $5DCD: $28 $F2

    ld   a, e                                     ; $5DCF: $7B
    ld   [wWarp0Room], a                          ; $5DD0: $EA $03 $D4
    xor  a                                        ; $5DD3: $AF
    ld   [wWarpStructs], a                        ; $5DD4: $EA $01 $D4
    ld   [wWarp0Map], a                           ; $5DD7: $EA $02 $D4
    ld   a, $70                                   ; $5DDA: $3E $70
    ld   [wWarp0DestinationY], a                  ; $5DDC: $EA $05 $D4
    ldh  [hLinkPositionY], a                      ; $5DDF: $E0 $99
    ld   a, $68                                   ; $5DE1: $3E $68
    ld   [wWarp0DestinationX], a                  ; $5DE3: $EA $04 $D4
    ldh  [hLinkPositionX], a                      ; $5DE6: $E0 $98
    ld   [$D475], a                               ; $5DE8: $EA $75 $D4
    ld   a, $66                                   ; $5DEB: $3E $66
    ld   [wWarp0PositionTileIndex], a             ; $5DED: $EA $16 $D4
    call label_C83                                ; $5DF0: $CD $83 $0C
    xor  a                                        ; $5DF3: $AF
    ld   [wC167], a                               ; $5DF4: $EA $67 $C1

jr_019_5DF7:
    ret                                           ; $5DF7: $C9

    ld   b, d                                     ; $5DF8: $42
    inc  hl                                       ; $5DF9: $23
    ld   b, b                                     ; $5DFA: $40
    inc  hl                                       ; $5DFB: $23
    ld   b, [hl]                                  ; $5DFC: $46
    inc  hl                                       ; $5DFD: $23
    ld   b, h                                     ; $5DFE: $44
    inc  hl                                       ; $5DFF: $23
    ld   b, b                                     ; $5E00: $40
    inc  bc                                       ; $5E01: $03
    ld   b, d                                     ; $5E02: $42
    inc  bc                                       ; $5E03: $03
    ld   b, h                                     ; $5E04: $44
    inc  bc                                       ; $5E05: $03
    ld   b, [hl]                                  ; $5E06: $46
    inc  bc                                       ; $5E07: $03
    ld   c, b                                     ; $5E08: $48

label_019_5E09:
    inc  bc                                       ; $5E09: $03
    ld   c, d                                     ; $5E0A: $4A
    inc  bc                                       ; $5E0B: $03
    ld   c, h                                     ; $5E0C: $4C
    inc  bc                                       ; $5E0D: $03
    ld   c, [hl]                                  ; $5E0E: $4E
    inc  bc                                       ; $5E0F: $03
    db   $10                                      ; $5E10: $10
    ld   de, $1312                                ; $5E11: $11 $12 $13
    inc  de                                       ; $5E14: $13
    ld   [de], a                                  ; $5E15: $12
    db   $11, $10                                 ; $5E16: $11 $10

; Friendly ghost following Link after Dungeon 4
GhostEntityHandler::
    db   $FA
    ld   a, c                                     ; $5E19: $79
    db   $DB                                      ; $5E1A: $DB
    cp   $01                                      ; $5E1B: $FE $01
    jp   nz, label_019_7E61                       ; $5E1D: $C2 $61 $7E

    ldh  a, [hMapRoom]                            ; $5E20: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $5E22: $21 $E0 $C3
    add  hl, bc                                   ; $5E25: $09
    ld   [hl], a                                  ; $5E26: $77
    ld   hl, wEntitiesPosXSignTable                                ; $5E27: $21 $20 $C2
    add  hl, bc                                   ; $5E2A: $09
    ld   [hl], b                                  ; $5E2B: $70
    ld   hl, wEntitiesPosYSignTable                                ; $5E2C: $21 $30 $C2
    add  hl, bc                                   ; $5E2F: $09
    ld   [hl], b                                  ; $5E30: $70
    ldh  a, [hFrameCounter]                       ; $5E31: $F0 $E7
    xor  c                                        ; $5E33: $A9
    and  $01                                      ; $5E34: $E6 $01
    jr   nz, jr_019_5E3E                          ; $5E36: $20 $06

    ld   de, $5DF8                                ; $5E38: $11 $F8 $5D
    call RenderAnimatedActiveEntity                               ; $5E3B: $CD $C0 $3B

jr_019_5E3E:
    ld   hl, wEntitiesUnknownTableC               ; $5E3E: $21 $C0 $C2
    add  hl, bc                                   ; $5E41: $09
    ld   a, [hl]                                  ; $5E42: $7E
    and  a                                        ; $5E43: $A7
    jr   nz, jr_019_5E5B                          ; $5E44: $20 $15

    ldh  a, [hFrameCounter]                       ; $5E46: $F0 $E7
    rra                                           ; $5E48: $1F
    rra                                           ; $5E49: $1F
    rra                                           ; $5E4A: $1F
    and  $07                                      ; $5E4B: $E6 $07
    ld   e, a                                     ; $5E4D: $5F
    ld   d, b                                     ; $5E4E: $50
    ld   hl, $5E10                                ; $5E4F: $21 $10 $5E
    add  hl, de                                   ; $5E52: $19
    ld   a, [hl]                                  ; $5E53: $7E
    sub  $04                                      ; $5E54: $D6 $04
    ld   hl, wEntitiesPosZTable                   ; $5E56: $21 $10 $C3
    add  hl, bc                                   ; $5E59: $09
    ld   [hl], a                                  ; $5E5A: $77

jr_019_5E5B:
    ldh  a, [hActiveEntityState]                  ; $5E5B: $F0 $F0
    and  a                                        ; $5E5D: $A7
    jr   nz, jr_019_5EAF                          ; $5E5E: $20 $4F

    call func_019_7E3A                            ; $5E60: $CD $3A $7E
    ld   a, e                                     ; $5E63: $7B
    cp   $02                                      ; $5E64: $FE $02
    ld   e, $04                                   ; $5E66: $1E $04
    jr   z, jr_019_5E6F                           ; $5E68: $28 $05

    call func_019_7E0B                            ; $5E6A: $CD $0B $7E
    sla  e                                        ; $5E6D: $CB $23

jr_019_5E6F:
    ldh  a, [hFrameCounter]                       ; $5E6F: $F0 $E7
    rra                                           ; $5E71: $1F
    rra                                           ; $5E72: $1F
    rra                                           ; $5E73: $1F
    rra                                           ; $5E74: $1F
    and  $01                                      ; $5E75: $E6 $01
    add  e                                        ; $5E77: $83
    call SetEntitySpriteVariant                   ; $5E78: $CD $0C $3B
    call func_019_7E0B                            ; $5E7B: $CD $0B $7E
    add  $18                                      ; $5E7E: $C6 $18
    cp   $30                                      ; $5E80: $FE $30
    jr   nc, jr_019_5E99                          ; $5E82: $30 $15

    ldh  a, [hLinkPositionY]                      ; $5E84: $F0 $99
    push af                                       ; $5E86: $F5
    add  $0C                                      ; $5E87: $C6 $0C
    ldh  [hLinkPositionY], a                      ; $5E89: $E0 $99
    call func_019_7E1B                            ; $5E8B: $CD $1B $7E
    ld   e, a                                     ; $5E8E: $5F
    pop  af                                       ; $5E8F: $F1
    ldh  [hLinkPositionY], a                      ; $5E90: $E0 $99
    ld   a, e                                     ; $5E92: $7B
    add  $18                                      ; $5E93: $C6 $18
    cp   $30                                      ; $5E95: $FE $30
    jr   c, jr_019_5EAF                           ; $5E97: $38 $16

jr_019_5E99:
    ldh  a, [hFrameCounter]                       ; $5E99: $F0 $E7
    and  $03                                      ; $5E9B: $E6 $03
    jr   nz, jr_019_5EAC                          ; $5E9D: $20 $0D

    ld   a, [wIsRunningWithPegasusBoots]          ; $5E9F: $FA $4A $C1
    and  a                                        ; $5EA2: $A7
    ld   a, $08                                   ; $5EA3: $3E $08
    jr   z, jr_019_5EA9                           ; $5EA5: $28 $02

    ld   a, $18                                   ; $5EA7: $3E $18

jr_019_5EA9:
    call ApplyVectorTowardsLink_trampoline        ; $5EA9: $CD $AA $3B

jr_019_5EAC:
    call func_019_7DB8                            ; $5EAC: $CD $B8 $7D

jr_019_5EAF:
    ld   a, [wIsIndoor]                           ; $5EAF: $FA $A5 $DB
    and  a                                        ; $5EB2: $A7
    jp   nz, label_019_5FBF                       ; $5EB3: $C2 $BF $5F

    ld   a, [wDB7A]                               ; $5EB6: $FA $7A $DB
    and  a                                        ; $5EB9: $A7
    jp   z, label_019_5F5F                        ; $5EBA: $CA $5F $5F

    ldh  a, [hMapRoom]                            ; $5EBD: $F0 $F6
    cp   $64                                      ; $5EBF: $FE $64
    jp   nz, label_019_5F84                       ; $5EC1: $C2 $84 $5F

    ldh  a, [hActiveEntityState]                  ; $5EC4: $F0 $F0
    rst  $00                                      ; $5EC6: $C7
    call $E05E                                    ; $5EC7: $CD $5E $E0
    ld   e, [hl]                                  ; $5ECA: $5E
    inc  a                                        ; $5ECB: $3C
    ld   e, a                                     ; $5ECC: $5F
    call func_019_7D3D                            ; $5ECD: $CD $3D $7D
    ldh  a, [hLinkPositionX]                      ; $5ED0: $F0 $98
    cp   $3C                                      ; $5ED2: $FE $3C
    ret  nc                                       ; $5ED4: $D0

    ldh  a, [hLinkPositionY]                      ; $5ED5: $F0 $99
    cp   $7A                                      ; $5ED7: $FE $7A
    ret  nc                                       ; $5ED9: $D0

    ld   [wC167], a                               ; $5EDA: $EA $67 $C1
    jp   IncrementEntityState                     ; $5EDD: $C3 $12 $3B

    ld   a, $02                                   ; $5EE0: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5EE2: $E0 $A1
    ldh  a, [hLinkPositionY]                      ; $5EE4: $F0 $99
    push af                                       ; $5EE6: $F5
    ldh  a, [hLinkPositionX]                      ; $5EE7: $F0 $98
    push af                                       ; $5EE9: $F5
    ld   hl, wEntitiesPosZTable                   ; $5EEA: $21 $10 $C3
    add  hl, bc                                   ; $5EED: $09
    ld   a, $60                                   ; $5EEE: $3E $60
    sub  [hl]                                     ; $5EF0: $96
    ldh  [hLinkPositionY], a                      ; $5EF1: $E0 $99
    ld   a, $28                                   ; $5EF3: $3E $28
    ldh  [hLinkPositionX], a                      ; $5EF5: $E0 $98
    ld   a, $08                                   ; $5EF7: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $5EF9: $CD $AA $3B
    call func_019_7E0B                            ; $5EFC: $CD $0B $7E
    push af                                       ; $5EFF: $F5
    ld   a, e                                     ; $5F00: $7B
    sla  a                                        ; $5F01: $CB $27
    ld   hl, wEntitiesDirectionTable              ; $5F03: $21 $80 $C3
    add  hl, bc                                   ; $5F06: $09
    ld   [hl], a                                  ; $5F07: $77
    pop  af                                       ; $5F08: $F1
    add  $03                                      ; $5F09: $C6 $03
    cp   $06                                      ; $5F0B: $FE $06
    jr   nc, jr_019_5F30                          ; $5F0D: $30 $21

    call func_019_7E1B                            ; $5F0F: $CD $1B $7E
    add  $0C                                      ; $5F12: $C6 $0C
    cp   $18                                      ; $5F14: $FE $18
    jr   nc, jr_019_5F30                          ; $5F16: $30 $18

    pop  af                                       ; $5F18: $F1
    ldh  [hLinkPositionX], a                      ; $5F19: $E0 $98
    pop  af                                       ; $5F1B: $F1
    ldh  [hLinkPositionY], a                      ; $5F1C: $E0 $99
    call_open_dialog $216                         ; $5F1E
    ld   a, $2D                                   ; $5F23: $3E $2D
    ldh  [hJingle], a                             ; $5F25: $E0 $F2
    call IncrementEntityState                     ; $5F27: $CD $12 $3B
    ld   hl, wEntitiesUnknownTableC               ; $5F2A: $21 $C0 $C2
    add  hl, bc                                   ; $5F2D: $09
    inc  [hl]                                     ; $5F2E: $34
    ret                                           ; $5F2F: $C9

jr_019_5F30:
    pop  af                                       ; $5F30: $F1
    ldh  [hLinkPositionX], a                      ; $5F31: $E0 $98
    pop  af                                       ; $5F33: $F1
    ldh  [hLinkPositionY], a                      ; $5F34: $E0 $99
    call func_019_7DB8                            ; $5F36: $CD $B8 $7D
    jp   label_019_6053                           ; $5F39: $C3 $53 $60

    ld   a, $02                                   ; $5F3C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5F3E: $E0 $A1
    call func_019_7D3D                            ; $5F40: $CD $3D $7D
    ld   hl, wEntitiesPosZTable                   ; $5F43: $21 $10 $C3
    add  hl, bc                                   ; $5F46: $09
    dec  [hl]                                     ; $5F47: $35
    jr   nz, jr_019_5F5C                          ; $5F48: $20 $12

    xor  a                                        ; $5F4A: $AF
    ld   [wIsGhostFollowingLink], a               ; $5F4B: $EA $79 $DB
    ld   [wDB7A], a                               ; $5F4E: $EA $7A $DB
    ld   [wC167], a                               ; $5F51: $EA $67 $C1
    ld   hl, $D9E3                                ; $5F54: $21 $E3 $D9
    set  6, [hl]                                  ; $5F57: $CB $F6
    jp   label_019_7E61                           ; $5F59: $C3 $61 $7E

jr_019_5F5C:
    jp   label_019_6053                           ; $5F5C: $C3 $53 $60

label_019_5F5F:
    call func_019_7D3D                            ; $5F5F: $CD $3D $7D
    ld   hl, wEntitiesUnknownTableD               ; $5F62: $21 $D0 $C2
    add  hl, bc                                   ; $5F65: $09
    ld   a, [hl]                                  ; $5F66: $7E
    and  a                                        ; $5F67: $A7
    ret  nz                                       ; $5F68: $C0

    ldh  a, [hMapRoom]                            ; $5F69: $F0 $F6
    cp   $F6                                      ; $5F6B: $FE $F6
    jp   nz, label_019_5F84                       ; $5F6D: $C2 $84 $5F

    ldh  a, [hLinkPositionY]                      ; $5F70: $F0 $99
    cp   $40                                      ; $5F72: $FE $40
    ret  c                                        ; $5F74: $D8

    ldh  a, [hLinkPositionX]                      ; $5F75: $F0 $98
    cp   $78                                      ; $5F77: $FE $78
    ret  nc                                       ; $5F79: $D0

    inc  [hl]                                     ; $5F7A: $34
    ld   a, $2D                                   ; $5F7B: $3E $2D
    ldh  [hJingle], a                             ; $5F7D: $E0 $F2
    jp_open_dialog $213                           ; $5F7F

label_019_5F84:
    call func_019_7D3D                            ; $5F84: $CD $3D $7D
    ld   hl, wEntitiesUnknownTableD               ; $5F87: $21 $D0 $C2
    add  hl, bc                                   ; $5F8A: $09
    ld   a, [hl]                                  ; $5F8B: $7E
    and  a                                        ; $5F8C: $A7
    ret  nz                                       ; $5F8D: $C0

    ld   a, [wTransitionSequenceCounter]          ; $5F8E: $FA $6B $C1
    cp   $04                                      ; $5F91: $FE $04
    ret  nz                                       ; $5F93: $C0

    ldh  a, [hFrameCounter]                       ; $5F94: $F0 $E7
    and  $01                                      ; $5F96: $E6 $01
    ret  nz                                       ; $5F98: $C0

    ld   hl, wEntitiesUnknowTableP                ; $5F99: $21 $40 $C4
    add  hl, bc                                   ; $5F9C: $09
    dec  [hl]                                     ; $5F9D: $35
    ret  nz                                       ; $5F9E: $C0

    call GetRandomByte                            ; $5F9F: $CD $0D $28
    and  $03                                      ; $5FA2: $E6 $03
    ld   hl, $C3C8                                ; $5FA4: $21 $C8 $C3
    or   [hl]                                     ; $5FA7: $B6
    ret  nz                                       ; $5FA8: $C0

    ld   hl, wEntitiesUnknownTableD               ; $5FA9: $21 $D0 $C2
    add  hl, bc                                   ; $5FAC: $09
    inc  [hl]                                     ; $5FAD: $34
    ld   a, $2D                                   ; $5FAE: $3E $2D
    ldh  [hJingle], a                             ; $5FB0: $E0 $F2
    ld   a, [wDB7A]                               ; $5FB2: $FA $7A $DB
    and  a                                        ; $5FB5: $A7
    ld   a, $11                                   ; $5FB6: $3E $11
    jr   z, jr_019_5FBC                           ; $5FB8: $28 $02

    ld   a, $10                                   ; $5FBA: $3E $10

jr_019_5FBC:
    jp   OpenDialogInTable2                       ; $5FBC: $C3 $7C $23

label_019_5FBF:
    call func_019_7D3D                            ; $5FBF: $CD $3D $7D
    ldh  a, [hMapId]                              ; $5FC2: $F0 $F7
    cp   $1E                                      ; $5FC4: $FE $1E
    ret  nz                                       ; $5FC6: $C0

    ldh  a, [hMapRoom]                            ; $5FC7: $F0 $F6
    cp   $E3                                      ; $5FC9: $FE $E3
    ret  nz                                       ; $5FCB: $C0

    ldh  a, [hRoomStatus]                         ; $5FCC: $F0 $F8
    and  $20                                      ; $5FCE: $E6 $20
    ret  nz                                       ; $5FD0: $C0

    ld   a, $02                                   ; $5FD1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FD3: $E0 $A1
    ld   [wC167], a                               ; $5FD5: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $5FD8: $F0 $F0
    rst  $00                                      ; $5FDA: $C7
    rst  $20                                      ; $5FDB: $E7
    ld   e, a                                     ; $5FDC: $5F
    rst  $38                                      ; $5FDD: $FF
    ld   e, a                                     ; $5FDE: $5F
    scf                                           ; $5FDF: $37
    ld   h, b                                     ; $5FE0: $60
    ld   h, h                                     ; $5FE1: $64
    ld   h, b                                     ; $5FE2: $60
    add  b                                        ; $5FE3: $80
    ld   h, b                                     ; $5FE4: $60
    and  l                                        ; $5FE5: $A5
    ld   h, b                                     ; $5FE6: $60
    call GetEntityTransitionCountdown             ; $5FE7: $CD $05 $0C
    ld   [hl], $40                                ; $5FEA: $36 $40
    jp   IncrementEntityState                     ; $5FEC: $C3 $12 $3B

    ld   h, b                                     ; $5FEF: $60
    jr   z, @+$2A                                 ; $5FF0: $28 $28

    ld   l, b                                     ; $5FF2: $68
    nop                                           ; $5FF3: $00
    ld   hl, sp-$04                               ; $5FF4: $F8 $FC
    ld   [$FCF8], sp                              ; $5FF6: $08 $F8 $FC
    ld   hl, sp+$02                               ; $5FF9: $F8 $02
    inc  b                                        ; $5FFB: $04
    ld   [bc], a                                  ; $5FFC: $02
    inc  b                                        ; $5FFD: $04
    nop                                           ; $5FFE: $00
    call GetEntityTransitionCountdown             ; $5FFF: $CD $05 $0C
    jr   nz, jr_019_6035                          ; $6002: $20 $31

    ld   hl, wEntitiesUnknowTableY                ; $6004: $21 $D0 $C3
    add  hl, bc                                   ; $6007: $09
    ld   e, [hl]                                  ; $6008: $5E
    ld   d, b                                     ; $6009: $50
    ld   hl, $5FEF                                ; $600A: $21 $EF $5F
    add  hl, de                                   ; $600D: $19
    ld   a, [hl]                                  ; $600E: $7E
    ld   hl, wEntitiesTransitionCountdownTable    ; $600F: $21 $E0 $C2
    add  hl, bc                                   ; $6012: $09
    ld   [hl], a                                  ; $6013: $77
    ld   hl, $5FF3                                ; $6014: $21 $F3 $5F
    add  hl, de                                   ; $6017: $19
    ld   a, [hl]                                  ; $6018: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $6019: $21 $40 $C2
    add  hl, bc                                   ; $601C: $09
    ld   [hl], a                                  ; $601D: $77
    ld   hl, $5FF7                                ; $601E: $21 $F7 $5F
    add  hl, de                                   ; $6021: $19
    ld   a, [hl]                                  ; $6022: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $6023: $21 $50 $C2
    add  hl, bc                                   ; $6026: $09
    ld   [hl], a                                  ; $6027: $77
    ld   hl, $5FFB                                ; $6028: $21 $FB $5F
    add  hl, de                                   ; $602B: $19
    ld   a, [hl]                                  ; $602C: $7E
    ld   hl, wEntitiesDirectionTable              ; $602D: $21 $80 $C3
    add  hl, bc                                   ; $6030: $09
    ld   [hl], a                                  ; $6031: $77
    call IncrementEntityState                     ; $6032: $CD $12 $3B

jr_019_6035:
    jr   jr_019_6053                              ; $6035: $18 $1C

    call GetEntityTransitionCountdown             ; $6037: $CD $05 $0C
    jr   nz, jr_019_6050                          ; $603A: $20 $14

    ld   [hl], $50                                ; $603C: $36 $50
    call IncrementEntityState                     ; $603E: $CD $12 $3B
    ld   hl, wEntitiesUnknowTableY                ; $6041: $21 $D0 $C3
    add  hl, bc                                   ; $6044: $09
    ld   a, [hl]                                  ; $6045: $7E
    inc  a                                        ; $6046: $3C
    ld   [hl], a                                  ; $6047: $77
    cp   $04                                      ; $6048: $FE $04
    jr   z, jr_019_6050                           ; $604A: $28 $04

    call IncrementEntityState                     ; $604C: $CD $12 $3B
    ld   [hl], b                                  ; $604F: $70

jr_019_6050:
    call func_019_7DB8                            ; $6050: $CD $B8 $7D

label_019_6053:
jr_019_6053:
    ld   hl, wEntitiesDirectionTable              ; $6053: $21 $80 $C3
    add  hl, bc                                   ; $6056: $09
    ld   e, [hl]                                  ; $6057: $5E
    ldh  a, [hFrameCounter]                       ; $6058: $F0 $E7
    rra                                           ; $605A: $1F
    rra                                           ; $605B: $1F
    rra                                           ; $605C: $1F
    rra                                           ; $605D: $1F
    and  $01                                      ; $605E: $E6 $01
    add  e                                        ; $6060: $83
    jp   SetEntitySpriteVariant                   ; $6061: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6064: $CD $05 $0C
    jr   nz, jr_019_607D                          ; $6067: $20 $14

    ld   [hl], $50                                ; $6069: $36 $50
    ldh  a, [hLinkPositionY]                      ; $606B: $F0 $99
    push af                                       ; $606D: $F5
    ld   a, $10                                   ; $606E: $3E $10
    ldh  [hLinkPositionY], a                      ; $6070: $E0 $99
    call_open_dialog $214                         ; $6072
    pop  af                                       ; $6077: $F1
    ldh  [hLinkPositionY], a                      ; $6078: $E0 $99
    call IncrementEntityState                     ; $607A: $CD $12 $3B

jr_019_607D:
    jp   label_019_6053                           ; $607D: $C3 $53 $60

    call GetEntityTransitionCountdown             ; $6080: $CD $05 $0C
    jr   nz, jr_019_608D                          ; $6083: $20 $08

    call_open_dialog $215                         ; $6085
    call IncrementEntityState                     ; $608A: $CD $12 $3B

jr_019_608D:
    ld   hl, wEntitiesSpeedYTable                       ; $608D: $21 $50 $C2
    add  hl, bc                                   ; $6090: $09
    ld   [hl], $0A                                ; $6091: $36 $0A
    ld   hl, wEntitiesSpeedXTable                       ; $6093: $21 $40 $C2
    add  hl, bc                                   ; $6096: $09
    ld   [hl], $FC                                ; $6097: $36 $FC
    ld   hl, wEntitiesDirectionTable              ; $6099: $21 $80 $C3
    add  hl, bc                                   ; $609C: $09
    ld   [hl], $02                                ; $609D: $36 $02
    call func_019_7DB8                            ; $609F: $CD $B8 $7D
    jp   label_019_6053                           ; $60A2: $C3 $53 $60

    ld   a, $01                                   ; $60A5: $3E $01
    ld   [wDB7A], a                               ; $60A7: $EA $7A $DB
    call func_019_7F0E                            ; $60AA: $CD $0E $7F
    call func_019_7E61                            ; $60AD: $CD $61 $7E
    jp   ApplyMapFadeOutTransition                ; $60B0: $C3 $7D $0C

    nop                                           ; $60B3: $00
    sbc  b                                        ; $60B4: $98
    ld   b, $89                                   ; $60B5: $06 $89
    nop                                           ; $60B7: $00
    inc  b                                        ; $60B8: $04
    nop                                           ; $60B9: $00
    inc  b                                        ; $60BA: $04
    nop                                           ; $60BB: $00
    inc  b                                        ; $60BC: $04
    nop                                           ; $60BD: $00
    inc  b                                        ; $60BE: $04
    nop                                           ; $60BF: $00
    db   $10                                      ; $60C0: $10
    sbc  b                                        ; $60C1: $98
    rlca                                          ; $60C2: $07
    adc  c                                        ; $60C3: $89
    ld   bc, $0111                                ; $60C4: $01 $11 $01
    ld   de, $1101                                ; $60C7: $11 $01 $11
    ld   bc, $0111                                ; $60CA: $01 $11 $01
    ld   de, $0898                                ; $60CD: $11 $98 $08
    adc  c                                        ; $60D0: $89
    rlca                                          ; $60D1: $07
    ld   b, $07                                   ; $60D2: $06 $07
    ld   b, $07                                   ; $60D4: $06 $07
    ld   b, $07                                   ; $60D6: $06 $07
    ld   b, $07                                   ; $60D8: $06 $07
    ld   b, $98                                   ; $60DA: $06 $98
    ld   [$0789], sp                              ; $60DC: $08 $89 $07
    ld   b, $07                                   ; $60DF: $06 $07
    ld   b, $07                                   ; $60E1: $06 $07
    ld   b, $07                                   ; $60E3: $06 $07
    ld   b, $07                                   ; $60E5: $06 $07
    ld   b, $98                                   ; $60E7: $06 $98
    add  hl, bc                                   ; $60E9: $09
    adc  c                                        ; $60EA: $89
    ld   b, $07                                   ; $60EB: $06 $07
    ld   b, $07                                   ; $60ED: $06 $07
    ld   b, $07                                   ; $60EF: $06 $07
    ld   b, $07                                   ; $60F1: $06 $07
    ld   b, $07                                   ; $60F3: $06 $07
    sbc  b                                        ; $60F5: $98
    ld   a, [bc]                                  ; $60F6: $0A
    adc  c                                        ; $60F7: $89
    rlca                                          ; $60F8: $07
    ld   b, $07                                   ; $60F9: $06 $07
    ld   b, $07                                   ; $60FB: $06 $07
    ld   b, $07                                   ; $60FD: $06 $07
    ld   b, $07                                   ; $60FF: $06 $07
    ld   b, $98                                   ; $6101: $06 $98
    dec  bc                                       ; $6103: $0B
    adc  c                                        ; $6104: $89
    ld   b, $07                                   ; $6105: $06 $07
    ld   b, $07                                   ; $6107: $06 $07
    ld   b, $07                                   ; $6109: $06 $07
    ld   b, $07                                   ; $610B: $06 $07
    ld   b, $07                                   ; $610D: $06 $07
    sbc  b                                        ; $610F: $98
    dec  bc                                       ; $6110: $0B
    adc  c                                        ; $6111: $89
    ld   b, $07                                   ; $6112: $06 $07
    ld   b, $07                                   ; $6114: $06 $07
    ld   b, $07                                   ; $6116: $06 $07
    ld   b, $07                                   ; $6118: $06 $07
    ld   b, $07                                   ; $611A: $06 $07
    sbc  b                                        ; $611C: $98
    inc  c                                        ; $611D: $0C
    adc  c                                        ; $611E: $89
    rlca                                          ; $611F: $07
    ld   b, $07                                   ; $6120: $06 $07
    ld   b, $07                                   ; $6122: $06 $07
    ld   b, $07                                   ; $6124: $06 $07
    ld   b, $07                                   ; $6126: $06 $07
    ld   b, $98                                   ; $6128: $06 $98
    dec  c                                        ; $612A: $0D
    adc  c                                        ; $612B: $89
    ld   b, $07                                   ; $612C: $06 $07
    ld   b, $07                                   ; $612E: $06 $07
    ld   b, $07                                   ; $6130: $06 $07
    ld   b, $07                                   ; $6132: $06 $07
    ld   b, $07                                   ; $6134: $06 $07
    sbc  b                                        ; $6136: $98
    ld   c, $89                                   ; $6137: $0E $89
    ld   [bc], a                                  ; $6139: $02
    ld   [de], a                                  ; $613A: $12
    ld   [bc], a                                  ; $613B: $02
    ld   [de], a                                  ; $613C: $12
    ld   [bc], a                                  ; $613D: $02
    ld   [de], a                                  ; $613E: $12
    ld   [bc], a                                  ; $613F: $02
    ld   [de], a                                  ; $6140: $12
    ld   [bc], a                                  ; $6141: $02
    ld   [de], a                                  ; $6142: $12
    sbc  b                                        ; $6143: $98
    rrca                                          ; $6144: $0F
    adc  c                                        ; $6145: $89
    inc  bc                                       ; $6146: $03
    dec  b                                        ; $6147: $05
    inc  bc                                       ; $6148: $03
    dec  b                                        ; $6149: $05
    inc  bc                                       ; $614A: $03
    dec  b                                        ; $614B: $05
    inc  bc                                       ; $614C: $03
    dec  b                                        ; $614D: $05
    inc  bc                                       ; $614E: $03
    inc  de                                       ; $614F: $13
    sbc  b                                        ; $6150: $98
    ld   b, $89                                   ; $6151: $06 $89
    inc  b                                        ; $6153: $04
    nop                                           ; $6154: $00
    inc  b                                        ; $6155: $04
    nop                                           ; $6156: $00
    inc  b                                        ; $6157: $04
    nop                                           ; $6158: $00
    inc  b                                        ; $6159: $04
    nop                                           ; $615A: $00
    inc  b                                        ; $615B: $04
    inc  d                                        ; $615C: $14
    sbc  b                                        ; $615D: $98
    rlca                                          ; $615E: $07
    adc  c                                        ; $615F: $89
    ld   de, $1101                                ; $6160: $11 $01 $11
    ld   bc, $0111                                ; $6163: $01 $11 $01
    ld   de, $1101                                ; $6166: $11 $01 $11
    ld   bc, $0898                                ; $6169: $01 $98 $08
    adc  c                                        ; $616C: $89
    ld   b, $07                                   ; $616D: $06 $07
    ld   b, $07                                   ; $616F: $06 $07
    ld   b, $07                                   ; $6171: $06 $07
    ld   b, $07                                   ; $6173: $06 $07
    ld   b, $07                                   ; $6175: $06 $07
    sbc  b                                        ; $6177: $98
    ld   [$0689], sp                              ; $6178: $08 $89 $06
    rlca                                          ; $617B: $07
    ld   b, $07                                   ; $617C: $06 $07
    ld   b, $07                                   ; $617E: $06 $07
    ld   b, $07                                   ; $6180: $06 $07
    ld   b, $07                                   ; $6182: $06 $07
    sbc  b                                        ; $6184: $98
    add  hl, bc                                   ; $6185: $09
    adc  c                                        ; $6186: $89
    rlca                                          ; $6187: $07
    ld   b, $07                                   ; $6188: $06 $07
    ld   b, $07                                   ; $618A: $06 $07
    ld   b, $07                                   ; $618C: $06 $07
    ld   b, $07                                   ; $618E: $06 $07
    ld   b, $98                                   ; $6190: $06 $98
    ld   a, [bc]                                  ; $6192: $0A
    adc  c                                        ; $6193: $89
    ld   b, $07                                   ; $6194: $06 $07
    ld   b, $07                                   ; $6196: $06 $07
    ld   b, $07                                   ; $6198: $06 $07
    ld   b, $07                                   ; $619A: $06 $07
    ld   b, $07                                   ; $619C: $06 $07
    sbc  b                                        ; $619E: $98
    dec  bc                                       ; $619F: $0B
    adc  c                                        ; $61A0: $89
    rlca                                          ; $61A1: $07
    ld   b, $07                                   ; $61A2: $06 $07
    ld   b, $07                                   ; $61A4: $06 $07
    ld   b, $07                                   ; $61A6: $06 $07
    ld   b, $07                                   ; $61A8: $06 $07
    ld   b, $98                                   ; $61AA: $06 $98
    dec  bc                                       ; $61AC: $0B
    adc  c                                        ; $61AD: $89
    rlca                                          ; $61AE: $07
    ld   b, $07                                   ; $61AF: $06 $07
    ld   b, $07                                   ; $61B1: $06 $07
    ld   b, $07                                   ; $61B3: $06 $07
    ld   b, $07                                   ; $61B5: $06 $07
    ld   b, $98                                   ; $61B7: $06 $98
    inc  c                                        ; $61B9: $0C
    adc  c                                        ; $61BA: $89
    ld   b, $07                                   ; $61BB: $06 $07
    ld   b, $07                                   ; $61BD: $06 $07
    ld   b, $07                                   ; $61BF: $06 $07
    ld   b, $07                                   ; $61C1: $06 $07
    ld   b, $07                                   ; $61C3: $06 $07
    sbc  b                                        ; $61C5: $98
    dec  c                                        ; $61C6: $0D
    adc  c                                        ; $61C7: $89
    rlca                                          ; $61C8: $07
    ld   b, $07                                   ; $61C9: $06 $07
    ld   b, $07                                   ; $61CB: $06 $07
    ld   b, $07                                   ; $61CD: $06 $07
    ld   b, $07                                   ; $61CF: $06 $07
    ld   b, $98                                   ; $61D1: $06 $98
    ld   c, $89                                   ; $61D3: $0E $89
    ld   [de], a                                  ; $61D5: $12
    ld   [bc], a                                  ; $61D6: $02
    ld   [de], a                                  ; $61D7: $12
    ld   [bc], a                                  ; $61D8: $02
    ld   [de], a                                  ; $61D9: $12
    ld   [bc], a                                  ; $61DA: $02
    ld   [de], a                                  ; $61DB: $12
    ld   [bc], a                                  ; $61DC: $02
    ld   [de], a                                  ; $61DD: $12
    ld   [bc], a                                  ; $61DE: $02
    sbc  b                                        ; $61DF: $98
    rrca                                          ; $61E0: $0F
    adc  c                                        ; $61E1: $89
    dec  b                                        ; $61E2: $05
    inc  bc                                       ; $61E3: $03
    dec  b                                        ; $61E4: $05
    inc  bc                                       ; $61E5: $03
    dec  b                                        ; $61E6: $05
    inc  bc                                       ; $61E7: $03
    dec  b                                        ; $61E8: $05
    inc  bc                                       ; $61E9: $03
    dec  b                                        ; $61EA: $05
    dec  d                                        ; $61EB: $15
    ld   d, b                                     ; $61EC: $50
    ld   h, c                                     ; $61ED: $61
    or   h                                        ; $61EE: $B4
    ld   h, b                                     ; $61EF: $60
    add  h                                        ; $61F0: $84
    ld   h, c                                     ; $61F1: $61
    add  sp, $60                                  ; $61F2: $E8 $60
    cp   b                                        ; $61F4: $B8
    ld   h, c                                     ; $61F5: $61
    inc  e                                        ; $61F6: $1C
    ld   h, c                                     ; $61F7: $61

label_019_61F8:
    ld   a, $02                                   ; $61F8: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $61FA: $E0 $A1
    ld   [wC167], a                               ; $61FC: $EA $67 $C1
    call $650F                                    ; $61FF: $CD $0F $65
    ldh  a, [hActiveEntityState]                  ; $6202: $F0 $F0
    rst  $00                                      ; $6204: $C7
    inc  de                                       ; $6205: $13
    ld   h, d                                     ; $6206: $62
    ld   e, $62                                   ; $6207: $1E $62
    ld   d, d                                     ; $6209: $52
    ld   h, d                                     ; $620A: $62
    ld   e, d                                     ; $620B: $5A
    ld   h, d                                     ; $620C: $62
    ld   e, a                                     ; $620D: $5F
    ld   h, d                                     ; $620E: $62
    sub  e                                        ; $620F: $93
    ld   h, d                                     ; $6210: $62
    cp   d                                        ; $6211: $BA
    ld   h, d                                     ; $6212: $62
    call label_27F2                               ; $6213: $CD $F2 $27
    call GetEntityTransitionCountdown             ; $6216: $CD $05 $0C
    ld   [hl], $FF                                ; $6219: $36 $FF
    call IncrementEntityState                     ; $621B: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $621E: $CD $05 $0C
    jr   nz, jr_019_6230                          ; $6221: $20 $0D

    ld   [wScreenShakeHorizontal], a              ; $6223: $EA $55 $C1
    call SetEntitySpriteVariant                   ; $6226: $CD $0C $3B
    ld   a, $2E                                   ; $6229: $3E $2E
    ldh  [hJingle], a                             ; $622B: $E0 $F2
    jp   IncrementEntityState                     ; $622D: $C3 $12 $3B

jr_019_6230:
    cp   $A0                                      ; $6230: $FE $A0
    jr   nz, jr_019_6238                          ; $6232: $20 $04

    ld   a, $1D                                   ; $6234: $3E $1D
    ldh  [hNoiseSfx], a                           ; $6236: $E0 $F4

jr_019_6238:
    jr   c, jr_019_6245                           ; $6238: $38 $0B

    and  $10                                      ; $623A: $E6 $10
    ld   a, $00                                   ; $623C: $3E $00
    jr   z, jr_019_6242                           ; $623E: $28 $02

    ld   a, $FF                                   ; $6240: $3E $FF

jr_019_6242:
    jp   SetEntitySpriteVariant                   ; $6242: $C3 $0C $3B

jr_019_6245:
    ld   e, $01                                   ; $6245: $1E $01
    and  $04                                      ; $6247: $E6 $04
    jr   z, jr_019_624D                           ; $6249: $28 $02

    ld   e, $FE                                   ; $624B: $1E $FE

jr_019_624D:
    ld   a, e                                     ; $624D: $7B
    ld   [wScreenShakeHorizontal], a              ; $624E: $EA $55 $C1
    ret                                           ; $6251: $C9

    call GetEntityTransitionCountdown             ; $6252: $CD $05 $0C
    and  a                                        ; $6255: $A7
    ret  nz                                       ; $6256: $C0

    jp   IncrementEntityState                     ; $6257: $C3 $12 $3B

    ld   hl, $61EC                                ; $625A: $21 $EC $61
    jr   jr_019_6262                              ; $625D: $18 $03

    ld   hl, $61F0                                ; $625F: $21 $F0 $61

func_019_6262:
jr_019_6262:
    push bc                                       ; $6262: $C5
    push hl                                       ; $6263: $E5
    ld   hl, wEntitiesSubstate1Table              ; $6264: $21 $B0 $C2
    add  hl, bc                                   ; $6267: $09
    ld   a, [hl]                                  ; $6268: $7E
    rla                                           ; $6269: $17
    and  $02                                      ; $626A: $E6 $02
    ld   e, a                                     ; $626C: $5F
    ld   d, b                                     ; $626D: $50
    pop  hl                                       ; $626E: $E1
    add  hl, de                                   ; $626F: $19
    ld   a, [hl+]                                 ; $6270: $2A
    ld   d, [hl]                                  ; $6271: $56
    ld   e, a                                     ; $6272: $5F
    ld   c, $34                                   ; $6273: $0E $34
    ld   hl, wRequestDestinationHigh              ; $6275: $21 $01 $D6

jr_019_6278:
    dec  de                                       ; $6278: $1B
    ld   a, [de]                                  ; $6279: $1A
    inc  de                                       ; $627A: $13
    cp   $98                                      ; $627B: $FE $98
    ld   a, [de]                                  ; $627D: $1A
    jr   nz, jr_019_6288                          ; $627E: $20 $08

    ldh  a, [hBaseScrollX]                        ; $6280: $F0 $96
    and  a                                        ; $6282: $A7
    ld   a, [de]                                  ; $6283: $1A
    jr   z, jr_019_6288                           ; $6284: $28 $02

    add  $0C                                      ; $6286: $C6 $0C

jr_019_6288:
    inc  de                                       ; $6288: $13
    ld   [hl+], a                                 ; $6289: $22
    dec  c                                        ; $628A: $0D
    jr   nz, jr_019_6278                          ; $628B: $20 $EB

    ld   [hl], $00                                ; $628D: $36 $00
    pop  bc                                       ; $628F: $C1
    jp   IncrementEntityState                     ; $6290: $C3 $12 $3B

    ld   hl, $61F4                                ; $6293: $21 $F4 $61
    call func_019_6262                            ; $6296: $CD $62 $62
    call GetEntityTransitionCountdown             ; $6299: $CD $05 $0C
    ld   [hl], $18                                ; $629C: $36 $18
    ld   hl, wEntitiesSubstate1Table              ; $629E: $21 $B0 $C2
    add  hl, bc                                   ; $62A1: $09
    inc  [hl]                                     ; $62A2: $34
    ld   hl, wEntitiesUnknowTableY                ; $62A3: $21 $D0 $C3
    add  hl, bc                                   ; $62A6: $09
    ld   a, [hl]                                  ; $62A7: $7E
    inc  a                                        ; $62A8: $3C
    ld   [hl], a                                  ; $62A9: $77
    cp   $0C                                      ; $62AA: $FE $0C
    jr   nz, jr_019_62B4                          ; $62AC: $20 $06

    ldh  a, [hNextWorldMusicTrack]                ; $62AE: $F0 $BF
    ld   [wActiveMusicTrack], a                   ; $62B0: $EA $68 $D3
    ret                                           ; $62B3: $C9

jr_019_62B4:
    call IncrementEntityState                     ; $62B4: $CD $12 $3B
    ld   [hl], $02                                ; $62B7: $36 $02
    ret                                           ; $62B9: $C9

    call func_019_7F0E                            ; $62BA: $CD $0E $7F
    set  4, [hl]                                  ; $62BD: $CB $E6
    xor  a                                        ; $62BF: $AF
    ld   [wScreenShakeHorizontal], a              ; $62C0: $EA $55 $C1
    ld   [wC167], a                               ; $62C3: $EA $67 $C1
    ld   a, $02                                   ; $62C6: $3E $02
    ldh  [hJingle], a                             ; $62C8: $E0 $F2
    ld   hl, $D736                                ; $62CA: $21 $36 $D7
    ld   a, $E1                                   ; $62CD: $3E $E1
    ld   [hl], a                                  ; $62CF: $77
    ld   a, $99                                   ; $62D0: $3E $99
    call label_B2F                                ; $62D2: $CD $2F $0B
    ld   hl, $D746                                ; $62D5: $21 $46 $D7
    ld   a, $77                                   ; $62D8: $3E $77
    ld   [hl], a                                  ; $62DA: $77
    ld   a, $99                                   ; $62DB: $3E $99
    call label_B2F                                ; $62DD: $CD $2F $0B
    ld   hl, $D756                                ; $62E0: $21 $56 $D7
    ld   a, $77                                   ; $62E3: $3E $77
    ld   [hl], a                                  ; $62E5: $77
    ld   a, $99                                   ; $62E6: $3E $99
    call label_B2F                                ; $62E8: $CD $2F $0B
    call func_019_6374                            ; $62EB: $CD $74 $63
    call $63B5                                    ; $62EE: $CD $B5 $63
    jp   label_019_7E61                           ; $62F1: $C3 $61 $7E

    sbc  b                                        ; $62F4: $98
    ld   c, d                                     ; $62F5: $4A
    add  a                                        ; $62F6: $87
    inc  c                                        ; $62F7: $0C
    inc  e                                        ; $62F8: $1C
    ld   h, h                                     ; $62F9: $64
    ld   h, [hl]                                  ; $62FA: $66
    rrca                                          ; $62FB: $0F
    rrca                                          ; $62FC: $0F
    rrca                                          ; $62FD: $0F
    rrca                                          ; $62FE: $0F
    sbc  b                                        ; $62FF: $98
    ld   c, e                                     ; $6300: $4B
    add  a                                        ; $6301: $87
    dec  c                                        ; $6302: $0D
    dec  e                                        ; $6303: $1D
    ld   h, l                                     ; $6304: $65
    ld   h, a                                     ; $6305: $67
    rra                                           ; $6306: $1F
    rra                                           ; $6307: $1F
    rra                                           ; $6308: $1F
    rra                                           ; $6309: $1F
    sbc  b                                        ; $630A: $98
    ld   c, c                                     ; $630B: $49
    add  c                                        ; $630C: $81
    dec  bc                                       ; $630D: $0B
    dec  de                                       ; $630E: $1B
    sbc  b                                        ; $630F: $98
    ld   c, h                                     ; $6310: $4C
    add  c                                        ; $6311: $81
    ld   c, $1E                                   ; $6312: $0E $1E
    sbc  b                                        ; $6314: $98
    ld   d, [hl]                                  ; $6315: $56
    add  a                                        ; $6316: $87
    inc  c                                        ; $6317: $0C
    inc  e                                        ; $6318: $1C
    ld   h, h                                     ; $6319: $64
    ld   h, [hl]                                  ; $631A: $66
    rrca                                          ; $631B: $0F
    rrca                                          ; $631C: $0F
    rrca                                          ; $631D: $0F
    rrca                                          ; $631E: $0F
    sbc  b                                        ; $631F: $98
    ld   d, a                                     ; $6320: $57
    add  a                                        ; $6321: $87
    dec  c                                        ; $6322: $0D
    dec  e                                        ; $6323: $1D
    ld   h, l                                     ; $6324: $65
    ld   h, a                                     ; $6325: $67
    rra                                           ; $6326: $1F
    rra                                           ; $6327: $1F
    rra                                           ; $6328: $1F
    rra                                           ; $6329: $1F
    sbc  b                                        ; $632A: $98
    ld   d, l                                     ; $632B: $55
    add  c                                        ; $632C: $81
    dec  bc                                       ; $632D: $0B
    dec  de                                       ; $632E: $1B
    sbc  b                                        ; $632F: $98
    ld   e, b                                     ; $6330: $58
    add  c                                        ; $6331: $81
    ld   c, $1E                                   ; $6332: $0E $1E
    sbc  b                                        ; $6334: $98
    ld   c, d                                     ; $6335: $4A
    add  a                                        ; $6336: $87
    inc  c                                        ; $6337: $0C
    inc  e                                        ; $6338: $1C
    ld   h, h                                     ; $6339: $64
    ld   h, [hl]                                  ; $633A: $66
    rrca                                          ; $633B: $0F
    rrca                                          ; $633C: $0F
    rrca                                          ; $633D: $0F
    rrca                                          ; $633E: $0F
    sbc  b                                        ; $633F: $98
    ld   c, e                                     ; $6340: $4B
    add  a                                        ; $6341: $87
    dec  c                                        ; $6342: $0D
    dec  e                                        ; $6343: $1D
    ld   h, h                                     ; $6344: $64
    ld   h, [hl]                                  ; $6345: $66
    rra                                           ; $6346: $1F
    rra                                           ; $6347: $1F
    rra                                           ; $6348: $1F
    rra                                           ; $6349: $1F
    sbc  b                                        ; $634A: $98
    ld   c, c                                     ; $634B: $49
    add  c                                        ; $634C: $81
    dec  bc                                       ; $634D: $0B
    dec  de                                       ; $634E: $1B
    sbc  b                                        ; $634F: $98
    ld   c, h                                     ; $6350: $4C
    add  c                                        ; $6351: $81
    ld   c, $1E                                   ; $6352: $0E $1E
    sbc  b                                        ; $6354: $98
    ld   d, [hl]                                  ; $6355: $56
    add  a                                        ; $6356: $87
    inc  c                                        ; $6357: $0C
    inc  e                                        ; $6358: $1C
    ld   h, h                                     ; $6359: $64
    ld   h, [hl]                                  ; $635A: $66
    rrca                                          ; $635B: $0F
    rrca                                          ; $635C: $0F
    rrca                                          ; $635D: $0F
    rrca                                          ; $635E: $0F
    sbc  b                                        ; $635F: $98
    ld   d, a                                     ; $6360: $57
    add  a                                        ; $6361: $87
    dec  c                                        ; $6362: $0D
    dec  e                                        ; $6363: $1D
    ld   h, h                                     ; $6364: $64
    ld   h, [hl]                                  ; $6365: $66
    rra                                           ; $6366: $1F
    rra                                           ; $6367: $1F
    rra                                           ; $6368: $1F
    rra                                           ; $6369: $1F
    sbc  b                                        ; $636A: $98
    ld   d, l                                     ; $636B: $55
    add  c                                        ; $636C: $81
    dec  bc                                       ; $636D: $0B
    dec  de                                       ; $636E: $1B
    sbc  b                                        ; $636F: $98
    ld   e, b                                     ; $6370: $58
    add  c                                        ; $6371: $81
    ld   c, $1E                                   ; $6372: $0E $1E

func_019_6374:
    ld   a, $20                                   ; $6374: $3E $20
    ld   [wRequests], a                           ; $6376: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $6379: $21 $01 $D6
    ld   de, $62F4                                ; $637C: $11 $F4 $62
    ldh  a, [hIsGBC]                              ; $637F: $F0 $FE
    and  a                                        ; $6381: $A7
    jr   z, jr_019_6387                           ; $6382: $28 $03

    ld   de, $6334                                ; $6384: $11 $34 $63

jr_019_6387:
    ldh  a, [hBaseScrollX]                        ; $6387: $F0 $96
    and  a                                        ; $6389: $A7
    jr   z, jr_019_6397                           ; $638A: $28 $0B

    ld   de, $6314                                ; $638C: $11 $14 $63
    ldh  a, [hIsGBC]                              ; $638F: $F0 $FE
    and  a                                        ; $6391: $A7
    jr   z, jr_019_6397                           ; $6392: $28 $03

    ld   de, $6354                                ; $6394: $11 $54 $63

jr_019_6397:
    push bc                                       ; $6397: $C5
    ld   c, $20                                   ; $6398: $0E $20

jr_019_639A:
    ld   a, [de]                                  ; $639A: $1A
    inc  de                                       ; $639B: $13
    ld   [hl+], a                                 ; $639C: $22
    dec  c                                        ; $639D: $0D
    jr   nz, jr_019_639A                          ; $639E: $20 $FA

    pop  bc                                       ; $63A0: $C1
    ld   [hl], b                                  ; $63A1: $70
    ret                                           ; $63A2: $C9

    sbc  b                                        ; $63A3: $98
    adc  e                                        ; $63A4: $8B
    add  l                                        ; $63A5: $85
    ld   h, $26                                   ; $63A6: $26 $26
    ld   bc, $0101                                ; $63A8: $01 $01 $01
    ld   bc, $9798                                ; $63AB: $01 $98 $97
    add  l                                        ; $63AE: $85
    ld   h, $26                                   ; $63AF: $26 $26
    ld   bc, $0101                                ; $63B1: $01 $01 $01
    ld   bc, $FEF0                                ; $63B4: $01 $F0 $FE
    and  a                                        ; $63B7: $A7
    jr   z, jr_019_63D8                           ; $63B8: $28 $1E

    ld   a, $05                                   ; $63BA: $3E $05
    ld   [$DC90], a                               ; $63BC: $EA $90 $DC
    ld   hl, $DC91                                ; $63BF: $21 $91 $DC
    ld   de, $63A3                                ; $63C2: $11 $A3 $63
    ldh  a, [hBaseScrollX]                        ; $63C5: $F0 $96
    and  a                                        ; $63C7: $A7
    jr   z, jr_019_63CD                           ; $63C8: $28 $03

    ld   de, $63AC                                ; $63CA: $11 $AC $63

jr_019_63CD:
    push bc                                       ; $63CD: $C5
    ld   c, $09                                   ; $63CE: $0E $09

jr_019_63D0:
    ld   a, [de]                                  ; $63D0: $1A
    inc  de                                       ; $63D1: $13
    ld   [hl+], a                                 ; $63D2: $22
    dec  c                                        ; $63D3: $0D
    jr   nz, jr_019_63D0                          ; $63D4: $20 $FA

    pop  bc                                       ; $63D6: $C1
    ld   [hl], b                                  ; $63D7: $70

jr_019_63D8:
    ret                                           ; $63D8: $C9

    ld   d, b                                     ; $63D9: $50
    ld   e, h                                     ; $63DA: $5C
    ld   l, b                                     ; $63DB: $68
    ld   [hl], b                                  ; $63DC: $70
    ld   a, d                                     ; $63DD: $7A
    ld   a, [hl]                                  ; $63DE: $7E
    ld   e, b                                     ; $63DF: $58
    ld   [hl-], a                                 ; $63E0: $32
    jr   c, jr_019_641B                           ; $63E1: $38 $38

    ld   b, b                                     ; $63E3: $40
    ld   b, h                                     ; $63E4: $44
    ld   d, b                                     ; $63E5: $50
    jr   nz, @+$22                                ; $63E6: $20 $20

    jr   nz, jr_019_640A                          ; $63E8: $20 $20

    jr   nz, jr_019_640B                          ; $63EA: $20 $1F

    ld   e, $1F                                   ; $63EC: $1E $1F
    jr   nz, jr_019_6410                          ; $63EE: $20 $20

    jr   nz, jr_019_6412                          ; $63F0: $20 $20

    jr   nz, jr_019_63F7                          ; $63F2: $20 $03

    inc  bc                                       ; $63F4: $03
    inc  b                                        ; $63F5: $04
    inc  b                                        ; $63F6: $04

jr_019_63F7:
    dec  b                                        ; $63F7: $05
    dec  b                                        ; $63F8: $05
    ld   b, $01                                   ; $63F9: $06 $01
    ld   bc, $0202                                ; $63FB: $01 $02 $02
    inc  bc                                       ; $63FE: $03
    inc  bc                                       ; $63FF: $03
    ret  nz                                       ; $6400: $C0

    ret  nz                                       ; $6401: $C0

    ret  nz                                       ; $6402: $C0

    ret  nz                                       ; $6403: $C0

    ret  nz                                       ; $6404: $C0

    ret  nz                                       ; $6405: $C0

    ret  nz                                       ; $6406: $C0

    jr   c, @+$3C                                 ; $6407: $38 $3A

    dec  sp                                       ; $6409: $3B

jr_019_640A:
    ld   b, h                                     ; $640A: $44

jr_019_640B:
    ld   c, h                                     ; $640B: $4C
    ld   e, b                                     ; $640C: $58
    rst  $38                                      ; $640D: $FF
    rst  $38                                      ; $640E: $FF
    rst  $38                                      ; $640F: $FF

jr_019_6410:
    rst  $38                                      ; $6410: $FF
    rst  $38                                      ; $6411: $FF

jr_019_6412:
    rst  $38                                      ; $6412: $FF
    rst  $38                                      ; $6413: $FF
    cpl                                           ; $6414: $2F
    jr   nc, @+$32                                ; $6415: $30 $30

    jr   nc, jr_019_6449                          ; $6417: $30 $30

    jr   nc, jr_019_641B                          ; $6419: $30 $00

jr_019_641B:
    nop                                           ; $641B: $00
    nop                                           ; $641C: $00
    nop                                           ; $641D: $00
    nop                                           ; $641E: $00
    nop                                           ; $641F: $00
    nop                                           ; $6420: $00
    nop                                           ; $6421: $00
    ld   bc, $0302                                ; $6422: $01 $02 $03
    inc  b                                        ; $6425: $04
    inc  b                                        ; $6426: $04
    nop                                           ; $6427: $00
    nop                                           ; $6428: $00
    ld   [hl], b                                  ; $6429: $70
    ld   b, $00                                   ; $642A: $06 $00
    nop                                           ; $642C: $00
    rst  $38                                      ; $642D: $FF
    ld   b, $00                                   ; $642E: $06 $00
    nop                                           ; $6430: $00
    rst  $38                                      ; $6431: $FF
    ld   b, $00                                   ; $6432: $06 $00
    nop                                           ; $6434: $00
    rst  $38                                      ; $6435: $FF
    ld   b, $00                                   ; $6436: $06 $00
    nop                                           ; $6438: $00
    ld   [hl], d                                  ; $6439: $72
    ld   b, $00                                   ; $643A: $06 $00
    ld   [$0674], sp                              ; $643C: $08 $74 $06
    nop                                           ; $643F: $00
    nop                                           ; $6440: $00
    rst  $38                                      ; $6441: $FF
    ld   b, $00                                   ; $6442: $06 $00
    nop                                           ; $6444: $00
    rst  $38                                      ; $6445: $FF
    ld   b, $00                                   ; $6446: $06 $00
    nop                                           ; $6448: $00

jr_019_6449:
    db   $76                                      ; $6449: $76
    ld   b, $00                                   ; $644A: $06 $00
    ld   [$0678], sp                              ; $644C: $08 $78 $06
    nop                                           ; $644F: $00
    db   $10                                      ; $6450: $10
    ld   a, d                                     ; $6451: $7A
    ld   b, $00                                   ; $6452: $06 $00
    nop                                           ; $6454: $00
    rst  $38                                      ; $6455: $FF
    ld   b, $00                                   ; $6456: $06 $00
    nop                                           ; $6458: $00
    ld   a, h                                     ; $6459: $7C
    ld   b, $00                                   ; $645A: $06 $00
    ld   [$067E], sp                              ; $645C: $08 $7E $06
    nop                                           ; $645F: $00
    db   $10                                      ; $6460: $10
    ld   a, [hl]                                  ; $6461: $7E
    ld   h, $00                                   ; $6462: $26 $00
    jr   @+$7E                                    ; $6464: $18 $7C

    ld   h, $00                                   ; $6466: $26 $00
    nop                                           ; $6468: $00
    ld   a, d                                     ; $6469: $7A
    ld   h, $00                                   ; $646A: $26 $00
    ld   [$2678], sp                              ; $646C: $08 $78 $26
    nop                                           ; $646F: $00
    db   $10                                      ; $6470: $10
    db   $76                                      ; $6471: $76
    ld   h, $00                                   ; $6472: $26 $00
    nop                                           ; $6474: $00
    rst  $38                                      ; $6475: $FF
    ld   b, $00                                   ; $6476: $06 $00
    nop                                           ; $6478: $00
    ld   [hl], h                                  ; $6479: $74
    ld   h, $00                                   ; $647A: $26 $00
    ld   [$2672], sp                              ; $647C: $08 $72 $26
    nop                                           ; $647F: $00
    nop                                           ; $6480: $00
    rst  $38                                      ; $6481: $FF
    ld   b, $00                                   ; $6482: $06 $00
    nop                                           ; $6484: $00
    rst  $38                                      ; $6485: $FF
    ld   b, $00                                   ; $6486: $06 $00
    jr   nc, jr_019_64FA                          ; $6488: $30 $70

    ld   h, $00                                   ; $648A: $26 $00
    ret  c                                        ; $648C: $D8

    ld   [hl], b                                  ; $648D: $70
    ld   b, $00                                   ; $648E: $06 $00
    nop                                           ; $6490: $00
    rst  $38                                      ; $6491: $FF
    ld   b, $00                                   ; $6492: $06 $00
    nop                                           ; $6494: $00
    rst  $38                                      ; $6495: $FF
    ld   b, $00                                   ; $6496: $06 $00
    nop                                           ; $6498: $00
    ld   h, b                                     ; $6499: $60
    dec  d                                        ; $649A: $15
    stop                                          ; $649B: $10 $00
    ld   h, d                                     ; $649D: $62
    ld   b, $20                                   ; $649E: $06 $20
    nop                                           ; $64A0: $00
    ld   h, d                                     ; $64A1: $62
    ld   b, $00                                   ; $64A2: $06 $00
    nop                                           ; $64A4: $00
    rst  $38                                      ; $64A5: $FF
    nop                                           ; $64A6: $00
    nop                                           ; $64A7: $00
    nop                                           ; $64A8: $00
    rst  $38                                      ; $64A9: $FF
    nop                                           ; $64AA: $00
    nop                                           ; $64AB: $00
    nop                                           ; $64AC: $00
    rst  $38                                      ; $64AD: $FF
    nop                                           ; $64AE: $00
    nop                                           ; $64AF: $00
    nop                                           ; $64B0: $00
    ld   h, h                                     ; $64B1: $64
    dec  d                                        ; $64B2: $15
    stop                                          ; $64B3: $10 $00
    ld   h, [hl]                                  ; $64B5: $66
    ld   b, $20                                   ; $64B6: $06 $20
    nop                                           ; $64B8: $00
    ld   h, [hl]                                  ; $64B9: $66
    ld   b, $00                                   ; $64BA: $06 $00
    nop                                           ; $64BC: $00
    rst  $38                                      ; $64BD: $FF
    nop                                           ; $64BE: $00
    nop                                           ; $64BF: $00
    nop                                           ; $64C0: $00
    rst  $38                                      ; $64C1: $FF
    nop                                           ; $64C2: $00
    nop                                           ; $64C3: $00
    nop                                           ; $64C4: $00
    rst  $38                                      ; $64C5: $FF
    nop                                           ; $64C6: $00
    nop                                           ; $64C7: $00
    ld   [bc], a                                  ; $64C8: $02
    ld   l, b                                     ; $64C9: $68
    dec  d                                        ; $64CA: $15
    db   $10                                      ; $64CB: $10
    ld   [bc], a                                  ; $64CC: $02
    ld   l, d                                     ; $64CD: $6A
    ld   b, $20                                   ; $64CE: $06 $20
    ld   [bc], a                                  ; $64D0: $02
    ld   l, d                                     ; $64D1: $6A
    ld   b, $00                                   ; $64D2: $06 $00
    dec  b                                        ; $64D4: $05
    ld   l, b                                     ; $64D5: $68
    dec  [hl]                                     ; $64D6: $35
    db   $10                                      ; $64D7: $10
    dec  b                                        ; $64D8: $05
    ld   l, d                                     ; $64D9: $6A
    ld   h, $20                                   ; $64DA: $26 $20
    dec  b                                        ; $64DC: $05
    ld   l, d                                     ; $64DD: $6A
    ld   h, $00                                   ; $64DE: $26 $00
    ld   bc, $1568                                ; $64E0: $01 $68 $15
    db   $10                                      ; $64E3: $10
    ld   bc, $066A                                ; $64E4: $01 $6A $06
    jr   nz, jr_019_64EA                          ; $64E7: $20 $01

    ld   l, d                                     ; $64E9: $6A

jr_019_64EA:
    ld   b, $00                                   ; $64EA: $06 $00
    rlca                                          ; $64EC: $07
    ld   l, b                                     ; $64ED: $68
    dec  [hl]                                     ; $64EE: $35
    db   $10                                      ; $64EF: $10
    rlca                                          ; $64F0: $07
    ld   l, d                                     ; $64F1: $6A
    ld   h, $20                                   ; $64F2: $26 $20
    rlca                                          ; $64F4: $07
    ld   l, d                                     ; $64F5: $6A
    ld   h, $00                                   ; $64F6: $26 $00
    nop                                           ; $64F8: $00
    ld   l, b                                     ; $64F9: $68

jr_019_64FA:
    dec  d                                        ; $64FA: $15
    stop                                          ; $64FB: $10 $00
    ld   l, d                                     ; $64FD: $6A
    ld   b, $20                                   ; $64FE: $06 $20
    nop                                           ; $6500: $00
    ld   l, d                                     ; $6501: $6A
    ld   b, $00                                   ; $6502: $06 $00
    ld   [$3568], sp                              ; $6504: $08 $68 $35
    db   $10                                      ; $6507: $10
    ld   [$266A], sp                              ; $6508: $08 $6A $26
    jr   nz, jr_019_6515                          ; $650B: $20 $08

    ld   l, d                                     ; $650D: $6A
    ld   h, $21                                   ; $650E: $26 $21
    ret  nc                                       ; $6510: $D0

    jp   label_019_5E09                           ; $6511: $C3 $09 $5E

    ld   d, b                                     ; $6514: $50

jr_019_6515:
    ld   hl, $63D9                                ; $6515: $21 $D9 $63
    add  hl, de                                   ; $6518: $19
    ld   a, [hl]                                  ; $6519: $7E
    ldh  [wActiveEntityPosX], a                   ; $651A: $E0 $EE
    ld   hl, $63E6                                ; $651C: $21 $E6 $63
    add  hl, de                                   ; $651F: $19
    ld   a, [hl]                                  ; $6520: $7E
    ldh  [wActiveEntityPosY], a                   ; $6521: $E0 $EC
    ld   hl, $63F3                                ; $6523: $21 $F3 $63
    add  hl, de                                   ; $6526: $19
    ld   a, [hl]                                  ; $6527: $7E
    rla                                           ; $6528: $17
    rla                                           ; $6529: $17
    rla                                           ; $652A: $17
    rla                                           ; $652B: $17
    and  $F0                                      ; $652C: $E6 $F0
    ld   e, a                                     ; $652E: $5F
    ld   d, b                                     ; $652F: $50
    ld   hl, $6427                                ; $6530: $21 $27 $64
    add  hl, de                                   ; $6533: $19
    ld   c, $04                                   ; $6534: $0E $04
    call label_3CE6                               ; $6536: $CD $E6 $3C
    ld   a, $02                                   ; $6539: $3E $02
    call label_3DA0                               ; $653B: $CD $A0 $3D
    ld   hl, wEntitiesUnknowTableY                ; $653E: $21 $D0 $C3
    add  hl, bc                                   ; $6541: $09
    ld   e, [hl]                                  ; $6542: $5E
    ld   d, b                                     ; $6543: $50
    ld   hl, $6400                                ; $6544: $21 $00 $64
    add  hl, de                                   ; $6547: $19
    ld   a, [hl]                                  ; $6548: $7E
    ldh  [wActiveEntityPosX], a                   ; $6549: $E0 $EE
    ld   hl, $640D                                ; $654B: $21 $0D $64
    add  hl, de                                   ; $654E: $19
    ld   a, [hl]                                  ; $654F: $7E
    ldh  [wActiveEntityPosY], a                   ; $6550: $E0 $EC
    ld   hl, $641A                                ; $6552: $21 $1A $64
    add  hl, de                                   ; $6555: $19
    ld   a, [hl]                                  ; $6556: $7E
    rla                                           ; $6557: $17
    rla                                           ; $6558: $17
    rla                                           ; $6559: $17
    and  $F8                                      ; $655A: $E6 $F8
    ld   e, a                                     ; $655C: $5F
    rla                                           ; $655D: $17
    and  $F0                                      ; $655E: $E6 $F0
    add  e                                        ; $6560: $83
    ld   e, a                                     ; $6561: $5F
    ld   d, b                                     ; $6562: $50
    ld   hl, $6497                                ; $6563: $21 $97 $64
    add  hl, de                                   ; $6566: $19
    ld   c, $06                                   ; $6567: $0E $06
    call label_3CE6                               ; $6569: $CD $E6 $3C
    ld   a, $04                                   ; $656C: $3E $04
    jp   label_3DA0                               ; $656E: $C3 $A0 $3D

    sbc  b                                        ; $6571: $98
    ld   [bc], a                                  ; $6572: $02
    add  hl, bc                                   ; $6573: $09
    ld   d, l                                     ; $6574: $55
    ld   d, [hl]                                  ; $6575: $56
    ld   d, l                                     ; $6576: $55
    ld   d, [hl]                                  ; $6577: $56
    ld   d, l                                     ; $6578: $55
    ld   d, [hl]                                  ; $6579: $56
    ld   d, l                                     ; $657A: $55
    ld   d, [hl]                                  ; $657B: $56
    ld   d, l                                     ; $657C: $55
    ld   d, [hl]                                  ; $657D: $56
    sbc  b                                        ; $657E: $98
    ld   [hl+], a                                 ; $657F: $22
    add  hl, bc                                   ; $6580: $09
    ld   d, l                                     ; $6581: $55
    ld   d, [hl]                                  ; $6582: $56
    ld   d, l                                     ; $6583: $55
    ld   d, [hl]                                  ; $6584: $56
    ld   d, l                                     ; $6585: $55
    ld   d, [hl]                                  ; $6586: $56
    ld   d, l                                     ; $6587: $55
    ld   d, [hl]                                  ; $6588: $56
    ld   d, l                                     ; $6589: $55
    ld   d, [hl]                                  ; $658A: $56
    sbc  b                                        ; $658B: $98
    ld   b, d                                     ; $658C: $42
    add  hl, bc                                   ; $658D: $09
    inc  c                                        ; $658E: $0C
    dec  c                                        ; $658F: $0D
    inc  c                                        ; $6590: $0C
    dec  c                                        ; $6591: $0D
    inc  c                                        ; $6592: $0C
    dec  c                                        ; $6593: $0D
    inc  c                                        ; $6594: $0C
    dec  c                                        ; $6595: $0D
    inc  c                                        ; $6596: $0C
    dec  c                                        ; $6597: $0D
    sbc  b                                        ; $6598: $98
    ld   h, d                                     ; $6599: $62
    add  hl, bc                                   ; $659A: $09
    ld   c, $0F                                   ; $659B: $0E $0F
    ld   c, $0F                                   ; $659D: $0E $0F
    ld   c, $0F                                   ; $659F: $0E $0F
    ld   c, $0F                                   ; $65A1: $0E $0F
    ld   c, $0F                                   ; $65A3: $0E $0F
    sbc  b                                        ; $65A5: $98
    ld   [bc], a                                  ; $65A6: $02
    add  hl, bc                                   ; $65A7: $09
    ld   d, l                                     ; $65A8: $55
    ld   d, [hl]                                  ; $65A9: $56
    ld   d, l                                     ; $65AA: $55
    ld   d, [hl]                                  ; $65AB: $56
    ld   d, l                                     ; $65AC: $55
    ld   d, [hl]                                  ; $65AD: $56
    ld   d, l                                     ; $65AE: $55
    ld   d, [hl]                                  ; $65AF: $56
    ld   d, l                                     ; $65B0: $55
    ld   d, [hl]                                  ; $65B1: $56
    sbc  b                                        ; $65B2: $98
    ld   [hl+], a                                 ; $65B3: $22
    add  hl, bc                                   ; $65B4: $09
    ld   d, l                                     ; $65B5: $55
    ld   d, [hl]                                  ; $65B6: $56
    ld   d, l                                     ; $65B7: $55
    ld   d, [hl]                                  ; $65B8: $56
    ld   d, l                                     ; $65B9: $55
    ld   d, [hl]                                  ; $65BA: $56
    ld   d, l                                     ; $65BB: $55
    ld   d, [hl]                                  ; $65BC: $56
    ld   d, l                                     ; $65BD: $55
    ld   d, [hl]                                  ; $65BE: $56
    sbc  b                                        ; $65BF: $98
    ld   b, d                                     ; $65C0: $42
    add  hl, bc                                   ; $65C1: $09
    ld   c, $0F                                   ; $65C2: $0E $0F
    ld   c, $0F                                   ; $65C4: $0E $0F
    ld   c, $0F                                   ; $65C6: $0E $0F
    ld   c, $0F                                   ; $65C8: $0E $0F
    ld   c, $0F                                   ; $65CA: $0E $0F
    sbc  b                                        ; $65CC: $98
    ld   h, d                                     ; $65CD: $62
    add  hl, bc                                   ; $65CE: $09
    rrca                                          ; $65CF: $0F
    ld   c, $0F                                   ; $65D0: $0E $0F
    ld   c, $0F                                   ; $65D2: $0E $0F
    ld   c, $0F                                   ; $65D4: $0E $0F
    ld   c, $0F                                   ; $65D6: $0E $0F
    ld   c, $98                                   ; $65D8: $0E $98
    ld   [bc], a                                  ; $65DA: $02
    add  hl, bc                                   ; $65DB: $09
    ld   d, l                                     ; $65DC: $55
    ld   d, [hl]                                  ; $65DD: $56
    ld   d, l                                     ; $65DE: $55
    ld   d, [hl]                                  ; $65DF: $56
    ld   d, l                                     ; $65E0: $55
    ld   d, [hl]                                  ; $65E1: $56
    ld   d, l                                     ; $65E2: $55
    ld   d, [hl]                                  ; $65E3: $56
    ld   d, l                                     ; $65E4: $55
    ld   d, [hl]                                  ; $65E5: $56
    sbc  b                                        ; $65E6: $98
    ld   [hl+], a                                 ; $65E7: $22
    add  hl, bc                                   ; $65E8: $09
    ld   c, $0F                                   ; $65E9: $0E $0F
    ld   c, $0F                                   ; $65EB: $0E $0F
    ld   c, $0F                                   ; $65ED: $0E $0F
    ld   c, $0F                                   ; $65EF: $0E $0F
    ld   c, $0F                                   ; $65F1: $0E $0F
    sbc  b                                        ; $65F3: $98
    ld   b, d                                     ; $65F4: $42
    add  hl, bc                                   ; $65F5: $09
    rrca                                          ; $65F6: $0F
    ld   c, $0F                                   ; $65F7: $0E $0F
    ld   c, $0F                                   ; $65F9: $0E $0F
    ld   c, $0F                                   ; $65FB: $0E $0F
    ld   c, $0F                                   ; $65FD: $0E $0F
    ld   c, $98                                   ; $65FF: $0E $98
    ld   h, d                                     ; $6601: $62
    add  hl, bc                                   ; $6602: $09
    ld   c, $0F                                   ; $6603: $0E $0F
    ld   c, $0F                                   ; $6605: $0E $0F
    ld   c, $0F                                   ; $6607: $0E $0F
    ld   c, $0F                                   ; $6609: $0E $0F
    ld   c, $0F                                   ; $660B: $0E $0F
    sbc  b                                        ; $660D: $98
    ld   [bc], a                                  ; $660E: $02
    add  hl, bc                                   ; $660F: $09
    ld   c, $0F                                   ; $6610: $0E $0F
    ld   c, $0F                                   ; $6612: $0E $0F
    ld   c, $0F                                   ; $6614: $0E $0F
    ld   c, $0F                                   ; $6616: $0E $0F
    ld   c, $0F                                   ; $6618: $0E $0F
    sbc  b                                        ; $661A: $98
    ld   [hl+], a                                 ; $661B: $22
    add  hl, bc                                   ; $661C: $09
    rrca                                          ; $661D: $0F
    ld   c, $0F                                   ; $661E: $0E $0F
    ld   c, $0F                                   ; $6620: $0E $0F
    ld   c, $0F                                   ; $6622: $0E $0F
    ld   c, $0F                                   ; $6624: $0E $0F
    ld   c, $98                                   ; $6626: $0E $98
    ld   b, d                                     ; $6628: $42
    add  hl, bc                                   ; $6629: $09
    ld   c, $0F                                   ; $662A: $0E $0F
    ld   c, $0F                                   ; $662C: $0E $0F
    ld   c, $0F                                   ; $662E: $0E $0F
    ld   c, $0F                                   ; $6630: $0E $0F
    ld   c, $0F                                   ; $6632: $0E $0F
    sbc  b                                        ; $6634: $98
    ld   h, d                                     ; $6635: $62
    add  hl, bc                                   ; $6636: $09
    rrca                                          ; $6637: $0F
    ld   c, $0F                                   ; $6638: $0E $0F
    ld   c, $0F                                   ; $663A: $0E $0F
    ld   c, $0F                                   ; $663C: $0E $0F
    ld   c, $0F                                   ; $663E: $0E $0F
    ld   c, $98                                   ; $6640: $0E $98
    add  d                                        ; $6642: $82
    add  hl, bc                                   ; $6643: $09
    rrca                                          ; $6644: $0F
    ld   c, $0F                                   ; $6645: $0E $0F
    rrca                                          ; $6647: $0F
    rrca                                          ; $6648: $0F
    ld   c, $0F                                   ; $6649: $0E $0F
    ld   c, $0F                                   ; $664B: $0E $0F
    ld   c, $98                                   ; $664D: $0E $98
    and  d                                        ; $664F: $A2
    add  hl, bc                                   ; $6650: $09
    ld   c, $0F                                   ; $6651: $0E $0F
    ld   c, $0F                                   ; $6653: $0E $0F
    ld   c, $0F                                   ; $6655: $0E $0F
    ld   c, $0F                                   ; $6657: $0E $0F
    ld   c, $0F                                   ; $6659: $0E $0F
    sbc  b                                        ; $665B: $98
    jp   nz, $0F09                                ; $665C: $C2 $09 $0F

    ld   c, $0F                                   ; $665F: $0E $0F
    ld   c, $0F                                   ; $6661: $0E $0F
    ld   c, $0F                                   ; $6663: $0E $0F
    ld   c, $0F                                   ; $6665: $0E $0F
    ld   c, $98                                   ; $6667: $0E $98
    ld   [c], a                                   ; $6669: $E2
    add  hl, bc                                   ; $666A: $09
    ld   e, $1E                                   ; $666B: $1E $1E
    ld   e, $1E                                   ; $666D: $1E $1E
    ld   e, $1E                                   ; $666F: $1E $1E
    ld   e, $1E                                   ; $6671: $1E $1E
    ld   e, $1E                                   ; $6673: $1E $1E
    sbc  b                                        ; $6675: $98
    add  d                                        ; $6676: $82
    add  hl, bc                                   ; $6677: $09
    ld   c, $0F                                   ; $6678: $0E $0F
    ld   c, $0F                                   ; $667A: $0E $0F
    ld   c, $0F                                   ; $667C: $0E $0F
    ld   c, $0F                                   ; $667E: $0E $0F
    ld   c, $0F                                   ; $6680: $0E $0F
    sbc  b                                        ; $6682: $98
    and  d                                        ; $6683: $A2
    add  hl, bc                                   ; $6684: $09
    rrca                                          ; $6685: $0F
    ld   c, $0F                                   ; $6686: $0E $0F
    ld   c, $0F                                   ; $6688: $0E $0F
    ld   c, $0F                                   ; $668A: $0E $0F
    ld   c, $0F                                   ; $668C: $0E $0F
    ld   c, $98                                   ; $668E: $0E $98
    jp   nz, $1E09                                ; $6690: $C2 $09 $1E

    ld   e, $1E                                   ; $6693: $1E $1E
    ld   e, $1E                                   ; $6695: $1E $1E
    ld   e, $1E                                   ; $6697: $1E $1E
    ld   e, $1E                                   ; $6699: $1E $1E
    ld   e, $98                                   ; $669B: $1E $98
    ld   [c], a                                   ; $669D: $E2
    add  hl, bc                                   ; $669E: $09
    add  hl, bc                                   ; $669F: $09
    ld   [$0918], sp                              ; $66A0: $08 $18 $09
    ld   a, [hl]                                  ; $66A3: $7E
    ld   a, [hl]                                  ; $66A4: $7E
    add  hl, bc                                   ; $66A5: $09
    ld   [$0918], sp                              ; $66A6: $08 $18 $09
    sbc  b                                        ; $66A9: $98
    add  d                                        ; $66AA: $82
    add  hl, bc                                   ; $66AB: $09
    ld   c, $0F                                   ; $66AC: $0E $0F
    ld   c, $0F                                   ; $66AE: $0E $0F
    ld   c, $0F                                   ; $66B0: $0E $0F
    ld   c, $0F                                   ; $66B2: $0E $0F
    ld   c, $0F                                   ; $66B4: $0E $0F
    sbc  b                                        ; $66B6: $98
    and  d                                        ; $66B7: $A2
    add  hl, bc                                   ; $66B8: $09
    ld   e, $1E                                   ; $66B9: $1E $1E
    ld   e, $1E                                   ; $66BB: $1E $1E
    ld   e, $1E                                   ; $66BD: $1E $1E
    ld   e, $1E                                   ; $66BF: $1E $1E
    ld   e, $1E                                   ; $66C1: $1E $1E
    sbc  b                                        ; $66C3: $98
    jp   nz, $0909                                ; $66C4: $C2 $09 $09

    ld   [$0918], sp                              ; $66C7: $08 $18 $09
    ld   a, [hl]                                  ; $66CA: $7E
    ld   a, [hl]                                  ; $66CB: $7E
    add  hl, bc                                   ; $66CC: $09
    ld   [$0918], sp                              ; $66CD: $08 $18 $09
    sbc  b                                        ; $66D0: $98
    ld   [c], a                                   ; $66D1: $E2
    add  hl, bc                                   ; $66D2: $09
    add  hl, bc                                   ; $66D3: $09
    inc  b                                        ; $66D4: $04
    dec  b                                        ; $66D5: $05
    add  hl, bc                                   ; $66D6: $09
    ld   a, [hl]                                  ; $66D7: $7E
    ld   a, [hl]                                  ; $66D8: $7E
    add  hl, bc                                   ; $66D9: $09
    inc  b                                        ; $66DA: $04
    dec  b                                        ; $66DB: $05
    add  hl, bc                                   ; $66DC: $09
    sbc  b                                        ; $66DD: $98
    add  d                                        ; $66DE: $82
    add  hl, bc                                   ; $66DF: $09
    ld   e, $1E                                   ; $66E0: $1E $1E
    ld   e, $1E                                   ; $66E2: $1E $1E
    ld   e, $1E                                   ; $66E4: $1E $1E
    ld   e, $1E                                   ; $66E6: $1E $1E
    ld   e, $1E                                   ; $66E8: $1E $1E
    sbc  b                                        ; $66EA: $98
    and  d                                        ; $66EB: $A2
    add  hl, bc                                   ; $66EC: $09
    add  hl, bc                                   ; $66ED: $09
    ld   [$0918], sp                              ; $66EE: $08 $18 $09
    ld   a, [hl]                                  ; $66F1: $7E
    ld   a, [hl]                                  ; $66F2: $7E
    add  hl, bc                                   ; $66F3: $09
    ld   [$0918], sp                              ; $66F4: $08 $18 $09
    sbc  b                                        ; $66F7: $98
    jp   nz, $0909                                ; $66F8: $C2 $09 $09

    inc  b                                        ; $66FB: $04
    dec  b                                        ; $66FC: $05
    add  hl, bc                                   ; $66FD: $09
    ld   a, [hl]                                  ; $66FE: $7E
    ld   a, [hl]                                  ; $66FF: $7E
    add  hl, bc                                   ; $6700: $09
    inc  b                                        ; $6701: $04
    dec  b                                        ; $6702: $05
    add  hl, bc                                   ; $6703: $09
    sbc  b                                        ; $6704: $98
    ld   [c], a                                   ; $6705: $E2
    add  hl, bc                                   ; $6706: $09
    add  hl, de                                   ; $6707: $19
    inc  d                                        ; $6708: $14
    dec  d                                        ; $6709: $15
    add  hl, de                                   ; $670A: $19
    rra                                           ; $670B: $1F
    rra                                           ; $670C: $1F
    add  hl, de                                   ; $670D: $19
    inc  d                                        ; $670E: $14
    dec  d                                        ; $670F: $15
    add  hl, de                                   ; $6710: $19
    sbc  b                                        ; $6711: $98
    ld   [bc], a                                  ; $6712: $02
    ld   c, c                                     ; $6713: $49
    inc  bc                                       ; $6714: $03
    sbc  b                                        ; $6715: $98
    ld   [hl+], a                                 ; $6716: $22
    ld   c, c                                     ; $6717: $49
    inc  bc                                       ; $6718: $03
    sbc  b                                        ; $6719: $98
    ld   b, d                                     ; $671A: $42
    ld   c, c                                     ; $671B: $49
    dec  b                                        ; $671C: $05
    sbc  b                                        ; $671D: $98
    ld   h, d                                     ; $671E: $62
    ld   c, c                                     ; $671F: $49
    ld   [bc], a                                  ; $6720: $02
    sbc  b                                        ; $6721: $98
    ld   [bc], a                                  ; $6722: $02
    ld   c, c                                     ; $6723: $49
    inc  bc                                       ; $6724: $03
    sbc  b                                        ; $6725: $98
    ld   [hl+], a                                 ; $6726: $22
    ld   c, c                                     ; $6727: $49
    inc  bc                                       ; $6728: $03
    sbc  b                                        ; $6729: $98
    ld   b, d                                     ; $672A: $42
    ld   c, c                                     ; $672B: $49
    ld   [bc], a                                  ; $672C: $02
    sbc  b                                        ; $672D: $98
    ld   h, d                                     ; $672E: $62
    ld   c, c                                     ; $672F: $49
    ld   [bc], a                                  ; $6730: $02
    sbc  b                                        ; $6731: $98
    ld   [bc], a                                  ; $6732: $02
    ld   c, c                                     ; $6733: $49
    inc  bc                                       ; $6734: $03
    sbc  b                                        ; $6735: $98
    ld   [hl+], a                                 ; $6736: $22
    ld   c, c                                     ; $6737: $49
    ld   [bc], a                                  ; $6738: $02
    sbc  b                                        ; $6739: $98
    ld   b, d                                     ; $673A: $42
    ld   c, c                                     ; $673B: $49
    ld   [bc], a                                  ; $673C: $02
    sbc  b                                        ; $673D: $98
    ld   h, d                                     ; $673E: $62
    ld   c, c                                     ; $673F: $49
    ld   [bc], a                                  ; $6740: $02
    sbc  b                                        ; $6741: $98
    ld   [bc], a                                  ; $6742: $02
    ld   c, c                                     ; $6743: $49
    ld   [bc], a                                  ; $6744: $02
    sbc  b                                        ; $6745: $98
    ld   [hl+], a                                 ; $6746: $22
    ld   c, c                                     ; $6747: $49
    ld   [bc], a                                  ; $6748: $02
    sbc  b                                        ; $6749: $98
    ld   b, d                                     ; $674A: $42
    ld   c, c                                     ; $674B: $49
    ld   [bc], a                                  ; $674C: $02
    sbc  b                                        ; $674D: $98
    ld   h, d                                     ; $674E: $62
    ld   c, c                                     ; $674F: $49
    ld   [bc], a                                  ; $6750: $02
    sbc  b                                        ; $6751: $98
    add  d                                        ; $6752: $82
    add  hl, bc                                   ; $6753: $09
    ld   [bc], a                                  ; $6754: $02
    ld   [bc], a                                  ; $6755: $02
    ld   [bc], a                                  ; $6756: $02
    ld   [bc], a                                  ; $6757: $02
    ld   [bc], a                                  ; $6758: $02
    ld   [bc], a                                  ; $6759: $02
    ld   [bc], a                                  ; $675A: $02
    ld   [bc], a                                  ; $675B: $02
    ld   [bc], a                                  ; $675C: $02
    ld   [bc], a                                  ; $675D: $02
    sbc  b                                        ; $675E: $98
    and  d                                        ; $675F: $A2
    add  hl, bc                                   ; $6760: $09
    ld   [bc], a                                  ; $6761: $02
    ld   [bc], a                                  ; $6762: $02
    ld   [bc], a                                  ; $6763: $02
    ld   [bc], a                                  ; $6764: $02
    ld   [bc], a                                  ; $6765: $02
    ld   [bc], a                                  ; $6766: $02
    ld   [bc], a                                  ; $6767: $02
    ld   [bc], a                                  ; $6768: $02
    ld   [bc], a                                  ; $6769: $02
    ld   [bc], a                                  ; $676A: $02
    sbc  b                                        ; $676B: $98
    jp   nz, $0209                                ; $676C: $C2 $09 $02

    ld   [bc], a                                  ; $676F: $02
    ld   [bc], a                                  ; $6770: $02
    ld   [bc], a                                  ; $6771: $02
    ld   [bc], a                                  ; $6772: $02
    ld   [bc], a                                  ; $6773: $02
    ld   [bc], a                                  ; $6774: $02
    ld   [bc], a                                  ; $6775: $02
    ld   [bc], a                                  ; $6776: $02
    ld   [bc], a                                  ; $6777: $02
    sbc  b                                        ; $6778: $98
    ld   [c], a                                   ; $6779: $E2
    add  hl, bc                                   ; $677A: $09
    ld   bc, $0101                                ; $677B: $01 $01 $01
    ld   bc, $0101                                ; $677E: $01 $01 $01
    ld   bc, $0101                                ; $6781: $01 $01 $01
    ld   bc, $8298                                ; $6784: $01 $98 $82
    add  hl, bc                                   ; $6787: $09
    ld   [bc], a                                  ; $6788: $02
    ld   [bc], a                                  ; $6789: $02
    ld   [bc], a                                  ; $678A: $02
    ld   [bc], a                                  ; $678B: $02
    ld   [bc], a                                  ; $678C: $02
    ld   [bc], a                                  ; $678D: $02
    ld   [bc], a                                  ; $678E: $02
    ld   [bc], a                                  ; $678F: $02
    ld   [bc], a                                  ; $6790: $02
    ld   [bc], a                                  ; $6791: $02
    sbc  b                                        ; $6792: $98
    and  d                                        ; $6793: $A2
    add  hl, bc                                   ; $6794: $09
    ld   [bc], a                                  ; $6795: $02
    ld   [bc], a                                  ; $6796: $02
    ld   [bc], a                                  ; $6797: $02
    ld   [bc], a                                  ; $6798: $02
    ld   [bc], a                                  ; $6799: $02
    ld   [bc], a                                  ; $679A: $02
    ld   [bc], a                                  ; $679B: $02
    ld   [bc], a                                  ; $679C: $02
    ld   [bc], a                                  ; $679D: $02
    ld   [bc], a                                  ; $679E: $02
    sbc  b                                        ; $679F: $98
    jp   nz, $0109                                ; $67A0: $C2 $09 $01

    ld   bc, $0101                                ; $67A3: $01 $01 $01
    ld   bc, $0101                                ; $67A6: $01 $01 $01
    ld   bc, $0101                                ; $67A9: $01 $01 $01
    sbc  b                                        ; $67AC: $98
    ld   [c], a                                   ; $67AD: $E2
    add  hl, bc                                   ; $67AE: $09
    ld   bc, $0000                                ; $67AF: $01 $00 $00
    ld   bc, $0101                                ; $67B2: $01 $01 $01
    ld   bc, $0000                                ; $67B5: $01 $00 $00
    ld   bc, $8298                                ; $67B8: $01 $98 $82
    add  hl, bc                                   ; $67BB: $09
    ld   [bc], a                                  ; $67BC: $02
    ld   [bc], a                                  ; $67BD: $02
    ld   [bc], a                                  ; $67BE: $02
    ld   [bc], a                                  ; $67BF: $02
    ld   [bc], a                                  ; $67C0: $02
    ld   [bc], a                                  ; $67C1: $02
    ld   [bc], a                                  ; $67C2: $02
    ld   [bc], a                                  ; $67C3: $02
    ld   [bc], a                                  ; $67C4: $02
    ld   [bc], a                                  ; $67C5: $02
    sbc  b                                        ; $67C6: $98
    and  d                                        ; $67C7: $A2
    add  hl, bc                                   ; $67C8: $09
    ld   bc, $0101                                ; $67C9: $01 $01 $01
    ld   bc, $0101                                ; $67CC: $01 $01 $01
    ld   bc, $0101                                ; $67CF: $01 $01 $01
    ld   bc, $C298                                ; $67D2: $01 $98 $C2
    add  hl, bc                                   ; $67D5: $09
    ld   bc, $0000                                ; $67D6: $01 $00 $00
    ld   bc, $0101                                ; $67D9: $01 $01 $01
    ld   bc, $0000                                ; $67DC: $01 $00 $00
    ld   bc, $E298                                ; $67DF: $01 $98 $E2
    add  hl, bc                                   ; $67E2: $09
    ld   bc, $0000                                ; $67E3: $01 $00 $00
    ld   bc, $0101                                ; $67E6: $01 $01 $01
    ld   bc, $0000                                ; $67E9: $01 $00 $00
    ld   bc, $8298                                ; $67EC: $01 $98 $82
    add  hl, bc                                   ; $67EF: $09
    ld   bc, $0101                                ; $67F0: $01 $01 $01
    ld   bc, $0101                                ; $67F3: $01 $01 $01
    ld   bc, $0101                                ; $67F6: $01 $01 $01
    ld   bc, $A298                                ; $67F9: $01 $98 $A2
    add  hl, bc                                   ; $67FC: $09
    ld   bc, $0000                                ; $67FD: $01 $00 $00
    ld   bc, $0101                                ; $6800: $01 $01 $01
    ld   bc, $0000                                ; $6803: $01 $00 $00
    ld   bc, $C298                                ; $6806: $01 $98 $C2
    add  hl, bc                                   ; $6809: $09
    ld   bc, $0000                                ; $680A: $01 $00 $00
    ld   bc, $0101                                ; $680D: $01 $01 $01
    ld   bc, $0000                                ; $6810: $01 $00 $00
    ld   bc, $E298                                ; $6813: $01 $98 $E2
    add  hl, bc                                   ; $6816: $09
    ld   bc, $0000                                ; $6817: $01 $00 $00
    ld   bc, $0101                                ; $681A: $01 $01 $01
    ld   bc, $0000                                ; $681D: $01 $00 $00
    ld   bc, $6571                                ; $6820: $01 $71 $65
    and  l                                        ; $6823: $A5
    ld   h, l                                     ; $6824: $65
    reti                                          ; $6825: $D9

    ld   h, l                                     ; $6826: $65
    dec  c                                        ; $6827: $0D
    ld   h, [hl]                                  ; $6828: $66
    ld   b, c                                     ; $6829: $41
    ld   h, [hl]                                  ; $682A: $66
    ld   [hl], l                                  ; $682B: $75
    ld   h, [hl]                                  ; $682C: $66
    xor  c                                        ; $682D: $A9
    ld   h, [hl]                                  ; $682E: $66
    db   $DD                                      ; $682F: $DD
    ld   h, [hl]                                  ; $6830: $66
    ld   de, $2167                                ; $6831: $11 $67 $21
    ld   h, a                                     ; $6834: $67
    ld   sp, $4167                                ; $6835: $31 $67 $41
    ld   h, a                                     ; $6838: $67
    ld   d, c                                     ; $6839: $51
    ld   h, a                                     ; $683A: $67
    add  l                                        ; $683B: $85
    ld   h, a                                     ; $683C: $67
    cp   c                                        ; $683D: $B9
    ld   h, a                                     ; $683E: $67
    db   $ED                                      ; $683F: $ED
    ld   h, a                                     ; $6840: $67

label_019_6841:
    ldh  a, [hMapRoom]                            ; $6841: $F0 $F6
    cp   $0E                                      ; $6843: $FE $0E
    jp   z, label_019_61F8                        ; $6845: $CA $F8 $61

    ld   a, $02                                   ; $6848: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $684A: $E0 $A1
    ld   [wC167], a                               ; $684C: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $684F: $F0 $F0
    rst  $00                                      ; $6851: $C7
    ld   e, d                                     ; $6852: $5A
    ld   l, b                                     ; $6853: $68
    ld   l, e                                     ; $6854: $6B
    ld   l, b                                     ; $6855: $68
    sub  h                                        ; $6856: $94
    ld   l, b                                     ; $6857: $68
    ld   sp, hl                                   ; $6858: $F9
    ld   l, b                                     ; $6859: $68
    ld   a, $04                                   ; $685A: $3E $04
    ldh  [hNoiseSfx], a                           ; $685C: $E0 $F4
    call GetEntityTransitionCountdown             ; $685E: $CD $05 $0C
    ld   [hl], $AC                                ; $6861: $36 $AC
    call IsEntityUnknownFZero                     ; $6863: $CD $00 $0C
    ld   [hl], $AC                                ; $6866: $36 $AC
    call IncrementEntityState                     ; $6868: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $686B: $CD $05 $0C
    cp   $A0                                      ; $686E: $FE $A0
    jr   nz, jr_019_6877                          ; $6870: $20 $05

    ld   hl, hNoiseSfx                            ; $6872: $21 $F4 $FF
    ld   [hl], $2E                                ; $6875: $36 $2E

jr_019_6877:
    and  a                                        ; $6877: $A7
    jr   nz, jr_019_6881                          ; $6878: $20 $07

    ld   a, $2F                                   ; $687A: $3E $2F
    ldh  [hJingle], a                             ; $687C: $E0 $F2
    call IncrementEntityState                     ; $687E: $CD $12 $3B

jr_019_6881:
    ld   e, $01                                   ; $6881: $1E $01
    and  $04                                      ; $6883: $E6 $04
    jr   z, jr_019_6889                           ; $6885: $28 $02

    ld   e, $FE                                   ; $6887: $1E $FE

jr_019_6889:
    ld   a, e                                     ; $6889: $7B
    ld   [wScreenShakeHorizontal], a              ; $688A: $EA $55 $C1
    call IsEntityUnknownFZero                     ; $688D: $CD $00 $0C
    ret  nz                                       ; $6890: $C0

    jp   label_019_6A4F                           ; $6891: $C3 $4F $6A

    ld   hl, wEntitiesSubstate1Table              ; $6894: $21 $B0 $C2
    add  hl, bc                                   ; $6897: $09
    ld   a, [hl]                                  ; $6898: $7E
    push af                                       ; $6899: $F5
    rla                                           ; $689A: $17
    and  $06                                      ; $689B: $E6 $06
    ld   e, a                                     ; $689D: $5F
    ld   d, b                                     ; $689E: $50
    ld   hl, $6821                                ; $689F: $21 $21 $68
    add  hl, de                                   ; $68A2: $19
    ld   a, [hl+]                                 ; $68A3: $2A
    ld   d, [hl]                                  ; $68A4: $56
    ld   e, a                                     ; $68A5: $5F
    push bc                                       ; $68A6: $C5
    ld   c, $34                                   ; $68A7: $0E $34
    ld   hl, wRequestDestinationHigh              ; $68A9: $21 $01 $D6

jr_019_68AC:
    ld   a, [de]                                  ; $68AC: $1A
    cp   $98                                      ; $68AD: $FE $98
    jr   nz, jr_019_68BA                          ; $68AF: $20 $09

    ldh  a, [hBaseScrollY]                        ; $68B1: $F0 $97
    and  a                                        ; $68B3: $A7
    ld   a, $98                                   ; $68B4: $3E $98
    jr   z, jr_019_68BA                           ; $68B6: $28 $02

    ld   a, $9A                                   ; $68B8: $3E $9A

jr_019_68BA:
    inc  de                                       ; $68BA: $13
    ld   [hl+], a                                 ; $68BB: $22
    dec  c                                        ; $68BC: $0D
    jr   nz, jr_019_68AC                          ; $68BD: $20 $ED

    ld   [hl], $00                                ; $68BF: $36 $00
    pop  bc                                       ; $68C1: $C1
    pop  af                                       ; $68C2: $F1
    push af                                       ; $68C3: $F5
    rla                                           ; $68C4: $17
    and  $06                                      ; $68C5: $E6 $06
    ld   e, a                                     ; $68C7: $5F
    ld   d, b                                     ; $68C8: $50
    ld   hl, $6831                                ; $68C9: $21 $31 $68
    add  hl, de                                   ; $68CC: $19
    ld   a, [hl+]                                 ; $68CD: $2A
    ld   d, [hl]                                  ; $68CE: $56
    ld   e, a                                     ; $68CF: $5F
    push bc                                       ; $68D0: $C5
    ld   c, $10                                   ; $68D1: $0E $10
    ld   hl, $DC91                                ; $68D3: $21 $91 $DC

jr_019_68D6:
    ld   a, [de]                                  ; $68D6: $1A
    cp   $98                                      ; $68D7: $FE $98
    jr   nz, jr_019_68E4                          ; $68D9: $20 $09

    ldh  a, [hBaseScrollY]                        ; $68DB: $F0 $97
    and  a                                        ; $68DD: $A7
    ld   a, $98                                   ; $68DE: $3E $98
    jr   z, jr_019_68E4                           ; $68E0: $28 $02

    ld   a, $9A                                   ; $68E2: $3E $9A

jr_019_68E4:
    inc  de                                       ; $68E4: $13
    ld   [hl+], a                                 ; $68E5: $22
    dec  c                                        ; $68E6: $0D
    jr   nz, jr_019_68D6                          ; $68E7: $20 $ED

    ld   [hl], $00                                ; $68E9: $36 $00
    pop  bc                                       ; $68EB: $C1
    pop  af                                       ; $68EC: $F1
    cp   $03                                      ; $68ED: $FE $03
    jr   nz, jr_019_68F6                          ; $68EF: $20 $05

    ldh  a, [hNextWorldMusicTrack]                ; $68F1: $F0 $BF
    ld   [wActiveMusicTrack], a                   ; $68F3: $EA $68 $D3

jr_019_68F6:
    jp   IncrementEntityState                     ; $68F6: $C3 $12 $3B

    push bc                                       ; $68F9: $C5
    ld   hl, wEntitiesSubstate1Table              ; $68FA: $21 $B0 $C2
    add  hl, bc                                   ; $68FD: $09
    ld   a, [hl]                                  ; $68FE: $7E
    rla                                           ; $68FF: $17
    and  $06                                      ; $6900: $E6 $06
    ld   e, a                                     ; $6902: $5F
    ld   d, b                                     ; $6903: $50
    ld   hl, $6829                                ; $6904: $21 $29 $68
    add  hl, de                                   ; $6907: $19
    ld   a, [hl+]                                 ; $6908: $2A
    ld   d, [hl]                                  ; $6909: $56
    ld   e, a                                     ; $690A: $5F
    ld   c, $34                                   ; $690B: $0E $34
    ld   hl, wRequestDestinationHigh              ; $690D: $21 $01 $D6

jr_019_6910:
    ld   a, [de]                                  ; $6910: $1A
    cp   $98                                      ; $6911: $FE $98
    jr   nz, jr_019_691E                          ; $6913: $20 $09

    ldh  a, [hBaseScrollY]                        ; $6915: $F0 $97
    and  a                                        ; $6917: $A7
    ld   a, $98                                   ; $6918: $3E $98
    jr   z, jr_019_691E                           ; $691A: $28 $02

    ld   a, $9A                                   ; $691C: $3E $9A

jr_019_691E:
    inc  de                                       ; $691E: $13
    ld   [hl+], a                                 ; $691F: $22
    dec  c                                        ; $6920: $0D
    jr   nz, jr_019_6910                          ; $6921: $20 $ED

    ld   [hl], $00                                ; $6923: $36 $00
    pop  bc                                       ; $6925: $C1
    push bc                                       ; $6926: $C5
    ld   hl, wEntitiesSubstate1Table              ; $6927: $21 $B0 $C2
    add  hl, bc                                   ; $692A: $09
    ld   a, [hl]                                  ; $692B: $7E
    rla                                           ; $692C: $17
    and  $06                                      ; $692D: $E6 $06
    ld   e, a                                     ; $692F: $5F
    ld   d, b                                     ; $6930: $50
    ld   hl, $6839                                ; $6931: $21 $39 $68
    add  hl, de                                   ; $6934: $19
    ld   a, [hl+]                                 ; $6935: $2A
    ld   d, [hl]                                  ; $6936: $56
    ld   e, a                                     ; $6937: $5F
    ld   c, $34                                   ; $6938: $0E $34
    ld   hl, $DC91                                ; $693A: $21 $91 $DC

jr_019_693D:
    ld   a, [de]                                  ; $693D: $1A
    cp   $98                                      ; $693E: $FE $98
    jr   nz, jr_019_694B                          ; $6940: $20 $09

    ldh  a, [hBaseScrollY]                        ; $6942: $F0 $97
    and  a                                        ; $6944: $A7
    ld   a, $98                                   ; $6945: $3E $98
    jr   z, jr_019_694B                           ; $6947: $28 $02

    ld   a, $9A                                   ; $6949: $3E $9A

jr_019_694B:
    inc  de                                       ; $694B: $13
    ld   [hl+], a                                 ; $694C: $22
    dec  c                                        ; $694D: $0D
    jr   nz, jr_019_693D                          ; $694E: $20 $ED

    ld   [hl], $00                                ; $6950: $36 $00
    pop  bc                                       ; $6952: $C1
    ld   hl, wEntitiesSubstate1Table              ; $6953: $21 $B0 $C2
    add  hl, bc                                   ; $6956: $09
    ld   a, [hl]                                  ; $6957: $7E
    inc  a                                        ; $6958: $3C
    ld   [hl], a                                  ; $6959: $77
    cp   $04                                      ; $695A: $FE $04
    jr   z, jr_019_6961                           ; $695C: $28 $03

    jp   label_019_6A3C                           ; $695E: $C3 $3C $6A

jr_019_6961:
    ld   hl, $D712                                ; $6961: $21 $12 $D7
    ld   a, $B3                                   ; $6964: $3E $B3
    ld   [hl+], a                                 ; $6966: $22
    ld   a, $B3                                   ; $6967: $3E $B3
    ld   [hl+], a                                 ; $6969: $22
    ld   a, $B3                                   ; $696A: $3E $B3
    ld   [hl+], a                                 ; $696C: $22
    ld   a, $B3                                   ; $696D: $3E $B3
    ld   [hl+], a                                 ; $696F: $22
    ld   a, $B3                                   ; $6970: $3E $B3
    ld   [hl+], a                                 ; $6972: $22
    ld   hl, $D712                                ; $6973: $21 $12 $D7
    ld   a, $99                                   ; $6976: $3E $99
    call label_B2F                                ; $6978: $CD $2F $0B
    inc  hl                                       ; $697B: $23
    ld   a, $99                                   ; $697C: $3E $99
    call label_B2F                                ; $697E: $CD $2F $0B
    inc  hl                                       ; $6981: $23
    ld   a, $99                                   ; $6982: $3E $99
    call label_B2F                                ; $6984: $CD $2F $0B
    inc  hl                                       ; $6987: $23
    ld   a, $99                                   ; $6988: $3E $99
    call label_B2F                                ; $698A: $CD $2F $0B
    inc  hl                                       ; $698D: $23
    ld   a, $99                                   ; $698E: $3E $99
    call label_B2F                                ; $6990: $CD $2F $0B
    ld   hl, $D722                                ; $6993: $21 $22 $D7
    ld   a, $B3                                   ; $6996: $3E $B3
    ld   [hl+], a                                 ; $6998: $22
    ld   a, $B3                                   ; $6999: $3E $B3
    ld   [hl+], a                                 ; $699B: $22
    ld   a, $B3                                   ; $699C: $3E $B3
    ld   [hl+], a                                 ; $699E: $22
    ld   a, $B3                                   ; $699F: $3E $B3
    ld   [hl+], a                                 ; $69A1: $22
    ld   a, $B3                                   ; $69A2: $3E $B3
    ld   [hl+], a                                 ; $69A4: $22
    ld   hl, $D722                                ; $69A5: $21 $22 $D7
    ld   a, $99                                   ; $69A8: $3E $99
    call label_B2F                                ; $69AA: $CD $2F $0B
    inc  hl                                       ; $69AD: $23
    ld   a, $99                                   ; $69AE: $3E $99
    call label_B2F                                ; $69B0: $CD $2F $0B
    inc  hl                                       ; $69B3: $23
    ld   a, $99                                   ; $69B4: $3E $99
    call label_B2F                                ; $69B6: $CD $2F $0B
    inc  hl                                       ; $69B9: $23
    ld   a, $99                                   ; $69BA: $3E $99
    call label_B2F                                ; $69BC: $CD $2F $0B
    inc  hl                                       ; $69BF: $23
    ld   a, $99                                   ; $69C0: $3E $99
    call label_B2F                                ; $69C2: $CD $2F $0B
    ld   hl, $D732                                ; $69C5: $21 $32 $D7
    ld   a, $AD                                   ; $69C8: $3E $AD
    ld   [hl+], a                                 ; $69CA: $22
    ld   a, $B1                                   ; $69CB: $3E $B1
    ld   [hl+], a                                 ; $69CD: $22
    ld   a, $E7                                   ; $69CE: $3E $E7
    ld   [hl+], a                                 ; $69D0: $22
    ld   a, $AD                                   ; $69D1: $3E $AD
    ld   [hl+], a                                 ; $69D3: $22
    ld   a, $B1                                   ; $69D4: $3E $B1
    ld   [hl+], a                                 ; $69D6: $22
    ld   hl, $D732                                ; $69D7: $21 $32 $D7
    ld   a, $99                                   ; $69DA: $3E $99
    call label_B2F                                ; $69DC: $CD $2F $0B
    inc  hl                                       ; $69DF: $23
    ld   a, $99                                   ; $69E0: $3E $99
    call label_B2F                                ; $69E2: $CD $2F $0B
    inc  hl                                       ; $69E5: $23
    ld   a, $99                                   ; $69E6: $3E $99
    call label_B2F                                ; $69E8: $CD $2F $0B
    inc  hl                                       ; $69EB: $23
    ld   a, $99                                   ; $69EC: $3E $99
    call label_B2F                                ; $69EE: $CD $2F $0B
    inc  hl                                       ; $69F1: $23
    ld   a, $99                                   ; $69F2: $3E $99
    call label_B2F                                ; $69F4: $CD $2F $0B
    ld   hl, $D742                                ; $69F7: $21 $42 $D7
    ld   a, $AE                                   ; $69FA: $3E $AE
    ld   [hl+], a                                 ; $69FC: $22
    ld   a, $B2                                   ; $69FD: $3E $B2
    ld   [hl+], a                                 ; $69FF: $22
    ld   a, $E3                                   ; $6A00: $3E $E3
    ld   [hl+], a                                 ; $6A02: $22
    ld   a, $AE                                   ; $6A03: $3E $AE
    ld   [hl+], a                                 ; $6A05: $22
    ld   a, $B2                                   ; $6A06: $3E $B2
    ld   [hl+], a                                 ; $6A08: $22
    ld   hl, $D742                                ; $6A09: $21 $42 $D7
    ld   a, $99                                   ; $6A0C: $3E $99
    call label_B2F                                ; $6A0E: $CD $2F $0B
    inc  hl                                       ; $6A11: $23
    ld   a, $99                                   ; $6A12: $3E $99
    call label_B2F                                ; $6A14: $CD $2F $0B
    inc  hl                                       ; $6A17: $23
    ld   a, $99                                   ; $6A18: $3E $99
    call label_B2F                                ; $6A1A: $CD $2F $0B
    inc  hl                                       ; $6A1D: $23
    ld   a, $99                                   ; $6A1E: $3E $99
    call label_B2F                                ; $6A20: $CD $2F $0B
    inc  hl                                       ; $6A23: $23
    ld   a, $99                                   ; $6A24: $3E $99
    call label_B2F                                ; $6A26: $CD $2F $0B
    call func_019_7F0E                            ; $6A29: $CD $0E $7F
    set  4, [hl]                                  ; $6A2C: $CB $E6
    xor  a                                        ; $6A2E: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A2F: $EA $55 $C1
    ld   [wC167], a                               ; $6A32: $EA $67 $C1
    ld   a, $02                                   ; $6A35: $3E $02
    ldh  [hJingle], a                             ; $6A37: $E0 $F2
    jp   label_019_7E61                           ; $6A39: $C3 $61 $7E

label_019_6A3C:
    call IncrementEntityState                     ; $6A3C: $CD $12 $3B
    ld   [hl], $01                                ; $6A3F: $36 $01
    call GetEntityTransitionCountdown             ; $6A41: $CD $05 $0C
    ld   [hl], $30                                ; $6A44: $36 $30
    ret                                           ; $6A46: $C9

    jr   jr_019_6AA1                              ; $6A47: $18 $58

    jr   z, @+$4A                                 ; $6A49: $28 $48

    jr   c, jr_019_6A6D                           ; $6A4B: $38 $20

    ld   d, b                                     ; $6A4D: $50
    ld   b, b                                     ; $6A4E: $40

label_019_6A4F:
    ldh  a, [hFrameCounter]                       ; $6A4F: $F0 $E7
    and  $03                                      ; $6A51: $E6 $03
    jr   nz, jr_019_6A8C                          ; $6A53: $20 $37

    ld   a, $A7                                   ; $6A55: $3E $A7
    call SpawnNewEntity_trampoline                ; $6A57: $CD $86 $3B
    jr   c, jr_019_6A8C                           ; $6A5A: $38 $30

    push bc                                       ; $6A5C: $C5
    call GetRandomByte                            ; $6A5D: $CD $0D $28
    and  $07                                      ; $6A60: $E6 $07
    ld   c, a                                     ; $6A62: $4F
    ld   hl, $6A47                                ; $6A63: $21 $47 $6A
    add  hl, bc                                   ; $6A66: $09
    ld   a, [hl]                                  ; $6A67: $7E
    ld   hl, wEntitiesPosXTable                         ; $6A68: $21 $00 $C2
    add  hl, de                                   ; $6A6B: $19
    ld   [hl], a                                  ; $6A6C: $77

jr_019_6A6D:
    call GetRandomByte                            ; $6A6D: $CD $0D $28
    and  $07                                      ; $6A70: $E6 $07
    add  $47                                      ; $6A72: $C6 $47
    ld   hl, wEntitiesPosYTable                         ; $6A74: $21 $10 $C2
    add  hl, de                                   ; $6A77: $19
    ld   [hl], a                                  ; $6A78: $77
    pop  bc                                       ; $6A79: $C1
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6A7A: $21 $40 $C3
    add  hl, de                                   ; $6A7D: $19
    ld   [hl], $C2                                ; $6A7E: $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A80: $21 $E0 $C2
    add  hl, de                                   ; $6A83: $19
    ld   [hl], $10                                ; $6A84: $36 $10
    ld   hl, wEntitiesSubstate1Table              ; $6A86: $21 $B0 $C2
    add  hl, de                                   ; $6A89: $19
    ld   [hl], $01                                ; $6A8A: $36 $01

jr_019_6A8C:
    ret                                           ; $6A8C: $C9

    ld   h, b                                     ; $6A8D: $60
    ld   bc, $0162                                ; $6A8E: $01 $62 $01
    ld   h, d                                     ; $6A91: $62
    ld   hl, $2160                                ; $6A92: $21 $60 $21
    ld   h, h                                     ; $6A95: $64
    ld   bc, $0166                                ; $6A96: $01 $66 $01
    ld   h, [hl]                                  ; $6A99: $66
    ld   hl, $2164                                ; $6A9A: $21 $64 $21
    ld   l, b                                     ; $6A9D: $68
    ld   bc, $016A                                ; $6A9E: $01 $6A $01

jr_019_6AA1:
    ld   l, h                                     ; $6AA1: $6C
    ld   bc, Start.notGBC                         ; $6AA2: $01 $6E $01
    ld   l, d                                     ; $6AA5: $6A
    ld   hl, $2168                                ; $6AA6: $21 $68 $21
    ld   l, [hl]                                  ; $6AA9: $6E
    ld   hl, $216C                                ; $6AAA: $21 $6C $21
    ldh  a, [rNR10]                               ; $6AAD: $F0 $10

MimicEntityHandler::
    ld   hl, wEntitiesUnknownTableC               ; $6AAF: $21 $C0 $C2
    add  hl, bc                                   ; $6AB2: $09
    ld   a, [hl]                                  ; $6AB3: $7E
    and  a                                        ; $6AB4: $A7
    jp   nz, label_019_6841                       ; $6AB5: $C2 $41 $68

    ldh  a, [hMapId]                              ; $6AB8: $F0 $F7
    cp   $0A                                      ; $6ABA: $FE $0A
    jr   nz, jr_019_6ACE                          ; $6ABC: $20 $10

    ldh  a, [hMapRoom]                            ; $6ABE: $F0 $F6
    cp   $97                                      ; $6AC0: $FE $97
    jr   z, jr_019_6AC8                           ; $6AC2: $28 $04

    cp   $98                                      ; $6AC4: $FE $98
    jr   nz, jr_019_6ACE                          ; $6AC6: $20 $06

jr_019_6AC8:
    ld   a, [$DB7F]                               ; $6AC8: $FA $7F $DB
    and  a                                        ; $6ACB: $A7
    jr   nz, jr_019_6AD4                          ; $6ACC: $20 $06

jr_019_6ACE:
    ld   de, $6A8D                                ; $6ACE: $11 $8D $6A
    call RenderAnimatedActiveEntity                               ; $6AD1: $CD $C0 $3B

jr_019_6AD4:
    call func_019_7D3D                            ; $6AD4: $CD $3D $7D
    call func_019_7D6E                            ; $6AD7: $CD $6E $7D
    call label_3B39                               ; $6ADA: $CD $39 $3B
    call func_019_7DB8                            ; $6ADD: $CD $B8 $7D
    call label_3B23                               ; $6AE0: $CD $23 $3B
    ld   a, [wCollisionType]                      ; $6AE3: $FA $33 $C1
    and  a                                        ; $6AE6: $A7
    jr   nz, jr_019_6B41                          ; $6AE7: $20 $58

    ldh  a, [hPressedButtonsMask]                 ; $6AE9: $F0 $CB
    and  $03                                      ; $6AEB: $E6 $03
    jr   z, jr_019_6B11                           ; $6AED: $28 $22

    ld   e, a                                     ; $6AEF: $5F
    ld   d, b                                     ; $6AF0: $50
    ld   hl, $6AAC                                ; $6AF1: $21 $AC $6A
    add  hl, de                                   ; $6AF4: $19
    ld   a, [hl]                                  ; $6AF5: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $6AF6: $21 $40 $C2
    add  hl, bc                                   ; $6AF9: $09
    ld   [hl], a                                  ; $6AFA: $77
    ld   hl, wEntitiesSpeedYTable                       ; $6AFB: $21 $50 $C2
    add  hl, bc                                   ; $6AFE: $09
    ld   [hl], b                                  ; $6AFF: $70
    ld   a, e                                     ; $6B00: $7B
    and  $02                                      ; $6B01: $E6 $02
    add  $04                                      ; $6B03: $C6 $04
    ld   e, a                                     ; $6B05: $5F
    ldh  a, [hFrameCounter]                       ; $6B06: $F0 $E7
    rra                                           ; $6B08: $1F
    rra                                           ; $6B09: $1F
    rra                                           ; $6B0A: $1F
    and  $01                                      ; $6B0B: $E6 $01
    add  e                                        ; $6B0D: $83
    jp   SetEntitySpriteVariant                   ; $6B0E: $C3 $0C $3B

jr_019_6B11:
    ldh  a, [hPressedButtonsMask]                 ; $6B11: $F0 $CB
    and  $0F                                      ; $6B13: $E6 $0F
    jr   z, jr_019_6B41                           ; $6B15: $28 $2A

    rra                                           ; $6B17: $1F
    rra                                           ; $6B18: $1F
    cpl                                           ; $6B19: $2F
    and  $03                                      ; $6B1A: $E6 $03
    ld   e, a                                     ; $6B1C: $5F
    ld   d, b                                     ; $6B1D: $50
    ld   hl, $6AAC                                ; $6B1E: $21 $AC $6A
    add  hl, de                                   ; $6B21: $19
    ld   a, [hl]                                  ; $6B22: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $6B23: $21 $50 $C2
    add  hl, bc                                   ; $6B26: $09
    ld   [hl], a                                  ; $6B27: $77
    ld   hl, wEntitiesSpeedXTable                       ; $6B28: $21 $40 $C2
    add  hl, bc                                   ; $6B2B: $09
    ld   [hl], b                                  ; $6B2C: $70
    ld   a, e                                     ; $6B2D: $7B
    dec  a                                        ; $6B2E: $3D
    xor  $01                                      ; $6B2F: $EE $01
    sra  a                                        ; $6B31: $CB $2F
    rla                                           ; $6B33: $17
    rla                                           ; $6B34: $17
    ld   e, a                                     ; $6B35: $5F
    ldh  a, [hFrameCounter]                       ; $6B36: $F0 $E7
    rra                                           ; $6B38: $1F
    rra                                           ; $6B39: $1F
    rra                                           ; $6B3A: $1F
    and  $01                                      ; $6B3B: $E6 $01
    add  e                                        ; $6B3D: $83
    jp   SetEntitySpriteVariant                   ; $6B3E: $C3 $0C $3B

jr_019_6B41:
    jp   ClearEntitySpeed                               ; $6B41: $C3 $7F $3D

    ld   h, b                                     ; $6B44: $60
    ld   bc, $0162                                ; $6B45: $01 $62 $01
    ld   h, h                                     ; $6B48: $64
    ld   bc, $0166                                ; $6B49: $01 $66 $01
    ld   h, d                                     ; $6B4C: $62
    ld   hl, $2160                                ; $6B4D: $21 $60 $21
    ld   h, [hl]                                  ; $6B50: $66
    ld   hl, $2164                                ; $6B51: $21 $64 $21

CheepCheepHorizontalEntityHandler::
CheepCheepVerticalEntityHandler::
    ld   de, $6B44                                ; $6B54: $11 $44 $6B
    call RenderAnimatedActiveEntity                               ; $6B57: $CD $C0 $3B
    call func_019_7D3D                            ; $6B5A: $CD $3D $7D
    ld   hl, wEntitiesSpeedXTable                       ; $6B5D: $21 $40 $C2
    add  hl, bc                                   ; $6B60: $09
    ld   a, [hl]                                  ; $6B61: $7E
    rlca                                          ; $6B62: $07
    rlca                                          ; $6B63: $07
    and  $02                                      ; $6B64: $E6 $02
    ld   e, a                                     ; $6B66: $5F
    ldh  a, [hFrameCounter]                       ; $6B67: $F0 $E7
    rra                                           ; $6B69: $1F
    rra                                           ; $6B6A: $1F
    rra                                           ; $6B6B: $1F
    and  $01                                      ; $6B6C: $E6 $01
    or   e                                        ; $6B6E: $B3
    call SetEntitySpriteVariant                   ; $6B6F: $CD $0C $3B
    call label_3B39                               ; $6B72: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $6B75: $F0 $F0
    rst  $00                                      ; $6B77: $C7
    ld   a, [hl]                                  ; $6B78: $7E
    ld   l, e                                     ; $6B79: $6B
    and  c                                        ; $6B7A: $A1
    ld   l, e                                     ; $6B7B: $6B
    xor  [hl]                                     ; $6B7C: $AE
    ld   l, e                                     ; $6B7D: $6B
    ld   hl, wEntitiesSpeedXTable                       ; $6B7E: $21 $40 $C2
    ldh  a, [hActiveEntityType]                   ; $6B81: $F0 $EB
    cp   $AA                                      ; $6B83: $FE $AA
    jr   z, jr_019_6B8A                           ; $6B85: $28 $03

    ld   hl, wEntitiesSpeedYTable                       ; $6B87: $21 $50 $C2

jr_019_6B8A:
    add  hl, bc                                   ; $6B8A: $09
    ld   [hl], $08                                ; $6B8B: $36 $08

label_019_6B8D:
    ld   e, $80                                   ; $6B8D: $1E $80
    ldh  a, [hActiveEntityType]                   ; $6B8F: $F0 $EB
    cp   $AA                                      ; $6B91: $FE $AA
    jr   z, jr_019_6B97                           ; $6B93: $28 $02

    ld   e, $60                                   ; $6B95: $1E $60

jr_019_6B97:
    call GetEntityTransitionCountdown             ; $6B97: $CD $05 $0C
    ld   [hl], e                                  ; $6B9A: $73
    call IncrementEntityState                     ; $6B9B: $CD $12 $3B
    ld   [hl], $01                                ; $6B9E: $36 $01
    ret                                           ; $6BA0: $C9

    call GetEntityTransitionCountdown             ; $6BA1: $CD $05 $0C
    jr   nz, jr_019_6BAB                          ; $6BA4: $20 $05

    ld   [hl], $28                                ; $6BA6: $36 $28
    call IncrementEntityState                     ; $6BA8: $CD $12 $3B

jr_019_6BAB:
    jp   label_019_7DB8                           ; $6BAB: $C3 $B8 $7D

    call GetEntityTransitionCountdown             ; $6BAE: $CD $05 $0C
    jr   nz, jr_019_6BC6                          ; $6BB1: $20 $13

    ld   hl, wEntitiesSpeedXTable                       ; $6BB3: $21 $40 $C2
    add  hl, bc                                   ; $6BB6: $09
    ld   a, [hl]                                  ; $6BB7: $7E
    cpl                                           ; $6BB8: $2F
    inc  a                                        ; $6BB9: $3C
    ld   [hl], a                                  ; $6BBA: $77
    ld   hl, wEntitiesSpeedYTable                       ; $6BBB: $21 $50 $C2
    add  hl, bc                                   ; $6BBE: $09
    ld   a, [hl]                                  ; $6BBF: $7E
    cpl                                           ; $6BC0: $2F
    inc  a                                        ; $6BC1: $3C
    ld   [hl], a                                  ; $6BC2: $77
    jp   label_019_6B8D                           ; $6BC3: $C3 $8D $6B

jr_019_6BC6:
    ret                                           ; $6BC6: $C9

CheepCheepJumpingEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $6BC7: $F0 $F0
    cp   $05                                      ; $6BC9: $FE $05
    jr   nz, jr_019_6BD3                          ; $6BCB: $20 $06

    ldh  a, [$FFED]                               ; $6BCD: $F0 $ED
    or   $40                                      ; $6BCF: $F6 $40
    ldh  [$FFED], a                               ; $6BD1: $E0 $ED

jr_019_6BD3:
    ld   de, $6B44                                ; $6BD3: $11 $44 $6B
    call RenderAnimatedActiveEntity                               ; $6BD6: $CD $C0 $3B
    call func_019_7D3D                            ; $6BD9: $CD $3D $7D
    ld   hl, wEntitiesSpeedXTable                       ; $6BDC: $21 $40 $C2
    add  hl, bc                                   ; $6BDF: $09
    ld   a, [hl]                                  ; $6BE0: $7E
    rlca                                          ; $6BE1: $07
    rlca                                          ; $6BE2: $07
    and  $02                                      ; $6BE3: $E6 $02
    ld   e, a                                     ; $6BE5: $5F
    call func_019_7D6E                            ; $6BE6: $CD $6E $7D
    ldh  a, [hActiveEntityState]                  ; $6BE9: $F0 $F0
    cp   $05                                      ; $6BEB: $FE $05
    jr   z, jr_019_6BFD                           ; $6BED: $28 $0E

    ldh  a, [hFrameCounter]                       ; $6BEF: $F0 $E7
    rra                                           ; $6BF1: $1F
    rra                                           ; $6BF2: $1F
    rra                                           ; $6BF3: $1F
    and  $01                                      ; $6BF4: $E6 $01
    or   e                                        ; $6BF6: $B3
    call SetEntitySpriteVariant                   ; $6BF7: $CD $0C $3B
    call label_3B39                               ; $6BFA: $CD $39 $3B

jr_019_6BFD:
    ldh  a, [hActiveEntityState]                  ; $6BFD: $F0 $F0
    rst  $00                                      ; $6BFF: $C7
    inc  c                                        ; $6C00: $0C
    ld   l, h                                     ; $6C01: $6C
    inc  e                                        ; $6C02: $1C
    ld   l, h                                     ; $6C03: $6C
    ld   a, [hl-]                                 ; $6C04: $3A
    ld   l, h                                     ; $6C05: $6C
    ld   l, [hl]                                  ; $6C06: $6E
    ld   l, h                                     ; $6C07: $6C
    add  h                                        ; $6C08: $84
    ld   l, h                                     ; $6C09: $6C
    xor  c                                        ; $6C0A: $A9
    ld   l, h                                     ; $6C0B: $6C
    ld   hl, wEntitiesUnknowTableV                ; $6C0C: $21 $80 $C4
    add  hl, bc                                   ; $6C0F: $09
    ld   [hl], $03                                ; $6C10: $36 $03
    ldh  a, [$FFEF]                               ; $6C12: $F0 $EF
    ld   hl, wEntitiesSubstate1Table              ; $6C14: $21 $B0 $C2
    add  hl, bc                                   ; $6C17: $09
    ld   [hl], a                                  ; $6C18: $77
    jp   IncrementEntityState                     ; $6C19: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $6C1C: $CD $05 $0C
    call GetRandomByte                            ; $6C1F: $CD $0D $28
    and  $7F                                      ; $6C22: $E6 $7F
    add  $30                                      ; $6C24: $C6 $30
    ld   [hl], a                                  ; $6C26: $77
    call GetRandomByte                            ; $6C27: $CD $0D $28
    ld   e, $F4                                   ; $6C2A: $1E $F4
    and  $01                                      ; $6C2C: $E6 $01
    jr   z, jr_019_6C32                           ; $6C2E: $28 $02

    ld   e, $0C                                   ; $6C30: $1E $0C

jr_019_6C32:
    ld   hl, wEntitiesSpeedXTable                       ; $6C32: $21 $40 $C2
    add  hl, bc                                   ; $6C35: $09
    ld   [hl], e                                  ; $6C36: $73
    jp   IncrementEntityState                     ; $6C37: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $6C3A: $CD $05 $0C
    jr   nz, jr_019_6C53                          ; $6C3D: $20 $14

    ld   hl, wEntitiesSpeedYTable                       ; $6C3F: $21 $50 $C2
    add  hl, bc                                   ; $6C42: $09
    ld   [hl], $D4                                ; $6C43: $36 $D4
    ldh  a, [wActiveEntityPosY]                   ; $6C45: $F0 $EC
    sub  $08                                      ; $6C47: $D6 $08
    call func_019_6CD3                            ; $6C49: $CD $D3 $6C
    ld   a, $24                                   ; $6C4C: $3E $24
    ldh  [hJingle], a                             ; $6C4E: $E0 $F2
    jp   IncrementEntityState                     ; $6C50: $C3 $12 $3B

jr_019_6C53:
    call IsEntityUnknownFZero                     ; $6C53: $CD $00 $0C
    jr   nz, jr_019_6C68                          ; $6C56: $20 $10

    call GetRandomByte                            ; $6C58: $CD $0D $28
    and  $3F                                      ; $6C5B: $E6 $3F
    or   $10                                      ; $6C5D: $F6 $10
    ld   [hl], a                                  ; $6C5F: $77
    ld   hl, wEntitiesSpeedXTable                       ; $6C60: $21 $40 $C2
    add  hl, bc                                   ; $6C63: $09
    ld   a, [hl]                                  ; $6C64: $7E
    cpl                                           ; $6C65: $2F
    inc  a                                        ; $6C66: $3C
    ld   [hl], a                                  ; $6C67: $77

jr_019_6C68:
    call func_019_7DC5                            ; $6C68: $CD $C5 $7D
    jp   label_3B23                               ; $6C6B: $C3 $23 $3B

    call GetEntityTransitionCountdown             ; $6C6E: $CD $05 $0C
    ret  nz                                       ; $6C71: $C0

    call func_019_7DBB                            ; $6C72: $CD $BB $7D
    call func_019_6C99                            ; $6C75: $CD $99 $6C
    ld   hl, wEntitiesSpeedYTable                       ; $6C78: $21 $50 $C2
    add  hl, bc                                   ; $6C7B: $09
    inc  [hl]                                     ; $6C7C: $34
    ld   a, [hl]                                  ; $6C7D: $7E
    cp   $18                                      ; $6C7E: $FE $18
    ret  nz                                       ; $6C80: $C0

    jp   IncrementEntityState                     ; $6C81: $C3 $12 $3B

    ld   hl, wEntitiesSubstate1Table              ; $6C84: $21 $B0 $C2
    add  hl, bc                                   ; $6C87: $09
    ld   a, [hl]                                  ; $6C88: $7E
    ld   hl, wEntitiesPosYTable                         ; $6C89: $21 $10 $C2
    add  hl, bc                                   ; $6C8C: $09
    cp   [hl]                                     ; $6C8D: $BE
    jr   nc, jr_019_6C96                          ; $6C8E: $30 $06

    call IncrementEntityState                     ; $6C90: $CD $12 $3B
    ld   [hl], $01                                ; $6C93: $36 $01
    ret                                           ; $6C95: $C9

jr_019_6C96:
    call func_019_7DBB                            ; $6C96: $CD $BB $7D

func_019_6C99:
jr_019_6C99:
    ld   hl, wEntitiesUnknowTableH                ; $6C99: $21 $30 $C4
    add  hl, bc                                   ; $6C9C: $09
    set  0, [hl]                                  ; $6C9D: $CB $C6
    call label_3B23                               ; $6C9F: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableH                ; $6CA2: $21 $30 $C4
    add  hl, bc                                   ; $6CA5: $09
    res  0, [hl]                                  ; $6CA6: $CB $86
    ret                                           ; $6CA8: $C9

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6CA9: $21 $40 $C3
    add  hl, bc                                   ; $6CAC: $09
    set  7, [hl]                                  ; $6CAD: $CB $FE
    set  6, [hl]                                  ; $6CAF: $CB $F6
    ld   hl, wEntitiesSpeedYTable                       ; $6CB1: $21 $50 $C2
    add  hl, bc                                   ; $6CB4: $09
    inc  [hl]                                     ; $6CB5: $34
    push hl                                       ; $6CB6: $E5
    ld   hl, wEntitiesUnknowTableI                ; $6CB7: $21 $70 $C4
    add  hl, bc                                   ; $6CBA: $09
    ld   a, [hl]                                  ; $6CBB: $7E
    pop  hl                                       ; $6CBC: $E1
    and  a                                        ; $6CBD: $A7
    jr   z, jr_019_6CC2                           ; $6CBE: $28 $02

    ld   [hl], $06                                ; $6CC0: $36 $06

jr_019_6CC2:
    call func_019_7DBB                            ; $6CC2: $CD $BB $7D
    ldh  a, [wActiveEntityPosY]                   ; $6CC5: $F0 $EC
    cp   $70                                      ; $6CC7: $FE $70
    jr   c, jr_019_6C99                           ; $6CC9: $38 $CE

    cp   $88                                      ; $6CCB: $FE $88
    jp   nc, label_019_7E61                       ; $6CCD: $D2 $61 $7E

    ret                                           ; $6CD0: $C9

    ldh  a, [wActiveEntityPosY]                   ; $6CD1: $F0 $EC

func_019_6CD3:
    ldh  [hScratch1], a                           ; $6CD3: $E0 $D8
    ldh  a, [wActiveEntityPosX]                   ; $6CD5: $F0 $EE
    ldh  [hScratch0], a                           ; $6CD7: $E0 $D7
    ld   a, $01                                   ; $6CD9: $3E $01
    call label_CC7                                ; $6CDB: $CD $C7 $0C
    ld   a, $0E                                   ; $6CDE: $3E $0E
    ldh  [hJingle], a                             ; $6CE0: $E0 $F2
    ret                                           ; $6CE2: $C9

    sbc  d                                        ; $6CE3: $9A
    dec  d                                        ; $6CE4: $15
    sbc  h                                        ; $6CE5: $9C
    dec  d                                        ; $6CE6: $15

label_019_6CE7:
    ld   de, $6CE3                                ; $6CE7: $11 $E3 $6C
    call RenderAnimatedActiveEntity                               ; $6CEA: $CD $C0 $3B
    call func_019_7DF1                            ; $6CED: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $6CF0: $21 $20 $C3
    add  hl, bc                                   ; $6CF3: $09
    dec  [hl]                                     ; $6CF4: $35
    ld   hl, wEntitiesPosZTable                   ; $6CF5: $21 $10 $C3
    add  hl, bc                                   ; $6CF8: $09
    ld   a, [hl]                                  ; $6CF9: $7E
    and  $80                                      ; $6CFA: $E6 $80
    jp   nz, label_019_7E61                       ; $6CFC: $C2 $61 $7E

    ret                                           ; $6CFF: $C9

label_019_6D00:
    push bc                                       ; $6D00: $C5
    sla  c                                        ; $6D01: $CB $21
    sla  c                                        ; $6D03: $CB $21
    ld   hl, wEntitiesHitboxPositionTable                                ; $6D05: $21 $80 $D5
    add  hl, bc                                   ; $6D08: $09
    ld   a, $0B                                   ; $6D09: $3E $0B
    ld   [hl+], a                                 ; $6D0B: $22
    ld   a, $09                                   ; $6D0C: $3E $09
    ld   [hl+], a                                 ; $6D0E: $22
    ld   a, $08                                   ; $6D0F: $3E $08
    ld   [hl+], a                                 ; $6D11: $22
    ld   a, $0B                                   ; $6D12: $3E $0B
    ld   [hl], a                                  ; $6D14: $77
    pop  bc                                       ; $6D15: $C1
    ld   hl, wEntitiesSubstate1Table              ; $6D16: $21 $B0 $C2
    add  hl, bc                                   ; $6D19: $09
    ld   a, [hl]                                  ; $6D1A: $7E
    and  a                                        ; $6D1B: $A7
    jp   nz, label_019_6CE7                       ; $6D1C: $C2 $E7 $6C

    call func_019_6EC5                            ; $6D1F: $CD $C5 $6E
    call func_019_7CA2                            ; $6D22: $CD $A2 $7C
    ld   a, [wGameplayType]                       ; $6D25: $FA $95 $DB
    cp   $0B                                      ; $6D28: $FE $0B
    ret  nz                                       ; $6D2A: $C0

    ld   a, [wTransitionSequenceCounter]          ; $6D2B: $FA $6B $C1
    cp   $04                                      ; $6D2E: $FE $04
    ret  nz                                       ; $6D30: $C0

    ldh  a, [hActiveEntityState]                  ; $6D31: $F0 $F0
    rst  $00                                      ; $6D33: $C7
    inc  a                                        ; $6D34: $3C
    ld   l, l                                     ; $6D35: $6D
    ld   [hl], d                                  ; $6D36: $72
    ld   l, l                                     ; $6D37: $6D
    adc  e                                        ; $6D38: $8B
    ld   l, l                                     ; $6D39: $6D
    ldh  [$FF6D], a                               ; $6D3A: $E0 $6D
    call func_019_7CF0                            ; $6D3C: $CD $F0 $7C
    jr   nc, jr_019_6D67                          ; $6D3F: $30 $26

    ld   e, $CD                                   ; $6D41: $1E $CD
    ldh  a, [hRoomStatus]                         ; $6D43: $F0 $F8
    and  $20                                      ; $6D45: $E6 $20
    jr   nz, jr_019_6D63                          ; $6D47: $20 $1A

    ld   e, $CC                                   ; $6D49: $1E $CC
    ld   a, [$DAFE]                               ; $6D4B: $FA $FE $DA
    and  $20                                      ; $6D4E: $E6 $20
    jr   nz, jr_019_6D63                          ; $6D50: $20 $11

    ld   e, $C6                                   ; $6D52: $1E $C6
    ld   a, [wTradeSequenceItem]                  ; $6D54: $FA $0E $DB
    cp   $03                                      ; $6D57: $FE $03
    jr   nz, jr_019_6D63                          ; $6D59: $20 $08

    call_open_dialog $1C7                         ; $6D5B
    jp   IncrementEntityState                     ; $6D60: $C3 $12 $3B

jr_019_6D63:
    ld   a, e                                     ; $6D63: $7B
    call OpenDialogInTable1                       ; $6D64: $CD $73 $23

jr_019_6D67:
    ldh  a, [hFrameCounter]                       ; $6D67: $F0 $E7
    rra                                           ; $6D69: $1F
    rra                                           ; $6D6A: $1F
    rra                                           ; $6D6B: $1F
    rra                                           ; $6D6C: $1F
    and  $01                                      ; $6D6D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6D6F: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $6D72: $FA $9F $C1
    and  a                                        ; $6D75: $A7
    ret  nz                                       ; $6D76: $C0

    call IncrementEntityState                     ; $6D77: $CD $12 $3B
    ld   a, [wC177]                               ; $6D7A: $FA $77 $C1
    and  a                                        ; $6D7D: $A7
    jr   z, jr_019_6D86                           ; $6D7E: $28 $06

    ld   [hl], b                                  ; $6D80: $70
    jp_open_dialog $1C9                           ; $6D81

jr_019_6D86:
    jp_open_dialog $1C8                           ; $6D86

    ld   a, [wDialogState]                        ; $6D8B: $FA $9F $C1
    and  a                                        ; $6D8E: $A7
    ret  nz                                       ; $6D8F: $C0

    ld   a, $CD                                   ; $6D90: $3E $CD
    call SpawnNewEntity_trampoline                ; $6D92: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $6D95: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $6D97: $21 $00 $C2
    add  hl, de                                   ; $6D9A: $19
    sub  $02                                      ; $6D9B: $D6 $02
    ld   [hl], a                                  ; $6D9D: $77
    ldh  a, [hScratch1]                           ; $6D9E: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $6DA0: $21 $10 $C2
    add  hl, de                                   ; $6DA3: $19
    ld   [hl], a                                  ; $6DA4: $77
    ld   hl, wEntitiesSubstate1Table              ; $6DA5: $21 $B0 $C2
    add  hl, de                                   ; $6DA8: $19
    ld   [hl], $01                                ; $6DA9: $36 $01
    ld   hl, wEntitiesSpeedZTable                 ; $6DAB: $21 $20 $C3
    add  hl, de                                   ; $6DAE: $19
    ld   [hl], $20                                ; $6DAF: $36 $20
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6DB1: $21 $40 $C3
    add  hl, de                                   ; $6DB4: $19
    ld   [hl], $C2                                ; $6DB5: $36 $C2
    ld   a, $24                                   ; $6DB7: $3E $24
    ldh  [hJingle], a                             ; $6DB9: $E0 $F2
    ldh  a, [hIsGBC]                              ; $6DBB: $F0 $FE
    and  a                                        ; $6DBD: $A7
    jr   z, jr_019_6DD4                           ; $6DBE: $28 $14

    ld   hl, $DC7A                                ; $6DC0: $21 $7A $DC
    ld   a, $FF                                   ; $6DC3: $3E $FF
    ld   [hl+], a                                 ; $6DC5: $22
    ld   a, $7F                                   ; $6DC6: $3E $7F
    ld   [hl+], a                                 ; $6DC8: $22
    ld   a, $31                                   ; $6DC9: $3E $31
    ld   [hl+], a                                 ; $6DCB: $22
    ld   a, $52                                   ; $6DCC: $3E $52
    ld   [hl+], a                                 ; $6DCE: $22
    ld   a, $02                                   ; $6DCF: $3E $02
    ld   [wPaletteDataFlags], a                    ; $6DD1: $EA $D1 $DD

jr_019_6DD4:
    call GetEntityTransitionCountdown             ; $6DD4: $CD $05 $0C
    ld   [hl], $C0                                ; $6DD7: $36 $C0
    jp   IncrementEntityState                     ; $6DD9: $C3 $12 $3B

    nop                                           ; $6DDC: $00
    ld   bc, $0102                                ; $6DDD: $01 $02 $01
    ld   a, $02                                   ; $6DE0: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6DE2: $E0 $A1
    ld   [wC167], a                               ; $6DE4: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $6DE7: $CD $05 $0C
    jr   nz, jr_019_6E01                          ; $6DEA: $20 $15

    xor  a                                        ; $6DEC: $AF
    ld   [wC167], a                               ; $6DED: $EA $67 $C1
    ld   a, $04                                   ; $6DF0: $3E $04
    ld   [wTradeSequenceItem], a                  ; $6DF2: $EA $0E $DB
    ld   a, $0D                                   ; $6DF5: $3E $0D
    ldh  [hFFA5], a                               ; $6DF7: $E0 $A5
    call CreateTradingItemEntity                                ; $6DF9: $CD $0C $0C
    call IncrementEntityState                     ; $6DFC: $CD $12 $3B
    ld   [hl], b                                  ; $6DFF: $70
    ret                                           ; $6E00: $C9

jr_019_6E01:
    cp   $80                                      ; $6E01: $FE $80
    jr   c, jr_019_6E0A                           ; $6E03: $38 $05

    ld   a, $03                                   ; $6E05: $3E $03
    jp   SetEntitySpriteVariant                   ; $6E07: $C3 $0C $3B

jr_019_6E0A:
    cp   $08                                      ; $6E0A: $FE $08
    jr   nz, jr_019_6E14                          ; $6E0C: $20 $06

    dec  [hl]                                     ; $6E0E: $35
    call_open_dialog $1CA                         ; $6E0F

jr_019_6E14:
    ldh  a, [hFrameCounter]                       ; $6E14: $F0 $E7
    rra                                           ; $6E16: $1F
    rra                                           ; $6E17: $1F
    rra                                           ; $6E18: $1F
    and  $03                                      ; $6E19: $E6 $03
    ld   e, a                                     ; $6E1B: $5F
    ld   d, b                                     ; $6E1C: $50
    ld   hl, $6DDC                                ; $6E1D: $21 $DC $6D
    add  hl, de                                   ; $6E20: $19
    ld   a, [hl]                                  ; $6E21: $7E
    jp   SetEntitySpriteVariant                   ; $6E22: $C3 $0C $3B

    nop                                           ; $6E25: $00
    nop                                           ; $6E26: $00
    ld   d, b                                     ; $6E27: $50
    inc  bc                                       ; $6E28: $03
    nop                                           ; $6E29: $00
    ld   [$0352], sp                              ; $6E2A: $08 $52 $03
    nop                                           ; $6E2D: $00
    db   $10                                      ; $6E2E: $10
    ld   d, h                                     ; $6E2F: $54
    inc  bc                                       ; $6E30: $03
    stop                                          ; $6E31: $10 $00
    ld   d, [hl]                                  ; $6E33: $56
    inc  bc                                       ; $6E34: $03
    db   $10                                      ; $6E35: $10
    ld   [$0358], sp                              ; $6E36: $08 $58 $03
    db   $10                                      ; $6E39: $10
    db   $10                                      ; $6E3A: $10
    ld   e, d                                     ; $6E3B: $5A
    inc  bc                                       ; $6E3C: $03
    rst  $38                                      ; $6E3D: $FF
    rst  $38                                      ; $6E3E: $FF
    rst  $38                                      ; $6E3F: $FF
    rst  $38                                      ; $6E40: $FF
    rst  $38                                      ; $6E41: $FF
    rst  $38                                      ; $6E42: $FF
    rst  $38                                      ; $6E43: $FF
    rst  $38                                      ; $6E44: $FF
    nop                                           ; $6E45: $00
    nop                                           ; $6E46: $00
    ld   d, b                                     ; $6E47: $50
    inc  bc                                       ; $6E48: $03
    nop                                           ; $6E49: $00
    ld   [$0352], sp                              ; $6E4A: $08 $52 $03
    nop                                           ; $6E4D: $00
    db   $10                                      ; $6E4E: $10
    ld   e, h                                     ; $6E4F: $5C
    inc  bc                                       ; $6E50: $03
    stop                                          ; $6E51: $10 $00
    ld   d, [hl]                                  ; $6E53: $56
    inc  bc                                       ; $6E54: $03
    db   $10                                      ; $6E55: $10
    ld   [$0358], sp                              ; $6E56: $08 $58 $03
    db   $10                                      ; $6E59: $10
    db   $10                                      ; $6E5A: $10
    ld   e, [hl]                                  ; $6E5B: $5E
    inc  bc                                       ; $6E5C: $03
    db   $10                                      ; $6E5D: $10
    jr   jr_019_6EC0                              ; $6E5E: $18 $60

    inc  bc                                       ; $6E60: $03
    rst  $38                                      ; $6E61: $FF
    rst  $38                                      ; $6E62: $FF
    rst  $38                                      ; $6E63: $FF
    rst  $38                                      ; $6E64: $FF
    nop                                           ; $6E65: $00
    nop                                           ; $6E66: $00
    ld   h, d                                     ; $6E67: $62
    inc  bc                                       ; $6E68: $03
    nop                                           ; $6E69: $00
    ld   [$0364], sp                              ; $6E6A: $08 $64 $03
    nop                                           ; $6E6D: $00
    db   $10                                      ; $6E6E: $10
    ld   h, [hl]                                  ; $6E6F: $66
    inc  bc                                       ; $6E70: $03
    stop                                          ; $6E71: $10 $00
    ld   l, b                                     ; $6E73: $68
    inc  bc                                       ; $6E74: $03
    db   $10                                      ; $6E75: $10
    ld   [$0358], sp                              ; $6E76: $08 $58 $03
    db   $10                                      ; $6E79: $10
    db   $10                                      ; $6E7A: $10
    ld   e, [hl]                                  ; $6E7B: $5E
    inc  bc                                       ; $6E7C: $03
    db   $10                                      ; $6E7D: $10
    jr   @+$62                                    ; $6E7E: $18 $60

    inc  bc                                       ; $6E80: $03
    rst  $38                                      ; $6E81: $FF
    rst  $38                                      ; $6E82: $FF
    rst  $38                                      ; $6E83: $FF
    rst  $38                                      ; $6E84: $FF
    nop                                           ; $6E85: $00
    nop                                           ; $6E86: $00
    ld   l, d                                     ; $6E87: $6A
    inc  bc                                       ; $6E88: $03
    nop                                           ; $6E89: $00
    ld   [$036C], sp                              ; $6E8A: $08 $6C $03
    nop                                           ; $6E8D: $00
    db   $10                                      ; $6E8E: $10
    ld   l, [hl]                                  ; $6E8F: $6E
    inc  bc                                       ; $6E90: $03
    stop                                          ; $6E91: $10 $00
    ld   l, b                                     ; $6E93: $68
    inc  bc                                       ; $6E94: $03
    db   $10                                      ; $6E95: $10
    ld   [$0358], sp                              ; $6E96: $08 $58 $03
    db   $10                                      ; $6E99: $10
    db   $10                                      ; $6E9A: $10
    ld   e, [hl]                                  ; $6E9B: $5E
    inc  bc                                       ; $6E9C: $03
    db   $10                                      ; $6E9D: $10
    jr   @+$62                                    ; $6E9E: $18 $60

    inc  bc                                       ; $6EA0: $03
    rst  $38                                      ; $6EA1: $FF
    rst  $38                                      ; $6EA2: $FF
    rst  $38                                      ; $6EA3: $FF
    rst  $38                                      ; $6EA4: $FF
    stop                                          ; $6EA5: $10 $00
    ld   [hl], h                                  ; $6EA7: $74
    rlca                                          ; $6EA8: $07
    db   $10                                      ; $6EA9: $10
    ld   [$0776], sp                              ; $6EAA: $08 $76 $07
    db   $10                                      ; $6EAD: $10
    db   $10                                      ; $6EAE: $10
    ld   [hl], h                                  ; $6EAF: $74
    rlca                                          ; $6EB0: $07
    db   $10                                      ; $6EB1: $10
    jr   @+$78                                    ; $6EB2: $18 $76

    rlca                                          ; $6EB4: $07
    nop                                           ; $6EB5: $00
    db   $10                                      ; $6EB6: $10
    ld   [hl], h                                  ; $6EB7: $74
    rlca                                          ; $6EB8: $07
    nop                                           ; $6EB9: $00
    jr   @+$78                                    ; $6EBA: $18 $76

    rlca                                          ; $6EBC: $07
    nop                                           ; $6EBD: $00
    nop                                           ; $6EBE: $00
    ld   [hl], h                                  ; $6EBF: $74

jr_019_6EC0:
    rlca                                          ; $6EC0: $07
    nop                                           ; $6EC1: $00
    ld   [$0776], sp                              ; $6EC2: $08 $76 $07

func_019_6EC5:
    ldh  a, [hActiveEntitySpriteVariant]               ; $6EC5: $F0 $F1
    rla                                           ; $6EC7: $17
    rla                                           ; $6EC8: $17
    rla                                           ; $6EC9: $17
    rla                                           ; $6ECA: $17
    rla                                           ; $6ECB: $17
    and  $E0                                      ; $6ECC: $E6 $E0
    ld   e, a                                     ; $6ECE: $5F
    ld   d, b                                     ; $6ECF: $50
    ld   hl, $6E25                                ; $6ED0: $21 $25 $6E
    add  hl, de                                   ; $6ED3: $19
    ldh  a, [wActiveEntityPosX]                   ; $6ED4: $F0 $EE
    add  $03                                      ; $6ED6: $C6 $03
    ldh  [wActiveEntityPosX], a                   ; $6ED8: $E0 $EE
    ld   c, $07                                   ; $6EDA: $0E $07
    call label_3CE6                               ; $6EDC: $CD $E6 $3C
    ld   a, $02                                   ; $6EDF: $3E $02
    call label_3DA0                               ; $6EE1: $CD $A0 $3D
    ld   a, $78                                   ; $6EE4: $3E $78
    ldh  [wActiveEntityPosX], a                   ; $6EE6: $E0 $EE
    ld   a, $5C                                   ; $6EE8: $3E $5C
    ldh  [wActiveEntityPosY], a                   ; $6EEA: $E0 $EC
    ld   hl, $6EA5                                ; $6EEC: $21 $A5 $6E
    ld   c, $08                                   ; $6EEF: $0E $08
    ld   a, [wTradeSequenceItem]                  ; $6EF1: $FA $0E $DB
    cp   $04                                      ; $6EF4: $FE $04
    jr   nz, jr_019_6EFA                          ; $6EF6: $20 $02

    dec  c                                        ; $6EF8: $0D
    dec  c                                        ; $6EF9: $0D

jr_019_6EFA:
    call label_3CE6                               ; $6EFA: $CD $E6 $3C
    ld   a, $03                                   ; $6EFD: $3E $03
    call label_3DA0                               ; $6EFF: $CD $A0 $3D
    jp   label_3D8A                               ; $6F02: $C3 $8A $3D

    ld   [$7004], sp                              ; $6F05: $08 $04 $70
    ld   bc, IsZero                               ; $6F08: $01 $08 $0C
    ld   [hl], d                                  ; $6F0B: $72
    ld   bc, $1408                                ; $6F0C: $01 $08 $14
    ld   [hl], b                                  ; $6F0F: $70
    db   $21                                      ; $6F10: $21

BananasSchuleSaleEntityHandler::
    db   $FA, $A5, $DB
    and  a                                        ; $6F14: $A7
    jr   nz, jr_019_6F25                          ; $6F15: $20 $0E

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6F17: $21 $40 $C3
    add  hl, bc                                   ; $6F1A: $09
    ld   [hl], $C3                                ; $6F1B: $36 $C3
    ld   hl, $6F05                                ; $6F1D: $21 $05 $6F
    ld   c, $03                                   ; $6F20: $0E $03
    jp   label_3CE6                               ; $6F22: $C3 $E6 $3C

jr_019_6F25:
    ldh  a, [hMapRoom]                            ; $6F25: $F0 $F6
    cp   $FE                                      ; $6F27: $FE $FE
    jp   z, label_019_6D00                        ; $6F29: $CA $00 $6D

    ldh  a, [wActiveEntityPosX]                   ; $6F2C: $F0 $EE
    cp   $30                                      ; $6F2E: $FE $30
    jp   c, label_019_70A9                        ; $6F30: $DA $A9 $70

    ldh  a, [hActiveEntityState]                  ; $6F33: $F0 $F0
    and  a                                        ; $6F35: $A7
    jr   nz, jr_019_6F66                          ; $6F36: $20 $2E

    call IncrementEntityState                     ; $6F38: $CD $12 $3B
    ld   hl, wEntitiesPosYTable                         ; $6F3B: $21 $10 $C2
    add  hl, bc                                   ; $6F3E: $09
    ld   [hl], $48                                ; $6F3F: $36 $48
    ld   hl, wEntitiesPosXTable                         ; $6F41: $21 $00 $C2
    add  hl, bc                                   ; $6F44: $09
    ld   a, [hl]                                  ; $6F45: $7E
    sub  $04                                      ; $6F46: $D6 $04
    ld   [hl], a                                  ; $6F48: $77
    ld   a, $CD                                   ; $6F49: $3E $CD
    call SpawnNewEntity_trampoline                ; $6F4B: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $6F4E: $21 $00 $C2
    add  hl, de                                   ; $6F51: $19
    ld   [hl], $28                                ; $6F52: $36 $28
    ld   hl, wEntitiesPosYTable                         ; $6F54: $21 $10 $C2
    add  hl, de                                   ; $6F57: $19
    ld   [hl], $28                                ; $6F58: $36 $28
    ld   hl, wEntitiesSubstate1Table              ; $6F5A: $21 $B0 $C2
    add  hl, de                                   ; $6F5D: $19
    ld   [hl], $01                                ; $6F5E: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $6F60: $21 $E0 $C2
    add  hl, de                                   ; $6F63: $19
    ld   [hl], $40                                ; $6F64: $36 $40

jr_019_6F66:
    push bc                                       ; $6F66: $C5
    sla  c                                        ; $6F67: $CB $21
    sla  c                                        ; $6F69: $CB $21
    ld   hl, wEntitiesHitboxPositionTable                                ; $6F6B: $21 $80 $D5
    add  hl, bc                                   ; $6F6E: $09
    ld   a, $0A                                   ; $6F6F: $3E $0A
    ld   [hl+], a                                 ; $6F71: $22
    ld   a, $08                                   ; $6F72: $3E $08
    ld   [hl+], a                                 ; $6F74: $22
    ld   a, $FF                                   ; $6F75: $3E $FF
    ld   [hl+], a                                 ; $6F77: $22
    ld   a, $09                                   ; $6F78: $3E $09
    ld   [hl], a                                  ; $6F7A: $77
    pop  bc                                       ; $6F7B: $C1
    call $7039                                    ; $6F7C: $CD $39 $70
    call func_019_7CA2                            ; $6F7F: $CD $A2 $7C
    ldh  a, [hActiveEntityState]                  ; $6F82: $F0 $F0
    rst  $00                                      ; $6F84: $C7
    adc  e                                        ; $6F85: $8B
    ld   l, a                                     ; $6F86: $6F
    adc  h                                        ; $6F87: $8C
    ld   l, a                                     ; $6F88: $6F
    push bc                                       ; $6F89: $C5
    ld   l, a                                     ; $6F8A: $6F
    ret                                           ; $6F8B: $C9

    call label_BFB                                ; $6F8C: $CD $FB $0B
    ret  nz                                       ; $6F8F: $C0

    call func_019_7CF0                            ; $6F90: $CD $F0 $7C
    jr   nc, jr_019_6FB8                          ; $6F93: $30 $23

    ld   a, [wTradeSequenceItem]                  ; $6F95: $FA $0E $DB
    cp   $0D                                      ; $6F98: $FE $0D
    jr   nz, jr_019_6FA0                          ; $6F9A: $20 $04

    ld   a, $8F                                   ; $6F9C: $3E $8F
    jr   jr_019_6FAD                              ; $6F9E: $18 $0D

jr_019_6FA0:
    cp   $0E                                      ; $6FA0: $FE $0E
    jr   nz, jr_019_6FAB                          ; $6FA2: $20 $07

    call_open_dialog $0D8                         ; $6FA4
    jr   jr_019_6FB0                              ; $6FA9: $18 $05

jr_019_6FAB:
    ld   a, $9B                                   ; $6FAB: $3E $9B

jr_019_6FAD:
    call OpenDialogInTable1                       ; $6FAD: $CD $73 $23

jr_019_6FB0:
    ld   hl, wDialogState                         ; $6FB0: $21 $9F $C1
    set  7, [hl]                                  ; $6FB3: $CB $FE
    call IncrementEntityState                     ; $6FB5: $CD $12 $3B

jr_019_6FB8:
    ldh  a, [hFrameCounter]                       ; $6FB8: $F0 $E7
    ld   e, $00                                   ; $6FBA: $1E $00
    and  $20                                      ; $6FBC: $E6 $20
    jr   z, jr_019_6FC1                           ; $6FBE: $28 $01

    inc  e                                        ; $6FC0: $1C

jr_019_6FC1:
    ld   a, e                                     ; $6FC1: $7B
    jp   SetEntitySpriteVariant                   ; $6FC2: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $6FC5: $FA $9F $C1
    and  a                                        ; $6FC8: $A7
    jr   nz, jr_019_6FD0                          ; $6FC9: $20 $05

    call IncrementEntityState                     ; $6FCB: $CD $12 $3B
    ld   [hl], $01                                ; $6FCE: $36 $01

jr_019_6FD0:
    call func_019_7E0B                            ; $6FD0: $CD $0B $7E
    ld   a, e                                     ; $6FD3: $7B
    add  $02                                      ; $6FD4: $C6 $02
    jp   SetEntitySpriteVariant                   ; $6FD6: $C3 $0C $3B

    ld   hl, sp-$08                               ; $6FD9: $F8 $F8
    ld   e, d                                     ; $6FDB: $5A
    ld   [bc], a                                  ; $6FDC: $02
    ld   hl, sp+$00                               ; $6FDD: $F8 $00
    ld   e, h                                     ; $6FDF: $5C
    ld   [bc], a                                  ; $6FE0: $02
    ld   hl, sp+$08                               ; $6FE1: $F8 $08
    ld   e, [hl]                                  ; $6FE3: $5E
    ld   [bc], a                                  ; $6FE4: $02
    ld   [$6000], sp                              ; $6FE5: $08 $00 $60
    ld   [bc], a                                  ; $6FE8: $02
    ld   [$6208], sp                              ; $6FE9: $08 $08 $62
    ld   [bc], a                                  ; $6FEC: $02
    ld   hl, sp+$10                               ; $6FED: $F8 $10
    ld   e, d                                     ; $6FEF: $5A
    ld   [hl+], a                                 ; $6FF0: $22
    ld   hl, sp+$00                               ; $6FF1: $F8 $00
    ld   e, [hl]                                  ; $6FF3: $5E
    ld   [hl+], a                                 ; $6FF4: $22
    ld   hl, sp+$08                               ; $6FF5: $F8 $08
    ld   e, h                                     ; $6FF7: $5C
    ld   [hl+], a                                 ; $6FF8: $22
    ld   [$6200], sp                              ; $6FF9: $08 $00 $62
    ld   [hl+], a                                 ; $6FFC: $22
    ld   [$6008], sp                              ; $6FFD: $08 $08 $60
    ld   [hl+], a                                 ; $7000: $22
    nop                                           ; $7001: $00
    db   $10                                      ; $7002: $10
    ld   d, b                                     ; $7003: $50
    ld   [hl+], a                                 ; $7004: $22
    ld   hl, sp+$00                               ; $7005: $F8 $00
    ld   d, h                                     ; $7007: $54
    ld   [hl+], a                                 ; $7008: $22
    ld   hl, sp+$08                               ; $7009: $F8 $08
    ld   d, d                                     ; $700B: $52
    ld   [hl+], a                                 ; $700C: $22
    ld   [$5800], sp                              ; $700D: $08 $00 $58
    ld   [hl+], a                                 ; $7010: $22
    ld   [$5608], sp                              ; $7011: $08 $08 $56
    ld   [hl+], a                                 ; $7014: $22
    nop                                           ; $7015: $00
    ld   hl, sp+$50                               ; $7016: $F8 $50
    ld   [bc], a                                  ; $7018: $02
    ld   hl, sp+$00                               ; $7019: $F8 $00
    ld   d, d                                     ; $701B: $52
    ld   [bc], a                                  ; $701C: $02
    ld   hl, sp+$08                               ; $701D: $F8 $08
    ld   d, h                                     ; $701F: $54
    ld   [bc], a                                  ; $7020: $02
    ld   [$5600], sp                              ; $7021: $08 $00 $56
    ld   [bc], a                                  ; $7024: $02
    ld   [$5808], sp                              ; $7025: $08 $08 $58
    ld   [bc], a                                  ; $7028: $02
    ldh  a, [rP1]                                 ; $7029: $F0 $00
    db   $76                                      ; $702B: $76
    ld   bc, Func_020_6BA4_trampoline                            ; $702C: $01 $F0 $08
    db   $76                                      ; $702F: $76
    ld   hl, $0000                                ; $7030: $21 $00 $00
    ld   a, b                                     ; $7033: $78
    ld   bc, $800                            ; $7034: $01 $00 $08
    ld   a, b                                     ; $7037: $78
    ld   hl, $F1F0                                ; $7038: $21 $F0 $F1
    rla                                           ; $703B: $17
    rla                                           ; $703C: $17
    and  $FC                                      ; $703D: $E6 $FC
    ld   e, a                                     ; $703F: $5F
    rla                                           ; $7040: $17
    rla                                           ; $7041: $17
    and  $F0                                      ; $7042: $E6 $F0
    add  e                                        ; $7044: $83
    ld   e, a                                     ; $7045: $5F
    ld   d, b                                     ; $7046: $50
    ld   hl, $6FD9                                ; $7047: $21 $D9 $6F
    add  hl, de                                   ; $704A: $19
    ldh  a, [wActiveEntityPosX]                   ; $704B: $F0 $EE
    add  $04                                      ; $704D: $C6 $04
    ldh  [wActiveEntityPosX], a                   ; $704F: $E0 $EE
    ld   c, $05                                   ; $7051: $0E $05
    call label_3CE6                               ; $7053: $CD $E6 $3C
    ldh  a, [wActiveEntityPosX]                   ; $7056: $F0 $EE
    add  $10                                      ; $7058: $C6 $10
    ldh  [wActiveEntityPosX], a                   ; $705A: $E0 $EE
    ld   hl, $7029                                ; $705C: $21 $29 $70
    ld   c, $04                                   ; $705F: $0E $04
    call label_3CE6                               ; $7061: $CD $E6 $3C
    call func_019_7CA2                            ; $7064: $CD $A2 $7C
    ldh  a, [hLinkPositionX]                      ; $7067: $F0 $98
    sub  $68                                      ; $7069: $D6 $68
    add  $04                                      ; $706B: $C6 $04
    cp   $08                                      ; $706D: $FE $08
    jr   nc, jr_019_70A6                          ; $706F: $30 $35

    ldh  a, [hLinkPositionY]                      ; $7071: $F0 $99
    sub  $50                                      ; $7073: $D6 $50
    add  $04                                      ; $7075: $C6 $04
    cp   $08                                      ; $7077: $FE $08
    jr   nc, jr_019_70A6                          ; $7079: $30 $2B

    ldh  a, [hLinkDirection]                      ; $707B: $F0 $9E
    cp   $02                                      ; $707D: $FE $02
    jr   nz, jr_019_70A6                          ; $707F: $20 $25

    call func_019_7D16                            ; $7081: $CD $16 $7D
    jr   nc, jr_019_70A6                          ; $7084: $30 $20

    call label_BFB                                ; $7086: $CD $FB $0B
    jr   nz, jr_019_70A6                          ; $7089: $20 $1B

    ld   a, [wTransitionSequenceCounter]          ; $708B: $FA $6B $C1
    cp   $04                                      ; $708E: $FE $04
    jr   nz, jr_019_70A6                          ; $7090: $20 $14

    ld   a, $08                                   ; $7092: $3E $08
    ld   [wGameplayType], a                       ; $7094: $EA $95 $DB
    xor  a                                        ; $7097: $AF
    ld   [wTransitionSequenceCounter], a          ; $7098: $EA $6B $C1
    ld   [wC16C], a                               ; $709B: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $709E: $EA $96 $DB
    call label_BFB                                ; $70A1: $CD $FB $0B
    ld   [hl], $08                                ; $70A4: $36 $08

jr_019_70A6:
    jp   label_3D8A                               ; $70A6: $C3 $8A $3D

label_019_70A9:
    push bc                                       ; $70A9: $C5
    sla  c                                        ; $70AA: $CB $21
    sla  c                                        ; $70AC: $CB $21
    ld   hl, wEntitiesHitboxPositionTable                                ; $70AE: $21 $80 $D5
    add  hl, bc                                   ; $70B1: $09
    inc  hl                                       ; $70B2: $23
    inc  hl                                       ; $70B3: $23
    inc  hl                                       ; $70B4: $23
    ld   a, $09                                   ; $70B5: $3E $09
    ld   [hl], a                                  ; $70B7: $77
    pop  bc                                       ; $70B8: $C1
    call GetEntityTransitionCountdown             ; $70B9: $CD $05 $0C
    jr   z, jr_019_70C2                           ; $70BC: $28 $04

    ld   a, $00                                   ; $70BE: $3E $00
    ldh  [hActiveEntitySpriteVariant], a               ; $70C0: $E0 $F1

jr_019_70C2:
    call func_019_717C                            ; $70C2: $CD $7C $71
    call func_019_7CA2                            ; $70C5: $CD $A2 $7C
    ld   hl, wEntitiesDirectionTable              ; $70C8: $21 $80 $C3
    add  hl, bc                                   ; $70CB: $09
    ldh  a, [hFrameCounter]                       ; $70CC: $F0 $E7
    rra                                           ; $70CE: $1F
    rra                                           ; $70CF: $1F
    rra                                           ; $70D0: $1F
    and  $01                                      ; $70D1: $E6 $01
    inc  a                                        ; $70D3: $3C
    add  [hl]                                     ; $70D4: $86
    call SetEntitySpriteVariant                   ; $70D5: $CD $0C $3B
    call func_019_7E1B                            ; $70D8: $CD $1B $7E
    add  $13                                      ; $70DB: $C6 $13
    cp   $26                                      ; $70DD: $FE $26
    jr   nc, jr_019_70F2                          ; $70DF: $30 $11

    call func_019_7E0B                            ; $70E1: $CD $0B $7E
    add  $13                                      ; $70E4: $C6 $13
    cp   $26                                      ; $70E6: $FE $26
    jr   nc, jr_019_70F2                          ; $70E8: $30 $08

    ld   a, e                                     ; $70EA: $7B
    sla  a                                        ; $70EB: $CB $27
    ld   hl, wEntitiesDirectionTable              ; $70ED: $21 $80 $C3
    add  hl, bc                                   ; $70F0: $09
    ld   [hl], a                                  ; $70F1: $77

jr_019_70F2:
    call func_019_7CF0                            ; $70F2: $CD $F0 $7C
    ret  nc                                       ; $70F5: $D0

    ld   hl, wEntitiesUnknowTableY                ; $70F6: $21 $D0 $C3
    add  hl, bc                                   ; $70F9: $09
    ld   a, [hl]                                  ; $70FA: $7E
    inc  [hl]                                     ; $70FB: $34
    and  $01                                      ; $70FC: $E6 $01
    jr   z, jr_019_7112                           ; $70FE: $28 $12

    ld   e, $AF                                   ; $7100: $1E $AF
    call GetRandomByte                            ; $7102: $CD $0D $28
    and  $3F                                      ; $7105: $E6 $3F
    jr   z, jr_019_7114                           ; $7107: $28 $0B

    ld   e, $FB                                   ; $7109: $1E $FB
    call GetRandomByte                            ; $710B: $CD $0D $28
    and  $07                                      ; $710E: $E6 $07
    jr   z, jr_019_7114                           ; $7110: $28 $02

jr_019_7112:
    ld   e, $FA                                   ; $7112: $1E $FA

jr_019_7114:
    ld   a, e                                     ; $7114: $7B
    jp   OpenDialog                               ; $7115: $C3 $85 $23

    db   $F4                                      ; $7118: $F4
    nop                                           ; $7119: $00
    ld   h, h                                     ; $711A: $64
    inc  bc                                       ; $711B: $03
    db   $F4                                      ; $711C: $F4
    ld   [$0366], sp                              ; $711D: $08 $66 $03
    inc  b                                        ; $7120: $04
    nop                                           ; $7121: $00
    ld   l, b                                     ; $7122: $68
    inc  bc                                       ; $7123: $03
    inc  b                                        ; $7124: $04
    ld   [$036A], sp                              ; $7125: $08 $6A $03
    rst  $38                                      ; $7128: $FF
    rst  $38                                      ; $7129: $FF
    rst  $38                                      ; $712A: $FF
    rst  $38                                      ; $712B: $FF
    inc  b                                        ; $712C: $04
    ld   hl, sp+$70                               ; $712D: $F8 $70
    inc  bc                                       ; $712F: $03
    db   $F4                                      ; $7130: $F4
    nop                                           ; $7131: $00
    ld   l, h                                     ; $7132: $6C
    inc  bc                                       ; $7133: $03
    db   $F4                                      ; $7134: $F4
    ld   [$036E], sp                              ; $7135: $08 $6E $03
    inc  b                                        ; $7138: $04
    nop                                           ; $7139: $00
    ld   [hl], d                                  ; $713A: $72
    inc  bc                                       ; $713B: $03
    inc  b                                        ; $713C: $04
    ld   [WaitForNextFrame.pollNeedsRenderingFrame], sp; $713D: $08 $74 $03
    inc  b                                        ; $7140: $04
    ld   hl, sp+$7A                               ; $7141: $F8 $7A
    inc  bc                                       ; $7143: $03
    db   $F4                                      ; $7144: $F4
    nop                                           ; $7145: $00
    ld   l, h                                     ; $7146: $6C
    inc  bc                                       ; $7147: $03
    db   $F4                                      ; $7148: $F4
    ld   [$036E], sp                              ; $7149: $08 $6E $03
    inc  b                                        ; $714C: $04
    nop                                           ; $714D: $00
    ld   a, h                                     ; $714E: $7C
    inc  bc                                       ; $714F: $03
    inc  b                                        ; $7150: $04
    ld   [WaitForNextFrame.pollNeedsRenderingFrame], sp; $7151: $08 $74 $03
    inc  b                                        ; $7154: $04
    db   $10                                      ; $7155: $10
    ld   [hl], b                                  ; $7156: $70
    inc  hl                                       ; $7157: $23
    db   $F4                                      ; $7158: $F4
    nop                                           ; $7159: $00
    ld   l, [hl]                                  ; $715A: $6E
    inc  hl                                       ; $715B: $23
    db   $F4                                      ; $715C: $F4
    ld   [$236C], sp                              ; $715D: $08 $6C $23
    inc  b                                        ; $7160: $04
    nop                                           ; $7161: $00
    ld   [hl], h                                  ; $7162: $74
    inc  hl                                       ; $7163: $23
    inc  b                                        ; $7164: $04
    ld   [$2372], sp                              ; $7165: $08 $72 $23
    inc  b                                        ; $7168: $04
    db   $10                                      ; $7169: $10
    ld   a, d                                     ; $716A: $7A
    inc  hl                                       ; $716B: $23
    db   $F4                                      ; $716C: $F4
    nop                                           ; $716D: $00
    ld   l, [hl]                                  ; $716E: $6E
    inc  hl                                       ; $716F: $23
    db   $F4                                      ; $7170: $F4
    ld   [$236C], sp                              ; $7171: $08 $6C $23
    inc  b                                        ; $7174: $04
    nop                                           ; $7175: $00
    ld   [hl], h                                  ; $7176: $74
    inc  hl                                       ; $7177: $23
    inc  b                                        ; $7178: $04
    ld   [OpenDialogInTable2], sp                 ; $7179: $08 $7C $23

func_019_717C:
    ldh  a, [hActiveEntitySpriteVariant]               ; $717C: $F0 $F1
    rla                                           ; $717E: $17
    rla                                           ; $717F: $17
    and  $FC                                      ; $7180: $E6 $FC
    ld   e, a                                     ; $7182: $5F
    rla                                           ; $7183: $17
    rla                                           ; $7184: $17
    and  $F0                                      ; $7185: $E6 $F0
    add  e                                        ; $7187: $83
    ld   e, a                                     ; $7188: $5F
    ld   d, b                                     ; $7189: $50
    ld   hl, $7118                                ; $718A: $21 $18 $71
    add  hl, de                                   ; $718D: $19
    ld   c, $05                                   ; $718E: $0E $05
    jp   label_3CE6                               ; $7190: $C3 $E6 $3C

    nop                                           ; $7193: $00
    ld   b, $0C                                   ; $7194: $06 $0C
    inc  de                                       ; $7196: $13
    add  hl, de                                   ; $7197: $19
    jr   nz, jr_019_71C0                          ; $7198: $20 $26

    inc  l                                        ; $719A: $2C
    inc  sp                                       ; $719B: $33
    add  hl, sp                                   ; $719C: $39
    nop                                           ; $719D: $00
    nop                                           ; $719E: $00
    nop                                           ; $719F: $00
    nop                                           ; $71A0: $00
    nop                                           ; $71A1: $00
    nop                                           ; $71A2: $00
    ld   b, b                                     ; $71A3: $40
    ld   b, e                                     ; $71A4: $43
    ld   b, [hl]                                  ; $71A5: $46
    ld   c, c                                     ; $71A6: $49
    ld   c, h                                     ; $71A7: $4C
    ld   c, a                                     ; $71A8: $4F
    ld   d, d                                     ; $71A9: $52
    ld   d, l                                     ; $71AA: $55
    ld   e, b                                     ; $71AB: $58
    ld   e, h                                     ; $71AC: $5C
    nop                                           ; $71AD: $00
    nop                                           ; $71AE: $00
    nop                                           ; $71AF: $00
    nop                                           ; $71B0: $00
    nop                                           ; $71B1: $00
    nop                                           ; $71B2: $00
    ld   h, b                                     ; $71B3: $60
    ld   h, b                                     ; $71B4: $60
    ld   h, b                                     ; $71B5: $60
    ld   h, b                                     ; $71B6: $60
    ld   h, b                                     ; $71B7: $60
    ld   h, b                                     ; $71B8: $60
    ld   h, b                                     ; $71B9: $60
    ld   h, b                                     ; $71BA: $60
    ld   h, b                                     ; $71BB: $60

SeashellMansionEntityHandler::
    ld   hl, wEntitiesSubstate1Table              ; $71BC: $21 $B0 $C2
    add  hl, bc                                   ; $71BF: $09

jr_019_71C0:
    ld   a, [hl]                                  ; $71C0: $7E
    cp   $02                                      ; $71C1: $FE $02
    jp   z, $787D                                 ; $71C3: $CA $7D $78

    and  a                                        ; $71C6: $A7
    jp   nz, label_019_74D8                       ; $71C7: $C2 $D8 $74

    ld   a, [wSeashellsCount]                     ; $71CA: $FA$0F $DB
    cp   $20                                      ; $71CD: $FE $20
    jr   z, jr_019_71FD                           ; $71CF: $28 $2C

    cp   $05                                      ; $71D1: $FE $05
    jr   nc, jr_019_71FD                          ; $71D3: $30 $28

    ld   hl, wEntitiesUnknowTableR                ; $71D5: $21 $90 $C3
    add  hl, bc                                   ; $71D8: $09
    ld   a, [hl]                                  ; $71D9: $7E
    and  $02                                      ; $71DA: $E6 $02
    jr   nz, jr_019_71FD                          ; $71DC: $20 $1F

    ldh  a, [hLinkPositionX]                      ; $71DE: $F0 $98
    cp   $18                                      ; $71E0: $FE $18
    jr   c, jr_019_71FD                           ; $71E2: $38 $19

    ld   a, [hl]                                  ; $71E4: $7E
    and  a                                        ; $71E5: $A7
    jr   nz, jr_019_71F6                          ; $71E6: $20 $0E

    ld   a, [wSwordLevel]                         ; $71E8: $FA $4E $DB
    and  $02                                      ; $71EB: $E6 $02
    jr   nz, jr_019_71FD                          ; $71ED: $20 $0E

    call_open_dialog $179                         ; $71EF
    inc  [hl]                                     ; $71F4: $34
    ret                                           ; $71F5: $C9

jr_019_71F6:
    ld   a, [wDialogState]                        ; $71F6: $FA $9F $C1
    and  a                                        ; $71F9: $A7
    ret  nz                                       ; $71FA: $C0

    inc  [hl]                                     ; $71FB: $34
    ret                                           ; $71FC: $C9

jr_019_71FD:
    ldh  a, [hLinkPositionX]                      ; $71FD: $F0 $98
    cp   $38                                      ; $71FF: $FE $38
    jr   nc, jr_019_7215                          ; $7201: $30 $12

    cp   $20                                      ; $7203: $FE $20
    jr   c, jr_019_7215                           ; $7205: $38 $0E

    ld   hl, wC11E                                ; $7207: $21 $1E $C1
    set  7, [hl]                                  ; $720A: $CB $FE
    cp   $24                                      ; $720C: $FE $24
    jr   c, jr_019_7215                           ; $720E: $38 $05

    ld   hl, wC11D                                ; $7210: $21 $1D $C1
    set  7, [hl]                                  ; $7213: $CB $FE

jr_019_7215:
    ld   a, [wSeashellsCount]                     ; $7215: $FA $0F $DB
    and  a                                        ; $7218: $A7
    ret  z                                        ; $7219: $C8

    ld   e, a                                     ; $721A: $5F
    ld   d, b                                     ; $721B: $50
    ld   hl, $7193                                ; $721C: $21 $93 $71
    add  hl, de                                   ; $721F: $19
    ld   a, [hl]                                  ; $7220: $7E
    ldh  [hFFE8], a                               ; $7221: $E0 $E8
    ldh  a, [hRoomStatus]                         ; $7223: $F0 $F8
    and  $10                                      ; $7225: $E6 $10
    call func_019_73BD                            ; $7227: $CD $BD $73
    ldh  a, [hActiveEntityState]                  ; $722A: $F0 $F0
    rst  $00                                      ; $722C: $C7
    ld   b, c                                     ; $722D: $41
    ld   [hl], d                                  ; $722E: $72
    ld   d, [hl]                                  ; $722F: $56
    ld   [hl], d                                  ; $7230: $72
    ld   h, e                                     ; $7231: $63
    ld   [hl], d                                  ; $7232: $72
    sbc  e                                        ; $7233: $9B
    ld   [hl], d                                  ; $7234: $72
    rlca                                          ; $7235: $07
    ld   [hl], e                                  ; $7236: $73
    jr   z, jr_019_72AC                           ; $7237: $28 $73

    scf                                           ; $7239: $37
    ld   [hl], e                                  ; $723A: $73
    ld   [hl], h                                  ; $723B: $74
    ld   [hl], e                                  ; $723C: $73
    ld   [hl], l                                  ; $723D: $75
    ld   [hl], e                                  ; $723E: $73
    add  d                                        ; $723F: $82
    ld   [hl], e                                  ; $7240: $73
    ldh  a, [hLinkPositionX]                      ; $7241: $F0 $98
    cp   $3C                                      ; $7243: $FE $3C
    jr   c, jr_019_7255                           ; $7245: $38 $0E

    call ClearLinkPositionIncrement               ; $7247: $CD $8E $17
    call ResetSpinAttack                                ; $724A: $CD $AF $0C
    call IncrementEntityState                     ; $724D: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7250: $CD $05 $0C
    ld   [hl], $58                                ; $7253: $36 $58

jr_019_7255:
    ret                                           ; $7255: $C9

    ld   a, $01                                   ; $7256: $3E $01
    ld   [wC167], a                               ; $7258: $EA $67 $C1
    ld   a, [$C146]                               ; $725B: $FA $46 $C1
    and  a                                        ; $725E: $A7
    jp   z, IncrementEntityState            ; $725F: $CA $12 $3B

    ret                                           ; $7262: $C9

    ld   a, $02                                   ; $7263: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7265: $E0 $A1
    call GetEntityTransitionCountdown             ; $7267: $CD $05 $0C
    ret  nz                                       ; $726A: $C0

    ld   hl, wEntitiesUnknowTableY                ; $726B: $21 $D0 $C3
    add  hl, bc                                   ; $726E: $09
    ldh  a, [hFFE8]                               ; $726F: $F0 $E8
    sub  [hl]                                     ; $7271: $96
    jr   nc, jr_019_727A                          ; $7272: $30 $06

    ldh  a, [hFFE8]                               ; $7274: $F0 $E8
    ld   [hl], a                                  ; $7276: $77
    jp   IncrementEntityState                     ; $7277: $C3 $12 $3B

jr_019_727A:
    ld   e, a                                     ; $727A: $5F
    ldh  a, [hFrameCounter]                       ; $727B: $F0 $E7
    and  $03                                      ; $727D: $E6 $03
    jr   nz, jr_019_729A                          ; $727F: $20 $19

    call GetRandomByte                            ; $7281: $CD $0D $28
    and  $01                                      ; $7284: $E6 $01
    jr   nz, jr_019_729A                          ; $7286: $20 $12

    ld   a, e                                     ; $7288: $7B
    rra                                           ; $7289: $1F
    rra                                           ; $728A: $1F
    rra                                           ; $728B: $1F
    rra                                           ; $728C: $1F
    and  $0F                                      ; $728D: $E6 $0F
    and  a                                        ; $728F: $A7
    jr   nz, jr_019_7294                          ; $7290: $20 $02

    ld   a, $01                                   ; $7292: $3E $01

jr_019_7294:
    add  [hl]                                     ; $7294: $86
    ld   [hl], a                                  ; $7295: $77
    ld   a, $06                                   ; $7296: $3E $06
    ldh  [hWaveSfx], a                            ; $7298: $E0 $F3

jr_019_729A:
    ret                                           ; $729A: $C9

    ld   a, $02                                   ; $729B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $729D: $E0 $A1
    ld   [wC167], a                               ; $729F: $EA $67 $C1
    ld   a, [wSeashellsCount]                     ; $72A2: $FA $0F $DB
    cp   $20                                      ; $72A5: $FE $20
    jr   c, jr_019_72C9                           ; $72A7: $38 $20

    call GetEntityTransitionCountdown             ; $72A9: $CD $05 $0C

jr_019_72AC:
    ld   [hl], $40                                ; $72AC: $36 $40
    call IncrementEntityState                     ; $72AE: $CD $12 $3B
    call func_019_7921                            ; $72B1: $CD $21 $79
    ld   hl, wEntitiesUnknownTableC               ; $72B4: $21 $C0 $C2
    add  hl, bc                                   ; $72B7: $09
    ld   [hl], $01                                ; $72B8: $36 $01
    ld   a, $56                                   ; $72BA: $3E $56
    ld   [wActiveMusicTrack], a                   ; $72BC: $EA $68 $D3

label_019_72BF:
    xor  a                                        ; $72BF: $AF
    ld   [wC167], a                               ; $72C0: $EA $67 $C1
    call IsEntityUnknownFZero                     ; $72C3: $CD $00 $0C
    ld   [hl], $3F                                ; $72C6: $36 $3F
    ret                                           ; $72C8: $C9

jr_019_72C9:
    ld   hl, $DAE9                                ; $72C9: $21 $E9 $DA
    cp   $05                                      ; $72CC: $FE $05
    jr   nz, jr_019_72E0                          ; $72CE: $20 $10

    bit  5, [hl]                                  ; $72D0: $CB $6E
    jr   nz, jr_019_72F4                          ; $72D2: $20 $20

    call IncrementEntityState                     ; $72D4: $CD $12 $3B
    ld   [hl], $06                                ; $72D7: $36 $06
    ld   a, $23                                   ; $72D9: $3E $23
    ldh  [hJingle], a                             ; $72DB: $E0 $F2
    jp   label_019_72BF                           ; $72DD: $C3 $BF $72

jr_019_72E0:
    cp   $10                                      ; $72E0: $FE $10
    jr   nz, jr_019_72F4                          ; $72E2: $20 $10

    bit  6, [hl]                                  ; $72E4: $CB $76
    jr   nz, jr_019_72F4                          ; $72E6: $20 $0C

    call IncrementEntityState                     ; $72E8: $CD $12 $3B
    ld   [hl], $06                                ; $72EB: $36 $06
    ld   a, $23                                   ; $72ED: $3E $23
    ldh  [hJingle], a                             ; $72EF: $E0 $F2
    jp   label_019_72BF                           ; $72F1: $C3 $BF $72

jr_019_72F4:
    ld   a, $1D                                   ; $72F4: $3E $1D
    ldh  [hJingle], a                             ; $72F6: $E0 $F2
    call IncrementEntityState                     ; $72F8: $CD $12 $3B
    ld   [hl], $05                                ; $72FB: $36 $05
    call IsEntityUnknownFZero                     ; $72FD: $CD $00 $0C
    ld   [hl], $3F                                ; $7300: $36 $3F
    xor  a                                        ; $7302: $AF
    ld   [wC167], a                               ; $7303: $EA $67 $C1
    ret                                           ; $7306: $C9

    ld   a, $02                                   ; $7307: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7309: $E0 $A1
    ld   [wC167], a                               ; $730B: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $730E: $CD $05 $0C
    cp   $3E                                      ; $7311: $FE $3E
    jr   nz, jr_019_731A                          ; $7313: $20 $05

    ld   hl, hJingle                              ; $7315: $21 $F2 $FF
    ld   [hl], $23                                ; $7318: $36 $23

jr_019_731A:
    and  a                                        ; $731A: $A7
    jr   nz, jr_019_7327                          ; $731B: $20 $0A

    call_open_dialog $17B                         ; $731D
    call IncrementEntityState                     ; $7322: $CD $12 $3B
    ld   [hl], $08                                ; $7325: $36 $08

jr_019_7327:
    ret                                           ; $7327: $C9

    call IsEntityUnknownFZero                     ; $7328: $CD $00 $0C
    ret  nz                                       ; $732B: $C0

    call_open_dialog $17A                         ; $732C
    call IncrementEntityState                     ; $7331: $CD $12 $3B
    ld   [hl], $07                                ; $7334: $36 $07
    ret                                           ; $7336: $C9

    call IsEntityUnknownFZero                     ; $7337: $CD $00 $0C
    jr   nz, jr_019_7373                          ; $733A: $20 $37

    call IncrementEntityState                     ; $733C: $CD $12 $3B
    ld   a, $CF                                   ; $733F: $3E $CF
    call SpawnNewEntity_trampoline                ; $7341: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $7344: $21 $00 $C2
    add  hl, de                                   ; $7347: $19
    ld   [hl], $50                                ; $7348: $36 $50
    ld   hl, wEntitiesPosYTable                         ; $734A: $21 $10 $C2
    add  hl, de                                   ; $734D: $19
    ld   [hl], $48                                ; $734E: $36 $48
    ld   hl, wEntitiesSubstate1Table              ; $7350: $21 $B0 $C2
    add  hl, de                                   ; $7353: $19
    ld   [hl], $02                                ; $7354: $36 $02
    ld   hl, wEntitiesTransitionCountdownTable    ; $7356: $21 $E0 $C2
    add  hl, de                                   ; $7359: $19
    ld   [hl], $14                                ; $735A: $36 $14
    ld   a, $02                                   ; $735C: $3E $02
    call SpawnNewEntity_trampoline                ; $735E: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $7361: $21 $00 $C2
    add  hl, de                                   ; $7364: $19
    ld   [hl], $50                                ; $7365: $36 $50
    ld   hl, wEntitiesPosYTable                         ; $7367: $21 $10 $C2
    add  hl, de                                   ; $736A: $19
    ld   [hl], $48                                ; $736B: $36 $48
    ld   hl, wEntitiesTransitionCountdownTable    ; $736D: $21 $E0 $C2
    add  hl, de                                   ; $7370: $19
    ld   [hl], $20                                ; $7371: $36 $20

jr_019_7373:
    ret                                           ; $7373: $C9

    ret                                           ; $7374: $C9

    ld   a, [wDialogState]                        ; $7375: $FA $9F $C1
    and  a                                        ; $7378: $A7
    ret  nz                                       ; $7379: $C0

    call IsEntityUnknownFZero                     ; $737A: $CD $00 $0C
    ld   [hl], $20                                ; $737D: $36 $20
    jp   IncrementEntityState                     ; $737F: $C3 $12 $3B

    call IsEntityUnknownFZero                     ; $7382: $CD $00 $0C
    ret  nz                                       ; $7385: $C0

    ld   a, $CF                                   ; $7386: $3E $CF
    call SpawnNewEntity_trampoline                ; $7388: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $738B: $21 $00 $C2
    add  hl, de                                   ; $738E: $19
    ld   [hl], $50                                ; $738F: $36 $50
    ld   hl, wEntitiesPosYTable                         ; $7391: $21 $10 $C2
    add  hl, de                                   ; $7394: $19
    ld   [hl], $48                                ; $7395: $36 $48
    ld   hl, wEntitiesSubstate1Table              ; $7397: $21 $B0 $C2
    add  hl, de                                   ; $739A: $19
    ld   [hl], $01                                ; $739B: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $739D: $21 $E0 $C2
    add  hl, de                                   ; $73A0: $19
    ld   [hl], $4F                                ; $73A1: $36 $4F
    call IncrementEntityState                     ; $73A3: $CD $12 $3B
    ld   [hl], $07                                ; $73A6: $36 $07
    ret                                           ; $73A8: $C9

    ld   d, b                                     ; $73A9: $50
    nop                                           ; $73AA: $00
    ld   d, b                                     ; $73AB: $50
    jr   nz, jr_019_73EA                          ; $73AC: $20 $3C

    nop                                           ; $73AE: $00
    inc  a                                        ; $73AF: $3C
    jr   nz, jr_019_73EC                          ; $73B0: $20 $3A

    nop                                           ; $73B2: $00
    ld   a, [hl-]                                 ; $73B3: $3A
    jr   nz, @+$20                                ; $73B4: $20 $1E

    nop                                           ; $73B6: $00
    ld   e, $60                                   ; $73B7: $1E $60
    ld   e, $10                                   ; $73B9: $1E $10
    ld   e, $70                                   ; $73BB: $1E $70

func_019_73BD:
    ld   hl, wEntitiesUnknownTableC               ; $73BD: $21 $C0 $C2
    add  hl, bc                                   ; $73C0: $09
    ld   a, [hl]                                  ; $73C1: $7E
    and  a                                        ; $73C2: $A7
    jr   nz, jr_019_73EE                          ; $73C3: $20 $29

    ld   a, $88                                   ; $73C5: $3E $88
    ldh  [wActiveEntityPosX], a                   ; $73C7: $E0 $EE
    ld   a, $80                                   ; $73C9: $3E $80
    ldh  [wActiveEntityPosY], a                   ; $73CB: $E0 $EC
    ld   de, $73A9                                ; $73CD: $11 $A9 $73
    call RenderAnimatedActiveEntity                               ; $73D0: $CD $C0 $3B
    ld   hl, wEntitiesUnknowTableY                ; $73D3: $21 $D0 $C3
    add  hl, bc                                   ; $73D6: $09
    ld   a, [hl]                                  ; $73D7: $7E
    ld   e, a                                     ; $73D8: $5F
    ld   a, $80                                   ; $73D9: $3E $80
    sub  e                                        ; $73DB: $93
    ldh  [wActiveEntityPosY], a                   ; $73DC: $E0 $EC

jr_019_73DE:
    ld   de, $73A9                                ; $73DE: $11 $A9 $73
    call RenderAnimatedActiveEntity                               ; $73E1: $CD $C0 $3B
    ldh  a, [wActiveEntityPosY]                   ; $73E4: $F0 $EC
    add  $10                                      ; $73E6: $C6 $10
    ldh  [wActiveEntityPosY], a                   ; $73E8: $E0 $EC

jr_019_73EA:
    cp   $80                                      ; $73EA: $FE $80

jr_019_73EC:
    jr   c, jr_019_73DE                           ; $73EC: $38 $F0

jr_019_73EE:
    call IsEntityUnknownFZero                     ; $73EE: $CD $00 $0C
    ret  z                                        ; $73F1: $C8

    rra                                           ; $73F2: $1F
    rra                                           ; $73F3: $1F
    rra                                           ; $73F4: $1F
    and  $03                                      ; $73F5: $E6 $03
    ldh  [hActiveEntitySpriteVariant], a               ; $73F7: $E0 $F1
    ld   hl, wEntitiesUnknowTableY                ; $73F9: $21 $D0 $C3
    add  hl, bc                                   ; $73FC: $09
    ld   a, [hl]                                  ; $73FD: $7E
    ld   e, a                                     ; $73FE: $5F
    ld   a, $80                                   ; $73FF: $3E $80
    sub  e                                        ; $7401: $93
    ldh  [wActiveEntityPosY], a                   ; $7402: $E0 $EC
    ld   a, $78                                   ; $7404: $3E $78
    ldh  [wActiveEntityPosX], a                   ; $7406: $E0 $EE
    ld   de, $73AD                                ; $7408: $11 $AD $73
    call RenderAnimatedActiveEntity                               ; $740B: $CD $C0 $3B
    ld   a, $98                                   ; $740E: $3E $98
    ldh  [wActiveEntityPosX], a                   ; $7410: $E0 $EE
    ld   de, $73AD                                ; $7412: $11 $AD $73
    jp   RenderAnimatedActiveEntity                               ; $7415: $C3 $C0 $3B

    ret  c                                        ; $7418: $D8

    add  sp, $7C                                  ; $7419: $E8 $7C
    ld   b, b                                     ; $741B: $40
    ret  c                                        ; $741C: $D8

    ldh  a, [$FF7C]                               ; $741D: $F0 $7C
    jr   nz, @-$16                                ; $741F: $20 $E8

jr_019_7421:
    add  sp, $7C                                  ; $7421: $E8 $7C
    nop                                           ; $7423: $00
    add  sp, -$10                                 ; $7424: $E8 $F0
    ld   a, h                                     ; $7426: $7C
    ld   h, b                                     ; $7427: $60
    ld   hl, sp-$08                               ; $7428: $F8 $F8
    ld   a, h                                     ; $742A: $7C
    nop                                           ; $742B: $00
    ld   hl, sp+$00                               ; $742C: $F8 $00
    ld   a, h                                     ; $742E: $7C
    ld   h, b                                     ; $742F: $60
    ld   [$7C08], sp                              ; $7430: $08 $08 $7C
    nop                                           ; $7433: $00
    ld   [$7C10], sp                              ; $7434: $08 $10 $7C
    ld   h, b                                     ; $7437: $60
    jr   jr_019_7452                              ; $7438: $18 $18

    ld   a, h                                     ; $743A: $7C
    nop                                           ; $743B: $00
    jr   jr_019_745E                              ; $743C: $18 $20

    ld   a, h                                     ; $743E: $7C
    ld   h, b                                     ; $743F: $60
    jr   z, jr_019_745A                           ; $7440: $28 $18

    ld   a, h                                     ; $7442: $7C
    ld   b, b                                     ; $7443: $40
    jr   z, @+$22                                 ; $7444: $28 $20

    ld   a, h                                     ; $7446: $7C
    jr   nz, jr_019_7421                          ; $7447: $20 $D8

    ld   hl, sp+$7C                               ; $7449: $F8 $7C
    nop                                           ; $744B: $00
    ret  c                                        ; $744C: $D8

    nop                                           ; $744D: $00
    ld   a, h                                     ; $744E: $7C
    ld   h, b                                     ; $744F: $60
    add  sp, $08                                  ; $7450: $E8 $08

jr_019_7452:
    ld   a, h                                     ; $7452: $7C
    nop                                           ; $7453: $00
    add  sp, $10                                  ; $7454: $E8 $10
    ld   a, h                                     ; $7456: $7C
    ld   h, b                                     ; $7457: $60
    ld   hl, sp+$08                               ; $7458: $F8 $08

jr_019_745A:
    ld   a, h                                     ; $745A: $7C
    ld   b, b                                     ; $745B: $40
    ld   hl, sp+$10                               ; $745C: $F8 $10

jr_019_745E:
    ld   a, h                                     ; $745E: $7C
    jr   nz, jr_019_7469                          ; $745F: $20 $08

    ld   hl, sp+$7C                               ; $7461: $F8 $7C
    ld   b, b                                     ; $7463: $40
    ld   [$7C00], sp                              ; $7464: $08 $00 $7C
    jr   nz, jr_019_7481                          ; $7467: $20 $18

jr_019_7469:
    ld   hl, sp+$7C                               ; $7469: $F8 $7C
    nop                                           ; $746B: $00
    jr   jr_019_746E                              ; $746C: $18 $00

jr_019_746E:
    ld   a, h                                     ; $746E: $7C
    ld   h, b                                     ; $746F: $60
    jr   z, @+$0A                                 ; $7470: $28 $08

    ld   a, h                                     ; $7472: $7C
    nop                                           ; $7473: $00
    jr   z, jr_019_7486                           ; $7474: $28 $10

    ld   a, h                                     ; $7476: $7C
    ld   h, b                                     ; $7477: $60
    ret  c                                        ; $7478: $D8

    ld   [$407C], sp                              ; $7479: $08 $7C $40
    ret  c                                        ; $747C: $D8

    db   $10                                      ; $747D: $10
    ld   a, h                                     ; $747E: $7C
    jr   nz, jr_019_7469                          ; $747F: $20 $E8

jr_019_7481:
    ld   hl, sp+$7C                               ; $7481: $F8 $7C
    ld   b, b                                     ; $7483: $40
    add  sp, $00                                  ; $7484: $E8 $00

jr_019_7486:
    ld   a, h                                     ; $7486: $7C
    jr   nz, jr_019_7481                          ; $7487: $20 $F8

    ld   hl, sp+$7C                               ; $7489: $F8 $7C
    nop                                           ; $748B: $00
    ld   hl, sp+$00                               ; $748C: $F8 $00
    ld   a, h                                     ; $748E: $7C
    ld   h, b                                     ; $748F: $60
    ld   [$7C08], sp                              ; $7490: $08 $08 $7C
    nop                                           ; $7493: $00
    ld   [$7C10], sp                              ; $7494: $08 $10 $7C
    ld   h, b                                     ; $7497: $60
    jr   @+$0A                                    ; $7498: $18 $08

    ld   a, h                                     ; $749A: $7C
    ld   b, b                                     ; $749B: $40
    jr   @+$12                                    ; $749C: $18 $10

    ld   a, h                                     ; $749E: $7C
    jr   nz, jr_019_74C9                          ; $749F: $20 $28

    ld   hl, sp+$7C                               ; $74A1: $F8 $7C
    ld   b, b                                     ; $74A3: $40
    jr   z, jr_019_74A6                           ; $74A4: $28 $00

jr_019_74A6:
    ld   a, h                                     ; $74A6: $7C
    jr   nz, jr_019_7481                          ; $74A7: $20 $D8

    jr   @+$7E                                    ; $74A9: $18 $7C

    nop                                           ; $74AB: $00
    ret  c                                        ; $74AC: $D8

    jr   nz, jr_019_752B                          ; $74AD: $20 $7C

    ld   h, b                                     ; $74AF: $60
    add  sp, $18                                  ; $74B0: $E8 $18
    ld   a, h                                     ; $74B2: $7C
    ld   b, b                                     ; $74B3: $40
    add  sp, $20                                  ; $74B4: $E8 $20
    ld   a, h                                     ; $74B6: $7C
    jr   nz, @-$06                                ; $74B7: $20 $F8

    ld   [$407C], sp                              ; $74B9: $08 $7C $40
    ld   hl, sp+$10                               ; $74BC: $F8 $10

jr_019_74BE:
    ld   a, h                                     ; $74BE: $7C
    jr   nz, jr_019_74C9                          ; $74BF: $20 $08

    ld   hl, sp+$7C                               ; $74C1: $F8 $7C
    ld   b, b                                     ; $74C3: $40
    ld   [$7C00], sp                              ; $74C4: $08 $00 $7C
    jr   nz, jr_019_74E1                          ; $74C7: $20 $18

jr_019_74C9:
    add  sp, $7C                                  ; $74C9: $E8 $7C
    ld   b, b                                     ; $74CB: $40
    jr   jr_019_74BE                              ; $74CC: $18 $F0

    ld   a, h                                     ; $74CE: $7C
    jr   nz, jr_019_74F9                          ; $74CF: $20 $28

    add  sp, $7C                                  ; $74D1: $E8 $7C
    nop                                           ; $74D3: $00
    jr   z, @-$0E                                 ; $74D4: $28 $F0

    ld   a, h                                     ; $74D6: $7C
    ld   h, b                                     ; $74D7: $60

label_019_74D8:
    ldh  a, [hActiveEntityState]                  ; $74D8: $F0 $F0
    rst  $00                                      ; $74DA: $C7
    db   $EB                                      ; $74DB: $EB
    ld   [hl], h                                  ; $74DC: $74
    ld   de, $6F75                                ; $74DD: $11 $75 $6F
    ld   [hl], l                                  ; $74E0: $75

jr_019_74E1:
    ld   b, b                                     ; $74E1: $40
    db   $76                                      ; $74E2: $76
    ld   a, e                                     ; $74E3: $7B
    db   $76                                      ; $74E4: $76
    or   c                                        ; $74E5: $B1
    db   $76                                      ; $74E6: $76
    bit  6, [hl]                                  ; $74E7: $CB $76
    ld   b, h                                     ; $74E9: $44
    ld   [hl], a                                  ; $74EA: $77
    ld   a, $02                                   ; $74EB: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $74ED: $E0 $A1
    ld   [wC167], a                               ; $74EF: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $74F2: $CD $05 $0C
    jr   z, jr_019_7509                           ; $74F5: $28 $12

    cp   $30                                      ; $74F7: $FE $30

jr_019_74F9:
    ret  c                                        ; $74F9: $D8

    sub  $30                                      ; $74FA: $D6 $30
    rra                                           ; $74FC: $1F
    rra                                           ; $74FD: $1F
    rra                                           ; $74FE: $1F
    and  $03                                      ; $74FF: $E6 $03
    ldh  [hActiveEntitySpriteVariant], a               ; $7501: $E0 $F1
    ld   de, $73AD                                ; $7503: $11 $AD $73
    jp   RenderAnimatedActiveEntity                               ; $7506: $C3 $C0 $3B

jr_019_7509:
    call GetEntityTransitionCountdown             ; $7509: $CD $05 $0C
    ld   [hl], $A0                                ; $750C: $36 $A0
    jp   IncrementEntityState                     ; $750E: $C3 $12 $3B

    ld   a, $02                                   ; $7511: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7513: $E0 $A1
    ld   [wC167], a                               ; $7515: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $7518: $CD $05 $0C
    jr   nz, jr_019_7526                          ; $751B: $20 $09

    ld   [hl], $FF                                ; $751D: $36 $FF
    ld   a, $1E                                   ; $751F: $3E $1E
    ldh  [hWaveSfx], a                            ; $7521: $E0 $F3
    call IncrementEntityState                     ; $7523: $CD $12 $3B

func_019_7526:
jr_019_7526:
    call GetEntityTransitionCountdown             ; $7526: $CD $05 $0C
    and  $04                                      ; $7529: $E6 $04

jr_019_752B:
    ld   e, $E4                                   ; $752B: $1E $E4
    jr   z, jr_019_7531                           ; $752D: $28 $02

    ld   e, $84                                   ; $752F: $1E $84

jr_019_7531:
    ld   a, e                                     ; $7531: $7B
    ld   [wBGPalette], a                          ; $7532: $EA $97 $DB
    ldh  a, [hFrameCounter]                       ; $7535: $F0 $E7
    and  $07                                      ; $7537: $E6 $07
    jr   nz, jr_019_7547                          ; $7539: $20 $0C

    ld   a, $33                                   ; $753B: $3E $33
    ldh  [hNoiseSfx], a                           ; $753D: $E0 $F4
    call GetRandomByte                            ; $753F: $CD $0D $28
    and  $03                                      ; $7542: $E6 $03
    call SetEntitySpriteVariant                   ; $7544: $CD $0C $3B

jr_019_7547:
    ldh  a, [hFrameCounter]                       ; $7547: $F0 $E7
    ld   hl, wEntitiesFlashCountdownTable         ; $7549: $21 $20 $C4
    add  hl, bc                                   ; $754C: $09
    ld   [hl], a                                  ; $754D: $77
    ldh  a, [hActiveEntitySpriteVariant]               ; $754E: $F0 $F1
    rla                                           ; $7550: $17
    rla                                           ; $7551: $17
    rla                                           ; $7552: $17
    rla                                           ; $7553: $17
    and  $F0                                      ; $7554: $E6 $F0
    ld   e, a                                     ; $7556: $5F
    rla                                           ; $7557: $17
    and  $E0                                      ; $7558: $E6 $E0
    add  e                                        ; $755A: $83
    ld   e, a                                     ; $755B: $5F
    ld   d, b                                     ; $755C: $50
    ld   hl, $7418                                ; $755D: $21 $18 $74
    add  hl, de                                   ; $7560: $19
    ld   c, $0C                                   ; $7561: $0E $0C
    call label_3CE6                               ; $7563: $CD $E6 $3C
    ld   a, $0A                                   ; $7566: $3E $0A
    jp   label_3DA0                               ; $7568: $C3 $A0 $3D

    ld   a, d                                     ; $756B: $7A
    nop                                           ; $756C: $00
    ld   a, d                                     ; $756D: $7A
    jr   nz, jr_019_75AE                          ; $756E: $20 $3E

    ld   [bc], a                                  ; $7570: $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7571: $E0 $A1
    ld   [wC167], a                               ; $7573: $EA $67 $C1
    call func_019_7526                            ; $7576: $CD $26 $75
    call GetEntityTransitionCountdown             ; $7579: $CD $05 $0C
    jr   nz, jr_019_7586                          ; $757C: $20 $08

    call label_BFB                                ; $757E: $CD $FB $0B
    ld   [hl], $28                                ; $7581: $36 $28
    jp   IncrementEntityState                     ; $7583: $C3 $12 $3B

jr_019_7586:
    cp   $50                                      ; $7586: $FE $50
    jr   nc, jr_019_7597                          ; $7588: $30 $0D

    ld   hl, $7620                                ; $758A: $21 $20 $76
    ld   c, $08                                   ; $758D: $0E $08
    call label_3CE6                               ; $758F: $CD $E6 $3C
    ld   a, $06                                   ; $7592: $3E $06
    jp   label_3DA0                               ; $7594: $C3 $A0 $3D

jr_019_7597:
    xor  a                                        ; $7597: $AF
    ldh  [hActiveEntitySpriteVariant], a               ; $7598: $E0 $F1
    ld   de, $756B                                ; $759A: $11 $6B $75
    jp   RenderAnimatedActiveEntity                               ; $759D: $C3 $C0 $3B

    ld   hl, sp+$00                               ; $75A0: $F8 $00
    ld   l, [hl]                                  ; $75A2: $6E
    nop                                           ; $75A3: $00
    ld   hl, sp+$08                               ; $75A4: $F8 $08
    ld   l, [hl]                                  ; $75A6: $6E
    jr   nz, @-$06                                ; $75A7: $20 $F8

    nop                                           ; $75A9: $00
    ld   l, [hl]                                  ; $75AA: $6E
    nop                                           ; $75AB: $00
    ld   hl, sp+$08                               ; $75AC: $F8 $08

jr_019_75AE:
    ld   l, [hl]                                  ; $75AE: $6E
    jr   nz, jr_019_75B9                          ; $75AF: $20 $08

    nop                                           ; $75B1: $00
    ld   [hl], b                                  ; $75B2: $70
    nop                                           ; $75B3: $00
    ld   [$7008], sp                              ; $75B4: $08 $08 $70
    jr   nz, jr_019_75C1                          ; $75B7: $20 $08

jr_019_75B9:
    nop                                           ; $75B9: $00
    ld   [hl], b                                  ; $75BA: $70
    nop                                           ; $75BB: $00
    ld   [$7008], sp                              ; $75BC: $08 $08 $70
    jr   nz, jr_019_75B9                          ; $75BF: $20 $F8

jr_019_75C1:
    ld   hl, sp+$68                               ; $75C1: $F8 $68
    nop                                           ; $75C3: $00
    ld   hl, sp+$00                               ; $75C4: $F8 $00
    ld   l, d                                     ; $75C6: $6A
    nop                                           ; $75C7: $00
    ld   hl, sp+$08                               ; $75C8: $F8 $08
    ld   l, d                                     ; $75CA: $6A
    jr   nz, @-$06                                ; $75CB: $20 $F8

    db   $10                                      ; $75CD: $10
    ld   l, b                                     ; $75CE: $68
    jr   nz, jr_019_75D9                          ; $75CF: $20 $08

    nop                                           ; $75D1: $00
    ld   l, h                                     ; $75D2: $6C
    nop                                           ; $75D3: $00
    ld   [$6C08], sp                              ; $75D4: $08 $08 $6C
    jr   nz, jr_019_75E1                          ; $75D7: $20 $08

jr_019_75D9:
    nop                                           ; $75D9: $00
    ld   l, h                                     ; $75DA: $6C
    nop                                           ; $75DB: $00
    ld   [$6C08], sp                              ; $75DC: $08 $08 $6C
    jr   nz, jr_019_75D9                          ; $75DF: $20 $F8

jr_019_75E1:
    ld   hl, sp+$62                               ; $75E1: $F8 $62
    nop                                           ; $75E3: $00
    ld   hl, sp+$00                               ; $75E4: $F8 $00
    ld   h, h                                     ; $75E6: $64
    nop                                           ; $75E7: $00
    ld   hl, sp+$08                               ; $75E8: $F8 $08
    ld   h, h                                     ; $75EA: $64
    jr   nz, @-$06                                ; $75EB: $20 $F8

    db   $10                                      ; $75ED: $10
    ld   h, d                                     ; $75EE: $62
    jr   nz, jr_019_75F9                          ; $75EF: $20 $08

    nop                                           ; $75F1: $00
    ld   h, [hl]                                  ; $75F2: $66
    nop                                           ; $75F3: $00
    ld   [$6608], sp                              ; $75F4: $08 $08 $66
    jr   nz, jr_019_7601                          ; $75F7: $20 $08

jr_019_75F9:
    nop                                           ; $75F9: $00
    ld   h, [hl]                                  ; $75FA: $66
    nop                                           ; $75FB: $00
    ld   [$6608], sp                              ; $75FC: $08 $08 $66
    jr   nz, jr_019_75F9                          ; $75FF: $20 $F8

jr_019_7601:
    ld   hl, sp+$5A                               ; $7601: $F8 $5A
    nop                                           ; $7603: $00
    ld   hl, sp+$00                               ; $7604: $F8 $00
    ld   e, h                                     ; $7606: $5C
    nop                                           ; $7607: $00
    ld   hl, sp+$08                               ; $7608: $F8 $08
    ld   e, h                                     ; $760A: $5C
    jr   nz, @-$06                                ; $760B: $20 $F8

    db   $10                                      ; $760D: $10
    ld   e, d                                     ; $760E: $5A
    jr   nz, @+$0A                                ; $760F: $20 $08

    ld   hl, sp+$5E                               ; $7611: $F8 $5E
    nop                                           ; $7613: $00
    ld   [$6000], sp                              ; $7614: $08 $00 $60
    nop                                           ; $7617: $00
    ld   [$6008], sp                              ; $7618: $08 $08 $60
    jr   nz, @+$0A                                ; $761B: $20 $08

    db   $10                                      ; $761D: $10
    ld   e, [hl]                                  ; $761E: $5E
    jr   nz, @-$06                                ; $761F: $20 $F8

    ld   hl, sp+$56                               ; $7621: $F8 $56
    nop                                           ; $7623: $00
    ld   hl, sp+$00                               ; $7624: $F8 $00
    ld   e, b                                     ; $7626: $58
    nop                                           ; $7627: $00
    ld   hl, sp+$08                               ; $7628: $F8 $08
    ld   e, b                                     ; $762A: $58
    jr   nz, @-$06                                ; $762B: $20 $F8

    db   $10                                      ; $762D: $10
    ld   d, [hl]                                  ; $762E: $56
    jr   nz, @+$0A                                ; $762F: $20 $08

    ld   hl, sp+$56                               ; $7631: $F8 $56
    ld   b, b                                     ; $7633: $40
    ld   [$5800], sp                              ; $7634: $08 $00 $58
    ld   b, b                                     ; $7637: $40
    ld   [$5808], sp                              ; $7638: $08 $08 $58
    ld   h, b                                     ; $763B: $60
    ld   [$5610], sp                              ; $763C: $08 $10 $56
    ld   h, b                                     ; $763F: $60
    ld   a, $02                                   ; $7640: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7642: $E0 $A1
    ld   [wC167], a                               ; $7644: $EA $67 $C1
    ldh  a, [hFrameCounter]                       ; $7647: $F0 $E7
    and  $0F                                      ; $7649: $E6 $0F
    or   $20                                      ; $764B: $F6 $20
    ld   hl, wEntitiesFlashCountdownTable         ; $764D: $21 $20 $C4
    add  hl, bc                                   ; $7650: $09
    ld   [hl], a                                  ; $7651: $77
    call label_BFB                                ; $7652: $CD $FB $0B
    jr   nz, jr_019_765A                          ; $7655: $20 $03

    jp   IncrementEntityState                     ; $7657: $C3 $12 $3B

jr_019_765A:
    rra                                           ; $765A: $1F
    rra                                           ; $765B: $1F
    and  $0F                                      ; $765C: $E6 $0F
    cp   $04                                      ; $765E: $FE $04
    jr   c, jr_019_7664                           ; $7660: $38 $02

    ld   a, $04                                   ; $7662: $3E $04

jr_019_7664:
    rla                                           ; $7664: $17
    rla                                           ; $7665: $17
    rla                                           ; $7666: $17
    rla                                           ; $7667: $17
    rla                                           ; $7668: $17
    and  $E0                                      ; $7669: $E6 $E0
    ld   e, a                                     ; $766B: $5F
    ld   d, b                                     ; $766C: $50
    ld   hl, $75A0                                ; $766D: $21 $A0 $75
    add  hl, de                                   ; $7670: $19
    ld   c, $08                                   ; $7671: $0E $08
    call label_3CE6                               ; $7673: $CD $E6 $3C
    ld   a, $06                                   ; $7676: $3E $06
    jp   label_3DA0                               ; $7678: $C3 $A0 $3D

    ld   a, $02                                   ; $767B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $767D: $E0 $A1
    ld   [wC167], a                               ; $767F: $EA $67 $C1
    call func_019_78F1                            ; $7682: $CD $F1 $78
    call func_019_7DBB                            ; $7685: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $7688: $21 $50 $C2
    add  hl, bc                                   ; $768B: $09
    inc  [hl]                                     ; $768C: $34
    ld   a, [hl]                                  ; $768D: $7E
    and  $80                                      ; $768E: $E6 $80
    jr   nz, jr_019_76B0                          ; $7690: $20 $1E

    ld   hl, wEntitiesPosYTable                         ; $7692: $21 $10 $C2
    add  hl, bc                                   ; $7695: $09
    ld   a, [hl]                                  ; $7696: $7E
    cp   $70                                      ; $7697: $FE $70
    jr   c, jr_019_76B0                           ; $7699: $38 $15

    ld   [hl], $70                                ; $769B: $36 $70
    ld   a, $17                                   ; $769D: $3E $17
    ldh  [hNoiseSfx], a                           ; $769F: $E0 $F4
    ld   hl, wEntitiesSpeedYTable                       ; $76A1: $21 $50 $C2
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    cp   $04                                      ; $76A6: $FE $04
    jp   c, IncrementEntityState            ; $76A8: $DA $12 $3B

    cpl                                           ; $76AB: $2F
    inc  a                                        ; $76AC: $3C
    sra  a                                        ; $76AD: $CB $2F
    ld   [hl], a                                  ; $76AF: $77

jr_019_76B0:
    ret                                           ; $76B0: $C9

    xor  a                                        ; $76B1: $AF
    ld   [wC167], a                               ; $76B2: $EA $67 $C1
    call func_019_78F1                            ; $76B5: $CD $F1 $78
    call label_3B5A                               ; $76B8: $CD $5A $3B
    jr   nc, jr_019_76CA                          ; $76BB: $30 $0D

    call IncrementEntityState                     ; $76BD: $CD $12 $3B
    ld   a, $0F                                   ; $76C0: $3E $0F
    ld   [wActiveMusicTrack], a                   ; $76C2: $EA $68 $D3
    call GetEntityTransitionCountdown             ; $76C5: $CD $05 $0C
    ld   [hl], $FF                                ; $76C8: $36 $FF

jr_019_76CA:
    ret                                           ; $76CA: $C9

    call GetEntityTransitionCountdown             ; $76CB: $CD $05 $0C
    and  $08                                      ; $76CE: $E6 $08
    ld   e, $E4                                   ; $76D0: $1E $E4
    jr   z, jr_019_76D6                           ; $76D2: $28 $02

    ld   e, $84                                   ; $76D4: $1E $84

jr_019_76D6:
    ld   a, e                                     ; $76D6: $7B
    ld   [wBGPalette], a                          ; $76D7: $EA $97 $DB
    call GetEntityTransitionCountdown             ; $76DA: $CD $05 $0C
    jr   nz, jr_019_7709                          ; $76DD: $20 $2A

    ld   [hl], $20                                ; $76DF: $36 $20
    ld   a, $10                                   ; $76E1: $3E $10
    ld   [wActiveMusicTrack], a                   ; $76E3: $EA $68 $D3
    call_open_dialog $09F                         ; $76E6
    ld   a, [$DAE9]                               ; $76EB: $FA $E9 $DA
    or   $10                                      ; $76EE: $F6 $10
    ld   [$DAE9], a                               ; $76F0: $EA $E9 $DA
    ldh  [hRoomStatus], a                         ; $76F3: $E0 $F8
    ld   a, $02                                   ; $76F5: $3E $02
    ld   [wSwordLevel], a                         ; $76F7: $EA $4E $DB
    ld   a, $FF                                   ; $76FA: $3E $FF
    ld   [wSubstractRupeeBufferLow], a            ; $76FC: $EA $93 $DB
    xor  a                                        ; $76FF: $AF
    ld   [wSeashellsCount], a                     ; $7700: $EA $0F $DB
    ld   [wC167], a                               ; $7703: $EA $67 $C1
    call IncrementEntityState                     ; $7706: $CD $12 $3B

jr_019_7709:
    ldh  a, [hLinkPositionX]                      ; $7709: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $770B: $21 $00 $C2
    add  hl, bc                                   ; $770E: $09
    sub  $04                                      ; $770F: $D6 $04
    ld   [hl], a                                  ; $7711: $77
    ldh  a, [hLinkPositionY]                      ; $7712: $F0 $99
    ld   hl, wEntitiesPosYTable                         ; $7714: $21 $10 $C2
    add  hl, bc                                   ; $7717: $09
    sub  $13                                      ; $7718: $D6 $13
    ld   [hl], a                                  ; $771A: $77
    call label_3D8A                               ; $771B: $CD $8A $3D
    ldh  a, [hLinkPositionZ]                      ; $771E: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $7720: $21 $10 $C3
    add  hl, bc                                   ; $7723: $09
    ld   [hl], a                                  ; $7724: $77
    ld   a, $6B                                   ; $7725: $3E $6B
    ldh  [hLinkAnimationState], a                 ; $7727: $E0 $9D
    ld   a, $02                                   ; $7729: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $772B: $E0 $A1
    ld   a, $03                                   ; $772D: $3E $03
    ldh  [hLinkDirection], a                      ; $772F: $E0 $9E
    xor  a                                        ; $7731: $AF
    ld   [wSwordAnimationState], a                ; $7732: $EA $37 $C1
    ld   [wC16A], a                               ; $7735: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $7738: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $773B: $EA $21 $C1
    call $784F                                    ; $773E: $CD $4F $78
    jp   label_019_78EC                           ; $7741: $C3 $EC $78

    call func_019_78EC                            ; $7744: $CD $EC $78
    ld   a, [wDialogState]                        ; $7747: $FA $9F $C1
    and  a                                        ; $774A: $A7
    ret  nz                                       ; $774B: $C0

    jp   label_019_7E61                           ; $774C: $C3 $61 $7E

    nop                                           ; $774F: $00
    inc  b                                        ; $7750: $04
    ld   [hl], d                                  ; $7751: $72
    nop                                           ; $7752: $00
    ldh  [rDIV], a                                ; $7753: $E0 $04
    ld   [hl], d                                  ; $7755: $72
    nop                                           ; $7756: $00
    nop                                           ; $7757: $00
    ldh  a, [$FF78]                               ; $7758: $F0 $78
    jr   nz, jr_019_775C                          ; $775A: $20 $00

jr_019_775C:
    ld   hl, sp+$78                               ; $775C: $F8 $78
    ld   b, b                                     ; $775E: $40
    nop                                           ; $775F: $00
    db   $10                                      ; $7760: $10
    ld   a, b                                     ; $7761: $78
    ld   h, b                                     ; $7762: $60
    nop                                           ; $7763: $00

jr_019_7764:
    jr   @+$7A                                    ; $7764: $18 $78

    nop                                           ; $7766: $00
    ldh  a, [hFFE8]                               ; $7767: $F0 $E8
    db   $76                                      ; $7769: $76
    jr   nz, jr_019_775C                          ; $776A: $20 $F0

    ldh  a, [rPCM12]                              ; $776C: $F0 $76
    ld   b, b                                     ; $776E: $40
    ldh  a, [rNR23]                               ; $776F: $F0 $18
    db   $76                                      ; $7771: $76
    ld   h, b                                     ; $7772: $60
    ldh  a, [rNR41]                               ; $7773: $F0 $20
    halt                                          ; $7775: $76 $00
    add  sp, -$0C                                 ; $7777: $E8 $F4
    ld   [hl], h                                  ; $7779: $74
    jr   nz, jr_019_7764                          ; $777A: $20 $E8

    inc  d                                        ; $777C: $14
    ld   [hl], h                                  ; $777D: $74
    nop                                           ; $777E: $00
    ld   hl, sp+$04                               ; $777F: $F8 $04
    ld   [hl], d                                  ; $7781: $72
    nop                                           ; $7782: $00
    ret  c                                        ; $7783: $D8

jr_019_7784:
    inc  b                                        ; $7784: $04
    ld   [hl], d                                  ; $7785: $72
    nop                                           ; $7786: $00
    db   $FC                                      ; $7787: $FC

jr_019_7788:
    add  sp, $78                                  ; $7788: $E8 $78
    jr   nz, jr_019_7788                          ; $778A: $20 $FC

jr_019_778C:
    ldh  a, [$FF78]                               ; $778C: $F0 $78
    ld   b, b                                     ; $778E: $40
    db   $FC                                      ; $778F: $FC
    jr   jr_019_780A                              ; $7790: $18 $78

    ld   h, b                                     ; $7792: $60
    db   $FC                                      ; $7793: $FC
    jr   nz, @+$7A                                ; $7794: $20 $78

    nop                                           ; $7796: $00
    add  sp, -$20                                 ; $7797: $E8 $E0
    db   $76                                      ; $7799: $76
    jr   nz, jr_019_7784                          ; $779A: $20 $E8

    add  sp, $76                                  ; $779C: $E8 $76
    ld   b, b                                     ; $779E: $40
    add  sp, $20                                  ; $779F: $E8 $20
    db   $76                                      ; $77A1: $76
    ld   h, b                                     ; $77A2: $60
    add  sp, $28                                  ; $77A3: $E8 $28
    halt                                          ; $77A5: $76 $00
    ldh  [hActiveEntityState], a                  ; $77A7: $E0 $F0
    ld   [hl], h                                  ; $77A9: $74
    jr   nz, jr_019_778C                          ; $77AA: $20 $E0

    jr   jr_019_7822                              ; $77AC: $18 $74

    nop                                           ; $77AE: $00
    nop                                           ; $77AF: $00
    nop                                           ; $77B0: $00
    ld   [hl], h                                  ; $77B1: $74
    jr   nz, jr_019_77B4                          ; $77B2: $20 $00

jr_019_77B4:
    ld   [$0074], sp                              ; $77B4: $08 $74 $00
    ldh  a, [rDIV]                                ; $77B7: $F0 $04
    ld   [hl], d                                  ; $77B9: $72
    nop                                           ; $77BA: $00
    ret  nc                                       ; $77BB: $D0

jr_019_77BC:
    inc  b                                        ; $77BC: $04
    ld   [hl], d                                  ; $77BD: $72
    nop                                           ; $77BE: $00
    ld   hl, sp-$20                               ; $77BF: $F8 $E0
    ld   a, b                                     ; $77C1: $78
    jr   nz, jr_019_77BC                          ; $77C2: $20 $F8

    add  sp, $78                                  ; $77C4: $E8 $78
    ld   b, b                                     ; $77C6: $40
    ld   hl, sp+$20                               ; $77C7: $F8 $20
    ld   a, b                                     ; $77C9: $78
    ld   h, b                                     ; $77CA: $60
    ld   hl, sp+$28                               ; $77CB: $F8 $28
    ld   a, b                                     ; $77CD: $78
    nop                                           ; $77CE: $00
    ldh  [hScratch1], a                           ; $77CF: $E0 $D8
    db   $76                                      ; $77D1: $76
    jr   nz, jr_019_77B4                          ; $77D2: $20 $E0

    ldh  [rPCM12], a                              ; $77D4: $E0 $76
    ld   b, b                                     ; $77D6: $40
    ldh  [$FF28], a                               ; $77D7: $E0 $28
    db   $76                                      ; $77D9: $76
    ld   h, b                                     ; $77DA: $60
    ldh  [$FF30], a                               ; $77DB: $E0 $30
    halt                                          ; $77DD: $76 $00
    ret  c                                        ; $77DF: $D8

    db   $EC                                      ; $77E0: $EC
    ld   [hl], h                                  ; $77E1: $74
    jr   nz, jr_019_77BC                          ; $77E2: $20 $D8

jr_019_77E4:
    inc  e                                        ; $77E4: $1C
    ld   [hl], h                                  ; $77E5: $74
    nop                                           ; $77E6: $00
    ld   hl, sp-$04                               ; $77E7: $F8 $FC
    ld   [hl], h                                  ; $77E9: $74
    jr   nz, jr_019_77E4                          ; $77EA: $20 $F8

    inc  c                                        ; $77EC: $0C
    ld   [hl], h                                  ; $77ED: $74
    nop                                           ; $77EE: $00
    nop                                           ; $77EF: $00
    ld   hl, sp+$76                               ; $77F0: $F8 $76
    jr   nz, jr_019_77F4                          ; $77F2: $20 $00

jr_019_77F4:
    nop                                           ; $77F4: $00
    db   $76                                      ; $77F5: $76
    ld   b, b                                     ; $77F6: $40
    nop                                           ; $77F7: $00
    ld   [$6076], sp                              ; $77F8: $08 $76 $60
    nop                                           ; $77FB: $00
    db   $10                                      ; $77FC: $10
    halt                                          ; $77FD: $76 $00
    db   $E4                                      ; $77FF: $E4
    inc  b                                        ; $7800: $04
    ld   [hl], d                                  ; $7801: $72
    nop                                           ; $7802: $00
    nop                                           ; $7803: $00
    ld   hl, sp+$78                               ; $7804: $F8 $78
    jr   nz, jr_019_7808                          ; $7806: $20 $00

jr_019_7808:
    nop                                           ; $7808: $00
    ld   a, b                                     ; $7809: $78

jr_019_780A:
    ld   b, b                                     ; $780A: $40
    nop                                           ; $780B: $00

jr_019_780C:
    ld   [$6078], sp                              ; $780C: $08 $78 $60
    nop                                           ; $780F: $00
    db   $10                                      ; $7810: $10
    ld   a, b                                     ; $7811: $78
    nop                                           ; $7812: $00
    db   $F4                                      ; $7813: $F4

jr_019_7814:
    ldh  a, [rPCM12]                              ; $7814: $F0 $76
    jr   nz, jr_019_780C                          ; $7816: $20 $F4

    ld   hl, sp+$76                               ; $7818: $F8 $76
    ld   b, b                                     ; $781A: $40
    db   $F4                                      ; $781B: $F4
    db   $10                                      ; $781C: $10
    db   $76                                      ; $781D: $76
    ld   h, b                                     ; $781E: $60
    db   $F4                                      ; $781F: $F4

jr_019_7820:
    jr   jr_019_7898                              ; $7820: $18 $76

jr_019_7822:
    nop                                           ; $7822: $00
    db   $EC                                      ; $7823: $EC
    ld   hl, sp+$74                               ; $7824: $F8 $74
    jr   nz, jr_019_7814                          ; $7826: $20 $EC

    db   $10                                      ; $7828: $10
    ld   [hl], h                                  ; $7829: $74
    nop                                           ; $782A: $00
    ldh  a, [hScratch1]                           ; $782B: $F0 $D8
    ld   a, b                                     ; $782D: $78
    jr   nz, jr_019_7820                          ; $782E: $20 $F0

    ldh  [$FF78], a                               ; $7830: $E0 $78
    ld   b, b                                     ; $7832: $40
    ldh  a, [$FF28]                               ; $7833: $F0 $28
    ld   a, b                                     ; $7835: $78
    ld   h, b                                     ; $7836: $60
    ldh  a, [$FF30]                               ; $7837: $F0 $30
    ld   a, b                                     ; $7839: $78
    nop                                           ; $783A: $00
    call z, $74E8                                 ; $783B: $CC $E8 $74
    jr   nz, jr_019_780C                          ; $783E: $20 $CC

    jr   nz, jr_019_78B6                          ; $7840: $20 $74

    nop                                           ; $7842: $00
    ld   c, a                                     ; $7843: $4F
    ld   [hl], a                                  ; $7844: $77
    ld   a, a                                     ; $7845: $7F
    ld   [hl], a                                  ; $7846: $77
    or   a                                        ; $7847: $B7
    ld   [hl], a                                  ; $7848: $77
    rst  $38                                      ; $7849: $FF
    ld   [hl], a                                  ; $784A: $77

jr_019_784B:
    inc  c                                        ; $784B: $0C
    ld   c, $12                                   ; $784C: $0E $12
    ld   de, $ECF0                                ; $784E: $11 $F0 $EC
    sub  $00                                      ; $7851: $D6 $00
    ldh  [wActiveEntityPosY], a                   ; $7853: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $7855: $F0 $E7
    rra                                           ; $7857: $1F
    rra                                           ; $7858: $1F
    nop                                           ; $7859: $00
    push af                                       ; $785A: $F5
    and  $03                                      ; $785B: $E6 $03
    ld   e, a                                     ; $785D: $5F
    ld   d, b                                     ; $785E: $50
    ld   hl, $784B                                ; $785F: $21 $4B $78
    add  hl, de                                   ; $7862: $19
    ld   c, [hl]                                  ; $7863: $4E
    pop  af                                       ; $7864: $F1
    rla                                           ; $7865: $17
    and  $06                                      ; $7866: $E6 $06
    ld   e, a                                     ; $7868: $5F
    ld   d, b                                     ; $7869: $50
    ld   hl, $7843                                ; $786A: $21 $43 $78
    add  hl, de                                   ; $786D: $19
    ld   a, [hl+]                                 ; $786E: $2A
    ld   h, [hl]                                  ; $786F: $66
    ld   l, a                                     ; $7870: $6F
    call label_3CE6                               ; $7871: $CD $E6 $3C
    ld   a, $10                                   ; $7874: $3E $10
    jp   label_3DA0                               ; $7876: $C3 $A0 $3D

    ld   a, [hl]                                  ; $7879: $7E
    nop                                           ; $787A: $00
    ld   a, [hl]                                  ; $787B: $7E
    jr   nz, jr_019_784B                          ; $787C: $20 $CD

    dec  b                                        ; $787E: $05
    inc  c                                        ; $787F: $0C
    ret  nz                                       ; $7880: $C0

    ld   de, $7879                                ; $7881: $11 $79 $78
    call RenderAnimatedActiveEntity                               ; $7884: $CD $C0 $3B
    call func_019_7DBB                            ; $7887: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                       ; $788A: $21 $50 $C2
    add  hl, bc                                   ; $788D: $09
    inc  [hl]                                     ; $788E: $34
    ld   a, [hl]                                  ; $788F: $7E
    and  $80                                      ; $7890: $E6 $80
    jr   nz, jr_019_78CB                          ; $7892: $20 $37

    ld   hl, wEntitiesPosYTable                         ; $7894: $21 $10 $C2
    add  hl, bc                                   ; $7897: $09

jr_019_7898:
    ld   a, [hl]                                  ; $7898: $7E
    cp   $70                                      ; $7899: $FE $70
    jr   c, jr_019_78CB                           ; $789B: $38 $2E

    ld   [hl], $70                                ; $789D: $36 $70
    ld   hl, wEntitiesSpeedYTable                       ; $789F: $21 $50 $C2
    add  hl, bc                                   ; $78A2: $09
    ld   [hl], b                                  ; $78A3: $70
    call label_3B5A                               ; $78A4: $CD $5A $3B
    jr   nc, jr_019_78CB                          ; $78A7: $30 $22

    ld   a, $01                                   ; $78A9: $3E $01
    ldh  [hWaveSfx], a                            ; $78AB: $E0 $F3
    call func_019_7E61                            ; $78AD: $CD $61 $7E
    ld   hl, $DAE9                                ; $78B0: $21 $E9 $DA
    ld   a, [wSeashellsCount]                     ; $78B3: $FA $0F $DB

jr_019_78B6:
    cp   $05                                      ; $78B6: $FE $05
    jr   nz, jr_019_78BE                          ; $78B8: $20 $04

    set  5, [hl]                                  ; $78BA: $CB $EE
    jr   jr_019_78C0                              ; $78BC: $18 $02

jr_019_78BE:
    set  6, [hl]                                  ; $78BE: $CB $F6

jr_019_78C0:
    add  $01                                      ; $78C0: $C6 $01
    daa                                           ; $78C2: $27
    ld   [wSeashellsCount], a                     ; $78C3: $EA $0F $DB
    call_open_dialog $0EF                         ; $78C6

jr_019_78CB:
    ret                                           ; $78CB: $C9

    ld   hl, sp+$00                               ; $78CC: $F8 $00
    ld   d, d                                     ; $78CE: $52
    nop                                           ; $78CF: $00
    ld   hl, sp+$08                               ; $78D0: $F8 $08
    ld   d, d                                     ; $78D2: $52
    jr   nz, jr_019_78DD                          ; $78D3: $20 $08

jr_019_78D5:
    nop                                           ; $78D5: $00
    ld   d, h                                     ; $78D6: $54
    nop                                           ; $78D7: $00
    ld   [$5408], sp                              ; $78D8: $08 $08 $54
    jr   nz, jr_019_78D5                          ; $78DB: $20 $F8

jr_019_78DD:
    nop                                           ; $78DD: $00
    ld   d, h                                     ; $78DE: $54
    ld   b, b                                     ; $78DF: $40
    ld   hl, sp+$08                               ; $78E0: $F8 $08
    ld   d, h                                     ; $78E2: $54
    ld   h, b                                     ; $78E3: $60
    ld   [$5200], sp                              ; $78E4: $08 $00 $52
    ld   b, b                                     ; $78E7: $40
    ld   [$5208], sp                              ; $78E8: $08 $08 $52
    ld   h, b                                     ; $78EB: $60

func_019_78EC:
label_019_78EC:
    ld   hl, $78DC                                ; $78EC: $21 $DC $78
    jr   jr_019_78F4                              ; $78EF: $18 $03

func_019_78F1:
    ld   hl, $78CC                                ; $78F1: $21 $CC $78

jr_019_78F4:
    ld   c, $04                                   ; $78F4: $0E $04
    call label_3CE6                               ; $78F6: $CD $E6 $3C
    ld   a, $02                                   ; $78F9: $3E $02
    jp   label_3DA0                               ; $78FB: $C3 $A0 $3D

    sbc  b                                        ; $78FE: $98
    ld   d, b                                     ; $78FF: $50
    adc  l                                        ; $7900: $8D
    ld   l, h                                     ; $7901: $6C
    ld   l, [hl]                                  ; $7902: $6E
    ld   l, h                                     ; $7903: $6C
    ld   l, [hl]                                  ; $7904: $6E
    ld   l, h                                     ; $7905: $6C
    ld   l, [hl]                                  ; $7906: $6E
    ld   l, h                                     ; $7907: $6C
    ld   l, [hl]                                  ; $7908: $6E
    ld   l, h                                     ; $7909: $6C
    ld   l, [hl]                                  ; $790A: $6E
    ld   l, h                                     ; $790B: $6C
    ld   l, [hl]                                  ; $790C: $6E
    ld   l, h                                     ; $790D: $6C
    ld   l, [hl]                                  ; $790E: $6E
    sbc  b                                        ; $790F: $98
    ld   d, c                                     ; $7910: $51
    adc  l                                        ; $7911: $8D
    ld   l, l                                     ; $7912: $6D
    ld   l, a                                     ; $7913: $6F
    ld   l, l                                     ; $7914: $6D
    ld   l, a                                     ; $7915: $6F
    ld   l, l                                     ; $7916: $6D
    ld   l, a                                     ; $7917: $6F
    ld   l, l                                     ; $7918: $6D
    ld   l, a                                     ; $7919: $6F
    ld   l, l                                     ; $791A: $6D
    ld   l, a                                     ; $791B: $6F
    ld   l, l                                     ; $791C: $6D
    ld   l, a                                     ; $791D: $6F
    ld   l, l                                     ; $791E: $6D
    ld   l, a                                     ; $791F: $6F
    nop                                           ; $7920: $00

func_019_7921:
    push bc                                       ; $7921: $C5
    ld   c, $23                                   ; $7922: $0E $23
    ld   a, $22                                   ; $7924: $3E $22
    ld   [wRequests], a                           ; $7926: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $7929: $21 $01 $D6
    ld   de, $78FE                                ; $792C: $11 $FE $78

jr_019_792F:
    ld   a, [de]                                  ; $792F: $1A
    inc  de                                       ; $7930: $13
    ld   [hl+], a                                 ; $7931: $22
    dec  c                                        ; $7932: $0D
    jr   nz, jr_019_792F                          ; $7933: $20 $FA

    pop  bc                                       ; $7935: $C1
    ld   a, $89                                   ; $7936: $3E $89
    ld   [$D729], a                               ; $7938: $EA $29 $D7
    ld   [$D739], a                               ; $793B: $EA $39 $D7
    ld   [$D749], a                               ; $793E: $EA $49 $D7
    ld   [$D759], a                               ; $7941: $EA $59 $D7
    ld   [$D769], a                               ; $7944: $EA $69 $D7
    ld   [$D779], a                               ; $7947: $EA $79 $D7
    ld   [$D789], a                               ; $794A: $EA $89 $D7
    ret                                           ; $794D: $C9

    db   $FC                                      ; $794E: $FC
    inc  b                                        ; $794F: $04
    nop                                           ; $7950: $00
    nop                                           ; $7951: $00
    rst  $38                                      ; $7952: $FF
    nop                                           ; $7953: $00
    nop                                           ; $7954: $00
    nop                                           ; $7955: $00
    nop                                           ; $7956: $00
    nop                                           ; $7957: $00
    inc  b                                        ; $7958: $04
    db   $FC                                      ; $7959: $FC
    nop                                           ; $795A: $00
    nop                                           ; $795B: $00
    nop                                           ; $795C: $00
    rst  $38                                      ; $795D: $FF
    inc  c                                        ; $795E: $0C
    jr   jr_019_7985                              ; $795F: $18 $24

    jr   nc, @+$3E                                ; $7961: $30 $3C

    ld   c, b                                     ; $7963: $48

UpdateEntityPositionForRoomTransition::
    ld   a, [wRoomTransitionState]                ; $7964: $FA $24 $C1
    cp   $04                                      ; $7967: $FE $04
    jr   nc, jr_019_796C                          ; $7969: $30 $01

    ret                                           ; $796B: $C9

jr_019_796C:
    ld   a, [wRoomTransitionDirection]            ; $796C: $FA $25 $C1
    ld   e, a                                     ; $796F: $5F
    ld   d, $00                                   ; $7970: $16 $00
    ld   hl, $794E                                ; $7972: $21 $4E $79
    add  hl, de                                   ; $7975: $19
    ld   a, [hl]                                  ; $7976: $7E
    ldh  [hScratch0], a                           ; $7977: $E0 $D7
    ld   hl, $7952                                ; $7979: $21 $52 $79
    add  hl, de                                   ; $797C: $19
    ld   a, [hl]                                  ; $797D: $7E
    ldh  [hScratch1], a                           ; $797E: $E0 $D8
    ld   hl, $7956                                ; $7980: $21 $56 $79
    add  hl, de                                   ; $7983: $19
    ld   a, [hl]                                  ; $7984: $7E

jr_019_7985:
    ldh  [hScratch2], a                           ; $7985: $E0 $D9
    ld   hl, $795A                                ; $7987: $21 $5A $79
    add  hl, de                                   ; $798A: $19
    ld   a, [hl]                                  ; $798B: $7E
    ldh  [hScratch3], a                           ; $798C: $E0 $DA
    ld   hl, wEntitiesPosXTable                         ; $798E: $21 $00 $C2
    add  hl, bc                                   ; $7991: $09
    ldh  a, [hScratch0]                           ; $7992: $F0 $D7
    add  [hl]                                     ; $7994: $86
    rl   d                                        ; $7995: $CB $12
    ld   [hl], a                                  ; $7997: $77
    ld   hl, wEntitiesPosXSignTable                                ; $7998: $21 $20 $C2
    add  hl, bc                                   ; $799B: $09
    ldh  a, [hScratch1]                           ; $799C: $F0 $D8
    rr   d                                        ; $799E: $CB $1A
    adc  [hl]                                     ; $79A0: $8E
    ld   [hl], a                                  ; $79A1: $77
    ld   hl, wEntitiesPosYTable                         ; $79A2: $21 $10 $C2
    add  hl, bc                                   ; $79A5: $09
    ldh  a, [hScratch2]                           ; $79A6: $F0 $D9
    add  [hl]                                     ; $79A8: $86
    rl   d                                        ; $79A9: $CB $12
    ld   [hl], a                                  ; $79AB: $77
    ld   hl, wEntitiesPosYSignTable                                ; $79AC: $21 $30 $C2
    add  hl, bc                                   ; $79AF: $09
    ldh  a, [hScratch3]                           ; $79B0: $F0 $DA
    rr   d                                        ; $79B2: $CB $1A
    adc  [hl]                                     ; $79B4: $8E
    ld   [hl], a                                  ; $79B5: $77
    ldh  a, [hActiveEntityType]                   ; $79B6: $F0 $EB
    cp   $7F                                      ; $79B8: $FE $7F
    jr   nz, jr_019_79CF                          ; $79BA: $20 $13

    ld   hl, wEntitiesUnknowTableP                ; $79BC: $21 $40 $C4
    add  hl, bc                                   ; $79BF: $09
    ldh  a, [hScratch0]                           ; $79C0: $F0 $D7
    add  [hl]                                     ; $79C2: $86
    ld   [hl], a                                  ; $79C3: $77
    ld   hl, wEntitiesUnknownTableD               ; $79C4: $21 $D0 $C2
    add  hl, bc                                   ; $79C7: $09
    ldh  a, [hScratch2]                           ; $79C8: $F0 $D9
    add  [hl]                                     ; $79CA: $86
    ld   [hl], a                                  ; $79CB: $77
    jp   label_019_7A74                           ; $79CC: $C3 $74 $7A

jr_019_79CF:
    cp   $87                                      ; $79CF: $FE $87
    jr   nz, jr_019_7A0F                          ; $79D1: $20 $3C

    ld   hl, wEntitiesUnknownTableD               ; $79D3: $21 $D0 $C2
    add  hl, bc                                   ; $79D6: $09
    ld   a, [hl]                                  ; $79D7: $7E
    cp   $02                                      ; $79D8: $FE $02
    jp   z, label_019_7A74                        ; $79DA: $CA $74 $7A

    ld   hl, wEntitiesUnknowTableY                ; $79DD: $21 $D0 $C3
    add  hl, bc                                   ; $79E0: $09
    ld   a, [hl]                                  ; $79E1: $7E
    ldh  [hFreeWarpDataAddress], a                ; $79E2: $E0 $E6
    ld   a, $06                                   ; $79E4: $3E $06

jr_019_79E6:
    ldh  [hFFE8], a                               ; $79E6: $E0 $E8
    ld   e, a                                     ; $79E8: $5F
    ld   d, b                                     ; $79E9: $50
    ld   hl, $795D                                ; $79EA: $21 $5D $79
    add  hl, de                                   ; $79ED: $19
    push hl                                       ; $79EE: $E5
    ldh  a, [hFreeWarpDataAddress]                ; $79EF: $F0 $E6
    sub  [hl]                                     ; $79F1: $96
    ld   e, a                                     ; $79F2: $5F
    ld   d, b                                     ; $79F3: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $79F4: $21 $00 $D0
    add  hl, de                                   ; $79F7: $19
    ldh  a, [hScratch0]                           ; $79F8: $F0 $D7
    add  [hl]                                     ; $79FA: $86
    ld   [hl], a                                  ; $79FB: $77
    ldh  a, [hFreeWarpDataAddress]                ; $79FC: $F0 $E6
    pop  hl                                       ; $79FE: $E1
    sub  [hl]                                     ; $79FF: $96
    ld   e, a                                     ; $7A00: $5F
    ld   d, b                                     ; $7A01: $50
    ld   hl, $D100                                ; $7A02: $21 $00 $D1
    add  hl, de                                   ; $7A05: $19
    ldh  a, [hScratch2]                           ; $7A06: $F0 $D9
    add  [hl]                                     ; $7A08: $86
    ld   [hl], a                                  ; $7A09: $77
    ldh  a, [hFFE8]                               ; $7A0A: $F0 $E8
    dec  a                                        ; $7A0C: $3D
    jr   nz, jr_019_79E6                          ; $7A0D: $20 $D7

jr_019_7A0F:
    cp   $C1                                      ; $7A0F: $FE $C1
    jr   nz, jr_019_7A33                          ; $7A11: $20 $20

    ld   a, [wIsMarinFollowingLink]               ; $7A13: $FA $73 $DB
    and  a                                        ; $7A16: $A7
    jr   z, jr_019_7A74                           ; $7A17: $28 $5B

    ld   e, $10                                   ; $7A19: $1E $10
    ld   hl, $D155                                ; $7A1B: $21 $55 $D1

jr_019_7A1E:
    ldh  a, [hScratch0]                           ; $7A1E: $F0 $D7
    add  [hl]                                     ; $7A20: $86
    ld   [hl+], a                                 ; $7A21: $22
    dec  e                                        ; $7A22: $1D
    jr   nz, jr_019_7A1E                          ; $7A23: $20 $F9

    ld   e, $10                                   ; $7A25: $1E $10
    ld   hl, $D175                                ; $7A27: $21 $75 $D1

jr_019_7A2A:
    ldh  a, [hScratch2]                           ; $7A2A: $F0 $D9
    add  [hl]                                     ; $7A2C: $86
    ld   [hl+], a                                 ; $7A2D: $22
    dec  e                                        ; $7A2E: $1D
    jr   nz, jr_019_7A2A                          ; $7A2F: $20 $F9

    jr   jr_019_7A74                              ; $7A31: $18 $41

jr_019_7A33:
    cp   $69                                      ; $7A33: $FE $69
    jr   z, jr_019_7A64                           ; $7A35: $28 $2D

    cp   $B0                                      ; $7A37: $FE $B0
    jr   z, jr_019_7A64                           ; $7A39: $28 $29

    cp   $6D                                      ; $7A3B: $FE $6D
    jr   nz, jr_019_7A74                          ; $7A3D: $20 $35

    ld   a, [wIsBowWowFollowingLink]              ; $7A3F: $FA $56 $DB
    cp   $01                                      ; $7A42: $FE $01
    jr   nz, jr_019_7A4C                          ; $7A44: $20 $06

    ldh  a, [hFrameCounter]                       ; $7A46: $F0 $E7
    and  $07                                      ; $7A48: $E6 $07
    jr   z, jr_019_7A74                           ; $7A4A: $28 $28

jr_019_7A4C:
    ld   e, $06                                   ; $7A4C: $1E $06
    ld   hl, $D100                                ; $7A4E: $21 $00 $D1

jr_019_7A51:
    ldh  a, [hScratch0]                           ; $7A51: $F0 $D7
    add  [hl]                                     ; $7A53: $86
    ld   [hl+], a                                 ; $7A54: $22
    dec  e                                        ; $7A55: $1D
    jr   nz, jr_019_7A51                          ; $7A56: $20 $F9

    ld   e, $06                                   ; $7A58: $1E $06
    ld   hl, $D110                                ; $7A5A: $21 $10 $D1

jr_019_7A5D:
    ldh  a, [hScratch2]                           ; $7A5D: $F0 $D9
    add  [hl]                                     ; $7A5F: $86
    ld   [hl+], a                                 ; $7A60: $22
    dec  e                                        ; $7A61: $1D
    jr   nz, jr_019_7A5D                          ; $7A62: $20 $F9

jr_019_7A64:
    ld   hl, wEntitiesSubstate1Table              ; $7A64: $21 $B0 $C2
    add  hl, bc                                   ; $7A67: $09
    ldh  a, [hScratch0]                           ; $7A68: $F0 $D7
    add  [hl]                                     ; $7A6A: $86
    ld   [hl], a                                  ; $7A6B: $77
    ld   hl, wEntitiesUnknownTableC               ; $7A6C: $21 $C0 $C2
    add  hl, bc                                   ; $7A6F: $09
    ldh  a, [hScratch2]                           ; $7A70: $F0 $D9
    add  [hl]                                     ; $7A72: $86
    ld   [hl], a                                  ; $7A73: $77

label_019_7A74:
jr_019_7A74:
    ldh  a, [hMapRoom]                            ; $7A74: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $7A76: $21 $E0 $C3
    add  hl, bc                                   ; $7A79: $09
    cp   [hl]                                     ; $7A7A: $BE
    ret  z                                        ; $7A7B: $C8

    ld   hl, wEntitiesPosXTable                         ; $7A7C: $21 $00 $C2
    add  hl, bc                                   ; $7A7F: $09
    ld   a, [hl]                                  ; $7A80: $7E
    cp   $A0                                      ; $7A81: $FE $A0
    jr   nc, jr_019_7A8F                          ; $7A83: $30 $0A

    ld   hl, wEntitiesPosYTable                         ; $7A85: $21 $10 $C2
    add  hl, bc                                   ; $7A88: $09
    ld   a, [hl]                                  ; $7A89: $7E
    sub  $10                                      ; $7A8A: $D6 $10
    cp   $78                                      ; $7A8C: $FE $78
    ret  c                                        ; $7A8E: $D8

jr_019_7A8F:
    ldh  a, [hActiveEntityType]                   ; $7A8F: $F0 $EB
    cp   $A7                                      ; $7A91: $FE $A7
    ret  z                                        ; $7A93: $C8

    ld   hl, wEntitiesStatusTable                        ; $7A94: $21 $80 $C2
    add  hl, bc                                   ; $7A97: $09
    ld   [hl], b                                  ; $7A98: $70
    ret                                           ; $7A99: $C9

Func_019_7A9A::
    ld   a, [wConveyorBeltsCount]                 ; $7A9A: $FA $A5 $C1
    and  a                                        ; $7A9D: $A7
    ret  z                                        ; $7A9E: $C8

    ld   a, [wDialogState]                        ; $7A9F: $FA $9F $C1
    and  a                                        ; $7AA2: $A7
    ret  nz                                       ; $7AA3: $C0

    ldh  a, [hFrameCounter]                       ; $7AA4: $F0 $E7
    and  $03                                      ; $7AA6: $E6 $03
    sla  a                                        ; $7AA8: $CB $27
    add  $B6                                      ; $7AAA: $C6 $B6
    ld   l, a                                     ; $7AAC: $6F
    ld   a, $7A                                   ; $7AAD: $3E $7A
    adc  $00                                      ; $7AAF: $CE $00
    ld   h, a                                     ; $7AB1: $67
    ld   a, [hl+]                                 ; $7AB2: $2A
    ld   h, [hl]                                  ; $7AB3: $66
    ld   l, a                                     ; $7AB4: $6F
    jp   hl                                       ; $7AB5: $E9

    cp   [hl]                                     ; $7AB6: $BE
    ld   a, d                                     ; $7AB7: $7A
    db   $DB                                      ; $7AB8: $DB
    ld   a, d                                     ; $7AB9: $7A
    ld   hl, sp+$7A                               ; $7ABA: $F8 $7A
    inc  b                                        ; $7ABC: $04
    ld   a, e                                     ; $7ABD: $7B
    ld   hl, $DCCF                                ; $7ABE: $21 $CF $DC
    ld   de, $DCCF                                ; $7AC1: $11 $CF $DC
    ld   a, [hl-]                                 ; $7AC4: $3A
    push af                                       ; $7AC5: $F5
    ld   a, [hl-]                                 ; $7AC6: $3A
    push af                                       ; $7AC7: $F5
    ld   c, $07                                   ; $7AC8: $0E $07

jr_019_7ACA:
    ld   a, [hl-]                                 ; $7ACA: $3A
    ld   [de], a                                  ; $7ACB: $12
    dec  de                                       ; $7ACC: $1B
    ld   a, [hl-]                                 ; $7ACD: $3A
    ld   [de], a                                  ; $7ACE: $12
    dec  de                                       ; $7ACF: $1B
    dec  c                                        ; $7AD0: $0D
    jr   nz, jr_019_7ACA                          ; $7AD1: $20 $F7

    pop  hl                                       ; $7AD3: $E1
    pop  bc                                       ; $7AD4: $C1
    ld   a, b                                     ; $7AD5: $78
    ld   [de], a                                  ; $7AD6: $12
    dec  de                                       ; $7AD7: $1B
    ld   a, h                                     ; $7AD8: $7C
    ld   [de], a                                  ; $7AD9: $12
    ret                                           ; $7ADA: $C9

    ld   hl, $DCD0                                ; $7ADB: $21 $D0 $DC
    ld   de, $DCD0                                ; $7ADE: $11 $D0 $DC
    ld   a, [hl+]                                 ; $7AE1: $2A
    push af                                       ; $7AE2: $F5
    ld   a, [hl+]                                 ; $7AE3: $2A
    push af                                       ; $7AE4: $F5
    ld   c, $07                                   ; $7AE5: $0E $07

jr_019_7AE7:
    ld   a, [hl+]                                 ; $7AE7: $2A
    ld   [de], a                                  ; $7AE8: $12
    inc  de                                       ; $7AE9: $13
    ld   a, [hl+]                                 ; $7AEA: $2A
    ld   [de], a                                  ; $7AEB: $12
    inc  de                                       ; $7AEC: $13
    dec  c                                        ; $7AED: $0D
    jr   nz, jr_019_7AE7                          ; $7AEE: $20 $F7

    pop  hl                                       ; $7AF0: $E1
    pop  bc                                       ; $7AF1: $C1
    ld   a, b                                     ; $7AF2: $78
    ld   [de], a                                  ; $7AF3: $12
    inc  de                                       ; $7AF4: $13
    ld   a, h                                     ; $7AF5: $7C
    ld   [de], a                                  ; $7AF6: $12
    ret                                           ; $7AF7: $C9

    ld   hl, $DCE0                                ; $7AF8: $21 $E0 $DC
    ld   e, $10                                   ; $7AFB: $1E $10

jr_019_7AFD:
    rlc  [hl]                                     ; $7AFD: $CB $06
    inc  hl                                       ; $7AFF: $23
    dec  e                                        ; $7B00: $1D
    jr   nz, jr_019_7AFD                          ; $7B01: $20 $FA

    ret                                           ; $7B03: $C9

    ld   hl, $DCF0                                ; $7B04: $21 $F0 $DC
    ld   e, $10                                   ; $7B07: $1E $10

jr_019_7B09:
    rrc  [hl]                                     ; $7B09: $CB $0E
    inc  hl                                       ; $7B0B: $23
    dec  e                                        ; $7B0C: $1D
    jr   nz, jr_019_7B09                          ; $7B0D: $20 $FA

    ret                                           ; $7B0F: $C9

    db   $FD                                      ; $7B10: $FD
    db   $FC                                      ; $7B11: $FC
    ld   d, $00                                   ; $7B12: $16 $00
    db   $FC                                      ; $7B14: $FC
    inc  c                                        ; $7B15: $0C
    ld   d, $00                                   ; $7B16: $16 $00
    ld   c, $FB                                   ; $7B18: $0E $FB
    ld   d, $00                                   ; $7B1A: $16 $00
    inc  c                                        ; $7B1C: $0C
    dec  c                                        ; $7B1D: $0D
    ld   d, $00                                   ; $7B1E: $16 $00
    ei                                            ; $7B20: $FB
    db   $FD                                      ; $7B21: $FD
    ld   d, $00                                   ; $7B22: $16 $00
    ld   a, [$160B]                               ; $7B24: $FA $0B $16
    nop                                           ; $7B27: $00
    dec  bc                                       ; $7B28: $0B
    db   $FC                                      ; $7B29: $FC
    ld   d, $00                                   ; $7B2A: $16 $00
    add  hl, bc                                   ; $7B2C: $09
    inc  c                                        ; $7B2D: $0C
    ld   d, $00                                   ; $7B2E: $16 $00
    db   $FD                                      ; $7B30: $FD
    cp   $16                                      ; $7B31: $FE $16
    nop                                           ; $7B33: $00
    db   $FC                                      ; $7B34: $FC
    ld   a, [bc]                                  ; $7B35: $0A
    ld   d, $00                                   ; $7B36: $16 $00
    dec  bc                                       ; $7B38: $0B
    db   $FD                                      ; $7B39: $FD
    ld   d, $00                                   ; $7B3A: $16 $00
    ld   [$160A], sp                              ; $7B3C: $08 $0A $16
    nop                                           ; $7B3F: $00
    rst  $38                                      ; $7B40: $FF
    nop                                           ; $7B41: $00
    ld   d, $00                                   ; $7B42: $16 $00
    nop                                           ; $7B44: $00
    ld   [$0016], sp                              ; $7B45: $08 $16 $00
    ld   a, [bc]                                  ; $7B48: $0A
    rst  $38                                      ; $7B49: $FF
    ld   d, $00                                   ; $7B4A: $16 $00
    ld   [$1609], sp                              ; $7B4C: $08 $09 $16
    nop                                           ; $7B4F: $00
    ld   [bc], a                                  ; $7B50: $02
    db   $FC                                      ; $7B51: $FC
    jr   z, jr_019_7B54                           ; $7B52: $28 $00

jr_019_7B54:
    ei                                            ; $7B54: $FB
    inc  b                                        ; $7B55: $04
    jr   z, jr_019_7BB8                           ; $7B56: $28 $60

    dec  b                                        ; $7B58: $05
    ld   b, $28                                   ; $7B59: $06 $28
    nop                                           ; $7B5B: $00
    ld   bc, $280A                                ; $7B5C: $01 $0A $28
    jr   nz, jr_019_7B62                          ; $7B5F: $20 $01

    rst  $38                                      ; $7B61: $FF

jr_019_7B62:
    jr   z, jr_019_7B64                           ; $7B62: $28 $00

jr_019_7B64:
    ld   sp, hl                                   ; $7B64: $F9
    inc  b                                        ; $7B65: $04
    jr   z, jr_019_7BC8                           ; $7B66: $28 $60

    ld   [$2806], sp                              ; $7B68: $08 $06 $28
    nop                                           ; $7B6B: $00
    ld   [bc], a                                  ; $7B6C: $02
    rlca                                          ; $7B6D: $07
    jr   z, jr_019_7B90                           ; $7B6E: $28 $20

    nop                                           ; $7B70: $00
    nop                                           ; $7B71: $00
    jr   z, jr_019_7B94                           ; $7B72: $28 $20

    ld   hl, sp+$02                               ; $7B74: $F8 $02
    jr   z, jr_019_7BD8                           ; $7B76: $28 $60

    inc  b                                        ; $7B78: $04
    inc  b                                        ; $7B79: $04
    jr   z, @+$22                                 ; $7B7A: $28 $20

    ld   a, [bc]                                  ; $7B7C: $0A
    rlca                                          ; $7B7D: $07
    jr   z, jr_019_7BA0                           ; $7B7E: $28 $20

    cp   $01                                      ; $7B80: $FE $01
    jr   z, jr_019_7BA4                           ; $7B82: $28 $20

    inc  b                                        ; $7B84: $04
    ld   bc, $6028                                ; $7B85: $01 $28 $60
    inc  b                                        ; $7B88: $04
    dec  b                                        ; $7B89: $05
    jr   z, @+$22                                 ; $7B8A: $28 $20

    inc  c                                        ; $7B8C: $0C
    rlca                                          ; $7B8D: $07
    jr   z, jr_019_7BB0                           ; $7B8E: $28 $20

jr_019_7B90:
    db   $FD                                      ; $7B90: $FD
    nop                                           ; $7B91: $00
    jr   z, jr_019_7BB4                           ; $7B92: $28 $20

jr_019_7B94:
    inc  b                                        ; $7B94: $04
    cp   $28                                      ; $7B95: $FE $28
    ld   h, b                                     ; $7B97: $60
    ld   [$2808], sp                              ; $7B98: $08 $08 $28
    jr   nz, jr_019_7BAB                          ; $7B9B: $20 $0E

    add  hl, bc                                   ; $7B9D: $09
    jr   z, jr_019_7BC0                           ; $7B9E: $28 $20

jr_019_7BA0:
    db   $FC                                      ; $7BA0: $FC
    rst  $38                                      ; $7BA1: $FF
    jr   z, jr_019_7BA4                           ; $7BA2: $28 $00

jr_019_7BA4:
    inc  b                                        ; $7BA4: $04
    ld   a, [$4028]                               ; $7BA5: $FA $28 $40
    ld   [$2809], sp                              ; $7BA8: $08 $09 $28

jr_019_7BAB:
    jr   nz, jr_019_7BBC                          ; $7BAB: $20 $0F

    ld   a, [bc]                                  ; $7BAD: $0A
    jr   z, jr_019_7BB0                           ; $7BAE: $28 $00

jr_019_7BB0:
    ei                                            ; $7BB0: $FB
    cp   $28                                      ; $7BB1: $FE $28
    nop                                           ; $7BB3: $00

jr_019_7BB4:
    inc  bc                                       ; $7BB4: $03
    ld   sp, hl                                   ; $7BB5: $F9
    jr   z, jr_019_7BF8                           ; $7BB6: $28 $40

jr_019_7BB8:
    ld   [$280C], sp                              ; $7BB8: $08 $0C $28
    nop                                           ; $7BBB: $00

jr_019_7BBC:
    ld   de, $280B                                ; $7BBC: $11 $0B $28
    nop                                           ; $7BBF: $00

jr_019_7BC0:
    ld   a, [$28FD]                               ; $7BC0: $FA $FD $28
    nop                                           ; $7BC3: $00
    ld   bc, ClearBGMap                           ; $7BC4: $01 $F7 $28
    ld   b, b                                     ; $7BC7: $40

jr_019_7BC8:
    add  hl, bc                                   ; $7BC8: $09
    dec  c                                        ; $7BC9: $0D
    jr   z, jr_019_7BCC                           ; $7BCA: $28 $00

jr_019_7BCC:
    rrca                                          ; $7BCC: $0F
    inc  c                                        ; $7BCD: $0C
    jr   z, jr_019_7BD0                           ; $7BCE: $28 $00

jr_019_7BD0:
    ld   [bc], a                                  ; $7BD0: $02
    db   $FC                                      ; $7BD1: $FC
    jr   z, @+$08                                 ; $7BD2: $28 $06

    ei                                            ; $7BD4: $FB
    inc  b                                        ; $7BD5: $04
    jr   z, jr_019_7C3E                           ; $7BD6: $28 $66

jr_019_7BD8:
    dec  b                                        ; $7BD8: $05
    ld   b, $28                                   ; $7BD9: $06 $28
    ld   b, $01                                   ; $7BDB: $06 $01
    ld   a, [bc]                                  ; $7BDD: $0A
    jr   z, @+$28                                 ; $7BDE: $28 $26

    ld   bc, $28FF                                ; $7BE0: $01 $FF $28
    ld   b, $F9                                   ; $7BE3: $06 $F9
    inc  b                                        ; $7BE5: $04
    jr   z, jr_019_7C4E                           ; $7BE6: $28 $66

    ld   [$2806], sp                              ; $7BE8: $08 $06 $28
    ld   b, $02                                   ; $7BEB: $06 $02
    rlca                                          ; $7BED: $07
    jr   z, @+$28                                 ; $7BEE: $28 $26

    nop                                           ; $7BF0: $00
    nop                                           ; $7BF1: $00
    jr   z, @+$28                                 ; $7BF2: $28 $26

    ld   hl, sp+$02                               ; $7BF4: $F8 $02
    jr   z, jr_019_7C5E                           ; $7BF6: $28 $66

jr_019_7BF8:
    inc  b                                        ; $7BF8: $04
    inc  b                                        ; $7BF9: $04
    jr   z, jr_019_7C22                           ; $7BFA: $28 $26

    ld   a, [bc]                                  ; $7BFC: $0A
    rlca                                          ; $7BFD: $07
    jr   z, @+$28                                 ; $7BFE: $28 $26

    cp   $01                                      ; $7C00: $FE $01
    jr   z, @+$28                                 ; $7C02: $28 $26

    inc  b                                        ; $7C04: $04
    ld   bc, $6628                                ; $7C05: $01 $28 $66
    inc  b                                        ; $7C08: $04
    dec  b                                        ; $7C09: $05
    jr   z, @+$28                                 ; $7C0A: $28 $26

    inc  c                                        ; $7C0C: $0C
    rlca                                          ; $7C0D: $07
    jr   z, jr_019_7C36                           ; $7C0E: $28 $26

    db   $FD                                      ; $7C10: $FD
    nop                                           ; $7C11: $00
    jr   z, @+$28                                 ; $7C12: $28 $26

    inc  b                                        ; $7C14: $04
    cp   $28                                      ; $7C15: $FE $28
    ld   h, [hl]                                  ; $7C17: $66
    ld   [$2808], sp                              ; $7C18: $08 $08 $28
    ld   h, $0E                                   ; $7C1B: $26 $0E
    add  hl, bc                                   ; $7C1D: $09
    jr   z, jr_019_7C46                           ; $7C1E: $28 $26

    db   $FC                                      ; $7C20: $FC
    rst  $38                                      ; $7C21: $FF

jr_019_7C22:
    jr   z, @+$08                                 ; $7C22: $28 $06

    inc  b                                        ; $7C24: $04
    ld   a, [$4628]                               ; $7C25: $FA $28 $46
    ld   [$2809], sp                              ; $7C28: $08 $09 $28
    ld   h, $0F                                   ; $7C2B: $26 $0F
    ld   a, [bc]                                  ; $7C2D: $0A
    jr   z, jr_019_7C36                           ; $7C2E: $28 $06

    ei                                            ; $7C30: $FB
    cp   $28                                      ; $7C31: $FE $28
    ld   b, $03                                   ; $7C33: $06 $03
    ld   sp, hl                                   ; $7C35: $F9

jr_019_7C36:
    jr   z, @+$48                                 ; $7C36: $28 $46

    ld   [$280C], sp                              ; $7C38: $08 $0C $28
    ld   b, $11                                   ; $7C3B: $06 $11
    dec  bc                                       ; $7C3D: $0B

jr_019_7C3E:
    jr   z, jr_019_7C46                           ; $7C3E: $28 $06

    ld   a, [$28FD]                               ; $7C40: $FA $FD $28
    ld   b, $01                                   ; $7C43: $06 $01
    rst  $30                                      ; $7C45: $F7

jr_019_7C46:
    jr   z, @+$48                                 ; $7C46: $28 $46

    add  hl, bc                                   ; $7C48: $09
    dec  c                                        ; $7C49: $0D
    jr   z, jr_019_7C52                           ; $7C4A: $28 $06

    rrca                                          ; $7C4C: $0F
    inc  c                                        ; $7C4D: $0C

jr_019_7C4E:
    jr   z, jr_019_7C56                           ; $7C4E: $28 $06

Func_019_7C50::
    ldh  a, [hActiveEntitySpriteVariant]               ; $7C50: $F0 $F1

jr_019_7C52:
    cp   $FF                                      ; $7C52: $FE $FF
    jr   z, jr_019_7C6D                           ; $7C54: $28 $17

jr_019_7C56:
    cp   $01                                      ; $7C56: $FE $01
    jr   z, jr_019_7C6D                           ; $7C58: $28 $13

    ldh  a, [hScratch0]                           ; $7C5A: $F0 $D7
    and  $0C                                      ; $7C5C: $E6 $0C

jr_019_7C5E:
    sla  a                                        ; $7C5E: $CB $27
    sla  a                                        ; $7C60: $CB $27
    ld   e, a                                     ; $7C62: $5F
    ld   d, b                                     ; $7C63: $50
    ld   hl, $7B10                                ; $7C64: $21 $10 $7B
    add  hl, de                                   ; $7C67: $19
    ld   c, $04                                   ; $7C68: $0E $04
    jp   label_3CE6                               ; $7C6A: $C3 $E6 $3C

jr_019_7C6D:
    inc  a                                        ; $7C6D: $3C
    jr   nz, jr_019_7C8D                          ; $7C6E: $20 $1D

    ldh  [hActiveEntitySpriteVariant], a               ; $7C70: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $7C72: $F0 $E7
    xor  c                                        ; $7C74: $A9
    rra                                           ; $7C75: $1F
    ret  c                                        ; $7C76: $D8

    ldh  a, [hIsGBC]                              ; $7C77: $F0 $FE
    and  a                                        ; $7C79: $A7
    jr   z, jr_019_7C8D                           ; $7C7A: $28 $11

    ld   a, [wIsIndoor]                           ; $7C7C: $FA $A5 $DB
    and  a                                        ; $7C7F: $A7
    jr   nz, jr_019_7C8D                          ; $7C80: $20 $0B

    ldh  a, [hMapRoom]                            ; $7C82: $F0 $F6
    cp   $32                                      ; $7C84: $FE $32
    jr   nz, jr_019_7C8D                          ; $7C86: $20 $05

    ld   hl, $7BD0                                ; $7C88: $21 $D0 $7B
    jr   jr_019_7C90                              ; $7C8B: $18 $03

jr_019_7C8D:
    ld   hl, $7B50                                ; $7C8D: $21 $50 $7B

jr_019_7C90:
    ldh  a, [hScratch0]                           ; $7C90: $F0 $D7
    and  $1C                                      ; $7C92: $E6 $1C
    xor  $1C                                      ; $7C94: $EE $1C
    sla  a                                        ; $7C96: $CB $27
    sla  a                                        ; $7C98: $CB $27
    ld   e, a                                     ; $7C9A: $5F
    ld   d, b                                     ; $7C9B: $50
    add  hl, de                                   ; $7C9C: $19
    ld   c, $04                                   ; $7C9D: $0E $04
    jp   label_3CE6                               ; $7C9F: $C3 $E6 $3C

func_019_7CA2:
label_019_7CA2:
    call label_3B5A                               ; $7CA2: $CD $5A $3B
    jr   nc, jr_019_7CCE                          ; $7CA5: $30 $27

    call CopyLinkFinalPositionToPosition          ; $7CA7: $CD $BE $0C
    ld   a, [$C1A6]                               ; $7CAA: $FA $A6 $C1
    and  a                                        ; $7CAD: $A7
    jr   z, jr_019_7CC1                           ; $7CAE: $28 $11

    ld   e, a                                     ; $7CB0: $5F
    ld   d, b                                     ; $7CB1: $50
    ld   hl, $C39F                                ; $7CB2: $21 $9F $C3
    add  hl, de                                   ; $7CB5: $19
    ld   a, [hl]                                  ; $7CB6: $7E
    cp   $03                                      ; $7CB7: $FE $03
    jr   nz, jr_019_7CC1                          ; $7CB9: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $7CBB: $21 $8F $C2
    add  hl, de                                   ; $7CBE: $19
    ld   [hl], $00                                ; $7CBF: $36 $00

jr_019_7CC1:
    ld   a, [wIsRunningWithPegasusBoots]          ; $7CC1: $FA $4A $C1
    ld   e, a                                     ; $7CC4: $5F
    call ResetPegasusBoots                                ; $7CC5: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $7CC8: $CD $8E $17
    ld   a, e                                     ; $7CCB: $7B
    scf                                           ; $7CCC: $37
    ret                                           ; $7CCD: $C9

jr_019_7CCE:
    and  a                                        ; $7CCE: $A7
    ret                                           ; $7CCF: $C9

    ld   b, $04                                   ; $7CD0: $06 $04
    ld   [bc], a                                  ; $7CD2: $02
    nop                                           ; $7CD3: $00

func_019_7CD4:
    ld   hl, wEntitiesDirectionTable              ; $7CD4: $21 $80 $C3
    add  hl, bc                                   ; $7CD7: $09
    ld   e, [hl]                                  ; $7CD8: $5E
    ld   d, b                                     ; $7CD9: $50
    ld   hl, $7CD0                                ; $7CDA: $21 $D0 $7C
    add  hl, de                                   ; $7CDD: $19
    push hl                                       ; $7CDE: $E5
    ld   hl, wEntitiesUnknowTableY                ; $7CDF: $21 $D0 $C3
    add  hl, bc                                   ; $7CE2: $09
    inc  [hl]                                     ; $7CE3: $34
    ld   a, [hl]                                  ; $7CE4: $7E
    rra                                           ; $7CE5: $1F
    rra                                           ; $7CE6: $1F
    rra                                           ; $7CE7: $1F
    rra                                           ; $7CE8: $1F
    pop  hl                                       ; $7CE9: $E1
    and  $01                                      ; $7CEA: $E6 $01
    or   [hl]                                     ; $7CEC: $B6
    jp   SetEntitySpriteVariant                   ; $7CED: $C3 $0C $3B

func_019_7CF0:
    ld   e, b                                     ; $7CF0: $58
    ldh  a, [hLinkPositionY]                      ; $7CF1: $F0 $99
    ld   hl, $FFEF                                ; $7CF3: $21 $EF $FF
    sub  [hl]                                     ; $7CF6: $96
    add  $14                                      ; $7CF7: $C6 $14
    cp   $28                                      ; $7CF9: $FE $28

func_019_7CFB:
    jr   nc, jr_019_7D3B                          ; $7CFB: $30 $3E

    ldh  a, [hLinkPositionX]                      ; $7CFD: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $7CFF: $21 $EE $FF
    sub  [hl]                                     ; $7D02: $96
    add  $10                                      ; $7D03: $C6 $10
    cp   $20                                      ; $7D05: $FE $20
    jr   nc, jr_019_7D3B                          ; $7D07: $30 $32

    inc  e                                        ; $7D09: $1C
    push de                                       ; $7D0A: $D5
    call func_019_7E3A                            ; $7D0B: $CD $3A $7E
    ldh  a, [hLinkDirection]                      ; $7D0E: $F0 $9E
    xor  $01                                      ; $7D10: $EE $01
    cp   e                                        ; $7D12: $BB
    pop  de                                       ; $7D13: $D1
    jr   nz, jr_019_7D3B                          ; $7D14: $20 $25

func_019_7D16:
    ld   hl, $C1AD                                ; $7D16: $21 $AD $C1
    ld   [hl], $01                                ; $7D19: $36 $01
    ld   a, [wDialogState]                        ; $7D1B: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D1E: $21 $4F $C1
    or   [hl]                                     ; $7D21: $B6
    ld   hl, $C146                                ; $7D22: $21 $46 $C1
    or   [hl]                                     ; $7D25: $B6
    ld   hl, $C134                                ; $7D26: $21 $34 $C1
    or   [hl]                                     ; $7D29: $B6
    jr   nz, jr_019_7D3B                          ; $7D2A: $20 $0F

    ld   a, [wWindowY]                            ; $7D2C: $FA $9A $DB
    cp   $80                                      ; $7D2F: $FE $80
    jr   nz, jr_019_7D3B                          ; $7D31: $20 $08

    ldh  a, [hJoypadState]                               ; $7D33: $F0 $CC
    and  $10                                      ; $7D35: $E6 $10
    jr   z, jr_019_7D3B                           ; $7D37: $28 $02

    scf                                           ; $7D39: $37
    ret                                           ; $7D3A: $C9

jr_019_7D3B:
    and  a                                        ; $7D3B: $A7
    ret                                           ; $7D3C: $C9

func_019_7D3D:
    ldh  a, [hActiveEntityStatus]                 ; $7D3D: $F0 $EA
    cp   $05                                      ; $7D3F: $FE $05
    jr   nz, jr_019_7D6C                          ; $7D41: $20 $29

func_019_7D43:
    ld   a, [wGameplayType]                       ; $7D43: $FA $95 $DB
    cp   $07                                      ; $7D46: $FE $07
    jr   z, jr_019_7D6C                           ; $7D48: $28 $22

    cp   $01                                      ; $7D4A: $FE $01
    jr   z, jr_019_7D59                           ; $7D4C: $28 $0B

    cp   $0B                                      ; $7D4E: $FE $0B
    jr   nz, jr_019_7D6C                          ; $7D50: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7D52: $FA $6B $C1
    cp   $04                                      ; $7D55: $FE $04
    jr   nz, jr_019_7D6C                          ; $7D57: $20 $13

jr_019_7D59:
    ld   hl, $C1A8                                ; $7D59: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7D5C: $FA $9F $C1
    or   [hl]                                     ; $7D5F: $B6
    ld   hl, wInventoryAppearing                  ; $7D60: $21 $4F $C1
    or   [hl]                                     ; $7D63: $B6
    jr   nz, jr_019_7D6C                          ; $7D64: $20 $06

    ld   a, [wRoomTransitionState]                ; $7D66: $FA $24 $C1
    and  a                                        ; $7D69: $A7
    jr   z, jr_019_7D6D                           ; $7D6A: $28 $01

jr_019_7D6C:
    pop  af                                       ; $7D6C: $F1

jr_019_7D6D:
    ret                                           ; $7D6D: $C9

func_019_7D6E:
    ld   hl, wEntitiesUnknowTableT                ; $7D6E: $21 $10 $C4
    add  hl, bc                                   ; $7D71: $09
    ld   a, [hl]                                  ; $7D72: $7E
    and  a                                        ; $7D73: $A7
    jr   z, jr_019_7DB7                           ; $7D74: $28 $41

    dec  a                                        ; $7D76: $3D
    ld   [hl], a                                  ; $7D77: $77
    call label_3E8E                               ; $7D78: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                       ; $7D7B: $21 $40 $C2
    add  hl, bc                                   ; $7D7E: $09
    ld   a, [hl]                                  ; $7D7F: $7E
    push af                                       ; $7D80: $F5
    ld   hl, wEntitiesSpeedYTable                       ; $7D81: $21 $50 $C2
    add  hl, bc                                   ; $7D84: $09
    ld   a, [hl]                                  ; $7D85: $7E
    push af                                       ; $7D86: $F5
    ld   hl, $C3F0                                ; $7D87: $21 $F0 $C3
    add  hl, bc                                   ; $7D8A: $09
    ld   a, [hl]                                  ; $7D8B: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7D8C: $21 $40 $C2
    add  hl, bc                                   ; $7D8F: $09
    ld   [hl], a                                  ; $7D90: $77
    ld   hl, wEntitiesUnknowTableS                ; $7D91: $21 $00 $C4
    add  hl, bc                                   ; $7D94: $09
    ld   a, [hl]                                  ; $7D95: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7D96: $21 $50 $C2
    add  hl, bc                                   ; $7D99: $09
    ld   [hl], a                                  ; $7D9A: $77
    call func_019_7DB8                            ; $7D9B: $CD $B8 $7D
    ld   hl, wEntitiesUnknowTableH                ; $7D9E: $21 $30 $C4
    add  hl, bc                                   ; $7DA1: $09
    ld   a, [hl]                                  ; $7DA2: $7E
    and  $20                                      ; $7DA3: $E6 $20
    jr   nz, jr_019_7DAA                          ; $7DA5: $20 $03

    call label_3B23                               ; $7DA7: $CD $23 $3B

jr_019_7DAA:
    ld   hl, wEntitiesSpeedYTable                       ; $7DAA: $21 $50 $C2
    add  hl, bc                                   ; $7DAD: $09
    pop  af                                       ; $7DAE: $F1
    ld   [hl], a                                  ; $7DAF: $77
    ld   hl, wEntitiesSpeedXTable                       ; $7DB0: $21 $40 $C2
    add  hl, bc                                   ; $7DB3: $09
    pop  af                                       ; $7DB4: $F1
    ld   [hl], a                                  ; $7DB5: $77
    pop  af                                       ; $7DB6: $F1

jr_019_7DB7:
    ret                                           ; $7DB7: $C9

func_019_7DB8:
label_019_7DB8:
    call func_019_7DC5                            ; $7DB8: $CD $C5 $7D

func_019_7DBB:
label_019_7DBB:
    push bc                                       ; $7DBB: $C5
    ld   a, c                                     ; $7DBC: $79
    add  $10                                      ; $7DBD: $C6 $10
    ld   c, a                                     ; $7DBF: $4F
    call func_019_7DC5                            ; $7DC0: $CD $C5 $7D
    pop  bc                                       ; $7DC3: $C1
    ret                                           ; $7DC4: $C9

func_019_7DC5:
    ld   hl, wEntitiesSpeedXTable                       ; $7DC5: $21 $40 $C2
    add  hl, bc                                   ; $7DC8: $09
    ld   a, [hl]                                  ; $7DC9: $7E
    and  a                                        ; $7DCA: $A7
    jr   z, jr_019_7DF0                           ; $7DCB: $28 $23

    push af                                       ; $7DCD: $F5
    swap a                                        ; $7DCE: $CB $37
    and  $F0                                      ; $7DD0: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $7DD2: $21 $60 $C2
    add  hl, bc                                   ; $7DD5: $09
    add  [hl]                                     ; $7DD6: $86
    ld   [hl], a                                  ; $7DD7: $77
    rl   d                                        ; $7DD8: $CB $12
    ld   hl, wEntitiesPosXTable                         ; $7DDA: $21 $00 $C2

jr_019_7DDD:
    add  hl, bc                                   ; $7DDD: $09
    pop  af                                       ; $7DDE: $F1
    ld   e, $00                                   ; $7DDF: $1E $00
    bit  7, a                                     ; $7DE1: $CB $7F
    jr   z, jr_019_7DE7                           ; $7DE3: $28 $02

    ld   e, $F0                                   ; $7DE5: $1E $F0

jr_019_7DE7:
    swap a                                        ; $7DE7: $CB $37
    and  $0F                                      ; $7DE9: $E6 $0F
    or   e                                        ; $7DEB: $B3
    rr   d                                        ; $7DEC: $CB $1A
    adc  [hl]                                     ; $7DEE: $8E
    ld   [hl], a                                  ; $7DEF: $77

jr_019_7DF0:
    ret                                           ; $7DF0: $C9

func_019_7DF1:
    ld   hl, wEntitiesSpeedZTable                 ; $7DF1: $21 $20 $C3
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  a                                        ; $7DF6: $A7
    jr   z, jr_019_7DF0                           ; $7DF7: $28 $F7

    push af                                       ; $7DF9: $F5
    swap a                                        ; $7DFA: $CB $37
    and  $F0                                      ; $7DFC: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $7DFE: $21 $30 $C3
    add  hl, bc                                   ; $7E01: $09
    add  [hl]                                     ; $7E02: $86
    ld   [hl], a                                  ; $7E03: $77
    rl   d                                        ; $7E04: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7E06: $21 $10 $C3

label_019_7E09:
    jr   jr_019_7DDD                              ; $7E09: $18 $D2

func_019_7E0B:
    ld   e, $00                                   ; $7E0B: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E0D: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $7E0F: $21 $00 $C2
    add  hl, bc                                   ; $7E12: $09
    sub  [hl]                                     ; $7E13: $96
    bit  7, a                                     ; $7E14: $CB $7F
    jr   z, jr_019_7E19                           ; $7E16: $28 $01

    inc  e                                        ; $7E18: $1C

jr_019_7E19:
    ld   d, a                                     ; $7E19: $57
    ret                                           ; $7E1A: $C9

func_019_7E1B:
    ld   e, $02                                   ; $7E1B: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E1D: $F0 $99
    ld   hl, wEntitiesPosYTable                         ; $7E1F: $21 $10 $C2
    add  hl, bc                                   ; $7E22: $09
    sub  [hl]                                     ; $7E23: $96
    bit  7, a                                     ; $7E24: $CB $7F
    jr   nz, jr_019_7E29                          ; $7E26: $20 $01

    inc  e                                        ; $7E28: $1C

jr_019_7E29:
    ld   d, a                                     ; $7E29: $57
    ret                                           ; $7E2A: $C9

    ld   e, $02                                   ; $7E2B: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E2D: $F0 $99
    ld   hl, wActiveEntityPosY                    ; $7E2F: $21 $EC $FF
    sub  [hl]                                     ; $7E32: $96
    bit  7, a                                     ; $7E33: $CB $7F
    jr   nz, jr_019_7E38                          ; $7E35: $20 $01

    inc  e                                        ; $7E37: $1C

jr_019_7E38:
    ld   d, a                                     ; $7E38: $57
    ret                                           ; $7E39: $C9

func_019_7E3A:
    call func_019_7E0B                            ; $7E3A: $CD $0B $7E
    ld   a, e                                     ; $7E3D: $7B
    ldh  [hScratch0], a                           ; $7E3E: $E0 $D7
    ld   a, d                                     ; $7E40: $7A
    bit  7, a                                     ; $7E41: $CB $7F
    jr   z, jr_019_7E47                           ; $7E43: $28 $02

    cpl                                           ; $7E45: $2F
    inc  a                                        ; $7E46: $3C

jr_019_7E47:
    push af                                       ; $7E47: $F5
    call func_019_7E1B                            ; $7E48: $CD $1B $7E
    ld   a, e                                     ; $7E4B: $7B
    ldh  [hScratch1], a                           ; $7E4C: $E0 $D8
    ld   a, d                                     ; $7E4E: $7A
    bit  7, a                                     ; $7E4F: $CB $7F
    jr   z, jr_019_7E55                           ; $7E51: $28 $02

    cpl                                           ; $7E53: $2F
    inc  a                                        ; $7E54: $3C

jr_019_7E55:
    pop  de                                       ; $7E55: $D1
    cp   d                                        ; $7E56: $BA
    jr   nc, jr_019_7E5D                          ; $7E57: $30 $04

    ldh  a, [hScratch0]                           ; $7E59: $F0 $D7
    jr   jr_019_7E5F                              ; $7E5B: $18 $02

jr_019_7E5D:
    ldh  a, [hScratch1]                           ; $7E5D: $F0 $D8

jr_019_7E5F:
    ld   e, a                                     ; $7E5F: $5F
    ret                                           ; $7E60: $C9

func_019_7E61:
label_019_7E61:
    ld   hl, wEntitiesStatusTable                        ; $7E61: $21 $80 $C2
    add  hl, bc                                   ; $7E64: $09
    ld   [hl], b                                  ; $7E65: $70
    ret                                           ; $7E66: $C9

    ld   hl, wEntitiesUnknownTableC               ; $7E67: $21 $C0 $C2
    add  hl, bc                                   ; $7E6A: $09
    ld   a, [hl]                                  ; $7E6B: $7E
    rst  $00                                      ; $7E6C: $C7
    ld   [hl], e                                  ; $7E6D: $73
    ld   a, [hl]                                  ; $7E6E: $7E
    add  h                                        ; $7E6F: $84
    ld   a, [hl]                                  ; $7E70: $7E
    sub  e                                        ; $7E71: $93
    ld   a, [hl]                                  ; $7E72: $7E
    call GetEntityTransitionCountdown             ; $7E73: $CD $05 $0C
    ld   [hl], $A0                                ; $7E76: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7E78: $21 $20 $C4
    add  hl, bc                                   ; $7E7B: $09
    ld   [hl], $FF                                ; $7E7C: $36 $FF

label_019_7E7E:
    ld   hl, wEntitiesUnknownTableC               ; $7E7E: $21 $C0 $C2
    add  hl, bc                                   ; $7E81: $09
    inc  [hl]                                     ; $7E82: $34
    ret                                           ; $7E83: $C9

    call GetEntityTransitionCountdown             ; $7E84: $CD $05 $0C
    ret  nz                                       ; $7E87: $C0

    ld   [hl], $C0                                ; $7E88: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7E8A: $21 $20 $C4
    add  hl, bc                                   ; $7E8D: $09
    ld   [hl], $FF                                ; $7E8E: $36 $FF
    jp   label_019_7E7E                           ; $7E90: $C3 $7E $7E

    call GetEntityTransitionCountdown             ; $7E93: $CD $05 $0C
    jr   nz, jr_019_7EA1                          ; $7E96: $20 $09

    call PlayBombExplosionSfx                     ; $7E98: $CD $4B $0C
    call label_27DD                               ; $7E9B: $CD $DD $27
    jp   DidKillEnemy                             ; $7E9E: $C3 $50 $3F

jr_019_7EA1:
    jp   label_019_7EA4                           ; $7EA1: $C3 $A4 $7E

label_019_7EA4:
    and  $07                                      ; $7EA4: $E6 $07
    ret  nz                                       ; $7EA6: $C0

    call GetRandomByte                            ; $7EA7: $CD $0D $28
    and  $1F                                      ; $7EAA: $E6 $1F
    sub  $10                                      ; $7EAC: $D6 $10
    ld   e, a                                     ; $7EAE: $5F
    ld   hl, wActiveEntityPosX                    ; $7EAF: $21 $EE $FF
    add  [hl]                                     ; $7EB2: $86
    ld   [hl], a                                  ; $7EB3: $77
    call GetRandomByte                            ; $7EB4: $CD $0D $28
    and  $1F                                      ; $7EB7: $E6 $1F
    sub  $14                                      ; $7EB9: $D6 $14
    ld   e, a                                     ; $7EBB: $5F
    ld   hl, wActiveEntityPosY                    ; $7EBC: $21 $EC $FF
    add  [hl]                                     ; $7EBF: $86
    ld   [hl], a                                  ; $7EC0: $77
    jp   label_019_7EC4                           ; $7EC1: $C3 $C4 $7E

label_019_7EC4:
    call func_019_7D43                            ; $7EC4: $CD $43 $7D
    ldh  a, [wActiveEntityPosX]                   ; $7EC7: $F0 $EE
    ldh  [hScratch0], a                           ; $7EC9: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7ECB: $F0 $EC
    ldh  [hScratch1], a                           ; $7ECD: $E0 $D8
    ld   a, $02                                   ; $7ECF: $3E $02
    call label_CC7                                ; $7ED1: $CD $C7 $0C
    ld   a, $13                                   ; $7ED4: $3E $13
    ldh  [hNoiseSfx], a                           ; $7ED6: $E0 $F4
    ret                                           ; $7ED8: $C9

    ld   a, $36                                   ; $7ED9: $3E $36
    call SpawnNewEntity_trampoline                ; $7EDB: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7EDE: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7EE0: $21 $00 $C2
    add  hl, de                                   ; $7EE3: $19
    ld   [hl], a                                  ; $7EE4: $77
    ldh  a, [hScratch1]                           ; $7EE5: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7EE7: $21 $10 $C2
    add  hl, de                                   ; $7EEA: $19
    ld   [hl], a                                  ; $7EEB: $77
    ldh  a, [hIsSideScrolling]                    ; $7EEC: $F0 $F9
    and  a                                        ; $7EEE: $A7
    jr   z, jr_019_7EF9                           ; $7EEF: $28 $08

    ld   hl, wEntitiesSpeedYTable                       ; $7EF1: $21 $50 $C2
    add  hl, bc                                   ; $7EF4: $09
    ld   [hl], $F0                                ; $7EF5: $36 $F0
    jr   jr_019_7F05                              ; $7EF7: $18 $0C

jr_019_7EF9:
    ld   hl, wEntitiesSpeedZTable                 ; $7EF9: $21 $20 $C3
    add  hl, de                                   ; $7EFC: $19
    ld   [hl], $10                                ; $7EFD: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7EFF: $21 $10 $C3
    add  hl, de                                   ; $7F02: $19
    ld   [hl], $08                                ; $7F03: $36 $08

jr_019_7F05:
    call func_019_7E61                            ; $7F05: $CD $61 $7E
    ld   hl, hNoiseSfx                            ; $7F08: $21 $F4 $FF
    ld   [hl], $1A                                ; $7F0B: $36 $1A
    ret                                           ; $7F0D: $C9

func_019_7F0E:
    ld   hl, wOverworldRoomStatus                 ; $7F0E: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7F11: $F0 $F6
    ld   e, a                                     ; $7F13: $5F
    ld   a, [wIsIndoor]                           ; $7F14: $FA $A5 $DB
    ld   d, a                                     ; $7F17: $57
    ldh  a, [hMapId]                              ; $7F18: $F0 $F7
    cp   $1A                                      ; $7F1A: $FE $1A
    jr   nc, jr_019_7F23                          ; $7F1C: $30 $05

    cp   $06                                      ; $7F1E: $FE $06
    jr   c, jr_019_7F23                           ; $7F20: $38 $01

    inc  d                                        ; $7F22: $14

jr_019_7F23:
    add  hl, de                                   ; $7F23: $19
    ld   a, [hl]                                  ; $7F24: $7E
    or   $20                                      ; $7F25: $F6 $20
    ld   [hl], a                                  ; $7F27: $77
    ldh  [hRoomStatus], a                         ; $7F28: $E0 $F8
    ret                                           ; $7F2A: $C9

