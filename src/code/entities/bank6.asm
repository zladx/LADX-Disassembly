; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

Data_006_4000::
    db   $50, $03, $52, $03, $54, $03, $56, $03, $50, $03, $52, $03, $54, $03, $56, $03
    db   $58, $03, $5A, $03, $5C, $03, $5E, $03, $5A, $23, $58, $23, $5E, $23, $5C, $23

    ld   a, $21                                   ; $4020: $3E $21
    ldh  [wActiveEntityPosY], a                   ; $4022: $E0 $EC
    ld   de, Data_006_4000                        ; $4024: $11 $00 $40
    call RenderAnimatedActiveEntity                               ; $4027: $CD $C0 $3B
    call func_006_64C6                            ; $402A: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $402D: $F0 $E7
    and  $1F                                      ; $402F: $E6 $1F
    jr   nz, jr_006_403B                          ; $4031: $20 $08

    call func_006_65B4                            ; $4033: $CD $B4 $65
    ld   hl, $C380                                ; $4036: $21 $80 $C3
    add  hl, bc                                   ; $4039: $09
    ld   [hl], e                                  ; $403A: $73

jr_006_403B:
    call func_006_6441                            ; $403B: $CD $41 $64
    ld   hl, wEntitiesUnknownTableB               ; $403E: $21 $B0 $C2
    add  hl, bc                                   ; $4041: $09
    ld   a, [hl]                                  ; $4042: $7E
    and  a                                        ; $4043: $A7
    jr   nz, jr_006_4049                          ; $4044: $20 $03

    call func_006_641A                            ; $4046: $CD $1A $64

jr_006_4049:
    ldh  a, [hActiveEntityState]                  ; $4049: $F0 $F0
    rst  $00                                      ; $404B: $C7
    ld   d, [hl]                                  ; $404C: $56
    ld   b, b                                     ; $404D: $40
    ld   l, b                                     ; $404E: $68
    ld   b, b                                     ; $404F: $40
    push bc                                       ; $4050: $C5
    ld   b, b                                     ; $4051: $40
    ret  c                                        ; $4052: $D8

    ld   b, b                                     ; $4053: $40
    jp   hl                                       ; $4054: $E9

    ld   b, b                                     ; $4055: $40
    call IncrementEntityWalkingAttr               ; $4056: $CD $12 $3B
    ld   a, [wGoldenLeavesCount]                  ; $4059: $FA $15 $DB
    cp   $06                                      ; $405C: $FE $06
    ret  c                                        ; $405E: $D8

    ld   [hl], $04                                ; $405F: $36 $04
    ld   hl, wEntitiesPosXTable                         ; $4061: $21 $00 $C2
    add  hl, bc                                   ; $4064: $09
    ld   [hl], $58                                ; $4065: $36 $58
    ret                                           ; $4067: $C9

    call func_006_645D                            ; $4068: $CD $5D $64
    ret  nc                                       ; $406B: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $406C: $FA $56 $DB
    and  a                                        ; $406F: $A7
    jr   z, jr_006_4077                           ; $4070: $28 $05

    ld   e, $2D                                   ; $4072: $1E $2D
    jp   label_006_40C1                           ; $4074: $C3 $C1 $40

jr_006_4077:
    ldh  a, [hRoomStatus]                         ; $4077: $F0 $F8
    and  $10                                      ; $4079: $E6 $10
    jr   z, jr_006_4083                           ; $407B: $28 $06

    ld   a, [wGoldenLeavesCount]                  ; $407D: $FA $15 $DB
    and  a                                        ; $4080: $A7
    jr   nz, jr_006_40A0                          ; $4081: $20 $1D

jr_006_4083:
    ldh  a, [hRoomStatus]                         ; $4083: $F0 $F8
    or   $10                                      ; $4085: $F6 $10
    ldh  [hRoomStatus], a                         ; $4087: $E0 $F8
    ld   [$DAC7], a                               ; $4089: $EA $C7 $DA
    ld   a, $3A                                   ; $408C: $3E $3A
    call OpenDialogInTable1                       ; $408E: $CD $73 $23
    ld   a, [wDB55]                               ; $4091: $FA $55 $DB
    cp   $02                                      ; $4094: $FE $02
    jr   nc, jr_006_409D                          ; $4096: $30 $05

    ld   a, $02                                   ; $4098: $3E $02
    ld   [wDB55], a                               ; $409A: $EA $55 $DB

jr_006_409D:
    jp   IncrementEntityWalkingAttr               ; $409D: $C3 $12 $3B

jr_006_40A0:
    ld   e, $3F                                   ; $40A0: $1E $3F
    cp   $05                                      ; $40A2: $FE $05
    jr   c, jr_006_40C1                           ; $40A4: $38 $1B

    call IncrementEntityWalkingAttr               ; $40A6: $CD $12 $3B
    ld   [hl], $03                                ; $40A9: $36 $03
    call GetEntityTransitionCountdown             ; $40AB: $CD $05 $0C
    ld   [hl], $20                                ; $40AE: $36 $20
    ld   hl, wEntitiesUnknownTableB               ; $40B0: $21 $B0 $C2
    add  hl, bc                                   ; $40B3: $09
    ld   [hl], $01                                ; $40B4: $36 $01
    ld   a, $FF                                   ; $40B6: $3E $FF
    ld   [wGoldenLeavesCount], a                  ; $40B8: $EA $15 $DB
    ld   a, $09                                   ; $40BB: $3E $09
    ldh  [hFFA5], a                               ; $40BD: $E0 $A5
    ld   e, $3D                                   ; $40BF: $1E $3D

label_006_40C1:
jr_006_40C1:
    ld   a, e                                     ; $40C1: $7B
    jp   OpenDialogInTable1                       ; $40C2: $C3 $73 $23

    ld   a, [wC177]                               ; $40C5: $FA $77 $C1
    and  a                                        ; $40C8: $A7
    ld   a, $3B                                   ; $40C9: $3E $3B
    jr   z, jr_006_40CF                           ; $40CB: $28 $02

    ld   a, $3C                                   ; $40CD: $3E $3C

jr_006_40CF:
    call OpenDialogInTable1                       ; $40CF: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $40D2: $CD $12 $3B
    ld   [hl], $01                                ; $40D5: $36 $01
    ret                                           ; $40D7: $C9

    call GetEntityTransitionCountdown             ; $40D8: $CD $05 $0C
    jr   nz, jr_006_40E0                          ; $40DB: $20 $03

    call IncrementEntityWalkingAttr               ; $40DD: $CD $12 $3B

jr_006_40E0:
    ld   hl, wEntitiesSpeedXTable                       ; $40E0: $21 $40 $C2
    add  hl, bc                                   ; $40E3: $09
    ld   [hl], $F8                                ; $40E4: $36 $F8
    jp   label_006_654E                           ; $40E6: $C3 $4E $65

    call func_006_645D                            ; $40E9: $CD $5D $64
    jr   nc, jr_006_40FC                          ; $40EC: $30 $0E

    ld   a, [wGoldenLeavesCount]                  ; $40EE: $FA $15 $DB
    cp   $06                                      ; $40F1: $FE $06
    ld   a, $3E                                   ; $40F3: $3E $3E
    jr   z, jr_006_40F9                           ; $40F5: $28 $02

    ld   a, $3D                                   ; $40F7: $3E $3D

jr_006_40F9:
    call OpenDialogInTable1                       ; $40F9: $CD $73 $23

jr_006_40FC:
    ldh  a, [hLinkPositionX]                      ; $40FC: $F0 $98
    sub  $78                                      ; $40FE: $D6 $78
    add  $02                                      ; $4100: $C6 $02
    cp   $04                                      ; $4102: $FE $04
    ret  nc                                       ; $4104: $D0

    ldh  a, [hLinkPositionY]                      ; $4105: $F0 $99
    sub  $20                                      ; $4107: $D6 $20
    add  $05                                      ; $4109: $C6 $05
    cp   $0A                                      ; $410B: $FE $0A
    ret  nc                                       ; $410D: $D0

    ld   hl, wWarpStructs                         ; $410E: $21 $01 $D4
    ld   a, $01                                   ; $4111: $3E $01
    ld   [hl+], a                                 ; $4113: $22
    ld   a, $11                                   ; $4114: $3E $11
    ld   [hl+], a                                 ; $4116: $22
    ld   a, $D8                                   ; $4117: $3E $D8
    ld   [hl+], a                                 ; $4119: $22
    ld   a, $88                                   ; $411A: $3E $88
    ld   [hl+], a                                 ; $411C: $22
    ld   a, $70                                   ; $411D: $3E $70
    ld   [hl+], a                                 ; $411F: $22
    call func_006_65DB                            ; $4120: $CD $DB $65
    jp   ApplyMapFadeOutTransition                ; $4123: $C3 $7D $0C

    rst  $38                                      ; $4126: $FF
    nop                                           ; $4127: $00
    rst  $38                                      ; $4128: $FF
    jr   nz, jr_006_419B                          ; $4129: $20 $70

    ld   [bc], a                                  ; $412B: $02
    ld   [hl], b                                  ; $412C: $70
    ld   [hl+], a                                 ; $412D: $22
    ld   [hl], d                                  ; $412E: $72
    ld   [bc], a                                  ; $412F: $02
    ld   [hl], d                                  ; $4130: $72
    ld   [hl+], a                                 ; $4131: $22
    ld   [hl], h                                  ; $4132: $74
    ld   [bc], a                                  ; $4133: $02
    db   $76                                      ; $4134: $76
    ld   [bc], a                                  ; $4135: $02
    db   $76                                      ; $4136: $76
    ld   [hl+], a                                 ; $4137: $22
    ld   [hl], h                                  ; $4138: $74
    ld   [hl+], a                                 ; $4139: $22
    jr   z, @+$3A                                 ; $413A: $28 $38

    ld   e, b                                     ; $413C: $58
    ld   e, b                                     ; $413D: $58
    ld   a, b                                     ; $413E: $78
    adc  b                                        ; $413F: $88
    jr   z, @-$76                                 ; $4140: $28 $88

    ld   b, b                                     ; $4142: $40
    ld   [hl], b                                  ; $4143: $70
    jr   nz, jr_006_4196                          ; $4144: $20 $50

    ld   [hl], b                                  ; $4146: $70
    ld   b, b                                     ; $4147: $40
    ld   b, b                                     ; $4148: $40
    ld   b, b                                     ; $4149: $40
    ldh  a, [hRoomStatus]                         ; $414A: $F0 $F8
    and  $10                                      ; $414C: $E6 $10
    jp   nz, label_006_65DB                       ; $414E: $C2 $DB $65

    ld   hl, $C4E0                                ; $4151: $21 $E0 $C4
    add  hl, bc                                   ; $4154: $09
    ld   [hl], $3C                                ; $4155: $36 $3C
    ld   hl, $C460                                ; $4157: $21 $60 $C4
    add  hl, bc                                   ; $415A: $09
    ld   [hl], $FF                                ; $415B: $36 $FF
    ld   de, $4126                                ; $415D: $11 $26 $41
    call RenderAnimatedActiveEntity                               ; $4160: $CD $C0 $3B
    call func_006_64C6                            ; $4163: $CD $C6 $64
    call label_C56                                ; $4166: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $4169: $F0 $F0
    rst  $00                                      ; $416B: $C7
    db   $76                                      ; $416C: $76
    ld   b, c                                     ; $416D: $41
    ld   a, [hl]                                  ; $416E: $7E
    ld   b, c                                     ; $416F: $41
    or   [hl]                                     ; $4170: $B6
    ld   b, c                                     ; $4171: $41
    jp   z, DoUpdateBGRegion.loop                 ; $4172: $CA $41 $22

    ld   b, d                                     ; $4175: $42
    call GetEntityTransitionCountdown             ; $4176: $CD $05 $0C
    ld   [hl], $40                                ; $4179: $36 $40
    jp   IncrementEntityWalkingAttr               ; $417B: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $417E: $CD $05 $0C
    ret  nz                                       ; $4181: $C0

    call GetRandomByte                            ; $4182: $CD $0D $28
    and  $07                                      ; $4185: $E6 $07
    ld   e, a                                     ; $4187: $5F
    ld   d, b                                     ; $4188: $50
    ld   hl, $413A                                ; $4189: $21 $3A $41
    add  hl, de                                   ; $418C: $19
    ld   a, [hl]                                  ; $418D: $7E
    ld   hl, wEntitiesPosXTable                         ; $418E: $21 $00 $C2
    add  hl, bc                                   ; $4191: $09
    ld   [hl], a                                  ; $4192: $77
    ld   hl, $4142                                ; $4193: $21 $42 $41

jr_006_4196:
    add  hl, de                                   ; $4196: $19
    ld   a, [hl]                                  ; $4197: $7E
    ld   hl, wEntitiesPosYTable                         ; $4198: $21 $10 $C2

jr_006_419B:
    add  hl, bc                                   ; $419B: $09
    ld   [hl], a                                  ; $419C: $77
    call func_006_6594                            ; $419D: $CD $94 $65
    add  $20                                      ; $41A0: $C6 $20
    cp   $40                                      ; $41A2: $FE $40
    jr   nc, jr_006_41AE                          ; $41A4: $30 $08

    call func_006_65A4                            ; $41A6: $CD $A4 $65
    add  $20                                      ; $41A9: $C6 $20
    cp   $40                                      ; $41AB: $FE $40
    ret  c                                        ; $41AD: $D8

jr_006_41AE:
    call GetEntityTransitionCountdown             ; $41AE: $CD $05 $0C
    ld   [hl], $18                                ; $41B1: $36 $18
    jp   IncrementEntityWalkingAttr               ; $41B3: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $41B6: $CD $05 $0C
    jr   nz, jr_006_41C0                          ; $41B9: $20 $05

    ld   [hl], $30                                ; $41BB: $36 $30
    jp   IncrementEntityWalkingAttr               ; $41BD: $C3 $12 $3B

jr_006_41C0:
    cp   $0C                                      ; $41C0: $FE $0C
    ld   a, $01                                   ; $41C2: $3E $01
    jr   nc, jr_006_41C7                          ; $41C4: $30 $01

    inc  a                                        ; $41C6: $3C

jr_006_41C7:
    jp   SetEntitySpriteVariant                   ; $41C7: $C3 $0C $3B

    call label_3B39                               ; $41CA: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $41CD: $CD $05 $0C
    jr   nz, jr_006_4218                          ; $41D0: $20 $46

    ld   [hl], $10                                ; $41D2: $36 $10
    call IncrementEntityWalkingAttr               ; $41D4: $CD $12 $3B
    ld   hl, $C420                                ; $41D7: $21 $20 $C4
    add  hl, bc                                   ; $41DA: $09
    ld   a, [hl]                                  ; $41DB: $7E
    and  a                                        ; $41DC: $A7
    jr   nz, jr_006_4217                          ; $41DD: $20 $38

    ld   a, $02                                   ; $41DF: $3E $02
    call func_003_64CA_trampoline                               ; $41E1: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $41E4: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $41E6: $21 $00 $C2
    add  hl, de                                   ; $41E9: $19
    ld   [hl], a                                  ; $41EA: $77
    ldh  a, [hScratch1]                           ; $41EB: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $41ED: $21 $10 $C2
    add  hl, de                                   ; $41F0: $19
    ld   [hl], a                                  ; $41F1: $77
    ld   hl, wEntitiesPosZTable                   ; $41F2: $21 $10 $C3
    add  hl, de                                   ; $41F5: $19
    ld   [hl], $04                                ; $41F6: $36 $04

label_006_41F8:
    ld   hl, wEntitiesSpeedZTable                 ; $41F8: $21 $20 $C3
    add  hl, de                                   ; $41FB: $19
    ld   [hl], $18                                ; $41FC: $36 $18
    ld   hl, wEntitiesTransitionCountdownTable    ; $41FE: $21 $E0 $C2
    add  hl, de                                   ; $4201: $19
    ld   [hl], $40                                ; $4202: $36 $40
    ld   hl, $C440                                ; $4204: $21 $40 $C4
    add  hl, de                                   ; $4207: $19
    ld   [hl], $01                                ; $4208: $36 $01
    push bc                                       ; $420A: $C5
    ld   c, e                                     ; $420B: $4B
    ld   b, d                                     ; $420C: $42
    ld   a, $10                                   ; $420D: $3E $10
    call label_3BAA                               ; $420F: $CD $AA $3B
    pop  bc                                       ; $4212: $C1
    ld   a, $08                                   ; $4213: $3E $08
    ldh  [hJingle], a                             ; $4215: $E0 $F2

jr_006_4217:
    ret                                           ; $4217: $C9

jr_006_4218:
    and  $20                                      ; $4218: $E6 $20
    ld   a, $03                                   ; $421A: $3E $03
    jr   nz, jr_006_421F                          ; $421C: $20 $01

    inc  a                                        ; $421E: $3C

jr_006_421F:
    jp   SetEntitySpriteVariant                   ; $421F: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $4222: $CD $05 $0C
    jr   nz, jr_006_4230                          ; $4225: $20 $09

    call IncrementEntityWalkingAttr               ; $4227: $CD $12 $3B
    ld   [hl], b                                  ; $422A: $70
    ld   a, $FF                                   ; $422B: $3E $FF
    jp   SetEntitySpriteVariant                   ; $422D: $C3 $0C $3B

jr_006_4230:
    cp   $08                                      ; $4230: $FE $08
    ld   a, $01                                   ; $4232: $3E $01
    jr   c, jr_006_4237                           ; $4234: $38 $01

    inc  a                                        ; $4236: $3C

jr_006_4237:
    jp   SetEntitySpriteVariant                   ; $4237: $C3 $0C $3B

    call $44B6                                    ; $423A: $CD $B6 $44
    call func_006_64C6                            ; $423D: $CD $C6 $64
    call func_006_64F7                            ; $4240: $CD $F7 $64
    call func_006_657A                            ; $4243: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $4246: $21 $20 $C3
    add  hl, bc                                   ; $4249: $09
    dec  [hl]                                     ; $424A: $35
    dec  [hl]                                     ; $424B: $35
    dec  [hl]                                     ; $424C: $35
    ld   hl, wEntitiesPosZTable                   ; $424D: $21 $10 $C3
    add  hl, bc                                   ; $4250: $09
    ld   a, [hl]                                  ; $4251: $7E
    and  $80                                      ; $4252: $E6 $80
    ldh  [hFFE8], a                               ; $4254: $E0 $E8
    jr   z, jr_006_425E                           ; $4256: $28 $06

    ld   [hl], b                                  ; $4258: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4259: $21 $20 $C3
    add  hl, bc                                   ; $425C: $09
    ld   [hl], b                                  ; $425D: $70

jr_006_425E:
    ldh  a, [hActiveEntityState]                  ; $425E: $F0 $F0
    rst  $00                                      ; $4260: $C7
    ld   l, e                                     ; $4261: $6B
    ld   b, d                                     ; $4262: $42
    ret                                           ; $4263: $C9

    ld   b, d                                     ; $4264: $42
    inc  de                                       ; $4265: $13
    ld   b, e                                     ; $4266: $43
    push bc                                       ; $4267: $C5
    ld   b, e                                     ; $4268: $43
    jr   z, @+$46                                 ; $4269: $28 $44

    call GetEntityTransitionCountdown             ; $426B: $CD $05 $0C
    jr   nz, jr_006_42A2                          ; $426E: $20 $32

    call label_3D7F                               ; $4270: $CD $7F $3D
    call label_BFB                                ; $4273: $CD $FB $0B
    jr   nz, jr_006_4294                          ; $4276: $20 $1C

    call func_006_6594                            ; $4278: $CD $94 $65
    ld   hl, $C380                                ; $427B: $21 $80 $C3
    add  hl, bc                                   ; $427E: $09
    ld   a, [hl]                                  ; $427F: $7E
    and  $01                                      ; $4280: $E6 $01
    cp   e                                        ; $4282: $BB
    jr   nz, jr_006_4294                          ; $4283: $20 $0F

    call IncrementEntityWalkingAttr               ; $4285: $CD $12 $3B
    ld   [hl], $02                                ; $4288: $36 $02
    call GetEntityTransitionCountdown             ; $428A: $CD $05 $0C
    ld   [hl], $FF                                ; $428D: $36 $FF
    ld   a, $3B                                   ; $428F: $3E $3B
    ldh  [hNoiseSfx], a                           ; $4291: $E0 $F4
    ret                                           ; $4293: $C9

jr_006_4294:
    call GetEntityTransitionCountdown             ; $4294: $CD $05 $0C
    call GetRandomByte                            ; $4297: $CD $0D $28
    and  $1F                                      ; $429A: $E6 $1F
    add  $10                                      ; $429C: $C6 $10
    ld   [hl], a                                  ; $429E: $77
    call IncrementEntityWalkingAttr               ; $429F: $CD $12 $3B

label_006_42A2:
jr_006_42A2:
    ldh  a, [hFFE8]                               ; $42A2: $F0 $E8
    and  a                                        ; $42A4: $A7
    jr   z, jr_006_42AD                           ; $42A5: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $42A7: $21 $20 $C3
    add  hl, bc                                   ; $42AA: $09
    ld   [hl], $10                                ; $42AB: $36 $10

jr_006_42AD:
    call func_006_6541                            ; $42AD: $CD $41 $65
    call label_3B23                               ; $42B0: $CD $23 $3B
    ld   hl, $C380                                ; $42B3: $21 $80 $C3
    add  hl, bc                                   ; $42B6: $09
    ld   a, [hl]                                  ; $42B7: $7E
    rla                                           ; $42B8: $17
    and  $06                                      ; $42B9: $E6 $06
    call SetEntitySpriteVariant                   ; $42BB: $CD $0C $3B
    jp   label_3B39                               ; $42BE: $C3 $39 $3B

    ld   [$08F8], sp                              ; $42C1: $08 $F8 $08
    ld   hl, sp-$08                               ; $42C4: $F8 $F8
    ld   hl, sp+$08                               ; $42C6: $F8 $08
    ld   [$05CD], sp                              ; $42C8: $08 $CD $05
    inc  c                                        ; $42CB: $0C
    jr   nz, jr_006_4310                          ; $42CC: $20 $42

    call GetRandomByte                            ; $42CE: $CD $0D $28
    and  $1F                                      ; $42D1: $E6 $1F
    add  $20                                      ; $42D3: $C6 $20
    ld   [hl], a                                  ; $42D5: $77
    call IncrementEntityWalkingAttr               ; $42D6: $CD $12 $3B
    ld   [hl], b                                  ; $42D9: $70
    call GetRandomByte                            ; $42DA: $CD $0D $28
    bit  2, a                                     ; $42DD: $CB $57
    jr   z, jr_006_42E5                           ; $42DF: $28 $04

    and  $03                                      ; $42E1: $E6 $03
    jr   jr_006_42F5                              ; $42E3: $18 $10

jr_006_42E5:
    call func_006_6594                            ; $42E5: $CD $94 $65
    push de                                       ; $42E8: $D5
    call func_006_65A4                            ; $42E9: $CD $A4 $65
    ld   a, e                                     ; $42EC: $7B
    and  $03                                      ; $42ED: $E6 $03
    dec  a                                        ; $42EF: $3D
    dec  a                                        ; $42F0: $3D
    sla  a                                        ; $42F1: $CB $27
    pop  de                                       ; $42F3: $D1
    or   e                                        ; $42F4: $B3

jr_006_42F5:
    ld   e, a                                     ; $42F5: $5F
    ld   hl, $C380                                ; $42F6: $21 $80 $C3
    add  hl, bc                                   ; $42F9: $09
    ld   [hl], e                                  ; $42FA: $73
    ld   d, b                                     ; $42FB: $50
    ld   hl, $42C1                                ; $42FC: $21 $C1 $42
    add  hl, de                                   ; $42FF: $19
    ld   a, [hl]                                  ; $4300: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4301: $21 $40 $C2
    add  hl, bc                                   ; $4304: $09
    ld   [hl], a                                  ; $4305: $77
    ld   hl, $42C5                                ; $4306: $21 $C5 $42
    add  hl, de                                   ; $4309: $19
    ld   a, [hl]                                  ; $430A: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $430B: $21 $50 $C2
    add  hl, bc                                   ; $430E: $09
    ld   [hl], a                                  ; $430F: $77

jr_006_4310:
    jp   label_006_42A2                           ; $4310: $C3 $A2 $42

    call label_3B70                               ; $4313: $CD $70 $3B
    call GetEntityTransitionCountdown             ; $4316: $CD $05 $0C
    jr   nz, jr_006_432B                          ; $4319: $20 $10

label_006_431B:
    call IncrementEntityWalkingAttr               ; $431B: $CD $12 $3B
    ld   [hl], b                                  ; $431E: $70
    call label_BFB                                ; $431F: $CD $FB $0B
    call GetRandomByte                            ; $4322: $CD $0D $28
    and  $1F                                      ; $4325: $E6 $1F
    add  $08                                      ; $4327: $C6 $08
    ld   [hl], a                                  ; $4329: $77
    ret                                           ; $432A: $C9

jr_006_432B:
    ld   a, $01                                   ; $432B: $3E $01
    ld   [$D3E6], a                               ; $432D: $EA $E6 $D3
    ld   hl, wEntitiesSpeedZTable                 ; $4330: $21 $20 $C3
    add  hl, bc                                   ; $4333: $09
    ld   [hl], b                                  ; $4334: $70
    ldh  a, [hFrameCounter]                       ; $4335: $F0 $E7
    and  $03                                      ; $4337: $E6 $03
    jr   nz, jr_006_434B                          ; $4339: $20 $10

    ld   hl, wEntitiesPosZTable                   ; $433B: $21 $10 $C3
    add  hl, bc                                   ; $433E: $09
    ld   a, [hl]                                  ; $433F: $7E
    sub  $0C                                      ; $4340: $D6 $0C
    jr   z, jr_006_434B                           ; $4342: $28 $07

    and  $80                                      ; $4344: $E6 $80
    jr   z, jr_006_434A                           ; $4346: $28 $02

    inc  [hl]                                     ; $4348: $34
    inc  [hl]                                     ; $4349: $34

jr_006_434A:
    dec  [hl]                                     ; $434A: $35

jr_006_434B:
    ldh  a, [hLinkAnimationState]                 ; $434B: $F0 $9D
    cp   $FF                                      ; $434D: $FE $FF
    jr   z, jr_006_43B8                           ; $434F: $28 $67

    call func_006_6594                            ; $4351: $CD $94 $65
    ld   hl, $C380                                ; $4354: $21 $80 $C3
    add  hl, bc                                   ; $4357: $09
    ld   a, [hl]                                  ; $4358: $7E
    and  $01                                      ; $4359: $E6 $01
    cp   e                                        ; $435B: $BB
    jr   nz, jr_006_43B8                          ; $435C: $20 $5A

    call func_006_6594                            ; $435E: $CD $94 $65
    add  $40                                      ; $4361: $C6 $40
    cp   $80                                      ; $4363: $FE $80
    jr   nc, jr_006_43B8                          ; $4365: $30 $51

    ld   hl, wEntitiesPosYTable                         ; $4367: $21 $10 $C2
    add  hl, bc                                   ; $436A: $09
    ld   a, [hl]                                  ; $436B: $7E
    push hl                                       ; $436C: $E5
    push af                                       ; $436D: $F5
    ldh  a, [wActiveEntityPosY]                   ; $436E: $F0 $EC
    ld   [hl], a                                  ; $4370: $77
    call func_006_65A4                            ; $4371: $CD $A4 $65
    ld   e, a                                     ; $4374: $5F
    pop  af                                       ; $4375: $F1
    pop  hl                                       ; $4376: $E1
    ld   [hl], a                                  ; $4377: $77
    ld   a, e                                     ; $4378: $7B
    add  $30                                      ; $4379: $C6 $30
    cp   $60                                      ; $437B: $FE $60
    jr   nc, jr_006_43B8                          ; $437D: $30 $39

    ld   a, $08                                   ; $437F: $3E $08
    call label_3BB5                               ; $4381: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4384: $F0 $D7
    cpl                                           ; $4386: $2F
    inc  a                                        ; $4387: $3C
    ldh  [hLinkPositionYIncrement], a             ; $4388: $E0 $9B
    ldh  a, [hScratch1]                           ; $438A: $F0 $D8
    cpl                                           ; $438C: $2F
    inc  a                                        ; $438D: $3C
    ldh  [hLinkPositionXIncrement], a             ; $438E: $E0 $9A
    push bc                                       ; $4390: $C5
    call UpdateFinalLinkPosition                  ; $4391: $CD $A8 $21
    call label_3E19                               ; $4394: $CD $19 $3E
    pop  bc                                       ; $4397: $C1
    ld   hl, wActiveEntityPosX                    ; $4398: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $439B: $F0 $98
    sub  [hl]                                     ; $439D: $96
    add  $04                                      ; $439E: $C6 $04
    cp   $08                                      ; $43A0: $FE $08
    jr   nc, jr_006_43B8                          ; $43A2: $30 $14

    ld   hl, wActiveEntityPosY                    ; $43A4: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $43A7: $F0 $99
    sub  [hl]                                     ; $43A9: $96
    add  $04                                      ; $43AA: $C6 $04
    cp   $08                                      ; $43AC: $FE $08
    jr   nc, jr_006_43B8                          ; $43AE: $30 $08

    call GetEntityTransitionCountdown             ; $43B0: $CD $05 $0C
    ld   [hl], $80                                ; $43B3: $36 $80
    call IncrementEntityWalkingAttr               ; $43B5: $CD $12 $3B

label_006_43B8:
jr_006_43B8:
    ld   hl, $C380                                ; $43B8: $21 $80 $C3
    add  hl, bc                                   ; $43BB: $09
    ld   a, [hl]                                  ; $43BC: $7E
    rla                                           ; $43BD: $17
    and  $06                                      ; $43BE: $E6 $06
    or   $01                                      ; $43C0: $F6 $01
    jp   SetEntitySpriteVariant                   ; $43C2: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $43C5: $CD $05 $0C
    jr   z, jr_006_43F5                           ; $43C8: $28 $2B

    ldh  a, [hFFE8]                               ; $43CA: $F0 $E8
    and  a                                        ; $43CC: $A7
    jr   z, jr_006_43E2                           ; $43CD: $28 $13

    ld   hl, wEntitiesUnknownTableB               ; $43CF: $21 $B0 $C2
    add  hl, bc                                   ; $43D2: $09
    ld   a, [hl]                                  ; $43D3: $7E
    and  a                                        ; $43D4: $A7
    jr   nz, jr_006_43E2                          ; $43D5: $20 $0B

    inc  [hl]                                     ; $43D7: $34
    ld   hl, wEntitiesSpeedZTable                 ; $43D8: $21 $20 $C3
    add  hl, bc                                   ; $43DB: $09
    ld   [hl], $0C                                ; $43DC: $36 $0C
    ld   a, $09                                   ; $43DE: $3E $09
    ldh  [hJingle], a                             ; $43E0: $E0 $F2

jr_006_43E2:
    ld   hl, $C380                                ; $43E2: $21 $80 $C3
    add  hl, bc                                   ; $43E5: $09
    ld   a, [hl]                                  ; $43E6: $7E
    add  $08                                      ; $43E7: $C6 $08
    call SetEntitySpriteVariant                   ; $43E9: $CD $0C $3B
    ld   a, $FF                                   ; $43EC: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $43EE: $E0 $9D
    ld   a, $02                                   ; $43F0: $3E $02
    ldh  [$FFA1], a                               ; $43F2: $E0 $A1
    ret                                           ; $43F4: $C9

jr_006_43F5:
    ld   [hl], $0C                                ; $43F5: $36 $0C
    ld   hl, wEntitiesUnknownTableB               ; $43F7: $21 $B0 $C2
    add  hl, bc                                   ; $43FA: $09
    ld   [hl], b                                  ; $43FB: $70
    xor  a                                        ; $43FC: $AF
    ldh  [hLinkPositionYIncrement], a             ; $43FD: $E0 $9B
    ld   hl, $C380                                ; $43FF: $21 $80 $C3
    add  hl, bc                                   ; $4402: $09
    ld   a, [hl]                                  ; $4403: $7E
    and  $01                                      ; $4404: $E6 $01
    ld   a, $18                                   ; $4406: $3E $18
    jr   z, jr_006_440C                           ; $4408: $28 $02

    ld   a, $E8                                   ; $440A: $3E $E8

jr_006_440C:
    ldh  [hLinkPositionXIncrement], a             ; $440C: $E0 $9A
    ld   a, $10                                   ; $440E: $3E $10
    ldh  [$FFA3], a                               ; $4410: $E0 $A3
    ld   a, $20                                   ; $4412: $3E $20
    ld   [$DBC7], a                               ; $4414: $EA $C7 $DB
    ld   a, $02                                   ; $4417: $3E $02
    ld   [$C146], a                               ; $4419: $EA $46 $C1
    ld   a, $02                                   ; $441C: $3E $02
    ld   [wDB94], a                               ; $441E: $EA $94 $DB
    ld   a, $08                                   ; $4421: $3E $08
    ldh  [hJingle], a                             ; $4423: $E0 $F2
    jp   IncrementEntityWalkingAttr               ; $4425: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $4428: $CD $05 $0C
    jp   z, label_006_431B                        ; $442B: $CA $1B $43

    ld   hl, wEntitiesSpeedZTable                 ; $442E: $21 $20 $C3
    add  hl, bc                                   ; $4431: $09
    ld   [hl], b                                  ; $4432: $70
    jp   label_006_43B8                           ; $4433: $C3 $B8 $43

    ld   h, d                                     ; $4436: $62
    ld   hl, $2160                                ; $4437: $21 $60 $21
    ld   l, b                                     ; $443A: $68
    ld   hl, $2166                                ; $443B: $21 $66 $21
    ld   h, b                                     ; $443E: $60
    ld   bc, $0162                                ; $443F: $01 $62 $01
    ld   h, [hl]                                  ; $4442: $66
    ld   bc, $0168                                ; $4443: $01 $68 $01
    ld   h, d                                     ; $4446: $62
    ld   hl, $2160                                ; $4447: $21 $60 $21
    ld   l, b                                     ; $444A: $68
    ld   hl, $2166                                ; $444B: $21 $66 $21
    ld   h, b                                     ; $444E: $60
    ld   bc, $0162                                ; $444F: $01 $62 $01
    ld   h, [hl]                                  ; $4452: $66
    ld   bc, $0168                                ; $4453: $01 $68 $01
    nop                                           ; $4456: $00
    db   $FC                                      ; $4457: $FC
    ld   h, d                                     ; $4458: $62
    ld   hl, $0400                                ; $4459: $21 $00 $04
    ld   l, d                                     ; $445C: $6A
    ld   hl, IsEntityUnknownFZero                 ; $445D: $21 $00 $0C
    ld   h, h                                     ; $4460: $64
    ld   hl, $FC00                                ; $4461: $21 $00 $FC
    ld   h, h                                     ; $4464: $64
    ld   bc, $0400                                ; $4465: $01 $00 $04
    ld   l, d                                     ; $4468: $6A
    ld   bc, IsEntityUnknownFZero                 ; $4469: $01 $00 $0C
    ld   h, d                                     ; $446C: $62
    ld   bc, $FC00                                ; $446D: $01 $00 $FC
    ld   h, d                                     ; $4470: $62
    ld   hl, $0400                                ; $4471: $21 $00 $04
    ld   l, d                                     ; $4474: $6A
    ld   hl, IsEntityUnknownFZero                 ; $4475: $21 $00 $0C
    ld   h, h                                     ; $4478: $64
    ld   hl, $FC00                                ; $4479: $21 $00 $FC
    ld   h, h                                     ; $447C: $64
    ld   bc, $0400                                ; $447D: $01 $00 $04
    ld   l, d                                     ; $4480: $6A
    ld   bc, IsEntityUnknownFZero                 ; $4481: $01 $00 $0C
    ld   h, d                                     ; $4484: $62
    ld   bc, $0E00                                ; $4485: $01 $00 $0E
    inc  h                                        ; $4488: $24
    ld   bc, $18F8                                ; $4489: $01 $F8 $18
    inc  h                                        ; $448C: $24
    ld   bc, $1808                                ; $448D: $01 $08 $18
    inc  h                                        ; $4490: $24
    ld   bc, $13FE                                ; $4491: $01 $FE $13
    inc  h                                        ; $4494: $24
    ld   bc, $1303                                ; $4495: $01 $03 $13
    inc  h                                        ; $4498: $24
    ld   bc, $1303                                ; $4499: $01 $03 $13
    rst  $38                                      ; $449C: $FF
    ld   bc, $FA00                                ; $449D: $01 $00 $FA
    inc  h                                        ; $44A0: $24
    ld   bc, $F0F8                                ; $44A1: $01 $F8 $F0
    inc  h                                        ; $44A4: $24
    ld   bc, $F008                                ; $44A5: $01 $08 $F0
    inc  h                                        ; $44A8: $24
    ld   bc, $F5FE                                ; $44A9: $01 $FE $F5
    inc  h                                        ; $44AC: $24
    ld   bc, $F503                                ; $44AD: $01 $03 $F5
    inc  h                                        ; $44B0: $24
    ld   bc, $F503                                ; $44B1: $01 $03 $F5
    rst  $38                                      ; $44B4: $FF
    ld   bc, $F1F0                                ; $44B5: $01 $F0 $F1
    cp   $08                                      ; $44B8: $FE $08
    jr   nc, jr_006_44F1                          ; $44BA: $30 $35

    ld   de, $4436                                ; $44BC: $11 $36 $44
    call RenderAnimatedActiveEntity                               ; $44BF: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $44C2: $F0 $F0
    cp   $02                                      ; $44C4: $FE $02
    ret  nz                                       ; $44C6: $C0

    ld   hl, $C380                                ; $44C7: $21 $80 $C3
    add  hl, bc                                   ; $44CA: $09
    ld   a, [hl]                                  ; $44CB: $7E
    rla                                           ; $44CC: $17
    and  $02                                      ; $44CD: $E6 $02
    ld   e, a                                     ; $44CF: $5F
    ldh  a, [hFrameCounter]                       ; $44D0: $F0 $E7
    rra                                           ; $44D2: $1F
    rra                                           ; $44D3: $1F
    rra                                           ; $44D4: $1F
    and  $01                                      ; $44D5: $E6 $01
    or   e                                        ; $44D7: $B3
    rla                                           ; $44D8: $17
    rla                                           ; $44D9: $17
    and  $FC                                      ; $44DA: $E6 $FC
    ld   e, a                                     ; $44DC: $5F
    rla                                           ; $44DD: $17
    and  $F8                                      ; $44DE: $E6 $F8
    add  e                                        ; $44E0: $83
    ld   e, a                                     ; $44E1: $5F
    ld   d, b                                     ; $44E2: $50
    ld   hl, $4486                                ; $44E3: $21 $86 $44
    add  hl, de                                   ; $44E6: $19
    ld   c, $03                                   ; $44E7: $0E $03
    call label_3CE6                               ; $44E9: $CD $E6 $3C
    ld   a, $03                                   ; $44EC: $3E $03
    jp   label_3DA0                               ; $44EE: $C3 $A0 $3D

jr_006_44F1:
    sub  $08                                      ; $44F1: $D6 $08
    rla                                           ; $44F3: $17
    rla                                           ; $44F4: $17
    and  $FC                                      ; $44F5: $E6 $FC
    ld   e, a                                     ; $44F7: $5F
    sla  a                                        ; $44F8: $CB $27
    add  e                                        ; $44FA: $83
    ld   e, a                                     ; $44FB: $5F
    ld   d, b                                     ; $44FC: $50
    ld   hl, $4456                                ; $44FD: $21 $56 $44
    add  hl, de                                   ; $4500: $19
    ld   c, $03                                   ; $4501: $0E $03
    call label_3CE6                               ; $4503: $CD $E6 $3C
    jp   label_3CD9                               ; $4506: $C3 $D9 $3C

    ld   hl, $C440                                ; $4509: $21 $40 $C4
    add  hl, bc                                   ; $450C: $09
    ld   a, [hl]                                  ; $450D: $7E
    and  a                                        ; $450E: $A7
    jp   nz, label_006_4781                       ; $450F: $C2 $81 $47

    ld   a, c                                     ; $4512: $79
    ld   [$D202], a                               ; $4513: $EA $02 $D2
    ld   hl, wEntitiesUnknownTableD               ; $4516: $21 $D0 $C2
    add  hl, bc                                   ; $4519: $09
    ld   a, [hl]                                  ; $451A: $7E
    and  a                                        ; $451B: $A7
    jr   nz, jr_006_453F                          ; $451C: $20 $21

    inc  [hl]                                     ; $451E: $34
    ld   a, $92                                   ; $451F: $3E $92
    call func_003_64CA_trampoline                               ; $4521: $CD $86 $3B
    ld   a, e                                     ; $4524: $7B
    ld   [$D201], a                               ; $4525: $EA $01 $D2
    ldh  a, [hScratch1]                           ; $4528: $F0 $D8
    add  $10                                      ; $452A: $C6 $10
    ld   hl, wEntitiesPosYTable                         ; $452C: $21 $10 $C2
    add  hl, de                                   ; $452F: $19
    ld   [hl], a                                  ; $4530: $77
    ldh  a, [hScratch0]                           ; $4531: $F0 $D7
    add  $30                                      ; $4533: $C6 $30
    ld   hl, wEntitiesPosXTable                         ; $4535: $21 $00 $C2
    add  hl, de                                   ; $4538: $19
    ld   [hl], a                                  ; $4539: $77
    ld   hl, $C440                                ; $453A: $21 $40 $C4
    add  hl, de                                   ; $453D: $19
    inc  [hl]                                     ; $453E: $34

jr_006_453F:
    call $4767                                    ; $453F: $CD $67 $47
    call label_3EE8                               ; $4542: $CD $E8 $3E
    ldh  a, [hActiveEntityStatus]                 ; $4545: $F0 $EA
    cp   $05                                      ; $4547: $FE $05
    jp   nz, label_006_5308                       ; $4549: $C2 $08 $53

    call func_006_64C6                            ; $454C: $CD $C6 $64
    call func_006_64F7                            ; $454F: $CD $F7 $64
    call label_3B39                               ; $4552: $CD $39 $3B
    call func_006_657A                            ; $4555: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $4558: $21 $20 $C3
    add  hl, bc                                   ; $455B: $09
    dec  [hl]                                     ; $455C: $35
    dec  [hl]                                     ; $455D: $35
    dec  [hl]                                     ; $455E: $35
    ld   hl, wEntitiesPosZTable                   ; $455F: $21 $10 $C3
    add  hl, bc                                   ; $4562: $09
    ld   a, [hl]                                  ; $4563: $7E
    and  $80                                      ; $4564: $E6 $80
    ldh  [hFFE8], a                               ; $4566: $E0 $E8
    jr   z, jr_006_4570                           ; $4568: $28 $06

    ld   [hl], b                                  ; $456A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $456B: $21 $20 $C3
    add  hl, bc                                   ; $456E: $09
    ld   [hl], b                                  ; $456F: $70

jr_006_4570:
    ldh  a, [hActiveEntityState]                  ; $4570: $F0 $F0
    rst  $00                                      ; $4572: $C7
    ld   a, l                                     ; $4573: $7D
    ld   b, l                                     ; $4574: $45
    ld   [bc], a                                  ; $4575: $02
    ld   b, [hl]                                  ; $4576: $46
    ld   [hl], b                                  ; $4577: $70
    ld   b, [hl]                                  ; $4578: $46
    ret                                           ; $4579: $C9

    ld   b, [hl]                                  ; $457A: $46
    inc  d                                        ; $457B: $14
    ld   b, a                                     ; $457C: $47
    ld   a, [$D201]                               ; $457D: $FA $01 $D2
    ld   e, a                                     ; $4580: $5F
    ld   d, b                                     ; $4581: $50
    ld   hl, wEntitiesStateTable                  ; $4582: $21 $90 $C2
    add  hl, de                                   ; $4585: $19
    ld   a, [hl]                                  ; $4586: $7E
    cp   $00                                      ; $4587: $FE $00
    jr   nz, jr_006_45E2                          ; $4589: $20 $57

    ldh  a, [hLinkPositionX]                      ; $458B: $F0 $98
    push af                                       ; $458D: $F5
    ldh  a, [hLinkPositionY]                      ; $458E: $F0 $99
    push af                                       ; $4590: $F5
    ld   hl, wEntitiesPosXTable                         ; $4591: $21 $00 $C2
    add  hl, de                                   ; $4594: $19
    ld   a, [hl]                                  ; $4595: $7E
    ldh  [hLinkPositionX], a                      ; $4596: $E0 $98
    ld   hl, wEntitiesPosYTable                         ; $4598: $21 $10 $C2
    add  hl, de                                   ; $459B: $19
    ld   a, [hl]                                  ; $459C: $7E
    ldh  [hLinkPositionY], a                      ; $459D: $E0 $99
    ld   a, $10                                   ; $459F: $3E $10
    call label_3BAA                               ; $45A1: $CD $AA $3B
    call func_006_6541                            ; $45A4: $CD $41 $65
    call label_3B23                               ; $45A7: $CD $23 $3B
    call func_006_6594                            ; $45AA: $CD $94 $65
    ld   hl, $C380                                ; $45AD: $21 $80 $C3
    add  hl, bc                                   ; $45B0: $09
    ld   [hl], e                                  ; $45B1: $73
    add  $0C                                      ; $45B2: $C6 $0C
    cp   $18                                      ; $45B4: $FE $18
    jr   nc, jr_006_45DA                          ; $45B6: $30 $22

    call func_006_65A4                            ; $45B8: $CD $A4 $65
    add  $0C                                      ; $45BB: $C6 $0C
    cp   $18                                      ; $45BD: $FE $18
    jr   nc, jr_006_45DA                          ; $45BF: $30 $19

    call IncrementEntityWalkingAttr               ; $45C1: $CD $12 $3B
    ld   [hl], $02                                ; $45C4: $36 $02
    ld   a, [$D201]                               ; $45C6: $FA $01 $D2
    ld   e, a                                     ; $45C9: $5F
    ld   d, b                                     ; $45CA: $50
    ld   hl, wEntitiesStateTable                  ; $45CB: $21 $90 $C2
    add  hl, de                                   ; $45CE: $19
    ld   [hl], $01                                ; $45CF: $36 $01
    call GetEntityTransitionCountdown             ; $45D1: $CD $05 $0C
    ld   [hl], $1F                                ; $45D4: $36 $1F
    ld   a, $1C                                   ; $45D6: $3E $1C
    ldh  [hWaveSfx], a                            ; $45D8: $E0 $F3

jr_006_45DA:
    pop  af                                       ; $45DA: $F1
    ldh  [hLinkPositionY], a                      ; $45DB: $E0 $99
    pop  af                                       ; $45DD: $F1
    ldh  [hLinkPositionX], a                      ; $45DE: $E0 $98
    jr   jr_006_45E5                              ; $45E0: $18 $03

jr_006_45E2:
    call IncrementEntityWalkingAttr               ; $45E2: $CD $12 $3B

func_006_45E5:
jr_006_45E5:
    ldh  a, [hFFE8]                               ; $45E5: $F0 $E8
    and  a                                        ; $45E7: $A7
    jr   z, jr_006_45F0                           ; $45E8: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $45EA: $21 $20 $C3
    add  hl, bc                                   ; $45ED: $09
    ld   [hl], $10                                ; $45EE: $36 $10

jr_006_45F0:
    ld   hl, $C380                                ; $45F0: $21 $80 $C3
    add  hl, bc                                   ; $45F3: $09
    ld   a, [hl]                                  ; $45F4: $7E
    and  $01                                      ; $45F5: $E6 $01
    jp   SetEntitySpriteVariant                   ; $45F7: $C3 $0C $3B

    inc  c                                        ; $45FA: $0C
    db   $F4                                      ; $45FB: $F4
    inc  c                                        ; $45FC: $0C
    db   $F4                                      ; $45FD: $F4
    db   $FC                                      ; $45FE: $FC
    db   $FC                                      ; $45FF: $FC
    inc  b                                        ; $4600: $04
    inc  b                                        ; $4601: $04
    ld   a, [$D201]                               ; $4602: $FA $01 $D2
    ld   e, a                                     ; $4605: $5F
    ld   d, b                                     ; $4606: $50
    ld   hl, wEntitiesStateTable                  ; $4607: $21 $90 $C2
    add  hl, de                                   ; $460A: $19
    ld   a, [hl]                                  ; $460B: $7E
    cp   $00                                      ; $460C: $FE $00
    jr   nz, jr_006_4614                          ; $460E: $20 $04

    call IncrementEntityWalkingAttr               ; $4610: $CD $12 $3B
    ld   [hl], b                                  ; $4613: $70

jr_006_4614:
    call GetEntityTransitionCountdown             ; $4614: $CD $05 $0C
    jr   nz, jr_006_463E                          ; $4617: $20 $25

    call GetRandomByte                            ; $4619: $CD $0D $28
    and  $1F                                      ; $461C: $E6 $1F
    add  $10                                      ; $461E: $C6 $10
    ld   [hl], a                                  ; $4620: $77
    and  $03                                      ; $4621: $E6 $03
    ld   hl, $C380                                ; $4623: $21 $80 $C3
    add  hl, bc                                   ; $4626: $09
    ld   [hl], a                                  ; $4627: $77
    ld   e, a                                     ; $4628: $5F
    ld   d, b                                     ; $4629: $50
    ld   hl, $45FA                                ; $462A: $21 $FA $45
    add  hl, de                                   ; $462D: $19
    ld   a, [hl]                                  ; $462E: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $462F: $21 $40 $C2
    add  hl, bc                                   ; $4632: $09
    ld   [hl], a                                  ; $4633: $77
    ld   hl, $45FE                                ; $4634: $21 $FE $45
    add  hl, de                                   ; $4637: $19
    ld   a, [hl]                                  ; $4638: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4639: $21 $50 $C2
    add  hl, bc                                   ; $463C: $09
    ld   [hl], a                                  ; $463D: $77

jr_006_463E:
    call func_006_6541                            ; $463E: $CD $41 $65
    call label_3B23                               ; $4641: $CD $23 $3B
    call func_006_45E5                            ; $4644: $CD $E5 $45
    ldh  a, [hFrameCounter]                       ; $4647: $F0 $E7
    and  $08                                      ; $4649: $E6 $08
    jr   z, jr_006_464F                           ; $464B: $28 $02

    inc  [hl]                                     ; $464D: $34
    inc  [hl]                                     ; $464E: $34

jr_006_464F:
    ret                                           ; $464F: $C9

    nop                                           ; $4650: $00
    ld   [bc], a                                  ; $4651: $02
    inc  b                                        ; $4652: $04
    ld   b, $08                                   ; $4653: $06 $08
    ld   a, [bc]                                  ; $4655: $0A
    inc  c                                        ; $4656: $0C
    ld   c, $00                                   ; $4657: $0E $00
    cp   $FC                                      ; $4659: $FE $FC
    ld   a, [$F6F8]                               ; $465B: $FA $F8 $F6
    db   $F4                                      ; $465E: $F4
    ld   a, [c]                                   ; $465F: $F2
    ldh  a, [hActiveEntitySpriteVariant]               ; $4660: $F0 $F1
    ld   a, [c]                                   ; $4662: $F2
    db   $F4                                      ; $4663: $F4
    or   $F8                                      ; $4664: $F6 $F8
    ld   a, [$F0FE]                               ; $4666: $FA $FE $F0
    pop  af                                       ; $4669: $F1
    ld   a, [c]                                   ; $466A: $F2
    db   $F4                                      ; $466B: $F4
    or   $F8                                      ; $466C: $F6 $F8
    ld   a, [$21FE]                               ; $466E: $FA $FE $21
    add  b                                        ; $4671: $80
    jp   label_006_7E09                           ; $4672: $C3 $09 $7E

    and  $01                                      ; $4675: $E6 $01
    rla                                           ; $4677: $17
    rla                                           ; $4678: $17
    rla                                           ; $4679: $17
    and  $08                                      ; $467A: $E6 $08
    ld   e, a                                     ; $467C: $5F
    call GetEntityTransitionCountdown             ; $467D: $CD $05 $0C
    jr   nz, jr_006_4687                          ; $4680: $20 $05

    ld   [hl], $20                                ; $4682: $36 $20
    jp   IncrementEntityWalkingAttr               ; $4684: $C3 $12 $3B

jr_006_4687:
    rra                                           ; $4687: $1F
    rra                                           ; $4688: $1F
    and  $07                                      ; $4689: $E6 $07
    or   e                                        ; $468B: $B3

func_006_468C:
    push bc                                       ; $468C: $C5
    ld   c, a                                     ; $468D: $4F
    ld   a, [$D201]                               ; $468E: $FA $01 $D2
    ld   e, a                                     ; $4691: $5F
    ld   d, b                                     ; $4692: $50
    ldh  a, [wActiveEntityPosX]                   ; $4693: $F0 $EE
    ld   hl, $4650                                ; $4695: $21 $50 $46
    add  hl, bc                                   ; $4698: $09
    add  [hl]                                     ; $4699: $86
    ld   hl, wEntitiesPosXTable                         ; $469A: $21 $00 $C2
    add  hl, de                                   ; $469D: $19
    ld   [hl], a                                  ; $469E: $77
    ld   hl, $4660                                ; $469F: $21 $60 $46
    add  hl, bc                                   ; $46A2: $09
    ld   a, [hl]                                  ; $46A3: $7E
    cpl                                           ; $46A4: $2F
    inc  a                                        ; $46A5: $3C
    pop  bc                                       ; $46A6: $C1
    ld   hl, wEntitiesPosZTable                   ; $46A7: $21 $10 $C3
    add  hl, bc                                   ; $46AA: $09
    add  [hl]                                     ; $46AB: $86
    ld   hl, wEntitiesPosZTable                   ; $46AC: $21 $10 $C3
    add  hl, de                                   ; $46AF: $19
    ld   [hl], a                                  ; $46B0: $77
    ld   hl, wEntitiesPosYTable                         ; $46B1: $21 $10 $C2
    add  hl, bc                                   ; $46B4: $09
    ld   a, [hl]                                  ; $46B5: $7E
    add  $02                                      ; $46B6: $C6 $02
    ld   hl, wEntitiesPosYTable                         ; $46B8: $21 $10 $C2
    add  hl, de                                   ; $46BB: $19
    ld   [hl], a                                  ; $46BC: $77

func_006_46BD:
    ld   hl, $C380                                ; $46BD: $21 $80 $C3
    add  hl, bc                                   ; $46C0: $09
    ld   a, [hl]                                  ; $46C1: $7E
    and  $01                                      ; $46C2: $E6 $01
    or   $02                                      ; $46C4: $F6 $02
    jp   SetEntitySpriteVariant                   ; $46C6: $C3 $0C $3B

    xor  a                                        ; $46C9: $AF
    call func_006_468C                            ; $46CA: $CD $8C $46
    call GetEntityTransitionCountdown             ; $46CD: $CD $05 $0C
    jr   nz, jr_006_46FB                          ; $46D0: $20 $29

    ld   [hl], $20                                ; $46D2: $36 $20
    ld   a, [$D201]                               ; $46D4: $FA $01 $D2
    ld   e, a                                     ; $46D7: $5F
    ld   d, b                                     ; $46D8: $50
    ld   hl, wEntitiesStateTable                  ; $46D9: $21 $90 $C2
    add  hl, de                                   ; $46DC: $19
    ld   [hl], $04                                ; $46DD: $36 $04
    push bc                                       ; $46DF: $C5
    ld   c, e                                     ; $46E0: $4B
    ld   b, d                                     ; $46E1: $42
    ld   a, $20                                   ; $46E2: $3E $20
    call label_3BAA                               ; $46E4: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $46E7: $21 $20 $C3
    add  hl, bc                                   ; $46EA: $09
    ld   [hl], $18                                ; $46EB: $36 $18
    pop  bc                                       ; $46ED: $C1
    ld   hl, wEntitiesSpeedZTable                 ; $46EE: $21 $20 $C3
    add  hl, bc                                   ; $46F1: $09
    ld   [hl], $20                                ; $46F2: $36 $20
    ld   a, $08                                   ; $46F4: $3E $08
    ldh  [hJingle], a                             ; $46F6: $E0 $F2
    jp   IncrementEntityWalkingAttr               ; $46F8: $C3 $12 $3B

jr_006_46FB:
    call func_006_45E5                            ; $46FB: $CD $E5 $45
    ld   a, $04                                   ; $46FE: $3E $04
    call label_3BAA                               ; $4700: $CD $AA $3B
    call func_006_6594                            ; $4703: $CD $94 $65
    ld   hl, $C380                                ; $4706: $21 $80 $C3
    add  hl, bc                                   ; $4709: $09
    ld   [hl], e                                  ; $470A: $73
    call func_006_46BD                            ; $470B: $CD $BD $46
    call func_006_6541                            ; $470E: $CD $41 $65
    jp   label_3B23                               ; $4711: $C3 $23 $3B

    call GetEntityTransitionCountdown             ; $4714: $CD $05 $0C
    jr   nz, jr_006_471D                          ; $4717: $20 $04

    call IncrementEntityWalkingAttr               ; $4719: $CD $12 $3B
    ld   [hl], b                                  ; $471C: $70

jr_006_471D:
    ld   hl, $C380                                ; $471D: $21 $80 $C3
    add  hl, bc                                   ; $4720: $09
    ld   a, [hl]                                  ; $4721: $7E
    and  $01                                      ; $4722: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4724: $C3 $0C $3B

    nop                                           ; $4727: $00
    db   $FC                                      ; $4728: $FC
    ld   h, h                                     ; $4729: $64
    ld   hl, $0400                                ; $472A: $21 $00 $04
    ld   h, d                                     ; $472D: $62
    ld   hl, IsEntityUnknownFZero                 ; $472E: $21 $00 $0C
    ld   h, b                                     ; $4731: $60
    ld   hl, $FCF0                                ; $4732: $21 $F0 $FC
    ld   l, h                                     ; $4735: $6C
    ld   hl, $FC00                                ; $4736: $21 $00 $FC
    ld   h, b                                     ; $4739: $60
    ld   bc, $0400                                ; $473A: $01 $00 $04
    ld   h, d                                     ; $473D: $62
    ld   bc, IsEntityUnknownFZero                 ; $473E: $01 $00 $0C
    ld   h, h                                     ; $4741: $64
    ld   bc, $0CF0                                ; $4742: $01 $F0 $0C
    ld   l, h                                     ; $4745: $6C
    ld   bc, $FC00                                ; $4746: $01 $00 $FC
    ld   l, d                                     ; $4749: $6A
    ld   hl, $0400                                ; $474A: $21 $00 $04
    ld   l, b                                     ; $474D: $68
    ld   hl, IsEntityUnknownFZero                 ; $474E: $21 $00 $0C
    ld   h, [hl]                                  ; $4751: $66
    ld   hl, $FCF0                                ; $4752: $21 $F0 $FC
    ld   l, h                                     ; $4755: $6C
    ld   bc, $FC00                                ; $4756: $01 $00 $FC
    ld   h, [hl]                                  ; $4759: $66
    ld   bc, $0400                                ; $475A: $01 $00 $04
    ld   l, b                                     ; $475D: $68
    ld   bc, IsEntityUnknownFZero                 ; $475E: $01 $00 $0C
    ld   l, d                                     ; $4761: $6A
    ld   bc, $0CF0                                ; $4762: $01 $F0 $0C
    ld   l, h                                     ; $4765: $6C
    ld   hl, $F1F0                                ; $4766: $21 $F0 $F1
    rla                                           ; $4769: $17
    rla                                           ; $476A: $17
    rla                                           ; $476B: $17
    rla                                           ; $476C: $17
    and  $F0                                      ; $476D: $E6 $F0
    ld   e, a                                     ; $476F: $5F
    ld   d, b                                     ; $4770: $50
    ld   hl, $4727                                ; $4771: $21 $27 $47
    add  hl, de                                   ; $4774: $19
    ld   c, $04                                   ; $4775: $0E $04
    call label_3CE6                               ; $4777: $CD $E6 $3C
    jp   label_3CD9                               ; $477A: $C3 $D9 $3C

    ld   l, [hl]                                  ; $477D: $6E
    ld   bc, $216E                                ; $477E: $01 $6E $21

label_006_4781:
    ld   hl, $C340                                ; $4781: $21 $40 $C3
    add  hl, bc                                   ; $4784: $09
    ld   [hl], $92                                ; $4785: $36 $92
    ld   hl, $C5D0                                ; $4787: $21 $D0 $C5
    add  hl, bc                                   ; $478A: $09
    ld   [hl], $FF                                ; $478B: $36 $FF
    ld   de, $477D                                ; $478D: $11 $7D $47
    call RenderAnimatedActiveEntity                               ; $4790: $CD $C0 $3B
    call func_006_64C6                            ; $4793: $CD $C6 $64
    call label_C56                                ; $4796: $CD $56 $0C
    call label_3B70                               ; $4799: $CD $70 $3B
    call func_006_6541                            ; $479C: $CD $41 $65
    call func_006_657A                            ; $479F: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $47A2: $21 $20 $C3
    add  hl, bc                                   ; $47A5: $09
    dec  [hl]                                     ; $47A6: $35
    dec  [hl]                                     ; $47A7: $35
    ld   hl, wEntitiesPosZTable                   ; $47A8: $21 $10 $C3
    add  hl, bc                                   ; $47AB: $09
    ld   a, [hl]                                  ; $47AC: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $47AD: $E0 $E9
    and  $80                                      ; $47AF: $E6 $80
    ldh  [hFFE8], a                               ; $47B1: $E0 $E8
    jr   z, jr_006_47DA                           ; $47B3: $28 $25

    ld   [hl], b                                  ; $47B5: $70
    ld   hl, wEntitiesSpeedZTable                 ; $47B6: $21 $20 $C3
    add  hl, bc                                   ; $47B9: $09
    ld   a, [hl]                                  ; $47BA: $7E
    sra  a                                        ; $47BB: $CB $2F
    cpl                                           ; $47BD: $2F
    cp   $07                                      ; $47BE: $FE $07
    jr   nc, jr_006_47C5                          ; $47C0: $30 $03

    xor  a                                        ; $47C2: $AF
    jr   jr_006_47C9                              ; $47C3: $18 $04

jr_006_47C5:
    ld   a, $09                                   ; $47C5: $3E $09
    ldh  [hJingle], a                             ; $47C7: $E0 $F2

jr_006_47C9:
    ld   [hl], a                                  ; $47C9: $77
    ld   hl, wEntitiesSpeedXTable                       ; $47CA: $21 $40 $C2
    add  hl, bc                                   ; $47CD: $09
    sra  [hl]                                     ; $47CE: $CB $2E
    sra  [hl]                                     ; $47D0: $CB $2E
    ld   hl, wEntitiesSpeedYTable                       ; $47D2: $21 $50 $C2
    add  hl, bc                                   ; $47D5: $09
    sra  [hl]                                     ; $47D6: $CB $2E
    sra  [hl]                                     ; $47D8: $CB $2E

jr_006_47DA:
    call label_3B23                               ; $47DA: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $47DD: $F0 $F0
    rst  $00                                      ; $47DF: $C7
    ld   [$5347], a                               ; $47E0: $EA $47 $53
    ld   c, b                                     ; $47E3: $48
    ld   d, h                                     ; $47E4: $54
    ld   c, b                                     ; $47E5: $48
    ld   d, l                                     ; $47E6: $55
    ld   c, b                                     ; $47E7: $48
    db   $DD                                      ; $47E8: $DD
    ld   c, b                                     ; $47E9: $48
    ldh  a, [hIndexOfObjectBelowLink]             ; $47EA: $F0 $E9
    dec  a                                        ; $47EC: $3D
    and  $80                                      ; $47ED: $E6 $80
    jr   z, jr_006_4806                           ; $47EF: $28 $15

    ld   hl, wEntitiesSpeedYTable                       ; $47F1: $21 $50 $C2
    call func_006_47FA                            ; $47F4: $CD $FA $47
    ld   hl, wEntitiesSpeedXTable                       ; $47F7: $21 $40 $C2

func_006_47FA:
    add  hl, bc                                   ; $47FA: $09
    ld   a, [hl]                                  ; $47FB: $7E
    and  a                                        ; $47FC: $A7
    jr   z, jr_006_4806                           ; $47FD: $28 $07

    and  $80                                      ; $47FF: $E6 $80
    jr   z, jr_006_4805                           ; $4801: $28 $02

    inc  [hl]                                     ; $4803: $34
    inc  [hl]                                     ; $4804: $34

jr_006_4805:
    dec  [hl]                                     ; $4805: $35

jr_006_4806:
    call label_3B5A                               ; $4806: $CD $5A $3B
    jr   nc, jr_006_4852                          ; $4809: $30 $47

    ld   a, [$C19B]                               ; $480B: $FA $9B $C1
    and  a                                        ; $480E: $A7
    jr   nz, jr_006_4852                          ; $480F: $20 $41

    ld   a, [wAButtonSlot]                        ; $4811: $FA $00 $DB
    cp   $03                                      ; $4814: $FE $03
    jr   nz, jr_006_4820                          ; $4816: $20 $08

    ldh  a, [hJoypadState]                               ; $4818: $F0 $CC
    and  $20                                      ; $481A: $E6 $20
    jr   nz, jr_006_482D                          ; $481C: $20 $0F

    jr   jr_006_4852                              ; $481E: $18 $32

jr_006_4820:
    ld   a, [wBButtonSlot]                        ; $4820: $FA $01 $DB
    cp   $03                                      ; $4823: $FE $03
    jr   nz, jr_006_4852                          ; $4825: $20 $2B

    ldh  a, [hJoypadState]                               ; $4827: $F0 $CC
    and  $10                                      ; $4829: $E6 $10
    jr   z, jr_006_4852                           ; $482B: $28 $25

jr_006_482D:
    ld   a, [$C3CF]                               ; $482D: $FA $CF $C3
    and  a                                        ; $4830: $A7
    jr   nz, jr_006_4852                          ; $4831: $20 $1F

    call IncrementEntityWalkingAttr               ; $4833: $CD $12 $3B
    ld   [hl], $02                                ; $4836: $36 $02
    ld   hl, wEntitiesStatusTable                        ; $4838: $21 $80 $C2
    add  hl, bc                                   ; $483B: $09
    ld   [hl], $07                                ; $483C: $36 $07
    ld   hl, $C490                                ; $483E: $21 $90 $C4
    add  hl, bc                                   ; $4841: $09
    ld   [hl], b                                  ; $4842: $70
    ldh  a, [hLinkDirection]                      ; $4843: $F0 $9E
    ld   [wC15D], a                               ; $4845: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $4848: $CD $05 $0C
    ld   [hl], $02                                ; $484B: $36 $02
    ld   hl, hWaveSfx                             ; $484D: $21 $F3 $FF
    ld   [hl], $02                                ; $4850: $36 $02

jr_006_4852:
    ret                                           ; $4852: $C9

    ret                                           ; $4853: $C9

    ret                                           ; $4854: $C9

    ld   a, [$D202]                               ; $4855: $FA $02 $D2
    ld   e, a                                     ; $4858: $5F
    ld   d, b                                     ; $4859: $50
    ld   hl, wEntitiesPosXTable                         ; $485A: $21 $00 $C2
    add  hl, de                                   ; $485D: $19
    ldh  a, [wActiveEntityPosX]                   ; $485E: $F0 $EE
    sub  [hl]                                     ; $4860: $96
    add  $0C                                      ; $4861: $C6 $0C
    cp   $18                                      ; $4863: $FE $18
    jp   nc, label_006_48DB                       ; $4865: $D2 $DB $48

    ld   hl, wEntitiesPosYTable                         ; $4868: $21 $10 $C2
    add  hl, de                                   ; $486B: $19
    ldh  a, [wActiveEntityPosY]                   ; $486C: $F0 $EC
    sub  [hl]                                     ; $486E: $96
    add  $0C                                      ; $486F: $C6 $0C
    cp   $18                                      ; $4871: $FE $18
    jr   nc, jr_006_48DB                          ; $4873: $30 $66

    ld   hl, $C410                                ; $4875: $21 $10 $C4
    add  hl, de                                   ; $4878: $19
    ld   [hl], $10                                ; $4879: $36 $10
    ld   hl, $C420                                ; $487B: $21 $20 $C4
    add  hl, de                                   ; $487E: $19
    ld   [hl], $20                                ; $487F: $36 $20
    ld   hl, wEntitiesSpeedXTable                       ; $4881: $21 $40 $C2
    add  hl, bc                                   ; $4884: $09
    ld   a, [hl]                                  ; $4885: $7E
    push hl                                       ; $4886: $E5
    ld   hl, $C3F0                                ; $4887: $21 $F0 $C3
    add  hl, de                                   ; $488A: $19
    ld   [hl], a                                  ; $488B: $77
    pop  hl                                       ; $488C: $E1
    cpl                                           ; $488D: $2F
    inc  a                                        ; $488E: $3C
    sra  a                                        ; $488F: $CB $2F
    ld   [hl], a                                  ; $4891: $77
    ld   hl, wEntitiesSpeedYTable                       ; $4892: $21 $50 $C2
    add  hl, bc                                   ; $4895: $09
    ld   a, [hl]                                  ; $4896: $7E
    push hl                                       ; $4897: $E5
    ld   hl, $C400                                ; $4898: $21 $00 $C4
    add  hl, de                                   ; $489B: $19
    ld   [hl], a                                  ; $489C: $77
    pop  hl                                       ; $489D: $E1
    cpl                                           ; $489E: $2F
    inc  a                                        ; $489F: $3C
    sra  a                                        ; $48A0: $CB $2F
    ld   [hl], a                                  ; $48A2: $77
    ld   a, $07                                   ; $48A3: $3E $07
    ldh  [hWaveSfx], a                            ; $48A5: $E0 $F3
    ld   hl, wEntitiesHealthTable                 ; $48A7: $21 $60 $C3
    add  hl, de                                   ; $48AA: $19
    ld   a, [hl]                                  ; $48AB: $7E
    sub  $02                                      ; $48AC: $D6 $02
    ld   [hl], a                                  ; $48AE: $77
    dec  a                                        ; $48AF: $3D
    and  $80                                      ; $48B0: $E6 $80
    jr   z, jr_006_48D7                           ; $48B2: $28 $23

    ld   hl, wEntitiesStatusTable                        ; $48B4: $21 $80 $C2
    add  hl, de                                   ; $48B7: $19
    ld   [hl], $01                                ; $48B8: $36 $01
    ld   hl, wEntitiesStatusTable                        ; $48BA: $21 $80 $C2
    add  hl, bc                                   ; $48BD: $09
    ld   [hl], $01                                ; $48BE: $36 $01
    ld   hl, $C480                                ; $48C0: $21 $80 $C4
    add  hl, bc                                   ; $48C3: $09
    ld   [hl], $1F                                ; $48C4: $36 $1F
    ld   hl, $C340                                ; $48C6: $21 $40 $C3
    add  hl, bc                                   ; $48C9: $09
    ld   a, [hl]                                  ; $48CA: $7E
    ld   [hl], $04                                ; $48CB: $36 $04
    ld   hl, $C430                                ; $48CD: $21 $30 $C4
    add  hl, bc                                   ; $48D0: $09
    res  7, [hl]                                  ; $48D1: $CB $BE
    ld   a, $10                                   ; $48D3: $3E $10
    ldh  [hWaveSfx], a                            ; $48D5: $E0 $F3

jr_006_48D7:
    call IncrementEntityWalkingAttr               ; $48D7: $CD $12 $3B
    ld   [hl], b                                  ; $48DA: $70

label_006_48DB:
jr_006_48DB:
    jr   jr_006_48EC                              ; $48DB: $18 $0F

    ld   hl, $C340                                ; $48DD: $21 $40 $C3
    add  hl, bc                                   ; $48E0: $09
    ld   [hl], $12                                ; $48E1: $36 $12
    call label_3B44                               ; $48E3: $CD $44 $3B
    ld   hl, $C340                                ; $48E6: $21 $40 $C3
    add  hl, bc                                   ; $48E9: $09
    ld   [hl], $92                                ; $48EA: $36 $92

jr_006_48EC:
    ldh  a, [hFFE8]                               ; $48EC: $F0 $E8
    and  a                                        ; $48EE: $A7
    jr   nz, jr_006_490C                          ; $48EF: $20 $1B

    ld   hl, wEntitiesCollisionsTable             ; $48F1: $21 $A0 $C2
    add  hl, bc                                   ; $48F4: $09
    ld   a, [hl]                                  ; $48F5: $7E
    and  a                                        ; $48F6: $A7
    jr   z, jr_006_4910                           ; $48F7: $28 $17

    and  $03                                      ; $48F9: $E6 $03
    jr   z, jr_006_4902                           ; $48FB: $28 $05

    ld   hl, wEntitiesSpeedXTable                       ; $48FD: $21 $40 $C2
    jr   jr_006_4905                              ; $4900: $18 $03

jr_006_4902:
    ld   hl, wEntitiesSpeedYTable                       ; $4902: $21 $50 $C2

jr_006_4905:
    add  hl, bc                                   ; $4905: $09
    ld   a, [hl]                                  ; $4906: $7E
    cpl                                           ; $4907: $2F
    inc  a                                        ; $4908: $3C
    sra  a                                        ; $4909: $CB $2F
    ld   [hl], a                                  ; $490B: $77

jr_006_490C:
    call IncrementEntityWalkingAttr               ; $490C: $CD $12 $3B
    ld   [hl], b                                  ; $490F: $70

jr_006_4910:
    ret                                           ; $4910: $C9

    ld   [hl], h                                  ; $4911: $74
    ld   [bc], a                                  ; $4912: $02
    db   $76                                      ; $4913: $76
    ld   [bc], a                                  ; $4914: $02
    db   $76                                      ; $4915: $76
    ld   [hl+], a                                 ; $4916: $22
    ld   [hl], h                                  ; $4917: $74
    ld   [hl+], a                                 ; $4918: $22
    ld   [hl], b                                  ; $4919: $70
    ld   bc, $0172                                ; $491A: $01 $72 $01
    ld   [hl], d                                  ; $491D: $72
    ld   hl, $2170                                ; $491E: $21 $70 $21
    ld   a, b                                     ; $4921: $78
    nop                                           ; $4922: $00
    ld   a, d                                     ; $4923: $7A
    nop                                           ; $4924: $00
    ld   a, d                                     ; $4925: $7A
    jr   nz, jr_006_49A0                          ; $4926: $20 $78

    jr   nz, jr_006_49A6                          ; $4928: $20 $7C

    inc  bc                                       ; $492A: $03
    ld   a, [hl]                                  ; $492B: $7E
    inc  bc                                       ; $492C: $03
    ld   a, [hl]                                  ; $492D: $7E
    inc  hl                                       ; $492E: $23
    ld   a, h                                     ; $492F: $7C
    inc  hl                                       ; $4930: $23
    ld   hl, wEntitiesHealthTable                 ; $4931: $21 $60 $C3
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $20                                ; $4935: $36 $20
    ld   de, $4911                                ; $4937: $11 $11 $49
    call RenderAnimatedActiveEntity                               ; $493A: $CD $C0 $3B
    call func_006_64C6                            ; $493D: $CD $C6 $64
    call label_C56                                ; $4940: $CD $56 $0C
    call func_006_6541                            ; $4943: $CD $41 $65
    call label_3B23                               ; $4946: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $4949: $F0 $F0
    rst  $00                                      ; $494B: $C7
    ld   d, d                                     ; $494C: $52
    ld   c, c                                     ; $494D: $49
    and  e                                        ; $494E: $A3
    ld   c, c                                     ; $494F: $49
    call nc, $CD49                                ; $4950: $D4 $49 $CD
    add  hl, sp                                   ; $4953: $39
    dec  sp                                       ; $4954: $3B
    call GetEntityTransitionCountdown             ; $4955: $CD $05 $0C
    jr   nz, jr_006_4962                          ; $4958: $20 $08

    ld   [hl], $20                                ; $495A: $36 $20
    call label_3D7F                               ; $495C: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $495F: $CD $12 $3B

jr_006_4962:
    ld   hl, $C3D0                                ; $4962: $21 $D0 $C3
    add  hl, bc                                   ; $4965: $09
    inc  [hl]                                     ; $4966: $34

jr_006_4967:
    ld   hl, $C380                                ; $4967: $21 $80 $C3
    add  hl, bc                                   ; $496A: $09
    ldh  a, [hFrameCounter]                       ; $496B: $F0 $E7
    and  $0F                                      ; $496D: $E6 $0F
    jr   nz, jr_006_4976                          ; $496F: $20 $05

    ld   a, [hl]                                  ; $4971: $7E
    inc  a                                        ; $4972: $3C
    and  $03                                      ; $4973: $E6 $03
    ld   [hl], a                                  ; $4975: $77

jr_006_4976:
    ld   e, [hl]                                  ; $4976: $5E
    sla  e                                        ; $4977: $CB $23
    ld   hl, $C3D0                                ; $4979: $21 $D0 $C3
    add  hl, bc                                   ; $497C: $09
    ld   a, [hl]                                  ; $497D: $7E
    rra                                           ; $497E: $1F
    rra                                           ; $497F: $1F
    rra                                           ; $4980: $1F
    and  $01                                      ; $4981: $E6 $01
    or   e                                        ; $4983: $B3
    call SetEntitySpriteVariant                   ; $4984: $CD $0C $3B
    ld   hl, $C410                                ; $4987: $21 $10 $C4
    add  hl, bc                                   ; $498A: $09
    ld   a, [hl]                                  ; $498B: $7E
    and  a                                        ; $498C: $A7
    ret  z                                        ; $498D: $C8

    call IncrementEntityWalkingAttr               ; $498E: $CD $12 $3B
    ld   [hl], $02                                ; $4991: $36 $02
    call GetEntityTransitionCountdown             ; $4993: $CD $05 $0C
    ld   [hl], $40                                ; $4996: $36 $40
    jp   label_3D7F                               ; $4998: $C3 $7F $3D

    inc  c                                        ; $499B: $0C
    db   $F4                                      ; $499C: $F4
    nop                                           ; $499D: $00
    nop                                           ; $499E: $00
    nop                                           ; $499F: $00

jr_006_49A0:
    nop                                           ; $49A0: $00
    db   $F4                                      ; $49A1: $F4
    inc  c                                        ; $49A2: $0C
    call label_3B39                               ; $49A3: $CD $39 $3B

jr_006_49A6:
    call GetEntityTransitionCountdown             ; $49A6: $CD $05 $0C
    jr   nz, jr_006_49D2                          ; $49A9: $20 $27

    call GetRandomByte                            ; $49AB: $CD $0D $28
    and  $1F                                      ; $49AE: $E6 $1F
    add  $20                                      ; $49B0: $C6 $20
    ld   [hl], a                                  ; $49B2: $77
    call IncrementEntityWalkingAttr               ; $49B3: $CD $12 $3B
    ld   [hl], b                                  ; $49B6: $70
    call GetRandomByte                            ; $49B7: $CD $0D $28
    and  $03                                      ; $49BA: $E6 $03
    ld   e, a                                     ; $49BC: $5F
    ld   d, b                                     ; $49BD: $50
    ld   hl, $499B                                ; $49BE: $21 $9B $49
    add  hl, de                                   ; $49C1: $19
    ld   a, [hl]                                  ; $49C2: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $49C3: $21 $40 $C2
    add  hl, bc                                   ; $49C6: $09
    ld   [hl], a                                  ; $49C7: $77
    ld   hl, $499F                                ; $49C8: $21 $9F $49
    add  hl, de                                   ; $49CB: $19
    ld   a, [hl]                                  ; $49CC: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $49CD: $21 $50 $C2
    add  hl, bc                                   ; $49D0: $09
    ld   [hl], a                                  ; $49D1: $77

jr_006_49D2:
    jr   jr_006_4967                              ; $49D2: $18 $93

    ld   hl, $C460                                ; $49D4: $21 $60 $C4
    add  hl, bc                                   ; $49D7: $09
    ld   a, [hl]                                  ; $49D8: $7E
    and  a                                        ; $49D9: $A7
    jp   nz, label_006_4AA7                       ; $49DA: $C2 $A7 $4A

    ldh  [hScratch0], a                           ; $49DD: $E0 $D7
    ld   e, $0F                                   ; $49DF: $1E $0F
    ld   d, b                                     ; $49E1: $50

jr_006_49E2:
    ld   hl, wEntitiesStatusTable                        ; $49E2: $21 $80 $C2
    add  hl, de                                   ; $49E5: $19
    ld   a, [hl]                                  ; $49E6: $7E
    and  a                                        ; $49E7: $A7
    jr   z, jr_006_4A09                           ; $49E8: $28 $1F

    ld   hl, wEntitiesTypeTable                   ; $49EA: $21 $A0 $C3
    add  hl, de                                   ; $49ED: $19
    ld   a, [hl]                                  ; $49EE: $7E
    cp   $90                                      ; $49EF: $FE $90
    jr   nz, jr_006_4A09                          ; $49F1: $20 $16

    ld   hl, wEntitiesStateTable                  ; $49F3: $21 $90 $C2
    add  hl, de                                   ; $49F6: $19
    ld   a, [hl]                                  ; $49F7: $7E
    cp   $02                                      ; $49F8: $FE $02
    jr   nz, jr_006_4A09                          ; $49FA: $20 $0D

    ld   hl, wEntitiesTransitionCountdownTable    ; $49FC: $21 $E0 $C2
    add  hl, de                                   ; $49FF: $19
    ld   a, [hl]                                  ; $4A00: $7E
    and  a                                        ; $4A01: $A7
    jr   nz, jr_006_4A09                          ; $4A02: $20 $05

    ldh  a, [hScratch0]                           ; $4A04: $F0 $D7
    inc  a                                        ; $4A06: $3C
    ldh  [hScratch0], a                           ; $4A07: $E0 $D7

jr_006_4A09:
    dec  e                                        ; $4A09: $1D
    ld   a, e                                     ; $4A0A: $7B
    cp   $FF                                      ; $4A0B: $FE $FF
    jr   nz, jr_006_49E2                          ; $4A0D: $20 $D3

    ldh  a, [hScratch0]                           ; $4A0F: $F0 $D7
    cp   $03                                      ; $4A11: $FE $03
    jp   nz, label_006_4AA7                       ; $4A13: $C2 $A7 $4A

    push bc                                       ; $4A16: $C5
    ld   c, b                                     ; $4A17: $48
    ld   e, $0F                                   ; $4A18: $1E $0F
    ld   d, b                                     ; $4A1A: $50

jr_006_4A1B:
    ld   hl, wEntitiesStatusTable                        ; $4A1B: $21 $80 $C2
    add  hl, de                                   ; $4A1E: $19
    ld   a, [hl]                                  ; $4A1F: $7E
    and  a                                        ; $4A20: $A7
    jr   z, jr_006_4A37                           ; $4A21: $28 $14

    ld   hl, wEntitiesTypeTable                   ; $4A23: $21 $A0 $C3
    add  hl, de                                   ; $4A26: $19
    ld   a, [hl]                                  ; $4A27: $7E
    cp   $90                                      ; $4A28: $FE $90
    jr   nz, jr_006_4A37                          ; $4A2A: $20 $0B

    ld   hl, $C380                                ; $4A2C: $21 $80 $C3
    add  hl, de                                   ; $4A2F: $19
    ld   a, [hl]                                  ; $4A30: $7E
    ld   hl, hScratch2                            ; $4A31: $21 $D9 $FF
    add  hl, bc                                   ; $4A34: $09
    ld   [hl], a                                  ; $4A35: $77
    inc  bc                                       ; $4A36: $03

jr_006_4A37:
    dec  e                                        ; $4A37: $1D
    ld   a, e                                     ; $4A38: $7B
    cp   $FF                                      ; $4A39: $FE $FF
    jr   nz, jr_006_4A1B                          ; $4A3B: $20 $DE

    pop  bc                                       ; $4A3D: $C1
    call PlayWrongAnswerJingle                                ; $4A3E: $CD $20 $0C
    ld   e, $00                                   ; $4A41: $1E $00
    ldh  a, [hScratch2]                           ; $4A43: $F0 $D9
    ld   hl, hScratch3                            ; $4A45: $21 $DA $FF
    cp   [hl]                                     ; $4A48: $BE
    jr   nz, jr_006_4A62                          ; $4A49: $20 $17

    inc  hl                                       ; $4A4B: $23
    cp   [hl]                                     ; $4A4C: $BE
    jr   nz, jr_006_4A62                          ; $4A4D: $20 $13

    ld   e, $FF                                   ; $4A4F: $1E $FF
    cp   $02                                      ; $4A51: $FE $02
    jr   nc, jr_006_4A62                          ; $4A53: $30 $0D

    ld   hl, hJingle                              ; $4A55: $21 $F2 $FF
    ld   [hl], $02                                ; $4A58: $36 $02
    ld   e, $2D                                   ; $4A5A: $1E $2D
    cp   $01                                      ; $4A5C: $FE $01
    jr   nz, jr_006_4A62                          ; $4A5E: $20 $02

    ld   e, $2E                                   ; $4A60: $1E $2E

jr_006_4A62:
    ld   a, e                                     ; $4A62: $7B
    ldh  [hFFE8], a                               ; $4A63: $E0 $E8
    ld   e, $0F                                   ; $4A65: $1E $0F
    ld   d, b                                     ; $4A67: $50

jr_006_4A68:
    ld   hl, wEntitiesStatusTable                        ; $4A68: $21 $80 $C2
    add  hl, de                                   ; $4A6B: $19
    ld   a, [hl]                                  ; $4A6C: $7E
    and  a                                        ; $4A6D: $A7
    jr   z, jr_006_4AA1                           ; $4A6E: $28 $31

    ld   hl, wEntitiesTypeTable                   ; $4A70: $21 $A0 $C3
    add  hl, de                                   ; $4A73: $19
    ld   a, [hl]                                  ; $4A74: $7E
    cp   $90                                      ; $4A75: $FE $90
    jr   nz, jr_006_4AA1                          ; $4A77: $20 $28

    ldh  a, [hFFE8]                               ; $4A79: $F0 $E8
    and  a                                        ; $4A7B: $A7
    jr   nz, jr_006_4A85                          ; $4A7C: $20 $07

    ld   hl, wEntitiesStateTable                  ; $4A7E: $21 $90 $C2
    add  hl, de                                   ; $4A81: $19
    ld   [hl], d                                  ; $4A82: $72
    jr   jr_006_4AA1                              ; $4A83: $18 $1C

jr_006_4A85:
    ld   hl, $C4E0                                ; $4A85: $21 $E0 $C4
    add  hl, de                                   ; $4A88: $19
    ld   [hl], a                                  ; $4A89: $77
    ld   hl, $C480                                ; $4A8A: $21 $80 $C4
    add  hl, de                                   ; $4A8D: $19
    ld   [hl], $1F                                ; $4A8E: $36 $1F
    ld   hl, wEntitiesStatusTable                        ; $4A90: $21 $80 $C2
    add  hl, de                                   ; $4A93: $19
    ld   [hl], $01                                ; $4A94: $36 $01
    ld   hl, $C340                                ; $4A96: $21 $40 $C3
    add  hl, de                                   ; $4A99: $19
    ld   [hl], $04                                ; $4A9A: $36 $04
    ld   hl, hNoiseSfx                            ; $4A9C: $21 $F4 $FF
    ld   [hl], $13                                ; $4A9F: $36 $13

jr_006_4AA1:
    dec  e                                        ; $4AA1: $1D
    ld   a, e                                     ; $4AA2: $7B
    cp   $FF                                      ; $4AA3: $FE $FF
    jr   nz, jr_006_4A68                          ; $4AA5: $20 $C1

label_006_4AA7:
    ret                                           ; $4AA7: $C9

    ld   c, d                                     ; $4AA8: $4A
    nop                                           ; $4AA9: $00
    ld   c, h                                     ; $4AAA: $4C
    nop                                           ; $4AAB: $00
    ld   c, h                                     ; $4AAC: $4C
    jr   nz, @+$4C                                ; $4AAD: $20 $4A

    jr   nz, @+$50                                ; $4AAF: $20 $4E

    nop                                           ; $4AB1: $00
    ld   c, [hl]                                  ; $4AB2: $4E
    jr   nz, @+$13                                ; $4AB3: $20 $11

    xor  b                                        ; $4AB5: $A8
    ld   c, d                                     ; $4AB6: $4A
    call RenderAnimatedActiveEntity                               ; $4AB7: $CD $C0 $3B
    call func_006_64C6                            ; $4ABA: $CD $C6 $64
    call func_006_64F7                            ; $4ABD: $CD $F7 $64
    call label_3B39                               ; $4AC0: $CD $39 $3B
    ldh  a, [hMapId]                              ; $4AC3: $F0 $F7
    cp   $FF                                      ; $4AC5: $FE $FF
    jr   nz, jr_006_4ACE                          ; $4AC7: $20 $05

    ld   a, $06                                   ; $4AC9: $3E $06
    jp   Func_036_4BE8_trampoline                                ; $4ACB: $C3 $8F $0A

jr_006_4ACE:
    ldh  a, [hActiveEntityState]                  ; $4ACE: $F0 $F0
    rst  $00                                      ; $4AD0: $C7
    reti                                          ; $4AD1: $D9

    ld   c, d                                     ; $4AD2: $4A
    ldh  [rWY], a                                 ; $4AD3: $E0 $4A
    dec  de                                       ; $4AD5: $1B
    ld   c, e                                     ; $4AD6: $4B
    ld   b, c                                     ; $4AD7: $41
    ld   c, e                                     ; $4AD8: $4B
    call GetEntityTransitionCountdown             ; $4AD9: $CD $05 $0C
    ret  nz                                       ; $4ADC: $C0

    jp   IncrementEntityWalkingAttr               ; $4ADD: $C3 $12 $3B

    ldh  a, [hFrameCounter]                       ; $4AE0: $F0 $E7
    xor  c                                        ; $4AE2: $A9
    and  $03                                      ; $4AE3: $E6 $03
    jr   nz, jr_006_4AEC                          ; $4AE5: $20 $05

    ld   a, $08                                   ; $4AE7: $3E $08
    call label_3BAA                               ; $4AE9: $CD $AA $3B

jr_006_4AEC:
    call func_006_6594                            ; $4AEC: $CD $94 $65
    add  $1C                                      ; $4AEF: $C6 $1C
    cp   $38                                      ; $4AF1: $FE $38
    jr   nc, jr_006_4B0C                          ; $4AF3: $30 $17

    call func_006_65A4                            ; $4AF5: $CD $A4 $65
    add  $1C                                      ; $4AF8: $C6 $1C
    cp   $38                                      ; $4AFA: $FE $38
    jr   nc, jr_006_4B0C                          ; $4AFC: $30 $0E

    ld   hl, wEntitiesSpeedZTable                 ; $4AFE: $21 $20 $C3
    add  hl, bc                                   ; $4B01: $09
    ld   [hl], $28                                ; $4B02: $36 $28
    ld   a, $10                                   ; $4B04: $3E $10
    call label_3BAA                               ; $4B06: $CD $AA $3B
    call IncrementEntityWalkingAttr               ; $4B09: $CD $12 $3B

jr_006_4B0C:
    call func_006_6541                            ; $4B0C: $CD $41 $65
    call label_3B23                               ; $4B0F: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4B12: $F0 $E7
    rra                                           ; $4B14: $1F
    rra                                           ; $4B15: $1F
    and  $01                                      ; $4B16: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4B18: $C3 $0C $3B

    call func_006_6541                            ; $4B1B: $CD $41 $65
    call label_3B23                               ; $4B1E: $CD $23 $3B
    call func_006_657A                            ; $4B21: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $4B24: $21 $20 $C3
    add  hl, bc                                   ; $4B27: $09
    dec  [hl]                                     ; $4B28: $35
    dec  [hl]                                     ; $4B29: $35
    ld   a, [hl]                                  ; $4B2A: $7E
    cp   $02                                      ; $4B2B: $FE $02
    jr   nc, jr_006_4B3C                          ; $4B2D: $30 $0D

    ld   [hl], $C0                                ; $4B2F: $36 $C0
    call GetEntityTransitionCountdown             ; $4B31: $CD $05 $0C
    ld   [hl], $10                                ; $4B34: $36 $10
    call label_3D7F                               ; $4B36: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $4B39: $CD $12 $3B

jr_006_4B3C:
    ld   a, $02                                   ; $4B3C: $3E $02
    jp   SetEntitySpriteVariant                   ; $4B3E: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $4B41: $CD $05 $0C
    ret  nz                                       ; $4B44: $C0

    call func_006_657A                            ; $4B45: $CD $7A $65
    ld   hl, wEntitiesPosZTable                   ; $4B48: $21 $10 $C3
    add  hl, bc                                   ; $4B4B: $09
    ld   a, [hl]                                  ; $4B4C: $7E
    and  a                                        ; $4B4D: $A7
    jr   z, jr_006_4B53                           ; $4B4E: $28 $03

    and  $80                                      ; $4B50: $E6 $80
    ret  z                                        ; $4B52: $C8

jr_006_4B53:
    ld   [hl], b                                  ; $4B53: $70
    call GetEntityTransitionCountdown             ; $4B54: $CD $05 $0C
    ld   [hl], $20                                ; $4B57: $36 $20
    call IncrementEntityWalkingAttr               ; $4B59: $CD $12 $3B
    ld   [hl], b                                  ; $4B5C: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4B5D: $21 $20 $C3
    add  hl, bc                                   ; $4B60: $09
    ld   a, [hl]                                  ; $4B61: $7E
    ld   [hl], b                                  ; $4B62: $70
    bit  7, a                                     ; $4B63: $CB $7F
    ret  z                                        ; $4B65: $C8

    cp   $D0                                      ; $4B66: $FE $D0
    ret  nc                                       ; $4B68: $D0

    ldh  a, [wActiveEntityPosX]                   ; $4B69: $F0 $EE
    ldh  [hScratch0], a                           ; $4B6B: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4B6D: $F0 $EC
    add  $0C                                      ; $4B6F: $C6 $0C
    ldh  [hScratch1], a                           ; $4B71: $E0 $D8
    jp   label_D15                                ; $4B73: $C3 $15 $0D

    nop                                           ; $4B76: $00
    inc  bc                                       ; $4B77: $03
    ld   bc, $2102                                ; $4B78: $01 $02 $21
    or   b                                        ; $4B7B: $B0
    jp   nz, label_006_7E09                       ; $4B7C: $C2 $09 $7E

    and  a                                        ; $4B7F: $A7
    jp   nz, label_006_4E88                       ; $4B80: $C2 $88 $4E

    ld   hl, wEntitiesUnknownTableD               ; $4B83: $21 $D0 $C2
    add  hl, bc                                   ; $4B86: $09
    ld   a, [hl]                                  ; $4B87: $7E
    and  a                                        ; $4B88: $A7
    jr   nz, jr_006_4B98                          ; $4B89: $20 $0D

    inc  [hl]                                     ; $4B8B: $34
    ld   hl, wEntitiesHealthTable                 ; $4B8C: $21 $60 $C3
    add  hl, bc                                   ; $4B8F: $09
    ld   [hl], $08                                ; $4B90: $36 $08
    ld   hl, $C440                                ; $4B92: $21 $40 $C4
    add  hl, bc                                   ; $4B95: $09
    ld   [hl], $01                                ; $4B96: $36 $01

jr_006_4B98:
    call label_394D                               ; $4B98: $CD $4D $39
    call func_006_4E64                            ; $4B9B: $CD $64 $4E
    ldh  a, [hActiveEntityStatus]                 ; $4B9E: $F0 $EA
    cp   $05                                      ; $4BA0: $FE $05
    jp   nz, label_006_5308                       ; $4BA2: $C2 $08 $53

    call func_006_64C6                            ; $4BA5: $CD $C6 $64
    call label_3EE8                               ; $4BA8: $CD $E8 $3E
    call label_C56                                ; $4BAB: $CD $56 $0C
    call label_3B44                               ; $4BAE: $CD $44 $3B
    call func_006_6541                            ; $4BB1: $CD $41 $65
    ld   a, [$C146]                               ; $4BB4: $FA $46 $C1
    and  a                                        ; $4BB7: $A7
    jr   nz, jr_006_4BE1                          ; $4BB8: $20 $27

    ld   hl, $C430                                ; $4BBA: $21 $30 $C4
    add  hl, bc                                   ; $4BBD: $09
    ld   [hl], $C4                                ; $4BBE: $36 $C4
    ldh  a, [hActiveEntityState]                  ; $4BC0: $F0 $F0
    and  a                                        ; $4BC2: $A7
    jr   nz, jr_006_4BDE                          ; $4BC3: $20 $19

    ld   hl, $C380                                ; $4BC5: $21 $80 $C3
    add  hl, bc                                   ; $4BC8: $09
    ld   e, [hl]                                  ; $4BC9: $5E
    ld   d, b                                     ; $4BCA: $50
    ld   hl, $4B76                                ; $4BCB: $21 $76 $4B
    add  hl, de                                   ; $4BCE: $19
    ld   a, [hl]                                  ; $4BCF: $7E
    push af                                       ; $4BD0: $F5
    call func_006_65B4                            ; $4BD1: $CD $B4 $65
    pop  af                                       ; $4BD4: $F1
    cp   e                                        ; $4BD5: $BB
    jr   z, jr_006_4BDE                           ; $4BD6: $28 $06

    ld   hl, $C430                                ; $4BD8: $21 $30 $C4
    add  hl, bc                                   ; $4BDB: $09
    ld   [hl], $84                                ; $4BDC: $36 $84

jr_006_4BDE:
    call label_3B70                               ; $4BDE: $CD $70 $3B

jr_006_4BE1:
    ldh  a, [hActiveEntityState]                  ; $4BE1: $F0 $F0
    rst  $00                                      ; $4BE3: $C7
    jr   nz, jr_006_4C32                          ; $4BE4: $20 $4C

    dec  sp                                       ; $4BE6: $3B
    ld   c, l                                     ; $4BE7: $4D
    inc  d                                        ; $4BE8: $14
    nop                                           ; $4BE9: $00
    db   $EC                                      ; $4BEA: $EC
    nop                                           ; $4BEB: $00
    nop                                           ; $4BEC: $00
    inc  d                                        ; $4BED: $14
    nop                                           ; $4BEE: $00
    db   $EC                                      ; $4BEF: $EC
    ld   b, $07                                   ; $4BF0: $06 $07
    nop                                           ; $4BF2: $00
    ld   bc, vBlankContinue.linkSpriteDone        ; $4BF3: $01 $04 $05
    ld   [bc], a                                  ; $4BF6: $02
    inc  bc                                       ; $4BF7: $03
    db   $10                                      ; $4BF8: $10
    db   $10                                      ; $4BF9: $10
    db   $F4                                      ; $4BFA: $F4
    inc  c                                        ; $4BFB: $0C
    ldh  a, [hActiveEntityState]                  ; $4BFC: $F0 $F0
    db   $F4                                      ; $4BFE: $F4
    inc  c                                        ; $4BFF: $0C
    db   $F4                                      ; $4C00: $F4
    inc  c                                        ; $4C01: $0C
    db   $10                                      ; $4C02: $10
    db   $10                                      ; $4C03: $10
    db   $F4                                      ; $4C04: $F4
    inc  c                                        ; $4C05: $0C
    ldh  a, [hActiveEntityState]                  ; $4C06: $F0 $F0
    add  b                                        ; $4C08: $80
    add  b                                        ; $4C09: $80
    add  b                                        ; $4C0A: $80
    ld   a, a                                     ; $4C0B: $7F
    ld   a, a                                     ; $4C0C: $7F
    ld   a, a                                     ; $4C0D: $7F
    add  b                                        ; $4C0E: $80
    ld   a, a                                     ; $4C0F: $7F
    add  b                                        ; $4C10: $80
    ld   a, a                                     ; $4C11: $7F
    add  b                                        ; $4C12: $80
    add  b                                        ; $4C13: $80
    add  b                                        ; $4C14: $80
    ld   a, a                                     ; $4C15: $7F
    ld   a, a                                     ; $4C16: $7F
    ld   a, a                                     ; $4C17: $7F
    nop                                           ; $4C18: $00
    ld   [bc], a                                  ; $4C19: $02
    nop                                           ; $4C1A: $00
    ld   bc, $0301                                ; $4C1B: $01 $01 $03
    ld   [bc], a                                  ; $4C1E: $02
    inc  bc                                       ; $4C1F: $03
    ld   hl, $C420                                ; $4C20: $21 $20 $C4
    add  hl, bc                                   ; $4C23: $09
    ld   a, [hl]                                  ; $4C24: $7E
    and  a                                        ; $4C25: $A7
    jr   z, jr_006_4C4F                           ; $4C26: $28 $27

    call func_006_4C59                            ; $4C28: $CD $59 $4C
    call IncrementEntityWalkingAttr               ; $4C2B: $CD $12 $3B
    ld   hl, $C380                                ; $4C2E: $21 $80 $C3
    add  hl, bc                                   ; $4C31: $09

jr_006_4C32:
    ld   a, [hl]                                  ; $4C32: $7E
    ld   hl, $C390                                ; $4C33: $21 $90 $C3
    add  hl, bc                                   ; $4C36: $09
    ld   [hl], a                                  ; $4C37: $77
    call GetEntityTransitionCountdown             ; $4C38: $CD $05 $0C
    ld   [hl], $58                                ; $4C3B: $36 $58
    call GetRandomByte                            ; $4C3D: $CD $0D $28
    and  $01                                      ; $4C40: $E6 $01
    jr   nz, jr_006_4C4C                          ; $4C42: $20 $08

    ld   hl, $C440                                ; $4C44: $21 $40 $C4
    add  hl, bc                                   ; $4C47: $09
    ld   a, [hl]                                  ; $4C48: $7E
    cpl                                           ; $4C49: $2F
    inc  a                                        ; $4C4A: $3C
    ld   [hl], a                                  ; $4C4B: $77

jr_006_4C4C:
    jp   label_3D7F                               ; $4C4C: $C3 $7F $3D

jr_006_4C4F:
    call GetEntityTransitionCountdown             ; $4C4F: $CD $05 $0C
    jr   z, jr_006_4C59                           ; $4C52: $28 $05

    cp   $01                                      ; $4C54: $FE $01
    jr   z, jr_006_4C83                           ; $4C56: $28 $2B

    ret                                           ; $4C58: $C9

func_006_4C59:
jr_006_4C59:
    ld   hl, wEntitiesPosXTable                         ; $4C59: $21 $00 $C2
    add  hl, bc                                   ; $4C5C: $09
    ld   a, [hl]                                  ; $4C5D: $7E
    cp   $20                                      ; $4C5E: $FE $20
    jr   c, jr_006_4C78                           ; $4C60: $38 $16

    cp   $80                                      ; $4C62: $FE $80
    jr   nc, jr_006_4C78                          ; $4C64: $30 $12

    ld   hl, wEntitiesPosYTable                         ; $4C66: $21 $10 $C2
    add  hl, bc                                   ; $4C69: $09
    ld   a, [hl]                                  ; $4C6A: $7E
    cp   $28                                      ; $4C6B: $FE $28
    jr   c, jr_006_4C73                           ; $4C6D: $38 $04

    cp   $68                                      ; $4C6F: $FE $68
    jr   c, jr_006_4C91                           ; $4C71: $38 $1E

jr_006_4C73:
    ldh  a, [$FFEF]                               ; $4C73: $F0 $EF
    ld   [hl], a                                  ; $4C75: $77
    jr   jr_006_4C7B                              ; $4C76: $18 $03

jr_006_4C78:
    ldh  a, [wActiveEntityPosX]                   ; $4C78: $F0 $EE
    ld   [hl], a                                  ; $4C7A: $77

jr_006_4C7B:
    call GetEntityTransitionCountdown             ; $4C7B: $CD $05 $0C
    ld   [hl], $15                                ; $4C7E: $36 $15
    jp   label_3D7F                               ; $4C80: $C3 $7F $3D

jr_006_4C83:
    ld   hl, $C440                                ; $4C83: $21 $40 $C4
    add  hl, bc                                   ; $4C86: $09
    ld   e, [hl]                                  ; $4C87: $5E
    ld   hl, $C380                                ; $4C88: $21 $80 $C3
    add  hl, bc                                   ; $4C8B: $09
    ld   a, [hl]                                  ; $4C8C: $7E
    add  e                                        ; $4C8D: $83
    and  $03                                      ; $4C8E: $E6 $03
    ld   [hl], a                                  ; $4C90: $77

func_006_4C91:
jr_006_4C91:
    ld   hl, $C380                                ; $4C91: $21 $80 $C3
    add  hl, bc                                   ; $4C94: $09
    ld   a, [hl]                                  ; $4C95: $7E
    ld   e, a                                     ; $4C96: $5F
    ld   d, b                                     ; $4C97: $50
    ld   hl, $4BE8                                ; $4C98: $21 $E8 $4B
    add  hl, de                                   ; $4C9B: $19
    ld   a, [hl]                                  ; $4C9C: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4C9D: $21 $40 $C2
    add  hl, bc                                   ; $4CA0: $09
    ld   [hl], a                                  ; $4CA1: $77
    ld   hl, $4BEC                                ; $4CA2: $21 $EC $4B
    add  hl, de                                   ; $4CA5: $19
    ld   a, [hl]                                  ; $4CA6: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4CA7: $21 $50 $C2
    add  hl, bc                                   ; $4CAA: $09
    ld   [hl], a                                  ; $4CAB: $77
    sla  e                                        ; $4CAC: $CB $23
    ldh  a, [hFrameCounter]                       ; $4CAE: $F0 $E7
    rra                                           ; $4CB0: $1F
    rra                                           ; $4CB1: $1F
    rra                                           ; $4CB2: $1F
    and  $01                                      ; $4CB3: $E6 $01
    or   e                                        ; $4CB5: $B3
    and  $07                                      ; $4CB6: $E6 $07
    ld   e, a                                     ; $4CB8: $5F
    ld   d, b                                     ; $4CB9: $50
    ld   hl, $4BF0                                ; $4CBA: $21 $F0 $4B
    add  hl, de                                   ; $4CBD: $19
    ld   a, [hl]                                  ; $4CBE: $7E
    call SetEntitySpriteVariant                   ; $4CBF: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $4CC2: $F0 $E7
    and  $0F                                      ; $4CC4: $E6 $0F
    jr   nz, jr_006_4D3A                          ; $4CC6: $20 $72

    ld   a, $2F                                   ; $4CC8: $3E $2F
    ldh  [hNoiseSfx], a                           ; $4CCA: $E0 $F4
    ld   a, $01                                   ; $4CCC: $3E $01

jr_006_4CCE:
    ldh  [hFFE8], a                               ; $4CCE: $E0 $E8
    ld   a, $8E                                   ; $4CD0: $3E $8E
    call func_003_64CA_trampoline                               ; $4CD2: $CD $86 $3B
    jr   c, jr_006_4D3A                           ; $4CD5: $38 $63

    push bc                                       ; $4CD7: $C5
    ld   hl, $C380                                ; $4CD8: $21 $80 $C3
    add  hl, bc                                   ; $4CDB: $09
    ld   a, [hl]                                  ; $4CDC: $7E
    sla  a                                        ; $4CDD: $CB $27
    ld   hl, hFFE8                                ; $4CDF: $21 $E8 $FF
    or   [hl]                                     ; $4CE2: $B6
    ld   c, a                                     ; $4CE3: $4F
    ld   hl, $4BF8                                ; $4CE4: $21 $F8 $4B
    add  hl, bc                                   ; $4CE7: $09
    ldh  a, [hScratch0]                           ; $4CE8: $F0 $D7
    add  [hl]                                     ; $4CEA: $86
    ld   hl, wEntitiesPosXTable                         ; $4CEB: $21 $00 $C2
    add  hl, de                                   ; $4CEE: $19
    ld   [hl], a                                  ; $4CEF: $77
    ld   hl, $4C00                                ; $4CF0: $21 $00 $4C
    add  hl, bc                                   ; $4CF3: $09
    ldh  a, [hScratch1]                           ; $4CF4: $F0 $D8
    add  [hl]                                     ; $4CF6: $86
    ld   hl, wEntitiesPosYTable                         ; $4CF7: $21 $10 $C2
    add  hl, de                                   ; $4CFA: $19
    ld   [hl], a                                  ; $4CFB: $77
    ld   hl, $4C08                                ; $4CFC: $21 $08 $4C
    add  hl, bc                                   ; $4CFF: $09
    ld   a, [hl]                                  ; $4D00: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4D01: $21 $40 $C2
    add  hl, de                                   ; $4D04: $19
    ld   [hl], a                                  ; $4D05: $77
    ld   hl, $4C10                                ; $4D06: $21 $10 $4C
    add  hl, bc                                   ; $4D09: $09
    ld   a, [hl]                                  ; $4D0A: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4D0B: $21 $50 $C2
    add  hl, de                                   ; $4D0E: $19
    ld   [hl], a                                  ; $4D0F: $77
    ld   hl, $4C18                                ; $4D10: $21 $18 $4C
    add  hl, bc                                   ; $4D13: $09
    ld   a, [hl]                                  ; $4D14: $7E
    ld   hl, wEntitiesSpriteVariantTable               ; $4D15: $21 $B0 $C3
    add  hl, de                                   ; $4D18: $19
    ld   [hl], a                                  ; $4D19: $77
    ld   hl, wEntitiesUnknownTableB               ; $4D1A: $21 $B0 $C2
    add  hl, de                                   ; $4D1D: $19
    ld   [hl], $01                                ; $4D1E: $36 $01
    ld   hl, $C340                                ; $4D20: $21 $40 $C3
    add  hl, de                                   ; $4D23: $19
    ld   [hl], $C2                                ; $4D24: $36 $C2
    ld   hl, $C430                                ; $4D26: $21 $30 $C4
    add  hl, de                                   ; $4D29: $19
    ld   [hl], $00                                ; $4D2A: $36 $00
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D2C: $21 $E0 $C2
    add  hl, de                                   ; $4D2F: $19
    ld   [hl], $0C                                ; $4D30: $36 $0C
    pop  bc                                       ; $4D32: $C1
    ldh  a, [hFFE8]                               ; $4D33: $F0 $E8
    dec  a                                        ; $4D35: $3D
    cp   $FF                                      ; $4D36: $FE $FF
    jr   nz, jr_006_4CCE                          ; $4D38: $20 $94

jr_006_4D3A:
    ret                                           ; $4D3A: $C9

    call GetEntityTransitionCountdown             ; $4D3B: $CD $05 $0C
    jr   nz, jr_006_4D51                          ; $4D3E: $20 $11

    ld   hl, $C390                                ; $4D40: $21 $90 $C3
    add  hl, bc                                   ; $4D43: $09
    ld   a, [hl]                                  ; $4D44: $7E
    xor  $02                                      ; $4D45: $EE $02
    ld   hl, $C380                                ; $4D47: $21 $80 $C3
    add  hl, bc                                   ; $4D4A: $09
    ld   [hl], a                                  ; $4D4B: $77
    call IncrementEntityWalkingAttr               ; $4D4C: $CD $12 $3B
    ld   [hl], b                                  ; $4D4F: $70
    ret                                           ; $4D50: $C9

jr_006_4D51:
    and  $03                                      ; $4D51: $E6 $03
    jr   nz, jr_006_4D5E                          ; $4D53: $20 $09

    ld   hl, $C380                                ; $4D55: $21 $80 $C3
    add  hl, bc                                   ; $4D58: $09
    ld   a, [hl]                                  ; $4D59: $7E
    inc  a                                        ; $4D5A: $3C
    and  $03                                      ; $4D5B: $E6 $03
    ld   [hl], a                                  ; $4D5D: $77

jr_006_4D5E:
    call func_006_4C91                            ; $4D5E: $CD $91 $4C
    jp   label_3D7F                               ; $4D61: $C3 $7F $3D

Data_006_4D64::
    db   $F8, $F8, $60, $02, $F8, $00, $62, $02, $F8, $08, $62, $22, $F8, $10, $60, $22
    db   $08, $F8, $64, $02, $08, $00, $66, $02, $08, $08, $66, $22, $08, $10, $64, $22
    db   $FA, $F8, $60, $02, $FA, $00, $62, $02, $FA, $08, $62, $22, $FA, $10, $60, $22
    db   $08, $F8, $64, $02, $08, $00, $66, $02, $08, $08, $66, $22, $08, $10, $64, $22
    db   $F8, $F8, $64, $42, $F8, $00, $66, $42, $F8, $08, $66, $62, $F8, $10, $64, $62
    db   $08, $F8, $60, $42, $08, $00, $62, $42, $08, $08, $62, $62, $08, $10, $60, $62
    db   $F8, $F8, $64, $42, $F8, $00, $66, $42, $F8, $08, $66, $62, $F8, $10, $64, $62
    db   $06, $F8, $60, $42, $06, $00, $62, $42, $06, $08, $62, $62, $06, $10, $60, $62
    db   $F8, $F8, $68, $02, $F8, $00, $6A, $02, $F8, $08, $62, $22, $F8, $10, $60, $22
    db   $08, $F8, $68, $42, $08, $00, $6A, $42, $08, $08, $62, $62, $08, $10, $60, $62
    db   $F8, $F8, $68, $02, $F8, $00, $6A, $02, $F8, $06, $62, $22, $F8, $0E, $60, $22
    db   $08, $F8, $68, $42, $08, $00, $6A, $42, $08, $06, $62, $62, $08, $0E, $60, $62
    db   $F8, $F8, $60, $02, $F8, $00, $62, $02, $F8, $08, $6A, $22, $F8, $10, $68, $22
    db   $08, $F8, $60, $42, $08, $00, $62, $42, $08, $08, $6A, $62, $08, $10, $68, $62
    db   $F8, $FA, $60, $02, $F8, $02, $62, $02, $F8, $08, $6A, $22, $F8, $10, $68, $22
    db   $08, $FA, $60, $42, $08, $02, $62, $42, $08, $08, $6A, $62, $08, $10, $68, $62

func_006_4E64:
    ldh  a, [hActiveEntitySpriteVariant]               ; $4E64: $F0 $F1
    rla                                           ; $4E66: $17
    rla                                           ; $4E67: $17
    rla                                           ; $4E68: $17
    rla                                           ; $4E69: $17
    rla                                           ; $4E6A: $17
    and  $E0                                      ; $4E6B: $E6 $E0
    ld   e, a                                     ; $4E6D: $5F
    ld   d, b                                     ; $4E6E: $50
    ld   hl, Data_006_4D64                        ; $4E6F: $21 $64 $4D
    add  hl, de                                   ; $4E72: $19
    ld   c, $08                                   ; $4E73: $0E $08
    jp   label_3CE6                               ; $4E75: $C3 $E6 $3C

    ld   l, h                                     ; $4E78: $6C
    nop                                           ; $4E79: $00
    ld   l, [hl]                                  ; $4E7A: $6E
    nop                                           ; $4E7B: $00
    ld   l, [hl]                                  ; $4E7C: $6E
    jr   nz, jr_006_4EEB                          ; $4E7D: $20 $6C

    jr   nz, jr_006_4EED                          ; $4E7F: $20 $6C

    ld   b, b                                     ; $4E81: $40
    ld   l, [hl]                                  ; $4E82: $6E
    ld   b, b                                     ; $4E83: $40
    ld   l, [hl]                                  ; $4E84: $6E
    ld   h, b                                     ; $4E85: $60
    ld   l, h                                     ; $4E86: $6C
    ld   h, b                                     ; $4E87: $60

label_006_4E88:
    ld   de, $4E78                                ; $4E88: $11 $78 $4E
    call RenderAnimatedActiveEntity                               ; $4E8B: $CD $C0 $3B
    call func_006_64C6                            ; $4E8E: $CD $C6 $64
    call GetEntityTransitionCountdown             ; $4E91: $CD $05 $0C
    jp   z, label_006_65DB                        ; $4E94: $CA $DB $65

    cp   $06                                      ; $4E97: $FE $06
    ret  nz                                       ; $4E99: $C0

    jp   label_006_6541                           ; $4E9A: $C3 $41 $65

    ld   hl, sp+$10                               ; $4E9D: $F8 $10
    ld   a, [$F010]                               ; $4E9F: $FA $10 $F0
    ldh  a, [hAnimatedTilesDataOffset]            ; $4EA2: $F0 $A7
    jr   nz, jr_006_4EB7                          ; $4EA4: $20 $11

    ld   hl, wEntitiesPosXTable                         ; $4EA6: $21 $00 $C2
    add  hl, bc                                   ; $4EA9: $09
    ld   a, [hl]                                  ; $4EAA: $7E
    add  $08                                      ; $4EAB: $C6 $08
    ld   [hl], a                                  ; $4EAD: $77
    ld   hl, wEntitiesPosZTable                   ; $4EAE: $21 $10 $C3
    add  hl, bc                                   ; $4EB1: $09
    ld   [hl], $10                                ; $4EB2: $36 $10
    jp   IncrementEntityWalkingAttr               ; $4EB4: $C3 $12 $3B

label_006_4EB7:
jr_006_4EB7:
    ld   de, $4E9D                                ; $4EB7: $11 $9D $4E
    call RenderAnimatedActiveEntity                               ; $4EBA: $CD $C0 $3B
    call func_006_64C6                            ; $4EBD: $CD $C6 $64
    ldh  a, [$FFBA]                               ; $4EC0: $F0 $BA
    cp   $02                                      ; $4EC2: $FE $02
    jr   z, jr_006_4EF2                           ; $4EC4: $28 $2C

    and  a                                        ; $4EC6: $A7
    jr   z, jr_006_4EE3                           ; $4EC7: $28 $1A

    ld   hl, $C3D0                                ; $4EC9: $21 $D0 $C3
    add  hl, bc                                   ; $4ECC: $09
    inc  [hl]                                     ; $4ECD: $34
    ld   a, [hl]                                  ; $4ECE: $7E
    cp   $0A                                      ; $4ECF: $FE $0A
    jr   nz, jr_006_4EE2                          ; $4ED1: $20 $0F

    ld   [hl], b                                  ; $4ED3: $70
    ld   a, $11                                   ; $4ED4: $3E $11
    ldh  [hNoiseSfx], a                           ; $4ED6: $E0 $F4
    ld   hl, wEntitiesPosZTable                   ; $4ED8: $21 $10 $C3
    add  hl, bc                                   ; $4EDB: $09
    ld   a, [hl]                                  ; $4EDC: $7E
    cp   $20                                      ; $4EDD: $FE $20
    jr   nc, jr_006_4EE2                          ; $4EDF: $30 $01

    inc  [hl]                                     ; $4EE1: $34

jr_006_4EE2:
    ret                                           ; $4EE2: $C9

jr_006_4EE3:
    ld   hl, wEntitiesPosZTable                   ; $4EE3: $21 $10 $C3
    add  hl, bc                                   ; $4EE6: $09
    ld   a, [hl]                                  ; $4EE7: $7E
    and  a                                        ; $4EE8: $A7
    jr   z, jr_006_4F0E                           ; $4EE9: $28 $23

jr_006_4EEB:
    ldh  a, [hFrameCounter]                       ; $4EEB: $F0 $E7

jr_006_4EED:
    and  $0F                                      ; $4EED: $E6 $0F
    jr   nz, jr_006_4EF2                          ; $4EEF: $20 $01

    dec  [hl]                                     ; $4EF1: $35

jr_006_4EF2:
    ld   a, [hl]                                  ; $4EF2: $7E
    cp   $04                                      ; $4EF3: $FE $04
    jr   nc, jr_006_4F0D                          ; $4EF5: $30 $16

    call label_3B5A                               ; $4EF7: $CD $5A $3B
    ret  nc                                       ; $4EFA: $D0

    ld   a, $08                                   ; $4EFB: $3E $08
    ld   [$C13E], a                               ; $4EFD: $EA $3E $C1
    ld   a, $10                                   ; $4F00: $3E $10
    call label_3BB5                               ; $4F02: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4F05: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $4F07: $E0 $9B
    ldh  a, [hScratch1]                           ; $4F09: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $4F0B: $E0 $9A

jr_006_4F0D:
    ret                                           ; $4F0D: $C9

jr_006_4F0E:
    call label_3B5A                               ; $4F0E: $CD $5A $3B
    ret  nc                                       ; $4F11: $D0

    jp   label_006_641F                           ; $4F12: $C3 $1F $64

    ldh  a, [hActiveEntityState]                  ; $4F15: $F0 $F0
    and  a                                        ; $4F17: $A7
    jp   nz, label_006_4EB7                       ; $4F18: $C2 $B7 $4E

    ld   hl, wEntitiesPosYTable                         ; $4F1B: $21 $10 $C2
    add  hl, bc                                   ; $4F1E: $09
    ld   a, [hl]                                  ; $4F1F: $7E
    add  $08                                      ; $4F20: $C6 $08
    ld   [hl], a                                  ; $4F22: $77
    ld   hl, wEntitiesPosZTable                   ; $4F23: $21 $10 $C3
    add  hl, bc                                   ; $4F26: $09
    ld   [hl], $10                                ; $4F27: $36 $10
    jp   IncrementEntityWalkingAttr               ; $4F29: $C3 $12 $3B

    ld   b, h                                     ; $4F2C: $44
    ld   bc, $2144                                ; $4F2D: $01 $44 $21
    ld   b, [hl]                                  ; $4F30: $46
    ld   bc, $2146                                ; $4F31: $01 $46 $21
    ld   h, h                                     ; $4F34: $64
    ld   bc, $2164                                ; $4F35: $01 $64 $21
    ld   h, [hl]                                  ; $4F38: $66
    ld   bc, $2166                                ; $4F39: $01 $66 $21
    ld   de, $4F2C                                ; $4F3C: $11 $2C $4F
    ldh  a, [hMapId]                              ; $4F3F: $F0 $F7
    cp   $0A                                      ; $4F41: $FE $0A
    jr   nz, jr_006_4F48                          ; $4F43: $20 $03

    ld   de, $4F34                                ; $4F45: $11 $34 $4F

jr_006_4F48:
    call RenderAnimatedActiveEntity                               ; $4F48: $CD $C0 $3B
    call func_006_64C6                            ; $4F4B: $CD $C6 $64
    call func_006_64F7                            ; $4F4E: $CD $F7 $64
    call label_3B39                               ; $4F51: $CD $39 $3B
    call func_006_6541                            ; $4F54: $CD $41 $65
    call label_3B23                               ; $4F57: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4F5A: $F0 $E7
    rra                                           ; $4F5C: $1F
    rra                                           ; $4F5D: $1F
    rra                                           ; $4F5E: $1F
    and  $01                                      ; $4F5F: $E6 $01
    call SetEntitySpriteVariant                   ; $4F61: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $4F64: $F0 $E7
    xor  c                                        ; $4F66: $A9
    and  $03                                      ; $4F67: $E6 $03
    jr   nz, jr_006_4FAF                          ; $4F69: $20 $44

    call GetRandomByte                            ; $4F6B: $CD $0D $28
    xor  c                                        ; $4F6E: $A9
    and  $07                                      ; $4F6F: $E6 $07
    add  $04                                      ; $4F71: $C6 $04
    call label_3BB5                               ; $4F73: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4F76: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                       ; $4F78: $21 $50 $C2
    call func_006_4FA3                            ; $4F7B: $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ; $4F7E: $21 $A0 $C2
    add  hl, bc                                   ; $4F81: $09
    ld   a, [hl]                                  ; $4F82: $7E
    and  $0C                                      ; $4F83: $E6 $0C
    jr   z, jr_006_4F8C                           ; $4F85: $28 $05

    ld   hl, wEntitiesSpeedYTable                       ; $4F87: $21 $50 $C2
    add  hl, bc                                   ; $4F8A: $09
    ld   [hl], b                                  ; $4F8B: $70

jr_006_4F8C:
    ldh  a, [hScratch1]                           ; $4F8C: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                       ; $4F8E: $21 $40 $C2
    call func_006_4FA3                            ; $4F91: $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ; $4F94: $21 $A0 $C2
    add  hl, bc                                   ; $4F97: $09
    ld   a, [hl]                                  ; $4F98: $7E
    and  $03                                      ; $4F99: $E6 $03
    jr   z, jr_006_4FA2                           ; $4F9B: $28 $05

    ld   hl, wEntitiesSpeedXTable                       ; $4F9D: $21 $40 $C2
    add  hl, bc                                   ; $4FA0: $09
    ld   [hl], b                                  ; $4FA1: $70

jr_006_4FA2:
    ret                                           ; $4FA2: $C9

func_006_4FA3:
    add  hl, bc                                   ; $4FA3: $09
    sub  [hl]                                     ; $4FA4: $96
    jr   z, jr_006_4FAF                           ; $4FA5: $28 $08

    bit  7, a                                     ; $4FA7: $CB $7F
    jr   z, jr_006_4FAE                           ; $4FA9: $28 $03

    dec  [hl]                                     ; $4FAB: $35
    jr   jr_006_4FAF                              ; $4FAC: $18 $01

jr_006_4FAE:
    inc  [hl]                                     ; $4FAE: $34

jr_006_4FAF:
    ret                                           ; $4FAF: $C9

    ld   [$00F8], sp                              ; $4FB0: $08 $F8 $00
    nop                                           ; $4FB3: $00
    nop                                           ; $4FB4: $00
    nop                                           ; $4FB5: $00
    ld   hl, sp+$08                               ; $4FB6: $F8 $08
    call func_006_52BA                            ; $4FB8: $CD $BA $52
    xor  a                                        ; $4FBB: $AF
    ld   [wC167], a                               ; $4FBC: $EA $67 $C1
    ldh  a, [hActiveEntityStatus]                 ; $4FBF: $F0 $EA
    cp   $05                                      ; $4FC1: $FE $05
    jp   nz, label_006_5308                       ; $4FC3: $C2 $08 $53

    call func_006_64C6                            ; $4FC6: $CD $C6 $64
    call label_3EE8                               ; $4FC9: $CD $E8 $3E
    call func_006_64F7                            ; $4FCC: $CD $F7 $64
    call IsEntityUnknownFZero                     ; $4FCF: $CD $00 $0C
    jr   z, jr_006_4FD7                           ; $4FD2: $28 $03

    call func_006_51B0                            ; $4FD4: $CD $B0 $51

jr_006_4FD7:
    ldh  a, [hActiveEntityState]                  ; $4FD7: $F0 $F0
    cp   $04                                      ; $4FD9: $FE $04
    jr   nc, jr_006_4FF1                          ; $4FDB: $30 $14

    ld   hl, $C420                                ; $4FDD: $21 $20 $C4
    add  hl, bc                                   ; $4FE0: $09
    ld   a, [hl]                                  ; $4FE1: $7E
    cp   $03                                      ; $4FE2: $FE $03
    jr   nz, jr_006_4FF1                          ; $4FE4: $20 $0B

    call IncrementEntityWalkingAttr               ; $4FE6: $CD $12 $3B
    ld   [hl], $05                                ; $4FE9: $36 $05
    call GetEntityTransitionCountdown             ; $4FEB: $CD $05 $0C
    ld   [hl], $20                                ; $4FEE: $36 $20
    ret                                           ; $4FF0: $C9

jr_006_4FF1:
    ldh  a, [hActiveEntityState]                  ; $4FF1: $F0 $F0
    rst  $00                                      ; $4FF3: $C7
    ld   [hl], h                                  ; $4FF4: $74
    ld   d, b                                     ; $4FF5: $50
    nop                                           ; $4FF6: $00
    ld   d, b                                     ; $4FF7: $50
    xor  b                                        ; $4FF8: $A8
    ld   d, b                                     ; $4FF9: $50
    bit  2, b                                     ; $4FFA: $CB $50
    dec  sp                                       ; $4FFC: $3B
    ld   d, c                                     ; $4FFD: $51
    cp   h                                        ; $4FFE: $BC
    ld   d, c                                     ; $4FFF: $51
    call label_3B39                               ; $5000: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $5003: $CD $05 $0C
    jr   z, jr_006_501A                           ; $5006: $28 $12

    cp   $0A                                      ; $5008: $FE $0A
    jr   nz, jr_006_5017                          ; $500A: $20 $0B

    call func_006_65B4                            ; $500C: $CD $B4 $65
    ld   hl, $C380                                ; $500F: $21 $80 $C3
    add  hl, bc                                   ; $5012: $09
    ld   a, e                                     ; $5013: $7B
    cp   [hl]                                     ; $5014: $BE
    jr   nz, jr_006_5017                          ; $5015: $20 $00

jr_006_5017:
    jp   label_3B23                               ; $5017: $C3 $23 $3B

jr_006_501A:
    ld   hl, wEntitiesUnknownTableD               ; $501A: $21 $D0 $C2
    add  hl, bc                                   ; $501D: $09
    inc  [hl]                                     ; $501E: $34
    ld   a, [hl]                                  ; $501F: $7E
    cp   $02                                      ; $5020: $FE $02
    jr   nz, jr_006_5037                          ; $5022: $20 $13

    ld   [hl], b                                  ; $5024: $70
    call GetRandomByte                            ; $5025: $CD $0D $28
    and  $01                                      ; $5028: $E6 $01
    jr   nz, jr_006_5037                          ; $502A: $20 $0B

    call IncrementEntityWalkingAttr               ; $502C: $CD $12 $3B
    ld   [hl], $02                                ; $502F: $36 $02
    call GetEntityTransitionCountdown             ; $5031: $CD $05 $0C
    ld   [hl], $30                                ; $5034: $36 $30
    ret                                           ; $5036: $C9

jr_006_5037:
    call GetEntityTransitionCountdown             ; $5037: $CD $05 $0C
    call GetRandomByte                            ; $503A: $CD $0D $28
    and  $1F                                      ; $503D: $E6 $1F
    or   $20                                      ; $503F: $F6 $20
    ld   [hl], a                                  ; $5041: $77
    call IncrementEntityWalkingAttr               ; $5042: $CD $12 $3B
    ld   [hl], b                                  ; $5045: $70
    ld   hl, wEntitiesUnknownTableB               ; $5046: $21 $B0 $C2
    add  hl, bc                                   ; $5049: $09
    ld   a, [hl]                                  ; $504A: $7E
    inc  a                                        ; $504B: $3C
    and  $03                                      ; $504C: $E6 $03
    ld   [hl], a                                  ; $504E: $77
    cp   $00                                      ; $504F: $FE $00
    jr   nz, jr_006_5058                          ; $5051: $20 $05

    call func_006_65B4                            ; $5053: $CD $B4 $65
    jr   jr_006_505B                              ; $5056: $18 $03

jr_006_5058:
    call GetRandomByte                            ; $5058: $CD $0D $28

jr_006_505B:
    and  $03                                      ; $505B: $E6 $03
    ld   e, a                                     ; $505D: $5F
    ld   d, b                                     ; $505E: $50
    ld   hl, $4FB0                                ; $505F: $21 $B0 $4F
    add  hl, de                                   ; $5062: $19
    ld   a, [hl]                                  ; $5063: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5064: $21 $40 $C2
    add  hl, bc                                   ; $5067: $09
    ld   [hl], a                                  ; $5068: $77
    ld   hl, $4FB4                                ; $5069: $21 $B4 $4F
    add  hl, de                                   ; $506C: $19
    ld   a, [hl]                                  ; $506D: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $506E: $21 $50 $C2
    add  hl, bc                                   ; $5071: $09
    ld   [hl], a                                  ; $5072: $77
    ret                                           ; $5073: $C9

    call label_3B39                               ; $5074: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ; $5077: $21 $A0 $C2
    add  hl, bc                                   ; $507A: $09
    ld   a, [hl]                                  ; $507B: $7E
    and  $0F                                      ; $507C: $E6 $0F
    jr   nz, jr_006_5085                          ; $507E: $20 $05

    call GetEntityTransitionCountdown             ; $5080: $CD $05 $0C
    jr   nz, jr_006_5093                          ; $5083: $20 $0E

jr_006_5085:
    call GetRandomByte                            ; $5085: $CD $0D $28
    and  $0F                                      ; $5088: $E6 $0F
    or   $10                                      ; $508A: $F6 $10
    ld   [hl], a                                  ; $508C: $77
    call IncrementEntityWalkingAttr               ; $508D: $CD $12 $3B
    call label_3D7F                               ; $5090: $CD $7F $3D

jr_006_5093:
    call func_006_6541                            ; $5093: $CD $41 $65
    call label_3B23                               ; $5096: $CD $23 $3B

func_006_5099:
    ld   hl, $C3D0                                ; $5099: $21 $D0 $C3
    add  hl, bc                                   ; $509C: $09
    inc  [hl]                                     ; $509D: $34
    ld   a, [hl]                                  ; $509E: $7E
    rra                                           ; $509F: $1F
    rra                                           ; $50A0: $1F
    rra                                           ; $50A1: $1F
    rra                                           ; $50A2: $1F
    and  $01                                      ; $50A3: $E6 $01
    jp   SetEntitySpriteVariant                   ; $50A5: $C3 $0C $3B

    call label_3B39                               ; $50A8: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $50AB: $CD $05 $0C
    jr   nz, jr_006_50BA                          ; $50AE: $20 $0A

    ld   [hl], $20                                ; $50B0: $36 $20
    call IncrementEntityWalkingAttr               ; $50B2: $CD $12 $3B
    ld   a, $18                                   ; $50B5: $3E $18
    call label_3BAA                               ; $50B7: $CD $AA $3B

jr_006_50BA:
    call func_006_5099                            ; $50BA: $CD $99 $50
    call func_006_5099                            ; $50BD: $CD $99 $50
    ldh  a, [hFrameCounter]                       ; $50C0: $F0 $E7
    and  $0F                                      ; $50C2: $E6 $0F
    jr   nz, jr_006_50CA                          ; $50C4: $20 $04

    ld   a, $20                                   ; $50C6: $3E $20
    ldh  [hJingle], a                             ; $50C8: $E0 $F2

jr_006_50CA:
    ret                                           ; $50CA: $C9

    call label_3B39                               ; $50CB: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $50CE: $CD $05 $0C
    jr   nz, jr_006_50D7                          ; $50D1: $20 $04

    call IncrementEntityWalkingAttr               ; $50D3: $CD $12 $3B
    ld   [hl], b                                  ; $50D6: $70

jr_006_50D7:
    call func_006_6541                            ; $50D7: $CD $41 $65
    call label_3B23                               ; $50DA: $CD $23 $3B
    call func_006_6594                            ; $50DD: $CD $94 $65
    add  $18                                      ; $50E0: $C6 $18
    cp   $30                                      ; $50E2: $FE $30
    jr   nc, jr_006_5102                          ; $50E4: $30 $1C

    call func_006_65A4                            ; $50E6: $CD $A4 $65
    add  $18                                      ; $50E9: $C6 $18
    cp   $30                                      ; $50EB: $FE $30
    jr   nc, jr_006_5102                          ; $50ED: $30 $13

    ld   a, [wLinkMotionState]                    ; $50EF: $FA $1C $C1
    cp   $00                                      ; $50F2: $FE $00
    jr   nz, jr_006_5102                          ; $50F4: $20 $0C

    call IncrementEntityWalkingAttr               ; $50F6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $50F9: $CD $05 $0C
    ld   [hl], $4F                                ; $50FC: $36 $4F
    ld   a, $16                                   ; $50FE: $3E $16
    ldh  [hWaveSfx], a                            ; $5100: $E0 $F3

jr_006_5102:
    ldh  a, [hFrameCounter]                       ; $5102: $F0 $E7
    and  $07                                      ; $5104: $E6 $07
    jr   nz, jr_006_5117                          ; $5106: $20 $0F

    ldh  a, [wActiveEntityPosX]                   ; $5108: $F0 $EE
    ldh  [hScratch0], a                           ; $510A: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $510C: $F0 $EC
    add  $0A                                      ; $510E: $C6 $0A
    ldh  [hScratch1], a                           ; $5110: $E0 $D8
    ld   a, $0B                                   ; $5112: $3E $0B
    call label_CC7                                ; $5114: $CD $C7 $0C

jr_006_5117:
    jr   jr_006_50BA                              ; $5117: $18 $A1

    nop                                           ; $5119: $00
    nop                                           ; $511A: $00
    nop                                           ; $511B: $00
    nop                                           ; $511C: $00
    ld   bc, $0101                                ; $511D: $01 $01 $01
    ld   bc, $0000                                ; $5120: $01 $00 $00
    rst  $28                                      ; $5123: $EF
    rst  $28                                      ; $5124: $EF
    rst  $28                                      ; $5125: $EF
    rst  $28                                      ; $5126: $EF
    rst  $28                                      ; $5127: $EF
    rst  $28                                      ; $5128: $EF
    rst  $28                                      ; $5129: $EF
    rst  $28                                      ; $512A: $EF
    di                                            ; $512B: $F3
    rst  $30                                      ; $512C: $F7
    ei                                            ; $512D: $FB
    nop                                           ; $512E: $00
    dec  d                                        ; $512F: $15
    dec  d                                        ; $5130: $15
    dec  d                                        ; $5131: $15
    dec  d                                        ; $5132: $15
    dec  d                                        ; $5133: $15
    inc  d                                        ; $5134: $14
    inc  d                                        ; $5135: $14
    inc  d                                        ; $5136: $14
    db   $10                                      ; $5137: $10
    ld   [$0004], sp                              ; $5138: $08 $04 $00
    call GetEntityTransitionCountdown             ; $513B: $CD $05 $0C
    jr   nz, jr_006_5145                          ; $513E: $20 $05

    call IncrementEntityWalkingAttr               ; $5140: $CD $12 $3B
    ld   [hl], b                                  ; $5143: $70
    ret                                           ; $5144: $C9

jr_006_5145:
    cp   $20                                      ; $5145: $FE $20
    jr   nz, jr_006_5179                          ; $5147: $20 $30

    ld   a, $20                                   ; $5149: $3E $20
    ldh  [hLinkPositionYIncrement], a             ; $514B: $E0 $9B
    ldh  a, [hLinkPositionX]                      ; $514D: $F0 $98
    cp   $50                                      ; $514F: $FE $50
    ld   a, $E0                                   ; $5151: $3E $E0
    jr   nc, jr_006_5157                          ; $5153: $30 $02

    ld   a, $20                                   ; $5155: $3E $20

jr_006_5157:
    ldh  [hLinkPositionXIncrement], a             ; $5157: $E0 $9A
    ld   a, $10                                   ; $5159: $3E $10
    ldh  [$FFA3], a                               ; $515B: $E0 $A3
    ld   a, $02                                   ; $515D: $3E $02
    ld   [$C146], a                               ; $515F: $EA $46 $C1
    ld   a, $08                                   ; $5162: $3E $08
    ldh  [hJingle], a                             ; $5164: $E0 $F2
    ld   a, $08                                   ; $5166: $3E $08
    ld   [wDB94], a                               ; $5168: $EA $94 $DB
    ldh  a, [wActiveEntityPosX]                   ; $516B: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $516D: $E0 $98
    ldh  a, [$FFEF]                               ; $516F: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $5171: $E0 $99
    call IsEntityUnknownFZero                     ; $5173: $CD $00 $0C
    ld   [hl], $50                                ; $5176: $36 $50
    ret                                           ; $5178: $C9

jr_006_5179:
    rra                                           ; $5179: $1F
    rra                                           ; $517A: $1F
    rra                                           ; $517B: $1F
    and  $0F                                      ; $517C: $E6 $0F
    ld   e, a                                     ; $517E: $5F
    ld   d, b                                     ; $517F: $50
    ld   hl, $5119                                ; $5180: $21 $19 $51
    add  hl, de                                   ; $5183: $19
    ld   a, [hl]                                  ; $5184: $7E
    call SetEntitySpriteVariant                   ; $5185: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5188: $CD $05 $0C
    cp   $20                                      ; $518B: $FE $20
    jr   c, jr_006_51BB                           ; $518D: $38 $2C

    sub  $20                                      ; $518F: $D6 $20
    rra                                           ; $5191: $1F
    rra                                           ; $5192: $1F
    and  $0F                                      ; $5193: $E6 $0F
    ld   e, a                                     ; $5195: $5F
    ld   d, b                                     ; $5196: $50
    ld   hl, $5123                                ; $5197: $21 $23 $51
    add  hl, de                                   ; $519A: $19
    ldh  a, [wActiveEntityPosX]                   ; $519B: $F0 $EE
    add  [hl]                                     ; $519D: $86
    ldh  [hLinkPositionX], a                      ; $519E: $E0 $98
    ld   hl, $512F                                ; $51A0: $21 $2F $51
    add  hl, de                                   ; $51A3: $19
    ld   a, [hl]                                  ; $51A4: $7E
    ldh  [$FFA2], a                               ; $51A5: $E0 $A2
    ld   a, $02                                   ; $51A7: $3E $02
    ld   [$C146], a                               ; $51A9: $EA $46 $C1
    ldh  a, [$FFEF]                               ; $51AC: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $51AE: $E0 $99

func_006_51B0:
    ld   a, $01                                   ; $51B0: $3E $01
    ldh  [$FFA1], a                               ; $51B2: $E0 $A1
    ld   a, $6A                                   ; $51B4: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $51B6: $E0 $9D
    ld   [wC167], a                               ; $51B8: $EA $67 $C1

jr_006_51BB:
    ret                                           ; $51BB: $C9

    call label_3B39                               ; $51BC: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $51BF: $CD $05 $0C
    jr   nz, jr_006_51C9                          ; $51C2: $20 $05

    call IncrementEntityWalkingAttr               ; $51C4: $CD $12 $3B
    ld   [hl], b                                  ; $51C7: $70
    ret                                           ; $51C8: $C9

jr_006_51C9:
    ld   e, $00                                   ; $51C9: $1E $00
    cp   $10                                      ; $51CB: $FE $10
    jr   c, jr_006_51D0                           ; $51CD: $38 $01

    inc  e                                        ; $51CF: $1C

jr_006_51D0:
    cp   $10                                      ; $51D0: $FE $10
    jr   nz, jr_006_51F6                          ; $51D2: $20 $22

    ld   a, $02                                   ; $51D4: $3E $02
    call func_003_64CA_trampoline                               ; $51D6: $CD $86 $3B
    jr   c, jr_006_51F6                           ; $51D9: $38 $1B

    ldh  a, [hScratch0]                           ; $51DB: $F0 $D7
    sub  $0C                                      ; $51DD: $D6 $0C
    ld   hl, wEntitiesPosXTable                         ; $51DF: $21 $00 $C2
    add  hl, de                                   ; $51E2: $19
    ld   [hl], a                                  ; $51E3: $77
    ldh  a, [hScratch1]                           ; $51E4: $F0 $D8
    sub  $00                                      ; $51E6: $D6 $00
    ld   hl, wEntitiesPosYTable                         ; $51E8: $21 $10 $C2
    add  hl, de                                   ; $51EB: $19
    ld   [hl], a                                  ; $51EC: $77
    ld   hl, wEntitiesPosZTable                   ; $51ED: $21 $10 $C3
    add  hl, de                                   ; $51F0: $19
    ld   [hl], $10                                ; $51F1: $36 $10
    jp   label_006_41F8                           ; $51F3: $C3 $F8 $41

jr_006_51F6:
    ld   a, e                                     ; $51F6: $7B
    jp   SetEntitySpriteVariant                   ; $51F7: $C3 $0C $3B

    db   $F4                                      ; $51FA: $F4
    ld   hl, sp+$60                               ; $51FB: $F8 $60
    ld   bc, $00F4                                ; $51FD: $01 $F4 $00
    ld   h, d                                     ; $5200: $62
    ld   bc, $08F4                                ; $5201: $01 $F4 $08
    ld   h, h                                     ; $5204: $64
    ld   bc, $10F4                                ; $5205: $01 $F4 $10
    ld   h, [hl]                                  ; $5208: $66
    ld   bc, $F804                                ; $5209: $01 $04 $F8
    ld   l, b                                     ; $520C: $68
    ld   bc, $0004                                ; $520D: $01 $04 $00
    ld   l, d                                     ; $5210: $6A
    ld   bc, $0804                                ; $5211: $01 $04 $08
    ld   l, h                                     ; $5214: $6C
    ld   bc, $1004                                ; $5215: $01 $04 $10
    ld   l, [hl]                                  ; $5218: $6E
    ld   bc, $F8F4                                ; $5219: $01 $F4 $F8
    ld   h, [hl]                                  ; $521C: $66
    ld   hl, $00F4                                ; $521D: $21 $F4 $00
    ld   h, h                                     ; $5220: $64
    ld   hl, $08F4                                ; $5221: $21 $F4 $08
    ld   h, d                                     ; $5224: $62
    ld   hl, $10F4                                ; $5225: $21 $F4 $10
    ld   h, b                                     ; $5228: $60
    ld   hl, $F804                                ; $5229: $21 $04 $F8
    ld   l, [hl]                                  ; $522C: $6E
    ld   hl, $0004                                ; $522D: $21 $04 $00
    ld   l, h                                     ; $5230: $6C
    ld   hl, $0804                                ; $5231: $21 $04 $08
    ld   l, d                                     ; $5234: $6A
    ld   hl, $1004                                ; $5235: $21 $04 $10
    ld   l, b                                     ; $5238: $68
    ld   hl, $F8F4                                ; $5239: $21 $F4 $F8
    ld   h, b                                     ; $523C: $60
    ld   [bc], a                                  ; $523D: $02
    db   $F4                                      ; $523E: $F4
    nop                                           ; $523F: $00
    ld   h, d                                     ; $5240: $62
    ld   [bc], a                                  ; $5241: $02
    db   $F4                                      ; $5242: $F4
    ld   [RenderLoop.RenderLoop_TransitionSfx], sp; $5243: $08 $64 $02
    db   $F4                                      ; $5246: $F4
    db   $10                                      ; $5247: $10
    ld   h, [hl]                                  ; $5248: $66
    ld   [bc], a                                  ; $5249: $02
    inc  b                                        ; $524A: $04
    ld   hl, sp+$68                               ; $524B: $F8 $68
    ld   [bc], a                                  ; $524D: $02
    inc  b                                        ; $524E: $04
    nop                                           ; $524F: $00
    ld   l, d                                     ; $5250: $6A
    ld   [bc], a                                  ; $5251: $02
    inc  b                                        ; $5252: $04
    ld   [$026C], sp                              ; $5253: $08 $6C $02
    inc  b                                        ; $5256: $04
    db   $10                                      ; $5257: $10
    ld   l, [hl]                                  ; $5258: $6E
    ld   [bc], a                                  ; $5259: $02
    db   $F4                                      ; $525A: $F4
    ld   hl, sp+$66                               ; $525B: $F8 $66
    ld   [hl+], a                                 ; $525D: $22
    db   $F4                                      ; $525E: $F4
    nop                                           ; $525F: $00
    ld   h, h                                     ; $5260: $64
    ld   [hl+], a                                 ; $5261: $22
    db   $F4                                      ; $5262: $F4
    ld   [DoUpdateBGRegion.ramSwitchEnd], sp      ; $5263: $08 $62 $22
    db   $F4                                      ; $5266: $F4
    db   $10                                      ; $5267: $10
    ld   h, b                                     ; $5268: $60
    ld   [hl+], a                                 ; $5269: $22
    inc  b                                        ; $526A: $04
    ld   hl, sp+$6E                               ; $526B: $F8 $6E
    ld   [hl+], a                                 ; $526D: $22
    inc  b                                        ; $526E: $04
    nop                                           ; $526F: $00
    ld   l, h                                     ; $5270: $6C
    ld   [hl+], a                                 ; $5271: $22
    inc  b                                        ; $5272: $04
    ld   [$226A], sp                              ; $5273: $08 $6A $22
    inc  b                                        ; $5276: $04
    db   $10                                      ; $5277: $10
    ld   l, b                                     ; $5278: $68
    ld   [hl+], a                                 ; $5279: $22
    db   $F4                                      ; $527A: $F4
    ld   hl, sp+$60                               ; $527B: $F8 $60
    inc  bc                                       ; $527D: $03
    db   $F4                                      ; $527E: $F4
    nop                                           ; $527F: $00
    ld   h, d                                     ; $5280: $62
    inc  bc                                       ; $5281: $03
    db   $F4                                      ; $5282: $F4
    ld   [$0364], sp                              ; $5283: $08 $64 $03
    db   $F4                                      ; $5286: $F4
    db   $10                                      ; $5287: $10
    ld   h, [hl]                                  ; $5288: $66
    inc  bc                                       ; $5289: $03
    inc  b                                        ; $528A: $04
    ld   hl, sp+$68                               ; $528B: $F8 $68
    inc  bc                                       ; $528D: $03
    inc  b                                        ; $528E: $04
    nop                                           ; $528F: $00
    ld   l, d                                     ; $5290: $6A
    inc  bc                                       ; $5291: $03
    inc  b                                        ; $5292: $04
    ld   [$036C], sp                              ; $5293: $08 $6C $03
    inc  b                                        ; $5296: $04
    db   $10                                      ; $5297: $10
    ld   l, [hl]                                  ; $5298: $6E
    inc  bc                                       ; $5299: $03
    db   $F4                                      ; $529A: $F4
    ld   hl, sp+$66                               ; $529B: $F8 $66
    inc  hl                                       ; $529D: $23
    db   $F4                                      ; $529E: $F4
    nop                                           ; $529F: $00
    ld   h, h                                     ; $52A0: $64
    inc  hl                                       ; $52A1: $23
    db   $F4                                      ; $52A2: $F4
    ld   [$2362], sp                              ; $52A3: $08 $62 $23
    db   $F4                                      ; $52A6: $F4
    db   $10                                      ; $52A7: $10
    ld   h, b                                     ; $52A8: $60
    inc  hl                                       ; $52A9: $23
    inc  b                                        ; $52AA: $04
    ld   hl, sp+$6E                               ; $52AB: $F8 $6E
    inc  hl                                       ; $52AD: $23
    inc  b                                        ; $52AE: $04
    nop                                           ; $52AF: $00
    ld   l, h                                     ; $52B0: $6C
    inc  hl                                       ; $52B1: $23
    inc  b                                        ; $52B2: $04
    ld   [$236A], sp                              ; $52B3: $08 $6A $23
    inc  b                                        ; $52B6: $04
    db   $10                                      ; $52B7: $10
    ld   l, b                                     ; $52B8: $68
    inc  hl                                       ; $52B9: $23

func_006_52BA:
    ldh  a, [hActiveEntitySpriteVariant]               ; $52BA: $F0 $F1
    rla                                           ; $52BC: $17
    rla                                           ; $52BD: $17
    rla                                           ; $52BE: $17
    rla                                           ; $52BF: $17
    rla                                           ; $52C0: $17
    and  $E0                                      ; $52C1: $E6 $E0
    ld   e, a                                     ; $52C3: $5F
    ld   d, b                                     ; $52C4: $50
    ld   hl, $527A                                ; $52C5: $21 $7A $52
    ldh  a, [hMapId]                              ; $52C8: $F0 $F7
    cp   $07                                      ; $52CA: $FE $07
    jr   z, jr_006_52D8                           ; $52CC: $28 $0A

    ld   hl, $523A                                ; $52CE: $21 $3A $52
    cp   $06                                      ; $52D1: $FE $06
    jr   z, jr_006_52D8                           ; $52D3: $28 $03

    ld   hl, $51FA                                ; $52D5: $21 $FA $51

jr_006_52D8:
    add  hl, de                                   ; $52D8: $19
    ld   c, $08                                   ; $52D9: $0E $08
    jp   label_3CE6                               ; $52DB: $C3 $E6 $3C

    ld   hl, $C460                                ; $52DE: $21 $60 $C4
    add  hl, bc                                   ; $52E1: $09
    ld   [hl], $FF                                ; $52E2: $36 $FF
    ld   hl, $C4E0                                ; $52E4: $21 $E0 $C4
    add  hl, bc                                   ; $52E7: $09
    ld   [hl], $30                                ; $52E8: $36 $30
    ld   hl, wEntitiesHealthTable                 ; $52EA: $21 $60 $C3
    add  hl, bc                                   ; $52ED: $09
    ld   a, [hl]                                  ; $52EE: $7E
    cp   $08                                      ; $52EF: $FE $08
    jr   nc, jr_006_52FF                          ; $52F1: $30 $0C

    ld   e, $02                                   ; $52F3: $1E $02
    cp   $04                                      ; $52F5: $FE $04
    jr   nc, jr_006_52FB                          ; $52F7: $30 $02

    ld   e, $03                                   ; $52F9: $1E $03

jr_006_52FB:
    ld   a, e                                     ; $52FB: $7B
    call SetEntitySpriteVariant                   ; $52FC: $CD $0C $3B

jr_006_52FF:
    call func_006_55B3                            ; $52FF: $CD $B3 $55
    ldh  a, [hActiveEntityStatus]                 ; $5302: $F0 $EA
    cp   $05                                      ; $5304: $FE $05
    jr   z, jr_006_5361                           ; $5306: $28 $59

label_006_5308:
    ld   hl, wEntitiesUnknownTableC               ; $5308: $21 $C0 $C2
    add  hl, bc                                   ; $530B: $09
    ld   a, [hl]                                  ; $530C: $7E
    rst  $00                                      ; $530D: $C7
    ld   d, $53                                   ; $530E: $16 $53
    inc  h                                        ; $5310: $24
    ld   d, e                                     ; $5311: $53
    inc  sp                                       ; $5312: $33
    ld   d, e                                     ; $5313: $53
    ld   h, b                                     ; $5314: $60
    ld   d, e                                     ; $5315: $53
    call GetEntityTransitionCountdown             ; $5316: $CD $05 $0C
    ld   [hl], $A0                                ; $5319: $36 $A0
    ld   hl, $C420                                ; $531B: $21 $20 $C4
    add  hl, bc                                   ; $531E: $09
    ld   [hl], $FF                                ; $531F: $36 $FF
    jp   label_006_5634                           ; $5321: $C3 $34 $56

    call GetEntityTransitionCountdown             ; $5324: $CD $05 $0C
    ret  nz                                       ; $5327: $C0

    ld   [hl], $C0                                ; $5328: $36 $C0
    ld   hl, $C420                                ; $532A: $21 $20 $C4
    add  hl, bc                                   ; $532D: $09
    ld   [hl], $FF                                ; $532E: $36 $FF
    jp   label_006_5634                           ; $5330: $C3 $34 $56

    call GetEntityTransitionCountdown             ; $5333: $CD $05 $0C
    jr   nz, jr_006_535D                          ; $5336: $20 $25

    ld   a, $1A                                   ; $5338: $3E $1A
    ldh  [hNoiseSfx], a                           ; $533A: $E0 $F4
    call label_27DD                               ; $533C: $CD $DD $27
    call label_3F50                               ; $533F: $CD $50 $3F
    ldh  a, [hActiveEntityType]                   ; $5342: $F0 $EB
    cp   $88                                      ; $5344: $FE $88
    ret  z                                        ; $5346: $C8

    ldh  a, [hActiveEntityType]                   ; $5347: $F0 $EB
    cp   $89                                      ; $5349: $FE $89
    jr   z, jr_006_5355                           ; $534B: $28 $08

    cp   $8E                                      ; $534D: $FE $8E
    jr   z, jr_006_5355                           ; $534F: $28 $04

    cp   $92                                      ; $5351: $FE $92
    jr   nz, jr_006_535A                          ; $5353: $20 $05

jr_006_5355:
    ldh  a, [hMapId]                              ; $5355: $F0 $F7
    cp   $06                                      ; $5357: $FE $06
    ret  nc                                       ; $5359: $D0

jr_006_535A:
    jp   label_006_6CC9                           ; $535A: $C3 $C9 $6C

jr_006_535D:
    jp   label_006_700A                           ; $535D: $C3 $0A $70

    ret                                           ; $5360: $C9

jr_006_5361:
    call func_006_64C6                            ; $5361: $CD $C6 $64
    call label_3EE8                               ; $5364: $CD $E8 $3E
    call label_3B70                               ; $5367: $CD $70 $3B
    call func_006_641A                            ; $536A: $CD $1A $64
    call func_006_657A                            ; $536D: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5370: $21 $20 $C3
    add  hl, bc                                   ; $5373: $09
    dec  [hl]                                     ; $5374: $35
    dec  [hl]                                     ; $5375: $35
    ld   hl, wEntitiesPosZTable                   ; $5376: $21 $10 $C3
    add  hl, bc                                   ; $5379: $09
    ld   a, [hl]                                  ; $537A: $7E
    and  $80                                      ; $537B: $E6 $80
    ldh  [hFFE8], a                               ; $537D: $E0 $E8
    jr   z, jr_006_5387                           ; $537F: $28 $06

    ld   [hl], b                                  ; $5381: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5382: $21 $20 $C3
    add  hl, bc                                   ; $5385: $09
    ld   [hl], b                                  ; $5386: $70

jr_006_5387:
    call IsEntityUnknownFZero                     ; $5387: $CD $00 $0C
    jr   z, jr_006_5394                           ; $538A: $28 $08

    ld   a, $02                                   ; $538C: $3E $02
    ldh  [$FFA1], a                               ; $538E: $E0 $A1
    ld   a, $6A                                   ; $5390: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $5392: $E0 $9D

jr_006_5394:
    ld   hl, wEntitiesHealthTable                 ; $5394: $21 $60 $C3
    add  hl, bc                                   ; $5397: $09
    ld   a, [hl]                                  ; $5398: $7E
    ld   hl, wEntitiesUnknownTableB               ; $5399: $21 $B0 $C2
    add  hl, bc                                   ; $539C: $09
    cp   [hl]                                     ; $539D: $BE
    ld   [hl], a                                  ; $539E: $77
    jp   z, label_006_5411                        ; $539F: $CA $11 $54

    cp   $08                                      ; $53A2: $FE $08
    jr   nc, jr_006_5411                          ; $53A4: $30 $6B

    cp   $04                                      ; $53A6: $FE $04
    jr   nc, jr_006_53D3                          ; $53A8: $30 $29

    ld   hl, $C3D0                                ; $53AA: $21 $D0 $C3
    add  hl, bc                                   ; $53AD: $09
    ld   a, [hl]                                  ; $53AE: $7E
    cp   $02                                      ; $53AF: $FE $02
    jr   nc, jr_006_5411                          ; $53B1: $30 $5E

    inc  [hl]                                     ; $53B3: $34
    ld   a, $05                                   ; $53B4: $3E $05
    call func_003_64CA_trampoline                               ; $53B6: $CD $86 $3B
    jr   c, jr_006_5411                           ; $53B9: $38 $56

    ldh  a, [hScratch0]                           ; $53BB: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $53BD: $21 $00 $C2
    add  hl, de                                   ; $53C0: $19
    dec  a                                        ; $53C1: $3D
    ld   [hl], a                                  ; $53C2: $77
    ldh  [hScratch0], a                           ; $53C3: $E0 $D7
    ldh  a, [hScratch1]                           ; $53C5: $F0 $D8
    ld   hl, hScratch3                            ; $53C7: $21 $DA $FF
    sub  [hl]                                     ; $53CA: $96
    ld   hl, wEntitiesPosYTable                         ; $53CB: $21 $10 $C2
    add  hl, de                                   ; $53CE: $19
    sub  $10                                      ; $53CF: $D6 $10
    jr   jr_006_53F9                              ; $53D1: $18 $26

jr_006_53D3:
    ld   hl, $C3D0                                ; $53D3: $21 $D0 $C3
    add  hl, bc                                   ; $53D6: $09
    ld   a, [hl]                                  ; $53D7: $7E
    cp   $01                                      ; $53D8: $FE $01
    jr   nc, jr_006_5411                          ; $53DA: $30 $35

    inc  [hl]                                     ; $53DC: $34
    ld   a, $05                                   ; $53DD: $3E $05
    call func_003_64CA_trampoline                               ; $53DF: $CD $86 $3B
    jr   c, jr_006_5411                           ; $53E2: $38 $2D

    ldh  a, [hScratch0]                           ; $53E4: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $53E6: $21 $00 $C2
    add  hl, de                                   ; $53E9: $19
    add  $07                                      ; $53EA: $C6 $07
    ld   [hl], a                                  ; $53EC: $77
    ldh  [hScratch0], a                           ; $53ED: $E0 $D7
    ldh  a, [hScratch1]                           ; $53EF: $F0 $D8
    ld   hl, hScratch3                            ; $53F1: $21 $DA $FF
    sub  [hl]                                     ; $53F4: $96
    ld   hl, wEntitiesPosYTable                         ; $53F5: $21 $10 $C2
    add  hl, de                                   ; $53F8: $19

jr_006_53F9:
    ld   [hl], a                                  ; $53F9: $77
    ldh  [hScratch1], a                           ; $53FA: $E0 $D8
    ld   hl, wEntitiesUnknowTableF                ; $53FC: $21 $F0 $C2
    add  hl, de                                   ; $53FF: $19
    ld   [hl], $0F                                ; $5400: $36 $0F
    ld   hl, $C340                                ; $5402: $21 $40 $C3
    add  hl, de                                   ; $5405: $19
    ld   [hl], $C4                                ; $5406: $36 $C4
    ld   a, $02                                   ; $5408: $3E $02
    call label_CC7                                ; $540A: $CD $C7 $0C
    ld   a, $29                                   ; $540D: $3E $29
    ldh  [hNoiseSfx], a                           ; $540F: $E0 $F4

label_006_5411:
jr_006_5411:
    ldh  a, [hActiveEntityState]                  ; $5411: $F0 $F0
    rst  $00                                      ; $5413: $C7
    inc  h                                        ; $5414: $24
    ld   d, h                                     ; $5415: $54
    ld   b, d                                     ; $5416: $42
    ld   d, h                                     ; $5417: $54
    ld   d, [hl]                                  ; $5418: $56
    ld   d, h                                     ; $5419: $54
    add  [hl]                                     ; $541A: $86
    ld   d, h                                     ; $541B: $54
    cp   [hl]                                     ; $541C: $BE
    ld   d, h                                     ; $541D: $54
    ret  c                                        ; $541E: $D8

    ld   d, h                                     ; $541F: $54
    db   $ED                                      ; $5420: $ED
    ld   d, h                                     ; $5421: $54
    dec  d                                        ; $5422: $15
    ld   d, l                                     ; $5423: $55
    call label_C56                                ; $5424: $CD $56 $0C
    call func_006_6594                            ; $5427: $CD $94 $65
    add  $20                                      ; $542A: $C6 $20
    cp   $40                                      ; $542C: $FE $40
    jr   nc, jr_006_5441                          ; $542E: $30 $11

    call func_006_65A4                            ; $5430: $CD $A4 $65
    add  $20                                      ; $5433: $C6 $20
    cp   $40                                      ; $5435: $FE $40
    jr   nc, jr_006_5441                          ; $5437: $30 $08

    call IncrementEntityWalkingAttr               ; $5439: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $543C: $CD $05 $0C
    ld   [hl], $30                                ; $543F: $36 $30

jr_006_5441:
    ret                                           ; $5441: $C9

    call label_C56                                ; $5442: $CD $56 $0C
    call GetEntityTransitionCountdown             ; $5445: $CD $05 $0C
    jr   nz, jr_006_544F                          ; $5448: $20 $05

    ld   [hl], $80                                ; $544A: $36 $80
    call IncrementEntityWalkingAttr               ; $544C: $CD $12 $3B

jr_006_544F:
    rra                                           ; $544F: $1F
    rra                                           ; $5450: $1F
    and  $01                                      ; $5451: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5453: $C3 $0C $3B

    call label_C56                                ; $5456: $CD $56 $0C
    call GetEntityTransitionCountdown             ; $5459: $CD $05 $0C
    jr   nz, jr_006_5476                          ; $545C: $20 $18

    ld   [hl], $50                                ; $545E: $36 $50
    call IncrementEntityWalkingAttr               ; $5460: $CD $12 $3B
    ld   hl, $C340                                ; $5463: $21 $40 $C3
    add  hl, bc                                   ; $5466: $09
    res  7, [hl]                                  ; $5467: $CB $BE
    ld   hl, $C350                                ; $5469: $21 $50 $C3
    add  hl, bc                                   ; $546C: $09
    res  7, [hl]                                  ; $546D: $CB $BE
    ld   hl, $C430                                ; $546F: $21 $30 $C4
    add  hl, bc                                   ; $5472: $09
    res  6, [hl]                                  ; $5473: $CB $B6
    ret                                           ; $5475: $C9

jr_006_5476:
    ld   e, $08                                   ; $5476: $1E $08
    and  $04                                      ; $5478: $E6 $04
    jr   z, jr_006_547E                           ; $547A: $28 $02

    ld   e, $F8                                   ; $547C: $1E $F8

jr_006_547E:
    ld   hl, wEntitiesSpeedXTable                       ; $547E: $21 $40 $C2
    add  hl, bc                                   ; $5481: $09
    ld   [hl], e                                  ; $5482: $73
    jp   label_006_654E                           ; $5483: $C3 $4E $65

    call func_006_64F7                            ; $5486: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $5489: $CD $05 $0C
    jr   nz, jr_006_549C                          ; $548C: $20 $0E

    ld   hl, wEntitiesSpeedZTable                 ; $548E: $21 $20 $C3
    add  hl, bc                                   ; $5491: $09
    ld   [hl], $30                                ; $5492: $36 $30
    call IncrementEntityWalkingAttr               ; $5494: $CD $12 $3B
    ld   a, $24                                   ; $5497: $3E $24
    ldh  [hJingle], a                             ; $5499: $E0 $F2
    ret                                           ; $549B: $C9

jr_006_549C:
    ldh  a, [hFFE8]                               ; $549C: $F0 $E8
    and  a                                        ; $549E: $A7
    jr   z, jr_006_54BB                           ; $549F: $28 $1A

    ld   hl, wEntitiesSpeedZTable                 ; $54A1: $21 $20 $C3
    add  hl, bc                                   ; $54A4: $09
    ld   [hl], $0C                                ; $54A5: $36 $0C
    ld   hl, wEntitiesHealthTable                 ; $54A7: $21 $60 $C3
    add  hl, bc                                   ; $54AA: $09
    ld   a, [hl]                                  ; $54AB: $7E
    cp   $05                                      ; $54AC: $FE $05
    ld   a, $08                                   ; $54AE: $3E $08
    jr   nc, jr_006_54B4                          ; $54B0: $30 $02

    ld   a, $0C                                   ; $54B2: $3E $0C

jr_006_54B4:
    call label_3BAA                               ; $54B4: $CD $AA $3B
    ld   a, $20                                   ; $54B7: $3E $20
    ldh  [hJingle], a                             ; $54B9: $E0 $F2

jr_006_54BB:
    jp   label_006_6541                           ; $54BB: $C3 $41 $65

    call func_006_64F7                            ; $54BE: $CD $F7 $64
    ld   hl, wEntitiesSpeedZTable                 ; $54C1: $21 $20 $C3
    add  hl, bc                                   ; $54C4: $09
    ld   a, [hl]                                  ; $54C5: $7E
    and  $FE                                      ; $54C6: $E6 $FE
    jr   nz, jr_006_54D5                          ; $54C8: $20 $0B

    call GetEntityTransitionCountdown             ; $54CA: $CD $05 $0C
    ld   [hl], $10                                ; $54CD: $36 $10
    call label_3D7F                               ; $54CF: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $54D2: $CD $12 $3B

jr_006_54D5:
    jp   label_006_6541                           ; $54D5: $C3 $41 $65

    call func_006_64F7                            ; $54D8: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $54DB: $CD $05 $0C
    ld   a, $00                                   ; $54DE: $3E $00
    jr   nz, jr_006_54E7                          ; $54E0: $20 $05

    call IncrementEntityWalkingAttr               ; $54E2: $CD $12 $3B
    ld   a, $B0                                   ; $54E5: $3E $B0

jr_006_54E7:
    ld   hl, wEntitiesSpeedZTable                 ; $54E7: $21 $20 $C3
    add  hl, bc                                   ; $54EA: $09
    ld   [hl], a                                  ; $54EB: $77
    ret                                           ; $54EC: $C9

    call func_006_64F7                            ; $54ED: $CD $F7 $64
    ldh  a, [hFFE8]                               ; $54F0: $F0 $E8
    and  a                                        ; $54F2: $A7
    ret  z                                        ; $54F3: $C8

    ld   a, $30                                   ; $54F4: $3E $30
    ld   [$C157], a                               ; $54F6: $EA $57 $C1
    ld   a, $04                                   ; $54F9: $3E $04
    ld   [$C158], a                               ; $54FB: $EA $58 $C1
    ld   a, $0B                                   ; $54FE: $3E $0B
    ldh  [hJingle], a                             ; $5500: $E0 $F2
    call GetEntityTransitionCountdown             ; $5502: $CD $05 $0C
    ld   [hl], $30                                ; $5505: $36 $30
    ld   a, [$C146]                               ; $5507: $FA $46 $C1
    and  a                                        ; $550A: $A7
    jr   nz, jr_006_5512                          ; $550B: $20 $05

    call IsEntityUnknownFZero                     ; $550D: $CD $00 $0C
    ld   [hl], $40                                ; $5510: $36 $40

jr_006_5512:
    jp   IncrementEntityWalkingAttr               ; $5512: $C3 $12 $3B

    call func_006_64F7                            ; $5515: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $5518: $CD $05 $0C
    jr   nz, jr_006_5522                          ; $551B: $20 $05

    call IncrementEntityWalkingAttr               ; $551D: $CD $12 $3B
    ld   [hl], $02                                ; $5520: $36 $02

jr_006_5522:
    ret                                           ; $5522: $C9

    db   $F4                                      ; $5523: $F4
    ld   hl, sp+$70                               ; $5524: $F8 $70
    inc  bc                                       ; $5526: $03
    db   $F4                                      ; $5527: $F4
    nop                                           ; $5528: $00
    ld   [hl], d                                  ; $5529: $72
    inc  bc                                       ; $552A: $03
    db   $F4                                      ; $552B: $F4
    ld   [$2372], sp                              ; $552C: $08 $72 $23
    db   $F4                                      ; $552F: $F4
    db   $10                                      ; $5530: $10
    ld   [hl], b                                  ; $5531: $70
    inc  hl                                       ; $5532: $23
    inc  b                                        ; $5533: $04
    ld   hl, sp+$74                               ; $5534: $F8 $74
    inc  bc                                       ; $5536: $03
    inc  b                                        ; $5537: $04
    nop                                           ; $5538: $00
    db   $76                                      ; $5539: $76
    inc  bc                                       ; $553A: $03
    inc  b                                        ; $553B: $04
    ld   [$037A], sp                              ; $553C: $08 $7A $03
    inc  b                                        ; $553F: $04
    db   $10                                      ; $5540: $10
    ld   a, d                                     ; $5541: $7A
    inc  hl                                       ; $5542: $23
    db   $F4                                      ; $5543: $F4
    ld   hl, sp+$70                               ; $5544: $F8 $70
    ld   [bc], a                                  ; $5546: $02
    db   $F4                                      ; $5547: $F4
    nop                                           ; $5548: $00
    ld   a, b                                     ; $5549: $78
    ld   [bc], a                                  ; $554A: $02
    db   $F4                                      ; $554B: $F4
    ld   [$2278], sp                              ; $554C: $08 $78 $22
    db   $F4                                      ; $554F: $F4
    db   $10                                      ; $5550: $10
    ld   [hl], b                                  ; $5551: $70
    ld   [hl+], a                                 ; $5552: $22
    inc  b                                        ; $5553: $04
    ld   hl, sp+$74                               ; $5554: $F8 $74
    ld   [bc], a                                  ; $5556: $02
    inc  b                                        ; $5557: $04
    nop                                           ; $5558: $00
    db   $76                                      ; $5559: $76
    ld   [bc], a                                  ; $555A: $02
    inc  b                                        ; $555B: $04
    ld   [$027A], sp                              ; $555C: $08 $7A $02
    inc  b                                        ; $555F: $04
    db   $10                                      ; $5560: $10
    ld   a, d                                     ; $5561: $7A
    ld   [hl+], a                                 ; $5562: $22
    db   $F4                                      ; $5563: $F4
    ld   hl, sp+$70                               ; $5564: $F8 $70
    ld   [bc], a                                  ; $5566: $02
    db   $F4                                      ; $5567: $F4
    nop                                           ; $5568: $00
    ld   [hl], d                                  ; $5569: $72
    ld   [bc], a                                  ; $556A: $02
    db   $F4                                      ; $556B: $F4
    ld   [$2272], sp                              ; $556C: $08 $72 $22
    db   $F4                                      ; $556F: $F4
    db   $10                                      ; $5570: $10
    ld   [hl], b                                  ; $5571: $70
    ld   [hl+], a                                 ; $5572: $22
    inc  b                                        ; $5573: $04
    ld   hl, sp+$74                               ; $5574: $F8 $74
    ld   [bc], a                                  ; $5576: $02
    inc  b                                        ; $5577: $04
    nop                                           ; $5578: $00
    db   $76                                      ; $5579: $76
    ld   [bc], a                                  ; $557A: $02
    inc  b                                        ; $557B: $04
    ld   [$2276], sp                              ; $557C: $08 $76 $22
    inc  b                                        ; $557F: $04
    db   $10                                      ; $5580: $10
    ld   [hl], h                                  ; $5581: $74
    ld   [hl+], a                                 ; $5582: $22
    db   $F4                                      ; $5583: $F4
    ld   hl, sp+$7C                               ; $5584: $F8 $7C
    ld   [bc], a                                  ; $5586: $02
    db   $F4                                      ; $5587: $F4
    nop                                           ; $5588: $00
    ld   a, [hl]                                  ; $5589: $7E
    ld   [bc], a                                  ; $558A: $02
    db   $F4                                      ; $558B: $F4
    ld   [$227E], sp                              ; $558C: $08 $7E $22
    db   $F4                                      ; $558F: $F4
    db   $10                                      ; $5590: $10
    ld   a, h                                     ; $5591: $7C
    ld   [hl+], a                                 ; $5592: $22
    inc  b                                        ; $5593: $04
    ld   hl, sp+$74                               ; $5594: $F8 $74
    ld   [bc], a                                  ; $5596: $02
    inc  b                                        ; $5597: $04
    nop                                           ; $5598: $00
    db   $76                                      ; $5599: $76
    ld   [bc], a                                  ; $559A: $02
    inc  b                                        ; $559B: $04
    ld   [$2276], sp                              ; $559C: $08 $76 $22
    inc  b                                        ; $559F: $04
    db   $10                                      ; $55A0: $10
    ld   [hl], h                                  ; $55A1: $74
    ld   [hl+], a                                 ; $55A2: $22
    inc  c                                        ; $55A3: $0C
    ei                                            ; $55A4: $FB
    ld   h, $00                                   ; $55A5: $26 $00
    inc  c                                        ; $55A7: $0C
    ld   bc, $0026                                ; $55A8: $01 $26 $00
    inc  c                                        ; $55AB: $0C
    rlca                                          ; $55AC: $07
    ld   h, $00                                   ; $55AD: $26 $00
    inc  c                                        ; $55AF: $0C
    dec  c                                        ; $55B0: $0D
    ld   h, $00                                   ; $55B1: $26 $00

func_006_55B3:
    ldh  a, [hActiveEntitySpriteVariant]               ; $55B3: $F0 $F1
    rla                                           ; $55B5: $17
    rla                                           ; $55B6: $17
    rla                                           ; $55B7: $17
    rla                                           ; $55B8: $17
    rla                                           ; $55B9: $17
    and  $E0                                      ; $55BA: $E6 $E0
    ld   e, a                                     ; $55BC: $5F
    ld   d, b                                     ; $55BD: $50
    ld   hl, $5523                                ; $55BE: $21 $23 $55
    add  hl, de                                   ; $55C1: $19
    ld   c, $08                                   ; $55C2: $0E $08
    call label_3CE6                               ; $55C4: $CD $E6 $3C
    ld   a, $04                                   ; $55C7: $3E $04
    call label_3DA0                               ; $55C9: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ; $55CC: $21 $10 $C3
    add  hl, bc                                   ; $55CF: $09
    ld   a, [hl]                                  ; $55D0: $7E
    and  a                                        ; $55D1: $A7
    jr   z, jr_006_55E0                           ; $55D2: $28 $0C

    ldh  a, [$FFEF]                               ; $55D4: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $55D6: $E0 $EC
    ld   hl, $55A3                                ; $55D8: $21 $A3 $55
    ld   c, $04                                   ; $55DB: $0E $04
    call label_3CE6                               ; $55DD: $CD $E6 $3C

jr_006_55E0:
    jp   label_3D8A                               ; $55E0: $C3 $8A $3D

    nop                                           ; $55E3: $00
    inc  b                                        ; $55E4: $04
    db   $FC                                      ; $55E5: $FC
    ld   [$21F8], sp                              ; $55E6: $08 $F8 $21
    ret  nc                                       ; $55E9: $D0

    jp   nz, label_006_7E09                       ; $55EA: $C2 $09 $7E

    cp   $02                                      ; $55ED: $FE $02
    jp   z, label_006_5988                        ; $55EF: $CA $88 $59

    cp   $00                                      ; $55F2: $FE $00
    jr   nz, jr_006_5611                          ; $55F4: $20 $1B

    inc  [hl]                                     ; $55F6: $34
    ld   a, $50                                   ; $55F7: $3E $50
    ldh  [hMusicTrack], a                         ; $55F9: $E0 $B0
    ld   hl, wEntitiesPosZTable                   ; $55FB: $21 $10 $C3
    add  hl, bc                                   ; $55FE: $09
    ld   [hl], $FF                                ; $55FF: $36 $FF
    call GetEntityTransitionCountdown             ; $5601: $CD $05 $0C
    ld   [hl], $50                                ; $5604: $36 $50
    ld   e, $00                                   ; $5606: $1E $00
    ld   a, $FF                                   ; $5608: $3E $FF
    ld   hl, $D200                                ; $560A: $21 $00 $D2

jr_006_560D:
    ld   [hl+], a                                 ; $560D: $22
    dec  e                                        ; $560E: $1D
    jr   nz, jr_006_560D                          ; $560F: $20 $FC

jr_006_5611:
    call func_006_58C9                            ; $5611: $CD $C9 $58
    ldh  a, [hActiveEntityStatus]                 ; $5614: $F0 $EA
    cp   $01                                      ; $5616: $FE $01
    jp   nz, label_006_56C8                       ; $5618: $C2 $C8 $56

    ld   hl, wEntitiesUnknownTableC               ; $561B: $21 $C0 $C2
    add  hl, bc                                   ; $561E: $09
    ld   a, [hl]                                  ; $561F: $7E
    rst  $00                                      ; $5620: $C7
    add  hl, hl                                   ; $5621: $29
    ld   d, [hl]                                  ; $5622: $56
    ld   a, [hl-]                                 ; $5623: $3A
    ld   d, [hl]                                  ; $5624: $56
    ld   c, e                                     ; $5625: $4B
    ld   d, [hl]                                  ; $5626: $56
    rst  $00                                      ; $5627: $C7
    ld   d, [hl]                                  ; $5628: $56
    ld   hl, $C420                                ; $5629: $21 $20 $C4
    add  hl, bc                                   ; $562C: $09
    ld   [hl], $FF                                ; $562D: $36 $FF
    call GetEntityTransitionCountdown             ; $562F: $CD $05 $0C
    ld   [hl], $60                                ; $5632: $36 $60

func_006_5634:
label_006_5634:
    ld   hl, wEntitiesUnknownTableC               ; $5634: $21 $C0 $C2
    add  hl, bc                                   ; $5637: $09
    inc  [hl]                                     ; $5638: $34
    ret                                           ; $5639: $C9

    call GetEntityTransitionCountdown             ; $563A: $CD $05 $0C
    jr   nz, jr_006_564A                          ; $563D: $20 $0B

    ld   [hl], $CF                                ; $563F: $36 $CF
    call func_006_5634                            ; $5641: $CD $34 $56
    ld   hl, $C440                                ; $5644: $21 $40 $C4
    add  hl, bc                                   ; $5647: $09
    ld   [hl], $05                                ; $5648: $36 $05

jr_006_564A:
    ret                                           ; $564A: $C9

    call GetEntityTransitionCountdown             ; $564B: $CD $05 $0C
    jr   nz, jr_006_568A                          ; $564E: $20 $3A

    call label_27DD                               ; $5650: $CD $DD $27
    ld   a, $30                                   ; $5653: $3E $30
    call func_003_64CA_trampoline                               ; $5655: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $5658: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $565A: $21 $00 $C2
    add  hl, de                                   ; $565D: $19
    ld   [hl], a                                  ; $565E: $77
    ldh  a, [hScratch1]                           ; $565F: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5661: $21 $10 $C2
    add  hl, de                                   ; $5664: $19
    ld   [hl], a                                  ; $5665: $77
    ldh  a, [hScratch3]                           ; $5666: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $5668: $21 $10 $C3
    add  hl, de                                   ; $566B: $19
    ld   [hl], a                                  ; $566C: $77
    ld   hl, wEntitiesSpriteVariantTable               ; $566D: $21 $B0 $C3
    add  hl, de                                   ; $5670: $19
    ld   [hl], $02                                ; $5671: $36 $02
    ld   hl, wEntitiesSpeedZTable                 ; $5673: $21 $20 $C3
    add  hl, de                                   ; $5676: $19
    ld   [hl], $10                                ; $5677: $36 $10
    ld   hl, wEntitiesUnknowTableF                ; $5679: $21 $F0 $C2
    add  hl, de                                   ; $567C: $19
    ld   [hl], $10                                ; $567D: $36 $10
    call func_006_65DB                            ; $567F: $CD $DB $65
    ldh  a, [wActiveEntityPosX]                   ; $5682: $F0 $EE
    ldh  [hScratch0], a                           ; $5684: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $5686: $F0 $EC
    jr   jr_006_56BB                              ; $5688: $18 $31

jr_006_568A:
    and  $1F                                      ; $568A: $E6 $1F
    jr   nz, jr_006_56C6                          ; $568C: $20 $38

    ld   hl, $C3D0                                ; $568E: $21 $D0 $C3
    add  hl, bc                                   ; $5691: $09
    ld   a, [hl]                                  ; $5692: $7E
    ld   hl, $C440                                ; $5693: $21 $40 $C4
    add  hl, bc                                   ; $5696: $09
    ld   e, [hl]                                  ; $5697: $5E
    dec  [hl]                                     ; $5698: $35
    ld   d, b                                     ; $5699: $50
    ld   hl, $58C3                                ; $569A: $21 $C3 $58
    add  hl, de                                   ; $569D: $19
    sub  [hl]                                     ; $569E: $96
    ld   e, a                                     ; $569F: $5F
    ld   d, b                                     ; $56A0: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $56A1: $21 $00 $D0
    add  hl, de                                   ; $56A4: $19
    ld   a, [hl]                                  ; $56A5: $7E
    ldh  [hScratch0], a                           ; $56A6: $E0 $D7
    ld   hl, $D200                                ; $56A8: $21 $00 $D2
    add  hl, de                                   ; $56AB: $19
    ld   a, [hl]                                  ; $56AC: $7E
    and  $80                                      ; $56AD: $E6 $80
    jr   nz, jr_006_56C6                          ; $56AF: $20 $15

    push hl                                       ; $56B1: $E5
    ld   hl, $D100                                ; $56B2: $21 $00 $D1
    add  hl, de                                   ; $56B5: $19
    ld   a, [hl]                                  ; $56B6: $7E
    pop  hl                                       ; $56B7: $E1
    sub  [hl]                                     ; $56B8: $96
    ld   [hl], $FF                                ; $56B9: $36 $FF

jr_006_56BB:
    ldh  [hScratch1], a                           ; $56BB: $E0 $D8
    ld   a, $02                                   ; $56BD: $3E $02
    call label_CC7                                ; $56BF: $CD $C7 $0C
    ld   a, $13                                   ; $56C2: $3E $13
    ldh  [hNoiseSfx], a                           ; $56C4: $E0 $F4

jr_006_56C6:
    ret                                           ; $56C6: $C9

    ret                                           ; $56C7: $C9

label_006_56C8:
    call func_006_64C6                            ; $56C8: $CD $C6 $64
    call label_3EE8                               ; $56CB: $CD $E8 $3E
    call IsEntityUnknownFZero                     ; $56CE: $CD $00 $0C
    jr   z, jr_006_5726                           ; $56D1: $28 $53

    and  $0F                                      ; $56D3: $E6 $0F
    jr   nz, jr_006_5726                          ; $56D5: $20 $4F

    ld   a, $02                                   ; $56D7: $3E $02

jr_006_56D9:
    ldh  [hFFE8], a                               ; $56D9: $E0 $E8
    ld   a, $87                                   ; $56DB: $3E $87
    call func_003_64CA_trampoline                               ; $56DD: $CD $86 $3B
    jr   c, jr_006_5726                           ; $56E0: $38 $44

    push bc                                       ; $56E2: $C5
    ldh  a, [hFFE8]                               ; $56E3: $F0 $E8
    ld   c, a                                     ; $56E5: $4F
    ld   hl, wEntitiesSpriteVariantTable               ; $56E6: $21 $B0 $C3
    add  hl, de                                   ; $56E9: $19
    and  $02                                      ; $56EA: $E6 $02
    ld   [hl], a                                  ; $56EC: $77
    ld   a, [$C1CD]                               ; $56ED: $FA $CD $C1
    ld   hl, $55E3                                ; $56F0: $21 $E3 $55
    add  hl, bc                                   ; $56F3: $09
    add  [hl]                                     ; $56F4: $86
    ld   hl, wEntitiesPosXTable                         ; $56F5: $21 $00 $C2
    add  hl, de                                   ; $56F8: $19
    ld   [hl], a                                  ; $56F9: $77
    ld   hl, $55E5                                ; $56FA: $21 $E5 $55
    add  hl, bc                                   ; $56FD: $09
    ld   a, [hl]                                  ; $56FE: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $56FF: $21 $40 $C2
    add  hl, de                                   ; $5702: $19
    ld   [hl], a                                  ; $5703: $77
    ld   a, [$C1CE]                               ; $5704: $FA $CE $C1
    add  $00                                      ; $5707: $C6 $00
    ld   hl, wEntitiesPosYTable                         ; $5709: $21 $10 $C2
    add  hl, de                                   ; $570C: $19
    ld   [hl], a                                  ; $570D: $77
    ld   hl, wEntitiesSpeedYTable                       ; $570E: $21 $50 $C2
    add  hl, de                                   ; $5711: $19
    ld   [hl], $F0                                ; $5712: $36 $F0
    ld   hl, wEntitiesUnknownTableD               ; $5714: $21 $D0 $C2
    add  hl, de                                   ; $5717: $19
    ld   [hl], $02                                ; $5718: $36 $02
    ld   hl, $C340                                ; $571A: $21 $40 $C3
    add  hl, de                                   ; $571D: $19
    ld   [hl], $C1                                ; $571E: $36 $C1
    pop  bc                                       ; $5720: $C1
    ldh  a, [hFFE8]                               ; $5721: $F0 $E8
    dec  a                                        ; $5723: $3D
    jr   nz, jr_006_56D9                          ; $5724: $20 $B3

jr_006_5726:
    call func_006_594C                            ; $5726: $CD $4C $59
    call label_C56                                ; $5729: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $572C: $F0 $F0
    cp   $02                                      ; $572E: $FE $02
    jr   c, jr_006_5754                           ; $5730: $38 $22

    ld   hl, $C3D0                                ; $5732: $21 $D0 $C3
    add  hl, bc                                   ; $5735: $09
    ld   a, [hl]                                  ; $5736: $7E
    inc  [hl]                                     ; $5737: $34
    and  $FF                                      ; $5738: $E6 $FF
    ld   e, a                                     ; $573A: $5F
    ld   d, b                                     ; $573B: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $573C: $21 $00 $D0
    add  hl, de                                   ; $573F: $19
    ldh  a, [wActiveEntityPosX]                   ; $5740: $F0 $EE
    ld   [hl], a                                  ; $5742: $77
    ld   hl, $D100                                ; $5743: $21 $00 $D1
    add  hl, de                                   ; $5746: $19
    ldh  a, [$FFEF]                               ; $5747: $F0 $EF
    ld   [hl], a                                  ; $5749: $77
    ld   hl, wEntitiesPosZTable                   ; $574A: $21 $10 $C3
    add  hl, bc                                   ; $574D: $09
    ld   a, [hl]                                  ; $574E: $7E
    ld   hl, $D200                                ; $574F: $21 $00 $D2
    add  hl, de                                   ; $5752: $19
    ld   [hl], a                                  ; $5753: $77

jr_006_5754:
    ldh  a, [hActiveEntityState]                  ; $5754: $F0 $F0
    rst  $00                                      ; $5756: $C7
    ld   [hl], e                                  ; $5757: $73
    ld   d, a                                     ; $5758: $57
    xor  b                                        ; $5759: $A8
    ld   d, a                                     ; $575A: $57
    db   $ED                                      ; $575B: $ED
    ld   d, a                                     ; $575C: $57
    inc  c                                        ; $575D: $0C
    ld   e, b                                     ; $575E: $58
    dec  [hl]                                     ; $575F: $35
    ld   e, b                                     ; $5760: $58
    sbc  a                                        ; $5761: $9F
    ld   e, b                                     ; $5762: $58
    jr   z, jr_006_579D                           ; $5763: $28 $38

    ld   c, b                                     ; $5765: $48
    ld   e, b                                     ; $5766: $58
    ld   l, b                                     ; $5767: $68
    ld   a, b                                     ; $5768: $78
    adc  b                                        ; $5769: $88
    jr   z, jr_006_579C                           ; $576A: $28 $30

    ld   b, b                                     ; $576C: $40
    ld   d, b                                     ; $576D: $50
    ld   h, b                                     ; $576E: $60
    ld   [hl], b                                  ; $576F: $70
    jr   nc, jr_006_57B2                          ; $5770: $30 $40

    ld   d, b                                     ; $5772: $50
    call GetEntityTransitionCountdown             ; $5773: $CD $05 $0C
    ret  nz                                       ; $5776: $C0

    call GetEntityTransitionCountdown             ; $5777: $CD $05 $0C
    ld   [hl], $18                                ; $577A: $36 $18
    call GetRandomByte                            ; $577C: $CD $0D $28
    and  $07                                      ; $577F: $E6 $07
    ld   e, a                                     ; $5781: $5F
    ld   d, b                                     ; $5782: $50
    ld   hl, $5763                                ; $5783: $21 $63 $57
    add  hl, de                                   ; $5786: $19
    ld   a, [hl]                                  ; $5787: $7E
    ld   hl, wEntitiesPosXTable                         ; $5788: $21 $00 $C2
    add  hl, bc                                   ; $578B: $09
    ld   [hl], a                                  ; $578C: $77
    call GetRandomByte                            ; $578D: $CD $0D $28
    and  $07                                      ; $5790: $E6 $07
    ld   e, a                                     ; $5792: $5F
    ld   hl, $576B                                ; $5793: $21 $6B $57
    add  hl, de                                   ; $5796: $19
    ld   a, [hl]                                  ; $5797: $7E
    ld   hl, wEntitiesPosYTable                         ; $5798: $21 $10 $C2
    add  hl, bc                                   ; $579B: $09

jr_006_579C:
    ld   [hl], a                                  ; $579C: $77

jr_006_579D:
    ld   hl, wEntitiesPosZTable                   ; $579D: $21 $10 $C3
    add  hl, bc                                   ; $57A0: $09
    ld   [hl], b                                  ; $57A1: $70
    call label_3D8A                               ; $57A2: $CD $8A $3D
    jp   IncrementEntityWalkingAttr               ; $57A5: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $57A8: $CD $05 $0C
    jr   nz, jr_006_57E0                          ; $57AB: $20 $33

    ld   [hl], $20                                ; $57AD: $36 $20
    ldh  a, [hLinkPositionX]                      ; $57AF: $F0 $98
    push af                                       ; $57B1: $F5

jr_006_57B2:
    ldh  a, [hLinkPositionY]                      ; $57B2: $F0 $99
    push af                                       ; $57B4: $F5
    ld   a, $58                                   ; $57B5: $3E $58
    ldh  [hLinkPositionX], a                      ; $57B7: $E0 $98
    ld   a, $50                                   ; $57B9: $3E $50
    ldh  [hLinkPositionY], a                      ; $57BB: $E0 $99
    ld   a, $08                                   ; $57BD: $3E $08
    call label_3BAA                               ; $57BF: $CD $AA $3B
    pop  af                                       ; $57C2: $F1
    ldh  [hLinkPositionY], a                      ; $57C3: $E0 $99
    pop  af                                       ; $57C5: $F1
    ldh  [hLinkPositionX], a                      ; $57C6: $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ; $57C8: $21 $20 $C3
    add  hl, bc                                   ; $57CB: $09
    ld   [hl], $08                                ; $57CC: $36 $08
    ldh  a, [wActiveEntityPosX]                   ; $57CE: $F0 $EE
    ld   [$C1CD], a                               ; $57D0: $EA $CD $C1
    ldh  a, [$FFEF]                               ; $57D3: $F0 $EF
    ld   [$C1CE], a                               ; $57D5: $EA $CE $C1
    call IsEntityUnknownFZero                     ; $57D8: $CD $00 $0C
    ld   [hl], $61                                ; $57DB: $36 $61
    call IncrementEntityWalkingAttr               ; $57DD: $CD $12 $3B

jr_006_57E0:
    ldh  a, [hFrameCounter]                       ; $57E0: $F0 $E7
    rra                                           ; $57E2: $1F
    rra                                           ; $57E3: $1F
    rra                                           ; $57E4: $1F
    rra                                           ; $57E5: $1F
    and  $01                                      ; $57E6: $E6 $01
    add  $05                                      ; $57E8: $C6 $05
    jp   SetEntitySpriteVariant                   ; $57EA: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $57ED: $CD $05 $0C
    jr   nz, jr_006_5803                          ; $57F0: $20 $11

    call GetRandomByte                            ; $57F2: $CD $0D $28
    and  $1F                                      ; $57F5: $E6 $1F
    add  $20                                      ; $57F7: $C6 $20
    ld   [hl], a                                  ; $57F9: $77
    ld   hl, wEntitiesUnknownTableB               ; $57FA: $21 $B0 $C2
    add  hl, bc                                   ; $57FD: $09
    ld   [hl], $20                                ; $57FE: $36 $20
    call IncrementEntityWalkingAttr               ; $5800: $CD $12 $3B

jr_006_5803:
    call func_006_6541                            ; $5803: $CD $41 $65
    call func_006_657A                            ; $5806: $CD $7A $65
    jp   label_3B39                               ; $5809: $C3 $39 $3B

    call GetEntityTransitionCountdown             ; $580C: $CD $05 $0C
    jr   nz, jr_006_5816                          ; $580F: $20 $05

    ld   [hl], $80                                ; $5811: $36 $80
    call IncrementEntityWalkingAttr               ; $5813: $CD $12 $3B

jr_006_5816:
    ld   hl, wEntitiesUnknownTableB               ; $5816: $21 $B0 $C2
    add  hl, bc                                   ; $5819: $09
    ld   a, [hl]                                  ; $581A: $7E
    inc  [hl]                                     ; $581B: $34
    ld   a, [hl]                                  ; $581C: $7E
    bit  0, a                                     ; $581D: $CB $47
    jr   nz, jr_006_582C                          ; $581F: $20 $0B

    ld   hl, wEntitiesSpeedZTable                 ; $5821: $21 $20 $C3
    add  hl, bc                                   ; $5824: $09
    and  $20                                      ; $5825: $E6 $20
    jr   nz, jr_006_582B                          ; $5827: $20 $02

    inc  [hl]                                     ; $5829: $34
    inc  [hl]                                     ; $582A: $34

jr_006_582B:
    dec  [hl]                                     ; $582B: $35

jr_006_582C:
    call func_006_6541                            ; $582C: $CD $41 $65
    call func_006_657A                            ; $582F: $CD $7A $65
    jp   label_3B39                               ; $5832: $C3 $39 $3B

    call GetEntityTransitionCountdown             ; $5835: $CD $05 $0C
    jr   nz, jr_006_5841                          ; $5838: $20 $07

    ld   [hl], $60                                ; $583A: $36 $60
    call IncrementEntityWalkingAttr               ; $583C: $CD $12 $3B
    ld   [hl], b                                  ; $583F: $70
    ret                                           ; $5840: $C9

jr_006_5841:
    cp   $78                                      ; $5841: $FE $78
    jr   nz, jr_006_5858                          ; $5843: $20 $13

    ldh  a, [wActiveEntityPosX]                   ; $5845: $F0 $EE
    ld   [$C1CD], a                               ; $5847: $EA $CD $C1
    ldh  a, [$FFEF]                               ; $584A: $F0 $EF
    ld   [$C1CE], a                               ; $584C: $EA $CE $C1
    call IsEntityUnknownFZero                     ; $584F: $CD $00 $0C
    ld   [hl], $60                                ; $5852: $36 $60
    ld   a, $23                                   ; $5854: $3E $23
    ldh  [hNoiseSfx], a                           ; $5856: $E0 $F4

jr_006_5858:
    ld   hl, wEntitiesSpeedZTable                 ; $5858: $21 $20 $C3
    add  hl, bc                                   ; $585B: $09
    ld   a, [hl]                                  ; $585C: $7E
    sub  $F4                                      ; $585D: $D6 $F4
    and  $80                                      ; $585F: $E6 $80
    jr   nz, jr_006_5864                          ; $5861: $20 $01

    dec  [hl]                                     ; $5863: $35

jr_006_5864:
    ldh  a, [hFrameCounter]                       ; $5864: $F0 $E7
    and  $07                                      ; $5866: $E6 $07
    jr   nz, jr_006_5888                          ; $5868: $20 $1E

    ld   hl, wEntitiesSpeedXTable                       ; $586A: $21 $40 $C2
    add  hl, bc                                   ; $586D: $09
    ld   a, [hl]                                  ; $586E: $7E
    and  a                                        ; $586F: $A7
    jr   z, jr_006_5879                           ; $5870: $28 $07

    and  $80                                      ; $5872: $E6 $80
    jr   z, jr_006_5878                           ; $5874: $28 $02

    inc  [hl]                                     ; $5876: $34
    inc  [hl]                                     ; $5877: $34

jr_006_5878:
    dec  [hl]                                     ; $5878: $35

jr_006_5879:
    ld   hl, wEntitiesSpeedYTable                       ; $5879: $21 $50 $C2
    add  hl, bc                                   ; $587C: $09
    ld   a, [hl]                                  ; $587D: $7E
    and  a                                        ; $587E: $A7
    jr   z, jr_006_5888                           ; $587F: $28 $07

    and  $80                                      ; $5881: $E6 $80
    jr   z, jr_006_5887                           ; $5883: $28 $02

    inc  [hl]                                     ; $5885: $34
    inc  [hl]                                     ; $5886: $34

jr_006_5887:
    dec  [hl]                                     ; $5887: $35

jr_006_5888:
    call func_006_6541                            ; $5888: $CD $41 $65
    call func_006_657A                            ; $588B: $CD $7A $65
    ld   hl, wEntitiesPosZTable                   ; $588E: $21 $10 $C3
    add  hl, bc                                   ; $5891: $09
    ld   a, [hl]                                  ; $5892: $7E
    and  $80                                      ; $5893: $E6 $80
    jr   nz, jr_006_589A                          ; $5895: $20 $03

    call label_3B39                               ; $5897: $CD $39 $3B

jr_006_589A:
    ld   a, $02                                   ; $589A: $3E $02
    jp   SetEntitySpriteVariant                   ; $589C: $C3 $0C $3B

    ld   [hl], d                                  ; $589F: $72
    inc  bc                                       ; $58A0: $03
    ld   [hl], h                                  ; $58A1: $74
    inc  bc                                       ; $58A2: $03
    ld   [hl], h                                  ; $58A3: $74
    inc  hl                                       ; $58A4: $23
    ld   [hl], d                                  ; $58A5: $72
    inc  hl                                       ; $58A6: $23
    ld   [hl], b                                  ; $58A7: $70
    inc  bc                                       ; $58A8: $03
    ld   [hl], b                                  ; $58A9: $70
    inc  hl                                       ; $58AA: $23
    ld   [hl], b                                  ; $58AB: $70
    ld   b, e                                     ; $58AC: $43
    ld   [hl], b                                  ; $58AD: $70
    ld   h, e                                     ; $58AE: $63
    db   $76                                      ; $58AF: $76
    inc  bc                                       ; $58B0: $03
    db   $76                                      ; $58B1: $76
    inc  hl                                       ; $58B2: $23
    ld   a, d                                     ; $58B3: $7A
    ld   bc, $617A                                ; $58B4: $01 $7A $61
    ld   a, d                                     ; $58B7: $7A
    ld   b, c                                     ; $58B8: $41
    ld   a, d                                     ; $58B9: $7A
    ld   hl, $0378                                ; $58BA: $21 $78 $03
    ld   a, b                                     ; $58BD: $78
    ld   h, e                                     ; $58BE: $63
    ld   a, b                                     ; $58BF: $78
    ld   b, e                                     ; $58C0: $43
    ld   a, b                                     ; $58C1: $78
    inc  hl                                       ; $58C2: $23
    inc  c                                        ; $58C3: $0C
    jr   @+$26                                    ; $58C4: $18 $24

    jr   nc, @+$3E                                ; $58C6: $30 $3C

    ld   c, b                                     ; $58C8: $48

func_006_58C9:
    ld   hl, wEntitiesPosZTable                   ; $58C9: $21 $10 $C3
    add  hl, bc                                   ; $58CC: $09
    ld   a, [hl]                                  ; $58CD: $7E
    and  $80                                      ; $58CE: $E6 $80
    jr   nz, jr_006_58D8                          ; $58D0: $20 $06

    ld   de, $589F                                ; $58D2: $11 $9F $58
    call RenderAnimatedActiveEntity                               ; $58D5: $CD $C0 $3B

jr_006_58D8:
    ld   hl, $C3D0                                ; $58D8: $21 $D0 $C3
    add  hl, bc                                   ; $58DB: $09
    ld   a, [hl]                                  ; $58DC: $7E
    ldh  [hScratch0], a                           ; $58DD: $E0 $D7
    ldh  a, [hFrameCounter]                       ; $58DF: $F0 $E7
    and  $01                                      ; $58E1: $E6 $01
    jr   z, jr_006_58ED                           ; $58E3: $28 $08

    ld   a, $06                                   ; $58E5: $3E $06
    ldh  [hIndexOfObjectBelowLink], a             ; $58E7: $E0 $E9
    ld   a, $00                                   ; $58E9: $3E $00
    jr   jr_006_58F3                              ; $58EB: $18 $06

jr_006_58ED:
    ld   a, $FF                                   ; $58ED: $3E $FF
    ldh  [hIndexOfObjectBelowLink], a             ; $58EF: $E0 $E9
    ld   a, $05                                   ; $58F1: $3E $05

jr_006_58F3:
    ldh  [hFFE8], a                               ; $58F3: $E0 $E8
    ld   e, a                                     ; $58F5: $5F
    ld   d, b                                     ; $58F6: $50
    ld   hl, $58C3                                ; $58F7: $21 $C3 $58
    add  hl, de                                   ; $58FA: $19
    ldh  a, [hScratch0]                           ; $58FB: $F0 $D7
    sub  [hl]                                     ; $58FD: $96
    and  $FF                                      ; $58FE: $E6 $FF
    ld   e, a                                     ; $5900: $5F
    ld   d, $00                                   ; $5901: $16 $00
    ld   hl, wIsFileSelectionArrowShifted         ; $5903: $21 $00 $D0
    add  hl, de                                   ; $5906: $19
    ld   a, [hl]                                  ; $5907: $7E
    ldh  [wActiveEntityPosX], a                   ; $5908: $E0 $EE
    ld   hl, $D100                                ; $590A: $21 $00 $D1
    add  hl, de                                   ; $590D: $19
    ld   a, [hl]                                  ; $590E: $7E
    ldh  [$FFEF], a                               ; $590F: $E0 $EF
    ld   hl, $D200                                ; $5911: $21 $00 $D2
    add  hl, de                                   ; $5914: $19
    sub  [hl]                                     ; $5915: $96
    ldh  [wActiveEntityPosY], a                   ; $5916: $E0 $EC
    ld   a, [hl]                                  ; $5918: $7E
    and  $80                                      ; $5919: $E6 $80
    jr   nz, jr_006_5936                          ; $591B: $20 $19

    ldh  a, [hFFE8]                               ; $591D: $F0 $E8
    cp   $05                                      ; $591F: $FE $05
    ld   a, $04                                   ; $5921: $3E $04
    jr   nz, jr_006_592E                          ; $5923: $20 $09

    ldh  a, [hFrameCounter]                       ; $5925: $F0 $E7
    rra                                           ; $5927: $1F
    rra                                           ; $5928: $1F
    rra                                           ; $5929: $1F
    and  $01                                      ; $592A: $E6 $01
    add  $07                                      ; $592C: $C6 $07

jr_006_592E:
    ldh  [hActiveEntitySpriteVariant], a               ; $592E: $E0 $F1
    ld   de, $589F                                ; $5930: $11 $9F $58
    call RenderAnimatedActiveEntity                               ; $5933: $CD $C0 $3B

jr_006_5936:
    ld   e, $FF                                   ; $5936: $1E $FF
    ldh  a, [hFrameCounter]                       ; $5938: $F0 $E7
    and  $01                                      ; $593A: $E6 $01
    jr   z, jr_006_5940                           ; $593C: $28 $02

    ld   e, $01                                   ; $593E: $1E $01

jr_006_5940:
    ld   hl, hIndexOfObjectBelowLink              ; $5940: $21 $E9 $FF
    ldh  a, [hFFE8]                               ; $5943: $F0 $E8
    add  e                                        ; $5945: $83
    cp   [hl]                                     ; $5946: $BE
    jr   nz, jr_006_58F3                          ; $5947: $20 $AA

    jp   label_3D8A                               ; $5949: $C3 $8A $3D

func_006_594C:
    ld   hl, wEntitiesSpeedXTable                       ; $594C: $21 $40 $C2
    add  hl, bc                                   ; $594F: $09
    ld   a, [hl]                                  ; $5950: $7E
    ld   d, a                                     ; $5951: $57
    bit  7, a                                     ; $5952: $CB $7F
    jr   z, jr_006_5958                           ; $5954: $28 $02

    cpl                                           ; $5956: $2F
    inc  a                                        ; $5957: $3C

jr_006_5958:
    ld   e, a                                     ; $5958: $5F
    ld   hl, wEntitiesSpeedYTable                       ; $5959: $21 $50 $C2
    add  hl, bc                                   ; $595C: $09
    ld   a, [hl]                                  ; $595D: $7E
    bit  7, a                                     ; $595E: $CB $7F
    jr   z, jr_006_5964                           ; $5960: $28 $02

    cpl                                           ; $5962: $2F
    inc  a                                        ; $5963: $3C

jr_006_5964:
    cp   e                                        ; $5964: $BB
    jr   nc, jr_006_5973                          ; $5965: $30 $0C

    bit  7, d                                     ; $5967: $CB $7A
    jr   nz, jr_006_596F                          ; $5969: $20 $04

    ld   a, $01                                   ; $596B: $3E $01
    jr   jr_006_597D                              ; $596D: $18 $0E

jr_006_596F:
    ld   a, $00                                   ; $596F: $3E $00
    jr   jr_006_597D                              ; $5971: $18 $0A

jr_006_5973:
    bit  7, [hl]                                  ; $5973: $CB $7E
    jr   nz, jr_006_597B                          ; $5975: $20 $04

    ld   a, $02                                   ; $5977: $3E $02
    jr   jr_006_597D                              ; $5979: $18 $02

jr_006_597B:
    ld   a, $03                                   ; $597B: $3E $03

jr_006_597D:
    jp   SetEntitySpriteVariant                   ; $597D: $C3 $0C $3B

    ld   a, h                                     ; $5980: $7C
    ld   hl, $217E                                ; $5981: $21 $7E $21
    ld   a, h                                     ; $5984: $7C
    ld   bc, $017E                                ; $5985: $01 $7E $01

label_006_5988:
    ld   de, $5980                                ; $5988: $11 $80 $59
    call RenderSimpleEntityWithSpriteVariantToOAM ; $598B: $CD $77 $3C
    call func_006_64C6                            ; $598E: $CD $C6 $64
    call func_006_6541                            ; $5991: $CD $41 $65
    ld   hl, wEntitiesSpeedYTable                       ; $5994: $21 $50 $C2
    add  hl, bc                                   ; $5997: $09
    inc  [hl]                                     ; $5998: $34
    ld   a, [hl]                                  ; $5999: $7E
    and  a                                        ; $599A: $A7
    jr   nz, jr_006_59A2                          ; $599B: $20 $05

    ld   hl, wEntitiesSpriteVariantTable               ; $599D: $21 $B0 $C3
    add  hl, bc                                   ; $59A0: $09
    inc  [hl]                                     ; $59A1: $34

jr_006_59A2:
    cp   $10                                      ; $59A2: $FE $10
    ret  nz                                       ; $59A4: $C0

    jp   label_006_65DB                           ; $59A5: $C3 $DB $65

    ld   [hl], b                                  ; $59A8: $70
    ld   [bc], a                                  ; $59A9: $02
    ld   [hl], d                                  ; $59AA: $72
    ld   [bc], a                                  ; $59AB: $02
    ld   [hl], h                                  ; $59AC: $74
    ld   [bc], a                                  ; $59AD: $02
    db   $76                                      ; $59AE: $76
    ld   [bc], a                                  ; $59AF: $02
    ld   [hl], d                                  ; $59B0: $72
    ld   [hl+], a                                 ; $59B1: $22
    ld   [hl], b                                  ; $59B2: $70
    ld   [hl+], a                                 ; $59B3: $22
    db   $76                                      ; $59B4: $76
    ld   [hl+], a                                 ; $59B5: $22
    ld   [hl], h                                  ; $59B6: $74
    ld   [hl+], a                                 ; $59B7: $22
    nop                                           ; $59B8: $00
    ld   [bc], a                                  ; $59B9: $02
    ld   [bc], a                                  ; $59BA: $02
    ld   [bc], a                                  ; $59BB: $02
    inc  b                                        ; $59BC: $04
    ld   [bc], a                                  ; $59BD: $02
    ld   b, $02                                   ; $59BE: $06 $02
    ld   [bc], a                                  ; $59C0: $02
    ld   [hl+], a                                 ; $59C1: $22
    nop                                           ; $59C2: $00
    ld   [hl+], a                                 ; $59C3: $22
    ld   b, $22                                   ; $59C4: $06 $22
    inc  b                                        ; $59C6: $04
    ld   [hl+], a                                 ; $59C7: $22
    ld   a, b                                     ; $59C8: $78
    ld   [bc], a                                  ; $59C9: $02
    ld   a, d                                     ; $59CA: $7A
    ld   [bc], a                                  ; $59CB: $02
    ld   a, h                                     ; $59CC: $7C
    ld   [bc], a                                  ; $59CD: $02
    ld   a, [hl]                                  ; $59CE: $7E
    ld   [bc], a                                  ; $59CF: $02
    ld   a, d                                     ; $59D0: $7A
    ld   [hl+], a                                 ; $59D1: $22
    ld   a, b                                     ; $59D2: $78
    ld   [hl+], a                                 ; $59D3: $22
    ld   a, [hl]                                  ; $59D4: $7E
    ld   [hl+], a                                 ; $59D5: $22
    ld   a, h                                     ; $59D6: $7C
    ld   [hl+], a                                 ; $59D7: $22
    db   $10                                      ; $59D8: $10
    ld   [bc], a                                  ; $59D9: $02
    ld   [de], a                                  ; $59DA: $12
    ld   [bc], a                                  ; $59DB: $02
    inc  d                                        ; $59DC: $14
    ld   [bc], a                                  ; $59DD: $02
    ld   d, $02                                   ; $59DE: $16 $02
    ld   [de], a                                  ; $59E0: $12
    ld   [hl+], a                                 ; $59E1: $22
    db   $10                                      ; $59E2: $10
    ld   [hl+], a                                 ; $59E3: $22
    ld   d, $22                                   ; $59E4: $16 $22
    inc  d                                        ; $59E6: $14
    ld   [hl+], a                                 ; $59E7: $22
    ld   a, [wDialogState]                        ; $59E8: $FA $9F $C1
    and  a                                        ; $59EB: $A7
    jr   z, jr_006_5A0D                           ; $59EC: $28 $1F

    ld   a, [wDialogIndex]                        ; $59EE: $FA $73 $C1
    cp   $82                                      ; $59F1: $FE $82
    jr   z, jr_006_5A0D                           ; $59F3: $28 $18

    call func_006_6594                            ; $59F5: $CD $94 $65
    ld   hl, $C380                                ; $59F8: $21 $80 $C3
    add  hl, bc                                   ; $59FB: $09
    ld   [hl], e                                  ; $59FC: $73
    call label_3D7F                               ; $59FD: $CD $7F $3D
    ld   a, [wDialogCharacterIndex]               ; $5A00: $FA $70 $C1
    ld   e, $00                                   ; $5A03: $1E $00
    and  $06                                      ; $5A05: $E6 $06
    jr   z, jr_006_5A0A                           ; $5A07: $28 $01

    inc  e                                        ; $5A09: $1C

jr_006_5A0A:
    ld   a, e                                     ; $5A0A: $7B
    ldh  [hActiveEntitySpriteVariant], a               ; $5A0B: $E0 $F1

jr_006_5A0D:
    ld   hl, $C380                                ; $5A0D: $21 $80 $C3
    add  hl, bc                                   ; $5A10: $09
    ld   a, [hl]                                  ; $5A11: $7E
    and  a                                        ; $5A12: $A7
    jr   nz, jr_006_5A1B                          ; $5A13: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]               ; $5A15: $F0 $F1
    add  $02                                      ; $5A17: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a               ; $5A19: $E0 $F1

jr_006_5A1B:
    ld   de, $59A8                                ; $5A1B: $11 $A8 $59
    ld   hl, wEntitiesUnknownTableB               ; $5A1E: $21 $B0 $C2
    add  hl, bc                                   ; $5A21: $09
    ld   a, [hl]                                  ; $5A22: $7E
    and  a                                        ; $5A23: $A7
    jr   nz, jr_006_5A33                          ; $5A24: $20 $0D

    ldh  a, [hMapRoom]                            ; $5A26: $F0 $F6
    cp   $B2                                      ; $5A28: $FE $B2
    jr   nz, jr_006_5A36                          ; $5A2A: $20 $0A

    ld   a, [wTradeSequenceItem]                  ; $5A2C: $FA $0E $DB
    cp   $03                                      ; $5A2F: $FE $03
    jr   c, jr_006_5A36                           ; $5A31: $38 $03

jr_006_5A33:
    ld   de, $59C8                                ; $5A33: $11 $C8 $59

jr_006_5A36:
    ld   a, [wGameplayType]                       ; $5A36: $FA $95 $DB
    cp   $01                                      ; $5A39: $FE $01
    jr   nz, jr_006_5A43                          ; $5A3B: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]               ; $5A3D: $F0 $F1
    add  $04                                      ; $5A3F: $C6 $04
    ldh  [hActiveEntitySpriteVariant], a               ; $5A41: $E0 $F1

jr_006_5A43:
    call RenderAnimatedActiveEntity                               ; $5A43: $CD $C0 $3B
    call func_006_64C6                            ; $5A46: $CD $C6 $64
    call label_C56                                ; $5A49: $CD $56 $0C
    call func_006_657A                            ; $5A4C: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5A4F: $21 $20 $C3
    add  hl, bc                                   ; $5A52: $09
    dec  [hl]                                     ; $5A53: $35
    dec  [hl]                                     ; $5A54: $35
    ld   hl, wEntitiesPosZTable                   ; $5A55: $21 $10 $C3
    add  hl, bc                                   ; $5A58: $09
    ld   a, [hl]                                  ; $5A59: $7E
    and  $80                                      ; $5A5A: $E6 $80
    ldh  [hFFE8], a                               ; $5A5C: $E0 $E8
    jr   z, jr_006_5A67                           ; $5A5E: $28 $07

    xor  a                                        ; $5A60: $AF
    ld   [hl], a                                  ; $5A61: $77
    ld   hl, wEntitiesSpeedZTable                 ; $5A62: $21 $20 $C3
    add  hl, bc                                   ; $5A65: $09
    ld   [hl], a                                  ; $5A66: $77

jr_006_5A67:
    ldh  a, [hActiveEntityState]                  ; $5A67: $F0 $F0
    cp   $02                                      ; $5A69: $FE $02
    jr   nc, jr_006_5A98                          ; $5A6B: $30 $2B

    call func_006_645D                            ; $5A6D: $CD $5D $64
    jr   nc, jr_006_5A98                          ; $5A70: $30 $26

    ld   e, $23                                   ; $5A72: $1E $23
    ldh  a, [hMapRoom]                            ; $5A74: $F0 $F6
    cp   $B2                                      ; $5A76: $FE $B2
    jr   nz, jr_006_5A91                          ; $5A78: $20 $17

    ld   e, $80                                   ; $5A7A: $1E $80
    ld   a, [wTradeSequenceItem]                  ; $5A7C: $FA $0E $DB
    cp   $02                                      ; $5A7F: $FE $02
    jr   nz, jr_006_5A8A                          ; $5A81: $20 $07

    call IncrementEntityWalkingAttr               ; $5A83: $CD $12 $3B
    ld   [hl], $02                                ; $5A86: $36 $02
    ld   e, $81                                   ; $5A88: $1E $81

jr_006_5A8A:
    ld   a, e                                     ; $5A8A: $7B
    call OpenDialogInTable1                       ; $5A8B: $CD $73 $23
    jp   label_006_5ACC                           ; $5A8E: $C3 $CC $5A

jr_006_5A91:
    ld   a, e                                     ; $5A91: $7B
    call OpenDialog                               ; $5A92: $CD $85 $23
    call func_006_5ACC                            ; $5A95: $CD $CC $5A

jr_006_5A98:
    ldh  a, [hActiveEntityState]                  ; $5A98: $F0 $F0
    rst  $00                                      ; $5A9A: $C7
    rst  $20                                      ; $5A9B: $E7
    ld   e, d                                     ; $5A9C: $5A
    ld   a, [hl+]                                 ; $5A9D: $2A
    ld   e, e                                     ; $5A9E: $5B
    and  e                                        ; $5A9F: $A3
    ld   e, d                                     ; $5AA0: $5A
    pop  de                                       ; $5AA1: $D1
    ld   e, d                                     ; $5AA2: $5A
    ld   a, [wDialogState]                        ; $5AA3: $FA $9F $C1
    and  a                                        ; $5AA6: $A7
    jr   nz, jr_006_5AD0                          ; $5AA7: $20 $27

    ld   a, [wC177]                               ; $5AA9: $FA $77 $C1
    and  a                                        ; $5AAC: $A7
    jr   nz, jr_006_5AC3                          ; $5AAD: $20 $14

    ld   a, $03                                   ; $5AAF: $3E $03
    ld   [wTradeSequenceItem], a                  ; $5AB1: $EA $0E $DB
    ld   a, $0D                                   ; $5AB4: $3E $0D
    ldh  [hFFA5], a                               ; $5AB6: $E0 $A5
    ld   a, $83                                   ; $5AB8: $3E $83
    call OpenDialogInTable1                       ; $5ABA: $CD $73 $23
    call func_006_5ACC                            ; $5ABD: $CD $CC $5A
    jp   IncrementEntityWalkingAttr               ; $5AC0: $C3 $12 $3B

jr_006_5AC3:
    call IncrementEntityWalkingAttr               ; $5AC3: $CD $12 $3B
    ld   [hl], b                                  ; $5AC6: $70
    ld   a, $84                                   ; $5AC7: $3E $84
    call OpenDialogInTable1                       ; $5AC9: $CD $73 $23

func_006_5ACC:
label_006_5ACC:
    ld   a, $18                                   ; $5ACC: $3E $18
    ldh  [hWaveSfx], a                            ; $5ACE: $E0 $F3

jr_006_5AD0:
    ret                                           ; $5AD0: $C9

    ld   a, [wDialogState]                        ; $5AD1: $FA $9F $C1
    and  a                                        ; $5AD4: $A7
    jr   nz, jr_006_5ADE                          ; $5AD5: $20 $07

    call label_C0C                                ; $5AD7: $CD $0C $0C
    call IncrementEntityWalkingAttr               ; $5ADA: $CD $12 $3B
    ld   [hl], b                                  ; $5ADD: $70

jr_006_5ADE:
    ret                                           ; $5ADE: $C9

    ld   [bc], a                                  ; $5ADF: $02
    ld   [SwitchBank], sp                         ; $5AE0: $08 $0C $08
    cp   $F8                                      ; $5AE3: $FE $F8
    db   $F4                                      ; $5AE5: $F4
    ld   hl, sp-$51                               ; $5AE6: $F8 $AF
    call SetEntitySpriteVariant                   ; $5AE8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5AEB: $CD $05 $0C
    jr   nz, jr_006_5B27                          ; $5AEE: $20 $37

    call GetRandomByte                            ; $5AF0: $CD $0D $28
    and  $07                                      ; $5AF3: $E6 $07
    ld   e, a                                     ; $5AF5: $5F
    ld   d, b                                     ; $5AF6: $50
    ld   hl, $5ADF                                ; $5AF7: $21 $DF $5A
    add  hl, de                                   ; $5AFA: $19
    ld   a, [hl]                                  ; $5AFB: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5AFC: $21 $40 $C2
    add  hl, bc                                   ; $5AFF: $09
    ld   [hl], a                                  ; $5B00: $77
    ld   a, e                                     ; $5B01: $7B
    and  $04                                      ; $5B02: $E6 $04
    ld   hl, $C380                                ; $5B04: $21 $80 $C3
    add  hl, bc                                   ; $5B07: $09
    ld   [hl], a                                  ; $5B08: $77
    call GetRandomByte                            ; $5B09: $CD $0D $28
    and  $07                                      ; $5B0C: $E6 $07
    ld   e, a                                     ; $5B0E: $5F
    ld   hl, $5ADF                                ; $5B0F: $21 $DF $5A
    add  hl, de                                   ; $5B12: $19
    ld   a, [hl]                                  ; $5B13: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5B14: $21 $50 $C2
    add  hl, bc                                   ; $5B17: $09
    ld   [hl], a                                  ; $5B18: $77
    call GetEntityTransitionCountdown             ; $5B19: $CD $05 $0C
    call GetRandomByte                            ; $5B1C: $CD $0D $28
    and  $1F                                      ; $5B1F: $E6 $1F
    add  $30                                      ; $5B21: $C6 $30
    ld   [hl], a                                  ; $5B23: $77
    call IncrementEntityWalkingAttr               ; $5B24: $CD $12 $3B

jr_006_5B27:
    jp   label_006_5B4C                           ; $5B27: $C3 $4C $5B

    call func_006_6541                            ; $5B2A: $CD $41 $65
    call label_3B23                               ; $5B2D: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $5B30: $F0 $E8
    and  a                                        ; $5B32: $A7
    jr   z, jr_006_5B4C                           ; $5B33: $28 $17

    call GetEntityTransitionCountdown             ; $5B35: $CD $05 $0C
    jr   nz, jr_006_5B41                          ; $5B38: $20 $07

    ld   [hl], $30                                ; $5B3A: $36 $30
    call IncrementEntityWalkingAttr               ; $5B3C: $CD $12 $3B
    ld   [hl], b                                  ; $5B3F: $70
    ret                                           ; $5B40: $C9

jr_006_5B41:
    ld   hl, wEntitiesSpeedZTable                 ; $5B41: $21 $20 $C3
    add  hl, bc                                   ; $5B44: $09
    ld   [hl], $08                                ; $5B45: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $5B47: $21 $10 $C3
    add  hl, bc                                   ; $5B4A: $09
    inc  [hl]                                     ; $5B4B: $34

label_006_5B4C:
jr_006_5B4C:
    ldh  a, [hFrameCounter]                       ; $5B4C: $F0 $E7
    rra                                           ; $5B4E: $1F
    rra                                           ; $5B4F: $1F
    rra                                           ; $5B50: $1F
    and  $01                                      ; $5B51: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5B53: $C3 $0C $3B

    ld   h, b                                     ; $5B56: $60
    ld   bc, $0162                                ; $5B57: $01 $62 $01
    ld   h, d                                     ; $5B5A: $62
    ld   hl, $2160                                ; $5B5B: $21 $60 $21
    ld   h, h                                     ; $5B5E: $64
    ld   bc, $0166                                ; $5B5F: $01 $66 $01
    ld   h, [hl]                                  ; $5B62: $66
    ld   hl, $2164                                ; $5B63: $21 $64 $21
    ld   l, b                                     ; $5B66: $68
    ld   bc, $016A                                ; $5B67: $01 $6A $01
    ld   l, h                                     ; $5B6A: $6C
    ld   bc, Start.notGBC                         ; $5B6B: $01 $6E $01
    ld   l, d                                     ; $5B6E: $6A
    ld   hl, $2168                                ; $5B6F: $21 $68 $21
    ld   l, [hl]                                  ; $5B72: $6E
    ld   hl, $216C                                ; $5B73: $21 $6C $21
    call GetEntityTransitionCountdown             ; $5B76: $CD $05 $0C
    cp   $01                                      ; $5B79: $FE $01
    jr   nz, jr_006_5B83                          ; $5B7B: $20 $06

    ld   [hl], b                                  ; $5B7D: $70
    ld   a, $FF                                   ; $5B7E: $3E $FF
    ld   [wSubstractRupeeBufferLow], a            ; $5B80: $EA $93 $DB

jr_006_5B83:
    ldh  a, [hFrameCounter]                       ; $5B83: $F0 $E7
    and  $1F                                      ; $5B85: $E6 $1F
    jr   nz, jr_006_5B91                          ; $5B87: $20 $08

    call func_006_65B4                            ; $5B89: $CD $B4 $65
    ld   hl, $C380                                ; $5B8C: $21 $80 $C3
    add  hl, bc                                   ; $5B8F: $09
    ld   [hl], e                                  ; $5B90: $73

jr_006_5B91:
    call func_006_6441                            ; $5B91: $CD $41 $64
    ld   de, $5B56                                ; $5B94: $11 $56 $5B
    call RenderAnimatedActiveEntity                               ; $5B97: $CD $C0 $3B
    ld   a, [wIsBowWowFollowingLink]              ; $5B9A: $FA $56 $DB
    cp   $80                                      ; $5B9D: $FE $80
    jr   nz, jr_006_5BC4                          ; $5B9F: $20 $23

    call func_006_657A                            ; $5BA1: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5BA4: $21 $20 $C3
    add  hl, bc                                   ; $5BA7: $09
    dec  [hl]                                     ; $5BA8: $35
    dec  [hl]                                     ; $5BA9: $35
    ld   hl, wEntitiesPosZTable                   ; $5BAA: $21 $10 $C3
    add  hl, bc                                   ; $5BAD: $09
    ld   a, [hl]                                  ; $5BAE: $7E
    and  a                                        ; $5BAF: $A7
    jr   z, jr_006_5BB6                           ; $5BB0: $28 $04

    and  $80                                      ; $5BB2: $E6 $80
    jr   z, jr_006_5BC4                           ; $5BB4: $28 $0E

jr_006_5BB6:
    ld   [hl], b                                  ; $5BB6: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5BB7: $21 $20 $C3
    add  hl, bc                                   ; $5BBA: $09
    ld   [hl], b                                  ; $5BBB: $70
    ldh  a, [hFrameCounter]                       ; $5BBC: $F0 $E7
    and  $3F                                      ; $5BBE: $E6 $3F
    jr   nz, jr_006_5BC4                          ; $5BC0: $20 $02

    ld   [hl], $10                                ; $5BC2: $36 $10

jr_006_5BC4:
    call func_006_64C6                            ; $5BC4: $CD $C6 $64
    ldh  a, [$FFEF]                               ; $5BC7: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $5BC9: $E0 $EC
    call func_006_641A                            ; $5BCB: $CD $1A $64
    call label_3D8A                               ; $5BCE: $CD $8A $3D
    call func_006_645D                            ; $5BD1: $CD $5D $64
    ret  nc                                       ; $5BD4: $D0

    ld   e, $30                                   ; $5BD5: $1E $30
    ld   a, [wHasInstrument2]                     ; $5BD7: $FA $66 $DB
    and  $02                                      ; $5BDA: $E6 $02
    jr   z, jr_006_5BF2                           ; $5BDC: $28 $14

    ld   a, [wIsBowWowFollowingLink]              ; $5BDE: $FA $56 $DB
    cp   $01                                      ; $5BE1: $FE $01
    jr   nz, jr_006_5BF2                          ; $5BE3: $20 $0D

    xor  a                                        ; $5BE5: $AF
    ld   [wIsBowWowFollowingLink], a              ; $5BE6: $EA $56 $DB
    call GetEntityTransitionCountdown             ; $5BE9: $CD $05 $0C
    ld   [hl], $10                                ; $5BEC: $36 $10
    ld   e, $2F                                   ; $5BEE: $1E $2F
    jr   jr_006_5C00                              ; $5BF0: $18 $0E

jr_006_5BF2:
    ld   a, [wIsBowWowFollowingLink]              ; $5BF2: $FA $56 $DB
    and  a                                        ; $5BF5: $A7
    jr   z, jr_006_5C00                           ; $5BF6: $28 $08

    ld   e, $31                                   ; $5BF8: $1E $31
    cp   $01                                      ; $5BFA: $FE $01
    jr   nz, jr_006_5C00                          ; $5BFC: $20 $02

    ld   e, $32                                   ; $5BFE: $1E $32

jr_006_5C00:
    ld   a, e                                     ; $5C00: $7B
    jp   label_006_5C04                           ; $5C01: $C3 $04 $5C

label_006_5C04:
    ld   a, e                                     ; $5C04: $7B
    call OpenDialogInTable1                       ; $5C05: $CD $73 $23
    ld   hl, wDialogState                         ; $5C08: $21 $9F $C1
    set  7, [hl]                                  ; $5C0B: $CB $FE
    ret                                           ; $5C0D: $C9

    ld   hl, wEntitiesPosYTable                         ; $5C0E: $21 $10 $C2
    add  hl, bc                                   ; $5C11: $09
    ld   a, $49                                   ; $5C12: $3E $49
    ld   [hl], a                                  ; $5C14: $77
    push bc                                       ; $5C15: $C5
    sla  c                                        ; $5C16: $CB $21
    sla  c                                        ; $5C18: $CB $21
    ld   hl, $D580                                ; $5C1A: $21 $80 $D5
    add  hl, bc                                   ; $5C1D: $09
    inc  hl                                       ; $5C1E: $23
    inc  hl                                       ; $5C1F: $23
    ld   a, $08                                   ; $5C20: $3E $08
    ld   [hl], a                                  ; $5C22: $77
    inc  hl                                       ; $5C23: $23
    ld   a, $0A                                   ; $5C24: $3E $0A
    ld   [hl], a                                  ; $5C26: $77
    pop  bc                                       ; $5C27: $C1
    call func_006_5C71                            ; $5C28: $CD $71 $5C
    call func_006_64C6                            ; $5C2B: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $5C2E: $F0 $E7
    rra                                           ; $5C30: $1F
    rra                                           ; $5C31: $1F
    rra                                           ; $5C32: $1F
    rra                                           ; $5C33: $1F
    rra                                           ; $5C34: $1F
    and  $01                                      ; $5C35: $E6 $01
    call SetEntitySpriteVariant                   ; $5C37: $CD $0C $3B
    call func_006_641A                            ; $5C3A: $CD $1A $64
    call func_006_645D                            ; $5C3D: $CD $5D $64
    ret  nc                                       ; $5C40: $D0

    ld   a, [wDB55]                               ; $5C41: $FA $55 $DB
    and  a                                        ; $5C44: $A7
    jr   nz, jr_006_5C4C                          ; $5C45: $20 $05

    ld   a, $01                                   ; $5C47: $3E $01
    ld   [wDB55], a                               ; $5C49: $EA $55 $DB

jr_006_5C4C:
    ld   a, $40                                   ; $5C4C: $3E $40
    jp   OpenDialogInTable1                       ; $5C4E: $C3 $73 $23

    rst  $30                                      ; $5C51: $F7
    nop                                           ; $5C52: $00
    ld   [hl], b                                  ; $5C53: $70
    ld   [bc], a                                  ; $5C54: $02
    rst  $30                                      ; $5C55: $F7
    ld   [$0272], sp                              ; $5C56: $08 $72 $02
    rlca                                          ; $5C59: $07
    nop                                           ; $5C5A: $00
    ld   [hl], h                                  ; $5C5B: $74
    ld   [bc], a                                  ; $5C5C: $02
    rlca                                          ; $5C5D: $07
    ld   [$0276], sp                              ; $5C5E: $08 $76 $02
    rst  $30                                      ; $5C61: $F7
    nop                                           ; $5C62: $00
    ld   a, b                                     ; $5C63: $78
    ld   [bc], a                                  ; $5C64: $02
    rst  $30                                      ; $5C65: $F7
    ld   [$027A], sp                              ; $5C66: $08 $7A $02
    rlca                                          ; $5C69: $07
    nop                                           ; $5C6A: $00
    ld   a, h                                     ; $5C6B: $7C
    ld   [bc], a                                  ; $5C6C: $02
    rlca                                          ; $5C6D: $07
    ld   [$027E], sp                              ; $5C6E: $08 $7E $02

func_006_5C71:
    ldh  a, [hActiveEntitySpriteVariant]               ; $5C71: $F0 $F1
    rla                                           ; $5C73: $17
    rla                                           ; $5C74: $17
    rla                                           ; $5C75: $17
    rla                                           ; $5C76: $17
    and  $F0                                      ; $5C77: $E6 $F0
    ld   e, a                                     ; $5C79: $5F
    ld   d, b                                     ; $5C7A: $50
    ld   hl, $5C51                                ; $5C7B: $21 $51 $5C
    add  hl, de                                   ; $5C7E: $19
    ld   c, $04                                   ; $5C7F: $0E $04
    call label_3CE6                               ; $5C81: $CD $E6 $3C
    ld   a, $04                                   ; $5C84: $3E $04
    jp   label_3DA0                               ; $5C86: $C3 $A0 $3D

    ld   d, b                                     ; $5C89: $50
    inc  bc                                       ; $5C8A: $03
    ld   d, d                                     ; $5C8B: $52
    inc  bc                                       ; $5C8C: $03
    ld   d, h                                     ; $5C8D: $54
    inc  bc                                       ; $5C8E: $03
    ld   d, [hl]                                  ; $5C8F: $56
    inc  bc                                       ; $5C90: $03
    ld   d, d                                     ; $5C91: $52
    inc  hl                                       ; $5C92: $23
    ld   d, b                                     ; $5C93: $50
    inc  hl                                       ; $5C94: $23
    ld   d, [hl]                                  ; $5C95: $56
    inc  hl                                       ; $5C96: $23
    ld   d, h                                     ; $5C97: $54
    inc  hl                                       ; $5C98: $23
    ldh  a, [hMapRoom]                            ; $5C99: $F0 $F6
    cp   $58                                      ; $5C9B: $FE $58
    jr   nz, jr_006_5CBE                          ; $5C9D: $20 $1F

    ld   hl, $C410                                ; $5C9F: $21 $10 $C4
    add  hl, bc                                   ; $5CA2: $09
    ld   a, [hl]                                  ; $5CA3: $7E
    cp   $10                                      ; $5CA4: $FE $10
    jr   c, jr_006_5CAB                           ; $5CA6: $38 $03

    srl  a                                        ; $5CA8: $CB $3F
    ld   [hl], a                                  ; $5CAA: $77

jr_006_5CAB:
    ldh  a, [hRoomStatus]                         ; $5CAB: $F0 $F8
    and  $10                                      ; $5CAD: $E6 $10
    jp   nz, label_006_65DB                       ; $5CAF: $C2 $DB $65

    ld   hl, $C460                                ; $5CB2: $21 $60 $C4
    add  hl, bc                                   ; $5CB5: $09
    ld   [hl], $FF                                ; $5CB6: $36 $FF
    ld   hl, $C4E0                                ; $5CB8: $21 $E0 $C4
    add  hl, bc                                   ; $5CBB: $09
    ld   [hl], $3C                                ; $5CBC: $36 $3C

jr_006_5CBE:
    ld   hl, $C380                                ; $5CBE: $21 $80 $C3
    add  hl, bc                                   ; $5CC1: $09
    ld   a, [hl]                                  ; $5CC2: $7E
    and  a                                        ; $5CC3: $A7
    jr   nz, jr_006_5CCC                          ; $5CC4: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]               ; $5CC6: $F0 $F1
    add  $02                                      ; $5CC8: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a               ; $5CCA: $E0 $F1

jr_006_5CCC:
    ld   de, $5C89                                ; $5CCC: $11 $89 $5C
    call RenderAnimatedActiveEntity                               ; $5CCF: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $5CD2: $F0 $F0
    and  a                                        ; $5CD4: $A7
    jr   nz, jr_006_5CE5                          ; $5CD5: $20 $0E

    ld   hl, wEntitiesPosYTable                         ; $5CD7: $21 $10 $C2
    add  hl, bc                                   ; $5CDA: $09
    ld   a, [hl]                                  ; $5CDB: $7E
    sub  $04                                      ; $5CDC: $D6 $04
    ld   [hl], a                                  ; $5CDE: $77
    call IncrementEntityWalkingAttr               ; $5CDF: $CD $12 $3B
    ld   a, [hl]                                  ; $5CE2: $7E
    ldh  [hActiveEntityState], a                  ; $5CE3: $E0 $F0

jr_006_5CE5:
    call func_006_64C6                            ; $5CE5: $CD $C6 $64
    call func_006_64F7                            ; $5CE8: $CD $F7 $64
    ldh  a, [hActiveEntityState]                  ; $5CEB: $F0 $F0
    dec  a                                        ; $5CED: $3D
    rst  $00                                      ; $5CEE: $C7
    rst  $30                                      ; $5CEF: $F7
    ld   e, h                                     ; $5CF0: $5C
    xor  l                                        ; $5CF1: $AD
    ld   e, l                                     ; $5CF2: $5D
    ret  z                                        ; $5CF3: $C8

    ld   e, l                                     ; $5CF4: $5D
    rla                                           ; $5CF5: $17
    ld   e, [hl]                                  ; $5CF6: $5E
    ldh  a, [hMapRoom]                            ; $5CF7: $F0 $F6
    cp   $58                                      ; $5CF9: $FE $58
    jp   nz, label_006_5D8A                       ; $5CFB: $C2 $8A $5D

    ld   hl, wEntitiesPosXTable                         ; $5CFE: $21 $00 $C2
    add  hl, bc                                   ; $5D01: $09
    ld   a, [hl]                                  ; $5D02: $7E
    ldh  [hScratch0], a                           ; $5D03: $E0 $D7
    ld   hl, wEntitiesPosYTable                         ; $5D05: $21 $10 $C2
    add  hl, bc                                   ; $5D08: $09
    ld   a, [hl]                                  ; $5D09: $7E
    ldh  [hScratch1], a                           ; $5D0A: $E0 $D8
    ld   de, $0000                                ; $5D0C: $11 $00 $00

jr_006_5D0F:
    ld   hl, wEntitiesTypeTable                   ; $5D0F: $21 $A0 $C3
    add  hl, de                                   ; $5D12: $19
    ld   a, [hl]                                  ; $5D13: $7E
    cp   $02                                      ; $5D14: $FE $02
    jr   nz, jr_006_5D4F                          ; $5D16: $20 $37

    ld   hl, $C420                                ; $5D18: $21 $20 $C4
    add  hl, de                                   ; $5D1B: $19
    ld   a, [hl]                                  ; $5D1C: $7E
    and  a                                        ; $5D1D: $A7
    jr   z, jr_006_5D4F                           ; $5D1E: $28 $2F

    ld   hl, wEntitiesTransitionCountdownTable    ; $5D20: $21 $E0 $C2
    add  hl, de                                   ; $5D23: $19
    ld   a, [hl]                                  ; $5D24: $7E
    cp   $22                                      ; $5D25: $FE $22
    jr   nc, jr_006_5D4F                          ; $5D27: $30 $26

    ld   hl, wEntitiesPosXTable                         ; $5D29: $21 $00 $C2
    add  hl, de                                   ; $5D2C: $19
    ld   l, [hl]                                  ; $5D2D: $6E
    ldh  a, [hScratch0]                           ; $5D2E: $F0 $D7
    sub  l                                        ; $5D30: $95
    bit  7, a                                     ; $5D31: $CB $7F
    jr   z, jr_006_5D37                           ; $5D33: $28 $02

    cpl                                           ; $5D35: $2F
    inc  a                                        ; $5D36: $3C

jr_006_5D37:
    cp   $20                                      ; $5D37: $FE $20
    jr   nc, jr_006_5D4F                          ; $5D39: $30 $14

    ld   hl, wEntitiesPosYTable                         ; $5D3B: $21 $10 $C2
    add  hl, de                                   ; $5D3E: $19
    ld   l, [hl]                                  ; $5D3F: $6E
    ldh  a, [hScratch1]                           ; $5D40: $F0 $D8
    sub  l                                        ; $5D42: $95
    bit  7, a                                     ; $5D43: $CB $7F
    jr   z, jr_006_5D49                           ; $5D45: $28 $02

    cpl                                           ; $5D47: $2F
    inc  a                                        ; $5D48: $3C

jr_006_5D49:
    cp   $20                                      ; $5D49: $FE $20
    jr   nc, jr_006_5D4F                          ; $5D4B: $30 $02

    jr   jr_006_5D9F                              ; $5D4D: $18 $50

jr_006_5D4F:
    inc  de                                       ; $5D4F: $13
    ld   a, e                                     ; $5D50: $7B
    and  $0F                                      ; $5D51: $E6 $0F
    jr   nz, jr_006_5D0F                          ; $5D53: $20 $BA

    ld   a, [$C50C]                               ; $5D55: $FA $0C $C5
    ld   e, a                                     ; $5D58: $5F
    ld   d, b                                     ; $5D59: $50
    ld   hl, wEntitiesStatusTable                        ; $5D5A: $21 $80 $C2
    add  hl, de                                   ; $5D5D: $19
    ld   a, [hl]                                  ; $5D5E: $7E
    and  a                                        ; $5D5F: $A7
    ret  z                                        ; $5D60: $C8

    ld   hl, wEntitiesTypeTable                   ; $5D61: $21 $A0 $C3
    add  hl, de                                   ; $5D64: $19
    ld   a, [hl]                                  ; $5D65: $7E
    cp   $05                                      ; $5D66: $FE $05
    ret  nz                                       ; $5D68: $C0

    ld   hl, wEntitiesUnknowTableF                ; $5D69: $21 $F0 $C2
    add  hl, de                                   ; $5D6C: $19
    ld   a, [hl]                                  ; $5D6D: $7E
    and  a                                        ; $5D6E: $A7
    ret  z                                        ; $5D6F: $C8

    ld   hl, wEntitiesPosXTable                         ; $5D70: $21 $00 $C2
    add  hl, de                                   ; $5D73: $19
    ldh  a, [wActiveEntityPosX]                   ; $5D74: $F0 $EE
    sub  [hl]                                     ; $5D76: $96
    add  $10                                      ; $5D77: $C6 $10
    cp   $20                                      ; $5D79: $FE $20
    ret  nc                                       ; $5D7B: $D0

    ld   hl, wEntitiesPosYTable                         ; $5D7C: $21 $10 $C2
    add  hl, de                                   ; $5D7F: $19
    ldh  a, [wActiveEntityPosY]                   ; $5D80: $F0 $EC
    sub  [hl]                                     ; $5D82: $96
    add  $28                                      ; $5D83: $C6 $28
    cp   $50                                      ; $5D85: $FE $50
    ret  nc                                       ; $5D87: $D0

    jr   jr_006_5D9F                              ; $5D88: $18 $15

label_006_5D8A:
    call func_006_6594                            ; $5D8A: $CD $94 $65
    ld   hl, $C380                                ; $5D8D: $21 $80 $C3
    add  hl, bc                                   ; $5D90: $09
    ld   [hl], e                                  ; $5D91: $73
    add  $18                                      ; $5D92: $C6 $18
    cp   $30                                      ; $5D94: $FE $30
    ret  nc                                       ; $5D96: $D0

    call func_006_65A4                            ; $5D97: $CD $A4 $65
    add  $30                                      ; $5D9A: $C6 $30
    cp   $60                                      ; $5D9C: $FE $60
    ret  nc                                       ; $5D9E: $D0

jr_006_5D9F:
    ld   hl, $C340                                ; $5D9F: $21 $40 $C3
    add  hl, bc                                   ; $5DA2: $09
    ld   [hl], $12                                ; $5DA3: $36 $12
    call GetEntityTransitionCountdown             ; $5DA5: $CD $05 $0C
    ld   [hl], $22                                ; $5DA8: $36 $22
    jp   IncrementEntityWalkingAttr               ; $5DAA: $C3 $12 $3B

    call label_3B39                               ; $5DAD: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $5DB0: $CD $05 $0C
    jr   nz, jr_006_5DBA                          ; $5DB3: $20 $05

    ld   [hl], $30                                ; $5DB5: $36 $30
    jp   IncrementEntityWalkingAttr               ; $5DB7: $C3 $12 $3B

jr_006_5DBA:
    call label_3D7F                               ; $5DBA: $CD $7F $3D
    ld   hl, wEntitiesSpeedZTable                 ; $5DBD: $21 $20 $C3
    add  hl, bc                                   ; $5DC0: $09
    ld   [hl], $08                                ; $5DC1: $36 $08
    call func_006_657A                            ; $5DC3: $CD $7A $65
    jr   jr_006_5E08                              ; $5DC6: $18 $40

    call label_3B39                               ; $5DC8: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $5DCB: $CD $05 $0C
    jp   z, IncrementEntityWalkingAttr            ; $5DCE: $CA $12 $3B

    and  $01                                      ; $5DD1: $E6 $01
    jr   nz, jr_006_5E02                          ; $5DD3: $20 $2D

    ld   a, $20                                   ; $5DD5: $3E $20
    call label_3BB5                               ; $5DD7: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $5DDA: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                       ; $5DDC: $21 $50 $C2
    add  hl, bc                                   ; $5DDF: $09
    sub  [hl]                                     ; $5DE0: $96
    and  $80                                      ; $5DE1: $E6 $80
    jr   nz, jr_006_5DE7                          ; $5DE3: $20 $02

    inc  [hl]                                     ; $5DE5: $34
    inc  [hl]                                     ; $5DE6: $34

jr_006_5DE7:
    dec  [hl]                                     ; $5DE7: $35
    ldh  a, [hScratch1]                           ; $5DE8: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                       ; $5DEA: $21 $40 $C2
    add  hl, bc                                   ; $5DED: $09
    sub  [hl]                                     ; $5DEE: $96
    and  $80                                      ; $5DEF: $E6 $80
    jr   nz, jr_006_5DF5                          ; $5DF1: $20 $02

    inc  [hl]                                     ; $5DF3: $34
    inc  [hl]                                     ; $5DF4: $34

jr_006_5DF5:
    dec  [hl]                                     ; $5DF5: $35
    ld   hl, wEntitiesSpeedXTable                       ; $5DF6: $21 $40 $C2
    add  hl, bc                                   ; $5DF9: $09
    ld   a, [hl]                                  ; $5DFA: $7E
    and  $80                                      ; $5DFB: $E6 $80
    ld   hl, $C380                                ; $5DFD: $21 $80 $C3
    add  hl, bc                                   ; $5E00: $09
    ld   [hl], a                                  ; $5E01: $77

func_006_5E02:
jr_006_5E02:
    call func_006_6541                            ; $5E02: $CD $41 $65
    call func_006_5E14                            ; $5E05: $CD $14 $5E

jr_006_5E08:
    call func_006_5E14                            ; $5E08: $CD $14 $5E
    ld   a, [hl]                                  ; $5E0B: $7E
    rra                                           ; $5E0C: $1F
    rra                                           ; $5E0D: $1F
    rra                                           ; $5E0E: $1F
    and  $01                                      ; $5E0F: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5E11: $C3 $0C $3B

func_006_5E14:
    jp   PlayBoomerangSfx_trampoline               ; $5E14: $C3 $F8 $29

    call label_3B39                               ; $5E17: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $5E1A: $F0 $E7
    and  $03                                      ; $5E1C: $E6 $03
    jr   nz, jr_006_5E51                          ; $5E1E: $20 $31

    ld   a, $20                                   ; $5E20: $3E $20
    call label_3BB5                               ; $5E22: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $5E25: $F0 $D7
    cpl                                           ; $5E27: $2F
    inc  a                                        ; $5E28: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $5E29: $21 $50 $C2
    add  hl, bc                                   ; $5E2C: $09
    sub  [hl]                                     ; $5E2D: $96
    and  $80                                      ; $5E2E: $E6 $80
    jr   nz, jr_006_5E34                          ; $5E30: $20 $02

    inc  [hl]                                     ; $5E32: $34
    inc  [hl]                                     ; $5E33: $34

jr_006_5E34:
    dec  [hl]                                     ; $5E34: $35
    ldh  a, [hScratch1]                           ; $5E35: $F0 $D8
    cpl                                           ; $5E37: $2F
    inc  a                                        ; $5E38: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $5E39: $21 $40 $C2
    add  hl, bc                                   ; $5E3C: $09
    sub  [hl]                                     ; $5E3D: $96
    and  $80                                      ; $5E3E: $E6 $80
    jr   nz, jr_006_5E44                          ; $5E40: $20 $02

    inc  [hl]                                     ; $5E42: $34
    inc  [hl]                                     ; $5E43: $34

jr_006_5E44:
    dec  [hl]                                     ; $5E44: $35
    ld   hl, wEntitiesSpeedXTable                       ; $5E45: $21 $40 $C2
    add  hl, bc                                   ; $5E48: $09
    ld   a, [hl]                                  ; $5E49: $7E
    and  $80                                      ; $5E4A: $E6 $80
    ld   hl, $C380                                ; $5E4C: $21 $80 $C3
    add  hl, bc                                   ; $5E4F: $09
    ld   [hl], a                                  ; $5E50: $77

jr_006_5E51:
    call func_006_5E02                            ; $5E51: $CD $02 $5E

func_006_5E54:
label_006_5E54:
    ldh  a, [wActiveEntityPosY]                   ; $5E54: $F0 $EC
    cp   $88                                      ; $5E56: $FE $88
    jp   nc, label_006_65DB                       ; $5E58: $D2 $DB $65

    ldh  a, [wActiveEntityPosX]                   ; $5E5B: $F0 $EE
    cp   $A8                                      ; $5E5D: $FE $A8
    jp   nc, label_006_65DB                       ; $5E5F: $D2 $DB $65

    ret                                           ; $5E62: $C9

    nop                                           ; $5E63: $00
    nop                                           ; $5E64: $00
    ld   h, h                                     ; $5E65: $64
    ld   [bc], a                                  ; $5E66: $02
    nop                                           ; $5E67: $00
    ld   [$0266], sp                              ; $5E68: $08 $66 $02
    stop                                          ; $5E6B: $10 $00
    ld   l, b                                     ; $5E6D: $68
    ld   [bc], a                                  ; $5E6E: $02
    db   $10                                      ; $5E6F: $10
    ld   [$026A], sp                              ; $5E70: $08 $6A $02
    nop                                           ; $5E73: $00
    nop                                           ; $5E74: $00
    ld   h, b                                     ; $5E75: $60
    ld   [bc], a                                  ; $5E76: $02
    nop                                           ; $5E77: $00
    ld   [$0262], sp                              ; $5E78: $08 $62 $02
    stop                                          ; $5E7B: $10 $00
    ld   l, b                                     ; $5E7D: $68
    ld   [bc], a                                  ; $5E7E: $02
    db   $10                                      ; $5E7F: $10
    ld   [$026A], sp                              ; $5E80: $08 $6A $02
    nop                                           ; $5E83: $00
    nop                                           ; $5E84: $00
    ld   h, [hl]                                  ; $5E85: $66
    ld   [hl+], a                                 ; $5E86: $22
    nop                                           ; $5E87: $00
    ld   [$2264], sp                              ; $5E88: $08 $64 $22
    stop                                          ; $5E8B: $10 $00
    ld   l, d                                     ; $5E8D: $6A
    ld   [hl+], a                                 ; $5E8E: $22
    db   $10                                      ; $5E8F: $10
    ld   [$2268], sp                              ; $5E90: $08 $68 $22
    and  b                                        ; $5E93: $A0
    inc  d                                        ; $5E94: $14
    push bc                                       ; $5E95: $C5
    sla  c                                        ; $5E96: $CB $21
    sla  c                                        ; $5E98: $CB $21
    ld   hl, $D580                                ; $5E9A: $21 $80 $D5
    add  hl, bc                                   ; $5E9D: $09
    inc  hl                                       ; $5E9E: $23
    inc  hl                                       ; $5E9F: $23
    inc  hl                                       ; $5EA0: $23
    ld   a, $0A                                   ; $5EA1: $3E $0A
    ld   [hl], a                                  ; $5EA3: $77
    pop  bc                                       ; $5EA4: $C1
    ld   hl, wEntitiesPosYTable                         ; $5EA5: $21 $10 $C2
    add  hl, bc                                   ; $5EA8: $09
    ld   a, $28                                   ; $5EA9: $3E $28
    ld   [hl], a                                  ; $5EAB: $77
    call GetEntityTransitionCountdown             ; $5EAC: $CD $05 $0C
    jr   z, jr_006_5EDE                           ; $5EAF: $28 $2D

    ldh  a, [hLinkPositionX]                      ; $5EB1: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $5EB3: $E0 $EE
    ld   a, [$C145]                               ; $5EB5: $FA $45 $C1
    sub  $10                                      ; $5EB8: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $5EBA: $E0 $EC
    ld   a, $6C                                   ; $5EBC: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $5EBE: $E0 $9D
    ld   a, $02                                   ; $5EC0: $3E $02
    ldh  [$FFA1], a                               ; $5EC2: $E0 $A1
    ld   a, $03                                   ; $5EC4: $3E $03
    ldh  [hLinkDirection], a                      ; $5EC6: $E0 $9E
    xor  a                                        ; $5EC8: $AF
    ld   [wSwordAnimationState], a                ; $5EC9: $EA $37 $C1
    ld   [wC16A], a                               ; $5ECC: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $5ECF: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $5ED2: $EA $21 $C1
    ld   de, $5E93                                ; $5ED5: $11 $93 $5E
    call RenderSimpleEntityWithSpriteVariantToOAM ; $5ED8: $CD $77 $3C
    call label_3D8A                               ; $5EDB: $CD $8A $3D

jr_006_5EDE:
    ld   e, $00                                   ; $5EDE: $1E $00
    ldh  a, [hLinkPositionX]                      ; $5EE0: $F0 $98
    cp   $30                                      ; $5EE2: $FE $30
    jr   c, jr_006_5EEE                           ; $5EE4: $38 $08

    ld   e, $01                                   ; $5EE6: $1E $01
    cp   $60                                      ; $5EE8: $FE $60
    jr   c, jr_006_5EEE                           ; $5EEA: $38 $02

    ld   e, $02                                   ; $5EEC: $1E $02

jr_006_5EEE:
    ld   a, e                                     ; $5EEE: $7B
    ldh  [hActiveEntitySpriteVariant], a               ; $5EEF: $E0 $F1
    rla                                           ; $5EF1: $17
    rla                                           ; $5EF2: $17
    rla                                           ; $5EF3: $17
    rla                                           ; $5EF4: $17
    and  $F0                                      ; $5EF5: $E6 $F0
    ld   e, a                                     ; $5EF7: $5F
    ld   d, b                                     ; $5EF8: $50
    ld   hl, $5E63                                ; $5EF9: $21 $63 $5E
    add  hl, de                                   ; $5EFC: $19
    ldh  a, [wActiveEntityPosY]                   ; $5EFD: $F0 $EC
    sub  $04                                      ; $5EFF: $D6 $04
    ldh  [wActiveEntityPosY], a                   ; $5F01: $E0 $EC
    ld   c, $04                                   ; $5F03: $0E $04
    call label_3CE6                               ; $5F05: $CD $E6 $3C
    ld   a, $04                                   ; $5F08: $3E $04
    call label_3DA0                               ; $5F0A: $CD $A0 $3D
    call label_3D8A                               ; $5F0D: $CD $8A $3D
    call func_006_64C6                            ; $5F10: $CD $C6 $64
    call func_006_641A                            ; $5F13: $CD $1A $64
    ldh  a, [hActiveEntityState]                  ; $5F16: $F0 $F0
    rst  $00                                      ; $5F18: $C7
    jr   nc, @+$61                                ; $5F19: $30 $5F

    ld   d, h                                     ; $5F1B: $54
    ld   e, a                                     ; $5F1C: $5F
    sub  c                                        ; $5F1D: $91
    ld   e, a                                     ; $5F1E: $5F
    inc  e                                        ; $5F1F: $1C
    ld   h, b                                     ; $5F20: $60
    dec  h                                        ; $5F21: $25
    ld   h, b                                     ; $5F22: $60

func_006_5F23:
    ldh  a, [hLinkPositionY]                      ; $5F23: $F0 $99
    ld   hl, $FFEF                                ; $5F25: $21 $EF $FF
    sub  [hl]                                     ; $5F28: $96
    add  $28                                      ; $5F29: $C6 $28
    cp   $50                                      ; $5F2B: $FE $50
    jp   label_006_647E                           ; $5F2D: $C3 $7E $64

    call func_006_5F23                            ; $5F30: $CD $23 $5F
    ret  nc                                       ; $5F33: $D0

    ld   a, $17                                   ; $5F34: $3E $17
    call OpenDialog                               ; $5F36: $CD $85 $23
    ld   hl, wDialogState                         ; $5F39: $21 $9F $C1
    set  7, [hl]                                  ; $5F3C: $CB $FE
    ld   a, [wPieceOfPowerKillCount]              ; $5F3E: $FA $15 $D4
    and  $01                                      ; $5F41: $E6 $01
    ld   hl, wEntitiesUnknownTableB               ; $5F43: $21 $B0 $C2
    add  hl, bc                                   ; $5F46: $09
    ld   [hl], a                                  ; $5F47: $77
    ld   a, [$DB75]                               ; $5F48: $FA $75 $DB
    cp   $07                                      ; $5F4B: $FE $07
    jr   nz, jr_006_5F51                          ; $5F4D: $20 $02

    inc  [hl]                                     ; $5F4F: $34
    inc  [hl]                                     ; $5F50: $34

jr_006_5F51:
    jp   IncrementEntityWalkingAttr               ; $5F51: $C3 $12 $3B

    call func_006_5F23                            ; $5F54: $CD $23 $5F
    ret  nc                                       ; $5F57: $D0

    ld   a, [wHasMedicine]                        ; $5F58: $FA $0D $DB
    and  a                                        ; $5F5B: $A7
    jr   nz, jr_006_5F76                          ; $5F5C: $20 $18

    ld   hl, wEntitiesUnknownTableB               ; $5F5E: $21 $B0 $C2
    add  hl, bc                                   ; $5F61: $09
    ld   a, [hl]                                  ; $5F62: $7E
    and  $01                                      ; $5F63: $E6 $01
    ld   a, $18                                   ; $5F65: $3E $18
    jr   z, jr_006_5F6B                           ; $5F67: $28 $02

    ld   a, $19                                   ; $5F69: $3E $19

jr_006_5F6B:
    call OpenDialog                               ; $5F6B: $CD $85 $23
    ld   hl, wDialogState                         ; $5F6E: $21 $9F $C1
    set  7, [hl]                                  ; $5F71: $CB $FE
    jp   IncrementEntityWalkingAttr               ; $5F73: $C3 $12 $3B

jr_006_5F76:
    ld   a, $1C                                   ; $5F76: $3E $1C
    call OpenDialog                               ; $5F78: $CD $85 $23
    ld   hl, wDialogState                         ; $5F7B: $21 $9F $C1
    set  7, [hl]                                  ; $5F7E: $CB $FE
    ret                                           ; $5F80: $C9

    jr   z, @+$44                                 ; $5F81: $28 $42

    rlca                                          ; $5F83: $07
    rlca                                          ; $5F84: $07
    nop                                           ; $5F85: $00
    nop                                           ; $5F86: $00
    nop                                           ; $5F87: $00
    nop                                           ; $5F88: $00
    inc  e                                        ; $5F89: $1C
    ld   a, [hl+]                                 ; $5F8A: $2A
    rlca                                          ; $5F8B: $07
    rlca                                          ; $5F8C: $07
    nop                                           ; $5F8D: $00
    nop                                           ; $5F8E: $00
    nop                                           ; $5F8F: $00
    nop                                           ; $5F90: $00
    ld   a, [wDialogState]                        ; $5F91: $FA $9F $C1
    and  a                                        ; $5F94: $A7
    jp   nz, label_006_601B                       ; $5F95: $C2 $1B $60

    ld   a, [wC177]                               ; $5F98: $FA $77 $C1
    and  a                                        ; $5F9B: $A7
    jr   nz, jr_006_600D                          ; $5F9C: $20 $6F

    ld   hl, wEntitiesUnknownTableB               ; $5F9E: $21 $B0 $C2
    add  hl, bc                                   ; $5FA1: $09
    ld   e, [hl]                                  ; $5FA2: $5E
    ld   d, b                                     ; $5FA3: $50
    ld   hl, $5F85                                ; $5FA4: $21 $85 $5F
    add  hl, de                                   ; $5FA7: $19
    ld   a, [hl]                                  ; $5FA8: $7E
    ld   hl, $5F81                                ; $5FA9: $21 $81 $5F
    add  hl, de                                   ; $5FAC: $19
    ld   e, [hl]                                  ; $5FAD: $5E
    ld   d, a                                     ; $5FAE: $57
    ld   a, [wRupeeCountLow]                      ; $5FAF: $FA $5E $DB
    sub  e                                        ; $5FB2: $93
    ld   a, [wRupeeCountHigh]                     ; $5FB3: $FA $5D $DB
    sbc  d                                        ; $5FB6: $9A
    jr   nc, jr_006_5FBD                          ; $5FB7: $30 $04

    ld   a, $1B                                   ; $5FB9: $3E $1B
    jr   jr_006_600F                              ; $5FBB: $18 $52

jr_006_5FBD:
    ld   a, [$DB75]                               ; $5FBD: $FA $75 $DB
    inc  a                                        ; $5FC0: $3C
    and  $07                                      ; $5FC1: $E6 $07
    ld   [$DB75], a                               ; $5FC3: $EA $75 $DB
    jr   nz, jr_006_5FD5                          ; $5FC6: $20 $0D

    ld   a, $1E                                   ; $5FC8: $3E $1E
    call OpenDialog                               ; $5FCA: $CD $85 $23
    ld   hl, wDialogState                         ; $5FCD: $21 $9F $C1
    set  7, [hl]                                  ; $5FD0: $CB $FE
    jp   IncrementEntityWalkingAttr               ; $5FD2: $C3 $12 $3B

jr_006_5FD5:
    ld   hl, wEntitiesUnknownTableB               ; $5FD5: $21 $B0 $C2
    add  hl, bc                                   ; $5FD8: $09
    ld   e, [hl]                                  ; $5FD9: $5E
    ld   d, b                                     ; $5FDA: $50
    ld   hl, $5F89                                ; $5FDB: $21 $89 $5F
    add  hl, de                                   ; $5FDE: $19
    ld   a, [wSubstractRupeeBufferHigh]           ; $5FDF: $FA $92 $DB
    add  [hl]                                     ; $5FE2: $86
    ld   [wSubstractRupeeBufferHigh], a           ; $5FE3: $EA $92 $DB
    rl   a                                        ; $5FE6: $CB $17
    ld   hl, $5F8D                                ; $5FE8: $21 $8D $5F
    add  hl, de                                   ; $5FEB: $19
    rr   a                                        ; $5FEC: $CB $1F
    ld   a, [wAddRupeeBufferLow]                  ; $5FEE: $FA $91 $DB
    adc  [hl]                                     ; $5FF1: $8E
    ld   [wAddRupeeBufferLow], a                  ; $5FF2: $EA $91 $DB
    ld   hl, wHasMedicine                         ; $5FF5: $21 $0D $DB
    inc  [hl]                                     ; $5FF8: $34
    ld   a, $1A                                   ; $5FF9: $3E $1A
    call func_006_600F                            ; $5FFB: $CD $0F $60
    call IncrementEntityWalkingAttr               ; $5FFE: $CD $12 $3B
    ld   [hl], $04                                ; $6001: $36 $04
    call GetEntityTransitionCountdown             ; $6003: $CD $05 $0C
    ld   [hl], $20                                ; $6006: $36 $20
    ld   a, $01                                   ; $6008: $3E $01
    ldh  [hJingle], a                             ; $600A: $E0 $F2
    ret                                           ; $600C: $C9

jr_006_600D:
    ld   a, $1D                                   ; $600D: $3E $1D

func_006_600F:
jr_006_600F:
    call OpenDialog                               ; $600F: $CD $85 $23
    ld   hl, wDialogState                         ; $6012: $21 $9F $C1
    set  7, [hl]                                  ; $6015: $CB $FE
    call IncrementEntityWalkingAttr               ; $6017: $CD $12 $3B
    ld   [hl], b                                  ; $601A: $70

label_006_601B:
    ret                                           ; $601B: $C9

    ld   a, [wDialogState]                        ; $601C: $FA $9F $C1
    and  a                                        ; $601F: $A7
    jr   nz, jr_006_6024                          ; $6020: $20 $02

    jr   jr_006_5FD5                              ; $6022: $18 $B1

jr_006_6024:
    ret                                           ; $6024: $C9

    call GetEntityTransitionCountdown             ; $6025: $CD $05 $0C
    ret  nz                                       ; $6028: $C0

    ld   a, [wDialogState]                        ; $6029: $FA $9F $C1
    and  a                                        ; $602C: $A7
    jr   nz, jr_006_6048                          ; $602D: $20 $19

    ld   a, [$C5A9]                               ; $602F: $FA $A9 $C5
    and  a                                        ; $6032: $A7
    jr   nz, jr_006_6044                          ; $6033: $20 $0F

    ld   a, $FF                                   ; $6035: $3E $FF
    ld   [wSubstractRupeeBufferLow], a            ; $6037: $EA $93 $DB
    ld   a, $9A                                   ; $603A: $3E $9A
    call OpenDialogInTable1                       ; $603C: $CD $73 $23
    ld   hl, wDialogState                         ; $603F: $21 $9F $C1
    set  7, [hl]                                  ; $6042: $CB $FE

jr_006_6044:
    call IncrementEntityWalkingAttr               ; $6044: $CD $12 $3B
    ld   [hl], b                                  ; $6047: $70

jr_006_6048:
    ld   a, $02                                   ; $6048: $3E $02
    ldh  [$FFA1], a                               ; $604A: $E0 $A1
    ret                                           ; $604C: $C9

    ld   [hl], b                                  ; $604D: $70
    nop                                           ; $604E: $00
    ld   [hl], d                                  ; $604F: $72
    nop                                           ; $6050: $00
    ld   [hl], d                                  ; $6051: $72
    jr   nz, jr_006_60C4                          ; $6052: $20 $70

    jr   nz, @+$76                                ; $6054: $20 $74

    nop                                           ; $6056: $00
    halt                                          ; $6057: $76 $00
    db   $76                                      ; $6059: $76
    jr   nz, jr_006_60D0                          ; $605A: $20 $74

    jr   nz, jr_006_60CE                          ; $605C: $20 $70

    ld   [bc], a                                  ; $605E: $02
    ld   [hl], d                                  ; $605F: $72
    ld   [bc], a                                  ; $6060: $02
    ld   [hl], d                                  ; $6061: $72
    ld   [hl+], a                                 ; $6062: $22
    ld   [hl], b                                  ; $6063: $70
    ld   [hl+], a                                 ; $6064: $22
    ld   [hl], h                                  ; $6065: $74
    ld   [bc], a                                  ; $6066: $02
    db   $76                                      ; $6067: $76
    ld   [bc], a                                  ; $6068: $02
    db   $76                                      ; $6069: $76
    ld   [hl+], a                                 ; $606A: $22
    ld   [hl], h                                  ; $606B: $74
    ld   [hl+], a                                 ; $606C: $22
    ld   a, b                                     ; $606D: $78
    ld   [bc], a                                  ; $606E: $02
    ld   a, d                                     ; $606F: $7A
    ld   [bc], a                                  ; $6070: $02
    ld   a, h                                     ; $6071: $7C
    ld   [bc], a                                  ; $6072: $02
    ld   a, [hl]                                  ; $6073: $7E
    ld   [bc], a                                  ; $6074: $02
    ld   a, d                                     ; $6075: $7A
    jr   nz, jr_006_60F0                          ; $6076: $20 $78

    jr   nz, @+$80                                ; $6078: $20 $7E

    jr   nz, @+$7E                                ; $607A: $20 $7C

    jr   nz, jr_006_60BC                          ; $607C: $20 $3E

    nop                                           ; $607E: $00
    ld   hl, wEntitiesUnknownTableB               ; $607F: $21 $B0 $C2
    add  hl, bc                                   ; $6082: $09
    ld   a, [hl]                                  ; $6083: $7E
    and  a                                        ; $6084: $A7
    jr   z, jr_006_60A2                           ; $6085: $28 $1B

    ld   de, $607D                                ; $6087: $11 $7D $60
    call RenderSimpleEntityWithSpriteVariantToOAM ; $608A: $CD $77 $3C
    call func_006_64C6                            ; $608D: $CD $C6 $64
    call func_006_6541                            ; $6090: $CD $41 $65
    call func_006_657A                            ; $6093: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6096: $21 $20 $C3
    add  hl, bc                                   ; $6099: $09
    dec  [hl]                                     ; $609A: $35
    call GetEntityTransitionCountdown             ; $609B: $CD $05 $0C
    jp   z, label_006_65DB                        ; $609E: $CA $DB $65

    ret                                           ; $60A1: $C9

jr_006_60A2:
    ld   a, [wIsBowWowFollowingLink]              ; $60A2: $FA $56 $DB
    cp   $80                                      ; $60A5: $FE $80
    jp   nz, label_006_6170                       ; $60A7: $C2 $70 $61

    ld   a, [wGameplayType]                       ; $60AA: $FA $95 $DB
    cp   $01                                      ; $60AD: $FE $01
    jp   z, label_006_6170                        ; $60AF: $CA $70 $61

    ld   de, $604D                                ; $60B2: $11 $4D $60
    ld   hl, wEntitiesTypeTable                   ; $60B5: $21 $A0 $C3
    add  hl, bc                                   ; $60B8: $09
    ld   a, [hl]                                  ; $60B9: $7E
    cp   $72                                      ; $60BA: $FE $72

jr_006_60BC:
    jr   nz, jr_006_60C1                          ; $60BC: $20 $03

    ld   de, $605D                                ; $60BE: $11 $5D $60

jr_006_60C1:
    call RenderAnimatedActiveEntity                               ; $60C1: $CD $C0 $3B

jr_006_60C4:
    call func_006_65A4                            ; $60C4: $CD $A4 $65
    ld   a, e                                     ; $60C7: $7B
    dec  a                                        ; $60C8: $3D
    and  $02                                      ; $60C9: $E6 $02
    xor  $02                                      ; $60CB: $EE $02
    ld   e, a                                     ; $60CD: $5F

jr_006_60CE:
    ldh  a, [hFrameCounter]                       ; $60CE: $F0 $E7

jr_006_60D0:
    rra                                           ; $60D0: $1F
    rra                                           ; $60D1: $1F
    rra                                           ; $60D2: $1F
    and  $01                                      ; $60D3: $E6 $01
    add  e                                        ; $60D5: $83
    call SetEntitySpriteVariant                   ; $60D6: $CD $0C $3B
    ld   hl, wEntitiesUnknownTableD               ; $60D9: $21 $D0 $C2
    add  hl, bc                                   ; $60DC: $09
    ld   a, [hl]                                  ; $60DD: $7E
    rst  $00                                      ; $60DE: $C7
    push hl                                       ; $60DF: $E5
    ld   h, b                                     ; $60E0: $60
    db   $FD                                      ; $60E1: $FD
    ld   h, b                                     ; $60E2: $60
    inc  [hl]                                     ; $60E3: $34
    ld   h, c                                     ; $60E4: $61
    call func_006_64C6                            ; $60E5: $CD $C6 $64
    ld   hl, wEntitiesUnknownTableC               ; $60E8: $21 $C0 $C2
    add  hl, bc                                   ; $60EB: $09
    ld   [hl], $30                                ; $60EC: $36 $30
    ld   a, $0E                                   ; $60EE: $3E $0E

jr_006_60F0:
    ld   [wActiveMusicTrack], a                   ; $60F0: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $60F3: $E0 $B0
    ldh  [$FFBD], a                               ; $60F5: $E0 $BD

label_006_60F7:
    ld   hl, wEntitiesUnknownTableD               ; $60F7: $21 $D0 $C2
    add  hl, bc                                   ; $60FA: $09
    inc  [hl]                                     ; $60FB: $34
    ret                                           ; $60FC: $C9

    call func_006_64C6                            ; $60FD: $CD $C6 $64
    call func_006_65A4                            ; $6100: $CD $A4 $65
    add  $20                                      ; $6103: $C6 $20
    cp   $40                                      ; $6105: $FE $40
    jr   c, jr_006_6110                           ; $6107: $38 $07

    ld   hl, wEntitiesUnknownTableC               ; $6109: $21 $C0 $C2
    add  hl, bc                                   ; $610C: $09
    dec  [hl]                                     ; $610D: $35
    jr   nz, jr_006_6124                          ; $610E: $20 $14

jr_006_6110:
    ld   a, [wTransitionSequenceCounter]          ; $6110: $FA $6B $C1
    cp   $04                                      ; $6113: $FE $04
    ret  nz                                       ; $6115: $C0

    ldh  a, [hActiveEntityType]                   ; $6116: $F0 $EB
    cp   $71                                      ; $6118: $FE $71
    jr   nz, jr_006_6121                          ; $611A: $20 $05

    ld   a, $20                                   ; $611C: $3E $20
    call OpenDialogInTable2                       ; $611E: $CD $7C $23

jr_006_6121:
    jp   label_006_60F7                           ; $6121: $C3 $F7 $60

jr_006_6124:
    ld   a, $08                                   ; $6124: $3E $08
    call label_3BAA                               ; $6126: $CD $AA $3B
    call func_006_6541                            ; $6129: $CD $41 $65
    ld   a, $02                                   ; $612C: $3E $02
    ldh  [$FFA1], a                               ; $612E: $E0 $A1
    ld   [wC167], a                               ; $6130: $EA $67 $C1
    ret                                           ; $6133: $C9

    xor  a                                        ; $6134: $AF
    ld   [wC167], a                               ; $6135: $EA $67 $C1
    ldh  a, [$FFEF]                               ; $6138: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $613A: $E0 $EC
    call func_006_641A                            ; $613C: $CD $1A $64
    call label_3D8A                               ; $613F: $CD $8A $3D
    call func_006_645D                            ; $6142: $CD $5D $64
    jr   nc, jr_006_614C                          ; $6145: $30 $05

    ld   a, $20                                   ; $6147: $3E $20
    call OpenDialogInTable2                       ; $6149: $CD $7C $23

jr_006_614C:
    call func_006_657A                            ; $614C: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $614F: $21 $20 $C3
    add  hl, bc                                   ; $6152: $09
    dec  [hl]                                     ; $6153: $35
    dec  [hl]                                     ; $6154: $35
    ld   hl, wEntitiesPosZTable                   ; $6155: $21 $10 $C3
    add  hl, bc                                   ; $6158: $09
    ld   a, [hl]                                  ; $6159: $7E
    and  a                                        ; $615A: $A7
    jr   z, jr_006_6161                           ; $615B: $28 $04

    and  $80                                      ; $615D: $E6 $80
    jr   z, jr_006_616F                           ; $615F: $28 $0E

jr_006_6161:
    ld   [hl], b                                  ; $6161: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6162: $21 $20 $C3
    add  hl, bc                                   ; $6165: $09
    ld   [hl], b                                  ; $6166: $70
    ldh  a, [hFrameCounter]                       ; $6167: $F0 $E7
    and  $1F                                      ; $6169: $E6 $1F
    jr   nz, jr_006_616F                          ; $616B: $20 $02

    ld   [hl], $10                                ; $616D: $36 $10

jr_006_616F:
    ret                                           ; $616F: $C9

label_006_6170:
    ld   hl, $C380                                ; $6170: $21 $80 $C3
    add  hl, bc                                   ; $6173: $09
    ldh  a, [hActiveEntitySpriteVariant]               ; $6174: $F0 $F1
    or   [hl]                                     ; $6176: $B6
    ldh  [hActiveEntitySpriteVariant], a               ; $6177: $E0 $F1
    ld   de, $606D                                ; $6179: $11 $6D $60
    call RenderAnimatedActiveEntity                               ; $617C: $CD $C0 $3B
    call func_006_64C6                            ; $617F: $CD $C6 $64
    call func_006_6230                            ; $6182: $CD $30 $62
    call func_006_657A                            ; $6185: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6188: $21 $20 $C3
    add  hl, bc                                   ; $618B: $09
    dec  [hl]                                     ; $618C: $35
    ld   hl, wEntitiesPosZTable                   ; $618D: $21 $10 $C3
    add  hl, bc                                   ; $6190: $09
    ld   a, [hl]                                  ; $6191: $7E
    and  $80                                      ; $6192: $E6 $80
    ldh  [hFFE8], a                               ; $6194: $E0 $E8
    jr   z, jr_006_619F                           ; $6196: $28 $07

    xor  a                                        ; $6198: $AF
    ld   [hl], a                                  ; $6199: $77
    ld   hl, wEntitiesSpeedZTable                 ; $619A: $21 $20 $C3
    add  hl, bc                                   ; $619D: $09
    ld   [hl], a                                  ; $619E: $77

jr_006_619F:
    ldh  a, [hActiveEntityState]                  ; $619F: $F0 $F0
    rst  $00                                      ; $61A1: $C7
    and  [hl]                                     ; $61A2: $A6
    ld   h, c                                     ; $61A3: $61
    db   $EC                                      ; $61A4: $EC
    ld   h, c                                     ; $61A5: $61
    call GetEntityTransitionCountdown             ; $61A6: $CD $05 $0C
    jr   nz, jr_006_61EB                          ; $61A9: $20 $40

    ld   [hl], $80                                ; $61AB: $36 $80
    call IncrementEntityWalkingAttr               ; $61AD: $CD $12 $3B
    ld   a, $01                                   ; $61B0: $3E $01
    call SetEntitySpriteVariant                   ; $61B2: $CD $0C $3B
    ld   a, $71                                   ; $61B5: $3E $71
    call func_003_64CA_trampoline                               ; $61B7: $CD $86 $3B
    jr   c, jr_006_61EB                           ; $61BA: $38 $2F

    ldh  a, [hScratch0]                           ; $61BC: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $61BE: $21 $00 $C2
    add  hl, de                                   ; $61C1: $19
    ld   [hl], a                                  ; $61C2: $77
    ldh  a, [hScratch1]                           ; $61C3: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $61C5: $21 $10 $C2
    add  hl, de                                   ; $61C8: $19
    ld   [hl], a                                  ; $61C9: $77
    ld   hl, wEntitiesUnknownTableB               ; $61CA: $21 $B0 $C2
    add  hl, de                                   ; $61CD: $19
    ld   [hl], $01                                ; $61CE: $36 $01
    ld   hl, wEntitiesSpeedZTable                 ; $61D0: $21 $20 $C3
    add  hl, de                                   ; $61D3: $19
    ld   [hl], $10                                ; $61D4: $36 $10
    ldh  a, [hActiveEntityType]                   ; $61D6: $F0 $EB
    cp   $71                                      ; $61D8: $FE $71
    ld   a, $14                                   ; $61DA: $3E $14
    jr   z, jr_006_61E0                           ; $61DC: $28 $02

    ld   a, $EC                                   ; $61DE: $3E $EC

jr_006_61E0:
    ld   hl, wEntitiesSpeedXTable                       ; $61E0: $21 $40 $C2
    add  hl, de                                   ; $61E3: $19
    ld   [hl], a                                  ; $61E4: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $61E5: $21 $E0 $C2
    add  hl, de                                   ; $61E8: $19
    ld   [hl], $24                                ; $61E9: $36 $24

jr_006_61EB:
    ret                                           ; $61EB: $C9

    call GetEntityTransitionCountdown             ; $61EC: $CD $05 $0C
    jr   nz, jr_006_61F8                          ; $61EF: $20 $07

    ld   [hl], $60                                ; $61F1: $36 $60
    call IncrementEntityWalkingAttr               ; $61F3: $CD $12 $3B
    ld   [hl], b                                  ; $61F6: $70
    ret                                           ; $61F7: $C9

jr_006_61F8:
    cp   $60                                      ; $61F8: $FE $60
    ret  nc                                       ; $61FA: $D0

    cp   $40                                      ; $61FB: $FE $40
    jr   nc, jr_006_620A                          ; $61FD: $30 $0B

    ldh  a, [hFFE8]                               ; $61FF: $F0 $E8
    and  a                                        ; $6201: $A7
    jr   z, jr_006_620A                           ; $6202: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6204: $21 $20 $C3
    add  hl, bc                                   ; $6207: $09
    ld   [hl], $08                                ; $6208: $36 $08

jr_006_620A:
    xor  a                                        ; $620A: $AF
    jp   SetEntitySpriteVariant                   ; $620B: $C3 $0C $3B

    ldh  a, [hMapRoom]                            ; $620E: $F0 $F6
    cp   $92                                      ; $6210: $FE $92
    jr   nz, jr_006_621C                          ; $6212: $20 $08

    ld   a, [wTradeSequenceItem]                  ; $6214: $FA $0E $DB
    cp   $07                                      ; $6217: $FE $07
    jp   c, label_006_65DB                        ; $6219: $DA $DB $65

jr_006_621C:
    ld   de, $604D                                ; $621C: $11 $4D $60
    call RenderAnimatedActiveEntity                               ; $621F: $CD $C0 $3B
    call func_006_64C6                            ; $6222: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $6225: $F0 $E7
    rra                                           ; $6227: $1F
    rra                                           ; $6228: $1F
    rra                                           ; $6229: $1F
    rra                                           ; $622A: $1F
    and  $01                                      ; $622B: $E6 $01
    call SetEntitySpriteVariant                   ; $622D: $CD $0C $3B

func_006_6230:
    ldh  a, [$FFEF]                               ; $6230: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $6232: $E0 $EC
    call func_006_641A                            ; $6234: $CD $1A $64
    call label_3D8A                               ; $6237: $CD $8A $3D
    call func_006_645D                            ; $623A: $CD $5D $64
    ret  nc                                       ; $623D: $D0

    ld   a, [wTradeSequenceItem]                  ; $623E: $FA $0E $DB
    cp   $0A                                      ; $6241: $FE $0A
    jr   nz, jr_006_624F                          ; $6243: $20 $0A

    ld   a, [wHasInstrument5]                     ; $6245: $FA $69 $DB
    and  $02                                      ; $6248: $E6 $02
    ld   a, $6F                                   ; $624A: $3E $6F
    jp   nz, OpenDialogInTable1                   ; $624C: $C2 $73 $23

jr_006_624F:
    ld   a, [$DB74]                               ; $624F: $FA $74 $DB
    and  a                                        ; $6252: $A7
    jr   z, jr_006_625A                           ; $6253: $28 $05

    ld   a, $23                                   ; $6255: $3E $23
    jp   OpenDialogInTable1                       ; $6257: $C3 $73 $23

jr_006_625A:
    ld   a, [wIsMarinFollowingLink]               ; $625A: $FA $73 $DB
    and  a                                        ; $625D: $A7
    jr   z, jr_006_6265                           ; $625E: $28 $05

    ld   a, $21                                   ; $6260: $3E $21
    jp   OpenDialogInTable1                       ; $6262: $C3 $73 $23

jr_006_6265:
    ldh  a, [hMapRoom]                            ; $6265: $F0 $F6
    cp   $92                                      ; $6267: $FE $92
    jr   nz, jr_006_6277                          ; $6269: $20 $0C

    ld   a, [$D8FD]                               ; $626B: $FA $FD $D8
    and  $30                                      ; $626E: $E6 $30
    jr   nz, jr_006_6277                          ; $6270: $20 $05

    ld   a, $20                                   ; $6272: $3E $20
    jp   OpenDialogInTable1                       ; $6274: $C3 $73 $23

jr_006_6277:
    ld   a, [wHasInstrument2]                     ; $6277: $FA $66 $DB
    and  $02                                      ; $627A: $E6 $02
    jr   z, jr_006_6290                           ; $627C: $28 $12

    ld   a, [$DABE]                               ; $627E: $FA $BE $DA
    and  $10                                      ; $6281: $E6 $10
    jr   nz, jr_006_6290                          ; $6283: $20 $0B

    ldh  a, [hMapRoom]                            ; $6285: $F0 $F6
    cp   $83                                      ; $6287: $FE $83
    jr   nz, jr_006_6290                          ; $6289: $20 $05

    ld   a, $22                                   ; $628B: $3E $22
    jp   OpenDialogInTable1                       ; $628D: $C3 $73 $23

jr_006_6290:
    ld   hl, $DB7E                                ; $6290: $21 $7E $DB
    ld   a, [hl]                                  ; $6293: $7E
    push af                                       ; $6294: $F5
    inc  a                                        ; $6295: $3C
    cp   $04                                      ; $6296: $FE $04
    jr   nz, jr_006_629B                          ; $6298: $20 $01

    xor  a                                        ; $629A: $AF

jr_006_629B:
    ld   [hl], a                                  ; $629B: $77
    ld   a, [wHasInstrument1]                     ; $629C: $FA $65 $DB
    and  $02                                      ; $629F: $E6 $02
    jr   nz, jr_006_62A9                          ; $62A1: $20 $06

    pop  af                                       ; $62A3: $F1
    add  $18                                      ; $62A4: $C6 $18
    jp   OpenDialogInTable1                       ; $62A6: $C3 $73 $23

jr_006_62A9:
    pop  af                                       ; $62A9: $F1
    ldh  a, [hActiveEntityType]                   ; $62AA: $F0 $EB
    sub  $70                                      ; $62AC: $D6 $70
    add  $1C                                      ; $62AE: $C6 $1C
    jp   OpenDialogInTable1                       ; $62B0: $C3 $73 $23

    call func_006_6376                            ; $62B3: $CD $76 $63
    call func_006_64C6                            ; $62B6: $CD $C6 $64
    call label_C56                                ; $62B9: $CD $56 $0C
    call label_3B70                               ; $62BC: $CD $70 $3B
    call func_006_641A                            ; $62BF: $CD $1A $64
    ldh  a, [hActiveEntityState]                  ; $62C2: $F0 $F0
    rst  $00                                      ; $62C4: $C7
    bit  4, d                                     ; $62C5: $CB $62
    db   $D3                                      ; $62C7: $D3
    ld   h, d                                     ; $62C8: $62
    and  $62                                      ; $62C9: $E6 $62
    call GetEntityTransitionCountdown             ; $62CB: $CD $05 $0C
    ld   [hl], $C0                                ; $62CE: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $62D0: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $62D3: $CD $05 $0C
    jr   nz, jr_006_62DD                          ; $62D6: $20 $05

    ld   [hl], $50                                ; $62D8: $36 $50
    call IncrementEntityWalkingAttr               ; $62DA: $CD $12 $3B

jr_006_62DD:
    rra                                           ; $62DD: $1F
    rra                                           ; $62DE: $1F
    rra                                           ; $62DF: $1F
    rra                                           ; $62E0: $1F
    and  $01                                      ; $62E1: $E6 $01
    jp   SetEntitySpriteVariant                   ; $62E3: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $62E6: $CD $05 $0C
    jr   nz, jr_006_62EF                          ; $62E9: $20 $04

    call IncrementEntityWalkingAttr               ; $62EB: $CD $12 $3B
    ld   [hl], b                                  ; $62EE: $70

jr_006_62EF:
    cp   $4A                                      ; $62EF: $FE $4A
    jr   nz, jr_006_6311                          ; $62F1: $20 $1E

    ld   a, $7D                                   ; $62F3: $3E $7D
    call func_003_64CA_trampoline                               ; $62F5: $CD $86 $3B
    jr   c, jr_006_6311                           ; $62F8: $38 $17

    ldh  a, [hScratch0]                           ; $62FA: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $62FC: $21 $00 $C2
    add  hl, de                                   ; $62FF: $19
    ld   [hl], a                                  ; $6300: $77
    ldh  a, [hScratch1]                           ; $6301: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $6303: $21 $10 $C2
    add  hl, de                                   ; $6306: $19
    ld   [hl], a                                  ; $6307: $77
    push bc                                       ; $6308: $C5
    ld   c, e                                     ; $6309: $4B
    ld   b, d                                     ; $630A: $42
    ld   a, $0C                                   ; $630B: $3E $0C
    call label_3BAA                               ; $630D: $CD $AA $3B
    pop  bc                                       ; $6310: $C1

jr_006_6311:
    ld   a, $02                                   ; $6311: $3E $02
    jp   SetEntitySpriteVariant                   ; $6313: $C3 $0C $3B

    ld   hl, sp-$08                               ; $6316: $F8 $F8
    ld   [hl], b                                  ; $6318: $70
    ld   [bc], a                                  ; $6319: $02
    ld   hl, sp+$00                               ; $631A: $F8 $00
    ld   [hl], d                                  ; $631C: $72
    ld   [bc], a                                  ; $631D: $02
    ld   hl, sp+$08                               ; $631E: $F8 $08
    ld   [hl], d                                  ; $6320: $72
    ld   [hl+], a                                 ; $6321: $22
    ld   hl, sp+$10                               ; $6322: $F8 $10
    ld   [hl], b                                  ; $6324: $70
    ld   [hl+], a                                 ; $6325: $22
    ld   [$74F8], sp                              ; $6326: $08 $F8 $74
    ld   [bc], a                                  ; $6329: $02
    ld   [$7600], sp                              ; $632A: $08 $00 $76
    ld   [bc], a                                  ; $632D: $02
    ld   [$7608], sp                              ; $632E: $08 $08 $76
    ld   [hl+], a                                 ; $6331: $22
    ld   [$7410], sp                              ; $6332: $08 $10 $74
    ld   [hl+], a                                 ; $6335: $22
    ld   sp, hl                                   ; $6336: $F9
    ld   sp, hl                                   ; $6337: $F9
    ld   [hl], b                                  ; $6338: $70
    ld   [bc], a                                  ; $6339: $02
    ld   sp, hl                                   ; $633A: $F9
    ld   bc, $0272                                ; $633B: $01 $72 $02
    ld   sp, hl                                   ; $633E: $F9
    rlca                                          ; $633F: $07
    ld   [hl], d                                  ; $6340: $72
    ld   [hl+], a                                 ; $6341: $22
    ld   sp, hl                                   ; $6342: $F9
    rrca                                          ; $6343: $0F
    ld   [hl], b                                  ; $6344: $70
    ld   [hl+], a                                 ; $6345: $22
    rlca                                          ; $6346: $07
    ld   sp, hl                                   ; $6347: $F9
    ld   [hl], h                                  ; $6348: $74
    ld   [bc], a                                  ; $6349: $02
    rlca                                          ; $634A: $07
    ld   bc, $0276                                ; $634B: $01 $76 $02
    rlca                                          ; $634E: $07
    rlca                                          ; $634F: $07
    db   $76                                      ; $6350: $76
    ld   [hl+], a                                 ; $6351: $22
    rlca                                          ; $6352: $07
    rrca                                          ; $6353: $0F
    ld   [hl], h                                  ; $6354: $74
    ld   [hl+], a                                 ; $6355: $22
    ld   hl, sp-$08                               ; $6356: $F8 $F8
    ld   a, b                                     ; $6358: $78
    ld   [bc], a                                  ; $6359: $02
    ld   hl, sp+$00                               ; $635A: $F8 $00
    ld   a, d                                     ; $635C: $7A
    ld   [bc], a                                  ; $635D: $02
    ld   hl, sp+$08                               ; $635E: $F8 $08
    ld   a, d                                     ; $6360: $7A
    ld   [hl+], a                                 ; $6361: $22
    ld   hl, sp+$10                               ; $6362: $F8 $10
    ld   a, b                                     ; $6364: $78
    ld   [hl+], a                                 ; $6365: $22
    ld   [$7CF8], sp                              ; $6366: $08 $F8 $7C
    ld   [bc], a                                  ; $6369: $02
    ld   [$7E00], sp                              ; $636A: $08 $00 $7E
    ld   [bc], a                                  ; $636D: $02
    ld   [$7E08], sp                              ; $636E: $08 $08 $7E
    ld   [hl+], a                                 ; $6371: $22
    ld   [$7C10], sp                              ; $6372: $08 $10 $7C
    ld   [hl+], a                                 ; $6375: $22

func_006_6376:
    ldh  a, [hActiveEntitySpriteVariant]               ; $6376: $F0 $F1
    rla                                           ; $6378: $17
    rla                                           ; $6379: $17
    rla                                           ; $637A: $17
    rla                                           ; $637B: $17
    rla                                           ; $637C: $17
    and  $E0                                      ; $637D: $E6 $E0
    ld   e, a                                     ; $637F: $5F
    ld   d, b                                     ; $6380: $50
    ld   hl, $6316                                ; $6381: $21 $16 $63
    add  hl, de                                   ; $6384: $19
    ld   c, $08                                   ; $6385: $0E $08
    call label_3CE6                               ; $6387: $CD $E6 $3C
    ld   a, $08                                   ; $638A: $3E $08
    jp   label_3DA0                               ; $638C: $C3 $A0 $3D

    ld   e, $02                                   ; $638F: $1E $02
    ld   e, $62                                   ; $6391: $1E $62
    ld   e, $42                                   ; $6393: $1E $42
    ld   e, $22                                   ; $6395: $1E $22
    ld   [hl-], a                                 ; $6397: $32
    nop                                           ; $6398: $00
    ld   [hl-], a                                 ; $6399: $32
    jr   nz, @+$32                                ; $639A: $20 $30

    nop                                           ; $639C: $00
    jr   nc, @+$22                                ; $639D: $30 $20

    ld   hl, wEntitiesHealthTable                 ; $639F: $21 $60 $C3
    add  hl, bc                                   ; $63A2: $09
    ld   [hl], $30                                ; $63A3: $36 $30
    ld   hl, wEntitiesUnknownTableB               ; $63A5: $21 $B0 $C2
    add  hl, bc                                   ; $63A8: $09
    ld   a, [hl]                                  ; $63A9: $7E
    and  a                                        ; $63AA: $A7
    jr   z, jr_006_63B5                           ; $63AB: $28 $08

    ldh  a, [hFrameCounter]                       ; $63AD: $F0 $E7
    rla                                           ; $63AF: $17
    rla                                           ; $63B0: $17
    and  $10                                      ; $63B1: $E6 $10
    ldh  [$FFED], a                               ; $63B3: $E0 $ED

jr_006_63B5:
    ld   de, $638F                                ; $63B5: $11 $8F $63
    call RenderAnimatedActiveEntity                               ; $63B8: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $63BB: $CD $05 $0C
    jr   z, jr_006_63CE                           ; $63BE: $28 $0E

    dec  a                                        ; $63C0: $3D
    jp   z, label_006_65DB                        ; $63C1: $CA $DB $65

    rra                                           ; $63C4: $1F
    rra                                           ; $63C5: $1F
    rra                                           ; $63C6: $1F
    and  $01                                      ; $63C7: $E6 $01
    add  $02                                      ; $63C9: $C6 $02
    jp   SetEntitySpriteVariant                   ; $63CB: $C3 $0C $3B

jr_006_63CE:
    ld   hl, $C410                                ; $63CE: $21 $10 $C4
    add  hl, bc                                   ; $63D1: $09
    ld   a, [hl]                                  ; $63D2: $7E
    cp   $02                                      ; $63D3: $FE $02
    jr   c, jr_006_63DD                           ; $63D5: $38 $06

    call GetEntityTransitionCountdown             ; $63D7: $CD $05 $0C
    ld   [hl], $10                                ; $63DA: $36 $10
    ret                                           ; $63DC: $C9

jr_006_63DD:
    ld   [hl], b                                  ; $63DD: $70
    call func_006_64C6                            ; $63DE: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $63E1: $F0 $E7
    rra                                           ; $63E3: $1F
    rra                                           ; $63E4: $1F
    rra                                           ; $63E5: $1F
    and  $01                                      ; $63E6: $E6 $01
    call SetEntitySpriteVariant                   ; $63E8: $CD $0C $3B
    call label_3B39                               ; $63EB: $CD $39 $3B
    call func_006_6541                            ; $63EE: $CD $41 $65
    jp   label_006_5E54                           ; $63F1: $C3 $54 $5E

    ld   d, b                                     ; $63F4: $50
    ld   [bc], a                                  ; $63F5: $02
    ld   d, b                                     ; $63F6: $50
    ld   [hl+], a                                 ; $63F7: $22
    ld   d, d                                     ; $63F8: $52
    ld   [bc], a                                  ; $63F9: $02
    ld   d, d                                     ; $63FA: $52
    ld   [hl+], a                                 ; $63FB: $22
    ld   de, $63F4                                ; $63FC: $11 $F4 $63
    call RenderAnimatedActiveEntity                               ; $63FF: $CD $C0 $3B
    call func_006_64C6                            ; $6402: $CD $C6 $64
    call label_C56                                ; $6405: $CD $56 $0C
    call label_3B70                               ; $6408: $CD $70 $3B
    call func_006_641A                            ; $640B: $CD $1A $64
    ldh  a, [hFrameCounter]                       ; $640E: $F0 $E7
    ld   e, b                                     ; $6410: $58
    and  $30                                      ; $6411: $E6 $30
    jr   z, jr_006_6416                           ; $6413: $28 $01

    inc  e                                        ; $6415: $1C

jr_006_6416:
    ld   a, e                                     ; $6416: $7B
    jp   SetEntitySpriteVariant                   ; $6417: $C3 $0C $3B

func_006_641A:
    call label_3B5A                               ; $641A: $CD $5A $3B
    jr   nc, jr_006_643C                          ; $641D: $30 $1D

label_006_641F:
    call CopyLinkFinalPositionToPosition          ; $641F: $CD $BE $0C
    call ResetPegasusBoots                                ; $6422: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $6425: $FA $A6 $C1
    and  a                                        ; $6428: $A7
    jr   z, jr_006_643C                           ; $6429: $28 $11

    ld   e, a                                     ; $642B: $5F
    ld   d, b                                     ; $642C: $50
    ld   hl, $C39F                                ; $642D: $21 $9F $C3
    add  hl, de                                   ; $6430: $19
    ld   a, [hl]                                  ; $6431: $7E
    cp   $03                                      ; $6432: $FE $03
    jr   nz, jr_006_643C                          ; $6434: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $6436: $21 $8F $C2
    add  hl, de                                   ; $6439: $19
    ld   [hl], $00                                ; $643A: $36 $00

jr_006_643C:
    ret                                           ; $643C: $C9

    ld   b, $04                                   ; $643D: $06 $04
    ld   [bc], a                                  ; $643F: $02
    nop                                           ; $6440: $00

func_006_6441:
    ld   hl, $C380                                ; $6441: $21 $80 $C3
    add  hl, bc                                   ; $6444: $09
    ld   e, [hl]                                  ; $6445: $5E
    ld   d, b                                     ; $6446: $50
    ld   hl, $643D                                ; $6447: $21 $3D $64
    add  hl, de                                   ; $644A: $19
    push hl                                       ; $644B: $E5
    ld   hl, $C3D0                                ; $644C: $21 $D0 $C3
    add  hl, bc                                   ; $644F: $09
    inc  [hl]                                     ; $6450: $34
    ld   a, [hl]                                  ; $6451: $7E
    rra                                           ; $6452: $1F
    rra                                           ; $6453: $1F
    rra                                           ; $6454: $1F
    rra                                           ; $6455: $1F
    pop  hl                                       ; $6456: $E1
    and  $01                                      ; $6457: $E6 $01
    or   [hl]                                     ; $6459: $B6
    jp   SetEntitySpriteVariant                   ; $645A: $C3 $0C $3B

func_006_645D:
    ld   e, b                                     ; $645D: $58
    ldh  a, [hActiveEntityType]                   ; $645E: $F0 $EB
    cp   $77                                      ; $6460: $FE $77
    jr   z, jr_006_6468                           ; $6462: $28 $04

    cp   $7B                                      ; $6464: $FE $7B
    jr   nz, jr_006_6474                          ; $6466: $20 $0C

jr_006_6468:
    ldh  a, [hLinkPositionY]                      ; $6468: $F0 $99
    ld   hl, $FFEF                                ; $646A: $21 $EF $FF
    sub  [hl]                                     ; $646D: $96
    add  $14                                      ; $646E: $C6 $14
    cp   $2C                                      ; $6470: $FE $2C
    jr   jr_006_647E                              ; $6472: $18 $0A

jr_006_6474:
    ldh  a, [hLinkPositionY]                      ; $6474: $F0 $99
    ld   hl, $FFEF                                ; $6476: $21 $EF $FF
    sub  [hl]                                     ; $6479: $96
    add  $14                                      ; $647A: $C6 $14
    cp   $28                                      ; $647C: $FE $28

label_006_647E:
jr_006_647E:
    jr   nc, jr_006_64C4                          ; $647E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $6480: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $6482: $21 $EE $FF
    sub  [hl]                                     ; $6485: $96
    add  $10                                      ; $6486: $C6 $10
    cp   $20                                      ; $6488: $FE $20
    jr   nc, jr_006_64C4                          ; $648A: $30 $38

    inc  e                                        ; $648C: $1C
    ldh  a, [hActiveEntityType]                   ; $648D: $F0 $EB
    cp   $78                                      ; $648F: $FE $78
    jr   z, jr_006_649F                           ; $6491: $28 $0C

    push de                                       ; $6493: $D5
    call func_006_65B4                            ; $6494: $CD $B4 $65
    ldh  a, [hLinkDirection]                      ; $6497: $F0 $9E
    xor  $01                                      ; $6499: $EE $01
    cp   e                                        ; $649B: $BB
    pop  de                                       ; $649C: $D1
    jr   nz, jr_006_64C4                          ; $649D: $20 $25

jr_006_649F:
    ld   hl, $C1AD                                ; $649F: $21 $AD $C1
    ld   [hl], $01                                ; $64A2: $36 $01
    ld   a, [wDialogState]                        ; $64A4: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $64A7: $21 $4F $C1
    or   [hl]                                     ; $64AA: $B6
    ld   hl, $C146                                ; $64AB: $21 $46 $C1
    or   [hl]                                     ; $64AE: $B6
    ld   hl, $C134                                ; $64AF: $21 $34 $C1
    or   [hl]                                     ; $64B2: $B6
    jr   nz, jr_006_64C4                          ; $64B3: $20 $0F

    ld   a, [wWindowY]                            ; $64B5: $FA $9A $DB
    cp   $80                                      ; $64B8: $FE $80
    jr   nz, jr_006_64C4                          ; $64BA: $20 $08

    ldh  a, [hJoypadState]                               ; $64BC: $F0 $CC
    and  $10                                      ; $64BE: $E6 $10
    jr   z, jr_006_64C4                           ; $64C0: $28 $02

    scf                                           ; $64C2: $37
    ret                                           ; $64C3: $C9

jr_006_64C4:
    and  a                                        ; $64C4: $A7
    ret                                           ; $64C5: $C9

func_006_64C6:
    ldh  a, [hActiveEntityStatus]                 ; $64C6: $F0 $EA
    cp   $05                                      ; $64C8: $FE $05
    jr   nz, jr_006_64F5                          ; $64CA: $20 $29

func_006_64CC:
    ld   a, [wGameplayType]                       ; $64CC: $FA $95 $DB
    cp   $07                                      ; $64CF: $FE $07
    jr   z, jr_006_64F5                           ; $64D1: $28 $22

    cp   $01                                      ; $64D3: $FE $01
    jr   z, jr_006_64E2                           ; $64D5: $28 $0B

    cp   $0B                                      ; $64D7: $FE $0B
    jr   nz, jr_006_64F5                          ; $64D9: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $64DB: $FA $6B $C1
    cp   $04                                      ; $64DE: $FE $04
    jr   nz, jr_006_64F5                          ; $64E0: $20 $13

jr_006_64E2:
    ld   hl, $C1A8                                ; $64E2: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $64E5: $FA $9F $C1
    or   [hl]                                     ; $64E8: $B6
    ld   hl, wInventoryAppearing                  ; $64E9: $21 $4F $C1
    or   [hl]                                     ; $64EC: $B6
    jr   nz, jr_006_64F5                          ; $64ED: $20 $06

    ld   a, [wRoomTransitionState]                ; $64EF: $FA $24 $C1
    and  a                                        ; $64F2: $A7
    jr   z, jr_006_64F6                           ; $64F3: $28 $01

jr_006_64F5:
    pop  af                                       ; $64F5: $F1

jr_006_64F6:
    ret                                           ; $64F6: $C9

func_006_64F7:
    ld   hl, $C410                                ; $64F7: $21 $10 $C4
    add  hl, bc                                   ; $64FA: $09
    ld   a, [hl]                                  ; $64FB: $7E
    and  a                                        ; $64FC: $A7
    jr   z, jr_006_6540                           ; $64FD: $28 $41

    dec  a                                        ; $64FF: $3D
    ld   [hl], a                                  ; $6500: $77
    call label_3E8E                               ; $6501: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                       ; $6504: $21 $40 $C2
    add  hl, bc                                   ; $6507: $09
    ld   a, [hl]                                  ; $6508: $7E
    push af                                       ; $6509: $F5
    ld   hl, wEntitiesSpeedYTable                       ; $650A: $21 $50 $C2
    add  hl, bc                                   ; $650D: $09
    ld   a, [hl]                                  ; $650E: $7E
    push af                                       ; $650F: $F5
    ld   hl, $C3F0                                ; $6510: $21 $F0 $C3
    add  hl, bc                                   ; $6513: $09
    ld   a, [hl]                                  ; $6514: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $6515: $21 $40 $C2
    add  hl, bc                                   ; $6518: $09
    ld   [hl], a                                  ; $6519: $77
    ld   hl, $C400                                ; $651A: $21 $00 $C4
    add  hl, bc                                   ; $651D: $09
    ld   a, [hl]                                  ; $651E: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $651F: $21 $50 $C2
    add  hl, bc                                   ; $6522: $09
    ld   [hl], a                                  ; $6523: $77
    call func_006_6541                            ; $6524: $CD $41 $65
    ld   hl, $C430                                ; $6527: $21 $30 $C4
    add  hl, bc                                   ; $652A: $09
    ld   a, [hl]                                  ; $652B: $7E
    and  $20                                      ; $652C: $E6 $20
    jr   nz, jr_006_6533                          ; $652E: $20 $03

    call label_3B23                               ; $6530: $CD $23 $3B

jr_006_6533:
    ld   hl, wEntitiesSpeedYTable                       ; $6533: $21 $50 $C2
    add  hl, bc                                   ; $6536: $09
    pop  af                                       ; $6537: $F1
    ld   [hl], a                                  ; $6538: $77
    ld   hl, wEntitiesSpeedXTable                       ; $6539: $21 $40 $C2
    add  hl, bc                                   ; $653C: $09
    pop  af                                       ; $653D: $F1
    ld   [hl], a                                  ; $653E: $77
    pop  af                                       ; $653F: $F1

jr_006_6540:
    ret                                           ; $6540: $C9

func_006_6541:
label_006_6541:
    call func_006_654E                            ; $6541: $CD $4E $65
    push bc                                       ; $6544: $C5
    ld   a, c                                     ; $6545: $79
    add  $10                                      ; $6546: $C6 $10
    ld   c, a                                     ; $6548: $4F
    call func_006_654E                            ; $6549: $CD $4E $65
    pop  bc                                       ; $654C: $C1
    ret                                           ; $654D: $C9

func_006_654E:
label_006_654E:
    ld   hl, wEntitiesSpeedXTable                       ; $654E: $21 $40 $C2
    add  hl, bc                                   ; $6551: $09
    ld   a, [hl]                                  ; $6552: $7E
    and  a                                        ; $6553: $A7
    jr   z, jr_006_6579                           ; $6554: $28 $23

    push af                                       ; $6556: $F5
    swap a                                        ; $6557: $CB $37
    and  $F0                                      ; $6559: $E6 $F0
    ld   hl, $C260                                ; $655B: $21 $60 $C2
    add  hl, bc                                   ; $655E: $09
    add  [hl]                                     ; $655F: $86
    ld   [hl], a                                  ; $6560: $77
    rl   d                                        ; $6561: $CB $12
    ld   hl, wEntitiesPosXTable                         ; $6563: $21 $00 $C2

jr_006_6566:
    add  hl, bc                                   ; $6566: $09
    pop  af                                       ; $6567: $F1
    ld   e, $00                                   ; $6568: $1E $00
    bit  7, a                                     ; $656A: $CB $7F
    jr   z, jr_006_6570                           ; $656C: $28 $02

    ld   e, $F0                                   ; $656E: $1E $F0

jr_006_6570:
    swap a                                        ; $6570: $CB $37
    and  $0F                                      ; $6572: $E6 $0F
    or   e                                        ; $6574: $B3
    rr   d                                        ; $6575: $CB $1A
    adc  [hl]                                     ; $6577: $8E
    ld   [hl], a                                  ; $6578: $77

jr_006_6579:
    ret                                           ; $6579: $C9

func_006_657A:
    ld   hl, wEntitiesSpeedZTable                 ; $657A: $21 $20 $C3
    add  hl, bc                                   ; $657D: $09
    ld   a, [hl]                                  ; $657E: $7E
    and  a                                        ; $657F: $A7
    jr   z, jr_006_6579                           ; $6580: $28 $F7

    push af                                       ; $6582: $F5
    swap a                                        ; $6583: $CB $37
    and  $F0                                      ; $6585: $E6 $F0
    ld   hl, $C330                                ; $6587: $21 $30 $C3
    add  hl, bc                                   ; $658A: $09
    add  [hl]                                     ; $658B: $86
    ld   [hl], a                                  ; $658C: $77
    rl   d                                        ; $658D: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $658F: $21 $10 $C3
    jr   jr_006_6566                              ; $6592: $18 $D2

func_006_6594:
    ld   e, $00                                   ; $6594: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6596: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $6598: $21 $00 $C2
    add  hl, bc                                   ; $659B: $09
    sub  [hl]                                     ; $659C: $96
    bit  7, a                                     ; $659D: $CB $7F
    jr   z, jr_006_65A2                           ; $659F: $28 $01

    inc  e                                        ; $65A1: $1C

jr_006_65A2:
    ld   d, a                                     ; $65A2: $57
    ret                                           ; $65A3: $C9

func_006_65A4:
    ld   e, $02                                   ; $65A4: $1E $02
    ldh  a, [hLinkPositionY]                      ; $65A6: $F0 $99
    ld   hl, wEntitiesPosYTable                         ; $65A8: $21 $10 $C2
    add  hl, bc                                   ; $65AB: $09
    sub  [hl]                                     ; $65AC: $96
    bit  7, a                                     ; $65AD: $CB $7F
    jr   nz, jr_006_65B2                          ; $65AF: $20 $01

    inc  e                                        ; $65B1: $1C

jr_006_65B2:
    ld   d, a                                     ; $65B2: $57
    ret                                           ; $65B3: $C9

func_006_65B4:
    call func_006_6594                            ; $65B4: $CD $94 $65
    ld   a, e                                     ; $65B7: $7B
    ldh  [hScratch0], a                           ; $65B8: $E0 $D7
    ld   a, d                                     ; $65BA: $7A
    bit  7, a                                     ; $65BB: $CB $7F
    jr   z, jr_006_65C1                           ; $65BD: $28 $02

    cpl                                           ; $65BF: $2F
    inc  a                                        ; $65C0: $3C

jr_006_65C1:
    push af                                       ; $65C1: $F5
    call func_006_65A4                            ; $65C2: $CD $A4 $65
    ld   a, e                                     ; $65C5: $7B
    ldh  [hScratch1], a                           ; $65C6: $E0 $D8
    ld   a, d                                     ; $65C8: $7A
    bit  7, a                                     ; $65C9: $CB $7F
    jr   z, jr_006_65CF                           ; $65CB: $28 $02

    cpl                                           ; $65CD: $2F
    inc  a                                        ; $65CE: $3C

jr_006_65CF:
    pop  de                                       ; $65CF: $D1
    cp   d                                        ; $65D0: $BA
    jr   nc, jr_006_65D7                          ; $65D1: $30 $04

    ldh  a, [hScratch0]                           ; $65D3: $F0 $D7
    jr   jr_006_65D9                              ; $65D5: $18 $02

jr_006_65D7:
    ldh  a, [hScratch1]                           ; $65D7: $F0 $D8

jr_006_65D9:
    ld   e, a                                     ; $65D9: $5F
    ret                                           ; $65DA: $C9

func_006_65DB:
label_006_65DB:
    ld   hl, wEntitiesStatusTable                        ; $65DB: $21 $80 $C2
    add  hl, bc                                   ; $65DE: $09
    ld   [hl], b                                  ; $65DF: $70
    ret                                           ; $65E0: $C9

    ld   l, d                                     ; $65E1: $6A
    inc  hl                                       ; $65E2: $23
    ld   l, b                                     ; $65E3: $68
    inc  hl                                       ; $65E4: $23
    ld   l, b                                     ; $65E5: $68
    inc  bc                                       ; $65E6: $03
    ld   l, d                                     ; $65E7: $6A
    inc  bc                                       ; $65E8: $03
    ld   l, h                                     ; $65E9: $6C
    ld   b, e                                     ; $65EA: $43
    ld   l, h                                     ; $65EB: $6C
    ld   h, e                                     ; $65EC: $63
    ld   l, h                                     ; $65ED: $6C
    inc  bc                                       ; $65EE: $03
    ld   l, h                                     ; $65EF: $6C
    inc  hl                                       ; $65F0: $23
    ldh  a, [hFrameCounter]                       ; $65F1: $F0 $E7
    rla                                           ; $65F3: $17
    rla                                           ; $65F4: $17
    and  $10                                      ; $65F5: $E6 $10
    ldh  [$FFED], a                               ; $65F7: $E0 $ED
    ld   de, $65E1                                ; $65F9: $11 $E1 $65
    call RenderAnimatedActiveEntity                               ; $65FC: $CD $C0 $3B
    call func_006_64C6                            ; $65FF: $CD $C6 $64
    call label_3B4F                               ; $6602: $CD $4F $3B
    call func_006_6541                            ; $6605: $CD $41 $65
    call label_3B2E                               ; $6608: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $660B: $21 $A0 $C2
    add  hl, bc                                   ; $660E: $09
    ld   a, [hl]                                  ; $660F: $7E
    and  a                                        ; $6610: $A7
    ret  z                                        ; $6611: $C8

    jp   label_006_65DB                           ; $6612: $C3 $DB $65

    ld   e, h                                     ; $6615: $5C
    nop                                           ; $6616: $00
    ld   e, h                                     ; $6617: $5C
    jr   nz, @+$5E                                ; $6618: $20 $5C

    inc  d                                        ; $661A: $14
    ld   e, h                                     ; $661B: $5C
    inc  [hl]                                     ; $661C: $34
    nop                                           ; $661D: $00
    stop                                          ; $661E: $10 $00
    ldh  a, [rP1]                                 ; $6620: $F0 $00
    ldh  a, [rP1]                                 ; $6622: $F0 $00
    db   $10                                      ; $6624: $10
    stop                                          ; $6625: $10 $00
    ldh  a, [rP1]                                 ; $6627: $F0 $00
    stop                                          ; $6629: $10 $00
    ldh  a, [rP1]                                 ; $662B: $F0 $00
    ld   bc, $0208                                ; $662D: $01 $08 $02
    inc  b                                        ; $6630: $04
    ld   bc, $0204                                ; $6631: $01 $04 $02
    ld   [$013E], sp                              ; $6634: $08 $3E $01
    ldh  [$FFBE], a                               ; $6637: $E0 $BE
    ldh  a, [hFrameCounter]                       ; $6639: $F0 $E7
    rra                                           ; $663B: $1F
    and  $01                                      ; $663C: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a               ; $663E: $E0 $F1
    ld   de, $6615                                ; $6640: $11 $15 $66
    call RenderAnimatedActiveEntity                               ; $6643: $CD $C0 $3B
    call func_006_64C6                            ; $6646: $CD $C6 $64
    call func_006_64F7                            ; $6649: $CD $F7 $64
    call label_3B44                               ; $664C: $CD $44 $3B
    call func_006_6541                            ; $664F: $CD $41 $65
    call func_006_66CC                            ; $6652: $CD $CC $66
    ld   hl, wEntitiesUnknownTableB               ; $6655: $21 $B0 $C2
    add  hl, bc                                   ; $6658: $09
    ld   a, [hl]                                  ; $6659: $7E
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    ld   hl, wEntitiesUnknownTableC               ; $665C: $21 $C0 $C2
    add  hl, bc                                   ; $665F: $09
    add  [hl]                                     ; $6660: $86
    ld   e, a                                     ; $6661: $5F
    ld   hl, $662D                                ; $6662: $21 $2D $66
    add  hl, de                                   ; $6665: $19
    push hl                                       ; $6666: $E5
    ld   hl, wEntitiesCollisionsTable             ; $6667: $21 $A0 $C2
    add  hl, bc                                   ; $666A: $09
    ld   a, [hl]                                  ; $666B: $7E
    pop  hl                                       ; $666C: $E1
    and  [hl]                                     ; $666D: $A6
    jr   nz, jr_006_6685                          ; $666E: $20 $15

    call GetEntityTransitionCountdown             ; $6670: $CD $05 $0C
    jr   nz, jr_006_6690                          ; $6673: $20 $1B

    ld   hl, wEntitiesCollisionsTable             ; $6675: $21 $A0 $C2
    add  hl, bc                                   ; $6678: $09
    ld   a, [hl]                                  ; $6679: $7E
    and  $0F                                      ; $667A: $E6 $0F
    jr   nz, jr_006_669D                          ; $667C: $20 $1F

    call GetEntityTransitionCountdown             ; $667E: $CD $05 $0C
    ld   [hl], $09                                ; $6681: $36 $09
    jr   jr_006_669D                              ; $6683: $18 $18

jr_006_6685:
    ld   hl, wEntitiesUnknownTableB               ; $6685: $21 $B0 $C2
    add  hl, bc                                   ; $6688: $09
    inc  [hl]                                     ; $6689: $34
    ld   a, [hl]                                  ; $668A: $7E
    and  $03                                      ; $668B: $E6 $03
    ld   [hl], a                                  ; $668D: $77
    jr   jr_006_669D                              ; $668E: $18 $0D

jr_006_6690:
    cp   $06                                      ; $6690: $FE $06
    jr   nz, jr_006_669D                          ; $6692: $20 $09

    ld   hl, wEntitiesUnknownTableB               ; $6694: $21 $B0 $C2
    add  hl, bc                                   ; $6697: $09
    dec  [hl]                                     ; $6698: $35
    ld   a, [hl]                                  ; $6699: $7E
    and  $03                                      ; $669A: $E6 $03
    ld   [hl], a                                  ; $669C: $77

jr_006_669D:
    ld   hl, wEntitiesUnknownTableB               ; $669D: $21 $B0 $C2
    add  hl, bc                                   ; $66A0: $09
    ld   a, [hl]                                  ; $66A1: $7E
    ld   e, a                                     ; $66A2: $5F
    ld   d, b                                     ; $66A3: $50
    ld   hl, wEntitiesUnknownTableC               ; $66A4: $21 $C0 $C2
    add  hl, bc                                   ; $66A7: $09
    add  [hl]                                     ; $66A8: $86
    ld   e, a                                     ; $66A9: $5F
    ld   hl, $661D                                ; $66AA: $21 $1D $66
    add  hl, de                                   ; $66AD: $19
    ld   a, [hl]                                  ; $66AE: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $66AF: $21 $50 $C2
    add  hl, bc                                   ; $66B2: $09
    ld   [hl], a                                  ; $66B3: $77
    ld   hl, wEntitiesUnknownTableB               ; $66B4: $21 $B0 $C2
    add  hl, bc                                   ; $66B7: $09
    ld   a, [hl]                                  ; $66B8: $7E
    ld   e, a                                     ; $66B9: $5F
    ld   d, b                                     ; $66BA: $50
    ld   hl, wEntitiesUnknownTableC               ; $66BB: $21 $C0 $C2
    add  hl, bc                                   ; $66BE: $09
    add  [hl]                                     ; $66BF: $86
    ld   e, a                                     ; $66C0: $5F
    ld   hl, $6625                                ; $66C1: $21 $25 $66
    add  hl, de                                   ; $66C4: $19
    ld   a, [hl]                                  ; $66C5: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $66C6: $21 $40 $C2
    add  hl, bc                                   ; $66C9: $09
    ld   [hl], a                                  ; $66CA: $77
    ret                                           ; $66CB: $C9

func_006_66CC:
    ld   hl, wEntitiesSpeedXTable                       ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    push af                                       ; $66D1: $F5
    ld   [hl], $01                                ; $66D2: $36 $01
    ld   hl, wEntitiesSpeedYTable                       ; $66D4: $21 $50 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    push af                                       ; $66D9: $F5
    ld   [hl], $01                                ; $66DA: $36 $01
    call label_3B23                               ; $66DC: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66DF: $21 $A0 $C2
    add  hl, bc                                   ; $66E2: $09
    ld   a, [hl]                                  ; $66E3: $7E
    push af                                       ; $66E4: $F5
    ld   hl, wEntitiesSpeedXTable                       ; $66E5: $21 $40 $C2
    add  hl, bc                                   ; $66E8: $09
    ld   [hl], $FF                                ; $66E9: $36 $FF
    ld   hl, wEntitiesSpeedYTable                       ; $66EB: $21 $50 $C2
    add  hl, bc                                   ; $66EE: $09
    ld   [hl], $FF                                ; $66EF: $36 $FF
    call label_3B23                               ; $66F1: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66F4: $21 $A0 $C2
    add  hl, bc                                   ; $66F7: $09
    pop  af                                       ; $66F8: $F1
    or   [hl]                                     ; $66F9: $B6
    ld   [hl], a                                  ; $66FA: $77
    pop  af                                       ; $66FB: $F1
    ld   hl, wEntitiesSpeedYTable                       ; $66FC: $21 $50 $C2
    add  hl, bc                                   ; $66FF: $09
    ld   [hl], a                                  ; $6700: $77
    pop  af                                       ; $6701: $F1
    ld   hl, wEntitiesSpeedXTable                       ; $6702: $21 $40 $C2
    add  hl, bc                                   ; $6705: $09
    ld   [hl], a                                  ; $6706: $77
    ret                                           ; $6707: $C9

    ld   b, d                                     ; $6708: $42
    nop                                           ; $6709: $00
    ld   b, d                                     ; $670A: $42
    jr   nz, jr_006_674D                          ; $670B: $20 $40

    nop                                           ; $670D: $00
    ld   b, b                                     ; $670E: $40
    jr   nz, jr_006_6773                          ; $670F: $20 $62

    nop                                           ; $6711: $00
    ld   h, d                                     ; $6712: $62
    jr   nz, @+$62                                ; $6713: $20 $60

    nop                                           ; $6715: $00
    ld   h, b                                     ; $6716: $60
    jr   nz, jr_006_6719                          ; $6717: $20 $00

jr_006_6719:
    dec  b                                        ; $6719: $05
    ld   a, [bc]                                  ; $671A: $0A
    dec  c                                        ; $671B: $0D
    ld   c, $0D                                   ; $671C: $0E $0D
    ld   a, [bc]                                  ; $671E: $0A
    dec  b                                        ; $671F: $05
    nop                                           ; $6720: $00
    ei                                            ; $6721: $FB
    or   $F3                                      ; $6722: $F6 $F3
    ld   a, [c]                                   ; $6724: $F2
    di                                            ; $6725: $F3
    or   $FB                                      ; $6726: $F6 $FB
    nop                                           ; $6728: $00
    dec  b                                        ; $6729: $05
    ld   a, [bc]                                  ; $672A: $0A
    dec  c                                        ; $672B: $0D
    inc  c                                        ; $672C: $0C
    inc  b                                        ; $672D: $04
    ld   [$1100], sp                              ; $672E: $08 $00 $11
    ld   [$F067], sp                              ; $6731: $08 $67 $F0
    rst  $30                                      ; $6734: $F7
    cp   $0A                                      ; $6735: $FE $0A
    jr   nz, jr_006_673C                          ; $6737: $20 $03

    ld   de, $6710                                ; $6739: $11 $10 $67

jr_006_673C:
    call RenderAnimatedActiveEntity                               ; $673C: $CD $C0 $3B
    call func_006_64C6                            ; $673F: $CD $C6 $64
    call func_006_64F7                            ; $6742: $CD $F7 $64
    call label_3B39                               ; $6745: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $6748: $F0 $F0
    rst  $00                                      ; $674A: $C7
    ld   c, a                                     ; $674B: $4F
    ld   h, a                                     ; $674C: $67

jr_006_674D:
    adc  a                                        ; $674D: $8F
    ld   h, a                                     ; $674E: $67
    call GetEntityTransitionCountdown             ; $674F: $CD $05 $0C
    jp   nz, label_006_67E6                       ; $6752: $C2 $E6 $67

    call func_006_6594                            ; $6755: $CD $94 $65
    add  $20                                      ; $6758: $C6 $20
    cp   $40                                      ; $675A: $FE $40
    jp   nc, label_006_67E6                       ; $675C: $D2 $E6 $67

    call func_006_65A4                            ; $675F: $CD $A4 $65
    add  $20                                      ; $6762: $C6 $20
    cp   $40                                      ; $6764: $FE $40
    jp   nc, label_006_67E6                       ; $6766: $D2 $E6 $67

    call func_006_65B4                            ; $6769: $CD $B4 $65
    ld   d, $00                                   ; $676C: $16 $00
    ld   hl, $672C                                ; $676E: $21 $2C $67
    add  hl, de                                   ; $6771: $19
    ld   a, [hl]                                  ; $6772: $7E

jr_006_6773:
    ld   hl, wEntitiesUnknownTableB               ; $6773: $21 $B0 $C2
    add  hl, bc                                   ; $6776: $09
    ld   [hl], a                                  ; $6777: $77
    call GetEntityTransitionCountdown             ; $6778: $CD $05 $0C
    call GetRandomByte                            ; $677B: $CD $0D $28
    and  $3F                                      ; $677E: $E6 $3F
    add  $50                                      ; $6780: $C6 $50
    ld   [hl], a                                  ; $6782: $77
    ld   hl, wEntitiesUnknownTableC               ; $6783: $21 $C0 $C2
    add  hl, bc                                   ; $6786: $09
    ld   [hl], $01                                ; $6787: $36 $01
    call IncrementEntityWalkingAttr               ; $6789: $CD $12 $3B
    jp   label_006_67E6                           ; $678C: $C3 $E6 $67

    call func_006_6541                            ; $678F: $CD $41 $65
    call label_3B23                               ; $6792: $CD $23 $3B
    call GetEntityTransitionCountdown             ; $6795: $CD $05 $0C
    jr   nz, jr_006_67A2                          ; $6798: $20 $08

    ld   [hl], $20                                ; $679A: $36 $20
    call IncrementEntityWalkingAttr               ; $679C: $CD $12 $3B
    ld   [hl], b                                  ; $679F: $70
    jr   jr_006_67E6                              ; $67A0: $18 $44

jr_006_67A2:
    ld   hl, wEntitiesUnknownTableD               ; $67A2: $21 $D0 $C2
    add  hl, bc                                   ; $67A5: $09
    inc  [hl]                                     ; $67A6: $34
    ld   a, [hl]                                  ; $67A7: $7E
    cp   $0A                                      ; $67A8: $FE $0A
    jr   c, jr_006_67E6                           ; $67AA: $38 $3A

    ld   [hl], b                                  ; $67AC: $70
    ld   hl, wEntitiesUnknownTableC               ; $67AD: $21 $C0 $C2
    add  hl, bc                                   ; $67B0: $09
    ld   a, [hl]                                  ; $67B1: $7E
    ld   hl, wEntitiesUnknownTableB               ; $67B2: $21 $B0 $C2
    add  hl, bc                                   ; $67B5: $09
    add  [hl]                                     ; $67B6: $86
    and  $0F                                      ; $67B7: $E6 $0F
    ld   [hl], a                                  ; $67B9: $77
    ld   hl, wEntitiesUnknownTableB               ; $67BA: $21 $B0 $C2
    add  hl, bc                                   ; $67BD: $09
    ld   e, [hl]                                  ; $67BE: $5E
    ld   d, b                                     ; $67BF: $50
    ld   hl, $6718                                ; $67C0: $21 $18 $67
    add  hl, de                                   ; $67C3: $19
    ld   a, [hl]                                  ; $67C4: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $67C5: $21 $50 $C2
    add  hl, bc                                   ; $67C8: $09
    ld   [hl], a                                  ; $67C9: $77
    ld   hl, $671C                                ; $67CA: $21 $1C $67
    add  hl, de                                   ; $67CD: $19
    ld   a, [hl]                                  ; $67CE: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $67CF: $21 $40 $C2
    add  hl, bc                                   ; $67D2: $09
    ld   [hl], a                                  ; $67D3: $77
    call GetRandomByte                            ; $67D4: $CD $0D $28
    and  $1F                                      ; $67D7: $E6 $1F
    jr   nz, jr_006_67E6                          ; $67D9: $20 $0B

    call GetRandomByte                            ; $67DB: $CD $0D $28
    and  $02                                      ; $67DE: $E6 $02
    dec  a                                        ; $67E0: $3D
    ld   hl, wEntitiesUnknownTableC               ; $67E1: $21 $C0 $C2
    add  hl, bc                                   ; $67E4: $09
    ld   [hl], a                                  ; $67E5: $77

label_006_67E6:
jr_006_67E6:
    ldh  a, [hActiveEntityState]                  ; $67E6: $F0 $F0
    and  a                                        ; $67E8: $A7
    jr   z, jr_006_67F2                           ; $67E9: $28 $07

    ldh  a, [hFrameCounter]                       ; $67EB: $F0 $E7
    rra                                           ; $67ED: $1F
    rra                                           ; $67EE: $1F
    rra                                           ; $67EF: $1F
    and  $01                                      ; $67F0: $E6 $01

jr_006_67F2:
    jp   SetEntitySpriteVariant                   ; $67F2: $C3 $0C $3B

    ld   a, c                                     ; $67F5: $79
    ld   [$C501], a                               ; $67F6: $EA $01 $C5
    ldh  a, [hMapRoom]                            ; $67F9: $F0 $F6
    cp   $64                                      ; $67FB: $FE $64
    jr   nz, jr_006_680D                          ; $67FD: $20 $0E

    ld   a, [$D9E3]                               ; $67FF: $FA $E3 $D9
    and  $40                                      ; $6802: $E6 $40
    ret  z                                        ; $6804: $C8

    ld   a, [wHasInstrument5]                     ; $6805: $FA $69 $DB
    and  $02                                      ; $6808: $E6 $02
    jp   nz, label_006_65DB                       ; $680A: $C2 $DB $65

jr_006_680D:
    ldh  a, [hMapRoom]                            ; $680D: $F0 $F6
    cp   $AC                                      ; $680F: $FE $AC
    jr   nz, jr_006_681A                          ; $6811: $20 $07

    ldh  a, [hRoomStatus]                         ; $6813: $F0 $F8
    and  $10                                      ; $6815: $E6 $10
    jp   z, label_006_65DB                        ; $6817: $CA $DB $65

jr_006_681A:
    ldh  a, [hMapRoom]                            ; $681A: $F0 $F6
    cp   $41                                      ; $681C: $FE $41
    jr   nz, jr_006_6829                          ; $681E: $20 $09

    ld   a, [wHasTailKey]                         ; $6820: $FA $11 $DB
    and  a                                        ; $6823: $A7
    ret  z                                        ; $6824: $C8

    call IsEntityUnknownFZero                     ; $6825: $CD $00 $0C
    ret  nz                                       ; $6828: $C0

jr_006_6829:
    ldh  a, [hMapRoom]                            ; $6829: $F0 $F6
    cp   $EE                                      ; $682B: $FE $EE
    jr   nz, jr_006_6835                          ; $682D: $20 $06

    ld   a, [wHasAnglerKey]                       ; $682F: $FA $12 $DB
    and  a                                        ; $6832: $A7
    jr   jr_006_689D                              ; $6833: $18 $68

jr_006_6835:
    ldh  a, [hMapRoom]                            ; $6835: $F0 $F6
    cp   $D2                                      ; $6837: $FE $D2
    jr   z, jr_006_684E                           ; $6839: $28 $13

    cp   $36                                      ; $683B: $FE $36
    jr   nz, jr_006_6853                          ; $683D: $20 $14

    ld   a, [wHasInstrument2]                     ; $683F: $FA $66 $DB
    and  a                                        ; $6842: $A7
    jp   nz, label_006_65DB                       ; $6843: $C2 $DB $65

    ld   a, [wIsBowWowFollowingLink]              ; $6846: $FA $56 $DB
    cp   $01                                      ; $6849: $FE $01
    jp   nz, label_006_65DB                       ; $684B: $C2 $DB $65

jr_006_684E:
    ld   a, [wHasInstrument1]                     ; $684E: $FA $65 $DB
    jr   jr_006_689B                              ; $6851: $18 $48

jr_006_6853:
    ldh  a, [hMapRoom]                            ; $6853: $F0 $F6
    cp   $08                                      ; $6855: $FE $08
    jr   nz, jr_006_6869                          ; $6857: $20 $10

    ld   a, [wHasInstrument8]                     ; $6859: $FA $6C $DB
    and  $02                                      ; $685C: $E6 $02
    jp   nz, label_006_65DB                       ; $685E: $C2 $DB $65

    ld   a, [$D808]                               ; $6861: $FA $08 $D8
    and  $10                                      ; $6864: $E6 $10
    ret  z                                        ; $6866: $C8

    jr   jr_006_68A0                              ; $6867: $18 $37

jr_006_6869:
    cp   $9D                                      ; $6869: $FE $9D
    jr   nz, jr_006_6872                          ; $686B: $20 $05

    ld   a, [wHasInstrument5]                     ; $686D: $FA $69 $DB
    jr   jr_006_689B                              ; $6870: $18 $29

jr_006_6872:
    cp   $06                                      ; $6872: $FE $06
    jr   nz, jr_006_687E                          ; $6874: $20 $08

    ld   a, [$D806]                               ; $6876: $FA $06 $D8
    and  $10                                      ; $6879: $E6 $10
    ret  z                                        ; $687B: $C8

    jr   jr_006_68A0                              ; $687C: $18 $22

jr_006_687E:
    cp   $B6                                      ; $687E: $FE $B6
    jr   nz, jr_006_6887                          ; $6880: $20 $05

    ld   a, [wHasInstrument3]                     ; $6882: $FA $67 $DB
    jr   jr_006_689B                              ; $6885: $18 $14

jr_006_6887:
    cp   $17                                      ; $6887: $FE $17
    jr   z, jr_006_688F                           ; $6889: $28 $04

    cp   $9C                                      ; $688B: $FE $9C
    jr   nz, jr_006_6894                          ; $688D: $20 $05

jr_006_688F:
    ld   a, [wHasInstrument6]                     ; $688F: $FA $6A $DB
    jr   jr_006_689B                              ; $6892: $18 $07

jr_006_6894:
    cp   $16                                      ; $6894: $FE $16
    jr   nz, jr_006_68A0                          ; $6896: $20 $08

    ld   a, [wHasInstrument2]                     ; $6898: $FA $66 $DB

jr_006_689B:
    and  $02                                      ; $689B: $E6 $02

jr_006_689D:
    jp   z, label_006_65DB                        ; $689D: $CA $DB $65

jr_006_68A0:
    ldh  a, [hMapRoom]                            ; $68A0: $F0 $F6
    cp   $D2                                      ; $68A2: $FE $D2
    jr   z, jr_006_68B4                           ; $68A4: $28 $0E

    cp   $16                                      ; $68A6: $FE $16
    jr   z, jr_006_68B4                           ; $68A8: $28 $0A

    cp   $36                                      ; $68AA: $FE $36
    jr   z, jr_006_68B4                           ; $68AC: $28 $06

    ldh  a, [hActiveEntityState]                  ; $68AE: $F0 $F0
    cp   $00                                      ; $68B0: $FE $00
    jr   z, jr_006_68B7                           ; $68B2: $28 $03

jr_006_68B4:
    call $6A4F                                    ; $68B4: $CD $4F $6A

jr_006_68B7:
    ldh  a, [hFrameCounter]                       ; $68B7: $F0 $E7
    and  $B0                                      ; $68B9: $E6 $B0
    ld   a, $00                                   ; $68BB: $3E $00
    jr   nz, jr_006_68C0                          ; $68BD: $20 $01

    inc  a                                        ; $68BF: $3C

jr_006_68C0:
    call SetEntitySpriteVariant                   ; $68C0: $CD $0C $3B
    ld   a, [wRoomTransitionState]                ; $68C3: $FA $24 $C1
    and  a                                        ; $68C6: $A7
    ret  nz                                       ; $68C7: $C0

    ldh  a, [hActiveEntityState]                  ; $68C8: $F0 $F0
    rst  $00                                      ; $68CA: $C7
    push de                                       ; $68CB: $D5
    ld   l, b                                     ; $68CC: $68
    cpl                                           ; $68CD: $2F
    ld   l, c                                     ; $68CE: $69
    ld   [hl], d                                  ; $68CF: $72
    ld   l, c                                     ; $68D0: $69
    and  c                                        ; $68D1: $A1
    ld   l, c                                     ; $68D2: $69
    jp   z, $F069                                 ; $68D3: $CA $69 $F0

    or   $FE                                      ; $68D6: $F6 $FE
    ld   a, [c]                                   ; $68D8: $F2
    jr   nz, jr_006_68EF                          ; $68D9: $20 $14

    ld   a, $1D                                   ; $68DB: $3E $1D
    ldh  [hMusicTrack], a                         ; $68DD: $E0 $B0
    ldh  a, [hLinkPositionY]                      ; $68DF: $F0 $99
    cp   $44                                      ; $68E1: $FE $44
    ret  c                                        ; $68E3: $D8

    ldh  a, [hLinkPositionX]                      ; $68E4: $F0 $98
    sub  $58                                      ; $68E6: $D6 $58
    add  $18                                      ; $68E8: $C6 $18
    cp   $30                                      ; $68EA: $FE $30
    ret  nc                                       ; $68EC: $D0

    jr   jr_006_68F6                              ; $68ED: $18 $07

jr_006_68EF:
    ld   a, [wSwordLevel]                         ; $68EF: $FA $4E $DB
    and  a                                        ; $68F2: $A7
    jp   z, label_006_65DB                        ; $68F3: $CA $DB $65

jr_006_68F6:
    ldh  a, [hMusicTrack]                         ; $68F6: $F0 $B0
    ld   hl, wEntitiesUnknownTableB               ; $68F8: $21 $B0 $C2
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], a                                  ; $68FC: $77
    ld   a, $22                                   ; $68FD: $3E $22
    ld   [wActiveMusicTrack], a                   ; $68FF: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $6902: $E0 $B0
    ldh  [$FFBD], a                               ; $6904: $E0 $BD
    ldh  a, [hMapRoom]                            ; $6906: $F0 $F6
    cp   $16                                      ; $6908: $FE $16
    jr   z, jr_006_6914                           ; $690A: $28 $08

    cp   $36                                      ; $690C: $FE $36
    jr   z, jr_006_6914                           ; $690E: $28 $04

    cp   $D2                                      ; $6910: $FE $D2
    jr   nz, jr_006_691A                          ; $6912: $20 $06

jr_006_6914:
    call IncrementEntityWalkingAttr               ; $6914: $CD $12 $3B
    ld   [hl], $02                                ; $6917: $36 $02
    ret                                           ; $6919: $C9

jr_006_691A:
    ld   hl, wEntitiesPosZTable                   ; $691A: $21 $10 $C3
    add  hl, bc                                   ; $691D: $09
    ld   [hl], $20                                ; $691E: $36 $20
    ld   hl, wEntitiesSpeedXTable                       ; $6920: $21 $40 $C2
    add  hl, bc                                   ; $6923: $09
    ld   [hl], $18                                ; $6924: $36 $18
    ld   hl, wEntitiesSpeedYTable                       ; $6926: $21 $50 $C2
    add  hl, bc                                   ; $6929: $09
    ld   [hl], $10                                ; $692A: $36 $10
    jp   IncrementEntityWalkingAttr               ; $692C: $C3 $12 $3B

    call func_006_65B4                            ; $692F: $CD $B4 $65
    ld   a, e                                     ; $6932: $7B
    xor  $01                                      ; $6933: $EE $01
    ldh  [hLinkDirection], a                      ; $6935: $E0 $9E
    ld   a, $02                                   ; $6937: $3E $02
    ldh  [$FFA1], a                               ; $6939: $E0 $A1
    ld   a, $05                                   ; $693B: $3E $05
    ld   [wC111], a                               ; $693D: $EA $11 $C1
    call func_006_69BD                            ; $6940: $CD $BD $69
    call func_006_6541                            ; $6943: $CD $41 $65
    ld   hl, wEntitiesPosZTable                   ; $6946: $21 $10 $C3
    add  hl, bc                                   ; $6949: $09
    ld   a, [hl]                                  ; $694A: $7E
    and  a                                        ; $694B: $A7
    jr   nz, jr_006_6951                          ; $694C: $20 $03

    jp   IncrementEntityWalkingAttr               ; $694E: $C3 $12 $3B

jr_006_6951:
    ld   hl, wEntitiesSpeedZTable                 ; $6951: $21 $20 $C3
    add  hl, bc                                   ; $6954: $09
    ld   [hl], $FC                                ; $6955: $36 $FC
    call func_006_657A                            ; $6957: $CD $7A $65
    call PlayBoomerangSfx_trampoline               ; $695A: $CD $F8 $29
    ldh  a, [hFrameCounter]                       ; $695D: $F0 $E7
    and  $03                                      ; $695F: $E6 $03
    ret  nz                                       ; $6961: $C0

    ld   a, $00                                   ; $6962: $3E $00
    ld   hl, wEntitiesSpeedYTable                       ; $6964: $21 $50 $C2
    call func_006_6A2B                            ; $6967: $CD $2B $6A
    ld   a, $00                                   ; $696A: $3E $00
    ld   hl, wEntitiesSpeedXTable                       ; $696C: $21 $40 $C2
    jp   label_006_6A2B                           ; $696F: $C3 $2B $6A

    call func_006_64C6                            ; $6972: $CD $C6 $64
    call func_006_641A                            ; $6975: $CD $1A $64
    ld   a, [wTransitionSequenceCounter]          ; $6978: $FA $6B $C1
    cp   $04                                      ; $697B: $FE $04
    ret  nz                                       ; $697D: $C0

    ld   a, [wFreeMovementMode]                   ; $697E: $FA $7B $C1
    and  a                                        ; $6981: $A7
    ret  nz                                       ; $6982: $C0

    ldh  a, [hMapRoom]                            ; $6983: $F0 $F6
    cp   $06                                      ; $6985: $FE $06
    jr   nz, jr_006_6990                          ; $6987: $20 $07

    ld   a, $CD                                   ; $6989: $3E $CD
    call OpenDialog                               ; $698B: $CD $85 $23
    jr   jr_006_6993                              ; $698E: $18 $03

jr_006_6990:
    call label_2A07                               ; $6990: $CD $07 $2A

jr_006_6993:
    ld   a, $19                                   ; $6993: $3E $19
    ld   [wDialogSFX], a                          ; $6995: $EA $AB $C5
    call IncrementEntityWalkingAttr               ; $6998: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $699B: $CD $05 $0C
    ld   [hl], $10                                ; $699E: $36 $10
    ret                                           ; $69A0: $C9

    call func_006_64C6                            ; $69A1: $CD $C6 $64
    ldh  a, [hMapRoom]                            ; $69A4: $F0 $F6
    cp   $06                                      ; $69A6: $FE $06
    jr   z, jr_006_69B2                           ; $69A8: $28 $08

    call GetEntityTransitionCountdown             ; $69AA: $CD $05 $0C
    jr   nz, jr_006_69BD                          ; $69AD: $20 $0E

    call IncrementEntityWalkingAttr               ; $69AF: $CD $12 $3B

jr_006_69B2:
    ldh  a, [hMapRoom]                            ; $69B2: $F0 $F6
    ld   e, a                                     ; $69B4: $5F
    ld   d, b                                     ; $69B5: $50
    ld   hl, wOverworldRoomStatus                 ; $69B6: $21 $00 $D8
    add  hl, de                                   ; $69B9: $19
    set  5, [hl]                                  ; $69BA: $CB $EE
    ret                                           ; $69BC: $C9

func_006_69BD:
jr_006_69BD:
    ld   a, $02                                   ; $69BD: $3E $02
    ldh  [$FFA1], a                               ; $69BF: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $69C1: $F0 $E7
    rra                                           ; $69C3: $1F
    rra                                           ; $69C4: $1F
    and  $02                                      ; $69C5: $E6 $02
    jp   SetEntitySpriteVariant                   ; $69C7: $C3 $0C $3B

    call func_006_64C6                            ; $69CA: $CD $C6 $64
    call func_006_69BD                            ; $69CD: $CD $BD $69
    call func_006_6541                            ; $69D0: $CD $41 $65
    call func_006_5E54                            ; $69D3: $CD $54 $5E
    ld   hl, wEntitiesSpeedZTable                 ; $69D6: $21 $20 $C3
    add  hl, bc                                   ; $69D9: $09
    ld   [hl], $04                                ; $69DA: $36 $04
    call func_006_657A                            ; $69DC: $CD $7A $65
    ld   hl, wEntitiesStatusTable                        ; $69DF: $21 $80 $C2
    add  hl, bc                                   ; $69E2: $09
    ld   a, [hl]                                  ; $69E3: $7E
    and  a                                        ; $69E4: $A7
    jr   nz, jr_006_6A05                          ; $69E5: $20 $1E

    ld   hl, wEntitiesUnknownTableB               ; $69E7: $21 $B0 $C2
    add  hl, bc                                   ; $69EA: $09
    ld   a, [hl]                                  ; $69EB: $7E
    ld   [wActiveMusicTrack], a                   ; $69EC: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $69EF: $E0 $B0
    ld   a, [wActivePowerUp]                      ; $69F1: $FA $7C $D4
    and  a                                        ; $69F4: $A7
    jr   z, jr_006_6A04                           ; $69F5: $28 $0D

    ld   a, [wTunicType]                          ; $69F7: $FA $0F $DC
    and  a                                        ; $69FA: $A7
    jr   nz, jr_006_6A04                          ; $69FB: $20 $07

    ld   a, $49                                   ; $69FD: $3E $49
    ld   [wActiveMusicTrack], a                   ; $69FF: $EA $68 $D3
    ldh  [$FFBD], a                               ; $6A02: $E0 $BD

jr_006_6A04:
    ret                                           ; $6A04: $C9

jr_006_6A05:
    ldh  a, [hFrameCounter]                       ; $6A05: $F0 $E7
    and  $07                                      ; $6A07: $E6 $07
    jr   nz, jr_006_6A0F                          ; $6A09: $20 $04

    ld   a, $05                                   ; $6A0B: $3E $05
    ldh  [hNoiseSfx], a                           ; $6A0D: $E0 $F4

jr_006_6A0F:
    ldh  a, [hFrameCounter]                       ; $6A0F: $F0 $E7
    and  $01                                      ; $6A11: $E6 $01
    jr   nz, jr_006_6A36                          ; $6A13: $20 $21

    ld   a, $20                                   ; $6A15: $3E $20
    call label_3BB5                               ; $6A17: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $6A1A: $F0 $D7
    cpl                                           ; $6A1C: $2F
    inc  a                                        ; $6A1D: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $6A1E: $21 $50 $C2
    call func_006_6A2B                            ; $6A21: $CD $2B $6A
    ldh  a, [hScratch1]                           ; $6A24: $F0 $D8
    cpl                                           ; $6A26: $2F
    inc  a                                        ; $6A27: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $6A28: $21 $40 $C2

func_006_6A2B:
label_006_6A2B:
    add  hl, bc                                   ; $6A2B: $09
    sub  [hl]                                     ; $6A2C: $96
    jr   z, jr_006_6A36                           ; $6A2D: $28 $07

    bit  7, a                                     ; $6A2F: $CB $7F
    jr   z, jr_006_6A35                           ; $6A31: $28 $02

    dec  [hl]                                     ; $6A33: $35
    dec  [hl]                                     ; $6A34: $35

jr_006_6A35:
    inc  [hl]                                     ; $6A35: $34

jr_006_6A36:
    ret                                           ; $6A36: $C9

    ld   a, b                                     ; $6A37: $78
    ld   bc, label_2178                           ; $6A38: $01 $78 $21
    ld   a, d                                     ; $6A3B: $7A
    ld   bc, $217A                                ; $6A3C: $01 $7A $21
    nop                                           ; $6A3F: $00
    ld   hl, sp+$7C                               ; $6A40: $F8 $7C
    ld   bc, $0000                                ; $6A42: $01 $00 $00
    ld   a, [hl]                                  ; $6A45: $7E
    ld   bc, label_800                            ; $6A46: $01 $00 $08
    ld   a, [hl]                                  ; $6A49: $7E
    ld   hl, label_1000                           ; $6A4A: $21 $00 $10
    ld   a, h                                     ; $6A4D: $7C
    ld   hl, $F1F0                                ; $6A4E: $21 $F0 $F1
    cp   $02                                      ; $6A51: $FE $02
    jr   nc, jr_006_6A5B                          ; $6A53: $30 $06

    ld   de, $6A37                                ; $6A55: $11 $37 $6A
    jp   RenderAnimatedActiveEntity                               ; $6A58: $C3 $C0 $3B

jr_006_6A5B:
    ld   hl, $6A3F                                ; $6A5B: $21 $3F $6A
    ld   c, $04                                   ; $6A5E: $0E $04
    call label_3CE6                               ; $6A60: $CD $E6 $3C
    ld   a, $04                                   ; $6A63: $3E $04
    call label_3DA0                               ; $6A65: $CD $A0 $3D
    ldh  a, [hMapRoom]                            ; $6A68: $F0 $F6
    cp   $08                                      ; $6A6A: $FE $08
    jr   z, jr_006_6A71                           ; $6A6C: $28 $03

    jp   label_3CD9                               ; $6A6E: $C3 $D9 $3C

jr_006_6A71:
    ld   hl, $C340                                ; $6A71: $21 $40 $C3
    add  hl, bc                                   ; $6A74: $09
    res  4, [hl]                                  ; $6A75: $CB $A6
    ret                                           ; $6A77: $C9

    ld   d, b                                     ; $6A78: $50
    ld   [bc], a                                  ; $6A79: $02
    ld   d, d                                     ; $6A7A: $52
    ld   [bc], a                                  ; $6A7B: $02
    ldh  a, [wActiveEntityPosY]                   ; $6A7C: $F0 $EC
    sub  $05                                      ; $6A7E: $D6 $05
    ldh  [wActiveEntityPosY], a                   ; $6A80: $E0 $EC
    ld   de, $6A78                                ; $6A82: $11 $78 $6A
    call RenderAnimatedActiveEntity                               ; $6A85: $CD $C0 $3B
    call func_006_64C6                            ; $6A88: $CD $C6 $64
    call func_006_645D                            ; $6A8B: $CD $5D $64
    ret  nc                                       ; $6A8E: $D0

    ld   e, $FD                                   ; $6A8F: $1E $FD
    ldh  a, [hMapRoom]                            ; $6A91: $F0 $F6
    cp   $A9                                      ; $6A93: $FE $A9
    jp   z, label_006_6BAD                        ; $6A95: $CA $AD $6B

    ld   e, $6E                                   ; $6A98: $1E $6E
    ld   a, [wTradeSequenceItem]                  ; $6A9A: $FA $0E $DB
    cp   $0A                                      ; $6A9D: $FE $0A
    jr   nz, jr_006_6AA9                          ; $6A9F: $20 $08

    ld   a, [wHasInstrument5]                     ; $6AA1: $FA $69 $DB
    and  $02                                      ; $6AA4: $E6 $02
    jp   nz, label_006_6BAD                       ; $6AA6: $C2 $AD $6B

jr_006_6AA9:
    ld   e, $41                                   ; $6AA9: $1E $41
    ld   a, [$DAA9]                               ; $6AAB: $FA $A9 $DA
    and  $20                                      ; $6AAE: $E6 $20
    jp   z, label_006_6BAD                        ; $6AB0: $CA $AD $6B

    ld   e, $46                                   ; $6AB3: $1E $46
    ld   a, [wHasInstrument1]                     ; $6AB5: $FA $65 $DB
    and  $02                                      ; $6AB8: $E6 $02
    jp   z, label_006_6BAD                        ; $6ABA: $CA $AD $6B

    ld   e, $42                                   ; $6ABD: $1E $42
    ld   a, [wIsBowWowFollowingLink]              ; $6ABF: $FA $56 $DB
    cp   $80                                      ; $6AC2: $FE $80
    jp   z, label_006_6BAD                        ; $6AC4: $CA $AD $6B

    ld   e, $43                                   ; $6AC7: $1E $43
    ld   a, [wHasInstrument2]                     ; $6AC9: $FA $66 $DB
    and  $02                                      ; $6ACC: $E6 $02
    jp   z, label_006_6BAD                        ; $6ACE: $CA $AD $6B

    ld   e, $44                                   ; $6AD1: $1E $44
    ld   a, [wIsBowWowFollowingLink]              ; $6AD3: $FA $56 $DB
    cp   $01                                      ; $6AD6: $FE $01
    jp   z, label_006_6BB3                        ; $6AD8: $CA $B3 $6B

    ld   e, $44                                   ; $6ADB: $1E $44
    ld   a, [wDB55]                               ; $6ADD: $FA $55 $DB
    cp   $02                                      ; $6AE0: $FE $02
    jp   nz, label_006_6BAD                       ; $6AE2: $C2 $AD $6B

    ld   e, $45                                   ; $6AE5: $1E $45
    ld   a, [wTradeSequenceItem]                  ; $6AE7: $FA $0E $DB
    cp   $05                                      ; $6AEA: $FE $05
    jp   c, label_006_6BAD                        ; $6AEC: $DA $AD $6B

    ld   a, [wGoldenLeavesCount]                  ; $6AEF: $FA $15 $DB
    cp   $05                                      ; $6AF2: $FE $05
    jr   nc, jr_006_6B09                          ; $6AF4: $30 $13

    ld   hl, wEntitiesUnknownTableB               ; $6AF6: $21 $B0 $C2
    add  hl, bc                                   ; $6AF9: $09
    inc  [hl]                                     ; $6AFA: $34
    ld   a, [hl]                                  ; $6AFB: $7E
    cp   $03                                      ; $6AFC: $FE $03
    jr   nz, jr_006_6B02                          ; $6AFE: $20 $02

    xor  a                                        ; $6B00: $AF
    ld   [hl], a                                  ; $6B01: $77

jr_006_6B02:
    ld   e, $28                                   ; $6B02: $1E $28
    add  e                                        ; $6B04: $83
    ld   e, a                                     ; $6B05: $5F
    jp   label_006_6BB3                           ; $6B06: $C3 $B3 $6B

jr_006_6B09:
    ld   e, $48                                   ; $6B09: $1E $48
    jp   z, label_006_6BAD                        ; $6B0B: $CA $AD $6B

    cp   $06                                      ; $6B0E: $FE $06
    jp   nz, label_006_6BAD                       ; $6B10: $C2 $AD $6B

    ld   e, $49                                   ; $6B13: $1E $49
    ld   a, [wHasInstrument3]                     ; $6B15: $FA $67 $DB
    and  $02                                      ; $6B18: $E6 $02
    jp   z, label_006_6BAD                        ; $6B1A: $CA $AD $6B

    ld   e, $4A                                   ; $6B1D: $1E $4A
    ld   a, [wHasAnglerKey]                       ; $6B1F: $FA $12 $DB
    and  a                                        ; $6B22: $A7
    jp   z, label_006_6BAD                        ; $6B23: $CA $AD $6B

    ld   e, $40                                   ; $6B26: $1E $40
    ld   a, [wHasInstrument4]                     ; $6B28: $FA $68 $DB
    and  $02                                      ; $6B2B: $E6 $02
    jp   z, label_006_6BB3                        ; $6B2D: $CA $B3 $6B

    ld   a, [wIsGhostFollowingLink]               ; $6B30: $FA $79 $DB
    and  a                                        ; $6B33: $A7
    jr   z, jr_006_6B3F                           ; $6B34: $28 $09

    ld   e, $4B                                   ; $6B36: $1E $4B
    ld   a, [$D9E3]                               ; $6B38: $FA $E3 $D9
    and  $40                                      ; $6B3B: $E6 $40
    jr   z, jr_006_6BAD                           ; $6B3D: $28 $6E

jr_006_6B3F:
    ld   e, $4C                                   ; $6B3F: $1E $4C
    ld   a, [wHasInstrument5]                     ; $6B41: $FA $69 $DB
    and  $02                                      ; $6B44: $E6 $02
    jr   z, jr_006_6BAD                           ; $6B46: $28 $65

    ld   e, $45                                   ; $6B48: $1E $45
    ld   a, [wOcarinaSongFlags]                  ; $6B4A: $FA $49 $DB
    and  $01                                      ; $6B4D: $E6 $01
    jp   z, label_006_6BB3                        ; $6B4F: $CA $B3 $6B

    ld   e, $4D                                   ; $6B52: $1E $4D
    ld   a, [wHasInstrument6]                     ; $6B54: $FA $6A $DB
    and  $02                                      ; $6B57: $E6 $02
    jr   z, jr_006_6BAD                           ; $6B59: $28 $52

    ld   e, $4E                                   ; $6B5B: $1E $4E
    ld   a, [wIsRoosterFollowingLink]             ; $6B5D: $FA $7B $DB
    and  a                                        ; $6B60: $A7
    jr   z, jr_006_6B6E                           ; $6B61: $28 $0B

    ld   e, $46                                   ; $6B63: $1E $46
    ld   a, [wHasBirdKey]                         ; $6B65: $FA $14 $DB
    and  a                                        ; $6B68: $A7
    jp   z, label_006_6BB3                        ; $6B69: $CA $B3 $6B

    ld   e, $41                                   ; $6B6C: $1E $41

jr_006_6B6E:
    ld   a, [wHasInstrument7]                     ; $6B6E: $FA $6B $DB
    and  $02                                      ; $6B71: $E6 $02
    jr   nz, jr_006_6B7C                          ; $6B73: $20 $07

    ld   a, e                                     ; $6B75: $7B
    cp   $4E                                      ; $6B76: $FE $4E
    jr   z, jr_006_6BAD                           ; $6B78: $28 $33

    jr   jr_006_6BB3                              ; $6B7A: $18 $37

jr_006_6B7C:
    ld   e, $4F                                   ; $6B7C: $1E $4F
    ld   a, [$D810]                               ; $6B7E: $FA $10 $D8
    and  $30                                      ; $6B81: $E6 $30
    jr   z, jr_006_6BAD                           ; $6B83: $28 $28

    ld   e, $48                                   ; $6B85: $1E $48
    ld   a, [wHasInstrument8]                     ; $6B87: $FA $6C $DB
    and  $02                                      ; $6B8A: $E6 $02
    jr   z, jr_006_6BB3                           ; $6B8C: $28 $25

    ld   e, $42                                   ; $6B8E: $1E $42
    ld   a, [$D806]                               ; $6B90: $FA $06 $D8
    and  $30                                      ; $6B93: $E6 $30
    jr   z, jr_006_6BB3                           ; $6B95: $28 $1C

    ld   e, $43                                   ; $6B97: $1E $43
    ld   a, [$DA74]                               ; $6B99: $FA $74 $DA
    and  $40                                      ; $6B9C: $E6 $40
    jr   z, jr_006_6BB3                           ; $6B9E: $28 $13

    ld   e, $47                                   ; $6BA0: $1E $47
    ld   a, [wSwordLevel]                         ; $6BA2: $FA $4E $DB
    cp   $02                                      ; $6BA5: $FE $02
    jr   c, jr_006_6BB3                           ; $6BA7: $38 $0A

    ld   e, $48                                   ; $6BA9: $1E $48
    jr   jr_006_6BB3                              ; $6BAB: $18 $06

label_006_6BAD:
jr_006_6BAD:
    ld   a, e                                     ; $6BAD: $7B
    call OpenDialogInTable1                       ; $6BAE: $CD $73 $23
    jr   jr_006_6BB7                              ; $6BB1: $18 $04

label_006_6BB3:
jr_006_6BB3:
    ld   a, e                                     ; $6BB3: $7B
    call OpenDialogInTable2                       ; $6BB4: $CD $7C $23

jr_006_6BB7:
    ld   hl, $DAA9                                ; $6BB7: $21 $A9 $DA
    set  5, [hl]                                  ; $6BBA: $CB $EE
    ret                                           ; $6BBC: $C9

; Array, indexed by hActiveEntitySpriteVariant
;  byte 0: tile n°
;  byte 1: OAM attribute (palette index and flags)
ButterflyOAMData::
._00 db $5E, %001
._01 db $5E, %001 | OAMF_YFLIP

; Randomly-selected X or Y speed
ButterflyPossibleSpeeds::
    db $04, -$04, $03, -$03, $02, -$02, $05, -$06

ButterflyEntityHandler::
    ; If the butterfly wings are downwards…
    ldh  a, [hActiveEntitySpriteVariant]          ; $6BC9
    cp   $01                                      ; $6BCB: $FE $01
    jr   nz, .downwardsEnd                        ; $6BCD: $20 $06
    ; … wActiveEntityPosY = wActiveEntityPosY - 0 (unused?)
    ldh  a, [wActiveEntityPosY]                   ; $6BCF: $F0 $EC
    sub  $00                                      ; $6BD1: $D6 $00
    ldh  [wActiveEntityPosY], a                   ; $6BD3: $E0 $EC
.downwardsEnd

    ld   de, ButterflyOAMData                     ; $6BD5: $11 $BD $6B
    call RenderSimpleEntityWithSpriteVariantToOAM ; $6BD8: $CD $77 $3C
    call func_006_64C6                            ; $6BDB: $CD $C6 $64

    ; a = c * 8 + [hFrameCounter]
    ld   a, c                                     ; $6BDE: $79
    sla  a                                        ; $6BDF: $CB $27
    sla  a                                        ; $6BE1: $CB $27
    sla  a                                        ; $6BE3: $CB $27
    ld   hl, hFrameCounter                        ; $6BE5: $21 $E7 $FF
    add  [hl]                                     ; $6BE8: $86
    ldh  [hActiveEntityState], a                  ; $6BE9: $E0 $F0
    rra                                           ; $6BEB: $1F
    rra                                           ; $6BEC: $1F
    rra                                           ; $6BED: $1F
    and  $01                                      ; $6BEE: $E6 $01
    call SetEntitySpriteVariant                   ; $6BF0: $CD $0C $3B
    call func_006_6541                            ; $6BF3: $CD $41 $65
    ldh  a, [hActiveEntityState]                  ; $6BF6: $F0 $F0
    and  $1F                                      ; $6BF8: $E6 $1F
    jr   nz, jr_006_6C12                          ; $6BFA: $20 $16

    call GetRandomByte                            ; $6BFC: $CD $0D $28
    and  $07                                      ; $6BFF: $E6 $07
    ld   e, a                                     ; $6C01: $5F
    ld   d, b                                     ; $6C02: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C03: $21 $C1 $6B
    add  hl, de                                   ; $6C06: $19
    ld   a, [hl]                                  ; $6C07: $7E
    ld   hl, wEntitiesUnknownTableB               ; $6C08: $21 $B0 $C2
    add  hl, bc                                   ; $6C0B: $09
    add  [hl]                                     ; $6C0C: $86
    ld   hl, wEntitiesSpeedXTable                       ; $6C0D: $21 $40 $C2
    add  hl, bc                                   ; $6C10: $09
    ld   [hl], a                                  ; $6C11: $77

jr_006_6C12:
    ldh  a, [hActiveEntityState]                  ; $6C12: $F0 $F0
    add  $10                                      ; $6C14: $C6 $10
    and  $1F                                      ; $6C16: $E6 $1F
    jr   nz, jr_006_6C30                          ; $6C18: $20 $16

    call GetRandomByte                            ; $6C1A: $CD $0D $28
    and  $07                                      ; $6C1D: $E6 $07
    ld   e, a                                     ; $6C1F: $5F
    ld   d, b                                     ; $6C20: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C21: $21 $C1 $6B
    add  hl, de                                   ; $6C24: $19
    ld   a, [hl]                                  ; $6C25: $7E
    ld   hl, wEntitiesUnknownTableC               ; $6C26: $21 $C0 $C2
    add  hl, bc                                   ; $6C29: $09
    add  [hl]                                     ; $6C2A: $86
    ld   hl, wEntitiesSpeedYTable                       ; $6C2B: $21 $50 $C2
    add  hl, bc                                   ; $6C2E: $09
    ld   [hl], a                                  ; $6C2F: $77

jr_006_6C30:
    ldh  a, [hActiveEntityState]                  ; $6C30: $F0 $F0
    and  $3F                                      ; $6C32: $E6 $3F
    jr   nz, jr_006_6C6C                          ; $6C34: $20 $36

    ldh  a, [hLinkPositionX]                      ; $6C36: $F0 $98
    push af                                       ; $6C38: $F5
    ldh  a, [hLinkPositionY]                      ; $6C39: $F0 $99
    push af                                       ; $6C3B: $F5
    ld   a, [$C50F]                               ; $6C3C: $FA $0F $C5
    cp   $FF                                      ; $6C3F: $FE $FF
    jr   z, jr_006_6C53                           ; $6C41: $28 $10

    ld   e, a                                     ; $6C43: $5F
    ld   d, b                                     ; $6C44: $50
    ld   hl, wEntitiesPosXTable                         ; $6C45: $21 $00 $C2
    add  hl, de                                   ; $6C48: $19
    ld   a, [hl]                                  ; $6C49: $7E
    ldh  [hLinkPositionX], a                      ; $6C4A: $E0 $98
    ld   hl, wEntitiesPosYTable                         ; $6C4C: $21 $10 $C2
    add  hl, de                                   ; $6C4F: $19
    ld   a, [hl]                                  ; $6C50: $7E
    ldh  [hLinkPositionY], a                      ; $6C51: $E0 $99

jr_006_6C53:
    ld   a, $02                                   ; $6C53: $3E $02
    call label_3BB5                               ; $6C55: $CD $B5 $3B
    pop  af                                       ; $6C58: $F1
    ldh  [hLinkPositionY], a                      ; $6C59: $E0 $99
    pop  af                                       ; $6C5B: $F1
    ldh  [hLinkPositionX], a                      ; $6C5C: $E0 $98
    ldh  a, [hScratch0]                           ; $6C5E: $F0 $D7
    ld   hl, wEntitiesUnknownTableC               ; $6C60: $21 $C0 $C2
    add  hl, bc                                   ; $6C63: $09
    ld   [hl], a                                  ; $6C64: $77
    ldh  a, [hScratch1]                           ; $6C65: $F0 $D8
    ld   hl, wEntitiesUnknownTableB               ; $6C67: $21 $B0 $C2
    add  hl, bc                                   ; $6C6A: $09
    ld   [hl], a                                  ; $6C6B: $77

jr_006_6C6C:
    ret                                           ; $6C6C: $C9

    ld   a, c                                     ; $6C6D: $79
    ld   [$D202], a                               ; $6C6E: $EA $02 $D2
    ldh  a, [hMapId]                              ; $6C71: $F0 $F7
    cp   $07                                      ; $6C73: $FE $07
    jr   nz, jr_006_6C7B                          ; $6C75: $20 $04

    ld   a, $10                                   ; $6C77: $3E $10
    ldh  [hFFF5], a                               ; $6C79: $E0 $F5

jr_006_6C7B:
    call $6E7E                                    ; $6C7B: $CD $7E $6E
    call label_3EE8                               ; $6C7E: $CD $E8 $3E
    call label_394D                               ; $6C81: $CD $4D $39
    ldh  a, [hActiveEntityStatus]                 ; $6C84: $F0 $EA
    cp   $05                                      ; $6C86: $FE $05
    jr   z, jr_006_6CE8                           ; $6C88: $28 $5E

    ld   hl, $C430                                ; $6C8A: $21 $30 $C4
    add  hl, bc                                   ; $6C8D: $09
    ld   [hl], $80                                ; $6C8E: $36 $80
    ld   hl, wEntitiesUnknownTableB               ; $6C90: $21 $B0 $C2
    add  hl, bc                                   ; $6C93: $09
    ld   a, [hl]                                  ; $6C94: $7E
    rst  $00                                      ; $6C95: $C7
    sbc  d                                        ; $6C96: $9A
    ld   l, h                                     ; $6C97: $6C
    xor  e                                        ; $6C98: $AB
    ld   l, h                                     ; $6C99: $6C
    call GetEntityTransitionCountdown             ; $6C9A: $CD $05 $0C
    ld   [hl], $FF                                ; $6C9D: $36 $FF
    ld   hl, $C420                                ; $6C9F: $21 $20 $C4
    add  hl, bc                                   ; $6CA2: $09
    ld   [hl], $FF                                ; $6CA3: $36 $FF
    ld   hl, wEntitiesUnknownTableB               ; $6CA5: $21 $B0 $C2
    add  hl, bc                                   ; $6CA8: $09
    inc  [hl]                                     ; $6CA9: $34
    ret                                           ; $6CAA: $C9

    call GetEntityTransitionCountdown             ; $6CAB: $CD $05 $0C
    jp   z, label_006_6CBE                        ; $6CAE: $CA $BE $6C

    ld   hl, $C420                                ; $6CB1: $21 $20 $C4
    add  hl, bc                                   ; $6CB4: $09
    ld   [hl], a                                  ; $6CB5: $77
    cp   $80                                      ; $6CB6: $FE $80
    jr   nc, jr_006_6CBD                          ; $6CB8: $30 $03

    call func_006_700A                            ; $6CBA: $CD $0A $70

jr_006_6CBD:
    ret                                           ; $6CBD: $C9

label_006_6CBE:
    call label_27DD                               ; $6CBE: $CD $DD $27
    call label_3F50                               ; $6CC1: $CD $50 $3F
    ldh  a, [hMapId]                              ; $6CC4: $F0 $F7
    cp   $07                                      ; $6CC6: $FE $07
    ret  z                                        ; $6CC8: $C8

label_006_6CC9:
    ld   hl, wIndoorARoomStatus                   ; $6CC9: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6CCC: $F0 $F6
    ld   e, a                                     ; $6CCE: $5F
    ld   d, b                                     ; $6CCF: $50
    ldh  a, [hMapId]                              ; $6CD0: $F0 $F7
    cp   $FF                                      ; $6CD2: $FE $FF
    jr   nz, jr_006_6CDB                          ; $6CD4: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6CD6: $21 $E0 $DD
    jr   jr_006_6CE4                              ; $6CD9: $18 $09

jr_006_6CDB:
    cp   $1A                                      ; $6CDB: $FE $1A
    jr   nc, jr_006_6CE4                          ; $6CDD: $30 $05

    cp   $06                                      ; $6CDF: $FE $06
    jr   c, jr_006_6CE4                           ; $6CE1: $38 $01

    inc  d                                        ; $6CE3: $14

jr_006_6CE4:
    add  hl, de                                   ; $6CE4: $19
    set  5, [hl]                                  ; $6CE5: $CB $EE
    ret                                           ; $6CE7: $C9

jr_006_6CE8:
    call func_006_64C6                            ; $6CE8: $CD $C6 $64
    call func_006_64F7                            ; $6CEB: $CD $F7 $64
    call label_3B39                               ; $6CEE: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6CF1: $21 $60 $C3
    add  hl, bc                                   ; $6CF4: $09
    ld   a, [hl]                                  ; $6CF5: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $6CF6: $E0 $E9
    ld   hl, wEntitiesSpeedXTable                       ; $6CF8: $21 $40 $C2
    add  hl, bc                                   ; $6CFB: $09
    ld   a, [hl]                                  ; $6CFC: $7E
    and  a                                        ; $6CFD: $A7
    jr   z, jr_006_6D0D                           ; $6CFE: $28 $0D

    ld   e, $00                                   ; $6D00: $1E $00
    and  $80                                      ; $6D02: $E6 $80
    jr   nz, jr_006_6D08                          ; $6D04: $20 $02

    ld   e, $03                                   ; $6D06: $1E $03

jr_006_6D08:
    ld   hl, $C380                                ; $6D08: $21 $80 $C3
    add  hl, bc                                   ; $6D0B: $09
    ld   [hl], e                                  ; $6D0C: $73

jr_006_6D0D:
    call func_006_657A                            ; $6D0D: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6D10: $21 $20 $C3
    add  hl, bc                                   ; $6D13: $09
    dec  [hl]                                     ; $6D14: $35
    dec  [hl]                                     ; $6D15: $35
    nop                                           ; $6D16: $00
    nop                                           ; $6D17: $00
    ld   hl, wEntitiesPosZTable                   ; $6D18: $21 $10 $C3
    add  hl, bc                                   ; $6D1B: $09
    ld   a, [hl]                                  ; $6D1C: $7E
    and  $80                                      ; $6D1D: $E6 $80
    ldh  [hFFE8], a                               ; $6D1F: $E0 $E8
    jr   z, jr_006_6D32                           ; $6D21: $28 $0F

    ld   [hl], b                                  ; $6D23: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6D24: $21 $20 $C3
    add  hl, bc                                   ; $6D27: $09
    ld   a, [hl]                                  ; $6D28: $7E
    ld   [hl], b                                  ; $6D29: $70
    cp   $F2                                      ; $6D2A: $FE $F2
    jr   nc, jr_006_6D32                          ; $6D2C: $30 $04

    ld   a, $20                                   ; $6D2E: $3E $20
    ldh  [hJingle], a                             ; $6D30: $E0 $F2

jr_006_6D32:
    ldh  a, [hActiveEntityState]                  ; $6D32: $F0 $F0
    rst  $00                                      ; $6D34: $C7
    dec  a                                        ; $6D35: $3D
    ld   l, l                                     ; $6D36: $6D
    ld   a, e                                     ; $6D37: $7B
    ld   l, l                                     ; $6D38: $6D
    xor  c                                        ; $6D39: $A9
    ld   l, l                                     ; $6D3A: $6D
    or   b                                        ; $6D3B: $B0
    ld   l, l                                     ; $6D3C: $6D
    call GetEntityTransitionCountdown             ; $6D3D: $CD $05 $0C
    ret  nz                                       ; $6D40: $C0

    ld   a, [$D201]                               ; $6D41: $FA $01 $D2
    ld   e, a                                     ; $6D44: $5F
    ld   d, b                                     ; $6D45: $50
    ld   hl, wEntitiesPosXTable                         ; $6D46: $21 $00 $C2
    add  hl, de                                   ; $6D49: $19
    ldh  a, [wActiveEntityPosX]                   ; $6D4A: $F0 $EE
    sub  [hl]                                     ; $6D4C: $96
    ld   e, $08                                   ; $6D4D: $1E $08
    bit  7, a                                     ; $6D4F: $CB $7F
    jr   nz, jr_006_6D55                          ; $6D51: $20 $02

    ld   e, $F8                                   ; $6D53: $1E $F8

jr_006_6D55:
    ld   hl, wEntitiesSpeedXTable                       ; $6D55: $21 $40 $C2
    add  hl, bc                                   ; $6D58: $09
    ld   [hl], e                                  ; $6D59: $73
    add  $10                                      ; $6D5A: $C6 $10
    cp   $20                                      ; $6D5C: $FE $20
    jr   nc, jr_006_6D68                          ; $6D5E: $30 $08

    call GetEntityTransitionCountdown             ; $6D60: $CD $05 $0C
    ld   [hl], $18                                ; $6D63: $36 $18
    jp   IncrementEntityWalkingAttr               ; $6D65: $C3 $12 $3B

jr_006_6D68:
    call func_006_654E                            ; $6D68: $CD $4E $65
    ldh  a, [hFFE8]                               ; $6D6B: $F0 $E8
    and  a                                        ; $6D6D: $A7
    jr   z, jr_006_6D76                           ; $6D6E: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6D70: $21 $20 $C3
    add  hl, bc                                   ; $6D73: $09
    ld   [hl], $0C                                ; $6D74: $36 $0C

jr_006_6D76:
    ld   a, $01                                   ; $6D76: $3E $01
    jp   SetEntitySpriteVariant                   ; $6D78: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6D7B: $CD $05 $0C
    ret  nz                                       ; $6D7E: $C0

    ld   hl, $C380                                ; $6D7F: $21 $80 $C3
    add  hl, bc                                   ; $6D82: $09
    ld   a, [hl]                                  ; $6D83: $7E
    and  a                                        ; $6D84: $A7
    ld   a, $10                                   ; $6D85: $3E $10
    jr   nz, jr_006_6D8B                          ; $6D87: $20 $02

    ld   a, $F0                                   ; $6D89: $3E $F0

jr_006_6D8B:
    push af                                       ; $6D8B: $F5
    ld   a, [$D201]                               ; $6D8C: $FA $01 $D2
    ld   e, a                                     ; $6D8F: $5F
    ld   d, b                                     ; $6D90: $50
    ld   hl, wEntitiesSpeedXTable                       ; $6D91: $21 $40 $C2
    add  hl, de                                   ; $6D94: $19
    pop  af                                       ; $6D95: $F1
    ld   [hl], a                                  ; $6D96: $77
    ld   hl, wEntitiesStateTable                  ; $6D97: $21 $90 $C2
    add  hl, de                                   ; $6D9A: $19
    ld   [hl], $01                                ; $6D9B: $36 $01
    call GetEntityTransitionCountdown             ; $6D9D: $CD $05 $0C
    ld   [hl], $20                                ; $6DA0: $36 $20
    call IncrementEntityWalkingAttr               ; $6DA2: $CD $12 $3B
    xor  a                                        ; $6DA5: $AF
    jp   SetEntitySpriteVariant                   ; $6DA6: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6DA9: $CD $05 $0C
    ret  nz                                       ; $6DAC: $C0

    jp   IncrementEntityWalkingAttr               ; $6DAD: $C3 $12 $3B

    ld   hl, wEntitiesPosZTable                   ; $6DB0: $21 $10 $C3
    add  hl, bc                                   ; $6DB3: $09
    ld   a, [hl]                                  ; $6DB4: $7E
    cp   $08                                      ; $6DB5: $FE $08
    ld   a, $01                                   ; $6DB7: $3E $01
    jr   c, jr_006_6DBC                           ; $6DB9: $38 $01

    inc  a                                        ; $6DBB: $3C

jr_006_6DBC:
    call SetEntitySpriteVariant                   ; $6DBC: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DBF: $CD $05 $0C
    cp   $01                                      ; $6DC2: $FE $01
    jr   z, jr_006_6DD4                           ; $6DC4: $28 $0E

    cp   $00                                      ; $6DC6: $FE $00
    ret  nz                                       ; $6DC8: $C0

    ldh  a, [hFFE8]                               ; $6DC9: $F0 $E8
    and  a                                        ; $6DCB: $A7
    jr   z, jr_006_6E04                           ; $6DCC: $28 $36

    call GetEntityTransitionCountdown             ; $6DCE: $CD $05 $0C
    ld   [hl], $10                                ; $6DD1: $36 $10
    ret                                           ; $6DD3: $C9

jr_006_6DD4:
    ld   e, $10                                   ; $6DD4: $1E $10
    ld   hl, wEntitiesSpeedZTable                 ; $6DD6: $21 $20 $C3
    add  hl, bc                                   ; $6DD9: $09
    ld   [hl], $19                                ; $6DDA: $36 $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $6DDC: $F0 $E9
    cp   $05                                      ; $6DDE: $FE $05
    jr   nc, jr_006_6DE6                          ; $6DE0: $30 $04

    ld   e, $14                                   ; $6DE2: $1E $14
    ld   [hl], $16                                ; $6DE4: $36 $16

jr_006_6DE6:
    ld   hl, $C380                                ; $6DE6: $21 $80 $C3
    add  hl, bc                                   ; $6DE9: $09
    ld   a, [hl]                                  ; $6DEA: $7E
    and  a                                        ; $6DEB: $A7
    ld   a, e                                     ; $6DEC: $7B
    jr   nz, jr_006_6DF1                          ; $6DED: $20 $02

    cpl                                           ; $6DEF: $2F
    inc  a                                        ; $6DF0: $3C

jr_006_6DF1:
    ld   hl, wEntitiesSpeedXTable                       ; $6DF1: $21 $40 $C2
    add  hl, bc                                   ; $6DF4: $09
    ld   [hl], a                                  ; $6DF5: $77
    ldh  a, [wActiveEntityPosY]                   ; $6DF6: $F0 $EC
    cp   $50                                      ; $6DF8: $FE $50
    ld   a, e                                     ; $6DFA: $7B
    jr   c, jr_006_6DFF                           ; $6DFB: $38 $02

    cpl                                           ; $6DFD: $2F
    inc  a                                        ; $6DFE: $3C

jr_006_6DFF:
    ld   hl, wEntitiesSpeedYTable                       ; $6DFF: $21 $50 $C2
    add  hl, bc                                   ; $6E02: $09
    ld   [hl], a                                  ; $6E03: $77

jr_006_6E04:
    call func_006_6541                            ; $6E04: $CD $41 $65
    call label_3B23                               ; $6E07: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6E0A: $21 $A0 $C2
    add  hl, bc                                   ; $6E0D: $09
    ld   a, [hl]                                  ; $6E0E: $7E
    and  $03                                      ; $6E0F: $E6 $03
    ret  z                                        ; $6E11: $C8

    call IncrementEntityWalkingAttr               ; $6E12: $CD $12 $3B
    ld   [hl], b                                  ; $6E15: $70
    call GetEntityTransitionCountdown             ; $6E16: $CD $05 $0C
    ld   [hl], $08                                ; $6E19: $36 $08
    jp   label_3D7F                               ; $6E1B: $C3 $7F $3D

    nop                                           ; $6E1E: $00
    ld   hl, sp+$60                               ; $6E1F: $F8 $60
    ld   b, $00                                   ; $6E21: $06 $00
    nop                                           ; $6E23: $00
    ld   h, d                                     ; $6E24: $62
    ld   b, $00                                   ; $6E25: $06 $00
    ld   [$0664], sp                              ; $6E27: $08 $64 $06
    ldh  a, [rP1]                                 ; $6E2A: $F0 $00
    ld   l, [hl]                                  ; $6E2C: $6E
    ld   h, $00                                   ; $6E2D: $26 $00
    ld   hl, sp+$66                               ; $6E2F: $F8 $66
    ld   b, $00                                   ; $6E31: $06 $00
    nop                                           ; $6E33: $00
    ld   l, b                                     ; $6E34: $68
    ld   b, $00                                   ; $6E35: $06 $00
    ld   [$066A], sp                              ; $6E37: $08 $6A $06
    ldh  a, [rP1]                                 ; $6E3A: $F0 $00
    ld   l, [hl]                                  ; $6E3C: $6E
    ld   b, $00                                   ; $6E3D: $06 $00
    ld   hl, sp+$66                               ; $6E3F: $F8 $66
    ld   b, $00                                   ; $6E41: $06 $00
    nop                                           ; $6E43: $00
    ld   l, b                                     ; $6E44: $68
    ld   b, $00                                   ; $6E45: $06 $00
    ld   [$066A], sp                              ; $6E47: $08 $6A $06
    ldh  a, [rTMA]                                ; $6E4A: $F0 $06
    ld   l, [hl]                                  ; $6E4C: $6E
    ld   h, $00                                   ; $6E4D: $26 $00
    nop                                           ; $6E4F: $00
    ld   h, h                                     ; $6E50: $64
    ld   h, $00                                   ; $6E51: $26 $00
    ld   [$2662], sp                              ; $6E53: $08 $62 $26
    nop                                           ; $6E56: $00
    db   $10                                      ; $6E57: $10
    ld   h, b                                     ; $6E58: $60
    ld   h, $F0                                   ; $6E59: $26 $F0
    ld   [$066E], sp                              ; $6E5B: $08 $6E $06
    nop                                           ; $6E5E: $00
    nop                                           ; $6E5F: $00
    ld   l, d                                     ; $6E60: $6A
    ld   h, $00                                   ; $6E61: $26 $00
    ld   [$2668], sp                              ; $6E63: $08 $68 $26
    nop                                           ; $6E66: $00
    db   $10                                      ; $6E67: $10
    ld   h, [hl]                                  ; $6E68: $66
    ld   h, $F0                                   ; $6E69: $26 $F0
    ld   [$266E], sp                              ; $6E6B: $08 $6E $26
    nop                                           ; $6E6E: $00
    nop                                           ; $6E6F: $00
    ld   l, d                                     ; $6E70: $6A
    ld   h, $00                                   ; $6E71: $26 $00
    ld   [$2668], sp                              ; $6E73: $08 $68 $26
    nop                                           ; $6E76: $00
    db   $10                                      ; $6E77: $10
    ld   h, [hl]                                  ; $6E78: $66
    ld   h, $F0                                   ; $6E79: $26 $F0
    ld   [bc], a                                  ; $6E7B: $02
    ld   l, [hl]                                  ; $6E7C: $6E
    ld   b, $21                                   ; $6E7D: $06 $21
    add  b                                        ; $6E7F: $80
    jp   $F009                                    ; $6E80: $C3 $09 $F0

    pop  af                                       ; $6E83: $F1
    add  [hl]                                     ; $6E84: $86
    rla                                           ; $6E85: $17
    rla                                           ; $6E86: $17
    rla                                           ; $6E87: $17
    rla                                           ; $6E88: $17
    and  $F0                                      ; $6E89: $E6 $F0
    ld   e, a                                     ; $6E8B: $5F
    ld   d, b                                     ; $6E8C: $50
    ld   hl, $6E1E                                ; $6E8D: $21 $1E $6E
    add  hl, de                                   ; $6E90: $19
    ld   c, $04                                   ; $6E91: $0E $04
    call label_3CE6                               ; $6E93: $CD $E6 $3C
    ld   a, $04                                   ; $6E96: $3E $04
    call label_3DA0                               ; $6E98: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ; $6E9B: $21 $10 $C3
    add  hl, bc                                   ; $6E9E: $09
    ld   a, [hl]                                  ; $6E9F: $7E
    and  a                                        ; $6EA0: $A7
    ret  z                                        ; $6EA1: $C8

    ldh  a, [hFrameCounter]                       ; $6EA2: $F0 $E7
    and  $01                                      ; $6EA4: $E6 $01
    ret  nz                                       ; $6EA6: $C0

    ld   a, [$C3C0]                               ; $6EA7: $FA $C0 $C3
    ld   e, a                                     ; $6EAA: $5F
    ld   d, b                                     ; $6EAB: $50
    ld   hl, wDynamicOAMBuffer                    ; $6EAC: $21 $30 $C0
    add  hl, de                                   ; $6EAF: $19
    ldh  a, [$FFEF]                               ; $6EB0: $F0 $EF
    add  $0C                                      ; $6EB2: $C6 $0C
    ld   [hl+], a                                 ; $6EB4: $22
    ldh  a, [wActiveEntityPosX]                   ; $6EB5: $F0 $EE
    add  $02                                      ; $6EB7: $C6 $02
    ld   [hl+], a                                 ; $6EB9: $22
    ld   a, $26                                   ; $6EBA: $3E $26
    ld   [hl+], a                                 ; $6EBC: $22
    ld   a, $00                                   ; $6EBD: $3E $00
    ld   [hl+], a                                 ; $6EBF: $22
    ldh  a, [$FFEF]                               ; $6EC0: $F0 $EF
    add  $0C                                      ; $6EC2: $C6 $0C
    ld   [hl+], a                                 ; $6EC4: $22
    ldh  a, [wActiveEntityPosX]                   ; $6EC5: $F0 $EE
    add  $04                                      ; $6EC7: $C6 $04
    ld   [hl+], a                                 ; $6EC9: $22
    ld   a, $26                                   ; $6ECA: $3E $26
    ld   [hl+], a                                 ; $6ECC: $22
    ld   a, $00                                   ; $6ECD: $3E $00
    ld   [hl+], a                                 ; $6ECF: $22
    ld   a, $02                                   ; $6ED0: $3E $02
    jp   label_3DA0                               ; $6ED2: $C3 $A0 $3D

    ld   l, h                                     ; $6ED5: $6C
    rlca                                          ; $6ED6: $07
    ld   l, h                                     ; $6ED7: $6C
    daa                                           ; $6ED8: $27
    ld   l, h                                     ; $6ED9: $6C
    ld   b, a                                     ; $6EDA: $47
    ld   l, h                                     ; $6EDB: $6C
    ld   h, a                                     ; $6EDC: $67
    ld   [hl], b                                  ; $6EDD: $70
    ld   h, b                                     ; $6EDE: $60
    ld   d, b                                     ; $6EDF: $50
    ld   b, b                                     ; $6EE0: $40
    jr   nc, jr_006_6F03                          ; $6EE1: $30 $20

    ldh  a, [hMapId]                              ; $6EE3: $F0 $F7
    cp   $07                                      ; $6EE5: $FE $07
    jr   nz, jr_006_6EED                          ; $6EE7: $20 $04

    ld   a, $10                                   ; $6EE9: $3E $10
    ldh  [hFFF5], a                               ; $6EEB: $E0 $F5

jr_006_6EED:
    ldh  a, [hRoomStatus]                         ; $6EED: $F0 $F8
    and  $20                                      ; $6EEF: $E6 $20
    jp   nz, label_006_65DB                       ; $6EF1: $C2 $DB $65

    ld   a, c                                     ; $6EF4: $79
    ld   [$D201], a                               ; $6EF5: $EA $01 $D2
    call $6FEA                                    ; $6EF8: $CD $EA $6F
    call func_006_64C6                            ; $6EFB: $CD $C6 $64
    ld   a, [$D202]                               ; $6EFE: $FA $02 $D2
    ld   e, a                                     ; $6F01: $5F
    ld   d, b                                     ; $6F02: $50

jr_006_6F03:
    ld   hl, wEntitiesStatusTable                        ; $6F03: $21 $80 $C2
    add  hl, de                                   ; $6F06: $19
    ld   a, [hl]                                  ; $6F07: $7E
    cp   $01                                      ; $6F08: $FE $01
    ret  z                                        ; $6F0A: $C8

    and  a                                        ; $6F0B: $A7
    jr   nz, jr_006_6F48                          ; $6F0C: $20 $3A

    call GetEntityTransitionCountdown             ; $6F0E: $CD $05 $0C
    jr   nz, jr_006_6F47                          ; $6F11: $20 $34

    ld   [hl], $03                                ; $6F13: $36 $03
    ld   hl, wEntitiesUnknownTableB               ; $6F15: $21 $B0 $C2
    add  hl, bc                                   ; $6F18: $09
    ldh  a, [wActiveEntityPosX]                   ; $6F19: $F0 $EE
    ldh  [hScratch0], a                           ; $6F1B: $E0 $D7
    ld   e, [hl]                                  ; $6F1D: $5E
    inc  [hl]                                     ; $6F1E: $34
    ld   a, [hl]                                  ; $6F1F: $7E
    cp   $06                                      ; $6F20: $FE $06
    jr   nz, jr_006_6F3C                          ; $6F22: $20 $18

    call func_006_65DB                            ; $6F24: $CD $DB $65
    ld   hl, $C460                                ; $6F27: $21 $60 $C4
    add  hl, bc                                   ; $6F2A: $09
    ld   e, [hl]                                  ; $6F2B: $5E
    ld   d, b                                     ; $6F2C: $50
    ld   hl, data_3F48                            ; $6F2D: $21 $48 $3F
    add  hl, de                                   ; $6F30: $19
    ldh  a, [hMapRoom]                            ; $6F31: $F0 $F6
    ld   e, a                                     ; $6F33: $5F
    ld   d, b                                     ; $6F34: $50
    ld   a, [hl]                                  ; $6F35: $7E
    ld   hl, $CF00                                ; $6F36: $21 $00 $CF
    add  hl, de                                   ; $6F39: $19
    or   [hl]                                     ; $6F3A: $B6
    ld   [hl], a                                  ; $6F3B: $77

jr_006_6F3C:
    ld   d, b                                     ; $6F3C: $50
    ld   hl, $6EDD                                ; $6F3D: $21 $DD $6E
    add  hl, de                                   ; $6F40: $19
    ld   a, [hl]                                  ; $6F41: $7E
    ldh  [hScratch1], a                           ; $6F42: $E0 $D8
    jp   label_006_7035                           ; $6F44: $C3 $35 $70

jr_006_6F47:
    ret                                           ; $6F47: $C9

jr_006_6F48:
    call label_C56                                ; $6F48: $CD $56 $0C
    ldh  a, [$FFA2]                               ; $6F4B: $F0 $A2
    and  a                                        ; $6F4D: $A7
    jr   nz, jr_006_6F53                          ; $6F4E: $20 $03

    call label_3B39                               ; $6F50: $CD $39 $3B

jr_006_6F53:
    call func_006_654E                            ; $6F53: $CD $4E $65
    call label_3B23                               ; $6F56: $CD $23 $3B
    ld   hl, wEntitiesSpeedXTable                       ; $6F59: $21 $40 $C2
    add  hl, bc                                   ; $6F5C: $09
    ld   a, [hl]                                  ; $6F5D: $7E
    and  a                                        ; $6F5E: $A7
    jr   z, jr_006_6F86                           ; $6F5F: $28 $25

    bit  7, a                                     ; $6F61: $CB $7F
    jr   z, jr_006_6F67                           ; $6F63: $28 $02

    cpl                                           ; $6F65: $2F
    inc  a                                        ; $6F66: $3C

jr_006_6F67:
    ld   e, $04                                   ; $6F67: $1E $04
    cp   $08                                      ; $6F69: $FE $08
    jr   nc, jr_006_6F6F                          ; $6F6B: $30 $02

    ld   e, $08                                   ; $6F6D: $1E $08

jr_006_6F6F:
    cp   $04                                      ; $6F6F: $FE $04
    jr   nc, jr_006_6F75                          ; $6F71: $30 $02

    ld   e, $10                                   ; $6F73: $1E $10

jr_006_6F75:
    cp   $02                                      ; $6F75: $FE $02
    jr   nc, jr_006_6F7B                          ; $6F77: $30 $02

    ld   e, $20                                   ; $6F79: $1E $20

jr_006_6F7B:
    ld   d, b                                     ; $6F7B: $50
    ldh  a, [hFrameCounter]                       ; $6F7C: $F0 $E7
    and  e                                        ; $6F7E: $A3
    jr   z, jr_006_6F82                           ; $6F7F: $28 $01

    inc  d                                        ; $6F81: $14

jr_006_6F82:
    ld   a, d                                     ; $6F82: $7A
    call SetEntitySpriteVariant                   ; $6F83: $CD $0C $3B

jr_006_6F86:
    ldh  a, [hActiveEntityState]                  ; $6F86: $F0 $F0
    rst  $00                                      ; $6F88: $C7
    adc  a                                        ; $6F89: $8F
    ld   l, a                                     ; $6F8A: $6F
    sub  b                                        ; $6F8B: $90
    ld   l, a                                     ; $6F8C: $6F
    call nz, $C96F                                ; $6F8D: $C4 $6F $C9
    ld   hl, wEntitiesCollisionsTable             ; $6F90: $21 $A0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    and  $03                                      ; $6F95: $E6 $03
    jr   z, jr_006_6FB3                           ; $6F97: $28 $1A

    ld   hl, wEntitiesSpeedXTable                       ; $6F99: $21 $40 $C2
    add  hl, bc                                   ; $6F9C: $09
    ld   a, [hl]                                  ; $6F9D: $7E
    sra  a                                        ; $6F9E: $CB $2F
    cpl                                           ; $6FA0: $2F
    inc  a                                        ; $6FA1: $3C
    ld   [hl], a                                  ; $6FA2: $77
    ld   a, $20                                   ; $6FA3: $3E $20
    ld   [$C157], a                               ; $6FA5: $EA $57 $C1
    xor  a                                        ; $6FA8: $AF
    ld   [$C158], a                               ; $6FA9: $EA $58 $C1
    ld   a, $0B                                   ; $6FAC: $3E $0B
    ldh  [hJingle], a                             ; $6FAE: $E0 $F2
    call IncrementEntityWalkingAttr               ; $6FB0: $CD $12 $3B

jr_006_6FB3:
    ld   a, [$D210]                               ; $6FB3: $FA $10 $D2
    inc  a                                        ; $6FB6: $3C
    cp   $09                                      ; $6FB7: $FE $09
    jr   c, jr_006_6FC0                           ; $6FB9: $38 $05

    ld   a, $1A                                   ; $6FBB: $3E $1A
    ldh  [hWaveSfx], a                            ; $6FBD: $E0 $F3
    xor  a                                        ; $6FBF: $AF

jr_006_6FC0:
    ld   [$D210], a                               ; $6FC0: $EA $10 $D2
    ret                                           ; $6FC3: $C9

    ldh  a, [hFrameCounter]                       ; $6FC4: $F0 $E7
    and  $07                                      ; $6FC6: $E6 $07
    jr   nz, jr_006_6FD9                          ; $6FC8: $20 $0F

    ld   hl, wEntitiesSpeedXTable                       ; $6FCA: $21 $40 $C2

jr_006_6FCD:
    add  hl, bc                                   ; $6FCD: $09
    ld   a, [hl]                                  ; $6FCE: $7E
    and  a                                        ; $6FCF: $A7
    jr   z, jr_006_6FDA                           ; $6FD0: $28 $08

    and  $80                                      ; $6FD2: $E6 $80
    jr   z, jr_006_6FD8                           ; $6FD4: $28 $02

    inc  [hl]                                     ; $6FD6: $34
    inc  [hl]                                     ; $6FD7: $34

jr_006_6FD8:
    dec  [hl]                                     ; $6FD8: $35

jr_006_6FD9:
    ret                                           ; $6FD9: $C9

jr_006_6FDA:
    call IncrementEntityWalkingAttr               ; $6FDA: $CD $12 $3B
    ld   [hl], b                                  ; $6FDD: $70
    call GetEntityTransitionCountdown             ; $6FDE: $CD $05 $0C
    ld   [hl], $50                                ; $6FE1: $36 $50
    ret                                           ; $6FE3: $C9

    add  b                                        ; $6FE4: $80
    ld   [hl], b                                  ; $6FE5: $70
    ld   h, b                                     ; $6FE6: $60
    ld   d, b                                     ; $6FE7: $50
    ld   b, b                                     ; $6FE8: $40
    jr   nc, @+$40                                ; $6FE9: $30 $3E

    jr   nz, jr_006_6FCD                          ; $6FEB: $20 $E0

    db   $EC                                      ; $6FED: $EC

jr_006_6FEE:
    ld   de, $6ED5                                ; $6FEE: $11 $D5 $6E
    call RenderAnimatedActiveEntity                               ; $6FF1: $CD $C0 $3B
    ldh  a, [wActiveEntityPosY]                   ; $6FF4: $F0 $EC
    add  $10                                      ; $6FF6: $C6 $10
    ldh  [wActiveEntityPosY], a                   ; $6FF8: $E0 $EC
    ld   hl, wEntitiesUnknownTableB               ; $6FFA: $21 $B0 $C2
    add  hl, bc                                   ; $6FFD: $09
    ld   e, [hl]                                  ; $6FFE: $5E
    ld   d, b                                     ; $6FFF: $50
    ld   hl, $6FE4                                ; $7000: $21 $E4 $6F
    add  hl, de                                   ; $7003: $19
    cp   [hl]                                     ; $7004: $BE
    jr   nz, jr_006_6FEE                          ; $7005: $20 $E7

    jp   label_3D8A                               ; $7007: $C3 $8A $3D

func_006_700A:
label_006_700A:
    and  $07                                      ; $700A: $E6 $07
    ret  nz                                       ; $700C: $C0

    call GetRandomByte                            ; $700D: $CD $0D $28
    and  $1F                                      ; $7010: $E6 $1F
    sub  $10                                      ; $7012: $D6 $10
    ld   e, a                                     ; $7014: $5F
    ld   hl, wActiveEntityPosX                    ; $7015: $21 $EE $FF
    add  [hl]                                     ; $7018: $86
    ld   [hl], a                                  ; $7019: $77
    call GetRandomByte                            ; $701A: $CD $0D $28
    and  $1F                                      ; $701D: $E6 $1F
    sub  $14                                      ; $701F: $D6 $14
    ld   e, a                                     ; $7021: $5F
    ld   hl, wActiveEntityPosY                    ; $7022: $21 $EC $FF
    add  [hl]                                     ; $7025: $86
    ld   [hl], a                                  ; $7026: $77
    jp   label_006_702A                           ; $7027: $C3 $2A $70

label_006_702A:
    call func_006_64CC                            ; $702A: $CD $CC $64
    ldh  a, [wActiveEntityPosX]                   ; $702D: $F0 $EE
    ldh  [hScratch0], a                           ; $702F: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7031: $F0 $EC
    ldh  [hScratch1], a                           ; $7033: $E0 $D8

label_006_7035:
    ld   a, $02                                   ; $7035: $3E $02
    call label_CC7                                ; $7037: $CD $C7 $0C
    ld   a, $13                                   ; $703A: $3E $13
    ldh  [hNoiseSfx], a                           ; $703C: $E0 $F4
    ret                                           ; $703E: $C9

    ld   a, $36                                   ; $703F: $3E $36
    call func_003_64CA_trampoline                               ; $7041: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7044: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7046: $21 $00 $C2
    add  hl, de                                   ; $7049: $19
    ld   [hl], a                                  ; $704A: $77
    ldh  a, [hScratch1]                           ; $704B: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $704D: $21 $10 $C2
    add  hl, de                                   ; $7050: $19
    ld   [hl], a                                  ; $7051: $77
    ldh  a, [hIsSideScrolling]                    ; $7052: $F0 $F9
    and  a                                        ; $7054: $A7
    jr   z, jr_006_705F                           ; $7055: $28 $08

    ld   hl, wEntitiesSpeedYTable                       ; $7057: $21 $50 $C2
    add  hl, bc                                   ; $705A: $09
    ld   [hl], $F0                                ; $705B: $36 $F0
    jr   jr_006_706B                              ; $705D: $18 $0C

jr_006_705F:
    ld   hl, wEntitiesSpeedZTable                 ; $705F: $21 $20 $C3
    add  hl, de                                   ; $7062: $19
    ld   [hl], $10                                ; $7063: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7065: $21 $10 $C3
    add  hl, de                                   ; $7068: $19
    ld   [hl], $08                                ; $7069: $36 $08

jr_006_706B:
    call func_006_65DB                            ; $706B: $CD $DB $65
    jp   PlayBombExplosionSfx                     ; $706E: $C3 $4B $0C

    ldh  a, [hFFFC]                               ; $7071: $F0 $FC
    ld   d, b                                     ; $7073: $50
    ld   bc, $04F0                                ; $7074: $01 $F0 $04
    ld   d, d                                     ; $7077: $52
    ld   bc, $0CF0                                ; $7078: $01 $F0 $0C
    ld   d, h                                     ; $707B: $54
    ld   bc, $FC00                                ; $707C: $01 $00 $FC
    ld   d, [hl]                                  ; $707F: $56
    ld   bc, $0400                                ; $7080: $01 $00 $04
    ld   e, b                                     ; $7083: $58
    ld   bc, IsEntityUnknownFZero                 ; $7084: $01 $00 $0C
    ld   e, d                                     ; $7087: $5A
    ld   bc, $FCF0                                ; $7088: $01 $F0 $FC
    ld   d, b                                     ; $708B: $50
    ld   bc, $04F0                                ; $708C: $01 $F0 $04
    ld   d, d                                     ; $708F: $52
    ld   bc, $0CF0                                ; $7090: $01 $F0 $0C
    ld   d, h                                     ; $7093: $54
    ld   bc, $FC00                                ; $7094: $01 $00 $FC
    ld   e, h                                     ; $7097: $5C
    ld   bc, $0400                                ; $7098: $01 $00 $04
    ld   e, b                                     ; $709B: $58
    ld   bc, IsEntityUnknownFZero                 ; $709C: $01 $00 $0C
    ld   e, [hl]                                  ; $709F: $5E
    ld   bc, $14A8                                ; $70A0: $01 $A8 $14
    ld   bc, $18FF                                ; $70A3: $01 $FF $18
    add  sp, -$06                                 ; $70A6: $E8 $FA
    and  l                                        ; $70A8: $A5
    db   $DB                                      ; $70A9: $DB
    and  a                                        ; $70AA: $A7
    jr   z, jr_006_70B8                           ; $70AB: $28 $0B

    ldh  a, [hMapId]                              ; $70AD: $F0 $F7
    cp   $FF                                      ; $70AF: $FE $FF
    jr   nz, jr_006_70B8                          ; $70B1: $20 $05

    ld   a, $06                                   ; $70B3: $3E $06
    jp   Func_036_505F_trampoline                                ; $70B5: $C3 $47 $0A

jr_006_70B8:
    ld   hl, wEntitiesUnknownTableD               ; $70B8: $21 $D0 $C2
    add  hl, bc                                   ; $70BB: $09
    ld   a, [hl]                                  ; $70BC: $7E
    and  a                                        ; $70BD: $A7
    jp   z, label_006_7123                        ; $70BE: $CA $23 $71

    ld   hl, wEntitiesStatusTable                        ; $70C1: $21 $80 $C2
    ld   a, [$D201]                               ; $70C4: $FA $01 $D2
    ld   e, a                                     ; $70C7: $5F
    ld   d, b                                     ; $70C8: $50
    add  hl, de                                   ; $70C9: $19
    ld   a, [hl]                                  ; $70CA: $7E
    and  a                                        ; $70CB: $A7
    jp   z, label_006_65DB                        ; $70CC: $CA $DB $65

    ld   a, [$D202]                               ; $70CF: $FA $02 $D2
    ldh  [hActiveEntitySpriteVariant], a               ; $70D2: $E0 $F1
    ld   de, $70A1                                ; $70D4: $11 $A1 $70
    call RenderSimpleEntityWithSpriteVariantToOAM ; $70D7: $CD $77 $3C
    ldh  a, [hFrameCounter]                       ; $70DA: $F0 $E7
    and  $01                                      ; $70DC: $E6 $01
    jr   nz, jr_006_7120                          ; $70DE: $20 $40

    ld   hl, wEntitiesUnknownTableB               ; $70E0: $21 $B0 $C2
    add  hl, bc                                   ; $70E3: $09
    ld   e, [hl]                                  ; $70E4: $5E
    ld   d, b                                     ; $70E5: $50
    ld   hl, $70A3                                ; $70E6: $21 $A3 $70
    add  hl, de                                   ; $70E9: $19
    ld   a, [hl]                                  ; $70EA: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $70EB: $21 $40 $C2
    add  hl, bc                                   ; $70EE: $09
    add  [hl]                                     ; $70EF: $86
    ld   [hl], a                                  ; $70F0: $77
    ld   hl, $70A5                                ; $70F1: $21 $A5 $70
    add  hl, de                                   ; $70F4: $19
    cp   [hl]                                     ; $70F5: $BE
    jr   nz, jr_006_7100                          ; $70F6: $20 $08

    ld   hl, wEntitiesUnknownTableB               ; $70F8: $21 $B0 $C2
    add  hl, bc                                   ; $70FB: $09
    ld   a, [hl]                                  ; $70FC: $7E
    xor  $01                                      ; $70FD: $EE $01
    ld   [hl], a                                  ; $70FF: $77

jr_006_7100:
    ld   hl, wEntitiesUnknownTableC               ; $7100: $21 $C0 $C2
    add  hl, bc                                   ; $7103: $09
    ld   e, [hl]                                  ; $7104: $5E
    ld   d, b                                     ; $7105: $50
    ld   hl, $70A3                                ; $7106: $21 $A3 $70
    add  hl, de                                   ; $7109: $19
    ld   a, [hl]                                  ; $710A: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $710B: $21 $50 $C2
    add  hl, bc                                   ; $710E: $09
    add  [hl]                                     ; $710F: $86
    ld   [hl], a                                  ; $7110: $77
    ld   hl, $70A5                                ; $7111: $21 $A5 $70
    add  hl, de                                   ; $7114: $19
    cp   [hl]                                     ; $7115: $BE
    jr   nz, jr_006_7120                          ; $7116: $20 $08

    ld   hl, wEntitiesUnknownTableC               ; $7118: $21 $C0 $C2
    add  hl, bc                                   ; $711B: $09
    ld   a, [hl]                                  ; $711C: $7E
    xor  $01                                      ; $711D: $EE $01
    ld   [hl], a                                  ; $711F: $77

jr_006_7120:
    jp   label_006_6541                           ; $7120: $C3 $41 $65

label_006_7123:
    ld   hl, $7071                                ; $7123: $21 $71 $70
    ldh  a, [hFrameCounter]                       ; $7126: $F0 $E7
    and  $08                                      ; $7128: $E6 $08
    jr   z, jr_006_712F                           ; $712A: $28 $03

    ld   hl, $7089                                ; $712C: $21 $89 $70

jr_006_712F:
    ld   c, $06                                   ; $712F: $0E $06
    call label_3CE6                               ; $7131: $CD $E6 $3C
    ld   a, $06                                   ; $7134: $3E $06
    call label_3DA0                               ; $7136: $CD $A0 $3D
    call label_3CD9                               ; $7139: $CD $D9 $3C
    ld   e, $FE                                   ; $713C: $1E $FE
    ld   hl, $C3D0                                ; $713E: $21 $D0 $C3
    add  hl, bc                                   ; $7141: $09
    inc  [hl]                                     ; $7142: $34
    ld   a, [hl]                                  ; $7143: $7E
    and  $40                                      ; $7144: $E6 $40
    jr   z, jr_006_714A                           ; $7146: $28 $02

    ld   e, $02                                   ; $7148: $1E $02

jr_006_714A:
    ld   hl, wEntitiesSpeedZTable                 ; $714A: $21 $20 $C3
    add  hl, bc                                   ; $714D: $09
    ld   [hl], e                                  ; $714E: $73
    call func_006_657A                            ; $714F: $CD $7A $65
    call func_006_64C6                            ; $7152: $CD $C6 $64
    ldh  a, [hActiveEntityState]                  ; $7155: $F0 $F0
    rst  $00                                      ; $7157: $C7
    ld   e, [hl]                                  ; $7158: $5E
    ld   [hl], c                                  ; $7159: $71
    add  l                                        ; $715A: $85
    ld   [hl], c                                  ; $715B: $71
    pop  af                                       ; $715C: $F1
    ld   [hl], c                                  ; $715D: $71
    xor  a                                        ; $715E: $AF
    ld   [$D202], a                               ; $715F: $EA $02 $D2
    ld   a, c                                     ; $7162: $79
    ld   [$D201], a                               ; $7163: $EA $01 $D2
    ldh  a, [hLinkPositionX]                      ; $7166: $F0 $98
    sub  $50                                      ; $7168: $D6 $50
    add  $08                                      ; $716A: $C6 $08
    cp   $10                                      ; $716C: $FE $10
    ret  nc                                       ; $716E: $D0

    ldh  a, [hLinkPositionY]                      ; $716F: $F0 $99
    sub  $58                                      ; $7171: $D6 $58
    add  $08                                      ; $7173: $C6 $08
    cp   $10                                      ; $7175: $FE $10
    ret  nc                                       ; $7177: $D0

    call IncrementEntityWalkingAttr               ; $7178: $CD $12 $3B
    call label_BFB                                ; $717B: $CD $FB $0B
    ld   [hl], $48                                ; $717E: $36 $48
    ld   a, $24                                   ; $7180: $3E $24
    jp   OpenDialog                               ; $7182: $C3 $85 $23

    call label_BFB                                ; $7185: $CD $FB $0B
    jr   nz, jr_006_7197                          ; $7188: $20 $0D

    call GetEntityTransitionCountdown             ; $718A: $CD $05 $0C
    ld   [hl], $48                                ; $718D: $36 $48
    call IncrementEntityWalkingAttr               ; $718F: $CD $12 $3B
    ld   a, $26                                   ; $7192: $3E $26
    ldh  [hJingle], a                             ; $7194: $E0 $F2
    ret                                           ; $7196: $C9

jr_006_7197:
    ld   a, $02                                   ; $7197: $3E $02
    ldh  [$FFA1], a                               ; $7199: $E0 $A1
    ld   a, $1A                                   ; $719B: $3E $1A
    ldh  [hJingle], a                             ; $719D: $E0 $F2
    call func_006_64C6                            ; $719F: $CD $C6 $64
    ld   hl, wEntitiesUnknowTableG                ; $71A2: $21 $00 $C3
    add  hl, bc                                   ; $71A5: $09
    ld   a, [hl]                                  ; $71A6: $7E
    and  a                                        ; $71A7: $A7
    jr   nz, jr_006_71BA                          ; $71A8: $20 $10

    ld   [hl], $01                                ; $71AA: $36 $01
    ld   hl, wEntitiesUnknownTableB               ; $71AC: $21 $B0 $C2
    add  hl, bc                                   ; $71AF: $09
    ld   a, [hl]                                  ; $71B0: $7E
    cp   $04                                      ; $71B1: $FE $04
    jr   c, jr_006_71BA                           ; $71B3: $38 $05

    ld   a, $04                                   ; $71B5: $3E $04
    ld   [wSubstractRupeeBufferLow], a            ; $71B7: $EA $93 $DB

jr_006_71BA:
    call IsEntityUnknownFZero                     ; $71BA: $CD $00 $0C
    jr   nz, jr_006_71F0                          ; $71BD: $20 $31

    ld   [hl], $13                                ; $71BF: $36 $13
    ld   hl, wEntitiesUnknownTableB               ; $71C1: $21 $B0 $C2
    add  hl, bc                                   ; $71C4: $09
    ld   a, [hl]                                  ; $71C5: $7E
    cp   $0A                                      ; $71C6: $FE $0A
    jr   z, jr_006_71F0                           ; $71C8: $28 $26

    inc  [hl]                                     ; $71CA: $34
    ld   a, $84                                   ; $71CB: $3E $84
    call func_003_64CA_trampoline                               ; $71CD: $CD $86 $3B
    jr   c, jr_006_71F0                           ; $71D0: $38 $1E

    ld   hl, wEntitiesUnknownTableD               ; $71D2: $21 $D0 $C2
    add  hl, de                                   ; $71D5: $19
    ld   [hl], $01                                ; $71D6: $36 $01
    ldh  a, [hScratch0]                           ; $71D8: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $71DA: $21 $00 $C2
    add  hl, de                                   ; $71DD: $19
    add  $00                                      ; $71DE: $C6 $00
    ld   [hl], a                                  ; $71E0: $77
    ldh  a, [hScratch1]                           ; $71E1: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $71E3: $21 $10 $C2
    add  hl, de                                   ; $71E6: $19
    sub  $0E                                      ; $71E7: $D6 $0E
    ld   [hl], a                                  ; $71E9: $77
    ld   hl, wEntitiesSpeedXTable                       ; $71EA: $21 $40 $C2
    add  hl, de                                   ; $71ED: $19
    ld   [hl], $E8                                ; $71EE: $36 $E8

jr_006_71F0:
    ret                                           ; $71F0: $C9

    call GetEntityTransitionCountdown             ; $71F1: $CD $05 $0C
    jp   z, label_006_65DB                        ; $71F4: $CA $DB $65

    ldh  a, [hFrameCounter]                       ; $71F7: $F0 $E7
    and  $02                                      ; $71F9: $E6 $02
    ld   a, $00                                   ; $71FB: $3E $00
    jr   z, jr_006_7201                           ; $71FD: $28 $02

    ld   a, $FF                                   ; $71FF: $3E $FF

jr_006_7201:
    ld   [$D202], a                               ; $7201: $EA $02 $D2
    call SetEntitySpriteVariant                   ; $7204: $CD $0C $3B
    ld   a, $02                                   ; $7207: $3E $02
    ldh  [$FFA1], a                               ; $7209: $E0 $A1
    ret                                           ; $720B: $C9

    ld   l, b                                     ; $720C: $68
    ld   bc, $016A                                ; $720D: $01 $6A $01
    ld   h, h                                     ; $7210: $64
    ld   bc, $0166                                ; $7211: $01 $66 $01
    ld   l, h                                     ; $7214: $6C
    ld   bc, Start.notGBC                         ; $7215: $01 $6E $01
    ld   l, d                                     ; $7218: $6A
    ld   hl, $2168                                ; $7219: $21 $68 $21
    ld   h, [hl]                                  ; $721C: $66
    ld   hl, $2164                                ; $721D: $21 $64 $21
    ld   l, [hl]                                  ; $7220: $6E
    ld   hl, $216C                                ; $7221: $21 $6C $21
    ld   l, b                                     ; $7224: $68
    nop                                           ; $7225: $00
    ld   l, d                                     ; $7226: $6A
    nop                                           ; $7227: $00
    ld   h, h                                     ; $7228: $64
    nop                                           ; $7229: $00
    ld   h, [hl]                                  ; $722A: $66
    nop                                           ; $722B: $00
    ld   l, h                                     ; $722C: $6C
    nop                                           ; $722D: $00
    ld   l, [hl]                                  ; $722E: $6E
    nop                                           ; $722F: $00
    ld   l, d                                     ; $7230: $6A
    jr   nz, @+$6A                                ; $7231: $20 $68

    jr   nz, @+$68                                ; $7233: $20 $66

    jr   nz, @+$66                                ; $7235: $20 $64

    jr   nz, jr_006_72A7                          ; $7237: $20 $6E

    jr   nz, jr_006_72A7                          ; $7239: $20 $6C

    jr   nz, @+$23                                ; $723B: $20 $21

    add  b                                        ; $723D: $80
    jp   $F009                                    ; $723E: $C3 $09 $F0

    pop  af                                       ; $7241: $F1
    add  [hl]                                     ; $7242: $86
    ldh  [hActiveEntitySpriteVariant], a               ; $7243: $E0 $F1
    ld   hl, wEntitiesSpeedXTable                       ; $7245: $21 $40 $C2
    add  hl, bc                                   ; $7248: $09
    ld   a, [hl]                                  ; $7249: $7E
    and  a                                        ; $724A: $A7
    jr   z, jr_006_725A                           ; $724B: $28 $0D

    and  $80                                      ; $724D: $E6 $80
    ld   a, $00                                   ; $724F: $3E $00
    jr   nz, jr_006_7255                          ; $7251: $20 $02

    ld   a, $03                                   ; $7253: $3E $03

jr_006_7255:
    ld   hl, $C380                                ; $7255: $21 $80 $C3
    add  hl, bc                                   ; $7258: $09
    ld   [hl], a                                  ; $7259: $77

jr_006_725A:
    ld   de, $720C                                ; $725A: $11 $0C $72
    ldh  a, [hMapRoom]                            ; $725D: $F0 $F6
    cp   $D9                                      ; $725F: $FE $D9
    jr   nz, jr_006_7266                          ; $7261: $20 $03

    ld   de, $7224                                ; $7263: $11 $24 $72

jr_006_7266:
    call RenderAnimatedActiveEntity                               ; $7266: $CD $C0 $3B
    call func_006_64C6                            ; $7269: $CD $C6 $64
    ld   a, [wIsIndoor]                           ; $726C: $FA $A5 $DB
    and  a                                        ; $726F: $A7
    jp   z, label_006_7372                        ; $7270: $CA $72 $73

    call func_006_657A                            ; $7273: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7276: $21 $20 $C3
    add  hl, bc                                   ; $7279: $09
    dec  [hl]                                     ; $727A: $35
    ld   hl, wEntitiesPosZTable                   ; $727B: $21 $10 $C3
    add  hl, bc                                   ; $727E: $09
    ld   a, [hl]                                  ; $727F: $7E
    and  $80                                      ; $7280: $E6 $80
    ldh  [hFFE8], a                               ; $7282: $E0 $E8
    jr   z, jr_006_728C                           ; $7284: $28 $06

    ld   [hl], b                                  ; $7286: $70
    ld   hl, wEntitiesPosZTable                   ; $7287: $21 $10 $C3
    add  hl, bc                                   ; $728A: $09
    ld   [hl], b                                  ; $728B: $70

jr_006_728C:
    ldh  a, [hActiveEntityState]                  ; $728C: $F0 $F0
    rst  $00                                      ; $728E: $C7
    sbc  l                                        ; $728F: $9D
    ld   [hl], d                                  ; $7290: $72
    db   $E3                                      ; $7291: $E3
    ld   [hl], d                                  ; $7292: $72
    ld   [de], a                                  ; $7293: $12
    ld   [hl], e                                  ; $7294: $73
    ld   [bc], a                                  ; $7295: $02
    ld   b, $08                                   ; $7296: $06 $08
    ld   b, $FE                                   ; $7298: $06 $FE
    ld   a, [$FAF8]                               ; $729A: $FA $F8 $FA
    call func_006_7335                            ; $729D: $CD $35 $73
    xor  a                                        ; $72A0: $AF
    call SetEntitySpriteVariant                   ; $72A1: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $72A4: $CD $05 $0C

jr_006_72A7:
    jr   nz, jr_006_72E0                          ; $72A7: $20 $37

    call GetRandomByte                            ; $72A9: $CD $0D $28
    and  $07                                      ; $72AC: $E6 $07
    ld   e, a                                     ; $72AE: $5F
    ld   d, b                                     ; $72AF: $50
    ld   hl, $7295                                ; $72B0: $21 $95 $72
    add  hl, de                                   ; $72B3: $19
    ld   a, [hl]                                  ; $72B4: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $72B5: $21 $40 $C2
    add  hl, bc                                   ; $72B8: $09
    ld   [hl], a                                  ; $72B9: $77
    ld   a, e                                     ; $72BA: $7B
    and  $04                                      ; $72BB: $E6 $04
    ld   hl, $C380                                ; $72BD: $21 $80 $C3
    add  hl, bc                                   ; $72C0: $09
    ld   [hl], a                                  ; $72C1: $77
    call GetRandomByte                            ; $72C2: $CD $0D $28
    and  $07                                      ; $72C5: $E6 $07
    ld   e, a                                     ; $72C7: $5F
    ld   hl, $7295                                ; $72C8: $21 $95 $72
    add  hl, de                                   ; $72CB: $19
    ld   a, [hl]                                  ; $72CC: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $72CD: $21 $50 $C2
    add  hl, bc                                   ; $72D0: $09
    ld   [hl], a                                  ; $72D1: $77
    call GetEntityTransitionCountdown             ; $72D2: $CD $05 $0C
    call GetRandomByte                            ; $72D5: $CD $0D $28
    and  $1F                                      ; $72D8: $E6 $1F
    add  $20                                      ; $72DA: $C6 $20
    ld   [hl], a                                  ; $72DC: $77
    call IncrementEntityWalkingAttr               ; $72DD: $CD $12 $3B

jr_006_72E0:
    jp   label_006_7308                           ; $72E0: $C3 $08 $73

    call func_006_7335                            ; $72E3: $CD $35 $73
    call func_006_6541                            ; $72E6: $CD $41 $65
    call label_3B23                               ; $72E9: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $72EC: $F0 $E8
    and  a                                        ; $72EE: $A7
    jr   z, jr_006_7308                           ; $72EF: $28 $17

    call GetEntityTransitionCountdown             ; $72F1: $CD $05 $0C
    jr   nz, jr_006_72FD                          ; $72F4: $20 $07

    ld   [hl], $30                                ; $72F6: $36 $30
    call IncrementEntityWalkingAttr               ; $72F8: $CD $12 $3B
    ld   [hl], b                                  ; $72FB: $70
    ret                                           ; $72FC: $C9

jr_006_72FD:
    ld   hl, wEntitiesSpeedZTable                 ; $72FD: $21 $20 $C3
    add  hl, bc                                   ; $7300: $09
    ld   [hl], $08                                ; $7301: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $7303: $21 $10 $C3
    add  hl, bc                                   ; $7306: $09
    inc  [hl]                                     ; $7307: $34

label_006_7308:
jr_006_7308:
    ldh  a, [hFrameCounter]                       ; $7308: $F0 $E7
    rra                                           ; $730A: $1F
    rra                                           ; $730B: $1F
    rra                                           ; $730C: $1F
    and  $01                                      ; $730D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $730F: $C3 $0C $3B

    call func_006_6541                            ; $7312: $CD $41 $65
    call label_3B23                               ; $7315: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7318: $F0 $E7
    and  $01                                      ; $731A: $E6 $01
    jr   nz, jr_006_7323                          ; $731C: $20 $05

    ld   hl, wEntitiesSpeedZTable                 ; $731E: $21 $20 $C3
    add  hl, bc                                   ; $7321: $09
    inc  [hl]                                     ; $7322: $34

jr_006_7323:
    ldh  a, [hFFE8]                               ; $7323: $F0 $E8
    and  a                                        ; $7325: $A7
    jr   z, jr_006_732C                           ; $7326: $28 $04

    call IncrementEntityWalkingAttr               ; $7328: $CD $12 $3B
    ld   [hl], b                                  ; $732B: $70

jr_006_732C:
    ldh  a, [hFrameCounter]                       ; $732C: $F0 $E7
    rra                                           ; $732E: $1F
    and  $02                                      ; $732F: $E6 $02
    call SetEntitySpriteVariant                   ; $7331: $CD $0C $3B
    ret                                           ; $7334: $C9

func_006_7335:
    ld   a, [wSwordAnimationState]                ; $7335: $FA $37 $C1
    cp   $02                                      ; $7338: $FE $02
    jr   nz, jr_006_7371                          ; $733A: $20 $35

    call func_006_6594                            ; $733C: $CD $94 $65
    add  $18                                      ; $733F: $C6 $18
    cp   $30                                      ; $7341: $FE $30
    jr   nc, jr_006_7371                          ; $7343: $30 $2C

    call func_006_65A4                            ; $7345: $CD $A4 $65
    add  $18                                      ; $7348: $C6 $18
    cp   $30                                      ; $734A: $FE $30
    jr   nc, jr_006_7371                          ; $734C: $30 $23

    call IncrementEntityWalkingAttr               ; $734E: $CD $12 $3B
    ld   [hl], $02                                ; $7351: $36 $02
    ld   a, $10                                   ; $7353: $3E $10
    call label_3BB5                               ; $7355: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $7358: $F0 $D7
    cpl                                           ; $735A: $2F
    inc  a                                        ; $735B: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $735C: $21 $50 $C2
    add  hl, bc                                   ; $735F: $09
    ld   [hl], a                                  ; $7360: $77
    ldh  a, [hScratch1]                           ; $7361: $F0 $D8
    cpl                                           ; $7363: $2F
    inc  a                                        ; $7364: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $7365: $21 $40 $C2
    add  hl, bc                                   ; $7368: $09
    ld   [hl], a                                  ; $7369: $77
    ld   hl, wEntitiesSpeedZTable                 ; $736A: $21 $20 $C3
    add  hl, bc                                   ; $736D: $09
    ld   [hl], $0C                                ; $736E: $36 $0C
    pop  af                                       ; $7370: $F1

jr_006_7371:
    ret                                           ; $7371: $C9

label_006_7372:
    ret                                           ; $7372: $C9

    ld   [hl], b                                  ; $7373: $70
    ld   bc, $2170                                ; $7374: $01 $70 $21
    ld   [hl], d                                  ; $7377: $72
    ld   bc, $2172                                ; $7378: $01 $72 $21
    ld   a, [wLinkPlayingOcarinaCountdown]        ; $737B: $FA $66 $C1
    cp   $01                                      ; $737E: $FE $01
    jr   nz, jr_006_73AD                          ; $7380: $20 $2B

    ld   a, [wOcarinaSongFlags]                  ; $7382: $FA $49 $DB
    and  $04                                      ; $7385: $E6 $04
    jr   z, jr_006_73AD                           ; $7387: $28 $24

    ld   a, [$DB4A]                               ; $7389: $FA $4A $DB
    and  a                                        ; $738C: $A7
    jr   nz, jr_006_73AD                          ; $738D: $20 $1E

    ldh  a, [hActiveEntityStatus]                 ; $738F: $F0 $EA
    cp   $01                                      ; $7391: $FE $01
    jr   z, jr_006_73AD                           ; $7393: $28 $18

    ld   hl, $C480                                ; $7395: $21 $80 $C4
    add  hl, bc                                   ; $7398: $09
    ld   [hl], $1F                                ; $7399: $36 $1F
    ld   hl, wEntitiesStatusTable                        ; $739B: $21 $80 $C2
    add  hl, bc                                   ; $739E: $09
    ld   [hl], $01                                ; $739F: $36 $01
    ld   hl, $C340                                ; $73A1: $21 $40 $C3
    add  hl, bc                                   ; $73A4: $09
    ld   [hl], $04                                ; $73A5: $36 $04
    ld   hl, hNoiseSfx                            ; $73A7: $21 $F4 $FF
    ld   [hl], $13                                ; $73AA: $36 $13
    ret                                           ; $73AC: $C9

jr_006_73AD:
    ld   de, $7373                                ; $73AD: $11 $73 $73
    call RenderAnimatedActiveEntity                               ; $73B0: $CD $C0 $3B
    call func_006_64C6                            ; $73B3: $CD $C6 $64
    call func_006_64F7                            ; $73B6: $CD $F7 $64
    call func_006_6541                            ; $73B9: $CD $41 $65
    ld   hl, $C410                                ; $73BC: $21 $10 $C4
    add  hl, bc                                   ; $73BF: $09
    ld   [hl], $01                                ; $73C0: $36 $01
    push hl                                       ; $73C2: $E5
    call label_3B23                               ; $73C3: $CD $23 $3B
    pop  hl                                       ; $73C6: $E1
    ld   [hl], b                                  ; $73C7: $70
    call label_3B39                               ; $73C8: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $73CB: $F0 $F0
    and  $01                                      ; $73CD: $E6 $01
    rst  $00                                      ; $73CF: $C7
    ldh  [$FF73], a                               ; $73D0: $E0 $73
    inc  hl                                       ; $73D2: $23
    ld   [hl], h                                  ; $73D3: $74
    ld   [$F808], sp                              ; $73D4: $08 $08 $F8
    ld   hl, sp+$04                               ; $73D7: $F8 $04
    db   $FC                                      ; $73D9: $FC
    db   $FC                                      ; $73DA: $FC
    inc  b                                        ; $73DB: $04
    db   $FC                                      ; $73DC: $FC
    inc  b                                        ; $73DD: $04
    ld   [$21F8], sp                              ; $73DE: $08 $F8 $21
    or   b                                        ; $73E1: $B0
    jp   $3609                                    ; $73E2: $C3 $09 $36

    ld   bc, $05CD                                ; $73E5: $01 $CD $05
    inc  c                                        ; $73E8: $0C
    ret  nz                                       ; $73E9: $C0

    call IncrementEntityWalkingAttr               ; $73EA: $CD $12 $3B
    call GetRandomByte                            ; $73ED: $CD $0D $28
    and  $07                                      ; $73F0: $E6 $07
    add  $10                                      ; $73F2: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $73F4: $21 $20 $C3
    add  hl, bc                                   ; $73F7: $09
    ld   [hl], a                                  ; $73F8: $77
    call GetRandomByte                            ; $73F9: $CD $0D $28
    and  $07                                      ; $73FC: $E6 $07
    cp   $06                                      ; $73FE: $FE $06
    jr   c, jr_006_7409                           ; $7400: $38 $07

    ld   a, $0A                                   ; $7402: $3E $0A
    call label_3BAA                               ; $7404: $CD $AA $3B
    jr   jr_006_741F                              ; $7407: $18 $16

jr_006_7409:
    ld   e, a                                     ; $7409: $5F
    ld   d, b                                     ; $740A: $50
    ld   hl, $73D4                                ; $740B: $21 $D4 $73
    add  hl, de                                   ; $740E: $19
    ld   a, [hl]                                  ; $740F: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7410: $21 $40 $C2
    add  hl, bc                                   ; $7413: $09
    ld   [hl], a                                  ; $7414: $77
    ld   hl, $73DA                                ; $7415: $21 $DA $73
    add  hl, de                                   ; $7418: $19
    ld   a, [hl]                                  ; $7419: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $741A: $21 $50 $C2
    add  hl, bc                                   ; $741D: $09
    ld   [hl], a                                  ; $741E: $77

jr_006_741F:
    xor  a                                        ; $741F: $AF
    jp   SetEntitySpriteVariant                   ; $7420: $C3 $0C $3B

    call func_006_657A                            ; $7423: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7426: $21 $20 $C3
    add  hl, bc                                   ; $7429: $09
    dec  [hl]                                     ; $742A: $35
    ld   hl, wEntitiesPosZTable                   ; $742B: $21 $10 $C3
    add  hl, bc                                   ; $742E: $09
    ld   a, [hl]                                  ; $742F: $7E
    and  $80                                      ; $7430: $E6 $80
    ret  z                                        ; $7432: $C8

    xor  a                                        ; $7433: $AF
    ld   [hl], a                                  ; $7434: $77
    call IncrementEntityWalkingAttr               ; $7435: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7438: $CD $05 $0C
    call GetRandomByte                            ; $743B: $CD $0D $28
    and  $0F                                      ; $743E: $E6 $0F
    add  $18                                      ; $7440: $C6 $18
    ld   [hl], a                                  ; $7442: $77
    jp   label_3D7F                               ; $7443: $C3 $7F $3D

    ld   h, b                                     ; $7446: $60
    rlca                                          ; $7447: $07
    ld   h, d                                     ; $7448: $62
    rlca                                          ; $7449: $07
    ld   h, h                                     ; $744A: $64
    rlca                                          ; $744B: $07
    ld   h, [hl]                                  ; $744C: $66
    rlca                                          ; $744D: $07
    ld   de, $7446                                ; $744E: $11 $46 $74
    call RenderAnimatedActiveEntity                               ; $7451: $CD $C0 $3B
    call func_006_64C6                            ; $7454: $CD $C6 $64
    call func_006_64F7                            ; $7457: $CD $F7 $64
    xor  a                                        ; $745A: $AF
    ldh  [hFFE8], a                               ; $745B: $E0 $E8
    call label_3B70                               ; $745D: $CD $70 $3B
    call label_3B5A                               ; $7460: $CD $5A $3B
    jr   nc, jr_006_7472                          ; $7463: $30 $0D

    ld   a, $01                                   ; $7465: $3E $01
    ldh  [hFFE8], a                               ; $7467: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $7469: $F0 $F0
    cp   $02                                      ; $746B: $FE $02
    jr   nc, jr_006_7472                          ; $746D: $30 $03

    call CopyLinkFinalPositionToPosition          ; $746F: $CD $BE $0C

jr_006_7472:
    call func_006_6541                            ; $7472: $CD $41 $65
    call label_3B23                               ; $7475: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $7478: $F0 $F0
    rst  $00                                      ; $747A: $C7
    add  c                                        ; $747B: $81
    ld   [hl], h                                  ; $747C: $74
    sub  l                                        ; $747D: $95
    ld   [hl], h                                  ; $747E: $74
    jp   z, $F074                                 ; $747F: $CA $74 $F0

    add  sp, -$59                                 ; $7482: $E8 $A7
    jr   z, jr_006_7494                           ; $7484: $28 $0E

    call IncrementEntityWalkingAttr               ; $7486: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7489: $CD $05 $0C
    ld   [hl], $30                                ; $748C: $36 $30
    ld   hl, $C420                                ; $748E: $21 $20 $C4
    add  hl, bc                                   ; $7491: $09
    ld   [hl], $18                                ; $7492: $36 $18

jr_006_7494:
    ret                                           ; $7494: $C9

    call GetEntityTransitionCountdown             ; $7495: $CD $05 $0C
    jr   nz, jr_006_74B2                          ; $7498: $20 $18

    call IncrementEntityWalkingAttr               ; $749A: $CD $12 $3B
    ld   hl, $C340                                ; $749D: $21 $40 $C3
    add  hl, bc                                   ; $74A0: $09
    res  7, [hl]                                  ; $74A1: $CB $BE
    ld   hl, $C350                                ; $74A3: $21 $50 $C3
    add  hl, bc                                   ; $74A6: $09
    res  7, [hl]                                  ; $74A7: $CB $BE
    ld   hl, $C430                                ; $74A9: $21 $30 $C4
    add  hl, bc                                   ; $74AC: $09
    res  6, [hl]                                  ; $74AD: $CB $B6
    jp   label_3D7F                               ; $74AF: $C3 $7F $3D

jr_006_74B2:
    ld   e, $08                                   ; $74B2: $1E $08
    and  $04                                      ; $74B4: $E6 $04
    jr   z, jr_006_74BA                           ; $74B6: $28 $02

    ld   e, $F8                                   ; $74B8: $1E $F8

jr_006_74BA:
    ld   hl, wEntitiesSpeedXTable                       ; $74BA: $21 $40 $C2
    add  hl, bc                                   ; $74BD: $09
    ld   [hl], e                                  ; $74BE: $73
    ret                                           ; $74BF: $C9

    ld   hl, sp-$06                               ; $74C0: $F8 $FA
    nop                                           ; $74C2: $00
    ld   b, $08                                   ; $74C3: $06 $08
    ld   b, $00                                   ; $74C5: $06 $00
    ld   a, [$FAF8]                               ; $74C7: $FA $F8 $FA
    call GetEntityTransitionCountdown             ; $74CA: $CD $05 $0C
    jr   nz, jr_006_74EF                          ; $74CD: $20 $20

    call GetRandomByte                            ; $74CF: $CD $0D $28
    and  $3F                                      ; $74D2: $E6 $3F
    add  $20                                      ; $74D4: $C6 $20
    ld   [hl], a                                  ; $74D6: $77
    and  $07                                      ; $74D7: $E6 $07
    ld   e, a                                     ; $74D9: $5F
    ld   d, b                                     ; $74DA: $50
    ld   hl, $74C2                                ; $74DB: $21 $C2 $74
    add  hl, de                                   ; $74DE: $19
    ld   a, [hl]                                  ; $74DF: $7E

jr_006_74E0:
    ld   hl, wEntitiesSpeedXTable                       ; $74E0: $21 $40 $C2
    add  hl, bc                                   ; $74E3: $09
    ld   [hl], a                                  ; $74E4: $77
    ld   hl, $74C0                                ; $74E5: $21 $C0 $74
    add  hl, de                                   ; $74E8: $19
    ld   a, [hl]                                  ; $74E9: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $74EA: $21 $50 $C2
    add  hl, bc                                   ; $74ED: $09
    ld   [hl], a                                  ; $74EE: $77

jr_006_74EF:
    ldh  a, [hFrameCounter]                       ; $74EF: $F0 $E7
    rra                                           ; $74F1: $1F
    rra                                           ; $74F2: $1F
    rra                                           ; $74F3: $1F
    rra                                           ; $74F4: $1F
    and  $01                                      ; $74F5: $E6 $01
    jp   SetEntitySpriteVariant                   ; $74F7: $C3 $0C $3B

    ld   d, b                                     ; $74FA: $50
    ld   [bc], a                                  ; $74FB: $02
    ld   d, b                                     ; $74FC: $50
    ld   [hl+], a                                 ; $74FD: $22
    jr   nz, jr_006_74E0                          ; $74FE: $20 $E0

    nop                                           ; $7500: $00
    nop                                           ; $7501: $00
    ld   hl, sp+$08                               ; $7502: $F8 $08
    nop                                           ; $7504: $00
    nop                                           ; $7505: $00
    nop                                           ; $7506: $00
    nop                                           ; $7507: $00
    ldh  [rNR41], a                               ; $7508: $E0 $20
    nop                                           ; $750A: $00
    nop                                           ; $750B: $00
    ld   [$30F8], sp                              ; $750C: $08 $F8 $30
    jr   nz, @+$40                                ; $750F: $20 $3E

    ld   bc, $BEE0                                ; $7511: $01 $E0 $BE
    ld   de, $74FA                                ; $7514: $11 $FA $74
    call RenderAnimatedActiveEntity                               ; $7517: $CD $C0 $3B
    call func_006_64C6                            ; $751A: $CD $C6 $64
    call label_C56                                ; $751D: $CD $56 $0C
    call label_3B39                               ; $7520: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $7523: $F0 $F0
    rst  $00                                      ; $7525: $C7
    ld   l, $75                                   ; $7526: $2E $75
    ccf                                           ; $7528: $3F
    ld   [hl], l                                  ; $7529: $75
    and  c                                        ; $752A: $A1
    ld   [hl], l                                  ; $752B: $75
    jp   nz, $F075                                ; $752C: $C2 $75 $F0

    xor  $21                                      ; $752F: $EE $21
    or   b                                        ; $7531: $B0
    jp   nz, label_006_7709                       ; $7532: $C2 $09 $77

    ldh  a, [wActiveEntityPosY]                   ; $7535: $F0 $EC
    ld   hl, wEntitiesUnknownTableC               ; $7537: $21 $C0 $C2
    add  hl, bc                                   ; $753A: $09
    ld   [hl], a                                  ; $753B: $77
    jp   IncrementEntityWalkingAttr               ; $753C: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $753F: $CD $05 $0C
    jr   nz, jr_006_7599                          ; $7542: $20 $55

    call label_3D7F                               ; $7544: $CD $7F $3D
    call func_006_65A4                            ; $7547: $CD $A4 $65
    add  $12                                      ; $754A: $C6 $12
    cp   $24                                      ; $754C: $FE $24
    jr   nc, jr_006_7567                          ; $754E: $30 $17

    call func_006_6594                            ; $7550: $CD $94 $65
    ld   d, b                                     ; $7553: $50
    ld   hl, $74FE                                ; $7554: $21 $FE $74
    add  hl, de                                   ; $7557: $19
    ld   a, [hl]                                  ; $7558: $7E
    ld   hl, $C380                                ; $7559: $21 $80 $C3
    add  hl, bc                                   ; $755C: $09
    ld   [hl], e                                  ; $755D: $73
    ld   hl, wEntitiesSpeedXTable                       ; $755E: $21 $40 $C2
    add  hl, bc                                   ; $7561: $09
    ld   [hl], a                                  ; $7562: $77
    ld   e, $18                                   ; $7563: $1E $18
    jr   jr_006_7585                              ; $7565: $18 $1E

jr_006_7567:
    call func_006_6594                            ; $7567: $CD $94 $65
    add  $12                                      ; $756A: $C6 $12
    cp   $24                                      ; $756C: $FE $24
    jr   nc, jr_006_7599                          ; $756E: $30 $29

    call func_006_65A4                            ; $7570: $CD $A4 $65
    ld   d, b                                     ; $7573: $50
    ld   hl, $7506                                ; $7574: $21 $06 $75
    add  hl, de                                   ; $7577: $19
    ld   a, [hl]                                  ; $7578: $7E
    ld   hl, $C380                                ; $7579: $21 $80 $C3
    add  hl, bc                                   ; $757C: $09
    ld   [hl], e                                  ; $757D: $73
    ld   hl, wEntitiesSpeedYTable                       ; $757E: $21 $50 $C2
    add  hl, bc                                   ; $7581: $09
    ld   [hl], a                                  ; $7582: $77
    ld   e, $10                                   ; $7583: $1E $10

jr_006_7585:
    call GetEntityTransitionCountdown             ; $7585: $CD $05 $0C
    ld   [hl], e                                  ; $7588: $73
    call label_3B23                               ; $7589: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $758C: $21 $A0 $C2
    add  hl, bc                                   ; $758F: $09
    ld   a, [hl]                                  ; $7590: $7E
    and  $0F                                      ; $7591: $E6 $0F
    jr   z, jr_006_759A                           ; $7593: $28 $05

    call GetEntityTransitionCountdown             ; $7595: $CD $05 $0C
    ld   [hl], b                                  ; $7598: $70

jr_006_7599:
    ret                                           ; $7599: $C9

jr_006_759A:
    ld   a, $0A                                   ; $759A: $3E $0A
    ldh  [hNoiseSfx], a                           ; $759C: $E0 $F4
    jp   IncrementEntityWalkingAttr               ; $759E: $C3 $12 $3B

    call func_006_6541                            ; $75A1: $CD $41 $65
    call GetEntityTransitionCountdown             ; $75A4: $CD $05 $0C
    jr   nz, jr_006_75B5                          ; $75A7: $20 $0C

jr_006_75A9:
    ld   a, $07                                   ; $75A9: $3E $07
    ldh  [hJingle], a                             ; $75AB: $E0 $F2
    call GetEntityTransitionCountdown             ; $75AD: $CD $05 $0C
    ld   [hl], $20                                ; $75B0: $36 $20
    jp   IncrementEntityWalkingAttr               ; $75B2: $C3 $12 $3B

jr_006_75B5:
    call label_3B23                               ; $75B5: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $75B8: $21 $A0 $C2
    add  hl, bc                                   ; $75BB: $09
    ld   a, [hl]                                  ; $75BC: $7E
    and  $0F                                      ; $75BD: $E6 $0F
    jr   nz, jr_006_75A9                          ; $75BF: $20 $E8

    ret                                           ; $75C1: $C9

    call GetEntityTransitionCountdown             ; $75C2: $CD $05 $0C
    ret  nz                                       ; $75C5: $C0

    ld   hl, $C380                                ; $75C6: $21 $80 $C3
    add  hl, bc                                   ; $75C9: $09
    ld   e, [hl]                                  ; $75CA: $5E
    ld   d, b                                     ; $75CB: $50
    ld   hl, $7502                                ; $75CC: $21 $02 $75
    add  hl, de                                   ; $75CF: $19
    ld   a, [hl]                                  ; $75D0: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $75D1: $21 $40 $C2
    add  hl, bc                                   ; $75D4: $09
    ld   [hl], a                                  ; $75D5: $77
    ld   hl, $750A                                ; $75D6: $21 $0A $75
    add  hl, de                                   ; $75D9: $19
    ld   a, [hl]                                  ; $75DA: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $75DB: $21 $50 $C2
    add  hl, bc                                   ; $75DE: $09
    ld   [hl], a                                  ; $75DF: $77
    call func_006_6541                            ; $75E0: $CD $41 $65
    ld   hl, wEntitiesUnknownTableB               ; $75E3: $21 $B0 $C2
    add  hl, bc                                   ; $75E6: $09
    ld   a, [hl]                                  ; $75E7: $7E
    ld   hl, wEntitiesPosXTable                         ; $75E8: $21 $00 $C2
    add  hl, bc                                   ; $75EB: $09
    cp   [hl]                                     ; $75EC: $BE
    ret  nz                                       ; $75ED: $C0

    ld   hl, wEntitiesUnknownTableC               ; $75EE: $21 $C0 $C2
    add  hl, bc                                   ; $75F1: $09
    ld   a, [hl]                                  ; $75F2: $7E
    ld   hl, wEntitiesPosYTable                         ; $75F3: $21 $10 $C2
    add  hl, bc                                   ; $75F6: $09
    cp   [hl]                                     ; $75F7: $BE
    ret  nz                                       ; $75F8: $C0

    call GetEntityTransitionCountdown             ; $75F9: $CD $05 $0C
    ld   [hl], $20                                ; $75FC: $36 $20
    call IncrementEntityWalkingAttr               ; $75FE: $CD $12 $3B
    ld   [hl], $01                                ; $7601: $36 $01
    ret                                           ; $7603: $C9

    ld   l, [hl]                                  ; $7604: $6E
    nop                                           ; $7605: $00
    ld   l, [hl]                                  ; $7606: $6E
    jr   nz, jr_006_766F                          ; $7607: $20 $66

    jr   nz, jr_006_766F                          ; $7609: $20 $64

    jr   nz, @+$66                                ; $760B: $20 $64

    nop                                           ; $760D: $00
    ld   h, [hl]                                  ; $760E: $66
    nop                                           ; $760F: $00
    ld   h, d                                     ; $7610: $62
    nop                                           ; $7611: $00
    ld   h, d                                     ; $7612: $62
    jr   nz, @+$62                                ; $7613: $20 $60

    nop                                           ; $7615: $00
    ld   h, b                                     ; $7616: $60
    jr   nz, @+$0A                                ; $7617: $20 $08

    ld   hl, sp+$00                               ; $7619: $F8 $00
    nop                                           ; $761B: $00
    nop                                           ; $761C: $00
    nop                                           ; $761D: $00
    ld   hl, sp+$08                               ; $761E: $F8 $08
    jr   nz, @-$1E                                ; $7620: $20 $E0

    nop                                           ; $7622: $00
    nop                                           ; $7623: $00
    nop                                           ; $7624: $00
    nop                                           ; $7625: $00
    ldh  [rNR41], a                               ; $7626: $E0 $20
    ld   de, $7604                                ; $7628: $11 $04 $76
    call RenderAnimatedActiveEntity                               ; $762B: $CD $C0 $3B
    call func_006_64C6                            ; $762E: $CD $C6 $64
    call func_006_64F7                            ; $7631: $CD $F7 $64
    call func_006_6541                            ; $7634: $CD $41 $65
    call label_3B23                               ; $7637: $CD $23 $3B
    ld   hl, wEntitiesStateTable                  ; $763A: $21 $90 $C2
    add  hl, bc                                   ; $763D: $09
    ld   a, [hl]                                  ; $763E: $7E
    rst  $00                                      ; $763F: $C7
    ld   c, b                                     ; $7640: $48
    db   $76                                      ; $7641: $76
    ld   h, b                                     ; $7642: $60
    db   $76                                      ; $7643: $76
    adc  l                                        ; $7644: $8D
    db   $76                                      ; $7645: $76
    cp   c                                        ; $7646: $B9
    db   $76                                      ; $7647: $76
    ld   hl, wEntitiesTransitionCountdownTable    ; $7648: $21 $E0 $C2
    add  hl, bc                                   ; $764B: $09
    ld   a, [hl]                                  ; $764C: $7E
    and  a                                        ; $764D: $A7
    jr   nz, jr_006_765E                          ; $764E: $20 $0E

    call IncrementEntityWalkingAttr               ; $7650: $CD $12 $3B
    ld   hl, wEntitiesUnknownTableB               ; $7653: $21 $B0 $C2
    add  hl, bc                                   ; $7656: $09
    ld   [hl], $01                                ; $7657: $36 $01
    call IsEntityUnknownFZero                     ; $7659: $CD $00 $0C
    ld   [hl], $20                                ; $765C: $36 $20

jr_006_765E:
    jr   jr_006_767E                              ; $765E: $18 $1E

    call IsEntityUnknownFZero                     ; $7660: $CD $00 $0C
    jr   nz, jr_006_7679                          ; $7663: $20 $14

    ld   hl, wEntitiesUnknownTableB               ; $7665: $21 $B0 $C2
    add  hl, bc                                   ; $7668: $09
    ld   a, [hl]                                  ; $7669: $7E
    ld   hl, wEntitiesStateTable                  ; $766A: $21 $90 $C2
    add  hl, bc                                   ; $766D: $09
    add  [hl]                                     ; $766E: $86

jr_006_766F:
    ld   [hl], a                                  ; $766F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $7670: $21 $E0 $C2
    add  hl, bc                                   ; $7673: $09
    ld   [hl], $30                                ; $7674: $36 $30
    jp   label_006_7735                           ; $7676: $C3 $35 $77

jr_006_7679:
    ld   a, [hl]                                  ; $7679: $7E
    and  $02                                      ; $767A: $E6 $02
    jr   nz, jr_006_7686                          ; $767C: $20 $08

jr_006_767E:
    ld   a, $FF                                   ; $767E: $3E $FF
    call SetEntitySpriteVariant                   ; $7680: $CD $0C $3B
    jp   label_006_7735                           ; $7683: $C3 $35 $77

jr_006_7686:
    xor  a                                        ; $7686: $AF
    call SetEntitySpriteVariant                   ; $7687: $CD $0C $3B
    jp   label_006_7735                           ; $768A: $C3 $35 $77

    xor  a                                        ; $768D: $AF
    call SetEntitySpriteVariant                   ; $768E: $CD $0C $3B
    call IsEntityUnknownFZero                     ; $7691: $CD $00 $0C
    cp   $02                                      ; $7694: $FE $02
    jr   nc, jr_006_76B6                          ; $7696: $30 $1E

    ld   a, [hl]                                  ; $7698: $7E
    cp   $01                                      ; $7699: $FE $01
    jr   z, jr_006_76A2                           ; $769B: $28 $05

    ld   [hl], $18                                ; $769D: $36 $18
    jp   label_006_7735                           ; $769F: $C3 $35 $77

jr_006_76A2:
    ld   hl, wEntitiesUnknownTableB               ; $76A2: $21 $B0 $C2
    add  hl, bc                                   ; $76A5: $09
    ld   a, [hl]                                  ; $76A6: $7E
    ld   hl, wEntitiesStateTable                  ; $76A7: $21 $90 $C2
    add  hl, bc                                   ; $76AA: $09
    add  [hl]                                     ; $76AB: $86
    ld   [hl], a                                  ; $76AC: $77
    cp   $01                                      ; $76AD: $FE $01
    jr   nz, jr_006_76B6                          ; $76AF: $20 $05

    call IsEntityUnknownFZero                     ; $76B1: $CD $00 $0C
    ld   [hl], $20                                ; $76B4: $36 $20

jr_006_76B6:
    jp   label_006_7735                           ; $76B6: $C3 $35 $77

    call label_3B39                               ; $76B9: $CD $39 $3B
    call IsEntityUnknownFZero                     ; $76BC: $CD $00 $0C
    cp   $28                                      ; $76BF: $FE $28
    jr   z, jr_006_76E9                           ; $76C1: $28 $26

    cp   $02                                      ; $76C3: $FE $02
    jr   nc, jr_006_772D                          ; $76C5: $30 $66

    ld   a, [hl]                                  ; $76C7: $7E
    cp   $01                                      ; $76C8: $FE $01
    jr   z, jr_006_76DD                           ; $76CA: $28 $11

    ld   [hl], $40                                ; $76CC: $36 $40
    call func_006_65B4                            ; $76CE: $CD $B4 $65
    ld   hl, $C380                                ; $76D1: $21 $80 $C3
    add  hl, bc                                   ; $76D4: $09
    ld   [hl], a                                  ; $76D5: $77
    inc  a                                        ; $76D6: $3C
    ld   hl, wEntitiesSpriteVariantTable               ; $76D7: $21 $B0 $C3
    add  hl, bc                                   ; $76DA: $09
    ld   [hl], a                                  ; $76DB: $77
    ret                                           ; $76DC: $C9

jr_006_76DD:
    ld   hl, wEntitiesUnknownTableB               ; $76DD: $21 $B0 $C2
    add  hl, bc                                   ; $76E0: $09
    ld   [hl], $FF                                ; $76E1: $36 $FF
    ld   hl, wEntitiesStateTable                  ; $76E3: $21 $90 $C2
    add  hl, bc                                   ; $76E6: $09
    dec  [hl]                                     ; $76E7: $35
    ret                                           ; $76E8: $C9

jr_006_76E9:
    ld   a, $22                                   ; $76E9: $3E $22
    call func_003_64CA_trampoline                               ; $76EB: $CD $86 $3B
    jr   c, jr_006_772D                           ; $76EE: $38 $3D

    push bc                                       ; $76F0: $C5
    ldh  a, [hScratch2]                           ; $76F1: $F0 $D9
    ld   hl, $C380                                ; $76F3: $21 $80 $C3
    add  hl, de                                   ; $76F6: $19
    ld   [hl], a                                  ; $76F7: $77
    ld   c, a                                     ; $76F8: $4F
    ld   hl, $7618                                ; $76F9: $21 $18 $76
    add  hl, bc                                   ; $76FC: $09
    ldh  a, [hScratch0]                           ; $76FD: $F0 $D7
    add  [hl]                                     ; $76FF: $86
    ld   hl, wEntitiesPosXTable                         ; $7700: $21 $00 $C2
    add  hl, de                                   ; $7703: $19
    ld   [hl], a                                  ; $7704: $77
    ld   hl, $761C                                ; $7705: $21 $1C $76
    add  hl, bc                                   ; $7708: $09

label_006_7709:
    ldh  a, [hScratch1]                           ; $7709: $F0 $D8
    add  [hl]                                     ; $770B: $86
    ld   hl, wEntitiesPosYTable                         ; $770C: $21 $10 $C2
    add  hl, de                                   ; $770F: $19
    ld   [hl], a                                  ; $7710: $77
    ld   hl, $7620                                ; $7711: $21 $20 $76
    add  hl, bc                                   ; $7714: $09
    ld   a, [hl]                                  ; $7715: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7716: $21 $40 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], a                                  ; $771A: $77
    ld   hl, $7624                                ; $771B: $21 $24 $76
    add  hl, bc                                   ; $771E: $09
    ld   a, [hl]                                  ; $771F: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7720: $21 $50 $C2
    add  hl, de                                   ; $7723: $19
    ld   [hl], a                                  ; $7724: $77

jr_006_7725:
    pop  bc                                       ; $7725: $C1
    ldh  a, [hScratch2]                           ; $7726: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable               ; $7728: $21 $B0 $C3
    add  hl, de                                   ; $772B: $19
    ld   [hl], a                                  ; $772C: $77

jr_006_772D:
    ld   hl, $C340                                ; $772D: $21 $40 $C3
    add  hl, bc                                   ; $7730: $09
    ld   a, $02                                   ; $7731: $3E $02
    ld   [hl], a                                  ; $7733: $77
    ret                                           ; $7734: $C9

label_006_7735:
    ld   hl, $C340                                ; $7735: $21 $40 $C3
    add  hl, bc                                   ; $7738: $09
    ld   [hl], $42                                ; $7739: $36 $42
    ret                                           ; $773B: $C9

    nop                                           ; $773C: $00
    ret  c                                        ; $773D: $D8

    ld   h, b                                     ; $773E: $60
    nop                                           ; $773F: $00
    nop                                           ; $7740: $00
    ldh  [$FF60], a                               ; $7741: $E0 $60
    jr   nz, jr_006_7745                          ; $7743: $20 $00

jr_006_7745:
    jr   z, jr_006_77A7                           ; $7745: $28 $60

    nop                                           ; $7747: $00
    nop                                           ; $7748: $00
    jr   nc, jr_006_77AB                          ; $7749: $30 $60

    jr   nz, jr_006_7725                          ; $774B: $20 $D8

jr_006_774D:
    nop                                           ; $774D: $00
    ld   h, d                                     ; $774E: $62
    nop                                           ; $774F: $00
    ret  c                                        ; $7750: $D8

    ld   [$2062], sp                              ; $7751: $08 $62 $20
    jr   z, jr_006_7756                           ; $7754: $28 $00

jr_006_7756:
    ld   h, d                                     ; $7756: $62
    nop                                           ; $7757: $00
    jr   z, jr_006_7762                           ; $7758: $28 $08

    ld   h, d                                     ; $775A: $62
    jr   nz, jr_006_774D                          ; $775B: $20 $F0

    ldh  a, [rOCPS]                               ; $775D: $F0 $6A
    nop                                           ; $775F: $00
    ldh  a, [hRoomStatus]                         ; $7760: $F0 $F8

jr_006_7762:
    ld   l, d                                     ; $7762: $6A
    ld   h, b                                     ; $7763: $60
    ldh  a, [rNR10]                               ; $7764: $F0 $10
    ld   l, d                                     ; $7766: $6A
    ld   b, b                                     ; $7767: $40
    ldh  a, [rNR23]                               ; $7768: $F0 $18
    ld   l, d                                     ; $776A: $6A
    jr   nz, jr_006_777D                          ; $776B: $20 $10

    ldh  a, [rOCPS]                               ; $776D: $F0 $6A
    ld   b, b                                     ; $776F: $40
    db   $10                                      ; $7770: $10
    ld   hl, sp+$6A                               ; $7771: $F8 $6A
    jr   nz, jr_006_7785                          ; $7773: $20 $10

jr_006_7775:
    db   $10                                      ; $7775: $10
    ld   l, d                                     ; $7776: $6A
    nop                                           ; $7777: $00
    db   $10                                      ; $7778: $10
    jr   jr_006_77E5                              ; $7779: $18 $6A

    ld   h, b                                     ; $777B: $60
    nop                                           ; $777C: $00

jr_006_777D:
    add  sp, $60                                  ; $777D: $E8 $60
    nop                                           ; $777F: $00
    nop                                           ; $7780: $00
    ldh  a, [$FF60]                               ; $7781: $F0 $60
    jr   nz, jr_006_7785                          ; $7783: $20 $00

jr_006_7785:
    jr   jr_006_77E7                              ; $7785: $18 $60

    nop                                           ; $7787: $00
    nop                                           ; $7788: $00
    jr   nz, jr_006_77EB                          ; $7789: $20 $60

    jr   nz, jr_006_7775                          ; $778B: $20 $E8

jr_006_778D:
    nop                                           ; $778D: $00
    ld   h, d                                     ; $778E: $62
    nop                                           ; $778F: $00
    add  sp, $08                                  ; $7790: $E8 $08
    ld   h, d                                     ; $7792: $62
    jr   nz, jr_006_77AD                          ; $7793: $20 $18

    nop                                           ; $7795: $00
    ld   h, d                                     ; $7796: $62
    nop                                           ; $7797: $00
    jr   jr_006_77A2                              ; $7798: $18 $08

    ld   h, d                                     ; $779A: $62
    jr   nz, jr_006_778D                          ; $779B: $20 $F0

    ldh  a, [rIE]                                 ; $779D: $F0 $FF
    nop                                           ; $779F: $00
    ldh  a, [hRoomStatus]                         ; $77A0: $F0 $F8

jr_006_77A2:
    rst  $38                                      ; $77A2: $FF
    nop                                           ; $77A3: $00
    ldh  a, [rNR10]                               ; $77A4: $F0 $10

jr_006_77A6:
    rst  $38                                      ; $77A6: $FF

jr_006_77A7:
    nop                                           ; $77A7: $00
    ldh  a, [rNR23]                               ; $77A8: $F0 $18
    rst  $38                                      ; $77AA: $FF

jr_006_77AB:
    nop                                           ; $77AB: $00
    db   $10                                      ; $77AC: $10

jr_006_77AD:
    ldh  a, [rIE]                                 ; $77AD: $F0 $FF
    nop                                           ; $77AF: $00
    db   $10                                      ; $77B0: $10
    ld   hl, sp-$01                               ; $77B1: $F8 $FF
    nop                                           ; $77B3: $00
    db   $10                                      ; $77B4: $10
    db   $10                                      ; $77B5: $10
    rst  $38                                      ; $77B6: $FF
    nop                                           ; $77B7: $00
    db   $10                                      ; $77B8: $10
    jr   @+$01                                    ; $77B9: $18 $FF

    nop                                           ; $77BB: $00
    ldh  [hBGMapOffsetHigh], a                    ; $77BC: $E0 $E0
    ld   l, b                                     ; $77BE: $68
    nop                                           ; $77BF: $00
    ldh  [hFFE8], a                               ; $77C0: $E0 $E8
    ld   l, b                                     ; $77C2: $68
    ld   h, b                                     ; $77C3: $60
    jr   nz, jr_006_77A6                          ; $77C4: $20 $E0

    ld   l, b                                     ; $77C6: $68
    ld   b, b                                     ; $77C7: $40
    jr   nz, @-$16                                ; $77C8: $20 $E8

    ld   l, b                                     ; $77CA: $68
    jr   nz, jr_006_77AD                          ; $77CB: $20 $E0

    jr   nz, jr_006_7837                          ; $77CD: $20 $68

    ld   b, b                                     ; $77CF: $40
    ldh  [$FF28], a                               ; $77D0: $E0 $28
    ld   l, b                                     ; $77D2: $68
    jr   nz, jr_006_77F5                          ; $77D3: $20 $20

jr_006_77D5:
    jr   nz, jr_006_783F                          ; $77D5: $20 $68

    nop                                           ; $77D7: $00
    jr   nz, jr_006_7802                          ; $77D8: $20 $28

    ld   l, b                                     ; $77DA: $68
    ld   h, b                                     ; $77DB: $60
    nop                                           ; $77DC: $00
    ldh  a, [$FF64]                               ; $77DD: $F0 $64
    nop                                           ; $77DF: $00
    nop                                           ; $77E0: $00
    ld   hl, sp+$64                               ; $77E1: $F8 $64
    jr   nz, jr_006_77D5                          ; $77E3: $20 $F0

jr_006_77E5:
    nop                                           ; $77E5: $00
    ld   h, [hl]                                  ; $77E6: $66

jr_006_77E7:
    nop                                           ; $77E7: $00
    ldh  a, [$FF08]                               ; $77E8: $F0 $08
    ld   h, [hl]                                  ; $77EA: $66

jr_006_77EB:
    jr   nz, jr_006_77ED                          ; $77EB: $20 $00

jr_006_77ED:
    db   $10                                      ; $77ED: $10

jr_006_77EE:
    ld   h, h                                     ; $77EE: $64
    nop                                           ; $77EF: $00
    nop                                           ; $77F0: $00
    jr   @+$66                                    ; $77F1: $18 $64

    jr   nz, @+$12                                ; $77F3: $20 $10

jr_006_77F5:
    nop                                           ; $77F5: $00
    ld   h, [hl]                                  ; $77F6: $66
    nop                                           ; $77F7: $00
    db   $10                                      ; $77F8: $10
    ld   [label_2066], sp                         ; $77F9: $08 $66 $20
    add  sp, -$18                                 ; $77FC: $E8 $E8
    ld   l, b                                     ; $77FE: $68
    nop                                           ; $77FF: $00
    add  sp, -$10                                 ; $7800: $E8 $F0

jr_006_7802:
    ld   l, b                                     ; $7802: $68
    ld   h, b                                     ; $7803: $60
    jr   jr_006_77EE                              ; $7804: $18 $E8

    ld   l, b                                     ; $7806: $68
    ld   b, b                                     ; $7807: $40
    jr   @-$0E                                    ; $7808: $18 $F0

    ld   l, b                                     ; $780A: $68
    jr   nz, jr_006_77F5                          ; $780B: $20 $E8

    jr   @+$6A                                    ; $780D: $18 $68

    ld   b, b                                     ; $780F: $40
    add  sp, $20                                  ; $7810: $E8 $20
    ld   l, b                                     ; $7812: $68
    jr   nz, jr_006_782D                          ; $7813: $20 $18

jr_006_7815:
    jr   jr_006_787F                              ; $7815: $18 $68

    nop                                           ; $7817: $00
    jr   @+$22                                    ; $7818: $18 $20

    ld   l, b                                     ; $781A: $68
    ld   h, b                                     ; $781B: $60
    nop                                           ; $781C: $00
    ldh  a, [rIE]                                 ; $781D: $F0 $FF
    nop                                           ; $781F: $00
    nop                                           ; $7820: $00
    ld   hl, sp-$01                               ; $7821: $F8 $FF
    jr   nz, jr_006_7815                          ; $7823: $20 $F0

    nop                                           ; $7825: $00
    rst  $38                                      ; $7826: $FF
    nop                                           ; $7827: $00
    ldh  a, [$FF08]                               ; $7828: $F0 $08
    rst  $38                                      ; $782A: $FF
    jr   nz, jr_006_782D                          ; $782B: $20 $00

jr_006_782D:
    db   $10                                      ; $782D: $10
    rst  $38                                      ; $782E: $FF
    nop                                           ; $782F: $00
    nop                                           ; $7830: $00
    jr   @+$01                                    ; $7831: $18 $FF

    jr   nz, @+$12                                ; $7833: $20 $10

    nop                                           ; $7835: $00
    rst  $38                                      ; $7836: $FF

jr_006_7837:
    nop                                           ; $7837: $00
    db   $10                                      ; $7838: $10
    ld   [$20FF], sp                              ; $7839: $08 $FF $20

func_006_783C::
    call func_006_64C6                            ; $783C: $CD $C6 $64

jr_006_783F:
    ldh  a, [hFrameCounter]                       ; $783F: $F0 $E7
    rra                                           ; $7841: $1F
    rra                                           ; $7842: $1F
    rra                                           ; $7843: $1F
    and  $03                                      ; $7844: $E6 $03
    ld   e, a                                     ; $7846: $5F
    ld   d, b                                     ; $7847: $50
    sla  e                                        ; $7848: $CB $23
    rl   d                                        ; $784A: $CB $12
    sla  e                                        ; $784C: $CB $23
    rl   d                                        ; $784E: $CB $12
    sla  e                                        ; $7850: $CB $23
    rl   d                                        ; $7852: $CB $12
    sla  e                                        ; $7854: $CB $23
    rl   d                                        ; $7856: $CB $12
    sla  e                                        ; $7858: $CB $23
    rl   d                                        ; $785A: $CB $12
    sla  e                                        ; $785C: $CB $23
    rl   d                                        ; $785E: $CB $12
    ld   hl, $773C                                ; $7860: $21 $3C $77
    add  hl, de                                   ; $7863: $19
    ld   c, $10                                   ; $7864: $0E $10
    call label_3CE6                               ; $7866: $CD $E6 $3C
    ld   a, $10                                   ; $7869: $3E $10
    jp   label_3DA0                               ; $786B: $C3 $A0 $3D

    ld   e, d                                     ; $786E: $5A
    nop                                           ; $786F: $00
    ld   e, d                                     ; $7870: $5A
    jr   nz, jr_006_78CD                          ; $7871: $20 $5A

    inc  d                                        ; $7873: $14
    ld   e, d                                     ; $7874: $5A
    inc  [hl]                                     ; $7875: $34
    ld   de, $786E                                ; $7876: $11 $6E $78
    call RenderAnimatedActiveEntity                               ; $7879: $CD $C0 $3B
    call func_006_64C6                            ; $787C: $CD $C6 $64

jr_006_787F:
    call func_006_64F7                            ; $787F: $CD $F7 $64
    call label_3B39                               ; $7882: $CD $39 $3B
    call func_006_6541                            ; $7885: $CD $41 $65
    call label_3B23                               ; $7888: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $788B: $21 $A0 $C2
    add  hl, bc                                   ; $788E: $09
    ld   a, [hl]                                  ; $788F: $7E
    and  $03                                      ; $7890: $E6 $03
    jr   nz, jr_006_789B                          ; $7892: $20 $07

    ld   a, [hl]                                  ; $7894: $7E
    and  $0C                                      ; $7895: $E6 $0C
    jr   nz, jr_006_78A5                          ; $7897: $20 $0C

    jr   jr_006_78AD                              ; $7899: $18 $12

jr_006_789B:
    ld   hl, wEntitiesSpeedXTable                       ; $789B: $21 $40 $C2
    add  hl, bc                                   ; $789E: $09
    ld   a, [hl]                                  ; $789F: $7E
    cpl                                           ; $78A0: $2F
    inc  a                                        ; $78A1: $3C
    ld   [hl], a                                  ; $78A2: $77
    jr   jr_006_78AD                              ; $78A3: $18 $08

jr_006_78A5:
    ld   hl, wEntitiesSpeedYTable                       ; $78A5: $21 $50 $C2
    add  hl, bc                                   ; $78A8: $09
    ld   a, [hl]                                  ; $78A9: $7E
    cpl                                           ; $78AA: $2F
    inc  a                                        ; $78AB: $3C
    ld   [hl], a                                  ; $78AC: $77

jr_006_78AD:
    ldh  a, [hFrameCounter]                       ; $78AD: $F0 $E7
    rra                                           ; $78AF: $1F
    rra                                           ; $78B0: $1F
    rra                                           ; $78B1: $1F
    and  $01                                      ; $78B2: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78B4: $C3 $0C $3B

    ld   e, b                                     ; $78B7: $58
    ld   [bc], a                                  ; $78B8: $02
    ld   e, b                                     ; $78B9: $58
    ld   [hl+], a                                 ; $78BA: $22
    ld   e, d                                     ; $78BB: $5A
    ld   [bc], a                                  ; $78BC: $02
    ld   e, d                                     ; $78BD: $5A
    ld   [hl+], a                                 ; $78BE: $22
    db   $10                                      ; $78BF: $10
    ldh  a, [rNR10]                               ; $78C0: $F0 $10
    ldh  a, [rNR10]                               ; $78C2: $F0 $10
    db   $10                                      ; $78C4: $10
    ldh  a, [hActiveEntityState]                  ; $78C5: $F0 $F0
    ld   de, $78B7                                ; $78C7: $11 $B7 $78
    call RenderAnimatedActiveEntity                               ; $78CA: $CD $C0 $3B

jr_006_78CD:
    call func_006_64C6                            ; $78CD: $CD $C6 $64
    call func_006_64F7                            ; $78D0: $CD $F7 $64
    call label_3B39                               ; $78D3: $CD $39 $3B
    call func_006_6541                            ; $78D6: $CD $41 $65
    call label_3B23                               ; $78D9: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $78DC: $21 $A0 $C2
    add  hl, bc                                   ; $78DF: $09
    ld   a, [hl]                                  ; $78E0: $7E
    and  $03                                      ; $78E1: $E6 $03
    jr   z, jr_006_78E8                           ; $78E3: $28 $03

    call func_006_7979                            ; $78E5: $CD $79 $79

jr_006_78E8:
    ld   a, [hl]                                  ; $78E8: $7E
    and  $0C                                      ; $78E9: $E6 $0C
    jr   z, jr_006_78F0                           ; $78EB: $28 $03

    call func_006_797E                            ; $78ED: $CD $7E $79

jr_006_78F0:
    ldh  a, [hActiveEntityState]                  ; $78F0: $F0 $F0
    and  a                                        ; $78F2: $A7
    jr   nz, jr_006_7921                          ; $78F3: $20 $2C

    ld   hl, wEntitiesPosZTable                   ; $78F5: $21 $10 $C3
    add  hl, bc                                   ; $78F8: $09
    ld   a, [hl]                                  ; $78F9: $7E
    and  $80                                      ; $78FA: $E6 $80
    jr   z, jr_006_7918                           ; $78FC: $28 $1A

    xor  a                                        ; $78FE: $AF
    ld   [hl], a                                  ; $78FF: $77
    call label_3D7F                               ; $7900: $CD $7F $3D
    ld   hl, wEntitiesStateTable                  ; $7903: $21 $90 $C2
    add  hl, bc                                   ; $7906: $09
    inc  [hl]                                     ; $7907: $34
    call GetEntityTransitionCountdown             ; $7908: $CD $05 $0C
    call GetRandomByte                            ; $790B: $CD $0D $28
    and  $3F                                      ; $790E: $E6 $3F
    add  $10                                      ; $7910: $C6 $10
    ld   [hl], a                                  ; $7912: $77
    ld   a, $01                                   ; $7913: $3E $01
    jp   SetEntitySpriteVariant                   ; $7915: $C3 $0C $3B

jr_006_7918:
    call func_006_657A                            ; $7918: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $791B: $21 $20 $C3
    add  hl, bc                                   ; $791E: $09
    dec  [hl]                                     ; $791F: $35
    ret                                           ; $7920: $C9

jr_006_7921:
    ld   hl, $C3D0                                ; $7921: $21 $D0 $C3
    add  hl, bc                                   ; $7924: $09
    inc  [hl]                                     ; $7925: $34
    ld   a, [hl]                                  ; $7926: $7E
    and  $10                                      ; $7927: $E6 $10
    srl  a                                        ; $7929: $CB $3F
    srl  a                                        ; $792B: $CB $3F
    srl  a                                        ; $792D: $CB $3F
    srl  a                                        ; $792F: $CB $3F
    call SetEntitySpriteVariant                   ; $7931: $CD $0C $3B
    and  a                                        ; $7934: $A7
    ret  nz                                       ; $7935: $C0

    call GetEntityTransitionCountdown             ; $7936: $CD $05 $0C
    ret  nz                                       ; $7939: $C0

    call GetRandomByte                            ; $793A: $CD $0D $28
    and  $07                                      ; $793D: $E6 $07
    add  $10                                      ; $793F: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $7941: $21 $20 $C3
    add  hl, bc                                   ; $7944: $09
    ld   [hl], a                                  ; $7945: $77
    call func_006_657A                            ; $7946: $CD $7A $65
    call GetRandomByte                            ; $7949: $CD $0D $28
    and  $03                                      ; $794C: $E6 $03
    ld   e, a                                     ; $794E: $5F
    ld   d, b                                     ; $794F: $50
    ld   hl, $78BF                                ; $7950: $21 $BF $78
    add  hl, de                                   ; $7953: $19
    ld   a, [hl]                                  ; $7954: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7955: $21 $40 $C2
    add  hl, bc                                   ; $7958: $09
    ld   [hl], a                                  ; $7959: $77
    ld   hl, $78C3                                ; $795A: $21 $C3 $78
    add  hl, de                                   ; $795D: $19
    ld   a, [hl]                                  ; $795E: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $795F: $21 $50 $C2
    add  hl, bc                                   ; $7962: $09
    ld   [hl], a                                  ; $7963: $77
    call GetRandomByte                            ; $7964: $CD $0D $28
    and  $01                                      ; $7967: $E6 $01
    jr   z, jr_006_7970                           ; $7969: $28 $05

    ld   a, $14                                   ; $796B: $3E $14
    call label_3BAA                               ; $796D: $CD $AA $3B

jr_006_7970:
    ld   hl, wEntitiesStateTable                  ; $7970: $21 $90 $C2
    add  hl, bc                                   ; $7973: $09
    xor  a                                        ; $7974: $AF
    ld   [hl], a                                  ; $7975: $77
    jp   SetEntitySpriteVariant                   ; $7976: $C3 $0C $3B

func_006_7979:
    ld   hl, wEntitiesSpeedXTable                       ; $7979: $21 $40 $C2
    jr   jr_006_7982                              ; $797C: $18 $04

func_006_797E:
    ld   hl, wEntitiesSpeedXTable                       ; $797E: $21 $40 $C2
    add  hl, bc                                   ; $7981: $09

jr_006_7982:
    ld   a, [hl]                                  ; $7982: $7E
    cpl                                           ; $7983: $2F
    inc  a                                        ; $7984: $3C
    sra  a                                        ; $7985: $CB $2F
    ld   [hl], a                                  ; $7987: $77
    ret                                           ; $7988: $C9

    ld   h, d                                     ; $7989: $62
    jr   nz, @+$62                                ; $798A: $20 $60

    jr   nz, @+$68                                ; $798C: $20 $66

    jr   nz, @+$66                                ; $798E: $20 $64

    jr   nz, jr_006_79F2                          ; $7990: $20 $60

    nop                                           ; $7992: $00
    ld   h, d                                     ; $7993: $62
    nop                                           ; $7994: $00
    ld   h, h                                     ; $7995: $64
    nop                                           ; $7996: $00
    ld   h, [hl]                                  ; $7997: $66
    nop                                           ; $7998: $00
    ld   l, b                                     ; $7999: $68
    nop                                           ; $799A: $00
    ld   l, b                                     ; $799B: $68
    jr   nz, jr_006_7A08                          ; $799C: $20 $6A

    nop                                           ; $799E: $00
    ld   l, d                                     ; $799F: $6A
    jr   nz, @+$70                                ; $79A0: $20 $6E

    jr   nz, @+$6E                                ; $79A2: $20 $6C

    jr   nz, @+$6E                                ; $79A4: $20 $6C

    nop                                           ; $79A6: $00
    ld   l, [hl]                                  ; $79A7: $6E
    nop                                           ; $79A8: $00
    ld   de, $7989                                ; $79A9: $11 $89 $79
    call RenderAnimatedActiveEntity                               ; $79AC: $CD $C0 $3B
    call func_006_64C6                            ; $79AF: $CD $C6 $64
    call func_006_64F7                            ; $79B2: $CD $F7 $64
    call func_006_6541                            ; $79B5: $CD $41 $65
    call func_006_5E54                            ; $79B8: $CD $54 $5E
    ldh  a, [hActiveEntityState]                  ; $79BB: $F0 $F0
    rst  $00                                      ; $79BD: $C7
    jp   nz, $3E79                                ; $79BE: $C2 $79 $3E

    ld   a, d                                     ; $79C1: $7A
    ld   a, [$C1A2]                               ; $79C2: $FA $A2 $C1
    and  a                                        ; $79C5: $A7
    jp   nz, label_006_7A38                       ; $79C6: $C2 $38 $7A

    call GetEntityTransitionCountdown             ; $79C9: $CD $05 $0C
    jr   nz, jr_006_7A11                          ; $79CC: $20 $43

    call IsEntityUnknownFZero                     ; $79CE: $CD $00 $0C
    jr   nz, jr_006_7A21                          ; $79D1: $20 $4E

    ld   a, [wSwordAnimationState]                ; $79D3: $FA $37 $C1
    cp   $03                                      ; $79D6: $FE $03
    jr   z, jr_006_79FA                           ; $79D8: $28 $20

    call GetRandomByte                            ; $79DA: $CD $0D $28
    xor  c                                        ; $79DD: $A9
    and  $07                                      ; $79DE: $E6 $07
    add  $06                                      ; $79E0: $C6 $06
    call label_3BB5                               ; $79E2: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $79E5: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                       ; $79E7: $21 $50 $C2
    call func_006_7A79                            ; $79EA: $CD $79 $7A
    ldh  a, [hScratch1]                           ; $79ED: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                       ; $79EF: $21 $40 $C2

jr_006_79F2:
    call func_006_7A79                            ; $79F2: $CD $79 $7A
    call label_3B44                               ; $79F5: $CD $44 $3B
    jr   jr_006_7A27                              ; $79F8: $18 $2D

jr_006_79FA:
    call func_006_6594                            ; $79FA: $CD $94 $65
    add  $24                                      ; $79FD: $C6 $24
    cp   $48                                      ; $79FF: $FE $48
    jr   nc, jr_006_7A27                          ; $7A01: $30 $24

    call func_006_65A4                            ; $7A03: $CD $A4 $65
    add  $24                                      ; $7A06: $C6 $24

jr_006_7A08:
    cp   $48                                      ; $7A08: $FE $48
    jr   nc, jr_006_7A27                          ; $7A0A: $30 $1B

    call GetEntityTransitionCountdown             ; $7A0C: $CD $05 $0C
    ld   [hl], $20                                ; $7A0F: $36 $20

jr_006_7A11:
    call label_3D7F                               ; $7A11: $CD $7F $3D
    call func_006_7AB0                            ; $7A14: $CD $B0 $7A
    ld   hl, wEntitiesUnknownTableB               ; $7A17: $21 $B0 $C2
    add  hl, bc                                   ; $7A1A: $09
    ld   a, [hl]                                  ; $7A1B: $7E
    and  a                                        ; $7A1C: $A7
    ret  z                                        ; $7A1D: $C8

    call func_006_7A8C                            ; $7A1E: $CD $8C $7A

jr_006_7A21:
    call label_3D7F                               ; $7A21: $CD $7F $3D
    jp   label_006_7AB0                           ; $7A24: $C3 $B0 $7A

jr_006_7A27:
    call func_006_6594                            ; $7A27: $CD $94 $65
    sla  e                                        ; $7A2A: $CB $23
    ldh  a, [hFrameCounter]                       ; $7A2C: $F0 $E7
    rra                                           ; $7A2E: $1F
    rra                                           ; $7A2F: $1F
    rra                                           ; $7A30: $1F
    rra                                           ; $7A31: $1F
    and  $01                                      ; $7A32: $E6 $01
    add  e                                        ; $7A34: $83
    jp   SetEntitySpriteVariant                   ; $7A35: $C3 $0C $3B

label_006_7A38:
    call IncrementEntityWalkingAttr               ; $7A38: $CD $12 $3B
    ld   [hl], $01                                ; $7A3B: $36 $01
    ret                                           ; $7A3D: $C9

    ld   a, [$C1A2]                               ; $7A3E: $FA $A2 $C1
    and  a                                        ; $7A41: $A7
    jr   z, jr_006_7A74                           ; $7A42: $28 $30

    ld   hl, wEntitiesHealthTable                 ; $7A44: $21 $60 $C3
    add  hl, bc                                   ; $7A47: $09
    ld   [hl], $01                                ; $7A48: $36 $01
    call label_3B39                               ; $7A4A: $CD $39 $3B
    ld   a, $04                                   ; $7A4D: $3E $04
    call label_3BB5                               ; $7A4F: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $7A52: $F0 $D7
    cpl                                           ; $7A54: $2F
    inc  a                                        ; $7A55: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $7A56: $21 $50 $C2
    add  hl, bc                                   ; $7A59: $09
    ld   [hl], a                                  ; $7A5A: $77
    ldh  a, [hScratch1]                           ; $7A5B: $F0 $D8
    cpl                                           ; $7A5D: $2F
    inc  a                                        ; $7A5E: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $7A5F: $21 $40 $C2
    add  hl, bc                                   ; $7A62: $09
    ld   [hl], a                                  ; $7A63: $77
    ldh  a, [hFrameCounter]                       ; $7A64: $F0 $E7
    rra                                           ; $7A66: $1F
    rra                                           ; $7A67: $1F
    rra                                           ; $7A68: $1F
    rra                                           ; $7A69: $1F
    and  $01                                      ; $7A6A: $E6 $01
    add  $04                                      ; $7A6C: $C6 $04
    ld   hl, wEntitiesSpriteVariantTable               ; $7A6E: $21 $B0 $C3
    add  hl, bc                                   ; $7A71: $09
    ld   [hl], a                                  ; $7A72: $77
    ret                                           ; $7A73: $C9

jr_006_7A74:
    call IncrementEntityWalkingAttr               ; $7A74: $CD $12 $3B
    ld   [hl], b                                  ; $7A77: $70
    ret                                           ; $7A78: $C9

func_006_7A79:
    add  hl, bc                                   ; $7A79: $09
    sub  [hl]                                     ; $7A7A: $96
    jr   z, jr_006_7A8B                           ; $7A7B: $28 $0E

    bit  7, a                                     ; $7A7D: $CB $7F
    jr   z, jr_006_7A87                           ; $7A7F: $28 $06

    dec  [hl]                                     ; $7A81: $35
    dec  [hl]                                     ; $7A82: $35
    dec  [hl]                                     ; $7A83: $35
    dec  [hl]                                     ; $7A84: $35
    jr   jr_006_7A8B                              ; $7A85: $18 $04

jr_006_7A87:
    inc  [hl]                                     ; $7A87: $34
    inc  [hl]                                     ; $7A88: $34
    inc  [hl]                                     ; $7A89: $34
    inc  [hl]                                     ; $7A8A: $34

jr_006_7A8B:
    ret                                           ; $7A8B: $C9

func_006_7A8C:
    call IsEntityUnknownFZero                     ; $7A8C: $CD $00 $0C
    ld   [hl], $20                                ; $7A8F: $36 $20
    ld   hl, wEntitiesUnknownTableB               ; $7A91: $21 $B0 $C2
    add  hl, bc                                   ; $7A94: $09
    ld   [hl], $00                                ; $7A95: $36 $00
    ld   hl, wEntitiesPosYTable                         ; $7A97: $21 $10 $C2
    add  hl, bc                                   ; $7A9A: $09
    ld   a, [hl]                                  ; $7A9B: $7E
    sub  $48                                      ; $7A9C: $D6 $48
    ld   e, a                                     ; $7A9E: $5F
    ld   a, $48                                   ; $7A9F: $3E $48
    sub  e                                        ; $7AA1: $93
    ld   [hl], a                                  ; $7AA2: $77
    ld   hl, wEntitiesPosXTable                         ; $7AA3: $21 $00 $C2
    add  hl, bc                                   ; $7AA6: $09
    ld   a, [hl]                                  ; $7AA7: $7E
    sub  $50                                      ; $7AA8: $D6 $50
    ld   e, a                                     ; $7AAA: $5F
    ld   a, $50                                   ; $7AAB: $3E $50
    sub  e                                        ; $7AAD: $93
    ld   [hl], a                                  ; $7AAE: $77
    ret                                           ; $7AAF: $C9

func_006_7AB0:
label_006_7AB0:
    ldh  a, [hFrameCounter]                       ; $7AB0: $F0 $E7
    rra                                           ; $7AB2: $1F
    rra                                           ; $7AB3: $1F
    and  $01                                      ; $7AB4: $E6 $01
    jr   z, jr_006_7AC7                           ; $7AB6: $28 $0F

    call func_006_6594                            ; $7AB8: $CD $94 $65
    srl  e                                        ; $7ABB: $CB $3B
    jr   c, jr_006_7AC3                           ; $7ABD: $38 $04

    ld   a, $06                                   ; $7ABF: $3E $06
    jr   jr_006_7AC9                              ; $7AC1: $18 $06

jr_006_7AC3:
    ld   a, $07                                   ; $7AC3: $3E $07
    jr   jr_006_7AC9                              ; $7AC5: $18 $02

jr_006_7AC7:
    ld   a, $FF                                   ; $7AC7: $3E $FF

jr_006_7AC9:
    call SetEntitySpriteVariant                   ; $7AC9: $CD $0C $3B
    ld   hl, wEntitiesUnknownTableB               ; $7ACC: $21 $B0 $C2
    add  hl, bc                                   ; $7ACF: $09
    ld   [hl], b                                  ; $7AD0: $70
    call GetEntityTransitionCountdown             ; $7AD1: $CD $05 $0C
    cp   $01                                      ; $7AD4: $FE $01
    ret  nz                                       ; $7AD6: $C0

    ld   hl, wEntitiesUnknownTableB               ; $7AD7: $21 $B0 $C2
    add  hl, bc                                   ; $7ADA: $09
    inc  [hl]                                     ; $7ADB: $34
    ret                                           ; $7ADC: $C9

    and  [hl]                                     ; $7ADD: $A6
    dec  d                                        ; $7ADE: $15
    adc  [hl]                                     ; $7ADF: $8E
    ld   d, $80                                   ; $7AE0: $16 $80
    dec  d                                        ; $7AE2: $15
    and  [hl]                                     ; $7AE3: $A6
    dec  d                                        ; $7AE4: $15
    xor  c                                        ; $7AE5: $A9
    inc  d                                        ; $7AE6: $14
    ld   a, [hl+]                                 ; $7AE7: $2A
    ld   b, c                                     ; $7AE8: $41
    ld   a, [hl+]                                 ; $7AE9: $2A
    ld   h, c                                     ; $7AEA: $61
    nop                                           ; $7AEB: $00
    db   $FC                                      ; $7AEC: $FC
    ld   [hl+], a                                 ; $7AED: $22
    nop                                           ; $7AEE: $00
    nop                                           ; $7AEF: $00
    inc  c                                        ; $7AF0: $0C
    ld   [hl+], a                                 ; $7AF1: $22
    jr   nz, jr_006_7AF4                          ; $7AF2: $20 $00

jr_006_7AF4:
    db   $FC                                      ; $7AF4: $FC
    ld   [hl+], a                                 ; $7AF5: $22
    ld   b, b                                     ; $7AF6: $40
    nop                                           ; $7AF7: $00
    inc  c                                        ; $7AF8: $0C
    ld   [hl+], a                                 ; $7AF9: $22
    ld   h, b                                     ; $7AFA: $60
    rrca                                          ; $7AFB: $0F
    rrca                                          ; $7AFC: $0F
    db   $10                                      ; $7AFD: $10
    ld   de, $1111                                ; $7AFE: $11 $11 $11
    db   $10                                      ; $7B01: $10
    rrca                                          ; $7B02: $0F
    nop                                           ; $7B03: $00
    nop                                           ; $7B04: $00
    ld   bc, $0202                                ; $7B05: $01 $02 $02
    ld   [bc], a                                  ; $7B08: $02
    ld   bc, $FA00                                ; $7B09: $01 $00 $FA
    and  l                                        ; $7B0C: $A5
    db   $DB                                      ; $7B0D: $DB
    and  a                                        ; $7B0E: $A7
    jr   z, jr_006_7B1C                           ; $7B0F: $28 $0B

    ldh  a, [hMapId]                              ; $7B11: $F0 $F7
    cp   $FF                                      ; $7B13: $FE $FF
    jr   nz, jr_006_7B1C                          ; $7B15: $20 $05

    ld   a, $06                                   ; $7B17: $3E $06
    jp   Func_036_4F9B_trampoline                                ; $7B19: $C3 $53 $0A

jr_006_7B1C:
    ld   a, [wIsIndoor]                           ; $7B1C: $FA $A5 $DB
    and  a                                        ; $7B1F: $A7
    jr   z, jr_006_7B32                           ; $7B20: $28 $10

    ldh  a, [hMapId]                              ; $7B22: $F0 $F7
    and  a                                        ; $7B24: $A7
    jr   nz, jr_006_7B32                          ; $7B25: $20 $0B

    ldh  a, [hMapRoom]                            ; $7B27: $F0 $F6
    cp   $1C                                      ; $7B29: $FE $1C
    jr   nz, jr_006_7B32                          ; $7B2B: $20 $05

    ld   a, $01                                   ; $7B2D: $3E $01
    ld   [$DE00], a                               ; $7B2F: $EA $00 $DE

jr_006_7B32:
    ld   hl, $7AFB                                ; $7B32: $21 $FB $7A
    ldh  a, [hIsSideScrolling]                    ; $7B35: $F0 $F9
    and  a                                        ; $7B37: $A7
    jr   z, jr_006_7B3D                           ; $7B38: $28 $03

    ld   hl, $7B03                                ; $7B3A: $21 $03 $7B

jr_006_7B3D:
    ldh  a, [hFrameCounter]                       ; $7B3D: $F0 $E7
    rra                                           ; $7B3F: $1F
    rra                                           ; $7B40: $1F
    rra                                           ; $7B41: $1F
    and  $07                                      ; $7B42: $E6 $07
    ld   e, a                                     ; $7B44: $5F
    ld   d, b                                     ; $7B45: $50
    add  hl, de                                   ; $7B46: $19
    ld   a, [hl]                                  ; $7B47: $7E
    ld   hl, wEntitiesPosZTable                   ; $7B48: $21 $10 $C3
    add  hl, bc                                   ; $7B4B: $09
    ld   [hl], a                                  ; $7B4C: $77
    ldh  a, [hActiveEntitySpriteVariant]               ; $7B4D: $F0 $F1
    cp   $05                                      ; $7B4F: $FE $05
    jr   nz, jr_006_7B5B                          ; $7B51: $20 $08

    ld   de, $7AD3                                ; $7B53: $11 $D3 $7A
    call RenderAnimatedActiveEntity                               ; $7B56: $CD $C0 $3B
    jr   jr_006_7B61                              ; $7B59: $18 $06

jr_006_7B5B:
    ld   de, $7ADD                                ; $7B5B: $11 $DD $7A
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7B5E: $CD $77 $3C

jr_006_7B61:
    ldh  a, [hFrameCounter]                       ; $7B61: $F0 $E7
    and  $08                                      ; $7B63: $E6 $08
    ld   e, a                                     ; $7B65: $5F
    ld   d, b                                     ; $7B66: $50
    ld   hl, $7AEB                                ; $7B67: $21 $EB $7A
    add  hl, de                                   ; $7B6A: $19
    ld   c, $02                                   ; $7B6B: $0E $02
    call label_3CE6                               ; $7B6D: $CD $E6 $3C
    ld   a, $01                                   ; $7B70: $3E $01
    call label_3DA0                               ; $7B72: $CD $A0 $3D
    call label_3D8A                               ; $7B75: $CD $8A $3D
    call func_006_64C6                            ; $7B78: $CD $C6 $64
    ldh  a, [hIsSideScrolling]                    ; $7B7B: $F0 $F9
    and  a                                        ; $7B7D: $A7
    jr   nz, jr_006_7B85                          ; $7B7E: $20 $05

    ldh  a, [$FFA2]                               ; $7B80: $F0 $A2
    cp   $0C                                      ; $7B82: $FE $0C
    ret  c                                        ; $7B84: $D8

jr_006_7B85:
    call label_3B5A                               ; $7B85: $CD $5A $3B
    ret  nc                                       ; $7B88: $D0

    call $3F5E                                    ; $7B89: $CD $5E $3F
    call func_006_65DB                            ; $7B8C: $CD $DB $65
    ld   a, $01                                   ; $7B8F: $3E $01
    ldh  [hWaveSfx], a                            ; $7B91: $E0 $F3
    ldh  a, [hActiveEntitySpriteVariant]               ; $7B93: $F0 $F1
    rst  $00                                      ; $7B95: $C7
    cp   c                                        ; $7B96: $B9
    ld   a, e                                     ; $7B97: $7B
    cp   a                                        ; $7B98: $BF
    ld   a, e                                     ; $7B99: $7B
    ret  nc                                       ; $7B9A: $D0

    ld   a, e                                     ; $7B9B: $7B
    cp   c                                        ; $7B9C: $B9
    ld   a, e                                     ; $7B9D: $7B
    and  d                                        ; $7B9E: $A2
    ld   a, e                                     ; $7B9F: $7B
    xor  a                                        ; $7BA0: $AF
    ld   a, e                                     ; $7BA1: $7B
    ld   a, [wSubstractRupeeBufferLow]            ; $7BA2: $FA $93 $DB
    add  $18                                      ; $7BA5: $C6 $18
    jr   nc, jr_006_7BAB                          ; $7BA7: $30 $02

    ld   a, $FF                                   ; $7BA9: $3E $FF

jr_006_7BAB:
    ld   [wSubstractRupeeBufferLow], a            ; $7BAB: $EA $93 $DB
    ret                                           ; $7BAE: $C9

    ld   a, [wArrowCount]                         ; $7BAF: $FA $45 $DB
    add  $10                                      ; $7BB2: $C6 $10
    daa                                           ; $7BB4: $27
    ld   [wArrowCount], a                         ; $7BB5: $EA $45 $DB
    ret                                           ; $7BB8: $C9

    ld   a, $0A                                   ; $7BB9: $3E $0A
    ld   [wAddRupeeBufferHigh], a                 ; $7BBB: $EA $90 $DB
    ret                                           ; $7BBE: $C9

    ld   d, $0C                                   ; $7BBF: $16 $0C
    call label_3E6B                               ; $7BC1: $CD $6B $3E
    ld   a, $0B                                   ; $7BC4: $3E $0B
    ldh  [hFFA5], a                               ; $7BC6: $E0 $A5
    ld   hl, wMaxMagicPowder                      ; $7BC8: $21 $76 $DB
    ld   de, wMagicPowderCount                    ; $7BCB: $11 $4C $DB
    jr   jr_006_7BD6                              ; $7BCE: $18 $06

    ld   hl, wMaxBombs                            ; $7BD0: $21 $77 $DB
    ld   de, wBombCount                           ; $7BD3: $11 $4D $DB

jr_006_7BD6:
    ld   a, [de]                                  ; $7BD6: $1A
    cp   [hl]                                     ; $7BD7: $BE
    ret  nc                                       ; $7BD8: $D0

    add  $10                                      ; $7BD9: $C6 $10
    daa                                           ; $7BDB: $27
    cp   [hl]                                     ; $7BDC: $BE
    jr   c, jr_006_7BE0                           ; $7BDD: $38 $01

    ld   a, [hl]                                  ; $7BDF: $7E

jr_006_7BE0:
    ld   [de], a                                  ; $7BE0: $12
    ret                                           ; $7BE1: $C9

func_006_7BE2:
    ldh  a, [hMapId]                              ; $7BE2: $F0 $F7
    cp   $0A                                      ; $7BE4: $FE $0A
    ret  nz                                       ; $7BE6: $C0

jr_006_7BE7:
    ldh  a, [hMapRoom]                            ; $7BE7: $F0 $F6
    cp   $97                                      ; $7BE9: $FE $97
    jr   z, jr_006_7BF0                           ; $7BEB: $28 $03

    cp   $98                                      ; $7BED: $FE $98
    ret  nz                                       ; $7BEF: $C0

jr_006_7BF0:
    ld   a, [$DB7F]                               ; $7BF0: $FA $7F $DB
    and  a                                        ; $7BF3: $A7
    ret  z                                        ; $7BF4: $C8

    ld   a, $FF                                   ; $7BF5: $3E $FF
    ldh  [hActiveEntitySpriteVariant], a               ; $7BF7: $E0 $F1
    ret                                           ; $7BF9: $C9

    ld   d, [hl]                                  ; $7BFA: $56
    ld   [bc], a                                  ; $7BFB: $02
    ld   d, [hl]                                  ; $7BFC: $56
    ld   [hl+], a                                 ; $7BFD: $22
    call func_006_7BE2                            ; $7BFE: $CD $E2 $7B
    ld   de, $7BFA                                ; $7C01: $11 $FA $7B
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7C04: $CD $77 $3C
    jr   jr_006_7C2E                              ; $7C07: $18 $25

    ld   d, d                                     ; $7C09: $52
    ld   [bc], a                                  ; $7C0A: $02
    ld   d, d                                     ; $7C0B: $52
    ld   [hl+], a                                 ; $7C0C: $22
    ld   d, h                                     ; $7C0D: $54
    ld   [bc], a                                  ; $7C0E: $02
    ld   d, h                                     ; $7C0F: $54
    ld   [hl+], a                                 ; $7C10: $22
    ld   d, d                                     ; $7C11: $52
    nop                                           ; $7C12: $00
    ld   d, d                                     ; $7C13: $52
    jr   nz, jr_006_7C6A                          ; $7C14: $20 $54

    nop                                           ; $7C16: $00
    ld   d, h                                     ; $7C17: $54
    jr   nz, jr_006_7BE7                          ; $7C18: $20 $CD

    ld   [c], a                                   ; $7C1A: $E2
    ld   a, e                                     ; $7C1B: $7B
    ld   de, $7C09                                ; $7C1C: $11 $09 $7C
    ld   hl, wEntitiesHealthTable                 ; $7C1F: $21 $60 $C3
    add  hl, bc                                   ; $7C22: $09
    ld   a, [hl]                                  ; $7C23: $7E
    and  $02                                      ; $7C24: $E6 $02
    jr   nz, jr_006_7C2B                          ; $7C26: $20 $03

    ld   de, $7C11                                ; $7C28: $11 $11 $7C

jr_006_7C2B:
    call RenderAnimatedActiveEntity                               ; $7C2B: $CD $C0 $3B

jr_006_7C2E:
    ld   hl, $C1AE                                ; $7C2E: $21 $AE $C1
    inc  [hl]                                     ; $7C31: $34
    call func_006_64C6                            ; $7C32: $CD $C6 $64
    call func_006_657A                            ; $7C35: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7C38: $21 $20 $C3
    add  hl, bc                                   ; $7C3B: $09
    dec  [hl]                                     ; $7C3C: $35
    dec  [hl]                                     ; $7C3D: $35
    dec  [hl]                                     ; $7C3E: $35
    ld   hl, wEntitiesPosZTable                   ; $7C3F: $21 $10 $C3
    add  hl, bc                                   ; $7C42: $09
    ld   a, [hl]                                  ; $7C43: $7E
    and  $80                                      ; $7C44: $E6 $80
    ldh  [hFFE8], a                               ; $7C46: $E0 $E8
    jr   z, jr_006_7C50                           ; $7C48: $28 $06

    ld   [hl], b                                  ; $7C4A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C4B: $21 $20 $C3
    add  hl, bc                                   ; $7C4E: $09
    ld   [hl], b                                  ; $7C4F: $70

jr_006_7C50:
    ldh  a, [hActiveEntityType]                   ; $7C50: $F0 $EB
    cp   $1B                                      ; $7C52: $FE $1B
    jr   nz, jr_006_7CB7                          ; $7C54: $20 $61

    ld   hl, $C420                                ; $7C56: $21 $20 $C4
    add  hl, bc                                   ; $7C59: $09
    ld   a, [hl]                                  ; $7C5A: $7E
    cp   $08                                      ; $7C5B: $FE $08
    jr   nz, jr_006_7CB7                          ; $7C5D: $20 $58

    ld   [hl], b                                  ; $7C5F: $70
    ld   hl, $C460                                ; $7C60: $21 $60 $C4
    add  hl, bc                                   ; $7C63: $09
    ld   a, [hl]                                  ; $7C64: $7E
    push hl                                       ; $7C65: $E5
    push af                                       ; $7C66: $F5
    ld   hl, wEntitiesTypeTable                   ; $7C67: $21 $A0 $C3

jr_006_7C6A:
    add  hl, bc                                   ; $7C6A: $09
    ld   [hl], $1C                                ; $7C6B: $36 $1C
    call label_3965                               ; $7C6D: $CD $65 $39
    pop  af                                       ; $7C70: $F1
    pop  hl                                       ; $7C71: $E1
    ld   [hl], a                                  ; $7C72: $77
    ld   hl, wEntitiesPosXTable                         ; $7C73: $21 $00 $C2
    add  hl, bc                                   ; $7C76: $09
    ld   a, [hl]                                  ; $7C77: $7E
    sub  $04                                      ; $7C78: $D6 $04
    ld   [hl], a                                  ; $7C7A: $77
    call label_3D7F                               ; $7C7B: $CD $7F $3D
    ld   hl, $C410                                ; $7C7E: $21 $10 $C4
    add  hl, bc                                   ; $7C81: $09
    ld   [hl], b                                  ; $7C82: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C83: $21 $20 $C3
    add  hl, bc                                   ; $7C86: $09
    ld   [hl], $20                                ; $7C87: $36 $20
    ld   a, $1C                                   ; $7C89: $3E $1C
    call func_003_64CA_trampoline                               ; $7C8B: $CD $86 $3B
    jr   c, jr_006_7CB7                           ; $7C8E: $38 $27

    ld   hl, $C460                                ; $7C90: $21 $60 $C4
    add  hl, bc                                   ; $7C93: $09
    ld   a, [hl]                                  ; $7C94: $7E
    ld   hl, $C460                                ; $7C95: $21 $60 $C4
    add  hl, de                                   ; $7C98: $19
    ld   [hl], a                                  ; $7C99: $77
    ldh  a, [hScratch0]                           ; $7C9A: $F0 $D7
    add  $08                                      ; $7C9C: $C6 $08
    ld   hl, wEntitiesPosXTable                         ; $7C9E: $21 $00 $C2
    add  hl, de                                   ; $7CA1: $19
    ld   [hl], a                                  ; $7CA2: $77
    ldh  a, [hScratch1]                           ; $7CA3: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7CA5: $21 $10 $C2
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    ldh  a, [hScratch3]                           ; $7CAA: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $7CAC: $21 $10 $C3
    add  hl, de                                   ; $7CAF: $19
    ld   [hl], a                                  ; $7CB0: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7CB1: $21 $20 $C3
    add  hl, de                                   ; $7CB4: $19
    ld   [hl], $20                                ; $7CB5: $36 $20

jr_006_7CB7:
    call func_006_64F7                            ; $7CB7: $CD $F7 $64
    ld   hl, wEntitiesUnknowTableG                ; $7CBA: $21 $00 $C3
    add  hl, bc                                   ; $7CBD: $09
    ld   a, [hl]                                  ; $7CBE: $7E
    and  a                                        ; $7CBF: $A7
    jr   nz, jr_006_7CD4                          ; $7CC0: $20 $12

    ldh  a, [hActiveEntityState]                  ; $7CC2: $F0 $F0
    and  $01                                      ; $7CC4: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable               ; $7CC6: $21 $B0 $C3
    add  hl, bc                                   ; $7CC9: $09
    ld   [hl], a                                  ; $7CCA: $77
    dec  a                                        ; $7CCB: $3D
    jr   nz, jr_006_7CD4                          ; $7CCC: $20 $06

    ld   hl, wEntitiesUnknowTableG                ; $7CCE: $21 $00 $C3
    add  hl, bc                                   ; $7CD1: $09
    ld   [hl], $08                                ; $7CD2: $36 $08

jr_006_7CD4:
    ldh  a, [hActiveEntityState]                  ; $7CD4: $F0 $F0
    cp   $04                                      ; $7CD6: $FE $04
    jr   z, jr_006_7CE5                           ; $7CD8: $28 $0B

    ld   hl, $C480                                ; $7CDA: $21 $80 $C4
    add  hl, bc                                   ; $7CDD: $09
    ld   a, [hl]                                  ; $7CDE: $7E
    and  a                                        ; $7CDF: $A7
    jr   nz, jr_006_7CE5                          ; $7CE0: $20 $03

    call label_3B39                               ; $7CE2: $CD $39 $3B

jr_006_7CE5:
    ldh  a, [hActiveEntityState]                  ; $7CE5: $F0 $F0
    rst  $00                                      ; $7CE7: $C7
    dec  h                                        ; $7CE8: $25
    ld   a, l                                     ; $7CE9: $7D
    ld   a, [c]                                   ; $7CEA: $F2
    ld   a, h                                     ; $7CEB: $7C
    ld   [hl], $7D                                ; $7CEC: $36 $7D
    ld   h, e                                     ; $7CEE: $63
    ld   a, l                                     ; $7CEF: $7D
    ld   [hl], b                                  ; $7CF0: $70
    ld   a, l                                     ; $7CF1: $7D
    call GetEntityTransitionCountdown             ; $7CF2: $CD $05 $0C
    jr   nz, jr_006_7D0F                          ; $7CF5: $20 $18

    ld   [hl], $10                                ; $7CF7: $36 $10
    call label_3D7F                               ; $7CF9: $CD $7F $3D
    call GetRandomByte                            ; $7CFC: $CD $0D $28
    and  $0F                                      ; $7CFF: $E6 $0F
    jr   nz, jr_006_7D0B                          ; $7D01: $20 $08

    call GetEntityTransitionCountdown             ; $7D03: $CD $05 $0C
    ld   [hl], $50                                ; $7D06: $36 $50
    jp   IncrementEntityWalkingAttr               ; $7D08: $C3 $12 $3B

jr_006_7D0B:
    call IncrementEntityWalkingAttr               ; $7D0B: $CD $12 $3B
    ld   [hl], b                                  ; $7D0E: $70

func_006_7D0F:
label_006_7D0F:
jr_006_7D0F:
    call func_006_6541                            ; $7D0F: $CD $41 $65
    call IsEntityUnknownFZero                     ; $7D12: $CD $00 $0C
    ret  nz                                       ; $7D15: $C0

    ld   hl, $C410                                ; $7D16: $21 $10 $C4
    add  hl, bc                                   ; $7D19: $09
    ld   [hl], $02                                ; $7D1A: $36 $02
    call label_3B23                               ; $7D1C: $CD $23 $3B
    ld   hl, $C410                                ; $7D1F: $21 $10 $C4
    add  hl, bc                                   ; $7D22: $09
    ld   [hl], b                                  ; $7D23: $70
    ret                                           ; $7D24: $C9

    call func_006_7D0F                            ; $7D25: $CD $0F $7D
    call GetEntityTransitionCountdown             ; $7D28: $CD $05 $0C
    ret  nz                                       ; $7D2B: $C0

    ld   [hl], $07                                ; $7D2C: $36 $07
    call IncrementEntityWalkingAttr               ; $7D2E: $CD $12 $3B
    ld   a, $04                                   ; $7D31: $3E $04
    jp   label_3BAA                               ; $7D33: $C3 $AA $3B

    call GetEntityTransitionCountdown             ; $7D36: $CD $05 $0C
    jr   nz, jr_006_7D4A                          ; $7D39: $20 $0F

    call IncrementEntityWalkingAttr               ; $7D3B: $CD $12 $3B
    ld   a, $10                                   ; $7D3E: $3E $10
    call label_3BAA                               ; $7D40: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D43: $21 $20 $C3
    add  hl, bc                                   ; $7D46: $09
    ld   [hl], $20                                ; $7D47: $36 $20
    ret                                           ; $7D49: $C9

jr_006_7D4A:
    call GetEntityTransitionCountdown             ; $7D4A: $CD $05 $0C
    ld   hl, wEntitiesSpeedXTable                       ; $7D4D: $21 $40 $C2
    add  hl, bc                                   ; $7D50: $09
    and  $04                                      ; $7D51: $E6 $04
    jr   nz, jr_006_7D59                          ; $7D53: $20 $04

    ld   [hl], $08                                ; $7D55: $36 $08
    jr   jr_006_7D5B                              ; $7D57: $18 $02

jr_006_7D59:
    ld   [hl], $F8                                ; $7D59: $36 $F8

jr_006_7D5B:
    ld   hl, wEntitiesSpeedYTable                       ; $7D5B: $21 $50 $C2
    add  hl, bc                                   ; $7D5E: $09
    ld   [hl], b                                  ; $7D5F: $70
    jp   label_006_7D0F                           ; $7D60: $C3 $0F $7D

    call func_006_7D0F                            ; $7D63: $CD $0F $7D
    ldh  a, [hFFE8]                               ; $7D66: $F0 $E8
    and  a                                        ; $7D68: $A7
    jr   z, jr_006_7D6F                           ; $7D69: $28 $04

    call IncrementEntityWalkingAttr               ; $7D6B: $CD $12 $3B
    ld   [hl], b                                  ; $7D6E: $70

jr_006_7D6F:
    ret                                           ; $7D6F: $C9

    call GetEntityTransitionCountdown             ; $7D70: $CD $05 $0C
    jr   nz, jr_006_7D91                          ; $7D73: $20 $1C

    ld   hl, $C480                                ; $7D75: $21 $80 $C4
    add  hl, bc                                   ; $7D78: $09
    ld   [hl], $30                                ; $7D79: $36 $30
    ld   a, $10                                   ; $7D7B: $3E $10
    call label_3BAA                               ; $7D7D: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D80: $21 $20 $C3
    add  hl, bc                                   ; $7D83: $09
    ld   [hl], $20                                ; $7D84: $36 $20
    ld   hl, wEntitiesPosZTable                   ; $7D86: $21 $10 $C3
    add  hl, bc                                   ; $7D89: $09
    inc  [hl]                                     ; $7D8A: $34
    call IncrementEntityWalkingAttr               ; $7D8B: $CD $12 $3B
    ld   [hl], $03                                ; $7D8E: $36 $03
    ret                                           ; $7D90: $C9

jr_006_7D91:
    push af                                       ; $7D91: $F5
    rra                                           ; $7D92: $1F
    and  $07                                      ; $7D93: $E6 $07
    sub  $04                                      ; $7D95: $D6 $04
    ld   e, a                                     ; $7D97: $5F
    ldh  a, [hLinkPositionX]                      ; $7D98: $F0 $98
    sub  e                                        ; $7D9A: $93
    ld   hl, wEntitiesPosXTable                         ; $7D9B: $21 $00 $C2
    add  hl, bc                                   ; $7D9E: $09
    ld   [hl], a                                  ; $7D9F: $77
    pop  af                                       ; $7DA0: $F1
    rra                                           ; $7DA1: $1F
    rra                                           ; $7DA2: $1F
    and  $07                                      ; $7DA3: $E6 $07
    sub  $04                                      ; $7DA5: $D6 $04
    ld   e, a                                     ; $7DA7: $5F
    ldh  a, [hLinkPositionY]                      ; $7DA8: $F0 $99
    sub  e                                        ; $7DAA: $93
    ld   hl, wEntitiesPosYTable                         ; $7DAB: $21 $10 $C2
    add  hl, bc                                   ; $7DAE: $09
    ld   [hl], a                                  ; $7DAF: $77
    ldh  a, [$FFA2]                               ; $7DB0: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $7DB2: $21 $10 $C3
    add  hl, bc                                   ; $7DB5: $09
    ld   [hl], a                                  ; $7DB6: $77
    ld   a, $01                                   ; $7DB7: $3E $01
    ld   [wC117], a                               ; $7DB9: $EA $17 $C1
    call label_3B23                               ; $7DBC: $CD $23 $3B
    ldh  a, [hJoypadState]                               ; $7DBF: $F0 $CC
    and  a                                        ; $7DC1: $A7
    jr   z, jr_006_7DD3                           ; $7DC2: $28 $0F

    call func_006_7DCD                            ; $7DC4: $CD $CD $7D
    call func_006_7DCD                            ; $7DC7: $CD $CD $7D
    call func_006_7DCD                            ; $7DCA: $CD $CD $7D

func_006_7DCD:
    call GetEntityTransitionCountdown             ; $7DCD: $CD $05 $0C
    jr   z, jr_006_7DD3                           ; $7DD0: $28 $01

    dec  [hl]                                     ; $7DD2: $35

jr_006_7DD3:
    ret                                           ; $7DD3: $C9

    ld   a, h                                     ; $7DD4: $7C
    ld   bc, $217C                                ; $7DD5: $01 $7C $21
    ld   a, [hl]                                  ; $7DD8: $7E
    ld   bc, $217E                                ; $7DD9: $01 $7E $21
    ld   de, $7DD4                                ; $7DDC: $11 $D4 $7D
    call RenderAnimatedActiveEntity                               ; $7DDF: $CD $C0 $3B
    call func_006_64C6                            ; $7DE2: $CD $C6 $64
    call func_006_64F7                            ; $7DE5: $CD $F7 $64
    ld   hl, wEntitiesUnknownTableD               ; $7DE8: $21 $D0 $C2
    add  hl, bc                                   ; $7DEB: $09
    ld   a, [hl]                                  ; $7DEC: $7E
    rst  $00                                      ; $7DED: $C7
    ld   a, [c]                                   ; $7DEE: $F2
    ld   a, l                                     ; $7DEF: $7D
    inc  c                                        ; $7DF0: $0C
    ld   a, [hl]                                  ; $7DF1: $7E
    call label_BFB                                ; $7DF2: $CD $FB $0B
    jr   nz, jr_006_7E06                          ; $7DF5: $20 $0F

    call label_3B44                               ; $7DF7: $CD $44 $3B
    jr   nc, jr_006_7E06                          ; $7DFA: $30 $0A

    ld   hl, wEntitiesUnknownTableD               ; $7DFC: $21 $D0 $C2
    add  hl, bc                                   ; $7DFF: $09
    inc  [hl]                                     ; $7E00: $34
    ld   hl, $C3D0                                ; $7E01: $21 $D0 $C3
    add  hl, bc                                   ; $7E04: $09
    ld   [hl], b                                  ; $7E05: $70

jr_006_7E06:
    call label_3B70                               ; $7E06: $CD $70 $3B

label_006_7E09:
    jp   label_006_7E9D                           ; $7E09: $C3 $9D $7E

    ldh  a, [hJoypadState]                               ; $7E0C: $F0 $CC
    and  $30                                      ; $7E0E: $E6 $30
    jr   z, jr_006_7E27                           ; $7E10: $28 $15

    ld   hl, $C3D0                                ; $7E12: $21 $D0 $C3
    add  hl, bc                                   ; $7E15: $09
    inc  [hl]                                     ; $7E16: $34
    ld   a, [hl]                                  ; $7E17: $7E
    cp   $08                                      ; $7E18: $FE $08
    jr   c, jr_006_7E27                           ; $7E1A: $38 $0B

    call label_BFB                                ; $7E1C: $CD $FB $0B
    ld   [hl], $15                                ; $7E1F: $36 $15
    ld   hl, wEntitiesUnknownTableD               ; $7E21: $21 $D0 $C2
    add  hl, bc                                   ; $7E24: $09
    ld   [hl], b                                  ; $7E25: $70
    ret                                           ; $7E26: $C9

jr_006_7E27:
    ld   a, $FF                                   ; $7E27: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $7E29: $E0 $9D
    ld   hl, wEntitiesUnknownTableB               ; $7E2B: $21 $B0 $C2
    add  hl, bc                                   ; $7E2E: $09
    ld   a, [hl]                                  ; $7E2F: $7E
    and  a                                        ; $7E30: $A7
    jr   nz, jr_006_7E55                          ; $7E31: $20 $22

    ld   hl, wAButtonSlot                         ; $7E33: $21 $00 $DB
    ld   e, b                                     ; $7E36: $58

jr_006_7E37:
    ld   a, [hl]                                  ; $7E37: $7E
    cp   $04                                      ; $7E38: $FE $04
    jr   nz, jr_006_7E4E                          ; $7E3A: $20 $12

    ld   a, [wShieldLevel]                        ; $7E3C: $FA $44 $DB
    cp   $02                                      ; $7E3F: $FE $02
    jr   nc, jr_006_7E55                          ; $7E41: $30 $12

    ld   [hl], b                                  ; $7E43: $70
    ld   hl, wEntitiesUnknownTableB               ; $7E44: $21 $B0 $C2
    add  hl, bc                                   ; $7E47: $09
    ld   a, [wShieldLevel]                        ; $7E48: $FA $44 $DB
    ld   [hl], a                                  ; $7E4B: $77
    jr   jr_006_7E55                              ; $7E4C: $18 $07

jr_006_7E4E:
    inc  hl                                       ; $7E4E: $23
    inc  e                                        ; $7E4F: $1C
    ld   a, e                                     ; $7E50: $7B
    cp   $02                                      ; $7E51: $FE $02
    jr   nz, jr_006_7E37                          ; $7E53: $20 $E2

jr_006_7E55:
    ld   a, [wLinkMotionState]                    ; $7E55: $FA $1C $C1
    cp   $00                                      ; $7E58: $FE $00
    ret  nz                                       ; $7E5A: $C0

    ldh  a, [wActiveEntityPosX]                   ; $7E5B: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $7E5D: $E0 $98
    ldh  a, [$FFEF]                               ; $7E5F: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $7E61: $E0 $99
    xor  a                                        ; $7E63: $AF
    ld   [$C146], a                               ; $7E64: $EA $46 $C1
    ldh  [$FFA2], a                               ; $7E67: $E0 $A2
    call func_006_7F05                            ; $7E69: $CD $05 $7F
    jp   label_006_7F05                           ; $7E6C: $C3 $05 $7F

    ld   [hl], h                                  ; $7E6F: $74
    ld   [bc], a                                  ; $7E70: $02
    db   $76                                      ; $7E71: $76
    ld   [bc], a                                  ; $7E72: $02
    db   $76                                      ; $7E73: $76
    ld   [hl+], a                                 ; $7E74: $22
    ld   [hl], h                                  ; $7E75: $74
    ld   [hl+], a                                 ; $7E76: $22
    ld   b, h                                     ; $7E77: $44
    ld   [bc], a                                  ; $7E78: $02
    ld   b, [hl]                                  ; $7E79: $46
    ld   [bc], a                                  ; $7E7A: $02
    ld   b, [hl]                                  ; $7E7B: $46
    ld   [hl+], a                                 ; $7E7C: $22
    ld   b, h                                     ; $7E7D: $44
    ld   [hl+], a                                 ; $7E7E: $22
    nop                                           ; $7E7F: $00
    ld   [$00F8], sp                              ; $7E80: $08 $F8 $00
    ld   hl, sp+$08                               ; $7E83: $F8 $08
    ld   de, $7E6F                                ; $7E85: $11 $6F $7E
    ldh  a, [hMapId]                              ; $7E88: $F0 $F7
    cp   $07                                      ; $7E8A: $FE $07
    jr   nz, jr_006_7E91                          ; $7E8C: $20 $03

    ld   de, $7E77                                ; $7E8E: $11 $77 $7E

jr_006_7E91:
    call RenderAnimatedActiveEntity                               ; $7E91: $CD $C0 $3B
    call func_006_64C6                            ; $7E94: $CD $C6 $64
    call label_C56                                ; $7E97: $CD $56 $0C
    call label_3B39                               ; $7E9A: $CD $39 $3B

label_006_7E9D:
    call func_006_6541                            ; $7E9D: $CD $41 $65
    call label_3B23                               ; $7EA0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7EA3: $21 $A0 $C2
    add  hl, bc                                   ; $7EA6: $09
    ld   a, [hl]                                  ; $7EA7: $7E
    and  $03                                      ; $7EA8: $E6 $03
    jr   nz, jr_006_7EBB                          ; $7EAA: $20 $0F

    ld   a, [hl]                                  ; $7EAC: $7E
    and  $0C                                      ; $7EAD: $E6 $0C
    jr   z, jr_006_7EC3                           ; $7EAF: $28 $12

    ld   hl, wEntitiesSpeedYTable                       ; $7EB1: $21 $50 $C2
    add  hl, bc                                   ; $7EB4: $09
    ld   a, [hl]                                  ; $7EB5: $7E
    xor  $F0                                      ; $7EB6: $EE $F0
    ld   [hl], a                                  ; $7EB8: $77
    jr   jr_006_7EC3                              ; $7EB9: $18 $08

jr_006_7EBB:
    ld   hl, wEntitiesSpeedXTable                       ; $7EBB: $21 $40 $C2
    add  hl, bc                                   ; $7EBE: $09
    ld   a, [hl]                                  ; $7EBF: $7E
    xor  $F0                                      ; $7EC0: $EE $F0
    ld   [hl], a                                  ; $7EC2: $77

jr_006_7EC3:
    ld   hl, wEntitiesStateTable                  ; $7EC3: $21 $90 $C2
    add  hl, bc                                   ; $7EC6: $09
    ld   a, [hl]                                  ; $7EC7: $7E
    and  a                                        ; $7EC8: $A7
    jr   nz, jr_006_7ED2                          ; $7EC9: $20 $07

    call GetRandomByte                            ; $7ECB: $CD $0D $28
    and  $3F                                      ; $7ECE: $E6 $3F
    jr   nz, jr_006_7EFF                          ; $7ED0: $20 $2D

jr_006_7ED2:
    xor  a                                        ; $7ED2: $AF
    ld   hl, wEntitiesSpeedYTable                       ; $7ED3: $21 $50 $C2
    add  hl, bc                                   ; $7ED6: $09
    ld   [hl], a                                  ; $7ED7: $77
    call GetRandomByte                            ; $7ED8: $CD $0D $28
    and  $03                                      ; $7EDB: $E6 $03
    ld   e, a                                     ; $7EDD: $5F
    ld   d, b                                     ; $7EDE: $50
    ld   hl, $7E7F                                ; $7EDF: $21 $7F $7E
    add  hl, de                                   ; $7EE2: $19
    ld   a, [hl]                                  ; $7EE3: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7EE4: $21 $40 $C2
    add  hl, bc                                   ; $7EE7: $09
    ld   [hl], a                                  ; $7EE8: $77
    and  a                                        ; $7EE9: $A7
    jr   nz, jr_006_7EFF                          ; $7EEA: $20 $13

    call GetRandomByte                            ; $7EEC: $CD $0D $28
    and  $01                                      ; $7EEF: $E6 $01
    add  $04                                      ; $7EF1: $C6 $04
    ld   e, a                                     ; $7EF3: $5F
    ld   d, b                                     ; $7EF4: $50
    ld   hl, $7E7F                                ; $7EF5: $21 $7F $7E
    add  hl, de                                   ; $7EF8: $19
    ld   a, [hl]                                  ; $7EF9: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7EFA: $21 $50 $C2
    add  hl, bc                                   ; $7EFD: $09
    ld   [hl], a                                  ; $7EFE: $77

jr_006_7EFF:
    ld   hl, wEntitiesStateTable                  ; $7EFF: $21 $90 $C2
    add  hl, bc                                   ; $7F02: $09
    xor  a                                        ; $7F03: $AF
    ld   [hl], a                                  ; $7F04: $77

func_006_7F05:
label_006_7F05:
    ld   hl, $C440                                ; $7F05: $21 $40 $C4
    add  hl, bc                                   ; $7F08: $09
    ld   a, [hl]                                  ; $7F09: $7E
    inc  [hl]                                     ; $7F0A: $34
    rra                                           ; $7F0B: $1F
    rra                                           ; $7F0C: $1F
    rra                                           ; $7F0D: $1F
    rra                                           ; $7F0E: $1F
    and  $01                                      ; $7F0F: $E6 $01
    jp   SetEntitySpriteVariant                   ; $7F11: $C3 $0C $3B
