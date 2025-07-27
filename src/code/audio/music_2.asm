; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

    jp   label_01E_4009                           ;; 1E:4000 $C3 $09 $40

    jp   label_01E_4CFF                           ;; 1E:4003 $C3 $FF $4C

PlayMusicTrack_1E::
    jp   PlayMusicTrack_1E_EntryPoint             ;; 1E:4006 $C3 $1E $40

label_01E_4009:
    ld   hl, wMusicTranspose                      ;; 1E:4009 $21 $00 $D3

.loop_400C
    ld   [hl], $00                                ;; 1E:400C $36 $00
    inc  l                                        ;; 1E:400E $2C
    jr   nz, .loop_400C                           ;; 1E:400F $20 $FB

    ld   a, $80                                   ;; 1E:4011 $3E $80
    ldh  [rNR52], a                               ;; 1E:4013 $E0 $26
    ld   a, $77                                   ;; 1E:4015 $3E $77
    ldh  [rNR50], a                               ;; 1E:4017 $E0 $24
    ld   a, $FF                                   ;; 1E:4019 $3E $FF
    ldh  [rNR51], a                               ;; 1E:401B $E0 $25
    ret                                           ;; 1E:401D $C9

PlayMusicTrack_1E_EntryPoint::
    ld   hl, wMusicTrackToPlay                    ;; 1E:401E $21 $68 $D3
    ld   a, [hl+]                                 ;; 1E:4021 $2A
    and  a                                        ;; 1E:4022 $A7
    jr   nz, BeginMusicTrack_1E                   ;; 1E:4023 $20 $14

    call func_01E_403F                            ;; 1E:4025 $CD $3F $40

jr_01E_4028:
    call func_01E_4581                            ;; 1E:4028 $CD $81 $45

DontPlayAudio_1E::
    xor  a                                        ;; 1E:402B $AF
    ld   [wActiveJingle], a                       ;; 1E:402C $EA $60 $D3
    ld   [wMusicTrackToPlay], a                   ;; 1E:402F $EA $68 $D3
    ld   [wActiveWaveSfx], a                      ;; 1E:4032 $EA $70 $D3
    ld   [wActiveNoiseSfx], a                     ;; 1E:4035 $EA $78 $D3
    ret                                           ;; 1E:4038 $C9

BeginMusicTrack_1E::
    ; [wActiveMusicIndex] = [wMusicTrackToPlay]
    ld   [hl], a                                  ;; 1E:4039 $77
    call BeginMusicTrack_Dispatch_1E              ;; 1E:403A $CD $63 $41
    jr   jr_01E_4028                              ;; 1E:403D $18 $E9

func_01E_403F::
    ld   de, wD393                                ;; 1E:403F $11 $93 $D3
    ld   hl, wActiveNoiseSfx                      ;; 1E:4042 $21 $78 $D3
    ld   a, [hl+]                                 ;; 1E:4045 $2A
    cp   $01                                      ;; 1E:4046 $FE $01
    jr   z, .jr_4050                              ;; 1E:4048 $28 $06

    ld   a, [hl]                                  ;; 1E:404A $7E
    cp   $01                                      ;; 1E:404B $FE $01
    jr   z, jr_01E_405B                           ;; 1E:404D $28 $0C

    ret                                           ;; 1E:404F $C9

.jr_4050
    ld   a, $01                                   ;; 1E:4050 $3E $01
    ld   [wD379], a                               ;; 1E:4052 $EA $79 $D3
    ld   hl, Data_0E1_4068                        ;; 1E:4055 $21 $68 $40
    jp   label_01E_4072                           ;; 1E:4058 $C3 $72 $40

jr_01E_405B:
    ld   a, [de]                                  ;; 1E:405B $1A
    dec  a                                        ;; 1E:405C $3D
    ld   [de], a                                  ;; 1E:405D $12
    ret  nz                                       ;; 1E:405E $C0

    xor  a                                        ;; 1E:405F $AF
    ld   [wD379], a                               ;; 1E:4060 $EA $79 $D3
    ld   hl, Data_0E1_406D                        ;; 1E:4063 $21 $6D $40
    jr   jr_01E_4072                              ;; 1E:4066 $18 $0A

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
    ld   b, $04                                   ;; 1E:4072 $06 $04
    ld   c, $20                                   ;; 1E:4074 $0E $20

.loop_4076
    ld   a, [hl+]                                 ;; 1E:4076 $2A
    ldh  [c], a                                   ;; 1E:4077 $E2
    inc  c                                        ;; 1E:4078 $0C
    dec  b                                        ;; 1E:4079 $05
    jr   nz, .loop_4076                           ;; 1E:407A $20 $FA

    ld   a, [hl]                                  ;; 1E:407C $7E
    ld   [de], a                                  ;; 1E:407D $12
    ret                                           ;; 1E:407E $C9


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
    inc  e                                        ;; 1E:40FF $1C
    dec  a                                        ;; 1E:4100 $3D
    sla  a                                        ;; 1E:4101 $CB $27
    ld   c, a                                     ;; 1E:4103 $4F
    ld   b, $00                                   ;; 1E:4104 $06 $00
    add  hl, bc                                   ;; 1E:4106 $09
    ld   c, [hl]                                  ;; 1E:4107 $4E
    inc  hl                                       ;; 1E:4108 $23
    ld   b, [hl]                                  ;; 1E:4109 $46
    ld   l, c                                     ;; 1E:410A $69
    ld   h, b                                     ;; 1E:410B $60
    ld   a, h                                     ;; 1E:410C $7C
    ret                                           ;; 1E:410D $C9

func_01E_410E::
    push bc                                       ;; 1E:410E $C5
    ld   c, $30                                   ;; 1E:410F $0E $30

.loop_4111
    ld   a, [hl+]                                 ;; 1E:4111 $2A
    ldh  [c], a                                   ;; 1E:4112 $E2
    inc  c                                        ;; 1E:4113 $0C
    ld   a, c                                     ;; 1E:4114 $79
    cp   $40                                      ;; 1E:4115 $FE $40
    jr   nz, .loop_4111                           ;; 1E:4117 $20 $F8

    pop  bc                                       ;; 1E:4119 $C1
    ret                                           ;; 1E:411A $C9

func_01E_411B::
    xor  a                                        ;; 1E:411B $AF
    ld   [wD379], a                               ;; 1E:411C $EA $79 $D3
    ld   [wD34F], a                               ;; 1E:411F $EA $4F $D3
    ld   [wD398], a                               ;; 1E:4122 $EA $98 $D3
    ld   [wD393], a                               ;; 1E:4125 $EA $93 $D3
    ld   [wD3C9], a                               ;; 1E:4128 $EA $C9 $D3
    ld   [wD3A3], a                               ;; 1E:412B $EA $A3 $D3
    ld   a, $08                                   ;; 1E:412E $3E $08
    ldh  [rNR42], a                               ;; 1E:4130 $E0 $21
    ld   a, $80                                   ;; 1E:4132 $3E $80
    ldh  [rNR44], a                               ;; 1E:4134 $E0 $23
    ret                                           ;; 1E:4136 $C9

func_01E_4137::
jr_01E_4137:
    ld   a, [wD379]                               ;; 1E:4137 $FA $79 $D3
    cp   $05                                      ;; 1E:413A $FE $05
    jp   z, label_01E_4D1D                        ;; 1E:413C $CA $1D $4D

    cp   $0C                                      ;; 1E:413F $FE $0C
    jp   z, label_01E_4D1D                        ;; 1E:4141 $CA $1D $4D

    cp   $1A                                      ;; 1E:4144 $FE $1A
    jp   z, label_01E_4D1D                        ;; 1E:4146 $CA $1D $4D

    cp   $24                                      ;; 1E:4149 $FE $24
    jp   z, label_01E_4D1D                        ;; 1E:414B $CA $1D $4D

    cp   $2A                                      ;; 1E:414E $FE $2A
    jp   z, label_01E_4D1D                        ;; 1E:4150 $CA $1D $4D

    cp   $2E                                      ;; 1E:4153 $FE $2E
    jp   z, label_01E_4D1D                        ;; 1E:4155 $CA $1D $4D

    cp   $3F                                      ;; 1E:4158 $FE $3F
    jp   z, label_01E_4D1D                        ;; 1E:415A $CA $1D $4D

    call func_01E_411B                            ;; 1E:415D $CD $1B $41
    jp   label_01E_4D1D                           ;; 1E:4160 $C3 $1D $4D

BeginMusicTrack_Dispatch_1E::
    ld   b, a                                     ;; 1E:4163 $47
    ld   a, [wActiveMusicTable]                   ;; 1E:4164 $FA $CE $D3
    and  a                                        ;; 1E:4167 $A7
    jp   nz, DontPlayAudio_1E                     ;; 1E:4168 $C2 $2B $40

    ld   a, b                                     ;; 1E:416B $78
    cp   $FF                                      ;; 1E:416C $FE $FF
    jr   z, jr_01E_4137                           ;; 1E:416E $28 $C7

    cp   $11                                      ;; 1E:4170 $FE $11
    jr   nc, .above10                             ;; 1E:4172 $30 $03

    jp   DontPlayAudio_1E                         ;; 1E:4174 $C3 $2B $40

.above10
    cp   $21                                      ;; 1E:4177 $FE $21
    jr   nc, .above20                             ;; 1E:4179 $30 $04

    add  $F0                                      ;; 1E:417B $C6 $F0
    jr   .playAudio                               ;; 1E:417D $18 $14

.above20
    cp   $31                                      ;; 1E:417F $FE $31
    jr   nc, .above30                             ;; 1E:4181 $30 $04

    add  $F0                                      ;; 1E:4183 $C6 $F0
    jr   .playAudio                               ;; 1E:4185 $18 $0C

.above30
    cp   $41                                      ;; 1E:4187 $FE $41
    jp   c, DontPlayAudio_1E                      ;; 1E:4189 $DA $2B $40

    cp   $61                                      ;; 1E:418C $FE $61
    jp   nc, DontPlayAudio_1E                     ;; 1E:418E $D2 $2B $40

    add  $E0                                      ;; 1E:4191 $C6 $E0

.playAudio
    dec  hl                                       ;; 1E:4193 $2B
    ld   [hl+], a                                 ;; 1E:4194 $22

    ld   [hl-], a                                 ;; 1E:4195 $32
    ld   a, [wD3CA]                               ;; 1E:4196 $FA $CA $D3
    ld   [wPreviousMusicTrack], a                 ;; 1E:4199 $EA $CB $D3
    ld   a, [hl+]                                 ;; 1E:419C $2A
    ld   [wD3CA], a                               ;; 1E:419D $EA $CA $D3
    ld   b, a                                     ;; 1E:41A0 $47
    ld   hl, MusicDataPointerTable_1E             ;; 1E:41A1 $21 $7F $40
    and  $7F                                      ;; 1E:41A4 $E6 $7F
    call func_01E_40FF                            ;; 1E:41A6 $CD $FF $40
    call func_01E_43C0                            ;; 1E:41A9 $CD $C0 $43
    jp   label_01E_4359                           ;; 1E:41AC $C3 $59 $43

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
    ld   a, [wD3E7]                               ;; 1E:432F $FA $E7 $D3
    and  a                                        ;; 1E:4332 $A7
    jp   z, label_01E_473F                        ;; 1E:4333 $CA $3F $47

    xor  a                                        ;; 1E:4336 $AF
    ldh  [rNR30], a                               ;; 1E:4337 $E0 $1A
    ld   [wD3E7], a                               ;; 1E:4339 $EA $E7 $D3
    push hl                                       ;; 1E:433C $E5
    ld   a, [wD330 + 6]                           ;; 1E:433D $FA $36 $D3
    ld   l, a                                     ;; 1E:4340 $6F
    ld   a, [wD330 + 7]                           ;; 1E:4341 $FA $37 $D3
    ld   h, a                                     ;; 1E:4344 $67
    push bc                                       ;; 1E:4345 $C5
    ld   c, $30                                   ;; 1E:4346 $0E $30

.loop_4348
    ld   a, [hl+]                                 ;; 1E:4348 $2A
    ldh  [c], a                                   ;; 1E:4349 $E2
    inc  c                                        ;; 1E:434A $0C
    ld   a, c                                     ;; 1E:434B $79
    cp   $40                                      ;; 1E:434C $FE $40
    jr   nz, .loop_4348                           ;; 1E:434E $20 $F8

    ld   a, $80                                   ;; 1E:4350 $3E $80
    ldh  [rNR30], a                               ;; 1E:4352 $E0 $1A
    pop  bc                                       ;; 1E:4354 $C1
    pop  hl                                       ;; 1E:4355 $E1
    jp   label_01E_473F                           ;; 1E:4356 $C3 $3F $47

label_01E_4359:
    ld   a, [wActiveMusicIndex]                   ;; 1E:4359 $FA $69 $D3
    ld   hl, Data_01E_41AF                        ;; 1E:435C $21 $AF $41

.loop_435F
    dec  a                                        ;; 1E:435F $3D
    jr   z, .jr_436A                              ;; 1E:4360 $28 $08

    inc  hl                                       ;; 1E:4362 $23
    inc  hl                                       ;; 1E:4363 $23
    inc  hl                                       ;; 1E:4364 $23
    inc  hl                                       ;; 1E:4365 $23
    inc  hl                                       ;; 1E:4366 $23
    inc  hl                                       ;; 1E:4367 $23
    jr   .loop_435F                               ;; 1E:4368 $18 $F5

.jr_436A
    ld   bc, wD355                                ;; 1E:436A $01 $55 $D3
    ld   a, [hl+]                                 ;; 1E:436D $2A
    ld   [bc], a                                  ;; 1E:436E $02
    inc  c                                        ;; 1E:436F $0C
    xor  a                                        ;; 1E:4370 $AF
    ld   [bc], a                                  ;; 1E:4371 $02
    inc  c                                        ;; 1E:4372 $0C
    ld   a, [hl+]                                 ;; 1E:4373 $2A
    ld   [bc], a                                  ;; 1E:4374 $02
    inc  c                                        ;; 1E:4375 $0C
    xor  a                                        ;; 1E:4376 $AF
    ld   [bc], a                                  ;; 1E:4377 $02
    inc  c                                        ;; 1E:4378 $0C
    ld   a, [hl+]                                 ;; 1E:4379 $2A
    ld   [bc], a                                  ;; 1E:437A $02
    ldh  [rNR51], a                               ;; 1E:437B $E0 $25
    inc  c                                        ;; 1E:437D $0C
    ld   a, [hl+]                                 ;; 1E:437E $2A
    ld   [bc], a                                  ;; 1E:437F $02
    inc  c                                        ;; 1E:4380 $0C
    ld   a, [hl+]                                 ;; 1E:4381 $2A
    ld   [bc], a                                  ;; 1E:4382 $02
    inc  c                                        ;; 1E:4383 $0C
    ld   a, [hl+]                                 ;; 1E:4384 $2A
    ld   [bc], a                                  ;; 1E:4385 $02
    ret                                           ;; 1E:4386 $C9

func_01E_4387::
    ld   hl, wD355                                ;; 1E:4387 $21 $55 $D3
    ld   a, [hl+]                                 ;; 1E:438A $2A
    cp   $01                                      ;; 1E:438B $FE $01
    ret  z                                        ;; 1E:438D $C8

    inc  [hl]                                     ;; 1E:438E $34
    ld   a, [hl+]                                 ;; 1E:438F $2A
    cp   [hl]                                     ;; 1E:4390 $BE
    ret  nz                                       ;; 1E:4391 $C0

    dec  l                                        ;; 1E:4392 $2D
    ld   [hl], $00                                ;; 1E:4393 $36 $00
    inc  l                                        ;; 1E:4395 $2C
    inc  l                                        ;; 1E:4396 $2C
    inc  [hl]                                     ;; 1E:4397 $34
    ld   a, [hl+]                                 ;; 1E:4398 $2A
    and  $03                                      ;; 1E:4399 $E6 $03
    ld   c, l                                     ;; 1E:439B $4D
    ld   b, h                                     ;; 1E:439C $44
    and  a                                        ;; 1E:439D $A7
    jr   z, .jr_43AB                              ;; 1E:439E $28 $0B

    inc  c                                        ;; 1E:43A0 $0C
    cp   $01                                      ;; 1E:43A1 $FE $01
    jr   z, .jr_43AB                              ;; 1E:43A3 $28 $06

    inc  c                                        ;; 1E:43A5 $0C
    cp   $02                                      ;; 1E:43A6 $FE $02
    jr   z, .jr_43AB                              ;; 1E:43A8 $28 $01

    inc  c                                        ;; 1E:43AA $0C

.jr_43AB
    ld   a, [bc]                                  ;; 1E:43AB $0A
    ldh  [rNR51], a                               ;; 1E:43AC $E0 $25
    ret                                           ;; 1E:43AE $C9

func_01E_43AF::
    ld   a, [hl+]                                 ;; 1E:43AF $2A
    ld   c, a                                     ;; 1E:43B0 $4F
    ld   a, [hl]                                  ;; 1E:43B1 $7E
    ld   b, a                                     ;; 1E:43B2 $47
    ld   a, [bc]                                  ;; 1E:43B3 $0A
    ld   [de], a                                  ;; 1E:43B4 $12
    inc  e                                        ;; 1E:43B5 $1C
    inc  bc                                       ;; 1E:43B6 $03
    ld   a, [bc]                                  ;; 1E:43B7 $0A
    ld   [de], a                                  ;; 1E:43B8 $12
    ret                                           ;; 1E:43B9 $C9

func_01E_43BA::
    ld   a, [hl+]                                 ;; 1E:43BA $2A
    ld   [de], a                                  ;; 1E:43BB $12
    inc  e                                        ;; 1E:43BC $1C
    ld   a, [hl+]                                 ;; 1E:43BD $2A
    ld   [de], a                                  ;; 1E:43BE $12
    ret                                           ;; 1E:43BF $C9

func_01E_43C0::
    ld   a, [wD379]                               ;; 1E:43C0 $FA $79 $D3
    cp   $05                                      ;; 1E:43C3 $FE $05
    jr   z, .jr_43E2                              ;; 1E:43C5 $28 $1B

    cp   $0C                                      ;; 1E:43C7 $FE $0C
    jr   z, .jr_43E2                              ;; 1E:43C9 $28 $17

    cp   $1A                                      ;; 1E:43CB $FE $1A
    jr   z, .jr_43E2                              ;; 1E:43CD $28 $13

    cp   $24                                      ;; 1E:43CF $FE $24
    jr   z, .jr_43E2                              ;; 1E:43D1 $28 $0F

    cp   $2A                                      ;; 1E:43D3 $FE $2A
    jr   z, .jr_43E2                              ;; 1E:43D5 $28 $0B

    cp   $2E                                      ;; 1E:43D7 $FE $2E
    jr   z, .jr_43E2                              ;; 1E:43D9 $28 $07

    cp   $3F                                      ;; 1E:43DB $FE $3F
    jr   z, .jr_43E2                              ;; 1E:43DD $28 $03

    call func_01E_411B                            ;; 1E:43DF $CD $1B $41

.jr_43E2
    call func_01E_4D2A                            ;; 1E:43E2 $CD $2A $4D
    ld   de, wMusicTranspose                      ;; 1E:43E5 $11 $00 $D3
    ld   b, $00                                   ;; 1E:43E8 $06 $00
    ld   a, [hl+]                                 ;; 1E:43EA $2A
    ld   [de], a                                  ;; 1E:43EB $12
    inc  e                                        ;; 1E:43EC $1C
    call func_01E_43BA                            ;; 1E:43ED $CD $BA $43
    ld   de, wD310                                ;; 1E:43F0 $11 $10 $D3
    call func_01E_43BA                            ;; 1E:43F3 $CD $BA $43
    ld   de, wD320                                ;; 1E:43F6 $11 $20 $D3
    call func_01E_43BA                            ;; 1E:43F9 $CD $BA $43
    ld   de, wD330                                ;; 1E:43FC $11 $30 $D3
    call func_01E_43BA                            ;; 1E:43FF $CD $BA $43
    ld   de, wD340                                ;; 1E:4402 $11 $40 $D3
    call func_01E_43BA                            ;; 1E:4405 $CD $BA $43
    ld   hl, wD310                                ;; 1E:4408 $21 $10 $D3
    ld   de, wD314                                ;; 1E:440B $11 $14 $D3
    call func_01E_43AF                            ;; 1E:440E $CD $AF $43
    ld   hl, wD320                                ;; 1E:4411 $21 $20 $D3
    ld   de, wD320 + 4                            ;; 1E:4414 $11 $24 $D3
    call func_01E_43AF                            ;; 1E:4417 $CD $AF $43
    ld   hl, wD330 + 0                            ;; 1E:441A $21 $30 $D3
    ld   de, wD330 + 4                            ;; 1E:441D $11 $34 $D3
    call func_01E_43AF                            ;; 1E:4420 $CD $AF $43
    ld   hl, wD340                                ;; 1E:4423 $21 $40 $D3
    ld   de, wD344                                ;; 1E:4426 $11 $44 $D3
    call func_01E_43AF                            ;; 1E:4429 $CD $AF $43
    ld   bc, $410                                 ;; 1E:442C $01 $10 $04
    ld   hl, wD312                                ;; 1E:442F $21 $12 $D3

.loop_4432
    ld   [hl], $01                                ;; 1E:4432 $36 $01
    ld   a, c                                     ;; 1E:4434 $79
    add  l                                        ;; 1E:4435 $85
    ld   l, a                                     ;; 1E:4436 $6F
    dec  b                                        ;; 1E:4437 $05
    jr   nz, .loop_4432                           ;; 1E:4438 $20 $F8

    xor  a                                        ;; 1E:443A $AF
    ld   [wD31E], a                               ;; 1E:443B $EA $1E $D3
    ld   [wD320 + $0E], a                         ;; 1E:443E $EA $2E $D3
    ld   [wD330 + $0E], a                         ;; 1E:4441 $EA $3E $D3
    ret                                           ;; 1E:4444 $C9

jr_01E_4445:
    push hl                                       ;; 1E:4445 $E5
    ld   a, [wD371]                               ;; 1E:4446 $FA $71 $D3
    and  a                                        ;; 1E:4449 $A7
    jr   nz, .jr_4454                             ;; 1E:444A $20 $08

    xor  a                                        ;; 1E:444C $AF
    ldh  [rNR30], a                               ;; 1E:444D $E0 $1A
    ld   l, e                                     ;; 1E:444F $6B
    ld   h, d                                     ;; 1E:4450 $62
    call func_01E_410E                            ;; 1E:4451 $CD $0E $41

.jr_4454
    pop  hl                                       ;; 1E:4454 $E1
    jr   jr_01E_4481                              ;; 1E:4455 $18 $2A

label_01E_4457:
    call func_01E_4487                            ;; 1E:4457 $CD $87 $44
    call func_01E_449C                            ;; 1E:445A $CD $9C $44
    ld   e, a                                     ;; 1E:445D $5F
    call func_01E_4487                            ;; 1E:445E $CD $87 $44
    call func_01E_449C                            ;; 1E:4461 $CD $9C $44
    ld   d, a                                     ;; 1E:4464 $57
    call func_01E_4487                            ;; 1E:4465 $CD $87 $44
    call func_01E_449C                            ;; 1E:4468 $CD $9C $44
    ld   c, a                                     ;; 1E:446B $4F
    inc  l                                        ;; 1E:446C $2C
    inc  l                                        ;; 1E:446D $2C
    ld   [hl], e                                  ;; 1E:446E $73
    inc  l                                        ;; 1E:446F $2C
    ld   [hl], d                                  ;; 1E:4470 $72
    inc  l                                        ;; 1E:4471 $2C
    ld   [hl], c                                  ;; 1E:4472 $71
    dec  l                                        ;; 1E:4473 $2D
    dec  l                                        ;; 1E:4474 $2D
    dec  l                                        ;; 1E:4475 $2D
    dec  l                                        ;; 1E:4476 $2D
    push hl                                       ;; 1E:4477 $E5
    ld   hl, wActiveChannelIndex                  ;; 1E:4478 $21 $50 $D3
    ld   a, [hl]                                  ;; 1E:447B $7E
    pop  hl                                       ;; 1E:447C $E1
    cp   $03                                      ;; 1E:447D $FE $03
    jr   z, jr_01E_4445                           ;; 1E:447F $28 $C4

jr_01E_4481:
    call func_01E_4487                            ;; 1E:4481 $CD $87 $44
    jp   label_01E_45A5                           ;; 1E:4484 $C3 $A5 $45

func_01E_4487::
    push de                                       ;; 1E:4487 $D5
    ld   a, [hl+]                                 ;; 1E:4488 $2A
    ld   e, a                                     ;; 1E:4489 $5F
    ld   a, [hl-]                                 ;; 1E:448A $3A
    ld   d, a                                     ;; 1E:448B $57
    inc  de                                       ;; 1E:448C $13

jr_01E_448D:
    ld   a, e                                     ;; 1E:448D $7B
    ld   [hl+], a                                 ;; 1E:448E $22
    ld   a, d                                     ;; 1E:448F $7A
    ld   [hl-], a                                 ;; 1E:4490 $32
    pop  de                                       ;; 1E:4491 $D1
    ret                                           ;; 1E:4492 $C9

func_01E_4493::
    push de                                       ;; 1E:4493 $D5
    ld   a, [hl+]                                 ;; 1E:4494 $2A
    ld   e, a                                     ;; 1E:4495 $5F
    ld   a, [hl-]                                 ;; 1E:4496 $3A
    ld   d, a                                     ;; 1E:4497 $57
    inc  de                                       ;; 1E:4498 $13
    inc  de                                       ;; 1E:4499 $13
    jr   jr_01E_448D                              ;; 1E:449A $18 $F1

func_01E_449C::
    ld   a, [hl+]                                 ;; 1E:449C $2A
    ld   c, a                                     ;; 1E:449D $4F
    ld   a, [hl-]                                 ;; 1E:449E $3A
    ld   b, a                                     ;; 1E:449F $47
    ld   a, [bc]                                  ;; 1E:44A0 $0A
    ld   b, a                                     ;; 1E:44A1 $47
    ret                                           ;; 1E:44A2 $C9

jr_01E_44A3:
    pop  hl                                       ;; 1E:44A3 $E1
    jr   jr_01E_44D7                              ;; 1E:44A4 $18 $31

label_01E_44A6:
    ld   a, [wActiveChannelIndex]                 ;; 1E:44A6 $FA $50 $D3
    cp   $03                                      ;; 1E:44A9 $FE $03
    jr   nz, .jr_44BD                             ;; 1E:44AB $20 $10

    ld   a, [wD330 + $08]                         ;; 1E:44AD $FA $38 $D3
    bit  7, a                                     ;; 1E:44B0 $CB $7F
    jr   z, .jr_44BD                              ;; 1E:44B2 $28 $09

    ld   a, [hl]                                  ;; 1E:44B4 $7E
    cp   $06                                      ;; 1E:44B5 $FE $06
    jr   nz, .jr_44BD                             ;; 1E:44B7 $20 $04

    ld   a, $40                                   ;; 1E:44B9 $3E $40
    ldh  [rNR32], a                               ;; 1E:44BB $E0 $1C

.jr_44BD
    push hl                                       ;; 1E:44BD $E5
    ld   a, l                                     ;; 1E:44BE $7D
    add  $09                                      ;; 1E:44BF $C6 $09
    ld   l, a                                     ;; 1E:44C1 $6F
    ld   a, [hl]                                  ;; 1E:44C2 $7E
    and  a                                        ;; 1E:44C3 $A7
    jr   nz, jr_01E_44A3                          ;; 1E:44C4 $20 $DD

    ld   a, l                                     ;; 1E:44C6 $7D
    add  $04                                      ;; 1E:44C7 $C6 $04
    ld   l, a                                     ;; 1E:44C9 $6F
    bit  7, [hl]                                  ;; 1E:44CA $CB $7E
    jr   nz, jr_01E_44A3                          ;; 1E:44CC $20 $D5

    pop  hl                                       ;; 1E:44CE $E1
    call func_01E_4772                            ;; 1E:44CF $CD $72 $47
    push hl                                       ;; 1E:44D2 $E5
    call func_01E_47F6                            ;; 1E:44D3 $CD $F6 $47
    pop  hl                                       ;; 1E:44D6 $E1

label_01E_44D7:
jr_01E_44D7:
    dec  l                                        ;; 1E:44D7 $2D
    dec  l                                        ;; 1E:44D8 $2D
    jp   label_01E_4752                           ;; 1E:44D9 $C3 $52 $47

label_01E_44DC:
    dec  l                                        ;; 1E:44DC $2D
    dec  l                                        ;; 1E:44DD $2D
    dec  l                                        ;; 1E:44DE $2D
    dec  l                                        ;; 1E:44DF $2D
    call func_01E_4493                            ;; 1E:44E0 $CD $93 $44

jr_01E_44E3:
    ld   a, l                                     ;; 1E:44E3 $7D
    add  $04                                      ;; 1E:44E4 $C6 $04
    ld   e, a                                     ;; 1E:44E6 $5F
    ld   d, h                                     ;; 1E:44E7 $54
    call func_01E_43AF                            ;; 1E:44E8 $CD $AF $43
    cp   $00                                      ;; 1E:44EB $FE $00
    jr   z, jr_01E_450E                           ;; 1E:44ED $28 $1F

    cp   $FF                                      ;; 1E:44EF $FE $FF
    jr   z, .jr_44F7                              ;; 1E:44F1 $28 $04

    inc  l                                        ;; 1E:44F3 $2C
    jp   label_01E_45A3                           ;; 1E:44F4 $C3 $A3 $45

.jr_44F7
    dec  l                                        ;; 1E:44F7 $2D
    push hl                                       ;; 1E:44F8 $E5
    call func_01E_4493                            ;; 1E:44F9 $CD $93 $44
    call func_01E_449C                            ;; 1E:44FC $CD $9C $44
    ld   e, a                                     ;; 1E:44FF $5F
    call func_01E_4487                            ;; 1E:4500 $CD $87 $44
    call func_01E_449C                            ;; 1E:4503 $CD $9C $44
    ld   d, a                                     ;; 1E:4506 $57
    pop  hl                                       ;; 1E:4507 $E1
    ld   a, e                                     ;; 1E:4508 $7B
    ld   [hl+], a                                 ;; 1E:4509 $22
    ld   a, d                                     ;; 1E:450A $7A
    ld   [hl-], a                                 ;; 1E:450B $32
    jr   jr_01E_44E3                              ;; 1E:450C $18 $D5

jr_01E_450E:
    ld   a, [wD3CA]                               ;; 1E:450E $FA $CA $D3
    cp   $15                                      ;; 1E:4511 $FE $15
    jp   z, ContinueCurrentScreenMusic_1E         ;; 1E:4513 $CA $54 $48

    ld   hl, wActiveMusicIndex                    ;; 1E:4516 $21 $69 $D3
    ld   [hl], $00                                ;; 1E:4519 $36 $00
    call func_01E_4137                            ;; 1E:451B $CD $37 $41
    ret                                           ;; 1E:451E $C9

label_01E_451F:
    call func_01E_4487                            ;; 1E:451F $CD $87 $44
    call func_01E_449C                            ;; 1E:4522 $CD $9C $44
    ld   [wMusicSpeedPointer], a                  ;; 1E:4525 $EA $01 $D3
    call func_01E_4487                            ;; 1E:4528 $CD $87 $44
    call func_01E_449C                            ;; 1E:452B $CD $9C $44
    ld   [wMusicSpeedPointer+1], a                ;; 1E:452E $EA $02 $D3
    jr   jr_01E_453C                              ;; 1E:4531 $18 $09

label_01E_4533:
    call func_01E_4487                            ;; 1E:4533 $CD $87 $44
    call func_01E_449C                            ;; 1E:4536 $CD $9C $44
    ld   [wMusicTranspose], a                     ;; 1E:4539 $EA $00 $D3

jr_01E_453C:
    call func_01E_4487                            ;; 1E:453C $CD $87 $44
    jr   jr_01E_45A5                              ;; 1E:453F $18 $64

label_01E_4541:
    call func_01E_4487                            ;; 1E:4541 $CD $87 $44
    call func_01E_449C                            ;; 1E:4544 $CD $9C $44
    push hl                                       ;; 1E:4547 $E5
    ld   a, l                                     ;; 1E:4548 $7D
    add  $0B                                      ;; 1E:4549 $C6 $0B
    ld   l, a                                     ;; 1E:454B $6F
    ld   c, [hl]                                  ;; 1E:454C $4E
    ld   a, b                                     ;; 1E:454D $78
    or   c                                        ;; 1E:454E $B1
    ld   [hl], a                                  ;; 1E:454F $77
    ld   b, h                                     ;; 1E:4550 $44
    ld   c, l                                     ;; 1E:4551 $4D
    dec  c                                        ;; 1E:4552 $0D
    dec  c                                        ;; 1E:4553 $0D
    pop  hl                                       ;; 1E:4554 $E1
    ld   a, [hl+]                                 ;; 1E:4555 $2A
    ld   e, a                                     ;; 1E:4556 $5F
    ld   a, [hl-]                                 ;; 1E:4557 $3A
    ld   d, a                                     ;; 1E:4558 $57
    inc  de                                       ;; 1E:4559 $13
    ld   a, e                                     ;; 1E:455A $7B
    ld   [hl+], a                                 ;; 1E:455B $22
    ld   a, d                                     ;; 1E:455C $7A
    ld   [hl-], a                                 ;; 1E:455D $32
    ld   a, d                                     ;; 1E:455E $7A
    ld   [bc], a                                  ;; 1E:455F $02
    dec  c                                        ;; 1E:4560 $0D
    ld   a, e                                     ;; 1E:4561 $7B
    ld   [bc], a                                  ;; 1E:4562 $02
    jr   jr_01E_45A5                              ;; 1E:4563 $18 $40

label_01E_4565:
    push hl                                       ;; 1E:4565 $E5
    ld   a, l                                     ;; 1E:4566 $7D
    add  $0B                                      ;; 1E:4567 $C6 $0B
    ld   l, a                                     ;; 1E:4569 $6F
    ld   a, [hl]                                  ;; 1E:456A $7E
    dec  [hl]                                     ;; 1E:456B $35
    ld   a, [hl]                                  ;; 1E:456C $7E
    and  $7F                                      ;; 1E:456D $E6 $7F
    jr   z, .jr_457E                              ;; 1E:456F $28 $0D

    ld   b, h                                     ;; 1E:4571 $44
    ld   c, l                                     ;; 1E:4572 $4D
    dec  c                                        ;; 1E:4573 $0D
    dec  c                                        ;; 1E:4574 $0D
    dec  c                                        ;; 1E:4575 $0D
    pop  hl                                       ;; 1E:4576 $E1
    ld   a, [bc]                                  ;; 1E:4577 $0A
    ld   [hl+], a                                 ;; 1E:4578 $22
    inc  c                                        ;; 1E:4579 $0C
    ld   a, [bc]                                  ;; 1E:457A $0A
    ld   [hl-], a                                 ;; 1E:457B $32
    jr   jr_01E_45A5                              ;; 1E:457C $18 $27

.jr_457E
    pop  hl                                       ;; 1E:457E $E1
    jr   jr_01E_453C                              ;; 1E:457F $18 $BB

func_01E_4581::
    ld   hl, wActiveMusicIndex                    ;; 1E:4581 $21 $69 $D3
    ld   a, [hl]                                  ;; 1E:4584 $7E
    and  a                                        ;; 1E:4585 $A7
    ret  z                                        ;; 1E:4586 $C8

    ld   a, [wActiveMusicTable]                   ;; 1E:4587 $FA $CE $D3
    and  a                                        ;; 1E:458A $A7
    jp   nz, DontPlayAudio_1E                     ;; 1E:458B $C2 $2B $40

    call func_01E_4387                            ;; 1E:458E $CD $87 $43

    ld   a, $01                                   ;; 1E:4591 $3E $01
    ld   [wActiveChannelIndex], a                 ;; 1E:4593 $EA $50 $D3
    ld   hl, wD310                                ;; 1E:4596 $21 $10 $D3

label_01E_4599:
    inc  l                                        ;; 1E:4599 $2C
    ld   a, [hl+]                                 ;; 1E:459A $2A
    and  a                                        ;; 1E:459B $A7
    jp   z, label_01E_44D7                        ;; 1E:459C $CA $D7 $44

    dec  [hl]                                     ;; 1E:459F $35
    jp   nz, label_01E_44A6                       ;; 1E:45A0 $C2 $A6 $44

label_01E_45A3:
    inc  l                                        ;; 1E:45A3 $2C
    inc  l                                        ;; 1E:45A4 $2C

label_01E_45A5:
jr_01E_45A5:
    call func_01E_449C                            ;; 1E:45A5 $CD $9C $44
    cp   $00                                      ;; 1E:45A8 $FE $00
    jp   z, label_01E_44DC                        ;; 1E:45AA $CA $DC $44

    cp   $9D                                      ;; 1E:45AD $FE $9D
    jp   z, label_01E_4457                        ;; 1E:45AF $CA $57 $44

    cp   $9E                                      ;; 1E:45B2 $FE $9E
    jp   z, label_01E_451F                        ;; 1E:45B4 $CA $1F $45

    cp   $9F                                      ;; 1E:45B7 $FE $9F
    jp   z, label_01E_4533                        ;; 1E:45B9 $CA $33 $45

    cp   $9B                                      ;; 1E:45BC $FE $9B
    jp   z, label_01E_4541                        ;; 1E:45BE $CA $41 $45

    cp   $9C                                      ;; 1E:45C1 $FE $9C
    jp   z, label_01E_4565                        ;; 1E:45C3 $CA $65 $45

    cp   $99                                      ;; 1E:45C6 $FE $99
    jp   z, label_01E_486E                        ;; 1E:45C8 $CA $6E $48

    cp   $9A                                      ;; 1E:45CB $FE $9A
    jp   z, label_01E_4879                        ;; 1E:45CD $CA $79 $48

    cp   $94                                      ;; 1E:45D0 $FE $94
    jp   z, label_01E_48B8                        ;; 1E:45D2 $CA $B8 $48

    cp   $97                                      ;; 1E:45D5 $FE $97
    jp   z, label_01E_48ED                        ;; 1E:45D7 $CA $ED $48

    cp   $98                                      ;; 1E:45DA $FE $98
    jp   z, label_01E_48FC                        ;; 1E:45DC $CA $FC $48

    cp   $96                                      ;; 1E:45DF $FE $96
    jp   z, label_01E_4860                        ;; 1E:45E1 $CA $60 $48

    cp   $95                                      ;; 1E:45E4 $FE $95
    jp   z, label_01E_486B                        ;; 1E:45E6 $CA $6B $48

    and  $F0                                      ;; 1E:45E9 $E6 $F0
    cp   $A0                                      ;; 1E:45EB $FE $A0
    jr   nz, jr_01E_463C                          ;; 1E:45ED $20 $4D

    ld   a, b                                     ;; 1E:45EF $78
    and  $0F                                      ;; 1E:45F0 $E6 $0F
    ld   c, a                                     ;; 1E:45F2 $4F
    ld   b, $00                                   ;; 1E:45F3 $06 $00
    push hl                                       ;; 1E:45F5 $E5
    ld   de, wMusicSpeedPointer                   ;; 1E:45F6 $11 $01 $D3
    ld   a, [de]                                  ;; 1E:45F9 $1A
    ld   l, a                                     ;; 1E:45FA $6F
    inc  e                                        ;; 1E:45FB $1C
    ld   a, [de]                                  ;; 1E:45FC $1A
    ld   h, a                                     ;; 1E:45FD $67
    add  hl, bc                                   ;; 1E:45FE $09
    ld   a, [hl]                                  ;; 1E:45FF $7E
    pop  hl                                       ;; 1E:4600 $E1
    push hl                                       ;; 1E:4601 $E5
    ld   d, a                                     ;; 1E:4602 $57
    inc  l                                        ;; 1E:4603 $2C
    inc  l                                        ;; 1E:4604 $2C
    inc  l                                        ;; 1E:4605 $2C
    ld   a, [hl]                                  ;; 1E:4606 $7E
    and  $F0                                      ;; 1E:4607 $E6 $F0
    jr   nz, .jr_460E                             ;; 1E:4609 $20 $03

    ld   a, d                                     ;; 1E:460B $7A
    jr   jr_01E_4633                              ;; 1E:460C $18 $25

.jr_460E
    ld   e, a                                     ;; 1E:460E $5F
    ld   a, d                                     ;; 1E:460F $7A
    push af                                       ;; 1E:4610 $F5
    srl  a                                        ;; 1E:4611 $CB $3F
    sla  e                                        ;; 1E:4613 $CB $23
    jr   c, .jr_461F                              ;; 1E:4615 $38 $08

    ld   d, a                                     ;; 1E:4617 $57
    srl  a                                        ;; 1E:4618 $CB $3F
    sla  e                                        ;; 1E:461A $CB $23
    jr   c, .jr_461F                              ;; 1E:461C $38 $01

    add  d                                        ;; 1E:461E $82

.jr_461F
    ld   c, a                                     ;; 1E:461F $4F
    and  a                                        ;; 1E:4620 $A7
    jr   nz, .jr_4625                             ;; 1E:4621 $20 $02

    ld   c, $02                                   ;; 1E:4623 $0E $02

.jr_4625
    ld   de, wActiveChannelIndex                  ;; 1E:4625 $11 $50 $D3
    ld   a, [de]                                  ;; 1E:4628 $1A
    dec  a                                        ;; 1E:4629 $3D
    ld   e, a                                     ;; 1E:462A $5F
    ld   d, $00                                   ;; 1E:462B $16 $00
    ld   hl, wD307                                ;; 1E:462D $21 $07 $D3
    add  hl, de                                   ;; 1E:4630 $19
    ld   [hl], c                                  ;; 1E:4631 $71
    pop  af                                       ;; 1E:4632 $F1

jr_01E_4633:
    pop  hl                                       ;; 1E:4633 $E1
    dec  l                                        ;; 1E:4634 $2D
    ld   [hl+], a                                 ;; 1E:4635 $22
    call func_01E_4487                            ;; 1E:4636 $CD $87 $44
    call func_01E_449C                            ;; 1E:4639 $CD $9C $44

jr_01E_463C:
    ld   a, [wActiveChannelIndex]                 ;; 1E:463C $FA $50 $D3
    cp   $04                                      ;; 1E:463F $FE $04
    jr   z, jr_01E_467B                           ;; 1E:4641 $28 $38

    push de                                       ;; 1E:4643 $D5
    ld   de, wD3B0                                ;; 1E:4644 $11 $B0 $D3
    call func_01E_493C                            ;; 1E:4647 $CD $3C $49
    xor  a                                        ;; 1E:464A $AF
    ld   [de], a                                  ;; 1E:464B $12
    inc  e                                        ;; 1E:464C $1C
    ld   [de], a                                  ;; 1E:464D $12
    ld   de, wD3B6                                ;; 1E:464E $11 $B6 $D3
    call func_01E_493C                            ;; 1E:4651 $CD $3C $49
    inc  e                                        ;; 1E:4654 $1C
    xor  a                                        ;; 1E:4655 $AF
    ld   [de], a                                  ;; 1E:4656 $12
    ld   a, [wActiveChannelIndex]                 ;; 1E:4657 $FA $50 $D3
    cp   $03                                      ;; 1E:465A $FE $03
    jr   nz, jr_01E_467A                          ;; 1E:465C $20 $1C

    ld   de, wD39E                                ;; 1E:465E $11 $9E $D3
    ld   a, [de]                                  ;; 1E:4661 $1A
    and  a                                        ;; 1E:4662 $A7
    jr   z, .jr_466C                              ;; 1E:4663 $28 $07

    ld   a, $01                                   ;; 1E:4665 $3E $01
    ld   [de], a                                  ;; 1E:4667 $12
    xor  a                                        ;; 1E:4668 $AF
    ld   [wD39F], a                               ;; 1E:4669 $EA $9F $D3

.jr_466C
    ld   de, wActiveMusicTableIndex               ;; 1E:466C $11 $D9 $D3
    ld   a, [de]                                  ;; 1E:466F $1A
    and  a                                        ;; 1E:4670 $A7
    jr   z, jr_01E_467A                           ;; 1E:4671 $28 $07

    ld   a, $01                                   ;; 1E:4673 $3E $01
    ld   [de], a                                  ;; 1E:4675 $12
    xor  a                                        ;; 1E:4676 $AF
    ld   [wD3DA], a                               ;; 1E:4677 $EA $DA $D3

jr_01E_467A:
    pop  de                                       ;; 1E:467A $D1

jr_01E_467B:
    ld   c, b                                     ;; 1E:467B $48
    ld   b, $00                                   ;; 1E:467C $06 $00
    call func_01E_4487                            ;; 1E:467E $CD $87 $44
    ld   a, [wActiveChannelIndex]                 ;; 1E:4681 $FA $50 $D3
    cp   $04                                      ;; 1E:4684 $FE $04
    jp   z, label_01E_46BD                        ;; 1E:4686 $CA $BD $46

    push hl                                       ;; 1E:4689 $E5
    ld   a, l                                     ;; 1E:468A $7D
    add  $05                                      ;; 1E:468B $C6 $05
    ld   l, a                                     ;; 1E:468D $6F
    ld   e, l                                     ;; 1E:468E $5D
    ld   d, h                                     ;; 1E:468F $54
    inc  l                                        ;; 1E:4690 $2C
    inc  l                                        ;; 1E:4691 $2C
    ld   a, c                                     ;; 1E:4692 $79
    cp   $01                                      ;; 1E:4693 $FE $01
    jr   z, jr_01E_46B8                           ;; 1E:4695 $28 $21

    ld   [hl], $00                                ;; 1E:4697 $36 $00
    ld   a, [wMusicTranspose]                     ;; 1E:4699 $FA $00 $D3
    and  a                                        ;; 1E:469C $A7
    jr   z, jr_01E_46AB                           ;; 1E:469D $28 $0C

    ld   l, a                                     ;; 1E:469F $6F
    ld   h, $00                                   ;; 1E:46A0 $26 $00
    bit  7, l                                     ;; 1E:46A2 $CB $7D
    jr   z, .jr_46A8                              ;; 1E:46A4 $28 $02

    ld   h, $FF                                   ;; 1E:46A6 $26 $FF

.jr_46A8
    add  hl, bc                                   ;; 1E:46A8 $09
    ld   b, h                                     ;; 1E:46A9 $44
    ld   c, l                                     ;; 1E:46AA $4D

jr_01E_46AB:
    ld   hl, Data_01E_49BF                        ;; 1E:46AB $21 $BF $49
    add  hl, bc                                   ;; 1E:46AE $09
    ld   a, [hl+]                                 ;; 1E:46AF $2A
    ld   [de], a                                  ;; 1E:46B0 $12
    inc  e                                        ;; 1E:46B1 $1C
    ld   a, [hl]                                  ;; 1E:46B2 $7E
    ld   [de], a                                  ;; 1E:46B3 $12
    pop  hl                                       ;; 1E:46B4 $E1
    jp   label_01E_46EE                           ;; 1E:46B5 $C3 $EE $46

jr_01E_46B8:
    ld   [hl], $01                                ;; 1E:46B8 $36 $01
    pop  hl                                       ;; 1E:46BA $E1
    jr   jr_01E_46EE                              ;; 1E:46BB $18 $31

label_01E_46BD:
    push hl                                       ;; 1E:46BD $E5
    ld   a, c                                     ;; 1E:46BE $79
    cp   $FF                                      ;; 1E:46BF $FE $FF
    jr   z, jr_01E_46DB                           ;; 1E:46C1 $28 $18

    ld   de, wD346                                ;; 1E:46C3 $11 $46 $D3
    ld   hl, Data_01E_4A51                        ;; 1E:46C6 $21 $51 $4A
    add  hl, bc                                   ;; 1E:46C9 $09

.loop
    ld   a, [hl+]                                 ;; 1E:46CA $2A
    ld   [de], a                                  ;; 1E:46CB $12
    inc  e                                        ;; 1E:46CC $1C
    ld   a, e                                     ;; 1E:46CD $7B
    cp   LOW(wD346 + 5)                           ;; 1E:46CE $FE $4B
    jr   nz, .loop                                ;; 1E:46D0 $20 $F8

    ld   c, $20                                   ;; 1E:46D2 $0E $20
    ld   hl, wD344                                ;; 1E:46D4 $21 $44 $D3
    ld   b, $00                                   ;; 1E:46D7 $06 $00
    jr   jr_01E_471C                              ;; 1E:46D9 $18 $41

jr_01E_46DB:
    ld   a, [wD34F]                               ;; 1E:46DB $FA $4F $D3
    bit  7, a                                     ;; 1E:46DE $CB $7F
    jp   nz, label_01E_474D                       ;; 1E:46E0 $C2 $4D $47

    ld   a, $01                                   ;; 1E:46E3 $3E $01
    ld   [wActiveNoiseSfx], a                     ;; 1E:46E5 $EA $78 $D3
    call func_01E_403F                            ;; 1E:46E8 $CD $3F $40
    jp   label_01E_474D                           ;; 1E:46EB $C3 $4D $47

label_01E_46EE:
jr_01E_46EE:
    push hl                                       ;; 1E:46EE $E5
    ld   b, $00                                   ;; 1E:46EF $06 $00
    ld   a, [wActiveChannelIndex]                 ;; 1E:46F1 $FA $50 $D3
    cp   $01                                      ;; 1E:46F4 $FE $01
    jr   z, jr_01E_4719                           ;; 1E:46F6 $28 $21

    cp   $02                                      ;; 1E:46F8 $FE $02
    jr   z, jr_01E_4715                           ;; 1E:46FA $28 $19

    ld   c, $1A                                   ;; 1E:46FC $0E $1A
    ld   a, [wD330 + $0F]                         ;; 1E:46FE $FA $3F $D3
    bit  7, a                                     ;; 1E:4701 $CB $7F
    jr   nz, .jr_470A                             ;; 1E:4703 $20 $05

    xor  a                                        ;; 1E:4705 $AF
    ldh  [c], a                                   ;; 1E:4706 $E2
    ld   a, $80                                   ;; 1E:4707 $3E $80
    ldh  [c], a                                   ;; 1E:4709 $E2

.jr_470A
    inc  c                                        ;; 1E:470A $0C
    inc  l                                        ;; 1E:470B $2C
    inc  l                                        ;; 1E:470C $2C
    inc  l                                        ;; 1E:470D $2C
    inc  l                                        ;; 1E:470E $2C
    ld   a, [hl+]                                 ;; 1E:470F $2A
    ld   e, a                                     ;; 1E:4710 $5F
    ld   d, $00                                   ;; 1E:4711 $16 $00
    jr   jr_01E_4723                              ;; 1E:4713 $18 $0E

jr_01E_4715:
    ld   c, $16                                   ;; 1E:4715 $0E $16
    jr   jr_01E_471C                              ;; 1E:4717 $18 $03

jr_01E_4719:
    ld   c, $10                                   ;; 1E:4719 $0E $10
    inc  c                                        ;; 1E:471B $0C

jr_01E_471C:
    inc  l                                        ;; 1E:471C $2C
    inc  l                                        ;; 1E:471D $2C
    ld   a, [hl+]                                 ;; 1E:471E $2A
    ld   e, a                                     ;; 1E:471F $5F
    inc  l                                        ;; 1E:4720 $2C
    ld   a, [hl+]                                 ;; 1E:4721 $2A
    ld   d, a                                     ;; 1E:4722 $57

jr_01E_4723:
    push hl                                       ;; 1E:4723 $E5
    inc  l                                        ;; 1E:4724 $2C
    inc  l                                        ;; 1E:4725 $2C
    ld   a, [hl+]                                 ;; 1E:4726 $2A
    and  a                                        ;; 1E:4727 $A7
    jr   z, .jr_472C                              ;; 1E:4728 $28 $02

    ld   e, $08                                   ;; 1E:472A $1E $08

.jr_472C
    inc  l                                        ;; 1E:472C $2C
    inc  l                                        ;; 1E:472D $2C
    ld   [hl], $00                                ;; 1E:472E $36 $00
    inc  l                                        ;; 1E:4730 $2C
    ld   a, [hl]                                  ;; 1E:4731 $7E
    pop  hl                                       ;; 1E:4732 $E1
    bit  7, a                                     ;; 1E:4733 $CB $7F
    jr   nz, jr_01E_474D                          ;; 1E:4735 $20 $16

    ld   a, [wActiveChannelIndex]                 ;; 1E:4737 $FA $50 $D3
    cp   $03                                      ;; 1E:473A $FE $03
    jp   z, label_01E_432F                        ;; 1E:473C $CA $2F $43

label_01E_473F:
    ld   a, d                                     ;; 1E:473F $7A
    or   b                                        ;; 1E:4740 $B0
    ldh  [c], a                                   ;; 1E:4741 $E2
    inc  c                                        ;; 1E:4742 $0C
    ld   a, e                                     ;; 1E:4743 $7B
    ldh  [c], a                                   ;; 1E:4744 $E2
    inc  c                                        ;; 1E:4745 $0C
    ld   a, [hl+]                                 ;; 1E:4746 $2A
    ldh  [c], a                                   ;; 1E:4747 $E2
    inc  c                                        ;; 1E:4748 $0C
    ld   a, [hl]                                  ;; 1E:4749 $7E
    or   $80                                      ;; 1E:474A $F6 $80
    ldh  [c], a                                   ;; 1E:474C $E2

label_01E_474D:
jr_01E_474D:
    pop  hl                                       ;; 1E:474D $E1
    dec  l                                        ;; 1E:474E $2D
    ld   a, [hl-]                                 ;; 1E:474F $3A
    ld   [hl-], a                                 ;; 1E:4750 $32
    dec  l                                        ;; 1E:4751 $2D

label_01E_4752:
    ld   de, wActiveChannelIndex                  ;; 1E:4752 $11 $50 $D3
    ld   a, [de]                                  ;; 1E:4755 $1A
    cp   $04                                      ;; 1E:4756 $FE $04
    jr   z, .jr_4763                              ;; 1E:4758 $28 $09

    inc  a                                        ;; 1E:475A $3C
    ld   [de], a                                  ;; 1E:475B $12
    ld   a, $10                                   ;; 1E:475C $3E $10
    add  l                                        ;; 1E:475E $85
    ld   l, a                                     ;; 1E:475F $6F
    jp   label_01E_4599                           ;; 1E:4760 $C3 $99 $45

.jr_4763
    ld   hl, wD31E                                ;; 1E:4763 $21 $1E $D3
    inc  [hl]                                     ;; 1E:4766 $34
    ld   hl, wD320 + $0E                          ;; 1E:4767 $21 $2E $D3
    inc  [hl]                                     ;; 1E:476A $34
    ld   hl, wD330 + $0E                          ;; 1E:476B $21 $3E $D3
    inc  [hl]                                     ;; 1E:476E $34
    ret                                           ;; 1E:476F $C9

label_01E_4770:
    pop  hl                                       ;; 1E:4770 $E1
    ret                                           ;; 1E:4771 $C9

func_01E_4772::
    push hl                                       ;; 1E:4772 $E5
    ld   a, l                                     ;; 1E:4773 $7D
    add  $06                                      ;; 1E:4774 $C6 $06
    ld   l, a                                     ;; 1E:4776 $6F
    ld   a, [hl]                                  ;; 1E:4777 $7E
    and  $0F                                      ;; 1E:4778 $E6 $0F
    jr   z, jr_01E_4794                           ;; 1E:477A $28 $18

    ld   [wD351], a                               ;; 1E:477C $EA $51 $D3
    ld   a, [wActiveChannelIndex]                 ;; 1E:477F $FA $50 $D3
    ld   c, $13                                   ;; 1E:4782 $0E $13
    cp   $01                                      ;; 1E:4784 $FE $01
    jr   z, jr_01E_47D6                           ;; 1E:4786 $28 $4E

    ld   c, $18                                   ;; 1E:4788 $0E $18
    cp   $02                                      ;; 1E:478A $FE $02
    jr   z, jr_01E_47D6                           ;; 1E:478C $28 $48

    ld   c, $1D                                   ;; 1E:478E $0E $1D
    cp   $03                                      ;; 1E:4790 $FE $03
    jr   z, jr_01E_47D6                           ;; 1E:4792 $28 $42

label_01E_4794:
jr_01E_4794:
    ld   a, [wActiveChannelIndex]                 ;; 1E:4794 $FA $50 $D3
    cp   $04                                      ;; 1E:4797 $FE $04
    jp   z, label_01E_4770                        ;; 1E:4799 $CA $70 $47

    ld   de, wD3B6                                ;; 1E:479C $11 $B6 $D3
    call func_01E_493C                            ;; 1E:479F $CD $3C $49
    ld   a, [de]                                  ;; 1E:47A2 $1A
    and  a                                        ;; 1E:47A3 $A7
    jp   z, label_01E_47BD                        ;; 1E:47A4 $CA $BD $47

    ld   a, [wActiveChannelIndex]                 ;; 1E:47A7 $FA $50 $D3
    ld   c, $13                                   ;; 1E:47AA $0E $13
    cp   $01                                      ;; 1E:47AC $FE $01
    jp   z, label_01E_4905                        ;; 1E:47AE $CA $05 $49

    ld   c, $18                                   ;; 1E:47B1 $0E $18
    cp   $02                                      ;; 1E:47B3 $FE $02
    jp   z, label_01E_4905                        ;; 1E:47B5 $CA $05 $49

    ld   c, $1D                                   ;; 1E:47B8 $0E $1D
    jp   label_01E_4905                           ;; 1E:47BA $C3 $05 $49

label_01E_47BD:
    ld   a, [wActiveChannelIndex]                 ;; 1E:47BD $FA $50 $D3
    cp   $03                                      ;; 1E:47C0 $FE $03
    jp   nz, label_01E_4770                       ;; 1E:47C2 $C2 $70 $47

    ld   a, [wD39E]                               ;; 1E:47C5 $FA $9E $D3
    and  a                                        ;; 1E:47C8 $A7
    jp   nz, label_01E_4882                       ;; 1E:47C9 $C2 $82 $48

    ld   a, [wActiveMusicTableIndex]              ;; 1E:47CC $FA $D9 $D3
    and  a                                        ;; 1E:47CF $A7
    jp   nz, label_01E_48C3                       ;; 1E:47D0 $C2 $C3 $48

    jp   label_01E_4770                           ;; 1E:47D3 $C3 $70 $47

jr_01E_47D6:
    inc  l                                        ;; 1E:47D6 $2C
    ld   a, [hl+]                                 ;; 1E:47D7 $2A
    ld   e, a                                     ;; 1E:47D8 $5F
    ld   a, [hl]                                  ;; 1E:47D9 $7E
    and  $0F                                      ;; 1E:47DA $E6 $0F
    ld   d, a                                     ;; 1E:47DC $57
    push de                                       ;; 1E:47DD $D5
    ld   a, l                                     ;; 1E:47DE $7D
    add  $04                                      ;; 1E:47DF $C6 $04
    ld   l, a                                     ;; 1E:47E1 $6F
    ld   b, [hl]                                  ;; 1E:47E2 $46
    ld   a, [wD351]                               ;; 1E:47E3 $FA $51 $D3
    cp   $01                                      ;; 1E:47E6 $FE $01
    jp   z, label_01E_4952                        ;; 1E:47E8 $CA $52 $49

    ld   hl, $FFFF                                ;; 1E:47EB $21 $FF $FF
    pop  de                                       ;; 1E:47EE $D1
    add  hl, de                                   ;; 1E:47EF $19
    call func_01E_492B                            ;; 1E:47F0 $CD $2B $49
    jp   label_01E_4794                           ;; 1E:47F3 $C3 $94 $47

func_01E_47F6::
    ld   a, [wD31B]                               ;; 1E:47F6 $FA $1B $D3
    and  a                                        ;; 1E:47F9 $A7
    jr   nz, .jr_481D                             ;; 1E:47FA $20 $21

    ld   a, [wD317]                               ;; 1E:47FC $FA $17 $D3
    and  a                                        ;; 1E:47FF $A7
    jr   z, .jr_481D                              ;; 1E:4800 $28 $1B

    and  $0F                                      ;; 1E:4802 $E6 $0F
    ld   b, a                                     ;; 1E:4804 $47
    ld   hl, wD307                                ;; 1E:4805 $21 $07 $D3
    ld   a, [wD31E]                               ;; 1E:4808 $FA $1E $D3
    cp   [hl]                                     ;; 1E:480B $BE
    jr   nz, .jr_481D                             ;; 1E:480C $20 $0F

    ld   c, $12                                   ;; 1E:480E $0E $12
    ld   de, wD31A                                ;; 1E:4810 $11 $1A $D3
    ld   a, [wD31F]                               ;; 1E:4813 $FA $1F $D3
    bit  7, a                                     ;; 1E:4816 $CB $7F
    jr   nz, .jr_481D                             ;; 1E:4818 $20 $03

    call func_01E_4841                            ;; 1E:481A $CD $41 $48

.jr_481D
    ld   a, [wD320 + $0B]                         ;; 1E:481D $FA $2B $D3
    and  a                                        ;; 1E:4820 $A7
    ret  nz                                       ;; 1E:4821 $C0

    ld   a, [wD320 + $07]                         ;; 1E:4822 $FA $27 $D3
    and  a                                        ;; 1E:4825 $A7
    ret  z                                        ;; 1E:4826 $C8

    and  $0F                                      ;; 1E:4827 $E6 $0F
    ld   b, a                                     ;; 1E:4829 $47
    ld   hl, wD308                                ;; 1E:482A $21 $08 $D3
    ld   a, [wD320 + $0E]                         ;; 1E:482D $FA $2E $D3
    cp   [hl]                                     ;; 1E:4830 $BE
    ret  nz                                       ;; 1E:4831 $C0

    ld   a, [wD320 + $0F]                         ;; 1E:4832 $FA $2F $D3
    bit  7, a                                     ;; 1E:4835 $CB $7F
    ret  nz                                       ;; 1E:4837 $C0

    ld   c, $17                                   ;; 1E:4838 $0E $17
    ld   de, wD320 + $0A                          ;; 1E:483A $11 $2A $D3
    call func_01E_4841                            ;; 1E:483D $CD $41 $48
    ret                                           ;; 1E:4840 $C9

func_01E_4841::
    push bc                                       ;; 1E:4841 $C5
    dec  b                                        ;; 1E:4842 $05
    ld   c, b                                     ;; 1E:4843 $48
    ld   b, $00                                   ;; 1E:4844 $06 $00
    ld   hl, HardcodedData_1e_4b15                ;; 1E:4846 $21 $15 $4B
    add  hl, bc                                   ;; 1E:4849 $09
    ld   a, [hl]                                  ;; 1E:484A $7E
    pop  bc                                       ;; 1E:484B $C1
    ldh  [c], a                                   ;; 1E:484C $E2
    inc  c                                        ;; 1E:484D $0C
    inc  c                                        ;; 1E:484E $0C
    ld   a, [de]                                  ;; 1E:484F $1A
    or   $80                                      ;; 1E:4850 $F6 $80
    ldh  [c], a                                   ;; 1E:4852 $E2
    ret                                           ;; 1E:4853 $C9

ContinueCurrentScreenMusic_1E:
    xor  a                                        ;; 1E:4854 $AF
    ld   [wActiveMusicTable], a                   ;; 1E:4855 $EA $CE $D3
    ldh  a, [hNextDefaultMusicTrack]              ;; 1E:4858 $F0 $BF
    ld   [wMusicTrackToPlay], a                   ;; 1E:485A $EA $68 $D3
    jp   PlayMusicTrack_1E_EntryPoint             ;; 1E:485D $C3 $1E $40

label_01E_4860:
    ld   a, $01                                   ;; 1E:4860 $3E $01

jr_01E_4862:
    ld   [wD3CD], a                               ;; 1E:4862 $EA $CD $D3
    call func_01E_4487                            ;; 1E:4865 $CD $87 $44
    jp   label_01E_45A5                           ;; 1E:4868 $C3 $A5 $45

label_01E_486B:
    xor  a                                        ;; 1E:486B $AF
    jr   jr_01E_4862                              ;; 1E:486C $18 $F4

label_01E_486E:
    ld   a, $01                                   ;; 1E:486E $3E $01

jr_01E_4870:
    ld   [wD39E], a                               ;; 1E:4870 $EA $9E $D3
    call func_01E_4487                            ;; 1E:4873 $CD $87 $44
    jp   label_01E_45A5                           ;; 1E:4876 $C3 $A5 $45

label_01E_4879:
    xor  a                                        ;; 1E:4879 $AF
    ld   [wActiveMusicTableIndex], a              ;; 1E:487A $EA $D9 $D3
    ld   [wD3DA], a                               ;; 1E:487D $EA $DA $D3
    jr   jr_01E_4870                              ;; 1E:4880 $18 $EE

label_01E_4882:
    cp   $02                                      ;; 1E:4882 $FE $02
    jp   z, label_01E_4770                        ;; 1E:4884 $CA $70 $47

    ld   bc, wD39F                                ;; 1E:4887 $01 $9F $D3
    call func_01E_48B4                            ;; 1E:488A $CD $B4 $48
    ld   c, $1C                                   ;; 1E:488D $0E $1C
    ld   b, $40                                   ;; 1E:488F $06 $40
    cp   $03                                      ;; 1E:4891 $FE $03
    jr   z, jr_01E_48AF                           ;; 1E:4893 $28 $1A

    ld   b, $60                                   ;; 1E:4895 $06 $60
    cp   $05                                      ;; 1E:4897 $FE $05
    jr   z, jr_01E_48AF                           ;; 1E:4899 $28 $14

    cp   $0A                                      ;; 1E:489B $FE $0A
    jr   z, jr_01E_48AF                           ;; 1E:489D $28 $10

    ld   b, $00                                   ;; 1E:489F $06 $00
    cp   $07                                      ;; 1E:48A1 $FE $07
    jr   z, jr_01E_48AF                           ;; 1E:48A3 $28 $0A

    cp   $0D                                      ;; 1E:48A5 $FE $0D
    jp   nz, label_01E_4770                       ;; 1E:48A7 $C2 $70 $47

    ld   a, $02                                   ;; 1E:48AA $3E $02
    ld   [wD39E], a                               ;; 1E:48AC $EA $9E $D3

label_01E_48AF:
jr_01E_48AF:
    ld   a, b                                     ;; 1E:48AF $78
    ldh  [c], a                                   ;; 1E:48B0 $E2
    jp   label_01E_4770                           ;; 1E:48B1 $C3 $70 $47

func_01E_48B4::
    ld   a, [bc]                                  ;; 1E:48B4 $0A
    inc  a                                        ;; 1E:48B5 $3C
    ld   [bc], a                                  ;; 1E:48B6 $02
    ret                                           ;; 1E:48B7 $C9

label_01E_48B8:
    ld   a, $01                                   ;; 1E:48B8 $3E $01
    ld   [wActiveMusicTableIndex], a              ;; 1E:48BA $EA $D9 $D3
    call func_01E_4487                            ;; 1E:48BD $CD $87 $44
    jp   label_01E_45A5                           ;; 1E:48C0 $C3 $A5 $45

label_01E_48C3:
    cp   $02                                      ;; 1E:48C3 $FE $02
    jp   z, label_01E_4770                        ;; 1E:48C5 $CA $70 $47

    ld   bc, wD3DA                                ;; 1E:48C8 $01 $DA $D3
    call func_01E_48B4                            ;; 1E:48CB $CD $B4 $48
    ld   c, $1C                                   ;; 1E:48CE $0E $1C
    ld   b, $60                                   ;; 1E:48D0 $06 $60
    cp   $03                                      ;; 1E:48D2 $FE $03
    jp   z, label_01E_48AF                        ;; 1E:48D4 $CA $AF $48

    ld   b, $40                                   ;; 1E:48D7 $06 $40
    cp   $05                                      ;; 1E:48D9 $FE $05
    jp   z, label_01E_48AF                        ;; 1E:48DB $CA $AF $48

    ld   b, $20                                   ;; 1E:48DE $06 $20
    cp   $06                                      ;; 1E:48E0 $FE $06
    jp   nz, label_01E_4770                       ;; 1E:48E2 $C2 $70 $47

    ld   a, $02                                   ;; 1E:48E5 $3E $02
    ld   [wActiveMusicTableIndex], a              ;; 1E:48E7 $EA $D9 $D3
    jp   label_01E_48AF                           ;; 1E:48EA $C3 $AF $48

label_01E_48ED:
    ld   de, wD3B6                                ;; 1E:48ED $11 $B6 $D3
    call func_01E_493C                            ;; 1E:48F0 $CD $3C $49
    ld   a, $01                                   ;; 1E:48F3 $3E $01

jr_01E_48F5:
    ld   [de], a                                  ;; 1E:48F5 $12
    call func_01E_4487                            ;; 1E:48F6 $CD $87 $44
    jp   label_01E_45A5                           ;; 1E:48F9 $C3 $A5 $45

label_01E_48FC:
    ld   de, wD3B6                                ;; 1E:48FC $11 $B6 $D3
    call func_01E_493C                            ;; 1E:48FF $CD $3C $49
    xor  a                                        ;; 1E:4902 $AF
    jr   jr_01E_48F5                              ;; 1E:4903 $18 $F0

label_01E_4905:
    inc  e                                        ;; 1E:4905 $1C
    ld   a, [de]                                  ;; 1E:4906 $1A
    and  a                                        ;; 1E:4907 $A7
    jr   nz, jr_01E_491B                          ;; 1E:4908 $20 $11

    inc  a                                        ;; 1E:490A $3C
    ld   [de], a                                  ;; 1E:490B $12
    pop  hl                                       ;; 1E:490C $E1
    push hl                                       ;; 1E:490D $E5
    call func_01E_4920                            ;; 1E:490E $CD $20 $49

jr_01E_4911:
    ld   hl, hLinkPhysicsModifier                 ;; 1E:4911 $21 $9C $FF
    add  hl, de                                   ;; 1E:4914 $19
    call func_01E_492B                            ;; 1E:4915 $CD $2B $49
    jp   label_01E_4770                           ;; 1E:4918 $C3 $70 $47

jr_01E_491B:
    call func_01E_4945                            ;; 1E:491B $CD $45 $49
    jr   jr_01E_4911                              ;; 1E:491E $18 $F1

func_01E_4920::
    ld   a, $07                                   ;; 1E:4920 $3E $07
    add  l                                        ;; 1E:4922 $85
    ld   l, a                                     ;; 1E:4923 $6F
    ld   a, [hl+]                                 ;; 1E:4924 $2A
    ld   e, a                                     ;; 1E:4925 $5F
    ld   a, [hl]                                  ;; 1E:4926 $7E
    and  $0F                                      ;; 1E:4927 $E6 $0F
    ld   d, a                                     ;; 1E:4929 $57
    ret                                           ;; 1E:492A $C9

func_01E_492B::
    ld   de, wD3A4                                ;; 1E:492B $11 $A4 $D3
    call func_01E_493C                            ;; 1E:492E $CD $3C $49
    ld   a, l                                     ;; 1E:4931 $7D
    ldh  [c], a                                   ;; 1E:4932 $E2
    ld   [de], a                                  ;; 1E:4933 $12
    inc  c                                        ;; 1E:4934 $0C
    inc  e                                        ;; 1E:4935 $1C
    ld   a, h                                     ;; 1E:4936 $7C
    and  $0F                                      ;; 1E:4937 $E6 $0F
    ldh  [c], a                                   ;; 1E:4939 $E2
    ld   [de], a                                  ;; 1E:493A $12
    ret                                           ;; 1E:493B $C9

func_01E_493C::
    ld   a, [wActiveChannelIndex]                 ;; 1E:493C $FA $50 $D3
    dec  a                                        ;; 1E:493F $3D
    sla  a                                        ;; 1E:4940 $CB $27
    add  e                                        ;; 1E:4942 $83
    ld   e, a                                     ;; 1E:4943 $5F
    ret                                           ;; 1E:4944 $C9

func_01E_4945::
    ld   de, wD3A4                                ;; 1E:4945 $11 $A4 $D3
    call func_01E_493C                            ;; 1E:4948 $CD $3C $49
    ld   a, [de]                                  ;; 1E:494B $1A
    ld   l, a                                     ;; 1E:494C $6F
    inc  e                                        ;; 1E:494D $1C
    ld   a, [de]                                  ;; 1E:494E $1A
    ld   d, a                                     ;; 1E:494F $57
    ld   e, l                                     ;; 1E:4950 $5D
    ret                                           ;; 1E:4951 $C9

label_01E_4952:
    pop  de                                       ;; 1E:4952 $D1
    ld   de, wD3B0                                ;; 1E:4953 $11 $B0 $D3
    call func_01E_493C                            ;; 1E:4956 $CD $3C $49
    ld   a, [de]                                  ;; 1E:4959 $1A
    inc  a                                        ;; 1E:495A $3C
    ld   [de], a                                  ;; 1E:495B $12
    inc  e                                        ;; 1E:495C $1C
    cp   $19                                      ;; 1E:495D $FE $19
    jr   z, jr_01E_4992                           ;; 1E:495F $28 $31

    cp   $2D                                      ;; 1E:4961 $FE $2D
    jr   z, jr_01E_498B                           ;; 1E:4963 $28 $26

    ld   a, [de]                                  ;; 1E:4965 $1A
    and  a                                        ;; 1E:4966 $A7
    jp   z, label_01E_4794                        ;; 1E:4967 $CA $94 $47

jr_01E_496A:
    dec  e                                        ;; 1E:496A $1D
    ld   a, [de]                                  ;; 1E:496B $1A
    sub  $19                                      ;; 1E:496C $D6 $19
    sla  a                                        ;; 1E:496E $CB $27
    ld   l, a                                     ;; 1E:4970 $6F
    ld   h, $00                                   ;; 1E:4971 $26 $00
    ld   de, Data_01E_4997                        ;; 1E:4973 $11 $97 $49
    add  hl, de                                   ;; 1E:4976 $19
    ld   a, [hl+]                                 ;; 1E:4977 $2A
    ld   d, a                                     ;; 1E:4978 $57
    ld   a, [hl]                                  ;; 1E:4979 $7E
    ld   e, a                                     ;; 1E:497A $5F
    pop  hl                                       ;; 1E:497B $E1
    push hl                                       ;; 1E:497C $E5
    push de                                       ;; 1E:497D $D5
    call func_01E_4920                            ;; 1E:497E $CD $20 $49
    ld   h, d                                     ;; 1E:4981 $62
    ld   l, e                                     ;; 1E:4982 $6B
    pop  de                                       ;; 1E:4983 $D1
    add  hl, de                                   ;; 1E:4984 $19
    call func_01E_492B                            ;; 1E:4985 $CD $2B $49
    jp   label_01E_4794                           ;; 1E:4988 $C3 $94 $47

jr_01E_498B:
    dec  e                                        ;; 1E:498B $1D
    ld   a, $19                                   ;; 1E:498C $3E $19
    ld   [de], a                                  ;; 1E:498E $12
    inc  e                                        ;; 1E:498F $1C
    jr   jr_01E_496A                              ;; 1E:4990 $18 $D8

jr_01E_4992:
    ld   a, $01                                   ;; 1E:4992 $3E $01
    ld   [de], a                                  ;; 1E:4994 $12
    jr   jr_01E_496A                              ;; 1E:4995 $18 $D3

Data_01E_4997::
    db   $00, $00, $00, $00, $00, $01, $00, $01   ;; 1E:4997
    db   $00, $02, $00, $02, $00, $00, $00, $00   ;; 1E:499F
    db   $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE   ;; 1E:49A7
    db   $00, $00, $00, $01, $00, $02, $00, $01   ;; 1E:49AF
    db   $00, $00, $FF, $FF, $FF, $FE, $FF, $FF   ;; 1E:49B7

Data_01E_49BF::
    db   $00, $0F, $2C, $00, $9C, $00, $06, $01   ;; 1E:49BF
    db   $6B, $01, $C9, $01, $23, $02, $77, $02   ;; 1E:49C7
    db   $C6, $02, $12, $03, $56, $03, $9B, $03   ;; 1E:49CF
    db   $DA, $03, $16, $04, $4E, $04, $83, $04   ;; 1E:49D7
    db   $B5, $04, $E5, $04, $11, $05, $3B, $05   ;; 1E:49DF
    db   $63, $05, $89, $05, $AC, $05, $CE, $05   ;; 1E:49E7
    db   $ED, $05, $0A, $06, $27, $06, $42, $06   ;; 1E:49EF
    db   $5B, $06, $72, $06, $89, $06, $9E, $06   ;; 1E:49F7
    db   $B2, $06, $C4, $06, $D6, $06, $E7, $06   ;; 1E:49FF
    db   $F7, $06, $06, $07, $14, $07, $21, $07   ;; 1E:4A07
    db   $2D, $07, $39, $07, $44, $07, $4F, $07   ;; 1E:4A0F
    db   $59, $07, $62, $07, $6B, $07, $74, $07   ;; 1E:4A17
    db   $7B, $07, $83, $07, $8A, $07, $90, $07   ;; 1E:4A1F
    db   $97, $07, $9D, $07, $A2, $07, $A7, $07   ;; 1E:4A27
    db   $AC, $07, $B1, $07, $B6, $07, $BA, $07   ;; 1E:4A2F
    db   $BE, $07, $C1, $07, $C5, $07, $C8, $07   ;; 1E:4A37
    db   $CB, $07, $CE, $07, $D1, $07, $D4, $07   ;; 1E:4A3F
    db   $D6, $07, $D9, $07, $DB, $07, $DD, $07   ;; 1E:4A47
    db   $DF, $07

Data_01E_4A51::
    db   $00, $00, $00, $00, $00, $C0, $09, $00   ;; 1E:4A51
    db   $38, $34, $C0, $19, $00, $38, $33, $C0   ;; 1E:4A59
    db   $46, $00, $13, $10, $C0, $23, $00, $20   ;; 1E:4A61
    db   $40, $80, $51, $00, $20, $07, $80, $A1   ;; 1E:4A69
    db   $00, $00, $18, $80, $F2, $00, $00, $18   ;; 1E:4A71
    db   $80, $81, $00, $3A, $10, $C0, $80, $00   ;; 1E:4A79
    db   $00, $10, $C0, $57, $00, $00, $60, $80   ;; 1E:4A81
    db   $10, $00, $00, $10, $80, $01, $02, $04   ;; 1E:4A89
    db   $08, $10, $20, $06, $0C, $18, $01, $01   ;; 1E:4A91
    db   $01, $01, $01, $30


include "data/music/music_tracks_data_1e_1.asm"


label_01E_4CFF:
    xor  a                                        ;; 1E:4CFF $AF
    ld   [wD379], a                               ;; 1E:4D00 $EA $79 $D3

.jr_4D03
    ld   [wD34F], a                               ;; 1E:4D03 $EA $4F $D3
    ld   [wD398], a                               ;; 1E:4D06 $EA $98 $D3
    ld   [wD393], a                               ;; 1E:4D09 $EA $93 $D3
    ld   [wD3C9], a                               ;; 1E:4D0C $EA $C9 $D3
    ld   [wD3A3], a                               ;; 1E:4D0F $EA $A3 $D3
    ld   [wD3E2+3], a                             ;; 1E:4D12 $EA $E5 $D3
    ld   a, $08                                   ;; 1E:4D15 $3E $08

.jr_4D17
    ldh  [rNR42], a                               ;; 1E:4D17 $E0 $21
    ld   a, $80                                   ;; 1E:4D19 $3E $80
    ldh  [rNR44], a                               ;; 1E:4D1B $E0 $23

label_01E_4D1D:
    ld   a, $FF                                   ;; 1E:4D1D $3E $FF
    ldh  [rNR51], a                               ;; 1E:4D1F $E0 $25
    ld   a, $03                                   ;; 1E:4D21 $3E $03
    ld   [wD355], a                               ;; 1E:4D23 $EA $55 $D3
    xor  a                                        ;; 1E:4D26 $AF
    ld   [wActiveMusicIndex], a                   ;; 1E:4D27 $EA $69 $D3

func_01E_4D2A::
    xor  a                                        ;; 1E:4D2A $AF
    ld   [wD361], a                               ;; 1E:4D2B $EA $61 $D3
    ld   [wD371], a                               ;; 1E:4D2E $EA $71 $D3
    ld   [wD31F], a                               ;; 1E:4D31 $EA $1F $D3
    ld   [wD320 + $0F], a                         ;; 1E:4D34 $EA $2F $D3
    ld   [wD330 + $0F], a                         ;; 1E:4D37 $EA $3F $D3
    ld   [wD39E], a                               ;; 1E:4D3A $EA $9E $D3
    ld   [wD39F], a                               ;; 1E:4D3D $EA $9F $D3
    ld   [wActiveMusicTableIndex], a              ;; 1E:4D40 $EA $D9 $D3
    ld   [wD3DA], a                               ;; 1E:4D43 $EA $DA $D3
    ld   [wD3B6], a                               ;; 1E:4D46 $EA $B6 $D3
    ld   [wD3B6+1], a                             ;; 1E:4D49 $EA $B7 $D3
    ld   [wD3B6+2], a                             ;; 1E:4D4C $EA $B8 $D3
    ld   [wD3B6+3], a                             ;; 1E:4D4F $EA $B9 $D3
    ld   [wD3B6+4], a                             ;; 1E:4D52 $EA $BA $D3
    ld   [wD3B6+5], a                             ;; 1E:4D55 $EA $BB $D3
    ld   [wD394], a                               ;; 1E:4D58 $EA $94 $D3
    ld   [wD394+1], a                             ;; 1E:4D5B $EA $95 $D3
    ld   [wD396], a                               ;; 1E:4D5E $EA $96 $D3
    ld   [wD390], a                               ;; 1E:4D61 $EA $90 $D3
    ld   [wD390+1], a                             ;; 1E:4D64 $EA $91 $D3
    ld   [wD392], a                               ;; 1E:4D67 $EA $92 $D3
    ld   [wD3C6], a                               ;; 1E:4D6A $EA $C6 $D3
    ld   [wD3C7], a                               ;; 1E:4D6D $EA $C7 $D3
    ld   [wD3C8], a                               ;; 1E:4D70 $EA $C8 $D3
    ld   [wD3A0], a                               ;; 1E:4D73 $EA $A0 $D3
    ld   [wD3A1], a                               ;; 1E:4D76 $EA $A1 $D3
    ld   [wD3A2], a                               ;; 1E:4D79 $EA $A2 $D3
    ld   [wD3CD], a                               ;; 1E:4D7C $EA $CD $D3
    ld   [wD3D6], a                               ;; 1E:4D7F $EA $D6 $D3
    ld   [wD3D7], a                               ;; 1E:4D82 $EA $D7 $D3
    ld   [wD3D7+1], a                             ;; 1E:4D85 $EA $D8 $D3
    ld   [wD3DC], a                               ;; 1E:4D88 $EA $DC $D3
    ld   [wD3E7], a                               ;; 1E:4D8B $EA $E7 $D3
    ld   [wD3E2], a                               ;; 1E:4D8E $EA $E2 $D3
    ld   [wD3E2+1], a                             ;; 1E:4D91 $EA $E3 $D3
    ld   [wD3E2+2], a                             ;; 1E:4D94 $EA $E4 $D3
    ld   a, $08                                   ;; 1E:4D97 $3E $08
    ldh  [rNR12], a                               ;; 1E:4D99 $E0 $12
    ldh  [rNR22], a                               ;; 1E:4D9B $E0 $17
    ld   a, $80                                   ;; 1E:4D9D $3E $80
    ldh  [rNR14], a                               ;; 1E:4D9F $E0 $14
    ldh  [rNR24], a                               ;; 1E:4DA1 $E0 $19
    xor  a                                        ;; 1E:4DA3 $AF
    ldh  [rNR10], a                               ;; 1E:4DA4 $E0 $10
    ldh  [rNR30], a                               ;; 1E:4DA6 $E0 $1A
    ret                                           ;; 1E:4DA8 $C9



