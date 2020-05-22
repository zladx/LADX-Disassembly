; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

    jp   label_01E_4009                           ; $4000: $C3 $09 $40

    jp   label_01E_4CFF                           ; $4003: $C3 $FF $4C

PlayMusicTrack_1E::
    jp   PlayMusicTrack_1E_EntryPoint             ; $4006: $C3 $1E $40

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

PlayMusicTrack_1E_EntryPoint::
    ld   hl, wMusicTrackToPlay                    ; $401E: $21 $68 $D3
    ld   a, [hl+]                                 ; $4021: $2A
    and  a                                        ; $4022: $A7
    jr   nz, BeginMusicTrack_1E                   ; $4023: $20 $14

    call func_01E_403F                            ; $4025: $CD $3F $40

jr_01E_4028:
    call func_01E_4581                            ; $4028: $CD $81 $45

DontPlayAudio_1E::
    xor  a                                        ; $402B: $AF
    ld   [wActiveJingle], a                       ; $402C: $EA $60 $D3
    ld   [wMusicTrackToPlay], a                   ; $402F: $EA $68 $D3
    ld   [wActiveWaveSfx], a                      ; $4032: $EA $70 $D3
    ld   [wActiveNoiseSfx], a                     ; $4035: $EA $78 $D3
    ret                                           ; $4038: $C9

BeginMusicTrack_1E::
    ; [wActiveMusicIndex] = [wMusicTrackToPlay]
    ld   [hl], a                                  ; $4039: $77
    call BeginMusicTrack_Dispatch_1E              ; $403A: $CD $63 $41
    jr   jr_01E_4028                              ; $403D: $18 $E9

func_01E_403F::
    ld   de, $D393                                ; $403F: $11 $93 $D3
    ld   hl, wActiveNoiseSfx                      ; $4042: $21 $78 $D3
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


; Music ID numbers are based on values written to wMusicTrackToPlay. They don't
; match up with "constants/sfx.asm" for some reason.
; Is this still the case? The constants are now correctly named.
MusicDataPointerTable_1E::
    dw   Music11
    dw   Music12
    dw   Music13
    dw   Music14
    dw   Music15
    dw   Music16
    dw   Music17
    dw   Music18
    dw   Music19
    dw   Music1a
    dw   Music1b
    dw   Music1c
    dw   Music1d
    dw   Music1e
    dw   Music1f
    dw   Music20

    dw   Music21
    dw   Music22
    dw   Music23
    dw   Music24
    dw   Music25
    dw   Music26
    dw   Music27
    dw   Music28
    dw   Music29
    dw   Music2a
    dw   Music2b
    dw   Music2c
    dw   Music2d
    dw   Music2e
    dw   Music2f
    dw   Music30

    dw   Music41
    dw   Music42
    dw   Music43
    dw   Music44
    dw   Music45
    dw   Music46
    dw   Music47
    dw   Music48
    dw   Music49
    dw   Music4a
    dw   Music4b
    dw   Music4c
    dw   Music4d
    dw   Music4e
    dw   Music4f
    dw   Music50

    dw   Music51
    dw   Music52
    dw   Music53
    dw   Music54
    dw   Music55
    dw   Music56
    dw   Music57
    dw   Music58
    dw   Music59
    dw   Music5a
    dw   Music5b
    dw   Music5c
    dw   Music5d
    dw   Music5e
    dw   Music5f
    dw   Music60

func_01E_40FF::
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

func_01E_410E::
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

func_01E_411B::
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

func_01E_4137::
jr_01E_4137:
    ld   a, [$D379]                               ; $4137: $FA $79 $D3
    cp   $05                                      ; $413A: $FE $05
    jp   z, label_01E_4D1D                        ; $413C: $CA $1D $4D

    cp   $0C                                      ; $413F: $FE $0C
    jp   z, label_01E_4D1D                        ; $4141: $CA $1D $4D

    cp   $1A                                      ; $4144: $FE $1A
    jp   z, label_01E_4D1D                        ; $4146: $CA $1D $4D

    cp   $24                                      ; $4149: $FE $24
    jp   z, label_01E_4D1D                        ; $414B: $CA $1D $4D

    cp   $2A                                      ; $414E: $FE $2A
    jp   z, label_01E_4D1D                        ; $4150: $CA $1D $4D

    cp   $2E                                      ; $4153: $FE $2E
    jp   z, label_01E_4D1D                        ; $4155: $CA $1D $4D

    cp   $3F                                      ; $4158: $FE $3F
    jp   z, label_01E_4D1D                        ; $415A: $CA $1D $4D

    call func_01E_411B                            ; $415D: $CD $1B $41
    jp   label_01E_4D1D                           ; $4160: $C3 $1D $4D

BeginMusicTrack_Dispatch_1E::
    ld   b, a                                     ; $4163: $47
    ld   a, [wActiveMusicTable]                   ; $4164: $FA $CE $D3
    and  a                                        ; $4167: $A7
    jp   nz, DontPlayAudio_1E                     ; $4168: $C2 $2B $40

    ld   a, b                                     ; $416B: $78
    cp   $FF                                      ; $416C: $FE $FF
    jr   z, jr_01E_4137                           ; $416E: $28 $C7

    cp   $11                                      ; $4170: $FE $11
    jr   nc, .above10                             ; $4172: $30 $03

    jp   DontPlayAudio_1E                         ; $4174: $C3 $2B $40

.above10
    cp   $21                                      ; $4177: $FE $21
    jr   nc, .above20                             ; $4179: $30 $04

    add  $F0                                      ; $417B: $C6 $F0
    jr   .playAudio                               ; $417D: $18 $14

.above20
    cp   $31                                      ; $417F: $FE $31
    jr   nc, .above30                             ; $4181: $30 $04

    add  $F0                                      ; $4183: $C6 $F0
    jr   .playAudio                               ; $4185: $18 $0C

.above30
    cp   $41                                      ; $4187: $FE $41
    jp   c, DontPlayAudio_1E                      ; $4189: $DA $2B $40

    cp   $61                                      ; $418C: $FE $61
    jp   nc, DontPlayAudio_1E                     ; $418E: $D2 $2B $40

    add  $E0                                      ; $4191: $C6 $E0

.playAudio
    dec  hl                                       ; $4193: $2B
    ld   [hl+], a                                 ; $4194: $22

    ld   [hl-], a                                 ; $4195: $32
    ld   a, [$D3CA]                               ; $4196: $FA $CA $D3
    ld   [wPreviousMusicTrack], a                 ; $4199: $EA $CB $D3
    ld   a, [hl+]                                 ; $419C: $2A
    ld   [$D3CA], a                               ; $419D: $EA $CA $D3
    ld   b, a                                     ; $41A0: $47
    ld   hl, MusicDataPointerTable_1E             ; $41A1: $21 $7F $40
    and  $7F                                      ; $41A4: $E6 $7F
    call func_01E_40FF                            ; $41A6: $CD $FF $40
    call func_01E_43C0                            ; $41A9: $CD $C0 $43
    jp   label_01E_4359                           ; $41AC: $C3 $59 $43

; Pattern, repeats after 6 entries.
Data_01E_41AF::
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00
    db   $01, $00, $FF, $FF, $00, $00

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
    ld   a, [wActiveMusicIndex]                   ; $4359: $FA $69 $D3
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

func_01E_4387::
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

func_01E_43AF::
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

func_01E_43BA::
    ld   a, [hl+]                                 ; $43BA: $2A
    ld   [de], a                                  ; $43BB: $12
    inc  e                                        ; $43BC: $1C
    ld   a, [hl+]                                 ; $43BD: $2A
    ld   [de], a                                  ; $43BE: $12
    ret                                           ; $43BF: $C9

func_01E_43C0::
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
    call func_01E_4D2A                            ; $43E2: $CD $2A $4D
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
    ld   bc, $410                                 ; $442C: $01 $10 $04
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

func_01E_4487::
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

func_01E_4493::
    push de                                       ; $4493: $D5
    ld   a, [hl+]                                 ; $4494: $2A
    ld   e, a                                     ; $4495: $5F
    ld   a, [hl-]                                 ; $4496: $3A
    ld   d, a                                     ; $4497: $57
    inc  de                                       ; $4498: $13
    inc  de                                       ; $4499: $13
    jr   jr_01E_448D                              ; $449A: $18 $F1

func_01E_449C::
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
    jp   z, ContinueCurrentScreenMusic_1E         ; $4513: $CA $54 $48

    ld   hl, wActiveMusicIndex                    ; $4516: $21 $69 $D3
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

func_01E_4581::
    ld   hl, wActiveMusicIndex                    ; $4581: $21 $69 $D3
    ld   a, [hl]                                  ; $4584: $7E
    and  a                                        ; $4585: $A7
    ret  z                                        ; $4586: $C8

    ld   a, [wActiveMusicTable]                   ; $4587: $FA $CE $D3
    and  a                                        ; $458A: $A7
    jp   nz, DontPlayAudio_1E                     ; $458B: $C2 $2B $40

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
    ld   de, wActiveMusicTableIndex               ; $466C: $11 $D9 $D3
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
    ld   hl, Data_01E_49BF                        ; $46AB: $21 $BF $49
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
    ld   hl, Data_01E_4A51                        ; $46C6: $21 $51 $4A
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

func_01E_4772::
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

    ld   a, [wActiveMusicTableIndex]              ; $47CC: $FA $D9 $D3
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

func_01E_47F6::
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

func_01E_4841::
    push bc                                       ; $4841: $C5
    dec  b                                        ; $4842: $05
    ld   c, b                                     ; $4843: $48
    ld   b, $00                                   ; $4844: $06 $00
    ld   hl, HardcodedData_1e_4b15                ; $4846: $21 $15 $4B
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

ContinueCurrentScreenMusic_1E:
    xor  a                                        ; $4854: $AF
    ld   [wActiveMusicTable], a                   ; $4855: $EA $CE $D3
    ldh  a, [$FFBF]                               ; $4858: $F0 $BF
    ld   [wMusicTrackToPlay], a                   ; $485A: $EA $68 $D3
    jp   PlayMusicTrack_1E_EntryPoint             ; $485D: $C3 $1E $40

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
    ld   [wActiveMusicTableIndex], a              ; $487A: $EA $D9 $D3
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

func_01E_48B4::
    ld   a, [bc]                                  ; $48B4: $0A
    inc  a                                        ; $48B5: $3C
    ld   [bc], a                                  ; $48B6: $02
    ret                                           ; $48B7: $C9

label_01E_48B8:
    ld   a, $01                                   ; $48B8: $3E $01
    ld   [wActiveMusicTableIndex], a              ; $48BA: $EA $D9 $D3
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
    ld   [wActiveMusicTableIndex], a              ; $48E7: $EA $D9 $D3
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

func_01E_4920::
    ld   a, $07                                   ; $4920: $3E $07
    add  l                                        ; $4922: $85
    ld   l, a                                     ; $4923: $6F
    ld   a, [hl+]                                 ; $4924: $2A
    ld   e, a                                     ; $4925: $5F
    ld   a, [hl]                                  ; $4926: $7E
    and  $0F                                      ; $4927: $E6 $0F
    ld   d, a                                     ; $4929: $57
    ret                                           ; $492A: $C9

func_01E_492B::
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

func_01E_493C::
    ld   a, [$D350]                               ; $493C: $FA $50 $D3
    dec  a                                        ; $493F: $3D
    sla  a                                        ; $4940: $CB $27
    add  e                                        ; $4942: $83
    ld   e, a                                     ; $4943: $5F
    ret                                           ; $4944: $C9

func_01E_4945::
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
    ld   de, Data_01E_4997                        ; $4973: $11 $97 $49
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

Data_01E_4997::
    db   $00, $00, $00, $00, $00, $01, $00, $01   ; $4997
    db   $00, $02, $00, $02, $00, $00, $00, $00   ; $499F
    db   $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE   ; $49A7
    db   $00, $00, $00, $01, $00, $02, $00, $01   ; $49AF
    db   $00, $00, $FF, $FF, $FF, $FE, $FF, $FF   ; $49B7

Data_01E_49BF::
    db   $00, $0F, $2C, $00, $9C, $00, $06, $01   ; $49BF
    db   $6B, $01, $C9, $01, $23, $02, $77, $02   ; $49C7
    db   $C6, $02, $12, $03, $56, $03, $9B, $03   ; $49CF
    db   $DA, $03, $16, $04, $4E, $04, $83, $04   ; $49D7
    db   $B5, $04, $E5, $04, $11, $05, $3B, $05   ; $49DF
    db   $63, $05, $89, $05, $AC, $05, $CE, $05   ; $49E7
    db   $ED, $05, $0A, $06, $27, $06, $42, $06   ; $49EF
    db   $5B, $06, $72, $06, $89, $06, $9E, $06   ; $49F7
    db   $B2, $06, $C4, $06, $D6, $06, $E7, $06   ; $49FF
    db   $F7, $06, $06, $07, $14, $07, $21, $07   ; $4A07
    db   $2D, $07, $39, $07, $44, $07, $4F, $07   ; $4A0F
    db   $59, $07, $62, $07, $6B, $07, $74, $07   ; $4A17
    db   $7B, $07, $83, $07, $8A, $07, $90, $07   ; $4A1F
    db   $97, $07, $9D, $07, $A2, $07, $A7, $07   ; $4A27
    db   $AC, $07, $B1, $07, $B6, $07, $BA, $07   ; $4A2F
    db   $BE, $07, $C1, $07, $C5, $07, $C8, $07   ; $4A37
    db   $CB, $07, $CE, $07, $D1, $07, $D4, $07   ; $4A3F
    db   $D6, $07, $D9, $07, $DB, $07, $DD, $07   ; $4A47
    db   $DF, $07

Data_01E_4A51::
    db   $00, $00, $00, $00, $00, $C0, $09, $00   ; $4A51
    db   $38, $34, $C0, $19, $00, $38, $33, $C0   ; $4A59
    db   $46, $00, $13, $10, $C0, $23, $00, $20   ; $4A61
    db   $40, $80, $51, $00, $20, $07, $80, $A1   ; $4A69
    db   $00, $00, $18, $80, $F2, $00, $00, $18   ; $4A71
    db   $80, $81, $00, $3A, $10, $C0, $80, $00   ; $4A79
    db   $00, $10, $C0, $57, $00, $00, $60, $80   ; $4A81
    db   $10, $00, $00, $10, $80, $01, $02, $04   ; $4A89
    db   $08, $10, $20, $06, $0C, $18, $01, $01   ; $4A91
    db   $01, $01, $01, $30


include "data/music/music_tracks_data_1e_1.asm"


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
    ld   [wActiveMusicIndex], a                   ; $4D27: $EA $69 $D3

func_01E_4D2A::
    xor  a                                        ; $4D2A: $AF
    ld   [$D361], a                               ; $4D2B: $EA $61 $D3
    ld   [$D371], a                               ; $4D2E: $EA $71 $D3
    ld   [$D31F], a                               ; $4D31: $EA $1F $D3
    ld   [$D32F], a                               ; $4D34: $EA $2F $D3
    ld   [$D33F], a                               ; $4D37: $EA $3F $D3
    ld   [$D39E], a                               ; $4D3A: $EA $9E $D3
    ld   [$D39F], a                               ; $4D3D: $EA $9F $D3
    ld   [wActiveMusicTableIndex], a              ; $4D40: $EA $D9 $D3
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



