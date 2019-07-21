; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

Data_005_4000::
    ld   [hl], b                                  ; $4000: $70
    inc  bc                                       ; $4001: $03
    ld   [hl], b                                  ; $4002: $70
    inc  hl                                       ; $4003: $23
    ld   [hl], d                                  ; $4004: $72
    inc  bc                                       ; $4005: $03
    ld   [hl], d                                  ; $4006: $72
    inc  hl                                       ; $4007: $23
    ld   [hl], h                                  ; $4008: $74
    inc  bc                                       ; $4009: $03
    db   $76                                      ; $400A: $76
    inc  bc                                       ; $400B: $03
    ld   a, b                                     ; $400C: $78
    inc  bc                                       ; $400D: $03
    ld   a, d                                     ; $400E: $7A
    inc  bc                                       ; $400F: $03
    db   $76                                      ; $4010: $76
    inc  hl                                       ; $4011: $23
    ld   [hl], h                                  ; $4012: $74
    inc  hl                                       ; $4013: $23
    ld   a, d                                     ; $4014: $7A
    inc  hl                                       ; $4015: $23
    ld   a, b                                     ; $4016: $78
    inc  hl                                       ; $4017: $23
    ld   a, h                                     ; $4018: $7C
    inc  bc                                       ; $4019: $03
    ld   a, h                                     ; $401A: $7C
    inc  hl                                       ; $401B: $23
    ld   b, b                                     ; $401C: $40
    inc  bc                                       ; $401D: $03
    ld   b, b                                     ; $401E: $40
    inc  hl                                       ; $401F: $23
    ld   b, d                                     ; $4020: $42
    inc  bc                                       ; $4021: $03
    ld   b, d                                     ; $4022: $42
    inc  hl                                       ; $4023: $23
    ld   b, h                                     ; $4024: $44
    inc  bc                                       ; $4025: $03
    ld   b, [hl]                                  ; $4026: $46
    inc  bc                                       ; $4027: $03
    ld   c, b                                     ; $4028: $48
    inc  bc                                       ; $4029: $03
    ld   c, d                                     ; $402A: $4A
    inc  bc                                       ; $402B: $03
    ld   b, [hl]                                  ; $402C: $46
    inc  hl                                       ; $402D: $23
    ld   b, h                                     ; $402E: $44
    inc  hl                                       ; $402F: $23
    ld   c, d                                     ; $4030: $4A
    inc  hl                                       ; $4031: $23
    ld   c, b                                     ; $4032: $48
    inc  hl                                       ; $4033: $23
    ld   c, h                                     ; $4034: $4C
    inc  bc                                       ; $4035: $03
    ld   c, h                                     ; $4036: $4C
    inc  hl                                       ; $4037: $23
    ld   a, c                                     ; $4038: $79
    ld   [$D154], a                               ; $4039: $EA $54 $D1
    ld   a, [wIsBowWowFollowingLink]              ; $403C: $FA $56 $DB
    cp   $01                                      ; $403F: $FE $01
    jr   nz, jr_005_4054                          ; $4041: $20 $11

    ldh  a, [hMapRoom]                            ; $4043: $F0 $F6
    ld   hl, $C3E0                                ; $4045: $21 $E0 $C3
    add  hl, bc                                   ; $4048: $09
    ld   [hl], a                                  ; $4049: $77
    ld   hl, $C220                                ; $404A: $21 $20 $C2
    add  hl, bc                                   ; $404D: $09
    ld   [hl], b                                  ; $404E: $70
    ld   hl, $C230                                ; $404F: $21 $30 $C2
    add  hl, bc                                   ; $4052: $09
    ld   [hl], b                                  ; $4053: $70

jr_005_4054:
    ld   de, $401C                                ; $4054: $11 $1C $40
    ld   a, [wIsBowWowFollowingLink]              ; $4057: $FA $56 $DB
    and  a                                        ; $405A: $A7
    jr   nz, jr_005_4060                          ; $405B: $20 $03

    ld   de, $4000                                ; $405D: $11 $00 $40

jr_005_4060:
    call label_3BC0                               ; $4060: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $4063: $FA $24 $C1
    and  a                                        ; $4066: $A7
    jr   z, jr_005_407C                           ; $4067: $28 $13

    ld   a, [wIsBowWowFollowingLink]              ; $4069: $FA $56 $DB
    cp   $01                                      ; $406C: $FE $01
    jp   z, label_005_40A2                        ; $406E: $CA $A2 $40

    ld   hl, $C3E0                                ; $4071: $21 $E0 $C3
    add  hl, bc                                   ; $4074: $09
    ldh  a, [hMapRoom]                            ; $4075: $F0 $F6
    cp   [hl]                                     ; $4077: $BE
    ret  z                                        ; $4078: $C8

    jp   label_005_40A2                           ; $4079: $C3 $A2 $40

jr_005_407C:
    ld   a, [$C1A8]                               ; $407C: $FA $A8 $C1
    ld   hl, wDialogState                         ; $407F: $21 $9F $C1
    or   [hl]                                     ; $4082: $B6
    ld   hl, wInventoryAppearing                  ; $4083: $21 $4F $C1
    or   [hl]                                     ; $4086: $B6
    jp   nz, label_005_40A2                       ; $4087: $C2 $A2 $40

    ld   a, [wTransitionSequenceCounter]          ; $408A: $FA $6B $C1
    cp   $04                                      ; $408D: $FE $04
    ret  nz                                       ; $408F: $C0

    call func_005_44CB                            ; $4090: $CD $CB $44
    call label_C56                                ; $4093: $CD $56 $0C
    ld   a, [wIsBowWowFollowingLink]              ; $4096: $FA $56 $DB
    and  a                                        ; $4099: $A7
    jr   nz, jr_005_409F                          ; $409A: $20 $03

    call label_3B70                               ; $409C: $CD $70 $3B

jr_005_409F:
    call func_005_40A5                            ; $409F: $CD $A5 $40

label_005_40A2:
    jp   label_005_4253                           ; $40A2: $C3 $53 $42

func_005_40A5:
    ld   hl, $C440                                ; $40A5: $21 $40 $C4
    add  hl, bc                                   ; $40A8: $09
    ld   a, [hl]                                  ; $40A9: $7E
    rst  $00                                      ; $40AA: $C7
    xor  a                                        ; $40AB: $AF
    ld   b, b                                     ; $40AC: $40
    and  $40                                      ; $40AD: $E6 $40
    ld   hl, wEntity0PosX                         ; $40AF: $21 $00 $C2
    add  hl, bc                                   ; $40B2: $09
    ld   a, [hl]                                  ; $40B3: $7E
    add  $04                                      ; $40B4: $C6 $04
    ld   [hl], a                                  ; $40B6: $77
    ld   hl, wEntitiesUnknownTableB               ; $40B7: $21 $B0 $C2
    add  hl, bc                                   ; $40BA: $09
    ld   [hl], a                                  ; $40BB: $77
    ld   e, $10                                   ; $40BC: $1E $10
    ld   hl, $D100                                ; $40BE: $21 $00 $D1

jr_005_40C1:
    ld   [hl+], a                                 ; $40C1: $22
    dec  e                                        ; $40C2: $1D
    jr   nz, jr_005_40C1                          ; $40C3: $20 $FC

    ld   hl, wEntity0PosY                         ; $40C5: $21 $10 $C2
    add  hl, bc                                   ; $40C8: $09
    ld   a, [hl]                                  ; $40C9: $7E
    add  $08                                      ; $40CA: $C6 $08
    ld   [hl], a                                  ; $40CC: $77
    ld   hl, wEntitiesUnknownTableC               ; $40CD: $21 $C0 $C2
    add  hl, bc                                   ; $40D0: $09
    ld   [hl], a                                  ; $40D1: $77
    ld   hl, $C310                                ; $40D2: $21 $10 $C3
    add  hl, bc                                   ; $40D5: $09
    sub  [hl]                                     ; $40D6: $96
    ld   e, $10                                   ; $40D7: $1E $10
    ld   hl, $D110                                ; $40D9: $21 $10 $D1

jr_005_40DC:
    ld   [hl+], a                                 ; $40DC: $22
    dec  e                                        ; $40DD: $1D
    jr   nz, jr_005_40DC                          ; $40DE: $20 $FC

    ld   hl, $C440                                ; $40E0: $21 $40 $C4
    add  hl, bc                                   ; $40E3: $09
    inc  [hl]                                     ; $40E4: $34
    ret                                           ; $40E5: $C9

    ld   a, [wIsBowWowFollowingLink]              ; $40E6: $FA $56 $DB
    and  a                                        ; $40E9: $A7
    jr   z, jr_005_4137                           ; $40EA: $28 $4B

    cp   $80                                      ; $40EC: $FE $80
    jr   z, jr_005_40FA                           ; $40EE: $28 $0A

    ldh  a, [hLinkPositionX]                      ; $40F0: $F0 $98
    ldh  [hScratchA], a                           ; $40F2: $E0 $D7
    ldh  a, [$FFB3]                               ; $40F4: $F0 $B3
    ldh  [hScratchB], a                           ; $40F6: $E0 $D8
    jr   jr_005_4129                              ; $40F8: $18 $2F

jr_005_40FA:
    ldh  a, [hLinkPositionY]                      ; $40FA: $F0 $99
    sub  $40                                      ; $40FC: $D6 $40
    add  $10                                      ; $40FE: $C6 $10
    cp   $20                                      ; $4100: $FE $20
    jr   nc, jr_005_4127                          ; $4102: $30 $23

    ldh  a, [hLinkPositionX]                      ; $4104: $F0 $98
    sub  $88                                      ; $4106: $D6 $88
    add  $10                                      ; $4108: $C6 $10
    cp   $20                                      ; $410A: $FE $20
    jr   nc, jr_005_4127                          ; $410C: $30 $19

    ld   a, [wCollisionType]                      ; $410E: $FA $33 $C1
    and  a                                        ; $4111: $A7
    jr   z, jr_005_4127                           ; $4112: $28 $13

    ld   a, $10                                   ; $4114: $3E $10
    ld   [wWorldMusicTrack], a                    ; $4116: $EA $68 $D3
    ld   a, $6C                                   ; $4119: $3E $6C
    call OpenDialogInTable1                       ; $411B: $CD $73 $23
    ld   a, $18                                   ; $411E: $3E $18
    ldh  [hWaveSfx], a                                ; $4120: $E0 $F3
    ld   a, $01                                   ; $4122: $3E $01
    ld   [wIsBowWowFollowingLink], a              ; $4124: $EA $56 $DB

jr_005_4127:
    jr   jr_005_4137                              ; $4127: $18 $0E

jr_005_4129:
    ldh  a, [hScratchA]                           ; $4129: $F0 $D7
    ld   hl, wEntitiesUnknownTableB               ; $412B: $21 $B0 $C2
    add  hl, bc                                   ; $412E: $09
    ld   [hl], a                                  ; $412F: $77
    ldh  a, [hScratchB]                           ; $4130: $F0 $D8
    ld   hl, wEntitiesUnknownTableC               ; $4132: $21 $C0 $C2
    add  hl, bc                                   ; $4135: $09
    ld   [hl], a                                  ; $4136: $77

jr_005_4137:
    ld   hl, wEntitiesUnknownTableB               ; $4137: $21 $B0 $C2
    add  hl, bc                                   ; $413A: $09
    ld   a, [hl]                                  ; $413B: $7E
    ld   [$D150], a                               ; $413C: $EA $50 $D1
    ld   hl, wEntitiesUnknownTableC               ; $413F: $21 $C0 $C2
    add  hl, bc                                   ; $4142: $09
    ld   a, [hl]                                  ; $4143: $7E
    ld   [$D151], a                               ; $4144: $EA $51 $D1
    call func_005_7AEA                            ; $4147: $CD $EA $7A
    ld   hl, $C320                                ; $414A: $21 $20 $C3
    add  hl, bc                                   ; $414D: $09
    dec  [hl]                                     ; $414E: $35
    dec  [hl]                                     ; $414F: $35
    ld   e, l                                     ; $4150: $5D
    ld   d, h                                     ; $4151: $54
    ld   hl, $C310                                ; $4152: $21 $10 $C3
    add  hl, bc                                   ; $4155: $09
    ld   a, [hl]                                  ; $4156: $7E
    and  $80                                      ; $4157: $E6 $80
    ldh  [hFFE8], a                               ; $4159: $E0 $E8
    jr   z, jr_005_4160                           ; $415B: $28 $03

    xor  a                                        ; $415D: $AF
    ld   [hl], a                                  ; $415E: $77
    ld   [de], a                                  ; $415F: $12

jr_005_4160:
    call label_3B23                               ; $4160: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                ; $4163: $F0 $F0
    rst  $00                                      ; $4165: $C7
    add  b                                        ; $4166: $80
    ld   b, c                                     ; $4167: $41
    rst  $08                                      ; $4168: $CF
    ld   b, c                                     ; $4169: $41
    db   $EB                                      ; $416A: $EB
    ld   b, c                                     ; $416B: $41
    ld   c, $42                                   ; $416C: $0E $42
    db   $EB                                      ; $416E: $EB
    ld   b, c                                     ; $416F: $41
    inc  b                                        ; $4170: $04
    ld   [SwitchBank], sp                         ; $4171: $08 $0C $08
    db   $FC                                      ; $4174: $FC
    ld   hl, sp-$0C                               ; $4175: $F8 $F4
    ld   hl, sp-$0C                               ; $4177: $F8 $F4
    ld   hl, sp+$04                               ; $4179: $F8 $04
    ld   [SwitchBank], sp                         ; $417B: $08 $0C $08
    db   $FC                                      ; $417E: $FC
    ld   hl, sp-$33                               ; $417F: $F8 $CD
    dec  b                                        ; $4181: $05
    inc  c                                        ; $4182: $0C
    jr   z, jr_005_41B1                           ; $4183: $28 $2C

    call label_C00                                ; $4185: $CD $00 $0C
    jr   nz, jr_005_41B0                          ; $4188: $20 $26

    call GetRandomByte                            ; $418A: $CD $0D $28
    and  $3F                                      ; $418D: $E6 $3F
    add  $20                                      ; $418F: $C6 $20
    ld   [hl], a                                  ; $4191: $77
    call IncrementEntityWalkingAttr               ; $4192: $CD $12 $3B
    call GetRandomByte                            ; $4195: $CD $0D $28
    and  $07                                      ; $4198: $E6 $07
    ld   e, a                                     ; $419A: $5F
    ld   d, b                                     ; $419B: $50
    ld   hl, $4170                                ; $419C: $21 $70 $41
    add  hl, de                                   ; $419F: $19
    ld   a, [hl]                                  ; $41A0: $7E
    ld   hl, wEntity0SpeedX                       ; $41A1: $21 $40 $C2
    add  hl, bc                                   ; $41A4: $09
    ld   [hl], a                                  ; $41A5: $77
    ld   hl, $4178                                ; $41A6: $21 $78 $41
    add  hl, de                                   ; $41A9: $19
    ld   a, [hl]                                  ; $41AA: $7E
    ld   hl, wEntity0SpeedY                       ; $41AB: $21 $50 $C2
    add  hl, bc                                   ; $41AE: $09
    ld   [hl], a                                  ; $41AF: $77

jr_005_41B0:
    ret                                           ; $41B0: $C9

jr_005_41B1:
    call IsEntityFrameCounterZero                 ; $41B1: $CD $05 $0C
    ld   [hl], $28                                ; $41B4: $36 $28
    ld   a, [wIsBowWowFollowingLink]              ; $41B6: $FA $56 $DB
    and  a                                        ; $41B9: $A7
    jr   z, jr_005_41BF                           ; $41BA: $28 $03

    jp   label_005_4297                           ; $41BC: $C3 $97 $42

jr_005_41BF:
    ld   hl, $C320                                ; $41BF: $21 $20 $C3
    add  hl, bc                                   ; $41C2: $09
    ld   [hl], $20                                ; $41C3: $36 $20
    call IncrementEntityWalkingAttr               ; $41C5: $CD $12 $3B
    ld   [hl], $02                                ; $41C8: $36 $02
    ld   a, $20                                   ; $41CA: $3E $20
    jp   label_3BAA                               ; $41CC: $C3 $AA $3B

    call label_C00                                ; $41CF: $CD $00 $0C
    jr   nz, jr_005_41DA                          ; $41D2: $20 $06

    ld   [hl], $20                                ; $41D4: $36 $20
    call IncrementEntityWalkingAttr               ; $41D6: $CD $12 $3B
    ld   [hl], b                                  ; $41D9: $70

jr_005_41DA:
    ldh  a, [hFFE8]                               ; $41DA: $F0 $E8
    and  a                                        ; $41DC: $A7
    jr   z, jr_005_41E5                           ; $41DD: $28 $06

    ld   hl, $C320                                ; $41DF: $21 $20 $C3
    add  hl, bc                                   ; $41E2: $09
    ld   [hl], $10                                ; $41E3: $36 $10

jr_005_41E5:
    call func_005_7AB1                            ; $41E5: $CD $B1 $7A
    jp   label_005_4228                           ; $41E8: $C3 $28 $42

    call IsEntityFrameCounterZero                 ; $41EB: $CD $05 $0C
    jr   z, jr_005_41F9                           ; $41EE: $28 $09

    call func_005_7AB1                            ; $41F0: $CD $B1 $7A
    call func_005_4228                            ; $41F3: $CD $28 $42
    dec  e                                        ; $41F6: $1D
    jr   z, jr_005_4206                           ; $41F7: $28 $0D

jr_005_41F9:
    call label_3D7F                               ; $41F9: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $41FC: $CD $12 $3B
    ld   [hl], $03                                ; $41FF: $36 $03
    call IsEntityFrameCounterZero                 ; $4201: $CD $05 $0C
    ld   [hl], $10                                ; $4204: $36 $10

jr_005_4206:
    ld   a, [wIsBowWowFollowingLink]              ; $4206: $FA $56 $DB
    and  a                                        ; $4209: $A7
    ret  z                                        ; $420A: $C8

    jp   label_005_4335                           ; $420B: $C3 $35 $43

    call IsEntityFrameCounterZero                 ; $420E: $CD $05 $0C
    jr   nz, jr_005_4227                          ; $4211: $20 $14

    call GetRandomByte                            ; $4213: $CD $0D $28
    and  $3F                                      ; $4216: $E6 $3F
    add  $30                                      ; $4218: $C6 $30
    ld   [hl], a                                  ; $421A: $77
    ld   a, [wIsBowWowFollowingLink]              ; $421B: $FA $56 $DB
    and  a                                        ; $421E: $A7
    jr   z, jr_005_4223                           ; $421F: $28 $02

    ld   [hl], $10                                ; $4221: $36 $10

jr_005_4223:
    call IncrementEntityWalkingAttr               ; $4223: $CD $12 $3B
    ld   [hl], b                                  ; $4226: $70

jr_005_4227:
    ret                                           ; $4227: $C9

func_005_4228:
label_005_4228:
    ld   e, $01                                   ; $4228: $1E $01
    ld   hl, wEntitiesUnknownTableB               ; $422A: $21 $B0 $C2
    add  hl, bc                                   ; $422D: $09
    ld   a, [hl]                                  ; $422E: $7E
    ld   hl, wEntity0PosX                         ; $422F: $21 $00 $C2
    add  hl, bc                                   ; $4232: $09
    sub  [hl]                                     ; $4233: $96
    add  $20                                      ; $4234: $C6 $20
    cp   $40                                      ; $4236: $FE $40
    jr   c, jr_005_423E                           ; $4238: $38 $04

    ldh  a, [wActiveEntityPosX]                   ; $423A: $F0 $EE
    ld   [hl], a                                  ; $423C: $77
    inc  e                                        ; $423D: $1C

jr_005_423E:
    ld   hl, wEntitiesUnknownTableC               ; $423E: $21 $C0 $C2
    add  hl, bc                                   ; $4241: $09
    ld   a, [hl]                                  ; $4242: $7E
    ld   hl, wEntity0PosY                         ; $4243: $21 $10 $C2
    add  hl, bc                                   ; $4246: $09
    sub  [hl]                                     ; $4247: $96
    add  $20                                      ; $4248: $C6 $20
    cp   $40                                      ; $424A: $FE $40
    jr   c, jr_005_4252                           ; $424C: $38 $04

    ldh  a, [$FFEF]                               ; $424E: $F0 $EF
    ld   [hl], a                                  ; $4250: $77
    inc  e                                        ; $4251: $1C

jr_005_4252:
    ret                                           ; $4252: $C9

label_005_4253:
    call func_005_43A8                            ; $4253: $CD $A8 $43
    call func_005_43FE                            ; $4256: $CD $FE $43
    ld   a, [$C3C0]                               ; $4259: $FA $C0 $C3
    ld   e, a                                     ; $425C: $5F
    ld   d, $00                                   ; $425D: $16 $00
    ld   hl, $C030                                ; $425F: $21 $30 $C0
    add  hl, de                                   ; $4262: $19
    ld   e, l                                     ; $4263: $5D
    ld   d, h                                     ; $4264: $54
    push bc                                       ; $4265: $C5
    ld   c, $05                                   ; $4266: $0E $05

jr_005_4268:
    ldh  a, [hFrameCounter]                       ; $4268: $F0 $E7
    xor  c                                        ; $426A: $A9
    rra                                           ; $426B: $1F
    jr   c, jr_005_428E                           ; $426C: $38 $20

    ld   hl, $D110                                ; $426E: $21 $10 $D1
    add  hl, bc                                   ; $4271: $09
    ld   a, [hl]                                  ; $4272: $7E
    ld   [de], a                                  ; $4273: $12
    inc  de                                       ; $4274: $13
    ld   hl, $D100                                ; $4275: $21 $00 $D1
    add  hl, bc                                   ; $4278: $09
    ld   a, [hl]                                  ; $4279: $7E
    add  $04                                      ; $427A: $C6 $04
    ld   [de], a                                  ; $427C: $12
    inc  de                                       ; $427D: $13
    ld   a, [wIsBowWowFollowingLink]              ; $427E: $FA $56 $DB
    and  a                                        ; $4281: $A7
    ld   a, $4E                                   ; $4282: $3E $4E
    jr   nz, jr_005_4288                          ; $4284: $20 $02

    ld   a, $7E                                   ; $4286: $3E $7E

jr_005_4288:
    ld   [de], a                                  ; $4288: $12
    inc  de                                       ; $4289: $13
    ld   a, $00                                   ; $428A: $3E $00
    ld   [de], a                                  ; $428C: $12
    inc  de                                       ; $428D: $13

jr_005_428E:
    dec  c                                        ; $428E: $0D
    jr   nz, jr_005_4268                          ; $428F: $20 $D7

    pop  bc                                       ; $4291: $C1
    ld   a, $03                                   ; $4292: $3E $03
    jp   label_3DA0                               ; $4294: $C3 $A0 $3D

label_005_4297:
    ld   a, [wIsBowWowFollowingLink]              ; $4297: $FA $56 $DB
    cp   $80                                      ; $429A: $FE $80
    jp   z, label_005_432F                        ; $429C: $CA $2F $43

    call GetRandomByte                            ; $429F: $CD $0D $28
    ld   d, b                                     ; $42A2: $50
    and  $01                                      ; $42A3: $E6 $01
    jr   nz, jr_005_42AF                          ; $42A5: $20 $08

    ld   e, $0F                                   ; $42A7: $1E $0F
    ld   a, $FF                                   ; $42A9: $3E $FF
    ldh  [hScratchA], a                           ; $42AB: $E0 $D7
    jr   jr_005_42B7                              ; $42AD: $18 $08

jr_005_42AF:
    ld   e, $00                                   ; $42AF: $1E $00
    ld   a, $01                                   ; $42B1: $3E $01
    ldh  [hScratchA], a                           ; $42B3: $E0 $D7
    ld   a, $10                                   ; $42B5: $3E $10

jr_005_42B7:
    ldh  [hScratchB], a                           ; $42B7: $E0 $D8

jr_005_42B9:
    ld   a, e                                     ; $42B9: $7B
    cp   c                                        ; $42BA: $B9
    jr   z, jr_005_4323                           ; $42BB: $28 $66

    ld   hl, wEntity0Type                         ; $42BD: $21 $80 $C2
    add  hl, de                                   ; $42C0: $19
    ld   a, [hl]                                  ; $42C1: $7E
    and  a                                        ; $42C2: $A7
    jr   z, jr_005_4323                           ; $42C3: $28 $5E

    cp   $01                                      ; $42C5: $FE $01
    jr   z, jr_005_4323                           ; $42C7: $28 $5A

    ld   hl, wEntitiesUnknownTableG               ; $42C9: $21 $B0 $C3
    add  hl, de                                   ; $42CC: $19
    ld   a, [hl]                                  ; $42CD: $7E
    dec  a                                        ; $42CE: $3D
    jr   z, jr_005_4323                           ; $42CF: $28 $52

    push de                                       ; $42D1: $D5
    ld   hl, $C3A0                                ; $42D2: $21 $A0 $C3
    add  hl, de                                   ; $42D5: $19
    ld   e, [hl]                                  ; $42D6: $5E
    call label_3925                               ; $42D7: $CD $25 $39
    pop  de                                       ; $42DA: $D1
    and  a                                        ; $42DB: $A7
    jr   z, jr_005_4323                           ; $42DC: $28 $45

    ld   hl, wEntity0PosX                         ; $42DE: $21 $00 $C2
    add  hl, de                                   ; $42E1: $19
    ldh  a, [hLinkPositionX]                      ; $42E2: $F0 $98
    sub  [hl]                                     ; $42E4: $96
    add  $2F                                      ; $42E5: $C6 $2F
    cp   $5E                                      ; $42E7: $FE $5E
    jr   nc, jr_005_4323                          ; $42E9: $30 $38

    ld   hl, wEntity0PosY                         ; $42EB: $21 $10 $C2
    add  hl, de                                   ; $42EE: $19
    ldh  a, [hLinkPositionY]                      ; $42EF: $F0 $99
    sub  [hl]                                     ; $42F1: $96
    add  $2F                                      ; $42F2: $C6 $2F
    cp   $5E                                      ; $42F4: $FE $5E
    jr   nc, jr_005_4323                          ; $42F6: $30 $2B

    ld   a, e                                     ; $42F8: $7B
    ld   [$D152], a                               ; $42F9: $EA $52 $D1
    ldh  a, [hLinkPositionY]                      ; $42FC: $F0 $99
    push af                                       ; $42FE: $F5
    ldh  a, [hLinkPositionX]                      ; $42FF: $F0 $98
    push af                                       ; $4301: $F5
    ld   a, [hl]                                  ; $4302: $7E
    ldh  [hLinkPositionY], a                      ; $4303: $E0 $99
    ld   hl, wEntity0PosX                         ; $4305: $21 $00 $C2
    add  hl, de                                   ; $4308: $19
    ld   a, [hl]                                  ; $4309: $7E
    ldh  [hLinkPositionX], a                      ; $430A: $E0 $98
    ld   a, $30                                   ; $430C: $3E $30
    call label_3BAA                               ; $430E: $CD $AA $3B
    pop  af                                       ; $4311: $F1
    ldh  [hLinkPositionX], a                      ; $4312: $E0 $98
    pop  af                                       ; $4314: $F1
    ldh  [hLinkPositionY], a                      ; $4315: $E0 $99
    ld   hl, $C320                                ; $4317: $21 $20 $C3
    add  hl, bc                                   ; $431A: $09
    ld   [hl], $10                                ; $431B: $36 $10
    call IncrementEntityWalkingAttr               ; $431D: $CD $12 $3B
    ld   [hl], $04                                ; $4320: $36 $04
    ret                                           ; $4322: $C9

jr_005_4323:
    ld   hl, hScratchA                            ; $4323: $21 $D7 $FF
    ld   a, e                                     ; $4326: $7B
    add  [hl]                                     ; $4327: $86
    ld   e, a                                     ; $4328: $5F
    ld   hl, hScratchB                            ; $4329: $21 $D8 $FF
    cp   [hl]                                     ; $432C: $BE
    jr   nz, jr_005_42B9                          ; $432D: $20 $8A

label_005_432F:
    call IsEntityFrameCounterZero                 ; $432F: $CD $05 $0C
    ld   [hl], $10                                ; $4332: $36 $10
    ret                                           ; $4334: $C9

label_005_4335:
    ld   a, [$D152]                               ; $4335: $FA $52 $D1
    ld   e, a                                     ; $4338: $5F
    ld   d, b                                     ; $4339: $50
    ld   hl, wEntity0Type                         ; $433A: $21 $80 $C2
    add  hl, de                                   ; $433D: $19
    ld   a, [hl]                                  ; $433E: $7E
    and  a                                        ; $433F: $A7
    ret  z                                        ; $4340: $C8

    ld   hl, wEntity0PosX                         ; $4341: $21 $00 $C2
    add  hl, de                                   ; $4344: $19
    ldh  a, [wActiveEntityPosX]                   ; $4345: $F0 $EE
    sub  [hl]                                     ; $4347: $96
    add  $0E                                      ; $4348: $C6 $0E
    cp   $1A                                      ; $434A: $FE $1A
    ret  nc                                       ; $434C: $D0

    ld   hl, wEntity0PosY                         ; $434D: $21 $10 $C2
    add  hl, de                                   ; $4350: $19
    ldh  a, [wActiveEntityPosY]                   ; $4351: $F0 $EC
    sub  [hl]                                     ; $4353: $96
    add  $10                                      ; $4354: $C6 $10
    cp   $20                                      ; $4356: $FE $20
    ret  nc                                       ; $4358: $D0

    ld   hl, $C3A0                                ; $4359: $21 $A0 $C3
    add  hl, de                                   ; $435C: $19
    ld   a, [hl]                                  ; $435D: $7E
    cp   $3D                                      ; $435E: $FE $3D
    jr   nz, jr_005_4380                          ; $4360: $20 $1E

    ld   hl, $C440                                ; $4362: $21 $40 $C4
    add  hl, de                                   ; $4365: $19
    ld   a, [hl]                                  ; $4366: $7E
    and  a                                        ; $4367: $A7
    ret  z                                        ; $4368: $C8

    ld   a, [wDialogState]                        ; $4369: $FA $9F $C1
    and  a                                        ; $436C: $A7
    ret  nz                                       ; $436D: $C0

    call IsEntityFrameCounterZero                 ; $436E: $CD $05 $0C
    ld   [hl], b                                  ; $4371: $70
    ld   hl, $C300                                ; $4372: $21 $00 $C3
    add  hl, bc                                   ; $4375: $09
    ld   a, [hl]                                  ; $4376: $7E
    and  a                                        ; $4377: $A7
    ret  nz                                       ; $4378: $C0

    ld   [hl], $80                                ; $4379: $36 $80
    ld   a, $15                                   ; $437B: $3E $15
    jp   OpenDialogInTable1                       ; $437D: $C3 $73 $23

jr_005_4380:
    ld   hl, $C420                                ; $4380: $21 $20 $C4
    add  hl, de                                   ; $4383: $19
    ld   a, [hl]                                  ; $4384: $7E
    and  a                                        ; $4385: $A7
    ret  nz                                       ; $4386: $C0

    ld   a, $03                                   ; $4387: $3E $03
    ldh  [hJingle], a                             ; $4389: $E0 $F2
    ld   hl, $C3A0                                ; $438B: $21 $A0 $C3
    add  hl, de                                   ; $438E: $19
    ld   a, [hl]                                  ; $438F: $7E
    cp   $AD                                      ; $4390: $FE $AD
    jr   nz, jr_005_43A0                          ; $4392: $20 $0C

    ld   hl, $C420                                ; $4394: $21 $20 $C4
    add  hl, de                                   ; $4397: $19
    ld   [hl], $18                                ; $4398: $36 $18
    ld   hl, $C3D0                                ; $439A: $21 $D0 $C3
    add  hl, de                                   ; $439D: $19
    inc  [hl]                                     ; $439E: $34
    ret                                           ; $439F: $C9

jr_005_43A0:
    push bc                                       ; $43A0: $C5
    ld   c, e                                     ; $43A1: $4B
    ld   b, d                                     ; $43A2: $42
    call label_3F50                               ; $43A3: $CD $50 $3F
    pop  bc                                       ; $43A6: $C1
    ret                                           ; $43A7: $C9

func_005_43A8:
    ld   hl, wEntity0PosX                         ; $43A8: $21 $00 $C2
    add  hl, bc                                   ; $43AB: $09
    ld   a, [hl]                                  ; $43AC: $7E
    ld   [$D100], a                               ; $43AD: $EA $00 $D1
    ld   hl, wEntity0PosY                         ; $43B0: $21 $10 $C2
    add  hl, bc                                   ; $43B3: $09
    ld   a, [hl]                                  ; $43B4: $7E
    ld   hl, $C310                                ; $43B5: $21 $10 $C3
    add  hl, bc                                   ; $43B8: $09
    sub  [hl]                                     ; $43B9: $96
    ld   [$D110], a                               ; $43BA: $EA $10 $D1
    ld   de, $D100                                ; $43BD: $11 $00 $D1
    ld   hl, $D101                                ; $43C0: $21 $01 $D1
    push bc                                       ; $43C3: $C5
    ld   c, $05                                   ; $43C4: $0E $05

jr_005_43C6:
    ld   a, [de]                                  ; $43C6: $1A
    sub  [hl]                                     ; $43C7: $96
    add  $07                                      ; $43C8: $C6 $07
    cp   $0E                                      ; $43CA: $FE $0E
    jr   c, jr_005_43D8                           ; $43CC: $38 $0A

    bit  7, a                                     ; $43CE: $CB $7F
    jr   nz, jr_005_43D6                          ; $43D0: $20 $04

    inc  [hl]                                     ; $43D2: $34
    inc  [hl]                                     ; $43D3: $34
    inc  [hl]                                     ; $43D4: $34
    inc  [hl]                                     ; $43D5: $34

jr_005_43D6:
    dec  [hl]                                     ; $43D6: $35
    dec  [hl]                                     ; $43D7: $35

jr_005_43D8:
    inc  hl                                       ; $43D8: $23
    inc  de                                       ; $43D9: $13
    dec  c                                        ; $43DA: $0D
    jr   nz, jr_005_43C6                          ; $43DB: $20 $E9

    ld   de, $D110                                ; $43DD: $11 $10 $D1
    ld   hl, $D111                                ; $43E0: $21 $11 $D1
    ld   c, $05                                   ; $43E3: $0E $05

jr_005_43E5:
    ld   a, [de]                                  ; $43E5: $1A
    sub  [hl]                                     ; $43E6: $96
    add  $07                                      ; $43E7: $C6 $07
    cp   $0E                                      ; $43E9: $FE $0E
    jr   c, jr_005_43F7                           ; $43EB: $38 $0A

    bit  7, a                                     ; $43ED: $CB $7F
    jr   nz, jr_005_43F5                          ; $43EF: $20 $04

    inc  [hl]                                     ; $43F1: $34
    inc  [hl]                                     ; $43F2: $34
    inc  [hl]                                     ; $43F3: $34
    inc  [hl]                                     ; $43F4: $34

jr_005_43F5:
    dec  [hl]                                     ; $43F5: $35
    dec  [hl]                                     ; $43F6: $35

jr_005_43F7:
    inc  hl                                       ; $43F7: $23
    inc  de                                       ; $43F8: $13
    dec  c                                        ; $43F9: $0D
    jr   nz, jr_005_43E5                          ; $43FA: $20 $E9

    pop  bc                                       ; $43FC: $C1
    ret                                           ; $43FD: $C9

func_005_43FE:
    ld   a, [wIsBowWowFollowingLink]              ; $43FE: $FA $56 $DB
    and  a                                        ; $4401: $A7
    ret  z                                        ; $4402: $C8

    cp   $80                                      ; $4403: $FE $80
    ret  z                                        ; $4405: $C8

    ldh  a, [hLinkPositionYIncrement]             ; $4406: $F0 $9B
    ld   hl, hLinkPositionXIncrement              ; $4408: $21 $9A $FF
    or   [hl]                                     ; $440B: $B6
    ld   hl, $FFA3                                ; $440C: $21 $A3 $FF
    or   [hl]                                     ; $440F: $B6
    jp   z, label_005_44CA                        ; $4410: $CA $CA $44

    ld   hl, wEntitiesUnknownTableB               ; $4413: $21 $B0 $C2
    add  hl, bc                                   ; $4416: $09
    ld   a, [hl]                                  ; $4417: $7E
    ld   [$D106], a                               ; $4418: $EA $06 $D1
    ld   hl, wEntitiesUnknownTableC               ; $441B: $21 $C0 $C2
    add  hl, bc                                   ; $441E: $09
    ld   a, [hl]                                  ; $441F: $7E
    ld   [$D116], a                               ; $4420: $EA $16 $D1
    ld   de, $D106                                ; $4423: $11 $06 $D1
    ld   hl, $D105                                ; $4426: $21 $05 $D1
    push bc                                       ; $4429: $C5
    ld   bc, $0006                                ; $442A: $01 $06 $00

jr_005_442D:
    ld   a, [de]                                  ; $442D: $1A
    sub  [hl]                                     ; $442E: $96
    add  $07                                      ; $442F: $C6 $07
    cp   $0E                                      ; $4431: $FE $0E
    jr   c, jr_005_4448                           ; $4433: $38 $13

    bit  7, a                                     ; $4435: $CB $7F
    jr   nz, jr_005_443F                          ; $4437: $20 $06

    inc  [hl]                                     ; $4439: $34
    inc  [hl]                                     ; $443A: $34
    inc  [hl]                                     ; $443B: $34
    inc  [hl]                                     ; $443C: $34
    inc  [hl]                                     ; $443D: $34
    inc  [hl]                                     ; $443E: $34

jr_005_443F:
    dec  [hl]                                     ; $443F: $35
    dec  [hl]                                     ; $4440: $35
    dec  [hl]                                     ; $4441: $35
    ld   a, c                                     ; $4442: $79
    cp   $01                                      ; $4443: $FE $01
    jr   nz, jr_005_4448                          ; $4445: $20 $01

    inc  b                                        ; $4447: $04

jr_005_4448:
    dec  hl                                       ; $4448: $2B
    dec  de                                       ; $4449: $1B
    dec  c                                        ; $444A: $0D
    jr   nz, jr_005_442D                          ; $444B: $20 $E0

    ld   de, $D116                                ; $444D: $11 $16 $D1
    ld   hl, $D115                                ; $4450: $21 $15 $D1
    ld   c, $06                                   ; $4453: $0E $06

jr_005_4455:
    ld   a, [de]                                  ; $4455: $1A
    sub  [hl]                                     ; $4456: $96
    add  $07                                      ; $4457: $C6 $07
    cp   $0E                                      ; $4459: $FE $0E
    jr   c, jr_005_4473                           ; $445B: $38 $16

    bit  7, a                                     ; $445D: $CB $7F
    jr   nz, jr_005_4467                          ; $445F: $20 $06

    inc  [hl]                                     ; $4461: $34
    inc  [hl]                                     ; $4462: $34
    inc  [hl]                                     ; $4463: $34
    inc  [hl]                                     ; $4464: $34
    inc  [hl]                                     ; $4465: $34
    inc  [hl]                                     ; $4466: $34

jr_005_4467:
    dec  [hl]                                     ; $4467: $35
    dec  [hl]                                     ; $4468: $35
    dec  [hl]                                     ; $4469: $35
    ld   a, c                                     ; $446A: $79
    cp   $01                                      ; $446B: $FE $01
    jr   nz, jr_005_4473                          ; $446D: $20 $04

    ld   a, b                                     ; $446F: $78
    or   $02                                      ; $4470: $F6 $02
    ld   b, a                                     ; $4472: $47

jr_005_4473:
    dec  hl                                       ; $4473: $2B
    dec  de                                       ; $4474: $1B
    dec  c                                        ; $4475: $0D
    jr   nz, jr_005_4455                          ; $4476: $20 $DD

    ld   a, b                                     ; $4478: $78
    ldh  [hScratchA], a                           ; $4479: $E0 $D7
    pop  bc                                       ; $447B: $C1
    and  $01                                      ; $447C: $E6 $01
    jr   z, jr_005_4499                           ; $447E: $28 $19

    ld   hl, $D110                                ; $4480: $21 $10 $D1
    ld   e, $06                                   ; $4483: $1E $06

jr_005_4485:
    ld   a, [$D151]                               ; $4485: $FA $51 $D1
    sub  [hl]                                     ; $4488: $96
    jr   z, jr_005_4492                           ; $4489: $28 $07

    bit  7, a                                     ; $448B: $CB $7F
    jr   nz, jr_005_4491                          ; $448D: $20 $02

    inc  [hl]                                     ; $448F: $34
    inc  [hl]                                     ; $4490: $34

jr_005_4491:
    dec  [hl]                                     ; $4491: $35

jr_005_4492:
    inc  hl                                       ; $4492: $23
    dec  e                                        ; $4493: $1D
    jr   nz, jr_005_4485                          ; $4494: $20 $EF

    call func_005_44B5                            ; $4496: $CD $B5 $44

jr_005_4499:
    ldh  a, [hScratchA]                           ; $4499: $F0 $D7
    and  $02                                      ; $449B: $E6 $02
    jr   z, jr_005_44CA                           ; $449D: $28 $2B

    ld   hl, $D100                                ; $449F: $21 $00 $D1
    ld   e, $06                                   ; $44A2: $1E $06

jr_005_44A4:
    ld   a, [$D150]                               ; $44A4: $FA $50 $D1
    sub  [hl]                                     ; $44A7: $96
    jr   z, jr_005_44B1                           ; $44A8: $28 $07

    bit  7, a                                     ; $44AA: $CB $7F
    jr   nz, jr_005_44B0                          ; $44AC: $20 $02

    inc  [hl]                                     ; $44AE: $34
    inc  [hl]                                     ; $44AF: $34

jr_005_44B0:
    dec  [hl]                                     ; $44B0: $35

jr_005_44B1:
    inc  hl                                       ; $44B1: $23
    dec  e                                        ; $44B2: $1D
    jr   nz, jr_005_44A4                          ; $44B3: $20 $EF

func_005_44B5:
    ld   a, [$D110]                               ; $44B5: $FA $10 $D1
    ld   hl, $C310                                ; $44B8: $21 $10 $C3
    add  hl, bc                                   ; $44BB: $09
    add  [hl]                                     ; $44BC: $86
    ld   hl, wEntity0PosY                         ; $44BD: $21 $10 $C2
    add  hl, bc                                   ; $44C0: $09
    ld   [hl], a                                  ; $44C1: $77
    ld   a, [$D100]                               ; $44C2: $FA $00 $D1
    ld   hl, wEntity0PosX                         ; $44C5: $21 $00 $C2
    add  hl, bc                                   ; $44C8: $09
    ld   [hl], a                                  ; $44C9: $77

label_005_44CA:
jr_005_44CA:
    ret                                           ; $44CA: $C9

func_005_44CB:
    ld   hl, wEntity0SpeedX                       ; $44CB: $21 $40 $C2
    add  hl, bc                                   ; $44CE: $09
    ld   a, [hl]                                  ; $44CF: $7E
    ld   hl, wEntity0SpeedY                       ; $44D0: $21 $50 $C2
    add  hl, bc                                   ; $44D3: $09
    or   [hl]                                     ; $44D4: $B6
    ret  z                                        ; $44D5: $C8

    ld   hl, wEntity0SpeedX                       ; $44D6: $21 $40 $C2
    add  hl, bc                                   ; $44D9: $09
    ld   a, [hl]                                  ; $44DA: $7E
    ld   d, a                                     ; $44DB: $57
    bit  7, a                                     ; $44DC: $CB $7F
    jr   z, jr_005_44E2                           ; $44DE: $28 $02

    cpl                                           ; $44E0: $2F
    inc  a                                        ; $44E1: $3C

jr_005_44E2:
    ld   e, a                                     ; $44E2: $5F
    ld   hl, wEntity0SpeedY                       ; $44E3: $21 $50 $C2
    add  hl, bc                                   ; $44E6: $09
    ld   a, [hl]                                  ; $44E7: $7E
    bit  7, a                                     ; $44E8: $CB $7F
    jr   z, jr_005_44EE                           ; $44EA: $28 $02

    cpl                                           ; $44EC: $2F
    inc  a                                        ; $44ED: $3C

jr_005_44EE:
    cp   e                                        ; $44EE: $BB
    jr   nc, jr_005_44FE                          ; $44EF: $30 $0D

    bit  7, d                                     ; $44F1: $CB $7A
    jr   nz, jr_005_44F9                          ; $44F3: $20 $04

    ld   e, $04                                   ; $44F5: $1E $04
    jr   jr_005_4509                              ; $44F7: $18 $10

jr_005_44F9:
    ld   e, $02                                   ; $44F9: $1E $02
    jp   label_005_4509                           ; $44FB: $C3 $09 $45

jr_005_44FE:
    bit  7, [hl]                                  ; $44FE: $CB $7E
    jr   z, jr_005_4507                           ; $4500: $28 $05

    ld   a, $06                                   ; $4502: $3E $06
    jp   label_3B0C                               ; $4504: $C3 $0C $3B

jr_005_4507:
    ld   e, $00                                   ; $4507: $1E $00

label_005_4509:
jr_005_4509:
    ldh  a, [hFrameCounter]                       ; $4509: $F0 $E7
    rra                                           ; $450B: $1F
    rra                                           ; $450C: $1F
    rra                                           ; $450D: $1F
    and  $01                                      ; $450E: $E6 $01
    add  e                                        ; $4510: $83
    jp   label_3B0C                               ; $4511: $C3 $0C $3B

    ld   d, b                                     ; $4514: $50
    ld   bc, $0152                                ; $4515: $01 $52 $01
    ld   d, h                                     ; $4518: $54
    ld   bc, $0156                                ; $4519: $01 $56 $01
    ld   d, d                                     ; $451C: $52
    ld   hl, $2150                                ; $451D: $21 $50 $21
    ld   d, [hl]                                  ; $4520: $56
    ld   hl, $2154                                ; $4521: $21 $54 $21
    ld   hl, $C360                                ; $4524: $21 $60 $C3
    add  hl, bc                                   ; $4527: $09
    ld   [hl], $4C                                ; $4528: $36 $4C
    ld   hl, $C380                                ; $452A: $21 $80 $C3
    add  hl, bc                                   ; $452D: $09
    ld   a, [hl]                                  ; $452E: $7E
    and  a                                        ; $452F: $A7
    jr   nz, jr_005_4538                          ; $4530: $20 $06

    ldh  a, [hActiveEntityUnknownG]               ; $4532: $F0 $F1
    add  $02                                      ; $4534: $C6 $02
    ldh  [hActiveEntityUnknownG], a               ; $4536: $E0 $F1

jr_005_4538:
    ld   de, $4514                                ; $4538: $11 $14 $45
    call label_3BC0                               ; $453B: $CD $C0 $3B
    ldh  a, [hActiveEntityType]                   ; $453E: $F0 $EA
    cp   $07                                      ; $4540: $FE $07
    jr   nz, jr_005_4557                          ; $4542: $20 $13

    ldh  a, [hFrameCounter]                       ; $4544: $F0 $E7
    and  $1F                                      ; $4546: $E6 $1F
    jr   nz, jr_005_454E                          ; $4548: $20 $04

    ld   a, $13                                   ; $454A: $3E $13
    ldh  [hWaveSfx], a                                ; $454C: $E0 $F3

jr_005_454E:
    ldh  a, [hFrameCounter]                       ; $454E: $F0 $E7
    rra                                           ; $4550: $1F
    rra                                           ; $4551: $1F
    and  $01                                      ; $4552: $E6 $01
    jp   label_3B0C                               ; $4554: $C3 $0C $3B

jr_005_4557:
    call func_005_7A3A                            ; $4557: $CD $3A $7A
    call label_3B70                               ; $455A: $CD $70 $3B
    call label_C56                                ; $455D: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $4560: $F0 $F0
    cp   $03                                      ; $4562: $FE $03
    jr   z, jr_005_4580                           ; $4564: $28 $1A

    call func_005_7AEA                            ; $4566: $CD $EA $7A
    ld   hl, $C320                                ; $4569: $21 $20 $C3
    add  hl, bc                                   ; $456C: $09
    dec  [hl]                                     ; $456D: $35
    ld   hl, $C310                                ; $456E: $21 $10 $C3
    add  hl, bc                                   ; $4571: $09
    ld   a, [hl]                                  ; $4572: $7E
    and  $80                                      ; $4573: $E6 $80
    ldh  [hFFE8], a                               ; $4575: $E0 $E8
    jr   z, jr_005_4580                           ; $4577: $28 $07

    xor  a                                        ; $4579: $AF
    ld   [hl], a                                  ; $457A: $77
    ld   hl, $C320                                ; $457B: $21 $20 $C3
    add  hl, bc                                   ; $457E: $09
    ld   [hl], a                                  ; $457F: $77

jr_005_4580:
    ld   hl, $C420                                ; $4580: $21 $20 $C4
    add  hl, bc                                   ; $4583: $09
    ld   a, [hl]                                  ; $4584: $7E
    and  a                                        ; $4585: $A7
    jr   z, jr_005_45BF                           ; $4586: $28 $37

    cp   $08                                      ; $4588: $FE $08
    jr   nz, jr_005_45B7                          ; $458A: $20 $2B

    ld   a, [wIsMarinFollowingLink]               ; $458C: $FA $73 $DB
    and  a                                        ; $458F: $A7
    jr   z, jr_005_45AD                           ; $4590: $28 $1B

    dec  [hl]                                     ; $4592: $35
    ld   a, [wTransitionSequenceCounter]          ; $4593: $FA $6B $C1
    cp   $04                                      ; $4596: $FE $04
    jr   nz, jr_005_45AD                          ; $4598: $20 $13

    call GetRandomByte                            ; $459A: $CD $0D $28
    and  $3F                                      ; $459D: $E6 $3F
    jr   nz, jr_005_45A8                          ; $459F: $20 $07

    ld   a, $76                                   ; $45A1: $3E $76
    call OpenDialogInTable2                       ; $45A3: $CD $7C $23
    jr   jr_005_45AD                              ; $45A6: $18 $05

jr_005_45A8:
    ld   a, $8F                                   ; $45A8: $3E $8F
    call OpenDialog                               ; $45AA: $CD $85 $23

jr_005_45AD:
    ld   hl, wEntitiesUnknownTableB               ; $45AD: $21 $B0 $C2
    add  hl, bc                                   ; $45B0: $09
    ld   a, [hl]                                  ; $45B1: $7E
    cp   $23                                      ; $45B2: $FE $23
    jr   z, jr_005_45B7                           ; $45B4: $28 $01

    inc  [hl]                                     ; $45B6: $34

jr_005_45B7:
    call IncrementEntityWalkingAttr               ; $45B7: $CD $12 $3B
    ld   a, $02                                   ; $45BA: $3E $02
    ld   [hl], a                                  ; $45BC: $77
    ldh  [hActiveEntityWalking], a                ; $45BD: $E0 $F0

jr_005_45BF:
    call label_3B5A                               ; $45BF: $CD $5A $3B
    jr   nc, jr_005_4611                          ; $45C2: $30 $4D

    ldh  a, [hActiveEntityWalking]                ; $45C4: $F0 $F0
    cp   $03                                      ; $45C6: $FE $03
    jr   z, jr_005_4611                           ; $45C8: $28 $47

    ld   a, [$C19B]                               ; $45CA: $FA $9B $C1
    and  a                                        ; $45CD: $A7
    jr   nz, jr_005_4611                          ; $45CE: $20 $41

    ld   a, [wAButtonSlot]                        ; $45D0: $FA $00 $DB
    cp   $03                                      ; $45D3: $FE $03
    jr   nz, jr_005_45DF                          ; $45D5: $20 $08

    ldh  a, [hFFCC]                               ; $45D7: $F0 $CC
    and  $20                                      ; $45D9: $E6 $20
    jr   nz, jr_005_45EC                          ; $45DB: $20 $0F

    jr   jr_005_4611                              ; $45DD: $18 $32

jr_005_45DF:
    ld   a, [wBButtonSlot]                        ; $45DF: $FA $01 $DB
    cp   $03                                      ; $45E2: $FE $03
    jr   nz, jr_005_4611                          ; $45E4: $20 $2B

    ldh  a, [hFFCC]                               ; $45E6: $F0 $CC
    and  $10                                      ; $45E8: $E6 $10
    jr   z, jr_005_4611                           ; $45EA: $28 $25

jr_005_45EC:
    ld   a, [$C3CF]                               ; $45EC: $FA $CF $C3
    and  a                                        ; $45EF: $A7
    jr   nz, jr_005_4611                          ; $45F0: $20 $1F

    inc  a                                        ; $45F2: $3C
    ld   [$C3CF], a                               ; $45F3: $EA $CF $C3
    ld   hl, wEntity0Type                         ; $45F6: $21 $80 $C2
    add  hl, bc                                   ; $45F9: $09
    ld   [hl], $07                                ; $45FA: $36 $07
    ld   hl, $C490                                ; $45FC: $21 $90 $C4
    add  hl, bc                                   ; $45FF: $09
    ld   [hl], b                                  ; $4600: $70
    ldh  a, [hLinkDirection]                      ; $4601: $F0 $9E
    ld   [wC15D], a                               ; $4603: $EA $5D $C1
    call IsEntityFrameCounterZero                 ; $4606: $CD $05 $0C
    ld   [hl], $02                                ; $4609: $36 $02
    ld   hl, hWaveSfx                                 ; $460B: $21 $F3 $FF
    ld   [hl], $02                                ; $460E: $36 $02
    ret                                           ; $4610: $C9

jr_005_4611:
    ldh  a, [hActiveEntityWalking]                ; $4611: $F0 $F0
    rst  $00                                      ; $4613: $C7
    inc  h                                        ; $4614: $24
    ld   b, [hl]                                  ; $4615: $46
    ld   h, e                                     ; $4616: $63
    ld   b, [hl]                                  ; $4617: $46
    xor  a                                        ; $4618: $AF
    ld   b, [hl]                                  ; $4619: $46
    ld   c, [hl]                                  ; $461A: $4E
    ld   b, a                                     ; $461B: $47
    nop                                           ; $461C: $00
    inc  b                                        ; $461D: $04
    ld   b, $04                                   ; $461E: $06 $04
    nop                                           ; $4620: $00
    db   $FC                                      ; $4621: $FC
    ld   a, [$AFFC]                               ; $4622: $FA $FC $AF
    call label_3B0C                               ; $4625: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $4628: $CD $05 $0C
    ret  nz                                       ; $462B: $C0

    call GetRandomByte                            ; $462C: $CD $0D $28
    and  $07                                      ; $462F: $E6 $07
    ld   e, a                                     ; $4631: $5F
    ld   d, b                                     ; $4632: $50
    ld   hl, $461C                                ; $4633: $21 $1C $46
    add  hl, de                                   ; $4636: $19
    ld   a, [hl]                                  ; $4637: $7E
    ld   hl, wEntity0SpeedX                       ; $4638: $21 $40 $C2
    add  hl, bc                                   ; $463B: $09
    ld   [hl], a                                  ; $463C: $77
    ld   a, e                                     ; $463D: $7B
    and  $04                                      ; $463E: $E6 $04
    ld   hl, $C380                                ; $4640: $21 $80 $C3
    add  hl, bc                                   ; $4643: $09
    ld   [hl], a                                  ; $4644: $77
    call GetRandomByte                            ; $4645: $CD $0D $28
    and  $07                                      ; $4648: $E6 $07
    ld   e, a                                     ; $464A: $5F
    ld   hl, $461C                                ; $464B: $21 $1C $46
    add  hl, de                                   ; $464E: $19
    ld   a, [hl]                                  ; $464F: $7E
    ld   hl, wEntity0SpeedY                       ; $4650: $21 $50 $C2
    add  hl, bc                                   ; $4653: $09
    ld   [hl], a                                  ; $4654: $77
    call IsEntityFrameCounterZero                 ; $4655: $CD $05 $0C
    call GetRandomByte                            ; $4658: $CD $0D $28
    and  $1F                                      ; $465B: $E6 $1F
    add  $30                                      ; $465D: $C6 $30
    ld   [hl], a                                  ; $465F: $77
    jp   IncrementEntityWalkingAttr               ; $4660: $C3 $12 $3B

    call func_005_7AB1                            ; $4663: $CD $B1 $7A
    call label_3B23                               ; $4666: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $4669: $F0 $E8
    and  a                                        ; $466B: $A7
    jr   z, jr_005_4685                           ; $466C: $28 $17

    call IsEntityFrameCounterZero                 ; $466E: $CD $05 $0C
    jr   nz, jr_005_467A                          ; $4671: $20 $07

    ld   [hl], $30                                ; $4673: $36 $30
    call IncrementEntityWalkingAttr               ; $4675: $CD $12 $3B
    ld   [hl], b                                  ; $4678: $70
    ret                                           ; $4679: $C9

jr_005_467A:
    ld   hl, $C320                                ; $467A: $21 $20 $C3
    add  hl, bc                                   ; $467D: $09
    ld   [hl], $05                                ; $467E: $36 $05
    ld   hl, $C310                                ; $4680: $21 $10 $C3
    add  hl, bc                                   ; $4683: $09
    inc  [hl]                                     ; $4684: $34

jr_005_4685:
    ldh  a, [hFrameCounter]                       ; $4685: $F0 $E7
    rra                                           ; $4687: $1F
    rra                                           ; $4688: $1F
    rra                                           ; $4689: $1F
    and  $01                                      ; $468A: $E6 $01
    jp   label_3B0C                               ; $468C: $C3 $0C $3B

    jr   z, @+$4A                                 ; $468F: $28 $48

    ld   l, b                                     ; $4691: $68
    adc  b                                        ; $4692: $88
    jr   jr_005_46CD                              ; $4693: $18 $38

    ld   e, b                                     ; $4695: $58
    ld   a, b                                     ; $4696: $78
    nop                                           ; $4697: $00
    nop                                           ; $4698: $00
    nop                                           ; $4699: $00
    nop                                           ; $469A: $00
    and  b                                        ; $469B: $A0
    and  b                                        ; $469C: $A0
    and  b                                        ; $469D: $A0
    and  b                                        ; $469E: $A0
    nop                                           ; $469F: $00
    nop                                           ; $46A0: $00
    nop                                           ; $46A1: $00
    nop                                           ; $46A2: $00
    sub  b                                        ; $46A3: $90
    sub  b                                        ; $46A4: $90
    sub  b                                        ; $46A5: $90
    sub  b                                        ; $46A6: $90
    jr   nz, jr_005_46E9                          ; $46A7: $20 $40

    ld   h, b                                     ; $46A9: $60
    add  b                                        ; $46AA: $80
    jr   nz, @+$42                                ; $46AB: $20 $40

    ld   h, b                                     ; $46AD: $60
    add  b                                        ; $46AE: $80
    ld   hl, $C310                                ; $46AF: $21 $10 $C3
    add  hl, bc                                   ; $46B2: $09
    ldh  a, [hFrameCounter]                       ; $46B3: $F0 $E7
    xor  c                                        ; $46B5: $A9
    and  $1F                                      ; $46B6: $E6 $1F
    or   [hl]                                     ; $46B8: $B6
    jr   nz, jr_005_46D2                          ; $46B9: $20 $17

    ld   a, $0C                                   ; $46BB: $3E $0C
    call label_3BB5                               ; $46BD: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $46C0: $F0 $D7
    cpl                                           ; $46C2: $2F
    inc  a                                        ; $46C3: $3C
    ld   hl, wEntity0SpeedY                       ; $46C4: $21 $50 $C2
    add  hl, bc                                   ; $46C7: $09
    ld   [hl], a                                  ; $46C8: $77
    ldh  a, [hScratchB]                           ; $46C9: $F0 $D8
    cpl                                           ; $46CB: $2F
    inc  a                                        ; $46CC: $3C

jr_005_46CD:
    ld   hl, wEntity0SpeedX                       ; $46CD: $21 $40 $C2
    add  hl, bc                                   ; $46D0: $09
    ld   [hl], a                                  ; $46D1: $77

jr_005_46D2:
    call func_005_7AB1                            ; $46D2: $CD $B1 $7A
    call label_3B23                               ; $46D5: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $46D8: $F0 $E7
    rra                                           ; $46DA: $1F
    rra                                           ; $46DB: $1F
    and  $01                                      ; $46DC: $E6 $01
    call label_3B0C                               ; $46DE: $CD $0C $3B
    call func_005_7B04                            ; $46E1: $CD $04 $7B
    ld   hl, $C380                                ; $46E4: $21 $80 $C3
    add  hl, bc                                   ; $46E7: $09
    ld   a, e                                     ; $46E8: $7B

jr_005_46E9:
    xor  $01                                      ; $46E9: $EE $01
    ld   [hl], a                                  ; $46EB: $77
    ld   hl, wEntitiesUnknownTableB               ; $46EC: $21 $B0 $C2
    add  hl, bc                                   ; $46EF: $09
    ld   a, [hl]                                  ; $46F0: $7E
    cp   $23                                      ; $46F1: $FE $23
    jr   nz, jr_005_474D                          ; $46F3: $20 $58

    ld   hl, wIsIndoor                            ; $46F5: $21 $A5 $DB
    ldh  a, [hFrameCounter]                       ; $46F8: $F0 $E7
    and  $0F                                      ; $46FA: $E6 $0F
    or   [hl]                                     ; $46FC: $B6
    jr   nz, jr_005_474D                          ; $46FD: $20 $4E

    ld   a, $6C                                   ; $46FF: $3E $6C
    ld   e, $07                                   ; $4701: $1E $07
    call label_3B98                               ; $4703: $CD $98 $3B
    jr   c, jr_005_474D                           ; $4706: $38 $45

    ld   a, $13                                   ; $4708: $3E $13
    ldh  [hWaveSfx], a                                ; $470A: $E0 $F3
    ld   hl, wEntitiesWalkingTable                ; $470C: $21 $90 $C2
    add  hl, de                                   ; $470F: $19
    ld   [hl], $03                                ; $4710: $36 $03
    ld   hl, $C310                                ; $4712: $21 $10 $C3
    add  hl, de                                   ; $4715: $19
    ld   [hl], $10                                ; $4716: $36 $10
    ld   hl, $C340                                ; $4718: $21 $40 $C3
    add  hl, de                                   ; $471B: $19
    ld   [hl], $12                                ; $471C: $36 $12
    ld   hl, $C350                                ; $471E: $21 $50 $C3
    add  hl, de                                   ; $4721: $19
    ld   [hl], $80                                ; $4722: $36 $80
    ld   hl, $C430                                ; $4724: $21 $30 $C4
    add  hl, de                                   ; $4727: $19
    ld   [hl], $40                                ; $4728: $36 $40
    push bc                                       ; $472A: $C5
    call GetRandomByte                            ; $472B: $CD $0D $28
    and  $0F                                      ; $472E: $E6 $0F
    ld   c, a                                     ; $4730: $4F
    ld   hl, $468F                                ; $4731: $21 $8F $46
    add  hl, bc                                   ; $4734: $09
    ld   a, [hl]                                  ; $4735: $7E
    ld   hl, wEntity0PosX                         ; $4736: $21 $00 $C2
    add  hl, de                                   ; $4739: $19
    ld   [hl], a                                  ; $473A: $77
    ld   hl, $469F                                ; $473B: $21 $9F $46
    add  hl, bc                                   ; $473E: $09
    ld   a, [hl]                                  ; $473F: $7E
    ld   hl, wEntity0PosY                         ; $4740: $21 $10 $C2
    add  hl, de                                   ; $4743: $19
    ld   [hl], a                                  ; $4744: $77
    ld   c, e                                     ; $4745: $4B
    ld   b, d                                     ; $4746: $42
    ld   a, $18                                   ; $4747: $3E $18
    call label_3BAA                               ; $4749: $CD $AA $3B
    pop  bc                                       ; $474C: $C1

jr_005_474D:
    ret                                           ; $474D: $C9

    call label_3B44                               ; $474E: $CD $44 $3B
    call func_005_7AB1                            ; $4751: $CD $B1 $7A
    ldh  a, [wActiveEntityPosX]                   ; $4754: $F0 $EE
    cp   $A9                                      ; $4756: $FE $A9
    jp   nc, label_005_7B4B                       ; $4758: $D2 $4B $7B

    ldh  a, [wActiveEntityPosY]                   ; $475B: $F0 $EC
    cp   $91                                      ; $475D: $FE $91
    jp   nc, label_005_7B4B                       ; $475F: $D2 $4B $7B

    ldh  a, [hFrameCounter]                       ; $4762: $F0 $E7
    rra                                           ; $4764: $1F
    rra                                           ; $4765: $1F
    and  $01                                      ; $4766: $E6 $01
    call label_3B0C                               ; $4768: $CD $0C $3B
    ld   e, $00                                   ; $476B: $1E $00
    ld   hl, wEntity0SpeedX                       ; $476D: $21 $40 $C2
    add  hl, bc                                   ; $4770: $09
    ld   a, [hl]                                  ; $4771: $7E
    and  $80                                      ; $4772: $E6 $80
    jr   z, jr_005_4777                           ; $4774: $28 $01

    inc  e                                        ; $4776: $1C

jr_005_4777:
    ld   hl, $C380                                ; $4777: $21 $80 $C3
    add  hl, bc                                   ; $477A: $09
    ld   [hl], e                                  ; $477B: $73
    jp   label_29F8                               ; $477C: $C3 $F8 $29

    ret                                           ; $477F: $C9

    nop                                           ; $4780: $00
    nop                                           ; $4781: $00
    ld   h, b                                     ; $4782: $60
    ld   bc, label_800                            ; $4783: $01 $00 $08
    ld   h, d                                     ; $4786: $62
    ld   bc, $0010                                ; $4787: $01 $10 $00
    ld   h, h                                     ; $478A: $64
    ld   [bc], a                                  ; $478B: $02
    db   $10                                      ; $478C: $10
    ld   [$0266], sp                              ; $478D: $08 $66 $02
    nop                                           ; $4790: $00
    nop                                           ; $4791: $00
    ld   l, b                                     ; $4792: $68
    ld   bc, label_800                            ; $4793: $01 $00 $08
    ld   l, d                                     ; $4796: $6A
    ld   bc, $0010                                ; $4797: $01 $10 $00
    ld   l, h                                     ; $479A: $6C
    ld   [bc], a                                  ; $479B: $02
    db   $10                                      ; $479C: $10
    ld   [RenderLoop.interactiveTransition], sp   ; $479D: $08 $6E $02
    nop                                           ; $47A0: $00
    nop                                           ; $47A1: $00
    ld   h, d                                     ; $47A2: $62
    ld   hl, label_800                            ; $47A3: $21 $00 $08
    ld   h, b                                     ; $47A6: $60
    ld   hl, $0010                                ; $47A7: $21 $10 $00
    ld   h, [hl]                                  ; $47AA: $66
    ld   [hl+], a                                 ; $47AB: $22
    db   $10                                      ; $47AC: $10
    ld   [$2264], sp                              ; $47AD: $08 $64 $22
    nop                                           ; $47B0: $00
    nop                                           ; $47B1: $00
    ld   l, b                                     ; $47B2: $68
    ld   bc, label_800                            ; $47B3: $01 $00 $08
    ld   l, d                                     ; $47B6: $6A
    ld   bc, $0010                                ; $47B7: $01 $10 $00
    ld   l, h                                     ; $47BA: $6C
    ld   [bc], a                                  ; $47BB: $02
    db   $10                                      ; $47BC: $10
    ld   [RenderLoop.interactiveTransition], sp   ; $47BD: $08 $6E $02

func_005_47C0:
    ldh  a, [hActiveEntityUnknownG]               ; $47C0: $F0 $F1
    rla                                           ; $47C2: $17
    rla                                           ; $47C3: $17
    rla                                           ; $47C4: $17
    rla                                           ; $47C5: $17
    and  $F0                                      ; $47C6: $E6 $F0
    ld   e, a                                     ; $47C8: $5F
    ld   d, b                                     ; $47C9: $50
    ld   hl, $4780                                ; $47CA: $21 $80 $47
    add  hl, de                                   ; $47CD: $19
    ld   c, $04                                   ; $47CE: $0E $04
    jp   label_3CE6                               ; $47D0: $C3 $E6 $3C

    push bc                                       ; $47D3: $C5
    sla  c                                        ; $47D4: $CB $21
    sla  c                                        ; $47D6: $CB $21
    ld   a, $0C                                   ; $47D8: $3E $0C
    ld   hl, $D580                                ; $47DA: $21 $80 $D5
    add  hl, bc                                   ; $47DD: $09
    inc  hl                                       ; $47DE: $23
    inc  hl                                       ; $47DF: $23
    ld   [hl], a                                  ; $47E0: $77
    ld   a, $0E                                   ; $47E1: $3E $0E
    inc  hl                                       ; $47E3: $23
    ld   [hl], a                                  ; $47E4: $77
    pop  bc                                       ; $47E5: $C1
    ld   hl, wEntity0PosY                         ; $47E6: $21 $10 $C2
    add  hl, bc                                   ; $47E9: $09
    ld   a, $40                                   ; $47EA: $3E $40
    ld   [hl], a                                  ; $47EC: $77
    call func_005_47C0                            ; $47ED: $CD $C0 $47
    ld   hl, $C3D0                                ; $47F0: $21 $D0 $C3
    add  hl, bc                                   ; $47F3: $09
    inc  [hl]                                     ; $47F4: $34
    ld   a, [hl]                                  ; $47F5: $7E
    rra                                           ; $47F6: $1F
    rra                                           ; $47F7: $1F
    rra                                           ; $47F8: $1F
    rra                                           ; $47F9: $1F
    and  $03                                      ; $47FA: $E6 $03
    call label_3B0C                               ; $47FC: $CD $0C $3B
    call func_005_54C3                            ; $47FF: $CD $C3 $54
    ldh  a, [hActiveEntityWalking]                ; $4802: $F0 $F0
    rst  $00                                      ; $4804: $C7
    dec  d                                        ; $4805: $15
    ld   c, b                                     ; $4806: $48
    ld   e, a                                     ; $4807: $5F
    ld   c, b                                     ; $4808: $48
    ld   a, l                                     ; $4809: $7D
    ld   c, b                                     ; $480A: $48
    sub  [hl]                                     ; $480B: $96
    ld   c, b                                     ; $480C: $48
    rst  $08                                      ; $480D: $CF
    ld   c, b                                     ; $480E: $48
    rst  $30                                      ; $480F: $F7
    ld   c, b                                     ; $4810: $48
    add  hl, bc                                   ; $4811: $09
    ld   c, c                                     ; $4812: $49
    ld   de, $FA49                                ; $4813: $11 $49 $FA
    sbc  a                                        ; $4816: $9F
    pop  bc                                       ; $4817: $C1
    and  a                                        ; $4818: $A7
    ret  nz                                       ; $4819: $C0

    ld   a, [$DB4B]                               ; $481A: $FA $4B $DB
    and  a                                        ; $481D: $A7
    jr   z, jr_005_484A                           ; $481E: $28 $2A

    call func_005_5506                            ; $4820: $CD $06 $55
    ld   a, e                                     ; $4823: $7B
    and  a                                        ; $4824: $A7
    ret  z                                        ; $4825: $C8

    ld   hl, wAButtonSlot                         ; $4826: $21 $00 $DB
    ld   a, [hl]                                  ; $4829: $7E
    cp   $0C                                      ; $482A: $FE $0C
    jr   nz, jr_005_483C                          ; $482C: $20 $0E

    ldh  a, [hFFCC]                               ; $482E: $F0 $CC
    and  $20                                      ; $4830: $E6 $20
    ret  z                                        ; $4832: $C8

    xor  a                                        ; $4833: $AF
    ld   [wDialogGotItem], a                      ; $4834: $EA $A9 $C1
    ld   [$C1A8], a                               ; $4837: $EA $A8 $C1
    jr   jr_005_4847                              ; $483A: $18 $0B

jr_005_483C:
    inc  hl                                       ; $483C: $23
    ld   a, [hl]                                  ; $483D: $7E
    cp   $0C                                      ; $483E: $FE $0C
    jr   nz, jr_005_484A                          ; $4840: $20 $08

    ldh  a, [hFFCC]                               ; $4842: $F0 $CC
    and  $10                                      ; $4844: $E6 $10
    ret  z                                        ; $4846: $C8

jr_005_4847:
    ld   [hl], b                                  ; $4847: $70
    jr   jr_005_4853                              ; $4848: $18 $09

jr_005_484A:
    call func_005_5506                            ; $484A: $CD $06 $55
    ret  nc                                       ; $484D: $D0

    ld   a, $0C                                   ; $484E: $3E $0C
    jp   OpenDialog                               ; $4850: $C3 $85 $23

jr_005_4853:
    xor  a                                        ; $4853: $AF
    ld   [$DB4B], a                               ; $4854: $EA $4B $DB
    call IsEntityFrameCounterZero                 ; $4857: $CD $05 $0C
    ld   [hl], $08                                ; $485A: $36 $08
    jp   IncrementEntityWalkingAttr               ; $485C: $C3 $12 $3B

    ld   a, [wGameplayType]                       ; $485F: $FA $95 $DB
    cp   $0B                                      ; $4862: $FE $0B
    ret  nz                                       ; $4864: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4865: $FA $6B $C1
    cp   $04                                      ; $4868: $FE $04
    ret  nz                                       ; $486A: $C0

    ld   a, $02                                   ; $486B: $3E $02
    ldh  [$FFA1], a                               ; $486D: $E0 $A1
    ld   [wC167], a                               ; $486F: $EA $67 $C1
    call IsEntityFrameCounterZero                 ; $4872: $CD $05 $0C
    ret  nz                                       ; $4875: $C0

    xor  a                                        ; $4876: $AF
    ld   [wC167], a                               ; $4877: $EA $67 $C1
    jp   IncrementEntityWalkingAttr               ; $487A: $C3 $12 $3B

    ld   a, [wGameplayType]                       ; $487D: $FA $95 $DB
    cp   $0B                                      ; $4880: $FE $0B
    ret  nz                                       ; $4882: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4883: $FA $6B $C1
    cp   $04                                      ; $4886: $FE $04
    ret  nz                                       ; $4888: $C0

    ld   a, $09                                   ; $4889: $3E $09
    call OpenDialog                               ; $488B: $CD $85 $23
    call IsEntityFrameCounterZero                 ; $488E: $CD $05 $0C
    ld   [hl], $C0                                ; $4891: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $4893: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $4896: $FA $9F $C1
    and  a                                        ; $4899: $A7
    ret  nz                                       ; $489A: $C0

    ld   a, [wC10B]                               ; $489B: $FA $0B $C1
    and  a                                        ; $489E: $A7
    jr   nz, jr_005_48AE                          ; $489F: $20 $0D

    ldh  a, [hMusicTrack]                         ; $48A1: $F0 $B0
    ld   [wWorldMusicTrack], a                    ; $48A3: $EA $68 $D3
    ld   a, $01                                   ; $48A6: $3E $01
    ld   [wC10B], a                               ; $48A8: $EA $0B $C1
    ld   [wC167], a                               ; $48AB: $EA $67 $C1

jr_005_48AE:
    ldh  [$FFA1], a                               ; $48AE: $E0 $A1
    ld   hl, $C3D0                                ; $48B0: $21 $D0 $C3
    add  hl, bc                                   ; $48B3: $09
    inc  [hl]                                     ; $48B4: $34
    inc  [hl]                                     ; $48B5: $34
    inc  [hl]                                     ; $48B6: $34
    inc  [hl]                                     ; $48B7: $34
    call IsEntityFrameCounterZero                 ; $48B8: $CD $05 $0C
    ret  nz                                       ; $48BB: $C0

    ld   [wC10B], a                               ; $48BC: $EA $0B $C1
    ld   [wC167], a                               ; $48BF: $EA $67 $C1
    ldh  a, [hMusicTrack]                         ; $48C2: $F0 $B0
    ld   [wWorldMusicTrack], a                    ; $48C4: $EA $68 $D3
    ld   a, $FE                                   ; $48C7: $3E $FE
    call OpenDialog                               ; $48C9: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $48CC: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $48CF: $FA $9F $C1
    and  a                                        ; $48D2: $A7
    ret  nz                                       ; $48D3: $C0

    ld   a, $2A                                   ; $48D4: $3E $2A
    ld   [wDialogGotItemCountdown], a             ; $48D6: $EA $AA $C1
    ld   a, $03                                   ; $48D9: $3E $03
    ld   [wDialogGotItem], a                      ; $48DB: $EA $A9 $C1
    ld   d, $0C                                   ; $48DE: $16 $0C
    call AssignItemToSlot                            ; $48E0: $CD $21 $53
    ld   a, [wMagicPowderCount]                   ; $48E3: $FA $4C $DB
    add  $20                                      ; $48E6: $C6 $20
    daa                                           ; $48E8: $27
    ld   [wMagicPowderCount], a                   ; $48E9: $EA $4C $DB
    ld   a, $0B                                   ; $48EC: $3E $0B
    ldh  [hFFA5], a                               ; $48EE: $E0 $A5
    ld   a, $01                                   ; $48F0: $3E $01
    ldh  [hJingle], a                             ; $48F2: $E0 $F2
    call IncrementEntityWalkingAttr               ; $48F4: $CD $12 $3B
    ld   a, [$C1A2]                               ; $48F7: $FA $A2 $C1
    and  a                                        ; $48FA: $A7
    ret  z                                        ; $48FB: $C8

    ld   a, [wBGPaletteEffectAddress]             ; $48FC: $FA $CC $C3
    and  a                                        ; $48FF: $A7
    ret  nz                                       ; $4900: $C0

    ld   a, [wPaletteUnknownA]                    ; $4901: $FA $D1 $DD
    and  a                                        ; $4904: $A7
    ret  nz                                       ; $4905: $C0

    jp   IncrementEntityWalkingAttr               ; $4906: $C3 $12 $3B

    ld   a, $7E                                   ; $4909: $3E $7E
    call OpenDialogInTable1                       ; $490B: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $490E: $C3 $12 $3B

    ret                                           ; $4911: $C9

    ld   a, b                                     ; $4912: $78
    ld   [bc], a                                  ; $4913: $02
    ld   a, d                                     ; $4914: $7A
    ld   [bc], a                                  ; $4915: $02
    ld   a, d                                     ; $4916: $7A
    ld   [hl+], a                                 ; $4917: $22
    ld   a, b                                     ; $4918: $78
    ld   [hl+], a                                 ; $4919: $22
    ld   a, h                                     ; $491A: $7C
    ld   [bc], a                                  ; $491B: $02
    ld   a, [hl]                                  ; $491C: $7E
    ld   [bc], a                                  ; $491D: $02
    ld   a, b                                     ; $491E: $78
    ld   [bc], a                                  ; $491F: $02
    ld   a, d                                     ; $4920: $7A
    ld   [bc], a                                  ; $4921: $02
    ld   [hl], b                                  ; $4922: $70
    ld   [bc], a                                  ; $4923: $02
    ld   [hl], d                                  ; $4924: $72
    ld   [bc], a                                  ; $4925: $02
    ld   [hl], h                                  ; $4926: $74
    ld   [bc], a                                  ; $4927: $02
    db   $76                                      ; $4928: $76
    ld   [bc], a                                  ; $4929: $02
    db   $76                                      ; $492A: $76
    ld   [hl+], a                                 ; $492B: $22
    ld   [hl], h                                  ; $492C: $74
    ld   [hl+], a                                 ; $492D: $22
    ld   [hl], d                                  ; $492E: $72
    ld   [hl+], a                                 ; $492F: $22
    ld   [hl], b                                  ; $4930: $70
    ld   [hl+], a                                 ; $4931: $22
    ld   e, d                                     ; $4932: $5A
    ld   [hl+], a                                 ; $4933: $22
    ld   e, b                                     ; $4934: $58
    ld   [hl+], a                                 ; $4935: $22
    ld   e, b                                     ; $4936: $58
    ld   [bc], a                                  ; $4937: $02
    ld   e, d                                     ; $4938: $5A
    ld   [bc], a                                  ; $4939: $02
    ld   d, b                                     ; $493A: $50
    ld   [bc], a                                  ; $493B: $02
    ld   d, d                                     ; $493C: $52
    ld   [bc], a                                  ; $493D: $02
    ld   d, b                                     ; $493E: $50
    ld   [bc], a                                  ; $493F: $02
    ld   d, d                                     ; $4940: $52
    ld   [bc], a                                  ; $4941: $02
    ld   d, h                                     ; $4942: $54
    ld   [bc], a                                  ; $4943: $02
    ld   d, [hl]                                  ; $4944: $56
    ld   [bc], a                                  ; $4945: $02
    ld   a, d                                     ; $4946: $7A
    rlca                                          ; $4947: $07
    ld   a, h                                     ; $4948: $7C
    rlca                                          ; $4949: $07
    nop                                           ; $494A: $00
    nop                                           ; $494B: $00
    jr   nz, @+$04                                ; $494C: $20 $02

    nop                                           ; $494E: $00
    ld   [$0222], sp                              ; $494F: $08 $22 $02
    nop                                           ; $4952: $00
    nop                                           ; $4953: $00
    jr   nz, @+$04                                ; $4954: $20 $02

    nop                                           ; $4956: $00
    ld   [$0222], sp                              ; $4957: $08 $22 $02
    pop  af                                       ; $495A: $F1
    ld   a, [$022A]                               ; $495B: $FA $2A $02
    pop  af                                       ; $495E: $F1
    ld   [bc], a                                  ; $495F: $02
    ld   a, [hl+]                                 ; $4960: $2A
    ld   [hl+], a                                 ; $4961: $22
    nop                                           ; $4962: $00
    nop                                           ; $4963: $00
    inc  h                                        ; $4964: $24
    ld   [bc], a                                  ; $4965: $02
    nop                                           ; $4966: $00
    ld   [$0228], sp                              ; $4967: $08 $28 $02
    ld   a, [wGameplayType]                       ; $496A: $FA $95 $DB
    cp   $01                                      ; $496D: $FE $01
    jr   nz, jr_005_4995                          ; $496F: $20 $24

    ld   hl, $C340                                ; $4971: $21 $40 $C3
    add  hl, bc                                   ; $4974: $09
    ld   [hl], $C4                                ; $4975: $36 $C4
    ld   hl, $C3D0                                ; $4977: $21 $D0 $C3
    add  hl, bc                                   ; $497A: $09
    ld   a, [hl]                                  ; $497B: $7E
    ld   hl, $494A                                ; $497C: $21 $4A $49
    cp   $70                                      ; $497F: $FE $70
    jr   nz, jr_005_4986                          ; $4981: $20 $03

    ld   hl, $495A                                ; $4983: $21 $5A $49

jr_005_4986:
    ld   c, $04                                   ; $4986: $0E $04
    call label_3CE6                               ; $4988: $CD $E6 $3C
    ld   hl, $C3D0                                ; $498B: $21 $D0 $C3
    add  hl, bc                                   ; $498E: $09
    ld   a, [hl]                                  ; $498F: $7E
    cp   $70                                      ; $4990: $FE $70
    ret  z                                        ; $4992: $C8

    inc  [hl]                                     ; $4993: $34
    ret                                           ; $4994: $C9

jr_005_4995:
    ld   a, [wIsIndoor]                           ; $4995: $FA $A5 $DB
    and  a                                        ; $4998: $A7
    jp   nz, label_005_4BC1                       ; $4999: $C2 $C1 $4B

    ldh  a, [hRoomStatus]                         ; $499C: $F0 $F8
    and  $10                                      ; $499E: $E6 $10
    jp   nz, label_005_7B4B                       ; $49A0: $C2 $4B $7B

    ldh  a, [hActiveEntityWalking]                ; $49A3: $F0 $F0
    and  a                                        ; $49A5: $A7
    jr   nz, jr_005_49D1                          ; $49A6: $20 $29

    ldh  a, [hFrameCounter]                       ; $49A8: $F0 $E7
    rra                                           ; $49AA: $1F
    rra                                           ; $49AB: $1F
    rra                                           ; $49AC: $1F
    rra                                           ; $49AD: $1F
    and  $01                                      ; $49AE: $E6 $01
    call label_3B0C                               ; $49B0: $CD $0C $3B
    ldh  a, [hLinkPositionY]                      ; $49B3: $F0 $99
    cp   $30                                      ; $49B5: $FE $30
    jr   nc, jr_005_49CC                          ; $49B7: $30 $13

    ld   a, $01                                   ; $49B9: $3E $01
    ld   [wC10C], a                               ; $49BB: $EA $0C $C1
    ldh  a, [hFrameCounter]                       ; $49BE: $F0 $E7
    rra                                           ; $49C0: $1F
    rra                                           ; $49C1: $1F
    rra                                           ; $49C2: $1F
    and  $01                                      ; $49C3: $E6 $01
    add  $02                                      ; $49C5: $C6 $02
    call label_3B0C                               ; $49C7: $CD $0C $3B
    jr   jr_005_49D1                              ; $49CA: $18 $05

jr_005_49CC:
    ld   hl, $C440                                ; $49CC: $21 $40 $C4
    add  hl, bc                                   ; $49CF: $09
    ld   [hl], b                                  ; $49D0: $70

jr_005_49D1:
    ld   de, $4912                                ; $49D1: $11 $12 $49
    call label_3BC0                               ; $49D4: $CD $C0 $3B
    call func_005_7A3A                            ; $49D7: $CD $3A $7A
    ldh  a, [hActiveEntityWalking]                ; $49DA: $F0 $F0
    rst  $00                                      ; $49DC: $C7
    push hl                                       ; $49DD: $E5
    ld   c, c                                     ; $49DE: $49
    rla                                           ; $49DF: $17
    ld   c, d                                     ; $49E0: $4A
    ld   b, c                                     ; $49E1: $41
    ld   c, e                                     ; $49E2: $4B
    adc  c                                        ; $49E3: $89
    ld   c, e                                     ; $49E4: $4B
    call func_005_54C3                            ; $49E5: $CD $C3 $54
    ldh  a, [hLinkPositionY]                      ; $49E8: $F0 $99
    cp   $20                                      ; $49EA: $FE $20
    jr   nc, jr_005_49FD                          ; $49EC: $30 $0F

    ld   hl, $C440                                ; $49EE: $21 $40 $C4
    add  hl, bc                                   ; $49F1: $09
    ld   a, [hl]                                  ; $49F2: $7E
    and  a                                        ; $49F3: $A7
    jr   nz, jr_005_49FD                          ; $49F4: $20 $07

    ld   [hl], $01                                ; $49F6: $36 $01
    ld   a, $21                                   ; $49F8: $3E $21
    jp   OpenDialog                               ; $49FA: $C3 $85 $23

jr_005_49FD:
    call func_005_5506                            ; $49FD: $CD $06 $55
    jr   nc, jr_005_4A0C                          ; $4A00: $30 $0A

    ld   a, [$C19B]                               ; $4A02: $FA $9B $C1
    and  a                                        ; $4A05: $A7
    ret  nz                                       ; $4A06: $C0

    ld   a, $0D                                   ; $4A07: $3E $0D
    jp   OpenDialog                               ; $4A09: $C3 $85 $23

jr_005_4A0C:
    ld   hl, $C1AD                                ; $4A0C: $21 $AD $C1
    ld   [hl], b                                  ; $4A0F: $70
    ret                                           ; $4A10: $C9

    nop                                           ; $4A11: $00
    inc  b                                        ; $4A12: $04
    dec  b                                        ; $4A13: $05
    ld   b, $07                                   ; $4A14: $06 $07
    ld   bc, $023E                                ; $4A16: $01 $3E $02
    ldh  [$FFA1], a                               ; $4A19: $E0 $A1
    xor  a                                        ; $4A1B: $AF
    ld   [$C19B], a                               ; $4A1C: $EA $9B $C1
    call func_005_7B24                            ; $4A1F: $CD $24 $7B
    ld   a, e                                     ; $4A22: $7B
    xor  $01                                      ; $4A23: $EE $01
    ldh  [hLinkDirection], a                      ; $4A25: $E0 $9E
    push bc                                       ; $4A27: $C5
    call $0BF0                                    ; $4A28: $CD $F0 $0B
    pop  bc                                       ; $4A2B: $C1
    ld   hl, wEntitiesUnknownTableD               ; $4A2C: $21 $D0 $C2
    add  hl, bc                                   ; $4A2F: $09
    ld   e, [hl]                                  ; $4A30: $5E
    ld   hl, wEntitiesUnknownTableC               ; $4A31: $21 $C0 $C2
    add  hl, bc                                   ; $4A34: $09
    ld   a, [hl]                                  ; $4A35: $7E
    add  e                                        ; $4A36: $83
    ld   [hl], a                                  ; $4A37: $77
    jr   nc, jr_005_4A46                          ; $4A38: $30 $0C

    ld   hl, $C390                                ; $4A3A: $21 $90 $C3
    add  hl, bc                                   ; $4A3D: $09
    ld   a, [hl]                                  ; $4A3E: $7E
    inc  a                                        ; $4A3F: $3C
    cp   $06                                      ; $4A40: $FE $06
    jr   nz, jr_005_4A45                          ; $4A42: $20 $01

    xor  a                                        ; $4A44: $AF

jr_005_4A45:
    ld   [hl], a                                  ; $4A45: $77

jr_005_4A46:
    ld   hl, $C390                                ; $4A46: $21 $90 $C3
    add  hl, bc                                   ; $4A49: $09
    ld   e, [hl]                                  ; $4A4A: $5E
    ld   d, b                                     ; $4A4B: $50
    ld   hl, $4A11                                ; $4A4C: $21 $11 $4A
    add  hl, de                                   ; $4A4F: $19
    ld   a, [hl]                                  ; $4A50: $7E
    call label_3B0C                               ; $4A51: $CD $0C $3B
    call label_BFB                                ; $4A54: $CD $FB $0B
    jr   nz, jr_005_4A9E                          ; $4A57: $20 $45

    ld   a, $02                                   ; $4A59: $3E $02
    call label_3B86                               ; $4A5B: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $4A5E: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4A60: $21 $00 $C2
    add  hl, de                                   ; $4A63: $19
    ld   [hl], a                                  ; $4A64: $77
    ldh  a, [hScratchB]                           ; $4A65: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4A67: $21 $10 $C2
    add  hl, de                                   ; $4A6A: $19
    ld   [hl], a                                  ; $4A6B: $77
    ldh  a, [hScratchD]                           ; $4A6C: $F0 $DA
    ld   hl, $C310                                ; $4A6E: $21 $10 $C3
    add  hl, de                                   ; $4A71: $19
    ld   [hl], a                                  ; $4A72: $77
    ld   hl, $C440                                ; $4A73: $21 $40 $C4
    add  hl, de                                   ; $4A76: $19
    ld   [hl], $4C                                ; $4A77: $36 $4C
    ld   hl, wEntitiesFrameCounterTable           ; $4A79: $21 $E0 $C2
    add  hl, de                                   ; $4A7C: $19
    ld   [hl], $20                                ; $4A7D: $36 $20
    ld   a, $09                                   ; $4A7F: $3E $09
    call label_3B0C                               ; $4A81: $CD $0C $3B
    ld   hl, $C320                                ; $4A84: $21 $20 $C3
    add  hl, bc                                   ; $4A87: $09
    ld   [hl], b                                  ; $4A88: $70
    call IncrementEntityWalkingAttr               ; $4A89: $CD $12 $3B
    ldh  a, [hMapRoom]                            ; $4A8C: $F0 $F6
    ld   e, a                                     ; $4A8E: $5F
    ld   d, b                                     ; $4A8F: $50
    ld   hl, wOverworldRoomStatus                 ; $4A90: $21 $00 $D8
    add  hl, de                                   ; $4A93: $19
    ld   a, [hl]                                  ; $4A94: $7E
    or   $10                                      ; $4A95: $F6 $10
    ld   [hl], a                                  ; $4A97: $77
    ld   a, $01                                   ; $4A98: $3E $01
    ld   [$DB48], a                               ; $4A9A: $EA $48 $DB
    ret                                           ; $4A9D: $C9

jr_005_4A9E:
    ld   hl, wEntitiesUnknownTableD               ; $4A9E: $21 $D0 $C2
    add  hl, bc                                   ; $4AA1: $09
    ldh  a, [hFrameCounter]                       ; $4AA2: $F0 $E7
    and  $01                                      ; $4AA4: $E6 $01
    jr   nz, jr_005_4AAE                          ; $4AA6: $20 $06

    ld   a, [hl]                                  ; $4AA8: $7E
    cp   $F0                                      ; $4AA9: $FE $F0
    jr   nc, jr_005_4AAE                          ; $4AAB: $30 $01

    inc  [hl]                                     ; $4AAD: $34

jr_005_4AAE:
    call func_005_7AB1                            ; $4AAE: $CD $B1 $7A
    call label_3B23                               ; $4AB1: $CD $23 $3B
    call label_BFB                                ; $4AB4: $CD $FB $0B
    cp   $06                                      ; $4AB7: $FE $06
    jr   nc, jr_005_4AEC                          ; $4AB9: $30 $31

    ldh  a, [$FFEF]                               ; $4ABB: $F0 $EF
    cp   $30                                      ; $4ABD: $FE $30
    jr   nc, jr_005_4AC5                          ; $4ABF: $30 $04

    ld   [hl], $08                                ; $4AC1: $36 $08
    jr   jr_005_4AEC                              ; $4AC3: $18 $27

jr_005_4AC5:
    ld   hl, $C320                                ; $4AC5: $21 $20 $C3
    add  hl, bc                                   ; $4AC8: $09
    inc  [hl]                                     ; $4AC9: $34
    nop                                           ; $4ACA: $00
    ld   hl, wEntity0SpeedX                       ; $4ACB: $21 $40 $C2
    add  hl, bc                                   ; $4ACE: $09
    ld   a, [hl]                                  ; $4ACF: $7E
    and  a                                        ; $4AD0: $A7
    jr   z, jr_005_4ADA                           ; $4AD1: $28 $07

    and  $80                                      ; $4AD3: $E6 $80
    jr   z, jr_005_4AD9                           ; $4AD5: $28 $02

    inc  [hl]                                     ; $4AD7: $34
    inc  [hl]                                     ; $4AD8: $34

jr_005_4AD9:
    dec  [hl]                                     ; $4AD9: $35

jr_005_4ADA:
    ld   hl, wEntity0SpeedY                       ; $4ADA: $21 $50 $C2
    add  hl, bc                                   ; $4ADD: $09
    ld   a, [hl]                                  ; $4ADE: $7E
    and  a                                        ; $4ADF: $A7
    jr   z, jr_005_4AE9                           ; $4AE0: $28 $07

    and  $80                                      ; $4AE2: $E6 $80
    jr   z, jr_005_4AE8                           ; $4AE4: $28 $02

    inc  [hl]                                     ; $4AE6: $34
    inc  [hl]                                     ; $4AE7: $34

jr_005_4AE8:
    dec  [hl]                                     ; $4AE8: $35

jr_005_4AE9:
    jp   label_005_7AEA                           ; $4AE9: $C3 $EA $7A

jr_005_4AEC:
    ld   hl, wEntitiesCollisionsTable             ; $4AEC: $21 $A0 $C2
    add  hl, bc                                   ; $4AEF: $09
    ld   a, [hl]                                  ; $4AF0: $7E
    and  $03                                      ; $4AF1: $E6 $03
    jr   z, jr_005_4B01                           ; $4AF3: $28 $0C

    ld   hl, wEntity0SpeedX                       ; $4AF5: $21 $40 $C2
    add  hl, bc                                   ; $4AF8: $09
    ld   a, [hl]                                  ; $4AF9: $7E
    cpl                                           ; $4AFA: $2F
    inc  a                                        ; $4AFB: $3C
    ld   [hl], a                                  ; $4AFC: $77
    ld   a, $09                                   ; $4AFD: $3E $09
    ldh  [hJingle], a                             ; $4AFF: $E0 $F2

jr_005_4B01:
    ld   hl, wEntitiesCollisionsTable             ; $4B01: $21 $A0 $C2
    add  hl, bc                                   ; $4B04: $09
    ld   a, [hl]                                  ; $4B05: $7E
    and  $0C                                      ; $4B06: $E6 $0C
    jr   z, jr_005_4B16                           ; $4B08: $28 $0C

    ld   hl, wEntity0SpeedY                       ; $4B0A: $21 $50 $C2
    add  hl, bc                                   ; $4B0D: $09
    ld   a, [hl]                                  ; $4B0E: $7E
    cpl                                           ; $4B0F: $2F
    inc  a                                        ; $4B10: $3C
    ld   [hl], a                                  ; $4B11: $77
    ld   a, $09                                   ; $4B12: $3E $09
    ldh  [hJingle], a                             ; $4B14: $E0 $F2

jr_005_4B16:
    call label_BFB                                ; $4B16: $CD $FB $0B
    cp   $60                                      ; $4B19: $FE $60
    jr   nc, jr_005_4B40                          ; $4B1B: $30 $23

    ldh  a, [hFrameCounter]                       ; $4B1D: $F0 $E7
    and  $03                                      ; $4B1F: $E6 $03
    jr   nz, jr_005_4B40                          ; $4B21: $20 $1D

    ld   hl, wEntity0SpeedX                       ; $4B23: $21 $40 $C2
    call func_005_4B2C                            ; $4B26: $CD $2C $4B
    ld   hl, wEntity0SpeedY                       ; $4B29: $21 $50 $C2

func_005_4B2C:
    add  hl, bc                                   ; $4B2C: $09
    ld   a, [hl]                                  ; $4B2D: $7E
    cp   $30                                      ; $4B2E: $FE $30
    jr   z, jr_005_4B40                           ; $4B30: $28 $0E

    cp   $D0                                      ; $4B32: $FE $D0
    jr   z, jr_005_4B40                           ; $4B34: $28 $0A

    ld   e, $01                                   ; $4B36: $1E $01
    bit  7, a                                     ; $4B38: $CB $7F
    jr   z, jr_005_4B3E                           ; $4B3A: $28 $02

    ld   e, $FF                                   ; $4B3C: $1E $FF

jr_005_4B3E:
    add  e                                        ; $4B3E: $83
    ld   [hl], a                                  ; $4B3F: $77

jr_005_4B40:
    ret                                           ; $4B40: $C9

    ld   a, $02                                   ; $4B41: $3E $02
    ldh  [$FFA1], a                               ; $4B43: $E0 $A1
    call func_005_7AEA                            ; $4B45: $CD $EA $7A
    ld   hl, $C320                                ; $4B48: $21 $20 $C3
    add  hl, bc                                   ; $4B4B: $09
    dec  [hl]                                     ; $4B4C: $35
    ld   hl, $C310                                ; $4B4D: $21 $10 $C3
    add  hl, bc                                   ; $4B50: $09
    ld   a, [hl]                                  ; $4B51: $7E
    and  $80                                      ; $4B52: $E6 $80
    ret  z                                        ; $4B54: $C8

    ld   [hl], b                                  ; $4B55: $70
    xor  a                                        ; $4B56: $AF
    ld   [wC167], a                               ; $4B57: $EA $67 $C1
    ld   a, $23                                   ; $4B5A: $3E $23
    ldh  [hJingle], a                             ; $4B5C: $E0 $F2
    call label_27DD                               ; $4B5E: $CD $DD $27
    call IsEntityFrameCounterZero                 ; $4B61: $CD $05 $0C
    ld   [hl], $40                                ; $4B64: $36 $40
    call func_005_7B24                            ; $4B66: $CD $24 $7B
    add  $08                                      ; $4B69: $C6 $08
    call label_3B0C                               ; $4B6B: $CD $0C $3B
    call func_005_7B04                            ; $4B6E: $CD $04 $7B
    add  $12                                      ; $4B71: $C6 $12
    cp   $24                                      ; $4B73: $FE $24
    jr   nc, jr_005_4B86                          ; $4B75: $30 $0F

    call func_005_7B14                            ; $4B77: $CD $14 $7B
    add  $12                                      ; $4B7A: $C6 $12
    cp   $24                                      ; $4B7C: $FE $24
    jr   nc, jr_005_4B86                          ; $4B7E: $30 $06

    ld   hl, wEntitiesUnknownTableB               ; $4B80: $21 $B0 $C2
    add  hl, bc                                   ; $4B83: $09
    ld   [hl], $80                                ; $4B84: $36 $80

jr_005_4B86:
    jp   IncrementEntityWalkingAttr               ; $4B86: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $4B89: $CD $05 $0C
    cp   $01                                      ; $4B8C: $FE $01
    jr   nz, jr_005_4B95                          ; $4B8E: $20 $05

    ld   a, $0A                                   ; $4B90: $3E $0A
    jp   OpenDialog                               ; $4B92: $C3 $85 $23

jr_005_4B95:
    and  a                                        ; $4B95: $A7
    jr   z, jr_005_4B9D                           ; $4B96: $28 $05

    ld   a, $02                                   ; $4B98: $3E $02
    ldh  [$FFA1], a                               ; $4B9A: $E0 $A1
    ret                                           ; $4B9C: $C9

jr_005_4B9D:
    ldh  a, [hFrameCounter]                       ; $4B9D: $F0 $E7
    and  $1F                                      ; $4B9F: $E6 $1F
    jr   nz, jr_005_4BAB                          ; $4BA1: $20 $08

    call func_005_7B24                            ; $4BA3: $CD $24 $7B
    add  $08                                      ; $4BA6: $C6 $08
    call label_3B0C                               ; $4BA8: $CD $0C $3B

jr_005_4BAB:
    ld   hl, wEntitiesUnknownTableB               ; $4BAB: $21 $B0 $C2
    add  hl, bc                                   ; $4BAE: $09
    ld   a, [hl]                                  ; $4BAF: $7E
    and  a                                        ; $4BB0: $A7
    jr   nz, jr_005_4BB6                          ; $4BB1: $20 $03

    call func_005_54C3                            ; $4BB3: $CD $C3 $54

jr_005_4BB6:
    call func_005_5506                            ; $4BB6: $CD $06 $55
    ret  nc                                       ; $4BB9: $D0

    ld   a, $0B                                   ; $4BBA: $3E $0B
    jp   OpenDialog                               ; $4BBC: $C3 $85 $23

    ld   a, b                                     ; $4BBF: $78
    nop                                           ; $4BC0: $00

label_005_4BC1:
    ld   hl, wEntitiesUnknownTableC               ; $4BC1: $21 $C0 $C2
    add  hl, bc                                   ; $4BC4: $09
    ld   a, [hl]                                  ; $4BC5: $7E
    and  a                                        ; $4BC6: $A7
    jr   z, jr_005_4BF1                           ; $4BC7: $28 $28

    ld   de, $4BBF                                ; $4BC9: $11 $BF $4B
    call label_3C77                               ; $4BCC: $CD $77 $3C
    call func_005_7A3A                            ; $4BCF: $CD $3A $7A
    call func_005_7AB1                            ; $4BD2: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $4BD5: $CD $05 $0C
    jp   z, label_005_7B4B                        ; $4BD8: $CA $4B $7B

    and  $10                                      ; $4BDB: $E6 $10
    ld   e, $01                                   ; $4BDD: $1E $01
    jr   z, jr_005_4BE3                           ; $4BDF: $28 $02

    ld   e, $FF                                   ; $4BE1: $1E $FF

jr_005_4BE3:
    ldh  a, [hFrameCounter]                       ; $4BE3: $F0 $E7
    and  $01                                      ; $4BE5: $E6 $01
    jr   nz, jr_005_4BF0                          ; $4BE7: $20 $07

    ld   hl, wEntity0SpeedX                       ; $4BE9: $21 $40 $C2
    add  hl, bc                                   ; $4BEC: $09
    ld   a, [hl]                                  ; $4BED: $7E
    add  e                                        ; $4BEE: $83
    ld   [hl], a                                  ; $4BEF: $77

jr_005_4BF0:
    ret                                           ; $4BF0: $C9

jr_005_4BF1:
    ld   a, [wIsMarinFollowingLink]               ; $4BF1: $FA $73 $DB
    and  a                                        ; $4BF4: $A7
    jr   nz, jr_005_4C07                          ; $4BF5: $20 $10

    ld   a, [wHasInstrument3]                     ; $4BF7: $FA $67 $DB
    and  $02                                      ; $4BFA: $E6 $02
    jp   nz, label_005_7B4B                       ; $4BFC: $C2 $4B $7B

    ld   a, [wTradeSequenceItem]                  ; $4BFF: $FA $0E $DB
    cp   $04                                      ; $4C02: $FE $04
    jp   nc, label_005_7B4B                       ; $4C04: $D2 $4B $7B

jr_005_4C07:
    ld   a, [$DB48]                               ; $4C07: $FA $48 $DB
    and  a                                        ; $4C0A: $A7
    jr   nz, jr_005_4C14                          ; $4C0B: $20 $07

    ld   a, [wSwordLevel]                         ; $4C0D: $FA $4E $DB
    and  a                                        ; $4C10: $A7
    jp   nz, label_005_7B4B                       ; $4C11: $C2 $4B $7B

jr_005_4C14:
    ld   a, [wIsMarinFollowingLink]               ; $4C14: $FA $73 $DB
    and  a                                        ; $4C17: $A7
    jr   nz, jr_005_4C24                          ; $4C18: $20 $0A

    ld   a, [$DB48]                               ; $4C1A: $FA $48 $DB
    and  a                                        ; $4C1D: $A7
    jr   z, jr_005_4C43                           ; $4C1E: $28 $23

    cp   $01                                      ; $4C20: $FE $01
    jr   nz, jr_005_4C43                          ; $4C22: $20 $1F

jr_005_4C24:
    ld   hl, wEntity0PosX                         ; $4C24: $21 $00 $C2
    add  hl, bc                                   ; $4C27: $09
    ld   [hl], $18                                ; $4C28: $36 $18
    ld   hl, wEntity0PosY                         ; $4C2A: $21 $10 $C2
    add  hl, bc                                   ; $4C2D: $09
    ld   [hl], $34                                ; $4C2E: $36 $34
    call label_3D8A                               ; $4C30: $CD $8A $3D
    ldh  a, [hIsGBC]                              ; $4C33: $F0 $FE
    and  a                                        ; $4C35: $A7
    jr   z, jr_005_4C3E                           ; $4C36: $28 $06

    ld   de, $4946                                ; $4C38: $11 $46 $49
    call label_3BC0                               ; $4C3B: $CD $C0 $3B

jr_005_4C3E:
    ld   de, $4942                                ; $4C3E: $11 $42 $49
    jr   jr_005_4C57                              ; $4C41: $18 $14

jr_005_4C43:
    call func_005_4DCF                            ; $4C43: $CD $CF $4D
    ldh  a, [hFrameCounter]                       ; $4C46: $F0 $E7
    and  $1F                                      ; $4C48: $E6 $1F
    jr   nz, jr_005_4C54                          ; $4C4A: $20 $08

    call func_005_7B24                            ; $4C4C: $CD $24 $7B
    ld   hl, wEntitiesUnknownTableG               ; $4C4F: $21 $B0 $C3
    add  hl, bc                                   ; $4C52: $09
    ld   [hl], e                                  ; $4C53: $73

jr_005_4C54:
    ld   de, $4932                                ; $4C54: $11 $32 $49

jr_005_4C57:
    call label_3BC0                               ; $4C57: $CD $C0 $3B
    call func_005_7A3A                            ; $4C5A: $CD $3A $7A
    call func_005_54C3                            ; $4C5D: $CD $C3 $54

    ; Jump table to execute when Tarin is giving the shield
    ldh  a, [hActiveEntityWalking]                ; $4C60: $F0 $F0
    JP_TABLE                                      ; $4C62: $C7
._00 dw TarinShield0Handler
._01 dw TarinShield1Handler
._02 dw TarinShield2Handler
._03 dw TarinShield3Handler
._04 dw TarinShield4Handler

TarinShield0Handler::
    ld   a, [wShieldLevel]                        ; $4C6D: $FA $44 $DB
    and  a                                        ; $4C70: $A7
    jr   z, jr_005_4C79                           ; $4C71: $28 $06

    call IncrementEntityWalkingAttr               ; $4C73: $CD $12 $3B
    ld   [hl], $03                                ; $4C76: $36 $03
    ret                                           ; $4C78: $C9

jr_005_4C79:
    ldh  a, [hLinkPositionY]                      ; $4C79: $F0 $99
    cp   $7B                                      ; $4C7B: $FE $7B
    jr   c, jr_005_4C88                           ; $4C7D: $38 $09

    sub  $02                                      ; $4C7F: $D6 $02
    ldh  [hLinkPositionY], a                      ; $4C81: $E0 $99
    ld   a, $00                                   ; $4C83: $3E $00
    jp   OpenDialog                               ; $4C85: $C3 $85 $23

jr_005_4C88:
    call func_005_5506                            ; $4C88: $CD $06 $55
    ret  nc                                       ; $4C8B: $D0

    ld   a, $54                                   ; $4C8C: $3E $54
    call OpenDialog                               ; $4C8E: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $4C91: $C3 $12 $3B

; This data is pushed into DC88
data_005_4C94::
    db   $FF, $47, $31, $52, $C5, $28, $00, $00                                  ; $4C9B: $00

TarinShield1Handler::
    ld   a, [wDialogState]                        ; $4C9C: $FA $9F $C1
    and  a                                        ; $4C9F: $A7
    ret  nz                                       ; $4CA0: $C0

    call IsEntityFrameCounterZero                 ; $4CA1: $CD $05 $0C
    ld   [hl], $80                                ; $4CA4: $36 $80
    ld   a, $10                                   ; $4CA6: $3E $10
    ld   [wWorldMusicTrack], a                    ; $4CA8: $EA $68 $D3
    ldh  a, [hIsGBC]                              ; $4CAB: $F0 $FE
    and  a                                        ; $4CAD: $A7
    jr   z, jr_005_4CC3                           ; $4CAE: $28 $13

    ld   hl, $DC88                                ; $4CB0: $21 $88 $DC
    ld   de, data_005_4C94                        ; $4CB3: $11 $94 $4C

jr_005_4CB6:
    ld   a, [de]                                  ; $4CB6: $1A
    ld   [hl+], a                                 ; $4CB7: $22
    inc  de                                       ; $4CB8: $13
    ld   a, l                                     ; $4CB9: $7D
    and  $07                                      ; $4CBA: $E6 $07
    jr   nz, jr_005_4CB6                          ; $4CBC: $20 $F8

    ld   a, $02                                   ; $4CBE: $3E $02
    ld   [wPaletteUnknownA], a                    ; $4CC0: $EA $D1 $DD

jr_005_4CC3:
    jp   IncrementEntityWalkingAttr               ; $4CC3: $C3 $12 $3B

; Shield sprite attributes when getting from Tarin
; Edit this to change sprite
data_005_4cc6::
    db   $86, $17

; Link lifts the shield
TarinShield2Handler::
    ; Wait a number of frames to actually add the shield to the inventory
    call IsEntityFrameCounterZero                 ; $4CC8: $CD $05 $0C
    jr   nz, jr_005_4CE6                          ; $4CCB: $20 $19

    ld   [wC167], a                               ; $4CCD: $EA $67 $C1
    ; Add the shield to the inventory
    ld   d, INVENTORY_SHIELD                      ; $4CD0: $16 $04
    call AssignItemToSlot                         ; $4CD2: $CD $21 $53

    ld   a, $01                                   ; $4CD5: $3E $01
    ld   [wShieldLevel], a                        ; $4CD7: $EA $44 $DB
    ld   a, $22                                   ; $4CDA: $3E $22
    ldh  [hLinkAnimationState], a                 ; $4CDC: $E0 $9D
    ld   a, $91                                   ; $4CDE: $3E $91
    call OpenDialog                               ; $4CE0: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $4CE3: $C3 $12 $3B

jr_005_4CE6:
    ldh  a, [hLinkPositionX]                      ; $4CE6: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $4CE8: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4CEA: $F0 $99
    sub  $0C                                      ; $4CEC: $D6 $0C
    ldh  [wActiveEntityPosY], a                   ; $4CEE: $E0 $EC
    xor  a                                        ; $4CF0: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4CF1: $E0 $F1
    ld   de, data_005_4cc6                        ; $4CF3: $11 $C6 $4C
    call label_3C77                               ; $4CF6: $CD $77 $3C
    call label_3D8A                               ; $4CF9: $CD $8A $3D
    ld   a, $6C                                   ; $4CFC: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4CFE: $E0 $9D
    ld   a, $02                                   ; $4D00: $3E $02
    ldh  [$FFA1], a                               ; $4D02: $E0 $A1
    ld   a, $03                                   ; $4D04: $3E $03
    ldh  [hLinkDirection], a                      ; $4D06: $E0 $9E
    ret                                           ; $4D08: $C9

TarinShield3Handler::
    ld   a, [$DB48]                               ; $4D09: $FA $48 $DB
    and  a                                        ; $4D0C: $A7
    jr   z, jr_005_4D4D                           ; $4D0D: $28 $3E

    cp   $01                                      ; $4D0F: $FE $01
    jr   z, jr_005_4D38                           ; $4D11: $28 $25

    call func_005_5506                            ; $4D13: $CD $06 $55
    jr   nc, jr_005_4D2C                          ; $4D16: $30 $14

    ld   a, [wIsMarinFollowingLink]               ; $4D18: $FA $73 $DB
    and  a                                        ; $4D1B: $A7
    ld   a, $DD                                   ; $4D1C: $3E $DD
    jr   nz, jr_005_4D35                          ; $4D1E: $20 $15

    ld   a, [wTradeSequenceItem]                  ; $4D20: $FA $0E $DB
    cp   $03                                      ; $4D23: $FE $03
    jr   nz, jr_005_4D33                          ; $4D25: $20 $0C

    ld   a, $C5                                   ; $4D27: $3E $C5
    call OpenDialogInTable1                       ; $4D29: $CD $73 $23

jr_005_4D2C:
    ld   a, [wIsMarinFollowingLink]               ; $4D2C: $FA $73 $DB
    and  a                                        ; $4D2F: $A7
    jr   nz, jr_005_4D5D                          ; $4D30: $20 $2B

    ret                                           ; $4D32: $C9

jr_005_4D33:
    ld   a, $C5                                   ; $4D33: $3E $C5

jr_005_4D35:
    jp   OpenDialogInTable1                       ; $4D35: $C3 $73 $23

jr_005_4D38:
    call func_005_5506                            ; $4D38: $CD $06 $55
    jr   nc, jr_005_4D4B                          ; $4D3B: $30 $0E

    ld   a, [wHasInstrument1]                     ; $4D3D: $FA $65 $DB
    bit  1, a                                     ; $4D40: $CB $4F
    ld   a, $11                                   ; $4D42: $3E $11
    jr   z, jr_005_4D48                           ; $4D44: $28 $02

    ld   a, $10                                   ; $4D46: $3E $10

jr_005_4D48:
    call OpenDialog                               ; $4D48: $CD $85 $23

jr_005_4D4B:
    jr   jr_005_4D56                              ; $4D4B: $18 $09

jr_005_4D4D:
    call func_005_5506                            ; $4D4D: $CD $06 $55
    ret  nc                                       ; $4D50: $D0

    ld   a, $55                                   ; $4D51: $3E $55
    jp   OpenDialog                               ; $4D53: $C3 $85 $23

jr_005_4D56:
    ld   a, [$DB48]                               ; $4D56: $FA $48 $DB
    cp   $01                                      ; $4D59: $FE $01
    jr   nz, jr_005_4DA2                          ; $4D5B: $20 $45

jr_005_4D5D:
    ld   hl, $C3D0                                ; $4D5D: $21 $D0 $C3
    add  hl, bc                                   ; $4D60: $09
    ld   a, [hl]                                  ; $4D61: $7E
    add  $07                                      ; $4D62: $C6 $07
    ld   [hl], a                                  ; $4D64: $77
    jr   nc, jr_005_4DA2                          ; $4D65: $30 $3B

    ld   a, $3F                                   ; $4D67: $3E $3F
    call label_3B86                               ; $4D69: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $4D6C: $F0 $D7
    add  $06                                      ; $4D6E: $C6 $06
    ld   hl, wEntity0PosX                         ; $4D70: $21 $00 $C2
    add  hl, de                                   ; $4D73: $19
    ld   [hl], a                                  ; $4D74: $77
    ldh  a, [hScratchB]                           ; $4D75: $F0 $D8
    sub  $03                                      ; $4D77: $D6 $03
    ld   hl, wEntity0PosY                         ; $4D79: $21 $10 $C2
    add  hl, de                                   ; $4D7C: $19
    ld   [hl], a                                  ; $4D7D: $77
    ld   hl, wEntitiesUnknownTableC               ; $4D7E: $21 $C0 $C2
    add  hl, de                                   ; $4D81: $19
    ld   [hl], $01                                ; $4D82: $36 $01
    ld   hl, wEntity0SpeedX                       ; $4D84: $21 $40 $C2
    add  hl, de                                   ; $4D87: $19
    ld   [hl], $FF                                ; $4D88: $36 $FF
    ld   hl, wEntity0SpeedY                       ; $4D8A: $21 $50 $C2
    add  hl, de                                   ; $4D8D: $19
    ld   [hl], $FD                                ; $4D8E: $36 $FD
    ld   hl, wEntitiesFrameCounterTable           ; $4D90: $21 $E0 $C2
    add  hl, de                                   ; $4D93: $19
    ld   [hl], $30                                ; $4D94: $36 $30
    ld   hl, $C340                                ; $4D96: $21 $40 $C3
    add  hl, de                                   ; $4D99: $19
    ld   [hl], $C1                                ; $4D9A: $36 $C1
    ld   hl, $C350                                ; $4D9C: $21 $50 $C3
    add  hl, de                                   ; $4D9F: $19
    ld   [hl], $00                                ; $4DA0: $36 $00

jr_005_4DA2:
    ret                                           ; $4DA2: $C9

TarinShield4Handler::
    ld   a, [wDialogState]                        ; $4DA3: $FA $9F $C1
    and  a                                        ; $4DA6: $A7
    jr   nz, jr_005_4DC6                          ; $4DA7: $20 $1D

    ld   a, [wC177]                               ; $4DA9: $FA $77 $C1
    and  a                                        ; $4DAC: $A7
    jr   nz, jr_005_4DBD                          ; $4DAD: $20 $0E

    ld   a, $04                                   ; $4DAF: $3E $04
    ld   [wTradeSequenceItem], a                  ; $4DB1: $EA $0E $DB
    ld   a, $0D                                   ; $4DB4: $3E $0D
    ldh  [hFFA5], a                               ; $4DB6: $E0 $A5
    call label_C0C                                ; $4DB8: $CD $0C $0C
    jr   jr_005_4DC2                              ; $4DBB: $18 $05

jr_005_4DBD:
    ld   a, $C9                                   ; $4DBD: $3E $C9
    call OpenDialogInTable1                       ; $4DBF: $CD $73 $23

jr_005_4DC2:
    call IncrementEntityWalkingAttr               ; $4DC2: $CD $12 $3B
    ld   [hl], b                                  ; $4DC5: $70

jr_005_4DC6:
    ret                                           ; $4DC6: $C9

    ld   [hl], h                                  ; $4DC7: $74
    rlca                                          ; $4DC8: $07
    db   $76                                      ; $4DC9: $76
    rlca                                          ; $4DCA: $07
    ld   [hl], b                                  ; $4DCB: $70
    nop                                           ; $4DCC: $00
    ld   [hl], d                                  ; $4DCD: $72
    nop                                           ; $4DCE: $00

func_005_4DCF:
    ld   a, [$DB48]                               ; $4DCF: $FA $48 $DB
    cp   $02                                      ; $4DD2: $FE $02
    ret  nz                                       ; $4DD4: $C0

    ld   a, [wTradeSequenceItem]                  ; $4DD5: $FA $0E $DB
    cp   $04                                      ; $4DD8: $FE $04
    jr   nc, jr_005_4DE3                          ; $4DDA: $30 $07

    ld   a, $78                                   ; $4DDC: $3E $78
    ld   de, $4DC7                                ; $4DDE: $11 $C7 $4D
    jr   jr_005_4DF3                              ; $4DE1: $18 $10

jr_005_4DE3:
    ldh  a, [hRoomStatus]                         ; $4DE3: $F0 $F8
    and  $20                                      ; $4DE5: $E6 $20
    ret  z                                        ; $4DE7: $C8

    ld   hl, wEntity0PosY                         ; $4DE8: $21 $10 $C2
    add  hl, bc                                   ; $4DEB: $09
    ld   [hl], $4B                                ; $4DEC: $36 $4B
    ld   de, $4DCB                                ; $4DEE: $11 $CB $4D
    ld   a, $7C                                   ; $4DF1: $3E $7C

jr_005_4DF3:
    ldh  [wActiveEntityPosX], a                   ; $4DF3: $E0 $EE
    ld   a, $5C                                   ; $4DF5: $3E $5C
    ldh  [wActiveEntityPosY], a                   ; $4DF7: $E0 $EC
    xor  a                                        ; $4DF9: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4DFA: $E0 $F1
    call label_3BC0                               ; $4DFC: $CD $C0 $3B
    call label_3D8A                               ; $4DFF: $CD $8A $3D
    ld   hl, wEntitiesUnknownTableG               ; $4E02: $21 $B0 $C3
    add  hl, bc                                   ; $4E05: $09
    ld   a, [hl]                                  ; $4E06: $7E
    ldh  [hActiveEntityUnknownG], a               ; $4E07: $E0 $F1
    ret                                           ; $4E09: $C9

    ld   h, b                                     ; $4E0A: $60
    ld   bc, $0162                                ; $4E0B: $01 $62 $01
    ld   h, d                                     ; $4E0E: $62
    ld   hl, $2160                                ; $4E0F: $21 $60 $21
    ld   h, h                                     ; $4E12: $64
    ld   bc, $0166                                ; $4E13: $01 $66 $01
    ld   h, [hl]                                  ; $4E16: $66
    ld   hl, $2164                                ; $4E17: $21 $64 $21
    ld   l, b                                     ; $4E1A: $68
    ld   bc, $016A                                ; $4E1B: $01 $6A $01
    ld   l, h                                     ; $4E1E: $6C
    ld   bc, Start.notGBC                         ; $4E1F: $01 $6E $01
    ld   l, d                                     ; $4E22: $6A
    ld   hl, $2168                                ; $4E23: $21 $68 $21
    ld   l, [hl]                                  ; $4E26: $6E
    ld   hl, $216C                                ; $4E27: $21 $6C $21
    ld   l, b                                     ; $4E2A: $68
    ld   bc, $016A                                ; $4E2B: $01 $6A $01
    ld   l, d                                     ; $4E2E: $6A
    ld   hl, $2168                                ; $4E2F: $21 $68 $21
    ld   h, [hl]                                  ; $4E32: $66
    ld   bc, $2166                                ; $4E33: $01 $66 $21
    ld   h, [hl]                                  ; $4E36: $66
    ld   bc, $2166                                ; $4E37: $01 $66 $21
    ld   l, h                                     ; $4E3A: $6C
    ld   bc, Start.notGBC                         ; $4E3B: $01 $6E $01
    ld   l, h                                     ; $4E3E: $6C
    ld   bc, Start.notGBC                         ; $4E3F: $01 $6E $01
    ld   l, [hl]                                  ; $4E42: $6E
    ld   hl, $216C                                ; $4E43: $21 $6C $21
    ld   l, [hl]                                  ; $4E46: $6E
    ld   hl, $216C                                ; $4E47: $21 $6C $21
    ld   h, b                                     ; $4E4A: $60
    ld   bc, $0162                                ; $4E4B: $01 $62 $01
    ld   h, h                                     ; $4E4E: $64
    ld   bc, $2164                                ; $4E4F: $01 $64 $21
    ld   h, d                                     ; $4E52: $62
    ld   hl, $2160                                ; $4E53: $21 $60 $21
    ld   [label_808], sp                          ; $4E56: $08 $08 $08
    add  hl, bc                                   ; $4E59: $09
    ld   a, [bc]                                  ; $4E5A: $0A
    ld   a, [bc]                                  ; $4E5B: $0A
    ld   a, [bc]                                  ; $4E5C: $0A
    add  hl, bc                                   ; $4E5D: $09
    ld   [$06F8], sp                              ; $4E5E: $08 $F8 $06
    ld   bc, $95FA                                ; $4E61: $01 $FA $95
    db   $DB                                      ; $4E64: $DB
    cp   $01                                      ; $4E65: $FE $01
    jp   z, label_005_4EE0                        ; $4E67: $CA $E0 $4E

    ld   a, [wIsMarinFollowingLink]               ; $4E6A: $FA $73 $DB
    and  a                                        ; $4E6D: $A7
    jp   nz, label_005_7B4B                       ; $4E6E: $C2 $4B $7B

    ld   a, [wIsIndoor]                           ; $4E71: $FA $A5 $DB
    and  a                                        ; $4E74: $A7
    jp   nz, $51CE                                ; $4E75: $C2 $CE $51

    ld   a, [wSwordLevel]                         ; $4E78: $FA $4E $DB
    and  a                                        ; $4E7B: $A7
    jp   z, label_005_7B4B                        ; $4E7C: $CA $4B $7B

    ldh  a, [hMapRoom]                            ; $4E7F: $F0 $F6
    cp   $C0                                      ; $4E81: $FE $C0
    jr   c, jr_005_4E87                           ; $4E83: $38 $02

    jr   jr_005_4E96                              ; $4E85: $18 $0F

jr_005_4E87:
    ld   a, [$D808]                               ; $4E87: $FA $08 $D8
    and  $10                                      ; $4E8A: $E6 $10
    jr   nz, jr_005_4E96                          ; $4E8C: $20 $08

    ld   a, [wTradeSequenceItem]                  ; $4E8E: $FA $0E $DB
    cp   $07                                      ; $4E91: $FE $07
    jp   nc, label_005_7B4B                       ; $4E93: $D2 $4B $7B

jr_005_4E96:
    push bc                                       ; $4E96: $C5
    sla  c                                        ; $4E97: $CB $21
    rl   b                                        ; $4E99: $CB $10
    sla  c                                        ; $4E9B: $CB $21
    rl   b                                        ; $4E9D: $CB $10
    ld   hl, $D580                                ; $4E9F: $21 $80 $D5
    add  hl, bc                                   ; $4EA2: $09
    inc  hl                                       ; $4EA3: $23
    inc  hl                                       ; $4EA4: $23
    ld   [hl], $08                                ; $4EA5: $36 $08
    inc  hl                                       ; $4EA7: $23
    ld   [hl], $0B                                ; $4EA8: $36 $0B
    pop  bc                                       ; $4EAA: $C1
    ldh  a, [hFrameCounter]                       ; $4EAB: $F0 $E7
    and  $1F                                      ; $4EAD: $E6 $1F
    jr   nz, jr_005_4ED1                          ; $4EAF: $20 $20

    ld   hl, $C380                                ; $4EB1: $21 $80 $C3
    add  hl, bc                                   ; $4EB4: $09
    ld   [hl], $03                                ; $4EB5: $36 $03
    call func_005_7B04                            ; $4EB7: $CD $04 $7B
    add  $14                                      ; $4EBA: $C6 $14
    cp   $28                                      ; $4EBC: $FE $28
    jr   nc, jr_005_4ED1                          ; $4EBE: $30 $11

    call func_005_7B14                            ; $4EC0: $CD $14 $7B
    add  $14                                      ; $4EC3: $C6 $14
    cp   $28                                      ; $4EC5: $FE $28
    jr   nc, jr_005_4ED1                          ; $4EC7: $30 $08

    call func_005_7B24                            ; $4EC9: $CD $24 $7B
    ld   hl, $C380                                ; $4ECC: $21 $80 $C3
    add  hl, bc                                   ; $4ECF: $09
    ld   [hl], e                                  ; $4ED0: $73

jr_005_4ED1:
    call func_005_54EA                            ; $4ED1: $CD $EA $54
    ld   a, [$C3C8]                               ; $4ED4: $FA $C8 $C3
    cp   $01                                      ; $4ED7: $FE $01
    jr   nz, jr_005_4F39                          ; $4ED9: $20 $5E

    call label_C00                                ; $4EDB: $CD $00 $0C
    jr   nz, jr_005_4F39                          ; $4EDE: $20 $59

label_005_4EE0:
    ldh  a, [hFrameCounter]                       ; $4EE0: $F0 $E7
    rra                                           ; $4EE2: $1F
    rra                                           ; $4EE3: $1F
    rra                                           ; $4EE4: $1F
    rra                                           ; $4EE5: $1F
    and  $07                                      ; $4EE6: $E6 $07
    ld   e, a                                     ; $4EE8: $5F
    ld   d, b                                     ; $4EE9: $50
    ld   hl, $4E56                                ; $4EEA: $21 $56 $4E
    add  hl, de                                   ; $4EED: $19
    ld   a, [hl]                                  ; $4EEE: $7E
    ldh  [hActiveEntityUnknownG], a               ; $4EEF: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $4EF1: $F0 $E7
    add  $10                                      ; $4EF3: $C6 $10
    and  $1F                                      ; $4EF5: $E6 $1F
    jr   nz, jr_005_4F39                          ; $4EF7: $20 $40

    ld   a, $C9                                   ; $4EF9: $3E $C9
    call label_3B86                               ; $4EFB: $CD $86 $3B
    jr   c, jr_005_4F39                           ; $4EFE: $38 $39

    ldh  a, [hScratchB]                           ; $4F00: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4F02: $21 $10 $C2
    add  hl, de                                   ; $4F05: $19
    sub  $08                                      ; $4F06: $D6 $08
    ld   [hl], a                                  ; $4F08: $77
    push bc                                       ; $4F09: $C5
    ldh  a, [hFrameCounter]                       ; $4F0A: $F0 $E7
    add  $10                                      ; $4F0C: $C6 $10
    rra                                           ; $4F0E: $1F
    rra                                           ; $4F0F: $1F
    rra                                           ; $4F10: $1F
    rra                                           ; $4F11: $1F
    rra                                           ; $4F12: $1F
    and  $01                                      ; $4F13: $E6 $01
    ld   c, a                                     ; $4F15: $4F
    ld   hl, $4E5E                                ; $4F16: $21 $5E $4E
    add  hl, bc                                   ; $4F19: $09
    ldh  a, [hScratchA]                           ; $4F1A: $F0 $D7
    add  [hl]                                     ; $4F1C: $86
    ld   hl, wEntity0PosX                         ; $4F1D: $21 $00 $C2
    add  hl, de                                   ; $4F20: $19
    ld   [hl], a                                  ; $4F21: $77
    ld   hl, $4E60                                ; $4F22: $21 $60 $4E
    add  hl, bc                                   ; $4F25: $09
    ld   a, [hl]                                  ; $4F26: $7E
    ld   hl, wEntity0SpeedX                       ; $4F27: $21 $40 $C2
    add  hl, de                                   ; $4F2A: $19
    ld   [hl], a                                  ; $4F2B: $77
    ld   hl, wEntity0SpeedY                       ; $4F2C: $21 $50 $C2
    add  hl, de                                   ; $4F2F: $19
    ld   [hl], $FC                                ; $4F30: $36 $FC
    ld   hl, $C3D0                                ; $4F32: $21 $D0 $C3
    add  hl, de                                   ; $4F35: $19
    ld   [hl], $40                                ; $4F36: $36 $40
    pop  bc                                       ; $4F38: $C1

jr_005_4F39:
    ld   a, c                                     ; $4F39: $79
    ld   [$C50F], a                               ; $4F3A: $EA $0F $C5
    ld   de, $4E2A                                ; $4F3D: $11 $2A $4E
    call label_3BC0                               ; $4F40: $CD $C0 $3B
    call func_005_54C3                            ; $4F43: $CD $C3 $54
    ld   a, [wGameplayType]                       ; $4F46: $FA $95 $DB
    cp   $07                                      ; $4F49: $FE $07
    ret  z                                        ; $4F4B: $C8

    cp   $0B                                      ; $4F4C: $FE $0B
    ret  nz                                       ; $4F4E: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4F4F: $FA $6B $C1
    cp   $04                                      ; $4F52: $FE $04
    ret  nz                                       ; $4F54: $C0

    ldh  a, [hActiveEntityWalking]                ; $4F55: $F0 $F0
    rst  $00                                      ; $4F57: $C7
    ld   h, h                                     ; $4F58: $64
    ld   c, a                                     ; $4F59: $4F
    jr   nz, jr_005_4FAC                          ; $4F5A: $20 $50

    ld   e, c                                     ; $4F5C: $59
    ld   d, b                                     ; $4F5D: $50
    dec  hl                                       ; $4F5E: $2B
    ld   d, c                                     ; $4F5F: $51
    ld   h, c                                     ; $4F60: $61
    ld   d, c                                     ; $4F61: $51
    cp   h                                        ; $4F62: $BC
    ld   d, c                                     ; $4F63: $51
    ldh  a, [hMapRoom]                            ; $4F64: $F0 $F6
    cp   $C0                                      ; $4F66: $FE $C0
    jr   nc, jr_005_4F6F                          ; $4F68: $30 $05

    ld   a, [$C3C8]                               ; $4F6A: $FA $C8 $C3
    and  a                                        ; $4F6D: $A7
    ret  nz                                       ; $4F6E: $C0

jr_005_4F6F:
    call func_005_5506                            ; $4F6F: $CD $06 $55
    ret  nc                                       ; $4F72: $D0

    ld   a, [$D808]                               ; $4F73: $FA $08 $D8
    and  $10                                      ; $4F76: $E6 $10
    jr   z, jr_005_4FA7                           ; $4F78: $28 $2D

    ld   hl, $D892                                ; $4F7A: $21 $92 $D8
    ld   a, [hl]                                  ; $4F7D: $7E
    and  $40                                      ; $4F7E: $E6 $40
    jr   nz, jr_005_4F89                          ; $4F80: $20 $07

    set  6, [hl]                                  ; $4F82: $CB $F6
    ld   a, $94                                   ; $4F84: $3E $94
    jp   OpenDialogInTable1                       ; $4F86: $C3 $73 $23

jr_005_4F89:
    ld   a, [$DB49]                               ; $4F89: $FA $49 $DB
    and  $04                                      ; $4F8C: $E6 $04
    jr   z, jr_005_4F95                           ; $4F8E: $28 $05

jr_005_4F90:
    ld   a, $95                                   ; $4F90: $3E $95
    jp   OpenDialogInTable1                       ; $4F92: $C3 $73 $23

jr_005_4F95:
    ld   e, $0B                                   ; $4F95: $1E $0B
    ld   hl, wAButtonSlot                         ; $4F97: $21 $00 $DB

jr_005_4F9A:
    ld   a, [hl+]                                 ; $4F9A: $2A
    cp   $09                                      ; $4F9B: $FE $09
    jr   z, jr_005_4FA7                           ; $4F9D: $28 $08

    dec  e                                        ; $4F9F: $1D
    ld   a, e                                     ; $4FA0: $7B
    cp   $FF                                      ; $4FA1: $FE $FF
    jr   nz, jr_005_4F9A                          ; $4FA3: $20 $F5

    jr   jr_005_4F90                              ; $4FA5: $18 $E9

jr_005_4FA7:
    call label_C00                                ; $4FA7: $CD $00 $0C
    ld   [hl], $10                                ; $4FAA: $36 $10

jr_005_4FAC:
    ld   d, $2F                                   ; $4FAC: $16 $2F
    ld   e, $03                                   ; $4FAE: $1E $03
    ld   a, [$DB48]                               ; $4FB0: $FA $48 $DB
    and  a                                        ; $4FB3: $A7
    jr   z, jr_005_4FFB                           ; $4FB4: $28 $45

    ld   e, $06                                   ; $4FB6: $1E $06
    cp   $02                                      ; $4FB8: $FE $02
    jr   nz, jr_005_4FD0                          ; $4FBA: $20 $14

    ld   e, $05                                   ; $4FBC: $1E $05
    ldh  a, [hMapRoom]                            ; $4FBE: $F0 $F6
    cp   $C0                                      ; $4FC0: $FE $C0
    jr   c, jr_005_4FD0                           ; $4FC2: $38 $0C

    push de                                       ; $4FC4: $D5
    call label_27DD                               ; $4FC5: $CD $DD $27
    pop  de                                       ; $4FC8: $D1
    ld   hl, wEntitiesUnknownTableD               ; $4FC9: $21 $D0 $C2
    add  hl, bc                                   ; $4FCC: $09
    ld   [hl], b                                  ; $4FCD: $70
    ld   e, $92                                   ; $4FCE: $1E $92

jr_005_4FD0:
    push bc                                       ; $4FD0: $C5
    ld   c, $0B                                   ; $4FD1: $0E $0B
    ld   hl, wAButtonSlot                         ; $4FD3: $21 $00 $DB

jr_005_4FD6:
    ld   a, [hl+]                                 ; $4FD6: $2A
    cp   $09                                      ; $4FD7: $FE $09
    jr   nz, jr_005_4FF4                          ; $4FD9: $20 $19

    ld   e, $04                                   ; $4FDB: $1E $04
    ld   d, $4A                                   ; $4FDD: $16 $4A
    ld   a, [$DB49]                               ; $4FDF: $FA $49 $DB
    and  $04                                      ; $4FE2: $E6 $04
    jr   z, jr_005_4FFA                           ; $4FE4: $28 $14

    ld   e, $05                                   ; $4FE6: $1E $05
    ld   d, $2F                                   ; $4FE8: $16 $2F
    ldh  a, [hMapRoom]                            ; $4FEA: $F0 $F6
    cp   $C0                                      ; $4FEC: $FE $C0
    jr   c, jr_005_4FFA                           ; $4FEE: $38 $0A

    ld   e, $92                                   ; $4FF0: $1E $92
    jr   jr_005_4FFA                              ; $4FF2: $18 $06

jr_005_4FF4:
    dec  c                                        ; $4FF4: $0D
    ld   a, c                                     ; $4FF5: $79
    cp   $FF                                      ; $4FF6: $FE $FF
    jr   nz, jr_005_4FD6                          ; $4FF8: $20 $DC

jr_005_4FFA:
    pop  bc                                       ; $4FFA: $C1

jr_005_4FFB:
    ld   a, e                                     ; $4FFB: $7B
    cp   $80                                      ; $4FFC: $FE $80
    jr   c, jr_005_5005                           ; $4FFE: $38 $05

    call OpenDialogInTable1                       ; $5000: $CD $73 $23
    jr   jr_005_5008                              ; $5003: $18 $03

jr_005_5005:
    call OpenDialog                               ; $5005: $CD $85 $23

jr_005_5008:
    ldh  a, [hMapRoom]                            ; $5008: $F0 $F6
    cp   $C0                                      ; $500A: $FE $C0
    jr   c, jr_005_5018                           ; $500C: $38 $0A

    ld   hl, wEntitiesUnknownTableD               ; $500E: $21 $D0 $C2
    add  hl, bc                                   ; $5011: $09
    ld   [hl], b                                  ; $5012: $70
    push de                                       ; $5013: $D5
    call label_27DD                               ; $5014: $CD $DD $27
    pop  de                                       ; $5017: $D1

jr_005_5018:
    ld   hl, $C440                                ; $5018: $21 $40 $C4
    add  hl, bc                                   ; $501B: $09
    ld   [hl], d                                  ; $501C: $72
    jp   IncrementEntityWalkingAttr               ; $501D: $C3 $12 $3B

    call func_005_7A3A                            ; $5020: $CD $3A $7A
    ld   hl, $C440                                ; $5023: $21 $40 $C4
    add  hl, bc                                   ; $5026: $09
    ld   d, [hl]                                  ; $5027: $56
    ld   hl, wEntitiesUnknownTableD               ; $5028: $21 $D0 $C2
    add  hl, bc                                   ; $502B: $09
    ld   a, [hl]                                  ; $502C: $7E
    and  a                                        ; $502D: $A7
    ld   a, d                                     ; $502E: $7A
    jr   nz, jr_005_503E                          ; $502F: $20 $0D

    inc  [hl]                                     ; $5031: $34
    ld   [wWorldMusicTrack], a                    ; $5032: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $5035: $E0 $B0
    ldh  [$FFBD], a                               ; $5037: $E0 $BD
    ld   hl, $C3C8                                ; $5039: $21 $C8 $C3
    ld   [hl], $01                                ; $503C: $36 $01

jr_005_503E:
    cp   $4A                                      ; $503E: $FE $4A
    jr   nz, jr_005_5054                          ; $5040: $20 $12

    ld   a, [$DB49]                               ; $5042: $FA $49 $DB
    and  $04                                      ; $5045: $E6 $04
    jr   nz, jr_005_5054                          ; $5047: $20 $0B

    call IncrementEntityWalkingAttr               ; $5049: $CD $12 $3B
    xor  a                                        ; $504C: $AF
    ld   [$D210], a                               ; $504D: $EA $10 $D2
    ld   [$D211], a                               ; $5050: $EA $11 $D2
    ret                                           ; $5053: $C9

jr_005_5054:
    call IncrementEntityWalkingAttr               ; $5054: $CD $12 $3B
    ld   [hl], b                                  ; $5057: $70
    ret                                           ; $5058: $C9

    ld   a, $02                                   ; $5059: $3E $02
    ldh  [$FFA1], a                               ; $505B: $E0 $A1
    ld   [wC167], a                               ; $505D: $EA $67 $C1
    push bc                                       ; $5060: $C5
    call $0BF0                                    ; $5061: $CD $F0 $0B
    pop  bc                                       ; $5064: $C1
    ld   a, [$D211]                               ; $5065: $FA $11 $D2
    cp   $07                                      ; $5068: $FE $07
    jr   nz, jr_005_508A                          ; $506A: $20 $1E

    ld   a, [$D210]                               ; $506C: $FA $10 $D2
    cp   $E8                                      ; $506F: $FE $E8
    jr   nz, jr_005_508A                          ; $5071: $20 $17

    ld   a, $16                                   ; $5073: $3E $16
    call OpenDialog                               ; $5075: $CD $85 $23
    push bc                                       ; $5078: $C5
    call $0BF0                                    ; $5079: $CD $F0 $0B
    pop  bc                                       ; $507C: $C1
    xor  a                                        ; $507D: $AF
    ld   [$D210], a                               ; $507E: $EA $10 $D2
    ld   [$D211], a                               ; $5081: $EA $11 $D2
    call label_27F2                               ; $5084: $CD $F2 $27
    jp   IncrementEntityWalkingAttr               ; $5087: $C3 $12 $3B

jr_005_508A:
    call func_005_7B24                            ; $508A: $CD $24 $7B
    ld   a, e                                     ; $508D: $7B
    xor  $01                                      ; $508E: $EE $01
    ldh  [hLinkDirection], a                      ; $5090: $E0 $9E
    ld   a, [$D210]                               ; $5092: $FA $10 $D2
    add  $01                                      ; $5095: $C6 $01
    ld   [$D210], a                               ; $5097: $EA $10 $D2
    ld   e, a                                     ; $509A: $5F
    ld   a, [$D211]                               ; $509B: $FA $11 $D2
    adc  $00                                      ; $509E: $CE $00
    ld   [$D211], a                               ; $50A0: $EA $11 $D2
    ld   d, a                                     ; $50A3: $57
    ld   a, [$D211]                               ; $50A4: $FA $11 $D2
    cp   $07                                      ; $50A7: $FE $07
    jr   nz, jr_005_50B7                          ; $50A9: $20 $0C

    ld   a, [$D210]                               ; $50AB: $FA $10 $D2
    cp   $E0                                      ; $50AE: $FE $E0
    jr   c, jr_005_50B7                           ; $50B0: $38 $05

    xor  a                                        ; $50B2: $AF
    ld   [$C3C8], a                               ; $50B3: $EA $C8 $C3
    ret                                           ; $50B6: $C9

jr_005_50B7:
    ld   hl, $C3C8                                ; $50B7: $21 $C8 $C3
    ld   [hl], $01                                ; $50BA: $36 $01
    ld   a, e                                     ; $50BC: $7B
    srl  d                                        ; $50BD: $CB $3A
    rra                                           ; $50BF: $1F
    srl  d                                        ; $50C0: $CB $3A
    rra                                           ; $50C2: $1F
    srl  d                                        ; $50C3: $CB $3A
    rra                                           ; $50C5: $1F
    srl  d                                        ; $50C6: $CB $3A
    rra                                           ; $50C8: $1F
    cp   $1D                                      ; $50C9: $FE $1D
    jr   c, jr_005_50D2                           ; $50CB: $38 $05

    cp   $3B                                      ; $50CD: $FE $3B
    jr   nc, jr_005_50D2                          ; $50CF: $30 $01

    inc  [hl]                                     ; $50D1: $34

jr_005_50D2:
    cp   $1D                                      ; $50D2: $FE $1D
    ret  c                                        ; $50D4: $D8

    ld   a, $00                                   ; $50D5: $3E $00
    ldh  [hLinkAnimationState], a                 ; $50D7: $E0 $9D
    ldh  a, [hFrameCounter]                       ; $50D9: $F0 $E7
    ld   e, $75                                   ; $50DB: $1E $75
    and  $40                                      ; $50DD: $E6 $40
    jr   z, jr_005_50E2                           ; $50DF: $28 $01

    inc  e                                        ; $50E1: $1C

jr_005_50E2:
    ld   a, e                                     ; $50E2: $7B
    ldh  [hLinkAnimationState], a                 ; $50E3: $E0 $9D
    ldh  a, [hFrameCounter]                       ; $50E5: $F0 $E7
    and  $1F                                      ; $50E7: $E6 $1F
    jr   nz, jr_005_512A                          ; $50E9: $20 $3F

    ld   a, $C9                                   ; $50EB: $3E $C9
    call label_3B86                               ; $50ED: $CD $86 $3B
    jr   c, jr_005_512A                           ; $50F0: $38 $38

    ldh  a, [hLinkPositionY]                      ; $50F2: $F0 $99
    ld   hl, wEntity0PosY                         ; $50F4: $21 $10 $C2
    add  hl, de                                   ; $50F7: $19
    sub  $08                                      ; $50F8: $D6 $08
    ld   [hl], a                                  ; $50FA: $77
    push bc                                       ; $50FB: $C5
    ldh  a, [hFrameCounter]                       ; $50FC: $F0 $E7
    rra                                           ; $50FE: $1F
    rra                                           ; $50FF: $1F
    rra                                           ; $5100: $1F
    rra                                           ; $5101: $1F
    rra                                           ; $5102: $1F
    and  $01                                      ; $5103: $E6 $01
    ld   c, a                                     ; $5105: $4F
    ld   b, d                                     ; $5106: $42
    ld   hl, $4E5E                                ; $5107: $21 $5E $4E
    add  hl, bc                                   ; $510A: $09
    ldh  a, [hLinkPositionX]                      ; $510B: $F0 $98
    add  [hl]                                     ; $510D: $86
    ld   hl, wEntity0PosX                         ; $510E: $21 $00 $C2
    add  hl, de                                   ; $5111: $19
    ld   [hl], a                                  ; $5112: $77
    ld   hl, $4E60                                ; $5113: $21 $60 $4E
    add  hl, bc                                   ; $5116: $09
    ld   a, [hl]                                  ; $5117: $7E
    ld   hl, wEntity0SpeedX                       ; $5118: $21 $40 $C2
    add  hl, de                                   ; $511B: $19
    ld   [hl], a                                  ; $511C: $77
    pop  bc                                       ; $511D: $C1
    ld   hl, wEntity0SpeedY                       ; $511E: $21 $50 $C2
    add  hl, de                                   ; $5121: $19
    ld   [hl], $FC                                ; $5122: $36 $FC
    ld   hl, $C3D0                                ; $5124: $21 $D0 $C3
    add  hl, de                                   ; $5127: $19
    ld   [hl], $40                                ; $5128: $36 $40

jr_005_512A:
    ret                                           ; $512A: $C9

    ld   a, [wDialogState]                        ; $512B: $FA $9F $C1
    and  a                                        ; $512E: $A7
    jr   nz, jr_005_515E                          ; $512F: $20 $2D

    call IncrementEntityWalkingAttr               ; $5131: $CD $12 $3B
    ld   a, [wC177]                               ; $5134: $FA $77 $C1
    and  a                                        ; $5137: $A7
    jr   nz, jr_005_514F                          ; $5138: $20 $15

    ld   a, $01                                   ; $513A: $3E $01
    ld   [$DE00], a                               ; $513C: $EA $00 $DE
    ld   a, $10                                   ; $513F: $3E $10
    ld   [wWorldMusicTrack], a                    ; $5141: $EA $68 $D3
    ld   a, $05                                   ; $5144: $3E $05
    call label_AC6                                ; $5146: $CD $C6 $0A
    call IsEntityFrameCounterZero                 ; $5149: $CD $05 $0C
    ld   [hl], $80                                ; $514C: $36 $80
    ret                                           ; $514E: $C9

jr_005_514F:
    ld   a, $15                                   ; $514F: $3E $15
    call OpenDialog                               ; $5151: $CD $85 $23
    call IncrementEntityWalkingAttr               ; $5154: $CD $12 $3B
    ld   [hl], $01                                ; $5157: $36 $01
    ld   hl, wEntitiesUnknownTableD               ; $5159: $21 $D0 $C2
    add  hl, bc                                   ; $515C: $09
    ld   [hl], b                                  ; $515D: $70

jr_005_515E:
    ret                                           ; $515E: $C9

    sub  b                                        ; $515F: $90
    rla                                           ; $5160: $17
    ld   a, $01                                   ; $5161: $3E $01
    ld   [$DE00], a                               ; $5163: $EA $00 $DE
    call IsEntityFrameCounterZero                 ; $5166: $CD $05 $0C
    jr   nz, jr_005_5197                          ; $5169: $20 $2C

    ld   a, [wDialogState]                        ; $516B: $FA $9F $C1
    and  a                                        ; $516E: $A7
    ret  nz                                       ; $516F: $C0

    ld   hl, $DB49                                ; $5170: $21 $49 $DB
    set  2, [hl]                                  ; $5173: $CB $D6
    xor  a                                        ; $5175: $AF
    ld   [$DB4A], a                               ; $5176: $EA $4A $DB
    call IncrementEntityWalkingAttr               ; $5179: $CD $12 $3B
    ldh  a, [hMapRoom]                            ; $517C: $F0 $F6
    cp   $C0                                      ; $517E: $FE $C0
    jr   c, jr_005_5183                           ; $5180: $38 $01

    ld   [hl], b                                  ; $5182: $70

jr_005_5183:
    xor  a                                        ; $5183: $AF
    ld   [wC167], a                               ; $5184: $EA $67 $C1
    ldh  a, [hMapRoom]                            ; $5187: $F0 $F6
    cp   $C0                                      ; $5189: $FE $C0
    jr   nc, jr_005_5192                          ; $518B: $30 $05

    ld   a, $14                                   ; $518D: $3E $14
    jp   OpenDialog                               ; $518F: $C3 $85 $23

jr_005_5192:
    ld   a, $93                                   ; $5192: $3E $93
    jp   OpenDialogInTable1                       ; $5194: $C3 $73 $23

jr_005_5197:
    cp   $08                                      ; $5197: $FE $08
    jr   nz, jr_005_51A1                          ; $5199: $20 $06

    dec  [hl]                                     ; $519B: $35
    ld   a, $13                                   ; $519C: $3E $13
    call OpenDialog                               ; $519E: $CD $85 $23

jr_005_51A1:
    ld   a, $6C                                   ; $51A1: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $51A3: $E0 $9D
    ld   a, $02                                   ; $51A5: $3E $02
    ldh  [$FFA1], a                               ; $51A7: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $51A9: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $51AB: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $51AD: $F0 $99
    sub  $0C                                      ; $51AF: $D6 $0C
    ldh  [wActiveEntityPosY], a                   ; $51B1: $E0 $EC
    ld   de, $515F                                ; $51B3: $11 $5F $51
    xor  a                                        ; $51B6: $AF
    ldh  [hActiveEntityUnknownG], a               ; $51B7: $E0 $F1
    jp   label_3C77                               ; $51B9: $C3 $77 $3C

    ld   a, [wDialogState]                        ; $51BC: $FA $9F $C1
    and  a                                        ; $51BF: $A7
    ret  nz                                       ; $51C0: $C0

    call func_005_5506                            ; $51C1: $CD $06 $55
    ret  nc                                       ; $51C4: $D0

    ld   a, $97                                   ; $51C5: $3E $97
    jp   OpenDialogInTable1                       ; $51C7: $C3 $73 $23

    ld   e, h                                     ; $51CA: $5C
    nop                                           ; $51CB: $00
    ld   e, h                                     ; $51CC: $5C
    jr   nz, @-$04                                ; $51CD: $20 $FA

    ld   c, $DB                                   ; $51CF: $0E $DB
    cp   $07                                      ; $51D1: $FE $07
    jr   c, jr_005_51FB                           ; $51D3: $38 $26

    ld   a, [$D8FD]                               ; $51D5: $FA $FD $D8
    and  $30                                      ; $51D8: $E6 $30
    jp   nz, label_005_7B4B                       ; $51DA: $C2 $4B $7B

    ld   hl, wEntity0PosY                         ; $51DD: $21 $10 $C2
    add  hl, bc                                   ; $51E0: $09
    ld   [hl], $60                                ; $51E1: $36 $60
    ld   hl, wEntity0PosX                         ; $51E3: $21 $00 $C2
    add  hl, bc                                   ; $51E6: $09
    ld   [hl], $7A                                ; $51E7: $36 $7A
    ld   de, $51CA                                ; $51E9: $11 $CA $51
    call label_3BC0                               ; $51EC: $CD $C0 $3B
    call func_005_7A3A                            ; $51EF: $CD $3A $7A
    call func_005_5506                            ; $51F2: $CD $06 $55
    ret  nc                                       ; $51F5: $D0

    ld   a, $D7                                   ; $51F6: $3E $D7
    jp   OpenDialogInTable1                       ; $51F8: $C3 $73 $23

jr_005_51FB:
    ld   a, [wSwordLevel]                         ; $51FB: $FA $4E $DB
    and  a                                        ; $51FE: $A7
    jp   nz, label_005_7B4B                       ; $51FF: $C2 $4B $7B

    ld   a, [wShieldLevel]                        ; $5202: $FA $44 $DB
    and  a                                        ; $5205: $A7
    jr   z, jr_005_5211                           ; $5206: $28 $09

    ld   hl, wEntitiesWalkingTable                ; $5208: $21 $90 $C2
    add  hl, bc                                   ; $520B: $09
    ld   a, $03                                   ; $520C: $3E $03
    ld   [hl], a                                  ; $520E: $77
    ldh  [hActiveEntityWalking], a                ; $520F: $E0 $F0

jr_005_5211:
    ldh  a, [hActiveEntityWalking]                ; $5211: $F0 $F0
    and  a                                        ; $5213: $A7
    jr   nz, jr_005_5237                          ; $5214: $20 $21

    call label_BFB                                ; $5216: $CD $FB $0B
    ld   [hl], $7F                                ; $5219: $36 $7F
    ld   hl, $C380                                ; $521B: $21 $80 $C3
    add  hl, bc                                   ; $521E: $09
    ld   [hl], $01                                ; $521F: $36 $01
    ld   hl, wEntity0PosX                         ; $5221: $21 $00 $C2
    add  hl, bc                                   ; $5224: $09
    ld   a, [hl]                                  ; $5225: $7E
    sub  $08                                      ; $5226: $D6 $08
    ld   [hl], a                                  ; $5228: $77
    ld   hl, wEntity0PosY                         ; $5229: $21 $10 $C2
    add  hl, bc                                   ; $522C: $09
    ld   a, [hl]                                  ; $522D: $7E
    sub  $08                                      ; $522E: $D6 $08
    ld   [hl], a                                  ; $5230: $77
    ld   [wC167], a                               ; $5231: $EA $67 $C1
    jp   IncrementEntityWalkingAttr               ; $5234: $C3 $12 $3B

jr_005_5237:
    ldh  a, [hFrameCounter]                       ; $5237: $F0 $E7
    and  $1F                                      ; $5239: $E6 $1F
    jr   nz, jr_005_5245                          ; $523B: $20 $08

    call func_005_7B24                            ; $523D: $CD $24 $7B
    ld   hl, $C380                                ; $5240: $21 $80 $C3
    add  hl, bc                                   ; $5243: $09
    ld   [hl], e                                  ; $5244: $73

jr_005_5245:
    call func_005_54EA                            ; $5245: $CD $EA $54
    ld   de, $4E0A                                ; $5248: $11 $0A $4E
    call label_3BC0                               ; $524B: $CD $C0 $3B
    ldh  a, [hActiveEntityWalking]                ; $524E: $F0 $F0
    dec  a                                        ; $5250: $3D
    rst  $00                                      ; $5251: $C7
    sub  h                                        ; $5252: $94
    ld   d, d                                     ; $5253: $52
    db   $DB                                      ; $5254: $DB
    ld   d, d                                     ; $5255: $52
    ld   [de], a                                  ; $5256: $12
    ld   d, e                                     ; $5257: $53
    ld   b, b                                     ; $5258: $40
    rlca                                          ; $5259: $07
    ld   b, d                                     ; $525A: $42
    rlca                                          ; $525B: $07
    ld   b, d                                     ; $525C: $42
    daa                                           ; $525D: $27
    ld   b, b                                     ; $525E: $40
    daa                                           ; $525F: $27
    ld   b, h                                     ; $5260: $44
    nop                                           ; $5261: $00
    ld   b, [hl]                                  ; $5262: $46
    nop                                           ; $5263: $00
    ld   c, b                                     ; $5264: $48
    nop                                           ; $5265: $00
    ld   c, d                                     ; $5266: $4A
    nop                                           ; $5267: $00
    ld   c, b                                     ; $5268: $48
    nop                                           ; $5269: $00
    ld   c, h                                     ; $526A: $4C
    nop                                           ; $526B: $00
    nop                                           ; $526C: $00
    nop                                           ; $526D: $00
    ld   c, [hl]                                  ; $526E: $4E
    ld   b, $00                                   ; $526F: $06 $00
    ld   [$264E], sp                              ; $5271: $08 $4E $26
    inc  bc                                       ; $5274: $03
    inc  bc                                       ; $5275: $03
    inc  bc                                       ; $5276: $03
    inc  bc                                       ; $5277: $03
    inc  bc                                       ; $5278: $03
    inc  b                                        ; $5279: $04
    inc  bc                                       ; $527A: $03
    inc  b                                        ; $527B: $04
    inc  bc                                       ; $527C: $03
    inc  bc                                       ; $527D: $03
    inc  bc                                       ; $527E: $03
    ld   [bc], a                                  ; $527F: $02
    ld   [bc], a                                  ; $5280: $02
    ld   [bc], a                                  ; $5281: $02
    ld   [bc], a                                  ; $5282: $02
    ld   [bc], a                                  ; $5283: $02
    nop                                           ; $5284: $00
    nop                                           ; $5285: $00
    ld   bc, $0001                                ; $5286: $01 $01 $00
    nop                                           ; $5289: $00
    ld   bc, $0001                                ; $528A: $01 $01 $00
    nop                                           ; $528D: $00
    ld   bc, $0001                                ; $528E: $01 $01 $00
    nop                                           ; $5291: $00
    ld   bc, $CD01                                ; $5292: $01 $01 $CD
    ei                                            ; $5295: $FB
    dec  bc                                       ; $5296: $0B
    jr   nz, jr_005_52A4                          ; $5297: $20 $0B

    ld   a, $01                                   ; $5299: $3E $01
    call OpenDialog                               ; $529B: $CD $85 $23
    ld   [hl], $40                                ; $529E: $36 $40
    call IncrementEntityWalkingAttr               ; $52A0: $CD $12 $3B
    xor  a                                        ; $52A3: $AF

jr_005_52A4:
    rra                                           ; $52A4: $1F
    rra                                           ; $52A5: $1F
    and  $1F                                      ; $52A6: $E6 $1F
    ld   e, a                                     ; $52A8: $5F
    ld   d, b                                     ; $52A9: $50
    ld   hl, $5274                                ; $52AA: $21 $74 $52
    add  hl, de                                   ; $52AD: $19
    ld   a, [hl]                                  ; $52AE: $7E

func_005_52AF:
    ldh  [hActiveEntityUnknownG], a               ; $52AF: $E0 $F1
    ld   a, $38                                   ; $52B1: $3E $38
    ldh  [wActiveEntityPosX], a                   ; $52B3: $E0 $EE
    ldh  [hLinkPositionX], a                      ; $52B5: $E0 $98
    ld   a, $34                                   ; $52B7: $3E $34
    ldh  [wActiveEntityPosY], a                   ; $52B9: $E0 $EC
    ldh  [hLinkPositionY], a                      ; $52BB: $E0 $99
    ld   a, $02                                   ; $52BD: $3E $02
    ldh  [$FFA1], a                               ; $52BF: $E0 $A1
    ld   a, $FF                                   ; $52C1: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $52C3: $E0 $9D
    ld   de, $5258                                ; $52C5: $11 $58 $52
    call label_3BC0                               ; $52C8: $CD $C0 $3B
    ldh  a, [hIsGBC]                              ; $52CB: $F0 $FE
    and  a                                        ; $52CD: $A7
    jr   z, jr_005_52D8                           ; $52CE: $28 $08

    ld   hl, $526C                                ; $52D0: $21 $6C $52
    ld   c, $02                                   ; $52D3: $0E $02
    call label_3CE6                               ; $52D5: $CD $E6 $3C

jr_005_52D8:
    jp   label_3D8A                               ; $52D8: $C3 $8A $3D

    ld   a, $03                                   ; $52DB: $3E $03
    call func_005_52AF                            ; $52DD: $CD $AF $52
    call IsEntityFrameCounterZero                 ; $52E0: $CD $05 $0C
    ld   hl, wDialogState                         ; $52E3: $21 $9F $C1
    or   [hl]                                     ; $52E6: $B6
    jr   nz, jr_005_5311                          ; $52E7: $20 $28

    ldh  a, [hPressedButtonsMask]                 ; $52E9: $F0 $CB
    and  $0F                                      ; $52EB: $E6 $0F
    jr   z, jr_005_5311                           ; $52ED: $28 $22

    call IncrementEntityWalkingAttr               ; $52EF: $CD $12 $3B
    ld   a, $01                                   ; $52F2: $3E $01
    ldh  [$FFA2], a                               ; $52F4: $E0 $A2
    ld   a, $02                                   ; $52F6: $3E $02
    ld   [$C146], a                               ; $52F8: $EA $46 $C1
    ld   a, $12                                   ; $52FB: $3E $12
    ldh  [$FFA3], a                               ; $52FD: $E0 $A3
    ld   a, $0C                                   ; $52FF: $3E $0C
    ldh  [hLinkPositionXIncrement], a             ; $5301: $E0 $9A
    xor  a                                        ; $5303: $AF
    ldh  [hLinkPositionYIncrement], a             ; $5304: $E0 $9B
    ld   a, $00                                   ; $5306: $3E $00
    ldh  [hLinkDirection], a                      ; $5308: $E0 $9E
    ldh  [$FFA1], a                               ; $530A: $E0 $A1
    ld   a, $01                                   ; $530C: $3E $01
    ld   [wC10A], a                               ; $530E: $EA $0A $C1

jr_005_5311:
    ret                                           ; $5311: $C9

    call func_005_7A3A                            ; $5312: $CD $3A $7A
    call func_005_54C3                            ; $5315: $CD $C3 $54
    call func_005_5506                            ; $5318: $CD $06 $55
    ret  nc                                       ; $531B: $D0

    ld   a, $02                                   ; $531C: $3E $02
    jp   OpenDialog                               ; $531E: $C3 $85 $23

; Add item to inventory slot (used for assigning the shield)
AssignItemToSlot:
    ld   hl, wAButtonSlot                         ; $5321: $21 $00 $DB
    ld   e, $0C                                   ; $5324: $1E $0C

    ; Search if a matching item exists in inventory
.searchLoop
    ld   a, [hl+]                                 ; $5326: $2A
    cp   d                                        ; $5327: $BA
    jr   z, .return                               ; $5328: $28 $13

    dec  e                                        ; $532A: $1D
    jr   nz, .searchLoop                          ; $532B: $20 $F9

    ld   hl, wAButtonSlot                         ; $532D: $21 $00 $DB

    ; Check for first empty slot, add item to it and return
.assignLoop
    ld   a, [hl]                                  ; $5330: $7E
    and  a                                        ; $5331: $A7
    jr   nz, .slotFound                           ; $5332: $20 $02

    ld   [hl], d                                  ; $5334: $72
    ret                                           ; $5335: $C9

.slotFound
    inc  hl                                       ; $5336: $23
    inc  e                                        ; $5337: $1C
    ld   a, e                                     ; $5338: $7B
    cp   $0C                                      ; $5339: $FE $0C
    jr   nz, .assignLoop                          ; $533B: $20 $F3

.return
    ret                                           ; $533D: $C9

    ld   h, b                                     ; $533E: $60
    nop                                           ; $533F: $00
    ld   h, d                                     ; $5340: $62
    nop                                           ; $5341: $00
    ld   h, d                                     ; $5342: $62
    jr   nz, @+$62                                ; $5343: $20 $60

    jr   nz, jr_005_53AB                          ; $5345: $20 $64

    nop                                           ; $5347: $00
    ld   h, [hl]                                  ; $5348: $66
    nop                                           ; $5349: $00
    ld   h, [hl]                                  ; $534A: $66
    jr   nz, jr_005_53B1                          ; $534B: $20 $64

    jr   nz, @+$6A                                ; $534D: $20 $68

    nop                                           ; $534F: $00
    ld   l, d                                     ; $5350: $6A
    nop                                           ; $5351: $00
    ld   l, h                                     ; $5352: $6C
    nop                                           ; $5353: $00
    ld   l, [hl]                                  ; $5354: $6E
    nop                                           ; $5355: $00
    ld   l, d                                     ; $5356: $6A
    jr   nz, @+$6A                                ; $5357: $20 $68

jr_005_5359:
    jr   nz, @+$70                                ; $5359: $20 $6E

    jr   nz, @+$6E                                ; $535B: $20 $6C

    jr   nz, jr_005_5359                          ; $535D: $20 $FA

    and  l                                        ; $535F: $A5
    db   $DB                                      ; $5360: $DB
    and  a                                        ; $5361: $A7
    jr   z, jr_005_53DC                           ; $5362: $28 $78

    ldh  a, [hFrameCounter]                       ; $5364: $F0 $E7
    and  $1F                                      ; $5366: $E6 $1F
    jr   nz, jr_005_5372                          ; $5368: $20 $08

    call func_005_7B24                            ; $536A: $CD $24 $7B
    ld   hl, $C380                                ; $536D: $21 $80 $C3
    add  hl, bc                                   ; $5370: $09
    ld   [hl], e                                  ; $5371: $73

jr_005_5372:
    call func_005_54EA                            ; $5372: $CD $EA $54
    ld   de, $533E                                ; $5375: $11 $3E $53
    call label_3BC0                               ; $5378: $CD $C0 $3B
    call func_005_7A3A                            ; $537B: $CD $3A $7A
    call func_005_54C3                            ; $537E: $CD $C3 $54
    ldh  a, [hActiveEntityWalking]                ; $5381: $F0 $F0
    rst  $00                                      ; $5383: $C7
    adc  d                                        ; $5384: $8A
    ld   d, e                                     ; $5385: $53
    sbc  h                                        ; $5386: $9C
    ld   d, e                                     ; $5387: $53
    bit  2, e                                     ; $5388: $CB $53
    ld   a, [$D477]                               ; $538A: $FA $77 $D4
    and  a                                        ; $538D: $A7
    jr   nz, jr_005_53CB                          ; $538E: $20 $3B

    call func_005_5506                            ; $5390: $CD $06 $55
    ret  nc                                       ; $5393: $D0

    ld   a, $F0                                   ; $5394: $3E $F0
    call OpenDialog                               ; $5396: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $5399: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $539C: $FA $9F $C1
    and  a                                        ; $539F: $A7
    ret  nz                                       ; $53A0: $C0

    call IncrementEntityWalkingAttr               ; $53A1: $CD $12 $3B
    ld   a, [wC177]                               ; $53A4: $FA $77 $C1
    and  a                                        ; $53A7: $A7
    jr   z, jr_005_53AC                           ; $53A8: $28 $02

    ld   [hl], b                                  ; $53AA: $70

jr_005_53AB:
    ret                                           ; $53AB: $C9

jr_005_53AC:
    ld   a, [wRupeeCountLow]                      ; $53AC: $FA $5E $DB
    sub  $00                                      ; $53AF: $D6 $00

jr_005_53B1:
    ld   a, [wRupeeCountHigh]                     ; $53B1: $FA $5D $DB
    sbc  $01                                      ; $53B4: $DE $01
    jr   c, jr_005_53C5                           ; $53B6: $38 $0D

    ld   a, $64                                   ; $53B8: $3E $64
    ld   [wSubstractRupeeBufferHigh], a           ; $53BA: $EA $92 $DB
    ld   a, $F1                                   ; $53BD: $3E $F1
    ld   [$D477], a                               ; $53BF: $EA $77 $D4
    jp   OpenDialog                               ; $53C2: $C3 $85 $23

jr_005_53C5:
    ld   [hl], b                                  ; $53C5: $70
    ld   a, $4E                                   ; $53C6: $3E $4E
    jp   OpenDialog                               ; $53C8: $C3 $85 $23

jr_005_53CB:
    call func_005_5506                            ; $53CB: $CD $06 $55
    ret  nc                                       ; $53CE: $D0

    ld   a, $F1                                   ; $53CF: $3E $F1
    jp   OpenDialog                               ; $53D1: $C3 $85 $23

    ld   e, h                                     ; $53D4: $5C
    ld   bc, $215C                                ; $53D5: $01 $5C $21
    ld   e, [hl]                                  ; $53D8: $5E
    ld   bc, $215E                                ; $53D9: $01 $5E $21

jr_005_53DC:
    ld   hl, $C440                                ; $53DC: $21 $40 $C4
    add  hl, bc                                   ; $53DF: $09
    ld   a, [$D477]                               ; $53E0: $FA $77 $D4
    or   [hl]                                     ; $53E3: $B6
    jr   nz, jr_005_5411                          ; $53E4: $20 $2B

    ld   e, $0F                                   ; $53E6: $1E $0F
    ld   d, b                                     ; $53E8: $50

jr_005_53E9:
    ld   a, e                                     ; $53E9: $7B
    cp   c                                        ; $53EA: $B9
    jr   z, jr_005_53FF                           ; $53EB: $28 $12

    ld   hl, wEntity0Type                         ; $53ED: $21 $80 $C2
    add  hl, de                                   ; $53F0: $19
    ld   a, [hl]                                  ; $53F1: $7E
    and  a                                        ; $53F2: $A7
    jr   z, jr_005_53FF                           ; $53F3: $28 $0A

    ld   hl, $C3A0                                ; $53F5: $21 $A0 $C3
    add  hl, de                                   ; $53F8: $19
    ld   a, [hl]                                  ; $53F9: $7E
    cp   $6A                                      ; $53FA: $FE $6A
    jp   z, label_005_7B4B                        ; $53FC: $CA $4B $7B

jr_005_53FF:
    dec  e                                        ; $53FF: $1D
    ld   a, e                                     ; $5400: $7B
    cp   $FF                                      ; $5401: $FE $FF
    jr   nz, jr_005_53E9                          ; $5403: $20 $E4

    ld   de, $53D4                                ; $5405: $11 $D4 $53
    call label_3BC0                               ; $5408: $CD $C0 $3B
    call func_005_7A3A                            ; $540B: $CD $3A $7A
    jp   label_005_54C3                           ; $540E: $C3 $C3 $54

jr_005_5411:
    ldh  a, [hFrameCounter]                       ; $5411: $F0 $E7
    rra                                           ; $5413: $1F
    rra                                           ; $5414: $1F
    rra                                           ; $5415: $1F
    rra                                           ; $5416: $1F
    and  $01                                      ; $5417: $E6 $01
    call label_3B0C                               ; $5419: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $541C: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $541E: $21 $EE $FF
    sub  [hl]                                     ; $5421: $96
    add  $10                                      ; $5422: $C6 $10
    cp   $20                                      ; $5424: $FE $20
    jr   nc, jr_005_5440                          ; $5426: $30 $18

    ldh  a, [hLinkPositionY]                      ; $5428: $F0 $99
    ld   hl, $FFEF                                ; $542A: $21 $EF $FF
    sub  [hl]                                     ; $542D: $96
    add  $14                                      ; $542E: $C6 $14
    cp   $1C                                      ; $5430: $FE $1C
    jr   nc, jr_005_5440                          ; $5432: $30 $0C

    ld   a, $80                                   ; $5434: $3E $80
    ld   [$C1AD], a                               ; $5436: $EA $AD $C1
    ldh  a, [hLinkPositionX]                      ; $5439: $F0 $98
    ld   hl, wEntity0PosX                         ; $543B: $21 $00 $C2
    add  hl, bc                                   ; $543E: $09
    ld   [hl], a                                  ; $543F: $77

jr_005_5440:
    ld   a, [wLinkGroundStatus]                   ; $5440: $FA $1F $C1
    and  a                                        ; $5443: $A7
    jr   z, jr_005_544C                           ; $5444: $28 $06

    call IncrementEntityWalkingAttr               ; $5446: $CD $12 $3B
    ld   [hl], b                                  ; $5449: $70
    jr   jr_005_5487                              ; $544A: $18 $3B

jr_005_544C:
    ldh  a, [hActiveEntityWalking]                ; $544C: $F0 $F0
    rst  $00                                      ; $544E: $C7
    ld   d, l                                     ; $544F: $55
    ld   d, h                                     ; $5450: $54
    ld   l, h                                     ; $5451: $6C
    ld   d, h                                     ; $5452: $54
    sub  b                                        ; $5453: $90
    ld   d, h                                     ; $5454: $54
    call func_005_7B04                            ; $5455: $CD $04 $7B
    add  $08                                      ; $5458: $C6 $08
    cp   $10                                      ; $545A: $FE $10
    jr   nc, jr_005_546A                          ; $545C: $30 $0C

    call func_005_7B14                            ; $545E: $CD $14 $7B
    add  $09                                      ; $5461: $C6 $09
    cp   $12                                      ; $5463: $FE $12
    jr   nc, jr_005_546A                          ; $5465: $30 $03

    call IncrementEntityWalkingAttr               ; $5467: $CD $12 $3B

jr_005_546A:
    jr   jr_005_5487                              ; $546A: $18 $1B

    ldh  a, [wActiveEntityPosX]                   ; $546C: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $546E: $E0 $98
    ldh  a, [wActiveEntityPosY]                   ; $5470: $F0 $EC
    sub  $05                                      ; $5472: $D6 $05
    ldh  [hLinkPositionY], a                      ; $5474: $E0 $99
    call IncrementEntityWalkingAttr               ; $5476: $CD $12 $3B
    ld   hl, $C440                                ; $5479: $21 $40 $C4
    add  hl, bc                                   ; $547C: $09
    ld   [hl], $01                                ; $547D: $36 $01
    xor  a                                        ; $547F: $AF
    ld   [$D477], a                               ; $5480: $EA $77 $D4

jr_005_5483:
    ld   a, $01                                   ; $5483: $3E $01
    ldh  [hFFB2], a                               ; $5485: $E0 $B2

jr_005_5487:
    call label_3D8A                               ; $5487: $CD $8A $3D
    ld   de, $53D4                                ; $548A: $11 $D4 $53
    jp   label_3BC0                               ; $548D: $C3 $C0 $3B

    ldh  a, [hFrameCounter]                       ; $5490: $F0 $E7
    rra                                           ; $5492: $1F
    rra                                           ; $5493: $1F
    rra                                           ; $5494: $1F
    rra                                           ; $5495: $1F
    and  $01                                      ; $5496: $E6 $01
    ld   [$C13B], a                               ; $5498: $EA $3B $C1
    ldh  a, [hMapRoom]                            ; $549B: $F0 $F6
    ld   hl, $C3E0                                ; $549D: $21 $E0 $C3
    add  hl, bc                                   ; $54A0: $09
    ld   [hl], a                                  ; $54A1: $77
    ldh  a, [hLinkPositionX]                      ; $54A2: $F0 $98
    ld   hl, wEntity0PosX                         ; $54A4: $21 $00 $C2
    add  hl, bc                                   ; $54A7: $09
    ld   [hl], a                                  ; $54A8: $77
    ldh  a, [hLinkPositionY]                      ; $54A9: $F0 $99
    ld   hl, wEntity0PosY                         ; $54AB: $21 $10 $C2
    add  hl, bc                                   ; $54AE: $09
    add  $05                                      ; $54AF: $C6 $05
    ld   [hl], a                                  ; $54B1: $77
    ld   hl, $C310                                ; $54B2: $21 $10 $C3
    add  hl, bc                                   ; $54B5: $09
    ld   [hl], b                                  ; $54B6: $70
    ld   a, [wLinkMotionState]                    ; $54B7: $FA $1C $C1
    cp   $02                                      ; $54BA: $FE $02
    jr   nz, jr_005_54C1                          ; $54BC: $20 $03

    ldh  a, [$FFA2]                               ; $54BE: $F0 $A2
    ld   [hl], a                                  ; $54C0: $77

jr_005_54C1:
    jr   jr_005_5483                              ; $54C1: $18 $C0

func_005_54C3:
label_005_54C3:
    call label_3B5A                               ; $54C3: $CD $5A $3B
    jr   nc, jr_005_54E5                          ; $54C6: $30 $1D

    call CopyLinkFinalPositionToPosition          ; $54C8: $CD $BE $0C
    call label_CB6                                ; $54CB: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $54CE: $FA $A6 $C1
    and  a                                        ; $54D1: $A7
    jr   z, jr_005_54E5                           ; $54D2: $28 $11

    ld   e, a                                     ; $54D4: $5F
    ld   d, b                                     ; $54D5: $50
    ld   hl, $C39F                                ; $54D6: $21 $9F $C3
    add  hl, de                                   ; $54D9: $19
    ld   a, [hl]                                  ; $54DA: $7E
    cp   $03                                      ; $54DB: $FE $03
    jr   nz, jr_005_54E5                          ; $54DD: $20 $06

    ld   hl, wEntityFType                         ; $54DF: $21 $8F $C2
    add  hl, de                                   ; $54E2: $19
    ld   [hl], $00                                ; $54E3: $36 $00

jr_005_54E5:
    ret                                           ; $54E5: $C9

    ld   b, $04                                   ; $54E6: $06 $04
    ld   [bc], a                                  ; $54E8: $02
    nop                                           ; $54E9: $00

func_005_54EA:
    ld   hl, $C380                                ; $54EA: $21 $80 $C3
    add  hl, bc                                   ; $54ED: $09
    ld   e, [hl]                                  ; $54EE: $5E
    ld   d, b                                     ; $54EF: $50
    ld   hl, $54E6                                ; $54F0: $21 $E6 $54
    add  hl, de                                   ; $54F3: $19
    push hl                                       ; $54F4: $E5
    ld   hl, $C3D0                                ; $54F5: $21 $D0 $C3
    add  hl, bc                                   ; $54F8: $09
    inc  [hl]                                     ; $54F9: $34
    ld   a, [hl]                                  ; $54FA: $7E
    rra                                           ; $54FB: $1F
    rra                                           ; $54FC: $1F
    rra                                           ; $54FD: $1F
    rra                                           ; $54FE: $1F
    pop  hl                                       ; $54FF: $E1
    and  $01                                      ; $5500: $E6 $01
    or   [hl]                                     ; $5502: $B6
    jp   label_3B0C                               ; $5503: $C3 $0C $3B

func_005_5506:
    ld   e, b                                     ; $5506: $58
    ldh  a, [hActiveEntityId]                     ; $5507: $F0 $EB
    cp   $40                                      ; $5509: $FE $40
    jr   nz, jr_005_5519                          ; $550B: $20 $0C

    ldh  a, [hLinkPositionY]                      ; $550D: $F0 $99
    ld   hl, $FFEF                                ; $550F: $21 $EF $FF
    sub  [hl]                                     ; $5512: $96
    add  $14                                      ; $5513: $C6 $14
    cp   $2B                                      ; $5515: $FE $2B
    jr   jr_005_5523                              ; $5517: $18 $0A

jr_005_5519:
    ldh  a, [hLinkPositionY]                      ; $5519: $F0 $99
    ld   hl, $FFEF                                ; $551B: $21 $EF $FF
    sub  [hl]                                     ; $551E: $96
    add  $14                                      ; $551F: $C6 $14
    cp   $28                                      ; $5521: $FE $28

jr_005_5523:
    jr   nc, jr_005_5569                          ; $5523: $30 $44

    ldh  a, [hLinkPositionX]                      ; $5525: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $5527: $21 $EE $FF
    sub  [hl]                                     ; $552A: $96
    add  $10                                      ; $552B: $C6 $10
    cp   $20                                      ; $552D: $FE $20
    jr   nc, jr_005_5569                          ; $552F: $30 $38

    inc  e                                        ; $5531: $1C
    ldh  a, [hActiveEntityId]                     ; $5532: $F0 $EB
    cp   $6D                                      ; $5534: $FE $6D
    jr   z, jr_005_5544                           ; $5536: $28 $0C

    push de                                       ; $5538: $D5
    call func_005_7B24                            ; $5539: $CD $24 $7B
    ldh  a, [hLinkDirection]                      ; $553C: $F0 $9E
    xor  $01                                      ; $553E: $EE $01
    cp   e                                        ; $5540: $BB
    pop  de                                       ; $5541: $D1
    jr   nz, jr_005_5569                          ; $5542: $20 $25

jr_005_5544:
    ld   hl, $C1AD                                ; $5544: $21 $AD $C1
    ld   [hl], $01                                ; $5547: $36 $01
    ld   a, [wDialogState]                        ; $5549: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $554C: $21 $4F $C1
    or   [hl]                                     ; $554F: $B6
    ld   hl, $C146                                ; $5550: $21 $46 $C1
    or   [hl]                                     ; $5553: $B6
    ld   hl, $C134                                ; $5554: $21 $34 $C1
    or   [hl]                                     ; $5557: $B6
    jr   nz, jr_005_5569                          ; $5558: $20 $0F

    ld   a, [wWindowY]                            ; $555A: $FA $9A $DB
    cp   $80                                      ; $555D: $FE $80
    jr   nz, jr_005_5569                          ; $555F: $20 $08

    ldh  a, [hFFCC]                               ; $5561: $F0 $CC
    and  $10                                      ; $5563: $E6 $10
    jr   z, jr_005_5569                           ; $5565: $28 $02

    scf                                           ; $5567: $37
    ret                                           ; $5568: $C9

jr_005_5569:
    and  a                                        ; $5569: $A7
    ret                                           ; $556A: $C9

    call label_BFB                                ; $556B: $CD $FB $0B
    ld   [hl], $C0                                ; $556E: $36 $C0
    ld   a, $18                                   ; $5570: $3E $18
    ld   [$D202], a                               ; $5572: $EA $02 $D2
    ret                                           ; $5575: $C9

    ld   hl, wEntitiesUnknownTableD               ; $5576: $21 $D0 $C2
    add  hl, bc                                   ; $5579: $09
    ld   a, [hl]                                  ; $557A: $7E
    rst  $00                                      ; $557B: $C7
    add  h                                        ; $557C: $84
    ld   d, l                                     ; $557D: $55
    ld   a, [hl-]                                 ; $557E: $3A
    ld   e, c                                     ; $557F: $59
    ld   bc, $8459                                ; $5580: $01 $59 $84
    ld   e, c                                     ; $5583: $59
    call label_3EE8                               ; $5584: $CD $E8 $3E
    call $58D4                                    ; $5587: $CD $D4 $58
    ldh  a, [hActiveEntityType]                   ; $558A: $F0 $EA
    cp   $05                                      ; $558C: $FE $05
    jr   z, @+$3C                                 ; $558E: $28 $3A

    ld   [$C1C6], a                               ; $5590: $EA $C6 $C1
    ld   hl, wEntitiesUnknownTableC               ; $5593: $21 $C0 $C2
    add  hl, bc                                   ; $5596: $09
    ld   a, [hl]                                  ; $5597: $7E
    rst  $00                                      ; $5598: $C7
    sbc  l                                        ; $5599: $9D
    ld   d, l                                     ; $559A: $55
    xor  e                                        ; $559B: $AB
    ld   d, l                                     ; $559C: $55
    call IsEntityFrameCounterZero                 ; $559D: $CD $05 $0C
    ld   [hl], $FF                                ; $55A0: $36 $FF
    ld   hl, $C420                                ; $55A2: $21 $20 $C4
    add  hl, bc                                   ; $55A5: $09
    ld   [hl], $FF                                ; $55A6: $36 $FF
    jp   label_005_6347                           ; $55A8: $C3 $47 $63

    call IsEntityFrameCounterZero                 ; $55AB: $CD $05 $0C
    jp   z, label_005_55BC                        ; $55AE: $CA $BC $55

    ld   hl, $C420                                ; $55B1: $21 $20 $C4
    add  hl, bc                                   ; $55B4: $09
    ld   [hl], a                                  ; $55B5: $77
    cp   $80                                      ; $55B6: $FE $80
    ret  nc                                       ; $55B8: $D0

    jp   label_005_7550                           ; $55B9: $C3 $50 $75

label_005_55BC:
    call func_005_7585                            ; $55BC: $CD $85 $75
    ld   hl, $C480                                ; $55BF: $21 $80 $C4
    add  hl, de                                   ; $55C2: $19
    ld   [hl], $08                                ; $55C3: $36 $08
    ret                                           ; $55C5: $C9

    ld   hl, sp-$58                               ; $55C6: $F8 $A8
    ld   [$CDF8], sp                              ; $55C8: $08 $F8 $CD
    ld   a, [hl-]                                 ; $55CB: $3A
    ld   a, d                                     ; $55CC: $7A
    ld   hl, $C300                                ; $55CD: $21 $00 $C3
    add  hl, bc                                   ; $55D0: $09
    ld   a, [hl]                                  ; $55D1: $7E
    and  a                                        ; $55D2: $A7
    jr   z, jr_005_561E                           ; $55D3: $28 $49

    and  $3F                                      ; $55D5: $E6 $3F
    jr   nz, jr_005_561E                          ; $55D7: $20 $45

    ld   a, $65                                   ; $55D9: $3E $65
    ld   e, $04                                   ; $55DB: $1E $04
    call label_3B98                               ; $55DD: $CD $98 $3B
    jr   c, jr_005_5650                           ; $55E0: $38 $6E

    ld   hl, $C340                                ; $55E2: $21 $40 $C3
    add  hl, de                                   ; $55E5: $19
    ld   [hl], $02                                ; $55E6: $36 $02
    ld   hl, $C350                                ; $55E8: $21 $50 $C3
    add  hl, de                                   ; $55EB: $19
    ld   [hl], $80                                ; $55EC: $36 $80
    ld   hl, $C430                                ; $55EE: $21 $30 $C4
    add  hl, de                                   ; $55F1: $19
    ld   [hl], $40                                ; $55F2: $36 $40
    ld   hl, wEntitiesUnknownTableD               ; $55F4: $21 $D0 $C2
    add  hl, de                                   ; $55F7: $19
    ld   [hl], $01                                ; $55F8: $36 $01
    ld   hl, wEntity0PosX                         ; $55FA: $21 $00 $C2
    add  hl, de                                   ; $55FD: $19
    ld   a, [$D202]                               ; $55FE: $FA $02 $D2
    ld   [hl], a                                  ; $5601: $77
    add  $20                                      ; $5602: $C6 $20
    ld   [$D202], a                               ; $5604: $EA $02 $D2
    cp   $A8                                      ; $5607: $FE $A8
    jr   c, jr_005_5610                           ; $5609: $38 $05

    ld   a, $08                                   ; $560B: $3E $08
    ld   [$D202], a                               ; $560D: $EA $02 $D2

jr_005_5610:
    call GetRandomByte                            ; $5610: $CD $0D $28
    ld   hl, $C3D0                                ; $5613: $21 $D0 $C3
    add  hl, de                                   ; $5616: $19
    ld   [hl], a                                  ; $5617: $77
    ld   hl, wEntity0PosY                         ; $5618: $21 $10 $C2
    add  hl, de                                   ; $561B: $19
    ld   [hl], $00                                ; $561C: $36 $00

jr_005_561E:
    ld   a, [$D201]                               ; $561E: $FA $01 $D2
    inc  a                                        ; $5621: $3C
    ld   [$D201], a                               ; $5622: $EA $01 $D2
    and  $7F                                      ; $5625: $E6 $7F
    jr   nz, jr_005_5650                          ; $5627: $20 $27

    ld   a, $65                                   ; $5629: $3E $65
    ld   e, $04                                   ; $562B: $1E $04
    call label_3B98                               ; $562D: $CD $98 $3B
    jr   c, jr_005_5650                           ; $5630: $38 $1E

    ld   hl, $C340                                ; $5632: $21 $40 $C3
    add  hl, de                                   ; $5635: $19
    ld   [hl], $41                                ; $5636: $36 $41
    ld   hl, wEntitiesUnknownTableD               ; $5638: $21 $D0 $C2
    add  hl, de                                   ; $563B: $19
    ld   [hl], $02                                ; $563C: $36 $02
    ldh  a, [hScratchA]                           ; $563E: $F0 $D7
    sub  $14                                      ; $5640: $D6 $14
    ld   hl, wEntity0PosX                         ; $5642: $21 $00 $C2
    add  hl, de                                   ; $5645: $19
    ld   [hl], a                                  ; $5646: $77
    ldh  a, [hScratchB]                           ; $5647: $F0 $D8
    sub  $04                                      ; $5649: $D6 $04
    ld   hl, wEntity0PosY                         ; $564B: $21 $10 $C2
    add  hl, de                                   ; $564E: $19
    ld   [hl], a                                  ; $564F: $77

jr_005_5650:
    ld   hl, $C360                                ; $5650: $21 $60 $C3
    add  hl, bc                                   ; $5653: $09
    ld   a, [hl]                                  ; $5654: $7E
    cp   $0A                                      ; $5655: $FE $0A
    jr   nc, jr_005_56B1                          ; $5657: $30 $58

    ld   a, [$D201]                               ; $5659: $FA $01 $D2
    add  $40                                      ; $565C: $C6 $40
    and  $FF                                      ; $565E: $E6 $FF
    jr   nz, jr_005_56B1                          ; $5660: $20 $4F

    ld   a, $65                                   ; $5662: $3E $65
    ld   e, $04                                   ; $5664: $1E $04
    call label_3B98                               ; $5666: $CD $98 $3B
    jr   c, jr_005_56B1                           ; $5669: $38 $46

    ld   hl, $C4D0                                ; $566B: $21 $D0 $C4
    add  hl, de                                   ; $566E: $19
    ld   [hl], d                                  ; $566F: $72
    ld   hl, $C340                                ; $5670: $21 $40 $C3
    add  hl, de                                   ; $5673: $19
    ld   [hl], $02                                ; $5674: $36 $02
    ld   hl, $C430                                ; $5676: $21 $30 $C4
    add  hl, de                                   ; $5679: $19
    ld   [hl], d                                  ; $567A: $72
    ld   hl, $C360                                ; $567B: $21 $60 $C3
    add  hl, de                                   ; $567E: $19
    ld   [hl], d                                  ; $567F: $72
    ld   hl, wEntitiesUnknownTableD               ; $5680: $21 $D0 $C2
    add  hl, de                                   ; $5683: $19
    ld   [hl], $03                                ; $5684: $36 $03
    call GetRandomByte                            ; $5686: $CD $0D $28
    and  $3F                                      ; $5689: $E6 $3F
    add  $20                                      ; $568B: $C6 $20
    ld   hl, wEntity0PosY                         ; $568D: $21 $10 $C2
    add  hl, de                                   ; $5690: $19
    ld   [hl], a                                  ; $5691: $77
    push bc                                       ; $5692: $C5
    and  $01                                      ; $5693: $E6 $01
    ld   c, a                                     ; $5695: $4F
    ld   hl, $55C6                                ; $5696: $21 $C6 $55
    add  hl, bc                                   ; $5699: $09
    ld   a, [hl]                                  ; $569A: $7E
    ld   hl, wEntity0PosX                         ; $569B: $21 $00 $C2
    add  hl, de                                   ; $569E: $19
    ld   [hl], a                                  ; $569F: $77
    ld   hl, $55C8                                ; $56A0: $21 $C8 $55
    add  hl, bc                                   ; $56A3: $09
    ld   a, [hl]                                  ; $56A4: $7E
    ld   hl, wEntity0SpeedX                       ; $56A5: $21 $40 $C2
    add  hl, de                                   ; $56A8: $19
    ld   [hl], a                                  ; $56A9: $77
    ld   hl, wEntitiesFrameCounterTable           ; $56AA: $21 $E0 $C2
    add  hl, de                                   ; $56AD: $19
    ld   [hl], $40                                ; $56AE: $36 $40
    pop  bc                                       ; $56B0: $C1

jr_005_56B1:
    call label_C56                                ; $56B1: $CD $56 $0C
    ld   hl, $C3D0                                ; $56B4: $21 $D0 $C3
    add  hl, bc                                   ; $56B7: $09
    ld   a, [hl]                                  ; $56B8: $7E
    inc  [hl]                                     ; $56B9: $34
    rra                                           ; $56BA: $1F
    rra                                           ; $56BB: $1F
    rra                                           ; $56BC: $1F
    rra                                           ; $56BD: $1F
    and  $01                                      ; $56BE: $E6 $01
    ld   hl, wEntitiesUnknownTableG               ; $56C0: $21 $B0 $C3
    add  hl, bc                                   ; $56C3: $09
    ld   [hl], a                                  ; $56C4: $77
    ldh  a, [wActiveEntityPosX]                   ; $56C5: $F0 $EE

jr_005_56C7:
    sub  $10                                      ; $56C7: $D6 $10
    ldh  [wActiveEntityPosX], a                   ; $56C9: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $56CB: $F0 $EC
    sub  $10                                      ; $56CD: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $56CF: $E0 $EC
    ld   hl, $C350                                ; $56D1: $21 $50 $C3
    add  hl, bc                                   ; $56D4: $09
    ld   [hl], $00                                ; $56D5: $36 $00
    call label_3AEA                               ; $56D7: $CD $EA $3A
    call label_3B70                               ; $56DA: $CD $70 $3B
    call label_3D8A                               ; $56DD: $CD $8A $3D
    ld   hl, $C350                                ; $56E0: $21 $50 $C3
    add  hl, bc                                   ; $56E3: $09
    ld   [hl], $14                                ; $56E4: $36 $14
    call label_3AEA                               ; $56E6: $CD $EA $3A
    call label_3B44                               ; $56E9: $CD $44 $3B
    ldh  a, [hActiveEntityWalking]                ; $56EC: $F0 $F0
    rst  $00                                      ; $56EE: $C7
    ld   sp, hl                                   ; $56EF: $F9
    ld   d, [hl]                                  ; $56F0: $56
    scf                                           ; $56F1: $37
    ld   d, a                                     ; $56F2: $57
    ld   l, [hl]                                  ; $56F3: $6E
    ld   d, a                                     ; $56F4: $57
    ld   [$60F8], sp                              ; $56F5: $08 $F8 $60
    jr   jr_005_56C7                              ; $56F8: $18 $CD

    ei                                            ; $56FA: $FB
    dec  bc                                       ; $56FB: $0B
    jr   nz, jr_005_5713                          ; $56FC: $20 $15

    call IsEntityFrameCounterZero                 ; $56FE: $CD $05 $0C
    ld   [hl], $80                                ; $5701: $36 $80
    call IncrementEntityWalkingAttr               ; $5703: $CD $12 $3B
    call GetRandomByte                            ; $5706: $CD $0D $28
    and  $1F                                      ; $5709: $E6 $1F
    add  $60                                      ; $570B: $C6 $60
    ld   hl, wEntitiesUnknownTableB               ; $570D: $21 $B0 $C2
    add  hl, bc                                   ; $5710: $09
    ld   [hl], a                                  ; $5711: $77
    ret                                           ; $5712: $C9

jr_005_5713:
    ld   hl, $C380                                ; $5713: $21 $80 $C3
    add  hl, bc                                   ; $5716: $09
    ld   e, [hl]                                  ; $5717: $5E
    ld   d, b                                     ; $5718: $50
    ld   hl, $56F7                                ; $5719: $21 $F7 $56
    add  hl, de                                   ; $571C: $19
    ldh  a, [wActiveEntityPosY]                   ; $571D: $F0 $EC
    cp   [hl]                                     ; $571F: $BE
    jr   nz, jr_005_572A                          ; $5720: $20 $08

    ld   a, e                                     ; $5722: $7B
    xor  $01                                      ; $5723: $EE $01
    ld   hl, $C380                                ; $5725: $21 $80 $C3
    add  hl, bc                                   ; $5728: $09
    ld   [hl], a                                  ; $5729: $77

jr_005_572A:
    ld   hl, $56F5                                ; $572A: $21 $F5 $56
    add  hl, de                                   ; $572D: $19
    ld   a, [hl]                                  ; $572E: $7E
    ld   hl, wEntity0SpeedY                       ; $572F: $21 $50 $C2
    add  hl, bc                                   ; $5732: $09
    ld   [hl], a                                  ; $5733: $77
    jp   label_005_7AB4                           ; $5734: $C3 $B4 $7A

    ld   hl, $C3D0                                ; $5737: $21 $D0 $C3
    add  hl, bc                                   ; $573A: $09
    ld   a, [hl]                                  ; $573B: $7E
    inc  [hl]                                     ; $573C: $34
    inc  [hl]                                     ; $573D: $34
    call IsEntityFrameCounterZero                 ; $573E: $CD $05 $0C
    cp   $60                                      ; $5741: $FE $60
    jr   nz, jr_005_574A                          ; $5743: $20 $05

    ld   hl, hWaveSfx                                 ; $5745: $21 $F3 $FF
    ld   [hl], $0D                                ; $5748: $36 $0D

jr_005_574A:
    ret  nc                                       ; $574A: $D0

    ld   hl, wEntity0SpeedX                       ; $574B: $21 $40 $C2
    add  hl, bc                                   ; $574E: $09
    ld   [hl], $D0                                ; $574F: $36 $D0
    call func_005_7ABE                            ; $5751: $CD $BE $7A
    ldh  a, [wActiveEntityPosX]                   ; $5754: $F0 $EE
    cp   $18                                      ; $5756: $FE $18
    ret  nc                                       ; $5758: $D0

    ld   a, $30                                   ; $5759: $3E $30
    ld   [$C157], a                               ; $575B: $EA $57 $C1
    xor  a                                        ; $575E: $AF
    ld   [$C158], a                               ; $575F: $EA $58 $C1
    call label_C4B                                ; $5762: $CD $4B $0C
    ld   hl, $C300                                ; $5765: $21 $00 $C3
    add  hl, bc                                   ; $5768: $09
    ld   [hl], $FF                                ; $5769: $36 $FF
    jp   IncrementEntityWalkingAttr               ; $576B: $C3 $12 $3B

    ld   hl, $C3D0                                ; $576E: $21 $D0 $C3
    add  hl, bc                                   ; $5771: $09
    ld   a, [hl]                                  ; $5772: $7E
    inc  [hl]                                     ; $5773: $34
    ld   a, [$C157]                               ; $5774: $FA $57 $C1
    and  a                                        ; $5777: $A7
    jr   nz, jr_005_579B                          ; $5778: $20 $21

    ld   hl, wEntity0SpeedX                       ; $577A: $21 $40 $C2
    add  hl, bc                                   ; $577D: $09
    ld   [hl], $20                                ; $577E: $36 $20
    call func_005_7ABE                            ; $5780: $CD $BE $7A
    ld   hl, wEntitiesUnknownTableB               ; $5783: $21 $B0 $C2
    add  hl, bc                                   ; $5786: $09
    ldh  a, [wActiveEntityPosX]                   ; $5787: $F0 $EE
    cp   [hl]                                     ; $5789: $BE
    jr   c, jr_005_579B                           ; $578A: $38 $0F

    call label_BFB                                ; $578C: $CD $FB $0B
    call GetRandomByte                            ; $578F: $CD $0D $28
    and  $1F                                      ; $5792: $E6 $1F
    add  $40                                      ; $5794: $C6 $40
    ld   [hl], a                                  ; $5796: $77
    call IncrementEntityWalkingAttr               ; $5797: $CD $12 $3B
    ld   [hl], b                                  ; $579A: $70

jr_005_579B:
    ret                                           ; $579B: $C9

    ldh  a, [hActiveEntityWalking]                ; $579C: $F0 $F0
    ld   b, b                                     ; $579E: $40
    rlca                                          ; $579F: $07
    ldh  a, [hRoomStatus]                         ; $57A0: $F0 $F8
    ld   b, d                                     ; $57A2: $42
    rlca                                          ; $57A3: $07
    ldh  a, [rP1]                                 ; $57A4: $F0 $00
    ld   b, h                                     ; $57A6: $44
    rlca                                          ; $57A7: $07
    ldh  a, [$FF08]                               ; $57A8: $F0 $08
    ld   b, [hl]                                  ; $57AA: $46
    ld   d, $F0                                   ; $57AB: $16 $F0
    db   $10                                      ; $57AD: $10
    ld   c, b                                     ; $57AE: $48
    ld   d, $F0                                   ; $57AF: $16 $F0
    jr   jr_005_57FD                              ; $57B1: $18 $4A

    ld   d, $00                                   ; $57B3: $16 $00
    ldh  a, [$FF4C]                               ; $57B5: $F0 $4C
    rlca                                          ; $57B7: $07
    nop                                           ; $57B8: $00
    ld   hl, sp+$4E                               ; $57B9: $F8 $4E
    rlca                                          ; $57BB: $07
    nop                                           ; $57BC: $00
    nop                                           ; $57BD: $00
    ld   d, b                                     ; $57BE: $50
    ld   d, $00                                   ; $57BF: $16 $00
    ld   [$1652], sp                              ; $57C1: $08 $52 $16
    nop                                           ; $57C4: $00
    db   $10                                      ; $57C5: $10
    ld   d, h                                     ; $57C6: $54
    ld   d, $00                                   ; $57C7: $16 $00
    jr   jr_005_5821                              ; $57C9: $18 $56

    ld   d, $00                                   ; $57CB: $16 $00
    jr   nz, jr_005_5827                          ; $57CD: $20 $58

    ld   d, $10                                   ; $57CF: $16 $10
    ld   hl, sp+$5A                               ; $57D1: $F8 $5A
    ld   d, $10                                   ; $57D3: $16 $10
    nop                                           ; $57D5: $00
    ld   e, h                                     ; $57D6: $5C
    ld   d, $10                                   ; $57D7: $16 $10
    ld   [$165E], sp                              ; $57D9: $08 $5E $16
    db   $10                                      ; $57DC: $10
    db   $10                                      ; $57DD: $10
    ld   h, b                                     ; $57DE: $60
    ld   d, $10                                   ; $57DF: $16 $10
    jr   jr_005_5845                              ; $57E1: $18 $62

    ld   d, $10                                   ; $57E3: $16 $10
    jr   nz, jr_005_584B                          ; $57E5: $20 $64

    ld   d, $00                                   ; $57E7: $16 $00
    nop                                           ; $57E9: $00
    rst  $38                                      ; $57EA: $FF
    nop                                           ; $57EB: $00
    ldh  a, [hActiveEntityWalking]                ; $57EC: $F0 $F0
    ld   h, [hl]                                  ; $57EE: $66
    rlca                                          ; $57EF: $07
    ldh  a, [hRoomStatus]                         ; $57F0: $F0 $F8
    ld   b, d                                     ; $57F2: $42
    rlca                                          ; $57F3: $07
    ldh  a, [rP1]                                 ; $57F4: $F0 $00
    ld   b, h                                     ; $57F6: $44
    rlca                                          ; $57F7: $07
    ldh  a, [$FF08]                               ; $57F8: $F0 $08
    ld   b, [hl]                                  ; $57FA: $46
    ld   d, $F0                                   ; $57FB: $16 $F0

jr_005_57FD:
    db   $10                                      ; $57FD: $10
    ld   c, b                                     ; $57FE: $48
    ld   d, $F0                                   ; $57FF: $16 $F0
    jr   @+$4C                                    ; $5801: $18 $4A

    ld   d, $00                                   ; $5803: $16 $00
    ldh  a, [rBCPS]                               ; $5805: $F0 $68
    rlca                                          ; $5807: $07
    nop                                           ; $5808: $00
    ld   hl, sp+$4E                               ; $5809: $F8 $4E
    rlca                                          ; $580B: $07
    nop                                           ; $580C: $00
    nop                                           ; $580D: $00
    ld   d, b                                     ; $580E: $50
    ld   d, $00                                   ; $580F: $16 $00
    ld   [$1652], sp                              ; $5811: $08 $52 $16
    nop                                           ; $5814: $00
    db   $10                                      ; $5815: $10
    ld   d, h                                     ; $5816: $54
    ld   d, $00                                   ; $5817: $16 $00
    jr   jr_005_5871                              ; $5819: $18 $56

    ld   d, $00                                   ; $581B: $16 $00
    jr   nz, @+$6C                                ; $581D: $20 $6A

    ld   d, $10                                   ; $581F: $16 $10

jr_005_5821:
    ld   hl, sp+$5A                               ; $5821: $F8 $5A
    ld   d, $10                                   ; $5823: $16 $10
    nop                                           ; $5825: $00
    ld   e, h                                     ; $5826: $5C

jr_005_5827:
    ld   d, $10                                   ; $5827: $16 $10
    ld   [$165E], sp                              ; $5829: $08 $5E $16
    db   $10                                      ; $582C: $10
    db   $10                                      ; $582D: $10
    ld   h, b                                     ; $582E: $60
    ld   d, $10                                   ; $582F: $16 $10
    jr   jr_005_5895                              ; $5831: $18 $62

    ld   d, $10                                   ; $5833: $16 $10
    jr   nz, jr_005_58A3                          ; $5835: $20 $6C

    ld   d, $F0                                   ; $5837: $16 $F0
    jr   jr_005_5885                              ; $5839: $18 $4A

    ld   d, $F0                                   ; $583B: $16 $F0
    ld   [$1646], sp                              ; $583D: $08 $46 $16
    ldh  a, [rNR10]                               ; $5840: $F0 $10
    ld   c, b                                     ; $5842: $48
    ld   d, $F0                                   ; $5843: $16 $F0

jr_005_5845:
    ld   hl, sp+$42                               ; $5845: $F8 $42
    rlca                                          ; $5847: $07
    ldh  a, [rP1]                                 ; $5848: $F0 $00
    ld   b, h                                     ; $584A: $44

jr_005_584B:
    rlca                                          ; $584B: $07
    ldh  a, [hActiveEntityWalking]                ; $584C: $F0 $F0
    ld   b, b                                     ; $584E: $40
    rlca                                          ; $584F: $07
    nop                                           ; $5850: $00
    jr   nz, jr_005_58AB                          ; $5851: $20 $58

    ld   d, $00                                   ; $5853: $16 $00
    ld   [$1652], sp                              ; $5855: $08 $52 $16
    nop                                           ; $5858: $00
    db   $10                                      ; $5859: $10
    ld   d, h                                     ; $585A: $54
    ld   d, $00                                   ; $585B: $16 $00
    jr   jr_005_58B5                              ; $585D: $18 $56

    ld   d, $00                                   ; $585F: $16 $00
    ld   hl, sp+$4E                               ; $5861: $F8 $4E
    rlca                                          ; $5863: $07
    nop                                           ; $5864: $00
    nop                                           ; $5865: $00
    ld   d, b                                     ; $5866: $50
    ld   d, $00                                   ; $5867: $16 $00
    ldh  a, [$FF4C]                               ; $5869: $F0 $4C
    rlca                                          ; $586B: $07
    db   $10                                      ; $586C: $10
    jr   nz, jr_005_58D3                          ; $586D: $20 $64

    ld   d, $10                                   ; $586F: $16 $10

jr_005_5871:
    db   $10                                      ; $5871: $10
    ld   h, b                                     ; $5872: $60
    ld   d, $10                                   ; $5873: $16 $10
    jr   @+$64                                    ; $5875: $18 $62

    ld   d, $10                                   ; $5877: $16 $10
    nop                                           ; $5879: $00
    ld   e, h                                     ; $587A: $5C
    ld   d, $10                                   ; $587B: $16 $10
    ld   [$165E], sp                              ; $587D: $08 $5E $16
    db   $10                                      ; $5880: $10
    ld   hl, sp+$5A                               ; $5881: $F8 $5A
    ld   d, $00                                   ; $5883: $16 $00

jr_005_5885:
    nop                                           ; $5885: $00
    rst  $38                                      ; $5886: $FF
    nop                                           ; $5887: $00
    ldh  a, [rNR23]                               ; $5888: $F0 $18
    ld   c, d                                     ; $588A: $4A
    ld   d, $F0                                   ; $588B: $16 $F0
    ld   [$1646], sp                              ; $588D: $08 $46 $16
    ldh  a, [rNR10]                               ; $5890: $F0 $10
    ld   c, b                                     ; $5892: $48
    ld   d, $F0                                   ; $5893: $16 $F0

jr_005_5895:
    ld   hl, sp+$42                               ; $5895: $F8 $42
    rlca                                          ; $5897: $07
    ldh  a, [rP1]                                 ; $5898: $F0 $00
    ld   b, h                                     ; $589A: $44
    rlca                                          ; $589B: $07
    ldh  a, [hActiveEntityWalking]                ; $589C: $F0 $F0
    ld   h, [hl]                                  ; $589E: $66
    rlca                                          ; $589F: $07
    nop                                           ; $58A0: $00
    jr   nz, jr_005_590D                          ; $58A1: $20 $6A

jr_005_58A3:
    ld   d, $00                                   ; $58A3: $16 $00
    ld   [$1652], sp                              ; $58A5: $08 $52 $16
    nop                                           ; $58A8: $00
    db   $10                                      ; $58A9: $10
    ld   d, h                                     ; $58AA: $54

jr_005_58AB:
    ld   d, $00                                   ; $58AB: $16 $00
    jr   @+$58                                    ; $58AD: $18 $56

    ld   d, $00                                   ; $58AF: $16 $00
    ld   hl, sp+$4E                               ; $58B1: $F8 $4E
    rlca                                          ; $58B3: $07
    nop                                           ; $58B4: $00

jr_005_58B5:
    nop                                           ; $58B5: $00
    ld   d, b                                     ; $58B6: $50
    ld   d, $00                                   ; $58B7: $16 $00
    ldh  a, [rBCPS]                               ; $58B9: $F0 $68
    rlca                                          ; $58BB: $07
    db   $10                                      ; $58BC: $10
    jr   nz, @+$6E                                ; $58BD: $20 $6C

    ld   d, $10                                   ; $58BF: $16 $10
    db   $10                                      ; $58C1: $10
    ld   h, b                                     ; $58C2: $60
    ld   d, $10                                   ; $58C3: $16 $10
    jr   @+$64                                    ; $58C5: $18 $62

    ld   d, $10                                   ; $58C7: $16 $10
    nop                                           ; $58C9: $00
    ld   e, h                                     ; $58CA: $5C
    ld   d, $10                                   ; $58CB: $16 $10
    ld   [$165E], sp                              ; $58CD: $08 $5E $16
    db   $10                                      ; $58D0: $10
    ld   hl, sp+$5A                               ; $58D1: $F8 $5A

jr_005_58D3:
    ld   d, $F0                                   ; $58D3: $16 $F0
    pop  af                                       ; $58D5: $F1
    sla  a                                        ; $58D6: $CB $27
    sla  a                                        ; $58D8: $CB $27
    sla  a                                        ; $58DA: $CB $27
    sla  a                                        ; $58DC: $CB $27
    ld   e, a                                     ; $58DE: $5F
    sla  a                                        ; $58DF: $CB $27
    sla  a                                        ; $58E1: $CB $27
    add  e                                        ; $58E3: $83
    ld   e, a                                     ; $58E4: $5F
    ld   d, b                                     ; $58E5: $50
    ld   hl, $579C                                ; $58E6: $21 $9C $57
    ldh  a, [hFrameCounter]                       ; $58E9: $F0 $E7
    and  $01                                      ; $58EB: $E6 $01
    jr   z, jr_005_58F2                           ; $58ED: $28 $03

    ld   hl, $5838                                ; $58EF: $21 $38 $58

jr_005_58F2:
    add  hl, de                                   ; $58F2: $19
    ld   c, $13                                   ; $58F3: $0E $13
    call label_3CE6                               ; $58F5: $CD $E6 $3C
    ld   a, $13                                   ; $58F8: $3E $13
    jp   label_3DA0                               ; $58FA: $C3 $A0 $3D

    ld   [hl], d                                  ; $58FD: $72
    nop                                           ; $58FE: $00
    ld   [hl], d                                  ; $58FF: $72
    jr   nz, jr_005_5913                          ; $5900: $20 $11

    db   $FD                                      ; $5902: $FD
    ld   e, b                                     ; $5903: $58
    call label_3C77                               ; $5904: $CD $77 $3C
    call func_005_7A3A                            ; $5907: $CD $3A $7A
    ld   hl, $C3D0                                ; $590A: $21 $D0 $C3

jr_005_590D:
    add  hl, bc                                   ; $590D: $09
    inc  [hl]                                     ; $590E: $34
    ld   a, [hl]                                  ; $590F: $7E
    rra                                           ; $5910: $1F
    rra                                           ; $5911: $1F
    rra                                           ; $5912: $1F

jr_005_5913:
    and  $01                                      ; $5913: $E6 $01
    call label_3B0C                               ; $5915: $CD $0C $3B
    ld   hl, $C3D0                                ; $5918: $21 $D0 $C3
    add  hl, bc                                   ; $591B: $09
    ld   a, [hl]                                  ; $591C: $7E
    and  $30                                      ; $591D: $E6 $30
    jr   z, jr_005_592A                           ; $591F: $28 $09

    ld   hl, wEntity0SpeedY                       ; $5921: $21 $50 $C2
    add  hl, bc                                   ; $5924: $09
    ld   [hl], $F8                                ; $5925: $36 $F8
    call func_005_7AB4                            ; $5927: $CD $B4 $7A

jr_005_592A:
    ldh  a, [wActiveEntityPosY]                   ; $592A: $F0 $EC
    cp   $10                                      ; $592C: $FE $10
    jp   c, label_005_7B4B                        ; $592E: $DA $4B $7B

    ret                                           ; $5931: $C9

    ld   [hl], h                                  ; $5932: $74
    dec  b                                        ; $5933: $05
    db   $76                                      ; $5934: $76
    dec  b                                        ; $5935: $05
    db   $76                                      ; $5936: $76
    dec  h                                        ; $5937: $25
    ld   [hl], h                                  ; $5938: $74
    dec  h                                        ; $5939: $25
    ld   de, $5932                                ; $593A: $11 $32 $59
    call label_3BC0                               ; $593D: $CD $C0 $3B
    call func_005_7A3A                            ; $5940: $CD $3A $7A
    call label_C56                                ; $5943: $CD $56 $0C
    ld   hl, $C3D0                                ; $5946: $21 $D0 $C3
    add  hl, bc                                   ; $5949: $09
    inc  [hl]                                     ; $594A: $34
    ld   a, [hl]                                  ; $594B: $7E
    push af                                       ; $594C: $F5
    rra                                           ; $594D: $1F
    rra                                           ; $594E: $1F
    rra                                           ; $594F: $1F
    rra                                           ; $5950: $1F
    and  $01                                      ; $5951: $E6 $01
    call label_3B0C                               ; $5953: $CD $0C $3B
    call label_3B39                               ; $5956: $CD $39 $3B
    pop  af                                       ; $5959: $F1
    ld   e, $FC                                   ; $595A: $1E $FC
    and  $10                                      ; $595C: $E6 $10
    jr   z, jr_005_5962                           ; $595E: $28 $02

    ld   e, $04                                   ; $5960: $1E $04

jr_005_5962:
    ld   hl, wEntity0SpeedX                       ; $5962: $21 $40 $C2
    add  hl, bc                                   ; $5965: $09
    ld   [hl], e                                  ; $5966: $73
    ld   hl, wEntity0SpeedY                       ; $5967: $21 $50 $C2
    add  hl, bc                                   ; $596A: $09
    ld   [hl], $0C                                ; $596B: $36 $0C
    call func_005_7AB1                            ; $596D: $CD $B1 $7A
    ldh  a, [wActiveEntityPosY]                   ; $5970: $F0 $EC
    cp   $8B                                      ; $5972: $FE $8B
    jp   nc, label_005_7B4B                       ; $5974: $D2 $4B $7B

    ret                                           ; $5977: $C9

    ld   a, b                                     ; $5978: $78
    inc  bc                                       ; $5979: $03
    ld   a, d                                     ; $597A: $7A
    inc  bc                                       ; $597B: $03
    ld   a, h                                     ; $597C: $7C
    inc  bc                                       ; $597D: $03
    ld   a, [hl]                                  ; $597E: $7E
    inc  bc                                       ; $597F: $03
    ld   bc, $08FF                                ; $5980: $01 $FF $08
    ld   hl, sp+$21                               ; $5983: $F8 $21
    ld   b, b                                     ; $5985: $40
    jp   nz, $7E09                                ; $5986: $C2 $09 $7E

    cpl                                           ; $5989: $2F
    rra                                           ; $598A: $1F
    rra                                           ; $598B: $1F
    and  $20                                      ; $598C: $E6 $20
    ldh  [$FFED], a                               ; $598E: $E0 $ED
    ld   de, $5978                                ; $5990: $11 $78 $59
    call label_3BC0                               ; $5993: $CD $C0 $3B
    call func_005_7A3A                            ; $5996: $CD $3A $7A
    call label_C56                                ; $5999: $CD $56 $0C
    ldh  a, [hFrameCounter]                       ; $599C: $F0 $E7
    rra                                           ; $599E: $1F
    rra                                           ; $599F: $1F
    rra                                           ; $59A0: $1F
    rra                                           ; $59A1: $1F
    and  $01                                      ; $59A2: $E6 $01
    call label_3B0C                               ; $59A4: $CD $0C $3B
    call label_3B39                               ; $59A7: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $59AA: $F0 $E7
    and  $03                                      ; $59AC: $E6 $03
    jr   nz, jr_005_59CE                          ; $59AE: $20 $1E

    ld   hl, wEntitiesWalkingTable                ; $59B0: $21 $90 $C2
    add  hl, bc                                   ; $59B3: $09
    ld   a, [hl]                                  ; $59B4: $7E
    and  $01                                      ; $59B5: $E6 $01
    ld   e, a                                     ; $59B7: $5F
    ld   d, b                                     ; $59B8: $50
    ld   hl, $5980                                ; $59B9: $21 $80 $59
    add  hl, de                                   ; $59BC: $19
    ld   a, [hl]                                  ; $59BD: $7E
    ld   hl, wEntity0SpeedY                       ; $59BE: $21 $50 $C2
    add  hl, bc                                   ; $59C1: $09
    add  [hl]                                     ; $59C2: $86
    ld   [hl], a                                  ; $59C3: $77
    ld   hl, $5982                                ; $59C4: $21 $82 $59
    add  hl, de                                   ; $59C7: $19
    cp   [hl]                                     ; $59C8: $BE
    jr   nz, jr_005_59CE                          ; $59C9: $20 $03

    call IncrementEntityWalkingAttr               ; $59CB: $CD $12 $3B

jr_005_59CE:
    call func_005_7AB1                            ; $59CE: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $59D1: $CD $05 $0C
    jr   nz, jr_005_59DD                          ; $59D4: $20 $07

    ldh  a, [wActiveEntityPosX]                   ; $59D6: $F0 $EE
    cp   $A8                                      ; $59D8: $FE $A8
    jp   nc, label_005_7B4B                       ; $59DA: $D2 $4B $7B

jr_005_59DD:
    ret                                           ; $59DD: $C9

    rlca                                          ; $59DE: $07
    nop                                           ; $59DF: $00
    rrca                                          ; $59E0: $0F
    rlca                                          ; $59E1: $07
    ld   e, $0F                                   ; $59E2: $1E $0F

jr_005_59E4:
    ccf                                           ; $59E4: $3F
    jr   jr_005_5A26                              ; $59E5: $18 $3F

    db   $10                                      ; $59E7: $10
    ccf                                           ; $59E8: $3F
    inc  d                                        ; $59E9: $14
    ccf                                           ; $59EA: $3F
    db   $10                                      ; $59EB: $10
    daa                                           ; $59EC: $27
    dec  de                                       ; $59ED: $1B
    ldh  [rP1], a                                 ; $59EE: $E0 $00
    ldh  a, [hBGMapOffsetHigh]                    ; $59F0: $F0 $E0
    jr   jr_005_59E4                              ; $59F2: $18 $F0

    adc  h                                        ; $59F4: $8C
    ld   a, b                                     ; $59F5: $78
    adc  h                                        ; $59F6: $8C
    ld   [hl], b                                  ; $59F7: $70
    ccf                                           ; $59F8: $3F
    ret  nz                                       ; $59F9: $C0

    rst  $38                                      ; $59FA: $FF
    ld   a, $EF                                   ; $59FB: $3E $EF
    pop  af                                       ; $59FD: $F1
    nop                                           ; $59FE: $00
    nop                                           ; $59FF: $00
    nop                                           ; $5A00: $00
    nop                                           ; $5A01: $00
    nop                                           ; $5A02: $00
    nop                                           ; $5A03: $00
    nop                                           ; $5A04: $00
    nop                                           ; $5A05: $00
    nop                                           ; $5A06: $00
    nop                                           ; $5A07: $00
    nop                                           ; $5A08: $00
    nop                                           ; $5A09: $00
    inc  bc                                       ; $5A0A: $03
    nop                                           ; $5A0B: $00
    rlca                                          ; $5A0C: $07
    inc  bc                                       ; $5A0D: $03
    nop                                           ; $5A0E: $00
    nop                                           ; $5A0F: $00
    nop                                           ; $5A10: $00
    nop                                           ; $5A11: $00
    nop                                           ; $5A12: $00
    nop                                           ; $5A13: $00
    nop                                           ; $5A14: $00
    nop                                           ; $5A15: $00
    nop                                           ; $5A16: $00
    nop                                           ; $5A17: $00
    ccf                                           ; $5A18: $3F
    nop                                           ; $5A19: $00
    rst  $38                                      ; $5A1A: $FF
    ld   a, $EF                                   ; $5A1B: $3E $EF
    pop  af                                       ; $5A1D: $F1
    ld   hl, $C430                                ; $5A1E: $21 $30 $C4
    add  hl, bc                                   ; $5A21: $09
    ld   a, [hl]                                  ; $5A22: $7E
    and  $7F                                      ; $5A23: $E6 $7F
    ld   [hl], a                                  ; $5A25: $77

jr_005_5A26:
    ld   e, $0F                                   ; $5A26: $1E $0F
    ld   d, b                                     ; $5A28: $50

jr_005_5A29:
    ld   hl, wEntity0Type                         ; $5A29: $21 $80 $C2
    add  hl, de                                   ; $5A2C: $19
    ld   [hl], b                                  ; $5A2D: $70
    dec  e                                        ; $5A2E: $1D
    ld   a, e                                     ; $5A2F: $7B
    cp   $01                                      ; $5A30: $FE $01
    jr   nz, jr_005_5A29                          ; $5A32: $20 $F5

    ld   a, [$D478]                               ; $5A34: $FA $78 $D4
    and  a                                        ; $5A37: $A7
    jr   z, jr_005_5A5D                           ; $5A38: $28 $23

    ld   a, $05                                   ; $5A3A: $3E $05
    call SwitchBank                               ; $5A3C: $CD $0C $08
    call func_005_5B03                            ; $5A3F: $CD $03 $5B
    ld   hl, wEntitiesWalkingTable                ; $5A42: $21 $90 $C2
    add  hl, de                                   ; $5A45: $19
    ld   [hl], $07                                ; $5A46: $36 $07
    ld   hl, wEntitiesFrameCounterTable           ; $5A48: $21 $E0 $C2
    add  hl, de                                   ; $5A4B: $19
    ld   [hl], $60                                ; $5A4C: $36 $60
    ld   a, $01                                   ; $5A4E: $3E $01
    ldh  [hFFA5], a                               ; $5A50: $E0 $A5
    call IncrementEntityWalkingAttr               ; $5A52: $CD $12 $3B
    ld   [hl], $04                                ; $5A55: $36 $04
    ld   a, $C0                                   ; $5A57: $3E $C0
    ld   [wEntity0PosY], a                        ; $5A59: $EA $10 $C2
    ret                                           ; $5A5C: $C9

jr_005_5A5D:
    ld   a, $02                                   ; $5A5D: $3E $02
    ldh  [hFFA5], a                               ; $5A5F: $E0 $A5
    ld   [$D478], a                               ; $5A61: $EA $78 $D4
    call IsEntityFrameCounterZero                 ; $5A64: $CD $05 $0C
    ld   [hl], $80                                ; $5A67: $36 $80
    ld   e, $0C                                   ; $5A69: $1E $0C
    xor  a                                        ; $5A6B: $AF
    ld   hl, $D790                                ; $5A6C: $21 $90 $D7

jr_005_5A6F:
    ld   [hl+], a                                 ; $5A6F: $22
    dec  e                                        ; $5A70: $1D
    jr   nz, jr_005_5A6F                          ; $5A71: $20 $FC

    ld   a, $02                                   ; $5A73: $3E $02
    ld   [$D205], a                               ; $5A75: $EA $05 $D2
    ld   a, $5C                                   ; $5A78: $3E $5C
    ld   [wWorldMusicTrack], a                    ; $5A7A: $EA $68 $D3
    ret                                           ; $5A7D: $C9

    db   $10                                      ; $5A7E: $10
    ldh  a, [rNR42]                               ; $5A7F: $F0 $21
    or   b                                        ; $5A81: $B0
    jp   nz, $7E09                                ; $5A82: $C2 $09 $7E

    rst  $00                                      ; $5A85: $C7
    adc  [hl]                                     ; $5A86: $8E
    ld   e, d                                     ; $5A87: $5A
    ld   l, e                                     ; $5A88: $6B
    ld   e, e                                     ; $5A89: $5B
    ld   d, [hl]                                  ; $5A8A: $56
    ld   h, d                                     ; $5A8B: $62
    ret  z                                        ; $5A8C: $C8

    ld   h, d                                     ; $5A8D: $62
    ldh  a, [hActiveEntityWalking]                ; $5A8E: $F0 $F0
    rst  $00                                      ; $5A90: $C7
    sbc  h                                        ; $5A91: $9C
    ld   e, d                                     ; $5A92: $5A
    db   $DB                                      ; $5A93: $DB
    ld   e, d                                     ; $5A94: $5A
    jr   c, @+$5D                                 ; $5A95: $38 $5B

    dec  sp                                       ; $5A97: $3B
    ld   e, e                                     ; $5A98: $5B
    ld   c, e                                     ; $5A99: $4B
    ld   e, e                                     ; $5A9A: $5B

jr_005_5A9B:
    ret                                           ; $5A9B: $C9

    call func_005_5B5A                            ; $5A9C: $CD $5A $5B
    ldh  a, [hActiveEntityType]                   ; $5A9F: $F0 $EA
    cp   $05                                      ; $5AA1: $FE $05
    jr   nz, jr_005_5A9B                          ; $5AA3: $20 $F6

    ld   a, $02                                   ; $5AA5: $3E $02

jr_005_5AA7:
    ldh  [hFFE8], a                               ; $5AA7: $E0 $E8
    ld   a, $63                                   ; $5AA9: $3E $63
    call label_3B86                               ; $5AAB: $CD $86 $3B
    push bc                                       ; $5AAE: $C5
    ldh  a, [hFFE8]                               ; $5AAF: $F0 $E8
    ld   c, a                                     ; $5AB1: $4F
    ld   hl, $5A7D                                ; $5AB2: $21 $7D $5A
    add  hl, bc                                   ; $5AB5: $09
    ldh  a, [hScratchA]                           ; $5AB6: $F0 $D7
    add  [hl]                                     ; $5AB8: $86
    ld   hl, wEntity0PosX                         ; $5AB9: $21 $00 $C2
    add  hl, de                                   ; $5ABC: $19
    ld   [hl], a                                  ; $5ABD: $77
    ldh  a, [hScratchB]                           ; $5ABE: $F0 $D8
    sub  $10                                      ; $5AC0: $D6 $10
    ld   hl, wEntity0PosY                         ; $5AC2: $21 $10 $C2
    add  hl, de                                   ; $5AC5: $19
    ld   [hl], a                                  ; $5AC6: $77
    pop  bc                                       ; $5AC7: $C1
    ld   hl, wEntitiesUnknownTableB               ; $5AC8: $21 $B0 $C2
    add  hl, de                                   ; $5ACB: $19
    ld   [hl], $02                                ; $5ACC: $36 $02
    ldh  a, [hFFE8]                               ; $5ACE: $F0 $E8
    dec  a                                        ; $5AD0: $3D
    jr   nz, jr_005_5AA7                          ; $5AD1: $20 $D4

    call IsEntityFrameCounterZero                 ; $5AD3: $CD $05 $0C
    ld   [hl], $43                                ; $5AD6: $36 $43
    jp   IncrementEntityWalkingAttr               ; $5AD8: $C3 $12 $3B

    call func_005_5B5A                            ; $5ADB: $CD $5A $5B
    call func_005_7A3A                            ; $5ADE: $CD $3A $7A
    ld   a, $02                                   ; $5AE1: $3E $02
    ldh  [$FFA1], a                               ; $5AE3: $E0 $A1
    call IsEntityFrameCounterZero                 ; $5AE5: $CD $05 $0C
    and  a                                        ; $5AE8: $A7
    jr   z, jr_005_5AFE                           ; $5AE9: $28 $13

    cp   $20                                      ; $5AEB: $FE $20
    ret  nz                                       ; $5AED: $C0

    ldh  a, [hLinkPositionY]                      ; $5AEE: $F0 $99
    push af                                       ; $5AF0: $F5
    ld   a, $10                                   ; $5AF1: $3E $10
    ldh  [hLinkPositionY], a                      ; $5AF3: $E0 $99
    ld   a, $BA                                   ; $5AF5: $3E $BA
    call OpenDialog                               ; $5AF7: $CD $85 $23
    pop  af                                       ; $5AFA: $F1
    ldh  [hLinkPositionY], a                      ; $5AFB: $E0 $99
    ret                                           ; $5AFD: $C9

jr_005_5AFE:
    ld   a, $54                                   ; $5AFE: $3E $54
    ld   [wWorldMusicTrack], a                    ; $5B00: $EA $68 $D3

func_005_5B03:
    ld   a, $63                                   ; $5B03: $3E $63
    call label_3B86                               ; $5B05: $CD $86 $3B
    ld   hl, $C360                                ; $5B08: $21 $60 $C3
    add  hl, de                                   ; $5B0B: $19
    ld   [hl], $0C                                ; $5B0C: $36 $0C
    ld   hl, wEntity0PosX                         ; $5B0E: $21 $00 $C2
    add  hl, de                                   ; $5B11: $19
    ld   [hl], $D0                                ; $5B12: $36 $D0
    ld   hl, wEntity0PosY                         ; $5B14: $21 $10 $C2
    add  hl, de                                   ; $5B17: $19
    ld   [hl], $18                                ; $5B18: $36 $18
    ld   hl, wEntitiesUnknownTableB               ; $5B1A: $21 $B0 $C2
    add  hl, de                                   ; $5B1D: $19
    ld   [hl], $01                                ; $5B1E: $36 $01
    ld   hl, wEntity0SpeedX                       ; $5B20: $21 $40 $C2
    add  hl, de                                   ; $5B23: $19
    ld   [hl], $E0                                ; $5B24: $36 $E0
    ld   hl, $C380                                ; $5B26: $21 $80 $C3
    add  hl, de                                   ; $5B29: $19
    ld   [hl], $00                                ; $5B2A: $36 $00
    ld   hl, wEntitiesFrameCounterTable           ; $5B2C: $21 $E0 $C2
    add  hl, de                                   ; $5B2F: $19
    ld   [hl], $80                                ; $5B30: $36 $80
    call func_005_5C20                            ; $5B32: $CD $20 $5C
    jp   IncrementEntityWalkingAttr               ; $5B35: $C3 $12 $3B

    jp   label_005_5B5A                           ; $5B38: $C3 $5A $5B

    call func_005_5B5A                            ; $5B3B: $CD $5A $5B
    call func_005_7A3A                            ; $5B3E: $CD $3A $7A
    call func_005_7AB1                            ; $5B41: $CD $B1 $7A
    ld   hl, wEntity0SpeedY                       ; $5B44: $21 $50 $C2
    add  hl, bc                                   ; $5B47: $09
    inc  [hl]                                     ; $5B48: $34
    inc  [hl]                                     ; $5B49: $34
    ret                                           ; $5B4A: $C9

    ld   hl, $C340                                ; $5B4B: $21 $40 $C3
    add  hl, bc                                   ; $5B4E: $09
    ld   [hl], $C2                                ; $5B4F: $36 $C2
    ret                                           ; $5B51: $C9

    ld   a, [hl]                                  ; $5B52: $7E
    ld   [bc], a                                  ; $5B53: $02
    ld   a, [hl]                                  ; $5B54: $7E
    ld   [hl+], a                                 ; $5B55: $22
    ld   a, [hl]                                  ; $5B56: $7E
    ld   b, d                                     ; $5B57: $42
    ld   a, [hl]                                  ; $5B58: $7E
    ld   h, d                                     ; $5B59: $62

func_005_5B5A:
label_005_5B5A:
    ld   de, $5B52                                ; $5B5A: $11 $52 $5B
    jp   label_3BC0                               ; $5B5D: $C3 $C0 $3B

    ld   [bc], a                                  ; $5B60: $02
    ld   [bc], a                                  ; $5B61: $02
    ld   [bc], a                                  ; $5B62: $02
    nop                                           ; $5B63: $00
    ld   bc, $0100                                ; $5B64: $01 $00 $01
    inc  b                                        ; $5B67: $04
    inc  b                                        ; $5B68: $04
    inc  b                                        ; $5B69: $04
    inc  b                                        ; $5B6A: $04
    call func_005_61F2                            ; $5B6B: $CD $F2 $61
    ldh  a, [hActiveEntityType]                   ; $5B6E: $F0 $EA
    cp   $05                                      ; $5B70: $FE $05
    jp   nz, label_005_7E6C                       ; $5B72: $C2 $6C $7E

    call func_005_7A3A                            ; $5B75: $CD $3A $7A
    call label_C56                                ; $5B78: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $5B7B: $F0 $F0
    cp   $0E                                      ; $5B7D: $FE $0E
    jr   z, jr_005_5BB7                           ; $5B7F: $28 $36

    ld   hl, $C420                                ; $5B81: $21 $20 $C4
    add  hl, bc                                   ; $5B84: $09
    ld   a, [hl]                                  ; $5B85: $7E
    and  a                                        ; $5B86: $A7
    jr   z, jr_005_5BB7                           ; $5B87: $28 $2E

    ld   hl, $C420                                ; $5B89: $21 $20 $C4
    add  hl, bc                                   ; $5B8C: $09
    ld   [hl], $50                                ; $5B8D: $36 $50
    call label_3D7F                               ; $5B8F: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $5B92: $CD $12 $3B
    ld   [hl], $0E                                ; $5B95: $36 $0E
    ld   a, $31                                   ; $5B97: $3E $31
    ldh  [hNoiseSfx], a                            ; $5B99: $E0 $F4
    ld   hl, $C340                                ; $5B9B: $21 $40 $C3
    add  hl, bc                                   ; $5B9E: $09
    ld   [hl], $42                                ; $5B9F: $36 $42
    ld   hl, wEntitiesUnknownTableD               ; $5BA1: $21 $D0 $C2
    add  hl, bc                                   ; $5BA4: $09
    inc  [hl]                                     ; $5BA5: $34
    ld   a, [hl]                                  ; $5BA6: $7E
    cp   $08                                      ; $5BA7: $FE $08
    jr   nz, jr_005_5BAC                          ; $5BA9: $20 $01

    dec  [hl]                                     ; $5BAB: $35

jr_005_5BAC:
    ld   e, a                                     ; $5BAC: $5F
    ld   d, b                                     ; $5BAD: $50
    ld   hl, $5B60                                ; $5BAE: $21 $60 $5B
    add  hl, de                                   ; $5BB1: $19
    ld   a, [hl]                                  ; $5BB2: $7E
    ld   [$D205], a                               ; $5BB3: $EA $05 $D2
    ret                                           ; $5BB6: $C9

jr_005_5BB7:
    ldh  a, [hActiveEntityWalking]                ; $5BB7: $F0 $F0
    rst  $00                                      ; $5BB9: $C7
    ret  c                                        ; $5BBA: $D8

    ld   e, e                                     ; $5BBB: $5B
    db   $EC                                      ; $5BBC: $EC
    ld   e, e                                     ; $5BBD: $5B
    ld   [hl-], a                                 ; $5BBE: $32
    ld   e, h                                     ; $5BBF: $5C
    ld   e, e                                     ; $5BC0: $5B
    ld   e, h                                     ; $5BC1: $5C
    adc  e                                        ; $5BC2: $8B
    ld   e, h                                     ; $5BC3: $5C
    xor  l                                        ; $5BC4: $AD
    ld   e, h                                     ; $5BC5: $5C
    rst  $08                                      ; $5BC6: $CF
    ld   e, h                                     ; $5BC7: $5C
    inc  d                                        ; $5BC8: $14
    ld   e, l                                     ; $5BC9: $5D
    db   $EC                                      ; $5BCA: $EC
    ld   e, l                                     ; $5BCB: $5D
    dec  a                                        ; $5BCC: $3D
    ld   e, [hl]                                  ; $5BCD: $5E
    dec  sp                                       ; $5BCE: $3B
    ld   e, a                                     ; $5BCF: $5F
    sub  e                                        ; $5BD0: $93
    ld   e, a                                     ; $5BD1: $5F
    xor  b                                        ; $5BD2: $A8
    ld   e, a                                     ; $5BD3: $5F
    rla                                           ; $5BD4: $17
    ld   h, b                                     ; $5BD5: $60
    jr   z, jr_005_5C38                           ; $5BD6: $28 $60

    call func_005_7AB1                            ; $5BD8: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $5BDB: $CD $05 $0C
    ret  nz                                       ; $5BDE: $C0

    call IncrementEntityWalkingAttr               ; $5BDF: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5BE2: $CD $05 $0C
    ld   [hl], $20                                ; $5BE5: $36 $20
    ld   a, $FF                                   ; $5BE7: $3E $FF
    jp   label_3B0C                               ; $5BE9: $C3 $0C $3B

    call IsEntityFrameCounterZero                 ; $5BEC: $CD $05 $0C
    jr   nz, jr_005_5C24                          ; $5BEF: $20 $33

    xor  a                                        ; $5BF1: $AF
    call label_3B0C                               ; $5BF2: $CD $0C $3B
    ld   hl, wEntity0PosY                         ; $5BF5: $21 $10 $C2
    add  hl, bc                                   ; $5BF8: $09
    ld   a, [hl]                                  ; $5BF9: $7E
    add  $14                                      ; $5BFA: $C6 $14
    ld   [hl], a                                  ; $5BFC: $77
    ld   hl, wEntity0SpeedX                       ; $5BFD: $21 $40 $C2
    add  hl, bc                                   ; $5C00: $09
    ld   a, [hl]                                  ; $5C01: $7E
    cpl                                           ; $5C02: $2F
    inc  a                                        ; $5C03: $3C
    ld   [hl], a                                  ; $5C04: $77
    ld   hl, $C380                                ; $5C05: $21 $80 $C3
    add  hl, bc                                   ; $5C08: $09
    ld   a, [hl]                                  ; $5C09: $7E
    xor  $04                                      ; $5C0A: $EE $04
    ld   [hl], a                                  ; $5C0C: $77
    ld   hl, wEntitiesUnknownTableC               ; $5C0D: $21 $C0 $C2
    add  hl, bc                                   ; $5C10: $09
    inc  [hl]                                     ; $5C11: $34
    ld   a, [hl]                                  ; $5C12: $7E
    cp   $02                                      ; $5C13: $FE $02
    jr   z, jr_005_5C25                           ; $5C15: $28 $0E

    call IncrementEntityWalkingAttr               ; $5C17: $CD $12 $3B
    ld   [hl], b                                  ; $5C1A: $70
    call IsEntityFrameCounterZero                 ; $5C1B: $CD $05 $0C
    ld   [hl], $80                                ; $5C1E: $36 $80

func_005_5C20:
    ld   a, $22                                   ; $5C20: $3E $22
    ldh  [hNoiseSfx], a                            ; $5C22: $E0 $F4

jr_005_5C24:
    ret                                           ; $5C24: $C9

jr_005_5C25:
    call IncrementEntityWalkingAttr               ; $5C25: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5C28: $CD $05 $0C
    ld   [hl], $30                                ; $5C2B: $36 $30
    ld   a, $30                                   ; $5C2D: $3E $30
    ldh  [hNoiseSfx], a                            ; $5C2F: $E0 $F4
    ret                                           ; $5C31: $C9

    call func_005_7AB1                            ; $5C32: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $5C35: $CD $05 $0C

jr_005_5C38:
    cp   $01                                      ; $5C38: $FE $01
    jr   nz, jr_005_5C41                          ; $5C3A: $20 $05

    ld   hl, hJingle                              ; $5C3C: $21 $F2 $FF
    ld   [hl], $30                                ; $5C3F: $36 $30

jr_005_5C41:
    and  a                                        ; $5C41: $A7
    ret  nz                                       ; $5C42: $C0

    ld   hl, wEntity0SpeedX                       ; $5C43: $21 $40 $C2
    add  hl, bc                                   ; $5C46: $09
    inc  [hl]                                     ; $5C47: $34
    jr   nz, jr_005_5C58                          ; $5C48: $20 $0E

    call IncrementEntityWalkingAttr               ; $5C4A: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5C4D: $CD $05 $0C
    ld   [hl], $40                                ; $5C50: $36 $40
    ld   hl, $C29E                                ; $5C52: $21 $9E $C2
    inc  [hl]                                     ; $5C55: $34
    inc  hl                                       ; $5C56: $23
    inc  [hl]                                     ; $5C57: $34

jr_005_5C58:
    jp   label_005_5C7B                           ; $5C58: $C3 $7B $5C

    ld   a, $02                                   ; $5C5B: $3E $02
    ldh  [$FFA1], a                               ; $5C5D: $E0 $A1
    call IsEntityFrameCounterZero                 ; $5C5F: $CD $05 $0C
    jr   nz, jr_005_5C7B                          ; $5C62: $20 $17

    ld   [hl], $28                                ; $5C64: $36 $28
    ld   a, $D0                                   ; $5C66: $3E $D0
    ld   [wEntity0SpeedY], a                      ; $5C68: $EA $50 $C2
    ld   a, $24                                   ; $5C6B: $3E $24
    ldh  [hJingle], a                             ; $5C6D: $E0 $F2
    ld   a, $12                                   ; $5C6F: $3E $12
    ld   [wEntity0SpeedX], a                      ; $5C71: $EA $40 $C2
    ld   hl, wEntitiesWalkingTable                ; $5C74: $21 $90 $C2
    inc  [hl]                                     ; $5C77: $34
    call IncrementEntityWalkingAttr               ; $5C78: $CD $12 $3B

label_005_5C7B:
jr_005_5C7B:
    ld   hl, $C3D0                                ; $5C7B: $21 $D0 $C3
    add  hl, bc                                   ; $5C7E: $09
    inc  [hl]                                     ; $5C7F: $34
    ld   a, [hl]                                  ; $5C80: $7E
    and  $04                                      ; $5C81: $E6 $04
    ld   a, $01                                   ; $5C83: $3E $01
    jr   z, jr_005_5C88                           ; $5C85: $28 $01

    inc  a                                        ; $5C87: $3C

jr_005_5C88:
    jp   label_3B0C                               ; $5C88: $C3 $0C $3B

    ld   a, $02                                   ; $5C8B: $3E $02
    ldh  [$FFA1], a                               ; $5C8D: $E0 $A1
    call IsEntityFrameCounterZero                 ; $5C8F: $CD $05 $0C
    jr   nz, jr_005_5CA6                          ; $5C92: $20 $12

    ld   a, $01                                   ; $5C94: $3E $01
    ldh  [hFFA5], a                               ; $5C96: $E0 $A5
    ld   [hl], $20                                ; $5C98: $36 $20
    call IncrementEntityWalkingAttr               ; $5C9A: $CD $12 $3B
    ld   hl, wEntitiesWalkingTable                ; $5C9D: $21 $90 $C2
    inc  [hl]                                     ; $5CA0: $34
    ld   a, $C0                                   ; $5CA1: $3E $C0
    ld   [wEntity0PosY], a                        ; $5CA3: $EA $10 $C2

jr_005_5CA6:
    jp   label_005_5C7B                           ; $5CA6: $C3 $7B $5C

    ld   bc, $0302                                ; $5CA9: $01 $02 $03
    ld   [bc], a                                  ; $5CAC: $02
    ld   a, $02                                   ; $5CAD: $3E $02
    ldh  [$FFA1], a                               ; $5CAF: $E0 $A1
    call IsEntityFrameCounterZero                 ; $5CB1: $CD $05 $0C
    jr   nz, jr_005_5CB9                          ; $5CB4: $20 $03

    call IncrementEntityWalkingAttr               ; $5CB6: $CD $12 $3B

func_005_5CB9:
label_005_5CB9:
jr_005_5CB9:
    ld   hl, $C3D0                                ; $5CB9: $21 $D0 $C3
    add  hl, bc                                   ; $5CBC: $09
    inc  [hl]                                     ; $5CBD: $34
    ld   a, [hl]                                  ; $5CBE: $7E
    rra                                           ; $5CBF: $1F
    rra                                           ; $5CC0: $1F
    rra                                           ; $5CC1: $1F
    nop                                           ; $5CC2: $00
    and  $03                                      ; $5CC3: $E6 $03
    ld   e, a                                     ; $5CC5: $5F
    ld   d, b                                     ; $5CC6: $50
    ld   hl, $5CA9                                ; $5CC7: $21 $A9 $5C
    add  hl, de                                   ; $5CCA: $19
    ld   a, [hl]                                  ; $5CCB: $7E
    jp   label_3B0C                               ; $5CCC: $C3 $0C $3B

    call func_005_7AB1                            ; $5CCF: $CD $B1 $7A
    ld   hl, wEntity0SpeedX                       ; $5CD2: $21 $40 $C2
    add  hl, bc                                   ; $5CD5: $09
    ld   a, [hl]                                  ; $5CD6: $7E
    cp   $D4                                      ; $5CD7: $FE $D4
    jr   nz, jr_005_5CFB                          ; $5CD9: $20 $20

    ldh  a, [wActiveEntityPosX]                   ; $5CDB: $F0 $EE
    and  $F8                                      ; $5CDD: $E6 $F8
    cp   $C0                                      ; $5CDF: $FE $C0
    jr   nz, jr_005_5CEC                          ; $5CE1: $20 $09

    call IncrementEntityWalkingAttr               ; $5CE3: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5CE6: $CD $05 $0C
    ld   [hl], $80                                ; $5CE9: $36 $80
    ret                                           ; $5CEB: $C9

jr_005_5CEC:
    ldh  a, [hFrameCounter]                       ; $5CEC: $F0 $E7
    and  $00                                      ; $5CEE: $E6 $00
    jr   nz, jr_005_5CF7                          ; $5CF0: $20 $05

jr_005_5CF2:
    ld   hl, wEntity0SpeedY                       ; $5CF2: $21 $50 $C2
    add  hl, bc                                   ; $5CF5: $09
    dec  [hl]                                     ; $5CF6: $35

jr_005_5CF7:
    xor  a                                        ; $5CF7: $AF
    jp   label_3B0C                               ; $5CF8: $C3 $0C $3B

jr_005_5CFB:
    dec  [hl]                                     ; $5CFB: $35
    dec  [hl]                                     ; $5CFC: $35
    call func_005_5CB9                            ; $5CFD: $CD $B9 $5C
    call func_005_5CB9                            ; $5D00: $CD $B9 $5C
    jp   label_005_5CB9                           ; $5D03: $C3 $B9 $5C

    ld   hl, sp-$58                               ; $5D06: $F8 $A8
    jr   nc, @-$2E                                ; $5D08: $30 $D0

    jr   nc, jr_005_5D7C                          ; $5D0A: $30 $70

    call c, $F824                                 ; $5D0C: $DC $24 $F8
    xor  b                                        ; $5D0F: $A8
    jr   nz, jr_005_5CF2                          ; $5D10: $20 $E0

    inc  b                                        ; $5D12: $04
    nop                                           ; $5D13: $00
    call IsEntityFrameCounterZero                 ; $5D14: $CD $05 $0C
    jr   nz, jr_005_5D68                          ; $5D17: $20 $4F

    ld   a, [$D205]                               ; $5D19: $FA $05 $D2
    rst  $00                                      ; $5D1C: $C7
    daa                                           ; $5D1D: $27
    ld   e, l                                     ; $5D1E: $5D
    ld   l, c                                     ; $5D1F: $69
    ld   e, l                                     ; $5D20: $5D
    and  e                                        ; $5D21: $A3
    ld   e, l                                     ; $5D22: $5D
    and  e                                        ; $5D23: $A3
    ld   e, l                                     ; $5D24: $5D
    ld   l, c                                     ; $5D25: $69
    ld   e, l                                     ; $5D26: $5D
    call GetRandomByte                            ; $5D27: $CD $0D $28
    and  $03                                      ; $5D2A: $E6 $03
    ld   [$D205], a                               ; $5D2C: $EA $05 $D2
    ld   e, $00                                   ; $5D2F: $1E $00
    ldh  a, [hLinkPositionX]                      ; $5D31: $F0 $98
    cp   $50                                      ; $5D33: $FE $50
    jr   nc, jr_005_5D38                          ; $5D35: $30 $01

    inc  e                                        ; $5D37: $1C

jr_005_5D38:
    ld   d, b                                     ; $5D38: $50
    ld   hl, $5D06                                ; $5D39: $21 $06 $5D
    add  hl, de                                   ; $5D3C: $19
    ld   a, [hl]                                  ; $5D3D: $7E
    ld   hl, wEntity0PosX                         ; $5D3E: $21 $00 $C2
    add  hl, bc                                   ; $5D41: $09
    ld   [hl], a                                  ; $5D42: $77
    ld   hl, $5D08                                ; $5D43: $21 $08 $5D
    add  hl, de                                   ; $5D46: $19
    ld   a, [hl]                                  ; $5D47: $7E
    ld   hl, wEntity0SpeedX                       ; $5D48: $21 $40 $C2
    add  hl, bc                                   ; $5D4B: $09
    ld   [hl], a                                  ; $5D4C: $77
    ld   hl, $5D12                                ; $5D4D: $21 $12 $5D
    add  hl, de                                   ; $5D50: $19
    ld   a, [hl]                                  ; $5D51: $7E
    ld   hl, $C380                                ; $5D52: $21 $80 $C3
    add  hl, bc                                   ; $5D55: $09
    ld   [hl], a                                  ; $5D56: $77
    ld   hl, wEntity0PosY                         ; $5D57: $21 $10 $C2
    add  hl, bc                                   ; $5D5A: $09
    ld   [hl], $00                                ; $5D5B: $36 $00
    ld   hl, wEntity0SpeedY                       ; $5D5D: $21 $50 $C2
    add  hl, bc                                   ; $5D60: $09
    ld   [hl], $20                                ; $5D61: $36 $20
    call IncrementEntityWalkingAttr               ; $5D63: $CD $12 $3B
    ld   [hl], $08                                ; $5D66: $36 $08

jr_005_5D68:
    ret                                           ; $5D68: $C9

    ld   e, $00                                   ; $5D69: $1E $00
    ldh  a, [hLinkPositionX]                      ; $5D6B: $F0 $98
    cp   $50                                      ; $5D6D: $FE $50
    jr   nc, jr_005_5D72                          ; $5D6F: $30 $01

    inc  e                                        ; $5D71: $1C

jr_005_5D72:
    ld   d, b                                     ; $5D72: $50
    ld   hl, $5D0A                                ; $5D73: $21 $0A $5D
    add  hl, de                                   ; $5D76: $19
    ld   a, [hl]                                  ; $5D77: $7E
    ld   hl, wEntity0PosX                         ; $5D78: $21 $00 $C2
    add  hl, bc                                   ; $5D7B: $09

jr_005_5D7C:
    ld   [hl], a                                  ; $5D7C: $77
    ld   hl, wEntity0SpeedX                       ; $5D7D: $21 $40 $C2
    add  hl, bc                                   ; $5D80: $09
    ld   [hl], b                                  ; $5D81: $70
    ld   hl, $5D12                                ; $5D82: $21 $12 $5D
    add  hl, de                                   ; $5D85: $19
    ld   a, [hl]                                  ; $5D86: $7E
    ld   hl, $C380                                ; $5D87: $21 $80 $C3
    add  hl, bc                                   ; $5D8A: $09
    ld   [hl], a                                  ; $5D8B: $77
    ld   hl, wEntity0PosY                         ; $5D8C: $21 $10 $C2
    add  hl, bc                                   ; $5D8F: $09
    ld   [hl], $F0                                ; $5D90: $36 $F0
    ld   hl, wEntity0SpeedY                       ; $5D92: $21 $50 $C2
    add  hl, bc                                   ; $5D95: $09
    ld   [hl], $10                                ; $5D96: $36 $10
    call IncrementEntityWalkingAttr               ; $5D98: $CD $12 $3B
    ld   [hl], $0B                                ; $5D9B: $36 $0B
    call IsEntityFrameCounterZero                 ; $5D9D: $CD $05 $0C
    ld   [hl], $30                                ; $5DA0: $36 $30
    ret                                           ; $5DA2: $C9

    call GetRandomByte                            ; $5DA3: $CD $0D $28
    and  $01                                      ; $5DA6: $E6 $01
    ld   e, a                                     ; $5DA8: $5F
    ld   d, b                                     ; $5DA9: $50
    ld   hl, $5D0E                                ; $5DAA: $21 $0E $5D
    add  hl, de                                   ; $5DAD: $19
    ld   a, [hl]                                  ; $5DAE: $7E
    ld   hl, wEntity0PosX                         ; $5DAF: $21 $00 $C2
    add  hl, bc                                   ; $5DB2: $09
    ld   [hl], a                                  ; $5DB3: $77
    ld   hl, $5D10                                ; $5DB4: $21 $10 $5D
    add  hl, de                                   ; $5DB7: $19
    ld   a, [hl]                                  ; $5DB8: $7E
    ld   hl, wEntity0SpeedX                       ; $5DB9: $21 $40 $C2
    add  hl, bc                                   ; $5DBC: $09
    ld   [hl], a                                  ; $5DBD: $77
    ld   hl, wEntity0SpeedY                       ; $5DBE: $21 $50 $C2
    add  hl, bc                                   ; $5DC1: $09
    ld   [hl], b                                  ; $5DC2: $70
    ld   hl, $5D12                                ; $5DC3: $21 $12 $5D
    add  hl, de                                   ; $5DC6: $19
    ld   a, [hl]                                  ; $5DC7: $7E
    ld   hl, $C380                                ; $5DC8: $21 $80 $C3
    add  hl, bc                                   ; $5DCB: $09
    ld   [hl], a                                  ; $5DCC: $77
    call GetRandomByte                            ; $5DCD: $CD $0D $28
    and  $3F                                      ; $5DD0: $E6 $3F
    add  $18                                      ; $5DD2: $C6 $18
    ld   hl, wEntity0PosY                         ; $5DD4: $21 $10 $C2
    add  hl, bc                                   ; $5DD7: $09
    ld   [hl], a                                  ; $5DD8: $77
    ldh  a, [hFF9C]                               ; $5DD9: $F0 $9C
    and  a                                        ; $5DDB: $A7
    jr   z, jr_005_5DE1                           ; $5DDC: $28 $03

    ldh  a, [hLinkPositionY]                      ; $5DDE: $F0 $99
    ld   [hl], a                                  ; $5DE0: $77

jr_005_5DE1:
    call IncrementEntityWalkingAttr               ; $5DE1: $CD $12 $3B
    ld   [hl], $0D                                ; $5DE4: $36 $0D
    call IsEntityFrameCounterZero                 ; $5DE6: $CD $05 $0C
    ld   [hl], $70                                ; $5DE9: $36 $70
    ret                                           ; $5DEB: $C9

    ld   a, $01                                   ; $5DEC: $3E $01
    call label_3B0C                               ; $5DEE: $CD $0C $3B
    call func_005_7AB1                            ; $5DF1: $CD $B1 $7A
    ld   hl, wEntity0SpeedY                       ; $5DF4: $21 $50 $C2
    call func_005_5E01                            ; $5DF7: $CD $01 $5E
    ld   a, [hl]                                  ; $5DFA: $7E
    and  a                                        ; $5DFB: $A7
    jr   z, jr_005_5E0E                           ; $5DFC: $28 $10

    ld   hl, wEntity0SpeedX                       ; $5DFE: $21 $40 $C2

func_005_5E01:
    add  hl, bc                                   ; $5E01: $09
    ld   a, [hl]                                  ; $5E02: $7E
    and  a                                        ; $5E03: $A7
    jr   z, jr_005_5E0D                           ; $5E04: $28 $07

    and  $80                                      ; $5E06: $E6 $80
    jr   nz, jr_005_5E0C                          ; $5E08: $20 $02

    dec  [hl]                                     ; $5E0A: $35
    dec  [hl]                                     ; $5E0B: $35

jr_005_5E0C:
    inc  [hl]                                     ; $5E0C: $34

jr_005_5E0D:
    ret                                           ; $5E0D: $C9

jr_005_5E0E:
    call IncrementEntityWalkingAttr               ; $5E0E: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5E11: $CD $05 $0C
    ld   [hl], $FF                                ; $5E14: $36 $FF
    ret                                           ; $5E16: $C9

    xor  $12                                      ; $5E17: $EE $12
    ret  nc                                       ; $5E19: $D0

    jr   nc, jr_005_5E2C                          ; $5E1A: $30 $10

    ldh  a, [hScratchB]                           ; $5E1C: $F0 $D8
    call nc, $CCD0                                ; $5E1E: $D4 $D0 $CC
    ret  z                                        ; $5E21: $C8

    call nz, $BCC0                                ; $5E22: $C4 $C0 $BC
    jr   z, jr_005_5E53                           ; $5E25: $28 $2C

    jr   nc, @+$36                                ; $5E27: $30 $34

    jr   c, jr_005_5E67                           ; $5E29: $38 $3C

    ld   b, b                                     ; $5E2B: $40

jr_005_5E2C:
    ld   b, h                                     ; $5E2C: $44
    jr   nc, @+$30                                ; $5E2D: $30 $2E

    inc  l                                        ; $5E2F: $2C
    ld   a, [hl+]                                 ; $5E30: $2A
    jr   z, jr_005_5E59                           ; $5E31: $28 $26

    inc  h                                        ; $5E33: $24
    ld   [hl+], a                                 ; $5E34: $22
    jr   nc, jr_005_5E65                          ; $5E35: $30 $2E

    inc  l                                        ; $5E37: $2C
    ld   a, [hl+]                                 ; $5E38: $2A
    jr   z, jr_005_5E61                           ; $5E39: $28 $26

    inc  h                                        ; $5E3B: $24
    ld   [hl+], a                                 ; $5E3C: $22
    call IsEntityFrameCounterZero                 ; $5E3D: $CD $05 $0C
    jp   z, label_005_5F30                        ; $5E40: $CA $30 $5F

    ld   hl, wEntity0PosY                         ; $5E43: $21 $10 $C2
    add  hl, bc                                   ; $5E46: $09
    ldh  a, [hFrameCounter]                       ; $5E47: $F0 $E7
    and  $03                                      ; $5E49: $E6 $03
    jr   nz, jr_005_5E56                          ; $5E4B: $20 $09

    ldh  a, [hFrameCounter]                       ; $5E4D: $F0 $E7
    and  $20                                      ; $5E4F: $E6 $20
    jr   z, jr_005_5E55                           ; $5E51: $28 $02

jr_005_5E53:
    inc  [hl]                                     ; $5E53: $34
    inc  [hl]                                     ; $5E54: $34

jr_005_5E55:
    dec  [hl]                                     ; $5E55: $35

jr_005_5E56:
    call func_005_5CB9                            ; $5E56: $CD $B9 $5C

jr_005_5E59:
    call func_005_5CB9                            ; $5E59: $CD $B9 $5C
    ldh  a, [hFF9C]                               ; $5E5C: $F0 $9C
    and  a                                        ; $5E5E: $A7
    jr   nz, jr_005_5E8A                          ; $5E5F: $20 $29

jr_005_5E61:
    ld   a, [$C146]                               ; $5E61: $FA $46 $C1
    and  a                                        ; $5E64: $A7

jr_005_5E65:
    jr   z, jr_005_5E8A                           ; $5E65: $28 $23

jr_005_5E67:
    ld   hl, $C380                                ; $5E67: $21 $80 $C3
    add  hl, bc                                   ; $5E6A: $09
    ld   a, [hl]                                  ; $5E6B: $7E
    rra                                           ; $5E6C: $1F
    rra                                           ; $5E6D: $1F
    and  $01                                      ; $5E6E: $E6 $01
    ld   e, a                                     ; $5E70: $5F
    ld   d, b                                     ; $5E71: $50
    ld   hl, $5E19                                ; $5E72: $21 $19 $5E
    add  hl, de                                   ; $5E75: $19
    ld   a, [hl]                                  ; $5E76: $7E
    ld   hl, hLinkPositionXIncrement              ; $5E77: $21 $9A $FF
    sub  [hl]                                     ; $5E7A: $96
    and  a                                        ; $5E7B: $A7
    jr   z, jr_005_5EA3                           ; $5E7C: $28 $25

    and  $80                                      ; $5E7E: $E6 $80
    jr   nz, jr_005_5E86                          ; $5E80: $20 $04

    inc  [hl]                                     ; $5E82: $34
    inc  [hl]                                     ; $5E83: $34
    inc  [hl]                                     ; $5E84: $34
    inc  [hl]                                     ; $5E85: $34

jr_005_5E86:
    dec  [hl]                                     ; $5E86: $35
    dec  [hl]                                     ; $5E87: $35
    jr   jr_005_5EA3                              ; $5E88: $18 $19

jr_005_5E8A:
    ld   hl, $C380                                ; $5E8A: $21 $80 $C3
    add  hl, bc                                   ; $5E8D: $09
    ld   e, [hl]                                  ; $5E8E: $5E
    srl  e                                        ; $5E8F: $CB $3B
    srl  e                                        ; $5E91: $CB $3B
    ld   d, b                                     ; $5E93: $50
    ld   hl, $5E17                                ; $5E94: $21 $17 $5E
    add  hl, de                                   ; $5E97: $19
    ld   a, [hl]                                  ; $5E98: $7E
    ldh  [hLinkPositionXIncrement], a             ; $5E99: $E0 $9A
    push bc                                       ; $5E9B: $C5
    call $21B2                                    ; $5E9C: $CD $B2 $21
    call label_3E19                               ; $5E9F: $CD $19 $3E
    pop  bc                                       ; $5EA2: $C1

jr_005_5EA3:
    ld   a, [$D210]                               ; $5EA3: $FA $10 $D2
    inc  a                                        ; $5EA6: $3C
    cp   $22                                      ; $5EA7: $FE $22
    jr   c, jr_005_5EB0                           ; $5EA9: $38 $05

    ld   a, $32                                   ; $5EAB: $3E $32
    ldh  [hNoiseSfx], a                            ; $5EAD: $E0 $F4
    xor  a                                        ; $5EAF: $AF

jr_005_5EB0:
    ld   [$D210], a                               ; $5EB0: $EA $10 $D2
    call IsEntityFrameCounterZero                 ; $5EB3: $CD $05 $0C
    cp   $C0                                      ; $5EB6: $FE $C0
    jr   nc, jr_005_5F2F                          ; $5EB8: $30 $75

    ldh  a, [hFrameCounter]                       ; $5EBA: $F0 $E7
    and  $0F                                      ; $5EBC: $E6 $0F
    jr   nz, jr_005_5F2F                          ; $5EBE: $20 $6F

    ld   a, $63                                   ; $5EC0: $3E $63
    ld   e, $03                                   ; $5EC2: $1E $03
    call label_3B98                               ; $5EC4: $CD $98 $3B
    jr   c, jr_005_5F2F                           ; $5EC7: $38 $66

    ld   hl, wEntitiesUnknownTableB               ; $5EC9: $21 $B0 $C2
    add  hl, de                                   ; $5ECC: $19
    ld   [hl], $03                                ; $5ECD: $36 $03
    push bc                                       ; $5ECF: $C5
    ld   hl, $C380                                ; $5ED0: $21 $80 $C3
    add  hl, bc                                   ; $5ED3: $09
    ld   c, [hl]                                  ; $5ED4: $4E
    srl  c                                        ; $5ED5: $CB $39
    srl  c                                        ; $5ED7: $CB $39
    ld   hl, $5E1B                                ; $5ED9: $21 $1B $5E
    add  hl, bc                                   ; $5EDC: $09
    ldh  a, [hScratchA]                           ; $5EDD: $F0 $D7
    add  [hl]                                     ; $5EDF: $86
    ld   hl, wEntity0PosX                         ; $5EE0: $21 $00 $C2
    add  hl, de                                   ; $5EE3: $19
    ld   [hl], a                                  ; $5EE4: $77
    ldh  a, [hScratchB]                           ; $5EE5: $F0 $D8
    ld   hl, wEntity0PosY                         ; $5EE7: $21 $10 $C2
    add  hl, de                                   ; $5EEA: $19
    add  $0C                                      ; $5EEB: $C6 $0C
    ld   [hl], a                                  ; $5EED: $77
    ld   hl, wEntitiesUnknownTableG               ; $5EEE: $21 $B0 $C3
    add  hl, de                                   ; $5EF1: $19
    ld   a, c                                     ; $5EF2: $79
    xor  $01                                      ; $5EF3: $EE $01
    ld   [hl], a                                  ; $5EF5: $77
    ld   hl, $C380                                ; $5EF6: $21 $80 $C3
    add  hl, de                                   ; $5EF9: $19
    ld   [hl], a                                  ; $5EFA: $77
    sla  c                                        ; $5EFB: $CB $21
    sla  c                                        ; $5EFD: $CB $21
    sla  c                                        ; $5EFF: $CB $21
    call GetRandomByte                            ; $5F01: $CD $0D $28
    and  $07                                      ; $5F04: $E6 $07
    add  c                                        ; $5F06: $81
    ld   c, a                                     ; $5F07: $4F
    ld   hl, $5E2D                                ; $5F08: $21 $2D $5E
    add  hl, bc                                   ; $5F0B: $09
    ld   a, [hl]                                  ; $5F0C: $7E
    ld   hl, wEntity0SpeedY                       ; $5F0D: $21 $50 $C2
    add  hl, de                                   ; $5F10: $19
    ld   [hl], a                                  ; $5F11: $77
    ld   hl, $5E1D                                ; $5F12: $21 $1D $5E
    add  hl, bc                                   ; $5F15: $09
    ld   a, [hl]                                  ; $5F16: $7E
    ld   hl, wEntity0SpeedX                       ; $5F17: $21 $40 $C2
    add  hl, de                                   ; $5F1A: $19
    ld   [hl], a                                  ; $5F1B: $77
    pop  bc                                       ; $5F1C: $C1
    ld   hl, $C340                                ; $5F1D: $21 $40 $C3
    add  hl, de                                   ; $5F20: $19
    ld   [hl], $02                                ; $5F21: $36 $02
    ld   hl, $C430                                ; $5F23: $21 $30 $C4
    add  hl, de                                   ; $5F26: $19
    ld   [hl], $00                                ; $5F27: $36 $00
    ld   hl, $C4D0                                ; $5F29: $21 $D0 $C4
    add  hl, de                                   ; $5F2C: $19
    ld   [hl], $02                                ; $5F2D: $36 $02

jr_005_5F2F:
    ret                                           ; $5F2F: $C9

label_005_5F30:
    call IncrementEntityWalkingAttr               ; $5F30: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $5F33: $CD $05 $0C
    ld   [hl], $50                                ; $5F36: $36 $50
    ret                                           ; $5F38: $C9

    ldh  [rNR41], a                               ; $5F39: $E0 $20
    call func_005_7AB1                            ; $5F3B: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $5F3E: $CD $05 $0C
    jr   z, jr_005_5F78                           ; $5F41: $28 $35

    ld   hl, $C380                                ; $5F43: $21 $80 $C3
    add  hl, bc                                   ; $5F46: $09
    ld   a, [hl]                                  ; $5F47: $7E
    rra                                           ; $5F48: $1F
    rra                                           ; $5F49: $1F
    and  $01                                      ; $5F4A: $E6 $01
    ld   e, a                                     ; $5F4C: $5F
    ld   d, b                                     ; $5F4D: $50
    ld   hl, $5F39                                ; $5F4E: $21 $39 $5F
    add  hl, de                                   ; $5F51: $19
    ld   a, [hl]                                  ; $5F52: $7E
    ld   hl, wEntity0SpeedX                       ; $5F53: $21 $40 $C2
    add  hl, bc                                   ; $5F56: $09
    sub  [hl]                                     ; $5F57: $96
    and  a                                        ; $5F58: $A7
    jr   z, jr_005_5F68                           ; $5F59: $28 $0D

    and  $80                                      ; $5F5B: $E6 $80
    jr   nz, jr_005_5F61                          ; $5F5D: $20 $02

    inc  [hl]                                     ; $5F5F: $34
    inc  [hl]                                     ; $5F60: $34

jr_005_5F61:
    dec  [hl]                                     ; $5F61: $35
    call func_005_5CB9                            ; $5F62: $CD $B9 $5C
    jp   label_005_5CB9                           ; $5F65: $C3 $B9 $5C

jr_005_5F68:
    xor  a                                        ; $5F68: $AF
    call label_3B0C                               ; $5F69: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5F6C: $F0 $E7
    and  $01                                      ; $5F6E: $E6 $01
    jr   nz, jr_005_5F77                          ; $5F70: $20 $05

    ld   hl, wEntity0SpeedY                       ; $5F72: $21 $50 $C2
    add  hl, bc                                   ; $5F75: $09
    dec  [hl]                                     ; $5F76: $35

jr_005_5F77:
    ret                                           ; $5F77: $C9

label_005_5F78:
jr_005_5F78:
    ld   hl, $C340                                ; $5F78: $21 $40 $C3
    add  hl, bc                                   ; $5F7B: $09
    ld   [hl], $02                                ; $5F7C: $36 $02
    call IncrementEntityWalkingAttr               ; $5F7E: $CD $12 $3B
    ld   [hl], $07                                ; $5F81: $36 $07
    call IsEntityFrameCounterZero                 ; $5F83: $CD $05 $0C
    ld   a, [$D205]                               ; $5F86: $FA $05 $D2
    cp   $04                                      ; $5F89: $FE $04
    jr   nz, jr_005_5F90                          ; $5F8B: $20 $03

    ld   [hl], $10                                ; $5F8D: $36 $10
    ret                                           ; $5F8F: $C9

jr_005_5F90:
    ld   [hl], $80                                ; $5F90: $36 $80
    ret                                           ; $5F92: $C9

    call func_005_7AB1                            ; $5F93: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $5F96: $CD $05 $0C
    jr   nz, jr_005_5FA3                          ; $5F99: $20 $08

    ld   [hl], $30                                ; $5F9B: $36 $30
    call IncrementEntityWalkingAttr               ; $5F9D: $CD $12 $3B
    call label_3D7F                               ; $5FA0: $CD $7F $3D

jr_005_5FA3:
    jp   label_005_5CB9                           ; $5FA3: $C3 $B9 $5C

    ldh  [rNR41], a                               ; $5FA6: $E0 $20
    call func_005_7AB1                            ; $5FA8: $CD $B1 $7A
    call IsEntityFrameCounterZero                 ; $5FAB: $CD $05 $0C
    jr   nz, jr_005_5FEA                          ; $5FAE: $20 $3A

    ldh  a, [wActiveEntityPosY]                   ; $5FB0: $F0 $EC
    cp   $B0                                      ; $5FB2: $FE $B0
    jp   nc, label_005_5F78                       ; $5FB4: $D2 $78 $5F

    ld   a, $01                                   ; $5FB7: $3E $01
    call label_3B0C                               ; $5FB9: $CD $0C $3B
    ld   a, [$C13E]                               ; $5FBC: $FA $3E $C1
    and  a                                        ; $5FBF: $A7
    jr   nz, jr_005_5FE9                          ; $5FC0: $20 $27

    call label_3B39                               ; $5FC2: $CD $39 $3B
    ld   a, [$C13E]                               ; $5FC5: $FA $3E $C1
    and  a                                        ; $5FC8: $A7
    jr   z, jr_005_5FE9                           ; $5FC9: $28 $1E

    ld   a, $10                                   ; $5FCB: $3E $10
    ld   [$C13E], a                               ; $5FCD: $EA $3E $C1
    ld   hl, $C380                                ; $5FD0: $21 $80 $C3
    add  hl, bc                                   ; $5FD3: $09
    ld   e, [hl]                                  ; $5FD4: $5E
    srl  e                                        ; $5FD5: $CB $3B
    srl  e                                        ; $5FD7: $CB $3B
    ld   d, b                                     ; $5FD9: $50
    ld   hl, $5FA6                                ; $5FDA: $21 $A6 $5F
    add  hl, de                                   ; $5FDD: $19
    ld   a, [hl]                                  ; $5FDE: $7E
    ldh  [hLinkPositionXIncrement], a             ; $5FDF: $E0 $9A
    ld   a, $F0                                   ; $5FE1: $3E $F0
    ldh  [hLinkPositionYIncrement], a             ; $5FE3: $E0 $9B
    ld   hl, hLinkPositionY                       ; $5FE5: $21 $99 $FF
    dec  [hl]                                     ; $5FE8: $35

jr_005_5FE9:
    ret                                           ; $5FE9: $C9

jr_005_5FEA:
    cp   $01                                      ; $5FEA: $FE $01
    jr   nz, jr_005_6008                          ; $5FEC: $20 $1A

    ld   hl, $C380                                ; $5FEE: $21 $80 $C3
    add  hl, bc                                   ; $5FF1: $09
    ld   e, [hl]                                  ; $5FF2: $5E
    srl  e                                        ; $5FF3: $CB $3B
    srl  e                                        ; $5FF5: $CB $3B
    ld   d, b                                     ; $5FF7: $50
    ld   hl, $5D0C                                ; $5FF8: $21 $0C $5D
    add  hl, de                                   ; $5FFB: $19
    ld   a, [hl]                                  ; $5FFC: $7E
    ld   hl, wEntity0SpeedX                       ; $5FFD: $21 $40 $C2
    add  hl, bc                                   ; $6000: $09
    ld   [hl], a                                  ; $6001: $77
    ld   hl, wEntity0SpeedY                       ; $6002: $21 $50 $C2
    add  hl, bc                                   ; $6005: $09
    ld   [hl], $34                                ; $6006: $36 $34

jr_005_6008:
    call func_005_5CB9                            ; $6008: $CD $B9 $5C
    call IsEntityFrameCounterZero                 ; $600B: $CD $05 $0C
    cp   $40                                      ; $600E: $FE $40
    ret  nc                                       ; $6010: $D0

    call func_005_5CB9                            ; $6011: $CD $B9 $5C
    jp   label_005_5CB9                           ; $6014: $C3 $B9 $5C

    xor  a                                        ; $6017: $AF
    call label_3B0C                               ; $6018: $CD $0C $3B
    call func_005_7AB1                            ; $601B: $CD $B1 $7A
    call label_3B39                               ; $601E: $CD $39 $3B
    call IsEntityFrameCounterZero                 ; $6021: $CD $05 $0C
    jp   z, label_005_5F78                        ; $6024: $CA $78 $5F

    ret                                           ; $6027: $C9

    ld   hl, $C420                                ; $6028: $21 $20 $C4
    add  hl, bc                                   ; $602B: $09
    ld   a, [hl]                                  ; $602C: $7E
    and  a                                        ; $602D: $A7
    jr   z, jr_005_6040                           ; $602E: $28 $10

    cp   $30                                      ; $6030: $FE $30
    ret  nc                                       ; $6032: $D0

    dec  a                                        ; $6033: $3D
    jr   nz, jr_005_603A                          ; $6034: $20 $04

    ld   a, $31                                   ; $6036: $3E $31
    ldh  [hNoiseSfx], a                            ; $6038: $E0 $F4

jr_005_603A:
    call func_005_5CB9                            ; $603A: $CD $B9 $5C
    jp   label_005_5CB9                           ; $603D: $C3 $B9 $5C

jr_005_6040:
    call func_005_5CB9                            ; $6040: $CD $B9 $5C
    call func_005_5CB9                            ; $6043: $CD $B9 $5C
    call func_005_5CB9                            ; $6046: $CD $B9 $5C
    ld   hl, wEntity0SpeedY                       ; $6049: $21 $50 $C2
    add  hl, bc                                   ; $604C: $09
    ld   a, [hl]                                  ; $604D: $7E
    cp   $D0                                      ; $604E: $FE $D0
    jr   z, jr_005_6053                           ; $6050: $28 $01

    dec  [hl]                                     ; $6052: $35

jr_005_6053:
    call func_005_7AB1                            ; $6053: $CD $B1 $7A
    ldh  a, [wActiveEntityPosY]                   ; $6056: $F0 $EC
    and  $F0                                      ; $6058: $E6 $F0
    cp   $C0                                      ; $605A: $FE $C0
    jr   nz, jr_005_6061                          ; $605C: $20 $03

    jp   label_005_5F78                           ; $605E: $C3 $78 $5F

jr_005_6061:
    ret                                           ; $6061: $C9

    nop                                           ; $6062: $00
    nop                                           ; $6063: $00
    ld   b, b                                     ; $6064: $40
    ld   bc, label_800                            ; $6065: $01 $00 $08
    ld   b, d                                     ; $6068: $42
    ld   bc, label_1000                           ; $6069: $01 $00 $10
    ld   b, h                                     ; $606C: $44
    ld   [bc], a                                  ; $606D: $02
    ld   hl, sp+$18                               ; $606E: $F8 $18
    ld   b, [hl]                                  ; $6070: $46
    ld   [bc], a                                  ; $6071: $02
    ld   hl, sp+$20                               ; $6072: $F8 $20
    ld   c, b                                     ; $6074: $48
    ld   [bc], a                                  ; $6075: $02
    ld   hl, sp+$28                               ; $6076: $F8 $28
    ld   c, d                                     ; $6078: $4A
    ld   [bc], a                                  ; $6079: $02
    ld   [$4C18], sp                              ; $607A: $08 $18 $4C
    ld   [bc], a                                  ; $607D: $02
    ld   [$4E20], sp                              ; $607E: $08 $20 $4E
    ld   [bc], a                                  ; $6081: $02
    ld   [$5028], sp                              ; $6082: $08 $28 $50
    ld   [bc], a                                  ; $6085: $02
    nop                                           ; $6086: $00
    jr   nc, jr_005_60DB                          ; $6087: $30 $52

    ld   [bc], a                                  ; $6089: $02
    rst  $38                                      ; $608A: $FF
    rst  $38                                      ; $608B: $FF
    rst  $38                                      ; $608C: $FF
    rst  $38                                      ; $608D: $FF
    rst  $38                                      ; $608E: $FF
    rst  $38                                      ; $608F: $FF
    rst  $38                                      ; $6090: $FF
    rst  $38                                      ; $6091: $FF
    nop                                           ; $6092: $00
    nop                                           ; $6093: $00
    ld   b, b                                     ; $6094: $40
    ld   bc, label_800                            ; $6095: $01 $00 $08
    ld   b, d                                     ; $6098: $42
    ld   bc, label_1000                           ; $6099: $01 $00 $10
    ld   e, d                                     ; $609C: $5A
    ld   [bc], a                                  ; $609D: $02
    nop                                           ; $609E: $00
    jr   jr_005_60FD                              ; $609F: $18 $5C

    ld   [bc], a                                  ; $60A1: $02
    nop                                           ; $60A2: $00
    jr   nz, jr_005_6103                          ; $60A3: $20 $5E

    ld   [bc], a                                  ; $60A5: $02
    db   $10                                      ; $60A6: $10
    ld   [$0260], sp                              ; $60A7: $08 $60 $02
    db   $10                                      ; $60AA: $10
    db   $10                                      ; $60AB: $10
    ld   h, d                                     ; $60AC: $62
    ld   [bc], a                                  ; $60AD: $02
    db   $10                                      ; $60AE: $10
    jr   jr_005_6115                              ; $60AF: $18 $64

    ld   [bc], a                                  ; $60B1: $02
    db   $10                                      ; $60B2: $10
    jr   nz, jr_005_611B                          ; $60B3: $20 $66

    ld   [bc], a                                  ; $60B5: $02
    ldh  a, [rNR23]                               ; $60B6: $F0 $18
    ld   d, h                                     ; $60B8: $54
    ld   [bc], a                                  ; $60B9: $02
    ldh  a, [rNR41]                               ; $60BA: $F0 $20
    ld   d, [hl]                                  ; $60BC: $56
    ld   [bc], a                                  ; $60BD: $02
    ldh  a, [$FF28]                               ; $60BE: $F0 $28
    ld   e, b                                     ; $60C0: $58
    ld   [bc], a                                  ; $60C1: $02
    nop                                           ; $60C2: $00
    nop                                           ; $60C3: $00
    ld   b, b                                     ; $60C4: $40
    ld   bc, label_800                            ; $60C5: $01 $00 $08
    ld   b, d                                     ; $60C8: $42
    ld   bc, label_1000                           ; $60C9: $01 $00 $10
    ld   e, d                                     ; $60CC: $5A
    ld   [bc], a                                  ; $60CD: $02
    nop                                           ; $60CE: $00
    jr   jr_005_6139                              ; $60CF: $18 $68

    ld   [bc], a                                  ; $60D1: $02
    nop                                           ; $60D2: $00
    jr   nz, @+$6C                                ; $60D3: $20 $6A

    ld   [bc], a                                  ; $60D5: $02
    db   $10                                      ; $60D6: $10
    ld   [$0260], sp                              ; $60D7: $08 $60 $02
    db   $10                                      ; $60DA: $10

jr_005_60DB:
    db   $10                                      ; $60DB: $10
    ld   h, d                                     ; $60DC: $62
    ld   [bc], a                                  ; $60DD: $02
    db   $10                                      ; $60DE: $10
    jr   jr_005_6145                              ; $60DF: $18 $64

    ld   [bc], a                                  ; $60E1: $02
    db   $10                                      ; $60E2: $10
    jr   nz, jr_005_614B                          ; $60E3: $20 $66

    ld   [bc], a                                  ; $60E5: $02
    rst  $38                                      ; $60E6: $FF
    rst  $38                                      ; $60E7: $FF
    rst  $38                                      ; $60E8: $FF
    rst  $38                                      ; $60E9: $FF
    rst  $38                                      ; $60EA: $FF
    rst  $38                                      ; $60EB: $FF
    rst  $38                                      ; $60EC: $FF
    rst  $38                                      ; $60ED: $FF
    rst  $38                                      ; $60EE: $FF
    rst  $38                                      ; $60EF: $FF
    rst  $38                                      ; $60F0: $FF
    rst  $38                                      ; $60F1: $FF
    nop                                           ; $60F2: $00
    nop                                           ; $60F3: $00
    ld   b, b                                     ; $60F4: $40
    ld   bc, label_800                            ; $60F5: $01 $00 $08
    ld   b, d                                     ; $60F8: $42
    ld   bc, label_1000                           ; $60F9: $01 $00 $10
    ld   l, h                                     ; $60FC: $6C

jr_005_60FD:
    ld   [bc], a                                  ; $60FD: $02
    nop                                           ; $60FE: $00
    jr   jr_005_616F                              ; $60FF: $18 $6E

    ld   [bc], a                                  ; $6101: $02
    nop                                           ; $6102: $00

jr_005_6103:
    jr   nz, jr_005_6175                          ; $6103: $20 $70

    ld   [bc], a                                  ; $6105: $02
    db   $10                                      ; $6106: $10
    ld   [$0260], sp                              ; $6107: $08 $60 $02
    db   $10                                      ; $610A: $10
    db   $10                                      ; $610B: $10
    ld   [hl], d                                  ; $610C: $72
    ld   [bc], a                                  ; $610D: $02
    db   $10                                      ; $610E: $10
    jr   @+$76                                    ; $610F: $18 $74

    ld   [bc], a                                  ; $6111: $02
    db   $10                                      ; $6112: $10
    jr   nz, @+$78                                ; $6113: $20 $76

jr_005_6115:
    ld   [bc], a                                  ; $6115: $02
    rst  $38                                      ; $6116: $FF
    rst  $38                                      ; $6117: $FF
    rst  $38                                      ; $6118: $FF
    rst  $38                                      ; $6119: $FF
    rst  $38                                      ; $611A: $FF

jr_005_611B:
    rst  $38                                      ; $611B: $FF
    rst  $38                                      ; $611C: $FF
    rst  $38                                      ; $611D: $FF
    rst  $38                                      ; $611E: $FF
    rst  $38                                      ; $611F: $FF
    rst  $38                                      ; $6120: $FF
    rst  $38                                      ; $6121: $FF
    nop                                           ; $6122: $00
    ld   [$2140], sp                              ; $6123: $08 $40 $21
    nop                                           ; $6126: $00
    nop                                           ; $6127: $00
    ld   b, d                                     ; $6128: $42
    ld   hl, $F800                                ; $6129: $21 $00 $F8
    ld   b, h                                     ; $612C: $44
    ld   [hl+], a                                 ; $612D: $22
    ld   hl, sp-$10                               ; $612E: $F8 $F0
    ld   b, [hl]                                  ; $6130: $46
    ld   [hl+], a                                 ; $6131: $22
    ld   hl, sp-$18                               ; $6132: $F8 $E8
    ld   c, b                                     ; $6134: $48
    ld   [hl+], a                                 ; $6135: $22
    ld   hl, sp-$20                               ; $6136: $F8 $E0
    ld   c, d                                     ; $6138: $4A

jr_005_6139:
    ld   [hl+], a                                 ; $6139: $22
    ld   [$4CF0], sp                              ; $613A: $08 $F0 $4C
    ld   [hl+], a                                 ; $613D: $22
    ld   [$4EE8], sp                              ; $613E: $08 $E8 $4E
    ld   [hl+], a                                 ; $6141: $22
    ld   [$50E0], sp                              ; $6142: $08 $E0 $50

jr_005_6145:
    ld   [hl+], a                                 ; $6145: $22
    nop                                           ; $6146: $00
    ret  c                                        ; $6147: $D8

    ld   d, d                                     ; $6148: $52
    ld   [hl+], a                                 ; $6149: $22
    rst  $38                                      ; $614A: $FF

jr_005_614B:
    rst  $38                                      ; $614B: $FF
    rst  $38                                      ; $614C: $FF
    rst  $38                                      ; $614D: $FF
    rst  $38                                      ; $614E: $FF
    rst  $38                                      ; $614F: $FF
    rst  $38                                      ; $6150: $FF
    rst  $38                                      ; $6151: $FF
    nop                                           ; $6152: $00
    ld   [$2140], sp                              ; $6153: $08 $40 $21
    nop                                           ; $6156: $00
    nop                                           ; $6157: $00
    ld   b, d                                     ; $6158: $42
    ld   hl, $F800                                ; $6159: $21 $00 $F8
    ld   e, d                                     ; $615C: $5A
    ld   [hl+], a                                 ; $615D: $22
    nop                                           ; $615E: $00
    ldh  a, [$FF5C]                               ; $615F: $F0 $5C
    ld   [hl+], a                                 ; $6161: $22
    nop                                           ; $6162: $00
    add  sp, $5E                                  ; $6163: $E8 $5E
    ld   [hl+], a                                 ; $6165: $22
    stop                                          ; $6166: $10 $00
    ld   h, b                                     ; $6168: $60
    ld   [hl+], a                                 ; $6169: $22
    db   $10                                      ; $616A: $10
    ld   hl, sp+$62                               ; $616B: $F8 $62
    ld   [hl+], a                                 ; $616D: $22
    db   $10                                      ; $616E: $10

jr_005_616F:
    ldh  a, [$FF64]                               ; $616F: $F0 $64
    ld   [hl+], a                                 ; $6171: $22
    db   $10                                      ; $6172: $10
    add  sp, $66                                  ; $6173: $E8 $66

jr_005_6175:
    ld   [hl+], a                                 ; $6175: $22
    ldh  a, [hActiveEntityWalking]                ; $6176: $F0 $F0
    ld   d, h                                     ; $6178: $54
    ld   [hl+], a                                 ; $6179: $22
    ldh  a, [hFFE8]                               ; $617A: $F0 $E8
    ld   d, [hl]                                  ; $617C: $56
    ld   [hl+], a                                 ; $617D: $22
    ldh  a, [hBGMapOffsetHigh]                    ; $617E: $F0 $E0
    ld   e, b                                     ; $6180: $58
    ld   [hl+], a                                 ; $6181: $22
    nop                                           ; $6182: $00
    ld   [$2140], sp                              ; $6183: $08 $40 $21
    nop                                           ; $6186: $00
    nop                                           ; $6187: $00
    ld   b, d                                     ; $6188: $42
    ld   hl, $F800                                ; $6189: $21 $00 $F8
    ld   e, d                                     ; $618C: $5A
    ld   [hl+], a                                 ; $618D: $22
    nop                                           ; $618E: $00
    ldh  a, [rBCPS]                               ; $618F: $F0 $68
    ld   [hl+], a                                 ; $6191: $22
    nop                                           ; $6192: $00
    add  sp, $6A                                  ; $6193: $E8 $6A
    ld   [hl+], a                                 ; $6195: $22
    stop                                          ; $6196: $10 $00
    ld   h, b                                     ; $6198: $60
    ld   [hl+], a                                 ; $6199: $22
    db   $10                                      ; $619A: $10
    ld   hl, sp+$62                               ; $619B: $F8 $62
    ld   [hl+], a                                 ; $619D: $22
    db   $10                                      ; $619E: $10
    ldh  a, [$FF64]                               ; $619F: $F0 $64
    ld   [hl+], a                                 ; $61A1: $22
    db   $10                                      ; $61A2: $10
    add  sp, $66                                  ; $61A3: $E8 $66
    ld   [hl+], a                                 ; $61A5: $22
    rst  $38                                      ; $61A6: $FF
    rst  $38                                      ; $61A7: $FF
    rst  $38                                      ; $61A8: $FF
    rst  $38                                      ; $61A9: $FF
    rst  $38                                      ; $61AA: $FF
    rst  $38                                      ; $61AB: $FF
    rst  $38                                      ; $61AC: $FF
    rst  $38                                      ; $61AD: $FF
    rst  $38                                      ; $61AE: $FF
    rst  $38                                      ; $61AF: $FF
    rst  $38                                      ; $61B0: $FF
    rst  $38                                      ; $61B1: $FF
    nop                                           ; $61B2: $00
    ld   [$2140], sp                              ; $61B3: $08 $40 $21
    nop                                           ; $61B6: $00
    nop                                           ; $61B7: $00
    ld   b, d                                     ; $61B8: $42
    ld   hl, $F800                                ; $61B9: $21 $00 $F8
    ld   l, h                                     ; $61BC: $6C
    ld   [hl+], a                                 ; $61BD: $22
    nop                                           ; $61BE: $00
    ldh  a, [$FF6E]                               ; $61BF: $F0 $6E
    ld   [hl+], a                                 ; $61C1: $22
    nop                                           ; $61C2: $00
    add  sp, $70                                  ; $61C3: $E8 $70
    ld   [hl+], a                                 ; $61C5: $22
    stop                                          ; $61C6: $10 $00
    ld   h, b                                     ; $61C8: $60
    ld   [hl+], a                                 ; $61C9: $22
    db   $10                                      ; $61CA: $10
    ld   hl, sp+$72                               ; $61CB: $F8 $72
    ld   [hl+], a                                 ; $61CD: $22
    db   $10                                      ; $61CE: $10
    ldh  a, [$FF74]                               ; $61CF: $F0 $74
    ld   [hl+], a                                 ; $61D1: $22
    db   $10                                      ; $61D2: $10
    add  sp, $76                                  ; $61D3: $E8 $76
    ld   [hl+], a                                 ; $61D5: $22
    rst  $38                                      ; $61D6: $FF
    rst  $38                                      ; $61D7: $FF
    rst  $38                                      ; $61D8: $FF
    rst  $38                                      ; $61D9: $FF
    rst  $38                                      ; $61DA: $FF
    rst  $38                                      ; $61DB: $FF
    rst  $38                                      ; $61DC: $FF
    rst  $38                                      ; $61DD: $FF
    rst  $38                                      ; $61DE: $FF
    rst  $38                                      ; $61DF: $FF
    rst  $38                                      ; $61E0: $FF
    rst  $38                                      ; $61E1: $FF
    inc  e                                        ; $61E2: $1C
    inc  e                                        ; $61E3: $1C
    ld   [$140C], sp                              ; $61E4: $08 $0C $14
    db   $10                                      ; $61E7: $10
    db   $10                                      ; $61E8: $10
    db   $10                                      ; $61E9: $10
    db   $F4                                      ; $61EA: $F4
    inc  e                                        ; $61EB: $1C
    ld   [$FC0C], sp                              ; $61EC: $08 $0C $FC
    db   $10                                      ; $61EF: $10
    db   $10                                      ; $61F0: $10
    db   $10                                      ; $61F1: $10

func_005_61F2:
    ld   hl, $C380                                ; $61F2: $21 $80 $C3
    add  hl, bc                                   ; $61F5: $09
    ldh  a, [hActiveEntityUnknownG]               ; $61F6: $F0 $F1
    add  [hl]                                     ; $61F8: $86
    ld   hl, $6062                                ; $61F9: $21 $62 $60
    cp   $04                                      ; $61FC: $FE $04
    jr   c, jr_005_6205                           ; $61FE: $38 $05

    sub  $04                                      ; $6200: $D6 $04
    ld   hl, $6122                                ; $6202: $21 $22 $61

jr_005_6205:
    ld   e, a                                     ; $6205: $5F
    ld   d, b                                     ; $6206: $50
    sla  e                                        ; $6207: $CB $23
    sla  e                                        ; $6209: $CB $23
    sla  e                                        ; $620B: $CB $23
    sla  e                                        ; $620D: $CB $23
    ld   a, e                                     ; $620F: $7B
    sla  e                                        ; $6210: $CB $23
    add  e                                        ; $6212: $83
    ld   e, a                                     ; $6213: $5F
    add  hl, de                                   ; $6214: $19
    ld   c, $0C                                   ; $6215: $0E $0C
    call label_3CE6                               ; $6217: $CD $E6 $3C
    ld   a, $0A                                   ; $621A: $3E $0A
    call label_3DA0                               ; $621C: $CD $A0 $3D
    ld   e, $00                                   ; $621F: $1E $00
    ldh  a, [hActiveEntityUnknownG]               ; $6221: $F0 $F1
    and  a                                        ; $6223: $A7
    jr   z, jr_005_6228                           ; $6224: $28 $02

    ld   e, $04                                   ; $6226: $1E $04

jr_005_6228:
    ld   hl, $C380                                ; $6228: $21 $80 $C3
    add  hl, bc                                   ; $622B: $09
    ld   a, [hl]                                  ; $622C: $7E
    and  a                                        ; $622D: $A7
    jr   z, jr_005_6234                           ; $622E: $28 $04

    ld   a, e                                     ; $6230: $7B
    add  $08                                      ; $6231: $C6 $08
    ld   e, a                                     ; $6233: $5F

jr_005_6234:
    ld   d, b                                     ; $6234: $50
    ld   hl, $61E2                                ; $6235: $21 $E2 $61
    add  hl, de                                   ; $6238: $19
    ld   e, l                                     ; $6239: $5D
    ld   d, h                                     ; $623A: $54
    push bc                                       ; $623B: $C5
    sla  c                                        ; $623C: $CB $21
    sla  c                                        ; $623E: $CB $21
    ld   hl, $D580                                ; $6240: $21 $80 $D5
    add  hl, bc                                   ; $6243: $09
    ld   c, $04                                   ; $6244: $0E $04

jr_005_6246:
    ld   a, [de]                                  ; $6246: $1A
    inc  de                                       ; $6247: $13
    ld   [hl+], a                                 ; $6248: $22
    dec  c                                        ; $6249: $0D
    jr   nz, jr_005_6246                          ; $624A: $20 $FA

    pop  bc                                       ; $624C: $C1
    ret                                           ; $624D: $C9

    ld   a, h                                     ; $624E: $7C
    nop                                           ; $624F: $00
    ld   a, h                                     ; $6250: $7C
    jr   nz, @+$7E                                ; $6251: $20 $7C

    ld   b, b                                     ; $6253: $40
    ld   a, h                                     ; $6254: $7C
    ld   h, b                                     ; $6255: $60
    ld   a, $02                                   ; $6256: $3E $02
    ldh  [$FFA1], a                               ; $6258: $E0 $A1
    ld   de, $624E                                ; $625A: $11 $4E $62
    call label_3BC0                               ; $625D: $CD $C0 $3B
    call func_005_7A3A                            ; $6260: $CD $3A $7A
    ldh  a, [hFrameCounter]                       ; $6263: $F0 $E7
    rra                                           ; $6265: $1F
    rra                                           ; $6266: $1F
    rra                                           ; $6267: $1F
    and  $01                                      ; $6268: $E6 $01
    call label_3B0C                               ; $626A: $CD $0C $3B
    ldh  a, [hActiveEntityWalking]                ; $626D: $F0 $F0
    rst  $00                                      ; $626F: $C7
    ld   [hl], h                                  ; $6270: $74
    ld   h, d                                     ; $6271: $62
    sbc  c                                        ; $6272: $99
    ld   h, d                                     ; $6273: $62
    ld   hl, wEntity0PosY                         ; $6274: $21 $10 $C2
    add  hl, bc                                   ; $6277: $09
    ld   e, $07                                   ; $6278: $1E $07
    call func_005_6283                            ; $627A: $CD $83 $62
    ld   hl, wEntity0PosX                         ; $627D: $21 $00 $C2
    add  hl, bc                                   ; $6280: $09
    ld   e, $00                                   ; $6281: $1E $00

func_005_6283:
    ldh  a, [hFrameCounter]                       ; $6283: $F0 $E7
    add  e                                        ; $6285: $83
    ld   d, a                                     ; $6286: $57
    and  $03                                      ; $6287: $E6 $03
    jr   nz, jr_005_6298                          ; $6289: $20 $0D

    ld   a, d                                     ; $628B: $7A
    rra                                           ; $628C: $1F
    rra                                           ; $628D: $1F
    rra                                           ; $628E: $1F
    rra                                           ; $628F: $1F
    xor  c                                        ; $6290: $A9
    and  $01                                      ; $6291: $E6 $01
    jr   z, jr_005_6297                           ; $6293: $28 $02

    inc  [hl]                                     ; $6295: $34
    inc  [hl]                                     ; $6296: $34

jr_005_6297:
    dec  [hl]                                     ; $6297: $35

jr_005_6298:
    ret                                           ; $6298: $C9

    call func_005_7AB1                            ; $6299: $CD $B1 $7A
    ld   hl, wEntity0SpeedX                       ; $629C: $21 $40 $C2
    add  hl, bc                                   ; $629F: $09
    ld   a, [hl]                                  ; $62A0: $7E
    cp   $C0                                      ; $62A1: $FE $C0
    jr   z, jr_005_62A6                           ; $62A3: $28 $01

    dec  [hl]                                     ; $62A5: $35

jr_005_62A6:
    ld   hl, wEntity0SpeedY                       ; $62A6: $21 $50 $C2
    add  hl, bc                                   ; $62A9: $09
    ld   a, [hl]                                  ; $62AA: $7E
    cp   $F0                                      ; $62AB: $FE $F0
    jr   z, jr_005_62B0                           ; $62AD: $28 $01

    dec  [hl]                                     ; $62AF: $35

jr_005_62B0:
    ldh  a, [wActiveEntityPosX]                   ; $62B0: $F0 $EE
    cp   $E0                                      ; $62B2: $FE $E0
    jp   nc, label_005_7B4B                       ; $62B4: $D2 $4B $7B

    ret                                           ; $62B7: $C9

    ld   a, d                                     ; $62B8: $7A
    ld   [hl+], a                                 ; $62B9: $22
    ld   a, b                                     ; $62BA: $78
    ld   [hl+], a                                 ; $62BB: $22
    ld   a, b                                     ; $62BC: $78
    ld   [bc], a                                  ; $62BD: $02
    ld   a, d                                     ; $62BE: $7A
    ld   [bc], a                                  ; $62BF: $02
    ld   a, d                                     ; $62C0: $7A
    ld   h, d                                     ; $62C1: $62
    ld   a, b                                     ; $62C2: $78
    ld   h, d                                     ; $62C3: $62
    ld   a, b                                     ; $62C4: $78
    ld   b, d                                     ; $62C5: $42
    ld   a, d                                     ; $62C6: $7A
    ld   b, d                                     ; $62C7: $42
    ld   de, $62B8                                ; $62C8: $11 $B8 $62
    call label_3BC0                               ; $62CB: $CD $C0 $3B
    call func_005_7A3A                            ; $62CE: $CD $3A $7A
    call func_005_7AB1                            ; $62D1: $CD $B1 $7A
    ldh  a, [hActiveEntityWalking]                ; $62D4: $F0 $F0
    rst  $00                                      ; $62D6: $C7
    db   $DB                                      ; $62D7: $DB
    ld   h, d                                     ; $62D8: $62
    ld   a, [$CD62]                               ; $62D9: $FA $62 $CD
    ld   c, a                                     ; $62DC: $4F
    dec  sp                                       ; $62DD: $3B
    ld   hl, wEntitiesCollisionsTable             ; $62DE: $21 $A0 $C2
    add  hl, bc                                   ; $62E1: $09
    ld   a, [hl]                                  ; $62E2: $7E
    and  a                                        ; $62E3: $A7
    jr   z, jr_005_62F5                           ; $62E4: $28 $0F

    call IncrementEntityWalkingAttr               ; $62E6: $CD $12 $3B
    ld   hl, wEntity0SpeedY                       ; $62E9: $21 $50 $C2
    add  hl, bc                                   ; $62EC: $09
    ld   [hl], $E0                                ; $62ED: $36 $E0
    ld   hl, wEntitiesUnknownTableG               ; $62EF: $21 $B0 $C3
    add  hl, bc                                   ; $62F2: $09
    inc  [hl]                                     ; $62F3: $34
    inc  [hl]                                     ; $62F4: $34

jr_005_62F5:
    ld   hl, wEntity0SpeedY                       ; $62F5: $21 $50 $C2
    add  hl, bc                                   ; $62F8: $09
    dec  [hl]                                     ; $62F9: $35
    ldh  a, [wActiveEntityPosX]                   ; $62FA: $F0 $EE
    cp   $A8                                      ; $62FC: $FE $A8
    jp   nc, label_005_7B4B                       ; $62FE: $D2 $4B $7B

    ret                                           ; $6301: $C9

    call IsEntityFrameCounterZero                 ; $6302: $CD $05 $0C
    ld   [hl], $40                                ; $6305: $36 $40
    ld   hl, wEntitiesUnknownTableG               ; $6307: $21 $B0 $C3
    add  hl, bc                                   ; $630A: $09
    ld   [hl], $FF                                ; $630B: $36 $FF
    ld   hl, $C360                                ; $630D: $21 $60 $C3
    add  hl, bc                                   ; $6310: $09
    ld   [hl], $FF                                ; $6311: $36 $FF
    ret                                           ; $6313: $C9

    call label_394D                               ; $6314: $CD $4D $39
    call label_3EE8                               ; $6317: $CD $E8 $3E
    ld   hl, wEntitiesUnknownTableB               ; $631A: $21 $B0 $C2
    add  hl, bc                                   ; $631D: $09
    ld   a, [hl]                                  ; $631E: $7E
    and  a                                        ; $631F: $A7
    jr   z, jr_005_632F                           ; $6320: $28 $0D

    cp   $01                                      ; $6322: $FE $01
    jp   z, label_005_6776                        ; $6324: $CA $76 $67

    cp   $02                                      ; $6327: $FE $02
    jp   z, label_005_6798                        ; $6329: $CA $98 $67

    jp   label_005_67EA                           ; $632C: $C3 $EA $67

jr_005_632F:
    call func_005_6705                            ; $632F: $CD $05 $67
    ldh  a, [hActiveEntityType]                   ; $6332: $F0 $EA
    cp   $01                                      ; $6334: $FE $01
    jr   nz, jr_005_6375                          ; $6336: $20 $3D

    ld   hl, wEntitiesUnknownTableC               ; $6338: $21 $C0 $C2
    add  hl, bc                                   ; $633B: $09
    ld   a, [hl]                                  ; $633C: $7E
    rst  $00                                      ; $633D: $C7
    ld   b, d                                     ; $633E: $42
    ld   h, e                                     ; $633F: $63
    ld   c, l                                     ; $6340: $4D
    ld   h, e                                     ; $6341: $63
    call IsEntityFrameCounterZero                 ; $6342: $CD $05 $0C
    ld   [hl], $FF                                ; $6345: $36 $FF

label_005_6347:
    ld   hl, wEntitiesUnknownTableC               ; $6347: $21 $C0 $C2
    add  hl, bc                                   ; $634A: $09
    inc  [hl]                                     ; $634B: $34
    ret                                           ; $634C: $C9

    call IsEntityFrameCounterZero                 ; $634D: $CD $05 $0C
    jp   z, label_005_635E                        ; $6350: $CA $5E $63

    ld   hl, $C420                                ; $6353: $21 $20 $C4
    add  hl, bc                                   ; $6356: $09
    ld   [hl], a                                  ; $6357: $77
    cp   $80                                      ; $6358: $FE $80
    ret  nc                                       ; $635A: $D0

    jp   label_005_7550                           ; $635B: $C3 $50 $75

label_005_635E:
    call func_005_7585                            ; $635E: $CD $85 $75
    ld   hl, wEntity0PosX                         ; $6361: $21 $00 $C2
    add  hl, de                                   ; $6364: $19
    ldh  a, [hLinkPositionX]                      ; $6365: $F0 $98
    ld   [hl], a                                  ; $6367: $77
    ld   hl, wEntity0PosY                         ; $6368: $21 $10 $C2
    add  hl, de                                   ; $636B: $19
    ld   [hl], $70                                ; $636C: $36 $70
    ld   hl, $C310                                ; $636E: $21 $10 $C3
    add  hl, de                                   ; $6371: $19
    ld   [hl], $70                                ; $6372: $36 $70
    ret                                           ; $6374: $C9

jr_005_6375:
    call func_005_7A3A                            ; $6375: $CD $3A $7A
    call label_C56                                ; $6378: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $637B: $F0 $F0
    rst  $00                                      ; $637D: $C7
    xor  b                                        ; $637E: $A8
    ld   h, e                                     ; $637F: $63
    db   $EB                                      ; $6380: $EB
    ld   h, e                                     ; $6381: $63
    adc  [hl]                                     ; $6382: $8E
    ld   h, h                                     ; $6383: $64
    inc  [hl]                                     ; $6384: $34
    ld   h, l                                     ; $6385: $65
    ld   a, c                                     ; $6386: $79
    ld   h, l                                     ; $6387: $65
    jr   z, jr_005_63C2                           ; $6388: $28 $38

    ld   e, b                                     ; $638A: $58
    ld   l, b                                     ; $638B: $68
    jr   z, jr_005_63C6                           ; $638C: $28 $38

    ld   e, b                                     ; $638E: $58
    ld   l, b                                     ; $638F: $68
    jr   c, jr_005_63C2                           ; $6390: $38 $30

    jr   nc, jr_005_63CC                          ; $6392: $30 $38

    ld   d, b                                     ; $6394: $50
    ld   e, b                                     ; $6395: $58
    ld   e, b                                     ; $6396: $58
    ld   d, b                                     ; $6397: $50
    db   $10                                      ; $6398: $10
    db   $10                                      ; $6399: $10
    ldh  a, [hActiveEntityWalking]                ; $639A: $F0 $F0
    db   $10                                      ; $639C: $10
    db   $10                                      ; $639D: $10
    ldh  a, [hActiveEntityWalking]                ; $639E: $F0 $F0
    db   $FD                                      ; $63A0: $FD
    inc  bc                                       ; $63A1: $03
    inc  bc                                       ; $63A2: $03
    db   $FD                                      ; $63A3: $FD
    inc  bc                                       ; $63A4: $03
    db   $FD                                      ; $63A5: $FD
    db   $FD                                      ; $63A6: $FD
    inc  bc                                       ; $63A7: $03
    call IsEntityFrameCounterZero                 ; $63A8: $CD $05 $0C
    ret  nz                                       ; $63AB: $C0

    call GetRandomByte                            ; $63AC: $CD $0D $28
    and  $07                                      ; $63AF: $E6 $07
    ld   e, a                                     ; $63B1: $5F
    ld   d, b                                     ; $63B2: $50
    ld   hl, $6388                                ; $63B3: $21 $88 $63
    add  hl, de                                   ; $63B6: $19
    ld   a, [hl]                                  ; $63B7: $7E
    ld   hl, wEntity0PosX                         ; $63B8: $21 $00 $C2
    add  hl, bc                                   ; $63BB: $09
    ld   [hl], a                                  ; $63BC: $77
    ld   hl, $6390                                ; $63BD: $21 $90 $63
    add  hl, de                                   ; $63C0: $19
    ld   a, [hl]                                  ; $63C1: $7E

jr_005_63C2:
    ld   hl, wEntity0PosY                         ; $63C2: $21 $10 $C2
    add  hl, bc                                   ; $63C5: $09

jr_005_63C6:
    ld   [hl], a                                  ; $63C6: $77
    ld   hl, $6398                                ; $63C7: $21 $98 $63
    add  hl, de                                   ; $63CA: $19
    ld   a, [hl]                                  ; $63CB: $7E

jr_005_63CC:
    ld   hl, wEntity0SpeedX                       ; $63CC: $21 $40 $C2
    add  hl, bc                                   ; $63CF: $09
    ld   [hl], a                                  ; $63D0: $77
    ld   hl, $63A0                                ; $63D1: $21 $A0 $63
    add  hl, de                                   ; $63D4: $19
    ld   a, [hl]                                  ; $63D5: $7E
    ld   hl, wEntity0SpeedY                       ; $63D6: $21 $50 $C2
    add  hl, bc                                   ; $63D9: $09
    ld   [hl], a                                  ; $63DA: $77
    ld   hl, $C320                                ; $63DB: $21 $20 $C3
    add  hl, bc                                   ; $63DE: $09
    ld   [hl], $18                                ; $63DF: $36 $18
    ld   a, $16                                   ; $63E1: $3E $16
    ldh  [hWaveSfx], a                                ; $63E3: $E0 $F3
    call func_005_65D9                            ; $63E5: $CD $D9 $65
    jp   IncrementEntityWalkingAttr               ; $63E8: $C3 $12 $3B

    ld   hl, wEntity0SpeedX                       ; $63EB: $21 $40 $C2
    add  hl, bc                                   ; $63EE: $09
    ld   a, [hl]                                  ; $63EF: $7E
    and  a                                        ; $63F0: $A7
    jr   z, jr_005_6444                           ; $63F1: $28 $51

    ld   hl, $C420                                ; $63F3: $21 $20 $C4
    add  hl, bc                                   ; $63F6: $09
    ld   a, [hl]                                  ; $63F7: $7E
    cp   $0B                                      ; $63F8: $FE $0B
    jr   c, jr_005_6444                           ; $63FA: $38 $48

    ld   hl, $C3D0                                ; $63FC: $21 $D0 $C3
    add  hl, bc                                   ; $63FF: $09
    ld   a, [hl]                                  ; $6400: $7E
    cp   $05                                      ; $6401: $FE $05
    jr   nc, jr_005_6443                          ; $6403: $30 $3E

    call IncrementEntityWalkingAttr               ; $6405: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $6408: $CD $05 $0C
    ld   [hl], $40                                ; $640B: $36 $40
    ld   hl, wEntity0SpeedX                       ; $640D: $21 $40 $C2
    add  hl, bc                                   ; $6410: $09
    ld   [hl], $18                                ; $6411: $36 $18
    ld   hl, wEntity0SpeedY                       ; $6413: $21 $50 $C2
    add  hl, bc                                   ; $6416: $09
    ld   [hl], $18                                ; $6417: $36 $18
    ld   hl, $C320                                ; $6419: $21 $20 $C3
    add  hl, bc                                   ; $641C: $09
    ld   [hl], b                                  ; $641D: $70
    call label_BFB                                ; $641E: $CD $FB $0B
    ld   [hl], $40                                ; $6421: $36 $40
    ldh  a, [wActiveEntityPosX]                   ; $6423: $F0 $EE
    add  $F8                                      ; $6425: $C6 $F8
    ldh  [hScratchA], a                           ; $6427: $E0 $D7
    call func_005_6432                            ; $6429: $CD $32 $64
    ldh  a, [wActiveEntityPosX]                   ; $642C: $F0 $EE
    add  $08                                      ; $642E: $C6 $08
    ldh  [hScratchA], a                           ; $6430: $E0 $D7

func_005_6432:
    ldh  a, [wActiveEntityPosY]                   ; $6432: $F0 $EC
    sub  $10                                      ; $6434: $D6 $10
    ldh  [hScratchB], a                           ; $6436: $E0 $D8
    ld   a, $02                                   ; $6438: $3E $02
    call label_CC7                                ; $643A: $CD $C7 $0C
    ld   hl, $C520                                ; $643D: $21 $20 $C5
    add  hl, de                                   ; $6440: $19
    ld   [hl], $0F                                ; $6441: $36 $0F

jr_005_6443:
    ret                                           ; $6443: $C9

jr_005_6444:
    call func_005_7AB1                            ; $6444: $CD $B1 $7A
    call func_005_7AEA                            ; $6447: $CD $EA $7A
    ld   hl, $C320                                ; $644A: $21 $20 $C3
    add  hl, bc                                   ; $644D: $09
    dec  [hl]                                     ; $644E: $35
    ld   hl, $C310                                ; $644F: $21 $10 $C3
    add  hl, bc                                   ; $6452: $09
    ld   a, [hl]                                  ; $6453: $7E
    and  $80                                      ; $6454: $E6 $80
    jr   z, jr_005_6471                           ; $6456: $28 $19

    ld   [hl], b                                  ; $6458: $70
    call IsEntityFrameCounterZero                 ; $6459: $CD $05 $0C
    ld   [hl], $40                                ; $645C: $36 $40
    call IncrementEntityWalkingAttr               ; $645E: $CD $12 $3B
    ld   [hl], b                                  ; $6461: $70
    call func_005_6611                            ; $6462: $CD $11 $66
    call func_005_65D9                            ; $6465: $CD $D9 $65
    ld   a, $32                                   ; $6468: $3E $32
    ldh  [hJingle], a                             ; $646A: $E0 $F2
    ld   a, $FF                                   ; $646C: $3E $FF
    jp   label_3B0C                               ; $646E: $C3 $0C $3B

jr_005_6471:
    ld   hl, $C3D0                                ; $6471: $21 $D0 $C3
    add  hl, bc                                   ; $6474: $09
    ld   a, [hl]                                  ; $6475: $7E
    cp   $05                                      ; $6476: $FE $05
    jp   nc, label_005_656D                       ; $6478: $D2 $6D $65

    ld   hl, wEntity0SpeedX                       ; $647B: $21 $40 $C2
    add  hl, bc                                   ; $647E: $09
    ld   a, [hl]                                  ; $647F: $7E
    and  a                                        ; $6480: $A7
    jr   z, jr_005_648D                           ; $6481: $28 $0A

    ldh  a, [hFrameCounter]                       ; $6483: $F0 $E7
    rra                                           ; $6485: $1F
    rra                                           ; $6486: $1F
    rra                                           ; $6487: $1F
    and  $01                                      ; $6488: $E6 $01
    jp   label_3B0C                               ; $648A: $C3 $0C $3B

jr_005_648D:
    ret                                           ; $648D: $C9

    ld   a, $02                                   ; $648E: $3E $02
    call label_3B0C                               ; $6490: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $6493: $CD $05 $0C
    jr   z, jr_005_64AF                           ; $6496: $28 $17

    and  $02                                      ; $6498: $E6 $02
    ld   e, $08                                   ; $649A: $1E $08
    jr   z, jr_005_64A0                           ; $649C: $28 $02

    ld   e, $F8                                   ; $649E: $1E $F8

jr_005_64A0:
    ld   hl, wEntity0SpeedX                       ; $64A0: $21 $40 $C2
    add  hl, bc                                   ; $64A3: $09
    push hl                                       ; $64A4: $E5
    ld   a, [hl]                                  ; $64A5: $7E
    push af                                       ; $64A6: $F5
    ld   [hl], e                                  ; $64A7: $73
    call func_005_7ABE                            ; $64A8: $CD $BE $7A
    pop  af                                       ; $64AB: $F1
    pop  hl                                       ; $64AC: $E1
    ld   [hl], a                                  ; $64AD: $77
    ret                                           ; $64AE: $C9

jr_005_64AF:
    call label_3B39                               ; $64AF: $CD $39 $3B
    call label_BFB                                ; $64B2: $CD $FB $0B
    jr   nz, jr_005_64CC                          ; $64B5: $20 $15

    ldh  a, [wActiveEntityPosX]                   ; $64B7: $F0 $EE
    cp   $70                                      ; $64B9: $FE $70
    jr   nc, jr_005_64CC                          ; $64BB: $30 $0F

    ldh  a, [wActiveEntityPosY]                   ; $64BD: $F0 $EC
    cp   $50                                      ; $64BF: $FE $50
    jr   nc, jr_005_64CC                          ; $64C1: $30 $09

    call label_3D7F                               ; $64C3: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $64C6: $CD $12 $3B
    ld   [hl], $01                                ; $64C9: $36 $01
    ret                                           ; $64CB: $C9

jr_005_64CC:
    ld   hl, $C420                                ; $64CC: $21 $20 $C4
    add  hl, bc                                   ; $64CF: $09
    ld   a, [hl]                                  ; $64D0: $7E
    cp   $08                                      ; $64D1: $FE $08
    jr   nz, jr_005_64F7                          ; $64D3: $20 $22

    ldh  a, [wActiveEntityPosX]                   ; $64D5: $F0 $EE
    cp   $70                                      ; $64D7: $FE $70
    jr   nc, jr_005_64F7                          ; $64D9: $30 $1C

    ldh  a, [wActiveEntityPosY]                   ; $64DB: $F0 $EC
    cp   $50                                      ; $64DD: $FE $50
    jr   nc, jr_005_64F7                          ; $64DF: $30 $16

    ld   hl, $C3D0                                ; $64E1: $21 $D0 $C3
    add  hl, bc                                   ; $64E4: $09
    inc  [hl]                                     ; $64E5: $34
    ld   a, [hl]                                  ; $64E6: $7E
    cp   $05                                      ; $64E7: $FE $05
    jr   c, jr_005_64F7                           ; $64E9: $38 $0C

    call IncrementEntityWalkingAttr               ; $64EB: $CD $12 $3B
    call label_3D7F                               ; $64EE: $CD $7F $3D
    call IsEntityFrameCounterZero                 ; $64F1: $CD $05 $0C
    ld   [hl], $80                                ; $64F4: $36 $80
    ret                                           ; $64F6: $C9

jr_005_64F7:
    ld   hl, $C420                                ; $64F7: $21 $20 $C4
    add  hl, bc                                   ; $64FA: $09
    ld   a, [hl]                                  ; $64FB: $7E
    cp   $0B                                      ; $64FC: $FE $0B
    ret  nc                                       ; $64FE: $D0

    call func_005_7AB1                            ; $64FF: $CD $B1 $7A
    call label_3B23                               ; $6502: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6505: $21 $A0 $C2
    add  hl, bc                                   ; $6508: $09
    ld   a, [hl]                                  ; $6509: $7E
    push af                                       ; $650A: $F5
    and  $03                                      ; $650B: $E6 $03
    jr   z, jr_005_6515                           ; $650D: $28 $06

    ld   hl, wEntity0SpeedX                       ; $650F: $21 $40 $C2
    call func_005_651D                            ; $6512: $CD $1D $65

jr_005_6515:
    pop  af                                       ; $6515: $F1
    and  $0C                                      ; $6516: $E6 $0C
    jr   z, jr_005_6522                           ; $6518: $28 $08

    ld   hl, wEntity0SpeedY                       ; $651A: $21 $50 $C2

func_005_651D:
    add  hl, bc                                   ; $651D: $09
    ld   a, [hl]                                  ; $651E: $7E
    cpl                                           ; $651F: $2F
    inc  a                                        ; $6520: $3C
    ld   [hl], a                                  ; $6521: $77

jr_005_6522:
    ldh  a, [hFrameCounter]                       ; $6522: $F0 $E7
    and  $07                                      ; $6524: $E6 $07
    ret  nz                                       ; $6526: $C0

    ldh  a, [wActiveEntityPosX]                   ; $6527: $F0 $EE
    ldh  [hScratchA], a                           ; $6529: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $652B: $F0 $EC
    ldh  [hScratchB], a                           ; $652D: $E0 $D8
    ld   a, $0A                                   ; $652F: $3E $0A
    jp   label_CC7                                ; $6531: $C3 $C7 $0C

    call IsEntityFrameCounterZero                 ; $6534: $CD $05 $0C
    cp   $40                                      ; $6537: $FE $40
    jr   c, jr_005_655B                           ; $6539: $38 $20

    jr   nz, jr_005_6544                          ; $653B: $20 $07

    ld   a, $29                                   ; $653D: $3E $29
    ldh  [hNoiseSfx], a                            ; $653F: $E0 $F4
    call func_005_657F                            ; $6541: $CD $7F $65

jr_005_6544:
    and  $02                                      ; $6544: $E6 $02
    ld   e, $10                                   ; $6546: $1E $10
    jr   z, jr_005_654C                           ; $6548: $28 $02

    ld   e, $F0                                   ; $654A: $1E $F0

jr_005_654C:
    ld   hl, wEntity0SpeedX                       ; $654C: $21 $40 $C2
    add  hl, bc                                   ; $654F: $09
    push hl                                       ; $6550: $E5
    ld   a, [hl]                                  ; $6551: $7E
    push af                                       ; $6552: $F5
    ld   [hl], e                                  ; $6553: $73
    call func_005_7ABE                            ; $6554: $CD $BE $7A
    pop  af                                       ; $6557: $F1
    pop  hl                                       ; $6558: $E1
    ld   [hl], a                                  ; $6559: $77
    ret                                           ; $655A: $C9

jr_005_655B:
    and  a                                        ; $655B: $A7
    jr   nz, jr_005_656D                          ; $655C: $20 $0F

    call IncrementEntityWalkingAttr               ; $655E: $CD $12 $3B
    ld   [hl], $01                                ; $6561: $36 $01
    call label_3D7F                               ; $6563: $CD $7F $3D
    ld   hl, $C360                                ; $6566: $21 $60 $C3
    add  hl, bc                                   ; $6569: $09
    ld   [hl], $08                                ; $656A: $36 $08
    ret                                           ; $656C: $C9

label_005_656D:
jr_005_656D:
    ldh  a, [hFrameCounter]                       ; $656D: $F0 $E7
    rra                                           ; $656F: $1F
    rra                                           ; $6570: $1F
    rra                                           ; $6571: $1F
    and  $01                                      ; $6572: $E6 $01
    add  $03                                      ; $6574: $C6 $03
    jp   label_3B0C                               ; $6576: $C3 $0C $3B

    ret                                           ; $6579: $C9

    ret                                           ; $657A: $C9

    ld   hl, sp+$08                               ; $657B: $F8 $08
    ld   hl, sp+$08                               ; $657D: $F8 $08

func_005_657F:
    ld   a, $02                                   ; $657F: $3E $02

jr_005_6581:
    ldh  [hFFE8], a                               ; $6581: $E0 $E8
    ld   a, $62                                   ; $6583: $3E $62
    call label_3B86                               ; $6585: $CD $86 $3B
    jr   c, jr_005_65D3                           ; $6588: $38 $49

    ld   hl, wEntitiesUnknownTableB               ; $658A: $21 $B0 $C2
    add  hl, de                                   ; $658D: $19
    ld   [hl], $03                                ; $658E: $36 $03
    push bc                                       ; $6590: $C5
    ldh  a, [hFFE8]                               ; $6591: $F0 $E8
    ld   c, a                                     ; $6593: $4F
    ld   hl, $657A                                ; $6594: $21 $7A $65
    add  hl, bc                                   ; $6597: $09
    ldh  a, [hScratchA]                           ; $6598: $F0 $D7
    add  [hl]                                     ; $659A: $86
    ld   hl, wEntity0PosX                         ; $659B: $21 $00 $C2
    add  hl, de                                   ; $659E: $19
    ld   [hl], a                                  ; $659F: $77
    ldh  a, [hScratchB]                           ; $65A0: $F0 $D8
    ld   hl, wEntity0PosY                         ; $65A2: $21 $10 $C2
    add  hl, de                                   ; $65A5: $19
    ld   [hl], a                                  ; $65A6: $77
    ldh  a, [hScratchD]                           ; $65A7: $F0 $DA
    ld   hl, $C310                                ; $65A9: $21 $10 $C3
    add  hl, de                                   ; $65AC: $19
    ld   [hl], a                                  ; $65AD: $77
    ld   hl, wEntitiesUnknownTableG               ; $65AE: $21 $B0 $C3
    add  hl, de                                   ; $65B1: $19
    ldh  a, [hFFE8]                               ; $65B2: $F0 $E8
    dec  a                                        ; $65B4: $3D
    ld   [hl], a                                  ; $65B5: $77
    ld   hl, $657C                                ; $65B6: $21 $7C $65
    add  hl, bc                                   ; $65B9: $09
    ld   a, [hl]                                  ; $65BA: $7E
    ld   hl, wEntity0SpeedX                       ; $65BB: $21 $40 $C2
    add  hl, de                                   ; $65BE: $19
    ld   [hl], a                                  ; $65BF: $77
    ld   hl, wEntity0SpeedY                       ; $65C0: $21 $50 $C2
    add  hl, de                                   ; $65C3: $19
    ld   [hl], $04                                ; $65C4: $36 $04
    pop  bc                                       ; $65C6: $C1
    ld   hl, $C320                                ; $65C7: $21 $20 $C3
    add  hl, de                                   ; $65CA: $19
    ld   [hl], $08                                ; $65CB: $36 $08
    ld   hl, $C340                                ; $65CD: $21 $40 $C3
    add  hl, de                                   ; $65D0: $19
    ld   [hl], $42                                ; $65D1: $36 $42

jr_005_65D3:
    ldh  a, [hFFE8]                               ; $65D3: $F0 $E8
    dec  a                                        ; $65D5: $3D
    jr   nz, jr_005_6581                          ; $65D6: $20 $A9

    ret                                           ; $65D8: $C9

func_005_65D9:
    ld   a, $62                                   ; $65D9: $3E $62
    call label_3B86                               ; $65DB: $CD $86 $3B
    jr   c, jr_005_6600                           ; $65DE: $38 $20

    ld   hl, wEntitiesUnknownTableB               ; $65E0: $21 $B0 $C2
    add  hl, de                                   ; $65E3: $19
    ld   [hl], $01                                ; $65E4: $36 $01
    ldh  a, [hScratchA]                           ; $65E6: $F0 $D7
    ld   hl, wEntity0PosX                         ; $65E8: $21 $00 $C2
    add  hl, de                                   ; $65EB: $19
    ld   [hl], a                                  ; $65EC: $77
    ldh  a, [hScratchB]                           ; $65ED: $F0 $D8
    ld   hl, wEntity0PosY                         ; $65EF: $21 $10 $C2
    add  hl, de                                   ; $65F2: $19
    ld   [hl], a                                  ; $65F3: $77
    ld   hl, wEntitiesFrameCounterTable           ; $65F4: $21 $E0 $C2
    add  hl, de                                   ; $65F7: $19
    ld   [hl], $14                                ; $65F8: $36 $14
    ld   hl, $C340                                ; $65FA: $21 $40 $C3
    add  hl, de                                   ; $65FD: $19
    ld   [hl], $C4                                ; $65FE: $36 $C4

jr_005_6600:
    ret                                           ; $6600: $C9

    ld   hl, sp+$08                               ; $6601: $F8 $08
    ld   hl, sp+$08                               ; $6603: $F8 $08
    db   $FC                                      ; $6605: $FC
    db   $FC                                      ; $6606: $FC
    inc  b                                        ; $6607: $04
    inc  b                                        ; $6608: $04
    db   $F4                                      ; $6609: $F4
    inc  c                                        ; $660A: $0C
    db   $F4                                      ; $660B: $F4
    inc  c                                        ; $660C: $0C
    db   $F4                                      ; $660D: $F4
    db   $F4                                      ; $660E: $F4
    inc  c                                        ; $660F: $0C
    inc  c                                        ; $6610: $0C

func_005_6611:
    ld   a, $04                                   ; $6611: $3E $04

jr_005_6613:
    ldh  [hFFE8], a                               ; $6613: $E0 $E8
    ld   a, $62                                   ; $6615: $3E $62
    call label_3B86                               ; $6617: $CD $86 $3B
    jr   c, jr_005_665F                           ; $661A: $38 $43

    ld   hl, wEntitiesUnknownTableB               ; $661C: $21 $B0 $C2
    add  hl, de                                   ; $661F: $19
    ld   [hl], $02                                ; $6620: $36 $02
    push bc                                       ; $6622: $C5
    ldh  a, [hFFE8]                               ; $6623: $F0 $E8
    ld   c, a                                     ; $6625: $4F
    ld   hl, $6600                                ; $6626: $21 $00 $66
    add  hl, bc                                   ; $6629: $09
    ldh  a, [hScratchA]                           ; $662A: $F0 $D7
    add  [hl]                                     ; $662C: $86
    ld   hl, wEntity0PosX                         ; $662D: $21 $00 $C2
    add  hl, de                                   ; $6630: $19
    ld   [hl], a                                  ; $6631: $77
    ld   hl, $6604                                ; $6632: $21 $04 $66
    add  hl, bc                                   ; $6635: $09
    ldh  a, [hScratchB]                           ; $6636: $F0 $D8
    add  [hl]                                     ; $6638: $86
    ld   hl, wEntity0PosY                         ; $6639: $21 $10 $C2
    add  hl, de                                   ; $663C: $19
    ld   [hl], a                                  ; $663D: $77
    ld   hl, $6608                                ; $663E: $21 $08 $66
    add  hl, bc                                   ; $6641: $09
    ld   a, [hl]                                  ; $6642: $7E
    ld   hl, wEntity0SpeedX                       ; $6643: $21 $40 $C2
    add  hl, de                                   ; $6646: $19
    ld   [hl], a                                  ; $6647: $77
    ld   hl, $660C                                ; $6648: $21 $0C $66
    add  hl, bc                                   ; $664B: $09
    ld   a, [hl]                                  ; $664C: $7E
    ld   hl, wEntity0SpeedY                       ; $664D: $21 $50 $C2
    add  hl, de                                   ; $6650: $19
    ld   [hl], a                                  ; $6651: $77
    pop  bc                                       ; $6652: $C1
    ld   hl, $C320                                ; $6653: $21 $20 $C3
    add  hl, de                                   ; $6656: $19
    ld   [hl], $13                                ; $6657: $36 $13
    ld   hl, $C340                                ; $6659: $21 $40 $C3
    add  hl, de                                   ; $665C: $19
    ld   [hl], $42                                ; $665D: $36 $42

jr_005_665F:
    ldh  a, [hFFE8]                               ; $665F: $F0 $E8
    dec  a                                        ; $6661: $3D
    jr   nz, jr_005_6613                          ; $6662: $20 $AF

    ret                                           ; $6664: $C9

    ldh  a, [hRoomStatus]                         ; $6665: $F0 $F8
    ld   h, b                                     ; $6667: $60
    ld   [bc], a                                  ; $6668: $02
    ldh  a, [rP1]                                 ; $6669: $F0 $00
    ld   h, d                                     ; $666B: $62
    ld   [bc], a                                  ; $666C: $02
    ldh  a, [$FF08]                               ; $666D: $F0 $08
    ld   h, h                                     ; $666F: $64
    ld   [bc], a                                  ; $6670: $02
    ldh  a, [rNR10]                               ; $6671: $F0 $10
    ld   h, [hl]                                  ; $6673: $66
    ld   [bc], a                                  ; $6674: $02
    nop                                           ; $6675: $00
    ld   hl, sp+$68                               ; $6676: $F8 $68
    ld   [bc], a                                  ; $6678: $02
    nop                                           ; $6679: $00
    nop                                           ; $667A: $00
    ld   l, d                                     ; $667B: $6A
    ld   [bc], a                                  ; $667C: $02
    nop                                           ; $667D: $00
    ld   [$226A], sp                              ; $667E: $08 $6A $22
    nop                                           ; $6681: $00
    db   $10                                      ; $6682: $10
    ld   l, b                                     ; $6683: $68
    ld   [hl+], a                                 ; $6684: $22
    ldh  a, [hRoomStatus]                         ; $6685: $F0 $F8
    ld   h, [hl]                                  ; $6687: $66
    ld   hl, $00F0                                ; $6688: $21 $F0 $00
    ld   h, h                                     ; $668B: $64
    ld   hl, label_8F0                            ; $668C: $21 $F0 $08
    ld   h, d                                     ; $668F: $62
    ld   hl, $10F0                                ; $6690: $21 $F0 $10
    ld   h, b                                     ; $6693: $60
    ld   hl, $F800                                ; $6694: $21 $00 $F8
    ld   l, b                                     ; $6697: $68
    ld   bc, $0000                                ; $6698: $01 $00 $00
    ld   l, d                                     ; $669B: $6A
    ld   bc, label_800                            ; $669C: $01 $00 $08
    ld   l, d                                     ; $669F: $6A
    ld   hl, label_1000                           ; $66A0: $21 $00 $10
    ld   l, b                                     ; $66A3: $68
    ld   hl, $F800                                ; $66A4: $21 $00 $F8
    ld   l, h                                     ; $66A7: $6C
    ld   [bc], a                                  ; $66A8: $02
    nop                                           ; $66A9: $00
    nop                                           ; $66AA: $00
    ld   l, [hl]                                  ; $66AB: $6E
    ld   [bc], a                                  ; $66AC: $02
    nop                                           ; $66AD: $00
    ld   [$226E], sp                              ; $66AE: $08 $6E $22
    nop                                           ; $66B1: $00
    db   $10                                      ; $66B2: $10
    ld   l, h                                     ; $66B3: $6C
    ld   [hl+], a                                 ; $66B4: $22
    nop                                           ; $66B5: $00
    db   $FC                                      ; $66B6: $FC
    ld   a, h                                     ; $66B7: $7C
    ld   [bc], a                                  ; $66B8: $02
    nop                                           ; $66B9: $00
    inc  b                                        ; $66BA: $04
    ld   a, [hl]                                  ; $66BB: $7E
    ld   [bc], a                                  ; $66BC: $02
    nop                                           ; $66BD: $00
    inc  c                                        ; $66BE: $0C
    ld   a, h                                     ; $66BF: $7C
    ld   [hl+], a                                 ; $66C0: $22
    nop                                           ; $66C1: $00
    nop                                           ; $66C2: $00
    rst  $38                                      ; $66C3: $FF
    nop                                           ; $66C4: $00
    nop                                           ; $66C5: $00
    db   $FC                                      ; $66C6: $FC
    ld   a, h                                     ; $66C7: $7C
    ld   [bc], a                                  ; $66C8: $02
    nop                                           ; $66C9: $00
    inc  b                                        ; $66CA: $04
    ld   a, [hl]                                  ; $66CB: $7E
    ld   [hl+], a                                 ; $66CC: $22
    nop                                           ; $66CD: $00
    inc  c                                        ; $66CE: $0C
    ld   a, h                                     ; $66CF: $7C
    ld   [hl+], a                                 ; $66D0: $22
    nop                                           ; $66D1: $00
    nop                                           ; $66D2: $00
    rst  $38                                      ; $66D3: $FF
    nop                                           ; $66D4: $00
    nop                                           ; $66D5: $00
    ld   hl, sp+$74                               ; $66D6: $F8 $74
    ld   [bc], a                                  ; $66D8: $02
    nop                                           ; $66D9: $00
    nop                                           ; $66DA: $00
    db   $76                                      ; $66DB: $76
    ld   [bc], a                                  ; $66DC: $02
    nop                                           ; $66DD: $00
    ld   [$2276], sp                              ; $66DE: $08 $76 $22
    nop                                           ; $66E1: $00
    db   $10                                      ; $66E2: $10
    ld   [hl], h                                  ; $66E3: $74
    ld   [hl+], a                                 ; $66E4: $22
    nop                                           ; $66E5: $00
    ld   hl, sp+$70                               ; $66E6: $F8 $70
    ld   [bc], a                                  ; $66E8: $02
    nop                                           ; $66E9: $00
    nop                                           ; $66EA: $00
    ld   [hl], d                                  ; $66EB: $72
    ld   [bc], a                                  ; $66EC: $02
    nop                                           ; $66ED: $00
    ld   [$2272], sp                              ; $66EE: $08 $72 $22
    nop                                           ; $66F1: $00
    db   $10                                      ; $66F2: $10
    ld   [hl], b                                  ; $66F3: $70
    ld   [hl+], a                                 ; $66F4: $22
    ld   a, [bc]                                  ; $66F5: $0A
    ei                                            ; $66F6: $FB
    ld   h, $02                                   ; $66F7: $26 $02
    ld   a, [bc]                                  ; $66F9: $0A
    ld   bc, $0226                                ; $66FA: $01 $26 $02
    ld   a, [bc]                                  ; $66FD: $0A
    ld   b, $26                                   ; $66FE: $06 $26
    ld   [bc], a                                  ; $6700: $02
    ld   a, [bc]                                  ; $6701: $0A
    inc  c                                        ; $6702: $0C
    ld   h, $02                                   ; $6703: $26 $02

func_005_6705:
    ldh  a, [hActiveEntityUnknownG]               ; $6705: $F0 $F1
    cp   $02                                      ; $6707: $FE $02
    jr   nc, jr_005_6754                          ; $6709: $30 $49

    ld   hl, $C340                                ; $670B: $21 $40 $C3
    add  hl, bc                                   ; $670E: $09
    ld   a, [hl]                                  ; $670F: $7E
    and  $F0                                      ; $6710: $E6 $F0
    or   $08                                      ; $6712: $F6 $08
    ld   [hl], a                                  ; $6714: $77
    ldh  a, [hActiveEntityUnknownG]               ; $6715: $F0 $F1
    rla                                           ; $6717: $17
    rla                                           ; $6718: $17
    rla                                           ; $6719: $17
    rla                                           ; $671A: $17
    rla                                           ; $671B: $17
    and  $E0                                      ; $671C: $E6 $E0
    ld   e, a                                     ; $671E: $5F
    ld   d, b                                     ; $671F: $50
    ld   hl, $6665                                ; $6720: $21 $65 $66
    add  hl, de                                   ; $6723: $19
    ld   c, $08                                   ; $6724: $0E $08
    call label_3CE6                               ; $6726: $CD $E6 $3C
    nop                                           ; $6729: $00

label_005_672A:
    ldh  a, [hActiveEntityUnknownG]               ; $672A: $F0 $F1
    cp   $05                                      ; $672C: $FE $05
    ret  nc                                       ; $672E: $D0

    ld   hl, $C310                                ; $672F: $21 $10 $C3
    add  hl, bc                                   ; $6732: $09
    ld   a, [hl]                                  ; $6733: $7E
    dec  a                                        ; $6734: $3D
    cp   $08                                      ; $6735: $FE $08
    ret  c                                        ; $6737: $D8

    ld   hl, $C340                                ; $6738: $21 $40 $C3
    add  hl, bc                                   ; $673B: $09
    ld   a, [hl]                                  ; $673C: $7E
    and  $F0                                      ; $673D: $E6 $F0
    or   $04                                      ; $673F: $F6 $04
    ld   [hl], a                                  ; $6741: $77
    ldh  a, [$FFEF]                               ; $6742: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $6744: $E0 $EC
    xor  a                                        ; $6746: $AF
    ldh  [hActiveEntityUnknownG], a               ; $6747: $E0 $F1
    ld   hl, $66F5                                ; $6749: $21 $F5 $66
    ld   c, $04                                   ; $674C: $0E $04
    call label_3CE6                               ; $674E: $CD $E6 $3C
    jp   label_3D8A                               ; $6751: $C3 $8A $3D

label_005_6754:
jr_005_6754:
    ld   hl, $C340                                ; $6754: $21 $40 $C3
    add  hl, bc                                   ; $6757: $09
    ld   a, [hl]                                  ; $6758: $7E
    and  $F0                                      ; $6759: $E6 $F0
    or   $04                                      ; $675B: $F6 $04
    ld   [hl], a                                  ; $675D: $77
    ldh  a, [hActiveEntityUnknownG]               ; $675E: $F0 $F1
    dec  a                                        ; $6760: $3D
    dec  a                                        ; $6761: $3D
    rla                                           ; $6762: $17
    rla                                           ; $6763: $17
    rla                                           ; $6764: $17
    rla                                           ; $6765: $17
    and  $F0                                      ; $6766: $E6 $F0
    ld   e, a                                     ; $6768: $5F
    ld   d, b                                     ; $6769: $50
    ld   hl, $66A5                                ; $676A: $21 $A5 $66
    add  hl, de                                   ; $676D: $19
    ld   c, $04                                   ; $676E: $0E $04
    call label_3CE6                               ; $6770: $CD $E6 $3C
    jp   label_005_672A                           ; $6773: $C3 $2A $67

label_005_6776:
    call IsEntityFrameCounterZero                 ; $6776: $CD $05 $0C
    jp   z, label_005_7B4B                        ; $6779: $CA $4B $7B

    cp   $0A                                      ; $677C: $FE $0A
    ld   a, $05                                   ; $677E: $3E $05
    jr   c, jr_005_6783                           ; $6780: $38 $01

    inc  a                                        ; $6782: $3C

jr_005_6783:
    ldh  [hActiveEntityUnknownG], a               ; $6783: $E0 $F1
    jp   label_005_6754                           ; $6785: $C3 $54 $67

    ld   e, $02                                   ; $6788: $1E $02
    ld   e, $62                                   ; $678A: $1E $62
    ld   e, $42                                   ; $678C: $1E $42
    ld   e, $22                                   ; $678E: $1E $22
    ld   a, d                                     ; $6790: $7A
    ld   [bc], a                                  ; $6791: $02
    ld   a, d                                     ; $6792: $7A
    ld   [hl+], a                                 ; $6793: $22
    ld   a, b                                     ; $6794: $78
    ld   [bc], a                                  ; $6795: $02
    ld   a, b                                     ; $6796: $78
    ld   [hl+], a                                 ; $6797: $22

label_005_6798:
    ld   de, $6788                                ; $6798: $11 $88 $67
    call label_3BC0                               ; $679B: $CD $C0 $3B
    call func_005_7A3A                            ; $679E: $CD $3A $7A
    call label_3B44                               ; $67A1: $CD $44 $3B
    ldh  a, [hActiveEntityWalking]                ; $67A4: $F0 $F0
    rst  $00                                      ; $67A6: $C7
    xor  e                                        ; $67A7: $AB
    ld   h, a                                     ; $67A8: $67
    jp   nc, $CD67                                ; $67A9: $D2 $67 $CD

    or   c                                        ; $67AC: $B1
    ld   a, d                                     ; $67AD: $7A
    call func_005_7AEA                            ; $67AE: $CD $EA $7A
    ld   hl, $C320                                ; $67B1: $21 $20 $C3
    add  hl, bc                                   ; $67B4: $09
    dec  [hl]                                     ; $67B5: $35
    ld   hl, $C310                                ; $67B6: $21 $10 $C3
    add  hl, bc                                   ; $67B9: $09
    ld   a, [hl]                                  ; $67BA: $7E
    and  $80                                      ; $67BB: $E6 $80
    jr   z, jr_005_67C8                           ; $67BD: $28 $09

    ld   [hl], b                                  ; $67BF: $70
    call IncrementEntityWalkingAttr               ; $67C0: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $67C3: $CD $05 $0C
    ld   [hl], $0F                                ; $67C6: $36 $0F

jr_005_67C8:
    ldh  a, [hFrameCounter]                       ; $67C8: $F0 $E7
    rra                                           ; $67CA: $1F
    rra                                           ; $67CB: $1F
    rra                                           ; $67CC: $1F
    and  $01                                      ; $67CD: $E6 $01
    jp   label_3B0C                               ; $67CF: $C3 $0C $3B

    call IsEntityFrameCounterZero                 ; $67D2: $CD $05 $0C
    jp   z, label_005_7B4B                        ; $67D5: $CA $4B $7B

    rra                                           ; $67D8: $1F
    rra                                           ; $67D9: $1F
    rra                                           ; $67DA: $1F
    and  $01                                      ; $67DB: $E6 $01
    inc  a                                        ; $67DD: $3C
    inc  a                                        ; $67DE: $3C
    jp   label_3B0C                               ; $67DF: $C3 $0C $3B

    ld   l, h                                     ; $67E2: $6C
    ld   [bc], a                                  ; $67E3: $02
    ld   l, [hl]                                  ; $67E4: $6E
    ld   [bc], a                                  ; $67E5: $02
    ld   l, [hl]                                  ; $67E6: $6E
    ld   [hl+], a                                 ; $67E7: $22
    ld   l, h                                     ; $67E8: $6C
    ld   [hl+], a                                 ; $67E9: $22

label_005_67EA:
    ld   de, $67E2                                ; $67EA: $11 $E2 $67
    call label_3BC0                               ; $67ED: $CD $C0 $3B
    call func_005_7A3A                            ; $67F0: $CD $3A $7A
    call func_005_7AB1                            ; $67F3: $CD $B1 $7A
    call func_005_7AEA                            ; $67F6: $CD $EA $7A
    ld   hl, $C320                                ; $67F9: $21 $20 $C3
    add  hl, bc                                   ; $67FC: $09
    dec  [hl]                                     ; $67FD: $35
    ld   hl, $C310                                ; $67FE: $21 $10 $C3
    add  hl, bc                                   ; $6801: $09
    ld   a, [hl]                                  ; $6802: $7E
    and  $80                                      ; $6803: $E6 $80
    ret  z                                        ; $6805: $C8

    xor  a                                        ; $6806: $AF
    ld   [hl], a                                  ; $6807: $77
    call IsEntityFrameCounterZero                 ; $6808: $CD $05 $0C
    ld   [hl], $0F                                ; $680B: $36 $0F
    ld   hl, wEntitiesUnknownTableB               ; $680D: $21 $B0 $C2
    add  hl, bc                                   ; $6810: $09
    ld   [hl], $02                                ; $6811: $36 $02
    ld   a, $FF                                   ; $6813: $3E $FF
    jp   label_3B0C                               ; $6815: $C3 $0C $3B

    ld   hl, $C460                                ; $6818: $21 $60 $C4
    add  hl, bc                                   ; $681B: $09
    ld   e, [hl]                                  ; $681C: $5E
    sla  e                                        ; $681D: $CB $23
    sla  e                                        ; $681F: $CB $23
    sla  e                                        ; $6821: $CB $23
    sla  e                                        ; $6823: $CB $23
    sla  e                                        ; $6825: $CB $23
    sla  e                                        ; $6827: $CB $23
    ld   d, b                                     ; $6829: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $682A: $21 $00 $D0
    add  hl, de                                   ; $682D: $19
    push de                                       ; $682E: $D5
    ld   e, $20                                   ; $682F: $1E $20

jr_005_6831:
    xor  a                                        ; $6831: $AF
    ld   [hl+], a                                 ; $6832: $22
    dec  e                                        ; $6833: $1D
    ld   a, e                                     ; $6834: $7B
    cp   $00                                      ; $6835: $FE $00
    jr   nz, jr_005_6831                          ; $6837: $20 $F8

    pop  de                                       ; $6839: $D1
    ld   hl, $D100                                ; $683A: $21 $00 $D1
    add  hl, de                                   ; $683D: $19
    ld   e, $20                                   ; $683E: $1E $20

jr_005_6840:
    xor  a                                        ; $6840: $AF
    ld   [hl+], a                                 ; $6841: $22
    dec  e                                        ; $6842: $1D
    ld   a, e                                     ; $6843: $7B
    cp   $00                                      ; $6844: $FE $00
    jr   nz, jr_005_6840                          ; $6846: $20 $F8

    ld   hl, wEntity0SpeedY                       ; $6848: $21 $50 $C2
    add  hl, bc                                   ; $684B: $09
    ld   [hl], $06                                ; $684C: $36 $06
    call IsEntityFrameCounterZero                 ; $684E: $CD $05 $0C
    ld   [hl], $40                                ; $6851: $36 $40
    call label_C00                                ; $6853: $CD $00 $0C
    ld   [hl], $40                                ; $6856: $36 $40
    ld   hl, wEntitiesUnknownTableG               ; $6858: $21 $B0 $C3
    add  hl, bc                                   ; $685B: $09
    ld   [hl], $03                                ; $685C: $36 $03
    ret                                           ; $685E: $C9

    ld   b, $FA                                   ; $685F: $06 $FA
    nop                                           ; $6861: $00
    nop                                           ; $6862: $00
    nop                                           ; $6863: $00
    nop                                           ; $6864: $00
    ld   a, [RenderLoop.RenderLoop_loadNewMap]    ; $6865: $FA $06 $02
    ld   bc, $0100                                ; $6868: $01 $00 $01
    ld   hl, $2322                                ; $686B: $21 $22 $23
    ld   [hl+], a                                 ; $686E: $22
    ldh  a, [hMapId]                              ; $686F: $F0 $F7
    cp   $07                                      ; $6871: $FE $07
    jr   nz, jr_005_6879                          ; $6873: $20 $04

    ld   a, $10                                   ; $6875: $3E $10
    ldh  [hFFF5], a                               ; $6877: $E0 $F5

jr_005_6879:
    call func_005_6A38                            ; $6879: $CD $38 $6A
    call func_005_7A3A                            ; $687C: $CD $3A $7A
    call label_3EE8                               ; $687F: $CD $E8 $3E
    call label_C56                                ; $6882: $CD $56 $0C
    call label_3B39                               ; $6885: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                ; $6888: $F0 $F0
    rst  $00                                      ; $688A: $C7
    sub  c                                        ; $688B: $91
    ld   l, b                                     ; $688C: $68
    ld   d, a                                     ; $688D: $57
    ld   l, c                                     ; $688E: $69
    or   c                                        ; $688F: $B1
    ld   l, c                                     ; $6890: $69
    call IsEntityFrameCounterZero                 ; $6891: $CD $05 $0C
    jr   nz, jr_005_689B                          ; $6894: $20 $05

    ld   [hl], $00                                ; $6896: $36 $00
    call IncrementEntityWalkingAttr               ; $6898: $CD $12 $3B

jr_005_689B:
    ld   hl, $C3D0                                ; $689B: $21 $D0 $C3
    add  hl, bc                                   ; $689E: $09
    ld   a, [hl]                                  ; $689F: $7E
    inc  a                                        ; $68A0: $3C
    and  $3F                                      ; $68A1: $E6 $3F
    ld   [hl], a                                  ; $68A3: $77
    ldh  [hScratchA], a                           ; $68A4: $E0 $D7
    rra                                           ; $68A6: $1F
    rra                                           ; $68A7: $1F
    nop                                           ; $68A8: $00
    and  $03                                      ; $68A9: $E6 $03
    ld   e, a                                     ; $68AB: $5F
    ld   d, $00                                   ; $68AC: $16 $00
    ld   hl, $6867                                ; $68AE: $21 $67 $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesUnknownTableB               ; $68B3: $21 $B0 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, $686B                                ; $68B8: $21 $6B $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    ld   hl, wEntitiesUnknownTableC               ; $68BD: $21 $C0 $C2
    add  hl, bc                                   ; $68C0: $09
    ld   [hl], a                                  ; $68C1: $77
    ld   hl, $C460                                ; $68C2: $21 $60 $C4
    add  hl, bc                                   ; $68C5: $09
    ld   e, [hl]                                  ; $68C6: $5E
    sla  e                                        ; $68C7: $CB $23
    sla  e                                        ; $68C9: $CB $23
    sla  e                                        ; $68CB: $CB $23
    sla  e                                        ; $68CD: $CB $23
    sla  e                                        ; $68CF: $CB $23
    sla  e                                        ; $68D1: $CB $23
    ld   d, $00                                   ; $68D3: $16 $00
    push de                                       ; $68D5: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $68D6: $21 $00 $D0
    add  hl, de                                   ; $68D9: $19
    ldh  a, [hScratchA]                           ; $68DA: $F0 $D7
    ld   e, a                                     ; $68DC: $5F
    add  hl, de                                   ; $68DD: $19
    ldh  a, [wActiveEntityPosX]                   ; $68DE: $F0 $EE
    ld   [hl], a                                  ; $68E0: $77
    pop  de                                       ; $68E1: $D1
    ld   hl, $D100                                ; $68E2: $21 $00 $D1
    add  hl, de                                   ; $68E5: $19
    ldh  a, [hScratchA]                           ; $68E6: $F0 $D7
    ld   e, a                                     ; $68E8: $5F
    add  hl, de                                   ; $68E9: $19
    ldh  a, [wActiveEntityPosY]                   ; $68EA: $F0 $EC
    ld   [hl], a                                  ; $68EC: $77
    call func_005_7AB1                            ; $68ED: $CD $B1 $7A
    call label_3B23                               ; $68F0: $CD $23 $3B
    ld   e, $0F                                   ; $68F3: $1E $0F
    ld   d, b                                     ; $68F5: $50

jr_005_68F6:
    ld   hl, wEntity0Type                         ; $68F6: $21 $80 $C2
    add  hl, de                                   ; $68F9: $19
    ld   a, [hl]                                  ; $68FA: $7E
    cp   $05                                      ; $68FB: $FE $05
    jr   nz, jr_005_6953                          ; $68FD: $20 $54

    ld   hl, $C3A0                                ; $68FF: $21 $A0 $C3
    add  hl, de                                   ; $6902: $19
    ld   a, [hl]                                  ; $6903: $7E
    cp   $02                                      ; $6904: $FE $02
    jr   nz, jr_005_6953                          ; $6906: $20 $4B

    ld   hl, wEntitiesFrameCounterTable           ; $6908: $21 $E0 $C2
    add  hl, de                                   ; $690B: $19
    ld   a, [hl]                                  ; $690C: $7E
    cp   $38                                      ; $690D: $FE $38
    jr   c, jr_005_6953                           ; $690F: $38 $42

    ld   hl, wEntity0PosX                         ; $6911: $21 $00 $C2
    add  hl, de                                   ; $6914: $19
    ldh  a, [wActiveEntityPosX]                   ; $6915: $F0 $EE
    sub  [hl]                                     ; $6917: $96
    add  $06                                      ; $6918: $C6 $06
    cp   $0C                                      ; $691A: $FE $0C
    jr   nc, jr_005_6953                          ; $691C: $30 $35

    ld   hl, wEntity0PosY                         ; $691E: $21 $10 $C2
    add  hl, de                                   ; $6921: $19
    ldh  a, [wActiveEntityPosY]                   ; $6922: $F0 $EC
    sub  [hl]                                     ; $6924: $96
    add  $06                                      ; $6925: $C6 $06
    cp   $0C                                      ; $6927: $FE $0C
    jr   nc, jr_005_6953                          ; $6929: $30 $28

    ld   hl, $C310                                ; $692B: $21 $10 $C3
    add  hl, de                                   ; $692E: $19
    ld   a, [hl]                                  ; $692F: $7E
    and  a                                        ; $6930: $A7
    jr   nz, jr_005_6953                          ; $6931: $20 $20

    ld   hl, wEntity0Type                         ; $6933: $21 $80 $C2
    add  hl, de                                   ; $6936: $19
    ld   [hl], b                                  ; $6937: $70
    call IncrementEntityWalkingAttr               ; $6938: $CD $12 $3B
    ld   [hl], $02                                ; $693B: $36 $02
    ld   hl, $C300                                ; $693D: $21 $00 $C3
    add  hl, bc                                   ; $6940: $09
    ld   [hl], $60                                ; $6941: $36 $60
    ld   hl, $C420                                ; $6943: $21 $20 $C4
    add  hl, bc                                   ; $6946: $09
    ld   [hl], $0C                                ; $6947: $36 $0C
    ld   hl, $C440                                ; $6949: $21 $40 $C4
    add  hl, bc                                   ; $694C: $09
    inc  [hl]                                     ; $694D: $34
    ld   a, $2A                                   ; $694E: $3E $2A
    ldh  [hJingle], a                             ; $6950: $E0 $F2
    ret                                           ; $6952: $C9

jr_005_6953:
    dec  e                                        ; $6953: $1D
    jr   nz, jr_005_68F6                          ; $6954: $20 $A0

    ret                                           ; $6956: $C9

    call IsEntityFrameCounterZero                 ; $6957: $CD $05 $0C
    jr   nz, jr_005_69A0                          ; $695A: $20 $44

    call GetRandomByte                            ; $695C: $CD $0D $28
    and  $1F                                      ; $695F: $E6 $1F
    add  $40                                      ; $6961: $C6 $40
    ld   [hl], a                                  ; $6963: $77
    call IncrementEntityWalkingAttr               ; $6964: $CD $12 $3B
    ld   [hl], b                                  ; $6967: $70
    ld   hl, wEntitiesUnknownTableD               ; $6968: $21 $D0 $C2
    add  hl, bc                                   ; $696B: $09
    ld   a, [hl]                                  ; $696C: $7E
    inc  a                                        ; $696D: $3C
    and  $03                                      ; $696E: $E6 $03
    ld   [hl], a                                  ; $6970: $77
    jr   nz, jr_005_6978                          ; $6971: $20 $05

    call func_005_7B24                            ; $6973: $CD $24 $7B
    jr   jr_005_697E                              ; $6976: $18 $06

jr_005_6978:
    call GetRandomByte                            ; $6978: $CD $0D $28
    and  $03                                      ; $697B: $E6 $03
    ld   e, a                                     ; $697D: $5F

jr_005_697E:
    ld   hl, hActiveEntityUnknownG                ; $697E: $21 $F1 $FF
    xor  [hl]                                     ; $6981: $AE
    and  $02                                      ; $6982: $E6 $02
    jr   z, jr_005_6978                           ; $6984: $28 $F2

    ld   d, b                                     ; $6986: $50
    ld   hl, wEntitiesUnknownTableG               ; $6987: $21 $B0 $C3
    add  hl, bc                                   ; $698A: $09
    ld   [hl], e                                  ; $698B: $73
    ld   hl, $685F                                ; $698C: $21 $5F $68
    add  hl, de                                   ; $698F: $19
    ld   a, [hl]                                  ; $6990: $7E
    ld   hl, wEntity0SpeedX                       ; $6991: $21 $40 $C2
    add  hl, bc                                   ; $6994: $09
    ld   [hl], a                                  ; $6995: $77
    ld   hl, $6863                                ; $6996: $21 $63 $68
    add  hl, de                                   ; $6999: $19
    ld   a, [hl]                                  ; $699A: $7E
    ld   hl, wEntity0SpeedY                       ; $699B: $21 $50 $C2
    add  hl, bc                                   ; $699E: $09
    ld   [hl], a                                  ; $699F: $77

jr_005_69A0:
    ret                                           ; $69A0: $C9

    di                                            ; $69A1: $F3
    dec  c                                        ; $69A2: $0D
    nop                                           ; $69A3: $00
    nop                                           ; $69A4: $00
    nop                                           ; $69A5: $00
    nop                                           ; $69A6: $00
    dec  c                                        ; $69A7: $0D
    di                                            ; $69A8: $F3
    inc  c                                        ; $69A9: $0C
    db   $F4                                      ; $69AA: $F4
    nop                                           ; $69AB: $00
    nop                                           ; $69AC: $00
    nop                                           ; $69AD: $00
    nop                                           ; $69AE: $00
    db   $F4                                      ; $69AF: $F4
    inc  c                                        ; $69B0: $0C
    ld   hl, $C300                                ; $69B1: $21 $00 $C3
    add  hl, bc                                   ; $69B4: $09
    ld   a, [hl]                                  ; $69B5: $7E
    and  a                                        ; $69B6: $A7
    jr   nz, jr_005_69C4                          ; $69B7: $20 $0B

    call IsEntityFrameCounterZero                 ; $69B9: $CD $05 $0C
    ld   [hl], $30                                ; $69BC: $36 $30
    call IncrementEntityWalkingAttr               ; $69BE: $CD $12 $3B
    ld   [hl], $01                                ; $69C1: $36 $01
    ret                                           ; $69C3: $C9

jr_005_69C4:
    cp   $24                                      ; $69C4: $FE $24
    jr   nz, jr_005_69CB                          ; $69C6: $20 $03

    call label_C4B                                ; $69C8: $CD $4B $0C

jr_005_69CB:
    cp   $04                                      ; $69CB: $FE $04
    jr   nz, jr_005_69EB                          ; $69CD: $20 $1C

    ldh  a, [hActiveEntityUnknownG]               ; $69CF: $F0 $F1
    ld   e, a                                     ; $69D1: $5F
    ld   d, b                                     ; $69D2: $50
    ld   hl, $69A9                                ; $69D3: $21 $A9 $69
    add  hl, de                                   ; $69D6: $19
    ldh  a, [wActiveEntityPosX]                   ; $69D7: $F0 $EE
    add  [hl]                                     ; $69D9: $86
    ldh  [hScratchA], a                           ; $69DA: $E0 $D7
    ld   hl, $69AD                                ; $69DC: $21 $AD $69
    add  hl, de                                   ; $69DF: $19
    ldh  a, [wActiveEntityPosY]                   ; $69E0: $F0 $EC
    add  [hl]                                     ; $69E2: $86
    ldh  [hScratchB], a                           ; $69E3: $E0 $D8
    ld   a, $02                                   ; $69E5: $3E $02
    call label_CC7                                ; $69E7: $CD $C7 $0C
    xor  a                                        ; $69EA: $AF

jr_005_69EB:
    cp   $20                                      ; $69EB: $FE $20
    ret  nz                                       ; $69ED: $C0

    ld   hl, $C440                                ; $69EE: $21 $40 $C4
    add  hl, bc                                   ; $69F1: $09
    ld   a, [hl]                                  ; $69F2: $7E
    cp   $03                                      ; $69F3: $FE $03
    ret  nz                                       ; $69F5: $C0

    ld   a, $02                                   ; $69F6: $3E $02
    call label_3B86                               ; $69F8: $CD $86 $3B
    ret  c                                        ; $69FB: $D8

    ld   hl, wEntitiesFrameCounterTable           ; $69FC: $21 $E0 $C2
    add  hl, de                                   ; $69FF: $19
    ld   [hl], $17                                ; $6A00: $36 $17
    push bc                                       ; $6A02: $C5
    ld   hl, wEntitiesUnknownTableG               ; $6A03: $21 $B0 $C3
    add  hl, bc                                   ; $6A06: $09
    ld   c, [hl]                                  ; $6A07: $4E
    ld   hl, $69A1                                ; $6A08: $21 $A1 $69
    add  hl, bc                                   ; $6A0B: $09
    ldh  a, [hScratchA]                           ; $6A0C: $F0 $D7
    add  [hl]                                     ; $6A0E: $86
    ld   hl, wEntity0PosX                         ; $6A0F: $21 $00 $C2
    add  hl, de                                   ; $6A12: $19
    ld   [hl], a                                  ; $6A13: $77
    ld   hl, $69A5                                ; $6A14: $21 $A5 $69
    add  hl, bc                                   ; $6A17: $09
    ldh  a, [hScratchB]                           ; $6A18: $F0 $D8
    add  [hl]                                     ; $6A1A: $86
    ld   hl, wEntity0PosY                         ; $6A1B: $21 $10 $C2
    add  hl, de                                   ; $6A1E: $19
    ld   [hl], a                                  ; $6A1F: $77
    pop  bc                                       ; $6A20: $C1
    jp   label_005_7E9D                           ; $6A21: $C3 $9D $7E

    ld   h, [hl]                                  ; $6A24: $66
    inc  hl                                       ; $6A25: $23
    ld   h, h                                     ; $6A26: $64
    inc  hl                                       ; $6A27: $23
    ld   h, h                                     ; $6A28: $64
    inc  bc                                       ; $6A29: $03
    ld   h, [hl]                                  ; $6A2A: $66
    inc  bc                                       ; $6A2B: $03
    ld   h, d                                     ; $6A2C: $62
    inc  bc                                       ; $6A2D: $03
    ld   h, d                                     ; $6A2E: $62
    inc  hl                                       ; $6A2F: $23
    ld   h, b                                     ; $6A30: $60
    inc  bc                                       ; $6A31: $03
    ld   h, b                                     ; $6A32: $60
    inc  hl                                       ; $6A33: $23
    ld   l, b                                     ; $6A34: $68
    inc  bc                                       ; $6A35: $03
    ld   l, b                                     ; $6A36: $68
    inc  hl                                       ; $6A37: $23

func_005_6A38:
    call label_C00                                ; $6A38: $CD $00 $0C
    ld   hl, wRoomTransitionState                 ; $6A3B: $21 $24 $C1
    or   [hl]                                     ; $6A3E: $B6
    ld   hl, $C300                                ; $6A3F: $21 $00 $C3
    add  hl, bc                                   ; $6A42: $09
    or   [hl]                                     ; $6A43: $B6
    jp   nz, label_005_6C77                       ; $6A44: $C2 $77 $6C

    ldh  a, [hActiveEntityUnknownG]               ; $6A47: $F0 $F1
    cp   $02                                      ; $6A49: $FE $02
    jr   nz, jr_005_6A56                          ; $6A4B: $20 $09

    call func_005_6AA5                            ; $6A4D: $CD $A5 $6A
    call func_005_6A5F                            ; $6A50: $CD $5F $6A
    jp   label_3D8A                               ; $6A53: $C3 $8A $3D

jr_005_6A56:
    call func_005_6A5F                            ; $6A56: $CD $5F $6A
    call func_005_6AA5                            ; $6A59: $CD $A5 $6A
    jp   label_3D8A                               ; $6A5C: $C3 $8A $3D

func_005_6A5F:
    ld   hl, $C3D0                                ; $6A5F: $21 $D0 $C3
    add  hl, bc                                   ; $6A62: $09
    ld   a, [hl]                                  ; $6A63: $7E
    ldh  [hScratchA], a                           ; $6A64: $E0 $D7
    push bc                                       ; $6A66: $C5
    ld   hl, $C460                                ; $6A67: $21 $60 $C4
    add  hl, bc                                   ; $6A6A: $09
    ld   e, [hl]                                  ; $6A6B: $5E
    ld   hl, wEntitiesUnknownTableB               ; $6A6C: $21 $B0 $C2
    add  hl, bc                                   ; $6A6F: $09
    ld   c, [hl]                                  ; $6A70: $4E
    sla  e                                        ; $6A71: $CB $23
    sla  e                                        ; $6A73: $CB $23
    sla  e                                        ; $6A75: $CB $23
    sla  e                                        ; $6A77: $CB $23
    sla  e                                        ; $6A79: $CB $23
    sla  e                                        ; $6A7B: $CB $23
    ld   d, b                                     ; $6A7D: $50
    push de                                       ; $6A7E: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $6A7F: $21 $00 $D0
    add  hl, de                                   ; $6A82: $19
    ldh  a, [hScratchA]                           ; $6A83: $F0 $D7
    sub  c                                        ; $6A85: $91
    and  $3F                                      ; $6A86: $E6 $3F
    ld   e, a                                     ; $6A88: $5F
    ld   d, b                                     ; $6A89: $50
    add  hl, de                                   ; $6A8A: $19
    ld   a, [hl]                                  ; $6A8B: $7E
    ldh  [wActiveEntityPosX], a                   ; $6A8C: $E0 $EE
    pop  de                                       ; $6A8E: $D1
    ld   hl, $D100                                ; $6A8F: $21 $00 $D1
    add  hl, de                                   ; $6A92: $19
    ldh  a, [hScratchA]                           ; $6A93: $F0 $D7
    sub  c                                        ; $6A95: $91
    and  $3F                                      ; $6A96: $E6 $3F
    ld   e, a                                     ; $6A98: $5F
    ld   d, b                                     ; $6A99: $50
    add  hl, de                                   ; $6A9A: $19
    ld   a, [hl]                                  ; $6A9B: $7E
    ldh  [wActiveEntityPosY], a                   ; $6A9C: $E0 $EC
    pop  bc                                       ; $6A9E: $C1
    ld   de, $6A24                                ; $6A9F: $11 $24 $6A
    jp   label_3BC0                               ; $6AA2: $C3 $C0 $3B

func_005_6AA5:
    ld   hl, $C3D0                                ; $6AA5: $21 $D0 $C3
    add  hl, bc                                   ; $6AA8: $09
    ld   a, [hl]                                  ; $6AA9: $7E
    ldh  [hScratchA], a                           ; $6AAA: $E0 $D7
    push bc                                       ; $6AAC: $C5
    ld   hl, $C460                                ; $6AAD: $21 $60 $C4
    add  hl, bc                                   ; $6AB0: $09
    ld   e, [hl]                                  ; $6AB1: $5E
    ld   hl, wEntitiesUnknownTableC               ; $6AB2: $21 $C0 $C2
    add  hl, bc                                   ; $6AB5: $09
    ld   c, [hl]                                  ; $6AB6: $4E
    sla  e                                        ; $6AB7: $CB $23
    sla  e                                        ; $6AB9: $CB $23
    sla  e                                        ; $6ABB: $CB $23
    sla  e                                        ; $6ABD: $CB $23
    sla  e                                        ; $6ABF: $CB $23
    sla  e                                        ; $6AC1: $CB $23
    ld   d, b                                     ; $6AC3: $50
    push de                                       ; $6AC4: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $6AC5: $21 $00 $D0
    add  hl, de                                   ; $6AC8: $19
    ldh  a, [hScratchA]                           ; $6AC9: $F0 $D7
    sub  c                                        ; $6ACB: $91
    and  $3F                                      ; $6ACC: $E6 $3F
    ld   e, a                                     ; $6ACE: $5F
    ld   d, b                                     ; $6ACF: $50
    add  hl, de                                   ; $6AD0: $19
    ld   a, [hl]                                  ; $6AD1: $7E
    ldh  [wActiveEntityPosX], a                   ; $6AD2: $E0 $EE
    pop  de                                       ; $6AD4: $D1
    ld   hl, $D100                                ; $6AD5: $21 $00 $D1
    add  hl, de                                   ; $6AD8: $19
    ldh  a, [hScratchA]                           ; $6AD9: $F0 $D7
    sub  c                                        ; $6ADB: $91
    and  $3F                                      ; $6ADC: $E6 $3F
    ld   e, a                                     ; $6ADE: $5F
    ld   d, b                                     ; $6ADF: $50
    add  hl, de                                   ; $6AE0: $19
    ld   a, [hl]                                  ; $6AE1: $7E
    ldh  [wActiveEntityPosY], a                   ; $6AE2: $E0 $EC
    pop  bc                                       ; $6AE4: $C1
    ld   a, $04                                   ; $6AE5: $3E $04
    ldh  [hActiveEntityUnknownG], a               ; $6AE7: $E0 $F1
    ld   de, $6A24                                ; $6AE9: $11 $24 $6A
    call label_3BC0                               ; $6AEC: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableG               ; $6AEF: $21 $B0 $C3
    add  hl, bc                                   ; $6AF2: $09
    ld   a, [hl]                                  ; $6AF3: $7E
    ldh  [hActiveEntityUnknownG], a               ; $6AF4: $E0 $F1
    ret                                           ; $6AF6: $C9

    nop                                           ; $6AF7: $00
    nop                                           ; $6AF8: $00
    ld   h, [hl]                                  ; $6AF9: $66
    jr   nz, jr_005_6AFC                          ; $6AFA: $20 $00

jr_005_6AFC:
    ld   [$2064], sp                              ; $6AFC: $08 $64 $20
    nop                                           ; $6AFF: $00
    di                                            ; $6B00: $F3
    ld   l, b                                     ; $6B01: $68
    nop                                           ; $6B02: $00
    nop                                           ; $6B03: $00
    ei                                            ; $6B04: $FB
    ld   l, b                                     ; $6B05: $68
    jr   nz, jr_005_6B08                          ; $6B06: $20 $00

jr_005_6B08:
    nop                                           ; $6B08: $00
    ld   h, h                                     ; $6B09: $64
    nop                                           ; $6B0A: $00
    nop                                           ; $6B0B: $00
    ld   [$0066], sp                              ; $6B0C: $08 $66 $00
    nop                                           ; $6B0F: $00
    dec  c                                        ; $6B10: $0D
    ld   l, b                                     ; $6B11: $68
    nop                                           ; $6B12: $00
    nop                                           ; $6B13: $00
    dec  d                                        ; $6B14: $15
    ld   l, b                                     ; $6B15: $68
    jr   nz, jr_005_6B18                          ; $6B16: $20 $00

jr_005_6B18:
    nop                                           ; $6B18: $00
    ld   h, d                                     ; $6B19: $62
    nop                                           ; $6B1A: $00
    nop                                           ; $6B1B: $00
    ld   [$2062], sp                              ; $6B1C: $08 $62 $20
    dec  c                                        ; $6B1F: $0D
    nop                                           ; $6B20: $00
    ld   l, b                                     ; $6B21: $68
    nop                                           ; $6B22: $00
    dec  c                                        ; $6B23: $0D
    ld   [$2068], sp                              ; $6B24: $08 $68 $20
    nop                                           ; $6B27: $00
    nop                                           ; $6B28: $00
    ld   h, b                                     ; $6B29: $60
    nop                                           ; $6B2A: $00
    nop                                           ; $6B2B: $00
    ld   [$2060], sp                              ; $6B2C: $08 $60 $20
    di                                            ; $6B2F: $F3
    nop                                           ; $6B30: $00
    ld   l, b                                     ; $6B31: $68
    nop                                           ; $6B32: $00
    di                                            ; $6B33: $F3
    ld   [$2068], sp                              ; $6B34: $08 $68 $20
    nop                                           ; $6B37: $00

jr_005_6B38:
    inc  b                                        ; $6B38: $04
    ld   h, [hl]                                  ; $6B39: $66
    jr   nz, jr_005_6B3C                          ; $6B3A: $20 $00

jr_005_6B3C:
    inc  c                                        ; $6B3C: $0C
    ld   h, h                                     ; $6B3D: $64
    jr   nz, jr_005_6B38                          ; $6B3E: $20 $F8

    db   $EC                                      ; $6B40: $EC
    ld   l, h                                     ; $6B41: $6C
    nop                                           ; $6B42: $00
    ld   hl, sp-$0C                               ; $6B43: $F8 $F4
    ld   l, d                                     ; $6B45: $6A
    nop                                           ; $6B46: $00
    ld   hl, sp-$04                               ; $6B47: $F8 $FC
    ld   l, d                                     ; $6B49: $6A
    jr   nz, @-$06                                ; $6B4A: $20 $F8

    inc  b                                        ; $6B4C: $04
    ld   l, h                                     ; $6B4D: $6C
    jr   nz, @+$0A                                ; $6B4E: $20 $08

    db   $EC                                      ; $6B50: $EC
    ld   l, h                                     ; $6B51: $6C
    ld   b, b                                     ; $6B52: $40
    ld   [$6EF4], sp                              ; $6B53: $08 $F4 $6E
    ld   b, b                                     ; $6B56: $40
    ld   [$6EFC], sp                              ; $6B57: $08 $FC $6E
    ld   h, b                                     ; $6B5A: $60
    ld   [$6C04], sp                              ; $6B5B: $08 $04 $6C
    ld   h, b                                     ; $6B5E: $60
    nop                                           ; $6B5F: $00
    db   $FC                                      ; $6B60: $FC
    ld   h, h                                     ; $6B61: $64
    nop                                           ; $6B62: $00
    nop                                           ; $6B63: $00
    inc  b                                        ; $6B64: $04
    ld   h, [hl]                                  ; $6B65: $66
    nop                                           ; $6B66: $00
    ld   hl, sp+$04                               ; $6B67: $F8 $04
    ld   l, h                                     ; $6B69: $6C
    nop                                           ; $6B6A: $00
    ld   hl, sp+$0C                               ; $6B6B: $F8 $0C
    ld   l, d                                     ; $6B6D: $6A
    nop                                           ; $6B6E: $00
    ld   hl, sp+$14                               ; $6B6F: $F8 $14
    ld   l, d                                     ; $6B71: $6A
    jr   nz, @-$06                                ; $6B72: $20 $F8

    inc  e                                        ; $6B74: $1C
    ld   l, h                                     ; $6B75: $6C
    jr   nz, @+$0A                                ; $6B76: $20 $08

    inc  b                                        ; $6B78: $04
    ld   l, h                                     ; $6B79: $6C
    ld   b, b                                     ; $6B7A: $40
    ld   [$6E0C], sp                              ; $6B7B: $08 $0C $6E
    ld   b, b                                     ; $6B7E: $40
    ld   [$6E14], sp                              ; $6B7F: $08 $14 $6E
    ld   h, b                                     ; $6B82: $60
    ld   [$6C1C], sp                              ; $6B83: $08 $1C $6C
    ld   h, b                                     ; $6B86: $60
    inc  b                                        ; $6B87: $04
    ld   hl, sp+$6C                               ; $6B88: $F8 $6C
    nop                                           ; $6B8A: $00
    inc  b                                        ; $6B8B: $04
    nop                                           ; $6B8C: $00
    ld   l, d                                     ; $6B8D: $6A
    nop                                           ; $6B8E: $00
    inc  b                                        ; $6B8F: $04
    ld   [$206A], sp                              ; $6B90: $08 $6A $20
    inc  b                                        ; $6B93: $04
    db   $10                                      ; $6B94: $10
    ld   l, h                                     ; $6B95: $6C
    jr   nz, jr_005_6BAC                          ; $6B96: $20 $14

    ld   hl, sp+$6C                               ; $6B98: $F8 $6C
    ld   b, b                                     ; $6B9A: $40
    inc  d                                        ; $6B9B: $14
    nop                                           ; $6B9C: $00
    ld   l, [hl]                                  ; $6B9D: $6E
    ld   b, b                                     ; $6B9E: $40
    inc  d                                        ; $6B9F: $14
    ld   [$606E], sp                              ; $6BA0: $08 $6E $60
    inc  d                                        ; $6BA3: $14
    db   $10                                      ; $6BA4: $10
    ld   l, h                                     ; $6BA5: $6C
    ld   h, b                                     ; $6BA6: $60
    db   $FC                                      ; $6BA7: $FC
    nop                                           ; $6BA8: $00
    ld   h, d                                     ; $6BA9: $62
    nop                                           ; $6BAA: $00
    db   $FC                                      ; $6BAB: $FC

jr_005_6BAC:
    ld   [$2062], sp                              ; $6BAC: $08 $62 $20
    inc  b                                        ; $6BAF: $04
    nop                                           ; $6BB0: $00
    ld   h, b                                     ; $6BB1: $60
    nop                                           ; $6BB2: $00
    inc  b                                        ; $6BB3: $04
    ld   [$2060], sp                              ; $6BB4: $08 $60 $20
    db   $EC                                      ; $6BB7: $EC
    ld   hl, sp+$6C                               ; $6BB8: $F8 $6C
    nop                                           ; $6BBA: $00
    db   $EC                                      ; $6BBB: $EC
    nop                                           ; $6BBC: $00
    ld   l, d                                     ; $6BBD: $6A
    nop                                           ; $6BBE: $00
    db   $EC                                      ; $6BBF: $EC
    ld   [$206A], sp                              ; $6BC0: $08 $6A $20
    db   $EC                                      ; $6BC3: $EC

jr_005_6BC4:
    db   $10                                      ; $6BC4: $10
    ld   l, h                                     ; $6BC5: $6C
    jr   nz, jr_005_6BC4                          ; $6BC6: $20 $FC

    ld   hl, sp+$6C                               ; $6BC8: $F8 $6C
    ld   b, b                                     ; $6BCA: $40
    db   $FC                                      ; $6BCB: $FC
    nop                                           ; $6BCC: $00
    ld   l, [hl]                                  ; $6BCD: $6E
    ld   b, b                                     ; $6BCE: $40
    db   $FC                                      ; $6BCF: $FC
    ld   [$606E], sp                              ; $6BD0: $08 $6E $60
    db   $FC                                      ; $6BD3: $FC
    db   $10                                      ; $6BD4: $10
    ld   l, h                                     ; $6BD5: $6C
    ld   h, b                                     ; $6BD6: $60
    nop                                           ; $6BD7: $00
    ld   [bc], a                                  ; $6BD8: $02
    ld   h, [hl]                                  ; $6BD9: $66
    jr   nz, jr_005_6BDC                          ; $6BDA: $20 $00

jr_005_6BDC:
    ld   a, [bc]                                  ; $6BDC: $0A
    ld   h, h                                     ; $6BDD: $64
    jr   nz, @-$03                                ; $6BDE: $20 $FB

    rst  $28                                      ; $6BE0: $EF
    ld   l, h                                     ; $6BE1: $6C
    nop                                           ; $6BE2: $00
    ei                                            ; $6BE3: $FB
    rst  $30                                      ; $6BE4: $F7
    ld   l, [hl]                                  ; $6BE5: $6E
    nop                                           ; $6BE6: $00

jr_005_6BE7:
    ei                                            ; $6BE7: $FB
    ld   sp, hl                                   ; $6BE8: $F9
    ld   l, [hl]                                  ; $6BE9: $6E
    jr   nz, jr_005_6BE7                          ; $6BEA: $20 $FB

    ld   bc, $206C                                ; $6BEC: $01 $6C $20
    dec  b                                        ; $6BEF: $05
    rst  $28                                      ; $6BF0: $EF
    ld   l, h                                     ; $6BF1: $6C
    ld   b, b                                     ; $6BF2: $40
    dec  b                                        ; $6BF3: $05
    rst  $30                                      ; $6BF4: $F7
    ld   l, [hl]                                  ; $6BF5: $6E
    ld   b, b                                     ; $6BF6: $40
    dec  b                                        ; $6BF7: $05
    ld   sp, hl                                   ; $6BF8: $F9
    ld   l, [hl]                                  ; $6BF9: $6E
    ld   h, b                                     ; $6BFA: $60
    dec  b                                        ; $6BFB: $05
    ld   bc, $606C                                ; $6BFC: $01 $6C $60
    nop                                           ; $6BFF: $00
    cp   $64                                      ; $6C00: $FE $64
    nop                                           ; $6C02: $00
    nop                                           ; $6C03: $00
    ld   [bc], a                                  ; $6C04: $02
    ld   h, [hl]                                  ; $6C05: $66
    nop                                           ; $6C06: $00
    ei                                            ; $6C07: $FB
    rlca                                          ; $6C08: $07
    ld   l, h                                     ; $6C09: $6C
    nop                                           ; $6C0A: $00
    ei                                            ; $6C0B: $FB
    rrca                                          ; $6C0C: $0F
    ld   l, [hl]                                  ; $6C0D: $6E
    nop                                           ; $6C0E: $00
    ei                                            ; $6C0F: $FB
    ld   de, $206E                                ; $6C10: $11 $6E $20
    ei                                            ; $6C13: $FB
    add  hl, de                                   ; $6C14: $19
    ld   l, h                                     ; $6C15: $6C
    jr   nz, jr_005_6C1D                          ; $6C16: $20 $05

    rlca                                          ; $6C18: $07
    ld   l, h                                     ; $6C19: $6C
    ld   b, b                                     ; $6C1A: $40
    dec  b                                        ; $6C1B: $05
    rrca                                          ; $6C1C: $0F

jr_005_6C1D:
    ld   l, [hl]                                  ; $6C1D: $6E
    ld   b, b                                     ; $6C1E: $40
    dec  b                                        ; $6C1F: $05
    ld   de, $606E                                ; $6C20: $11 $6E $60
    dec  b                                        ; $6C23: $05
    add  hl, de                                   ; $6C24: $19
    ld   l, h                                     ; $6C25: $6C
    ld   h, b                                     ; $6C26: $60
    rlca                                          ; $6C27: $07
    ei                                            ; $6C28: $FB
    ld   l, h                                     ; $6C29: $6C
    nop                                           ; $6C2A: $00
    rlca                                          ; $6C2B: $07
    inc  bc                                       ; $6C2C: $03
    ld   l, [hl]                                  ; $6C2D: $6E
    nop                                           ; $6C2E: $00
    rlca                                          ; $6C2F: $07
    dec  b                                        ; $6C30: $05
    ld   l, [hl]                                  ; $6C31: $6E
    jr   nz, jr_005_6C3B                          ; $6C32: $20 $07

    dec  c                                        ; $6C34: $0D
    ld   l, h                                     ; $6C35: $6C
    jr   nz, jr_005_6C49                          ; $6C36: $20 $11

    ei                                            ; $6C38: $FB
    ld   l, h                                     ; $6C39: $6C
    ld   b, b                                     ; $6C3A: $40

jr_005_6C3B:
    ld   de, $6E03                                ; $6C3B: $11 $03 $6E
    ld   b, b                                     ; $6C3E: $40
    ld   de, $6E05                                ; $6C3F: $11 $05 $6E
    ld   h, b                                     ; $6C42: $60
    ld   de, $6C0D                                ; $6C43: $11 $0D $6C
    ld   h, b                                     ; $6C46: $60
    cp   $00                                      ; $6C47: $FE $00

jr_005_6C49:
    ld   h, d                                     ; $6C49: $62
    nop                                           ; $6C4A: $00
    cp   $08                                      ; $6C4B: $FE $08
    ld   h, d                                     ; $6C4D: $62
    jr   nz, jr_005_6C52                          ; $6C4E: $20 $02

    nop                                           ; $6C50: $00
    ld   h, b                                     ; $6C51: $60

jr_005_6C52:
    nop                                           ; $6C52: $00

jr_005_6C53:
    ld   [bc], a                                  ; $6C53: $02
    ld   [$2060], sp                              ; $6C54: $08 $60 $20
    rst  $28                                      ; $6C57: $EF
    ei                                            ; $6C58: $FB
    ld   l, h                                     ; $6C59: $6C
    nop                                           ; $6C5A: $00
    rst  $28                                      ; $6C5B: $EF
    inc  bc                                       ; $6C5C: $03
    ld   l, [hl]                                  ; $6C5D: $6E
    nop                                           ; $6C5E: $00
    rst  $28                                      ; $6C5F: $EF
    dec  b                                        ; $6C60: $05

jr_005_6C61:
    ld   l, [hl]                                  ; $6C61: $6E
    jr   nz, jr_005_6C53                          ; $6C62: $20 $EF

    dec  c                                        ; $6C64: $0D
    ld   l, h                                     ; $6C65: $6C
    jr   nz, jr_005_6C61                          ; $6C66: $20 $F9

    ei                                            ; $6C68: $FB
    ld   l, h                                     ; $6C69: $6C
    ld   b, b                                     ; $6C6A: $40
    ld   sp, hl                                   ; $6C6B: $F9
    inc  bc                                       ; $6C6C: $03
    ld   l, [hl]                                  ; $6C6D: $6E
    ld   b, b                                     ; $6C6E: $40
    ld   sp, hl                                   ; $6C6F: $F9
    dec  b                                        ; $6C70: $05
    ld   l, [hl]                                  ; $6C71: $6E
    ld   h, b                                     ; $6C72: $60
    ld   sp, hl                                   ; $6C73: $F9
    dec  c                                        ; $6C74: $0D
    ld   l, h                                     ; $6C75: $6C
    ld   h, b                                     ; $6C76: $60

label_005_6C77:
    ld   hl, $C300                                ; $6C77: $21 $00 $C3
    add  hl, bc                                   ; $6C7A: $09
    ld   a, [hl]                                  ; $6C7B: $7E
    cp   $08                                      ; $6C7C: $FE $08
    jr   c, jr_005_6CAE                           ; $6C7E: $38 $2E

    cp   $28                                      ; $6C80: $FE $28
    jr   nc, jr_005_6CAE                          ; $6C82: $30 $2A

    ld   hl, $6BD7                                ; $6C84: $21 $D7 $6B
    cp   $0E                                      ; $6C87: $FE $0E
    jr   c, jr_005_6C92                           ; $6C89: $38 $07

    cp   $22                                      ; $6C8B: $FE $22
    jr   nc, jr_005_6C92                          ; $6C8D: $30 $03

    ld   hl, $6B37                                ; $6C8F: $21 $37 $6B

jr_005_6C92:
    ldh  a, [hActiveEntityUnknownG]               ; $6C92: $F0 $F1
    ld   e, a                                     ; $6C94: $5F
    ld   d, b                                     ; $6C95: $50
    sla  e                                        ; $6C96: $CB $23
    sla  e                                        ; $6C98: $CB $23
    sla  e                                        ; $6C9A: $CB $23
    ld   a, e                                     ; $6C9C: $7B
    sla  e                                        ; $6C9D: $CB $23
    sla  e                                        ; $6C9F: $CB $23
    add  e                                        ; $6CA1: $83
    ld   e, a                                     ; $6CA2: $5F
    add  hl, de                                   ; $6CA3: $19
    ld   c, $0A                                   ; $6CA4: $0E $0A
    call label_3CE6                               ; $6CA6: $CD $E6 $3C
    ld   a, $08                                   ; $6CA9: $3E $08
    jp   label_3DA0                               ; $6CAB: $C3 $A0 $3D

jr_005_6CAE:
    ldh  a, [hActiveEntityUnknownG]               ; $6CAE: $F0 $F1
    rla                                           ; $6CB0: $17
    rla                                           ; $6CB1: $17
    rla                                           ; $6CB2: $17
    rla                                           ; $6CB3: $17
    and  $F0                                      ; $6CB4: $E6 $F0
    ld   e, a                                     ; $6CB6: $5F
    ld   d, b                                     ; $6CB7: $50
    ld   hl, $6AF7                                ; $6CB8: $21 $F7 $6A
    add  hl, de                                   ; $6CBB: $19
    ld   c, $04                                   ; $6CBC: $0E $04
    call label_3CE6                               ; $6CBE: $CD $E6 $3C
    ld   a, $02                                   ; $6CC1: $3E $02
    jp   label_3DA0                               ; $6CC3: $C3 $A0 $3D

    call IsEntityFrameCounterZero                 ; $6CC6: $CD $05 $0C
    ld   [hl], $80                                ; $6CC9: $36 $80
    xor  a                                        ; $6CCB: $AF
    ld   [$D200], a                               ; $6CCC: $EA $00 $D2
    ld   [$D203], a                               ; $6CCF: $EA $03 $D2
    ld   [$D204], a                               ; $6CD2: $EA $04 $D2
    ld   hl, $C390                                ; $6CD5: $21 $90 $C3
    add  hl, bc                                   ; $6CD8: $09
    ld   [hl], $01                                ; $6CD9: $36 $01
    ret                                           ; $6CDB: $C9

    call label_394D                               ; $6CDC: $CD $4D $39
    call label_3EE8                               ; $6CDF: $CD $E8 $3E
    call label_C56                                ; $6CE2: $CD $56 $0C
    ld   hl, wEntitiesUnknownTableB               ; $6CE5: $21 $B0 $C2
    add  hl, bc                                   ; $6CE8: $09
    ld   a, [hl]                                  ; $6CE9: $7E
    rst  $00                                      ; $6CEA: $C7
    pop  af                                       ; $6CEB: $F1
    ld   l, h                                     ; $6CEC: $6C
    and  $72                                      ; $6CED: $E6 $72
    pop  de                                       ; $6CEF: $D1
    ld   [hl], l                                  ; $6CF0: $75
    ld   a, c                                     ; $6CF1: $79
    ld   [$D201], a                               ; $6CF2: $EA $01 $D2
    ldh  a, [hActiveEntityWalking]                ; $6CF5: $F0 $F0
    rst  $00                                      ; $6CF7: $C7
    nop                                           ; $6CF8: $00
    ld   l, l                                     ; $6CF9: $6D
    ld   b, d                                     ; $6CFA: $42
    ld   l, l                                     ; $6CFB: $6D
    ld   a, l                                     ; $6CFC: $7D
    ld   l, [hl]                                  ; $6CFD: $6E
    db   $EB                                      ; $6CFE: $EB
    ld   [hl], b                                  ; $6CFF: $70
    call IsEntityFrameCounterZero                 ; $6D00: $CD $05 $0C
    ret  nz                                       ; $6D03: $C0

    ld   [hl], $80                                ; $6D04: $36 $80
    ld   a, $FF                                   ; $6D06: $3E $FF
    ld   [$C157], a                               ; $6D08: $EA $57 $C1
    ld   a, $3E                                   ; $6D0B: $3E $3E
    ldh  [hNoiseSfx], a                            ; $6D0D: $E0 $F4
    ld   [$D3E8], a                               ; $6D0F: $EA $E8 $D3
    ld   a, $04                                   ; $6D12: $3E $04
    ld   [$C158], a                               ; $6D14: $EA $58 $C1
    jp   IncrementEntityWalkingAttr               ; $6D17: $C3 $12 $3B

    jr   nz, @+$62                                ; $6D1A: $20 $60

    jr   nz, jr_005_6D7E                          ; $6D1C: $20 $60

    nop                                           ; $6D1E: $00
    nop                                           ; $6D1F: $00
    ld   [hl], b                                  ; $6D20: $70
    ld   [hl], b                                  ; $6D21: $70
    ld   [label_808], sp                          ; $6D22: $08 $08 $08
    ld   [$0B09], sp                              ; $6D25: $08 $09 $0B
    dec  bc                                       ; $6D28: $0B
    ld   a, [bc]                                  ; $6D29: $0A
    ld   [label_808], sp                          ; $6D2A: $08 $08 $08
    ld   [$0B09], sp                              ; $6D2D: $08 $09 $0B
    dec  bc                                       ; $6D30: $0B
    ld   a, [bc]                                  ; $6D31: $0A
    dec  b                                        ; $6D32: $05
    rlca                                          ; $6D33: $07
    rlca                                          ; $6D34: $07
    ld   b, $04                                   ; $6D35: $06 $04
    inc  b                                        ; $6D37: $04
    inc  b                                        ; $6D38: $04
    inc  b                                        ; $6D39: $04
    dec  b                                        ; $6D3A: $05
    rlca                                          ; $6D3B: $07
    rlca                                          ; $6D3C: $07
    ld   b, $04                                   ; $6D3D: $06 $04
    inc  b                                        ; $6D3F: $04
    inc  b                                        ; $6D40: $04
    inc  b                                        ; $6D41: $04
    ld   a, $38                                   ; $6D42: $3E $38
    ldh  [hSwordIntersectedAreaX], a              ; $6D44: $E0 $CE
    add  $10                                      ; $6D46: $C6 $10
    ld   hl, wEntity0PosX                         ; $6D48: $21 $00 $C2
    add  hl, bc                                   ; $6D4B: $09
    ld   [hl], a                                  ; $6D4C: $77
    ld   a, $30                                   ; $6D4D: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $6D4F: $E0 $CD
    add  $18                                      ; $6D51: $C6 $18
    ld   hl, wEntity0PosY                         ; $6D53: $21 $10 $C2
    add  hl, bc                                   ; $6D56: $09
    ld   [hl], a                                  ; $6D57: $77
    call IsEntityFrameCounterZero                 ; $6D58: $CD $05 $0C
    jp   nz, label_005_6E30                       ; $6D5B: $C2 $30 $6E

    ld   [hl], $FF                                ; $6D5E: $36 $FF
    xor  a                                        ; $6D60: $AF
    ld   [$D3E8], a                               ; $6D61: $EA $E8 $D3
    call IncrementEntityWalkingAttr               ; $6D64: $CD $12 $3B
    ld   a, $AF                                   ; $6D67: $3E $AF
    ld   [$D745], a                               ; $6D69: $EA $45 $D7
    ld   a, $AF                                   ; $6D6C: $3E $AF
    ld   [$D746], a                               ; $6D6E: $EA $46 $D7
    ld   a, $B0                                   ; $6D71: $3E $B0
    ld   [$D755], a                               ; $6D73: $EA $55 $D7
    ld   a, $B0                                   ; $6D76: $3E $B0
    ld   [$D756], a                               ; $6D78: $EA $56 $D7
    call label_C00                                ; $6D7B: $CD $00 $0C

jr_005_6D7E:
    ld   [hl], $1F                                ; $6D7E: $36 $1F
    call label_BFB                                ; $6D80: $CD $FB $0B
    ld   [hl], $B0                                ; $6D83: $36 $B0
    call label_3E34                               ; $6D85: $CD $34 $3E
    ld   hl, wEntity0Type                         ; $6D88: $21 $80 $C2
    add  hl, bc                                   ; $6D8B: $09
    ld   [hl], $05                                ; $6D8C: $36 $05
    ld   hl, wEntity0PosX                         ; $6D8E: $21 $00 $C2
    add  hl, bc                                   ; $6D91: $09
    ld   a, [hl]                                  ; $6D92: $7E
    add  $10                                      ; $6D93: $C6 $10
    ld   [hl], a                                  ; $6D95: $77
    call label_3E34                               ; $6D96: $CD $34 $3E
    ld   hl, wEntity0Type                         ; $6D99: $21 $80 $C2
    add  hl, bc                                   ; $6D9C: $09
    ld   [hl], $05                                ; $6D9D: $36 $05
    call label_3E34                               ; $6D9F: $CD $34 $3E
    call label_C4B                                ; $6DA2: $CD $4B $0C
    ld   hl, wEntity0Type                         ; $6DA5: $21 $80 $C2
    add  hl, bc                                   ; $6DA8: $09
    ld   [hl], $05                                ; $6DA9: $36 $05
    call label_2887                               ; $6DAB: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $6DAE: $F0 $FE
    and  a                                        ; $6DB0: $A7
    jr   z, jr_005_6DFD                           ; $6DB1: $28 $4A

    push bc                                       ; $6DB3: $C5
    ldh  a, [$FFCF]                               ; $6DB4: $F0 $CF
    ld   h, a                                     ; $6DB6: $67
    ldh  a, [$FFD0]                               ; $6DB7: $F0 $D0
    ld   l, a                                     ; $6DB9: $6F
    push hl                                       ; $6DBA: $E5
    inc  l                                        ; $6DBB: $2C
    ld   a, l                                     ; $6DBC: $7D
    ldh  [$FFD0], a                               ; $6DBD: $E0 $D0
    push hl                                       ; $6DBF: $E5
    ld   a, $AF                                   ; $6DC0: $3E $AF
    ld   [$DDD8], a                               ; $6DC2: $EA $D8 $DD
    ld   a, $05                                   ; $6DC5: $3E $05
    call label_91D                                ; $6DC7: $CD $1D $09
    ldh  a, [$FFD0]                               ; $6DCA: $F0 $D0
    inc  a                                        ; $6DCC: $3C
    inc  a                                        ; $6DCD: $3C
    ldh  [$FFD0], a                               ; $6DCE: $E0 $D0
    ld   a, $05                                   ; $6DD0: $3E $05
    call label_91D                                ; $6DD2: $CD $1D $09
    pop  hl                                       ; $6DD5: $E1
    ld   de, $0040                                ; $6DD6: $11 $40 $00
    add  hl, de                                   ; $6DD9: $19
    ld   a, h                                     ; $6DDA: $7C
    ldh  [$FFCF], a                               ; $6DDB: $E0 $CF
    ld   a, l                                     ; $6DDD: $7D
    ldh  [$FFD0], a                               ; $6DDE: $E0 $D0
    ld   a, $B0                                   ; $6DE0: $3E $B0
    ld   [$DDD8], a                               ; $6DE2: $EA $D8 $DD
    ld   a, $05                                   ; $6DE5: $3E $05
    call label_91D                                ; $6DE7: $CD $1D $09
    ldh  a, [$FFD0]                               ; $6DEA: $F0 $D0
    inc  a                                        ; $6DEC: $3C
    inc  a                                        ; $6DED: $3C
    ldh  [$FFD0], a                               ; $6DEE: $E0 $D0
    ld   a, $05                                   ; $6DF0: $3E $05
    call label_91D                                ; $6DF2: $CD $1D $09
    pop  hl                                       ; $6DF5: $E1
    ld   a, h                                     ; $6DF6: $7C
    ldh  [$FFCF], a                               ; $6DF7: $E0 $CF
    ld   a, l                                     ; $6DF9: $7D
    ldh  [$FFD0], a                               ; $6DFA: $E0 $D0
    pop  bc                                       ; $6DFC: $C1

jr_005_6DFD:
    ld   a, [wRequests]                           ; $6DFD: $FA $00 $D6
    ld   e, a                                     ; $6E00: $5F
    ld   d, $00                                   ; $6E01: $16 $00
    ld   hl, wRequestDestinationHigh              ; $6E03: $21 $01 $D6
    add  hl, de                                   ; $6E06: $19
    add  $1C                                      ; $6E07: $C6 $1C
    ld   [wRequests], a                           ; $6E09: $EA $00 $D6
    call func_005_6E15                            ; $6E0C: $CD $15 $6E
    call func_005_6E15                            ; $6E0F: $CD $15 $6E
    call func_005_6E15                            ; $6E12: $CD $15 $6E

func_005_6E15:
    ldh  a, [$FFCF]                               ; $6E15: $F0 $CF
    ld   [hl+], a                                 ; $6E17: $22
    ldh  a, [$FFD0]                               ; $6E18: $F0 $D0
    inc  a                                        ; $6E1A: $3C
    ldh  [$FFD0], a                               ; $6E1B: $E0 $D0
    ld   [hl+], a                                 ; $6E1D: $22
    ld   a, $83                                   ; $6E1E: $3E $83
    ld   [hl+], a                                 ; $6E20: $22
    ld   a, $76                                   ; $6E21: $3E $76
    ld   [hl+], a                                 ; $6E23: $22
    ld   a, $7E                                   ; $6E24: $3E $7E
    ld   [hl+], a                                 ; $6E26: $22
    ld   a, $7E                                   ; $6E27: $3E $7E
    ld   [hl+], a                                 ; $6E29: $22
    ld   a, $77                                   ; $6E2A: $3E $77
    ld   [hl+], a                                 ; $6E2C: $22
    xor  a                                        ; $6E2D: $AF
    ld   [hl], a                                  ; $6E2E: $77
    ret                                           ; $6E2F: $C9

label_005_6E30:
    cp   $40                                      ; $6E30: $FE $40
    jp   nz, label_005_6E7C                       ; $6E32: $C2 $7C $6E

    call label_2887                               ; $6E35: $CD $87 $28
    ld   a, [wRequests]                           ; $6E38: $FA $00 $D6
    ld   e, a                                     ; $6E3B: $5F
    ld   d, $00                                   ; $6E3C: $16 $00
    ld   hl, wRequestDestinationHigh              ; $6E3E: $21 $01 $D6
    add  hl, de                                   ; $6E41: $19
    add  $1C                                      ; $6E42: $C6 $1C
    ld   [wRequests], a                           ; $6E44: $EA $00 $D6
    call func_005_6E4A                            ; $6E47: $CD $4A $6E

func_005_6E4A:
    ldh  a, [$FFCF]                               ; $6E4A: $F0 $CF
    ld   [hl+], a                                 ; $6E4C: $22
    ldh  a, [$FFD0]                               ; $6E4D: $F0 $D0
    inc  a                                        ; $6E4F: $3C
    ldh  [$FFD0], a                               ; $6E50: $E0 $D0
    ld   [hl+], a                                 ; $6E52: $22
    ld   a, $83                                   ; $6E53: $3E $83
    ld   [hl+], a                                 ; $6E55: $22
    ld   a, $1C                                   ; $6E56: $3E $1C
    ld   [hl+], a                                 ; $6E58: $22
    ld   a, $1E                                   ; $6E59: $3E $1E
    ld   [hl+], a                                 ; $6E5B: $22
    ld   a, $1C                                   ; $6E5C: $3E $1C
    ld   [hl+], a                                 ; $6E5E: $22
    ld   a, $1E                                   ; $6E5F: $3E $1E
    ld   [hl+], a                                 ; $6E61: $22
    ldh  a, [$FFCF]                               ; $6E62: $F0 $CF
    ld   [hl+], a                                 ; $6E64: $22
    ldh  a, [$FFD0]                               ; $6E65: $F0 $D0
    inc  a                                        ; $6E67: $3C
    ldh  [$FFD0], a                               ; $6E68: $E0 $D0
    ld   [hl+], a                                 ; $6E6A: $22
    ld   a, $83                                   ; $6E6B: $3E $83
    ld   [hl+], a                                 ; $6E6D: $22
    ld   a, $1D                                   ; $6E6E: $3E $1D
    ld   [hl+], a                                 ; $6E70: $22
    ld   a, $1F                                   ; $6E71: $3E $1F
    ld   [hl+], a                                 ; $6E73: $22
    ld   a, $1D                                   ; $6E74: $3E $1D
    ld   [hl+], a                                 ; $6E76: $22
    ld   a, $1F                                   ; $6E77: $3E $1F
    ld   [hl+], a                                 ; $6E79: $22
    xor  a                                        ; $6E7A: $AF
    ld   [hl], a                                  ; $6E7B: $77

label_005_6E7C:
    ret                                           ; $6E7C: $C9

    ld   hl, wEntity0PosX                         ; $6E7D: $21 $00 $C2
    add  hl, bc                                   ; $6E80: $09
    ld   a, [hl]                                  ; $6E81: $7E
    push af                                       ; $6E82: $F5
    ld   hl, wEntity0PosY                         ; $6E83: $21 $10 $C2
    add  hl, bc                                   ; $6E86: $09
    ld   a, [hl]                                  ; $6E87: $7E
    push af                                       ; $6E88: $F5
    call $70EB                                    ; $6E89: $CD $EB $70
    pop  af                                       ; $6E8C: $F1
    ld   hl, wEntity0PosY                         ; $6E8D: $21 $10 $C2
    add  hl, bc                                   ; $6E90: $09
    ld   [hl], a                                  ; $6E91: $77
    pop  af                                       ; $6E92: $F1
    ld   hl, wEntity0PosX                         ; $6E93: $21 $00 $C2
    add  hl, bc                                   ; $6E96: $09
    ld   [hl], a                                  ; $6E97: $77
    call label_3D8A                               ; $6E98: $CD $8A $3D
    call IsEntityFrameCounterZero                 ; $6E9B: $CD $05 $0C
    jp   z, IncrementEntityWalkingAttr            ; $6E9E: $CA $12 $3B

    cp   $98                                      ; $6EA1: $FE $98
    jr   z, jr_005_6EB0                           ; $6EA3: $28 $0B

    cp   $68                                      ; $6EA5: $FE $68
    jr   z, jr_005_6EB0                           ; $6EA7: $28 $07

    cp   $38                                      ; $6EA9: $FE $38
    jr   z, jr_005_6EB0                           ; $6EAB: $28 $03

    cp   $08                                      ; $6EAD: $FE $08
    ret  nz                                       ; $6EAF: $C0

jr_005_6EB0:
    ld   hl, $C3D0                                ; $6EB0: $21 $D0 $C3
    add  hl, bc                                   ; $6EB3: $09
    ld   a, [hl]                                  ; $6EB4: $7E
    cp   $04                                      ; $6EB5: $FE $04
    ret  z                                        ; $6EB7: $C8

    inc  [hl]                                     ; $6EB8: $34
    ld   e, a                                     ; $6EB9: $5F
    ld   d, b                                     ; $6EBA: $50
    ld   hl, $6D1A                                ; $6EBB: $21 $1A $6D
    add  hl, de                                   ; $6EBE: $19
    ld   a, [hl]                                  ; $6EBF: $7E
    ldh  [hSwordIntersectedAreaX], a              ; $6EC0: $E0 $CE
    ld   hl, $6D1E                                ; $6EC2: $21 $1E $6D
    add  hl, de                                   ; $6EC5: $19
    ld   a, [hl]                                  ; $6EC6: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $6EC7: $E0 $CD
    sla  e                                        ; $6EC9: $CB $23
    sla  e                                        ; $6ECB: $CB $23
    sla  e                                        ; $6ECD: $CB $23
    ld   hl, $6D22                                ; $6ECF: $21 $22 $6D
    add  hl, de                                   ; $6ED2: $19
    push hl                                       ; $6ED3: $E5
    call label_2887                               ; $6ED4: $CD $87 $28
    ld   a, [wRequests]                           ; $6ED7: $FA $00 $D6
    ld   e, a                                     ; $6EDA: $5F
    ld   d, $00                                   ; $6EDB: $16 $00
    ld   hl, wRequestDestinationHigh              ; $6EDD: $21 $01 $D6
    add  hl, de                                   ; $6EE0: $19
    add  $0E                                      ; $6EE1: $C6 $0E
    ld   [wRequests], a                           ; $6EE3: $EA $00 $D6
    pop  de                                       ; $6EE6: $D1
    ldh  a, [$FFCF]                               ; $6EE7: $F0 $CF
    ld   [hl+], a                                 ; $6EE9: $22
    ldh  a, [$FFD0]                               ; $6EEA: $F0 $D0
    ld   [hl+], a                                 ; $6EEC: $22
    ld   a, $03                                   ; $6EED: $3E $03
    ld   [hl+], a                                 ; $6EEF: $22
    ld   a, [de]                                  ; $6EF0: $1A
    inc  de                                       ; $6EF1: $13
    ld   [hl+], a                                 ; $6EF2: $22
    ld   a, [de]                                  ; $6EF3: $1A
    inc  de                                       ; $6EF4: $13
    ld   [hl+], a                                 ; $6EF5: $22
    ld   a, [de]                                  ; $6EF6: $1A
    inc  de                                       ; $6EF7: $13
    ld   [hl+], a                                 ; $6EF8: $22
    ld   a, [de]                                  ; $6EF9: $1A
    inc  de                                       ; $6EFA: $13
    ld   [hl+], a                                 ; $6EFB: $22
    ldh  a, [$FFCF]                               ; $6EFC: $F0 $CF
    ld   [hl+], a                                 ; $6EFE: $22
    ldh  a, [$FFD0]                               ; $6EFF: $F0 $D0
    add  $20                                      ; $6F01: $C6 $20
    ld   [hl+], a                                 ; $6F03: $22
    ld   a, $03                                   ; $6F04: $3E $03
    ld   [hl+], a                                 ; $6F06: $22
    ld   a, [de]                                  ; $6F07: $1A
    inc  de                                       ; $6F08: $13
    ld   [hl+], a                                 ; $6F09: $22
    ld   a, [de]                                  ; $6F0A: $1A
    inc  de                                       ; $6F0B: $13
    ld   [hl+], a                                 ; $6F0C: $22
    ld   a, [de]                                  ; $6F0D: $1A
    inc  de                                       ; $6F0E: $13
    ld   [hl+], a                                 ; $6F0F: $22
    ld   a, [de]                                  ; $6F10: $1A
    ld   [hl+], a                                 ; $6F11: $22
    xor  a                                        ; $6F12: $AF
    ld   [hl], a                                  ; $6F13: $77
    ld   a, $D5                                   ; $6F14: $3E $D5
    ld   [$D713], a                               ; $6F16: $EA $13 $D7
    ld   [$D717], a                               ; $6F19: $EA $17 $D7
    ld   a, $D6                                   ; $6F1C: $3E $D6
    ld   [$D714], a                               ; $6F1E: $EA $14 $D7
    ld   [$D718], a                               ; $6F21: $EA $18 $D7
    ld   a, $D7                                   ; $6F24: $3E $D7
    ld   [$D783], a                               ; $6F26: $EA $83 $D7
    ld   [$D787], a                               ; $6F29: $EA $87 $D7
    ld   a, $D8                                   ; $6F2C: $3E $D8
    ld   [$D784], a                               ; $6F2E: $EA $84 $D7
    ld   [$D788], a                               ; $6F31: $EA $88 $D7
    ld   a, $5D                                   ; $6F34: $3E $5D
    call label_3B86                               ; $6F36: $CD $86 $3B
    ld   hl, wEntitiesUnknownTableB               ; $6F39: $21 $B0 $C2
    add  hl, de                                   ; $6F3C: $19
    ld   [hl], $01                                ; $6F3D: $36 $01
    ld   hl, wEntity0PosX                         ; $6F3F: $21 $00 $C2
    add  hl, de                                   ; $6F42: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $6F43: $F0 $CE
    add  $10                                      ; $6F45: $C6 $10
    ld   [hl], a                                  ; $6F47: $77
    ld   hl, wEntity0PosX                         ; $6F48: $21 $00 $C2
    add  hl, bc                                   ; $6F4B: $09
    ld   [hl], a                                  ; $6F4C: $77
    ld   hl, wEntity0PosY                         ; $6F4D: $21 $10 $C2
    add  hl, de                                   ; $6F50: $19
    ldh  a, [hSwordIntersectedAreaY]              ; $6F51: $F0 $CD
    add  $10                                      ; $6F53: $C6 $10
    ld   [hl], a                                  ; $6F55: $77
    ld   hl, wEntity0PosY                         ; $6F56: $21 $10 $C2
    add  hl, bc                                   ; $6F59: $09
    add  $08                                      ; $6F5A: $C6 $08
    ld   [hl], a                                  ; $6F5C: $77
    ld   hl, wEntitiesFrameCounterTable           ; $6F5D: $21 $E0 $C2
    add  hl, de                                   ; $6F60: $19
    ld   [hl], $2F                                ; $6F61: $36 $2F
    ld   hl, $C3D0                                ; $6F63: $21 $D0 $C3
    add  hl, bc                                   ; $6F66: $09
    ld   a, [hl]                                  ; $6F67: $7E
    cp   $03                                      ; $6F68: $FE $03
    ld   a, $00                                   ; $6F6A: $3E $00
    jr   c, jr_005_6F78                           ; $6F6C: $38 $0A

    ld   hl, wEntity0PosY                         ; $6F6E: $21 $10 $C2
    add  hl, bc                                   ; $6F71: $09
    ld   a, [hl]                                  ; $6F72: $7E
    sub  $08                                      ; $6F73: $D6 $08
    ld   [hl], a                                  ; $6F75: $77
    ld   a, $01                                   ; $6F76: $3E $01

jr_005_6F78:
    ld   hl, $C380                                ; $6F78: $21 $80 $C3
    add  hl, de                                   ; $6F7B: $19
    ld   [hl], a                                  ; $6F7C: $77
    call label_3E34                               ; $6F7D: $CD $34 $3E
    ld   hl, wEntity0Type                         ; $6F80: $21 $80 $C2
    add  hl, bc                                   ; $6F83: $09
    ld   [hl], $05                                ; $6F84: $36 $05
    jp   label_C4B                                ; $6F86: $C3 $4B $0C

    ret  nc                                       ; $6F89: $D0

    pop  de                                       ; $6F8A: $D1
    call nc, $DFD9                                ; $6F8B: $D4 $D9 $DF
    and  $EE                                      ; $6F8E: $E6 $EE
    rst  $30                                      ; $6F90: $F7
    nop                                           ; $6F91: $00
    add  hl, bc                                   ; $6F92: $09
    ld   [de], a                                  ; $6F93: $12
    ld   a, [de]                                  ; $6F94: $1A
    ld   hl, $2C27                                ; $6F95: $21 $27 $2C
    cpl                                           ; $6F98: $2F
    jr   nc, jr_005_6FCA                          ; $6F99: $30 $2F

    inc  l                                        ; $6F9B: $2C
    daa                                           ; $6F9C: $27
    ld   hl, $121A                                ; $6F9D: $21 $1A $12
    add  hl, bc                                   ; $6FA0: $09
    nop                                           ; $6FA1: $00
    rst  $30                                      ; $6FA2: $F7
    xor  $E6                                      ; $6FA3: $EE $E6
    rst  $18                                      ; $6FA5: $DF
    reti                                          ; $6FA6: $D9

    call nc, $D0D1                                ; $6FA7: $D4 $D1 $D0
    pop  de                                       ; $6FAA: $D1
    call nc, $DFD9                                ; $6FAB: $D4 $D9 $DF
    and  $EE                                      ; $6FAE: $E6 $EE
    rst  $30                                      ; $6FB0: $F7
    jp   c, $DDDB                                 ; $6FB1: $DA $DB $DD

    pop  hl                                       ; $6FB4: $E1
    and  $EB                                      ; $6FB5: $E6 $EB
    ld   a, [c]                                   ; $6FB7: $F2
    ld   sp, hl                                   ; $6FB8: $F9
    nop                                           ; $6FB9: $00
    rlca                                          ; $6FBA: $07
    ld   c, $15                                   ; $6FBB: $0E $15
    ld   a, [de]                                  ; $6FBD: $1A
    rra                                           ; $6FBE: $1F
    inc  hl                                       ; $6FBF: $23
    dec  h                                        ; $6FC0: $25
    ld   h, $25                                   ; $6FC1: $26 $25
    inc  hl                                       ; $6FC3: $23
    rra                                           ; $6FC4: $1F
    ld   a, [de]                                  ; $6FC5: $1A
    dec  d                                        ; $6FC6: $15
    ld   c, $07                                   ; $6FC7: $0E $07
    nop                                           ; $6FC9: $00

jr_005_6FCA:
    ld   sp, hl                                   ; $6FCA: $F9
    ld   a, [c]                                   ; $6FCB: $F2
    db   $EB                                      ; $6FCC: $EB
    and  $E1                                      ; $6FCD: $E6 $E1
    db   $DD                                      ; $6FCF: $DD
    db   $DB                                      ; $6FD0: $DB
    jp   c, $DDDB                                 ; $6FD1: $DA $DB $DD

    pop  hl                                       ; $6FD4: $E1
    and  $EB                                      ; $6FD5: $E6 $EB
    ld   a, [c]                                   ; $6FD7: $F2
    ld   sp, hl                                   ; $6FD8: $F9
    db   $E4                                      ; $6FD9: $E4
    push hl                                       ; $6FDA: $E5
    rst  $20                                      ; $6FDB: $E7
    jp   hl                                       ; $6FDC: $E9

    db   $ED                                      ; $6FDD: $ED
    pop  af                                       ; $6FDE: $F1
    or   $FB                                      ; $6FDF: $F6 $FB
    nop                                           ; $6FE1: $00
    dec  b                                        ; $6FE2: $05
    ld   a, [bc]                                  ; $6FE3: $0A
    rrca                                          ; $6FE4: $0F
    inc  de                                       ; $6FE5: $13
    rla                                           ; $6FE6: $17
    add  hl, de                                   ; $6FE7: $19
    dec  de                                       ; $6FE8: $1B
    inc  e                                        ; $6FE9: $1C
    dec  de                                       ; $6FEA: $1B
    add  hl, de                                   ; $6FEB: $19
    rla                                           ; $6FEC: $17
    inc  de                                       ; $6FED: $13
    rrca                                          ; $6FEE: $0F
    ld   a, [bc]                                  ; $6FEF: $0A
    dec  b                                        ; $6FF0: $05
    nop                                           ; $6FF1: $00
    ei                                            ; $6FF2: $FB
    or   $F1                                      ; $6FF3: $F6 $F1
    db   $ED                                      ; $6FF5: $ED
    jp   hl                                       ; $6FF6: $E9

    rst  $20                                      ; $6FF7: $E7
    push hl                                       ; $6FF8: $E5
    db   $E4                                      ; $6FF9: $E4
    push hl                                       ; $6FFA: $E5
    rst  $20                                      ; $6FFB: $E7
    jp   hl                                       ; $6FFC: $E9

    db   $ED                                      ; $6FFD: $ED
    pop  af                                       ; $6FFE: $F1
    or   $FB                                      ; $6FFF: $F6 $FB
    xor  $EF                                      ; $7001: $EE $EF
    ldh  a, [hJingle]                             ; $7003: $F0 $F2
    db   $F4                                      ; $7005: $F4
    or   $FA                                      ; $7006: $F6 $FA
    db   $FD                                      ; $7008: $FD
    nop                                           ; $7009: $00
    inc  bc                                       ; $700A: $03
    ld   b, $0A                                   ; $700B: $06 $0A
    inc  c                                        ; $700D: $0C
    ld   c, $10                                   ; $700E: $0E $10
    ld   de, $1112                                ; $7010: $11 $12 $11
    db   $10                                      ; $7013: $10
    ld   c, $0C                                   ; $7014: $0E $0C
    ld   a, [bc]                                  ; $7016: $0A
    ld   b, $03                                   ; $7017: $06 $03
    nop                                           ; $7019: $00
    db   $FD                                      ; $701A: $FD
    ld   a, [$F4F6]                               ; $701B: $FA $F6 $F4
    ld   a, [c]                                   ; $701E: $F2
    ldh  a, [$FFEF]                               ; $701F: $F0 $EF
    xor  $EF                                      ; $7021: $EE $EF
    ldh  a, [hJingle]                             ; $7023: $F0 $F2
    db   $F4                                      ; $7025: $F4
    or   $FA                                      ; $7026: $F6 $FA
    db   $FD                                      ; $7028: $FD
    ld   hl, sp-$07                               ; $7029: $F8 $F9
    ld   a, [$FBFB]                               ; $702B: $FA $FB $FB
    db   $FC                                      ; $702E: $FC
    db   $FD                                      ; $702F: $FD
    rst  $38                                      ; $7030: $FF
    nop                                           ; $7031: $00
    ld   bc, $0403                                ; $7032: $01 $03 $04
    dec  b                                        ; $7035: $05
    dec  b                                        ; $7036: $05
    ld   b, $07                                   ; $7037: $06 $07
    ld   [$0607], sp                              ; $7039: $08 $07 $06
    dec  b                                        ; $703C: $05
    dec  b                                        ; $703D: $05
    inc  b                                        ; $703E: $04
    inc  bc                                       ; $703F: $03
    ld   bc, $FF00                                ; $7040: $01 $00 $FF
    db   $FD                                      ; $7043: $FD
    db   $FC                                      ; $7044: $FC
    ei                                            ; $7045: $FB
    ei                                            ; $7046: $FB
    ld   a, [$F8F9]                               ; $7047: $FA $F9 $F8
    ld   sp, hl                                   ; $704A: $F9
    ld   a, [$FBFB]                               ; $704B: $FA $FB $FB
    db   $FC                                      ; $704E: $FC
    db   $FD                                      ; $704F: $FD
    rst  $38                                      ; $7050: $FF
    nop                                           ; $7051: $00
    nop                                           ; $7052: $00
    ld   bc, $0302                                ; $7053: $01 $02 $03
    inc  b                                        ; $7056: $04
    inc  b                                        ; $7057: $04
    inc  b                                        ; $7058: $04
    inc  b                                        ; $7059: $04
    inc  b                                        ; $705A: $04
    inc  b                                        ; $705B: $04
    inc  bc                                       ; $705C: $03
    ld   [bc], a                                  ; $705D: $02
    ld   bc, $0000                                ; $705E: $01 $00 $00
    nop                                           ; $7061: $00
    nop                                           ; $7062: $00
    rst  $38                                      ; $7063: $FF
    cp   $FD                                      ; $7064: $FE $FD
    db   $FC                                      ; $7066: $FC
    db   $FC                                      ; $7067: $FC
    db   $FC                                      ; $7068: $FC
    db   $FC                                      ; $7069: $FC
    db   $FC                                      ; $706A: $FC
    db   $FC                                      ; $706B: $FC
    db   $FD                                      ; $706C: $FD
    cp   $FF                                      ; $706D: $FE $FF
    nop                                           ; $706F: $00
    nop                                           ; $7070: $00
    nop                                           ; $7071: $00
    nop                                           ; $7072: $00
    ld   bc, $0201                                ; $7073: $01 $01 $02
    ld   [bc], a                                  ; $7076: $02
    inc  bc                                       ; $7077: $03
    inc  bc                                       ; $7078: $03
    inc  bc                                       ; $7079: $03
    inc  bc                                       ; $707A: $03
    inc  bc                                       ; $707B: $03
    ld   [bc], a                                  ; $707C: $02
    ld   [bc], a                                  ; $707D: $02
    ld   bc, $0001                                ; $707E: $01 $01 $00
    nop                                           ; $7081: $00
    nop                                           ; $7082: $00
    rst  $38                                      ; $7083: $FF
    rst  $38                                      ; $7084: $FF
    cp   $FE                                      ; $7085: $FE $FE
    db   $FD                                      ; $7087: $FD
    db   $FD                                      ; $7088: $FD
    db   $FD                                      ; $7089: $FD
    db   $FD                                      ; $708A: $FD
    db   $FD                                      ; $708B: $FD
    cp   $FE                                      ; $708C: $FE $FE
    rst  $38                                      ; $708E: $FF
    rst  $38                                      ; $708F: $FF
    nop                                           ; $7090: $00
    nop                                           ; $7091: $00
    nop                                           ; $7092: $00
    ld   bc, $0101                                ; $7093: $01 $01 $01
    ld   [bc], a                                  ; $7096: $02
    ld   [bc], a                                  ; $7097: $02
    ld   [bc], a                                  ; $7098: $02
    ld   [bc], a                                  ; $7099: $02
    ld   [bc], a                                  ; $709A: $02
    ld   [bc], a                                  ; $709B: $02
    ld   [bc], a                                  ; $709C: $02
    ld   bc, $0101                                ; $709D: $01 $01 $01
    nop                                           ; $70A0: $00
    nop                                           ; $70A1: $00
    nop                                           ; $70A2: $00
    rst  $38                                      ; $70A3: $FF
    rst  $38                                      ; $70A4: $FF
    rst  $38                                      ; $70A5: $FF
    cp   $FE                                      ; $70A6: $FE $FE
    cp   $FE                                      ; $70A8: $FE $FE
    cp   $FE                                      ; $70AA: $FE $FE
    cp   $FF                                      ; $70AC: $FE $FF
    rst  $38                                      ; $70AE: $FF
    rst  $38                                      ; $70AF: $FF
    nop                                           ; $70B0: $00
    nop                                           ; $70B1: $00
    nop                                           ; $70B2: $00
    ld   bc, $0101                                ; $70B3: $01 $01 $01
    ld   bc, $0101                                ; $70B6: $01 $01 $01
    ld   bc, $0101                                ; $70B9: $01 $01 $01
    ld   bc, $0101                                ; $70BC: $01 $01 $01
    nop                                           ; $70BF: $00
    nop                                           ; $70C0: $00
    nop                                           ; $70C1: $00
    nop                                           ; $70C2: $00
    rst  $38                                      ; $70C3: $FF
    rst  $38                                      ; $70C4: $FF
    rst  $38                                      ; $70C5: $FF
    rst  $38                                      ; $70C6: $FF
    rst  $38                                      ; $70C7: $FF
    rst  $38                                      ; $70C8: $FF
    rst  $38                                      ; $70C9: $FF
    rst  $38                                      ; $70CA: $FF
    rst  $38                                      ; $70CB: $FF
    rst  $38                                      ; $70CC: $FF
    rst  $38                                      ; $70CD: $FF
    rst  $38                                      ; $70CE: $FF
    nop                                           ; $70CF: $00
    nop                                           ; $70D0: $00
    add  hl, hl                                   ; $70D1: $29
    ld   [hl], b                                  ; $70D2: $70
    ld   bc, $D970                                ; $70D3: $01 $70 $D9
    ld   l, a                                     ; $70D6: $6F
    or   c                                        ; $70D7: $B1
    ld   l, a                                     ; $70D8: $6F
    adc  c                                        ; $70D9: $89
    ld   l, a                                     ; $70DA: $6F
    inc  b                                        ; $70DB: $04
    inc  bc                                       ; $70DC: $03
    ld   [bc], a                                  ; $70DD: $02
    ld   bc, $7030                                ; $70DE: $01 $30 $70
    jr   nc, @+$72                                ; $70E1: $30 $70

    db   $10                                      ; $70E3: $10
    db   $10                                      ; $70E4: $10
    add  b                                        ; $70E5: $80
    add  b                                        ; $70E6: $80
    nop                                           ; $70E7: $00
    nop                                           ; $70E8: $00
    ld   bc, $CD01                                ; $70E9: $01 $01 $CD
    ei                                            ; $70EC: $FB
    dec  bc                                       ; $70ED: $0B
    ld   a, [$D200]                               ; $70EE: $FA $00 $D2
    and  a                                        ; $70F1: $A7
    jr   z, jr_005_70F6                           ; $70F2: $28 $02

    ld   [hl], $20                                ; $70F4: $36 $20

jr_005_70F6:
    ld   a, [hl]                                  ; $70F6: $7E
    and  a                                        ; $70F7: $A7
    jr   nz, jr_005_7151                          ; $70F8: $20 $57

    ld   [hl], $2C                                ; $70FA: $36 $2C
    ld   a, $5D                                   ; $70FC: $3E $5D
    call label_3B86                               ; $70FE: $CD $86 $3B
    jr   c, jr_005_7151                           ; $7101: $38 $4E

    ld   hl, $C360                                ; $7103: $21 $60 $C3
    add  hl, de                                   ; $7106: $19
    ld   [hl], $FF                                ; $7107: $36 $FF
    ld   hl, wEntitiesUnknownTableG               ; $7109: $21 $B0 $C3
    add  hl, de                                   ; $710C: $19
    ld   [hl], $FF                                ; $710D: $36 $FF
    ld   hl, wEntitiesUnknownTableB               ; $710F: $21 $B0 $C2
    add  hl, de                                   ; $7112: $19
    ld   [hl], $01                                ; $7113: $36 $01
    ld   hl, wEntitiesWalkingTable                ; $7115: $21 $90 $C2
    add  hl, de                                   ; $7118: $19
    ld   [hl], $01                                ; $7119: $36 $01
    push bc                                       ; $711B: $C5
    call GetRandomByte                            ; $711C: $CD $0D $28
    and  $03                                      ; $711F: $E6 $03
    ld   c, a                                     ; $7121: $4F
    ld   hl, $70DF                                ; $7122: $21 $DF $70
    add  hl, bc                                   ; $7125: $09
    ld   a, [hl]                                  ; $7126: $7E
    ld   hl, wEntity0PosX                         ; $7127: $21 $00 $C2
    add  hl, de                                   ; $712A: $19
    ld   [hl], a                                  ; $712B: $77
    ld   hl, wEntitiesUnknownTableC               ; $712C: $21 $C0 $C2
    add  hl, de                                   ; $712F: $19
    ld   [hl], a                                  ; $7130: $77
    ld   hl, $70E3                                ; $7131: $21 $E3 $70
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    ld   hl, wEntity0PosY                         ; $7136: $21 $10 $C2
    add  hl, de                                   ; $7139: $19
    ld   [hl], a                                  ; $713A: $77
    ld   hl, wEntitiesUnknownTableD               ; $713B: $21 $D0 $C2
    add  hl, de                                   ; $713E: $19
    ld   [hl], a                                  ; $713F: $77
    ld   hl, wEntitiesFrameCounterTable           ; $7140: $21 $E0 $C2
    add  hl, de                                   ; $7143: $19
    ld   [hl], $5F                                ; $7144: $36 $5F
    ld   hl, $70E7                                ; $7146: $21 $E7 $70
    add  hl, bc                                   ; $7149: $09
    ld   a, [hl]                                  ; $714A: $7E
    ld   hl, $C380                                ; $714B: $21 $80 $C3
    add  hl, de                                   ; $714E: $19
    ld   [hl], a                                  ; $714F: $77
    pop  bc                                       ; $7150: $C1

jr_005_7151:
    call label_C00                                ; $7151: $CD $00 $0C
    jr   z, jr_005_7167                           ; $7154: $28 $11

    rra                                           ; $7156: $1F
    rra                                           ; $7157: $1F
    rra                                           ; $7158: $1F
    and  $03                                      ; $7159: $E6 $03
    ld   e, a                                     ; $715B: $5F
    ld   d, b                                     ; $715C: $50
    ld   hl, $70DB                                ; $715D: $21 $DB $70
    add  hl, de                                   ; $7160: $19
    ld   a, [hl]                                  ; $7161: $7E
    ld   hl, wEntitiesUnknownTableD               ; $7162: $21 $D0 $C2
    add  hl, bc                                   ; $7165: $09
    ld   [hl], a                                  ; $7166: $77

jr_005_7167:
    ld   hl, $C440                                ; $7167: $21 $40 $C4
    add  hl, bc                                   ; $716A: $09
    ld   a, [hl]                                  ; $716B: $7E
    and  $07                                      ; $716C: $E6 $07
    ld   hl, $D200                                ; $716E: $21 $00 $D2
    or   [hl]                                     ; $7171: $B6
    jr   nz, jr_005_7188                          ; $7172: $20 $14

    ldh  a, [hActiveEntityWalking]                ; $7174: $F0 $F0
    cp   $03                                      ; $7176: $FE $03
    jr   nz, jr_005_7188                          ; $7178: $20 $0E

    ld   hl, $C390                                ; $717A: $21 $90 $C3
    add  hl, bc                                   ; $717D: $09
    ld   e, [hl]                                  ; $717E: $5E
    ld   hl, wEntitiesUnknownTableC               ; $717F: $21 $C0 $C2
    add  hl, bc                                   ; $7182: $09
    ld   a, [hl]                                  ; $7183: $7E
    add  e                                        ; $7184: $83
    and  $1F                                      ; $7185: $E6 $1F
    ld   [hl], a                                  ; $7187: $77

jr_005_7188:
    ld   a, [$D200]                               ; $7188: $FA $00 $D2
    and  a                                        ; $718B: $A7
    ld   a, $00                                   ; $718C: $3E $00
    jr   nz, jr_005_719A                          ; $718E: $20 $0A

    ld   hl, $C440                                ; $7190: $21 $40 $C4
    add  hl, bc                                   ; $7193: $09
    inc  [hl]                                     ; $7194: $34
    ld   a, [hl]                                  ; $7195: $7E
    rra                                           ; $7196: $1F
    rra                                           ; $7197: $1F
    and  $1F                                      ; $7198: $E6 $1F

jr_005_719A:
    ldh  [hFFE8], a                               ; $719A: $E0 $E8
    ld   hl, wEntity0PosX                         ; $719C: $21 $00 $C2
    add  hl, bc                                   ; $719F: $09
    ld   [hl], $50                                ; $71A0: $36 $50
    ld   hl, wEntity0PosY                         ; $71A2: $21 $10 $C2
    add  hl, bc                                   ; $71A5: $09
    ld   [hl], $48                                ; $71A6: $36 $48
    ldh  a, [hFFE8]                               ; $71A8: $F0 $E8
    ld   e, a                                     ; $71AA: $5F
    ld   d, b                                     ; $71AB: $50
    ld   hl, $7051                                ; $71AC: $21 $51 $70
    add  hl, de                                   ; $71AF: $19
    ld   a, [hl]                                  ; $71B0: $7E
    ld   hl, wEntitiesUnknownTableC               ; $71B1: $21 $C0 $C2
    add  hl, bc                                   ; $71B4: $09
    add  [hl]                                     ; $71B5: $86
    and  $1F                                      ; $71B6: $E6 $1F
    ld   e, a                                     ; $71B8: $5F
    ld   d, b                                     ; $71B9: $50
    push de                                       ; $71BA: $D5
    ld   hl, wEntitiesUnknownTableD               ; $71BB: $21 $D0 $C2
    add  hl, bc                                   ; $71BE: $09
    ld   e, [hl]                                  ; $71BF: $5E
    sla  e                                        ; $71C0: $CB $23
    ld   d, b                                     ; $71C2: $50
    ld   hl, $70D1                                ; $71C3: $21 $D1 $70
    add  hl, de                                   ; $71C6: $19
    ld   a, [hl+]                                 ; $71C7: $2A
    ld   h, [hl]                                  ; $71C8: $66
    ld   l, a                                     ; $71C9: $6F
    pop  de                                       ; $71CA: $D1
    ld   a, $02                                   ; $71CB: $3E $02
    call func_005_7283                            ; $71CD: $CD $83 $72
    ldh  a, [hFFE8]                               ; $71D0: $F0 $E8
    ld   e, a                                     ; $71D2: $5F
    ld   d, b                                     ; $71D3: $50
    ld   hl, $7071                                ; $71D4: $21 $71 $70
    add  hl, de                                   ; $71D7: $19
    ld   a, [hl]                                  ; $71D8: $7E
    ld   hl, wEntitiesUnknownTableC               ; $71D9: $21 $C0 $C2
    add  hl, bc                                   ; $71DC: $09
    add  [hl]                                     ; $71DD: $86
    and  $1F                                      ; $71DE: $E6 $1F
    ld   e, a                                     ; $71E0: $5F
    ld   d, b                                     ; $71E1: $50
    push de                                       ; $71E2: $D5
    ld   hl, wEntitiesUnknownTableD               ; $71E3: $21 $D0 $C2
    add  hl, bc                                   ; $71E6: $09
    ld   e, [hl]                                  ; $71E7: $5E
    dec  e                                        ; $71E8: $1D
    ld   a, e                                     ; $71E9: $7B
    cp   $F0                                      ; $71EA: $FE $F0
    jp   nc, label_005_72CA                       ; $71EC: $D2 $CA $72

    sla  e                                        ; $71EF: $CB $23
    ld   d, b                                     ; $71F1: $50
    ld   hl, $70D1                                ; $71F2: $21 $D1 $70
    add  hl, de                                   ; $71F5: $19
    ld   a, [hl+]                                 ; $71F6: $2A
    ld   h, [hl]                                  ; $71F7: $66
    ld   l, a                                     ; $71F8: $6F
    pop  de                                       ; $71F9: $D1
    ld   a, $01                                   ; $71FA: $3E $01
    call func_005_7283                            ; $71FC: $CD $83 $72
    ldh  a, [hFFE8]                               ; $71FF: $F0 $E8
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, $7091                                ; $7203: $21 $91 $70
    add  hl, de                                   ; $7206: $19
    ld   a, [hl]                                  ; $7207: $7E
    ld   hl, wEntitiesUnknownTableC               ; $7208: $21 $C0 $C2
    add  hl, bc                                   ; $720B: $09
    add  [hl]                                     ; $720C: $86
    and  $1F                                      ; $720D: $E6 $1F
    ld   e, a                                     ; $720F: $5F
    ld   d, b                                     ; $7210: $50
    push de                                       ; $7211: $D5
    ld   hl, wEntitiesUnknownTableD               ; $7212: $21 $D0 $C2
    add  hl, bc                                   ; $7215: $09
    ld   e, [hl]                                  ; $7216: $5E
    dec  e                                        ; $7217: $1D
    dec  e                                        ; $7218: $1D
    ld   a, e                                     ; $7219: $7B
    cp   $F0                                      ; $721A: $FE $F0
    jp   nc, label_005_72CA                       ; $721C: $D2 $CA $72

    sla  e                                        ; $721F: $CB $23
    ld   d, b                                     ; $7221: $50
    ld   hl, $70D1                                ; $7222: $21 $D1 $70
    add  hl, de                                   ; $7225: $19
    ld   a, [hl+]                                 ; $7226: $2A
    ld   h, [hl]                                  ; $7227: $66
    ld   l, a                                     ; $7228: $6F
    pop  de                                       ; $7229: $D1
    ld   a, $01                                   ; $722A: $3E $01
    call func_005_7283                            ; $722C: $CD $83 $72
    ldh  a, [hFFE8]                               ; $722F: $F0 $E8
    ld   e, a                                     ; $7231: $5F
    ld   d, b                                     ; $7232: $50
    ld   hl, $70B1                                ; $7233: $21 $B1 $70
    add  hl, de                                   ; $7236: $19
    ld   a, [hl]                                  ; $7237: $7E
    ld   hl, wEntitiesUnknownTableC               ; $7238: $21 $C0 $C2
    add  hl, bc                                   ; $723B: $09
    add  [hl]                                     ; $723C: $86
    and  $1F                                      ; $723D: $E6 $1F
    ld   e, a                                     ; $723F: $5F
    ld   d, b                                     ; $7240: $50
    push de                                       ; $7241: $D5
    ld   hl, wEntitiesUnknownTableD               ; $7242: $21 $D0 $C2
    add  hl, bc                                   ; $7245: $09
    ld   e, [hl]                                  ; $7246: $5E
    dec  e                                        ; $7247: $1D
    dec  e                                        ; $7248: $1D
    dec  e                                        ; $7249: $1D
    ld   a, e                                     ; $724A: $7B
    cp   $F0                                      ; $724B: $FE $F0
    jp   nc, label_005_72CA                       ; $724D: $D2 $CA $72

    sla  e                                        ; $7250: $CB $23
    ld   d, b                                     ; $7252: $50
    ld   hl, $70D1                                ; $7253: $21 $D1 $70
    add  hl, de                                   ; $7256: $19
    ld   a, [hl+]                                 ; $7257: $2A
    ld   h, [hl]                                  ; $7258: $66
    ld   l, a                                     ; $7259: $6F
    pop  de                                       ; $725A: $D1
    ld   a, $01                                   ; $725B: $3E $01
    call func_005_7283                            ; $725D: $CD $83 $72
    ld   hl, wEntitiesUnknownTableC               ; $7260: $21 $C0 $C2
    add  hl, bc                                   ; $7263: $09
    ld   e, [hl]                                  ; $7264: $5E
    ld   d, b                                     ; $7265: $50
    push de                                       ; $7266: $D5
    ld   hl, wEntitiesUnknownTableD               ; $7267: $21 $D0 $C2
    add  hl, bc                                   ; $726A: $09
    ld   e, [hl]                                  ; $726B: $5E
    dec  e                                        ; $726C: $1D
    dec  e                                        ; $726D: $1D
    dec  e                                        ; $726E: $1D
    dec  e                                        ; $726F: $1D
    ld   a, e                                     ; $7270: $7B
    cp   $F0                                      ; $7271: $FE $F0
    jp   nc, label_005_72CA                       ; $7273: $D2 $CA $72

    sla  e                                        ; $7276: $CB $23
    ld   d, b                                     ; $7278: $50
    ld   hl, $70D1                                ; $7279: $21 $D1 $70
    add  hl, de                                   ; $727C: $19
    ld   a, [hl+]                                 ; $727D: $2A
    ld   h, [hl]                                  ; $727E: $66
    ld   l, a                                     ; $727F: $6F
    pop  de                                       ; $7280: $D1
    ld   a, $00                                   ; $7281: $3E $00

func_005_7283:
    ldh  [hActiveEntityUnknownG], a               ; $7283: $E0 $F1
    add  hl, de                                   ; $7285: $19
    ld   a, $48                                   ; $7286: $3E $48
    add  [hl]                                     ; $7288: $86
    ldh  [wActiveEntityPosY], a                   ; $7289: $E0 $EC
    ld   a, l                                     ; $728B: $7D
    add  $08                                      ; $728C: $C6 $08
    ld   l, a                                     ; $728E: $6F
    ld   a, h                                     ; $728F: $7C
    adc  $00                                      ; $7290: $CE $00
    ld   h, a                                     ; $7292: $67
    ld   a, $50                                   ; $7293: $3E $50
    add  [hl]                                     ; $7295: $86
    ldh  [wActiveEntityPosX], a                   ; $7296: $E0 $EE
    call $72E0                                    ; $7298: $CD $E0 $72
    ldh  a, [hLinkPositionX]                      ; $729B: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $729D: $21 $EE $FF
    sub  [hl]                                     ; $72A0: $96
    add  $08                                      ; $72A1: $C6 $08
    cp   $10                                      ; $72A3: $FE $10
    jr   nc, jr_005_72C9                          ; $72A5: $30 $22

    ldh  a, [hLinkPositionY]                      ; $72A7: $F0 $99
    ld   hl, wActiveEntityPosY                    ; $72A9: $21 $EC $FF
    sub  [hl]                                     ; $72AC: $96
    add  $08                                      ; $72AD: $C6 $08
    cp   $10                                      ; $72AF: $FE $10
    jr   nc, jr_005_72C9                          ; $72B1: $30 $16

    ld   a, [wLinkMotionState]                    ; $72B3: $FA $1C $C1
    and  a                                        ; $72B6: $A7
    jr   nz, jr_005_72C9                          ; $72B7: $20 $10

    call label_3B18                               ; $72B9: $CD $18 $3B
    ld   a, $18                                   ; $72BC: $3E $18
    call label_3BB5                               ; $72BE: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $72C1: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $72C3: $E0 $9B
    ldh  a, [hScratchB]                           ; $72C5: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $72C7: $E0 $9A

jr_005_72C9:
    ret                                           ; $72C9: $C9

label_005_72CA:
    pop  de                                       ; $72CA: $D1
    ret                                           ; $72CB: $C9

    ld   [hl], b                                  ; $72CC: $70
    rlca                                          ; $72CD: $07
    ld   [hl], b                                  ; $72CE: $70
    daa                                           ; $72CF: $27
    ld   [hl], d                                  ; $72D0: $72
    rlca                                          ; $72D1: $07
    ld   [hl], d                                  ; $72D2: $72
    daa                                           ; $72D3: $27
    ld   [hl], h                                  ; $72D4: $74
    rlca                                          ; $72D5: $07
    ld   [hl], h                                  ; $72D6: $74
    daa                                           ; $72D7: $27
    ld   a, h                                     ; $72D8: $7C
    ld   b, $7C                                   ; $72D9: $06 $7C
    ld   h, $7E                                   ; $72DB: $26 $7E
    ld   b, $7E                                   ; $72DD: $06 $7E
    ld   h, $11                                   ; $72DF: $26 $11
    call z, $C372                                 ; $72E1: $CC $72 $C3
    ret  nz                                       ; $72E4: $C0

    dec  sp                                       ; $72E5: $3B
    call func_005_7982                            ; $72E6: $CD $82 $79
    call func_005_7A3A                            ; $72E9: $CD $3A $7A
    ldh  a, [hActiveEntityWalking]                ; $72EC: $F0 $F0
    rst  $00                                      ; $72EE: $C7
    dec  b                                        ; $72EF: $05
    ld   [hl], e                                  ; $72F0: $73
    ld   h, e                                     ; $72F1: $63
    ld   [hl], e                                  ; $72F2: $73
    dec  h                                        ; $72F3: $25
    ld   [hl], h                                  ; $72F4: $74
    or   c                                        ; $72F5: $B1
    ld   [hl], h                                  ; $72F6: $74
    inc  a                                        ; $72F7: $3C
    ld   [hl], l                                  ; $72F8: $75
    add  hl, bc                                   ; $72F9: $09
    ld   a, [bc]                                  ; $72FA: $0A
    dec  bc                                       ; $72FB: $0B
    dec  bc                                       ; $72FC: $0B
    dec  bc                                       ; $72FD: $0B
    dec  bc                                       ; $72FE: $0B
    inc  c                                        ; $72FF: $0C
    dec  c                                        ; $7300: $0D
    ld   c, $0E                                   ; $7301: $0E $0E
    ld   c, $0E                                   ; $7303: $0E $0E
    call IsEntityFrameCounterZero                 ; $7305: $CD $05 $0C
    jp   z, label_005_7535                        ; $7308: $CA $35 $75

    ld   e, a                                     ; $730B: $5F
    cp   $18                                      ; $730C: $FE $18
    jr   nz, jr_005_7314                          ; $730E: $20 $04

    ld   a, $16                                   ; $7310: $3E $16
    ldh  [hWaveSfx], a                                ; $7312: $E0 $F3

jr_005_7314:
    ld   a, e                                     ; $7314: $7B
    rra                                           ; $7315: $1F
    rra                                           ; $7316: $1F
    rra                                           ; $7317: $1F
    and  $07                                      ; $7318: $E6 $07
    ld   e, a                                     ; $731A: $5F
    ld   d, b                                     ; $731B: $50
    ld   hl, $C380                                ; $731C: $21 $80 $C3
    add  hl, bc                                   ; $731F: $09
    ld   a, [hl]                                  ; $7320: $7E
    and  a                                        ; $7321: $A7
    ld   hl, $72F9                                ; $7322: $21 $F9 $72
    jr   z, jr_005_732A                           ; $7325: $28 $03

    ld   hl, $72FF                                ; $7327: $21 $FF $72

jr_005_732A:
    add  hl, de                                   ; $732A: $19
    ld   a, [hl]                                  ; $732B: $7E
    jp   label_3B0C                               ; $732C: $C3 $0C $3B

    add  hl, bc                                   ; $732F: $09
    add  hl, bc                                   ; $7330: $09
    ld   a, [bc]                                  ; $7331: $0A
    ld   a, [bc]                                  ; $7332: $0A
    dec  bc                                       ; $7333: $0B
    dec  bc                                       ; $7334: $0B
    dec  bc                                       ; $7335: $0B
    dec  bc                                       ; $7336: $0B
    dec  bc                                       ; $7337: $0B
    dec  bc                                       ; $7338: $0B

jr_005_7339:
    dec  bc                                       ; $7339: $0B
    dec  bc                                       ; $733A: $0B
    ld   a, [bc]                                  ; $733B: $0A
    ld   a, [bc]                                  ; $733C: $0A
    add  hl, bc                                   ; $733D: $09
    add  hl, bc                                   ; $733E: $09
    add  hl, bc                                   ; $733F: $09
    add  hl, bc                                   ; $7340: $09
    add  hl, bc                                   ; $7341: $09
    add  hl, bc                                   ; $7342: $09
    add  hl, bc                                   ; $7343: $09
    add  hl, bc                                   ; $7344: $09
    add  hl, bc                                   ; $7345: $09
    add  hl, bc                                   ; $7346: $09
    inc  c                                        ; $7347: $0C
    inc  c                                        ; $7348: $0C
    dec  c                                        ; $7349: $0D
    dec  c                                        ; $734A: $0D
    ld   c, $0E                                   ; $734B: $0E $0E
    ld   c, $0E                                   ; $734D: $0E $0E
    ld   c, $0E                                   ; $734F: $0E $0E
    ld   c, $0E                                   ; $7351: $0E $0E
    dec  c                                        ; $7353: $0D
    dec  c                                        ; $7354: $0D
    inc  c                                        ; $7355: $0C
    inc  c                                        ; $7356: $0C
    inc  c                                        ; $7357: $0C
    inc  c                                        ; $7358: $0C
    inc  c                                        ; $7359: $0C
    inc  c                                        ; $735A: $0C
    inc  c                                        ; $735B: $0C
    inc  c                                        ; $735C: $0C
    inc  c                                        ; $735D: $0C
    inc  c                                        ; $735E: $0C
    jr   jr_005_7339                              ; $735F: $18 $D8

    inc  b                                        ; $7361: $04
    inc  c                                        ; $7362: $0C
    call IsEntityFrameCounterZero                 ; $7363: $CD $05 $0C
    jp   z, label_005_7535                        ; $7366: $CA $35 $75

    ld   e, a                                     ; $7369: $5F
    cp   $20                                      ; $736A: $FE $20
    jr   nz, jr_005_7372                          ; $736C: $20 $04

    ld   a, $16                                   ; $736E: $3E $16
    ldh  [hWaveSfx], a                                ; $7370: $E0 $F3

jr_005_7372:
    ld   a, e                                     ; $7372: $7B
    rra                                           ; $7373: $1F
    rra                                           ; $7374: $1F
    and  $1F                                      ; $7375: $E6 $1F
    ld   e, a                                     ; $7377: $5F
    ld   d, b                                     ; $7378: $50
    ld   hl, $C380                                ; $7379: $21 $80 $C3
    add  hl, bc                                   ; $737C: $09
    ld   a, [hl]                                  ; $737D: $7E
    and  a                                        ; $737E: $A7
    ld   hl, $732F                                ; $737F: $21 $2F $73
    jr   z, jr_005_7387                           ; $7382: $28 $03

    ld   hl, $7347                                ; $7384: $21 $47 $73

jr_005_7387:
    add  hl, de                                   ; $7387: $19
    ld   a, [hl]                                  ; $7388: $7E
    call label_3B0C                               ; $7389: $CD $0C $3B
    cp   $0B                                      ; $738C: $FE $0B
    jr   z, jr_005_7395                           ; $738E: $28 $05

    cp   $0E                                      ; $7390: $FE $0E
    jp   nz, label_005_7424                       ; $7392: $C2 $24 $74

jr_005_7395:
    ldh  a, [hLinkDirection]                      ; $7395: $F0 $9E
    and  $02                                      ; $7397: $E6 $02
    jp   z, label_005_7424                        ; $7399: $CA $24 $74

    ld   a, [$C1A6]                               ; $739C: $FA $A6 $C1
    and  a                                        ; $739F: $A7
    jp   z, label_005_7424                        ; $73A0: $CA $24 $74

    dec  a                                        ; $73A3: $3D
    ld   [$D202], a                               ; $73A4: $EA $02 $D2
    ld   e, a                                     ; $73A7: $5F
    ld   d, b                                     ; $73A8: $50
    ld   hl, wEntity0Type                         ; $73A9: $21 $80 $C2
    add  hl, de                                   ; $73AC: $19
    ld   a, [hl]                                  ; $73AD: $7E
    and  a                                        ; $73AE: $A7
    jr   z, jr_005_7424                           ; $73AF: $28 $73

    ld   hl, $C3A0                                ; $73B1: $21 $A0 $C3
    add  hl, de                                   ; $73B4: $19
    ld   a, [hl]                                  ; $73B5: $7E
    cp   $03                                      ; $73B6: $FE $03
    jr   nz, jr_005_7424                          ; $73B8: $20 $6A

    ld   hl, wEntity0PosX                         ; $73BA: $21 $00 $C2
    add  hl, de                                   ; $73BD: $19
    ldh  a, [wActiveEntityPosX]                   ; $73BE: $F0 $EE
    sub  [hl]                                     ; $73C0: $96
    add  $08                                      ; $73C1: $C6 $08
    cp   $10                                      ; $73C3: $FE $10
    jr   nc, jr_005_7424                          ; $73C5: $30 $5D

    ld   hl, wEntity0PosY                         ; $73C7: $21 $10 $C2
    add  hl, de                                   ; $73CA: $19
    ldh  a, [wActiveEntityPosY]                   ; $73CB: $F0 $EC
    sub  [hl]                                     ; $73CD: $96
    add  $0C                                      ; $73CE: $C6 $0C
    cp   $18                                      ; $73D0: $FE $18
    jr   nc, jr_005_7424                          ; $73D2: $30 $50

    ld   a, [$D203]                               ; $73D4: $FA $03 $D2
    inc  a                                        ; $73D7: $3C
    ld   [$D203], a                               ; $73D8: $EA $03 $D2
    cp   $04                                      ; $73DB: $FE $04
    jr   c, jr_005_7414                           ; $73DD: $38 $35

    call GetRandomByte                            ; $73DF: $CD $0D $28
    and  $01                                      ; $73E2: $E6 $01
    jr   nz, jr_005_7414                          ; $73E4: $20 $2E

    ld   hl, wEntitiesUnknownTableB               ; $73E6: $21 $B0 $C2
    add  hl, bc                                   ; $73E9: $09
    ld   [hl], $02                                ; $73EA: $36 $02
    call label_BFB                                ; $73EC: $CD $FB $0B
    ld   [hl], $30                                ; $73EF: $36 $30
    ld   hl, $C300                                ; $73F1: $21 $00 $C3
    add  hl, bc                                   ; $73F4: $09
    ld   [hl], $20                                ; $73F5: $36 $20
    ld   hl, $C380                                ; $73F7: $21 $80 $C3
    add  hl, bc                                   ; $73FA: $09
    ld   e, [hl]                                  ; $73FB: $5E
    ld   d, b                                     ; $73FC: $50
    ld   hl, $735F                                ; $73FD: $21 $5F $73
    add  hl, de                                   ; $7400: $19
    ld   a, [hl]                                  ; $7401: $7E
    ld   hl, wEntity0SpeedY                       ; $7402: $21 $50 $C2
    add  hl, bc                                   ; $7405: $09
    ld   [hl], a                                  ; $7406: $77
    ld   hl, $7361                                ; $7407: $21 $61 $73
    add  hl, de                                   ; $740A: $19
    ld   a, [hl]                                  ; $740B: $7E
    ld   hl, wEntitiesWalkingTable                ; $740C: $21 $90 $C2
    add  hl, bc                                   ; $740F: $09
    ld   [hl], a                                  ; $7410: $77
    jp   label_005_7777                           ; $7411: $C3 $77 $77

jr_005_7414:
    call IncrementEntityWalkingAttr               ; $7414: $CD $12 $3B
    ld   a, [$D201]                               ; $7417: $FA $01 $D2
    ld   e, a                                     ; $741A: $5F
    ld   d, b                                     ; $741B: $50
    ld   hl, $C390                                ; $741C: $21 $90 $C3
    add  hl, de                                   ; $741F: $19
    ld   a, [hl]                                  ; $7420: $7E
    cpl                                           ; $7421: $2F
    inc  a                                        ; $7422: $3C
    ld   [hl], a                                  ; $7423: $77

label_005_7424:
jr_005_7424:
    ret                                           ; $7424: $C9

    call $79A7                                    ; $7425: $CD $A7 $79
    ld   a, $01                                   ; $7428: $3E $01
    ld   [$D200], a                               ; $742A: $EA $00 $D2
    ld   a, [$D202]                               ; $742D: $FA $02 $D2
    ld   e, a                                     ; $7430: $5F
    ld   d, b                                     ; $7431: $50
    ld   hl, wEntity0Type                         ; $7432: $21 $80 $C2
    add  hl, de                                   ; $7435: $19
    ld   a, [hl]                                  ; $7436: $7E
    and  a                                        ; $7437: $A7
    jr   z, jr_005_7478                           ; $7438: $28 $3E

    ld   a, [$DBC7]                               ; $743A: $FA $C7 $DB
    and  a                                        ; $743D: $A7
    jr   nz, jr_005_7478                          ; $743E: $20 $38

    ld   hl, wEntity0PosY                         ; $7440: $21 $10 $C2
    add  hl, de                                   ; $7443: $19
    ld   a, [hl]                                  ; $7444: $7E
    ld   hl, wEntity0PosY                         ; $7445: $21 $10 $C2
    add  hl, bc                                   ; $7448: $09
    ld   [hl], a                                  ; $7449: $77
    ld   a, [$D201]                               ; $744A: $FA $01 $D2
    ld   e, a                                     ; $744D: $5F
    ld   d, b                                     ; $744E: $50
    ld   hl, wEntitiesUnknownTableD               ; $744F: $21 $D0 $C2
    add  hl, de                                   ; $7452: $19
    ld   a, [hl]                                  ; $7453: $7E
    cp   $00                                      ; $7454: $FE $00
    jr   z, jr_005_745F                           ; $7456: $28 $07

    ldh  a, [hFrameCounter]                       ; $7458: $F0 $E7
    and  $03                                      ; $745A: $E6 $03
    jr   nz, jr_005_745F                          ; $745C: $20 $01

    dec  [hl]                                     ; $745E: $35

jr_005_745F:
    ldh  a, [hFrameCounter]                       ; $745F: $F0 $E7
    and  $07                                      ; $7461: $E6 $07
    jr   nz, jr_005_7469                          ; $7463: $20 $04

    ld   a, $29                                   ; $7465: $3E $29
    ldh  [hJingle], a                             ; $7467: $E0 $F2

jr_005_7469:
    ld   hl, $C380                                ; $7469: $21 $80 $C3
    add  hl, bc                                   ; $746C: $09
    ld   a, [hl]                                  ; $746D: $7E
    and  a                                        ; $746E: $A7
    ld   a, $00                                   ; $746F: $3E $00
    jr   z, jr_005_7475                           ; $7471: $28 $02

    ld   a, $01                                   ; $7473: $3E $01

jr_005_7475:
    jp   label_3B0C                               ; $7475: $C3 $0C $3B

jr_005_7478:
    call IncrementEntityWalkingAttr               ; $7478: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $747B: $CD $05 $0C
    ld   [hl], $5F                                ; $747E: $36 $5F
    ret                                           ; $7480: $C9

    db   $10                                      ; $7481: $10
    db   $10                                      ; $7482: $10
    inc  c                                        ; $7483: $0C
    ld   [$0304], sp                              ; $7484: $08 $04 $03
    ld   [bc], a                                  ; $7487: $02
    ld   bc, $0101                                ; $7488: $01 $01 $01
    ld   bc, $0101                                ; $748B: $01 $01 $01
    ld   bc, $0101                                ; $748E: $01 $01 $01
    ld   bc, $0101                                ; $7491: $01 $01 $01
    ld   bc, $0101                                ; $7494: $01 $01 $01
    ld   bc, $0301                                ; $7497: $01 $01 $03
    rra                                           ; $749A: $1F
    rra                                           ; $749B: $1F
    ccf                                           ; $749C: $3F
    ccf                                           ; $749D: $3F
    ccf                                           ; $749E: $3F
    ccf                                           ; $749F: $3F
    ccf                                           ; $74A0: $3F
    ccf                                           ; $74A1: $3F
    ccf                                           ; $74A2: $3F
    ccf                                           ; $74A3: $3F
    ccf                                           ; $74A4: $3F
    ccf                                           ; $74A5: $3F
    ccf                                           ; $74A6: $3F
    ccf                                           ; $74A7: $3F
    ccf                                           ; $74A8: $3F
    ccf                                           ; $74A9: $3F
    ccf                                           ; $74AA: $3F
    ccf                                           ; $74AB: $3F
    ccf                                           ; $74AC: $3F
    ccf                                           ; $74AD: $3F
    ccf                                           ; $74AE: $3F
    ccf                                           ; $74AF: $3F
    ccf                                           ; $74B0: $3F
    call $79A7                                    ; $74B1: $CD $A7 $79
    ld   a, $01                                   ; $74B4: $3E $01
    ld   [$D200], a                               ; $74B6: $EA $00 $D2
    ld   hl, $C380                                ; $74B9: $21 $80 $C3
    add  hl, bc                                   ; $74BC: $09
    ld   a, [hl]                                  ; $74BD: $7E
    and  a                                        ; $74BE: $A7
    ld   a, $08                                   ; $74BF: $3E $08
    jr   z, jr_005_74C5                           ; $74C1: $28 $02

    ld   a, $0F                                   ; $74C3: $3E $0F

jr_005_74C5:
    call label_3B0C                               ; $74C5: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $74C8: $F0 $98
    push af                                       ; $74CA: $F5
    ld   hl, wEntitiesUnknownTableC               ; $74CB: $21 $C0 $C2
    add  hl, bc                                   ; $74CE: $09
    ld   a, [hl]                                  ; $74CF: $7E
    ldh  [hLinkPositionX], a                      ; $74D0: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $74D2: $F0 $99
    push af                                       ; $74D4: $F5
    ld   hl, wEntitiesUnknownTableD               ; $74D5: $21 $D0 $C2
    add  hl, bc                                   ; $74D8: $09
    ld   a, [hl]                                  ; $74D9: $7E
    ldh  [hLinkPositionY], a                      ; $74DA: $E0 $99
    call IsEntityFrameCounterZero                 ; $74DC: $CD $05 $0C
    rra                                           ; $74DF: $1F
    rra                                           ; $74E0: $1F
    and  $3F                                      ; $74E1: $E6 $3F
    ld   e, a                                     ; $74E3: $5F
    ld   d, b                                     ; $74E4: $50
    ld   hl, $7481                                ; $74E5: $21 $81 $74
    add  hl, de                                   ; $74E8: $19
    ld   a, [hl]                                  ; $74E9: $7E
    call label_3BB5                               ; $74EA: $CD $B5 $3B
    ldh  a, [hScratchB]                           ; $74ED: $F0 $D8
    ld   hl, wEntity0SpeedX                       ; $74EF: $21 $40 $C2
    add  hl, bc                                   ; $74F2: $09
    ld   [hl], a                                  ; $74F3: $77
    ldh  a, [hScratchA]                           ; $74F4: $F0 $D7
    ld   hl, wEntity0SpeedY                       ; $74F6: $21 $50 $C2
    add  hl, bc                                   ; $74F9: $09
    ld   [hl], a                                  ; $74FA: $77
    call func_005_7AB1                            ; $74FB: $CD $B1 $7A
    ldh  a, [hLinkPositionY]                      ; $74FE: $F0 $99
    ld   hl, wActiveEntityPosY                    ; $7500: $21 $EC $FF
    sub  [hl]                                     ; $7503: $96
    add  $03                                      ; $7504: $C6 $03
    cp   $06                                      ; $7506: $FE $06
    jr   nc, jr_005_750D                          ; $7508: $30 $03

    call func_005_7535                            ; $750A: $CD $35 $75

jr_005_750D:
    pop  af                                       ; $750D: $F1
    ldh  [hLinkPositionY], a                      ; $750E: $E0 $99
    pop  af                                       ; $7510: $F1
    ldh  [hLinkPositionX], a                      ; $7511: $E0 $98
    call IsEntityFrameCounterZero                 ; $7513: $CD $05 $0C
    rra                                           ; $7516: $1F
    rra                                           ; $7517: $1F
    and  $3F                                      ; $7518: $E6 $3F
    ld   e, a                                     ; $751A: $5F
    ld   d, b                                     ; $751B: $50
    ld   hl, $7499                                ; $751C: $21 $99 $74
    add  hl, de                                   ; $751F: $19
    ldh  a, [hFrameCounter]                       ; $7520: $F0 $E7
    and  [hl]                                     ; $7522: $A6
    jr   nz, jr_005_7534                          ; $7523: $20 $0F

    ld   a, [$D201]                               ; $7525: $FA $01 $D2
    ld   e, a                                     ; $7528: $5F
    ld   d, b                                     ; $7529: $50
    ld   hl, wEntitiesUnknownTableD               ; $752A: $21 $D0 $C2
    add  hl, de                                   ; $752D: $19
    ld   a, [hl]                                  ; $752E: $7E
    cp   $04                                      ; $752F: $FE $04
    jr   z, jr_005_7534                           ; $7531: $28 $01

    inc  [hl]                                     ; $7533: $34

jr_005_7534:
    ret                                           ; $7534: $C9

func_005_7535:
label_005_7535:
    xor  a                                        ; $7535: $AF
    ld   [$D200], a                               ; $7536: $EA $00 $D2
    jp   label_005_7B4B                           ; $7539: $C3 $4B $7B

    call $79A7                                    ; $753C: $CD $A7 $79
    call IsEntityFrameCounterZero                 ; $753F: $CD $05 $0C
    jp   z, label_005_7585                        ; $7542: $CA $85 $75

    ld   hl, $C420                                ; $7545: $21 $20 $C4
    add  hl, bc                                   ; $7548: $09
    ld   [hl], a                                  ; $7549: $77
    cp   $80                                      ; $754A: $FE $80
    ret  nc                                       ; $754C: $D0

    jp   label_005_7550                           ; $754D: $C3 $50 $75

label_005_7550:
    and  $07                                      ; $7550: $E6 $07
    ret  nz                                       ; $7552: $C0

    call GetRandomByte                            ; $7553: $CD $0D $28
    and  $1F                                      ; $7556: $E6 $1F
    sub  $10                                      ; $7558: $D6 $10
    ld   e, a                                     ; $755A: $5F
    ld   hl, wActiveEntityPosX                    ; $755B: $21 $EE $FF
    add  [hl]                                     ; $755E: $86
    ld   [hl], a                                  ; $755F: $77
    call GetRandomByte                            ; $7560: $CD $0D $28
    and  $1F                                      ; $7563: $E6 $1F
    sub  $10                                      ; $7565: $D6 $10
    ld   e, a                                     ; $7567: $5F
    ld   hl, wActiveEntityPosY                    ; $7568: $21 $EC $FF
    add  [hl]                                     ; $756B: $86
    ld   [hl], a                                  ; $756C: $77
    jp   label_005_7570                           ; $756D: $C3 $70 $75

label_005_7570:
    call func_005_7A40                            ; $7570: $CD $40 $7A
    ldh  a, [wActiveEntityPosX]                   ; $7573: $F0 $EE
    ldh  [hScratchA], a                           ; $7575: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7577: $F0 $EC
    ldh  [hScratchB], a                           ; $7579: $E0 $D8
    ld   a, $02                                   ; $757B: $3E $02
    call label_CC7                                ; $757D: $CD $C7 $0C
    ld   a, $13                                   ; $7580: $3E $13
    ldh  [hNoiseSfx], a                            ; $7582: $E0 $F4
    ret                                           ; $7584: $C9

func_005_7585:
label_005_7585:
    ld   a, $36                                   ; $7585: $3E $36
    call label_3B86                               ; $7587: $CD $86 $3B
    jr   jr_005_7599                              ; $758A: $18 $0D

label_005_758C:
    ld   a, $36                                   ; $758C: $3E $36
    call label_3B86                               ; $758E: $CD $86 $3B
    ld   a, $48                                   ; $7591: $3E $48
    ldh  [hScratchA], a                           ; $7593: $E0 $D7
    ld   a, $10                                   ; $7595: $3E $10
    ldh  [hScratchB], a                           ; $7597: $E0 $D8

jr_005_7599:
    ldh  a, [hScratchB]                           ; $7599: $F0 $D8
    ld   hl, wEntity0PosY                         ; $759B: $21 $10 $C2
    add  hl, de                                   ; $759E: $19
    ld   [hl], a                                  ; $759F: $77
    ldh  a, [hScratchA]                           ; $75A0: $F0 $D7
    ld   hl, wEntity0PosX                         ; $75A2: $21 $00 $C2
    add  hl, de                                   ; $75A5: $19
    ld   [hl], a                                  ; $75A6: $77
    ldh  a, [hIsSideScrolling]                    ; $75A7: $F0 $F9
    and  a                                        ; $75A9: $A7
    jr   z, jr_005_75B4                           ; $75AA: $28 $08

    ld   hl, wEntity0SpeedY                       ; $75AC: $21 $50 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   [hl], $F0                                ; $75B0: $36 $F0
    jr   jr_005_75C0                              ; $75B2: $18 $0C

jr_005_75B4:
    ld   hl, $C320                                ; $75B4: $21 $20 $C3
    add  hl, de                                   ; $75B7: $19
    ld   [hl], $10                                ; $75B8: $36 $10
    ld   hl, $C310                                ; $75BA: $21 $10 $C3
    add  hl, de                                   ; $75BD: $19
    ld   [hl], $08                                ; $75BE: $36 $08

jr_005_75C0:
    call func_005_7B4B                            ; $75C0: $CD $4B $7B
    ld   hl, hNoiseSfx                             ; $75C3: $21 $F4 $FF
    ld   [hl], $1A                                ; $75C6: $36 $1A
    ret                                           ; $75C8: $C9

    inc  bc                                       ; $75C9: $03
    dec  b                                        ; $75CA: $05
    nop                                           ; $75CB: $00
    inc  b                                        ; $75CC: $04
    ld   [bc], a                                  ; $75CD: $02
    ld   b, $01                                   ; $75CE: $06 $01
    rlca                                          ; $75D0: $07
    call func_005_766E                            ; $75D1: $CD $6E $76
    call label_3D8A                               ; $75D4: $CD $8A $3D
    call func_005_7A3A                            ; $75D7: $CD $3A $7A
    ld   a, $01                                   ; $75DA: $3E $01
    ld   [$D200], a                               ; $75DC: $EA $00 $D2
    call label_BFB                                ; $75DF: $CD $FB $0B
    cp   $10                                      ; $75E2: $FE $10
    jr   nc, jr_005_7621                          ; $75E4: $30 $3B

    and  a                                        ; $75E6: $A7
    jr   nz, jr_005_7619                          ; $75E7: $20 $30

    ld   a, [$D201]                               ; $75E9: $FA $01 $D2
    ld   e, a                                     ; $75EC: $5F
    ld   d, b                                     ; $75ED: $50
    ld   hl, wEntitiesUnknowTableF                ; $75EE: $21 $F0 $C2
    add  hl, de                                   ; $75F1: $19
    ld   [hl], $1F                                ; $75F2: $36 $1F
    ld   a, $02                                   ; $75F4: $3E $02
    call label_3B86                               ; $75F6: $CD $86 $3B
    call label_C4B                                ; $75F9: $CD $4B $0C
    ldh  a, [hScratchA]                           ; $75FC: $F0 $D7
    ld   hl, wEntity0PosX                         ; $75FE: $21 $00 $C2
    add  hl, de                                   ; $7601: $19
    ld   [hl], a                                  ; $7602: $77
    ldh  a, [hScratchB]                           ; $7603: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7605: $21 $10 $C2
    add  hl, de                                   ; $7608: $19
    ld   [hl], a                                  ; $7609: $77
    ld   hl, wEntitiesFrameCounterTable           ; $760A: $21 $E0 $C2
    add  hl, de                                   ; $760D: $19
    ld   [hl], $17                                ; $760E: $36 $17
    ld   hl, $C440                                ; $7610: $21 $40 $C4
    add  hl, de                                   ; $7613: $19
    ld   [hl], $01                                ; $7614: $36 $01
    jp   label_005_7535                           ; $7616: $C3 $35 $75

jr_005_7619:
    ldh  a, [hFrameCounter]                       ; $7619: $F0 $E7
    ld   hl, $C420                                ; $761B: $21 $20 $C4
    add  hl, bc                                   ; $761E: $09
    ld   [hl], a                                  ; $761F: $77
    ret                                           ; $7620: $C9

jr_005_7621:
    ldh  a, [hFrameCounter]                       ; $7621: $F0 $E7
    and  $07                                      ; $7623: $E6 $07
    jr   nz, jr_005_7635                          ; $7625: $20 $0E

    ld   a, [$D201]                               ; $7627: $FA $01 $D2
    ld   e, a                                     ; $762A: $5F
    ld   d, b                                     ; $762B: $50
    ld   hl, wEntitiesUnknownTableD               ; $762C: $21 $D0 $C2
    add  hl, de                                   ; $762F: $19
    ld   a, [hl]                                  ; $7630: $7E
    and  a                                        ; $7631: $A7
    jr   z, jr_005_7635                           ; $7632: $28 $01

    dec  [hl]                                     ; $7634: $35

jr_005_7635:
    ld   hl, $C3D0                                ; $7635: $21 $D0 $C3
    add  hl, bc                                   ; $7638: $09
    ld   a, [hl]                                  ; $7639: $7E
    inc  a                                        ; $763A: $3C
    and  $7F                                      ; $763B: $E6 $7F
    ld   [hl], a                                  ; $763D: $77
    ld   e, a                                     ; $763E: $5F
    ld   d, b                                     ; $763F: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $7640: $21 $00 $D0
    add  hl, de                                   ; $7643: $19
    ldh  a, [wActiveEntityPosX]                   ; $7644: $F0 $EE
    ld   [hl], a                                  ; $7646: $77
    ld   hl, $D100                                ; $7647: $21 $00 $D1
    add  hl, de                                   ; $764A: $19
    ldh  a, [wActiveEntityPosY]                   ; $764B: $F0 $EC
    ld   [hl], a                                  ; $764D: $77
    ld   hl, $C300                                ; $764E: $21 $00 $C3
    add  hl, bc                                   ; $7651: $09
    ld   a, [hl]                                  ; $7652: $7E
    and  a                                        ; $7653: $A7
    jr   z, jr_005_765B                           ; $7654: $28 $05

    call func_005_7AB1                            ; $7656: $CD $B1 $7A
    jr   jr_005_765E                              ; $7659: $18 $03

jr_005_765B:
    call $7702                                    ; $765B: $CD $02 $77

jr_005_765E:
    ld   hl, wEntitiesWalkingTable                ; $765E: $21 $90 $C2
    add  hl, bc                                   ; $7661: $09
    ld   e, [hl]                                  ; $7662: $5E
    srl  e                                        ; $7663: $CB $3B
    ld   d, b                                     ; $7665: $50
    ld   hl, $75C9                                ; $7666: $21 $C9 $75
    add  hl, de                                   ; $7669: $19
    ld   a, [hl]                                  ; $766A: $7E
    jp   label_3B0C                               ; $766B: $C3 $0C $3B

func_005_766E:
    ldh  a, [hActiveEntityUnknownG]               ; $766E: $F0 $F1
    rla                                           ; $7670: $17
    rla                                           ; $7671: $17
    rla                                           ; $7672: $17
    rla                                           ; $7673: $17
    rla                                           ; $7674: $17
    and  $E0                                      ; $7675: $E6 $E0
    ld   e, a                                     ; $7677: $5F
    ld   d, b                                     ; $7678: $50
    ld   hl, $7782                                ; $7679: $21 $82 $77
    add  hl, de                                   ; $767C: $19
    ld   c, $08                                   ; $767D: $0E $08
    call label_3CE6                               ; $767F: $CD $E6 $3C
    ld   a, $08                                   ; $7682: $3E $08
    call label_3DA0                               ; $7684: $CD $A0 $3D
    ld   hl, $C3D0                                ; $7687: $21 $D0 $C3
    add  hl, bc                                   ; $768A: $09
    ld   a, [hl]                                  ; $768B: $7E
    ldh  [hScratchA], a                           ; $768C: $E0 $D7
    ldh  a, [hScratchA]                           ; $768E: $F0 $D7
    sub  $0C                                      ; $7690: $D6 $0C
    and  $7F                                      ; $7692: $E6 $7F
    ld   e, a                                     ; $7694: $5F
    ld   d, b                                     ; $7695: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $7696: $21 $00 $D0
    add  hl, de                                   ; $7699: $19
    ld   a, [hl]                                  ; $769A: $7E
    ldh  [wActiveEntityPosX], a                   ; $769B: $E0 $EE
    ld   hl, $D100                                ; $769D: $21 $00 $D1
    add  hl, de                                   ; $76A0: $19
    ld   a, [hl]                                  ; $76A1: $7E
    ldh  [wActiveEntityPosY], a                   ; $76A2: $E0 $EC
    ld   a, $00                                   ; $76A4: $3E $00
    ldh  [hActiveEntityUnknownG], a               ; $76A6: $E0 $F1
    ld   de, $72CC                                ; $76A8: $11 $CC $72
    call label_3BC0                               ; $76AB: $CD $C0 $3B
    ldh  a, [hScratchA]                           ; $76AE: $F0 $D7
    sub  $18                                      ; $76B0: $D6 $18
    and  $7F                                      ; $76B2: $E6 $7F
    ld   e, a                                     ; $76B4: $5F
    ld   d, b                                     ; $76B5: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $76B6: $21 $00 $D0
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    ldh  [wActiveEntityPosX], a                   ; $76BB: $E0 $EE
    ld   hl, $D100                                ; $76BD: $21 $00 $D1
    add  hl, de                                   ; $76C0: $19
    ld   a, [hl]                                  ; $76C1: $7E
    ldh  [wActiveEntityPosY], a                   ; $76C2: $E0 $EC
    ld   a, $00                                   ; $76C4: $3E $00
    ldh  [hActiveEntityUnknownG], a               ; $76C6: $E0 $F1
    ld   de, $72CC                                ; $76C8: $11 $CC $72
    call label_3BC0                               ; $76CB: $CD $C0 $3B
    ldh  a, [hScratchA]                           ; $76CE: $F0 $D7
    sub  $24                                      ; $76D0: $D6 $24
    and  $7F                                      ; $76D2: $E6 $7F
    ld   e, a                                     ; $76D4: $5F
    ld   d, b                                     ; $76D5: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $76D6: $21 $00 $D0
    add  hl, de                                   ; $76D9: $19
    ld   a, [hl]                                  ; $76DA: $7E
    ldh  [wActiveEntityPosX], a                   ; $76DB: $E0 $EE
    ld   hl, $D100                                ; $76DD: $21 $00 $D1
    add  hl, de                                   ; $76E0: $19
    ld   a, [hl]                                  ; $76E1: $7E
    ldh  [wActiveEntityPosY], a                   ; $76E2: $E0 $EC
    ld   a, $02                                   ; $76E4: $3E $02
    ldh  [hActiveEntityUnknownG], a               ; $76E6: $E0 $F1
    ld   de, $72CC                                ; $76E8: $11 $CC $72
    jp   label_3BC0                               ; $76EB: $C3 $C0 $3B

    nop                                           ; $76EE: $00
    ld   b, $0C                                   ; $76EF: $06 $0C
    ld   c, $10                                   ; $76F1: $0E $10
    ld   c, $0C                                   ; $76F3: $0E $0C
    ld   b, $00                                   ; $76F5: $06 $00
    ld   a, [$F2F4]                               ; $76F7: $FA $F4 $F2
    ldh  a, [hJingle]                             ; $76FA: $F0 $F2
    db   $F4                                      ; $76FC: $F4
    ld   a, [$0600]                               ; $76FD: $FA $00 $06
    inc  c                                        ; $7700: $0C
    ld   c, $CD                                   ; $7701: $0E $CD
    or   c                                        ; $7703: $B1
    ld   a, d                                     ; $7704: $7A
    call label_3B44                               ; $7705: $CD $44 $3B
    call label_3B23                               ; $7708: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $770B: $21 $A0 $C2
    add  hl, bc                                   ; $770E: $09
    ld   a, [hl]                                  ; $770F: $7E
    and  a                                        ; $7710: $A7
    jr   z, jr_005_7730                           ; $7711: $28 $1D

    call GetRandomByte                            ; $7713: $CD $0D $28
    rra                                           ; $7716: $1F
    jr   c, jr_005_7721                           ; $7717: $38 $08

    ld   hl, wEntitiesUnknownTableC               ; $7719: $21 $C0 $C2
    add  hl, bc                                   ; $771C: $09
    ld   a, [hl]                                  ; $771D: $7E
    cpl                                           ; $771E: $2F
    inc  a                                        ; $771F: $3C
    ld   [hl], a                                  ; $7720: $77

jr_005_7721:
    ld   hl, wEntitiesWalkingTable                ; $7721: $21 $90 $C2
    add  hl, bc                                   ; $7724: $09
    ld   a, [hl]                                  ; $7725: $7E
    add  $08                                      ; $7726: $C6 $08
    and  $0F                                      ; $7728: $E6 $0F
    ld   [hl], a                                  ; $772A: $77
    call IsEntityFrameCounterZero                 ; $772B: $CD $05 $0C
    ld   [hl], $10                                ; $772E: $36 $10

jr_005_7730:
    call label_C00                                ; $7730: $CD $00 $0C
    jr   nz, jr_005_775E                          ; $7733: $20 $29

    ld   [hl], $04                                ; $7735: $36 $04
    ld   hl, wEntitiesUnknownTableC               ; $7737: $21 $C0 $C2
    add  hl, bc                                   ; $773A: $09
    ld   a, [hl]                                  ; $773B: $7E
    ld   hl, wEntitiesWalkingTable                ; $773C: $21 $90 $C2
    add  hl, bc                                   ; $773F: $09
    add  [hl]                                     ; $7740: $86
    and  $0F                                      ; $7741: $E6 $0F
    ld   [hl], a                                  ; $7743: $77
    ld   hl, wEntitiesWalkingTable                ; $7744: $21 $90 $C2
    add  hl, bc                                   ; $7747: $09
    ld   e, [hl]                                  ; $7748: $5E
    ld   d, b                                     ; $7749: $50
    ld   hl, $76EE                                ; $774A: $21 $EE $76
    add  hl, de                                   ; $774D: $19
    ld   a, [hl]                                  ; $774E: $7E
    ld   hl, wEntity0SpeedY                       ; $774F: $21 $50 $C2
    add  hl, bc                                   ; $7752: $09
    ld   [hl], a                                  ; $7753: $77
    ld   hl, $76F2                                ; $7754: $21 $F2 $76
    add  hl, de                                   ; $7757: $19
    ld   a, [hl]                                  ; $7758: $7E
    ld   hl, wEntity0SpeedX                       ; $7759: $21 $40 $C2
    add  hl, bc                                   ; $775C: $09
    ld   [hl], a                                  ; $775D: $77

jr_005_775E:
    call IsEntityFrameCounterZero                 ; $775E: $CD $05 $0C
    jr   nz, jr_005_7776                          ; $7761: $20 $13

    call GetRandomByte                            ; $7763: $CD $0D $28
    and  $1F                                      ; $7766: $E6 $1F
    add  $10                                      ; $7768: $C6 $10
    ld   [hl], a                                  ; $776A: $77
    call GetRandomByte                            ; $776B: $CD $0D $28
    and  $02                                      ; $776E: $E6 $02
    dec  a                                        ; $7770: $3D
    ld   hl, wEntitiesUnknownTableC               ; $7771: $21 $C0 $C2
    add  hl, bc                                   ; $7774: $09
    ld   [hl], a                                  ; $7775: $77

jr_005_7776:
    ret                                           ; $7776: $C9

label_005_7777:
    ld   e, $80                                   ; $7777: $1E $80
    ld   hl, $D100                                ; $7779: $21 $00 $D1

jr_005_777C:
    xor  a                                        ; $777C: $AF
    ld   [hl+], a                                 ; $777D: $22
    dec  e                                        ; $777E: $1D
    jr   nz, jr_005_777C                          ; $777F: $20 $FB

    ret                                           ; $7781: $C9

    ld   hl, sp-$08                               ; $7782: $F8 $F8
    ld   h, b                                     ; $7784: $60
    rlca                                          ; $7785: $07
    ld   hl, sp+$00                               ; $7786: $F8 $00
    ld   h, d                                     ; $7788: $62
    rlca                                          ; $7789: $07
    ld   hl, sp+$08                               ; $778A: $F8 $08
    ld   h, d                                     ; $778C: $62
    daa                                           ; $778D: $27
    ld   hl, sp+$10                               ; $778E: $F8 $10
    ld   h, b                                     ; $7790: $60
    daa                                           ; $7791: $27
    ld   [$64F8], sp                              ; $7792: $08 $F8 $64
    rlca                                          ; $7795: $07
    ld   [$6600], sp                              ; $7796: $08 $00 $66
    rlca                                          ; $7799: $07
    ld   [$6608], sp                              ; $779A: $08 $08 $66
    daa                                           ; $779D: $27
    ld   [$6410], sp                              ; $779E: $08 $10 $64
    daa                                           ; $77A1: $27
    ld   hl, sp-$08                               ; $77A2: $F8 $F8
    ld   h, h                                     ; $77A4: $64
    ld   b, a                                     ; $77A5: $47
    ld   hl, sp+$00                               ; $77A6: $F8 $00
    ld   h, [hl]                                  ; $77A8: $66
    ld   b, a                                     ; $77A9: $47
    ld   hl, sp+$08                               ; $77AA: $F8 $08
    ld   h, [hl]                                  ; $77AC: $66
    ld   h, a                                     ; $77AD: $67
    ld   hl, sp+$10                               ; $77AE: $F8 $10
    ld   h, h                                     ; $77B0: $64
    ld   h, a                                     ; $77B1: $67
    ld   [$60F8], sp                              ; $77B2: $08 $F8 $60
    ld   b, a                                     ; $77B5: $47
    ld   [$6200], sp                              ; $77B6: $08 $00 $62
    ld   b, a                                     ; $77B9: $47
    ld   [$6208], sp                              ; $77BA: $08 $08 $62
    ld   h, a                                     ; $77BD: $67
    ld   [$6010], sp                              ; $77BE: $08 $10 $60
    ld   h, a                                     ; $77C1: $67
    ld   hl, sp-$08                               ; $77C2: $F8 $F8
    ld   l, b                                     ; $77C4: $68
    rlca                                          ; $77C5: $07
    ld   hl, sp+$00                               ; $77C6: $F8 $00
    ld   l, d                                     ; $77C8: $6A
    rlca                                          ; $77C9: $07
    ld   hl, sp+$08                               ; $77CA: $F8 $08
    ld   h, d                                     ; $77CC: $62
    daa                                           ; $77CD: $27
    ld   hl, sp+$10                               ; $77CE: $F8 $10
    ld   h, b                                     ; $77D0: $60
    daa                                           ; $77D1: $27
    ld   [$68F8], sp                              ; $77D2: $08 $F8 $68
    ld   b, a                                     ; $77D5: $47
    ld   [$6A00], sp                              ; $77D6: $08 $00 $6A
    ld   b, a                                     ; $77D9: $47
    ld   [$6208], sp                              ; $77DA: $08 $08 $62
    ld   h, a                                     ; $77DD: $67
    ld   [$6010], sp                              ; $77DE: $08 $10 $60
    ld   h, a                                     ; $77E1: $67
    ld   hl, sp-$08                               ; $77E2: $F8 $F8
    ld   h, b                                     ; $77E4: $60
    rlca                                          ; $77E5: $07
    ld   hl, sp+$00                               ; $77E6: $F8 $00
    ld   h, d                                     ; $77E8: $62
    rlca                                          ; $77E9: $07
    ld   hl, sp+$08                               ; $77EA: $F8 $08
    ld   l, d                                     ; $77EC: $6A
    daa                                           ; $77ED: $27
    ld   hl, sp+$10                               ; $77EE: $F8 $10
    ld   l, b                                     ; $77F0: $68
    daa                                           ; $77F1: $27
    ld   [$60F8], sp                              ; $77F2: $08 $F8 $60
    ld   b, a                                     ; $77F5: $47
    ld   [$6200], sp                              ; $77F6: $08 $00 $62
    ld   b, a                                     ; $77F9: $47
    ld   [$6A08], sp                              ; $77FA: $08 $08 $6A
    ld   h, a                                     ; $77FD: $67
    ld   [$6810], sp                              ; $77FE: $08 $10 $68
    ld   h, a                                     ; $7801: $67
    ld   hl, sp-$08                               ; $7802: $F8 $F8
    ld   h, b                                     ; $7804: $60
    rlca                                          ; $7805: $07
    ld   hl, sp+$00                               ; $7806: $F8 $00
    ld   h, d                                     ; $7808: $62
    rlca                                          ; $7809: $07
    ld   hl, sp+$08                               ; $780A: $F8 $08
    ld   h, d                                     ; $780C: $62
    daa                                           ; $780D: $27
    ld   hl, sp+$10                               ; $780E: $F8 $10
    ld   h, b                                     ; $7810: $60
    daa                                           ; $7811: $27
    ld   [$6CF8], sp                              ; $7812: $08 $F8 $6C
    rlca                                          ; $7815: $07
    ld   [$6E00], sp                              ; $7816: $08 $00 $6E
    rlca                                          ; $7819: $07
    ld   [$6208], sp                              ; $781A: $08 $08 $62
    ld   h, a                                     ; $781D: $67
    ld   [$6010], sp                              ; $781E: $08 $10 $60
    ld   h, a                                     ; $7821: $67
    ld   hl, sp-$08                               ; $7822: $F8 $F8
    ld   h, b                                     ; $7824: $60
    rlca                                          ; $7825: $07
    ld   hl, sp+$00                               ; $7826: $F8 $00
    ld   h, d                                     ; $7828: $62
    rlca                                          ; $7829: $07
    ld   hl, sp+$08                               ; $782A: $F8 $08
    ld   h, d                                     ; $782C: $62
    daa                                           ; $782D: $27
    ld   hl, sp+$10                               ; $782E: $F8 $10
    ld   h, b                                     ; $7830: $60
    daa                                           ; $7831: $27
    ld   [$60F8], sp                              ; $7832: $08 $F8 $60
    ld   b, a                                     ; $7835: $47
    ld   [$6200], sp                              ; $7836: $08 $00 $62
    ld   b, a                                     ; $7839: $47
    ld   [$6E08], sp                              ; $783A: $08 $08 $6E
    daa                                           ; $783D: $27
    ld   [$6C10], sp                              ; $783E: $08 $10 $6C
    daa                                           ; $7841: $27
    ld   hl, sp-$08                               ; $7842: $F8 $F8
    ld   l, h                                     ; $7844: $6C
    ld   b, a                                     ; $7845: $47
    ld   hl, sp+$00                               ; $7846: $F8 $00
    ld   l, [hl]                                  ; $7848: $6E
    ld   b, a                                     ; $7849: $47
    ld   hl, sp+$08                               ; $784A: $F8 $08
    ld   h, d                                     ; $784C: $62
    daa                                           ; $784D: $27
    ld   hl, sp+$10                               ; $784E: $F8 $10
    ld   h, b                                     ; $7850: $60
    daa                                           ; $7851: $27
    ld   [$60F8], sp                              ; $7852: $08 $F8 $60
    ld   b, a                                     ; $7855: $47
    ld   [$6200], sp                              ; $7856: $08 $00 $62
    ld   b, a                                     ; $7859: $47
    ld   [$6208], sp                              ; $785A: $08 $08 $62
    ld   h, a                                     ; $785D: $67
    ld   [$6010], sp                              ; $785E: $08 $10 $60
    ld   h, a                                     ; $7861: $67
    ld   hl, sp-$08                               ; $7862: $F8 $F8
    ld   h, b                                     ; $7864: $60
    rlca                                          ; $7865: $07
    ld   hl, sp+$00                               ; $7866: $F8 $00
    ld   h, d                                     ; $7868: $62
    rlca                                          ; $7869: $07
    ld   hl, sp+$08                               ; $786A: $F8 $08
    ld   l, [hl]                                  ; $786C: $6E
    ld   h, a                                     ; $786D: $67
    ld   hl, sp+$10                               ; $786E: $F8 $10
    ld   l, h                                     ; $7870: $6C
    ld   h, a                                     ; $7871: $67
    ld   [$60F8], sp                              ; $7872: $08 $F8 $60
    ld   b, a                                     ; $7875: $47
    ld   [$6200], sp                              ; $7876: $08 $00 $62
    ld   b, a                                     ; $7879: $47
    ld   [$6208], sp                              ; $787A: $08 $08 $62
    ld   h, a                                     ; $787D: $67
    ld   [$6010], sp                              ; $787E: $08 $10 $60
    ld   h, a                                     ; $7881: $67
    ld   hl, sp-$08                               ; $7882: $F8 $F8
    ld   h, b                                     ; $7884: $60
    rlca                                          ; $7885: $07
    ld   hl, sp+$00                               ; $7886: $F8 $00
    ld   h, d                                     ; $7888: $62
    rlca                                          ; $7889: $07
    ld   hl, sp+$08                               ; $788A: $F8 $08
    ld   h, d                                     ; $788C: $62
    daa                                           ; $788D: $27
    ld   hl, sp+$10                               ; $788E: $F8 $10
    ld   h, b                                     ; $7890: $60
    daa                                           ; $7891: $27
    ld   [$78F8], sp                              ; $7892: $08 $F8 $78
    rlca                                          ; $7895: $07
    ld   [$7A00], sp                              ; $7896: $08 $00 $7A
    rlca                                          ; $7899: $07
    ld   [$7A08], sp                              ; $789A: $08 $08 $7A
    daa                                           ; $789D: $27
    ld   [$7810], sp                              ; $789E: $08 $10 $78
    daa                                           ; $78A1: $27
    ld   [$7600], sp                              ; $78A2: $08 $00 $76
    rlca                                          ; $78A5: $07
    ld   [$7608], sp                              ; $78A6: $08 $08 $76
    daa                                           ; $78A9: $27
    ld   [$7608], sp                              ; $78AA: $08 $08 $76
    daa                                           ; $78AD: $27
    ld   [$7608], sp                              ; $78AE: $08 $08 $76
    daa                                           ; $78B1: $27
    ld   [$7608], sp                              ; $78B2: $08 $08 $76
    daa                                           ; $78B5: $27
    ld   [$7608], sp                              ; $78B6: $08 $08 $76
    daa                                           ; $78B9: $27
    ld   [$7608], sp                              ; $78BA: $08 $08 $76
    daa                                           ; $78BD: $27
    ld   [$7608], sp                              ; $78BE: $08 $08 $76
    daa                                           ; $78C1: $27
    ld   [$64F8], sp                              ; $78C2: $08 $F8 $64
    rlca                                          ; $78C5: $07
    ld   [$6600], sp                              ; $78C6: $08 $00 $66
    rlca                                          ; $78C9: $07
    ld   [$6608], sp                              ; $78CA: $08 $08 $66
    daa                                           ; $78CD: $27
    ld   [$6410], sp                              ; $78CE: $08 $10 $64
    daa                                           ; $78D1: $27
    ld   [$64F8], sp                              ; $78D2: $08 $F8 $64
    rlca                                          ; $78D5: $07
    ld   [$6600], sp                              ; $78D6: $08 $00 $66
    rlca                                          ; $78D9: $07
    ld   [$6608], sp                              ; $78DA: $08 $08 $66
    daa                                           ; $78DD: $27
    ld   [$6410], sp                              ; $78DE: $08 $10 $64
    daa                                           ; $78E1: $27
    ld   [$78F8], sp                              ; $78E2: $08 $F8 $78
    rlca                                          ; $78E5: $07
    ld   [$7A00], sp                              ; $78E6: $08 $00 $7A
    rlca                                          ; $78E9: $07
    ld   [$7A08], sp                              ; $78EA: $08 $08 $7A
    daa                                           ; $78ED: $27
    ld   [$7810], sp                              ; $78EE: $08 $10 $78
    daa                                           ; $78F1: $27
    ld   [$78F8], sp                              ; $78F2: $08 $F8 $78
    rlca                                          ; $78F5: $07
    ld   [$7A00], sp                              ; $78F6: $08 $00 $7A
    rlca                                          ; $78F9: $07
    ld   [$7A08], sp                              ; $78FA: $08 $08 $7A
    daa                                           ; $78FD: $27
    ld   [$7810], sp                              ; $78FE: $08 $10 $78
    daa                                           ; $7901: $27
    ld   hl, sp+$00                               ; $7902: $F8 $00
    db   $76                                      ; $7904: $76
    ld   b, a                                     ; $7905: $47
    ld   hl, sp+$08                               ; $7906: $F8 $08
    db   $76                                      ; $7908: $76
    ld   h, a                                     ; $7909: $67
    ld   hl, sp+$08                               ; $790A: $F8 $08
    db   $76                                      ; $790C: $76
    ld   h, a                                     ; $790D: $67
    ld   hl, sp+$08                               ; $790E: $F8 $08
    db   $76                                      ; $7910: $76
    ld   h, a                                     ; $7911: $67
    ld   hl, sp+$08                               ; $7912: $F8 $08
    db   $76                                      ; $7914: $76
    ld   h, a                                     ; $7915: $67
    ld   hl, sp+$08                               ; $7916: $F8 $08
    db   $76                                      ; $7918: $76
    ld   h, a                                     ; $7919: $67
    ld   hl, sp+$08                               ; $791A: $F8 $08
    db   $76                                      ; $791C: $76
    ld   h, a                                     ; $791D: $67
    ld   hl, sp+$08                               ; $791E: $F8 $08
    db   $76                                      ; $7920: $76
    ld   h, a                                     ; $7921: $67
    ld   hl, sp-$08                               ; $7922: $F8 $F8
    ld   h, h                                     ; $7924: $64
    ld   b, a                                     ; $7925: $47
    ld   hl, sp+$00                               ; $7926: $F8 $00
    ld   h, [hl]                                  ; $7928: $66
    ld   b, a                                     ; $7929: $47
    ld   hl, sp+$08                               ; $792A: $F8 $08
    ld   h, [hl]                                  ; $792C: $66
    ld   h, a                                     ; $792D: $67
    ld   hl, sp+$10                               ; $792E: $F8 $10
    ld   h, h                                     ; $7930: $64
    ld   h, a                                     ; $7931: $67
    ld   hl, sp-$08                               ; $7932: $F8 $F8
    ld   h, h                                     ; $7934: $64
    ld   b, a                                     ; $7935: $47
    ld   hl, sp+$00                               ; $7936: $F8 $00
    ld   h, [hl]                                  ; $7938: $66
    ld   b, a                                     ; $7939: $47
    ld   hl, sp+$08                               ; $793A: $F8 $08
    ld   h, [hl]                                  ; $793C: $66
    ld   h, a                                     ; $793D: $67
    ld   hl, sp+$10                               ; $793E: $F8 $10
    ld   h, h                                     ; $7940: $64
    ld   h, a                                     ; $7941: $67
    ld   hl, sp-$08                               ; $7942: $F8 $F8
    ld   a, b                                     ; $7944: $78
    ld   b, a                                     ; $7945: $47
    ld   hl, sp+$00                               ; $7946: $F8 $00
    ld   a, d                                     ; $7948: $7A
    ld   b, a                                     ; $7949: $47
    ld   hl, sp+$08                               ; $794A: $F8 $08
    ld   a, d                                     ; $794C: $7A
    ld   h, a                                     ; $794D: $67
    ld   hl, sp+$10                               ; $794E: $F8 $10
    ld   a, b                                     ; $7950: $78
    ld   h, a                                     ; $7951: $67
    ld   hl, sp-$08                               ; $7952: $F8 $F8
    ld   a, b                                     ; $7954: $78
    ld   b, a                                     ; $7955: $47
    ld   hl, sp+$00                               ; $7956: $F8 $00
    ld   a, d                                     ; $7958: $7A
    ld   b, a                                     ; $7959: $47
    ld   hl, sp+$08                               ; $795A: $F8 $08
    ld   a, d                                     ; $795C: $7A
    ld   h, a                                     ; $795D: $67
    ld   hl, sp+$10                               ; $795E: $F8 $10
    ld   a, b                                     ; $7960: $78
    ld   h, a                                     ; $7961: $67
    ld   [$60F8], sp                              ; $7962: $08 $F8 $60
    ld   b, a                                     ; $7965: $47
    ld   [$6200], sp                              ; $7966: $08 $00 $62
    ld   b, a                                     ; $7969: $47
    ld   [$6208], sp                              ; $796A: $08 $08 $62
    ld   h, a                                     ; $796D: $67
    ld   [$6010], sp                              ; $796E: $08 $10 $60
    ld   h, a                                     ; $7971: $67
    ld   hl, sp-$08                               ; $7972: $F8 $F8
    ld   a, b                                     ; $7974: $78
    ld   b, a                                     ; $7975: $47
    ld   hl, sp+$00                               ; $7976: $F8 $00
    ld   a, d                                     ; $7978: $7A
    ld   b, a                                     ; $7979: $47
    ld   hl, sp+$08                               ; $797A: $F8 $08
    ld   a, d                                     ; $797C: $7A
    ld   h, a                                     ; $797D: $67
    ld   hl, sp+$10                               ; $797E: $F8 $10
    ld   a, b                                     ; $7980: $78
    ld   h, a                                     ; $7981: $67

func_005_7982:
    ldh  a, [hActiveEntityUnknownG]               ; $7982: $F0 $F1
    ld   d, b                                     ; $7984: $50
    rla                                           ; $7985: $17
    rl   d                                        ; $7986: $CB $12
    rla                                           ; $7988: $17
    rl   d                                        ; $7989: $CB $12
    rla                                           ; $798B: $17
    rl   d                                        ; $798C: $CB $12
    rla                                           ; $798E: $17
    rl   d                                        ; $798F: $CB $12
    rla                                           ; $7991: $17
    rl   d                                        ; $7992: $CB $12
    and  $E0                                      ; $7994: $E6 $E0
    ld   e, a                                     ; $7996: $5F
    ld   hl, $7782                                ; $7997: $21 $82 $77
    add  hl, de                                   ; $799A: $19
    ld   c, $08                                   ; $799B: $0E $08
    call label_3CE6                               ; $799D: $CD $E6 $3C
    ld   a, $08                                   ; $79A0: $3E $08
    jp   label_3DA0                               ; $79A2: $C3 $A0 $3D

    ld   a, [c]                                   ; $79A5: $F2
    ld   c, $F0                                   ; $79A6: $0E $F0
    rst  $20                                      ; $79A8: $E7
    and  $10                                      ; $79A9: $E6 $10
    ld   a, $03                                   ; $79AB: $3E $03
    jr   z, jr_005_79B0                           ; $79AD: $28 $01

    inc  a                                        ; $79AF: $3C

jr_005_79B0:
    ldh  [hActiveEntityUnknownG], a               ; $79B0: $E0 $F1
    nop                                           ; $79B2: $00

jr_005_79B3:
    ld   hl, $C380                                ; $79B3: $21 $80 $C3
    add  hl, bc                                   ; $79B6: $09
    ld   e, [hl]                                  ; $79B7: $5E
    ld   d, b                                     ; $79B8: $50
    ld   hl, $79A5                                ; $79B9: $21 $A5 $79
    add  hl, de                                   ; $79BC: $19
    ld   a, [hl]                                  ; $79BD: $7E
    ld   hl, wActiveEntityPosY                    ; $79BE: $21 $EC $FF
    add  [hl]                                     ; $79C1: $86
    ld   [hl], a                                  ; $79C2: $77
    cp   $14                                      ; $79C3: $FE $14
    jr   c, jr_005_7A1F                           ; $79C5: $38 $58

    cp   $7C                                      ; $79C7: $FE $7C
    jr   nc, jr_005_7A1F                          ; $79C9: $30 $54

    ld   de, $72CC                                ; $79CB: $11 $CC $72
    call label_3BC0                               ; $79CE: $CD $C0 $3B
    ldh  a, [hActiveEntityWalking]                ; $79D1: $F0 $F0
    cp   $04                                      ; $79D3: $FE $04
    jr   nc, jr_005_7A1D                          ; $79D5: $30 $46

    ldh  a, [hActiveEntityUnknownG]               ; $79D7: $F0 $F1
    and  a                                        ; $79D9: $A7
    jr   z, jr_005_7A1A                           ; $79DA: $28 $3E

    xor  a                                        ; $79DC: $AF
    ldh  [hActiveEntityUnknownG], a               ; $79DD: $E0 $F1
    call label_3B70                               ; $79DF: $CD $70 $3B
    ld   hl, $C420                                ; $79E2: $21 $20 $C4
    add  hl, bc                                   ; $79E5: $09
    ld   a, [hl]                                  ; $79E6: $7E
    cp   $16                                      ; $79E7: $FE $16
    jr   nz, jr_005_7A1A                          ; $79E9: $20 $2F

    ld   hl, $D204                                ; $79EB: $21 $04 $D2
    inc  [hl]                                     ; $79EE: $34
    ld   a, [hl]                                  ; $79EF: $7E
    cp   $08                                      ; $79F0: $FE $08
    jr   nz, jr_005_7A1A                          ; $79F2: $20 $26

    ld   a, [$D201]                               ; $79F4: $FA $01 $D2
    ld   e, a                                     ; $79F7: $5F
    ld   d, b                                     ; $79F8: $50
    ld   hl, wEntity0Type                         ; $79F9: $21 $80 $C2
    add  hl, de                                   ; $79FC: $19
    ld   [hl], b                                  ; $79FD: $70
    call IncrementEntityWalkingAttr               ; $79FE: $CD $12 $3B
    ld   [hl], $04                                ; $7A01: $36 $04
    call IsEntityFrameCounterZero                 ; $7A03: $CD $05 $0C
    ld   [hl], $FF                                ; $7A06: $36 $FF
    call label_27F2                               ; $7A08: $CD $F2 $27
    ld   a, $03                                   ; $7A0B: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $7A0D: $EA $A7 $C5
    ld   a, $5E                                   ; $7A10: $3E $5E
    ld   [wWorldMusicTrack], a                    ; $7A12: $EA $68 $D3
    ld   a, $B5                                   ; $7A15: $3E $B5
    call OpenDialog                               ; $7A17: $CD $85 $23

jr_005_7A1A:
    call label_3B44                               ; $7A1A: $CD $44 $3B

jr_005_7A1D:
    jr   jr_005_79B3                              ; $7A1D: $18 $94

jr_005_7A1F:
    call label_3D8A                               ; $7A1F: $CD $8A $3D
    ld   hl, $C420                                ; $7A22: $21 $20 $C4
    add  hl, bc                                   ; $7A25: $09
    ld   a, [hl]                                  ; $7A26: $7E
    and  a                                        ; $7A27: $A7
    jr   nz, jr_005_7A39                          ; $7A28: $20 $0F

    ld   hl, $C430                                ; $7A2A: $21 $30 $C4
    add  hl, bc                                   ; $7A2D: $09
    ld   [hl], $C0                                ; $7A2E: $36 $C0
    call label_3B70                               ; $7A30: $CD $70 $3B
    ld   hl, $C430                                ; $7A33: $21 $30 $C4
    add  hl, bc                                   ; $7A36: $09
    ld   [hl], $80                                ; $7A37: $36 $80

jr_005_7A39:
    ret                                           ; $7A39: $C9

func_005_7A3A:
    ldh  a, [hActiveEntityType]                   ; $7A3A: $F0 $EA
    cp   $05                                      ; $7A3C: $FE $05
    jr   nz, jr_005_7A65                          ; $7A3E: $20 $25

func_005_7A40:
    ld   a, [wGameplayType]                       ; $7A40: $FA $95 $DB
    cp   $07                                      ; $7A43: $FE $07
    jr   z, jr_005_7A65                           ; $7A45: $28 $1E

    cp   $0B                                      ; $7A47: $FE $0B
    jr   nz, jr_005_7A65                          ; $7A49: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7A4B: $FA $6B $C1
    cp   $04                                      ; $7A4E: $FE $04
    jr   nz, jr_005_7A65                          ; $7A50: $20 $13

    ld   hl, $C1A8                                ; $7A52: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7A55: $FA $9F $C1
    or   [hl]                                     ; $7A58: $B6
    ld   hl, wInventoryAppearing                  ; $7A59: $21 $4F $C1
    or   [hl]                                     ; $7A5C: $B6
    jr   nz, jr_005_7A65                          ; $7A5D: $20 $06

    ld   a, [wRoomTransitionState]                ; $7A5F: $FA $24 $C1
    and  a                                        ; $7A62: $A7
    jr   z, jr_005_7A66                           ; $7A63: $28 $01

jr_005_7A65:
    pop  af                                       ; $7A65: $F1

jr_005_7A66:
    ret                                           ; $7A66: $C9

    ld   hl, $C410                                ; $7A67: $21 $10 $C4
    add  hl, bc                                   ; $7A6A: $09
    ld   a, [hl]                                  ; $7A6B: $7E
    and  a                                        ; $7A6C: $A7
    jr   z, jr_005_7AB0                           ; $7A6D: $28 $41

    dec  a                                        ; $7A6F: $3D
    ld   [hl], a                                  ; $7A70: $77
    call label_3E8E                               ; $7A71: $CD $8E $3E
    ld   hl, wEntity0SpeedX                       ; $7A74: $21 $40 $C2
    add  hl, bc                                   ; $7A77: $09
    ld   a, [hl]                                  ; $7A78: $7E
    push af                                       ; $7A79: $F5
    ld   hl, wEntity0SpeedY                       ; $7A7A: $21 $50 $C2
    add  hl, bc                                   ; $7A7D: $09
    ld   a, [hl]                                  ; $7A7E: $7E
    push af                                       ; $7A7F: $F5
    ld   hl, $C3F0                                ; $7A80: $21 $F0 $C3
    add  hl, bc                                   ; $7A83: $09
    ld   a, [hl]                                  ; $7A84: $7E
    ld   hl, wEntity0SpeedX                       ; $7A85: $21 $40 $C2
    add  hl, bc                                   ; $7A88: $09
    ld   [hl], a                                  ; $7A89: $77
    ld   hl, $C400                                ; $7A8A: $21 $00 $C4
    add  hl, bc                                   ; $7A8D: $09
    ld   a, [hl]                                  ; $7A8E: $7E
    ld   hl, wEntity0SpeedY                       ; $7A8F: $21 $50 $C2
    add  hl, bc                                   ; $7A92: $09
    ld   [hl], a                                  ; $7A93: $77
    call func_005_7AB1                            ; $7A94: $CD $B1 $7A
    ld   hl, $C430                                ; $7A97: $21 $30 $C4
    add  hl, bc                                   ; $7A9A: $09
    ld   a, [hl]                                  ; $7A9B: $7E
    and  $20                                      ; $7A9C: $E6 $20
    jr   nz, jr_005_7AA3                          ; $7A9E: $20 $03

    call label_3B23                               ; $7AA0: $CD $23 $3B

jr_005_7AA3:
    ld   hl, wEntity0SpeedY                       ; $7AA3: $21 $50 $C2
    add  hl, bc                                   ; $7AA6: $09
    pop  af                                       ; $7AA7: $F1
    ld   [hl], a                                  ; $7AA8: $77
    ld   hl, wEntity0SpeedX                       ; $7AA9: $21 $40 $C2
    add  hl, bc                                   ; $7AAC: $09
    pop  af                                       ; $7AAD: $F1
    ld   [hl], a                                  ; $7AAE: $77
    pop  af                                       ; $7AAF: $F1

jr_005_7AB0:
    ret                                           ; $7AB0: $C9

func_005_7AB1:
label_005_7AB1:
    call func_005_7ABE                            ; $7AB1: $CD $BE $7A

func_005_7AB4:
label_005_7AB4:
    push bc                                       ; $7AB4: $C5
    ld   a, c                                     ; $7AB5: $79
    add  $10                                      ; $7AB6: $C6 $10
    ld   c, a                                     ; $7AB8: $4F
    call func_005_7ABE                            ; $7AB9: $CD $BE $7A
    pop  bc                                       ; $7ABC: $C1
    ret                                           ; $7ABD: $C9

func_005_7ABE:
    ld   hl, wEntity0SpeedX                       ; $7ABE: $21 $40 $C2
    add  hl, bc                                   ; $7AC1: $09
    ld   a, [hl]                                  ; $7AC2: $7E
    and  a                                        ; $7AC3: $A7
    jr   z, jr_005_7AE9                           ; $7AC4: $28 $23

    push af                                       ; $7AC6: $F5
    swap a                                        ; $7AC7: $CB $37
    and  $F0                                      ; $7AC9: $E6 $F0
    ld   hl, $C260                                ; $7ACB: $21 $60 $C2
    add  hl, bc                                   ; $7ACE: $09
    add  [hl]                                     ; $7ACF: $86
    ld   [hl], a                                  ; $7AD0: $77
    rl   d                                        ; $7AD1: $CB $12
    ld   hl, wEntity0PosX                         ; $7AD3: $21 $00 $C2

jr_005_7AD6:
    add  hl, bc                                   ; $7AD6: $09
    pop  af                                       ; $7AD7: $F1
    ld   e, $00                                   ; $7AD8: $1E $00
    bit  7, a                                     ; $7ADA: $CB $7F
    jr   z, jr_005_7AE0                           ; $7ADC: $28 $02

    ld   e, $F0                                   ; $7ADE: $1E $F0

jr_005_7AE0:
    swap a                                        ; $7AE0: $CB $37
    and  $0F                                      ; $7AE2: $E6 $0F
    or   e                                        ; $7AE4: $B3
    rr   d                                        ; $7AE5: $CB $1A
    adc  [hl]                                     ; $7AE7: $8E
    ld   [hl], a                                  ; $7AE8: $77

jr_005_7AE9:
    ret                                           ; $7AE9: $C9

func_005_7AEA:
label_005_7AEA:
    ld   hl, $C320                                ; $7AEA: $21 $20 $C3
    add  hl, bc                                   ; $7AED: $09
    ld   a, [hl]                                  ; $7AEE: $7E
    and  a                                        ; $7AEF: $A7
    jr   z, jr_005_7AE9                           ; $7AF0: $28 $F7

    push af                                       ; $7AF2: $F5
    swap a                                        ; $7AF3: $CB $37
    and  $F0                                      ; $7AF5: $E6 $F0
    ld   hl, $C330                                ; $7AF7: $21 $30 $C3
    add  hl, bc                                   ; $7AFA: $09
    add  [hl]                                     ; $7AFB: $86
    ld   [hl], a                                  ; $7AFC: $77
    rl   d                                        ; $7AFD: $CB $12
    ld   hl, $C310                                ; $7AFF: $21 $10 $C3
    jr   jr_005_7AD6                              ; $7B02: $18 $D2

func_005_7B04:
    ld   e, $00                                   ; $7B04: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7B06: $F0 $98
    ld   hl, wEntity0PosX                         ; $7B08: $21 $00 $C2
    add  hl, bc                                   ; $7B0B: $09
    sub  [hl]                                     ; $7B0C: $96
    bit  7, a                                     ; $7B0D: $CB $7F
    jr   z, jr_005_7B12                           ; $7B0F: $28 $01

    inc  e                                        ; $7B11: $1C

jr_005_7B12:
    ld   d, a                                     ; $7B12: $57
    ret                                           ; $7B13: $C9

func_005_7B14:
    ld   e, $02                                   ; $7B14: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7B16: $F0 $99
    ld   hl, wEntity0PosY                         ; $7B18: $21 $10 $C2
    add  hl, bc                                   ; $7B1B: $09
    sub  [hl]                                     ; $7B1C: $96
    bit  7, a                                     ; $7B1D: $CB $7F
    jr   nz, jr_005_7B22                          ; $7B1F: $20 $01

    inc  e                                        ; $7B21: $1C

jr_005_7B22:
    ld   d, a                                     ; $7B22: $57
    ret                                           ; $7B23: $C9

func_005_7B24:
    call func_005_7B04                            ; $7B24: $CD $04 $7B
    ld   a, e                                     ; $7B27: $7B
    ldh  [hScratchA], a                           ; $7B28: $E0 $D7
    ld   a, d                                     ; $7B2A: $7A
    bit  7, a                                     ; $7B2B: $CB $7F
    jr   z, jr_005_7B31                           ; $7B2D: $28 $02

    cpl                                           ; $7B2F: $2F
    inc  a                                        ; $7B30: $3C

jr_005_7B31:
    push af                                       ; $7B31: $F5
    call func_005_7B14                            ; $7B32: $CD $14 $7B
    ld   a, e                                     ; $7B35: $7B
    ldh  [hScratchB], a                           ; $7B36: $E0 $D8
    ld   a, d                                     ; $7B38: $7A
    bit  7, a                                     ; $7B39: $CB $7F
    jr   z, jr_005_7B3F                           ; $7B3B: $28 $02

    cpl                                           ; $7B3D: $2F
    inc  a                                        ; $7B3E: $3C

jr_005_7B3F:
    pop  de                                       ; $7B3F: $D1
    cp   d                                        ; $7B40: $BA
    jr   nc, jr_005_7B47                          ; $7B41: $30 $04

    ldh  a, [hScratchA]                           ; $7B43: $F0 $D7
    jr   jr_005_7B49                              ; $7B45: $18 $02

jr_005_7B47:
    ldh  a, [hScratchB]                           ; $7B47: $F0 $D8

jr_005_7B49:
    ld   e, a                                     ; $7B49: $5F
    ret                                           ; $7B4A: $C9

func_005_7B4B:
label_005_7B4B:
    ld   hl, wEntity0Type                         ; $7B4B: $21 $80 $C2
    add  hl, bc                                   ; $7B4E: $09
    ld   [hl], b                                  ; $7B4F: $70
    ret                                           ; $7B50: $C9

    db   $10                                      ; $7B51: $10
    ldh  a, [rNR23]                               ; $7B52: $F0 $18
    add  sp, $00                                  ; $7B54: $E8 $00
    ldh  a, [$FF64]                               ; $7B56: $F0 $64
    nop                                           ; $7B58: $00
    nop                                           ; $7B59: $00
    ld   hl, sp+$66                               ; $7B5A: $F8 $66
    nop                                           ; $7B5C: $00
    nop                                           ; $7B5D: $00
    nop                                           ; $7B5E: $00
    ld   h, b                                     ; $7B5F: $60
    nop                                           ; $7B60: $00
    nop                                           ; $7B61: $00
    ld   [$2060], sp                              ; $7B62: $08 $60 $20
    nop                                           ; $7B65: $00
    db   $10                                      ; $7B66: $10
    ld   l, d                                     ; $7B67: $6A
    jr   nz, jr_005_7B6A                          ; $7B68: $20 $00

jr_005_7B6A:
    jr   jr_005_7BD4                              ; $7B6A: $18 $68

    jr   nz, jr_005_7B6E                          ; $7B6C: $20 $00

jr_005_7B6E:
    ldh  a, [$FF6C]                               ; $7B6E: $F0 $6C
    nop                                           ; $7B70: $00
    nop                                           ; $7B71: $00
    ld   hl, sp+$6E                               ; $7B72: $F8 $6E
    nop                                           ; $7B74: $00
    nop                                           ; $7B75: $00
    nop                                           ; $7B76: $00
    ld   h, b                                     ; $7B77: $60
    nop                                           ; $7B78: $00
    nop                                           ; $7B79: $00
    ld   [$2060], sp                              ; $7B7A: $08 $60 $20
    nop                                           ; $7B7D: $00
    db   $10                                      ; $7B7E: $10
    ld   l, [hl]                                  ; $7B7F: $6E
    jr   nz, jr_005_7B82                          ; $7B80: $20 $00

jr_005_7B82:
    jr   @+$6E                                    ; $7B82: $18 $6C

    jr   nz, jr_005_7B86                          ; $7B84: $20 $00

jr_005_7B86:
    ldh  a, [rBCPS]                               ; $7B86: $F0 $68
    nop                                           ; $7B88: $00
    nop                                           ; $7B89: $00
    ld   hl, sp+$6A                               ; $7B8A: $F8 $6A
    nop                                           ; $7B8C: $00
    nop                                           ; $7B8D: $00
    nop                                           ; $7B8E: $00
    ld   h, b                                     ; $7B8F: $60
    nop                                           ; $7B90: $00
    nop                                           ; $7B91: $00
    ld   [$2060], sp                              ; $7B92: $08 $60 $20
    nop                                           ; $7B95: $00
    db   $10                                      ; $7B96: $10
    ld   h, [hl]                                  ; $7B97: $66
    jr   nz, jr_005_7B9A                          ; $7B98: $20 $00

jr_005_7B9A:
    jr   @+$66                                    ; $7B9A: $18 $64

    jr   nz, jr_005_7B9E                          ; $7B9C: $20 $00

jr_005_7B9E:
    ldh  a, [$FF64]                               ; $7B9E: $F0 $64
    nop                                           ; $7BA0: $00
    nop                                           ; $7BA1: $00
    ld   hl, sp+$66                               ; $7BA2: $F8 $66
    nop                                           ; $7BA4: $00
    nop                                           ; $7BA5: $00
    nop                                           ; $7BA6: $00
    ld   h, d                                     ; $7BA7: $62
    nop                                           ; $7BA8: $00
    nop                                           ; $7BA9: $00
    ld   [$2062], sp                              ; $7BAA: $08 $62 $20
    nop                                           ; $7BAD: $00
    db   $10                                      ; $7BAE: $10
    ld   l, d                                     ; $7BAF: $6A
    jr   nz, jr_005_7BB2                          ; $7BB0: $20 $00

jr_005_7BB2:
    jr   jr_005_7C1C                              ; $7BB2: $18 $68

    jr   nz, jr_005_7BB6                          ; $7BB4: $20 $00

jr_005_7BB6:
    ldh  a, [$FF6C]                               ; $7BB6: $F0 $6C
    nop                                           ; $7BB8: $00
    nop                                           ; $7BB9: $00
    ld   hl, sp+$6E                               ; $7BBA: $F8 $6E
    nop                                           ; $7BBC: $00
    nop                                           ; $7BBD: $00
    nop                                           ; $7BBE: $00
    ld   h, d                                     ; $7BBF: $62
    nop                                           ; $7BC0: $00
    nop                                           ; $7BC1: $00
    ld   [$2062], sp                              ; $7BC2: $08 $62 $20
    nop                                           ; $7BC5: $00
    db   $10                                      ; $7BC6: $10
    ld   l, [hl]                                  ; $7BC7: $6E
    jr   nz, jr_005_7BCA                          ; $7BC8: $20 $00

jr_005_7BCA:
    jr   @+$6E                                    ; $7BCA: $18 $6C

    jr   nz, jr_005_7BCE                          ; $7BCC: $20 $00

jr_005_7BCE:
    ldh  a, [rBCPS]                               ; $7BCE: $F0 $68
    nop                                           ; $7BD0: $00
    nop                                           ; $7BD1: $00
    ld   hl, sp+$6A                               ; $7BD2: $F8 $6A

jr_005_7BD4:
    nop                                           ; $7BD4: $00
    nop                                           ; $7BD5: $00
    nop                                           ; $7BD6: $00
    ld   h, d                                     ; $7BD7: $62
    nop                                           ; $7BD8: $00
    nop                                           ; $7BD9: $00
    ld   [$2062], sp                              ; $7BDA: $08 $62 $20
    nop                                           ; $7BDD: $00
    db   $10                                      ; $7BDE: $10
    ld   h, [hl]                                  ; $7BDF: $66

jr_005_7BE0:
    jr   nz, jr_005_7BE2                          ; $7BE0: $20 $00

jr_005_7BE2:
    jr   @+$66                                    ; $7BE2: $18 $64

    jr   nz, jr_005_7BE0                          ; $7BE4: $20 $FA

    ld   h, [hl]                                  ; $7BE6: $66
    pop  bc                                       ; $7BE7: $C1
    cp   $01                                      ; $7BE8: $FE $01
    jr   nz, jr_005_7BF6                          ; $7BEA: $20 $0A

    call func_005_7CD5                            ; $7BEC: $CD $D5 $7C
    ld   hl, wEntitiesWalkingTable                ; $7BEF: $21 $90 $C2
    add  hl, bc                                   ; $7BF2: $09
    ld   a, [hl]                                  ; $7BF3: $7E
    ldh  [hActiveEntityWalking], a                ; $7BF4: $E0 $F0

jr_005_7BF6:
    ldh  a, [hActiveEntityUnknownG]               ; $7BF6: $F0 $F1
    rla                                           ; $7BF8: $17
    rla                                           ; $7BF9: $17
    rla                                           ; $7BFA: $17
    and  $F8                                      ; $7BFB: $E6 $F8
    ld   c, a                                     ; $7BFD: $4F
    rla                                           ; $7BFE: $17
    and  $F0                                      ; $7BFF: $E6 $F0
    add  c                                        ; $7C01: $81
    ld   e, a                                     ; $7C02: $5F
    ld   d, b                                     ; $7C03: $50
    ld   hl, $7B55                                ; $7C04: $21 $55 $7B
    add  hl, de                                   ; $7C07: $19
    ld   c, $06                                   ; $7C08: $0E $06
    call label_3CE6                               ; $7C0A: $CD $E6 $3C
    ld   a, $06                                   ; $7C0D: $3E $06
    call label_3DA0                               ; $7C0F: $CD $A0 $3D
    ldh  a, [hActiveEntityType]                   ; $7C12: $F0 $EA
    cp   $05                                      ; $7C14: $FE $05
    jp   nz, label_005_7E6C                       ; $7C16: $C2 $6C $7E

    call func_005_7A3A                            ; $7C19: $CD $3A $7A

jr_005_7C1C:
    call label_3EE8                               ; $7C1C: $CD $E8 $3E
    call label_3B39                               ; $7C1F: $CD $39 $3B
    call func_005_7AB1                            ; $7C22: $CD $B1 $7A
    call label_3B23                               ; $7C25: $CD $23 $3B
    call label_C56                                ; $7C28: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $7C2B: $F0 $F0
    rst  $00                                      ; $7C2D: $C7
    ld   [hl], $7C                                ; $7C2E: $36 $7C
    ld   d, d                                     ; $7C30: $52
    ld   a, h                                     ; $7C31: $7C
    ld   h, d                                     ; $7C32: $62
    ld   a, l                                     ; $7C33: $7D
    ld   a, [bc]                                  ; $7C34: $0A
    ld   a, [hl]                                  ; $7C35: $7E
    call GetRandomByte                            ; $7C36: $CD $0D $28
    and  $01                                      ; $7C39: $E6 $01
    ld   hl, wEntitiesUnknownTableB               ; $7C3B: $21 $B0 $C2
    add  hl, bc                                   ; $7C3E: $09
    ld   [hl], a                                  ; $7C3F: $77
    ld   e, a                                     ; $7C40: $5F
    ld   d, b                                     ; $7C41: $50
    ld   hl, $7B51                                ; $7C42: $21 $51 $7B
    add  hl, de                                   ; $7C45: $19
    ld   a, [hl]                                  ; $7C46: $7E
    ld   hl, wEntity0SpeedX                       ; $7C47: $21 $40 $C2
    add  hl, bc                                   ; $7C4A: $09
    ld   [hl], a                                  ; $7C4B: $77
    call IncrementEntityWalkingAttr               ; $7C4C: $CD $12 $3B
    ld   [hl], $01                                ; $7C4F: $36 $01
    ret                                           ; $7C51: $C9

    ld   hl, $C300                                ; $7C52: $21 $00 $C3
    add  hl, bc                                   ; $7C55: $09
    ld   a, [hl]                                  ; $7C56: $7E
    and  a                                        ; $7C57: $A7
    ret  nz                                       ; $7C58: $C0

    call label_C00                                ; $7C59: $CD $00 $0C
    jp   nz, label_005_7CE8                       ; $7C5C: $C2 $E8 $7C

    call IsEntityFrameCounterZero                 ; $7C5F: $CD $05 $0C
    jr   z, jr_005_7C89                           ; $7C62: $28 $25

    cp   $01                                      ; $7C64: $FE $01
    jr   nz, jr_005_7C9C                          ; $7C66: $20 $34

    call func_005_7B04                            ; $7C68: $CD $04 $7B
    ld   d, b                                     ; $7C6B: $50
    ld   hl, $7B53                                ; $7C6C: $21 $53 $7B
    add  hl, de                                   ; $7C6F: $19
    ld   a, [hl]                                  ; $7C70: $7E
    ld   hl, wEntity0SpeedX                       ; $7C71: $21 $40 $C2
    add  hl, bc                                   ; $7C74: $09
    ld   [hl], a                                  ; $7C75: $77
    ld   hl, wEntity0SpeedY                       ; $7C76: $21 $50 $C2
    add  hl, bc                                   ; $7C79: $09
    ld   [hl], b                                  ; $7C7A: $70
    call label_C00                                ; $7C7B: $CD $00 $0C
    call GetRandomByte                            ; $7C7E: $CD $0D $28
    and  $3F                                      ; $7C81: $E6 $3F
    add  $60                                      ; $7C83: $C6 $60
    ld   [hl], a                                  ; $7C85: $77
    jp   label_005_7CE8                           ; $7C86: $C3 $E8 $7C

jr_005_7C89:
    ld   hl, wEntity0PosY                         ; $7C89: $21 $10 $C2
    add  hl, bc                                   ; $7C8C: $09
    ld   a, [hl]                                  ; $7C8D: $7E
    add  $08                                      ; $7C8E: $C6 $08
    ld   hl, hLinkPositionY                       ; $7C90: $21 $99 $FF
    cp   [hl]                                     ; $7C93: $BE
    jp   c, label_005_7CB3                        ; $7C94: $DA $B3 $7C

    call IsEntityFrameCounterZero                 ; $7C97: $CD $05 $0C
    ld   [hl], $60                                ; $7C9A: $36 $60

jr_005_7C9C:
    ld   hl, wEntity0SpeedY                       ; $7C9C: $21 $50 $C2
    add  hl, bc                                   ; $7C9F: $09
    ld   [hl], b                                  ; $7CA0: $70
    ld   hl, wEntity0SpeedX                       ; $7CA1: $21 $40 $C2
    add  hl, bc                                   ; $7CA4: $09
    and  $04                                      ; $7CA5: $E6 $04
    jr   nz, jr_005_7CAE                          ; $7CA7: $20 $05

    ld   [hl], $08                                ; $7CA9: $36 $08
    jp   label_005_7D40                           ; $7CAB: $C3 $40 $7D

jr_005_7CAE:
    ld   [hl], $F8                                ; $7CAE: $36 $F8
    jp   label_005_7D40                           ; $7CB0: $C3 $40 $7D

label_005_7CB3:
    ld   hl, wEntity0PosY                         ; $7CB3: $21 $10 $C2
    add  hl, bc                                   ; $7CB6: $09
    ldh  a, [hLinkPositionY]                      ; $7CB7: $F0 $99
    sub  [hl]                                     ; $7CB9: $96
    cp   $28                                      ; $7CBA: $FE $28
    jr   nc, jr_005_7CE8                          ; $7CBC: $30 $2A

    ld   hl, $C480                                ; $7CBE: $21 $80 $C4
    add  hl, bc                                   ; $7CC1: $09
    ld   a, [hl]                                  ; $7CC2: $7E
    and  a                                        ; $7CC3: $A7
    jr   nz, jr_005_7CE8                          ; $7CC4: $20 $22

    call GetRandomByte                            ; $7CC6: $CD $0D $28
    and  $7F                                      ; $7CC9: $E6 $7F
    add  $40                                      ; $7CCB: $C6 $40
    ld   [hl], a                                  ; $7CCD: $77
    and  $03                                      ; $7CCE: $E6 $03
    jr   z, jr_005_7D21                           ; $7CD0: $28 $4F

    dec  a                                        ; $7CD2: $3D
    jr   nz, jr_005_7CE8                          ; $7CD3: $20 $13

func_005_7CD5:
    call IncrementEntityWalkingAttr               ; $7CD5: $CD $12 $3B
    ld   [hl], $03                                ; $7CD8: $36 $03
    call label_3D7F                               ; $7CDA: $CD $7F $3D
    ld   hl, $C300                                ; $7CDD: $21 $00 $C3
    add  hl, bc                                   ; $7CE0: $09
    ld   [hl], $40                                ; $7CE1: $36 $40
    ld   a, $01                                   ; $7CE3: $3E $01
    jp   label_005_7D5F                           ; $7CE5: $C3 $5F $7D

label_005_7CE8:
jr_005_7CE8:
    ld   hl, wEntitiesCollisionsTable             ; $7CE8: $21 $A0 $C2
    add  hl, bc                                   ; $7CEB: $09
    ld   a, [hl]                                  ; $7CEC: $7E
    and  $03                                      ; $7CED: $E6 $03
    jr   z, jr_005_7D09                           ; $7CEF: $28 $18

    call label_C00                                ; $7CF1: $CD $00 $0C
    jr   z, jr_005_7D01                           ; $7CF4: $28 $0B

    ld   hl, wEntity0SpeedX                       ; $7CF6: $21 $40 $C2
    add  hl, bc                                   ; $7CF9: $09
    ld   a, [hl]                                  ; $7CFA: $7E
    xor  $F0                                      ; $7CFB: $EE $F0
    ld   [hl], a                                  ; $7CFD: $77
    jp   label_005_7D40                           ; $7CFE: $C3 $40 $7D

jr_005_7D01:
    ld   hl, wEntitiesUnknownTableB               ; $7D01: $21 $B0 $C2
    add  hl, bc                                   ; $7D04: $09
    ld   a, [hl]                                  ; $7D05: $7E
    xor  $01                                      ; $7D06: $EE $01
    ld   [hl], a                                  ; $7D08: $77

jr_005_7D09:
    call label_C00                                ; $7D09: $CD $00 $0C
    jr   nz, jr_005_7D40                          ; $7D0C: $20 $32

    ld   hl, wEntitiesUnknownTableB               ; $7D0E: $21 $B0 $C2
    add  hl, bc                                   ; $7D11: $09
    ld   a, [hl]                                  ; $7D12: $7E
    ld   e, a                                     ; $7D13: $5F
    ld   d, b                                     ; $7D14: $50
    ld   hl, $7B51                                ; $7D15: $21 $51 $7B
    add  hl, de                                   ; $7D18: $19
    ld   a, [hl]                                  ; $7D19: $7E
    ld   hl, wEntity0SpeedX                       ; $7D1A: $21 $40 $C2
    add  hl, bc                                   ; $7D1D: $09
    ld   [hl], a                                  ; $7D1E: $77
    jr   jr_005_7D48                              ; $7D1F: $18 $27

jr_005_7D21:
    call IsEntityFrameCounterZero                 ; $7D21: $CD $05 $0C
    ld   [hl], $60                                ; $7D24: $36 $60
    call label_C00                                ; $7D26: $CD $00 $0C
    ld   [hl], b                                  ; $7D29: $70
    call IncrementEntityWalkingAttr               ; $7D2A: $CD $12 $3B
    ld   [hl], $02                                ; $7D2D: $36 $02
    ld   hl, wEntitiesUnknownTableB               ; $7D2F: $21 $B0 $C2
    add  hl, bc                                   ; $7D32: $09
    ld   [hl], b                                  ; $7D33: $70
    ld   hl, wEntity0PosY                         ; $7D34: $21 $10 $C2
    add  hl, bc                                   ; $7D37: $09
    ld   a, [hl]                                  ; $7D38: $7E
    ld   hl, wEntitiesUnknownTableD               ; $7D39: $21 $D0 $C2
    add  hl, bc                                   ; $7D3C: $09
    ld   [hl], a                                  ; $7D3D: $77
    jr   jr_005_7D48                              ; $7D3E: $18 $08

label_005_7D40:
jr_005_7D40:
    ldh  a, [hFrameCounter]                       ; $7D40: $F0 $E7
    and  $07                                      ; $7D42: $E6 $07
    jr   z, jr_005_7D4E                           ; $7D44: $28 $08

    jr   jr_005_7D5A                              ; $7D46: $18 $12

jr_005_7D48:
    ldh  a, [hFrameCounter]                       ; $7D48: $F0 $E7
    and  $0F                                      ; $7D4A: $E6 $0F
    jr   nz, jr_005_7D5A                          ; $7D4C: $20 $0C

jr_005_7D4E:
    ld   hl, $C3D0                                ; $7D4E: $21 $D0 $C3
    add  hl, bc                                   ; $7D51: $09
    inc  [hl]                                     ; $7D52: $34
    ld   a, [hl]                                  ; $7D53: $7E
    cp   $03                                      ; $7D54: $FE $03
    jr   nz, jr_005_7D5A                          ; $7D56: $20 $02

    ld   [hl], $00                                ; $7D58: $36 $00

jr_005_7D5A:
    ld   hl, $C3D0                                ; $7D5A: $21 $D0 $C3
    add  hl, bc                                   ; $7D5D: $09
    ld   a, [hl]                                  ; $7D5E: $7E

label_005_7D5F:
    jp   label_3B0C                               ; $7D5F: $C3 $0C $3B

    ld   hl, wEntitiesUnknownTableB               ; $7D62: $21 $B0 $C2
    add  hl, bc                                   ; $7D65: $09
    ld   a, [hl]                                  ; $7D66: $7E
    and  a                                        ; $7D67: $A7
    jp   nz, label_005_7DDC                       ; $7D68: $C2 $DC $7D

    call IsEntityFrameCounterZero                 ; $7D6B: $CD $05 $0C
    cp   $02                                      ; $7D6E: $FE $02
    jr   nc, jr_005_7DCC                          ; $7D70: $30 $5A

    cp   $00                                      ; $7D72: $FE $00
    jr   z, jr_005_7DA8                           ; $7D74: $28 $32

    ld   hl, hLinkPositionY                       ; $7D76: $21 $99 $FF
    ld   a, [hl]                                  ; $7D79: $7E
    ld   hl, $C390                                ; $7D7A: $21 $90 $C3
    add  hl, bc                                   ; $7D7D: $09
    ld   [hl], a                                  ; $7D7E: $77
    call GetRandomByte                            ; $7D7F: $CD $0D $28
    and  $02                                      ; $7D82: $E6 $02
    jr   z, jr_005_7D92                           ; $7D84: $28 $0C

    call label_3D7F                               ; $7D86: $CD $7F $3D
    ld   hl, wEntity0SpeedY                       ; $7D89: $21 $50 $C2
    add  hl, bc                                   ; $7D8C: $09
    ld   [hl], $10                                ; $7D8D: $36 $10
    jp   label_005_7D97                           ; $7D8F: $C3 $97 $7D

jr_005_7D92:
    ld   a, $10                                   ; $7D92: $3E $10
    call label_3BAA                               ; $7D94: $CD $AA $3B

label_005_7D97:
    ld   hl, wEntity0PosY                         ; $7D97: $21 $10 $C2
    add  hl, bc                                   ; $7D9A: $09
    ld   a, [hl]                                  ; $7D9B: $7E
    add  $08                                      ; $7D9C: $C6 $08
    ld   hl, hLinkPositionY                       ; $7D9E: $21 $99 $FF
    cp   [hl]                                     ; $7DA1: $BE
    jp   nc, label_005_7DE8                       ; $7DA2: $D2 $E8 $7D

    jp   label_005_7DF0                           ; $7DA5: $C3 $F0 $7D

jr_005_7DA8:
    ld   hl, $C390                                ; $7DA8: $21 $90 $C3
    add  hl, bc                                   ; $7DAB: $09
    ld   a, [hl]                                  ; $7DAC: $7E
    sub  $08                                      ; $7DAD: $D6 $08
    ld   hl, wEntity0PosY                         ; $7DAF: $21 $10 $C2
    add  hl, bc                                   ; $7DB2: $09
    cp   [hl]                                     ; $7DB3: $BE
    jp   nc, label_005_7DF0                       ; $7DB4: $D2 $F0 $7D

    ld   hl, wEntitiesUnknownTableB               ; $7DB7: $21 $B0 $C2
    add  hl, bc                                   ; $7DBA: $09
    inc  [hl]                                     ; $7DBB: $34
    call label_3D7F                               ; $7DBC: $CD $7F $3D
    ld   hl, wEntity0SpeedY                       ; $7DBF: $21 $50 $C2
    add  hl, bc                                   ; $7DC2: $09
    ld   [hl], $F0                                ; $7DC3: $36 $F0
    ld   a, $16                                   ; $7DC5: $3E $16
    ldh  [hWaveSfx], a                                ; $7DC7: $E0 $F3
    jp   label_005_7DF0                           ; $7DC9: $C3 $F0 $7D

jr_005_7DCC:
    ld   hl, wEntity0SpeedX                       ; $7DCC: $21 $40 $C2
    add  hl, bc                                   ; $7DCF: $09
    and  $04                                      ; $7DD0: $E6 $04
    jr   nz, jr_005_7DD8                          ; $7DD2: $20 $04

    ld   [hl], $08                                ; $7DD4: $36 $08
    jr   jr_005_7DF0                              ; $7DD6: $18 $18

jr_005_7DD8:
    ld   [hl], $F8                                ; $7DD8: $36 $F8
    jr   jr_005_7DF0                              ; $7DDA: $18 $14

label_005_7DDC:
    ld   hl, wEntitiesUnknownTableD               ; $7DDC: $21 $D0 $C2
    add  hl, bc                                   ; $7DDF: $09
    ld   a, [hl]                                  ; $7DE0: $7E
    ld   hl, wEntity0PosY                         ; $7DE1: $21 $10 $C2
    add  hl, bc                                   ; $7DE4: $09
    cp   [hl]                                     ; $7DE5: $BE
    jr   c, jr_005_7DF0                           ; $7DE6: $38 $08

label_005_7DE8:
    call label_3D7F                               ; $7DE8: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $7DEB: $CD $12 $3B
    ld   [hl], $01                                ; $7DEE: $36 $01

label_005_7DF0:
jr_005_7DF0:
    ldh  a, [hFrameCounter]                       ; $7DF0: $F0 $E7
    and  $0F                                      ; $7DF2: $E6 $0F
    jr   nz, jr_005_7E02                          ; $7DF4: $20 $0C

    ld   hl, $C3D0                                ; $7DF6: $21 $D0 $C3
    add  hl, bc                                   ; $7DF9: $09
    inc  [hl]                                     ; $7DFA: $34
    ld   a, [hl]                                  ; $7DFB: $7E
    cp   $03                                      ; $7DFC: $FE $03
    jr   nz, jr_005_7E02                          ; $7DFE: $20 $02

    ld   [hl], $00                                ; $7E00: $36 $00

jr_005_7E02:
    ld   hl, $C3D0                                ; $7E02: $21 $D0 $C3
    add  hl, bc                                   ; $7E05: $09
    ld   a, [hl]                                  ; $7E06: $7E
    jp   label_3B0C                               ; $7E07: $C3 $0C $3B

    ld   hl, $C300                                ; $7E0A: $21 $00 $C3
    add  hl, bc                                   ; $7E0D: $09
    ld   a, [hl]                                  ; $7E0E: $7E
    and  a                                        ; $7E0F: $A7
    jr   z, jr_005_7E13                           ; $7E10: $28 $01

    ret                                           ; $7E12: $C9

jr_005_7E13:
    call label_C00                                ; $7E13: $CD $00 $0C
    cp   $02                                      ; $7E16: $FE $02
    jr   nc, jr_005_7E3A                          ; $7E18: $30 $20

    cp   $00                                      ; $7E1A: $FE $00
    jr   z, jr_005_7E35                           ; $7E1C: $28 $17

    ld   hl, $C350                                ; $7E1E: $21 $50 $C3
    add  hl, bc                                   ; $7E21: $09
    ld   [hl], $80                                ; $7E22: $36 $80
    ld   a, $01                                   ; $7E24: $3E $01
    call label_3B0C                               ; $7E26: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $7E29: $CD $12 $3B
    ld   [hl], $01                                ; $7E2C: $36 $01
    ld   hl, $C300                                ; $7E2E: $21 $00 $C3
    add  hl, bc                                   ; $7E31: $09
    ld   [hl], $40                                ; $7E32: $36 $40
    ret                                           ; $7E34: $C9

jr_005_7E35:
    call label_C00                                ; $7E35: $CD $00 $0C
    ld   [hl], $30                                ; $7E38: $36 $30

jr_005_7E3A:
    cp   $18                                      ; $7E3A: $FE $18
    jr   nz, jr_005_7E61                          ; $7E3C: $20 $23

    ld   a, $7D                                   ; $7E3E: $3E $7D
    call label_3B86                               ; $7E40: $CD $86 $3B
    jr   c, jr_005_7E61                           ; $7E43: $38 $1C

    ldh  a, [hScratchA]                           ; $7E45: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7E47: $21 $00 $C2
    add  hl, de                                   ; $7E4A: $19
    ld   [hl], a                                  ; $7E4B: $77
    ldh  a, [hScratchB]                           ; $7E4C: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7E4E: $21 $10 $C2
    add  hl, de                                   ; $7E51: $19
    ld   [hl], a                                  ; $7E52: $77
    ld   hl, wEntitiesUnknownTableB               ; $7E53: $21 $B0 $C2
    add  hl, de                                   ; $7E56: $19
    inc  [hl]                                     ; $7E57: $34
    push bc                                       ; $7E58: $C5
    ld   c, e                                     ; $7E59: $4B
    ld   b, d                                     ; $7E5A: $42
    ld   a, $18                                   ; $7E5B: $3E $18
    call label_3BAA                               ; $7E5D: $CD $AA $3B
    pop  bc                                       ; $7E60: $C1

jr_005_7E61:
    ld   hl, $C350                                ; $7E61: $21 $50 $C3
    add  hl, bc                                   ; $7E64: $09
    ld   [hl], $00                                ; $7E65: $36 $00
    ld   a, $04                                   ; $7E67: $3E $04
    jp   label_3B0C                               ; $7E69: $C3 $0C $3B

label_005_7E6C:
    ld   hl, wEntitiesUnknownTableC               ; $7E6C: $21 $C0 $C2
    add  hl, bc                                   ; $7E6F: $09
    ld   a, [hl]                                  ; $7E70: $7E
    rst  $00                                      ; $7E71: $C7
    ld   a, b                                     ; $7E72: $78
    ld   a, [hl]                                  ; $7E73: $7E
    adc  c                                        ; $7E74: $89
    ld   a, [hl]                                  ; $7E75: $7E
    sbc  b                                        ; $7E76: $98
    ld   a, [hl]                                  ; $7E77: $7E
    call IsEntityFrameCounterZero                 ; $7E78: $CD $05 $0C
    ld   [hl], $A0                                ; $7E7B: $36 $A0
    ld   hl, $C420                                ; $7E7D: $21 $20 $C4
    add  hl, bc                                   ; $7E80: $09
    ld   [hl], $FF                                ; $7E81: $36 $FF

label_005_7E83:
    ld   hl, wEntitiesUnknownTableC               ; $7E83: $21 $C0 $C2
    add  hl, bc                                   ; $7E86: $09
    inc  [hl]                                     ; $7E87: $34
    ret                                           ; $7E88: $C9

    call IsEntityFrameCounterZero                 ; $7E89: $CD $05 $0C
    ret  nz                                       ; $7E8C: $C0

    ld   [hl], $C0                                ; $7E8D: $36 $C0
    ld   hl, $C420                                ; $7E8F: $21 $20 $C4
    add  hl, bc                                   ; $7E92: $09
    ld   [hl], $FF                                ; $7E93: $36 $FF
    jp   label_005_7E83                           ; $7E95: $C3 $83 $7E

    call IsEntityFrameCounterZero                 ; $7E98: $CD $05 $0C
    jr   nz, jr_005_7ED4                          ; $7E9B: $20 $37

label_005_7E9D:
    ld   a, $1A                                   ; $7E9D: $3E $1A
    ldh  [hNoiseSfx], a                            ; $7E9F: $E0 $F4
    ldh  a, [hActiveEntityId]                     ; $7EA1: $F0 $EB
    cp   $63                                      ; $7EA3: $FE $63
    jp   z, label_005_758C                        ; $7EA5: $CA $8C $75

    call label_3F50                               ; $7EA8: $CD $50 $3F
    ld   e, $0F                                   ; $7EAB: $1E $0F
    ld   d, b                                     ; $7EAD: $50

jr_005_7EAE:
    ld   hl, wEntity0Type                         ; $7EAE: $21 $80 $C2
    add  hl, de                                   ; $7EB1: $19
    ld   a, [hl]                                  ; $7EB2: $7E
    and  a                                        ; $7EB3: $A7
    jr   z, jr_005_7EBF                           ; $7EB4: $28 $09

    ld   hl, $C430                                ; $7EB6: $21 $30 $C4
    add  hl, de                                   ; $7EB9: $19
    ld   a, [hl]                                  ; $7EBA: $7E
    and  $80                                      ; $7EBB: $E6 $80
    jr   nz, jr_005_7ECC                          ; $7EBD: $20 $0D

jr_005_7EBF:
    dec  e                                        ; $7EBF: $1D
    ld   a, e                                     ; $7EC0: $7B
    cp   $FF                                      ; $7EC1: $FE $FF
    jr   nz, jr_005_7EAE                          ; $7EC3: $20 $E9

    xor  a                                        ; $7EC5: $AF
    ld   [$C1CF], a                               ; $7EC6: $EA $CF $C1
    jp   label_27DD                               ; $7EC9: $C3 $DD $27

jr_005_7ECC:
    ldh  a, [hMapId]                              ; $7ECC: $F0 $F7
    cp   $05                                      ; $7ECE: $FE $05
    ret  nc                                       ; $7ED0: $D0

    jp   label_005_7ED7                           ; $7ED1: $C3 $D7 $7E

jr_005_7ED4:
    jp   label_005_7550                           ; $7ED4: $C3 $50 $75

label_005_7ED7:
    ld   hl, wIndoorARoomStatus                   ; $7ED7: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $7EDA: $F0 $F6
    ld   e, a                                     ; $7EDC: $5F
    ld   d, b                                     ; $7EDD: $50
    ldh  a, [hMapId]                              ; $7EDE: $F0 $F7
    cp   $FF                                      ; $7EE0: $FE $FF
    jr   nz, jr_005_7EE9                          ; $7EE2: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $7EE4: $21 $E0 $DD
    jr   jr_005_7EF2                              ; $7EE7: $18 $09

jr_005_7EE9:
    cp   $1A                                      ; $7EE9: $FE $1A
    jr   nc, jr_005_7EF2                          ; $7EEB: $30 $05

    cp   $06                                      ; $7EED: $FE $06
    jr   c, jr_005_7EF2                           ; $7EEF: $38 $01

    inc  d                                        ; $7EF1: $14

jr_005_7EF2:
    add  hl, de                                   ; $7EF2: $19
    set  5, [hl]                                  ; $7EF3: $CB $EE
    ret                                           ; $7EF5: $C9

    ld   c, $03                                   ; $7EF6: $0E $03
    ld   de, $7EF6                                ; $7EF8: $11 $F6 $7E
    call label_3C77                               ; $7EFB: $CD $77 $3C
    ld   hl, $C3D0                                ; $7EFE: $21 $D0 $C3
    add  hl, bc                                   ; $7F01: $09
    ld   a, [hl]                                  ; $7F02: $7E
    dec  a                                        ; $7F03: $3D
    ld   [hl], a                                  ; $7F04: $77
    jp   z, label_005_7B4B                        ; $7F05: $CA $4B $7B

    bit  4, a                                     ; $7F08: $CB $67
    ld   e, $01                                   ; $7F0A: $1E $01
    jr   z, jr_005_7F10                           ; $7F0C: $28 $02

    ld   e, $FF                                   ; $7F0E: $1E $FF

jr_005_7F10:
    bit  0, a                                     ; $7F10: $CB $47
    jr   nz, jr_005_7F1B                          ; $7F12: $20 $07

    ld   hl, wEntity0SpeedX                       ; $7F14: $21 $40 $C2
    add  hl, bc                                   ; $7F17: $09
    ld   a, [hl]                                  ; $7F18: $7E
    add  e                                        ; $7F19: $83
    ld   [hl], a                                  ; $7F1A: $77

jr_005_7F1B:
    jp   label_005_7AB1                           ; $7F1B: $C3 $B1 $7A

    ld   d, b                                     ; $7F1E: $50
    ld   bc, $0152                                ; $7F1F: $01 $52 $01
    ld   d, d                                     ; $7F22: $52
    ld   hl, $2150                                ; $7F23: $21 $50 $21
    ld   d, h                                     ; $7F26: $54
    ld   bc, $0156                                ; $7F27: $01 $56 $01
    ld   d, [hl]                                  ; $7F2A: $56
    ld   hl, $2154                                ; $7F2B: $21 $54 $21
    ld   a, [$DB74]                               ; $7F2E: $FA $74 $DB
    and  a                                        ; $7F31: $A7
    jp   z, label_005_7B4B                        ; $7F32: $CA $4B $7B

    ld   de, $7F1E                                ; $7F35: $11 $1E $7F
    call label_3BC0                               ; $7F38: $CD $C0 $3B
    ld   a, [$C50F]                               ; $7F3B: $FA $0F $C5
    ld   e, a                                     ; $7F3E: $5F
    ld   d, b                                     ; $7F3F: $50
    ld   hl, wEntity0PosY                         ; $7F40: $21 $10 $C2
    add  hl, de                                   ; $7F43: $19
    ldh  a, [$FFEF]                               ; $7F44: $F0 $EF
    ld   e, $00                                   ; $7F46: $1E $00
    cp   [hl]                                     ; $7F48: $BE
    jr   c, jr_005_7F4D                           ; $7F49: $38 $02

    ld   e, $02                                   ; $7F4B: $1E $02

jr_005_7F4D:
    ldh  a, [hFrameCounter]                       ; $7F4D: $F0 $E7
    rra                                           ; $7F4F: $1F
    rra                                           ; $7F50: $1F
    rra                                           ; $7F51: $1F
    rra                                           ; $7F52: $1F
    rra                                           ; $7F53: $1F
    and  $01                                      ; $7F54: $E6 $01
    add  e                                        ; $7F56: $83
    call label_3B0C                               ; $7F57: $CD $0C $3B
    call func_005_54C3                            ; $7F5A: $CD $C3 $54
    call func_005_5506                            ; $7F5D: $CD $06 $55
    ret  nc                                       ; $7F60: $D0

    ld   a, $96                                   ; $7F61: $3E $96
    jp   OpenDialogInTable1                       ; $7F63: $C3 $73 $23

    nop                                           ; $7F66: $00
    nop                                           ; $7F67: $00
    nop                                           ; $7F68: $00
    nop                                           ; $7F69: $00
    nop                                           ; $7F6A: $00
    nop                                           ; $7F6B: $00
    nop                                           ; $7F6C: $00
    nop                                           ; $7F6D: $00
    nop                                           ; $7F6E: $00
    nop                                           ; $7F6F: $00
    nop                                           ; $7F70: $00
    nop                                           ; $7F71: $00
    nop                                           ; $7F72: $00
    nop                                           ; $7F73: $00
    nop                                           ; $7F74: $00
    nop                                           ; $7F75: $00
    nop                                           ; $7F76: $00
    nop                                           ; $7F77: $00
    nop                                           ; $7F78: $00
    nop                                           ; $7F79: $00
    nop                                           ; $7F7A: $00
    nop                                           ; $7F7B: $00
    nop                                           ; $7F7C: $00
    nop                                           ; $7F7D: $00
    nop                                           ; $7F7E: $00
    nop                                           ; $7F7F: $00
    nop                                           ; $7F80: $00
    nop                                           ; $7F81: $00
    nop                                           ; $7F82: $00
    nop                                           ; $7F83: $00
    nop                                           ; $7F84: $00
    nop                                           ; $7F85: $00
    nop                                           ; $7F86: $00
    nop                                           ; $7F87: $00
    nop                                           ; $7F88: $00
    nop                                           ; $7F89: $00
    nop                                           ; $7F8A: $00
    nop                                           ; $7F8B: $00
    nop                                           ; $7F8C: $00
    nop                                           ; $7F8D: $00
    nop                                           ; $7F8E: $00
    nop                                           ; $7F8F: $00
    nop                                           ; $7F90: $00
    nop                                           ; $7F91: $00
    nop                                           ; $7F92: $00
    nop                                           ; $7F93: $00
    nop                                           ; $7F94: $00
    nop                                           ; $7F95: $00
    nop                                           ; $7F96: $00
    nop                                           ; $7F97: $00
    nop                                           ; $7F98: $00
    nop                                           ; $7F99: $00
    nop                                           ; $7F9A: $00
    nop                                           ; $7F9B: $00
    nop                                           ; $7F9C: $00
    nop                                           ; $7F9D: $00
    nop                                           ; $7F9E: $00
    nop                                           ; $7F9F: $00
    nop                                           ; $7FA0: $00
    nop                                           ; $7FA1: $00
    nop                                           ; $7FA2: $00
    nop                                           ; $7FA3: $00
    nop                                           ; $7FA4: $00
    nop                                           ; $7FA5: $00
    nop                                           ; $7FA6: $00
    nop                                           ; $7FA7: $00
    nop                                           ; $7FA8: $00
    nop                                           ; $7FA9: $00
    nop                                           ; $7FAA: $00
    nop                                           ; $7FAB: $00
    nop                                           ; $7FAC: $00
    nop                                           ; $7FAD: $00
    nop                                           ; $7FAE: $00
    nop                                           ; $7FAF: $00
    nop                                           ; $7FB0: $00
    nop                                           ; $7FB1: $00
    nop                                           ; $7FB2: $00
    nop                                           ; $7FB3: $00
    nop                                           ; $7FB4: $00
    nop                                           ; $7FB5: $00
    nop                                           ; $7FB6: $00
    nop                                           ; $7FB7: $00
    nop                                           ; $7FB8: $00
    nop                                           ; $7FB9: $00
    nop                                           ; $7FBA: $00
    nop                                           ; $7FBB: $00
    nop                                           ; $7FBC: $00
    nop                                           ; $7FBD: $00
    nop                                           ; $7FBE: $00
    nop                                           ; $7FBF: $00
    nop                                           ; $7FC0: $00
    nop                                           ; $7FC1: $00
    nop                                           ; $7FC2: $00
    nop                                           ; $7FC3: $00
    nop                                           ; $7FC4: $00
    nop                                           ; $7FC5: $00
    nop                                           ; $7FC6: $00
    nop                                           ; $7FC7: $00
    nop                                           ; $7FC8: $00
    nop                                           ; $7FC9: $00
    nop                                           ; $7FCA: $00
    nop                                           ; $7FCB: $00
    nop                                           ; $7FCC: $00
    nop                                           ; $7FCD: $00
    nop                                           ; $7FCE: $00
    nop                                           ; $7FCF: $00
    nop                                           ; $7FD0: $00
    nop                                           ; $7FD1: $00
    nop                                           ; $7FD2: $00
    nop                                           ; $7FD3: $00
    nop                                           ; $7FD4: $00
    nop                                           ; $7FD5: $00
    nop                                           ; $7FD6: $00
    nop                                           ; $7FD7: $00
    nop                                           ; $7FD8: $00
    nop                                           ; $7FD9: $00
    nop                                           ; $7FDA: $00
    nop                                           ; $7FDB: $00
    nop                                           ; $7FDC: $00
    nop                                           ; $7FDD: $00
    nop                                           ; $7FDE: $00
    nop                                           ; $7FDF: $00
    nop                                           ; $7FE0: $00
    nop                                           ; $7FE1: $00
    nop                                           ; $7FE2: $00
    nop                                           ; $7FE3: $00
    nop                                           ; $7FE4: $00
    nop                                           ; $7FE5: $00
    nop                                           ; $7FE6: $00
    nop                                           ; $7FE7: $00
    nop                                           ; $7FE8: $00
    nop                                           ; $7FE9: $00
    nop                                           ; $7FEA: $00
    nop                                           ; $7FEB: $00
    nop                                           ; $7FEC: $00
    nop                                           ; $7FED: $00
    nop                                           ; $7FEE: $00
    nop                                           ; $7FEF: $00
    nop                                           ; $7FF0: $00
    nop                                           ; $7FF1: $00
    nop                                           ; $7FF2: $00
    nop                                           ; $7FF3: $00
    nop                                           ; $7FF4: $00
    nop                                           ; $7FF5: $00
    nop                                           ; $7FF6: $00
    nop                                           ; $7FF7: $00
    nop                                           ; $7FF8: $00
    nop                                           ; $7FF9: $00
    nop                                           ; $7FFA: $00
    nop                                           ; $7FFB: $00
    nop                                           ; $7FFC: $00
    nop                                           ; $7FFD: $00
    nop                                           ; $7FFE: $00
    nop                                           ; $7FFF: $00
