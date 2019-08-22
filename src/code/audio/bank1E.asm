; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

    jp   label_01E_4009                           ; $4000: $C3 $09 $40

    jp   label_01E_4CFF                           ; $4003: $C3 $FF $4C

Func_01E_4006::
    jp   label_01E_401E                           ; $4006: $C3 $1E $40

label_01E_4009:
    ld   hl, $D300                                ; $4009: $21 $00 $D3

jr_01E_400C:
    ld   [hl], $00                                ; $400C: $36 $00
    inc  l                                        ; $400E: $2C
    jr   nz, jr_01E_400C                          ; $400F: $20 $FB

    ld   a, $80                                   ; $4011: $3E $80
    ldh  [rNR52], a                               ; $4013: $E0 $26
    ld   a, $77                                   ; $4015: $3E $77
    ldh  [rNR50], a                               ; $4017: $E0 $24
    ld   a, $FF                                   ; $4019: $3E $FF
    ldh  [rNR51], a                               ; $401B: $E0 $25
    ret                                           ; $401D: $C9

label_01E_401E:
    ld   hl, wActiveMusicTrack                                ; $401E: $21 $68 $D3
    ld   a, [hl+]                                 ; $4021: $2A
    and  a                                        ; $4022: $A7
    jr   nz, jr_01E_4039                          ; $4023: $20 $14

    call func_01E_403F                            ; $4025: $CD $3F $40

jr_01E_4028:
    call func_01E_4581                            ; $4028: $CD $81 $45

StopAllActiveAudioAndReturn::
    xor  a                                        ; $402B: $AF
    ld   [wActiveJingle], a                       ; $402C: $EA $60 $D3
    ld   [wActiveMusicTrack], a                   ; $402F: $EA $68 $D3
    ld   [wActiveWaveSfx], a                      ; $4032: $EA $70 $D3
    ld   [wActiveNoiseSfx], a                     ; $4035: $EA $78 $D3
    ret                                           ; $4038: $C9

jr_01E_4039:
    ld   [hl], a                                  ; $4039: $77
    call func_01E_4163                            ; $403A: $CD $63 $41
    jr   jr_01E_4028                              ; $403D: $18 $E9

func_01E_403F:
    ld   de, $D393                                ; $403F: $11 $93 $D3
    ld   hl, wActiveNoiseSfx                                ; $4042: $21 $78 $D3
    ld   a, [hl+]                                 ; $4045: $2A
    cp   $01                                      ; $4046: $FE $01
    jr   z, jr_01E_4050                           ; $4048: $28 $06

    ld   a, [hl]                                  ; $404A: $7E
    cp   $01                                      ; $404B: $FE $01
    jr   z, jr_01E_405B                           ; $404D: $28 $0C

    ret                                           ; $404F: $C9

jr_01E_4050:
    ld   a, $01                                   ; $4050: $3E $01
    ld   [$D379], a                               ; $4052: $EA $79 $D3
    ld   hl, Data_0E1_4068                        ; $4055: $21 $68 $40
    jp   label_01E_4072                           ; $4058: $C3 $72 $40

jr_01E_405B:
    ld   a, [de]                                  ; $405B: $1A
    dec  a                                        ; $405C: $3D
    ld   [de], a                                  ; $405D: $12
    ret  nz                                       ; $405E: $C0

    xor  a                                        ; $405F: $AF
    ld   [$D379], a                               ; $4060: $EA $79 $D3
    ld   hl, Data_0E1_406D                        ; $4063: $21 $6D $40
    jr   jr_01E_4072                              ; $4066: $18 $0A

Data_0E1_4068::
    db $3B
    db $80
    db $07
    db $C0
    db $02

Data_0E1_406D::
    db $00
    db $42
    db $02
    db $C0
    db $04

label_01E_4072:
jr_01E_4072:
    ld   b, $04                                   ; $4072: $06 $04
    ld   c, $20                                   ; $4074: $0E $20

jr_01E_4076:
    ld   a, [hl+]                                 ; $4076: $2A
    ld   [c], a                                   ; $4077: $E2
    inc  c                                        ; $4078: $0C
    dec  b                                        ; $4079: $05
    jr   nz, jr_01E_4076                          ; $407A: $20 $FA

    ld   a, [hl]                                  ; $407C: $7E
    ld   [de], a                                  ; $407D: $12
    ret                                           ; $407E: $C9

; Pointers table
Data_01E_407F::
    db   $09, $52, $56, $56, $6A, $5E, $74, $59, $AE, $5A, $A7, $5C, $B3, $5D, $EE, $5E
    db   $3C, $5F, $00, $50, $64, $60, $C2, $60, $23, $61, $A9, $62, $75, $64, $A5, $72
    db   $10, $66, $36, $66, $BF, $52, $62, $66, $A6, $7B, $77, $67, $33, $4B, $F1, $72
    db   $3F, $73, $9E, $73, $16, $74, $A8, $74, $46, $75, $92, $75, $00, $76, $3D, $77
    db   $00, $70, $2C, $70, $F0, $70, $58, $71, $A6, $71, $D4, $71, $3C, $72, $D3, $78
    db   $28, $4B, $93, $76, $0E, $63, $79, $69, $DF, $69, $21, $6A, $09, $6C, $38, $4C
    db   $6A, $5E, $74, $59, $B7, $66, $80, $6C, $05, $7A, $5A, $7A, $28, $7B, $7B, $65
    db   $28, $7C, $C9, $58, $9C, $67, $49, $6C, $AC, $52, $FF, $7C, $4B, $7D, $04, $7E

func_01E_40FF:
    inc  e                                        ; $40FF: $1C
    dec  a                                        ; $4100: $3D
    sla  a                                        ; $4101: $CB $27
    ld   c, a                                     ; $4103: $4F
    ld   b, $00                                   ; $4104: $06 $00
    add  hl, bc                                   ; $4106: $09
    ld   c, [hl]                                  ; $4107: $4E
    inc  hl                                       ; $4108: $23
    ld   b, [hl]                                  ; $4109: $46
    ld   l, c                                     ; $410A: $69
    ld   h, b                                     ; $410B: $60
    ld   a, h                                     ; $410C: $7C
    ret                                           ; $410D: $C9

func_01E_410E:
    push bc                                       ; $410E: $C5
    ld   c, $30                                   ; $410F: $0E $30

jr_01E_4111:
    ld   a, [hl+]                                 ; $4111: $2A
    ld   [c], a                                   ; $4112: $E2
    inc  c                                        ; $4113: $0C
    ld   a, c                                     ; $4114: $79
    cp   $40                                      ; $4115: $FE $40
    jr   nz, jr_01E_4111                          ; $4117: $20 $F8

    pop  bc                                       ; $4119: $C1
    ret                                           ; $411A: $C9

func_01E_411B:
    xor  a                                        ; $411B: $AF
    ld   [$D379], a                               ; $411C: $EA $79 $D3
    ld   [$D34F], a                               ; $411F: $EA $4F $D3
    ld   [$D398], a                               ; $4122: $EA $98 $D3
    ld   [$D393], a                               ; $4125: $EA $93 $D3
    ld   [$D3C9], a                               ; $4128: $EA $C9 $D3
    ld   [$D3A3], a                               ; $412B: $EA $A3 $D3
    ld   a, $08                                   ; $412E: $3E $08
    ldh  [rNR42], a                               ; $4130: $E0 $21
    ld   a, $80                                   ; $4132: $3E $80
    ldh  [rNR44], a                               ; $4134: $E0 $23
    ret                                           ; $4136: $C9

func_01E_4137:
jr_01E_4137:
    ld   a, [$D379]                               ; $4137: $FA $79 $D3
    cp   $05                                      ; $413A: $FE $05
    jp   z, label_01E_4D1D                                 ; $413C: $CA $1D $4D

    cp   $0C                                      ; $413F: $FE $0C
    jp   z, label_01E_4D1D                                 ; $4141: $CA $1D $4D

    cp   $1A                                      ; $4144: $FE $1A
    jp   z, label_01E_4D1D                                 ; $4146: $CA $1D $4D

    cp   $24                                      ; $4149: $FE $24
    jp   z, label_01E_4D1D                                 ; $414B: $CA $1D $4D

    cp   $2A                                      ; $414E: $FE $2A
    jp   z, label_01E_4D1D                                 ; $4150: $CA $1D $4D

    cp   $2E                                      ; $4153: $FE $2E
    jp   z, label_01E_4D1D                                 ; $4155: $CA $1D $4D

    cp   $3F                                      ; $4158: $FE $3F
    jp   z, label_01E_4D1D                                 ; $415A: $CA $1D $4D

    call func_01E_411B                            ; $415D: $CD $1B $41
    jp   label_01E_4D1D                                    ; $4160: $C3 $1D $4D

func_01E_4163:
    ld   b, a                                     ; $4163: $47
    ld   a, [$D3CE]                               ; $4164: $FA $CE $D3
    and  a                                        ; $4167: $A7
    jp   nz, StopAllActiveAudioAndReturn          ; $4168: $C2 $2B $40

    ld   a, b                                     ; $416B: $78
    cp   $FF                                      ; $416C: $FE $FF
    jr   z, jr_01E_4137                           ; $416E: $28 $C7

    cp   $11                                      ; $4170: $FE $11
    jr   nc, jr_01E_4177                          ; $4172: $30 $03

    jp   StopAllActiveAudioAndReturn              ; $4174: $C3 $2B $40

jr_01E_4177:
    cp   $21                                      ; $4177: $FE $21
    jr   nc, jr_01E_417F                          ; $4179: $30 $04

    add  $F0                                      ; $417B: $C6 $F0
    jr   jr_01E_4193                              ; $417D: $18 $14

jr_01E_417F:
    cp   $31                                      ; $417F: $FE $31
    jr   nc, jr_01E_4187                          ; $4181: $30 $04

    add  $F0                                      ; $4183: $C6 $F0
    jr   jr_01E_4193                              ; $4185: $18 $0C

jr_01E_4187:
    cp   $41                                      ; $4187: $FE $41
    jp   c, StopAllActiveAudioAndReturn                        ; $4189: $DA $2B $40

    cp   $61                                      ; $418C: $FE $61
    jp   nc, StopAllActiveAudioAndReturn                       ; $418E: $D2 $2B $40

    add  $E0                                      ; $4191: $C6 $E0

jr_01E_4193:
    dec  hl                                       ; $4193: $2B
    ld   [hl+], a                                 ; $4194: $22
    ld   [hl-], a                                 ; $4195: $32
    ld   a, [$D3CA]                               ; $4196: $FA $CA $D3
    ld   [$D3CB], a                               ; $4199: $EA $CB $D3
    ld   a, [hl+]                                 ; $419C: $2A
    ld   [$D3CA], a                               ; $419D: $EA $CA $D3
    ld   b, a                                     ; $41A0: $47
    ld   hl, Data_01E_407F                        ; $41A1: $21 $7F $40
    and  $7F                                      ; $41A4: $E6 $7F
    call func_01E_40FF                            ; $41A6: $CD $FF $40
    call func_01E_43C0                            ; $41A9: $CD $C0 $43
    jp   label_01E_4359                           ; $41AC: $C3 $59 $43

Data_01E_41AF::
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF
    db   $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00
    db   $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $00, $00

label_01E_432F:
    ld   a, [$D3E7]                               ; $432F: $FA $E7 $D3
    and  a                                        ; $4332: $A7
    jp   z, label_01E_473F                        ; $4333: $CA $3F $47

    xor  a                                        ; $4336: $AF
    ldh  [rNR30], a                               ; $4337: $E0 $1A
    ld   [$D3E7], a                               ; $4339: $EA $E7 $D3
    push hl                                       ; $433C: $E5
    ld   a, [$D336]                               ; $433D: $FA $36 $D3
    ld   l, a                                     ; $4340: $6F
    ld   a, [$D337]                               ; $4341: $FA $37 $D3
    ld   h, a                                     ; $4344: $67
    push bc                                       ; $4345: $C5
    ld   c, $30                                   ; $4346: $0E $30

jr_01E_4348:
    ld   a, [hl+]                                 ; $4348: $2A
    ld   [c], a                                   ; $4349: $E2
    inc  c                                        ; $434A: $0C
    ld   a, c                                     ; $434B: $79
    cp   $40                                      ; $434C: $FE $40
    jr   nz, jr_01E_4348                          ; $434E: $20 $F8

    ld   a, $80                                   ; $4350: $3E $80
    ldh  [rNR30], a                               ; $4352: $E0 $1A
    pop  bc                                       ; $4354: $C1
    pop  hl                                       ; $4355: $E1
    jp   label_01E_473F                           ; $4356: $C3 $3F $47

label_01E_4359:
    ld   a, [$D369]                               ; $4359: $FA $69 $D3
    ld   hl, Data_01E_41AF                        ; $435C: $21 $AF $41

jr_01E_435F:
    dec  a                                        ; $435F: $3D
    jr   z, jr_01E_436A                           ; $4360: $28 $08

    inc  hl                                       ; $4362: $23
    inc  hl                                       ; $4363: $23
    inc  hl                                       ; $4364: $23
    inc  hl                                       ; $4365: $23
    inc  hl                                       ; $4366: $23
    inc  hl                                       ; $4367: $23
    jr   jr_01E_435F                              ; $4368: $18 $F5

jr_01E_436A:
    ld   bc, $D355                                ; $436A: $01 $55 $D3
    ld   a, [hl+]                                 ; $436D: $2A
    ld   [bc], a                                  ; $436E: $02
    inc  c                                        ; $436F: $0C
    xor  a                                        ; $4370: $AF
    ld   [bc], a                                  ; $4371: $02
    inc  c                                        ; $4372: $0C
    ld   a, [hl+]                                 ; $4373: $2A
    ld   [bc], a                                  ; $4374: $02
    inc  c                                        ; $4375: $0C
    xor  a                                        ; $4376: $AF
    ld   [bc], a                                  ; $4377: $02
    inc  c                                        ; $4378: $0C
    ld   a, [hl+]                                 ; $4379: $2A
    ld   [bc], a                                  ; $437A: $02
    ldh  [rNR51], a                               ; $437B: $E0 $25
    inc  c                                        ; $437D: $0C
    ld   a, [hl+]                                 ; $437E: $2A
    ld   [bc], a                                  ; $437F: $02
    inc  c                                        ; $4380: $0C
    ld   a, [hl+]                                 ; $4381: $2A
    ld   [bc], a                                  ; $4382: $02
    inc  c                                        ; $4383: $0C
    ld   a, [hl+]                                 ; $4384: $2A
    ld   [bc], a                                  ; $4385: $02
    ret                                           ; $4386: $C9

func_01E_4387:
    ld   hl, $D355                                ; $4387: $21 $55 $D3
    ld   a, [hl+]                                 ; $438A: $2A
    cp   $01                                      ; $438B: $FE $01
    ret  z                                        ; $438D: $C8

    inc  [hl]                                     ; $438E: $34
    ld   a, [hl+]                                 ; $438F: $2A
    cp   [hl]                                     ; $4390: $BE
    ret  nz                                       ; $4391: $C0

    dec  l                                        ; $4392: $2D
    ld   [hl], $00                                ; $4393: $36 $00
    inc  l                                        ; $4395: $2C
    inc  l                                        ; $4396: $2C
    inc  [hl]                                     ; $4397: $34
    ld   a, [hl+]                                 ; $4398: $2A
    and  $03                                      ; $4399: $E6 $03
    ld   c, l                                     ; $439B: $4D
    ld   b, h                                     ; $439C: $44
    and  a                                        ; $439D: $A7
    jr   z, jr_01E_43AB                           ; $439E: $28 $0B

    inc  c                                        ; $43A0: $0C
    cp   $01                                      ; $43A1: $FE $01
    jr   z, jr_01E_43AB                           ; $43A3: $28 $06

    inc  c                                        ; $43A5: $0C
    cp   $02                                      ; $43A6: $FE $02
    jr   z, jr_01E_43AB                           ; $43A8: $28 $01

    inc  c                                        ; $43AA: $0C

jr_01E_43AB:
    ld   a, [bc]                                  ; $43AB: $0A
    ldh  [rNR51], a                               ; $43AC: $E0 $25
    ret                                           ; $43AE: $C9

func_01E_43AF:
    ld   a, [hl+]                                 ; $43AF: $2A
    ld   c, a                                     ; $43B0: $4F
    ld   a, [hl]                                  ; $43B1: $7E
    ld   b, a                                     ; $43B2: $47
    ld   a, [bc]                                  ; $43B3: $0A
    ld   [de], a                                  ; $43B4: $12
    inc  e                                        ; $43B5: $1C
    inc  bc                                       ; $43B6: $03
    ld   a, [bc]                                  ; $43B7: $0A
    ld   [de], a                                  ; $43B8: $12
    ret                                           ; $43B9: $C9

func_01E_43BA:
    ld   a, [hl+]                                 ; $43BA: $2A
    ld   [de], a                                  ; $43BB: $12
    inc  e                                        ; $43BC: $1C
    ld   a, [hl+]                                 ; $43BD: $2A
    ld   [de], a                                  ; $43BE: $12
    ret                                           ; $43BF: $C9

func_01E_43C0:
    ld   a, [$D379]                               ; $43C0: $FA $79 $D3
    cp   $05                                      ; $43C3: $FE $05
    jr   z, jr_01E_43E2                           ; $43C5: $28 $1B

    cp   $0C                                      ; $43C7: $FE $0C
    jr   z, jr_01E_43E2                           ; $43C9: $28 $17

    cp   $1A                                      ; $43CB: $FE $1A
    jr   z, jr_01E_43E2                           ; $43CD: $28 $13

    cp   $24                                      ; $43CF: $FE $24
    jr   z, jr_01E_43E2                           ; $43D1: $28 $0F

    cp   $2A                                      ; $43D3: $FE $2A
    jr   z, jr_01E_43E2                           ; $43D5: $28 $0B

    cp   $2E                                      ; $43D7: $FE $2E
    jr   z, jr_01E_43E2                           ; $43D9: $28 $07

    cp   $3F                                      ; $43DB: $FE $3F
    jr   z, jr_01E_43E2                           ; $43DD: $28 $03

    call func_01E_411B                            ; $43DF: $CD $1B $41

jr_01E_43E2:
    call $4D2A                                    ; $43E2: $CD $2A $4D
    ld   de, $D300                                ; $43E5: $11 $00 $D3
    ld   b, $00                                   ; $43E8: $06 $00
    ld   a, [hl+]                                 ; $43EA: $2A
    ld   [de], a                                  ; $43EB: $12
    inc  e                                        ; $43EC: $1C
    call func_01E_43BA                            ; $43ED: $CD $BA $43
    ld   de, $D310                                ; $43F0: $11 $10 $D3
    call func_01E_43BA                            ; $43F3: $CD $BA $43
    ld   de, $D320                                ; $43F6: $11 $20 $D3
    call func_01E_43BA                            ; $43F9: $CD $BA $43
    ld   de, $D330                                ; $43FC: $11 $30 $D3
    call func_01E_43BA                            ; $43FF: $CD $BA $43
    ld   de, $D340                                ; $4402: $11 $40 $D3
    call func_01E_43BA                            ; $4405: $CD $BA $43
    ld   hl, $D310                                ; $4408: $21 $10 $D3
    ld   de, $D314                                ; $440B: $11 $14 $D3
    call func_01E_43AF                            ; $440E: $CD $AF $43
    ld   hl, $D320                                ; $4411: $21 $20 $D3
    ld   de, $D324                                ; $4414: $11 $24 $D3
    call func_01E_43AF                            ; $4417: $CD $AF $43
    ld   hl, $D330                                ; $441A: $21 $30 $D3
    ld   de, $D334                                ; $441D: $11 $34 $D3
    call func_01E_43AF                            ; $4420: $CD $AF $43
    ld   hl, $D340                                ; $4423: $21 $40 $D3
    ld   de, $D344                                ; $4426: $11 $44 $D3
    call func_01E_43AF                            ; $4429: $CD $AF $43
    ld   bc, $0410                                ; $442C: $01 $10 $04
    ld   hl, $D312                                ; $442F: $21 $12 $D3

jr_01E_4432:
    ld   [hl], $01                                ; $4432: $36 $01
    ld   a, c                                     ; $4434: $79
    add  l                                        ; $4435: $85
    ld   l, a                                     ; $4436: $6F
    dec  b                                        ; $4437: $05
    jr   nz, jr_01E_4432                          ; $4438: $20 $F8

    xor  a                                        ; $443A: $AF
    ld   [$D31E], a                               ; $443B: $EA $1E $D3
    ld   [$D32E], a                               ; $443E: $EA $2E $D3
    ld   [$D33E], a                               ; $4441: $EA $3E $D3
    ret                                           ; $4444: $C9

jr_01E_4445:
    push hl                                       ; $4445: $E5
    ld   a, [$D371]                               ; $4446: $FA $71 $D3
    and  a                                        ; $4449: $A7
    jr   nz, jr_01E_4454                          ; $444A: $20 $08

    xor  a                                        ; $444C: $AF
    ldh  [rNR30], a                               ; $444D: $E0 $1A
    ld   l, e                                     ; $444F: $6B
    ld   h, d                                     ; $4450: $62
    call func_01E_410E                            ; $4451: $CD $0E $41

jr_01E_4454:
    pop  hl                                       ; $4454: $E1
    jr   jr_01E_4481                              ; $4455: $18 $2A

label_01E_4457:
    call func_01E_4487                            ; $4457: $CD $87 $44
    call func_01E_449C                            ; $445A: $CD $9C $44
    ld   e, a                                     ; $445D: $5F
    call func_01E_4487                            ; $445E: $CD $87 $44
    call func_01E_449C                            ; $4461: $CD $9C $44
    ld   d, a                                     ; $4464: $57
    call func_01E_4487                            ; $4465: $CD $87 $44
    call func_01E_449C                            ; $4468: $CD $9C $44
    ld   c, a                                     ; $446B: $4F
    inc  l                                        ; $446C: $2C
    inc  l                                        ; $446D: $2C
    ld   [hl], e                                  ; $446E: $73
    inc  l                                        ; $446F: $2C
    ld   [hl], d                                  ; $4470: $72
    inc  l                                        ; $4471: $2C
    ld   [hl], c                                  ; $4472: $71
    dec  l                                        ; $4473: $2D
    dec  l                                        ; $4474: $2D
    dec  l                                        ; $4475: $2D
    dec  l                                        ; $4476: $2D
    push hl                                       ; $4477: $E5
    ld   hl, $D350                                ; $4478: $21 $50 $D3
    ld   a, [hl]                                  ; $447B: $7E
    pop  hl                                       ; $447C: $E1
    cp   $03                                      ; $447D: $FE $03
    jr   z, jr_01E_4445                           ; $447F: $28 $C4

jr_01E_4481:
    call func_01E_4487                            ; $4481: $CD $87 $44
    jp   label_01E_45A5                           ; $4484: $C3 $A5 $45

func_01E_4487:
    push de                                       ; $4487: $D5
    ld   a, [hl+]                                 ; $4488: $2A
    ld   e, a                                     ; $4489: $5F
    ld   a, [hl-]                                 ; $448A: $3A
    ld   d, a                                     ; $448B: $57
    inc  de                                       ; $448C: $13

jr_01E_448D:
    ld   a, e                                     ; $448D: $7B
    ld   [hl+], a                                 ; $448E: $22
    ld   a, d                                     ; $448F: $7A
    ld   [hl-], a                                 ; $4490: $32
    pop  de                                       ; $4491: $D1
    ret                                           ; $4492: $C9

func_01E_4493:
    push de                                       ; $4493: $D5
    ld   a, [hl+]                                 ; $4494: $2A
    ld   e, a                                     ; $4495: $5F
    ld   a, [hl-]                                 ; $4496: $3A
    ld   d, a                                     ; $4497: $57
    inc  de                                       ; $4498: $13
    inc  de                                       ; $4499: $13
    jr   jr_01E_448D                              ; $449A: $18 $F1

func_01E_449C:
    ld   a, [hl+]                                 ; $449C: $2A
    ld   c, a                                     ; $449D: $4F
    ld   a, [hl-]                                 ; $449E: $3A
    ld   b, a                                     ; $449F: $47
    ld   a, [bc]                                  ; $44A0: $0A
    ld   b, a                                     ; $44A1: $47
    ret                                           ; $44A2: $C9

jr_01E_44A3:
    pop  hl                                       ; $44A3: $E1
    jr   jr_01E_44D7                              ; $44A4: $18 $31

label_01E_44A6:
    ld   a, [$D350]                               ; $44A6: $FA $50 $D3
    cp   $03                                      ; $44A9: $FE $03
    jr   nz, jr_01E_44BD                          ; $44AB: $20 $10

    ld   a, [$D338]                               ; $44AD: $FA $38 $D3
    bit  7, a                                     ; $44B0: $CB $7F
    jr   z, jr_01E_44BD                           ; $44B2: $28 $09

    ld   a, [hl]                                  ; $44B4: $7E
    cp   $06                                      ; $44B5: $FE $06
    jr   nz, jr_01E_44BD                          ; $44B7: $20 $04

    ld   a, $40                                   ; $44B9: $3E $40
    ldh  [rNR32], a                               ; $44BB: $E0 $1C

jr_01E_44BD:
    push hl                                       ; $44BD: $E5
    ld   a, l                                     ; $44BE: $7D
    add  $09                                      ; $44BF: $C6 $09
    ld   l, a                                     ; $44C1: $6F
    ld   a, [hl]                                  ; $44C2: $7E
    and  a                                        ; $44C3: $A7
    jr   nz, jr_01E_44A3                          ; $44C4: $20 $DD

    ld   a, l                                     ; $44C6: $7D
    add  $04                                      ; $44C7: $C6 $04
    ld   l, a                                     ; $44C9: $6F
    bit  7, [hl]                                  ; $44CA: $CB $7E
    jr   nz, jr_01E_44A3                          ; $44CC: $20 $D5

    pop  hl                                       ; $44CE: $E1
    call func_01E_4772                            ; $44CF: $CD $72 $47
    push hl                                       ; $44D2: $E5
    call func_01E_47F6                            ; $44D3: $CD $F6 $47
    pop  hl                                       ; $44D6: $E1

label_01E_44D7:
jr_01E_44D7:
    dec  l                                        ; $44D7: $2D
    dec  l                                        ; $44D8: $2D
    jp   label_01E_4752                           ; $44D9: $C3 $52 $47

label_01E_44DC:
    dec  l                                        ; $44DC: $2D
    dec  l                                        ; $44DD: $2D
    dec  l                                        ; $44DE: $2D
    dec  l                                        ; $44DF: $2D
    call func_01E_4493                            ; $44E0: $CD $93 $44

jr_01E_44E3:
    ld   a, l                                     ; $44E3: $7D
    add  $04                                      ; $44E4: $C6 $04
    ld   e, a                                     ; $44E6: $5F
    ld   d, h                                     ; $44E7: $54
    call func_01E_43AF                            ; $44E8: $CD $AF $43
    cp   $00                                      ; $44EB: $FE $00
    jr   z, jr_01E_450E                           ; $44ED: $28 $1F

    cp   $FF                                      ; $44EF: $FE $FF
    jr   z, jr_01E_44F7                           ; $44F1: $28 $04

    inc  l                                        ; $44F3: $2C
    jp   label_01E_45A3                           ; $44F4: $C3 $A3 $45

jr_01E_44F7:
    dec  l                                        ; $44F7: $2D
    push hl                                       ; $44F8: $E5
    call func_01E_4493                            ; $44F9: $CD $93 $44
    call func_01E_449C                            ; $44FC: $CD $9C $44
    ld   e, a                                     ; $44FF: $5F
    call func_01E_4487                            ; $4500: $CD $87 $44
    call func_01E_449C                            ; $4503: $CD $9C $44
    ld   d, a                                     ; $4506: $57
    pop  hl                                       ; $4507: $E1
    ld   a, e                                     ; $4508: $7B
    ld   [hl+], a                                 ; $4509: $22
    ld   a, d                                     ; $450A: $7A
    ld   [hl-], a                                 ; $450B: $32
    jr   jr_01E_44E3                              ; $450C: $18 $D5

jr_01E_450E:
    ld   a, [$D3CA]                               ; $450E: $FA $CA $D3
    cp   $15                                      ; $4511: $FE $15
    jp   z, label_01E_4854                        ; $4513: $CA $54 $48

    ld   hl, $D369                                ; $4516: $21 $69 $D3
    ld   [hl], $00                                ; $4519: $36 $00
    call func_01E_4137                            ; $451B: $CD $37 $41
    ret                                           ; $451E: $C9

label_01E_451F:
    call func_01E_4487                            ; $451F: $CD $87 $44
    call func_01E_449C                            ; $4522: $CD $9C $44
    ld   [$D301], a                               ; $4525: $EA $01 $D3
    call func_01E_4487                            ; $4528: $CD $87 $44
    call func_01E_449C                            ; $452B: $CD $9C $44
    ld   [$D302], a                               ; $452E: $EA $02 $D3
    jr   jr_01E_453C                              ; $4531: $18 $09

label_01E_4533:
    call func_01E_4487                            ; $4533: $CD $87 $44
    call func_01E_449C                            ; $4536: $CD $9C $44
    ld   [$D300], a                               ; $4539: $EA $00 $D3

jr_01E_453C:
    call func_01E_4487                            ; $453C: $CD $87 $44
    jr   jr_01E_45A5                              ; $453F: $18 $64

label_01E_4541:
    call func_01E_4487                            ; $4541: $CD $87 $44
    call func_01E_449C                            ; $4544: $CD $9C $44
    push hl                                       ; $4547: $E5
    ld   a, l                                     ; $4548: $7D
    add  $0B                                      ; $4549: $C6 $0B
    ld   l, a                                     ; $454B: $6F
    ld   c, [hl]                                  ; $454C: $4E
    ld   a, b                                     ; $454D: $78
    or   c                                        ; $454E: $B1
    ld   [hl], a                                  ; $454F: $77
    ld   b, h                                     ; $4550: $44
    ld   c, l                                     ; $4551: $4D
    dec  c                                        ; $4552: $0D
    dec  c                                        ; $4553: $0D
    pop  hl                                       ; $4554: $E1
    ld   a, [hl+]                                 ; $4555: $2A
    ld   e, a                                     ; $4556: $5F
    ld   a, [hl-]                                 ; $4557: $3A
    ld   d, a                                     ; $4558: $57
    inc  de                                       ; $4559: $13
    ld   a, e                                     ; $455A: $7B
    ld   [hl+], a                                 ; $455B: $22
    ld   a, d                                     ; $455C: $7A
    ld   [hl-], a                                 ; $455D: $32
    ld   a, d                                     ; $455E: $7A
    ld   [bc], a                                  ; $455F: $02
    dec  c                                        ; $4560: $0D
    ld   a, e                                     ; $4561: $7B
    ld   [bc], a                                  ; $4562: $02
    jr   jr_01E_45A5                              ; $4563: $18 $40

label_01E_4565:
    push hl                                       ; $4565: $E5
    ld   a, l                                     ; $4566: $7D
    add  $0B                                      ; $4567: $C6 $0B
    ld   l, a                                     ; $4569: $6F
    ld   a, [hl]                                  ; $456A: $7E
    dec  [hl]                                     ; $456B: $35
    ld   a, [hl]                                  ; $456C: $7E
    and  $7F                                      ; $456D: $E6 $7F
    jr   z, jr_01E_457E                           ; $456F: $28 $0D

    ld   b, h                                     ; $4571: $44
    ld   c, l                                     ; $4572: $4D
    dec  c                                        ; $4573: $0D
    dec  c                                        ; $4574: $0D
    dec  c                                        ; $4575: $0D
    pop  hl                                       ; $4576: $E1
    ld   a, [bc]                                  ; $4577: $0A
    ld   [hl+], a                                 ; $4578: $22
    inc  c                                        ; $4579: $0C
    ld   a, [bc]                                  ; $457A: $0A
    ld   [hl-], a                                 ; $457B: $32
    jr   jr_01E_45A5                              ; $457C: $18 $27

jr_01E_457E:
    pop  hl                                       ; $457E: $E1
    jr   jr_01E_453C                              ; $457F: $18 $BB

func_01E_4581:
    ld   hl, $D369                                ; $4581: $21 $69 $D3
    ld   a, [hl]                                  ; $4584: $7E
    and  a                                        ; $4585: $A7
    ret  z                                        ; $4586: $C8

    ld   a, [$D3CE]                               ; $4587: $FA $CE $D3
    and  a                                        ; $458A: $A7
    jp   nz, StopAllActiveAudioAndReturn                       ; $458B: $C2 $2B $40

    call func_01E_4387                            ; $458E: $CD $87 $43
    ld   a, $01                                   ; $4591: $3E $01
    ld   [$D350], a                               ; $4593: $EA $50 $D3
    ld   hl, $D310                                ; $4596: $21 $10 $D3

label_01E_4599:
    inc  l                                        ; $4599: $2C
    ld   a, [hl+]                                 ; $459A: $2A
    and  a                                        ; $459B: $A7
    jp   z, label_01E_44D7                        ; $459C: $CA $D7 $44

    dec  [hl]                                     ; $459F: $35
    jp   nz, label_01E_44A6                       ; $45A0: $C2 $A6 $44

label_01E_45A3:
    inc  l                                        ; $45A3: $2C
    inc  l                                        ; $45A4: $2C

label_01E_45A5:
jr_01E_45A5:
    call func_01E_449C                            ; $45A5: $CD $9C $44
    cp   $00                                      ; $45A8: $FE $00
    jp   z, label_01E_44DC                        ; $45AA: $CA $DC $44

    cp   $9D                                      ; $45AD: $FE $9D
    jp   z, label_01E_4457                        ; $45AF: $CA $57 $44

    cp   $9E                                      ; $45B2: $FE $9E
    jp   z, label_01E_451F                        ; $45B4: $CA $1F $45

    cp   $9F                                      ; $45B7: $FE $9F
    jp   z, label_01E_4533                        ; $45B9: $CA $33 $45

    cp   $9B                                      ; $45BC: $FE $9B
    jp   z, label_01E_4541                        ; $45BE: $CA $41 $45

    cp   $9C                                      ; $45C1: $FE $9C
    jp   z, label_01E_4565                        ; $45C3: $CA $65 $45

    cp   $99                                      ; $45C6: $FE $99
    jp   z, label_01E_486E                        ; $45C8: $CA $6E $48

    cp   $9A                                      ; $45CB: $FE $9A
    jp   z, label_01E_4879                        ; $45CD: $CA $79 $48

    cp   $94                                      ; $45D0: $FE $94
    jp   z, label_01E_48B8                        ; $45D2: $CA $B8 $48

    cp   $97                                      ; $45D5: $FE $97
    jp   z, label_01E_48ED                        ; $45D7: $CA $ED $48

    cp   $98                                      ; $45DA: $FE $98
    jp   z, label_01E_48FC                        ; $45DC: $CA $FC $48

    cp   $96                                      ; $45DF: $FE $96
    jp   z, label_01E_4860                        ; $45E1: $CA $60 $48

    cp   $95                                      ; $45E4: $FE $95
    jp   z, label_01E_486B                        ; $45E6: $CA $6B $48

    and  $F0                                      ; $45E9: $E6 $F0
    cp   $A0                                      ; $45EB: $FE $A0
    jr   nz, jr_01E_463C                          ; $45ED: $20 $4D

    ld   a, b                                     ; $45EF: $78
    and  $0F                                      ; $45F0: $E6 $0F
    ld   c, a                                     ; $45F2: $4F
    ld   b, $00                                   ; $45F3: $06 $00
    push hl                                       ; $45F5: $E5
    ld   de, $D301                                ; $45F6: $11 $01 $D3
    ld   a, [de]                                  ; $45F9: $1A
    ld   l, a                                     ; $45FA: $6F
    inc  e                                        ; $45FB: $1C
    ld   a, [de]                                  ; $45FC: $1A
    ld   h, a                                     ; $45FD: $67
    add  hl, bc                                   ; $45FE: $09
    ld   a, [hl]                                  ; $45FF: $7E
    pop  hl                                       ; $4600: $E1
    push hl                                       ; $4601: $E5
    ld   d, a                                     ; $4602: $57
    inc  l                                        ; $4603: $2C
    inc  l                                        ; $4604: $2C
    inc  l                                        ; $4605: $2C
    ld   a, [hl]                                  ; $4606: $7E
    and  $F0                                      ; $4607: $E6 $F0
    jr   nz, jr_01E_460E                          ; $4609: $20 $03

    ld   a, d                                     ; $460B: $7A
    jr   jr_01E_4633                              ; $460C: $18 $25

jr_01E_460E:
    ld   e, a                                     ; $460E: $5F
    ld   a, d                                     ; $460F: $7A
    push af                                       ; $4610: $F5
    srl  a                                        ; $4611: $CB $3F
    sla  e                                        ; $4613: $CB $23
    jr   c, jr_01E_461F                           ; $4615: $38 $08

    ld   d, a                                     ; $4617: $57
    srl  a                                        ; $4618: $CB $3F
    sla  e                                        ; $461A: $CB $23
    jr   c, jr_01E_461F                           ; $461C: $38 $01

    add  d                                        ; $461E: $82

jr_01E_461F:
    ld   c, a                                     ; $461F: $4F
    and  a                                        ; $4620: $A7
    jr   nz, jr_01E_4625                          ; $4621: $20 $02

    ld   c, $02                                   ; $4623: $0E $02

jr_01E_4625:
    ld   de, $D350                                ; $4625: $11 $50 $D3
    ld   a, [de]                                  ; $4628: $1A
    dec  a                                        ; $4629: $3D
    ld   e, a                                     ; $462A: $5F
    ld   d, $00                                   ; $462B: $16 $00
    ld   hl, $D307                                ; $462D: $21 $07 $D3
    add  hl, de                                   ; $4630: $19
    ld   [hl], c                                  ; $4631: $71
    pop  af                                       ; $4632: $F1

jr_01E_4633:
    pop  hl                                       ; $4633: $E1
    dec  l                                        ; $4634: $2D
    ld   [hl+], a                                 ; $4635: $22
    call func_01E_4487                            ; $4636: $CD $87 $44
    call func_01E_449C                            ; $4639: $CD $9C $44

jr_01E_463C:
    ld   a, [$D350]                               ; $463C: $FA $50 $D3
    cp   $04                                      ; $463F: $FE $04
    jr   z, jr_01E_467B                           ; $4641: $28 $38

    push de                                       ; $4643: $D5
    ld   de, $D3B0                                ; $4644: $11 $B0 $D3
    call func_01E_493C                            ; $4647: $CD $3C $49
    xor  a                                        ; $464A: $AF
    ld   [de], a                                  ; $464B: $12
    inc  e                                        ; $464C: $1C
    ld   [de], a                                  ; $464D: $12
    ld   de, $D3B6                                ; $464E: $11 $B6 $D3
    call func_01E_493C                            ; $4651: $CD $3C $49
    inc  e                                        ; $4654: $1C
    xor  a                                        ; $4655: $AF
    ld   [de], a                                  ; $4656: $12
    ld   a, [$D350]                               ; $4657: $FA $50 $D3
    cp   $03                                      ; $465A: $FE $03
    jr   nz, jr_01E_467A                          ; $465C: $20 $1C

    ld   de, $D39E                                ; $465E: $11 $9E $D3
    ld   a, [de]                                  ; $4661: $1A
    and  a                                        ; $4662: $A7
    jr   z, jr_01E_466C                           ; $4663: $28 $07

    ld   a, $01                                   ; $4665: $3E $01
    ld   [de], a                                  ; $4667: $12
    xor  a                                        ; $4668: $AF
    ld   [$D39F], a                               ; $4669: $EA $9F $D3

jr_01E_466C:
    ld   de, $D3D9                                ; $466C: $11 $D9 $D3
    ld   a, [de]                                  ; $466F: $1A
    and  a                                        ; $4670: $A7
    jr   z, jr_01E_467A                           ; $4671: $28 $07

    ld   a, $01                                   ; $4673: $3E $01
    ld   [de], a                                  ; $4675: $12
    xor  a                                        ; $4676: $AF
    ld   [$D3DA], a                               ; $4677: $EA $DA $D3

jr_01E_467A:
    pop  de                                       ; $467A: $D1

jr_01E_467B:
    ld   c, b                                     ; $467B: $48
    ld   b, $00                                   ; $467C: $06 $00
    call func_01E_4487                            ; $467E: $CD $87 $44
    ld   a, [$D350]                               ; $4681: $FA $50 $D3
    cp   $04                                      ; $4684: $FE $04
    jp   z, label_01E_46BD                        ; $4686: $CA $BD $46

    push hl                                       ; $4689: $E5
    ld   a, l                                     ; $468A: $7D
    add  $05                                      ; $468B: $C6 $05
    ld   l, a                                     ; $468D: $6F
    ld   e, l                                     ; $468E: $5D
    ld   d, h                                     ; $468F: $54
    inc  l                                        ; $4690: $2C
    inc  l                                        ; $4691: $2C
    ld   a, c                                     ; $4692: $79
    cp   $01                                      ; $4693: $FE $01
    jr   z, jr_01E_46B8                           ; $4695: $28 $21

    ld   [hl], $00                                ; $4697: $36 $00
    ld   a, [$D300]                               ; $4699: $FA $00 $D3
    and  a                                        ; $469C: $A7
    jr   z, jr_01E_46AB                           ; $469D: $28 $0C

    ld   l, a                                     ; $469F: $6F
    ld   h, $00                                   ; $46A0: $26 $00
    bit  7, l                                     ; $46A2: $CB $7D
    jr   z, jr_01E_46A8                           ; $46A4: $28 $02

    ld   h, $FF                                   ; $46A6: $26 $FF

jr_01E_46A8:
    add  hl, bc                                   ; $46A8: $09
    ld   b, h                                     ; $46A9: $44
    ld   c, l                                     ; $46AA: $4D

jr_01E_46AB:
    ld   hl, $49BF                                ; $46AB: $21 $BF $49
    add  hl, bc                                   ; $46AE: $09
    ld   a, [hl+]                                 ; $46AF: $2A
    ld   [de], a                                  ; $46B0: $12
    inc  e                                        ; $46B1: $1C
    ld   a, [hl]                                  ; $46B2: $7E
    ld   [de], a                                  ; $46B3: $12
    pop  hl                                       ; $46B4: $E1
    jp   label_01E_46EE                           ; $46B5: $C3 $EE $46

jr_01E_46B8:
    ld   [hl], $01                                ; $46B8: $36 $01
    pop  hl                                       ; $46BA: $E1
    jr   jr_01E_46EE                              ; $46BB: $18 $31

label_01E_46BD:
    push hl                                       ; $46BD: $E5
    ld   a, c                                     ; $46BE: $79
    cp   $FF                                      ; $46BF: $FE $FF
    jr   z, jr_01E_46DB                           ; $46C1: $28 $18

    ld   de, $D346                                ; $46C3: $11 $46 $D3
    ld   hl, $4A51                                ; $46C6: $21 $51 $4A
    add  hl, bc                                   ; $46C9: $09

jr_01E_46CA:
    ld   a, [hl+]                                 ; $46CA: $2A
    ld   [de], a                                  ; $46CB: $12
    inc  e                                        ; $46CC: $1C
    ld   a, e                                     ; $46CD: $7B
    cp   $4B                                      ; $46CE: $FE $4B
    jr   nz, jr_01E_46CA                          ; $46D0: $20 $F8

    ld   c, $20                                   ; $46D2: $0E $20
    ld   hl, $D344                                ; $46D4: $21 $44 $D3
    ld   b, $00                                   ; $46D7: $06 $00
    jr   jr_01E_471C                              ; $46D9: $18 $41

jr_01E_46DB:
    ld   a, [$D34F]                               ; $46DB: $FA $4F $D3
    bit  7, a                                     ; $46DE: $CB $7F
    jp   nz, label_01E_474D                       ; $46E0: $C2 $4D $47

    ld   a, $01                                   ; $46E3: $3E $01
    ld   [wActiveNoiseSfx], a                               ; $46E5: $EA $78 $D3
    call func_01E_403F                            ; $46E8: $CD $3F $40
    jp   label_01E_474D                           ; $46EB: $C3 $4D $47

label_01E_46EE:
jr_01E_46EE:
    push hl                                       ; $46EE: $E5
    ld   b, $00                                   ; $46EF: $06 $00
    ld   a, [$D350]                               ; $46F1: $FA $50 $D3
    cp   $01                                      ; $46F4: $FE $01
    jr   z, jr_01E_4719                           ; $46F6: $28 $21

    cp   $02                                      ; $46F8: $FE $02
    jr   z, jr_01E_4715                           ; $46FA: $28 $19

    ld   c, $1A                                   ; $46FC: $0E $1A
    ld   a, [$D33F]                               ; $46FE: $FA $3F $D3
    bit  7, a                                     ; $4701: $CB $7F
    jr   nz, jr_01E_470A                          ; $4703: $20 $05

    xor  a                                        ; $4705: $AF
    ld   [c], a                                   ; $4706: $E2
    ld   a, $80                                   ; $4707: $3E $80
    ld   [c], a                                   ; $4709: $E2

jr_01E_470A:
    inc  c                                        ; $470A: $0C
    inc  l                                        ; $470B: $2C
    inc  l                                        ; $470C: $2C
    inc  l                                        ; $470D: $2C
    inc  l                                        ; $470E: $2C
    ld   a, [hl+]                                 ; $470F: $2A
    ld   e, a                                     ; $4710: $5F
    ld   d, $00                                   ; $4711: $16 $00
    jr   jr_01E_4723                              ; $4713: $18 $0E

jr_01E_4715:
    ld   c, $16                                   ; $4715: $0E $16
    jr   jr_01E_471C                              ; $4717: $18 $03

jr_01E_4719:
    ld   c, $10                                   ; $4719: $0E $10
    inc  c                                        ; $471B: $0C

jr_01E_471C:
    inc  l                                        ; $471C: $2C
    inc  l                                        ; $471D: $2C
    ld   a, [hl+]                                 ; $471E: $2A
    ld   e, a                                     ; $471F: $5F
    inc  l                                        ; $4720: $2C
    ld   a, [hl+]                                 ; $4721: $2A
    ld   d, a                                     ; $4722: $57

jr_01E_4723:
    push hl                                       ; $4723: $E5
    inc  l                                        ; $4724: $2C
    inc  l                                        ; $4725: $2C
    ld   a, [hl+]                                 ; $4726: $2A
    and  a                                        ; $4727: $A7
    jr   z, jr_01E_472C                           ; $4728: $28 $02

    ld   e, $08                                   ; $472A: $1E $08

jr_01E_472C:
    inc  l                                        ; $472C: $2C
    inc  l                                        ; $472D: $2C
    ld   [hl], $00                                ; $472E: $36 $00
    inc  l                                        ; $4730: $2C
    ld   a, [hl]                                  ; $4731: $7E
    pop  hl                                       ; $4732: $E1
    bit  7, a                                     ; $4733: $CB $7F
    jr   nz, jr_01E_474D                          ; $4735: $20 $16

    ld   a, [$D350]                               ; $4737: $FA $50 $D3
    cp   $03                                      ; $473A: $FE $03
    jp   z, label_01E_432F                        ; $473C: $CA $2F $43

label_01E_473F:
    ld   a, d                                     ; $473F: $7A
    or   b                                        ; $4740: $B0
    ld   [c], a                                   ; $4741: $E2
    inc  c                                        ; $4742: $0C
    ld   a, e                                     ; $4743: $7B
    ld   [c], a                                   ; $4744: $E2
    inc  c                                        ; $4745: $0C
    ld   a, [hl+]                                 ; $4746: $2A
    ld   [c], a                                   ; $4747: $E2
    inc  c                                        ; $4748: $0C
    ld   a, [hl]                                  ; $4749: $7E
    or   $80                                      ; $474A: $F6 $80
    ld   [c], a                                   ; $474C: $E2

label_01E_474D:
jr_01E_474D:
    pop  hl                                       ; $474D: $E1
    dec  l                                        ; $474E: $2D
    ld   a, [hl-]                                 ; $474F: $3A
    ld   [hl-], a                                 ; $4750: $32
    dec  l                                        ; $4751: $2D

label_01E_4752:
    ld   de, $D350                                ; $4752: $11 $50 $D3
    ld   a, [de]                                  ; $4755: $1A
    cp   $04                                      ; $4756: $FE $04
    jr   z, jr_01E_4763                           ; $4758: $28 $09

    inc  a                                        ; $475A: $3C
    ld   [de], a                                  ; $475B: $12
    ld   a, $10                                   ; $475C: $3E $10
    add  l                                        ; $475E: $85
    ld   l, a                                     ; $475F: $6F
    jp   label_01E_4599                           ; $4760: $C3 $99 $45

jr_01E_4763:
    ld   hl, $D31E                                ; $4763: $21 $1E $D3
    inc  [hl]                                     ; $4766: $34
    ld   hl, $D32E                                ; $4767: $21 $2E $D3
    inc  [hl]                                     ; $476A: $34
    ld   hl, $D33E                                ; $476B: $21 $3E $D3
    inc  [hl]                                     ; $476E: $34
    ret                                           ; $476F: $C9

label_01E_4770:
    pop  hl                                       ; $4770: $E1
    ret                                           ; $4771: $C9

func_01E_4772:
    push hl                                       ; $4772: $E5
    ld   a, l                                     ; $4773: $7D
    add  $06                                      ; $4774: $C6 $06
    ld   l, a                                     ; $4776: $6F
    ld   a, [hl]                                  ; $4777: $7E
    and  $0F                                      ; $4778: $E6 $0F
    jr   z, jr_01E_4794                           ; $477A: $28 $18

    ld   [$D351], a                               ; $477C: $EA $51 $D3
    ld   a, [$D350]                               ; $477F: $FA $50 $D3
    ld   c, $13                                   ; $4782: $0E $13
    cp   $01                                      ; $4784: $FE $01
    jr   z, jr_01E_47D6                           ; $4786: $28 $4E

    ld   c, $18                                   ; $4788: $0E $18
    cp   $02                                      ; $478A: $FE $02
    jr   z, jr_01E_47D6                           ; $478C: $28 $48

    ld   c, $1D                                   ; $478E: $0E $1D
    cp   $03                                      ; $4790: $FE $03
    jr   z, jr_01E_47D6                           ; $4792: $28 $42

label_01E_4794:
jr_01E_4794:
    ld   a, [$D350]                               ; $4794: $FA $50 $D3
    cp   $04                                      ; $4797: $FE $04
    jp   z, label_01E_4770                        ; $4799: $CA $70 $47

    ld   de, $D3B6                                ; $479C: $11 $B6 $D3
    call func_01E_493C                            ; $479F: $CD $3C $49
    ld   a, [de]                                  ; $47A2: $1A
    and  a                                        ; $47A3: $A7
    jp   z, label_01E_47BD                        ; $47A4: $CA $BD $47

    ld   a, [$D350]                               ; $47A7: $FA $50 $D3
    ld   c, $13                                   ; $47AA: $0E $13
    cp   $01                                      ; $47AC: $FE $01
    jp   z, label_01E_4905                        ; $47AE: $CA $05 $49

    ld   c, $18                                   ; $47B1: $0E $18
    cp   $02                                      ; $47B3: $FE $02
    jp   z, label_01E_4905                        ; $47B5: $CA $05 $49

    ld   c, $1D                                   ; $47B8: $0E $1D
    jp   label_01E_4905                           ; $47BA: $C3 $05 $49

label_01E_47BD:
    ld   a, [$D350]                               ; $47BD: $FA $50 $D3
    cp   $03                                      ; $47C0: $FE $03
    jp   nz, label_01E_4770                       ; $47C2: $C2 $70 $47

    ld   a, [$D39E]                               ; $47C5: $FA $9E $D3
    and  a                                        ; $47C8: $A7
    jp   nz, label_01E_4882                       ; $47C9: $C2 $82 $48

    ld   a, [$D3D9]                               ; $47CC: $FA $D9 $D3
    and  a                                        ; $47CF: $A7
    jp   nz, label_01E_48C3                       ; $47D0: $C2 $C3 $48

    jp   label_01E_4770                           ; $47D3: $C3 $70 $47

jr_01E_47D6:
    inc  l                                        ; $47D6: $2C
    ld   a, [hl+]                                 ; $47D7: $2A
    ld   e, a                                     ; $47D8: $5F
    ld   a, [hl]                                  ; $47D9: $7E
    and  $0F                                      ; $47DA: $E6 $0F
    ld   d, a                                     ; $47DC: $57
    push de                                       ; $47DD: $D5
    ld   a, l                                     ; $47DE: $7D
    add  $04                                      ; $47DF: $C6 $04
    ld   l, a                                     ; $47E1: $6F
    ld   b, [hl]                                  ; $47E2: $46
    ld   a, [$D351]                               ; $47E3: $FA $51 $D3
    cp   $01                                      ; $47E6: $FE $01
    jp   z, label_01E_4952                        ; $47E8: $CA $52 $49

    ld   hl, $FFFF                                ; $47EB: $21 $FF $FF
    pop  de                                       ; $47EE: $D1
    add  hl, de                                   ; $47EF: $19
    call func_01E_492B                            ; $47F0: $CD $2B $49
    jp   label_01E_4794                           ; $47F3: $C3 $94 $47

func_01E_47F6:
    ld   a, [$D31B]                               ; $47F6: $FA $1B $D3
    and  a                                        ; $47F9: $A7
    jr   nz, jr_01E_481D                          ; $47FA: $20 $21

    ld   a, [$D317]                               ; $47FC: $FA $17 $D3
    and  a                                        ; $47FF: $A7
    jr   z, jr_01E_481D                           ; $4800: $28 $1B

    and  $0F                                      ; $4802: $E6 $0F
    ld   b, a                                     ; $4804: $47
    ld   hl, $D307                                ; $4805: $21 $07 $D3
    ld   a, [$D31E]                               ; $4808: $FA $1E $D3
    cp   [hl]                                     ; $480B: $BE
    jr   nz, jr_01E_481D                          ; $480C: $20 $0F

    ld   c, $12                                   ; $480E: $0E $12
    ld   de, $D31A                                ; $4810: $11 $1A $D3
    ld   a, [$D31F]                               ; $4813: $FA $1F $D3
    bit  7, a                                     ; $4816: $CB $7F
    jr   nz, jr_01E_481D                          ; $4818: $20 $03

    call func_01E_4841                            ; $481A: $CD $41 $48

jr_01E_481D:
    ld   a, [$D32B]                               ; $481D: $FA $2B $D3
    and  a                                        ; $4820: $A7
    ret  nz                                       ; $4821: $C0

    ld   a, [$D327]                               ; $4822: $FA $27 $D3
    and  a                                        ; $4825: $A7
    ret  z                                        ; $4826: $C8

    and  $0F                                      ; $4827: $E6 $0F
    ld   b, a                                     ; $4829: $47
    ld   hl, $D308                                ; $482A: $21 $08 $D3
    ld   a, [$D32E]                               ; $482D: $FA $2E $D3
    cp   [hl]                                     ; $4830: $BE
    ret  nz                                       ; $4831: $C0

    ld   a, [$D32F]                               ; $4832: $FA $2F $D3
    bit  7, a                                     ; $4835: $CB $7F
    ret  nz                                       ; $4837: $C0

    ld   c, $17                                   ; $4838: $0E $17
    ld   de, $D32A                                ; $483A: $11 $2A $D3
    call func_01E_4841                            ; $483D: $CD $41 $48
    ret                                           ; $4840: $C9

func_01E_4841:
    push bc                                       ; $4841: $C5
    dec  b                                        ; $4842: $05
    ld   c, b                                     ; $4843: $48
    ld   b, $00                                   ; $4844: $06 $00
    ld   hl, $4B15                                ; $4846: $21 $15 $4B
    add  hl, bc                                   ; $4849: $09
    ld   a, [hl]                                  ; $484A: $7E
    pop  bc                                       ; $484B: $C1
    ld   [c], a                                   ; $484C: $E2
    inc  c                                        ; $484D: $0C
    inc  c                                        ; $484E: $0C
    ld   a, [de]                                  ; $484F: $1A
    or   $80                                      ; $4850: $F6 $80
    ld   [c], a                                   ; $4852: $E2
    ret                                           ; $4853: $C9

label_01E_4854:
    xor  a                                        ; $4854: $AF
    ld   [$D3CE], a                               ; $4855: $EA $CE $D3
    ldh  a, [$FFBF]                               ; $4858: $F0 $BF
    ld   [wActiveMusicTrack], a                               ; $485A: $EA $68 $D3
    jp   label_01E_401E                           ; $485D: $C3 $1E $40

label_01E_4860:
    ld   a, $01                                   ; $4860: $3E $01

jr_01E_4862:
    ld   [$D3CD], a                               ; $4862: $EA $CD $D3
    call func_01E_4487                            ; $4865: $CD $87 $44
    jp   label_01E_45A5                           ; $4868: $C3 $A5 $45

label_01E_486B:
    xor  a                                        ; $486B: $AF
    jr   jr_01E_4862                              ; $486C: $18 $F4

label_01E_486E:
    ld   a, $01                                   ; $486E: $3E $01

jr_01E_4870:
    ld   [$D39E], a                               ; $4870: $EA $9E $D3
    call func_01E_4487                            ; $4873: $CD $87 $44
    jp   label_01E_45A5                           ; $4876: $C3 $A5 $45

label_01E_4879:
    xor  a                                        ; $4879: $AF
    ld   [$D3D9], a                               ; $487A: $EA $D9 $D3
    ld   [$D3DA], a                               ; $487D: $EA $DA $D3
    jr   jr_01E_4870                              ; $4880: $18 $EE

label_01E_4882:
    cp   $02                                      ; $4882: $FE $02
    jp   z, label_01E_4770                        ; $4884: $CA $70 $47

    ld   bc, $D39F                                ; $4887: $01 $9F $D3
    call func_01E_48B4                            ; $488A: $CD $B4 $48
    ld   c, $1C                                   ; $488D: $0E $1C
    ld   b, $40                                   ; $488F: $06 $40
    cp   $03                                      ; $4891: $FE $03
    jr   z, jr_01E_48AF                           ; $4893: $28 $1A

    ld   b, $60                                   ; $4895: $06 $60
    cp   $05                                      ; $4897: $FE $05
    jr   z, jr_01E_48AF                           ; $4899: $28 $14

    cp   $0A                                      ; $489B: $FE $0A
    jr   z, jr_01E_48AF                           ; $489D: $28 $10

    ld   b, $00                                   ; $489F: $06 $00
    cp   $07                                      ; $48A1: $FE $07
    jr   z, jr_01E_48AF                           ; $48A3: $28 $0A

    cp   $0D                                      ; $48A5: $FE $0D
    jp   nz, label_01E_4770                       ; $48A7: $C2 $70 $47

    ld   a, $02                                   ; $48AA: $3E $02
    ld   [$D39E], a                               ; $48AC: $EA $9E $D3

label_01E_48AF:
jr_01E_48AF:
    ld   a, b                                     ; $48AF: $78
    ld   [c], a                                   ; $48B0: $E2
    jp   label_01E_4770                           ; $48B1: $C3 $70 $47

func_01E_48B4:
    ld   a, [bc]                                  ; $48B4: $0A
    inc  a                                        ; $48B5: $3C
    ld   [bc], a                                  ; $48B6: $02
    ret                                           ; $48B7: $C9

label_01E_48B8:
    ld   a, $01                                   ; $48B8: $3E $01
    ld   [$D3D9], a                               ; $48BA: $EA $D9 $D3
    call func_01E_4487                            ; $48BD: $CD $87 $44
    jp   label_01E_45A5                           ; $48C0: $C3 $A5 $45

label_01E_48C3:
    cp   $02                                      ; $48C3: $FE $02
    jp   z, label_01E_4770                        ; $48C5: $CA $70 $47

    ld   bc, $D3DA                                ; $48C8: $01 $DA $D3
    call func_01E_48B4                            ; $48CB: $CD $B4 $48
    ld   c, $1C                                   ; $48CE: $0E $1C
    ld   b, $60                                   ; $48D0: $06 $60
    cp   $03                                      ; $48D2: $FE $03
    jp   z, label_01E_48AF                        ; $48D4: $CA $AF $48

    ld   b, $40                                   ; $48D7: $06 $40
    cp   $05                                      ; $48D9: $FE $05
    jp   z, label_01E_48AF                        ; $48DB: $CA $AF $48

    ld   b, $20                                   ; $48DE: $06 $20
    cp   $06                                      ; $48E0: $FE $06
    jp   nz, label_01E_4770                       ; $48E2: $C2 $70 $47

    ld   a, $02                                   ; $48E5: $3E $02
    ld   [$D3D9], a                               ; $48E7: $EA $D9 $D3
    jp   label_01E_48AF                           ; $48EA: $C3 $AF $48

label_01E_48ED:
    ld   de, $D3B6                                ; $48ED: $11 $B6 $D3
    call func_01E_493C                            ; $48F0: $CD $3C $49
    ld   a, $01                                   ; $48F3: $3E $01

jr_01E_48F5:
    ld   [de], a                                  ; $48F5: $12
    call func_01E_4487                            ; $48F6: $CD $87 $44
    jp   label_01E_45A5                           ; $48F9: $C3 $A5 $45

label_01E_48FC:
    ld   de, $D3B6                                ; $48FC: $11 $B6 $D3
    call func_01E_493C                            ; $48FF: $CD $3C $49
    xor  a                                        ; $4902: $AF
    jr   jr_01E_48F5                              ; $4903: $18 $F0

label_01E_4905:
    inc  e                                        ; $4905: $1C
    ld   a, [de]                                  ; $4906: $1A
    and  a                                        ; $4907: $A7
    jr   nz, jr_01E_491B                          ; $4908: $20 $11

    inc  a                                        ; $490A: $3C
    ld   [de], a                                  ; $490B: $12
    pop  hl                                       ; $490C: $E1
    push hl                                       ; $490D: $E5
    call func_01E_4920                            ; $490E: $CD $20 $49

jr_01E_4911:
    ld   hl, $FF9C                                ; $4911: $21 $9C $FF
    add  hl, de                                   ; $4914: $19
    call func_01E_492B                            ; $4915: $CD $2B $49
    jp   label_01E_4770                           ; $4918: $C3 $70 $47

jr_01E_491B:
    call func_01E_4945                            ; $491B: $CD $45 $49
    jr   jr_01E_4911                              ; $491E: $18 $F1

func_01E_4920:
    ld   a, $07                                   ; $4920: $3E $07
    add  l                                        ; $4922: $85
    ld   l, a                                     ; $4923: $6F
    ld   a, [hl+]                                 ; $4924: $2A
    ld   e, a                                     ; $4925: $5F
    ld   a, [hl]                                  ; $4926: $7E
    and  $0F                                      ; $4927: $E6 $0F
    ld   d, a                                     ; $4929: $57
    ret                                           ; $492A: $C9

func_01E_492B:
    ld   de, $D3A4                                ; $492B: $11 $A4 $D3
    call func_01E_493C                            ; $492E: $CD $3C $49
    ld   a, l                                     ; $4931: $7D
    ld   [c], a                                   ; $4932: $E2
    ld   [de], a                                  ; $4933: $12
    inc  c                                        ; $4934: $0C
    inc  e                                        ; $4935: $1C
    ld   a, h                                     ; $4936: $7C
    and  $0F                                      ; $4937: $E6 $0F
    ld   [c], a                                   ; $4939: $E2
    ld   [de], a                                  ; $493A: $12
    ret                                           ; $493B: $C9

func_01E_493C:
    ld   a, [$D350]                               ; $493C: $FA $50 $D3
    dec  a                                        ; $493F: $3D
    sla  a                                        ; $4940: $CB $27
    add  e                                        ; $4942: $83
    ld   e, a                                     ; $4943: $5F
    ret                                           ; $4944: $C9

func_01E_4945:
    ld   de, $D3A4                                ; $4945: $11 $A4 $D3
    call func_01E_493C                            ; $4948: $CD $3C $49
    ld   a, [de]                                  ; $494B: $1A
    ld   l, a                                     ; $494C: $6F
    inc  e                                        ; $494D: $1C
    ld   a, [de]                                  ; $494E: $1A
    ld   d, a                                     ; $494F: $57
    ld   e, l                                     ; $4950: $5D
    ret                                           ; $4951: $C9

label_01E_4952:
    pop  de                                       ; $4952: $D1
    ld   de, $D3B0                                ; $4953: $11 $B0 $D3
    call func_01E_493C                            ; $4956: $CD $3C $49
    ld   a, [de]                                  ; $4959: $1A
    inc  a                                        ; $495A: $3C
    ld   [de], a                                  ; $495B: $12
    inc  e                                        ; $495C: $1C
    cp   $19                                      ; $495D: $FE $19
    jr   z, jr_01E_4992                           ; $495F: $28 $31

    cp   $2D                                      ; $4961: $FE $2D
    jr   z, jr_01E_498B                           ; $4963: $28 $26

    ld   a, [de]                                  ; $4965: $1A
    and  a                                        ; $4966: $A7
    jp   z, label_01E_4794                        ; $4967: $CA $94 $47

jr_01E_496A:
    dec  e                                        ; $496A: $1D
    ld   a, [de]                                  ; $496B: $1A
    sub  $19                                      ; $496C: $D6 $19
    sla  a                                        ; $496E: $CB $27
    ld   l, a                                     ; $4970: $6F
    ld   h, $00                                   ; $4971: $26 $00
    ld   de, Data_1E_4997                         ; $4973: $11 $97 $49
    add  hl, de                                   ; $4976: $19
    ld   a, [hl+]                                 ; $4977: $2A
    ld   d, a                                     ; $4978: $57
    ld   a, [hl]                                  ; $4979: $7E
    ld   e, a                                     ; $497A: $5F
    pop  hl                                       ; $497B: $E1
    push hl                                       ; $497C: $E5
    push de                                       ; $497D: $D5
    call func_01E_4920                            ; $497E: $CD $20 $49
    ld   h, d                                     ; $4981: $62
    ld   l, e                                     ; $4982: $6B
    pop  de                                       ; $4983: $D1
    add  hl, de                                   ; $4984: $19
    call func_01E_492B                            ; $4985: $CD $2B $49
    jp   label_01E_4794                           ; $4988: $C3 $94 $47

jr_01E_498B:
    dec  e                                        ; $498B: $1D
    ld   a, $19                                   ; $498C: $3E $19
    ld   [de], a                                  ; $498E: $12
    inc  e                                        ; $498F: $1C
    jr   jr_01E_496A                              ; $4990: $18 $D8

jr_01E_4992:
    ld   a, $01                                   ; $4992: $3E $01
    ld   [de], a                                  ; $4994: $12
    jr   jr_01E_496A                              ; $4995: $18 $D3

Data_1E_4997::
    db   $00, $00, $00, $00, $00, $01, $00, $01, $00, $02, $00, $02, $00, $00, $00, $00
    db   $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE, $00, $00, $00, $01, $00, $02, $00, $01
    db   $00, $00, $FF, $FF, $FF, $FE, $FF, $FF, $00, $0F, $2C, $00, $9C, $00, $06, $01
    db   $6B, $01, $C9, $01, $23, $02, $77, $02, $C6, $02, $12, $03, $56, $03, $9B, $03
    db   $DA, $03, $16, $04, $4E, $04, $83, $04, $B5, $04, $E5, $04, $11, $05, $3B, $05
    db   $63, $05, $89, $05, $AC, $05, $CE, $05, $ED, $05, $0A, $06, $27, $06, $42, $06
    db   $5B, $06, $72, $06, $89, $06, $9E, $06, $B2, $06, $C4, $06, $D6, $06, $E7, $06
    db   $F7, $06, $06, $07, $14, $07, $21, $07, $2D, $07, $39, $07, $44, $07, $4F, $07
    db   $59, $07, $62, $07, $6B, $07, $74, $07, $7B, $07, $83, $07, $8A, $07, $90, $07
    db   $97, $07, $9D, $07, $A2, $07, $A7, $07, $AC, $07, $B1, $07, $B6, $07, $BA, $07
    db   $BE, $07, $C1, $07, $C5, $07, $C8, $07, $CB, $07, $CE, $07, $D1, $07, $D4, $07
    db   $D6, $07, $D9, $07, $DB, $07, $DD, $07, $DF, $07, $00, $00, $00, $00, $00, $C0
    db   $09, $00, $38, $34, $C0, $19, $00, $38, $33, $C0, $46, $00, $13, $10, $C0, $23
    db   $00, $20, $40, $80, $51, $00, $20, $07, $80, $A1, $00, $00, $18, $80, $F2, $00
    db   $00, $18, $80, $81, $00, $3A, $10, $C0, $80, $00, $00, $10, $C0, $57, $00, $00
    db   $60, $80, $10, $00, $00, $10, $80, $01, $02, $04, $08, $10, $20, $06, $0C, $18
    db   $01, $01, $01, $01, $01, $30, $01, $03, $06, $0C, $18, $30, $09, $12, $24, $02
    db   $04, $08, $01, $01, $48, $02, $04, $08, $10, $20, $40, $0C, $18, $30, $02, $05
    db   $03, $01, $01, $60, $03, $05, $0A, $14, $28, $50, $0F, $1E, $3C, $02, $08, $10
    db   $02, $01, $78, $03, $06, $0C, $18, $30, $60, $12, $24, $48, $03, $08, $10, $02
    db   $04, $90, $03, $07, $0E, $1C, $38, $70, $15, $2A, $54, $04, $09, $12, $02, $01
    db   $A8, $04, $08, $10, $20, $40, $80, $18, $30, $60, $04, $02, $01, $01, $00, $C0
    db   $04, $09, $12, $24, $48, $90, $1B, $36, $6C, $05, $0C, $18, $18, $06, $D8, $05
    db   $0A, $14, $28, $50, $A0, $1E, $3C, $78, $05, $01, $01, $01, $01, $F0, $10, $32
    db   $22, $47, $60, $20, $00, $22, $4B, $FF, $FF, $1C, $4B, $9B, $20, $AE, $01, $9C
    db   $00, $00, $CA, $4A, $40, $4B, $48, $4B, $50, $4B, $58, $4B, $00, $CA, $4A, $3E
    db   $4B, $46, $4B, $4E, $4B, $56, $4B, $5E, $4B, $65, $4B, $FF, $FF, $40, $4B, $87
    db   $4B, $97, $4B, $FF, $FF, $48, $4B, $19, $4C, $1E, $4C, $FF, $FF, $50, $4B, $2A
    db   $4C, $2F, $4C, $FF, $FF, $58, $4B, $A5, $01, $A8, $01, $AA, $01, $00, $9D, $10
    db   $00, $80, $9B, $04, $A1, $7C, $76, $6E, $64, $9C, $9B, $04, $7E, $78, $70, $66
    db   $9C, $9B, $04, $7C, $76, $6E, $64, $9C, $9B, $04, $78, $72, $6A, $60, $9C, $00
    db   $9D, $60, $81, $41, $AA, $01, $56, $60, $6A, $60, $66, $A5, $64, $A3, $01, $00
    db   $9D, $34, $00, $00, $9B, $03, $A1, $7C, $76, $6E, $64, $9C, $9D, $43, $00, $00
    db   $7C, $76, $6E, $64, $9D, $62, $00, $00, $7E, $78, $70, $66, $9D, $43, $00, $00
    db   $7E, $78, $70, $66, $9D, $34, $00, $00, $9B, $02, $7E, $78, $70, $66, $9C, $9B
    db   $02, $7C, $76, $6E, $64, $9C, $9D, $43, $00, $00, $7C, $76, $6E, $64, $9D, $62
    db   $00, $00, $7C, $76, $6E, $64, $9D, $82, $00, $00, $78, $72, $6A, $60, $9D, $62
    db   $00, $00, $78, $72, $6A, $60, $9D, $43, $00, $00, $9B, $02, $78, $72, $6A, $60
    db   $9C, $00, $66, $66, $66, $66, $00, $00, $00, $00, $66, $66, $66, $66, $00, $00
    db   $00, $00, $00, $22, $44, $55, $66, $66, $88, $88, $AA, $AA, $CC, $CC, $04, $84
    db   $04, $84, $A5, $01, $A8, $01, $00, $9D, $F9, $4B, $20, $99, $9B, $20, $A2, $04

    db   $1C, $9C, $00, $A5, $01, $A8, $01, $00, $9B, $20, $A2, $1A, $A1, $1A, $1A, $9C
    db   $00, $02, $BB, $4A, $43, $4C, $51, $4C, $65, $4C, $6B, $4C, $71, $4C, $87, $4C

    db   $99, $4C, $AB, $4C, $99, $4C, $FF, $FF, $45, $4C, $78, $4C, $87, $4C, $7D, $4C
    db   $99, $4C, $82, $4C, $AB, $4C, $7D, $4C, $99, $4C, $FF, $FF, $51, $4C, $BD, $4C
    db   $FF, $FF, $65, $4C, $F0, $4C, $FF, $FF, $6B, $4C, $9D, $43, $00, $03, $A0, $01
    db   $00, $9D, $43, $00, $00, $00, $9D, $71, $00, $00, $00, $9D, $91, $00, $00, $00
    db   $9B, $02, $A1, $48, $4C, $4E, $A6, $5C, $A1, $48, $4C, $4E, $A6, $5A, $A3, $01
    db   $9C, $00, $9B, $02, $A1, $4C, $50, $52, $A6, $60, $A1, $4C, $50, $52, $A6, $5E

    db   $A3, $01, $9C, $00, $9B, $02, $A1, $50, $54, $56, $A6, $64, $A1, $50, $54, $56
    db   $A6, $62, $A3, $01, $9C, $00, $9D, $09, $4C, $20, $99, $9B, $02, $A2, $30, $18

    db   $18, $30, $18, $18, $30, $18, $9C, $9B, $02, $34, $1C, $1C, $34, $1C, $1C, $34
    db   $1C, $9C, $9B, $02, $38, $20, $20, $38, $20, $20, $38, $20, $9C, $9B, $02, $34
    db   $1C, $1C, $34, $1C, $1C, $34, $1C, $9C, $00, $9B, $02, $A1, $1A, $1A, $1A, $A6

    db   $1A, $9C, $A1, $1A, $15, $15, $15, $00

label_01E_4CFF:
    xor  a                                        ; $4CFF: $AF
    ld   [$D379], a                               ; $4D00: $EA $79 $D3

jr_01E_4D03:
    ld   [$D34F], a                               ; $4D03: $EA $4F $D3
    ld   [$D398], a                               ; $4D06: $EA $98 $D3
    ld   [$D393], a                               ; $4D09: $EA $93 $D3
    ld   [$D3C9], a                               ; $4D0C: $EA $C9 $D3
    ld   [$D3A3], a                               ; $4D0F: $EA $A3 $D3
    ld   [$D3E5], a                               ; $4D12: $EA $E5 $D3
    ld   a, $08                                   ; $4D15: $3E $08

jr_01E_4D17:
    ldh  [rNR42], a                               ; $4D17: $E0 $21
    ld   a, $80                                   ; $4D19: $3E $80
    ldh  [rNR44], a                               ; $4D1B: $E0 $23

label_01E_4D1D:
    ld   a, $FF                                   ; $4D1D: $3E $FF
    ldh  [rNR51], a                               ; $4D1F: $E0 $25
    ld   a, $03                                   ; $4D21: $3E $03
    ld   [$D355], a                               ; $4D23: $EA $55 $D3
    xor  a                                        ; $4D26: $AF
    ld   [$D369], a                               ; $4D27: $EA $69 $D3

Func_4D2A::
    xor  a                                        ; $4D2A: $AF
    ld   [$D361], a                               ; $4D2B: $EA $61 $D3
    ld   [$D371], a                               ; $4D2E: $EA $71 $D3
    ld   [$D31F], a                               ; $4D31: $EA $1F $D3
    ld   [$D32F], a                               ; $4D34: $EA $2F $D3
    ld   [$D33F], a                               ; $4D37: $EA $3F $D3
    ld   [$D39E], a                               ; $4D3A: $EA $9E $D3
    ld   [$D39F], a                               ; $4D3D: $EA $9F $D3
    ld   [$D3D9], a                               ; $4D40: $EA $D9 $D3
    ld   [$D3DA], a                               ; $4D43: $EA $DA $D3
    ld   [$D3B6], a                               ; $4D46: $EA $B6 $D3
    ld   [$D3B7], a                               ; $4D49: $EA $B7 $D3
    ld   [$D3B8], a                               ; $4D4C: $EA $B8 $D3
    ld   [$D3B9], a                               ; $4D4F: $EA $B9 $D3
    ld   [$D3BA], a                               ; $4D52: $EA $BA $D3
    ld   [$D3BB], a                               ; $4D55: $EA $BB $D3
    ld   [$D394], a                               ; $4D58: $EA $94 $D3
    ld   [$D395], a                               ; $4D5B: $EA $95 $D3
    ld   [$D396], a                               ; $4D5E: $EA $96 $D3
    ld   [$D390], a                               ; $4D61: $EA $90 $D3
    ld   [$D391], a                               ; $4D64: $EA $91 $D3
    ld   [$D392], a                               ; $4D67: $EA $92 $D3
    ld   [$D3C6], a                               ; $4D6A: $EA $C6 $D3
    ld   [$D3C7], a                               ; $4D6D: $EA $C7 $D3
    ld   [$D3C8], a                               ; $4D70: $EA $C8 $D3
    ld   [$D3A0], a                               ; $4D73: $EA $A0 $D3
    ld   [$D3A1], a                               ; $4D76: $EA $A1 $D3
    ld   [$D3A2], a                               ; $4D79: $EA $A2 $D3
    ld   [$D3CD], a                               ; $4D7C: $EA $CD $D3
    ld   [$D3D6], a                               ; $4D7F: $EA $D6 $D3
    ld   [$D3D7], a                               ; $4D82: $EA $D7 $D3
    ld   [$D3D8], a                               ; $4D85: $EA $D8 $D3
    ld   [$D3DC], a                               ; $4D88: $EA $DC $D3
    ld   [$D3E7], a                               ; $4D8B: $EA $E7 $D3
    ld   [$D3E2], a                               ; $4D8E: $EA $E2 $D3
    ld   [$D3E3], a                               ; $4D91: $EA $E3 $D3
    ld   [$D3E4], a                               ; $4D94: $EA $E4 $D3
    ld   a, $08                                   ; $4D97: $3E $08
    ldh  [rNR12], a                               ; $4D99: $E0 $12
    ldh  [rNR22], a                               ; $4D9B: $E0 $17
    ld   a, $80                                   ; $4D9D: $3E $80
    ldh  [rNR14], a                               ; $4D9F: $E0 $14
    ldh  [rNR24], a                               ; $4DA1: $E0 $19
    xor  a                                        ; $4DA3: $AF
    ldh  [rNR10], a                               ; $4DA4: $E0 $10
    ldh  [rNR30], a                               ; $4DA6: $E0 $1A
    ret                                           ; $4DA8: $C9

Data_1E_4DA9::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db   $E8, $4A, $0B, $50, $2F, $50
    db   $53, $50, $00, $00, $13, $6E, $6F, $50, $AC, $6E, $A1, $50, $A8, $6E, $22, $6E
    db   $A8, $50, $09, $6E, $2A, $6D, $47, $51, $47, $51, $15, $6D, $B0, $6E, $10, $6D
    db   $09, $6E, $51, $51, $E3, $51, $00, $00, $B7, $50, $AC, $6E, $FF, $6D, $ED, $50
    db   $A8, $6E, $F2, $50, $CD, $6D, $47, $51, $09, $6E, $47, $51, $15, $6D, $B0, $6E
    db   $BE, $6D, $51, $51, $2D, $6D, $18, $6E, $E3, $51, $00, $00, $63, $6E, $00, $51
    db   $AC, $6E, $31, $51, $A8, $6E, $54, $6E, $38, $51, $72, $6E, $27, $6D, $47, $51
    db   $77, $6E, $47, $51, $FF, $FF, $30, $6D, $9B, $02, $A2, $12, $2A, $12, $18, $30
    db   $9C, $16, $2E, $16, $1C, $34, $16, $2E, $14, $2C, $9B, $02, $A2, $12, $2A, $12
    db   $18, $30, $9C, $1A, $32, $1A, $20, $38, $1A, $32, $18, $30, $9B, $02, $16, $2E
    db   $16, $1C, $34, $9C, $22, $3A, $22, $28, $40, $00, $A2, $16, $2E, $16, $1C, $34
    db   $00, $A2, $22, $3A, $22, $28, $40, $A2, $2E, $46, $2E, $34, $4C, $A5, $01, $00
    db   $9D, $97, $86, $80, $A7, $42, $A4, $34, $A6, $01, $A1, $38, $3A, $3E, $A3, $40
    db   $A4, $58, $A7, $01, $42, $A4, $34, $A6, $01, $A1, $38, $3A, $4C, $A3, $4A, $A4
    db   $48, $A7, $01, $9D, $B7, $86, $80, $A7, $46, $A4, $38, $A6, $01, $A1, $3E, $40
    db   $42, $A3, $44, $A7, $5C, $00, $A3, $32, $A7, $4A, $00, $9D, $89, $86, $81, $A3
    db   $48, $A7, $60, $A8, $80, $01, $A2, $01, $00, $9B, $02, $A2, $04, $1C, $04, $0A
    db   $22, $9C, $08, $20, $08, $0E, $26, $08, $20, $06, $1E, $9B, $02, $04, $1C, $04
    db   $0A, $22, $9C, $0C, $24, $0C, $12, $2A, $0C, $24, $0A, $22, $9B, $02, $08, $20
    db   $08, $0E, $26, $9C, $14, $2C, $14, $1A, $32, $00, $A2, $08, $20, $08, $0E, $26
    db   $00, $A2, $14, $2C, $14, $1A, $32, $A2, $20, $38, $20, $26, $3E, $A5, $01, $00
    db   $A1, $48, $50, $54, $5C, $60, $68, $6C, $74, $00, $A3, $3C, $2E, $01, $A1, $2E
    db   $32, $36, $38, $A3, $01, $38, $2A, $A1, $2A, $2E, $32, $36, $A2, $01, $6C, $5E
    db   $24, $16, $5E, $A1, $5E, $62, $66, $A6, $68, $A2, $68, $5A, $20, $12, $5A, $A1
    db   $5A, $5E, $62, $66, $A2, $01, $84, $76, $3C, $2E, $76, $A1, $76, $7A, $7E, $A6
    db   $80, $A2, $80, $72, $38, $2A, $72, $A1, $72, $76, $7A, $7E, $A2, $38, $66, $58
    db   $38, $20, $58, $A1, $58, $5C, $5E, $62, $A2, $36, $62, $54, $6C, $A1, $36, $3C
    db   $44, $4A, $4E, $54, $5C, $62, $A2, $32, $5E, $50, $32, $4A, $50, $A1, $50, $54
    db   $58, $5C, $A2, $2E, $5C, $4E, $66, $A1, $2E, $36, $3C, $44, $46, $4E, $54, $5C
    db   $A2, $2A, $58, $A1, $4A, $50, $58, $62, $A2, $26, $54, $A1, $46, $A0, $01, $A1
    db   $4C, $A0, $01, $A1, $54, $A0, $01, $A1, $5E, $A4, $01, $00, $9E, $D9, $4A, $A1
    db   $32, $3C, $46, $9B, $02, $0C, $01, $01, $9C, $3C, $40, $44, $46, $4A, $01, $0C
    db   $3C, $46, $50, $0C, $01, $01, $0C, $01, $46, $50, $5A, $01, $0C, $0C, $01, $0C
    db   $01, $00, $00, $D9, $4A, $14, $52, $1E, $52, $26, $52, $2E, $52, $15, $6D, $E1
    db   $6D, $53, $52, $FF, $FF, $16, $52, $31, $6E, $34, $52, $FF, $FF, $1E, $52, $63
    db   $6E, $74, $52, $FF, $FF, $26, $52, $93, $52, $FF, $FF, $2E, $52, $A2, $46, $01
    db   $A7, $3C, $A1, $46, $01, $46, $4A, $4E, $50, $A4, $54, $01, $A2, $5E, $01, $A7
    db   $54, $A1, $5E, $01, $5E, $62, $66, $68, $A4, $6C, $01, $00, $A2, $2A, $01, $A7
    db   $20, $A1, $2A, $01, $2A, $2E, $32, $38, $3E, $A6, $01, $A5, $01, $A2, $42, $01
    db   $A3, $38, $A1, $42, $38, $32, $2A, $2E, $A6, $01, $A8, $01, $00, $9B, $02, $99
    db   $A2, $16, $16, $01, $16, $9C, $9B, $02, $12, $12, $01, $12, $9C, $9B, $02, $0E
    db   $0E, $01, $0E, $9C, $9B, $02, $12, $12, $01, $12, $9C, $00, $9B, $07, $A2, $1A
    db   $A1, $1A, $1A, $9C, $9B, $04, $1A, $9C, $9B, $06, $A2, $1A, $A1, $1A, $1A, $9C
    db   $9B, $08, $1A, $9C, $00, $00, $E8, $4A, $1C, $4B, $B7, $52, $1C, $4B, $00, $00
    db   $2C, $6E, $DA, $53, $FF, $FF, $B7, $52, $00, $AC, $4A, $F0, $52, $CA, $52, $9A
    db   $53, $BE, $53, $E1, $6D, $CE, $53, $A0, $6E, $15, $6D, $AC, $6E, $27, $6D, $EB
    db   $6D, $98, $54, $D7, $54, $D7, $54, $D7, $54, $DE, $54, $98, $54, $D7, $54, $D7
    db   $54, $D7, $54, $DE, $54, $FF, $FF, $3B, $55, $7C, $6E, $D2, $6D, $11, $54, $A0
    db   $6E, $15, $6D, $AC, $6E, $27, $6D, $40, $6E, $2A, $54, $3B, $54, $2A, $6D, $3B
    db   $54, $40, $6E, $50, $54, $3B, $54, $40, $6E, $61, $54, $3B, $54, $40, $6E, $2A
    db   $54, $3B, $54, $2A, $6D, $3B, $54, $40, $6E, $50, $54, $3B, $54, $40, $6E, $61
    db   $54, $3B, $54, $91, $6E, $40, $6E, $72, $54, $3B, $54, $2A, $6D, $3B, $54, $F0
    db   $6D, $7C, $6E, $AB, $54, $94, $6E, $AB, $54, $8E, $6E, $BA, $54, $7C, $6E, $F0
    db   $6D, $C2, $54, $40, $6E, $2A, $54, $3B, $54, $2A, $6D, $3B, $54, $40, $6E, $50
    db   $54, $3B, $54, $40, $6E, $61, $54, $3B, $54, $40, $6E, $2A, $54, $3B, $54, $2A
    db   $6D, $3B, $54, $40, $6E, $50, $54, $3B, $54, $40, $6E, $61, $54, $3B, $54, $91
    db   $6E, $40, $6E, $72, $54, $3B, $54, $2A, $6D, $3B, $54, $F0, $6D, $7C, $6E, $AB
    db   $54, $94, $6E, $AB, $54, $8E, $6E, $BA, $54, $7C, $6E, $E1, $6D, $C2, $54, $FF
    db   $FF, $31, $55, $54, $6E, $1D, $54, $A0, $6E, $15, $6D, $AC, $6E, $27, $6D, $59
    db   $6E, $82, $54, $F3, $54, $54, $6E, $08, $55, $59, $6E, $82, $54, $F3, $54, $54
    db   $6E, $08, $55, $FF, $FF, $45, $55, $18, $55, $A0, $6E, $2D, $60, $AC, $6E, $1D
    db   $55, $20, $55, $FF, $FF, $C8, $53, $A2, $4E, $4C, $4A, $48, $4E, $50, $52, $54
    db   $A3, $01, $00, $9B, $06, $A0, $48, $46, $9C, $9B, $0A, $46, $44, $9C, $9D, $68
    db   $00, $81, $9B, $06, $44, $42, $9C, $9B, $0A, $42, $40, $9C, $9D, $A8, $00, $81
    db   $9B, $06, $A0, $4C, $4A, $9C, $9B, $0A, $4A, $48, $9C, $9D, $78, $00, $81, $9B
    db   $06, $48, $46, $9C, $9B, $0A, $46, $44, $9C, $00, $A2, $54, $52, $50, $4E, $54
    db   $56, $58, $5A, $A3, $01, $00, $99, $A2, $5A, $58, $56, $54, $5A, $5C, $5E, $60
    db   $A3, $01, $00, $A1, $40, $44, $01, $A5, $46, $A7, $01, $A1, $40, $44, $01, $46
    db   $A2, $01, $4C, $00, $9D, $92, $00, $C0, $A1, $10, $01, $10, $28, $01, $1A, $1C
    db   $01, $10, $01, $12, $01, $12, $04, $01, $00, $A1, $01, $A2, $5E, $A1, $01, $5E
    db   $01, $A9, $5E, $A0, $01, $A4, $5E, $A2, $01, $00, $A1, $01, $A2, $64, $A1, $01
    db   $64, $01, $A9, $64, $A0, $01, $A4, $64, $A2, $01, $00, $A1, $40, $44, $01, $A5
    db   $46, $A4, $01, $A1, $01, $40, $44, $46, $50, $4E, $00, $9B, $14, $99, $A1, $32
    db   $32, $01, $32, $4A, $01, $3C, $3E, $01, $32, $01, $34, $01, $34, $26, $01, $9C
    db   $00, $A1, $04, $9B, $7F, $02, $9C, $A1, $04, $9B, $7F, $02, $9C, $A1, $04, $9B
    db   $3F, $02, $9C, $00, $A1, $52, $52, $52, $50, $A3, $01, $A1, $4E, $01, $01, $4C
    db   $A3, $01, $00, $A1, $52, $52, $52, $50, $A8, $01, $00, $A1, $46, $46, $01, $46
    db   $01, $46, $01, $50, $01, $50, $A2, $50, $97, $A1, $01, $36, $2C, $24, $98, $00
    db   $A1, $10, $9B, $0F, $0E, $9C, $00, $A1, $3C, $3C, $01, $3C, $01, $3C, $01, $3C
    db   $01, $46, $A2, $46, $97, $A1, $01, $2C, $24, $1E, $98, $00, $9B, $03, $A1, $3E
    db   $3E, $01, $3E, $56, $01, $48, $4A, $01, $3E, $01, $40, $01, $40, $32, $01, $9C
    db   $00, $A1, $32, $32, $01, $32, $01, $32, $01, $3C, $01, $3C, $3C, $01, $A3, $01
    db   $00, $A5, $01, $A3, $01, $00, $A6, $01, $00, $9B, $02, $A1, $1A, $1A, $1A, $15
    db   $9C, $1A, $1A, $15, $1A, $1A, $1A, $1A, $1A, $00, $51, $55, $51, $55, $61, $55
    db   $FF, $FF, $FE, $52, $7C, $55, $7C, $55, $A8, $55, $FF, $FF, $D6, $52, $59, $6E
    db   $EC, $55, $EC, $55, $15, $56, $FF, $FF, $A6, $53, $9D, $C4, $83, $80, $A1, $04
    db   $9B, $1F, $02, $9C, $0A, $9B, $1F, $08, $9C, $00, $A1, $10, $9B, $0D, $0E, $9C
    db   $10, $12, $9B, $0F, $14, $9C, $10, $9B, $0E, $0E, $9C, $10, $12, $9B, $07, $14
    db   $9C, $16, $A4, $01, $00, $9D, $84, $86, $80, $9B, $02, $A1, $10, $10, $01, $10
    db   $28, $01, $1A, $1C, $01, $10, $01, $12, $01, $12, $04, $01, $9C, $9B, $02, $16
    db   $16, $01, $16, $2E, $01, $20, $22, $01, $16, $01, $18, $01, $18, $0C, $01, $9C
    db   $00, $A1, $1C, $1C, $01, $1C, $34, $01, $26, $2A, $01, $1C, $9B, $02, $01, $1E
    db   $9C, $12, $01, $22, $22, $01, $22, $3A, $01, $2C, $2E, $01, $22, $9B, $02, $01
    db   $24, $9C, $18, $01, $1C, $1C, $01, $1C, $34, $01, $26, $2A, $01, $1C, $9B, $02
    db   $01, $1E, $9C, $12, $01, $A2, $22, $22, $3A, $A1, $24, $26, $01, $26, $A6, $3E
    db   $A1, $26, $0E, $26, $00, $9B, $02, $99, $A1, $32, $32, $01, $32, $4A, $01, $3C
    db   $3E, $01, $32, $01, $34, $01, $34, $26, $01, $9C, $9B, $02, $38, $38, $01, $38
    db   $50, $01, $42, $44, $01, $38, $01, $3A, $01, $3A, $2E, $01, $9C, $00, $A1, $3E
    db   $3E, $01, $3E, $56, $01, $48, $4C, $01, $3E, $01, $40, $01, $40, $34, $01, $44
    db   $44, $01, $44, $5C, $01, $4E, $50, $01, $44, $01, $46, $01, $46, $3A, $01, $3E
    db   $3E, $01, $3E, $56, $01, $48, $4C, $01, $3E, $01, $40, $01, $40, $34, $01, $A2
    db   $44, $44, $5C, $A1, $46, $48, $01, $48, $A6, $60, $A1, $48, $30, $48, $00, $00
    db   $F7, $4A, $61, $56, $6D, $56, $93, $56, $00, $00, $E1, $6D, $A7, $56, $20, $6D
    db   $20, $6D, $FF, $FF, $45, $57, $9B, $6D, $BC, $56, $45, $6E, $C7, $56, $9B, $6D
    db   $D2, $56, $BC, $56, $45, $6E, $C7, $56, $9B, $6D, $D2, $56, $27, $6E, $E3, $56
    db   $9B, $6D, $D2, $56, $82, $6D, $ED, $56, $FF, $FF, $5F, $57, $59, $6E, $F9, $56
    db   $F9, $56, $54, $6E, $35, $57, $59, $6E, $24, $57, $24, $57, $FF, $FF, $91, $57
    db   $9B, $10, $A5, $01, $9C, $A3, $01, $A1, $0C, $18, $24, $30, $3C, $48, $54, $60
    db   $A5, $01, $A3, $01, $00, $9B, $02, $A2, $6A, $70, $6E, $74, $AE, $01, $9C, $00
    db   $A1, $3A, $40, $3E, $44, $A4, $50, $01, $A8, $01, $00, $A8, $01, $A2, $01, $A1
    db   $78, $76, $9B, $0D, $A0, $78, $76, $9C, $78, $A3, $01, $00, $A1, $6A, $70, $78
    db   $76, $A5, $7E, $A8, $01, $00, $A3, $01, $9B, $0D, $A0, $78, $76, $9C, $78, $A5
    db   $01, $00, $99, $A2, $0A, $01, $A4, $01, $A6, $01, $A1, $0A, $0A, $A6, $01, $A8
    db   $01, $A2, $0A, $0A, $A4, $01, $A6, $01, $A1, $0A, $A2, $0A, $01, $A8, $01, $A2
    db   $0A, $01, $A4, $01, $A6, $01, $A1, $0A, $A2, $0A, $01, $A8, $01, $99, $A2, $0A
    db   $0A, $A4, $01, $A6, $01, $A1, $0A, $0A, $0A, $A8, $01, $A2, $0A, $00, $9A, $A1
    db   $0A, $10, $18, $16, $A5, $1E, $A4, $01, $A1, $20, $18, $10, $0A, $00, $36, $6E
    db   $B1, $57, $40, $6E, $DB, $57, $9B, $6D, $B4, $6E, $08, $58, $E1, $6D, $A7, $56
    db   $20, $6D, $20, $6D, $FF, $FF, $61, $56, $36, $6E, $14, $58, $40, $6E, $3E, $58
    db   $B4, $6E, $15, $6D, $9B, $6D, $BC, $56, $45, $6E, $C7, $56, $9B, $6D, $D2, $56
    db   $BC, $56, $45, $6E, $C7, $56, $9B, $6D, $D2, $56, $27, $6E, $E3, $56, $9B, $6D
    db   $D2, $56, $82, $6D, $ED, $56, $FF, $FF, $6D, $56, $63, $6E, $6B, $58, $54, $6E
    db   $9B, $58, $B4, $6E, $15, $6D, $59, $6E, $F9, $56, $F9, $56, $54, $6E, $35, $57
    db   $59, $6E, $24, $57, $24, $57, $FF, $FF, $93, $56, $A2, $18, $1C, $A4, $1E, $A3
    db   $01, $A2, $18, $1C, $A7, $1E, $A2, $28, $26, $18, $A4, $1C, $AE, $01, $A2, $18
    db   $1C, $A4, $1E, $A3, $01, $A2, $18, $1C, $A7, $1E, $A2, $26, $30, $2E, $A4, $2E
    db   $01, $A5, $01, $00, $A1, $30, $32, $A4, $34, $A2, $01, $A1, $30, $32, $34, $A6
    db   $01, $A3, $40, $A1, $3E, $3C, $48, $4A, $A4, $4C, $A1, $4E, $01, $48, $4A, $4C
    db   $4E, $A2, $01, $A3, $58, $A1, $56, $54, $52, $54, $56, $48, $4A, $01, $A7, $01
    db   $00, $A7, $01, $A1, $78, $76, $9B, $09, $A0, $78, $76, $9C, $00, $A2, $22, $26
    db   $A4, $28, $A3, $01, $A2, $22, $26, $A7, $28, $A2, $32, $30, $22, $A4, $24, $AE
    db   $01, $A2, $22, $26, $A4, $28, $A3, $01, $A2, $22, $26, $A7, $28, $A2, $30, $3A
    db   $38, $A4, $36, $01, $A5, $01, $00, $A1, $3A, $3C, $A4, $3E, $A2, $01, $A1, $3A
    db   $3C, $3E, $A6, $01, $A3, $4A, $A1, $48, $46, $52, $54, $A4, $56, $A1, $58, $01
    db   $52, $54, $56, $58, $A2, $01, $A3, $4A, $A1, $60, $5E, $6A, $6C, $6E, $60, $62
    db   $01, $A7, $01, $00, $9B, $02, $99, $A2, $0A, $0A, $A8, $01, $9C, $9B, $02, $A2
    db   $06, $06, $A8, $01, $9C, $9B, $02, $A2, $0A, $0A, $01, $0A, $01, $0A, $A1, $0A
    db   $0A, $0A, $0A, $9C, $9B, $02, $A2, $1A, $1A, $01, $1A, $01, $1A, $A1, $1A, $1A
    db   $1A, $1A, $9C, $00, $9B, $04, $A1, $0A, $9C, $22, $9B, $07, $0A, $9C, $9B, $04
    db   $0A, $9C, $22, $9B, $07, $0A, $9C, $9B, $04, $0A, $9C, $22, $9B, $07, $0A, $9C
    db   $9B, $04, $0A, $9C, $22, $9B, $07, $0A, $9C, $22, $24, $26, $18, $1A, $01, $A7
    db   $01, $00, $00, $CA, $4A, $D4, $58, $EE, $58, $0C, $59, $00, $00, $27, $6D, $78
    db   $6D, $18, $59, $21, $59, $18, $59, $09, $6E, $29, $59, $31, $59, $31, $59, $31
    db   $59, $31, $59, $FF, $FF, $D6, $58, $09, $6E, $18, $59, $21, $59, $C3, $6D, $18
    db   $59, $29, $59, $A5, $6D, $31, $59, $31, $59, $C3, $6D, $31, $59, $09, $6E, $31
    db   $59, $FF, $FF, $EE, $58, $54, $6E, $6E, $59, $39, $59, $61, $59, $FF, $FF, $0C
    db   $59, $9B, $04, $A2, $48, $4C, $54, $58, $9C, $00, $9B, $04, $44, $48, $50, $54
    db   $9C, $00, $9B, $04, $4A, $4E, $56, $5A, $9C, $00, $9B, $02, $4C, $50, $56, $5C
    db   $9C, $00, $99, $A7, $18, $A2, $18, $A5, $01, $A7, $01, $A2, $16, $A7, $14, $A2
    db   $14, $A5, $01, $A7, $01, $A2, $14, $A7, $0A, $A2, $0A, $A5, $01, $A7, $01, $A2
    db   $0A, $02, $02, $01, $02, $A5, $01, $A7, $01, $00, $9B, $04, $A2, $04, $9C, $AE
    db   $01, $01, $A4, $01, $A2, $18, $00, $9B, $0C, $A5, $01, $9C, $00, $00, $BB, $4A
    db   $1C, $4B, $7F, $59, $2F, $5A, $00, $00, $13, $6E, $7C, $6E, $47, $5A, $51, $5A
    db   $1D, $6E, $94, $6E, $47, $5A, $51, $5A, $FA, $6D, $8B, $6E, $47, $5A, $88, $6E
    db   $47, $5A, $E6, $6D, $85, $6E, $47, $5A, $20, $6D, $7C, $6E, $13, $6E, $7C, $6E
    db   $47, $5A, $51, $5A, $1D, $6E, $94, $6E, $47, $5A, $51, $5A, $FA, $6D, $8B, $6E
    db   $47, $5A, $88, $6E, $47, $5A, $E6, $6D, $85, $6E, $47, $5A, $20, $6D, $7C, $6E
    db   $9B, $6D, $77, $5A, $8C, $6D, $7E, $5A, $91, $6D, $84, $5A, $9B, $6D, $84, $5A
    db   $84, $5A, $82, $6D, $84, $5A, $9B, $6D, $8A, $5A, $8C, $6D, $90, $5A, $91, $6D
    db   $84, $5A, $9B, $6D, $84, $5A, $84, $5A, $82, $6D, $84, $5A, $94, $6E, $9B, $6D
    db   $77, $5A, $8C, $6D, $7E, $5A, $91, $6D, $84, $5A, $9B, $6D, $84, $5A, $84, $5A
    db   $82, $6D, $84, $5A, $9B, $6D, $8A, $5A, $8C, $6D, $90, $5A, $91, $6D, $84, $5A
    db   $9B, $6D, $84, $5A, $84, $5A, $82, $6D, $84, $5A, $7C, $6E, $B9, $6D, $3F, $5A
    db   $27, $6E, $96, $5A, $FF, $FF, $7F, $59, $5E, $6E, $6A, $5A, $9F, $5A, $59, $6E
    db   $3F, $5A, $96, $5A, $FF, $FF, $2F, $5A, $A2, $18, $1C, $1E, $14, $18, $1A, $00
    db   $A3, $30, $34, $36, $A4, $44, $18, $A3, $01, $00, $30, $34, $36, $A4, $42, $18
    db   $A3, $01, $30, $34, $36, $A4, $40, $18, $A3, $01, $30, $34, $36, $A4, $42, $18
    db   $A3, $01, $00, $9B, $18, $99, $A3, $18, $18, $A5, $01, $A3, $01, $18, $9C, $00
    db   $9B, $0C, $A1, $24, $2C, $9C, $00, $9B, $04, $24, $2C, $9C, $00, $9B, $04, $22
    db   $2A, $9C, $00, $9B, $0C, $20, $28, $9C, $00, $9B, $04, $20, $28, $9C, $00, $A2
    db   $01, $AE, $0C, $A5, $01, $A7, $01, $00, $9B, $08, $99, $A3, $18, $18, $01, $18
    db   $01, $A4, $30, $A3, $18, $9C, $00, $00, $BB, $4A, $B9, $5A, $D5, $5A, $B1, $5B
    db   $00, $00, $82, $6D, $DF, $5B, $9B, $6D, $DF, $5B, $DF, $5B, $00, $5C, $8C, $6D
    db   $0B, $5C, $0B, $5C, $0B, $5C, $7C, $6E, $0B, $5C, $FF, $FF, $B9, $5A, $82, $6D
    db   $2F, $5C, $2F, $5C, $9B, $6D, $2F, $5C, $82, $6D, $2F, $5C, $82, $6D, $35, $5C
    db   $35, $5C, $9B, $6D, $35, $5C, $82, $6D, $35, $5C, $82, $6D, $3A, $5C, $3A, $5C
    db   $9B, $6D, $3A, $5C, $82, $6D, $3A, $5C, $82, $6D, $3F, $5C, $3F, $5C, $9B, $6D
    db   $3F, $5C, $82, $6D, $3F, $5C, $82, $6D, $2F, $5C, $9B, $6D, $2F, $5C, $8C, $6D
    db   $2F, $5C, $82, $6D, $2F, $5C, $82, $6D, $35, $5C, $9B, $6D, $35, $5C, $8C, $6D
    db   $35, $5C, $82, $6D, $35, $5C, $82, $6D, $3A, $5C, $9B, $6D, $3A, $5C, $8C, $6D
    db   $3A, $5C, $82, $6D, $3A, $5C, $82, $6D, $3F, $5C, $9B, $6D, $3F, $5C, $8C, $6D
    db   $3F, $5C, $82, $6D, $3F, $5C, $82, $6D, $2F, $5C, $9B, $6D, $2F, $5C, $8C, $6D
    db   $2F, $5C, $82, $6D, $2F, $5C, $82, $6D, $35, $5C, $9B, $6D, $35, $5C, $8C, $6D
    db   $35, $5C, $82, $6D, $35, $5C, $82, $6D, $3A, $5C, $9B, $6D, $3A, $5C, $8C, $6D
    db   $3A, $5C, $82, $6D, $3A, $5C, $82, $6D, $3F, $5C, $9B, $6D, $3F, $5C, $8C, $6D
    db   $3F, $5C, $82, $6D, $3F, $5C, $82, $6D, $44, $5C, $8C, $6D, $44, $5C, $9B, $6D
    db   $49, $5C, $8C, $6D, $49, $5C, $20, $6D, $20, $6D, $9B, $6D, $4E, $5C, $94, $6E
    db   $4E, $5C, $20, $6D, $20, $6D, $FF, $FF, $D5, $5A, $67, $5D, $15, $6D, $20, $6D
    db   $20, $6D, $20, $6D, $63, $6E, $5E, $5C, $72, $6E, $8D, $5C, $6D, $6E, $A1, $5C
    db   $72, $6E, $8D, $5C, $6D, $6E, $A1, $5C, $18, $6D, $6D, $6E, $96, $5C, $77, $6E
    db   $A1, $5C, $18, $6D, $FF, $FF, $B1, $5B, $A5, $01, $A3, $01, $9B, $04, $A2, $54
    db   $9C, $AE, $01, $9B, $04, $A2, $52, $9C, $AE, $01, $9B, $04, $A2, $58, $9C, $AE
    db   $01, $9B, $04, $A2, $56, $9C, $A3, $01, $00, $A8, $01, $A2, $01, $5E, $A8, $01
    db   $A2, $01, $60, $00, $9B, $03, $A2, $02, $08, $04, $0C, $9C, $9D, $A2, $83, $C0
    db   $02, $08, $04, $0C, $9D, $C2, $83, $C0, $02, $08, $04, $0C, $9D, $81, $83, $C0
    db   $9B, $03, $02, $08, $04, $0C, $9C, $00, $9B, $04, $A2, $60, $9C, $00, $9B, $04
    db   $5E, $9C, $00, $9B, $04, $64, $9C, $00, $9B, $04, $62, $9C, $00, $9B, $04, $6A
    db   $9C, $00, $9B, $04, $6C, $9C, $00, $A2, $30, $34, $36, $44, $A5, $01, $A2, $01
    db   $42, $34, $42, $A5, $01, $01, $00, $99, $A2, $18, $1C, $1E, $2C, $AE, $01, $A2
    db   $18, $1C, $1E, $2A, $AE, $01, $A2, $1C, $20, $22, $30, $AE, $01, $A2, $1C, $20
    db   $22, $2E, $AE, $01, $A2, $26, $2A, $2C, $3A, $A4, $01, $A2, $28, $2C, $2E, $3C
    db   $9B, $09, $A4, $01, $9C, $00, $A3, $01, $A2, $60, $64, $66, $74, $A3, $01, $A5
    db   $01, $9B, $03, $A2, $5A, $60, $5E, $62, $9C, $00, $A2, $5A, $60, $5E, $62, $00
    db   $00, $D9, $4A, $B2, $5C, $00, $5D, $2C, $5D, $00, $00, $09, $6E, $6D, $5D, $13
    db   $6E, $6D, $5D, $CD, $6D, $6D, $5D, $13, $6E, $6D, $5D, $87, $6D, $75, $5D, $09
    db   $6E, $6D, $5D, $6D, $5D, $18, $6D, $24, $6D, $24, $6D, $2D, $6D, $09, $6E, $6D
    db   $5D, $13, $6E, $6D, $5D, $CD, $6D, $6D, $5D, $13, $6E, $6D, $5D, $87, $6D, $86
    db   $5D, $0E, $6E, $6D, $5D, $13, $6E, $6D, $5D, $CD, $6D, $6D, $5D, $24, $6D, $24
    db   $6D, $0E, $6E, $98, $5D, $FF, $FF, $B2, $5C, $45, $6E, $36, $5D, $13, $6E, $4D
    db   $5D, $09, $6E, $6D, $5D, $13, $6E, $6D, $5D, $09, $6E, $6D, $5D, $2D, $6D, $2D
    db   $6D, $09, $6E, $6D, $5D, $0E, $6E, $6D, $5D, $13, $6E, $6D, $5D, $2D, $6D, $2D
    db   $6D, $FF, $FF, $00, $5D, $5E, $6E, $36, $5D, $67, $5D, $FF, $FF, $2C, $5D, $A4
    db   $18, $A3, $1C, $1E, $A5, $16, $9B, $04, $01, $9C, $A4, $18, $A3, $1C, $1E, $A5
    db   $24, $9B, $04, $01, $9C, $00, $A4, $60, $A3, $64, $66, $A4, $74, $5E, $A3, $62
    db   $64, $A4, $72, $6E, $A3, $72, $74, $A4, $82, $70, $A3, $74, $76, $A4, $84, $00
    db   $9B, $09, $A5, $01, $9C, $00, $AA, $48, $54, $56, $60, $56, $54, $00, $A1, $01
    db   $AD, $01, $A3, $01, $74, $72, $01, $74, $72, $A4, $01, $A2, $74, $72, $00, $A1
    db   $01, $AD, $01, $01, $A3, $01, $7A, $78, $01, $7A, $78, $A4, $01, $A2, $7A, $78
    db   $00, $A0, $01, $01, $9B, $03, $A3, $48, $3C, $9C, $9B, $03, $46, $3A, $9C, $9B
    db   $03, $3E, $32, $9C, $9B, $06, $40, $34, $9C, $AE, $01, $00, $00, $BB, $4A, $BE
    db   $5D, $C6, $5D, $1C, $4B, $00, $00, $09, $6E, $D6, $5D, $FF, $FF, $BE, $5D, $0E
    db   $6E, $20, $5E, $13, $6E, $4D, $5E, $CD, $6D, $5F, $5E, $FF, $FF, $C6, $5D, $A3
    db   $01, $A2, $48, $4C, $4E, $5C, $01, $6C, $6C, $A4, $01, $A2, $01, $48, $4C, $4E
    db   $5A, $01, $6A, $6A, $A4, $01, $A2, $01, $4C, $50, $52, $60, $01, $70, $70, $A4
    db   $01, $A2, $01, $4C, $50, $52, $5E, $01, $6E, $6E, $A4, $01, $A2, $01, $56, $5A
    db   $5C, $6A, $01, $76, $A3, $01, $A2, $58, $5C, $5E, $6C, $01, $78, $A3, $01, $A2
    db   $60, $64, $84, $82, $80, $7E, $AE, $01, $00, $A2, $48, $4C, $4E, $5C, $A7, $01
    db   $A2, $78, $A4, $78, $A2, $48, $4C, $4E, $5A, $A7, $01, $A2, $76, $A4, $76, $A2
    db   $4C, $50, $52, $60, $A7, $01, $A2, $7C, $A4, $7C, $A2, $4C, $50, $52, $5E, $A7
    db   $01, $A2, $7A, $A4, $7A, $00, $A2, $56, $5A, $5C, $6A, $A7, $01, $A2, $82, $58
    db   $5C, $5E, $6C, $A7, $01, $A2, $84, $00, $60, $64, $66, $8C, $8A, $88, $86, $84
    db   $AE, $01, $00, $00, $E8, $4A, $89, $5E, $75, $5E, $93, $5E, $00, $00, $AA, $6D
    db   $9B, $5E, $AF, $6D, $AD, $5E, $B4, $6D, $BE, $5E, $AF, $6D, $CF, $5E, $FF, $FF
    db   $75, $5E, $10, $6D, $7D, $6D, $9B, $5E, $FF, $FF, $8B, $5E, $54, $6E, $E0, $5E
    db   $FF, $FF, $93, $5E, $A2, $2C, $26, $20, $1A, $14, $0E, $08, $04, $02, $08, $0E
    db   $14, $1A, $20, $26, $2C, $00, $2E, $26, $20, $1A, $16, $0E, $08, $04, $02, $08
    db   $0E, $16, $1A, $20, $26, $2E, $00, $30, $26, $20, $1A, $18, $0E, $08, $04, $02
    db   $08, $0E, $18, $1A, $20, $26, $30, $00, $2E, $26, $20, $1A, $16, $0E, $08, $04
    db   $02, $08, $0E, $16, $1A, $20, $26, $2E, $00, $99, $A8, $01, $A2, $01, $02, $02
    db   $01, $A8, $01, $A5, $01, $01, $00, $00, $D9, $4A, $F9, $5E, $05, $5F, $00, $00
    db   $00, $00, $10, $6D, $7D, $6D, $19, $5F, $19, $5F, $FF, $FF, $FB, $5E, $09, $6E
    db   $19, $5F, $0E, $6E, $2B, $5F, $13, $6E, $19, $5F, $22, $6E, $2B, $5F, $FF, $FF
    db   $0D, $5F, $A1, $48, $44, $3E, $38, $30, $2C, $26, $20, $18, $20, $26, $2C, $30
    db   $38, $3E, $44, $00, $4C, $48, $44, $3E, $38, $30, $2C, $26, $20, $26, $2C, $34
    db   $3E, $44, $4C, $50, $00, $00, $9D, $4A, $47, $5F, $5D, $5F, $77, $5F, $8B, $5F
    db   $4F, $6E, $03, $60, $C8, $6D, $9D, $5F, $27, $6E, $BC, $5F, $C8, $6D, $9D, $5F
    db   $20, $6D, $FF, $FF, $47, $5F, $4F, $6E, $F1, $5F, $C8, $6D, $C7, $5F, $27, $6E
    db   $E6, $5F, $8E, $6E, $C8, $6D, $C7, $5F, $20, $6D, $7C, $6E, $FF, $FF, $5D, $5F
    db   $15, $6D, $5E, $6E, $15, $60, $59, $6E, $22, $60, $5E, $6E, $15, $60, $20, $6D
    db   $FF, $FF, $77, $5F, $2D, $60, $30, $60, $30, $60, $48, $60, $30, $60, $30, $60
    db   $53, $60, $FF, $FF, $8B, $5F, $9B, $02, $A2, $22, $22, $22, $20, $A4, $01, $A7
    db   $1E, $1C, $A3, $01, $9C, $9B, $02, $A2, $26, $26, $26, $24, $A4, $01, $A7, $22
    db   $20, $A3, $01, $9C, $00, $A7, $48, $46, $A2, $48, $4A, $4C, $A1, $4E, $01, $00
    db   $9B, $02, $A2, $30, $30, $30, $2E, $A4, $01, $A7, $2C, $2A, $A3, $01, $9C, $9B
    db   $02, $A2, $34, $34, $34, $32, $A4, $01, $A7, $30, $2E, $A3, $01, $9C, $00, $A7
    db   $52, $50, $A2, $52, $54, $56, $A1, $58, $01, $00, $A1, $6C, $6A, $68, $66, $64
    db   $62, $60, $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $00, $A1, $66, $64, $62
    db   $60, $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $4C, $4A, $48, $00, $9B, $10
    db   $99, $A2, $18, $0E, $9C, $9B, $10, $04, $1C, $9C, $00, $9A, $A7, $32, $30, $A2
    db   $32, $34, $36, $99, $38, $00, $A5, $01, $00, $9B, $04, $A2, $15, $15, $FF, $01
    db   $9C, $9B, $02, $15, $15, $FF, $15, $9C, $1A, $FF, $15, $FF, $9B, $04, $FF, $9C
    db   $00, $9B, $02, $FF, $1A, $1A, $9C, $9B, $04, $FF, $9C, $00, $1A, $1A, $01, $15
    db   $15, $01, $FF, $FF, $9B, $04, $15, $9C, $9B, $04, $1A, $9C, $00, $00, $AC, $4A
    db   $6F, $60, $79, $60, $7F, $60, $00, $00, $09, $6E, $24, $6D, $27, $6D, $87, $60
    db   $00, $00, $CD, $6D, $87, $60, $00, $00, $77, $6E, $27, $6D, $87, $60, $00, $00
    db   $9B, $02, $A1, $90, $8A, $82, $7C, $78, $72, $6A, $64, $60, $5A, $52, $4C, $48
    db   $42, $3A, $34, $8E, $88, $82, $7A, $76, $70, $6A, $62, $5E, $58, $52, $4A, $46
    db   $40, $3A, $32, $9C, $2E, $28, $22, $1A, $16, $10, $0A, $02, $A6, $48, $56, $5C
    db   $64, $01, $A2, $60, $A1, $68, $6E, $A5, $78, $01, $00, $00, $CA, $4A, $CD, $60
    db   $D9, $60, $1C, $4B, $00, $00, $09, $6E, $03, $60, $10, $6D, $E3, $60, $FF, $FF
    db   $D3, $60, $09, $6E, $9D, $6E, $F1, $5F, $FF, $FF, $D3, $60, $A2, $28, $30, $36
    db   $3E, $A3, $6E, $01, $A2, $60, $28, $30, $36, $60, $64, $66, $6A, $26, $34, $A3
    db   $6A, $5C, $74, $A2, $52, $4C, $44, $3E, $3A, $34, $2C, $26, $22, $28, $30, $36
    db   $A3, $66, $01, $A2, $58, $22, $28, $30, $58, $5C, $60, $64, $1E, $2C, $A3, $64
    db   $56, $6E, $A2, $4C, $44, $3E, $36, $34, $2C, $26, $1E, $00, $00, $AC, $4A, $2E
    db   $61, $34, $61, $48, $61, $00, $00, $54, $61, $FF, $FF, $2E, $61, $8F, $61, $E3
    db   $60, $7C, $6E, $9D, $61, $96, $61, $E2, $61, $7C, $6E, $26, $62, $FF, $FF, $34
    db   $61, $68, $6E, $67, $62, $6D, $6E, $67, $62, $FF, $FF, $48, $61, $9D, $32, $83
    db   $80, $9B, $04, $A2, $48, $01, $48, $48, $9C, $9B, $04, $44, $01, $44, $44, $9C
    db   $9B, $04, $40, $01, $40, $40, $9C, $9B, $04, $3E, $01, $3E, $3E, $9C, $9B, $04
    db   $30, $01, $30, $30, $9C, $9B, $04, $2C, $01, $2C, $2C, $9C, $9B, $07, $2E, $01
    db   $2E, $2E, $9C, $2C, $01, $2C, $2C, $00, $9D, $67, $86, $80, $9F, $E8, $00, $9D
    db   $47, $86, $80, $9F, $E8, $00, $A2, $10, $18, $1E, $26, $A3, $56, $A2, $58, $5C
    db   $A3, $60, $A2, $10, $1E, $28, $30, $5C, $58, $5C, $06, $1E, $58, $A3, $56, $A2
    db   $52, $4E, $06, $0E, $14, $1E, $A4, $4E, $A2, $0C, $16, $1A, $1E, $54, $5E, $62
    db   $A3, $66, $A2, $16, $0C, $24, $2E, $3C, $62, $5E, $A7, $62, $A2, $70, $0A, $16
    db   $1A, $28, $A7, $6E, $A2, $7A, $08, $14, $1A, $26, $00, $A2, $28, $30, $36, $3E
    db   $A3, $6E, $01, $A2, $60, $28, $30, $36, $01, $86, $78, $90, $A2, $8C, $4C, $4E
    db   $52, $A3, $56, $A2, $58, $A4, $5C, $A2, $3E, $3A, $34, $3E, $44, $3A, $40, $48
    db   $4E, $A3, $4E, $01, $A2, $40, $22, $28, $30, $40, $44, $48, $4C, $30, $34, $36
    db   $3E, $A3, $4E, $A2, $52, $A7, $56, $A2, $01, $48, $4E, $56, $58, $5C, $00, $A4
    db   $48, $A2, $10, $18, $1E, $26, $28, $30, $36, $3E, $48, $4C, $4E, $52, $A7, $44
    db   $A2, $5C, $26, $2C, $30, $34, $36, $6E, $66, $74, $8C, $26, $2C, $36, $A7, $76
    db   $A2, $8E, $3C, $46, $4A, $A3, $4E, $A2, $16, $0C, $24, $2E, $3C, $4A, $46, $A7
    db   $4A, $A2, $58, $22, $24, $28, $2E, $A7, $56, $A2, $62, $38, $3E, $44, $4A, $00
    db   $9B, $04, $99, $A2, $40, $01, $40, $40, $9C, $9B, $04, $3E, $01, $3E, $3E, $9C
    db   $9B, $04, $3A, $01, $3A, $3A, $9C, $9B, $04, $30, $01, $30, $30, $9C, $9B, $04
    db   $28, $01, $28, $28, $9C, $9B, $04, $26, $01, $26, $26, $9C, $9B, $04, $24, $01
    db   $24, $24, $9C, $9B, $02, $22, $01, $22, $22, $9C, $9B, $02, $20, $01, $20, $20
    db   $9C, $00, $00, $BB, $4A, $B4, $62, $D0, $62, $1C, $4B, $00, $00, $7D, $6D, $10
    db   $6D, $F2, $62, $09, $6E, $F2, $62, $04, $63, $2D, $6D, $A8, $6E, $7D, $6D, $47
    db   $51, $47, $51, $47, $51, $20, $6D, $00, $00, $F0, $6D, $F2, $62, $E1, $6D, $94
    db   $6E, $F2, $62, $13, $6E, $7C, $6E, $04, $63, $22, $6E, $A8, $6E, $47, $51, $CD
    db   $6D, $47, $51, $0E, $6E, $47, $51, $20, $6D, $00, $00, $A1, $2E, $34, $3C, $44
    db   $46, $4C, $54, $5C, $2C, $32, $3A, $42, $44, $42, $3A, $32, $00, $A1, $38, $3E
    db   $46, $4E, $50, $56, $5E, $66, $00, $00, $D9, $4A, $19, $63, $29, $63, $55, $63
    db   $00, $00, $A0, $6D, $C7, $63, $3B, $6E, $E7, $63, $A0, $6D, $18, $64, $FF, $FF
    db   $19, $63, $AA, $6D, $65, $63, $AA, $6D, $65, $63, $AA, $6D, $8B, $63, $AA, $6D
    db   $65, $63, $AA, $6D, $65, $63, $AA, $6D, $65, $63, $AA, $6D, $8B, $63, $AF, $6D
    db   $A9, $63, $AA, $6D, $8B, $63, $AF, $6D, $A9, $63, $FF, $FF, $29, $63, $6D, $6E
    db   $33, $64, $6D, $6E, $54, $64, $6D, $6E, $5A, $64, $FF, $FF, $55, $63, $A2, $02
    db   $0E, $04, $0C, $01, $04, $9D, $92, $00, $C0, $02, $0E, $04, $0C, $01, $04, $9D
    db   $B2, $00, $C0, $02, $0E, $04, $0C, $01, $04, $9D, $92, $00, $C0, $02, $0E, $04
    db   $0C, $01, $04, $00, $9B, $02, $02, $0E, $04, $0C, $01, $04, $9C, $9D, $92, $00
    db   $C0, $02, $0E, $04, $0C, $01, $04, $9D, $B2, $00, $C0, $02, $0E, $04, $0C, $01
    db   $04, $00, $02, $0E, $04, $0C, $01, $04, $9D, $92, $00, $C0, $02, $0E, $04, $0C
    db   $01, $04, $9D, $62, $00, $C0, $9B, $02, $02, $0E, $04, $0C, $01, $04, $9C, $00
    db   $AE, $01, $01, $9B, $02, $A1, $32, $32, $32, $32, $34, $32, $A2, $32, $AE, $01
    db   $A8, $01, $A2, $01, $4A, $A1, $32, $32, $A7, $01, $A5, $01, $AE, $01, $9C, $00
    db   $A1, $01, $50, $54, $56, $64, $A3, $5E, $A1, $5E, $62, $01, $AE, $01, $A4, $01
    db   $A1, $68, $62, $5E, $5C, $AE, $01, $A9, $2C, $A0, $01, $A1, $2C, $A7, $01, $A5
    db   $01, $A1, $62, $5E, $52, $50, $A5, $01, $01, $A4, $01, $A2, $30, $A1, $32, $01
    db   $00, $A1, $2C, $2C, $2C, $2C, $2E, $2C, $A2, $2C, $AE, $01, $A5, $01, $A1, $22
    db   $22, $22, $22, $24, $22, $A2, $22, $A5, $01, $AE, $01, $00, $99, $AE, $01, $01
    db   $9B, $02, $A1, $2E, $2E, $2E, $2E, $30, $2E, $A2, $2E, $AE, $01, $A8, $01, $A2
    db   $01, $46, $A1, $2E, $2E, $A7, $01, $AE, $01, $A5, $01, $9C, $00, $9B, $0C, $A8
    db   $01, $9C, $00, $A1, $24, $24, $24, $24, $26, $24, $24, $01, $A5, $01, $AE, $01
    db   $A1, $1A, $1A, $1A, $1A, $34, $1A, $1A, $01, $A5, $01, $AE, $01, $00, $00, $BB
    db   $4A, $80, $64, $B4, $64, $1C, $4B, $1C, $4B, $7F, $6E, $0E, $6E, $C0, $64, $C0
    db   $64, $13, $6E, $C0, $64, $D7, $64, $E0, $64, $E9, $64, $0E, $6E, $F2, $64, $13
    db   $6E, $FB, $64, $1D, $6E, $04, $65, $13, $6E, $0D, $65, $0E, $6E, $16, $65, $13
    db   $6E, $1F, $65, $1D, $6E, $28, $65, $42, $65, $FF, $FF, $88, $64, $20, $6D, $20
    db   $6D, $2C, $6E, $4B, $65, $FF, $FF, $B8, $64, $A3, $28, $32, $30, $32, $38, $32
    db   $30, $32, $00, $9B, $02, $A2, $28, $32, $30, $32, $38, $32, $30, $32, $9C, $00
    db   $2A, $32, $30, $32, $38, $32, $30, $32, $00, $2A, $36, $32, $36, $3C, $36, $32
    db   $36, $00, $28, $38, $36, $38, $40, $38, $36, $38, $00, $32, $38, $36, $38, $42
    db   $38, $36, $38, $00, $2A, $36, $32, $36, $3C, $36, $32, $36, $00, $2E, $36, $32
    db   $36, $3C, $36, $32, $36, $00, $2E, $38, $36, $38, $40, $38, $36, $38, $00, $2A
    db   $38, $36, $38, $42, $38, $36, $38, $00, $2C, $36, $32, $36, $3E, $36, $32, $36
    db   $00, $28, $36, $32, $36, $40, $36, $32, $36, $00, $30, $36, $3C, $42, $48, $4E
    db   $54, $5A, $58, $54, $4E, $48, $40, $3C, $36, $30, $00, $30, $36, $3C, $42, $48
    db   $4E, $54, $5A, $00, $9B, $02, $A3, $4A, $4E, $AE, $50, $9C, $A5, $4E, $48, $AE
    db   $4A, $A4, $01, $A3, $4A, $4E, $AE, $50, $A3, $4E, $50, $A5, $54, $A4, $01, $A3
    db   $46, $4E, $A5, $54, $A4, $5A, $AE, $58, $A4, $01, $A5, $54, $54, $56, $56, $58
    db   $58, $01, $01, $00, $00, $E8, $4A, $86, $65, $BA, $65, $1C, $4B, $00, $00, $24
    db   $6D, $7D, $6D, $CA, $64, $D7, $64, $D7, $64, $E0, $64, $E0, $64, $E9, $64, $E9
    db   $64, $F2, $64, $F2, $64, $FB, $64, $FB, $64, $04, $65, $04, $65, $0D, $65, $0D
    db   $65, $16, $65, $16, $65, $1F, $65, $1F, $65, $28, $65, $28, $65, $31, $65, $FF
    db   $FF, $88, $65, $0E, $6E, $CA, $64, $D7, $64, $13, $6E, $D7, $64, $CD, $6D, $E0
    db   $64, $FA, $6D, $E0, $64, $13, $6E, $E9, $64, $0E, $6E, $E9, $64, $F2, $64, $13
    db   $6E, $F2, $64, $CD, $6D, $FB, $64, $0E, $6E, $FB, $64, $09, $6E, $04, $65, $0E
    db   $6E, $04, $65, $13, $6E, $0D, $65, $09, $6E, $0D, $65, $0E, $6E, $16, $65, $13
    db   $6E, $16, $65, $CD, $6D, $1F, $65, $FA, $6D, $1F, $65, $28, $65, $E6, $6D, $28
    db   $65, $CD, $6D, $31, $65, $FF, $FF, $BA, $65, $00, $E8, $4A, $1C, $4B, $1B, $66
    db   $1C, $4B, $00, $00, $F5, $6D, $25, $66, $20, $6D, $FF, $FF, $1B, $66, $A2, $02
    db   $0E, $0C, $A7, $01, $A6, $01, $A1, $02, $A2, $02, $0E, $A1, $0C, $18, $00, $00
    db   $BB, $4A, $41, $66, $4D, $66, $1C, $4B, $00, $00, $09, $6E, $24, $6D, $10, $6D
    db   $53, $66, $FF, $FF, $47, $66, $CD, $6D, $FF, $FF, $47, $66, $A3, $32, $46, $58
    db   $66, $70, $01, $A3, $2E, $42, $54, $62, $6C, $01, $00, $00, $CA, $4A, $6D, $66
    db   $7B, $66, $1C, $4B, $00, $00, $09, $6E, $10, $6D, $85, $66, $9B, $66, $AB, $66
    db   $FF, $FF, $75, $66, $0E, $6E, $85, $66, $8F, $66, $FF, $FF, $7F, $66, $A1, $8E
    db   $8C, $84, $7C, $76, $74, $6C, $64, $00, $9B, $03, $A7, $74, $01, $9C, $A2, $74
    db   $74, $A4, $01, $00, $A4, $01, $A6, $01, $9B, $02, $A7, $54, $01, $9C, $A2, $54
    db   $54, $A4, $01, $00, $9B, $03, $A7, $54, $01, $9C, $A2, $54, $54, $A4, $01, $00
    db   $00, $CA, $4A, $C2, $66, $D4, $66, $E6, $66, $00, $00, $7D, $6D, $10, $6D, $F6
    db   $66, $A4, $6E, $09, $6E, $45, $67, $A8, $6E, $FF, $FF, $C2, $66, $A0, $6D, $F6
    db   $66, $10, $6D, $A4, $6E, $BE, $6D, $19, $67, $A8, $6E, $FF, $FF, $D4, $66, $10
    db   $6D, $18, $6D, $A4, $6E, $68, $6E, $00, $67, $A8, $6E, $FF, $FF, $E6, $66, $A1
    db   $8E, $8C, $84, $7C, $76, $74, $6C, $64, $00, $9B, $02, $A3, $01, $A6, $88, $A1
    db   $01, $AE, $01, $01, $01, $A5, $01, $9C, $A3, $01, $A6, $88, $A1, $01, $AE, $01
    db   $01, $00, $9D, $61, $86, $80, $9B, $02, $A3, $64, $68, $6A, $82, $A5, $01, $A3
    db   $01, $80, $7C, $6A, $A5, $01, $9C, $A3, $64, $68, $6A, $01, $01, $68, $64, $58
    db   $5E, $64, $A8, $01, $A3, $68, $6A, $6E, $70, $88, $AE, $01, $01, $00, $9B, $04
    db   $A2, $54, $5C, $4C, $52, $54, $52, $4C, $44, $9C, $9B, $04, $52, $58, $48, $50
    db   $52, $58, $60, $68, $9C, $9B, $04, $50, $58, $46, $4C, $50, $4C, $46, $40, $9C
    db   $9B, $03, $52, $58, $48, $50, $52, $58, $60, $68, $9C, $52, $58, $48, $50, $00
    db   $00, $CA, $4A, $82, $67, $8A, $67, $1C, $4B, $00, $00, $09, $6E, $D6, $5D, $FF
    db   $FF, $82, $67, $13, $6E, $9A, $6E, $FF, $FF, $92, $67, $20, $5E, $4D, $5E, $5F
    db   $5E, $FF, $FF, $92, $67, $00, $D9, $4A, $A7, $67, $FD, $67, $D3, $67, $00, $00
    db   $10, $6D, $78, $6D, $DB, $68, $DB, $68, $DB, $68, $DB, $68, $DB, $68, $DB, $68
    db   $78, $6D, $DB, $68, $DB, $68, $7D, $6D, $97, $68, $78, $6D, $DB, $68, $C4, $68
    db   $20, $6D, $20, $6D, $20, $6D, $20, $6D, $FF, $FF, $A9, $67, $73, $69, $68, $6E
    db   $56, $68, $6D, $6E, $56, $68, $68, $6E, $25, $68, $77, $6E, $25, $68, $68, $6E
    db   $39, $68, $6D, $6E, $66, $68, $68, $6E, $73, $68, $6D, $6E, $7F, $68, $77, $6E
    db   $8B, $68, $FF, $FF, $D3, $67, $09, $6E, $FC, $68, $FC, $68, $FC, $68, $FC, $68
    db   $FC, $68, $FC, $68, $09, $6E, $FC, $68, $FC, $68, $97, $68, $FC, $68, $0E, $6E
    db   $C4, $68, $09, $6E, $35, $69, $78, $6D, $65, $69, $FF, $FF, $FD, $67, $A3, $50
    db   $64, $62, $6E, $A4, $01, $A2, $01, $64, $62, $50, $A3, $4E, $60, $5E, $6C, $A5
    db   $01, $00, $A3, $4C, $5C, $5A, $6A, $A5, $01, $A3, $4A, $5A, $58, $68, $A5, $01
    db   $A3, $48, $58, $56, $66, $A5, $01, $A3, $4A, $5A, $58, $68, $A5, $01, $00, $99
    db   $A3, $4C, $5C, $5A, $6A, $A5, $01, $A3, $4A, $5A, $58, $68, $A5, $01, $00, $9A
    db   $A2, $30, $34, $36, $44, $48, $4C, $4E, $5C, $A5, $01, $00, $A2, $30, $34, $36
    db   $42, $48, $4C, $4E, $5A, $A5, $01, $00, $A2, $34, $38, $3A, $48, $4C, $50, $52
    db   $60, $A5, $01, $00, $A2, $34, $38, $3A, $46, $4C, $50, $52, $5E, $A5, $01, $00
    db   $9B, $02, $A2, $01, $38, $3C, $38, $3C, $A7, $01, $9C, $9B, $02, $A2, $01, $36
    db   $3C, $36, $3C, $A7, $01, $9C, $9B, $02, $A2, $01, $38, $3C, $3E, $46, $A7, $01
    db   $9C, $9B, $02, $A2, $01, $36, $3C, $3E, $4E, $A7, $01, $9C, $00, $9B, $02, $3E
    db   $36, $3E, $40, $46, $48, $46, $44, $9C, $9B, $02, $32, $38, $40, $42, $48, $4A
    db   $48, $42, $9C, $00, $A2, $44, $4C, $4A, $4C, $9D, $20, $00, $80, $9B, $03, $A2
    db   $44, $4C, $4A, $4C, $9C, $9B, $03, $42, $48, $4A, $48, $9C, $9D, $10, $00, $80
    db   $42, $48, $4A, $48, $00, $A2, $44, $4C, $4A, $4C, $9D, $37, $00, $80, $44, $4C
    db   $4A, $4C, $9D, $53, $00, $80, $44, $4C, $4A, $4C, $9D, $64, $00, $80, $44, $4C
    db   $4A, $4C, $9D, $53, $00, $80, $42, $48, $4A, $48, $9D, $37, $00, $80, $42, $48
    db   $4A, $48, $9D, $27, $00, $80, $9B, $02, $42, $48, $4A, $48, $9C, $00, $A2, $01
    db   $30, $34, $36, $44, $48, $4C, $4E, $60, $64, $66, $74, $A4, $01, $A2, $01, $30
    db   $34, $36, $42, $48, $4C, $4E, $60, $64, $66, $72, $A4, $01, $A2, $01, $34, $38
    db   $3A, $48, $4C, $50, $52, $64, $68, $6A, $78, $A4, $01, $A2, $01, $00, $34, $38
    db   $3A, $46, $4C, $50, $52, $64, $68, $6A, $76, $A4, $01, $00, $9B, $18, $A5, $01
    db   $9C, $00, $00, $D9, $4A, $84, $69, $8E, $69, $98, $69, $00, $00, $FF, $6D, $A2
    db   $69, $4A, $6E, $B4, $69, $00, $00, $FF, $6D, $B7, $69, $4A, $6E, $C9, $69, $00
    db   $00, $54, $6E, $CC, $69, $59, $6E, $DA, $69, $00, $00, $A1, $01, $A4, $01, $A3
    db   $1C, $20, $A8, $22, $A3, $01, $22, $26, $A7, $2A, $A2, $2E, $00, $AE, $1A, $00
    db   $A1, $01, $A4, $01, $A3, $2E, $30, $A8, $34, $A3, $01, $34, $38, $A7, $3A, $A2
    db   $3E, $00, $AE, $42, $00, $9B, $02, $99, $A1, $0E, $9A, $A5, $0E, $A3, $0E, $A6
    db   $01, $9C, $00, $A1, $01, $AE, $14, $00, $00, $E8, $4A, $EA, $69, $F4, $69, $FE
    db   $69, $00, $00, $7D, $6D, $10, $6D, $08, $6A, $FF, $FF, $F8, $69, $87, $6D, $08
    db   $6A, $12, $6A, $FF, $FF, $30, $6D, $18, $6D, $77, $6E, $1C, $6A, $FF, $FF, $30
    db   $6D, $A1, $80, $78, $72, $6A, $68, $60, $5A, $50, $00, $A1, $54, $5C, $62, $6A
    db   $6C, $74, $7A, $82, $00, $99, $A2, $54, $54, $00, $00, $D9, $4A, $54, $6A, $2C
    db   $6A, $7C, $6A, $00, $00, $A0, $6D, $9B, $6A, $A5, $6A, $B0, $6E, $96, $6D, $A8
    db   $6A, $10, $6D, $7D, $6D, $08, $6A, $24, $6D, $2D, $6D, $96, $6A, $78, $6B, $A0
    db   $6D, $28, $6B, $09, $6E, $40, $6B, $27, $6D, $FF, $FF, $32, $6A, $7D, $6D, $10
    db   $6D, $9B, $6A, $2D, $6D, $B0, $6E, $22, $6B, $87, $6D, $08, $6A, $20, $6D, $20
    db   $6D, $20, $6D, $20, $6D, $10, $6D, $7D, $6D, $28, $6B, $27, $6D, $2D, $6D, $10
    db   $6D, $FF, $FF, $5C, $6A, $18, $6D, $24, $6D, $6D, $6E, $B0, $6E, $10, $6D, $67
    db   $5D, $46, $6B, $15, $6D, $2D, $6D, $18, $6D, $24, $6D, $FF, $FF, $80, $6A, $9D
    db   $C2, $83, $C0, $00, $A1, $44, $48, $4C, $50, $56, $5C, $60, $64, $00, $68, $6E
    db   $00, $9D, $B1, $83, $80, $A6, $01, $64, $68, $6A, $9D, $81, $83, $80, $A2, $3E
    db   $42, $44, $4C, $52, $A1, $01, $9D, $B1, $83, $80, $A6, $64, $68, $6A, $9D, $81
    db   $83, $80, $A2, $30, $3E, $44, $4C, $50, $9D, $B1, $83, $80, $68, $64, $5A, $60
    db   $9D, $81, $83, $80, $3A, $42, $64, $50, $A7, $01, $A2, $34, $3C, $42, $48, $4C
    db   $9D, $B1, $83, $80, $64, $68, $6A, $9D, $81, $83, $80, $A2, $3E, $42, $44, $4C
    db   $52, $9D, $B1, $83, $80, $60, $6A, $74, $9D, $81, $83, $80, $A2, $30, $3E, $44
    db   $4C, $56, $9D, $B1, $83, $80, $72, $6E, $72, $9D, $81, $83, $80, $A2, $3A, $42
    db   $48, $50, $52, $5A, $60, $68, $78, $01, $90, $01, $00, $9B, $11, $A4, $01, $9C
    db   $00, $A1, $1C, $22, $2A, $30, $38, $3A, $42, $48, $50, $48, $42, $3A, $38, $30
    db   $2A, $22, $18, $26, $2C, $34, $3E, $44, $00, $4C, $56, $60, $A9, $01, $00, $A9
    db   $01, $A3, $01, $A3, $80, $7C, $72, $A7, $72, $A4, $74, $A7, $01, $A3, $86, $82
    db   $72, $A7, $72, $A3, $74, $A2, $01, $A3, $74, $A3, $78, $01, $A2, $66, $6C, $78
    db   $A4, $72, $A7, $01, $A2, $6A, $A4, $7C, $01, $A2, $01, $A7, $7A, $8C, $A3, $8A
    db   $00, $9D, $C2, $83, $C0, $A3, $80, $7C, $72, $A2, $72, $9D, $72, $00, $80, $26
    db   $34, $9D, $C2, $83, $C0, $74, $9D, $72, $00, $80, $A1, $3E, $42, $44, $4C, $56
    db   $5A, $5C, $6A, $34, $42, $50, $60, $9D, $C2, $83, $C0, $A3, $86, $82, $72, $A2
    db   $72, $9D, $72, $00, $80, $3E, $4C, $9D, $C2, $83, $C0, $74, $9D, $72, $00, $80
    db   $A1, $56, $5A, $5C, $64, $9D, $C2, $83, $C0, $A3, $74, $78, $9D, $72, $00, $80
    db   $A1, $4E, $54, $5A, $60, $9D, $C2, $83, $C0, $A2, $66, $6C, $78, $72, $9D, $72
    db   $00, $80, $A1, $01, $52, $5A, $60, $6A, $72, $78, $7E, $A3, $82, $9D, $C2, $83
    db   $C0, $A2, $6A, $7C, $9D, $72, $00, $80, $A1, $2C, $34, $3A, $42, $44, $4C, $52
    db   $5A, $4C, $52, $5A, $5C, $52, $5A, $5C, $64, $9D, $C2, $83, $C0, $A7, $7A, $8C
    db   $A3, $8A, $00, $CA, $4A, $14, $6C, $1E, $6C, $26, $6C, $00, $00, $9B, $6D, $40
    db   $6C, $2A, $6D, $FF, $FF, $22, $6C, $B9, $6D, $2E, $6C, $38, $6C, $00, $00, $6D
    db   $6E, $10, $6D, $FF, $FF, $20, $6C, $A1, $52, $5A, $60, $68, $6A, $72, $78, $80
    db   $00, $A3, $01, $A1, $8A, $90, $01, $01, $00, $9B, $02, $A1, $3A, $42, $48, $42
    db   $9C, $00, $00, $BB, $4A, $54, $6C, $66, $6C, $1C, $4B, $00, $00, $E1, $6D, $03
    db   $6D, $F0, $6D, $03, $6D, $03, $6D, $E1, $6D, $03, $6D, $FF, $FF, $54, $6C, $9B
    db   $6D, $E9, $6C, $8C, $6D, $9D, $6E, $E9, $6C, $94, $6E, $E9, $6C, $9B, $6D, $97
    db   $6E, $E9, $6C, $7C, $6E, $FF, $FF, $66, $6C, $00, $BB, $4A, $8B, $6C, $A5, $6C
    db   $D3, $6C, $E1, $6C, $E1, $6D, $03, $6D, $F0, $6D, $03, $6D, $FF, $6D, $03, $6D
    db   $03, $6D, $03, $6D, $03, $6D, $03, $6D, $A0, $6E, $FF, $FF, $47, $5F, $9B, $6D
    db   $E9, $6C, $8C, $6D, $9D, $6E, $E9, $6C, $EB, $6D, $94, $6E, $E9, $6C, $97, $6E
    db   $E9, $6C, $8C, $6D, $7C, $6E, $F6, $6C, $B9, $6D, $9D, $6E, $F6, $6C, $EB, $6D
    db   $94, $6E, $F6, $6C, $7C, $6E, $A0, $6E, $FF, $FF, $5D, $5F, $20, $6D, $20, $6D
    db   $20, $6D, $15, $6D, $A0, $6E, $FF, $FF, $77, $5F, $0A, $6D, $A0, $6E, $FF, $FF
    db   $8B, $5F, $9B, $02, $A1, $06, $0C, $12, $1A, $1E, $24, $2A, $32, $9C, $00, $9B
    db   $02, $A1, $1E, $24, $2A, $32, $36, $3C, $42, $4A, $9C, $00, $99, $A2, $06, $06
    db   $A8, $01, $00, $9B, $07, $A5, $01, $9C, $00, $A1, $01, $A9, $01, $00, $A5, $01
    db   $00, $A4, $01, $00, $A5, $01, $A8, $01, $00, $A5, $01, $01, $00, $A2, $01, $00
    db   $A6, $01, $00, $A1, $01, $00, $A0, $01, $00, $15, $6D, $FF, $FF, $30, $6D, $99
    db   $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $00, $00, $00
    db   $00, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $99, $99, $99, $99, $00, $00, $00, $00, $99, $99, $99, $99, $00, $00, $00
    db   $00, $44, $44, $44, $44, $00, $00, $00, $00, $44, $44, $44, $44, $00, $00, $00
    db   $00, $9D, $10, $00, $80, $00, $9D, $20, $00, $80, $00, $9D, $24, $83, $C0, $00
    db   $9D, $46, $86, $80, $00, $9D, $81, $83, $C0, $00, $9D, $A2, $83, $C0, $00, $9D
    db   $91, $83, $80, $00, $9D, $52, $83, $C0, $00, $9D, $62, $00, $80, $00, $9D, $82
    db   $00, $80, $00, $9D, $62, $00, $C0, $00, $9D, $92, $00, $C0, $00, $9D, $B2, $00
    db   $C0, $00, $9D, $C1, $83, $00, $00, $9D, $45, $00, $80, $00, $9D, $53, $00, $80
    db   $00, $9D, $93, $00, $00, $00, $9D, $64, $00, $80, $00, $9D, $84, $86, $80, $00
    db   $9D, $B4, $86, $80, $00, $9D, $E4, $86, $80, $00, $9D, $75, $86, $80, $00, $9D
    db   $A5, $00, $80, $00, $9D, $F5, $86, $80, $00, $9D, $A5, $86, $80, $00, $9D, $A5
    db   $46, $80, $00, $9D, $85, $00, $80, $00, $9D, $E7, $86, $80, $00, $9D, $17, $00
    db   $80, $00, $9D, $27, $00, $80, $00, $9D, $37, $00, $80, $00, $9D, $47, $00, $80
    db   $00, $9D, $86, $00, $C0, $00, $9D, $66, $00, $80, $00, $9D, $87, $00, $80, $00
    db   $9D, $48, $00, $80, $00, $9D, $38, $00, $81, $00, $9D, $48, $86, $80, $00, $9D
    db   $48, $00, $00, $00, $9D, $58, $00, $00, $00, $9D, $A8, $86, $C0, $00, $9D, $88
    db   $00, $00, $00, $9D, $1F, $00, $00, $00, $9D, $5F, $00, $80, $00, $9D, $38, $6D
    db   $20, $00, $9D, $48, $6D, $20, $00, $9D, $48, $6D, $40, $00, $9D, $58, $6D, $20
    db   $00, $9D, $58, $6D, $40, $00, $9D, $58, $6D, $60, $00, $9D, $68, $6D, $40, $00
    db   $9D, $68, $6D, $60, $00, $9F, $00, $00, $9F, $18, $00, $9F, $16, $00, $9F, $0E
    db   $00, $9F, $0C, $00, $9F, $0A, $00, $9F, $08, $00, $9F, $06, $00, $9F, $04, $00
    db   $9F, $02, $00, $9F, $D0, $00, $9F, $FE, $00, $9E, $9D, $4A, $00, $9E, $AC, $4A
    db   $00, $9E, $CA, $4A, $00, $9E, $D9, $4A, $00, $9E, $E8, $4A, $00, $9E, $F7, $4A
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $D9, $4A, $0B, $70, $1C, $4B
    db   $13, $70, $00, $00, $1D, $70, $97, $70, $C0, $70, $00, $00, $26, $70, $97, $70
    db   $91, $70, $C0, $70, $00, $00, $9D, $20, $00, $81, $A2, $01, $A9, $01, $00, $9D
    db   $0F, $73, $01, $94, $00, $00, $D9, $4A, $37, $70, $3F, $70, $43, $70, $00, $00
    db   $4D, $70, $97, $70, $C0, $70, $00, $00, $58, $70, $00, $00, $89, $70, $97, $70
    db   $91, $70, $C0, $70, $00, $00, $9D, $20, $00, $81, $A2, $01, $A9, $01, $AE, $01
    db   $00, $9D, $47, $00, $80, $96, $9B, $0A, $A3, $74, $66, $6A, $78, $9C, $9B, $02
    db   $6E, $60, $66, $6E, $70, $60, $6A, $70, $9C, $74, $62, $6A, $74, $7A, $68, $6E
    db   $74, $70, $60, $66, $70, $6A, $5E, $64, $76, $9B, $02, $74, $66, $6A, $78, $9C
    db   $95, $00, $9D, $0F, $73, $01, $AE, $01, $94, $00, $9D, $E1, $72, $01, $94, $00
    db   $96, $A2, $01, $30, $34, $A8, $36, $A2, $30, $34, $A8, $36, $A2, $34, $30, $26
    db   $A7, $2C, $A5, $30, $A3, $01, $A2, $30, $34, $A8, $36, $A2, $2C, $36, $A8, $40
    db   $A2, $3E, $3A, $A5, $3E, $01, $A2, $01, $00, $A3, $01, $64, $60, $56, $A7, $56
    db   $A5, $58, $A2, $6A, $66, $64, $60, $56, $52, $56, $60, $A7, $58, $A2, $58, $A4
    db   $5C, $A2, $01, $4A, $52, $5C, $A8, $56, $A2, $01, $4E, $A8, $60, $A7, $01, $5E
    db   $70, $6E, $01, $A4, $01, $A5, $01, $95, $00, $00, $D9, $4A, $3F, $70, $FB, $70
    db   $43, $70, $00, $00, $07, $71, $14, $71, $23, $71, $23, $71, $33, $71, $00, $00
    db   $9D, $71, $82, $80, $96, $9B, $04, $A2, $4E, $56, $64, $5C, $9C, $9B, $04, $52
    db   $58, $66, $60, $9C, $9B, $04, $4E, $56, $64, $60, $9C, $00, $9B, $02, $A2, $48
    db   $4E, $60, $56, $9C, $9B, $02, $48, $52, $60, $58, $9C, $00, $9B, $02, $44, $4A
    db   $58, $52, $9C, $9B, $02, $44, $4A, $56, $50, $9C, $9B, $02, $40, $48, $56, $4E
    db   $9C, $9B, $02, $40, $46, $52, $4C, $9C, $9B, $04, $4E, $56, $64, $5C, $9C, $95
    db   $00, $00, $D9, $4A, $63, $71, $FB, $70, $43, $70, $00, $00, $6D, $71, $76, $71
    db   $76, $71, $8A, $71, $00, $00, $9D, $87, $00, $80, $96, $A5, $8C, $8C, $00, $9D
    db   $87, $00, $80, $A5, $8C, $8C, $9D, $37, $00, $80, $9B, $02, $A3, $74, $66, $6A
    db   $78, $9C, $00, $9D, $76, $00, $80, $9B, $02, $A4, $90, $86, $90, $88, $9C, $8C
    db   $88, $86, $8C, $90, $88, $8E, $88, $9D, $87, $00, $80, $A5, $8C, $8C, $00, $00
    db   $D9, $4A, $63, $71, $FB, $70, $43, $70, $B1, $71, $B5, $71, $00, $00, $9B, $0A
    db   $A1, $1F, $1F, $1F, $1F, $A2, $1F, $A3, $24, $A2, $1F, $A3, $24, $A1, $1F, $1F
    db   $1F, $1F, $A3, $24, $A1, $1F, $1F, $1F, $1F, $A3, $24, $9C, $00, $00, $D9, $4A
    db   $DF, $71, $EF, $71, $43, $70, $B1, $71, $6D, $71, $76, $71, $76, $71, $37, $72
    db   $23, $71, $23, $71, $33, $71, $00, $00, $F7, $71, $04, $72, $13, $72, $00, $00
    db   $9D, $19, $45, $40, $96, $9B, $02, $A3, $1E, $2C, $26, $2C, $9C, $9B, $02, $22
    db   $30, $28, $30, $9C, $9B, $02, $1E, $2C, $26, $2C, $9C, $00, $9B, $02, $A3, $18
    db   $26, $1E, $26, $18, $28, $22, $28, $9C, $2C, $22, $1A, $22, $2C, $20, $1A, $20
    db   $28, $1E, $18, $1E, $28, $1C, $16, $1C, $9B, $02, $1E, $2C, $26, $2C, $9C, $00
    db   $9D, $61, $82, $80, $00, $00, $D9, $4A, $FB, $70, $47, $72, $43, $70, $53, $72
    db   $6D, $71, $76, $71, $76, $71, $7D, $72, $13, $72, $00, $00, $82, $72, $82, $72
    db   $82, $72, $82, $72, $82, $72, $82, $72, $82, $72, $82, $72, $82, $72, $82, $72
    db   $95, $72, $82, $72, $95, $72, $82, $72, $82, $72, $82, $72, $82, $72, $82, $72
    db   $82, $72, $82, $72, $00, $00, $9D, $19, $45, $40, $00, $9B, $03, $A2, $1A, $A9
    db   $15, $AD, $01, $A9, $15, $AD, $01, $A9, $15, $9C, $A2, $1A, $1A, $00, $9B, $02
    db   $A1, $1F, $1F, $1F, $1F, $A2, $1F, $A3, $24, $A2, $1F, $A3, $24, $00, $00, $E8
    db   $4A, $1C, $4B, $B0, $72, $B6, $72, $00, $00, $BA, $72, $C8, $72, $00, $00, $C3
    db   $72, $00, $00, $9D, $20, $00, $41, $A1, $01, $A0, $01, $00, $9D, $E1, $72, $01
    db   $94, $A2, $60, $64, $A8, $66, $A2, $60, $64, $A4, $66, $A2, $64, $A6, $60, $A3
    db   $56, $AE, $6E, $9A, $9B, $20, $A5, $01, $9C, $00, $01, $35, $66, $53, $10, $02
    db   $46, $8A, $01, $35, $66, $53, $10, $02, $46, $8A, $00, $F7, $4A, $1C, $4B, $FC
    db   $72, $02, $73, $00, $00, $06, $73, $24, $73, $00, $00, $1F, $73, $00, $00, $9D
    db   $20, $00, $41, $A1, $01, $A0, $01, $00, $06, $9B, $CD, $DE, $EE, $FF, $FF, $FE
    db   $06, $9B, $CD, $DE, $EE, $FF, $FF, $FE, $9D, $0F, $73, $01, $94, $A1, $30, $34
    db   $A4, $36, $A3, $01, $A1, $30, $34, $A2, $36, $34, $A6, $30, $A3, $26, $A2, $01
    db   $A5, $3E, $9B, $20, $AE, $01, $9C, $00, $00, $D9, $4A, $1C, $4B, $4A, $73, $54
    db   $73, $00, $00, $5A, $73, $5A, $73, $6A, $73, $FF, $FF, $BB, $78, $80, $73, $FF
    db   $FF, $BB, $78, $9D, $81, $00, $80, $A1, $74, $66, $6A, $78, $9D, $A6, $00, $80
    db   $A4, $74, $00, $9D, $82, $00, $80, $A2, $74, $66, $A6, $6A, $9D, $85, $00, $80
    db   $A3, $78, $9D, $A6, $00, $80, $AE, $74, $00, $9D, $0C, $75, $23, $99, $9B, $02
    db   $A1, $6A, $5C, $60, $6E, $A4, $6A, $9C, $A2, $6A, $5C, $A6, $60, $A3, $6E, $AE
    db   $6A, $9B, $20, $AE, $01, $9C, $00, $18, $9D, $4A, $1C, $4B, $A9, $73, $AF, $73
    db   $00, $00, $B3, $73, $D1, $73, $00, $00, $CC, $73, $00, $00, $9D, $10, $00, $80
    db   $A3, $01, $A1, $01, $00, $46, $79, $98, $64, $43, $10, $01, $34, $46, $79, $98
    db   $64, $43, $10, $01, $34, $9D, $BC, $73, $20, $99, $A3, $62, $60, $58, $52, $A6
    db   $4A, $48, $4A, $52, $58, $AB, $60, $58, $52, $4A, $A2, $48, $4A, $52, $58, $60
    db   $58, $52, $4A, $48, $4A, $52, $58, $9B, $02, $5E, $56, $50, $48, $46, $48, $50
    db   $56, $9C, $58, $50, $4A, $42, $40, $42, $4A, $50, $AB, $54, $4C, $46, $3E, $A6
    db   $3C, $3E, $A3, $46, $4C, $AA, $01, $A2, $50, $9B, $20, $AE, $01, $9C, $00, $00
    db   $BB, $4A, $21, $74, $27, $74, $2D, $74, $00, $00, $33, $74, $FF, $FF, $BB, $78
    db   $58, $74, $FF, $FF, $BB, $78, $8C, $74, $FF, $FF, $BB, $78, $9D, $81, $00, $80
    db   $A1, $01, $A2, $6E, $9D, $C1, $00, $80, $A2, $6E, $A6, $01, $A4, $01, $9D, $A2
    db   $00, $80, $A2, $01, $A3, $64, $6A, $74, $6A, $78, $9D, $A7, $00, $80, $AE, $8C
    db   $00, $9D, $61, $00, $80, $A2, $6E, $9D, $A1, $00, $80, $A2, $6E, $9D, $E5, $00
    db   $80, $A8, $6E, $9D, $A2, $00, $80, $A3, $60, $66, $6E, $72, $6E, $82, $9D, $A7
    db   $00, $80, $AE, $86, $00, $66, $00, $66, $00, $66, $00, $66, $00, $66, $00, $66
    db   $00, $66, $00, $66, $00, $9D, $7C, $74, $23, $99, $A1, $64, $64, $64, $64, $A8
    db   $64, $A2, $56, $5A, $5C, $78, $64, $6A, $68, $60, $64, $6E, $78, $82, $AE, $7C
    db   $00, $00, $CA, $4A, $1C, $4B, $B3, $74, $CF, $74, $00, $00, $D3, $74, $EC, $74
    db   $D3, $74, $FE, $74, $D3, $74, $FE, $74, $D3, $74, $EC, $74, $D3, $74, $FE, $74
    db   $D3, $74, $05, $75, $40, $75, $00, $00, $1C, $75, $00, $00, $9D, $21, $00, $80
    db   $A1, $78, $9D, $41, $00, $80, $A1, $78, $9D, $71, $00, $80, $A1, $78, $9D, $A1
    db   $00, $80, $A1, $78, $00, $9D, $A1, $00, $80, $A2, $78, $9D, $C3, $00, $80, $A3
    db   $78, $9D, $82, $00, $80, $A2, $78, $9D, $D2, $00, $80, $A3, $78, $00, $9D, $E3
    db   $00, $80, $AE, $78, $00, $00, $0C, $00, $0C, $00, $0C, $00, $0C, $06, $06, $06
    db   $06, $06, $06, $06, $06, $9D, $0C, $75, $20, $99, $9B, $02, $A1, $86, $86, $86
    db   $86, $A2, $86, $A3, $86, $A2, $86, $A3, $86, $A1, $86, $86, $86, $86, $A3, $86
    db   $A1, $86, $86, $86, $86, $A3, $86, $9C, $9A, $9B, $20, $AE, $01, $9C, $00, $00
    db   $E8, $4A, $1C, $4B, $51, $75, $59, $75, $00, $00, $5F, $75, $7D, $75, $FF, $FF
    db   $BB, $78, $78, $75, $FF, $FF, $BB, $78, $9D, $20, $00, $80, $A2, $01, $A9, $01
    db   $00, $88, $88, $88, $84, $00, $00, $00, $00, $88, $88, $88, $84, $00, $00, $00
    db   $00, $9D, $68, $75, $00, $94, $A2, $48, $4C, $A8, $4E, $A2, $48, $4C, $A3, $4E
    db   $4C, $48, $A0, $01, $A3, $3E, $A1, $01, $A5, $56, $00, $00, $D9, $4A, $1C, $4B
    db   $9D, $75, $1C, $4B, $AD, $75, $B5, $75, $B5, $75, $CB, $75, $B5, $75, $B5, $75
    db   $CB, $75, $FF, $FF, $BB, $78, $E2, $75, $E2, $75, $FA, $75, $00, $00, $9D, $A1
    db   $00, $80, $97, $A2, $36, $9D, $61, $00, $80, $A9, $2C, $AD, $01, $A9, $2C, $AD
    db   $01, $A9, $2C, $00, $A1, $2C, $9D, $A1, $00, $80, $A1, $36, $9D, $61, $00, $80
    db   $A1, $2C, $2C, $9D, $A1, $00, $80, $A2, $36, $36, $00, $9B, $02, $A2, $FF, $A9
    db   $15, $AD, $01, $A9, $15, $AD, $01, $A9, $15, $9C, $A1, $15, $FF, $15, $15, $A2
    db   $FF, $FF, $00, $9B, $20, $AE, $01, $9C, $00, $00, $D9, $4A, $0B, $76, $17, $76
    db   $21, $76, $00, $00, $27, $76, $34, $76, $4A, $76, $5D, $76, $FF, $FF, $0D, $76
    db   $30, $76, $4A, $76, $5D, $76, $FF, $FF, $17, $76, $8A, $76, $FF, $FF, $0D, $76
    db   $9D, $20, $00, $80, $A1, $01, $A9, $01, $00, $9D, $60, $21, $80, $A2, $01, $60
    db   $64, $A8, $66, $A2, $60, $64, $A8, $66, $A2, $64, $60, $56, $A7, $5C, $A5, $60
    db   $A3, $01, $00, $A2, $60, $64, $A8, $66, $A2, $5C, $66, $A8, $70, $A2, $6E, $6A
    db   $A5, $6E, $01, $A7, $01, $00, $A3, $7C, $78, $6E, $A7, $6E, $A5, $70, $A2, $82
    db   $7E, $7C, $78, $6E, $6A, $6E, $78, $A7, $70, $A2, $70, $A4, $74, $A2, $01, $62
    db   $6A, $74, $A8, $6E, $A2, $01, $66, $A5, $78, $A2, $01, $A7, $76, $88, $86, $01
    db   $A5, $01, $00, $9D, $68, $6D, $60, $A3, $01, $A1, $01, $00, $00, $D9, $4A, $9E
    db   $76, $AE, $76, $B8, $76, $00, $00, $BE, $76, $14, $71, $14, $71, $23, $71, $23
    db   $71, $33, $71, $FF, $FF, $A0, $76, $30, $76, $C7, $76, $5D, $76, $FF, $FF, $AE
    db   $76, $EB, $76, $FF, $FF, $B8, $76, $9D, $19, $42, $40, $A7, $01, $A2, $01, $00
    db   $A2, $30, $34, $A8, $36, $A2, $2C, $36, $A8, $40, $A2, $3E, $3A, $AE, $3E, $A4
    db   $01, $A7, $01, $00, $01, $37, $9A, $BB, $BB, $BB, $A6, $21, $01, $37, $9A, $BB
    db   $BB, $BB, $A6, $21, $9D, $DB, $76, $40, $9B, $08, $A5, $01, $9C, $A8, $01, $A3
    db   $6A, $66, $A6, $5C, $A1, $01, $A7, $5C, $A8, $60, $A3, $01, $A1, $70, $01, $6E
    db   $01, $6A, $01, $66, $01, $5C, $01, $58, $01, $5C, $01, $66, $01, $A6, $60, $01
    db   $A2, $60, $A7, $62, $A3, $01, $A1, $52, $01, $58, $01, $62, $01, $A4, $5C, $A7
    db   $01, $A2, $56, $A8, $66, $A7, $01, $A3, $64, $A2, $01, $A3, $5E, $A2, $01, $A3
    db   $5C, $A4, $01, $A5, $01, $00, $00, $06, $4B, $48, $77, $4C, $77, $50, $77, $54
    db   $77, $58, $77, $00, $00, $A3, $77, $00, $00, $27, $78, $00, $00, $8C, $78, $00
    db   $00, $9D, $62, $00, $00, $A1, $1E, $22, $24, $A6, $26, $A1, $26, $28, $2A, $A6
    db   $2C, $A1, $2C, $30, $32, $34, $A3, $36, $97, $3C, $98, $9D, $41, $00, $80, $9B
    db   $06, $A2, $78, $A1, $7E, $A2, $74, $7E, $78, $7E, $A1, $78, $A2, $74, $7E, $9C
    db   $9D, $61, $00, $40, $A6, $70, $A1, $70, $6C, $A2, $74, $70, $70, $A1, $70, $A2
    db   $6C, $74, $88, $88, $84, $A7, $88, $97, $A3, $2C, $98, $00, $9D, $81, $00, $40
    db   $A1, $3E, $40, $42, $A6, $44, $A1, $44, $46, $48, $A6, $4A, $A1, $4A, $4E, $52
    db   $54, $A4, $56, $AE, $01, $97, $A1, $01, $A2, $4A, $A1, $4A, $A2, $40, $A1, $30
    db   $30, $98, $A6, $30, $A1, $30, $2C, $A2, $32, $30, $30, $A1, $30, $A2, $2C, $32
    db   $A6, $30, $A1, $30, $2C, $A2, $32, $A2, $30, $97, $4A, $A1, $4A, $A2, $40, $A1
    db   $30, $30, $98, $A6, $36, $A1, $36, $32, $A2, $3A, $36, $36, $A1, $36, $A2, $32
    db   $3A, $A6, $36, $A1, $36, $32, $A2, $3A, $A2, $36, $97, $4A, $A1, $4A, $A2, $40
    db   $A1, $30, $30, $98, $A6, $10, $A1, $10, $0C, $A2, $14, $10, $10, $A1, $10, $A2
    db   $0C, $14, $10, $10, $0C, $A7, $10, $9D, $A1, $00, $80, $97, $A3, $3C, $98, $00
    db   $9D, $0F, $73, $20, $99, $A1, $4E, $52, $54, $A6, $56, $A1, $56, $58, $5A, $A6
    db   $5C, $A1, $5C, $60, $62, $64, $A4, $66, $9B, $02, $A6, $28, $A1, $28, $24, $A2
    db   $2C, $28, $28, $A1, $28, $A2, $24, $2C, $A6, $28, $A1, $28, $24, $A2, $2C, $28
    db   $A6, $01, $A3, $01, $9C, $A6, $30, $A1, $30, $2C, $A2, $32, $30, $30, $A1, $30
    db   $A2, $2C, $32, $A6, $30, $A1, $30, $2C, $A2, $32, $30, $A6, $01, $A3, $01, $A6
    db   $40, $A1, $40, $3C, $A2, $44, $40, $40, $A1, $40, $A2, $3C, $44, $40, $40, $3C
    db   $A7, $40, $A3, $01, $00, $A5, $01, $A3, $01, $FF, $9B, $06, $A1, $1A, $15, $15
    db   $1A, $15, $15, $FF, $1A, $1A, $15, $15, $1A, $15, $15, $FF, $FF, $9C, $A6, $FF
    db   $A1, $FF, $FF, $A2, $FF, $FF, $FF, $A1, $FF, $A2, $FF, $FF, $FF, $FF, $FF, $A7
    db   $FF, $A3, $FF, $00, $C1, $78, $FF, $FF, $BB, $78, $9B, $20, $AE, $01, $9C, $00
    db   $CD, $78, $FF, $FF, $C7, $78, $9B, $20, $AE, $01, $9C, $00, $00, $D9, $4A, $DE
    db   $78, $E4, $78, $EA, $78, $00, $00, $F2, $78, $FF, $FF, $DE, $78, $60, $79, $FF
    db   $FF, $E4, $78, $B7, $79, $BE, $79, $FF, $FF, $EC, $78, $9D, $42, $82, $80, $9B
    db   $02, $A2, $40, $4E, $5C, $60, $A4, $01, $A2, $40, $52, $60, $62, $A4, $01, $9C
    db   $A2, $40, $4E, $5C, $60, $A4, $01, $A2, $40, $4C, $5C, $5E, $A4, $01, $A2, $44
    db   $52, $60, $62, $A4, $01, $A2, $42, $48, $4E, $54, $52, $A7, $01, $A2, $44, $4C
    db   $52, $58, $A4, $01, $A2, $4A, $50, $56, $5C, $A4, $01, $A2, $48, $4E, $56, $5C
    db   $A4, $01, $A2, $48, $4E, $56, $58, $A4, $01, $A2, $44, $4A, $52, $58, $A4, $01
    db   $A2, $44, $4C, $52, $58, $A4, $01, $A2, $48, $4E, $56, $4E, $46, $4C, $52, $4C
    db   $44, $4A, $52, $4A, $44, $4A, $50, $4A, $00, $9D, $50, $44, $80, $9B, $02, $A4
    db   $66, $58, $5C, $A3, $01, $A2, $60, $62, $9C, $A3, $60, $66, $A4, $74, $A3, $01
    db   $70, $74, $70, $66, $A2, $62, $60, $A4, $5C, $01, $A2, $01, $60, $62, $66, $A4
    db   $6A, $58, $56, $A3, $01, $A2, $5C, $6A, $A4, $66, $56, $58, $A3, $01, $A2, $58
    db   $56, $A3, $52, $58, $A4, $60, $A3, $01, $5C, $58, $50, $A4, $4E, $AE, $01, $00
    db   $11, $11, $11, $10, $00, $00, $00, $00, $11, $11, $11, $10, $00, $00, $00, $00
    db   $9D, $A7, $79, $20, $A2, $01, $00, $9B, $02, $A4, $66, $58, $5C, $A3, $01, $A2
    db   $60, $62, $9C, $A3, $60, $66, $A7, $74, $01, $A3, $70, $74, $70, $66, $A2, $62
    db   $60, $A7, $5C, $A4, $01, $A2, $01, $01, $60, $62, $66, $A4, $6A, $58, $A7, $56
    db   $01, $A2, $5C, $6A, $A4, $66, $56, $A7, $58, $01, $A2, $58, $56, $A3, $52, $58
    db   $A7, $60, $01, $A3, $5C, $58, $50, $A7, $4E, $A2, $01, $AE, $01, $00, $00, $CA
    db   $4A, $10, $7A, $24, $7A, $2A, $7A, $00, $00, $3E, $7A, $32, $7A, $43, $7A, $32
    db   $7A, $48, $7A, $32, $7A, $43, $7A, $32, $7A, $FF, $FF, $10, $7A, $4D, $7A, $FF
    db   $FF, $24, $7A, $B7, $79, $51, $7A, $FF, $FF, $2C, $7A, $9B, $02, $AC, $7C, $7E
    db   $9C, $9B, $02, $82, $84, $9C, $00, $9D, $10, $00, $00, $00, $9D, $20, $00, $00
    db   $00, $9D, $30, $00, $00, $00, $9D, $1A, $81, $40, $9B, $20, $A2, $62, $6C, $76
    db   $78, $9C, $00, $00, $F7, $4A, $65, $7A, $71, $7A, $1C, $4B, $00, $00, $7B, $7A
    db   $87, $7A, $16, $7B, $1F, $7B, $FF, $FF, $69, $7A, $82, $7A, $87, $7A, $1B, $7B
    db   $FF, $FF, $75, $7A, $9D, $42, $00, $80, $A1, $01, $00, $9D, $81, $00, $80, $00
    db   $A5, $01, $A2, $01, $97, $A0, $2E, $30, $3E, $40, $46, $40, $38, $30, $32, $34
    db   $3C, $44, $4A, $44, $3C, $34, $36, $38, $40, $48, $4E, $48, $40, $38, $3A, $3C
    db   $44, $4C, $52, $4C, $44, $3C, $3E, $40, $48, $50, $56, $50, $48, $40, $42, $44
    db   $4C, $54, $5A, $54, $4C, $44, $46, $48, $50, $58, $5E, $58, $50, $48, $4A, $4C
    db   $54, $5C, $62, $5C, $54, $4C, $4E, $50, $58, $60, $66, $60, $58, $50, $52, $54
    db   $5C, $64, $6A, $64, $5C, $54, $9B, $02, $56, $58, $60, $68, $6E, $68, $60, $58
    db   $56, $50, $48, $40, $48, $50, $9C, $56, $58, $60, $68, $6E, $68, $60, $58, $68
    db   $60, $58, $56, $60, $58, $56, $50, $58, $56, $50, $48, $56, $50, $48, $40, $50
    db   $48, $40, $38, $48, $40, $3E, $38, $40, $3E, $38, $30, $A5, $28, $98, $00, $9D
    db   $10, $00, $80, $00, $9D, $1A, $81, $40, $9B, $20, $AA, $62, $6C, $76, $78, $9C
    db   $00, $0E, $BB, $4A, $33, $7B, $39, $7B, $3F, $7B, $00, $00, $45, $7B, $FF, $FF
    db   $33, $7B, $61, $7B, $FF, $FF, $39, $7B, $90, $7B, $FF, $FF, $3F, $7B, $9D, $62
    db   $00, $40, $9B, $20, $A3, $32, $A2, $3A, $A3, $40, $A2, $48, $A8, $44, $A3, $2C
    db   $A2, $36, $A3, $3C, $A2, $44, $A8, $40, $9C, $00, $9D, $50, $21, $80, $AE, $01
    db   $01, $A8, $58, $A3, $01, $A2, $4E, $A3, $52, $A2, $40, $A5, $44, $A2, $01, $A3
    db   $52, $A2, $5C, $A8, $58, $A3, $01, $A2, $4E, $A3, $52, $A2, $40, $A5, $44, $A2
    db   $01, $A3, $40, $A2, $52, $AE, $4A, $01, $00, $9D, $F9, $4B, $40, $9B, $20, $A5
    db   $01, $A1, $5C, $01, $A7, $74, $A5, $01, $A1, $58, $01, $A7, $70, $9C, $00, $00
    db   $E8, $4A, $B1, $7B, $B7, $7B, $BD, $7B, $C3, $7B, $C9, $7B, $FF, $FF, $F9, $5E
    db   $E0, $7B, $FF, $FF, $05, $5F, $06, $7C, $FF, $FF, $BB, $78, $1A, $7C, $FF, $FF
    db   $C7, $78, $9D, $80, $81, $00, $96, $A1, $52, $5C, $66, $60, $6A, $74, $9D, $80
    db   $00, $00, $A4, $6E, $01, $9E, $D9, $4A, $00, $9D, $40, $81, $40, $A1, $42, $4C
    db   $56, $50, $5A, $64, $9D, $40, $00, $40, $A4, $5E, $01, $9E, $D9, $4A, $00, $AA
    db   $AA, $AA, $A8, $00, $00, $00, $00, $AA, $AA, $AA, $A8, $00, $00, $00, $00, $9D
    db   $F6, $7B, $20, $99, $A1, $30, $3A, $44, $3E, $48, $52, $9A, $A4, $4C, $01, $9E
    db   $D9, $4A, $00, $9B, $06, $A1, $1A, $9C, $9B, $10, $A0, $15, $9C, $9E, $D9, $4A
    db   $00, $00, $CA, $4A, $33, $7C, $3B, $7C, $1C, $4B, $41, $7C, $47, $7C, $4E, $7C
    db   $FF, $FF, $35, $7C, $93, $7C, $FF, $FF, $3B, $7C, $F9, $7C, $FF, $FF, $41, $7C
    db   $9D, $10, $00, $80, $A1, $01, $00, $AC, $90, $86, $8E, $84, $8C, $82, $8A, $80
    db   $88, $7E, $86, $78, $84, $76, $82, $74, $80, $72, $AC, $86, $78, $84, $76, $82
    db   $74, $80, $72, $AD, $7C, $7A, $72, $6C, $68, $64, $62, $5A, $54, $50, $AD, $64
    db   $62, $5A, $54, $50, $AE, $01, $AD, $7A, $72, $AD, $7A, $72, $A5, $01, $01, $AD
    db   $62, $64, $72, $6C, $62, $64, $72, $6C, $A5, $01, $01, $00, $9D, $39, $00, $00
    db   $AC, $90, $86, $8E, $84, $8C, $82, $8A, $80, $88, $7E, $86, $78, $84, $76, $82
    db   $74, $80, $72, $9D, $20, $00, $40, $AC, $86, $78, $84, $76, $82, $74, $80, $72
    db   $9D, $29, $00, $00, $AD, $7C, $7A, $72, $6C, $68, $64, $62, $5A, $54, $50, $9D
    db   $20, $00, $40, $AD, $64, $62, $5A, $54, $50, $AE, $01, $9D, $29, $00, $00, $AD
    db   $7A, $72, $9D, $20, $00, $40, $AD, $7A, $72, $A5, $01, $01, $9D, $29, $00, $00
    db   $AD, $62, $64, $72, $6C, $9D, $20, $00, $40, $AD, $62, $64, $72, $6C, $A5, $01
    db   $01, $00, $9B, $20, $A3, $38, $9C, $00, $00, $CA, $4A, $0A, $7D, $12, $7D, $1C
    db   $4B, $00, $00, $28, $7D, $36, $7D, $FF, $FF, $0C, $7D, $33, $7D, $3C, $7D, $36
    db   $7D, $41, $7D, $36, $7D, $46, $7D, $36, $7D, $41, $7D, $36, $7D, $FF, $FF, $14
    db   $7D, $9D, $20, $00, $43, $A7, $01, $A1, $01, $A0, $01, $00, $A7, $01, $00, $A1
    db   $20, $22, $20, $22, $00, $9D, $20, $00, $40, $00, $9D, $30, $00, $40, $00, $9D
    db   $40, $00, $40, $00, $00, $AC, $4A, $56, $7D, $5E, $7D, $66, $7D, $00, $00, $6E
    db   $7D, $84, $7D, $FF, $FF, $58, $7D, $7A, $7D, $84, $7D, $FF, $FF, $60, $7D, $F8
    db   $7D, $84, $7D, $FF, $FF, $68, $7D, $9D, $10, $00, $40, $A5, $01, $01, $A8, $01
    db   $AA, $01, $00, $9D, $20, $00, $00, $A5, $01, $01, $A8, $01, $00, $A1, $8E, $8A
    db   $88, $80, $7A, $76, $72, $70, $68, $62, $5E, $5A, $58, $50, $4A, $46, $42, $40
    db   $38, $32, $2E, $2A, $2E, $32, $38, $40, $42, $46, $4A, $50, $58, $5A, $5E, $62
    db   $68, $70, $72, $76, $7A, $80, $88, $8A, $8E, $8A, $86, $80, $78, $76, $72, $6E
    db   $68, $60, $5E, $5A, $56, $50, $48, $46, $42, $3E, $38, $30, $34, $38, $3E, $42
    db   $46, $48, $34, $50, $56, $5A, $5E, $60, $34, $68, $6E, $72, $76, $76, $72, $6C
    db   $64, $62, $5E, $5A, $54, $4C, $4A, $46, $42, $3C, $34, $32, $2E, $32, $34, $3C
    db   $42, $46, $4A, $4C, $54, $5A, $5E, $62, $64, $6C, $72, $76, $7A, $7C, $84, $8A
    db   $00, $9D, $A7, $79, $20, $A5, $01, $01, $A8, $01, $A3, $01, $00, $00, $D9, $4A
    db   $0F, $7E, $17, $7E, $1F, $7E, $27, $7E, $2F, $7E, $70, $7E, $FF, $FF, $11, $7E
    db   $3A, $7E, $96, $7E, $FF, $FF, $19, $7E, $55, $7E, $FE, $7E, $FF, $FF, $21, $7E
    db   $60, $7E, $76, $7F, $FF, $FF, $29, $7E, $9D, $60, $00, $41, $A7, $01, $AA, $4E
    db   $AE, $50, $00, $9D, $40, $00, $01, $A7, $01, $AA, $64, $AE, $66, $00, $8A, $DF
    db   $DA, $86, $31, $01, $36, $86, $8A, $DF, $DA, $86, $31, $01, $36, $86, $9D, $45
    db   $7E, $20, $A7, $01, $AA, $5A, $AE, $5C, $00, $A7, $01, $AA, $01, $A5, $01, $A1
    db   $FF, $A2, $FF, $FF, $A1, $FF, $A2, $FF, $00, $9D, $41, $00, $80, $9B, $07, $A6
    db   $82, $82, $A3, $82, $A2, $82, $A3, $82, $9C, $9D, $61, $00, $80, $97, $A2, $44
    db   $A6, $44, $A1, $44, $44, $A3, $44, $A2, $44, $A1, $44, $A2, $44, $98, $00, $9D
    db   $60, $21, $41, $A3, $46, $A7, $3C, $A1, $01, $46, $46, $4A, $4C, $50, $A8, $54
    db   $AA, $54, $56, $5A, $AD, $01, $A8, $5E, $AA, $5E, $5A, $56, $AD, $01, $A6, $5A
    db   $A1, $56, $A4, $54, $A3, $54, $A2, $50, $A1, $50, $54, $A4, $56, $A2, $54, $50
    db   $A2, $4C, $A1, $4C, $50, $A4, $54, $A2, $50, $4C, $A2, $4A, $A1, $4A, $4E, $A4
    db   $52, $A3, $58, $9D, $62, $00, $40, $A2, $54, $A6, $54, $A1, $54, $54, $A3, $54
    db   $A2, $54, $A1, $54, $A2, $54, $00, $00, $11, $22, $33, $44, $55, $67, $89, $00
    db   $00, $00, $05, $00, $00, $00, $05, $9D, $EE, $7E, $20, $99, $A2, $5E, $A1, $4C
    db   $A2, $54, $5E, $5C, $4C, $54, $5C, $A1, $4C, $A2, $5A, $A1, $4C, $A2, $54, $5A
    db   $58, $4C, $54, $58, $A1, $4C, $A2, $56, $A1, $46, $A2, $4C, $56, $5A, $4A, $50
    db   $5A, $A1, $4A, $A2, $5A, $A1, $4C, $A2, $54, $5A, $5A, $A1, $4C, $54, $A2, $5A
    db   $A1, $4C, $54, $5A, $A2, $56, $A1, $48, $A2, $50, $56, $50, $3E, $48, $50, $A1
    db   $52, $A2, $54, $A1, $46, $A2, $4C, $54, $5E, $A1, $4C, $54, $A2, $5E, $A1, $5C
    db   $5E, $60, $A2, $62, $A1, $52, $A2, $58, $62, $5E, $52, $58, $5E, $A1, $58, $A2
    db   $5C, $A6, $5C, $A1, $5C, $5C, $A3, $5C, $A2, $5C, $A1, $5C, $A2, $5C, $00, $9B
    db   $07, $A1, $15, $15, $1A, $15, $15, $15, $FF, $15, $15, $15, $1A, $15, $15, $15
    db   $1A, $FF, $9C, $A2, $FF, $A6, $FF, $A1, $FF, $FF, $A3, $FF, $A2, $FF, $A1, $FF
    db   $A2, $FF
