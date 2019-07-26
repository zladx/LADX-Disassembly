; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

func_018_4000::
    ld   a, [wC116]                               ; $4000: $FA $16 $C1
    and  a                                        ; $4003: $A7
    jr   nz, jr_018_400F                          ; $4004: $20 $09

    inc  a                                        ; $4006: $3C
    ld   [wC116], a                               ; $4007: $EA $16 $C1
    ld   a, $14                                   ; $400A: $3E $14
    ld   [wBGMapToLoad], a                        ; $400C: $EA $FF $D6

jr_018_400F:
    ldh  a, [wActiveEntityPosX]                   ; $400F: $F0 $EE
    cp   $48                                      ; $4011: $FE $48
    jp   nz, label_018_4373                       ; $4013: $C2 $73 $43

    call $435A                                    ; $4016: $CD $5A $43
    call func_018_7D36                            ; $4019: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $401C: $F0 $F0
    rst  $00                                      ; $401E: $C7
    dec  l                                        ; $401F: $2D
    ld   b, b                                     ; $4020: $40
    sub  a                                        ; $4021: $97
    ld   b, b                                     ; $4022: $40
    rst  $10                                      ; $4023: $D7
    ld   b, b                                     ; $4024: $40
    call z, $5241                                 ; $4025: $CC $41 $52
    ld   b, d                                     ; $4028: $42
    ld   l, e                                     ; $4029: $6B
    ld   b, d                                     ; $402A: $42
    and  l                                        ; $402B: $A5
    ld   b, d                                     ; $402C: $42
    xor  a                                        ; $402D: $AF
    ld   [$D201], a                               ; $402E: $EA $01 $D2
    ld   a, [$DB49]                               ; $4031: $FA $49 $DB
    and  $01                                      ; $4034: $E6 $01
    jr   z, jr_018_404A                           ; $4036: $28 $12

    ldh  a, [hLinkPositionY]                      ; $4038: $F0 $99
    ld   hl, $FFEF                                ; $403A: $21 $EF $FF
    sub  [hl]                                     ; $403D: $96
    add  $28                                      ; $403E: $C6 $28
    cp   $50                                      ; $4040: $FE $50
    call func_018_7DA0                            ; $4042: $CD $A0 $7D
    jr   nc, jr_018_407C                          ; $4045: $30 $35

    jp   label_018_42B2                           ; $4047: $C3 $B2 $42

jr_018_404A:
    ldh  a, [hLinkPositionY]                      ; $404A: $F0 $99
    cp   $4C                                      ; $404C: $FE $4C
    jr   nc, jr_018_407C                          ; $404E: $30 $2C

    ld   a, $4C                                   ; $4050: $3E $4C
    ldh  [hLinkPositionY], a                      ; $4052: $E0 $99
    call ClearLinkPositionIncrement               ; $4054: $CD $8E $17
    call label_CAF                                ; $4057: $CD $AF $0C
    ld   e, $0B                                   ; $405A: $1E $0B
    ld   hl, wAButtonSlot                         ; $405C: $21 $00 $DB

jr_018_405F:
    ld   a, [hl+]                                 ; $405F: $2A
    cp   $09                                      ; $4060: $FE $09
    jr   z, jr_018_4074                           ; $4062: $28 $10

    dec  e                                        ; $4064: $1D
    ld   a, e                                     ; $4065: $7B
    cp   $FF                                      ; $4066: $FE $FF
    jr   nz, jr_018_405F                          ; $4068: $20 $F5

    ld   a, $DB                                   ; $406A: $3E $DB
    call func_018_4087                            ; $406C: $CD $87 $40
    call IncrementEntityWalkingAttr               ; $406F: $CD $12 $3B
    ld   [hl], b                                  ; $4072: $70
    ret                                           ; $4073: $C9

jr_018_4074:
    ld   a, $DC                                   ; $4074: $3E $DC
    call func_018_4087                            ; $4076: $CD $87 $40
    call IncrementEntityWalkingAttr               ; $4079: $CD $12 $3B

func_018_407C:
label_018_407C:
jr_018_407C:
    ldh  a, [hFrameCounter]                       ; $407C: $F0 $E7
    rra                                           ; $407E: $1F
    rra                                           ; $407F: $1F
    rra                                           ; $4080: $1F
    rra                                           ; $4081: $1F
    and  $01                                      ; $4082: $E6 $01
    jp   label_3B0C                               ; $4084: $C3 $0C $3B

func_018_4087:
label_018_4087:
    ld   e, a                                     ; $4087: $5F
    ldh  a, [hLinkPositionY]                      ; $4088: $F0 $99
    push af                                       ; $408A: $F5
    ld   a, $10                                   ; $408B: $3E $10
    ldh  [hLinkPositionY], a                      ; $408D: $E0 $99
    ld   a, e                                     ; $408F: $7B
    call OpenDialog                               ; $4090: $CD $85 $23
    pop  af                                       ; $4093: $F1
    ldh  [hLinkPositionY], a                      ; $4094: $E0 $99
    ret                                           ; $4096: $C9

    call func_018_407C                            ; $4097: $CD $7C $40
    ld   a, [wDialogState]                        ; $409A: $FA $9F $C1
    and  a                                        ; $409D: $A7
    jr   nz, jr_018_40D6                          ; $409E: $20 $36

    call IncrementEntityWalkingAttr               ; $40A0: $CD $12 $3B
    ld   a, [wC177]                               ; $40A3: $FA $77 $C1
    and  a                                        ; $40A6: $A7
    jr   z, jr_018_40AF                           ; $40A7: $28 $06

jr_018_40A9:
    ld   [hl], b                                  ; $40A9: $70
    ld   a, $DE                                   ; $40AA: $3E $DE
    jp   label_018_4087                           ; $40AC: $C3 $87 $40

jr_018_40AF:
    ld   a, [wRupeeCountHigh]                     ; $40AF: $FA $5D $DB
    cp   $03                                      ; $40B2: $FE $03
    jr   c, jr_018_40A9                           ; $40B4: $38 $F3

    ld   a, [wSubstractRupeeBufferHigh]           ; $40B6: $FA $92 $DB
    add  $2C                                      ; $40B9: $C6 $2C
    ld   [wSubstractRupeeBufferHigh], a           ; $40BB: $EA $92 $DB
    ld   a, [wAddRupeeBufferLow]                  ; $40BE: $FA $91 $DB
    adc  $01                                      ; $40C1: $CE $01
    ld   [wAddRupeeBufferLow], a                  ; $40C3: $EA $91 $DB
    call GetEntityTransitionCountdown             ; $40C6: $CD $05 $0C
    ld   [hl], $FF                                ; $40C9: $36 $FF
    call label_27F2                               ; $40CB: $CD $F2 $27
    call func_018_45A0                            ; $40CE: $CD $A0 $45
    ld   a, $01                                   ; $40D1: $3E $01
    ld   [wAlternateBackgroundEnabled], a         ; $40D3: $EA $00 $C5

jr_018_40D6:
    ret                                           ; $40D6: $C9

    ld   a, $02                                   ; $40D7: $3E $02
    ldh  [$FFA1], a                               ; $40D9: $E0 $A1
    ld   [wC167], a                               ; $40DB: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $40DE: $CD $05 $0C
    jr   nz, jr_018_40F0                          ; $40E1: $20 $0D

    ld   a, $35                                   ; $40E3: $3E $35
    ld   [wWorldMusicTrack], a                    ; $40E5: $EA $68 $D3
    ld   a, $01                                   ; $40E8: $3E $01
    ld   [$D215], a                               ; $40EA: $EA $15 $D2
    jp   IncrementEntityWalkingAttr               ; $40ED: $C3 $12 $3B

jr_018_40F0:
    ret                                           ; $40F0: $C9

func_018_40F1:
    ld   a, $30                                   ; $40F1: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $40F3: $E0 $CD
    ld   a, $18                                   ; $40F5: $3E $18
    ldh  [hSwordIntersectedAreaX], a              ; $40F7: $E0 $CE
    jp   label_018_449D                           ; $40F9: $C3 $9D $44

func_018_40FC:
    ld   a, $30                                   ; $40FC: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $40FE: $E0 $CD
    ld   a, $68                                   ; $4100: $3E $68
    ldh  [hSwordIntersectedAreaX], a              ; $4102: $E0 $CE
    jp   label_018_449D                           ; $4104: $C3 $9D $44

func_018_4107:
    ld   a, $38                                   ; $4107: $3E $38
    ldh  [hSwordIntersectedAreaX], a              ; $4109: $E0 $CE
    ld   a, $08                                   ; $410B: $3E $08
    ldh  [hSwordIntersectedAreaY], a              ; $410D: $E0 $CD
    jp   label_018_4402                           ; $410F: $C3 $02 $44

func_018_4112:
    ld   a, $38                                   ; $4112: $3E $38
    ldh  [hSwordIntersectedAreaX], a              ; $4114: $E0 $CE
    ld   a, $08                                   ; $4116: $3E $08
    ldh  [hSwordIntersectedAreaY], a              ; $4118: $E0 $CD
    jp   label_018_444E                           ; $411A: $C3 $4E $44

    ret                                           ; $411D: $C9

Data_018_411E::
    db   $03, $03, $03, $03, $03, $03, $03, $01, $02, $04, $03, $01, $02, $04, $03, $01
    db   $02, $04, $03, $01, $02, $04, $03, $01, $02, $04, $03, $03, $03, $03, $03, $04
    db   $03, $01, $02, $04, $03, $01, $02, $04, $03, $01, $02, $04, $03, $01, $02, $04
    db   $03, $01, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $05, $05, $05, $05
    db   $05, $05, $01, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01
    db   $04, $01, $05, $01, $04, $01, $05, $05, $05, $05, $01, $01, $05, $01, $04, $01
    db   $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $04
    db   $04, $04, $04, $04, $01, $01, $01, $01, $05, $05, $05, $05, $01, $01, $01, $01
    db   $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01
    db   $04, $01, $05, $05, $01, $01, $01, $01, $05, $01, $04, $01, $05, $01, $04, $01
    db   $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $04, $04, $04

    ld   a, $02                                   ; $41CC: $3E $02
    ldh  [$FFA1], a                               ; $41CE: $E0 $A1
    ld   [wC167], a                               ; $41D0: $EA $67 $C1
    ld   a, [$D211]                               ; $41D3: $FA $11 $D2
    and  a                                        ; $41D6: $A7
    jr   nz, jr_018_41F9                          ; $41D7: $20 $20

    ld   a, [$D210]                               ; $41D9: $FA $10 $D2
    cp   $00                                      ; $41DC: $FE $00
    call z, func_018_4107                         ; $41DE: $CC $07 $41
    ld   a, [$D210]                               ; $41E1: $FA $10 $D2
    cp   $01                                      ; $41E4: $FE $01
    call z, func_018_4112                         ; $41E6: $CC $12 $41
    ld   a, [$D210]                               ; $41E9: $FA $10 $D2
    cp   $38                                      ; $41EC: $FE $38
    call z, func_018_40F1                         ; $41EE: $CC $F1 $40
    ld   a, [$D210]                               ; $41F1: $FA $10 $D2
    cp   $70                                      ; $41F4: $FE $70
    call z, func_018_40FC                         ; $41F6: $CC $FC $40

jr_018_41F9:
    ld   a, [$D210]                               ; $41F9: $FA $10 $D2
    add  $01                                      ; $41FC: $C6 $01
    ld   [$D210], a                               ; $41FE: $EA $10 $D2
    ld   e, a                                     ; $4201: $5F
    ld   a, [$D211]                               ; $4202: $FA $11 $D2
    adc  $00                                      ; $4205: $CE $00
    ld   [$D211], a                               ; $4207: $EA $11 $D2
    ld   d, a                                     ; $420A: $57
    cp   $06                                      ; $420B: $FE $06
    jr   nz, jr_018_4220                          ; $420D: $20 $11

    ld   a, e                                     ; $420F: $7B
    cp   $20                                      ; $4210: $FE $20
    jr   nz, jr_018_4220                          ; $4212: $20 $0C

    ld   a, $DD                                   ; $4214: $3E $DD
    call func_018_4087                            ; $4216: $CD $87 $40
    xor  a                                        ; $4219: $AF
    ld   [wAlternateBackgroundEnabled], a         ; $421A: $EA $00 $C5
    jp   IncrementEntityWalkingAttr               ; $421D: $C3 $12 $3B

jr_018_4220:
    ld   a, [$D212]                               ; $4220: $FA $12 $D2
    inc  a                                        ; $4223: $3C
    cp   $1C                                      ; $4224: $FE $1C
    jr   nz, jr_018_4230                          ; $4226: $20 $08

    ld   a, [$D213]                               ; $4228: $FA $13 $D2
    inc  a                                        ; $422B: $3C
    ld   [$D213], a                               ; $422C: $EA $13 $D2
    xor  a                                        ; $422F: $AF

jr_018_4230:
    ld   [$D212], a                               ; $4230: $EA $12 $D2
    ld   a, [$D213]                               ; $4233: $FA $13 $D2
    ld   e, a                                     ; $4236: $5F
    ld   d, b                                     ; $4237: $50
    ld   hl, Data_018_411E                        ; $4238: $21 $1E $41
    add  hl, de                                   ; $423B: $19
    ld   a, [hl]                                  ; $423C: $7E
    call label_3B0C                               ; $423D: $CD $0C $3B
    ld   hl, $4158                                ; $4240: $21 $58 $41
    add  hl, de                                   ; $4243: $19
    ld   a, [hl]                                  ; $4244: $7E
    ld   [$C3B1], a                               ; $4245: $EA $B1 $C3
    ld   hl, $4192                                ; $4248: $21 $92 $41
    add  hl, de                                   ; $424B: $19
    ld   a, [hl]                                  ; $424C: $7E
    ld   [$C3B2], a                               ; $424D: $EA $B2 $C3
    ret                                           ; $4250: $C9

    ret                                           ; $4251: $C9

    ld   a, [wDialogState]                        ; $4252: $FA $9F $C1
    and  a                                        ; $4255: $A7
    jr   nz, jr_018_4268                          ; $4256: $20 $10

    ld   [$D215], a                               ; $4258: $EA $15 $D2
    call GetEntityTransitionCountdown             ; $425B: $CD $05 $0C
    ld   [hl], $70                                ; $425E: $36 $70
    ld   a, $10                                   ; $4260: $3E $10
    ld   [wWorldMusicTrack], a                    ; $4262: $EA $68 $D3
    call IncrementEntityWalkingAttr               ; $4265: $CD $12 $3B

jr_018_4268:
    jp   label_018_407C                           ; $4268: $C3 $7C $40

    call GetEntityTransitionCountdown             ; $426B: $CD $05 $0C
    jr   nz, jr_018_427D                          ; $426E: $20 $0D

    ld   a, $02                                   ; $4270: $3E $02
    ld   [$DB4A], a                               ; $4272: $EA $4A $DB
    ld   hl, $DB49                                ; $4275: $21 $49 $DB
    set  0, [hl]                                  ; $4278: $CB $C6
    jp   IncrementEntityWalkingAttr               ; $427A: $C3 $12 $3B

jr_018_427D:
    cp   $08                                      ; $427D: $FE $08
    jr   nz, jr_018_4287                          ; $427F: $20 $06

    dec  [hl]                                     ; $4281: $35
    ld   a, $DF                                   ; $4282: $3E $DF
    call func_018_4087                            ; $4284: $CD $87 $40

jr_018_4287:
    ld   a, $6C                                   ; $4287: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4289: $E0 $9D
    ld   a, $02                                   ; $428B: $3E $02
    ldh  [$FFA1], a                               ; $428D: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $428F: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $4291: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4293: $F0 $99
    sub  $0C                                      ; $4295: $D6 $0C
    ldh  [wActiveEntityPosY], a                   ; $4297: $E0 $EC
    ld   de, $474D                                ; $4299: $11 $4D $47
    xor  a                                        ; $429C: $AF
    ldh  [hActiveEntityUnknownG], a               ; $429D: $E0 $F1
    call label_3C77                               ; $429F: $CD $77 $3C
    jp   label_018_407C                           ; $42A2: $C3 $7C $40

    ld   a, [wDialogState]                        ; $42A5: $FA $9F $C1
    and  a                                        ; $42A8: $A7
    jr   nz, jr_018_42B7                          ; $42A9: $20 $0C

    ld   [wC167], a                               ; $42AB: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $42AE: $CD $12 $3B
    ld   [hl], b                                  ; $42B1: $70

label_018_42B2:
    ld   a, $E0                                   ; $42B2: $3E $E0
    call func_018_4087                            ; $42B4: $CD $87 $40

jr_018_42B7:
    jp   label_018_407C                           ; $42B7: $C3 $7C $40

Data_018_42BA::
    db   $00, $00, $60, $00, $00, $08, $62, $00, $00, $10, $64, $00, $00, $18, $66, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00, $70, $00, $00, $08, $72, $00, $00, $10, $74, $00, $00, $18, $76, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00, $78, $00, $00, $08, $7A, $00, $00, $10, $7C, $00, $00, $18, $7E, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00

    ld   a, [hl]                                  ; $431C: $7E
    jr   nz, jr_018_431F                          ; $431D: $20 $00

jr_018_431F:
    ld   [$207C], sp                              ; $431F: $08 $7C $20
    nop                                           ; $4322: $00
    db   $10                                      ; $4323: $10
    ld   a, d                                     ; $4324: $7A
    jr   nz, jr_018_4327                          ; $4325: $20 $00

jr_018_4327:
    jr   jr_018_43A1                              ; $4327: $18 $78

    jr   nz, jr_018_433B                          ; $4329: $20 $10

    nop                                           ; $432B: $00
    ld   l, [hl]                                  ; $432C: $6E
    jr   nz, jr_018_433F                          ; $432D: $20 $10

    ld   [$206C], sp                              ; $432F: $08 $6C $20
    db   $10                                      ; $4332: $10
    db   $10                                      ; $4333: $10
    ld   l, d                                     ; $4334: $6A
    jr   nz, jr_018_4347                          ; $4335: $20 $10

    jr   jr_018_43A1                              ; $4337: $18 $68

    jr   nz, jr_018_433B                          ; $4339: $20 $00

jr_018_433B:
    nop                                           ; $433B: $00
    db   $76                                      ; $433C: $76
    jr   nz, jr_018_433F                          ; $433D: $20 $00

jr_018_433F:
    ld   [$2074], sp                              ; $433F: $08 $74 $20
    nop                                           ; $4342: $00
    db   $10                                      ; $4343: $10
    ld   [hl], d                                  ; $4344: $72
    jr   nz, jr_018_4347                          ; $4345: $20 $00

jr_018_4347:
    jr   jr_018_43B9                              ; $4347: $18 $70

    jr   nz, jr_018_435B                          ; $4349: $20 $10

jr_018_434B:
    nop                                           ; $434B: $00
    ld   l, [hl]                                  ; $434C: $6E
    jr   nz, jr_018_435F                          ; $434D: $20 $10

    ld   [$206C], sp                              ; $434F: $08 $6C $20
    db   $10                                      ; $4352: $10
    db   $10                                      ; $4353: $10
    ld   l, d                                     ; $4354: $6A
    jr   nz, @+$12                                ; $4355: $20 $10

    jr   @+$6A                                    ; $4357: $18 $68

    jr   nz, jr_018_434B                          ; $4359: $20 $F0

jr_018_435B:
    pop  af                                       ; $435B: $F1
    rla                                           ; $435C: $17
    rla                                           ; $435D: $17
    rla                                           ; $435E: $17

jr_018_435F:
    rla                                           ; $435F: $17
    rla                                           ; $4360: $17
    and  $E0                                      ; $4361: $E6 $E0
    ld   e, a                                     ; $4363: $5F
    ld   d, b                                     ; $4364: $50
    ld   hl, Data_018_42BA                        ; $4365: $21 $BA $42
    add  hl, de                                   ; $4368: $19
    ld   c, $08                                   ; $4369: $0E $08
    call label_3CE6                               ; $436B: $CD $E6 $3C
    ld   a, $04                                   ; $436E: $3E $04
    jp   label_3DA0                               ; $4370: $C3 $A0 $3D

label_018_4373:
    ld   hl, wEntity0PosY                         ; $4373: $21 $10 $C2
    add  hl, bc                                   ; $4376: $09
    ld   [hl], $4A                                ; $4377: $36 $4A
    ld   hl, $C350                                ; $4379: $21 $50 $C3
    add  hl, bc                                   ; $437C: $09
    ld   [hl], $98                                ; $437D: $36 $98
    call label_3AEA                               ; $437F: $CD $EA $3A
    call func_018_43E3                            ; $4382: $CD $E3 $43
    call func_018_7D36                            ; $4385: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $4388: $F0 $F0
    rst  $00                                      ; $438A: $C7
    adc  a                                        ; $438B: $8F
    ld   b, e                                     ; $438C: $43
    sbc  d                                        ; $438D: $9A
    ld   b, e                                     ; $438E: $43
    call GetRandomByte                            ; $438F: $CD $0D $28
    ld   hl, $C3D0                                ; $4392: $21 $D0 $C3
    add  hl, bc                                   ; $4395: $09
    ld   [hl], a                                  ; $4396: $77
    call IncrementEntityWalkingAttr               ; $4397: $CD $12 $3B
    ld   a, [$D215]                               ; $439A: $FA $15 $D2
    and  a                                        ; $439D: $A7
    jp   nz, label_018_43B2                       ; $439E: $C2 $B2 $43

jr_018_43A1:
    ld   hl, $C3D0                                ; $43A1: $21 $D0 $C3
    add  hl, bc                                   ; $43A4: $09
    inc  [hl]                                     ; $43A5: $34
    ld   a, [hl]                                  ; $43A6: $7E
    ld   e, $00                                   ; $43A7: $1E $00
    and  $30                                      ; $43A9: $E6 $30
    jr   z, jr_018_43AE                           ; $43AB: $28 $01

    inc  e                                        ; $43AD: $1C

jr_018_43AE:
    ld   a, e                                     ; $43AE: $7B
    jp   label_3B0C                               ; $43AF: $C3 $0C $3B

label_018_43B2:
    ret                                           ; $43B2: $C9

    ld   e, b                                     ; $43B3: $58

jr_018_43B4:
    nop                                           ; $43B4: $00
    ld   e, b                                     ; $43B5: $58
    jr   nz, jr_018_4412                          ; $43B6: $20 $5A

    nop                                           ; $43B8: $00

jr_018_43B9:
    ld   e, d                                     ; $43B9: $5A
    jr   nz, jr_018_4418                          ; $43BA: $20 $5C

    nop                                           ; $43BC: $00
    ld   e, [hl]                                  ; $43BD: $5E
    nop                                           ; $43BE: $00
    ld   e, [hl]                                  ; $43BF: $5E
    jr   nz, jr_018_441E                          ; $43C0: $20 $5C

    jr   nz, jr_018_43B4                          ; $43C2: $20 $F0

    nop                                           ; $43C4: $00
    ld   d, b                                     ; $43C5: $50
    nop                                           ; $43C6: $00
    ldh  a, [$FF08]                               ; $43C7: $F0 $08
    ld   d, d                                     ; $43C9: $52
    nop                                           ; $43CA: $00
    nop                                           ; $43CB: $00
    nop                                           ; $43CC: $00
    ld   d, h                                     ; $43CD: $54
    nop                                           ; $43CE: $00
    nop                                           ; $43CF: $00
    ld   [$0056], sp                              ; $43D0: $08 $56 $00
    ldh  a, [rP1]                                 ; $43D3: $F0 $00
    ld   d, d                                     ; $43D5: $52
    jr   nz, @-$0E                                ; $43D6: $20 $F0

    ld   [$2050], sp                              ; $43D8: $08 $50 $20
    nop                                           ; $43DB: $00
    nop                                           ; $43DC: $00
    ld   d, [hl]                                  ; $43DD: $56
    jr   nz, jr_018_43E0                          ; $43DE: $20 $00

jr_018_43E0:
    ld   [$2054], sp                              ; $43E0: $08 $54 $20

func_018_43E3:
    ldh  a, [hActiveEntityUnknownG]               ; $43E3: $F0 $F1
    cp   $04                                      ; $43E5: $FE $04
    jr   nc, jr_018_43EF                          ; $43E7: $30 $06

    ld   de, $43B3                                ; $43E9: $11 $B3 $43
    jp   label_3BC0                               ; $43EC: $C3 $C0 $3B

jr_018_43EF:
    sub  $04                                      ; $43EF: $D6 $04
    rla                                           ; $43F1: $17
    rla                                           ; $43F2: $17
    rla                                           ; $43F3: $17
    rla                                           ; $43F4: $17
    and  $F0                                      ; $43F5: $E6 $F0
    ld   e, a                                     ; $43F7: $5F
    ld   d, b                                     ; $43F8: $50
    ld   hl, $43C3                                ; $43F9: $21 $C3 $43
    add  hl, de                                   ; $43FC: $19
    ld   c, $04                                   ; $43FD: $0E $04
    jp   label_3CE6                               ; $43FF: $C3 $E6 $3C

label_018_4402:
    call label_2887                               ; $4402: $CD $87 $28
    ld   a, $1B                                   ; $4405: $3E $1B
    ld   [wRequests], a                           ; $4407: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $440A: $21 $01 $D6
    ldh  a, [$FFCF]                               ; $440D: $F0 $CF
    add  $02                                      ; $440F: $C6 $02
    ld   e, a                                     ; $4411: $5F

jr_018_4412:
    ld   [hl+], a                                 ; $4412: $22
    ldh  a, [$FFD0]                               ; $4413: $F0 $D0
    ld   [hl+], a                                 ; $4415: $22
    ld   a, $85                                   ; $4416: $3E $85

jr_018_4418:
    ld   [hl+], a                                 ; $4418: $22
    xor  a                                        ; $4419: $AF
    ld   [hl+], a                                 ; $441A: $22
    ld   a, $04                                   ; $441B: $3E $04
    ld   [hl+], a                                 ; $441D: $22

jr_018_441E:
    ld   a, $7F                                   ; $441E: $3E $7F
    ld   [hl+], a                                 ; $4420: $22
    ld   [hl+], a                                 ; $4421: $22
    ld   a, $06                                   ; $4422: $3E $06
    ld   [hl+], a                                 ; $4424: $22
    ld   a, $0C                                   ; $4425: $3E $0C
    ld   [hl+], a                                 ; $4427: $22
    ld   a, e                                     ; $4428: $7B
    ld   [hl+], a                                 ; $4429: $22
    ldh  a, [$FFD0]                               ; $442A: $F0 $D0
    add  $01                                      ; $442C: $C6 $01
    ld   [hl+], a                                 ; $442E: $22
    ld   a, $85                                   ; $442F: $3E $85
    ld   [hl+], a                                 ; $4431: $22
    ld   a, $01                                   ; $4432: $3E $01
    ld   [hl+], a                                 ; $4434: $22
    ld   a, $7F                                   ; $4435: $3E $7F
    ld   [hl+], a                                 ; $4437: $22
    ld   [hl+], a                                 ; $4438: $22
    ld   [hl+], a                                 ; $4439: $22
    ld   [hl+], a                                 ; $443A: $22
    ld   a, $0D                                   ; $443B: $3E $0D
    ld   [hl+], a                                 ; $443D: $22
    ld   a, e                                     ; $443E: $7B
    ld   [hl+], a                                 ; $443F: $22
    ldh  a, [$FFD0]                               ; $4440: $F0 $D0
    add  $02                                      ; $4442: $C6 $02
    ld   [hl+], a                                 ; $4444: $22
    ld   a, $C5                                   ; $4445: $3E $C5
    ld   [hl+], a                                 ; $4447: $22
    ld   a, $7F                                   ; $4448: $3E $7F
    ld   [hl+], a                                 ; $444A: $22
    ld   [hl], $00                                ; $444B: $36 $00
    ret                                           ; $444D: $C9

label_018_444E:
    call label_2887                               ; $444E: $CD $87 $28
    ld   a, $1B                                   ; $4451: $3E $1B
    ld   [wRequests], a                           ; $4453: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $4456: $21 $01 $D6
    ldh  a, [$FFCF]                               ; $4459: $F0 $CF
    add  $02                                      ; $445B: $C6 $02
    ld   e, a                                     ; $445D: $5F
    ld   [hl+], a                                 ; $445E: $22
    ldh  a, [$FFD0]                               ; $445F: $F0 $D0
    add  $03                                      ; $4461: $C6 $03
    ld   [hl+], a                                 ; $4463: $22
    ld   a, $C5                                   ; $4464: $3E $C5
    ld   [hl+], a                                 ; $4466: $22
    ld   a, $7F                                   ; $4467: $3E $7F
    ld   [hl+], a                                 ; $4469: $22
    ld   a, e                                     ; $446A: $7B
    ld   [hl+], a                                 ; $446B: $22
    ldh  a, [$FFD0]                               ; $446C: $F0 $D0
    add  $04                                      ; $446E: $C6 $04
    ld   [hl+], a                                 ; $4470: $22
    ld   a, $85                                   ; $4471: $3E $85
    ld   [hl+], a                                 ; $4473: $22
    ld   a, $02                                   ; $4474: $3E $02
    ld   [hl+], a                                 ; $4476: $22
    ld   a, $7F                                   ; $4477: $3E $7F
    ld   [hl+], a                                 ; $4479: $22
    ld   [hl+], a                                 ; $447A: $22
    ld   [hl+], a                                 ; $447B: $22
    ld   [hl+], a                                 ; $447C: $22
    ld   a, $0E                                   ; $447D: $3E $0E
    ld   [hl+], a                                 ; $447F: $22
    ld   a, e                                     ; $4480: $7B
    ld   [hl+], a                                 ; $4481: $22
    ldh  a, [$FFD0]                               ; $4482: $F0 $D0
    add  $05                                      ; $4484: $C6 $05
    ld   [hl+], a                                 ; $4486: $22
    ld   a, $85                                   ; $4487: $3E $85
    ld   [hl+], a                                 ; $4489: $22
    ld   a, $03                                   ; $448A: $3E $03
    ld   [hl+], a                                 ; $448C: $22
    ld   a, $05                                   ; $448D: $3E $05
    ld   [hl+], a                                 ; $448F: $22
    ld   a, $7F                                   ; $4490: $3E $7F
    ld   [hl+], a                                 ; $4492: $22
    ld   [hl+], a                                 ; $4493: $22
    ld   a, $07                                   ; $4494: $3E $07
    ld   [hl+], a                                 ; $4496: $22
    ld   a, $0F                                   ; $4497: $3E $0F
    ld   [hl+], a                                 ; $4499: $22
    ld   [hl], $00                                ; $449A: $36 $00
    ret                                           ; $449C: $C9

label_018_449D:
    call label_2887                               ; $449D: $CD $87 $28
    ld   a, $15                                   ; $44A0: $3E $15
    ld   [wRequests], a                           ; $44A2: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $44A5: $21 $01 $D6
    ldh  a, [$FFCF]                               ; $44A8: $F0 $CF
    add  $02                                      ; $44AA: $C6 $02
    ld   e, a                                     ; $44AC: $5F
    ld   [hl+], a                                 ; $44AD: $22
    ldh  a, [$FFD0]                               ; $44AE: $F0 $D0
    ld   [hl+], a                                 ; $44B0: $22
    ld   a, $83                                   ; $44B1: $3E $83
    ld   [hl+], a                                 ; $44B3: $22
    xor  a                                        ; $44B4: $AF
    ld   [hl+], a                                 ; $44B5: $22
    ld   a, $04                                   ; $44B6: $3E $04
    ld   [hl+], a                                 ; $44B8: $22
    ld   a, $06                                   ; $44B9: $3E $06
    ld   [hl+], a                                 ; $44BB: $22
    ld   a, $0C                                   ; $44BC: $3E $0C
    ld   [hl+], a                                 ; $44BE: $22
    ld   a, e                                     ; $44BF: $7B
    ld   [hl+], a                                 ; $44C0: $22
    ldh  a, [$FFD0]                               ; $44C1: $F0 $D0
    add  $01                                      ; $44C3: $C6 $01
    ld   [hl+], a                                 ; $44C5: $22
    ld   a, $83                                   ; $44C6: $3E $83
    ld   [hl+], a                                 ; $44C8: $22
    ld   a, $01                                   ; $44C9: $3E $01
    ld   [hl+], a                                 ; $44CB: $22
    ld   a, $7F                                   ; $44CC: $3E $7F
    ld   [hl+], a                                 ; $44CE: $22
    ld   [hl+], a                                 ; $44CF: $22
    ld   a, $0D                                   ; $44D0: $3E $0D
    ld   [hl+], a                                 ; $44D2: $22
    ld   a, e                                     ; $44D3: $7B
    ld   [hl+], a                                 ; $44D4: $22
    ldh  a, [$FFD0]                               ; $44D5: $F0 $D0
    add  $02                                      ; $44D7: $C6 $02
    ld   [hl+], a                                 ; $44D9: $22
    ld   a, $83                                   ; $44DA: $3E $83
    ld   [hl+], a                                 ; $44DC: $22
    ld   a, $02                                   ; $44DD: $3E $02
    ld   [hl+], a                                 ; $44DF: $22
    ld   a, $7F                                   ; $44E0: $3E $7F
    ld   [hl+], a                                 ; $44E2: $22
    ld   [hl+], a                                 ; $44E3: $22
    ld   a, $0E                                   ; $44E4: $3E $0E
    ld   [hl+], a                                 ; $44E6: $22
    ld   a, e                                     ; $44E7: $7B
    ld   [hl+], a                                 ; $44E8: $22
    ldh  a, [$FFD0]                               ; $44E9: $F0 $D0
    add  $03                                      ; $44EB: $C6 $03
    ld   [hl+], a                                 ; $44ED: $22
    ld   a, $83                                   ; $44EE: $3E $83
    ld   [hl+], a                                 ; $44F0: $22
    ld   a, $03                                   ; $44F1: $3E $03
    ld   [hl+], a                                 ; $44F3: $22
    ld   a, $05                                   ; $44F4: $3E $05
    ld   [hl+], a                                 ; $44F6: $22
    ld   a, $07                                   ; $44F7: $3E $07
    ld   [hl+], a                                 ; $44F9: $22
    ld   a, $0F                                   ; $44FA: $3E $0F
    ld   [hl+], a                                 ; $44FC: $22
    ld   [hl], $00                                ; $44FD: $36 $00
    ret                                           ; $44FF: $C9

    ldh  a, [wActiveEntityPosY]                   ; $4500: $F0 $EC
    cp   $50                                      ; $4502: $FE $50
    jp   nc, $48C8                                ; $4504: $D2 $C8 $48

    ld   hl, wEntity0PosY                         ; $4507: $21 $10 $C2
    add  hl, bc                                   ; $450A: $09
    ld   [hl], $3E                                ; $450B: $36 $3E
    ld   a, [$D214]                               ; $450D: $FA $14 $D2
    and  a                                        ; $4510: $A7
    jr   z, jr_018_4517                           ; $4511: $28 $04

    dec  a                                        ; $4513: $3D
    ld   [$D214], a                               ; $4514: $EA $14 $D2

jr_018_4517:
    ld   a, [$D218]                               ; $4517: $FA $18 $D2
    and  a                                        ; $451A: $A7
    jr   z, jr_018_4521                           ; $451B: $28 $04

    dec  a                                        ; $451D: $3D
    ld   [$D218], a                               ; $451E: $EA $18 $D2

jr_018_4521:
    call $4833                                    ; $4521: $CD $33 $48
    call func_018_7D36                            ; $4524: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $4527: $F0 $F0
    rst  $00                                      ; $4529: $C7
    ld   [hl], $45                                ; $452A: $36 $45
    ld   h, [hl]                                  ; $452C: $66
    ld   b, l                                     ; $452D: $45
    sub  d                                        ; $452E: $92
    ld   b, l                                     ; $452F: $45
    and  c                                        ; $4530: $A1
    ld   b, [hl]                                  ; $4531: $46
    inc  [hl]                                     ; $4532: $34
    ld   b, a                                     ; $4533: $47
    ld   c, a                                     ; $4534: $4F
    ld   b, a                                     ; $4535: $47
    ld   a, [$DB49]                               ; $4536: $FA $49 $DB
    and  $02                                      ; $4539: $E6 $02
    jr   z, jr_018_4547                           ; $453B: $28 $0A

    call func_018_7D7C                            ; $453D: $CD $7C $7D
    jr   nc, jr_018_455C                          ; $4540: $30 $1A

    ld   a, $89                                   ; $4542: $3E $89
    jp   OpenDialogInTable1                       ; $4544: $C3 $73 $23

jr_018_4547:
    ldh  a, [hLinkPositionX]                      ; $4547: $F0 $98
    cp   $30                                      ; $4549: $FE $30
    jr   c, jr_018_455C                           ; $454B: $38 $0F

    ld   a, $2F                                   ; $454D: $3E $2F
    ldh  [hLinkPositionX], a                      ; $454F: $E0 $98
    call ClearLinkPositionIncrement               ; $4551: $CD $8E $17
    ld   a, $85                                   ; $4554: $3E $85
    call OpenDialogInTable1                       ; $4556: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4559: $CD $12 $3B

func_018_455C:
label_018_455C:
jr_018_455C:
    ldh  a, [hFrameCounter]                       ; $455C: $F0 $E7
    rra                                           ; $455E: $1F
    rra                                           ; $455F: $1F
    rra                                           ; $4560: $1F
    and  $01                                      ; $4561: $E6 $01
    jp   label_3B0C                               ; $4563: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $4566: $FA $9F $C1
    and  a                                        ; $4569: $A7
    ret  nz                                       ; $456A: $C0

    ld   a, [wC177]                               ; $456B: $FA $77 $C1
    and  a                                        ; $456E: $A7
    jr   nz, jr_018_4581                          ; $456F: $20 $10

    ld   e, $0B                                   ; $4571: $1E $0B
    ld   hl, wAButtonSlot                         ; $4573: $21 $00 $DB

jr_018_4576:
    ld   a, [hl+]                                 ; $4576: $2A
    cp   $09                                      ; $4577: $FE $09
    jr   z, jr_018_458A                           ; $4579: $28 $0F

    dec  e                                        ; $457B: $1D
    ld   a, e                                     ; $457C: $7B
    cp   $FF                                      ; $457D: $FE $FF
    jr   nz, jr_018_4576                          ; $457F: $20 $F5

jr_018_4581:
    call IncrementEntityWalkingAttr               ; $4581: $CD $12 $3B
    ld   [hl], b                                  ; $4584: $70
    ld   a, $8A                                   ; $4585: $3E $8A
    jp   OpenDialogInTable1                       ; $4587: $C3 $73 $23

jr_018_458A:
    call IncrementEntityWalkingAttr               ; $458A: $CD $12 $3B
    ld   a, $87                                   ; $458D: $3E $87
    jp   OpenDialogInTable1                       ; $458F: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4592: $FA $9F $C1
    and  a                                        ; $4595: $A7
    jr   nz, jr_018_45B6                          ; $4596: $20 $1E

    ld   a, $30                                   ; $4598: $3E $30
    ld   [wWorldMusicTrack], a                    ; $459A: $EA $68 $D3
    call IncrementEntityWalkingAttr               ; $459D: $CD $12 $3B

func_018_45A0:
    xor  a                                        ; $45A0: $AF
    ld   [$D210], a                               ; $45A1: $EA $10 $D2
    ld   [$D211], a                               ; $45A4: $EA $11 $D2
    ld   [$D212], a                               ; $45A7: $EA $12 $D2
    ld   [$D213], a                               ; $45AA: $EA $13 $D2
    ld   [$D217], a                               ; $45AD: $EA $17 $D2
    ld   [$D214], a                               ; $45B0: $EA $14 $D2
    ld   [$D218], a                               ; $45B3: $EA $18 $D2

jr_018_45B6:
    ret                                           ; $45B6: $C9

    nop                                           ; $45B7: $00
    nop                                           ; $45B8: $00
    nop                                           ; $45B9: $00
    nop                                           ; $45BA: $00
    nop                                           ; $45BB: $00
    nop                                           ; $45BC: $00
    nop                                           ; $45BD: $00
    nop                                           ; $45BE: $00
    nop                                           ; $45BF: $00
    nop                                           ; $45C0: $00
    nop                                           ; $45C1: $00
    nop                                           ; $45C2: $00
    nop                                           ; $45C3: $00
    nop                                           ; $45C4: $00
    nop                                           ; $45C5: $00
    nop                                           ; $45C6: $00
    nop                                           ; $45C7: $00
    nop                                           ; $45C8: $00
    nop                                           ; $45C9: $00
    nop                                           ; $45CA: $00
    nop                                           ; $45CB: $00
    nop                                           ; $45CC: $00
    nop                                           ; $45CD: $00
    nop                                           ; $45CE: $00
    ld   bc, $0302                                ; $45CF: $01 $02 $03
    inc  b                                        ; $45D2: $04
    nop                                           ; $45D3: $00
    nop                                           ; $45D4: $00
    nop                                           ; $45D5: $00
    nop                                           ; $45D6: $00
    nop                                           ; $45D7: $00
    nop                                           ; $45D8: $00
    nop                                           ; $45D9: $00
    nop                                           ; $45DA: $00
    nop                                           ; $45DB: $00
    nop                                           ; $45DC: $00
    nop                                           ; $45DD: $00
    nop                                           ; $45DE: $00
    ld   bc, $0302                                ; $45DF: $01 $02 $03
    inc  b                                        ; $45E2: $04
    nop                                           ; $45E3: $00
    nop                                           ; $45E4: $00
    nop                                           ; $45E5: $00
    nop                                           ; $45E6: $00
    nop                                           ; $45E7: $00
    nop                                           ; $45E8: $00
    nop                                           ; $45E9: $00
    nop                                           ; $45EA: $00
    nop                                           ; $45EB: $00
    nop                                           ; $45EC: $00
    nop                                           ; $45ED: $00
    nop                                           ; $45EE: $00
    ld   bc, $0302                                ; $45EF: $01 $02 $03
    inc  b                                        ; $45F2: $04
    nop                                           ; $45F3: $00
    nop                                           ; $45F4: $00
    nop                                           ; $45F5: $00
    nop                                           ; $45F6: $00
    nop                                           ; $45F7: $00
    nop                                           ; $45F8: $00
    nop                                           ; $45F9: $00
    nop                                           ; $45FA: $00
    ld   bc, $0302                                ; $45FB: $01 $02 $03
    inc  b                                        ; $45FE: $04
    nop                                           ; $45FF: $00
    nop                                           ; $4600: $00
    nop                                           ; $4601: $00
    nop                                           ; $4602: $00
    nop                                           ; $4603: $00
    nop                                           ; $4604: $00
    ld   [bc], a                                  ; $4605: $02
    ld   bc, $0102                                ; $4606: $01 $02 $01
    ld   [bc], a                                  ; $4609: $02
    ld   bc, $0102                                ; $460A: $01 $02 $01
    nop                                           ; $460D: $00
    nop                                           ; $460E: $00
    nop                                           ; $460F: $00
    nop                                           ; $4610: $00
    nop                                           ; $4611: $00
    ld   bc, $0100                                ; $4612: $01 $00 $01
    nop                                           ; $4615: $00
    ld   bc, $0100                                ; $4616: $01 $00 $01
    nop                                           ; $4619: $00
    ld   bc, $0100                                ; $461A: $01 $00 $01
    nop                                           ; $461D: $00
    ld   bc, $0100                                ; $461E: $01 $00 $01
    ld   [bc], a                                  ; $4621: $02
    ld   bc, $0102                                ; $4622: $01 $02 $01
    ld   [bc], a                                  ; $4625: $02
    ld   bc, $0102                                ; $4626: $01 $02 $01
    ld   [bc], a                                  ; $4629: $02
    ld   bc, $0102                                ; $462A: $01 $02 $01
    ld   [bc], a                                  ; $462D: $02
    ld   bc, $0102                                ; $462E: $01 $02 $01
    ld   [bc], a                                  ; $4631: $02
    ld   bc, $0102                                ; $4632: $01 $02 $01
    ld   [bc], a                                  ; $4635: $02
    ld   bc, $0102                                ; $4636: $01 $02 $01
    ld   [bc], a                                  ; $4639: $02
    ld   bc, $0102                                ; $463A: $01 $02 $01
    ld   [bc], a                                  ; $463D: $02
    ld   bc, $0102                                ; $463E: $01 $02 $01
    ld   [bc], a                                  ; $4641: $02
    ld   bc, $0102                                ; $4642: $01 $02 $01
    ld   [bc], a                                  ; $4645: $02
    ld   bc, $0102                                ; $4646: $01 $02 $01
    ld   [bc], a                                  ; $4649: $02
    ld   bc, $0202                                ; $464A: $01 $02 $02
    ld   [bc], a                                  ; $464D: $02
    ld   [bc], a                                  ; $464E: $02
    ld   [bc], a                                  ; $464F: $02
    ld   [bc], a                                  ; $4650: $02
    ld   [bc], a                                  ; $4651: $02
    ld   [bc], a                                  ; $4652: $02
    inc  b                                        ; $4653: $04
    inc  b                                        ; $4654: $04
    inc  b                                        ; $4655: $04
    inc  b                                        ; $4656: $04
    inc  b                                        ; $4657: $04
    inc  b                                        ; $4658: $04
    inc  b                                        ; $4659: $04
    inc  b                                        ; $465A: $04
    inc  b                                        ; $465B: $04
    inc  b                                        ; $465C: $04
    inc  b                                        ; $465D: $04
    inc  b                                        ; $465E: $04
    ld   [bc], a                                  ; $465F: $02
    inc  bc                                       ; $4660: $03
    ld   [bc], a                                  ; $4661: $02
    inc  bc                                       ; $4662: $03
    ld   [bc], a                                  ; $4663: $02
    inc  bc                                       ; $4664: $03
    ld   [bc], a                                  ; $4665: $02
    inc  bc                                       ; $4666: $03
    ld   [bc], a                                  ; $4667: $02
    inc  bc                                       ; $4668: $03
    ld   [bc], a                                  ; $4669: $02
    ld   [bc], a                                  ; $466A: $02
    inc  bc                                       ; $466B: $03
    inc  b                                        ; $466C: $04
    dec  b                                        ; $466D: $05
    ld   b, $05                                   ; $466E: $06 $05
    ld   b, $05                                   ; $4670: $06 $05
    ld   b, $05                                   ; $4672: $06 $05
    ld   b, $05                                   ; $4674: $06 $05
    ld   b, $05                                   ; $4676: $06 $05
    ld   b, $05                                   ; $4678: $06 $05
    ld   b, $05                                   ; $467A: $06 $05
    ld   b, $04                                   ; $467C: $06 $04
    ld   [bc], a                                  ; $467E: $02
    inc  bc                                       ; $467F: $03
    ld   [bc], a                                  ; $4680: $02
    inc  bc                                       ; $4681: $03
    ld   [bc], a                                  ; $4682: $02
    inc  bc                                       ; $4683: $03
    ld   [bc], a                                  ; $4684: $02
    inc  bc                                       ; $4685: $03
    ld   [bc], a                                  ; $4686: $02
    inc  bc                                       ; $4687: $03
    ld   [bc], a                                  ; $4688: $02
    inc  bc                                       ; $4689: $03
    ld   [bc], a                                  ; $468A: $02
    inc  b                                        ; $468B: $04
    dec  b                                        ; $468C: $05
    inc  b                                        ; $468D: $04
    dec  b                                        ; $468E: $05
    inc  bc                                       ; $468F: $03
    ld   [bc], a                                  ; $4690: $02
    inc  bc                                       ; $4691: $03
    ld   [bc], a                                  ; $4692: $02
    inc  bc                                       ; $4693: $03
    ld   [bc], a                                  ; $4694: $02
    inc  bc                                       ; $4695: $03
    ld   [bc], a                                  ; $4696: $02
    ld   bc, $0101                                ; $4697: $01 $01 $01
    ld   bc, $0101                                ; $469A: $01 $01 $01
    nop                                           ; $469D: $00
    nop                                           ; $469E: $00
    nop                                           ; $469F: $00
    nop                                           ; $46A0: $00
    ld   a, $02                                   ; $46A1: $3E $02
    ldh  [$FFA1], a                               ; $46A3: $E0 $A1
    ld   [wC167], a                               ; $46A5: $EA $67 $C1
    ld   a, [$D210]                               ; $46A8: $FA $10 $D2
    add  $01                                      ; $46AB: $C6 $01
    ld   [$D210], a                               ; $46AD: $EA $10 $D2
    ld   a, [$D211]                               ; $46B0: $FA $11 $D2
    adc  $00                                      ; $46B3: $CE $00
    ld   [$D211], a                               ; $46B5: $EA $11 $D2
    ld   a, [$D211]                               ; $46B8: $FA $11 $D2
    cp   $05                                      ; $46BB: $FE $05
    jr   nz, jr_018_46CF                          ; $46BD: $20 $10

    ld   a, [$D210]                               ; $46BF: $FA $10 $D2
    cp   $F0                                      ; $46C2: $FE $F0
    jr   nz, jr_018_46CF                          ; $46C4: $20 $09

    call IncrementEntityWalkingAttr               ; $46C6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $46C9: $CD $05 $0C
    ld   [hl], $20                                ; $46CC: $36 $20
    ret                                           ; $46CE: $C9

jr_018_46CF:
    ld   a, [$D212]                               ; $46CF: $FA $12 $D2
    inc  a                                        ; $46D2: $3C
    cp   $14                                      ; $46D3: $FE $14
    jr   nz, jr_018_46DF                          ; $46D5: $20 $08

    ld   a, [$D213]                               ; $46D7: $FA $13 $D2
    inc  a                                        ; $46DA: $3C
    ld   [$D213], a                               ; $46DB: $EA $13 $D2
    xor  a                                        ; $46DE: $AF

jr_018_46DF:
    ld   [$D212], a                               ; $46DF: $EA $12 $D2
    ld   a, [$D213]                               ; $46E2: $FA $13 $D2
    ld   e, a                                     ; $46E5: $5F
    ld   d, b                                     ; $46E6: $50
    ld   hl, $4605                                ; $46E7: $21 $05 $46
    add  hl, de                                   ; $46EA: $19
    ld   a, [hl]                                  ; $46EB: $7E
    call label_3B0C                               ; $46EC: $CD $0C $3B
    ld   hl, $45B7                                ; $46EF: $21 $B7 $45
    add  hl, de                                   ; $46F2: $19
    ld   a, [hl]                                  ; $46F3: $7E
    ld   hl, wEntitiesUnknownTableB               ; $46F4: $21 $B0 $C2
    add  hl, bc                                   ; $46F7: $09
    ld   [hl], a                                  ; $46F8: $77
    ld   hl, $4653                                ; $46F9: $21 $53 $46
    add  hl, de                                   ; $46FC: $19
    ld   a, [hl]                                  ; $46FD: $7E
    ld   [$D215], a                               ; $46FE: $EA $15 $D2
    ld   a, [$D211]                               ; $4701: $FA $11 $D2
    ld   d, a                                     ; $4704: $57
    ld   a, [$D210]                               ; $4705: $FA $10 $D2
    ld   e, a                                     ; $4708: $5F
    cp   $CC                                      ; $4709: $FE $CC
    jr   nz, jr_018_4712                          ; $470B: $20 $05

    ld   a, d                                     ; $470D: $7A
    cp   $00                                      ; $470E: $FE $00
    jr   z, jr_018_4722                           ; $4710: $28 $10

jr_018_4712:
    ld   a, e                                     ; $4712: $7B
    cp   $BE                                      ; $4713: $FE $BE
    jr   nz, jr_018_471C                          ; $4715: $20 $05

    ld   a, d                                     ; $4717: $7A
    cp   $05                                      ; $4718: $FE $05
    jr   z, jr_018_471D                           ; $471A: $28 $01

jr_018_471C:
    ret                                           ; $471C: $C9

jr_018_471D:
    ld   a, $28                                   ; $471D: $3E $28
    ld   [$D214], a                               ; $471F: $EA $14 $D2

jr_018_4722:
    call IsEntityUnknownFZero                     ; $4722: $CD $00 $0C
    ld   [hl], $28                                ; $4725: $36 $28
    ret                                           ; $4727: $C9

    nop                                           ; $4728: $00
    nop                                           ; $4729: $00
    ld   b, b                                     ; $472A: $40
    nop                                           ; $472B: $00
    nop                                           ; $472C: $00
    ld   [$0042], sp                              ; $472D: $08 $42 $00
    nop                                           ; $4730: $00
    db   $10                                      ; $4731: $10
    ld   b, h                                     ; $4732: $44
    nop                                           ; $4733: $00
    call GetEntityTransitionCountdown             ; $4734: $CD $05 $0C
    jr   nz, jr_018_4746                          ; $4737: $20 $0D

    ld   [hl], $70                                ; $4739: $36 $70
    ld   a, $10                                   ; $473B: $3E $10
    ld   [wWorldMusicTrack], a                    ; $473D: $EA $68 $D3
    ld   [wC167], a                               ; $4740: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $4743: $CD $12 $3B

jr_018_4746:
    ld   a, $02                                   ; $4746: $3E $02
    ldh  [$FFA1], a                               ; $4748: $E0 $A1
    jp   label_018_455C                           ; $474A: $C3 $5C $45

    sub  b                                        ; $474D: $90
    rla                                           ; $474E: $17
    call func_018_455C                            ; $474F: $CD $5C $45
    call GetEntityTransitionCountdown             ; $4752: $CD $05 $0C
    jr   nz, jr_018_476A                          ; $4755: $20 $13

    ld   a, $01                                   ; $4757: $3E $01
    ld   [$DB4A], a                               ; $4759: $EA $4A $DB
    ld   hl, $DB49                                ; $475C: $21 $49 $DB
    set  1, [hl]                                  ; $475F: $CB $CE
    xor  a                                        ; $4761: $AF
    ld   [wC167], a                               ; $4762: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $4765: $CD $12 $3B
    ld   [hl], b                                  ; $4768: $70
    ret                                           ; $4769: $C9

jr_018_476A:
    cp   $08                                      ; $476A: $FE $08
    jr   nz, jr_018_4774                          ; $476C: $20 $06

    dec  [hl]                                     ; $476E: $35
    ld   a, $88                                   ; $476F: $3E $88
    call OpenDialogInTable1                       ; $4771: $CD $73 $23

jr_018_4774:
    ld   a, $6C                                   ; $4774: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4776: $E0 $9D
    ld   a, $02                                   ; $4778: $3E $02
    ldh  [$FFA1], a                               ; $477A: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $477C: $F0 $98
    ldh  [wActiveEntityPosX], a                   ; $477E: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4780: $F0 $99
    sub  $0C                                      ; $4782: $D6 $0C
    ldh  [wActiveEntityPosY], a                   ; $4784: $E0 $EC
    ld   de, $474D                                ; $4786: $11 $4D $47
    xor  a                                        ; $4789: $AF
    ldh  [hActiveEntityUnknownG], a               ; $478A: $E0 $F1
    jp   label_3C77                               ; $478C: $C3 $77 $3C

    nop                                           ; $478F: $00
    nop                                           ; $4790: $00
    ld   d, b                                     ; $4791: $50
    nop                                           ; $4792: $00
    nop                                           ; $4793: $00
    ld   [$0052], sp                              ; $4794: $08 $52 $00
    stop                                          ; $4797: $10 $00
    ld   d, h                                     ; $4799: $54
    nop                                           ; $479A: $00
    db   $10                                      ; $479B: $10
    ld   [$0056], sp                              ; $479C: $08 $56 $00
    ld   hl, sp+$10                               ; $479F: $F8 $10
    ld   e, b                                     ; $47A1: $58
    nop                                           ; $47A2: $00
    ld   [$5A10], sp                              ; $47A3: $08 $10 $5A
    nop                                           ; $47A6: $00
    jr   @+$12                                    ; $47A7: $18 $10

    ld   e, h                                     ; $47A9: $5C
    nop                                           ; $47AA: $00
    nop                                           ; $47AB: $00
    jr   @+$60                                    ; $47AC: $18 $5E

    nop                                           ; $47AE: $00
    db   $10                                      ; $47AF: $10
    jr   @+$60                                    ; $47B0: $18 $5E

    ld   b, b                                     ; $47B2: $40
    nop                                           ; $47B3: $00
    nop                                           ; $47B4: $00
    ld   d, b                                     ; $47B5: $50
    nop                                           ; $47B6: $00
    nop                                           ; $47B7: $00
    ld   [$0052], sp                              ; $47B8: $08 $52 $00
    stop                                          ; $47BB: $10 $00
    ld   c, d                                     ; $47BD: $4A
    nop                                           ; $47BE: $00
    db   $10                                      ; $47BF: $10
    ld   [$004C], sp                              ; $47C0: $08 $4C $00
    ld   hl, sp+$10                               ; $47C3: $F8 $10
    ld   e, b                                     ; $47C5: $58
    nop                                           ; $47C6: $00
    ld   [$4E10], sp                              ; $47C7: $08 $10 $4E
    nop                                           ; $47CA: $00
    jr   @+$12                                    ; $47CB: $18 $10

    ld   e, h                                     ; $47CD: $5C
    nop                                           ; $47CE: $00
    nop                                           ; $47CF: $00
    jr   jr_018_4830                              ; $47D0: $18 $5E

    nop                                           ; $47D2: $00
    db   $10                                      ; $47D3: $10
    jr   jr_018_4834                              ; $47D4: $18 $5E

    ld   b, b                                     ; $47D6: $40
    nop                                           ; $47D7: $00
    nop                                           ; $47D8: $00
    ld   d, b                                     ; $47D9: $50
    nop                                           ; $47DA: $00
    nop                                           ; $47DB: $00
    ld   [$0052], sp                              ; $47DC: $08 $52 $00
    stop                                          ; $47DF: $10 $00
    ld   d, h                                     ; $47E1: $54
    nop                                           ; $47E2: $00
    db   $10                                      ; $47E3: $10
    ld   [$0056], sp                              ; $47E4: $08 $56 $00
    ld   hl, sp+$10                               ; $47E7: $F8 $10
    ld   h, b                                     ; $47E9: $60
    nop                                           ; $47EA: $00
    ld   [$5A10], sp                              ; $47EB: $08 $10 $5A
    nop                                           ; $47EE: $00
    jr   @+$12                                    ; $47EF: $18 $10

    ld   h, d                                     ; $47F1: $62
    nop                                           ; $47F2: $00
    nop                                           ; $47F3: $00
    jr   @+$60                                    ; $47F4: $18 $5E

    nop                                           ; $47F6: $00
    db   $10                                      ; $47F7: $10
    jr   @+$60                                    ; $47F8: $18 $5E

    ld   b, b                                     ; $47FA: $40
    nop                                           ; $47FB: $00
    nop                                           ; $47FC: $00
    ld   b, [hl]                                  ; $47FD: $46
    nop                                           ; $47FE: $00
    nop                                           ; $47FF: $00
    ld   [$0048], sp                              ; $4800: $08 $48 $00
    stop                                          ; $4803: $10 $00
    ld   c, d                                     ; $4805: $4A
    nop                                           ; $4806: $00
    db   $10                                      ; $4807: $10
    ld   [$004C], sp                              ; $4808: $08 $4C $00
    ld   hl, sp+$10                               ; $480B: $F8 $10
    ld   h, b                                     ; $480D: $60
    nop                                           ; $480E: $00
    ld   [$4E10], sp                              ; $480F: $08 $10 $4E
    nop                                           ; $4812: $00
    jr   jr_018_4825                              ; $4813: $18 $10

    ld   h, d                                     ; $4815: $62
    nop                                           ; $4816: $00
    nop                                           ; $4817: $00
    jr   @+$60                                    ; $4818: $18 $5E

    nop                                           ; $481A: $00
    db   $10                                      ; $481B: $10
    jr   @+$60                                    ; $481C: $18 $5E

    ld   b, b                                     ; $481E: $40
    rst  $38                                      ; $481F: $FF
    rst  $38                                      ; $4820: $FF
    rst  $38                                      ; $4821: $FF
    rst  $38                                      ; $4822: $FF
    ld   h, h                                     ; $4823: $64
    nop                                           ; $4824: $00

jr_018_4825:
    ld   h, [hl]                                  ; $4825: $66
    nop                                           ; $4826: $00
    ld   h, h                                     ; $4827: $64
    ld   b, b                                     ; $4828: $40
    ld   h, [hl]                                  ; $4829: $66
    ld   b, b                                     ; $482A: $40
    ld   h, [hl]                                  ; $482B: $66
    ld   h, b                                     ; $482C: $60
    ld   h, h                                     ; $482D: $64
    ld   h, b                                     ; $482E: $60
    ld   h, [hl]                                  ; $482F: $66

jr_018_4830:
    jr   nz, jr_018_4896                          ; $4830: $20 $64

    jr   nz, jr_018_4855                          ; $4832: $20 $21

jr_018_4834:
    or   b                                        ; $4834: $B0
    jp   nz, $7E09                                ; $4835: $C2 $09 $7E

    ldh  [hActiveEntityUnknownG], a               ; $4838: $E0 $F1
    ldh  a, [wActiveEntityPosY]                   ; $483A: $F0 $EC
    add  $03                                      ; $483C: $C6 $03
    ldh  [wActiveEntityPosY], a                   ; $483E: $E0 $EC
    ld   de, $481F                                ; $4840: $11 $1F $48
    call label_3BC0                               ; $4843: $CD $C0 $3B
    ld   a, $02                                   ; $4846: $3E $02
    call label_3DA0                               ; $4848: $CD $A0 $3D
    call label_3D8A                               ; $484B: $CD $8A $3D
    call IsEntityUnknownFZero                     ; $484E: $CD $00 $0C
    jr   z, jr_018_4857                           ; $4851: $28 $04

    ld   a, $03                                   ; $4853: $3E $03

jr_018_4855:
    jr   jr_018_485C                              ; $4855: $18 $05

jr_018_4857:
    ld   hl, wEntitiesUnknownTableG               ; $4857: $21 $B0 $C3
    add  hl, bc                                   ; $485A: $09
    ld   a, [hl]                                  ; $485B: $7E

jr_018_485C:
    rla                                           ; $485C: $17
    rla                                           ; $485D: $17
    and  $FC                                      ; $485E: $E6 $FC
    ld   e, a                                     ; $4860: $5F
    rla                                           ; $4861: $17
    rla                                           ; $4862: $17
    rla                                           ; $4863: $17
    and  $E0                                      ; $4864: $E6 $E0
    add  e                                        ; $4866: $83
    ld   e, a                                     ; $4867: $5F
    ld   d, b                                     ; $4868: $50
    ld   hl, $478F                                ; $4869: $21 $8F $47
    add  hl, de                                   ; $486C: $19
    ld   c, $09                                   ; $486D: $0E $09
    call label_3CE6                               ; $486F: $CD $E6 $3C
    ld   a, $09                                   ; $4872: $3E $09
    call label_3DA0                               ; $4874: $CD $A0 $3D
    call IsEntityUnknownFZero                     ; $4877: $CD $00 $0C
    ret  z                                        ; $487A: $C8

    ldh  a, [wActiveEntityPosX]                   ; $487B: $F0 $EE
    sub  $18                                      ; $487D: $D6 $18
    ldh  [wActiveEntityPosX], a                   ; $487F: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $4881: $F0 $EC
    sub  $10                                      ; $4883: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $4885: $E0 $EC
    ld   hl, $4728                                ; $4887: $21 $28 $47
    ld   c, $03                                   ; $488A: $0E $03
    call label_3CE6                               ; $488C: $CD $E6 $3C
    ld   a, $03                                   ; $488F: $3E $03
    jp   label_3DA0                               ; $4891: $C3 $A0 $3D

    nop                                           ; $4894: $00
    db   $FC                                      ; $4895: $FC

jr_018_4896:
    halt                                          ; $4896: $76 $00
    nop                                           ; $4898: $00
    inc  b                                        ; $4899: $04
    ld   a, b                                     ; $489A: $78
    nop                                           ; $489B: $00
    nop                                           ; $489C: $00
    inc  c                                        ; $489D: $0C
    ld   a, d                                     ; $489E: $7A
    nop                                           ; $489F: $00
    nop                                           ; $48A0: $00
    db   $FC                                      ; $48A1: $FC
    ld   a, h                                     ; $48A2: $7C
    nop                                           ; $48A3: $00
    nop                                           ; $48A4: $00
    inc  b                                        ; $48A5: $04
    ld   a, b                                     ; $48A6: $78
    nop                                           ; $48A7: $00
    nop                                           ; $48A8: $00
    inc  c                                        ; $48A9: $0C
    ld   a, [hl]                                  ; $48AA: $7E
    nop                                           ; $48AB: $00
    ld   l, b                                     ; $48AC: $68
    nop                                           ; $48AD: $00
    ld   l, d                                     ; $48AE: $6A
    nop                                           ; $48AF: $00
    ld   l, h                                     ; $48B0: $6C
    nop                                           ; $48B1: $00
    ld   l, [hl]                                  ; $48B2: $6E
    nop                                           ; $48B3: $00
    ld   [hl], b                                  ; $48B4: $70
    nop                                           ; $48B5: $00
    ld   [hl], b                                  ; $48B6: $70
    jr   nz, jr_018_4923                          ; $48B7: $20 $6A

    jr   nz, jr_018_4923                          ; $48B9: $20 $68

    jr   nz, jr_018_492B                          ; $48BB: $20 $6E

    jr   nz, jr_018_492B                          ; $48BD: $20 $6C

    jr   nz, jr_018_4933                          ; $48BF: $20 $72

    nop                                           ; $48C1: $00
    ld   [hl], h                                  ; $48C2: $74
    nop                                           ; $48C3: $00
    ld   [hl], h                                  ; $48C4: $74
    jr   nz, @+$74                                ; $48C5: $20 $72

    jr   nz, jr_018_4896                          ; $48C7: $20 $CD

    sbc  $48                                      ; $48C9: $DE $48
    ldh  a, [hFrameCounter]                       ; $48CB: $F0 $E7
    rra                                           ; $48CD: $1F
    rra                                           ; $48CE: $1F
    rra                                           ; $48CF: $1F
    rra                                           ; $48D0: $1F
    and  $01                                      ; $48D1: $E6 $01
    call label_3B0C                               ; $48D3: $CD $0C $3B
    ld   a, [$D215]                               ; $48D6: $FA $15 $D2
    and  a                                        ; $48D9: $A7
    ret  z                                        ; $48DA: $C8

    jp   label_3B0C                               ; $48DB: $C3 $0C $3B

    ld   a, [$D214]                               ; $48DE: $FA $14 $D2
    and  a                                        ; $48E1: $A7
    jr   z, jr_018_4904                           ; $48E2: $28 $20

    ldh  a, [wActiveEntityPosX]                   ; $48E4: $F0 $EE
    sub  $18                                      ; $48E6: $D6 $18
    ldh  [wActiveEntityPosX], a                   ; $48E8: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $48EA: $F0 $EC
    sub  $10                                      ; $48EC: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $48EE: $E0 $EC
    ld   hl, $4728                                ; $48F0: $21 $28 $47
    ld   c, $03                                   ; $48F3: $0E $03
    call label_3CE6                               ; $48F5: $CD $E6 $3C
    ld   a, $03                                   ; $48F8: $3E $03
    call label_3DA0                               ; $48FA: $CD $A0 $3D
    call label_3D8A                               ; $48FD: $CD $8A $3D
    ld   a, $07                                   ; $4900: $3E $07
    ldh  [hActiveEntityUnknownG], a               ; $4902: $E0 $F1

jr_018_4904:
    ldh  a, [hActiveEntityUnknownG]               ; $4904: $F0 $F1
    cp   $02                                      ; $4906: $FE $02
    jr   nc, jr_018_491D                          ; $4908: $30 $13

    ld   hl, $4894                                ; $490A: $21 $94 $48
    dec  a                                        ; $490D: $3D
    jr   nz, jr_018_4913                          ; $490E: $20 $03

    ld   hl, $48A0                                ; $4910: $21 $A0 $48

jr_018_4913:
    ld   c, $03                                   ; $4913: $0E $03
    call label_3CE6                               ; $4915: $CD $E6 $3C
    ld   a, $03                                   ; $4918: $3E $03
    jp   label_3DA0                               ; $491A: $C3 $A0 $3D

jr_018_491D:
    ld   de, $48A4                                ; $491D: $11 $A4 $48
    call label_3BC0                               ; $4920: $CD $C0 $3B

jr_018_4923:
    ld   a, $02                                   ; $4923: $3E $02
    jp   label_3DA0                               ; $4925: $C3 $A0 $3D

    ldh  a, [rP1]                                 ; $4928: $F0 $00
    ld   [hl], b                                  ; $492A: $70

jr_018_492B:
    ld   bc, label_8F0                            ; $492B: $01 $F0 $08
    ld   [hl], d                                  ; $492E: $72
    ld   bc, $0000                                ; $492F: $01 $00 $00
    ld   [hl], h                                  ; $4932: $74

jr_018_4933:
    ld   bc, label_800                            ; $4933: $01 $00 $08
    db   $76                                      ; $4936: $76
    ld   bc, $2821                                ; $4937: $01 $21 $28
    ld   c, c                                     ; $493A: $49
    ld   c, $04                                   ; $493B: $0E $04
    call label_3CE6                               ; $493D: $CD $E6 $3C
    ldh  a, [hActiveEntityWalking]                ; $4940: $F0 $F0
    rst  $00                                      ; $4942: $C7
    ld   c, c                                     ; $4943: $49
    ld   c, c                                     ; $4944: $49
    ld   e, d                                     ; $4945: $5A
    ld   c, c                                     ; $4946: $49
    sub  e                                        ; $4947: $93
    ld   c, c                                     ; $4948: $49
    ldh  a, [hRoomStatus]                         ; $4949: $F0 $F8
    and  $20                                      ; $494B: $E6 $20
    jr   z, jr_018_4957                           ; $494D: $28 $08

    ld   hl, wEntity0PosX                         ; $494F: $21 $00 $C2
    add  hl, bc                                   ; $4952: $09
    ld   a, [hl]                                  ; $4953: $7E
    sub  $10                                      ; $4954: $D6 $10
    ld   [hl], a                                  ; $4956: $77

jr_018_4957:
    jp   IncrementEntityWalkingAttr               ; $4957: $C3 $12 $3B

    call func_018_7D36                            ; $495A: $CD $36 $7D
    ld   a, [$DB7F]                               ; $495D: $FA $7F $DB
    and  a                                        ; $4960: $A7
    ret  nz                                       ; $4961: $C0

    call func_018_7D95                            ; $4962: $CD $95 $7D
    ret  nc                                       ; $4965: $D0

    ld   a, [wTradeSequenceItem]                  ; $4966: $FA $0E $DB
    cp   $0E                                      ; $4969: $FE $0E
    ret  z                                        ; $496B: $C8

    cp   $0D                                      ; $496C: $FE $0D
    jr   nz, jr_018_498E                          ; $496E: $20 $1E

    ld   a, $0E                                   ; $4970: $3E $0E
    ld   [wTradeSequenceItem], a                  ; $4972: $EA $0E $DB
    ld   a, $01                                   ; $4975: $3E $01
    ld   [$DB7F], a                               ; $4977: $EA $7F $DB
    ld   a, $04                                   ; $497A: $3E $04
    ldh  [hNoiseSfx], a                           ; $497C: $E0 $F4
    call GetEntityTransitionCountdown             ; $497E: $CD $05 $0C
    ld   [hl], $60                                ; $4981: $36 $60
    call func_018_7FB9                            ; $4983: $CD $B9 $7F
    ld   a, $16                                   ; $4986: $3E $16
    call OpenDialogInTable1                       ; $4988: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $498B: $C3 $12 $3B

jr_018_498E:
    ld   a, $9C                                   ; $498E: $3E $9C
    jp   OpenDialogInTable1                       ; $4990: $C3 $73 $23

    ld   a, $02                                   ; $4993: $3E $02
    ldh  [$FFA1], a                               ; $4995: $E0 $A1
    ld   [wC167], a                               ; $4997: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $499A: $CD $05 $0C
    jr   nz, jr_018_49AD                          ; $499D: $20 $0E

    call IncrementEntityWalkingAttr               ; $499F: $CD $12 $3B
    ld   [hl], $01                                ; $49A2: $36 $01
    ld   a, $02                                   ; $49A4: $3E $02
    ldh  [hJingle], a                             ; $49A6: $E0 $F2
    xor  a                                        ; $49A8: $AF
    ld   [wC167], a                               ; $49A9: $EA $67 $C1
    ret                                           ; $49AC: $C9

jr_018_49AD:
    cp   $40                                      ; $49AD: $FE $40
    jr   nz, jr_018_49B6                          ; $49AF: $20 $05

    ld   hl, hNoiseSfx                            ; $49B1: $21 $F4 $FF
    ld   [hl], $11                                ; $49B4: $36 $11

jr_018_49B6:
    ret  nc                                       ; $49B6: $D0

    ld   hl, wEntity0SpeedX                       ; $49B7: $21 $40 $C2
    add  hl, bc                                   ; $49BA: $09
    ld   [hl], $FC                                ; $49BB: $36 $FC
    jp   label_018_7E6C                           ; $49BD: $C3 $6C $7E

    rst  $38                                      ; $49C0: $FF
    rst  $38                                      ; $49C1: $FF
    rst  $38                                      ; $49C2: $FF
    rst  $38                                      ; $49C3: $FF
    ld   d, h                                     ; $49C4: $54
    ld   [bc], a                                  ; $49C5: $02
    ld   d, h                                     ; $49C6: $54
    ld   h, d                                     ; $49C7: $62
    ld   d, h                                     ; $49C8: $54
    ld   b, d                                     ; $49C9: $42
    ld   d, h                                     ; $49CA: $54
    ld   [hl+], a                                 ; $49CB: $22
    ld   d, [hl]                                  ; $49CC: $56
    ld   [bc], a                                  ; $49CD: $02
    ld   d, [hl]                                  ; $49CE: $56
    ld   [hl+], a                                 ; $49CF: $22
    ld   d, d                                     ; $49D0: $52
    ld   [bc], a                                  ; $49D1: $02
    ld   d, d                                     ; $49D2: $52
    ld   [hl+], a                                 ; $49D3: $22
    ld   de, $49C0                                ; $49D4: $11 $C0 $49
    call label_3BC0                               ; $49D7: $CD $C0 $3B
    ld   a, [wIsIndoor]                           ; $49DA: $FA $A5 $DB
    and  a                                        ; $49DD: $A7
    jr   z, jr_018_4A2A                           ; $49DE: $28 $4A

    ldh  a, [hMapRoom]                            ; $49E0: $F0 $F6
    cp   $DA                                      ; $49E2: $FE $DA
    jr   nz, jr_018_4A2A                          ; $49E4: $20 $44

    ld   a, [wDialogState]                        ; $49E6: $FA $9F $C1
    and  a                                        ; $49E9: $A7
    ret  nz                                       ; $49EA: $C0

    ld   a, [wPhotos1]                            ; $49EB: $FA $0C $DC
    and  $01                                      ; $49EE: $E6 $01
    jp   z, label_018_7F08                        ; $49F0: $CA $08 $7F

    ld   a, [wTradeSequenceItem]                  ; $49F3: $FA $0E $DB
    cp   $0E                                      ; $49F6: $FE $0E
    jp   nz, label_018_7F08                       ; $49F8: $C2 $08 $7F

    ld   a, [$DB7F]                               ; $49FB: $FA $7F $DB
    and  a                                        ; $49FE: $A7
    jp   nz, label_018_7F08                       ; $49FF: $C2 $08 $7F

    ld   a, [wPhotos2]                            ; $4A02: $FA $0D $DC
    and  $01                                      ; $4A05: $E6 $01
    jr   nz, jr_018_4A0E                          ; $4A07: $20 $05

    ld   a, $18                                   ; $4A09: $3E $18
    jp   label_ADE                                ; $4A0B: $C3 $DE $0A

jr_018_4A0E:
    call func_018_7D95                            ; $4A0E: $CD $95 $7D
    jr   nc, jr_018_4A18                          ; $4A11: $30 $05

    ld   a, $26                                   ; $4A13: $3E $26
    call OpenDialogInTable1                       ; $4A15: $CD $73 $23

jr_018_4A18:
    ld   hl, $C340                                ; $4A18: $21 $40 $C3
    add  hl, bc                                   ; $4A1B: $09
    ld   a, [hl]                                  ; $4A1C: $7E
    or   $80                                      ; $4A1D: $F6 $80
    ld   [hl], a                                  ; $4A1F: $77
    call label_3B5A                               ; $4A20: $CD $5A $3B
    ret  nc                                       ; $4A23: $D0

    call CopyLinkFinalPositionToPosition          ; $4A24: $CD $BE $0C
    jp   label_CB6                                ; $4A27: $C3 $B6 $0C

jr_018_4A2A:
    call func_018_7DE8                            ; $4A2A: $CD $E8 $7D
    call func_018_7E15                            ; $4A2D: $CD $15 $7E
    ldh  a, [hActiveEntityWalking]                ; $4A30: $F0 $F0
    rst  $00                                      ; $4A32: $C7
    dec  sp                                       ; $4A33: $3B
    ld   c, d                                     ; $4A34: $4A
    ld   [hl], d                                  ; $4A35: $72
    ld   c, d                                     ; $4A36: $4A
    ld   a, e                                     ; $4A37: $7B
    ld   c, d                                     ; $4A38: $4A
    and  d                                        ; $4A39: $A2
    ld   c, d                                     ; $4A3A: $4A
    ld   hl, $C340                                ; $4A3B: $21 $40 $C3
    add  hl, bc                                   ; $4A3E: $09
    set  6, [hl]                                  ; $4A3F: $CB $F6
    call GetRandomByte                            ; $4A41: $CD $0D $28
    and  $07                                      ; $4A44: $E6 $07
    ld   e, a                                     ; $4A46: $5F
    ld   d, b                                     ; $4A47: $50
    ld   hl, $6385                                ; $4A48: $21 $85 $63
    add  hl, de                                   ; $4A4B: $19
    ld   a, [hl]                                  ; $4A4C: $7E
    ld   hl, wEntity0PosX                         ; $4A4D: $21 $00 $C2
    add  hl, bc                                   ; $4A50: $09
    ld   [hl], a                                  ; $4A51: $77
    ld   hl, $637D                                ; $4A52: $21 $7D $63
    add  hl, de                                   ; $4A55: $19
    ld   a, [hl]                                  ; $4A56: $7E
    ld   hl, wEntity0PosY                         ; $4A57: $21 $10 $C2
    add  hl, bc                                   ; $4A5A: $09
    ld   [hl], a                                  ; $4A5B: $77
    call func_018_6493                            ; $4A5C: $CD $93 $64
    ldh  a, [hScratchD]                           ; $4A5F: $F0 $DA
    cp   $07                                      ; $4A61: $FE $07
    ret  nz                                       ; $4A63: $C0

    call GetEntityTransitionCountdown             ; $4A64: $CD $05 $0C
    call GetRandomByte                            ; $4A67: $CD $0D $28
    and  $7F                                      ; $4A6A: $E6 $7F
    or   $40                                      ; $4A6C: $F6 $40
    ld   [hl], a                                  ; $4A6E: $77
    jp   IncrementEntityWalkingAttr               ; $4A6F: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $4A72: $CD $05 $0C
    ret  nz                                       ; $4A75: $C0

    ld   [hl], $60                                ; $4A76: $36 $60
    jp   IncrementEntityWalkingAttr               ; $4A78: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $4A7B: $CD $05 $0C
    jr   nz, jr_018_4A90                          ; $4A7E: $20 $10

    ld   [hl], $60                                ; $4A80: $36 $60
    ld   hl, $C3D0                                ; $4A82: $21 $D0 $C3
    add  hl, bc                                   ; $4A85: $09
    ld   [hl], b                                  ; $4A86: $70
    ld   hl, $C340                                ; $4A87: $21 $40 $C3
    add  hl, bc                                   ; $4A8A: $09
    res  6, [hl]                                  ; $4A8B: $CB $B6
    jp   IncrementEntityWalkingAttr               ; $4A8D: $C3 $12 $3B

jr_018_4A90:
    and  $04                                      ; $4A90: $E6 $04
    ld   a, $01                                   ; $4A92: $3E $01
    jr   z, jr_018_4A97                           ; $4A94: $28 $01

    inc  a                                        ; $4A96: $3C

jr_018_4A97:
    jp   label_3B0C                               ; $4A97: $C3 $0C $3B

    nop                                           ; $4A9A: $00
    nop                                           ; $4A9B: $00
    ld   bc, $0202                                ; $4A9C: $01 $02 $02
    ld   [bc], a                                  ; $4A9F: $02
    ld   bc, $2100                                ; $4AA0: $01 $00 $21
    ret  nc                                       ; $4AA3: $D0

    jp   $7E09                                    ; $4AA4: $C3 $09 $7E

    inc  [hl]                                     ; $4AA7: $34
    rra                                           ; $4AA8: $1F
    rra                                           ; $4AA9: $1F
    rra                                           ; $4AAA: $1F
    and  $07                                      ; $4AAB: $E6 $07
    ld   e, a                                     ; $4AAD: $5F
    ld   d, b                                     ; $4AAE: $50
    ld   hl, $4A9A                                ; $4AAF: $21 $9A $4A
    add  hl, de                                   ; $4AB2: $19
    ld   a, [hl]                                  ; $4AB3: $7E
    ld   hl, wEntitiesPosZTable                   ; $4AB4: $21 $10 $C3
    add  hl, bc                                   ; $4AB7: $09
    ld   [hl], a                                  ; $4AB8: $77
    call label_3B39                               ; $4AB9: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $4ABC: $CD $05 $0C
    jr   nz, jr_018_4ADC                          ; $4ABF: $20 $1B

    call IncrementEntityWalkingAttr               ; $4AC1: $CD $12 $3B
    ld   [hl], b                                  ; $4AC4: $70
    xor  a                                        ; $4AC5: $AF
    call label_3B0C                               ; $4AC6: $CD $0C $3B
    ld   a, $0E                                   ; $4AC9: $3E $0E
    ldh  [hJingle], a                             ; $4ACB: $E0 $F2
    ldh  a, [wActiveEntityPosX]                   ; $4ACD: $F0 $EE
    ldh  [hScratchA], a                           ; $4ACF: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4AD1: $F0 $EC
    add  $00                                      ; $4AD3: $C6 $00
    ldh  [hScratchB], a                           ; $4AD5: $E0 $D8
    ld   a, $01                                   ; $4AD7: $3E $01
    jp   label_CC7                                ; $4AD9: $C3 $C7 $0C

jr_018_4ADC:
    cp   $30                                      ; $4ADC: $FE $30
    jr   nz, jr_018_4B03                          ; $4ADE: $20 $23

    ld   a, $7D                                   ; $4AE0: $3E $7D
    call label_3B86                               ; $4AE2: $CD $86 $3B
    jr   c, jr_018_4B03                           ; $4AE5: $38 $1C

    ldh  a, [hScratchA]                           ; $4AE7: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4AE9: $21 $00 $C2
    add  hl, de                                   ; $4AEC: $19
    ld   [hl], a                                  ; $4AED: $77
    ldh  a, [hScratchB]                           ; $4AEE: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4AF0: $21 $10 $C2
    add  hl, de                                   ; $4AF3: $19
    ld   [hl], a                                  ; $4AF4: $77
    ld   hl, wEntitiesUnknownTableB               ; $4AF5: $21 $B0 $C2
    add  hl, de                                   ; $4AF8: $19
    inc  [hl]                                     ; $4AF9: $34
    push bc                                       ; $4AFA: $C5
    ld   c, e                                     ; $4AFB: $4B
    ld   b, d                                     ; $4AFC: $42
    ld   a, $18                                   ; $4AFD: $3E $18
    call label_3BAA                               ; $4AFF: $CD $AA $3B
    pop  bc                                       ; $4B02: $C1

jr_018_4B03:
    call GetEntityTransitionCountdown             ; $4B03: $CD $05 $0C
    ld   e, $03                                   ; $4B06: $1E $03
    cp   $50                                      ; $4B08: $FE $50
    jr   nc, jr_018_4B11                          ; $4B0A: $30 $05

    cp   $20                                      ; $4B0C: $FE $20
    jr   c, jr_018_4B11                           ; $4B0E: $38 $01

    inc  e                                        ; $4B10: $1C

jr_018_4B11:
    ld   a, e                                     ; $4B11: $7B
    jp   label_3B0C                               ; $4B12: $C3 $0C $3B

    nop                                           ; $4B15: $00
    nop                                           ; $4B16: $00
    ld   [hl], b                                  ; $4B17: $70
    ld   bc, label_800                            ; $4B18: $01 $00 $08
    ld   [hl], d                                  ; $4B1B: $72
    ld   bc, $0010                                ; $4B1C: $01 $10 $00
    ld   [hl], h                                  ; $4B1F: $74
    ld   bc, $0810                                ; $4B20: $01 $10 $08
    ld   [hl], h                                  ; $4B23: $74
    ld   hl, $0000                                ; $4B24: $21 $00 $00
    ld   [hl], d                                  ; $4B27: $72
    ld   hl, label_800                            ; $4B28: $21 $00 $08
    ld   [hl], b                                  ; $4B2B: $70
    ld   hl, $0010                                ; $4B2C: $21 $10 $00
    ld   [hl], h                                  ; $4B2F: $74
    ld   bc, $0810                                ; $4B30: $01 $10 $08
    ld   [hl], h                                  ; $4B33: $74
    ld   hl, $0000                                ; $4B34: $21 $00 $00
    ld   a, b                                     ; $4B37: $78
    ld   hl, label_800                            ; $4B38: $21 $00 $08
    db   $76                                      ; $4B3B: $76
    ld   hl, $0010                                ; $4B3C: $21 $10 $00
    ld   [hl], h                                  ; $4B3F: $74
    ld   bc, $0810                                ; $4B40: $01 $10 $08
    ld   [hl], h                                  ; $4B43: $74
    ld   hl, $0000                                ; $4B44: $21 $00 $00
    db   $76                                      ; $4B47: $76
    ld   bc, label_800                            ; $4B48: $01 $00 $08
    ld   a, b                                     ; $4B4B: $78
    ld   bc, $0010                                ; $4B4C: $01 $10 $00
    ld   [hl], h                                  ; $4B4F: $74
    ld   bc, $0810                                ; $4B50: $01 $10 $08
    ld   [hl], h                                  ; $4B53: $74
    ld   hl, $0000                                ; $4B54: $21 $00 $00
    ld   [hl], b                                  ; $4B57: $70
    nop                                           ; $4B58: $00
    nop                                           ; $4B59: $00
    ld   [$0072], sp                              ; $4B5A: $08 $72 $00
    stop                                          ; $4B5D: $10 $00
    ld   [hl], h                                  ; $4B5F: $74
    nop                                           ; $4B60: $00
    db   $10                                      ; $4B61: $10
    ld   [$2074], sp                              ; $4B62: $08 $74 $20
    nop                                           ; $4B65: $00
    nop                                           ; $4B66: $00
    ld   [hl], d                                  ; $4B67: $72
    jr   nz, jr_018_4B6A                          ; $4B68: $20 $00

jr_018_4B6A:
    ld   [$2070], sp                              ; $4B6A: $08 $70 $20
    stop                                          ; $4B6D: $10 $00
    ld   [hl], h                                  ; $4B6F: $74
    nop                                           ; $4B70: $00
    db   $10                                      ; $4B71: $10
    ld   [$2074], sp                              ; $4B72: $08 $74 $20
    nop                                           ; $4B75: $00
    nop                                           ; $4B76: $00
    ld   a, b                                     ; $4B77: $78
    jr   nz, jr_018_4B7A                          ; $4B78: $20 $00

jr_018_4B7A:
    ld   [$2076], sp                              ; $4B7A: $08 $76 $20
    stop                                          ; $4B7D: $10 $00
    ld   [hl], h                                  ; $4B7F: $74
    nop                                           ; $4B80: $00
    db   $10                                      ; $4B81: $10
    ld   [$2074], sp                              ; $4B82: $08 $74 $20
    nop                                           ; $4B85: $00
    nop                                           ; $4B86: $00
    halt                                          ; $4B87: $76 $00
    nop                                           ; $4B89: $00
    ld   [$0078], sp                              ; $4B8A: $08 $78 $00
    stop                                          ; $4B8D: $10 $00
    ld   [hl], h                                  ; $4B8F: $74
    nop                                           ; $4B90: $00
    db   $10                                      ; $4B91: $10
    ld   [$2074], sp                              ; $4B92: $08 $74 $20
    ld   a, d                                     ; $4B95: $7A
    ld   [bc], a                                  ; $4B96: $02
    ld   a, h                                     ; $4B97: $7C
    ld   [bc], a                                  ; $4B98: $02
    ld   a, [hl]                                  ; $4B99: $7E
    ld   [bc], a                                  ; $4B9A: $02
    ld   a, [hl]                                  ; $4B9B: $7E
    ld   [hl+], a                                 ; $4B9C: $22
    ldh  a, [hActiveEntityUnknownG]               ; $4B9D: $F0 $F1
    rla                                           ; $4B9F: $17
    rla                                           ; $4BA0: $17
    rla                                           ; $4BA1: $17
    rla                                           ; $4BA2: $17
    and  $F0                                      ; $4BA3: $E6 $F0
    ld   e, a                                     ; $4BA5: $5F
    ld   d, b                                     ; $4BA6: $50
    ldh  a, [hMapRoom]                            ; $4BA7: $F0 $F6
    cp   $A8                                      ; $4BA9: $FE $A8
    jr   nz, jr_018_4BB2                          ; $4BAB: $20 $05

    ld   hl, $4B55                                ; $4BAD: $21 $55 $4B
    jr   jr_018_4BB5                              ; $4BB0: $18 $03

jr_018_4BB2:
    ld   hl, $4B15                                ; $4BB2: $21 $15 $4B

jr_018_4BB5:
    add  hl, de                                   ; $4BB5: $19
    ld   c, $04                                   ; $4BB6: $0E $04
    call label_3CE6                               ; $4BB8: $CD $E6 $3C
    ld   a, $04                                   ; $4BBB: $3E $04
    call label_3DA0                               ; $4BBD: $CD $A0 $3D
    ldh  a, [hFrameCounter]                       ; $4BC0: $F0 $E7
    rra                                           ; $4BC2: $1F
    rra                                           ; $4BC3: $1F
    rra                                           ; $4BC4: $1F
    rra                                           ; $4BC5: $1F
    rra                                           ; $4BC6: $1F
    and  $01                                      ; $4BC7: $E6 $01
    call label_3B0C                               ; $4BC9: $CD $0C $3B
    call func_018_7EC2                            ; $4BCC: $CD $C2 $7E
    add  $0C                                      ; $4BCF: $C6 $0C
    cp   $18                                      ; $4BD1: $FE $18
    jr   nc, jr_018_4BE4                          ; $4BD3: $30 $0F

    call func_018_7EB2                            ; $4BD5: $CD $B2 $7E
    add  $10                                      ; $4BD8: $C6 $10
    cp   $20                                      ; $4BDA: $FE $20
    jr   nc, jr_018_4BE4                          ; $4BDC: $30 $06

    ld   a, e                                     ; $4BDE: $7B
    add  $02                                      ; $4BDF: $C6 $02
    call label_3B0C                               ; $4BE1: $CD $0C $3B

jr_018_4BE4:
    call func_018_7D36                            ; $4BE4: $CD $36 $7D
    ldh  a, [hMapRoom]                            ; $4BE7: $F0 $F6
    cp   $A8                                      ; $4BE9: $FE $A8
    jp   z, label_018_4C75                        ; $4BEB: $CA $75 $4C

    ld   de, $4B95                                ; $4BEE: $11 $95 $4B
    ld   a, [wTradeSequenceItem]                  ; $4BF1: $FA $0E $DB
    cp   $09                                      ; $4BF4: $FE $09
    jr   nc, jr_018_4BFB                          ; $4BF6: $30 $03

    ld   de, $4B99                                ; $4BF8: $11 $99 $4B

jr_018_4BFB:
    xor  a                                        ; $4BFB: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4BFC: $E0 $F1
    ldh  a, [wActiveEntityPosX]                   ; $4BFE: $F0 $EE
    add  $18                                      ; $4C00: $C6 $18
    ldh  [wActiveEntityPosX], a                   ; $4C02: $E0 $EE
    ldh  a, [wActiveEntityPosY]                   ; $4C04: $F0 $EC
    add  $08                                      ; $4C06: $C6 $08
    ldh  [wActiveEntityPosY], a                   ; $4C08: $E0 $EC
    call label_3BC0                               ; $4C0A: $CD $C0 $3B
    call label_3D8A                               ; $4C0D: $CD $8A $3D
    call func_018_7DE8                            ; $4C10: $CD $E8 $7D
    ldh  a, [hActiveEntityWalking]                ; $4C13: $F0 $F0
    rst  $00                                      ; $4C15: $C7
    inc  e                                        ; $4C16: $1C
    ld   c, h                                     ; $4C17: $4C
    ld   b, h                                     ; $4C18: $44
    ld   c, h                                     ; $4C19: $4C
    ld   e, [hl]                                  ; $4C1A: $5E
    ld   c, h                                     ; $4C1B: $4C
    ld   a, [wGameplayType]                       ; $4C1C: $FA $95 $DB
    cp   $0B                                      ; $4C1F: $FE $0B
    ret  nz                                       ; $4C21: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4C22: $FA $6B $C1
    cp   $04                                      ; $4C25: $FE $04
    ret  nz                                       ; $4C27: $C0

    call func_018_7D89                            ; $4C28: $CD $89 $7D
    ret  nc                                       ; $4C2B: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C2C: $FA $0E $DB
    cp   $08                                      ; $4C2F: $FE $08
    jr   nz, jr_018_4C3B                          ; $4C31: $20 $08

    ld   a, $67                                   ; $4C33: $3E $67
    call OpenDialogInTable1                       ; $4C35: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4C38: $C3 $12 $3B

jr_018_4C3B:
    ld   a, $66                                   ; $4C3B: $3E $66
    jr   c, jr_018_4C41                           ; $4C3D: $38 $02

    ld   a, $6B                                   ; $4C3F: $3E $6B

jr_018_4C41:
    jp   OpenDialogInTable1                       ; $4C41: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4C44: $FA $9F $C1
    and  a                                        ; $4C47: $A7
    jr   nz, jr_018_4C58                          ; $4C48: $20 $0E

    call IncrementEntityWalkingAttr               ; $4C4A: $CD $12 $3B
    ld   a, [wC177]                               ; $4C4D: $FA $77 $C1
    and  a                                        ; $4C50: $A7
    jr   nz, jr_018_4C58                          ; $4C51: $20 $05

    ld   a, $68                                   ; $4C53: $3E $68
    jp   OpenDialogInTable1                       ; $4C55: $C3 $73 $23

jr_018_4C58:
    ld   [hl], b                                  ; $4C58: $70
    ld   a, $69                                   ; $4C59: $3E $69
    jp   OpenDialogInTable1                       ; $4C5B: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4C5E: $FA $9F $C1
    and  a                                        ; $4C61: $A7
    jr   nz, jr_018_4C74                          ; $4C62: $20 $10

    call IncrementEntityWalkingAttr               ; $4C64: $CD $12 $3B
    ld   [hl], b                                  ; $4C67: $70
    call label_C0C                                ; $4C68: $CD $0C $0C
    ld   a, $09                                   ; $4C6B: $3E $09
    ld   [wTradeSequenceItem], a                  ; $4C6D: $EA $0E $DB
    ld   a, $0D                                   ; $4C70: $3E $0D
    ldh  [hFFA5], a                               ; $4C72: $E0 $A5

jr_018_4C74:
    ret                                           ; $4C74: $C9

label_018_4C75:
    call func_018_7DE8                            ; $4C75: $CD $E8 $7D
    ldh  a, [hActiveEntityWalking]                ; $4C78: $F0 $F0
    rst  $00                                      ; $4C7A: $C7
    add  a                                        ; $4C7B: $87
    ld   c, h                                     ; $4C7C: $4C
    and  e                                        ; $4C7D: $A3
    ld   c, h                                     ; $4C7E: $4C
    xor  e                                        ; $4C7F: $AB
    ld   c, h                                     ; $4C80: $4C
    cp   [hl]                                     ; $4C81: $BE
    ld   c, h                                     ; $4C82: $4C
    pop  de                                       ; $4C83: $D1
    ld   c, h                                     ; $4C84: $4C
    ld   a, [c]                                   ; $4C85: $F2
    ld   c, h                                     ; $4C86: $4C
    call func_018_7D89                            ; $4C87: $CD $89 $7D
    ret  nc                                       ; $4C8A: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C8B: $FA $0E $DB
    cp   $09                                      ; $4C8E: $FE $09
    jr   nz, jr_018_4C9A                          ; $4C90: $20 $08

    ld   a, $34                                   ; $4C92: $3E $34
    call OpenDialogInTable1                       ; $4C94: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4C97: $C3 $12 $3B

jr_018_4C9A:
    ld   a, $33                                   ; $4C9A: $3E $33
    jr   c, jr_018_4CA0                           ; $4C9C: $38 $02

    ld   a, $39                                   ; $4C9E: $3E $39

jr_018_4CA0:
    jp   OpenDialogInTable1                       ; $4CA0: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4CA3: $FA $9F $C1
    and  a                                        ; $4CA6: $A7
    ret  nz                                       ; $4CA7: $C0

    jp   IncrementEntityWalkingAttr               ; $4CA8: $C3 $12 $3B

    call IncrementEntityWalkingAttr               ; $4CAB: $CD $12 $3B
    ld   a, $08                                   ; $4CAE: $3E $08

func_018_4CB0:
    ld   [wGameplayType], a                       ; $4CB0: $EA $95 $DB
    xor  a                                        ; $4CB3: $AF
    ld   [wTransitionSequenceCounter], a          ; $4CB4: $EA $6B $C1
    ld   [wC16C], a                               ; $4CB7: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $4CBA: $EA $96 $DB
    ret                                           ; $4CBD: $C9

    ld   a, [wTransitionSequenceCounter]          ; $4CBE: $FA $6B $C1
    cp   $04                                      ; $4CC1: $FE $04
    ret  nz                                       ; $4CC3: $C0

    ld   a, [wDialogState]                        ; $4CC4: $FA $9F $C1
    and  a                                        ; $4CC7: $A7
    ret  nz                                       ; $4CC8: $C0

    call IncrementEntityWalkingAttr               ; $4CC9: $CD $12 $3B
    ld   a, $35                                   ; $4CCC: $3E $35
    jp   OpenDialogInTable1                       ; $4CCE: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4CD1: $FA $9F $C1
    and  a                                        ; $4CD4: $A7
    ret  nz                                       ; $4CD5: $C0

    call IncrementEntityWalkingAttr               ; $4CD6: $CD $12 $3B
    ld   a, [wC177]                               ; $4CD9: $FA $77 $C1
    and  a                                        ; $4CDC: $A7
    jr   nz, jr_018_4CEC                          ; $4CDD: $20 $0D

    call label_C0C                                ; $4CDF: $CD $0C $0C
    ld   a, $0A                                   ; $4CE2: $3E $0A
    ld   [wTradeSequenceItem], a                  ; $4CE4: $EA $0E $DB
    ld   a, $0D                                   ; $4CE7: $3E $0D
    ldh  [hFFA5], a                               ; $4CE9: $E0 $A5
    ret                                           ; $4CEB: $C9

jr_018_4CEC:
    dec  [hl]                                     ; $4CEC: $35
    ld   a, $37                                   ; $4CED: $3E $37
    jp   OpenDialogInTable1                       ; $4CEF: $C3 $73 $23

    call func_018_7D89                            ; $4CF2: $CD $89 $7D
    ret  nc                                       ; $4CF5: $D0

    ld   a, $38                                   ; $4CF6: $3E $38
    jp   OpenDialogInTable1                       ; $4CF8: $C3 $73 $23

    ld   h, d                                     ; $4CFB: $62
    ld   hl, $2160                                ; $4CFC: $21 $60 $21
    ld   h, [hl]                                  ; $4CFF: $66
    ld   hl, $2164                                ; $4D00: $21 $64 $21
    ld   l, h                                     ; $4D03: $6C
    ld   bc, Start.notGBC                         ; $4D04: $01 $6E $01
    ld   l, b                                     ; $4D07: $68
    ld   bc, $016A                                ; $4D08: $01 $6A $01
    ld   l, d                                     ; $4D0B: $6A
    ld   hl, $2168                                ; $4D0C: $21 $68 $21
    ld   l, h                                     ; $4D0F: $6C
    ld   bc, Start.notGBC                         ; $4D10: $01 $6E $01
    sbc  d                                        ; $4D13: $9A
    inc  d                                        ; $4D14: $14
    sbc  h                                        ; $4D15: $9C
    inc  d                                        ; $4D16: $14
    ld   hl, $C440                                ; $4D17: $21 $40 $C4
    add  hl, bc                                   ; $4D1A: $09
    ld   a, [hl]                                  ; $4D1B: $7E
    and  a                                        ; $4D1C: $A7
    jr   nz, jr_018_4D36                          ; $4D1D: $20 $17

    inc  [hl]                                     ; $4D1F: $34
    ld   a, $18                                   ; $4D20: $3E $18
    call label_AF6                                ; $4D22: $CD $F6 $0A
    ld   a, [wHasInstrument5]                     ; $4D25: $FA $69 $DB
    ld   d, $B1                                   ; $4D28: $16 $B1
    and  $02                                      ; $4D2A: $E6 $02
    jr   z, jr_018_4D30                           ; $4D2C: $28 $02

    ld   d, $CD                                   ; $4D2E: $16 $CD

jr_018_4D30:
    ldh  a, [hMapRoom]                            ; $4D30: $F0 $F6
    cp   d                                        ; $4D32: $BA
    jp   nz, label_018_7F08                       ; $4D33: $C2 $08 $7F

jr_018_4D36:
    ld   de, $4CFB                                ; $4D36: $11 $FB $4C
    xor  a                                        ; $4D39: $AF
    ldh  [hFFE8], a                               ; $4D3A: $E0 $E8
    ld   a, [wTradeSequenceItem]                  ; $4D3C: $FA $0E $DB
    cp   $0B                                      ; $4D3F: $FE $0B
    jr   nc, jr_018_4D58                          ; $4D41: $30 $15

    ld   a, [wHasInstrument5]                     ; $4D43: $FA $69 $DB
    and  $02                                      ; $4D46: $E6 $02
    jr   nz, jr_018_4D51                          ; $4D48: $20 $07

    ld   a, [wTradeSequenceItem]                  ; $4D4A: $FA $0E $DB
    cp   $0A                                      ; $4D4D: $FE $0A
    jr   c, jr_018_4D58                           ; $4D4F: $38 $07

jr_018_4D51:
    ld   a, $01                                   ; $4D51: $3E $01
    ldh  [hFFE8], a                               ; $4D53: $E0 $E8
    ld   de, $4D07                                ; $4D55: $11 $07 $4D

jr_018_4D58:
    call label_3BC0                               ; $4D58: $CD $C0 $3B
    call func_018_7DE8                            ; $4D5B: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $4D5E: $F0 $E7
    rra                                           ; $4D60: $1F
    rra                                           ; $4D61: $1F
    rra                                           ; $4D62: $1F
    rra                                           ; $4D63: $1F
    and  $01                                      ; $4D64: $E6 $01
    call label_3B0C                               ; $4D66: $CD $0C $3B
    call func_018_7D36                            ; $4D69: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $4D6C: $F0 $F0
    rst  $00                                      ; $4D6E: $C7
    ld   [hl], a                                  ; $4D6F: $77
    ld   c, l                                     ; $4D70: $4D
    cp   d                                        ; $4D71: $BA
    ld   c, l                                     ; $4D72: $4D
    db   $DD                                      ; $4D73: $DD
    ld   c, l                                     ; $4D74: $4D
    rla                                           ; $4D75: $17
    ld   c, [hl]                                  ; $4D76: $4E
    ld   a, [wGameplayType]                       ; $4D77: $FA $95 $DB
    cp   $0B                                      ; $4D7A: $FE $0B
    ret  nz                                       ; $4D7C: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4D7D: $FA $6B $C1
    cp   $04                                      ; $4D80: $FE $04
    ret  nz                                       ; $4D82: $C0

    call func_018_7D95                            ; $4D83: $CD $95 $7D
    ret  nc                                       ; $4D86: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $4D87: $FA $56 $DB
    cp   $80                                      ; $4D8A: $FE $80
    ld   a, $78                                   ; $4D8C: $3E $78
    jr   z, jr_018_4DA0                           ; $4D8E: $28 $10

    ldh  a, [hFFE8]                               ; $4D90: $F0 $E8
    and  a                                        ; $4D92: $A7
    jr   nz, jr_018_4DA3                          ; $4D93: $20 $0E

    ld   a, [wTradeSequenceItem]                  ; $4D95: $FA $0E $DB
    cp   $0B                                      ; $4D98: $FE $0B
    ld   a, $5A                                   ; $4D9A: $3E $5A
    jr   c, jr_018_4DA0                           ; $4D9C: $38 $02

    ld   a, $5F                                   ; $4D9E: $3E $5F

jr_018_4DA0:
    jp   OpenDialogInTable1                       ; $4DA0: $C3 $73 $23

jr_018_4DA3:
    ld   a, [wTradeSequenceItem]                  ; $4DA3: $FA $0E $DB
    cp   $0A                                      ; $4DA6: $FE $0A
    jr   nz, jr_018_4DB5                          ; $4DA8: $20 $0B

    ld   [wC167], a                               ; $4DAA: $EA $67 $C1
    ld   a, $5C                                   ; $4DAD: $3E $5C
    call OpenDialogInTable1                       ; $4DAF: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4DB2: $C3 $12 $3B

jr_018_4DB5:
    ld   a, $5B                                   ; $4DB5: $3E $5B
    jp   OpenDialogInTable1                       ; $4DB7: $C3 $73 $23

    ld   a, [wC177]                               ; $4DBA: $FA $77 $C1
    and  a                                        ; $4DBD: $A7
    jr   nz, jr_018_4DCF                          ; $4DBE: $20 $0F

    ld   a, $01                                   ; $4DC0: $3E $01
    ldh  [hJingle], a                             ; $4DC2: $E0 $F2
    ld   [$DB7F], a                               ; $4DC4: $EA $7F $DB
    call GetEntityTransitionCountdown             ; $4DC7: $CD $05 $0C
    ld   [hl], $80                                ; $4DCA: $36 $80
    jp   IncrementEntityWalkingAttr               ; $4DCC: $C3 $12 $3B

jr_018_4DCF:
    xor  a                                        ; $4DCF: $AF
    ld   [wC167], a                               ; $4DD0: $EA $67 $C1
    ld   a, $59                                   ; $4DD3: $3E $59
    call OpenDialogInTable1                       ; $4DD5: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4DD8: $CD $12 $3B
    ld   [hl], b                                  ; $4DDB: $70
    ret                                           ; $4DDC: $C9

    call GetEntityTransitionCountdown             ; $4DDD: $CD $05 $0C
    jr   nz, jr_018_4DF3                          ; $4DE0: $20 $11

    ld   a, $0B                                   ; $4DE2: $3E $0B
    ld   [wTradeSequenceItem], a                  ; $4DE4: $EA $0E $DB
    ld   a, $0D                                   ; $4DE7: $3E $0D
    ldh  [hFFA5], a                               ; $4DE9: $E0 $A5
    ld   a, $5D                                   ; $4DEB: $3E $5D
    call OpenDialogInTable1                       ; $4DED: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4DF0: $C3 $12 $3B

jr_018_4DF3:
    ld   a, $02                                   ; $4DF3: $3E $02
    ldh  [$FFA1], a                               ; $4DF5: $E0 $A1
    ld   [wC167], a                               ; $4DF7: $EA $67 $C1
    xor  a                                        ; $4DFA: $AF
    ldh  [hActiveEntityUnknownG], a               ; $4DFB: $E0 $F1
    ldh  a, [wActiveEntityPosY]                   ; $4DFD: $F0 $EC
    sub  $0E                                      ; $4DFF: $D6 $0E
    ldh  [wActiveEntityPosY], a                   ; $4E01: $E0 $EC
    ldh  a, [wActiveEntityPosX]                   ; $4E03: $F0 $EE
    sub  $04                                      ; $4E05: $D6 $04
    ldh  [wActiveEntityPosX], a                   ; $4E07: $E0 $EE
    ld   de, $4D13                                ; $4E09: $11 $13 $4D
    call label_3BC0                               ; $4E0C: $CD $C0 $3B
    call label_3D8A                               ; $4E0F: $CD $8A $3D
    ld   a, $02                                   ; $4E12: $3E $02
    jp   label_3B0C                               ; $4E14: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $4E17: $FA $9F $C1
    and  a                                        ; $4E1A: $A7
    jr   nz, jr_018_4E2A                          ; $4E1B: $20 $0D

    ld   [$DB7F], a                               ; $4E1D: $EA $7F $DB
    ld   [wC167], a                               ; $4E20: $EA $67 $C1
    call label_C0C                                ; $4E23: $CD $0C $0C
    call IncrementEntityWalkingAttr               ; $4E26: $CD $12 $3B
    ld   [hl], b                                  ; $4E29: $70

jr_018_4E2A:
    ret                                           ; $4E2A: $C9

    nop                                           ; $4E2B: $00
    ld   hl, sp+$60                               ; $4E2C: $F8 $60
    ld   bc, $0000                                ; $4E2E: $01 $00 $00
    ld   h, d                                     ; $4E31: $62
    ld   bc, label_800                            ; $4E32: $01 $00 $08
    ld   h, h                                     ; $4E35: $64
    ld   bc, $F800                                ; $4E36: $01 $00 $F8
    ld   h, [hl]                                  ; $4E39: $66
    ld   bc, $0000                                ; $4E3A: $01 $00 $00
    ld   l, b                                     ; $4E3D: $68
    ld   bc, label_800                            ; $4E3E: $01 $00 $08
    ld   l, d                                     ; $4E41: $6A
    ld   bc, $0002                                ; $4E42: $01 $02 $00
    ld   b, $04                                   ; $4E45: $06 $04
    ldh  a, [hActiveEntityUnknownG]               ; $4E47: $F0 $F1
    sla  a                                        ; $4E49: $CB $27
    sla  a                                        ; $4E4B: $CB $27
    ld   e, a                                     ; $4E4D: $5F
    sla  a                                        ; $4E4E: $CB $27
    add  e                                        ; $4E50: $83
    ld   e, a                                     ; $4E51: $5F
    ld   d, b                                     ; $4E52: $50
    ld   hl, $4E2B                                ; $4E53: $21 $2B $4E
    add  hl, de                                   ; $4E56: $19
    ld   c, $03                                   ; $4E57: $0E $03
    call label_3CE6                               ; $4E59: $CD $E6 $3C
    ldh  a, [hFrameCounter]                       ; $4E5C: $F0 $E7
    rra                                           ; $4E5E: $1F
    rra                                           ; $4E5F: $1F
    rra                                           ; $4E60: $1F
    rra                                           ; $4E61: $1F
    and  $01                                      ; $4E62: $E6 $01
    call label_3B0C                               ; $4E64: $CD $0C $3B
    call func_018_7DE8                            ; $4E67: $CD $E8 $7D
    call func_018_7D36                            ; $4E6A: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $4E6D: $F0 $F0
    rst  $00                                      ; $4E6F: $C7
    db   $76                                      ; $4E70: $76
    ld   c, [hl]                                  ; $4E71: $4E
    xor  b                                        ; $4E72: $A8
    ld   c, [hl]                                  ; $4E73: $4E
    rst  $08                                      ; $4E74: $CF
    ld   c, [hl]                                  ; $4E75: $4E
    call func_018_7D95                            ; $4E76: $CD $95 $7D
    ret  nc                                       ; $4E79: $D0

    ld   a, [wTradeSequenceItem]                  ; $4E7A: $FA $0E $DB
    cp   $08                                      ; $4E7D: $FE $08
    jr   nc, jr_018_4E91                          ; $4E7F: $30 $10

    cp   $01                                      ; $4E81: $FE $01
    jr   z, jr_018_4E9F                           ; $4E83: $28 $1A

    ld   a, [wHasInstrument3]                     ; $4E85: $FA $67 $DB
    and  $02                                      ; $4E88: $E6 $02
    jp   z, label_018_4E91                        ; $4E8A: $CA $91 $4E

    ld   e, $EE                                   ; $4E8D: $1E $EE
    jr   jr_018_4EA4                              ; $4E8F: $18 $13

label_018_4E91:
jr_018_4E91:
    ld   a, [wTradeSequenceItem]                  ; $4E91: $FA $0E $DB
    and  a                                        ; $4E94: $A7
    ld   e, $2A                                   ; $4E95: $1E $2A
    jr   z, jr_018_4EA4                           ; $4E97: $28 $0B

    ld   e, $2C                                   ; $4E99: $1E $2C
    cp   $01                                      ; $4E9B: $FE $01
    jr   nz, jr_018_4EA4                          ; $4E9D: $20 $05

jr_018_4E9F:
    call IncrementEntityWalkingAttr               ; $4E9F: $CD $12 $3B
    ld   e, $2B                                   ; $4EA2: $1E $2B

jr_018_4EA4:
    ld   a, e                                     ; $4EA4: $7B
    jp   OpenDialogInTable1                       ; $4EA5: $C3 $73 $23

    ld   a, [wDialogState]                        ; $4EA8: $FA $9F $C1
    and  a                                        ; $4EAB: $A7
    jr   nz, jr_018_4ECE                          ; $4EAC: $20 $20

    ld   a, [wC177]                               ; $4EAE: $FA $77 $C1
    and  a                                        ; $4EB1: $A7
    jr   nz, jr_018_4EC5                          ; $4EB2: $20 $11

    ld   a, $02                                   ; $4EB4: $3E $02
    ld   [wTradeSequenceItem], a                  ; $4EB6: $EA $0E $DB
    ld   a, $0D                                   ; $4EB9: $3E $0D
    ldh  [hFFA5], a                               ; $4EBB: $E0 $A5
    ld   a, $28                                   ; $4EBD: $3E $28
    call OpenDialogInTable1                       ; $4EBF: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $4EC2: $C3 $12 $3B

jr_018_4EC5:
    ld   a, $27                                   ; $4EC5: $3E $27
    call OpenDialogInTable1                       ; $4EC7: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $4ECA: $CD $12 $3B
    ld   [hl], b                                  ; $4ECD: $70

jr_018_4ECE:
    ret                                           ; $4ECE: $C9

    ld   a, [wDialogState]                        ; $4ECF: $FA $9F $C1
    and  a                                        ; $4ED2: $A7
    jr   nz, jr_018_4EDC                          ; $4ED3: $20 $07

    call label_C0C                                ; $4ED5: $CD $0C $0C
    call IncrementEntityWalkingAttr               ; $4ED8: $CD $12 $3B
    ld   [hl], b                                  ; $4EDB: $70

jr_018_4EDC:
    ret                                           ; $4EDC: $C9

    ld   hl, wEntitiesUnknownTableD               ; $4EDD: $21 $D0 $C2
    add  hl, bc                                   ; $4EE0: $09
    ld   a, [hl]                                  ; $4EE1: $7E
    and  a                                        ; $4EE2: $A7
    jp   nz, label_018_50E2                       ; $4EE3: $C2 $E2 $50

    ldh  a, [hRoomStatus]                         ; $4EE6: $F0 $F8
    and  $20                                      ; $4EE8: $E6 $20
    jp   nz, label_018_7F08                       ; $4EEA: $C2 $08 $7F

    call label_C56                                ; $4EED: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $4EF0: $F0 $F0
    rst  $00                                      ; $4EF2: $C7
    dec  b                                        ; $4EF3: $05
    ld   c, a                                     ; $4EF4: $4F
    ld   e, $4F                                   ; $4EF5: $1E $4F
    scf                                           ; $4EF7: $37
    ld   c, a                                     ; $4EF8: $4F
    ld   e, h                                     ; $4EF9: $5C
    ld   c, a                                     ; $4EFA: $4F
    add  c                                        ; $4EFB: $81
    ld   c, a                                     ; $4EFC: $4F
    sub  [hl]                                     ; $4EFD: $96
    ld   c, a                                     ; $4EFE: $4F
    rst  $00                                      ; $4EFF: $C7
    ld   c, a                                     ; $4F00: $4F
    inc  b                                        ; $4F01: $04
    ld   d, b                                     ; $4F02: $50
    ld   d, d                                     ; $4F03: $52
    ld   d, b                                     ; $4F04: $50
    ld   a, [wMaxMagicPowder]                     ; $4F05: $FA $76 $DB
    ld   hl, $4F90                                ; $4F08: $21 $90 $4F
    cp   [hl]                                     ; $4F0B: $BE
    jr   nz, jr_018_4F1D                          ; $4F0C: $20 $0F

    inc  hl                                       ; $4F0E: $23
    ld   a, [wMaxBombs]                           ; $4F0F: $FA $77 $DB
    cp   [hl]                                     ; $4F12: $BE
    jr   nz, jr_018_4F1D                          ; $4F13: $20 $08

    inc  hl                                       ; $4F15: $23
    ld   a, [wMaxArrows]                          ; $4F16: $FA $78 $DB
    cp   [hl]                                     ; $4F19: $BE
    jp   z, label_018_7F08                        ; $4F1A: $CA $08 $7F

jr_018_4F1D:
    ret                                           ; $4F1D: $C9

    call GetEntityTransitionCountdown             ; $4F1E: $CD $05 $0C
    ld   [hl], $90                                ; $4F21: $36 $90
    ldh  a, [wActiveEntityPosX]                   ; $4F23: $F0 $EE
    ldh  [hScratchA], a                           ; $4F25: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4F27: $F0 $EC
    ldh  [hScratchB], a                           ; $4F29: $E0 $D8
    ld   a, $02                                   ; $4F2B: $3E $02
    call label_CC7                                ; $4F2D: $CD $C7 $0C
    ld   a, $06                                   ; $4F30: $3E $06
    ldh  [hJingle], a                             ; $4F32: $E0 $F2
    jp   IncrementEntityWalkingAttr               ; $4F34: $C3 $12 $3B

    call func_018_50C3                            ; $4F37: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F3A: $CD $05 $0C
    jr   nz, jr_018_4F44                          ; $4F3D: $20 $05

    ld   [hl], $60                                ; $4F3F: $36 $60
    jp   IncrementEntityWalkingAttr               ; $4F41: $C3 $12 $3B

jr_018_4F44:
    ld   e, $FC                                   ; $4F44: $1E $FC
    sub  $08                                      ; $4F46: $D6 $08
    and  $10                                      ; $4F48: $E6 $10
    jr   z, jr_018_4F4E                           ; $4F4A: $28 $02

    ld   e, $04                                   ; $4F4C: $1E $04

jr_018_4F4E:
    ld   hl, wEntity0SpeedX                       ; $4F4E: $21 $40 $C2
    add  hl, bc                                   ; $4F51: $09
    ld   [hl], e                                  ; $4F52: $73
    ld   hl, wEntity0SpeedY                       ; $4F53: $21 $50 $C2
    add  hl, bc                                   ; $4F56: $09
    ld   [hl], $FC                                ; $4F57: $36 $FC
    jp   label_018_7E5F                           ; $4F59: $C3 $5F $7E

    call func_018_50C3                            ; $4F5C: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F5F: $CD $05 $0C
    ret  nz                                       ; $4F62: $C0

    ld   [hl], $48                                ; $4F63: $36 $48
    ld   a, $02                                   ; $4F65: $3E $02
    call label_3B86                               ; $4F67: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $4F6A: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4F6C: $21 $00 $C2
    add  hl, de                                   ; $4F6F: $19
    ld   [hl], a                                  ; $4F70: $77
    ldh  a, [hScratchB]                           ; $4F71: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4F73: $21 $10 $C2
    add  hl, de                                   ; $4F76: $19
    ld   [hl], a                                  ; $4F77: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4F78: $21 $E0 $C2
    add  hl, de                                   ; $4F7B: $19
    ld   [hl], $20                                ; $4F7C: $36 $20
    jp   IncrementEntityWalkingAttr               ; $4F7E: $C3 $12 $3B

    call func_018_50A8                            ; $4F81: $CD $A8 $50
    call GetEntityTransitionCountdown             ; $4F84: $CD $05 $0C
    ret  nz                                       ; $4F87: $C0

    ld   a, $E1                                   ; $4F88: $3E $E1
    call func_018_5080                            ; $4F8A: $CD $80 $50
    jp   IncrementEntityWalkingAttr               ; $4F8D: $C3 $12 $3B

    ld   b, b                                     ; $4F90: $40
    ld   h, b                                     ; $4F91: $60
    ld   h, b                                     ; $4F92: $60
    ld   [c], a                                   ; $4F93: $E2
    db   $E3                                      ; $4F94: $E3
    db   $E4                                      ; $4F95: $E4
    call func_018_50A8                            ; $4F96: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4F99: $FA $9F $C1
    and  a                                        ; $4F9C: $A7
    ret  nz                                       ; $4F9D: $C0

jr_018_4F9E:
    ld   hl, wEntitiesUnknownTableB               ; $4F9E: $21 $B0 $C2
    add  hl, bc                                   ; $4FA1: $09
    ld   e, [hl]                                  ; $4FA2: $5E
    ld   d, $00                                   ; $4FA3: $16 $00
    ld   a, e                                     ; $4FA5: $7B
    ld   [$D201], a                               ; $4FA6: $EA $01 $D2
    inc  a                                        ; $4FA9: $3C
    cp   $03                                      ; $4FAA: $FE $03
    jr   nz, jr_018_4FAF                          ; $4FAC: $20 $01

    xor  a                                        ; $4FAE: $AF

jr_018_4FAF:
    ld   [hl], a                                  ; $4FAF: $77
    ld   hl, $4F90                                ; $4FB0: $21 $90 $4F
    add  hl, de                                   ; $4FB3: $19
    ld   a, [hl]                                  ; $4FB4: $7E
    ld   hl, wMaxMagicPowder                      ; $4FB5: $21 $76 $DB
    add  hl, de                                   ; $4FB8: $19
    cp   [hl]                                     ; $4FB9: $BE
    jr   z, jr_018_4F9E                           ; $4FBA: $28 $E2

    ld   hl, $4F93                                ; $4FBC: $21 $93 $4F
    add  hl, de                                   ; $4FBF: $19
    ld   a, [hl]                                  ; $4FC0: $7E
    call func_018_5080                            ; $4FC1: $CD $80 $50
    jp   IncrementEntityWalkingAttr               ; $4FC4: $C3 $12 $3B

    call func_018_50A8                            ; $4FC7: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4FCA: $FA $9F $C1
    and  a                                        ; $4FCD: $A7
    ret  nz                                       ; $4FCE: $C0

    call IncrementEntityWalkingAttr               ; $4FCF: $CD $12 $3B
    ld   a, [wC177]                               ; $4FD2: $FA $77 $C1
    and  a                                        ; $4FD5: $A7
    jr   nz, jr_018_5001                          ; $4FD6: $20 $29

    ld   a, $CA                                   ; $4FD8: $3E $CA
    call label_3B86                               ; $4FDA: $CD $86 $3B
    ld   a, $26                                   ; $4FDD: $3E $26
    ldh  [hNoiseSfx], a                           ; $4FDF: $E0 $F4
    ldh  a, [hScratchA]                           ; $4FE1: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4FE3: $21 $00 $C2
    add  hl, de                                   ; $4FE6: $19
    ld   [hl], a                                  ; $4FE7: $77
    ldh  a, [hScratchB]                           ; $4FE8: $F0 $D8
    ld   hl, wEntity0PosY                         ; $4FEA: $21 $10 $C2
    add  hl, de                                   ; $4FED: $19
    ld   [hl], a                                  ; $4FEE: $77
    ld   hl, wEntitiesUnknownTableD               ; $4FEF: $21 $D0 $C2
    add  hl, de                                   ; $4FF2: $19
    ld   [hl], $01                                ; $4FF3: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FF5: $21 $E0 $C2
    add  hl, de                                   ; $4FF8: $19
    ld   [hl], $C0                                ; $4FF9: $36 $C0
    call GetEntityTransitionCountdown             ; $4FFB: $CD $05 $0C
    ld   [hl], $C0                                ; $4FFE: $36 $C0
    ret                                           ; $5000: $C9

jr_018_5001:
    dec  [hl]                                     ; $5001: $35
    dec  [hl]                                     ; $5002: $35
    ret                                           ; $5003: $C9

    ld   hl, $5090                                ; $5004: $21 $90 $50
    ld   c, $03                                   ; $5007: $0E $03
    call label_3CE6                               ; $5009: $CD $E6 $3C
    call func_018_50D2                            ; $500C: $CD $D2 $50
    call GetEntityTransitionCountdown             ; $500F: $CD $05 $0C
    ret  nz                                       ; $5012: $C0

    call label_3D7F                               ; $5013: $CD $7F $3D
    ld   a, $E5                                   ; $5016: $3E $E5
    call func_018_5080                            ; $5018: $CD $80 $50
    call IncrementEntityWalkingAttr               ; $501B: $CD $12 $3B
    ld   a, [$D201]                               ; $501E: $FA $01 $D2
    ld   e, a                                     ; $5021: $5F
    ld   d, b                                     ; $5022: $50
    ld   hl, $4F90                                ; $5023: $21 $90 $4F
    add  hl, de                                   ; $5026: $19
    ld   a, [hl]                                  ; $5027: $7E
    ld   hl, wMaxMagicPowder                      ; $5028: $21 $76 $DB
    add  hl, de                                   ; $502B: $19
    ld   [hl], a                                  ; $502C: $77
    ld   d, a                                     ; $502D: $57
    ld   a, e                                     ; $502E: $7B
    and  a                                        ; $502F: $A7
    jr   nz, jr_018_5044                          ; $5030: $20 $12

    ld   hl, wMagicPowderCount                    ; $5032: $21 $4C $DB
    ld   [hl], d                                  ; $5035: $72
    ld   d, $0C                                   ; $5036: $16 $0C
    call label_3E6B                               ; $5038: $CD $6B $3E
    xor  a                                        ; $503B: $AF
    ld   [$DB4B], a                               ; $503C: $EA $4B $DB
    ld   a, $0B                                   ; $503F: $3E $0B
    ldh  [hFFA5], a                               ; $5041: $E0 $A5
    ret                                           ; $5043: $C9

jr_018_5044:
    cp   $01                                      ; $5044: $FE $01
    jr   nz, jr_018_504D                          ; $5046: $20 $05

    ld   hl, wBombCount                           ; $5048: $21 $4D $DB
    ld   [hl], d                                  ; $504B: $72
    ret                                           ; $504C: $C9

jr_018_504D:
    ld   hl, wArrowCount                          ; $504D: $21 $45 $DB
    ld   [hl], d                                  ; $5050: $72
    ret                                           ; $5051: $C9

    call func_018_50A8                            ; $5052: $CD $A8 $50
    ld   a, [wDialogState]                        ; $5055: $FA $9F $C1
    and  a                                        ; $5058: $A7
    ret  nz                                       ; $5059: $C0

    ld   hl, $C440                                ; $505A: $21 $40 $C4
    add  hl, bc                                   ; $505D: $09
    ld   a, [hl]                                  ; $505E: $7E
    and  a                                        ; $505F: $A7
    jr   nz, jr_018_5067                          ; $5060: $20 $05

    inc  [hl]                                     ; $5062: $34
    ld   a, $3B                                   ; $5063: $3E $3B
    ldh  [hJingle], a                             ; $5065: $E0 $F2

jr_018_5067:
    call func_018_7E62                            ; $5067: $CD $62 $7E
    ld   hl, wEntity0SpeedY                       ; $506A: $21 $50 $C2
    add  hl, bc                                   ; $506D: $09
    dec  [hl]                                     ; $506E: $35
    dec  [hl]                                     ; $506F: $35
    dec  [hl]                                     ; $5070: $35
    ldh  a, [wActiveEntityPosY]                   ; $5071: $F0 $EC
    cp   $F0                                      ; $5073: $FE $F0
    ret  c                                        ; $5075: $D8

    call func_018_7FB9                            ; $5076: $CD $B9 $7F
    xor  a                                        ; $5079: $AF
    ld   [wC167], a                               ; $507A: $EA $67 $C1
    jp   label_018_7F08                           ; $507D: $C3 $08 $7F

func_018_5080:
    ld   e, a                                     ; $5080: $5F
    ldh  a, [hLinkPositionY]                      ; $5081: $F0 $99
    push af                                       ; $5083: $F5
    ld   a, $20                                   ; $5084: $3E $20
    ldh  [hLinkPositionY], a                      ; $5086: $E0 $99
    ld   a, e                                     ; $5088: $7B
    call OpenDialog                               ; $5089: $CD $85 $23
    pop  af                                       ; $508C: $F1
    ldh  [hLinkPositionY], a                      ; $508D: $E0 $99
    ret                                           ; $508F: $C9

    nop                                           ; $5090: $00
    db   $FC                                      ; $5091: $FC
    ld   [hl], b                                  ; $5092: $70
    inc  bc                                       ; $5093: $03
    nop                                           ; $5094: $00
    inc  b                                        ; $5095: $04
    ld   [hl], d                                  ; $5096: $72
    inc  bc                                       ; $5097: $03
    nop                                           ; $5098: $00
    inc  c                                        ; $5099: $0C
    ld   [hl], b                                  ; $509A: $70
    inc  hl                                       ; $509B: $23
    nop                                           ; $509C: $00
    db   $FC                                      ; $509D: $FC
    ld   [hl], h                                  ; $509E: $74
    inc  bc                                       ; $509F: $03
    nop                                           ; $50A0: $00
    inc  b                                        ; $50A1: $04
    db   $76                                      ; $50A2: $76
    inc  bc                                       ; $50A3: $03
    nop                                           ; $50A4: $00
    inc  c                                        ; $50A5: $0C
    ld   [hl], h                                  ; $50A6: $74
    inc  hl                                       ; $50A7: $23

func_018_50A8:
    ld   hl, $5090                                ; $50A8: $21 $90 $50
    ldh  a, [hFrameCounter]                       ; $50AB: $F0 $E7
    and  $08                                      ; $50AD: $E6 $08
    jr   z, jr_018_50B4                           ; $50AF: $28 $03

    ld   hl, $509C                                ; $50B1: $21 $9C $50

jr_018_50B4:
    ld   c, $03                                   ; $50B4: $0E $03
    call label_3CE6                               ; $50B6: $CD $E6 $3C
    jr   jr_018_50D2                              ; $50B9: $18 $17

    ld   a, [hl]                                  ; $50BB: $7E
    inc  bc                                       ; $50BC: $03
    ld   a, [hl]                                  ; $50BD: $7E
    inc  hl                                       ; $50BE: $23
    ld   a, [hl]                                  ; $50BF: $7E
    ld   b, e                                     ; $50C0: $43
    ld   a, [hl]                                  ; $50C1: $7E
    ld   h, e                                     ; $50C2: $63

func_018_50C3:
    ldh  a, [hFrameCounter]                       ; $50C3: $F0 $E7
    rra                                           ; $50C5: $1F
    rra                                           ; $50C6: $1F
    rra                                           ; $50C7: $1F
    and  $01                                      ; $50C8: $E6 $01
    ldh  [hActiveEntityUnknownG], a               ; $50CA: $E0 $F1
    ld   de, $50BB                                ; $50CC: $11 $BB $50
    call label_3BC0                               ; $50CF: $CD $C0 $3B

func_018_50D2:
jr_018_50D2:
    ld   a, $02                                   ; $50D2: $3E $02
    ldh  [$FFA1], a                               ; $50D4: $E0 $A1
    ld   [wC167], a                               ; $50D6: $EA $67 $C1
    ld   a, $04                                   ; $50D9: $3E $04
    ldh  [hLinkAnimationState], a                 ; $50DB: $E0 $9D
    xor  a                                        ; $50DD: $AF
    ld   [$C19B], a                               ; $50DE: $EA $9B $C1
    ret                                           ; $50E1: $C9

label_018_50E2:
    call func_018_5174                            ; $50E2: $CD $74 $51
    call GetEntityTransitionCountdown             ; $50E5: $CD $05 $0C
    jp   z, label_018_7F08                        ; $50E8: $CA $08 $7F

    ld   d, a                                     ; $50EB: $57
    ldh  a, [hIsGBC]                              ; $50EC: $F0 $FE
    and  a                                        ; $50EE: $A7
    jr   nz, jr_018_50FE                          ; $50EF: $20 $0D

    ld   a, d                                     ; $50F1: $7A
    bit  1, a                                     ; $50F2: $CB $4F
    ld   a, $E4                                   ; $50F4: $3E $E4
    jr   z, jr_018_50FA                           ; $50F6: $28 $02

    ld   a, $44                                   ; $50F8: $3E $44

jr_018_50FA:
    ld   [wBGPalette], a                          ; $50FA: $EA $97 $DB
    ret                                           ; $50FD: $C9

jr_018_50FE:
    ld   hl, $DE01                                ; $50FE: $21 $01 $DE
    ld   a, $24                                   ; $5101: $3E $24
    ld   [hl+], a                                 ; $5103: $22
    ld   a, $7B                                   ; $5104: $3E $7B
    ld   [hl+], a                                 ; $5106: $22
    ld   a, $77                                   ; $5107: $3E $77
    ld   [hl+], a                                 ; $5109: $22
    ld   a, $18                                   ; $510A: $3E $18
    ld   [hl], a                                  ; $510C: $77
    jp   label_BD7                                ; $510D: $C3 $D7 $0B

    stop                                          ; $5110: $10 $00
    ld   a, h                                     ; $5112: $7C
    rlca                                          ; $5113: $07
    db   $10                                      ; $5114: $10
    ld   [$677C], sp                              ; $5115: $08 $7C $67
    jr   nz, jr_018_511A                          ; $5118: $20 $00

jr_018_511A:
    ld   a, h                                     ; $511A: $7C
    rlca                                          ; $511B: $07
    jr   nz, jr_018_5126                          ; $511C: $20 $08

    ld   a, h                                     ; $511E: $7C
    ld   h, a                                     ; $511F: $67
    jr   nc, jr_018_511A                          ; $5120: $30 $F8

    ld   a, b                                     ; $5122: $78
    rlca                                          ; $5123: $07
    jr   nc, jr_018_5126                          ; $5124: $30 $00

jr_018_5126:
    ld   a, d                                     ; $5126: $7A
    rlca                                          ; $5127: $07
    jr   nc, @+$0A                                ; $5128: $30 $08

    ld   a, d                                     ; $512A: $7A
    daa                                           ; $512B: $27
    jr   nc, jr_018_513E                          ; $512C: $30 $10

    ld   a, b                                     ; $512E: $78
    daa                                           ; $512F: $27
    ld   b, b                                     ; $5130: $40
    ld   hl, sp+$78                               ; $5131: $F8 $78
    ld   b, a                                     ; $5133: $47
    ld   b, b                                     ; $5134: $40
    nop                                           ; $5135: $00
    ld   a, d                                     ; $5136: $7A
    ld   b, a                                     ; $5137: $47
    ld   b, b                                     ; $5138: $40
    ld   [$677A], sp                              ; $5139: $08 $7A $67
    ld   b, b                                     ; $513C: $40
    db   $10                                      ; $513D: $10

jr_018_513E:
    ld   a, b                                     ; $513E: $78
    ld   h, a                                     ; $513F: $67
    stop                                          ; $5140: $10 $00
    ld   a, h                                     ; $5142: $7C
    ld   d, h                                     ; $5143: $54
    db   $10                                      ; $5144: $10
    ld   [$347C], sp                              ; $5145: $08 $7C $34
    jr   nz, jr_018_514A                          ; $5148: $20 $00

jr_018_514A:
    ld   a, h                                     ; $514A: $7C
    ld   d, h                                     ; $514B: $54
    jr   nz, jr_018_5156                          ; $514C: $20 $08

    ld   a, h                                     ; $514E: $7C
    inc  [hl]                                     ; $514F: $34
    jr   nc, jr_018_514A                          ; $5150: $30 $F8

    ld   a, b                                     ; $5152: $78
    inc  d                                        ; $5153: $14
    jr   nc, jr_018_5156                          ; $5154: $30 $00

jr_018_5156:
    ld   a, d                                     ; $5156: $7A
    inc  d                                        ; $5157: $14
    jr   nc, @+$0A                                ; $5158: $30 $08

    ld   a, d                                     ; $515A: $7A
    inc  [hl]                                     ; $515B: $34
    jr   nc, jr_018_516E                          ; $515C: $30 $10

    ld   a, b                                     ; $515E: $78
    inc  [hl]                                     ; $515F: $34
    ld   b, b                                     ; $5160: $40
    ld   hl, sp+$78                               ; $5161: $F8 $78
    ld   d, h                                     ; $5163: $54
    ld   b, b                                     ; $5164: $40
    nop                                           ; $5165: $00
    ld   a, d                                     ; $5166: $7A
    ld   d, h                                     ; $5167: $54
    ld   b, b                                     ; $5168: $40
    ld   [$747A], sp                              ; $5169: $08 $7A $74
    ld   b, b                                     ; $516C: $40
    db   $10                                      ; $516D: $10

jr_018_516E:
    ld   a, b                                     ; $516E: $78
    ld   [hl], h                                  ; $516F: $74
    inc  c                                        ; $5170: $0C
    inc  c                                        ; $5171: $0C
    inc  b                                        ; $5172: $04
    ld   [bc], a                                  ; $5173: $02

func_018_5174:
    ldh  a, [wActiveEntityPosY]                   ; $5174: $F0 $EC
    sub  $05                                      ; $5176: $D6 $05
    ldh  [wActiveEntityPosY], a                   ; $5178: $E0 $EC
    call GetEntityTransitionCountdown             ; $517A: $CD $05 $0C
    ld   c, $0C                                   ; $517D: $0E $0C
    cp   $B0                                      ; $517F: $FE $B0
    jr   c, jr_018_5190                           ; $5181: $38 $0D

    sub  $B0                                      ; $5183: $D6 $B0
    rra                                           ; $5185: $1F
    rra                                           ; $5186: $1F
    and  $03                                      ; $5187: $E6 $03
    ld   e, a                                     ; $5189: $5F
    ld   d, b                                     ; $518A: $50
    ld   hl, $5170                                ; $518B: $21 $70 $51
    add  hl, de                                   ; $518E: $19
    ld   c, [hl]                                  ; $518F: $4E

jr_018_5190:
    ld   hl, $5110                                ; $5190: $21 $10 $51
    ldh  a, [hFrameCounter]                       ; $5193: $F0 $E7
    and  $04                                      ; $5195: $E6 $04
    jr   z, jr_018_519C                           ; $5197: $28 $03

    ld   hl, $5140                                ; $5199: $21 $40 $51

jr_018_519C:
    call label_3CE6                               ; $519C: $CD $E6 $3C
    ld   a, $04                                   ; $519F: $3E $04
    jp   label_3DA0                               ; $51A1: $C3 $A0 $3D

label_018_51A4:
    call func_018_7D36                            ; $51A4: $CD $36 $7D
    call func_018_7D95                            ; $51A7: $CD $95 $7D
    ret  nc                                       ; $51AA: $D0

    ld   a, $96                                   ; $51AB: $3E $96
    jp   OpenDialogInTable1                       ; $51AD: $C3 $73 $23

func_018_51B0:
    ld   a, [$DB74]                               ; $51B0: $FA $74 $DB
    and  a                                        ; $51B3: $A7
    jp   z, label_018_7F08                        ; $51B4: $CA $08 $7F

    ret                                           ; $51B7: $C9

    ld   d, b                                     ; $51B8: $50
    ld   bc, $0152                                ; $51B9: $01 $52 $01
    ld   d, d                                     ; $51BC: $52
    ld   hl, $2150                                ; $51BD: $21 $50 $21
    ld   d, h                                     ; $51C0: $54
    ld   bc, $0156                                ; $51C1: $01 $56 $01
    ld   d, [hl]                                  ; $51C4: $56
    ld   hl, $2154                                ; $51C5: $21 $54 $21
    ld   e, b                                     ; $51C8: $58
    ld   bc, $015A                                ; $51C9: $01 $5A $01
    ld   e, b                                     ; $51CC: $58
    ld   bc, $015A                                ; $51CD: $01 $5A $01
    ld   e, d                                     ; $51D0: $5A
    ld   hl, $2158                                ; $51D1: $21 $58 $21
    ld   e, d                                     ; $51D4: $5A
    ld   hl, $2158                                ; $51D5: $21 $58 $21
    ld   a, [$DB74]                               ; $51D8: $FA $74 $DB
    and  a                                        ; $51DB: $A7
    jp   nz, label_018_7F08                       ; $51DC: $C2 $08 $7F

    ld   de, $51B8                                ; $51DF: $11 $B8 $51
    call label_3BC0                               ; $51E2: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $51E5: $F0 $E7
    and  $3F                                      ; $51E7: $E6 $3F
    jr   nz, jr_018_51F3                          ; $51E9: $20 $08

    call func_018_7EE1                            ; $51EB: $CD $E1 $7E
    ld   hl, $C380                                ; $51EE: $21 $80 $C3
    add  hl, bc                                   ; $51F1: $09
    ld   [hl], e                                  ; $51F2: $73

jr_018_51F3:
    call func_018_7D60                            ; $51F3: $CD $60 $7D
    call func_018_7DE8                            ; $51F6: $CD $E8 $7D
    call func_018_7E98                            ; $51F9: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $51FC: $21 $20 $C3
    add  hl, bc                                   ; $51FF: $09
    dec  [hl]                                     ; $5200: $35
    dec  [hl]                                     ; $5201: $35
    ld   hl, wEntitiesPosZTable                   ; $5202: $21 $10 $C3
    add  hl, bc                                   ; $5205: $09
    ld   a, [hl]                                  ; $5206: $7E
    and  a                                        ; $5207: $A7
    jr   z, jr_018_520E                           ; $5208: $28 $04

    and  $80                                      ; $520A: $E6 $80
    jr   z, jr_018_521C                           ; $520C: $28 $0E

jr_018_520E:
    ld   [hl], b                                  ; $520E: $70
    ld   hl, wEntitiesSpeedZTable                 ; $520F: $21 $20 $C3
    add  hl, bc                                   ; $5212: $09
    ld   [hl], b                                  ; $5213: $70
    ldh  a, [hFrameCounter]                       ; $5214: $F0 $E7
    and  $1F                                      ; $5216: $E6 $1F
    jr   nz, jr_018_521C                          ; $5218: $20 $02

    ld   [hl], $0C                                ; $521A: $36 $0C

jr_018_521C:
    ldh  a, [$FFEF]                               ; $521C: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $521E: $E0 $EC
    call func_018_7D36                            ; $5220: $CD $36 $7D
    call label_3D8A                               ; $5223: $CD $8A $3D
    call func_018_7D95                            ; $5226: $CD $95 $7D
    ret  nc                                       ; $5229: $D0

    ld   e, $00                                   ; $522A: $1E $00
    ld   a, [wIsIndoor]                           ; $522C: $FA $A5 $DB
    and  a                                        ; $522F: $A7
    jr   nz, jr_018_523F                          ; $5230: $20 $0D

    inc  e                                        ; $5232: $1C
    ldh  a, [hMapRoom]                            ; $5233: $F0 $F6
    cp   $CC                                      ; $5235: $FE $CC
    jr   z, jr_018_523F                           ; $5237: $28 $06

    inc  e                                        ; $5239: $1C
    cp   $CD                                      ; $523A: $FE $CD
    jr   z, jr_018_523F                           ; $523C: $28 $01

    inc  e                                        ; $523E: $1C

jr_018_523F:
    ld   a, [wHasInstrument6]                     ; $523F: $FA $6A $DB
    and  $02                                      ; $5242: $E6 $02
    jr   z, jr_018_524A                           ; $5244: $28 $04

    ld   a, e                                     ; $5246: $7B
    add  $04                                      ; $5247: $C6 $04
    ld   e, a                                     ; $5249: $5F

jr_018_524A:
    ld   a, [wIsMarinFollowingLink]               ; $524A: $FA $73 $DB
    and  a                                        ; $524D: $A7
    jr   z, jr_018_5255                           ; $524E: $28 $05

    ld   a, $52                                   ; $5250: $3E $52
    jp   OpenDialogInTable2                       ; $5252: $C3 $7C $23

jr_018_5255:
    ld   a, e                                     ; $5255: $7B
    add  $4A                                      ; $5256: $C6 $4A
    jp   OpenDialogInTable2                       ; $5258: $C3 $7C $23

    ld   a, b                                     ; $525B: $78
    ld   bc, $017A                                ; $525C: $01 $7A $01
    ld   a, h                                     ; $525F: $7C
    ld   bc, $017E                                ; $5260: $01 $7E $01
    ld   a, d                                     ; $5263: $7A
    ld   hl, label_2178                           ; $5264: $21 $78 $21
    ld   a, [hl]                                  ; $5267: $7E
    ld   hl, $217C                                ; $5268: $21 $7C $21
    call func_018_51B0                            ; $526B: $CD $B0 $51
    ld   de, $525B                                ; $526E: $11 $5B $52
    call label_3BC0                               ; $5271: $CD $C0 $3B
    ld   a, [$C50F]                               ; $5274: $FA $0F $C5
    ld   e, a                                     ; $5277: $5F
    ld   d, b                                     ; $5278: $50
    ld   hl, wEntity0PosX                         ; $5279: $21 $00 $C2
    add  hl, de                                   ; $527C: $19
    ldh  a, [wActiveEntityPosX]                   ; $527D: $F0 $EE
    ld   e, $00                                   ; $527F: $1E $00
    cp   [hl]                                     ; $5281: $BE
    jr   nc, jr_018_5286                          ; $5282: $30 $02

    ld   e, $02                                   ; $5284: $1E $02

jr_018_5286:
    ldh  a, [hFrameCounter]                       ; $5286: $F0 $E7
    rra                                           ; $5288: $1F
    rra                                           ; $5289: $1F
    rra                                           ; $528A: $1F
    rra                                           ; $528B: $1F
    rra                                           ; $528C: $1F
    and  $01                                      ; $528D: $E6 $01
    add  e                                        ; $528F: $83
    call label_3B0C                               ; $5290: $CD $0C $3B
    jp   label_018_51A4                           ; $5293: $C3 $A4 $51

    ld   e, d                                     ; $5296: $5A
    ld   hl, $2158                                ; $5297: $21 $58 $21
    ld   e, [hl]                                  ; $529A: $5E
    ld   hl, $215C                                ; $529B: $21 $5C $21
    ld   e, b                                     ; $529E: $58
    ld   bc, $015A                                ; $529F: $01 $5A $01
    ld   e, h                                     ; $52A2: $5C
    ld   bc, $015E                                ; $52A3: $01 $5E $01
    ld   de, $5296                                ; $52A6: $11 $96 $52
    call label_3BC0                               ; $52A9: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $52AC: $F0 $E7
    rra                                           ; $52AE: $1F
    rra                                           ; $52AF: $1F
    rra                                           ; $52B0: $1F
    and  $01                                      ; $52B1: $E6 $01
    call label_3B0C                               ; $52B3: $CD $0C $3B
    ld   a, $02                                   ; $52B6: $3E $02
    ldh  [$FFA1], a                               ; $52B8: $E0 $A1
    ld   [wC167], a                               ; $52BA: $EA $67 $C1
    call func_018_7E98                            ; $52BD: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $52C0: $21 $20 $C3
    add  hl, bc                                   ; $52C3: $09
    dec  [hl]                                     ; $52C4: $35
    dec  [hl]                                     ; $52C5: $35
    ld   hl, wEntitiesPosZTable                   ; $52C6: $21 $10 $C3
    add  hl, bc                                   ; $52C9: $09
    ld   a, [hl]                                  ; $52CA: $7E
    and  $80                                      ; $52CB: $E6 $80
    ldh  [hFFE8], a                               ; $52CD: $E0 $E8
    jr   z, jr_018_52D7                           ; $52CF: $28 $06

    ld   [hl], b                                  ; $52D1: $70
    ld   hl, wEntitiesSpeedZTable                 ; $52D2: $21 $20 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70

jr_018_52D7:
    ldh  a, [hActiveEntityWalking]                ; $52D7: $F0 $F0
    rst  $00                                      ; $52D9: $C7
    ld   [c], a                                   ; $52DA: $E2
    ld   d, d                                     ; $52DB: $52
    rrca                                          ; $52DC: $0F
    ld   d, e                                     ; $52DD: $53
    jr   c, @+$55                                 ; $52DE: $38 $53

    ld   e, e                                     ; $52E0: $5B
    ld   d, e                                     ; $52E1: $53
    call GetEntityTransitionCountdown             ; $52E2: $CD $05 $0C
    ret  nz                                       ; $52E5: $C0

    ld   hl, wEntity0SpeedX                       ; $52E6: $21 $40 $C2
    add  hl, bc                                   ; $52E9: $09
    ld   [hl], $0C                                ; $52EA: $36 $0C
    call func_018_7E6C                            ; $52EC: $CD $6C $7E
    ldh  a, [wActiveEntityPosX]                   ; $52EF: $F0 $EE
    cp   $20                                      ; $52F1: $FE $20
    jr   nz, jr_018_5304                          ; $52F3: $20 $0F

    ld   a, $01                                   ; $52F5: $3E $01
    call func_018_59AE                            ; $52F7: $CD $AE $59
    ld   a, $01                                   ; $52FA: $3E $01
    ldh  [hLinkDirection], a                      ; $52FC: $E0 $9E
    push bc                                       ; $52FE: $C5
    call $0BF0                                    ; $52FF: $CD $F0 $0B
    pop  bc                                       ; $5302: $C1
    ret                                           ; $5303: $C9

jr_018_5304:
    cp   $48                                      ; $5304: $FE $48
    ret  nz                                       ; $5306: $C0

    call GetEntityTransitionCountdown             ; $5307: $CD $05 $0C
    ld   [hl], $40                                ; $530A: $36 $40
    jp   IncrementEntityWalkingAttr               ; $530C: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $530F: $CD $05 $0C
    jr   nz, jr_018_5321                          ; $5312: $20 $0D

    ld   a, $E3                                   ; $5314: $3E $E3
    call OpenDialogInTable1                       ; $5316: $CD $73 $23
    call GetEntityTransitionCountdown             ; $5319: $CD $05 $0C
    ld   [hl], $10                                ; $531C: $36 $10
    call IncrementEntityWalkingAttr               ; $531E: $CD $12 $3B

func_018_5321:
jr_018_5321:
    ldh  a, [hFFE8]                               ; $5321: $F0 $E8
    and  a                                        ; $5323: $A7
    jr   z, jr_018_5337                           ; $5324: $28 $11

    ld   hl, $C440                                ; $5326: $21 $40 $C4
    add  hl, bc                                   ; $5329: $09
    ld   a, [hl]                                  ; $532A: $7E
    dec  [hl]                                     ; $532B: $35
    and  a                                        ; $532C: $A7
    jr   nz, jr_018_5337                          ; $532D: $20 $08

    ld   [hl], $08                                ; $532F: $36 $08
    ld   hl, wEntitiesSpeedZTable                 ; $5331: $21 $20 $C3
    add  hl, bc                                   ; $5334: $09
    ld   [hl], $12                                ; $5335: $36 $12

jr_018_5337:
    ret                                           ; $5337: $C9

    call func_018_5321                            ; $5338: $CD $21 $53
    ld   a, [wDialogState]                        ; $533B: $FA $9F $C1
    and  a                                        ; $533E: $A7
    ret  nz                                       ; $533F: $C0

    call GetEntityTransitionCountdown             ; $5340: $CD $05 $0C
    jr   nz, jr_018_534F                          ; $5343: $20 $0A

    ld   [hl], $10                                ; $5345: $36 $10
    ld   a, $E5                                   ; $5347: $3E $E5
    call OpenDialogInTable1                       ; $5349: $CD $73 $23
    jp   IncrementEntityWalkingAttr               ; $534C: $C3 $12 $3B

jr_018_534F:
    ld   e, $02                                   ; $534F: $1E $02
    cp   $08                                      ; $5351: $FE $08
    jr   nc, jr_018_5357                          ; $5353: $30 $02

    ld   e, $00                                   ; $5355: $1E $00

jr_018_5357:
    ld   a, e                                     ; $5357: $7B
    jp   label_018_59AE                           ; $5358: $C3 $AE $59

    call func_018_5321                            ; $535B: $CD $21 $53
    ld   a, [wDialogState]                        ; $535E: $FA $9F $C1
    and  a                                        ; $5361: $A7
    jr   nz, jr_018_53CD                          ; $5362: $20 $69

    call GetEntityTransitionCountdown             ; $5364: $CD $05 $0C
    jr   z, jr_018_5375                           ; $5367: $28 $0C

    ld   e, $01                                   ; $5369: $1E $01
    cp   $08                                      ; $536B: $FE $08
    jr   c, jr_018_5371                           ; $536D: $38 $02

    ld   e, $02                                   ; $536F: $1E $02

jr_018_5371:
    ld   a, e                                     ; $5371: $7B
    jp   label_018_59AE                           ; $5372: $C3 $AE $59

jr_018_5375:
    ldh  a, [hFrameCounter]                       ; $5375: $F0 $E7
    rra                                           ; $5377: $1F
    rra                                           ; $5378: $1F
    rra                                           ; $5379: $1F
    and  $01                                      ; $537A: $E6 $01
    add  $02                                      ; $537C: $C6 $02
    call label_3B0C                               ; $537E: $CD $0C $3B
    ld   hl, $DB74                                ; $5381: $21 $74 $DB
    ld   [hl], $01                                ; $5384: $36 $01
    ldh  a, [wActiveEntityPosX]                   ; $5386: $F0 $EE
    and  $FC                                      ; $5388: $E6 $FC
    cp   $E0                                      ; $538A: $FE $E0
    jr   z, jr_018_5397                           ; $538C: $28 $09

    ld   hl, wEntity0SpeedX                       ; $538E: $21 $40 $C2
    add  hl, bc                                   ; $5391: $09
    ld   [hl], $EC                                ; $5392: $36 $EC
    call func_018_7E6C                            ; $5394: $CD $6C $7E

jr_018_5397:
    ld   a, [$C50F]                               ; $5397: $FA $0F $C5
    ld   e, a                                     ; $539A: $5F
    ld   d, b                                     ; $539B: $50
    ld   hl, wEntity0SpeedX                       ; $539C: $21 $40 $C2
    add  hl, de                                   ; $539F: $19
    ld   [hl], $F4                                ; $53A0: $36 $F4
    ldh  a, [hFrameCounter]                       ; $53A2: $F0 $E7
    rra                                           ; $53A4: $1F
    rra                                           ; $53A5: $1F
    rra                                           ; $53A6: $1F
    and  $01                                      ; $53A7: $E6 $01
    add  $04                                      ; $53A9: $C6 $04
    ld   hl, wEntitiesUnknownTableG               ; $53AB: $21 $B0 $C3
    add  hl, de                                   ; $53AE: $19
    ld   [hl], a                                  ; $53AF: $77
    push de                                       ; $53B0: $D5
    push bc                                       ; $53B1: $C5
    ld   c, e                                     ; $53B2: $4B
    ld   b, d                                     ; $53B3: $42
    call func_018_7E6C                            ; $53B4: $CD $6C $7E
    pop  bc                                       ; $53B7: $C1
    pop  de                                       ; $53B8: $D1
    ld   hl, wEntity0PosX                         ; $53B9: $21 $00 $C2
    add  hl, de                                   ; $53BC: $19
    ld   a, [hl]                                  ; $53BD: $7E
    cp   $F0                                      ; $53BE: $FE $F0
    jr   nz, jr_018_53CD                          ; $53C0: $20 $0B

    call func_018_7F08                            ; $53C2: $CD $08 $7F
    xor  a                                        ; $53C5: $AF
    ld   [wIsMarinFollowingLink], a               ; $53C6: $EA $73 $DB
    xor  a                                        ; $53C9: $AF
    ld   [wC167], a                               ; $53CA: $EA $67 $C1

jr_018_53CD:
    ret                                           ; $53CD: $C9

    call func_018_548A                            ; $53CE: $CD $8A $54
    call func_018_7DE8                            ; $53D1: $CD $E8 $7D
    ld   hl, hLinkPositionX                       ; $53D4: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $53D7: $F0 $EE
    sub  [hl]                                     ; $53D9: $96
    add  $04                                      ; $53DA: $C6 $04
    cp   $08                                      ; $53DC: $FE $08
    jr   nc, jr_018_53ED                          ; $53DE: $30 $0D

    ld   hl, hLinkPositionY                       ; $53E0: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $53E3: $F0 $EC
    add  $04                                      ; $53E5: $C6 $04
    sub  [hl]                                     ; $53E7: $96
    jr   c, jr_018_53ED                           ; $53E8: $38 $03

    call func_018_7D3B                            ; $53EA: $CD $3B $7D

jr_018_53ED:
    ld   hl, hLinkPositionX                       ; $53ED: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $53F0: $F0 $EE
    sub  [hl]                                     ; $53F2: $96
    add  $06                                      ; $53F3: $C6 $06
    cp   $0C                                      ; $53F5: $FE $0C
    jr   nc, jr_018_5466                          ; $53F7: $30 $6D

    ld   hl, hLinkPositionY                       ; $53F9: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $53FC: $F0 $EC
    sub  [hl]                                     ; $53FE: $96
    add  $08                                      ; $53FF: $C6 $08
    cp   $04                                      ; $5401: $FE $04
    jr   nc, jr_018_5466                          ; $5403: $30 $61

    ld   e, $20                                   ; $5405: $1E $20
    ld   a, [wAButtonSlot]                        ; $5407: $FA $00 $DB
    cp   $03                                      ; $540A: $FE $03
    jr   z, jr_018_5417                           ; $540C: $28 $09

    ld   e, $10                                   ; $540E: $1E $10
    ld   a, [wBButtonSlot]                        ; $5410: $FA $01 $DB
    cp   $03                                      ; $5413: $FE $03
    jr   nz, jr_018_5466                          ; $5415: $20 $4F

jr_018_5417:
    ldh  a, [hPressedButtonsMask]                 ; $5417: $F0 $CB
    and  e                                        ; $5419: $A3
    jr   z, jr_018_5466                           ; $541A: $28 $4A

    ld   a, $02                                   ; $541C: $3E $02
    ldh  [$FFBA], a                               ; $541E: $E0 $BA
    ld   a, $3A                                   ; $5420: $3E $3A
    ldh  [hLinkAnimationState], a                 ; $5422: $E0 $9D
    ld   a, $02                                   ; $5424: $3E $02
    ldh  [hLinkDirection], a                      ; $5426: $E0 $9E
    ld   a, $01                                   ; $5428: $3E $01
    ldh  [$FFA1], a                               ; $542A: $E0 $A1
    call label_CAF                                ; $542C: $CD $AF $0C
    ldh  a, [wActiveEntityPosX]                   ; $542F: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $5431: $E0 $98
    ldh  a, [wActiveEntityPosY]                   ; $5433: $F0 $EC
    add  $08                                      ; $5435: $C6 $08
    ldh  [hLinkPositionY], a                      ; $5437: $E0 $99
    cp   $50                                      ; $5439: $FE $50
    jr   nc, jr_018_545F                          ; $543B: $30 $22

    ldh  a, [hPressedButtonsMask]                 ; $543D: $F0 $CB
    and  $08                                      ; $543F: $E6 $08
    jr   z, jr_018_545F                           ; $5441: $28 $1C

    ld   hl, $C3D0                                ; $5443: $21 $D0 $C3
    add  hl, bc                                   ; $5446: $09
    ld   a, [hl]                                  ; $5447: $7E
    inc  [hl]                                     ; $5448: $34
    and  $18                                      ; $5449: $E6 $18
    jr   z, jr_018_545E                           ; $544B: $28 $11

    ld   hl, hLinkAnimationState                  ; $544D: $21 $9D $FF
    inc  [hl]                                     ; $5450: $34
    ld   hl, wEntity0SpeedY                       ; $5451: $21 $50 $C2
    add  hl, bc                                   ; $5454: $09
    ld   [hl], $04                                ; $5455: $36 $04
    call func_018_7E62                            ; $5457: $CD $62 $7E
    ld   a, $01                                   ; $545A: $3E $01
    ldh  [$FFBA], a                               ; $545C: $E0 $BA

jr_018_545E:
    ret                                           ; $545E: $C9

jr_018_545F:
    ld   hl, $C3D0                                ; $545F: $21 $D0 $C3
    add  hl, bc                                   ; $5462: $09
    ld   [hl], $08                                ; $5463: $36 $08
    ret                                           ; $5465: $C9

jr_018_5466:
    ldh  a, [wActiveEntityPosY]                   ; $5466: $F0 $EC
    cp   $1B                                      ; $5468: $FE $1B
    jr   c, jr_018_5479                           ; $546A: $38 $0D

    ld   hl, wEntity0SpeedY                       ; $546C: $21 $50 $C2
    add  hl, bc                                   ; $546F: $09
    ld   [hl], $FD                                ; $5470: $36 $FD
    call func_018_7E62                            ; $5472: $CD $62 $7E
    ld   a, $00                                   ; $5475: $3E $00
    ldh  [$FFBA], a                               ; $5477: $E0 $BA

jr_018_5479:
    ret                                           ; $5479: $C9

    ld   b, h                                     ; $547A: $44
    ld   bc, $2144                                ; $547B: $01 $44 $21
    ld   [hl], h                                  ; $547E: $74
    ld   bc, $2174                                ; $547F: $01 $74 $21
    ld   b, [hl]                                  ; $5482: $46
    ld   bc, $2146                                ; $5483: $01 $46 $21
    db   $76                                      ; $5486: $76
    ld   bc, $2176                                ; $5487: $01 $76 $21

func_018_548A:
    ldh  a, [hMapId]                              ; $548A: $F0 $F7
    cp   $01                                      ; $548C: $FE $01
    jr   nz, jr_018_5492                          ; $548E: $20 $02

    ldh  [hActiveEntityUnknownG], a               ; $5490: $E0 $F1

jr_018_5492:
    ld   de, $547A                                ; $5492: $11 $7A $54
    call label_3BC0                               ; $5495: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableC               ; $5498: $21 $C0 $C2
    add  hl, bc                                   ; $549B: $09
    ld   a, [hl]                                  ; $549C: $7E
    add  $FC                                      ; $549D: $C6 $FC
    cp   $F0                                      ; $549F: $FE $F0
    ret  nc                                       ; $54A1: $D0

    ldh  [wActiveEntityPosY], a                   ; $54A2: $E0 $EC

jr_018_54A4:
    ld   de, $5482                                ; $54A4: $11 $82 $54
    call label_3BC0                               ; $54A7: $CD $C0 $3B
    ldh  a, [wActiveEntityPosY]                   ; $54AA: $F0 $EC
    add  $10                                      ; $54AC: $C6 $10
    ldh  [wActiveEntityPosY], a                   ; $54AE: $E0 $EC
    ld   hl, $FFEF                                ; $54B0: $21 $EF $FF
    cp   [hl]                                     ; $54B3: $BE
    jr   c, jr_018_54A4                           ; $54B4: $38 $EE

    jp   label_3D8A                               ; $54B6: $C3 $8A $3D

    inc  h                                        ; $54B9: $24
    nop                                           ; $54BA: $00
    ld   a, $00                                   ; $54BB: $3E $00

label_018_54BD:
    ld   de, $54B9                                ; $54BD: $11 $B9 $54
    call label_3C77                               ; $54C0: $CD $77 $3C
    call func_018_7DE8                            ; $54C3: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $54C6: $CD $05 $0C
    jp   z, label_018_7F08                        ; $54C9: $CA $08 $7F

    ld   e, $01                                   ; $54CC: $1E $01
    cp   $40                                      ; $54CE: $FE $40
    jr   c, jr_018_54DF                           ; $54D0: $38 $0D

    jr   nz, jr_018_54DE                          ; $54D2: $20 $0A

    ld   hl, wEntity0PosY                         ; $54D4: $21 $10 $C2
    add  hl, bc                                   ; $54D7: $09
    ld   a, [hl]                                  ; $54D8: $7E
    add  $04                                      ; $54D9: $C6 $04
    ld   [hl], a                                  ; $54DB: $77
    jr   jr_018_54DF                              ; $54DC: $18 $01

jr_018_54DE:
    dec  e                                        ; $54DE: $1D

jr_018_54DF:
    ld   a, e                                     ; $54DF: $7B
    call label_3B0C                               ; $54E0: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $54E3: $CD $05 $0C
    ld   e, $FE                                   ; $54E6: $1E $FE
    and  $20                                      ; $54E8: $E6 $20
    jr   z, jr_018_54EE                           ; $54EA: $28 $02

    ld   e, $FC                                   ; $54EC: $1E $FC

jr_018_54EE:
    ld   hl, wEntity0SpeedY                       ; $54EE: $21 $50 $C2
    add  hl, bc                                   ; $54F1: $09
    ld   [hl], e                                  ; $54F2: $73
    ld   hl, wEntity0SpeedX                       ; $54F3: $21 $40 $C2
    add  hl, bc                                   ; $54F6: $09
    ld   [hl], $FF                                ; $54F7: $36 $FF
    ldh  a, [hFrameCounter]                       ; $54F9: $F0 $E7
    and  $03                                      ; $54FB: $E6 $03
    ret  nz                                       ; $54FD: $C0

    jp   label_018_7E5F                           ; $54FE: $C3 $5F $7E

    ld   hl, wEntitiesUnknownTableB               ; $5501: $21 $B0 $C2
    add  hl, bc                                   ; $5504: $09
    ld   a, [hl]                                  ; $5505: $7E
    and  a                                        ; $5506: $A7
    jp   nz, label_018_54BD                       ; $5507: $C2 $BD $54

    ld   a, [$D8FD]                               ; $550A: $FA $FD $D8
    and  $20                                      ; $550D: $E6 $20
    jp   nz, label_018_589A                       ; $550F: $C2 $9A $58

    call func_018_586B                            ; $5512: $CD $6B $58
    call func_018_7DE8                            ; $5515: $CD $E8 $7D
    call func_018_7E98                            ; $5518: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $551B: $21 $20 $C3
    add  hl, bc                                   ; $551E: $09
    dec  [hl]                                     ; $551F: $35
    ld   hl, wEntitiesPosZTable                   ; $5520: $21 $10 $C3
    add  hl, bc                                   ; $5523: $09
    ld   a, [hl]                                  ; $5524: $7E
    and  $80                                      ; $5525: $E6 $80
    jr   z, jr_018_552F                           ; $5527: $28 $06

    ld   [hl], b                                  ; $5529: $70
    ld   hl, wEntitiesSpeedZTable                 ; $552A: $21 $20 $C3
    add  hl, bc                                   ; $552D: $09
    ld   [hl], b                                  ; $552E: $70

jr_018_552F:
    call func_018_7D36                            ; $552F: $CD $36 $7D
    ldh  a, [hActiveEntityWalking]                ; $5532: $F0 $F0
    rst  $00                                      ; $5534: $C7
    ld   b, a                                     ; $5535: $47
    ld   d, l                                     ; $5536: $55
    cp   h                                        ; $5537: $BC
    ld   d, l                                     ; $5538: $55
    rst  $18                                      ; $5539: $DF
    ld   d, l                                     ; $553A: $55
    db   $76                                      ; $553B: $76
    ld   d, [hl]                                  ; $553C: $56
    ld   [$1B56], a                               ; $553D: $EA $56 $1B
    ld   d, a                                     ; $5540: $57
    ld   d, d                                     ; $5541: $52
    ld   d, a                                     ; $5542: $57
    ld   a, l                                     ; $5543: $7D
    ld   d, a                                     ; $5544: $57
    sbc  d                                        ; $5545: $9A
    ld   d, a                                     ; $5546: $57
    ld   hl, $C3D0                                ; $5547: $21 $D0 $C3
    add  hl, bc                                   ; $554A: $09
    inc  [hl]                                     ; $554B: $34
    ld   a, $7F                                   ; $554C: $3E $7F
    and  [hl]                                     ; $554E: $A6
    jr   nz, jr_018_557B                          ; $554F: $20 $2A

    ld   a, $C4                                   ; $5551: $3E $C4
    call label_3B86                               ; $5553: $CD $86 $3B
    jr   c, jr_018_557B                           ; $5556: $38 $23

    ldh  a, [hScratchA]                           ; $5558: $F0 $D7
    sub  $08                                      ; $555A: $D6 $08
    ld   hl, wEntity0PosX                         ; $555C: $21 $00 $C2
    add  hl, de                                   ; $555F: $19
    ld   [hl], a                                  ; $5560: $77
    ldh  a, [hScratchB]                           ; $5561: $F0 $D8
    add  $02                                      ; $5563: $C6 $02
    ld   hl, wEntity0PosY                         ; $5565: $21 $10 $C2
    add  hl, de                                   ; $5568: $19
    ld   [hl], a                                  ; $5569: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $556A: $21 $E0 $C2
    add  hl, de                                   ; $556D: $19
    ld   [hl], $60                                ; $556E: $36 $60
    ld   hl, $C340                                ; $5570: $21 $40 $C3
    add  hl, de                                   ; $5573: $19
    ld   [hl], $C1                                ; $5574: $36 $C1
    ld   hl, wEntitiesUnknownTableB               ; $5576: $21 $B0 $C2
    add  hl, de                                   ; $5579: $19
    inc  [hl]                                     ; $557A: $34

jr_018_557B:
    ld   a, [wIsMarinFollowingLink]               ; $557B: $FA $73 $DB
    and  a                                        ; $557E: $A7
    jr   nz, jr_018_558A                          ; $557F: $20 $09

    call func_018_7D7C                            ; $5581: $CD $7C $7D
    ret  nc                                       ; $5584: $D0

    ld   a, $E0                                   ; $5585: $3E $E0
    jp   OpenDialogInTable1                       ; $5587: $C3 $73 $23

jr_018_558A:
    call func_018_7EB2                            ; $558A: $CD $B2 $7E
    add  $13                                      ; $558D: $C6 $13
    cp   $26                                      ; $558F: $FE $26
    ret  nc                                       ; $5591: $D0

    call func_018_7EC2                            ; $5592: $CD $C2 $7E
    add  $20                                      ; $5595: $C6 $20
    cp   $40                                      ; $5597: $FE $40
    ret  nc                                       ; $5599: $D0

    call label_CAF                                ; $559A: $CD $AF $0C
    call ClearLinkPositionIncrement               ; $559D: $CD $8E $17
    ld   a, [$C146]                               ; $55A0: $FA $46 $C1
    and  a                                        ; $55A3: $A7
    ret  nz                                       ; $55A4: $C0

    ld   a, [$C50F]                               ; $55A5: $FA $0F $C5
    ld   e, a                                     ; $55A8: $5F
    ld   d, b                                     ; $55A9: $50
    ld   hl, wEntitiesPosZTable                   ; $55AA: $21 $10 $C3
    add  hl, de                                   ; $55AD: $19
    ld   a, [hl]                                  ; $55AE: $7E
    and  a                                        ; $55AF: $A7
    ret  nz                                       ; $55B0: $C0

    call IncrementEntityWalkingAttr               ; $55B1: $CD $12 $3B
    ld   a, $E1                                   ; $55B4: $3E $E1
    call OpenDialogInTable1                       ; $55B6: $CD $73 $23
    jp   label_018_59AC                           ; $55B9: $C3 $AC $59

    ld   a, [wDialogState]                        ; $55BC: $FA $9F $C1
    and  a                                        ; $55BF: $A7
    ret  nz                                       ; $55C0: $C0

    call IncrementEntityWalkingAttr               ; $55C1: $CD $12 $3B
    ld   a, [wC177]                               ; $55C4: $FA $77 $C1
    and  a                                        ; $55C7: $A7
    jr   nz, jr_018_55D8                          ; $55C8: $20 $0E

    ld   a, $2F                                   ; $55CA: $3E $2F
    ld   [wWorldMusicTrack], a                    ; $55CC: $EA $68 $D3
    ld   [$C3C8], a                               ; $55CF: $EA $C8 $C3
    call label_BFB                                ; $55D2: $CD $FB $0B
    ld   [hl], $50                                ; $55D5: $36 $50
    ret                                           ; $55D7: $C9

jr_018_55D8:
    ld   [hl], $08                                ; $55D8: $36 $08
    ld   a, $E4                                   ; $55DA: $3E $E4
    jp   OpenDialogInTable1                       ; $55DC: $C3 $73 $23

    ld   a, $01                                   ; $55DF: $3E $01
    ld   [wC167], a                               ; $55E1: $EA $67 $C1
    ld   a, $02                                   ; $55E4: $3E $02
    ldh  [$FFA1], a                               ; $55E6: $E0 $A1
    call label_BFB                                ; $55E8: $CD $FB $0B
    jr   nz, jr_018_55F2                          ; $55EB: $20 $05

    ld   [hl], $C0                                ; $55ED: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $55EF: $C3 $12 $3B

jr_018_55F2:
    ld   e, $00                                   ; $55F2: $1E $00
    cp   $40                                      ; $55F4: $FE $40
    jr   nc, jr_018_5612                          ; $55F6: $30 $1A

    ld   e, $02                                   ; $55F8: $1E $02
    cp   $10                                      ; $55FA: $FE $10
    jr   c, jr_018_5612                           ; $55FC: $38 $14

    ld   e, $00                                   ; $55FE: $1E $00
    cp   $3C                                      ; $5600: $FE $3C
    jr   nc, jr_018_5610                          ; $5602: $30 $0C

    cp   $20                                      ; $5604: $FE $20
    jr   z, jr_018_5612                           ; $5606: $28 $0A

    cp   $21                                      ; $5608: $FE $21
    jr   z, jr_018_5612                           ; $560A: $28 $06

    cp   $22                                      ; $560C: $FE $22
    jr   z, jr_018_5612                           ; $560E: $28 $02

jr_018_5610:
    ld   e, $01                                   ; $5610: $1E $01

jr_018_5612:
    ld   a, e                                     ; $5612: $7B
    jp   label_3B0C                               ; $5613: $C3 $0C $3B

    ld   bc, $0102                                ; $5616: $01 $02 $01
    ld   [bc], a                                  ; $5619: $02
    ld   bc, $0201                                ; $561A: $01 $01 $02
    ld   [bc], a                                  ; $561D: $02
    ld   bc, $0102                                ; $561E: $01 $02 $01
    ld   [bc], a                                  ; $5621: $02
    ld   bc, $0201                                ; $5622: $01 $01 $02
    ld   [bc], a                                  ; $5625: $02
    ld   bc, $0102                                ; $5626: $01 $02 $01
    ld   [bc], a                                  ; $5629: $02
    ld   bc, $0201                                ; $562A: $01 $01 $02
    ld   [bc], a                                  ; $562D: $02
    ld   bc, $0102                                ; $562E: $01 $02 $01
    ld   [bc], a                                  ; $5631: $02
    ld   bc, $0201                                ; $5632: $01 $01 $02
    ld   [bc], a                                  ; $5635: $02
    ld   bc, $0102                                ; $5636: $01 $02 $01
    ld   [bc], a                                  ; $5639: $02
    ld   bc, $0201                                ; $563A: $01 $01 $02
    ld   [bc], a                                  ; $563D: $02
    ld   bc, $0102                                ; $563E: $01 $02 $01
    ld   [bc], a                                  ; $5641: $02
    ld   bc, $0201                                ; $5642: $01 $01 $02
    ld   [bc], a                                  ; $5645: $02
    ld   bc, $0102                                ; $5646: $01 $02 $01
    ld   [bc], a                                  ; $5649: $02
    ld   bc, $0201                                ; $564A: $01 $01 $02
    ld   [bc], a                                  ; $564D: $02
    ld   bc, $0102                                ; $564E: $01 $02 $01
    ld   [bc], a                                  ; $5651: $02
    ld   bc, $0201                                ; $5652: $01 $01 $02
    ld   [bc], a                                  ; $5655: $02
    ld   bc, $0102                                ; $5656: $01 $02 $01
    ld   [bc], a                                  ; $5659: $02
    ld   bc, $0201                                ; $565A: $01 $01 $02
    ld   [bc], a                                  ; $565D: $02
    ld   bc, $0102                                ; $565E: $01 $02 $01
    ld   [bc], a                                  ; $5661: $02
    ld   bc, $0201                                ; $5662: $01 $01 $02
    ld   [bc], a                                  ; $5665: $02
    ld   bc, $0102                                ; $5666: $01 $02 $01
    ld   [bc], a                                  ; $5669: $02
    ld   bc, $0201                                ; $566A: $01 $01 $02
    ld   [bc], a                                  ; $566D: $02
    ld   bc, $0102                                ; $566E: $01 $02 $01
    ld   [bc], a                                  ; $5671: $02
    ld   bc, $0201                                ; $5672: $01 $01 $02
    ld   [bc], a                                  ; $5675: $02
    ld   a, $01                                   ; $5676: $3E $01
    ld   [wC167], a                               ; $5678: $EA $67 $C1
    ld   a, $02                                   ; $567B: $3E $02
    ldh  [$FFA1], a                               ; $567D: $E0 $A1
    call label_BFB                                ; $567F: $CD $FB $0B
    jr   nz, jr_018_5698                          ; $5682: $20 $14

    ld   [$C3C8], a                               ; $5684: $EA $C8 $C3
    ld   a, $11                                   ; $5687: $3E $11
    ldh  [hNoiseSfx], a                           ; $5689: $E0 $F4
    call GetEntityTransitionCountdown             ; $568B: $CD $05 $0C
    ld   [hl], $08                                ; $568E: $36 $08
    ld   a, $02                                   ; $5690: $3E $02
    call label_3B0C                               ; $5692: $CD $0C $3B
    jp   IncrementEntityWalkingAttr               ; $5695: $C3 $12 $3B

jr_018_5698:
    ld   hl, wEntitiesUnknownTableD               ; $5698: $21 $D0 $C2
    add  hl, bc                                   ; $569B: $09
    ld   e, [hl]                                  ; $569C: $5E
    ld   d, b                                     ; $569D: $50
    ldh  a, [hFrameCounter]                       ; $569E: $F0 $E7
    and  $07                                      ; $56A0: $E6 $07
    jr   nz, jr_018_56B8                          ; $56A2: $20 $14

    inc  [hl]                                     ; $56A4: $34
    ld   a, [hl]                                  ; $56A5: $7E
    cp   $60                                      ; $56A6: $FE $60
    jr   nc, jr_018_56B8                          ; $56A8: $30 $0E

    and  $0F                                      ; $56AA: $E6 $0F
    jr   nz, jr_018_56B8                          ; $56AC: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $56AE: $21 $20 $C3
    add  hl, bc                                   ; $56B1: $09
    ld   [hl], $10                                ; $56B2: $36 $10
    ld   a, $24                                   ; $56B4: $3E $24
    ldh  [hJingle], a                             ; $56B6: $E0 $F2

jr_018_56B8:
    ld   hl, $5616                                ; $56B8: $21 $16 $56
    add  hl, de                                   ; $56BB: $19
    ld   a, [hl]                                  ; $56BC: $7E
    cp   $02                                      ; $56BD: $FE $02
    jr   nz, jr_018_56CE                          ; $56BF: $20 $0D

    ldh  a, [hFrameCounter]                       ; $56C1: $F0 $E7
    and  $3F                                      ; $56C3: $E6 $3F
    jr   nz, jr_018_56CC                          ; $56C5: $20 $05

    ld   hl, hJingle                              ; $56C7: $21 $F2 $FF
    ld   [hl], $27                                ; $56CA: $36 $27

jr_018_56CC:
    ld   a, $02                                   ; $56CC: $3E $02

jr_018_56CE:
    call label_3B0C                               ; $56CE: $CD $0C $3B
    ld   hl, wEntitiesPosZTable                   ; $56D1: $21 $10 $C3
    add  hl, bc                                   ; $56D4: $09
    ld   a, [hl]                                  ; $56D5: $7E
    and  a                                        ; $56D6: $A7
    ret  z                                        ; $56D7: $C8

    ld   e, $01                                   ; $56D8: $1E $01
    ld   hl, wEntitiesSpeedZTable                 ; $56DA: $21 $20 $C3
    add  hl, bc                                   ; $56DD: $09
    ld   a, [hl]                                  ; $56DE: $7E
    sub  $F8                                      ; $56DF: $D6 $F8
    and  $80                                      ; $56E1: $E6 $80
    jr   nz, jr_018_56E6                          ; $56E3: $20 $01

    inc  e                                        ; $56E5: $1C

jr_018_56E6:
    ld   a, e                                     ; $56E6: $7B
    jp   label_3B0C                               ; $56E7: $C3 $0C $3B

    ld   a, $02                                   ; $56EA: $3E $02
    ldh  [$FFA1], a                               ; $56EC: $E0 $A1
    call GetEntityTransitionCountdown             ; $56EE: $CD $05 $0C
    ret  nz                                       ; $56F1: $C0

    ld   [hl], $10                                ; $56F2: $36 $10
    ld   hl, wEntity0PosY                         ; $56F4: $21 $10 $C2
    add  hl, bc                                   ; $56F7: $09
    ld   a, [hl]                                  ; $56F8: $7E
    add  $04                                      ; $56F9: $C6 $04
    ld   [hl], a                                  ; $56FB: $77
    ld   hl, wEntitiesUnknownTableG               ; $56FC: $21 $B0 $C3
    add  hl, bc                                   ; $56FF: $09
    ld   a, [hl]                                  ; $5700: $7E
    inc  a                                        ; $5701: $3C
    ld   [hl], a                                  ; $5702: $77
    cp   $04                                      ; $5703: $FE $04
    ret  nz                                       ; $5705: $C0

    ld   hl, wEntitiesPosZTable                   ; $5706: $21 $10 $C3
    add  hl, bc                                   ; $5709: $09
    ld   [hl], $18                                ; $570A: $36 $18
    ld   hl, wEntity0PosY                         ; $570C: $21 $10 $C2
    add  hl, bc                                   ; $570F: $09
    ld   a, [hl]                                  ; $5710: $7E
    add  $18                                      ; $5711: $C6 $18
    ld   [hl], a                                  ; $5713: $77
    ld   a, $08                                   ; $5714: $3E $08
    ldh  [hJingle], a                             ; $5716: $E0 $F2
    jp   IncrementEntityWalkingAttr               ; $5718: $C3 $12 $3B

    ld   a, $02                                   ; $571B: $3E $02
    ldh  [$FFA1], a                               ; $571D: $E0 $A1
    ld   hl, wEntitiesPosZTable                   ; $571F: $21 $10 $C3
    add  hl, bc                                   ; $5722: $09
    ld   a, [hl]                                  ; $5723: $7E
    and  a                                        ; $5724: $A7
    ret  nz                                       ; $5725: $C0

    call IncrementEntityWalkingAttr               ; $5726: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5729: $CD $05 $0C
    ld   [hl], $08                                ; $572C: $36 $08

func_018_572E:
label_018_572E:
    ld   a, $24                                   ; $572E: $3E $24
    ldh  [hNoiseSfx], a                           ; $5730: $E0 $F4
    ldh  a, [wActiveEntityPosX]                   ; $5732: $F0 $EE
    ldh  [hScratchA], a                           ; $5734: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $5736: $F0 $EC
    add  $10                                      ; $5738: $C6 $10
    ldh  [hScratchB], a                           ; $573A: $E0 $D8
    ld   a, $01                                   ; $573C: $3E $01
    call label_CC7                                ; $573E: $CD $C7 $0C
    ldh  a, [wActiveEntityPosX]                   ; $5741: $F0 $EE
    add  $10                                      ; $5743: $C6 $10
    ldh  [hScratchA], a                           ; $5745: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $5747: $F0 $EC
    add  $10                                      ; $5749: $C6 $10
    ldh  [hScratchB], a                           ; $574B: $E0 $D8
    ld   a, $01                                   ; $574D: $3E $01
    jp   label_CC7                                ; $574F: $C3 $C7 $0C

    call GetEntityTransitionCountdown             ; $5752: $CD $05 $0C
    jr   nz, jr_018_5778                          ; $5755: $20 $21

    call IncrementEntityWalkingAttr               ; $5757: $CD $12 $3B
    ldh  a, [hMusicTrack]                         ; $575A: $F0 $B0
    ld   [wWorldMusicTrack], a                    ; $575C: $EA $68 $D3
    ld   a, $FF                                   ; $575F: $3E $FF
    call label_3B0C                               ; $5761: $CD $0C $3B
    ld   a, $E2                                   ; $5764: $3E $E2
    call OpenDialogInTable1                       ; $5766: $CD $73 $23
    ld   a, $03                                   ; $5769: $3E $03
    call func_018_59AE                            ; $576B: $CD $AE $59
    ld   a, $03                                   ; $576E: $3E $03
    ldh  [hLinkDirection], a                      ; $5770: $E0 $9E
    push bc                                       ; $5772: $C5
    call $0BF0                                    ; $5773: $CD $F0 $0B
    pop  bc                                       ; $5776: $C1
    ret                                           ; $5777: $C9

jr_018_5778:
    ld   a, $05                                   ; $5778: $3E $05
    jp   label_3B0C                               ; $577A: $C3 $0C $3B

    ld   a, $C8                                   ; $577D: $3E $C8
    call label_3B86                               ; $577F: $CD $86 $3B
    ld   hl, wEntity0PosX                         ; $5782: $21 $00 $C2
    add  hl, de                                   ; $5785: $19
    ld   [hl], $F8                                ; $5786: $36 $F8
    ld   hl, wEntitiesTransitionCountdownTable    ; $5788: $21 $E0 $C2
    add  hl, de                                   ; $578B: $19
    ld   [hl], $20                                ; $578C: $36 $20
    ld   hl, wEntity0PosY                         ; $578E: $21 $10 $C2
    add  hl, de                                   ; $5791: $19
    ld   [hl], $48                                ; $5792: $36 $48
    call func_018_7F08                            ; $5794: $CD $08 $7F
    jp   label_018_7FB9                           ; $5797: $C3 $B9 $7F

    ret                                           ; $579A: $C9

    nop                                           ; $579B: $00
    nop                                           ; $579C: $00
    ld   h, b                                     ; $579D: $60
    ld   bc, label_800                            ; $579E: $01 $00 $08
    ld   h, d                                     ; $57A1: $62
    ld   bc, label_1000                           ; $57A2: $01 $00 $10
    ld   h, h                                     ; $57A5: $64
    ld   bc, $1800                                ; $57A6: $01 $00 $18
    ld   h, [hl]                                  ; $57A9: $66
    ld   bc, $0010                                ; $57AA: $01 $10 $00
    ld   l, b                                     ; $57AD: $68
    ld   bc, $0810                                ; $57AE: $01 $10 $08
    ld   l, d                                     ; $57B1: $6A
    ld   bc, $1010                                ; $57B2: $01 $10 $10
    ld   l, h                                     ; $57B5: $6C
    ld   bc, $1810                                ; $57B6: $01 $10 $18
    ld   l, [hl]                                  ; $57B9: $6E
    ld   bc, $0000                                ; $57BA: $01 $00 $00
    ld   h, b                                     ; $57BD: $60
    ld   bc, label_800                            ; $57BE: $01 $00 $08
    ld   [hl], b                                  ; $57C1: $70
    ld   bc, label_1000                           ; $57C2: $01 $00 $10
    ld   h, h                                     ; $57C5: $64
    ld   bc, $1800                                ; $57C6: $01 $00 $18
    ld   h, [hl]                                  ; $57C9: $66
    ld   bc, $0010                                ; $57CA: $01 $10 $00
    ld   l, b                                     ; $57CD: $68
    ld   bc, $0810                                ; $57CE: $01 $10 $08
    ld   l, d                                     ; $57D1: $6A
    ld   bc, $1010                                ; $57D2: $01 $10 $10
    ld   l, h                                     ; $57D5: $6C
    ld   bc, $1810                                ; $57D6: $01 $10 $18
    ld   l, [hl]                                  ; $57D9: $6E
    ld   bc, $0000                                ; $57DA: $01 $00 $00
    ld   [hl], d                                  ; $57DD: $72
    ld   bc, label_800                            ; $57DE: $01 $00 $08
    ld   [hl], h                                  ; $57E1: $74
    ld   bc, label_1000                           ; $57E2: $01 $00 $10
    ld   h, h                                     ; $57E5: $64
    ld   bc, $1800                                ; $57E6: $01 $00 $18
    ld   h, [hl]                                  ; $57E9: $66
    ld   bc, $0010                                ; $57EA: $01 $10 $00
    db   $76                                      ; $57ED: $76
    ld   bc, $0810                                ; $57EE: $01 $10 $08
    ld   l, d                                     ; $57F1: $6A
    ld   bc, $1010                                ; $57F2: $01 $10 $10
    ld   l, h                                     ; $57F5: $6C
    ld   bc, $1810                                ; $57F6: $01 $10 $18
    ld   l, [hl]                                  ; $57F9: $6E
    ld   bc, $0000                                ; $57FA: $01 $00 $00
    ld   a, b                                     ; $57FD: $78
    ld   bc, label_800                            ; $57FE: $01 $00 $08
    ld   a, d                                     ; $5801: $7A
    ld   bc, label_1000                           ; $5802: $01 $00 $10
    ld   a, h                                     ; $5805: $7C
    ld   bc, $1800                                ; $5806: $01 $00 $18
    ld   a, [hl]                                  ; $5809: $7E
    ld   bc, $0010                                ; $580A: $01 $10 $00
    ld   a, b                                     ; $580D: $78
    ld   b, c                                     ; $580E: $41
    db   $10                                      ; $580F: $10
    ld   [$417A], sp                              ; $5810: $08 $7A $41
    db   $10                                      ; $5813: $10
    db   $10                                      ; $5814: $10
    ld   a, h                                     ; $5815: $7C
    ld   b, c                                     ; $5816: $41
    db   $10                                      ; $5817: $10
    jr   @+$80                                    ; $5818: $18 $7E

    ld   b, c                                     ; $581A: $41
    nop                                           ; $581B: $00
    nop                                           ; $581C: $00
    ld   l, b                                     ; $581D: $68
    ld   b, c                                     ; $581E: $41
    nop                                           ; $581F: $00
    ld   [$416A], sp                              ; $5820: $08 $6A $41
    nop                                           ; $5823: $00
    db   $10                                      ; $5824: $10
    ld   l, h                                     ; $5825: $6C
    ld   b, c                                     ; $5826: $41
    nop                                           ; $5827: $00
    jr   @+$70                                    ; $5828: $18 $6E

    ld   b, c                                     ; $582A: $41
    stop                                          ; $582B: $10 $00
    ld   h, b                                     ; $582D: $60
    ld   b, c                                     ; $582E: $41
    db   $10                                      ; $582F: $10
    ld   [$4162], sp                              ; $5830: $08 $62 $41
    db   $10                                      ; $5833: $10
    db   $10                                      ; $5834: $10
    ld   h, h                                     ; $5835: $64
    ld   b, c                                     ; $5836: $41
    db   $10                                      ; $5837: $10
    jr   jr_018_58A0                              ; $5838: $18 $66

    ld   b, c                                     ; $583A: $41
    ld   c, $00                                   ; $583B: $0E $00
    ld   l, b                                     ; $583D: $68
    ld   b, c                                     ; $583E: $41
    ld   c, $08                                   ; $583F: $0E $08
    ld   l, d                                     ; $5841: $6A
    ld   b, c                                     ; $5842: $41
    ld   c, $10                                   ; $5843: $0E $10
    ld   l, h                                     ; $5845: $6C
    ld   b, c                                     ; $5846: $41
    ld   c, $18                                   ; $5847: $0E $18
    ld   l, [hl]                                  ; $5849: $6E
    ld   b, c                                     ; $584A: $41
    stop                                          ; $584B: $10 $00
    rst  $38                                      ; $584D: $FF
    ld   b, c                                     ; $584E: $41
    db   $10                                      ; $584F: $10
    ld   [$41FF], sp                              ; $5850: $08 $FF $41
    db   $10                                      ; $5853: $10
    db   $10                                      ; $5854: $10
    rst  $38                                      ; $5855: $FF
    ld   b, c                                     ; $5856: $41
    db   $10                                      ; $5857: $10
    jr   @+$01                                    ; $5858: $18 $FF

    ld   b, c                                     ; $585A: $41
    rla                                           ; $585B: $17
    inc  bc                                       ; $585C: $03
    ld   h, $00                                   ; $585D: $26 $00
    rla                                           ; $585F: $17
    add  hl, bc                                   ; $5860: $09
    ld   h, $00                                   ; $5861: $26 $00
    rla                                           ; $5863: $17
    rrca                                          ; $5864: $0F
    ld   h, $00                                   ; $5865: $26 $00
    rla                                           ; $5867: $17
    dec  d                                        ; $5868: $15
    ld   h, $00                                   ; $5869: $26 $00

func_018_586B:
    ldh  a, [hActiveEntityUnknownG]               ; $586B: $F0 $F1
    rla                                           ; $586D: $17
    rla                                           ; $586E: $17
    rla                                           ; $586F: $17
    rla                                           ; $5870: $17
    rla                                           ; $5871: $17
    and  $E0                                      ; $5872: $E6 $E0
    ld   e, a                                     ; $5874: $5F
    ld   d, b                                     ; $5875: $50
    ld   hl, $579B                                ; $5876: $21 $9B $57
    add  hl, de                                   ; $5879: $19
    ld   c, $08                                   ; $587A: $0E $08
    call label_3CE6                               ; $587C: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $587F: $21 $10 $C3
    add  hl, bc                                   ; $5882: $09
    ld   a, [hl]                                  ; $5883: $7E
    and  a                                        ; $5884: $A7
    ret  z                                        ; $5885: $C8

    ldh  a, [$FFEF]                               ; $5886: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $5888: $E0 $EC
    ld   hl, $585B                                ; $588A: $21 $5B $58
    ld   c, $04                                   ; $588D: $0E $04
    call label_3CE6                               ; $588F: $CD $E6 $3C
    ld   a, $04                                   ; $5892: $3E $04
    call label_3DA0                               ; $5894: $CD $A0 $3D
    jp   label_3D8A                               ; $5897: $C3 $8A $3D

label_018_589A:
    call $596B                                    ; $589A: $CD $6B $59
    ld   a, [wRoomTransitionState]                ; $589D: $FA $24 $C1

jr_018_58A0:
    and  a                                        ; $58A0: $A7
    ret  nz                                       ; $58A1: $C0

    ldh  a, [hActiveEntityWalking]                ; $58A2: $F0 $F0
    rst  $00                                      ; $58A4: $C7
    xor  l                                        ; $58A5: $AD
    ld   e, b                                     ; $58A6: $58
    pop  bc                                       ; $58A7: $C1
    ld   e, b                                     ; $58A8: $58
    db   $DD                                      ; $58A9: $DD
    ld   e, b                                     ; $58AA: $58
    pop  af                                       ; $58AB: $F1
    ld   e, b                                     ; $58AC: $58
    ld   hl, wEntity0PosY                         ; $58AD: $21 $10 $C2
    add  hl, bc                                   ; $58B0: $09
    ld   [hl], $68                                ; $58B1: $36 $68
    ld   hl, wEntity0PosX                         ; $58B3: $21 $00 $C2
    add  hl, bc                                   ; $58B6: $09
    ld   [hl], $80                                ; $58B7: $36 $80
    call GetEntityTransitionCountdown             ; $58B9: $CD $05 $0C
    ld   [hl], $20                                ; $58BC: $36 $20
    jp   IncrementEntityWalkingAttr               ; $58BE: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $58C1: $CD $05 $0C
    ret  nz                                       ; $58C4: $C0

    ld   a, [$DB4A]                               ; $58C5: $FA $4A $DB
    cp   $00                                      ; $58C8: $FE $00
    ret  nz                                       ; $58CA: $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $58CB: $FA $66 $C1
    and  a                                        ; $58CE: $A7
    cp   $40                                      ; $58CF: $FE $40
    ret  nz                                       ; $58D1: $C0

    call IncrementEntityWalkingAttr               ; $58D2: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $58D5: $CD $05 $0C
    ld   [hl], $20                                ; $58D8: $36 $20
    jp   label_018_572E                           ; $58DA: $C3 $2E $57

    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    jr   nz, jr_018_58E7                          ; $58E0: $20 $05

    ld   [hl], $C8                                ; $58E2: $36 $C8
    jp   IncrementEntityWalkingAttr               ; $58E4: $C3 $12 $3B

jr_018_58E7:
    cp   $10                                      ; $58E7: $FE $10
    ld   a, $01                                   ; $58E9: $3E $01
    jr   c, jr_018_58EE                           ; $58EB: $38 $01

    inc  a                                        ; $58ED: $3C

jr_018_58EE:
    jp   label_3B0C                               ; $58EE: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $58F1: $CD $05 $0C
    jr   nz, jr_018_58FC                          ; $58F4: $20 $06

    call func_018_572E                            ; $58F6: $CD $2E $57
    jp   label_018_7F08                           ; $58F9: $C3 $08 $7F

jr_018_58FC:
    cp   $B0                                      ; $58FC: $FE $B0
    jr   nz, jr_018_5900                          ; $58FE: $20 $00

jr_018_5900:
    call GetEntityTransitionCountdown             ; $5900: $CD $05 $0C
    cp   $80                                      ; $5903: $FE $80
    jr   nz, jr_018_590D                          ; $5905: $20 $06

    dec  [hl]                                     ; $5907: $35
    ld   a, $E6                                   ; $5908: $3E $E6
    call OpenDialogInTable1                       ; $590A: $CD $73 $23

jr_018_590D:
    call GetEntityTransitionCountdown             ; $590D: $CD $05 $0C
    ld   d, $00                                   ; $5910: $16 $00
    cp   $10                                      ; $5912: $FE $10
    ld   e, $02                                   ; $5914: $1E $02
    jr   c, jr_018_591E                           ; $5916: $38 $06

    dec  e                                        ; $5918: $1D
    cp   $20                                      ; $5919: $FE $20
    jr   c, jr_018_591E                           ; $591B: $38 $01

    inc  d                                        ; $591D: $14

jr_018_591E:
    ld   hl, $C390                                ; $591E: $21 $90 $C3
    add  hl, bc                                   ; $5921: $09
    ld   [hl], d                                  ; $5922: $72
    ld   a, e                                     ; $5923: $7B
    jp   label_3B0C                               ; $5924: $C3 $0C $3B

    rst  $38                                      ; $5927: $FF
    inc  b                                        ; $5928: $04
    rst  $38                                      ; $5929: $FF
    nop                                           ; $592A: $00
    rst  $38                                      ; $592B: $FF
    inc  c                                        ; $592C: $0C
    rst  $38                                      ; $592D: $FF
    nop                                           ; $592E: $00
    rst  $38                                      ; $592F: $FF
    inc  b                                        ; $5930: $04
    rst  $38                                      ; $5931: $FF
    nop                                           ; $5932: $00
    rst  $38                                      ; $5933: $FF
    inc  c                                        ; $5934: $0C
    rst  $38                                      ; $5935: $FF
    nop                                           ; $5936: $00
    rst  $38                                      ; $5937: $FF
    inc  d                                        ; $5938: $14
    rst  $38                                      ; $5939: $FF
    nop                                           ; $593A: $00
    db   $FC                                      ; $593B: $FC
    inc  b                                        ; $593C: $04
    ld   [hl], b                                  ; $593D: $70
    ld   bc, $0CFC                                ; $593E: $01 $FC $0C
    ld   [hl], d                                  ; $5941: $72
    ld   bc, $040C                                ; $5942: $01 $0C $04
    ld   [hl], h                                  ; $5945: $74
    ld   bc, label_C0C                            ; $5946: $01 $0C $0C
    db   $76                                      ; $5949: $76
    ld   bc, $140C                                ; $594A: $01 $0C $14
    ld   a, b                                     ; $594D: $78
    ld   bc, $040C                                ; $594E: $01 $0C $04
    ld   a, d                                     ; $5951: $7A
    ld   bc, label_C0C                            ; $5952: $01 $0C $0C
    ld   a, h                                     ; $5955: $7C
    ld   bc, $140C                                ; $5956: $01 $0C $14
    ld   a, [hl]                                  ; $5959: $7E
    ld   bc, $FFFF                                ; $595A: $01 $FF $FF
    rst  $38                                      ; $595D: $FF
    rst  $38                                      ; $595E: $FF
    rst  $38                                      ; $595F: $FF
    rst  $38                                      ; $5960: $FF
    rst  $38                                      ; $5961: $FF
    rst  $38                                      ; $5962: $FF
    nop                                           ; $5963: $00
    nop                                           ; $5964: $00
    ld   bc, $0302                                ; $5965: $01 $02 $03
    inc  bc                                       ; $5968: $03
    ld   [bc], a                                  ; $5969: $02
    ld   bc, $E7F0                                ; $596A: $01 $F0 $E7
    rra                                           ; $596D: $1F
    rra                                           ; $596E: $1F
    rra                                           ; $596F: $1F
    rra                                           ; $5970: $1F
    nop                                           ; $5971: $00
    nop                                           ; $5972: $00
    and  $07                                      ; $5973: $E6 $07
    ld   e, a                                     ; $5975: $5F
    ld   d, b                                     ; $5976: $50
    ld   hl, $5963                                ; $5977: $21 $63 $59
    add  hl, de                                   ; $597A: $19
    ldh  a, [wActiveEntityPosY]                   ; $597B: $F0 $EC
    add  [hl]                                     ; $597D: $86
    ldh  [wActiveEntityPosY], a                   ; $597E: $E0 $EC
    ld   hl, $C390                                ; $5980: $21 $90 $C3
    add  hl, bc                                   ; $5983: $09
    ld   a, [hl]                                  ; $5984: $7E
    and  a                                        ; $5985: $A7
    jr   z, jr_018_5995                           ; $5986: $28 $0D

    ldh  a, [hFrameCounter]                       ; $5988: $F0 $E7
    rra                                           ; $598A: $1F
    rra                                           ; $598B: $1F
    rra                                           ; $598C: $1F
    rra                                           ; $598D: $1F
    rra                                           ; $598E: $1F
    rra                                           ; $598F: $1F
    and  $01                                      ; $5990: $E6 $01
    inc  a                                        ; $5992: $3C
    ldh  [hActiveEntityUnknownG], a               ; $5993: $E0 $F1

jr_018_5995:
    ldh  a, [hActiveEntityUnknownG]               ; $5995: $F0 $F1
    rla                                           ; $5997: $17
    rla                                           ; $5998: $17
    and  $FC                                      ; $5999: $E6 $FC
    ld   e, a                                     ; $599B: $5F
    rla                                           ; $599C: $17
    rla                                           ; $599D: $17
    and  $F0                                      ; $599E: $E6 $F0
    add  e                                        ; $59A0: $83
    ld   e, a                                     ; $59A1: $5F
    ld   d, b                                     ; $59A2: $50
    ld   hl, $5927                                ; $59A3: $21 $27 $59
    add  hl, de                                   ; $59A6: $19
    ld   c, $05                                   ; $59A7: $0E $05
    jp   label_3CE6                               ; $59A9: $C3 $E6 $3C

label_018_59AC:
    ld   a, $00                                   ; $59AC: $3E $00

func_018_59AE:
label_018_59AE:
    ld   e, $10                                   ; $59AE: $1E $10
    ld   hl, $D1B5                                ; $59B0: $21 $B5 $D1

jr_018_59B3:
    ld   [hl+], a                                 ; $59B3: $22
    dec  e                                        ; $59B4: $1D
    jr   nz, jr_018_59B3                          ; $59B5: $20 $FC

    ret                                           ; $59B7: $C9

    ld   b, d                                     ; $59B8: $42
    ld   hl, $2140                                ; $59B9: $21 $40 $21
    ld   b, b                                     ; $59BC: $40
    ld   bc, $0142                                ; $59BD: $01 $42 $01
    ld   b, h                                     ; $59C0: $44
    ld   bc, $0146                                ; $59C1: $01 $46 $01
    ld   b, [hl]                                  ; $59C4: $46
    ld   hl, $2144                                ; $59C5: $21 $44 $21
    ld   c, b                                     ; $59C8: $48
    ld   bc, $014A                                ; $59C9: $01 $4A $01
    ld   c, h                                     ; $59CC: $4C
    ld   bc, $014E                                ; $59CD: $01 $4E $01
    ld   c, d                                     ; $59D0: $4A
    ld   hl, $2148                                ; $59D1: $21 $48 $21
    ld   c, [hl]                                  ; $59D4: $4E
    ld   hl, $214C                                ; $59D5: $21 $4C $21
    ld   d, b                                     ; $59D8: $50
    ld   bc, $0152                                ; $59D9: $01 $52 $01
    ld   d, h                                     ; $59DC: $54
    ld   bc, $2154                                ; $59DD: $01 $54 $21
    ld   d, d                                     ; $59E0: $52
    ld   hl, $2150                                ; $59E1: $21 $50 $21
    ld   b, $04                                   ; $59E4: $06 $04
    ld   [bc], a                                  ; $59E6: $02
    nop                                           ; $59E7: $00

label_018_59E8:
    ld   a, c                                     ; $59E8: $79
    ld   [$C50F], a                               ; $59E9: $EA $0F $C5
    call GetEntityTransitionCountdown             ; $59EC: $CD $05 $0C
    jr   z, jr_018_5A3F                           ; $59EF: $28 $4E

    cp   $10                                      ; $59F1: $FE $10
    jr   nz, jr_018_5A07                          ; $59F3: $20 $12

    dec  [hl]                                     ; $59F5: $35
    ldh  a, [hLinkPositionY]                      ; $59F6: $F0 $99
    push af                                       ; $59F8: $F5
    ld   a, $28                                   ; $59F9: $3E $28
    ldh  [hLinkPositionY], a                      ; $59FB: $E0 $99
    ld   a, $1F                                   ; $59FD: $3E $1F
    call OpenDialog                               ; $59FF: $CD $85 $23
    pop  af                                       ; $5A02: $F1
    ldh  [hLinkPositionY], a                      ; $5A03: $E0 $99
    ld   a, $0F                                   ; $5A05: $3E $0F

jr_018_5A07:
    cp   $01                                      ; $5A07: $FE $01
    jr   nz, jr_018_5A18                          ; $5A09: $20 $0D

    xor  a                                        ; $5A0B: $AF
    ld   [wC167], a                               ; $5A0C: $EA $67 $C1
    ld   a, $31                                   ; $5A0F: $3E $31
    ld   [wWorldMusicTrack], a                    ; $5A11: $EA $68 $D3
    ld   a, $05                                   ; $5A14: $3E $05
    ldh  [hMusicTrack], a                         ; $5A16: $E0 $B0

jr_018_5A18:
    xor  a                                        ; $5A18: $AF
    ld   [wEntitiesUnknownTableG], a              ; $5A19: $EA $B0 $C3
    ld   de, $59B8                                ; $5A1C: $11 $B8 $59
    call label_3BC0                               ; $5A1F: $CD $C0 $3B
    ld   a, $6C                                   ; $5A22: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $5A24: $E0 $9D
    ld   a, $02                                   ; $5A26: $3E $02
    ldh  [$FFA1], a                               ; $5A28: $E0 $A1
    ld   a, $03                                   ; $5A2A: $3E $03
    ldh  [hLinkDirection], a                      ; $5A2C: $E0 $9E
    ldh  a, [hLinkPositionX]                      ; $5A2E: $F0 $98
    ld   hl, wEntity0PosX                         ; $5A30: $21 $00 $C2
    add  hl, bc                                   ; $5A33: $09
    ld   [hl], a                                  ; $5A34: $77
    ldh  a, [hLinkPositionY]                      ; $5A35: $F0 $99
    sub  $10                                      ; $5A37: $D6 $10
    ld   hl, wEntity0PosY                         ; $5A39: $21 $10 $C2
    add  hl, bc                                   ; $5A3C: $09
    ld   [hl], a                                  ; $5A3D: $77
    ret                                           ; $5A3E: $C9

jr_018_5A3F:
    ld   hl, $C440                                ; $5A3F: $21 $40 $C4
    add  hl, bc                                   ; $5A42: $09
    ld   a, [hl]                                  ; $5A43: $7E
    and  a                                        ; $5A44: $A7
    jr   nz, @+$47                                ; $5A45: $20 $45

    ld   a, [wTransitionSequenceCounter]          ; $5A47: $FA $6B $C1
    cp   $04                                      ; $5A4A: $FE $04
    jr   nz, jr_018_5A7F                          ; $5A4C: $20 $31

    inc  [hl]                                     ; $5A4E: $34
    call GetEntityTransitionCountdown             ; $5A4F: $CD $05 $0C
    ld   [hl], $70                                ; $5A52: $36 $70
    ld   a, $10                                   ; $5A54: $3E $10
    ld   [wWorldMusicTrack], a                    ; $5A56: $EA $68 $D3
    ld   a, $FF                                   ; $5A59: $3E $FF
    ldh  [hNextWorldMusicTrack], a                ; $5A5B: $E0 $BF
    ldh  a, [hLinkPositionX]                      ; $5A5D: $F0 $98
    ld   hl, $D155                                ; $5A5F: $21 $55 $D1
    call func_018_5A79                            ; $5A62: $CD $79 $5A
    ldh  a, [hLinkPositionY]                      ; $5A65: $F0 $99
    ld   hl, $D175                                ; $5A67: $21 $75 $D1
    call func_018_5A79                            ; $5A6A: $CD $79 $5A
    xor  a                                        ; $5A6D: $AF
    ld   hl, $D195                                ; $5A6E: $21 $95 $D1
    call func_018_5A79                            ; $5A71: $CD $79 $5A
    ldh  a, [hLinkDirection]                      ; $5A74: $F0 $9E
    ld   hl, $D1B5                                ; $5A76: $21 $B5 $D1

func_018_5A79:
    ld   e, $10                                   ; $5A79: $1E $10

jr_018_5A7B:
    ld   [hl+], a                                 ; $5A7B: $22
    dec  e                                        ; $5A7C: $1D
    jr   nz, jr_018_5A7B                          ; $5A7D: $20 $FC

jr_018_5A7F:
    ret                                           ; $5A7F: $C9

    ld   [label_808], sp                          ; $5A80: $08 $08 $08
    add  hl, bc                                   ; $5A83: $09
    ld   a, [bc]                                  ; $5A84: $0A
    ld   a, [bc]                                  ; $5A85: $0A
    ld   a, [bc]                                  ; $5A86: $0A
    add  hl, bc                                   ; $5A87: $09
    ld   [$06F8], sp                              ; $5A88: $08 $F8 $06
    ld   bc, $C8FA                                ; $5A8B: $01 $FA $C8
    jp   $28A7                                    ; $5A8E: $C3 $A7 $28

    ld   d, l                                     ; $5A91: $55
    ldh  a, [hFrameCounter]                       ; $5A92: $F0 $E7
    rra                                           ; $5A94: $1F
    rra                                           ; $5A95: $1F
    rra                                           ; $5A96: $1F
    rra                                           ; $5A97: $1F
    and  $07                                      ; $5A98: $E6 $07
    ld   e, a                                     ; $5A9A: $5F
    ld   d, b                                     ; $5A9B: $50
    ld   hl, $5A80                                ; $5A9C: $21 $80 $5A
    add  hl, de                                   ; $5A9F: $19
    ld   a, [hl]                                  ; $5AA0: $7E
    ldh  [hActiveEntityUnknownG], a               ; $5AA1: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $5AA3: $F0 $E7
    and  $1F                                      ; $5AA5: $E6 $1F
    jr   nz, jr_018_5AE7                          ; $5AA7: $20 $3E

    ld   a, $C9                                   ; $5AA9: $3E $C9
    call label_3B86                               ; $5AAB: $CD $86 $3B
    jr   c, jr_018_5AE7                           ; $5AAE: $38 $37

    ldh  a, [hScratchB]                           ; $5AB0: $F0 $D8
    ld   hl, wEntity0PosY                         ; $5AB2: $21 $10 $C2
    add  hl, de                                   ; $5AB5: $19
    sub  $08                                      ; $5AB6: $D6 $08
    ld   [hl], a                                  ; $5AB8: $77
    push bc                                       ; $5AB9: $C5
    ldh  a, [hFrameCounter]                       ; $5ABA: $F0 $E7
    rra                                           ; $5ABC: $1F
    rra                                           ; $5ABD: $1F
    rra                                           ; $5ABE: $1F
    rra                                           ; $5ABF: $1F
    rra                                           ; $5AC0: $1F
    and  $01                                      ; $5AC1: $E6 $01
    ld   c, a                                     ; $5AC3: $4F
    ld   hl, $5A88                                ; $5AC4: $21 $88 $5A
    add  hl, bc                                   ; $5AC7: $09
    ldh  a, [hScratchA]                           ; $5AC8: $F0 $D7
    add  [hl]                                     ; $5ACA: $86
    ld   hl, wEntity0PosX                         ; $5ACB: $21 $00 $C2
    add  hl, de                                   ; $5ACE: $19
    ld   [hl], a                                  ; $5ACF: $77
    ld   hl, $5A8A                                ; $5AD0: $21 $8A $5A
    add  hl, bc                                   ; $5AD3: $09
    ld   a, [hl]                                  ; $5AD4: $7E
    ld   hl, wEntity0SpeedX                       ; $5AD5: $21 $40 $C2
    add  hl, de                                   ; $5AD8: $19
    ld   [hl], a                                  ; $5AD9: $77
    ld   hl, wEntity0SpeedY                       ; $5ADA: $21 $50 $C2
    add  hl, de                                   ; $5ADD: $19
    ld   [hl], $FC                                ; $5ADE: $36 $FC
    ld   hl, $C3D0                                ; $5AE0: $21 $D0 $C3
    add  hl, de                                   ; $5AE3: $19
    ld   [hl], $40                                ; $5AE4: $36 $40
    pop  bc                                       ; $5AE6: $C1

jr_018_5AE7:
    ld   de, $59B8                                ; $5AE7: $11 $B8 $59
    call label_3BC0                               ; $5AEA: $CD $C0 $3B
    ld   a, [wInventoryAppearing]                 ; $5AED: $FA $4F $C1
    and  a                                        ; $5AF0: $A7
    ret  nz                                       ; $5AF1: $C0

    ld   hl, $C480                                ; $5AF2: $21 $80 $C4
    add  hl, bc                                   ; $5AF5: $09
    ld   a, [hl]                                  ; $5AF6: $7E
    and  a                                        ; $5AF7: $A7
    jr   z, jr_018_5B03                           ; $5AF8: $28 $09

    dec  a                                        ; $5AFA: $3D
    jr   nz, jr_018_5B03                          ; $5AFB: $20 $06

    dec  [hl]                                     ; $5AFD: $35
    ld   a, $7A                                   ; $5AFE: $3E $7A
    call OpenDialogInTable2                       ; $5B00: $CD $7C $23

jr_018_5B03:
    ld   hl, wEntitiesUnknowTableG                ; $5B03: $21 $00 $C3
    add  hl, bc                                   ; $5B06: $09
    ld   a, [wTransitionSequenceCounter]          ; $5B07: $FA $6B $C1
    cp   $04                                      ; $5B0A: $FE $04
    jr   z, jr_018_5B13                           ; $5B0C: $28 $05

    ld   a, [hl]                                  ; $5B0E: $7E
    and  a                                        ; $5B0F: $A7
    jr   z, jr_018_5B13                           ; $5B10: $28 $01

    dec  [hl]                                     ; $5B12: $35

jr_018_5B13:
    ld   a, [hl]                                  ; $5B13: $7E
    and  a                                        ; $5B14: $A7
    jr   z, jr_018_5B6A                           ; $5B15: $28 $53

    cp   $30                                      ; $5B17: $FE $30
    jr   nz, jr_018_5B55                          ; $5B19: $20 $3A

    xor  a                                        ; $5B1B: $AF
    ld   [wC167], a                               ; $5B1C: $EA $67 $C1
    ldh  a, [hLinkPositionX]                      ; $5B1F: $F0 $98
    sub  $58                                      ; $5B21: $D6 $58
    add  $03                                      ; $5B23: $C6 $03
    cp   $06                                      ; $5B25: $FE $06
    jr   nc, jr_018_5B33                          ; $5B27: $30 $0A

    ldh  a, [hLinkPositionY]                      ; $5B29: $F0 $99
    sub  $50                                      ; $5B2B: $D6 $50
    add  $03                                      ; $5B2D: $C6 $03
    cp   $06                                      ; $5B2F: $FE $06
    jr   c, jr_018_5B3B                           ; $5B31: $38 $08

jr_018_5B33:
    ld   [hl], b                                  ; $5B33: $70
    ld   hl, $C480                                ; $5B34: $21 $80 $C4
    add  hl, bc                                   ; $5B37: $09
    ld   [hl], $1C                                ; $5B38: $36 $1C
    ret                                           ; $5B3A: $C9

jr_018_5B3B:
    ld   hl, hJingle                              ; $5B3B: $21 $F2 $FF
    ld   [hl], $0B                                ; $5B3E: $36 $0B
    ld   hl, hWaveSfx                             ; $5B40: $21 $F3 $FF
    ld   [hl], $03                                ; $5B43: $36 $03
    ld   hl, $C157                                ; $5B45: $21 $57 $C1
    ld   [hl], $18                                ; $5B48: $36 $18
    ld   hl, $C158                                ; $5B4A: $21 $58 $C1
    ld   [hl], $04                                ; $5B4D: $36 $04
    ld   hl, hLinkPositionX                       ; $5B4F: $21 $98 $FF
    inc  [hl]                                     ; $5B52: $34
    jr   jr_018_5B61                              ; $5B53: $18 $0C

jr_018_5B55:
    jr   nc, jr_018_5B6A                          ; $5B55: $30 $13

    cp   $10                                      ; $5B57: $FE $10
    jr   nz, jr_018_5B61                          ; $5B59: $20 $06

    dec  [hl]                                     ; $5B5B: $35
    ld   a, $7B                                   ; $5B5C: $3E $7B
    call OpenDialogInTable2                       ; $5B5E: $CD $7C $23

jr_018_5B61:
    ld   a, $02                                   ; $5B61: $3E $02
    ldh  [$FFA1], a                               ; $5B63: $E0 $A1
    ld   a, $6A                                   ; $5B65: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $5B67: $E0 $9D
    ret                                           ; $5B69: $C9

jr_018_5B6A:
    ld   a, [$DB74]                               ; $5B6A: $FA $74 $DB
    ld   hl, wLoadPreviousMapCountdown            ; $5B6D: $21 $BC $C1
    or   [hl]                                     ; $5B70: $B6
    ret  nz                                       ; $5B71: $C0

    ld   a, [$DB10]                               ; $5B72: $FA $10 $DB
    and  a                                        ; $5B75: $A7
    jp   z, label_018_5C6A                        ; $5B76: $CA $6A $5C

    call label_3B23                               ; $5B79: $CD $23 $3B
    ld   a, $02                                   ; $5B7C: $3E $02
    ldh  [$FFA1], a                               ; $5B7E: $E0 $A1
    ld   [wC167], a                               ; $5B80: $EA $67 $C1
    call func_018_7DE8                            ; $5B83: $CD $E8 $7D
    ld   a, [$D468]                               ; $5B86: $FA $68 $D4
    and  a                                        ; $5B89: $A7
    jr   z, jr_018_5B90                           ; $5B8A: $28 $04

    dec  a                                        ; $5B8C: $3D
    ld   [$D468], a                               ; $5B8D: $EA $68 $D4

jr_018_5B90:
    ldh  a, [hActiveEntityWalking]                ; $5B90: $F0 $F0
    rst  $00                                      ; $5B92: $C7
    sbc  l                                        ; $5B93: $9D
    ld   e, e                                     ; $5B94: $5B
    or   h                                        ; $5B95: $B4
    ld   e, e                                     ; $5B96: $5B
    ret  nc                                       ; $5B97: $D0

    ld   e, e                                     ; $5B98: $5B
    rlca                                          ; $5B99: $07
    ld   e, h                                     ; $5B9A: $5C
    add  hl, sp                                   ; $5B9B: $39
    ld   e, h                                     ; $5B9C: $5C
    ld   a, [wLinkMotionState]                    ; $5B9D: $FA $1C $C1
    cp   $03                                      ; $5BA0: $FE $03
    ret  z                                        ; $5BA2: $C8

    ld   a, $40                                   ; $5BA3: $3E $40
    ld   [$D468], a                               ; $5BA5: $EA $68 $D4
    ld   a, $0F                                   ; $5BA8: $3E $0F
    ldh  [hFFA5], a                               ; $5BAA: $E0 $A5
    ld   a, $01                                   ; $5BAC: $3E $01
    call label_3B0C                               ; $5BAE: $CD $0C $3B
    jp   IncrementEntityWalkingAttr               ; $5BB1: $C3 $12 $3B

    ld   a, [$D468]                               ; $5BB4: $FA $68 $D4
    and  a                                        ; $5BB7: $A7
    ret  nz                                       ; $5BB8: $C0

    ld   a, $18                                   ; $5BB9: $3E $18
    ld   [$D468], a                               ; $5BBB: $EA $68 $D4
    ld   hl, $C380                                ; $5BBE: $21 $80 $C3
    add  hl, bc                                   ; $5BC1: $09
    ld   [hl], $01                                ; $5BC2: $36 $01
    ld   a, $04                                   ; $5BC4: $3E $04
    call label_3B0C                               ; $5BC6: $CD $0C $3B
    ld   a, $10                                   ; $5BC9: $3E $10
    ldh  [hFFA5], a                               ; $5BCB: $E0 $A5
    jp   IncrementEntityWalkingAttr               ; $5BCD: $C3 $12 $3B

    ld   a, [$D468]                               ; $5BD0: $FA $68 $D4
    and  a                                        ; $5BD3: $A7
    ret  nz                                       ; $5BD4: $C0

    ld   hl, wEntity0SpeedX                       ; $5BD5: $21 $40 $C2
    add  hl, bc                                   ; $5BD8: $09
    ld   [hl], $F4                                ; $5BD9: $36 $F4
    call func_018_7E6C                            ; $5BDB: $CD $6C $7E
    ldh  a, [hFrameCounter]                       ; $5BDE: $F0 $E7
    and  $08                                      ; $5BE0: $E6 $08
    ld   e, $04                                   ; $5BE2: $1E $04
    jr   z, jr_018_5BE7                           ; $5BE4: $28 $01

    inc  e                                        ; $5BE6: $1C

jr_018_5BE7:
    ld   a, e                                     ; $5BE7: $7B
    call label_3B0C                               ; $5BE8: $CD $0C $3B
    call func_018_7EB2                            ; $5BEB: $CD $B2 $7E
    add  $02                                      ; $5BEE: $C6 $02
    cp   $04                                      ; $5BF0: $FE $04
    ret  nc                                       ; $5BF2: $D0

    ld   hl, wEntitiesUnknownTableG               ; $5BF3: $21 $B0 $C3
    add  hl, bc                                   ; $5BF6: $09
    ld   [hl], $02                                ; $5BF7: $36 $02
    ld   hl, $C380                                ; $5BF9: $21 $80 $C3
    add  hl, bc                                   ; $5BFC: $09
    ld   [hl], $02                                ; $5BFD: $36 $02
    ld   a, $10                                   ; $5BFF: $3E $10
    ld   [$D468], a                               ; $5C01: $EA $68 $D4
    jp   IncrementEntityWalkingAttr               ; $5C04: $C3 $12 $3B

    ld   a, [$D468]                               ; $5C07: $FA $68 $D4
    and  a                                        ; $5C0A: $A7
    ret  nz                                       ; $5C0B: $C0

    ld   a, [$DB10]                               ; $5C0C: $FA $10 $DB
    dec  a                                        ; $5C0F: $3D
    ld   e, a                                     ; $5C10: $5F
    ld   a, [wC163]                               ; $5C11: $FA $63 $C1
    cp   e                                        ; $5C14: $BB
    jr   z, jr_018_5C27                           ; $5C15: $28 $10

    and  a                                        ; $5C17: $A7
    jr   z, jr_018_5C27                           ; $5C18: $28 $0D

    ld   e, $1C                                   ; $5C1A: $1E $1C
    call GetRandomByte                            ; $5C1C: $CD $0D $28
    and  $3F                                      ; $5C1F: $E6 $3F
    jr   nz, jr_018_5C32                          ; $5C21: $20 $0F

    ld   e, $1E                                   ; $5C23: $1E $1E
    jr   jr_018_5C32                              ; $5C25: $18 $0B

jr_018_5C27:
    ld   e, $1B                                   ; $5C27: $1E $1B
    ld   a, [$DB47]                               ; $5C29: $FA $47 $DB
    cp   $80                                      ; $5C2C: $FE $80
    jr   nc, jr_018_5C32                          ; $5C2E: $30 $02

    ld   e, $1D                                   ; $5C30: $1E $1D

jr_018_5C32:
    ld   a, e                                     ; $5C32: $7B
    call OpenDialogInTable2                       ; $5C33: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $5C36: $C3 $12 $3B

    xor  a                                        ; $5C39: $AF
    ld   [$DB10], a                               ; $5C3A: $EA $10 $DB
    ld   [wC167], a                               ; $5C3D: $EA $67 $C1
    call IncrementEntityWalkingAttr               ; $5C40: $CD $12 $3B
    ld   [hl], b                                  ; $5C43: $70
    ld   hl, $C3D0                                ; $5C44: $21 $D0 $C3
    add  hl, bc                                   ; $5C47: $09
    ld   [hl], $FF                                ; $5C48: $36 $FF
    ldh  a, [wActiveEntityPosX]                   ; $5C4A: $F0 $EE
    ld   hl, $D155                                ; $5C4C: $21 $55 $D1
    call func_018_5C63                            ; $5C4F: $CD $63 $5C
    ld   hl, $D175                                ; $5C52: $21 $75 $D1
    ldh  a, [wActiveEntityPosY]                   ; $5C55: $F0 $EC
    ld   e, $10                                   ; $5C57: $1E $10

jr_018_5C59:
    ld   [hl+], a                                 ; $5C59: $22
    dec  a                                        ; $5C5A: $3D
    dec  e                                        ; $5C5B: $1D
    jr   nz, jr_018_5C59                          ; $5C5C: $20 $FB

    ld   a, $02                                   ; $5C5E: $3E $02
    ld   hl, $D1B5                                ; $5C60: $21 $B5 $D1

func_018_5C63:
    ld   e, $10                                   ; $5C63: $1E $10

jr_018_5C65:
    ld   [hl+], a                                 ; $5C65: $22
    dec  e                                        ; $5C66: $1D
    jr   nz, jr_018_5C65                          ; $5C67: $20 $FC

    ret                                           ; $5C69: $C9

label_018_5C6A:
    ld   a, [wTransitionSequenceCounter]          ; $5C6A: $FA $6B $C1
    cp   $04                                      ; $5C6D: $FE $04
    ret  nz                                       ; $5C6F: $C0

    ldh  a, [hMapRoom]                            ; $5C70: $F0 $F6
    ld   hl, $C3E0                                ; $5C72: $21 $E0 $C3
    add  hl, bc                                   ; $5C75: $09
    ld   [hl], a                                  ; $5C76: $77
    ld   hl, $C220                                ; $5C77: $21 $20 $C2
    add  hl, bc                                   ; $5C7A: $09
    ld   [hl], b                                  ; $5C7B: $70
    ld   hl, $C230                                ; $5C7C: $21 $30 $C2
    add  hl, bc                                   ; $5C7F: $09
    ld   [hl], b                                  ; $5C80: $70
    ld   hl, $C380                                ; $5C81: $21 $80 $C3
    add  hl, bc                                   ; $5C84: $09
    ld   e, [hl]                                  ; $5C85: $5E
    ld   d, b                                     ; $5C86: $50
    ld   hl, $59E4                                ; $5C87: $21 $E4 $59
    add  hl, de                                   ; $5C8A: $19
    push hl                                       ; $5C8B: $E5
    ld   a, [wC120]                               ; $5C8C: $FA $20 $C1
    rra                                           ; $5C8F: $1F
    rra                                           ; $5C90: $1F
    rra                                           ; $5C91: $1F
    pop  hl                                       ; $5C92: $E1
    and  $01                                      ; $5C93: $E6 $01
    or   [hl]                                     ; $5C95: $B6
    call label_3B0C                               ; $5C96: $CD $0C $3B
    ld   hl, $C3D0                                ; $5C99: $21 $D0 $C3
    add  hl, bc                                   ; $5C9C: $09
    ld   a, [hl]                                  ; $5C9D: $7E
    ldh  [hFFE8], a                               ; $5C9E: $E0 $E8
    and  $0F                                      ; $5CA0: $E6 $0F
    ld   e, a                                     ; $5CA2: $5F
    ld   d, b                                     ; $5CA3: $50
    ld   hl, $D155                                ; $5CA4: $21 $55 $D1
    add  hl, de                                   ; $5CA7: $19
    ldh  a, [hLinkFinalPositionX]                 ; $5CA8: $F0 $9F
    ld   [hl], a                                  ; $5CAA: $77
    ldh  a, [hLinkFinalPositionY]                 ; $5CAB: $F0 $A0
    ld   hl, $C13B                                ; $5CAD: $21 $3B $C1
    add  [hl]                                     ; $5CB0: $86
    ld   hl, $D175                                ; $5CB1: $21 $75 $D1
    add  hl, de                                   ; $5CB4: $19
    ld   [hl], a                                  ; $5CB5: $77
    ld   hl, $D1B5                                ; $5CB6: $21 $B5 $D1
    add  hl, de                                   ; $5CB9: $19
    ldh  a, [hLinkDirection]                      ; $5CBA: $F0 $9E
    ld   [hl], a                                  ; $5CBC: $77
    ld   hl, wEntitiesUnknownTableB               ; $5CBD: $21 $B0 $C2
    add  hl, bc                                   ; $5CC0: $09
    ld   a, [hl]                                  ; $5CC1: $7E
    ldh  [hDungeonFloorTile], a                   ; $5CC2: $E0 $E9
    and  $0F                                      ; $5CC4: $E6 $0F
    ld   e, a                                     ; $5CC6: $5F
    ld   d, b                                     ; $5CC7: $50
    ld   hl, $D195                                ; $5CC8: $21 $95 $D1
    add  hl, de                                   ; $5CCB: $19
    ldh  a, [$FFA2]                               ; $5CCC: $F0 $A2
    ld   [hl], a                                  ; $5CCE: $77
    ld   a, [wLinkMotionState]                    ; $5CCF: $FA $1C $C1
    cp   $02                                      ; $5CD2: $FE $02
    jr   z, jr_018_5CEA                           ; $5CD4: $28 $14

    ld   a, [wRoomTransitionState]                ; $5CD6: $FA $24 $C1
    and  a                                        ; $5CD9: $A7
    jr   nz, jr_018_5CEA                          ; $5CDA: $20 $0E

    ld   a, [wDialogState]                        ; $5CDC: $FA $9F $C1
    and  a                                        ; $5CDF: $A7
    jr   nz, jr_018_5CEF                          ; $5CE0: $20 $0D

    ld   hl, hLinkPositionXIncrement              ; $5CE2: $21 $9A $FF
    ldh  a, [hLinkPositionYIncrement]             ; $5CE5: $F0 $9B
    or   [hl]                                     ; $5CE7: $B6
    jr   z, jr_018_5CEF                           ; $5CE8: $28 $05

jr_018_5CEA:
    ld   hl, $C3D0                                ; $5CEA: $21 $D0 $C3
    add  hl, bc                                   ; $5CED: $09
    inc  [hl]                                     ; $5CEE: $34

jr_018_5CEF:
    ld   hl, wEntitiesUnknownTableB               ; $5CEF: $21 $B0 $C2
    add  hl, bc                                   ; $5CF2: $09
    inc  [hl]                                     ; $5CF3: $34
    ldh  a, [hFFE8]                               ; $5CF4: $F0 $E8
    inc  a                                        ; $5CF6: $3C
    and  $0F                                      ; $5CF7: $E6 $0F
    ld   e, a                                     ; $5CF9: $5F
    ld   d, b                                     ; $5CFA: $50
    ld   hl, $D155                                ; $5CFB: $21 $55 $D1
    add  hl, de                                   ; $5CFE: $19
    ld   a, [hl]                                  ; $5CFF: $7E
    ld   hl, wEntity0PosX                         ; $5D00: $21 $00 $C2
    add  hl, bc                                   ; $5D03: $09
    ld   [hl], a                                  ; $5D04: $77
    ld   hl, $D175                                ; $5D05: $21 $75 $D1
    add  hl, de                                   ; $5D08: $19
    ld   a, [hl]                                  ; $5D09: $7E
    ld   hl, wEntity0PosY                         ; $5D0A: $21 $10 $C2
    add  hl, bc                                   ; $5D0D: $09
    ld   [hl], a                                  ; $5D0E: $77
    ld   hl, $D1B5                                ; $5D0F: $21 $B5 $D1
    add  hl, de                                   ; $5D12: $19
    ld   a, [hl]                                  ; $5D13: $7E
    ld   hl, $C380                                ; $5D14: $21 $80 $C3
    add  hl, bc                                   ; $5D17: $09
    ld   [hl], a                                  ; $5D18: $77
    ldh  a, [hDungeonFloorTile]                   ; $5D19: $F0 $E9
    inc  a                                        ; $5D1B: $3C
    and  $0F                                      ; $5D1C: $E6 $0F
    ld   e, a                                     ; $5D1E: $5F
    ld   d, b                                     ; $5D1F: $50
    ld   hl, wEntitiesPosZTable                   ; $5D20: $21 $10 $C3
    add  hl, bc                                   ; $5D23: $09
    ld   a, [hl]                                  ; $5D24: $7E
    push af                                       ; $5D25: $F5
    ld   hl, $D195                                ; $5D26: $21 $95 $D1
    add  hl, de                                   ; $5D29: $19
    ld   e, [hl]                                  ; $5D2A: $5E
    ld   hl, wEntitiesPosZTable                   ; $5D2B: $21 $10 $C3
    add  hl, bc                                   ; $5D2E: $09
    ld   [hl], e                                  ; $5D2F: $73
    call IsEntityUnknownFZero                     ; $5D30: $CD $00 $0C
    ld   hl, wRoomTransitionState                 ; $5D33: $21 $24 $C1
    or   [hl]                                     ; $5D36: $B6
    jr   nz, jr_018_5D7D                          ; $5D37: $20 $44

    pop  af                                       ; $5D39: $F1
    cp   e                                        ; $5D3A: $BB
    jr   z, jr_018_5D7A                           ; $5D3B: $28 $3D

    and  a                                        ; $5D3D: $A7
    jr   z, jr_018_5D6F                           ; $5D3E: $28 $2F

    ld   a, e                                     ; $5D40: $7B
    and  a                                        ; $5D41: $A7
    jr   nz, jr_018_5D7A                          ; $5D42: $20 $36

    call label_3B23                               ; $5D44: $CD $23 $3B
    ld   hl, wEntity0State                        ; $5D47: $21 $80 $C2
    add  hl, bc                                   ; $5D4A: $09
    ld   a, [hl]                                  ; $5D4B: $7E
    cp   $02                                      ; $5D4C: $FE $02
    ret  z                                        ; $5D4E: $C8

    ld   hl, $C470                                ; $5D4F: $21 $70 $C4
    add  hl, bc                                   ; $5D52: $09
    ld   a, [hl]                                  ; $5D53: $7E
    dec  a                                        ; $5D54: $3D
    cp   $02                                      ; $5D55: $FE $02
    jr   c, jr_018_5D5E                           ; $5D57: $38 $05

    ld   a, $07                                   ; $5D59: $3E $07
    ldh  [hNoiseSfx], a                           ; $5D5B: $E0 $F4
    ret                                           ; $5D5D: $C9

jr_018_5D5E:
    ldh  a, [wActiveEntityPosY]                   ; $5D5E: $F0 $EC
    ldh  [hScratchB], a                           ; $5D60: $E0 $D8
    ldh  a, [wActiveEntityPosX]                   ; $5D62: $F0 $EE
    ldh  [hScratchA], a                           ; $5D64: $E0 $D7
    ld   a, $0E                                   ; $5D66: $3E $0E
    ldh  [hJingle], a                             ; $5D68: $E0 $F2
    ld   a, $0C                                   ; $5D6A: $3E $0C
    jp   label_CC7                                ; $5D6C: $C3 $C7 $0C

jr_018_5D6F:
    ld   a, e                                     ; $5D6F: $7B
    cp   $08                                      ; $5D70: $FE $08
    ld   a, $08                                   ; $5D72: $3E $08
    jr   nc, jr_018_5D78                          ; $5D74: $30 $02

    ld   a, $24                                   ; $5D76: $3E $24

jr_018_5D78:
    ldh  [hJingle], a                             ; $5D78: $E0 $F2

jr_018_5D7A:
    jp   label_3B23                               ; $5D7A: $C3 $23 $3B

jr_018_5D7D:
    pop  af                                       ; $5D7D: $F1
    ret                                           ; $5D7E: $C9

    nop                                           ; $5D7F: $00
    ld   bc, $00FF                                ; $5D80: $01 $FF $00
    db   $10                                      ; $5D83: $10
    ldh  a, [hSwordIntersectedAreaY]              ; $5D84: $F0 $CD
    add  sp, $7D                                  ; $5D86: $E8 $7D
    ld   a, $01                                   ; $5D88: $3E $01
    ldh  [hAnimatedTilesGroup], a                 ; $5D8A: $E0 $A4
    inc  a                                        ; $5D8C: $3C
    ldh  [$FFA1], a                               ; $5D8D: $E0 $A1
    ld   [wC167], a                               ; $5D8F: $EA $67 $C1
    ldh  a, [hFFCC]                               ; $5D92: $F0 $CC
    and  $03                                      ; $5D94: $E6 $03
    ld   e, a                                     ; $5D96: $5F
    ld   d, b                                     ; $5D97: $50
    ld   hl, $5D7F                                ; $5D98: $21 $7F $5D
    add  hl, de                                   ; $5D9B: $19
    ld   a, [wC109]                               ; $5D9C: $FA $09 $C1
    push af                                       ; $5D9F: $F5
    add  [hl]                                     ; $5DA0: $86
    and  $0F                                      ; $5DA1: $E6 $0F
    ld   e, a                                     ; $5DA3: $5F
    pop  af                                       ; $5DA4: $F1
    and  $F0                                      ; $5DA5: $E6 $F0
    or   e                                        ; $5DA7: $B3
    ld   [wC109], a                               ; $5DA8: $EA $09 $C1
    ldh  a, [hFFCC]                               ; $5DAB: $F0 $CC
    rra                                           ; $5DAD: $1F
    rra                                           ; $5DAE: $1F
    and  $03                                      ; $5DAF: $E6 $03
    ld   e, a                                     ; $5DB1: $5F
    ld   d, b                                     ; $5DB2: $50
    ld   hl, $5D82                                ; $5DB3: $21 $82 $5D
    add  hl, de                                   ; $5DB6: $19
    ld   a, [wC109]                               ; $5DB7: $FA $09 $C1
    add  [hl]                                     ; $5DBA: $86
    ld   [wC109], a                               ; $5DBB: $EA $09 $C1
    ld   a, [wDialogState]                        ; $5DBE: $FA $9F $C1
    and  a                                        ; $5DC1: $A7
    jr   nz, jr_018_5DDC                          ; $5DC2: $20 $18

    ldh  a, [hFFCC]                               ; $5DC4: $F0 $CC
    and  $10                                      ; $5DC6: $E6 $10
    jr   z, jr_018_5DD0                           ; $5DC8: $28 $06

    ld   a, [wC109]                               ; $5DCA: $FA $09 $C1
    jp   OpenDialog                               ; $5DCD: $C3 $85 $23

jr_018_5DD0:
    ldh  a, [hFFCC]                               ; $5DD0: $F0 $CC
    and  $20                                      ; $5DD2: $E6 $20
    jr   z, jr_018_5DDC                           ; $5DD4: $28 $06

    ld   a, [wC109]                               ; $5DD6: $FA $09 $C1
    jp   OpenDialogInTable1                       ; $5DD9: $C3 $73 $23

jr_018_5DDC:
    ldh  a, [hFFCC]                               ; $5DDC: $F0 $CC
    and  $40                                      ; $5DDE: $E6 $40
    jr   z, jr_018_5DE8                           ; $5DE0: $28 $06

    ld   a, [wC109]                               ; $5DE2: $FA $09 $C1
    jp   OpenDialogInTable2                       ; $5DE5: $C3 $7C $23

jr_018_5DE8:
    ret                                           ; $5DE8: $C9

    call func_018_7DE8                            ; $5DE9: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $5DEC: $F0 $E7
    and  $03                                      ; $5DEE: $E6 $03
    jr   nz, jr_018_5DF6                          ; $5DF0: $20 $04

    ld   hl, wScrollXOffset                       ; $5DF2: $21 $BF $C1
    inc  [hl]                                     ; $5DF5: $34

jr_018_5DF6:
    ret                                           ; $5DF6: $C9

    ld   e, [hl]                                  ; $5DF7: $5E
    ld   bc, $215E                                ; $5DF8: $01 $5E $21
    nop                                           ; $5DFB: $00
    ld   hl, sp+$50                               ; $5DFC: $F8 $50
    ld   b, $00                                   ; $5DFE: $06 $00
    nop                                           ; $5E00: $00
    ld   d, d                                     ; $5E01: $52
    ld   b, $00                                   ; $5E02: $06 $00
    ld   [$0654], sp                              ; $5E04: $08 $54 $06
    nop                                           ; $5E07: $00
    db   $10                                      ; $5E08: $10
    ld   d, [hl]                                  ; $5E09: $56
    ld   b, $00                                   ; $5E0A: $06 $00
    ld   hl, sp+$50                               ; $5E0C: $F8 $50
    inc  bc                                       ; $5E0E: $03
    nop                                           ; $5E0F: $00
    nop                                           ; $5E10: $00
    ld   d, d                                     ; $5E11: $52
    inc  bc                                       ; $5E12: $03
    nop                                           ; $5E13: $00
    ld   [$0354], sp                              ; $5E14: $08 $54 $03
    nop                                           ; $5E17: $00
    db   $10                                      ; $5E18: $10
    ld   d, [hl]                                  ; $5E19: $56
    inc  bc                                       ; $5E1A: $03

label_018_5E1B:
    ld   hl, $5DFB                                ; $5E1B: $21 $FB $5D
    ld   a, [wBGPaletteEffectAddress]             ; $5E1E: $FA $CC $C3
    and  a                                        ; $5E21: $A7
    jr   nz, jr_018_5E27                          ; $5E22: $20 $03

    ld   hl, $5E0B                                ; $5E24: $21 $0B $5E

jr_018_5E27:
    ld   c, $04                                   ; $5E27: $0E $04
    call label_3CE6                               ; $5E29: $CD $E6 $3C
    ld   a, $02                                   ; $5E2C: $3E $02
    call label_3DA0                               ; $5E2E: $CD $A0 $3D
    ldh  a, [hActiveEntityWalking]                ; $5E31: $F0 $F0
    rst  $00                                      ; $5E33: $C7
    ld   a, [hl-]                                 ; $5E34: $3A
    ld   e, [hl]                                  ; $5E35: $5E
    ld   b, e                                     ; $5E36: $43
    ld   e, [hl]                                  ; $5E37: $5E
    ld   e, l                                     ; $5E38: $5D
    ld   e, [hl]                                  ; $5E39: $5E
    ld   hl, wEntity0PosX                         ; $5E3A: $21 $00 $C2
    add  hl, bc                                   ; $5E3D: $09
    ld   [hl], $50                                ; $5E3E: $36 $50
    jp   IncrementEntityWalkingAttr               ; $5E40: $C3 $12 $3B

    call func_018_7DE8                            ; $5E43: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $5E46: $CD $05 $0C
    ret  nz                                       ; $5E49: $C0

    call func_018_7D95                            ; $5E4A: $CD $95 $7D
    ret  nc                                       ; $5E4D: $D0

    ld   a, [wBGPalette]                          ; $5E4E: $FA $97 $DB
    cp   $E4                                      ; $5E51: $FE $E4
    jr   nz, jr_018_5E58                          ; $5E53: $20 $03

    jp   IncrementEntityWalkingAttr               ; $5E55: $C3 $12 $3B

jr_018_5E58:
    ld   a, $E6                                   ; $5E58: $3E $E6
    jp   OpenDialog                               ; $5E5A: $C3 $85 $23

    call func_018_7DE8                            ; $5E5D: $CD $E8 $7D
    ld   a, [wDialogState]                        ; $5E60: $FA $9F $C1
    and  a                                        ; $5E63: $A7
    jr   nz, jr_018_5E79                          ; $5E64: $20 $13

    ld   a, $0A                                   ; $5E66: $3E $0A
    call func_018_4CB0                            ; $5E68: $CD $B0 $4C
    call GetEntityTransitionCountdown             ; $5E6B: $CD $05 $0C
    ld   [hl], $20                                ; $5E6E: $36 $20
    call IncrementEntityWalkingAttr               ; $5E70: $CD $12 $3B
    ld   [hl], b                                  ; $5E73: $70
    ld   hl, $D8AC                                ; $5E74: $21 $AC $D8
    set  4, [hl]                                  ; $5E77: $CB $E6

jr_018_5E79:
    ret                                           ; $5E79: $C9

    ldh  a, [hMapId]                              ; $5E7A: $F0 $F7
    cp   $16                                      ; $5E7C: $FE $16
    jp   z, label_018_5E1B                        ; $5E7E: $CA $1B $5E

    ldh  a, [wActiveEntityPosY]                   ; $5E81: $F0 $EC
    add  $01                                      ; $5E83: $C6 $01
    ldh  [wActiveEntityPosY], a                   ; $5E85: $E0 $EC
    ld   de, $5DF7                                ; $5E87: $11 $F7 $5D
    call label_3BC0                               ; $5E8A: $CD $C0 $3B
    call func_018_7D36                            ; $5E8D: $CD $36 $7D
    call func_018_7DE8                            ; $5E90: $CD $E8 $7D
    call func_018_7D95                            ; $5E93: $CD $95 $7D
    ret  nc                                       ; $5E96: $D0

    ld   a, [wHasDungeonStoneSlab]                ; $5E97: $FA $CE $DB
    and  a                                        ; $5E9A: $A7
    ld   a, $10                                   ; $5E9B: $3E $10
    jr   nz, jr_018_5EA2                          ; $5E9D: $20 $03

    jp   OpenDialogInTable1                       ; $5E9F: $C3 $73 $23

jr_018_5EA2:
    ldh  a, [hMapId]                              ; $5EA2: $F0 $F7
    cp   $FF                                      ; $5EA4: $FE $FF
    jr   nz, jr_018_5EAD                          ; $5EA6: $20 $05

    ld   a, $63                                   ; $5EA8: $3E $63
    jp   OpenDialogInTable2                       ; $5EAA: $C3 $7C $23

jr_018_5EAD:
    ld   a, $18                                   ; $5EAD: $3E $18
    call label_AEA                                ; $5EAF: $CD $EA $0A
    ldh  a, [hScratchA]                           ; $5EB2: $F0 $D7
    jp   OpenDialogInTable2                       ; $5EB4: $C3 $7C $23

    ld   h, b                                     ; $5EB7: $60
    ld   bc, $0162                                ; $5EB8: $01 $62 $01
    ld   h, d                                     ; $5EBB: $62
    ld   hl, $2160                                ; $5EBC: $21 $60 $21
    ld   h, h                                     ; $5EBF: $64
    ld   bc, $0166                                ; $5EC0: $01 $66 $01
    ld   h, [hl]                                  ; $5EC3: $66
    ld   hl, $2164                                ; $5EC4: $21 $64 $21
    ld   l, b                                     ; $5EC7: $68
    ld   bc, $016A                                ; $5EC8: $01 $6A $01
    ld   l, h                                     ; $5ECB: $6C
    ld   bc, Start.notGBC                         ; $5ECC: $01 $6E $01
    ld   l, d                                     ; $5ECF: $6A
    ld   hl, $2168                                ; $5ED0: $21 $68 $21
    ld   l, [hl]                                  ; $5ED3: $6E
    ld   hl, $216C                                ; $5ED4: $21 $6C $21
    ld   a, [wHasInstrument7]                     ; $5ED7: $FA $6B $DB
    and  $02                                      ; $5EDA: $E6 $02
    jp   z, label_018_7F08                        ; $5EDC: $CA $08 $7F

    ld   a, [wIsRoosterFollowingLink]             ; $5EDF: $FA $7B $DB
    and  a                                        ; $5EE2: $A7
    jp   nz, label_018_7F08                       ; $5EE3: $C2 $08 $7F

    ldh  a, [hRoomStatus]                         ; $5EE6: $F0 $F8
    and  $10                                      ; $5EE8: $E6 $10
    jp   nz, label_018_7F08                       ; $5EEA: $C2 $08 $7F

    ld   hl, wEntitiesUnknownTableC               ; $5EED: $21 $C0 $C2
    add  hl, bc                                   ; $5EF0: $09
    ld   a, [hl]                                  ; $5EF1: $7E
    and  a                                        ; $5EF2: $A7
    jp   nz, label_018_60F5                       ; $5EF3: $C2 $F5 $60

    ld   a, c                                     ; $5EF6: $79
    ld   [$C50F], a                               ; $5EF7: $EA $0F $C5
    ld   de, $5EB7                                ; $5EFA: $11 $B7 $5E
    call label_3BC0                               ; $5EFD: $CD $C0 $3B
    call func_018_7D60                            ; $5F00: $CD $60 $7D
    call func_018_7E98                            ; $5F03: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5F06: $21 $20 $C3
    add  hl, bc                                   ; $5F09: $09
    dec  [hl]                                     ; $5F0A: $35
    dec  [hl]                                     ; $5F0B: $35
    ld   hl, wEntitiesPosZTable                   ; $5F0C: $21 $10 $C3
    add  hl, bc                                   ; $5F0F: $09
    ld   a, [hl]                                  ; $5F10: $7E
    and  a                                        ; $5F11: $A7
    ldh  [hFFE8], a                               ; $5F12: $E0 $E8
    jr   z, jr_018_5F1A                           ; $5F14: $28 $04

    and  $80                                      ; $5F16: $E6 $80
    jr   z, jr_018_5F20                           ; $5F18: $28 $06

jr_018_5F1A:
    ld   [hl], b                                  ; $5F1A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5F1B: $21 $20 $C3
    add  hl, bc                                   ; $5F1E: $09
    ld   [hl], b                                  ; $5F1F: $70

jr_018_5F20:
    ldh  a, [hActiveEntityWalking]                ; $5F20: $F0 $F0
    rst  $00                                      ; $5F22: $C7
    ld   b, e                                     ; $5F23: $43
    ld   e, a                                     ; $5F24: $5F
    ld   [hl], e                                  ; $5F25: $73
    ld   e, a                                     ; $5F26: $5F
    add  c                                        ; $5F27: $81
    ld   e, a                                     ; $5F28: $5F
    sbc  d                                        ; $5F29: $9A
    ld   e, a                                     ; $5F2A: $5F
    bit  3, a                                     ; $5F2B: $CB $5F
    db   $ED                                      ; $5F2D: $ED
    ld   e, a                                     ; $5F2E: $5F
    rst  $38                                      ; $5F2F: $FF
    ld   e, a                                     ; $5F30: $5F
    ld   d, $60                                   ; $5F31: $16 $60
    inc  l                                        ; $5F33: $2C
    ld   h, b                                     ; $5F34: $60
    ld   c, a                                     ; $5F35: $4F
    ld   h, b                                     ; $5F36: $60
    ld   d, a                                     ; $5F37: $57
    ld   h, b                                     ; $5F38: $60
    ld   [hl], e                                  ; $5F39: $73
    ld   h, b                                     ; $5F3A: $60
    sub  e                                        ; $5F3B: $93
    ld   h, b                                     ; $5F3C: $60

func_018_5F3D:
    ld   hl, $C3D0                                ; $5F3D: $21 $D0 $C3
    add  hl, bc                                   ; $5F40: $09
    ld   [hl], b                                  ; $5F41: $70
    ret                                           ; $5F42: $C9

    call func_018_5F5E                            ; $5F43: $CD $5E $5F
    call func_018_7DE8                            ; $5F46: $CD $E8 $7D
    call func_018_7EB2                            ; $5F49: $CD $B2 $7E
    ld   hl, $C380                                ; $5F4C: $21 $80 $C3
    add  hl, bc                                   ; $5F4F: $09
    ld   [hl], e                                  ; $5F50: $73
    ldh  a, [hLinkPositionX]                      ; $5F51: $F0 $98
    cp   $90                                      ; $5F53: $FE $90
    ret  nc                                       ; $5F55: $D0

    ld   a, $35                                   ; $5F56: $3E $35
    call OpenDialogInTable2                       ; $5F58: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $5F5B: $C3 $12 $3B

func_018_5F5E:
    ldh  a, [hFFE8]                               ; $5F5E: $F0 $E8
    and  a                                        ; $5F60: $A7
    jr   z, jr_018_5F66                           ; $5F61: $28 $03

    and  $80                                      ; $5F63: $E6 $80
    ret  z                                        ; $5F65: $C8

jr_018_5F66:
    ldh  a, [hFrameCounter]                       ; $5F66: $F0 $E7
    and  $3F                                      ; $5F68: $E6 $3F
    jr   nz, jr_018_5F72                          ; $5F6A: $20 $06

    ld   hl, wEntitiesSpeedZTable                 ; $5F6C: $21 $20 $C3
    add  hl, bc                                   ; $5F6F: $09
    ld   [hl], $10                                ; $5F70: $36 $10

jr_018_5F72:
    ret                                           ; $5F72: $C9

    call func_018_5F5E                            ; $5F73: $CD $5E $5F
    call func_018_7DE8                            ; $5F76: $CD $E8 $7D
    ld   a, $36                                   ; $5F79: $3E $36
    call OpenDialogInTable2                       ; $5F7B: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $5F7E: $C3 $12 $3B

    call func_018_5F5E                            ; $5F81: $CD $5E $5F
    call func_018_7DE8                            ; $5F84: $CD $E8 $7D
    call func_018_7EB2                            ; $5F87: $CD $B2 $7E
    add  $08                                      ; $5F8A: $C6 $08
    cp   $10                                      ; $5F8C: $FE $10
    ret  nc                                       ; $5F8E: $D0

    call func_018_7EC2                            ; $5F8F: $CD $C2 $7E
    add  $10                                      ; $5F92: $C6 $10
    cp   $20                                      ; $5F94: $FE $20
    ret  nc                                       ; $5F96: $D0

    jp   IncrementEntityWalkingAttr               ; $5F97: $C3 $12 $3B

    call func_018_5F3D                            ; $5F9A: $CD $3D $5F
    call func_018_7DE8                            ; $5F9D: $CD $E8 $7D
    call func_018_7EB2                            ; $5FA0: $CD $B2 $7E
    ld   hl, $C380                                ; $5FA3: $21 $80 $C3
    add  hl, bc                                   ; $5FA6: $09
    ld   [hl], e                                  ; $5FA7: $73
    ld   a, [$C1A4]                               ; $5FA8: $FA $A4 $C1
    and  a                                        ; $5FAB: $A7
    jr   z, jr_018_5FBF                           ; $5FAC: $28 $11

    ldh  a, [hLinkPositionX]                      ; $5FAE: $F0 $98
    ld   hl, wEntity0PosX                         ; $5FB0: $21 $00 $C2
    add  hl, bc                                   ; $5FB3: $09
    add  $10                                      ; $5FB4: $C6 $10
    ld   [hl], a                                  ; $5FB6: $77
    ldh  a, [hLinkPositionY]                      ; $5FB7: $F0 $99
    ld   hl, wEntity0PosY                         ; $5FB9: $21 $10 $C2
    add  hl, bc                                   ; $5FBC: $09
    ld   [hl], a                                  ; $5FBD: $77
    ret                                           ; $5FBE: $C9

jr_018_5FBF:
    xor  a                                        ; $5FBF: $AF
    ld   [$C19B], a                               ; $5FC0: $EA $9B $C1
    call GetEntityTransitionCountdown             ; $5FC3: $CD $05 $0C
    ld   [hl], $10                                ; $5FC6: $36 $10
    jp   IncrementEntityWalkingAttr               ; $5FC8: $C3 $12 $3B

    call func_018_5F3D                            ; $5FCB: $CD $3D $5F
    call func_018_7DE8                            ; $5FCE: $CD $E8 $7D
    ld   a, $02                                   ; $5FD1: $3E $02
    ldh  [$FFA1], a                               ; $5FD3: $E0 $A1
    ld   [wC167], a                               ; $5FD5: $EA $67 $C1
    ld   a, $00                                   ; $5FD8: $3E $00
    ldh  [hLinkDirection], a                      ; $5FDA: $E0 $9E
    push bc                                       ; $5FDC: $C5
    call $0BF0                                    ; $5FDD: $CD $F0 $0B
    pop  bc                                       ; $5FE0: $C1
    call GetEntityTransitionCountdown             ; $5FE1: $CD $05 $0C
    ret  nz                                       ; $5FE4: $C0

    ld   a, $37                                   ; $5FE5: $3E $37
    call OpenDialogInTable2                       ; $5FE7: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $5FEA: $C3 $12 $3B

    call func_018_5F3D                            ; $5FED: $CD $3D $5F
    call func_018_7DE8                            ; $5FF0: $CD $E8 $7D
    ld   a, $02                                   ; $5FF3: $3E $02
    ldh  [$FFA1], a                               ; $5FF5: $E0 $A1
    ld   a, $38                                   ; $5FF7: $3E $38
    call OpenDialogInTable2                       ; $5FF9: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $5FFC: $C3 $12 $3B

    call func_018_5F3D                            ; $5FFF: $CD $3D $5F
    ld   a, $02                                   ; $6002: $3E $02
    ldh  [$FFA1], a                               ; $6004: $E0 $A1
    call func_018_7DE8                            ; $6006: $CD $E8 $7D
    ld   a, $39                                   ; $6009: $3E $39
    call OpenDialogInTable2                       ; $600B: $CD $7C $23
    ld   hl, wEntitiesUnknownTableB               ; $600E: $21 $B0 $C2
    add  hl, bc                                   ; $6011: $09
    ld   [hl], b                                  ; $6012: $70
    jp   IncrementEntityWalkingAttr               ; $6013: $C3 $12 $3B

    call func_018_5F3D                            ; $6016: $CD $3D $5F
    ld   a, $02                                   ; $6019: $3E $02
    ldh  [$FFA1], a                               ; $601B: $E0 $A1
    call func_018_7DE8                            ; $601D: $CD $E8 $7D
    ld   hl, wEntitiesUnknownTableB               ; $6020: $21 $B0 $C2
    add  hl, bc                                   ; $6023: $09
    inc  [hl]                                     ; $6024: $34
    ld   a, [hl]                                  ; $6025: $7E
    cp   $A0                                      ; $6026: $FE $A0
    ret  nz                                       ; $6028: $C0

    jp   IncrementEntityWalkingAttr               ; $6029: $C3 $12 $3B

    call func_018_5F3D                            ; $602C: $CD $3D $5F
    ld   a, $02                                   ; $602F: $3E $02
    ldh  [$FFA1], a                               ; $6031: $E0 $A1
    call func_018_7DE8                            ; $6033: $CD $E8 $7D
    ld   a, $C2                                   ; $6036: $3E $C2
    call label_3B86                               ; $6038: $CD $86 $3B
    ld   hl, wEntity0PosX                         ; $603B: $21 $00 $C2
    add  hl, de                                   ; $603E: $19
    ld   [hl], $12                                ; $603F: $36 $12
    ld   hl, wEntity0PosY                         ; $6041: $21 $10 $C2
    add  hl, de                                   ; $6044: $19
    ld   [hl], $88                                ; $6045: $36 $88
    ld   hl, wEntitiesUnknownTableC               ; $6047: $21 $C0 $C2
    add  hl, de                                   ; $604A: $19
    inc  [hl]                                     ; $604B: $34
    jp   IncrementEntityWalkingAttr               ; $604C: $C3 $12 $3B

    call func_018_5F3D                            ; $604F: $CD $3D $5F
    ld   a, $02                                   ; $6052: $3E $02
    ldh  [$FFA1], a                               ; $6054: $E0 $A1
    ret                                           ; $6056: $C9

    ld   a, $02                                   ; $6057: $3E $02
    ldh  [$FFA1], a                               ; $6059: $E0 $A1
    ldh  a, [wActiveEntityPosY]                   ; $605B: $F0 $EC
    cp   $3E                                      ; $605D: $FE $3E
    jr   c, jr_018_6064                           ; $605F: $38 $03

    jp   IncrementEntityWalkingAttr               ; $6061: $C3 $12 $3B

jr_018_6064:
    ld   hl, wEntity0SpeedY                       ; $6064: $21 $50 $C2
    add  hl, bc                                   ; $6067: $09
    ld   [hl], $06                                ; $6068: $36 $06
    ld   hl, $C380                                ; $606A: $21 $80 $C3
    add  hl, bc                                   ; $606D: $09
    ld   [hl], $03                                ; $606E: $36 $03
    jp   label_018_7E62                           ; $6070: $C3 $62 $7E

    ld   a, $02                                   ; $6073: $3E $02
    ldh  [$FFA1], a                               ; $6075: $E0 $A1
    ld   hl, wEntity0SpeedX                       ; $6077: $21 $40 $C2
    add  hl, bc                                   ; $607A: $09
    ld   [hl], $FA                                ; $607B: $36 $FA
    ld   hl, $C380                                ; $607D: $21 $80 $C3
    add  hl, bc                                   ; $6080: $09
    ld   [hl], $01                                ; $6081: $36 $01
    call func_018_7E6C                            ; $6083: $CD $6C $7E
    ldh  a, [wActiveEntityPosX]                   ; $6086: $F0 $EE
    cp   $18                                      ; $6088: $FE $18
    ret  nc                                       ; $608A: $D0

    call GetEntityTransitionCountdown             ; $608B: $CD $05 $0C
    ld   [hl], $60                                ; $608E: $36 $60
    jp   IncrementEntityWalkingAttr               ; $6090: $C3 $12 $3B

    ld   a, $02                                   ; $6093: $3E $02
    ldh  [$FFA1], a                               ; $6095: $E0 $A1
    call GetEntityTransitionCountdown             ; $6097: $CD $05 $0C
    jr   z, jr_018_60A3                           ; $609A: $28 $07

    ld   hl, $C380                                ; $609C: $21 $80 $C3
    add  hl, bc                                   ; $609F: $09
    ld   [hl], $02                                ; $60A0: $36 $02
    ret                                           ; $60A2: $C9

jr_018_60A3:
    ld   hl, wEntity0SpeedX                       ; $60A3: $21 $40 $C2
    add  hl, bc                                   ; $60A6: $09
    ld   [hl], $F4                                ; $60A7: $36 $F4
    ld   hl, $C380                                ; $60A9: $21 $80 $C3
    add  hl, bc                                   ; $60AC: $09
    ld   [hl], $01                                ; $60AD: $36 $01
    call func_018_7E6C                            ; $60AF: $CD $6C $7E
    ldh  a, [wActiveEntityPosX]                   ; $60B2: $F0 $EE
    cp   $F0                                      ; $60B4: $FE $F0
    jr   nz, jr_018_60C7                          ; $60B6: $20 $0F

    xor  a                                        ; $60B8: $AF
    ld   [wC167], a                               ; $60B9: $EA $67 $C1
    ld   hl, $D808                                ; $60BC: $21 $08 $D8
    set  4, [hl]                                  ; $60BF: $CB $E6
    ld   a, [hl]                                  ; $60C1: $7E
    ldh  [hRoomStatus], a                         ; $60C2: $E0 $F8
    jp   label_018_7F08                           ; $60C4: $C3 $08 $7F

jr_018_60C7:
    call func_018_7EB2                            ; $60C7: $CD $B2 $7E
    ld   a, e                                     ; $60CA: $7B
    xor  $01                                      ; $60CB: $EE $01
    ldh  [hLinkDirection], a                      ; $60CD: $E0 $9E
    push bc                                       ; $60CF: $C5
    call $0BF0                                    ; $60D0: $CD $F0 $0B
    pop  bc                                       ; $60D3: $C1
    ret                                           ; $60D4: $C9

    ld   d, b                                     ; $60D5: $50
    ld   [bc], a                                  ; $60D6: $02
    ld   d, d                                     ; $60D7: $52
    ld   [bc], a                                  ; $60D8: $02
    ld   d, d                                     ; $60D9: $52
    ld   [hl+], a                                 ; $60DA: $22
    ld   d, b                                     ; $60DB: $50
    ld   [hl+], a                                 ; $60DC: $22
    ld   d, h                                     ; $60DD: $54
    ld   [bc], a                                  ; $60DE: $02
    ld   d, [hl]                                  ; $60DF: $56
    ld   [bc], a                                  ; $60E0: $02
    ld   d, [hl]                                  ; $60E1: $56
    ld   [hl+], a                                 ; $60E2: $22
    ld   d, h                                     ; $60E3: $54
    ld   [hl+], a                                 ; $60E4: $22
    ld   e, b                                     ; $60E5: $58
    ld   [bc], a                                  ; $60E6: $02
    ld   e, d                                     ; $60E7: $5A
    ld   [bc], a                                  ; $60E8: $02
    ld   e, h                                     ; $60E9: $5C
    ld   [bc], a                                  ; $60EA: $02
    ld   e, [hl]                                  ; $60EB: $5E
    ld   [bc], a                                  ; $60EC: $02
    ld   e, d                                     ; $60ED: $5A
    ld   [hl+], a                                 ; $60EE: $22
    ld   e, b                                     ; $60EF: $58
    ld   [hl+], a                                 ; $60F0: $22
    ld   e, [hl]                                  ; $60F1: $5E
    ld   [hl+], a                                 ; $60F2: $22
    ld   e, h                                     ; $60F3: $5C
    ld   [hl+], a                                 ; $60F4: $22

label_018_60F5:
    ld   de, $60D5                                ; $60F5: $11 $D5 $60
    call label_3BC0                               ; $60F8: $CD $C0 $3B
    call func_018_7D60                            ; $60FB: $CD $60 $7D
    ldh  a, [hActiveEntityWalking]                ; $60FE: $F0 $F0
    rst  $00                                      ; $6100: $C7
    add  hl, bc                                   ; $6101: $09
    ld   h, c                                     ; $6102: $61
    add  hl, sp                                   ; $6103: $39
    ld   h, c                                     ; $6104: $61
    ld   c, a                                     ; $6105: $4F
    ld   h, c                                     ; $6106: $61
    ld   [hl], e                                  ; $6107: $73
    ld   h, c                                     ; $6108: $61
    ld   hl, $C380                                ; $6109: $21 $80 $C3
    add  hl, bc                                   ; $610C: $09
    ld   [hl], $02                                ; $610D: $36 $02
    ld   hl, wEntity0SpeedY                       ; $610F: $21 $50 $C2
    add  hl, bc                                   ; $6112: $09
    ld   [hl], $F4                                ; $6113: $36 $F4
    call func_018_7E62                            ; $6115: $CD $62 $7E
    ldh  a, [wActiveEntityPosY]                   ; $6118: $F0 $EC
    cp   $70                                      ; $611A: $FE $70
    ret  nc                                       ; $611C: $D0

    ld   a, $3B                                   ; $611D: $3E $3B
    call OpenDialogInTable2                       ; $611F: $CD $7C $23
    ld   a, $03                                   ; $6122: $3E $03
    ldh  [hLinkDirection], a                      ; $6124: $E0 $9E
    ld   a, [$C50F]                               ; $6126: $FA $0F $C5
    ld   e, a                                     ; $6129: $5F
    ld   d, b                                     ; $612A: $50
    ld   hl, $C380                                ; $612B: $21 $80 $C3
    add  hl, de                                   ; $612E: $19
    ld   [hl], $03                                ; $612F: $36 $03
    push bc                                       ; $6131: $C5
    call $0BF0                                    ; $6132: $CD $F0 $0B
    pop  bc                                       ; $6135: $C1
    jp   IncrementEntityWalkingAttr               ; $6136: $C3 $12 $3B

    ld   a, [$C50F]                               ; $6139: $FA $0F $C5
    ld   e, a                                     ; $613C: $5F
    ld   d, b                                     ; $613D: $50
    ld   hl, $C380                                ; $613E: $21 $80 $C3
    add  hl, de                                   ; $6141: $19
    ld   [hl], $03                                ; $6142: $36 $03
    call func_018_7DE8                            ; $6144: $CD $E8 $7D
    ld   a, $3A                                   ; $6147: $3E $3A
    call OpenDialogInTable2                       ; $6149: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $614C: $C3 $12 $3B

    ld   a, [$C50F]                               ; $614F: $FA $0F $C5
    ld   e, a                                     ; $6152: $5F
    ld   d, b                                     ; $6153: $50
    ld   hl, $C380                                ; $6154: $21 $80 $C3
    add  hl, de                                   ; $6157: $19
    ld   [hl], $03                                ; $6158: $36 $03
    ld   a, [wDialogCharacterIndex]               ; $615A: $FA $70 $C1
    cp   $22                                      ; $615D: $FE $22
    jr   c, jr_018_6163                           ; $615F: $38 $02

    ld   [hl], $01                                ; $6161: $36 $01

jr_018_6163:
    call func_018_7DE8                            ; $6163: $CD $E8 $7D
    ld   a, [$C50F]                               ; $6166: $FA $0F $C5
    ld   e, a                                     ; $6169: $5F
    ld   d, b                                     ; $616A: $50
    ld   hl, wEntitiesWalkingTable                ; $616B: $21 $90 $C2
    add  hl, de                                   ; $616E: $19
    inc  [hl]                                     ; $616F: $34
    jp   IncrementEntityWalkingAttr               ; $6170: $C3 $12 $3B

    ld   hl, $C380                                ; $6173: $21 $80 $C3
    add  hl, bc                                   ; $6176: $09
    ld   [hl], $01                                ; $6177: $36 $01
    ld   hl, wEntity0SpeedX                       ; $6179: $21 $40 $C2
    add  hl, bc                                   ; $617C: $09
    ld   [hl], $F8                                ; $617D: $36 $F8
    call func_018_7E6C                            ; $617F: $CD $6C $7E
    ldh  a, [wActiveEntityPosX]                   ; $6182: $F0 $EE
    cp   $E0                                      ; $6184: $FE $E0
    ret  nz                                       ; $6186: $C0

    jp   label_018_7F08                           ; $6187: $C3 $08 $7F

    ld   a, [wIsMarinFollowingLink]               ; $618A: $FA $73 $DB
    and  a                                        ; $618D: $A7
    jp   nz, label_018_59E8                       ; $618E: $C2 $E8 $59

    ld   a, [$DB74]                               ; $6191: $FA $74 $DB
    and  a                                        ; $6194: $A7
    ret  nz                                       ; $6195: $C0

    ld   a, [$D8FD]                               ; $6196: $FA $FD $D8
    and  $20                                      ; $6199: $E6 $20
    jp   nz, label_018_7F08                       ; $619B: $C2 $08 $7F

    ld   a, [wTradeSequenceItem]                  ; $619E: $FA $0E $DB
    cp   $07                                      ; $61A1: $FE $07
    jp   c, label_018_7F08                        ; $61A3: $DA $08 $7F

    ld   de, $5EB7                                ; $61A6: $11 $B7 $5E
    call label_3BC0                               ; $61A9: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $61AC: $FA $24 $C1
    and  a                                        ; $61AF: $A7
    ret  nz                                       ; $61B0: $C0

    call func_018_7D36                            ; $61B1: $CD $36 $7D
    ld   a, [wGameplayType]                       ; $61B4: $FA $95 $DB
    cp   $0B                                      ; $61B7: $FE $0B
    ret  nz                                       ; $61B9: $C0

    ld   a, [wTransitionSequenceCounter]          ; $61BA: $FA $6B $C1
    cp   $04                                      ; $61BD: $FE $04
    ret  nz                                       ; $61BF: $C0

    ldh  a, [hActiveEntityWalking]                ; $61C0: $F0 $F0
    rst  $00                                      ; $61C2: $C7
    pop  de                                       ; $61C3: $D1
    ld   h, c                                     ; $61C4: $61
    db   $DD                                      ; $61C5: $DD
    ld   h, c                                     ; $61C6: $61
    rst  $30                                      ; $61C7: $F7
    ld   h, c                                     ; $61C8: $61
    dec  d                                        ; $61C9: $15
    ld   h, d                                     ; $61CA: $62
    ld   b, [hl]                                  ; $61CB: $46
    ld   h, d                                     ; $61CC: $62
    ld   d, e                                     ; $61CD: $53
    ld   h, d                                     ; $61CE: $62
    ld   h, a                                     ; $61CF: $67
    ld   h, d                                     ; $61D0: $62
    ld   a, $4D                                   ; $61D1: $3E $4D
    ld   [wWorldMusicTrack], a                    ; $61D3: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $61D6: $E0 $B0
    ldh  [$FFBD], a                               ; $61D8: $E0 $BD
    jp   IncrementEntityWalkingAttr               ; $61DA: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $61DD: $FA $9F $C1
    and  a                                        ; $61E0: $A7
    ret  nz                                       ; $61E1: $C0

    call func_018_7EC2                            ; $61E2: $CD $C2 $7E
    add  $14                                      ; $61E5: $C6 $14
    cp   $28                                      ; $61E7: $FE $28
    ret  nc                                       ; $61E9: $D0

    ld   a, $01                                   ; $61EA: $3E $01
    ld   [wC167], a                               ; $61EC: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $61EF: $CD $05 $0C
    ld   [hl], $18                                ; $61F2: $36 $18
    jp   IncrementEntityWalkingAttr               ; $61F4: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $61F7: $FA $9F $C1
    and  a                                        ; $61FA: $A7
    ret  nz                                       ; $61FB: $C0

    call GetEntityTransitionCountdown             ; $61FC: $CD $05 $0C
    jr   nz, jr_018_6209                          ; $61FF: $20 $08

    ld   a, $D5                                   ; $6201: $3E $D5
    call OpenDialogInTable1                       ; $6203: $CD $73 $23
    call IncrementEntityWalkingAttr               ; $6206: $CD $12 $3B

jr_018_6209:
    ld   e, $02                                   ; $6209: $1E $02
    cp   $0C                                      ; $620B: $FE $0C
    jr   c, jr_018_6211                           ; $620D: $38 $02

    ld   e, $04                                   ; $620F: $1E $04

jr_018_6211:
    ld   a, e                                     ; $6211: $7B
    jp   label_3B0C                               ; $6212: $C3 $0C $3B

    ld   a, [wDialogState]                        ; $6215: $FA $9F $C1
    and  a                                        ; $6218: $A7
    ret  nz                                       ; $6219: $C0

    call IncrementEntityWalkingAttr               ; $621A: $CD $12 $3B
    ld   a, [wC177]                               ; $621D: $FA $77 $C1
    and  a                                        ; $6220: $A7
    jr   nz, jr_018_623D                          ; $6221: $20 $1A

    ld   [hl], $06                                ; $6223: $36 $06
    xor  a                                        ; $6225: $AF
    ld   [wTransitionSequenceCounter], a          ; $6226: $EA $6B $C1
    ld   [wC16C], a                               ; $6229: $EA $6C $C1
    ld   [wActivePowerUp], a                      ; $622C: $EA $7C $D4
    ld   [wGameplaySubtype], a                    ; $622F: $EA $96 $DB
    ld   a, $09                                   ; $6232: $3E $09
    ld   [wGameplayType], a                       ; $6234: $EA $95 $DB
    ld   a, $4E                                   ; $6237: $3E $4E
    ld   [wWorldMusicTrack], a                    ; $6239: $EA $68 $D3
    ret                                           ; $623C: $C9

jr_018_623D:
    xor  a                                        ; $623D: $AF
    ld   [wC167], a                               ; $623E: $EA $67 $C1
    ld   a, $D6                                   ; $6241: $3E $D6
    jp   OpenDialogInTable1                       ; $6243: $C3 $73 $23

    ld   a, [wDialogState]                        ; $6246: $FA $9F $C1
    and  a                                        ; $6249: $A7
    ret  nz                                       ; $624A: $C0

    call GetEntityTransitionCountdown             ; $624B: $CD $05 $0C
    ld   [hl], $60                                ; $624E: $36 $60
    jp   IncrementEntityWalkingAttr               ; $6250: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $6253: $CD $05 $0C
    jr   nz, jr_018_625B                          ; $6256: $20 $03

    call IncrementEntityWalkingAttr               ; $6258: $CD $12 $3B

jr_018_625B:
    ld   e, $00                                   ; $625B: $1E $00
    cp   $54                                      ; $625D: $FE $54
    jr   c, jr_018_6263                           ; $625F: $38 $02

    ld   e, $04                                   ; $6261: $1E $04

jr_018_6263:
    ld   a, e                                     ; $6263: $7B
    jp   label_3B0C                               ; $6264: $C3 $0C $3B

    ret                                           ; $6267: $C9

    ld   h, l                                     ; $6268: $65
    ld   h, h                                     ; $6269: $64
    ld   d, h                                     ; $626A: $54
    ld   d, d                                     ; $626B: $52
    ld   [hl+], a                                 ; $626C: $22
    ld   [hl+], a                                 ; $626D: $22
    ld   [hl-], a                                 ; $626E: $32
    scf                                           ; $626F: $37
    scf                                           ; $6270: $37
    scf                                           ; $6271: $37
    ld   d, a                                     ; $6272: $57
    ld   d, [hl]                                  ; $6273: $56
    ld   h, $21                                   ; $6274: $26 $21
    call nz, $D5C5                                ; $6276: $C4 $C5 $D5
    call nc, $C5C4                                ; $6279: $D4 $C4 $C5
    push de                                       ; $627C: $D5
    push de                                       ; $627D: $D5
    push bc                                       ; $627E: $C5
    call nz, $C5C4                                ; $627F: $C4 $C4 $C5
    push de                                       ; $6282: $D5
    call nc, $A9AB                                ; $6283: $D4 $AB $A9
    xor  h                                        ; $6286: $AC
    xor  d                                        ; $6287: $AA
    xor  e                                        ; $6288: $AB
    xor  c                                        ; $6289: $A9
    xor  e                                        ; $628A: $AB
    xor  d                                        ; $628B: $AA
    xor  h                                        ; $628C: $AC
    xor  c                                        ; $628D: $A9
    xor  e                                        ; $628E: $AB
    xor  c                                        ; $628F: $A9
    xor  h                                        ; $6290: $AC
    xor  [hl]                                     ; $6291: $AE
    call func_018_7DE8                            ; $6292: $CD $E8 $7D
    ldh  a, [hMapRoom]                            ; $6295: $F0 $F6
    cp   $B4                                      ; $6297: $FE $B4
    jr   nz, jr_018_62A2                          ; $6299: $20 $07

    xor  a                                        ; $629B: $AF
    ld   [$D472], a                               ; $629C: $EA $72 $D4
    ld   [$D473], a                               ; $629F: $EA $73 $D4

jr_018_62A2:
    ld   a, [$D473]                               ; $62A2: $FA $73 $D4
    and  a                                        ; $62A5: $A7
    jr   z, jr_018_62F4                           ; $62A6: $28 $4C

    ld   a, [$D472]                               ; $62A8: $FA $72 $D4
    ld   e, a                                     ; $62AB: $5F
    ld   d, b                                     ; $62AC: $50
    ld   hl, $6268                                ; $62AD: $21 $68 $62
    add  hl, de                                   ; $62B0: $19
    ld   a, [$D473]                               ; $62B1: $FA $73 $D4
    cp   [hl]                                     ; $62B4: $BE
    jr   nz, jr_018_62E4                          ; $62B5: $20 $2D

    ld   hl, $6276                                ; $62B7: $21 $76 $62
    add  hl, de                                   ; $62BA: $19
    ldh  a, [hMapRoom]                            ; $62BB: $F0 $F6
    cp   [hl]                                     ; $62BD: $BE
    jr   nz, jr_018_62E4                          ; $62BE: $20 $24

    xor  a                                        ; $62C0: $AF
    ld   [$D473], a                               ; $62C1: $EA $73 $D4
    ld   a, [$D472]                               ; $62C4: $FA $72 $D4
    inc  a                                        ; $62C7: $3C
    ld   [$D472], a                               ; $62C8: $EA $72 $D4
    cp   $0E                                      ; $62CB: $FE $0E
    jr   nz, jr_018_62DC                          ; $62CD: $20 $0D

    xor  a                                        ; $62CF: $AF
    ld   [$D472], a                               ; $62D0: $EA $72 $D4
    ld   a, $02                                   ; $62D3: $3E $02
    ldh  [hJingle], a                             ; $62D5: $E0 $F2
    push de                                       ; $62D7: $D5
    call func_018_62F5                            ; $62D8: $CD $F5 $62
    pop  de                                       ; $62DB: $D1

jr_018_62DC:
    ld   hl, $6284                                ; $62DC: $21 $84 $62
    add  hl, de                                   ; $62DF: $19
    ld   a, [hl]                                  ; $62E0: $7E
    jp   OpenDialogInTable1                       ; $62E1: $C3 $73 $23

jr_018_62E4:
    xor  a                                        ; $62E4: $AF
    ld   [$D472], a                               ; $62E5: $EA $72 $D4
    ld   [$D473], a                               ; $62E8: $EA $73 $D4
    ld   a, $1D                                   ; $62EB: $3E $1D
    ldh  [hJingle], a                             ; $62ED: $E0 $F2
    ld   a, $AD                                   ; $62EF: $3E $AD
    call OpenDialogInTable1                       ; $62F1: $CD $73 $23

jr_018_62F4:
    ret                                           ; $62F4: $C9

func_018_62F5:
    ld   hl, $D739                                ; $62F5: $21 $39 $D7
    ld   [hl], $C6                                ; $62F8: $36 $C6
    ld   a, $98                                   ; $62FA: $3E $98
    call label_B2F                                ; $62FC: $CD $2F $0B
    ld   a, $28                                   ; $62FF: $3E $28
    ld   [wWarp0PositionTileIndex], a             ; $6301: $EA $16 $D4
    ld   a, $20                                   ; $6304: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $6306: $E0 $CD
    add  $10                                      ; $6308: $C6 $10
    ldh  [hScratchB], a                           ; $630A: $E0 $D8
    ld   a, $80                                   ; $630C: $3E $80
    ldh  [hSwordIntersectedAreaX], a              ; $630E: $E0 $CE
    add  $08                                      ; $6310: $C6 $08
    ldh  [hScratchA], a                           ; $6312: $E0 $D7
    ld   a, $02                                   ; $6314: $3E $02
    call label_CC7                                ; $6316: $CD $C7 $0C
    call label_2887                               ; $6319: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $631C: $F0 $FE
    and  a                                        ; $631E: $A7
    jr   z, jr_018_632D                           ; $631F: $28 $0C

    push bc                                       ; $6321: $C5
    ld   a, $C6                                   ; $6322: $3E $C6
    ld   [$DDD8], a                               ; $6324: $EA $D8 $DD
    ld   a, $18                                   ; $6327: $3E $18
    call label_91D                                ; $6329: $CD $1D $09
    pop  bc                                       ; $632C: $C1

jr_018_632D:
    ld   hl, wRequestDestinationHigh              ; $632D: $21 $01 $D6
    ld   a, [wRequests]                           ; $6330: $FA $00 $D6
    ld   e, a                                     ; $6333: $5F
    add  $0A                                      ; $6334: $C6 $0A
    ld   [wRequests], a                           ; $6336: $EA $00 $D6
    ld   d, $00                                   ; $6339: $16 $00
    add  hl, de                                   ; $633B: $19
    ldh  a, [$FFCF]                               ; $633C: $F0 $CF
    ld   [hl+], a                                 ; $633E: $22
    ldh  a, [$FFD0]                               ; $633F: $F0 $D0
    ld   [hl+], a                                 ; $6341: $22
    ld   a, $81                                   ; $6342: $3E $81
    ld   [hl+], a                                 ; $6344: $22
    ld   a, $68                                   ; $6345: $3E $68
    ld   [hl+], a                                 ; $6347: $22
    ld   a, $77                                   ; $6348: $3E $77
    ld   [hl+], a                                 ; $634A: $22
    ldh  a, [$FFCF]                               ; $634B: $F0 $CF
    ld   [hl+], a                                 ; $634D: $22
    ldh  a, [$FFD0]                               ; $634E: $F0 $D0
    inc  a                                        ; $6350: $3C
    ld   [hl+], a                                 ; $6351: $22
    ld   a, $81                                   ; $6352: $3E $81
    ld   [hl+], a                                 ; $6354: $22
    ld   a, $69                                   ; $6355: $3E $69
    ld   [hl+], a                                 ; $6357: $22
    ld   a, $4B                                   ; $6358: $3E $4B
    ld   [hl+], a                                 ; $635A: $22
    ld   [hl], $00                                ; $635B: $36 $00
    ld   a, $01                                   ; $635D: $3E $01
    ldh  [$FFAC], a                               ; $635F: $E0 $AC
    ldh  a, [hSwordIntersectedAreaY]              ; $6361: $F0 $CD
    and  $F0                                      ; $6363: $E6 $F0
    add  $10                                      ; $6365: $C6 $10
    ldh  [$FFAE], a                               ; $6367: $E0 $AE
    ldh  a, [hSwordIntersectedAreaX]              ; $6369: $F0 $CE
    and  $F0                                      ; $636B: $E6 $F0
    add  $08                                      ; $636D: $C6 $08
    ldh  [$FFAD], a                               ; $636F: $E0 $AD
    ldh  a, [hMapRoom]                            ; $6371: $F0 $F6
    ld   e, a                                     ; $6373: $5F
    ld   d, $00                                   ; $6374: $16 $00
    ld   hl, wOverworldRoomStatus                 ; $6376: $21 $00 $D8
    add  hl, de                                   ; $6379: $19
    set  4, [hl]                                  ; $637A: $CB $E6
    ret                                           ; $637C: $C9

    db   $10                                      ; $637D: $10
    jr   nz, @+$32                                ; $637E: $20 $30

    ld   b, b                                     ; $6380: $40
    ld   d, b                                     ; $6381: $50
    ld   h, b                                     ; $6382: $60
    ld   [hl], b                                  ; $6383: $70
    add  b                                        ; $6384: $80
    jr   jr_018_63AF                              ; $6385: $18 $28

    jr   c, jr_018_63D1                           ; $6387: $38 $48

    ld   e, b                                     ; $6389: $58
    ld   l, b                                     ; $638A: $68
    ld   a, b                                     ; $638B: $78
    adc  b                                        ; $638C: $88
    ld   hl, wEntitiesUnknownTableB               ; $638D: $21 $B0 $C2
    add  hl, bc                                   ; $6390: $09
    ld   a, [hl]                                  ; $6391: $7E
    and  a                                        ; $6392: $A7
    jp   nz, label_018_640C                       ; $6393: $C2 $0C $64

    call func_018_7DE8                            ; $6396: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $6399: $CD $05 $0C
    jr   nz, jr_018_63F7                          ; $639C: $20 $59

    call GetRandomByte                            ; $639E: $CD $0D $28
    and  $07                                      ; $63A1: $E6 $07
    ld   e, a                                     ; $63A3: $5F
    ld   d, b                                     ; $63A4: $50
    ld   hl, $6385                                ; $63A5: $21 $85 $63
    add  hl, de                                   ; $63A8: $19
    ld   a, [hl]                                  ; $63A9: $7E
    ld   hl, wEntity0PosX                         ; $63AA: $21 $00 $C2
    add  hl, bc                                   ; $63AD: $09
    ld   [hl], a                                  ; $63AE: $77

jr_018_63AF:
    ld   hl, $637D                                ; $63AF: $21 $7D $63
    add  hl, de                                   ; $63B2: $19
    ld   a, [hl]                                  ; $63B3: $7E
    ld   hl, wEntity0PosY                         ; $63B4: $21 $10 $C2
    add  hl, bc                                   ; $63B7: $09
    ld   [hl], a                                  ; $63B8: $77
    call func_018_6493                            ; $63B9: $CD $93 $64
    ldh  a, [hScratchD]                           ; $63BC: $F0 $DA
    cp   $00                                      ; $63BE: $FE $00
    jr   z, jr_018_63C9                           ; $63C0: $28 $07

    cp   $06                                      ; $63C2: $FE $06
    jr   z, jr_018_63C9                           ; $63C4: $28 $03

    cp   $09                                      ; $63C6: $FE $09
    ret  nz                                       ; $63C8: $C0

jr_018_63C9:
    call GetEntityTransitionCountdown             ; $63C9: $CD $05 $0C
    call GetRandomByte                            ; $63CC: $CD $0D $28
    and  $3F                                      ; $63CF: $E6 $3F

jr_018_63D1:
    add  $40                                      ; $63D1: $C6 $40
    ld   [hl], a                                  ; $63D3: $77
    ld   a, $BF                                   ; $63D4: $3E $BF
    ld   e, $05                                   ; $63D6: $1E $05
    call label_3B98                               ; $63D8: $CD $98 $3B
    jr   c, jr_018_63F7                           ; $63DB: $38 $1A

    ldh  a, [hScratchA]                           ; $63DD: $F0 $D7
    ld   hl, wEntity0PosX                         ; $63DF: $21 $00 $C2
    add  hl, de                                   ; $63E2: $19
    ld   [hl], a                                  ; $63E3: $77
    ldh  a, [hScratchB]                           ; $63E4: $F0 $D8
    ld   hl, wEntity0PosY                         ; $63E6: $21 $10 $C2
    add  hl, de                                   ; $63E9: $19
    ld   [hl], a                                  ; $63EA: $77
    ld   hl, wEntitiesUnknownTableB               ; $63EB: $21 $B0 $C2
    add  hl, de                                   ; $63EE: $19
    ld   [hl], $01                                ; $63EF: $36 $01
    ld   hl, $C340                                ; $63F1: $21 $40 $C3
    add  hl, de                                   ; $63F4: $19
    res  6, [hl]                                  ; $63F5: $CB $B6

jr_018_63F7:
    ret                                           ; $63F7: $C9

    rst  $38                                      ; $63F8: $FF
    rst  $38                                      ; $63F9: $FF
    rst  $38                                      ; $63FA: $FF
    rst  $38                                      ; $63FB: $FF
    ld   l, h                                     ; $63FC: $6C
    ld   [bc], a                                  ; $63FD: $02
    ld   l, h                                     ; $63FE: $6C
    ld   [hl+], a                                 ; $63FF: $22
    ld   l, b                                     ; $6400: $68
    ld   [bc], a                                  ; $6401: $02
    ld   l, d                                     ; $6402: $6A
    ld   [bc], a                                  ; $6403: $02
    ld   h, b                                     ; $6404: $60
    ld   [bc], a                                  ; $6405: $02
    ld   h, d                                     ; $6406: $62
    ld   [bc], a                                  ; $6407: $02
    ld   h, h                                     ; $6408: $64
    ld   [bc], a                                  ; $6409: $02
    ld   h, [hl]                                  ; $640A: $66
    ld   [bc], a                                  ; $640B: $02

label_018_640C:
    ld   de, $63F8                                ; $640C: $11 $F8 $63
    call label_3BC0                               ; $640F: $CD $C0 $3B
    call func_018_7DE8                            ; $6412: $CD $E8 $7D
    call func_018_7E15                            ; $6415: $CD $15 $7E
    ldh  a, [hActiveEntityWalking]                ; $6418: $F0 $F0
    rst  $00                                      ; $641A: $C7
    inc  hl                                       ; $641B: $23
    ld   h, h                                     ; $641C: $64
    dec  hl                                       ; $641D: $2B
    ld   h, h                                     ; $641E: $64
    ld   d, b                                     ; $641F: $50
    ld   h, h                                     ; $6420: $64
    add  d                                        ; $6421: $82
    ld   h, h                                     ; $6422: $64
    call GetEntityTransitionCountdown             ; $6423: $CD $05 $0C
    ld   [hl], $30                                ; $6426: $36 $30
    jp   IncrementEntityWalkingAttr               ; $6428: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $642B: $CD $05 $0C
    jr   nz, jr_018_6445                          ; $642E: $20 $15

    call GetRandomByte                            ; $6430: $CD $0D $28
    and  $3F                                      ; $6433: $E6 $3F
    add  $70                                      ; $6435: $C6 $70
    ld   [hl], a                                  ; $6437: $77
    call GetRandomByte                            ; $6438: $CD $0D $28
    and  $07                                      ; $643B: $E6 $07
    add  $05                                      ; $643D: $C6 $05
    call label_3BAA                               ; $643F: $CD $AA $3B
    call IncrementEntityWalkingAttr               ; $6442: $CD $12 $3B

jr_018_6445:
    ld   e, $01                                   ; $6445: $1E $01
    cp   $18                                      ; $6447: $FE $18
    jr   nc, jr_018_644C                          ; $6449: $30 $01

    inc  e                                        ; $644B: $1C

jr_018_644C:
    ld   a, e                                     ; $644C: $7B
    jp   label_3B0C                               ; $644D: $C3 $0C $3B

    call func_018_7E5F                            ; $6450: $CD $5F $7E
    call label_3B23                               ; $6453: $CD $23 $3B
    call label_3B39                               ; $6456: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6459: $21 $A0 $C2
    add  hl, bc                                   ; $645C: $09
    ld   a, [hl]                                  ; $645D: $7E
    and  $0F                                      ; $645E: $E6 $0F
    jr   nz, jr_018_6467                          ; $6460: $20 $05

    call GetEntityTransitionCountdown             ; $6462: $CD $05 $0C
    jr   nz, jr_018_6475                          ; $6465: $20 $0E

jr_018_6467:
    call GetEntityTransitionCountdown             ; $6467: $CD $05 $0C
    ld   [hl], $30                                ; $646A: $36 $30
    call IncrementEntityWalkingAttr               ; $646C: $CD $12 $3B
    ld   hl, $C340                                ; $646F: $21 $40 $C3
    add  hl, bc                                   ; $6472: $09
    set  6, [hl]                                  ; $6473: $CB $F6

jr_018_6475:
    ldh  a, [hFrameCounter]                       ; $6475: $F0 $E7
    rra                                           ; $6477: $1F
    rra                                           ; $6478: $1F
    rra                                           ; $6479: $1F
    rra                                           ; $647A: $1F
    and  $01                                      ; $647B: $E6 $01
    add  $03                                      ; $647D: $C6 $03
    jp   label_3B0C                               ; $647F: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6482: $CD $05 $0C
    jp   z, label_018_7F08                        ; $6485: $CA $08 $7F

    ld   e, $01                                   ; $6488: $1E $01
    cp   $18                                      ; $648A: $FE $18
    jr   c, jr_018_648F                           ; $648C: $38 $01

    inc  e                                        ; $648E: $1C

jr_018_648F:
    ld   a, e                                     ; $648F: $7B
    jp   label_3B0C                               ; $6490: $C3 $0C $3B

func_018_6493:
    push bc                                       ; $6493: $C5
    ld   hl, wEntity0PosX                         ; $6494: $21 $00 $C2
    add  hl, bc                                   ; $6497: $09
    ld   a, [hl]                                  ; $6498: $7E
    sub  $01                                      ; $6499: $D6 $01
    ldh  [$FFDB], a                               ; $649B: $E0 $DB
    and  $F0                                      ; $649D: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $649F: $E0 $CE
    swap a                                        ; $64A1: $CB $37
    ld   hl, wEntity0PosY                         ; $64A3: $21 $10 $C2
    add  hl, bc                                   ; $64A6: $09
    ld   c, a                                     ; $64A7: $4F
    ld   a, [hl]                                  ; $64A8: $7E
    sub  $07                                      ; $64A9: $D6 $07
    ldh  [$FFDC], a                               ; $64AB: $E0 $DC
    and  $F0                                      ; $64AD: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $64AF: $E0 $CD
    or   c                                        ; $64B1: $B1
    ld   c, a                                     ; $64B2: $4F
    ld   b, $00                                   ; $64B3: $06 $00
    ld   hl, wRoomObjects                         ; $64B5: $21 $11 $D7
    ld   a, h                                     ; $64B8: $7C
    add  hl, bc                                   ; $64B9: $09
    ld   h, a                                     ; $64BA: $67
    pop  bc                                       ; $64BB: $C1
    ld   a, [hl]                                  ; $64BC: $7E
    ldh  [hFFAF], a                               ; $64BD: $E0 $AF
    ld   e, a                                     ; $64BF: $5F
    ld   a, [wIsIndoor]                           ; $64C0: $FA $A5 $DB
    ld   d, a                                     ; $64C3: $57
    call label_2A26                               ; $64C4: $CD $26 $2A
    ldh  [hScratchD], a                           ; $64C7: $E0 $DA
    ret                                           ; $64C9: $C9

    db   $EC                                      ; $64CA: $EC
    inc  d                                        ; $64CB: $14
    call func_018_68EA                            ; $64CC: $CD $EA $68
    ldh  a, [hActiveEntityState]                  ; $64CF: $F0 $EA
    cp   $01                                      ; $64D1: $FE $01
    jp   z, label_018_7F0F                        ; $64D3: $CA $0F $7F

    call func_018_7DE8                            ; $64D6: $CD $E8 $7D
    call label_3EE8                               ; $64D9: $CD $E8 $3E
    ld   hl, wEntitiesUnknownTableB               ; $64DC: $21 $B0 $C2
    add  hl, bc                                   ; $64DF: $09
    ld   a, [hl]                                  ; $64E0: $7E
    and  a                                        ; $64E1: $A7
    jr   nz, jr_018_64EA                          ; $64E2: $20 $06

    inc  [hl]                                     ; $64E4: $34
    call label_BFB                                ; $64E5: $CD $FB $0B
    ld   [hl], $20                                ; $64E8: $36 $20

jr_018_64EA:
    call IsEntityUnknownFZero                     ; $64EA: $CD $00 $0C
    jr   z, jr_018_650A                           ; $64ED: $28 $1B

    ld   a, [$C13E]                               ; $64EF: $FA $3E $C1
    and  a                                        ; $64F2: $A7
    cp   $01                                      ; $64F3: $FE $01
    jr   nz, jr_018_64FC                          ; $64F5: $20 $05

    ld   hl, hJingle                              ; $64F7: $21 $F2 $FF
    ld   [hl], $33                                ; $64FA: $36 $33

jr_018_64FC:
    and  a                                        ; $64FC: $A7
    jr   nz, jr_018_650A                          ; $64FD: $20 $0B

    ld   a, $02                                   ; $64FF: $3E $02
    ldh  [$FFA1], a                               ; $6501: $E0 $A1
    ld   a, $6A                                   ; $6503: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $6505: $E0 $9D
    call $69C5                                    ; $6507: $CD $C5 $69

jr_018_650A:
    call func_018_7E15                            ; $650A: $CD $15 $7E
    call label_3B65                               ; $650D: $CD $65 $3B
    ld   a, [$C13E]                               ; $6510: $FA $3E $C1
    and  a                                        ; $6513: $A7
    jr   nz, jr_018_6519                          ; $6514: $20 $03

    call label_3B39                               ; $6516: $CD $39 $3B

jr_018_6519:
    call func_018_7E5F                            ; $6519: $CD $5F $7E
    call label_3B23                               ; $651C: $CD $23 $3B
    call func_018_7E98                            ; $651F: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6522: $21 $20 $C3
    add  hl, bc                                   ; $6525: $09
    dec  [hl]                                     ; $6526: $35
    dec  [hl]                                     ; $6527: $35
    dec  [hl]                                     ; $6528: $35
    ld   hl, wEntitiesPosZTable                   ; $6529: $21 $10 $C3
    add  hl, bc                                   ; $652C: $09
    ld   a, [hl]                                  ; $652D: $7E
    and  $80                                      ; $652E: $E6 $80
    ldh  [hFFE8], a                               ; $6530: $E0 $E8
    and  a                                        ; $6532: $A7
    jr   z, jr_018_653E                           ; $6533: $28 $09

    ld   [hl], b                                  ; $6535: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6536: $21 $20 $C3
    add  hl, bc                                   ; $6539: $09
    ld   [hl], b                                  ; $653A: $70
    call label_3D7F                               ; $653B: $CD $7F $3D

jr_018_653E:
    call func_018_65CF                            ; $653E: $CD $CF $65
    call func_018_7EB2                            ; $6541: $CD $B2 $7E
    ld   hl, $C380                                ; $6544: $21 $80 $C3
    add  hl, bc                                   ; $6547: $09
    ld   [hl], e                                  ; $6548: $73
    call func_018_7EC2                            ; $6549: $CD $C2 $7E
    cp   $00                                      ; $654C: $FE $00
    jr   z, jr_018_655B                           ; $654E: $28 $0B

    ld   d, b                                     ; $6550: $50
    ld   hl, $64C8                                ; $6551: $21 $C8 $64
    add  hl, de                                   ; $6554: $19
    ld   a, [hl]                                  ; $6555: $7E
    ld   hl, wEntity0SpeedY                       ; $6556: $21 $50 $C2
    add  hl, bc                                   ; $6559: $09
    ld   [hl], a                                  ; $655A: $77

jr_018_655B:
    ldh  a, [hFFE8]                               ; $655B: $F0 $E8
    and  a                                        ; $655D: $A7
    jr   z, jr_018_6588                           ; $655E: $28 $28

    ld   hl, wEntitiesSpeedZTable                 ; $6560: $21 $20 $C3
    add  hl, bc                                   ; $6563: $09
    ld   [hl], $10                                ; $6564: $36 $10
    call GetRandomByte                            ; $6566: $CD $0D $28
    and  $0F                                      ; $6569: $E6 $0F
    sub  $08                                      ; $656B: $D6 $08
    ld   hl, wEntity0SpeedX                       ; $656D: $21 $40 $C2
    add  hl, bc                                   ; $6570: $09
    ld   [hl], a                                  ; $6571: $77
    call func_018_7EB2                            ; $6572: $CD $B2 $7E
    add  $28                                      ; $6575: $C6 $28
    cp   $50                                      ; $6577: $FE $50
    jr   c, jr_018_6588                           ; $6579: $38 $0D

    ld   a, $08                                   ; $657B: $3E $08
    call label_3BB5                               ; $657D: $CD $B5 $3B
    ldh  a, [hScratchB]                           ; $6580: $F0 $D8
    ld   hl, wEntity0SpeedX                       ; $6582: $21 $40 $C2
    add  hl, bc                                   ; $6585: $09
    add  [hl]                                     ; $6586: $86
    ld   [hl], a                                  ; $6587: $77

jr_018_6588:
    call func_018_6596                            ; $6588: $CD $96 $65
    ldh  a, [hFrameCounter]                       ; $658B: $F0 $E7
    rra                                           ; $658D: $1F
    rra                                           ; $658E: $1F
    rra                                           ; $658F: $1F
    rra                                           ; $6590: $1F
    and  $01                                      ; $6591: $E6 $01
    jp   label_3B0C                               ; $6593: $C3 $0C $3B

func_018_6596:
    call IsEntityUnknownFZero                     ; $6596: $CD $00 $0C
    jr   z, jr_018_659F                           ; $6599: $28 $04

    ld   a, $03                                   ; $659B: $3E $03
    jr   jr_018_65B8                              ; $659D: $18 $19

jr_018_659F:
    call label_BFB                                ; $659F: $CD $FB $0B
    jr   nz, jr_018_65CE                          ; $65A2: $20 $2A

    ld   hl, wEntitiesUnknownTableB               ; $65A4: $21 $B0 $C2
    add  hl, bc                                   ; $65A7: $09
    ld   a, [hl]                                  ; $65A8: $7E
    cp   $05                                      ; $65A9: $FE $05
    jr   nc, jr_018_65B2                          ; $65AB: $30 $05

    inc  [hl]                                     ; $65AD: $34
    ld   a, $01                                   ; $65AE: $3E $01
    jr   jr_018_65B8                              ; $65B0: $18 $06

jr_018_65B2:
    call GetRandomByte                            ; $65B2: $CD $0D $28
    and  $03                                      ; $65B5: $E6 $03
    inc  a                                        ; $65B7: $3C

label_018_65B8:
jr_018_65B8:
    ld   [$D205], a                               ; $65B8: $EA $05 $D2
    cp   $01                                      ; $65BB: $FE $01
    jr   nz, jr_018_65C3                          ; $65BD: $20 $04

    ld   a, $0A                                   ; $65BF: $3E $0A
    ldh  [hNoiseSfx], a                           ; $65C1: $E0 $F4

jr_018_65C3:
    call GetEntityTransitionCountdown             ; $65C3: $CD $05 $0C
    ld   [hl], $00                                ; $65C6: $36 $00
    ld   hl, $C3D0                                ; $65C8: $21 $D0 $C3
    add  hl, bc                                   ; $65CB: $09
    ld   [hl], $00                                ; $65CC: $36 $00

jr_018_65CE:
    ret                                           ; $65CE: $C9

func_018_65CF:
    ld   a, [$D205]                               ; $65CF: $FA $05 $D2
    and  a                                        ; $65D2: $A7
    ret  z                                        ; $65D3: $C8

    pop  de                                       ; $65D4: $D1
    dec  a                                        ; $65D5: $3D
    rst  $00                                      ; $65D6: $C7
    db   $EC                                      ; $65D7: $EC
    ld   h, l                                     ; $65D8: $65
    ld   b, e                                     ; $65D9: $43
    ld   h, [hl]                                  ; $65DA: $66
    call $EC66                                    ; $65DB: $CD $66 $EC
    ld   h, l                                     ; $65DE: $65
    ld   bc, $0101                                ; $65DF: $01 $01 $01
    ld   [bc], a                                  ; $65E2: $02
    ld   [bc], a                                  ; $65E3: $02
    inc  bc                                       ; $65E4: $03
    inc  bc                                       ; $65E5: $03
    inc  bc                                       ; $65E6: $03
    inc  bc                                       ; $65E7: $03
    inc  bc                                       ; $65E8: $03
    ld   [bc], a                                  ; $65E9: $02
    ld   [bc], a                                  ; $65EA: $02
    ld   bc, $05CD                                ; $65EB: $01 $CD $05
    inc  c                                        ; $65EE: $0C
    jr   nz, jr_018_660B                          ; $65EF: $20 $1A

    ld   hl, $C3D0                                ; $65F1: $21 $D0 $C3
    add  hl, bc                                   ; $65F4: $09
    ld   a, [hl]                                  ; $65F5: $7E
    cp   $0D                                      ; $65F6: $FE $0D
    jp   z, label_018_660C                        ; $65F8: $CA $0C $66

    inc  [hl]                                     ; $65FB: $34
    ld   e, a                                     ; $65FC: $5F
    ld   d, b                                     ; $65FD: $50
    ld   hl, $65DF                                ; $65FE: $21 $DF $65
    add  hl, de                                   ; $6601: $19
    ld   a, [hl]                                  ; $6602: $7E
    call label_3B0C                               ; $6603: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6606: $CD $05 $0C
    ld   [hl], $01                                ; $6609: $36 $01

jr_018_660B:
    ret                                           ; $660B: $C9

label_018_660C:
    call GetRandomByte                            ; $660C: $CD $0D $28
    and  $03                                      ; $660F: $E6 $03
    jp   z, label_018_672A                        ; $6611: $CA $2A $67

    ld   a, $01                                   ; $6614: $3E $01
    jp   label_018_65B8                           ; $6616: $C3 $B8 $65

    inc  b                                        ; $6619: $04
    dec  b                                        ; $661A: $05
    dec  b                                        ; $661B: $05
    dec  b                                        ; $661C: $05
    dec  b                                        ; $661D: $05
    dec  b                                        ; $661E: $05
    dec  b                                        ; $661F: $05
    dec  b                                        ; $6620: $05
    dec  b                                        ; $6621: $05
    dec  b                                        ; $6622: $05
    dec  b                                        ; $6623: $05
    ld   b, $07                                   ; $6624: $06 $07
    ld   [label_808], sp                          ; $6626: $08 $08 $08
    ld   [$0708], sp                              ; $6629: $08 $08 $07
    ld   b, $01                                   ; $662C: $06 $01
    ld   [$0810], sp                              ; $662E: $08 $10 $08
    ld   [$0002], sp                              ; $6631: $08 $02 $00
    nop                                           ; $6634: $00
    nop                                           ; $6635: $00
    db   $FC                                      ; $6636: $FC
    ld   hl, sp-$10                               ; $6637: $F8 $F0
    ld   hl, sp-$20                               ; $6639: $F8 $E0
    sub  b                                        ; $663B: $90
    and  b                                        ; $663C: $A0
    nop                                           ; $663D: $00
    nop                                           ; $663E: $00
    nop                                           ; $663F: $00
    nop                                           ; $6640: $00
    nop                                           ; $6641: $00
    nop                                           ; $6642: $00
    call GetEntityTransitionCountdown             ; $6643: $CD $05 $0C
    jr   nz, jr_018_6678                          ; $6646: $20 $30

    ld   hl, $C3D0                                ; $6648: $21 $D0 $C3
    add  hl, bc                                   ; $664B: $09
    ld   a, [hl]                                  ; $664C: $7E
    cp   $15                                      ; $664D: $FE $15
    jp   z, label_018_672A                        ; $664F: $CA $2A $67

    inc  [hl]                                     ; $6652: $34
    ld   e, a                                     ; $6653: $5F
    ld   d, b                                     ; $6654: $50
    ld   hl, $6619                                ; $6655: $21 $19 $66
    add  hl, de                                   ; $6658: $19
    ld   a, [hl]                                  ; $6659: $7E
    call label_3B0C                               ; $665A: $CD $0C $3B
    ld   hl, $662E                                ; $665D: $21 $2E $66
    add  hl, de                                   ; $6660: $19
    ld   e, [hl]                                  ; $6661: $5E
    ld   hl, $C380                                ; $6662: $21 $80 $C3
    add  hl, bc                                   ; $6665: $09
    ld   a, [hl]                                  ; $6666: $7E
    and  a                                        ; $6667: $A7
    jr   nz, jr_018_666E                          ; $6668: $20 $04

    ld   a, e                                     ; $666A: $7B
    cpl                                           ; $666B: $2F
    inc  a                                        ; $666C: $3C
    ld   e, a                                     ; $666D: $5F

jr_018_666E:
    ld   hl, wEntity0SpeedX                       ; $666E: $21 $40 $C2
    add  hl, bc                                   ; $6671: $09
    ld   [hl], e                                  ; $6672: $73
    call GetEntityTransitionCountdown             ; $6673: $CD $05 $0C
    ld   [hl], $03                                ; $6676: $36 $03

jr_018_6678:
    ret                                           ; $6678: $C9

    add  hl, bc                                   ; $6679: $09
    add  hl, bc                                   ; $667A: $09
    ld   a, [bc]                                  ; $667B: $0A
    ld   a, [bc]                                  ; $667C: $0A
    dec  bc                                       ; $667D: $0B
    dec  bc                                       ; $667E: $0B
    inc  c                                        ; $667F: $0C
    inc  c                                        ; $6680: $0C
    add  hl, bc                                   ; $6681: $09
    add  hl, bc                                   ; $6682: $09
    ld   a, [bc]                                  ; $6683: $0A
    ld   a, [bc]                                  ; $6684: $0A
    dec  bc                                       ; $6685: $0B
    dec  bc                                       ; $6686: $0B
    inc  c                                        ; $6687: $0C
    inc  c                                        ; $6688: $0C
    add  hl, bc                                   ; $6689: $09
    add  hl, bc                                   ; $668A: $09
    ld   a, [bc]                                  ; $668B: $0A
    ld   a, [bc]                                  ; $668C: $0A
    dec  bc                                       ; $668D: $0B
    dec  bc                                       ; $668E: $0B
    inc  c                                        ; $668F: $0C
    inc  c                                        ; $6690: $0C
    add  hl, bc                                   ; $6691: $09
    add  hl, bc                                   ; $6692: $09
    add  hl, bc                                   ; $6693: $09
    add  hl, bc                                   ; $6694: $09
    add  hl, bc                                   ; $6695: $09
    add  hl, bc                                   ; $6696: $09
    add  hl, bc                                   ; $6697: $09
    add  hl, bc                                   ; $6698: $09
    add  hl, bc                                   ; $6699: $09
    add  hl, bc                                   ; $669A: $09
    dec  c                                        ; $669B: $0D
    ld   c, $0F                                   ; $669C: $0E $0F
    db   $10                                      ; $669E: $10
    ld   de, $1111                                ; $669F: $11 $11 $11
    ld   bc, label_C0C                            ; $66A2: $01 $0C $0C
    inc  c                                        ; $66A5: $0C
    inc  c                                        ; $66A6: $0C
    inc  c                                        ; $66A7: $0C
    inc  c                                        ; $66A8: $0C
    inc  c                                        ; $66A9: $0C
    inc  c                                        ; $66AA: $0C
    ld   [label_808], sp                          ; $66AB: $08 $08 $08
    ld   [label_808], sp                          ; $66AE: $08 $08 $08
    ld   [$0008], sp                              ; $66B1: $08 $08 $00
    nop                                           ; $66B4: $00
    nop                                           ; $66B5: $00
    nop                                           ; $66B6: $00
    nop                                           ; $66B7: $00
    nop                                           ; $66B8: $00
    nop                                           ; $66B9: $00
    nop                                           ; $66BA: $00
    nop                                           ; $66BB: $00
    nop                                           ; $66BC: $00
    nop                                           ; $66BD: $00
    nop                                           ; $66BE: $00
    nop                                           ; $66BF: $00
    nop                                           ; $66C0: $00
    nop                                           ; $66C1: $00
    nop                                           ; $66C2: $00
    ldh  a, [hBGMapOffsetHigh]                    ; $66C3: $F0 $E0
    ret  nc                                       ; $66C5: $D0

    ret  nz                                       ; $66C6: $C0

    ret  nz                                       ; $66C7: $C0

    ldh  [hActiveEntityWalking], a                ; $66C8: $E0 $F0
    nop                                           ; $66CA: $00
    nop                                           ; $66CB: $00
    nop                                           ; $66CC: $00
    call GetEntityTransitionCountdown             ; $66CD: $CD $05 $0C
    jr   nz, jr_018_6729                          ; $66D0: $20 $57

    ld   hl, $C3D0                                ; $66D2: $21 $D0 $C3
    add  hl, bc                                   ; $66D5: $09
    ld   a, [hl]                                  ; $66D6: $7E
    cp   $2A                                      ; $66D7: $FE $2A
    jp   z, label_018_672A                        ; $66D9: $CA $2A $67

    ld   e, a                                     ; $66DC: $5F
    cp   $28                                      ; $66DD: $FE $28
    jr   nz, jr_018_66E8                          ; $66DF: $20 $07

    ld   a, [wLinkMotionState]                    ; $66E1: $FA $1C $C1
    cp   $0A                                      ; $66E4: $FE $0A
    jr   z, jr_018_66E9                           ; $66E6: $28 $01

jr_018_66E8:
    inc  [hl]                                     ; $66E8: $34

jr_018_66E9:
    ld   d, b                                     ; $66E9: $50
    ld   hl, $6679                                ; $66EA: $21 $79 $66
    add  hl, de                                   ; $66ED: $19
    ld   a, [hl]                                  ; $66EE: $7E
    call label_3B0C                               ; $66EF: $CD $0C $3B
    ld   hl, $66A3                                ; $66F2: $21 $A3 $66
    add  hl, de                                   ; $66F5: $19
    ld   e, [hl]                                  ; $66F6: $5E
    ld   hl, $C380                                ; $66F7: $21 $80 $C3
    add  hl, bc                                   ; $66FA: $09
    ld   a, [hl]                                  ; $66FB: $7E
    and  a                                        ; $66FC: $A7
    jr   nz, jr_018_6703                          ; $66FD: $20 $04

    ld   a, e                                     ; $66FF: $7B
    cpl                                           ; $6700: $2F
    inc  a                                        ; $6701: $3C
    ld   e, a                                     ; $6702: $5F

jr_018_6703:
    ld   hl, wEntity0SpeedX                       ; $6703: $21 $40 $C2
    add  hl, bc                                   ; $6706: $09
    ld   [hl], e                                  ; $6707: $73
    call IsEntityUnknownFZero                     ; $6708: $CD $00 $0C
    jr   z, jr_018_6724                           ; $670B: $28 $17

    call func_018_7EB2                            ; $670D: $CD $B2 $7E
    add  $30                                      ; $6710: $C6 $30
    cp   $60                                      ; $6712: $FE $60
    jr   c, jr_018_6724                           ; $6714: $38 $0E

    ld   hl, $C3D0                                ; $6716: $21 $D0 $C3
    add  hl, bc                                   ; $6719: $09
    ld   a, [hl]                                  ; $671A: $7E
    cp   $18                                      ; $671B: $FE $18
    jr   nc, jr_018_6724                          ; $671D: $30 $05

    ld   a, $10                                   ; $671F: $3E $10
    call label_3BAA                               ; $6721: $CD $AA $3B

jr_018_6724:
    call GetEntityTransitionCountdown             ; $6724: $CD $05 $0C
    ld   [hl], $03                                ; $6727: $36 $03

jr_018_6729:
    ret                                           ; $6729: $C9

label_018_672A:
    xor  a                                        ; $672A: $AF
    ld   [$D205], a                               ; $672B: $EA $05 $D2
    call label_BFB                                ; $672E: $CD $FB $0B
    call GetRandomByte                            ; $6731: $CD $0D $28
    and  $0F                                      ; $6734: $E6 $0F
    add  $0C                                      ; $6736: $C6 $0C
    ld   [hl], a                                  ; $6738: $77
    ret                                           ; $6739: $C9

    nop                                           ; $673A: $00
    ld   hl, sp+$6C                               ; $673B: $F8 $6C
    inc  bc                                       ; $673D: $03
    nop                                           ; $673E: $00
    nop                                           ; $673F: $00
    ld   l, [hl]                                  ; $6740: $6E
    inc  bc                                       ; $6741: $03
    nop                                           ; $6742: $00
    nop                                           ; $6743: $00
    ld   h, b                                     ; $6744: $60
    ld   bc, label_800                            ; $6745: $01 $00 $08
    ld   h, d                                     ; $6748: $62
    ld   bc, $F8FD                                ; $6749: $01 $FD $F8
    ld   l, [hl]                                  ; $674C: $6E
    inc  hl                                       ; $674D: $23
    db   $FD                                      ; $674E: $FD
    nop                                           ; $674F: $00
    ld   l, h                                     ; $6750: $6C
    inc  hl                                       ; $6751: $23
    rst  $38                                      ; $6752: $FF
    ld   hl, sp+$6C                               ; $6753: $F8 $6C
    inc  bc                                       ; $6755: $03
    rst  $38                                      ; $6756: $FF
    nop                                           ; $6757: $00
    ld   l, [hl]                                  ; $6758: $6E
    inc  bc                                       ; $6759: $03
    nop                                           ; $675A: $00
    nop                                           ; $675B: $00
    ld   h, h                                     ; $675C: $64
    ld   bc, label_800                            ; $675D: $01 $00 $08
    ld   h, [hl]                                  ; $6760: $66
    ld   bc, $F8FD                                ; $6761: $01 $FD $F8
    ld   l, [hl]                                  ; $6764: $6E
    inc  hl                                       ; $6765: $23
    db   $FD                                      ; $6766: $FD
    nop                                           ; $6767: $00
    ld   l, h                                     ; $6768: $6C
    inc  hl                                       ; $6769: $23
    nop                                           ; $676A: $00
    ld   hl, sp+$6E                               ; $676B: $F8 $6E
    inc  hl                                       ; $676D: $23
    nop                                           ; $676E: $00
    nop                                           ; $676F: $00
    ld   l, h                                     ; $6770: $6C
    inc  hl                                       ; $6771: $23
    nop                                           ; $6772: $00
    nop                                           ; $6773: $00
    ld   h, b                                     ; $6774: $60
    ld   bc, label_800                            ; $6775: $01 $00 $08
    ld   h, d                                     ; $6778: $62
    ld   bc, $F8FD                                ; $6779: $01 $FD $F8
    ld   l, h                                     ; $677C: $6C
    inc  bc                                       ; $677D: $03
    db   $FD                                      ; $677E: $FD
    nop                                           ; $677F: $00
    ld   l, [hl]                                  ; $6780: $6E
    inc  bc                                       ; $6781: $03
    db   $FD                                      ; $6782: $FD
    ldh  a, [$FF6C]                               ; $6783: $F0 $6C
    inc  bc                                       ; $6785: $03
    db   $FD                                      ; $6786: $FD
    ld   hl, sp+$6E                               ; $6787: $F8 $6E
    inc  bc                                       ; $6789: $03
    nop                                           ; $678A: $00
    ld   hl, sp+$6E                               ; $678B: $F8 $6E
    inc  hl                                       ; $678D: $23
    nop                                           ; $678E: $00
    nop                                           ; $678F: $00
    ld   l, h                                     ; $6790: $6C
    inc  hl                                       ; $6791: $23
    nop                                           ; $6792: $00
    nop                                           ; $6793: $00
    ld   h, b                                     ; $6794: $60
    ld   bc, label_800                            ; $6795: $01 $00 $08
    ld   h, d                                     ; $6798: $62
    ld   bc, $0000                                ; $6799: $01 $00 $00
    ld   l, [hl]                                  ; $679C: $6E
    inc  hl                                       ; $679D: $23
    nop                                           ; $679E: $00
    ld   [$236C], sp                              ; $679F: $08 $6C $23
    nop                                           ; $67A2: $00
    nop                                           ; $67A3: $00
    ld   h, h                                     ; $67A4: $64
    ld   bc, label_800                            ; $67A5: $01 $00 $08
    ld   h, [hl]                                  ; $67A8: $66
    ld   bc, $F8FD                                ; $67A9: $01 $FD $F8
    ld   l, [hl]                                  ; $67AC: $6E
    inc  hl                                       ; $67AD: $23
    db   $FD                                      ; $67AE: $FD
    nop                                           ; $67AF: $00
    ld   l, h                                     ; $67B0: $6C
    inc  hl                                       ; $67B1: $23
    db   $FD                                      ; $67B2: $FD
    ld   [$236E], sp                              ; $67B3: $08 $6E $23
    db   $FD                                      ; $67B6: $FD
    db   $10                                      ; $67B7: $10
    ld   l, h                                     ; $67B8: $6C
    inc  hl                                       ; $67B9: $23
    nop                                           ; $67BA: $00
    nop                                           ; $67BB: $00
    ld   l, b                                     ; $67BC: $68
    ld   bc, label_800                            ; $67BD: $01 $00 $08
    ld   l, d                                     ; $67C0: $6A
    ld   bc, $F8FD                                ; $67C1: $01 $FD $F8
    ld   l, [hl]                                  ; $67C4: $6E
    inc  hl                                       ; $67C5: $23
    db   $FD                                      ; $67C6: $FD
    nop                                           ; $67C7: $00
    ld   l, h                                     ; $67C8: $6C
    inc  hl                                       ; $67C9: $23
    nop                                           ; $67CA: $00
    ld   hl, sp+$6C                               ; $67CB: $F8 $6C
    inc  bc                                       ; $67CD: $03
    nop                                           ; $67CE: $00
    nop                                           ; $67CF: $00
    ld   l, [hl]                                  ; $67D0: $6E
    inc  bc                                       ; $67D1: $03
    nop                                           ; $67D2: $00
    nop                                           ; $67D3: $00
    ld   h, b                                     ; $67D4: $60
    ld   bc, label_800                            ; $67D5: $01 $00 $08
    ld   h, d                                     ; $67D8: $62
    ld   bc, $0000                                ; $67D9: $01 $00 $00
    rst  $38                                      ; $67DC: $FF
    nop                                           ; $67DD: $00
    nop                                           ; $67DE: $00
    nop                                           ; $67DF: $00
    rst  $38                                      ; $67E0: $FF
    nop                                           ; $67E1: $00
    nop                                           ; $67E2: $00
    ldh  a, [$FF6C]                               ; $67E3: $F0 $6C
    inc  bc                                       ; $67E5: $03
    nop                                           ; $67E6: $00
    ld   hl, sp+$6E                               ; $67E7: $F8 $6E
    inc  bc                                       ; $67E9: $03
    nop                                           ; $67EA: $00
    nop                                           ; $67EB: $00
    ld   h, b                                     ; $67EC: $60
    ld   bc, label_800                            ; $67ED: $01 $00 $08
    ld   h, d                                     ; $67F0: $62
    ld   bc, $0000                                ; $67F1: $01 $00 $00
    rst  $38                                      ; $67F4: $FF
    nop                                           ; $67F5: $00
    nop                                           ; $67F6: $00
    nop                                           ; $67F7: $00
    rst  $38                                      ; $67F8: $FF
    nop                                           ; $67F9: $00
    nop                                           ; $67FA: $00
    add  sp, $6C                                  ; $67FB: $E8 $6C
    inc  bc                                       ; $67FD: $03
    nop                                           ; $67FE: $00
    ldh  a, [$FF6E]                               ; $67FF: $F0 $6E
    inc  bc                                       ; $6801: $03
    nop                                           ; $6802: $00
    nop                                           ; $6803: $00
    ld   h, b                                     ; $6804: $60
    ld   bc, label_800                            ; $6805: $01 $00 $08
    ld   h, d                                     ; $6808: $62
    ld   bc, $0000                                ; $6809: $01 $00 $00
    rst  $38                                      ; $680C: $FF
    nop                                           ; $680D: $00
    nop                                           ; $680E: $00
    nop                                           ; $680F: $00
    rst  $38                                      ; $6810: $FF
    nop                                           ; $6811: $00
    ld   hl, sp+$10                               ; $6812: $F8 $10
    ld   l, h                                     ; $6814: $6C
    inc  bc                                       ; $6815: $03
    ld   hl, sp+$18                               ; $6816: $F8 $18
    ld   l, [hl]                                  ; $6818: $6E
    inc  bc                                       ; $6819: $03
    nop                                           ; $681A: $00
    nop                                           ; $681B: $00
    ld   l, b                                     ; $681C: $68
    ld   bc, label_800                            ; $681D: $01 $00 $08
    ld   l, d                                     ; $6820: $6A
    ld   bc, $F8FD                                ; $6821: $01 $FD $F8
    ld   l, [hl]                                  ; $6824: $6E
    inc  hl                                       ; $6825: $23
    db   $FD                                      ; $6826: $FD
    nop                                           ; $6827: $00
    ld   l, h                                     ; $6828: $6C
    inc  hl                                       ; $6829: $23
    ldh  a, [$FF08]                               ; $682A: $F0 $08
    ld   l, h                                     ; $682C: $6C
    inc  bc                                       ; $682D: $03
    ldh  a, [rNR10]                               ; $682E: $F0 $10
    ld   l, [hl]                                  ; $6830: $6E
    inc  bc                                       ; $6831: $03
    nop                                           ; $6832: $00
    nop                                           ; $6833: $00
    ld   l, b                                     ; $6834: $68
    ld   bc, label_800                            ; $6835: $01 $00 $08
    ld   l, d                                     ; $6838: $6A
    ld   bc, $F8FD                                ; $6839: $01 $FD $F8
    ld   l, [hl]                                  ; $683C: $6E
    inc  hl                                       ; $683D: $23
    db   $FD                                      ; $683E: $FD
    nop                                           ; $683F: $00
    ld   l, h                                     ; $6840: $6C
    inc  hl                                       ; $6841: $23
    db   $FC                                      ; $6842: $FC
    ld   [$236E], sp                              ; $6843: $08 $6E $23
    db   $FC                                      ; $6846: $FC
    db   $10                                      ; $6847: $10
    ld   l, h                                     ; $6848: $6C
    inc  hl                                       ; $6849: $23
    nop                                           ; $684A: $00
    nop                                           ; $684B: $00
    ld   l, b                                     ; $684C: $68
    ld   bc, label_800                            ; $684D: $01 $00 $08
    ld   l, d                                     ; $6850: $6A
    ld   bc, $F8FD                                ; $6851: $01 $FD $F8
    ld   l, [hl]                                  ; $6854: $6E
    inc  hl                                       ; $6855: $23
    db   $FD                                      ; $6856: $FD
    nop                                           ; $6857: $00
    ld   l, h                                     ; $6858: $6C
    inc  hl                                       ; $6859: $23
    nop                                           ; $685A: $00
    db   $10                                      ; $685B: $10
    ld   l, [hl]                                  ; $685C: $6E
    inc  hl                                       ; $685D: $23
    nop                                           ; $685E: $00
    jr   jr_018_68CD                              ; $685F: $18 $6C

    inc  hl                                       ; $6861: $23
    nop                                           ; $6862: $00
    nop                                           ; $6863: $00
    ld   l, b                                     ; $6864: $68
    ld   bc, label_800                            ; $6865: $01 $00 $08
    ld   l, d                                     ; $6868: $6A
    ld   bc, $F8FD                                ; $6869: $01 $FD $F8
    ld   l, [hl]                                  ; $686C: $6E
    inc  hl                                       ; $686D: $23
    db   $FD                                      ; $686E: $FD
    nop                                           ; $686F: $00
    ld   l, h                                     ; $6870: $6C
    inc  hl                                       ; $6871: $23
    inc  b                                        ; $6872: $04
    ld   [$236E], sp                              ; $6873: $08 $6E $23
    inc  b                                        ; $6876: $04
    db   $10                                      ; $6877: $10
    ld   l, h                                     ; $6878: $6C
    inc  hl                                       ; $6879: $23
    nop                                           ; $687A: $00
    nop                                           ; $687B: $00
    ld   l, b                                     ; $687C: $68
    ld   bc, label_800                            ; $687D: $01 $00 $08
    ld   l, d                                     ; $6880: $6A
    ld   bc, $F8FD                                ; $6881: $01 $FD $F8
    ld   l, [hl]                                  ; $6884: $6E
    inc  hl                                       ; $6885: $23
    db   $FD                                      ; $6886: $FD
    nop                                           ; $6887: $00
    ld   l, h                                     ; $6888: $6C
    inc  hl                                       ; $6889: $23
    ld   [$6C00], sp                              ; $688A: $08 $00 $6C
    inc  bc                                       ; $688D: $03
    ld   [$6E08], sp                              ; $688E: $08 $08 $6E
    inc  bc                                       ; $6891: $03
    nop                                           ; $6892: $00
    nop                                           ; $6893: $00
    ld   h, h                                     ; $6894: $64
    ld   bc, label_800                            ; $6895: $01 $00 $08
    ld   h, [hl]                                  ; $6898: $66
    ld   bc, $0000                                ; $6899: $01 $00 $00
    rst  $38                                      ; $689C: $FF
    nop                                           ; $689D: $00
    nop                                           ; $689E: $00
    nop                                           ; $689F: $00
    rst  $38                                      ; $68A0: $FF
    nop                                           ; $68A1: $00
    ld   [$6CF8], sp                              ; $68A2: $08 $F8 $6C
    inc  bc                                       ; $68A5: $03
    ld   [$6E00], sp                              ; $68A6: $08 $00 $6E
    inc  bc                                       ; $68A9: $03
    nop                                           ; $68AA: $00
    nop                                           ; $68AB: $00
    ld   h, b                                     ; $68AC: $60
    ld   bc, label_800                            ; $68AD: $01 $00 $08
    ld   h, d                                     ; $68B0: $62
    ld   bc, $0000                                ; $68B1: $01 $00 $00
    rst  $38                                      ; $68B4: $FF
    nop                                           ; $68B5: $00
    nop                                           ; $68B6: $00
    nop                                           ; $68B7: $00
    rst  $38                                      ; $68B8: $FF
    nop                                           ; $68B9: $00
    dec  b                                        ; $68BA: $05
    ldh  a, [$FF6C]                               ; $68BB: $F0 $6C
    inc  bc                                       ; $68BD: $03
    dec  b                                        ; $68BE: $05
    ld   hl, sp+$6E                               ; $68BF: $F8 $6E
    inc  bc                                       ; $68C1: $03
    nop                                           ; $68C2: $00
    nop                                           ; $68C3: $00
    ld   h, b                                     ; $68C4: $60
    ld   bc, label_800                            ; $68C5: $01 $00 $08
    ld   h, d                                     ; $68C8: $62
    ld   bc, $0000                                ; $68C9: $01 $00 $00
    rst  $38                                      ; $68CC: $FF

jr_018_68CD:
    nop                                           ; $68CD: $00
    nop                                           ; $68CE: $00
    nop                                           ; $68CF: $00
    rst  $38                                      ; $68D0: $FF
    nop                                           ; $68D1: $00
    db   $F4                                      ; $68D2: $F4
    ldh  a, [$FF6E]                               ; $68D3: $F0 $6E
    inc  hl                                       ; $68D5: $23
    db   $F4                                      ; $68D6: $F4
    ld   hl, sp+$6C                               ; $68D7: $F8 $6C
    inc  hl                                       ; $68D9: $23
    nop                                           ; $68DA: $00
    nop                                           ; $68DB: $00
    ld   h, b                                     ; $68DC: $60
    ld   bc, label_800                            ; $68DD: $01 $00 $08
    ld   h, d                                     ; $68E0: $62
    ld   bc, $0000                                ; $68E1: $01 $00 $00
    rst  $38                                      ; $68E4: $FF
    nop                                           ; $68E5: $00
    nop                                           ; $68E6: $00
    nop                                           ; $68E7: $00
    rst  $38                                      ; $68E8: $FF
    nop                                           ; $68E9: $00

func_018_68EA:
    ld   a, $80                                   ; $68EA: $3E $80
    ld   [$D5C0], a                               ; $68EC: $EA $C0 $D5
    ld   [$D5C2], a                               ; $68EF: $EA $C2 $D5
    ldh  a, [hActiveEntityUnknownG]               ; $68F2: $F0 $F1
    sla  a                                        ; $68F4: $CB $27
    sla  a                                        ; $68F6: $CB $27
    ld   d, b                                     ; $68F8: $50
    sla  a                                        ; $68F9: $CB $27
    ld   e, a                                     ; $68FB: $5F
    rl   d                                        ; $68FC: $CB $12
    sla  a                                        ; $68FE: $CB $27
    rl   d                                        ; $6900: $CB $12
    add  e                                        ; $6902: $83
    ld   e, a                                     ; $6903: $5F
    ld   a, d                                     ; $6904: $7A
    adc  $00                                      ; $6905: $CE $00
    ld   d, a                                     ; $6907: $57
    xor  a                                        ; $6908: $AF
    ldh  [hFFE8], a                               ; $6909: $E0 $E8
    ld   hl, $C380                                ; $690B: $21 $80 $C3
    add  hl, bc                                   ; $690E: $09
    ld   a, [hl]                                  ; $690F: $7E
    and  a                                        ; $6910: $A7
    jr   nz, jr_018_691B                          ; $6911: $20 $08

    inc  a                                        ; $6913: $3C
    ldh  [hFFE8], a                               ; $6914: $E0 $E8
    ld   hl, $FFED                                ; $6916: $21 $ED $FF
    set  5, [hl]                                  ; $6919: $CB $EE

jr_018_691B:
    ld   hl, $673A                                ; $691B: $21 $3A $67
    add  hl, de                                   ; $691E: $19
    ld   c, $06                                   ; $691F: $0E $06
    push hl                                       ; $6921: $E5
    ld   a, [$C3C0]                               ; $6922: $FA $C0 $C3
    ld   e, a                                     ; $6925: $5F
    ld   d, $00                                   ; $6926: $16 $00
    ld   hl, $C030                                ; $6928: $21 $30 $C0
    add  hl, de                                   ; $692B: $19
    ld   e, l                                     ; $692C: $5D
    ld   d, h                                     ; $692D: $54
    pop  hl                                       ; $692E: $E1
    ld   a, c                                     ; $692F: $79
    ldh  [hScratchA], a                           ; $6930: $E0 $D7
    ld   a, [wLinkWalkingFrameCount]              ; $6932: $FA $23 $C1
    ld   c, a                                     ; $6935: $4F
    call AdjustEntityPositionDuringRoomTransition ; $6936: $CD $57 $3D
    ldh  a, [hScratchA]                           ; $6939: $F0 $D7
    ld   c, a                                     ; $693B: $4F

jr_018_693C:
    ld   a, [$D5C2]                               ; $693C: $FA $C2 $D5
    cp   $80                                      ; $693F: $FE $80
    jr   nz, jr_018_6949                          ; $6941: $20 $06

    ld   a, [hl]                                  ; $6943: $7E
    add  $08                                      ; $6944: $C6 $08
    ld   [$D5C2], a                               ; $6946: $EA $C2 $D5

jr_018_6949:
    ldh  a, [wActiveEntityPosY]                   ; $6949: $F0 $EC
    add  [hl]                                     ; $694B: $86
    ld   [de], a                                  ; $694C: $12
    inc  hl                                       ; $694D: $23
    inc  de                                       ; $694E: $13
    push bc                                       ; $694F: $C5
    ld   a, [wScreenShakeHorizontal]              ; $6950: $FA $55 $C1
    ld   c, a                                     ; $6953: $4F
    ld   b, [hl]                                  ; $6954: $46
    ldh  a, [hFFE8]                               ; $6955: $F0 $E8
    and  a                                        ; $6957: $A7
    jr   z, jr_018_6960                           ; $6958: $28 $06

    ld   a, b                                     ; $695A: $78
    cpl                                           ; $695B: $2F
    inc  a                                        ; $695C: $3C
    add  $08                                      ; $695D: $C6 $08
    ld   b, a                                     ; $695F: $47

jr_018_6960:
    ld   a, [$D5C0]                               ; $6960: $FA $C0 $D5
    cp   $80                                      ; $6963: $FE $80
    jr   nz, jr_018_6972                          ; $6965: $20 $0B

    ldh  a, [hFFE8]                               ; $6967: $F0 $E8
    and  a                                        ; $6969: $A7
    ld   a, b                                     ; $696A: $78
    jr   nz, jr_018_696F                          ; $696B: $20 $02

    add  $08                                      ; $696D: $C6 $08

jr_018_696F:
    ld   [$D5C0], a                               ; $696F: $EA $C0 $D5

jr_018_6972:
    ldh  a, [wActiveEntityPosX]                   ; $6972: $F0 $EE
    add  b                                        ; $6974: $80
    sub  c                                        ; $6975: $91
    ld   [de], a                                  ; $6976: $12
    inc  hl                                       ; $6977: $23
    inc  de                                       ; $6978: $13
    pop  bc                                       ; $6979: $C1
    ld   a, [hl+]                                 ; $697A: $2A
    ld   [de], a                                  ; $697B: $12
    cp   $FF                                      ; $697C: $FE $FF
    jr   nz, jr_018_6984                          ; $697E: $20 $04

    dec  de                                       ; $6980: $1B
    xor  a                                        ; $6981: $AF
    ld   [de], a                                  ; $6982: $12
    inc  de                                       ; $6983: $13

jr_018_6984:
    inc  de                                       ; $6984: $13
    ldh  a, [$FFED]                               ; $6985: $F0 $ED
    xor  [hl]                                     ; $6987: $AE
    ld   [de], a                                  ; $6988: $12
    ldh  a, [hIsGBC]                              ; $6989: $F0 $FE
    and  a                                        ; $698B: $A7
    jr   z, jr_018_699A                           ; $698C: $28 $0C

    ldh  a, [$FFED]                               ; $698E: $F0 $ED
    bit  4, a                                     ; $6990: $CB $67
    jr   z, jr_018_699A                           ; $6992: $28 $06

    ld   a, [de]                                  ; $6994: $1A
    and  $F8                                      ; $6995: $E6 $F8
    or   $04                                      ; $6997: $F6 $04
    ld   [de], a                                  ; $6999: $12

jr_018_699A:
    inc  hl                                       ; $699A: $23
    inc  de                                       ; $699B: $13
    dec  c                                        ; $699C: $0D
    jr   nz, jr_018_693C                          ; $699D: $20 $9D

    ld   a, $08                                   ; $699F: $3E $08
    ld   [$D5C1], a                               ; $69A1: $EA $C1 $D5
    ld   a, $04                                   ; $69A4: $3E $04
    ld   [$D5C3], a                               ; $69A6: $EA $C3 $D5
    ld   a, [wLinkWalkingFrameCount]              ; $69A9: $FA $23 $C1
    ld   c, a                                     ; $69AC: $4F
    ld   a, $06                                   ; $69AD: $3E $06
    call label_3DA0                               ; $69AF: $CD $A0 $3D
    jp   label_3CD9                               ; $69B2: $C3 $D9 $3C

    nop                                           ; $69B5: $00
    cp   $FD                                      ; $69B6: $FE $FD
    cp   $00                                      ; $69B8: $FE $00
    ld   [bc], a                                  ; $69BA: $02
    inc  bc                                       ; $69BB: $03
    ld   [bc], a                                  ; $69BC: $02
    nop                                           ; $69BD: $00
    inc  b                                        ; $69BE: $04
    ld   [$100C], sp                              ; $69BF: $08 $0C $10
    inc  c                                        ; $69C2: $0C
    ld   [$2104], sp                              ; $69C3: $08 $04 $21
    db   $10                                      ; $69C6: $10
    ret  nz                                       ; $69C7: $C0

    ldh  a, [hFrameCounter]                       ; $69C8: $F0 $E7
    rra                                           ; $69CA: $1F
    rra                                           ; $69CB: $1F
    rra                                           ; $69CC: $1F
    push af                                       ; $69CD: $F5
    and  $07                                      ; $69CE: $E6 $07
    call func_018_69D8                            ; $69D0: $CD $D8 $69
    pop  af                                       ; $69D3: $F1
    add  $04                                      ; $69D4: $C6 $04
    and  $07                                      ; $69D6: $E6 $07

func_018_69D8:
    push bc                                       ; $69D8: $C5
    push hl                                       ; $69D9: $E5
    ld   e, a                                     ; $69DA: $5F
    ld   d, $00                                   ; $69DB: $16 $00
    ld   hl, $69B5                                ; $69DD: $21 $B5 $69
    add  hl, de                                   ; $69E0: $19
    ld   b, [hl]                                  ; $69E1: $46
    ld   hl, $69BD                                ; $69E2: $21 $BD $69
    add  hl, de                                   ; $69E5: $19
    ld   c, [hl]                                  ; $69E6: $4E
    pop  hl                                       ; $69E7: $E1
    ldh  a, [hLinkPositionY]                      ; $69E8: $F0 $99
    add  b                                        ; $69EA: $80
    add  $F6                                      ; $69EB: $C6 $F6
    ld   [hl+], a                                 ; $69ED: $22
    ldh  a, [hLinkPositionX]                      ; $69EE: $F0 $98
    add  c                                        ; $69F0: $81
    add  $FC                                      ; $69F1: $C6 $FC
    ld   [hl+], a                                 ; $69F3: $22
    ld   [hl], $24                                ; $69F4: $36 $24
    inc  hl                                       ; $69F6: $23
    ld   [hl], $00                                ; $69F7: $36 $00
    inc  hl                                       ; $69F9: $23
    pop  bc                                       ; $69FA: $C1
    ret                                           ; $69FB: $C9

    ld   hl, wEntitiesUnknownTableB               ; $69FC: $21 $B0 $C2
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    cp   $02                                      ; $6A01: $FE $02
    jp   z, label_018_6F1F                        ; $6A03: $CA $1F $6F

    and  a                                        ; $6A06: $A7
    jp   nz, $6F70                                ; $6A07: $C2 $70 $6F

    ldh  a, [hActiveEntityState]                  ; $6A0A: $F0 $EA
    cp   $01                                      ; $6A0C: $FE $01
    jr   nz, jr_018_6A71                          ; $6A0E: $20 $61

    ldh  a, [wActiveEntityPosX]                   ; $6A10: $F0 $EE
    ldh  [hScratchA], a                           ; $6A12: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $6A14: $F0 $EC
    ldh  [hScratchB], a                           ; $6A16: $E0 $D8
    ld   a, $02                                   ; $6A18: $3E $02
    call label_CC7                                ; $6A1A: $CD $C7 $0C
    ld   a, $0C                                   ; $6A1D: $3E $0C
    ldh  [hFFE8], a                               ; $6A1F: $E0 $E8
    call func_018_6A31                            ; $6A21: $CD $31 $6A
    ld   a, $F4                                   ; $6A24: $3E $F4
    ldh  [hFFE8], a                               ; $6A26: $E0 $E8
    call func_018_6A31                            ; $6A28: $CD $31 $6A
    call $3F5E                                    ; $6A2B: $CD $5E $3F
    jp   label_018_7F08                           ; $6A2E: $C3 $08 $7F

func_018_6A31:
    ld   a, $BD                                   ; $6A31: $3E $BD
    call label_3B86                               ; $6A33: $CD $86 $3B
    jr   c, jr_018_6A70                           ; $6A36: $38 $38

    ld   hl, $C460                                ; $6A38: $21 $60 $C4
    add  hl, bc                                   ; $6A3B: $09
    ld   a, [hl]                                  ; $6A3C: $7E
    ld   hl, $C460                                ; $6A3D: $21 $60 $C4
    add  hl, de                                   ; $6A40: $19
    ld   [hl], a                                  ; $6A41: $77
    ldh  a, [hScratchA]                           ; $6A42: $F0 $D7
    ld   hl, wEntity0PosX                         ; $6A44: $21 $00 $C2
    add  hl, de                                   ; $6A47: $19
    ld   [hl], a                                  ; $6A48: $77
    ldh  a, [hScratchB]                           ; $6A49: $F0 $D8
    ld   hl, wEntity0PosY                         ; $6A4B: $21 $10 $C2
    add  hl, de                                   ; $6A4E: $19
    ld   [hl], a                                  ; $6A4F: $77
    ldh  a, [hScratchD]                           ; $6A50: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $6A52: $21 $10 $C3
    add  hl, de                                   ; $6A55: $19
    ld   [hl], a                                  ; $6A56: $77
    ld   hl, wEntitiesUnknownTableB               ; $6A57: $21 $B0 $C2
    add  hl, de                                   ; $6A5A: $19
    ld   [hl], $01                                ; $6A5B: $36 $01
    ldh  a, [hFFE8]                               ; $6A5D: $F0 $E8
    ld   hl, wEntity0SpeedX                       ; $6A5F: $21 $40 $C2
    add  hl, de                                   ; $6A62: $19
    ld   [hl], a                                  ; $6A63: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A64: $21 $E0 $C2
    add  hl, de                                   ; $6A67: $19
    ld   [hl], $20                                ; $6A68: $36 $20
    ld   hl, wEntitiesHealthTable                 ; $6A6A: $21 $60 $C3
    add  hl, de                                   ; $6A6D: $19
    ld   [hl], $01                                ; $6A6E: $36 $01

jr_018_6A70:
    ret                                           ; $6A70: $C9

jr_018_6A71:
    call func_018_6EFB                            ; $6A71: $CD $FB $6E
    ldh  a, [hMapRoom]                            ; $6A74: $F0 $F6
    ld   hl, $C3E0                                ; $6A76: $21 $E0 $C3
    add  hl, bc                                   ; $6A79: $09
    cp   [hl]                                     ; $6A7A: $BE
    jr   z, jr_018_6A8B                           ; $6A7B: $28 $0E

    ldh  a, [wActiveEntityPosX]                   ; $6A7D: $F0 $EE
    cp   $98                                      ; $6A7F: $FE $98
    jp   nc, label_018_7F08                       ; $6A81: $D2 $08 $7F

    ldh  a, [wActiveEntityPosY]                   ; $6A84: $F0 $EC
    cp   $70                                      ; $6A86: $FE $70
    jp   nc, label_018_7F08                       ; $6A88: $D2 $08 $7F

jr_018_6A8B:
    call func_018_7DE8                            ; $6A8B: $CD $E8 $7D
    call func_018_7E15                            ; $6A8E: $CD $15 $7E
    call func_018_7E5F                            ; $6A91: $CD $5F $7E
    call func_018_7E98                            ; $6A94: $CD $98 $7E
    ldh  a, [hActiveEntityWalking]                ; $6A97: $F0 $F0
    rst  $00                                      ; $6A99: $C7
    xor  d                                        ; $6A9A: $AA
    ld   l, d                                     ; $6A9B: $6A
    bit  5, d                                     ; $6A9C: $CB $6A
    sbc  h                                        ; $6A9E: $9C
    ld   l, e                                     ; $6A9F: $6B
    call c, $EC6B                                 ; $6AA0: $DC $6B $EC
    ld   l, h                                     ; $6AA3: $6C
    jr   @+$6F                                    ; $6AA4: $18 $6D

    ld   l, c                                     ; $6AA6: $69
    ld   l, l                                     ; $6AA7: $6D
    add  d                                        ; $6AA8: $82
    ld   l, l                                     ; $6AA9: $6D
    ld   hl, wEntitiesHealthTable                 ; $6AAA: $21 $60 $C3
    add  hl, bc                                   ; $6AAD: $09
    ld   [hl], $03                                ; $6AAE: $36 $03
    call GetEntityTransitionCountdown             ; $6AB0: $CD $05 $0C
    ld   [hl], $C0                                ; $6AB3: $36 $C0
    ld   hl, $C450                                ; $6AB5: $21 $50 $C4
    add  hl, bc                                   ; $6AB8: $09
    ld   [hl], $80                                ; $6AB9: $36 $80
    call label_3D7F                               ; $6ABB: $CD $7F $3D
    ld   hl, wEntity0SpeedX                       ; $6ABE: $21 $40 $C2
    add  hl, bc                                   ; $6AC1: $09
    ld   [hl], $08                                ; $6AC2: $36 $08
    jp   IncrementEntityWalkingAttr               ; $6AC4: $C3 $12 $3B

    ld   [$08F8], sp                              ; $6AC7: $08 $F8 $08
    ld   hl, sp-$33                               ; $6ACA: $F8 $CD
    dec  sp                                       ; $6ACC: $3B
    ld   l, [hl]                                  ; $6ACD: $6E
    call func_018_7EB2                            ; $6ACE: $CD $B2 $7E
    add  $1C                                      ; $6AD1: $C6 $1C
    cp   $38                                      ; $6AD3: $FE $38
    jr   nc, jr_018_6B02                          ; $6AD5: $30 $2B

    call func_018_7ED2                            ; $6AD7: $CD $D2 $7E
    add  $20                                      ; $6ADA: $C6 $20
    cp   $40                                      ; $6ADC: $FE $40
    jr   nc, jr_018_6B02                          ; $6ADE: $30 $22

    ld   a, $10                                   ; $6AE0: $3E $10
    call label_3BB5                               ; $6AE2: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $6AE5: $F0 $D7
    cpl                                           ; $6AE7: $2F
    inc  a                                        ; $6AE8: $3C
    ld   hl, wEntity0SpeedY                       ; $6AE9: $21 $50 $C2
    add  hl, bc                                   ; $6AEC: $09
    ld   [hl], a                                  ; $6AED: $77
    ldh  a, [hScratchB]                           ; $6AEE: $F0 $D8
    cpl                                           ; $6AF0: $2F
    inc  a                                        ; $6AF1: $3C
    ld   hl, wEntity0SpeedX                       ; $6AF2: $21 $40 $C2
    add  hl, bc                                   ; $6AF5: $09
    ld   [hl], a                                  ; $6AF6: $77
    call IncrementEntityWalkingAttr               ; $6AF7: $CD $12 $3B
    ld   [hl], $03                                ; $6AFA: $36 $03
    ld   hl, wEntitiesUnknownTableC               ; $6AFC: $21 $C0 $C2
    add  hl, bc                                   ; $6AFF: $09
    ld   [hl], $FF                                ; $6B00: $36 $FF

jr_018_6B02:
    ld   hl, $C450                                ; $6B02: $21 $50 $C4
    add  hl, bc                                   ; $6B05: $09
    ld   a, [hl]                                  ; $6B06: $7E
    and  a                                        ; $6B07: $A7
    jr   nz, jr_018_6B15                          ; $6B08: $20 $0B

    call IncrementEntityWalkingAttr               ; $6B0A: $CD $12 $3B
    ld   [hl], $02                                ; $6B0D: $36 $02
    call GetEntityTransitionCountdown             ; $6B0F: $CD $05 $0C
    ld   [hl], $20                                ; $6B12: $36 $20
    ret                                           ; $6B14: $C9

jr_018_6B15:
    ld   hl, wEntitiesSpeedZTable                 ; $6B15: $21 $20 $C3
    add  hl, bc                                   ; $6B18: $09
    ld   [hl], b                                  ; $6B19: $70
    ld   hl, wEntitiesPosZTable                   ; $6B1A: $21 $10 $C3
    add  hl, bc                                   ; $6B1D: $09
    ld   a, [hl]                                  ; $6B1E: $7E
    sub  $28                                      ; $6B1F: $D6 $28
    jr   z, jr_018_6B30                           ; $6B21: $28 $0D

    ld   e, $08                                   ; $6B23: $1E $08
    and  $80                                      ; $6B25: $E6 $80
    jr   nz, jr_018_6B2B                          ; $6B27: $20 $02

    ld   e, $F8                                   ; $6B29: $1E $F8

jr_018_6B2B:
    ld   hl, wEntitiesSpeedZTable                 ; $6B2B: $21 $20 $C3
    add  hl, bc                                   ; $6B2E: $09
    ld   [hl], e                                  ; $6B2F: $73

jr_018_6B30:
    ld   hl, wEntitiesCollisionsTable             ; $6B30: $21 $A0 $C2
    add  hl, bc                                   ; $6B33: $09
    ld   a, [hl]                                  ; $6B34: $7E
    and  $03                                      ; $6B35: $E6 $03
    jr   z, jr_018_6B4B                           ; $6B37: $28 $12

    ld   e, a                                     ; $6B39: $5F
    ld   d, b                                     ; $6B3A: $50
    ld   hl, $6AC8                                ; $6B3B: $21 $C8 $6A
    add  hl, de                                   ; $6B3E: $19
    ld   a, [hl]                                  ; $6B3F: $7E
    ld   hl, wEntity0SpeedY                       ; $6B40: $21 $50 $C2
    add  hl, bc                                   ; $6B43: $09
    ld   [hl], a                                  ; $6B44: $77
    ld   hl, wEntity0SpeedX                       ; $6B45: $21 $40 $C2
    add  hl, bc                                   ; $6B48: $09
    ld   [hl], $00                                ; $6B49: $36 $00

jr_018_6B4B:
    ld   hl, wEntitiesCollisionsTable             ; $6B4B: $21 $A0 $C2
    add  hl, bc                                   ; $6B4E: $09
    ld   a, [hl]                                  ; $6B4F: $7E
    rra                                           ; $6B50: $1F
    rra                                           ; $6B51: $1F
    and  $03                                      ; $6B52: $E6 $03
    jr   z, jr_018_6B68                           ; $6B54: $28 $12

    ld   e, a                                     ; $6B56: $5F
    ld   d, b                                     ; $6B57: $50
    ld   hl, $6AC6                                ; $6B58: $21 $C6 $6A
    add  hl, de                                   ; $6B5B: $19
    ld   a, [hl]                                  ; $6B5C: $7E
    ld   hl, wEntity0SpeedX                       ; $6B5D: $21 $40 $C2
    add  hl, bc                                   ; $6B60: $09
    ld   [hl], a                                  ; $6B61: $77
    ld   hl, wEntity0SpeedY                       ; $6B62: $21 $50 $C2
    add  hl, bc                                   ; $6B65: $09
    ld   [hl], $00                                ; $6B66: $36 $00

jr_018_6B68:
    call GetEntityTransitionCountdown             ; $6B68: $CD $05 $0C
    jr   nz, jr_018_6B7B                          ; $6B6B: $20 $0E

    call GetRandomByte                            ; $6B6D: $CD $0D $28
    and  $7F                                      ; $6B70: $E6 $7F
    add  $40                                      ; $6B72: $C6 $40
    ld   [hl], a                                  ; $6B74: $77
    ld   hl, wEntitiesUnknowTableF                ; $6B75: $21 $F0 $C2
    add  hl, bc                                   ; $6B78: $09
    ld   [hl], $10                                ; $6B79: $36 $10

jr_018_6B7B:
    ld   hl, wEntitiesUnknowTableF                ; $6B7B: $21 $F0 $C2
    add  hl, bc                                   ; $6B7E: $09
    ld   a, [hl]                                  ; $6B7F: $7E
    and  a                                        ; $6B80: $A7
    jr   z, jr_018_6B8F                           ; $6B81: $28 $0C

    cp   $08                                      ; $6B83: $FE $08
    jr   nz, jr_018_6B8A                          ; $6B85: $20 $03

    call func_018_6D98                            ; $6B87: $CD $98 $6D

jr_018_6B8A:
    ld   a, $02                                   ; $6B8A: $3E $02
    jp   label_3B0C                               ; $6B8C: $C3 $0C $3B

jr_018_6B8F:
    call func_018_6E57                            ; $6B8F: $CD $57 $6E

label_018_6B92:
    ldh  a, [hFrameCounter]                       ; $6B92: $F0 $E7
    rra                                           ; $6B94: $1F
    rra                                           ; $6B95: $1F
    rra                                           ; $6B96: $1F
    and  $01                                      ; $6B97: $E6 $01
    jp   label_3B0C                               ; $6B99: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6B9C: $CD $05 $0C
    jr   nz, jr_018_6BD4                          ; $6B9F: $20 $33

    call IncrementEntityWalkingAttr               ; $6BA1: $CD $12 $3B
    ld   [hl], $03                                ; $6BA4: $36 $03
    ldh  a, [hLinkPositionY]                      ; $6BA6: $F0 $99
    push af                                       ; $6BA8: $F5
    sub  $14                                      ; $6BA9: $D6 $14
    ldh  [hLinkPositionY], a                      ; $6BAB: $E0 $99
    ld   a, $20                                   ; $6BAD: $3E $20
    call label_3BAA                               ; $6BAF: $CD $AA $3B
    pop  af                                       ; $6BB2: $F1
    ldh  [hLinkPositionY], a                      ; $6BB3: $E0 $99
    ld   hl, wEntitiesSpeedZTable                 ; $6BB5: $21 $20 $C3
    add  hl, bc                                   ; $6BB8: $09
    ld   [hl], $EC                                ; $6BB9: $36 $EC
    ld   hl, $C450                                ; $6BBB: $21 $50 $C4
    add  hl, bc                                   ; $6BBE: $09
    ld   [hl], $30                                ; $6BBF: $36 $30
    call GetRandomByte                            ; $6BC1: $CD $0D $28
    and  $03                                      ; $6BC4: $E6 $03
    ld   hl, wEntitiesUnknownTableC               ; $6BC6: $21 $C0 $C2
    add  hl, bc                                   ; $6BC9: $09
    ld   [hl], a                                  ; $6BCA: $77
    and  a                                        ; $6BCB: $A7
    jr   nz, jr_018_6BD3                          ; $6BCC: $20 $05

    call GetEntityTransitionCountdown             ; $6BCE: $CD $05 $0C
    ld   [hl], $10                                ; $6BD1: $36 $10

jr_018_6BD3:
    ret                                           ; $6BD3: $C9

jr_018_6BD4:
    call func_018_6CD3                            ; $6BD4: $CD $D3 $6C
    ld   a, $02                                   ; $6BD7: $3E $02
    jp   label_3B0C                               ; $6BD9: $C3 $0C $3B

    ld   hl, wEntitiesUnknownTableC               ; $6BDC: $21 $C0 $C2
    add  hl, bc                                   ; $6BDF: $09
    ld   a, [hl]                                  ; $6BE0: $7E
    cp   $FF                                      ; $6BE1: $FE $FF
    jr   z, jr_018_6C27                           ; $6BE3: $28 $42

    call func_018_7EB2                            ; $6BE5: $CD $B2 $7E
    add  $18                                      ; $6BE8: $C6 $18
    cp   $30                                      ; $6BEA: $FE $30
    jr   nc, jr_018_6C27                          ; $6BEC: $30 $39

    call func_018_7ED2                            ; $6BEE: $CD $D2 $7E
    add  $18                                      ; $6BF1: $C6 $18
    cp   $30                                      ; $6BF3: $FE $30
    jr   nc, jr_018_6C27                          ; $6BF5: $30 $30

    ld   hl, $C420                                ; $6BF7: $21 $20 $C4
    add  hl, bc                                   ; $6BFA: $09
    ld   a, [hl]                                  ; $6BFB: $7E
    and  a                                        ; $6BFC: $A7
    jr   nz, jr_018_6C27                          ; $6BFD: $20 $28

    ld   a, [wSwordAnimationState]                ; $6BFF: $FA $37 $C1
    and  a                                        ; $6C02: $A7
    jr   z, jr_018_6C27                           ; $6C03: $28 $22

    ld   a, $20                                   ; $6C05: $3E $20
    call label_3BB5                               ; $6C07: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $6C0A: $F0 $D7
    cpl                                           ; $6C0C: $2F
    inc  a                                        ; $6C0D: $3C
    ld   hl, wEntity0SpeedY                       ; $6C0E: $21 $50 $C2
    add  hl, bc                                   ; $6C11: $09
    ld   [hl], a                                  ; $6C12: $77
    ldh  a, [hScratchB]                           ; $6C13: $F0 $D8
    cpl                                           ; $6C15: $2F
    inc  a                                        ; $6C16: $3C
    ld   hl, wEntity0SpeedX                       ; $6C17: $21 $40 $C2
    add  hl, bc                                   ; $6C1A: $09
    ld   [hl], a                                  ; $6C1B: $77
    call GetEntityTransitionCountdown             ; $6C1C: $CD $05 $0C
    ld   [hl], $0B                                ; $6C1F: $36 $0B
    call IncrementEntityWalkingAttr               ; $6C21: $CD $12 $3B
    ld   [hl], $06                                ; $6C24: $36 $06
    ret                                           ; $6C26: $C9

jr_018_6C27:
    ld   hl, wEntitiesUnknownTableC               ; $6C27: $21 $C0 $C2
    add  hl, bc                                   ; $6C2A: $09
    ld   a, [hl]                                  ; $6C2B: $7E
    cp   $FF                                      ; $6C2C: $FE $FF
    jr   z, jr_018_6C38                           ; $6C2E: $28 $08

    and  a                                        ; $6C30: $A7
    jr   nz, jr_018_6C63                          ; $6C31: $20 $30

    call GetEntityTransitionCountdown             ; $6C33: $CD $05 $0C
    jr   nz, jr_018_6C63                          ; $6C36: $20 $2B

jr_018_6C38:
    ld   a, $20                                   ; $6C38: $3E $20
    call label_3BB5                               ; $6C3A: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $6C3D: $F0 $D7
    cpl                                           ; $6C3F: $2F
    inc  a                                        ; $6C40: $3C
    ld   hl, wEntity0SpeedY                       ; $6C41: $21 $50 $C2
    add  hl, bc                                   ; $6C44: $09
    sub  [hl]                                     ; $6C45: $96
    and  $80                                      ; $6C46: $E6 $80
    jr   nz, jr_018_6C4E                          ; $6C48: $20 $04

    inc  [hl]                                     ; $6C4A: $34
    inc  [hl]                                     ; $6C4B: $34
    inc  [hl]                                     ; $6C4C: $34
    inc  [hl]                                     ; $6C4D: $34

jr_018_6C4E:
    dec  [hl]                                     ; $6C4E: $35
    dec  [hl]                                     ; $6C4F: $35
    ldh  a, [hScratchB]                           ; $6C50: $F0 $D8
    cpl                                           ; $6C52: $2F
    inc  a                                        ; $6C53: $3C
    ld   hl, wEntity0SpeedX                       ; $6C54: $21 $40 $C2
    add  hl, bc                                   ; $6C57: $09
    sub  [hl]                                     ; $6C58: $96
    and  $80                                      ; $6C59: $E6 $80
    jr   nz, jr_018_6C61                          ; $6C5B: $20 $04

    inc  [hl]                                     ; $6C5D: $34
    inc  [hl]                                     ; $6C5E: $34
    inc  [hl]                                     ; $6C5F: $34
    inc  [hl]                                     ; $6C60: $34

jr_018_6C61:
    dec  [hl]                                     ; $6C61: $35
    dec  [hl]                                     ; $6C62: $35

jr_018_6C63:
    ld   hl, wEntitiesPosZTable                   ; $6C63: $21 $10 $C3
    add  hl, bc                                   ; $6C66: $09
    ld   a, [hl]                                  ; $6C67: $7E
    cp   $40                                      ; $6C68: $FE $40
    jr   c, jr_018_6C78                           ; $6C6A: $38 $0C

    ld   hl, wEntitiesSpeedZTable                 ; $6C6C: $21 $20 $C3
    add  hl, bc                                   ; $6C6F: $09
    ld   a, [hl]                                  ; $6C70: $7E
    and  $80                                      ; $6C71: $E6 $80
    jr   nz, jr_018_6C78                          ; $6C73: $20 $03

    ld   [hl], b                                  ; $6C75: $70
    jr   jr_018_6C88                              ; $6C76: $18 $10

jr_018_6C78:
    ld   hl, wEntitiesSpeedZTable                 ; $6C78: $21 $20 $C3
    add  hl, bc                                   ; $6C7B: $09
    ldh  a, [hFrameCounter]                       ; $6C7C: $F0 $E7
    and  $01                                      ; $6C7E: $E6 $01
    jr   nz, jr_018_6C83                          ; $6C80: $20 $01

    inc  [hl]                                     ; $6C82: $34

jr_018_6C83:
    ld   a, [hl]                                  ; $6C83: $7E
    and  $80                                      ; $6C84: $E6 $80
    jr   nz, jr_018_6CB8                          ; $6C86: $20 $30

jr_018_6C88:
    ld   hl, $C450                                ; $6C88: $21 $50 $C4
    add  hl, bc                                   ; $6C8B: $09
    ld   a, [hl]                                  ; $6C8C: $7E
    and  a                                        ; $6C8D: $A7
    jr   z, jr_018_6CA0                           ; $6C8E: $28 $10

    ldh  a, [wActiveEntityPosX]                   ; $6C90: $F0 $EE
    cp   $A8                                      ; $6C92: $FE $A8
    jr   nc, jr_018_6CA0                          ; $6C94: $30 $0A

    ldh  a, [wActiveEntityPosY]                   ; $6C96: $F0 $EC
    cp   $90                                      ; $6C98: $FE $90
    jr   c, jr_018_6CB8                           ; $6C9A: $38 $1C

    cp   $C0                                      ; $6C9C: $FE $C0
    jr   nc, jr_018_6CB8                          ; $6C9E: $30 $18

jr_018_6CA0:
    call IncrementEntityWalkingAttr               ; $6CA0: $CD $12 $3B
    ld   [hl], $04                                ; $6CA3: $36 $04
    call func_018_6CD3                            ; $6CA5: $CD $D3 $6C
    call GetEntityTransitionCountdown             ; $6CA8: $CD $05 $0C
    call GetRandomByte                            ; $6CAB: $CD $0D $28
    and  $3F                                      ; $6CAE: $E6 $3F
    add  $20                                      ; $6CB0: $C6 $20
    ld   [hl], a                                  ; $6CB2: $77
    ld   a, $FF                                   ; $6CB3: $3E $FF
    jp   label_3B0C                               ; $6CB5: $C3 $0C $3B

func_018_6CB8:
jr_018_6CB8:
    call label_3B39                               ; $6CB8: $CD $39 $3B
    ld   hl, $C420                                ; $6CBB: $21 $20 $C4
    add  hl, bc                                   ; $6CBE: $09
    ld   a, [hl]                                  ; $6CBF: $7E
    and  a                                        ; $6CC0: $A7
    jr   z, jr_018_6CCD                           ; $6CC1: $28 $0A

    call label_3D7F                               ; $6CC3: $CD $7F $3D
    ld   hl, wEntitiesUnknownTableC               ; $6CC6: $21 $C0 $C2
    add  hl, bc                                   ; $6CC9: $09
    ld   [hl], $FF                                ; $6CCA: $36 $FF
    ret                                           ; $6CCC: $C9

jr_018_6CCD:
    call func_018_6E57                            ; $6CCD: $CD $57 $6E
    jp   label_018_6B92                           ; $6CD0: $C3 $92 $6B

func_018_6CD3:
label_018_6CD3:
    call label_3D7F                               ; $6CD3: $CD $7F $3D
    ld   hl, wEntitiesSpeedZTable                 ; $6CD6: $21 $20 $C3
    add  hl, bc                                   ; $6CD9: $09
    ld   [hl], b                                  ; $6CDA: $70
    ret                                           ; $6CDB: $C9

    nop                                           ; $6CDC: $00
    nop                                           ; $6CDD: $00
    ret  nc                                       ; $6CDE: $D0

    ret  nc                                       ; $6CDF: $D0

    ld   b, b                                     ; $6CE0: $40
    ld   b, b                                     ; $6CE1: $40
    add  b                                        ; $6CE2: $80
    add  b                                        ; $6CE3: $80
    ld   [$3898], sp                              ; $6CE4: $08 $98 $38
    ld   a, b                                     ; $6CE7: $78
    ld   hl, sp-$58                               ; $6CE8: $F8 $A8
    ld   hl, sp-$58                               ; $6CEA: $F8 $A8
    call GetEntityTransitionCountdown             ; $6CEC: $CD $05 $0C
    jr   nz, jr_018_6D17                          ; $6CEF: $20 $26

    ld   hl, wEntitiesPosZTable                   ; $6CF1: $21 $10 $C3
    add  hl, bc                                   ; $6CF4: $09
    ld   [hl], $28                                ; $6CF5: $36 $28
    call IncrementEntityWalkingAttr               ; $6CF7: $CD $12 $3B
    ld   [hl], $05                                ; $6CFA: $36 $05
    call GetRandomByte                            ; $6CFC: $CD $0D $28
    and  $07                                      ; $6CFF: $E6 $07
    ld   e, a                                     ; $6D01: $5F
    ld   d, b                                     ; $6D02: $50
    ld   hl, $6CDC                                ; $6D03: $21 $DC $6C
    add  hl, de                                   ; $6D06: $19
    ld   a, [hl]                                  ; $6D07: $7E
    ld   hl, wEntity0PosY                         ; $6D08: $21 $10 $C2
    add  hl, bc                                   ; $6D0B: $09
    ld   [hl], a                                  ; $6D0C: $77
    ld   hl, $6CE4                                ; $6D0D: $21 $E4 $6C
    add  hl, de                                   ; $6D10: $19
    ld   a, [hl]                                  ; $6D11: $7E
    ld   hl, wEntity0PosX                         ; $6D12: $21 $00 $C2
    add  hl, bc                                   ; $6D15: $09
    ld   [hl], a                                  ; $6D16: $77

jr_018_6D17:
    ret                                           ; $6D17: $C9

    ld   a, $08                                   ; $6D18: $3E $08
    call label_3BAA                               ; $6D1A: $CD $AA $3B
    ldh  a, [wActiveEntityPosX]                   ; $6D1D: $F0 $EE
    cp   $09                                      ; $6D1F: $FE $09
    jr   c, jr_018_6D52                           ; $6D21: $38 $2F

    cp   $97                                      ; $6D23: $FE $97
    jr   nc, jr_018_6D52                          ; $6D25: $30 $2B

    ldh  a, [wActiveEntityPosY]                   ; $6D27: $F0 $EC
    cp   $20                                      ; $6D29: $FE $20
    jr   c, jr_018_6D52                           ; $6D2B: $38 $25

    cp   $70                                      ; $6D2D: $FE $70
    jr   nc, jr_018_6D52                          ; $6D2F: $30 $21

    call IncrementEntityWalkingAttr               ; $6D31: $CD $12 $3B
    ld   [hl], $01                                ; $6D34: $36 $01
    ld   hl, $C450                                ; $6D36: $21 $50 $C4
    add  hl, bc                                   ; $6D39: $09
    call GetRandomByte                            ; $6D3A: $CD $0D $28
    and  $3F                                      ; $6D3D: $E6 $3F
    add  $20                                      ; $6D3F: $C6 $20
    ld   [hl], a                                  ; $6D41: $77
    ld   hl, wEntity0SpeedX                       ; $6D42: $21 $40 $C2
    add  hl, bc                                   ; $6D45: $09
    ld   a, [hl]                                  ; $6D46: $7E
    cpl                                           ; $6D47: $2F
    inc  a                                        ; $6D48: $3C
    ld   [hl], a                                  ; $6D49: $77
    ld   hl, wEntity0SpeedY                       ; $6D4A: $21 $50 $C2
    add  hl, bc                                   ; $6D4D: $09
    ld   a, [hl]                                  ; $6D4E: $7E
    cpl                                           ; $6D4F: $2F
    inc  a                                        ; $6D50: $3C
    ld   [hl], a                                  ; $6D51: $77

jr_018_6D52:
    jp   label_018_6B92                           ; $6D52: $C3 $92 $6B

    nop                                           ; $6D55: $00
    add  hl, bc                                   ; $6D56: $09
    ld   [de], a                                  ; $6D57: $12
    dec  d                                        ; $6D58: $15
    jr   jr_018_6D70                              ; $6D59: $18 $15

    ld   [de], a                                  ; $6D5B: $12
    add  hl, bc                                   ; $6D5C: $09
    nop                                           ; $6D5D: $00
    rst  $30                                      ; $6D5E: $F7
    xor  $EB                                      ; $6D5F: $EE $EB
    add  sp, -$15                                 ; $6D61: $E8 $EB
    xor  $F7                                      ; $6D63: $EE $F7
    nop                                           ; $6D65: $00
    add  hl, bc                                   ; $6D66: $09
    ld   [de], a                                  ; $6D67: $12
    dec  d                                        ; $6D68: $15
    call GetEntityTransitionCountdown             ; $6D69: $CD $05 $0C
    jr   nz, jr_018_6D78                          ; $6D6C: $20 $0A

    ld   [hl], $20                                ; $6D6E: $36 $20

jr_018_6D70:
    call IncrementEntityWalkingAttr               ; $6D70: $CD $12 $3B
    ld   [hl], $07                                ; $6D73: $36 $07
    jp   label_018_6CD3                           ; $6D75: $C3 $D3 $6C

jr_018_6D78:
    cp   $08                                      ; $6D78: $FE $08
    jr   c, jr_018_6D7F                           ; $6D7A: $38 $03

    call func_018_6CB8                            ; $6D7C: $CD $B8 $6C

jr_018_6D7F:
    jp   label_018_6B92                           ; $6D7F: $C3 $92 $6B

    call GetEntityTransitionCountdown             ; $6D82: $CD $05 $0C
    jr   nz, jr_018_6D93                          ; $6D85: $20 $0C

    ld   hl, wEntitiesUnknownTableC               ; $6D87: $21 $C0 $C2
    add  hl, bc                                   ; $6D8A: $09
    ld   [hl], $FF                                ; $6D8B: $36 $FF
    call IncrementEntityWalkingAttr               ; $6D8D: $CD $12 $3B
    ld   [hl], $03                                ; $6D90: $36 $03
    ret                                           ; $6D92: $C9

jr_018_6D93:
    cp   $08                                      ; $6D93: $FE $08
    jp   nz, label_018_6E36                       ; $6D95: $C2 $36 $6E

func_018_6D98:
    ld   a, $0D                                   ; $6D98: $3E $0D
    ldh  [hNoiseSfx], a                           ; $6D9A: $E0 $F4
    ldh  a, [hLinkPositionY]                      ; $6D9C: $F0 $99
    push af                                       ; $6D9E: $F5
    sub  $08                                      ; $6D9F: $D6 $08
    ldh  [hLinkPositionY], a                      ; $6DA1: $E0 $99
    ld   a, $1F                                   ; $6DA3: $3E $1F
    call label_3BB5                               ; $6DA5: $CD $B5 $3B
    pop  af                                       ; $6DA8: $F1
    ldh  [hLinkPositionY], a                      ; $6DA9: $E0 $99
    call func_018_7B9D                            ; $6DAB: $CD $9D $7B
    and  $0F                                      ; $6DAE: $E6 $0F
    ldh  [hFFE8], a                               ; $6DB0: $E0 $E8
    ld   e, $00                                   ; $6DB2: $1E $00
    call func_018_6DB9                            ; $6DB4: $CD $B9 $6D
    ld   e, $01                                   ; $6DB7: $1E $01

func_018_6DB9:
    ldh  a, [hFFE8]                               ; $6DB9: $F0 $E8
    add  e                                        ; $6DBB: $83
    and  $0F                                      ; $6DBC: $E6 $0F
    ldh  [hFFE8], a                               ; $6DBE: $E0 $E8
    ld   e, $0F                                   ; $6DC0: $1E $0F
    ld   d, b                                     ; $6DC2: $50

jr_018_6DC3:
    ld   hl, wEntity0State                        ; $6DC3: $21 $80 $C2
    add  hl, de                                   ; $6DC6: $19
    ld   a, [hl]                                  ; $6DC7: $7E
    and  a                                        ; $6DC8: $A7
    jr   z, jr_018_6DDE                           ; $6DC9: $28 $13

    ld   hl, wEntitiesTypeTable                   ; $6DCB: $21 $A0 $C3
    add  hl, de                                   ; $6DCE: $19
    ld   a, [hl]                                  ; $6DCF: $7E
    cp   $BD                                      ; $6DD0: $FE $BD
    jr   nz, jr_018_6DDE                          ; $6DD2: $20 $0A

    ld   hl, wEntitiesUnknownTableB               ; $6DD4: $21 $B0 $C2
    add  hl, de                                   ; $6DD7: $19
    ld   a, [hl]                                  ; $6DD8: $7E
    cp   $02                                      ; $6DD9: $FE $02
    jr   nz, jr_018_6DDE                          ; $6DDB: $20 $01

    inc  b                                        ; $6DDD: $04

jr_018_6DDE:
    dec  e                                        ; $6DDE: $1D
    ld   a, e                                     ; $6DDF: $7B
    cp   $FF                                      ; $6DE0: $FE $FF
    jr   nz, jr_018_6DC3                          ; $6DE2: $20 $DF

    ld   a, b                                     ; $6DE4: $78
    ld   b, $00                                   ; $6DE5: $06 $00
    cp   $03                                      ; $6DE7: $FE $03
    jr   nc, jr_018_6E35                          ; $6DE9: $30 $4A

    ld   a, $BD                                   ; $6DEB: $3E $BD
    call label_3B86                               ; $6DED: $CD $86 $3B
    jr   c, jr_018_6E35                           ; $6DF0: $38 $43

    ldh  a, [hScratchA]                           ; $6DF2: $F0 $D7
    ld   hl, wEntity0PosX                         ; $6DF4: $21 $00 $C2
    add  hl, de                                   ; $6DF7: $19
    ld   [hl], a                                  ; $6DF8: $77
    ldh  a, [hScratchB]                           ; $6DF9: $F0 $D8
    ld   hl, hScratchD                            ; $6DFB: $21 $DA $FF
    sub  [hl]                                     ; $6DFE: $96
    ld   hl, wEntity0PosY                         ; $6DFF: $21 $10 $C2
    add  hl, de                                   ; $6E02: $19
    ld   [hl], a                                  ; $6E03: $77
    ld   hl, wEntitiesUnknownTableB               ; $6E04: $21 $B0 $C2
    add  hl, de                                   ; $6E07: $19
    ld   [hl], $02                                ; $6E08: $36 $02
    ld   hl, $C340                                ; $6E0A: $21 $40 $C3
    add  hl, de                                   ; $6E0D: $19
    ld   [hl], $02                                ; $6E0E: $36 $02
    ld   hl, wEntitiesHealthTable                 ; $6E10: $21 $60 $C3
    add  hl, de                                   ; $6E13: $19
    ld   [hl], $4C                                ; $6E14: $36 $4C
    push bc                                       ; $6E16: $C5
    ldh  a, [hFFE8]                               ; $6E17: $F0 $E8
    ld   c, a                                     ; $6E19: $4F
    ld   hl, $6D59                                ; $6E1A: $21 $59 $6D
    add  hl, bc                                   ; $6E1D: $09
    ld   a, [hl]                                  ; $6E1E: $7E
    ld   hl, wEntity0SpeedX                       ; $6E1F: $21 $40 $C2
    add  hl, de                                   ; $6E22: $19
    ld   [hl], a                                  ; $6E23: $77
    ld   hl, $6D55                                ; $6E24: $21 $55 $6D
    add  hl, bc                                   ; $6E27: $09
    ld   a, [hl]                                  ; $6E28: $7E
    ld   hl, wEntity0SpeedY                       ; $6E29: $21 $50 $C2
    add  hl, de                                   ; $6E2C: $19
    ld   [hl], a                                  ; $6E2D: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6E2E: $21 $E0 $C2
    add  hl, de                                   ; $6E31: $19
    ld   [hl], $20                                ; $6E32: $36 $20
    pop  bc                                       ; $6E34: $C1

jr_018_6E35:
    ret                                           ; $6E35: $C9

label_018_6E36:
    ld   a, $02                                   ; $6E36: $3E $02
    jp   label_3B0C                               ; $6E38: $C3 $0C $3B

    ld   hl, wEntity0PosY                         ; $6E3B: $21 $10 $C2
    add  hl, bc                                   ; $6E3E: $09
    ld   a, [hl]                                  ; $6E3F: $7E
    sub  $28                                      ; $6E40: $D6 $28
    ld   [hl], a                                  ; $6E42: $77
    ldh  a, [$FFEF]                               ; $6E43: $F0 $EF
    sub  $28                                      ; $6E45: $D6 $28
    ldh  [$FFEF], a                               ; $6E47: $E0 $EF
    call label_3B23                               ; $6E49: $CD $23 $3B
    ld   hl, wEntity0PosY                         ; $6E4C: $21 $10 $C2
    add  hl, bc                                   ; $6E4F: $09
    ld   a, [hl]                                  ; $6E50: $7E
    add  $28                                      ; $6E51: $C6 $28
    ld   [hl], a                                  ; $6E53: $77
    jp   label_3D8A                               ; $6E54: $C3 $8A $3D

func_018_6E57:
    ld   e, $0F                                   ; $6E57: $1E $0F

jr_018_6E59:
    ld   d, b                                     ; $6E59: $50
    ld   hl, wEntity0State                        ; $6E5A: $21 $80 $C2
    add  hl, de                                   ; $6E5D: $19
    ld   a, [hl]                                  ; $6E5E: $7E
    cp   $05                                      ; $6E5F: $FE $05
    jr   nz, jr_018_6ED0                          ; $6E61: $20 $6D

    ld   hl, wEntitiesTypeTable                   ; $6E63: $21 $A0 $C3
    add  hl, de                                   ; $6E66: $19
    ld   a, [hl]                                  ; $6E67: $7E
    cp   $03                                      ; $6E68: $FE $03
    jr   z, jr_018_6E74                           ; $6E6A: $28 $08

    cp   $00                                      ; $6E6C: $FE $00
    jr   z, jr_018_6E74                           ; $6E6E: $28 $04

    cp   $02                                      ; $6E70: $FE $02
    jr   nz, jr_018_6ED0                          ; $6E72: $20 $5C

jr_018_6E74:
    ld   hl, wEntity0PosX                         ; $6E74: $21 $00 $C2
    add  hl, de                                   ; $6E77: $19
    ldh  a, [wActiveEntityPosX]                   ; $6E78: $F0 $EE
    sub  [hl]                                     ; $6E7A: $96
    add  $18                                      ; $6E7B: $C6 $18
    cp   $30                                      ; $6E7D: $FE $30
    jr   nc, jr_018_6ED0                          ; $6E7F: $30 $4F

    ld   hl, wEntity0PosY                         ; $6E81: $21 $10 $C2
    add  hl, de                                   ; $6E84: $19
    ldh  a, [wActiveEntityPosY]                   ; $6E85: $F0 $EC
    sub  [hl]                                     ; $6E87: $96
    add  $20                                      ; $6E88: $C6 $20
    cp   $40                                      ; $6E8A: $FE $40
    jr   nc, jr_018_6ED0                          ; $6E8C: $30 $42

    ldh  a, [hLinkPositionY]                      ; $6E8E: $F0 $99
    push af                                       ; $6E90: $F5
    ldh  a, [hLinkPositionX]                      ; $6E91: $F0 $98
    push af                                       ; $6E93: $F5
    ld   a, [hl]                                  ; $6E94: $7E
    ldh  [hLinkPositionY], a                      ; $6E95: $E0 $99
    ld   hl, wEntity0PosX                         ; $6E97: $21 $00 $C2
    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    ldh  [hLinkPositionX], a                      ; $6E9C: $E0 $98
    push de                                       ; $6E9E: $D5
    ld   a, $20                                   ; $6E9F: $3E $20
    call label_3BB5                               ; $6EA1: $CD $B5 $3B
    pop  de                                       ; $6EA4: $D1
    ldh  a, [hScratchB]                           ; $6EA5: $F0 $D8
    cpl                                           ; $6EA7: $2F
    inc  a                                        ; $6EA8: $3C
    jr   nz, jr_018_6EAD                          ; $6EA9: $20 $02

    ld   a, $20                                   ; $6EAB: $3E $20

jr_018_6EAD:
    ld   hl, wEntity0SpeedX                       ; $6EAD: $21 $40 $C2
    add  hl, bc                                   ; $6EB0: $09
    ld   [hl], a                                  ; $6EB1: $77
    ldh  a, [hScratchA]                           ; $6EB2: $F0 $D7
    cpl                                           ; $6EB4: $2F
    inc  a                                        ; $6EB5: $3C
    jr   nz, jr_018_6EBA                          ; $6EB6: $20 $02

    ld   a, $20                                   ; $6EB8: $3E $20

jr_018_6EBA:
    ld   hl, wEntity0SpeedY                       ; $6EBA: $21 $50 $C2
    add  hl, bc                                   ; $6EBD: $09
    ld   [hl], a                                  ; $6EBE: $77
    pop  af                                       ; $6EBF: $F1
    ldh  [hLinkPositionX], a                      ; $6EC0: $E0 $98
    pop  af                                       ; $6EC2: $F1
    ldh  [hLinkPositionY], a                      ; $6EC3: $E0 $99
    call IncrementEntityWalkingAttr               ; $6EC5: $CD $12 $3B
    ld   [hl], $03                                ; $6EC8: $36 $03
    ld   hl, wEntitiesUnknownTableC               ; $6ECA: $21 $C0 $C2
    add  hl, bc                                   ; $6ECD: $09
    ld   [hl], $01                                ; $6ECE: $36 $01

jr_018_6ED0:
    dec  e                                        ; $6ED0: $1D
    ld   a, e                                     ; $6ED1: $7B
    cp   $FF                                      ; $6ED2: $FE $FF
    jr   nz, jr_018_6E59                          ; $6ED4: $20 $83

    ret                                           ; $6ED6: $C9

    nop                                           ; $6ED7: $00
    db   $FC                                      ; $6ED8: $FC
    ld   h, b                                     ; $6ED9: $60
    ld   [bc], a                                  ; $6EDA: $02
    nop                                           ; $6EDB: $00
    inc  b                                        ; $6EDC: $04
    ld   h, d                                     ; $6EDD: $62
    ld   [bc], a                                  ; $6EDE: $02
    nop                                           ; $6EDF: $00
    inc  c                                        ; $6EE0: $0C
    ld   h, b                                     ; $6EE1: $60
    ld   [hl+], a                                 ; $6EE2: $22
    nop                                           ; $6EE3: $00
    db   $FC                                      ; $6EE4: $FC
    ld   h, h                                     ; $6EE5: $64
    ld   [bc], a                                  ; $6EE6: $02
    nop                                           ; $6EE7: $00
    inc  b                                        ; $6EE8: $04
    ld   h, [hl]                                  ; $6EE9: $66
    ld   [bc], a                                  ; $6EEA: $02
    nop                                           ; $6EEB: $00
    inc  c                                        ; $6EEC: $0C
    ld   h, h                                     ; $6EED: $64
    ld   [hl+], a                                 ; $6EEE: $22
    nop                                           ; $6EEF: $00
    db   $FC                                      ; $6EF0: $FC
    ld   l, b                                     ; $6EF1: $68
    ld   [bc], a                                  ; $6EF2: $02
    nop                                           ; $6EF3: $00
    inc  b                                        ; $6EF4: $04
    ld   l, d                                     ; $6EF5: $6A
    ld   [bc], a                                  ; $6EF6: $02
    nop                                           ; $6EF7: $00
    inc  c                                        ; $6EF8: $0C
    ld   l, b                                     ; $6EF9: $68
    ld   [hl+], a                                 ; $6EFA: $22

func_018_6EFB:
    ldh  a, [hActiveEntityUnknownG]               ; $6EFB: $F0 $F1
    cp   $FF                                      ; $6EFD: $FE $FF
    ret  z                                        ; $6EFF: $C8

    rla                                           ; $6F00: $17
    rla                                           ; $6F01: $17
    and  $FC                                      ; $6F02: $E6 $FC
    ld   e, a                                     ; $6F04: $5F
    rla                                           ; $6F05: $17
    and  $F8                                      ; $6F06: $E6 $F8
    add  e                                        ; $6F08: $83
    ld   e, a                                     ; $6F09: $5F
    ld   d, b                                     ; $6F0A: $50
    ld   hl, $6ED7                                ; $6F0B: $21 $D7 $6E
    add  hl, de                                   ; $6F0E: $19
    ld   c, $03                                   ; $6F0F: $0E $03
    call label_3CE6                               ; $6F11: $CD $E6 $3C
    jp   label_3CD9                               ; $6F14: $C3 $D9 $3C

    ld   e, $03                                   ; $6F17: $1E $03
    ld   e, $63                                   ; $6F19: $1E $63
    ld   e, $43                                   ; $6F1B: $1E $43
    ld   e, $23                                   ; $6F1D: $1E $23

label_018_6F1F:
    ld   de, $6F17                                ; $6F1F: $11 $17 $6F
    call label_3BC0                               ; $6F22: $CD $C0 $3B
    call func_018_7DE8                            ; $6F25: $CD $E8 $7D
    call label_C56                                ; $6F28: $CD $56 $0C
    ldh  a, [hFrameCounter]                       ; $6F2B: $F0 $E7
    rra                                           ; $6F2D: $1F
    rra                                           ; $6F2E: $1F
    and  $01                                      ; $6F2F: $E6 $01
    call label_3B0C                               ; $6F31: $CD $0C $3B
    call label_3B70                               ; $6F34: $CD $70 $3B
    call label_3B44                               ; $6F37: $CD $44 $3B
    jr   c, jr_018_6F51                           ; $6F3A: $38 $15

    ld   hl, $C410                                ; $6F3C: $21 $10 $C4
    add  hl, bc                                   ; $6F3F: $09
    ld   a, [hl]                                  ; $6F40: $7E
    and  a                                        ; $6F41: $A7
    jr   z, jr_018_6F54                           ; $6F42: $28 $10

    ldh  a, [wActiveEntityPosX]                   ; $6F44: $F0 $EE
    ldh  [hScratchA], a                           ; $6F46: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $6F48: $F0 $EC
    ldh  [hScratchB], a                           ; $6F4A: $E0 $D8
    ld   a, $02                                   ; $6F4C: $3E $02
    call label_CC7                                ; $6F4E: $CD $C7 $0C

jr_018_6F51:
    jp   label_018_7F08                           ; $6F51: $C3 $08 $7F

jr_018_6F54:
    call func_018_7E5F                            ; $6F54: $CD $5F $7E
    call GetEntityTransitionCountdown             ; $6F57: $CD $05 $0C
    ret  nz                                       ; $6F5A: $C0

    call label_3B23                               ; $6F5B: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6F5E: $21 $A0 $C2
    add  hl, bc                                   ; $6F61: $09
    ld   a, [hl]                                  ; $6F62: $7E
    and  a                                        ; $6F63: $A7
    jp   nz, label_018_7F08                       ; $6F64: $C2 $08 $7F

    ret                                           ; $6F67: $C9

    ld   l, h                                     ; $6F68: $6C
    nop                                           ; $6F69: $00
    ld   l, h                                     ; $6F6A: $6C
    jr   nz, jr_018_6FDB                          ; $6F6B: $20 $6E

    nop                                           ; $6F6D: $00
    ld   l, [hl]                                  ; $6F6E: $6E
    jr   nz, @+$13                                ; $6F6F: $20 $11

    ld   l, b                                     ; $6F71: $68
    ld   l, a                                     ; $6F72: $6F
    call label_3BC0                               ; $6F73: $CD $C0 $3B
    call func_018_7DE8                            ; $6F76: $CD $E8 $7D
    call func_018_7E15                            ; $6F79: $CD $15 $7E
    call func_018_7E5F                            ; $6F7C: $CD $5F $7E
    ldh  a, [hFrameCounter]                       ; $6F7F: $F0 $E7
    and  $03                                      ; $6F81: $E6 $03
    jr   nz, jr_018_6F95                          ; $6F83: $20 $10

    ld   hl, wEntitiesPosZTable                   ; $6F85: $21 $10 $C3
    add  hl, bc                                   ; $6F88: $09
    ld   a, [hl]                                  ; $6F89: $7E
    sub  $10                                      ; $6F8A: $D6 $10
    jr   z, jr_018_6F95                           ; $6F8C: $28 $07

    and  $80                                      ; $6F8E: $E6 $80
    jr   z, jr_018_6F94                           ; $6F90: $28 $02

    inc  [hl]                                     ; $6F92: $34
    inc  [hl]                                     ; $6F93: $34

jr_018_6F94:
    dec  [hl]                                     ; $6F94: $35

jr_018_6F95:
    ldh  a, [hFrameCounter]                       ; $6F95: $F0 $E7
    rra                                           ; $6F97: $1F
    rra                                           ; $6F98: $1F
    rra                                           ; $6F99: $1F
    and  $01                                      ; $6F9A: $E6 $01
    call label_3B0C                               ; $6F9C: $CD $0C $3B
    ldh  a, [hActiveEntityWalking]                ; $6F9F: $F0 $F0
    rst  $00                                      ; $6FA1: $C7
    xor  b                                        ; $6FA2: $A8
    ld   l, a                                     ; $6FA3: $6F
    or   h                                        ; $6FA4: $B4
    ld   l, a                                     ; $6FA5: $6F
    jp   nz, $CD6F                                ; $6FA6: $C2 $6F $CD

    dec  b                                        ; $6FA9: $05
    inc  c                                        ; $6FAA: $0C
    ret  nz                                       ; $6FAB: $C0

    ld   [hl], $20                                ; $6FAC: $36 $20
    call label_3D7F                               ; $6FAE: $CD $7F $3D
    jp   IncrementEntityWalkingAttr               ; $6FB1: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $6FB4: $CD $05 $0C
    ret  nz                                       ; $6FB7: $C0

    ld   [hl], $20                                ; $6FB8: $36 $20
    ld   a, $20                                   ; $6FBA: $3E $20
    call label_3BAA                               ; $6FBC: $CD $AA $3B
    jp   IncrementEntityWalkingAttr               ; $6FBF: $C3 $12 $3B

    call label_3B39                               ; $6FC2: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6FC5: $CD $05 $0C
    ret  nz                                       ; $6FC8: $C0

    call label_3B23                               ; $6FC9: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6FCC: $21 $A0 $C2
    add  hl, bc                                   ; $6FCF: $09
    ld   a, [hl]                                  ; $6FD0: $7E
    and  a                                        ; $6FD1: $A7
    jp   nz, label_018_7F08                       ; $6FD2: $C2 $08 $7F

    ret                                           ; $6FD5: $C9

    ld   hl, wEntitiesUnknownTableB               ; $6FD6: $21 $B0 $C2
    add  hl, bc                                   ; $6FD9: $09
    ld   a, [hl]                                  ; $6FDA: $7E

jr_018_6FDB:
    and  a                                        ; $6FDB: $A7
    jp   nz, label_018_71A3                       ; $6FDC: $C2 $A3 $71

    ld   hl, $C340                                ; $6FDF: $21 $40 $C3
    add  hl, bc                                   ; $6FE2: $09
    set  6, [hl]                                  ; $6FE3: $CB $F6
    call func_018_7181                            ; $6FE5: $CD $81 $71
    call label_394D                               ; $6FE8: $CD $4D $39
    call label_3EE8                               ; $6FEB: $CD $E8 $3E
    call func_018_7DE8                            ; $6FEE: $CD $E8 $7D
    ld   a, [$C18F]                               ; $6FF1: $FA $8F $C1
    and  a                                        ; $6FF4: $A7
    jr   z, jr_018_7028                           ; $6FF5: $28 $31

    ld   hl, wEntitiesUnknownTableD               ; $6FF7: $21 $D0 $C2
    add  hl, bc                                   ; $6FFA: $09
    ld   a, [hl]                                  ; $6FFB: $7E
    and  a                                        ; $6FFC: $A7
    jr   nz, jr_018_7008                          ; $6FFD: $20 $09

    inc  [hl]                                     ; $6FFF: $34
    ld   a, $25                                   ; $7000: $3E $25
    call OpenDialog                               ; $7002: $CD $85 $23
    jp   label_018_7FB9                           ; $7005: $C3 $B9 $7F

jr_018_7008:
    cp   $01                                      ; $7008: $FE $01
    jr   nz, jr_018_7011                          ; $700A: $20 $05

    ld   a, $3F                                   ; $700C: $3E $3F
    ldh  [hNoiseSfx], a                           ; $700E: $E0 $F4
    inc  [hl]                                     ; $7010: $34

jr_018_7011:
    ld   hl, wEntitiesSpeedZTable                 ; $7011: $21 $20 $C3
    add  hl, bc                                   ; $7014: $09
    ld   [hl], $20                                ; $7015: $36 $20
    call func_018_7E98                            ; $7017: $CD $98 $7E
    ld   hl, wEntitiesPosZTable                   ; $701A: $21 $10 $C3
    add  hl, bc                                   ; $701D: $09
    ld   a, [hl]                                  ; $701E: $7E
    cp   $78                                      ; $701F: $FE $78
    ret  c                                        ; $7021: $D8

    call label_27DD                               ; $7022: $CD $DD $27
    jp   label_018_7F08                           ; $7025: $C3 $08 $7F

jr_018_7028:
    ldh  a, [hActiveEntityWalking]                ; $7028: $F0 $F0
    rst  $00                                      ; $702A: $C7
    add  hl, sp                                   ; $702B: $39
    ld   [hl], b                                  ; $702C: $70
    ld   b, c                                     ; $702D: $41
    ld   [hl], b                                  ; $702E: $70
    ld   e, c                                     ; $702F: $59
    ld   [hl], b                                  ; $7030: $70
    sub  l                                        ; $7031: $95
    ld   [hl], b                                  ; $7032: $70
    add  hl, bc                                   ; $7033: $09
    ld   [hl], c                                  ; $7034: $71
    inc  h                                        ; $7035: $24
    ld   [hl], c                                  ; $7036: $71
    ld   [hl], $71                                ; $7037: $36 $71
    ld   a, $07                                   ; $7039: $3E $07
    ld   [$D205], a                               ; $703B: $EA $05 $D2
    jp   IncrementEntityWalkingAttr               ; $703E: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $7041: $CD $05 $0C
    ld   [hl], $80                                ; $7044: $36 $80
    xor  a                                        ; $7046: $AF
    ld   [$D201], a                               ; $7047: $EA $01 $D2
    ld   [$D202], a                               ; $704A: $EA $02 $D2
    ld   a, [$D205]                               ; $704D: $FA $05 $D2
    inc  a                                        ; $7050: $3C
    and  $07                                      ; $7051: $E6 $07
    ld   [$D205], a                               ; $7053: $EA $05 $D2
    jp   IncrementEntityWalkingAttr               ; $7056: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $7059: $CD $05 $0C
    jr   nz, jr_018_7088                          ; $705C: $20 $2A

    ld   [hl], $FF                                ; $705E: $36 $FF
    ld   hl, $C430                                ; $7060: $21 $30 $C4
    add  hl, bc                                   ; $7063: $09
    res  1, [hl]                                  ; $7064: $CB $8E
    ld   e, $0F                                   ; $7066: $1E $0F
    ld   d, b                                     ; $7068: $50

jr_018_7069:
    ld   hl, wEntitiesTypeTable                   ; $7069: $21 $A0 $C3
    add  hl, de                                   ; $706C: $19
    ld   a, [hl]                                  ; $706D: $7E
    cp   $BC                                      ; $706E: $FE $BC
    jr   nz, jr_018_707F                          ; $7070: $20 $0D

    ld   hl, wEntitiesUnknownTableB               ; $7072: $21 $B0 $C2
    add  hl, de                                   ; $7075: $19
    ld   a, [hl]                                  ; $7076: $7E
    and  a                                        ; $7077: $A7
    jr   z, jr_018_707F                           ; $7078: $28 $05

    ld   hl, wEntity0State                        ; $707A: $21 $80 $C2
    add  hl, de                                   ; $707D: $19
    ld   [hl], b                                  ; $707E: $70

jr_018_707F:
    dec  e                                        ; $707F: $1D
    ld   a, e                                     ; $7080: $7B
    cp   $FF                                      ; $7081: $FE $FF
    jr   nz, jr_018_7069                          ; $7083: $20 $E4

    jp   IncrementEntityWalkingAttr               ; $7085: $C3 $12 $3B

jr_018_7088:
    ret                                           ; $7088: $C9

    ld   a, b                                     ; $7089: $78
    ld   l, b                                     ; $708A: $68
    ld   e, b                                     ; $708B: $58
    ld   c, b                                     ; $708C: $48
    jr   c, @+$2A                                 ; $708D: $38 $28

    nop                                           ; $708F: $00
    nop                                           ; $7090: $00
    nop                                           ; $7091: $00
    nop                                           ; $7092: $00
    nop                                           ; $7093: $00
    nop                                           ; $7094: $00
    call GetEntityTransitionCountdown             ; $7095: $CD $05 $0C
    jr   nz, jr_018_70A4                          ; $7098: $20 $0A

    ld   hl, $C430                                ; $709A: $21 $30 $C4
    add  hl, bc                                   ; $709D: $09
    set  1, [hl]                                  ; $709E: $CB $CE
    call IncrementEntityWalkingAttr               ; $70A0: $CD $12 $3B
    xor  a                                        ; $70A3: $AF

jr_018_70A4:
    and  $1F                                      ; $70A4: $E6 $1F
    jr   nz, jr_018_70FD                          ; $70A6: $20 $55

    ld   hl, $C3D0                                ; $70A8: $21 $D0 $C3
    add  hl, bc                                   ; $70AB: $09
    ld   a, [hl]                                  ; $70AC: $7E
    cp   $06                                      ; $70AD: $FE $06
    jr   nc, jr_018_70FD                          ; $70AF: $30 $4C

    ld   a, $BC                                   ; $70B1: $3E $BC
    call label_3B86                               ; $70B3: $CD $86 $3B
    jr   c, jr_018_70FD                           ; $70B6: $38 $45

    ld   a, $31                                   ; $70B8: $3E $31
    ldh  [hJingle], a                             ; $70BA: $E0 $F2
    ld   hl, $C3D0                                ; $70BC: $21 $D0 $C3
    add  hl, bc                                   ; $70BF: $09
    push bc                                       ; $70C0: $C5
    ld   c, [hl]                                  ; $70C1: $4E
    inc  [hl]                                     ; $70C2: $34
    ld   hl, $7089                                ; $70C3: $21 $89 $70
    add  hl, bc                                   ; $70C6: $09
    ld   a, [hl]                                  ; $70C7: $7E
    ld   hl, wEntity0PosX                         ; $70C8: $21 $00 $C2
    add  hl, de                                   ; $70CB: $19
    ld   [hl], a                                  ; $70CC: $77
    ld   hl, $708F                                ; $70CD: $21 $8F $70
    add  hl, bc                                   ; $70D0: $09
    ld   a, [hl]                                  ; $70D1: $7E
    ld   hl, wEntity0PosY                         ; $70D2: $21 $10 $C2
    add  hl, de                                   ; $70D5: $19
    ld   [hl], a                                  ; $70D6: $77
    ld   hl, wEntitiesPosZTable                   ; $70D7: $21 $10 $C3
    add  hl, de                                   ; $70DA: $19
    ld   [hl], $1C                                ; $70DB: $36 $1C
    ld   hl, $C3D0                                ; $70DD: $21 $D0 $C3
    add  hl, de                                   ; $70E0: $19
    ld   [hl], c                                  ; $70E1: $71
    ld   hl, $C430                                ; $70E2: $21 $30 $C4
    add  hl, de                                   ; $70E5: $19
    ld   a, [hl]                                  ; $70E6: $7E
    and  $7B                                      ; $70E7: $E6 $7B
    ld   [hl], a                                  ; $70E9: $77
    ld   hl, wEntitiesHealthTable                 ; $70EA: $21 $60 $C3
    add  hl, de                                   ; $70ED: $19
    ld   [hl], $01                                ; $70EE: $36 $01
    ld   hl, wEntitiesUnknownTableB               ; $70F0: $21 $B0 $C2
    add  hl, de                                   ; $70F3: $19
    ld   [hl], $01                                ; $70F4: $36 $01
    ld   hl, $C340                                ; $70F6: $21 $40 $C3
    add  hl, de                                   ; $70F9: $19
    set  6, [hl]                                  ; $70FA: $CB $F6
    pop  bc                                       ; $70FC: $C1

label_018_70FD:
jr_018_70FD:
    ldh  a, [hFrameCounter]                       ; $70FD: $F0 $E7
    rra                                           ; $70FF: $1F
    rra                                           ; $7100: $1F
    rra                                           ; $7101: $1F
    rra                                           ; $7102: $1F
    rra                                           ; $7103: $1F
    and  $01                                      ; $7104: $E6 $01
    jp   label_3B0C                               ; $7106: $C3 $0C $3B

    ld   a, [$D201]                               ; $7109: $FA $01 $D2
    cp   $06                                      ; $710C: $FE $06
    jr   nz, jr_018_7121                          ; $710E: $20 $11

    ld   hl, $C3D0                                ; $7110: $21 $D0 $C3
    add  hl, bc                                   ; $7113: $09
    ld   [hl], b                                  ; $7114: $70
    xor  a                                        ; $7115: $AF
    ld   [$D201], a                               ; $7116: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $7119: $CD $05 $0C
    ld   [hl], $40                                ; $711C: $36 $40
    call IncrementEntityWalkingAttr               ; $711E: $CD $12 $3B

jr_018_7121:
    jp   label_018_70FD                           ; $7121: $C3 $FD $70

    call GetEntityTransitionCountdown             ; $7124: $CD $05 $0C
    ret  nz                                       ; $7127: $C0

    ld   a, $FF                                   ; $7128: $3E $FF
    ld   [$D201], a                               ; $712A: $EA $01 $D2
    ld   hl, $C450                                ; $712D: $21 $50 $C4
    add  hl, bc                                   ; $7130: $09
    ld   [hl], $40                                ; $7131: $36 $40
    jp   IncrementEntityWalkingAttr               ; $7133: $C3 $12 $3B

    ld   hl, $C450                                ; $7136: $21 $50 $C4
    add  hl, bc                                   ; $7139: $09
    ld   a, [hl]                                  ; $713A: $7E
    and  a                                        ; $713B: $A7
    jr   nz, jr_018_7157                          ; $713C: $20 $19

    ld   a, [$C18F]                               ; $713E: $FA $8F $C1
    and  a                                        ; $7141: $A7
    jr   nz, jr_018_7152                          ; $7142: $20 $0E

    ld   hl, wEntitiesUnknownTableC               ; $7144: $21 $C0 $C2
    add  hl, bc                                   ; $7147: $09
    ld   a, [hl]                                  ; $7148: $7E
    and  a                                        ; $7149: $A7
    jr   nz, jr_018_7152                          ; $714A: $20 $06

    inc  [hl]                                     ; $714C: $34
    ld   a, $DF                                   ; $714D: $3E $DF
    call OpenDialogInTable1                       ; $714F: $CD $73 $23

jr_018_7152:
    call IncrementEntityWalkingAttr               ; $7152: $CD $12 $3B
    ld   [hl], $01                                ; $7155: $36 $01

jr_018_7157:
    ld   a, $02                                   ; $7157: $3E $02
    jp   label_3B0C                               ; $7159: $C3 $0C $3B

    ret                                           ; $715C: $C9

    nop                                           ; $715D: $00
    ld   hl, sp+$60                               ; $715E: $F8 $60
    ld   [bc], a                                  ; $7160: $02
    nop                                           ; $7161: $00
    nop                                           ; $7162: $00
    ld   h, d                                     ; $7163: $62
    ld   [bc], a                                  ; $7164: $02
    nop                                           ; $7165: $00
    ld   [RenderLoop.RenderLoop_TransitionSfx], sp; $7166: $08 $64 $02
    nop                                           ; $7169: $00
    ld   hl, sp+$66                               ; $716A: $F8 $66
    ld   [bc], a                                  ; $716C: $02
    nop                                           ; $716D: $00
    nop                                           ; $716E: $00
    ld   h, d                                     ; $716F: $62
    ld   [bc], a                                  ; $7170: $02
    nop                                           ; $7171: $00
    ld   [RenderLoop.RenderLoop_TransitionSfx], sp; $7172: $08 $64 $02
    stop                                          ; $7175: $10 $00
    ld   l, b                                     ; $7177: $68
    ld   [bc], a                                  ; $7178: $02
    nop                                           ; $7179: $00
    nop                                           ; $717A: $00
    ld   h, d                                     ; $717B: $62
    ld   [bc], a                                  ; $717C: $02
    nop                                           ; $717D: $00
    ld   [RenderLoop.RenderLoop_TransitionSfx], sp; $717E: $08 $64 $02

func_018_7181:
    ldh  a, [hActiveEntityUnknownG]               ; $7181: $F0 $F1
    rla                                           ; $7183: $17
    rla                                           ; $7184: $17
    and  $FC                                      ; $7185: $E6 $FC
    ld   e, a                                     ; $7187: $5F
    sla  a                                        ; $7188: $CB $27
    add  e                                        ; $718A: $83
    ld   e, a                                     ; $718B: $5F
    ld   d, b                                     ; $718C: $50
    ld   hl, $715D                                ; $718D: $21 $5D $71
    add  hl, de                                   ; $7190: $19
    ld   c, $03                                   ; $7191: $0E $03
    call label_3CE6                               ; $7193: $CD $E6 $3C
    ld   a, $01                                   ; $7196: $3E $01
    jp   label_3DA0                               ; $7198: $C3 $A0 $3D

    ld   l, [hl]                                  ; $719B: $6E
    nop                                           ; $719C: $00
    ld   l, [hl]                                  ; $719D: $6E
    jr   nz, @+$70                                ; $719E: $20 $6E

    ld   b, b                                     ; $71A0: $40
    ld   l, [hl]                                  ; $71A1: $6E
    ld   h, b                                     ; $71A2: $60

label_018_71A3:
    ld   de, $719B                                ; $71A3: $11 $9B $71
    call label_3BC0                               ; $71A6: $CD $C0 $3B
    call func_018_7DE8                            ; $71A9: $CD $E8 $7D
    call label_C56                                ; $71AC: $CD $56 $0C
    ldh  a, [hActiveEntityWalking]                ; $71AF: $F0 $F0
    rst  $00                                      ; $71B1: $C7
    inc  e                                        ; $71B2: $1C
    ld   [hl], d                                  ; $71B3: $72
    adc  b                                        ; $71B4: $88
    ld   [hl], d                                  ; $71B5: $72
    and  l                                        ; $71B6: $A5
    ld   [hl], d                                  ; $71B7: $72
    ret  z                                        ; $71B8: $C8

    ld   [hl], d                                  ; $71B9: $72
    db   $F4                                      ; $71BA: $F4
    ld   [hl], d                                  ; $71BB: $72
    jr   z, jr_018_71F6                           ; $71BC: $28 $38

    ld   c, b                                     ; $71BE: $48
    ld   e, b                                     ; $71BF: $58
    ld   l, b                                     ; $71C0: $68
    ld   a, b                                     ; $71C1: $78
    jr   c, jr_018_722C                           ; $71C2: $38 $68

    ld   c, b                                     ; $71C4: $48
    ld   e, b                                     ; $71C5: $58
    ld   c, b                                     ; $71C6: $48
    ld   e, b                                     ; $71C7: $58
    jr   jr_018_7152                              ; $71C8: $18 $88

    jr   z, jr_018_7244                           ; $71CA: $28 $78

    ld   h, b                                     ; $71CC: $60
    ld   b, b                                     ; $71CD: $40
    jr   z, @+$7A                                 ; $71CE: $28 $78

    ld   a, b                                     ; $71D0: $78
    jr   z, jr_018_7233                           ; $71D1: $28 $60

    ld   b, b                                     ; $71D3: $40
    jr   z, jr_018_724E                           ; $71D4: $28 $78

    jr   z, @+$7A                                 ; $71D6: $28 $78

    ld   d, b                                     ; $71D8: $50
    ld   d, b                                     ; $71D9: $50
    jr   c, jr_018_7244                           ; $71DA: $38 $68

    ld   d, b                                     ; $71DC: $50
    ld   d, b                                     ; $71DD: $50
    jr   c, @+$6A                                 ; $71DE: $38 $68

    jr   c, @+$6A                                 ; $71E0: $38 $68

    jr   c, @+$6A                                 ; $71E2: $38 $68

    jr   c, jr_018_724E                           ; $71E4: $38 $68

    jr   z, jr_018_7260                           ; $71E6: $28 $78

    jr   c, jr_018_7232                           ; $71E8: $38 $48

    ld   l, b                                     ; $71EA: $68
    ld   e, b                                     ; $71EB: $58
    jr   nz, jr_018_721E                          ; $71EC: $20 $30

    ld   b, b                                     ; $71EE: $40
    ld   b, b                                     ; $71EF: $40
    jr   nc, jr_018_7212                          ; $71F0: $30 $20

    ld   h, b                                     ; $71F2: $60
    ld   h, b                                     ; $71F3: $60
    ld   d, b                                     ; $71F4: $50
    ld   [hl], b                                  ; $71F5: $70

jr_018_71F6:
    ld   [hl], b                                  ; $71F6: $70
    ld   d, b                                     ; $71F7: $50
    jr   c, jr_018_7232                           ; $71F8: $38 $38

    ld   e, b                                     ; $71FA: $58
    ld   e, b                                     ; $71FB: $58
    ld   [hl], b                                  ; $71FC: $70
    ld   [hl], b                                  ; $71FD: $70
    jr   nc, jr_018_7230                          ; $71FE: $30 $30

    ld   [hl], b                                  ; $7200: $70
    ld   [hl], b                                  ; $7201: $70
    ld   d, b                                     ; $7202: $50
    ld   d, b                                     ; $7203: $50
    jr   nc, jr_018_7276                          ; $7204: $30 $70

    ld   [hl], b                                  ; $7206: $70
    jr   nc, jr_018_7239                          ; $7207: $30 $30

    ld   [hl], b                                  ; $7209: $70
    ld   b, b                                     ; $720A: $40
    ld   h, b                                     ; $720B: $60
    ld   [hl], b                                  ; $720C: $70
    jr   nc, @+$62                                ; $720D: $30 $60

    ld   b, b                                     ; $720F: $40
    jr   nc, jr_018_7242                          ; $7210: $30 $30

jr_018_7212:
    ld   d, b                                     ; $7212: $50
    ld   d, b                                     ; $7213: $50
    ld   [hl], b                                  ; $7214: $70
    ld   [hl], b                                  ; $7215: $70
    ld   b, b                                     ; $7216: $40
    ld   b, b                                     ; $7217: $40
    ld   d, b                                     ; $7218: $50
    ld   b, b                                     ; $7219: $40
    ld   d, b                                     ; $721A: $50
    ld   b, b                                     ; $721B: $40
    ldh  a, [hLinkPositionX]                      ; $721C: $F0 $98

jr_018_721E:
    push af                                       ; $721E: $F5
    ldh  a, [hLinkPositionY]                      ; $721F: $F0 $99
    push af                                       ; $7221: $F5
    ld   a, [$D205]                               ; $7222: $FA $05 $D2
    rla                                           ; $7225: $17
    and  $FE                                      ; $7226: $E6 $FE
    ld   e, a                                     ; $7228: $5F
    rla                                           ; $7229: $17
    and  $FC                                      ; $722A: $E6 $FC

jr_018_722C:
    add  e                                        ; $722C: $83
    ld   hl, $C3D0                                ; $722D: $21 $D0 $C3

jr_018_7230:
    add  hl, bc                                   ; $7230: $09
    add  [hl]                                     ; $7231: $86

jr_018_7232:
    ld   e, a                                     ; $7232: $5F

jr_018_7233:
    ld   d, b                                     ; $7233: $50
    ld   hl, $71BC                                ; $7234: $21 $BC $71
    add  hl, de                                   ; $7237: $19
    ld   a, [hl]                                  ; $7238: $7E

jr_018_7239:
    ldh  [hLinkPositionX], a                      ; $7239: $E0 $98
    ld   hl, $71EC                                ; $723B: $21 $EC $71
    add  hl, de                                   ; $723E: $19
    ld   a, [hl]                                  ; $723F: $7E
    ldh  [hLinkPositionY], a                      ; $7240: $E0 $99

jr_018_7242:
    ldh  a, [hFrameCounter]                       ; $7242: $F0 $E7

jr_018_7244:
    xor  c                                        ; $7244: $A9
    and  $03                                      ; $7245: $E6 $03
    jr   nz, jr_018_724E                          ; $7247: $20 $05

    ld   a, $10                                   ; $7249: $3E $10
    call label_3BAA                               ; $724B: $CD $AA $3B

jr_018_724E:
    ld   hl, wActiveEntityPosX                    ; $724E: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $7251: $F0 $98
    sub  [hl]                                     ; $7253: $96
    add  $03                                      ; $7254: $C6 $03
    cp   $06                                      ; $7256: $FE $06
    jr   nc, jr_018_726D                          ; $7258: $30 $13

    ld   hl, wActiveEntityPosY                    ; $725A: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $725D: $F0 $99
    sub  [hl]                                     ; $725F: $96

jr_018_7260:
    add  $03                                      ; $7260: $C6 $03
    cp   $06                                      ; $7262: $FE $06
    jr   nc, jr_018_726D                          ; $7264: $30 $07

    ld   hl, $D201                                ; $7266: $21 $01 $D2
    inc  [hl]                                     ; $7269: $34
    call IncrementEntityWalkingAttr               ; $726A: $CD $12 $3B

jr_018_726D:
    pop  af                                       ; $726D: $F1
    ldh  [hLinkPositionY], a                      ; $726E: $E0 $99
    pop  af                                       ; $7270: $F1
    ldh  [hLinkPositionX], a                      ; $7271: $E0 $98

func_018_7273:
    call func_018_7E5F                            ; $7273: $CD $5F $7E

label_018_7276:
jr_018_7276:
    ldh  a, [hFrameCounter]                       ; $7276: $F0 $E7
    rra                                           ; $7278: $1F
    rra                                           ; $7279: $1F
    rra                                           ; $727A: $1F
    and  $01                                      ; $727B: $E6 $01
    jp   label_3B0C                               ; $727D: $C3 $0C $3B

    inc  b                                        ; $7280: $04
    inc  c                                        ; $7281: $0C
    inc  d                                        ; $7282: $14
    inc  e                                        ; $7283: $1C
    inc  h                                        ; $7284: $24
    inc  l                                        ; $7285: $2C
    inc  [hl]                                     ; $7286: $34
    inc  a                                        ; $7287: $3C
    ld   a, [$D201]                               ; $7288: $FA $01 $D2
    cp   $FF                                      ; $728B: $FE $FF
    jr   nz, jr_018_72A2                          ; $728D: $20 $13

    ld   hl, $C3D0                                ; $728F: $21 $D0 $C3
    add  hl, bc                                   ; $7292: $09
    ld   e, [hl]                                  ; $7293: $5E
    ld   d, b                                     ; $7294: $50
    ld   hl, $7280                                ; $7295: $21 $80 $72
    add  hl, de                                   ; $7298: $19
    ld   a, [hl]                                  ; $7299: $7E
    ld   hl, $C450                                ; $729A: $21 $50 $C4
    add  hl, bc                                   ; $729D: $09
    ld   [hl], a                                  ; $729E: $77
    call IncrementEntityWalkingAttr               ; $729F: $CD $12 $3B

jr_018_72A2:
    jp   label_018_7276                           ; $72A2: $C3 $76 $72

    ld   hl, $C450                                ; $72A5: $21 $50 $C4
    add  hl, bc                                   ; $72A8: $09
    ld   a, [hl]                                  ; $72A9: $7E
    and  a                                        ; $72AA: $A7
    jr   nz, jr_018_72C5                          ; $72AB: $20 $18

    ld   hl, $C340                                ; $72AD: $21 $40 $C3
    add  hl, bc                                   ; $72B0: $09
    res  6, [hl]                                  ; $72B1: $CB $B6
    ld   a, $20                                   ; $72B3: $3E $20
    call label_3BAA                               ; $72B5: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $72B8: $21 $20 $C3
    add  hl, bc                                   ; $72BB: $09
    ld   [hl], $F4                                ; $72BC: $36 $F4
    ld   a, $31                                   ; $72BE: $3E $31
    ldh  [hJingle], a                             ; $72C0: $E0 $F2
    call IncrementEntityWalkingAttr               ; $72C2: $CD $12 $3B

jr_018_72C5:
    jp   label_018_7276                           ; $72C5: $C3 $76 $72

jr_018_72C8:
    call label_3B39                               ; $72C8: $CD $39 $3B
    call func_018_7273                            ; $72CB: $CD $73 $72
    call func_018_7E98                            ; $72CE: $CD $98 $7E
    ldh  a, [hFrameCounter]                       ; $72D1: $F0 $E7
    and  $03                                      ; $72D3: $E6 $03
    jr   nz, jr_018_72E1                          ; $72D5: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $72D7: $21 $20 $C3
    add  hl, bc                                   ; $72DA: $09
    ld   a, [hl]                                  ; $72DB: $7E
    cp   $0C                                      ; $72DC: $FE $0C
    jr   z, jr_018_72E1                           ; $72DE: $28 $01

    inc  [hl]                                     ; $72E0: $34

jr_018_72E1:
    ldh  a, [wActiveEntityPosY]                   ; $72E1: $F0 $EC
    cp   $88                                      ; $72E3: $FE $88
    jr   nc, jr_018_72EC                          ; $72E5: $30 $05

    ldh  a, [wActiveEntityPosX]                   ; $72E7: $F0 $EE
    cp   $A8                                      ; $72E9: $FE $A8
    ret  c                                        ; $72EB: $D8

jr_018_72EC:
    call IncrementEntityWalkingAttr               ; $72EC: $CD $12 $3B
    ld   a, $FF                                   ; $72EF: $3E $FF
    jp   label_3B0C                               ; $72F1: $C3 $0C $3B

    ret                                           ; $72F4: $C9

    ld   a, d                                     ; $72F5: $7A
    ld   d, $7E                                   ; $72F6: $16 $7E
    ld   [hl], $7A                                ; $72F8: $36 $7A
    ld   [hl], $7E                                ; $72FA: $36 $7E
    ld   d, $7C                                   ; $72FC: $16 $7C
    ld   d, $7C                                   ; $72FE: $16 $7C
    ld   [hl], $F0                                ; $7300: $36 $F0
    ld   hl, sp-$1A                               ; $7302: $F8 $E6
    jr   nz, jr_018_72C8                          ; $7304: $20 $C2

    ld   [$217F], sp                              ; $7306: $08 $7F $21
    or   b                                        ; $7309: $B0
    jp   nz, $7E09                                ; $730A: $C2 $09 $7E

    and  a                                        ; $730D: $A7
    jr   z, jr_018_7330                           ; $730E: $28 $20

    ld   de, $72F5                                ; $7310: $11 $F5 $72
    call label_3C77                               ; $7313: $CD $77 $3C
    call func_018_7DE8                            ; $7316: $CD $E8 $7D
    call func_018_7E5F                            ; $7319: $CD $5F $7E
    call func_018_7E98                            ; $731C: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $731F: $21 $20 $C3
    add  hl, bc                                   ; $7322: $09
    dec  [hl]                                     ; $7323: $35
    dec  [hl]                                     ; $7324: $35
    ld   hl, wEntitiesPosZTable                   ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   a, [hl]                                  ; $7329: $7E
    and  $80                                      ; $732A: $E6 $80
    jp   nz, label_018_7F08                       ; $732C: $C2 $08 $7F

    ret                                           ; $732F: $C9

jr_018_7330:
    ld   hl, $C420                                ; $7330: $21 $20 $C4
    add  hl, bc                                   ; $7333: $09
    ld   a, [hl]                                  ; $7334: $7E
    and  a                                        ; $7335: $A7
    jr   z, jr_018_733C                           ; $7336: $28 $04

    ld   a, $07                                   ; $7338: $3E $07
    ldh  [hActiveEntityUnknownG], a               ; $733A: $E0 $F1

jr_018_733C:
    call func_018_766A                            ; $733C: $CD $6A $76
    ldh  a, [hActiveEntityWalking]                ; $733F: $F0 $F0
    and  a                                        ; $7341: $A7
    jr   nz, jr_018_7363                          ; $7342: $20 $1F

    ld   a, [$DB4A]                               ; $7344: $FA $4A $DB
    cp   $02                                      ; $7347: $FE $02
    jr   nz, jr_018_7363                          ; $7349: $20 $18

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $734B: $FA $66 $C1
    and  a                                        ; $734E: $A7
    jr   z, jr_018_7363                           ; $734F: $28 $12

    call IncrementEntityWalkingAttr               ; $7351: $CD $12 $3B
    ld   hl, $C430                                ; $7354: $21 $30 $C4
    add  hl, bc                                   ; $7357: $09
    set  7, [hl]                                  ; $7358: $CB $FE
    set  2, [hl]                                  ; $735A: $CB $D6
    ld   hl, wEntitiesHealthTable                 ; $735C: $21 $60 $C3
    add  hl, bc                                   ; $735F: $09
    ld   [hl], $10                                ; $7360: $36 $10
    ret                                           ; $7362: $C9

jr_018_7363:
    ldh  a, [hActiveEntityState]                  ; $7363: $F0 $EA
    cp   $05                                      ; $7365: $FE $05
    jr   z, jr_018_737E                           ; $7367: $28 $15

    call func_018_7F0F                            ; $7369: $CD $0F $7F
    ld   hl, wEntity0State                        ; $736C: $21 $80 $C2
    add  hl, bc                                   ; $736F: $09
    ld   a, [hl]                                  ; $7370: $7E
    and  a                                        ; $7371: $A7
    jr   nz, jr_018_737D                          ; $7372: $20 $09

    ld   hl, $D810                                ; $7374: $21 $10 $D8
    set  5, [hl]                                  ; $7377: $CB $EE
    ld   a, $02                                   ; $7379: $3E $02
    ldh  [hJingle], a                             ; $737B: $E0 $F2

jr_018_737D:
    ret                                           ; $737D: $C9

jr_018_737E:
    call func_018_7DE8                            ; $737E: $CD $E8 $7D
    call label_C56                                ; $7381: $CD $56 $0C
    call label_3B70                               ; $7384: $CD $70 $3B
    ldh  a, [hActiveEntityWalking]                ; $7387: $F0 $F0
    cp   $05                                      ; $7389: $FE $05
    jr   nc, jr_018_7392                          ; $738B: $30 $05

    call func_018_7D36                            ; $738D: $CD $36 $7D
    jr   jr_018_7395                              ; $7390: $18 $03

jr_018_7392:
    call label_3B44                               ; $7392: $CD $44 $3B

jr_018_7395:
    ldh  a, [hActiveEntityWalking]                ; $7395: $F0 $F0
    rst  $00                                      ; $7397: $C7
    or   b                                        ; $7398: $B0
    ld   [hl], e                                  ; $7399: $73
    or   c                                        ; $739A: $B1
    ld   [hl], e                                  ; $739B: $73
    call nz, $0C73                                ; $739C: $C4 $73 $0C
    ld   [hl], h                                  ; $739F: $74
    ld   a, d                                     ; $73A0: $7A
    ld   [hl], h                                  ; $73A1: $74
    sbc  e                                        ; $73A2: $9B
    ld   [hl], h                                  ; $73A3: $74
    push bc                                       ; $73A4: $C5
    ld   [hl], h                                  ; $73A5: $74
    call nc, $EA74                                ; $73A6: $D4 $74 $EA
    ld   [hl], h                                  ; $73A9: $74
    rra                                           ; $73AA: $1F
    ld   [hl], l                                  ; $73AB: $75
    add  hl, sp                                   ; $73AC: $39
    ld   [hl], l                                  ; $73AD: $75
    ld   c, h                                     ; $73AE: $4C
    ld   [hl], l                                  ; $73AF: $75
    ret                                           ; $73B0: $C9

    call GetEntityTransitionCountdown             ; $73B1: $CD $05 $0C
    ld   [hl], $80                                ; $73B4: $36 $80
    ld   a, $39                                   ; $73B6: $3E $39
    ld   [wWorldMusicTrack], a                    ; $73B8: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $73BB: $E0 $B0
    ldh  [$FFBD], a                               ; $73BD: $E0 $BD
    ldh  [hNextWorldMusicTrack], a                ; $73BF: $E0 $BF
    jp   IncrementEntityWalkingAttr               ; $73C1: $C3 $12 $3B

    ldh  a, [wActiveEntityPosX]                   ; $73C4: $F0 $EE
    ld   hl, $C440                                ; $73C6: $21 $40 $C4
    add  hl, bc                                   ; $73C9: $09
    ld   [hl], a                                  ; $73CA: $77
    ldh  a, [wActiveEntityPosY]                   ; $73CB: $F0 $EC
    ld   hl, wEntitiesUnknownTableD               ; $73CD: $21 $D0 $C2
    add  hl, bc                                   ; $73D0: $09
    sub  $14                                      ; $73D1: $D6 $14
    ld   [hl], a                                  ; $73D3: $77
    call GetEntityTransitionCountdown             ; $73D4: $CD $05 $0C
    jr   nz, jr_018_73DE                          ; $73D7: $20 $05

    ld   [hl], $FF                                ; $73D9: $36 $FF
    jp   IncrementEntityWalkingAttr               ; $73DB: $C3 $12 $3B

jr_018_73DE:
    ld   e, $08                                   ; $73DE: $1E $08
    and  $04                                      ; $73E0: $E6 $04
    jr   z, jr_018_73E6                           ; $73E2: $28 $02

    ld   e, $F8                                   ; $73E4: $1E $F8

jr_018_73E6:
    ld   hl, wEntity0SpeedX                       ; $73E6: $21 $40 $C2
    add  hl, bc                                   ; $73E9: $09
    ld   [hl], e                                  ; $73EA: $73
    jp   label_018_7E6C                           ; $73EB: $C3 $6C $7E

    ld   hl, sp+$08                               ; $73EE: $F8 $08
    stop                                          ; $73F0: $10 $00
    nop                                           ; $73F2: $00
    ld   [$00F0], sp                              ; $73F3: $08 $F0 $00
    ldh  a, [rP1]                                 ; $73F6: $F0 $00
    ldh  a, [hActiveEntityWalking]                ; $73F8: $F0 $F0
    ld   hl, sp+$08                               ; $73FA: $F8 $08
    ld   [$F8F8], sp                              ; $73FC: $08 $F8 $F8
    ld   [$02FC], sp                              ; $73FF: $08 $FC $02
    db   $FC                                      ; $7402: $FC
    ld   [bc], a                                  ; $7403: $02
    db   $FC                                      ; $7404: $FC
    db   $FC                                      ; $7405: $FC
    db   $10                                      ; $7406: $10
    db   $10                                      ; $7407: $10
    db   $10                                      ; $7408: $10
    db   $10                                      ; $7409: $10
    db   $10                                      ; $740A: $10
    db   $10                                      ; $740B: $10
    call GetEntityTransitionCountdown             ; $740C: $CD $05 $0C
    jr   nz, jr_018_7416                          ; $740F: $20 $05

    ld   [hl], $80                                ; $7411: $36 $80
    jp   IncrementEntityWalkingAttr               ; $7413: $C3 $12 $3B

jr_018_7416:
    and  $1F                                      ; $7416: $E6 $1F
    jr   nz, jr_018_7479                          ; $7418: $20 $5F

    ldh  a, [hActiveEntityUnknownG]               ; $741A: $F0 $F1
    cp   $06                                      ; $741C: $FE $06
    jr   z, jr_018_746E                           ; $741E: $28 $4E

    ld   a, $13                                   ; $7420: $3E $13
    ldh  [hNoiseSfx], a                           ; $7422: $E0 $F4
    ld   a, $7F                                   ; $7424: $3E $7F
    call label_3B86                               ; $7426: $CD $86 $3B
    push bc                                       ; $7429: $C5
    ldh  a, [hActiveEntityUnknownG]               ; $742A: $F0 $F1
    ld   c, a                                     ; $742C: $4F
    ld   hl, wEntitiesUnknownTableG               ; $742D: $21 $B0 $C3
    add  hl, de                                   ; $7430: $19
    ld   [hl], a                                  ; $7431: $77
    ld   hl, $73EE                                ; $7432: $21 $EE $73
    add  hl, bc                                   ; $7435: $09
    ldh  a, [hScratchA]                           ; $7436: $F0 $D7
    add  [hl]                                     ; $7438: $86
    ld   hl, wEntity0PosX                         ; $7439: $21 $00 $C2
    add  hl, de                                   ; $743C: $19
    ld   [hl], a                                  ; $743D: $77
    ld   hl, $73F4                                ; $743E: $21 $F4 $73
    add  hl, bc                                   ; $7441: $09
    ldh  a, [hScratchB]                           ; $7442: $F0 $D8
    add  [hl]                                     ; $7444: $86
    ld   hl, wEntity0PosY                         ; $7445: $21 $10 $C2
    add  hl, de                                   ; $7448: $19
    ld   [hl], a                                  ; $7449: $77
    ld   hl, $73FA                                ; $744A: $21 $FA $73
    add  hl, bc                                   ; $744D: $09
    ld   a, [hl]                                  ; $744E: $7E
    ld   hl, wEntity0SpeedX                       ; $744F: $21 $40 $C2
    add  hl, de                                   ; $7452: $19
    ld   [hl], a                                  ; $7453: $77
    ld   hl, $7400                                ; $7454: $21 $00 $74
    add  hl, bc                                   ; $7457: $09
    ld   a, [hl]                                  ; $7458: $7E
    ld   hl, wEntity0SpeedY                       ; $7459: $21 $50 $C2
    add  hl, de                                   ; $745C: $19
    ld   [hl], a                                  ; $745D: $77
    ld   hl, $7406                                ; $745E: $21 $06 $74
    add  hl, bc                                   ; $7461: $09
    ld   a, [hl]                                  ; $7462: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $7463: $21 $20 $C3
    add  hl, de                                   ; $7466: $19
    ld   [hl], a                                  ; $7467: $77
    ld   hl, wEntitiesUnknownTableB               ; $7468: $21 $B0 $C2
    add  hl, de                                   ; $746B: $19
    ld   [hl], a                                  ; $746C: $77
    pop  bc                                       ; $746D: $C1

jr_018_746E:
    ld   hl, wEntitiesUnknownTableG               ; $746E: $21 $B0 $C3
    add  hl, bc                                   ; $7471: $09
    ld   a, [hl]                                  ; $7472: $7E
    cp   $07                                      ; $7473: $FE $07
    jr   z, jr_018_7479                           ; $7475: $28 $02

    inc  a                                        ; $7477: $3C
    ld   [hl], a                                  ; $7478: $77

jr_018_7479:
    ret                                           ; $7479: $C9

    call GetEntityTransitionCountdown             ; $747A: $CD $05 $0C
    jr   nz, jr_018_7484                          ; $747D: $20 $05

    ld   [hl], $80                                ; $747F: $36 $80
    jp   IncrementEntityWalkingAttr               ; $7481: $C3 $12 $3B

jr_018_7484:
    ld   e, $07                                   ; $7484: $1E $07
    cp   $60                                      ; $7486: $FE $60
    jr   nc, jr_018_7496                          ; $7488: $30 $0C

    cp   $40                                      ; $748A: $FE $40
    jr   nc, jr_018_7497                          ; $748C: $30 $09

    cp   $30                                      ; $748E: $FE $30
    jr   c, jr_018_7496                           ; $7490: $38 $04

    cp   $20                                      ; $7492: $FE $20
    jr   c, jr_018_7497                           ; $7494: $38 $01

jr_018_7496:
    inc  e                                        ; $7496: $1C

jr_018_7497:
    ld   a, e                                     ; $7497: $7B
    jp   label_3B0C                               ; $7498: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $749B: $CD $05 $0C
    jr   nz, jr_018_74BC                          ; $749E: $20 $1C

    ld   [hl], $40                                ; $74A0: $36 $40
    ld   hl, $C340                                ; $74A2: $21 $40 $C3
    add  hl, bc                                   ; $74A5: $09
    res  7, [hl]                                  ; $74A6: $CB $BE
    ld   hl, $C430                                ; $74A8: $21 $30 $C4
    add  hl, bc                                   ; $74AB: $09
    res  6, [hl]                                  ; $74AC: $CB $B6
    call IncrementEntityWalkingAttr               ; $74AE: $CD $12 $3B
    ldh  a, [wActiveEntityPosX]                   ; $74B1: $F0 $EE
    ld   [$D201], a                               ; $74B3: $EA $01 $D2
    ldh  a, [wActiveEntityPosY]                   ; $74B6: $F0 $EC
    ld   [$D202], a                               ; $74B8: $EA $02 $D2
    ret                                           ; $74BB: $C9

jr_018_74BC:
    ld   hl, wEntity0SpeedY                       ; $74BC: $21 $50 $C2
    add  hl, bc                                   ; $74BF: $09
    ld   [hl], $04                                ; $74C0: $36 $04
    jp   label_018_7E62                           ; $74C2: $C3 $62 $7E

    call GetEntityTransitionCountdown             ; $74C5: $CD $05 $0C
    ret  nz                                       ; $74C8: $C0

    ld   [hl], $20                                ; $74C9: $36 $20
    ld   hl, wEntity0SpeedX                       ; $74CB: $21 $40 $C2
    add  hl, bc                                   ; $74CE: $09
    ld   [hl], $08                                ; $74CF: $36 $08
    jp   IncrementEntityWalkingAttr               ; $74D1: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $74D4: $CD $05 $0C
    jr   nz, jr_018_74E7                          ; $74D7: $20 $0E

    call GetEntityTransitionCountdown             ; $74D9: $CD $05 $0C
    call GetRandomByte                            ; $74DC: $CD $0D $28
    and  $1F                                      ; $74DF: $E6 $1F
    add  $08                                      ; $74E1: $C6 $08
    ld   [hl], a                                  ; $74E3: $77
    call IncrementEntityWalkingAttr               ; $74E4: $CD $12 $3B

jr_018_74E7:
    jp   label_018_7E6C                           ; $74E7: $C3 $6C $7E

    call GetEntityTransitionCountdown             ; $74EA: $CD $05 $0C
    jr   nz, jr_018_751E                          ; $74ED: $20 $2F

    ld   hl, $C390                                ; $74EF: $21 $90 $C3
    add  hl, bc                                   ; $74F2: $09
    inc  [hl]                                     ; $74F3: $34
    ld   a, [hl]                                  ; $74F4: $7E
    cp   $03                                      ; $74F5: $FE $03
    jr   c, jr_018_750C                           ; $74F7: $38 $13

    call GetRandomByte                            ; $74F9: $CD $0D $28
    and  $01                                      ; $74FC: $E6 $01
    jr   nz, jr_018_750C                          ; $74FE: $20 $0C

    call IncrementEntityWalkingAttr               ; $7500: $CD $12 $3B
    ld   a, $09                                   ; $7503: $3E $09
    ld   [hl], a                                  ; $7505: $77
    call GetEntityTransitionCountdown             ; $7506: $CD $05 $0C
    ld   [hl], $20                                ; $7509: $36 $20
    ret                                           ; $750B: $C9

jr_018_750C:
    call GetEntityTransitionCountdown             ; $750C: $CD $05 $0C
    ld   [hl], $40                                ; $750F: $36 $40
    call IncrementEntityWalkingAttr               ; $7511: $CD $12 $3B
    dec  [hl]                                     ; $7514: $35
    dec  [hl]                                     ; $7515: $35
    ld   hl, wEntity0SpeedX                       ; $7516: $21 $40 $C2
    add  hl, bc                                   ; $7519: $09
    ld   a, [hl]                                  ; $751A: $7E
    cpl                                           ; $751B: $2F
    inc  a                                        ; $751C: $3C
    ld   [hl], a                                  ; $751D: $77

jr_018_751E:
    ret                                           ; $751E: $C9

    call GetEntityTransitionCountdown             ; $751F: $CD $05 $0C
    ret  nz                                       ; $7522: $C0

    ld   [hl], $20                                ; $7523: $36 $20
    ld   a, $18                                   ; $7525: $3E $18
    call label_3BAA                               ; $7527: $CD $AA $3B
    ld   hl, wEntity0SpeedY                       ; $752A: $21 $50 $C2
    add  hl, bc                                   ; $752D: $09
    ld   a, [hl]                                  ; $752E: $7E
    bit  7, [hl]                                  ; $752F: $CB $7E
    jr   z, jr_018_7536                           ; $7531: $28 $03

    cpl                                           ; $7533: $2F
    inc  a                                        ; $7534: $3C
    ld   [hl], a                                  ; $7535: $77

jr_018_7536:
    jp   IncrementEntityWalkingAttr               ; $7536: $C3 $12 $3B

    ld   hl, $C420                                ; $7539: $21 $20 $C4
    add  hl, bc                                   ; $753C: $09
    ld   a, [hl]                                  ; $753D: $7E
    and  a                                        ; $753E: $A7
    jr   nz, jr_018_7546                          ; $753F: $20 $05

    call GetEntityTransitionCountdown             ; $7541: $CD $05 $0C
    jr   nz, jr_018_7549                          ; $7544: $20 $03

jr_018_7546:
    call IncrementEntityWalkingAttr               ; $7546: $CD $12 $3B

jr_018_7549:
    jp   label_018_7E5F                           ; $7549: $C3 $5F $7E

    ldh  a, [hLinkPositionX]                      ; $754C: $F0 $98
    push af                                       ; $754E: $F5
    ldh  a, [hLinkPositionY]                      ; $754F: $F0 $99
    push af                                       ; $7551: $F5
    ld   a, [$D201]                               ; $7552: $FA $01 $D2
    ldh  [hLinkPositionX], a                      ; $7555: $E0 $98
    ld   a, [$D202]                               ; $7557: $FA $02 $D2
    ldh  [hLinkPositionY], a                      ; $755A: $E0 $99
    ld   a, $08                                   ; $755C: $3E $08
    call label_3BAA                               ; $755E: $CD $AA $3B
    ld   a, [$D201]                               ; $7561: $FA $01 $D2
    ld   hl, wActiveEntityPosX                    ; $7564: $21 $EE $FF
    sub  [hl]                                     ; $7567: $96
    add  $01                                      ; $7568: $C6 $01
    cp   $02                                      ; $756A: $FE $02
    jr   nc, jr_018_7585                          ; $756C: $30 $17

    ld   a, [$D202]                               ; $756E: $FA $02 $D2
    ld   hl, wActiveEntityPosY                    ; $7571: $21 $EC $FF
    sub  [hl]                                     ; $7574: $96
    add  $01                                      ; $7575: $C6 $01
    cp   $02                                      ; $7577: $FE $02
    jr   nc, jr_018_7585                          ; $7579: $30 $0A

    call IncrementEntityWalkingAttr               ; $757B: $CD $12 $3B
    ld   [hl], $06                                ; $757E: $36 $06
    call GetEntityTransitionCountdown             ; $7580: $CD $05 $0C
    ld   [hl], $20                                ; $7583: $36 $20

jr_018_7585:
    pop  af                                       ; $7585: $F1
    ldh  [hLinkPositionY], a                      ; $7586: $E0 $99
    pop  af                                       ; $7588: $F1
    ldh  [hLinkPositionX], a                      ; $7589: $E0 $98
    jp   label_018_7E5F                           ; $758B: $C3 $5F $7E

    ldh  a, [hRoomStatus]                         ; $758E: $F0 $F8
    ld   a, d                                     ; $7590: $7A
    ld   d, $F0                                   ; $7591: $16 $F0
    nop                                           ; $7593: $00
    ld   a, h                                     ; $7594: $7C
    ld   d, $F0                                   ; $7595: $16 $F0
    ld   [$367C], sp                              ; $7597: $08 $7C $36
    ldh  a, [rNR10]                               ; $759A: $F0 $10
    ld   a, d                                     ; $759C: $7A
    ld   [hl], $00                                ; $759D: $36 $00
    nop                                           ; $759F: $00
    ld   a, [hl]                                  ; $75A0: $7E
    ld   d, $00                                   ; $75A1: $16 $00
    ld   [$367E], sp                              ; $75A3: $08 $7E $36
    ldh  a, [hRoomStatus]                         ; $75A6: $F0 $F8
    ld   [hl], b                                  ; $75A8: $70
    rlca                                          ; $75A9: $07
    ldh  a, [rP1]                                 ; $75AA: $F0 $00
    ld   a, h                                     ; $75AC: $7C
    ld   d, $F0                                   ; $75AD: $16 $F0
    ld   [$367C], sp                              ; $75AF: $08 $7C $36
    ldh  a, [rNR10]                               ; $75B2: $F0 $10
    ld   a, d                                     ; $75B4: $7A
    ld   [hl], $00                                ; $75B5: $36 $00
    nop                                           ; $75B7: $00
    ld   a, [hl]                                  ; $75B8: $7E
    ld   d, $00                                   ; $75B9: $16 $00
    ld   [$367E], sp                              ; $75BB: $08 $7E $36
    ldh  a, [hRoomStatus]                         ; $75BE: $F0 $F8
    ld   [hl], b                                  ; $75C0: $70
    rlca                                          ; $75C1: $07
    ldh  a, [rP1]                                 ; $75C2: $F0 $00
    ld   a, h                                     ; $75C4: $7C
    ld   d, $F0                                   ; $75C5: $16 $F0
    ld   [$367C], sp                              ; $75C7: $08 $7C $36
    ldh  a, [rNR10]                               ; $75CA: $F0 $10
    ld   a, d                                     ; $75CC: $7A
    ld   [hl], $00                                ; $75CD: $36 $00
    nop                                           ; $75CF: $00
    ld   a, [hl]                                  ; $75D0: $7E
    ld   d, $00                                   ; $75D1: $16 $00
    ld   [$2774], sp                              ; $75D3: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $75D6: $F0 $F8
    ld   [hl], b                                  ; $75D8: $70
    rlca                                          ; $75D9: $07
    ldh  a, [rP1]                                 ; $75DA: $F0 $00
    ld   a, h                                     ; $75DC: $7C
    ld   d, $F0                                   ; $75DD: $16 $F0
    ld   [$367C], sp                              ; $75DF: $08 $7C $36
    ldh  a, [rNR10]                               ; $75E2: $F0 $10
    ld   [hl], b                                  ; $75E4: $70
    daa                                           ; $75E5: $27
    nop                                           ; $75E6: $00
    nop                                           ; $75E7: $00
    ld   a, [hl]                                  ; $75E8: $7E
    ld   d, $00                                   ; $75E9: $16 $00
    ld   [$2774], sp                              ; $75EB: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $75EE: $F0 $F8
    ld   [hl], b                                  ; $75F0: $70
    rlca                                          ; $75F1: $07
    ldh  a, [rP1]                                 ; $75F2: $F0 $00
    ld   a, h                                     ; $75F4: $7C
    ld   d, $F0                                   ; $75F5: $16 $F0
    ld   [$367C], sp                              ; $75F7: $08 $7C $36
    ldh  a, [rNR10]                               ; $75FA: $F0 $10
    ld   [hl], b                                  ; $75FC: $70
    daa                                           ; $75FD: $27
    nop                                           ; $75FE: $00
    nop                                           ; $75FF: $00
    ld   [hl], h                                  ; $7600: $74
    rlca                                          ; $7601: $07
    nop                                           ; $7602: $00
    ld   [$2774], sp                              ; $7603: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $7606: $F0 $F8
    ld   [hl], b                                  ; $7608: $70
    rlca                                          ; $7609: $07
    ldh  a, [rP1]                                 ; $760A: $F0 $00
    ld   a, b                                     ; $760C: $78
    rlca                                          ; $760D: $07
    ldh  a, [$FF08]                               ; $760E: $F0 $08
    ld   a, h                                     ; $7610: $7C
    ld   [hl], $F0                                ; $7611: $36 $F0
    db   $10                                      ; $7613: $10
    ld   [hl], b                                  ; $7614: $70
    daa                                           ; $7615: $27
    nop                                           ; $7616: $00
    nop                                           ; $7617: $00
    ld   [hl], h                                  ; $7618: $74
    rlca                                          ; $7619: $07
    nop                                           ; $761A: $00
    ld   [$2774], sp                              ; $761B: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $761E: $F0 $F8
    ld   [hl], b                                  ; $7620: $70
    rlca                                          ; $7621: $07
    ldh  a, [rP1]                                 ; $7622: $F0 $00
    ld   a, b                                     ; $7624: $78
    rlca                                          ; $7625: $07
    ldh  a, [$FF08]                               ; $7626: $F0 $08
    ld   a, b                                     ; $7628: $78
    daa                                           ; $7629: $27
    ldh  a, [rNR10]                               ; $762A: $F0 $10
    ld   [hl], b                                  ; $762C: $70
    daa                                           ; $762D: $27
    nop                                           ; $762E: $00
    nop                                           ; $762F: $00
    ld   [hl], h                                  ; $7630: $74
    rlca                                          ; $7631: $07
    nop                                           ; $7632: $00
    ld   [$2774], sp                              ; $7633: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $7636: $F0 $F8
    ld   [hl], b                                  ; $7638: $70
    rlca                                          ; $7639: $07
    ldh  a, [rP1]                                 ; $763A: $F0 $00
    ld   a, b                                     ; $763C: $78
    rlca                                          ; $763D: $07
    ldh  a, [$FF08]                               ; $763E: $F0 $08
    ld   a, b                                     ; $7640: $78
    daa                                           ; $7641: $27
    ldh  a, [rNR10]                               ; $7642: $F0 $10
    ld   [hl], b                                  ; $7644: $70
    daa                                           ; $7645: $27
    nop                                           ; $7646: $00
    nop                                           ; $7647: $00
    ld   [hl], h                                  ; $7648: $74
    rlca                                          ; $7649: $07
    nop                                           ; $764A: $00
    ld   [$2774], sp                              ; $764B: $08 $74 $27
    ldh  a, [hRoomStatus]                         ; $764E: $F0 $F8
    ld   [hl], b                                  ; $7650: $70
    rlca                                          ; $7651: $07
    ldh  a, [rP1]                                 ; $7652: $F0 $00
    ld   [hl], d                                  ; $7654: $72
    rlca                                          ; $7655: $07
    ldh  a, [$FF08]                               ; $7656: $F0 $08
    ld   [hl], d                                  ; $7658: $72
    daa                                           ; $7659: $27
    ldh  a, [rNR10]                               ; $765A: $F0 $10
    ld   [hl], b                                  ; $765C: $70
    daa                                           ; $765D: $27
    nop                                           ; $765E: $00
    nop                                           ; $765F: $00
    ld   [hl], h                                  ; $7660: $74
    rlca                                          ; $7661: $07
    nop                                           ; $7662: $00
    ld   [$2774], sp                              ; $7663: $08 $74 $27
    db   $76                                      ; $7666: $76
    rlca                                          ; $7667: $07
    db   $76                                      ; $7668: $76
    daa                                           ; $7669: $27

func_018_766A:
    ldh  a, [hActiveEntityUnknownG]               ; $766A: $F0 $F1
    rla                                           ; $766C: $17
    rla                                           ; $766D: $17
    rla                                           ; $766E: $17
    and  $F8                                      ; $766F: $E6 $F8
    ld   e, a                                     ; $7671: $5F
    rla                                           ; $7672: $17
    add  e                                        ; $7673: $83
    ld   e, a                                     ; $7674: $5F
    ld   d, b                                     ; $7675: $50
    ld   hl, $758E                                ; $7676: $21 $8E $75
    add  hl, de                                   ; $7679: $19
    ld   c, $06                                   ; $767A: $0E $06
    call label_3CE6                               ; $767C: $CD $E6 $3C
    ld   a, $06                                   ; $767F: $3E $06
    call label_3DA0                               ; $7681: $CD $A0 $3D
    ldh  a, [hActiveEntityState]                  ; $7684: $F0 $EA
    cp   $01                                      ; $7686: $FE $01
    jr   z, jr_018_7691                           ; $7688: $28 $07

    ldh  a, [hActiveEntityWalking]                ; $768A: $F0 $F0
    cp   $05                                      ; $768C: $FE $05
    jp   c, label_018_7726                        ; $768E: $DA $26 $77

jr_018_7691:
    ld   hl, $C440                                ; $7691: $21 $40 $C4
    add  hl, bc                                   ; $7694: $09
    ld   a, [hl]                                  ; $7695: $7E
    ldh  [hFFE8], a                               ; $7696: $E0 $E8
    ldh  a, [wActiveEntityPosX]                   ; $7698: $F0 $EE
    sub  [hl]                                     ; $769A: $96
    sra  a                                        ; $769B: $CB $2F
    ldh  [hBGMapOffsetLow], a                     ; $769D: $E0 $E1
    sra  a                                        ; $769F: $CB $2F
    ldh  [$FFE2], a                               ; $76A1: $E0 $E2
    sra  a                                        ; $76A3: $CB $2F
    ldh  [$FFE3], a                               ; $76A5: $E0 $E3
    sra  a                                        ; $76A7: $CB $2F
    ldh  [$FFE4], a                               ; $76A9: $E0 $E4
    sra  a                                        ; $76AB: $CB $2F
    ldh  [$FFE5], a                               ; $76AD: $E0 $E5
    sra  a                                        ; $76AF: $CB $2F
    ldh  [hFreeWarpDataAddress], a                ; $76B1: $E0 $E6
    ld   hl, wEntitiesUnknownTableD               ; $76B3: $21 $D0 $C2
    add  hl, bc                                   ; $76B6: $09
    ld   a, [hl]                                  ; $76B7: $7E
    ldh  [hDungeonFloorTile], a                   ; $76B8: $E0 $E9
    ldh  a, [wActiveEntityPosY]                   ; $76BA: $F0 $EC
    sub  $20                                      ; $76BC: $D6 $20
    cp   [hl]                                     ; $76BE: $BE
    jr   c, jr_018_7726                           ; $76BF: $38 $65

    ldh  [wActiveEntityPosY], a                   ; $76C1: $E0 $EC
    xor  a                                        ; $76C3: $AF
    ldh  [hActiveEntityUnknownG], a               ; $76C4: $E0 $F1
    ld   hl, hBGMapOffsetLow                      ; $76C6: $21 $E1 $FF

jr_018_76C9:
    ldh  a, [hFFE8]                               ; $76C9: $F0 $E8
    add  [hl]                                     ; $76CB: $86
    ldh  [wActiveEntityPosX], a                   ; $76CC: $E0 $EE
    inc  hl                                       ; $76CE: $23
    push hl                                       ; $76CF: $E5
    ld   de, $7666                                ; $76D0: $11 $66 $76
    call label_3BC0                               ; $76D3: $CD $C0 $3B
    ld   a, [$DBC7]                               ; $76D6: $FA $C7 $DB
    and  a                                        ; $76D9: $A7
    jr   nz, jr_018_7717                          ; $76DA: $20 $3B

    ld   hl, wActiveEntityPosY                    ; $76DC: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $76DF: $F0 $99
    sub  [hl]                                     ; $76E1: $96
    add  $0C                                      ; $76E2: $C6 $0C
    cp   $18                                      ; $76E4: $FE $18
    jr   nc, jr_018_7717                          ; $76E6: $30 $2F

    ld   hl, wActiveEntityPosX                    ; $76E8: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $76EB: $F0 $98
    sub  [hl]                                     ; $76ED: $96
    ld   e, a                                     ; $76EE: $5F
    add  $0C                                      ; $76EF: $C6 $0C
    cp   $18                                      ; $76F1: $FE $18
    jr   nc, jr_018_7717                          ; $76F3: $30 $22

    ld   a, e                                     ; $76F5: $7B
    ld   e, $20                                   ; $76F6: $1E $20
    and  $80                                      ; $76F8: $E6 $80
    jr   z, jr_018_76FE                           ; $76FA: $28 $02

    ld   e, $E0                                   ; $76FC: $1E $E0

jr_018_76FE:
    ld   a, e                                     ; $76FE: $7B
    ldh  [hLinkPositionXIncrement], a             ; $76FF: $E0 $9A
    xor  a                                        ; $7701: $AF
    ldh  [hLinkPositionYIncrement], a             ; $7702: $E0 $9B
    ld   a, $18                                   ; $7704: $3E $18
    ld   [$C13E], a                               ; $7706: $EA $3E $C1
    ld   a, $10                                   ; $7709: $3E $10
    ld   [$DBC7], a                               ; $770B: $EA $C7 $DB
    ld   a, $08                                   ; $770E: $3E $08
    ld   [wDB94], a                               ; $7710: $EA $94 $DB
    ld   a, $03                                   ; $7713: $3E $03
    ldh  [hWaveSfx], a                            ; $7715: $E0 $F3

jr_018_7717:
    pop  hl                                       ; $7717: $E1
    ldh  a, [hDungeonFloorTile]                   ; $7718: $F0 $E9
    ld   e, a                                     ; $771A: $5F
    ldh  a, [wActiveEntityPosY]                   ; $771B: $F0 $EC
    sub  $10                                      ; $771D: $D6 $10
    ldh  [wActiveEntityPosY], a                   ; $771F: $E0 $EC
    sub  e                                        ; $7721: $93
    and  $80                                      ; $7722: $E6 $80
    jr   z, jr_018_76C9                           ; $7724: $28 $A3

label_018_7726:
jr_018_7726:
    jp   label_3D8A                               ; $7726: $C3 $8A $3D

    ld   h, d                                     ; $7729: $62
    nop                                           ; $772A: $00
    ld   h, h                                     ; $772B: $64
    nop                                           ; $772C: $00
    ld   h, b                                     ; $772D: $60
    nop                                           ; $772E: $00
    ld   h, b                                     ; $772F: $60
    jr   nz, @+$66                                ; $7730: $20 $64

    jr   nz, @+$64                                ; $7732: $20 $62

    jr   nz, @+$68                                ; $7734: $20 $66

    nop                                           ; $7736: $00
    ld   l, b                                     ; $7737: $68
    nop                                           ; $7738: $00
    ld   h, b                                     ; $7739: $60
    nop                                           ; $773A: $00
    ld   h, b                                     ; $773B: $60
    jr   nz, @+$6A                                ; $773C: $20 $68

    jr   nz, @+$68                                ; $773E: $20 $66

    jr   nz, @+$6E                                ; $7740: $20 $6C

    nop                                           ; $7742: $00
    ld   l, [hl]                                  ; $7743: $6E
    nop                                           ; $7744: $00
    ld   l, d                                     ; $7745: $6A
    nop                                           ; $7746: $00
    ld   l, d                                     ; $7747: $6A
    jr   nz, jr_018_77B8                          ; $7748: $20 $6E

    jr   nz, jr_018_77B8                          ; $774A: $20 $6C

    jr   nz, jr_018_774E                          ; $774C: $20 $00

jr_018_774E:
    ld   bc, $0102                                ; $774E: $01 $02 $01
    inc  bc                                       ; $7751: $03
    inc  b                                        ; $7752: $04
    dec  b                                        ; $7753: $05
    inc  b                                        ; $7754: $04
    ld   b, $07                                   ; $7755: $06 $07
    ld   [$F007], sp                              ; $7757: $08 $07 $F0
    rst  $30                                      ; $775A: $F7
    cp   $FF                                      ; $775B: $FE $FF
    jr   nz, jr_018_7764                          ; $775D: $20 $05

    ld   a, $18                                   ; $775F: $3E $18
    jp   label_A77                                ; $7761: $C3 $77 $0A

jr_018_7764:
    ld   de, $7729                                ; $7764: $11 $29 $77
    call label_3BC0                               ; $7767: $CD $C0 $3B
    call func_018_7DE8                            ; $776A: $CD $E8 $7D
    call func_018_7E15                            ; $776D: $CD $15 $7E
    call label_3B39                               ; $7770: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                ; $7773: $F0 $F0
    rst  $00                                      ; $7775: $C7
    add  h                                        ; $7776: $84
    ld   [hl], a                                  ; $7777: $77
    db   $DD                                      ; $7778: $DD
    ld   [hl], a                                  ; $7779: $77
    ld   a, [$00FC]                               ; $777A: $FA $FC $00
    inc  b                                        ; $777D: $04
    ld   b, $04                                   ; $777E: $06 $04
    nop                                           ; $7780: $00
    db   $FC                                      ; $7781: $FC
    ld   a, [$CDFC]                               ; $7782: $FA $FC $CD
    dec  b                                        ; $7785: $05
    inc  c                                        ; $7786: $0C
    jr   nz, jr_018_77A9                          ; $7787: $20 $20

    call GetRandomByte                            ; $7789: $CD $0D $28
    and  $3F                                      ; $778C: $E6 $3F
    add  $30                                      ; $778E: $C6 $30
    ld   [hl], a                                  ; $7790: $77
    and  $07                                      ; $7791: $E6 $07
    ld   e, a                                     ; $7793: $5F
    ld   d, b                                     ; $7794: $50
    ld   hl, $777C                                ; $7795: $21 $7C $77
    add  hl, de                                   ; $7798: $19
    ld   a, [hl]                                  ; $7799: $7E
    ld   hl, wEntity0SpeedX                       ; $779A: $21 $40 $C2
    add  hl, bc                                   ; $779D: $09
    ld   [hl], a                                  ; $779E: $77
    ld   hl, $777A                                ; $779F: $21 $7A $77
    add  hl, de                                   ; $77A2: $19
    ld   a, [hl]                                  ; $77A3: $7E
    ld   hl, wEntity0SpeedY                       ; $77A4: $21 $50 $C2
    add  hl, bc                                   ; $77A7: $09
    ld   [hl], a                                  ; $77A8: $77

jr_018_77A9:
    call func_018_7E5F                            ; $77A9: $CD $5F $7E
    call label_3B23                               ; $77AC: $CD $23 $3B
    ld   hl, wEntitiesUnknownTableB               ; $77AF: $21 $B0 $C2
    add  hl, bc                                   ; $77B2: $09
    ld   a, [hl]                                  ; $77B3: $7E
    ld   hl, $774D                                ; $77B4: $21 $4D $77
    and  a                                        ; $77B7: $A7

jr_018_77B8:
    jr   z, jr_018_77CF                           ; $77B8: $28 $15

    call func_018_7D95                            ; $77BA: $CD $95 $7D
    jr   nc, jr_018_77CC                          ; $77BD: $30 $0D

    ld   hl, wEntitiesUnknownTableC               ; $77BF: $21 $C0 $C2
    add  hl, bc                                   ; $77C2: $09
    ld   a, [hl]                                  ; $77C3: $7E
    and  $03                                      ; $77C4: $E6 $03
    add  $7C                                      ; $77C6: $C6 $7C
    inc  [hl]                                     ; $77C8: $34
    call OpenDialogInTable2                       ; $77C9: $CD $7C $23

jr_018_77CC:
    ld   hl, $7755                                ; $77CC: $21 $55 $77

label_018_77CF:
jr_018_77CF:
    ldh  a, [hFrameCounter]                       ; $77CF: $F0 $E7
    rra                                           ; $77D1: $1F
    rra                                           ; $77D2: $1F
    rra                                           ; $77D3: $1F
    and  $03                                      ; $77D4: $E6 $03
    ld   e, a                                     ; $77D6: $5F
    ld   d, b                                     ; $77D7: $50
    add  hl, de                                   ; $77D8: $19
    ld   a, [hl]                                  ; $77D9: $7E
    jp   label_3B0C                               ; $77DA: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $77DD: $CD $05 $0C
    jr   nz, jr_018_77E7                          ; $77E0: $20 $05

    call IncrementEntityWalkingAttr               ; $77E2: $CD $12 $3B
    ld   [hl], b                                  ; $77E5: $70
    ret                                           ; $77E6: $C9

jr_018_77E7:
    ld   hl, $7751                                ; $77E7: $21 $51 $77
    jp   label_018_77CF                           ; $77EA: $C3 $CF $77

    nop                                           ; $77ED: $00
    db   $FC                                      ; $77EE: $FC
    ld   [hl], b                                  ; $77EF: $70
    ld   [bc], a                                  ; $77F0: $02
    nop                                           ; $77F1: $00
    inc  b                                        ; $77F2: $04
    ld   [hl], d                                  ; $77F3: $72
    ld   [bc], a                                  ; $77F4: $02
    nop                                           ; $77F5: $00
    inc  c                                        ; $77F6: $0C
    ld   [hl], b                                  ; $77F7: $70
    ld   [hl+], a                                 ; $77F8: $22
    nop                                           ; $77F9: $00
    db   $FC                                      ; $77FA: $FC
    ld   [hl], h                                  ; $77FB: $74
    ld   [bc], a                                  ; $77FC: $02
    nop                                           ; $77FD: $00
    inc  b                                        ; $77FE: $04
    ld   [hl], d                                  ; $77FF: $72
    ld   [bc], a                                  ; $7800: $02
    nop                                           ; $7801: $00
    inc  c                                        ; $7802: $0C
    ld   [hl], h                                  ; $7803: $74
    ld   [hl+], a                                 ; $7804: $22
    nop                                           ; $7805: $00
    db   $FC                                      ; $7806: $FC
    db   $76                                      ; $7807: $76
    ld   [bc], a                                  ; $7808: $02
    nop                                           ; $7809: $00
    inc  b                                        ; $780A: $04
    ld   [hl], d                                  ; $780B: $72
    ld   [bc], a                                  ; $780C: $02
    nop                                           ; $780D: $00
    inc  c                                        ; $780E: $0C
    db   $76                                      ; $780F: $76
    ld   [hl+], a                                 ; $7810: $22
    nop                                           ; $7811: $00
    db   $FC                                      ; $7812: $FC
    ld   [hl], h                                  ; $7813: $74
    ld   [bc], a                                  ; $7814: $02
    nop                                           ; $7815: $00
    inc  b                                        ; $7816: $04
    ld   [hl], d                                  ; $7817: $72
    ld   [bc], a                                  ; $7818: $02
    nop                                           ; $7819: $00
    inc  c                                        ; $781A: $0C
    ld   [hl], h                                  ; $781B: $74
    ld   [hl+], a                                 ; $781C: $22
    db   $10                                      ; $781D: $10
    ld   de, $1112                                ; $781E: $11 $12 $11
    ldh  a, [hActiveEntityUnknownG]               ; $7821: $F0 $F1
    rla                                           ; $7823: $17
    rla                                           ; $7824: $17
    and  $FC                                      ; $7825: $E6 $FC
    ld   e, a                                     ; $7827: $5F
    rla                                           ; $7828: $17
    and  $F8                                      ; $7829: $E6 $F8
    add  e                                        ; $782B: $83
    ld   e, a                                     ; $782C: $5F
    ld   d, b                                     ; $782D: $50
    ld   hl, $77ED                                ; $782E: $21 $ED $77
    add  hl, de                                   ; $7831: $19
    ld   c, $03                                   ; $7832: $0E $03
    call label_3CE6                               ; $7834: $CD $E6 $3C
    call func_018_7DE8                            ; $7837: $CD $E8 $7D
    call label_3CD9                               ; $783A: $CD $D9 $3C
    ld   hl, $C3D0                                ; $783D: $21 $D0 $C3
    add  hl, bc                                   ; $7840: $09
    ld   a, [hl]                                  ; $7841: $7E
    rra                                           ; $7842: $1F
    rra                                           ; $7843: $1F
    rra                                           ; $7844: $1F
    and  $03                                      ; $7845: $E6 $03
    ld   e, a                                     ; $7847: $5F
    ld   d, b                                     ; $7848: $50
    ld   hl, $781D                                ; $7849: $21 $1D $78
    add  hl, de                                   ; $784C: $19
    ld   a, [hl]                                  ; $784D: $7E
    ld   hl, wEntitiesPosZTable                   ; $784E: $21 $10 $C3
    add  hl, bc                                   ; $7851: $09
    ld   [hl], a                                  ; $7852: $77
    call func_018_7E15                            ; $7853: $CD $15 $7E
    call func_018_7E5F                            ; $7856: $CD $5F $7E
    call label_3B23                               ; $7859: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                ; $785C: $F0 $F0
    rst  $00                                      ; $785E: $C7
    ld   l, a                                     ; $785F: $6F
    ld   a, b                                     ; $7860: $78
    ld   b, c                                     ; $7861: $41
    ld   a, c                                     ; $7862: $79
    ld   d, d                                     ; $7863: $52
    ld   a, c                                     ; $7864: $79
    ld   hl, sp-$06                               ; $7865: $F8 $FA
    nop                                           ; $7867: $00
    ld   b, $08                                   ; $7868: $06 $08
    ld   b, $00                                   ; $786A: $06 $00
    ld   a, [$FAF8]                               ; $786C: $FA $F8 $FA
    call GetEntityTransitionCountdown             ; $786F: $CD $05 $0C
    jr   nz, jr_018_78A6                          ; $7872: $20 $32

    call GetRandomByte                            ; $7874: $CD $0D $28
    and  $1F                                      ; $7877: $E6 $1F
    add  $20                                      ; $7879: $C6 $20
    ld   [hl], a                                  ; $787B: $77
    and  $07                                      ; $787C: $E6 $07
    ld   e, a                                     ; $787E: $5F
    ld   d, b                                     ; $787F: $50
    ld   hl, $7867                                ; $7880: $21 $67 $78
    add  hl, de                                   ; $7883: $19
    ld   a, [hl]                                  ; $7884: $7E
    ld   hl, wEntity0SpeedX                       ; $7885: $21 $40 $C2
    add  hl, bc                                   ; $7888: $09
    ld   [hl], a                                  ; $7889: $77
    ld   hl, $7865                                ; $788A: $21 $65 $78
    add  hl, de                                   ; $788D: $19
    ld   a, [hl]                                  ; $788E: $7E
    ld   hl, wEntity0SpeedY                       ; $788F: $21 $50 $C2
    add  hl, bc                                   ; $7892: $09
    ld   [hl], a                                  ; $7893: $77
    ld   hl, wEntitiesUnknownTableB               ; $7894: $21 $B0 $C2
    add  hl, bc                                   ; $7897: $09
    inc  [hl]                                     ; $7898: $34
    ld   a, [hl]                                  ; $7899: $7E
    and  $07                                      ; $789A: $E6 $07
    jr   nz, jr_018_78A3                          ; $789C: $20 $05

    ld   a, $0A                                   ; $789E: $3E $0A
    call label_3BAA                               ; $78A0: $CD $AA $3B

jr_018_78A3:
    call IncrementEntityWalkingAttr               ; $78A3: $CD $12 $3B

label_018_78A6:
jr_018_78A6:
    ld   hl, $C3D0                                ; $78A6: $21 $D0 $C3
    add  hl, bc                                   ; $78A9: $09
    ld   a, [hl]                                  ; $78AA: $7E
    inc  [hl]                                     ; $78AB: $34
    and  $7F                                      ; $78AC: $E6 $7F
    jr   nz, jr_018_78F1                          ; $78AE: $20 $41

    ld   a, $02                                   ; $78B0: $3E $02
    call label_3B86                               ; $78B2: $CD $86 $3B
    jr   c, jr_018_78F1                           ; $78B5: $38 $3A

    ld   hl, $C430                                ; $78B7: $21 $30 $C4
    add  hl, de                                   ; $78BA: $19
    res  0, [hl]                                  ; $78BB: $CB $86
    ldh  a, [hScratchA]                           ; $78BD: $F0 $D7
    ld   hl, wEntity0PosX                         ; $78BF: $21 $00 $C2
    add  hl, de                                   ; $78C2: $19
    ld   [hl], a                                  ; $78C3: $77
    ldh  a, [hScratchB]                           ; $78C4: $F0 $D8
    ld   hl, wEntity0PosY                         ; $78C6: $21 $10 $C2
    add  hl, de                                   ; $78C9: $19
    ld   [hl], a                                  ; $78CA: $77
    ldh  a, [hScratchD]                           ; $78CB: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $78CD: $21 $10 $C3
    add  hl, de                                   ; $78D0: $19
    ld   [hl], a                                  ; $78D1: $77
    ld   hl, wEntitiesSpeedZTable                 ; $78D2: $21 $20 $C3
    add  hl, de                                   ; $78D5: $19
    ld   [hl], $08                                ; $78D6: $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ; $78D8: $21 $E0 $C2
    add  hl, de                                   ; $78DB: $19
    ld   [hl], $40                                ; $78DC: $36 $40
    ld   hl, $C440                                ; $78DE: $21 $40 $C4
    add  hl, de                                   ; $78E1: $19
    ld   [hl], $01                                ; $78E2: $36 $01
    push bc                                       ; $78E4: $C5
    ld   c, e                                     ; $78E5: $4B
    ld   b, d                                     ; $78E6: $42
    ld   a, $10                                   ; $78E7: $3E $10
    call label_3BAA                               ; $78E9: $CD $AA $3B
    pop  bc                                       ; $78EC: $C1
    ld   a, $08                                   ; $78ED: $3E $08
    ldh  [hJingle], a                             ; $78EF: $E0 $F2

jr_018_78F1:
    call func_018_7EE1                            ; $78F1: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $78F4: $F0 $9E
    xor  $01                                      ; $78F6: $EE $01
    cp   e                                        ; $78F8: $BB
    jr   nz, jr_018_7935                          ; $78F9: $20 $3A

    call func_018_7EB2                            ; $78FB: $CD $B2 $7E
    add  $20                                      ; $78FE: $C6 $20
    cp   $40                                      ; $7900: $FE $40
    jr   nc, jr_018_7935                          ; $7902: $30 $31

    call func_018_7ED2                            ; $7904: $CD $D2 $7E
    add  $20                                      ; $7907: $C6 $20
    cp   $40                                      ; $7909: $FE $40
    jr   nc, jr_018_7935                          ; $790B: $30 $28

    ld   a, [wSwordAnimationState]                ; $790D: $FA $37 $C1
    and  a                                        ; $7910: $A7
    jr   z, jr_018_7935                           ; $7911: $28 $22

    call IncrementEntityWalkingAttr               ; $7913: $CD $12 $3B
    ld   [hl], $02                                ; $7916: $36 $02
    call GetEntityTransitionCountdown             ; $7918: $CD $05 $0C
    ld   [hl], $12                                ; $791B: $36 $12
    ld   a, $20                                   ; $791D: $3E $20
    call label_3BB5                               ; $791F: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $7922: $F0 $D7
    cpl                                           ; $7924: $2F
    inc  a                                        ; $7925: $3C
    ld   hl, wEntity0SpeedY                       ; $7926: $21 $50 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77
    ldh  a, [hScratchB]                           ; $792B: $F0 $D8
    cpl                                           ; $792D: $2F
    inc  a                                        ; $792E: $3C
    ld   hl, wEntity0SpeedX                       ; $792F: $21 $40 $C2
    add  hl, bc                                   ; $7932: $09
    ld   [hl], a                                  ; $7933: $77
    ret                                           ; $7934: $C9

jr_018_7935:
    call label_3B39                               ; $7935: $CD $39 $3B

label_018_7938:
    ldh  a, [hFrameCounter]                       ; $7938: $F0 $E7
    rra                                           ; $793A: $1F
    rra                                           ; $793B: $1F
    and  $03                                      ; $793C: $E6 $03
    jp   label_3B0C                               ; $793E: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $7941: $CD $05 $0C
    jr   nz, jr_018_794F                          ; $7944: $20 $09

    ld   [hl], $20                                ; $7946: $36 $20
    call IncrementEntityWalkingAttr               ; $7948: $CD $12 $3B
    ld   [hl], b                                  ; $794B: $70
    call label_3D7F                               ; $794C: $CD $7F $3D

jr_018_794F:
    jp   label_018_78A6                           ; $794F: $C3 $A6 $78

    call GetEntityTransitionCountdown             ; $7952: $CD $05 $0C
    jr   nz, jr_018_795B                          ; $7955: $20 $04

    call IncrementEntityWalkingAttr               ; $7957: $CD $12 $3B
    ld   [hl], b                                  ; $795A: $70

jr_018_795B:
    jp   label_018_7938                           ; $795B: $C3 $38 $79

    ld   l, h                                     ; $795E: $6C
    ld   [hl], h                                  ; $795F: $74
    ld   l, l                                     ; $7960: $6D
    ld   [hl], l                                  ; $7961: $75
    ld   h, h                                     ; $7962: $64
    ld   [hl], h                                  ; $7963: $74
    ld   h, l                                     ; $7964: $65
    ld   [hl], l                                  ; $7965: $75
    call func_018_7B02                            ; $7966: $CD $02 $7B
    call func_018_7DE8                            ; $7969: $CD $E8 $7D
    ldh  a, [hActiveEntityWalking]                ; $796C: $F0 $F0
    and  a                                        ; $796E: $A7
    jp   nz, label_018_7A5D                       ; $796F: $C2 $5D $7A

    call GetEntityTransitionCountdown             ; $7972: $CD $05 $0C
    jp   z, label_018_7A48                        ; $7975: $CA $48 $7A

    cp   $07                                      ; $7978: $FE $07
    jp   nz, label_018_7A4B                       ; $797A: $C2 $4B $7A

    push bc                                       ; $797D: $C5
    ld   hl, wEntity0PosX                         ; $797E: $21 $00 $C2
    add  hl, bc                                   ; $7981: $09
    ld   a, [hl]                                  ; $7982: $7E
    add  $07                                      ; $7983: $C6 $07
    sub  $08                                      ; $7985: $D6 $08
    and  $F0                                      ; $7987: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $7989: $E0 $CE
    swap a                                        ; $798B: $CB $37
    ld   hl, wEntity0PosY                         ; $798D: $21 $10 $C2
    add  hl, bc                                   ; $7990: $09
    ld   c, a                                     ; $7991: $4F
    ld   a, [hl]                                  ; $7992: $7E
    add  $07                                      ; $7993: $C6 $07
    sub  $10                                      ; $7995: $D6 $10
    and  $F0                                      ; $7997: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $7999: $E0 $CD
    or   c                                        ; $799B: $B1
    ld   c, a                                     ; $799C: $4F
    ld   b, $00                                   ; $799D: $06 $00
    ld   hl, wRoomObjects                         ; $799F: $21 $11 $D7
    ld   a, h                                     ; $79A2: $7C
    add  hl, bc                                   ; $79A3: $09
    ld   e, c                                     ; $79A4: $59
    ld   d, b                                     ; $79A5: $50
    ld   h, a                                     ; $79A6: $67
    pop  bc                                       ; $79A7: $C1
    ld   a, [hl]                                  ; $79A8: $7E
    ldh  [hFFAF], a                               ; $79A9: $E0 $AF
    cp   $D3                                      ; $79AB: $FE $D3
    jr   z, jr_018_79B3                           ; $79AD: $28 $04

    cp   $5C                                      ; $79AF: $FE $5C
    jr   nz, jr_018_79CF                          ; $79B1: $20 $1C

jr_018_79B3:
    ld   a, [wIsIndoor]                           ; $79B3: $FA $A5 $DB
    and  a                                        ; $79B6: $A7
    jr   nz, jr_018_79CF                          ; $79B7: $20 $16

    call label_2178                               ; $79B9: $CD $78 $21
    ldh  a, [wActiveEntityPosX]                   ; $79BC: $F0 $EE
    ldh  [hScratchA], a                           ; $79BE: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $79C0: $F0 $EC
    ldh  [hScratchB], a                           ; $79C2: $E0 $D8
    ld   a, $02                                   ; $79C4: $3E $02
    call label_CC7                                ; $79C6: $CD $C7 $0C
    ld   a, $2F                                   ; $79C9: $3E $2F
    ldh  [hJingle], a                             ; $79CB: $E0 $F2
    jr   jr_018_7A48                              ; $79CD: $18 $79

jr_018_79CF:
    ld   a, [wIsIndoor]                           ; $79CF: $FA $A5 $DB
    and  a                                        ; $79D2: $A7
    jp   z, label_018_7A4B                        ; $79D3: $CA $4B $7A

    ldh  a, [hFFAF]                               ; $79D6: $F0 $AF
    cp   $AB                                      ; $79D8: $FE $AB
    ret  nz                                       ; $79DA: $C0

    ldh  a, [hIsGBC]                              ; $79DB: $F0 $FE
    and  a                                        ; $79DD: $A7
    jr   z, jr_018_79F0                           ; $79DE: $28 $10

    ld   a, [wLinkMotionState]                    ; $79E0: $FA $1C $C1
    cp   $05                                      ; $79E3: $FE $05
    ret  z                                        ; $79E5: $C8

    ld   a, [$DDD6]                               ; $79E6: $FA $D6 $DD
    and  a                                        ; $79E9: $A7
    ret  nz                                       ; $79EA: $C0

    ld   a, [wRoomTransitionState]                ; $79EB: $FA $24 $C1
    and  a                                        ; $79EE: $A7
    ret  nz                                       ; $79EF: $C0

jr_018_79F0:
    ld   a, $AC                                   ; $79F0: $3E $AC
    ld   [hl], a                                  ; $79F2: $77
    ld   [$DDD8], a                               ; $79F3: $EA $D8 $DD
    ld   d, h                                     ; $79F6: $54
    ld   e, l                                     ; $79F7: $5D
    ld   hl, wEntitiesUnknownTableB               ; $79F8: $21 $B0 $C2
    add  hl, bc                                   ; $79FB: $09
    ld   [hl], d                                  ; $79FC: $72
    ld   hl, wEntitiesUnknownTableC               ; $79FD: $21 $C0 $C2
    add  hl, bc                                   ; $7A00: $09
    ld   [hl], e                                  ; $7A01: $73
    ld   hl, wEntitiesWalkingTable                ; $7A02: $21 $90 $C2
    add  hl, bc                                   ; $7A05: $09
    ld   [hl], $01                                ; $7A06: $36 $01
    call label_BFB                                ; $7A08: $CD $FB $0B
    ld   [hl], $80                                ; $7A0B: $36 $80
    ld   hl, wEntity0PosX                         ; $7A0D: $21 $00 $C2
    add  hl, bc                                   ; $7A10: $09
    ldh  a, [hSwordIntersectedAreaX]              ; $7A11: $F0 $CE
    ld   [hl], a                                  ; $7A13: $77
    ld   hl, wEntity0PosY                         ; $7A14: $21 $10 $C2
    add  hl, bc                                   ; $7A17: $09
    ldh  a, [hSwordIntersectedAreaY]              ; $7A18: $F0 $CD
    ld   [hl], a                                  ; $7A1A: $77
    ld   hl, $C1A2                                ; $7A1B: $21 $A2 $C1
    inc  [hl]                                     ; $7A1E: $34
    ld   a, [wC3CD]                               ; $7A1F: $FA $CD $C3
    and  a                                        ; $7A22: $A7
    jr   z, jr_018_7A39                           ; $7A23: $28 $14

    sub  $04                                      ; $7A25: $D6 $04
    ld   [wC3CD], a                               ; $7A27: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A2A: $F0 $FE
    and  a                                        ; $7A2C: $A7
    jr   z, jr_018_7A39                           ; $7A2D: $28 $0A

    ld   a, $40                                   ; $7A2F: $3E $40
    ld   [$DDD6], a                               ; $7A31: $EA $D6 $DD
    ld   a, $0B                                   ; $7A34: $3E $0B
    ld   [$DDD7], a                               ; $7A36: $EA $D7 $DD

jr_018_7A39:
    call GetEntityTransitionCountdown             ; $7A39: $CD $05 $0C
    ld   [hl], b                                  ; $7A3C: $70
    ld   a, $12                                   ; $7A3D: $3E $12
    ldh  [hNoiseSfx], a                           ; $7A3F: $E0 $F4
    ld   de, $795E                                ; $7A41: $11 $5E $79
    push de                                       ; $7A44: $D5
    jp   label_018_7B1D                           ; $7A45: $C3 $1D $7B

label_018_7A48:
jr_018_7A48:
    jp   label_018_7F08                           ; $7A48: $C3 $08 $7F

label_018_7A4B:
    cp   $10                                      ; $7A4B: $FE $10
    ret  nc                                       ; $7A4D: $D0

    ld   hl, $C440                                ; $7A4E: $21 $40 $C4
    add  hl, bc                                   ; $7A51: $09
    ld   a, [hl]                                  ; $7A52: $7E
    and  a                                        ; $7A53: $A7
    ret  nz                                       ; $7A54: $C0

    ld   a, $09                                   ; $7A55: $3E $09
    ld   [$C19E], a                               ; $7A57: $EA $9E $C1
    jp   label_3B7B                               ; $7A5A: $C3 $7B $3B

label_018_7A5D:
    call label_BFB                                ; $7A5D: $CD $FB $0B
    jr   nz, jr_018_7AB9                          ; $7A60: $20 $57

    ld   hl, wEntity0PosX                         ; $7A62: $21 $00 $C2
    add  hl, bc                                   ; $7A65: $09
    ld   a, [hl]                                  ; $7A66: $7E
    ldh  [hSwordIntersectedAreaX], a              ; $7A67: $E0 $CE
    ld   hl, wEntity0PosY                         ; $7A69: $21 $10 $C2
    add  hl, bc                                   ; $7A6C: $09
    ld   a, [hl]                                  ; $7A6D: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $7A6E: $E0 $CD
    ld   hl, wEntitiesUnknownTableB               ; $7A70: $21 $B0 $C2
    add  hl, bc                                   ; $7A73: $09
    ld   d, [hl]                                  ; $7A74: $56
    ld   hl, wEntitiesUnknownTableC               ; $7A75: $21 $C0 $C2
    add  hl, bc                                   ; $7A78: $09
    ld   e, [hl]                                  ; $7A79: $5E
    ld   a, $AB                                   ; $7A7A: $3E $AB
    ld   [de], a                                  ; $7A7C: $12
    ld   [$DDD8], a                               ; $7A7D: $EA $D8 $DD
    call func_018_7F08                            ; $7A80: $CD $08 $7F
    ldh  a, [hMapRoom]                            ; $7A83: $F0 $F6
    cp   $74                                      ; $7A85: $FE $74
    ret  z                                        ; $7A87: $C8

    ld   hl, $C1A2                                ; $7A88: $21 $A2 $C1
    dec  [hl]                                     ; $7A8B: $35
    ld   a, [wC3CD]                               ; $7A8C: $FA $CD $C3
    cp   $0C                                      ; $7A8F: $FE $0C
    jr   nc, jr_018_7AB2                          ; $7A91: $30 $1F

    add  $04                                      ; $7A93: $C6 $04
    ld   [wC3CD], a                               ; $7A95: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A98: $F0 $FE
    and  a                                        ; $7A9A: $A7
    jr   z, jr_018_7AB2                           ; $7A9B: $28 $15

    ld   a, [wLinkMotionState]                    ; $7A9D: $FA $1C $C1
    cp   $05                                      ; $7AA0: $FE $05
    ret  z                                        ; $7AA2: $C8

    ld   a, [wRoomTransitionState]                ; $7AA3: $FA $24 $C1
    and  a                                        ; $7AA6: $A7
    ret  nz                                       ; $7AA7: $C0

    ld   a, $80                                   ; $7AA8: $3E $80
    ld   [$DDD6], a                               ; $7AAA: $EA $D6 $DD
    ld   a, $0B                                   ; $7AAD: $3E $0B
    ld   [$DDD7], a                               ; $7AAF: $EA $D7 $DD

jr_018_7AB2:
    ld   de, $7962                                ; $7AB2: $11 $62 $79
    push de                                       ; $7AB5: $D5
    jp   label_018_7B1D                           ; $7AB6: $C3 $1D $7B

jr_018_7AB9:
    ret                                           ; $7AB9: $C9

    ld   b, $FE                                   ; $7ABA: $06 $FE
    inc  h                                        ; $7ABC: $24
    inc  bc                                       ; $7ABD: $03
    inc  bc                                       ; $7ABE: $03
    inc  b                                        ; $7ABF: $04
    inc  h                                        ; $7AC0: $24
    inc  de                                       ; $7AC1: $13
    dec  b                                        ; $7AC2: $05
    ld   a, [bc]                                  ; $7AC3: $0A
    inc  h                                        ; $7AC4: $24
    inc  bc                                       ; $7AC5: $03
    dec  b                                        ; $7AC6: $05
    cp   $24                                      ; $7AC7: $FE $24
    inc  de                                       ; $7AC9: $13
    ld   [bc], a                                  ; $7ACA: $02
    inc  b                                        ; $7ACB: $04
    inc  h                                        ; $7ACC: $24
    inc  bc                                       ; $7ACD: $03
    inc  b                                        ; $7ACE: $04
    ld   a, [bc]                                  ; $7ACF: $0A
    inc  h                                        ; $7AD0: $24
    inc  de                                       ; $7AD1: $13
    inc  bc                                       ; $7AD2: $03
    rst  $38                                      ; $7AD3: $FF
    inc  h                                        ; $7AD4: $24
    inc  bc                                       ; $7AD5: $03
    ld   bc, $2404                                ; $7AD6: $01 $04 $24
    inc  de                                       ; $7AD9: $13
    ld   [bc], a                                  ; $7ADA: $02
    add  hl, bc                                   ; $7ADB: $09
    inc  h                                        ; $7ADC: $24
    inc  bc                                       ; $7ADD: $03
    ld   bc, $2400                                ; $7ADE: $01 $00 $24
    inc  de                                       ; $7AE1: $13
    rst  $38                                      ; $7AE2: $FF
    inc  b                                        ; $7AE3: $04
    inc  h                                        ; $7AE4: $24
    inc  bc                                       ; $7AE5: $03
    nop                                           ; $7AE6: $00
    ld   b, $24                                   ; $7AE7: $06 $24
    inc  de                                       ; $7AE9: $13
    nop                                           ; $7AEA: $00
    ld   bc, $0324                                ; $7AEB: $01 $24 $03
    cp   $03                                      ; $7AEE: $FE $03
    inc  h                                        ; $7AF0: $24
    inc  de                                       ; $7AF1: $13
    rst  $38                                      ; $7AF2: $FF
    dec  b                                        ; $7AF3: $05
    inc  h                                        ; $7AF4: $24
    inc  bc                                       ; $7AF5: $03
    rst  $38                                      ; $7AF6: $FF
    ld   bc, $1324                                ; $7AF7: $01 $24 $13
    db   $FD                                      ; $7AFA: $FD
    inc  bc                                       ; $7AFB: $03
    inc  h                                        ; $7AFC: $24
    inc  bc                                       ; $7AFD: $03
    cp   $05                                      ; $7AFE: $FE $05
    inc  h                                        ; $7B00: $24
    inc  de                                       ; $7B01: $13

func_018_7B02:
    call GetEntityTransitionCountdown             ; $7B02: $CD $05 $0C
    ret  z                                        ; $7B05: $C8

    rra                                           ; $7B06: $1F
    rra                                           ; $7B07: $1F
    and  $07                                      ; $7B08: $E6 $07
    sla  a                                        ; $7B0A: $CB $27
    sla  a                                        ; $7B0C: $CB $27
    ld   e, a                                     ; $7B0E: $5F
    sla  a                                        ; $7B0F: $CB $27
    add  e                                        ; $7B11: $83
    ld   e, a                                     ; $7B12: $5F
    ld   d, b                                     ; $7B13: $50
    ld   hl, $7ABA                                ; $7B14: $21 $BA $7A
    add  hl, de                                   ; $7B17: $19
    ld   c, $03                                   ; $7B18: $0E $03
    jp   label_3CE6                               ; $7B1A: $C3 $E6 $3C

label_018_7B1D:
    call label_2887                               ; $7B1D: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $7B20: $F0 $FE
    and  a                                        ; $7B22: $A7
    jr   z, jr_018_7B2C                           ; $7B23: $28 $07

    push bc                                       ; $7B25: $C5
    ld   a, $18                                   ; $7B26: $3E $18
    call label_91D                                ; $7B28: $CD $1D $09
    pop  bc                                       ; $7B2B: $C1

jr_018_7B2C:
    ld   a, [wRequests]                           ; $7B2C: $FA $00 $D6
    ld   e, a                                     ; $7B2F: $5F
    ld   d, $00                                   ; $7B30: $16 $00
    ld   hl, wRequestDestinationHigh              ; $7B32: $21 $01 $D6
    add  hl, de                                   ; $7B35: $19
    add  $0A                                      ; $7B36: $C6 $0A
    ld   [wRequests], a                           ; $7B38: $EA $00 $D6
    pop  de                                       ; $7B3B: $D1
    ldh  a, [$FFCF]                               ; $7B3C: $F0 $CF
    ld   [hl+], a                                 ; $7B3E: $22
    ldh  a, [$FFD0]                               ; $7B3F: $F0 $D0
    ld   [hl+], a                                 ; $7B41: $22
    ld   a, $81                                   ; $7B42: $3E $81
    ld   [hl+], a                                 ; $7B44: $22
    ld   a, [de]                                  ; $7B45: $1A
    inc  de                                       ; $7B46: $13
    ld   [hl+], a                                 ; $7B47: $22
    ld   a, [de]                                  ; $7B48: $1A
    inc  de                                       ; $7B49: $13
    ld   [hl+], a                                 ; $7B4A: $22
    ldh  a, [$FFCF]                               ; $7B4B: $F0 $CF
    ld   [hl+], a                                 ; $7B4D: $22
    ldh  a, [$FFD0]                               ; $7B4E: $F0 $D0
    inc  a                                        ; $7B50: $3C
    ld   [hl+], a                                 ; $7B51: $22
    ld   a, $81                                   ; $7B52: $3E $81
    ld   [hl+], a                                 ; $7B54: $22
    ld   a, [de]                                  ; $7B55: $1A
    inc  de                                       ; $7B56: $13
    ld   [hl+], a                                 ; $7B57: $22
    ld   a, [de]                                  ; $7B58: $1A
    ld   [hl+], a                                 ; $7B59: $22
    xor  a                                        ; $7B5A: $AF
    ld   [hl], a                                  ; $7B5B: $77
    ret                                           ; $7B5C: $C9

    nop                                           ; $7B5D: $00
    nop                                           ; $7B5E: $00
    ld   bc, $0101                                ; $7B5F: $01 $01 $01
    ld   [bc], a                                  ; $7B62: $02
    ld   [bc], a                                  ; $7B63: $02
    ld   [bc], a                                  ; $7B64: $02
    nop                                           ; $7B65: $00
    nop                                           ; $7B66: $00
    rrca                                          ; $7B67: $0F
    rrca                                          ; $7B68: $0F
    rrca                                          ; $7B69: $0F
    ld   c, $0E                                   ; $7B6A: $0E $0E
    ld   c, $08                                   ; $7B6C: $0E $08
    ld   [$0707], sp                              ; $7B6E: $08 $07 $07
    rlca                                          ; $7B71: $07
    ld   b, $06                                   ; $7B72: $06 $06
    ld   b, $08                                   ; $7B74: $06 $08
    ld   [$0909], sp                              ; $7B76: $08 $09 $09
    add  hl, bc                                   ; $7B79: $09
    ld   a, [bc]                                  ; $7B7A: $0A
    ld   a, [bc]                                  ; $7B7B: $0A
    ld   a, [bc]                                  ; $7B7C: $0A
    inc  b                                        ; $7B7D: $04
    inc  b                                        ; $7B7E: $04
    inc  bc                                       ; $7B7F: $03
    inc  bc                                       ; $7B80: $03
    inc  bc                                       ; $7B81: $03
    ld   [bc], a                                  ; $7B82: $02
    ld   [bc], a                                  ; $7B83: $02
    ld   [bc], a                                  ; $7B84: $02
    inc  c                                        ; $7B85: $0C
    inc  c                                        ; $7B86: $0C
    dec  c                                        ; $7B87: $0D
    dec  c                                        ; $7B88: $0D
    dec  c                                        ; $7B89: $0D
    ld   c, $0E                                   ; $7B8A: $0E $0E
    ld   c, $04                                   ; $7B8C: $0E $04
    inc  b                                        ; $7B8E: $04
    dec  b                                        ; $7B8F: $05
    dec  b                                        ; $7B90: $05
    dec  b                                        ; $7B91: $05
    ld   b, $06                                   ; $7B92: $06 $06
    ld   b, $0C                                   ; $7B94: $06 $0C
    inc  c                                        ; $7B96: $0C
    dec  bc                                       ; $7B97: $0B
    dec  bc                                       ; $7B98: $0B
    dec  bc                                       ; $7B99: $0B
    ld   a, [bc]                                  ; $7B9A: $0A
    ld   a, [bc]                                  ; $7B9B: $0A
    ld   a, [bc]                                  ; $7B9C: $0A

func_018_7B9D:
    ldh  a, [hScratchA]                           ; $7B9D: $F0 $D7
    rlca                                          ; $7B9F: $07
    and  $01                                      ; $7BA0: $E6 $01
    ld   e, a                                     ; $7BA2: $5F
    ldh  a, [hScratchB]                           ; $7BA3: $F0 $D8
    rlca                                          ; $7BA5: $07
    rla                                           ; $7BA6: $17
    and  $02                                      ; $7BA7: $E6 $02
    or   e                                        ; $7BA9: $B3
    rla                                           ; $7BAA: $17
    rla                                           ; $7BAB: $17
    rla                                           ; $7BAC: $17
    and  $18                                      ; $7BAD: $E6 $18
    ld   h, a                                     ; $7BAF: $67
    ldh  a, [hScratchB]                           ; $7BB0: $F0 $D8
    bit  7, a                                     ; $7BB2: $CB $7F
    jr   z, jr_018_7BB8                           ; $7BB4: $28 $02

    cpl                                           ; $7BB6: $2F
    inc  a                                        ; $7BB7: $3C

jr_018_7BB8:
    ld   d, a                                     ; $7BB8: $57
    ldh  a, [hScratchA]                           ; $7BB9: $F0 $D7
    bit  7, a                                     ; $7BBB: $CB $7F
    jr   z, jr_018_7BC1                           ; $7BBD: $28 $02

    cpl                                           ; $7BBF: $2F
    inc  a                                        ; $7BC0: $3C

jr_018_7BC1:
    cp   d                                        ; $7BC1: $BA
    jr   nc, jr_018_7BD1                          ; $7BC2: $30 $0D

    sra  a                                        ; $7BC4: $CB $2F
    sra  a                                        ; $7BC6: $CB $2F
    add  h                                        ; $7BC8: $84
    ld   e, a                                     ; $7BC9: $5F
    ld   d, b                                     ; $7BCA: $50
    ld   hl, $7B5D                                ; $7BCB: $21 $5D $7B
    add  hl, de                                   ; $7BCE: $19
    ld   a, [hl]                                  ; $7BCF: $7E
    ret                                           ; $7BD0: $C9

jr_018_7BD1:
    ld   a, d                                     ; $7BD1: $7A
    sra  a                                        ; $7BD2: $CB $2F
    sra  a                                        ; $7BD4: $CB $2F
    add  h                                        ; $7BD6: $84
    ld   e, a                                     ; $7BD7: $5F
    ld   d, b                                     ; $7BD8: $50
    ld   hl, $7B7D                                ; $7BD9: $21 $7D $7B
    add  hl, de                                   ; $7BDC: $19
    ld   a, [hl]                                  ; $7BDD: $7E
    ret                                           ; $7BDE: $C9

    ld   de, $0F10                                ; $7BDF: $11 $10 $0F
    ld   c, $FA                                   ; $7BE2: $0E $FA
    ld   h, [hl]                                  ; $7BE4: $66
    pop  bc                                       ; $7BE5: $C1
    and  a                                        ; $7BE6: $A7
    jp   nz, label_018_7F08                       ; $7BE7: $C2 $08 $7F

    ld   a, $02                                   ; $7BEA: $3E $02
    ldh  [$FFA1], a                               ; $7BEC: $E0 $A1
    ld   [$C1A4], a                               ; $7BEE: $EA $A4 $C1
    ld   [$C1C6], a                               ; $7BF1: $EA $C6 $C1
    ld   a, c                                     ; $7BF4: $79
    inc  a                                        ; $7BF5: $3C
    ld   [$C1A6], a                               ; $7BF6: $EA $A6 $C1
    xor  a                                        ; $7BF9: $AF
    call label_CAF                                ; $7BFA: $CD $AF $0C
    ld   [$C13E], a                               ; $7BFD: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7C00: $F0 $9E
    ld   e, a                                     ; $7C02: $5F
    ld   d, $00                                   ; $7C03: $16 $00
    ld   hl, $7BDF                                ; $7C05: $21 $DF $7B
    add  hl, de                                   ; $7C08: $19
    ld   a, [hl]                                  ; $7C09: $7E
    ldh  [hLinkAnimationState], a                 ; $7C0A: $E0 $9D
    call func_018_7CC8                            ; $7C0C: $CD $C8 $7C
    call func_018_7DE8                            ; $7C0F: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $7C12: $F0 $E7
    and  $03                                      ; $7C14: $E6 $03
    jr   nz, jr_018_7C1C                          ; $7C16: $20 $04

    ld   a, $0B                                   ; $7C18: $3E $0B
    ldh  [hNoiseSfx], a                           ; $7C1A: $E0 $F4

jr_018_7C1C:
    ldh  a, [hActiveEntityWalking]                ; $7C1C: $F0 $F0
    and  a                                        ; $7C1E: $A7
    jr   z, jr_018_7C39                           ; $7C1F: $28 $18

    ld   a, $30                                   ; $7C21: $3E $30
    call label_3BB5                               ; $7C23: $CD $B5 $3B
    ldh  a, [hScratchA]                           ; $7C26: $F0 $D7
    cpl                                           ; $7C28: $2F
    inc  a                                        ; $7C29: $3C
    ldh  [hLinkPositionYIncrement], a             ; $7C2A: $E0 $9B
    ldh  a, [hScratchB]                           ; $7C2C: $F0 $D8
    cpl                                           ; $7C2E: $2F
    inc  a                                        ; $7C2F: $3C
    ldh  [hLinkPositionXIncrement], a             ; $7C30: $E0 $9A
    push bc                                       ; $7C32: $C5
    call UpdateFinalLinkPosition                  ; $7C33: $CD $A8 $21
    pop  bc                                       ; $7C36: $C1
    jr   jr_018_7C46                              ; $7C37: $18 $0D

jr_018_7C39:
    call func_018_7E5F                            ; $7C39: $CD $5F $7E
    call GetEntityTransitionCountdown             ; $7C3C: $CD $05 $0C
    jr   nz, jr_018_7C54                          ; $7C3F: $20 $13

    ld   a, $30                                   ; $7C41: $3E $30
    call label_3BAA                               ; $7C43: $CD $AA $3B

jr_018_7C46:
    call label_3B5A                               ; $7C46: $CD $5A $3B
    jr   nc, jr_018_7CAE                          ; $7C49: $30 $63

    xor  a                                        ; $7C4B: $AF
    ld   [$C1C6], a                               ; $7C4C: $EA $C6 $C1
    call func_018_7F08                            ; $7C4F: $CD $08 $7F
    jr   jr_018_7CAE                              ; $7C52: $18 $5A

jr_018_7C54:
    ld   a, $06                                   ; $7C54: $3E $06
    ld   [$C19E], a                               ; $7C56: $EA $9E $C1
    call label_3B7B                               ; $7C59: $CD $7B $3B
    ld   hl, wEntitiesCollisionsTable             ; $7C5C: $21 $A0 $C2
    add  hl, bc                                   ; $7C5F: $09
    ld   a, [hl]                                  ; $7C60: $7E
    and  a                                        ; $7C61: $A7
    jr   nz, jr_018_7CAF                          ; $7C62: $20 $4B

    call label_3B23                               ; $7C64: $CD $23 $3B
    ld   a, [wIsIndoor]                           ; $7C67: $FA $A5 $DB
    and  a                                        ; $7C6A: $A7
    jr   z, jr_018_7CAE                           ; $7C6B: $28 $41

    call func_018_6493                            ; $7C6D: $CD $93 $64
    ld   hl, wEntity0SpeedY                       ; $7C70: $21 $50 $C2
    add  hl, bc                                   ; $7C73: $09
    ld   a, [hl]                                  ; $7C74: $7E
    and  a                                        ; $7C75: $A7
    jr   z, jr_018_7CAE                           ; $7C76: $28 $36

    ld   e, $9E                                   ; $7C78: $1E $9E
    bit  7, a                                     ; $7C7A: $CB $7F
    jr   nz, jr_018_7C80                          ; $7C7C: $20 $02

    ld   e, $9F                                   ; $7C7E: $1E $9F

jr_018_7C80:
    ldh  a, [hFFAF]                               ; $7C80: $F0 $AF
    cp   e                                        ; $7C82: $BB
    jr   nz, jr_018_7CAE                          ; $7C83: $20 $29

    ld   a, $68                                   ; $7C85: $3E $68
    call label_3B86                               ; $7C87: $CD $86 $3B
    ld   hl, wEntity0PosX                         ; $7C8A: $21 $00 $C2
    add  hl, de                                   ; $7C8D: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $7C8E: $F0 $CE
    add  $08                                      ; $7C90: $C6 $08
    ld   [hl], a                                  ; $7C92: $77
    ld   hl, wEntity0PosY                         ; $7C93: $21 $10 $C2
    add  hl, de                                   ; $7C96: $19
    ldh  a, [hSwordIntersectedAreaY]              ; $7C97: $F0 $CD
    add  $10                                      ; $7C99: $C6 $10
    ld   [hl], a                                  ; $7C9B: $77
    ldh  a, [hFFAF]                               ; $7C9C: $F0 $AF
    cp   $9E                                      ; $7C9E: $FE $9E
    ld   a, $00                                   ; $7CA0: $3E $00
    jr   z, jr_018_7CA5                           ; $7CA2: $28 $01

    inc  a                                        ; $7CA4: $3C

jr_018_7CA5:
    ld   hl, $C380                                ; $7CA5: $21 $80 $C3
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    call GetEntityTransitionCountdown             ; $7CAA: $CD $05 $0C
    ld   [hl], b                                  ; $7CAD: $70

jr_018_7CAE:
    ret                                           ; $7CAE: $C9

jr_018_7CAF:
    call GetEntityTransitionCountdown             ; $7CAF: $CD $05 $0C
    ld   [hl], b                                  ; $7CB2: $70
    ld   a, $07                                   ; $7CB3: $3E $07
    ldh  [hJingle], a                             ; $7CB5: $E0 $F2
    ldh  a, [wActiveEntityPosX]                   ; $7CB7: $F0 $EE
    ldh  [hScratchA], a                           ; $7CB9: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7CBB: $F0 $EC
    ldh  [hScratchB], a                           ; $7CBD: $E0 $D8
    ld   a, $05                                   ; $7CBF: $3E $05
    jp   label_CC7                                ; $7CC1: $C3 $C7 $0C

    ld   [hl], $00                                ; $7CC4: $36 $00
    ld   [hl], $20                                ; $7CC6: $36 $20

func_018_7CC8:
    ld   de, $7CC4                                ; $7CC8: $11 $C4 $7C
    call label_3BC0                               ; $7CCB: $CD $C0 $3B
    ldh  a, [wActiveEntityPosX]                   ; $7CCE: $F0 $EE
    ld   hl, hLinkPositionX                       ; $7CD0: $21 $98 $FF
    sub  [hl]                                     ; $7CD3: $96
    sra  a                                        ; $7CD4: $CB $2F
    sra  a                                        ; $7CD6: $CB $2F
    ldh  [hScratchA], a                           ; $7CD8: $E0 $D7
    ldh  [hScratchC], a                           ; $7CDA: $E0 $D9
    ldh  a, [$FFEF]                               ; $7CDC: $F0 $EF
    ld   hl, hLinkPositionY                       ; $7CDE: $21 $99 $FF
    sub  [hl]                                     ; $7CE1: $96
    sra  a                                        ; $7CE2: $CB $2F
    sra  a                                        ; $7CE4: $CB $2F
    ldh  [hScratchB], a                           ; $7CE6: $E0 $D8
    ldh  [hScratchD], a                           ; $7CE8: $E0 $DA
    ld   a, [$C3C0]                               ; $7CEA: $FA $C0 $C3
    ld   e, a                                     ; $7CED: $5F
    ld   d, $00                                   ; $7CEE: $16 $00
    ld   hl, $C030                                ; $7CF0: $21 $30 $C0
    add  hl, de                                   ; $7CF3: $19
    ld   e, l                                     ; $7CF4: $5D
    ld   d, h                                     ; $7CF5: $54
    ld   a, $03                                   ; $7CF6: $3E $03

jr_018_7CF8:
    ldh  [$FFDB], a                               ; $7CF8: $E0 $DB
    ld   hl, hFrameCounter                        ; $7CFA: $21 $E7 $FF
    xor  [hl]                                     ; $7CFD: $AE
    and  $01                                      ; $7CFE: $E6 $01
    jr   nz, jr_018_7D09                          ; $7D00: $20 $07

    ldh  a, [hLinkPositionY]                      ; $7D02: $F0 $99
    ld   hl, hScratchB                            ; $7D04: $21 $D8 $FF
    add  [hl]                                     ; $7D07: $86
    ld   [de], a                                  ; $7D08: $12

jr_018_7D09:
    inc  de                                       ; $7D09: $13
    ldh  a, [hLinkPositionX]                      ; $7D0A: $F0 $98
    ld   hl, hScratchA                            ; $7D0C: $21 $D7 $FF
    add  [hl]                                     ; $7D0F: $86
    add  $04                                      ; $7D10: $C6 $04
    ld   [de], a                                  ; $7D12: $12
    inc  de                                       ; $7D13: $13
    ld   a, $24                                   ; $7D14: $3E $24
    ld   [de], a                                  ; $7D16: $12
    inc  de                                       ; $7D17: $13
    ld   a, $00                                   ; $7D18: $3E $00
    ld   [de], a                                  ; $7D1A: $12
    inc  de                                       ; $7D1B: $13
    ldh  a, [hScratchA]                           ; $7D1C: $F0 $D7
    ld   hl, hScratchC                            ; $7D1E: $21 $D9 $FF
    add  [hl]                                     ; $7D21: $86
    ldh  [hScratchA], a                           ; $7D22: $E0 $D7
    ldh  a, [hScratchB]                           ; $7D24: $F0 $D8
    ld   hl, hScratchD                            ; $7D26: $21 $DA $FF
    add  [hl]                                     ; $7D29: $86
    ldh  [hScratchB], a                           ; $7D2A: $E0 $D8
    ldh  a, [$FFDB]                               ; $7D2C: $F0 $DB
    dec  a                                        ; $7D2E: $3D
    jr   nz, jr_018_7CF8                          ; $7D2F: $20 $C7

    ld   a, $03                                   ; $7D31: $3E $03
    jp   label_3DA0                               ; $7D33: $C3 $A0 $3D

func_018_7D36:
    call label_3B5A                               ; $7D36: $CD $5A $3B
    jr   nc, jr_018_7D5A                          ; $7D39: $30 $1F

func_018_7D3B:
    call CopyLinkFinalPositionToPosition          ; $7D3B: $CD $BE $0C
    call label_CB6                                ; $7D3E: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $7D41: $FA $A6 $C1
    and  a                                        ; $7D44: $A7
    jr   z, jr_018_7D58                           ; $7D45: $28 $11

    ld   e, a                                     ; $7D47: $5F
    ld   d, b                                     ; $7D48: $50
    ld   hl, $C39F                                ; $7D49: $21 $9F $C3
    add  hl, de                                   ; $7D4C: $19
    ld   a, [hl]                                  ; $7D4D: $7E
    cp   $03                                      ; $7D4E: $FE $03
    jr   nz, jr_018_7D58                          ; $7D50: $20 $06

    ld   hl, wEntityFState                        ; $7D52: $21 $8F $C2
    add  hl, de                                   ; $7D55: $19
    ld   [hl], $00                                ; $7D56: $36 $00

jr_018_7D58:
    scf                                           ; $7D58: $37
    ret                                           ; $7D59: $C9

jr_018_7D5A:
    and  a                                        ; $7D5A: $A7
    ret                                           ; $7D5B: $C9

    ld   b, $04                                   ; $7D5C: $06 $04
    ld   [bc], a                                  ; $7D5E: $02
    nop                                           ; $7D5F: $00

func_018_7D60:
    ld   hl, $C380                                ; $7D60: $21 $80 $C3
    add  hl, bc                                   ; $7D63: $09
    ld   e, [hl]                                  ; $7D64: $5E
    ld   d, b                                     ; $7D65: $50
    ld   hl, $7D5C                                ; $7D66: $21 $5C $7D
    add  hl, de                                   ; $7D69: $19
    push hl                                       ; $7D6A: $E5
    ld   hl, $C3D0                                ; $7D6B: $21 $D0 $C3
    add  hl, bc                                   ; $7D6E: $09
    inc  [hl]                                     ; $7D6F: $34
    ld   a, [hl]                                  ; $7D70: $7E
    rra                                           ; $7D71: $1F
    rra                                           ; $7D72: $1F
    rra                                           ; $7D73: $1F
    rra                                           ; $7D74: $1F
    pop  hl                                       ; $7D75: $E1
    and  $01                                      ; $7D76: $E6 $01
    or   [hl]                                     ; $7D78: $B6
    jp   label_3B0C                               ; $7D79: $C3 $0C $3B

func_018_7D7C:
    ld   e, b                                     ; $7D7C: $58
    ldh  a, [hLinkPositionY]                      ; $7D7D: $F0 $99
    ld   hl, $FFEF                                ; $7D7F: $21 $EF $FF
    sub  [hl]                                     ; $7D82: $96
    add  $18                                      ; $7D83: $C6 $18
    cp   $38                                      ; $7D85: $FE $38
    jr   jr_018_7DA0                              ; $7D87: $18 $17

func_018_7D89:
    ldh  a, [hLinkPositionY]                      ; $7D89: $F0 $99
    ld   hl, $FFEF                                ; $7D8B: $21 $EF $FF
    sub  [hl]                                     ; $7D8E: $96
    add  $14                                      ; $7D8F: $C6 $14
    cp   $38                                      ; $7D91: $FE $38
    jr   jr_018_7DA0                              ; $7D93: $18 $0B

func_018_7D95:
    ld   e, b                                     ; $7D95: $58
    ldh  a, [hLinkPositionY]                      ; $7D96: $F0 $99
    ld   hl, $FFEF                                ; $7D98: $21 $EF $FF
    sub  [hl]                                     ; $7D9B: $96
    add  $14                                      ; $7D9C: $C6 $14
    cp   $28                                      ; $7D9E: $FE $28

func_018_7DA0:
jr_018_7DA0:
    jr   nc, jr_018_7DE6                          ; $7DA0: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7DA2: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $7DA4: $21 $EE $FF
    sub  [hl]                                     ; $7DA7: $96
    add  $10                                      ; $7DA8: $C6 $10
    cp   $20                                      ; $7DAA: $FE $20
    jr   nc, jr_018_7DE6                          ; $7DAC: $30 $38

    inc  e                                        ; $7DAE: $1C
    ldh  a, [hActiveEntityType]                   ; $7DAF: $F0 $EB
    cp   $C4                                      ; $7DB1: $FE $C4
    jr   z, jr_018_7DC1                           ; $7DB3: $28 $0C

    push de                                       ; $7DB5: $D5
    call func_018_7EE1                            ; $7DB6: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $7DB9: $F0 $9E
    xor  $01                                      ; $7DBB: $EE $01
    cp   e                                        ; $7DBD: $BB
    pop  de                                       ; $7DBE: $D1
    jr   nz, jr_018_7DE6                          ; $7DBF: $20 $25

jr_018_7DC1:
    ld   hl, $C1AD                                ; $7DC1: $21 $AD $C1
    ld   [hl], $01                                ; $7DC4: $36 $01
    ld   a, [wDialogState]                        ; $7DC6: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7DC9: $21 $4F $C1
    or   [hl]                                     ; $7DCC: $B6
    ld   hl, $C146                                ; $7DCD: $21 $46 $C1
    or   [hl]                                     ; $7DD0: $B6
    ld   hl, $C134                                ; $7DD1: $21 $34 $C1
    or   [hl]                                     ; $7DD4: $B6
    jr   nz, jr_018_7DE6                          ; $7DD5: $20 $0F

    ld   a, [wWindowY]                            ; $7DD7: $FA $9A $DB
    cp   $80                                      ; $7DDA: $FE $80
    jr   nz, jr_018_7DE6                          ; $7DDC: $20 $08

    ldh  a, [hFFCC]                               ; $7DDE: $F0 $CC
    and  $10                                      ; $7DE0: $E6 $10
    jr   z, jr_018_7DE6                           ; $7DE2: $28 $02

    scf                                           ; $7DE4: $37
    ret                                           ; $7DE5: $C9

jr_018_7DE6:
    and  a                                        ; $7DE6: $A7
    ret                                           ; $7DE7: $C9

func_018_7DE8:
    ldh  a, [hActiveEntityState]                  ; $7DE8: $F0 $EA
    cp   $05                                      ; $7DEA: $FE $05
    jr   nz, jr_018_7E13                          ; $7DEC: $20 $25

func_018_7DEE:
    ld   a, [wGameplayType]                       ; $7DEE: $FA $95 $DB
    cp   $07                                      ; $7DF1: $FE $07
    jr   z, jr_018_7E13                           ; $7DF3: $28 $1E

    cp   $0B                                      ; $7DF5: $FE $0B
    jr   nz, jr_018_7E13                          ; $7DF7: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DF9: $FA $6B $C1
    cp   $04                                      ; $7DFC: $FE $04
    jr   nz, jr_018_7E13                          ; $7DFE: $20 $13

    ld   hl, $C1A8                                ; $7E00: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7E03: $FA $9F $C1
    or   [hl]                                     ; $7E06: $B6
    ld   hl, wInventoryAppearing                  ; $7E07: $21 $4F $C1
    or   [hl]                                     ; $7E0A: $B6
    jr   nz, jr_018_7E13                          ; $7E0B: $20 $06

    ld   a, [wRoomTransitionState]                ; $7E0D: $FA $24 $C1
    and  a                                        ; $7E10: $A7
    jr   z, jr_018_7E14                           ; $7E11: $28 $01

jr_018_7E13:
    pop  af                                       ; $7E13: $F1

jr_018_7E14:
    ret                                           ; $7E14: $C9

func_018_7E15:
    ld   hl, $C410                                ; $7E15: $21 $10 $C4
    add  hl, bc                                   ; $7E18: $09
    ld   a, [hl]                                  ; $7E19: $7E
    and  a                                        ; $7E1A: $A7
    jr   z, jr_018_7E5E                           ; $7E1B: $28 $41

    dec  a                                        ; $7E1D: $3D
    ld   [hl], a                                  ; $7E1E: $77
    call label_3E8E                               ; $7E1F: $CD $8E $3E
    ld   hl, wEntity0SpeedX                       ; $7E22: $21 $40 $C2
    add  hl, bc                                   ; $7E25: $09
    ld   a, [hl]                                  ; $7E26: $7E
    push af                                       ; $7E27: $F5
    ld   hl, wEntity0SpeedY                       ; $7E28: $21 $50 $C2
    add  hl, bc                                   ; $7E2B: $09
    ld   a, [hl]                                  ; $7E2C: $7E
    push af                                       ; $7E2D: $F5
    ld   hl, $C3F0                                ; $7E2E: $21 $F0 $C3
    add  hl, bc                                   ; $7E31: $09
    ld   a, [hl]                                  ; $7E32: $7E
    ld   hl, wEntity0SpeedX                       ; $7E33: $21 $40 $C2
    add  hl, bc                                   ; $7E36: $09
    ld   [hl], a                                  ; $7E37: $77
    ld   hl, $C400                                ; $7E38: $21 $00 $C4
    add  hl, bc                                   ; $7E3B: $09
    ld   a, [hl]                                  ; $7E3C: $7E
    ld   hl, wEntity0SpeedY                       ; $7E3D: $21 $50 $C2
    add  hl, bc                                   ; $7E40: $09
    ld   [hl], a                                  ; $7E41: $77
    call func_018_7E5F                            ; $7E42: $CD $5F $7E
    ld   hl, $C430                                ; $7E45: $21 $30 $C4
    add  hl, bc                                   ; $7E48: $09
    ld   a, [hl]                                  ; $7E49: $7E
    and  $20                                      ; $7E4A: $E6 $20
    jr   nz, jr_018_7E51                          ; $7E4C: $20 $03

    call label_3B23                               ; $7E4E: $CD $23 $3B

jr_018_7E51:
    ld   hl, wEntity0SpeedY                       ; $7E51: $21 $50 $C2
    add  hl, bc                                   ; $7E54: $09
    pop  af                                       ; $7E55: $F1
    ld   [hl], a                                  ; $7E56: $77
    ld   hl, wEntity0SpeedX                       ; $7E57: $21 $40 $C2
    add  hl, bc                                   ; $7E5A: $09
    pop  af                                       ; $7E5B: $F1
    ld   [hl], a                                  ; $7E5C: $77
    pop  af                                       ; $7E5D: $F1

jr_018_7E5E:
    ret                                           ; $7E5E: $C9

func_018_7E5F:
label_018_7E5F:
    call func_018_7E6C                            ; $7E5F: $CD $6C $7E

func_018_7E62:
label_018_7E62:
    push bc                                       ; $7E62: $C5
    ld   a, c                                     ; $7E63: $79
    add  $10                                      ; $7E64: $C6 $10
    ld   c, a                                     ; $7E66: $4F
    call func_018_7E6C                            ; $7E67: $CD $6C $7E
    pop  bc                                       ; $7E6A: $C1
    ret                                           ; $7E6B: $C9

func_018_7E6C:
label_018_7E6C:
    ld   hl, wEntity0SpeedX                       ; $7E6C: $21 $40 $C2
    add  hl, bc                                   ; $7E6F: $09
    ld   a, [hl]                                  ; $7E70: $7E
    and  a                                        ; $7E71: $A7
    jr   z, jr_018_7E97                           ; $7E72: $28 $23

    push af                                       ; $7E74: $F5
    swap a                                        ; $7E75: $CB $37
    and  $F0                                      ; $7E77: $E6 $F0
    ld   hl, $C260                                ; $7E79: $21 $60 $C2
    add  hl, bc                                   ; $7E7C: $09
    add  [hl]                                     ; $7E7D: $86
    ld   [hl], a                                  ; $7E7E: $77
    rl   d                                        ; $7E7F: $CB $12
    ld   hl, wEntity0PosX                         ; $7E81: $21 $00 $C2

jr_018_7E84:
    add  hl, bc                                   ; $7E84: $09
    pop  af                                       ; $7E85: $F1
    ld   e, $00                                   ; $7E86: $1E $00
    bit  7, a                                     ; $7E88: $CB $7F
    jr   z, jr_018_7E8E                           ; $7E8A: $28 $02

    ld   e, $F0                                   ; $7E8C: $1E $F0

jr_018_7E8E:
    swap a                                        ; $7E8E: $CB $37
    and  $0F                                      ; $7E90: $E6 $0F
    or   e                                        ; $7E92: $B3
    rr   d                                        ; $7E93: $CB $1A
    adc  [hl]                                     ; $7E95: $8E
    ld   [hl], a                                  ; $7E96: $77

jr_018_7E97:
    ret                                           ; $7E97: $C9

func_018_7E98:
    ld   hl, wEntitiesSpeedZTable                 ; $7E98: $21 $20 $C3
    add  hl, bc                                   ; $7E9B: $09
    ld   a, [hl]                                  ; $7E9C: $7E
    and  a                                        ; $7E9D: $A7
    jr   z, jr_018_7E97                           ; $7E9E: $28 $F7

    push af                                       ; $7EA0: $F5
    swap a                                        ; $7EA1: $CB $37
    and  $F0                                      ; $7EA3: $E6 $F0
    ld   hl, $C330                                ; $7EA5: $21 $30 $C3
    add  hl, bc                                   ; $7EA8: $09
    add  [hl]                                     ; $7EA9: $86
    ld   [hl], a                                  ; $7EAA: $77
    rl   d                                        ; $7EAB: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7EAD: $21 $10 $C3
    jr   jr_018_7E84                              ; $7EB0: $18 $D2

func_018_7EB2:
    ld   e, $00                                   ; $7EB2: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7EB4: $F0 $98
    ld   hl, wEntity0PosX                         ; $7EB6: $21 $00 $C2
    add  hl, bc                                   ; $7EB9: $09
    sub  [hl]                                     ; $7EBA: $96
    bit  7, a                                     ; $7EBB: $CB $7F
    jr   z, jr_018_7EC0                           ; $7EBD: $28 $01

    inc  e                                        ; $7EBF: $1C

jr_018_7EC0:
    ld   d, a                                     ; $7EC0: $57
    ret                                           ; $7EC1: $C9

func_018_7EC2:
    ld   e, $02                                   ; $7EC2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7EC4: $F0 $99
    ld   hl, wEntity0PosY                         ; $7EC6: $21 $10 $C2
    add  hl, bc                                   ; $7EC9: $09
    sub  [hl]                                     ; $7ECA: $96
    bit  7, a                                     ; $7ECB: $CB $7F
    jr   nz, jr_018_7ED0                          ; $7ECD: $20 $01

    inc  e                                        ; $7ECF: $1C

jr_018_7ED0:
    ld   d, a                                     ; $7ED0: $57
    ret                                           ; $7ED1: $C9

func_018_7ED2:
    ld   e, $02                                   ; $7ED2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7ED4: $F0 $99
    ld   hl, wActiveEntityPosY                    ; $7ED6: $21 $EC $FF
    sub  [hl]                                     ; $7ED9: $96
    bit  7, a                                     ; $7EDA: $CB $7F
    jr   nz, jr_018_7EDF                          ; $7EDC: $20 $01

    inc  e                                        ; $7EDE: $1C

jr_018_7EDF:
    ld   d, a                                     ; $7EDF: $57
    ret                                           ; $7EE0: $C9

func_018_7EE1:
    call func_018_7EB2                            ; $7EE1: $CD $B2 $7E
    ld   a, e                                     ; $7EE4: $7B
    ldh  [hScratchA], a                           ; $7EE5: $E0 $D7
    ld   a, d                                     ; $7EE7: $7A
    bit  7, a                                     ; $7EE8: $CB $7F
    jr   z, jr_018_7EEE                           ; $7EEA: $28 $02

    cpl                                           ; $7EEC: $2F
    inc  a                                        ; $7EED: $3C

jr_018_7EEE:
    push af                                       ; $7EEE: $F5
    call func_018_7EC2                            ; $7EEF: $CD $C2 $7E
    ld   a, e                                     ; $7EF2: $7B
    ldh  [hScratchB], a                           ; $7EF3: $E0 $D8
    ld   a, d                                     ; $7EF5: $7A
    bit  7, a                                     ; $7EF6: $CB $7F
    jr   z, jr_018_7EFC                           ; $7EF8: $28 $02

    cpl                                           ; $7EFA: $2F
    inc  a                                        ; $7EFB: $3C

jr_018_7EFC:
    pop  de                                       ; $7EFC: $D1
    cp   d                                        ; $7EFD: $BA
    jr   nc, jr_018_7F04                          ; $7EFE: $30 $04

    ldh  a, [hScratchA]                           ; $7F00: $F0 $D7
    jr   jr_018_7F06                              ; $7F02: $18 $02

jr_018_7F04:
    ldh  a, [hScratchB]                           ; $7F04: $F0 $D8

jr_018_7F06:
    ld   e, a                                     ; $7F06: $5F
    ret                                           ; $7F07: $C9

func_018_7F08:
label_018_7F08:
    ld   hl, wEntity0State                        ; $7F08: $21 $80 $C2
    add  hl, bc                                   ; $7F0B: $09
    ld   [hl], $00                                ; $7F0C: $36 $00
    ret                                           ; $7F0E: $C9

func_018_7F0F:
label_018_7F0F:
    ld   hl, wEntitiesUnknownTableC               ; $7F0F: $21 $C0 $C2
    add  hl, bc                                   ; $7F12: $09
    ld   a, [hl]                                  ; $7F13: $7E
    rst  $00                                      ; $7F14: $C7
    dec  de                                       ; $7F15: $1B
    ld   a, a                                     ; $7F16: $7F
    inc  l                                        ; $7F17: $2C
    ld   a, a                                     ; $7F18: $7F
    dec  sp                                       ; $7F19: $3B
    ld   a, a                                     ; $7F1A: $7F
    call GetEntityTransitionCountdown             ; $7F1B: $CD $05 $0C
    ld   [hl], $A0                                ; $7F1E: $36 $A0
    ld   hl, $C420                                ; $7F20: $21 $20 $C4
    add  hl, bc                                   ; $7F23: $09
    ld   [hl], $FF                                ; $7F24: $36 $FF

label_018_7F26:
    ld   hl, wEntitiesUnknownTableC               ; $7F26: $21 $C0 $C2
    add  hl, bc                                   ; $7F29: $09
    inc  [hl]                                     ; $7F2A: $34
    ret                                           ; $7F2B: $C9

    call GetEntityTransitionCountdown             ; $7F2C: $CD $05 $0C
    ret  nz                                       ; $7F2F: $C0

    ld   [hl], $C0                                ; $7F30: $36 $C0
    ld   hl, $C420                                ; $7F32: $21 $20 $C4
    add  hl, bc                                   ; $7F35: $09
    ld   [hl], $FF                                ; $7F36: $36 $FF
    jp   label_018_7F26                           ; $7F38: $C3 $26 $7F

    call GetEntityTransitionCountdown             ; $7F3B: $CD $05 $0C
    jr   nz, jr_018_7F4C                          ; $7F3E: $20 $0C

    call PlayBombExplosionSfx                     ; $7F40: $CD $4B $0C
    call label_27DD                               ; $7F43: $CD $DD $27
    call func_018_7FB9                            ; $7F46: $CD $B9 $7F
    jp   label_3F50                               ; $7F49: $C3 $50 $3F

jr_018_7F4C:
    jp   label_018_7F4F                           ; $7F4C: $C3 $4F $7F

label_018_7F4F:
    and  $07                                      ; $7F4F: $E6 $07
    ret  nz                                       ; $7F51: $C0

    call GetRandomByte                            ; $7F52: $CD $0D $28
    and  $1F                                      ; $7F55: $E6 $1F
    sub  $10                                      ; $7F57: $D6 $10
    ld   e, a                                     ; $7F59: $5F
    ld   hl, wActiveEntityPosX                    ; $7F5A: $21 $EE $FF
    add  [hl]                                     ; $7F5D: $86
    ld   [hl], a                                  ; $7F5E: $77
    call GetRandomByte                            ; $7F5F: $CD $0D $28
    and  $1F                                      ; $7F62: $E6 $1F
    sub  $14                                      ; $7F64: $D6 $14
    ld   e, a                                     ; $7F66: $5F
    ld   hl, wActiveEntityPosY                    ; $7F67: $21 $EC $FF
    add  [hl]                                     ; $7F6A: $86
    ld   [hl], a                                  ; $7F6B: $77
    jp   label_018_7F6F                           ; $7F6C: $C3 $6F $7F

label_018_7F6F:
    call func_018_7DEE                            ; $7F6F: $CD $EE $7D
    ldh  a, [wActiveEntityPosX]                   ; $7F72: $F0 $EE
    ldh  [hScratchA], a                           ; $7F74: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7F76: $F0 $EC
    ldh  [hScratchB], a                           ; $7F78: $E0 $D8
    ld   a, $02                                   ; $7F7A: $3E $02
    call label_CC7                                ; $7F7C: $CD $C7 $0C
    ld   a, $13                                   ; $7F7F: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F81: $E0 $F4
    ret                                           ; $7F83: $C9

    ld   a, $36                                   ; $7F84: $3E $36
    call label_3B86                               ; $7F86: $CD $86 $3B
    ldh  a, [hScratchA]                           ; $7F89: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7F8B: $21 $00 $C2
    add  hl, de                                   ; $7F8E: $19
    ld   [hl], a                                  ; $7F8F: $77
    ldh  a, [hScratchB]                           ; $7F90: $F0 $D8
    ld   hl, wEntity0PosY                         ; $7F92: $21 $10 $C2
    add  hl, de                                   ; $7F95: $19
    ld   [hl], a                                  ; $7F96: $77
    ldh  a, [hIsSideScrolling]                    ; $7F97: $F0 $F9
    and  a                                        ; $7F99: $A7
    jr   z, jr_018_7FA4                           ; $7F9A: $28 $08

    ld   hl, wEntity0SpeedY                       ; $7F9C: $21 $50 $C2
    add  hl, bc                                   ; $7F9F: $09
    ld   [hl], $F0                                ; $7FA0: $36 $F0
    jr   jr_018_7FB0                              ; $7FA2: $18 $0C

jr_018_7FA4:
    ld   hl, wEntitiesSpeedZTable                 ; $7FA4: $21 $20 $C3
    add  hl, de                                   ; $7FA7: $19
    ld   [hl], $10                                ; $7FA8: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7FAA: $21 $10 $C3
    add  hl, de                                   ; $7FAD: $19
    ld   [hl], $08                                ; $7FAE: $36 $08

jr_018_7FB0:
    call func_018_7F08                            ; $7FB0: $CD $08 $7F
    ld   hl, hNoiseSfx                            ; $7FB3: $21 $F4 $FF
    ld   [hl], $1A                                ; $7FB6: $36 $1A
    ret                                           ; $7FB8: $C9

func_018_7FB9:
label_018_7FB9:
    ld   hl, wOverworldRoomStatus                 ; $7FB9: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7FBC: $F0 $F6
    ld   e, a                                     ; $7FBE: $5F
    ld   a, [wIsIndoor]                           ; $7FBF: $FA $A5 $DB
    ld   d, a                                     ; $7FC2: $57
    ldh  a, [hMapId]                              ; $7FC3: $F0 $F7
    cp   $1A                                      ; $7FC5: $FE $1A
    jr   nc, jr_018_7FCE                          ; $7FC7: $30 $05

    cp   $06                                      ; $7FC9: $FE $06
    jr   c, jr_018_7FCE                           ; $7FCB: $38 $01

    inc  d                                        ; $7FCD: $14

jr_018_7FCE:
    add  hl, de                                   ; $7FCE: $19
    ld   a, [hl]                                  ; $7FCF: $7E
    or   $20                                      ; $7FD0: $F6 $20
    ld   [hl], a                                  ; $7FD2: $77
    ldh  [hRoomStatus], a                         ; $7FD3: $E0 $F8
    ret                                           ; $7FD5: $C9
