; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis


; Debug handlers?
    jp   label_01B_4009                           ;; 1B:4000 $C3 $09 $40

    jp   label_01B_4E2C                           ;; 1B:4003 $C3 $2C $4E

PlayMusicTrack_1B::
    jp   PlayMusicTrack_1B_EntryPoint             ;; 1B:4006 $C3 $1E $40

label_01B_4009:
    ld   hl, wMusicTranspose                      ;; 1B:4009 $21 $00 $D3

.loop_400C
    ld   [hl], $00                                ;; 1B:400C $36 $00
    inc  l                                        ;; 1B:400E $2C
    jr   nz, .loop_400C                           ;; 1B:400F $20 $FB

    ld   a, $80                                   ;; 1B:4011 $3E $80
    ldh  [rNR52], a                               ;; 1B:4013 $E0 $26
    ld   a, $77                                   ;; 1B:4015 $3E $77
    ldh  [rNR50], a                               ;; 1B:4017 $E0 $24
    ld   a, $FF                                   ;; 1B:4019 $3E $FF
    ldh  [rNR51], a                               ;; 1B:401B $E0 $25
    ret                                           ;; 1B:401D $C9

PlayMusicTrack_1B_EntryPoint::
    ld   hl, wMusicTrackToPlay                    ;; 1B:401E $21 $68 $D3
    ld   a, [hl+]                                 ;; 1B:4021 $2A
    and  a                                        ;; 1B:4022 $A7
    jr   nz, BeginMusicTrack_1B                   ;; 1B:4023 $20 $0C

    call func_01B_4037                            ;; 1B:4025 $CD $37 $40

jr_01B_4028:
    call UpdateAllMusicChannels_1B                ;; 1B:4028 $CD $0F $45
    ret                                           ;; 1B:402B $C9

DontPlayAudio_1B:
    xor  a                                        ;; 1B:402C $AF
    ld   [wActiveMusicTable], a                   ;; 1B:402D $EA $CE $D3
    ret                                           ;; 1B:4030 $C9

; Input:
;  hl   Points to data after "wMusicTrackToPlay"
BeginMusicTrack_1B::
    ; [wActiveMusicIndex] = [wMusicTrackToPlay]
    ld   [hl], a                                  ;; 1B:4031 $77
    call BeginMusicTrack_Dispatch_1B              ;; 1B:4032 $CD $3B $41
    jr   jr_01B_4028                              ;; 1B:4035 $18 $F1

func_01B_4037::
    ld   de, wD393                                ;; 1B:4037 $11 $93 $D3
    ld   hl, wActiveNoiseSfx                      ;; 1B:403A $21 $78 $D3
    ld   a, [hl+]                                 ;; 1B:403D $2A
    cp   $01                                      ;; 1B:403E $FE $01
    jr   z, .jr_4048                              ;; 1B:4040 $28 $06

    ld   a, [hl]                                  ;; 1B:4042 $7E
    cp   $01                                      ;; 1B:4043 $FE $01
    jr   z, jr_01B_4053                           ;; 1B:4045 $28 $0C

    ret                                           ;; 1B:4047 $C9

.jr_4048
    ld   a, $01                                   ;; 1B:4048 $3E $01
    ld   [wD379], a                               ;; 1B:404A $EA $79 $D3
    ld   hl, Data_01B_4060                        ;; 1B:404D $21 $60 $40
    jp   label_01B_406A                           ;; 1B:4050 $C3 $6A $40

jr_01B_4053:
    ld   a, [de]                                  ;; 1B:4053 $1A
    dec  a                                        ;; 1B:4054 $3D
    ld   [de], a                                  ;; 1B:4055 $12
    ret  nz                                       ;; 1B:4056 $C0

    xor  a                                        ;; 1B:4057 $AF
    ld   [wD379], a                               ;; 1B:4058 $EA $79 $D3
    ld   hl, Data_01B_4065                        ;; 1B:405B $21 $65 $40
    jr   jr_01B_406A                              ;; 1B:405E $18 $0A

Data_01B_4060::
    db   $3B, $80, $07, $C0, $02                  ;; 1B:4060

Data_01B_4065::
    db   $00, $42, $02, $C0, $04

label_01B_406A:
jr_01B_406A:
    ld   b, $04                                   ;; 1B:406A $06 $04
    ld   c, $20                                   ;; 1B:406C $0E $20

.loop_406E
    ld   a, [hl+]                                 ;; 1B:406E $2A
    ldh  [c], a                                   ;; 1B:406F $E2
    inc  c                                        ;; 1B:4070 $0C
    dec  b                                        ;; 1B:4071 $05
    jr   nz, .loop_406E                           ;; 1B:4072 $20 $FA

    ld   a, [hl]                                  ;; 1B:4074 $7E
    ld   [de], a                                  ;; 1B:4075 $12
    ret                                           ;; 1B:4076 $C9


; Music ID numbers are based on values written to wMusicTrackToPlay. They don't
; match up with "constants/sfx.asm" for some reason.
; Is this still the case? The constants are now correctly named.
MusicDataPointerTable_1B::
    dw   Music01
    dw   Music02
    dw   Music03
    dw   Music04
    dw   Music05
    dw   Music06
    dw   Music07
    dw   Music08
    dw   Music09
    dw   Music0a
    dw   Music0b
    dw   Music0c
    dw   Music0d
    dw   Music0e
    dw   Music0f
    dw   Music10

    dw   Music31
    dw   Music32
    dw   Music33
    dw   Music34
    dw   Music35
    dw   Music36
    dw   Music37
    dw   Music38
    dw   Music39
    dw   Music3a
    dw   Music3b
    dw   Music3c
    dw   Music3d
    dw   Music3e
    dw   Music3f
    dw   Music40

    dw   Music61
    dw   Music62
    dw   Music63
    dw   Music64
    dw   Music65
    dw   Music66
    dw   Music67
    dw   Music68
    dw   Music69
    dw   Music6a
    dw   Music6b
    dw   Music6c
    dw   Music6d
    dw   Music6e
    dw   Music6f
    dw   Music70

; Input:
;   a:   Table index (starting at 1, not 0)
;   hl:  Table of 16-bit values
; Output:
;   bc:  16-bit value read (little-endian)
;   hl:  Same as bc
;   a:   Value of b/h
;   e:   Incremented by 1
GetMusicDataPtr_1B::
    inc  e                                        ;; 1B:40D7 $1C
    dec  a                                        ;; 1B:40D8 $3D
    sla  a                                        ;; 1B:40D9 $CB $27
    ld   c, a                                     ;; 1B:40DB $4F
    ld   b, $00                                   ;; 1B:40DC $06 $00
    add  hl, bc                                   ;; 1B:40DE $09
    ld   c, [hl]                                  ;; 1B:40DF $4E
    inc  hl                                       ;; 1B:40E0 $23
    ld   b, [hl]                                  ;; 1B:40E1 $46
    ld   l, c                                     ;; 1B:40E2 $69
    ld   h, b                                     ;; 1B:40E3 $60
    ld   a, h                                     ;; 1B:40E4 $7C
    ret                                           ;; 1B:40E5 $C9

; Input:
;   hl:  Waveform (16 bytes to write to $FF30)
SetWaveform_1B::
    push bc                                       ;; 1B:40E6 $C5
    ld   c, $30 ; $FF30, Wave pattern RAM         ;; 1B:40E7 $0E $30

.loop
    ld   a, [hl+]                                 ;; 1B:40E9 $2A
    ldh  [c], a                                   ;; 1B:40EA $E2
    inc  c                                        ;; 1B:40EB $0C
    ld   a, c                                     ;; 1B:40EC $79
    cp   $40                                      ;; 1B:40ED $FE $40
    jr   nz, .loop                                ;; 1B:40EF $20 $F8

    pop  bc                                       ;; 1B:40F1 $C1
    ret                                           ;; 1B:40F2 $C9

StopNoiseChannel_1B::
    xor  a                                        ;; 1B:40F3 $AF
    ld   [wD379], a                               ;; 1B:40F4 $EA $79 $D3
    ld   [wD34F], a                               ;; 1B:40F7 $EA $4F $D3
    ld   [wD398], a                               ;; 1B:40FA $EA $98 $D3
    ld   [wD393], a                               ;; 1B:40FD $EA $93 $D3
    ld   [wD3C9], a                               ;; 1B:4100 $EA $C9 $D3
    ld   [wD3A3], a                               ;; 1B:4103 $EA $A3 $D3
    ld   a, $08                                   ;; 1B:4106 $3E $08
    ldh  [rNR42], a                               ;; 1B:4108 $E0 $21
    ld   a, $80                                   ;; 1B:410A $3E $80
    ldh  [rNR44], a                               ;; 1B:410C $E0 $23
    ret                                           ;; 1B:410E $C9

; Called when music ends?
func_01B_410F::
jr_01B_410F:
    ld   a, [wD379]                               ;; 1B:410F $FA $79 $D3
    cp   $0C                                      ;; 1B:4112 $FE $0C
    jp   z, label_01B_4E4A                        ;; 1B:4114 $CA $4A $4E

    cp   $05                                      ;; 1B:4117 $FE $05
    jp   z, label_01B_4E4A                        ;; 1B:4119 $CA $4A $4E

    cp   $1A                                      ;; 1B:411C $FE $1A
    jp   z, label_01B_4E4A                        ;; 1B:411E $CA $4A $4E

    cp   $24                                      ;; 1B:4121 $FE $24
    jp   z, label_01B_4E4A                        ;; 1B:4123 $CA $4A $4E

    cp   $2A                                      ;; 1B:4126 $FE $2A
    jp   z, label_01B_4E4A                        ;; 1B:4128 $CA $4A $4E

    cp   $2E                                      ;; 1B:412B $FE $2E
    jp   z, label_01B_4E4A                        ;; 1B:412D $CA $4A $4E

    cp   $3F                                      ;; 1B:4130 $FE $3F
    jp   z, label_01B_4E4A                        ;; 1B:4132 $CA $4A $4E

    call StopNoiseChannel_1B                      ;; 1B:4135 $CD $F3 $40
    jp   label_01B_4E4A                           ;; 1B:4138 $C3 $4A $4E

BeginMusicTrack_Dispatch_1B::
    cp   $FF                                      ;; 1B:413B $FE $FF
    jr   z, jr_01B_410F                           ;; 1B:413D $28 $D0

    ld   a, [wD3CA]                               ;; 1B:413F $FA $CA $D3
    ld   [wPreviousMusicTrack], a                 ;; 1B:4142 $EA $CB $D3

    ; [wD3CA] = [wActiveMusicIndex]
    ld   a, [hl]                                  ;; 1B:4145 $7E
    ld   [wD3CA], a                               ;; 1B:4146 $EA $CA $D3

    cp   $11                                      ;; 1B:4149 $FE $11
    jr   nc, .above10                             ;; 1B:414B $30 $02

    jr   .playAudio                               ;; 1B:414D $18 $23

.above10
    cp   $21                                      ;; 1B:414F $FE $21
    jr   nc, .above20                             ;; 1B:4151 $30 $03

    jp   DontPlayAudio_1B                         ;; 1B:4153 $C3 $2C $40

.above20
    cp   $31                                      ;; 1B:4156 $FE $31
    jr   nc, .above30                             ;; 1B:4158 $30 $03

    jp   DontPlayAudio_1B                         ;; 1B:415A $C3 $2C $40

.above30
    cp   $41                                      ;; 1B:415D $FE $41
    jp   nc, .above40                             ;; 1B:415F $D2 $66 $41

    add  $E0                                      ;; 1B:4162 $C6 $E0
    jr   .playAudio                               ;; 1B:4164 $18 $0C

.above40
    cp   $61                                      ;; 1B:4166 $FE $61
    jp   c, DontPlayAudio_1B                      ;; 1B:4168 $DA $2C $40

    cp   $70                                      ;; 1B:416B $FE $70
    jp   nc, DontPlayAudio_1B                     ;; 1B:416D $D2 $2C $40

    add  $C0                                      ;; 1B:4170 $C6 $C0

.playAudio
    dec  hl                                       ;; 1B:4172 $2B
    ld   [hl+], a ; [wMusicTrackToPlay]           ;; 1B:4173 $22

    ld   b, a                                     ;; 1B:4174 $47
    ld   a, $01                                   ;; 1B:4175 $3E $01
    ld   [wActiveMusicTable], a                   ;; 1B:4177 $EA $CE $D3
    ld   a, b                                     ;; 1B:417A $78
    ld   [hl], a ; [wActiveMusicIndex]            ;; 1B:417B $77
    ld   b, a                                     ;; 1B:417C $47
    ld   hl, MusicDataPointerTable_1B             ;; 1B:417D $21 $77 $40
    and  $7F                                      ;; 1B:4180 $E6 $7F
    call GetMusicDataPtr_1B                       ;; 1B:4182 $CD $D7 $40
    call LoadMusicData_1B                         ;; 1B:4185 $CD $3C $43
    jp   label_01B_42D5                           ;; 1B:4188 $C3 $D5 $42

Data_1B_418B::
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

label_01B_42AB:
    ld   a, [wD3E7]                               ;; 1B:42AB $FA $E7 $D3
    and  a                                        ;; 1B:42AE $A7
    jp   z, WriteChannelRegisters                 ;; 1B:42AF $CA $CB $46

    xor  a                                        ;; 1B:42B2 $AF
    ldh  [rNR30], a                               ;; 1B:42B3 $E0 $1A
    ld   [wD3E7], a                               ;; 1B:42B5 $EA $E7 $D3
    push hl                                       ;; 1B:42B8 $E5
    ld   a, [wD330 + 6]                           ;; 1B:42B9 $FA $36 $D3
    ld   l, a                                     ;; 1B:42BC $6F
    ld   a, [wD330 + 7]                           ;; 1B:42BD $FA $37 $D3
    ld   h, a                                     ;; 1B:42C0 $67
    push bc                                       ;; 1B:42C1 $C5
    ld   c, $30                                   ;; 1B:42C2 $0E $30

.loop_42C4
    ld   a, [hl+]                                 ;; 1B:42C4 $2A
    ldh  [c], a                                   ;; 1B:42C5 $E2
    inc  c                                        ;; 1B:42C6 $0C
    ld   a, c                                     ;; 1B:42C7 $79
    cp   $40                                      ;; 1B:42C8 $FE $40
    jr   nz, .loop_42C4                           ;; 1B:42CA $20 $F8

    ld   a, $80                                   ;; 1B:42CC $3E $80
    ldh  [rNR30], a                               ;; 1B:42CE $E0 $1A
    pop  bc                                       ;; 1B:42D0 $C1
    pop  hl                                       ;; 1B:42D1 $E1
    jp   WriteChannelRegisters                    ;; 1B:42D2 $C3 $CB $46

label_01B_42D5:
    ld   a, [wActiveMusicIndex]                   ;; 1B:42D5 $FA $69 $D3
    ld   hl, Data_1B_418B                         ;; 1B:42D8 $21 $8B $41

.loop_42DB
    dec  a                                        ;; 1B:42DB $3D
    jr   z, .jr_42E6                              ;; 1B:42DC $28 $08

    inc  hl                                       ;; 1B:42DE $23
    inc  hl                                       ;; 1B:42DF $23
    inc  hl                                       ;; 1B:42E0 $23
    inc  hl                                       ;; 1B:42E1 $23
    inc  hl                                       ;; 1B:42E2 $23
    inc  hl                                       ;; 1B:42E3 $23
    jr   .loop_42DB                               ;; 1B:42E4 $18 $F5

.jr_42E6
    ld   bc, wD355                                ;; 1B:42E6 $01 $55 $D3
    ld   a, [hl+]                                 ;; 1B:42E9 $2A
    ld   [bc], a                                  ;; 1B:42EA $02
    inc  c                                        ;; 1B:42EB $0C
    xor  a                                        ;; 1B:42EC $AF
    ld   [bc], a                                  ;; 1B:42ED $02
    inc  c                                        ;; 1B:42EE $0C
    ld   a, [hl+]                                 ;; 1B:42EF $2A
    ld   [bc], a                                  ;; 1B:42F0 $02
    inc  c                                        ;; 1B:42F1 $0C
    xor  a                                        ;; 1B:42F2 $AF
    ld   [bc], a                                  ;; 1B:42F3 $02
    inc  c                                        ;; 1B:42F4 $0C
    ld   a, [hl+]                                 ;; 1B:42F5 $2A
    ld   [bc], a                                  ;; 1B:42F6 $02
    ldh  [rNR51], a                               ;; 1B:42F7 $E0 $25
    inc  c                                        ;; 1B:42F9 $0C
    ld   a, [hl+]                                 ;; 1B:42FA $2A
    ld   [bc], a                                  ;; 1B:42FB $02
    inc  c                                        ;; 1B:42FC $0C
    ld   a, [hl+]                                 ;; 1B:42FD $2A
    ld   [bc], a                                  ;; 1B:42FE $02
    inc  c                                        ;; 1B:42FF $0C
    ld   a, [hl+]                                 ;; 1B:4300 $2A
    ld   [bc], a                                  ;; 1B:4301 $02
    ret                                           ;; 1B:4302 $C9

func_01B_4303::
    ld   hl, wD355                                ;; 1B:4303 $21 $55 $D3
    ld   a, [hl+]                                 ;; 1B:4306 $2A
    cp   $01                                      ;; 1B:4307 $FE $01
    ret  z                                        ;; 1B:4309 $C8

    inc  [hl]                                     ;; 1B:430A $34
    ld   a, [hl+]                                 ;; 1B:430B $2A
    cp   [hl]                                     ;; 1B:430C $BE
    ret  nz                                       ;; 1B:430D $C0

    dec  l                                        ;; 1B:430E $2D
    ld   [hl], $00                                ;; 1B:430F $36 $00
    inc  l                                        ;; 1B:4311 $2C
    inc  l                                        ;; 1B:4312 $2C
    inc  [hl]                                     ;; 1B:4313 $34
    ld   a, [hl+]                                 ;; 1B:4314 $2A
    and  $03                                      ;; 1B:4315 $E6 $03
    ld   c, l                                     ;; 1B:4317 $4D
    ld   b, h                                     ;; 1B:4318 $44
    and  a                                        ;; 1B:4319 $A7
    jr   z, .jr_4327                              ;; 1B:431A $28 $0B

    inc  c                                        ;; 1B:431C $0C
    cp   $01                                      ;; 1B:431D $FE $01
    jr   z, .jr_4327                              ;; 1B:431F $28 $06

    inc  c                                        ;; 1B:4321 $0C
    cp   $02                                      ;; 1B:4322 $FE $02
    jr   z, .jr_4327                              ;; 1B:4324 $28 $01

    inc  c                                        ;; 1B:4326 $0C

.jr_4327
    ld   a, [bc]                                  ;; 1B:4327 $0A
    ldh  [rNR51], a                               ;; 1B:4328 $E0 $25
    ret                                           ;; 1B:432A $C9

; Input:
;   de:  D3x4 (Pointer to sound definition data; will be written to)
;   hl:  D3x0 (Pointer to sound channel data)
; Output:
;   a:   High byte of pointer written
LoadSoundDefinitionData::
    ld   a, [hl+]                                 ;; 1B:432B $2A
    ld   c, a                                     ;; 1B:432C $4F
    ld   a, [hl]                                  ;; 1B:432D $7E
    ld   b, a                                     ;; 1B:432E $47
    ld   a, [bc]                                  ;; 1B:432F $0A
    ld   [de], a                                  ;; 1B:4330 $12
    inc  e                                        ;; 1B:4331 $1C
    inc  bc                                       ;; 1B:4332 $03
    ld   a, [bc]                                  ;; 1B:4333 $0A
    ld   [de], a                                  ;; 1B:4334 $12
    ret                                           ;; 1B:4335 $C9

; Inputs:
;   de:  Destination
;   hl:  Source
Copy2Bytes_1B::
    ld   a, [hl+]                                 ;; 1B:4336 $2A
    ld   [de], a                                  ;; 1B:4337 $12
    inc  e                                        ;; 1B:4338 $1C
    ld   a, [hl+]                                 ;; 1B:4339 $2A
    ld   [de], a                                  ;; 1B:433A $12
    ret                                           ;; 1B:433B $C9

; Input:
;   hl:  Pointer to start of music data
LoadMusicData_1B::
    ld   a, [wD379]                               ;; 1B:433C $FA $79 $D3
    cp   $05                                      ;; 1B:433F $FE $05
    jr   z, .jr_435E                              ;; 1B:4341 $28 $1B

    cp   $0C                                      ;; 1B:4343 $FE $0C
    jr   z, .jr_435E                              ;; 1B:4345 $28 $17

    cp   $1A                                      ;; 1B:4347 $FE $1A
    jr   z, .jr_435E                              ;; 1B:4349 $28 $13

    cp   $24                                      ;; 1B:434B $FE $24
    jr   z, .jr_435E                              ;; 1B:434D $28 $0F

    cp   $2A                                      ;; 1B:434F $FE $2A
    jr   z, .jr_435E                              ;; 1B:4351 $28 $0B

    cp   $2E                                      ;; 1B:4353 $FE $2E
    jr   z, .jr_435E                              ;; 1B:4355 $28 $07

    cp   $3F                                      ;; 1B:4357 $FE $3F
    jr   z, .jr_435E                              ;; 1B:4359 $28 $03

    call StopNoiseChannel_1B                      ;; 1B:435B $CD $F3 $40

.jr_435E
    call StopSquareAndWaveChannels_1B             ;; 1B:435E $CD $57 $4E
    ld   de, wMusicTranspose                      ;; 1B:4361 $11 $00 $D3
    ld   b, $00                                   ;; 1B:4364 $06 $00
    ld   a, [hl+]                                 ;; 1B:4366 $2A
    ld   [de], a                                  ;; 1B:4367 $12
    inc  e                                        ;; 1B:4368 $1C
    call Copy2Bytes_1B                            ;; 1B:4369 $CD $36 $43
    ld   de, wD310                                ;; 1B:436C $11 $10 $D3
    call Copy2Bytes_1B                            ;; 1B:436F $CD $36 $43
    ld   de, wD320                                ;; 1B:4372 $11 $20 $D3
    call Copy2Bytes_1B                            ;; 1B:4375 $CD $36 $43
    ld   de, wD330                                ;; 1B:4378 $11 $30 $D3
    call Copy2Bytes_1B                            ;; 1B:437B $CD $36 $43
    ld   de, wD340                                ;; 1B:437E $11 $40 $D3
    call Copy2Bytes_1B                            ;; 1B:4381 $CD $36 $43
    ld   hl, wD310                                ;; 1B:4384 $21 $10 $D3
    ld   de, wD314                                ;; 1B:4387 $11 $14 $D3
    call LoadSoundDefinitionData                  ;; 1B:438A $CD $2B $43
    ld   hl, wD320                                ;; 1B:438D $21 $20 $D3
    ld   de, wD320 + 4                            ;; 1B:4390 $11 $24 $D3
    call LoadSoundDefinitionData                  ;; 1B:4393 $CD $2B $43
    ld   hl, wD330                                ;; 1B:4396 $21 $30 $D3
    ld   de, wD330 + 4                            ;; 1B:4399 $11 $34 $D3
    call LoadSoundDefinitionData                  ;; 1B:439C $CD $2B $43
    ld   hl, wD340                                ;; 1B:439F $21 $40 $D3
    ld   de, wD344                                ;; 1B:43A2 $11 $44 $D3
    call LoadSoundDefinitionData                  ;; 1B:43A5 $CD $2B $43

    ; [D3x2] = 1 for all channels
    ld   bc, $0410                                ;; 1B:43A8 $01 $10 $04
    ld   hl, wD312                                ;; 1B:43AB $21 $12 $D3
.loop
    ld   [hl], $01                                ;; 1B:43AE $36 $01
    ld   a, c                                     ;; 1B:43B0 $79
    add  l                                        ;; 1B:43B1 $85
    ld   l, a                                     ;; 1B:43B2 $6F
    dec  b                                        ;; 1B:43B3 $05
    jr   nz, .loop                                ;; 1B:43B4 $20 $F8

    xor  a                                        ;; 1B:43B6 $AF
    ld   [wD31E], a                               ;; 1B:43B7 $EA $1E $D3
    ld   [wD320 + $0E], a                         ;; 1B:43BA $EA $2E $D3
    ld   [wD330 + $0E], a                         ;; 1B:43BD $EA $3E $D3
    ret                                           ;; 1B:43C0 $C9

; Input:
;  de:  Pointer to waveform data
soundOpcode9DChannel3Handler_1B::
    push hl                                       ;; 1B:43C1 $E5
    ld   a, e                                     ;; 1B:43C2 $7B
    ld   [wD330 + 6], a                           ;; 1B:43C3 $EA $36 $D3
    ld   a, d                                     ;; 1B:43C6 $7A
    ld   [wD330 + 7], a                           ;; 1B:43C7 $EA $37 $D3
    ld   a, [wD371]                               ;; 1B:43CA $FA $71 $D3
    and  a                                        ;; 1B:43CD $A7
    jr   nz, .nextOpcode                          ;; 1B:43CE $20 $08

    xor  a                                        ;; 1B:43D0 $AF
    ldh  [rNR30], a                               ;; 1B:43D1 $E0 $1A
    ld   l, e                                     ;; 1B:43D3 $6B
    ld   h, d                                     ;; 1B:43D4 $62
    call SetWaveform_1B                           ;; 1B:43D5 $CD $E6 $40

.nextOpcode
    pop  hl                                       ;; 1B:43D8 $E1
    jr   soundOpcode9D.nextOpcode                 ;; 1B:43D9 $18 $2A

soundOpcode9D::
    call IncChannelDefinitionPointer              ;; 1B:43DB $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:43DE $CD $20 $44
    ld   e, a                                     ;; 1B:43E1 $5F
    call IncChannelDefinitionPointer              ;; 1B:43E2 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:43E5 $CD $20 $44
    ld   d, a                                     ;; 1B:43E8 $57
    call IncChannelDefinitionPointer              ;; 1B:43E9 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:43EC $CD $20 $44
    ld   c, a                                     ;; 1B:43EF $4F
    inc  l                                        ;; 1B:43F0 $2C
    inc  l                                        ;; 1B:43F1 $2C
    ld   [hl], e ; D3x6                           ;; 1B:43F2 $73
    inc  l                                        ;; 1B:43F3 $2C
    ld   [hl], d ; D3x7                           ;; 1B:43F4 $72
    inc  l                                        ;; 1B:43F5 $2C
    ld   [hl], c ; D3x8                           ;; 1B:43F6 $71
    dec  l                                        ;; 1B:43F7 $2D
    dec  l                                        ;; 1B:43F8 $2D
    dec  l                                        ;; 1B:43F9 $2D
    dec  l                                        ;; 1B:43FA $2D
    push hl                                       ;; 1B:43FB $E5
    ld   hl, wActiveChannelIndex                  ;; 1B:43FC $21 $50 $D3
    ld   a, [hl]                                  ;; 1B:43FF $7E
    pop  hl                                       ;; 1B:4400 $E1
    cp   $03                                      ;; 1B:4401 $FE $03
    jr   z, soundOpcode9DChannel3Handler_1B       ;; 1B:4403 $28 $BC

.nextOpcode
    call IncChannelDefinitionPointer              ;; 1B:4405 $CD $0B $44
    jp   ParseSoundOpcode                         ;; 1B:4408 $C3 $31 $45

; Input:
;   hl:  Pointer to data to increment
IncChannelDefinitionPointer::
    push de                                       ;; 1B:440B $D5
    ld   a, [hl+]                                 ;; 1B:440C $2A
    ld   e, a                                     ;; 1B:440D $5F
    ld   a, [hl-]                                 ;; 1B:440E $3A
    ld   d, a                                     ;; 1B:440F $57
    inc  de                                       ;; 1B:4410 $13

saveSoundPointer:
    ld   a, e                                     ;; 1B:4411 $7B
    ld   [hl+], a                                 ;; 1B:4412 $22
    ld   a, d                                     ;; 1B:4413 $7A
    ld   [hl-], a                                 ;; 1B:4414 $32
    pop  de                                       ;; 1B:4415 $D1
    ret                                           ;; 1B:4416 $C9

IncrementPointerBy2::
    push de                                       ;; 1B:4417 $D5
    ld   a, [hl+]                                 ;; 1B:4418 $2A
    ld   e, a                                     ;; 1B:4419 $5F
    ld   a, [hl-]                                 ;; 1B:441A $3A
    ld   d, a                                     ;; 1B:441B $57
    inc  de                                       ;; 1B:441C $13
    inc  de                                       ;; 1B:441D $13
    jr   saveSoundPointer                         ;; 1B:441E $18 $F1

; Input:
;   hl:  Pointer to data
; Output:
;   a:   Byte read
;   b:   Same as a
ReadSoundPointerByte::
    ld   a, [hl+]                                 ;; 1B:4420 $2A
    ld   c, a                                     ;; 1B:4421 $4F
    ld   a, [hl-]                                 ;; 1B:4422 $3A
    ld   b, a                                     ;; 1B:4423 $47
    ld   a, [bc]                                  ;; 1B:4424 $0A
    ld   b, a                                     ;; 1B:4425 $47
    ret                                           ;; 1B:4426 $C9

jr_01B_4427:
    pop  hl                                       ;; 1B:4427 $E1
    jr   UpdateNextMusicChannelAfterHlDecrement   ;; 1B:4428 $18 $31

label_01B_442A:
    ld   a, [wActiveChannelIndex]                 ;; 1B:442A $FA $50 $D3
    cp   $03                                      ;; 1B:442D $FE $03
    jr   nz, .channel3Done                        ;; 1B:442F $20 $10

    ld   a, [wD330 + 8]                           ;; 1B:4431 $FA $38 $D3
    bit  7, a                                     ;; 1B:4434 $CB $7F
    jr   z, .channel3Done                         ;; 1B:4436 $28 $09

    ld   a, [hl]                                  ;; 1B:4438 $7E
    cp   $06                                      ;; 1B:4439 $FE $06
    jr   nz, .channel3Done                        ;; 1B:443B $20 $04

    ld   a, $40                                   ;; 1B:443D $3E $40
    ldh  [rNR32], a                               ;; 1B:443F $E0 $1C
.channel3Done

    push hl                                       ;; 1B:4441 $E5
    ld   a, l                                     ;; 1B:4442 $7D
    add  $09                                      ;; 1B:4443 $C6 $09
    ld   l, a                                     ;; 1B:4445 $6F
    ld   a, [hl] ; D3xB                           ;; 1B:4446 $7E
    and  a                                        ;; 1B:4447 $A7
    jr   nz, jr_01B_4427                          ;; 1B:4448 $20 $DD

    ld   a, l                                     ;; 1B:444A $7D
    add  $04                                      ;; 1B:444B $C6 $04
    ld   l, a                                     ;; 1B:444D $6F
    bit  7, [hl] ; D3xF                           ;; 1B:444E $CB $7E
    jr   nz, jr_01B_4427                          ;; 1B:4450 $20 $D5

    pop  hl                                       ;; 1B:4452 $E1
    call func_01B_46FE                            ;; 1B:4453 $CD $FE $46
    push hl                                       ;; 1B:4456 $E5
    call func_01B_4787                            ;; 1B:4457 $CD $87 $47
    pop  hl                                       ;; 1B:445A $E1

UpdateNextMusicChannelAfterHlDecrement:
    dec  l                                        ;; 1B:445B $2D
    dec  l                                        ;; 1B:445C $2D
    jp   UpdateNextMusicChannel_1B                ;; 1B:445D $C3 $DE $46

soundOpcode00:
    dec  l                                        ;; 1B:4460 $2D
    dec  l                                        ;; 1B:4461 $2D
    dec  l                                        ;; 1B:4462 $2D
    dec  l                                        ;; 1B:4463 $2D
    call IncrementPointerBy2                      ;; 1B:4464 $CD $17 $44

.readNext
    ld   a, l                                     ;; 1B:4467 $7D
    add  $04                                      ;; 1B:4468 $C6 $04
    ld   e, a                                     ;; 1B:446A $5F
    ld   d, h                                     ;; 1B:446B $54
    call LoadSoundDefinitionData                  ;; 1B:446C $CD $2B $43
    cp   $00                                      ;; 1B:446F $FE $00
    jr   z, .val00                                ;; 1B:4471 $28 $1F

    cp   $FF                                      ;; 1B:4473 $FE $FF
    jr   z, .valFF                                ;; 1B:4475 $28 $04

    inc  l ; hl = [D3x2]                          ;; 1B:4477 $2C
    jp   ParseSoundOpcodeAfterHlIncrement         ;; 1B:4478 $C3 $2F $45

; Music loops?
.valFF
    dec  l ; hl = D3x0                            ;; 1B:447B $2D
    push hl                                       ;; 1B:447C $E5
    call IncrementPointerBy2                      ;; 1B:447D $CD $17 $44
    call ReadSoundPointerByte                     ;; 1B:4480 $CD $20 $44
    ld   e, a                                     ;; 1B:4483 $5F
    call IncChannelDefinitionPointer              ;; 1B:4484 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:4487 $CD $20 $44
    ld   d, a                                     ;; 1B:448A $57
    pop  hl                                       ;; 1B:448B $E1
    ld   a, e                                     ;; 1B:448C $7B
    ld   [hl+], a ; D3x0                          ;; 1B:448D $22
    ld   a, d                                     ;; 1B:448E $7A
    ld   [hl-], a                                 ;; 1B:448F $32
    jr   .readNext                                ;; 1B:4490 $18 $D5

; Item acquired fanfare ends
.val00
    ld   a, [wD3CA]                               ;; 1B:4492 $FA $CA $D3
    cp   MUSIC_OBTAIN_SWORD                       ;; 1B:4495 $FE $0F
    jp   z, ContinueCurrentScreenMusic_1B         ;; 1B:4497 $CA $E5 $47

    cp   MUSIC_OBTAIN_ITEM                        ;; 1B:449A $FE $10
    jp   z, ContinueCurrentScreenMusic_1B         ;; 1B:449C $CA $E5 $47

    cp   MUSIC_HEART_CONTAINER                    ;; 1B:449F $FE $25
    jp   z, ContinueCurrentScreenMusic_1B         ;; 1B:44A1 $CA $E5 $47

    ld   hl, wActiveMusicIndex                    ;; 1B:44A4 $21 $69 $D3
    ld   [hl], $00                                ;; 1B:44A7 $36 $00
    call func_01B_410F                            ;; 1B:44A9 $CD $0F $41
    ret                                           ;; 1B:44AC $C9

soundOpcode9E:
    call IncChannelDefinitionPointer              ;; 1B:44AD $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:44B0 $CD $20 $44
    ld   [wMusicSpeedPointer], a                  ;; 1B:44B3 $EA $01 $D3
    call IncChannelDefinitionPointer              ;; 1B:44B6 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:44B9 $CD $20 $44
    ld   [wMusicSpeedPointer+1], a                ;; 1B:44BC $EA $02 $D3
    jr   IncChannelDefinitonPointerAndParseNext   ;; 1B:44BF $18 $09

soundOpcode9F:
    call IncChannelDefinitionPointer              ;; 1B:44C1 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:44C4 $CD $20 $44
    ld   [wMusicTranspose], a                     ;; 1B:44C7 $EA $00 $D3

IncChannelDefinitonPointerAndParseNext:
    call IncChannelDefinitionPointer              ;; 1B:44CA $CD $0B $44
    jr   ParseSoundOpcode                         ;; 1B:44CD $18 $62

soundOpcode9B:
    call IncChannelDefinitionPointer              ;; 1B:44CF $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:44D2 $CD $20 $44
    push hl                                       ;; 1B:44D5 $E5
    ld   a, l                                     ;; 1B:44D6 $7D
    add  $0B                                      ;; 1B:44D7 $C6 $0B
    ld   l, a                                     ;; 1B:44D9 $6F
    ld   c, [hl] ; D3xF                           ;; 1B:44DA $4E
    ld   a, b                                     ;; 1B:44DB $78
    or   c                                        ;; 1B:44DC $B1
    ld   [hl], a ; D3xF                           ;; 1B:44DD $77

    ld   b, h                                     ;; 1B:44DE $44
    ld   c, l                                     ;; 1B:44DF $4D
    dec  c                                        ;; 1B:44E0 $0D
    dec  c                                        ;; 1B:44E1 $0D
    pop  hl                                       ;; 1B:44E2 $E1
    ld   a, [hl+] ; D3x4                          ;; 1B:44E3 $2A
    ld   e, a                                     ;; 1B:44E4 $5F
    ld   a, [hl-]                                 ;; 1B:44E5 $3A
    ld   d, a                                     ;; 1B:44E6 $57
    inc  de                                       ;; 1B:44E7 $13

    ld   a, e                                     ;; 1B:44E8 $7B
    ld   [hl+], a ; D3x4                          ;; 1B:44E9 $22
    ld   a, d                                     ;; 1B:44EA $7A
    ld   [hl-], a                                 ;; 1B:44EB $32
    ld   a, d                                     ;; 1B:44EC $7A
    ld   [bc], a ; D3xD                           ;; 1B:44ED $02
    dec  c                                        ;; 1B:44EE $0D
    ld   a, e                                     ;; 1B:44EF $7B
    ld   [bc], a ; D3xC                           ;; 1B:44F0 $02
    jr   ParseSoundOpcode                         ;; 1B:44F1 $18 $3E

soundOpcode9C:
    push hl                                       ;; 1B:44F3 $E5
    ld   a, l                                     ;; 1B:44F4 $7D
    add  $0B                                      ;; 1B:44F5 $C6 $0B
    ld   l, a                                     ;; 1B:44F7 $6F
    ld   a, [hl] ; D3xF                           ;; 1B:44F8 $7E
    dec  [hl]                                     ;; 1B:44F9 $35
    ld   a, [hl]                                  ;; 1B:44FA $7E
    and  $7F                                      ;; 1B:44FB $E6 $7F
    jr   z, .doneLooping                          ;; 1B:44FD $28 $0D

    ld   b, h                                     ;; 1B:44FF $44
    ld   c, l                                     ;; 1B:4500 $4D
    dec  c                                        ;; 1B:4501 $0D
    dec  c                                        ;; 1B:4502 $0D
    dec  c                                        ;; 1B:4503 $0D
    pop  hl                                       ;; 1B:4504 $E1
    ld   a, [bc]  ; D3xC                          ;; 1B:4505 $0A
    ld   [hl+], a ; D3x4                          ;; 1B:4506 $22
    inc  c                                        ;; 1B:4507 $0C
    ld   a, [bc]                                  ;; 1B:4508 $0A
    ld   [hl-], a                                 ;; 1B:4509 $32
    jr   ParseSoundOpcode                         ;; 1B:450A $18 $25

.doneLooping
    pop  hl                                       ;; 1B:450C $E1
    jr   IncChannelDefinitonPointerAndParseNext   ;; 1B:450D $18 $BB

UpdateAllMusicChannels_1B::
    ld   hl, wActiveMusicIndex                    ;; 1B:450F $21 $69 $D3
    ld   a, [hl]                                  ;; 1B:4512 $7E
    and  a                                        ;; 1B:4513 $A7
    ret  z                                        ;; 1B:4514 $C8

    ld   a, [wActiveMusicTable]                   ;; 1B:4515 $FA $CE $D3
    and  a                                        ;; 1B:4518 $A7
    ret  z                                        ;; 1B:4519 $C8

    call func_01B_4303                            ;; 1B:451A $CD $03 $43
    ld   a, $01                                   ;; 1B:451D $3E $01
    ld   [wActiveChannelIndex], a                 ;; 1B:451F $EA $50 $D3
    ld   hl, wD310                                ;; 1B:4522 $21 $10 $D3

; This will loop through all music channels and update them.
; Input:
;   hl:  D3x0 (x = channel index)
UpdateMusicChannel_1B::
    inc  l                                        ;; 1B:4525 $2C
    ld   a, [hl+] ; Dx11                          ;; 1B:4526 $2A
    and  a                                        ;; 1B:4527 $A7
    jp   z, UpdateNextMusicChannelAfterHlDecrement ;; 1B:4528 $CA $5B $44

    dec  [hl] ; Dx12                              ;; 1B:452B $35
    jp   nz, label_01B_442A                       ;; 1B:452C $C2 $2A $44

ParseSoundOpcodeAfterHlIncrement:
    inc  l                                        ;; 1B:452F $2C
    inc  l                                        ;; 1B:4530 $2C

; Parse an "opcode" from sound channel definition data?
; Input:
;   hl: D3x4
ParseSoundOpcode:
    call ReadSoundPointerByte                     ;; 1B:4531 $CD $20 $44
    cp   $00                                      ;; 1B:4534 $FE $00
    jp   z, soundOpcode00                         ;; 1B:4536 $CA $60 $44

    cp   $9D                                      ;; 1B:4539 $FE $9D
    jp   z, soundOpcode9D                         ;; 1B:453B $CA $DB $43

    cp   $9E                                      ;; 1B:453E $FE $9E
    jp   z, soundOpcode9E                         ;; 1B:4540 $CA $AD $44

    cp   $9F                                      ;; 1B:4543 $FE $9F
    jp   z, soundOpcode9F                         ;; 1B:4545 $CA $C1 $44

    cp   $9B                                      ;; 1B:4548 $FE $9B
    jp   z, soundOpcode9B                         ;; 1B:454A $CA $CF $44

    cp   $9C                                      ;; 1B:454D $FE $9C
    jp   z, soundOpcode9C                         ;; 1B:454F $CA $F3 $44

    cp   $99                                      ;; 1B:4552 $FE $99
    jp   z, soundOpcode99                         ;; 1B:4554 $CA $FF $47

    cp   $9A                                      ;; 1B:4557 $FE $9A
    jp   z, soundOpcode9A                         ;; 1B:4559 $CA $0A $48

    cp   $94                                      ;; 1B:455C $FE $94
    jp   z, soundOpcode94                         ;; 1B:455E $CA $8D $49

    cp   $97                                      ;; 1B:4561 $FE $97
    jp   z, soundOpcode97                         ;; 1B:4563 $CA $46 $48

    cp   $98                                      ;; 1B:4566 $FE $98
    jp   z, soundOpcode98                         ;; 1B:4568 $CA $55 $48

    cp   $96                                      ;; 1B:456B $FE $96
    jp   z, soundOpcode96                         ;; 1B:456D $CA $F1 $47

    cp   $95                                      ;; 1B:4570 $FE $95
    jp   z, soundOpcode95                         ;; 1B:4572 $CA $FC $47

    and  $F0                                      ;; 1B:4575 $E6 $F0
    cp   $A0                                      ;; 1B:4577 $FE $A0
    jr   nz, HandleNote                           ;; 1B:4579 $20 $4D

    ; Command $A0-$AF
    ld   a, b                                     ;; 1B:457B $78
    and  $0F                                      ;; 1B:457C $E6 $0F
    ld   c, a                                     ;; 1B:457E $4F
    ld   b, $00                                   ;; 1B:457F $06 $00
    push hl                                       ;; 1B:4581 $E5
    ld   de, wMusicSpeedPointer                   ;; 1B:4582 $11 $01 $D3
    ld   a, [de]                                  ;; 1B:4585 $1A
    ld   l, a                                     ;; 1B:4586 $6F
    inc  e                                        ;; 1B:4587 $1C
    ld   a, [de]                                  ;; 1B:4588 $1A
    ld   h, a                                     ;; 1B:4589 $67
    add  hl, bc                                   ;; 1B:458A $09
    ld   a, [hl]                                  ;; 1B:458B $7E
    pop  hl                                       ;; 1B:458C $E1
    push hl                                       ;; 1B:458D $E5
    ld   d, a                                     ;; 1B:458E $57
    inc  l                                        ;; 1B:458F $2C
    inc  l                                        ;; 1B:4590 $2C
    inc  l                                        ;; 1B:4591 $2C
    ld   a, [hl] ; D3x7                           ;; 1B:4592 $7E
    and  $F0                                      ;; 1B:4593 $E6 $F0
    jr   nz, .jr_01B_459A                         ;; 1B:4595 $20 $03

    ld   a, d                                     ;; 1B:4597 $7A
    jr   .jr_01B_45BF                             ;; 1B:4598 $18 $25

.jr_01B_459A
    ld   e, a                                     ;; 1B:459A $5F
    ld   a, d                                     ;; 1B:459B $7A
    push af                                       ;; 1B:459C $F5
    srl  a                                        ;; 1B:459D $CB $3F
    sla  e                                        ;; 1B:459F $CB $23
    jr   c, .jr_01B_45AB                          ;; 1B:45A1 $38 $08

    ld   d, a                                     ;; 1B:45A3 $57
    srl  a                                        ;; 1B:45A4 $CB $3F
    sla  e                                        ;; 1B:45A6 $CB $23
    jr   c, .jr_01B_45AB                          ;; 1B:45A8 $38 $01

    add  d                                        ;; 1B:45AA $82

.jr_01B_45AB
    ld   c, a                                     ;; 1B:45AB $4F
    and  a                                        ;; 1B:45AC $A7
    jr   nz, .jr_01B_45B1                         ;; 1B:45AD $20 $02

    ld   c, $02                                   ;; 1B:45AF $0E $02

.jr_01B_45B1
    ld   de, wActiveChannelIndex                  ;; 1B:45B1 $11 $50 $D3
    ld   a, [de]                                  ;; 1B:45B4 $1A
    dec  a                                        ;; 1B:45B5 $3D
    ld   e, a                                     ;; 1B:45B6 $5F
    ld   d, $00                                   ;; 1B:45B7 $16 $00
    ld   hl, wD307                                ;; 1B:45B9 $21 $07 $D3
    add  hl, de                                   ;; 1B:45BC $19
    ld   [hl], c                                  ;; 1B:45BD $71
    pop  af                                       ;; 1B:45BE $F1

.jr_01B_45BF
    pop  hl                                       ;; 1B:45BF $E1
    dec  l                                        ;; 1B:45C0 $2D
    ld   [hl+], a ; [D3x3]                        ;; 1B:45C1 $22
    call IncChannelDefinitionPointer              ;; 1B:45C2 $CD $0B $44
    call ReadSoundPointerByte                     ;; 1B:45C5 $CD $20 $44

; Input:
;   a:   Note
;   de:  ?
;   hl:  D3x0
HandleNote::
    ld   a, [wActiveChannelIndex]                 ;; 1B:45C8 $FA $50 $D3
    cp   $04                                      ;; 1B:45CB $FE $04
    jr   z, .skippedForChannel4                   ;; 1B:45CD $28 $38

    push de                                       ;; 1B:45CF $D5
    ld   de, wD3B0                                ;; 1B:45D0 $11 $B0 $D3
    call IndexChannelArray                        ;; 1B:45D3 $CD $95 $48
    xor  a                                        ;; 1B:45D6 $AF
    ld   [de], a                                  ;; 1B:45D7 $12
    inc  e                                        ;; 1B:45D8 $1C
    ld   [de], a                                  ;; 1B:45D9 $12
    ld   de, wD3B6                                ;; 1B:45DA $11 $B6 $D3
    call IndexChannelArray                        ;; 1B:45DD $CD $95 $48
    inc  e                                        ;; 1B:45E0 $1C
    xor  a                                        ;; 1B:45E1 $AF
    ld   [de], a                                  ;; 1B:45E2 $12
    ld   a, [wActiveChannelIndex]                 ;; 1B:45E3 $FA $50 $D3
    cp   $03                                      ;; 1B:45E6 $FE $03
    jr   nz, .doneChannel3Handler                 ;; 1B:45E8 $20 $1C

    ; Channel 3
    ld   de, wD39E                                ;; 1B:45EA $11 $9E $D3
    ld   a, [de]                                  ;; 1B:45ED $1A
    and  a                                        ;; 1B:45EE $A7
    jr   z, .jr_01B_45F8                          ;; 1B:45EF $28 $07

    ld   a, $01                                   ;; 1B:45F1 $3E $01
    ld   [de], a                                  ;; 1B:45F3 $12
    xor  a                                        ;; 1B:45F4 $AF
    ld   [wD39F], a                               ;; 1B:45F5 $EA $9F $D3

.jr_01B_45F8
    ld   de, wActiveMusicTableIndex               ;; 1B:45F8 $11 $D9 $D3
    ld   a, [de]                                  ;; 1B:45FB $1A
    and  a                                        ;; 1B:45FC $A7
    jr   z, .doneChannel3Handler                  ;; 1B:45FD $28 $07

    ld   a, $01                                   ;; 1B:45FF $3E $01
    ld   [de], a                                  ;; 1B:4601 $12
    xor  a                                        ;; 1B:4602 $AF
    ld   [wD3DA], a                               ;; 1B:4603 $EA $DA $D3

.doneChannel3Handler
    pop  de                                       ;; 1B:4606 $D1

.skippedForChannel4
    ld   c, b                                     ;; 1B:4607 $48
    ld   b, $00                                   ;; 1B:4608 $06 $00
    call IncChannelDefinitionPointer              ;; 1B:460A $CD $0B $44

    ld   a, [wActiveChannelIndex]                 ;; 1B:460D $FA $50 $D3
    cp   $04                                      ;; 1B:4610 $FE $04
    jp   z, .handleChannel4Note                   ;; 1B:4612 $CA $49 $46

    ; Channel 1-3 only

    push hl                                       ;; 1B:4615 $E5
    ld   a, l                                     ;; 1B:4616 $7D
    add  $05                                      ;; 1B:4617 $C6 $05
    ld   l, a                                     ;; 1B:4619 $6F
    ld   e, l                                     ;; 1B:461A $5D
    ld   d, h                                     ;; 1B:461B $54
    inc  l                                        ;; 1B:461C $2C
    inc  l                                        ;; 1B:461D $2C
    ld   a, c                                     ;; 1B:461E $79
    cp   $01                                      ;; 1B:461F $FE $01
    jr   z, .jr_01B_4644                          ;; 1B:4621 $28 $21

    ld   [hl], $00 ; D3xB                         ;; 1B:4623 $36 $00
    ld   a, [wMusicTranspose]                     ;; 1B:4625 $FA $00 $D3
    and  a                                        ;; 1B:4628 $A7
    jr   z, .jr_01B_4637                          ;; 1B:4629 $28 $0C

    ld   l, a                                     ;; 1B:462B $6F
    ld   h, $00                                   ;; 1B:462C $26 $00
    bit  7, l                                     ;; 1B:462E $CB $7D
    jr   z, .jr_01B_4634                          ;; 1B:4630 $28 $02

    ld   h, $FF                                   ;; 1B:4632 $26 $FF

.jr_01B_4634
    add  hl, bc                                   ;; 1B:4634 $09
    ld   b, h                                     ;; 1B:4635 $44
    ld   c, l                                     ;; 1B:4636 $4D

.jr_01B_4637
    ld   hl, SquareAndWaveFrequencyTable          ;; 1B:4637 $21 $C2 $49
    add  hl, bc                                   ;; 1B:463A $09
    ld   a, [hl+]                                 ;; 1B:463B $2A
    ld   [de], a ; D3x9                           ;; 1B:463C $12
    inc  e                                        ;; 1B:463D $1C
    ld   a, [hl]                                  ;; 1B:463E $7E
    ld   [de], a ; D3xA                           ;; 1B:463F $12
    pop  hl                                       ;; 1B:4640 $E1
    jp   .label_01B_467A                          ;; 1B:4641 $C3 $7A $46

.jr_01B_4644
    ld   [hl], $01 ; D3xB                         ;; 1B:4644 $36 $01
    pop  hl                                       ;; 1B:4646 $E1
    jr   .label_01B_467A                          ;; 1B:4647 $18 $31

    ; Channel 4 only
.handleChannel4Note
    push hl                                       ;; 1B:4649 $E5
    ld   a, c                                     ;; 1B:464A $79
    cp   $FF                                      ;; 1B:464B $FE $FF
    jr   z, .noiseNoteFF                          ;; 1B:464D $28 $18

    ld   de, wD346                                ;; 1B:464F $11 $46 $D3
    ld   hl, NoiseFrequencyTable                  ;; 1B:4652 $21 $54 $4A
    add  hl, bc                                   ;; 1B:4655 $09

.jr_01B_4656
    ld   a, [hl+]                                 ;; 1B:4656 $2A
    ld   [de], a                                  ;; 1B:4657 $12
    inc  e                                        ;; 1B:4658 $1C
    ld   a, e                                     ;; 1B:4659 $7B
    cp   $4B                                      ;; 1B:465A $FE $4B
    jr   nz, .jr_01B_4656                         ;; 1B:465C $20 $F8

    ld   c, rNR41 & $ff                           ;; 1B:465E $0E $20
    ld   hl, wD344                                ;; 1B:4660 $21 $44 $D3
    ld   b, $00                                   ;; 1B:4663 $06 $00
    jr   .jr_01B_46A8                             ;; 1B:4665 $18 $41

.noiseNoteFF
    ld   a, [wD34F]                               ;; 1B:4667 $FA $4F $D3
    bit  7, a                                     ;; 1B:466A $CB $7F
    jp   nz, label_01B_46D9                       ;; 1B:466C $C2 $D9 $46

    ld   a, $01                                   ;; 1B:466F $3E $01
    ld   [wActiveNoiseSfx], a                     ;; 1B:4671 $EA $78 $D3
    call func_01B_4037                            ;; 1B:4674 $CD $37 $40
    jp   label_01B_46D9                           ;; 1B:4677 $C3 $D9 $46

    ; Channels 1-3 only
.label_01B_467A:
    push hl                                       ;; 1B:467A $E5
    ld   b, $00                                   ;; 1B:467B $06 $00
    ld   a, [wActiveChannelIndex]                 ;; 1B:467D $FA $50 $D3
    cp   $01                                      ;; 1B:4680 $FE $01
    jr   z, .channel1                             ;; 1B:4682 $28 $21

    cp   $02                                      ;; 1B:4684 $FE $02
    jr   z, .channel2                             ;; 1B:4686 $28 $19

    ; Channel 3
    ld   c, rNR30 & $ff                           ;; 1B:4688 $0E $1A
    ld   a, [wD330 + $0F]                         ;; 1B:468A $FA $3F $D3
    bit  7, a                                     ;; 1B:468D $CB $7F
    jr   nz, .jr_01B_4696                         ;; 1B:468F $20 $05

    xor  a                                        ;; 1B:4691 $AF
    ldh  [c], a                                   ;; 1B:4692 $E2
    ld   a, $80                                   ;; 1B:4693 $3E $80
    ldh  [c], a                                   ;; 1B:4695 $E2

.jr_01B_4696
    inc  c                                        ;; 1B:4696 $0C
    inc  l                                        ;; 1B:4697 $2C
    inc  l                                        ;; 1B:4698 $2C
    inc  l                                        ;; 1B:4699 $2C
    inc  l                                        ;; 1B:469A $2C
    ld   a, [hl+]                                 ;; 1B:469B $2A
    ld   e, a                                     ;; 1B:469C $5F
    ld   d, $00                                   ;; 1B:469D $16 $00
    jr   .jr_01B_46AF                             ;; 1B:469F $18 $0E

.channel2:
    ld   c, rNR21 & $ff                           ;; 1B:46A1 $0E $16
    jr   .jr_01B_46A8                             ;; 1B:46A3 $18 $03

.channel1:
    ld   c, rNR10 & $ff                           ;; 1B:46A5 $0E $10
    inc  c ; rNR11                                ;; 1B:46A7 $0C

.jr_01B_46A8
    inc  l                                        ;; 1B:46A8 $2C
    inc  l                                        ;; 1B:46A9 $2C
    ld   a, [hl+] ; D3x6                          ;; 1B:46AA $2A
    ld   e, a                                     ;; 1B:46AB $5F
    inc  l                                        ;; 1B:46AC $2C
    ld   a, [hl+] ; D3x8                          ;; 1B:46AD $2A
    ld   d, a                                     ;; 1B:46AE $57

.jr_01B_46AF
    push hl                                       ;; 1B:46AF $E5
    inc  l                                        ;; 1B:46B0 $2C
    inc  l                                        ;; 1B:46B1 $2C
    ld   a, [hl+] ; D3xB                          ;; 1B:46B2 $2A
    and  a                                        ;; 1B:46B3 $A7
    jr   z, .jr_01B_46B8                          ;; 1B:46B4 $28 $02

    ld   e, $08                                   ;; 1B:46B6 $1E $08

.jr_01B_46B8
    inc  l                                        ;; 1B:46B8 $2C
    inc  l                                        ;; 1B:46B9 $2C
    ld   [hl], $00 ; D3xE                         ;; 1B:46BA $36 $00
    inc  l                                        ;; 1B:46BC $2C
    ld   a, [hl] ; D3xF                           ;; 1B:46BD $7E
    pop  hl                                       ;; 1B:46BE $E1
    bit  7, a                                     ;; 1B:46BF $CB $7F
    jr   nz, label_01B_46D9                       ;; 1B:46C1 $20 $16

    ld   a, [wActiveChannelIndex]                 ;; 1B:46C3 $FA $50 $D3
    cp   $03                                      ;; 1B:46C6 $FE $03
    jp   z, label_01B_42AB                        ;; 1B:46C8 $CA $AB $42

; Input:
;   c:   rNRx1 (set based on which channel it is)
;   b:   Value for NRx1 (or'd with d)
;   d:   Value for NRx1 (or'd with b)
;   e:   Value for NRx2 (volume/envelope)
;   hl:  Pointer to frequency values for NRx3 & NRx4 (forces start with bit 7 on NRx4)
WriteChannelRegisters::
    ld   a, d                                     ;; 1B:46CB $7A
    or   b                                        ;; 1B:46CC $B0
    ldh  [c], a ; rNRx1                           ;; 1B:46CD $E2
    inc  c                                        ;; 1B:46CE $0C
    ld   a, e                                     ;; 1B:46CF $7B
    ldh  [c], a ; rNRx2                           ;; 1B:46D0 $E2
    inc  c                                        ;; 1B:46D1 $0C
    ld   a, [hl+]                                 ;; 1B:46D2 $2A
    ldh  [c], a ; rNRx3                           ;; 1B:46D3 $E2
    inc  c                                        ;; 1B:46D4 $0C
    ld   a, [hl]                                  ;; 1B:46D5 $7E
    or   $80                                      ;; 1B:46D6 $F6 $80
    ldh  [c], a ; rNRx4                           ;; 1B:46D8 $E2

label_01B_46D9:
    pop  hl                                       ;; 1B:46D9 $E1
    dec  l                                        ;; 1B:46DA $2D
    ld   a, [hl-] ; D3x3                          ;; 1B:46DB $3A
    ld   [hl-], a ; D3x2                          ;; 1B:46DC $32
    dec  l                                        ;; 1B:46DD $2D

UpdateNextMusicChannel_1B::
    ld   de, wActiveChannelIndex                  ;; 1B:46DE $11 $50 $D3
    ld   a, [de]                                  ;; 1B:46E1 $1A
    cp   $04                                      ;; 1B:46E2 $FE $04
    jr   z, .lastChannel                          ;; 1B:46E4 $28 $09

    ; Update next channel
    inc  a                                        ;; 1B:46E6 $3C
    ld   [de], a ; [wActiveChannelIndex]++
    ld   a, $10                                   ;; 1B:46E8 $3E $10
    add  l                                        ;; 1B:46EA $85
    ld   l, a ; hl = D3x0 (next channel)          ;; 1B:46EB $6F
    jp   UpdateMusicChannel_1B                    ;; 1B:46EC $C3 $25 $45

.lastChannel
    ; This was the last channel. Done updating sound for now.
    ld   hl, wD31E                                ;; 1B:46EF $21 $1E $D3
    inc  [hl]                                     ;; 1B:46F2 $34
    ld   hl, wD320 + $0E                          ;; 1B:46F3 $21 $2E $D3
    inc  [hl]                                     ;; 1B:46F6 $34
    ld   hl, wD330 + $0E                          ;; 1B:46F7 $21 $3E $D3
    inc  [hl]                                     ;; 1B:46FA $34
    ret                                           ;; 1B:46FB $C9

label_01B_46FC:
    pop  hl                                       ;; 1B:46FC $E1
    ret                                           ;; 1B:46FD $C9

func_01B_46FE::
    push hl                                       ;; 1B:46FE $E5
    ld   a, l                                     ;; 1B:46FF $7D
    add  $06                                      ;; 1B:4700 $C6 $06
    ld   l, a                                     ;; 1B:4702 $6F
    ld   a, [hl]                                  ;; 1B:4703 $7E
    and  $0F                                      ;; 1B:4704 $E6 $0F
    jr   z, jr_01B_4720                           ;; 1B:4706 $28 $18

    ld   [wD351], a                               ;; 1B:4708 $EA $51 $D3
    ld   a, [wActiveChannelIndex]                 ;; 1B:470B $FA $50 $D3
    ld   c, $13                                   ;; 1B:470E $0E $13
    cp   $01                                      ;; 1B:4710 $FE $01
    jr   z, jr_01B_4762                           ;; 1B:4712 $28 $4E

    ld   c, $18                                   ;; 1B:4714 $0E $18
    cp   $02                                      ;; 1B:4716 $FE $02
    jr   z, jr_01B_4762                           ;; 1B:4718 $28 $48

    ld   c, $1D                                   ;; 1B:471A $0E $1D
    cp   $03                                      ;; 1B:471C $FE $03
    jr   z, jr_01B_4762                           ;; 1B:471E $28 $42

label_01B_4720:
jr_01B_4720:
    ld   a, [wActiveChannelIndex]                 ;; 1B:4720 $FA $50 $D3
    cp   $04                                      ;; 1B:4723 $FE $04
    jp   z, label_01B_46FC                        ;; 1B:4725 $CA $FC $46

    ld   de, wD3B6                                ;; 1B:4728 $11 $B6 $D3
    call IndexChannelArray                        ;; 1B:472B $CD $95 $48
    ld   a, [de]                                  ;; 1B:472E $1A
    and  a                                        ;; 1B:472F $A7
    jp   z, label_01B_4749                        ;; 1B:4730 $CA $49 $47

    ld   a, [wActiveChannelIndex]                 ;; 1B:4733 $FA $50 $D3
    ld   c, $13                                   ;; 1B:4736 $0E $13
    cp   $01                                      ;; 1B:4738 $FE $01
    jp   z, label_01B_485E                        ;; 1B:473A $CA $5E $48

    ld   c, $18                                   ;; 1B:473D $0E $18
    cp   $02                                      ;; 1B:473F $FE $02
    jp   z, label_01B_485E                        ;; 1B:4741 $CA $5E $48

    ld   c, $1D                                   ;; 1B:4744 $0E $1D
    jp   label_01B_485E                           ;; 1B:4746 $C3 $5E $48

label_01B_4749:
    ld   a, [wActiveChannelIndex]                 ;; 1B:4749 $FA $50 $D3
    cp   $03                                      ;; 1B:474C $FE $03
    jp   nz, label_01B_46FC                       ;; 1B:474E $C2 $FC $46

    ld   a, [wD39E]                               ;; 1B:4751 $FA $9E $D3
    and  a                                        ;; 1B:4754 $A7
    jp   nz, label_01B_4810                       ;; 1B:4755 $C2 $10 $48

    ld   a, [wActiveMusicTableIndex]              ;; 1B:4758 $FA $D9 $D3
    and  a                                        ;; 1B:475B $A7
    jp   nz, label_01B_4998                       ;; 1B:475C $C2 $98 $49

    jp   label_01B_46FC                           ;; 1B:475F $C3 $FC $46

jr_01B_4762:
    inc  l                                        ;; 1B:4762 $2C
    ld   a, [hl+]                                 ;; 1B:4763 $2A
    ld   e, a                                     ;; 1B:4764 $5F
    ld   a, [hl]                                  ;; 1B:4765 $7E
    and  $0F                                      ;; 1B:4766 $E6 $0F
    ld   d, a                                     ;; 1B:4768 $57
    push de                                       ;; 1B:4769 $D5
    ld   a, l                                     ;; 1B:476A $7D
    add  $04                                      ;; 1B:476B $C6 $04
    ld   l, a                                     ;; 1B:476D $6F
    ld   b, [hl]                                  ;; 1B:476E $46
    ld   a, [wD351]                               ;; 1B:476F $FA $51 $D3
    cp   $01                                      ;; 1B:4772 $FE $01
    jp   z, label_01B_48AB                        ;; 1B:4774 $CA $AB $48

    cp   $05                                      ;; 1B:4777 $FE $05
    jp   z, label_01B_4918                        ;; 1B:4779 $CA $18 $49

    ld   hl, $FFFF                                ;; 1B:477C $21 $FF $FF
    pop  de                                       ;; 1B:477F $D1
    add  hl, de                                   ;; 1B:4780 $19
    call func_01B_4884                            ;; 1B:4781 $CD $84 $48
    jp   label_01B_4720                           ;; 1B:4784 $C3 $20 $47

func_01B_4787::
    ld   a, [wD31B]                               ;; 1B:4787 $FA $1B $D3
    and  a                                        ;; 1B:478A $A7
    jr   nz, .jr_47AE                             ;; 1B:478B $20 $21

    ld   a, [wD317]                               ;; 1B:478D $FA $17 $D3
    and  a                                        ;; 1B:4790 $A7
    jr   z, .jr_47AE                              ;; 1B:4791 $28 $1B

    and  $0F                                      ;; 1B:4793 $E6 $0F
    ld   b, a                                     ;; 1B:4795 $47
    ld   hl, wD307                                ;; 1B:4796 $21 $07 $D3
    ld   a, [wD31E]                               ;; 1B:4799 $FA $1E $D3
    cp   [hl]                                     ;; 1B:479C $BE
    jr   nz, .jr_47AE                             ;; 1B:479D $20 $0F

    ld   c, $12                                   ;; 1B:479F $0E $12
    ld   de, wD31A                                ;; 1B:47A1 $11 $1A $D3
    ld   a, [wD31F]                               ;; 1B:47A4 $FA $1F $D3
    bit  7, a                                     ;; 1B:47A7 $CB $7F
    jr   nz, .jr_47AE                             ;; 1B:47A9 $20 $03

    call func_01B_47D2                            ;; 1B:47AB $CD $D2 $47

.jr_47AE
    ld   a, [wD320 + $0B]                         ;; 1B:47AE $FA $2B $D3
    and  a                                        ;; 1B:47B1 $A7
    ret  nz                                       ;; 1B:47B2 $C0

    ld   a, [wD320 + $07]                         ;; 1B:47B3 $FA $27 $D3
    and  a                                        ;; 1B:47B6 $A7
    ret  z                                        ;; 1B:47B7 $C8

    and  $0F                                      ;; 1B:47B8 $E6 $0F
    ld   b, a                                     ;; 1B:47BA $47
    ld   hl, wD308                                ;; 1B:47BB $21 $08 $D3
    ld   a, [wD320 + $0E]                         ;; 1B:47BE $FA $2E $D3
    cp   [hl]                                     ;; 1B:47C1 $BE
    ret  nz                                       ;; 1B:47C2 $C0

    ld   a, [wD320 + $0F]                         ;; 1B:47C3 $FA $2F $D3
    bit  7, a                                     ;; 1B:47C6 $CB $7F
    ret  nz                                       ;; 1B:47C8 $C0

    ld   c, $17                                   ;; 1B:47C9 $0E $17
    ld   de, wD320 + $0A                          ;; 1B:47CB $11 $2A $D3
    call func_01B_47D2                            ;; 1B:47CE $CD $D2 $47
    ret                                           ;; 1B:47D1 $C9

func_01B_47D2::
    push bc                                       ;; 1B:47D2 $C5
    dec  b                                        ;; 1B:47D3 $05
    ld   c, b                                     ;; 1B:47D4 $48
    ld   b, $00                                   ;; 1B:47D5 $06 $00
    ld   hl, HardcodedData_1b_4b13                ;; 1B:47D7 $21 $13 $4B
    add  hl, bc                                   ;; 1B:47DA $09
    ld   a, [hl]                                  ;; 1B:47DB $7E
    pop  bc                                       ;; 1B:47DC $C1
    ldh  [c], a ; NRx2                            ;; 1B:47DD $E2
    inc  c                                        ;; 1B:47DE $0C
    inc  c                                        ;; 1B:47DF $0C
    ld   a, [de]                                  ;; 1B:47E0 $1A
    or   $80                                      ;; 1B:47E1 $F6 $80
    ldh  [c], a                                   ;; 1B:47E3 $E2
    ret                                           ;; 1B:47E4 $C9

; Continues playing the music after a fanfare has played when you find your sword/weapon/heart container.
; Above is wrong, seems to set all tracks to MUSIC_NONE?
ContinueCurrentScreenMusic_1B:
    xor  a                                        ;; 1B:47E5 $AF
    ld   [wActiveMusicTable], a                   ;; 1B:47E6 $EA $CE $D3
    ldh  a, [hNextDefaultMusicTrack]              ;; 1B:47E9 $F0 $BF
    ld   [wMusicTrackToPlay], a                   ;; 1B:47EB $EA $68 $D3
    jp   PlayMusicTrack_1B_EntryPoint             ;; 1B:47EE $C3 $1E $40

soundOpcode96:
    ld   a, $01                                   ;; 1B:47F1 $3E $01

.setD3CDAndParseNext:
    ld   [wD3CD], a                               ;; 1B:47F3 $EA $CD $D3
    call IncChannelDefinitionPointer              ;; 1B:47F6 $CD $0B $44
    jp   ParseSoundOpcode                         ;; 1B:47F9 $C3 $31 $45

soundOpcode95:
    xor  a                                        ;; 1B:47FC $AF
    jr   soundOpcode96.setD3CDAndParseNext        ;; 1B:47FD $18 $F4

soundOpcode99:
    ld   a, $01                                   ;; 1B:47FF $3E $01

.setD39EAndParseNext
    ld   [wD39E], a                               ;; 1B:4801 $EA $9E $D3
    call IncChannelDefinitionPointer              ;; 1B:4804 $CD $0B $44
    jp   ParseSoundOpcode                         ;; 1B:4807 $C3 $31 $45

soundOpcode9A:
    xor  a                                        ;; 1B:480A $AF
    ld   [wD39E], a                               ;; 1B:480B $EA $9E $D3
    jr   soundOpcode99.setD39EAndParseNext        ;; 1B:480E $18 $F1

label_01B_4810:
    cp   $02                                      ;; 1B:4810 $FE $02
    jp   z, label_01B_46FC                        ;; 1B:4812 $CA $FC $46

    ld   bc, wD39F                                ;; 1B:4815 $01 $9F $D3
    call func_01B_4842                            ;; 1B:4818 $CD $42 $48
    ld   c, $1C                                   ;; 1B:481B $0E $1C
    ld   b, $40                                   ;; 1B:481D $06 $40
    cp   $03                                      ;; 1B:481F $FE $03
    jr   z, jr_01B_483D                           ;; 1B:4821 $28 $1A

    ld   b, $60                                   ;; 1B:4823 $06 $60
    cp   $05                                      ;; 1B:4825 $FE $05
    jr   z, jr_01B_483D                           ;; 1B:4827 $28 $14

    cp   $0A                                      ;; 1B:4829 $FE $0A
    jr   z, jr_01B_483D                           ;; 1B:482B $28 $10

    ld   b, $00                                   ;; 1B:482D $06 $00
    cp   $07                                      ;; 1B:482F $FE $07
    jr   z, jr_01B_483D                           ;; 1B:4831 $28 $0A

    cp   $0D                                      ;; 1B:4833 $FE $0D
    jp   nz, label_01B_46FC                       ;; 1B:4835 $C2 $FC $46

    ld   a, $02                                   ;; 1B:4838 $3E $02
    ld   [wD39E], a                               ;; 1B:483A $EA $9E $D3

label_01B_483D:
jr_01B_483D:
    ld   a, b                                     ;; 1B:483D $78
    ldh  [c], a                                   ;; 1B:483E $E2
    jp   label_01B_46FC                           ;; 1B:483F $C3 $FC $46

func_01B_4842::
    ld   a, [bc]                                  ;; 1B:4842 $0A
    inc  a                                        ;; 1B:4843 $3C
    ld   [bc], a                                  ;; 1B:4844 $02
    ret                                           ;; 1B:4845 $C9

soundOpcode97:
    ld   de, wD3B6                                ;; 1B:4846 $11 $B6 $D3
    call IndexChannelArray                        ;; 1B:4849 $CD $95 $48
    ld   a, $01                                   ;; 1B:484C $3E $01

.setDeAndParseNext:
    ld   [de], a                                  ;; 1B:484E $12
    call IncChannelDefinitionPointer              ;; 1B:484F $CD $0B $44
    jp   ParseSoundOpcode                         ;; 1B:4852 $C3 $31 $45

soundOpcode98:
    ld   de, wD3B6                                ;; 1B:4855 $11 $B6 $D3
    call IndexChannelArray                        ;; 1B:4858 $CD $95 $48
    xor  a                                        ;; 1B:485B $AF
    jr   soundOpcode97.setDeAndParseNext          ;; 1B:485C $18 $F0

label_01B_485E:
    inc  e                                        ;; 1B:485E $1C
    ld   a, [de]                                  ;; 1B:485F $1A
    and  a                                        ;; 1B:4860 $A7
    jr   nz, jr_01B_4874                          ;; 1B:4861 $20 $11

    inc  a                                        ;; 1B:4863 $3C
    ld   [de], a                                  ;; 1B:4864 $12
    pop  hl                                       ;; 1B:4865 $E1
    push hl                                       ;; 1B:4866 $E5
    call func_01B_4879                            ;; 1B:4867 $CD $79 $48

jr_01B_486A:
    ld   hl, hLinkPhysicsModifier                 ;; 1B:486A $21 $9C $FF
    add  hl, de                                   ;; 1B:486D $19
    call func_01B_4884                            ;; 1B:486E $CD $84 $48
    jp   label_01B_46FC                           ;; 1B:4871 $C3 $FC $46

jr_01B_4874:
    call func_01B_489E                            ;; 1B:4874 $CD $9E $48
    jr   jr_01B_486A                              ;; 1B:4877 $18 $F1

func_01B_4879::
    ld   a, $07                                   ;; 1B:4879 $3E $07
    add  l                                        ;; 1B:487B $85
    ld   l, a                                     ;; 1B:487C $6F
    ld   a, [hl+]                                 ;; 1B:487D $2A
    ld   e, a                                     ;; 1B:487E $5F
    ld   a, [hl]                                  ;; 1B:487F $7E
    and  $0F                                      ;; 1B:4880 $E6 $0F
    ld   d, a                                     ;; 1B:4882 $57
    ret                                           ;; 1B:4883 $C9

func_01B_4884::
    ld   de, wD3A4                                ;; 1B:4884 $11 $A4 $D3
    call IndexChannelArray                        ;; 1B:4887 $CD $95 $48
    ld   a, l                                     ;; 1B:488A $7D
    ldh  [c], a                                   ;; 1B:488B $E2
    ld   [de], a                                  ;; 1B:488C $12
    inc  c                                        ;; 1B:488D $0C
    inc  e                                        ;; 1B:488E $1C
    ld   a, h                                     ;; 1B:488F $7C
    and  $0F                                      ;; 1B:4890 $E6 $0F
    ldh  [c], a                                   ;; 1B:4892 $E2
    ld   [de], a                                  ;; 1B:4893 $12
    ret                                           ;; 1B:4894 $C9

; Input:
;   de:  Points to an array of words (2 bytes) with an entry for each channel
; Output:
;   de:  Pointer to array entry for active channel
IndexChannelArray::
    ld   a, [wActiveChannelIndex]                 ;; 1B:4895 $FA $50 $D3
    dec  a                                        ;; 1B:4898 $3D
    sla  a                                        ;; 1B:4899 $CB $27
    add  e                                        ;; 1B:489B $83
    ld   e, a                                     ;; 1B:489C $5F
    ret                                           ;; 1B:489D $C9

func_01B_489E::
    ld   de, wD3A4                                ;; 1B:489E $11 $A4 $D3
    call IndexChannelArray                        ;; 1B:48A1 $CD $95 $48
    ld   a, [de]                                  ;; 1B:48A4 $1A
    ld   l, a                                     ;; 1B:48A5 $6F
    inc  e                                        ;; 1B:48A6 $1C
    ld   a, [de]                                  ;; 1B:48A7 $1A
    ld   d, a                                     ;; 1B:48A8 $57
    ld   e, l                                     ;; 1B:48A9 $5D
    ret                                           ;; 1B:48AA $C9

label_01B_48AB:
    pop  de                                       ;; 1B:48AB $D1
    ld   de, wD3B0                                ;; 1B:48AC $11 $B0 $D3
    call IndexChannelArray                        ;; 1B:48AF $CD $95 $48
    ld   a, [de]                                  ;; 1B:48B2 $1A
    inc  a                                        ;; 1B:48B3 $3C
    ld   [de], a                                  ;; 1B:48B4 $12
    inc  e                                        ;; 1B:48B5 $1C
    cp   $19                                      ;; 1B:48B6 $FE $19
    jr   z, jr_01B_48EB                           ;; 1B:48B8 $28 $31

    cp   $2D                                      ;; 1B:48BA $FE $2D
    jr   z, jr_01B_48E4                           ;; 1B:48BC $28 $26

    ld   a, [de]                                  ;; 1B:48BE $1A
    and  a                                        ;; 1B:48BF $A7
    jp   z, label_01B_4720                        ;; 1B:48C0 $CA $20 $47

jr_01B_48C3:
    dec  e                                        ;; 1B:48C3 $1D
    ld   a, [de]                                  ;; 1B:48C4 $1A
    sub  $19                                      ;; 1B:48C5 $D6 $19
    sla  a                                        ;; 1B:48C7 $CB $27
    ld   l, a                                     ;; 1B:48C9 $6F
    ld   h, $00                                   ;; 1B:48CA $26 $00
    ld   de, Data_01B_48F0                        ;; 1B:48CC $11 $F0 $48
    add  hl, de                                   ;; 1B:48CF $19
    ld   a, [hl+]                                 ;; 1B:48D0 $2A
    ld   d, a                                     ;; 1B:48D1 $57
    ld   a, [hl]                                  ;; 1B:48D2 $7E
    ld   e, a                                     ;; 1B:48D3 $5F
    pop  hl                                       ;; 1B:48D4 $E1
    push hl                                       ;; 1B:48D5 $E5
    push de                                       ;; 1B:48D6 $D5
    call func_01B_4879                            ;; 1B:48D7 $CD $79 $48
    ld   h, d                                     ;; 1B:48DA $62
    ld   l, e                                     ;; 1B:48DB $6B
    pop  de                                       ;; 1B:48DC $D1
    add  hl, de                                   ;; 1B:48DD $19
    call func_01B_4884                            ;; 1B:48DE $CD $84 $48
    jp   label_01B_4720                           ;; 1B:48E1 $C3 $20 $47

jr_01B_48E4:
    dec  e                                        ;; 1B:48E4 $1D
    ld   a, $19                                   ;; 1B:48E5 $3E $19
    ld   [de], a                                  ;; 1B:48E7 $12
    inc  e                                        ;; 1B:48E8 $1C
    jr   jr_01B_48C3                              ;; 1B:48E9 $18 $D8

jr_01B_48EB:
    ld   a, $01                                   ;; 1B:48EB $3E $01
    ld   [de], a                                  ;; 1B:48ED $12
    jr   jr_01B_48C3                              ;; 1B:48EE $18 $D3

Data_01B_48F0::
    db   $00, $00, $00, $00, $00, $01, $00, $01   ;; 1B:48F0
    db   $00, $02, $00, $02, $00, $00, $00, $00   ;; 1B:48F8
    db   $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE   ;; 1B:4900
    db   $00, $00, $00, $01, $00, $02, $00, $01   ;; 1B:4908
    db   $00, $00, $FF, $FF, $FF, $FE, $FF, $FF   ;; 1B:4910

label_01B_4918:
    pop  de                                       ;; 1B:4918 $D1
    ld   de, wD3D0                                ;; 1B:4919 $11 $D0 $D3
    call IndexChannelArray                        ;; 1B:491C $CD $95 $48
    ld   a, [de]                                  ;; 1B:491F $1A
    inc  a                                        ;; 1B:4920 $3C
    ld   [de], a                                  ;; 1B:4921 $12
    inc  e                                        ;; 1B:4922 $1C
    cp   $21                                      ;; 1B:4923 $FE $21
    jr   z, jr_01B_4946                           ;; 1B:4925 $28 $1F

jr_01B_4927:
    dec  e                                        ;; 1B:4927 $1D
    ld   a, [de]                                  ;; 1B:4928 $1A
    sla  a                                        ;; 1B:4929 $CB $27
    ld   l, a                                     ;; 1B:492B $6F
    ld   h, $00                                   ;; 1B:492C $26 $00
    ld   de, Data_01B_494D                        ;; 1B:492E $11 $4D $49
    add  hl, de                                   ;; 1B:4931 $19
    ld   a, [hl+]                                 ;; 1B:4932 $2A
    ld   d, a                                     ;; 1B:4933 $57
    ld   a, [hl]                                  ;; 1B:4934 $7E
    ld   e, a                                     ;; 1B:4935 $5F
    pop  hl                                       ;; 1B:4936 $E1
    push hl                                       ;; 1B:4937 $E5
    push de                                       ;; 1B:4938 $D5
    call func_01B_4879                            ;; 1B:4939 $CD $79 $48
    ld   h, d                                     ;; 1B:493C $62
    ld   l, e                                     ;; 1B:493D $6B
    pop  de                                       ;; 1B:493E $D1
    add  hl, de                                   ;; 1B:493F $19
    call func_01B_4884                            ;; 1B:4940 $CD $84 $48
    jp   label_01B_4720                           ;; 1B:4943 $C3 $20 $47

jr_01B_4946:
    dec  e                                        ;; 1B:4946 $1D
    ld   a, $01                                   ;; 1B:4947 $3E $01
    ld   [de], a                                  ;; 1B:4949 $12
    inc  e                                        ;; 1B:494A $1C
    jr   jr_01B_4927                              ;; 1B:494B $18 $DA

Data_01B_494D::
    db   $00, $08, $00, $00, $FF, $F8, $00, $00   ;; 1B:494D
    db   $00, $0A, $00, $02, $FF, $FA, $00, $02   ;; 1B:4955
    db   $00, $0C, $00, $04, $FF, $FC, $00, $04   ;; 1B:495D
    db   $00, $0A, $00, $02, $FF, $FA, $00, $02   ;; 1B:4965
    db   $00, $08, $00, $00, $FF, $F8, $00, $00   ;; 1B:496D
    db   $00, $06, $FF, $FE, $FF, $F6, $FF, $FE   ;; 1B:4975
    db   $00, $04, $FF, $FC, $FF, $F4, $FF, $FC   ;; 1B:497D
    db   $00, $06, $FF, $FE, $FF, $F6, $FF, $FE   ;; 1B:4985

soundOpcode94:
    ld   a, $01                                   ;; 1B:498D $3E $01
    ld   [wActiveMusicTableIndex], a              ;; 1B:498F $EA $D9 $D3
    call IncChannelDefinitionPointer              ;; 1B:4992 $CD $0B $44
    jp   ParseSoundOpcode                         ;; 1B:4995 $C3 $31 $45

label_01B_4998:
    cp   $02                                      ;; 1B:4998 $FE $02
    jp   z, label_01B_46FC                        ;; 1B:499A $CA $FC $46

    ld   bc, wD3DA                                ;; 1B:499D $01 $DA $D3
    call func_01B_4842                            ;; 1B:49A0 $CD $42 $48
    ld   c, $1C                                   ;; 1B:49A3 $0E $1C
    ld   b, $60                                   ;; 1B:49A5 $06 $60
    cp   $03                                      ;; 1B:49A7 $FE $03
    jp   z, label_01B_483D                        ;; 1B:49A9 $CA $3D $48

    ld   b, $40                                   ;; 1B:49AC $06 $40
    cp   $05                                      ;; 1B:49AE $FE $05
    jp   z, label_01B_483D                        ;; 1B:49B0 $CA $3D $48

    ld   b, $20                                   ;; 1B:49B3 $06 $20
    cp   $06                                      ;; 1B:49B5 $FE $06
    jp   nz, label_01B_46FC                       ;; 1B:49B7 $C2 $FC $46

    ld   a, $02                                   ;; 1B:49BA $3E $02
    ld   [wActiveMusicTableIndex], a              ;; 1B:49BC $EA $D9 $D3
    jp   label_01B_483D                           ;; 1B:49BF $C3 $3D $48


SquareAndWaveFrequencyTable::
    dw   $0F00, $002C, $009C, $0106
    dw   $016B, $01C9, $0223, $0277
    dw   $02C6, $0312, $0356, $039B
    dw   $03DA, $0416, $044E, $0483
    dw   $04B5, $04E5, $0511, $053B
    dw   $0563, $0589, $05AC, $05CE
    dw   $05ED, $060A, $0627, $0642
    dw   $065B, $0672, $0689, $069E
    dw   $06B2, $06C4, $06D6, $06E7
    dw   $06F7, $0706, $0714, $0721
    dw   $072D, $0739, $0744, $074F
    dw   $0759, $0762, $076B, $0774
    dw   $077B, $0783, $078A, $0790
    dw   $0797, $079D, $07A2, $07A7
    dw   $07AC, $07B1, $07B6, $07BA
    dw   $07BE, $07C1, $07C5, $07C8
    dw   $07CB, $07CE, $07D1, $07D4
    dw   $07D6, $07D9, $07DB, $07DD
    dw   $07DF

NoiseFrequencyTable::
    db   $00
    db   $00, $00, $00, $00, $C0
    db   $09, $00, $38, $34, $C0
    db   $19, $00, $38, $33, $C0
    db   $46, $00, $13, $10, $C0
    db   $23, $00, $20, $40, $80
    db   $51, $00, $20, $07, $80
    db   $A1, $00, $00, $18, $80
    db   $F2, $00, $00, $18, $80
    db   $81, $00, $3A, $10, $C0
    db   $80, $00, $00, $10, $C0
    db   $57, $00, $00, $60, $80
    db   $01, $02, $04, $08, $10
    db   $20, $06, $0C, $18, $01
    db   $01, $01, $01, $01, $30
    db   $01, $03, $06, $0C, $18
    db   $30, $09, $12, $24, $02
    db   $04, $08, $01, $01, $48


include "data/music/music_tracks_data_1b_1.asm"


label_01B_4E2C:
    xor  a                                        ;; 1B:4E2C $AF
    ld   [wD379], a                               ;; 1B:4E2D $EA $79 $D3
    ld   [wD34F], a                               ;; 1B:4E30 $EA $4F $D3
    ld   [wD398], a                               ;; 1B:4E33 $EA $98 $D3
    ld   [wD393], a                               ;; 1B:4E36 $EA $93 $D3
    ld   [wD3C9], a                               ;; 1B:4E39 $EA $C9 $D3
    ld   [wD3A3], a                               ;; 1B:4E3C $EA $A3 $D3
    ld   [wD3E2+3], a                             ;; 1B:4E3F $EA $E5 $D3
    ld   a, $08                                   ;; 1B:4E42 $3E $08
    ldh  [rNR42], a                               ;; 1B:4E44 $E0 $21
    ld   a, $80                                   ;; 1B:4E46 $3E $80
    ldh  [rNR44], a                               ;; 1B:4E48 $E0 $23

label_01B_4E4A:
    ld   a, $FF                                   ;; 1B:4E4A $3E $FF
    ldh  [rNR51], a                               ;; 1B:4E4C $E0 $25
    ld   a, $03                                   ;; 1B:4E4E $3E $03
    ld   [wD355], a                               ;; 1B:4E50 $EA $55 $D3
    xor  a                                        ;; 1B:4E53 $AF
    ld   [wActiveMusicIndex], a                   ;; 1B:4E54 $EA $69 $D3

StopSquareAndWaveChannels_1B::
    xor  a                                        ;; 1B:4E57 $AF
    ld   [wD361], a                               ;; 1B:4E58 $EA $61 $D3
    ld   [wD371], a                               ;; 1B:4E5B $EA $71 $D3
    ld   [wD31F], a                               ;; 1B:4E5E $EA $1F $D3
    ld   [wD320 + $0F], a                         ;; 1B:4E61 $EA $2F $D3
    ld   [wD330 + $0F], a                         ;; 1B:4E64 $EA $3F $D3
    ld   [wD39E], a                               ;; 1B:4E67 $EA $9E $D3
    ld   [wD39F], a                               ;; 1B:4E6A $EA $9F $D3
    ld   [wActiveMusicTableIndex], a              ;; 1B:4E6D $EA $D9 $D3
    ld   [wD3DA], a                               ;; 1B:4E70 $EA $DA $D3
    ld   [wD3B6], a                               ;; 1B:4E73 $EA $B6 $D3
    ld   [wD3B6+1], a                             ;; 1B:4E76 $EA $B7 $D3
    ld   [wD3B6+2], a                             ;; 1B:4E79 $EA $B8 $D3
    ld   [wD3B6+3], a                             ;; 1B:4E7C $EA $B9 $D3
    ld   [wD3B6+4], a                             ;; 1B:4E7F $EA $BA $D3
    ld   [wD3B6+5], a                             ;; 1B:4E82 $EA $BB $D3
    ld   [wD394], a                               ;; 1B:4E85 $EA $94 $D3
    ld   [wD394+1], a                             ;; 1B:4E88 $EA $95 $D3
    ld   [wD396], a                               ;; 1B:4E8B $EA $96 $D3
    ld   [wD390], a                               ;; 1B:4E8E $EA $90 $D3
    ld   [wD390+1], a                             ;; 1B:4E91 $EA $91 $D3
    ld   [wD392], a                               ;; 1B:4E94 $EA $92 $D3
    ld   [wD3C6], a                               ;; 1B:4E97 $EA $C6 $D3
    ld   [wD3C7], a                               ;; 1B:4E9A $EA $C7 $D3
    ld   [wD3C8], a                               ;; 1B:4E9D $EA $C8 $D3
    ld   [wD3A0], a                               ;; 1B:4EA0 $EA $A0 $D3
    ld   [wD3A1], a                               ;; 1B:4EA3 $EA $A1 $D3
    ld   [wD3A2], a                               ;; 1B:4EA6 $EA $A2 $D3
    ld   [wD3CD], a                               ;; 1B:4EA9 $EA $CD $D3
    ld   [wD3D6], a                               ;; 1B:4EAC $EA $D6 $D3
    ld   [wD3D7], a                               ;; 1B:4EAF $EA $D7 $D3
    ld   [wD3D7+1], a                             ;; 1B:4EB2 $EA $D8 $D3
    ld   [wD3DC], a                               ;; 1B:4EB5 $EA $DC $D3
    ld   [wD3E7], a                               ;; 1B:4EB8 $EA $E7 $D3
    ld   [wD3E2], a                               ;; 1B:4EBB $EA $E2 $D3
    ld   [wD3E2+1], a                             ;; 1B:4EBE $EA $E3 $D3
    ld   [wD3E2+2], a                             ;; 1B:4EC1 $EA $E4 $D3
    ld   a, $08                                   ;; 1B:4EC4 $3E $08
    ldh  [rNR12], a                               ;; 1B:4EC6 $E0 $12
    ldh  [rNR22], a                               ;; 1B:4EC8 $E0 $17
    ld   a, $80                                   ;; 1B:4ECA $3E $80
    ldh  [rNR14], a                               ;; 1B:4ECC $E0 $14
    ldh  [rNR24], a                               ;; 1B:4ECE $E0 $19
    xor  a                                        ;; 1B:4ED0 $AF
    ldh  [rNR10], a                               ;; 1B:4ED1 $E0 $10
    ldh  [rNR30], a                               ;; 1B:4ED3 $E0 $1A
    ret                                           ;; 1B:4ED5 $C9
