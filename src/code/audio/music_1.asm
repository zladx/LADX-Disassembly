; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis


; Debug handlers?
    jp   label_01B_4009                           ; $4000: $C3 $09 $40

    jp   label_01B_4E2C                           ; $4003: $C3 $2C $4E

PlayMusicTrack_1B::
    jp   PlayMusicTrack_1B_EntryPoint             ; $4006: $C3 $1E $40

label_01B_4009:
    ld   hl, $D300                                ; $4009: $21 $00 $D3

jr_01B_400C:
    ld   [hl], $00                                ; $400C: $36 $00
    inc  l                                        ; $400E: $2C
    jr   nz, jr_01B_400C                          ; $400F: $20 $FB

    ld   a, $80                                   ; $4011: $3E $80
    ldh  [rNR52], a                               ; $4013: $E0 $26
    ld   a, $77                                   ; $4015: $3E $77
    ldh  [rNR50], a                               ; $4017: $E0 $24
    ld   a, $FF                                   ; $4019: $3E $FF
    ldh  [rNR51], a                               ; $401B: $E0 $25
    ret                                           ; $401D: $C9

PlayMusicTrack_1B_EntryPoint::
    ld   hl, wActiveMusicTrack                    ; $401E: $21 $68 $D3
    ld   a, [hl+]                                 ; $4021: $2A
    and  a                                        ; $4022: $A7
    jr   nz, jr_01B_4031                          ; $4023: $20 $0C

    call func_01B_4037                            ; $4025: $CD $37 $40

jr_01B_4028:
    call func_01B_450F                            ; $4028: $CD $0F $45
    ret                                           ; $402B: $C9

label_01B_402C:
    xor  a                                        ; $402C: $AF
    ld   [$D3CE], a                               ; $402D: $EA $CE $D3
    ret                                           ; $4030: $C9

jr_01B_4031:
    ld   [hl], a                                  ; $4031: $77
    call func_01B_413B                            ; $4032: $CD $3B $41
    jr   jr_01B_4028                              ; $4035: $18 $F1

func_01B_4037:
    ld   de, $D393                                ; $4037: $11 $93 $D3
    ld   hl, wActiveNoiseSfx                      ; $403A: $21 $78 $D3
    ld   a, [hl+]                                 ; $403D: $2A
    cp   $01                                      ; $403E: $FE $01
    jr   z, jr_01B_4048                           ; $4040: $28 $06

    ld   a, [hl]                                  ; $4042: $7E
    cp   $01                                      ; $4043: $FE $01
    jr   z, jr_01B_4053                           ; $4045: $28 $0C

    ret                                           ; $4047: $C9

jr_01B_4048:
    ld   a, $01                                   ; $4048: $3E $01
    ld   [$D379], a                               ; $404A: $EA $79 $D3
    ld   hl, $4060                                ; $404D: $21 $60 $40
    jp   label_01B_406A                           ; $4050: $C3 $6A $40

jr_01B_4053:
    ld   a, [de]                                  ; $4053: $1A
    dec  a                                        ; $4054: $3D
    ld   [de], a                                  ; $4055: $12
    ret  nz                                       ; $4056: $C0

    xor  a                                        ; $4057: $AF
    ld   [$D379], a                               ; $4058: $EA $79 $D3
    ld   hl, $4065                                ; $405B: $21 $65 $40
    jr   jr_01B_406A                              ; $405E: $18 $0A

    dec  sp                                       ; $4060: $3B
    add  b                                        ; $4061: $80
    rlca                                          ; $4062: $07
    ret  nz                                       ; $4063: $C0

    ld   [bc], a                                  ; $4064: $02
    nop                                           ; $4065: $00
    ld   b, d                                     ; $4066: $42
    ld   [bc], a                                  ; $4067: $02
    ret  nz                                       ; $4068: $C0

    inc  b                                        ; $4069: $04

label_01B_406A:
jr_01B_406A:
    ld   b, $04                                   ; $406A: $06 $04
    ld   c, $20                                   ; $406C: $0E $20

jr_01B_406E:
    ld   a, [hl+]                                 ; $406E: $2A
    ld   [c], a                                   ; $406F: $E2
    inc  c                                        ; $4070: $0C
    dec  b                                        ; $4071: $05
    jr   nz, jr_01B_406E                          ; $4072: $20 $FA

    ld   a, [hl]                                  ; $4074: $7E
    ld   [de], a                                  ; $4075: $12
    ret                                           ; $4076: $C9

Data_01B_4077::
    db   $34, $50, $E2, $51, $93, $52, $2C, $53, $05, $54, $58, $57, $F0, $59, $8D, $5A
    db   $7D, $5B, $71, $5C, $09, $5D, $B8, $5D, $08, $5E, $27, $5E, $A7, $5E, $36, $4B
    db   $0A, $5F, $C1, $5F, $17, $60, $96, $60, $5F, $61, $41, $62, $AC, $4D, $00, $50
    db   $15, $63, $3E, $64, $DF, $64, $7A, $4C, $13, $65, $1B, $6C, $69, $6C, $8F, $4B
    db   $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71
    db   $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71, $00, $71

func_01B_40D7:
    inc  e                                        ; $40D7: $1C
    dec  a                                        ; $40D8: $3D
    sla  a                                        ; $40D9: $CB $27
    ld   c, a                                     ; $40DB: $4F
    ld   b, $00                                   ; $40DC: $06 $00
    add  hl, bc                                   ; $40DE: $09
    ld   c, [hl]                                  ; $40DF: $4E
    inc  hl                                       ; $40E0: $23
    ld   b, [hl]                                  ; $40E1: $46
    ld   l, c                                     ; $40E2: $69
    ld   h, b                                     ; $40E3: $60
    ld   a, h                                     ; $40E4: $7C
    ret                                           ; $40E5: $C9

func_01B_40E6:
    push bc                                       ; $40E6: $C5
    ld   c, $30                                   ; $40E7: $0E $30

jr_01B_40E9:
    ld   a, [hl+]                                 ; $40E9: $2A
    ld   [c], a                                   ; $40EA: $E2
    inc  c                                        ; $40EB: $0C
    ld   a, c                                     ; $40EC: $79
    cp   $40                                      ; $40ED: $FE $40
    jr   nz, jr_01B_40E9                          ; $40EF: $20 $F8

    pop  bc                                       ; $40F1: $C1
    ret                                           ; $40F2: $C9

func_01B_40F3:
    xor  a                                        ; $40F3: $AF
    ld   [$D379], a                               ; $40F4: $EA $79 $D3
    ld   [$D34F], a                               ; $40F7: $EA $4F $D3
    ld   [$D398], a                               ; $40FA: $EA $98 $D3
    ld   [$D393], a                               ; $40FD: $EA $93 $D3
    ld   [$D3C9], a                               ; $4100: $EA $C9 $D3
    ld   [$D3A3], a                               ; $4103: $EA $A3 $D3
    ld   a, $08                                   ; $4106: $3E $08
    ldh  [rNR42], a                               ; $4108: $E0 $21
    ld   a, $80                                   ; $410A: $3E $80
    ldh  [rNR44], a                               ; $410C: $E0 $23
    ret                                           ; $410E: $C9

func_01B_410F:
jr_01B_410F:
    ld   a, [$D379]                               ; $410F: $FA $79 $D3
    cp   $0C                                      ; $4112: $FE $0C
    jp   z, label_01B_4E4A                        ; $4114: $CA $4A $4E

    cp   $05                                      ; $4117: $FE $05
    jp   z, label_01B_4E4A                        ; $4119: $CA $4A $4E

    cp   $1A                                      ; $411C: $FE $1A
    jp   z, label_01B_4E4A                        ; $411E: $CA $4A $4E

    cp   $24                                      ; $4121: $FE $24
    jp   z, label_01B_4E4A                        ; $4123: $CA $4A $4E

    cp   $2A                                      ; $4126: $FE $2A
    jp   z, label_01B_4E4A                        ; $4128: $CA $4A $4E

    cp   $2E                                      ; $412B: $FE $2E
    jp   z, label_01B_4E4A                        ; $412D: $CA $4A $4E

    cp   $3F                                      ; $4130: $FE $3F
    jp   z, label_01B_4E4A                        ; $4132: $CA $4A $4E

    call func_01B_40F3                            ; $4135: $CD $F3 $40
    jp   label_01B_4E4A                           ; $4138: $C3 $4A $4E

func_01B_413B:
    cp   $FF                                      ; $413B: $FE $FF
    jr   z, jr_01B_410F                           ; $413D: $28 $D0

    ld   a, [$D3CA]                               ; $413F: $FA $CA $D3
    ld   [$D3CB], a                               ; $4142: $EA $CB $D3
    ld   a, [hl]                                  ; $4145: $7E
    ld   [$D3CA], a                               ; $4146: $EA $CA $D3
    cp   $11                                      ; $4149: $FE $11
    jr   nc, jr_01B_414F                          ; $414B: $30 $02

    jr   jr_01B_4172                              ; $414D: $18 $23

jr_01B_414F:
    cp   $21                                      ; $414F: $FE $21
    jr   nc, jr_01B_4156                          ; $4151: $30 $03

    jp   label_01B_402C                           ; $4153: $C3 $2C $40

jr_01B_4156:
    cp   $31                                      ; $4156: $FE $31
    jr   nc, jr_01B_415D                          ; $4158: $30 $03

    jp   label_01B_402C                           ; $415A: $C3 $2C $40

jr_01B_415D:
    cp   $41                                      ; $415D: $FE $41
    jp   nc, label_01B_4166                       ; $415F: $D2 $66 $41

    add  $E0                                      ; $4162: $C6 $E0
    jr   jr_01B_4172                              ; $4164: $18 $0C

label_01B_4166:
    cp   $61                                      ; $4166: $FE $61
    jp   c, label_01B_402C                        ; $4168: $DA $2C $40

    cp   $70                                      ; $416B: $FE $70
    jp   nc, label_01B_402C                       ; $416D: $D2 $2C $40

    add  $C0                                      ; $4170: $C6 $C0

jr_01B_4172:
    dec  hl                                       ; $4172: $2B
    ld   [hl+], a                                 ; $4173: $22
    ld   b, a                                     ; $4174: $47
    ld   a, $01                                   ; $4175: $3E $01
    ld   [$D3CE], a                               ; $4177: $EA $CE $D3
    ld   a, b                                     ; $417A: $78
    ld   [hl], a                                  ; $417B: $77
    ld   b, a                                     ; $417C: $47
    ld   hl, Data_01B_4077                        ; $417D: $21 $77 $40
    and  $7F                                      ; $4180: $E6 $7F
    call func_01B_40D7                            ; $4182: $CD $D7 $40
    call func_01B_433C                            ; $4185: $CD $3C $43
    jp   label_01B_42D5                           ; $4188: $C3 $D5 $42

Data_1B_418B::
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

label_01B_42AB:
    ld   a, [$D3E7]                               ; $42AB: $FA $E7 $D3
    and  a                                        ; $42AE: $A7
    jp   z, label_01B_46CB                        ; $42AF: $CA $CB $46

    xor  a                                        ; $42B2: $AF
    ldh  [rNR30], a                               ; $42B3: $E0 $1A
    ld   [$D3E7], a                               ; $42B5: $EA $E7 $D3
    push hl                                       ; $42B8: $E5
    ld   a, [$D336]                               ; $42B9: $FA $36 $D3
    ld   l, a                                     ; $42BC: $6F
    ld   a, [$D337]                               ; $42BD: $FA $37 $D3
    ld   h, a                                     ; $42C0: $67
    push bc                                       ; $42C1: $C5
    ld   c, $30                                   ; $42C2: $0E $30

jr_01B_42C4:
    ld   a, [hl+]                                 ; $42C4: $2A
    ld   [c], a                                   ; $42C5: $E2
    inc  c                                        ; $42C6: $0C
    ld   a, c                                     ; $42C7: $79
    cp   $40                                      ; $42C8: $FE $40
    jr   nz, jr_01B_42C4                          ; $42CA: $20 $F8

    ld   a, $80                                   ; $42CC: $3E $80
    ldh  [rNR30], a                               ; $42CE: $E0 $1A
    pop  bc                                       ; $42D0: $C1
    pop  hl                                       ; $42D1: $E1
    jp   label_01B_46CB                           ; $42D2: $C3 $CB $46

label_01B_42D5:
    ld   a, [$D369]                               ; $42D5: $FA $69 $D3
    ld   hl, Data_1B_418B                         ; $42D8: $21 $8B $41

jr_01B_42DB:
    dec  a                                        ; $42DB: $3D
    jr   z, jr_01B_42E6                           ; $42DC: $28 $08

    inc  hl                                       ; $42DE: $23
    inc  hl                                       ; $42DF: $23
    inc  hl                                       ; $42E0: $23
    inc  hl                                       ; $42E1: $23
    inc  hl                                       ; $42E2: $23
    inc  hl                                       ; $42E3: $23
    jr   jr_01B_42DB                              ; $42E4: $18 $F5

jr_01B_42E6:
    ld   bc, $D355                                ; $42E6: $01 $55 $D3
    ld   a, [hl+]                                 ; $42E9: $2A
    ld   [bc], a                                  ; $42EA: $02
    inc  c                                        ; $42EB: $0C
    xor  a                                        ; $42EC: $AF
    ld   [bc], a                                  ; $42ED: $02
    inc  c                                        ; $42EE: $0C
    ld   a, [hl+]                                 ; $42EF: $2A
    ld   [bc], a                                  ; $42F0: $02
    inc  c                                        ; $42F1: $0C
    xor  a                                        ; $42F2: $AF
    ld   [bc], a                                  ; $42F3: $02
    inc  c                                        ; $42F4: $0C
    ld   a, [hl+]                                 ; $42F5: $2A
    ld   [bc], a                                  ; $42F6: $02
    ldh  [rNR51], a                               ; $42F7: $E0 $25
    inc  c                                        ; $42F9: $0C
    ld   a, [hl+]                                 ; $42FA: $2A
    ld   [bc], a                                  ; $42FB: $02
    inc  c                                        ; $42FC: $0C
    ld   a, [hl+]                                 ; $42FD: $2A
    ld   [bc], a                                  ; $42FE: $02
    inc  c                                        ; $42FF: $0C
    ld   a, [hl+]                                 ; $4300: $2A
    ld   [bc], a                                  ; $4301: $02
    ret                                           ; $4302: $C9

func_01B_4303:
    ld   hl, $D355                                ; $4303: $21 $55 $D3
    ld   a, [hl+]                                 ; $4306: $2A
    cp   $01                                      ; $4307: $FE $01
    ret  z                                        ; $4309: $C8

    inc  [hl]                                     ; $430A: $34
    ld   a, [hl+]                                 ; $430B: $2A
    cp   [hl]                                     ; $430C: $BE
    ret  nz                                       ; $430D: $C0

    dec  l                                        ; $430E: $2D
    ld   [hl], $00                                ; $430F: $36 $00
    inc  l                                        ; $4311: $2C
    inc  l                                        ; $4312: $2C
    inc  [hl]                                     ; $4313: $34
    ld   a, [hl+]                                 ; $4314: $2A
    and  $03                                      ; $4315: $E6 $03
    ld   c, l                                     ; $4317: $4D
    ld   b, h                                     ; $4318: $44
    and  a                                        ; $4319: $A7
    jr   z, jr_01B_4327                           ; $431A: $28 $0B

    inc  c                                        ; $431C: $0C
    cp   $01                                      ; $431D: $FE $01
    jr   z, jr_01B_4327                           ; $431F: $28 $06

    inc  c                                        ; $4321: $0C
    cp   $02                                      ; $4322: $FE $02
    jr   z, jr_01B_4327                           ; $4324: $28 $01

    inc  c                                        ; $4326: $0C

jr_01B_4327:
    ld   a, [bc]                                  ; $4327: $0A
    ldh  [rNR51], a                               ; $4328: $E0 $25
    ret                                           ; $432A: $C9

func_01B_432B:
    ld   a, [hl+]                                 ; $432B: $2A
    ld   c, a                                     ; $432C: $4F
    ld   a, [hl]                                  ; $432D: $7E
    ld   b, a                                     ; $432E: $47
    ld   a, [bc]                                  ; $432F: $0A
    ld   [de], a                                  ; $4330: $12
    inc  e                                        ; $4331: $1C
    inc  bc                                       ; $4332: $03
    ld   a, [bc]                                  ; $4333: $0A
    ld   [de], a                                  ; $4334: $12
    ret                                           ; $4335: $C9

func_01B_4336:
    ld   a, [hl+]                                 ; $4336: $2A
    ld   [de], a                                  ; $4337: $12
    inc  e                                        ; $4338: $1C
    ld   a, [hl+]                                 ; $4339: $2A
    ld   [de], a                                  ; $433A: $12
    ret                                           ; $433B: $C9

func_01B_433C:
    ld   a, [$D379]                               ; $433C: $FA $79 $D3
    cp   $05                                      ; $433F: $FE $05
    jr   z, jr_01B_435E                           ; $4341: $28 $1B

    cp   $0C                                      ; $4343: $FE $0C
    jr   z, jr_01B_435E                           ; $4345: $28 $17

    cp   $1A                                      ; $4347: $FE $1A
    jr   z, jr_01B_435E                           ; $4349: $28 $13

    cp   $24                                      ; $434B: $FE $24
    jr   z, jr_01B_435E                           ; $434D: $28 $0F

    cp   $2A                                      ; $434F: $FE $2A
    jr   z, jr_01B_435E                           ; $4351: $28 $0B

    cp   $2E                                      ; $4353: $FE $2E
    jr   z, jr_01B_435E                           ; $4355: $28 $07

    cp   $3F                                      ; $4357: $FE $3F
    jr   z, jr_01B_435E                           ; $4359: $28 $03

    call func_01B_40F3                            ; $435B: $CD $F3 $40

jr_01B_435E:
    call func_01B_4E57                            ; $435E: $CD $57 $4E
    ld   de, $D300                                ; $4361: $11 $00 $D3
    ld   b, $00                                   ; $4364: $06 $00
    ld   a, [hl+]                                 ; $4366: $2A
    ld   [de], a                                  ; $4367: $12
    inc  e                                        ; $4368: $1C
    call func_01B_4336                            ; $4369: $CD $36 $43
    ld   de, $D310                                ; $436C: $11 $10 $D3
    call func_01B_4336                            ; $436F: $CD $36 $43
    ld   de, $D320                                ; $4372: $11 $20 $D3
    call func_01B_4336                            ; $4375: $CD $36 $43
    ld   de, $D330                                ; $4378: $11 $30 $D3
    call func_01B_4336                            ; $437B: $CD $36 $43
    ld   de, $D340                                ; $437E: $11 $40 $D3
    call func_01B_4336                            ; $4381: $CD $36 $43
    ld   hl, $D310                                ; $4384: $21 $10 $D3
    ld   de, $D314                                ; $4387: $11 $14 $D3
    call func_01B_432B                            ; $438A: $CD $2B $43
    ld   hl, $D320                                ; $438D: $21 $20 $D3
    ld   de, $D324                                ; $4390: $11 $24 $D3
    call func_01B_432B                            ; $4393: $CD $2B $43
    ld   hl, $D330                                ; $4396: $21 $30 $D3
    ld   de, $D334                                ; $4399: $11 $34 $D3
    call func_01B_432B                            ; $439C: $CD $2B $43
    ld   hl, $D340                                ; $439F: $21 $40 $D3
    ld   de, $D344                                ; $43A2: $11 $44 $D3
    call func_01B_432B                            ; $43A5: $CD $2B $43
    ld   bc, $0410                                ; $43A8: $01 $10 $04
    ld   hl, $D312                                ; $43AB: $21 $12 $D3

jr_01B_43AE:
    ld   [hl], $01                                ; $43AE: $36 $01
    ld   a, c                                     ; $43B0: $79
    add  l                                        ; $43B1: $85
    ld   l, a                                     ; $43B2: $6F
    dec  b                                        ; $43B3: $05
    jr   nz, jr_01B_43AE                          ; $43B4: $20 $F8

    xor  a                                        ; $43B6: $AF
    ld   [$D31E], a                               ; $43B7: $EA $1E $D3
    ld   [$D32E], a                               ; $43BA: $EA $2E $D3
    ld   [$D33E], a                               ; $43BD: $EA $3E $D3
    ret                                           ; $43C0: $C9

jr_01B_43C1:
    push hl                                       ; $43C1: $E5
    ld   a, e                                     ; $43C2: $7B
    ld   [$D336], a                               ; $43C3: $EA $36 $D3
    ld   a, d                                     ; $43C6: $7A
    ld   [$D337], a                               ; $43C7: $EA $37 $D3
    ld   a, [$D371]                               ; $43CA: $FA $71 $D3
    and  a                                        ; $43CD: $A7
    jr   nz, jr_01B_43D8                          ; $43CE: $20 $08

    xor  a                                        ; $43D0: $AF
    ldh  [rNR30], a                               ; $43D1: $E0 $1A
    ld   l, e                                     ; $43D3: $6B
    ld   h, d                                     ; $43D4: $62
    call func_01B_40E6                            ; $43D5: $CD $E6 $40

jr_01B_43D8:
    pop  hl                                       ; $43D8: $E1
    jr   jr_01B_4405                              ; $43D9: $18 $2A

label_01B_43DB:
    call func_01B_440B                            ; $43DB: $CD $0B $44
    call func_01B_4420                            ; $43DE: $CD $20 $44
    ld   e, a                                     ; $43E1: $5F
    call func_01B_440B                            ; $43E2: $CD $0B $44
    call func_01B_4420                            ; $43E5: $CD $20 $44
    ld   d, a                                     ; $43E8: $57
    call func_01B_440B                            ; $43E9: $CD $0B $44
    call func_01B_4420                            ; $43EC: $CD $20 $44
    ld   c, a                                     ; $43EF: $4F
    inc  l                                        ; $43F0: $2C
    inc  l                                        ; $43F1: $2C
    ld   [hl], e                                  ; $43F2: $73
    inc  l                                        ; $43F3: $2C
    ld   [hl], d                                  ; $43F4: $72
    inc  l                                        ; $43F5: $2C
    ld   [hl], c                                  ; $43F6: $71
    dec  l                                        ; $43F7: $2D
    dec  l                                        ; $43F8: $2D
    dec  l                                        ; $43F9: $2D
    dec  l                                        ; $43FA: $2D
    push hl                                       ; $43FB: $E5
    ld   hl, $D350                                ; $43FC: $21 $50 $D3
    ld   a, [hl]                                  ; $43FF: $7E
    pop  hl                                       ; $4400: $E1
    cp   $03                                      ; $4401: $FE $03
    jr   z, jr_01B_43C1                           ; $4403: $28 $BC

jr_01B_4405:
    call func_01B_440B                            ; $4405: $CD $0B $44
    jp   label_01B_4531                           ; $4408: $C3 $31 $45

func_01B_440B:
    push de                                       ; $440B: $D5
    ld   a, [hl+]                                 ; $440C: $2A
    ld   e, a                                     ; $440D: $5F
    ld   a, [hl-]                                 ; $440E: $3A
    ld   d, a                                     ; $440F: $57
    inc  de                                       ; $4410: $13

jr_01B_4411:
    ld   a, e                                     ; $4411: $7B
    ld   [hl+], a                                 ; $4412: $22
    ld   a, d                                     ; $4413: $7A
    ld   [hl-], a                                 ; $4414: $32
    pop  de                                       ; $4415: $D1
    ret                                           ; $4416: $C9

func_01B_4417:
    push de                                       ; $4417: $D5
    ld   a, [hl+]                                 ; $4418: $2A
    ld   e, a                                     ; $4419: $5F
    ld   a, [hl-]                                 ; $441A: $3A
    ld   d, a                                     ; $441B: $57
    inc  de                                       ; $441C: $13
    inc  de                                       ; $441D: $13
    jr   jr_01B_4411                              ; $441E: $18 $F1

func_01B_4420:
    ld   a, [hl+]                                 ; $4420: $2A
    ld   c, a                                     ; $4421: $4F
    ld   a, [hl-]                                 ; $4422: $3A
    ld   b, a                                     ; $4423: $47
    ld   a, [bc]                                  ; $4424: $0A
    ld   b, a                                     ; $4425: $47
    ret                                           ; $4426: $C9

jr_01B_4427:
    pop  hl                                       ; $4427: $E1
    jr   jr_01B_445B                              ; $4428: $18 $31

label_01B_442A:
    ld   a, [$D350]                               ; $442A: $FA $50 $D3
    cp   $03                                      ; $442D: $FE $03
    jr   nz, jr_01B_4441                          ; $442F: $20 $10

    ld   a, [$D338]                               ; $4431: $FA $38 $D3
    bit  7, a                                     ; $4434: $CB $7F
    jr   z, jr_01B_4441                           ; $4436: $28 $09

    ld   a, [hl]                                  ; $4438: $7E
    cp   $06                                      ; $4439: $FE $06
    jr   nz, jr_01B_4441                          ; $443B: $20 $04

    ld   a, $40                                   ; $443D: $3E $40
    ldh  [rNR32], a                               ; $443F: $E0 $1C

jr_01B_4441:
    push hl                                       ; $4441: $E5
    ld   a, l                                     ; $4442: $7D
    add  $09                                      ; $4443: $C6 $09
    ld   l, a                                     ; $4445: $6F
    ld   a, [hl]                                  ; $4446: $7E
    and  a                                        ; $4447: $A7
    jr   nz, jr_01B_4427                          ; $4448: $20 $DD

    ld   a, l                                     ; $444A: $7D
    add  $04                                      ; $444B: $C6 $04
    ld   l, a                                     ; $444D: $6F
    bit  7, [hl]                                  ; $444E: $CB $7E
    jr   nz, jr_01B_4427                          ; $4450: $20 $D5

    pop  hl                                       ; $4452: $E1
    call func_01B_46FE                            ; $4453: $CD $FE $46
    push hl                                       ; $4456: $E5
    call func_01B_4787                            ; $4457: $CD $87 $47
    pop  hl                                       ; $445A: $E1

label_01B_445B:
jr_01B_445B:
    dec  l                                        ; $445B: $2D
    dec  l                                        ; $445C: $2D
    jp   label_01B_46DE                           ; $445D: $C3 $DE $46

label_01B_4460:
    dec  l                                        ; $4460: $2D
    dec  l                                        ; $4461: $2D
    dec  l                                        ; $4462: $2D
    dec  l                                        ; $4463: $2D
    call func_01B_4417                            ; $4464: $CD $17 $44

jr_01B_4467:
    ld   a, l                                     ; $4467: $7D
    add  $04                                      ; $4468: $C6 $04
    ld   e, a                                     ; $446A: $5F
    ld   d, h                                     ; $446B: $54
    call func_01B_432B                            ; $446C: $CD $2B $43
    cp   $00                                      ; $446F: $FE $00
    jr   z, jr_01B_4492                           ; $4471: $28 $1F

    cp   $FF                                      ; $4473: $FE $FF
    jr   z, jr_01B_447B                           ; $4475: $28 $04

    inc  l                                        ; $4477: $2C
    jp   label_01B_452F                           ; $4478: $C3 $2F $45

jr_01B_447B:
    dec  l                                        ; $447B: $2D
    push hl                                       ; $447C: $E5
    call func_01B_4417                            ; $447D: $CD $17 $44
    call func_01B_4420                            ; $4480: $CD $20 $44
    ld   e, a                                     ; $4483: $5F
    call func_01B_440B                            ; $4484: $CD $0B $44
    call func_01B_4420                            ; $4487: $CD $20 $44
    ld   d, a                                     ; $448A: $57
    pop  hl                                       ; $448B: $E1
    ld   a, e                                     ; $448C: $7B
    ld   [hl+], a                                 ; $448D: $22
    ld   a, d                                     ; $448E: $7A
    ld   [hl-], a                                 ; $448F: $32
    jr   jr_01B_4467                              ; $4490: $18 $D5

jr_01B_4492:
    ld   a, [$D3CA]                               ; $4492: $FA $CA $D3
    cp   $0F                                      ; $4495: $FE $0F
    jp   z, label_01B_47E5                        ; $4497: $CA $E5 $47

    cp   $10                                      ; $449A: $FE $10
    jp   z, label_01B_47E5                        ; $449C: $CA $E5 $47

    cp   $25                                      ; $449F: $FE $25
    jp   z, label_01B_47E5                        ; $44A1: $CA $E5 $47

    ld   hl, $D369                                ; $44A4: $21 $69 $D3
    ld   [hl], $00                                ; $44A7: $36 $00
    call func_01B_410F                            ; $44A9: $CD $0F $41
    ret                                           ; $44AC: $C9

label_01B_44AD:
    call func_01B_440B                            ; $44AD: $CD $0B $44
    call func_01B_4420                            ; $44B0: $CD $20 $44
    ld   [$D301], a                               ; $44B3: $EA $01 $D3
    call func_01B_440B                            ; $44B6: $CD $0B $44
    call func_01B_4420                            ; $44B9: $CD $20 $44
    ld   [$D302], a                               ; $44BC: $EA $02 $D3
    jr   jr_01B_44CA                              ; $44BF: $18 $09

label_01B_44C1:
    call func_01B_440B                            ; $44C1: $CD $0B $44
    call func_01B_4420                            ; $44C4: $CD $20 $44
    ld   [$D300], a                               ; $44C7: $EA $00 $D3

jr_01B_44CA:
    call func_01B_440B                            ; $44CA: $CD $0B $44
    jr   jr_01B_4531                              ; $44CD: $18 $62

label_01B_44CF:
    call func_01B_440B                            ; $44CF: $CD $0B $44
    call func_01B_4420                            ; $44D2: $CD $20 $44
    push hl                                       ; $44D5: $E5
    ld   a, l                                     ; $44D6: $7D
    add  $0B                                      ; $44D7: $C6 $0B
    ld   l, a                                     ; $44D9: $6F
    ld   c, [hl]                                  ; $44DA: $4E
    ld   a, b                                     ; $44DB: $78
    or   c                                        ; $44DC: $B1
    ld   [hl], a                                  ; $44DD: $77
    ld   b, h                                     ; $44DE: $44
    ld   c, l                                     ; $44DF: $4D
    dec  c                                        ; $44E0: $0D
    dec  c                                        ; $44E1: $0D
    pop  hl                                       ; $44E2: $E1
    ld   a, [hl+]                                 ; $44E3: $2A
    ld   e, a                                     ; $44E4: $5F
    ld   a, [hl-]                                 ; $44E5: $3A
    ld   d, a                                     ; $44E6: $57
    inc  de                                       ; $44E7: $13
    ld   a, e                                     ; $44E8: $7B
    ld   [hl+], a                                 ; $44E9: $22
    ld   a, d                                     ; $44EA: $7A
    ld   [hl-], a                                 ; $44EB: $32
    ld   a, d                                     ; $44EC: $7A
    ld   [bc], a                                  ; $44ED: $02
    dec  c                                        ; $44EE: $0D
    ld   a, e                                     ; $44EF: $7B
    ld   [bc], a                                  ; $44F0: $02
    jr   jr_01B_4531                              ; $44F1: $18 $3E

label_01B_44F3:
    push hl                                       ; $44F3: $E5
    ld   a, l                                     ; $44F4: $7D
    add  $0B                                      ; $44F5: $C6 $0B
    ld   l, a                                     ; $44F7: $6F
    ld   a, [hl]                                  ; $44F8: $7E
    dec  [hl]                                     ; $44F9: $35
    ld   a, [hl]                                  ; $44FA: $7E
    and  $7F                                      ; $44FB: $E6 $7F
    jr   z, jr_01B_450C                           ; $44FD: $28 $0D

    ld   b, h                                     ; $44FF: $44
    ld   c, l                                     ; $4500: $4D
    dec  c                                        ; $4501: $0D
    dec  c                                        ; $4502: $0D
    dec  c                                        ; $4503: $0D
    pop  hl                                       ; $4504: $E1
    ld   a, [bc]                                  ; $4505: $0A
    ld   [hl+], a                                 ; $4506: $22
    inc  c                                        ; $4507: $0C
    ld   a, [bc]                                  ; $4508: $0A
    ld   [hl-], a                                 ; $4509: $32
    jr   jr_01B_4531                              ; $450A: $18 $25

jr_01B_450C:
    pop  hl                                       ; $450C: $E1
    jr   jr_01B_44CA                              ; $450D: $18 $BB

func_01B_450F:
    ld   hl, $D369                                ; $450F: $21 $69 $D3
    ld   a, [hl]                                  ; $4512: $7E
    and  a                                        ; $4513: $A7
    ret  z                                        ; $4514: $C8

    ld   a, [$D3CE]                               ; $4515: $FA $CE $D3
    and  a                                        ; $4518: $A7
    ret  z                                        ; $4519: $C8

    call func_01B_4303                            ; $451A: $CD $03 $43
    ld   a, $01                                   ; $451D: $3E $01
    ld   [$D350], a                               ; $451F: $EA $50 $D3
    ld   hl, $D310                                ; $4522: $21 $10 $D3

label_01B_4525:
    inc  l                                        ; $4525: $2C
    ld   a, [hl+]                                 ; $4526: $2A
    and  a                                        ; $4527: $A7
    jp   z, label_01B_445B                        ; $4528: $CA $5B $44

    dec  [hl]                                     ; $452B: $35
    jp   nz, label_01B_442A                       ; $452C: $C2 $2A $44

label_01B_452F:
    inc  l                                        ; $452F: $2C
    inc  l                                        ; $4530: $2C

label_01B_4531:
jr_01B_4531:
    call func_01B_4420                            ; $4531: $CD $20 $44
    cp   $00                                      ; $4534: $FE $00
    jp   z, label_01B_4460                        ; $4536: $CA $60 $44

    cp   $9D                                      ; $4539: $FE $9D
    jp   z, label_01B_43DB                        ; $453B: $CA $DB $43

    cp   $9E                                      ; $453E: $FE $9E
    jp   z, label_01B_44AD                        ; $4540: $CA $AD $44

    cp   $9F                                      ; $4543: $FE $9F
    jp   z, label_01B_44C1                        ; $4545: $CA $C1 $44

    cp   $9B                                      ; $4548: $FE $9B
    jp   z, label_01B_44CF                        ; $454A: $CA $CF $44

    cp   $9C                                      ; $454D: $FE $9C
    jp   z, label_01B_44F3                        ; $454F: $CA $F3 $44

    cp   $99                                      ; $4552: $FE $99
    jp   z, label_01B_47FF                        ; $4554: $CA $FF $47

    cp   $9A                                      ; $4557: $FE $9A
    jp   z, label_01B_480A                        ; $4559: $CA $0A $48

    cp   $94                                      ; $455C: $FE $94
    jp   z, $498D                                 ; $455E: $CA $8D $49

    cp   $97                                      ; $4561: $FE $97
    jp   z, label_01B_4846                        ; $4563: $CA $46 $48

    cp   $98                                      ; $4566: $FE $98
    jp   z, label_01B_4855                        ; $4568: $CA $55 $48

    cp   $96                                      ; $456B: $FE $96
    jp   z, label_01B_47F1                        ; $456D: $CA $F1 $47

    cp   $95                                      ; $4570: $FE $95
    jp   z, label_01B_47FC                        ; $4572: $CA $FC $47

    and  $F0                                      ; $4575: $E6 $F0
    cp   $A0                                      ; $4577: $FE $A0
    jr   nz, jr_01B_45C8                          ; $4579: $20 $4D

    ld   a, b                                     ; $457B: $78
    and  $0F                                      ; $457C: $E6 $0F
    ld   c, a                                     ; $457E: $4F
    ld   b, $00                                   ; $457F: $06 $00
    push hl                                       ; $4581: $E5
    ld   de, $D301                                ; $4582: $11 $01 $D3
    ld   a, [de]                                  ; $4585: $1A
    ld   l, a                                     ; $4586: $6F
    inc  e                                        ; $4587: $1C
    ld   a, [de]                                  ; $4588: $1A
    ld   h, a                                     ; $4589: $67
    add  hl, bc                                   ; $458A: $09
    ld   a, [hl]                                  ; $458B: $7E
    pop  hl                                       ; $458C: $E1
    push hl                                       ; $458D: $E5
    ld   d, a                                     ; $458E: $57
    inc  l                                        ; $458F: $2C
    inc  l                                        ; $4590: $2C
    inc  l                                        ; $4591: $2C
    ld   a, [hl]                                  ; $4592: $7E
    and  $F0                                      ; $4593: $E6 $F0
    jr   nz, jr_01B_459A                          ; $4595: $20 $03

    ld   a, d                                     ; $4597: $7A
    jr   jr_01B_45BF                              ; $4598: $18 $25

jr_01B_459A:
    ld   e, a                                     ; $459A: $5F
    ld   a, d                                     ; $459B: $7A
    push af                                       ; $459C: $F5
    srl  a                                        ; $459D: $CB $3F
    sla  e                                        ; $459F: $CB $23
    jr   c, jr_01B_45AB                           ; $45A1: $38 $08

    ld   d, a                                     ; $45A3: $57
    srl  a                                        ; $45A4: $CB $3F
    sla  e                                        ; $45A6: $CB $23
    jr   c, jr_01B_45AB                           ; $45A8: $38 $01

    add  d                                        ; $45AA: $82

jr_01B_45AB:
    ld   c, a                                     ; $45AB: $4F
    and  a                                        ; $45AC: $A7
    jr   nz, jr_01B_45B1                          ; $45AD: $20 $02

    ld   c, $02                                   ; $45AF: $0E $02

jr_01B_45B1:
    ld   de, $D350                                ; $45B1: $11 $50 $D3
    ld   a, [de]                                  ; $45B4: $1A
    dec  a                                        ; $45B5: $3D
    ld   e, a                                     ; $45B6: $5F
    ld   d, $00                                   ; $45B7: $16 $00
    ld   hl, $D307                                ; $45B9: $21 $07 $D3
    add  hl, de                                   ; $45BC: $19
    ld   [hl], c                                  ; $45BD: $71
    pop  af                                       ; $45BE: $F1

jr_01B_45BF:
    pop  hl                                       ; $45BF: $E1
    dec  l                                        ; $45C0: $2D
    ld   [hl+], a                                 ; $45C1: $22
    call func_01B_440B                            ; $45C2: $CD $0B $44
    call func_01B_4420                            ; $45C5: $CD $20 $44

jr_01B_45C8:
    ld   a, [$D350]                               ; $45C8: $FA $50 $D3
    cp   $04                                      ; $45CB: $FE $04
    jr   z, jr_01B_4607                           ; $45CD: $28 $38

    push de                                       ; $45CF: $D5
    ld   de, $D3B0                                ; $45D0: $11 $B0 $D3
    call func_01B_4895                            ; $45D3: $CD $95 $48
    xor  a                                        ; $45D6: $AF
    ld   [de], a                                  ; $45D7: $12
    inc  e                                        ; $45D8: $1C
    ld   [de], a                                  ; $45D9: $12
    ld   de, $D3B6                                ; $45DA: $11 $B6 $D3
    call func_01B_4895                            ; $45DD: $CD $95 $48
    inc  e                                        ; $45E0: $1C
    xor  a                                        ; $45E1: $AF
    ld   [de], a                                  ; $45E2: $12
    ld   a, [$D350]                               ; $45E3: $FA $50 $D3
    cp   $03                                      ; $45E6: $FE $03
    jr   nz, jr_01B_4606                          ; $45E8: $20 $1C

    ld   de, $D39E                                ; $45EA: $11 $9E $D3
    ld   a, [de]                                  ; $45ED: $1A
    and  a                                        ; $45EE: $A7
    jr   z, jr_01B_45F8                           ; $45EF: $28 $07

    ld   a, $01                                   ; $45F1: $3E $01
    ld   [de], a                                  ; $45F3: $12
    xor  a                                        ; $45F4: $AF
    ld   [$D39F], a                               ; $45F5: $EA $9F $D3

jr_01B_45F8:
    ld   de, $D3D9                                ; $45F8: $11 $D9 $D3
    ld   a, [de]                                  ; $45FB: $1A
    and  a                                        ; $45FC: $A7
    jr   z, jr_01B_4606                           ; $45FD: $28 $07

    ld   a, $01                                   ; $45FF: $3E $01
    ld   [de], a                                  ; $4601: $12
    xor  a                                        ; $4602: $AF
    ld   [$D3DA], a                               ; $4603: $EA $DA $D3

jr_01B_4606:
    pop  de                                       ; $4606: $D1

jr_01B_4607:
    ld   c, b                                     ; $4607: $48
    ld   b, $00                                   ; $4608: $06 $00
    call func_01B_440B                            ; $460A: $CD $0B $44
    ld   a, [$D350]                               ; $460D: $FA $50 $D3
    cp   $04                                      ; $4610: $FE $04
    jp   z, label_01B_4649                        ; $4612: $CA $49 $46

    push hl                                       ; $4615: $E5
    ld   a, l                                     ; $4616: $7D
    add  $05                                      ; $4617: $C6 $05
    ld   l, a                                     ; $4619: $6F
    ld   e, l                                     ; $461A: $5D
    ld   d, h                                     ; $461B: $54
    inc  l                                        ; $461C: $2C
    inc  l                                        ; $461D: $2C
    ld   a, c                                     ; $461E: $79
    cp   $01                                      ; $461F: $FE $01
    jr   z, jr_01B_4644                           ; $4621: $28 $21

    ld   [hl], $00                                ; $4623: $36 $00
    ld   a, [$D300]                               ; $4625: $FA $00 $D3
    and  a                                        ; $4628: $A7
    jr   z, jr_01B_4637                           ; $4629: $28 $0C

    ld   l, a                                     ; $462B: $6F
    ld   h, $00                                   ; $462C: $26 $00
    bit  7, l                                     ; $462E: $CB $7D
    jr   z, jr_01B_4634                           ; $4630: $28 $02

    ld   h, $FF                                   ; $4632: $26 $FF

jr_01B_4634:
    add  hl, bc                                   ; $4634: $09
    ld   b, h                                     ; $4635: $44
    ld   c, l                                     ; $4636: $4D

jr_01B_4637:
    ld   hl, $49C2                                ; $4637: $21 $C2 $49
    add  hl, bc                                   ; $463A: $09
    ld   a, [hl+]                                 ; $463B: $2A
    ld   [de], a                                  ; $463C: $12
    inc  e                                        ; $463D: $1C
    ld   a, [hl]                                  ; $463E: $7E
    ld   [de], a                                  ; $463F: $12
    pop  hl                                       ; $4640: $E1
    jp   label_01B_467A                           ; $4641: $C3 $7A $46

jr_01B_4644:
    ld   [hl], $01                                ; $4644: $36 $01
    pop  hl                                       ; $4646: $E1
    jr   jr_01B_467A                              ; $4647: $18 $31

label_01B_4649:
    push hl                                       ; $4649: $E5
    ld   a, c                                     ; $464A: $79
    cp   $FF                                      ; $464B: $FE $FF
    jr   z, jr_01B_4667                           ; $464D: $28 $18

    ld   de, $D346                                ; $464F: $11 $46 $D3
    ld   hl, $4A54                                ; $4652: $21 $54 $4A
    add  hl, bc                                   ; $4655: $09

jr_01B_4656:
    ld   a, [hl+]                                 ; $4656: $2A
    ld   [de], a                                  ; $4657: $12
    inc  e                                        ; $4658: $1C
    ld   a, e                                     ; $4659: $7B
    cp   $4B                                      ; $465A: $FE $4B
    jr   nz, jr_01B_4656                          ; $465C: $20 $F8

    ld   c, $20                                   ; $465E: $0E $20
    ld   hl, $D344                                ; $4660: $21 $44 $D3
    ld   b, $00                                   ; $4663: $06 $00
    jr   jr_01B_46A8                              ; $4665: $18 $41

jr_01B_4667:
    ld   a, [$D34F]                               ; $4667: $FA $4F $D3
    bit  7, a                                     ; $466A: $CB $7F
    jp   nz, label_01B_46D9                       ; $466C: $C2 $D9 $46

    ld   a, $01                                   ; $466F: $3E $01
    ld   [wActiveNoiseSfx], a                     ; $4671: $EA $78 $D3
    call func_01B_4037                            ; $4674: $CD $37 $40
    jp   label_01B_46D9                           ; $4677: $C3 $D9 $46

label_01B_467A:
jr_01B_467A:
    push hl                                       ; $467A: $E5
    ld   b, $00                                   ; $467B: $06 $00
    ld   a, [$D350]                               ; $467D: $FA $50 $D3
    cp   $01                                      ; $4680: $FE $01
    jr   z, jr_01B_46A5                           ; $4682: $28 $21

    cp   $02                                      ; $4684: $FE $02
    jr   z, jr_01B_46A1                           ; $4686: $28 $19

    ld   c, $1A                                   ; $4688: $0E $1A
    ld   a, [$D33F]                               ; $468A: $FA $3F $D3
    bit  7, a                                     ; $468D: $CB $7F
    jr   nz, jr_01B_4696                          ; $468F: $20 $05

    xor  a                                        ; $4691: $AF
    ld   [c], a                                   ; $4692: $E2
    ld   a, $80                                   ; $4693: $3E $80
    ld   [c], a                                   ; $4695: $E2

jr_01B_4696:
    inc  c                                        ; $4696: $0C
    inc  l                                        ; $4697: $2C
    inc  l                                        ; $4698: $2C
    inc  l                                        ; $4699: $2C
    inc  l                                        ; $469A: $2C
    ld   a, [hl+]                                 ; $469B: $2A
    ld   e, a                                     ; $469C: $5F
    ld   d, $00                                   ; $469D: $16 $00
    jr   jr_01B_46AF                              ; $469F: $18 $0E

jr_01B_46A1:
    ld   c, $16                                   ; $46A1: $0E $16
    jr   jr_01B_46A8                              ; $46A3: $18 $03

jr_01B_46A5:
    ld   c, $10                                   ; $46A5: $0E $10
    inc  c                                        ; $46A7: $0C

jr_01B_46A8:
    inc  l                                        ; $46A8: $2C
    inc  l                                        ; $46A9: $2C
    ld   a, [hl+]                                 ; $46AA: $2A
    ld   e, a                                     ; $46AB: $5F
    inc  l                                        ; $46AC: $2C
    ld   a, [hl+]                                 ; $46AD: $2A
    ld   d, a                                     ; $46AE: $57

jr_01B_46AF:
    push hl                                       ; $46AF: $E5
    inc  l                                        ; $46B0: $2C
    inc  l                                        ; $46B1: $2C
    ld   a, [hl+]                                 ; $46B2: $2A
    and  a                                        ; $46B3: $A7
    jr   z, jr_01B_46B8                           ; $46B4: $28 $02

    ld   e, $08                                   ; $46B6: $1E $08

jr_01B_46B8:
    inc  l                                        ; $46B8: $2C
    inc  l                                        ; $46B9: $2C
    ld   [hl], $00                                ; $46BA: $36 $00
    inc  l                                        ; $46BC: $2C
    ld   a, [hl]                                  ; $46BD: $7E
    pop  hl                                       ; $46BE: $E1
    bit  7, a                                     ; $46BF: $CB $7F
    jr   nz, jr_01B_46D9                          ; $46C1: $20 $16

    ld   a, [$D350]                               ; $46C3: $FA $50 $D3
    cp   $03                                      ; $46C6: $FE $03
    jp   z, label_01B_42AB                        ; $46C8: $CA $AB $42

label_01B_46CB:
    ld   a, d                                     ; $46CB: $7A
    or   b                                        ; $46CC: $B0
    ld   [c], a                                   ; $46CD: $E2
    inc  c                                        ; $46CE: $0C
    ld   a, e                                     ; $46CF: $7B
    ld   [c], a                                   ; $46D0: $E2
    inc  c                                        ; $46D1: $0C
    ld   a, [hl+]                                 ; $46D2: $2A
    ld   [c], a                                   ; $46D3: $E2
    inc  c                                        ; $46D4: $0C
    ld   a, [hl]                                  ; $46D5: $7E
    or   $80                                      ; $46D6: $F6 $80
    ld   [c], a                                   ; $46D8: $E2

label_01B_46D9:
jr_01B_46D9:
    pop  hl                                       ; $46D9: $E1
    dec  l                                        ; $46DA: $2D
    ld   a, [hl-]                                 ; $46DB: $3A
    ld   [hl-], a                                 ; $46DC: $32
    dec  l                                        ; $46DD: $2D

label_01B_46DE:
    ld   de, $D350                                ; $46DE: $11 $50 $D3
    ld   a, [de]                                  ; $46E1: $1A
    cp   $04                                      ; $46E2: $FE $04
    jr   z, jr_01B_46EF                           ; $46E4: $28 $09

    inc  a                                        ; $46E6: $3C
    ld   [de], a                                  ; $46E7: $12
    ld   a, $10                                   ; $46E8: $3E $10
    add  l                                        ; $46EA: $85
    ld   l, a                                     ; $46EB: $6F
    jp   label_01B_4525                           ; $46EC: $C3 $25 $45

jr_01B_46EF:
    ld   hl, $D31E                                ; $46EF: $21 $1E $D3
    inc  [hl]                                     ; $46F2: $34
    ld   hl, $D32E                                ; $46F3: $21 $2E $D3
    inc  [hl]                                     ; $46F6: $34
    ld   hl, $D33E                                ; $46F7: $21 $3E $D3
    inc  [hl]                                     ; $46FA: $34
    ret                                           ; $46FB: $C9

label_01B_46FC:
    pop  hl                                       ; $46FC: $E1
    ret                                           ; $46FD: $C9

func_01B_46FE:
    push hl                                       ; $46FE: $E5
    ld   a, l                                     ; $46FF: $7D
    add  $06                                      ; $4700: $C6 $06
    ld   l, a                                     ; $4702: $6F
    ld   a, [hl]                                  ; $4703: $7E
    and  $0F                                      ; $4704: $E6 $0F
    jr   z, jr_01B_4720                           ; $4706: $28 $18

    ld   [$D351], a                               ; $4708: $EA $51 $D3
    ld   a, [$D350]                               ; $470B: $FA $50 $D3
    ld   c, $13                                   ; $470E: $0E $13
    cp   $01                                      ; $4710: $FE $01
    jr   z, jr_01B_4762                           ; $4712: $28 $4E

    ld   c, $18                                   ; $4714: $0E $18
    cp   $02                                      ; $4716: $FE $02
    jr   z, jr_01B_4762                           ; $4718: $28 $48

    ld   c, $1D                                   ; $471A: $0E $1D
    cp   $03                                      ; $471C: $FE $03
    jr   z, jr_01B_4762                           ; $471E: $28 $42

label_01B_4720:
jr_01B_4720:
    ld   a, [$D350]                               ; $4720: $FA $50 $D3
    cp   $04                                      ; $4723: $FE $04
    jp   z, label_01B_46FC                        ; $4725: $CA $FC $46

    ld   de, $D3B6                                ; $4728: $11 $B6 $D3
    call func_01B_4895                            ; $472B: $CD $95 $48
    ld   a, [de]                                  ; $472E: $1A
    and  a                                        ; $472F: $A7
    jp   z, label_01B_4749                        ; $4730: $CA $49 $47

    ld   a, [$D350]                               ; $4733: $FA $50 $D3
    ld   c, $13                                   ; $4736: $0E $13
    cp   $01                                      ; $4738: $FE $01
    jp   z, label_01B_485E                        ; $473A: $CA $5E $48

    ld   c, $18                                   ; $473D: $0E $18
    cp   $02                                      ; $473F: $FE $02
    jp   z, label_01B_485E                        ; $4741: $CA $5E $48

    ld   c, $1D                                   ; $4744: $0E $1D
    jp   label_01B_485E                           ; $4746: $C3 $5E $48

label_01B_4749:
    ld   a, [$D350]                               ; $4749: $FA $50 $D3
    cp   $03                                      ; $474C: $FE $03
    jp   nz, label_01B_46FC                       ; $474E: $C2 $FC $46

    ld   a, [$D39E]                               ; $4751: $FA $9E $D3
    and  a                                        ; $4754: $A7
    jp   nz, label_01B_4810                       ; $4755: $C2 $10 $48

    ld   a, [$D3D9]                               ; $4758: $FA $D9 $D3
    and  a                                        ; $475B: $A7
    jp   nz, label_01B_4998                       ; $475C: $C2 $98 $49

    jp   label_01B_46FC                           ; $475F: $C3 $FC $46

jr_01B_4762:
    inc  l                                        ; $4762: $2C
    ld   a, [hl+]                                 ; $4763: $2A
    ld   e, a                                     ; $4764: $5F
    ld   a, [hl]                                  ; $4765: $7E
    and  $0F                                      ; $4766: $E6 $0F
    ld   d, a                                     ; $4768: $57
    push de                                       ; $4769: $D5
    ld   a, l                                     ; $476A: $7D
    add  $04                                      ; $476B: $C6 $04
    ld   l, a                                     ; $476D: $6F
    ld   b, [hl]                                  ; $476E: $46
    ld   a, [$D351]                               ; $476F: $FA $51 $D3
    cp   $01                                      ; $4772: $FE $01
    jp   z, label_01B_48AB                        ; $4774: $CA $AB $48

    cp   $05                                      ; $4777: $FE $05
    jp   z, label_01B_4918                        ; $4779: $CA $18 $49

    ld   hl, $FFFF                                ; $477C: $21 $FF $FF
    pop  de                                       ; $477F: $D1
    add  hl, de                                   ; $4780: $19
    call func_01B_4884                            ; $4781: $CD $84 $48
    jp   label_01B_4720                           ; $4784: $C3 $20 $47

func_01B_4787:
    ld   a, [$D31B]                               ; $4787: $FA $1B $D3
    and  a                                        ; $478A: $A7
    jr   nz, jr_01B_47AE                          ; $478B: $20 $21

    ld   a, [$D317]                               ; $478D: $FA $17 $D3
    and  a                                        ; $4790: $A7
    jr   z, jr_01B_47AE                           ; $4791: $28 $1B

    and  $0F                                      ; $4793: $E6 $0F
    ld   b, a                                     ; $4795: $47
    ld   hl, $D307                                ; $4796: $21 $07 $D3
    ld   a, [$D31E]                               ; $4799: $FA $1E $D3
    cp   [hl]                                     ; $479C: $BE
    jr   nz, jr_01B_47AE                          ; $479D: $20 $0F

    ld   c, $12                                   ; $479F: $0E $12
    ld   de, $D31A                                ; $47A1: $11 $1A $D3
    ld   a, [$D31F]                               ; $47A4: $FA $1F $D3
    bit  7, a                                     ; $47A7: $CB $7F
    jr   nz, jr_01B_47AE                          ; $47A9: $20 $03

    call func_01B_47D2                            ; $47AB: $CD $D2 $47

jr_01B_47AE:
    ld   a, [$D32B]                               ; $47AE: $FA $2B $D3
    and  a                                        ; $47B1: $A7
    ret  nz                                       ; $47B2: $C0

    ld   a, [$D327]                               ; $47B3: $FA $27 $D3
    and  a                                        ; $47B6: $A7
    ret  z                                        ; $47B7: $C8

    and  $0F                                      ; $47B8: $E6 $0F
    ld   b, a                                     ; $47BA: $47
    ld   hl, $D308                                ; $47BB: $21 $08 $D3
    ld   a, [$D32E]                               ; $47BE: $FA $2E $D3
    cp   [hl]                                     ; $47C1: $BE
    ret  nz                                       ; $47C2: $C0

    ld   a, [$D32F]                               ; $47C3: $FA $2F $D3
    bit  7, a                                     ; $47C6: $CB $7F
    ret  nz                                       ; $47C8: $C0

    ld   c, $17                                   ; $47C9: $0E $17
    ld   de, $D32A                                ; $47CB: $11 $2A $D3
    call func_01B_47D2                            ; $47CE: $CD $D2 $47
    ret                                           ; $47D1: $C9

func_01B_47D2:
    push bc                                       ; $47D2: $C5
    dec  b                                        ; $47D3: $05
    ld   c, b                                     ; $47D4: $48
    ld   b, $00                                   ; $47D5: $06 $00
    ld   hl, $4B13                                ; $47D7: $21 $13 $4B
    add  hl, bc                                   ; $47DA: $09
    ld   a, [hl]                                  ; $47DB: $7E
    pop  bc                                       ; $47DC: $C1
    ld   [c], a                                   ; $47DD: $E2
    inc  c                                        ; $47DE: $0C
    inc  c                                        ; $47DF: $0C
    ld   a, [de]                                  ; $47E0: $1A
    or   $80                                      ; $47E1: $F6 $80
    ld   [c], a                                   ; $47E3: $E2
    ret                                           ; $47E4: $C9

label_01B_47E5:
    xor  a                                        ; $47E5: $AF
    ld   [$D3CE], a                               ; $47E6: $EA $CE $D3
    ldh  a, [hNextWorldMusicTrack]                ; $47E9: $F0 $BF
    ld   [wActiveMusicTrack], a                   ; $47EB: $EA $68 $D3
    jp   PlayMusicTrack_1B_EntryPoint             ; $47EE: $C3 $1E $40

label_01B_47F1:
    ld   a, $01                                   ; $47F1: $3E $01

jr_01B_47F3:
    ld   [$D3CD], a                               ; $47F3: $EA $CD $D3
    call func_01B_440B                            ; $47F6: $CD $0B $44
    jp   label_01B_4531                           ; $47F9: $C3 $31 $45

label_01B_47FC:
    xor  a                                        ; $47FC: $AF
    jr   jr_01B_47F3                              ; $47FD: $18 $F4

label_01B_47FF:
    ld   a, $01                                   ; $47FF: $3E $01

jr_01B_4801:
    ld   [$D39E], a                               ; $4801: $EA $9E $D3
    call func_01B_440B                            ; $4804: $CD $0B $44
    jp   label_01B_4531                           ; $4807: $C3 $31 $45

label_01B_480A:
    xor  a                                        ; $480A: $AF
    ld   [$D39E], a                               ; $480B: $EA $9E $D3
    jr   jr_01B_4801                              ; $480E: $18 $F1

label_01B_4810:
    cp   $02                                      ; $4810: $FE $02
    jp   z, label_01B_46FC                        ; $4812: $CA $FC $46

    ld   bc, $D39F                                ; $4815: $01 $9F $D3
    call func_01B_4842                            ; $4818: $CD $42 $48
    ld   c, $1C                                   ; $481B: $0E $1C
    ld   b, $40                                   ; $481D: $06 $40
    cp   $03                                      ; $481F: $FE $03
    jr   z, jr_01B_483D                           ; $4821: $28 $1A

    ld   b, $60                                   ; $4823: $06 $60
    cp   $05                                      ; $4825: $FE $05
    jr   z, jr_01B_483D                           ; $4827: $28 $14

    cp   $0A                                      ; $4829: $FE $0A
    jr   z, jr_01B_483D                           ; $482B: $28 $10

    ld   b, $00                                   ; $482D: $06 $00
    cp   $07                                      ; $482F: $FE $07
    jr   z, jr_01B_483D                           ; $4831: $28 $0A

    cp   $0D                                      ; $4833: $FE $0D
    jp   nz, label_01B_46FC                       ; $4835: $C2 $FC $46

    ld   a, $02                                   ; $4838: $3E $02
    ld   [$D39E], a                               ; $483A: $EA $9E $D3

label_01B_483D:
jr_01B_483D:
    ld   a, b                                     ; $483D: $78
    ld   [c], a                                   ; $483E: $E2
    jp   label_01B_46FC                           ; $483F: $C3 $FC $46

func_01B_4842:
    ld   a, [bc]                                  ; $4842: $0A
    inc  a                                        ; $4843: $3C
    ld   [bc], a                                  ; $4844: $02
    ret                                           ; $4845: $C9

label_01B_4846:
    ld   de, $D3B6                                ; $4846: $11 $B6 $D3
    call func_01B_4895                            ; $4849: $CD $95 $48
    ld   a, $01                                   ; $484C: $3E $01

jr_01B_484E:
    ld   [de], a                                  ; $484E: $12
    call func_01B_440B                            ; $484F: $CD $0B $44
    jp   label_01B_4531                           ; $4852: $C3 $31 $45

label_01B_4855:
    ld   de, $D3B6                                ; $4855: $11 $B6 $D3
    call func_01B_4895                            ; $4858: $CD $95 $48
    xor  a                                        ; $485B: $AF
    jr   jr_01B_484E                              ; $485C: $18 $F0

label_01B_485E:
    inc  e                                        ; $485E: $1C
    ld   a, [de]                                  ; $485F: $1A
    and  a                                        ; $4860: $A7
    jr   nz, jr_01B_4874                          ; $4861: $20 $11

    inc  a                                        ; $4863: $3C
    ld   [de], a                                  ; $4864: $12
    pop  hl                                       ; $4865: $E1
    push hl                                       ; $4866: $E5
    call func_01B_4879                            ; $4867: $CD $79 $48

jr_01B_486A:
    ld   hl, hFF9C                                ; $486A: $21 $9C $FF
    add  hl, de                                   ; $486D: $19
    call func_01B_4884                            ; $486E: $CD $84 $48
    jp   label_01B_46FC                           ; $4871: $C3 $FC $46

jr_01B_4874:
    call func_01B_489E                            ; $4874: $CD $9E $48
    jr   jr_01B_486A                              ; $4877: $18 $F1

func_01B_4879:
    ld   a, $07                                   ; $4879: $3E $07
    add  l                                        ; $487B: $85
    ld   l, a                                     ; $487C: $6F
    ld   a, [hl+]                                 ; $487D: $2A
    ld   e, a                                     ; $487E: $5F
    ld   a, [hl]                                  ; $487F: $7E
    and  $0F                                      ; $4880: $E6 $0F
    ld   d, a                                     ; $4882: $57
    ret                                           ; $4883: $C9

func_01B_4884:
    ld   de, $D3A4                                ; $4884: $11 $A4 $D3
    call func_01B_4895                            ; $4887: $CD $95 $48
    ld   a, l                                     ; $488A: $7D
    ld   [c], a                                   ; $488B: $E2
    ld   [de], a                                  ; $488C: $12
    inc  c                                        ; $488D: $0C
    inc  e                                        ; $488E: $1C
    ld   a, h                                     ; $488F: $7C
    and  $0F                                      ; $4890: $E6 $0F
    ld   [c], a                                   ; $4892: $E2
    ld   [de], a                                  ; $4893: $12
    ret                                           ; $4894: $C9

func_01B_4895:
    ld   a, [$D350]                               ; $4895: $FA $50 $D3
    dec  a                                        ; $4898: $3D
    sla  a                                        ; $4899: $CB $27
    add  e                                        ; $489B: $83
    ld   e, a                                     ; $489C: $5F
    ret                                           ; $489D: $C9

func_01B_489E:
    ld   de, $D3A4                                ; $489E: $11 $A4 $D3
    call func_01B_4895                            ; $48A1: $CD $95 $48
    ld   a, [de]                                  ; $48A4: $1A
    ld   l, a                                     ; $48A5: $6F
    inc  e                                        ; $48A6: $1C
    ld   a, [de]                                  ; $48A7: $1A
    ld   d, a                                     ; $48A8: $57
    ld   e, l                                     ; $48A9: $5D
    ret                                           ; $48AA: $C9

label_01B_48AB:
    pop  de                                       ; $48AB: $D1
    ld   de, $D3B0                                ; $48AC: $11 $B0 $D3
    call func_01B_4895                            ; $48AF: $CD $95 $48
    ld   a, [de]                                  ; $48B2: $1A
    inc  a                                        ; $48B3: $3C
    ld   [de], a                                  ; $48B4: $12
    inc  e                                        ; $48B5: $1C
    cp   $19                                      ; $48B6: $FE $19
    jr   z, jr_01B_48EB                           ; $48B8: $28 $31

    cp   $2D                                      ; $48BA: $FE $2D
    jr   z, jr_01B_48E4                           ; $48BC: $28 $26

    ld   a, [de]                                  ; $48BE: $1A
    and  a                                        ; $48BF: $A7
    jp   z, label_01B_4720                        ; $48C0: $CA $20 $47

jr_01B_48C3:
    dec  e                                        ; $48C3: $1D
    ld   a, [de]                                  ; $48C4: $1A
    sub  $19                                      ; $48C5: $D6 $19
    sla  a                                        ; $48C7: $CB $27
    ld   l, a                                     ; $48C9: $6F
    ld   h, $00                                   ; $48CA: $26 $00
    ld   de, $48F0                                ; $48CC: $11 $F0 $48
    add  hl, de                                   ; $48CF: $19
    ld   a, [hl+]                                 ; $48D0: $2A
    ld   d, a                                     ; $48D1: $57
    ld   a, [hl]                                  ; $48D2: $7E
    ld   e, a                                     ; $48D3: $5F
    pop  hl                                       ; $48D4: $E1
    push hl                                       ; $48D5: $E5
    push de                                       ; $48D6: $D5
    call func_01B_4879                            ; $48D7: $CD $79 $48
    ld   h, d                                     ; $48DA: $62
    ld   l, e                                     ; $48DB: $6B
    pop  de                                       ; $48DC: $D1
    add  hl, de                                   ; $48DD: $19
    call func_01B_4884                            ; $48DE: $CD $84 $48
    jp   label_01B_4720                           ; $48E1: $C3 $20 $47

jr_01B_48E4:
    dec  e                                        ; $48E4: $1D
    ld   a, $19                                   ; $48E5: $3E $19
    ld   [de], a                                  ; $48E7: $12
    inc  e                                        ; $48E8: $1C
    jr   jr_01B_48C3                              ; $48E9: $18 $D8

jr_01B_48EB:
    ld   a, $01                                   ; $48EB: $3E $01
    ld   [de], a                                  ; $48ED: $12
    jr   jr_01B_48C3                              ; $48EE: $18 $D3

    nop                                           ; $48F0: $00
    nop                                           ; $48F1: $00
    nop                                           ; $48F2: $00
    nop                                           ; $48F3: $00
    nop                                           ; $48F4: $00
    ld   bc, $0100                                ; $48F5: $01 $00 $01
    nop                                           ; $48F8: $00
    ld   [bc], a                                  ; $48F9: $02
    nop                                           ; $48FA: $00
    ld   [bc], a                                  ; $48FB: $02
    nop                                           ; $48FC: $00
    nop                                           ; $48FD: $00
    nop                                           ; $48FE: $00
    nop                                           ; $48FF: $00
    rst  $38                                      ; $4900: $FF
    rst  $38                                      ; $4901: $FF
    rst  $38                                      ; $4902: $FF
    rst  $38                                      ; $4903: $FF
    rst  $38                                      ; $4904: $FF
    cp   $FF                                      ; $4905: $FE $FF
    cp   $00                                      ; $4907: $FE $00
    nop                                           ; $4909: $00
    nop                                           ; $490A: $00
    ld   bc, $0200                                ; $490B: $01 $00 $02
    nop                                           ; $490E: $00
    ld   bc, $0000                                ; $490F: $01 $00 $00
    rst  $38                                      ; $4912: $FF
    rst  $38                                      ; $4913: $FF
    rst  $38                                      ; $4914: $FF
    cp   $FF                                      ; $4915: $FE $FF
    rst  $38                                      ; $4917: $FF

label_01B_4918:
    pop  de                                       ; $4918: $D1
    ld   de, $D3D0                                ; $4919: $11 $D0 $D3
    call func_01B_4895                            ; $491C: $CD $95 $48
    ld   a, [de]                                  ; $491F: $1A
    inc  a                                        ; $4920: $3C
    ld   [de], a                                  ; $4921: $12
    inc  e                                        ; $4922: $1C
    cp   $21                                      ; $4923: $FE $21
    jr   z, jr_01B_4946                           ; $4925: $28 $1F

jr_01B_4927:
    dec  e                                        ; $4927: $1D
    ld   a, [de]                                  ; $4928: $1A
    sla  a                                        ; $4929: $CB $27
    ld   l, a                                     ; $492B: $6F
    ld   h, $00                                   ; $492C: $26 $00
    ld   de, $494D                                ; $492E: $11 $4D $49
    add  hl, de                                   ; $4931: $19
    ld   a, [hl+]                                 ; $4932: $2A
    ld   d, a                                     ; $4933: $57
    ld   a, [hl]                                  ; $4934: $7E
    ld   e, a                                     ; $4935: $5F
    pop  hl                                       ; $4936: $E1
    push hl                                       ; $4937: $E5
    push de                                       ; $4938: $D5
    call func_01B_4879                            ; $4939: $CD $79 $48
    ld   h, d                                     ; $493C: $62
    ld   l, e                                     ; $493D: $6B
    pop  de                                       ; $493E: $D1
    add  hl, de                                   ; $493F: $19
    call func_01B_4884                            ; $4940: $CD $84 $48
    jp   label_01B_4720                           ; $4943: $C3 $20 $47

jr_01B_4946:
    dec  e                                        ; $4946: $1D
    ld   a, $01                                   ; $4947: $3E $01
    ld   [de], a                                  ; $4949: $12
    inc  e                                        ; $494A: $1C
    jr   jr_01B_4927                              ; $494B: $18 $DA

    nop                                           ; $494D: $00
    ld   [$0000], sp                              ; $494E: $08 $00 $00
    rst  $38                                      ; $4951: $FF
    ld   hl, sp+$00                               ; $4952: $F8 $00
    nop                                           ; $4954: $00
    nop                                           ; $4955: $00
    ld   a, [bc]                                  ; $4956: $0A
    nop                                           ; $4957: $00
    ld   [bc], a                                  ; $4958: $02
    rst  $38                                      ; $4959: $FF
    ld   a, [$0200]                               ; $495A: $FA $00 $02
    nop                                           ; $495D: $00
    inc  c                                        ; $495E: $0C
    nop                                           ; $495F: $00
    inc  b                                        ; $4960: $04
    rst  $38                                      ; $4961: $FF
    db   $FC                                      ; $4962: $FC
    nop                                           ; $4963: $00
    inc  b                                        ; $4964: $04
    nop                                           ; $4965: $00
    ld   a, [bc]                                  ; $4966: $0A
    nop                                           ; $4967: $00
    ld   [bc], a                                  ; $4968: $02
    rst  $38                                      ; $4969: $FF
    ld   a, [$0200]                               ; $496A: $FA $00 $02
    nop                                           ; $496D: $00
    ld   [$0000], sp                              ; $496E: $08 $00 $00
    rst  $38                                      ; $4971: $FF
    ld   hl, sp+$00                               ; $4972: $F8 $00
    nop                                           ; $4974: $00
    nop                                           ; $4975: $00
    ld   b, $FF                                   ; $4976: $06 $FF
    cp   $FF                                      ; $4978: $FE $FF
    or   $FF                                      ; $497A: $F6 $FF
    cp   $00                                      ; $497C: $FE $00
    inc  b                                        ; $497E: $04
    rst  $38                                      ; $497F: $FF
    db   $FC                                      ; $4980: $FC
    rst  $38                                      ; $4981: $FF
    db   $F4                                      ; $4982: $F4
    rst  $38                                      ; $4983: $FF
    db   $FC                                      ; $4984: $FC
    nop                                           ; $4985: $00
    ld   b, $FF                                   ; $4986: $06 $FF
    cp   $FF                                      ; $4988: $FE $FF
    or   $FF                                      ; $498A: $F6 $FF
    cp   $3E                                      ; $498C: $FE $3E
    ld   bc, $D9EA                                ; $498E: $01 $EA $D9
    db   $D3                                      ; $4991: $D3
    call func_01B_440B                            ; $4992: $CD $0B $44
    jp   label_01B_4531                           ; $4995: $C3 $31 $45

label_01B_4998:
    cp   $02                                      ; $4998: $FE $02
    jp   z, label_01B_46FC                        ; $499A: $CA $FC $46

    ld   bc, $D3DA                                ; $499D: $01 $DA $D3
    call func_01B_4842                            ; $49A0: $CD $42 $48
    ld   c, $1C                                   ; $49A3: $0E $1C
    ld   b, $60                                   ; $49A5: $06 $60
    cp   $03                                      ; $49A7: $FE $03
    jp   z, label_01B_483D                        ; $49A9: $CA $3D $48

    ld   b, $40                                   ; $49AC: $06 $40
    cp   $05                                      ; $49AE: $FE $05
    jp   z, label_01B_483D                        ; $49B0: $CA $3D $48

    ld   b, $20                                   ; $49B3: $06 $20
    cp   $06                                      ; $49B5: $FE $06
    jp   nz, label_01B_46FC                       ; $49B7: $C2 $FC $46

    ld   a, $02                                   ; $49BA: $3E $02
    ld   [$D3D9], a                               ; $49BC: $EA $D9 $D3
    jp   label_01B_483D                           ; $49BF: $C3 $3D $48

    nop                                           ; $49C2: $00
    rrca                                          ; $49C3: $0F
    inc  l                                        ; $49C4: $2C
    nop                                           ; $49C5: $00
    sbc  h                                        ; $49C6: $9C
    nop                                           ; $49C7: $00
    ld   b, $01                                   ; $49C8: $06 $01
    ld   l, e                                     ; $49CA: $6B
    ld   bc, $01C9                                ; $49CB: $01 $C9 $01
    inc  hl                                       ; $49CE: $23
    ld   [bc], a                                  ; $49CF: $02
    ld   [hl], a                                  ; $49D0: $77
    ld   [bc], a                                  ; $49D1: $02
    add  $02                                      ; $49D2: $C6 $02
    ld   [de], a                                  ; $49D4: $12
    inc  bc                                       ; $49D5: $03
    ld   d, [hl]                                  ; $49D6: $56
    inc  bc                                       ; $49D7: $03
    sbc  e                                        ; $49D8: $9B
    inc  bc                                       ; $49D9: $03
    jp   c, $1603                                 ; $49DA: $DA $03 $16

    inc  b                                        ; $49DD: $04
    ld   c, [hl]                                  ; $49DE: $4E
    inc  b                                        ; $49DF: $04
    add  e                                        ; $49E0: $83
    inc  b                                        ; $49E1: $04
    or   l                                        ; $49E2: $B5
    inc  b                                        ; $49E3: $04
    push hl                                       ; $49E4: $E5
    inc  b                                        ; $49E5: $04
    ld   de, $3B05                                ; $49E6: $11 $05 $3B
    dec  b                                        ; $49E9: $05
    ld   h, e                                     ; $49EA: $63
    dec  b                                        ; $49EB: $05
    adc  c                                        ; $49EC: $89
    dec  b                                        ; $49ED: $05
    xor  h                                        ; $49EE: $AC
    dec  b                                        ; $49EF: $05
    adc  $05                                      ; $49F0: $CE $05
    db   $ED                                      ; $49F2: $ED
    dec  b                                        ; $49F3: $05
    ld   a, [bc]                                  ; $49F4: $0A
    ld   b, $27                                   ; $49F5: $06 $27
    ld   b, $42                                   ; $49F7: $06 $42
    ld   b, $5B                                   ; $49F9: $06 $5B
    ld   b, $72                                   ; $49FB: $06 $72

jr_01B_49FD:
    ld   b, $89                                   ; $49FD: $06 $89
    ld   b, $9E                                   ; $49FF: $06 $9E
    ld   b, $B2                                   ; $4A01: $06 $B2
    ld   b, $C4                                   ; $4A03: $06 $C4
    ld   b, $D6                                   ; $4A05: $06 $D6
    ld   b, $E7                                   ; $4A07: $06 $E7
    ld   b, $F7                                   ; $4A09: $06 $F7
    ld   b, $06                                   ; $4A0B: $06 $06
    rlca                                          ; $4A0D: $07
    inc  d                                        ; $4A0E: $14
    rlca                                          ; $4A0F: $07
    ld   hl, label_2D07                           ; $4A10: $21 $07 $2D
    rlca                                          ; $4A13: $07
    add  hl, sp                                   ; $4A14: $39
    rlca                                          ; $4A15: $07
    ld   b, h                                     ; $4A16: $44
    rlca                                          ; $4A17: $07
    ld   c, a                                     ; $4A18: $4F
    rlca                                          ; $4A19: $07
    ld   e, c                                     ; $4A1A: $59
    rlca                                          ; $4A1B: $07
    ld   h, d                                     ; $4A1C: $62
    rlca                                          ; $4A1D: $07
    ld   l, e                                     ; $4A1E: $6B
    rlca                                          ; $4A1F: $07
    ld   [hl], h                                  ; $4A20: $74
    rlca                                          ; $4A21: $07
    ld   a, e                                     ; $4A22: $7B
    rlca                                          ; $4A23: $07
    add  e                                        ; $4A24: $83
    rlca                                          ; $4A25: $07
    adc  d                                        ; $4A26: $8A
    rlca                                          ; $4A27: $07
    sub  b                                        ; $4A28: $90
    rlca                                          ; $4A29: $07
    sub  a                                        ; $4A2A: $97
    rlca                                          ; $4A2B: $07
    sbc  l                                        ; $4A2C: $9D
    rlca                                          ; $4A2D: $07
    and  d                                        ; $4A2E: $A2
    rlca                                          ; $4A2F: $07
    and  a                                        ; $4A30: $A7
    rlca                                          ; $4A31: $07
    xor  h                                        ; $4A32: $AC
    rlca                                          ; $4A33: $07
    or   c                                        ; $4A34: $B1
    rlca                                          ; $4A35: $07
    or   [hl]                                     ; $4A36: $B6
    rlca                                          ; $4A37: $07
    cp   d                                        ; $4A38: $BA
    rlca                                          ; $4A39: $07
    cp   [hl]                                     ; $4A3A: $BE
    rlca                                          ; $4A3B: $07
    pop  bc                                       ; $4A3C: $C1
    rlca                                          ; $4A3D: $07
    push bc                                       ; $4A3E: $C5
    rlca                                          ; $4A3F: $07
    ret  z                                        ; $4A40: $C8

    rlca                                          ; $4A41: $07
    rlc  a                                        ; $4A42: $CB $07
    adc  $07                                      ; $4A44: $CE $07
    pop  de                                       ; $4A46: $D1
    rlca                                          ; $4A47: $07
    call nc, $D607                                ; $4A48: $D4 $07 $D6
    rlca                                          ; $4A4B: $07
    reti                                          ; $4A4C: $D9

    rlca                                          ; $4A4D: $07
    db   $DB                                      ; $4A4E: $DB
    rlca                                          ; $4A4F: $07
    db   $DD                                      ; $4A50: $DD
    rlca                                          ; $4A51: $07
    rst  $18                                      ; $4A52: $DF
    rlca                                          ; $4A53: $07
    nop                                           ; $4A54: $00
    nop                                           ; $4A55: $00
    nop                                           ; $4A56: $00
    nop                                           ; $4A57: $00
    nop                                           ; $4A58: $00
    ret  nz                                       ; $4A59: $C0

    add  hl, bc                                   ; $4A5A: $09
    nop                                           ; $4A5B: $00
    jr   c, jr_01B_4A92                           ; $4A5C: $38 $34

    ret  nz                                       ; $4A5E: $C0

    add  hl, de                                   ; $4A5F: $19
    nop                                           ; $4A60: $00
    jr   c, jr_01B_4A96                           ; $4A61: $38 $33

    ret  nz                                       ; $4A63: $C0

    ld   b, [hl]                                  ; $4A64: $46
    nop                                           ; $4A65: $00
    inc  de                                       ; $4A66: $13
    db   $10                                      ; $4A67: $10
    ret  nz                                       ; $4A68: $C0

    inc  hl                                       ; $4A69: $23
    nop                                           ; $4A6A: $00
    jr   nz, @+$42                                ; $4A6B: $20 $40

    add  b                                        ; $4A6D: $80
    ld   d, c                                     ; $4A6E: $51
    nop                                           ; $4A6F: $00
    jr   nz, jr_01B_4A79                          ; $4A70: $20 $07

    add  b                                        ; $4A72: $80
    and  c                                        ; $4A73: $A1
    nop                                           ; $4A74: $00
    nop                                           ; $4A75: $00
    jr   @-$7E                                    ; $4A76: $18 $80

    ld   a, [c]                                   ; $4A78: $F2

jr_01B_4A79:
    nop                                           ; $4A79: $00
    nop                                           ; $4A7A: $00
    jr   jr_01B_49FD                              ; $4A7B: $18 $80

    add  c                                        ; $4A7D: $81
    nop                                           ; $4A7E: $00
    ld   a, [hl-]                                 ; $4A7F: $3A
    db   $10                                      ; $4A80: $10
    ret  nz                                       ; $4A81: $C0

    add  b                                        ; $4A82: $80
    nop                                           ; $4A83: $00
    nop                                           ; $4A84: $00
    db   $10                                      ; $4A85: $10
    ret  nz                                       ; $4A86: $C0

    ld   d, a                                     ; $4A87: $57
    nop                                           ; $4A88: $00
    nop                                           ; $4A89: $00
    ld   h, b                                     ; $4A8A: $60
    add  b                                        ; $4A8B: $80
    ld   bc, $0402                                ; $4A8C: $01 $02 $04
    ld   [$2010], sp                              ; $4A8F: $08 $10 $20

jr_01B_4A92:
    ld   b, $0C                                   ; $4A92: $06 $0C
    jr   @+$03                                    ; $4A94: $18 $01

jr_01B_4A96:
    ld   bc, $0101                                ; $4A96: $01 $01 $01
    ld   bc, $0130                                ; $4A99: $01 $30 $01
    inc  bc                                       ; $4A9C: $03
    ld   b, $0C                                   ; $4A9D: $06 $0C
    jr   jr_01B_4AD1                              ; $4A9F: $18 $30

    add  hl, bc                                   ; $4AA1: $09
    ld   [de], a                                  ; $4AA2: $12
    inc  h                                        ; $4AA3: $24
    ld   [bc], a                                  ; $4AA4: $02
    inc  b                                        ; $4AA5: $04
    ld   [$0101], sp                              ; $4AA6: $08 $01 $01
    ld   c, b                                     ; $4AA9: $48
    ld   [bc], a                                  ; $4AAA: $02
    inc  b                                        ; $4AAB: $04
    ld   [$2010], sp                              ; $4AAC: $08 $10 $20
    ld   b, b                                     ; $4AAF: $40
    inc  c                                        ; $4AB0: $0C
    jr   jr_01B_4AE3                              ; $4AB1: $18 $30

    ld   [bc], a                                  ; $4AB3: $02
    dec  b                                        ; $4AB4: $05
    inc  bc                                       ; $4AB5: $03
    ld   bc, $6001                                ; $4AB6: $01 $01 $60
    inc  bc                                       ; $4AB9: $03
    dec  b                                        ; $4ABA: $05
    ld   a, [bc]                                  ; $4ABB: $0A
    inc  d                                        ; $4ABC: $14
    jr   z, @+$52                                 ; $4ABD: $28 $50

    rrca                                          ; $4ABF: $0F
    ld   e, $3C                                   ; $4AC0: $1E $3C
    ld   [bc], a                                  ; $4AC2: $02
    ld   [$0210], sp                              ; $4AC3: $08 $10 $02
    ld   bc, $0378                                ; $4AC6: $01 $78 $03
    ld   b, $0C                                   ; $4AC9: $06 $0C
    jr   @+$32                                    ; $4ACB: $18 $30

    ld   h, b                                     ; $4ACD: $60
    ld   [de], a                                  ; $4ACE: $12
    inc  h                                        ; $4ACF: $24
    ld   c, b                                     ; $4AD0: $48

jr_01B_4AD1:
    inc  bc                                       ; $4AD1: $03
    ld   [$0210], sp                              ; $4AD2: $08 $10 $02
    inc  b                                        ; $4AD5: $04
    sub  b                                        ; $4AD6: $90
    inc  bc                                       ; $4AD7: $03
    rlca                                          ; $4AD8: $07
    ld   c, $1C                                   ; $4AD9: $0E $1C
    jr   c, jr_01B_4B4D                           ; $4ADB: $38 $70

    dec  d                                        ; $4ADD: $15
    ld   a, [hl+]                                 ; $4ADE: $2A
    ld   d, h                                     ; $4ADF: $54
    inc  b                                        ; $4AE0: $04
    add  hl, bc                                   ; $4AE1: $09
    ld   [de], a                                  ; $4AE2: $12

jr_01B_4AE3:
    ld   [bc], a                                  ; $4AE3: $02
    ld   bc, $04A8                                ; $4AE4: $01 $A8 $04
    ld   [$2010], sp                              ; $4AE7: $08 $10 $20
    ld   b, b                                     ; $4AEA: $40
    add  b                                        ; $4AEB: $80
    jr   jr_01B_4B1E                              ; $4AEC: $18 $30

    ld   h, b                                     ; $4AEE: $60
    inc  b                                        ; $4AEF: $04
    ld   [bc], a                                  ; $4AF0: $02
    ld   bc, $0001                                ; $4AF1: $01 $01 $00
    ret  nz                                       ; $4AF4: $C0

    inc  b                                        ; $4AF5: $04
    add  hl, bc                                   ; $4AF6: $09
    ld   [de], a                                  ; $4AF7: $12
    inc  h                                        ; $4AF8: $24
    ld   c, b                                     ; $4AF9: $48
    sub  b                                        ; $4AFA: $90
    dec  de                                       ; $4AFB: $1B
    ld   [hl], $6C                                ; $4AFC: $36 $6C
    dec  b                                        ; $4AFE: $05
    inc  c                                        ; $4AFF: $0C
    jr   jr_01B_4B1A                              ; $4B00: $18 $18

    ld   b, $D8                                   ; $4B02: $06 $D8
    dec  b                                        ; $4B04: $05
    ld   a, [bc]                                  ; $4B05: $0A
    inc  d                                        ; $4B06: $14
    jr   z, jr_01B_4B59                           ; $4B07: $28 $50

    and  b                                        ; $4B09: $A0
    ld   e, $3C                                   ; $4B0A: $1E $3C
    ld   a, b                                     ; $4B0C: $78

jr_01B_4B0D:
    dec  b                                        ; $4B0D: $05
    ld   bc, $0101                                ; $4B0E: $01 $01 $01
    ld   bc, $10F0                                ; $4B11: $01 $F0 $10
    ld   [hl-], a                                 ; $4B14: $32
    ld   [hl+], a                                 ; $4B15: $22
    ld   b, a                                     ; $4B16: $47
    add  c                                        ; $4B17: $81
    jr   nz, jr_01B_4B1A                          ; $4B18: $20 $00

jr_01B_4B1A:
    jr   nz, jr_01B_4B67                          ; $4B1A: $20 $4B

    rst  $38                                      ; $4B1C: $FF
    rst  $38                                      ; $4B1D: $FF

jr_01B_4B1E:
    ld   a, [de]                                  ; $4B1E: $1A
    ld   c, e                                     ; $4B1F: $4B
    sbc  e                                        ; $4B20: $9B
    jr   nz, jr_01B_4AD1                          ; $4B21: $20 $AE

    ld   bc, $009C                                ; $4B23: $01 $9C $00
    nop                                           ; $4B26: $00
    ld   [hl+], a                                 ; $4B27: $22
    ld   b, h                                     ; $4B28: $44
    ld   d, l                                     ; $4B29: $55
    ld   h, [hl]                                  ; $4B2A: $66
    ld   h, [hl]                                  ; $4B2B: $66
    adc  b                                        ; $4B2C: $88
    adc  b                                        ; $4B2D: $88
    xor  d                                        ; $4B2E: $AA
    xor  d                                        ; $4B2F: $AA
    call z, vBlankContinue                        ; $4B30: $CC $CC $04
    add  h                                        ; $4B33: $84
    inc  b                                        ; $4B34: $04
    add  h                                        ; $4B35: $84
    nop                                           ; $4B36: $00
    cp   c                                        ; $4B37: $B9
    ld   c, d                                     ; $4B38: $4A
    ld   b, c                                     ; $4B39: $41
    ld   c, e                                     ; $4B3A: $4B
    ld   b, l                                     ; $4B3B: $45
    ld   c, e                                     ; $4B3C: $4B
    ld   c, c                                     ; $4B3D: $49
    ld   c, e                                     ; $4B3E: $4B
    ld   c, l                                     ; $4B3F: $4D
    ld   c, e                                     ; $4B40: $4B
    ld   d, c                                     ; $4B41: $51
    ld   c, e                                     ; $4B42: $4B
    nop                                           ; $4B43: $00
    nop                                           ; $4B44: $00
    ld   h, c                                     ; $4B45: $61
    ld   c, e                                     ; $4B46: $4B
    nop                                           ; $4B47: $00
    nop                                           ; $4B48: $00
    ld   l, a                                     ; $4B49: $6F
    ld   c, e                                     ; $4B4A: $4B
    nop                                           ; $4B4B: $00
    nop                                           ; $4B4C: $00

jr_01B_4B4D:
    add  c                                        ; $4B4D: $81
    ld   c, e                                     ; $4B4E: $4B
    nop                                           ; $4B4F: $00
    nop                                           ; $4B50: $00
    sbc  l                                        ; $4B51: $9D
    ld   h, b                                     ; $4B52: $60
    ld   hl, $9600                                ; $4B53: $21 $00 $96
    and  d                                        ; $4B56: $A2
    ld   e, h                                     ; $4B57: $5C
    ld   e, [hl]                                  ; $4B58: $5E

jr_01B_4B59:
    xor  d                                        ; $4B59: $AA
    ld   h, b                                     ; $4B5A: $60
    ld   h, d                                     ; $4B5B: $62
    ld   h, h                                     ; $4B5C: $64
    xor  [hl]                                     ; $4B5D: $AE
    ld   h, [hl]                                  ; $4B5E: $66
    sub  l                                        ; $4B5F: $95
    nop                                           ; $4B60: $00
    sbc  l                                        ; $4B61: $9D
    add  b                                        ; $4B62: $80
    ld   hl, $A241                                ; $4B63: $21 $41 $A2
    ld   c, d                                     ; $4B66: $4A

jr_01B_4B67:
    ld   c, h                                     ; $4B67: $4C
    xor  d                                        ; $4B68: $AA
    ld   c, [hl]                                  ; $4B69: $4E
    ld   d, b                                     ; $4B6A: $50
    ld   d, d                                     ; $4B6B: $52
    xor  [hl]                                     ; $4B6C: $AE
    ld   d, h                                     ; $4B6D: $54
    nop                                           ; $4B6E: $00
    sbc  l                                        ; $4B6F: $9D
    pop  bc                                       ; $4B70: $C1
    ld   l, [hl]                                  ; $4B71: $6E
    jr   nz, jr_01B_4B0D                          ; $4B72: $20 $99

    and  d                                        ; $4B74: $A2
    inc  a                                        ; $4B75: $3C
    ld   a, $AA                                   ; $4B76: $3E $AA
    ld   b, b                                     ; $4B78: $40
    ld   b, d                                     ; $4B79: $42
    ld   b, h                                     ; $4B7A: $44
    sbc  d                                        ; $4B7B: $9A
    and  l                                        ; $4B7C: $A5
    ld   b, [hl]                                  ; $4B7D: $46
    and  h                                        ; $4B7E: $A4
    ld   bc, $A300                                ; $4B7F: $01 $00 $A3
    ld   bc, $15AA                                ; $4B82: $01 $AA $15
    ld   a, [de]                                  ; $4B85: $1A
    ld   a, [de]                                  ; $4B86: $1A
    sbc  e                                        ; $4B87: $9B
    ld   e, $A0                                   ; $4B88: $1E $A0
    dec  d                                        ; $4B8A: $15
    sbc  h                                        ; $4B8B: $9C
    and  a                                        ; $4B8C: $A7
    ld   bc, $0400                                ; $4B8D: $01 $00 $04
    push af                                       ; $4B90: $F5
    ld   c, d                                     ; $4B91: $4A
    sbc  d                                        ; $4B92: $9A
    ld   c, e                                     ; $4B93: $4B
    or   d                                        ; $4B94: $B2
    ld   c, e                                     ; $4B95: $4B
    cp   d                                        ; $4B96: $BA
    ld   c, e                                     ; $4B97: $4B
    nop                                           ; $4B98: $00
    nop                                           ; $4B99: $00
    ret  nc                                       ; $4B9A: $D0

    ld   c, e                                     ; $4B9B: $4B
    ld   a, [bc]                                  ; $4B9C: $0A
    ld   c, h                                     ; $4B9D: $4C
    ld   a, [bc]                                  ; $4B9E: $0A
    ld   c, h                                     ; $4B9F: $4C
    ld   a, [bc]                                  ; $4BA0: $0A
    ld   c, h                                     ; $4BA1: $4C
    ld   a, [bc]                                  ; $4BA2: $0A
    ld   c, h                                     ; $4BA3: $4C
    ld   a, [bc]                                  ; $4BA4: $0A
    ld   c, h                                     ; $4BA5: $4C
    ld   a, [bc]                                  ; $4BA6: $0A
    ld   c, h                                     ; $4BA7: $4C
    ld   a, [bc]                                  ; $4BA8: $0A
    ld   c, h                                     ; $4BA9: $4C
    ld   a, [bc]                                  ; $4BAA: $0A
    ld   c, h                                     ; $4BAB: $4C
    ld   [hl], h                                  ; $4BAC: $74
    ld   c, h                                     ; $4BAD: $4C
    rst  $38                                      ; $4BAE: $FF
    rst  $38                                      ; $4BAF: $FF
    sbc  d                                        ; $4BB0: $9A
    ld   c, e                                     ; $4BB1: $4B
    push de                                       ; $4BB2: $D5
    ld   c, e                                     ; $4BB3: $4B
    ccf                                           ; $4BB4: $3F

jr_01B_4BB5:
    ld   c, h                                     ; $4BB5: $4C
    rst  $38                                      ; $4BB6: $FF
    rst  $38                                      ; $4BB7: $FF
    or   d                                        ; $4BB8: $B2
    ld   c, e                                     ; $4BB9: $4B
    dec  b                                        ; $4BBA: $05
    ld   c, h                                     ; $4BBB: $4C
    dec  b                                        ; $4BBC: $05
    ld   c, h                                     ; $4BBD: $4C
    dec  b                                        ; $4BBE: $05
    ld   c, h                                     ; $4BBF: $4C
    dec  b                                        ; $4BC0: $05
    ld   c, h                                     ; $4BC1: $4C
    dec  b                                        ; $4BC2: $05
    ld   c, h                                     ; $4BC3: $4C
    dec  b                                        ; $4BC4: $05
    ld   c, h                                     ; $4BC5: $4C
    dec  b                                        ; $4BC6: $05
    ld   c, h                                     ; $4BC7: $4C
    dec  b                                        ; $4BC8: $05
    ld   c, h                                     ; $4BC9: $4C
    ld   [hl], h                                  ; $4BCA: $74
    ld   c, h                                     ; $4BCB: $4C
    rst  $38                                      ; $4BCC: $FF
    rst  $38                                      ; $4BCD: $FF
    cp   d                                        ; $4BCE: $BA
    ld   c, e                                     ; $4BCF: $4B
    sbc  l                                        ; $4BD0: $9D
    ld   sp, $4000                                ; $4BD1: $31 $00 $40
    nop                                           ; $4BD4: $00
    sbc  l                                        ; $4BD5: $9D
    jr   nc, jr_01B_4B59                          ; $4BD6: $30 $81

    add  b                                        ; $4BD8: $80
    sbc  e                                        ; $4BD9: $9B
    ld   [$01A3], sp                              ; $4BDA: $08 $A3 $01
    and  d                                        ; $4BDD: $A2
    ld   b, h                                     ; $4BDE: $44
    ld   b, [hl]                                  ; $4BDF: $46
    and  e                                        ; $4BE0: $A3
    ld   c, d                                     ; $4BE1: $4A
    and  d                                        ; $4BE2: $A2
    ld   d, h                                     ; $4BE3: $54
    ld   e, h                                     ; $4BE4: $5C
    and  a                                        ; $4BE5: $A7
    ld   e, h                                     ; $4BE6: $5C
    and  c                                        ; $4BE7: $A1
    ld   e, b                                     ; $4BE8: $58
    ld   d, [hl]                                  ; $4BE9: $56
    and  h                                        ; $4BEA: $A4
    ld   e, b                                     ; $4BEB: $58
    and  d                                        ; $4BEC: $A2
    ld   bc, $5C58                                ; $4BED: $01 $58 $5C
    ld   e, [hl]                                  ; $4BF0: $5E
    and  e                                        ; $4BF1: $A3
    ld   e, h                                     ; $4BF2: $5C
    ld   e, b                                     ; $4BF3: $58
    and  l                                        ; $4BF4: $A5
    ld   c, d                                     ; $4BF5: $4A
    and  h                                        ; $4BF6: $A4
    ld   a, d                                     ; $4BF7: $7A
    and  a                                        ; $4BF8: $A7
    ld   l, h                                     ; $4BF9: $6C
    and  c                                        ; $4BFA: $A1
    ld   l, d                                     ; $4BFB: $6A
    ld   l, h                                     ; $4BFC: $6C
    and  h                                        ; $4BFD: $A4
    ld   [hl], b                                  ; $4BFE: $70
    ld   h, d                                     ; $4BFF: $62
    ld   h, [hl]                                  ; $4C00: $66
    xor  [hl]                                     ; $4C01: $AE
    ld   [hl], h                                  ; $4C02: $74
    sbc  h                                        ; $4C03: $9C
    nop                                           ; $4C04: $00
    sbc  l                                        ; $4C05: $9D
    pop  de                                       ; $4C06: $D1
    ld   l, [hl]                                  ; $4C07: $6E
    ld   b, b                                     ; $4C08: $40
    sbc  c                                        ; $4C09: $99
    sbc  e                                        ; $4C0A: $9B
    ld   [bc], a                                  ; $4C0B: $02
    and  d                                        ; $4C0C: $A2
    inc  h                                        ; $4C0D: $24
    inc  l                                        ; $4C0E: $2C

jr_01B_4C0F:
    ld   [hl-], a                                 ; $4C0F: $32
    inc  l                                        ; $4C10: $2C
    sbc  h                                        ; $4C11: $9C
    sbc  e                                        ; $4C12: $9B
    ld   [bc], a                                  ; $4C13: $02
    inc  h                                        ; $4C14: $24
    jr   nc, jr_01B_4C4D                          ; $4C15: $30 $36

    jr   nc, jr_01B_4BB5                          ; $4C17: $30 $9C

    inc  h                                        ; $4C19: $24
    ld   l, $36                                   ; $4C1A: $2E $36
    ld   l, $22                                   ; $4C1C: $2E $22
    ld   l, $34                                   ; $4C1E: $2E $34
    ld   l, $2C                                   ; $4C20: $2E $2C
    ld   [hl-], a                                 ; $4C22: $32
    ld   b, b                                     ; $4C23: $40
    ld   a, [hl-]                                 ; $4C24: $3A
    inc  a                                        ; $4C25: $3C
    ld   [hl], $32                                ; $4C26: $36 $32
    inc  l                                        ; $4C28: $2C
    sbc  e                                        ; $4C29: $9B
    ld   [bc], a                                  ; $4C2A: $02
    jr   z, jr_01B_4C5B                           ; $4C2B: $28 $2E

    ld   [hl], $2E                                ; $4C2D: $36 $2E
    sbc  h                                        ; $4C2F: $9C
    sbc  e                                        ; $4C30: $9B
    ld   [bc], a                                  ; $4C31: $02
    jr   z, jr_01B_4C62                           ; $4C32: $28 $2E

    inc  [hl]                                     ; $4C34: $34
    ld   l, $9C                                   ; $4C35: $2E $9C
    sbc  e                                        ; $4C37: $9B
    inc  b                                        ; $4C38: $04
    inc  h                                        ; $4C39: $24
    inc  l                                        ; $4C3A: $2C
    ld   [hl-], a                                 ; $4C3B: $32
    inc  l                                        ; $4C3C: $2C
    sbc  h                                        ; $4C3D: $9C
    nop                                           ; $4C3E: $00
    sbc  l                                        ; $4C3F: $9D
    ld   h, c                                     ; $4C40: $61
    nop                                           ; $4C41: $00
    add  b                                        ; $4C42: $80
    and  h                                        ; $4C43: $A4
    ld   bc, $AC97                                ; $4C44: $01 $97 $AC
    ld   bc, $2CAD                                ; $4C47: $01 $AD $2C
    inc  l                                        ; $4C4A: $2C
    xor  h                                        ; $4C4B: $AC
    inc  l                                        ; $4C4C: $2C

jr_01B_4C4D:
    xor  d                                        ; $4C4D: $AA
    inc  l                                        ; $4C4E: $2C
    sbc  b                                        ; $4C4F: $98
    xor  h                                        ; $4C50: $AC
    ld   [hl-], a                                 ; $4C51: $32
    xor  l                                        ; $4C52: $AD
    ld   [hl-], a                                 ; $4C53: $32
    ld   [hl], $AC                                ; $4C54: $36 $AC
    ld   a, [hl-]                                 ; $4C56: $3A
    xor  d                                        ; $4C57: $AA
    ld   [hl], $A3                                ; $4C58: $36 $A3
    ld   [hl-], a                                 ; $4C5A: $32

jr_01B_4C5B:
    ld   b, b                                     ; $4C5B: $40
    ld   a, [hl-]                                 ; $4C5C: $3A
    ld   c, d                                     ; $4C5D: $4A
    and  h                                        ; $4C5E: $A4
    ld   b, b                                     ; $4C5F: $40
    xor  h                                        ; $4C60: $AC
    ld   b, b                                     ; $4C61: $40

jr_01B_4C62:
    xor  l                                        ; $4C62: $AD
    ld   b, b                                     ; $4C63: $40
    ld   b, d                                     ; $4C64: $42
    xor  h                                        ; $4C65: $AC
    ld   b, b                                     ; $4C66: $40
    xor  d                                        ; $4C67: $AA
    ld   a, $A4                                   ; $4C68: $3E $A4
    jr   c, jr_01B_4C0F                           ; $4C6A: $38 $A3

    ld   [hl], $A7                                ; $4C6C: $36 $A7
    ld   b, b                                     ; $4C6E: $40
    and  h                                        ; $4C6F: $A4
    ld   b, b                                     ; $4C70: $40
    and  a                                        ; $4C71: $A7
    ld   bc, $9B00                                ; $4C72: $01 $00 $9B
    dec  bc                                       ; $4C75: $0B
    and  h                                        ; $4C76: $A4
    ld   bc, $009C                                ; $4C77: $01 $9C $00
    nop                                           ; $4C7A: $00
    and  $4A                                      ; $4C7B: $E6 $4A
    add  l                                        ; $4C7D: $85
    ld   c, h                                     ; $4C7E: $4C
    adc  l                                        ; $4C7F: $8D
    ld   c, h                                     ; $4C80: $4C
    sub  l                                        ; $4C81: $95
    ld   c, h                                     ; $4C82: $4C
    sbc  l                                        ; $4C83: $9D
    ld   c, h                                     ; $4C84: $4C
    and  l                                        ; $4C85: $A5
    ld   c, h                                     ; $4C86: $4C

jr_01B_4C87:
    sbc  $4C                                      ; $4C87: $DE $4C
    rst  $38                                      ; $4C89: $FF
    rst  $38                                      ; $4C8A: $FF
    add  a                                        ; $4C8B: $87
    ld   c, h                                     ; $4C8C: $4C
    or   d                                        ; $4C8D: $B2
    ld   c, h                                     ; $4C8E: $4C
    rst  $28                                      ; $4C8F: $EF
    ld   c, h                                     ; $4C90: $4C
    rst  $38                                      ; $4C91: $FF
    rst  $38                                      ; $4C92: $FF
    adc  a                                        ; $4C93: $8F
    ld   c, h                                     ; $4C94: $4C
    cp   a                                        ; $4C95: $BF
    ld   c, h                                     ; $4C96: $4C
    ccf                                           ; $4C97: $3F
    ld   c, l                                     ; $4C98: $4D
    rst  $38                                      ; $4C99: $FF
    rst  $38                                      ; $4C9A: $FF
    sub  a                                        ; $4C9B: $97
    ld   c, h                                     ; $4C9C: $4C
    call z, $884C                                 ; $4C9D: $CC $4C $88
    ld   c, l                                     ; $4CA0: $4D
    rst  $38                                      ; $4CA1: $FF
    rst  $38                                      ; $4CA2: $FF
    sbc  a                                        ; $4CA3: $9F
    ld   c, h                                     ; $4CA4: $4C
    sbc  l                                        ; $4CA5: $9D
    ld   h, b                                     ; $4CA6: $60
    nop                                           ; $4CA7: $00
    ld   b, c                                     ; $4CA8: $41
    and  a                                        ; $4CA9: $A7
    ld   bc, $4EA1                                ; $4CAA: $01 $A1 $4E
    xor  d                                        ; $4CAD: $AA
    ld   bc, $50AE                                ; $4CAE: $01 $AE $50
    nop                                           ; $4CB1: $00
    sbc  l                                        ; $4CB2: $9D
    ld   b, b                                     ; $4CB3: $40
    nop                                           ; $4CB4: $00
    ld   bc, $01A7                                ; $4CB5: $01 $A7 $01
    and  c                                        ; $4CB8: $A1
    ld   h, h                                     ; $4CB9: $64
    xor  d                                        ; $4CBA: $AA
    ld   bc, $66AE                                ; $4CBB: $01 $AE $66
    nop                                           ; $4CBE: $00
    sbc  l                                        ; $4CBF: $9D
    cpl                                           ; $4CC0: $2F
    ld   c, l                                     ; $4CC1: $4D
    jr   nz, @-$57                                ; $4CC2: $20 $A7

    ld   bc, $5AA1                                ; $4CC4: $01 $A1 $5A
    xor  d                                        ; $4CC7: $AA
    ld   bc, $5CAE                                ; $4CC8: $01 $AE $5C
    nop                                           ; $4CCB: $00
    and  a                                        ; $4CCC: $A7
    ld   bc, $01A1                                ; $4CCD: $01 $A1 $01
    xor  d                                        ; $4CD0: $AA
    ld   bc, $01A5                                ; $4CD1: $01 $A5 $01
    and  c                                        ; $4CD4: $A1
    rst  $38                                      ; $4CD5: $FF
    and  d                                        ; $4CD6: $A2
    rst  $38                                      ; $4CD7: $FF
    rst  $38                                      ; $4CD8: $FF
    and  c                                        ; $4CD9: $A1
    rst  $38                                      ; $4CDA: $FF

jr_01B_4CDB:
    and  d                                        ; $4CDB: $A2
    rst  $38                                      ; $4CDC: $FF
    nop                                           ; $4CDD: $00
    sbc  l                                        ; $4CDE: $9D
    ld   [hl+], a                                 ; $4CDF: $22
    nop                                           ; $4CE0: $00
    add  b                                        ; $4CE1: $80
    sub  a                                        ; $4CE2: $97
    sbc  e                                        ; $4CE3: $9B
    jr   nz, jr_01B_4C87                          ; $4CE4: $20 $A1

    ld   d, h                                     ; $4CE6: $54
    ld   l, d                                     ; $4CE7: $6A
    ld   h, d                                     ; $4CE8: $62
    ld   e, h                                     ; $4CE9: $5C
    ld   a, b                                     ; $4CEA: $78
    ld   [hl], b                                  ; $4CEB: $70
    ld   l, d                                     ; $4CEC: $6A
    sbc  h                                        ; $4CED: $9C
    nop                                           ; $4CEE: $00
    sbc  l                                        ; $4CEF: $9D
    add  c                                        ; $4CF0: $81
    nop                                           ; $4CF1: $00
    ld   b, b                                     ; $4CF2: $40
    and  [hl]                                     ; $4CF3: $A6
    ld   b, [hl]                                  ; $4CF4: $46
    and  b                                        ; $4CF5: $A0
    ld   b, [hl]                                  ; $4CF6: $46
    ld   c, d                                     ; $4CF7: $4A
    and  [hl]                                     ; $4CF8: $A6
    ld   c, [hl]                                  ; $4CF9: $4E
    and  c                                        ; $4CFA: $A1
    ld   c, d                                     ; $4CFB: $4A
    and  e                                        ; $4CFC: $A3
    ld   b, [hl]                                  ; $4CFD: $46
    ld   d, h                                     ; $4CFE: $54
    ld   c, [hl]                                  ; $4CFF: $4E
    ld   e, [hl]                                  ; $4D00: $5E
    and  h                                        ; $4D01: $A4
    ld   d, h                                     ; $4D02: $54
    and  [hl]                                     ; $4D03: $A6
    ld   d, h                                     ; $4D04: $54
    and  b                                        ; $4D05: $A0
    ld   d, h                                     ; $4D06: $54
    ld   d, [hl]                                  ; $4D07: $56
    and  [hl]                                     ; $4D08: $A6
    ld   d, h                                     ; $4D09: $54
    and  c                                        ; $4D0A: $A1
    ld   d, d                                     ; $4D0B: $52
    and  h                                        ; $4D0C: $A4
    ld   c, h                                     ; $4D0D: $4C
    and  e                                        ; $4D0E: $A3
    ld   c, d                                     ; $4D0F: $4A
    ld   d, h                                     ; $4D10: $54
    and  h                                        ; $4D11: $A4
    ld   b, [hl]                                  ; $4D12: $46
    and  l                                        ; $4D13: $A5
    ld   bc, $0101                                ; $4D14: $01 $01 $01
    sbc  l                                        ; $4D17: $9D
    ld   h, c                                     ; $4D18: $61
    nop                                           ; $4D19: $00
    add  b                                        ; $4D1A: $80
    sub  a                                        ; $4D1B: $97
    and  c                                        ; $4D1C: $A1
    ld   [hl], $A6                                ; $4D1D: $36 $A6
    ld   [hl], $A1                                ; $4D1F: $36 $A1
    ld   [hl], $A6                                ; $4D21: $36 $A6
    ld   [hl], $A1                                ; $4D23: $36 $A1
    ld   [hl], $A2                                ; $4D25: $36 $A2
    ld   [hl], $36                                ; $4D27: $36 $36
    and  c                                        ; $4D29: $A1
    ld   [hl], $A2                                ; $4D2A: $36 $A2
    ld   [hl], $98                                ; $4D2C: $36 $98
    nop                                           ; $4D2E: $00
    adc  d                                        ; $4D2F: $8A
    rst  $18                                      ; $4D30: $DF
    jp   c, $3186                                 ; $4D31: $DA $86 $31

    ld   bc, $8636                                ; $4D34: $01 $36 $86
    adc  d                                        ; $4D37: $8A
    rst  $18                                      ; $4D38: $DF
    jp   c, $3186                                 ; $4D39: $DA $86 $31

    ld   bc, $8636                                ; $4D3C: $01 $36 $86
    sbc  l                                        ; $4D3F: $9D
    cpl                                           ; $4D40: $2F
    ld   c, l                                     ; $4D41: $4D
    jr   nz, jr_01B_4CDB                          ; $4D42: $20 $97

    sbc  e                                        ; $4D44: $9B
    ld   [bc], a                                  ; $4D45: $02
    xor  d                                        ; $4D46: $AA
    jr   nc, jr_01B_4D4A                          ; $4D47: $30 $01

    and  b                                        ; $4D49: $A0

jr_01B_4D4A:
    ld   bc, $01A1                                ; $4D4A: $01 $A1 $01
    sbc  h                                        ; $4D4D: $9C
    and  [hl]                                     ; $4D4E: $A6
    ld   bc, $30AA                                ; $4D4F: $01 $AA $30
    ld   bc, $01A0                                ; $4D52: $01 $A0 $01
    and  c                                        ; $4D55: $A1
    ld   bc, $029B                                ; $4D56: $01 $9B $02
    xor  d                                        ; $4D59: $AA
    jr   nc, jr_01B_4D5D                          ; $4D5A: $30 $01

    and  b                                        ; $4D5C: $A0

jr_01B_4D5D:
    ld   bc, $A19C                                ; $4D5D: $01 $9C $A1
    ld   bc, $01A3                                ; $4D60: $01 $A3 $01
    sbc  e                                        ; $4D63: $9B
    ld   [bc], a                                  ; $4D64: $02
    xor  d                                        ; $4D65: $AA
    jr   nc, jr_01B_4D69                          ; $4D66: $30 $01

    and  b                                        ; $4D68: $A0

jr_01B_4D69:
    ld   bc, $01A1                                ; $4D69: $01 $A1 $01
    sbc  h                                        ; $4D6C: $9C
    and  [hl]                                     ; $4D6D: $A6
    ld   bc, $30AA                                ; $4D6E: $01 $AA $30
    ld   bc, $01A0                                ; $4D71: $01 $A0 $01
    and  c                                        ; $4D74: $A1
    ld   bc, $029B                                ; $4D75: $01 $9B $02
    xor  d                                        ; $4D78: $AA
    jr   nc, jr_01B_4D7C                          ; $4D79: $30 $01

    and  b                                        ; $4D7B: $A0

jr_01B_4D7C:
    ld   bc, $A19C                                ; $4D7C: $01 $9C $A1
    ld   bc, $01A6                                ; $4D7F: $01 $A6 $01
    xor  d                                        ; $4D82: $AA
    jr   nc, jr_01B_4D86                          ; $4D83: $30 $01

    and  b                                        ; $4D85: $A0

jr_01B_4D86:
    ld   bc, $9B00                                ; $4D86: $01 $00 $9B
    rlca                                          ; $4D89: $07
    and  c                                        ; $4D8A: $A1
    dec  d                                        ; $4D8B: $15
    dec  d                                        ; $4D8C: $15
    dec  d                                        ; $4D8D: $15
    dec  d                                        ; $4D8E: $15
    rst  $38                                      ; $4D8F: $FF
    dec  d                                        ; $4D90: $15
    dec  d                                        ; $4D91: $15
    dec  d                                        ; $4D92: $15
    dec  d                                        ; $4D93: $15
    dec  d                                        ; $4D94: $15
    dec  d                                        ; $4D95: $15
    dec  d                                        ; $4D96: $15
    rst  $38                                      ; $4D97: $FF
    dec  d                                        ; $4D98: $15
    dec  d                                        ; $4D99: $15
    ld   a, [de]                                  ; $4D9A: $1A
    sbc  h                                        ; $4D9B: $9C
    sbc  e                                        ; $4D9C: $9B
    ld   [bc], a                                  ; $4D9D: $02
    rst  $38                                      ; $4D9E: $FF
    rst  $38                                      ; $4D9F: $FF
    dec  d                                        ; $4DA0: $15
    dec  d                                        ; $4DA1: $15
    sbc  h                                        ; $4DA2: $9C
    rst  $38                                      ; $4DA3: $FF
    rst  $38                                      ; $4DA4: $FF
    dec  d                                        ; $4DA5: $15
    rst  $38                                      ; $4DA6: $FF
    dec  d                                        ; $4DA7: $15
    rst  $38                                      ; $4DA8: $FF
    rst  $38                                      ; $4DA9: $FF
    dec  d                                        ; $4DAA: $15
    nop                                           ; $4DAB: $00
    nop                                           ; $4DAC: $00
    cp   c                                        ; $4DAD: $B9
    ld   c, d                                     ; $4DAE: $4A
    or   a                                        ; $4DAF: $B7
    ld   c, l                                     ; $4DB0: $4D
    cp   l                                        ; $4DB1: $BD
    ld   c, l                                     ; $4DB2: $4D

jr_01B_4DB3:
    jp   $004D                                    ; $4DB3: $C3 $4D $00

    nop                                           ; $4DB6: $00
    ret                                           ; $4DB7: $C9

    ld   c, l                                     ; $4DB8: $4D
    rst  $38                                      ; $4DB9: $FF
    rst  $38                                      ; $4DBA: $FF
    or   a                                        ; $4DBB: $B7
    ld   c, l                                     ; $4DBC: $4D
    rst  $18                                      ; $4DBD: $DF
    ld   c, l                                     ; $4DBE: $4D
    rst  $38                                      ; $4DBF: $FF
    rst  $38                                      ; $4DC0: $FF
    cp   l                                        ; $4DC1: $BD
    ld   c, l                                     ; $4DC2: $4D
    dec  d                                        ; $4DC3: $15
    ld   c, [hl]                                  ; $4DC4: $4E
    rst  $38                                      ; $4DC5: $FF
    rst  $38                                      ; $4DC6: $FF
    jp   $9D4D                                    ; $4DC7: $C3 $4D $9D

    ld   b, e                                     ; $4DCA: $43
    nop                                           ; $4DCB: $00
    add  b                                        ; $4DCC: $80
    and  a                                        ; $4DCD: $A7
    ld   c, h                                     ; $4DCE: $4C
    ld   c, h                                     ; $4DCF: $4C
    ld   c, h                                     ; $4DD0: $4C
    ld   c, h                                     ; $4DD1: $4C
    ld   c, d                                     ; $4DD2: $4A
    ld   c, d                                     ; $4DD3: $4A
    ld   c, d                                     ; $4DD4: $4A
    ld   c, d                                     ; $4DD5: $4A
    ld   b, [hl]                                  ; $4DD6: $46
    ld   b, [hl]                                  ; $4DD7: $46
    ld   b, [hl]                                  ; $4DD8: $46
    ld   b, [hl]                                  ; $4DD9: $46
    ld   b, d                                     ; $4DDA: $42
    ld   b, [hl]                                  ; $4DDB: $46
    ld   c, d                                     ; $4DDC: $4A
    ld   d, b                                     ; $4DDD: $50
    nop                                           ; $4DDE: $00
    sbc  l                                        ; $4DDF: $9D
    ld   b, b                                     ; $4DE0: $40
    ld   hl, $A880                                ; $4DE1: $21 $80 $A8
    ld   e, d                                     ; $4DE4: $5A
    and  e                                        ; $4DE5: $A3
    ld   bc, $58A2                                ; $4DE6: $01 $A2 $58
    and  e                                        ; $4DE9: $A3
    ld   e, [hl]                                  ; $4DEA: $5E
    xor  b                                        ; $4DEB: $A8
    ld   d, b                                     ; $4DEC: $50
    and  d                                        ; $4DED: $A2
    ld   bc, $5AA3                                ; $4DEE: $01 $A3 $5A
    and  d                                        ; $4DF1: $A2
    ld   b, d                                     ; $4DF2: $42
    and  e                                        ; $4DF3: $A3
    ld   b, [hl]                                  ; $4DF4: $46
    and  d                                        ; $4DF5: $A2
    ld   c, d                                     ; $4DF6: $4A
    and  e                                        ; $4DF7: $A3
    ld   c, h                                     ; $4DF8: $4C
    and  d                                        ; $4DF9: $A2
    ld   c, d                                     ; $4DFA: $4A
    and  e                                        ; $4DFB: $A3
    ld   c, h                                     ; $4DFC: $4C
    and  a                                        ; $4DFD: $A7
    ld   b, b                                     ; $4DFE: $40
    ld   d, h                                     ; $4DFF: $54
    xor  [hl]                                     ; $4E00: $AE
    ld   d, b                                     ; $4E01: $50
    and  d                                        ; $4E02: $A2
    ld   bc, $4400                                ; $4E03: $01 $00 $44
    ld   b, h                                     ; $4E06: $44
    ld   b, h                                     ; $4E07: $44
    ld   b, d                                     ; $4E08: $42
    nop                                           ; $4E09: $00
    nop                                           ; $4E0A: $00
    nop                                           ; $4E0B: $00
    nop                                           ; $4E0C: $00
    ld   b, h                                     ; $4E0D: $44
    ld   b, h                                     ; $4E0E: $44
    ld   b, h                                     ; $4E0F: $44
    ld   b, d                                     ; $4E10: $42
    nop                                           ; $4E11: $00
    nop                                           ; $4E12: $00
    nop                                           ; $4E13: $00
    nop                                           ; $4E14: $00
    sbc  l                                        ; $4E15: $9D
    dec  b                                        ; $4E16: $05
    ld   c, [hl]                                  ; $4E17: $4E
    jr   nz, jr_01B_4DB3                          ; $4E18: $20 $99

    and  a                                        ; $4E1A: $A7
    ld   c, d                                     ; $4E1B: $4A
    ld   c, d                                     ; $4E1C: $4A
    ld   b, [hl]                                  ; $4E1D: $46
    ld   b, [hl]                                  ; $4E1E: $46
    ld   b, [hl]                                  ; $4E1F: $46
    ld   b, [hl]                                  ; $4E20: $46
    ld   b, d                                     ; $4E21: $42
    ld   b, d                                     ; $4E22: $42
    ld   b, d                                     ; $4E23: $42
    ld   b, d                                     ; $4E24: $42
    ld   b, b                                     ; $4E25: $40
    ld   b, b                                     ; $4E26: $40
    ld   a, $3E                                   ; $4E27: $3E $3E
    ld   b, h                                     ; $4E29: $44
    ld   c, d                                     ; $4E2A: $4A
    nop                                           ; $4E2B: $00

label_01B_4E2C:
    xor  a                                        ; $4E2C: $AF
    ld   [$D379], a                               ; $4E2D: $EA $79 $D3
    ld   [$D34F], a                               ; $4E30: $EA $4F $D3
    ld   [$D398], a                               ; $4E33: $EA $98 $D3
    ld   [$D393], a                               ; $4E36: $EA $93 $D3
    ld   [$D3C9], a                               ; $4E39: $EA $C9 $D3
    ld   [$D3A3], a                               ; $4E3C: $EA $A3 $D3
    ld   [$D3E5], a                               ; $4E3F: $EA $E5 $D3
    ld   a, $08                                   ; $4E42: $3E $08
    ldh  [rNR42], a                               ; $4E44: $E0 $21
    ld   a, $80                                   ; $4E46: $3E $80
    ldh  [rNR44], a                               ; $4E48: $E0 $23

label_01B_4E4A:
    ld   a, $FF                                   ; $4E4A: $3E $FF
    ldh  [rNR51], a                               ; $4E4C: $E0 $25
    ld   a, $03                                   ; $4E4E: $3E $03
    ld   [$D355], a                               ; $4E50: $EA $55 $D3
    xor  a                                        ; $4E53: $AF
    ld   [$D369], a                               ; $4E54: $EA $69 $D3

func_01B_4E57:
    xor  a                                        ; $4E57: $AF
    ld   [$D361], a                               ; $4E58: $EA $61 $D3
    ld   [$D371], a                               ; $4E5B: $EA $71 $D3
    ld   [$D31F], a                               ; $4E5E: $EA $1F $D3
    ld   [$D32F], a                               ; $4E61: $EA $2F $D3
    ld   [$D33F], a                               ; $4E64: $EA $3F $D3
    ld   [$D39E], a                               ; $4E67: $EA $9E $D3
    ld   [$D39F], a                               ; $4E6A: $EA $9F $D3
    ld   [$D3D9], a                               ; $4E6D: $EA $D9 $D3
    ld   [$D3DA], a                               ; $4E70: $EA $DA $D3
    ld   [$D3B6], a                               ; $4E73: $EA $B6 $D3
    ld   [$D3B7], a                               ; $4E76: $EA $B7 $D3
    ld   [$D3B8], a                               ; $4E79: $EA $B8 $D3
    ld   [$D3B9], a                               ; $4E7C: $EA $B9 $D3
    ld   [$D3BA], a                               ; $4E7F: $EA $BA $D3
    ld   [$D3BB], a                               ; $4E82: $EA $BB $D3
    ld   [$D394], a                               ; $4E85: $EA $94 $D3
    ld   [$D395], a                               ; $4E88: $EA $95 $D3
    ld   [$D396], a                               ; $4E8B: $EA $96 $D3
    ld   [$D390], a                               ; $4E8E: $EA $90 $D3
    ld   [$D391], a                               ; $4E91: $EA $91 $D3
    ld   [$D392], a                               ; $4E94: $EA $92 $D3
    ld   [$D3C6], a                               ; $4E97: $EA $C6 $D3
    ld   [$D3C7], a                               ; $4E9A: $EA $C7 $D3
    ld   [$D3C8], a                               ; $4E9D: $EA $C8 $D3
    ld   [$D3A0], a                               ; $4EA0: $EA $A0 $D3
    ld   [$D3A1], a                               ; $4EA3: $EA $A1 $D3
    ld   [$D3A2], a                               ; $4EA6: $EA $A2 $D3
    ld   [$D3CD], a                               ; $4EA9: $EA $CD $D3
    ld   [$D3D6], a                               ; $4EAC: $EA $D6 $D3
    ld   [$D3D7], a                               ; $4EAF: $EA $D7 $D3
    ld   [$D3D8], a                               ; $4EB2: $EA $D8 $D3
    ld   [$D3DC], a                               ; $4EB5: $EA $DC $D3
    ld   [$D3E7], a                               ; $4EB8: $EA $E7 $D3
    ld   [$D3E2], a                               ; $4EBB: $EA $E2 $D3
    ld   [$D3E3], a                               ; $4EBE: $EA $E3 $D3
    ld   [$D3E4], a                               ; $4EC1: $EA $E4 $D3
    ld   a, $08                                   ; $4EC4: $3E $08
    ldh  [rNR12], a                               ; $4EC6: $E0 $12
    ldh  [rNR22], a                               ; $4EC8: $E0 $17
    ld   a, $80                                   ; $4ECA: $3E $80
    ldh  [rNR14], a                               ; $4ECC: $E0 $14
    ldh  [rNR24], a                               ; $4ECE: $E0 $19
    xor  a                                        ; $4ED0: $AF
    ldh  [rNR10], a                               ; $4ED1: $E0 $10
    ldh  [rNR30], a                               ; $4ED3: $E0 $1A
    ret                                           ; $4ED5: $C9
