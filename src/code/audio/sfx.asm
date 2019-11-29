; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

func_01F_4204:
label_01F_4204:
    ld   hl, wActiveJingle                        ; $4204: $21 $60 $D3
    ld   a, [hl]                                  ; $4207: $7E
    and  a                                        ; $4208: $A7
    jr   z, jr_01F_421C                           ; $4209: $28 $11

    cp   $01                                      ; $420B: $FE $01
    jr   z, jr_01F_4216                           ; $420D: $28 $07

    ld   a, [$D3C6]                               ; $420F: $FA $C6 $D3
    and  a                                        ; $4212: $A7
    jp   nz, label_01F_53E6                       ; $4213: $C2 $E6 $53

jr_01F_4216:
    ld   a, [hl]                                  ; $4216: $7E
    ld   hl, SfxPointersTable                        ; $4217: $21 $00 $41
    jr   jr_01F_4223                              ; $421A: $18 $07

jr_01F_421C:
    inc  hl                                       ; $421C: $23
    ld   a, [hl]                                  ; $421D: $7E
    and  a                                        ; $421E: $A7
    ret  z                                        ; $421F: $C8

    ld   hl, $4182                                ; $4220: $21 $82 $41

jr_01F_4223:
    call GetHandlerAddressInTable                 ; $4223: $CD $64 $7A
    ld   de, $D390                                ; $4226: $11 $90 $D3
    ld   bc, $D394                                ; $4229: $01 $94 $D3
    jp   hl                                       ; $422C: $E9

    xor  a                                        ; $422D: $AF
    ld   [wActiveWaveSfx], a                      ; $422E: $EA $70 $D3
    ld   [$D371], a                               ; $4231: $EA $71 $D3
    ldh  [rNR30], a                               ; $4234: $E0 $1A
    ld   a, $01                                   ; $4236: $3E $01
    ld   [$D3C8], a                               ; $4238: $EA $C8 $D3
    ld   hl, $D32F                                ; $423B: $21 $2F $D3
    set  7, [hl]                                  ; $423E: $CB $FE
    ld   hl, $D33F                                ; $4240: $21 $3F $D3
    set  7, [hl]                                  ; $4243: $CB $FE
    ld   hl, $42EB                                ; $4245: $21 $EB $42
    call func_01F_7A7F                            ; $4248: $CD $7F $7A
    call func_01F_636A                            ; $424B: $CD $6A $63
    ld   hl, $42FF                                ; $424E: $21 $FF $42
    call func_01F_7A85                            ; $4251: $CD $85 $7A
    ld   hl, $42D3                                ; $4254: $21 $D3 $42
    jp   label_01F_5395                           ; $4257: $C3 $95 $53

    call DecrementValueAtDE                            ; $425A: $CD $71 $7A
    ret  nz                                       ; $425D: $C0

    call IncrementValueAtBC                            ; $425E: $CD $75 $7A
    cp   $01                                      ; $4261: $FE $01
    jr   z, jr_01F_4273                           ; $4263: $28 $0E

    cp   $02                                      ; $4265: $FE $02
    jr   z, jr_01F_4285                           ; $4267: $28 $1C

    cp   $03                                      ; $4269: $FE $03
    jr   z, jr_01F_4297                           ; $426B: $28 $2A

    cp   $04                                      ; $426D: $FE $04
    jr   z, jr_01F_42A9                           ; $426F: $28 $38

    jr   jr_01F_42BB                              ; $4271: $18 $48

jr_01F_4273:
    ld   hl, $42D9                                ; $4273: $21 $D9 $42
    call func_01F_7A79                            ; $4276: $CD $79 $7A
    ld   hl, $42F0                                ; $4279: $21 $F0 $42
    call func_01F_7A7F                            ; $427C: $CD $7F $7A
    ld   hl, $4305                                ; $427F: $21 $05 $43
    jp   label_01F_7A85                           ; $4282: $C3 $85 $7A

jr_01F_4285:
    ld   hl, $42DF                                ; $4285: $21 $DF $42
    call func_01F_7A79                            ; $4288: $CD $79 $7A
    ld   hl, $42F5                                ; $428B: $21 $F5 $42
    call func_01F_7A7F                            ; $428E: $CD $7F $7A
    ld   hl, $430B                                ; $4291: $21 $0B $43
    jp   label_01F_7A85                           ; $4294: $C3 $85 $7A

jr_01F_4297:
    ld   hl, $42E5                                ; $4297: $21 $E5 $42
    call func_01F_7A79                            ; $429A: $CD $79 $7A
    ld   hl, $42FA                                ; $429D: $21 $FA $42
    call func_01F_7A7F                            ; $42A0: $CD $7F $7A
    ld   hl, $4311                                ; $42A3: $21 $11 $43
    jp   label_01F_7A85                           ; $42A6: $C3 $85 $7A

jr_01F_42A9:
    ld   hl, $4317                                ; $42A9: $21 $17 $43
    call func_01F_7A79                            ; $42AC: $CD $79 $7A
    ld   hl, $431D                                ; $42AF: $21 $1D $43
    call func_01F_7A7F                            ; $42B2: $CD $7F $7A
    ld   hl, $4317                                ; $42B5: $21 $17 $43
    jp   label_01F_7A85                           ; $42B8: $C3 $85 $7A

jr_01F_42BB:
    ld   hl, $D32F                                ; $42BB: $21 $2F $D3
    res  7, [hl]                                  ; $42BE: $CB $BE
    ld   hl, $D33F                                ; $42C0: $21 $3F $D3
    res  7, [hl]                                  ; $42C3: $CB $BE
    xor  a                                        ; $42C5: $AF
    ldh  [rNR30], a                               ; $42C6: $E0 $1A
    ld   [$D3C8], a                               ; $42C8: $EA $C8 $D3
    ld   a, $01                                   ; $42CB: $3E $01
    ld   [$D3E7], a                               ; $42CD: $EA $E7 $D3
    jp   label_01F_53BB                           ; $42D0: $C3 $BB $53

    nop                                           ; $42D3: $00
    add  b                                        ; $42D4: $80
    add  b                                        ; $42D5: $80
    adc  c                                        ; $42D6: $89
    add  [hl]                                     ; $42D7: $86
    ld   a, [bc]                                  ; $42D8: $0A
    nop                                           ; $42D9: $00
    add  b                                        ; $42DA: $80
    add  b                                        ; $42DB: $80
    sbc  [hl]                                     ; $42DC: $9E
    add  [hl]                                     ; $42DD: $86
    ld   a, [bc]                                  ; $42DE: $0A
    nop                                           ; $42DF: $00
    add  b                                        ; $42E0: $80
    add  b                                        ; $42E1: $80
    or   d                                        ; $42E2: $B2
    add  [hl]                                     ; $42E3: $86
    ld   a, [bc]                                  ; $42E4: $0A
    nop                                           ; $42E5: $00
    add  b                                        ; $42E6: $80
    add  b                                        ; $42E7: $80
    call nz, $3086                                ; $42E8: $C4 $86 $30
    nop                                           ; $42EB: $00
    ret  nz                                       ; $42EC: $C0

    ld   b, $87                                   ; $42ED: $06 $87
    ld   a, [bc]                                  ; $42EF: $0A
    nop                                           ; $42F0: $00
    ret  nz                                       ; $42F1: $C0

    inc  d                                        ; $42F2: $14
    add  a                                        ; $42F3: $87
    ld   a, [bc]                                  ; $42F4: $0A
    nop                                           ; $42F5: $00
    ret  nz                                       ; $42F6: $C0

    ld   hl, $0A87                                ; $42F7: $21 $87 $0A
    nop                                           ; $42FA: $00
    ret  nz                                       ; $42FB: $C0

    dec  l                                        ; $42FC: $2D
    add  a                                        ; $42FD: $87
    jr   nc, @-$7E                                ; $42FE: $30 $80

    nop                                           ; $4300: $00
    jr   nz, @+$6D                                ; $4301: $20 $6B

    add  a                                        ; $4303: $87
    ld   a, [bc]                                  ; $4304: $0A
    add  b                                        ; $4305: $80
    nop                                           ; $4306: $00
    jr   nz, jr_01F_437C                          ; $4307: $20 $73

    add  a                                        ; $4309: $87
    ld   a, [bc]                                  ; $430A: $0A
    add  b                                        ; $430B: $80
    nop                                           ; $430C: $00
    jr   nz, jr_01F_438A                          ; $430D: $20 $7B

    add  a                                        ; $430F: $87
    ld   a, [bc]                                  ; $4310: $0A
    add  b                                        ; $4311: $80
    nop                                           ; $4312: $00
    jr   nz, @-$7B                                ; $4313: $20 $83

    add  a                                        ; $4315: $87
    jr   nc, jr_01F_4318                          ; $4316: $30 $00

jr_01F_4318:
    nop                                           ; $4318: $00
    nop                                           ; $4319: $00
    nop                                           ; $431A: $00
    ret  nz                                       ; $431B: $C0

    jr   nz, @+$41                                ; $431C: $20 $3F

    nop                                           ; $431E: $00
    nop                                           ; $431F: $00
    pop  bc                                       ; $4320: $C1
    jr   nz, @+$23                                ; $4321: $20 $21

    ld   d, e                                     ; $4323: $53
    ld   b, e                                     ; $4324: $43
    jp   label_01F_5395                           ; $4325: $C3 $95 $53

    call DecrementValueAtDE                            ; $4328: $CD $71 $7A
    ret  nz                                       ; $432B: $C0

    call IncrementValueAtBC                            ; $432C: $CD $75 $7A
    cp   $08                                      ; $432F: $FE $08
    jp   z, label_01F_53BB                        ; $4331: $CA $BB $53

    ld   hl, $4345                                ; $4334: $21 $45 $43
    call GetHandlerAddressInTable                 ; $4337: $CD $64 $7A
    ld   a, $80                                   ; $433A: $3E $80
    ldh  [rNR11], a                               ; $433C: $E0 $11
    ld   a, $F1                                   ; $433E: $3E $F1
    ldh  [rNR12], a                               ; $4340: $E0 $12
    jp   $53DF                                    ; $4342: $C3 $DF $53

    ld   e, c                                     ; $4345: $59
    ld   b, e                                     ; $4346: $43
    ld   e, h                                     ; $4347: $5C
    ld   b, e                                     ; $4348: $43
    ld   e, a                                     ; $4349: $5F
    ld   b, e                                     ; $434A: $43
    ld   h, d                                     ; $434B: $62
    ld   b, e                                     ; $434C: $43
    ld   h, l                                     ; $434D: $65
    ld   b, e                                     ; $434E: $43
    ld   l, b                                     ; $434F: $68
    ld   b, e                                     ; $4350: $43
    ld   l, e                                     ; $4351: $6B
    ld   b, e                                     ; $4352: $43
    nop                                           ; $4353: $00
    add  b                                        ; $4354: $80
    pop  af                                       ; $4355: $F1
    and  a                                        ; $4356: $A7
    rst  $00                                      ; $4357: $C7
    ld   [$C7A2], sp                              ; $4358: $08 $A2 $C7
    ld   [$C790], sp                              ; $435B: $08 $90 $C7
    ld   [$C77B], sp                              ; $435E: $08 $7B $C7
    ld   [$C759], sp                              ; $4361: $08 $59 $C7
    ld   [$C797], sp                              ; $4364: $08 $97 $C7
    ld   [$C7AC], sp                              ; $4367: $08 $AC $C7
    ld   [$C7BE], sp                              ; $436A: $08 $BE $C7
    jr   nz, jr_01F_4390                          ; $436D: $20 $21

    sbc  l                                        ; $436F: $9D
    ld   b, e                                     ; $4370: $43
    call func_01F_7AB7                            ; $4371: $CD $B7 $7A
    jp   label_01F_539A                           ; $4374: $C3 $9A $53

    call IncrementValueAtBC                            ; $4377: $CD $75 $7A
    cp   $0D                                      ; $437A: $FE $0D

jr_01F_437C:
    jp   z, label_01F_53B5                        ; $437C: $CA $B5 $53

    ld   hl, $4385                                ; $437F: $21 $85 $43
    jp   label_01F_7AE1                           ; $4382: $C3 $E1 $7A

    rst  $38                                      ; $4385: $FF
    ret  nz                                       ; $4386: $C0

    rst  $38                                      ; $4387: $FF
    add  b                                        ; $4388: $80
    rst  $38                                      ; $4389: $FF

jr_01F_438A:
    nop                                           ; $438A: $00
    cp   $00                                      ; $438B: $FE $00
    ld   bc, $FF00                                ; $438D: $01 $00 $FF

jr_01F_4390:
    nop                                           ; $4390: $00
    ld   bc, $FF00                                ; $4391: $01 $00 $FF
    nop                                           ; $4394: $00
    nop                                           ; $4395: $00
    ret  nz                                       ; $4396: $C0

    nop                                           ; $4397: $00
    ret  nz                                       ; $4398: $C0

    nop                                           ; $4399: $00
    ret  nz                                       ; $439A: $C0

    nop                                           ; $439B: $00
    ret  nz                                       ; $439C: $C0

    nop                                           ; $439D: $00
    nop                                           ; $439E: $00
    ret  nz                                       ; $439F: $C0

    add  b                                        ; $43A0: $80
    add  [hl]                                     ; $43A1: $86
    ld   bc, $E3E                                 ; $43A2: $01 $3E $0E
    ld   [$D3BC], a                               ; $43A5: $EA $BC $D3
    ld   hl, $43DC                                ; $43A8: $21 $DC $43
    call func_01F_7AB7                            ; $43AB: $CD $B7 $7A
    jp   label_01F_539A                           ; $43AE: $C3 $9A $53

    call DecrementValueAtDE                            ; $43B1: $CD $71 $7A
    ret  nz                                       ; $43B4: $C0

    ld   a, [$D379]                               ; $43B5: $FA $79 $D3
    cp   $02                                      ; $43B8: $FE $02
    jp   z, label_01F_53B5                        ; $43BA: $CA $B5 $53

    ld   a, $02                                   ; $43BD: $3E $02
    ld   [de], a                                  ; $43BF: $12
    call IncrementValueAtBC                            ; $43C0: $CD $75 $7A
    cp   $03                                      ; $43C3: $FE $03
    jr   z, jr_01F_43CD                           ; $43C5: $28 $06

jr_01F_43C7:
    ld   hl, $43D8                                ; $43C7: $21 $D8 $43
    jp   label_01F_7AE1                           ; $43CA: $C3 $E1 $7A

jr_01F_43CD:
    call func_01F_7A9A                            ; $43CD: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $43D0: $CA $BB $53

    ld   a, $01                                   ; $43D3: $3E $01
    ld   [bc], a                                  ; $43D5: $02
    jr   jr_01F_43C7                              ; $43D6: $18 $EF

    nop                                           ; $43D8: $00
    jr   nz, @+$01                                ; $43D9: $20 $FF

    ldh  a, [rP1]                                 ; $43DB: $F0 $00
    add  b                                        ; $43DD: $80
    add  a                                        ; $43DE: $87
    ret  nz                                       ; $43DF: $C0

    add  [hl]                                     ; $43E0: $86
    ld   [bc], a                                  ; $43E1: $02
    ld   a, $04                                   ; $43E2: $3E $04
    ld   [$D3BC], a                               ; $43E4: $EA $BC $D3
    ld   hl, $4417                                ; $43E7: $21 $17 $44
    call func_01F_7AB7                            ; $43EA: $CD $B7 $7A
    jp   label_01F_539A                           ; $43ED: $C3 $9A $53

    call DecrementValueAtDE                            ; $43F0: $CD $71 $7A
    ret  nz                                       ; $43F3: $C0

    ld   a, $04                                   ; $43F4: $3E $04
    ld   [de], a                                  ; $43F6: $12
    call IncrementValueAtBC                            ; $43F7: $CD $75 $7A
    cp   $05                                      ; $43FA: $FE $05
    jr   z, jr_01F_4404                           ; $43FC: $28 $06

jr_01F_43FE:
    ld   hl, $440F                                ; $43FE: $21 $0F $44
    jp   label_01F_7AE1                           ; $4401: $C3 $E1 $7A

jr_01F_4404:
    call func_01F_7A9A                            ; $4404: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4407: $CA $BB $53

    ld   a, $01                                   ; $440A: $3E $01
    ld   [bc], a                                  ; $440C: $02
    jr   jr_01F_43FE                              ; $440D: $18 $EF

    nop                                           ; $440F: $00
    ld   b, $00                                   ; $4410: $06 $00
    inc  b                                        ; $4412: $04
    nop                                           ; $4413: $00
    ld   [bc], a                                  ; $4414: $02
    rst  $38                                      ; $4415: $FF
    db   $F4                                      ; $4416: $F4
    nop                                           ; $4417: $00
    nop                                           ; $4418: $00
    push bc                                       ; $4419: $C5
    ret  c                                        ; $441A: $D8

    add  a                                        ; $441B: $87
    inc  b                                        ; $441C: $04
    ld   a, $0A                                   ; $441D: $3E $0A
    ld   [$D3BC], a                               ; $441F: $EA $BC $D3
    ld   hl, $4453                                ; $4422: $21 $53 $44
    call func_01F_7AB7                            ; $4425: $CD $B7 $7A
    jp   label_01F_5395                           ; $4428: $C3 $95 $53

    call IncrementValueAtBC                            ; $442B: $CD $75 $7A
    cp   $09                                      ; $442E: $FE $09
    jr   z, jr_01F_4438                           ; $4430: $28 $06

jr_01F_4432:
    ld   hl, $4443                                ; $4432: $21 $43 $44
    jp   label_01F_7AE1                           ; $4435: $C3 $E1 $7A

jr_01F_4438:
    call func_01F_7A9A                            ; $4438: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $443B: $CA $B5 $53

    ld   a, $01                                   ; $443E: $3E $01
    ld   [bc], a                                  ; $4440: $02
    jr   jr_01F_4432                              ; $4441: $18 $EF

    nop                                           ; $4443: $00
    ld   b, b                                     ; $4444: $40
    nop                                           ; $4445: $00
    add  b                                        ; $4446: $80
    nop                                           ; $4447: $00
    add  b                                        ; $4448: $80
    nop                                           ; $4449: $00
    ld   b, b                                     ; $444A: $40
    rst  $38                                      ; $444B: $FF
    ret  nc                                       ; $444C: $D0

    rst  $38                                      ; $444D: $FF
    and  b                                        ; $444E: $A0
    rst  $38                                      ; $444F: $FF
    and  b                                        ; $4450: $A0
    rst  $38                                      ; $4451: $FF
    ret  nc                                       ; $4452: $D0

    nop                                           ; $4453: $00
    add  b                                        ; $4454: $80
    dec  de                                       ; $4455: $1B
    nop                                           ; $4456: $00
    add  d                                        ; $4457: $82
    ld   bc, $7121                                ; $4458: $01 $21 $71
    ld   b, h                                     ; $445B: $44
    jp   label_01F_539A                           ; $445C: $C3 $9A $53

    call DecrementValueAtDE                            ; $445F: $CD $71 $7A
    ret  nz                                       ; $4462: $C0

    call IncrementValueAtBC                            ; $4463: $CD $75 $7A
    cp   $02                                      ; $4466: $FE $02
    jp   z, label_01F_53BB                        ; $4468: $CA $BB $53

    ld   hl, $4477                                ; $446B: $21 $77 $44
    jp   label_01F_7A79                           ; $446E: $C3 $79 $7A

func_01F_4471:
    nop                                           ; $4471: $00
    dec  a                                        ; $4472: $3D
    ldh  a, [hScratch1]                           ; $4473: $F0 $D8
    rst  $00                                      ; $4475: $C7
    inc  bc                                       ; $4476: $03
    nop                                           ; $4477: $00
    nop                                           ; $4478: $00
    add  c                                        ; $4479: $81
    ldh  [$FF87], a                               ; $447A: $E0 $87
    ld   [$9521], sp                              ; $447C: $08 $21 $95
    ld   b, h                                     ; $447F: $44
    jp   label_01F_539A                           ; $4480: $C3 $9A $53

    call DecrementValueAtDE                            ; $4483: $CD $71 $7A
    ret  nz                                       ; $4486: $C0

    call IncrementValueAtBC                            ; $4487: $CD $75 $7A
    cp   $02                                      ; $448A: $FE $02
    jp   z, label_01F_53BB                        ; $448C: $CA $BB $53

    ld   hl, $449B                                ; $448F: $21 $9B $44
    jp   label_01F_7A79                           ; $4492: $C3 $79 $7A

    ccf                                           ; $4495: $3F
    sbc  [hl]                                     ; $4496: $9E
    add  hl, hl                                   ; $4497: $29
    add  b                                        ; $4498: $80
    rst  $00                                      ; $4499: $C7
    ld   [$9F1F], sp                              ; $449A: $08 $1F $9F
    add  c                                        ; $449D: $81
    jr   nz, @-$77                                ; $449E: $20 $87

    db   $10                                      ; $44A0: $10
    ld   hl, $44C8                                ; $44A1: $21 $C8 $44
    call func_01F_7AB7                            ; $44A4: $CD $B7 $7A
    jp   label_01F_539A                           ; $44A7: $C3 $9A $53

    call IncrementValueAtBC                            ; $44AA: $CD $75 $7A
    cp   $09                                      ; $44AD: $FE $09
    jp   z, label_01F_53B5                        ; $44AF: $CA $B5 $53

    ld   hl, $44B8                                ; $44B2: $21 $B8 $44
    jp   label_01F_7AE1                           ; $44B5: $C3 $E1 $7A

    ld   bc, $00                                  ; $44B8: $01 $00 $00
    ret  nz                                       ; $44BB: $C0

    nop                                           ; $44BC: $00
    add  b                                        ; $44BD: $80
    nop                                           ; $44BE: $00
    ld   b, b                                     ; $44BF: $40
    rst  $38                                      ; $44C0: $FF
    ret  nz                                       ; $44C1: $C0

    rst  $38                                      ; $44C2: $FF
    add  b                                        ; $44C3: $80
    rst  $38                                      ; $44C4: $FF
    ld   b, b                                     ; $44C5: $40
    rst  $38                                      ; $44C6: $FF
    nop                                           ; $44C7: $00
    nop                                           ; $44C8: $00
    sbc  a                                        ; $44C9: $9F
    and  b                                        ; $44CA: $A0
    nop                                           ; $44CB: $00
    jp   nz, $FA01                                ; $44CC: $C2 $01 $FA

    ld   h, c                                     ; $44CF: $61
    db   $D3                                      ; $44D0: $D3
    cp   $13                                      ; $44D1: $FE $13
    jp   z, label_01F_53E6                        ; $44D3: $CA $E6 $53

    ldh  a, [rNR50]                               ; $44D6: $F0 $24
    cp   $77                                      ; $44D8: $FE $77
    jr   nz, jr_01F_44E2                          ; $44DA: $20 $06

    ld   hl, $4509                                ; $44DC: $21 $09 $45

jr_01F_44DF:
    jp   label_01F_539A                           ; $44DF: $C3 $9A $53

jr_01F_44E2:
    ld   hl, $450F                                ; $44E2: $21 $0F $45
    jr   jr_01F_44DF                              ; $44E5: $18 $F8

    call DecrementValueAtDE                            ; $44E7: $CD $71 $7A
    ret  nz                                       ; $44EA: $C0

    call IncrementValueAtBC                            ; $44EB: $CD $75 $7A
    cp   $02                                      ; $44EE: $FE $02
    jp   z, label_01F_53BB                        ; $44F0: $CA $BB $53

    ldh  a, [rNR50]                               ; $44F3: $F0 $24
    cp   $77                                      ; $44F5: $FE $77
    jr   nz, jr_01F_4505                          ; $44F7: $20 $0C

    ld   a, $10                                   ; $44F9: $3E $10

jr_01F_44FB:
    ldh  [rNR12], a                               ; $44FB: $E0 $12
    ld   a, $C7                                   ; $44FD: $3E $C7
    ldh  [rNR14], a                               ; $44FF: $E0 $14
    ld   a, $08                                   ; $4501: $3E $08
    ld   [de], a                                  ; $4503: $12
    ret                                           ; $4504: $C9

jr_01F_4505:
    ld   a, $20                                   ; $4505: $3E $20
    jr   jr_01F_44FB                              ; $4507: $18 $F2

    nop                                           ; $4509: $00
    sbc  a                                        ; $450A: $9F
    add  b                                        ; $450B: $80
    and  b                                        ; $450C: $A0
    rst  $00                                      ; $450D: $C7
    ld   [bc], a                                  ; $450E: $02
    nop                                           ; $450F: $00
    sbc  a                                        ; $4510: $9F
    ldh  a, [hLinkFinalPositionY]                 ; $4511: $F0 $A0
    rst  $00                                      ; $4513: $C7
    ld   [bc], a                                  ; $4514: $02
    ld   a, $05                                   ; $4515: $3E $05
    ld   [$D3BC], a                               ; $4517: $EA $BC $D3
    ld   hl, $454E                                ; $451A: $21 $4E $45
    call func_01F_7AB7                            ; $451D: $CD $B7 $7A
    jp   label_01F_5395                           ; $4520: $C3 $95 $53

    call DecrementValueAtDE                            ; $4523: $CD $71 $7A
    ret  nz                                       ; $4526: $C0

    ld   a, $02                                   ; $4527: $3E $02
    ld   [de], a                                  ; $4529: $12
    call IncrementValueAtBC                            ; $452A: $CD $75 $7A
    cp   $07                                      ; $452D: $FE $07
    jr   z, jr_01F_4537                           ; $452F: $28 $06

jr_01F_4531:
    ld   hl, $4542                                ; $4531: $21 $42 $45
    jp   label_01F_7AE1                           ; $4534: $C3 $E1 $7A

jr_01F_4537:
    call func_01F_7A9A                            ; $4537: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $453A: $CA $BB $53

    ld   a, $01                                   ; $453D: $3E $01
    ld   [bc], a                                  ; $453F: $02
    jr   jr_01F_4531                              ; $4540: $18 $EF

    rst  $38                                      ; $4542: $FF
    ret  nz                                       ; $4543: $C0

    rst  $38                                      ; $4544: $FF
    add  b                                        ; $4545: $80
    rst  $38                                      ; $4546: $FF
    ld   b, b                                     ; $4547: $40
    nop                                           ; $4548: $00
    ret  nz                                       ; $4549: $C0

jr_01F_454A:
    nop                                           ; $454A: $00
    add  b                                        ; $454B: $80
    nop                                           ; $454C: $00
    ld   b, b                                     ; $454D: $40
    nop                                           ; $454E: $00
    add  b                                        ; $454F: $80
    db   $F4                                      ; $4550: $F4
    add  b                                        ; $4551: $80
    add  e                                        ; $4552: $83
    ld   bc, $163E                                ; $4553: $01 $3E $16
    ld   [$D3BC], a                               ; $4556: $EA $BC $D3
    ld   hl, $458F                                ; $4559: $21 $8F $45
    call func_01F_7AB7                            ; $455C: $CD $B7 $7A
    jp   label_01F_539A                           ; $455F: $C3 $9A $53

    call IncrementValueAtBC                            ; $4562: $CD $75 $7A
    cp   $04                                      ; $4565: $FE $04
    jr   z, jr_01F_456F                           ; $4567: $28 $06

jr_01F_4569:
    ld   hl, $4589                                ; $4569: $21 $89 $45
    jp   label_01F_7AE1                           ; $456C: $C3 $E1 $7A

jr_01F_456F:
    call func_01F_7A9A                            ; $456F: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4572: $CA $BB $53

    cp   $08                                      ; $4575: $FE $08
    jr   z, jr_01F_457E                           ; $4577: $28 $05

    ld   a, $01                                   ; $4579: $3E $01
    ld   [bc], a                                  ; $457B: $02
    jr   jr_01F_4569                              ; $457C: $18 $EB

jr_01F_457E:
    xor  a                                        ; $457E: $AF
    ld   [bc], a                                  ; $457F: $02
    ld   hl, $4595                                ; $4580: $21 $95 $45
    call func_01F_7AB7                            ; $4583: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4586: $C3 $79 $7A

    nop                                           ; $4589: $00
    jr   z, jr_01F_458C                           ; $458A: $28 $00

jr_01F_458C:
    nop                                           ; $458C: $00
    rst  $38                                      ; $458D: $FF
    ldh  a, [rP1]                                 ; $458E: $F0 $00
    add  e                                        ; $4590: $83
    ld   b, a                                     ; $4591: $47
    ret  nz                                       ; $4592: $C0

    add  [hl]                                     ; $4593: $86
    ld   [bc], a                                  ; $4594: $02
    nop                                           ; $4595: $00
    add  e                                        ; $4596: $83
    ld   b, a                                     ; $4597: $47
    nop                                           ; $4598: $00
    add  a                                        ; $4599: $87
    ld   [bc], a                                  ; $459A: $02
    ld   hl, $45A8                                ; $459B: $21 $A8 $45
    jp   label_01F_539A                           ; $459E: $C3 $9A $53

    call DecrementValueAtDE                            ; $45A1: $CD $71 $7A
    ret  nz                                       ; $45A4: $C0

    jp   label_01F_53BB                           ; $45A5: $C3 $BB $53

    daa                                           ; $45A8: $27

jr_01F_45A9:
    add  b                                        ; $45A9: $80
    jp   nz, $8648                                ; $45AA: $C2 $48 $86

    jr   jr_01F_45A9                              ; $45AD: $18 $FA

    ld   h, c                                     ; $45AF: $61
    db   $D3                                      ; $45B0: $D3
    cp   $08                                      ; $45B1: $FE $08
    jr   z, jr_01F_45B9                           ; $45B3: $28 $04

    and  a                                        ; $45B5: $A7
    jp   nz, label_01F_53E6                       ; $45B6: $C2 $E6 $53

jr_01F_45B9:
    ld   hl, $45C6                                ; $45B9: $21 $C6 $45
    jp   label_01F_539A                           ; $45BC: $C3 $9A $53

    call DecrementValueAtDE                            ; $45BF: $CD $71 $7A
    ret  nz                                       ; $45C2: $C0

    jp   label_01F_53BB                           ; $45C3: $C3 $BB $53

    ld   d, $AB                                   ; $45C6: $16 $AB
    jr   nz, jr_01F_454A                          ; $45C8: $20 $80

    add  $05                                      ; $45CA: $C6 $05
    ld   hl, $45E4                                ; $45CC: $21 $E4 $45
    jp   label_01F_539A                           ; $45CF: $C3 $9A $53

    call DecrementValueAtDE                            ; $45D2: $CD $71 $7A
    ret  nz                                       ; $45D5: $C0

    call IncrementValueAtBC                            ; $45D6: $CD $75 $7A
    cp   $02                                      ; $45D9: $FE $02
    jp   z, label_01F_53BB                        ; $45DB: $CA $BB $53

    ld   hl, $45EA                                ; $45DE: $21 $EA $45
    jp   label_01F_7A79                           ; $45E1: $C3 $79 $7A

    rla                                           ; $45E4: $17
    add  b                                        ; $45E5: $80
    dec  bc                                       ; $45E6: $0B
    nop                                           ; $45E7: $00
    add  l                                        ; $45E8: $85
    db   $10                                      ; $45E9: $10
    rla                                           ; $45EA: $17
    add  b                                        ; $45EB: $80
    ld   c, $00                                   ; $45EC: $0E $00
    push bc                                       ; $45EE: $C5
    db   $10                                      ; $45EF: $10
    jp   label_01F_7B5C                           ; $45F0: $C3 $5C $7B

    ld   a, $17                                   ; $45F3: $3E $17
    ld   [$D3BC], a                               ; $45F5: $EA $BC $D3
    ld   hl, $D32F                                ; $45F8: $21 $2F $D3
    set  7, [hl]                                  ; $45FB: $CB $FE
    ld   hl, $4632                                ; $45FD: $21 $32 $46
    call func_01F_7AD0                            ; $4600: $CD $D0 $7A
    call func_01F_7A7F                            ; $4603: $CD $7F $7A
    ld   hl, $4637                                ; $4606: $21 $37 $46
    call func_01F_7AB7                            ; $4609: $CD $B7 $7A
    jp   label_01F_539A                           ; $460C: $C3 $9A $53

    call IncrementValueAtBC                            ; $460F: $CD $75 $7A
    cp   $02                                      ; $4612: $FE $02
    jr   z, jr_01F_4625                           ; $4614: $28 $0F

jr_01F_4616:
    ld   hl, $4630                                ; $4616: $21 $30 $46
    call func_01F_7B11                            ; $4619: $CD $11 $7B
    ld   bc, $D394                                ; $461C: $01 $94 $D3
    ld   hl, $4630                                ; $461F: $21 $30 $46
    jp   label_01F_7AE1                           ; $4622: $C3 $E1 $7A

jr_01F_4625:
    call func_01F_7A9A                            ; $4625: $CD $9A $7A
    jp   z, label_01F_463D                        ; $4628: $CA $3D $46

    ld   a, $01                                   ; $462B: $3E $01
    ld   [bc], a                                  ; $462D: $02
    jr   jr_01F_4616                              ; $462E: $18 $E6

    nop                                           ; $4630: $00
    ld   hl, $0C45                                ; $4631: $21 $45 $0C
    nop                                           ; $4634: $00
    add  h                                        ; $4635: $84
    ld   [de], a                                  ; $4636: $12
    nop                                           ; $4637: $00
    add  l                                        ; $4638: $85
    dec  bc                                       ; $4639: $0B
    nop                                           ; $463A: $00
    add  c                                        ; $463B: $81
    ld   [de], a                                  ; $463C: $12

label_01F_463D:
    ld   hl, $D32F                                ; $463D: $21 $2F $D3
    res  7, [hl]                                  ; $4640: $CB $BE
    ld   hl, $431D                                ; $4642: $21 $1D $43
    call func_01F_7A7F                            ; $4645: $CD $7F $7A
    jp   label_01F_53B5                           ; $4648: $C3 $B5 $53

    ld   a, [$D361]                               ; $464B: $FA $61 $D3
    cp   $13                                      ; $464E: $FE $13
    jp   z, label_01F_53E6                        ; $4650: $CA $E6 $53

    ld   a, $08                                   ; $4653: $3E $08
    ld   [$D3BC], a                               ; $4655: $EA $BC $D3
    ld   hl, $D32F                                ; $4658: $21 $2F $D3
    set  7, [hl]                                  ; $465B: $CB $FE
    ld   hl, $4692                                ; $465D: $21 $92 $46
    call func_01F_7AD0                            ; $4660: $CD $D0 $7A
    call func_01F_7A7F                            ; $4663: $CD $7F $7A
    ld   hl, $4697                                ; $4666: $21 $97 $46
    call func_01F_7AB7                            ; $4669: $CD $B7 $7A
    jp   label_01F_539A                           ; $466C: $C3 $9A $53

    call IncrementValueAtBC                            ; $466F: $CD $75 $7A
    cp   $02                                      ; $4672: $FE $02
    jr   z, jr_01F_4685                           ; $4674: $28 $0F

jr_01F_4676:
    ld   hl, $4690                                ; $4676: $21 $90 $46
    call func_01F_7B11                            ; $4679: $CD $11 $7B
    ld   bc, $D394                                ; $467C: $01 $94 $D3
    ld   hl, $4690                                ; $467F: $21 $90 $46
    jp   label_01F_7AE1                           ; $4682: $C3 $E1 $7A

jr_01F_4685:
    call func_01F_7A9A                            ; $4685: $CD $9A $7A
    jp   z, label_01F_463D                        ; $4688: $CA $3D $46

    ld   a, $01                                   ; $468B: $3E $01
    ld   [bc], a                                  ; $468D: $02
    jr   jr_01F_4676                              ; $468E: $18 $E6

    rst  $38                                      ; $4690: $FF
    ret  nc                                       ; $4691: $D0

    ld   b, b                                     ; $4692: $40
    ld   a, [bc]                                  ; $4693: $0A
    or   b                                        ; $4694: $B0
    add  a                                        ; $4695: $87
    ld   [de], a                                  ; $4696: $12
    nop                                           ; $4697: $00
    add  b                                        ; $4698: $80
    add  hl, bc                                   ; $4699: $09
    ret  nz                                       ; $469A: $C0

    add  [hl]                                     ; $469B: $86
    ld   [de], a                                  ; $469C: $12
    ld   a, $05                                   ; $469D: $3E $05
    ld   [$D3BC], a                               ; $469F: $EA $BC $D3
    ldh  a, [rNR50]                               ; $46A2: $F0 $24
    cp   $77                                      ; $46A4: $FE $77
    jr   nz, jr_01F_46B1                          ; $46A6: $20 $09

    ld   hl, $46DB                                ; $46A8: $21 $DB $46

jr_01F_46AB:
    call func_01F_7AB7                            ; $46AB: $CD $B7 $7A
    jp   label_01F_539A                           ; $46AE: $C3 $9A $53

jr_01F_46B1:
    ld   hl, $46E1                                ; $46B1: $21 $E1 $46
    jr   jr_01F_46AB                              ; $46B4: $18 $F5

    call DecrementValueAtDE                            ; $46B6: $CD $71 $7A
    ret  nz                                       ; $46B9: $C0

    ld   a, $03                                   ; $46BA: $3E $03
    ld   [de], a                                  ; $46BC: $12
    call IncrementValueAtBC                            ; $46BD: $CD $75 $7A
    cp   $04                                      ; $46C0: $FE $04
    jr   z, jr_01F_46CA                           ; $46C2: $28 $06

jr_01F_46C4:
    ld   hl, $46D5                                ; $46C4: $21 $D5 $46

jr_01F_46C7:
    jp   label_01F_7AE1                           ; $46C7: $C3 $E1 $7A

jr_01F_46CA:
    call func_01F_7A9A                            ; $46CA: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $46CD: $CA $B5 $53

    ld   a, $01                                   ; $46D0: $3E $01
    ld   [bc], a                                  ; $46D2: $02
    jr   jr_01F_46C4                              ; $46D3: $18 $EF

    nop                                           ; $46D5: $00
    ld   [hl+], a                                 ; $46D6: $22
    nop                                           ; $46D7: $00
    add  hl, de                                   ; $46D8: $19
    rst  $38                                      ; $46D9: $FF
    push bc                                       ; $46DA: $C5
    nop                                           ; $46DB: $00
    add  b                                        ; $46DC: $80
    and  h                                        ; $46DD: $A4
    ld   a, e                                     ; $46DE: $7B
    add  a                                        ; $46DF: $87
    inc  bc                                       ; $46E0: $03
    nop                                           ; $46E1: $00
    add  b                                        ; $46E2: $80
    di                                            ; $46E3: $F3
    ld   a, e                                     ; $46E4: $7B
    add  a                                        ; $46E5: $87
    inc  bc                                       ; $46E6: $03
    ld   a, [$D361]                               ; $46E7: $FA $61 $D3
    and  a                                        ; $46EA: $A7
    jp   nz, label_01F_53E6                       ; $46EB: $C2 $E6 $53

    ld   hl, $46FB                                ; $46EE: $21 $FB $46
    jp   label_01F_539A                           ; $46F1: $C3 $9A $53

    call DecrementValueAtDE                            ; $46F4: $CD $71 $7A
    ret  nz                                       ; $46F7: $C0

    jp   label_01F_53BB                           ; $46F8: $C3 $BB $53

    dec  [hl]                                     ; $46FB: $35
    or   b                                        ; $46FC: $B0
    ld   h, b                                     ; $46FD: $60
    jr   nz, jr_01F_46C7                          ; $46FE: $20 $C7

    inc  b                                        ; $4700: $04
    ld   hl, $4720                                ; $4701: $21 $20 $47
    jp   label_01F_539A                           ; $4704: $C3 $9A $53

    call DecrementValueAtDE                            ; $4707: $CD $71 $7A
    ret  nz                                       ; $470A: $C0

    call IncrementValueAtBC                            ; $470B: $CD $75 $7A
    cp   $03                                      ; $470E: $FE $03
    jp   z, label_01F_53BB                        ; $4710: $CA $BB $53

    ld   hl, $471C                                ; $4713: $21 $1C $47
    call GetHandlerAddressInTable                 ; $4716: $CD $64 $7A
    jp   label_01F_7A79                           ; $4719: $C3 $79 $7A

    ld   h, $47                                   ; $471C: $26 $47
    inc  l                                        ; $471E: $2C
    ld   b, a                                     ; $471F: $47
    nop                                           ; $4720: $00
    or   b                                        ; $4721: $B0
    add  hl, de                                   ; $4722: $19
    ld   c, a                                     ; $4723: $4F
    rst  $00                                      ; $4724: $C7
    ld   b, $00                                   ; $4725: $06 $00
    or   b                                        ; $4727: $B0
    add  hl, de                                   ; $4728: $19
    ld   a, e                                     ; $4729: $7B
    rst  $00                                      ; $472A: $C7
    ld   b, $00                                   ; $472B: $06 $00
    or   b                                        ; $472D: $B0
    add  hl, hl                                   ; $472E: $29
    sbc  l                                        ; $472F: $9D
    rst  $00                                      ; $4730: $C7
    inc  bc                                       ; $4731: $03
    ld   hl, $473F                                ; $4732: $21 $3F $47
    jp   label_01F_539A                           ; $4735: $C3 $9A $53

    call DecrementValueAtDE                            ; $4738: $CD $71 $7A
    ret  nz                                       ; $473B: $C0

    jp   label_01F_53BB                           ; $473C: $C3 $BB $53

    nop                                           ; $473F: $00
    nop                                           ; $4740: $00
    add  c                                        ; $4741: $81
    cp   e                                        ; $4742: $BB
    rst  $00                                      ; $4743: $C7
    jr   nz, jr_01F_4784                          ; $4744: $20 $3E

    ld   a, [hl+]                                 ; $4746: $2A
    ld   [$D3BC], a                               ; $4747: $EA $BC $D3
    ld   hl, $4784                                ; $474A: $21 $84 $47
    call func_01F_7AB7                            ; $474D: $CD $B7 $7A
    jp   label_01F_5395                           ; $4750: $C3 $95 $53

    call IncrementValueAtBC                            ; $4753: $CD $75 $7A
    cp   $03                                      ; $4756: $FE $03
    jr   z, jr_01F_4760                           ; $4758: $28 $06

jr_01F_475A:
    ld   hl, $477E                                ; $475A: $21 $7E $47
    jp   label_01F_7AE1                           ; $475D: $C3 $E1 $7A

jr_01F_4760:
    call func_01F_7A9A                            ; $4760: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4763: $CA $BB $53

    cp   $0E                                      ; $4766: $FE $0E
    jr   z, jr_01F_4773                           ; $4768: $28 $09

    cp   $1C                                      ; $476A: $FE $1C
    jr   z, jr_01F_4773                           ; $476C: $28 $05

    ld   a, $01                                   ; $476E: $3E $01
    ld   [bc], a                                  ; $4770: $02
    jr   jr_01F_475A                              ; $4771: $18 $E7

jr_01F_4773:
    ld   hl, $477E                                ; $4773: $21 $7E $47
    call func_01F_7AE1                            ; $4776: $CD $E1 $7A
    xor  a                                        ; $4779: $AF
    ld   [$D394], a                               ; $477A: $EA $94 $D3
    ret                                           ; $477D: $C9

    nop                                           ; $477E: $00
    jr   nz, @+$01                                ; $477F: $20 $FF

    add  sp, -$01                                 ; $4781: $E8 $FF
    sub  b                                        ; $4783: $90

jr_01F_4784:
    nop                                           ; $4784: $00
    add  b                                        ; $4785: $80
    rst  $10                                      ; $4786: $D7
    ld   l, b                                     ; $4787: $68
    add  a                                        ; $4788: $87
    ld   bc, $A221                                ; $4789: $01 $21 $A2
    ld   b, a                                     ; $478C: $47
    jp   label_01F_539A                           ; $478D: $C3 $9A $53

    call DecrementValueAtDE                            ; $4790: $CD $71 $7A
    ret  nz                                       ; $4793: $C0

    call IncrementValueAtBC                            ; $4794: $CD $75 $7A
    cp   $02                                      ; $4797: $FE $02
    jp   z, label_01F_53B5                        ; $4799: $CA $B5 $53

    ld   hl, $47A8                                ; $479C: $21 $A8 $47
    jp   label_01F_7A79                           ; $479F: $C3 $79 $7A

    cpl                                           ; $47A2: $2F
    add  b                                        ; $47A3: $80
    ld   h, b                                     ; $47A4: $60
    ldh  [$FF86], a                               ; $47A5: $E0 $86
    inc  d                                        ; $47A7: $14
    cpl                                           ; $47A8: $2F
    add  b                                        ; $47A9: $80
    db   $10                                      ; $47AA: $10
    ldh  [$FF86], a                               ; $47AB: $E0 $86
    inc  d                                        ; $47AD: $14
    ld   hl, $47D1                                ; $47AE: $21 $D1 $47
    jp   label_01F_5395                           ; $47B1: $C3 $95 $53

    call DecrementValueAtDE                            ; $47B4: $CD $71 $7A
    ret  nz                                       ; $47B7: $C0

    call IncrementValueAtBC                            ; $47B8: $CD $75 $7A
    cp   $05                                      ; $47BB: $FE $05
    jp   z, label_01F_53BB                        ; $47BD: $CA $BB $53

    ld   hl, $47C9                                ; $47C0: $21 $C9 $47
    call GetHandlerAddressInTable                 ; $47C3: $CD $64 $7A
    jp   label_01F_7A79                           ; $47C6: $C3 $79 $7A

    rst  $10                                      ; $47C9: $D7
    ld   b, a                                     ; $47CA: $47
    db   $DD                                      ; $47CB: $DD
    ld   b, a                                     ; $47CC: $47
    db   $E3                                      ; $47CD: $E3
    ld   b, a                                     ; $47CE: $47
    jp   hl                                       ; $47CF: $E9

    ld   b, a                                     ; $47D0: $47
    nop                                           ; $47D1: $00
    add  b                                        ; $47D2: $80
    pop  bc                                       ; $47D3: $C1
    and  a                                        ; $47D4: $A7
    add  a                                        ; $47D5: $87
    ld   b, $00                                   ; $47D6: $06 $00
    add  b                                        ; $47D8: $80
    pop  bc                                       ; $47D9: $C1
    or   c                                        ; $47DA: $B1
    add  a                                        ; $47DB: $87
    ld   b, $00                                   ; $47DC: $06 $00
    add  b                                        ; $47DE: $80
    pop  bc                                       ; $47DF: $C1
    cp   d                                        ; $47E0: $BA
    add  a                                        ; $47E1: $87
    ld   b, $00                                   ; $47E2: $06 $00
    add  b                                        ; $47E4: $80
    pop  bc                                       ; $47E5: $C1
    cp   [hl]                                     ; $47E6: $BE
    add  a                                        ; $47E7: $87
    ld   b, $00                                   ; $47E8: $06 $00

jr_01F_47EA:
    add  b                                        ; $47EA: $80
    and  e                                        ; $47EB: $A3
    push bc                                       ; $47EC: $C5
    add  a                                        ; $47ED: $87
    jr   nz, jr_01F_47EA                          ; $47EE: $20 $FA

    ld   h, c                                     ; $47F0: $61
    db   $D3                                      ; $47F1: $D3
    cp   $1A                                      ; $47F2: $FE $1A
    jp   z, label_01F_53E6                        ; $47F4: $CA $E6 $53

    ld   hl, $480F                                ; $47F7: $21 $0F $48
    jp   label_01F_539A                           ; $47FA: $C3 $9A $53

    call DecrementValueAtDE                            ; $47FD: $CD $71 $7A
    ret  nz                                       ; $4800: $C0

    call IncrementValueAtBC                            ; $4801: $CD $75 $7A
    cp   $02                                      ; $4804: $FE $02
    jp   z, label_01F_53B5                        ; $4806: $CA $B5 $53

    ld   hl, $4815                                ; $4809: $21 $15 $48
    jp   $53DF                                    ; $480C: $C3 $DF $53

    nop                                           ; $480F: $00
    add  b                                        ; $4810: $80
    inc  [hl]                                     ; $4811: $34
    sub  b                                        ; $4812: $90
    add  a                                        ; $4813: $87
    ld   bc, $7C8                                 ; $4814: $01 $C8 $07
    inc  b                                        ; $4817: $04
    ld   a, $03                                   ; $4818: $3E $03
    ld   [$D3BC], a                               ; $481A: $EA $BC $D3
    ld   hl, $4863                                ; $481D: $21 $63 $48
    call func_01F_7AB7                            ; $4820: $CD $B7 $7A
    jp   label_01F_5395                           ; $4823: $C3 $95 $53

    call DecrementValueAtDE                            ; $4826: $CD $71 $7A
    ret  nz                                       ; $4829: $C0

    ld   a, $04                                   ; $482A: $3E $04
    ld   [de], a                                  ; $482C: $12
    call IncrementValueAtBC                            ; $482D: $CD $75 $7A
    cp   $08                                      ; $4830: $FE $08
    jr   z, jr_01F_483A                           ; $4832: $28 $06

    ld   hl, $4855                                ; $4834: $21 $55 $48
    jp   label_01F_7AE1                           ; $4837: $C3 $E1 $7A

jr_01F_483A:
    call func_01F_7A9A                            ; $483A: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $483D: $CA $B5 $53

    cp   $02                                      ; $4840: $FE $02
    jr   z, jr_01F_4850                           ; $4842: $28 $0C

    ld   hl, $486F                                ; $4844: $21 $6F $48

jr_01F_4847:
    call func_01F_7AB7                            ; $4847: $CD $B7 $7A
    ld   a, $04                                   ; $484A: $3E $04
    ld   [bc], a                                  ; $484C: $02
    jp   label_01F_7A79                           ; $484D: $C3 $79 $7A

jr_01F_4850:
    ld   hl, $4869                                ; $4850: $21 $69 $48
    jr   jr_01F_4847                              ; $4853: $18 $F2

    nop                                           ; $4855: $00
    ld   a, [hl+]                                 ; $4856: $2A
    nop                                           ; $4857: $00
    ld   l, $00                                   ; $4858: $2E $00
    dec  h                                        ; $485A: $25
    nop                                           ; $485B: $00
    rlca                                          ; $485C: $07
    nop                                           ; $485D: $00
    dec  d                                        ; $485E: $15
    nop                                           ; $485F: $00
    rla                                           ; $4860: $17
    nop                                           ; $4861: $00
    inc  de                                       ; $4862: $13
    nop                                           ; $4863: $00
    nop                                           ; $4864: $00
    ld   c, h                                     ; $4865: $4C
    rst  $30                                      ; $4866: $F7
    add  [hl]                                     ; $4867: $86
    inc  b                                        ; $4868: $04
    nop                                           ; $4869: $00
    ld   b, b                                     ; $486A: $40
    ld   b, b                                     ; $486B: $40
    ld   a, e                                     ; $486C: $7B
    add  a                                        ; $486D: $87
    inc  b                                        ; $486E: $04
    nop                                           ; $486F: $00
    add  b                                        ; $4870: $80
    db   $10                                      ; $4871: $10
    ld   a, e                                     ; $4872: $7B
    add  a                                        ; $4873: $87
    inc  b                                        ; $4874: $04
    ld   a, $2C                                   ; $4875: $3E $2C
    ld   [$D3BC], a                               ; $4877: $EA $BC $D3
    ld   hl, $48C3                                ; $487A: $21 $C3 $48
    call func_01F_7AB7                            ; $487D: $CD $B7 $7A
    jp   label_01F_539A                           ; $4880: $C3 $9A $53

    call IncrementValueAtBC                            ; $4883: $CD $75 $7A
    cp   $03                                      ; $4886: $FE $03
    jr   z, jr_01F_4894                           ; $4888: $28 $0A

    cp   $05                                      ; $488A: $FE $05
    jr   z, jr_01F_48B0                           ; $488C: $28 $22

jr_01F_488E:
    ld   hl, $48BB                                ; $488E: $21 $BB $48
    jp   label_01F_7AE1                           ; $4891: $C3 $E1 $7A

jr_01F_4894:
    call func_01F_7A9A                            ; $4894: $CD $9A $7A
    cp   $18                                      ; $4897: $FE $18
    jr   z, jr_01F_48A4                           ; $4899: $28 $09

    cp   $17                                      ; $489B: $FE $17
    jr   z, jr_01F_48B0                           ; $489D: $28 $11

    ld   a, $01                                   ; $489F: $3E $01
    ld   [bc], a                                  ; $48A1: $02
    jr   jr_01F_488E                              ; $48A2: $18 $EA

jr_01F_48A4:
    ld   a, $02                                   ; $48A4: $3E $02
    ld   [bc], a                                  ; $48A6: $02
    ld   hl, $48C9                                ; $48A7: $21 $C9 $48
    call func_01F_7AB7                            ; $48AA: $CD $B7 $7A
    jp   label_01F_7A79                           ; $48AD: $C3 $79 $7A

jr_01F_48B0:
    call func_01F_7A9A                            ; $48B0: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $48B3: $CA $BB $53

    ld   a, $03                                   ; $48B6: $3E $03
    ld   [bc], a                                  ; $48B8: $02
    jr   jr_01F_488E                              ; $48B9: $18 $D3

    nop                                           ; $48BB: $00
    xor  [hl]                                     ; $48BC: $AE
    rst  $38                                      ; $48BD: $FF
    ld   h, b                                     ; $48BE: $60
    nop                                           ; $48BF: $00
    xor  d                                        ; $48C0: $AA
    rst  $38                                      ; $48C1: $FF
    ld   h, b                                     ; $48C2: $60
    nop                                           ; $48C3: $00
    ld   b, b                                     ; $48C4: $40
    inc  c                                        ; $48C5: $0C
    nop                                           ; $48C6: $00
    add  l                                        ; $48C7: $85
    ld   bc, $4000                                ; $48C8: $01 $00 $40
    and  h                                        ; $48CB: $A4
    ld   b, b                                     ; $48CC: $40
    add  [hl]                                     ; $48CD: $86
    ld   bc, $83E                                 ; $48CE: $01 $3E $08
    ld   [$D3BC], a                               ; $48D1: $EA $BC $D3
    ld   hl, $4901                                ; $48D4: $21 $01 $49
    jp   label_01F_539A                           ; $48D7: $C3 $9A $53

    call DecrementValueAtDE                            ; $48DA: $CD $71 $7A
    ret  nz                                       ; $48DD: $C0

    ld   a, $79                                   ; $48DE: $3E $79
    ldh  [rNR11], a                               ; $48E0: $E0 $11
    call IncrementValueAtBC                            ; $48E2: $CD $75 $7A
    cp   $03                                      ; $48E5: $FE $03
    jr   z, jr_01F_48F2                           ; $48E7: $28 $09

jr_01F_48E9:
    ld   hl, $48FD                                ; $48E9: $21 $FD $48
    call GetHandlerAddressInTable                 ; $48EC: $CD $64 $7A
    jp   $53DF                                    ; $48EF: $C3 $DF $53

jr_01F_48F2:
    call func_01F_7A9A                            ; $48F2: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $48F5: $CA $BB $53

    ld   a, $02                                   ; $48F8: $3E $02

jr_01F_48FA:
    ld   [bc], a                                  ; $48FA: $02
    jr   jr_01F_48E9                              ; $48FB: $18 $EC

    rlca                                          ; $48FD: $07
    ld   c, c                                     ; $48FE: $49
    inc  b                                        ; $48FF: $04
    ld   c, c                                     ; $4900: $49
    nop                                           ; $4901: $00
    ld   a, c                                     ; $4902: $79
    ldh  [hDMARoutine], a                         ; $4903: $E0 $C0
    call nz, $C002                                ; $4905: $C4 $02 $C0
    call nz, $210C                                ; $4908: $C4 $0C $21
    dec  l                                        ; $490B: $2D
    ld   c, c                                     ; $490C: $49
    jp   label_01F_5395                           ; $490D: $C3 $95 $53

    call DecrementValueAtDE                            ; $4910: $CD $71 $7A
    ret  nz                                       ; $4913: $C0

    call IncrementValueAtBC                            ; $4914: $CD $75 $7A
    cp   $05                                      ; $4917: $FE $05
    jp   z, label_01F_53BB                        ; $4919: $CA $BB $53

    ld   hl, $4925                                ; $491C: $21 $25 $49
    call GetHandlerAddressInTable                 ; $491F: $CD $64 $7A
    jp   $53DF                                    ; $4922: $C3 $DF $53

    inc  sp                                       ; $4925: $33
    ld   c, c                                     ; $4926: $49
    inc  sp                                       ; $4927: $33
    ld   c, c                                     ; $4928: $49
    ld   [hl], $49                                ; $4929: $36 $49
    ld   [hl], $49                                ; $492B: $36 $49
    rra                                           ; $492D: $1F
    and  [hl]                                     ; $492E: $A6
    pop  hl                                       ; $492F: $E1
    nop                                           ; $4930: $00
    rst  $00                                      ; $4931: $C7
    db   $10                                      ; $4932: $10
    and  b                                        ; $4933: $A0
    add  $09                                      ; $4934: $C6 $09
    nop                                           ; $4936: $00
    add  $18                                      ; $4937: $C6 $18
    ld   a, $0A                                   ; $4939: $3E $0A
    ld   [$D3BC], a                               ; $493B: $EA $BC $D3
    ld   hl, $496F                                ; $493E: $21 $6F $49
    call func_01F_7AB7                            ; $4941: $CD $B7 $7A
    jp   label_01F_5395                           ; $4944: $C3 $95 $53

    call IncrementValueAtBC                            ; $4947: $CD $75 $7A
    cp   $09                                      ; $494A: $FE $09
    jr   z, jr_01F_4954                           ; $494C: $28 $06

jr_01F_494E:
    ld   hl, $495F                                ; $494E: $21 $5F $49
    jp   label_01F_7AE1                           ; $4951: $C3 $E1 $7A

jr_01F_4954:
    call func_01F_7A9A                            ; $4954: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4957: $CA $B5 $53

    ld   a, $01                                   ; $495A: $3E $01
    ld   [bc], a                                  ; $495C: $02
    jr   jr_01F_494E                              ; $495D: $18 $EF

    nop                                           ; $495F: $00
    jr   nc, jr_01F_4962                          ; $4960: $30 $00

jr_01F_4962:
    ld   h, b                                     ; $4962: $60
    nop                                           ; $4963: $00
    ld   h, b                                     ; $4964: $60
    nop                                           ; $4965: $00
    jr   nc, @+$01                                ; $4966: $30 $FF

    ret  nz                                       ; $4968: $C0

    rst  $38                                      ; $4969: $FF
    add  b                                        ; $496A: $80
    rst  $38                                      ; $496B: $FF
    add  b                                        ; $496C: $80
    rst  $38                                      ; $496D: $FF
    ret  nz                                       ; $496E: $C0

    nop                                           ; $496F: $00
    add  b                                        ; $4970: $80
    dec  bc                                       ; $4971: $0B
    jr   nz, jr_01F_48FA                          ; $4972: $20 $86

    ld   bc, $61FA                                ; $4974: $01 $FA $61
    db   $D3                                      ; $4977: $D3
    cp   $20                                      ; $4978: $FE $20
    jr   z, jr_01F_4980                           ; $497A: $28 $04

    and  a                                        ; $497C: $A7
    jp   nz, label_01F_53E6                       ; $497D: $C2 $E6 $53

jr_01F_4980:
    ld   a, $08                                   ; $4980: $3E $08
    ld   [$D3BC], a                               ; $4982: $EA $BC $D3
    ld   hl, $49AA                                ; $4985: $21 $AA $49
    call func_01F_7AB7                            ; $4988: $CD $B7 $7A
    jp   label_01F_539A                           ; $498B: $C3 $9A $53

    call IncrementValueAtBC                            ; $498E: $CD $75 $7A
    cp   $03                                      ; $4991: $FE $03
    jr   z, jr_01F_499B                           ; $4993: $28 $06

jr_01F_4995:
    ld   hl, $49A6                                ; $4995: $21 $A6 $49
    jp   label_01F_7AE1                           ; $4998: $C3 $E1 $7A

jr_01F_499B:
    call func_01F_7A9A                            ; $499B: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $499E: $CA $BB $53

    ld   a, $01                                   ; $49A1: $3E $01
    ld   [bc], a                                  ; $49A3: $02
    jr   jr_01F_4995                              ; $49A4: $18 $EF

    nop                                           ; $49A6: $00
    ret  nz                                       ; $49A7: $C0

    rst  $38                                      ; $49A8: $FF
    and  b                                        ; $49A9: $A0
    nop                                           ; $49AA: $00
    add  b                                        ; $49AB: $80
    pop  af                                       ; $49AC: $F1
    add  b                                        ; $49AD: $80
    add  e                                        ; $49AE: $83
    ld   bc, $1C3E                                ; $49AF: $01 $3E $1C
    ld   [$D3BC], a                               ; $49B2: $EA $BC $D3
    ld   hl, $49F6                                ; $49B5: $21 $F6 $49
    call func_01F_7AB7                            ; $49B8: $CD $B7 $7A
    jp   label_01F_539A                           ; $49BB: $C3 $9A $53

    call IncrementValueAtBC                            ; $49BE: $CD $75 $7A
    cp   $02                                      ; $49C1: $FE $02
    jr   z, jr_01F_49CB                           ; $49C3: $28 $06

jr_01F_49C5:
    ld   hl, $49F4                                ; $49C5: $21 $F4 $49
    jp   label_01F_7AE1                           ; $49C8: $C3 $E1 $7A

jr_01F_49CB:
    call func_01F_7A9A                            ; $49CB: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $49CE: $CA $B5 $53

    cp   $14                                      ; $49D1: $FE $14
    jr   z, jr_01F_49DE                           ; $49D3: $28 $09

    cp   $0A                                      ; $49D5: $FE $0A
    jr   z, jr_01F_49E9                           ; $49D7: $28 $10

    ld   a, $01                                   ; $49D9: $3E $01
    ld   [bc], a                                  ; $49DB: $02
    jr   jr_01F_49C5                              ; $49DC: $18 $E7

jr_01F_49DE:
    xor  a                                        ; $49DE: $AF
    ld   [bc], a                                  ; $49DF: $02
    ld   hl, $49FC                                ; $49E0: $21 $FC $49
    call func_01F_7AB7                            ; $49E3: $CD $B7 $7A
    jp   label_01F_7A79                           ; $49E6: $C3 $79 $7A

jr_01F_49E9:
    xor  a                                        ; $49E9: $AF
    ld   [bc], a                                  ; $49EA: $02
    ld   hl, $4A02                                ; $49EB: $21 $02 $4A
    call func_01F_7AB7                            ; $49EE: $CD $B7 $7A
    jp   label_01F_7A79                           ; $49F1: $C3 $79 $7A

    rst  $38                                      ; $49F4: $FF
    rst  $38                                      ; $49F5: $FF
    nop                                           ; $49F6: $00

jr_01F_49F7:
    nop                                           ; $49F7: $00
    add  hl, de                                   ; $49F8: $19
    or   b                                        ; $49F9: $B0
    add  a                                        ; $49FA: $87
    ld   bc, $00                                  ; $49FB: $01 $00 $00
    ld   h, d                                     ; $49FE: $62
    and  a                                        ; $49FF: $A7
    add  a                                        ; $4A00: $87
    ld   bc, $00                                  ; $4A01: $01 $00 $00
    db   $10                                      ; $4A04: $10
    and  a                                        ; $4A05: $A7
    add  a                                        ; $4A06: $87
    ld   bc, $61FA                                ; $4A07: $01 $FA $61
    db   $D3                                      ; $4A0A: $D3
    cp   $22                                      ; $4A0B: $FE $22
    jp   z, label_01F_53E6                        ; $4A0D: $CA $E6 $53

    ld   bc, $D3D7                                ; $4A10: $01 $D7 $D3
    call IncrementValueAtBC                            ; $4A13: $CD $75 $7A
    cp   $04                                      ; $4A16: $FE $04
    jr   nc, jr_01F_4A20                          ; $4A18: $30 $06

jr_01F_4A1A:
    ld   hl, $4A52                                ; $4A1A: $21 $52 $4A
    jp   label_01F_539A                           ; $4A1D: $C3 $9A $53

jr_01F_4A20:
    cp   $06                                      ; $4A20: $FE $06
    jr   nc, jr_01F_4A2A                          ; $4A22: $30 $06

jr_01F_4A24:
    ld   hl, $4A58                                ; $4A24: $21 $58 $4A
    jp   label_01F_539A                           ; $4A27: $C3 $9A $53

jr_01F_4A2A:
    cp   $08                                      ; $4A2A: $FE $08
    jr   nc, jr_01F_4A34                          ; $4A2C: $30 $06

jr_01F_4A2E:
    ld   hl, $4A5E                                ; $4A2E: $21 $5E $4A
    jp   label_01F_539A                           ; $4A31: $C3 $9A $53

jr_01F_4A34:
    cp   $09                                      ; $4A34: $FE $09
    jr   nc, jr_01F_4A3E                          ; $4A36: $30 $06

    ld   hl, $4A64                                ; $4A38: $21 $64 $4A
    jp   label_01F_539A                           ; $4A3B: $C3 $9A $53

jr_01F_4A3E:
    cp   $0B                                      ; $4A3E: $FE $0B
    jr   nc, jr_01F_4A44                          ; $4A40: $30 $02

    jr   jr_01F_4A2E                              ; $4A42: $18 $EA

jr_01F_4A44:
    cp   $0D                                      ; $4A44: $FE $0D
    jr   z, jr_01F_4A4A                           ; $4A46: $28 $02

    jr   jr_01F_4A24                              ; $4A48: $18 $DA

jr_01F_4A4A:
    ld   a, $01                                   ; $4A4A: $3E $01
    ld   [bc], a                                  ; $4A4C: $02
    jr   jr_01F_4A1A                              ; $4A4D: $18 $CB

    jp   label_01F_53BB                           ; $4A4F: $C3 $BB $53

    dec  d                                        ; $4A52: $15
    jr   c, @+$32                                 ; $4A53: $38 $30

    ld   b, b                                     ; $4A55: $40
    add  $02                                      ; $4A56: $C6 $02
    dec  d                                        ; $4A58: $15
    jr   c, @+$42                                 ; $4A59: $38 $40

    inc  a                                        ; $4A5B: $3C
    add  $02                                      ; $4A5C: $C6 $02
    dec  d                                        ; $4A5E: $15
    jr   c, jr_01F_4AC1                           ; $4A5F: $38 $60

    jr   c, @-$38                                 ; $4A61: $38 $C6

    ld   [bc], a                                  ; $4A63: $02
    dec  d                                        ; $4A64: $15
    jr   c, jr_01F_49F7                           ; $4A65: $38 $90

    inc  [hl]                                     ; $4A67: $34
    add  $02                                      ; $4A68: $C6 $02
    dec  d                                        ; $4A6A: $15
    jr   c, @-$2E                                 ; $4A6B: $38 $D0

    jr   nc, @-$38                                ; $4A6D: $30 $C6

    ld   [bc], a                                  ; $4A6F: $02
    ld   hl, $D32F                                ; $4A70: $21 $2F $D3
    set  7, [hl]                                  ; $4A73: $CB $FE
    ld   hl, $4AAD                                ; $4A75: $21 $AD $4A
    jp   label_01F_5395                           ; $4A78: $C3 $95 $53

    call DecrementValueAtDE                            ; $4A7B: $CD $71 $7A
    ret  nz                                       ; $4A7E: $C0

    call IncrementValueAtBC                            ; $4A7F: $CD $75 $7A
    cp   $08                                      ; $4A82: $FE $08
    jr   z, jr_01F_4A97                           ; $4A84: $28 $11

    ld   hl, $4A9F                                ; $4A86: $21 $9F $4A
    call GetHandlerAddressInTable                 ; $4A89: $CD $64 $7A
    ld   a, [$D394]                               ; $4A8C: $FA $94 $D3
    and  $01                                      ; $4A8F: $E6 $01
    jp   nz, label_01F_7A7F                       ; $4A91: $C2 $7F $7A

    jp   label_01F_7A79                           ; $4A94: $C3 $79 $7A

jr_01F_4A97:
    ld   hl, $D32F                                ; $4A97: $21 $2F $D3
    res  7, [hl]                                  ; $4A9A: $CB $BE
    jp   label_01F_53B5                           ; $4A9C: $C3 $B5 $53

    or   e                                        ; $4A9F: $B3
    ld   c, d                                     ; $4AA0: $4A
    cp   b                                        ; $4AA1: $B8
    ld   c, d                                     ; $4AA2: $4A
    cp   [hl]                                     ; $4AA3: $BE
    ld   c, d                                     ; $4AA4: $4A
    jp   $C94A                                    ; $4AA5: $C3 $4A $C9

    ld   c, d                                     ; $4AA8: $4A
    adc  $4A                                      ; $4AA9: $CE $4A
    call nc, $004A                                ; $4AAB: $D4 $4A $00
    add  b                                        ; $4AAE: $80
    ld   [c], a                                   ; $4AAF: $E2
    and  a                                        ; $4AB0: $A7
    add  a                                        ; $4AB1: $87
    add  hl, bc                                   ; $4AB2: $09
    add  b                                        ; $4AB3: $80
    ld   [c], a                                   ; $4AB4: $E2
    and  d                                        ; $4AB5: $A2
    add  a                                        ; $4AB6: $87
    ld   [vTiles0], sp                            ; $4AB7: $08 $00 $80
    ld   [c], a                                   ; $4ABA: $E2
    sub  b                                        ; $4ABB: $90
    add  a                                        ; $4ABC: $87
    ld   [$E280], sp                              ; $4ABD: $08 $80 $E2
    ld   a, e                                     ; $4AC0: $7B

jr_01F_4AC1:
    add  a                                        ; $4AC1: $87
    ld   [vTiles0], sp                            ; $4AC2: $08 $00 $80
    or   d                                        ; $4AC5: $B2
    ld   e, c                                     ; $4AC6: $59
    add  a                                        ; $4AC7: $87
    add  hl, bc                                   ; $4AC8: $09
    add  b                                        ; $4AC9: $80
    ld   [c], a                                   ; $4ACA: $E2
    sub  a                                        ; $4ACB: $97
    add  a                                        ; $4ACC: $87
    ld   a, [bc]                                  ; $4ACD: $0A
    nop                                           ; $4ACE: $00
    add  b                                        ; $4ACF: $80
    ld   [c], a                                   ; $4AD0: $E2
    xor  h                                        ; $4AD1: $AC
    add  a                                        ; $4AD2: $87
    dec  bc                                       ; $4AD3: $0B
    add  b                                        ; $4AD4: $80
    ld   [c], a                                   ; $4AD5: $E2
    cp   [hl]                                     ; $4AD6: $BE
    add  a                                        ; $4AD7: $87
    db   $10                                      ; $4AD8: $10
    ld   hl, $4AE6                                ; $4AD9: $21 $E6 $4A
    jp   label_01F_539A                           ; $4ADC: $C3 $9A $53

    call DecrementValueAtDE                            ; $4ADF: $CD $71 $7A
    ret  nz                                       ; $4AE2: $C0

    jp   label_01F_53BB                           ; $4AE3: $C3 $BB $53

    daa                                           ; $4AE6: $27
    add  b                                        ; $4AE7: $80
    add  e                                        ; $4AE8: $83
    nop                                           ; $4AE9: $00
    add  [hl]                                     ; $4AEA: $86
    jr   jr_01F_4B2B                              ; $4AEB: $18 $3E

    rlca                                          ; $4AED: $07
    ld   [$D3BC], a                               ; $4AEE: $EA $BC $D3
    ld   hl, $4B2B                                ; $4AF1: $21 $2B $4B
    jp   label_01F_5395                           ; $4AF4: $C3 $95 $53

    call DecrementValueAtDE                            ; $4AF7: $CD $71 $7A
    ret  nz                                       ; $4AFA: $C0

    call IncrementValueAtBC                            ; $4AFB: $CD $75 $7A
    cp   $06                                      ; $4AFE: $FE $06
    jr   z, jr_01F_4B0F                           ; $4B00: $28 $0D

    cp   $07                                      ; $4B02: $FE $07
    jr   z, jr_01F_4B1A                           ; $4B04: $28 $14

jr_01F_4B06:
    ld   hl, $4B1F                                ; $4B06: $21 $1F $4B
    call GetHandlerAddressInTable                 ; $4B09: $CD $64 $7A
    jp   $53DF                                    ; $4B0C: $C3 $DF $53

jr_01F_4B0F:
    call func_01F_7A9A                            ; $4B0F: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4B12: $CA $B5 $53

    ld   a, $06                                   ; $4B15: $3E $06
    ld   [bc], a                                  ; $4B17: $02
    jr   jr_01F_4B06                              ; $4B18: $18 $EC

jr_01F_4B1A:
    ld   a, $03                                   ; $4B1A: $3E $03
    ld   [bc], a                                  ; $4B1C: $02
    jr   jr_01F_4B06                              ; $4B1D: $18 $E7

    ld   sp, LoadRoomObject.bombableWallRight     ; $4B1F: $31 $4B $34
    ld   c, e                                     ; $4B22: $4B
    scf                                           ; $4B23: $37
    ld   c, e                                     ; $4B24: $4B
    ld   a, [hl-]                                 ; $4B25: $3A
    ld   c, e                                     ; $4B26: $4B
    dec  a                                        ; $4B27: $3D
    ld   c, e                                     ; $4B28: $4B
    ld   b, b                                     ; $4B29: $40
    ld   c, e                                     ; $4B2A: $4B

jr_01F_4B2B:
    nop                                           ; $4B2B: $00
    add  b                                        ; $4B2C: $80
    and  l                                        ; $4B2D: $A5
    ld   b, $87                                   ; $4B2E: $06 $87
    ld   [bc], a                                  ; $4B30: $02
    ld   hl, $0207                                ; $4B31: $21 $07 $02
    add  hl, sp                                   ; $4B34: $39
    rlca                                          ; $4B35: $07
    ld   [bc], a                                  ; $4B36: $02
    ld   c, a                                     ; $4B37: $4F
    rlca                                          ; $4B38: $07
    ld   [bc], a                                  ; $4B39: $02
    ld   h, d                                     ; $4B3A: $62
    rlca                                          ; $4B3B: $07
    ld   [bc], a                                  ; $4B3C: $02
    ld   [hl], h                                  ; $4B3D: $74
    rlca                                          ; $4B3E: $07
    ld   [bc], a                                  ; $4B3F: $02
    ld   b, $07                                   ; $4B40: $06 $07
    ld   [bc], a                                  ; $4B42: $02
    ld   a, $0E                                   ; $4B43: $3E $0E
    ld   [$D3BC], a                               ; $4B45: $EA $BC $D3
    ld   hl, $4B85                                ; $4B48: $21 $85 $4B
    call func_01F_7AB7                            ; $4B4B: $CD $B7 $7A
    jp   label_01F_5395                           ; $4B4E: $C3 $95 $53

    call DecrementValueAtDE                            ; $4B51: $CD $71 $7A
    ret  nz                                       ; $4B54: $C0

    ld   a, $03                                   ; $4B55: $3E $03
    ld   [de], a                                  ; $4B57: $12
    call IncrementValueAtBC                            ; $4B58: $CD $75 $7A
    cp   $04                                      ; $4B5B: $FE $04
    jr   z, jr_01F_4B65                           ; $4B5D: $28 $06

jr_01F_4B5F:
    ld   hl, $4B7F                                ; $4B5F: $21 $7F $4B
    jp   label_01F_7AE1                           ; $4B62: $C3 $E1 $7A

jr_01F_4B65:
    call func_01F_7A9A                            ; $4B65: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4B68: $CA $BB $53

    cp   $09                                      ; $4B6B: $FE $09
    jr   z, jr_01F_4B74                           ; $4B6D: $28 $05

    ld   a, $01                                   ; $4B6F: $3E $01
    ld   [bc], a                                  ; $4B71: $02
    jr   jr_01F_4B5F                              ; $4B72: $18 $EB

jr_01F_4B74:
    xor  a                                        ; $4B74: $AF
    ld   [bc], a                                  ; $4B75: $02
    ld   hl, $4B8B                                ; $4B76: $21 $8B $4B
    call func_01F_7AB7                            ; $4B79: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4B7C: $C3 $79 $7A

    rst  $38                                      ; $4B7F: $FF
    ldh  [rP1], a                                 ; $4B80: $E0 $00
    jr   nz, @+$01                                ; $4B82: $20 $FF

    db   $FC                                      ; $4B84: $FC
    nop                                           ; $4B85: $00
    nop                                           ; $4B86: $00
    inc  c                                        ; $4B87: $0C
    ldh  a, [$FF87]                               ; $4B88: $F0 $87
    inc  bc                                       ; $4B8A: $03
    nop                                           ; $4B8B: $00
    nop                                           ; $4B8C: $00
    and  a                                        ; $4B8D: $A7
    call c, $0387                                 ; $4B8E: $DC $87 $03
    ld   hl, $4BAB                                ; $4B91: $21 $AB $4B
    jp   label_01F_539A                           ; $4B94: $C3 $9A $53

    call DecrementValueAtDE                            ; $4B97: $CD $71 $7A
    ret  nz                                       ; $4B9A: $C0

    call IncrementValueAtBC                            ; $4B9B: $CD $75 $7A
    cp   $02                                      ; $4B9E: $FE $02
    jp   z, label_01F_53B5                        ; $4BA0: $CA $B5 $53

    ld   a, $1E                                   ; $4BA3: $3E $1E
    ldh  [rNR10], a                               ; $4BA5: $E0 $10
    ld   a, $18                                   ; $4BA7: $3E $18
    ld   [de], a                                  ; $4BA9: $12
    ret                                           ; $4BAA: $C9

    inc  d                                        ; $4BAB: $14
    ld   b, b                                     ; $4BAC: $40
    ret  nz                                       ; $4BAD: $C0

    nop                                           ; $4BAE: $00
    add  c                                        ; $4BAF: $81
    inc  c                                        ; $4BB0: $0C
    ld   hl, $4BDE                                ; $4BB1: $21 $DE $4B
    jp   label_01F_539A                           ; $4BB4: $C3 $9A $53

    call DecrementValueAtDE                            ; $4BB7: $CD $71 $7A
    ret  nz                                       ; $4BBA: $C0

    call IncrementValueAtBC                            ; $4BBB: $CD $75 $7A
    cp   $08                                      ; $4BBE: $FE $08
    jp   z, label_01F_53BB                        ; $4BC0: $CA $BB $53

    ld   hl, $4BD0                                ; $4BC3: $21 $D0 $4B
    call GetHandlerAddressInTable                 ; $4BC6: $CD $64 $7A
    ld   a, $BD                                   ; $4BC9: $3E $BD
    ldh  [rNR11], a                               ; $4BCB: $E0 $11
    jp   $53DF                                    ; $4BCD: $C3 $DF $53

    db   $E4                                      ; $4BD0: $E4
    ld   c, e                                     ; $4BD1: $4B
    rst  $20                                      ; $4BD2: $E7
    ld   c, e                                     ; $4BD3: $4B
    ld   [$ED4B], a                               ; $4BD4: $EA $4B $ED
    ld   c, e                                     ; $4BD7: $4B
    ldh  a, [rWX]                                 ; $4BD8: $F0 $4B
    di                                            ; $4BDA: $F3
    ld   c, e                                     ; $4BDB: $4B
    or   $4B                                      ; $4BDC: $F6 $4B
    nop                                           ; $4BDE: $00
    cp   l                                        ; $4BDF: $BD
    ldh  a, [hBGMapOffsetHigh]                    ; $4BE0: $F0 $E0
    rst  $00                                      ; $4BE2: $C7
    inc  c                                        ; $4BE3: $0C
    ldh  [$FFC7], a                               ; $4BE4: $E0 $C7
    inc  bc                                       ; $4BE6: $03
    ret  nz                                       ; $4BE7: $C0

    rst  $00                                      ; $4BE8: $C7
    inc  bc                                       ; $4BE9: $03
    and  b                                        ; $4BEA: $A0
    rst  $00                                      ; $4BEB: $C7
    inc  b                                        ; $4BEC: $04
    add  b                                        ; $4BED: $80
    rst  $00                                      ; $4BEE: $C7
    inc  b                                        ; $4BEF: $04
    ld   h, b                                     ; $4BF0: $60
    rst  $00                                      ; $4BF1: $C7
    dec  b                                        ; $4BF2: $05
    ld   b, b                                     ; $4BF3: $40
    rst  $00                                      ; $4BF4: $C7
    ld   b, $20                                   ; $4BF5: $06 $20
    rst  $00                                      ; $4BF7: $C7
    inc  bc                                       ; $4BF8: $03
    ld   hl, $4C13                                ; $4BF9: $21 $13 $4C
    jp   label_01F_539A                           ; $4BFC: $C3 $9A $53

    call DecrementValueAtDE                            ; $4BFF: $CD $71 $7A
    ret  nz                                       ; $4C02: $C0

    call IncrementValueAtBC                            ; $4C03: $CD $75 $7A
    cp   $02                                      ; $4C06: $FE $02
    jp   z, label_01F_53BB                        ; $4C08: $CA $BB $53

    ld   a, $1E                                   ; $4C0B: $3E $1E
    ldh  [rNR10], a                               ; $4C0D: $E0 $10
    ld   a, $06                                   ; $4C0F: $3E $06
    ld   [de], a                                  ; $4C11: $12
    ret                                           ; $4C12: $C9

    rla                                           ; $4C13: $17
    sub  [hl]                                     ; $4C14: $96
    ld   c, c                                     ; $4C15: $49
    ld   h, b                                     ; $4C16: $60
    add  $04                                      ; $4C17: $C6 $04
    ld   hl, $4C26                                ; $4C19: $21 $26 $4C
    jp   label_01F_539A                           ; $4C1C: $C3 $9A $53

    call DecrementValueAtDE                            ; $4C1F: $CD $71 $7A
    ret  nz                                       ; $4C22: $C0

    jp   label_01F_53B5                           ; $4C23: $C3 $B5 $53

    ld   d, $00                                   ; $4C26: $16 $00
    ldh  a, [rP1]                                 ; $4C28: $F0 $00
    jp   nz, $3E10                                ; $4C2A: $C2 $10 $3E

    inc  l                                        ; $4C2D: $2C
    ld   [$D3BC], a                               ; $4C2E: $EA $BC $D3
    ld   hl, $4C75                                ; $4C31: $21 $75 $4C
    call func_01F_7AB7                            ; $4C34: $CD $B7 $7A
    jp   label_01F_539A                           ; $4C37: $C3 $9A $53

    call IncrementValueAtBC                            ; $4C3A: $CD $75 $7A
    cp   $0B                                      ; $4C3D: $FE $0B
    jr   z, jr_01F_4C47                           ; $4C3F: $28 $06

jr_01F_4C41:
    ld   hl, $4C61                                ; $4C41: $21 $61 $4C
    jp   label_01F_7AE1                           ; $4C44: $C3 $E1 $7A

jr_01F_4C47:
    call func_01F_7A9A                            ; $4C47: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4C4A: $CA $B5 $53

    cp   $0C                                      ; $4C4D: $FE $0C
    jr   z, jr_01F_4C56                           ; $4C4F: $28 $05

    ld   a, $01                                   ; $4C51: $3E $01
    ld   [bc], a                                  ; $4C53: $02
    jr   jr_01F_4C41                              ; $4C54: $18 $EB

jr_01F_4C56:
    xor  a                                        ; $4C56: $AF
    ld   [bc], a                                  ; $4C57: $02
    ld   hl, $4C7B                                ; $4C58: $21 $7B $4C
    call func_01F_7AB7                            ; $4C5B: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4C5E: $C3 $79 $7A

    nop                                           ; $4C61: $00
    ld   [$F0FF], sp                              ; $4C62: $08 $FF $F0
    nop                                           ; $4C65: $00
    ld   [$FCFF], sp                              ; $4C66: $08 $FF $FC
    nop                                           ; $4C69: $00
    ld   b, $FF                                   ; $4C6A: $06 $FF
    ld   hl, sp+$00                               ; $4C6C: $F8 $00
    ld   b, $FF                                   ; $4C6E: $06 $FF
    ld   a, [$800]                           ; $4C70: $FA $00 $08
    rst  $38                                      ; $4C73: $FF
    rst  $38                                      ; $4C74: $FF
    nop                                           ; $4C75: $00
    nop                                           ; $4C76: $00
    rrca                                          ; $4C77: $0F
    ret  nc                                       ; $4C78: $D0

    add  a                                        ; $4C79: $87
    ld   [bc], a                                  ; $4C7A: $02
    nop                                           ; $4C7B: $00
    nop                                           ; $4C7C: $00
    rst  $30                                      ; $4C7D: $F7
    ldh  a, [$FF87]                               ; $4C7E: $F0 $87
    inc  b                                        ; $4C80: $04
    ld   a, $22                                   ; $4C81: $3E $22
    ld   [$D3BC], a                               ; $4C83: $EA $BC $D3
    ld   hl, $4CCF                                ; $4C86: $21 $CF $4C
    call func_01F_7AB7                            ; $4C89: $CD $B7 $7A
    jp   label_01F_5395                           ; $4C8C: $C3 $95 $53

    call IncrementValueAtBC                            ; $4C8F: $CD $75 $7A
    cp   $07                                      ; $4C92: $FE $07
    jr   z, jr_01F_4C9C                           ; $4C94: $28 $06

jr_01F_4C96:
    ld   hl, $4CC3                                ; $4C96: $21 $C3 $4C
    jp   label_01F_7AE1                           ; $4C99: $C3 $E1 $7A

jr_01F_4C9C:
    call func_01F_7A9A                            ; $4C9C: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4C9F: $CA $BB $53

    cp   $1E                                      ; $4CA2: $FE $1E
    jr   z, jr_01F_4CB2                           ; $4CA4: $28 $0C

    cp   $06                                      ; $4CA6: $FE $06
    jr   z, jr_01F_4CBE                           ; $4CA8: $28 $14

    ld   a, $01                                   ; $4CAA: $3E $01
    ld   bc, $D394                                ; $4CAC: $01 $94 $D3
    ld   [bc], a                                  ; $4CAF: $02
    jr   jr_01F_4C96                              ; $4CB0: $18 $E4

jr_01F_4CB2:
    ld   hl, $4CD5                                ; $4CB2: $21 $D5 $4C

jr_01F_4CB5:
    ld   a, $01                                   ; $4CB5: $3E $01
    ld   [bc], a                                  ; $4CB7: $02
    call func_01F_7AB7                            ; $4CB8: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4CBB: $C3 $79 $7A

jr_01F_4CBE:
    ld   hl, $4CDB                                ; $4CBE: $21 $DB $4C
    jr   jr_01F_4CB5                              ; $4CC1: $18 $F2

    nop                                           ; $4CC3: $00
    ld   [bc], a                                  ; $4CC4: $02
    nop                                           ; $4CC5: $00
    ld   bc, $F0FF                                ; $4CC6: $01 $FF $F0
    rst  $38                                      ; $4CC9: $FF
    ldh  [rIE], a                                 ; $4CCA: $E0 $FF
    ret  nz                                       ; $4CCC: $C0

    nop                                           ; $4CCD: $00
    ld   [hl], c                                  ; $4CCE: $71
    nop                                           ; $4CCF: $00
    nop                                           ; $4CD0: $00
    rrca                                          ; $4CD1: $0F
    nop                                           ; $4CD2: $00
    add  a                                        ; $4CD3: $87
    ld   bc, $00                                  ; $4CD4: $01 $00 $00
    ld   b, b                                     ; $4CD7: $40
    db   $10                                      ; $4CD8: $10
    add  a                                        ; $4CD9: $87
    ld   bc, $00                                  ; $4CDA: $01 $00 $00
    ld   b, a                                     ; $4CDD: $47
    ld   [hl], b                                  ; $4CDE: $70
    add  a                                        ; $4CDF: $87
    ld   bc, $33E                                 ; $4CE0: $01 $3E $03
    ld   [$D3BC], a                               ; $4CE3: $EA $BC $D3
    ld   hl, $4D20                                ; $4CE6: $21 $20 $4D
    call func_01F_7AB7                            ; $4CE9: $CD $B7 $7A
    jp   label_01F_5395                           ; $4CEC: $C3 $95 $53

    call DecrementValueAtDE                            ; $4CEF: $CD $71 $7A
    ret  nz                                       ; $4CF2: $C0

    ld   a, $08                                   ; $4CF3: $3E $08
    ld   [de], a                                  ; $4CF5: $12
    call IncrementValueAtBC                            ; $4CF6: $CD $75 $7A
    cp   $05                                      ; $4CF9: $FE $05
    jr   z, jr_01F_4D03                           ; $4CFB: $28 $06

jr_01F_4CFD:
    ld   hl, $4D18                                ; $4CFD: $21 $18 $4D
    jp   label_01F_7AE1                           ; $4D00: $C3 $E1 $7A

jr_01F_4D03:
    call func_01F_7A9A                            ; $4D03: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4D06: $CA $BB $53

    cp   $01                                      ; $4D09: $FE $01
    jr   z, jr_01F_4D12                           ; $4D0B: $28 $05

jr_01F_4D0D:
    ld   a, $01                                   ; $4D0D: $3E $01
    ld   [bc], a                                  ; $4D0F: $02
    jr   jr_01F_4CFD                              ; $4D10: $18 $EB

jr_01F_4D12:
    ld   a, $65                                   ; $4D12: $3E $65
    ldh  [rNR12], a                               ; $4D14: $E0 $12
    jr   jr_01F_4D0D                              ; $4D16: $18 $F5

    nop                                           ; $4D18: $00
    inc  b                                        ; $4D19: $04
    rst  $38                                      ; $4D1A: $FF
    db   $DD                                      ; $4D1B: $DD
    nop                                           ; $4D1C: $00
    ld   b, $00                                   ; $4D1D: $06 $00
    add  hl, de                                   ; $4D1F: $19
    nop                                           ; $4D20: $00
    add  b                                        ; $4D21: $80
    rra                                           ; $4D22: $1F
    or   [hl]                                     ; $4D23: $B6
    add  a                                        ; $4D24: $87
    ld   [$093E], sp                              ; $4D25: $08 $3E $09
    ld   [$D3BC], a                               ; $4D28: $EA $BC $D3
    ld   hl, $4DAB                                ; $4D2B: $21 $AB $4D
    call func_01F_7AB7                            ; $4D2E: $CD $B7 $7A
    jp   label_01F_539A                           ; $4D31: $C3 $9A $53

    call IncrementValueAtBC                            ; $4D34: $CD $75 $7A
    cp   $29                                      ; $4D37: $FE $29
    jr   z, jr_01F_4D41                           ; $4D39: $28 $06

jr_01F_4D3B:
    ld   hl, $4D5B                                ; $4D3B: $21 $5B $4D
    jp   label_01F_7AE1                           ; $4D3E: $C3 $E1 $7A

jr_01F_4D41:
    call func_01F_7A9A                            ; $4D41: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4D44: $CA $BB $53

    cp   $03                                      ; $4D47: $FE $03
    jr   z, jr_01F_4D50                           ; $4D49: $28 $05

    ld   a, $01                                   ; $4D4B: $3E $01
    ld   [bc], a                                  ; $4D4D: $02
    jr   jr_01F_4D3B                              ; $4D4E: $18 $EB

jr_01F_4D50:
    xor  a                                        ; $4D50: $AF
    ld   [bc], a                                  ; $4D51: $02
    ld   hl, $4DB1                                ; $4D52: $21 $B1 $4D
    call func_01F_7AB7                            ; $4D55: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4D58: $C3 $79 $7A

    nop                                           ; $4D5B: $00
    jr   nc, jr_01F_4D5E                          ; $4D5C: $30 $00

jr_01F_4D5E:
    jr   nc, jr_01F_4D60                          ; $4D5E: $30 $00

func_01F_4D60:
jr_01F_4D60:
    jr   nc, jr_01F_4D62                          ; $4D60: $30 $00

jr_01F_4D62:
    jr   nc, jr_01F_4D64                          ; $4D62: $30 $00

jr_01F_4D64:
    jr   z, jr_01F_4D66                           ; $4D64: $28 $00

jr_01F_4D66:
    jr   z, jr_01F_4D68                           ; $4D66: $28 $00

jr_01F_4D68:
    jr   z, jr_01F_4D6A                           ; $4D68: $28 $00

jr_01F_4D6A:
    jr   z, jr_01F_4D6C                           ; $4D6A: $28 $00

jr_01F_4D6C:
    jr   nz, jr_01F_4D6E                          ; $4D6C: $20 $00

jr_01F_4D6E:
    jr   nz, jr_01F_4D70                          ; $4D6E: $20 $00

jr_01F_4D70:
    jr   nz, jr_01F_4D72                          ; $4D70: $20 $00

jr_01F_4D72:
    jr   nz, jr_01F_4D74                          ; $4D72: $20 $00

jr_01F_4D74:
    jr   jr_01F_4D76                              ; $4D74: $18 $00

jr_01F_4D76:
    jr   jr_01F_4D78                              ; $4D76: $18 $00

jr_01F_4D78:
    jr   jr_01F_4D7A                              ; $4D78: $18 $00

jr_01F_4D7A:
    jr   jr_01F_4D7C                              ; $4D7A: $18 $00

jr_01F_4D7C:
    stop                                          ; $4D7C: $10 $00
    stop                                          ; $4D7E: $10 $00
    stop                                          ; $4D80: $10 $00
    db   $10                                      ; $4D82: $10
    rst  $38                                      ; $4D83: $FF
    ldh  a, [rIE]                                 ; $4D84: $F0 $FF
    ldh  a, [rIE]                                 ; $4D86: $F0 $FF
    ldh  a, [rIE]                                 ; $4D88: $F0 $FF
    ldh  a, [rIE]                                 ; $4D8A: $F0 $FF
    add  sp, -$01                                 ; $4D8C: $E8 $FF
    add  sp, -$01                                 ; $4D8E: $E8 $FF
    add  sp, -$01                                 ; $4D90: $E8 $FF
    add  sp, -$01                                 ; $4D92: $E8 $FF
    ldh  [rIE], a                                 ; $4D94: $E0 $FF
    ldh  [rIE], a                                 ; $4D96: $E0 $FF
    ldh  [rIE], a                                 ; $4D98: $E0 $FF
    ldh  [rIE], a                                 ; $4D9A: $E0 $FF
    ret  c                                        ; $4D9C: $D8

    rst  $38                                      ; $4D9D: $FF
    ret  c                                        ; $4D9E: $D8

    rst  $38                                      ; $4D9F: $FF
    ret  c                                        ; $4DA0: $D8

    rst  $38                                      ; $4DA1: $FF
    ret  c                                        ; $4DA2: $D8

    rst  $38                                      ; $4DA3: $FF
    ret  nc                                       ; $4DA4: $D0

    rst  $38                                      ; $4DA5: $FF
    ret  nc                                       ; $4DA6: $D0

    rst  $38                                      ; $4DA7: $FF
    ret  nc                                       ; $4DA8: $D0

    rst  $38                                      ; $4DA9: $FF
    ret  nc                                       ; $4DAA: $D0

    nop                                           ; $4DAB: $00
    add  b                                        ; $4DAC: $80
    dec  e                                        ; $4DAD: $1D
    nop                                           ; $4DAE: $00
    add  c                                        ; $4DAF: $81
    stop                                          ; $4DB0: $10 $00
    add  b                                        ; $4DB2: $80
    rst  $30                                      ; $4DB3: $F7
    nop                                           ; $4DB4: $00
    add  c                                        ; $4DB5: $81
    db   $10                                      ; $4DB6: $10
    ld   a, $07                                   ; $4DB7: $3E $07
    ld   [$D3BC], a                               ; $4DB9: $EA $BC $D3
    ld   hl, $4DE9                                ; $4DBC: $21 $E9 $4D
    call func_01F_7AB7                            ; $4DBF: $CD $B7 $7A
    jp   label_01F_539A                           ; $4DC2: $C3 $9A $53

    call IncrementValueAtBC                            ; $4DC5: $CD $75 $7A
    cp   $07                                      ; $4DC8: $FE $07
    jr   z, jr_01F_4DD2                           ; $4DCA: $28 $06

jr_01F_4DCC:
    ld   hl, $4DDD                                ; $4DCC: $21 $DD $4D
    jp   label_01F_7AE1                           ; $4DCF: $C3 $E1 $7A

jr_01F_4DD2:
    call func_01F_7A9A                            ; $4DD2: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4DD5: $CA $B5 $53

    ld   a, $01                                   ; $4DD8: $3E $01
    ld   [bc], a                                  ; $4DDA: $02
    jr   jr_01F_4DCC                              ; $4DDB: $18 $EF

    nop                                           ; $4DDD: $00
    add  b                                        ; $4DDE: $80
    nop                                           ; $4DDF: $00
    ld   h, b                                     ; $4DE0: $60
    nop                                           ; $4DE1: $00
    ld   b, b                                     ; $4DE2: $40
    rst  $38                                      ; $4DE3: $FF
    ret  nz                                       ; $4DE4: $C0

    rst  $38                                      ; $4DE5: $FF
    and  b                                        ; $4DE6: $A0
    rst  $38                                      ; $4DE7: $FF
    adc  b                                        ; $4DE8: $88
    nop                                           ; $4DE9: $00
    add  b                                        ; $4DEA: $80
    ld   a, [c]                                   ; $4DEB: $F2
    nop                                           ; $4DEC: $00
    add  l                                        ; $4DED: $85
    ld   bc, $A3E                                 ; $4DEE: $01 $3E $0A
    ld   [$D3BC], a                               ; $4DF1: $EA $BC $D3
    ld   hl, $4E0A                                ; $4DF4: $21 $0A $4E
    jp   label_01F_539A                           ; $4DF7: $C3 $9A $53

    call DecrementValueAtDE                            ; $4DFA: $CD $71 $7A
    ret  nz                                       ; $4DFD: $C0

    call func_01F_7A9A                            ; $4DFE: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4E01: $CA $BB $53

    ld   hl, $4E0A                                ; $4E04: $21 $0A $4E
    jp   label_01F_7A79                           ; $4E07: $C3 $79 $7A

    rla                                           ; $4E0A: $17
    cp   h                                        ; $4E0B: $BC
    ld   h, h                                     ; $4E0C: $64
    ld   b, h                                     ; $4E0D: $44
    rst  $00                                      ; $4E0E: $C7
    ld   [bc], a                                  ; $4E0F: $02
    ld   a, $14                                   ; $4E10: $3E $14
    ld   [$D3BC], a                               ; $4E12: $EA $BC $D3
    ld   hl, $4E4A                                ; $4E15: $21 $4A $4E
    call func_01F_7AB7                            ; $4E18: $CD $B7 $7A
    jp   label_01F_539A                           ; $4E1B: $C3 $9A $53

    call IncrementValueAtBC                            ; $4E1E: $CD $75 $7A
    cp   $03                                      ; $4E21: $FE $03
    jr   z, jr_01F_4E2B                           ; $4E23: $28 $06

jr_01F_4E25:
    ld   hl, $4E46                                ; $4E25: $21 $46 $4E
    jp   label_01F_7AE1                           ; $4E28: $C3 $E1 $7A

jr_01F_4E2B:
    call func_01F_7A9A                            ; $4E2B: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $4E2E: $CA $BB $53

    cp   $10                                      ; $4E31: $FE $10
    jr   z, jr_01F_4E3A                           ; $4E33: $28 $05

    ld   a, $01                                   ; $4E35: $3E $01
    ld   [bc], a                                  ; $4E37: $02
    jr   jr_01F_4E25                              ; $4E38: $18 $EB

jr_01F_4E3A:
    ld   hl, $4E50                                ; $4E3A: $21 $50 $4E
    ld   a, $01                                   ; $4E3D: $3E $01
    ld   [bc], a                                  ; $4E3F: $02
    call func_01F_7AB7                            ; $4E40: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4E43: $C3 $79 $7A

    rst  $38                                      ; $4E46: $FF
    db   $FC                                      ; $4E47: $FC
    nop                                           ; $4E48: $00
    ld   [bc], a                                  ; $4E49: $02
    nop                                           ; $4E4A: $00
    nop                                           ; $4E4B: $00
    add  hl, de                                   ; $4E4C: $19
    ld   [$0187], a                               ; $4E4D: $EA $87 $01
    nop                                           ; $4E50: $00
    nop                                           ; $4E51: $00
    ld   b, a                                     ; $4E52: $47
    ldh  [$FF87], a                               ; $4E53: $E0 $87
    ld   bc, $7521                                ; $4E55: $01 $21 $75
    ld   c, [hl]                                  ; $4E58: $4E
    jp   label_01F_5395                           ; $4E59: $C3 $95 $53

    call DecrementValueAtDE                            ; $4E5C: $CD $71 $7A
    ret  nz                                       ; $4E5F: $C0

    call IncrementValueAtBC                            ; $4E60: $CD $75 $7A
    cp   $03                                      ; $4E63: $FE $03
    jp   z, label_01F_53B5                        ; $4E65: $CA $B5 $53

    ld   hl, $4E71                                ; $4E68: $21 $71 $4E
    call GetHandlerAddressInTable                 ; $4E6B: $CD $64 $7A
    jp   label_01F_7A79                           ; $4E6E: $C3 $79 $7A

    ld   a, e                                     ; $4E71: $7B
    ld   c, [hl]                                  ; $4E72: $4E
    add  c                                        ; $4E73: $81
    ld   c, [hl]                                  ; $4E74: $4E
    rra                                           ; $4E75: $1F
    add  b                                        ; $4E76: $80
    add  l                                        ; $4E77: $85
    and  b                                        ; $4E78: $A0
    add  a                                        ; $4E79: $87
    inc  c                                        ; $4E7A: $0C
    rra                                           ; $4E7B: $1F
    add  b                                        ; $4E7C: $80
    ld   b, a                                     ; $4E7D: $47
    and  b                                        ; $4E7E: $A0
    add  a                                        ; $4E7F: $87
    inc  c                                        ; $4E80: $0C
    rra                                           ; $4E81: $1F
    adc  l                                        ; $4E82: $8D
    jr   nz, jr_01F_4E25                          ; $4E83: $20 $A0

    rst  $00                                      ; $4E85: $C7
    inc  c                                        ; $4E86: $0C
    ld   a, $02                                   ; $4E87: $3E $02
    ld   [$D3BC], a                               ; $4E89: $EA $BC $D3
    ld   hl, $4EC4                                ; $4E8C: $21 $C4 $4E
    call func_01F_7AB7                            ; $4E8F: $CD $B7 $7A
    jp   label_01F_539A                           ; $4E92: $C3 $9A $53

    call DecrementValueAtDE                            ; $4E95: $CD $71 $7A
    ret  nz                                       ; $4E98: $C0

    ld   a, $08                                   ; $4E99: $3E $08
    ld   [de], a                                  ; $4E9B: $12
    call IncrementValueAtBC                            ; $4E9C: $CD $75 $7A
    cp   $04                                      ; $4E9F: $FE $04
    jr   z, jr_01F_4EAD                           ; $4EA1: $28 $0A

    cp   $05                                      ; $4EA3: $FE $05
    jr   z, jr_01F_4EB8                           ; $4EA5: $28 $11

jr_01F_4EA7:
    ld   hl, $4EBC                                ; $4EA7: $21 $BC $4E
    jp   label_01F_7AE1                           ; $4EAA: $C3 $E1 $7A

jr_01F_4EAD:
    call func_01F_7A9A                            ; $4EAD: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4EB0: $CA $B5 $53

    ld   a, $04                                   ; $4EB3: $3E $04

jr_01F_4EB5:
    ld   [bc], a                                  ; $4EB5: $02
    jr   jr_01F_4EA7                              ; $4EB6: $18 $EF

jr_01F_4EB8:
    ld   a, $01                                   ; $4EB8: $3E $01
    jr   jr_01F_4EB5                              ; $4EBA: $18 $F9

    nop                                           ; $4EBC: $00
    ld   [$FDFF], sp                              ; $4EBD: $08 $FF $FD
    nop                                           ; $4EC0: $00
    inc  bc                                       ; $4EC1: $03
    rst  $38                                      ; $4EC2: $FF
    ld   hl, sp+$00                               ; $4EC3: $F8 $00
    nop                                           ; $4EC5: $00
    ld   h, b                                     ; $4EC6: $60
    pop  de                                       ; $4EC7: $D1
    add  a                                        ; $4EC8: $87
    ld   [$0C3E], sp                              ; $4EC9: $08 $3E $0C
    ld   [$D3BC], a                               ; $4ECC: $EA $BC $D3
    ld   hl, $4F17                                ; $4ECF: $21 $17 $4F
    call func_01F_7AB7                            ; $4ED2: $CD $B7 $7A
    jp   label_01F_539A                           ; $4ED5: $C3 $9A $53

    call IncrementValueAtBC                            ; $4ED8: $CD $75 $7A
    cp   $09                                      ; $4EDB: $FE $09
    jr   z, jr_01F_4EE9                           ; $4EDD: $28 $0A

    cp   $0A                                      ; $4EDF: $FE $0A
    jr   z, jr_01F_4F00                           ; $4EE1: $28 $1D

jr_01F_4EE3:
    ld   hl, $4F05                                ; $4EE3: $21 $05 $4F
    jp   label_01F_7AE1                           ; $4EE6: $C3 $E1 $7A

jr_01F_4EE9:
    call func_01F_7A9A                            ; $4EE9: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4EEC: $CA $B5 $53

    cp   $09                                      ; $4EEF: $FE $09
    jr   z, jr_01F_4EF5                           ; $4EF1: $28 $02

    jr   jr_01F_4EE3                              ; $4EF3: $18 $EE

jr_01F_4EF5:
    xor  a                                        ; $4EF5: $AF
    ld   [bc], a                                  ; $4EF6: $02
    ld   hl, $4F1D                                ; $4EF7: $21 $1D $4F
    call func_01F_7AB7                            ; $4EFA: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4EFD: $C3 $79 $7A

jr_01F_4F00:
    ld   a, $01                                   ; $4F00: $3E $01
    ld   [bc], a                                  ; $4F02: $02
    jr   jr_01F_4EE3                              ; $4F03: $18 $DE

    nop                                           ; $4F05: $00
    ld   bc, $100                                 ; $4F06: $01 $00 $01
    nop                                           ; $4F09: $00
    ld   bc, $100                                 ; $4F0A: $01 $00 $01
    nop                                           ; $4F0D: $00
    ld   bc, $100                                 ; $4F0E: $01 $00 $01
    nop                                           ; $4F11: $00
    ld   bc, $100                                 ; $4F12: $01 $00 $01
    rst  $38                                      ; $4F15: $FF
    ld   a, [$0000]                               ; $4F16: $FA $00 $00
    rra                                           ; $4F19: $1F
    ret  nc                                       ; $4F1A: $D0

    add  a                                        ; $4F1B: $87
    ld   bc, $00                                  ; $4F1C: $01 $00 $00
    and  a                                        ; $4F1F: $A7
    ret  c                                        ; $4F20: $D8

    add  a                                        ; $4F21: $87
    ld   bc, $53E                                 ; $4F22: $01 $3E $05
    ld   [$D3BC], a                               ; $4F25: $EA $BC $D3
    ld   hl, $4F78                                ; $4F28: $21 $78 $4F
    call func_01F_7AB7                            ; $4F2B: $CD $B7 $7A
    jp   label_01F_539A                           ; $4F2E: $C3 $9A $53

    call DecrementValueAtDE                            ; $4F31: $CD $71 $7A
    ret  nz                                       ; $4F34: $C0

    ld   a, $02                                   ; $4F35: $3E $02
    ld   [de], a                                  ; $4F37: $12
    call IncrementValueAtBC                            ; $4F38: $CD $75 $7A
    cp   $09                                      ; $4F3B: $FE $09
    jr   z, jr_01F_4F49                           ; $4F3D: $28 $0A

    cp   $0A                                      ; $4F3F: $FE $0A
    jr   z, jr_01F_4F56                           ; $4F41: $28 $13

jr_01F_4F43:
    ld   hl, $4F66                                ; $4F43: $21 $66 $4F
    jp   label_01F_7AE1                           ; $4F46: $C3 $E1 $7A

jr_01F_4F49:
    call func_01F_7A9A                            ; $4F49: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4F4C: $CA $B5 $53

    cp   $03                                      ; $4F4F: $FE $03
    jr   z, jr_01F_4F5B                           ; $4F51: $28 $08

    ld   a, [bc]                                  ; $4F53: $0A
    jr   jr_01F_4F43                              ; $4F54: $18 $ED

jr_01F_4F56:
    ld   a, $01                                   ; $4F56: $3E $01
    ld   [bc], a                                  ; $4F58: $02
    jr   jr_01F_4F43                              ; $4F59: $18 $E8

jr_01F_4F5B:
    xor  a                                        ; $4F5B: $AF
    ld   [bc], a                                  ; $4F5C: $02
    ld   hl, $4F7E                                ; $4F5D: $21 $7E $4F
    call func_01F_7AB7                            ; $4F60: $CD $B7 $7A
    jp   label_01F_7A79                           ; $4F63: $C3 $79 $7A

    nop                                           ; $4F66: $00
    stop                                          ; $4F67: $10 $00
    stop                                          ; $4F69: $10 $00
    stop                                          ; $4F6B: $10 $00
    stop                                          ; $4F6D: $10 $00
    inc  c                                        ; $4F6F: $0C
    nop                                           ; $4F70: $00
    ld   [$0400], sp                              ; $4F71: $08 $00 $04
    nop                                           ; $4F74: $00
    ld   [bc], a                                  ; $4F75: $02
    rst  $38                                      ; $4F76: $FF
    and  d                                        ; $4F77: $A2
    nop                                           ; $4F78: $00
    add  b                                        ; $4F79: $80
    rra                                           ; $4F7A: $1F
    and  b                                        ; $4F7B: $A0
    add  [hl]                                     ; $4F7C: $86
    ld   [bc], a                                  ; $4F7D: $02
    nop                                           ; $4F7E: $00
    add  b                                        ; $4F7F: $80
    add  a                                        ; $4F80: $87
    and  b                                        ; $4F81: $A0
    add  [hl]                                     ; $4F82: $86
    ld   [bc], a                                  ; $4F83: $02
    ld   a, $0B                                   ; $4F84: $3E $0B
    ld   [$D3BC], a                               ; $4F86: $EA $BC $D3
    ld   hl, $4FEF                                ; $4F89: $21 $EF $4F
    call func_01F_7AB7                            ; $4F8C: $CD $B7 $7A
    jp   label_01F_539A                           ; $4F8F: $C3 $9A $53

    call func_01F_7A9A                            ; $4F92: $CD $9A $7A
    jr   z, jr_01F_4FBB                           ; $4F95: $28 $24

jr_01F_4F97:
    ld   a, [$D3E2]                               ; $4F97: $FA $E2 $D3
    cp   $0D                                      ; $4F9A: $FE $0D
    jr   nc, jr_01F_4FAF                          ; $4F9C: $30 $11

    and  $01                                      ; $4F9E: $E6 $01
    jr   nz, jr_01F_4FAB                          ; $4FA0: $20 $09

    ld   a, $01                                   ; $4FA2: $3E $01

jr_01F_4FA4:
    ld   [bc], a                                  ; $4FA4: $02
    ld   hl, $4FE7                                ; $4FA5: $21 $E7 $4F
    jp   label_01F_7AE1                           ; $4FA8: $C3 $E1 $7A

jr_01F_4FAB:
    ld   a, $02                                   ; $4FAB: $3E $02
    jr   jr_01F_4FA4                              ; $4FAD: $18 $F5

jr_01F_4FAF:
    and  $01                                      ; $4FAF: $E6 $01
    jr   nz, jr_01F_4FB7                          ; $4FB1: $20 $04

    ld   a, $03                                   ; $4FB3: $3E $03
    jr   jr_01F_4FA4                              ; $4FB5: $18 $ED

jr_01F_4FB7:
    ld   a, $04                                   ; $4FB7: $3E $04
    jr   jr_01F_4FA4                              ; $4FB9: $18 $E9

jr_01F_4FBB:
    push bc                                       ; $4FBB: $C5
    ld   bc, $D3E2                                ; $4FBC: $01 $E2 $D3
    call IncrementValueAtBC                            ; $4FBF: $CD $75 $7A
    pop  bc                                       ; $4FC2: $C1
    cp   $05                                      ; $4FC3: $FE $05
    jr   z, jr_01F_4FDB                           ; $4FC5: $28 $14

    cp   $22                                      ; $4FC7: $FE $22
    jp   z, label_01F_53B5                        ; $4FC9: $CA $B5 $53

    cp   $11                                      ; $4FCC: $FE $11
    jr   nc, jr_01F_4FE3                          ; $4FCE: $30 $13

jr_01F_4FD0:
    sra  a                                        ; $4FD0: $CB $2F
    ld   e, a                                     ; $4FD2: $5F
    ld   a, $0B                                   ; $4FD3: $3E $0B
    sub  e                                        ; $4FD5: $93
    ld   [$D3BC], a                               ; $4FD6: $EA $BC $D3
    jr   jr_01F_4F97                              ; $4FD9: $18 $BC

jr_01F_4FDB:
    ld   a, $A0                                   ; $4FDB: $3E $A0
    ldh  [rNR12], a                               ; $4FDD: $E0 $12
    ld   a, $05                                   ; $4FDF: $3E $05
    jr   jr_01F_4FD0                              ; $4FE1: $18 $ED

jr_01F_4FE3:
    ld   a, $11                                   ; $4FE3: $3E $11
    jr   jr_01F_4FD0                              ; $4FE5: $18 $E9

    nop                                           ; $4FE7: $00
    jr   nz, @+$01                                ; $4FE8: $20 $FF

    add  sp, $00                                  ; $4FEA: $E8 $00
    inc  e                                        ; $4FEC: $1C
    rst  $38                                      ; $4FED: $FF
    ldh  a, [rP1]                                 ; $4FEE: $F0 $00
    ld   b, b                                     ; $4FF0: $40
    rra                                           ; $4FF1: $1F
    add  b                                        ; $4FF2: $80
    add  e                                        ; $4FF3: $83
    ld   bc, $103E                                ; $4FF4: $01 $3E $10
    ld   [$D3BC], a                               ; $4FF7: $EA $BC $D3
    ld   hl, $5036                                ; $4FFA: $21 $36 $50
    call func_01F_7AB7                            ; $4FFD: $CD $B7 $7A
    jp   label_01F_5395                           ; $5000: $C3 $95 $53

    call IncrementValueAtBC                            ; $5003: $CD $75 $7A
    cp   $09                                      ; $5006: $FE $09
    jr   z, jr_01F_5014                           ; $5008: $28 $0A

    cp   $0A                                      ; $500A: $FE $0A
    jr   z, jr_01F_501F                           ; $500C: $28 $11

jr_01F_500E:
    ld   hl, $5024                                ; $500E: $21 $24 $50
    jp   label_01F_7AE1                           ; $5011: $C3 $E1 $7A

jr_01F_5014:
    call func_01F_7A9A                            ; $5014: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $5017: $CA $B5 $53

    ld   a, $09                                   ; $501A: $3E $09
    ld   [bc], a                                  ; $501C: $02
    jr   jr_01F_500E                              ; $501D: $18 $EF

jr_01F_501F:
    ld   a, $01                                   ; $501F: $3E $01
    ld   [bc], a                                  ; $5021: $02
    jr   jr_01F_500E                              ; $5022: $18 $EA

    nop                                           ; $5024: $00
    ld   b, b                                     ; $5025: $40
    nop                                           ; $5026: $00
    jr   nc, jr_01F_5029                          ; $5027: $30 $00

jr_01F_5029:
    jr   nz, @+$01                                ; $5029: $20 $FF

    ldh  [rIE], a                                 ; $502B: $E0 $FF
    ret  nc                                       ; $502D: $D0

    rst  $38                                      ; $502E: $FF
    ret  nz                                       ; $502F: $C0

    rst  $38                                      ; $5030: $FF
    and  b                                        ; $5031: $A0
    rst  $38                                      ; $5032: $FF
    add  b                                        ; $5033: $80
    nop                                           ; $5034: $00
    ret  nc                                       ; $5035: $D0

    nop                                           ; $5036: $00
    add  b                                        ; $5037: $80
    add  b                                        ; $5038: $80
    nop                                           ; $5039: $00
    add  [hl]                                     ; $503A: $86
    ld   bc, $61FA                                ; $503B: $01 $FA $61
    db   $D3                                      ; $503E: $D3
    and  a                                        ; $503F: $A7
    jp   nz, label_01F_53E6                       ; $5040: $C2 $E6 $53

    ld   a, [$D3D6]                               ; $5043: $FA $D6 $D3
    and  a                                        ; $5046: $A7
    jr   nz, jr_01F_5052                          ; $5047: $20 $09

    ld   hl, $5082                                ; $5049: $21 $82 $50

jr_01F_504C:
    call func_01F_7AB7                            ; $504C: $CD $B7 $7A
    jp   label_01F_539A                           ; $504F: $C3 $9A $53

jr_01F_5052:
    ld   hl, $5088                                ; $5052: $21 $88 $50
    jr   jr_01F_504C                              ; $5055: $18 $F5

    call IncrementValueAtBC                            ; $5057: $CD $75 $7A
    cp   $0B                                      ; $505A: $FE $0B
    jr   z, jr_01F_5064                           ; $505C: $28 $06

    ld   hl, $506E                                ; $505E: $21 $6E $50
    jp   label_01F_7AE1                           ; $5061: $C3 $E1 $7A

jr_01F_5064:
    ld   hl, wActiveJingle                        ; $5064: $21 $60 $D3
    ld   a, $38                                   ; $5067: $3E $38
    ld   [hl+], a                                 ; $5069: $22
    xor  a                                        ; $506A: $AF
    ld   [hl], a                                  ; $506B: $77
    jr   @-$30                                    ; $506C: $18 $CE

    nop                                           ; $506E: $00
    ret  nz                                       ; $506F: $C0

    nop                                           ; $5070: $00
    sub  b                                        ; $5071: $90
    nop                                           ; $5072: $00
    ld   h, b                                     ; $5073: $60
    nop                                           ; $5074: $00
    jr   nc, jr_01F_5077                          ; $5075: $30 $00

jr_01F_5077:
    jr   @+$01                                    ; $5077: $18 $FF

    add  sp, -$01                                 ; $5079: $E8 $FF
    ret  nc                                       ; $507B: $D0

    rst  $38                                      ; $507C: $FF
    and  b                                        ; $507D: $A0
    rst  $38                                      ; $507E: $FF
    ld   [hl], b                                  ; $507F: $70
    rst  $38                                      ; $5080: $FF
    ld   b, b                                     ; $5081: $40
    nop                                           ; $5082: $00
    add  b                                        ; $5083: $80
    and  b                                        ; $5084: $A0
    nop                                           ; $5085: $00
    add  d                                        ; $5086: $82
    ld   bc, vTiles0                              ; $5087: $01 $00 $80
    ret  nz                                       ; $508A: $C0

    nop                                           ; $508B: $00
    add  e                                        ; $508C: $83
    ld   bc, $43E                                 ; $508D: $01 $3E $04
    ld   [$D3BC], a                               ; $5090: $EA $BC $D3
    ld   hl, $5114                                ; $5093: $21 $14 $51
    call func_01F_7AB7                            ; $5096: $CD $B7 $7A
    jp   label_01F_5395                           ; $5099: $C3 $95 $53

    call IncrementValueAtBC                            ; $509C: $CD $75 $7A
    cp   $0E                                      ; $509F: $FE $0E
    jr   z, jr_01F_50BA                           ; $50A1: $28 $17

    cp   $0F                                      ; $50A3: $FE $0F
    jr   z, jr_01F_50C5                           ; $50A5: $28 $1E

jr_01F_50A7:
    ld   a, [$D3BC]                               ; $50A7: $FA $BC $D3
    cp   $03                                      ; $50AA: $FE $03
    jr   c, jr_01F_50B4                           ; $50AC: $38 $06

    ld   hl, $50DC                                ; $50AE: $21 $DC $50
    jp   label_01F_7AE1                           ; $50B1: $C3 $E1 $7A

jr_01F_50B4:
    ld   hl, $50F8                                ; $50B4: $21 $F8 $50
    jp   label_01F_7AE1                           ; $50B7: $C3 $E1 $7A

jr_01F_50BA:
    call func_01F_7A9A                            ; $50BA: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $50BD: $CA $B5 $53

    ld   a, $0E                                   ; $50C0: $3E $0E
    ld   [bc], a                                  ; $50C2: $02
    jr   jr_01F_50A7                              ; $50C3: $18 $E2

jr_01F_50C5:
    ld   a, [$D3BC]                               ; $50C5: $FA $BC $D3
    cp   $01                                      ; $50C8: $FE $01
    jr   z, jr_01F_50D1                           ; $50CA: $28 $05

    ld   a, $01                                   ; $50CC: $3E $01
    ld   [bc], a                                  ; $50CE: $02
    jr   jr_01F_50A7                              ; $50CF: $18 $D6

jr_01F_50D1:
    xor  a                                        ; $50D1: $AF
    ld   [bc], a                                  ; $50D2: $02
    ld   hl, $511A                                ; $50D3: $21 $1A $51
    call func_01F_7AB7                            ; $50D6: $CD $B7 $7A
    jp   label_01F_7A79                           ; $50D9: $C3 $79 $7A

    nop                                           ; $50DC: $00
    ret  nz                                       ; $50DD: $C0

jr_01F_50DE:
    nop                                           ; $50DE: $00
    and  b                                        ; $50DF: $A0
    nop                                           ; $50E0: $00
    add  b                                        ; $50E1: $80
    nop                                           ; $50E2: $00
    ld   h, b                                     ; $50E3: $60
    nop                                           ; $50E4: $00
    ld   b, b                                     ; $50E5: $40
    nop                                           ; $50E6: $00
    jr   nz, @+$01                                ; $50E7: $20 $FF

    ldh  [rIE], a                                 ; $50E9: $E0 $FF
    ldh  [rIE], a                                 ; $50EB: $E0 $FF
    ret  nc                                       ; $50ED: $D0

    rst  $38                                      ; $50EE: $FF
    ret  nc                                       ; $50EF: $D0

    rst  $38                                      ; $50F0: $FF
    ret  nz                                       ; $50F1: $C0

    rst  $38                                      ; $50F2: $FF
    ret  nz                                       ; $50F3: $C0

    rst  $38                                      ; $50F4: $FF
    or   b                                        ; $50F5: $B0
    rst  $38                                      ; $50F6: $FF
    or   b                                        ; $50F7: $B0
    nop                                           ; $50F8: $00
    ld   h, b                                     ; $50F9: $60
    nop                                           ; $50FA: $00
    ld   d, b                                     ; $50FB: $50
    nop                                           ; $50FC: $00
    ld   b, b                                     ; $50FD: $40
    nop                                           ; $50FE: $00
    jr   nc, jr_01F_5101                          ; $50FF: $30 $00

jr_01F_5101:
    jr   nz, jr_01F_5103                          ; $5101: $20 $00

jr_01F_5103:
    db   $10                                      ; $5103: $10
    rst  $38                                      ; $5104: $FF
    ldh  a, [rIE]                                 ; $5105: $F0 $FF
    ldh  a, [rIE]                                 ; $5107: $F0 $FF
    ldh  a, [rIE]                                 ; $5109: $F0 $FF
    ldh  a, [rIE]                                 ; $510B: $F0 $FF
    ldh  [rIE], a                                 ; $510D: $E0 $FF
    ldh  [rIE], a                                 ; $510F: $E0 $FF
    ret  nc                                       ; $5111: $D0

    rst  $38                                      ; $5112: $FF
    ret  nc                                       ; $5113: $D0

    nop                                           ; $5114: $00
    ld   b, b                                     ; $5115: $40
    ld   c, l                                     ; $5116: $4D
    add  b                                        ; $5117: $80
    add  e                                        ; $5118: $83
    ld   bc, vTiles0                              ; $5119: $01 $00 $80
    jr   nz, jr_01F_50DE                          ; $511C: $20 $C0

    add  h                                        ; $511E: $84
    ld   bc, $43E                                 ; $511F: $01 $3E $04
    ld   [$D3BC], a                               ; $5122: $EA $BC $D3
    ld   hl, $5161                                ; $5125: $21 $61 $51
    call func_01F_7AB7                            ; $5128: $CD $B7 $7A
    jp   label_01F_539A                           ; $512B: $C3 $9A $53

    call IncrementValueAtBC                            ; $512E: $CD $75 $7A
    cp   $09                                      ; $5131: $FE $09
    jr   z, jr_01F_513F                           ; $5133: $28 $0A

    cp   $0A                                      ; $5135: $FE $0A
    jr   z, jr_01F_514A                           ; $5137: $28 $11

jr_01F_5139:
    ld   hl, $514F                                ; $5139: $21 $4F $51
    jp   label_01F_7AE1                           ; $513C: $C3 $E1 $7A

jr_01F_513F:
    call func_01F_7A9A                            ; $513F: $CD $9A $7A
    jp   z, label_01F_53BB                        ; $5142: $CA $BB $53

    ld   a, $09                                   ; $5145: $3E $09
    ld   [bc], a                                  ; $5147: $02
    jr   jr_01F_5139                              ; $5148: $18 $EF

jr_01F_514A:
    ld   a, $01                                   ; $514A: $3E $01
    ld   [bc], a                                  ; $514C: $02
    jr   jr_01F_5139                              ; $514D: $18 $EA

    nop                                           ; $514F: $00
    ld   [de], a                                  ; $5150: $12
    nop                                           ; $5151: $00
    ld   c, $00                                   ; $5152: $0E $00
    ld   a, [bc]                                  ; $5154: $0A
    nop                                           ; $5155: $00
    ld   [$0600], sp                              ; $5156: $08 $00 $06
    nop                                           ; $5159: $00
    inc  b                                        ; $515A: $04
    nop                                           ; $515B: $00
    ld   [bc], a                                  ; $515C: $02
    nop                                           ; $515D: $00
    ld   bc, $C1FF                                ; $515E: $01 $FF $C1
    nop                                           ; $5161: $00
    nop                                           ; $5162: $00
    and  h                                        ; $5163: $A4
    nop                                           ; $5164: $00
    add  a                                        ; $5165: $87
    ld   bc, $53E                                 ; $5166: $01 $3E $05
    ld   [$D3BC], a                               ; $5169: $EA $BC $D3
    ld   hl, $51AE                                ; $516C: $21 $AE $51
    call func_01F_7AB7                            ; $516F: $CD $B7 $7A
    jp   label_01F_539A                           ; $5172: $C3 $9A $53

    call IncrementValueAtBC                            ; $5175: $CD $75 $7A
    cp   $0C                                      ; $5178: $FE $0C
    jr   z, jr_01F_518B                           ; $517A: $28 $0F

    cp   $0D                                      ; $517C: $FE $0D
    jr   z, jr_01F_5186                           ; $517E: $28 $06

jr_01F_5180:
    ld   hl, $5196                                ; $5180: $21 $96 $51
    jp   label_01F_7AE1                           ; $5183: $C3 $E1 $7A

jr_01F_5186:
    ld   a, $01                                   ; $5186: $3E $01
    ld   [bc], a                                  ; $5188: $02
    jr   jr_01F_5180                              ; $5189: $18 $F5

jr_01F_518B:
    call func_01F_7A9A                            ; $518B: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $518E: $CA $B5 $53

    ld   a, $0C                                   ; $5191: $3E $0C
    ld   [bc], a                                  ; $5193: $02
    jr   jr_01F_5180                              ; $5194: $18 $EA

    rst  $38                                      ; $5196: $FF
    ret  nz                                       ; $5197: $C0

    rst  $38                                      ; $5198: $FF
    and  b                                        ; $5199: $A0
    nop                                           ; $519A: $00
    add  b                                        ; $519B: $80
    rst  $38                                      ; $519C: $FF
    ret  nz                                       ; $519D: $C0

    rst  $38                                      ; $519E: $FF
    and  b                                        ; $519F: $A0
    nop                                           ; $51A0: $00
    add  b                                        ; $51A1: $80
    rst  $38                                      ; $51A2: $FF
    ret  nz                                       ; $51A3: $C0

    rst  $38                                      ; $51A4: $FF
    and  b                                        ; $51A5: $A0
    nop                                           ; $51A6: $00
    add  b                                        ; $51A7: $80
    rst  $38                                      ; $51A8: $FF
    ret  nz                                       ; $51A9: $C0

    rst  $38                                      ; $51AA: $FF
    and  b                                        ; $51AB: $A0
    ld   bc, $00                                  ; $51AC: $01 $00 $00
    nop                                           ; $51AF: $00
    add  a                                        ; $51B0: $87
    add  b                                        ; $51B1: $80
    add  a                                        ; $51B2: $87
    ld   bc, $23E                                 ; $51B3: $01 $3E $02
    ld   [$D3BC], a                               ; $51B6: $EA $BC $D3
    ld   hl, $51F0                                ; $51B9: $21 $F0 $51
    call func_01F_7AB7                            ; $51BC: $CD $B7 $7A
    jp   label_01F_539A                           ; $51BF: $C3 $9A $53

    call IncrementValueAtBC                            ; $51C2: $CD $75 $7A
    cp   $09                                      ; $51C5: $FE $09
    jr   z, jr_01F_51CF                           ; $51C7: $28 $06

    ld   hl, $51E0                                ; $51C9: $21 $E0 $51
    jp   label_01F_7AE1                           ; $51CC: $C3 $E1 $7A

jr_01F_51CF:
    call func_01F_7A9A                            ; $51CF: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $51D2: $CA $B5 $53

    xor  a                                        ; $51D5: $AF
    ld   [bc], a                                  ; $51D6: $02
    ld   hl, $51F6                                ; $51D7: $21 $F6 $51
    call func_01F_7AB7                            ; $51DA: $CD $B7 $7A
    jp   label_01F_7A79                           ; $51DD: $C3 $79 $7A

    nop                                           ; $51E0: $00
    ld   [bc], a                                  ; $51E1: $02
    nop                                           ; $51E2: $00
    ld   [bc], a                                  ; $51E3: $02
    nop                                           ; $51E4: $00
    ld   [bc], a                                  ; $51E5: $02
    nop                                           ; $51E6: $00
    ld   [bc], a                                  ; $51E7: $02
    nop                                           ; $51E8: $00
    ld   bc, $100                                 ; $51E9: $01 $00 $01
    nop                                           ; $51EC: $00
    ld   bc, $100                                 ; $51ED: $01 $00 $01
    nop                                           ; $51F0: $00
    nop                                           ; $51F1: $00
    ld   h, b                                     ; $51F2: $60
    ret  nc                                       ; $51F3: $D0

    add  a                                        ; $51F4: $87
    ld   [bc], a                                  ; $51F5: $02
    nop                                           ; $51F6: $00
    ld   b, b                                     ; $51F7: $40
    db   $10                                      ; $51F8: $10
    ret  nc                                       ; $51F9: $D0

    add  a                                        ; $51FA: $87
    ld   bc, $61FA                                ; $51FB: $01 $FA $61
    db   $D3                                      ; $51FE: $D3
    cp   $04                                      ; $51FF: $FE $04
    jp   z, label_01F_53E6                        ; $5201: $CA $E6 $53

    cp   $05                                      ; $5204: $FE $05
    jp   z, label_01F_53E6                        ; $5206: $CA $E6 $53

    cp   $07                                      ; $5209: $FE $07
    jp   z, label_01F_53E6                        ; $520B: $CA $E6 $53

    cp   $03                                      ; $520E: $FE $03
    jp   z, label_01F_53E6                        ; $5210: $CA $E6 $53

    cp   $0D                                      ; $5213: $FE $0D
    jp   z, label_01F_53E6                        ; $5215: $CA $E6 $53

    ld   a, $0A                                   ; $5218: $3E $0A
    ld   [$D3BC], a                               ; $521A: $EA $BC $D3
    ld   hl, $5262                                ; $521D: $21 $62 $52
    call func_01F_7AB7                            ; $5220: $CD $B7 $7A
    jp   label_01F_539A                           ; $5223: $C3 $9A $53

    call IncrementValueAtBC                            ; $5226: $CD $75 $7A
    cp   $04                                      ; $5229: $FE $04
    jr   z, jr_01F_523C                           ; $522B: $28 $0F

    cp   $05                                      ; $522D: $FE $05
    jr   z, jr_01F_5237                           ; $522F: $28 $06

jr_01F_5231:
    ld   hl, $525A                                ; $5231: $21 $5A $52
    jp   label_01F_7AE1                           ; $5234: $C3 $E1 $7A

jr_01F_5237:
    ld   a, $01                                   ; $5237: $3E $01
    ld   [bc], a                                  ; $5239: $02
    jr   jr_01F_5231                              ; $523A: $18 $F5

jr_01F_523C:
    call func_01F_7A9A                            ; $523C: $CD $9A $7A
    jp   z, label_01F_5253                        ; $523F: $CA $53 $52

    cp   $07                                      ; $5242: $FE $07
    jr   z, jr_01F_5248                           ; $5244: $28 $02

    jr   jr_01F_5231                              ; $5246: $18 $E9

jr_01F_5248:
    xor  a                                        ; $5248: $AF
    ld   [bc], a                                  ; $5249: $02
    ld   hl, $5268                                ; $524A: $21 $68 $52
    call func_01F_7AB7                            ; $524D: $CD $B7 $7A
    jp   label_01F_7A79                           ; $5250: $C3 $79 $7A

label_01F_5253:
    ld   a, $3D                                   ; $5253: $3E $3D
    ld   [wActiveJingle], a                       ; $5255: $EA $60 $D3
    jr   @-$5C                                    ; $5258: $18 $A2

    nop                                           ; $525A: $00
    ret  nz                                       ; $525B: $C0

    nop                                           ; $525C: $00
    add  b                                        ; $525D: $80
    nop                                           ; $525E: $00
    ld   b, b                                     ; $525F: $40
    cp   $80                                      ; $5260: $FE $80
    nop                                           ; $5262: $00
    ld   b, b                                     ; $5263: $40
    add  hl, de                                   ; $5264: $19
    add  b                                        ; $5265: $80
    add  e                                        ; $5266: $83
    ld   bc, $4000                                ; $5267: $01 $00 $40
    add  [hl]                                     ; $526A: $86
    add  b                                        ; $526B: $80
    add  e                                        ; $526C: $83
    ld   bc, $61FA                                ; $526D: $01 $FA $61
    db   $D3                                      ; $5270: $D3
    cp   $3E                                      ; $5271: $FE $3E
    jp   z, label_01F_53E6                        ; $5273: $CA $E6 $53

    ld   hl, $5283                                ; $5276: $21 $83 $52
    jp   label_01F_539A                           ; $5279: $C3 $9A $53

    call DecrementValueAtDE                            ; $527C: $CD $71 $7A
    ret  nz                                       ; $527F: $C0

    jp   label_01F_53BB                           ; $5280: $C3 $BB $53

    daa                                           ; $5283: $27
    cp   [hl]                                     ; $5284: $BE
    ld   h, b                                     ; $5285: $60
    ret  nz                                       ; $5286: $C0

    rst  $00                                      ; $5287: $C7
    inc  bc                                       ; $5288: $03
    ld   a, $09                                   ; $5289: $3E $09
    ld   [$D3BC], a                               ; $528B: $EA $BC $D3
    ld   hl, $52CD                                ; $528E: $21 $CD $52
    call func_01F_7AB7                            ; $5291: $CD $B7 $7A
    jp   label_01F_539A                           ; $5294: $C3 $9A $53

    call IncrementValueAtBC                            ; $5297: $CD $75 $7A
    cp   $03                                      ; $529A: $FE $03
    jr   z, jr_01F_52A8                           ; $529C: $28 $0A

    cp   $04                                      ; $529E: $FE $04
    jr   z, jr_01F_52B7                           ; $52A0: $28 $15

jr_01F_52A2:
    ld   hl, $52C7                                ; $52A2: $21 $C7 $52
    jp   label_01F_7AE1                           ; $52A5: $C3 $E1 $7A

jr_01F_52A8:
    call func_01F_7A9A                            ; $52A8: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $52AB: $CA $B5 $53

    cp   $06                                      ; $52AE: $FE $06
    jr   z, jr_01F_52BC                           ; $52B0: $28 $0A

    ld   a, $03                                   ; $52B2: $3E $03
    ld   [bc], a                                  ; $52B4: $02
    jr   jr_01F_52A2                              ; $52B5: $18 $EB

jr_01F_52B7:
    ld   a, $01                                   ; $52B7: $3E $01
    ld   [bc], a                                  ; $52B9: $02
    jr   jr_01F_52A2                              ; $52BA: $18 $E6

jr_01F_52BC:
    xor  a                                        ; $52BC: $AF
    ld   [bc], a                                  ; $52BD: $02
    ld   hl, $52D3                                ; $52BE: $21 $D3 $52
    call func_01F_7AB7                            ; $52C1: $CD $B7 $7A
    jp   label_01F_7A79                           ; $52C4: $C3 $79 $7A

    nop                                           ; $52C7: $00
    ld   h, b                                     ; $52C8: $60
    nop                                           ; $52C9: $00
    ld   b, b                                     ; $52CA: $40
    rst  $38                                      ; $52CB: $FF
    ld   [hl], b                                  ; $52CC: $70
    nop                                           ; $52CD: $00
    add  b                                        ; $52CE: $80
    add  hl, de                                   ; $52CF: $19
    nop                                           ; $52D0: $00
    add  [hl]                                     ; $52D1: $86
    ld   bc, vTiles0                              ; $52D2: $01 $00 $80
    pop  de                                       ; $52D5: $D1
    db   $10                                      ; $52D6: $10
    add  [hl]                                     ; $52D7: $86
    ld   bc, $43E                                 ; $52D8: $01 $3E $04
    ld   [$D3BC], a                               ; $52DB: $EA $BC $D3
    ld   hl, $532B                                ; $52DE: $21 $2B $53
    call func_01F_7AB7                            ; $52E1: $CD $B7 $7A
    jp   label_01F_539A                           ; $52E4: $C3 $9A $53

    call func_01F_7A9A                            ; $52E7: $CD $9A $7A
    jr   z, jr_01F_5300                           ; $52EA: $28 $14

jr_01F_52EC:
    ld   a, [$D3E2]                               ; $52EC: $FA $E2 $D3
    cp   $06                                      ; $52EF: $FE $06
    jr   nc, jr_01F_52FC                          ; $52F1: $30 $09

    ld   a, $01                                   ; $52F3: $3E $01

jr_01F_52F5:
    ld   [bc], a                                  ; $52F5: $02
    ld   hl, $5327                                ; $52F6: $21 $27 $53
    jp   label_01F_7AE1                           ; $52F9: $C3 $E1 $7A

jr_01F_52FC:
    ld   a, $02                                   ; $52FC: $3E $02
    jr   jr_01F_52F5                              ; $52FE: $18 $F5

jr_01F_5300:
    push bc                                       ; $5300: $C5
    ld   bc, $D3E2                                ; $5301: $01 $E2 $D3
    call IncrementValueAtBC                            ; $5304: $CD $75 $7A
    pop  bc                                       ; $5307: $C1
    cp   $14                                      ; $5308: $FE $14
    jp   z, label_01F_53BB                        ; $530A: $CA $BB $53

    cp   $06                                      ; $530D: $FE $06
    jp   z, label_01F_5319                        ; $530F: $CA $19 $53

    ld   a, $04                                   ; $5312: $3E $04
    ld   [$D3BC], a                               ; $5314: $EA $BC $D3
    jr   jr_01F_52EC                              ; $5317: $18 $D3

label_01F_5319:
    ld   a, $04                                   ; $5319: $3E $04
    ld   [$D3BC], a                               ; $531B: $EA $BC $D3
    ld   hl, $5331                                ; $531E: $21 $31 $53
    call func_01F_7AB7                            ; $5321: $CD $B7 $7A
    jp   label_01F_7A79                           ; $5324: $C3 $79 $7A

    nop                                           ; $5327: $00
    db   $10                                      ; $5328: $10
    rst  $38                                      ; $5329: $FF
    ld   hl, sp+$00                               ; $532A: $F8 $00
    add  b                                        ; $532C: $80
    ld   a, [de]                                  ; $532D: $1A
    add  b                                        ; $532E: $80
    add  d                                        ; $532F: $82
    ld   bc, vTiles0                              ; $5330: $01 $00 $80
    push hl                                       ; $5333: $E5
    db   $10                                      ; $5334: $10
    add  h                                        ; $5335: $84
    ld   bc, $6021                                ; $5336: $01 $21 $60
    ld   d, e                                     ; $5339: $53
    jp   label_01F_5395                           ; $533A: $C3 $95 $53

    call DecrementValueAtDE                            ; $533D: $CD $71 $7A
    ret  nz                                       ; $5340: $C0

    call IncrementValueAtBC                            ; $5341: $CD $75 $7A
    cp   $08                                      ; $5344: $FE $08
    jp   z, label_01F_53BB                        ; $5346: $CA $BB $53

    ld   hl, $5352                                ; $5349: $21 $52 $53
    call GetHandlerAddressInTable                 ; $534C: $CD $64 $7A
    jp   label_01F_7A79                           ; $534F: $C3 $79 $7A

    ld   a, b                                     ; $5352: $78
    ld   d, e                                     ; $5353: $53
    ld   h, [hl]                                  ; $5354: $66
    ld   d, e                                     ; $5355: $53
    ld   a, [hl]                                  ; $5356: $7E
    ld   d, e                                     ; $5357: $53
    ld   l, h                                     ; $5358: $6C
    ld   d, e                                     ; $5359: $53
    add  h                                        ; $535A: $84
    ld   d, e                                     ; $535B: $53
    ld   [hl], d                                  ; $535C: $72
    ld   d, e                                     ; $535D: $53
    adc  d                                        ; $535E: $8A
    ld   d, e                                     ; $535F: $53
    nop                                           ; $5360: $00
    nop                                           ; $5361: $00
    pop  bc                                       ; $5362: $C1
    ld   a, e                                     ; $5363: $7B
    add  a                                        ; $5364: $87
    ld   b, $00                                   ; $5365: $06 $00
    nop                                           ; $5367: $00
    pop  bc                                       ; $5368: $C1
    adc  d                                        ; $5369: $8A
    add  a                                        ; $536A: $87
    ld   b, $00                                   ; $536B: $06 $00
    nop                                           ; $536D: $00
    pop  bc                                       ; $536E: $C1
    sub  b                                        ; $536F: $90
    add  a                                        ; $5370: $87
    rlca                                          ; $5371: $07
    nop                                           ; $5372: $00
    nop                                           ; $5373: $00
    pop  bc                                       ; $5374: $C1
    or   [hl]                                     ; $5375: $B6
    add  a                                        ; $5376: $87
    rlca                                          ; $5377: $07
    nop                                           ; $5378: $00
    nop                                           ; $5379: $00
    ld   h, d                                     ; $537A: $62
    ld   a, e                                     ; $537B: $7B
    add  a                                        ; $537C: $87
    inc  b                                        ; $537D: $04
    nop                                           ; $537E: $00
    nop                                           ; $537F: $00
    ld   h, d                                     ; $5380: $62
    adc  d                                        ; $5381: $8A
    add  a                                        ; $5382: $87
    inc  b                                        ; $5383: $04
    nop                                           ; $5384: $00
    nop                                           ; $5385: $00
    ld   h, d                                     ; $5386: $62
    sub  b                                        ; $5387: $90
    add  a                                        ; $5388: $87
    inc  b                                        ; $5389: $04
    nop                                           ; $538A: $00
    nop                                           ; $538B: $00
    ld   h, d                                     ; $538C: $62
    or   [hl]                                     ; $538D: $B6
    add  a                                        ; $538E: $87
    inc  b                                        ; $538F: $04
    ld   a, $01                                   ; $5390: $3E $01
    ld   [$D3A0], a                               ; $5392: $EA $A0 $D3

label_01F_5395:
    ld   a, $01                                   ; $5395: $3E $01
    ld   [$D3C6], a                               ; $5397: $EA $C6 $D3

label_01F_539A:
    ld   a, [wActiveJingle]                       ; $539A: $FA $60 $D3
    ld   [$D361], a                               ; $539D: $EA $61 $D3
    xor  a                                        ; $53A0: $AF
    ld   [$D390], a                               ; $53A1: $EA $90 $D3
    ld   [$D394], a                               ; $53A4: $EA $94 $D3
    ld   [$D3E2], a                               ; $53A7: $EA $E2 $D3
    ld   a, [$D31F]                               ; $53AA: $FA $1F $D3
    set  7, a                                     ; $53AD: $CB $FF
    ld   [$D31F], a                               ; $53AF: $EA $1F $D3
    jp   label_01F_7A79                           ; $53B2: $C3 $79 $7A

label_01F_53B5:
    ld   hl, $53D9                                ; $53B5: $21 $D9 $53
    call func_01F_7A79                            ; $53B8: $CD $79 $7A

label_01F_53BB:
    xor  a                                        ; $53BB: $AF
    ld   [$D361], a                               ; $53BC: $EA $61 $D3
    ld   [$D390], a                               ; $53BF: $EA $90 $D3
    ldh  [rNR10], a                               ; $53C2: $E0 $10
    ld   [$D394], a                               ; $53C4: $EA $94 $D3
    ld   [$D3BC], a                               ; $53C7: $EA $BC $D3
    ld   [$D3A0], a                               ; $53CA: $EA $A0 $D3
    ld   [$D3C6], a                               ; $53CD: $EA $C6 $D3
    ld   a, [$D31F]                               ; $53D0: $FA $1F $D3
    res  7, a                                     ; $53D3: $CB $BF
    ld   [$D31F], a                               ; $53D5: $EA $1F $D3
    ret                                           ; $53D8: $C9

    nop                                           ; $53D9: $00
    ccf                                           ; $53DA: $3F
    nop                                           ; $53DB: $00
    nop                                           ; $53DC: $00
    pop  bc                                       ; $53DD: $C1
    ld   bc, RenderLoop.RenderLoop_loadNewMap     ; $53DE: $01 $06 $02
    ld   c, $13                                   ; $53E1: $0E $13
    jp   label_01F_7A91                           ; $53E3: $C3 $91 $7A

label_01F_53E6:
    xor  a                                        ; $53E6: $AF
    ld   [wActiveJingle], a                       ; $53E7: $EA $60 $D3
    jp   label_01F_4204                           ; $53EA: $C3 $04 $42

func_01F_53ED:
label_01F_53ED:
    ld   hl, wActiveWaveSfx                       ; $53ED: $21 $70 $D3
    ld   a, [hl]                                  ; $53F0: $7E
    and  a                                        ; $53F1: $A7
    jr   z, jr_01F_5405                           ; $53F2: $28 $11

    cp   $14                                      ; $53F4: $FE $14
    jr   z, jr_01F_53FF                           ; $53F6: $28 $07

    ld   a, [$D3C8]                               ; $53F8: $FA $C8 $D3
    and  a                                        ; $53FB: $A7
    jp   nz, label_01F_6385                       ; $53FC: $C2 $85 $63

jr_01F_53FF:
    ld   a, [hl]                                  ; $53FF: $7E
    ld   hl, $541B                                ; $5400: $21 $1B $54
    jr   jr_01F_540C                              ; $5403: $18 $07

jr_01F_5405:
    inc  hl                                       ; $5405: $23
    ld   a, [hl]                                  ; $5406: $7E
    and  a                                        ; $5407: $A7
    ret  z                                        ; $5408: $C8

    ld   hl, $5461                                ; $5409: $21 $61 $54

jr_01F_540C:
    call GetHandlerAddressInTable                 ; $540C: $CD $64 $7A
    ld   de, $D392                                ; $540F: $11 $92 $D3
    ld   bc, $D396                                ; $5412: $01 $96 $D3
    ld   a, [$D3CD]                               ; $5415: $FA $CD $D3
    and  a                                        ; $5418: $A7
    ret  nz                                       ; $5419: $C0

    jp   hl                                       ; $541A: $E9

    and  a                                        ; $541B: $A7
    ld   d, h                                     ; $541C: $54
    di                                            ; $541D: $F3
    ld   d, h                                     ; $541E: $54
    jr   c, jr_01F_5476                           ; $541F: $38 $55

    ld   h, h                                     ; $5421: $64
    ld   d, l                                     ; $5422: $55
    or   e                                        ; $5423: $B3
    ld   d, l                                     ; $5424: $55
    ld   sp, hl                                   ; $5425: $F9
    ld   d, l                                     ; $5426: $55
    ld   b, l                                     ; $5427: $45
    ld   d, [hl]                                  ; $5428: $56
    pop  de                                       ; $5429: $D1
    ld   d, [hl]                                  ; $542A: $56
    ld   [hl-], a                                 ; $542B: $32
    ld   d, a                                     ; $542C: $57
    cp   $57                                      ; $542D: $FE $57
    and  e                                        ; $542F: $A3
    ld   e, b                                     ; $5430: $58
    ld   c, c                                     ; $5431: $49
    ld   e, c                                     ; $5432: $59
    sbc  c                                        ; $5433: $99
    ld   e, c                                     ; $5434: $59
    pop  hl                                       ; $5435: $E1
    ld   e, c                                     ; $5436: $59
    add  hl, de                                   ; $5437: $19
    ld   e, d                                     ; $5438: $5A
    ld   b, h                                     ; $5439: $44
    ld   e, d                                     ; $543A: $5A
    ld   h, a                                     ; $543B: $67
    ld   e, e                                     ; $543C: $5B
    call nz, $0C5B                                ; $543D: $C4 $5B $0C
    ld   e, h                                     ; $5440: $5C
    add  b                                        ; $5441: $80
    ld   e, h                                     ; $5442: $5C
    or   b                                        ; $5443: $B0
    ld   e, h                                     ; $5444: $5C
    db   $FC                                      ; $5445: $FC
    ld   e, h                                     ; $5446: $5C
    add  h                                        ; $5447: $84
    ld   e, l                                     ; $5448: $5D
    rst  $10                                      ; $5449: $D7
    ld   e, [hl]                                  ; $544A: $5E
    add  hl, de                                   ; $544B: $19
    ld   e, a                                     ; $544C: $5F
    ld   a, b                                     ; $544D: $78
    ld   e, a                                     ; $544E: $5F
    ret  nz                                       ; $544F: $C0

    ld   e, a                                     ; $5450: $5F
    inc  e                                        ; $5451: $1C
    ld   h, b                                     ; $5452: $60
    ld   l, h                                     ; $5453: $6C
    ld   h, b                                     ; $5454: $60
    ld   l, [hl]                                  ; $5455: $6E
    ld   h, b                                     ; $5456: $60
    call nc, func_01F_4D60                        ; $5457: $D4 $60 $4D
    ld   h, c                                     ; $545A: $61
    and  d                                        ; $545B: $A2
    ld   h, c                                     ; $545C: $61
    inc  e                                        ; $545D: $1C
    ld   h, d                                     ; $545E: $62
    ld   a, h                                     ; $545F: $7C
    ld   h, d                                     ; $5460: $62
    or   b                                        ; $5461: $B0
    ld   d, h                                     ; $5462: $54
    inc  b                                        ; $5463: $04
    ld   d, l                                     ; $5464: $55
    ld   c, d                                     ; $5465: $4A
    ld   d, l                                     ; $5466: $55
    add  l                                        ; $5467: $85
    ld   d, l                                     ; $5468: $55
    cp   h                                        ; $5469: $BC
    ld   d, l                                     ; $546A: $55
    db   $10                                      ; $546B: $10
    ld   d, [hl]                                  ; $546C: $56
    ld   e, [hl]                                  ; $546D: $5E
    ld   d, [hl]                                  ; $546E: $56
    ld   [c], a                                   ; $546F: $E2
    ld   d, [hl]                                  ; $5470: $56
    ld   b, b                                     ; $5471: $40
    ld   d, a                                     ; $5472: $57
    inc  c                                        ; $5473: $0C
    ld   e, b                                     ; $5474: $58
    xor  a                                        ; $5475: $AF

jr_01F_5476:
    ld   e, b                                     ; $5476: $58
    ld   e, d                                     ; $5477: $5A
    ld   e, c                                     ; $5478: $59
    xor  d                                        ; $5479: $AA
    ld   e, c                                     ; $547A: $59
    ld   [$2A59], a                               ; $547B: $EA $59 $2A
    ld   e, d                                     ; $547E: $5A
    ld   d, l                                     ; $547F: $55
    ld   e, d                                     ; $5480: $5A
    ld   a, b                                     ; $5481: $78
    ld   e, e                                     ; $5482: $5B
    push de                                       ; $5483: $D5
    ld   e, e                                     ; $5484: $5B
    dec  e                                        ; $5485: $1D
    ld   e, h                                     ; $5486: $5C
    sbc  c                                        ; $5487: $99
    ld   e, h                                     ; $5488: $5C
    cp   c                                        ; $5489: $B9
    ld   e, h                                     ; $548A: $5C
    ld   a, [de]                                  ; $548B: $1A
    ld   e, l                                     ; $548C: $5D
    and  [hl]                                     ; $548D: $A6
    ld   e, l                                     ; $548E: $5D
    add  sp, $5E                                  ; $548F: $E8 $5E
    dec  h                                        ; $5491: $25
    ld   e, a                                     ; $5492: $5F
    sub  e                                        ; $5493: $93
    ld   e, a                                     ; $5494: $5F
    ret                                           ; $5495: $C9

    ld   e, a                                     ; $5496: $5F
    dec  l                                        ; $5497: $2D
    ld   h, b                                     ; $5498: $60
    ld   l, l                                     ; $5499: $6D
    ld   h, b                                     ; $549A: $60
    add  h                                        ; $549B: $84
    ld   h, b                                     ; $549C: $60
    rst  $28                                      ; $549D: $EF
    ld   h, b                                     ; $549E: $60
    ld   h, e                                     ; $549F: $63
    ld   h, c                                     ; $54A0: $61
    rst  $08                                      ; $54A1: $CF
    ld   h, c                                     ; $54A2: $61
    ld   sp, $8562                                ; $54A3: $31 $62 $85
    ld   h, d                                     ; $54A6: $62
    call func_01F_636A                            ; $54A7: $CD $6A $63
    ld   hl, $54CF                                ; $54AA: $21 $CF $54
    jp   label_01F_62F3                           ; $54AD: $C3 $F3 $62

    call DecrementValueAtDE                            ; $54B0: $CD $71 $7A
    ret  nz                                       ; $54B3: $C0

    call IncrementValueAtBC                            ; $54B4: $CD $75 $7A
    cp   $06                                      ; $54B7: $FE $06
    jp   z, label_01F_632D                        ; $54B9: $CA $2D $63

    ld   hl, $54C5                                ; $54BC: $21 $C5 $54
    call GetHandlerAddressInTable                 ; $54BF: $CD $64 $7A
    jp   label_01F_7A85                           ; $54C2: $C3 $85 $7A

    push de                                       ; $54C5: $D5
    ld   d, h                                     ; $54C6: $54
    db   $DB                                      ; $54C7: $DB
    ld   d, h                                     ; $54C8: $54
    pop  hl                                       ; $54C9: $E1
    ld   d, h                                     ; $54CA: $54
    rst  $20                                      ; $54CB: $E7
    ld   d, h                                     ; $54CC: $54
    db   $ED                                      ; $54CD: $ED
    ld   d, h                                     ; $54CE: $54
    add  b                                        ; $54CF: $80
    xor  $20                                      ; $54D0: $EE $20
    set  0, a                                     ; $54D2: $CB $C7
    dec  b                                        ; $54D4: $05
    add  b                                        ; $54D5: $80
    xor  $20                                      ; $54D6: $EE $20
    pop  de                                       ; $54D8: $D1
    rst  $00                                      ; $54D9: $C7
    dec  b                                        ; $54DA: $05
    add  b                                        ; $54DB: $80
    xor  $20                                      ; $54DC: $EE $20
    sub  $C7                                      ; $54DE: $D6 $C7
    dec  b                                        ; $54E0: $05
    add  b                                        ; $54E1: $80
    xor  $20                                      ; $54E2: $EE $20
    db   $DD                                      ; $54E4: $DD
    rst  $00                                      ; $54E5: $C7
    rlca                                          ; $54E6: $07
    add  b                                        ; $54E7: $80
    xor  $40                                      ; $54E8: $EE $40
    db   $DD                                      ; $54EA: $DD
    rst  $00                                      ; $54EB: $C7
    rlca                                          ; $54EC: $07
    add  b                                        ; $54ED: $80
    xor  $60                                      ; $54EE: $EE $60
    db   $DD                                      ; $54F0: $DD
    rst  $00                                      ; $54F1: $C7
    rlca                                          ; $54F2: $07
    ld   a, $0C                                   ; $54F3: $3E $0C
    ld   [$D3BE], a                               ; $54F5: $EA $BE $D3
    call func_01F_636F                            ; $54F8: $CD $6F $63
    ld   hl, $5532                                ; $54FB: $21 $32 $55
    call func_01F_7ABD                            ; $54FE: $CD $BD $7A
    jp   label_01F_62F8                           ; $5501: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5504: $CD $75 $7A
    cp   $02                                      ; $5507: $FE $02
    jr   z, jr_01F_5516                           ; $5509: $28 $0B

    cp   $0A                                      ; $550B: $FE $0A
    jp   z, label_01F_6327                        ; $550D: $CA $27 $63

jr_01F_5510:
    ld   hl, $5520                                ; $5510: $21 $20 $55
    jp   label_01F_7AEB                           ; $5513: $C3 $EB $7A

jr_01F_5516:
    call func_01F_7AA6                            ; $5516: $CD $A6 $7A
    jr   z, jr_01F_5510                           ; $5519: $28 $F5

    ld   a, $01                                   ; $551B: $3E $01
    ld   [bc], a                                  ; $551D: $02
    jr   jr_01F_5510                              ; $551E: $18 $F0

    nop                                           ; $5520: $00
    stop                                          ; $5521: $10 $00
    ld   b, b                                     ; $5523: $40
    nop                                           ; $5524: $00
    ld   b, b                                     ; $5525: $40
    nop                                           ; $5526: $00
    jr   nc, jr_01F_5529                          ; $5527: $30 $00

jr_01F_5529:
    jr   nc, jr_01F_552B                          ; $5529: $30 $00

jr_01F_552B:
    jr   nz, jr_01F_552D                          ; $552B: $20 $00

jr_01F_552D:
    db   $10                                      ; $552D: $10
    rst  $38                                      ; $552E: $FF
    ldh  a, [rIE]                                 ; $552F: $F0 $FF
    ldh  [hRomBank], a                            ; $5531: $E0 $80
    nop                                           ; $5533: $00
    jr   nz, @-$7E                                ; $5534: $20 $80

    add  l                                        ; $5536: $85
    ld   [bc], a                                  ; $5537: $02
    ld   hl, $63CC                                ; $5538: $21 $CC $63
    xor  a                                        ; $553B: $AF
    ldh  [rNR30], a                               ; $553C: $E0 $1A
    call func_01F_6347                            ; $553E: $CD $47 $63
    ld   hl, $555E                                ; $5541: $21 $5E $55
    call func_01F_7ABD                            ; $5544: $CD $BD $7A
    jp   label_01F_62F8                           ; $5547: $C3 $F8 $62

    call IncrementValueAtBC                            ; $554A: $CD $75 $7A
    cp   $05                                      ; $554D: $FE $05
    jp   z, label_01F_632D                        ; $554F: $CA $2D $63

    ld   hl, $5558                                ; $5552: $21 $58 $55
    jp   label_01F_7AEB                           ; $5555: $C3 $EB $7A

    ld   bc, hRomBank                             ; $5558: $01 $80 $FF
    ldh  a, [rIE]                                 ; $555B: $F0 $FF
    ldh  [hRomBank], a                            ; $555D: $E0 $80
    rst  $28                                      ; $555F: $EF
    jr   nz, jr_01F_5562                          ; $5560: $20 $00

jr_01F_5562:
    add  $01                                      ; $5562: $C6 $01
    ld   a, [$D371]                               ; $5564: $FA $71 $D3
    and  a                                        ; $5567: $A7
    jp   nz, label_01F_6385                       ; $5568: $C2 $85 $63

    ld   a, [$D361]                               ; $556B: $FA $61 $D3
    cp   $01                                      ; $556E: $FE $01
    ret  z                                        ; $5570: $C8

    ld   a, [$D361]                               ; $5571: $FA $61 $D3
    cp   $01                                      ; $5574: $FE $01
    ret  z                                        ; $5576: $C8

    ld   a, $02                                   ; $5577: $3E $02
    ld   [$D3BE], a                               ; $5579: $EA $BE $D3
    call func_01F_636F                            ; $557C: $CD $6F $63
    ld   hl, $55A4                                ; $557F: $21 $A4 $55
    jp   label_01F_62F8                           ; $5582: $C3 $F8 $62

    call DecrementValueAtDE                            ; $5585: $CD $71 $7A
    ret  nz                                       ; $5588: $C0

    call IncrementValueAtBC                            ; $5589: $CD $75 $7A
    cp   $02                                      ; $558C: $FE $02
    jr   z, jr_01F_5596                           ; $558E: $28 $06

    ld   hl, $55AA                                ; $5590: $21 $AA $55
    jp   label_01F_637E                           ; $5593: $C3 $7E $63

jr_01F_5596:
    call func_01F_7AA6                            ; $5596: $CD $A6 $7A
    jp   z, label_01F_632D                        ; $5599: $CA $2D $63

    xor  a                                        ; $559C: $AF
    ld   [bc], a                                  ; $559D: $02
    ld   hl, $55AD                                ; $559E: $21 $AD $55
    jp   label_01F_7A85                           ; $55A1: $C3 $85 $7A

    add  b                                        ; $55A4: $80
    ld   a, [$C040]                               ; $55A5: $FA $40 $C0
    rst  $00                                      ; $55A8: $C7
    inc  b                                        ; $55A9: $04
    ldh  [$FFC7], a                               ; $55AA: $E0 $C7
    inc  b                                        ; $55AC: $04
    add  b                                        ; $55AD: $80
    ld   a, [$C060]                               ; $55AE: $FA $60 $C0
    rst  $00                                      ; $55B1: $C7
    inc  b                                        ; $55B2: $04
    call func_01F_636A                            ; $55B3: $CD $6A $63
    ld   hl, $55F0                                ; $55B6: $21 $F0 $55
    jp   label_01F_62F8                           ; $55B9: $C3 $F8 $62

    call DecrementValueAtDE                            ; $55BC: $CD $71 $7A
    ret  nz                                       ; $55BF: $C0

    call IncrementValueAtBC                            ; $55C0: $CD $75 $7A
    cp   $06                                      ; $55C3: $FE $06
    jp   z, label_01F_632D                        ; $55C5: $CA $2D $63

    cp   $02                                      ; $55C8: $FE $02
    jp   z, label_01F_55DB                        ; $55CA: $CA $DB $55

    cp   $04                                      ; $55CD: $FE $04
    jp   z, label_01F_55E2                        ; $55CF: $CA $E2 $55

jr_01F_55D2:
    ld   hl, $55E6                                ; $55D2: $21 $E6 $55
    call GetHandlerAddressInTable                 ; $55D5: $CD $64 $7A
    jp   label_01F_637E                           ; $55D8: $C3 $7E $63

label_01F_55DB:
    ld   a, $40                                   ; $55DB: $3E $40

jr_01F_55DD:
    ldh  [rNR32], a                               ; $55DD: $E0 $1C
    ld   a, [bc]                                  ; $55DF: $0A
    jr   jr_01F_55D2                              ; $55E0: $18 $F0

label_01F_55E2:
    ld   a, $60                                   ; $55E2: $3E $60
    jr   jr_01F_55DD                              ; $55E4: $18 $F7

    or   $55                                      ; $55E6: $F6 $55
    di                                            ; $55E8: $F3
    ld   d, l                                     ; $55E9: $55
    or   $55                                      ; $55EA: $F6 $55
    di                                            ; $55EC: $F3
    ld   d, l                                     ; $55ED: $55
    or   $55                                      ; $55EE: $F6 $55
    add  b                                        ; $55F0: $80
    ld   a, [$DA20]                               ; $55F1: $FA $20 $DA
    rst  $00                                      ; $55F4: $C7
    ld   [bc], a                                  ; $55F5: $02
    ld   [$02C7], a                               ; $55F6: $EA $C7 $02
    ld   a, [$D361]                               ; $55F9: $FA $61 $D3
    cp   $01                                      ; $55FC: $FE $01
    ret  z                                        ; $55FE: $C8

    ld   a, $0C                                   ; $55FF: $3E $0C
    ld   [$D3BE], a                               ; $5601: $EA $BE $D3
    call func_01F_6365                            ; $5604: $CD $65 $63
    ld   hl, $5639                                ; $5607: $21 $39 $56
    call func_01F_7ABD                            ; $560A: $CD $BD $7A
    jp   label_01F_62F8                           ; $560D: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5610: $CD $75 $7A
    cp   $02                                      ; $5613: $FE $02
    jr   z, jr_01F_5628                           ; $5615: $28 $11

jr_01F_5617:
    ld   hl, $5637                                ; $5617: $21 $37 $56
    jp   label_01F_7AEB                           ; $561A: $C3 $EB $7A

jr_01F_561D:
    xor  a                                        ; $561D: $AF
    ld   [bc], a                                  ; $561E: $02
    ld   hl, $563F                                ; $561F: $21 $3F $56
    call func_01F_7ABD                            ; $5622: $CD $BD $7A
    jp   label_01F_7A85                           ; $5625: $C3 $85 $7A

jr_01F_5628:
    call func_01F_7AA6                            ; $5628: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $562B: $CA $27 $63

    cp   $07                                      ; $562E: $FE $07
    jr   z, jr_01F_561D                           ; $5630: $28 $EB

    ld   a, $01                                   ; $5632: $3E $01
    ld   [bc], a                                  ; $5634: $02
    jr   jr_01F_5617                              ; $5635: $18 $E0

    nop                                           ; $5637: $00
    inc  bc                                       ; $5638: $03
    add  b                                        ; $5639: $80
    jp   nc, $E040                                ; $563A: $D2 $40 $E0

    add  a                                        ; $563D: $87
    ld   bc, $D280                                ; $563E: $01 $80 $D2
    ld   h, b                                     ; $5641: $60
    ldh  [$FF87], a                               ; $5642: $E0 $87
    ld   bc, $71FA                                ; $5644: $01 $FA $71
    db   $D3                                      ; $5647: $D3
    cp   $03                                      ; $5648: $FE $03
    jp   z, label_01F_6385                        ; $564A: $CA $85 $63

    ld   a, $02                                   ; $564D: $3E $02
    ld   [$D3BE], a                               ; $564F: $EA $BE $D3
    call func_01F_6365                            ; $5652: $CD $65 $63
    ld   hl, $56C5                                ; $5655: $21 $C5 $56
    call func_01F_7ABD                            ; $5658: $CD $BD $7A
    jp   label_01F_62F8                           ; $565B: $C3 $F8 $62

    call DecrementValueAtDE                            ; $565E: $CD $71 $7A
    ret  nz                                       ; $5661: $C0

    ld   a, $01                                   ; $5662: $3E $01
    ld   [de], a                                  ; $5664: $12
    call IncrementValueAtBC                            ; $5665: $CD $75 $7A
    cp   $1D                                      ; $5668: $FE $1D
    jr   z, jr_01F_5676                           ; $566A: $28 $0A

    cp   $15                                      ; $566C: $FE $15
    jr   nc, jr_01F_5688                          ; $566E: $30 $18

jr_01F_5670:
    ld   hl, $568D                                ; $5670: $21 $8D $56
    jp   label_01F_7AEB                           ; $5673: $C3 $EB $7A

jr_01F_5676:
    call func_01F_7AA6                            ; $5676: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5679: $CA $27 $63

    ld   a, $14                                   ; $567C: $3E $14
    ld   [bc], a                                  ; $567E: $02
    ld   hl, $56CB                                ; $567F: $21 $CB $56
    call func_01F_7ABD                            ; $5682: $CD $BD $7A
    jp   label_01F_7A85                           ; $5685: $C3 $85 $7A

jr_01F_5688:
    ld   a, $02                                   ; $5688: $3E $02
    ld   [de], a                                  ; $568A: $12
    jr   jr_01F_5670                              ; $568B: $18 $E3

    nop                                           ; $568D: $00
    ld   b, b                                     ; $568E: $40
    nop                                           ; $568F: $00
    ld   b, b                                     ; $5690: $40
    nop                                           ; $5691: $00
    ld   b, b                                     ; $5692: $40
    ld   bc, $00                                  ; $5693: $01 $00 $00
    jr   nz, @+$01                                ; $5696: $20 $FF

    ldh  [rP1], a                                 ; $5698: $E0 $00
    ld   b, b                                     ; $569A: $40
    rst  $38                                      ; $569B: $FF
    ret  nz                                       ; $569C: $C0

    nop                                           ; $569D: $00
    ld   h, b                                     ; $569E: $60
    rst  $38                                      ; $569F: $FF
    and  b                                        ; $56A0: $A0
    nop                                           ; $56A1: $00
    add  b                                        ; $56A2: $80
    rst  $38                                      ; $56A3: $FF
    add  b                                        ; $56A4: $80
    nop                                           ; $56A5: $00
    and  b                                        ; $56A6: $A0
    rst  $38                                      ; $56A7: $FF
    ld   h, b                                     ; $56A8: $60
    nop                                           ; $56A9: $00
    ret  nz                                       ; $56AA: $C0

    rst  $38                                      ; $56AB: $FF
    ld   b, b                                     ; $56AC: $40
    ld   bc, $FF00                                ; $56AD: $01 $00 $FF
    nop                                           ; $56B0: $00
    ld   bc, $FF00                                ; $56B1: $01 $00 $FF
    nop                                           ; $56B4: $00
    rst  $38                                      ; $56B5: $FF
    ldh  [rIE], a                                 ; $56B6: $E0 $FF
    ret  nz                                       ; $56B8: $C0

    rst  $38                                      ; $56B9: $FF
    and  b                                        ; $56BA: $A0
    rst  $38                                      ; $56BB: $FF
    add  b                                        ; $56BC: $80
    rst  $38                                      ; $56BD: $FF
    ld   h, b                                     ; $56BE: $60
    rst  $38                                      ; $56BF: $FF
    ld   b, b                                     ; $56C0: $40
    rst  $38                                      ; $56C1: $FF
    jr   nz, @+$01                                ; $56C2: $20 $FF

    nop                                           ; $56C4: $00
    add  b                                        ; $56C5: $80
    nop                                           ; $56C6: $00
    jr   nz, @+$42                                ; $56C7: $20 $40

    add  h                                        ; $56C9: $84
    ld   [bc], a                                  ; $56CA: $02
    add  b                                        ; $56CB: $80
    nop                                           ; $56CC: $00
    ld   h, b                                     ; $56CD: $60
    nop                                           ; $56CE: $00
    add  [hl]                                     ; $56CF: $86
    ld   [bc], a                                  ; $56D0: $02
    ld   a, $08                                   ; $56D1: $3E $08
    ld   [$D3BE], a                               ; $56D3: $EA $BE $D3
    call func_01F_6379                            ; $56D6: $CD $79 $63
    ld   hl, $5716                                ; $56D9: $21 $16 $57
    call func_01F_7ABD                            ; $56DC: $CD $BD $7A
    jp   label_01F_62F3                           ; $56DF: $C3 $F3 $62

    call IncrementValueAtBC                            ; $56E2: $CD $75 $7A
    cp   $0F                                      ; $56E5: $FE $0F
    jr   z, jr_01F_56EF                           ; $56E7: $28 $06

jr_01F_56E9:
    ld   hl, $56FA                                ; $56E9: $21 $FA $56
    jp   label_01F_7AEB                           ; $56EC: $C3 $EB $7A

jr_01F_56EF:
    call func_01F_7AA6                            ; $56EF: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $56F2: $CA $27 $63

    ld   a, $01                                   ; $56F5: $3E $01
    ld   [bc], a                                  ; $56F7: $02
    jr   jr_01F_56E9                              ; $56F8: $18 $EF

    nop                                           ; $56FA: $00
    ld   a, [bc]                                  ; $56FB: $0A
    nop                                           ; $56FC: $00
    ld   b, $FF                                   ; $56FD: $06 $FF
    ldh  a, [rP1]                                 ; $56FF: $F0 $00
    jr   nz, jr_01F_5703                          ; $5701: $20 $00

jr_01F_5703:
    ld   a, [bc]                                  ; $5703: $0A
    nop                                           ; $5704: $00
    ld   b, $FF                                   ; $5705: $06 $FF
    ld   a, [$F6FF]                               ; $5707: $FA $FF $F6
    nop                                           ; $570A: $00
    jr   nz, jr_01F_570D                          ; $570B: $20 $00

jr_01F_570D:
    ld   a, [bc]                                  ; $570D: $0A
    nop                                           ; $570E: $00
    ld   b, $FF                                   ; $570F: $06 $FF
    ld   a, [$F6FF]                               ; $5711: $FA $FF $F6
    rst  $38                                      ; $5714: $FF
    xor  b                                        ; $5715: $A8
    add  b                                        ; $5716: $80
    nop                                           ; $5717: $00
    jr   nz, jr_01F_577A                          ; $5718: $20 $60

    add  a                                        ; $571A: $87
    nop                                           ; $571B: $00
    adc  d                                        ; $571C: $8A
    rst  $18                                      ; $571D: $DF
    db   $FD                                      ; $571E: $FD
    xor  b                                        ; $571F: $A8
    add  a                                        ; $5720: $87
    ld   b, d                                     ; $5721: $42
    inc  h                                        ; $5722: $24
    ld   a, b                                     ; $5723: $78
    adc  d                                        ; $5724: $8A
    rst  $18                                      ; $5725: $DF
    db   $FD                                      ; $5726: $FD
    xor  b                                        ; $5727: $A8
    add  a                                        ; $5728: $87
    ld   b, d                                     ; $5729: $42
    inc  h                                        ; $572A: $24
    ld   a, b                                     ; $572B: $78

func_01F_572C:
    ld   hl, $571C                                ; $572C: $21 $1C $57
    jp   $635A                                    ; $572F: $C3 $5A $63

    ld   hl, $D32F                                ; $5732: $21 $2F $D3
    set  7, [hl]                                  ; $5735: $CB $FE
    call func_01F_572C                            ; $5737: $CD $2C $57
    ld   hl, $5790                                ; $573A: $21 $90 $57
    jp   label_01F_62F3                           ; $573D: $C3 $F3 $62

    call DecrementValueAtDE                            ; $5740: $CD $71 $7A

jr_01F_5743:
    ret  nz                                       ; $5743: $C0

    call IncrementValueAtBC                            ; $5744: $CD $75 $7A
    cp   $14                                      ; $5747: $FE $14
    jr   z, jr_01F_575C                           ; $5749: $28 $11

    ld   hl, $576A                                ; $574B: $21 $6A $57

jr_01F_574E:
    call GetHandlerAddressInTable                 ; $574E: $CD $64 $7A

label_01F_5751:
    ld   a, [$D396]                               ; $5751: $FA $96 $D3
    and  $01                                      ; $5754: $E6 $01
    jp   nz, label_01F_7A7F                       ; $5756: $C2 $7F $7A

    jp   label_01F_7A85                           ; $5759: $C3 $85 $7A

label_01F_575C:
jr_01F_575C:
    ld   hl, $431D                                ; $575C: $21 $1D $43
    call func_01F_7A7F                            ; $575F: $CD $7F $7A
    ld   hl, $D32F                                ; $5762: $21 $2F $D3
    res  7, [hl]                                  ; $5765: $CB $BE
    jp   label_01F_6327                           ; $5767: $C3 $27 $63

    call z, $9657                                 ; $576A: $CC $57 $96
    ld   d, a                                     ; $576D: $57
    pop  de                                       ; $576E: $D1
    ld   d, a                                     ; $576F: $57
    sbc  h                                        ; $5770: $9C
    ld   d, a                                     ; $5771: $57
    sub  $57                                      ; $5772: $D6 $57
    and  d                                        ; $5774: $A2

jr_01F_5775:
    ld   d, a                                     ; $5775: $57
    db   $DB                                      ; $5776: $DB
    ld   d, a                                     ; $5777: $57
    xor  b                                        ; $5778: $A8
    ld   d, a                                     ; $5779: $57

jr_01F_577A:
    ldh  [$FF57], a                               ; $577A: $E0 $57

jr_01F_577C:
    xor  [hl]                                     ; $577C: $AE
    ld   d, a                                     ; $577D: $57
    push hl                                       ; $577E: $E5
    ld   d, a                                     ; $577F: $57
    or   h                                        ; $5780: $B4
    ld   d, a                                     ; $5781: $57
    ld   [$BA57], a                               ; $5782: $EA $57 $BA
    ld   d, a                                     ; $5785: $57
    rst  $28                                      ; $5786: $EF
    ld   d, a                                     ; $5787: $57
    ret  nz                                       ; $5788: $C0

    ld   d, a                                     ; $5789: $57
    db   $F4                                      ; $578A: $F4
    ld   d, a                                     ; $578B: $57
    add  $57                                      ; $578C: $C6 $57
    ld   sp, hl                                   ; $578E: $F9
    ld   d, a                                     ; $578F: $57
    add  b                                        ; $5790: $80
    and  $20                                      ; $5791: $E6 $20
    adc  d                                        ; $5793: $8A
    rst  $00                                      ; $5794: $C7
    ld   [$E680], sp                              ; $5795: $08 $80 $E6
    jr   nz, @-$67                                ; $5798: $20 $97

    rst  $00                                      ; $579A: $C7
    ld   [$6080], sp                              ; $579B: $08 $80 $60
    jr   nz, @-$62                                ; $579E: $20 $9C

    rst  $00                                      ; $57A0: $C7
    ld   [$E680], sp                              ; $57A1: $08 $80 $E6
    jr   nz, @-$74                                ; $57A4: $20 $8A

    rst  $00                                      ; $57A6: $C7
    ld   [$E680], sp                              ; $57A7: $08 $80 $E6
    jr   nz, jr_01F_5743                          ; $57AA: $20 $97

    rst  $00                                      ; $57AC: $C7
    ld   [$E680], sp                              ; $57AD: $08 $80 $E6
    jr   nz, jr_01F_574E                          ; $57B0: $20 $9C

    rst  $00                                      ; $57B2: $C7
    ld   [$E680], sp                              ; $57B3: $08 $80 $E6
    jr   nz, @-$67                                ; $57B6: $20 $97

    rst  $00                                      ; $57B8: $C7
    ld   [$E680], sp                              ; $57B9: $08 $80 $E6
    jr   nz, @-$74                                ; $57BC: $20 $8A

    rst  $00                                      ; $57BE: $C7
    ld   [$E680], sp                              ; $57BF: $08 $80 $E6
    jr   nz, jr_01F_5826                          ; $57C2: $20 $62

    rst  $00                                      ; $57C4: $C7
    ld   [$0080], sp                              ; $57C5: $08 $80 $00
    jr   nz, jr_01F_5843                          ; $57C8: $20 $79

    rst  $00                                      ; $57CA: $C7
    ld   [label_2080], sp                         ; $57CB: $08 $80 $20
    adc  d                                        ; $57CE: $8A
    add  a                                        ; $57CF: $87
    ld   [bc], a                                  ; $57D0: $02
    add  b                                        ; $57D1: $80
    jr   nz, @-$67                                ; $57D2: $20 $97

    add  a                                        ; $57D4: $87
    ld   [bc], a                                  ; $57D5: $02
    add  b                                        ; $57D6: $80
    jr   nz, jr_01F_5775                          ; $57D7: $20 $9C

    add  a                                        ; $57D9: $87
    inc  [hl]                                     ; $57DA: $34
    add  b                                        ; $57DB: $80
    jr   nz, @-$74                                ; $57DC: $20 $8A

    add  a                                        ; $57DE: $87
    ld   [bc], a                                  ; $57DF: $02
    add  b                                        ; $57E0: $80
    jr   nz, jr_01F_577A                          ; $57E1: $20 $97

    add  a                                        ; $57E3: $87
    ld   [bc], a                                  ; $57E4: $02
    add  b                                        ; $57E5: $80
    jr   nz, @-$62                                ; $57E6: $20 $9C

    add  a                                        ; $57E8: $87
    ld   [bc], a                                  ; $57E9: $02
    add  b                                        ; $57EA: $80
    jr   nz, @-$67                                ; $57EB: $20 $97

    add  a                                        ; $57ED: $87
    ld   [bc], a                                  ; $57EE: $02
    add  b                                        ; $57EF: $80
    jr   nz, jr_01F_577C                          ; $57F0: $20 $8A

    add  a                                        ; $57F2: $87
    ld   [bc], a                                  ; $57F3: $02
    add  b                                        ; $57F4: $80
    jr   nz, @+$64                                ; $57F5: $20 $62

    add  a                                        ; $57F7: $87
    ld   [bc], a                                  ; $57F8: $02
    add  b                                        ; $57F9: $80
    jr   nz, jr_01F_5875                          ; $57FA: $20 $79

    add  a                                        ; $57FC: $87
    ld   c, b                                     ; $57FD: $48
    ld   hl, $D32F                                ; $57FE: $21 $2F $D3
    set  7, [hl]                                  ; $5801: $CB $FE
    call func_01F_572C                            ; $5803: $CD $2C $57
    ld   hl, $584B                                ; $5806: $21 $4B $58
    jp   label_01F_62F3                           ; $5809: $C3 $F3 $62

    call DecrementValueAtDE                            ; $580C: $CD $71 $7A
    ret  nz                                       ; $580F: $C0

    call IncrementValueAtBC                            ; $5810: $CD $75 $7A
    cp   $16                                      ; $5813: $FE $16
    jp   z, label_01F_575C                        ; $5815: $CA $5C $57

    ld   hl, $5821                                ; $5818: $21 $21 $58

jr_01F_581B:
    call GetHandlerAddressInTable                 ; $581B: $CD $64 $7A
    jp   label_01F_5751                           ; $581E: $C3 $51 $57

    ld   a, e                                     ; $5821: $7B
    ld   e, b                                     ; $5822: $58
    ld   d, c                                     ; $5823: $51

jr_01F_5824:
    ld   e, b                                     ; $5824: $58
    add  b                                        ; $5825: $80

jr_01F_5826:
    ld   e, b                                     ; $5826: $58
    ld   d, a                                     ; $5827: $57
    ld   e, b                                     ; $5828: $58
    add  l                                        ; $5829: $85

jr_01F_582A:
    ld   e, b                                     ; $582A: $58
    ld   e, l                                     ; $582B: $5D
    ld   e, b                                     ; $582C: $58
    adc  d                                        ; $582D: $8A
    ld   e, b                                     ; $582E: $58
    ld   h, e                                     ; $582F: $63
    ld   e, b                                     ; $5830: $58
    adc  a                                        ; $5831: $8F
    ld   e, b                                     ; $5832: $58
    ld   l, c                                     ; $5833: $69
    ld   e, b                                     ; $5834: $58
    sub  h                                        ; $5835: $94
    ld   e, b                                     ; $5836: $58
    ld   l, a                                     ; $5837: $6F

jr_01F_5838:
    ld   e, b                                     ; $5838: $58
    sbc  c                                        ; $5839: $99
    ld   e, b                                     ; $583A: $58
    ld   e, l                                     ; $583B: $5D
    ld   e, b                                     ; $583C: $58
    adc  d                                        ; $583D: $8A

jr_01F_583E:
    ld   e, b                                     ; $583E: $58
    ld   d, a                                     ; $583F: $57
    ld   e, b                                     ; $5840: $58
    add  l                                        ; $5841: $85
    ld   e, b                                     ; $5842: $58

jr_01F_5843:
    ld   d, c                                     ; $5843: $51
    ld   e, b                                     ; $5844: $58
    add  b                                        ; $5845: $80
    ld   e, b                                     ; $5846: $58
    ld   [hl], l                                  ; $5847: $75
    ld   e, b                                     ; $5848: $58
    sbc  [hl]                                     ; $5849: $9E
    ld   e, b                                     ; $584A: $58
    add  b                                        ; $584B: $80
    ldh  [rNR41], a                               ; $584C: $E0 $20
    sbc  l                                        ; $584E: $9D

jr_01F_584F:
    rst  $00                                      ; $584F: $C7
    inc  b                                        ; $5850: $04
    add  b                                        ; $5851: $80
    ldh  [rNR41], a                               ; $5852: $E0 $20
    and  a                                        ; $5854: $A7
    rst  $00                                      ; $5855: $C7
    inc  b                                        ; $5856: $04
    add  b                                        ; $5857: $80
    ldh  [rNR41], a                               ; $5858: $E0 $20
    or   b                                        ; $585A: $B0

jr_01F_585B:
    rst  $00                                      ; $585B: $C7
    inc  b                                        ; $585C: $04
    add  b                                        ; $585D: $80
    ldh  [rNR41], a                               ; $585E: $E0 $20
    or   [hl]                                     ; $5860: $B6
    rst  $00                                      ; $5861: $C7
    inc  b                                        ; $5862: $04
    add  b                                        ; $5863: $80
    sub  b                                        ; $5864: $90
    jr   nz, jr_01F_5824                          ; $5865: $20 $BD

    rst  $00                                      ; $5867: $C7
    inc  b                                        ; $5868: $04
    add  b                                        ; $5869: $80
    ldh  [rNR41], a                               ; $586A: $E0 $20
    call nz, $04C7                                ; $586C: $C4 $C7 $04
    add  b                                        ; $586F: $80
    ldh  [rNR41], a                               ; $5870: $E0 $20
    cp   l                                        ; $5872: $BD
    rst  $00                                      ; $5873: $C7
    inc  b                                        ; $5874: $04

jr_01F_5875:
    add  b                                        ; $5875: $80
    add  b                                        ; $5876: $80
    jr   nz, @-$61                                ; $5877: $20 $9D

    rst  $00                                      ; $5879: $C7
    inc  b                                        ; $587A: $04
    add  b                                        ; $587B: $80
    jr   nz, jr_01F_581B                          ; $587C: $20 $9D

    add  a                                        ; $587E: $87
    rlca                                          ; $587F: $07
    add  b                                        ; $5880: $80
    jr   nz, jr_01F_582A                          ; $5881: $20 $A7

    add  a                                        ; $5883: $87
    rlca                                          ; $5884: $07
    add  b                                        ; $5885: $80
    jr   nz, jr_01F_5838                          ; $5886: $20 $B0

    add  a                                        ; $5888: $87
    rlca                                          ; $5889: $07
    add  b                                        ; $588A: $80
    jr   nz, jr_01F_5843                          ; $588B: $20 $B6

    add  a                                        ; $588D: $87
    rlca                                          ; $588E: $07
    add  b                                        ; $588F: $80
    jr   nz, jr_01F_584F                          ; $5890: $20 $BD

    add  a                                        ; $5892: $87
    inc  hl                                       ; $5893: $23
    add  b                                        ; $5894: $80
    jr   nz, jr_01F_585B                          ; $5895: $20 $C4

    add  a                                        ; $5897: $87
    rlca                                          ; $5898: $07
    add  b                                        ; $5899: $80
    jr   nz, @-$41                                ; $589A: $20 $BD

    add  a                                        ; $589C: $87
    rlca                                          ; $589D: $07
    add  b                                        ; $589E: $80
    jr   nz, jr_01F_583E                          ; $589F: $20 $9D

    add  a                                        ; $58A1: $87
    dec  [hl]                                     ; $58A2: $35
    call func_01F_7B5C                            ; $58A3: $CD $5C $7B
    call func_01F_572C                            ; $58A6: $CD $2C $57
    ld   hl, $584B                                ; $58A9: $21 $4B $58
    jp   label_01F_62F3                           ; $58AC: $C3 $F3 $62

    call DecrementValueAtDE                            ; $58AF: $CD $71 $7A
    ret  nz                                       ; $58B2: $C0

    call IncrementValueAtBC                            ; $58B3: $CD $75 $7A
    cp   $12                                      ; $58B6: $FE $12
    jp   z, label_01F_575C                        ; $58B8: $CA $5C $57

    ld   hl, $58C4                                ; $58BB: $21 $C4 $58
    call GetHandlerAddressInTable                 ; $58BE: $CD $64 $7A

jr_01F_58C1:
    jp   label_01F_5751                           ; $58C1: $C3 $51 $57

    inc  e                                        ; $58C4: $1C
    ld   e, c                                     ; $58C5: $59
    db   $EC                                      ; $58C6: $EC
    ld   e, b                                     ; $58C7: $58
    ld   hl, $F259                                ; $58C8: $21 $59 $F2

jr_01F_58CB:
    ld   e, b                                     ; $58CB: $58
    ld   h, $59                                   ; $58CC: $26 $59
    ld   hl, sp+$58                               ; $58CE: $F8 $58
    dec  hl                                       ; $58D0: $2B
    ld   e, c                                     ; $58D1: $59
    cp   $58                                      ; $58D2: $FE $58
    jr   nc, jr_01F_592F                          ; $58D4: $30 $59

    inc  b                                        ; $58D6: $04

jr_01F_58D7:
    ld   e, c                                     ; $58D7: $59
    dec  [hl]                                     ; $58D8: $35
    ld   e, c                                     ; $58D9: $59
    ld   a, [bc]                                  ; $58DA: $0A
    ld   e, c                                     ; $58DB: $59
    ld   a, [hl-]                                 ; $58DC: $3A
    ld   e, c                                     ; $58DD: $59
    db   $10                                      ; $58DE: $10
    ld   e, c                                     ; $58DF: $59
    ccf                                           ; $58E0: $3F
    ld   e, c                                     ; $58E1: $59
    ld   d, $59                                   ; $58E2: $16 $59
    ld   b, h                                     ; $58E4: $44
    ld   e, c                                     ; $58E5: $59
    add  b                                        ; $58E6: $80
    ret  nz                                       ; $58E7: $C0

    jr   nz, @-$61                                ; $58E8: $20 $9D

    rst  $00                                      ; $58EA: $C7
    inc  b                                        ; $58EB: $04
    add  b                                        ; $58EC: $80
    ldh  a, [rNR41]                               ; $58ED: $F0 $20
    sbc  l                                        ; $58EF: $9D
    rst  $00                                      ; $58F0: $C7
    inc  b                                        ; $58F1: $04
    add  b                                        ; $58F2: $80
    ldh  a, [rNR41]                               ; $58F3: $F0 $20
    ld   a, e                                     ; $58F5: $7B
    rst  $00                                      ; $58F6: $C7
    inc  b                                        ; $58F7: $04
    add  b                                        ; $58F8: $80
    ldh  a, [rNR41]                               ; $58F9: $F0 $20
    adc  [hl]                                     ; $58FB: $8E
    rst  $00                                      ; $58FC: $C7
    inc  b                                        ; $58FD: $04
    add  b                                        ; $58FE: $80

jr_01F_58FF:
    ret  nz                                       ; $58FF: $C0

    jr   nz, @-$58                                ; $5900: $20 $A6

    rst  $00                                      ; $5902: $C7
    inc  b                                        ; $5903: $04
    add  b                                        ; $5904: $80
    ret  nz                                       ; $5905: $C0

    jr   nz, @-$61                                ; $5906: $20 $9D

    rst  $00                                      ; $5908: $C7
    inc  b                                        ; $5909: $04
    add  b                                        ; $590A: $80
    ret  nz                                       ; $590B: $C0

    jr   nz, jr_01F_58CB                          ; $590C: $20 $BD

    rst  $00                                      ; $590E: $C7
    inc  b                                        ; $590F: $04
    add  b                                        ; $5910: $80
    ldh  a, [rNR41]                               ; $5911: $F0 $20
    cp   l                                        ; $5913: $BD
    rst  $00                                      ; $5914: $C7
    inc  b                                        ; $5915: $04
    add  b                                        ; $5916: $80
    add  b                                        ; $5917: $80
    jr   nz, jr_01F_58D7                          ; $5918: $20 $BD

    rst  $00                                      ; $591A: $C7
    inc  b                                        ; $591B: $04
    add  b                                        ; $591C: $80
    jr   nz, @-$61                                ; $591D: $20 $9D

    add  a                                        ; $591F: $87
    inc  d                                        ; $5920: $14
    add  b                                        ; $5921: $80
    jr   nz, jr_01F_58C1                          ; $5922: $20 $9D

    add  a                                        ; $5924: $87
    ld   [label_2080], sp                         ; $5925: $08 $80 $20
    ld   a, e                                     ; $5928: $7B
    add  a                                        ; $5929: $87
    ld   [label_2080], sp                         ; $592A: $08 $80 $20
    adc  [hl]                                     ; $592D: $8E
    add  a                                        ; $592E: $87

jr_01F_592F:
    ld   [label_2080], sp                         ; $592F: $08 $80 $20
    and  [hl]                                     ; $5932: $A6
    add  a                                        ; $5933: $87
    inc  d                                        ; $5934: $14
    add  b                                        ; $5935: $80
    jr   nz, @-$61                                ; $5936: $20 $9D

    add  a                                        ; $5938: $87
    inc  d                                        ; $5939: $14
    add  b                                        ; $593A: $80
    jr   nz, @-$41                                ; $593B: $20 $BD

    add  a                                        ; $593D: $87
    inc  d                                        ; $593E: $14
    add  b                                        ; $593F: $80
    jr   nz, jr_01F_58FF                          ; $5940: $20 $BD

    add  a                                        ; $5942: $87
    ld   [label_2080], sp                         ; $5943: $08 $80 $20
    cp   l                                        ; $5946: $BD
    add  a                                        ; $5947: $87
    inc  l                                        ; $5948: $2C
    ld   a, $08                                   ; $5949: $3E $08
    ld   [$D3BE], a                               ; $594B: $EA $BE $D3
    call func_01F_636F                            ; $594E: $CD $6F $63
    ld   hl, $598D                                ; $5951: $21 $8D $59
    call func_01F_7ABD                            ; $5954: $CD $BD $7A
    jp   label_01F_62F3                           ; $5957: $C3 $F3 $62

    call IncrementValueAtBC                            ; $595A: $CD $75 $7A
    cp   $09                                      ; $595D: $FE $09
    jr   z, jr_01F_5967                           ; $595F: $28 $06

jr_01F_5961:
    ld   hl, $597D                                ; $5961: $21 $7D $59
    jp   label_01F_7AEB                           ; $5964: $C3 $EB $7A

jr_01F_5967:
    call func_01F_7AA6                            ; $5967: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $596A: $CA $27 $63

    cp   $02                                      ; $596D: $FE $02
    jr   z, jr_01F_5976                           ; $596F: $28 $05

    ld   a, $01                                   ; $5971: $3E $01
    ld   [bc], a                                  ; $5973: $02
    jr   jr_01F_5961                              ; $5974: $18 $EB

jr_01F_5976:
    xor  a                                        ; $5976: $AF
    ld   [bc], a                                  ; $5977: $02
    ld   a, $60                                   ; $5978: $3E $60
    ldh  [rNR32], a                               ; $597A: $E0 $1C
    ret                                           ; $597C: $C9

    rst  $38                                      ; $597D: $FF
    cp   $FF                                      ; $597E: $FE $FF
    db   $FC                                      ; $5980: $FC
    rst  $38                                      ; $5981: $FF
    ld   hl, sp-$01                               ; $5982: $F8 $FF
    add  sp, $00                                  ; $5984: $E8 $00
    inc  d                                        ; $5986: $14
    nop                                           ; $5987: $00
    ld   [bc], a                                  ; $5988: $02
    nop                                           ; $5989: $00
    inc  b                                        ; $598A: $04
    nop                                           ; $598B: $00
    ld   b, $80                                   ; $598C: $06 $80
    nop                                           ; $598E: $00
    ld   b, b                                     ; $598F: $40
    ret  nz                                       ; $5990: $C0

    add  a                                        ; $5991: $87
    ld   bc, $80                                  ; $5992: $01 $80 $00
    ld   h, b                                     ; $5995: $60
    ret  nz                                       ; $5996: $C0

    add  a                                        ; $5997: $87
    ld   bc, $103E                                ; $5998: $01 $3E $10
    ld   [$D3BE], a                               ; $599B: $EA $BE $D3
    call func_01F_6360                            ; $599E: $CD $60 $63
    ld   hl, $59D5                                ; $59A1: $21 $D5 $59
    call func_01F_7ABD                            ; $59A4: $CD $BD $7A
    jp   label_01F_62F8                           ; $59A7: $C3 $F8 $62

    call IncrementValueAtBC                            ; $59AA: $CD $75 $7A
    cp   $03                                      ; $59AD: $FE $03
    jr   z, jr_01F_59B7                           ; $59AF: $28 $06

jr_01F_59B1:
    ld   hl, $59D1                                ; $59B1: $21 $D1 $59
    jp   label_01F_7AEB                           ; $59B4: $C3 $EB $7A

jr_01F_59B7:
    call func_01F_7AA6                            ; $59B7: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $59BA: $CA $27 $63

    cp   $08                                      ; $59BD: $FE $08
    jr   z, jr_01F_59C6                           ; $59BF: $28 $05

    ld   a, $01                                   ; $59C1: $3E $01
    ld   [bc], a                                  ; $59C3: $02
    jr   jr_01F_59B1                              ; $59C4: $18 $EB

jr_01F_59C6:
    xor  a                                        ; $59C6: $AF
    ld   [bc], a                                  ; $59C7: $02
    ld   hl, $59DB                                ; $59C8: $21 $DB $59
    call func_01F_7ABD                            ; $59CB: $CD $BD $7A
    jp   label_01F_7A85                           ; $59CE: $C3 $85 $7A

    rst  $38                                      ; $59D1: $FF
    and  b                                        ; $59D2: $A0
    nop                                           ; $59D3: $00
    ret  nz                                       ; $59D4: $C0

    add  b                                        ; $59D5: $80
    nop                                           ; $59D6: $00
    jr   nz, jr_01F_5A49                          ; $59D7: $20 $70

    add  b                                        ; $59D9: $80
    ld   [bc], a                                  ; $59DA: $02
    add  b                                        ; $59DB: $80
    nop                                           ; $59DC: $00
    ld   h, b                                     ; $59DD: $60
    ld   [hl], b                                  ; $59DE: $70
    add  b                                        ; $59DF: $80
    ld   [bc], a                                  ; $59E0: $02
    call func_01F_6360                            ; $59E1: $CD $60 $63
    ld   hl, $5A07                                ; $59E4: $21 $07 $5A
    jp   label_01F_62F8                           ; $59E7: $C3 $F8 $62

    call DecrementValueAtDE                            ; $59EA: $CD $71 $7A
    ret  nz                                       ; $59ED: $C0

    call IncrementValueAtBC                            ; $59EE: $CD $75 $7A
    cp   $05                                      ; $59F1: $FE $05
    jp   z, label_01F_632D                        ; $59F3: $CA $2D $63

    ld   hl, $59FF                                ; $59F6: $21 $FF $59
    call GetHandlerAddressInTable                 ; $59F9: $CD $64 $7A
    jp   label_01F_7A85                           ; $59FC: $C3 $85 $7A

    dec  c                                        ; $59FF: $0D
    ld   e, d                                     ; $5A00: $5A
    inc  de                                       ; $5A01: $13
    ld   e, d                                     ; $5A02: $5A
    dec  c                                        ; $5A03: $0D
    ld   e, d                                     ; $5A04: $5A
    rlca                                          ; $5A05: $07
    ld   e, d                                     ; $5A06: $5A
    add  b                                        ; $5A07: $80
    ei                                            ; $5A08: $FB
    jr   nz, jr_01F_5A0B                          ; $5A09: $20 $00

jr_01F_5A0B:
    jp   nz, $8003                                ; $5A0B: $C2 $03 $80

    db   $FD                                      ; $5A0E: $FD
    ld   b, b                                     ; $5A0F: $40
    add  b                                        ; $5A10: $80
    jp   $8004                                    ; $5A11: $C3 $04 $80

    db   $FD                                      ; $5A14: $FD
    ld   h, b                                     ; $5A15: $60
    nop                                           ; $5A16: $00
    call nz, $FA05                                ; $5A17: $C4 $05 $FA
    ld   [hl], c                                  ; $5A1A: $71
    db   $D3                                      ; $5A1B: $D3
    cp   $0F                                      ; $5A1C: $FE $0F
    jp   z, label_01F_6385                        ; $5A1E: $CA $85 $63

    call func_01F_636F                            ; $5A21: $CD $6F $63
    ld   hl, $5A38                                ; $5A24: $21 $38 $5A
    jp   label_01F_62F8                           ; $5A27: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5A2A: $CD $75 $7A
    cp   $02                                      ; $5A2D: $FE $02
    jp   z, label_01F_632D                        ; $5A2F: $CA $2D $63

    ld   hl, $5A3E                                ; $5A32: $21 $3E $5A
    jp   label_01F_7A85                           ; $5A35: $C3 $85 $7A

    add  b                                        ; $5A38: $80
    ei                                            ; $5A39: $FB
    ld   h, b                                     ; $5A3A: $60
    jp   nc, $01C7                                ; $5A3B: $D2 $C7 $01

    add  b                                        ; $5A3E: $80
    ei                                            ; $5A3F: $FB
    ld   b, b                                     ; $5A40: $40
    jp   nc, $02C7                                ; $5A41: $D2 $C7 $02

    ld   a, $02                                   ; $5A44: $3E $02
    ld   [$D3BE], a                               ; $5A46: $EA $BE $D3

jr_01F_5A49:
    call func_01F_6365                            ; $5A49: $CD $65 $63
    ld   hl, $5B5B                                ; $5A4C: $21 $5B $5B
    call func_01F_7ABD                            ; $5A4F: $CD $BD $7A
    jp   label_01F_62F3                           ; $5A52: $C3 $F3 $62

    call DecrementValueAtDE                            ; $5A55: $CD $71 $7A
    ret  nz                                       ; $5A58: $C0

    ld   a, $01                                   ; $5A59: $3E $01
    ld   [de], a                                  ; $5A5B: $12
    call IncrementValueAtBC                            ; $5A5C: $CD $75 $7A
    cp   $71                                      ; $5A5F: $FE $71
    jr   z, jr_01F_5A69                           ; $5A61: $28 $06

    ld   hl, $5A7B                                ; $5A63: $21 $7B $5A
    jp   label_01F_7AEB                           ; $5A66: $C3 $EB $7A

jr_01F_5A69:
    call func_01F_7AA6                            ; $5A69: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5A6C: $CA $27 $63

    ld   a, $60                                   ; $5A6F: $3E $60
    ld   [bc], a                                  ; $5A71: $02
    ld   hl, $5B61                                ; $5A72: $21 $61 $5B
    call func_01F_7ABD                            ; $5A75: $CD $BD $7A
    jp   label_01F_7A85                           ; $5A78: $C3 $85 $7A

    nop                                           ; $5A7B: $00
    or   b                                        ; $5A7C: $B0
    nop                                           ; $5A7D: $00
    or   b                                        ; $5A7E: $B0
    nop                                           ; $5A7F: $00
    or   b                                        ; $5A80: $B0
    nop                                           ; $5A81: $00
    or   b                                        ; $5A82: $B0
    nop                                           ; $5A83: $00
    ld   h, b                                     ; $5A84: $60
    nop                                           ; $5A85: $00
    ld   h, b                                     ; $5A86: $60
    nop                                           ; $5A87: $00
    ld   h, b                                     ; $5A88: $60
    nop                                           ; $5A89: $00
    ld   h, b                                     ; $5A8A: $60
    nop                                           ; $5A8B: $00
    jr   nz, @+$01                                ; $5A8C: $20 $FF

    ldh  [rP1], a                                 ; $5A8E: $E0 $00
    ld   b, b                                     ; $5A90: $40
    rst  $38                                      ; $5A91: $FF
    ret  nz                                       ; $5A92: $C0

    nop                                           ; $5A93: $00
    ld   h, b                                     ; $5A94: $60
    rst  $38                                      ; $5A95: $FF
    and  b                                        ; $5A96: $A0
    nop                                           ; $5A97: $00
    add  b                                        ; $5A98: $80
    rst  $38                                      ; $5A99: $FF
    add  b                                        ; $5A9A: $80
    nop                                           ; $5A9B: $00
    and  b                                        ; $5A9C: $A0
    rst  $38                                      ; $5A9D: $FF
    ld   h, b                                     ; $5A9E: $60
    nop                                           ; $5A9F: $00
    ret  nz                                       ; $5AA0: $C0

    rst  $38                                      ; $5AA1: $FF
    ld   b, b                                     ; $5AA2: $40
    nop                                           ; $5AA3: $00
    add  b                                        ; $5AA4: $80
    rst  $38                                      ; $5AA5: $FF
    adc  b                                        ; $5AA6: $88
    nop                                           ; $5AA7: $00
    add  b                                        ; $5AA8: $80
    rst  $38                                      ; $5AA9: $FF
    adc  b                                        ; $5AAA: $88
    nop                                           ; $5AAB: $00
    sub  b                                        ; $5AAC: $90
    rst  $38                                      ; $5AAD: $FF
    ld   a, b                                     ; $5AAE: $78
    nop                                           ; $5AAF: $00
    and  b                                        ; $5AB0: $A0
    rst  $38                                      ; $5AB1: $FF
    ld   l, b                                     ; $5AB2: $68
    nop                                           ; $5AB3: $00
    or   b                                        ; $5AB4: $B0
    rst  $38                                      ; $5AB5: $FF
    ld   d, [hl]                                  ; $5AB6: $56
    nop                                           ; $5AB7: $00
    ret  nz                                       ; $5AB8: $C0

    rst  $38                                      ; $5AB9: $FF
    ld   b, [hl]                                  ; $5ABA: $46
    nop                                           ; $5ABB: $00
    ret  nz                                       ; $5ABC: $C0

    rst  $38                                      ; $5ABD: $FF
    ld   b, h                                     ; $5ABE: $44
    nop                                           ; $5ABF: $00
    ret  nz                                       ; $5AC0: $C0

    rst  $38                                      ; $5AC1: $FF
    ld   b, h                                     ; $5AC2: $44
    nop                                           ; $5AC3: $00
    ret  nz                                       ; $5AC4: $C0

    rst  $38                                      ; $5AC5: $FF
    ld   b, e                                     ; $5AC6: $43
    nop                                           ; $5AC7: $00
    ret  nz                                       ; $5AC8: $C0

    rst  $38                                      ; $5AC9: $FF
    ld   b, e                                     ; $5ACA: $43
    nop                                           ; $5ACB: $00
    ret  nz                                       ; $5ACC: $C0

    rst  $38                                      ; $5ACD: $FF
    ld   b, d                                     ; $5ACE: $42
    nop                                           ; $5ACF: $00
    and  b                                        ; $5AD0: $A0
    rst  $38                                      ; $5AD1: $FF
    ld   h, d                                     ; $5AD2: $62
    nop                                           ; $5AD3: $00
    add  b                                        ; $5AD4: $80
    rst  $38                                      ; $5AD5: $FF
    add  d                                        ; $5AD6: $82
    nop                                           ; $5AD7: $00
    add  b                                        ; $5AD8: $80
    rst  $38                                      ; $5AD9: $FF
    add  d                                        ; $5ADA: $82
    nop                                           ; $5ADB: $00
    add  b                                        ; $5ADC: $80
    rst  $38                                      ; $5ADD: $FF
    add  h                                        ; $5ADE: $84
    nop                                           ; $5ADF: $00
    add  b                                        ; $5AE0: $80
    rst  $38                                      ; $5AE1: $FF
    add  h                                        ; $5AE2: $84
    nop                                           ; $5AE3: $00
    add  b                                        ; $5AE4: $80
    rst  $38                                      ; $5AE5: $FF
    add  h                                        ; $5AE6: $84
    nop                                           ; $5AE7: $00
    add  b                                        ; $5AE8: $80
    rst  $38                                      ; $5AE9: $FF
    add  h                                        ; $5AEA: $84
    nop                                           ; $5AEB: $00
    add  b                                        ; $5AEC: $80
    rst  $38                                      ; $5AED: $FF
    or   b                                        ; $5AEE: $B0
    nop                                           ; $5AEF: $00
    add  b                                        ; $5AF0: $80
    rst  $38                                      ; $5AF1: $FF
    or   b                                        ; $5AF2: $B0
    nop                                           ; $5AF3: $00
    add  b                                        ; $5AF4: $80
    rst  $38                                      ; $5AF5: $FF
    add  b                                        ; $5AF6: $80
    nop                                           ; $5AF7: $00
    add  b                                        ; $5AF8: $80
    rst  $38                                      ; $5AF9: $FF
    add  b                                        ; $5AFA: $80
    nop                                           ; $5AFB: $00
    add  b                                        ; $5AFC: $80
    rst  $38                                      ; $5AFD: $FF
    add  b                                        ; $5AFE: $80

jr_01F_5AFF:
    nop                                           ; $5AFF: $00
    add  b                                        ; $5B00: $80
    rst  $38                                      ; $5B01: $FF
    add  b                                        ; $5B02: $80
    nop                                           ; $5B03: $00
    add  b                                        ; $5B04: $80
    rst  $38                                      ; $5B05: $FF
    ld   l, b                                     ; $5B06: $68
    nop                                           ; $5B07: $00
    add  b                                        ; $5B08: $80
    rst  $38                                      ; $5B09: $FF
    ld   l, b                                     ; $5B0A: $68
    nop                                           ; $5B0B: $00
    add  b                                        ; $5B0C: $80
    rst  $38                                      ; $5B0D: $FF
    ld   l, b                                     ; $5B0E: $68
    nop                                           ; $5B0F: $00
    add  b                                        ; $5B10: $80
    rst  $38                                      ; $5B11: $FF
    ld   l, b                                     ; $5B12: $68
    nop                                           ; $5B13: $00
    add  b                                        ; $5B14: $80
    rst  $38                                      ; $5B15: $FF
    ld   a, b                                     ; $5B16: $78
    nop                                           ; $5B17: $00
    add  b                                        ; $5B18: $80
    rst  $38                                      ; $5B19: $FF
    ld   a, b                                     ; $5B1A: $78
    nop                                           ; $5B1B: $00
    and  b                                        ; $5B1C: $A0
    rst  $38                                      ; $5B1D: $FF
    ld   b, b                                     ; $5B1E: $40
    nop                                           ; $5B1F: $00
    and  b                                        ; $5B20: $A0
    rst  $38                                      ; $5B21: $FF
    ld   b, b                                     ; $5B22: $40
    nop                                           ; $5B23: $00
    and  b                                        ; $5B24: $A0
    rst  $38                                      ; $5B25: $FF
    ld   b, b                                     ; $5B26: $40
    nop                                           ; $5B27: $00
    and  b                                        ; $5B28: $A0
    rst  $38                                      ; $5B29: $FF
    ld   b, b                                     ; $5B2A: $40
    nop                                           ; $5B2B: $00
    and  b                                        ; $5B2C: $A0
    rst  $38                                      ; $5B2D: $FF
    ld   b, b                                     ; $5B2E: $40
    nop                                           ; $5B2F: $00
    and  b                                        ; $5B30: $A0
    rst  $38                                      ; $5B31: $FF
    ld   b, b                                     ; $5B32: $40
    nop                                           ; $5B33: $00
    and  b                                        ; $5B34: $A0
    rst  $38                                      ; $5B35: $FF
    ld   b, b                                     ; $5B36: $40
    nop                                           ; $5B37: $00
    and  b                                        ; $5B38: $A0
    rst  $38                                      ; $5B39: $FF
    ld   b, b                                     ; $5B3A: $40
    nop                                           ; $5B3B: $00
    and  b                                        ; $5B3C: $A0
    rst  $38                                      ; $5B3D: $FF
    ld   b, b                                     ; $5B3E: $40
    nop                                           ; $5B3F: $00
    and  b                                        ; $5B40: $A0
    rst  $38                                      ; $5B41: $FF
    ld   b, b                                     ; $5B42: $40
    nop                                           ; $5B43: $00
    and  b                                        ; $5B44: $A0
    rst  $38                                      ; $5B45: $FF
    nop                                           ; $5B46: $00
    nop                                           ; $5B47: $00
    and  b                                        ; $5B48: $A0
    rst  $38                                      ; $5B49: $FF
    nop                                           ; $5B4A: $00
    nop                                           ; $5B4B: $00
    add  b                                        ; $5B4C: $80
    cp   $80                                      ; $5B4D: $FE $80
    nop                                           ; $5B4F: $00
    add  b                                        ; $5B50: $80
    cp   $80                                      ; $5B51: $FE $80
    nop                                           ; $5B53: $00
    add  b                                        ; $5B54: $80
    cp   $80                                      ; $5B55: $FE $80
    nop                                           ; $5B57: $00
    add  b                                        ; $5B58: $80
    cp   $80                                      ; $5B59: $FE $80
    add  b                                        ; $5B5B: $80
    nop                                           ; $5B5C: $00
    jr   nz, jr_01F_5AFF                          ; $5B5D: $20 $A0

    add  c                                        ; $5B5F: $81
    ld   [bc], a                                  ; $5B60: $02
    add  b                                        ; $5B61: $80
    nop                                           ; $5B62: $00
    ld   h, b                                     ; $5B63: $60
    ld   [hl+], a                                 ; $5B64: $22
    add  [hl]                                     ; $5B65: $86
    ld   [bc], a                                  ; $5B66: $02
    ld   a, $0C                                   ; $5B67: $3E $0C
    ld   [$D3BE], a                               ; $5B69: $EA $BE $D3
    call func_01F_636A                            ; $5B6C: $CD $6A $63
    ld   hl, $5BB2                                ; $5B6F: $21 $B2 $5B
    call func_01F_7ABD                            ; $5B72: $CD $BD $7A
    jp   label_01F_62F8                           ; $5B75: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5B78: $CD $75 $7A
    cp   $03                                      ; $5B7B: $FE $03
    jr   z, jr_01F_5B85                           ; $5B7D: $28 $06

    ld   hl, $5BAE                                ; $5B7F: $21 $AE $5B
    jp   label_01F_7AEB                           ; $5B82: $C3 $EB $7A

jr_01F_5B85:
    call func_01F_7AA6                            ; $5B85: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5B88: $CA $27 $63

    cp   $06                                      ; $5B8B: $FE $06
    jp   z, label_01F_5B9E                        ; $5B8D: $CA $9E $5B

    cp   $03                                      ; $5B90: $FE $03
    jp   z, label_01F_5BA9                        ; $5B92: $CA $A9 $5B

    ld   a, $01                                   ; $5B95: $3E $01
    ld   [bc], a                                  ; $5B97: $02
    ld   hl, $5BAE                                ; $5B98: $21 $AE $5B
    jp   label_01F_7AEB                           ; $5B9B: $C3 $EB $7A

label_01F_5B9E:
    ld   hl, $5BB8                                ; $5B9E: $21 $B8 $5B

jr_01F_5BA1:
    call func_01F_7ABD                            ; $5BA1: $CD $BD $7A
    xor  a                                        ; $5BA4: $AF
    ld   [bc], a                                  ; $5BA5: $02
    jp   label_01F_7A85                           ; $5BA6: $C3 $85 $7A

label_01F_5BA9:
    ld   hl, $5BBE                                ; $5BA9: $21 $BE $5B
    jr   jr_01F_5BA1                              ; $5BAC: $18 $F3

    nop                                           ; $5BAE: $00
    ldh  [rIE], a                                 ; $5BAF: $E0 $FF
    and  b                                        ; $5BB1: $A0
    add  b                                        ; $5BB2: $80
    nop                                           ; $5BB3: $00
    jr   nz, jr_01F_5BB6                          ; $5BB4: $20 $00

jr_01F_5BB6:
    add  h                                        ; $5BB6: $84
    ld   bc, $80                                  ; $5BB7: $01 $80 $00
    ld   b, b                                     ; $5BBA: $40
    add  b                                        ; $5BBB: $80
    add  l                                        ; $5BBC: $85
    ld   bc, $80                                  ; $5BBD: $01 $80 $00
    ld   h, b                                     ; $5BC0: $60
    add  b                                        ; $5BC1: $80
    add  l                                        ; $5BC2: $85
    ld   bc, $123E                                ; $5BC3: $01 $3E $12
    ld   [$D3BE], a                               ; $5BC6: $EA $BE $D3
    call func_01F_636A                            ; $5BC9: $CD $6A $63
    ld   hl, $5C00                                ; $5BCC: $21 $00 $5C
    call func_01F_7ABD                            ; $5BCF: $CD $BD $7A
    jp   label_01F_62F8                           ; $5BD2: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5BD5: $CD $75 $7A
    cp   $03                                      ; $5BD8: $FE $03
    jr   z, jr_01F_5BE2                           ; $5BDA: $28 $06

jr_01F_5BDC:
    ld   hl, $5BFC                                ; $5BDC: $21 $FC $5B
    jp   label_01F_7AEB                           ; $5BDF: $C3 $EB $7A

jr_01F_5BE2:
    call func_01F_7AA6                            ; $5BE2: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5BE5: $CA $27 $63

    cp   $06                                      ; $5BE8: $FE $06
    jr   z, jr_01F_5BF1                           ; $5BEA: $28 $05

    ld   a, $01                                   ; $5BEC: $3E $01
    ld   [bc], a                                  ; $5BEE: $02
    jr   jr_01F_5BDC                              ; $5BEF: $18 $EB

jr_01F_5BF1:
    xor  a                                        ; $5BF1: $AF
    ld   [bc], a                                  ; $5BF2: $02
    ld   hl, $5C06                                ; $5BF3: $21 $06 $5C
    call func_01F_7ABD                            ; $5BF6: $CD $BD $7A
    jp   label_01F_7A85                           ; $5BF9: $C3 $85 $7A

    ld   bc, $FE00                                ; $5BFC: $01 $00 $FE
    ret  nz                                       ; $5BFF: $C0

    add  b                                        ; $5C00: $80
    nop                                           ; $5C01: $00
    jr   nz, @+$42                                ; $5C02: $20 $40

    add  [hl]                                     ; $5C04: $86
    ld   [bc], a                                  ; $5C05: $02
    add  b                                        ; $5C06: $80
    nop                                           ; $5C07: $00
    ld   h, b                                     ; $5C08: $60
    ret  nz                                       ; $5C09: $C0

    add  h                                        ; $5C0A: $84
    ld   [bc], a                                  ; $5C0B: $02
    ld   a, $04                                   ; $5C0C: $3E $04
    ld   [$D3BE], a                               ; $5C0E: $EA $BE $D3
    call func_01F_6374                            ; $5C11: $CD $74 $63
    ld   hl, $5C6E                                ; $5C14: $21 $6E $5C
    call func_01F_7ABD                            ; $5C17: $CD $BD $7A
    jp   label_01F_62F8                           ; $5C1A: $C3 $F8 $62

    call DecrementValueAtDE                            ; $5C1D: $CD $71 $7A
    ret  nz                                       ; $5C20: $C0

    ld   a, $01                                   ; $5C21: $3E $01
    ld   [de], a                                  ; $5C23: $12
    call IncrementValueAtBC                            ; $5C24: $CD $75 $7A
    cp   $06                                      ; $5C27: $FE $06
    jr   z, jr_01F_5C4E                           ; $5C29: $28 $23

    cp   $07                                      ; $5C2B: $FE $07
    jr   z, jr_01F_5C35                           ; $5C2D: $28 $06

    ld   hl, $5C64                                ; $5C2F: $21 $64 $5C
    jp   label_01F_7AEB                           ; $5C32: $C3 $EB $7A

jr_01F_5C35:
    call func_01F_7AA6                            ; $5C35: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5C38: $CA $27 $63

    cp   $02                                      ; $5C3B: $FE $02
    jr   z, jr_01F_5C5F                           ; $5C3D: $28 $20

    cp   $01                                      ; $5C3F: $FE $01
    jr   z, jr_01F_5C5F                           ; $5C41: $28 $1C

    ld   hl, $5C74                                ; $5C43: $21 $74 $5C

jr_01F_5C46:
    xor  a                                        ; $5C46: $AF
    ld   [bc], a                                  ; $5C47: $02
    call func_01F_7ABD                            ; $5C48: $CD $BD $7A
    jp   label_01F_7A85                           ; $5C4B: $C3 $85 $7A

jr_01F_5C4E:
    ld   a, [$D3BE]                               ; $5C4E: $FA $BE $D3
    cp   $01                                      ; $5C51: $FE $01
    jr   z, jr_01F_5C35                           ; $5C53: $28 $E0

    cp   $04                                      ; $5C55: $FE $04
    ret  z                                        ; $5C57: $C8

    ld   a, $06                                   ; $5C58: $3E $06
    ld   [de], a                                  ; $5C5A: $12
    xor  a                                        ; $5C5B: $AF
    ldh  [rNR32], a                               ; $5C5C: $E0 $1C
    ret                                           ; $5C5E: $C9

jr_01F_5C5F:
    ld   hl, $5C7A                                ; $5C5F: $21 $7A $5C
    jr   jr_01F_5C46                              ; $5C62: $18 $E2

    ld   [bc], a                                  ; $5C64: $02
    ld   b, b                                     ; $5C65: $40
    ld   bc, $FF40                                ; $5C66: $01 $40 $FF
    ld   a, [c]                                   ; $5C69: $F2
    nop                                           ; $5C6A: $00
    ld   c, $FF                                   ; $5C6B: $0E $FF
    ld   a, [c]                                   ; $5C6D: $F2
    add  b                                        ; $5C6E: $80
    nop                                           ; $5C6F: $00
    jr   nz, jr_01F_5C88                          ; $5C70: $20 $16

    add  h                                        ; $5C72: $84
    ld   bc, $80                                  ; $5C73: $01 $80 $00
    jr   nz, @+$28                                ; $5C76: $20 $26

    add  h                                        ; $5C78: $84
    ld   bc, $80                                  ; $5C79: $01 $80 $00
    jr   nz, @+$0A                                ; $5C7C: $20 $08

    add  h                                        ; $5C7E: $84
    ld   bc, $71FA                                ; $5C7F: $01 $FA $71
    db   $D3                                      ; $5C82: $D3
    cp   $14                                      ; $5C83: $FE $14
    jp   z, label_01F_6385                        ; $5C85: $CA $85 $63

jr_01F_5C88:
    ld   a, $04                                   ; $5C88: $3E $04
    ld   [$D3BE], a                               ; $5C8A: $EA $BE $D3
    call func_01F_636A                            ; $5C8D: $CD $6A $63
    ld   hl, $5CAA                                ; $5C90: $21 $AA $5C
    call func_01F_7ABD                            ; $5C93: $CD $BD $7A
    jp   label_01F_62F8                           ; $5C96: $C3 $F8 $62

    call func_01F_7AA6                            ; $5C99: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5C9C: $CA $27 $63

    ld   a, $01                                   ; $5C9F: $3E $01
    ld   [bc], a                                  ; $5CA1: $02
    ld   hl, $5CA8                                ; $5CA2: $21 $A8 $5C
    jp   label_01F_7AEB                           ; $5CA5: $C3 $EB $7A

    nop                                           ; $5CA8: $00
    ld   c, $80                                   ; $5CA9: $0E $80
    nop                                           ; $5CAB: $00
    ld   b, b                                     ; $5CAC: $40
    add  b                                        ; $5CAD: $80
    add  a                                        ; $5CAE: $87
    ld   bc, $79CD                                ; $5CAF: $01 $CD $79
    ld   h, e                                     ; $5CB2: $63
    ld   hl, $5CD8                                ; $5CB3: $21 $D8 $5C
    jp   label_01F_62F3                           ; $5CB6: $C3 $F3 $62

    call DecrementValueAtDE                            ; $5CB9: $CD $71 $7A
    ret  nz                                       ; $5CBC: $C0

    call IncrementValueAtBC                            ; $5CBD: $CD $75 $7A
    cp   $06                                      ; $5CC0: $FE $06
    jp   z, label_01F_632D                        ; $5CC2: $CA $2D $63

    ld   hl, $5CCE                                ; $5CC5: $21 $CE $5C
    call GetHandlerAddressInTable                 ; $5CC8: $CD $64 $7A
    jp   label_01F_7A85                           ; $5CCB: $C3 $85 $7A

    sbc  $5C                                      ; $5CCE: $DE $5C
    db   $E4                                      ; $5CD0: $E4
    ld   e, h                                     ; $5CD1: $5C
    ld   [$F05C], a                               ; $5CD2: $EA $5C $F0
    ld   e, h                                     ; $5CD5: $5C
    or   $5C                                      ; $5CD6: $F6 $5C
    add  b                                        ; $5CD8: $80
    ret  nc                                       ; $5CD9: $D0

    jr   nz, @+$42                                ; $5CDA: $20 $40

    rst  $00                                      ; $5CDC: $C7
    inc  d                                        ; $5CDD: $14
    add  b                                        ; $5CDE: $80
    ret  nz                                       ; $5CDF: $C0

    jr   nz, @+$66                                ; $5CE0: $20 $64

    rst  $00                                      ; $5CE2: $C7
    inc  c                                        ; $5CE3: $0C
    add  b                                        ; $5CE4: $80
    sub  b                                        ; $5CE5: $90
    ld   b, b                                     ; $5CE6: $40
    ld   a, b                                     ; $5CE7: $78
    rst  $00                                      ; $5CE8: $C7
    ld   b, b                                     ; $5CE9: $40
    add  b                                        ; $5CEA: $80
    ret  nz                                       ; $5CEB: $C0

    jr   nz, @+$56                                ; $5CEC: $20 $54

    rst  $00                                      ; $5CEE: $C7
    ld   b, $80                                   ; $5CEF: $06 $80
    ret  nz                                       ; $5CF1: $C0

    ld   b, b                                     ; $5CF2: $40
    ld   b, [hl]                                  ; $5CF3: $46
    rst  $00                                      ; $5CF4: $C7
    inc  c                                        ; $5CF5: $0C
    add  b                                        ; $5CF6: $80

jr_01F_5CF7:
    and  b                                        ; $5CF7: $A0
    jr   nz, jr_01F_5D58                          ; $5CF8: $20 $5E

    rst  $00                                      ; $5CFA: $C7
    jr   nz, jr_01F_5CF7                          ; $5CFB: $20 $FA

    ld   [hl], c                                  ; $5CFD: $71
    db   $D3                                      ; $5CFE: $D3
    cp   $03                                      ; $5CFF: $FE $03
    jp   z, label_01F_6385                        ; $5D01: $CA $85 $63

    cp   $07                                      ; $5D04: $FE $07
    jp   z, label_01F_6385                        ; $5D06: $CA $85 $63

    ld   a, $02                                   ; $5D09: $3E $02
    ld   [$D3BE], a                               ; $5D0B: $EA $BE $D3
    call func_01F_6365                            ; $5D0E: $CD $65 $63
    ld   hl, $5D68                                ; $5D11: $21 $68 $5D
    call func_01F_7ABD                            ; $5D14: $CD $BD $7A
    jp   label_01F_62F8                           ; $5D17: $C3 $F8 $62

    call DecrementValueAtDE                            ; $5D1A: $CD $71 $7A
    ret  nz                                       ; $5D1D: $C0

    ld   a, $01                                   ; $5D1E: $3E $01
    ld   [de], a                                  ; $5D20: $12
    ld   a, [bc]                                  ; $5D21: $0A
    cp   $07                                      ; $5D22: $FE $07
    jr   nc, jr_01F_5D33                          ; $5D24: $30 $0D

jr_01F_5D26:
    call IncrementValueAtBC                            ; $5D26: $CD $75 $7A
    cp   $10                                      ; $5D29: $FE $10
    jr   z, jr_01F_5D38                           ; $5D2B: $28 $0B

    ld   hl, $5D4A                                ; $5D2D: $21 $4A $5D
    jp   label_01F_7AEB                           ; $5D30: $C3 $EB $7A

jr_01F_5D33:
    ld   a, $03                                   ; $5D33: $3E $03
    ld   [de], a                                  ; $5D35: $12
    jr   jr_01F_5D26                              ; $5D36: $18 $EE

jr_01F_5D38:
    call func_01F_7AA6                            ; $5D38: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5D3B: $CA $27 $63

    ld   a, $03                                   ; $5D3E: $3E $03
    ld   [bc], a                                  ; $5D40: $02
    ld   hl, $5D6E                                ; $5D41: $21 $6E $5D
    call func_01F_7ABD                            ; $5D44: $CD $BD $7A
    jp   label_01F_7A85                           ; $5D47: $C3 $85 $7A

    ld   [bc], a                                  ; $5D4A: $02
    nop                                           ; $5D4B: $00
    ld   [bc], a                                  ; $5D4C: $02
    nop                                           ; $5D4D: $00
    ld   bc, $00                                  ; $5D4E: $01 $00 $00
    ret  nz                                       ; $5D51: $C0

    rst  $38                                      ; $5D52: $FF
    ld   b, b                                     ; $5D53: $40
    nop                                           ; $5D54: $00
    ret  nz                                       ; $5D55: $C0

    rst  $38                                      ; $5D56: $FF
    ld   b, b                                     ; $5D57: $40

jr_01F_5D58:
    rst  $38                                      ; $5D58: $FF
    nop                                           ; $5D59: $00
    rst  $38                                      ; $5D5A: $FF
    nop                                           ; $5D5B: $00
    cp   $00                                      ; $5D5C: $FE $00
    rst  $38                                      ; $5D5E: $FF
    ret  nz                                       ; $5D5F: $C0

    rst  $38                                      ; $5D60: $FF
    ret  nz                                       ; $5D61: $C0

    rst  $38                                      ; $5D62: $FF
    ret  nz                                       ; $5D63: $C0

    rst  $38                                      ; $5D64: $FF
    ret  nz                                       ; $5D65: $C0

    rst  $38                                      ; $5D66: $FF
    ret  nz                                       ; $5D67: $C0

    add  b                                        ; $5D68: $80
    nop                                           ; $5D69: $00
    jr   nz, jr_01F_5DCC                          ; $5D6A: $20 $60

    add  b                                        ; $5D6C: $80
    ld   [bc], a                                  ; $5D6D: $02
    add  b                                        ; $5D6E: $80
    nop                                           ; $5D6F: $00
    ld   h, b                                     ; $5D70: $60
    ld   h, b                                     ; $5D71: $60
    add  l                                        ; $5D72: $85
    ld   [bc], a                                  ; $5D73: $02
    ld   [bc], a                                  ; $5D74: $02
    ld   b, [hl]                                  ; $5D75: $46
    adc  d                                        ; $5D76: $8A
    adc  $FC                                      ; $5D77: $CE $FC
    sub  [hl]                                     ; $5D79: $96
    inc  b                                        ; $5D7A: $04
    inc  b                                        ; $5D7B: $04
    ld   [bc], a                                  ; $5D7C: $02
    ld   b, [hl]                                  ; $5D7D: $46
    adc  d                                        ; $5D7E: $8A
    adc  $FC                                      ; $5D7F: $CE $FC
    sub  [hl]                                     ; $5D81: $96
    inc  b                                        ; $5D82: $04
    inc  b                                        ; $5D83: $04
    ld   hl, $D34F                                ; $5D84: $21 $4F $D3
    set  7, [hl]                                  ; $5D87: $CB $FE
    ld   a, $03                                   ; $5D89: $3E $03
    ld   [$D3BE], a                               ; $5D8B: $EA $BE $D3
    ld   hl, $5EB1                                ; $5D8E: $21 $B1 $5E
    call func_01F_7A8B                            ; $5D91: $CD $8B $7A
    call func_01F_636A                            ; $5D94: $CD $6A $63
    ld   hl, $5D74                                ; $5D97: $21 $74 $5D
    call $635A                                    ; $5D9A: $CD $5A $63
    ld   hl, $5EC5                                ; $5D9D: $21 $C5 $5E
    call func_01F_7ABD                            ; $5DA0: $CD $BD $7A
    jp   label_01F_62F3                           ; $5DA3: $C3 $F3 $62

    call IncrementValueAtBC                            ; $5DA6: $CD $75 $7A
    cp   $55                                      ; $5DA9: $FE $55
    jr   z, jr_01F_5DCE                           ; $5DAB: $28 $21

    cp   $03                                      ; $5DAD: $FE $03
    jr   z, jr_01F_5DBB                           ; $5DAF: $28 $0A

    cp   $07                                      ; $5DB1: $FE $07
    jr   z, jr_01F_5DC4                           ; $5DB3: $28 $0F

jr_01F_5DB5:
    ld   hl, $5E09                                ; $5DB5: $21 $09 $5E
    jp   label_01F_7AEB                           ; $5DB8: $C3 $EB $7A

jr_01F_5DBB:
    ld   a, $40                                   ; $5DBB: $3E $40

jr_01F_5DBD:
    ldh  [rNR32], a                               ; $5DBD: $E0 $1C
    ld   bc, $D396                                ; $5DBF: $01 $96 $D3
    jr   jr_01F_5DB5                              ; $5DC2: $18 $F1

jr_01F_5DC4:
    ld   hl, $5EB6                                ; $5DC4: $21 $B6 $5E
    call func_01F_7A8B                            ; $5DC7: $CD $8B $7A
    ld   a, $20                                   ; $5DCA: $3E $20

jr_01F_5DCC:
    jr   jr_01F_5DBD                              ; $5DCC: $18 $EF

jr_01F_5DCE:
    call func_01F_7AA6                            ; $5DCE: $CD $A6 $7A
    jr   z, jr_01F_5DFB                           ; $5DD1: $28 $28

    cp   $01                                      ; $5DD3: $FE $01
    jr   z, jr_01F_5DE9                           ; $5DD5: $28 $12

    ld   a, $40                                   ; $5DD7: $3E $40
    ld   [bc], a                                  ; $5DD9: $02
    ld   hl, $5EBB                                ; $5DDA: $21 $BB $5E
    call func_01F_7A8B                            ; $5DDD: $CD $8B $7A
    ld   hl, $5ECB                                ; $5DE0: $21 $CB $5E
    call func_01F_7ABD                            ; $5DE3: $CD $BD $7A
    jp   label_01F_7A85                           ; $5DE6: $C3 $85 $7A

jr_01F_5DE9:
    ld   a, $40                                   ; $5DE9: $3E $40
    ld   [bc], a                                  ; $5DEB: $02
    ld   hl, $5EC0                                ; $5DEC: $21 $C0 $5E
    call func_01F_7A8B                            ; $5DEF: $CD $8B $7A
    ld   hl, $5ED1                                ; $5DF2: $21 $D1 $5E
    call func_01F_7ABD                            ; $5DF5: $CD $BD $7A
    jp   label_01F_7A85                           ; $5DF8: $C3 $85 $7A

jr_01F_5DFB:
    ld   hl, $D34F                                ; $5DFB: $21 $4F $D3
    res  7, [hl]                                  ; $5DFE: $CB $BE
    ld   hl, $7A20                                ; $5E00: $21 $20 $7A
    call func_01F_7A8B                            ; $5E03: $CD $8B $7A
    jp   label_01F_6327                           ; $5E06: $C3 $27 $63

    nop                                           ; $5E09: $00
    ld   b, b                                     ; $5E0A: $40
    rst  $38                                      ; $5E0B: $FF
    ldh  [rP1], a                                 ; $5E0C: $E0 $00
    ld   b, b                                     ; $5E0E: $40
    rst  $38                                      ; $5E0F: $FF
    ldh  [rP1], a                                 ; $5E10: $E0 $00
    jr   nc, @+$01                                ; $5E12: $30 $FF

    add  sp, $00                                  ; $5E14: $E8 $00
    jr   nc, @+$01                                ; $5E16: $30 $FF

    add  sp, $00                                  ; $5E18: $E8 $00
    jr   nz, @+$01                                ; $5E1A: $20 $FF

    ldh  a, [rP1]                                 ; $5E1C: $F0 $00
    jr   nz, @+$01                                ; $5E1E: $20 $FF

    ldh  a, [rP1]                                 ; $5E20: $F0 $00
    db   $10                                      ; $5E22: $10
    rst  $38                                      ; $5E23: $FF
    ld   hl, sp+$00                               ; $5E24: $F8 $00
    db   $10                                      ; $5E26: $10
    rst  $38                                      ; $5E27: $FF
    ld   hl, sp+$00                               ; $5E28: $F8 $00
    ld   [$F9FF], sp                              ; $5E2A: $08 $FF $F9
    nop                                           ; $5E2D: $00
    ld   [$F9FF], sp                              ; $5E2E: $08 $FF $F9
    nop                                           ; $5E31: $00
    ld   [$F9FF], sp                              ; $5E32: $08 $FF $F9
    nop                                           ; $5E35: $00
    ld   [$F9FF], sp                              ; $5E36: $08 $FF $F9
    nop                                           ; $5E39: $00
    ld   [$F9FF], sp                              ; $5E3A: $08 $FF $F9
    nop                                           ; $5E3D: $00
    ld   [$F9FF], sp                              ; $5E3E: $08 $FF $F9
    nop                                           ; $5E41: $00
    ld   [$F8FF], sp                              ; $5E42: $08 $FF $F8
    nop                                           ; $5E45: $00
    ld   [$F8FF], sp                              ; $5E46: $08 $FF $F8
    nop                                           ; $5E49: $00
    ld   [$F8FF], sp                              ; $5E4A: $08 $FF $F8
    nop                                           ; $5E4D: $00
    ld   [$F8FF], sp                              ; $5E4E: $08 $FF $F8
    nop                                           ; $5E51: $00
    ld   [$F7FF], sp                              ; $5E52: $08 $FF $F7
    nop                                           ; $5E55: $00
    ld   [$F7FF], sp                              ; $5E56: $08 $FF $F7
    nop                                           ; $5E59: $00
    ld   [$F7FF], sp                              ; $5E5A: $08 $FF $F7

jr_01F_5E5D:
    nop                                           ; $5E5D: $00
    ld   [$F7FF], sp                              ; $5E5E: $08 $FF $F7
    nop                                           ; $5E61: $00
    ld   [$F7FF], sp                              ; $5E62: $08 $FF $F7
    nop                                           ; $5E65: $00
    ld   [$F7FF], sp                              ; $5E66: $08 $FF $F7
    nop                                           ; $5E69: $00
    db   $10                                      ; $5E6A: $10
    rst  $38                                      ; $5E6B: $FF
    xor  $00                                      ; $5E6C: $EE $00
    db   $10                                      ; $5E6E: $10
    rst  $38                                      ; $5E6F: $FF
    xor  $00                                      ; $5E70: $EE $00
    db   $10                                      ; $5E72: $10
    rst  $38                                      ; $5E73: $FF
    xor  $00                                      ; $5E74: $EE $00
    db   $10                                      ; $5E76: $10
    rst  $38                                      ; $5E77: $FF
    xor  $00                                      ; $5E78: $EE $00
    db   $10                                      ; $5E7A: $10
    rst  $38                                      ; $5E7B: $FF
    xor  $00                                      ; $5E7C: $EE $00
    db   $10                                      ; $5E7E: $10
    rst  $38                                      ; $5E7F: $FF
    xor  $00                                      ; $5E80: $EE $00
    db   $10                                      ; $5E82: $10
    rst  $38                                      ; $5E83: $FF
    xor  $00                                      ; $5E84: $EE $00
    db   $10                                      ; $5E86: $10
    rst  $38                                      ; $5E87: $FF
    xor  $00                                      ; $5E88: $EE $00
    db   $10                                      ; $5E8A: $10
    rst  $38                                      ; $5E8B: $FF
    xor  $00                                      ; $5E8C: $EE $00
    db   $10                                      ; $5E8E: $10
    rst  $38                                      ; $5E8F: $FF
    xor  $00                                      ; $5E90: $EE $00
    db   $10                                      ; $5E92: $10
    rst  $38                                      ; $5E93: $FF
    db   $EC                                      ; $5E94: $EC
    nop                                           ; $5E95: $00
    db   $10                                      ; $5E96: $10
    rst  $38                                      ; $5E97: $FF
    db   $EC                                      ; $5E98: $EC
    nop                                           ; $5E99: $00
    db   $10                                      ; $5E9A: $10
    rst  $38                                      ; $5E9B: $FF
    db   $EC                                      ; $5E9C: $EC
    nop                                           ; $5E9D: $00
    db   $10                                      ; $5E9E: $10
    rst  $38                                      ; $5E9F: $FF
    db   $EC                                      ; $5EA0: $EC
    nop                                           ; $5EA1: $00
    db   $10                                      ; $5EA2: $10
    rst  $38                                      ; $5EA3: $FF
    db   $EC                                      ; $5EA4: $EC
    nop                                           ; $5EA5: $00
    db   $10                                      ; $5EA6: $10
    rst  $38                                      ; $5EA7: $FF
    db   $EC                                      ; $5EA8: $EC
    nop                                           ; $5EA9: $00
    db   $10                                      ; $5EAA: $10
    rst  $38                                      ; $5EAB: $FF
    db   $EC                                      ; $5EAC: $EC
    nop                                           ; $5EAD: $00
    db   $10                                      ; $5EAE: $10
    rst  $38                                      ; $5EAF: $FF
    db   $EC                                      ; $5EB0: $EC
    nop                                           ; $5EB1: $00
    add  hl, de                                   ; $5EB2: $19
    nop                                           ; $5EB3: $00
    add  b                                        ; $5EB4: $80
    ld   bc, $A000                                ; $5EB5: $01 $00 $A0
    nop                                           ; $5EB8: $00
    add  b                                        ; $5EB9: $80
    ld   bc, $5000                                ; $5EBA: $01 $00 $50
    nop                                           ; $5EBD: $00
    add  b                                        ; $5EBE: $80
    ld   bc, $2000                                ; $5EBF: $01 $00 $20
    nop                                           ; $5EC2: $00
    add  b                                        ; $5EC3: $80
    ld   bc, $80                                  ; $5EC4: $01 $80 $00
    ld   h, b                                     ; $5EC7: $60
    and  b                                        ; $5EC8: $A0
    add  [hl]                                     ; $5EC9: $86
    ld   [bc], a                                  ; $5ECA: $02
    add  b                                        ; $5ECB: $80
    nop                                           ; $5ECC: $00
    ld   b, b                                     ; $5ECD: $40
    jr   nz, @-$77                                ; $5ECE: $20 $87

    ld   [bc], a                                  ; $5ED0: $02
    add  b                                        ; $5ED1: $80
    nop                                           ; $5ED2: $00
    ld   h, b                                     ; $5ED3: $60
    jr   nz, jr_01F_5E5D                          ; $5ED4: $20 $87

    ld   [bc], a                                  ; $5ED6: $02
    ld   a, $0E                                   ; $5ED7: $3E $0E
    ld   [$D3BE], a                               ; $5ED9: $EA $BE $D3
    call func_01F_6365                            ; $5EDC: $CD $65 $63
    ld   hl, $5F13                                ; $5EDF: $21 $13 $5F
    call func_01F_7ABD                            ; $5EE2: $CD $BD $7A
    jp   label_01F_62F3                           ; $5EE5: $C3 $F3 $62

    call IncrementValueAtBC                            ; $5EE8: $CD $75 $7A
    cp   $03                                      ; $5EEB: $FE $03
    jr   z, jr_01F_5EF5                           ; $5EED: $28 $06

jr_01F_5EEF:
    ld   hl, $5F0F                                ; $5EEF: $21 $0F $5F
    jp   label_01F_7AEB                           ; $5EF2: $C3 $EB $7A

jr_01F_5EF5:
    call func_01F_7AA6                            ; $5EF5: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5EF8: $CA $27 $63

    cp   $07                                      ; $5EFB: $FE $07
    jr   z, jr_01F_5F04                           ; $5EFD: $28 $05

    ld   a, $01                                   ; $5EFF: $3E $01
    ld   [bc], a                                  ; $5F01: $02
    jr   jr_01F_5EEF                              ; $5F02: $18 $EB

jr_01F_5F04:
    xor  a                                        ; $5F04: $AF
    ld   [bc], a                                  ; $5F05: $02
    ld   hl, $5F13                                ; $5F06: $21 $13 $5F
    call func_01F_7ABD                            ; $5F09: $CD $BD $7A
    jp   label_01F_7A85                           ; $5F0C: $C3 $85 $7A

    nop                                           ; $5F0F: $00
    ld   h, b                                     ; $5F10: $60
    rst  $38                                      ; $5F11: $FF
    nop                                           ; $5F12: $00
    add  b                                        ; $5F13: $80
    nop                                           ; $5F14: $00
    jr   nz, jr_01F_5F57                          ; $5F15: $20 $40

    add  [hl]                                     ; $5F17: $86
    nop                                           ; $5F18: $00
    call func_01F_6379                            ; $5F19: $CD $79 $63
    ld   hl, $5F72                                ; $5F1C: $21 $72 $5F
    call func_01F_7ABD                            ; $5F1F: $CD $BD $7A
    jp   label_01F_62F8                           ; $5F22: $C3 $F8 $62

    call IncrementValueAtBC                            ; $5F25: $CD $75 $7A
    cp   $13                                      ; $5F28: $FE $13
    jp   z, label_01F_6327                        ; $5F2A: $CA $27 $63

    cp   $02                                      ; $5F2D: $FE $02
    jr   z, jr_01F_5F3F                           ; $5F2F: $28 $0E

    cp   $0E                                      ; $5F31: $FE $0E
    jr   z, jr_01F_5F46                           ; $5F33: $28 $11

    cp   $10                                      ; $5F35: $FE $10
    jr   z, jr_01F_5F4A                           ; $5F37: $28 $11

jr_01F_5F39:
    ld   hl, $5F4E                                ; $5F39: $21 $4E $5F
    jp   label_01F_7AEB                           ; $5F3C: $C3 $EB $7A

jr_01F_5F3F:
    ld   a, $20                                   ; $5F3F: $3E $20

jr_01F_5F41:
    ldh  [rNR32], a                               ; $5F41: $E0 $1C
    ld   a, [bc]                                  ; $5F43: $0A
    jr   jr_01F_5F39                              ; $5F44: $18 $F3

jr_01F_5F46:
    ld   a, $40                                   ; $5F46: $3E $40
    jr   jr_01F_5F41                              ; $5F48: $18 $F7

jr_01F_5F4A:
    ld   a, $60                                   ; $5F4A: $3E $60
    jr   jr_01F_5F41                              ; $5F4C: $18 $F3

    rst  $38                                      ; $5F4E: $FF
    ldh  a, [rP1]                                 ; $5F4F: $F0 $00
    ld   [de], a                                  ; $5F51: $12
    rst  $38                                      ; $5F52: $FF
    ldh  a, [rP1]                                 ; $5F53: $F0 $00
    ld   [de], a                                  ; $5F55: $12
    rst  $38                                      ; $5F56: $FF

jr_01F_5F57:
    ldh  a, [rP1]                                 ; $5F57: $F0 $00
    ld   [de], a                                  ; $5F59: $12
    rst  $38                                      ; $5F5A: $FF
    ldh  [rP1], a                                 ; $5F5B: $E0 $00
    ld   e, $FF                                   ; $5F5D: $1E $FF
    ldh  [rP1], a                                 ; $5F5F: $E0 $00
    inc  e                                        ; $5F61: $1C
    rst  $38                                      ; $5F62: $FF
    ldh  [rP1], a                                 ; $5F63: $E0 $00
    ld   a, [de]                                  ; $5F65: $1A
    rst  $38                                      ; $5F66: $FF
    ldh  [rP1], a                                 ; $5F67: $E0 $00
    jr   @+$01                                    ; $5F69: $18 $FF

    ldh  [rP1], a                                 ; $5F6B: $E0 $00
    ld   [de], a                                  ; $5F6D: $12
    rst  $38                                      ; $5F6E: $FF
    ldh  [rP1], a                                 ; $5F6F: $E0 $00
    inc  d                                        ; $5F71: $14
    add  b                                        ; $5F72: $80

jr_01F_5F73:
    nop                                           ; $5F73: $00
    ld   b, b                                     ; $5F74: $40
    jr   nc, @-$77                                ; $5F75: $30 $87

    ld   bc, $71FA                                ; $5F77: $01 $FA $71
    db   $D3                                      ; $5F7A: $D3
    cp   $03                                      ; $5F7B: $FE $03
    jp   z, label_01F_6385                        ; $5F7D: $CA $85 $63

    cp   $06                                      ; $5F80: $FE $06
    jp   z, label_01F_6385                        ; $5F82: $CA $85 $63

    cp   $07                                      ; $5F85: $FE $07
    jp   z, label_01F_6385                        ; $5F87: $CA $85 $63

    call func_01F_6360                            ; $5F8A: $CD $60 $63
    ld   hl, $5FAE                                ; $5F8D: $21 $AE $5F
    jp   label_01F_62F8                           ; $5F90: $C3 $F8 $62

    call DecrementValueAtDE                            ; $5F93: $CD $71 $7A
    ret  nz                                       ; $5F96: $C0

    call IncrementValueAtBC                            ; $5F97: $CD $75 $7A
    cp   $04                                      ; $5F9A: $FE $04
    jp   z, label_01F_632D                        ; $5F9C: $CA $2D $63

    ld   hl, $5FA8                                ; $5F9F: $21 $A8 $5F
    call GetHandlerAddressInTable                 ; $5FA2: $CD $64 $7A
    jp   label_01F_7A85                           ; $5FA5: $C3 $85 $7A

    or   h                                        ; $5FA8: $B4
    ld   e, a                                     ; $5FA9: $5F
    cp   d                                        ; $5FAA: $BA
    ld   e, a                                     ; $5FAB: $5F
    or   h                                        ; $5FAC: $B4
    ld   e, a                                     ; $5FAD: $5F
    add  b                                        ; $5FAE: $80
    db   $FD                                      ; $5FAF: $FD
    ld   b, b                                     ; $5FB0: $40
    jr   nz, jr_01F_5F73                          ; $5FB1: $20 $C0

    ld   [bc], a                                  ; $5FB3: $02
    add  b                                        ; $5FB4: $80
    db   $FD                                      ; $5FB5: $FD
    ld   b, b                                     ; $5FB6: $40
    add  b                                        ; $5FB7: $80
    pop  bc                                       ; $5FB8: $C1
    ld   [bc], a                                  ; $5FB9: $02
    add  b                                        ; $5FBA: $80
    db   $FD                                      ; $5FBB: $FD
    ld   b, b                                     ; $5FBC: $40
    nop                                           ; $5FBD: $00
    jp   nz, $CD02                                ; $5FBE: $C2 $02 $CD

    ld   a, c                                     ; $5FC1: $79
    ld   h, e                                     ; $5FC2: $63
    ld   hl, $5FEC                                ; $5FC3: $21 $EC $5F
    jp   label_01F_62F3                           ; $5FC6: $C3 $F3 $62

    call DecrementValueAtDE                            ; $5FC9: $CD $71 $7A
    ret  nz                                       ; $5FCC: $C0

    call IncrementValueAtBC                            ; $5FCD: $CD $75 $7A
    cp   $08                                      ; $5FD0: $FE $08
    jp   z, label_01F_632D                        ; $5FD2: $CA $2D $63

    ld   hl, $5FDE                                ; $5FD5: $21 $DE $5F
    call GetHandlerAddressInTable                 ; $5FD8: $CD $64 $7A
    jp   label_01F_7A85                           ; $5FDB: $C3 $85 $7A

    inc  b                                        ; $5FDE: $04
    ld   h, b                                     ; $5FDF: $60
    ld   a, [c]                                   ; $5FE0: $F2
    ld   e, a                                     ; $5FE1: $5F
    ld   a, [bc]                                  ; $5FE2: $0A
    ld   h, b                                     ; $5FE3: $60
    ld   hl, sp+$5F                               ; $5FE4: $F8 $5F
    db   $10                                      ; $5FE6: $10
    ld   h, b                                     ; $5FE7: $60
    cp   $5F                                      ; $5FE8: $FE $5F
    ld   d, $60                                   ; $5FEA: $16 $60
    add  b                                        ; $5FEC: $80
    ld   [$6220], a                               ; $5FED: $EA $20 $62
    rst  $00                                      ; $5FF0: $C7
    ld   b, $80                                   ; $5FF1: $06 $80
    ld   [$7420], a                               ; $5FF3: $EA $20 $74
    rst  $00                                      ; $5FF6: $C7
    ld   b, $80                                   ; $5FF7: $06 $80
    ld   [$7B20], a                               ; $5FF9: $EA $20 $7B
    rst  $00                                      ; $5FFC: $C7
    ld   b, $80                                   ; $5FFD: $06 $80
    ld   [$A720], a                               ; $5FFF: $EA $20 $A7
    rst  $00                                      ; $6002: $C7
    ld   b, $80                                   ; $6003: $06 $80
    ld   [$6260], a                               ; $6005: $EA $60 $62
    rst  $00                                      ; $6008: $C7
    ld   b, $80                                   ; $6009: $06 $80
    ld   [$7460], a                               ; $600B: $EA $60 $74
    rst  $00                                      ; $600E: $C7
    ld   b, $80                                   ; $600F: $06 $80
    ld   [$7B60], a                               ; $6011: $EA $60 $7B
    rst  $00                                      ; $6014: $C7
    ld   b, $80                                   ; $6015: $06 $80
    ld   [$A760], a                               ; $6017: $EA $60 $A7
    rst  $00                                      ; $601A: $C7
    ld   b, $3E                                   ; $601B: $06 $3E
    inc  b                                        ; $601D: $04
    ld   [$D3BE], a                               ; $601E: $EA $BE $D3
    call func_01F_6379                            ; $6021: $CD $79 $63
    ld   hl, $6060                                ; $6024: $21 $60 $60
    call func_01F_7ABD                            ; $6027: $CD $BD $7A
    jp   label_01F_62F8                           ; $602A: $C3 $F8 $62

    call IncrementValueAtBC                            ; $602D: $CD $75 $7A
    cp   $07                                      ; $6030: $FE $07
    jr   z, jr_01F_603A                           ; $6032: $28 $06

    ld   hl, $6054                                ; $6034: $21 $54 $60
    jp   label_01F_7AEB                           ; $6037: $C3 $EB $7A

jr_01F_603A:
    call func_01F_7AA6                            ; $603A: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $603D: $CA $27 $63

    cp   $02                                      ; $6040: $FE $02
    jr   z, jr_01F_604F                           ; $6042: $28 $0B

    ld   hl, $6066                                ; $6044: $21 $66 $60

jr_01F_6047:
    xor  a                                        ; $6047: $AF
    ld   [bc], a                                  ; $6048: $02
    call func_01F_7ABD                            ; $6049: $CD $BD $7A
    jp   label_01F_7A85                           ; $604C: $C3 $85 $7A

jr_01F_604F:
    ld   hl, $6060                                ; $604F: $21 $60 $60
    jr   jr_01F_6047                              ; $6052: $18 $F3

    nop                                           ; $6054: $00
    ld   b, $00                                   ; $6055: $06 $00
    inc  b                                        ; $6057: $04
    nop                                           ; $6058: $00
    ld   [bc], a                                  ; $6059: $02
    rst  $38                                      ; $605A: $FF
    ld   hl, sp-$01                               ; $605B: $F8 $FF
    ldh  a, [rIE]                                 ; $605D: $F0 $FF
    add  sp, -$80                                 ; $605F: $E8 $80
    nop                                           ; $6061: $00
    jr   nz, @+$62                                ; $6062: $20 $60

    add  a                                        ; $6064: $87
    ld   bc, $80                                  ; $6065: $01 $80 $00
    ld   h, b                                     ; $6068: $60
    ld   h, b                                     ; $6069: $60
    add  a                                        ; $606A: $87
    ld   bc, $C9C9                                ; $606B: $01 $C9 $C9
    ld   a, $07                                   ; $606E: $3E $07
    ld   [$D3DC], a                               ; $6070: $EA $DC $D3
    ld   a, $40                                   ; $6073: $3E $40
    ld   [$D3BE], a                               ; $6075: $EA $BE $D3
    call func_01F_6360                            ; $6078: $CD $60 $63
    ld   hl, $60BE                                ; $607B: $21 $BE $60
    call func_01F_7ABD                            ; $607E: $CD $BD $7A
    jp   label_01F_62F8                           ; $6081: $C3 $F8 $62

    call func_01F_7AA6                            ; $6084: $CD $A6 $7A
    jp   z, label_01F_60A6                        ; $6087: $CA $A6 $60

jr_01F_608A:
    ld   a, [$D3DC]                               ; $608A: $FA $DC $D3
    cp   $07                                      ; $608D: $FE $07
    jr   z, jr_01F_609E                           ; $608F: $28 $0D

    cp   $06                                      ; $6091: $FE $06
    jr   z, jr_01F_60A2                           ; $6093: $28 $0D

    ld   a, $03                                   ; $6095: $3E $03

jr_01F_6097:
    ld   [bc], a                                  ; $6097: $02
    ld   hl, $60B8                                ; $6098: $21 $B8 $60
    jp   label_01F_7AEB                           ; $609B: $C3 $EB $7A

jr_01F_609E:
    ld   a, $01                                   ; $609E: $3E $01
    jr   jr_01F_6097                              ; $60A0: $18 $F5

jr_01F_60A2:
    ld   a, $02                                   ; $60A2: $3E $02
    jr   jr_01F_6097                              ; $60A4: $18 $F1

label_01F_60A6:
    push de                                       ; $60A6: $D5
    ld   de, $D3DC                                ; $60A7: $11 $DC $D3
    call DecrementValueAtDE                            ; $60AA: $CD $71 $7A
    pop  de                                       ; $60AD: $D1
    jp   z, label_01F_6327                        ; $60AE: $CA $27 $63

    ld   a, $40                                   ; $60B1: $3E $40
    ld   [$D3BE], a                               ; $60B3: $EA $BE $D3
    jr   jr_01F_608A                              ; $60B6: $18 $D2

    rst  $38                                      ; $60B8: $FF
    rst  $38                                      ; $60B9: $FF
    rst  $38                                      ; $60BA: $FF
    cp   $FF                                      ; $60BB: $FE $FF
    ei                                            ; $60BD: $FB
    add  b                                        ; $60BE: $80
    nop                                           ; $60BF: $00
    jr   nz, @+$01                                ; $60C0: $20 $FF

    add  a                                        ; $60C2: $87
    ld   bc, $C606                                ; $60C3: $01 $06 $C6
    ld   b, $C6                                   ; $60C6: $06 $C6
    ld   b, $C6                                   ; $60C8: $06 $C6
    ld   b, $C6                                   ; $60CA: $06 $C6
    adc  c                                        ; $60CC: $89
    cp   l                                        ; $60CD: $BD
    db   $ED                                      ; $60CE: $ED
    cp   c                                        ; $60CF: $B9
    add  a                                        ; $60D0: $87
    ld   d, e                                     ; $60D1: $53
    inc  hl                                       ; $60D2: $23
    ld   d, a                                     ; $60D3: $57
    call func_01F_7B5C                            ; $60D4: $CD $5C $7B
    ld   hl, $60C4                                ; $60D7: $21 $C4 $60
    call $635A                                    ; $60DA: $CD $5A $63
    ld   a, $05                                   ; $60DD: $3E $05
    ld   [$D3BE], a                               ; $60DF: $EA $BE $D3
    xor  a                                        ; $60E2: $AF
    ld   [$D3DD], a                               ; $60E3: $EA $DD $D3
    ld   hl, $6147                                ; $60E6: $21 $47 $61
    call func_01F_7ABD                            ; $60E9: $CD $BD $7A
    jp   label_01F_62F3                           ; $60EC: $C3 $F3 $62

    call func_01F_7AA6                            ; $60EF: $CD $A6 $7A
    cp   $01                                      ; $60F2: $FE $01
    jr   z, jr_01F_6115                           ; $60F4: $28 $1F

    ld   a, [$D3DD]                               ; $60F6: $FA $DD $D3
    cp   $11                                      ; $60F9: $FE $11
    jr   z, jr_01F_610D                           ; $60FB: $28 $10

    cp   $0A                                      ; $60FD: $FE $0A
    jr   nc, jr_01F_6111                          ; $60FF: $30 $10

    ld   a, $01                                   ; $6101: $3E $01

jr_01F_6103:
    ld   bc, $D396                                ; $6103: $01 $96 $D3
    ld   [bc], a                                  ; $6106: $02
    ld   hl, $613D                                ; $6107: $21 $3D $61
    jp   label_01F_7AEB                           ; $610A: $C3 $EB $7A

jr_01F_610D:
    ld   a, $05                                   ; $610D: $3E $05
    jr   jr_01F_6103                              ; $610F: $18 $F2

jr_01F_6111:
    ld   a, $03                                   ; $6111: $3E $03
    jr   jr_01F_6103                              ; $6113: $18 $EE

jr_01F_6115:
    push bc                                       ; $6115: $C5
    ld   bc, $D3DD                                ; $6116: $01 $DD $D3
    call IncrementValueAtBC                            ; $6119: $CD $75 $7A
    pop  bc                                       ; $611C: $C1
    cp   $12                                      ; $611D: $FE $12
    jr   z, jr_01F_6135                           ; $611F: $28 $14

    add  $05                                      ; $6121: $C6 $05
    ld   [$D3BE], a                               ; $6123: $EA $BE $D3
    ld   a, [$D3DD]                               ; $6126: $FA $DD $D3
    cp   $0B                                      ; $6129: $FE $0B
    jr   nc, jr_01F_6131                          ; $612B: $30 $04

    ld   a, $02                                   ; $612D: $3E $02
    jr   jr_01F_6103                              ; $612F: $18 $D2

jr_01F_6131:
    ld   a, $04                                   ; $6131: $3E $04
    jr   jr_01F_6103                              ; $6133: $18 $CE

jr_01F_6135:
    ld   a, $59                                   ; $6135: $3E $59
    ld   [wActiveMusicTrack], a                   ; $6137: $EA $68 $D3
    jp   label_01F_6327                           ; $613A: $C3 $27 $63

    rst  $38                                      ; $613D: $FF
    db   $F4                                      ; $613E: $F4
    nop                                           ; $613F: $00
    ld   [hl-], a                                 ; $6140: $32
    rst  $38                                      ; $6141: $FF
    ldh  a, [rP1]                                 ; $6142: $F0 $00
    ld   [hl], b                                  ; $6144: $70
    rst  $38                                      ; $6145: $FF
    add  sp, -$80                                 ; $6146: $E8 $80
    nop                                           ; $6148: $00
    ld   b, b                                     ; $6149: $40
    and  b                                        ; $614A: $A0
    add  a                                        ; $614B: $87
    ld   bc, $60CD                                ; $614C: $01 $CD $60
    ld   h, e                                     ; $614F: $63
    ld   a, $03                                   ; $6150: $3E $03
    ld   [$D3DE], a                               ; $6152: $EA $DE $D3
    ld   a, $90                                   ; $6155: $3E $90
    ld   [$D3BE], a                               ; $6157: $EA $BE $D3
    ld   hl, $619C                                ; $615A: $21 $9C $61
    call func_01F_7ABD                            ; $615D: $CD $BD $7A
    jp   label_01F_62F8                           ; $6160: $C3 $F8 $62

    call func_01F_7AA6                            ; $6163: $CD $A6 $7A
    jr   z, jr_01F_6184                           ; $6166: $28 $1C

jr_01F_6168:
    ld   a, [$D3DE]                               ; $6168: $FA $DE $D3
    cp   $03                                      ; $616B: $FE $03
    jr   z, jr_01F_617C                           ; $616D: $28 $0D

    cp   $02                                      ; $616F: $FE $02
    jr   z, jr_01F_6180                           ; $6171: $28 $0D

    ld   a, $01                                   ; $6173: $3E $01

jr_01F_6175:
    ld   [bc], a                                  ; $6175: $02
    ld   hl, $6196                                ; $6176: $21 $96 $61
    jp   label_01F_7AEB                           ; $6179: $C3 $EB $7A

jr_01F_617C:
    ld   a, $03                                   ; $617C: $3E $03
    jr   jr_01F_6175                              ; $617E: $18 $F5

jr_01F_6180:
    ld   a, $02                                   ; $6180: $3E $02
    jr   jr_01F_6175                              ; $6182: $18 $F1

jr_01F_6184:
    push de                                       ; $6184: $D5
    ld   de, $D3DE                                ; $6185: $11 $DE $D3
    call DecrementValueAtDE                            ; $6188: $CD $71 $7A
    pop  de                                       ; $618B: $D1
    jp   z, label_01F_6327                        ; $618C: $CA $27 $63

    ld   a, $90                                   ; $618F: $3E $90
    ld   [$D3BE], a                               ; $6191: $EA $BE $D3
    jr   jr_01F_6168                              ; $6194: $18 $D2

    nop                                           ; $6196: $00
    ld   bc, $200                                 ; $6197: $01 $00 $02
    nop                                           ; $619A: $00
    inc  bc                                       ; $619B: $03
    add  b                                        ; $619C: $80
    nop                                           ; $619D: $00
    ld   h, b                                     ; $619E: $60
    add  b                                        ; $619F: $80
    add  h                                        ; $61A0: $84
    ld   [bc], a                                  ; $61A1: $02
    ld   a, $07                                   ; $61A2: $3E $07
    ld   [$D3BE], a                               ; $61A4: $EA $BE $D3
    ld   a, [wActiveWaveSfx]                      ; $61A7: $FA $70 $D3
    ld   [$D371], a                               ; $61AA: $EA $71 $D3
    ld   a, $01                                   ; $61AD: $3E $01
    ld   [$D3C8], a                               ; $61AF: $EA $C8 $D3
    ld   hl, $D32F                                ; $61B2: $21 $2F $D3
    set  7, [hl]                                  ; $61B5: $CB $FE
    xor  a                                        ; $61B7: $AF
    ld   [$D392], a                               ; $61B8: $EA $92 $D3
    ld   [$D396], a                               ; $61BB: $EA $96 $D3
    ldh  [rNR30], a                               ; $61BE: $E0 $1A
    ld   hl, $6354                                ; $61C0: $21 $54 $63
    call func_01F_7A85                            ; $61C3: $CD $85 $7A
    ld   hl, $6217                                ; $61C6: $21 $17 $62
    call func_01F_7AD0                            ; $61C9: $CD $D0 $7A
    jp   label_01F_7A7F                           ; $61CC: $C3 $7F $7A

    call IncrementValueAtBC                            ; $61CF: $CD $75 $7A
    cp   $09                                      ; $61D2: $FE $09
    jr   z, jr_01F_61E0                           ; $61D4: $28 $0A

    cp   $0A                                      ; $61D6: $FE $0A
    jr   z, jr_01F_61E8                           ; $61D8: $28 $0E

jr_01F_61DA:
    ld   hl, $6205                                ; $61DA: $21 $05 $62
    jp   label_01F_7B11                           ; $61DD: $C3 $11 $7B

jr_01F_61E0:
    call func_01F_7AA6                            ; $61E0: $CD $A6 $7A
    jr   z, jr_01F_61ED                           ; $61E3: $28 $08

    ld   a, [bc]                                  ; $61E5: $0A
    jr   jr_01F_61DA                              ; $61E6: $18 $F2

jr_01F_61E8:
    ld   a, $01                                   ; $61E8: $3E $01
    ld   [bc], a                                  ; $61EA: $02
    jr   jr_01F_61DA                              ; $61EB: $18 $ED

jr_01F_61ED:
    xor  a                                        ; $61ED: $AF
    ld   [$D392], a                               ; $61EE: $EA $92 $D3
    ld   [$D396], a                               ; $61F1: $EA $96 $D3
    ld   [$D371], a                               ; $61F4: $EA $71 $D3
    ld   [$D3C8], a                               ; $61F7: $EA $C8 $D3
    ld   hl, $D32F                                ; $61FA: $21 $2F $D3
    res  7, [hl]                                  ; $61FD: $CB $BE

jr_01F_61FF:
    ld   hl, $D32F                                ; $61FF: $21 $2F $D3
    res  7, [hl]                                  ; $6202: $CB $BE
    ret                                           ; $6204: $C9

    rst  $38                                      ; $6205: $FF
    rst  $38                                      ; $6206: $FF
    rst  $38                                      ; $6207: $FF
    cp   $FF                                      ; $6208: $FE $FF
    db   $FD                                      ; $620A: $FD
    rst  $38                                      ; $620B: $FF
    db   $FC                                      ; $620C: $FC
    rst  $38                                      ; $620D: $FF
    ld   a, [$F6FF]                               ; $620E: $FA $FF $F6
    rst  $38                                      ; $6211: $FF
    ld   a, [c]                                   ; $6212: $F2
    rst  $38                                      ; $6213: $FF
    xor  $00                                      ; $6214: $EE $00
    ld   a, [hl-]                                 ; $6216: $3A
    nop                                           ; $6217: $00
    sub  a                                        ; $6218: $97
    add  b                                        ; $6219: $80
    add  a                                        ; $621A: $87
    ld   bc, $2E3E                                ; $621B: $01 $3E $2E
    ld   [$D3BE], a                               ; $621E: $EA $BE $D3
    xor  a                                        ; $6221: $AF
    ld   [$D3E1], a                               ; $6222: $EA $E1 $D3
    call func_01F_6360                            ; $6225: $CD $60 $63
    ld   hl, $6276                                ; $6228: $21 $76 $62
    call func_01F_7ABD                            ; $622B: $CD $BD $7A
    jp   label_01F_62F3                           ; $622E: $C3 $F3 $62

    call func_01F_7AA6                            ; $6231: $CD $A6 $7A
    jr   z, jr_01F_624E                           ; $6234: $28 $18

jr_01F_6236:
    ld   a, [$D3E1]                               ; $6236: $FA $E1 $D3
    cp   $01                                      ; $6239: $FE $01
    jr   z, jr_01F_6262                           ; $623B: $28 $25

    cp   $02                                      ; $623D: $FE $02
    jr   z, jr_01F_6266                           ; $623F: $28 $25

    cp   $03                                      ; $6241: $FE $03
    jr   z, jr_01F_626A                           ; $6243: $28 $25

    ld   a, $01                                   ; $6245: $3E $01

jr_01F_6247:
    ld   [bc], a                                  ; $6247: $02
    ld   hl, $626E                                ; $6248: $21 $6E $62
    jp   label_01F_7AEB                           ; $624B: $C3 $EB $7A

jr_01F_624E:
    push bc                                       ; $624E: $C5
    ld   bc, $D3E1                                ; $624F: $01 $E1 $D3
    call IncrementValueAtBC                            ; $6252: $CD $75 $7A
    pop  bc                                       ; $6255: $C1
    cp   $04                                      ; $6256: $FE $04
    jp   z, label_01F_6327                        ; $6258: $CA $27 $63

    ld   a, $2E                                   ; $625B: $3E $2E
    ld   [$D3BE], a                               ; $625D: $EA $BE $D3
    jr   jr_01F_6236                              ; $6260: $18 $D4

jr_01F_6262:
    ld   a, $02                                   ; $6262: $3E $02
    jr   jr_01F_6247                              ; $6264: $18 $E1

jr_01F_6266:
    ld   a, $03                                   ; $6266: $3E $03
    jr   jr_01F_6247                              ; $6268: $18 $DD

jr_01F_626A:
    ld   a, $04                                   ; $626A: $3E $04
    jr   jr_01F_6247                              ; $626C: $18 $D9

    nop                                           ; $626E: $00
    ld   [$0600], sp                              ; $626F: $08 $00 $06
    nop                                           ; $6272: $00
    inc  b                                        ; $6273: $04
    nop                                           ; $6274: $00
    ld   [bc], a                                  ; $6275: $02
    add  b                                        ; $6276: $80
    nop                                           ; $6277: $00
    ld   b, b                                     ; $6278: $40
    jr   nc, jr_01F_61FF                          ; $6279: $30 $84

    ld   bc, $65CD                                ; $627B: $01 $CD $65
    ld   h, e                                     ; $627E: $63
    ld   hl, $62C9                                ; $627F: $21 $C9 $62
    jp   label_01F_62F3                           ; $6282: $C3 $F3 $62

    call DecrementValueAtDE                            ; $6285: $CD $71 $7A
    ret  nz                                       ; $6288: $C0

    call IncrementValueAtBC                            ; $6289: $CD $75 $7A
    cp   $0D                                      ; $628C: $FE $0D
    jp   z, label_01F_6327                        ; $628E: $CA $27 $63

    ld   hl, $62B1                                ; $6291: $21 $B1 $62
    call GetHandlerAddressInTable                 ; $6294: $CD $64 $7A
    ld   a, [$D396]                               ; $6297: $FA $96 $D3
    cp   $01                                      ; $629A: $FE $01
    jp   z, label_01F_7A85                        ; $629C: $CA $85 $7A

    cp   $02                                      ; $629F: $FE $02
    jp   z, label_01F_7A85                        ; $62A1: $CA $85 $7A

    cp   $07                                      ; $62A4: $FE $07
    jp   z, label_01F_7A85                        ; $62A6: $CA $85 $7A

    cp   $0A                                      ; $62A9: $FE $0A
    jp   z, label_01F_7A85                        ; $62AB: $CA $85 $7A

    jp   label_01F_637E                           ; $62AE: $C3 $7E $63

    rst  $08                                      ; $62B1: $CF
    ld   h, d                                     ; $62B2: $62
    push de                                       ; $62B3: $D5
    ld   h, d                                     ; $62B4: $62
    rst  $20                                      ; $62B5: $E7
    ld   h, d                                     ; $62B6: $62
    ld   [$ED62], a                               ; $62B7: $EA $62 $ED
    ld   h, d                                     ; $62BA: $62
    ldh  a, [$FF62]                               ; $62BB: $F0 $62
    db   $DB                                      ; $62BD: $DB
    ld   h, d                                     ; $62BE: $62
    db   $ED                                      ; $62BF: $ED
    ld   h, d                                     ; $62C0: $62
    ldh  a, [$FF62]                               ; $62C1: $F0 $62
    pop  hl                                       ; $62C3: $E1
    ld   h, d                                     ; $62C4: $62
    db   $ED                                      ; $62C5: $ED
    ld   h, d                                     ; $62C6: $62
    ldh  a, [$FF62]                               ; $62C7: $F0 $62
    add  b                                        ; $62C9: $80
    ld   a, [c]                                   ; $62CA: $F2
    ld   h, b                                     ; $62CB: $60
    rst  $18                                      ; $62CC: $DF
    add  a                                        ; $62CD: $87
    ld   [bc], a                                  ; $62CE: $02
    add  b                                        ; $62CF: $80
    ld   a, [c]                                   ; $62D0: $F2
    ld   b, b                                     ; $62D1: $40
    rst  $18                                      ; $62D2: $DF
    add  a                                        ; $62D3: $87
    ld   [bc], a                                  ; $62D4: $02
    add  b                                        ; $62D5: $80
    ld   a, [c]                                   ; $62D6: $F2
    jr   nz, @-$1F                                ; $62D7: $20 $DF

    add  a                                        ; $62D9: $87
    inc  bc                                       ; $62DA: $03
    add  b                                        ; $62DB: $80
    ld   a, [c]                                   ; $62DC: $F2
    ld   b, b                                     ; $62DD: $40
    and  d                                        ; $62DE: $A2
    add  a                                        ; $62DF: $87
    inc  bc                                       ; $62E0: $03
    add  b                                        ; $62E1: $80
    ld   a, [c]                                   ; $62E2: $F2
    ld   h, b                                     ; $62E3: $60
    and  d                                        ; $62E4: $A2
    add  a                                        ; $62E5: $87
    inc  bc                                       ; $62E6: $03
    cp   [hl]                                     ; $62E7: $BE
    add  a                                        ; $62E8: $87
    inc  bc                                       ; $62E9: $03
    and  d                                        ; $62EA: $A2
    add  a                                        ; $62EB: $87
    inc  bc                                       ; $62EC: $03
    add  e                                        ; $62ED: $83
    add  a                                        ; $62EE: $87
    inc  bc                                       ; $62EF: $03
    and  a                                        ; $62F0: $A7
    rst  $00                                      ; $62F1: $C7
    inc  bc                                       ; $62F2: $03

label_01F_62F3:
    ld   a, $01                                   ; $62F3: $3E $01
    ld   [$D3C8], a                               ; $62F5: $EA $C8 $D3

label_01F_62F8:
    ld   a, [wActiveWaveSfx]                      ; $62F8: $FA $70 $D3
    ld   [$D371], a                               ; $62FB: $EA $71 $D3
    push hl                                       ; $62FE: $E5
    ld   hl, $D33F                                ; $62FF: $21 $3F $D3
    set  7, [hl]                                  ; $6302: $CB $FE
    pop  hl                                       ; $6304: $E1
    xor  a                                        ; $6305: $AF
    ld   [$D392], a                               ; $6306: $EA $92 $D3
    ld   [$D396], a                               ; $6309: $EA $96 $D3
    ldh  [rNR30], a                               ; $630C: $E0 $1A
    jp   label_01F_7A85                           ; $630E: $C3 $85 $7A

    add  b                                        ; $6311: $80
    nop                                           ; $6312: $00
    nop                                           ; $6313: $00
    nop                                           ; $6314: $00
    ld   bc, $01                                  ; $6315: $01 $01 $00
    nop                                           ; $6318: $00
    nop                                           ; $6319: $00
    nop                                           ; $631A: $00
    rst  $38                                      ; $631B: $FF
    rst  $38                                      ; $631C: $FF
    rst  $38                                      ; $631D: $FF
    rst  $38                                      ; $631E: $FF
    nop                                           ; $631F: $00
    nop                                           ; $6320: $00
    nop                                           ; $6321: $00
    nop                                           ; $6322: $00
    rst  $38                                      ; $6323: $FF
    rst  $38                                      ; $6324: $FF
    rst  $38                                      ; $6325: $FF
    rst  $38                                      ; $6326: $FF

label_01F_6327:
    ld   hl, $6354                                ; $6327: $21 $54 $63
    call func_01F_7A85                            ; $632A: $CD $85 $7A

label_01F_632D:
    xor  a                                        ; $632D: $AF
    ld   [$D392], a                               ; $632E: $EA $92 $D3
    ld   [$D396], a                               ; $6331: $EA $96 $D3
    ld   [$D371], a                               ; $6334: $EA $71 $D3
    ldh  [rNR30], a                               ; $6337: $E0 $1A
    ld   [$D3C8], a                               ; $6339: $EA $C8 $D3
    ld   hl, $D33F                                ; $633C: $21 $3F $D3
    res  7, [hl]                                  ; $633F: $CB $BE
    ld   a, $01                                   ; $6341: $3E $01
    ld   [$D3E7], a                               ; $6343: $EA $E7 $D3
    ret                                           ; $6346: $C9

func_01F_6347:
label_01F_6347:
    push bc                                       ; $6347: $C5
    ld   c, $30                                   ; $6348: $0E $30

jr_01F_634A:
    ld   a, [hl+]                                 ; $634A: $2A
    ld   [c], a                                   ; $634B: $E2
    inc  c                                        ; $634C: $0C
    ld   a, c                                     ; $634D: $79
    cp   $40                                      ; $634E: $FE $40
    jr   nz, jr_01F_634A                          ; $6350: $20 $F8

    pop  bc                                       ; $6352: $C1
    ret                                           ; $6353: $C9

    add  b                                        ; $6354: $80
    nop                                           ; $6355: $00
    nop                                           ; $6356: $00
    nop                                           ; $6357: $00
    add  c                                        ; $6358: $81
    ld   bc, $E0AF                                ; $6359: $01 $AF $E0
    ld   a, [de]                                  ; $635C: $1A
    jp   label_01F_6347                           ; $635D: $C3 $47 $63

func_01F_6360:
    ld   hl, $63AC                                ; $6360: $21 $AC $63
    jr   @-$09                                    ; $6363: $18 $F5

func_01F_6365:
    ld   hl, $63BC                                ; $6365: $21 $BC $63
    jr   @-$0E                                    ; $6368: $18 $F0

func_01F_636A:
    ld   hl, $639C                                ; $636A: $21 $9C $63
    jr   @-$13                                    ; $636D: $18 $EB

func_01F_636F:
    ld   hl, $63CC                                ; $636F: $21 $CC $63
    jr   @-$18                                    ; $6372: $18 $E6

func_01F_6374:
    ld   hl, $63DC                                ; $6374: $21 $DC $63
    jr   @-$1D                                    ; $6377: $18 $E1

func_01F_6379:
    ld   hl, $638C                                ; $6379: $21 $8C $63
    jr   @-$22                                    ; $637C: $18 $DC

label_01F_637E:
    ld   c, $1D                                   ; $637E: $0E $1D
    ld   b, $02                                   ; $6380: $06 $02
    jp   label_01F_7A91                           ; $6382: $C3 $91 $7A

label_01F_6385:
    xor  a                                        ; $6385: $AF
    ld   [wActiveWaveSfx], a                      ; $6386: $EA $70 $D3
    jp   label_01F_53ED                           ; $6389: $C3 $ED $53

    adc  h                                        ; $638C: $8C
    rst  $28                                      ; $638D: $EF
    cp   $C8                                      ; $638E: $FE $C8
    add  h                                        ; $6390: $84
    ld   hl, $4812                                ; $6391: $21 $12 $48
    adc  h                                        ; $6394: $8C
    rst  $28                                      ; $6395: $EF
    cp   $C8                                      ; $6396: $FE $C8
    add  h                                        ; $6398: $84
    ld   hl, $4812                                ; $6399: $21 $12 $48
    nop                                           ; $639C: $00
    ld   [hl+], a                                 ; $639D: $22
    ld   b, h                                     ; $639E: $44
    ld   h, [hl]                                  ; $639F: $66
    adc  b                                        ; $63A0: $88
    xor  d                                        ; $63A1: $AA
    call z, $00CC                                 ; $63A2: $CC $CC $00
    ld   [hl+], a                                 ; $63A5: $22
    ld   b, h                                     ; $63A6: $44
    ld   h, [hl]                                  ; $63A7: $66
    adc  b                                        ; $63A8: $88
    xor  d                                        ; $63A9: $AA
    call z, $0FCC                                 ; $63AA: $CC $CC $0F
    rrca                                          ; $63AD: $0F
    rra                                           ; $63AE: $1F
    rra                                           ; $63AF: $1F
    cpl                                           ; $63B0: $2F
    cpl                                           ; $63B1: $2F
    ccf                                           ; $63B2: $3F
    ccf                                           ; $63B3: $3F
    ld   b, b                                     ; $63B4: $40
    ld   b, b                                     ; $63B5: $40
    ld   d, b                                     ; $63B6: $50
    ld   d, b                                     ; $63B7: $50
    ld   h, b                                     ; $63B8: $60
    ld   h, b                                     ; $63B9: $60
    ld   [hl], b                                  ; $63BA: $70
    ld   [hl], b                                  ; $63BB: $70
    inc  c                                        ; $63BC: $0C
    inc  c                                        ; $63BD: $0C
    nop                                           ; $63BE: $00
    ld   [hl+], a                                 ; $63BF: $22
    ld   b, h                                     ; $63C0: $44
    adc  b                                        ; $63C1: $88
    xor  d                                        ; $63C2: $AA
    call z, $00EE                                 ; $63C3: $CC $EE $00
    ld   l, h                                     ; $63C6: $6C
    ld   h, b                                     ; $63C7: $60
    nop                                           ; $63C8: $00
    ld   l, h                                     ; $63C9: $6C
    ld   h, b                                     ; $63CA: $60
    nop                                           ; $63CB: $00
    rst  $38                                      ; $63CC: $FF
    rst  $38                                      ; $63CD: $FF
    xor  $DD                                      ; $63CE: $EE $DD
    xor  $DD                                      ; $63D0: $EE $DD
    xor  $FF                                      ; $63D2: $EE $FF
    rst  $38                                      ; $63D4: $FF
    ret                                           ; $63D5: $C9

    ld   h, e                                     ; $63D6: $63
    ld   hl, $0000                                ; $63D7: $21 $00 $00
    inc  b                                        ; $63DA: $04
    adc  h                                        ; $63DB: $8C
    ld   bc, $4523                                ; $63DC: $01 $23 $45
    ld   h, a                                     ; $63DF: $67
    adc  c                                        ; $63E0: $89
    xor  h                                        ; $63E1: $AC
    xor  $EE                                      ; $63E2: $EE $EE
    cp   $DC                                      ; $63E4: $FE $DC
    cp   d                                        ; $63E6: $BA
    sbc  b                                        ; $63E7: $98
    db   $76                                      ; $63E8: $76
    ld   d, h                                     ; $63E9: $54
    ld   [hl-], a                                 ; $63EA: $32
    db   $10                                      ; $63EB: $10
    ld   e, $65                                   ; $63EC: $1E $65
    dec  a                                        ; $63EE: $3D
    ld   h, l                                     ; $63EF: $65
    add  a                                        ; $63F0: $87
    ld   h, l                                     ; $63F1: $65
    rst  $28                                      ; $63F2: $EF
    ld   h, l                                     ; $63F3: $65
    rra                                           ; $63F4: $1F
    ld   h, [hl]                                  ; $63F5: $66
    ld   l, l                                     ; $63F6: $6D
    ld   h, [hl]                                  ; $63F7: $66
    and  d                                        ; $63F8: $A2
    ld   h, [hl]                                  ; $63F9: $66
    ldh  [$FF66], a                               ; $63FA: $E0 $66
    ld   h, $67                                   ; $63FC: $26 $67
    ld   h, b                                     ; $63FE: $60
    ld   h, a                                     ; $63FF: $67
    sub  d                                        ; $6400: $92
    ld   h, a                                     ; $6401: $67
    or   h                                        ; $6402: $B4
    ld   h, a                                     ; $6403: $67
    push af                                       ; $6404: $F5
    ld   h, a                                     ; $6405: $67
    ld   l, $68                                   ; $6406: $2E $68
    ld   e, h                                     ; $6408: $5C
    ld   l, b                                     ; $6409: $68
    sub  c                                        ; $640A: $91
    ld   l, b                                     ; $640B: $68
    ldh  a, [rBCPS]                               ; $640C: $F0 $68
    ld   [bc], a                                  ; $640E: $02
    ld   l, c                                     ; $640F: $69
    ccf                                           ; $6410: $3F
    ld   l, c                                     ; $6411: $69
    ret                                           ; $6412: $C9

    ld   l, c                                     ; $6413: $69
    rrca                                          ; $6414: $0F
    ld   l, d                                     ; $6415: $6A
    ld   c, [hl]                                  ; $6416: $4E
    ld   l, d                                     ; $6417: $6A
    add  b                                        ; $6418: $80
    ld   l, d                                     ; $6419: $6A
    and  d                                        ; $641A: $A2
    ld   l, d                                     ; $641B: $6A
    db   $EC                                      ; $641C: $EC
    ld   l, d                                     ; $641D: $6A
    ld   [hl-], a                                 ; $641E: $32
    ld   l, e                                     ; $641F: $6B
    sub  a                                        ; $6420: $97
    ld   l, e                                     ; $6421: $6B
    inc  de                                       ; $6422: $13
    ld   l, h                                     ; $6423: $6C
    ld   c, h                                     ; $6424: $4C
    ld   l, h                                     ; $6425: $6C
    sub  a                                        ; $6426: $97
    ld   l, h                                     ; $6427: $6C
    call nz, $0B6C                                ; $6428: $C4 $6C $0B
    ld   l, l                                     ; $642B: $6D
    ld   bc, $357A                                ; $642C: $01 $7A $35
    ld   l, l                                     ; $642F: $6D
    ld   [hl], e                                  ; $6430: $73
    ld   l, l                                     ; $6431: $6D
    sub  l                                        ; $6432: $95
    ld   l, l                                     ; $6433: $6D
    or   a                                        ; $6434: $B7
    ld   l, l                                     ; $6435: $6D
    ld   c, [hl]                                  ; $6436: $4E
    ld   l, [hl]                                  ; $6437: $6E
    add  a                                        ; $6438: $87
    ld   l, [hl]                                  ; $6439: $6E
    db   $DD                                      ; $643A: $DD
    ld   l, [hl]                                  ; $643B: $6E
    ld   sp, $786F                                ; $643C: $31 $6F $78
    ld   l, a                                     ; $643F: $6F
    db   $DD                                      ; $6440: $DD
    ld   l, a                                     ; $6441: $6F
    rst  $28                                      ; $6442: $EF
    ld   l, a                                     ; $6443: $6F
    ld   a, b                                     ; $6444: $78
    ld   [hl], b                                  ; $6445: $70
    call nz, $1470                                ; $6446: $C4 $70 $14
    ld   [hl], c                                  ; $6449: $71
    ld   [hl], $71                                ; $644A: $36 $71
    rst  $00                                      ; $644C: $C7
    ld   [hl], c                                  ; $644D: $71
    ld   a, $72                                   ; $644E: $3E $72
    sub  l                                        ; $6450: $95
    ld   [hl], d                                  ; $6451: $72
    db   $E4                                      ; $6452: $E4
    ld   [hl], d                                  ; $6453: $72
    adc  e                                        ; $6454: $8B
    ld   [hl], h                                  ; $6455: $74
    sub  b                                        ; $6456: $90
    ld   [hl], l                                  ; $6457: $75
    jp   c, $A175                                 ; $6458: $DA $75 $A1

    db   $76                                      ; $645B: $76
    ld   a, [bc]                                  ; $645C: $0A
    db   $76                                      ; $645D: $76
    inc  e                                        ; $645E: $1C
    ld   [hl], a                                  ; $645F: $77
    ld   l, [hl]                                  ; $6460: $6E
    ld   [hl], a                                  ; $6461: $77
    ret  nz                                       ; $6462: $C0

    ld   [hl], a                                  ; $6463: $77
    and  $77                                      ; $6464: $E6 $77
    dec  b                                        ; $6466: $05
    ld   a, c                                     ; $6467: $79
    ld   e, e                                     ; $6468: $5B
    ld   a, c                                     ; $6469: $79
    dec  de                                       ; $646A: $1B
    ld   a, e                                     ; $646B: $7B
    add  hl, hl                                   ; $646C: $29
    ld   h, l                                     ; $646D: $65
    ld   b, e                                     ; $646E: $43
    ld   h, l                                     ; $646F: $65
    adc  l                                        ; $6470: $8D
    ld   h, l                                     ; $6471: $65
    push af                                       ; $6472: $F5
    ld   h, l                                     ; $6473: $65
    inc  a                                        ; $6474: $3C
    ld   h, [hl]                                  ; $6475: $66
    ld   [hl], e                                  ; $6476: $73
    ld   h, [hl]                                  ; $6477: $66
    call nz, $F366                                ; $6478: $C4 $66 $F3
    ld   h, [hl]                                  ; $647B: $66
    inc  l                                        ; $647C: $2C
    ld   h, a                                     ; $647D: $67
    ld   h, [hl]                                  ; $647E: $66
    ld   h, a                                     ; $647F: $67
    sbc  b                                        ; $6480: $98
    ld   h, a                                     ; $6481: $67
    rst  $00                                      ; $6482: $C7
    ld   h, a                                     ; $6483: $67
    nop                                           ; $6484: $00
    ld   l, b                                     ; $6485: $68
    inc  [hl]                                     ; $6486: $34
    ld   l, b                                     ; $6487: $68
    ld   l, c                                     ; $6488: $69
    ld   l, b                                     ; $6489: $68
    sbc  h                                        ; $648A: $9C
    ld   l, b                                     ; $648B: $68
    or   $68                                      ; $648C: $F6 $68
    ld   [$4569], sp                              ; $648E: $08 $69 $45
    ld   l, c                                     ; $6491: $69
    rst  $08                                      ; $6492: $CF
    ld   l, c                                     ; $6493: $69
    dec  d                                        ; $6494: $15
    ld   l, d                                     ; $6495: $6A
    ld   e, h                                     ; $6496: $5C
    ld   l, d                                     ; $6497: $6A
    add  [hl]                                     ; $6498: $86
    ld   l, d                                     ; $6499: $6A
    xor  b                                        ; $649A: $A8
    ld   l, d                                     ; $649B: $6A
    ld   a, [c]                                   ; $649C: $F2
    ld   l, d                                     ; $649D: $6A
    jr   c, jr_01F_650B                           ; $649E: $38 $6B

    xor  a                                        ; $64A0: $AF
    ld   l, e                                     ; $64A1: $6B
    ld   e, $6C                                   ; $64A2: $1E $6C
    ld   d, a                                     ; $64A4: $57
    ld   l, h                                     ; $64A5: $6C
    and  h                                        ; $64A6: $A4
    ld   l, h                                     ; $64A7: $6C
    rst  $08                                      ; $64A8: $CF
    ld   l, h                                     ; $64A9: $6C
    ld   de, $16D                                 ; $64AA: $11 $6D $01
    ld   a, d                                     ; $64AD: $7A
    dec  sp                                       ; $64AE: $3B
    ld   l, l                                     ; $64AF: $6D
    ld   a, c                                     ; $64B0: $79
    ld   l, l                                     ; $64B1: $6D
    sbc  e                                        ; $64B2: $9B
    ld   l, l                                     ; $64B3: $6D
    cp   l                                        ; $64B4: $BD
    ld   l, l                                     ; $64B5: $6D
    ld   e, c                                     ; $64B6: $59
    ld   l, [hl]                                  ; $64B7: $6E
    adc  l                                        ; $64B8: $8D
    ld   l, [hl]                                  ; $64B9: $6E
    add  sp, $6E                                  ; $64BA: $E8 $6E
    inc  a                                        ; $64BC: $3C
    ld   l, a                                     ; $64BD: $6F
    add  e                                        ; $64BE: $83
    ld   l, a                                     ; $64BF: $6F
    db   $E3                                      ; $64C0: $E3
    ld   l, a                                     ; $64C1: $6F
    push af                                       ; $64C2: $F5
    ld   l, a                                     ; $64C3: $6F
    ld   a, [hl]                                  ; $64C4: $7E
    ld   [hl], b                                  ; $64C5: $70
    rst  $08                                      ; $64C6: $CF
    ld   [hl], b                                  ; $64C7: $70
    ld   a, [de]                                  ; $64C8: $1A
    ld   [hl], c                                  ; $64C9: $71
    inc  a                                        ; $64CA: $3C
    ld   [hl], c                                  ; $64CB: $71
    call func_01F_4471                            ; $64CC: $CD $71 $44
    ld   [hl], d                                  ; $64CF: $72
    sbc  e                                        ; $64D0: $9B
    ld   [hl], d                                  ; $64D1: $72
    db   $F4                                      ; $64D2: $F4
    ld   [hl], d                                  ; $64D3: $72
    sub  [hl]                                     ; $64D4: $96
    ld   [hl], h                                  ; $64D5: $74
    sbc  e                                        ; $64D6: $9B
    ld   [hl], l                                  ; $64D7: $75
    db   $EB                                      ; $64D8: $EB
    ld   [hl], l                                  ; $64D9: $75
    and  a                                        ; $64DA: $A7
    db   $76                                      ; $64DB: $76
    db   $10                                      ; $64DC: $10
    db   $76                                      ; $64DD: $76
    jr   nc, @+$79                                ; $64DE: $30 $77

    sub  b                                        ; $64E0: $90
    ld   [hl], a                                  ; $64E1: $77
    rlca                                          ; $64E2: $07
    ld   a, d                                     ; $64E3: $7A
    db   $EC                                      ; $64E4: $EC
    ld   [hl], a                                  ; $64E5: $77
    dec  bc                                       ; $64E6: $0B
    ld   a, c                                     ; $64E7: $79
    ld   h, c                                     ; $64E8: $61
    ld   a, c                                     ; $64E9: $79
    ld   hl, $217B                                ; $64EA: $21 $7B $21
    ld   a, b                                     ; $64ED: $78
    db   $D3                                      ; $64EE: $D3
    ld   a, [hl]                                  ; $64EF: $7E
    and  a                                        ; $64F0: $A7
    jr   z, jr_01F_6500                           ; $64F1: $28 $0D

    ld   a, [$D3C9]                               ; $64F3: $FA $C9 $D3
    and  a                                        ; $64F6: $A7
    jp   nz, label_01F_7A2C                       ; $64F7: $C2 $2C $7A

    ld   a, [hl]                                  ; $64FA: $7E
    ld   hl, $63EC                                ; $64FB: $21 $EC $63
    jr   jr_01F_6508                              ; $64FE: $18 $08

jr_01F_6500:
    inc  hl                                       ; $6500: $23
    ld   a, [hl]                                  ; $6501: $7E
    and  a                                        ; $6502: $A7
    jr   z, jr_01F_6512                           ; $6503: $28 $0D

    ld   hl, $646C                                ; $6505: $21 $6C $64

jr_01F_6508:
    call GetHandlerAddressInTable                 ; $6508: $CD $64 $7A

jr_01F_650B:
    ld   de, $D393                                ; $650B: $11 $93 $D3
    ld   bc, $D398                                ; $650E: $01 $98 $D3
    jp   hl                                       ; $6511: $E9

jr_01F_6512:
    ld   a, [$C50E]                               ; $6512: $FA $0E $C5
    and  a                                        ; $6515: $A7
    ret  z                                        ; $6516: $C8

    ld   a, $1E                                   ; $6517: $3E $1E
    ld   [wActiveNoiseSfx], a                     ; $6519: $EA $78 $D3
    jr   @-$30                                    ; $651C: $18 $CE

    ld   a, $01                                   ; $651E: $3E $01
    ld   [$D379], a                               ; $6520: $EA $79 $D3
    ld   hl, $6533                                ; $6523: $21 $33 $65
    jp   label_01F_7A8B                           ; $6526: $C3 $8B $7A

    xor  a                                        ; $6529: $AF
    ld   [$D379], a                               ; $652A: $EA $79 $D3
    ld   hl, $6538                                ; $652D: $21 $38 $65
    jp   label_01F_7A8B                           ; $6530: $C3 $8B $7A

    dec  sp                                       ; $6533: $3B
    add  b                                        ; $6534: $80
    rlca                                          ; $6535: $07
    ret  nz                                       ; $6536: $C0

    ld   bc, $4200                                ; $6537: $01 $00 $42
    ld   [bc], a                                  ; $653A: $02
    ret  nz                                       ; $653B: $C0

    inc  b                                        ; $653C: $04
    ld   hl, $6564                                ; $653D: $21 $64 $65
    jp   label_01F_79E9                           ; $6540: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6543: $CD $71 $7A
    ret  nz                                       ; $6546: $C0

    call IncrementValueAtBC                            ; $6547: $CD $75 $7A
    cp   $07                                      ; $654A: $FE $07
    jp   z, label_01F_7A07                        ; $654C: $CA $07 $7A

    ld   hl, $6558                                ; $654F: $21 $58 $65
    call GetHandlerAddressInTable                 ; $6552: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6555: $C3 $8B $7A

    ld   l, c                                     ; $6558: $69
    ld   h, l                                     ; $6559: $65
    ld   l, [hl]                                  ; $655A: $6E
    ld   h, l                                     ; $655B: $65
    ld   [hl], e                                  ; $655C: $73
    ld   h, l                                     ; $655D: $65
    ld   a, b                                     ; $655E: $78
    ld   h, l                                     ; $655F: $65
    ld   a, l                                     ; $6560: $7D
    ld   h, l                                     ; $6561: $65
    add  d                                        ; $6562: $82
    ld   h, l                                     ; $6563: $65
    nop                                           ; $6564: $00
    ld   b, b                                     ; $6565: $40
    ld   hl, $0180                                ; $6566: $21 $80 $01
    nop                                           ; $6569: $00
    ld   d, b                                     ; $656A: $50
    ld   [hl+], a                                 ; $656B: $22
    add  b                                        ; $656C: $80
    ld   bc, $6000                                ; $656D: $01 $00 $60
    inc  hl                                       ; $6570: $23
    add  b                                        ; $6571: $80
    ld   bc, $7000                                ; $6572: $01 $00 $70
    inc  h                                        ; $6575: $24
    add  b                                        ; $6576: $80
    ld   bc, vTiles0                              ; $6577: $01 $00 $80
    dec  h                                        ; $657A: $25
    add  b                                        ; $657B: $80
    ld   bc, vTiles2                              ; $657C: $01 $00 $90
    ld   h, $80                                   ; $657F: $26 $80
    ld   bc, $A03C                                ; $6581: $01 $3C $A0
    daa                                           ; $6584: $27
    ret  nz                                       ; $6585: $C0

    ld   bc, $C221                                ; $6586: $01 $21 $C2
    ld   h, l                                     ; $6589: $65
    jp   label_01F_79E9                           ; $658A: $C3 $E9 $79

    call DecrementValueAtDE                            ; $658D: $CD $71 $7A
    ret  nz                                       ; $6590: $C0

    call IncrementValueAtBC                            ; $6591: $CD $75 $7A
    cp   $11                                      ; $6594: $FE $11
    jp   z, label_01F_7A07                        ; $6596: $CA $07 $7A

    ld   hl, $65A2                                ; $6599: $21 $A2 $65
    call GetHandlerAddressInTable                 ; $659C: $CD $64 $7A
    jp   label_01F_7A8B                           ; $659F: $C3 $8B $7A

    rst  $00                                      ; $65A2: $C7
    ld   h, l                                     ; $65A3: $65
    call z, $D165                                 ; $65A4: $CC $65 $D1
    ld   h, l                                     ; $65A7: $65
    sub  $65                                      ; $65A8: $D6 $65
    db   $DB                                      ; $65AA: $DB
    ld   h, l                                     ; $65AB: $65
    ldh  [$FF65], a                               ; $65AC: $E0 $65
    push hl                                       ; $65AE: $E5
    ld   h, l                                     ; $65AF: $65
    ld   [$E565], a                               ; $65B0: $EA $65 $E5
    ld   h, l                                     ; $65B3: $65
    ldh  [$FF65], a                               ; $65B4: $E0 $65
    db   $DB                                      ; $65B6: $DB
    ld   h, l                                     ; $65B7: $65
    sub  $65                                      ; $65B8: $D6 $65
    pop  de                                       ; $65BA: $D1
    ld   h, l                                     ; $65BB: $65
    call z, $C765                                 ; $65BC: $CC $65 $C7
    ld   h, l                                     ; $65BF: $65
    jp   nz, $3765                                ; $65C0: $C2 $65 $37

    db   $10                                      ; $65C3: $10
    inc  b                                        ; $65C4: $04
    ret  nz                                       ; $65C5: $C0

    ld   [bc], a                                  ; $65C6: $02
    nop                                           ; $65C7: $00
    jr   nz, jr_01F_65D0                          ; $65C8: $20 $06

    add  b                                        ; $65CA: $80
    ld   [bc], a                                  ; $65CB: $02
    nop                                           ; $65CC: $00
    jr   nc, jr_01F_65E3                          ; $65CD: $30 $14

    add  b                                        ; $65CF: $80

jr_01F_65D0:
    ld   [bc], a                                  ; $65D0: $02
    nop                                           ; $65D1: $00
    ld   b, b                                     ; $65D2: $40
    ld   d, $80                                   ; $65D3: $16 $80
    ld   [bc], a                                  ; $65D5: $02
    nop                                           ; $65D6: $00
    ld   d, b                                     ; $65D7: $50
    inc  h                                        ; $65D8: $24
    add  b                                        ; $65D9: $80
    ld   [bc], a                                  ; $65DA: $02
    nop                                           ; $65DB: $00
    ld   h, b                                     ; $65DC: $60
    ld   h, $80                                   ; $65DD: $26 $80
    ld   [bc], a                                  ; $65DF: $02
    nop                                           ; $65E0: $00
    ld   [hl], b                                  ; $65E1: $70
    inc  [hl]                                     ; $65E2: $34

jr_01F_65E3:
    add  b                                        ; $65E3: $80
    ld   [bc], a                                  ; $65E4: $02
    nop                                           ; $65E5: $00
    add  b                                        ; $65E6: $80
    ld   [hl], $80                                ; $65E7: $36 $80
    ld   [bc], a                                  ; $65E9: $02
    nop                                           ; $65EA: $00
    sub  b                                        ; $65EB: $90
    ld   b, h                                     ; $65EC: $44
    add  b                                        ; $65ED: $80
    ld   [bc], a                                  ; $65EE: $02
    ld   hl, $6610                                ; $65EF: $21 $10 $66
    jp   label_01F_79E9                           ; $65F2: $C3 $E9 $79

    call DecrementValueAtDE                            ; $65F5: $CD $71 $7A
    ret  nz                                       ; $65F8: $C0

    call IncrementValueAtBC                            ; $65F9: $CD $75 $7A
    cp   $04                                      ; $65FC: $FE $04
    jp   z, label_01F_7A07                        ; $65FE: $CA $07 $7A

    ld   hl, $660A                                ; $6601: $21 $0A $66
    call GetHandlerAddressInTable                 ; $6604: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6607: $C3 $8B $7A

    dec  d                                        ; $660A: $15
    ld   h, [hl]                                  ; $660B: $66
    db   $10                                      ; $660C: $10
    ld   h, [hl]                                  ; $660D: $66
    ld   a, [de]                                  ; $660E: $1A
    ld   h, [hl]                                  ; $660F: $66
    dec  sp                                       ; $6610: $3B
    ret  nz                                       ; $6611: $C0

    ld   a, $C0                                   ; $6612: $3E $C0
    ld   bc, $F033                                ; $6614: $01 $33 $F0
    ld   l, [hl]                                  ; $6617: $6E
    ret  nz                                       ; $6618: $C0

    ld   b, $36                                   ; $6619: $06 $36
    ld   [hl], b                                  ; $661B: $70
    ld   c, [hl]                                  ; $661C: $4E
    ret  nz                                       ; $661D: $C0

    inc  bc                                       ; $661E: $03
    ld   a, [$D379]                               ; $661F: $FA $79 $D3
    cp   $02                                      ; $6622: $FE $02
    jp   z, label_01F_7A2C                        ; $6624: $CA $2C $7A

jr_01F_6627:
    cp   $03                                      ; $6627: $FE $03
    jp   z, label_01F_7A2C                        ; $6629: $CA $2C $7A

    cp   $0C                                      ; $662C: $FE $0C
    jp   z, label_01F_7A2C                        ; $662E: $CA $2C $7A

    cp   $13                                      ; $6631: $FE $13
    jp   z, label_01F_7A2C                        ; $6633: $CA $2C $7A

    ld   hl, $6659                                ; $6636: $21 $59 $66
    jp   label_01F_79E9                           ; $6639: $C3 $E9 $79

    call DecrementValueAtDE                            ; $663C: $CD $71 $7A
    ret  nz                                       ; $663F: $C0

    call IncrementValueAtBC                            ; $6640: $CD $75 $7A
    cp   $05                                      ; $6643: $FE $05
    jp   z, label_01F_7A07                        ; $6645: $CA $07 $7A

    ld   hl, $6651                                ; $6648: $21 $51 $66
    call GetHandlerAddressInTable                 ; $664B: $CD $64 $7A
    jp   label_01F_7A8B                           ; $664E: $C3 $8B $7A

    ld   e, [hl]                                  ; $6651: $5E
    ld   h, [hl]                                  ; $6652: $66
    ld   h, e                                     ; $6653: $63
    ld   h, [hl]                                  ; $6654: $66
    ld   l, b                                     ; $6655: $68
    ld   h, [hl]                                  ; $6656: $66
    ld   l, b                                     ; $6657: $68
    ld   h, [hl]                                  ; $6658: $66
    jr   nc, @+$4B                                ; $6659: $30 $49

    ld   h, b                                     ; $665B: $60
    ret  nz                                       ; $665C: $C0

    ld   b, $30                                   ; $665D: $06 $30
    ld   c, c                                     ; $665F: $49
    ld   b, b                                     ; $6660: $40
    ret  nz                                       ; $6661: $C0

    ld   b, $30                                   ; $6662: $06 $30
    ld   c, c                                     ; $6664: $49
    jr   nz, jr_01F_6627                          ; $6665: $20 $C0

    ld   b, $30                                   ; $6667: $06 $30
    ld   c, c                                     ; $6669: $49
    nop                                           ; $666A: $00
    ret  nz                                       ; $666B: $C0

    ld   b, $21                                   ; $666C: $06 $21
    adc  [hl]                                     ; $666E: $8E
    ld   h, [hl]                                  ; $666F: $66
    jp   label_01F_79E9                           ; $6670: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6673: $CD $71 $7A
    ret  nz                                       ; $6676: $C0

    call IncrementValueAtBC                            ; $6677: $CD $75 $7A
    cp   $04                                      ; $667A: $FE $04
    jp   z, label_01F_7A07                        ; $667C: $CA $07 $7A

    ld   hl, $6688                                ; $667F: $21 $88 $66
    call GetHandlerAddressInTable                 ; $6682: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6685: $C3 $8B $7A

    sub  e                                        ; $6688: $93
    ld   h, [hl]                                  ; $6689: $66
    sbc  b                                        ; $668A: $98
    ld   h, [hl]                                  ; $668B: $66
    sbc  l                                        ; $668C: $9D
    ld   h, [hl]                                  ; $668D: $66
    nop                                           ; $668E: $00
    ld   h, c                                     ; $668F: $61
    inc  h                                        ; $6690: $24
    add  b                                        ; $6691: $80
    inc  c                                        ; $6692: $0C
    nop                                           ; $6693: $00
    ld   d, c                                     ; $6694: $51
    dec  h                                        ; $6695: $25
    add  b                                        ; $6696: $80
    inc  c                                        ; $6697: $0C
    nop                                           ; $6698: $00
    ld   [hl-], a                                 ; $6699: $32
    daa                                           ; $669A: $27
    add  b                                        ; $669B: $80
    inc  c                                        ; $669C: $0C
    nop                                           ; $669D: $00
    ld   [hl+], a                                 ; $669E: $22

jr_01F_669F:
    inc  [hl]                                     ; $669F: $34
    add  b                                        ; $66A0: $80
    inc  c                                        ; $66A1: $0C
    ld   a, [$D379]                               ; $66A2: $FA $79 $D3
    cp   $05                                      ; $66A5: $FE $05
    jp   z, label_01F_7A2C                        ; $66A7: $CA $2C $7A

    cp   $08                                      ; $66AA: $FE $08
    jp   z, label_01F_7A2C                        ; $66AC: $CA $2C $7A

    cp   $0C                                      ; $66AF: $FE $0C
    jp   z, label_01F_7A2C                        ; $66B1: $CA $2C $7A

    cp   $10                                      ; $66B4: $FE $10
    jp   z, label_01F_7A2C                        ; $66B6: $CA $2C $7A

    cp   $13                                      ; $66B9: $FE $13
    jp   z, label_01F_7A2C                        ; $66BB: $CA $2C $7A

    ld   hl, $66D6                                ; $66BE: $21 $D6 $66
    jp   label_01F_79E9                           ; $66C1: $C3 $E9 $79

    call DecrementValueAtDE                            ; $66C4: $CD $71 $7A
    ret  nz                                       ; $66C7: $C0

    call IncrementValueAtBC                            ; $66C8: $CD $75 $7A
    cp   $02                                      ; $66CB: $FE $02
    jp   z, label_01F_7A07                        ; $66CD: $CA $07 $7A

    ld   hl, $66DB                                ; $66D0: $21 $DB $66
    jp   label_01F_7A8B                           ; $66D3: $C3 $8B $7A

    dec  sp                                       ; $66D6: $3B
    ldh  a, [rNR41]                               ; $66D7: $F0 $20
    ret  nz                                       ; $66D9: $C0

    ld   [bc], a                                  ; $66DA: $02
    add  hl, sp                                   ; $66DB: $39
    ld   b, b                                     ; $66DC: $40
    jr   nz, jr_01F_669F                          ; $66DD: $20 $C0

    ld   [$79FA], sp                              ; $66DF: $08 $FA $79
    db   $D3                                      ; $66E2: $D3
    cp   $0C                                      ; $66E3: $FE $0C
    jp   z, label_01F_7A2C                        ; $66E5: $CA $2C $7A

    ld   a, $03                                   ; $66E8: $3E $03
    ld   [$D3BF], a                               ; $66EA: $EA $BF $D3
    ld   hl, $6718                                ; $66ED: $21 $18 $67
    jp   label_01F_79E9                           ; $66F0: $C3 $E9 $79

    call DecrementValueAtDE                            ; $66F3: $CD $71 $7A
    ret  nz                                       ; $66F6: $C0

    call IncrementValueAtBC                            ; $66F7: $CD $75 $7A
    cp   $04                                      ; $66FA: $FE $04
    jr   z, jr_01F_6707                           ; $66FC: $28 $09

jr_01F_66FE:
    ld   hl, $6712                                ; $66FE: $21 $12 $67
    call GetHandlerAddressInTable                 ; $6701: $CD $64 $7A
    jp   $7A25                                    ; $6704: $C3 $25 $7A

jr_01F_6707:
    call func_01F_7AAC                            ; $6707: $CD $AC $7A
    jp   z, label_01F_7A07                        ; $670A: $CA $07 $7A

    ld   a, $01                                   ; $670D: $3E $01
    ld   [bc], a                                  ; $670F: $02
    jr   jr_01F_66FE                              ; $6710: $18 $EC

    dec  e                                        ; $6712: $1D
    ld   h, a                                     ; $6713: $67
    jr   nz, jr_01F_677D                          ; $6714: $20 $67

    inc  hl                                       ; $6716: $23
    ld   h, a                                     ; $6717: $67
    nop                                           ; $6718: $00
    and  e                                        ; $6719: $A3
    inc  a                                        ; $671A: $3C
    add  b                                        ; $671B: $80

jr_01F_671C:
    inc  bc                                       ; $671C: $03
    dec  a                                        ; $671D: $3D
    nop                                           ; $671E: $00
    inc  bc                                       ; $671F: $03
    ld   a, $00                                   ; $6720: $3E $00
    inc  bc                                       ; $6722: $03
    ccf                                           ; $6723: $3F
    nop                                           ; $6724: $00
    inc  bc                                       ; $6725: $03
    ld   hl, $674F                                ; $6726: $21 $4F $67
    jp   label_01F_79E9                           ; $6729: $C3 $E9 $79

    call DecrementValueAtDE                            ; $672C: $CD $71 $7A
    ret  nz                                       ; $672F: $C0

    ld   a, $33                                   ; $6730: $3E $33
    ldh  [rNR41], a                               ; $6732: $E0 $20
    call IncrementValueAtBC                            ; $6734: $CD $75 $7A
    cp   $06                                      ; $6737: $FE $06
    jp   z, label_01F_7A07                        ; $6739: $CA $07 $7A

    ld   hl, $6745                                ; $673C: $21 $45 $67
    call GetHandlerAddressInTable                 ; $673F: $CD $64 $7A
    jp   $7A25                                    ; $6742: $C3 $25 $7A

    ld   d, h                                     ; $6745: $54
    ld   h, a                                     ; $6746: $67
    ld   d, a                                     ; $6747: $57
    ld   h, a                                     ; $6748: $67
    ld   e, d                                     ; $6749: $5A
    ld   h, a                                     ; $674A: $67
    ld   e, l                                     ; $674B: $5D
    ld   h, a                                     ; $674C: $67
    ld   e, l                                     ; $674D: $5D
    ld   h, a                                     ; $674E: $67
    inc  sp                                       ; $674F: $33
    and  b                                        ; $6750: $A0
    ld   [hl], d                                  ; $6751: $72
    ret  nz                                       ; $6752: $C0

    inc  b                                        ; $6753: $04
    ld   d, d                                     ; $6754: $52
    ret  nz                                       ; $6755: $C0

    inc  b                                        ; $6756: $04
    ld   d, b                                     ; $6757: $50
    ret  nz                                       ; $6758: $C0

    inc  b                                        ; $6759: $04
    jr   nc, jr_01F_671C                          ; $675A: $30 $C0

    inc  b                                        ; $675C: $04
    db   $10                                      ; $675D: $10
    ret  nz                                       ; $675E: $C0

    inc  b                                        ; $675F: $04
    ld   hl, $6783                                ; $6760: $21 $83 $67
    jp   label_01F_79E9                           ; $6763: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6766: $CD $71 $7A
    ret  nz                                       ; $6769: $C0

    call IncrementValueAtBC                            ; $676A: $CD $75 $7A
    cp   $05                                      ; $676D: $FE $05
    jp   z, label_01F_7A07                        ; $676F: $CA $07 $7A

    ld   hl, $677B                                ; $6772: $21 $7B $67
    call GetHandlerAddressInTable                 ; $6775: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6778: $C3 $8B $7A

    adc  b                                        ; $677B: $88
    ld   h, a                                     ; $677C: $67

jr_01F_677D:
    adc  l                                        ; $677D: $8D
    ld   h, a                                     ; $677E: $67
    adc  b                                        ; $677F: $88
    ld   h, a                                     ; $6780: $67
    add  e                                        ; $6781: $83
    ld   h, a                                     ; $6782: $67
    scf                                           ; $6783: $37
    ld   b, b                                     ; $6784: $40
    ld   b, a                                     ; $6785: $47
    ret  nz                                       ; $6786: $C0

    ld   bc, $6000                                ; $6787: $01 $00 $60
    daa                                           ; $678A: $27
    add  b                                        ; $678B: $80
    ld   [bc], a                                  ; $678C: $02
    nop                                           ; $678D: $00
    and  b                                        ; $678E: $A0
    dec  d                                        ; $678F: $15
    add  b                                        ; $6790: $80
    ld   [bc], a                                  ; $6791: $02
    ld   hl, $67AA                                ; $6792: $21 $AA $67
    jp   label_01F_79E9                           ; $6795: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6798: $CD $71 $7A
    ret  nz                                       ; $679B: $C0

    call IncrementValueAtBC                            ; $679C: $CD $75 $7A
    cp   $02                                      ; $679F: $FE $02
    jp   z, label_01F_7A07                        ; $67A1: $CA $07 $7A

    ld   hl, $67AF                                ; $67A4: $21 $AF $67
    jp   label_01F_7A8B                           ; $67A7: $C3 $8B $7A

    inc  a                                        ; $67AA: $3C
    ret  nz                                       ; $67AB: $C0

    jr   @-$3E                                    ; $67AC: $18 $C0

    ld   bc, $603C                                ; $67AE: $01 $3C $60
    jr   @-$3E                                    ; $67B1: $18 $C0

    ld   [bc], a                                  ; $67B3: $02
    ld   a, [$D379]                               ; $67B4: $FA $79 $D3
    cp   $02                                      ; $67B7: $FE $02
    jp   z, label_01F_7A2C                        ; $67B9: $CA $2C $7A

    cp   $03                                      ; $67BC: $FE $03
    jp   z, label_01F_7A2C                        ; $67BE: $CA $2C $7A

    ld   hl, $67E4                                ; $67C1: $21 $E4 $67
    jp   label_01F_79E9                           ; $67C4: $C3 $E9 $79

    call DecrementValueAtDE                            ; $67C7: $CD $71 $7A
    ret  nz                                       ; $67CA: $C0

    call IncrementValueAtBC                            ; $67CB: $CD $75 $7A
    cp   $05                                      ; $67CE: $FE $05
    jp   z, label_01F_7A07                        ; $67D0: $CA $07 $7A

    ld   hl, $67DC                                ; $67D3: $21 $DC $67
    call GetHandlerAddressInTable                 ; $67D6: $CD $64 $7A
    jp   $7A25                                    ; $67D9: $C3 $25 $7A

    jp   hl                                       ; $67DC: $E9

    ld   h, a                                     ; $67DD: $67
    db   $EC                                      ; $67DE: $EC
    ld   h, a                                     ; $67DF: $67
    rst  $28                                      ; $67E0: $EF
    ld   h, a                                     ; $67E1: $67
    ld   a, [c]                                   ; $67E2: $F2
    ld   h, a                                     ; $67E3: $67
    nop                                           ; $67E4: $00
    add  $6A                                      ; $67E5: $C6 $6A
    add  b                                        ; $67E7: $80
    inc  b                                        ; $67E8: $04
    ld   l, e                                     ; $67E9: $6B
    nop                                           ; $67EA: $00
    dec  b                                        ; $67EB: $05
    ld   l, h                                     ; $67EC: $6C
    nop                                           ; $67ED: $00
    ld   b, $6D                                   ; $67EE: $06 $6D
    nop                                           ; $67F0: $00
    rlca                                          ; $67F1: $07
    ld   l, [hl]                                  ; $67F2: $6E
    nop                                           ; $67F3: $00
    jr   c, jr_01F_6834                           ; $67F4: $38 $3E

    ld   c, $EA                                   ; $67F6: $0E $EA
    cp   a                                        ; $67F8: $BF
    db   $D3                                      ; $67F9: $D3
    ld   hl, $6823                                ; $67FA: $21 $23 $68
    jp   label_01F_79E9                           ; $67FD: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6800: $CD $71 $7A
    ret  nz                                       ; $6803: $C0

    call IncrementValueAtBC                            ; $6804: $CD $75 $7A
    cp   $03                                      ; $6807: $FE $03
    jr   z, jr_01F_6814                           ; $6809: $28 $09

jr_01F_680B:
    ld   hl, $681F                                ; $680B: $21 $1F $68
    call GetHandlerAddressInTable                 ; $680E: $CD $64 $7A
    jp   $7A25                                    ; $6811: $C3 $25 $7A

jr_01F_6814:
    call func_01F_7AAC                            ; $6814: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $6817: $CA $01 $7A

    ld   a, $01                                   ; $681A: $3E $01
    ld   [bc], a                                  ; $681C: $02
    jr   jr_01F_680B                              ; $681D: $18 $EC

    jr   z, jr_01F_6889                           ; $681F: $28 $68

    dec  hl                                       ; $6821: $2B
    ld   l, b                                     ; $6822: $68
    nop                                           ; $6823: $00
    ld   h, a                                     ; $6824: $67
    rrca                                          ; $6825: $0F
    add  b                                        ; $6826: $80
    ld   [bc], a                                  ; $6827: $02
    ld   h, b                                     ; $6828: $60
    nop                                           ; $6829: $00
    ld   [bc], a                                  ; $682A: $02
    rrca                                          ; $682B: $0F
    nop                                           ; $682C: $00
    ld   [bc], a                                  ; $682D: $02
    ld   hl, $684D                                ; $682E: $21 $4D $68
    jp   label_01F_79E9                           ; $6831: $C3 $E9 $79

jr_01F_6834:
    call DecrementValueAtDE                            ; $6834: $CD $71 $7A
    ret  nz                                       ; $6837: $C0

    call IncrementValueAtBC                            ; $6838: $CD $75 $7A
    cp   $03                                      ; $683B: $FE $03
    jp   z, label_01F_7A07                        ; $683D: $CA $07 $7A

    ld   hl, $6849                                ; $6840: $21 $49 $68
    call GetHandlerAddressInTable                 ; $6843: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6846: $C3 $8B $7A

    ld   d, d                                     ; $6849: $52
    ld   l, b                                     ; $684A: $68
    ld   d, a                                     ; $684B: $57
    ld   l, b                                     ; $684C: $68
    ld   e, $29                                   ; $684D: $1E $29
    ld   b, [hl]                                  ; $684F: $46
    ret  nz                                       ; $6850: $C0

    stop                                          ; $6851: $10 $00
    add  hl, hl                                   ; $6853: $29
    ld   h, h                                     ; $6854: $64
    add  b                                        ; $6855: $80
    ld   [$8100], sp                              ; $6856: $08 $00 $81
    ld   h, h                                     ; $6859: $64
    add  b                                        ; $685A: $80
    ld   b, $FA                                   ; $685B: $06 $FA
    ld   a, c                                     ; $685D: $79
    db   $D3                                      ; $685E: $D3
    and  a                                        ; $685F: $A7
    jp   nz, label_01F_7A2C                       ; $6860: $C2 $2C $7A

    ld   hl, $6882                                ; $6863: $21 $82 $68
    jp   label_01F_79E9                           ; $6866: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6869: $CD $71 $7A
    ret  nz                                       ; $686C: $C0

    call IncrementValueAtBC                            ; $686D: $CD $75 $7A
    cp   $03                                      ; $6870: $FE $03
    jp   z, label_01F_7A07                        ; $6872: $CA $07 $7A

    ld   hl, $687E                                ; $6875: $21 $7E $68
    call GetHandlerAddressInTable                 ; $6878: $CD $64 $7A
    jp   label_01F_7A8B                           ; $687B: $C3 $8B $7A

    add  a                                        ; $687E: $87
    ld   l, b                                     ; $687F: $68
    adc  h                                        ; $6880: $8C
    ld   l, b                                     ; $6881: $68
    nop                                           ; $6882: $00
    rrca                                          ; $6883: $0F
    jr   nc, @-$7E                                ; $6884: $30 $80

    jr   nz, jr_01F_6888                          ; $6886: $20 $00

jr_01F_6888:
    ld   h, b                                     ; $6888: $60

jr_01F_6889:
    inc  bc                                       ; $6889: $03
    add  b                                        ; $688A: $80
    jr   nc, jr_01F_688D                          ; $688B: $30 $00

jr_01F_688D:
    ld   h, a                                     ; $688D: $67
    inc  bc                                       ; $688E: $03
    add  b                                        ; $688F: $80
    jr   nz, jr_01F_68D0                          ; $6890: $20 $3E

    inc  bc                                       ; $6892: $03
    ld   [$D3BF], a                               ; $6893: $EA $BF $D3
    ld   hl, $68D2                                ; $6896: $21 $D2 $68
    jp   label_01F_79E9                           ; $6899: $C3 $E9 $79

    call DecrementValueAtDE                            ; $689C: $CD $71 $7A
    ret  nz                                       ; $689F: $C0

    call IncrementValueAtBC                            ; $68A0: $CD $75 $7A
    cp   $06                                      ; $68A3: $FE $06
    jr   z, jr_01F_68B0                           ; $68A5: $28 $09

    ld   hl, $68C8                                ; $68A7: $21 $C8 $68
    call GetHandlerAddressInTable                 ; $68AA: $CD $64 $7A
    jp   $7A25                                    ; $68AD: $C3 $25 $7A

jr_01F_68B0:
    call func_01F_7AAC                            ; $68B0: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $68B3: $CA $01 $7A

    cp   $01                                      ; $68B6: $FE $01
    jr   z, jr_01F_68C3                           ; $68B8: $28 $09

    ld   hl, $68E6                                ; $68BA: $21 $E6 $68

jr_01F_68BD:
    ld   a, $01                                   ; $68BD: $3E $01
    ld   [bc], a                                  ; $68BF: $02
    jp   label_01F_7A8B                           ; $68C0: $C3 $8B $7A

jr_01F_68C3:
    ld   hl, $68EB                                ; $68C3: $21 $EB $68
    jr   jr_01F_68BD                              ; $68C6: $18 $F5

    rst  $10                                      ; $68C8: $D7
    ld   l, b                                     ; $68C9: $68
    jp   c, $DD68                                 ; $68CA: $DA $68 $DD

    ld   l, b                                     ; $68CD: $68
    ldh  [rBCPS], a                               ; $68CE: $E0 $68

jr_01F_68D0:
    db   $E3                                      ; $68D0: $E3
    ld   l, b                                     ; $68D1: $68
    nop                                           ; $68D2: $00
    ldh  [rOBP0], a                               ; $68D3: $E0 $48
    add  b                                        ; $68D5: $80
    ld   bc, $4B                                  ; $68D6: $01 $4B $00
    ld   bc, $5E                                  ; $68D9: $01 $5E $00
    ld   bc, $5D                                  ; $68DC: $01 $5D $00
    ld   [bc], a                                  ; $68DF: $02
    ld   l, h                                     ; $68E0: $6C
    nop                                           ; $68E1: $00
    ld   [bc], a                                  ; $68E2: $02
    ld   l, a                                     ; $68E3: $6F
    nop                                           ; $68E4: $00
    ld   [bc], a                                  ; $68E5: $02
    nop                                           ; $68E6: $00
    ld   [hl], b                                  ; $68E7: $70
    ld   c, e                                     ; $68E8: $4B
    add  b                                        ; $68E9: $80
    ld   bc, $2000                                ; $68EA: $01 $00 $20
    ld   c, e                                     ; $68ED: $4B
    add  b                                        ; $68EE: $80
    ld   bc, $FD21                                ; $68EF: $01 $21 $FD
    ld   l, b                                     ; $68F2: $68
    jp   label_01F_79E9                           ; $68F3: $C3 $E9 $79

    call DecrementValueAtDE                            ; $68F6: $CD $71 $7A
    ret  nz                                       ; $68F9: $C0

    jp   label_01F_7A01                           ; $68FA: $C3 $01 $7A

    nop                                           ; $68FD: $00
    ldh  a, [hLinkFinalPositionY]                 ; $68FE: $F0 $A0
    add  b                                        ; $6900: $80
    jr   nz, jr_01F_6924                          ; $6901: $20 $21

    dec  hl                                       ; $6903: $2B
    ld   l, c                                     ; $6904: $69
    jp   label_01F_79E9                           ; $6905: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6908: $CD $71 $7A
    ret  nz                                       ; $690B: $C0

    call IncrementValueAtBC                            ; $690C: $CD $75 $7A
    cp   $08                                      ; $690F: $FE $08
    jp   z, label_01F_7A01                        ; $6911: $CA $01 $7A

    ld   hl, $691D                                ; $6914: $21 $1D $69
    call GetHandlerAddressInTable                 ; $6917: $CD $64 $7A
    jp   $7A25                                    ; $691A: $C3 $25 $7A

    jr   nc, jr_01F_6988                          ; $691D: $30 $69

    inc  sp                                       ; $691F: $33
    ld   l, c                                     ; $6920: $69
    ld   [hl], $69                                ; $6921: $36 $69
    inc  sp                                       ; $6923: $33

jr_01F_6924:
    ld   l, c                                     ; $6924: $69
    jr   nc, jr_01F_6990                          ; $6925: $30 $69

    add  hl, sp                                   ; $6927: $39
    ld   l, c                                     ; $6928: $69
    inc  a                                        ; $6929: $3C
    ld   l, c                                     ; $692A: $69
    nop                                           ; $692B: $00
    ld   l, c                                     ; $692C: $69
    cp   b                                        ; $692D: $B8
    add  b                                        ; $692E: $80
    ld   [bc], a                                  ; $692F: $02
    xor  b                                        ; $6930: $A8
    nop                                           ; $6931: $00
    ld   [bc], a                                  ; $6932: $02
    sbc  b                                        ; $6933: $98
    nop                                           ; $6934: $00
    ld   [bc], a                                  ; $6935: $02
    adc  b                                        ; $6936: $88
    nop                                           ; $6937: $00
    ld   [bc], a                                  ; $6938: $02
    cp   b                                        ; $6939: $B8
    nop                                           ; $693A: $00
    ld   [bc], a                                  ; $693B: $02
    ret  z                                        ; $693C: $C8

    nop                                           ; $693D: $00
    ld   [bc], a                                  ; $693E: $02
    ld   hl, $699C                                ; $693F: $21 $9C $69
    jp   label_01F_79E9                           ; $6942: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6945: $CD $71 $7A
    ret  nz                                       ; $6948: $C0

    call IncrementValueAtBC                            ; $6949: $CD $75 $7A
    cp   $1A                                      ; $694C: $FE $1A
    jp   z, label_01F_7A07                        ; $694E: $CA $07 $7A

    ld   hl, $696A                                ; $6951: $21 $6A $69
    call GetHandlerAddressInTable                 ; $6954: $CD $64 $7A
    ld   a, [$D398]                               ; $6957: $FA $98 $D3
    cp   $11                                      ; $695A: $FE $11
    jr   nc, jr_01F_6961                          ; $695C: $30 $03

    jp   label_01F_7A8B                           ; $695E: $C3 $8B $7A

jr_01F_6961:
    inc  hl                                       ; $6961: $23
    inc  hl                                       ; $6962: $23
    ld   a, $20                                   ; $6963: $3E $20
    ldh  [rNR42], a                               ; $6965: $E0 $21
    jp   $7A25                                    ; $6967: $C3 $25 $7A

    and  c                                        ; $696A: $A1
    ld   l, c                                     ; $696B: $69
    and  [hl]                                     ; $696C: $A6
    ld   l, c                                     ; $696D: $69
    xor  e                                        ; $696E: $AB
    ld   l, c                                     ; $696F: $69
    or   b                                        ; $6970: $B0
    ld   l, c                                     ; $6971: $69
    or   l                                        ; $6972: $B5
    ld   l, c                                     ; $6973: $69
    cp   d                                        ; $6974: $BA
    ld   l, c                                     ; $6975: $69
    cp   a                                        ; $6976: $BF
    ld   l, c                                     ; $6977: $69
    call nz, $BF69                                ; $6978: $C4 $69 $BF
    ld   l, c                                     ; $697B: $69
    cp   d                                        ; $697C: $BA
    ld   l, c                                     ; $697D: $69
    or   l                                        ; $697E: $B5
    ld   l, c                                     ; $697F: $69
    or   b                                        ; $6980: $B0
    ld   l, c                                     ; $6981: $69
    xor  e                                        ; $6982: $AB
    ld   l, c                                     ; $6983: $69
    and  [hl]                                     ; $6984: $A6
    ld   l, c                                     ; $6985: $69
    and  c                                        ; $6986: $A1
    ld   l, c                                     ; $6987: $69

jr_01F_6988:
    sbc  h                                        ; $6988: $9C
    ld   l, c                                     ; $6989: $69
    call nz, $BF69                                ; $698A: $C4 $69 $BF
    ld   l, c                                     ; $698D: $69
    cp   d                                        ; $698E: $BA
    ld   l, c                                     ; $698F: $69

jr_01F_6990:
    or   l                                        ; $6990: $B5
    ld   l, c                                     ; $6991: $69
    or   b                                        ; $6992: $B0
    ld   l, c                                     ; $6993: $69
    xor  e                                        ; $6994: $AB
    ld   l, c                                     ; $6995: $69
    and  [hl]                                     ; $6996: $A6
    ld   l, c                                     ; $6997: $69
    and  c                                        ; $6998: $A1
    ld   l, c                                     ; $6999: $69
    sbc  h                                        ; $699A: $9C
    ld   l, c                                     ; $699B: $69
    scf                                           ; $699C: $37
    jr   nz, jr_01F_69C4                          ; $699D: $20 $25

    ret  nz                                       ; $699F: $C0

    ld   bc, $4000                                ; $69A0: $01 $00 $40
    daa                                           ; $69A3: $27
    add  b                                        ; $69A4: $80
    ld   bc, $6000                                ; $69A5: $01 $00 $60
    dec  [hl]                                     ; $69A8: $35
    add  b                                        ; $69A9: $80
    ld   bc, vTiles0                              ; $69AA: $01 $00 $80
    scf                                           ; $69AD: $37
    add  b                                        ; $69AE: $80
    ld   bc, $A000                                ; $69AF: $01 $00 $A0
    ld   c, l                                     ; $69B2: $4D
    add  b                                        ; $69B3: $80
    ld   [bc], a                                  ; $69B4: $02
    nop                                           ; $69B5: $00
    or   b                                        ; $69B6: $B0
    ld   c, a                                     ; $69B7: $4F
    add  b                                        ; $69B8: $80
    ld   [bc], a                                  ; $69B9: $02
    nop                                           ; $69BA: $00
    ret  nz                                       ; $69BB: $C0

    ld   e, l                                     ; $69BC: $5D
    add  b                                        ; $69BD: $80
    ld   [bc], a                                  ; $69BE: $02
    nop                                           ; $69BF: $00
    ret  nc                                       ; $69C0: $D0

    ld   e, a                                     ; $69C1: $5F
    add  b                                        ; $69C2: $80
    ld   [bc], a                                  ; $69C3: $02

jr_01F_69C4:
    nop                                           ; $69C4: $00
    ldh  [$FF6D], a                               ; $69C5: $E0 $6D
    add  b                                        ; $69C7: $80
    ld   [bc], a                                  ; $69C8: $02
    ld   hl, $69EC                                ; $69C9: $21 $EC $69
    jp   label_01F_79E9                           ; $69CC: $C3 $E9 $79

    call IncrementValueAtBC                            ; $69CF: $CD $75 $7A
    cp   $07                                      ; $69D2: $FE $07
    jp   z, label_01F_7A07                        ; $69D4: $CA $07 $7A

    ld   hl, $69E0                                ; $69D7: $21 $E0 $69
    call GetHandlerAddressInTable                 ; $69DA: $CD $64 $7A
    jp   label_01F_7A8B                           ; $69DD: $C3 $8B $7A

    pop  af                                       ; $69E0: $F1
    ld   l, c                                     ; $69E1: $69
    or   $69                                      ; $69E2: $F6 $69
    ei                                            ; $69E4: $FB
    ld   l, c                                     ; $69E5: $69
    nop                                           ; $69E6: $00
    ld   l, d                                     ; $69E7: $6A
    dec  b                                        ; $69E8: $05
    ld   l, d                                     ; $69E9: $6A
    ld   a, [bc]                                  ; $69EA: $0A
    ld   l, d                                     ; $69EB: $6A
    nop                                           ; $69EC: $00
    ld   b, b                                     ; $69ED: $40
    ld   e, a                                     ; $69EE: $5F
    add  b                                        ; $69EF: $80
    ld   bc, $5000                                ; $69F0: $01 $00 $50
    ld   e, l                                     ; $69F3: $5D
    add  b                                        ; $69F4: $80
    ld   bc, $6000                                ; $69F5: $01 $00 $60
    ld   c, a                                     ; $69F8: $4F
    add  b                                        ; $69F9: $80
    ld   bc, $7000                                ; $69FA: $01 $00 $70
    ld   c, l                                     ; $69FD: $4D
    add  b                                        ; $69FE: $80
    ld   bc, vTiles0                              ; $69FF: $01 $00 $80
    ccf                                           ; $6A02: $3F
    add  b                                        ; $6A03: $80
    ld   bc, vTiles2                              ; $6A04: $01 $00 $90
    inc  a                                        ; $6A07: $3C
    add  b                                        ; $6A08: $80
    ld   bc, $A03C                                ; $6A09: $01 $3C $A0
    ld   l, $C0                                   ; $6A0C: $2E $C0
    ld   bc, $3021                                ; $6A0E: $01 $21 $30
    ld   l, d                                     ; $6A11: $6A
    jp   label_01F_79E9                           ; $6A12: $C3 $E9 $79

    call IncrementValueAtBC                            ; $6A15: $CD $75 $7A
    cp   $06                                      ; $6A18: $FE $06
    jp   z, label_01F_7A07                        ; $6A1A: $CA $07 $7A

    ld   hl, $6A26                                ; $6A1D: $21 $26 $6A
    call GetHandlerAddressInTable                 ; $6A20: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6A23: $C3 $8B $7A

    dec  [hl]                                     ; $6A26: $35
    ld   l, d                                     ; $6A27: $6A
    ld   a, [hl-]                                 ; $6A28: $3A
    ld   l, d                                     ; $6A29: $6A
    ccf                                           ; $6A2A: $3F
    ld   l, d                                     ; $6A2B: $6A
    ld   b, h                                     ; $6A2C: $44
    ld   l, d                                     ; $6A2D: $6A
    ld   c, c                                     ; $6A2E: $49
    ld   l, d                                     ; $6A2F: $6A
    nop                                           ; $6A30: $00
    jr   nz, jr_01F_6A7A                          ; $6A31: $20 $47

    add  b                                        ; $6A33: $80
    ld   [bc], a                                  ; $6A34: $02
    nop                                           ; $6A35: $00
    ld   b, b                                     ; $6A36: $40
    scf                                           ; $6A37: $37
    add  b                                        ; $6A38: $80
    ld   bc, $6000                                ; $6A39: $01 $00 $60
    daa                                           ; $6A3C: $27
    add  b                                        ; $6A3D: $80
    ld   bc, vTiles0                              ; $6A3E: $01 $00 $80
    rla                                           ; $6A41: $17
    add  b                                        ; $6A42: $80
    ld   bc, $A000                                ; $6A43: $01 $00 $A0
    rlca                                          ; $6A46: $07
    add  b                                        ; $6A47: $80
    ld   bc, $C03C                                ; $6A48: $01 $3C $C0
    inc  bc                                       ; $6A4B: $03
    ret  nz                                       ; $6A4C: $C0

    ld   bc, $79FA                                ; $6A4D: $01 $FA $79
    db   $D3                                      ; $6A50: $D3
    cp   $03                                      ; $6A51: $FE $03
    jp   z, label_01F_7A2C                        ; $6A53: $CA $2C $7A

    ld   hl, $6A71                                ; $6A56: $21 $71 $6A
    jp   label_01F_79E9                           ; $6A59: $C3 $E9 $79

    call IncrementValueAtBC                            ; $6A5C: $CD $75 $7A
    cp   $03                                      ; $6A5F: $FE $03
    jp   z, label_01F_7A07                        ; $6A61: $CA $07 $7A

    ld   hl, $6A6D                                ; $6A64: $21 $6D $6A
    call GetHandlerAddressInTable                 ; $6A67: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6A6A: $C3 $8B $7A

    db   $76                                      ; $6A6D: $76
    ld   l, d                                     ; $6A6E: $6A
    ld   a, e                                     ; $6A6F: $7B
    ld   l, d                                     ; $6A70: $6A
    nop                                           ; $6A71: $00
    add  hl, hl                                   ; $6A72: $29
    ld   l, b                                     ; $6A73: $68
    add  b                                        ; $6A74: $80
    db   $10                                      ; $6A75: $10
    inc  a                                        ; $6A76: $3C
    ret  nz                                       ; $6A77: $C0

    ld   d, b                                     ; $6A78: $50
    ret  nz                                       ; $6A79: $C0

jr_01F_6A7A:
    ld   bc, $C13C                                ; $6A7A: $01 $3C $C1
    jr   @-$3E                                    ; $6A7D: $18 $C0

    ld   bc, $9821                                ; $6A7F: $01 $21 $98
    ld   l, d                                     ; $6A82: $6A
    jp   label_01F_79E9                           ; $6A83: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6A86: $CD $71 $7A
    ret  nz                                       ; $6A89: $C0

    call IncrementValueAtBC                            ; $6A8A: $CD $75 $7A
    cp   $02                                      ; $6A8D: $FE $02
    jp   z, label_01F_7A07                        ; $6A8F: $CA $07 $7A

    ld   hl, $6A9D                                ; $6A92: $21 $9D $6A
    jp   label_01F_7A8B                           ; $6A95: $C3 $8B $7A

    nop                                           ; $6A98: $00
    pop  af                                       ; $6A99: $F1
    add  hl, bc                                   ; $6A9A: $09
    add  b                                        ; $6A9B: $80
    ld   c, $00                                   ; $6A9C: $0E $00
    ld   h, d                                     ; $6A9E: $62
    add  hl, bc                                   ; $6A9F: $09
    add  b                                        ; $6AA0: $80
    db   $10                                      ; $6AA1: $10
    ld   hl, $6AC9                                ; $6AA2: $21 $C9 $6A
    jp   label_01F_79E9                           ; $6AA5: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6AA8: $CD $71 $7A
    ret  nz                                       ; $6AAB: $C0

    call IncrementValueAtBC                            ; $6AAC: $CD $75 $7A
    cp   $07                                      ; $6AAF: $FE $07
    jp   z, label_01F_7A07                        ; $6AB1: $CA $07 $7A

    ld   hl, $6ABD                                ; $6AB4: $21 $BD $6A
    call GetHandlerAddressInTable                 ; $6AB7: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6ABA: $C3 $8B $7A

    adc  $6A                                      ; $6ABD: $CE $6A
    db   $D3                                      ; $6ABF: $D3
    ld   l, d                                     ; $6AC0: $6A
    ret  c                                        ; $6AC1: $D8

    ld   l, d                                     ; $6AC2: $6A
    db   $DD                                      ; $6AC3: $DD
    ld   l, d                                     ; $6AC4: $6A
    ld   [c], a                                   ; $6AC5: $E2
    ld   l, d                                     ; $6AC6: $6A
    rst  $20                                      ; $6AC7: $E7
    ld   l, d                                     ; $6AC8: $6A
    nop                                           ; $6AC9: $00
    jr   nz, @+$13                                ; $6ACA: $20 $11

    add  b                                        ; $6ACC: $80
    ld   bc, $4000                                ; $6ACD: $01 $00 $40
    ld   hl, $0180                                ; $6AD0: $21 $80 $01
    nop                                           ; $6AD3: $00
    ld   h, b                                     ; $6AD4: $60
    add  hl, sp                                   ; $6AD5: $39
    add  b                                        ; $6AD6: $80
    ld   bc, vTiles0                              ; $6AD7: $01 $00 $80
    ld   c, c                                     ; $6ADA: $49
    add  b                                        ; $6ADB: $80
    ld   bc, $A000                                ; $6ADC: $01 $00 $A0
    ld   c, e                                     ; $6ADF: $4B
    add  b                                        ; $6AE0: $80
    ld   bc, wOAMBuffer                           ; $6AE1: $01 $00 $C0
    ld   c, l                                     ; $6AE4: $4D
    add  b                                        ; $6AE5: $80
    ld   bc, $E03C                                ; $6AE6: $01 $3C $E0
    ld   c, a                                     ; $6AE9: $4F
    ret  nz                                       ; $6AEA: $C0

    ld   bc, $1B21                                ; $6AEB: $01 $21 $1B
    ld   l, e                                     ; $6AEE: $6B
    jp   label_01F_79E9                           ; $6AEF: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6AF2: $CD $71 $7A
    ret  nz                                       ; $6AF5: $C0

    call IncrementValueAtBC                            ; $6AF6: $CD $75 $7A
    cp   $0B                                      ; $6AF9: $FE $0B
    jp   z, label_01F_7A07                        ; $6AFB: $CA $07 $7A

    ld   hl, $6B07                                ; $6AFE: $21 $07 $6B
    call GetHandlerAddressInTable                 ; $6B01: $CD $64 $7A
    jp   $7A25                                    ; $6B04: $C3 $25 $7A

    jr   nz, jr_01F_6B74                          ; $6B07: $20 $6B

    inc  hl                                       ; $6B09: $23
    ld   l, e                                     ; $6B0A: $6B
    ld   h, $6B                                   ; $6B0B: $26 $6B
    add  hl, hl                                   ; $6B0D: $29
    ld   l, e                                     ; $6B0E: $6B
    inc  l                                        ; $6B0F: $2C
    ld   l, e                                     ; $6B10: $6B
    add  hl, hl                                   ; $6B11: $29
    ld   l, e                                     ; $6B12: $6B
    ld   h, $6B                                   ; $6B13: $26 $6B
    inc  hl                                       ; $6B15: $23
    ld   l, e                                     ; $6B16: $6B
    jr   nz, jr_01F_6B84                          ; $6B17: $20 $6B

    cpl                                           ; $6B19: $2F
    ld   l, e                                     ; $6B1A: $6B
    nop                                           ; $6B1B: $00
    ld   h, a                                     ; $6B1C: $67
    inc  l                                        ; $6B1D: $2C
    add  b                                        ; $6B1E: $80
    ld   bc, $3C                                  ; $6B1F: $01 $3C $00
    ld   bc, $4C                                  ; $6B22: $01 $4C $00
    ld   bc, $5C                                  ; $6B25: $01 $5C $00
    ld   bc, $6C                                  ; $6B28: $01 $6C $00
    ld   bc, $7C                                  ; $6B2B: $01 $7C $00
    ld   bc, $8009                                ; $6B2E: $01 $09 $80
    jr   nc, jr_01F_6B54                          ; $6B31: $30 $21

    ld   [hl], a                                  ; $6B33: $77
    ld   l, e                                     ; $6B34: $6B
    jp   label_01F_79E4                           ; $6B35: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6B38: $CD $71 $7A
    ret  nz                                       ; $6B3B: $C0

    call IncrementValueAtBC                            ; $6B3C: $CD $75 $7A
    cp   $16                                      ; $6B3F: $FE $16
    jp   z, label_01F_7A07                        ; $6B41: $CA $07 $7A

    ld   hl, $6B4D                                ; $6B44: $21 $4D $6B
    call GetHandlerAddressInTable                 ; $6B47: $CD $64 $7A
    jp   $7A25                                    ; $6B4A: $C3 $25 $7A

    ld   a, h                                     ; $6B4D: $7C
    ld   l, e                                     ; $6B4E: $6B
    ld   a, a                                     ; $6B4F: $7F
    ld   l, e                                     ; $6B50: $6B
    add  d                                        ; $6B51: $82
    ld   l, e                                     ; $6B52: $6B
    add  l                                        ; $6B53: $85

jr_01F_6B54:
    ld   l, e                                     ; $6B54: $6B
    adc  b                                        ; $6B55: $88
    ld   l, e                                     ; $6B56: $6B
    add  l                                        ; $6B57: $85
    ld   l, e                                     ; $6B58: $6B
    add  d                                        ; $6B59: $82
    ld   l, e                                     ; $6B5A: $6B
    ld   a, a                                     ; $6B5B: $7F
    ld   l, e                                     ; $6B5C: $6B
    add  d                                        ; $6B5D: $82
    ld   l, e                                     ; $6B5E: $6B
    add  l                                        ; $6B5F: $85
    ld   l, e                                     ; $6B60: $6B
    adc  b                                        ; $6B61: $88
    ld   l, e                                     ; $6B62: $6B
    adc  e                                        ; $6B63: $8B
    ld   l, e                                     ; $6B64: $6B
    adc  [hl]                                     ; $6B65: $8E
    ld   l, e                                     ; $6B66: $6B
    adc  e                                        ; $6B67: $8B
    ld   l, e                                     ; $6B68: $6B
    adc  b                                        ; $6B69: $88
    ld   l, e                                     ; $6B6A: $6B
    add  l                                        ; $6B6B: $85
    ld   l, e                                     ; $6B6C: $6B
    adc  b                                        ; $6B6D: $88
    ld   l, e                                     ; $6B6E: $6B
    adc  e                                        ; $6B6F: $8B
    ld   l, e                                     ; $6B70: $6B
    adc  [hl]                                     ; $6B71: $8E
    ld   l, e                                     ; $6B72: $6B
    sub  c                                        ; $6B73: $91

jr_01F_6B74:
    ld   l, e                                     ; $6B74: $6B
    sub  h                                        ; $6B75: $94
    ld   l, e                                     ; $6B76: $6B
    nop                                           ; $6B77: $00
    rst  $30                                      ; $6B78: $F7

jr_01F_6B79:
    dec  a                                        ; $6B79: $3D
    add  b                                        ; $6B7A: $80
    inc  b                                        ; $6B7B: $04
    ld   h, b                                     ; $6B7C: $60
    nop                                           ; $6B7D: $00
    inc  b                                        ; $6B7E: $04
    ld   h, c                                     ; $6B7F: $61
    nop                                           ; $6B80: $00
    inc  b                                        ; $6B81: $04
    ld   h, d                                     ; $6B82: $62
    nop                                           ; $6B83: $00

jr_01F_6B84:
    inc  b                                        ; $6B84: $04
    ld   h, e                                     ; $6B85: $63
    nop                                           ; $6B86: $00
    inc  b                                        ; $6B87: $04
    ld   h, h                                     ; $6B88: $64
    nop                                           ; $6B89: $00
    inc  b                                        ; $6B8A: $04
    ld   h, l                                     ; $6B8B: $65
    nop                                           ; $6B8C: $00

jr_01F_6B8D:
    inc  b                                        ; $6B8D: $04
    ld   h, [hl]                                  ; $6B8E: $66
    nop                                           ; $6B8F: $00
    inc  b                                        ; $6B90: $04
    ld   h, a                                     ; $6B91: $67

jr_01F_6B92:
    nop                                           ; $6B92: $00
    inc  b                                        ; $6B93: $04
    ld   [hl], h                                  ; $6B94: $74
    nop                                           ; $6B95: $00
    jr   z, jr_01F_6B92                           ; $6B96: $28 $FA

    ld   a, c                                     ; $6B98: $79
    db   $D3                                      ; $6B99: $D3
    and  a                                        ; $6B9A: $A7
    jp   nz, label_01F_7A2C                       ; $6B9B: $C2 $2C $7A

    ld   a, [$D3D6]                               ; $6B9E: $FA $D6 $D3
    and  a                                        ; $6BA1: $A7
    jr   nz, jr_01F_6BAA                          ; $6BA2: $20 $06

    ld   hl, $6BF5                                ; $6BA4: $21 $F5 $6B

jr_01F_6BA7:
    jp   label_01F_79E9                           ; $6BA7: $C3 $E9 $79

jr_01F_6BAA:
    ld   hl, $6C09                                ; $6BAA: $21 $09 $6C
    jr   jr_01F_6BA7                              ; $6BAD: $18 $F8

    call DecrementValueAtDE                            ; $6BAF: $CD $71 $7A
    ret  nz                                       ; $6BB2: $C0

    call IncrementValueAtBC                            ; $6BB3: $CD $75 $7A
    cp   $03                                      ; $6BB6: $FE $03
    jr   z, jr_01F_6BD4                           ; $6BB8: $28 $1A

    cp   $06                                      ; $6BBA: $FE $06
    jp   z, label_01F_6BDD                        ; $6BBC: $CA $DD $6B

    ld   a, [$D3D6]                               ; $6BBF: $FA $D6 $D3
    and  a                                        ; $6BC2: $A7
    jr   nz, jr_01F_6BCF                          ; $6BC3: $20 $0A

jr_01F_6BC5:
    ld   hl, $6BE7                                ; $6BC5: $21 $E7 $6B

jr_01F_6BC8:
    ld   a, [bc]                                  ; $6BC8: $0A
    call GetHandlerAddressInTable                 ; $6BC9: $CD $64 $7A
    jp   label_01F_7A8B                           ; $6BCC: $C3 $8B $7A

jr_01F_6BCF:
    ld   hl, $6BF1                                ; $6BCF: $21 $F1 $6B
    jr   jr_01F_6BC8                              ; $6BD2: $18 $F4

jr_01F_6BD4:
    ld   a, [$D3D6]                               ; $6BD4: $FA $D6 $D3
    and  a                                        ; $6BD7: $A7
    jp   nz, label_01F_6BDD                       ; $6BD8: $C2 $DD $6B

    jr   jr_01F_6BC5                              ; $6BDB: $18 $E8

label_01F_6BDD:
    ld   hl, wActiveNoiseSfx                      ; $6BDD: $21 $78 $D3
    ld   a, $1B                                   ; $6BE0: $3E $1B
    ld   [hl+], a                                 ; $6BE2: $22
    xor  a                                        ; $6BE3: $AF
    ld   [hl], a                                  ; $6BE4: $77
    jr   @-$4E                                    ; $6BE5: $18 $B0

    rst  $38                                      ; $6BE7: $FF
    ld   l, e                                     ; $6BE8: $6B
    ld   a, [$046B]                               ; $6BE9: $FA $6B $04
    ld   l, h                                     ; $6BEC: $6C
    ld   a, [$046B]                               ; $6BED: $FA $6B $04
    ld   l, h                                     ; $6BF0: $6C
    ld   c, $6C                                   ; $6BF1: $0E $6C
    ld   c, $6C                                   ; $6BF3: $0E $6C
    scf                                           ; $6BF5: $37
    ld   h, c                                     ; $6BF6: $61
    jr   nc, jr_01F_6B79                          ; $6BF7: $30 $80

    inc  bc                                       ; $6BF9: $03
    scf                                           ; $6BFA: $37
    ld   b, c                                     ; $6BFB: $41
    inc  d                                        ; $6BFC: $14
    add  b                                        ; $6BFD: $80
    inc  bc                                       ; $6BFE: $03
    scf                                           ; $6BFF: $37
    jr   nz, jr_01F_6C32                          ; $6C00: $20 $30

    ret  nz                                       ; $6C02: $C0

    ld   [bc], a                                  ; $6C03: $02
    scf                                           ; $6C04: $37
    jr   nz, jr_01F_6C1B                          ; $6C05: $20 $14

    ret  nz                                       ; $6C07: $C0

    ld   [bc], a                                  ; $6C08: $02
    scf                                           ; $6C09: $37
    and  c                                        ; $6C0A: $A1
    jr   nc, jr_01F_6B8D                          ; $6C0B: $30 $80

    inc  b                                        ; $6C0D: $04
    scf                                           ; $6C0E: $37
    ld   d, c                                     ; $6C0F: $51
    inc  d                                        ; $6C10: $14
    add  b                                        ; $6C11: $80
    inc  b                                        ; $6C12: $04
    ld   a, $06                                   ; $6C13: $3E $06
    ld   [$D3BF], a                               ; $6C15: $EA $BF $D3
    ld   hl, $6C41                                ; $6C18: $21 $41 $6C

jr_01F_6C1B:
    jp   label_01F_79E9                           ; $6C1B: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6C1E: $CD $71 $7A
    ret  nz                                       ; $6C21: $C0

    call IncrementValueAtBC                            ; $6C22: $CD $75 $7A
    cp   $03                                      ; $6C25: $FE $03
    jr   z, jr_01F_6C32                           ; $6C27: $28 $09

jr_01F_6C29:
    ld   hl, $6C3D                                ; $6C29: $21 $3D $6C
    call GetHandlerAddressInTable                 ; $6C2C: $CD $64 $7A
    jp   $7A25                                    ; $6C2F: $C3 $25 $7A

jr_01F_6C32:
    call func_01F_7AAC                            ; $6C32: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $6C35: $CA $01 $7A

    ld   a, $01                                   ; $6C38: $3E $01
    ld   [bc], a                                  ; $6C3A: $02
    jr   jr_01F_6C29                              ; $6C3B: $18 $EC

    ld   b, [hl]                                  ; $6C3D: $46
    ld   l, h                                     ; $6C3E: $6C
    ld   c, c                                     ; $6C3F: $49
    ld   l, h                                     ; $6C40: $6C
    nop                                           ; $6C41: $00
    ret  nz                                       ; $6C42: $C0

    ld   e, b                                     ; $6C43: $58
    add  b                                        ; $6C44: $80
    ld   [bc], a                                  ; $6C45: $02
    ld   l, b                                     ; $6C46: $68
    add  b                                        ; $6C47: $80
    ld   [bc], a                                  ; $6C48: $02
    ld   e, b                                     ; $6C49: $58
    add  b                                        ; $6C4A: $80
    ld   [bc], a                                  ; $6C4B: $02
    ld   a, $78                                   ; $6C4C: $3E $78
    ld   [$D3BF], a                               ; $6C4E: $EA $BF $D3
    ld   hl, $6C87                                ; $6C51: $21 $87 $6C
    jp   label_01F_79E4                           ; $6C54: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6C57: $CD $71 $7A
    ret  nz                                       ; $6C5A: $C0

    call IncrementValueAtBC                            ; $6C5B: $CD $75 $7A
    cp   $03                                      ; $6C5E: $FE $03
    jr   z, jr_01F_6C6B                           ; $6C60: $28 $09

jr_01F_6C62:
    ld   hl, $6C83                                ; $6C62: $21 $83 $6C
    call GetHandlerAddressInTable                 ; $6C65: $CD $64 $7A
    jp   $7A25                                    ; $6C68: $C3 $25 $7A

jr_01F_6C6B:
    call func_01F_7AAC                            ; $6C6B: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $6C6E: $CA $01 $7A

    cp   $18                                      ; $6C71: $FE $18
    jr   z, jr_01F_6C7A                           ; $6C73: $28 $05

    ld   a, $01                                   ; $6C75: $3E $01
    ld   [bc], a                                  ; $6C77: $02
    jr   jr_01F_6C62                              ; $6C78: $18 $E8

jr_01F_6C7A:
    ld   a, $01                                   ; $6C7A: $3E $01
    ld   [bc], a                                  ; $6C7C: $02
    ld   hl, $6C8C                                ; $6C7D: $21 $8C $6C
    jp   label_01F_7A8B                           ; $6C80: $C3 $8B $7A

    sub  c                                        ; $6C83: $91
    ld   l, h                                     ; $6C84: $6C
    sub  h                                        ; $6C85: $94
    ld   l, h                                     ; $6C86: $6C
    nop                                           ; $6C87: $00
    inc  l                                        ; $6C88: $2C
    ld   a, h                                     ; $6C89: $7C
    add  b                                        ; $6C8A: $80
    ld   [bc], a                                  ; $6C8B: $02
    nop                                           ; $6C8C: $00
    rst  $30                                      ; $6C8D: $F7
    ld   a, h                                     ; $6C8E: $7C
    add  b                                        ; $6C8F: $80
    ld   [bc], a                                  ; $6C90: $02
    ld   a, l                                     ; $6C91: $7D
    nop                                           ; $6C92: $00
    ld   [bc], a                                  ; $6C93: $02
    ld   a, h                                     ; $6C94: $7C
    nop                                           ; $6C95: $00
    ld   [bc], a                                  ; $6C96: $02
    ld   a, [$D379]                               ; $6C97: $FA $79 $D3
    and  a                                        ; $6C9A: $A7
    jp   nz, label_01F_7A2C                       ; $6C9B: $C2 $2C $7A

    ld   hl, $6CBA                                ; $6C9E: $21 $BA $6C
    jp   label_01F_79E9                           ; $6CA1: $C3 $E9 $79

    ld   a, [$C50E]                               ; $6CA4: $FA $0E $C5
    and  a                                        ; $6CA7: $A7
    jr   z, jr_01F_6CB1                           ; $6CA8: $28 $07

    call DecrementValueAtDE                            ; $6CAA: $CD $71 $7A
    ret  nz                                       ; $6CAD: $C0

    jp   label_01F_7A07                           ; $6CAE: $C3 $07 $7A

jr_01F_6CB1:
    ld   hl, $6CBF                                ; $6CB1: $21 $BF $6C
    call func_01F_7A8B                            ; $6CB4: $CD $8B $7A
    jp   label_01F_7A07                           ; $6CB7: $C3 $07 $7A

    ld   [$0060], sp                              ; $6CBA: $08 $60 $00
    ret  nz                                       ; $6CBD: $C0

    inc  c                                        ; $6CBE: $0C
    nop                                           ; $6CBF: $00
    ld   h, a                                     ; $6CC0: $67
    nop                                           ; $6CC1: $00
    nop                                           ; $6CC2: $00
    jr   nz, @+$40                                ; $6CC3: $20 $3E

    inc  d                                        ; $6CC5: $14
    ld   [$D3BF], a                               ; $6CC6: $EA $BF $D3
    ld   hl, $6CFB                                ; $6CC9: $21 $FB $6C
    jp   label_01F_79E9                           ; $6CCC: $C3 $E9 $79

    call IncrementValueAtBC                            ; $6CCF: $CD $75 $7A
    cp   $03                                      ; $6CD2: $FE $03
    jr   z, jr_01F_6CDF                           ; $6CD4: $28 $09

jr_01F_6CD6:
    ld   hl, $6CF7                                ; $6CD6: $21 $F7 $6C
    call GetHandlerAddressInTable                 ; $6CD9: $CD $64 $7A
    jp   $7A25                                    ; $6CDC: $C3 $25 $7A

jr_01F_6CDF:
    call func_01F_7AAC                            ; $6CDF: $CD $AC $7A
    jp   z, label_01F_7A07                        ; $6CE2: $CA $07 $7A

    cp   $0E                                      ; $6CE5: $FE $0E
    jr   z, jr_01F_6CEE                           ; $6CE7: $28 $05

    ld   a, $01                                   ; $6CE9: $3E $01
    ld   [bc], a                                  ; $6CEB: $02
    jr   jr_01F_6CD6                              ; $6CEC: $18 $E8

jr_01F_6CEE:
    ld   a, $01                                   ; $6CEE: $3E $01
    ld   [bc], a                                  ; $6CF0: $02
    ld   hl, $6D00                                ; $6CF1: $21 $00 $6D
    jp   label_01F_7A8B                           ; $6CF4: $C3 $8B $7A

    dec  b                                        ; $6CF7: $05
    ld   l, l                                     ; $6CF8: $6D
    ld   [$006D], sp                              ; $6CF9: $08 $6D $00
    ld   a, [de]                                  ; $6CFC: $1A
    ld   b, $80                                   ; $6CFD: $06 $80
    ld   bc, $6400                                ; $6CFF: $01 $00 $64
    ld   b, $80                                   ; $6D02: $06 $80
    ld   bc, $06                                  ; $6D04: $01 $06 $00
    ld   bc, $48                                  ; $6D07: $01 $48 $00
    ld   bc, $2A21                                ; $6D0A: $01 $21 $2A
    ld   l, l                                     ; $6D0D: $6D
    jp   label_01F_79E9                           ; $6D0E: $C3 $E9 $79

    call IncrementValueAtBC                            ; $6D11: $CD $75 $7A
    cp   $03                                      ; $6D14: $FE $03
    jr   z, jr_01F_6D21                           ; $6D16: $28 $09

jr_01F_6D18:
    ld   hl, $6D26                                ; $6D18: $21 $26 $6D
    call GetHandlerAddressInTable                 ; $6D1B: $CD $64 $7A
    jp   $7A25                                    ; $6D1E: $C3 $25 $7A

jr_01F_6D21:
    ld   a, $01                                   ; $6D21: $3E $01
    ld   [bc], a                                  ; $6D23: $02
    jr   jr_01F_6D18                              ; $6D24: $18 $F2

    cpl                                           ; $6D26: $2F
    ld   l, l                                     ; $6D27: $6D
    ld   [hl-], a                                 ; $6D28: $32
    ld   l, l                                     ; $6D29: $6D
    nop                                           ; $6D2A: $00
    ld   d, b                                     ; $6D2B: $50
    dec  bc                                       ; $6D2C: $0B
    add  b                                        ; $6D2D: $80
    ld   bc, $0C                                  ; $6D2E: $01 $0C $00
    ld   bc, $0B                                  ; $6D31: $01 $0B $00
    ld   bc, $6021                                ; $6D34: $01 $21 $60
    ld   l, l                                     ; $6D37: $6D
    jp   label_01F_79E4                           ; $6D38: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6D3B: $CD $71 $7A
    ret  nz                                       ; $6D3E: $C0

    call IncrementValueAtBC                            ; $6D3F: $CD $75 $7A
    cp   $05                                      ; $6D42: $FE $05
    jp   z, label_01F_7A07                        ; $6D44: $CA $07 $7A

    ld   hl, $6D58                                ; $6D47: $21 $58 $6D
    call GetHandlerAddressInTable                 ; $6D4A: $CD $64 $7A
    ld   a, [$D398]                               ; $6D4D: $FA $98 $D3
    cp   $01                                      ; $6D50: $FE $01
    jp   z, label_01F_7A8B                        ; $6D52: $CA $8B $7A

    jp   $7A25                                    ; $6D55: $C3 $25 $7A

    ld   h, l                                     ; $6D58: $65
    ld   l, l                                     ; $6D59: $6D
    ld   l, d                                     ; $6D5A: $6A
    ld   l, l                                     ; $6D5B: $6D
    ld   l, l                                     ; $6D5C: $6D
    ld   l, l                                     ; $6D5D: $6D
    ld   [hl], b                                  ; $6D5E: $70
    ld   l, l                                     ; $6D5F: $6D
    nop                                           ; $6D60: $00
    rrca                                          ; $6D61: $0F
    ld   h, b                                     ; $6D62: $60
    add  b                                        ; $6D63: $80
    jr   c, jr_01F_6D66                           ; $6D64: $38 $00

jr_01F_6D66:
    or   $60                                      ; $6D66: $F6 $60
    add  b                                        ; $6D68: $80
    inc  c                                        ; $6D69: $0C
    ld   h, c                                     ; $6D6A: $61
    nop                                           ; $6D6B: $00
    inc  c                                        ; $6D6C: $0C
    ld   h, d                                     ; $6D6D: $62
    nop                                           ; $6D6E: $00
    inc  c                                        ; $6D6F: $0C
    ld   h, e                                     ; $6D70: $63
    nop                                           ; $6D71: $00
    jr   c, jr_01F_6D95                           ; $6D72: $38 $21

    adc  e                                        ; $6D74: $8B
    ld   l, l                                     ; $6D75: $6D
    jp   label_01F_79E4                           ; $6D76: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6D79: $CD $71 $7A
    ret  nz                                       ; $6D7C: $C0

    call IncrementValueAtBC                            ; $6D7D: $CD $75 $7A
    cp   $02                                      ; $6D80: $FE $02
    jp   z, label_01F_7A01                        ; $6D82: $CA $01 $7A

    ld   hl, $6D90                                ; $6D85: $21 $90 $6D
    jp   label_01F_7A8B                           ; $6D88: $C3 $8B $7A

    nop                                           ; $6D8B: $00
    rrca                                          ; $6D8C: $0F
    xor  b                                        ; $6D8D: $A8
    add  b                                        ; $6D8E: $80
    and  b                                        ; $6D8F: $A0
    nop                                           ; $6D90: $00
    rst  $30                                      ; $6D91: $F7
    xor  b                                        ; $6D92: $A8
    add  b                                        ; $6D93: $80
    ld   h, b                                     ; $6D94: $60

jr_01F_6D95:
    ld   hl, $6DAD                                ; $6D95: $21 $AD $6D
    jp   label_01F_79E9                           ; $6D98: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6D9B: $CD $71 $7A
    ret  nz                                       ; $6D9E: $C0

    call IncrementValueAtBC                            ; $6D9F: $CD $75 $7A
    cp   $02                                      ; $6DA2: $FE $02
    jp   z, label_01F_7A07                        ; $6DA4: $CA $07 $7A

    ld   hl, $6DB2                                ; $6DA7: $21 $B2 $6D
    jp   label_01F_7A8B                           ; $6DAA: $C3 $8B $7A

    nop                                           ; $6DAD: $00
    add  hl, hl                                   ; $6DAE: $29
    rlca                                          ; $6DAF: $07
    add  b                                        ; $6DB0: $80
    ld   [$A700], sp                              ; $6DB1: $08 $00 $A7
    dec  b                                        ; $6DB4: $05
    add  b                                        ; $6DB5: $80
    ld   d, b                                     ; $6DB6: $50
    ld   hl, $6E20                                ; $6DB7: $21 $20 $6E
    jp   label_01F_79E4                           ; $6DBA: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6DBD: $CD $71 $7A
    ret  nz                                       ; $6DC0: $C0

    call IncrementValueAtBC                            ; $6DC1: $CD $75 $7A
    cp   $24                                      ; $6DC4: $FE $24
    jp   z, label_01F_7A01                        ; $6DC6: $CA $01 $7A

    ld   hl, $6DDA                                ; $6DC9: $21 $DA $6D
    call GetHandlerAddressInTable                 ; $6DCC: $CD $64 $7A
    ld   a, [$D398]                               ; $6DCF: $FA $98 $D3
    cp   $1E                                      ; $6DD2: $FE $1E
    jp   z, label_01F_7A8B                        ; $6DD4: $CA $8B $7A

    jp   $7A25                                    ; $6DD7: $C3 $25 $7A

    dec  hl                                       ; $6DDA: $2B
    ld   l, [hl]                                  ; $6DDB: $6E
    ld   l, $6E                                   ; $6DDC: $2E $6E
    ld   sp, $2E6E                                ; $6DDE: $31 $6E $2E
    ld   l, [hl]                                  ; $6DE1: $6E
    dec  hl                                       ; $6DE2: $2B
    ld   l, [hl]                                  ; $6DE3: $6E
    jr   z, @+$70                                 ; $6DE4: $28 $6E

    dec  hl                                       ; $6DE6: $2B
    ld   l, [hl]                                  ; $6DE7: $6E
    ld   l, $6E                                   ; $6DE8: $2E $6E
    ld   sp, $2E6E                                ; $6DEA: $31 $6E $2E
    ld   l, [hl]                                  ; $6DED: $6E
    dec  hl                                       ; $6DEE: $2B
    ld   l, [hl]                                  ; $6DEF: $6E
    jr   z, jr_01F_6E60                           ; $6DF0: $28 $6E

    dec  hl                                       ; $6DF2: $2B
    ld   l, [hl]                                  ; $6DF3: $6E
    ld   sp, $346E                                ; $6DF4: $31 $6E $34
    ld   l, [hl]                                  ; $6DF7: $6E
    ld   sp, $2B6E                                ; $6DF8: $31 $6E $2B
    ld   l, [hl]                                  ; $6DFB: $6E
    jr   z, @+$70                                 ; $6DFC: $28 $6E

    dec  hl                                       ; $6DFE: $2B
    ld   l, [hl]                                  ; $6DFF: $6E
    ld   sp, $346E                                ; $6E00: $31 $6E $34
    ld   l, [hl]                                  ; $6E03: $6E
    ld   sp, $2B6E                                ; $6E04: $31 $6E $2B
    ld   l, [hl]                                  ; $6E07: $6E
    dec  h                                        ; $6E08: $25
    ld   l, [hl]                                  ; $6E09: $6E
    dec  hl                                       ; $6E0A: $2B
    ld   l, [hl]                                  ; $6E0B: $6E
    ld   l, $6E                                   ; $6E0C: $2E $6E
    ld   sp, $346E                                ; $6E0E: $31 $6E $34
    ld   l, [hl]                                  ; $6E11: $6E
    scf                                           ; $6E12: $37
    ld   l, [hl]                                  ; $6E13: $6E
    ld   a, [hl-]                                 ; $6E14: $3A
    ld   l, [hl]                                  ; $6E15: $6E
    ccf                                           ; $6E16: $3F
    ld   l, [hl]                                  ; $6E17: $6E
    ld   b, d                                     ; $6E18: $42
    ld   l, [hl]                                  ; $6E19: $6E
    ld   b, l                                     ; $6E1A: $45
    ld   l, [hl]                                  ; $6E1B: $6E
    ld   c, b                                     ; $6E1C: $48
    ld   l, [hl]                                  ; $6E1D: $6E
    ld   c, e                                     ; $6E1E: $4B
    ld   l, [hl]                                  ; $6E1F: $6E
    nop                                           ; $6E20: $00
    ldh  a, [$FF8C]                               ; $6E21: $F0 $8C
    add  b                                        ; $6E23: $80
    ld   e, h                                     ; $6E24: $5C
    adc  h                                        ; $6E25: $8C
    nop                                           ; $6E26: $00
    ld   [$008C], sp                              ; $6E27: $08 $8C $00
    inc  c                                        ; $6E2A: $0C
    ld   a, [hl]                                  ; $6E2B: $7E
    nop                                           ; $6E2C: $00
    inc  b                                        ; $6E2D: $04
    ld   a, h                                     ; $6E2E: $7C
    nop                                           ; $6E2F: $00
    inc  b                                        ; $6E30: $04
    ld   l, [hl]                                  ; $6E31: $6E
    nop                                           ; $6E32: $00
    inc  b                                        ; $6E33: $04
    ld   l, l                                     ; $6E34: $6D
    nop                                           ; $6E35: $00
    inc  b                                        ; $6E36: $04
    ld   l, h                                     ; $6E37: $6C
    nop                                           ; $6E38: $00
    inc  b                                        ; $6E39: $04
    nop                                           ; $6E3A: $00
    rst  $30                                      ; $6E3B: $F7
    ld   l, e                                     ; $6E3C: $6B
    add  b                                        ; $6E3D: $80
    inc  c                                        ; $6E3E: $0C
    ld   l, h                                     ; $6E3F: $6C
    nop                                           ; $6E40: $00
    inc  c                                        ; $6E41: $0C
    ld   l, l                                     ; $6E42: $6D
    nop                                           ; $6E43: $00
    inc  c                                        ; $6E44: $0C
    ld   l, [hl]                                  ; $6E45: $6E
    nop                                           ; $6E46: $00
    inc  c                                        ; $6E47: $0C
    ld   a, h                                     ; $6E48: $7C
    nop                                           ; $6E49: $00
    inc  c                                        ; $6E4A: $0C
    ld   a, [hl]                                  ; $6E4B: $7E
    nop                                           ; $6E4C: $00
    inc  [hl]                                     ; $6E4D: $34
    ld   a, $40                                   ; $6E4E: $3E $40
    ld   [$D3BF], a                               ; $6E50: $EA $BF $D3
    ld   hl, $6E7C                                ; $6E53: $21 $7C $6E
    jp   label_01F_79E9                           ; $6E56: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6E59: $CD $71 $7A
    ret  nz                                       ; $6E5C: $C0

    call IncrementValueAtBC                            ; $6E5D: $CD $75 $7A

jr_01F_6E60:
    cp   $03                                      ; $6E60: $FE $03
    jr   z, jr_01F_6E6D                           ; $6E62: $28 $09

jr_01F_6E64:
    ld   hl, $6E78                                ; $6E64: $21 $78 $6E
    call GetHandlerAddressInTable                 ; $6E67: $CD $64 $7A
    jp   $7A25                                    ; $6E6A: $C3 $25 $7A

jr_01F_6E6D:
    call func_01F_7AAC                            ; $6E6D: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $6E70: $CA $01 $7A

    ld   a, $01                                   ; $6E73: $3E $01
    ld   [bc], a                                  ; $6E75: $02
    jr   jr_01F_6E64                              ; $6E76: $18 $EC

    add  c                                        ; $6E78: $81
    ld   l, [hl]                                  ; $6E79: $6E
    add  h                                        ; $6E7A: $84
    ld   l, [hl]                                  ; $6E7B: $6E
    nop                                           ; $6E7C: $00
    add  b                                        ; $6E7D: $80
    ld   a, [hl-]                                 ; $6E7E: $3A
    add  b                                        ; $6E7F: $80
    ld   bc, $8039                                ; $6E80: $01 $39 $80
    ld   [bc], a                                  ; $6E83: $02
    ld   a, [hl-]                                 ; $6E84: $3A
    add  b                                        ; $6E85: $80
    ld   bc, $BA21                                ; $6E86: $01 $21 $BA
    ld   l, [hl]                                  ; $6E89: $6E
    jp   label_01F_79E9                           ; $6E8A: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6E8D: $CD $71 $7A
    ret  nz                                       ; $6E90: $C0

    call IncrementValueAtBC                            ; $6E91: $CD $75 $7A
    cp   $0D                                      ; $6E94: $FE $0D
    jp   z, label_01F_7A07                        ; $6E96: $CA $07 $7A

    ld   hl, $6EA2                                ; $6E99: $21 $A2 $6E
    call GetHandlerAddressInTable                 ; $6E9C: $CD $64 $7A
    jp   $7A25                                    ; $6E9F: $C3 $25 $7A

    cp   a                                        ; $6EA2: $BF
    ld   l, [hl]                                  ; $6EA3: $6E
    jp   nz, $C56E                                ; $6EA4: $C2 $6E $C5

    ld   l, [hl]                                  ; $6EA7: $6E
    jp   nz, $BF6E                                ; $6EA8: $C2 $6E $BF

    ld   l, [hl]                                  ; $6EAB: $6E
    ret  z                                        ; $6EAC: $C8

    ld   l, [hl]                                  ; $6EAD: $6E
    bit  5, [hl]                                  ; $6EAE: $CB $6E
    adc  $6E                                      ; $6EB0: $CE $6E
    pop  de                                       ; $6EB2: $D1
    ld   l, [hl]                                  ; $6EB3: $6E
    call nc, $D76E                                ; $6EB4: $D4 $6E $D7
    ld   l, [hl]                                  ; $6EB7: $6E
    jp   c, $006E                                 ; $6EB8: $DA $6E $00

    jp   nz, $805D                                ; $6EBB: $C2 $5D $80

    ld   bc, $5C                                  ; $6EBE: $01 $5C $00
    ld   bc, $4F                                  ; $6EC1: $01 $4F $00
    ld   bc, $4E                                  ; $6EC4: $01 $4E $00
    ld   bc, $5D                                  ; $6EC7: $01 $5D $00
    ld   bc, $5E                                  ; $6ECA: $01 $5E $00
    ld   bc, $5F                                  ; $6ECD: $01 $5F $00
    ld   bc, $6C                                  ; $6ED0: $01 $6C $00
    ld   bc, $6D                                  ; $6ED3: $01 $6D $00
    ld   bc, $6E                                  ; $6ED6: $01 $6E $00
    ld   bc, $6F                                  ; $6ED9: $01 $6F $00
    db   $10                                      ; $6EDC: $10
    ld   a, $05                                   ; $6EDD: $3E $05
    ld   [$D3BF], a                               ; $6EDF: $EA $BF $D3
    ld   hl, $6F1D                                ; $6EE2: $21 $1D $6F
    jp   label_01F_79E9                           ; $6EE5: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6EE8: $CD $71 $7A
    ret  nz                                       ; $6EEB: $C0

    call IncrementValueAtBC                            ; $6EEC: $CD $75 $7A
    cp   $0C                                      ; $6EEF: $FE $0C
    jr   z, jr_01F_6EFC                           ; $6EF1: $28 $09

jr_01F_6EF3:
    ld   hl, $6F07                                ; $6EF3: $21 $07 $6F
    call GetHandlerAddressInTable                 ; $6EF6: $CD $64 $7A
    jp   $7A25                                    ; $6EF9: $C3 $25 $7A

jr_01F_6EFC:
    call func_01F_7AAC                            ; $6EFC: $CD $AC $7A
    jp   z, label_01F_7A07                        ; $6EFF: $CA $07 $7A

    ld   a, $04                                   ; $6F02: $3E $04
    ld   [bc], a                                  ; $6F04: $02
    jr   jr_01F_6EF3                              ; $6F05: $18 $EC

    dec  h                                        ; $6F07: $25
    ld   l, a                                     ; $6F08: $6F
    jr   z, jr_01F_6F7A                           ; $6F09: $28 $6F

    dec  hl                                       ; $6F0B: $2B
    ld   l, a                                     ; $6F0C: $6F
    ld   l, $6F                                   ; $6F0D: $2E $6F
    dec  hl                                       ; $6F0F: $2B
    ld   l, a                                     ; $6F10: $6F
    jr   z, @+$71                                 ; $6F11: $28 $6F

    dec  h                                        ; $6F13: $25
    ld   l, a                                     ; $6F14: $6F
    ld   [hl+], a                                 ; $6F15: $22
    ld   l, a                                     ; $6F16: $6F
    dec  h                                        ; $6F17: $25
    ld   l, a                                     ; $6F18: $6F
    jr   z, jr_01F_6F8A                           ; $6F19: $28 $6F

    dec  hl                                       ; $6F1B: $2B
    ld   l, a                                     ; $6F1C: $6F
    nop                                           ; $6F1D: $00
    ld   h, a                                     ; $6F1E: $67
    ld   l, h                                     ; $6F1F: $6C
    add  b                                        ; $6F20: $80
    ld   bc, $6C                                  ; $6F21: $01 $6C $00
    ld   bc, $6B                                  ; $6F24: $01 $6B $00
    ld   bc, $6A                                  ; $6F27: $01 $6A $00
    ld   bc, $69                                  ; $6F2A: $01 $69 $00
    ld   bc, $68                                  ; $6F2D: $01 $68 $00
    ld   [bc], a                                  ; $6F30: $02
    ld   a, $05                                   ; $6F31: $3E $05
    ld   [$D3BF], a                               ; $6F33: $EA $BF $D3
    ld   hl, $6F67                                ; $6F36: $21 $67 $6F
    jp   label_01F_79E4                           ; $6F39: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6F3C: $CD $71 $7A
    ret  nz                                       ; $6F3F: $C0

    call IncrementValueAtBC                            ; $6F40: $CD $75 $7A
    cp   $07                                      ; $6F43: $FE $07
    jr   z, jr_01F_6F50                           ; $6F45: $28 $09

jr_01F_6F47:
    ld   hl, $6F5B                                ; $6F47: $21 $5B $6F
    call GetHandlerAddressInTable                 ; $6F4A: $CD $64 $7A
    jp   $7A25                                    ; $6F4D: $C3 $25 $7A

jr_01F_6F50:
    call func_01F_7AAC                            ; $6F50: $CD $AC $7A
    jp   z, label_01F_7A07                        ; $6F53: $CA $07 $7A

    ld   a, $01                                   ; $6F56: $3E $01
    ld   [bc], a                                  ; $6F58: $02
    jr   jr_01F_6F47                              ; $6F59: $18 $EC

    ld   l, h                                     ; $6F5B: $6C
    ld   l, a                                     ; $6F5C: $6F
    ld   l, a                                     ; $6F5D: $6F
    ld   l, a                                     ; $6F5E: $6F
    ld   l, h                                     ; $6F5F: $6C
    ld   l, a                                     ; $6F60: $6F
    ld   [hl], d                                  ; $6F61: $72
    ld   l, a                                     ; $6F62: $6F
    ld   l, h                                     ; $6F63: $6C
    ld   l, a                                     ; $6F64: $6F
    ld   [hl], l                                  ; $6F65: $75
    ld   l, a                                     ; $6F66: $6F
    nop                                           ; $6F67: $00
    db   $F4                                      ; $6F68: $F4
    ld   l, b                                     ; $6F69: $68
    add  b                                        ; $6F6A: $80
    ld   [bc], a                                  ; $6F6B: $02
    ld   l, a                                     ; $6F6C: $6F
    nop                                           ; $6F6D: $00
    ld   [bc], a                                  ; $6F6E: $02
    ld   l, c                                     ; $6F6F: $69
    nop                                           ; $6F70: $00
    ld   [bc], a                                  ; $6F71: $02
    ld   l, d                                     ; $6F72: $6A
    nop                                           ; $6F73: $00
    ld   [bc], a                                  ; $6F74: $02
    ld   l, b                                     ; $6F75: $68
    nop                                           ; $6F76: $00
    ld   [bc], a                                  ; $6F77: $02
    ld   a, $08                                   ; $6F78: $3E $08

jr_01F_6F7A:
    ld   [$D3BF], a                               ; $6F7A: $EA $BF $D3
    ld   hl, $6FBE                                ; $6F7D: $21 $BE $6F
    jp   label_01F_79E4                           ; $6F80: $C3 $E4 $79

    call DecrementValueAtDE                            ; $6F83: $CD $71 $7A
    ret  nz                                       ; $6F86: $C0

    call IncrementValueAtBC                            ; $6F87: $CD $75 $7A

jr_01F_6F8A:
    cp   $0A                                      ; $6F8A: $FE $0A
    jr   z, jr_01F_6F9F                           ; $6F8C: $28 $11

jr_01F_6F8E:
    ld   hl, $6FAA                                ; $6F8E: $21 $AA $6F
    call GetHandlerAddressInTable                 ; $6F91: $CD $64 $7A
    ld   a, [$D398]                               ; $6F94: $FA $98 $D3
    cp   $01                                      ; $6F97: $FE $01
    jp   z, label_01F_7A8B                        ; $6F99: $CA $8B $7A

    jp   $7A25                                    ; $6F9C: $C3 $25 $7A

jr_01F_6F9F:
    call func_01F_7AAC                            ; $6F9F: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $6FA2: $CA $01 $7A

    ld   a, $02                                   ; $6FA5: $3E $02
    ld   [bc], a                                  ; $6FA7: $02
    jr   jr_01F_6F8E                              ; $6FA8: $18 $E4

    jp   $C86F                                    ; $6FAA: $C3 $6F $C8

    ld   l, a                                     ; $6FAD: $6F
    adc  $6F                                      ; $6FAE: $CE $6F
    call nc, $DA6F                                ; $6FB0: $D4 $6F $DA
    ld   l, a                                     ; $6FB3: $6F
    rst  $10                                      ; $6FB4: $D7
    ld   l, a                                     ; $6FB5: $6F
    call nc, $D16F                                ; $6FB6: $D4 $6F $D1
    ld   l, a                                     ; $6FB9: $6F
    adc  $6F                                      ; $6FBA: $CE $6F
    bit  5, a                                     ; $6FBC: $CB $6F
    nop                                           ; $6FBE: $00
    ret  nz                                       ; $6FBF: $C0

    ld   a, a                                     ; $6FC0: $7F
    add  b                                        ; $6FC1: $80
    adc  b                                        ; $6FC2: $88
    nop                                           ; $6FC3: $00
    db   $F4                                      ; $6FC4: $F4
    ld   l, l                                     ; $6FC5: $6D
    add  b                                        ; $6FC6: $80
    ld   bc, $74                                  ; $6FC7: $01 $74 $00
    ld   bc, $5F                                  ; $6FCA: $01 $5F $00
    ld   bc, $66                                  ; $6FCD: $01 $66 $00
    ld   bc, $5D                                  ; $6FD0: $01 $5D $00
    ld   bc, $64                                  ; $6FD3: $01 $64 $00
    ld   bc, $4F                                  ; $6FD6: $01 $4F $00
    ld   bc, $62                                  ; $6FD9: $01 $62 $00
    ld   bc, $EA21                                ; $6FDC: $01 $21 $EA
    ld   l, a                                     ; $6FDF: $6F
    jp   label_01F_79E9                           ; $6FE0: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6FE3: $CD $71 $7A
    ret  nz                                       ; $6FE6: $C0

    jp   label_01F_7A07                           ; $6FE7: $C3 $07 $7A

    nop                                           ; $6FEA: $00
    db   $F4                                      ; $6FEB: $F4
    ld   a, l                                     ; $6FEC: $7D
    add  b                                        ; $6FED: $80
    ld   b, b                                     ; $6FEE: $40
    ld   hl, $7038                                ; $6FEF: $21 $38 $70
    jp   label_01F_79E9                           ; $6FF2: $C3 $E9 $79

    call DecrementValueAtDE                            ; $6FF5: $CD $71 $7A
    ret  nz                                       ; $6FF8: $C0

    call IncrementValueAtBC                            ; $6FF9: $CD $75 $7A
    cp   $14                                      ; $6FFC: $FE $14
    jp   z, label_01F_7A01                        ; $6FFE: $CA $01 $7A

    ld   hl, $7012                                ; $7001: $21 $12 $70
    call GetHandlerAddressInTable                 ; $7004: $CD $64 $7A
    ld   a, [$D398]                               ; $7007: $FA $98 $D3
    cp   $13                                      ; $700A: $FE $13
    jp   z, label_01F_7A8B                        ; $700C: $CA $8B $7A

    jp   $7A25                                    ; $700F: $C3 $25 $7A

    dec  a                                        ; $7012: $3D
    ld   [hl], b                                  ; $7013: $70
    ld   b, b                                     ; $7014: $40
    ld   [hl], b                                  ; $7015: $70
    ld   b, e                                     ; $7016: $43
    ld   [hl], b                                  ; $7017: $70
    ld   b, [hl]                                  ; $7018: $46
    ld   [hl], b                                  ; $7019: $70
    ld   c, c                                     ; $701A: $49
    ld   [hl], b                                  ; $701B: $70
    ld   c, h                                     ; $701C: $4C
    ld   [hl], b                                  ; $701D: $70
    ld   c, a                                     ; $701E: $4F
    ld   [hl], b                                  ; $701F: $70
    ld   d, d                                     ; $7020: $52
    ld   [hl], b                                  ; $7021: $70
    ld   d, l                                     ; $7022: $55
    ld   [hl], b                                  ; $7023: $70
    ld   e, b                                     ; $7024: $58
    ld   [hl], b                                  ; $7025: $70
    ld   e, e                                     ; $7026: $5B
    ld   [hl], b                                  ; $7027: $70
    ld   e, [hl]                                  ; $7028: $5E
    ld   [hl], b                                  ; $7029: $70
    ld   h, c                                     ; $702A: $61
    ld   [hl], b                                  ; $702B: $70
    ld   h, h                                     ; $702C: $64
    ld   [hl], b                                  ; $702D: $70
    ld   h, a                                     ; $702E: $67
    ld   [hl], b                                  ; $702F: $70
    ld   l, d                                     ; $7030: $6A
    ld   [hl], b                                  ; $7031: $70
    ld   l, l                                     ; $7032: $6D
    ld   [hl], b                                  ; $7033: $70
    ld   [hl], b                                  ; $7034: $70
    ld   [hl], b                                  ; $7035: $70
    ld   [hl], e                                  ; $7036: $73
    ld   [hl], b                                  ; $7037: $70
    ld   h, $40                                   ; $7038: $26 $40
    scf                                           ; $703A: $37
    add  b                                        ; $703B: $80
    ld   b, $36                                   ; $703C: $06 $36
    add  b                                        ; $703E: $80
    ld   b, $35                                   ; $703F: $06 $35
    add  b                                        ; $7041: $80
    ld   b, $34                                   ; $7042: $06 $34
    add  b                                        ; $7044: $80
    ld   b, $27                                   ; $7045: $06 $27
    add  b                                        ; $7047: $80
    ld   b, $26                                   ; $7048: $06 $26
    add  b                                        ; $704A: $80
    ld   b, $25                                   ; $704B: $06 $25
    add  b                                        ; $704D: $80
    ld   b, $24                                   ; $704E: $06 $24
    add  b                                        ; $7050: $80
    ld   b, $17                                   ; $7051: $06 $17
    add  b                                        ; $7053: $80
    ld   b, $16                                   ; $7054: $06 $16
    add  b                                        ; $7056: $80
    ld   b, $15                                   ; $7057: $06 $15
    add  b                                        ; $7059: $80
    ld   b, $14                                   ; $705A: $06 $14
    add  b                                        ; $705C: $80
    ld   b, $07                                   ; $705D: $06 $07
    add  b                                        ; $705F: $80
    ld   b, $06                                   ; $7060: $06 $06
    nop                                           ; $7062: $00
    ld   b, $05                                   ; $7063: $06 $05
    nop                                           ; $7065: $00
    ld   b, $04                                   ; $7066: $06 $04
    nop                                           ; $7068: $00
    ld   b, $03                                   ; $7069: $06 $03
    nop                                           ; $706B: $00
    ld   b, $02                                   ; $706C: $06 $02
    nop                                           ; $706E: $00
    ld   b, $01                                   ; $706F: $06 $01
    nop                                           ; $7071: $00
    ld   b, $00                                   ; $7072: $06 $00
    ld   b, a                                     ; $7074: $47
    nop                                           ; $7075: $00
    add  b                                        ; $7076: $80
    jr   nz, jr_01F_709A                          ; $7077: $20 $21

    and  c                                        ; $7079: $A1
    ld   [hl], b                                  ; $707A: $70
    jp   label_01F_79E9                           ; $707B: $C3 $E9 $79

    call DecrementValueAtDE                            ; $707E: $CD $71 $7A
    ret  nz                                       ; $7081: $C0

    call IncrementValueAtBC                            ; $7082: $CD $75 $7A
    cp   $08                                      ; $7085: $FE $08
    jp   z, label_01F_7A07                        ; $7087: $CA $07 $7A

    ld   hl, $7093                                ; $708A: $21 $93 $70
    call GetHandlerAddressInTable                 ; $708D: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7090: $C3 $8B $7A

    and  [hl]                                     ; $7093: $A6
    ld   [hl], b                                  ; $7094: $70
    xor  e                                        ; $7095: $AB
    ld   [hl], b                                  ; $7096: $70
    or   b                                        ; $7097: $B0
    ld   [hl], b                                  ; $7098: $70
    or   l                                        ; $7099: $B5

jr_01F_709A:
    ld   [hl], b                                  ; $709A: $70
    cp   d                                        ; $709B: $BA
    ld   [hl], b                                  ; $709C: $70
    xor  e                                        ; $709D: $AB
    ld   [hl], b                                  ; $709E: $70
    cp   a                                        ; $709F: $BF
    ld   [hl], b                                  ; $70A0: $70
    ld   h, $29                                   ; $70A1: $26 $29
    ld   b, b                                     ; $70A3: $40
    ret  nz                                       ; $70A4: $C0

    inc  b                                        ; $70A5: $04
    ld   h, $10                                   ; $70A6: $26 $10
    ld   b, b                                     ; $70A8: $40
    ret  nz                                       ; $70A9: $C0

    ld   [bc], a                                  ; $70AA: $02
    ld   h, $29                                   ; $70AB: $26 $29
    db   $10                                      ; $70AD: $10
    ret  nz                                       ; $70AE: $C0

    inc  b                                        ; $70AF: $04
    ld   h, $10                                   ; $70B0: $26 $10
    db   $10                                      ; $70B2: $10
    ret  nz                                       ; $70B3: $C0

    ld   [bc], a                                  ; $70B4: $02
    ld   h, $19                                   ; $70B5: $26 $19
    ld   h, b                                     ; $70B7: $60
    ret  nz                                       ; $70B8: $C0

    inc  b                                        ; $70B9: $04
    ld   h, $10                                   ; $70BA: $26 $10
    ld   h, b                                     ; $70BC: $60
    ret  nz                                       ; $70BD: $C0

    ld   [bc], a                                  ; $70BE: $02
    ld   h, $10                                   ; $70BF: $26 $10
    db   $10                                      ; $70C1: $10
    ret  nz                                       ; $70C2: $C0

    inc  bc                                       ; $70C3: $03
    ld   a, $08                                   ; $70C4: $3E $08
    ld   [$D3BF], a                               ; $70C6: $EA $BF $D3
    ld   hl, $710C                                ; $70C9: $21 $0C $71
    jp   label_01F_79E4                           ; $70CC: $C3 $E4 $79

    call DecrementValueAtDE                            ; $70CF: $CD $71 $7A
    ret  nz                                       ; $70D2: $C0

    call IncrementValueAtBC                            ; $70D3: $CD $75 $7A
    cp   $0C                                      ; $70D6: $FE $0C
    jr   z, jr_01F_70EB                           ; $70D8: $28 $11

jr_01F_70DA:
    ld   hl, $70F6                                ; $70DA: $21 $F6 $70
    call GetHandlerAddressInTable                 ; $70DD: $CD $64 $7A
    ld   a, [$D398]                               ; $70E0: $FA $98 $D3
    cp   $02                                      ; $70E3: $FE $02
    jp   z, label_01F_7A8B                        ; $70E5: $CA $8B $7A

    jp   $7A25                                    ; $70E8: $C3 $25 $7A

jr_01F_70EB:
    call func_01F_7AAC                            ; $70EB: $CD $AC $7A
    jp   z, label_01F_7A01                        ; $70EE: $CA $01 $7A

    ld   a, $03                                   ; $70F1: $3E $03
    ld   [bc], a                                  ; $70F3: $02
    jr   jr_01F_70DA                              ; $70F4: $18 $E4

    ld   de, $C371                                ; $70F6: $11 $71 $C3
    ld   l, a                                     ; $70F9: $6F
    ret  z                                        ; $70FA: $C8

    ld   l, a                                     ; $70FB: $6F
    adc  $6F                                      ; $70FC: $CE $6F
    call nc, $DA6F                                ; $70FE: $D4 $6F $DA
    ld   l, a                                     ; $7101: $6F
    rst  $10                                      ; $7102: $D7
    ld   l, a                                     ; $7103: $6F
    call nc, $D16F                                ; $7104: $D4 $6F $D1
    ld   l, a                                     ; $7107: $6F
    adc  $6F                                      ; $7108: $CE $6F
    bit  5, a                                     ; $710A: $CB $6F
    nop                                           ; $710C: $00
    ret  nz                                       ; $710D: $C0

    ld   a, a                                     ; $710E: $7F
    add  b                                        ; $710F: $80
    rst  $38                                      ; $7110: $FF
    ld   a, a                                     ; $7111: $7F
    add  b                                        ; $7112: $80
    inc  [hl]                                     ; $7113: $34
    ld   hl, $712C                                ; $7114: $21 $2C $71
    jp   label_01F_79E9                           ; $7117: $C3 $E9 $79

    call DecrementValueAtDE                            ; $711A: $CD $71 $7A
    ret  nz                                       ; $711D: $C0

    call IncrementValueAtBC                            ; $711E: $CD $75 $7A
    cp   $02                                      ; $7121: $FE $02

jr_01F_7123:
    jp   z, label_01F_7A01                        ; $7123: $CA $01 $7A

    ld   hl, $7131                                ; $7126: $21 $31 $71
    jp   label_01F_7A8B                           ; $7129: $C3 $8B $7A

    nop                                           ; $712C: $00
    add  hl, de                                   ; $712D: $19
    ld   d, b                                     ; $712E: $50
    add  b                                        ; $712F: $80
    ld   b, $00                                   ; $7130: $06 $00
    ld   h, l                                     ; $7132: $65
    ld   d, b                                     ; $7133: $50
    add  b                                        ; $7134: $80
    jr   nz, jr_01F_7158                          ; $7135: $20 $21

    sub  l                                        ; $7137: $95
    ld   [hl], c                                  ; $7138: $71
    jp   label_01F_79E9                           ; $7139: $C3 $E9 $79

    call DecrementValueAtDE                            ; $713C: $CD $71 $7A
    ret  nz                                       ; $713F: $C0

    call IncrementValueAtBC                            ; $7140: $CD $75 $7A
    cp   $23                                      ; $7143: $FE $23
    jp   z, label_01F_7A07                        ; $7145: $CA $07 $7A

    ld   hl, $7151                                ; $7148: $21 $51 $71
    call GetHandlerAddressInTable                 ; $714B: $CD $64 $7A
    jp   label_01F_7A8B                           ; $714E: $C3 $8B $7A

    sbc  d                                        ; $7151: $9A
    ld   [hl], c                                  ; $7152: $71
    cp   l                                        ; $7153: $BD
    ld   [hl], c                                  ; $7154: $71
    sbc  a                                        ; $7155: $9F
    ld   [hl], c                                  ; $7156: $71
    cp   l                                        ; $7157: $BD

jr_01F_7158:
    ld   [hl], c                                  ; $7158: $71
    and  h                                        ; $7159: $A4
    ld   [hl], c                                  ; $715A: $71
    cp   l                                        ; $715B: $BD
    ld   [hl], c                                  ; $715C: $71
    xor  c                                        ; $715D: $A9
    ld   [hl], c                                  ; $715E: $71
    cp   l                                        ; $715F: $BD
    ld   [hl], c                                  ; $7160: $71
    xor  c                                        ; $7161: $A9
    ld   [hl], c                                  ; $7162: $71
    cp   l                                        ; $7163: $BD
    ld   [hl], c                                  ; $7164: $71
    xor  [hl]                                     ; $7165: $AE
    ld   [hl], c                                  ; $7166: $71
    jp   nz, $B371                                ; $7167: $C2 $71 $B3

    ld   [hl], c                                  ; $716A: $71
    jp   nz, $B871                                ; $716B: $C2 $71 $B8

    ld   [hl], c                                  ; $716E: $71
    jp   nz, $B371                                ; $716F: $C2 $71 $B3

    ld   [hl], c                                  ; $7172: $71
    jp   nz, $AE71                                ; $7173: $C2 $71 $AE

    ld   [hl], c                                  ; $7176: $71
    jp   nz, $B371                                ; $7177: $C2 $71 $B3

    ld   [hl], c                                  ; $717A: $71
    jp   nz, $B871                                ; $717B: $C2 $71 $B8

    ld   [hl], c                                  ; $717E: $71
    jp   nz, $B371                                ; $717F: $C2 $71 $B3

    ld   [hl], c                                  ; $7182: $71
    jp   nz, $AE71                                ; $7183: $C2 $71 $AE

    ld   [hl], c                                  ; $7186: $71
    jp   nz, $B371                                ; $7187: $C2 $71 $B3

    ld   [hl], c                                  ; $718A: $71
    jp   nz, $B871                                ; $718B: $C2 $71 $B8

    ld   [hl], c                                  ; $718E: $71
    jp   nz, $B371                                ; $718F: $C2 $71 $B3

    ld   [hl], c                                  ; $7192: $71
    jp   nz, $0071                                ; $7193: $C2 $71 $00

    inc  e                                        ; $7196: $1C
    ld   h, b                                     ; $7197: $60
    add  b                                        ; $7198: $80
    jr   jr_01F_719B                              ; $7199: $18 $00

jr_01F_719B:
    add  hl, de                                   ; $719B: $19
    ld   d, b                                     ; $719C: $50
    add  b                                        ; $719D: $80
    ld   a, [bc]                                  ; $719E: $0A
    nop                                           ; $719F: $00
    add  hl, de                                   ; $71A0: $19
    jr   nc, jr_01F_7123                          ; $71A1: $30 $80

    add  hl, bc                                   ; $71A3: $09
    nop                                           ; $71A4: $00
    add  hl, de                                   ; $71A5: $19
    ld   b, b                                     ; $71A6: $40
    add  b                                        ; $71A7: $80
    rlca                                          ; $71A8: $07
    nop                                           ; $71A9: $00
    add  hl, de                                   ; $71AA: $19
    ld   d, b                                     ; $71AB: $50
    add  b                                        ; $71AC: $80
    ld   b, $00                                   ; $71AD: $06 $00
    add  hl, de                                   ; $71AF: $19
    ld   h, b                                     ; $71B0: $60
    add  b                                        ; $71B1: $80
    ld   b, $00                                   ; $71B2: $06 $00
    add  hl, de                                   ; $71B4: $19
    ld   h, b                                     ; $71B5: $60
    add  b                                        ; $71B6: $80
    inc  b                                        ; $71B7: $04
    nop                                           ; $71B8: $00
    add  hl, de                                   ; $71B9: $19
    ld   d, b                                     ; $71BA: $50
    add  b                                        ; $71BB: $80
    ld   [bc], a                                  ; $71BC: $02
    scf                                           ; $71BD: $37
    ld   b, b                                     ; $71BE: $40
    jr   nz, @-$3E                                ; $71BF: $20 $C0

    ld   [bc], a                                  ; $71C1: $02
    scf                                           ; $71C2: $37
    jr   nz, jr_01F_71E5                          ; $71C3: $20 $20

    ret  nz                                       ; $71C5: $C0

    ld   [bc], a                                  ; $71C6: $02
    ld   hl, $7216                                ; $71C7: $21 $16 $72
    jp   label_01F_79E4                           ; $71CA: $C3 $E4 $79

    call DecrementValueAtDE                            ; $71CD: $CD $71 $7A
    ret  nz                                       ; $71D0: $C0

    call IncrementValueAtBC                            ; $71D1: $CD $75 $7A
    cp   $1B                                      ; $71D4: $FE $1B
    jp   z, label_01F_7A01                        ; $71D6: $CA $01 $7A

    ld   hl, $71E2                                ; $71D9: $21 $E2 $71
    call GetHandlerAddressInTable                 ; $71DC: $CD $64 $7A
    jp   label_01F_7A8B                           ; $71DF: $C3 $8B $7A

    dec  de                                       ; $71E2: $1B
    ld   [hl], d                                  ; $71E3: $72
    cp   l                                        ; $71E4: $BD

jr_01F_71E5:
    ld   [hl], c                                  ; $71E5: $71
    jr   nz, jr_01F_725A                          ; $71E6: $20 $72

    cp   l                                        ; $71E8: $BD
    ld   [hl], c                                  ; $71E9: $71
    dec  h                                        ; $71EA: $25
    ld   [hl], d                                  ; $71EB: $72
    cp   l                                        ; $71EC: $BD
    ld   [hl], c                                  ; $71ED: $71
    ld   a, [hl+]                                 ; $71EE: $2A
    ld   [hl], d                                  ; $71EF: $72
    cp   l                                        ; $71F0: $BD
    ld   [hl], c                                  ; $71F1: $71
    ld   a, [hl+]                                 ; $71F2: $2A
    ld   [hl], d                                  ; $71F3: $72
    cp   l                                        ; $71F4: $BD
    ld   [hl], c                                  ; $71F5: $71
    cpl                                           ; $71F6: $2F
    ld   [hl], d                                  ; $71F7: $72
    jp   nz, LoadRoomObject.hiddenStairsEnd       ; $71F8: $C2 $71 $34

    ld   [hl], d                                  ; $71FB: $72
    jp   nz, $3971                                ; $71FC: $C2 $71 $39

    ld   [hl], d                                  ; $71FF: $72
    jp   nz, LoadRoomObject.hiddenStairsEnd       ; $7200: $C2 $71 $34

    ld   [hl], d                                  ; $7203: $72
    jp   nz, $2F71                                ; $7204: $C2 $71 $2F

    ld   [hl], d                                  ; $7207: $72
    jp   nz, LoadRoomObject.hiddenStairsEnd       ; $7208: $C2 $71 $34

    ld   [hl], d                                  ; $720B: $72
    jp   nz, $3971                                ; $720C: $C2 $71 $39

    ld   [hl], d                                  ; $720F: $72
    jp   nz, LoadRoomObject.hiddenStairsEnd       ; $7210: $C2 $71 $34

    ld   [hl], d                                  ; $7213: $72
    jp   nz, $0071                                ; $7214: $C2 $71 $00

    nop                                           ; $7217: $00
    nop                                           ; $7218: $00
    add  b                                        ; $7219: $80
    jr   nz, jr_01F_721C                          ; $721A: $20 $00

jr_01F_721C:
    add  hl, de                                   ; $721C: $19
    daa                                           ; $721D: $27
    add  b                                        ; $721E: $80
    ld   a, [bc]                                  ; $721F: $0A
    nop                                           ; $7220: $00
    add  hl, de                                   ; $7221: $19
    ld   h, $80                                   ; $7222: $26 $80
    add  hl, bc                                   ; $7224: $09
    nop                                           ; $7225: $00
    add  hl, de                                   ; $7226: $19
    inc  h                                        ; $7227: $24
    add  b                                        ; $7228: $80
    ld   [$1900], sp                              ; $7229: $08 $00 $19
    inc  hl                                       ; $722C: $23
    add  b                                        ; $722D: $80
    rlca                                          ; $722E: $07
    nop                                           ; $722F: $00
    add  hl, de                                   ; $7230: $19
    rla                                           ; $7231: $17
    add  b                                        ; $7232: $80
    ld   b, $00                                   ; $7233: $06 $00
    add  hl, de                                   ; $7235: $19
    rla                                           ; $7236: $17
    add  b                                        ; $7237: $80
    inc  b                                        ; $7238: $04
    nop                                           ; $7239: $00
    add  hl, de                                   ; $723A: $19
    ld   d, $80                                   ; $723B: $16 $80
    ld   [bc], a                                  ; $723D: $02
    ld   hl, $726D                                ; $723E: $21 $6D $72
    jp   label_01F_79E9                           ; $7241: $C3 $E9 $79

    call DecrementValueAtDE                            ; $7244: $CD $71 $7A
    ret  nz                                       ; $7247: $C0

    call IncrementValueAtBC                            ; $7248: $CD $75 $7A
    cp   $0B                                      ; $724B: $FE $0B
    jp   z, label_01F_7A07                        ; $724D: $CA $07 $7A

    ld   hl, $7259                                ; $7250: $21 $59 $72
    call GetHandlerAddressInTable                 ; $7253: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7256: $C3 $8B $7A

    ld   [hl], d                                  ; $7259: $72

jr_01F_725A:
    ld   [hl], d                                  ; $725A: $72
    ld   [hl], a                                  ; $725B: $77
    ld   [hl], d                                  ; $725C: $72
    ld   a, h                                     ; $725D: $7C
    ld   [hl], d                                  ; $725E: $72
    ld   [hl], a                                  ; $725F: $77
    ld   [hl], d                                  ; $7260: $72
    ld   [hl], d                                  ; $7261: $72
    ld   [hl], d                                  ; $7262: $72
    ld   l, l                                     ; $7263: $6D
    ld   [hl], d                                  ; $7264: $72
    sub  b                                        ; $7265: $90
    ld   [hl], d                                  ; $7266: $72
    adc  e                                        ; $7267: $8B
    ld   [hl], d                                  ; $7268: $72
    add  [hl]                                     ; $7269: $86
    ld   [hl], d                                  ; $726A: $72
    add  c                                        ; $726B: $81
    ld   [hl], d                                  ; $726C: $72
    nop                                           ; $726D: $00
    jr   nz, @+$32                                ; $726E: $20 $30

    add  b                                        ; $7270: $80
    ld   [bc], a                                  ; $7271: $02
    nop                                           ; $7272: $00
    ld   b, b                                     ; $7273: $40
    ld   b, b                                     ; $7274: $40
    add  b                                        ; $7275: $80
    inc  bc                                       ; $7276: $03
    nop                                           ; $7277: $00
    add  b                                        ; $7278: $80
    ld   d, b                                     ; $7279: $50
    add  b                                        ; $727A: $80
    inc  b                                        ; $727B: $04
    nop                                           ; $727C: $00
    ret  nz                                       ; $727D: $C0

    ld   h, b                                     ; $727E: $60
    add  b                                        ; $727F: $80
    dec  b                                        ; $7280: $05
    scf                                           ; $7281: $37
    db   $10                                      ; $7282: $10
    jr   nc, @-$3E                                ; $7283: $30 $C0

    ld   [bc], a                                  ; $7285: $02
    nop                                           ; $7286: $00
    db   $10                                      ; $7287: $10
    ld   b, b                                     ; $7288: $40
    add  b                                        ; $7289: $80
    inc  bc                                       ; $728A: $03
    nop                                           ; $728B: $00
    db   $10                                      ; $728C: $10
    ld   d, b                                     ; $728D: $50
    add  b                                        ; $728E: $80
    inc  b                                        ; $728F: $04
    nop                                           ; $7290: $00
    db   $10                                      ; $7291: $10
    ld   h, b                                     ; $7292: $60
    add  b                                        ; $7293: $80
    dec  b                                        ; $7294: $05
    ld   hl, $72CE                                ; $7295: $21 $CE $72
    jp   label_01F_79E9                           ; $7298: $C3 $E9 $79

    call DecrementValueAtDE                            ; $729B: $CD $71 $7A
    ret  nz                                       ; $729E: $C0

    call IncrementValueAtBC                            ; $729F: $CD $75 $7A
    cp   $0C                                      ; $72A2: $FE $0C
    jp   z, label_01F_7A01                        ; $72A4: $CA $01 $7A

    ld   hl, $72B8                                ; $72A7: $21 $B8 $72
    call GetHandlerAddressInTable                 ; $72AA: $CD $64 $7A
    ld   a, [$D398]                               ; $72AD: $FA $98 $D3
    cp   $06                                      ; $72B0: $FE $06
    jp   z, label_01F_7A8B                        ; $72B2: $CA $8B $7A

    jp   $7A25                                    ; $72B5: $C3 $25 $7A

    sub  $72                                      ; $72B8: $D6 $72
    db   $D3                                      ; $72BA: $D3
    ld   [hl], d                                  ; $72BB: $72
    reti                                          ; $72BC: $D9

    ld   [hl], d                                  ; $72BD: $72
    sub  $72                                      ; $72BE: $D6 $72
    call c, $DF72                                 ; $72C0: $DC $72 $DF
    ld   [hl], d                                  ; $72C3: $72
    sub  $72                                      ; $72C4: $D6 $72
    db   $D3                                      ; $72C6: $D3
    ld   [hl], d                                  ; $72C7: $72
    reti                                          ; $72C8: $D9

    ld   [hl], d                                  ; $72C9: $72
    sub  $72                                      ; $72CA: $D6 $72
    call c, Copy49D0ToTileMemory89D0              ; $72CC: $DC $72 $00
    add  b                                        ; $72CF: $80
    ld   c, b                                     ; $72D0: $48
    add  b                                        ; $72D1: $80
    ld   [bc], a                                  ; $72D2: $02
    ld   c, c                                     ; $72D3: $49
    add  b                                        ; $72D4: $80
    ld   [bc], a                                  ; $72D5: $02
    ld   c, d                                     ; $72D6: $4A
    add  b                                        ; $72D7: $80
    ld   [bc], a                                  ; $72D8: $02
    ld   c, e                                     ; $72D9: $4B
    add  b                                        ; $72DA: $80
    ld   [bc], a                                  ; $72DB: $02
    ld   c, h                                     ; $72DC: $4C
    add  b                                        ; $72DD: $80
    ld   [bc], a                                  ; $72DE: $02
    nop                                           ; $72DF: $00
    jr   nz, @+$4A                                ; $72E0: $20 $48

    add  b                                        ; $72E2: $80
    ld   [bc], a                                  ; $72E3: $02
    ld   a, $2B                                   ; $72E4: $3E $2B
    ld   [$D3DF], a                               ; $72E6: $EA $DF $D3
    ld   a, $15                                   ; $72E9: $3E $15
    ld   [$D3E0], a                               ; $72EB: $EA $E0 $D3
    ld   hl, $7415                                ; $72EE: $21 $15 $74
    jp   label_01F_79E9                           ; $72F1: $C3 $E9 $79

    call DecrementValueAtDE                            ; $72F4: $CD $71 $7A
    ret  nz                                       ; $72F7: $C0

    call IncrementValueAtBC                            ; $72F8: $CD $75 $7A
    cp   $05                                      ; $72FB: $FE $05
    jr   z, jr_01F_733B                           ; $72FD: $28 $3C

    cp   $0D                                      ; $72FF: $FE $0D
    jr   z, jr_01F_7363                           ; $7301: $28 $60

    cp   $1A                                      ; $7303: $FE $1A
    jr   z, jr_01F_734A                           ; $7305: $28 $43

    cp   $52                                      ; $7307: $FE $52
    jp   z, label_01F_7A01                        ; $7309: $CA $01 $7A

jr_01F_730C:
    ld   hl, $7373                                ; $730C: $21 $73 $73
    call GetHandlerAddressInTable                 ; $730F: $CD $64 $7A
    ld   a, [$D398]                               ; $7312: $FA $98 $D3
    cp   $1A                                      ; $7315: $FE $1A
    jp   z, label_01F_7A8B                        ; $7317: $CA $8B $7A

    cp   $22                                      ; $731A: $FE $22
    jp   z, label_01F_7A8B                        ; $731C: $CA $8B $7A

    cp   $2A                                      ; $731F: $FE $2A
    jp   z, label_01F_7A8B                        ; $7321: $CA $8B $7A

    cp   $32                                      ; $7324: $FE $32
    jp   z, label_01F_7A8B                        ; $7326: $CA $8B $7A

    cp   $3A                                      ; $7329: $FE $3A
    jp   z, label_01F_7A8B                        ; $732B: $CA $8B $7A

    cp   $42                                      ; $732E: $FE $42
    jp   z, label_01F_7A8B                        ; $7330: $CA $8B $7A

    cp   $4A                                      ; $7333: $FE $4A
    jp   z, label_01F_7A8B                        ; $7335: $CA $8B $7A

    jp   $7A25                                    ; $7338: $C3 $25 $7A

jr_01F_733B:
    push de                                       ; $733B: $D5
    ld   de, $D3DF                                ; $733C: $11 $DF $D3
    call DecrementValueAtDE                            ; $733F: $CD $71 $7A
    pop  de                                       ; $7342: $D1
    jr   z, jr_01F_7359                           ; $7343: $28 $14

    ld   a, $01                                   ; $7345: $3E $01
    ld   [bc], a                                  ; $7347: $02
    jr   jr_01F_730C                              ; $7348: $18 $C2

jr_01F_734A:
    push de                                       ; $734A: $D5
    ld   de, $D3E0                                ; $734B: $11 $E0 $D3
    call DecrementValueAtDE                            ; $734E: $CD $71 $7A
    pop  de                                       ; $7351: $D1
    jr   z, jr_01F_735E                           ; $7352: $28 $0A

    ld   a, $12                                   ; $7354: $3E $12
    ld   [bc], a                                  ; $7356: $02
    jr   jr_01F_730C                              ; $7357: $18 $B3

jr_01F_7359:
    ld   a, $05                                   ; $7359: $3E $05
    ld   [bc], a                                  ; $735B: $02
    jr   jr_01F_730C                              ; $735C: $18 $AE

jr_01F_735E:
    ld   a, $1A                                   ; $735E: $3E $1A
    ld   [bc], a                                  ; $7360: $02
    jr   jr_01F_730C                              ; $7361: $18 $A9

jr_01F_7363:
    ld   a, $20                                   ; $7363: $3E $20
    ld   [wActiveWaveSfx], a                      ; $7365: $EA $70 $D3
    call func_01F_53ED                            ; $7368: $CD $ED $53
    ld   bc, $D398                                ; $736B: $01 $98 $D3
    ld   de, $D393                                ; $736E: $11 $93 $D3
    jr   jr_01F_730C                              ; $7371: $18 $99

    ld   a, [de]                                  ; $7373: $1A
    ld   [hl], h                                  ; $7374: $74
    dec  e                                        ; $7375: $1D
    ld   [hl], h                                  ; $7376: $74
    jr   nz, jr_01F_73ED                          ; $7377: $20 $74

    inc  hl                                       ; $7379: $23
    ld   [hl], h                                  ; $737A: $74
    ld   h, $74                                   ; $737B: $26 $74
    add  hl, hl                                   ; $737D: $29
    ld   [hl], h                                  ; $737E: $74
    inc  l                                        ; $737F: $2C
    ld   [hl], h                                  ; $7380: $74
    cpl                                           ; $7381: $2F
    ld   [hl], h                                  ; $7382: $74
    ld   [hl-], a                                 ; $7383: $32
    ld   [hl], h                                  ; $7384: $74
    dec  [hl]                                     ; $7385: $35
    ld   [hl], h                                  ; $7386: $74
    jr   c, jr_01F_73FD                           ; $7387: $38 $74

    dec  sp                                       ; $7389: $3B
    ld   [hl], h                                  ; $738A: $74
    ld   a, $74                                   ; $738B: $3E $74
    ld   b, c                                     ; $738D: $41
    ld   [hl], h                                  ; $738E: $74
    ld   b, h                                     ; $738F: $44
    ld   [hl], h                                  ; $7390: $74
    ld   b, a                                     ; $7391: $47
    ld   [hl], h                                  ; $7392: $74
    ld   c, d                                     ; $7393: $4A
    ld   [hl], h                                  ; $7394: $74
    ld   c, l                                     ; $7395: $4D
    ld   [hl], h                                  ; $7396: $74
    ld   d, b                                     ; $7397: $50
    ld   [hl], h                                  ; $7398: $74
    ld   d, e                                     ; $7399: $53
    ld   [hl], h                                  ; $739A: $74
    ld   d, [hl]                                  ; $739B: $56
    ld   [hl], h                                  ; $739C: $74
    ld   e, c                                     ; $739D: $59
    ld   [hl], h                                  ; $739E: $74
    ld   d, [hl]                                  ; $739F: $56
    ld   [hl], h                                  ; $73A0: $74
    ld   d, e                                     ; $73A1: $53
    ld   [hl], h                                  ; $73A2: $74
    ld   d, b                                     ; $73A3: $50
    ld   [hl], h                                  ; $73A4: $74
    ld   e, h                                     ; $73A5: $5C
    ld   [hl], h                                  ; $73A6: $74
    ld   h, c                                     ; $73A7: $61
    ld   [hl], h                                  ; $73A8: $74
    ld   h, h                                     ; $73A9: $64
    ld   [hl], h                                  ; $73AA: $74
    ld   h, a                                     ; $73AB: $67
    ld   [hl], h                                  ; $73AC: $74
    ld   l, d                                     ; $73AD: $6A
    ld   [hl], h                                  ; $73AE: $74
    ld   h, a                                     ; $73AF: $67
    ld   [hl], h                                  ; $73B0: $74
    ld   h, h                                     ; $73B1: $64
    ld   [hl], h                                  ; $73B2: $74
    ld   h, c                                     ; $73B3: $61
    ld   [hl], h                                  ; $73B4: $74
    ld   l, l                                     ; $73B5: $6D
    ld   [hl], h                                  ; $73B6: $74
    ld   h, c                                     ; $73B7: $61
    ld   [hl], h                                  ; $73B8: $74
    ld   h, h                                     ; $73B9: $64
    ld   [hl], h                                  ; $73BA: $74
    ld   h, a                                     ; $73BB: $67
    ld   [hl], h                                  ; $73BC: $74
    ld   l, d                                     ; $73BD: $6A
    ld   [hl], h                                  ; $73BE: $74
    ld   h, a                                     ; $73BF: $67
    ld   [hl], h                                  ; $73C0: $74
    ld   h, h                                     ; $73C1: $64
    ld   [hl], h                                  ; $73C2: $74
    ld   h, c                                     ; $73C3: $61
    ld   [hl], h                                  ; $73C4: $74
    ld   [hl], d                                  ; $73C5: $72
    ld   [hl], h                                  ; $73C6: $74
    ld   h, c                                     ; $73C7: $61
    ld   [hl], h                                  ; $73C8: $74
    ld   h, h                                     ; $73C9: $64
    ld   [hl], h                                  ; $73CA: $74
    ld   h, a                                     ; $73CB: $67
    ld   [hl], h                                  ; $73CC: $74
    ld   l, d                                     ; $73CD: $6A
    ld   [hl], h                                  ; $73CE: $74
    ld   h, a                                     ; $73CF: $67
    ld   [hl], h                                  ; $73D0: $74
    ld   h, h                                     ; $73D1: $64
    ld   [hl], h                                  ; $73D2: $74
    ld   h, c                                     ; $73D3: $61
    ld   [hl], h                                  ; $73D4: $74
    ld   [hl], a                                  ; $73D5: $77
    ld   [hl], h                                  ; $73D6: $74
    ld   h, c                                     ; $73D7: $61
    ld   [hl], h                                  ; $73D8: $74
    ld   h, h                                     ; $73D9: $64
    ld   [hl], h                                  ; $73DA: $74
    ld   h, a                                     ; $73DB: $67
    ld   [hl], h                                  ; $73DC: $74
    ld   l, d                                     ; $73DD: $6A
    ld   [hl], h                                  ; $73DE: $74
    ld   h, a                                     ; $73DF: $67
    ld   [hl], h                                  ; $73E0: $74
    ld   h, h                                     ; $73E1: $64
    ld   [hl], h                                  ; $73E2: $74
    ld   h, c                                     ; $73E3: $61
    ld   [hl], h                                  ; $73E4: $74
    ld   a, h                                     ; $73E5: $7C
    ld   [hl], h                                  ; $73E6: $74
    ld   h, c                                     ; $73E7: $61
    ld   [hl], h                                  ; $73E8: $74
    ld   h, h                                     ; $73E9: $64
    ld   [hl], h                                  ; $73EA: $74
    ld   h, a                                     ; $73EB: $67
    ld   [hl], h                                  ; $73EC: $74

jr_01F_73ED:
    ld   l, d                                     ; $73ED: $6A
    ld   [hl], h                                  ; $73EE: $74
    ld   h, a                                     ; $73EF: $67
    ld   [hl], h                                  ; $73F0: $74
    ld   h, h                                     ; $73F1: $64
    ld   [hl], h                                  ; $73F2: $74
    ld   h, c                                     ; $73F3: $61
    ld   [hl], h                                  ; $73F4: $74
    add  c                                        ; $73F5: $81
    ld   [hl], h                                  ; $73F6: $74
    ld   h, c                                     ; $73F7: $61
    ld   [hl], h                                  ; $73F8: $74
    ld   h, h                                     ; $73F9: $64
    ld   [hl], h                                  ; $73FA: $74
    ld   h, a                                     ; $73FB: $67
    ld   [hl], h                                  ; $73FC: $74

jr_01F_73FD:
    ld   l, d                                     ; $73FD: $6A
    ld   [hl], h                                  ; $73FE: $74
    ld   h, a                                     ; $73FF: $67
    ld   [hl], h                                  ; $7400: $74
    ld   h, h                                     ; $7401: $64
    ld   [hl], h                                  ; $7402: $74
    ld   h, c                                     ; $7403: $61
    ld   [hl], h                                  ; $7404: $74
    add  [hl]                                     ; $7405: $86
    ld   [hl], h                                  ; $7406: $74
    ld   h, c                                     ; $7407: $61
    ld   [hl], h                                  ; $7408: $74
    ld   h, h                                     ; $7409: $64
    ld   [hl], h                                  ; $740A: $74
    ld   h, a                                     ; $740B: $67
    ld   [hl], h                                  ; $740C: $74
    ld   l, d                                     ; $740D: $6A
    ld   [hl], h                                  ; $740E: $74
    ld   h, a                                     ; $740F: $67
    ld   [hl], h                                  ; $7410: $74
    ld   h, h                                     ; $7411: $64
    ld   [hl], h                                  ; $7412: $74
    ld   h, c                                     ; $7413: $61
    ld   [hl], h                                  ; $7414: $74
    nop                                           ; $7415: $00
    add  b                                        ; $7416: $80
    sbc  h                                        ; $7417: $9C
    add  b                                        ; $7418: $80
    ld   bc, $8E                                  ; $7419: $01 $8E $00
    ld   bc, $7E                                  ; $741C: $01 $7E $00
    ld   bc, $8C                                  ; $741F: $01 $8C $00
    ld   bc, $7C                                  ; $7422: $01 $7C $00
    ld   bc, $6F                                  ; $7425: $01 $6F $00
    ld   bc, $6D                                  ; $7428: $01 $6D $00
    ld   bc, $5F                                  ; $742B: $01 $5F $00
    ld   bc, $5D                                  ; $742E: $01 $5D $00
    ld   bc, $4F                                  ; $7431: $01 $4F $00
    ld   bc, $4D                                  ; $7434: $01 $4D $00
    ld   bc, $3F                                  ; $7437: $01 $3F $00
    ld   bc, $3D                                  ; $743A: $01 $3D $00
    ld   bc, $8037                                ; $743D: $01 $37 $80
    ld   [bc], a                                  ; $7440: $02
    dec  [hl]                                     ; $7441: $35
    add  b                                        ; $7442: $80
    ld   [bc], a                                  ; $7443: $02
    daa                                           ; $7444: $27
    add  b                                        ; $7445: $80
    ld   [bc], a                                  ; $7446: $02
    dec  h                                        ; $7447: $25
    add  b                                        ; $7448: $80
    ld   [bc], a                                  ; $7449: $02
    rla                                           ; $744A: $17
    add  b                                        ; $744B: $80
    ld   [bc], a                                  ; $744C: $02
    dec  d                                        ; $744D: $15
    add  b                                        ; $744E: $80
    ld   [bc], a                                  ; $744F: $02
    inc  d                                        ; $7450: $14
    add  b                                        ; $7451: $80
    ld   [bc], a                                  ; $7452: $02
    rlca                                          ; $7453: $07
    add  b                                        ; $7454: $80
    ld   [bc], a                                  ; $7455: $02
    ld   b, $80                                   ; $7456: $06 $80
    ld   [bc], a                                  ; $7458: $02
    dec  b                                        ; $7459: $05
    add  b                                        ; $745A: $80
    ld   [bc], a                                  ; $745B: $02
    nop                                           ; $745C: $00
    ld   [hl], b                                  ; $745D: $70
    dec  d                                        ; $745E: $15
    add  b                                        ; $745F: $80
    ld   [bc], a                                  ; $7460: $02
    inc  d                                        ; $7461: $14
    add  b                                        ; $7462: $80
    ld   [bc], a                                  ; $7463: $02
    rlca                                          ; $7464: $07
    add  b                                        ; $7465: $80
    ld   [bc], a                                  ; $7466: $02
    ld   b, $80                                   ; $7467: $06 $80
    ld   [bc], a                                  ; $7469: $02
    dec  b                                        ; $746A: $05
    add  b                                        ; $746B: $80
    ld   [bc], a                                  ; $746C: $02
    nop                                           ; $746D: $00
    ld   h, b                                     ; $746E: $60
    dec  d                                        ; $746F: $15
    add  b                                        ; $7470: $80
    ld   [bc], a                                  ; $7471: $02
    nop                                           ; $7472: $00
    ld   d, b                                     ; $7473: $50
    dec  d                                        ; $7474: $15
    add  b                                        ; $7475: $80
    ld   [bc], a                                  ; $7476: $02
    nop                                           ; $7477: $00
    ld   b, b                                     ; $7478: $40
    dec  d                                        ; $7479: $15
    add  b                                        ; $747A: $80
    ld   [bc], a                                  ; $747B: $02
    nop                                           ; $747C: $00
    jr   nc, @+$17                                ; $747D: $30 $15

    add  b                                        ; $747F: $80
    ld   [bc], a                                  ; $7480: $02
    nop                                           ; $7481: $00
    jr   nz, jr_01F_7499                          ; $7482: $20 $15

    add  b                                        ; $7484: $80
    ld   [bc], a                                  ; $7485: $02
    nop                                           ; $7486: $00
    db   $10                                      ; $7487: $10
    dec  d                                        ; $7488: $15
    add  b                                        ; $7489: $80
    ld   [bc], a                                  ; $748A: $02
    ld   a, $40                                   ; $748B: $3E $40
    ld   [$D3BF], a                               ; $748D: $EA $BF $D3
    ld   hl, $74EB                                ; $7490: $21 $EB $74
    jp   label_01F_79E9                           ; $7493: $C3 $E9 $79

    call DecrementValueAtDE                            ; $7496: $CD $71 $7A

jr_01F_7499:
    ret  nz                                       ; $7499: $C0

    call IncrementValueAtBC                            ; $749A: $CD $75 $7A
    cp   $21                                      ; $749D: $FE $21
    jp   z, label_01F_7A01                        ; $749F: $CA $01 $7A

    ld   hl, $74AB                                ; $74A2: $21 $AB $74
    call GetHandlerAddressInTable                 ; $74A5: $CD $64 $7A
    jp   label_01F_7A8B                           ; $74A8: $C3 $8B $7A

    ldh  a, [$FF74]                               ; $74AB: $F0 $74
    push af                                       ; $74AD: $F5
    ld   [hl], h                                  ; $74AE: $74
    ld_long a, $FF74                              ; $74AF: $FA $74 $FF
    ld   [hl], h                                  ; $74B2: $74
    inc  b                                        ; $74B3: $04
    ld   [hl], l                                  ; $74B4: $75
    add  hl, bc                                   ; $74B5: $09
    ld   [hl], l                                  ; $74B6: $75
    ld   c, $75                                   ; $74B7: $0E $75
    inc  de                                       ; $74B9: $13
    ld   [hl], l                                  ; $74BA: $75
    jr   jr_01F_7532                              ; $74BB: $18 $75

    dec  e                                        ; $74BD: $1D
    ld   [hl], l                                  ; $74BE: $75
    ld   [hl+], a                                 ; $74BF: $22
    ld   [hl], l                                  ; $74C0: $75
    daa                                           ; $74C1: $27
    ld   [hl], l                                  ; $74C2: $75
    inc  l                                        ; $74C3: $2C
    ld   [hl], l                                  ; $74C4: $75
    ld   sp, $3675                                ; $74C5: $31 $75 $36
    ld   [hl], l                                  ; $74C8: $75
    dec  sp                                       ; $74C9: $3B
    ld   [hl], l                                  ; $74CA: $75
    ld   b, b                                     ; $74CB: $40
    ld   [hl], l                                  ; $74CC: $75
    ld   b, l                                     ; $74CD: $45
    ld   [hl], l                                  ; $74CE: $75
    ld   c, d                                     ; $74CF: $4A
    ld   [hl], l                                  ; $74D0: $75
    ld   c, a                                     ; $74D1: $4F
    ld   [hl], l                                  ; $74D2: $75
    ld   d, h                                     ; $74D3: $54
    ld   [hl], l                                  ; $74D4: $75
    ld   e, c                                     ; $74D5: $59
    ld   [hl], l                                  ; $74D6: $75
    ld   e, [hl]                                  ; $74D7: $5E
    ld   [hl], l                                  ; $74D8: $75
    ld   h, e                                     ; $74D9: $63
    ld   [hl], l                                  ; $74DA: $75
    ld   l, b                                     ; $74DB: $68
    ld   [hl], l                                  ; $74DC: $75
    ld   l, l                                     ; $74DD: $6D
    ld   [hl], l                                  ; $74DE: $75
    ld   [hl], d                                  ; $74DF: $72
    ld   [hl], l                                  ; $74E0: $75
    ld   [hl], a                                  ; $74E1: $77
    ld   [hl], l                                  ; $74E2: $75
    ld   a, h                                     ; $74E3: $7C
    ld   [hl], l                                  ; $74E4: $75
    add  c                                        ; $74E5: $81
    ld   [hl], l                                  ; $74E6: $75
    add  [hl]                                     ; $74E7: $86
    ld   [hl], l                                  ; $74E8: $75
    adc  e                                        ; $74E9: $8B
    ld   [hl], l                                  ; $74EA: $75
    nop                                           ; $74EB: $00
    jr   nz, jr_01F_7555                          ; $74EC: $20 $67

    add  b                                        ; $74EE: $80
    ld   [bc], a                                  ; $74EF: $02
    nop                                           ; $74F0: $00
    jr   nz, @+$68                                ; $74F1: $20 $66

    add  b                                        ; $74F3: $80
    ld   [bc], a                                  ; $74F4: $02
    nop                                           ; $74F5: $00
    jr   nz, jr_01F_755D                          ; $74F6: $20 $65

    add  b                                        ; $74F8: $80
    ld   [bc], a                                  ; $74F9: $02
    nop                                           ; $74FA: $00
    jr   nz, jr_01F_7561                          ; $74FB: $20 $64

    add  b                                        ; $74FD: $80
    inc  bc                                       ; $74FE: $03
    nop                                           ; $74FF: $00
    jr   nz, @+$59                                ; $7500: $20 $57

    add  b                                        ; $7502: $80
    inc  bc                                       ; $7503: $03
    nop                                           ; $7504: $00
    jr   nz, jr_01F_755D                          ; $7505: $20 $56

    add  b                                        ; $7507: $80
    inc  bc                                       ; $7508: $03
    nop                                           ; $7509: $00
    jr   nz, jr_01F_7561                          ; $750A: $20 $55

    add  b                                        ; $750C: $80
    inc  b                                        ; $750D: $04
    nop                                           ; $750E: $00
    jr   nz, @+$56                                ; $750F: $20 $54

    add  b                                        ; $7511: $80
    inc  b                                        ; $7512: $04
    nop                                           ; $7513: $00
    jr   nz, jr_01F_755D                          ; $7514: $20 $47

    add  b                                        ; $7516: $80
    inc  b                                        ; $7517: $04
    nop                                           ; $7518: $00
    jr   nz, jr_01F_7561                          ; $7519: $20 $46

    add  b                                        ; $751B: $80
    dec  b                                        ; $751C: $05
    nop                                           ; $751D: $00
    jr   nz, @+$47                                ; $751E: $20 $45

    add  b                                        ; $7520: $80
    dec  b                                        ; $7521: $05
    nop                                           ; $7522: $00
    jr   nz, jr_01F_7569                          ; $7523: $20 $44

    add  b                                        ; $7525: $80
    dec  b                                        ; $7526: $05
    nop                                           ; $7527: $00
    jr   nz, jr_01F_7561                          ; $7528: $20 $37

    add  b                                        ; $752A: $80
    ld   b, $00                                   ; $752B: $06 $00
    jr   nz, @+$38                                ; $752D: $20 $36

    add  b                                        ; $752F: $80
    ld   b, $00                                   ; $7530: $06 $00

jr_01F_7532:
    jr   nz, jr_01F_7569                          ; $7532: $20 $35

    add  b                                        ; $7534: $80
    ld   b, $00                                   ; $7535: $06 $00
    jr   nz, jr_01F_756D                          ; $7537: $20 $34

    add  b                                        ; $7539: $80
    ld   [$2000], sp                              ; $753A: $08 $00 $20
    daa                                           ; $753D: $27
    add  b                                        ; $753E: $80
    ld   [$2000], sp                              ; $753F: $08 $00 $20
    ld   h, $80                                   ; $7542: $26 $80
    ld   a, [bc]                                  ; $7544: $0A
    nop                                           ; $7545: $00
    jr   nz, jr_01F_756D                          ; $7546: $20 $25

    add  b                                        ; $7548: $80
    ld   a, [bc]                                  ; $7549: $0A
    nop                                           ; $754A: $00
    jr   nz, jr_01F_7571                          ; $754B: $20 $24

    add  b                                        ; $754D: $80
    inc  c                                        ; $754E: $0C
    nop                                           ; $754F: $00
    jr   nz, jr_01F_7569                          ; $7550: $20 $17

    add  b                                        ; $7552: $80
    inc  c                                        ; $7553: $0C
    nop                                           ; $7554: $00

jr_01F_7555:
    jr   nz, jr_01F_756D                          ; $7555: $20 $16

    add  b                                        ; $7557: $80
    ld   c, $00                                   ; $7558: $0E $00
    jr   nz, jr_01F_7571                          ; $755A: $20 $15

    add  b                                        ; $755C: $80

jr_01F_755D:
    ld   c, $00                                   ; $755D: $0E $00
    jr   nz, jr_01F_7575                          ; $755F: $20 $14

jr_01F_7561:
    add  b                                        ; $7561: $80
    stop                                          ; $7562: $10 $00
    jr   nz, jr_01F_756D                          ; $7564: $20 $07

    add  b                                        ; $7566: $80
    stop                                          ; $7567: $10 $00

jr_01F_7569:
    jr   nz, jr_01F_7571                          ; $7569: $20 $06

    add  b                                        ; $756B: $80
    ld   [de], a                                  ; $756C: $12

jr_01F_756D:
    nop                                           ; $756D: $00
    jr   nz, jr_01F_7575                          ; $756E: $20 $05

    add  b                                        ; $7570: $80

jr_01F_7571:
    ld   [de], a                                  ; $7571: $12
    nop                                           ; $7572: $00
    jr   nz, @+$06                                ; $7573: $20 $04

jr_01F_7575:
    add  b                                        ; $7575: $80
    inc  d                                        ; $7576: $14
    nop                                           ; $7577: $00
    jr   nz, jr_01F_757D                          ; $7578: $20 $03

    add  b                                        ; $757A: $80
    inc  d                                        ; $757B: $14
    nop                                           ; $757C: $00

jr_01F_757D:
    jr   nz, @+$04                                ; $757D: $20 $02

    add  b                                        ; $757F: $80
    ld   d, $00                                   ; $7580: $16 $00
    jr   nz, jr_01F_7585                          ; $7582: $20 $01

    add  b                                        ; $7584: $80

jr_01F_7585:
    ld   d, $00                                   ; $7585: $16 $00
    jr   nz, jr_01F_7589                          ; $7587: $20 $00

jr_01F_7589:
    add  b                                        ; $7589: $80
    jr   jr_01F_758C                              ; $758A: $18 $00

jr_01F_758C:
    stop                                          ; $758C: $10 $00
    add  b                                        ; $758E: $80
    jr   nz, @+$40                                ; $758F: $20 $3E

    rlca                                          ; $7591: $07
    ld   [$D3BF], a                               ; $7592: $EA $BF $D3
    ld   hl, $75C6                                ; $7595: $21 $C6 $75
    jp   label_01F_79E4                           ; $7598: $C3 $E4 $79

    call IncrementValueAtBC                            ; $759B: $CD $75 $7A
    cp   $09                                      ; $759E: $FE $09
    jr   z, jr_01F_75AB                           ; $75A0: $28 $09

jr_01F_75A2:
    ld   hl, $75B6                                ; $75A2: $21 $B6 $75
    call GetHandlerAddressInTable                 ; $75A5: $CD $64 $7A
    jp   $7A25                                    ; $75A8: $C3 $25 $7A

jr_01F_75AB:
    call func_01F_7AAC                            ; $75AB: $CD $AC $7A
    jp   z, label_01F_7A07                        ; $75AE: $CA $07 $7A

    ld   a, $01                                   ; $75B1: $3E $01
    ld   [bc], a                                  ; $75B3: $02
    jr   jr_01F_75A2                              ; $75B4: $18 $EC

    bit  6, l                                     ; $75B6: $CB $75
    adc  $75                                      ; $75B8: $CE $75
    pop  de                                       ; $75BA: $D1
    ld   [hl], l                                  ; $75BB: $75
    call nc, $D775                                ; $75BC: $D4 $75 $D7
    ld   [hl], l                                  ; $75BF: $75
    call nc, $D175                                ; $75C0: $D4 $75 $D1
    ld   [hl], l                                  ; $75C3: $75
    adc  $75                                      ; $75C4: $CE $75
    nop                                           ; $75C6: $00
    db   $F4                                      ; $75C7: $F4
    rrca                                          ; $75C8: $0F
    add  b                                        ; $75C9: $80
    ld   bc, $0E                                  ; $75CA: $01 $0E $00
    ld   bc, $0D                                  ; $75CD: $01 $0D $00
    ld   bc, $0C                                  ; $75D0: $01 $0C $00
    ld   bc, $0B                                  ; $75D3: $01 $0B $00
    ld   bc, $0A                                  ; $75D6: $01 $0A $00
    ld   bc, label_73E                            ; $75D9: $01 $3E $07
    ld   [$D3BF], a                               ; $75DC: $EA $BF $D3
    call func_01F_7A33                            ; $75DF: $CD $33 $7A
    ld   hl, $6217                                ; $75E2: $21 $17 $62
    call func_01F_7AD0                            ; $75E5: $CD $D0 $7A
    jp   label_01F_7A7F                           ; $75E8: $C3 $7F $7A

    call IncrementValueAtBC                            ; $75EB: $CD $75 $7A
    cp   $09                                      ; $75EE: $FE $09
    jr   z, jr_01F_75FC                           ; $75F0: $28 $0A

    cp   $0A                                      ; $75F2: $FE $0A
    jr   z, jr_01F_7605                           ; $75F4: $28 $0F

jr_01F_75F6:
    ld   hl, $6205                                ; $75F6: $21 $05 $62
    jp   label_01F_7B11                           ; $75F9: $C3 $11 $7B

jr_01F_75FC:
    call func_01F_7AAC                            ; $75FC: $CD $AC $7A
    jp   z, label_01F_7A51                        ; $75FF: $CA $51 $7A

    ld   a, [bc]                                  ; $7602: $0A
    jr   jr_01F_75F6                              ; $7603: $18 $F1

jr_01F_7605:
    ld   a, $01                                   ; $7605: $3E $01
    ld   [bc], a                                  ; $7607: $02
    jr   jr_01F_75F6                              ; $7608: $18 $EC

    ld   hl, $7647                                ; $760A: $21 $47 $76
    jp   label_01F_79E9                           ; $760D: $C3 $E9 $79

    call DecrementValueAtDE                            ; $7610: $CD $71 $7A
    ret  nz                                       ; $7613: $C0

    call IncrementValueAtBC                            ; $7614: $CD $75 $7A
    cp   $12                                      ; $7617: $FE $12
    jp   z, label_01F_7A07                        ; $7619: $CA $07 $7A

    ld   hl, $7625                                ; $761C: $21 $25 $76
    call GetHandlerAddressInTable                 ; $761F: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7622: $C3 $8B $7A

    ld   c, h                                     ; $7625: $4C
    db   $76                                      ; $7626: $76
    ld   d, c                                     ; $7627: $51
    db   $76                                      ; $7628: $76
    ld   d, [hl]                                  ; $7629: $56
    db   $76                                      ; $762A: $76
    ld   e, e                                     ; $762B: $5B
    db   $76                                      ; $762C: $76
    ld   h, b                                     ; $762D: $60
    db   $76                                      ; $762E: $76
    ld   h, l                                     ; $762F: $65
    db   $76                                      ; $7630: $76
    ld   l, d                                     ; $7631: $6A
    db   $76                                      ; $7632: $76
    ld   l, a                                     ; $7633: $6F
    db   $76                                      ; $7634: $76
    ld   [hl], h                                  ; $7635: $74
    db   $76                                      ; $7636: $76
    ld   a, c                                     ; $7637: $79
    db   $76                                      ; $7638: $76
    ld   a, [hl]                                  ; $7639: $7E
    db   $76                                      ; $763A: $76
    add  e                                        ; $763B: $83
    db   $76                                      ; $763C: $76
    adc  b                                        ; $763D: $88
    db   $76                                      ; $763E: $76
    adc  l                                        ; $763F: $8D
    db   $76                                      ; $7640: $76
    sub  d                                        ; $7641: $92
    db   $76                                      ; $7642: $76
    sub  a                                        ; $7643: $97
    db   $76                                      ; $7644: $76
    sbc  h                                        ; $7645: $9C
    halt                                          ; $7646: $76 $00
    jr   nz, @+$0E                                ; $7648: $20 $0C

    add  b                                        ; $764A: $80
    ld   bc, $4000                                ; $764B: $01 $00 $40
    dec  c                                        ; $764E: $0D
    add  b                                        ; $764F: $80
    ld   bc, $6000                                ; $7650: $01 $00 $60
    ld   c, $80                                   ; $7653: $0E $80
    ld   bc, vTiles0                              ; $7655: $01 $00 $80
    rrca                                          ; $7658: $0F
    add  b                                        ; $7659: $80
    ld   bc, $A000                                ; $765A: $01 $00 $A0
    inc  e                                        ; $765D: $1C
    add  b                                        ; $765E: $80
    ld   bc, $E000                                ; $765F: $01 $00 $E0
    dec  e                                        ; $7662: $1D
    add  b                                        ; $7663: $80
    ld   bc, wOAMBuffer                           ; $7664: $01 $00 $C0
    ld   e, $80                                   ; $7667: $1E $80
    ld   [bc], a                                  ; $7669: $02
    nop                                           ; $766A: $00
    or   b                                        ; $766B: $B0
    rra                                           ; $766C: $1F
    add  b                                        ; $766D: $80
    ld   [bc], a                                  ; $766E: $02
    nop                                           ; $766F: $00
    and  b                                        ; $7670: $A0
    inc  l                                        ; $7671: $2C
    add  b                                        ; $7672: $80
    ld   [bc], a                                  ; $7673: $02
    nop                                           ; $7674: $00
    sub  b                                        ; $7675: $90
    dec  l                                        ; $7676: $2D
    add  b                                        ; $7677: $80
    ld   [bc], a                                  ; $7678: $02
    nop                                           ; $7679: $00
    add  b                                        ; $767A: $80
    ld   l, $80                                   ; $767B: $2E $80
    ld   [bc], a                                  ; $767D: $02
    nop                                           ; $767E: $00
    ld   [hl], b                                  ; $767F: $70
    cpl                                           ; $7680: $2F
    add  b                                        ; $7681: $80
    ld   [bc], a                                  ; $7682: $02
    nop                                           ; $7683: $00
    ld   h, b                                     ; $7684: $60
    inc  a                                        ; $7685: $3C
    add  b                                        ; $7686: $80
    ld   [bc], a                                  ; $7687: $02
    nop                                           ; $7688: $00
    ld   d, b                                     ; $7689: $50
    dec  a                                        ; $768A: $3D
    add  b                                        ; $768B: $80
    ld   [bc], a                                  ; $768C: $02
    nop                                           ; $768D: $00
    ld   b, b                                     ; $768E: $40
    ld   a, $80                                   ; $768F: $3E $80
    ld   [bc], a                                  ; $7691: $02
    nop                                           ; $7692: $00
    jr   nc, jr_01F_76D4                          ; $7693: $30 $3F

    add  b                                        ; $7695: $80
    ld   [bc], a                                  ; $7696: $02
    nop                                           ; $7697: $00
    jr   nz, jr_01F_76E6                          ; $7698: $20 $4C

    add  b                                        ; $769A: $80
    ld   [bc], a                                  ; $769B: $02
    scf                                           ; $769C: $37
    db   $10                                      ; $769D: $10
    ld   c, l                                     ; $769E: $4D
    ret  nz                                       ; $769F: $C0

    ld   [bc], a                                  ; $76A0: $02
    ld   hl, $76D6                                ; $76A1: $21 $D6 $76
    jp   label_01F_79E9                           ; $76A4: $C3 $E9 $79

    call DecrementValueAtDE                            ; $76A7: $CD $71 $7A
    ret  nz                                       ; $76AA: $C0

    call IncrementValueAtBC                            ; $76AB: $CD $75 $7A
    cp   $0E                                      ; $76AE: $FE $0E
    jp   z, label_01F_7A07                        ; $76B0: $CA $07 $7A

    ld   hl, $76BC                                ; $76B3: $21 $BC $76
    call GetHandlerAddressInTable                 ; $76B6: $CD $64 $7A
    jp   label_01F_7A8B                           ; $76B9: $C3 $8B $7A

    db   $DB                                      ; $76BC: $DB
    db   $76                                      ; $76BD: $76
    ldh  [rPCM12], a                              ; $76BE: $E0 $76
    push hl                                       ; $76C0: $E5
    db   $76                                      ; $76C1: $76
    ld   [$EF76], a                               ; $76C2: $EA $76 $EF
    db   $76                                      ; $76C5: $76
    db   $F4                                      ; $76C6: $F4
    db   $76                                      ; $76C7: $76
    ld   sp, hl                                   ; $76C8: $F9
    db   $76                                      ; $76C9: $76
    cp   $76                                      ; $76CA: $FE $76
    inc  bc                                       ; $76CC: $03
    ld   [hl], a                                  ; $76CD: $77
    ld   [$0D77], sp                              ; $76CE: $08 $77 $0D
    ld   [hl], a                                  ; $76D1: $77
    ld   [de], a                                  ; $76D2: $12
    ld   [hl], a                                  ; $76D3: $77

jr_01F_76D4:
    rla                                           ; $76D4: $17
    ld   [hl], a                                  ; $76D5: $77
    nop                                           ; $76D6: $00
    jr   nc, jr_01F_7716                          ; $76D7: $30 $3D

    add  b                                        ; $76D9: $80
    ld   [bc], a                                  ; $76DA: $02
    nop                                           ; $76DB: $00
    ld   h, b                                     ; $76DC: $60
    ccf                                           ; $76DD: $3F
    add  b                                        ; $76DE: $80
    ld   [bc], a                                  ; $76DF: $02
    nop                                           ; $76E0: $00
    sub  b                                        ; $76E1: $90
    dec  a                                        ; $76E2: $3D
    add  b                                        ; $76E3: $80
    ld   [bc], a                                  ; $76E4: $02
    nop                                           ; $76E5: $00

jr_01F_76E6:
    ret  nz                                       ; $76E6: $C0

    ccf                                           ; $76E7: $3F
    add  b                                        ; $76E8: $80
    ld   [bc], a                                  ; $76E9: $02
    nop                                           ; $76EA: $00
    ldh  a, [$FF3D]                               ; $76EB: $F0 $3D
    add  b                                        ; $76ED: $80
    ld   [bc], a                                  ; $76EE: $02
    nop                                           ; $76EF: $00
    ret  nc                                       ; $76F0: $D0

    ccf                                           ; $76F1: $3F
    add  b                                        ; $76F2: $80
    ld   [bc], a                                  ; $76F3: $02
    nop                                           ; $76F4: $00
    or   b                                        ; $76F5: $B0
    dec  a                                        ; $76F6: $3D
    add  b                                        ; $76F7: $80
    ld   [bc], a                                  ; $76F8: $02
    nop                                           ; $76F9: $00
    sub  b                                        ; $76FA: $90
    ccf                                           ; $76FB: $3F
    add  b                                        ; $76FC: $80
    ld   [bc], a                                  ; $76FD: $02
    nop                                           ; $76FE: $00
    ld   [hl], b                                  ; $76FF: $70
    dec  a                                        ; $7700: $3D
    add  b                                        ; $7701: $80
    inc  bc                                       ; $7702: $03
    nop                                           ; $7703: $00
    ld   d, b                                     ; $7704: $50
    ccf                                           ; $7705: $3F
    add  b                                        ; $7706: $80
    inc  bc                                       ; $7707: $03
    nop                                           ; $7708: $00
    ld   b, b                                     ; $7709: $40
    dec  a                                        ; $770A: $3D
    add  b                                        ; $770B: $80
    inc  b                                        ; $770C: $04
    nop                                           ; $770D: $00
    jr   nc, jr_01F_774F                          ; $770E: $30 $3F

    add  b                                        ; $7710: $80
    inc  b                                        ; $7711: $04
    nop                                           ; $7712: $00
    jr   nz, jr_01F_7752                          ; $7713: $20 $3D

    add  b                                        ; $7715: $80

jr_01F_7716:
    inc  b                                        ; $7716: $04
    cpl                                           ; $7717: $2F
    db   $10                                      ; $7718: $10
    ccf                                           ; $7719: $3F
    ret  nz                                       ; $771A: $C0

    inc  b                                        ; $771B: $04
    xor  a                                        ; $771C: $AF
    ld   [$D361], a                               ; $771D: $EA $61 $D3
    ld   hl, $D31F                                ; $7720: $21 $1F $D3
    set  7, [hl]                                  ; $7723: $CB $FE
    ld   a, $01                                   ; $7725: $3E $01
    ld   [$D3C6], a                               ; $7727: $EA $C6 $D3
    ld   hl, $775E                                ; $772A: $21 $5E $77
    jp   label_01F_79E4                           ; $772D: $C3 $E4 $79

    call DecrementValueAtDE                            ; $7730: $CD $71 $7A
    ret  nz                                       ; $7733: $C0

    call IncrementValueAtBC                            ; $7734: $CD $75 $7A
    cp   $03                                      ; $7737: $FE $03
    jr   z, jr_01F_774C                           ; $7739: $28 $11

    ld   hl, $775A                                ; $773B: $21 $5A $77
    call GetHandlerAddressInTable                 ; $773E: $CD $64 $7A
    ld   a, [$D398]                               ; $7741: $FA $98 $D3
    cp   $01                                      ; $7744: $FE $01
    jp   z, label_01F_7A79                        ; $7746: $CA $79 $7A

    jp   label_01F_7A8B                           ; $7749: $C3 $8B $7A

jr_01F_774C:
    xor  a                                        ; $774C: $AF
    ldh  [rNR10], a                               ; $774D: $E0 $10

jr_01F_774F:
    ld   [$D3C6], a                               ; $774F: $EA $C6 $D3

jr_01F_7752:
    ld   hl, $D31F                                ; $7752: $21 $1F $D3
    res  7, [hl]                                  ; $7755: $CB $BE
    jp   label_01F_7A07                           ; $7757: $C3 $07 $7A

jr_01F_775A:
    ld   h, e                                     ; $775A: $63
    ld   [hl], a                                  ; $775B: $77
    ld   l, c                                     ; $775C: $69
    ld   [hl], a                                  ; $775D: $77
    nop                                           ; $775E: $00

jr_01F_775F:
    jr   nz, @+$72                                ; $775F: $20 $70

    add  b                                        ; $7761: $80
    ld   bc, $511D                                ; $7762: $01 $1D $51
    add  d                                        ; $7765: $82
    ld   e, c                                     ; $7766: $59
    rst  $00                                      ; $7767: $C7
    inc  bc                                       ; $7768: $03
    nop                                           ; $7769: $00
    ld   b, d                                     ; $776A: $42
    ld   d, b                                     ; $776B: $50
    add  b                                        ; $776C: $80
    ld   [$EAAF], sp                              ; $776D: $08 $AF $EA
    ld   h, c                                     ; $7770: $61
    db   $D3                                      ; $7771: $D3
    ld   hl, $D31F                                ; $7772: $21 $1F $D3
    set  7, [hl]                                  ; $7775: $CB $FE
    ld   a, $01                                   ; $7777: $3E $01
    ld   [$D3C6], a                               ; $7779: $EA $C6 $D3
    ld   hl, $77D6                                ; $777C: $21 $D6 $77
    call func_01F_79E4                            ; $777F: $CD $E4 $79
    ld   a, $F0                                   ; $7782: $3E $F0
    ld   [$D3BF], a                               ; $7784: $EA $BF $D3
    ld   hl, $77E0                                ; $7787: $21 $E0 $77
    call func_01F_7AB7                            ; $778A: $CD $B7 $7A
    jp   label_01F_7A79                           ; $778D: $C3 $79 $7A

    ld   hl, $D3E6                                ; $7790: $21 $E6 $D3
    ld   a, [hl]                                  ; $7793: $7E
    and  a                                        ; $7794: $A7
    jr   z, jr_01F_77C0                           ; $7795: $28 $29

    xor  a                                        ; $7797: $AF
    ld   [hl], a                                  ; $7798: $77
    call func_01F_7AAC                            ; $7799: $CD $AC $7A
    jr   z, jr_01F_77C0                           ; $779C: $28 $22

    cp   $E0                                      ; $779E: $FE $E0
    jr   z, jr_01F_77B3                           ; $77A0: $28 $11

    cp   $D8                                      ; $77A2: $FE $D8
    jr   nc, jr_01F_77AF                          ; $77A4: $30 $09

    ld   a, $02                                   ; $77A6: $3E $02

jr_01F_77A8:
    ld   [bc], a                                  ; $77A8: $02
    ld   hl, $77D2                                ; $77A9: $21 $D2 $77
    jp   label_01F_7AE1                           ; $77AC: $C3 $E1 $7A

jr_01F_77AF:
    ld   a, $01                                   ; $77AF: $3E $01
    jr   jr_01F_77A8                              ; $77B1: $18 $F5

jr_01F_77B3:
    ld   hl, $77DB                                ; $77B3: $21 $DB $77
    call func_01F_7A8B                            ; $77B6: $CD $8B $7A
    ld   a, $01                                   ; $77B9: $3E $01
    ld   bc, $D398                                ; $77BB: $01 $98 $D3
    jr   jr_01F_77A8                              ; $77BE: $18 $E8

jr_01F_77C0:
    xor  a                                        ; $77C0: $AF
    ld   [$D3C6], a                               ; $77C1: $EA $C6 $D3
    ld   hl, $D31F                                ; $77C4: $21 $1F $D3
    res  7, [hl]                                  ; $77C7: $CB $BE
    ld   hl, $53D9                                ; $77C9: $21 $D9 $53
    call func_01F_7A79                            ; $77CC: $CD $79 $7A
    jp   label_01F_7A01                           ; $77CF: $C3 $01 $7A

    nop                                           ; $77D2: $00
    ld   [bc], a                                  ; $77D3: $02
    nop                                           ; $77D4: $00
    nop                                           ; $77D5: $00
    nop                                           ; $77D6: $00
    dec  e                                        ; $77D7: $1D
    jr   nz, jr_01F_775A                          ; $77D8: $20 $80

    ld   bc, $6000                                ; $77DA: $01 $00 $60
    jr   nz, jr_01F_775F                          ; $77DD: $20 $80

    ld   bc, $4000                                ; $77DF: $01 $00 $40
    db   $10                                      ; $77E2: $10
    and  b                                        ; $77E3: $A0
    add  a                                        ; $77E4: $87
    ld   bc, $A321                                ; $77E5: $01 $21 $A3
    ld   a, b                                     ; $77E8: $78
    jp   label_01F_79E4                           ; $77E9: $C3 $E4 $79

    call DecrementValueAtDE                            ; $77EC: $CD $71 $7A
    ret  nz                                       ; $77EF: $C0

    call IncrementValueAtBC                            ; $77F0: $CD $75 $7A
    cp   $51                                      ; $77F3: $FE $51
    jp   z, label_01F_7A01                        ; $77F5: $CA $01 $7A

    ld   hl, $7801                                ; $77F8: $21 $01 $78
    call GetHandlerAddressInTable                 ; $77FB: $CD $64 $7A
    jp   $7A25                                    ; $77FE: $C3 $25 $7A

    xor  b                                        ; $7801: $A8
    ld   a, b                                     ; $7802: $78
    xor  e                                        ; $7803: $AB
    ld   a, b                                     ; $7804: $78
    xor  [hl]                                     ; $7805: $AE
    ld   a, b                                     ; $7806: $78
    or   c                                        ; $7807: $B1
    ld   a, b                                     ; $7808: $78
    or   h                                        ; $7809: $B4
    ld   a, b                                     ; $780A: $78
    or   a                                        ; $780B: $B7
    ld   a, b                                     ; $780C: $78
    or   h                                        ; $780D: $B4
    ld   a, b                                     ; $780E: $78
    or   c                                        ; $780F: $B1
    ld   a, b                                     ; $7810: $78
    xor  [hl]                                     ; $7811: $AE
    ld   a, b                                     ; $7812: $78
    or   c                                        ; $7813: $B1
    ld   a, b                                     ; $7814: $78
    or   h                                        ; $7815: $B4
    ld   a, b                                     ; $7816: $78
    or   a                                        ; $7817: $B7
    ld   a, b                                     ; $7818: $78
    cp   d                                        ; $7819: $BA
    ld   a, b                                     ; $781A: $78
    cp   l                                        ; $781B: $BD
    ld   a, b                                     ; $781C: $78
    ret  nz                                       ; $781D: $C0

    ld   a, b                                     ; $781E: $78
    cp   l                                        ; $781F: $BD
    ld   a, b                                     ; $7820: $78
    cp   d                                        ; $7821: $BA
    ld   a, b                                     ; $7822: $78
    or   a                                        ; $7823: $B7
    ld   a, b                                     ; $7824: $78

jr_01F_7825:
    cp   d                                        ; $7825: $BA
    ld   a, b                                     ; $7826: $78
    cp   l                                        ; $7827: $BD
    ld   a, b                                     ; $7828: $78
    ret  nz                                       ; $7829: $C0

    ld   a, b                                     ; $782A: $78
    jp   $C678                                    ; $782B: $C3 $78 $C6

    ld   a, b                                     ; $782E: $78
    ret                                           ; $782F: $C9

    ld   a, b                                     ; $7830: $78
    add  $78                                      ; $7831: $C6 $78
    jp   $C078                                    ; $7833: $C3 $78 $C0

    ld   a, b                                     ; $7836: $78
    jp   $C678                                    ; $7837: $C3 $78 $C6

    ld   a, b                                     ; $783A: $78
    ret                                           ; $783B: $C9

    ld   a, b                                     ; $783C: $78
    call z, $CF78                                 ; $783D: $CC $78 $CF
    ld   a, b                                     ; $7840: $78
    jp   nc, $CF78                                ; $7841: $D2 $78 $CF

    ld   a, b                                     ; $7844: $78
    call z, $C978                                 ; $7845: $CC $78 $C9
    ld   a, b                                     ; $7848: $78
    call z, $CF78                                 ; $7849: $CC $78 $CF
    ld   a, b                                     ; $784C: $78
    jp   nc, $D578                                ; $784D: $D2 $78 $D5

    ld   a, b                                     ; $7850: $78
    ret  c                                        ; $7851: $D8

    ld   a, b                                     ; $7852: $78
    db   $DB                                      ; $7853: $DB
    ld   a, b                                     ; $7854: $78
    ret  c                                        ; $7855: $D8

    ld   a, b                                     ; $7856: $78
    push de                                       ; $7857: $D5
    ld   a, b                                     ; $7858: $78
    jp   nc, $D578                                ; $7859: $D2 $78 $D5

    ld   a, b                                     ; $785C: $78
    ret  c                                        ; $785D: $D8

    ld   a, b                                     ; $785E: $78
    db   $DB                                      ; $785F: $DB
    ld   a, b                                     ; $7860: $78
    sbc  $78                                      ; $7861: $DE $78
    pop  hl                                       ; $7863: $E1
    ld   a, b                                     ; $7864: $78
    db   $E4                                      ; $7865: $E4
    ld   a, b                                     ; $7866: $78
    pop  hl                                       ; $7867: $E1
    ld   a, b                                     ; $7868: $78
    sbc  $78                                      ; $7869: $DE $78
    db   $DB                                      ; $786B: $DB
    ld   a, b                                     ; $786C: $78
    sbc  $78                                      ; $786D: $DE $78
    pop  hl                                       ; $786F: $E1
    ld   a, b                                     ; $7870: $78
    db   $E4                                      ; $7871: $E4
    ld   a, b                                     ; $7872: $78
    rst  $20                                      ; $7873: $E7
    ld   a, b                                     ; $7874: $78
    ld   [$ED78], a                               ; $7875: $EA $78 $ED
    ld   a, b                                     ; $7878: $78
    ld   [$E778], a                               ; $7879: $EA $78 $E7
    ld   a, b                                     ; $787C: $78
    db   $E4                                      ; $787D: $E4
    ld   a, b                                     ; $787E: $78
    rst  $20                                      ; $787F: $E7
    ld   a, b                                     ; $7880: $78
    ld   [$ED78], a                               ; $7881: $EA $78 $ED
    ld   a, b                                     ; $7884: $78
    ldh  a, [$FF78]                               ; $7885: $F0 $78
    di                                            ; $7887: $F3
    ld   a, b                                     ; $7888: $78
    or   $78                                      ; $7889: $F6 $78
    di                                            ; $788B: $F3
    ld   a, b                                     ; $788C: $78
    ldh  a, [$FF78]                               ; $788D: $F0 $78
    db   $ED                                      ; $788F: $ED
    ld   a, b                                     ; $7890: $78
    ldh  a, [$FF78]                               ; $7891: $F0 $78
    di                                            ; $7893: $F3
    ld   a, b                                     ; $7894: $78
    or   $78                                      ; $7895: $F6 $78
    ld   sp, hl                                   ; $7897: $F9
    ld   a, b                                     ; $7898: $78
    db   $FC                                      ; $7899: $FC
    ld   a, b                                     ; $789A: $78
    rst  $38                                      ; $789B: $FF
    ld   a, b                                     ; $789C: $78
    ld   [bc], a                                  ; $789D: $02
    ld   a, c                                     ; $789E: $79
    rst  $38                                      ; $789F: $FF
    ld   a, b                                     ; $78A0: $78
    ld   [bc], a                                  ; $78A1: $02
    ld   a, c                                     ; $78A2: $79
    jr   c, jr_01F_7825                           ; $78A3: $38 $80

    inc  h                                        ; $78A5: $24
    add  b                                        ; $78A6: $80
    ld   [bc], a                                  ; $78A7: $02
    dec  h                                        ; $78A8: $25
    add  b                                        ; $78A9: $80
    ld   [bc], a                                  ; $78AA: $02
    ld   h, $80                                   ; $78AB: $26 $80
    ld   [bc], a                                  ; $78AD: $02
    daa                                           ; $78AE: $27
    add  b                                        ; $78AF: $80
    ld   [bc], a                                  ; $78B0: $02
    inc  [hl]                                     ; $78B1: $34
    add  b                                        ; $78B2: $80
    ld   [bc], a                                  ; $78B3: $02
    dec  [hl]                                     ; $78B4: $35
    add  b                                        ; $78B5: $80
    ld   [bc], a                                  ; $78B6: $02
    ld   [hl], $80                                ; $78B7: $36 $80
    ld   [bc], a                                  ; $78B9: $02
    scf                                           ; $78BA: $37
    add  b                                        ; $78BB: $80
    ld   [bc], a                                  ; $78BC: $02
    ld   b, h                                     ; $78BD: $44
    add  b                                        ; $78BE: $80
    ld   [bc], a                                  ; $78BF: $02
    ld   b, l                                     ; $78C0: $45
    add  b                                        ; $78C1: $80
    ld   [bc], a                                  ; $78C2: $02
    ld   b, [hl]                                  ; $78C3: $46
    add  b                                        ; $78C4: $80
    ld   [bc], a                                  ; $78C5: $02
    ld   b, a                                     ; $78C6: $47
    add  b                                        ; $78C7: $80
    ld   [bc], a                                  ; $78C8: $02
    inc  a                                        ; $78C9: $3C
    add  b                                        ; $78CA: $80
    inc  bc                                       ; $78CB: $03
    dec  a                                        ; $78CC: $3D
    add  b                                        ; $78CD: $80
    inc  bc                                       ; $78CE: $03
    ld   a, $80                                   ; $78CF: $3E $80
    inc  bc                                       ; $78D1: $03
    ccf                                           ; $78D2: $3F
    add  b                                        ; $78D3: $80
    inc  bc                                       ; $78D4: $03
    ld   c, h                                     ; $78D5: $4C
    add  b                                        ; $78D6: $80
    inc  bc                                       ; $78D7: $03
    ld   c, l                                     ; $78D8: $4D
    add  b                                        ; $78D9: $80
    inc  bc                                       ; $78DA: $03
    ld   c, [hl]                                  ; $78DB: $4E
    add  b                                        ; $78DC: $80
    inc  bc                                       ; $78DD: $03
    ld   c, a                                     ; $78DE: $4F
    add  b                                        ; $78DF: $80
    inc  bc                                       ; $78E0: $03
    ld   e, h                                     ; $78E1: $5C
    add  b                                        ; $78E2: $80
    inc  bc                                       ; $78E3: $03
    ld   e, l                                     ; $78E4: $5D
    add  b                                        ; $78E5: $80
    inc  bc                                       ; $78E6: $03
    ld   e, [hl]                                  ; $78E7: $5E
    add  b                                        ; $78E8: $80
    inc  bc                                       ; $78E9: $03
    ld   e, a                                     ; $78EA: $5F
    add  b                                        ; $78EB: $80
    inc  bc                                       ; $78EC: $03
    ld   l, h                                     ; $78ED: $6C
    add  b                                        ; $78EE: $80
    inc  bc                                       ; $78EF: $03
    ld   l, l                                     ; $78F0: $6D
    ret  nz                                       ; $78F1: $C0

    inc  bc                                       ; $78F2: $03
    ld   l, [hl]                                  ; $78F3: $6E
    ret  nz                                       ; $78F4: $C0

    inc  bc                                       ; $78F5: $03
    ld   l, a                                     ; $78F6: $6F
    ret  nz                                       ; $78F7: $C0

    inc  bc                                       ; $78F8: $03
    ld   a, h                                     ; $78F9: $7C
    ret  nz                                       ; $78FA: $C0

    inc  bc                                       ; $78FB: $03
    ld   a, l                                     ; $78FC: $7D
    ret  nz                                       ; $78FD: $C0

    inc  bc                                       ; $78FE: $03
    ld   a, [hl]                                  ; $78FF: $7E
    ret  nz                                       ; $7900: $C0

    inc  bc                                       ; $7901: $03
    ld   a, a                                     ; $7902: $7F
    ret  nz                                       ; $7903: $C0

    inc  bc                                       ; $7904: $03
    ld   hl, $7933                                ; $7905: $21 $33 $79
    jp   label_01F_79E4                           ; $7908: $C3 $E4 $79

    ld   a, [$D3E8]                               ; $790B: $FA $E8 $D3
    and  a                                        ; $790E: $A7
    ret  nz                                       ; $790F: $C0

    call DecrementValueAtDE                            ; $7910: $CD $71 $7A
    ret  nz                                       ; $7913: $C0

    call IncrementValueAtBC                            ; $7914: $CD $75 $7A
    cp   $08                                      ; $7917: $FE $08
    jp   z, label_01F_7A07                        ; $7919: $CA $07 $7A

    ld   hl, $7925                                ; $791C: $21 $25 $79
    call GetHandlerAddressInTable                 ; $791F: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7922: $C3 $8B $7A

    jr   c, jr_01F_79A0                           ; $7925: $38 $79

    dec  a                                        ; $7927: $3D
    ld   a, c                                     ; $7928: $79
    ld   b, d                                     ; $7929: $42
    ld   a, c                                     ; $792A: $79
    ld   b, a                                     ; $792B: $47
    ld   a, c                                     ; $792C: $79
    ld   c, h                                     ; $792D: $4C
    ld   a, c                                     ; $792E: $79
    ld   d, c                                     ; $792F: $51
    ld   a, c                                     ; $7930: $79
    ld   d, [hl]                                  ; $7931: $56
    ld   a, c                                     ; $7932: $79
    nop                                           ; $7933: $00
    rra                                           ; $7934: $1F
    ld   a, a                                     ; $7935: $7F
    add  b                                        ; $7936: $80
    ld   bc, $E000                                ; $7937: $01 $00 $E0
    ld   b, h                                     ; $793A: $44
    add  b                                        ; $793B: $80
    ld   b, $00                                   ; $793C: $06 $00
    ret  nz                                       ; $793E: $C0

    ld   b, l                                     ; $793F: $45
    add  b                                        ; $7940: $80
    ld   b, $00                                   ; $7941: $06 $00
    and  b                                        ; $7943: $A0
    ld   b, [hl]                                  ; $7944: $46
    add  b                                        ; $7945: $80
    ld   b, $00                                   ; $7946: $06 $00
    add  b                                        ; $7948: $80
    ld   b, a                                     ; $7949: $47
    add  b                                        ; $794A: $80
    ld   b, $00                                   ; $794B: $06 $00
    ld   h, b                                     ; $794D: $60
    ld   d, h                                     ; $794E: $54
    add  b                                        ; $794F: $80
    ld   b, $00                                   ; $7950: $06 $00
    ld   b, b                                     ; $7952: $40
    ld   d, l                                     ; $7953: $55
    add  b                                        ; $7954: $80
    ld   b, $38                                   ; $7955: $06 $38
    jr   nz, jr_01F_79AF                          ; $7957: $20 $56

    ret  nz                                       ; $7959: $C0

    ld   b, $21                                   ; $795A: $06 $21
    sub  h                                        ; $795C: $94
    ld   a, c                                     ; $795D: $79
    jp   label_01F_79E4                           ; $795E: $C3 $E4 $79

    call DecrementValueAtDE                            ; $7961: $CD $71 $7A
    ret  nz                                       ; $7964: $C0

    call IncrementValueAtBC                            ; $7965: $CD $75 $7A
    cp   $10                                      ; $7968: $FE $10
    jp   z, label_01F_7A07                        ; $796A: $CA $07 $7A

    ld   hl, $7976                                ; $796D: $21 $76 $79
    call GetHandlerAddressInTable                 ; $7970: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7973: $C3 $8B $7A

    sbc  c                                        ; $7976: $99
    ld   a, c                                     ; $7977: $79
    sbc  [hl]                                     ; $7978: $9E
    ld   a, c                                     ; $7979: $79
    and  e                                        ; $797A: $A3
    ld   a, c                                     ; $797B: $79
    xor  b                                        ; $797C: $A8
    ld   a, c                                     ; $797D: $79
    xor  l                                        ; $797E: $AD
    ld   a, c                                     ; $797F: $79
    or   d                                        ; $7980: $B2
    ld   a, c                                     ; $7981: $79
    or   a                                        ; $7982: $B7
    ld   a, c                                     ; $7983: $79
    cp   h                                        ; $7984: $BC
    ld   a, c                                     ; $7985: $79
    pop  bc                                       ; $7986: $C1
    ld   a, c                                     ; $7987: $79
    add  $79                                      ; $7988: $C6 $79
    bit  7, c                                     ; $798A: $CB $79
    ret  nc                                       ; $798C: $D0

    ld   a, c                                     ; $798D: $79
    push de                                       ; $798E: $D5
    ld   a, c                                     ; $798F: $79
    jp   c, $DF79                                 ; $7990: $DA $79 $DF

    ld   a, c                                     ; $7993: $79
    nop                                           ; $7994: $00
    jr   nz, jr_01F_79BE                          ; $7995: $20 $27

    add  b                                        ; $7997: $80
    ld   [bc], a                                  ; $7998: $02
    nop                                           ; $7999: $00
    ld   b, b                                     ; $799A: $40
    dec  h                                        ; $799B: $25
    add  b                                        ; $799C: $80
    ld   [bc], a                                  ; $799D: $02
    nop                                           ; $799E: $00
    ld   h, b                                     ; $799F: $60

jr_01F_79A0:
    rla                                           ; $79A0: $17
    add  b                                        ; $79A1: $80
    ld   [bc], a                                  ; $79A2: $02
    nop                                           ; $79A3: $00
    add  b                                        ; $79A4: $80
    dec  d                                        ; $79A5: $15
    add  b                                        ; $79A6: $80
    ld   [bc], a                                  ; $79A7: $02
    nop                                           ; $79A8: $00
    and  b                                        ; $79A9: $A0
    rla                                           ; $79AA: $17
    add  b                                        ; $79AB: $80
    ld   [bc], a                                  ; $79AC: $02
    nop                                           ; $79AD: $00
    ret  nz                                       ; $79AE: $C0

jr_01F_79AF:
    dec  h                                        ; $79AF: $25
    add  b                                        ; $79B0: $80
    inc  b                                        ; $79B1: $04
    nop                                           ; $79B2: $00
    or   b                                        ; $79B3: $B0
    daa                                           ; $79B4: $27
    add  b                                        ; $79B5: $80
    inc  b                                        ; $79B6: $04
    nop                                           ; $79B7: $00
    and  b                                        ; $79B8: $A0
    dec  h                                        ; $79B9: $25
    add  b                                        ; $79BA: $80
    inc  b                                        ; $79BB: $04
    nop                                           ; $79BC: $00
    sub  b                                        ; $79BD: $90

jr_01F_79BE:
    rla                                           ; $79BE: $17
    add  b                                        ; $79BF: $80
    inc  b                                        ; $79C0: $04
    nop                                           ; $79C1: $00
    add  b                                        ; $79C2: $80
    dec  d                                        ; $79C3: $15
    ret  nz                                       ; $79C4: $C0

    inc  b                                        ; $79C5: $04
    nop                                           ; $79C6: $00
    ld   [hl], b                                  ; $79C7: $70
    rla                                           ; $79C8: $17
    add  b                                        ; $79C9: $80
    inc  b                                        ; $79CA: $04
    nop                                           ; $79CB: $00
    ld   h, b                                     ; $79CC: $60
    dec  h                                        ; $79CD: $25
    add  b                                        ; $79CE: $80
    inc  b                                        ; $79CF: $04
    nop                                           ; $79D0: $00
    ld   d, b                                     ; $79D1: $50
    daa                                           ; $79D2: $27
    add  b                                        ; $79D3: $80
    inc  b                                        ; $79D4: $04
    nop                                           ; $79D5: $00
    ld   b, b                                     ; $79D6: $40
    dec  h                                        ; $79D7: $25
    add  b                                        ; $79D8: $80
    inc  b                                        ; $79D9: $04
    nop                                           ; $79DA: $00
    jr   nc, @+$19                                ; $79DB: $30 $17

    add  b                                        ; $79DD: $80
    inc  b                                        ; $79DE: $04
    cpl                                           ; $79DF: $2F
    jr   nz, @+$17                                ; $79E0: $20 $15

    ret  nz                                       ; $79E2: $C0

    inc  b                                        ; $79E3: $04

func_01F_79E4:
label_01F_79E4:
    ld   a, $01                                   ; $79E4: $3E $01
    ld   [$D3C9], a                               ; $79E6: $EA $C9 $D3

label_01F_79E9:
    ld   a, [wActiveNoiseSfx]                     ; $79E9: $FA $78 $D3
    ld   [$D379], a                               ; $79EC: $EA $79 $D3
    xor  a                                        ; $79EF: $AF
    ld   [$D393], a                               ; $79F0: $EA $93 $D3
    ld   [$D398], a                               ; $79F3: $EA $98 $D3
    ld   a, [$D34F]                               ; $79F6: $FA $4F $D3
    set  7, a                                     ; $79F9: $CB $FF
    ld   [$D34F], a                               ; $79FB: $EA $4F $D3
    jp   label_01F_7A8B                           ; $79FE: $C3 $8B $7A

label_01F_7A01:
    ld   hl, $7A20                                ; $7A01: $21 $20 $7A
    call func_01F_7A8B                            ; $7A04: $CD $8B $7A

label_01F_7A07:
    xor  a                                        ; $7A07: $AF
    ld   [$D379], a                               ; $7A08: $EA $79 $D3
    ld   [$D393], a                               ; $7A0B: $EA $93 $D3
    ld   [$D398], a                               ; $7A0E: $EA $98 $D3
    ld   [$D3BF], a                               ; $7A11: $EA $BF $D3
    ld   [$D3C9], a                               ; $7A14: $EA $C9 $D3
    ld   a, [$D34F]                               ; $7A17: $FA $4F $D3
    res  7, a                                     ; $7A1A: $CB $BF
    ld   [$D34F], a                               ; $7A1C: $EA $4F $D3
    ret                                           ; $7A1F: $C9

    nop                                           ; $7A20: $00
    nop                                           ; $7A21: $00
    nop                                           ; $7A22: $00
    nop                                           ; $7A23: $00
    ld   bc, RenderLoop.RenderLoop_loadNewMap     ; $7A24: $01 $06 $02
    ld   c, $22                                   ; $7A27: $0E $22
    jp   label_01F_7A91                           ; $7A29: $C3 $91 $7A

label_01F_7A2C:
    xor  a                                        ; $7A2C: $AF
    ld   [wActiveNoiseSfx], a                     ; $7A2D: $EA $78 $D3
    jp   $64EC                                    ; $7A30: $C3 $EC $64

func_01F_7A33:
    ld   a, [wActiveNoiseSfx]                     ; $7A33: $FA $78 $D3
    ld   [$D379], a                               ; $7A36: $EA $79 $D3
    ld   hl, $D32F                                ; $7A39: $21 $2F $D3
    set  7, [hl]                                  ; $7A3C: $CB $FE
    ld   a, $01                                   ; $7A3E: $3E $01
    ld   [$D3C9], a                               ; $7A40: $EA $C9 $D3
    xor  a                                        ; $7A43: $AF
    ld   [$D393], a                               ; $7A44: $EA $93 $D3
    ld   [$D398], a                               ; $7A47: $EA $98 $D3
    ld   hl, $7A20                                ; $7A4A: $21 $20 $7A
    call func_01F_7A8B                            ; $7A4D: $CD $8B $7A
    ret                                           ; $7A50: $C9

label_01F_7A51:
    xor  a                                        ; $7A51: $AF
    ld   [$D393], a                               ; $7A52: $EA $93 $D3
    ld   [$D398], a                               ; $7A55: $EA $98 $D3
    ld   [$D379], a                               ; $7A58: $EA $79 $D3
    ld   [$D3C9], a                               ; $7A5B: $EA $C9 $D3
    ld   hl, $D32F                                ; $7A5E: $21 $2F $D3
    res  7, [hl]                                  ; $7A61: $CB $BE
    ret                                           ; $7A63: $C9

; Read a two-bytes address in a pointers table
; Inputs:
;   a   the item index in the pointers table
; Output:
;   hl  the handler index for the item at index a
GetHandlerAddressInTable::
    dec  a                                        ; $7A64: $3D
    sla  a                                        ; $7A65: $CB $27
    ld   c, a                                     ; $7A67: $4F
    ld   b, $00                                   ; $7A68: $06 $00
    add  hl, bc                                   ; $7A6A: $09
    ld   c, [hl]                                  ; $7A6B: $4E
    inc  hl                                       ; $7A6C: $23
    ld   b, [hl]                                  ; $7A6D: $46
    ld   h, b                                     ; $7A6E: $60
    ld   l, c                                     ; $7A6F: $69
    ret                                           ; $7A70: $C9

DecrementValueAtDE::
    ld   a, [de]                                  ; $7A71: $1A
    dec  a                                        ; $7A72: $3D
    ld   [de], a                                  ; $7A73: $12
    ret                                           ; $7A74: $C9

IncrementValueAtBC::
    ld   a, [bc]                                  ; $7A75: $0A
    inc  a                                        ; $7A76: $3C
    ld   [bc], a                                  ; $7A77: $02
    ret                                           ; $7A78: $C9

func_01F_7A79:
label_01F_7A79:
    ld   b, $05                                   ; $7A79: $06 $05
    ld   c, $10                                   ; $7A7B: $0E $10
    jr   jr_01F_7A91                              ; $7A7D: $18 $12

func_01F_7A7F:
label_01F_7A7F:
    ld   b, $04                                   ; $7A7F: $06 $04
    ld   c, $16                                   ; $7A81: $0E $16
    jr   jr_01F_7A91                              ; $7A83: $18 $0C

func_01F_7A85:
label_01F_7A85:
    ld   b, $05                                   ; $7A85: $06 $05
    ld   c, $1A                                   ; $7A87: $0E $1A
    jr   jr_01F_7A91                              ; $7A89: $18 $06

func_01F_7A8B:
label_01F_7A8B:
    ld   b, $04                                   ; $7A8B: $06 $04
    ld   c, $20                                   ; $7A8D: $0E $20
    jr   jr_01F_7A91                              ; $7A8F: $18 $00

label_01F_7A91:
jr_01F_7A91:
    ld   a, [hl+]                                 ; $7A91: $2A
    ld   [c], a                                   ; $7A92: $E2
    inc  c                                        ; $7A93: $0C
    dec  b                                        ; $7A94: $05
    jr   nz, jr_01F_7A91                          ; $7A95: $20 $FA

    ld   a, [hl]                                  ; $7A97: $7E
    ld   [de], a                                  ; $7A98: $12
    ret                                           ; $7A99: $C9

func_01F_7A9A:
    push de                                       ; $7A9A: $D5
    ld   de, $D3BC                                ; $7A9B: $11 $BC $D3
    jr   jr_01F_7AB2                              ; $7A9E: $18 $12

    push de                                       ; $7AA0: $D5
    ld   de, $D3BD                                ; $7AA1: $11 $BD $D3
    jr   jr_01F_7AB2                              ; $7AA4: $18 $0C

func_01F_7AA6:
    push de                                       ; $7AA6: $D5
    ld   de, $D3BE                                ; $7AA7: $11 $BE $D3
    jr   jr_01F_7AB2                              ; $7AAA: $18 $06

func_01F_7AAC:
    push de                                       ; $7AAC: $D5
    ld   de, $D3BF                                ; $7AAD: $11 $BF $D3
    jr   jr_01F_7AB2                              ; $7AB0: $18 $00

jr_01F_7AB2:
    call DecrementValueAtDE                            ; $7AB2: $CD $71 $7A
    pop  de                                       ; $7AB5: $D1
    ret                                           ; $7AB6: $C9

func_01F_7AB7:
    push de                                       ; $7AB7: $D5
    ld   de, $D3C0                                ; $7AB8: $11 $C0 $D3
    jr   jr_01F_7AC1                              ; $7ABB: $18 $04

func_01F_7ABD:
    push de                                       ; $7ABD: $D5
    ld   de, $D3C4                                ; $7ABE: $11 $C4 $D3

jr_01F_7AC1:
    inc  hl                                       ; $7AC1: $23
    inc  hl                                       ; $7AC2: $23
    inc  hl                                       ; $7AC3: $23
    ld   a, [hl+]                                 ; $7AC4: $2A
    ld   [de], a                                  ; $7AC5: $12
    inc  e                                        ; $7AC6: $1C
    ld   a, [hl-]                                 ; $7AC7: $3A
    and  $0F                                      ; $7AC8: $E6 $0F
    ld   [de], a                                  ; $7ACA: $12
    dec  hl                                       ; $7ACB: $2B
    dec  hl                                       ; $7ACC: $2B
    dec  hl                                       ; $7ACD: $2B
    pop  de                                       ; $7ACE: $D1
    ret                                           ; $7ACF: $C9

func_01F_7AD0:
    push de                                       ; $7AD0: $D5
    ld   de, $D3C2                                ; $7AD1: $11 $C2 $D3
    inc  hl                                       ; $7AD4: $23
    inc  hl                                       ; $7AD5: $23
    ld   a, [hl+]                                 ; $7AD6: $2A
    ld   [de], a                                  ; $7AD7: $12
    inc  e                                        ; $7AD8: $1C
    ld   a, [hl-]                                 ; $7AD9: $3A
    and  $0F                                      ; $7ADA: $E6 $0F
    ld   [de], a                                  ; $7ADC: $12
    dec  hl                                       ; $7ADD: $2B
    dec  hl                                       ; $7ADE: $2B
    pop  de                                       ; $7ADF: $D1
    ret                                           ; $7AE0: $C9

func_01F_7AE1:
label_01F_7AE1:
    push de                                       ; $7AE1: $D5
    ld   de, $D3C1                                ; $7AE2: $11 $C1 $D3
    ld   a, [bc]                                  ; $7AE5: $0A
    ld   c, $13                                   ; $7AE6: $0E $13
    push bc                                       ; $7AE8: $C5
    jr   jr_01F_7AF5                              ; $7AE9: $18 $0A

label_01F_7AEB:
    push de                                       ; $7AEB: $D5
    ld   de, $D3C5                                ; $7AEC: $11 $C5 $D3
    ld   a, [bc]                                  ; $7AEF: $0A
    ld   c, $1D                                   ; $7AF0: $0E $1D
    push bc                                       ; $7AF2: $C5
    jr   jr_01F_7AF5                              ; $7AF3: $18 $00

jr_01F_7AF5:
    dec  a                                        ; $7AF5: $3D
    sla  a                                        ; $7AF6: $CB $27
    ld   c, a                                     ; $7AF8: $4F
    ld   b, $00                                   ; $7AF9: $06 $00
    add  hl, bc                                   ; $7AFB: $09
    ld   a, [hl+]                                 ; $7AFC: $2A
    ld   b, a                                     ; $7AFD: $47
    ld   a, [hl]                                  ; $7AFE: $7E
    ld   c, a                                     ; $7AFF: $4F
    ld   a, [de]                                  ; $7B00: $1A
    dec  e                                        ; $7B01: $1D
    ld   h, a                                     ; $7B02: $67
    ld   a, [de]                                  ; $7B03: $1A
    ld   l, a                                     ; $7B04: $6F
    add  hl, bc                                   ; $7B05: $09
    pop  bc                                       ; $7B06: $C1
    ld   a, l                                     ; $7B07: $7D
    ld   [c], a                                   ; $7B08: $E2
    ld   [de], a                                  ; $7B09: $12
    inc  c                                        ; $7B0A: $0C
    inc  e                                        ; $7B0B: $1C
    ld   a, h                                     ; $7B0C: $7C
    ld   [c], a                                   ; $7B0D: $E2
    ld   [de], a                                  ; $7B0E: $12
    pop  de                                       ; $7B0F: $D1
    ret                                           ; $7B10: $C9

func_01F_7B11:
label_01F_7B11:
    push de                                       ; $7B11: $D5
    ld   de, $D3C3                                ; $7B12: $11 $C3 $D3
    ld   a, [bc]                                  ; $7B15: $0A
    ld   c, $18                                   ; $7B16: $0E $18
    push bc                                       ; $7B18: $C5
    jr   jr_01F_7AF5                              ; $7B19: $18 $DA

    ld   hl, $7B3E                                ; $7B1B: $21 $3E $7B
    jp   label_01F_79E9                           ; $7B1E: $C3 $E9 $79

    call DecrementValueAtDE                            ; $7B21: $CD $71 $7A
    ret  nz                                       ; $7B24: $C0

    call IncrementValueAtBC                            ; $7B25: $CD $75 $7A
    cp   $05                                      ; $7B28: $FE $05
    jp   z, label_01F_7A01                        ; $7B2A: $CA $01 $7A

    ld   hl, $7B36                                ; $7B2D: $21 $36 $7B
    call GetHandlerAddressInTable                 ; $7B30: $CD $64 $7A
    jp   label_01F_7A8B                           ; $7B33: $C3 $8B $7A

    ld   c, b                                     ; $7B36: $48
    ld   a, e                                     ; $7B37: $7B
    ld   c, l                                     ; $7B38: $4D
    ld   a, e                                     ; $7B39: $7B
    ld   d, d                                     ; $7B3A: $52
    ld   a, e                                     ; $7B3B: $7B
    ld   d, a                                     ; $7B3C: $57
    ld   a, e                                     ; $7B3D: $7B
    nop                                           ; $7B3E: $00
    ld   hl, sp+$1D                               ; $7B3F: $F8 $1D
    add  b                                        ; $7B41: $80
    ld   bc, $F800                                ; $7B42: $01 $00 $F8
    dec  e                                        ; $7B45: $1D
    add  b                                        ; $7B46: $80
    ld   bc, $F800                                ; $7B47: $01 $00 $F8
    ld   bc, $180                                 ; $7B4A: $01 $80 $01
    nop                                           ; $7B4D: $00
    ld   e, c                                     ; $7B4E: $59
    ld   de, $380                                 ; $7B4F: $11 $80 $03
    ld   bc, $17C8                                ; $7B52: $01 $C8 $17
    add  b                                        ; $7B55: $80
    ld   bc, $F500                                ; $7B56: $01 $00 $F5
    ld   de, $180                                 ; $7B59: $11 $80 $01

func_01F_7B5C:
label_01F_7B5C:
    ld   a, $FF                                   ; $7B5C: $3E $FF
    ldh  [rNR51], a                               ; $7B5E: $E0 $25
    ld   a, $03                                   ; $7B60: $3E $03
    ld   [$D355], a                               ; $7B62: $EA $55 $D3
    xor  a                                        ; $7B65: $AF
    ld   [$D369], a                               ; $7B66: $EA $69 $D3
    xor  a                                        ; $7B69: $AF
    ld   [$D361], a                               ; $7B6A: $EA $61 $D3
    ld   [$D371], a                               ; $7B6D: $EA $71 $D3
    ld   [$D379], a                               ; $7B70: $EA $79 $D3
    ld   [$D31F], a                               ; $7B73: $EA $1F $D3
    ld   [$D32F], a                               ; $7B76: $EA $2F $D3
    ld   [$D33F], a                               ; $7B79: $EA $3F $D3
    ld   [$D34F], a                               ; $7B7C: $EA $4F $D3
    ld   [$D39E], a                               ; $7B7F: $EA $9E $D3
    ld   [$D39F], a                               ; $7B82: $EA $9F $D3
    ld   [$D3D9], a                               ; $7B85: $EA $D9 $D3
    ld   [$D3DA], a                               ; $7B88: $EA $DA $D3
    ld   [$D3B6], a                               ; $7B8B: $EA $B6 $D3
    ld   [$D3B7], a                               ; $7B8E: $EA $B7 $D3
    ld   [$D3B8], a                               ; $7B91: $EA $B8 $D3
    ld   [$D3B9], a                               ; $7B94: $EA $B9 $D3
    ld   [$D3BA], a                               ; $7B97: $EA $BA $D3
    ld   [$D3BB], a                               ; $7B9A: $EA $BB $D3
    ld   [$D394], a                               ; $7B9D: $EA $94 $D3
    ld   [$D395], a                               ; $7BA0: $EA $95 $D3
    ld   [$D396], a                               ; $7BA3: $EA $96 $D3
    ld   [$D398], a                               ; $7BA6: $EA $98 $D3
    ld   [$D390], a                               ; $7BA9: $EA $90 $D3
    ld   [$D391], a                               ; $7BAC: $EA $91 $D3
    ld   [$D392], a                               ; $7BAF: $EA $92 $D3
    ld   [$D393], a                               ; $7BB2: $EA $93 $D3
    ld   [$D3C6], a                               ; $7BB5: $EA $C6 $D3
    ld   [$D3C7], a                               ; $7BB8: $EA $C7 $D3
    ld   [$D3C8], a                               ; $7BBB: $EA $C8 $D3
    ld   [$D3C9], a                               ; $7BBE: $EA $C9 $D3
    ld   [$D3A0], a                               ; $7BC1: $EA $A0 $D3
    ld   [$D3A1], a                               ; $7BC4: $EA $A1 $D3
    ld   [$D3A2], a                               ; $7BC7: $EA $A2 $D3
    ld   [$D3A3], a                               ; $7BCA: $EA $A3 $D3
    ld   [$D3CD], a                               ; $7BCD: $EA $CD $D3
    ld   [$D3D6], a                               ; $7BD0: $EA $D6 $D3
    ld   [$D3D7], a                               ; $7BD3: $EA $D7 $D3
    ld   [$D3D8], a                               ; $7BD6: $EA $D8 $D3
    ld   [$D3DC], a                               ; $7BD9: $EA $DC $D3
    ld   [$D3E7], a                               ; $7BDC: $EA $E7 $D3
    ld   [$D3E2], a                               ; $7BDF: $EA $E2 $D3
    ld   [$D3E3], a                               ; $7BE2: $EA $E3 $D3
    ld   [$D3E4], a                               ; $7BE5: $EA $E4 $D3
    ld   [$D3E5], a                               ; $7BE8: $EA $E5 $D3
    ld   a, $08                                   ; $7BEB: $3E $08
    ldh  [rNR12], a                               ; $7BED: $E0 $12
    ldh  [rNR22], a                               ; $7BEF: $E0 $17
    ldh  [rNR42], a                               ; $7BF1: $E0 $21
    ld   a, $80                                   ; $7BF3: $3E $80
    ldh  [rNR14], a                               ; $7BF5: $E0 $14
    ldh  [rNR24], a                               ; $7BF7: $E0 $19
    ldh  [rNR44], a                               ; $7BF9: $E0 $23
    xor  a                                        ; $7BFB: $AF
    ldh  [rNR10], a                               ; $7BFC: $E0 $10
    ldh  [rP1], a                                 ; $7BFE: $E0 $00
    nop                                           ; $7C00: $00
    nop                                           ; $7C01: $00
    nop                                           ; $7C02: $00
    nop                                           ; $7C03: $00
    nop                                           ; $7C04: $00
    nop                                           ; $7C05: $00
    nop                                           ; $7C06: $00
    nop                                           ; $7C07: $00
    nop                                           ; $7C08: $00
    nop                                           ; $7C09: $00
    nop                                           ; $7C0A: $00
    nop                                           ; $7C0B: $00
    nop                                           ; $7C0C: $00
    nop                                           ; $7C0D: $00
    nop                                           ; $7C0E: $00
    nop                                           ; $7C0F: $00
    nop                                           ; $7C10: $00
    nop                                           ; $7C11: $00
    nop                                           ; $7C12: $00
    nop                                           ; $7C13: $00
    nop                                           ; $7C14: $00
    nop                                           ; $7C15: $00
    nop                                           ; $7C16: $00
    nop                                           ; $7C17: $00
    nop                                           ; $7C18: $00
    nop                                           ; $7C19: $00
    nop                                           ; $7C1A: $00
    nop                                           ; $7C1B: $00
    nop                                           ; $7C1C: $00
    nop                                           ; $7C1D: $00
    nop                                           ; $7C1E: $00
    nop                                           ; $7C1F: $00
    nop                                           ; $7C20: $00
    nop                                           ; $7C21: $00
    nop                                           ; $7C22: $00
    nop                                           ; $7C23: $00
    nop                                           ; $7C24: $00
    nop                                           ; $7C25: $00
    nop                                           ; $7C26: $00
    nop                                           ; $7C27: $00
    nop                                           ; $7C28: $00
    nop                                           ; $7C29: $00
    nop                                           ; $7C2A: $00
    nop                                           ; $7C2B: $00
    nop                                           ; $7C2C: $00
    nop                                           ; $7C2D: $00
    nop                                           ; $7C2E: $00
    nop                                           ; $7C2F: $00
    nop                                           ; $7C30: $00
    nop                                           ; $7C31: $00
    nop                                           ; $7C32: $00
    nop                                           ; $7C33: $00
    nop                                           ; $7C34: $00
    nop                                           ; $7C35: $00
    nop                                           ; $7C36: $00
    nop                                           ; $7C37: $00
    nop                                           ; $7C38: $00
    nop                                           ; $7C39: $00
    nop                                           ; $7C3A: $00
    nop                                           ; $7C3B: $00
    nop                                           ; $7C3C: $00
    nop                                           ; $7C3D: $00
    nop                                           ; $7C3E: $00
    nop                                           ; $7C3F: $00
    nop                                           ; $7C40: $00
    nop                                           ; $7C41: $00
    nop                                           ; $7C42: $00
    nop                                           ; $7C43: $00
    nop                                           ; $7C44: $00
    nop                                           ; $7C45: $00
    nop                                           ; $7C46: $00
    nop                                           ; $7C47: $00
    nop                                           ; $7C48: $00
    nop                                           ; $7C49: $00
    nop                                           ; $7C4A: $00
    nop                                           ; $7C4B: $00
    nop                                           ; $7C4C: $00
    nop                                           ; $7C4D: $00
    nop                                           ; $7C4E: $00
    nop                                           ; $7C4F: $00
    nop                                           ; $7C50: $00
    nop                                           ; $7C51: $00
    nop                                           ; $7C52: $00
    nop                                           ; $7C53: $00
    nop                                           ; $7C54: $00
    nop                                           ; $7C55: $00
    nop                                           ; $7C56: $00
    nop                                           ; $7C57: $00
    nop                                           ; $7C58: $00
    nop                                           ; $7C59: $00
    nop                                           ; $7C5A: $00
    nop                                           ; $7C5B: $00
    nop                                           ; $7C5C: $00
    nop                                           ; $7C5D: $00
    nop                                           ; $7C5E: $00
    nop                                           ; $7C5F: $00
    nop                                           ; $7C60: $00
    nop                                           ; $7C61: $00
    nop                                           ; $7C62: $00
    nop                                           ; $7C63: $00
    nop                                           ; $7C64: $00
    nop                                           ; $7C65: $00
    nop                                           ; $7C66: $00
    nop                                           ; $7C67: $00
    nop                                           ; $7C68: $00
    nop                                           ; $7C69: $00
    nop                                           ; $7C6A: $00
    nop                                           ; $7C6B: $00
    nop                                           ; $7C6C: $00
    nop                                           ; $7C6D: $00
    nop                                           ; $7C6E: $00
    nop                                           ; $7C6F: $00
    nop                                           ; $7C70: $00
    nop                                           ; $7C71: $00
    nop                                           ; $7C72: $00
    nop                                           ; $7C73: $00
    nop                                           ; $7C74: $00
    nop                                           ; $7C75: $00
    nop                                           ; $7C76: $00
    nop                                           ; $7C77: $00
    nop                                           ; $7C78: $00
    nop                                           ; $7C79: $00
    nop                                           ; $7C7A: $00
    nop                                           ; $7C7B: $00
    nop                                           ; $7C7C: $00
    nop                                           ; $7C7D: $00
    nop                                           ; $7C7E: $00
    nop                                           ; $7C7F: $00
    nop                                           ; $7C80: $00
    nop                                           ; $7C81: $00
    nop                                           ; $7C82: $00
    nop                                           ; $7C83: $00
    nop                                           ; $7C84: $00
    nop                                           ; $7C85: $00
    nop                                           ; $7C86: $00
    nop                                           ; $7C87: $00
    nop                                           ; $7C88: $00
    nop                                           ; $7C89: $00
    nop                                           ; $7C8A: $00
    nop                                           ; $7C8B: $00
    nop                                           ; $7C8C: $00
    nop                                           ; $7C8D: $00
    nop                                           ; $7C8E: $00
    nop                                           ; $7C8F: $00
    nop                                           ; $7C90: $00
    nop                                           ; $7C91: $00
    nop                                           ; $7C92: $00
    nop                                           ; $7C93: $00
    nop                                           ; $7C94: $00
    nop                                           ; $7C95: $00
    nop                                           ; $7C96: $00
    nop                                           ; $7C97: $00
    nop                                           ; $7C98: $00
    nop                                           ; $7C99: $00
    nop                                           ; $7C9A: $00
    nop                                           ; $7C9B: $00
    nop                                           ; $7C9C: $00
    nop                                           ; $7C9D: $00
    nop                                           ; $7C9E: $00
    nop                                           ; $7C9F: $00
    nop                                           ; $7CA0: $00
    nop                                           ; $7CA1: $00
    nop                                           ; $7CA2: $00
    nop                                           ; $7CA3: $00
    nop                                           ; $7CA4: $00
    nop                                           ; $7CA5: $00
    nop                                           ; $7CA6: $00
    nop                                           ; $7CA7: $00
    nop                                           ; $7CA8: $00
    nop                                           ; $7CA9: $00
    nop                                           ; $7CAA: $00
    nop                                           ; $7CAB: $00
    nop                                           ; $7CAC: $00
    nop                                           ; $7CAD: $00
    nop                                           ; $7CAE: $00
    nop                                           ; $7CAF: $00
    nop                                           ; $7CB0: $00
    nop                                           ; $7CB1: $00
    nop                                           ; $7CB2: $00
    nop                                           ; $7CB3: $00
    nop                                           ; $7CB4: $00
    nop                                           ; $7CB5: $00
    nop                                           ; $7CB6: $00
    nop                                           ; $7CB7: $00
    nop                                           ; $7CB8: $00
    nop                                           ; $7CB9: $00
    nop                                           ; $7CBA: $00
    nop                                           ; $7CBB: $00
    nop                                           ; $7CBC: $00
    nop                                           ; $7CBD: $00
    nop                                           ; $7CBE: $00
    nop                                           ; $7CBF: $00
    nop                                           ; $7CC0: $00
    nop                                           ; $7CC1: $00
    nop                                           ; $7CC2: $00
    nop                                           ; $7CC3: $00
    nop                                           ; $7CC4: $00
    nop                                           ; $7CC5: $00
    nop                                           ; $7CC6: $00
    nop                                           ; $7CC7: $00
    nop                                           ; $7CC8: $00
    nop                                           ; $7CC9: $00
    nop                                           ; $7CCA: $00
    nop                                           ; $7CCB: $00
    nop                                           ; $7CCC: $00
    nop                                           ; $7CCD: $00
    nop                                           ; $7CCE: $00
    nop                                           ; $7CCF: $00
    nop                                           ; $7CD0: $00
    nop                                           ; $7CD1: $00
    nop                                           ; $7CD2: $00
    nop                                           ; $7CD3: $00
    nop                                           ; $7CD4: $00
    nop                                           ; $7CD5: $00
    nop                                           ; $7CD6: $00
    nop                                           ; $7CD7: $00
    nop                                           ; $7CD8: $00
    nop                                           ; $7CD9: $00
    nop                                           ; $7CDA: $00
    nop                                           ; $7CDB: $00
    nop                                           ; $7CDC: $00
    nop                                           ; $7CDD: $00
    nop                                           ; $7CDE: $00
    nop                                           ; $7CDF: $00
    nop                                           ; $7CE0: $00
    nop                                           ; $7CE1: $00
    nop                                           ; $7CE2: $00
    nop                                           ; $7CE3: $00
    nop                                           ; $7CE4: $00
    nop                                           ; $7CE5: $00
    nop                                           ; $7CE6: $00
    nop                                           ; $7CE7: $00
    nop                                           ; $7CE8: $00
    nop                                           ; $7CE9: $00
    nop                                           ; $7CEA: $00
    nop                                           ; $7CEB: $00
    nop                                           ; $7CEC: $00
    nop                                           ; $7CED: $00
    nop                                           ; $7CEE: $00
    nop                                           ; $7CEF: $00
    nop                                           ; $7CF0: $00
    nop                                           ; $7CF1: $00
    nop                                           ; $7CF2: $00
    nop                                           ; $7CF3: $00
    nop                                           ; $7CF4: $00
    nop                                           ; $7CF5: $00
    nop                                           ; $7CF6: $00
    nop                                           ; $7CF7: $00
    nop                                           ; $7CF8: $00
    nop                                           ; $7CF9: $00
    nop                                           ; $7CFA: $00
    nop                                           ; $7CFB: $00
    nop                                           ; $7CFC: $00
    nop                                           ; $7CFD: $00
    nop                                           ; $7CFE: $00
    nop                                           ; $7CFF: $00
    nop                                           ; $7D00: $00
    nop                                           ; $7D01: $00
    nop                                           ; $7D02: $00
    nop                                           ; $7D03: $00
    nop                                           ; $7D04: $00
    nop                                           ; $7D05: $00
    nop                                           ; $7D06: $00
    nop                                           ; $7D07: $00
    nop                                           ; $7D08: $00
    nop                                           ; $7D09: $00
    nop                                           ; $7D0A: $00
    nop                                           ; $7D0B: $00
    nop                                           ; $7D0C: $00
    nop                                           ; $7D0D: $00
    nop                                           ; $7D0E: $00
    nop                                           ; $7D0F: $00
    nop                                           ; $7D10: $00
    nop                                           ; $7D11: $00
    nop                                           ; $7D12: $00
    nop                                           ; $7D13: $00
    nop                                           ; $7D14: $00
    nop                                           ; $7D15: $00
    nop                                           ; $7D16: $00
    nop                                           ; $7D17: $00
    nop                                           ; $7D18: $00
    nop                                           ; $7D19: $00
    nop                                           ; $7D1A: $00
    nop                                           ; $7D1B: $00
    nop                                           ; $7D1C: $00
    nop                                           ; $7D1D: $00
    nop                                           ; $7D1E: $00
    nop                                           ; $7D1F: $00
    nop                                           ; $7D20: $00
    nop                                           ; $7D21: $00
    nop                                           ; $7D22: $00
    nop                                           ; $7D23: $00
    nop                                           ; $7D24: $00
    nop                                           ; $7D25: $00
    nop                                           ; $7D26: $00
    nop                                           ; $7D27: $00
    nop                                           ; $7D28: $00
    nop                                           ; $7D29: $00
    nop                                           ; $7D2A: $00
    nop                                           ; $7D2B: $00
    nop                                           ; $7D2C: $00
    nop                                           ; $7D2D: $00
    nop                                           ; $7D2E: $00
    nop                                           ; $7D2F: $00
    nop                                           ; $7D30: $00
    nop                                           ; $7D31: $00
    nop                                           ; $7D32: $00
    nop                                           ; $7D33: $00
    nop                                           ; $7D34: $00
    nop                                           ; $7D35: $00
    nop                                           ; $7D36: $00
    nop                                           ; $7D37: $00
    nop                                           ; $7D38: $00
    nop                                           ; $7D39: $00
    nop                                           ; $7D3A: $00
    nop                                           ; $7D3B: $00
    nop                                           ; $7D3C: $00
    nop                                           ; $7D3D: $00
    nop                                           ; $7D3E: $00
    nop                                           ; $7D3F: $00
    nop                                           ; $7D40: $00
    nop                                           ; $7D41: $00
    nop                                           ; $7D42: $00
    nop                                           ; $7D43: $00
    nop                                           ; $7D44: $00
    nop                                           ; $7D45: $00
    nop                                           ; $7D46: $00
    nop                                           ; $7D47: $00
    nop                                           ; $7D48: $00
    nop                                           ; $7D49: $00
    nop                                           ; $7D4A: $00
    nop                                           ; $7D4B: $00
    nop                                           ; $7D4C: $00
    nop                                           ; $7D4D: $00
    nop                                           ; $7D4E: $00
    nop                                           ; $7D4F: $00
    nop                                           ; $7D50: $00
    nop                                           ; $7D51: $00
    nop                                           ; $7D52: $00
    nop                                           ; $7D53: $00
    nop                                           ; $7D54: $00
    nop                                           ; $7D55: $00
    nop                                           ; $7D56: $00
    nop                                           ; $7D57: $00
    nop                                           ; $7D58: $00
    nop                                           ; $7D59: $00
    nop                                           ; $7D5A: $00
    nop                                           ; $7D5B: $00
    nop                                           ; $7D5C: $00
    nop                                           ; $7D5D: $00
    nop                                           ; $7D5E: $00
    nop                                           ; $7D5F: $00
    nop                                           ; $7D60: $00
    nop                                           ; $7D61: $00
    nop                                           ; $7D62: $00
    nop                                           ; $7D63: $00
    nop                                           ; $7D64: $00
    nop                                           ; $7D65: $00
    nop                                           ; $7D66: $00
    nop                                           ; $7D67: $00
    nop                                           ; $7D68: $00
    nop                                           ; $7D69: $00
    nop                                           ; $7D6A: $00
    nop                                           ; $7D6B: $00
    nop                                           ; $7D6C: $00
    nop                                           ; $7D6D: $00
    nop                                           ; $7D6E: $00
    nop                                           ; $7D6F: $00
    nop                                           ; $7D70: $00
    nop                                           ; $7D71: $00
    nop                                           ; $7D72: $00
    nop                                           ; $7D73: $00
    nop                                           ; $7D74: $00
    nop                                           ; $7D75: $00
    nop                                           ; $7D76: $00
    nop                                           ; $7D77: $00
    nop                                           ; $7D78: $00
    nop                                           ; $7D79: $00
    nop                                           ; $7D7A: $00
    nop                                           ; $7D7B: $00
    nop                                           ; $7D7C: $00
    nop                                           ; $7D7D: $00
    nop                                           ; $7D7E: $00
    nop                                           ; $7D7F: $00
    nop                                           ; $7D80: $00
    nop                                           ; $7D81: $00
    nop                                           ; $7D82: $00
    nop                                           ; $7D83: $00
    nop                                           ; $7D84: $00
    nop                                           ; $7D85: $00
    nop                                           ; $7D86: $00
    nop                                           ; $7D87: $00
    nop                                           ; $7D88: $00
    nop                                           ; $7D89: $00
    nop                                           ; $7D8A: $00
    nop                                           ; $7D8B: $00
    nop                                           ; $7D8C: $00
    nop                                           ; $7D8D: $00
    nop                                           ; $7D8E: $00
    nop                                           ; $7D8F: $00
    nop                                           ; $7D90: $00
    nop                                           ; $7D91: $00
    nop                                           ; $7D92: $00
    nop                                           ; $7D93: $00
    nop                                           ; $7D94: $00
    nop                                           ; $7D95: $00
    nop                                           ; $7D96: $00
    nop                                           ; $7D97: $00
    nop                                           ; $7D98: $00
    nop                                           ; $7D99: $00
    nop                                           ; $7D9A: $00
    nop                                           ; $7D9B: $00
    nop                                           ; $7D9C: $00
    nop                                           ; $7D9D: $00
    nop                                           ; $7D9E: $00
    nop                                           ; $7D9F: $00
    nop                                           ; $7DA0: $00
    nop                                           ; $7DA1: $00
    nop                                           ; $7DA2: $00
    nop                                           ; $7DA3: $00
    nop                                           ; $7DA4: $00
    nop                                           ; $7DA5: $00
    nop                                           ; $7DA6: $00
    nop                                           ; $7DA7: $00
    nop                                           ; $7DA8: $00
    nop                                           ; $7DA9: $00
    nop                                           ; $7DAA: $00
    nop                                           ; $7DAB: $00
    nop                                           ; $7DAC: $00
    nop                                           ; $7DAD: $00
    nop                                           ; $7DAE: $00
    nop                                           ; $7DAF: $00
    nop                                           ; $7DB0: $00
    nop                                           ; $7DB1: $00
    nop                                           ; $7DB2: $00
    nop                                           ; $7DB3: $00
    nop                                           ; $7DB4: $00
    nop                                           ; $7DB5: $00
    nop                                           ; $7DB6: $00
    nop                                           ; $7DB7: $00
    nop                                           ; $7DB8: $00
    nop                                           ; $7DB9: $00
    nop                                           ; $7DBA: $00
    nop                                           ; $7DBB: $00
    nop                                           ; $7DBC: $00
    nop                                           ; $7DBD: $00
    nop                                           ; $7DBE: $00
    nop                                           ; $7DBF: $00
    nop                                           ; $7DC0: $00
    nop                                           ; $7DC1: $00
    nop                                           ; $7DC2: $00
    nop                                           ; $7DC3: $00
    nop                                           ; $7DC4: $00
    nop                                           ; $7DC5: $00
    nop                                           ; $7DC6: $00
    nop                                           ; $7DC7: $00
    nop                                           ; $7DC8: $00
    nop                                           ; $7DC9: $00
    nop                                           ; $7DCA: $00
    nop                                           ; $7DCB: $00
    nop                                           ; $7DCC: $00
    nop                                           ; $7DCD: $00
    nop                                           ; $7DCE: $00
    nop                                           ; $7DCF: $00
    nop                                           ; $7DD0: $00
    nop                                           ; $7DD1: $00
    nop                                           ; $7DD2: $00
    nop                                           ; $7DD3: $00
    nop                                           ; $7DD4: $00
    nop                                           ; $7DD5: $00
    nop                                           ; $7DD6: $00
    nop                                           ; $7DD7: $00
    nop                                           ; $7DD8: $00
    nop                                           ; $7DD9: $00
    nop                                           ; $7DDA: $00
    nop                                           ; $7DDB: $00
    nop                                           ; $7DDC: $00
    nop                                           ; $7DDD: $00
    nop                                           ; $7DDE: $00
    nop                                           ; $7DDF: $00
    nop                                           ; $7DE0: $00
    nop                                           ; $7DE1: $00
    nop                                           ; $7DE2: $00
    nop                                           ; $7DE3: $00
    nop                                           ; $7DE4: $00
    nop                                           ; $7DE5: $00
    nop                                           ; $7DE6: $00
    nop                                           ; $7DE7: $00
    nop                                           ; $7DE8: $00
    nop                                           ; $7DE9: $00
    nop                                           ; $7DEA: $00
    nop                                           ; $7DEB: $00
    nop                                           ; $7DEC: $00
    nop                                           ; $7DED: $00
    nop                                           ; $7DEE: $00
    nop                                           ; $7DEF: $00
    nop                                           ; $7DF0: $00
    nop                                           ; $7DF1: $00
    nop                                           ; $7DF2: $00
    nop                                           ; $7DF3: $00
    nop                                           ; $7DF4: $00
    nop                                           ; $7DF5: $00
    nop                                           ; $7DF6: $00
    nop                                           ; $7DF7: $00
    nop                                           ; $7DF8: $00
    nop                                           ; $7DF9: $00
    nop                                           ; $7DFA: $00
    nop                                           ; $7DFB: $00
    nop                                           ; $7DFC: $00
    nop                                           ; $7DFD: $00
    nop                                           ; $7DFE: $00
    nop                                           ; $7DFF: $00
    nop                                           ; $7E00: $00
    nop                                           ; $7E01: $00
    nop                                           ; $7E02: $00
    nop                                           ; $7E03: $00
    nop                                           ; $7E04: $00
    nop                                           ; $7E05: $00
    nop                                           ; $7E06: $00
    nop                                           ; $7E07: $00
    nop                                           ; $7E08: $00
    nop                                           ; $7E09: $00
    nop                                           ; $7E0A: $00
    nop                                           ; $7E0B: $00
    nop                                           ; $7E0C: $00
    nop                                           ; $7E0D: $00
    nop                                           ; $7E0E: $00
    nop                                           ; $7E0F: $00
    nop                                           ; $7E10: $00
    nop                                           ; $7E11: $00
    nop                                           ; $7E12: $00
    nop                                           ; $7E13: $00
    nop                                           ; $7E14: $00
    nop                                           ; $7E15: $00
    nop                                           ; $7E16: $00
    nop                                           ; $7E17: $00
    nop                                           ; $7E18: $00
    nop                                           ; $7E19: $00
    nop                                           ; $7E1A: $00
    nop                                           ; $7E1B: $00
    nop                                           ; $7E1C: $00
    nop                                           ; $7E1D: $00
    nop                                           ; $7E1E: $00
    nop                                           ; $7E1F: $00
    nop                                           ; $7E20: $00
    nop                                           ; $7E21: $00
    nop                                           ; $7E22: $00
    nop                                           ; $7E23: $00
    nop                                           ; $7E24: $00
    nop                                           ; $7E25: $00
    nop                                           ; $7E26: $00
    nop                                           ; $7E27: $00
    nop                                           ; $7E28: $00
    nop                                           ; $7E29: $00
    nop                                           ; $7E2A: $00
    nop                                           ; $7E2B: $00
    nop                                           ; $7E2C: $00
    nop                                           ; $7E2D: $00
    nop                                           ; $7E2E: $00
    nop                                           ; $7E2F: $00
    nop                                           ; $7E30: $00
    nop                                           ; $7E31: $00
    nop                                           ; $7E32: $00
    nop                                           ; $7E33: $00
    nop                                           ; $7E34: $00
    nop                                           ; $7E35: $00
    nop                                           ; $7E36: $00
    nop                                           ; $7E37: $00
    nop                                           ; $7E38: $00
    nop                                           ; $7E39: $00
    nop                                           ; $7E3A: $00
    nop                                           ; $7E3B: $00
    nop                                           ; $7E3C: $00
    nop                                           ; $7E3D: $00
    nop                                           ; $7E3E: $00
    nop                                           ; $7E3F: $00
    nop                                           ; $7E40: $00
    nop                                           ; $7E41: $00
    nop                                           ; $7E42: $00
    nop                                           ; $7E43: $00
    nop                                           ; $7E44: $00
    nop                                           ; $7E45: $00
    nop                                           ; $7E46: $00
    nop                                           ; $7E47: $00
    nop                                           ; $7E48: $00
    nop                                           ; $7E49: $00
    nop                                           ; $7E4A: $00
    nop                                           ; $7E4B: $00
    nop                                           ; $7E4C: $00
    nop                                           ; $7E4D: $00
    nop                                           ; $7E4E: $00
    nop                                           ; $7E4F: $00
    nop                                           ; $7E50: $00
    nop                                           ; $7E51: $00
    nop                                           ; $7E52: $00
    nop                                           ; $7E53: $00
    nop                                           ; $7E54: $00
    nop                                           ; $7E55: $00
    nop                                           ; $7E56: $00
    nop                                           ; $7E57: $00
    nop                                           ; $7E58: $00
    nop                                           ; $7E59: $00
    nop                                           ; $7E5A: $00
    nop                                           ; $7E5B: $00
    nop                                           ; $7E5C: $00
    nop                                           ; $7E5D: $00
    nop                                           ; $7E5E: $00
    nop                                           ; $7E5F: $00
    nop                                           ; $7E60: $00
    nop                                           ; $7E61: $00
    nop                                           ; $7E62: $00
    nop                                           ; $7E63: $00
    nop                                           ; $7E64: $00
    nop                                           ; $7E65: $00
    nop                                           ; $7E66: $00
    nop                                           ; $7E67: $00
    nop                                           ; $7E68: $00
    nop                                           ; $7E69: $00
    nop                                           ; $7E6A: $00
    nop                                           ; $7E6B: $00
    nop                                           ; $7E6C: $00
    nop                                           ; $7E6D: $00
    nop                                           ; $7E6E: $00
    nop                                           ; $7E6F: $00
    nop                                           ; $7E70: $00
    nop                                           ; $7E71: $00
    nop                                           ; $7E72: $00
    nop                                           ; $7E73: $00
    nop                                           ; $7E74: $00
    nop                                           ; $7E75: $00
    nop                                           ; $7E76: $00
    nop                                           ; $7E77: $00
    nop                                           ; $7E78: $00
    nop                                           ; $7E79: $00
    nop                                           ; $7E7A: $00
    nop                                           ; $7E7B: $00
    nop                                           ; $7E7C: $00
    nop                                           ; $7E7D: $00
    nop                                           ; $7E7E: $00
    nop                                           ; $7E7F: $00
    nop                                           ; $7E80: $00
    nop                                           ; $7E81: $00
    nop                                           ; $7E82: $00
    nop                                           ; $7E83: $00
    nop                                           ; $7E84: $00
    nop                                           ; $7E85: $00
    nop                                           ; $7E86: $00
    nop                                           ; $7E87: $00
    nop                                           ; $7E88: $00
    nop                                           ; $7E89: $00
    nop                                           ; $7E8A: $00
    nop                                           ; $7E8B: $00
    nop                                           ; $7E8C: $00
    nop                                           ; $7E8D: $00
    nop                                           ; $7E8E: $00
    nop                                           ; $7E8F: $00
    nop                                           ; $7E90: $00
    nop                                           ; $7E91: $00
    nop                                           ; $7E92: $00
    nop                                           ; $7E93: $00
    nop                                           ; $7E94: $00
    nop                                           ; $7E95: $00
    nop                                           ; $7E96: $00
    nop                                           ; $7E97: $00
    nop                                           ; $7E98: $00
    nop                                           ; $7E99: $00
    nop                                           ; $7E9A: $00
    nop                                           ; $7E9B: $00
    nop                                           ; $7E9C: $00
    nop                                           ; $7E9D: $00
    nop                                           ; $7E9E: $00
    nop                                           ; $7E9F: $00
    nop                                           ; $7EA0: $00
    nop                                           ; $7EA1: $00
    nop                                           ; $7EA2: $00
    nop                                           ; $7EA3: $00
    nop                                           ; $7EA4: $00
    nop                                           ; $7EA5: $00
    nop                                           ; $7EA6: $00
    nop                                           ; $7EA7: $00
    nop                                           ; $7EA8: $00
    nop                                           ; $7EA9: $00
    nop                                           ; $7EAA: $00
    nop                                           ; $7EAB: $00
    nop                                           ; $7EAC: $00
    nop                                           ; $7EAD: $00
    nop                                           ; $7EAE: $00
    nop                                           ; $7EAF: $00
    nop                                           ; $7EB0: $00
    nop                                           ; $7EB1: $00
    nop                                           ; $7EB2: $00
    nop                                           ; $7EB3: $00
    nop                                           ; $7EB4: $00
    nop                                           ; $7EB5: $00
    nop                                           ; $7EB6: $00
    nop                                           ; $7EB7: $00
    nop                                           ; $7EB8: $00
    nop                                           ; $7EB9: $00
    nop                                           ; $7EBA: $00
    nop                                           ; $7EBB: $00
    nop                                           ; $7EBC: $00
    nop                                           ; $7EBD: $00
    nop                                           ; $7EBE: $00
    nop                                           ; $7EBF: $00
    nop                                           ; $7EC0: $00
    nop                                           ; $7EC1: $00
    nop                                           ; $7EC2: $00
    nop                                           ; $7EC3: $00
    nop                                           ; $7EC4: $00
    nop                                           ; $7EC5: $00
    nop                                           ; $7EC6: $00
    nop                                           ; $7EC7: $00
    nop                                           ; $7EC8: $00
    nop                                           ; $7EC9: $00
    nop                                           ; $7ECA: $00
    nop                                           ; $7ECB: $00
    nop                                           ; $7ECC: $00
    nop                                           ; $7ECD: $00
    nop                                           ; $7ECE: $00
    nop                                           ; $7ECF: $00
    nop                                           ; $7ED0: $00
    nop                                           ; $7ED1: $00
    nop                                           ; $7ED2: $00
    nop                                           ; $7ED3: $00
    nop                                           ; $7ED4: $00
    nop                                           ; $7ED5: $00
    nop                                           ; $7ED6: $00
    nop                                           ; $7ED7: $00
    nop                                           ; $7ED8: $00
    nop                                           ; $7ED9: $00
    nop                                           ; $7EDA: $00
    nop                                           ; $7EDB: $00
    nop                                           ; $7EDC: $00
    nop                                           ; $7EDD: $00
    nop                                           ; $7EDE: $00
    nop                                           ; $7EDF: $00
    nop                                           ; $7EE0: $00
    nop                                           ; $7EE1: $00
    nop                                           ; $7EE2: $00
    nop                                           ; $7EE3: $00
    nop                                           ; $7EE4: $00
    nop                                           ; $7EE5: $00
    nop                                           ; $7EE6: $00
    nop                                           ; $7EE7: $00
    nop                                           ; $7EE8: $00
    nop                                           ; $7EE9: $00
    nop                                           ; $7EEA: $00
    nop                                           ; $7EEB: $00
    nop                                           ; $7EEC: $00
    nop                                           ; $7EED: $00
    nop                                           ; $7EEE: $00
    nop                                           ; $7EEF: $00
    nop                                           ; $7EF0: $00
    nop                                           ; $7EF1: $00
    nop                                           ; $7EF2: $00
    nop                                           ; $7EF3: $00
    nop                                           ; $7EF4: $00
    nop                                           ; $7EF5: $00
    nop                                           ; $7EF6: $00
    nop                                           ; $7EF7: $00
    nop                                           ; $7EF8: $00
    nop                                           ; $7EF9: $00
    nop                                           ; $7EFA: $00
    nop                                           ; $7EFB: $00
    nop                                           ; $7EFC: $00
    nop                                           ; $7EFD: $00
    nop                                           ; $7EFE: $00
    nop                                           ; $7EFF: $00
    nop                                           ; $7F00: $00
    nop                                           ; $7F01: $00
    nop                                           ; $7F02: $00
    nop                                           ; $7F03: $00
    nop                                           ; $7F04: $00
    nop                                           ; $7F05: $00
    nop                                           ; $7F06: $00
    nop                                           ; $7F07: $00
    nop                                           ; $7F08: $00
    nop                                           ; $7F09: $00
    nop                                           ; $7F0A: $00
    nop                                           ; $7F0B: $00
    nop                                           ; $7F0C: $00
    nop                                           ; $7F0D: $00
    nop                                           ; $7F0E: $00
    nop                                           ; $7F0F: $00
    nop                                           ; $7F10: $00
    nop                                           ; $7F11: $00
    nop                                           ; $7F12: $00
    nop                                           ; $7F13: $00
    nop                                           ; $7F14: $00
    nop                                           ; $7F15: $00
    nop                                           ; $7F16: $00
    nop                                           ; $7F17: $00
    nop                                           ; $7F18: $00
    nop                                           ; $7F19: $00
    nop                                           ; $7F1A: $00
    nop                                           ; $7F1B: $00
    nop                                           ; $7F1C: $00
    nop                                           ; $7F1D: $00
    nop                                           ; $7F1E: $00
    nop                                           ; $7F1F: $00
    nop                                           ; $7F20: $00
    nop                                           ; $7F21: $00
    nop                                           ; $7F22: $00
    nop                                           ; $7F23: $00
    nop                                           ; $7F24: $00
    nop                                           ; $7F25: $00
    nop                                           ; $7F26: $00
    nop                                           ; $7F27: $00
    nop                                           ; $7F28: $00
    nop                                           ; $7F29: $00
    nop                                           ; $7F2A: $00
    nop                                           ; $7F2B: $00
    nop                                           ; $7F2C: $00
    nop                                           ; $7F2D: $00
    nop                                           ; $7F2E: $00
    nop                                           ; $7F2F: $00
    nop                                           ; $7F30: $00
    nop                                           ; $7F31: $00
    nop                                           ; $7F32: $00
    nop                                           ; $7F33: $00
    nop                                           ; $7F34: $00
    nop                                           ; $7F35: $00
    nop                                           ; $7F36: $00
    nop                                           ; $7F37: $00
    nop                                           ; $7F38: $00
    nop                                           ; $7F39: $00
    nop                                           ; $7F3A: $00
    nop                                           ; $7F3B: $00
    nop                                           ; $7F3C: $00
    nop                                           ; $7F3D: $00
    nop                                           ; $7F3E: $00
    nop                                           ; $7F3F: $00
    nop                                           ; $7F40: $00
    nop                                           ; $7F41: $00
    nop                                           ; $7F42: $00
    nop                                           ; $7F43: $00
    nop                                           ; $7F44: $00
    nop                                           ; $7F45: $00
    nop                                           ; $7F46: $00
    nop                                           ; $7F47: $00
    nop                                           ; $7F48: $00
    nop                                           ; $7F49: $00
    nop                                           ; $7F4A: $00
    nop                                           ; $7F4B: $00
    nop                                           ; $7F4C: $00
    nop                                           ; $7F4D: $00
    nop                                           ; $7F4E: $00
    nop                                           ; $7F4F: $00
    nop                                           ; $7F50: $00
    nop                                           ; $7F51: $00
    nop                                           ; $7F52: $00
    nop                                           ; $7F53: $00
    nop                                           ; $7F54: $00
    nop                                           ; $7F55: $00
    nop                                           ; $7F56: $00
    nop                                           ; $7F57: $00
    nop                                           ; $7F58: $00
    nop                                           ; $7F59: $00
    nop                                           ; $7F5A: $00
    nop                                           ; $7F5B: $00
    nop                                           ; $7F5C: $00
    nop                                           ; $7F5D: $00
    nop                                           ; $7F5E: $00
    nop                                           ; $7F5F: $00
    nop                                           ; $7F60: $00
    nop                                           ; $7F61: $00
    nop                                           ; $7F62: $00
    nop                                           ; $7F63: $00
    nop                                           ; $7F64: $00
    nop                                           ; $7F65: $00
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
    ldh  a, [hFFA8]                               ; $7F80: $F0 $A8
    and  a                                        ; $7F82: $A7
    jr   z, jr_01F_7F9E                           ; $7F83: $28 $19

    sub  $01                                      ; $7F85: $D6 $01
    ldh  [hFFA8], a                               ; $7F87: $E0 $A8
    and  $03                                      ; $7F89: $E6 $03
    jr   nz, jr_01F_7F9E                          ; $7F8B: $20 $11

    ldh  a, [hWindowYUnused]                      ; $7F8D: $F0 $A9
    and  a                                        ; $7F8F: $A7
    jr   z, jr_01F_7F95                           ; $7F90: $28 $03

    dec  a                                        ; $7F92: $3D
    ldh  [hWindowYUnused], a                      ; $7F93: $E0 $A9

jr_01F_7F95:
    ldh  a, [hWindowXUnused]                      ; $7F95: $F0 $AA
    and  a                                        ; $7F97: $A7
    jr   z, jr_01F_7F9E                           ; $7F98: $28 $04

    sub  $10                                      ; $7F9A: $D6 $10
    ldh  [hWindowXUnused], a                      ; $7F9C: $E0 $AA

jr_01F_7F9E:
    ldh  a, [hFFAB]                               ; $7F9E: $F0 $AB
    and  a                                        ; $7FA0: $A7
    jr   z, jr_01F_7FBE                           ; $7FA1: $28 $1B

    sub  $01                                      ; $7FA3: $D6 $01
    ldh  [hFFAB], a                               ; $7FA5: $E0 $AB
    and  $01                                      ; $7FA7: $E6 $01
    jr   nz, jr_01F_7FBE                          ; $7FA9: $20 $13

    ldh  a, [hWindowYUnused]                      ; $7FAB: $F0 $A9
    cp   $07                                      ; $7FAD: $FE $07
    jr   nc, jr_01F_7FB4                          ; $7FAF: $30 $03

    inc  a                                        ; $7FB1: $3C
    ldh  [hWindowYUnused], a                      ; $7FB2: $E0 $A9

jr_01F_7FB4:
    ldh  a, [hWindowXUnused]                      ; $7FB4: $F0 $AA
    cp   $70                                      ; $7FB6: $FE $70
    jr   nc, jr_01F_7FBE                          ; $7FB8: $30 $04

    add  $10                                      ; $7FBA: $C6 $10
    ldh  [hWindowXUnused], a                      ; $7FBC: $E0 $AA

jr_01F_7FBE:
    ld   hl, hWindowYUnused                       ; $7FBE: $21 $A9 $FF
    ldh  a, [rNR50]                               ; $7FC1: $F0 $24
    and  $F8                                      ; $7FC3: $E6 $F8
    or   [hl]                                     ; $7FC5: $B6
    inc  hl                                       ; $7FC6: $23
    and  $8F                                      ; $7FC7: $E6 $8F
    or   [hl]                                     ; $7FC9: $B6
    ldh  [rNR50], a                               ; $7FCA: $E0 $24
    ldh  a, [hJingle]                             ; $7FCC: $F0 $F2
    and  a                                        ; $7FCE: $A7
    jr   z, jr_01F_7FD7                           ; $7FCF: $28 $06

    ld   [wActiveJingle], a                       ; $7FD1: $EA $60 $D3
    xor  a                                        ; $7FD4: $AF
    ldh  [hJingle], a                             ; $7FD5: $E0 $F2

jr_01F_7FD7:
    ldh  a, [hWaveSfx]                            ; $7FD7: $F0 $F3
    and  a                                        ; $7FD9: $A7
    jr   z, jr_01F_7FE2                           ; $7FDA: $28 $06

    ld   [wActiveWaveSfx], a                      ; $7FDC: $EA $70 $D3
    xor  a                                        ; $7FDF: $AF
    ldh  [hWaveSfx], a                            ; $7FE0: $E0 $F3

jr_01F_7FE2:
    ldh  a, [hNoiseSfx]                           ; $7FE2: $F0 $F4
    and  a                                        ; $7FE4: $A7
    jr   z, jr_01F_7FED                           ; $7FE5: $28 $06

    ld   [wActiveNoiseSfx], a                     ; $7FE7: $EA $78 $D3
    xor  a                                        ; $7FEA: $AF
    ldh  [hNoiseSfx], a                           ; $7FEB: $E0 $F4

jr_01F_7FED:
    ret                                           ; $7FED: $C9
