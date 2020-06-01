; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

PlayActiveJingle::
    ld   hl, wActiveJingle                        ; $4204: $21 $60 $D3
    ld   a, [hl]                                  ; $4207: $7E
    and  a                                        ; $4208: $A7
    jr   z, .jr_01F_421C                          ; $4209: $28 $11

    cp   $01                                      ; $420B: $FE $01
    jr   z, .jr_01F_4216                          ; $420D: $28 $07

    ld   a, [$D3C6]                               ; $420F: $FA $C6 $D3
    and  a                                        ; $4212: $A7
    jp   nz, label_01F_53E6                       ; $4213: $C2 $E6 $53

.jr_01F_4216:
    ld   a, [hl]                                  ; $4216: $7E
    ld   hl, SfxPointersTable1                    ; $4217: $21 $00 $41
    jr   .jr_01F_4223                             ; $421A: $18 $07

.jr_01F_421C:
    inc  hl                                       ; $421C: $23
    ld   a, [hl]                                  ; $421D: $7E
    and  a                                        ; $421E: $A7
    ret  z                                        ; $421F: $C8

    ld   hl, SfxPointersTable2                    ; $4220: $21 $82 $41

.jr_01F_4223:
    call GetHandlerAddressInTable                 ; $4223: $CD $64 $7A
    ld   de, $D390                                ; $4226: $11 $90 $D3
    ld   bc, $D394                                ; $4229: $01 $94 $D3
    jp   hl                                       ; $422C: $E9

BeginJingleTreasureFound::
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
    ld   hl, Data_01F_42EB                        ; $4245: $21 $EB $42
    call WriteChannel2AndDE                       ; $4248: $CD $7F $7A
    call func_01F_636A                            ; $424B: $CD $6A $63
    ld   hl, Data_01F_42FF                        ; $424E: $21 $FF $42
    call WriteChannel3AndDE                       ; $4251: $CD $85 $7A
    ld   hl, Data_01F_42D3                        ; $4254: $21 $D3 $42
    jp   label_01F_5395                           ; $4257: $C3 $95 $53

ContinueJingleTreasureFound::
    call DecrementValueAtDE                       ; $425A: $CD $71 $7A
    ret  nz                                       ; $425D: $C0

    call IncrementValueAtBC                       ; $425E: $CD $75 $7A
    cp   $01                                      ; $4261: $FE $01
    jr   z, .jr_01F_4273                          ; $4263: $28 $0E

    cp   $02                                      ; $4265: $FE $02
    jr   z, .jr_01F_4285                          ; $4267: $28 $1C

    cp   $03                                      ; $4269: $FE $03
    jr   z, .jr_01F_4297                          ; $426B: $28 $2A

    cp   $04                                      ; $426D: $FE $04
    jr   z, .jr_01F_42A9                          ; $426F: $28 $38

    jr   .jr_01F_42BB                             ; $4271: $18 $48

.jr_01F_4273:
    ld   hl, Data_01F_42D9                        ; $4273: $21 $D9 $42
    call WriteChannel1AndDE                       ; $4276: $CD $79 $7A
    ld   hl, Data_01F_42F0                        ; $4279: $21 $F0 $42
    call WriteChannel2AndDE                       ; $427C: $CD $7F $7A
    ld   hl, Data_01F_4305                        ; $427F: $21 $05 $43
    jp   WriteChannel3AndDE                       ; $4282: $C3 $85 $7A

.jr_01F_4285:
    ld   hl, Data_01F_42DF                        ; $4285: $21 $DF $42
    call WriteChannel1AndDE                       ; $4288: $CD $79 $7A
    ld   hl, Data_01F_42F5                        ; $428B: $21 $F5 $42
    call WriteChannel2AndDE                       ; $428E: $CD $7F $7A
    ld   hl, Data_01F_430B                        ; $4291: $21 $0B $43
    jp   WriteChannel3AndDE                       ; $4294: $C3 $85 $7A

.jr_01F_4297:
    ld   hl, Data_01F_42E5                        ; $4297: $21 $E5 $42
    call WriteChannel1AndDE                       ; $429A: $CD $79 $7A
    ld   hl, Data_01F_42FA                        ; $429D: $21 $FA $42
    call WriteChannel2AndDE                       ; $42A0: $CD $7F $7A
    ld   hl, Data_01F_4311                        ; $42A3: $21 $11 $43
    jp   WriteChannel3AndDE                       ; $42A6: $C3 $85 $7A

.jr_01F_42A9:
    ld   hl, Data_01F_4317                        ; $42A9: $21 $17 $43
    call WriteChannel1AndDE                       ; $42AC: $CD $79 $7A
    ld   hl, Data_01F_431D                        ; $42AF: $21 $1D $43
    call WriteChannel2AndDE                       ; $42B2: $CD $7F $7A
    ld   hl, Data_01F_4317                        ; $42B5: $21 $17 $43
    jp   WriteChannel3AndDE                       ; $42B8: $C3 $85 $7A

.jr_01F_42BB:
    ld   hl, $D32F                                ; $42BB: $21 $2F $D3
    res  7, [hl]                                  ; $42BE: $CB $BE
    ld   hl, $D33F                                ; $42C0: $21 $3F $D3
    res  7, [hl]                                  ; $42C3: $CB $BE
    xor  a                                        ; $42C5: $AF
    ldh  [rNR30], a                               ; $42C6: $E0 $1A
    ld   [$D3C8], a                               ; $42C8: $EA $C8 $D3
    ld   a, $01                                   ; $42CB: $3E $01
    ld   [$D3E7], a                               ; $42CD: $EA $E7 $D3
    jp   func_01F_53BB                            ; $42D0: $C3 $BB $53

Data_01F_42D3::
    db   $00, $80, $80, $89, $86, $0A

Data_01F_42D9::
    db   $00, $80, $80, $9E, $86, $0A

Data_01F_42DF::
    db   $00, $80, $80, $B2, $86, $0A

Data_01F_42E5::
    db   $00, $80, $80, $C4, $86, $30

Data_01F_42EB::
    db   $00, $C0, $06, $87, $0A

Data_01F_42F0::
    db   $00, $C0, $14, $87, $0A

Data_01F_42F5::
    db   $00, $C0, $21, $87, $0A

Data_01F_42FA::
    db   $00, $C0, $2D, $87, $30

Data_01F_42FF::
    db   $80, $00, $20, $6B, $87, $0A

Data_01F_4305::
    db   $80, $00, $20, $73, $87, $0A

Data_01F_430B::
    db   $80, $00, $20, $7B, $87, $0A

Data_01F_4311::
    db   $80, $00, $20, $83, $87, $30

Data_01F_4317::
    db   $00, $00, $00, $00, $C0, $20

Data_01F_431D::
    db   $3F, $00, $00, $C1, $20

BeginJinglePuzzleSolved::
    ld   hl, Data_01F_4353                        ; $4322: $21 $53 $43
    jp   label_01F_5395                           ; $4325: $C3 $95 $53

ContinueJinglePuzzleSolved::
    call DecrementValueAtDE                       ; $4328: $CD $71 $7A
    ret  nz                                       ; $432B: $C0

    call IncrementValueAtBC                       ; $432C: $CD $75 $7A
    cp   $08                                      ; $432F: $FE $08
    jp   z, func_01F_53BB                         ; $4331: $CA $BB $53

    ld   hl, Data_01F_4345                        ; $4334: $21 $45 $43
    call GetHandlerAddressInTable                 ; $4337: $CD $64 $7A
    ld   a, $80                                   ; $433A: $3E $80
    ldh  [rNR11], a                               ; $433C: $E0 $11
    ld   a, $F1                                   ; $433E: $3E $F1
    ldh  [rNR12], a                               ; $4340: $E0 $12
    jp   WriteChannel1FrequencyAndDE              ; $4342: $C3 $DF $53

Data_01F_4345::
    dw   Data_01F_4359
    dw   Data_01F_435C
    dw   Data_01F_435F
    dw   Data_01F_4362
    dw   Data_01F_4365
    dw   Data_01F_4368
    dw   Data_01F_436B

Data_01F_4353::
    db   $00, $80, $F1, $A7, $C7, $08

Data_01F_4359::
    db   $A2, $C7, $08

Data_01F_435C::
    db   $90, $C7, $08

Data_01F_435F::
    db   $7B, $C7, $08

Data_01F_4362::
    db   $59, $C7, $08

Data_01F_4365::
    db   $97, $C7, $08

Data_01F_4368::
    db   $AC, $C7, $08

Data_01F_436B::
    db   $BE, $C7, $20

BeginJingleBowWowChomp::
    ld   hl, Data_01F_439D                        ; $436E: $21 $9D $43
    call func_01F_7AB7                            ; $4371: $CD $B7 $7A
    jp   label_01F_539A                           ; $4374: $C3 $9A $53

ContinueJingleBowWowChomp::
    call IncrementValueAtBC                       ; $4377: $CD $75 $7A
    cp   $0D                                      ; $437A: $FE $0D
    jp   z, label_01F_53B5                        ; $437C: $CA $B5 $53

    ld   hl, Data_01F_4385                        ; $437F: $21 $85 $43
    jp   func_01F_7AE1                            ; $4382: $C3 $E1 $7A

Data_01F_4385::
    db   $FF, $C0, $FF, $80, $FF, $00, $FE, $00, $01, $00, $FF, $00, $01, $00, $FF, $00
    db   $00, $C0, $00, $C0, $00, $C0, $00, $C0

Data_01F_439D::
    db   $00, $00, $C0, $80, $86, $01

BeginJingleChargingSword::
    ld   a, $0E                                   ; $43A3: $3E $0E
    ld   [$D3BC], a                               ; $43A5: $EA $BC $D3
    ld   hl, Data_01F_43DC                        ; $43A8: $21 $DC $43
    call func_01F_7AB7                            ; $43AB: $CD $B7 $7A
    jp   label_01F_539A                           ; $43AE: $C3 $9A $53

ContinueJingleChargingSword::
    call DecrementValueAtDE                       ; $43B1: $CD $71 $7A
    ret  nz                                       ; $43B4: $C0

    ld   a, [$D379]                               ; $43B5: $FA $79 $D3
    cp   $02                                      ; $43B8: $FE $02
    jp   z, label_01F_53B5                        ; $43BA: $CA $B5 $53

    ld   a, $02                                   ; $43BD: $3E $02
    ld   [de], a                                  ; $43BF: $12
    call IncrementValueAtBC                       ; $43C0: $CD $75 $7A
    cp   $03                                      ; $43C3: $FE $03
    jr   z, .jr_01F_43CD                          ; $43C5: $28 $06

.jr_01F_43C7:
    ld   hl, Data_01F_43D8                        ; $43C7: $21 $D8 $43
    jp   func_01F_7AE1                            ; $43CA: $C3 $E1 $7A

.jr_01F_43CD:
    call func_01F_7A9A                            ; $43CD: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $43D0: $CA $BB $53

    ld   a, $01                                   ; $43D3: $3E $01
    ld   [bc], a                                  ; $43D5: $02
    jr   .jr_01F_43C7                             ; $43D6: $18 $EF

Data_01F_43D8::
    db   $00, $20, $FF, $F0

Data_01F_43DC::
    db   $00, $80, $87, $C0, $86, $02

BeginJinglePowder::
    ld   a, $04                                   ; $43E2: $3E $04
    ld   [$D3BC], a                               ; $43E4: $EA $BC $D3
    ld   hl, Data_01F_4417                        ; $43E7: $21 $17 $44
    call func_01F_7AB7                            ; $43EA: $CD $B7 $7A
    jp   label_01F_539A                           ; $43ED: $C3 $9A $53

ContinueJinglePowder::
    call DecrementValueAtDE                       ; $43F0: $CD $71 $7A
    ret  nz                                       ; $43F3: $C0

    ld   a, $04                                   ; $43F4: $3E $04
    ld   [de], a                                  ; $43F6: $12
    call IncrementValueAtBC                       ; $43F7: $CD $75 $7A
    cp   $05                                      ; $43FA: $FE $05
    jr   z, .jr_01F_4404                          ; $43FC: $28 $06

.jr_01F_43FE:
    ld   hl, Data_01F_440F                        ; $43FE: $21 $0F $44
    jp   func_01F_7AE1                            ; $4401: $C3 $E1 $7A

.jr_01F_4404:
    call func_01F_7A9A                            ; $4404: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4407: $CA $BB $53

    ld   a, $01                                   ; $440A: $3E $01
    ld   [bc], a                                  ; $440C: $02
    jr   .jr_01F_43FE                             ; $440D: $18 $EF

Data_01F_440F::
    db   $00, $06, $00, $04, $00, $02, $FF, $F4

Data_01F_4417::
    db   $00, $00, $C5, $D8, $87, $04

BeginJingleEnemyMorphIn::
    ld   a, $0A                                   ; $441D: $3E $0A
    ld   [$D3BC], a                               ; $441F: $EA $BC $D3
    ld   hl, Data_01F_4453                        ; $4422: $21 $53 $44
    call func_01F_7AB7                            ; $4425: $CD $B7 $7A
    jp   label_01F_5395                           ; $4428: $C3 $95 $53

ContinueJingleEnemyMorphIn::
    call IncrementValueAtBC                       ; $442B: $CD $75 $7A
    cp   $09                                      ; $442E: $FE $09
    jr   z, .jr_01F_4438                          ; $4430: $28 $06

.jr_01F_4432:
    ld   hl, Data_01F_4443                        ; $4432: $21 $43 $44
    jp   func_01F_7AE1                            ; $4435: $C3 $E1 $7A

.jr_01F_4438:
    call func_01F_7A9A                            ; $4438: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $443B: $CA $B5 $53

    ld   a, $01                                   ; $443E: $3E $01
    ld   [bc], a                                  ; $4440: $02
    jr   .jr_01F_4432                             ; $4441: $18 $EF

Data_01F_4443::
    db   $00, $40, $00, $80, $00, $80, $00, $40, $FF, $D0, $FF, $A0, $FF, $A0, $FF, $D0

Data_01F_4453::
    db   $00, $80, $1B, $00, $82, $01

BeginJingleSwordPoking::
    ld   hl, Data_01F_4471                        ; $4459: $21 $71 $44
    jp   label_01F_539A                           ; $445C: $C3 $9A $53

ContinueJingleSwordPoking::
    call DecrementValueAtDE                       ; $445F: $CD $71 $7A
    ret  nz                                       ; $4462: $C0

    call IncrementValueAtBC                       ; $4463: $CD $75 $7A
    cp   $02                                      ; $4466: $FE $02
    jp   z, func_01F_53BB                         ; $4468: $CA $BB $53

    ld   hl, Data_01F_4477                        ; $446B: $21 $77 $44
    jp   WriteChannel1AndDE                       ; $446E: $C3 $79 $7A

Data_01F_4471::
    db   $00, $3D, $F0, $D8, $C7, $03

Data_01F_4477::
    db   $00, $00, $81, $E0, $87, $08

BeginJingleJumpDown::
    ld   hl, Data_01F_4495                        ; $447D: $21 $95 $44
    jp   label_01F_539A                           ; $4480: $C3 $9A $53

ContinueJingleJumpDown::
    call DecrementValueAtDE                       ; $4483: $CD $71 $7A
    ret  nz                                       ; $4486: $C0

    call IncrementValueAtBC                       ; $4487: $CD $75 $7A
    cp   $02                                      ; $448A: $FE $02
    jp   z, func_01F_53BB                         ; $448C: $CA $BB $53

    ld   hl, Data_01F_449B                        ; $448F: $21 $9B $44
    jp   WriteChannel1AndDE                       ; $4492: $C3 $79 $7A

Data_01F_4495::
    db   $3F, $9E, $29, $80, $C7, $08

Data_01F_449B::
    db   $1F, $9F, $81, $20, $87, $10

BeginJingleBump::
    ld   hl, Data_01F_44C8                        ; $44A1: $21 $C8 $44
    call func_01F_7AB7                            ; $44A4: $CD $B7 $7A
    jp   label_01F_539A                           ; $44A7: $C3 $9A $53

ContinueJingleBump::
    call IncrementValueAtBC                       ; $44AA: $CD $75 $7A
    cp   $09                                      ; $44AD: $FE $09
    jp   z, label_01F_53B5                        ; $44AF: $CA $B5 $53

    ld   hl, Data_01F_44B8                        ; $44B2: $21 $B8 $44
    jp   func_01F_7AE1                            ; $44B5: $C3 $E1 $7A

Data_01F_44B8::
    db   $01, $00, $00, $C0, $00, $80, $00, $40, $FF, $C0, $FF, $80, $FF, $40, $FF, $00

Data_01F_44C8::
    db   $00, $9F, $A0, $00, $C2, $01

BeginJingleMoveSelection::
    ld   a, [$D361]                               ; $44CE: $FA $61 $D3
    cp   $13                                      ; $44D1: $FE $13
    jp   z, label_01F_53E6                        ; $44D3: $CA $E6 $53

    ldh  a, [rNR50]                               ; $44D6: $F0 $24
    cp   $77                                      ; $44D8: $FE $77
    jr   nz, .jr_01F_44E2                         ; $44DA: $20 $06

    ld   hl, Data_01F_4509                        ; $44DC: $21 $09 $45

.jr_01F_44DF:
    jp   label_01F_539A                           ; $44DF: $C3 $9A $53

.jr_01F_44E2:
    ld   hl, Data_01F_450F                        ; $44E2: $21 $0F $45
    jr   .jr_01F_44DF                             ; $44E5: $18 $F8

ContinueJingleMoveSelection::
    call DecrementValueAtDE                       ; $44E7: $CD $71 $7A
    ret  nz                                       ; $44EA: $C0

    call IncrementValueAtBC                       ; $44EB: $CD $75 $7A
    cp   $02                                      ; $44EE: $FE $02
    jp   z, func_01F_53BB                         ; $44F0: $CA $BB $53

    ldh  a, [rNR50]                               ; $44F3: $F0 $24
    cp   $77                                      ; $44F5: $FE $77
    jr   nz, .jr_01F_4505                         ; $44F7: $20 $0C

    ld   a, $10                                   ; $44F9: $3E $10

.jr_01F_44FB:
    ldh  [rNR12], a                               ; $44FB: $E0 $12
    ld   a, $C7                                   ; $44FD: $3E $C7
    ldh  [rNR14], a                               ; $44FF: $E0 $14
    ld   a, $08                                   ; $4501: $3E $08
    ld   [de], a                                  ; $4503: $12
    ret                                           ; $4504: $C9

.jr_01F_4505:
    ld   a, $20                                   ; $4505: $3E $20
    jr   .jr_01F_44FB                             ; $4507: $18 $F2

Data_01F_4509::
    db   $00, $9F, $80, $A0, $C7, $02

Data_01F_450F::
    db   $00, $9F, $F0, $A0, $C7, $02

BeginJingleHugeBump::
    ld   a, $05                                   ; $4515: $3E $05
    ld   [$D3BC], a                               ; $4517: $EA $BC $D3
    ld   hl, Data_01F_454E                        ; $451A: $21 $4E $45
    call func_01F_7AB7                            ; $451D: $CD $B7 $7A
    jp   label_01F_5395                           ; $4520: $C3 $95 $53

ContinueJingleHugeBump::
    call DecrementValueAtDE                       ; $4523: $CD $71 $7A
    ret  nz                                       ; $4526: $C0

    ld   a, $02                                   ; $4527: $3E $02
    ld   [de], a                                  ; $4529: $12
    call IncrementValueAtBC                       ; $452A: $CD $75 $7A
    cp   $07                                      ; $452D: $FE $07
    jr   z, .jr_01F_4537                          ; $452F: $28 $06

.jr_01F_4531:
    ld   hl, Data_01F_4542                        ; $4531: $21 $42 $45
    jp   func_01F_7AE1                            ; $4534: $C3 $E1 $7A

.jr_01F_4537:
    call func_01F_7A9A                            ; $4537: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $453A: $CA $BB $53

    ld   a, $01                                   ; $453D: $3E $01
    ld   [bc], a                                  ; $453F: $02
    jr   .jr_01F_4531                             ; $4540: $18 $EF

Data_01F_4542::
    db   $FF, $C0, $FF, $80, $FF, $40, $00, $C0, $00, $80, $00, $40

Data_01F_454E::
    db   $00, $80, $F4, $80, $83, $01

BeginJingleRevolvingDoor::
    ld   a, $16                                   ; $4554: $3E $16
    ld   [$D3BC], a                               ; $4556: $EA $BC $D3
    ld   hl, Data_01F_458F                        ; $4559: $21 $8F $45
    call func_01F_7AB7                            ; $455C: $CD $B7 $7A
    jp   label_01F_539A                           ; $455F: $C3 $9A $53

ContinueJingleRevolvingDoor::
    call IncrementValueAtBC                       ; $4562: $CD $75 $7A
    cp   $04                                      ; $4565: $FE $04
    jr   z, .jr_01F_456F                          ; $4567: $28 $06

.jr_01F_4569:
    ld   hl, Data_01F_4589                        ; $4569: $21 $89 $45
    jp   func_01F_7AE1                            ; $456C: $C3 $E1 $7A

.jr_01F_456F:
    call func_01F_7A9A                            ; $456F: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4572: $CA $BB $53

    cp   $08                                      ; $4575: $FE $08
    jr   z, .jr_01F_457E                          ; $4577: $28 $05

    ld   a, $01                                   ; $4579: $3E $01
    ld   [bc], a                                  ; $457B: $02
    jr   .jr_01F_4569                             ; $457C: $18 $EB

.jr_01F_457E:
    xor  a                                        ; $457E: $AF
    ld   [bc], a                                  ; $457F: $02
    ld   hl, Data_01F_4595                        ; $4580: $21 $95 $45
    call func_01F_7AB7                            ; $4583: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4586: $C3 $79 $7A

Data_01F_4589::
    db   $00, $28, $00, $00, $FF, $F0

Data_01F_458F::
    db   $00, $83, $47, $C0, $86, $02

Data_01F_4595::
    db   $00, $83, $47, $00, $87, $02

BeginJingleFeatherJump::
    ld   hl, Data_01F_45A8                        ; $459B: $21 $A8 $45
    jp   label_01F_539A                           ; $459E: $C3 $9A $53

ContinueJingleFeatherJump::
    call DecrementValueAtDE                       ; $45A1: $CD $71 $7A
    ret  nz                                       ; $45A4: $C0

    jp   func_01F_53BB                            ; $45A5: $C3 $BB $53

Data_01F_45A8::
    db   $27, $80, $C2, $48, $86, $18

BeginJingleWaterDive::
    ld   a, [$D361]                               ; $45AE: $FA $61 $D3
    cp   $08                                      ; $45B1: $FE $08
    jr   z, .jr_01F_45B9                          ; $45B3: $28 $04

    and  a                                        ; $45B5: $A7
    jp   nz, label_01F_53E6                       ; $45B6: $C2 $E6 $53

.jr_01F_45B9:
    ld   hl, Data_01F_45C6                        ; $45B9: $21 $C6 $45
    jp   label_01F_539A                           ; $45BC: $C3 $9A $53

ContinueJingleWaterDive::
    call DecrementValueAtDE                       ; $45BF: $CD $71 $7A
    ret  nz                                       ; $45C2: $C0

    jp   func_01F_53BB                            ; $45C3: $C3 $BB $53

Data_01F_45C6::
    db   $16, $AB, $20, $80, $C6, $05

BeginJingleWaterSwim::
    ld   hl, Data_01F_45E4                        ; $45CC: $21 $E4 $45
    jp   label_01F_539A                           ; $45CF: $C3 $9A $53

ContinueJingleWaterSwim::
    call DecrementValueAtDE                       ; $45D2: $CD $71 $7A
    ret  nz                                       ; $45D5: $C0

    call IncrementValueAtBC                       ; $45D6: $CD $75 $7A
    cp   $02                                      ; $45D9: $FE $02
    jp   z, func_01F_53BB                         ; $45DB: $CA $BB $53

    ld   hl, Data_01F_45EA                        ; $45DE: $21 $EA $45
    jp   WriteChannel1AndDE                       ; $45E1: $C3 $79 $7A

Data_01F_45E4::
    db   $17, $80, $0B, $00, $85, $10

Data_01F_45EA::
    db   $17, $80, $0E, $00, $C5, $10

BeginJingleUnknown10::
    jp   func_01F_7B5C                            ; $45F0: $C3 $5C $7B

BeginJingleOpenInventory::
    ld   a, $17                                   ; $45F3: $3E $17
    ld   [$D3BC], a                               ; $45F5: $EA $BC $D3
    ld   hl, $D32F                                ; $45F8: $21 $2F $D3
    set  7, [hl]                                  ; $45FB: $CB $FE
    ld   hl, Data_01F_4632                        ; $45FD: $21 $32 $46
    call func_01F_7AD0                            ; $4600: $CD $D0 $7A
    call WriteChannel2AndDE                       ; $4603: $CD $7F $7A
    ld   hl, Data_01F_4637                        ; $4606: $21 $37 $46
    call func_01F_7AB7                            ; $4609: $CD $B7 $7A
    jp   label_01F_539A                           ; $460C: $C3 $9A $53

ContinueJingleOpenInventory::
    call IncrementValueAtBC                       ; $460F: $CD $75 $7A
    cp   $02                                      ; $4612: $FE $02
    jr   z, .jr_01F_4625                          ; $4614: $28 $0F

.jr_01F_4616:
    ld   hl, Data_01F_4630                        ; $4616: $21 $30 $46
    call func_01F_7B11                            ; $4619: $CD $11 $7B
    ld   bc, $D394                                ; $461C: $01 $94 $D3
    ld   hl, Data_01F_4630                        ; $461F: $21 $30 $46
    jp   func_01F_7AE1                            ; $4622: $C3 $E1 $7A

.jr_01F_4625:
    call func_01F_7A9A                            ; $4625: $CD $9A $7A
    jp   z, label_01F_463D                        ; $4628: $CA $3D $46

    ld   a, $01                                   ; $462B: $3E $01
    ld   [bc], a                                  ; $462D: $02
    jr   .jr_01F_4616                             ; $462E: $18 $E6

Data_01F_4630::
    db   $00, $21

Data_01F_4632::
    db   $45, $0C, $00, $84, $12

Data_01F_4637::
    db   $00, $85, $0B, $00, $81, $12

label_01F_463D:
    ld   hl, $D32F                                ; $463D: $21 $2F $D3
    res  7, [hl]                                  ; $4640: $CB $BE
    ld   hl, Data_01F_431D                        ; $4642: $21 $1D $43
    call WriteChannel2AndDE                       ; $4645: $CD $7F $7A
    jp   label_01F_53B5                           ; $4648: $C3 $B5 $53

BeginJingleCloseInventory::
    ld   a, [$D361]                               ; $464B: $FA $61 $D3
    cp   $13                                      ; $464E: $FE $13
    jp   z, label_01F_53E6                        ; $4650: $CA $E6 $53

    ld   a, $08                                   ; $4653: $3E $08
    ld   [$D3BC], a                               ; $4655: $EA $BC $D3
    ld   hl, $D32F                                ; $4658: $21 $2F $D3
    set  7, [hl]                                  ; $465B: $CB $FE
    ld   hl, Data_01F_4692                        ; $465D: $21 $92 $46
    call func_01F_7AD0                            ; $4660: $CD $D0 $7A
    call WriteChannel2AndDE                       ; $4663: $CD $7F $7A
    ld   hl, Data_01F_4697                        ; $4666: $21 $97 $46
    call func_01F_7AB7                            ; $4669: $CD $B7 $7A
    jp   label_01F_539A                           ; $466C: $C3 $9A $53

ContinueJingleCloseInventory::
    call IncrementValueAtBC                       ; $466F: $CD $75 $7A
    cp   $02                                      ; $4672: $FE $02
    jr   z, .jr_01F_4685                          ; $4674: $28 $0F

.jr_01F_4676:
    ld   hl, Data_01F_4690                        ; $4676: $21 $90 $46
    call func_01F_7B11                            ; $4679: $CD $11 $7B
    ld   bc, $D394                                ; $467C: $01 $94 $D3
    ld   hl, Data_01F_4690                        ; $467F: $21 $90 $46
    jp   func_01F_7AE1                            ; $4682: $C3 $E1 $7A

.jr_01F_4685:
    call func_01F_7A9A                            ; $4685: $CD $9A $7A
    jp   z, label_01F_463D                        ; $4688: $CA $3D $46

    ld   a, $01                                   ; $468B: $3E $01
    ld   [bc], a                                  ; $468D: $02
    jr   .jr_01F_4676                             ; $468E: $18 $E6

Data_01F_4690::
    db   $FF, $D0

Data_01F_4692::
    db   $40, $0A, $B0, $87, $12

Data_01F_4697::
    db   $00, $80, $09, $C0, $86, $12

BeginJingleValidate::
    ld   a, $05                                   ; $469D: $3E $05
    ld   [$D3BC], a                               ; $469F: $EA $BC $D3
    ldh  a, [rNR50]                               ; $46A2: $F0 $24
    cp   $77                                      ; $46A4: $FE $77
    jr   nz, .jr_01F_46B1                         ; $46A6: $20 $09

    ld   hl, Data_01F_46DB                        ; $46A8: $21 $DB $46

.jr_01F_46AB:
    call func_01F_7AB7                            ; $46AB: $CD $B7 $7A
    jp   label_01F_539A                           ; $46AE: $C3 $9A $53

.jr_01F_46B1:
    ld   hl, Data_01F_46E1                        ; $46B1: $21 $E1 $46
    jr   .jr_01F_46AB                             ; $46B4: $18 $F5

ContinueJingleValidate::
    call DecrementValueAtDE                       ; $46B6: $CD $71 $7A
    ret  nz                                       ; $46B9: $C0

    ld   a, $03                                   ; $46BA: $3E $03
    ld   [de], a                                  ; $46BC: $12
    call IncrementValueAtBC                       ; $46BD: $CD $75 $7A
    cp   $04                                      ; $46C0: $FE $04
    jr   z, .jr_01F_46CA                          ; $46C2: $28 $06

.jr_01F_46C4:
    ld   hl, Data_01F_46D5                        ; $46C4: $21 $D5 $46
    jp   func_01F_7AE1                            ; $46C7: $C3 $E1 $7A

.jr_01F_46CA:
    call func_01F_7A9A                            ; $46CA: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $46CD: $CA $B5 $53

    ld   a, $01                                   ; $46D0: $3E $01
    ld   [bc], a                                  ; $46D2: $02
    jr   .jr_01F_46C4                             ; $46D3: $18 $EF

Data_01F_46D5::
    db   $00, $22, $00, $19, $FF, $C5

Data_01F_46DB::
    db   $00, $80, $A4, $7B, $87, $03

Data_01F_46E1::
    db   $00, $80, $F3, $7B, $87, $03

BeginJingleGotHeart::
    ld   a, [$D361]                               ; $46E7: $FA $61 $D3
    and  a                                        ; $46EA: $A7
    jp   nz, label_01F_53E6                       ; $46EB: $C2 $E6 $53

    ld   hl, Data_01F_46FB                        ; $46EE: $21 $FB $46
    jp   label_01F_539A                           ; $46F1: $C3 $9A $53

ContinueJingleGotHeart::
    call DecrementValueAtDE                       ; $46F4: $CD $71 $7A
    ret  nz                                       ; $46F7: $C0

    jp   func_01F_53BB                            ; $46F8: $C3 $BB $53

Data_01F_46FB::
    db   $35, $B0, $60, $20, $C7, $04

BeginJingleDialogBreak::
    ld   hl, Data_01F_4720                        ; $4701: $21 $20 $47
    jp   label_01F_539A                           ; $4704: $C3 $9A $53

ContinueJingleDialogBreak::
    call DecrementValueAtDE                       ; $4707: $CD $71 $7A
    ret  nz                                       ; $470A: $C0

    call IncrementValueAtBC                       ; $470B: $CD $75 $7A
    cp   $03                                      ; $470E: $FE $03
    jp   z, func_01F_53BB                         ; $4710: $CA $BB $53

    ld   hl, Data_01F_471C                        ; $4713: $21 $1C $47
    call GetHandlerAddressInTable                 ; $4716: $CD $64 $7A
    jp   WriteChannel1AndDE                       ; $4719: $C3 $79 $7A

Data_01F_471C::
    dw   Data_01F_4726
    dw   Data_01F_472C

Data_01F_4720::
    db   $00, $B0, $19, $4F, $C7, $06

Data_01F_4726::
    db   $00, $B0, $19, $7B, $C7, $06

Data_01F_472C::
    db   $00, $B0, $29, $9D, $C7, $03

BeginJingleShieldTing::
    ld   hl, Data_01F_473F                        ; $4732: $21 $3F $47
    jp   label_01F_539A                           ; $4735: $C3 $9A $53

ContinueJingleShieldTing::
    call DecrementValueAtDE                       ; $4738: $CD $71 $7A
    ret  nz                                       ; $473B: $C0

    jp   func_01F_53BB                            ; $473C: $C3 $BB $53

Data_01F_473F::
    db   $00, $00, $81, $BB, $C7, $20

BeginJingleGotPowerUp::
    ld   a, $2A                                   ; $4745: $3E $2A
    ld   [$D3BC], a                               ; $4747: $EA $BC $D3
    ld   hl, Data_01F_4784                        ; $474A: $21 $84 $47
    call func_01F_7AB7                            ; $474D: $CD $B7 $7A
    jp   label_01F_5395                           ; $4750: $C3 $95 $53

ContinueJingleGotPowerUp::
    call IncrementValueAtBC                       ; $4753: $CD $75 $7A
    cp   $03                                      ; $4756: $FE $03
    jr   z, .jr_01F_4760                          ; $4758: $28 $06

.jr_01F_475A:
    ld   hl, Data_01F_477E                        ; $475A: $21 $7E $47
    jp   func_01F_7AE1                            ; $475D: $C3 $E1 $7A

.jr_01F_4760:
    call func_01F_7A9A                            ; $4760: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4763: $CA $BB $53

    cp   $0E                                      ; $4766: $FE $0E
    jr   z, .jr_01F_4773                          ; $4768: $28 $09

    cp   $1C                                      ; $476A: $FE $1C
    jr   z, .jr_01F_4773                          ; $476C: $28 $05

    ld   a, $01                                   ; $476E: $3E $01
    ld   [bc], a                                  ; $4770: $02
    jr   .jr_01F_475A                             ; $4771: $18 $E7

.jr_01F_4773:
    ld   hl, Data_01F_477E                        ; $4773: $21 $7E $47
    call func_01F_7AE1                            ; $4776: $CD $E1 $7A
    xor  a                                        ; $4779: $AF
    ld   [$D394], a                               ; $477A: $EA $94 $D3
    ret                                           ; $477D: $C9

Data_01F_477E::
    db   $00, $20, $FF, $E8, $FF, $90

Data_01F_4784::
    db   $00, $80, $D7, $68, $87, $01

BeginJingleItemFalling::
    ld   hl, Data_01F_47A2                        ; $478A: $21 $A2 $47
    jp   label_01F_539A                           ; $478D: $C3 $9A $53

ContinueJingleItemFalling::
    call DecrementValueAtDE                       ; $4790: $CD $71 $7A
    ret  nz                                       ; $4793: $C0

    call IncrementValueAtBC                       ; $4794: $CD $75 $7A
    cp   $02                                      ; $4797: $FE $02
    jp   z, label_01F_53B5                        ; $4799: $CA $B5 $53

    ld   hl, Data_01F_47A8                        ; $479C: $21 $A8 $47
    jp   WriteChannel1AndDE                       ; $479F: $C3 $79 $7A

Data_01F_47A2::
    db   $2F, $80, $60, $E0, $86, $14

Data_01F_47A8::
    db   $2F, $80, $10, $E0, $86, $14

BeginJingleNewHeart::
    ld   hl, Data_01F_47D1                        ; $47AE: $21 $D1 $47
    jp   label_01F_5395                           ; $47B1: $C3 $95 $53

ContinueJingleNewHeart::
    call DecrementValueAtDE                       ; $47B4: $CD $71 $7A
    ret  nz                                       ; $47B7: $C0

    call IncrementValueAtBC                       ; $47B8: $CD $75 $7A
    cp   $05                                      ; $47BB: $FE $05
    jp   z, func_01F_53BB                         ; $47BD: $CA $BB $53

    ld   hl, Data_01F_47C9                        ; $47C0: $21 $C9 $47
    call GetHandlerAddressInTable                 ; $47C3: $CD $64 $7A
    jp   WriteChannel1AndDE                       ; $47C6: $C3 $79 $7A

Data_01F_47C9::
    dw   Data_01F_47D7
    dw   Data_01F_47DD
    dw   Data_01F_47E3
    dw   Data_01F_47E9

Data_01F_47D1::
    db   $00, $80, $C1, $A7, $87, $06

Data_01F_47D7::
    db   $00, $80, $C1, $B1, $87, $06

Data_01F_47DD::
    db   $00, $80, $C1, $BA, $87, $06

Data_01F_47E3::
    db   $00, $80, $C1, $BE, $87, $06

Data_01F_47E9::
    db   $00, $80, $A3, $C5, $87, $20

BeginJingleFairyHealing::
    ld   a, [$D361]                               ; $47EF: $FA $61 $D3
    cp   $1A                                      ; $47F2: $FE $1A
    jp   z, label_01F_53E6                        ; $47F4: $CA $E6 $53

    ld   hl, Data_01F_480F                        ; $47F7: $21 $0F $48
    jp   label_01F_539A                           ; $47FA: $C3 $9A $53

ContinueJingleFairyHealing::
    call DecrementValueAtDE                       ; $47FD: $CD $71 $7A
    ret  nz                                       ; $4800: $C0

    call IncrementValueAtBC                       ; $4801: $CD $75 $7A
    cp   $02                                      ; $4804: $FE $02
    jp   z, label_01F_53B5                        ; $4806: $CA $B5 $53

    ld   hl, Data_01F_4815                        ; $4809: $21 $15 $48
    jp   WriteChannel1FrequencyAndDE              ; $480C: $C3 $DF $53

Data_01F_480F::
    db   $00, $80, $34, $90, $87, $01

Data_01F_4815::
    db   $C8, $07, $04

BeginJingleClearMidboss::
    ld   a, $03                                   ; $4818: $3E $03
    ld   [$D3BC], a                               ; $481A: $EA $BC $D3
    ld   hl, Data_01F_4863                        ; $481D: $21 $63 $48
    call func_01F_7AB7                            ; $4820: $CD $B7 $7A
    jp   label_01F_5395                           ; $4823: $C3 $95 $53

ContinueJingleClearMidboss::
    call DecrementValueAtDE                       ; $4826: $CD $71 $7A
    ret  nz                                       ; $4829: $C0

    ld   a, $04                                   ; $482A: $3E $04
    ld   [de], a                                  ; $482C: $12
    call IncrementValueAtBC                       ; $482D: $CD $75 $7A
    cp   $08                                      ; $4830: $FE $08
    jr   z, .jr_01F_483A                          ; $4832: $28 $06

    ld   hl, Data_01F_4855                        ; $4834: $21 $55 $48
    jp   func_01F_7AE1                            ; $4837: $C3 $E1 $7A

.jr_01F_483A:
    call func_01F_7A9A                            ; $483A: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $483D: $CA $B5 $53

    cp   $02                                      ; $4840: $FE $02
    jr   z, .jr_01F_4850                          ; $4842: $28 $0C

    ld   hl, Data_01F_486F                        ; $4844: $21 $6F $48

.jr_01F_4847:
    call func_01F_7AB7                            ; $4847: $CD $B7 $7A
    ld   a, $04                                   ; $484A: $3E $04
    ld   [bc], a                                  ; $484C: $02
    jp   WriteChannel1AndDE                       ; $484D: $C3 $79 $7A

.jr_01F_4850:
    ld   hl, Data_01F_4869                        ; $4850: $21 $69 $48
    jr   .jr_01F_4847                             ; $4853: $18 $F2

Data_01F_4855::
    db   $00, $2A, $00, $2E, $00, $25, $00, $07, $00, $15, $00, $17, $00, $13

Data_01F_4863::
    db   $00, $00, $4C, $F7, $86, $04

Data_01F_4869::
    db   $00, $40, $40, $7B, $87, $04

Data_01F_486F::
    db   $00, $80, $10, $7B, $87, $04

BeginJingleMidbossWarp::
    ld   a, $2C                                   ; $4875: $3E $2C
    ld   [$D3BC], a                               ; $4877: $EA $BC $D3
    ld   hl, Data_01F_48C3                        ; $487A: $21 $C3 $48
    call func_01F_7AB7                            ; $487D: $CD $B7 $7A
    jp   label_01F_539A                           ; $4880: $C3 $9A $53

ContinueJingleMidbossWarp::
    call IncrementValueAtBC                       ; $4883: $CD $75 $7A
    cp   $03                                      ; $4886: $FE $03
    jr   z, .jr_01F_4894                          ; $4888: $28 $0A

    cp   $05                                      ; $488A: $FE $05
    jr   z, .jr_01F_48B0                          ; $488C: $28 $22

.jr_01F_488E:
    ld   hl, Data_01F_48BB                        ; $488E: $21 $BB $48
    jp   func_01F_7AE1                            ; $4891: $C3 $E1 $7A

.jr_01F_4894:
    call func_01F_7A9A                            ; $4894: $CD $9A $7A
    cp   $18                                      ; $4897: $FE $18
    jr   z, .jr_01F_48A4                          ; $4899: $28 $09

    cp   $17                                      ; $489B: $FE $17
    jr   z, .jr_01F_48B0                          ; $489D: $28 $11

    ld   a, $01                                   ; $489F: $3E $01
    ld   [bc], a                                  ; $48A1: $02
    jr   .jr_01F_488E                             ; $48A2: $18 $EA

.jr_01F_48A4:
    ld   a, $02                                   ; $48A4: $3E $02
    ld   [bc], a                                  ; $48A6: $02
    ld   hl, Data_01F_48C9                        ; $48A7: $21 $C9 $48
    call func_01F_7AB7                            ; $48AA: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $48AD: $C3 $79 $7A

.jr_01F_48B0:
    call func_01F_7A9A                            ; $48B0: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $48B3: $CA $BB $53

    ld   a, $03                                   ; $48B6: $3E $03
    ld   [bc], a                                  ; $48B8: $02
    jr   .jr_01F_488E                             ; $48B9: $18 $D3

Data_01F_48BB::
    db   $00, $AE, $FF, $60, $00, $AA, $FF, $60

Data_01F_48C3::
    db   $00, $40, $0C, $00, $85, $01

Data_01F_48C9::
    db   $00, $40, $A4, $40, $86, $01

BeginJingleWrongAnswer::
    ld   a, $08                                   ; $48CF: $3E $08
    ld   [$D3BC], a                               ; $48D1: $EA $BC $D3
    ld   hl, Data_01F_4901                        ; $48D4: $21 $01 $49
    jp   label_01F_539A                           ; $48D7: $C3 $9A $53

ContinueJingleWrongAnswer::
    call DecrementValueAtDE                       ; $48DA: $CD $71 $7A
    ret  nz                                       ; $48DD: $C0

    ld   a, $79                                   ; $48DE: $3E $79
    ldh  [rNR11], a                               ; $48E0: $E0 $11
    call IncrementValueAtBC                       ; $48E2: $CD $75 $7A
    cp   $03                                      ; $48E5: $FE $03
    jr   z, .jr_01F_48F2                          ; $48E7: $28 $09

.jr_01F_48E9:
    ld   hl, Data_01F_48FD                        ; $48E9: $21 $FD $48
    call GetHandlerAddressInTable                 ; $48EC: $CD $64 $7A
    jp   WriteChannel1FrequencyAndDE              ; $48EF: $C3 $DF $53

.jr_01F_48F2:
    call func_01F_7A9A                            ; $48F2: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $48F5: $CA $BB $53

    ld   a, $02                                   ; $48F8: $3E $02

.jr_01F_48FA:
    ld   [bc], a                                  ; $48FA: $02
    jr   .jr_01F_48E9                             ; $48FB: $18 $EC

Data_01F_48FD::
    dw   Data_01F_4907
    dw   Data_01F_4904

Data_01F_4901::
    db   $00, $79, $E0

Data_01F_4904::
    db   $C0, $C4, $02

Data_01F_4907::
    db   $C0, $C4, $0C

BeginJingleForestLost::
    ld   hl, Data_01F_492D                        ; $490A: $21 $2D $49
    jp   label_01F_5395                           ; $490D: $C3 $95 $53

ContinueJingleForestLost::
    call DecrementValueAtDE                       ; $4910: $CD $71 $7A
    ret  nz                                       ; $4913: $C0

    call IncrementValueAtBC                       ; $4914: $CD $75 $7A
    cp   $05                                      ; $4917: $FE $05
    jp   z, func_01F_53BB                         ; $4919: $CA $BB $53

    ld   hl, Data_01F_4925                        ; $491C: $21 $25 $49
    call GetHandlerAddressInTable                 ; $491F: $CD $64 $7A
    jp   WriteChannel1FrequencyAndDE              ; $4922: $C3 $DF $53

Data_01F_4925::
    dw   Data_01F_4933
    dw   Data_01F_4933
    dw   Data_01F_4936
    dw   Data_01F_4936

Data_01F_492D::
    db   $1F, $A6, $E1

Data_01F_4930::
    db   $00, $C7, $10

Data_01F_4933::
    db   $A0, $C6, $09

Data_01F_4936::
    db   $00, $C6, $18

BeginJingleEnemyMorphOut::
    ld   a, $0A                                   ; $4939: $3E $0A
    ld   [$D3BC], a                               ; $493B: $EA $BC $D3
    ld   hl, Data_01F_496F                        ; $493E: $21 $6F $49
    call func_01F_7AB7                            ; $4941: $CD $B7 $7A
    jp   label_01F_5395                           ; $4944: $C3 $95 $53

ContinueJingleEnemyMorphOut::
    call IncrementValueAtBC                       ; $4947: $CD $75 $7A
    cp   $09                                      ; $494A: $FE $09
    jr   z, .jr_01F_4954                          ; $494C: $28 $06

.jr_01F_494E:
    ld   hl, Data_01F_495F                        ; $494E: $21 $5F $49
    jp   func_01F_7AE1                            ; $4951: $C3 $E1 $7A

.jr_01F_4954:
    call func_01F_7A9A                            ; $4954: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4957: $CA $B5 $53

    ld   a, $01                                   ; $495A: $3E $01
    ld   [bc], a                                  ; $495C: $02
    jr   .jr_01F_494E                             ; $495D: $18 $EF

Data_01F_495F::
    db   $00, $30, $00, $60, $00, $60, $00, $30, $FF, $C0, $FF, $80, $FF, $80, $FF, $C0

Data_01F_496F::
    db   $00, $80, $0B, $20, $86, $01

BeginJingleBigBump::
    ld   a, [$D361]                               ; $4975: $FA $61 $D3
    cp   $20                                      ; $4978: $FE $20
    jr   z, .jr_01F_4980                          ; $497A: $28 $04

    and  a                                        ; $497C: $A7
    jp   nz, label_01F_53E6                       ; $497D: $C2 $E6 $53

.jr_01F_4980:
    ld   a, $08                                   ; $4980: $3E $08
    ld   [$D3BC], a                               ; $4982: $EA $BC $D3
    ld   hl, Data_01F_49AA                        ; $4985: $21 $AA $49
    call func_01F_7AB7                            ; $4988: $CD $B7 $7A
    jp   label_01F_539A                           ; $498B: $C3 $9A $53

ContinueJingleBigBump::
    call IncrementValueAtBC                       ; $498E: $CD $75 $7A
    cp   $03                                      ; $4991: $FE $03
    jr   z, .jr_01F_499B                          ; $4993: $28 $06

.jr_01F_4995:
    ld   hl, Data_01F_49A6                        ; $4995: $21 $A6 $49
    jp   func_01F_7AE1                            ; $4998: $C3 $E1 $7A

.jr_01F_499B:
    call func_01F_7A9A                            ; $499B: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $499E: $CA $BB $53

    ld   a, $01                                   ; $49A1: $3E $01
    ld   [bc], a                                  ; $49A3: $02
    jr   .jr_01F_4995                             ; $49A4: $18 $EF

Data_01F_49A6::
    db   $00, $C0, $FF, $A0

Data_01F_49AA::
    db   $00, $80, $F1, $80, $83, $01

BeginJingleSeagull::
    ld   a, $1C                                   ; $49B0: $3E $1C
    ld   [$D3BC], a                               ; $49B2: $EA $BC $D3
    ld   hl, Data_01F_49F6                        ; $49B5: $21 $F6 $49
    call func_01F_7AB7                            ; $49B8: $CD $B7 $7A
    jp   label_01F_539A                           ; $49BB: $C3 $9A $53

ContinueJingleSeagull::
    call IncrementValueAtBC                       ; $49BE: $CD $75 $7A
    cp   $02                                      ; $49C1: $FE $02
    jr   z, .jr_01F_49CB                          ; $49C3: $28 $06

.jr_01F_49C5:
    ld   hl, Data_01F_49F4                        ; $49C5: $21 $F4 $49
    jp   func_01F_7AE1                            ; $49C8: $C3 $E1 $7A

.jr_01F_49CB:
    call func_01F_7A9A                            ; $49CB: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $49CE: $CA $B5 $53

    cp   $14                                      ; $49D1: $FE $14
    jr   z, .jr_01F_49DE                          ; $49D3: $28 $09

    cp   $0A                                      ; $49D5: $FE $0A
    jr   z, .jr_01F_49E9                          ; $49D7: $28 $10

    ld   a, $01                                   ; $49D9: $3E $01
    ld   [bc], a                                  ; $49DB: $02
    jr   .jr_01F_49C5                             ; $49DC: $18 $E7

.jr_01F_49DE:
    xor  a                                        ; $49DE: $AF
    ld   [bc], a                                  ; $49DF: $02
    ld   hl, Data_01F_49FC                        ; $49E0: $21 $FC $49
    call func_01F_7AB7                            ; $49E3: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $49E6: $C3 $79 $7A

.jr_01F_49E9:
    xor  a                                        ; $49E9: $AF
    ld   [bc], a                                  ; $49EA: $02
    ld   hl, Data_01F_4A02                        ; $49EB: $21 $02 $4A
    call func_01F_7AB7                            ; $49EE: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $49F1: $C3 $79 $7A

Data_01F_49F4::
    db   $FF, $FF

Data_01F_49F6::
    db   $00, $00, $19, $B0, $87, $01

Data_01F_49FC::
    db   $00, $00, $62, $A7, $87, $01

Data_01F_4A02::
    db   $00, $00, $10, $A7, $87, $01

BeginJingleHoneycomb::
    ld   a, [$D361]                               ; $4A08: $FA $61 $D3
    cp   $22                                      ; $4A0B: $FE $22
    jp   z, label_01F_53E6                        ; $4A0D: $CA $E6 $53

    ld   bc, $D3D7                                ; $4A10: $01 $D7 $D3
    call IncrementValueAtBC                       ; $4A13: $CD $75 $7A
    cp   $04                                      ; $4A16: $FE $04
    jr   nc, .jr_01F_4A20                         ; $4A18: $30 $06

.jr_01F_4A1A:
    ld   hl, Data_01F_4A52                        ; $4A1A: $21 $52 $4A
    jp   label_01F_539A                           ; $4A1D: $C3 $9A $53

.jr_01F_4A20:
    cp   $06                                      ; $4A20: $FE $06
    jr   nc, .jr_01F_4A2A                         ; $4A22: $30 $06

.jr_01F_4A24:
    ld   hl, Data_01F_4A58                        ; $4A24: $21 $58 $4A
    jp   label_01F_539A                           ; $4A27: $C3 $9A $53

.jr_01F_4A2A:
    cp   $08                                      ; $4A2A: $FE $08
    jr   nc, .jr_01F_4A34                         ; $4A2C: $30 $06

.jr_01F_4A2E:
    ld   hl, Data_01F_4A5E                        ; $4A2E: $21 $5E $4A
    jp   label_01F_539A                           ; $4A31: $C3 $9A $53

.jr_01F_4A34:
    cp   $09                                      ; $4A34: $FE $09
    jr   nc, .jr_01F_4A3E                         ; $4A36: $30 $06

    ld   hl, Data_01F_4A64                        ; $4A38: $21 $64 $4A
    jp   label_01F_539A                           ; $4A3B: $C3 $9A $53

.jr_01F_4A3E:
    cp   $0B                                      ; $4A3E: $FE $0B
    jr   nc, .jr_01F_4A44                         ; $4A40: $30 $02

    jr   .jr_01F_4A2E                             ; $4A42: $18 $EA

.jr_01F_4A44:
    cp   $0D                                      ; $4A44: $FE $0D
    jr   z, .jr_01F_4A4A                          ; $4A46: $28 $02

    jr   .jr_01F_4A24                             ; $4A48: $18 $DA

.jr_01F_4A4A:
    ld   a, $01                                   ; $4A4A: $3E $01
    ld   [bc], a                                  ; $4A4C: $02
    jr   .jr_01F_4A1A                             ; $4A4D: $18 $CB

ContinueJingleHoneycomb::
    jp   func_01F_53BB                            ; $4A4F: $C3 $BB $53

Data_01F_4A52::
    db   $15, $38, $30, $40, $C6, $02

Data_01F_4A58::
    db   $15, $38, $40, $3C, $C6, $02

Data_01F_4A5E::
    db   $15, $38, $60, $38, $C6, $02

Data_01F_4A64::
    db   $15, $38, $90, $34, $C6, $02, $15, $38, $D0, $30, $C6, $02

BeginJingleDungeonOpened::
    ld   hl, $D32F                                ; $4A70: $21 $2F $D3
    set  7, [hl]                                  ; $4A73: $CB $FE
    ld   hl, Data_01F_4AAD                        ; $4A75: $21 $AD $4A
    jp   label_01F_5395                           ; $4A78: $C3 $95 $53

ContinueJingleDungeonOpened::
    call DecrementValueAtDE                       ; $4A7B: $CD $71 $7A
    ret  nz                                       ; $4A7E: $C0

    call IncrementValueAtBC                       ; $4A7F: $CD $75 $7A
    cp   $08                                      ; $4A82: $FE $08
    jr   z, .jr_01F_4A97                          ; $4A84: $28 $11

    ld   hl, Data_01F_4A9F                        ; $4A86: $21 $9F $4A
    call GetHandlerAddressInTable                 ; $4A89: $CD $64 $7A
    ld   a, [$D394]                               ; $4A8C: $FA $94 $D3
    and  $01                                      ; $4A8F: $E6 $01
    jp   nz, WriteChannel2AndDE                   ; $4A91: $C2 $7F $7A

    jp   WriteChannel1AndDE                       ; $4A94: $C3 $79 $7A

.jr_01F_4A97:
    ld   hl, $D32F                                ; $4A97: $21 $2F $D3
    res  7, [hl]                                  ; $4A9A: $CB $BE
    jp   label_01F_53B5                           ; $4A9C: $C3 $B5 $53

Data_01F_4A9F::
    dw   Data_01F_4AB3
    dw   Data_01F_4AB8
    dw   Data_01F_4ABE
    dw   Data_01F_4AC3
    dw   Data_01F_4AC9
    dw   Data_01F_4ACE
    dw   Data_01F_4AD4

Data_01F_4AAD::
    db   $00, $80, $E2, $A7, $87, $09

Data_01F_4AB3::
    db   $80, $E2, $A2, $87, $08

Data_01F_4AB8::
    db   $00, $80, $E2, $90, $87, $08

Data_01F_4ABE::
    db   $80, $E2, $7B, $87, $08

Data_01F_4AC3::
    db   $00, $80, $B2, $59, $87, $09

Data_01F_4AC9::
    db   $80, $E2, $97, $87, $0A

Data_01F_4ACE::
    db   $00, $80, $E2, $AC, $87, $0B

Data_01F_4AD4::
    db   $80, $E2, $BE, $87, $10

BeginJingleJump::
    ld   hl, Data_01F_4AE6                        ; $4AD9: $21 $E6 $4A
    jp   label_01F_539A                           ; $4ADC: $C3 $9A $53

ContinueJingleJump::
    call DecrementValueAtDE                       ; $4ADF: $CD $71 $7A
    ret  nz                                       ; $4AE2: $C0

    jp   func_01F_53BB                            ; $4AE3: $C3 $BB $53

Data_01F_4AE6::
    db   $27, $80, $83, $00, $86, $18

BeginJingleOverworldWarp::
    ld   a, $07                                   ; $4AEC: $3E $07
    ld   [$D3BC], a                               ; $4AEE: $EA $BC $D3
    ld   hl, Data_01F_4B2B                        ; $4AF1: $21 $2B $4B
    jp   label_01F_5395                           ; $4AF4: $C3 $95 $53

ContinueJingleOverworldWarp::
    call DecrementValueAtDE                       ; $4AF7: $CD $71 $7A
    ret  nz                                       ; $4AFA: $C0

    call IncrementValueAtBC                       ; $4AFB: $CD $75 $7A
    cp   $06                                      ; $4AFE: $FE $06
    jr   z, .jr_01F_4B0F                          ; $4B00: $28 $0D

    cp   $07                                      ; $4B02: $FE $07
    jr   z, .jr_01F_4B1A                          ; $4B04: $28 $14

.jr_01F_4B06:
    ld   hl, Data_01F_4B1F                        ; $4B06: $21 $1F $4B
    call GetHandlerAddressInTable                 ; $4B09: $CD $64 $7A
    jp   WriteChannel1FrequencyAndDE              ; $4B0C: $C3 $DF $53

.jr_01F_4B0F:
    call func_01F_7A9A                            ; $4B0F: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4B12: $CA $B5 $53

    ld   a, $06                                   ; $4B15: $3E $06
    ld   [bc], a                                  ; $4B17: $02
    jr   .jr_01F_4B06                             ; $4B18: $18 $EC

.jr_01F_4B1A:
    ld   a, $03                                   ; $4B1A: $3E $03
    ld   [bc], a                                  ; $4B1C: $02
    jr   .jr_01F_4B06                             ; $4B1D: $18 $E7

Data_01F_4B1F::
    dw   Data_01F_4B31
    dw   Data_01F_4B34
    dw   Data_01F_4B37
    dw   Data_01F_4B3A
    dw   Data_01F_4B3D
    dw   Data_01F_4B40

Data_01F_4B2B::
    db   $00, $80, $A5, $06, $87, $02

Data_01F_4B31::
    db   $21, $07, $02

Data_01F_4B34::
    db   $39, $07, $02

Data_01F_4B37::
    db   $4F, $07, $02

Data_01F_4B3A::
    db   $62, $07, $02

Data_01F_4B3D::
    db   $74, $07, $02

Data_01F_4B40::
    db   $06, $07, $02

BeginJingleDisappear::
    ld   a, $0E                                   ; $4B43: $3E $0E
    ld   [$D3BC], a                               ; $4B45: $EA $BC $D3
    ld   hl, Data_01F_4B85                        ; $4B48: $21 $85 $4B
    call func_01F_7AB7                            ; $4B4B: $CD $B7 $7A
    jp   label_01F_5395                           ; $4B4E: $C3 $95 $53

ContinueJingleDisappear::
    call DecrementValueAtDE                       ; $4B51: $CD $71 $7A
    ret  nz                                       ; $4B54: $C0

    ld   a, $03                                   ; $4B55: $3E $03
    ld   [de], a                                  ; $4B57: $12
    call IncrementValueAtBC                       ; $4B58: $CD $75 $7A
    cp   $04                                      ; $4B5B: $FE $04
    jr   z, .jr_01F_4B65                          ; $4B5D: $28 $06

.jr_01F_4B5F:
    ld   hl, Data_01F_4B7F                        ; $4B5F: $21 $7F $4B
    jp   func_01F_7AE1                            ; $4B62: $C3 $E1 $7A

.jr_01F_4B65:
    call func_01F_7A9A                            ; $4B65: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4B68: $CA $BB $53

    cp   $09                                      ; $4B6B: $FE $09
    jr   z, .jr_01F_4B74                          ; $4B6D: $28 $05

    ld   a, $01                                   ; $4B6F: $3E $01
    ld   [bc], a                                  ; $4B71: $02
    jr   .jr_01F_4B5F                             ; $4B72: $18 $EB

.jr_01F_4B74:
    xor  a                                        ; $4B74: $AF
    ld   [bc], a                                  ; $4B75: $02
    ld   hl, Data_01F_4B8B                        ; $4B76: $21 $8B $4B
    call func_01F_7AB7                            ; $4B79: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4B7C: $C3 $79 $7A

Data_01F_4B7F::
    db   $FF, $E0, $00, $20, $FF, $FC

Data_01F_4B85::
    db   $00, $00, $0C, $F0, $87, $03

Data_01F_4B8B::
    db   $00, $00, $A7, $DC, $87, $03

BeginJingleWalrus::
    ld   hl, Data_01F_4BAB                        ; $4B91: $21 $AB $4B
    jp   label_01F_539A                           ; $4B94: $C3 $9A $53

ContinueJingleWalrus::
    call DecrementValueAtDE                       ; $4B97: $CD $71 $7A
    ret  nz                                       ; $4B9A: $C0

    call IncrementValueAtBC                       ; $4B9B: $CD $75 $7A
    cp   $02                                      ; $4B9E: $FE $02
    jp   z, label_01F_53B5                        ; $4BA0: $CA $B5 $53

    ld   a, $1E                                   ; $4BA3: $3E $1E
    ldh  [rNR10], a                               ; $4BA5: $E0 $10
    ld   a, $18                                   ; $4BA7: $3E $18
    ld   [de], a                                  ; $4BA9: $12
    ret                                           ; $4BAA: $C9

Data_01F_4BAB::
    db   $14, $40, $C0, $00, $81, $0C

BeginJingleMasterStalfos::
    ld   hl, Data_01F_4BDE                        ; $4BB1: $21 $DE $4B
    jp   label_01F_539A                           ; $4BB4: $C3 $9A $53

ContinueJingleMasterStalfos::
    call DecrementValueAtDE                       ; $4BB7: $CD $71 $7A
    ret  nz                                       ; $4BBA: $C0

    call IncrementValueAtBC                       ; $4BBB: $CD $75 $7A
    cp   $08                                      ; $4BBE: $FE $08
    jp   z, func_01F_53BB                         ; $4BC0: $CA $BB $53

    ld   hl, Data_01F_4BD0                        ; $4BC3: $21 $D0 $4B
    call GetHandlerAddressInTable                 ; $4BC6: $CD $64 $7A
    ld   a, $BD                                   ; $4BC9: $3E $BD
    ldh  [rNR11], a                               ; $4BCB: $E0 $11
    jp   WriteChannel1FrequencyAndDE              ; $4BCD: $C3 $DF $53

Data_01F_4BD0::
    dw   Data_01F_4BE4
    dw   Data_01F_4BE7
    dw   Data_01F_4BEA
    dw   Data_01F_4BED
    dw   Data_01F_4BF0
    dw   Data_01F_4BF3
    dw   Data_01F_4BF6

Data_01F_4BDE::
    db   $00, $BD, $F0, $E0, $C7, $0C

Data_01F_4BE4::
    db   $E0, $C7, $03

Data_01F_4BE7::
    db   $C0, $C7, $03

Data_01F_4BEA::
    db   $A0, $C7, $04

Data_01F_4BED::
    db   $80, $C7, $04

Data_01F_4BF0::
    db   $60, $C7, $05

Data_01F_4BF3::
    db   $40, $C7, $06

Data_01F_4BF6::
    db   $20, $C7, $03

BeginJingleSlimeEelPull::
    ld   hl, Data_01F_4C13                        ; $4BF9: $21 $13 $4C
    jp   label_01F_539A                           ; $4BFC: $C3 $9A $53

ContinueJingleSlimeEelPull::
    call DecrementValueAtDE                       ; $4BFF: $CD $71 $7A
    ret  nz                                       ; $4C02: $C0

    call IncrementValueAtBC                       ; $4C03: $CD $75 $7A
    cp   $02                                      ; $4C06: $FE $02
    jp   z, func_01F_53BB                         ; $4C08: $CA $BB $53

    ld   a, $1E                                   ; $4C0B: $3E $1E
    ldh  [rNR10], a                               ; $4C0D: $E0 $10
    ld   a, $06                                   ; $4C0F: $3E $06
    ld   [de], a                                  ; $4C11: $12
    ret                                           ; $4C12: $C9

Data_01F_4C13::
    db   $17, $96, $49, $60, $C6, $04

BeginJingleDodongoEatBomb::
    ld   hl, Data_01F_4C26                        ; $4C19: $21 $26 $4C
    jp   label_01F_539A                           ; $4C1C: $C3 $9A $53

ContinueJingleDodongoEatBomb::
    call DecrementValueAtDE                       ; $4C1F: $CD $71 $7A
    ret  nz                                       ; $4C22: $C0

    jp   label_01F_53B5                           ; $4C23: $C3 $B5 $53

Data_01F_4C26::
    db   $16, $00, $F0, $00, $C2, $10

BeginJingleInstrumentWarp::
    ld   a, $2C                                   ; $4C2C: $3E $2C
    ld   [$D3BC], a                               ; $4C2E: $EA $BC $D3
    ld   hl, Data_01F_4C75                        ; $4C31: $21 $75 $4C
    call func_01F_7AB7                            ; $4C34: $CD $B7 $7A
    jp   label_01F_539A                           ; $4C37: $C3 $9A $53

ContinueJingleInstrumentWarp::
    call IncrementValueAtBC                       ; $4C3A: $CD $75 $7A
    cp   $0B                                      ; $4C3D: $FE $0B
    jr   z, .jr_01F_4C47                          ; $4C3F: $28 $06

.jr_01F_4C41:
    ld   hl, Data_01F_4C61                        ; $4C41: $21 $61 $4C
    jp   func_01F_7AE1                            ; $4C44: $C3 $E1 $7A

.jr_01F_4C47:
    call func_01F_7A9A                            ; $4C47: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4C4A: $CA $B5 $53

    cp   $0C                                      ; $4C4D: $FE $0C
    jr   z, .jr_01F_4C56                          ; $4C4F: $28 $05

    ld   a, $01                                   ; $4C51: $3E $01
    ld   [bc], a                                  ; $4C53: $02
    jr   .jr_01F_4C41                             ; $4C54: $18 $EB

.jr_01F_4C56:
    xor  a                                        ; $4C56: $AF
    ld   [bc], a                                  ; $4C57: $02
    ld   hl, Data_01F_4C7B                        ; $4C58: $21 $7B $4C
    call func_01F_7AB7                            ; $4C5B: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4C5E: $C3 $79 $7A

Data_01F_4C61::
    db   $00, $08, $FF, $F0, $00, $08, $FF, $FC, $00, $06, $FF, $F8, $00, $06, $FF, $FA
    db   $00, $08, $FF, $FF

Data_01F_4C75::
    db   $00, $00, $0F, $D0, $87, $02

Data_01F_4C7B::
    db   $00, $00, $F7, $F0, $87, $04

BeginJingleManboWarp::
    ld   a, $22                                   ; $4C81: $3E $22
    ld   [$D3BC], a                               ; $4C83: $EA $BC $D3
    ld   hl, Data_01F_4CCF                        ; $4C86: $21 $CF $4C
    call func_01F_7AB7                            ; $4C89: $CD $B7 $7A
    jp   label_01F_5395                           ; $4C8C: $C3 $95 $53

ContinueJingleManboWarp::
    call IncrementValueAtBC                       ; $4C8F: $CD $75 $7A
    cp   $07                                      ; $4C92: $FE $07
    jr   z, .jr_01F_4C9C                          ; $4C94: $28 $06

.jr_01F_4C96:
    ld   hl, Data_01F_4CC3                        ; $4C96: $21 $C3 $4C
    jp   func_01F_7AE1                            ; $4C99: $C3 $E1 $7A

.jr_01F_4C9C:
    call func_01F_7A9A                            ; $4C9C: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4C9F: $CA $BB $53

    cp   $1E                                      ; $4CA2: $FE $1E
    jr   z, .jr_01F_4CB2                          ; $4CA4: $28 $0C

    cp   $06                                      ; $4CA6: $FE $06
    jr   z, .jr_01F_4CBE                          ; $4CA8: $28 $14

    ld   a, $01                                   ; $4CAA: $3E $01
    ld   bc, $D394                                ; $4CAC: $01 $94 $D3
    ld   [bc], a                                  ; $4CAF: $02
    jr   .jr_01F_4C96                             ; $4CB0: $18 $E4

.jr_01F_4CB2:
    ld   hl, Data_01F_4CD5                        ; $4CB2: $21 $D5 $4C

.jr_01F_4CB5:
    ld   a, $01                                   ; $4CB5: $3E $01
    ld   [bc], a                                  ; $4CB7: $02
    call func_01F_7AB7                            ; $4CB8: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4CBB: $C3 $79 $7A

.jr_01F_4CBE:
    ld   hl, Data_01F_4CDB                        ; $4CBE: $21 $DB $4C
    jr   .jr_01F_4CB5                             ; $4CC1: $18 $F2

Data_01F_4CC3::
    db   $00, $02, $00, $01, $FF, $F0, $FF, $E0, $FF, $C0, $00, $71

Data_01F_4CCF::
    db   $00, $00, $0F, $00, $87, $01

Data_01F_4CD5::
    db   $00, $00, $40, $10, $87, $01

Data_01F_4CDB::
    db   $00, $00, $47, $70, $87, $01

BeginJingleGhostPresence::
    ld   a, $03                                   ; $4CE1: $3E $03
    ld   [$D3BC], a                               ; $4CE3: $EA $BC $D3
    ld   hl, Data_01F_4D20                        ; $4CE6: $21 $20 $4D
    call func_01F_7AB7                            ; $4CE9: $CD $B7 $7A
    jp   label_01F_5395                           ; $4CEC: $C3 $95 $53

ContinueJingleGhostPresence::
    call DecrementValueAtDE                       ; $4CEF: $CD $71 $7A
    ret  nz                                       ; $4CF2: $C0

    ld   a, $08                                   ; $4CF3: $3E $08
    ld   [de], a                                  ; $4CF5: $12
    call IncrementValueAtBC                       ; $4CF6: $CD $75 $7A
    cp   $05                                      ; $4CF9: $FE $05
    jr   z, .jr_01F_4D03                          ; $4CFB: $28 $06

.jr_01F_4CFD:
    ld   hl, Data_01F_4D18                        ; $4CFD: $21 $18 $4D
    jp   func_01F_7AE1                            ; $4D00: $C3 $E1 $7A

.jr_01F_4D03:
    call func_01F_7A9A                            ; $4D03: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4D06: $CA $BB $53

    cp   $01                                      ; $4D09: $FE $01
    jr   z, .jr_01F_4D12                          ; $4D0B: $28 $05

.jr_01F_4D0D:
    ld   a, $01                                   ; $4D0D: $3E $01
    ld   [bc], a                                  ; $4D0F: $02
    jr   .jr_01F_4CFD                             ; $4D10: $18 $EB

.jr_01F_4D12:
    ld   a, $65                                   ; $4D12: $3E $65
    ldh  [rNR12], a                               ; $4D14: $E0 $12
    jr   .jr_01F_4D0D                             ; $4D16: $18 $F5

Data_01F_4D18::
    db   $00, $04, $FF, $DD, $00, $06, $00, $19

Data_01F_4D20::
    db   $00, $80, $1F, $B6, $87, $08

BeginJingleEagleTowerOpen::
    ld   a, $09                                   ; $4D26: $3E $09
    ld   [$D3BC], a                               ; $4D28: $EA $BC $D3
    ld   hl, Data_01F_4DAB                        ; $4D2B: $21 $AB $4D
    call func_01F_7AB7                            ; $4D2E: $CD $B7 $7A
    jp   label_01F_539A                           ; $4D31: $C3 $9A $53

ContinueJingleEagleTowerOpen::
    call IncrementValueAtBC                       ; $4D34: $CD $75 $7A
    cp   $29                                      ; $4D37: $FE $29
    jr   z, .jr_01F_4D41                          ; $4D39: $28 $06

.jr_01F_4D3B:
    ld   hl, Data_01F_4D5B                        ; $4D3B: $21 $5B $4D
    jp   func_01F_7AE1                            ; $4D3E: $C3 $E1 $7A

.jr_01F_4D41:
    call func_01F_7A9A                            ; $4D41: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4D44: $CA $BB $53

    cp   $03                                      ; $4D47: $FE $03
    jr   z, .jr_01F_4D50                          ; $4D49: $28 $05

    ld   a, $01                                   ; $4D4B: $3E $01
    ld   [bc], a                                  ; $4D4D: $02
    jr   .jr_01F_4D3B                             ; $4D4E: $18 $EB

.jr_01F_4D50:
    xor  a                                        ; $4D50: $AF
    ld   [bc], a                                  ; $4D51: $02
    ld   hl, Data_01F_4DB1                        ; $4D52: $21 $B1 $4D
    call func_01F_7AB7                            ; $4D55: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4D58: $C3 $79 $7A

Data_01F_4D5B::
    db   $00, $30, $00, $30, $00, $30, $00, $30
    db   $00, $28, $00, $28, $00, $28, $00, $28
    db   $00, $20, $00, $20, $00, $20, $00, $20
    db   $00, $18, $00, $18, $00, $18, $00, $18
    db   $00, $10, $00, $10, $00, $10, $00, $10
    db   $FF, $F0, $FF, $F0, $FF, $F0, $FF, $F0
    db   $FF, $E8, $FF, $E8, $FF, $E8, $FF, $E8
    db   $FF, $E0, $FF, $E0, $FF, $E0, $FF, $E0
    db   $FF, $D8, $FF, $D8, $FF, $D8, $FF, $D8
    db   $FF, $D0, $FF, $D0, $FF, $D0, $FF, $D0

Data_01F_4DAB::
    db   $00, $80, $1D, $00, $81, $10

Data_01F_4DB1::
    db   $00, $80, $F7, $00, $81, $10

BeginJinglePoof::
    ld   a, $07                                   ; $4DB7: $3E $07
    ld   [$D3BC], a                               ; $4DB9: $EA $BC $D3
    ld   hl, Data_01F_4DE9                        ; $4DBC: $21 $E9 $4D
    call func_01F_7AB7                            ; $4DBF: $CD $B7 $7A
    jp   label_01F_539A                           ; $4DC2: $C3 $9A $53

ContinueJinglePoof::
    call IncrementValueAtBC                       ; $4DC5: $CD $75 $7A
    cp   $07                                      ; $4DC8: $FE $07
    jr   z, .jr_01F_4DD2                          ; $4DCA: $28 $06

.jr_01F_4DCC:
    ld   hl, Data_01F_4DDD                        ; $4DCC: $21 $DD $4D
    jp   func_01F_7AE1                            ; $4DCF: $C3 $E1 $7A

.jr_01F_4DD2:
    call func_01F_7A9A                            ; $4DD2: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4DD5: $CA $B5 $53

    ld   a, $01                                   ; $4DD8: $3E $01
    ld   [bc], a                                  ; $4DDA: $02
    jr   .jr_01F_4DCC                             ; $4DDB: $18 $EF

Data_01F_4DDD::
    db   $00, $80, $00, $60, $00, $40, $FF, $C0, $FF, $A0, $FF, $88

Data_01F_4DE9::
    db   $00, $80, $F2, $00, $85, $01

BeginJingleEvilEagle::
    ld   a, $0A                                   ; $4DEF: $3E $0A
    ld   [$D3BC], a                               ; $4DF1: $EA $BC $D3
    ld   hl, Data_01F_4E0A                        ; $4DF4: $21 $0A $4E
    jp   label_01F_539A                           ; $4DF7: $C3 $9A $53

ContinueJingleEvilEagle::
    call DecrementValueAtDE                       ; $4DFA: $CD $71 $7A
    ret  nz                                       ; $4DFD: $C0

    call func_01F_7A9A                            ; $4DFE: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4E01: $CA $BB $53

    ld   hl, Data_01F_4E0A                        ; $4E04: $21 $0A $4E
    jp   WriteChannel1AndDE                       ; $4E07: $C3 $79 $7A

Data_01F_4E0A::
    db   $17, $BC, $64, $44, $C7, $02

BeginJingleGrimCreeper::
    ld   a, $14                                   ; $4E10: $3E $14
    ld   [$D3BC], a                               ; $4E12: $EA $BC $D3
    ld   hl, Data_01F_4E4A                        ; $4E15: $21 $4A $4E
    call func_01F_7AB7                            ; $4E18: $CD $B7 $7A
    jp   label_01F_539A                           ; $4E1B: $C3 $9A $53

ContinueJingleGrimCreeper::
    call IncrementValueAtBC                       ; $4E1E: $CD $75 $7A
    cp   $03                                      ; $4E21: $FE $03
    jr   z, .jr_01F_4E2B                          ; $4E23: $28 $06

.jr_01F_4E25:
    ld   hl, Data_01F_4E46                        ; $4E25: $21 $46 $4E
    jp   func_01F_7AE1                            ; $4E28: $C3 $E1 $7A

.jr_01F_4E2B:
    call func_01F_7A9A                            ; $4E2B: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $4E2E: $CA $BB $53

    cp   $10                                      ; $4E31: $FE $10
    jr   z, .jr_01F_4E3A                          ; $4E33: $28 $05

    ld   a, $01                                   ; $4E35: $3E $01
    ld   [bc], a                                  ; $4E37: $02
    jr   .jr_01F_4E25                             ; $4E38: $18 $EB

.jr_01F_4E3A:
    ld   hl, Data_01F_4E50                        ; $4E3A: $21 $50 $4E
    ld   a, $01                                   ; $4E3D: $3E $01
    ld   [bc], a                                  ; $4E3F: $02
    call func_01F_7AB7                            ; $4E40: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4E43: $C3 $79 $7A

Data_01F_4E46::
    db   $FF, $FC, $00, $02

Data_01F_4E4A::
    db   $00, $00, $19, $EA, $87, $01

Data_01F_4E50::
    db   $00, $00, $47, $E0, $87, $01

BeginJingleHotHeadSplash::
    ld   hl, Data_01F_4E75                        ; $4E56: $21 $75 $4E
    jp   label_01F_5395                           ; $4E59: $C3 $95 $53

ContinueJingleHotHeadSplash::
    call DecrementValueAtDE                       ; $4E5C: $CD $71 $7A
    ret  nz                                       ; $4E5F: $C0

    call IncrementValueAtBC                       ; $4E60: $CD $75 $7A
    cp   $03                                      ; $4E63: $FE $03
    jp   z, label_01F_53B5                        ; $4E65: $CA $B5 $53

    ld   hl, Data_01F_4E71                        ; $4E68: $21 $71 $4E
    call GetHandlerAddressInTable                 ; $4E6B: $CD $64 $7A
    jp   WriteChannel1AndDE                       ; $4E6E: $C3 $79 $7A

Data_01F_4E71::
    dw   Data_01F_4E7B
    dw   Data_01F_4E81

Data_01F_4E75::
    db   $1F, $80, $85, $A0, $87, $0C

Data_01F_4E7B::
    db   $1F, $80, $47, $A0, $87, $0C

Data_01F_4E81::
    db   $1F, $8D, $20, $A0, $C7, $0C

BeginJingleBlainoPunch::
    ld   a, $02                                   ; $4E87: $3E $02
    ld   [$D3BC], a                               ; $4E89: $EA $BC $D3
    ld   hl, Data_01F_4EC4                        ; $4E8C: $21 $C4 $4E
    call func_01F_7AB7                            ; $4E8F: $CD $B7 $7A
    jp   label_01F_539A                           ; $4E92: $C3 $9A $53

ContinueJingleBlainoPunch::
    call DecrementValueAtDE                       ; $4E95: $CD $71 $7A
    ret  nz                                       ; $4E98: $C0

    ld   a, $08                                   ; $4E99: $3E $08
    ld   [de], a                                  ; $4E9B: $12
    call IncrementValueAtBC                       ; $4E9C: $CD $75 $7A
    cp   $04                                      ; $4E9F: $FE $04
    jr   z, .jr_01F_4EAD                          ; $4EA1: $28 $0A

    cp   $05                                      ; $4EA3: $FE $05
    jr   z, .jr_01F_4EB8                          ; $4EA5: $28 $11

.jr_01F_4EA7:
    ld   hl, Data_01F_4EBC                        ; $4EA7: $21 $BC $4E
    jp   func_01F_7AE1                            ; $4EAA: $C3 $E1 $7A

.jr_01F_4EAD:
    call func_01F_7A9A                            ; $4EAD: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4EB0: $CA $B5 $53

    ld   a, $04                                   ; $4EB3: $3E $04

.jr_01F_4EB5:
    ld   [bc], a                                  ; $4EB5: $02
    jr   .jr_01F_4EA7                             ; $4EB6: $18 $EF

.jr_01F_4EB8:
    ld   a, $01                                   ; $4EB8: $3E $01
    jr   .jr_01F_4EB5                             ; $4EBA: $18 $F9

Data_01F_4EBC::
    db   $00, $08, $FF, $FD, $00, $03, $FF, $F8

Data_01F_4EC4::
    db   $00, $00, $60, $D1, $87, $08

BeginJingleShowInstruments::
    ld   a, $0C                                   ; $4ECA: $3E $0C
    ld   [$D3BC], a                               ; $4ECC: $EA $BC $D3
    ld   hl, Data_01F_4F17                        ; $4ECF: $21 $17 $4F
    call func_01F_7AB7                            ; $4ED2: $CD $B7 $7A
    jp   label_01F_539A                           ; $4ED5: $C3 $9A $53

ContinueJingleShowInstruments::
    call IncrementValueAtBC                       ; $4ED8: $CD $75 $7A
    cp   $09                                      ; $4EDB: $FE $09
    jr   z, .jr_01F_4EE9                          ; $4EDD: $28 $0A

    cp   $0A                                      ; $4EDF: $FE $0A
    jr   z, .jr_01F_4F00                          ; $4EE1: $28 $1D

.jr_01F_4EE3:
    ld   hl, Data_01F_4F05                        ; $4EE3: $21 $05 $4F
    jp   func_01F_7AE1                            ; $4EE6: $C3 $E1 $7A

.jr_01F_4EE9:
    call func_01F_7A9A                            ; $4EE9: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4EEC: $CA $B5 $53

    cp   $09                                      ; $4EEF: $FE $09
    jr   z, .jr_01F_4EF5                          ; $4EF1: $28 $02

    jr   .jr_01F_4EE3                             ; $4EF3: $18 $EE

.jr_01F_4EF5:
    xor  a                                        ; $4EF5: $AF
    ld   [bc], a                                  ; $4EF6: $02
    ld   hl, Data_01F_4F1D                        ; $4EF7: $21 $1D $4F
    call func_01F_7AB7                            ; $4EFA: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4EFD: $C3 $79 $7A

.jr_01F_4F00:
    ld   a, $01                                   ; $4F00: $3E $01
    ld   [bc], a                                  ; $4F02: $02
    jr   .jr_01F_4EE3                             ; $4F03: $18 $DE

Data_01F_4F05::
    db   $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db   $FF, $FA

Data_01F_4F17::
    db   $00, $00, $1F, $D0, $87, $01

Data_01F_4F1D::
    db   $00, $00, $A7, $D8, $87, $01

BeginJingleShadowNext::
    ld   a, $05                                   ; $4F23: $3E $05
    ld   [$D3BC], a                               ; $4F25: $EA $BC $D3
    ld   hl, Data_01F_4F78                        ; $4F28: $21 $78 $4F
    call func_01F_7AB7                            ; $4F2B: $CD $B7 $7A
    jp   label_01F_539A                           ; $4F2E: $C3 $9A $53

ContinueJingleShadowNext::
    call DecrementValueAtDE                       ; $4F31: $CD $71 $7A
    ret  nz                                       ; $4F34: $C0

    ld   a, $02                                   ; $4F35: $3E $02
    ld   [de], a                                  ; $4F37: $12
    call IncrementValueAtBC                       ; $4F38: $CD $75 $7A
    cp   $09                                      ; $4F3B: $FE $09
    jr   z, .jr_01F_4F49                          ; $4F3D: $28 $0A

    cp   $0A                                      ; $4F3F: $FE $0A
    jr   z, .jr_01F_4F56                          ; $4F41: $28 $13

.jr_01F_4F43:
    ld   hl, Data_01F_4F66                        ; $4F43: $21 $66 $4F
    jp   func_01F_7AE1                            ; $4F46: $C3 $E1 $7A

.jr_01F_4F49:
    call func_01F_7A9A                            ; $4F49: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $4F4C: $CA $B5 $53

    cp   $03                                      ; $4F4F: $FE $03
    jr   z, .jr_01F_4F5B                          ; $4F51: $28 $08

    ld   a, [bc]                                  ; $4F53: $0A
    jr   .jr_01F_4F43                             ; $4F54: $18 $ED

.jr_01F_4F56:
    ld   a, $01                                   ; $4F56: $3E $01
    ld   [bc], a                                  ; $4F58: $02
    jr   .jr_01F_4F43                             ; $4F59: $18 $E8

.jr_01F_4F5B:
    xor  a                                        ; $4F5B: $AF
    ld   [bc], a                                  ; $4F5C: $02
    ld   hl, Data_01F_4F7E                        ; $4F5D: $21 $7E $4F
    call func_01F_7AB7                            ; $4F60: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $4F63: $C3 $79 $7A

Data_01F_4F66::
    db   $00, $10, $00, $10, $00, $10, $00, $10, $00, $0C, $00, $08, $00, $04, $00, $02
    db   $FF, $A2

Data_01F_4F78::
    db   $00, $80, $1F, $A0, $86, $02

Data_01F_4F7E::
    db   $00, $80, $87, $A0, $86, $02

BeginJingleShadow2Defeat::
    ld   a, $0B                                   ; $4F84: $3E $0B
    ld   [$D3BC], a                               ; $4F86: $EA $BC $D3
    ld   hl, Data_01F_4FEF                        ; $4F89: $21 $EF $4F
    call func_01F_7AB7                            ; $4F8C: $CD $B7 $7A
    jp   label_01F_539A                           ; $4F8F: $C3 $9A $53

ContinueJingleShadow2Defeat::
    call func_01F_7A9A                            ; $4F92: $CD $9A $7A
    jr   z, .jr_01F_4FBB                          ; $4F95: $28 $24

.jr_01F_4F97:
    ld   a, [$D3E2]                               ; $4F97: $FA $E2 $D3
    cp   $0D                                      ; $4F9A: $FE $0D
    jr   nc, .jr_01F_4FAF                         ; $4F9C: $30 $11

    and  $01                                      ; $4F9E: $E6 $01
    jr   nz, .jr_01F_4FAB                         ; $4FA0: $20 $09

    ld   a, $01                                   ; $4FA2: $3E $01

.jr_01F_4FA4:
    ld   [bc], a                                  ; $4FA4: $02
    ld   hl, Data_01F_4FE7                        ; $4FA5: $21 $E7 $4F
    jp   func_01F_7AE1                            ; $4FA8: $C3 $E1 $7A

.jr_01F_4FAB:
    ld   a, $02                                   ; $4FAB: $3E $02
    jr   .jr_01F_4FA4                             ; $4FAD: $18 $F5

.jr_01F_4FAF:
    and  $01                                      ; $4FAF: $E6 $01
    jr   nz, .jr_01F_4FB7                         ; $4FB1: $20 $04

    ld   a, $03                                   ; $4FB3: $3E $03
    jr   .jr_01F_4FA4                             ; $4FB5: $18 $ED

.jr_01F_4FB7:
    ld   a, $04                                   ; $4FB7: $3E $04
    jr   .jr_01F_4FA4                             ; $4FB9: $18 $E9

.jr_01F_4FBB:
    push bc                                       ; $4FBB: $C5
    ld   bc, $D3E2                                ; $4FBC: $01 $E2 $D3
    call IncrementValueAtBC                       ; $4FBF: $CD $75 $7A
    pop  bc                                       ; $4FC2: $C1
    cp   $05                                      ; $4FC3: $FE $05
    jr   z, .jr_01F_4FDB                          ; $4FC5: $28 $14

    cp   $22                                      ; $4FC7: $FE $22
    jp   z, label_01F_53B5                        ; $4FC9: $CA $B5 $53

    cp   $11                                      ; $4FCC: $FE $11
    jr   nc, .jr_01F_4FE3                         ; $4FCE: $30 $13

.jr_01F_4FD0:
    sra  a                                        ; $4FD0: $CB $2F
    ld   e, a                                     ; $4FD2: $5F
    ld   a, $0B                                   ; $4FD3: $3E $0B
    sub  e                                        ; $4FD5: $93
    ld   [$D3BC], a                               ; $4FD6: $EA $BC $D3
    jr   .jr_01F_4F97                             ; $4FD9: $18 $BC

.jr_01F_4FDB:
    ld   a, $A0                                   ; $4FDB: $3E $A0
    ldh  [rNR12], a                               ; $4FDD: $E0 $12
    ld   a, $05                                   ; $4FDF: $3E $05
    jr   .jr_01F_4FD0                             ; $4FE1: $18 $ED

.jr_01F_4FE3:
    ld   a, $11                                   ; $4FE3: $3E $11
    jr   .jr_01F_4FD0                             ; $4FE5: $18 $E9

Data_01F_4FE7::
    db   $00, $20, $FF, $E8, $00, $1C, $FF, $F0

Data_01F_4FEF::
    db   $00, $40, $1F, $80, $83, $01

BeginJingleShadow1Hurt::
    ld   a, $10                                   ; $4FF5: $3E $10
    ld   [$D3BC], a                               ; $4FF7: $EA $BC $D3
    ld   hl, Data_01F_5036                        ; $4FFA: $21 $36 $50
    call func_01F_7AB7                            ; $4FFD: $CD $B7 $7A

    jp   label_01F_5395                           ; $5000: $C3 $95 $53

ContinueJingleShadow1Hurt::
    call IncrementValueAtBC                       ; $5003: $CD $75 $7A
    cp   $09                                      ; $5006: $FE $09
    jr   z, .jr_01F_5014                          ; $5008: $28 $0A

    cp   $0A                                      ; $500A: $FE $0A
    jr   z, .jr_01F_501F                          ; $500C: $28 $11

.jr_01F_500E:
    ld   hl, Data_01F_5024                        ; $500E: $21 $24 $50
    jp   func_01F_7AE1                            ; $5011: $C3 $E1 $7A

.jr_01F_5014:
    call func_01F_7A9A                            ; $5014: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $5017: $CA $B5 $53

    ld   a, $09                                   ; $501A: $3E $09
    ld   [bc], a                                  ; $501C: $02
    jr   .jr_01F_500E                             ; $501D: $18 $EF

.jr_01F_501F:
    ld   a, $01                                   ; $501F: $3E $01
    ld   [bc], a                                  ; $5021: $02
    jr   .jr_01F_500E                             ; $5022: $18 $EA

Data_01F_5024::
    db   $00, $40, $00, $30, $00, $20, $FF, $E0, $FF, $D0, $FF, $C0, $FF, $A0, $FF, $80
    db   $00, $D0

Data_01F_5036::
    db   $00, $80, $80, $00, $86, $01

BeginJingleShadow3BG::
    ld   a, [$D361]                               ; $503C: $FA $61 $D3
    and  a                                        ; $503F: $A7
    jp   nz, label_01F_53E6                       ; $5040: $C2 $E6 $53

    ld   a, [$D3D6]                               ; $5043: $FA $D6 $D3
    and  a                                        ; $5046: $A7
    jr   nz, .jr_01F_5052                         ; $5047: $20 $09

    ld   hl, Data_01F_5082                        ; $5049: $21 $82 $50

.jr_01F_504C:
    call func_01F_7AB7                            ; $504C: $CD $B7 $7A
    jp   label_01F_539A                           ; $504F: $C3 $9A $53

.jr_01F_5052:
    ld   hl, Data_01F_5088                        ; $5052: $21 $88 $50
    jr   .jr_01F_504C                             ; $5055: $18 $F5

ContinueJingleShadow3BG::
    call IncrementValueAtBC                       ; $5057: $CD $75 $7A
    cp   $0B                                      ; $505A: $FE $0B
    jr   z, .jr_01F_5064                          ; $505C: $28 $06

    ld   hl, Data_01F_506E                        ; $505E: $21 $6E $50
    jp   func_01F_7AE1                            ; $5061: $C3 $E1 $7A

.jr_01F_5064:
    ld   hl, wActiveJingle                        ; $5064: $21 $60 $D3
    ld   a, $38                                   ; $5067: $3E $38
    ld   [hl+], a                                 ; $5069: $22
    xor  a                                        ; $506A: $AF
    ld   [hl], a                                  ; $506B: $77
    jr   BeginJingleShadow3BG                     ; $506C: $18 $CE

Data_01F_506E::
    db   $00, $C0, $00, $90, $00, $60, $00, $30, $00, $18, $FF, $E8, $FF, $D0, $FF, $A0
    db   $FF, $70, $FF, $40

Data_01F_5082::
    db   $00, $80, $A0, $00, $82, $01

Data_01F_5088::
    db   $00, $80, $C0, $00, $83, $01

BeginJingleShadow4Intro::
    ld   a, $04                                   ; $508E: $3E $04
    ld   [$D3BC], a                               ; $5090: $EA $BC $D3
    ld   hl, Data_01F_5114                        ; $5093: $21 $14 $51
    call func_01F_7AB7                            ; $5096: $CD $B7 $7A
    jp   label_01F_5395                           ; $5099: $C3 $95 $53

ContinueJingleShadow4Intro::
    call IncrementValueAtBC                       ; $509C: $CD $75 $7A
    cp   $0E                                      ; $509F: $FE $0E
    jr   z, .jr_01F_50BA                          ; $50A1: $28 $17

    cp   $0F                                      ; $50A3: $FE $0F
    jr   z, .jr_01F_50C5                          ; $50A5: $28 $1E

.jr_01F_50A7:
    ld   a, [$D3BC]                               ; $50A7: $FA $BC $D3
    cp   $03                                      ; $50AA: $FE $03
    jr   c, .jr_01F_50B4                          ; $50AC: $38 $06

    ld   hl, Data_01F_50DC                        ; $50AE: $21 $DC $50
    jp   func_01F_7AE1                            ; $50B1: $C3 $E1 $7A

.jr_01F_50B4:
    ld   hl, Data_01F_50F8                        ; $50B4: $21 $F8 $50
    jp   func_01F_7AE1                            ; $50B7: $C3 $E1 $7A

.jr_01F_50BA:
    call func_01F_7A9A                            ; $50BA: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $50BD: $CA $B5 $53

    ld   a, $0E                                   ; $50C0: $3E $0E
    ld   [bc], a                                  ; $50C2: $02
    jr   .jr_01F_50A7                             ; $50C3: $18 $E2

.jr_01F_50C5:
    ld   a, [$D3BC]                               ; $50C5: $FA $BC $D3
    cp   $01                                      ; $50C8: $FE $01
    jr   z, .jr_01F_50D1                          ; $50CA: $28 $05

    ld   a, $01                                   ; $50CC: $3E $01
    ld   [bc], a                                  ; $50CE: $02
    jr   .jr_01F_50A7                             ; $50CF: $18 $D6

.jr_01F_50D1:
    xor  a                                        ; $50D1: $AF
    ld   [bc], a                                  ; $50D2: $02
    ld   hl, Data_01F_511A                        ; $50D3: $21 $1A $51
    call func_01F_7AB7                            ; $50D6: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $50D9: $C3 $79 $7A

Data_01F_50DC::
    db   $00, $C0, $00, $A0, $00, $80, $00, $60, $00, $40, $00, $20, $FF, $E0, $FF, $E0
    db   $FF, $D0, $FF, $D0, $FF, $C0, $FF, $C0, $FF, $B0, $FF, $B0

Data_01F_50F8::
    db   $00, $60, $00, $50, $00, $40, $00, $30, $00, $20, $00, $10, $FF, $F0, $FF, $F0
    db   $FF, $F0, $FF, $F0, $FF, $E0, $FF, $E0, $FF, $D0, $FF, $D0

Data_01F_5114::
    db   $00, $40, $4D, $80, $83, $01

Data_01F_511A::
    db   $00, $80, $20, $C0, $84, $01

BeginJingleUnknown3A::
    ld   a, $04                                   ; $5120: $3E $04
    ld   [$D3BC], a                               ; $5122: $EA $BC $D3
    ld   hl, Data_01F_5161                        ; $5125: $21 $61 $51
    call func_01F_7AB7                            ; $5128: $CD $B7 $7A
    jp   label_01F_539A                           ; $512B: $C3 $9A $53

ContinueJingleUnknown3A::
    call IncrementValueAtBC                       ; $512E: $CD $75 $7A
    cp   $09                                      ; $5131: $FE $09
    jr   z, .jr_01F_513F                          ; $5133: $28 $0A

    cp   $0A                                      ; $5135: $FE $0A
    jr   z, .jr_01F_514A                          ; $5137: $28 $11

.jr_01F_5139:
    ld   hl, Data_01F_514F                        ; $5139: $21 $4F $51
    jp   func_01F_7AE1                            ; $513C: $C3 $E1 $7A

.jr_01F_513F:
    call func_01F_7A9A                            ; $513F: $CD $9A $7A
    jp   z, func_01F_53BB                         ; $5142: $CA $BB $53

    ld   a, $09                                   ; $5145: $3E $09
    ld   [bc], a                                  ; $5147: $02
    jr   .jr_01F_5139                             ; $5148: $18 $EF

.jr_01F_514A:
    ld   a, $01                                   ; $514A: $3E $01
    ld   [bc], a                                  ; $514C: $02
    jr   .jr_01F_5139                             ; $514D: $18 $EA

Data_01F_514F::
    db   $00, $12, $00, $0E, $00, $0A, $00, $08, $00, $06, $00, $04, $00, $02, $00, $01
    db   $FF, $C1

Data_01F_5161::
    db   $00, $00, $A4, $00, $87, $01

BeginJingleSwordBeam::
    ld   a, $05                                   ; $5167: $3E $05
    ld   [$D3BC], a                               ; $5169: $EA $BC $D3
    ld   hl, Data_01F_51AE                        ; $516C: $21 $AE $51
    call func_01F_7AB7                            ; $516F: $CD $B7 $7A
    jp   label_01F_539A                           ; $5172: $C3 $9A $53

ContinueJingleSwordBeam::
    call IncrementValueAtBC                       ; $5175: $CD $75 $7A
    cp   $0C                                      ; $5178: $FE $0C
    jr   z, .jr_01F_518B                          ; $517A: $28 $0F

    cp   $0D                                      ; $517C: $FE $0D
    jr   z, .jr_01F_5186                          ; $517E: $28 $06

.jr_01F_5180:
    ld   hl, Data_01F_5196                        ; $5180: $21 $96 $51
    jp   func_01F_7AE1                            ; $5183: $C3 $E1 $7A

.jr_01F_5186:
    ld   a, $01                                   ; $5186: $3E $01
    ld   [bc], a                                  ; $5188: $02
    jr   .jr_01F_5180                             ; $5189: $18 $F5

.jr_01F_518B:
    call func_01F_7A9A                            ; $518B: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $518E: $CA $B5 $53

    ld   a, $0C                                   ; $5191: $3E $0C
    ld   [bc], a                                  ; $5193: $02
    jr   .jr_01F_5180                             ; $5194: $18 $EA

Data_01F_5196::
    db   $FF, $C0, $FF, $A0, $00, $80, $FF, $C0, $FF, $A0, $00, $80, $FF, $C0, $FF, $A0
    db   $00, $80, $FF, $C0, $FF, $A0, $01, $00

Data_01F_51AE::
    db   $00, $00, $87, $80, $87, $01

BeginJingleEnemyShriek::
    ld   a, $02                                   ; $51B4: $3E $02
    ld   [$D3BC], a                               ; $51B6: $EA $BC $D3
    ld   hl, Data_01F_51F0                        ; $51B9: $21 $F0 $51
    call func_01F_7AB7                            ; $51BC: $CD $B7 $7A
    jp   label_01F_539A                           ; $51BF: $C3 $9A $53

ContinueJingleEnemyShriek::
    call IncrementValueAtBC                       ; $51C2: $CD $75 $7A
    cp   $09                                      ; $51C5: $FE $09
    jr   z, .jr_01F_51CF                          ; $51C7: $28 $06

    ld   hl, Data_01F_51E0                        ; $51C9: $21 $E0 $51
    jp   func_01F_7AE1                            ; $51CC: $C3 $E1 $7A

.jr_01F_51CF:
    call func_01F_7A9A                            ; $51CF: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $51D2: $CA $B5 $53

    xor  a                                        ; $51D5: $AF
    ld   [bc], a                                  ; $51D6: $02
    ld   hl, Data_01F_51F6                        ; $51D7: $21 $F6 $51
    call func_01F_7AB7                            ; $51DA: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $51DD: $C3 $79 $7A

Data_01F_51E0::
    db   $00, $02, $00, $02, $00, $02, $00, $02, $00, $01, $00, $01, $00, $01, $00, $01

Data_01F_51F0::
    db   $00, $00, $60, $D0, $87, $02

Data_01F_51F6::
    db   $00, $40, $10, $D0, $87, $01

BeginJingleShadow6BG::
    ld   a, [$D361]                               ; $51FC: $FA $61 $D3
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
    ld   hl, Data_01F_5262                        ; $521D: $21 $62 $52
    call func_01F_7AB7                            ; $5220: $CD $B7 $7A
    jp   label_01F_539A                           ; $5223: $C3 $9A $53

ContinueJingleShadow6BG::
    call IncrementValueAtBC                       ; $5226: $CD $75 $7A
    cp   $04                                      ; $5229: $FE $04
    jr   z, .jr_01F_523C                          ; $522B: $28 $0F

    cp   $05                                      ; $522D: $FE $05
    jr   z, .jr_01F_5237                          ; $522F: $28 $06

.jr_01F_5231:
    ld   hl, Data_01F_525A                        ; $5231: $21 $5A $52
    jp   func_01F_7AE1                            ; $5234: $C3 $E1 $7A

.jr_01F_5237:
    ld   a, $01                                   ; $5237: $3E $01
    ld   [bc], a                                  ; $5239: $02
    jr   .jr_01F_5231                             ; $523A: $18 $F5

.jr_01F_523C:
    call func_01F_7A9A                            ; $523C: $CD $9A $7A
    jp   z, label_01F_5253                        ; $523F: $CA $53 $52

    cp   $07                                      ; $5242: $FE $07
    jr   z, .jr_01F_5248                          ; $5244: $28 $02

    jr   .jr_01F_5231                             ; $5246: $18 $E9

.jr_01F_5248:
    xor  a                                        ; $5248: $AF
    ld   [bc], a                                  ; $5249: $02
    ld   hl, Data_01F_5268                        ; $524A: $21 $68 $52
    call func_01F_7AB7                            ; $524D: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $5250: $C3 $79 $7A

label_01F_5253:
    ld   a, $3D                                   ; $5253: $3E $3D
    ld   [wActiveJingle], a                       ; $5255: $EA $60 $D3
    jr   BeginJingleShadow6BG                     ; $5258: $18 $A2

Data_01F_525A::
    db   $00, $C0, $00, $80, $00, $40, $FE, $80

Data_01F_5262::
    db   $00, $40, $19, $80, $83, $01

Data_01F_5268::
    db   $00, $40, $86, $80, $83, $01

BeginJingleUrchinPush::
    ld   a, [$D361]                               ; $526E: $FA $61 $D3
    cp   $3E                                      ; $5271: $FE $3E
    jp   z, label_01F_53E6                        ; $5273: $CA $E6 $53

    ld   hl, Data_01F_5283                        ; $5276: $21 $83 $52
    jp   label_01F_539A                           ; $5279: $C3 $9A $53

ContinueJingleUrchinPush::
    call DecrementValueAtDE                       ; $527C: $CD $71 $7A
    ret  nz                                       ; $527F: $C0

    jp   func_01F_53BB                            ; $5280: $C3 $BB $53

Data_01F_5283::
    db   $27, $BE, $60, $C0, $C7, $03

BeginJingleFlyingTile::
    ld   a, $09                                   ; $5289: $3E $09
    ld   [$D3BC], a                               ; $528B: $EA $BC $D3
    ld   hl, Data_01F_52CD                        ; $528E: $21 $CD $52
    call func_01F_7AB7                            ; $5291: $CD $B7 $7A
    jp   label_01F_539A                           ; $5294: $C3 $9A $53

ContinueJingleFlyingTile::
    call IncrementValueAtBC                       ; $5297: $CD $75 $7A
    cp   $03                                      ; $529A: $FE $03
    jr   z, .jr_01F_52A8                          ; $529C: $28 $0A

    cp   $04                                      ; $529E: $FE $04
    jr   z, .jr_01F_52B7                          ; $52A0: $28 $15

.jr_01F_52A2:
    ld   hl, Data_01F_52C7                        ; $52A2: $21 $C7 $52
    jp   func_01F_7AE1                            ; $52A5: $C3 $E1 $7A

.jr_01F_52A8:
    call func_01F_7A9A                            ; $52A8: $CD $9A $7A
    jp   z, label_01F_53B5                        ; $52AB: $CA $B5 $53

    cp   $06                                      ; $52AE: $FE $06
    jr   z, .jr_01F_52BC                          ; $52B0: $28 $0A

    ld   a, $03                                   ; $52B2: $3E $03
    ld   [bc], a                                  ; $52B4: $02
    jr   .jr_01F_52A2                             ; $52B5: $18 $EB

.jr_01F_52B7:
    ld   a, $01                                   ; $52B7: $3E $01
    ld   [bc], a                                  ; $52B9: $02
    jr   .jr_01F_52A2                             ; $52BA: $18 $E6

.jr_01F_52BC:
    xor  a                                        ; $52BC: $AF
    ld   [bc], a                                  ; $52BD: $02
    ld   hl, Data_01F_52D3                        ; $52BE: $21 $D3 $52
    call func_01F_7AB7                            ; $52C1: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $52C4: $C3 $79 $7A

Data_01F_52C7::
    db   $00, $60, $00, $40, $FF, $70

Data_01F_52CD::
    db   $00, $80, $19, $00, $86, $01

Data_01F_52D3::
    db   $00, $80, $D1, $10, $86, $01

BeginJingleFacadeHole::
    ld   a, $04                                   ; $52D9: $3E $04
    ld   [$D3BC], a                               ; $52DB: $EA $BC $D3
    ld   hl, Data_01F_532B                        ; $52DE: $21 $2B $53
    call func_01F_7AB7                            ; $52E1: $CD $B7 $7A
    jp   label_01F_539A                           ; $52E4: $C3 $9A $53

ContinueJingleFacadeHole::
    call func_01F_7A9A                            ; $52E7: $CD $9A $7A
    jr   z, .jr_01F_5300                          ; $52EA: $28 $14

.jr_01F_52EC:
    ld   a, [$D3E2]                               ; $52EC: $FA $E2 $D3
    cp   $06                                      ; $52EF: $FE $06
    jr   nc, .jr_01F_52FC                         ; $52F1: $30 $09

    ld   a, $01                                   ; $52F3: $3E $01

.jr_01F_52F5:
    ld   [bc], a                                  ; $52F5: $02
    ld   hl, Data_01F_5327                        ; $52F6: $21 $27 $53
    jp   func_01F_7AE1                            ; $52F9: $C3 $E1 $7A

.jr_01F_52FC:
    ld   a, $02                                   ; $52FC: $3E $02
    jr   .jr_01F_52F5                             ; $52FE: $18 $F5

.jr_01F_5300:
    push bc                                       ; $5300: $C5
    ld   bc, $D3E2                                ; $5301: $01 $E2 $D3
    call IncrementValueAtBC                       ; $5304: $CD $75 $7A
    pop  bc                                       ; $5307: $C1
    cp   $14                                      ; $5308: $FE $14
    jp   z, func_01F_53BB                         ; $530A: $CA $BB $53

    cp   $06                                      ; $530D: $FE $06
    jp   z, .label_01F_5319                       ; $530F: $CA $19 $53

    ld   a, $04                                   ; $5312: $3E $04
    ld   [$D3BC], a                               ; $5314: $EA $BC $D3
    jr   .jr_01F_52EC                             ; $5317: $18 $D3

.label_01F_5319:
    ld   a, $04                                   ; $5319: $3E $04
    ld   [$D3BC], a                               ; $531B: $EA $BC $D3
    ld   hl, Data_01F_5331                        ; $531E: $21 $31 $53
    call func_01F_7AB7                            ; $5321: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $5324: $C3 $79 $7A

Data_01F_5327::
    db   $00, $10, $FF, $F8

Data_01F_532B::
    db   $00, $80, $1A, $80, $82, $01

Data_01F_5331::
    db   $00, $80, $E5, $10, $84, $01

BeginJingleUnknown41::
    ld   hl, Data_01F_5360                        ; $5337: $21 $60 $53
    jp   label_01F_5395                           ; $533A: $C3 $95 $53

ContinueJingleUnknown41::
    call DecrementValueAtDE                       ; $533D: $CD $71 $7A
    ret  nz                                       ; $5340: $C0

    call IncrementValueAtBC                       ; $5341: $CD $75 $7A
    cp   $08                                      ; $5344: $FE $08
    jp   z, func_01F_53BB                         ; $5346: $CA $BB $53

    ld   hl, Data_01F_5352                        ; $5349: $21 $52 $53
    call GetHandlerAddressInTable                 ; $534C: $CD $64 $7A
    jp   WriteChannel1AndDE                       ; $534F: $C3 $79 $7A

Data_01F_5352::
    dw    Data_01F_5378
    dw    Data_01F_5366
    dw    Data_01F_537E
    dw    Data_01F_536C
    dw    Data_01F_5384
    dw    Data_01F_5372
    dw    Data_01F_538A

Data_01F_5360::
    db   $00, $00, $C1, $7B, $87, $06

Data_01F_5366::
    db   $00, $00, $C1, $8A, $87, $06

Data_01F_536C::
    db   $00, $00, $C1, $90, $87, $07

Data_01F_5372::
    db   $00, $00, $C1, $B6, $87, $07

Data_01F_5378::
    db   $00, $00, $62, $7B, $87, $04

Data_01F_537E::
    db   $00, $00, $62, $8A, $87, $04

Data_01F_5384::
    db   $00, $00, $62, $90, $87, $04

Data_01F_538A::
    db   $00, $00, $62, $B6, $87, $04, $3E, $01, $EA, $A0, $D3

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
    jp   WriteChannel1AndDE                       ; $53B2: $C3 $79 $7A

label_01F_53B5:
    ld   hl, Data_01F_53D9                        ; $53B5: $21 $D9 $53
    call WriteChannel1AndDE                       ; $53B8: $CD $79 $7A

func_01F_53BB::
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

Data_01F_53D9::
    db   $00, $3F, $00, $00, $C1, $01

WriteChannel1FrequencyAndDE::
    ld   b, $02                                   ; $53DF: $06 $02
    ld   c, $13                                   ; $53E1: $0E $13
    jp   WriteIOAndDE                             ; $53E3: $C3 $91 $7A

label_01F_53E6:
    xor  a                                        ; $53E6: $AF
    ld   [wActiveJingle], a                       ; $53E7: $EA $60 $D3
    jp   PlayActiveJingle                         ; $53EA: $C3 $04 $42

PlayActiveWaveSfx::
    ld   hl, wActiveWaveSfx                       ; $53ED: $21 $70 $D3
    ld   a, [hl]                                  ; $53F0: $7E
    and  a                                        ; $53F1: $A7
    jr   z, .jr_01F_5405                          ; $53F2: $28 $11

    cp   $14                                      ; $53F4: $FE $14
    jr   z, .jr_01F_53FF                          ; $53F6: $28 $07

    ld   a, [$D3C8]                               ; $53F8: $FA $C8 $D3
    and  a                                        ; $53FB: $A7
    jp   nz, label_01F_6385                       ; $53FC: $C2 $85 $63

.jr_01F_53FF:
    ld   a, [hl]                                  ; $53FF: $7E
    ld   hl, WaveSfxHandlersTable1                ; $5400: $21 $1B $54
    jr   .jr_01F_540C                             ; $5403: $18 $07

.jr_01F_5405:
    inc  hl                                       ; $5405: $23
    ld   a, [hl]                                  ; $5406: $7E
    and  a                                        ; $5407: $A7
    ret  z                                        ; $5408: $C8

    ld   hl, WaveSfxHandlersTable2                ; $5409: $21 $61 $54

.jr_01F_540C:
    call GetHandlerAddressInTable                 ; $540C: $CD $64 $7A
    ld   de, $D392                                ; $540F: $11 $92 $D3
    ld   bc, $D396                                ; $5412: $01 $96 $D3
    ld   a, [$D3CD]                               ; $5415: $FA $CD $D3
    and  a                                        ; $5418: $A7
    ret  nz                                       ; $5419: $C0

    jp   hl                                       ; $541A: $E9

WaveSfxHandlersTable1::
    dw   func_01F_54A7
    dw   func_01F_54F3
    dw   func_01F_5538
    dw   func_01F_5564
    dw   func_01F_55B3
    dw   func_01F_55F9
    dw   func_01F_5645
    dw   func_01F_56D1
    dw   func_01F_5732
    dw   func_01F_57FE
    dw   func_01F_58A3
    dw   func_01F_5949
    dw   func_01F_5999
    dw   func_01F_59E1
    dw   func_01F_5A19
    dw   func_01F_5A44
    dw   func_01F_5B67
    dw   func_01F_5BC4
    dw   func_01F_5C0C
    dw   func_01F_5C80
    dw   func_01F_5CB0
    dw   func_01F_5CFC
    dw   func_01F_5D84
    dw   func_01F_5ED7
    dw   func_01F_5F19
    dw   func_01F_5F78
    dw   func_01F_5FC0
    dw   func_01F_601C
    dw   func_01F_606C
    dw   func_01F_606E
    dw   func_01F_60D4
    dw   func_01F_614D
    dw   func_01F_61A2
    dw   func_01F_621C
    dw   func_01F_627C

WaveSfxHandlersTable2::
    dw   func_01F_54B0
    dw   func_01F_5504
    dw   func_01F_554A
    dw   func_01F_5585
    dw   func_01F_55BC
    dw   func_01F_5610
    dw   func_01F_565E
    dw   func_01F_56E2
    dw   func_01F_5740
    dw   func_01F_580C
    dw   func_01F_58AF
    dw   func_01F_595A
    dw   func_01F_59AA
    dw   func_01F_59EA
    dw   func_01F_5A2A
    dw   func_01F_5A55
    dw   func_01F_5B78
    dw   func_01F_5BD5
    dw   func_01F_5C1D
    dw   func_01F_5C99
    dw   func_01F_5CB9
    dw   func_01F_5D1A
    dw   func_01F_5DA6
    dw   func_01F_5EE8
    dw   func_01F_5F25
    dw   func_01F_5F93
    dw   func_01F_5FC9
    dw   func_01F_602D
    dw   func_01F_606D
    dw   func_01F_6084
    dw   func_01F_60EF
    dw   func_01F_6163
    dw   func_01F_61CF
    dw   func_01F_6231
    dw   func_01F_6285

func_01F_54A7::
    call func_01F_636A                            ; $54A7: $CD $6A $63
    ld   hl, Data_01F_54CF                        ; $54AA: $21 $CF $54
    jp   label_01F_62F3                           ; $54AD: $C3 $F3 $62

func_01F_54B0::
    call DecrementValueAtDE                       ; $54B0: $CD $71 $7A
    ret  nz                                       ; $54B3: $C0

    call IncrementValueAtBC                       ; $54B4: $CD $75 $7A
    cp   $06                                      ; $54B7: $FE $06
    jp   z, label_01F_632D                        ; $54B9: $CA $2D $63

    ld   hl, Data_01F_54C5                        ; $54BC: $21 $C5 $54
    call GetHandlerAddressInTable                 ; $54BF: $CD $64 $7A
    jp   WriteChannel3AndDE                       ; $54C2: $C3 $85 $7A

Data_01F_54C5::
    dw   Data_01F_54D5
    dw   Data_01F_54DB
    dw   Data_01F_54E1
    dw   Data_01F_54E7
    dw   Data_01F_54ED

Data_01F_54CF::
    db   $80, $EE, $20, $CB, $C7, $05

Data_01F_54D5::
    db   $80, $EE, $20, $D1, $C7, $05

Data_01F_54DB::
    db   $80, $EE, $20, $D6, $C7, $05

Data_01F_54E1::
    db   $80, $EE, $20, $DD, $C7, $07

Data_01F_54E7::
    db   $80, $EE, $40, $DD, $C7, $07

Data_01F_54ED::
    db   $80, $EE, $60, $DD, $C7, $07

func_01F_54F3::
    ld   a, $0C                                   ; $54F3: $3E $0C
    ld   [$D3BE], a                               ; $54F5: $EA $BE $D3
    call func_01F_636F                            ; $54F8: $CD $6F $63
    ld   hl, Data_01F_5532                        ; $54FB: $21 $32 $55
    call func_01F_7ABD                            ; $54FE: $CD $BD $7A
    jp   label_01F_62F8                           ; $5501: $C3 $F8 $62

func_01F_5504::
    call IncrementValueAtBC                       ; $5504: $CD $75 $7A
    cp   $02                                      ; $5507: $FE $02
    jr   z, jr_01F_5516                           ; $5509: $28 $0B

    cp   $0A                                      ; $550B: $FE $0A
    jp   z, label_01F_6327                        ; $550D: $CA $27 $63

jr_01F_5510:
    ld   hl, Data_01F_5520                        ; $5510: $21 $20 $55
    jp   label_01F_7AEB                           ; $5513: $C3 $EB $7A

jr_01F_5516:
    call func_01F_7AA6                            ; $5516: $CD $A6 $7A
    jr   z, jr_01F_5510                           ; $5519: $28 $F5

    ld   a, $01                                   ; $551B: $3E $01
    ld   [bc], a                                  ; $551D: $02
    jr   jr_01F_5510                              ; $551E: $18 $F0

Data_01F_5520::
    db   $00, $10, $00, $40, $00, $40, $00, $30, $00, $30, $00, $20, $00, $10, $FF, $F0
    db   $FF, $E0

Data_01F_5532::
    db   $80, $00, $20, $80, $85, $02

func_01F_5538::
    ld   hl, Data_01F_63CC                        ; $5538: $21 $CC $63
    xor  a                                        ; $553B: $AF
    ldh  [rNR30], a                               ; $553C: $E0 $1A
    call WriteWavePattern                         ; $553E: $CD $47 $63
    ld   hl, Data_01F_555E                        ; $5541: $21 $5E $55
    call func_01F_7ABD                            ; $5544: $CD $BD $7A
    jp   label_01F_62F8                           ; $5547: $C3 $F8 $62

func_01F_554A::
    call IncrementValueAtBC                       ; $554A: $CD $75 $7A
    cp   $05                                      ; $554D: $FE $05
    jp   z, label_01F_632D                        ; $554F: $CA $2D $63

    ld   hl, Data_01F_5558                        ; $5552: $21 $58 $55
    jp   label_01F_7AEB                           ; $5555: $C3 $EB $7A

Data_01F_5558::
    db   $01, $80, $FF, $F0, $FF, $E0

Data_01F_555E::
    db   $80, $EF, $20, $00, $C6, $01

func_01F_5564::
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
    ld   hl, Data_01F_55A4                        ; $557F: $21 $A4 $55
    jp   label_01F_62F8                           ; $5582: $C3 $F8 $62

func_01F_5585::
    call DecrementValueAtDE                       ; $5585: $CD $71 $7A
    ret  nz                                       ; $5588: $C0

    call IncrementValueAtBC                       ; $5589: $CD $75 $7A
    cp   $02                                      ; $558C: $FE $02
    jr   z, jr_01F_5596                           ; $558E: $28 $06

    ld   hl, Data_01F_55AA                        ; $5590: $21 $AA $55
    jp   WriteChannel3FrequencyAndDE              ; $5593: $C3 $7E $63

jr_01F_5596:
    call func_01F_7AA6                            ; $5596: $CD $A6 $7A
    jp   z, label_01F_632D                        ; $5599: $CA $2D $63

    xor  a                                        ; $559C: $AF
    ld   [bc], a                                  ; $559D: $02
    ld   hl, Data_01F_55AD                        ; $559E: $21 $AD $55
    jp   WriteChannel3AndDE                       ; $55A1: $C3 $85 $7A

Data_01F_55A4::
    db   $80, $FA, $40, $C0, $C7, $04

Data_01F_55AA::
    db   $E0, $C7, $04

Data_01F_55AD::
    db   $80, $FA, $60, $C0, $C7, $04

func_01F_55B3::
    call func_01F_636A                            ; $55B3: $CD $6A $63
    ld   hl, Data_01F_55F0                        ; $55B6: $21 $F0 $55
    jp   label_01F_62F8                           ; $55B9: $C3 $F8 $62

func_01F_55BC::
    call DecrementValueAtDE                       ; $55BC: $CD $71 $7A
    ret  nz                                       ; $55BF: $C0

    call IncrementValueAtBC                       ; $55C0: $CD $75 $7A
    cp   $06                                      ; $55C3: $FE $06
    jp   z, label_01F_632D                        ; $55C5: $CA $2D $63

    cp   $02                                      ; $55C8: $FE $02
    jp   z, label_01F_55DB                        ; $55CA: $CA $DB $55

    cp   $04                                      ; $55CD: $FE $04
    jp   z, label_01F_55E2                        ; $55CF: $CA $E2 $55

jr_01F_55D2:
    ld   hl, Data_01F_55E6                        ; $55D2: $21 $E6 $55
    call GetHandlerAddressInTable                 ; $55D5: $CD $64 $7A
    jp   WriteChannel3FrequencyAndDE              ; $55D8: $C3 $7E $63

label_01F_55DB:
    ld   a, $40                                   ; $55DB: $3E $40

jr_01F_55DD:
    ldh  [rNR32], a                               ; $55DD: $E0 $1C
    ld   a, [bc]                                  ; $55DF: $0A
    jr   jr_01F_55D2                              ; $55E0: $18 $F0

label_01F_55E2:
    ld   a, $60                                   ; $55E2: $3E $60
    jr   jr_01F_55DD                              ; $55E4: $18 $F7

Data_01F_55E6::
    dw   Data_01F_55F6
    dw   Data_01F_55F3
    dw   Data_01F_55F6
    dw   Data_01F_55F3
    dw   Data_01F_55F6

Data_01F_55F0::
    db   $80, $FA, $20

Data_01F_55F3::
    db   $DA, $C7, $02

Data_01F_55F6::
    db   $EA, $C7, $02

func_01F_55F9::
    ld   a, [$D361]                               ; $55F9: $FA $61 $D3
    cp   $01                                      ; $55FC: $FE $01
    ret  z                                        ; $55FE: $C8

    ld   a, $0C                                   ; $55FF: $3E $0C
    ld   [$D3BE], a                               ; $5601: $EA $BE $D3
    call func_01F_6365                            ; $5604: $CD $65 $63
    ld   hl, Data_01F_5639                        ; $5607: $21 $39 $56
    call func_01F_7ABD                            ; $560A: $CD $BD $7A
    jp   label_01F_62F8                           ; $560D: $C3 $F8 $62

func_01F_5610::
    call IncrementValueAtBC                       ; $5610: $CD $75 $7A
    cp   $02                                      ; $5613: $FE $02
    jr   z, jr_01F_5628                           ; $5615: $28 $11

jr_01F_5617:
    ld   hl, Data_01F_5637                        ; $5617: $21 $37 $56
    jp   label_01F_7AEB                           ; $561A: $C3 $EB $7A

jr_01F_561D:
    xor  a                                        ; $561D: $AF
    ld   [bc], a                                  ; $561E: $02
    ld   hl, Data_01F_563F                        ; $561F: $21 $3F $56
    call func_01F_7ABD                            ; $5622: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5625: $C3 $85 $7A

jr_01F_5628:
    call func_01F_7AA6                            ; $5628: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $562B: $CA $27 $63

    cp   $07                                      ; $562E: $FE $07
    jr   z, jr_01F_561D                           ; $5630: $28 $EB

    ld   a, $01                                   ; $5632: $3E $01
    ld   [bc], a                                  ; $5634: $02
    jr   jr_01F_5617                              ; $5635: $18 $E0

Data_01F_5637::
    db   $00, $03

Data_01F_5639::
    db   $80, $D2, $40, $E0, $87, $01

Data_01F_563F::
    db   $80, $D2, $60, $E0, $87, $01

func_01F_5645::
    ld   a, [$D371]                               ; $5645: $FA $71 $D3
    cp   $03                                      ; $5648: $FE $03
    jp   z, label_01F_6385                        ; $564A: $CA $85 $63

    ld   a, $02                                   ; $564D: $3E $02
    ld   [$D3BE], a                               ; $564F: $EA $BE $D3
    call func_01F_6365                            ; $5652: $CD $65 $63
    ld   hl, Data_01F_56C5                        ; $5655: $21 $C5 $56
    call func_01F_7ABD                            ; $5658: $CD $BD $7A
    jp   label_01F_62F8                           ; $565B: $C3 $F8 $62

func_01F_565E::
    call DecrementValueAtDE                       ; $565E: $CD $71 $7A
    ret  nz                                       ; $5661: $C0

    ld   a, $01                                   ; $5662: $3E $01
    ld   [de], a                                  ; $5664: $12
    call IncrementValueAtBC                       ; $5665: $CD $75 $7A
    cp   $1D                                      ; $5668: $FE $1D
    jr   z, jr_01F_5676                           ; $566A: $28 $0A

    cp   $15                                      ; $566C: $FE $15
    jr   nc, jr_01F_5688                          ; $566E: $30 $18

jr_01F_5670:
    ld   hl, Data_01F_568D                        ; $5670: $21 $8D $56
    jp   label_01F_7AEB                           ; $5673: $C3 $EB $7A

jr_01F_5676:
    call func_01F_7AA6                            ; $5676: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5679: $CA $27 $63

    ld   a, $14                                   ; $567C: $3E $14
    ld   [bc], a                                  ; $567E: $02
    ld   hl, Data_01F_56CB                        ; $567F: $21 $CB $56
    call func_01F_7ABD                            ; $5682: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5685: $C3 $85 $7A

jr_01F_5688:
    ld   a, $02                                   ; $5688: $3E $02
    ld   [de], a                                  ; $568A: $12
    jr   jr_01F_5670                              ; $568B: $18 $E3

Data_01F_568D::
    db   $00, $40, $00, $40, $00, $40, $01, $00, $00, $20, $FF, $E0, $00, $40, $FF, $C0
    db   $00, $60, $FF, $A0, $00, $80, $FF, $80, $00, $A0, $FF, $60, $00, $C0, $FF, $40
    db   $01, $00, $FF, $00, $01, $00, $FF, $00, $FF, $E0, $FF, $C0, $FF, $A0, $FF, $80
    db   $FF, $60, $FF, $40, $FF, $20, $FF, $00

Data_01F_56C5::
    db   $80, $00, $20, $40, $84, $02

Data_01F_56CB::
    db   $80, $00, $60, $00, $86, $02

func_01F_56D1::
    ld   a, $08                                   ; $56D1: $3E $08
    ld   [$D3BE], a                               ; $56D3: $EA $BE $D3
    call func_01F_6379                            ; $56D6: $CD $79 $63
    ld   hl, Data_01F_5716                        ; $56D9: $21 $16 $57
    call func_01F_7ABD                            ; $56DC: $CD $BD $7A
    jp   label_01F_62F3                           ; $56DF: $C3 $F3 $62

func_01F_56E2::
    call IncrementValueAtBC                       ; $56E2: $CD $75 $7A
    cp   $0F                                      ; $56E5: $FE $0F
    jr   z, jr_01F_56EF                           ; $56E7: $28 $06

jr_01F_56E9:
    ld   hl, Data_01F_56FA                        ; $56E9: $21 $FA $56
    jp   label_01F_7AEB                           ; $56EC: $C3 $EB $7A

jr_01F_56EF:
    call func_01F_7AA6                            ; $56EF: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $56F2: $CA $27 $63

    ld   a, $01                                   ; $56F5: $3E $01
    ld   [bc], a                                  ; $56F7: $02
    jr   jr_01F_56E9                              ; $56F8: $18 $EF

Data_01F_56FA::
    db   $00, $0A, $00, $06, $FF, $F0, $00, $20, $00, $0A, $00, $06, $FF, $FA, $FF, $F6
    db   $00, $20, $00, $0A, $00, $06, $FF, $FA, $FF, $F6, $FF, $A8

Data_01F_5716::
    db   $80, $00, $20, $60, $87, $00

Data_01F_571C::
    db   $8A, $DF, $FD, $A8, $87, $42, $24, $78, $8A, $DF, $FD, $A8, $87, $42, $24, $78

func_01F_572C::
    ld   hl, Data_01F_571C                        ; $572C: $21 $1C $57
    jp   func_01F_635A                            ; $572F: $C3 $5A $63

func_01F_5732::
    ld   hl, $D32F                                ; $5732: $21 $2F $D3
    set  7, [hl]                                  ; $5735: $CB $FE
    call func_01F_572C                            ; $5737: $CD $2C $57
    ld   hl, Data_01F_5790                        ; $573A: $21 $90 $57
    jp   label_01F_62F3                           ; $573D: $C3 $F3 $62

func_01F_5740::
    call DecrementValueAtDE                       ; $5740: $CD $71 $7A

jr_01F_5743:
    ret  nz                                       ; $5743: $C0

    call IncrementValueAtBC                       ; $5744: $CD $75 $7A
    cp   $14                                      ; $5747: $FE $14
    jr   z, label_01F_575C                        ; $5749: $28 $11

    ld   hl, Data_01F_576A                        ; $574B: $21 $6A $57
    call GetHandlerAddressInTable                 ; $574E: $CD $64 $7A

label_01F_5751:
    ld   a, [$D396]                               ; $5751: $FA $96 $D3
    and  $01                                      ; $5754: $E6 $01
    jp   nz, WriteChannel2AndDE                   ; $5756: $C2 $7F $7A

    jp   WriteChannel3AndDE                       ; $5759: $C3 $85 $7A

label_01F_575C:
    ld   hl, Data_01F_431D                        ; $575C: $21 $1D $43
    call WriteChannel2AndDE                       ; $575F: $CD $7F $7A
    ld   hl, $D32F                                ; $5762: $21 $2F $D3
    res  7, [hl]                                  ; $5765: $CB $BE
    jp   label_01F_6327                           ; $5767: $C3 $27 $63

Data_01F_576A::
    dw   Data_01F_57CC
    dw   Data_01F_5796
    dw   Data_01F_57D1
    dw   Data_01F_579C
    dw   Data_01F_57D6
    dw   Data_01F_57A2
    dw   Data_01F_57DB
    dw   Data_01F_57A8
    dw   Data_01F_57E0
    dw   Data_01F_57AE
    dw   Data_01F_57E5
    dw   Data_01F_57B4
    dw   Data_01F_57EA
    dw   Data_01F_57BA
    dw   Data_01F_57EF
    dw   Data_01F_57C0
    dw   Data_01F_57F4
    dw   Data_01F_57C6
    dw   Data_01F_57F9

Data_01F_5790::
    db   $80, $E6, $20, $8A, $C7, $08

Data_01F_5796::
    db   $80, $E6, $20, $97, $C7, $08

Data_01F_579C::
    db   $80, $60, $20, $9C, $C7, $08

Data_01F_57A2::
    db   $80, $E6, $20, $8A, $C7, $08

Data_01F_57A8::
    db   $80, $E6, $20, $97, $C7, $08

Data_01F_57AE::
    db   $80, $E6, $20, $9C, $C7, $08

Data_01F_57B4::
    db   $80, $E6, $20, $97, $C7, $08

Data_01F_57BA::
    db   $80, $E6, $20, $8A, $C7, $08

Data_01F_57C0::
    db   $80, $E6, $20, $62, $C7, $08

Data_01F_57C6::
    db   $80, $00, $20, $79, $C7, $08

Data_01F_57CC::
    db   $80, $20, $8A, $87, $02

Data_01F_57D1::
    db   $80, $20, $97, $87, $02

Data_01F_57D6::
    db   $80, $20, $9C, $87, $34

Data_01F_57DB::
    db   $80, $20, $8A, $87, $02

Data_01F_57E0::
    db   $80, $20, $97, $87, $02

Data_01F_57E5::
    db   $80, $20, $9C, $87, $02

Data_01F_57EA::
    db   $80, $20, $97, $87, $02

Data_01F_57EF::
    db   $80, $20, $8A, $87, $02

Data_01F_57F4::
    db   $80, $20, $62, $87, $02

Data_01F_57F9::
    db   $80, $20, $79, $87, $48

func_01F_57FE::
    ld   hl, $D32F                                ; $57FE: $21 $2F $D3
    set  7, [hl]                                  ; $5801: $CB $FE
    call func_01F_572C                            ; $5803: $CD $2C $57
    ld   hl, Data_01F_584B                        ; $5806: $21 $4B $58
    jp   label_01F_62F3                           ; $5809: $C3 $F3 $62

func_01F_580C::
    call DecrementValueAtDE                       ; $580C: $CD $71 $7A
    ret  nz                                       ; $580F: $C0

    call IncrementValueAtBC                       ; $5810: $CD $75 $7A
    cp   $16                                      ; $5813: $FE $16
    jp   z, label_01F_575C                        ; $5815: $CA $5C $57

    ld   hl, Data_01F_5821                        ; $5818: $21 $21 $58
    call GetHandlerAddressInTable                 ; $581B: $CD $64 $7A
    jp   label_01F_5751                           ; $581E: $C3 $51 $57

Data_01F_5821::
    dw   Data_01F_587B
    dw   Data_01F_5851
    dw   Data_01F_5880
    dw   Data_01F_5857
    dw   Data_01F_5885
    dw   Data_01F_585D
    dw   Data_01F_588A
    dw   Data_01F_5863
    dw   Data_01F_588F
    dw   Data_01F_5869
    dw   Data_01F_5894
    dw   Data_01F_586F
    dw   Data_01F_5899
    dw   Data_01F_585D
    dw   Data_01F_588A
    dw   Data_01F_5857
    dw   Data_01F_5885
    dw   Data_01F_5851
    dw   Data_01F_5880
    dw   Data_01F_5875
    dw   Data_01F_589E

Data_01F_584B::
    db   $80, $E0, $20, $9D, $C7, $04

Data_01F_5851::
    db   $80, $E0, $20, $A7, $C7, $04

Data_01F_5857::
    db   $80, $E0, $20, $B0, $C7, $04

Data_01F_585D::
    db   $80, $E0, $20, $B6, $C7, $04

Data_01F_5863::
    db   $80, $90, $20, $BD, $C7, $04

Data_01F_5869::
    db   $80, $E0, $20, $C4, $C7, $04

Data_01F_586F::
    db   $80, $E0, $20, $BD, $C7, $04

Data_01F_5875::
    db   $80, $80, $20, $9D, $C7, $04

Data_01F_587B::
    db   $80, $20, $9D, $87, $07

Data_01F_5880::
    db   $80, $20, $A7, $87, $07

Data_01F_5885::
    db   $80, $20, $B0, $87, $07

Data_01F_588A::
    db   $80, $20, $B6, $87, $07

Data_01F_588F::
    db   $80, $20, $BD, $87, $23

Data_01F_5894::
    db   $80, $20, $C4, $87, $07

Data_01F_5899::
    db   $80, $20, $BD, $87, $07

Data_01F_589E::
    db   $80, $20, $9D, $87, $35

func_01F_58A3::
    call func_01F_7B5C                            ; $58A3: $CD $5C $7B
    call func_01F_572C                            ; $58A6: $CD $2C $57
    ld   hl, Data_01F_584B                        ; $58A9: $21 $4B $58
    jp   label_01F_62F3                           ; $58AC: $C3 $F3 $62

func_01F_58AF::
    call DecrementValueAtDE                       ; $58AF: $CD $71 $7A
    ret  nz                                       ; $58B2: $C0

    call IncrementValueAtBC                       ; $58B3: $CD $75 $7A
    cp   $12                                      ; $58B6: $FE $12
    jp   z, label_01F_575C                        ; $58B8: $CA $5C $57

    ld   hl, Data_01F_58C4                        ; $58BB: $21 $C4 $58
    call GetHandlerAddressInTable                 ; $58BE: $CD $64 $7A

jr_01F_58C1:
    jp   label_01F_5751                           ; $58C1: $C3 $51 $57

Data_01F_58C4::
    dw   Data_01F_591C
    dw   Data_01F_58EC
    dw   Data_01F_5921
    dw   Data_01F_58F2
    dw   Data_01F_5926
    dw   Data_01F_58F8
    dw   Data_01F_592B
    dw   Data_01F_58FE
    dw   Data_01F_5930
    dw   Data_01F_5904
    dw   Data_01F_5935
    dw   Data_01F_590A
    dw   Data_01F_593A
    dw   Data_01F_5910
    dw   Data_01F_593F
    dw   Data_01F_5916
    dw   Data_01F_5944

; Unused pattern
Data_01F_58E6::
    db   $80, $C0, $20, $9D, $C7, $04

Data_01F_58EC::
    db   $80, $F0, $20, $9D, $C7, $04

Data_01F_58F2::
    db   $80, $F0, $20, $7B, $C7, $04

Data_01F_58F8::
    db   $80, $F0, $20, $8E, $C7, $04

Data_01F_58FE::
    db   $80, $C0, $20, $A6, $C7, $04

Data_01F_5904::
    db   $80, $C0, $20, $9D, $C7, $04

Data_01F_590A::
    db   $80, $C0, $20, $BD, $C7, $04

Data_01F_5910::
    db   $80, $F0, $20, $BD, $C7, $04

Data_01F_5916::
    db   $80, $80, $20, $BD, $C7, $04

Data_01F_591C::
    db   $80, $20, $9D, $87, $14

Data_01F_5921::
    db   $80, $20, $9D, $87, $08

Data_01F_5926::
    db   $80, $20, $7B, $87, $08

Data_01F_592B::
    db   $80, $20, $8E, $87, $08

Data_01F_5930::
    db   $80, $20, $A6, $87, $14

Data_01F_5935::
    db   $80, $20, $9D, $87, $14

Data_01F_593A::
    db   $80, $20, $BD, $87, $14

Data_01F_593F::
    db   $80, $20, $BD, $87, $08

Data_01F_5944::
    db   $80, $20, $BD, $87, $2C

func_01F_5949::
    ld   a, $08                                   ; $5949: $3E $08
    ld   [$D3BE], a                               ; $594B: $EA $BE $D3
    call func_01F_636F                            ; $594E: $CD $6F $63
    ld   hl, Data_01F_598D                        ; $5951: $21 $8D $59
    call func_01F_7ABD                            ; $5954: $CD $BD $7A
    jp   label_01F_62F3                           ; $5957: $C3 $F3 $62

func_01F_595A::
    call IncrementValueAtBC                       ; $595A: $CD $75 $7A
    cp   $09                                      ; $595D: $FE $09
    jr   z, jr_01F_5967                           ; $595F: $28 $06

jr_01F_5961:
    ld   hl, Data_01F_597D                        ; $5961: $21 $7D $59
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

Data_01F_597D::
    db   $FF, $FE, $FF, $FC, $FF, $F8, $FF, $E8, $00, $14, $00, $02, $00, $04, $00, $06

Data_01F_598D::
    db   $80, $00, $40, $C0, $87, $01, $80, $00, $60, $C0, $87, $01

func_01F_5999::
    ld   a, $10                                   ; $5999: $3E $10
    ld   [$D3BE], a                               ; $599B: $EA $BE $D3
    call func_01F_6360                            ; $599E: $CD $60 $63
    ld   hl, Data_01F_59D5                        ; $59A1: $21 $D5 $59
    call func_01F_7ABD                            ; $59A4: $CD $BD $7A
    jp   label_01F_62F8                           ; $59A7: $C3 $F8 $62

func_01F_59AA::
    call IncrementValueAtBC                       ; $59AA: $CD $75 $7A
    cp   $03                                      ; $59AD: $FE $03
    jr   z, jr_01F_59B7                           ; $59AF: $28 $06

jr_01F_59B1:
    ld   hl, Data_01F_59D1                        ; $59B1: $21 $D1 $59
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
    ld   hl, Data_01F_59DB                        ; $59C8: $21 $DB $59
    call func_01F_7ABD                            ; $59CB: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $59CE: $C3 $85 $7A

Data_01F_59D1::
    db   $FF, $A0, $00, $C0

Data_01F_59D5::
    db   $80, $00, $20, $70, $80, $02

Data_01F_59DB::
    db   $80, $00, $60, $70, $80, $02

func_01F_59E1::
    call func_01F_6360                            ; $59E1: $CD $60 $63
    ld   hl, Data_01F_5A07                        ; $59E4: $21 $07 $5A
    jp   label_01F_62F8                           ; $59E7: $C3 $F8 $62

func_01F_59EA::
    call DecrementValueAtDE                       ; $59EA: $CD $71 $7A
    ret  nz                                       ; $59ED: $C0

    call IncrementValueAtBC                       ; $59EE: $CD $75 $7A
    cp   $05                                      ; $59F1: $FE $05
    jp   z, label_01F_632D                        ; $59F3: $CA $2D $63

    ld   hl, Data_01F_59FF                        ; $59F6: $21 $FF $59
    call GetHandlerAddressInTable                 ; $59F9: $CD $64 $7A
    jp   WriteChannel3AndDE                       ; $59FC: $C3 $85 $7A

Data_01F_59FF::
    dw   Data_01F_5A0D
    dw   Data_01F_5A13
    dw   Data_01F_5A0D
    dw   Data_01F_5A07

Data_01F_5A07::
    db   $80, $FB, $20, $00, $C2, $03

Data_01F_5A0D::
    db   $80, $FD, $40, $80, $C3, $04

Data_01F_5A13::
    db   $80, $FD, $60, $00, $C4, $05

func_01F_5A19::
    ld   a, [$D371]                               ; $5A19: $FA $71 $D3
    cp   $0F                                      ; $5A1C: $FE $0F
    jp   z, label_01F_6385                        ; $5A1E: $CA $85 $63

    call func_01F_636F                            ; $5A21: $CD $6F $63
    ld   hl, Data_01F_5A38                        ; $5A24: $21 $38 $5A
    jp   label_01F_62F8                           ; $5A27: $C3 $F8 $62

func_01F_5A2A::
    call IncrementValueAtBC                       ; $5A2A: $CD $75 $7A
    cp   $02                                      ; $5A2D: $FE $02
    jp   z, label_01F_632D                        ; $5A2F: $CA $2D $63

    ld   hl, Data_01F_5A3E                        ; $5A32: $21 $3E $5A
    jp   WriteChannel3AndDE                       ; $5A35: $C3 $85 $7A

Data_01F_5A38::
    db   $80, $FB, $60, $D2, $C7, $01

Data_01F_5A3E::
    db   $80, $FB, $40, $D2, $C7, $02

func_01F_5A44::
    ld   a, $02                                   ; $5A44: $3E $02
    ld   [$D3BE], a                               ; $5A46: $EA $BE $D3

jr_01F_5A49:
    call func_01F_6365                            ; $5A49: $CD $65 $63
    ld   hl, Data_01F_5B5B                        ; $5A4C: $21 $5B $5B
    call func_01F_7ABD                            ; $5A4F: $CD $BD $7A
    jp   label_01F_62F3                           ; $5A52: $C3 $F3 $62

func_01F_5A55::
    call DecrementValueAtDE                       ; $5A55: $CD $71 $7A
    ret  nz                                       ; $5A58: $C0

    ld   a, $01                                   ; $5A59: $3E $01
    ld   [de], a                                  ; $5A5B: $12
    call IncrementValueAtBC                       ; $5A5C: $CD $75 $7A
    cp   $71                                      ; $5A5F: $FE $71
    jr   z, jr_01F_5A69                           ; $5A61: $28 $06

    ld   hl, Data_01F_5A7B                        ; $5A63: $21 $7B $5A
    jp   label_01F_7AEB                           ; $5A66: $C3 $EB $7A

jr_01F_5A69:
    call func_01F_7AA6                            ; $5A69: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5A6C: $CA $27 $63

    ld   a, $60                                   ; $5A6F: $3E $60
    ld   [bc], a                                  ; $5A71: $02
    ld   hl, Data_01F_5B61                        ; $5A72: $21 $61 $5B
    call func_01F_7ABD                            ; $5A75: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5A78: $C3 $85 $7A

Data_01F_5A7B::
    db   $00, $B0, $00, $B0, $00, $B0, $00, $B0, $00, $60, $00, $60, $00, $60, $00, $60
    db   $00, $20, $FF, $E0, $00, $40, $FF, $C0, $00, $60, $FF, $A0, $00, $80, $FF, $80
    db   $00, $A0, $FF, $60, $00, $C0, $FF, $40, $00, $80, $FF, $88, $00, $80, $FF, $88
    db   $00, $90, $FF, $78, $00, $A0, $FF, $68, $00, $B0, $FF, $56, $00, $C0, $FF, $46
    db   $00, $C0, $FF, $44, $00, $C0, $FF, $44, $00, $C0, $FF, $43, $00, $C0, $FF, $43
    db   $00, $C0, $FF, $42, $00, $A0, $FF, $62, $00, $80, $FF, $82, $00, $80, $FF, $82
    db   $00, $80, $FF, $84, $00, $80, $FF, $84, $00, $80, $FF, $84, $00, $80, $FF, $84
    db   $00, $80, $FF, $B0, $00, $80, $FF, $B0, $00, $80, $FF, $80, $00, $80, $FF, $80
    db   $00, $80, $FF, $80, $00, $80, $FF, $80, $00, $80, $FF, $68, $00, $80, $FF, $68
    db   $00, $80, $FF, $68, $00, $80, $FF, $68, $00, $80, $FF, $78, $00, $80, $FF, $78
    db   $00, $A0, $FF, $40, $00, $A0, $FF, $40, $00, $A0, $FF, $40, $00, $A0, $FF, $40
    db   $00, $A0, $FF, $40, $00, $A0, $FF, $40, $00, $A0, $FF, $40, $00, $A0, $FF, $40
    db   $00, $A0, $FF, $40, $00, $A0, $FF, $40, $00, $A0, $FF, $00, $00, $A0, $FF, $00
    db   $00, $80, $FE, $80, $00, $80, $FE, $80, $00, $80, $FE, $80, $00, $80, $FE, $80

Data_01F_5B5B::
    db   $80, $00, $20, $A0, $81, $02

Data_01F_5B61::
    db   $80, $00, $60, $22, $86, $02

func_01F_5B67::
    ld   a, $0C                                   ; $5B67: $3E $0C
    ld   [$D3BE], a                               ; $5B69: $EA $BE $D3
    call func_01F_636A                            ; $5B6C: $CD $6A $63
    ld   hl, Data_01F_5BB2                        ; $5B6F: $21 $B2 $5B
    call func_01F_7ABD                            ; $5B72: $CD $BD $7A
    jp   label_01F_62F8                           ; $5B75: $C3 $F8 $62

func_01F_5B78::
    call IncrementValueAtBC                       ; $5B78: $CD $75 $7A
    cp   $03                                      ; $5B7B: $FE $03
    jr   z, jr_01F_5B85                           ; $5B7D: $28 $06

    ld   hl, Data_01F_5BAE                        ; $5B7F: $21 $AE $5B
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
    ld   hl, Data_01F_5BAE                        ; $5B98: $21 $AE $5B
    jp   label_01F_7AEB                           ; $5B9B: $C3 $EB $7A

label_01F_5B9E:
    ld   hl, Data_01F_5BB8                        ; $5B9E: $21 $B8 $5B

jr_01F_5BA1:
    call func_01F_7ABD                            ; $5BA1: $CD $BD $7A
    xor  a                                        ; $5BA4: $AF
    ld   [bc], a                                  ; $5BA5: $02
    jp   WriteChannel3AndDE                       ; $5BA6: $C3 $85 $7A

label_01F_5BA9:
    ld   hl, Data_01F_5BBE                        ; $5BA9: $21 $BE $5B
    jr   jr_01F_5BA1                              ; $5BAC: $18 $F3

Data_01F_5BAE::
    db   $00, $E0, $FF, $A0

Data_01F_5BB2::
    db   $80, $00, $20, $00, $84, $01

Data_01F_5BB8::
    db   $80, $00, $40, $80, $85, $01

Data_01F_5BBE::
    db   $80, $00, $60, $80, $85, $01

func_01F_5BC4::
    ld   a, $12                                   ; $5BC4: $3E $12
    ld   [$D3BE], a                               ; $5BC6: $EA $BE $D3
    call func_01F_636A                            ; $5BC9: $CD $6A $63
    ld   hl, Data_01F_5C00                        ; $5BCC: $21 $00 $5C
    call func_01F_7ABD                            ; $5BCF: $CD $BD $7A
    jp   label_01F_62F8                           ; $5BD2: $C3 $F8 $62

func_01F_5BD5::
    call IncrementValueAtBC                       ; $5BD5: $CD $75 $7A
    cp   $03                                      ; $5BD8: $FE $03
    jr   z, jr_01F_5BE2                           ; $5BDA: $28 $06

jr_01F_5BDC:
    ld   hl, Data_01F_5BFC                        ; $5BDC: $21 $FC $5B
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
    ld   hl, Data_01F_5C06                        ; $5BF3: $21 $06 $5C
    call func_01F_7ABD                            ; $5BF6: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5BF9: $C3 $85 $7A

Data_01F_5BFC::
    db   $01, $00, $FE, $C0

Data_01F_5C00::
    db   $80, $00, $20, $40, $86, $02

Data_01F_5C06::
    db   $80, $00, $60, $C0, $84, $02

func_01F_5C0C::
    ld   a, $04                                   ; $5C0C: $3E $04
    ld   [$D3BE], a                               ; $5C0E: $EA $BE $D3
    call func_01F_6374                            ; $5C11: $CD $74 $63
    ld   hl, Data_01F_5C6E                        ; $5C14: $21 $6E $5C
    call func_01F_7ABD                            ; $5C17: $CD $BD $7A
    jp   label_01F_62F8                           ; $5C1A: $C3 $F8 $62

func_01F_5C1D::
    call DecrementValueAtDE                       ; $5C1D: $CD $71 $7A
    ret  nz                                       ; $5C20: $C0

    ld   a, $01                                   ; $5C21: $3E $01
    ld   [de], a                                  ; $5C23: $12
    call IncrementValueAtBC                       ; $5C24: $CD $75 $7A
    cp   $06                                      ; $5C27: $FE $06
    jr   z, jr_01F_5C4E                           ; $5C29: $28 $23

    cp   $07                                      ; $5C2B: $FE $07
    jr   z, jr_01F_5C35                           ; $5C2D: $28 $06

    ld   hl, Data_01F_5C64                        ; $5C2F: $21 $64 $5C
    jp   label_01F_7AEB                           ; $5C32: $C3 $EB $7A

jr_01F_5C35:
    call func_01F_7AA6                            ; $5C35: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5C38: $CA $27 $63

    cp   $02                                      ; $5C3B: $FE $02
    jr   z, jr_01F_5C5F                           ; $5C3D: $28 $20

    cp   $01                                      ; $5C3F: $FE $01
    jr   z, jr_01F_5C5F                           ; $5C41: $28 $1C

    ld   hl, Data_01F_5C74                        ; $5C43: $21 $74 $5C

jr_01F_5C46:
    xor  a                                        ; $5C46: $AF
    ld   [bc], a                                  ; $5C47: $02
    call func_01F_7ABD                            ; $5C48: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5C4B: $C3 $85 $7A

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
    ld   hl, Data_01F_5C7A                        ; $5C5F: $21 $7A $5C
    jr   jr_01F_5C46                              ; $5C62: $18 $E2

Data_01F_5C64::
    db   $02, $40, $01, $40, $FF, $F2, $00, $0E, $FF, $F2

Data_01F_5C6E::
    db   $80, $00, $20, $16, $84, $01

Data_01F_5C74::
    db   $80, $00, $20, $26, $84, $01

Data_01F_5C7A::
    db   $80, $00, $20, $08, $84, $01

func_01F_5C80::
    ld   a, [$D371]                               ; $5C80: $FA $71 $D3
    cp   $14                                      ; $5C83: $FE $14
    jp   z, label_01F_6385                        ; $5C85: $CA $85 $63

jr_01F_5C88:
    ld   a, $04                                   ; $5C88: $3E $04
    ld   [$D3BE], a                               ; $5C8A: $EA $BE $D3
    call func_01F_636A                            ; $5C8D: $CD $6A $63
    ld   hl, Data_01F_5CAA                        ; $5C90: $21 $AA $5C
    call func_01F_7ABD                            ; $5C93: $CD $BD $7A
    jp   label_01F_62F8                           ; $5C96: $C3 $F8 $62

func_01F_5C99::
    call func_01F_7AA6                            ; $5C99: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $5C9C: $CA $27 $63

    ld   a, $01                                   ; $5C9F: $3E $01
    ld   [bc], a                                  ; $5CA1: $02
    ld   hl, Data_01F_5CA8                        ; $5CA2: $21 $A8 $5C
    jp   label_01F_7AEB                           ; $5CA5: $C3 $EB $7A

Data_01F_5CA8::
    db   $00, $0E

Data_01F_5CAA::
    db   $80, $00, $40, $80, $87, $01

func_01F_5CB0::
    call func_01F_6379                            ; $5CB0: $CD $79 $63
    ld   hl, Data_01F_5CD8                        ; $5CB3: $21 $D8 $5C
    jp   label_01F_62F3                           ; $5CB6: $C3 $F3 $62

func_01F_5CB9::
    call DecrementValueAtDE                       ; $5CB9: $CD $71 $7A
    ret  nz                                       ; $5CBC: $C0

    call IncrementValueAtBC                       ; $5CBD: $CD $75 $7A
    cp   $06                                      ; $5CC0: $FE $06
    jp   z, label_01F_632D                        ; $5CC2: $CA $2D $63

    ld   hl, Data_01F_5CCE                        ; $5CC5: $21 $CE $5C
    call GetHandlerAddressInTable                 ; $5CC8: $CD $64 $7A
    jp   WriteChannel3AndDE                       ; $5CCB: $C3 $85 $7A

Data_01F_5CCE::
    dw   Data_01F_5CDE
    dw   Data_01F_5CE4
    dw   Data_01F_5CEA
    dw   Data_01F_5CF0
    dw   Data_01F_5CF6

Data_01F_5CD8::
    db   $80, $D0, $20, $40, $C7, $14

Data_01F_5CDE::
    db   $80, $C0, $20, $64, $C7, $0C

Data_01F_5CE4::
    db   $80, $90, $40, $78, $C7, $40

Data_01F_5CEA::
    db   $80, $C0, $20, $54, $C7, $06

Data_01F_5CF0::
    db   $80, $C0, $40, $46, $C7, $0C

Data_01F_5CF6::
    db   $80, $A0, $20, $5E, $C7, $20

func_01F_5CFC::
    ld   a, [$D371]                               ; $5CFC: $FA $71 $D3
    cp   $03                                      ; $5CFF: $FE $03
    jp   z, label_01F_6385                        ; $5D01: $CA $85 $63

    cp   $07                                      ; $5D04: $FE $07
    jp   z, label_01F_6385                        ; $5D06: $CA $85 $63

    ld   a, $02                                   ; $5D09: $3E $02
    ld   [$D3BE], a                               ; $5D0B: $EA $BE $D3
    call func_01F_6365                            ; $5D0E: $CD $65 $63
    ld   hl, Data_01F_5D68                        ; $5D11: $21 $68 $5D
    call func_01F_7ABD                            ; $5D14: $CD $BD $7A
    jp   label_01F_62F8                           ; $5D17: $C3 $F8 $62

func_01F_5D1A::
    call DecrementValueAtDE                       ; $5D1A: $CD $71 $7A
    ret  nz                                       ; $5D1D: $C0

    ld   a, $01                                   ; $5D1E: $3E $01
    ld   [de], a                                  ; $5D20: $12
    ld   a, [bc]                                  ; $5D21: $0A
    cp   $07                                      ; $5D22: $FE $07
    jr   nc, jr_01F_5D33                          ; $5D24: $30 $0D

jr_01F_5D26:
    call IncrementValueAtBC                       ; $5D26: $CD $75 $7A
    cp   $10                                      ; $5D29: $FE $10
    jr   z, jr_01F_5D38                           ; $5D2B: $28 $0B

    ld   hl, Data_01F_5D4A                        ; $5D2D: $21 $4A $5D
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
    ld   hl, Data_01F_5D6E                        ; $5D41: $21 $6E $5D
    call func_01F_7ABD                            ; $5D44: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5D47: $C3 $85 $7A

Data_01F_5D4A::
    db   $02, $00, $02, $00, $01, $00, $00, $C0, $FF, $40, $00, $C0, $FF, $40, $FF, $00
    db   $FF, $00, $FE, $00, $FF, $C0, $FF, $C0, $FF, $C0, $FF, $C0, $FF, $C0

Data_01F_5D68::
    db   $80, $00, $20, $60, $80, $02

Data_01F_5D6E::
    db   $80, $00, $60, $60, $85, $02

Data_01F_5D74::
    db   $02, $46, $8A, $CE, $FC, $96, $04, $04, $02, $46, $8A, $CE, $FC, $96, $04, $04

func_01F_5D84::
    ld   hl, $D34F                                ; $5D84: $21 $4F $D3
    set  7, [hl]                                  ; $5D87: $CB $FE
    ld   a, $03                                   ; $5D89: $3E $03
    ld   [$D3BE], a                               ; $5D8B: $EA $BE $D3
    ld   hl, Data_01F_5EB1                        ; $5D8E: $21 $B1 $5E
    call WriteChannel4AndDE                       ; $5D91: $CD $8B $7A
    call func_01F_636A                            ; $5D94: $CD $6A $63
    ld   hl, Data_01F_5D74                        ; $5D97: $21 $74 $5D
    call func_01F_635A                            ; $5D9A: $CD $5A $63
    ld   hl, Data_01F_5EC5                        ; $5D9D: $21 $C5 $5E
    call func_01F_7ABD                            ; $5DA0: $CD $BD $7A
    jp   label_01F_62F3                           ; $5DA3: $C3 $F3 $62

func_01F_5DA6::
    call IncrementValueAtBC                       ; $5DA6: $CD $75 $7A
    cp   $55                                      ; $5DA9: $FE $55
    jr   z, jr_01F_5DCE                           ; $5DAB: $28 $21

    cp   $03                                      ; $5DAD: $FE $03
    jr   z, jr_01F_5DBB                           ; $5DAF: $28 $0A

    cp   $07                                      ; $5DB1: $FE $07
    jr   z, jr_01F_5DC4                           ; $5DB3: $28 $0F

jr_01F_5DB5:
    ld   hl, Data_01F_5E09                        ; $5DB5: $21 $09 $5E
    jp   label_01F_7AEB                           ; $5DB8: $C3 $EB $7A

jr_01F_5DBB:
    ld   a, $40                                   ; $5DBB: $3E $40

jr_01F_5DBD:
    ldh  [rNR32], a                               ; $5DBD: $E0 $1C
    ld   bc, $D396                                ; $5DBF: $01 $96 $D3
    jr   jr_01F_5DB5                              ; $5DC2: $18 $F1

jr_01F_5DC4:
    ld   hl, Data_01F_5EB6                        ; $5DC4: $21 $B6 $5E
    call WriteChannel4AndDE                       ; $5DC7: $CD $8B $7A
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
    ld   hl, Data_01F_5EBB                        ; $5DDA: $21 $BB $5E
    call WriteChannel4AndDE                       ; $5DDD: $CD $8B $7A
    ld   hl, Data_01F_5ECB                        ; $5DE0: $21 $CB $5E
    call func_01F_7ABD                            ; $5DE3: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5DE6: $C3 $85 $7A

jr_01F_5DE9:
    ld   a, $40                                   ; $5DE9: $3E $40
    ld   [bc], a                                  ; $5DEB: $02
    ld   hl, Data_01F_5EC0                        ; $5DEC: $21 $C0 $5E
    call WriteChannel4AndDE                       ; $5DEF: $CD $8B $7A
    ld   hl, Data_01F_5ED1                        ; $5DF2: $21 $D1 $5E
    call func_01F_7ABD                            ; $5DF5: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5DF8: $C3 $85 $7A

jr_01F_5DFB:
    ld   hl, $D34F                                ; $5DFB: $21 $4F $D3
    res  7, [hl]                                  ; $5DFE: $CB $BE
    ld   hl, Data_01F_7A20                        ; $5E00: $21 $20 $7A
    call WriteChannel4AndDE                       ; $5E03: $CD $8B $7A
    jp   label_01F_6327                           ; $5E06: $C3 $27 $63

Data_01F_5E09::
    db   $00, $40, $FF, $E0, $00, $40, $FF, $E0, $00, $30, $FF, $E8, $00, $30, $FF, $E8
    db   $00, $20, $FF, $F0, $00, $20, $FF, $F0, $00, $10, $FF, $F8, $00, $10, $FF, $F8
    db   $00, $08, $FF, $F9, $00, $08, $FF, $F9, $00, $08, $FF, $F9, $00, $08, $FF, $F9
    db   $00, $08, $FF, $F9, $00, $08, $FF, $F9, $00, $08, $FF, $F8, $00, $08, $FF, $F8
    db   $00, $08, $FF, $F8, $00, $08, $FF, $F8, $00, $08, $FF, $F7, $00, $08, $FF, $F7
    db   $00, $08, $FF, $F7, $00, $08, $FF, $F7, $00, $08, $FF, $F7, $00, $08, $FF, $F7
    db   $00, $10, $FF, $EE, $00, $10, $FF, $EE, $00, $10, $FF, $EE, $00, $10, $FF, $EE
    db   $00, $10, $FF, $EE, $00, $10, $FF, $EE, $00, $10, $FF, $EE, $00, $10, $FF, $EE
    db   $00, $10, $FF, $EE, $00, $10, $FF, $EE, $00, $10, $FF, $EC, $00, $10, $FF, $EC
    db   $00, $10, $FF, $EC, $00, $10, $FF, $EC, $00, $10, $FF, $EC, $00, $10, $FF, $EC
    db   $00, $10, $FF, $EC, $00, $10, $FF, $EC

Data_01F_5EB1::
    db   $00, $19, $00, $80, $01

Data_01F_5EB6::
    db   $00, $A0, $00, $80, $01

Data_01F_5EBB::
    db   $00, $50, $00, $80, $01

Data_01F_5EC0::
    db   $00, $20, $00, $80, $01

Data_01F_5EC5::
    db   $80, $00, $60, $A0, $86, $02

Data_01F_5ECB::
    db   $80, $00, $40, $20, $87, $02

Data_01F_5ED1::
    db   $80, $00, $60, $20, $87, $02

func_01F_5ED7::
    ld   a, $0E                                   ; $5ED7: $3E $0E
    ld   [$D3BE], a                               ; $5ED9: $EA $BE $D3
    call func_01F_6365                            ; $5EDC: $CD $65 $63
    ld   hl, Data_01F_5F13                        ; $5EDF: $21 $13 $5F
    call func_01F_7ABD                            ; $5EE2: $CD $BD $7A
    jp   label_01F_62F3                           ; $5EE5: $C3 $F3 $62

func_01F_5EE8::
    call IncrementValueAtBC                       ; $5EE8: $CD $75 $7A
    cp   $03                                      ; $5EEB: $FE $03
    jr   z, jr_01F_5EF5                           ; $5EED: $28 $06

jr_01F_5EEF:
    ld   hl, Data_01F_5F0F                        ; $5EEF: $21 $0F $5F
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
    ld   hl, Data_01F_5F13                        ; $5F06: $21 $13 $5F
    call func_01F_7ABD                            ; $5F09: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $5F0C: $C3 $85 $7A

Data_01F_5F0F::
    db   $00, $60, $FF, $00

Data_01F_5F13::
    db   $80, $00, $20, $40, $86, $00

func_01F_5F19::
    call func_01F_6379                            ; $5F19: $CD $79 $63
    ld   hl, Data_01F_5F72                        ; $5F1C: $21 $72 $5F
    call func_01F_7ABD                            ; $5F1F: $CD $BD $7A
    jp   label_01F_62F8                           ; $5F22: $C3 $F8 $62

func_01F_5F25::
    call IncrementValueAtBC                       ; $5F25: $CD $75 $7A
    cp   $13                                      ; $5F28: $FE $13
    jp   z, label_01F_6327                        ; $5F2A: $CA $27 $63

    cp   $02                                      ; $5F2D: $FE $02
    jr   z, jr_01F_5F3F                           ; $5F2F: $28 $0E

    cp   $0E                                      ; $5F31: $FE $0E
    jr   z, jr_01F_5F46                           ; $5F33: $28 $11

    cp   $10                                      ; $5F35: $FE $10
    jr   z, jr_01F_5F4A                           ; $5F37: $28 $11

jr_01F_5F39:
    ld   hl, Data_01F_5F4E                        ; $5F39: $21 $4E $5F
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

Data_01F_5F4E::
    db   $FF, $F0, $00, $12, $FF, $F0, $00, $12, $FF, $F0, $00, $12, $FF, $E0, $00, $1E
    db   $FF, $E0, $00, $1C, $FF, $E0, $00, $1A, $FF, $E0, $00, $18, $FF, $E0, $00, $12
    db   $FF, $E0, $00, $14

Data_01F_5F72::
    db   $80, $00, $40, $30, $87, $01

func_01F_5F78::
    ld   a, [$D371]                               ; $5F78: $FA $71 $D3
    cp   $03                                      ; $5F7B: $FE $03
    jp   z, label_01F_6385                        ; $5F7D: $CA $85 $63

    cp   $06                                      ; $5F80: $FE $06
    jp   z, label_01F_6385                        ; $5F82: $CA $85 $63

    cp   $07                                      ; $5F85: $FE $07
    jp   z, label_01F_6385                        ; $5F87: $CA $85 $63

    call func_01F_6360                            ; $5F8A: $CD $60 $63
    ld   hl, Data_01F_5FAE                        ; $5F8D: $21 $AE $5F
    jp   label_01F_62F8                           ; $5F90: $C3 $F8 $62

func_01F_5F93::
    call DecrementValueAtDE                       ; $5F93: $CD $71 $7A
    ret  nz                                       ; $5F96: $C0

    call IncrementValueAtBC                       ; $5F97: $CD $75 $7A
    cp   $04                                      ; $5F9A: $FE $04
    jp   z, label_01F_632D                        ; $5F9C: $CA $2D $63

    ld   hl, Data_01F_5FA8                        ; $5F9F: $21 $A8 $5F
    call GetHandlerAddressInTable                 ; $5FA2: $CD $64 $7A
    jp   WriteChannel3AndDE                       ; $5FA5: $C3 $85 $7A

Data_01F_5FA8::
    dw   Data_01F_5FB4
    dw   Data_01F_5FBA
    dw   Data_01F_5FB4

Data_01F_5FAE::
    db   $80, $FD, $40, $20, $C0, $02

Data_01F_5FB4::
    db   $80, $FD, $40, $80, $C1, $02

Data_01F_5FBA::
    db   $80, $FD, $40, $00, $C2, $02

func_01F_5FC0::
    call func_01F_6379                            ; $5FC0: $CD $79 $63
    ld   hl, Data_01F_5FEC                        ; $5FC3: $21 $EC $5F
    jp   label_01F_62F3                           ; $5FC6: $C3 $F3 $62

func_01F_5FC9::
    call DecrementValueAtDE                       ; $5FC9: $CD $71 $7A
    ret  nz                                       ; $5FCC: $C0

    call IncrementValueAtBC                       ; $5FCD: $CD $75 $7A
    cp   $08                                      ; $5FD0: $FE $08
    jp   z, label_01F_632D                        ; $5FD2: $CA $2D $63

    ld   hl, Data_01F_5FDE                        ; $5FD5: $21 $DE $5F
    call GetHandlerAddressInTable                 ; $5FD8: $CD $64 $7A
    jp   WriteChannel3AndDE                       ; $5FDB: $C3 $85 $7A

Data_01F_5FDE::
    dw   Data_01F_6004
    dw   Data_01F_5FF2
    dw   Data_01F_600A
    dw   Data_01F_5FF8
    dw   Data_01F_6010
    dw   Data_01F_5FFE
    dw   Data_01F_6016

Data_01F_5FEC::
    db   $80, $EA, $20, $62, $C7, $06

Data_01F_5FF2::
    db   $80, $EA, $20, $74, $C7, $06

Data_01F_5FF8::
    db   $80, $EA, $20, $7B, $C7, $06

Data_01F_5FFE::
    db   $80, $EA, $20, $A7, $C7, $06

Data_01F_6004::
    db   $80, $EA, $60, $62, $C7, $06

Data_01F_600A::
    db   $80, $EA, $60, $74, $C7, $06

Data_01F_6010::
    db   $80, $EA, $60, $7B, $C7, $06

Data_01F_6016::
    db   $80, $EA, $60, $A7, $C7, $06

func_01F_601C::
    ld   a, $04                                   ; $601C: $3E $04
    ld   [$D3BE], a                               ; $601E: $EA $BE $D3
    call func_01F_6379                            ; $6021: $CD $79 $63
    ld   hl, Data_01F_6060                        ; $6024: $21 $60 $60
    call func_01F_7ABD                            ; $6027: $CD $BD $7A
    jp   label_01F_62F8                           ; $602A: $C3 $F8 $62

func_01F_602D::
    call IncrementValueAtBC                       ; $602D: $CD $75 $7A
    cp   $07                                      ; $6030: $FE $07
    jr   z, jr_01F_603A                           ; $6032: $28 $06

    ld   hl, Data_01F_6054                        ; $6034: $21 $54 $60
    jp   label_01F_7AEB                           ; $6037: $C3 $EB $7A

jr_01F_603A:
    call func_01F_7AA6                            ; $603A: $CD $A6 $7A
    jp   z, label_01F_6327                        ; $603D: $CA $27 $63

    cp   $02                                      ; $6040: $FE $02
    jr   z, jr_01F_604F                           ; $6042: $28 $0B

    ld   hl, Data_01F_6066                        ; $6044: $21 $66 $60

jr_01F_6047:
    xor  a                                        ; $6047: $AF
    ld   [bc], a                                  ; $6048: $02
    call func_01F_7ABD                            ; $6049: $CD $BD $7A
    jp   WriteChannel3AndDE                       ; $604C: $C3 $85 $7A

jr_01F_604F:
    ld   hl, Data_01F_6060                        ; $604F: $21 $60 $60
    jr   jr_01F_6047                              ; $6052: $18 $F3

Data_01F_6054::
    db   $00, $06, $00, $04, $00, $02, $FF, $F8, $FF, $F0, $FF, $E8

Data_01F_6060::
    db   $80, $00, $20, $60, $87, $01

Data_01F_6066::
    db   $80, $00, $60, $60, $87, $01

func_01F_606C::
    ret                                           ; $606C: $C9

func_01F_606D::
    ret                                           ; $606D: $C9

func_01F_606E::
    ld   a, $07                                   ; $606E: $3E $07
    ld   [$D3DC], a                               ; $6070: $EA $DC $D3
    ld   a, $40                                   ; $6073: $3E $40
    ld   [$D3BE], a                               ; $6075: $EA $BE $D3
    call func_01F_6360                            ; $6078: $CD $60 $63
    ld   hl, Data_01F_60BE                        ; $607B: $21 $BE $60
    call func_01F_7ABD                            ; $607E: $CD $BD $7A
    jp   label_01F_62F8                           ; $6081: $C3 $F8 $62

func_01F_6084::
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
    ld   hl, Data_01F_60B8                        ; $6098: $21 $B8 $60
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
    call DecrementValueAtDE                       ; $60AA: $CD $71 $7A
    pop  de                                       ; $60AD: $D1
    jp   z, label_01F_6327                        ; $60AE: $CA $27 $63

    ld   a, $40                                   ; $60B1: $3E $40
    ld   [$D3BE], a                               ; $60B3: $EA $BE $D3
    jr   jr_01F_608A                              ; $60B6: $18 $D2

Data_01F_60B8::
    db   $FF, $FF, $FF, $FE, $FF, $FB

Data_01F_60BE::
    db   $80, $00, $20, $FF, $87, $01

Data_01F_60C4::
    db   $06, $C6, $06, $C6, $06, $C6, $06, $C6
    db   $89, $BD, $ED, $B9, $87, $53, $23, $57

func_01F_60D4::
    call func_01F_7B5C                            ; $60D4: $CD $5C $7B
    ld   hl, Data_01F_60C4                        ; $60D7: $21 $C4 $60
    call func_01F_635A                            ; $60DA: $CD $5A $63
    ld   a, $05                                   ; $60DD: $3E $05
    ld   [$D3BE], a                               ; $60DF: $EA $BE $D3
    xor  a                                        ; $60E2: $AF
    ld   [$D3DD], a                               ; $60E3: $EA $DD $D3
    ld   hl, Data_01F_6147                        ; $60E6: $21 $47 $61
    call func_01F_7ABD                            ; $60E9: $CD $BD $7A
    jp   label_01F_62F3                           ; $60EC: $C3 $F3 $62

func_01F_60EF::
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
    ld   hl, Data_01F_613D                        ; $6107: $21 $3D $61
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
    call IncrementValueAtBC                       ; $6119: $CD $75 $7A
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

; Plays the ethereal staircase room's music
jr_01F_6135:
    ld   a, MUSIC_MEETING_WINDFISH                ; $6135: $3E $59
    ld   [wMusicTrackToPlay], a                   ; $6137: $EA $68 $D3
    jp   label_01F_6327                           ; $613A: $C3 $27 $63

Data_01F_613D::
    db   $FF, $F4, $00, $32, $FF, $F0, $00, $70, $FF, $E8

Data_01F_6147::
    db   $80, $00, $40, $A0, $87, $01

func_01F_614D::
    call func_01F_6360                            ; $614D: $CD $60 $63
    ld   a, $03                                   ; $6150: $3E $03
    ld   [$D3DE], a                               ; $6152: $EA $DE $D3
    ld   a, $90                                   ; $6155: $3E $90
    ld   [$D3BE], a                               ; $6157: $EA $BE $D3
    ld   hl, Data_01F_619C                        ; $615A: $21 $9C $61
    call func_01F_7ABD                            ; $615D: $CD $BD $7A
    jp   label_01F_62F8                           ; $6160: $C3 $F8 $62

func_01F_6163::
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
    ld   hl, Data_01F_6196                        ; $6176: $21 $96 $61
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
    call DecrementValueAtDE                       ; $6188: $CD $71 $7A
    pop  de                                       ; $618B: $D1
    jp   z, label_01F_6327                        ; $618C: $CA $27 $63

    ld   a, $90                                   ; $618F: $3E $90
    ld   [$D3BE], a                               ; $6191: $EA $BE $D3
    jr   jr_01F_6168                              ; $6194: $18 $D2

Data_01F_6196::
    db   $00, $01, $00, $02, $00, $03

Data_01F_619C::
    db   $80, $00, $60, $80, $84, $02

func_01F_61A2::
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
    ld   hl, Data_01F_6354                        ; $61C0: $21 $54 $63
    call WriteChannel3AndDE                       ; $61C3: $CD $85 $7A
    ld   hl, Data_01F_6217                        ; $61C6: $21 $17 $62
    call func_01F_7AD0                            ; $61C9: $CD $D0 $7A
    jp   WriteChannel2AndDE                       ; $61CC: $C3 $7F $7A

func_01F_61CF::
    call IncrementValueAtBC                       ; $61CF: $CD $75 $7A
    cp   $09                                      ; $61D2: $FE $09
    jr   z, jr_01F_61E0                           ; $61D4: $28 $0A

    cp   $0A                                      ; $61D6: $FE $0A
    jr   z, jr_01F_61E8                           ; $61D8: $28 $0E

jr_01F_61DA:
    ld   hl, Data_01F_6205                        ; $61DA: $21 $05 $62
    jp   func_01F_7B11                            ; $61DD: $C3 $11 $7B

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
    ld   hl, $D32F                                ; $61FF: $21 $2F $D3
    res  7, [hl]                                  ; $6202: $CB $BE
    ret                                           ; $6204: $C9

Data_01F_6205::
    db   $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FC, $FF, $FA, $FF, $F6, $FF, $F2, $FF, $EE
    db   $00, $3A

Data_01F_6217::
    db   $00, $97, $80, $87, $01

func_01F_621C::
    ld   a, $2E                                   ; $621C: $3E $2E
    ld   [$D3BE], a                               ; $621E: $EA $BE $D3
    xor  a                                        ; $6221: $AF
    ld   [$D3E1], a                               ; $6222: $EA $E1 $D3
    call func_01F_6360                            ; $6225: $CD $60 $63
    ld   hl, Data_01F_6276                        ; $6228: $21 $76 $62
    call func_01F_7ABD                            ; $622B: $CD $BD $7A
    jp   label_01F_62F3                           ; $622E: $C3 $F3 $62

func_01F_6231::
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
    ld   hl, Data_01F_626E                        ; $6248: $21 $6E $62
    jp   label_01F_7AEB                           ; $624B: $C3 $EB $7A

jr_01F_624E:
    push bc                                       ; $624E: $C5
    ld   bc, $D3E1                                ; $624F: $01 $E1 $D3
    call IncrementValueAtBC                       ; $6252: $CD $75 $7A
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

Data_01F_626E::
    db   $00, $08, $00, $06, $00, $04, $00, $02

Data_01F_6276::
    db   $80, $00, $40, $30, $84, $01

func_01F_627C::
    call func_01F_6365                            ; $627C: $CD $65 $63
    ld   hl, Data_01F_62C9                        ; $627F: $21 $C9 $62
    jp   label_01F_62F3                           ; $6282: $C3 $F3 $62

func_01F_6285::
    call DecrementValueAtDE                       ; $6285: $CD $71 $7A
    ret  nz                                       ; $6288: $C0

    call IncrementValueAtBC                       ; $6289: $CD $75 $7A
    cp   $0D                                      ; $628C: $FE $0D
    jp   z, label_01F_6327                        ; $628E: $CA $27 $63

    ld   hl, Data_01F_62B1                        ; $6291: $21 $B1 $62
    call GetHandlerAddressInTable                 ; $6294: $CD $64 $7A
    ld   a, [$D396]                               ; $6297: $FA $96 $D3
    cp   $01                                      ; $629A: $FE $01
    jp   z, WriteChannel3AndDE                    ; $629C: $CA $85 $7A

    cp   $02                                      ; $629F: $FE $02
    jp   z, WriteChannel3AndDE                    ; $62A1: $CA $85 $7A

    cp   $07                                      ; $62A4: $FE $07
    jp   z, WriteChannel3AndDE                    ; $62A6: $CA $85 $7A

    cp   $0A                                      ; $62A9: $FE $0A
    jp   z, WriteChannel3AndDE                    ; $62AB: $CA $85 $7A

    jp   WriteChannel3FrequencyAndDE              ; $62AE: $C3 $7E $63

Data_01F_62B1::
    dw   Data_01F_62CF
    dw   Data_01F_62D5
    dw   Data_01F_62E7
    dw   Data_01F_62EA
    dw   Data_01F_62ED
    dw   Data_01F_62F0
    dw   Data_01F_62DB
    dw   Data_01F_62ED
    dw   Data_01F_62F0
    dw   Data_01F_62E1
    dw   Data_01F_62ED
    dw   Data_01F_62F0

Data_01F_62C9::
    db   $80, $F2, $60, $DF, $87, $02

Data_01F_62CF::
    db   $80, $F2, $40, $DF, $87, $02

Data_01F_62D5::
    db   $80, $F2, $20, $DF, $87, $03

Data_01F_62DB::
    db   $80, $F2, $40, $A2, $87, $03

Data_01F_62E1::
    db   $80, $F2, $60, $A2, $87, $03

Data_01F_62E7::
    db   $BE, $87, $03

Data_01F_62EA::
    db   $A2, $87, $03

Data_01F_62ED::
    db   $83, $87, $03

Data_01F_62F0::
    db   $A7, $C7, $03

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
    jp   WriteChannel3AndDE                       ; $630E: $C3 $85 $7A

; Unused data
Data_01F_6311::
    db   $80, $00, $00, $00, $01, $01, $00, $00   ; $6311
    db   $00, $00, $FF, $FF, $FF, $FF, $00, $00   ; $6319
    db   $00, $00, $FF, $FF, $FF, $FF             ; $6321

label_01F_6327:
    ld   hl, Data_01F_6354                        ; $6327: $21 $54 $63
    call WriteChannel3AndDE                       ; $632A: $CD $85 $7A

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

WriteWavePattern::
    push bc                                       ; $6347: $C5
    ld   c, $30                                   ; $6348: $0E $30
.loop
    ld   a, [hl+]                                 ; $634A: $2A
    ld   [c], a                                   ; $634B: $E2
    inc  c                                        ; $634C: $0C
    ld   a, c                                     ; $634D: $79
    cp   $40                                      ; $634E: $FE $40
    jr   nz, .loop                                ; $6350: $20 $F8
    pop  bc                                       ; $6352: $C1
    ret                                           ; $6353: $C9

Data_01F_6354::
    db   $80, $00, $00, $00, $81, $01

func_01F_635A::
    xor  a                                        ; $635A: $AF
    ldh  [rNR30], a                               ; $635B: $E0 $1A
    jp   WriteWavePattern                         ; $635D: $C3 $47 $63

func_01F_6360::
    ld   hl, Data_01F_63AC                        ; $6360: $21 $AC $63
    jr   func_01F_635A                            ; $6363: $18 $F5

func_01F_6365::
    ld   hl, Data_01F_63BC                        ; $6365: $21 $BC $63
    jr   func_01F_635A                            ; $6368: $18 $F0

func_01F_636A::
    ld   hl, Data_01F_639C                        ; $636A: $21 $9C $63
    jr   func_01F_635A                            ; $636D: $18 $EB

func_01F_636F::
    ld   hl, Data_01F_63CC                        ; $636F: $21 $CC $63
    jr   func_01F_635A                            ; $6372: $18 $E6

func_01F_6374::
    ld   hl, Data_01F_63DC                        ; $6374: $21 $DC $63
    jr   func_01F_635A                            ; $6377: $18 $E1

func_01F_6379::
    ld   hl, Data_01F_638C                        ; $6379: $21 $8C $63
    jr   func_01F_635A                            ; $637C: $18 $DC

WriteChannel3FrequencyAndDE:
    ld   c, $1D                                   ; $637E: $0E $1D
    ld   b, $02                                   ; $6380: $06 $02
    jp   WriteIOAndDE                             ; $6382: $C3 $91 $7A

label_01F_6385:
    xor  a                                        ; $6385: $AF
    ld   [wActiveWaveSfx], a                      ; $6386: $EA $70 $D3
    jp   PlayActiveWaveSfx                        ; $6389: $C3 $ED $53

Data_01F_638C::
    db   $8C, $EF, $FE, $C8, $84, $21, $12, $48, $8C, $EF, $FE, $C8, $84, $21, $12, $48

Data_01F_639C::
    db   $00, $22, $44, $66, $88, $AA, $CC, $CC, $00, $22, $44, $66, $88, $AA, $CC, $CC

Data_01F_63AC::
    db   $0F, $0F, $1F, $1F, $2F, $2F, $3F, $3F, $40, $40, $50, $50, $60, $60, $70, $70

Data_01F_63BC::
    db   $0C, $0C, $00, $22, $44, $88, $AA, $CC, $EE, $00, $6C, $60, $00, $6C, $60, $00

Data_01F_63CC::
    db   $FF, $FF, $EE, $DD, $EE, $DD, $EE, $FF, $FF, $C9, $63, $21, $00, $00, $04, $8C

Data_01F_63DC::
    db   $01, $23, $45, $67, $89, $AC, $EE, $EE, $FE, $DC, $BA, $98, $76, $54, $32, $10

NoiseSfxHandlersTable1::
    dw   func_01F_651E
    dw   func_01F_653D
    dw   func_01F_6587
    dw   func_01F_65EF
    dw   func_01F_661F
    dw   func_01F_666D
    dw   func_01F_66A2
    dw   func_01F_66E0
    dw   func_01F_6726
    dw   func_01F_6760
    dw   func_01F_6792
    dw   func_01F_67B4
    dw   func_01F_67F5
    dw   func_01F_682E
    dw   func_01F_685C
    dw   func_01F_6891
    dw   func_01F_68F0
    dw   func_01F_6902
    dw   func_01F_693F
    dw   func_01F_69C9
    dw   func_01F_6A0F
    dw   func_01F_6A4E
    dw   func_01F_6A80
    dw   func_01F_6AA2
    dw   func_01F_6AEC
    dw   func_01F_6B32
    dw   func_01F_6B97
    dw   func_01F_6C13
    dw   func_01F_6C4C
    dw   func_01F_6C97
    dw   func_01F_6CC4
    dw   func_01F_6D0B
    dw   func_01F_7A01
    dw   func_01F_6D35
    dw   func_01F_6D73
    dw   func_01F_6D95
    dw   func_01F_6DB7
    dw   func_01F_6E4E
    dw   func_01F_6E87
    dw   func_01F_6EDD
    dw   func_01F_6F31
    dw   func_01F_6F78
    dw   func_01F_6FDD
    dw   func_01F_6FEF
    dw   func_01F_7078
    dw   func_01F_70C4
    dw   func_01F_7114
    dw   func_01F_7136
    dw   func_01F_71C7
    dw   func_01F_723E
    dw   func_01F_7295
    dw   func_01F_72E4
    dw   func_01F_748B
    dw   func_01F_7590
    dw   func_01F_75DA
    dw   func_01F_76A1
    dw   func_01F_760A
    dw   func_01F_771C
    dw   func_01F_776E
    dw   func_01F_77C0
    dw   func_01F_77E6
    dw   func_01F_7905
    dw   func_01F_795B
    dw   func_01F_7B1B

NoiseSfxHandlersTable2::
    dw   func_01F_6529
    dw   func_01F_6543
    dw   func_01F_658D
    dw   func_01F_65F5
    dw   func_01F_663C
    dw   func_01F_6673
    dw   func_01F_66C4
    dw   func_01F_66F3
    dw   func_01F_672C
    dw   func_01F_6766
    dw   func_01F_6798
    dw   func_01F_67C7
    dw   func_01F_6800
    dw   func_01F_6834
    dw   func_01F_6869
    dw   func_01F_689C
    dw   func_01F_68F6
    dw   func_01F_6908
    dw   func_01F_6945
    dw   func_01F_69CF
    dw   func_01F_6A15
    dw   func_01F_6A5C
    dw   func_01F_6A86
    dw   func_01F_6AA8
    dw   func_01F_6AF2
    dw   func_01F_6B38
    dw   func_01F_6BAF
    dw   func_01F_6C1E
    dw   func_01F_6C57
    dw   func_01F_6CA4
    dw   func_01F_6CCF
    dw   func_01F_6D11
    dw   func_01F_7A01
    dw   func_01F_6D3B
    dw   func_01F_6D79
    dw   func_01F_6D9B
    dw   func_01F_6DBD
    dw   func_01F_6E59
    dw   func_01F_6E8D
    dw   func_01F_6EE8
    dw   func_01F_6F3C
    dw   func_01F_6F83
    dw   func_01F_6FE3
    dw   func_01F_6FF5
    dw   func_01F_707E
    dw   func_01F_70CF
    dw   func_01F_711A
    dw   func_01F_713C
    dw   func_01F_71CD
    dw   func_01F_7244
    dw   func_01F_729B
    dw   func_01F_72F4
    dw   func_01F_7496
    dw   func_01F_759B
    dw   func_01F_75EB
    dw   func_01F_76A7
    dw   func_01F_7610
    dw   func_01F_7730
    dw   func_01F_7790
    dw   func_01F_7A07
    dw   func_01F_77EC
    dw   func_01F_790B
    dw   func_01F_7961
    dw   func_01F_7B21

PlayActiveNoiseSfx::
    ld   hl, wActiveNoiseSfx                      ; $64EC: $21 $78 $D3
    ld   a, [hl]                                  ; $64EF: $7E
    and  a                                        ; $64F0: $A7
    jr   z, jr_01F_6500                           ; $64F1: $28 $0D

    ld   a, [$D3C9]                               ; $64F3: $FA $C9 $D3
    and  a                                        ; $64F6: $A7
    jp   nz, label_01F_7A2C                       ; $64F7: $C2 $2C $7A

    ld   a, [hl]                                  ; $64FA: $7E
    ld   hl, NoiseSfxHandlersTable1               ; $64FB: $21 $EC $63
    jr   jr_01F_6508                              ; $64FE: $18 $08

jr_01F_6500:
    inc  hl                                       ; $6500: $23
    ld   a, [hl]                                  ; $6501: $7E
    and  a                                        ; $6502: $A7
    jr   z, jr_01F_6512                           ; $6503: $28 $0D

    ld   hl, NoiseSfxHandlersTable2               ; $6505: $21 $6C $64

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
    jr   PlayActiveNoiseSfx                       ; $651C: $18 $CE

func_01F_651E::
    ld   a, $01                                   ; $651E: $3E $01
    ld   [$D379], a                               ; $6520: $EA $79 $D3
    ld   hl, Data_01F_6533                        ; $6523: $21 $33 $65
    jp   WriteChannel4AndDE                       ; $6526: $C3 $8B $7A

func_01F_6529::
    xor  a                                        ; $6529: $AF
    ld   [$D379], a                               ; $652A: $EA $79 $D3
    ld   hl, Data_01F_6538                        ; $652D: $21 $38 $65
    jp   WriteChannel4AndDE                       ; $6530: $C3 $8B $7A

Data_01F_6533::
    db   $3B, $80, $07, $C0, $01

Data_01F_6538::
    db   $00, $42, $02, $C0, $04

func_01F_653D::
    ld   hl, Data_01F_6564                        ; $653D: $21 $64 $65
    jp   label_01F_79E9                           ; $6540: $C3 $E9 $79

func_01F_6543::
    call DecrementValueAtDE                       ; $6543: $CD $71 $7A
    ret  nz                                       ; $6546: $C0

    call IncrementValueAtBC                       ; $6547: $CD $75 $7A
    cp   $07                                      ; $654A: $FE $07
    jp   z, func_01F_7A07                         ; $654C: $CA $07 $7A

    ld   hl, Data_01F_6558                        ; $654F: $21 $58 $65
    call GetHandlerAddressInTable                 ; $6552: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6555: $C3 $8B $7A

Data_01F_6558::
    dw   Data_01F_6569
    dw   Data_01F_656E
    dw   Data_01F_6573
    dw   Data_01F_6578
    dw   Data_01F_657D
    dw   Data_01F_6582

Data_01F_6564::
    db   $00, $40, $21, $80, $01

Data_01F_6569::
    db   $00, $50, $22, $80, $01

Data_01F_656E::
    db   $00, $60, $23, $80, $01

Data_01F_6573::
    db   $00, $70, $24, $80, $01

Data_01F_6578::
    db   $00, $80, $25, $80, $01

Data_01F_657D::
    db   $00, $90, $26, $80, $01

Data_01F_6582::
    db   $3C, $A0, $27, $C0, $01

func_01F_6587::
    ld   hl, Data_01F_65C2                        ; $6587: $21 $C2 $65
    jp   label_01F_79E9                           ; $658A: $C3 $E9 $79

func_01F_658D::
    call DecrementValueAtDE                       ; $658D: $CD $71 $7A
    ret  nz                                       ; $6590: $C0

    call IncrementValueAtBC                       ; $6591: $CD $75 $7A
    cp   $11                                      ; $6594: $FE $11
    jp   z, func_01F_7A07                         ; $6596: $CA $07 $7A

    ld   hl, Data_01F_65A2                        ; $6599: $21 $A2 $65
    call GetHandlerAddressInTable                 ; $659C: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $659F: $C3 $8B $7A

Data_01F_65A2::
    dw   Data_01F_65C7
    dw   Data_01F_65CC
    dw   Data_01F_65D1
    dw   Data_01F_65D6
    dw   Data_01F_65DB
    dw   Data_01F_65E0
    dw   Data_01F_65E5
    dw   Data_01F_65EA
    dw   Data_01F_65E5
    dw   Data_01F_65E0
    dw   Data_01F_65DB
    dw   Data_01F_65D6
    dw   Data_01F_65D1
    dw   Data_01F_65CC
    dw   Data_01F_65C7
    dw   Data_01F_65C2

Data_01F_65C2::
    db   $37, $10, $04, $C0, $02

Data_01F_65C7::
    db   $00, $20, $06, $80, $02

Data_01F_65CC::
    db   $00, $30, $14, $80, $02

Data_01F_65D1::
    db   $00, $40, $16, $80, $02

Data_01F_65D6::
    db   $00, $50, $24, $80, $02

Data_01F_65DB::
    db   $00, $60, $26, $80, $02

Data_01F_65E0::
    db   $00, $70, $34, $80, $02

Data_01F_65E5::
    db   $00, $80, $36, $80, $02

Data_01F_65EA::
    db   $00, $90, $44, $80, $02

func_01F_65EF::
    ld   hl, Data_01F_6610                        ; $65EF: $21 $10 $66
    jp   label_01F_79E9                           ; $65F2: $C3 $E9 $79

func_01F_65F5::
    call DecrementValueAtDE                       ; $65F5: $CD $71 $7A
    ret  nz                                       ; $65F8: $C0

    call IncrementValueAtBC                       ; $65F9: $CD $75 $7A
    cp   $04                                      ; $65FC: $FE $04
    jp   z, func_01F_7A07                         ; $65FE: $CA $07 $7A

    ld   hl, Data_01F_660A                        ; $6601: $21 $0A $66
    call GetHandlerAddressInTable                 ; $6604: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6607: $C3 $8B $7A

Data_01F_660A::
    dw   Data_01F_6615
    dw   Data_01F_6610
    dw   Data_01F_661A

Data_01F_6610::
    db   $3B, $C0, $3E, $C0, $01

Data_01F_6615::
    db   $33, $F0, $6E, $C0, $06

Data_01F_661A::
    db   $36, $70, $4E, $C0, $03

func_01F_661F::
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

    ld   hl, Data_01F_6659                        ; $6636: $21 $59 $66
    jp   label_01F_79E9                           ; $6639: $C3 $E9 $79

func_01F_663C::
    call DecrementValueAtDE                       ; $663C: $CD $71 $7A
    ret  nz                                       ; $663F: $C0

    call IncrementValueAtBC                       ; $6640: $CD $75 $7A
    cp   $05                                      ; $6643: $FE $05
    jp   z, func_01F_7A07                         ; $6645: $CA $07 $7A

    ld   hl, Data_01F_6651                        ; $6648: $21 $51 $66
    call GetHandlerAddressInTable                 ; $664B: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $664E: $C3 $8B $7A

Data_01F_6651::
    dw   Data_01F_665E
    dw   Data_01F_6663
    dw   Data_01F_6668
    dw   Data_01F_6668

Data_01F_6659::
    db   $30, $49, $60, $C0, $06

Data_01F_665E::
    db   $30, $49, $40, $C0, $06

Data_01F_6663::
    db   $30, $49, $20, $C0, $06

Data_01F_6668::
    db   $30, $49, $00, $C0, $06

func_01F_666D::
    ld   hl, Data_01F_668E                        ; $666D: $21 $8E $66
    jp   label_01F_79E9                           ; $6670: $C3 $E9 $79

func_01F_6673::
    call DecrementValueAtDE                       ; $6673: $CD $71 $7A
    ret  nz                                       ; $6676: $C0

    call IncrementValueAtBC                       ; $6677: $CD $75 $7A
    cp   $04                                      ; $667A: $FE $04
    jp   z, func_01F_7A07                         ; $667C: $CA $07 $7A

    ld   hl, Data_01F_6688                        ; $667F: $21 $88 $66
    call GetHandlerAddressInTable                 ; $6682: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6685: $C3 $8B $7A

Data_01F_6688::
    dw   Data_01F_6693
    dw   Data_01F_6698
    dw   Data_01F_669D

Data_01F_668E::
    db   $00, $61, $24, $80, $0C

Data_01F_6693::
    db   $00, $51, $25, $80, $0C

Data_01F_6698::
    db   $00, $32, $27, $80, $0C

Data_01F_669D::
    db   $00, $22, $34, $80, $0C

func_01F_66A2::
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

    ld   hl, Data_01F_66D6                        ; $66BE: $21 $D6 $66
    jp   label_01F_79E9                           ; $66C1: $C3 $E9 $79

func_01F_66C4::
    call DecrementValueAtDE                       ; $66C4: $CD $71 $7A
    ret  nz                                       ; $66C7: $C0

    call IncrementValueAtBC                       ; $66C8: $CD $75 $7A
    cp   $02                                      ; $66CB: $FE $02
    jp   z, func_01F_7A07                         ; $66CD: $CA $07 $7A

    ld   hl, Data_01F_66DB                        ; $66D0: $21 $DB $66
    jp   WriteChannel4AndDE                       ; $66D3: $C3 $8B $7A

Data_01F_66D6::
    db   $3B, $F0, $20, $C0, $02

Data_01F_66DB::
    db   $39, $40, $20, $C0, $08

func_01F_66E0::
    ld   a, [$D379]                               ; $66E0: $FA $79 $D3
    cp   $0C                                      ; $66E3: $FE $0C
    jp   z, label_01F_7A2C                        ; $66E5: $CA $2C $7A

    ld   a, $03                                   ; $66E8: $3E $03
    ld   [$D3BF], a                               ; $66EA: $EA $BF $D3
    ld   hl, Data_01F_6718                        ; $66ED: $21 $18 $67
    jp   label_01F_79E9                           ; $66F0: $C3 $E9 $79

func_01F_66F3::
    call DecrementValueAtDE                       ; $66F3: $CD $71 $7A
    ret  nz                                       ; $66F6: $C0

    call IncrementValueAtBC                       ; $66F7: $CD $75 $7A
    cp   $04                                      ; $66FA: $FE $04
    jr   z, @+$0B                                 ; $66FC: $28 $09

jr_01F_66FE:
    ld   hl, Data_01F_6712                        ; $66FE: $21 $12 $67
    call GetHandlerAddressInTable                 ; $6701: $CD $64 $7A
    jp   func_01F_7A25                            ; $6704: $C3 $25 $7A

jr_01F_6707:
    call func_01F_7AAC                            ; $6707: $CD $AC $7A
    jp   z, func_01F_7A07                         ; $670A: $CA $07 $7A

    ld   a, $01                                   ; $670D: $3E $01
    ld   [bc], a                                  ; $670F: $02
    jr   jr_01F_66FE                              ; $6710: $18 $EC

Data_01F_6712::
    dw   Data_01F_671D
    dw   Data_01F_6720
    dw   Data_01F_6723

Data_01F_6718::
    db   $00, $A3, $3C, $80, $03

Data_01F_671D::
    db   $3D, $00, $03

Data_01F_6720::
    db   $3E, $00, $03

Data_01F_6723::
    db   $3F, $00, $03

func_01F_6726::
    ld   hl, Data_01F_674F                        ; $6726: $21 $4F $67
    jp   label_01F_79E9                           ; $6729: $C3 $E9 $79

func_01F_672C::
    call DecrementValueAtDE                       ; $672C: $CD $71 $7A
    ret  nz                                       ; $672F: $C0

    ld   a, $33                                   ; $6730: $3E $33
    ldh  [rNR41], a                               ; $6732: $E0 $20
    call IncrementValueAtBC                       ; $6734: $CD $75 $7A
    cp   $06                                      ; $6737: $FE $06
    jp   z, func_01F_7A07                         ; $6739: $CA $07 $7A

    ld   hl, Data_01F_6745                        ; $673C: $21 $45 $67
    call GetHandlerAddressInTable                 ; $673F: $CD $64 $7A
    jp   func_01F_7A25                            ; $6742: $C3 $25 $7A

Data_01F_6745::
    dw   Data_01F_6754
    dw   Data_01F_6757
    dw   Data_01F_675A
    dw   Data_01F_675D
    dw   Data_01F_675D

Data_01F_674F::
    db   $33, $A0, $72, $C0, $04

Data_01F_6754::
    db   $52, $C0, $04

Data_01F_6757::
    db   $50, $C0, $04

Data_01F_675A::
    db   $30, $C0, $04

Data_01F_675D::
    db   $10, $C0, $04

func_01F_6760::
    ld   hl, Data_01F_6783                        ; $6760: $21 $83 $67
    jp   label_01F_79E9                           ; $6763: $C3 $E9 $79

func_01F_6766::
    call DecrementValueAtDE                       ; $6766: $CD $71 $7A
    ret  nz                                       ; $6769: $C0

    call IncrementValueAtBC                       ; $676A: $CD $75 $7A
    cp   $05                                      ; $676D: $FE $05
    jp   z, func_01F_7A07                         ; $676F: $CA $07 $7A

    ld   hl, Data_01F_677B                        ; $6772: $21 $7B $67
    call GetHandlerAddressInTable                 ; $6775: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6778: $C3 $8B $7A

Data_01F_677B::
    dw   Data_01F_6788
    dw   Data_01F_678D
    dw   Data_01F_6788
    dw   Data_01F_6783

Data_01F_6783::
    db   $37, $40, $47, $C0, $01

Data_01F_6788::
    db   $00, $60, $27, $80, $02

Data_01F_678D::
    db   $00, $A0, $15, $80, $02

func_01F_6792::
    ld   hl, Data_01F_67AA                        ; $6792: $21 $AA $67
    jp   label_01F_79E9                           ; $6795: $C3 $E9 $79

func_01F_6798::
    call DecrementValueAtDE                       ; $6798: $CD $71 $7A
    ret  nz                                       ; $679B: $C0

    call IncrementValueAtBC                       ; $679C: $CD $75 $7A
    cp   $02                                      ; $679F: $FE $02
    jp   z, func_01F_7A07                         ; $67A1: $CA $07 $7A

    ld   hl, Data_01F_67AF                        ; $67A4: $21 $AF $67
    jp   WriteChannel4AndDE                       ; $67A7: $C3 $8B $7A

Data_01F_67AA::
    db   $3C, $C0, $18, $C0, $01

Data_01F_67AF::
    db   $3C, $60, $18, $C0, $02

func_01F_67B4::
    ld   a, [$D379]                               ; $67B4: $FA $79 $D3
    cp   $02                                      ; $67B7: $FE $02
    jp   z, label_01F_7A2C                        ; $67B9: $CA $2C $7A

    cp   $03                                      ; $67BC: $FE $03
    jp   z, label_01F_7A2C                        ; $67BE: $CA $2C $7A

    ld   hl, Data_01F_67E4                        ; $67C1: $21 $E4 $67
    jp   label_01F_79E9                           ; $67C4: $C3 $E9 $79

func_01F_67C7::
    call DecrementValueAtDE                       ; $67C7: $CD $71 $7A
    ret  nz                                       ; $67CA: $C0

    call IncrementValueAtBC                       ; $67CB: $CD $75 $7A
    cp   $05                                      ; $67CE: $FE $05
    jp   z, func_01F_7A07                         ; $67D0: $CA $07 $7A

    ld   hl, Data_01F_67DC                        ; $67D3: $21 $DC $67
    call GetHandlerAddressInTable                 ; $67D6: $CD $64 $7A
    jp   func_01F_7A25                            ; $67D9: $C3 $25 $7A

Data_01F_67DC::
    dw   Data_01F_67E9
    dw   Data_01F_67EC
    dw   Data_01F_67EF
    dw   Data_01F_67F2

Data_01F_67E4::
    db   $00, $C6, $6A, $80, $04

Data_01F_67E9::
    db   $6B, $00, $05

Data_01F_67EC::
    db   $6C, $00, $06

Data_01F_67EF::
    db   $6D, $00, $07

Data_01F_67F2::
    db   $6E, $00, $38

func_01F_67F5::
    ld   a, $0E                                   ; $67F5: $3E $0E
    ld   [$D3BF], a                               ; $67F7: $EA $BF $D3
    ld   hl, Data_01F_6823                        ; $67FA: $21 $23 $68
    jp   label_01F_79E9                           ; $67FD: $C3 $E9 $79

func_01F_6800::
    call DecrementValueAtDE                       ; $6800: $CD $71 $7A
    ret  nz                                       ; $6803: $C0

    call IncrementValueAtBC                       ; $6804: $CD $75 $7A
    cp   $03                                      ; $6807: $FE $03
    jr   z, jr_01F_6814                           ; $6809: $28 $09

jr_01F_680B:
    ld   hl, Data_01F_681F                        ; $680B: $21 $1F $68
    call GetHandlerAddressInTable                 ; $680E: $CD $64 $7A
    jp   func_01F_7A25                            ; $6811: $C3 $25 $7A

jr_01F_6814:
    call func_01F_7AAC                            ; $6814: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $6817: $CA $01 $7A

    ld   a, $01                                   ; $681A: $3E $01
    ld   [bc], a                                  ; $681C: $02
    jr   jr_01F_680B                              ; $681D: $18 $EC

Data_01F_681F::
    dw   Data_01F_6828
    dw   Data_01F_682B

Data_01F_6823::
    db   $00, $67, $0F, $80, $02

Data_01F_6828::
    db   $60, $00, $02

Data_01F_682B::
    db   $0F, $00, $02

func_01F_682E::
    ld   hl, Data_01F_684D                        ; $682E: $21 $4D $68
    jp   label_01F_79E9                           ; $6831: $C3 $E9 $79

func_01F_6834::
    call DecrementValueAtDE                       ; $6834: $CD $71 $7A
    ret  nz                                       ; $6837: $C0

    call IncrementValueAtBC                       ; $6838: $CD $75 $7A
    cp   $03                                      ; $683B: $FE $03
    jp   z, func_01F_7A07                         ; $683D: $CA $07 $7A

    ld   hl, Data_01F_6849                        ; $6840: $21 $49 $68
    call GetHandlerAddressInTable                 ; $6843: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6846: $C3 $8B $7A

Data_01F_6849::
    dw   Data_01F_6852
    dw   Data_01F_6857

Data_01F_684D::
    db   $1E, $29, $46, $C0, $10

Data_01F_6852::
    db   $00, $29, $64, $80, $08

Data_01F_6857::
    db   $00, $81, $64, $80, $06

func_01F_685C::
    ld   a, [$D379]                               ; $685C: $FA $79 $D3
    and  a                                        ; $685F: $A7
    jp   nz, label_01F_7A2C                       ; $6860: $C2 $2C $7A

    ld   hl, Data_01F_6882                        ; $6863: $21 $82 $68
    jp   label_01F_79E9                           ; $6866: $C3 $E9 $79

func_01F_6869::
    call DecrementValueAtDE                       ; $6869: $CD $71 $7A
    ret  nz                                       ; $686C: $C0

    call IncrementValueAtBC                       ; $686D: $CD $75 $7A
    cp   $03                                      ; $6870: $FE $03
    jp   z, func_01F_7A07                         ; $6872: $CA $07 $7A

    ld   hl, Data_01F_687E                        ; $6875: $21 $7E $68
    call GetHandlerAddressInTable                 ; $6878: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $687B: $C3 $8B $7A

Data_01F_687E::
    dw   Data_01F_6887
    dw   Data_01F_688C

Data_01F_6882::
    db   $00, $0F, $30, $80, $20

Data_01F_6887::
    db   $00, $60, $03, $80, $30

Data_01F_688C::
    db   $00, $67, $03, $80, $20

func_01F_6891::
    ld   a, $03                                   ; $6891: $3E $03
    ld   [$D3BF], a                               ; $6893: $EA $BF $D3
    ld   hl, Data_01F_68D2                        ; $6896: $21 $D2 $68
    jp   label_01F_79E9                           ; $6899: $C3 $E9 $79

func_01F_689C::
    call DecrementValueAtDE                       ; $689C: $CD $71 $7A
    ret  nz                                       ; $689F: $C0

    call IncrementValueAtBC                       ; $68A0: $CD $75 $7A
    cp   $06                                      ; $68A3: $FE $06
    jr   z, jr_01F_68B0                           ; $68A5: $28 $09

    ld   hl, Data_01F_68C8                        ; $68A7: $21 $C8 $68
    call GetHandlerAddressInTable                 ; $68AA: $CD $64 $7A
    jp   func_01F_7A25                            ; $68AD: $C3 $25 $7A

jr_01F_68B0:
    call func_01F_7AAC                            ; $68B0: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $68B3: $CA $01 $7A

    cp   $01                                      ; $68B6: $FE $01
    jr   z, jr_01F_68C3                           ; $68B8: $28 $09

    ld   hl, Data_01F_68E6                        ; $68BA: $21 $E6 $68

jr_01F_68BD:
    ld   a, $01                                   ; $68BD: $3E $01
    ld   [bc], a                                  ; $68BF: $02
    jp   WriteChannel4AndDE                       ; $68C0: $C3 $8B $7A

jr_01F_68C3:
    ld   hl, Data_01F_68EB                        ; $68C3: $21 $EB $68
    jr   jr_01F_68BD                              ; $68C6: $18 $F5

Data_01F_68C8::
    dw   Data_01F_68D7
    dw   Data_01F_68DA
    dw   Data_01F_68DD
    dw   Data_01F_68E0
    dw   Data_01F_68E3

Data_01F_68D2::
    db   $00, $E0, $48, $80, $01

Data_01F_68D7::
    db   $4B, $00, $01

Data_01F_68DA::
    db   $5E, $00, $01

Data_01F_68DD::
    db   $5D, $00, $02

Data_01F_68E0::
    db   $6C, $00, $02

Data_01F_68E3::
    db   $6F, $00, $02

Data_01F_68E6::
    db   $00, $70, $4B, $80, $01

Data_01F_68EB::
    db   $00, $20, $4B, $80, $01

func_01F_68F0::
    ld   hl, Data_01F_68FD                        ; $68F0: $21 $FD $68
    jp   label_01F_79E9                           ; $68F3: $C3 $E9 $79

func_01F_68F6::
    call DecrementValueAtDE                       ; $68F6: $CD $71 $7A
    ret  nz                                       ; $68F9: $C0

    jp   func_01F_7A01                            ; $68FA: $C3 $01 $7A

Data_01F_68FD::
    db   $00, $F0, $A0, $80, $20

func_01F_6902::
    ld   hl, Data_01F_692B                        ; $6902: $21 $2B $69
    jp   label_01F_79E9                           ; $6905: $C3 $E9 $79

func_01F_6908::
    call DecrementValueAtDE                       ; $6908: $CD $71 $7A
    ret  nz                                       ; $690B: $C0

    call IncrementValueAtBC                       ; $690C: $CD $75 $7A
    cp   $08                                      ; $690F: $FE $08
    jp   z, func_01F_7A01                         ; $6911: $CA $01 $7A

    ld   hl, Data_01F_691D                        ; $6914: $21 $1D $69
    call GetHandlerAddressInTable                 ; $6917: $CD $64 $7A
    jp   func_01F_7A25                            ; $691A: $C3 $25 $7A

Data_01F_691D::
    dw   Data_01F_6930
    dw   Data_01F_6933
    dw   Data_01F_6936
    dw   Data_01F_6933
    dw   Data_01F_6930
    dw   Data_01F_6939
    dw   Data_01F_693C

Data_01F_692B::
    db   $00, $69, $B8, $80, $02

Data_01F_6930::
    db   $A8, $00, $02

Data_01F_6933::
    db   $98, $00, $02

Data_01F_6936::
    db   $88, $00, $02

Data_01F_6939::
    db   $B8, $00, $02

Data_01F_693C::
    db   $C8, $00, $02

func_01F_693F::
    ld   hl, Data_01F_699C                        ; $693F: $21 $9C $69
    jp   label_01F_79E9                           ; $6942: $C3 $E9 $79

func_01F_6945::
    call DecrementValueAtDE                       ; $6945: $CD $71 $7A
    ret  nz                                       ; $6948: $C0

    call IncrementValueAtBC                       ; $6949: $CD $75 $7A
    cp   $1A                                      ; $694C: $FE $1A
    jp   z, func_01F_7A07                         ; $694E: $CA $07 $7A

    ld   hl, Data_01F_696A                        ; $6951: $21 $6A $69
    call GetHandlerAddressInTable                 ; $6954: $CD $64 $7A
    ld   a, [$D398]                               ; $6957: $FA $98 $D3
    cp   $11                                      ; $695A: $FE $11
    jr   nc, jr_01F_6961                          ; $695C: $30 $03

    jp   WriteChannel4AndDE                       ; $695E: $C3 $8B $7A

jr_01F_6961:
    inc  hl                                       ; $6961: $23
    inc  hl                                       ; $6962: $23
    ld   a, $20                                   ; $6963: $3E $20
    ldh  [rNR42], a                               ; $6965: $E0 $21
    jp   func_01F_7A25                            ; $6967: $C3 $25 $7A

Data_01F_696A::
    dw   Data_01F_69A1
    dw   Data_01F_69A6
    dw   Data_01F_69AB
    dw   Data_01F_69B0
    dw   Data_01F_69B5
    dw   Data_01F_69BA
    dw   Data_01F_69BF
    dw   Data_01F_69C4
    dw   Data_01F_69BF
    dw   Data_01F_69BA
    dw   Data_01F_69B5
    dw   Data_01F_69B0
    dw   Data_01F_69AB
    dw   Data_01F_69A6
    dw   Data_01F_69A1
    dw   Data_01F_699C
    dw   Data_01F_69C4
    dw   Data_01F_69BF
    dw   Data_01F_69BA
    dw   Data_01F_69B5
    dw   Data_01F_69B0
    dw   Data_01F_69AB
    dw   Data_01F_69A6
    dw   Data_01F_69A1
    dw   Data_01F_699C

Data_01F_699C::
    db   $37, $20, $25, $C0, $01

Data_01F_69A1::
    db   $00, $40, $27, $80, $01

Data_01F_69A6::
    db   $00, $60, $35, $80, $01

Data_01F_69AB::
    db   $00, $80, $37, $80, $01

Data_01F_69B0::
    db   $00, $A0, $4D, $80, $02

Data_01F_69B5::
    db   $00, $B0, $4F, $80, $02

Data_01F_69BA::
    db   $00, $C0, $5D, $80, $02

Data_01F_69BF::
    db   $00, $D0, $5F, $80, $02

Data_01F_69C4::
    db   $00, $E0, $6D, $80, $02

func_01F_69C9::
    ld   hl, Data_01F_69EC                        ; $69C9: $21 $EC $69
    jp   label_01F_79E9                           ; $69CC: $C3 $E9 $79

func_01F_69CF::
    call IncrementValueAtBC                       ; $69CF: $CD $75 $7A
    cp   $07                                      ; $69D2: $FE $07
    jp   z, func_01F_7A07                         ; $69D4: $CA $07 $7A

    ld   hl, Data_01F_69E0                        ; $69D7: $21 $E0 $69
    call GetHandlerAddressInTable                 ; $69DA: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $69DD: $C3 $8B $7A

Data_01F_69E0::
    dw   Data_01F_69F1
    dw   Data_01F_69F6
    dw   Data_01F_69FB
    dw   Data_01F_6A00
    dw   Data_01F_6A05
    dw   Data_01F_6A0A

Data_01F_69EC::
    db   $00, $40, $5F, $80, $01

Data_01F_69F1::
    db   $00, $50, $5D, $80, $01

Data_01F_69F6::
    db   $00, $60, $4F, $80, $01

Data_01F_69FB::
    db   $00, $70, $4D, $80, $01

Data_01F_6A00::
    db   $00, $80, $3F, $80, $01

Data_01F_6A05::
    db   $00, $90, $3C, $80, $01

Data_01F_6A0A::
    db   $3C, $A0, $2E, $C0, $01

func_01F_6A0F::
    ld   hl, Data_01F_6A30                        ; $6A0F: $21 $30 $6A
    jp   label_01F_79E9                           ; $6A12: $C3 $E9 $79

func_01F_6A15::
    call IncrementValueAtBC                       ; $6A15: $CD $75 $7A
    cp   $06                                      ; $6A18: $FE $06
    jp   z, func_01F_7A07                         ; $6A1A: $CA $07 $7A

    ld   hl, Data_01F_6A26                        ; $6A1D: $21 $26 $6A
    call GetHandlerAddressInTable                 ; $6A20: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6A23: $C3 $8B $7A

Data_01F_6A26::
    dw   Data_01F_6A35
    dw   Data_01F_6A3A
    dw   Data_01F_6A3F
    dw   Data_01F_6A44
    dw   Data_01F_6A49

Data_01F_6A30::
    db   $00, $20, $47, $80, $02

Data_01F_6A35::
    db   $00, $40, $37, $80, $01

Data_01F_6A3A::
    db   $00, $60, $27, $80, $01

Data_01F_6A3F::
    db   $00, $80, $17, $80, $01

Data_01F_6A44::
    db   $00, $A0, $07, $80, $01

Data_01F_6A49::
    db   $3C, $C0, $03, $C0, $01

func_01F_6A4E::
    ld   a, [$D379]                               ; $6A4E: $FA $79 $D3
    cp   $03                                      ; $6A51: $FE $03
    jp   z, label_01F_7A2C                        ; $6A53: $CA $2C $7A

    ld   hl, Data_01F_6A71                        ; $6A56: $21 $71 $6A
    jp   label_01F_79E9                           ; $6A59: $C3 $E9 $79

func_01F_6A5C::
    call IncrementValueAtBC                       ; $6A5C: $CD $75 $7A
    cp   $03                                      ; $6A5F: $FE $03
    jp   z, func_01F_7A07                         ; $6A61: $CA $07 $7A

    ld   hl, Data_01F_6A6D                        ; $6A64: $21 $6D $6A
    call GetHandlerAddressInTable                 ; $6A67: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6A6A: $C3 $8B $7A

Data_01F_6A6D::
    dw   Data_01F_6A76
    dw   Data_01F_6A7B

Data_01F_6A71::
    db   $00, $29, $68, $80, $10

Data_01F_6A76::
    db   $3C, $C0, $50, $C0, $01

Data_01F_6A7B::
    db   $3C, $C1, $18, $C0, $01

func_01F_6A80::
    ld   hl, Data_01F_6A98                        ; $6A80: $21 $98 $6A
    jp   label_01F_79E9                           ; $6A83: $C3 $E9 $79

func_01F_6A86::
    call DecrementValueAtDE                       ; $6A86: $CD $71 $7A
    ret  nz                                       ; $6A89: $C0

    call IncrementValueAtBC                       ; $6A8A: $CD $75 $7A
    cp   $02                                      ; $6A8D: $FE $02
    jp   z, func_01F_7A07                         ; $6A8F: $CA $07 $7A

    ld   hl, Data_01F_6A9D                        ; $6A92: $21 $9D $6A
    jp   WriteChannel4AndDE                       ; $6A95: $C3 $8B $7A

Data_01F_6A98::
    db   $00, $F1, $09, $80, $0E

Data_01F_6A9D::
    db   $00, $62, $09, $80, $10

func_01F_6AA2::
    ld   hl, Data_01F_6AC9                        ; $6AA2: $21 $C9 $6A
    jp   label_01F_79E9                           ; $6AA5: $C3 $E9 $79

func_01F_6AA8::
    call DecrementValueAtDE                       ; $6AA8: $CD $71 $7A
    ret  nz                                       ; $6AAB: $C0

    call IncrementValueAtBC                       ; $6AAC: $CD $75 $7A
    cp   $07                                      ; $6AAF: $FE $07
    jp   z, func_01F_7A07                         ; $6AB1: $CA $07 $7A

    ld   hl, Data_01F_6ABD                        ; $6AB4: $21 $BD $6A
    call GetHandlerAddressInTable                 ; $6AB7: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6ABA: $C3 $8B $7A

Data_01F_6ABD::
    dw   Data_01F_6ACE
    dw   Data_01F_6AD3
    dw   Data_01F_6AD8
    dw   Data_01F_6ADD
    dw   Data_01F_6AE2
    dw   Data_01F_6AE7

Data_01F_6AC9::
    db   $00, $20, $11, $80, $01

Data_01F_6ACE::
    db   $00, $40, $21, $80, $01

Data_01F_6AD3::
    db   $00, $60, $39, $80, $01

Data_01F_6AD8::
    db   $00, $80, $49, $80, $01

Data_01F_6ADD::
    db   $00, $A0, $4B, $80, $01

Data_01F_6AE2::
    db   $00, $C0, $4D, $80, $01

Data_01F_6AE7::
    db   $3C, $E0, $4F, $C0, $01

func_01F_6AEC::
    ld   hl, Data_01F_6B1B                        ; $6AEC: $21 $1B $6B
    jp   label_01F_79E9                           ; $6AEF: $C3 $E9 $79

func_01F_6AF2::
    call DecrementValueAtDE                       ; $6AF2: $CD $71 $7A
    ret  nz                                       ; $6AF5: $C0

    call IncrementValueAtBC                       ; $6AF6: $CD $75 $7A
    cp   $0B                                      ; $6AF9: $FE $0B
    jp   z, func_01F_7A07                         ; $6AFB: $CA $07 $7A

    ld   hl, Data_01F_6B07                        ; $6AFE: $21 $07 $6B
    call GetHandlerAddressInTable                 ; $6B01: $CD $64 $7A
    jp   func_01F_7A25                            ; $6B04: $C3 $25 $7A

Data_01F_6B07::
    dw   Data_01F_6B20
    dw   Data_01F_6B23
    dw   Data_01F_6B26
    dw   Data_01F_6B29
    dw   Data_01F_6B2C
    dw   Data_01F_6B29
    dw   Data_01F_6B26
    dw   Data_01F_6B23
    dw   Data_01F_6B20
    dw   Data_01F_6B2F

Data_01F_6B1B::
    db   $00, $67, $2C, $80, $01

Data_01F_6B20::
    db   $3C, $00, $01

Data_01F_6B23::
    db   $4C, $00, $01

Data_01F_6B26::
    db   $5C, $00, $01

Data_01F_6B29::
    db   $6C, $00, $01

Data_01F_6B2C::
    db   $7C, $00, $01

Data_01F_6B2F::
    db   $09, $80, $30

func_01F_6B32::
    ld   hl, Data_01F_6B77                        ; $6B32: $21 $77 $6B
    jp   func_01F_79E4                            ; $6B35: $C3 $E4 $79

func_01F_6B38::
    call DecrementValueAtDE                       ; $6B38: $CD $71 $7A
    ret  nz                                       ; $6B3B: $C0

    call IncrementValueAtBC                       ; $6B3C: $CD $75 $7A
    cp   $16                                      ; $6B3F: $FE $16
    jp   z, func_01F_7A07                         ; $6B41: $CA $07 $7A

    ld   hl, Data_01F_6B4D                        ; $6B44: $21 $4D $6B
    call GetHandlerAddressInTable                 ; $6B47: $CD $64 $7A
    jp   func_01F_7A25                            ; $6B4A: $C3 $25 $7A

Data_01F_6B4D::
    dw   Data_01F_6B7C
    dw   Data_01F_6B7F
    dw   Data_01F_6B82
    dw   Data_01F_6B85
    dw   Data_01F_6B88
    dw   Data_01F_6B85
    dw   Data_01F_6B82
    dw   Data_01F_6B7F
    dw   Data_01F_6B82
    dw   Data_01F_6B85
    dw   Data_01F_6B88
    dw   Data_01F_6B8B
    dw   Data_01F_6B8E
    dw   Data_01F_6B8B
    dw   Data_01F_6B88
    dw   Data_01F_6B85
    dw   Data_01F_6B88
    dw   Data_01F_6B8B
    dw   Data_01F_6B8E
    dw   Data_01F_6B91
    dw   Data_01F_6B94

Data_01F_6B77::
    db   $00, $F7, $3D, $80, $04

Data_01F_6B7C::
    db   $60, $00, $04

Data_01F_6B7F::
    db   $61, $00, $04

Data_01F_6B82::
    db   $62, $00, $04

Data_01F_6B85::
    db   $63, $00, $04

Data_01F_6B88::
    db   $64, $00, $04

Data_01F_6B8B::
    db   $65, $00, $04

Data_01F_6B8E::
    db   $66, $00, $04

Data_01F_6B91::
    db   $67, $00, $04

Data_01F_6B94::
    db   $74, $00, $28

func_01F_6B97::
    ld   a, [$D379]                               ; $6B97: $FA $79 $D3
    and  a                                        ; $6B9A: $A7
    jp   nz, label_01F_7A2C                       ; $6B9B: $C2 $2C $7A

    ld   a, [$D3D6]                               ; $6B9E: $FA $D6 $D3
    and  a                                        ; $6BA1: $A7
    jr   nz, jr_01F_6BAA                          ; $6BA2: $20 $06

    ld   hl, Data_01F_6BF5                        ; $6BA4: $21 $F5 $6B

jr_01F_6BA7:
    jp   label_01F_79E9                           ; $6BA7: $C3 $E9 $79

jr_01F_6BAA:
    ld   hl, Data_01F_6C09                        ; $6BAA: $21 $09 $6C
    jr   jr_01F_6BA7                              ; $6BAD: $18 $F8

func_01F_6BAF::
    call DecrementValueAtDE                       ; $6BAF: $CD $71 $7A
    ret  nz                                       ; $6BB2: $C0

    call IncrementValueAtBC                       ; $6BB3: $CD $75 $7A
    cp   $03                                      ; $6BB6: $FE $03
    jr   z, jr_01F_6BD4                           ; $6BB8: $28 $1A

    cp   $06                                      ; $6BBA: $FE $06
    jp   z, label_01F_6BDD                        ; $6BBC: $CA $DD $6B

    ld   a, [$D3D6]                               ; $6BBF: $FA $D6 $D3
    and  a                                        ; $6BC2: $A7
    jr   nz, jr_01F_6BCF                          ; $6BC3: $20 $0A

jr_01F_6BC5:
    ld   hl, Data_01F_6BE7                        ; $6BC5: $21 $E7 $6B

jr_01F_6BC8:
    ld   a, [bc]                                  ; $6BC8: $0A
    call GetHandlerAddressInTable                 ; $6BC9: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $6BCC: $C3 $8B $7A

jr_01F_6BCF:
    ld   hl, Data_01F_6BF1                        ; $6BCF: $21 $F1 $6B
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
    jr   func_01F_6B97                            ; $6BE5: $18 $B0

Data_01F_6BE7::
    dw   Data_01F_6BFF
    dw   Data_01F_6BFA
    dw   Data_01F_6C04
    dw   Data_01F_6BFA
    dw   Data_01F_6C04

Data_01F_6BF1::
    db   $0E, $6C, $0E, $6C

Data_01F_6BF5::
    db   $37, $61, $30, $80, $03

Data_01F_6BFA::
    db   $37, $41, $14, $80, $03

Data_01F_6BFF::
    db   $37, $20, $30, $C0, $02

Data_01F_6C04::
    db   $37, $20, $14, $C0, $02

Data_01F_6C09::
    db   $37, $A1, $30, $80, $04, $37, $51, $14, $80, $04

func_01F_6C13::
    ld   a, $06                                   ; $6C13: $3E $06
    ld   [$D3BF], a                               ; $6C15: $EA $BF $D3
    ld   hl, Data_01F_6C41                        ; $6C18: $21 $41 $6C

jr_01F_6C1B:
    jp   label_01F_79E9                           ; $6C1B: $C3 $E9 $79

func_01F_6C1E::
    call DecrementValueAtDE                       ; $6C1E: $CD $71 $7A
    ret  nz                                       ; $6C21: $C0

    call IncrementValueAtBC                       ; $6C22: $CD $75 $7A
    cp   $03                                      ; $6C25: $FE $03
    jr   z, jr_01F_6C32                           ; $6C27: $28 $09

jr_01F_6C29:
    ld   hl, Data_01F_6C3D                        ; $6C29: $21 $3D $6C
    call GetHandlerAddressInTable                 ; $6C2C: $CD $64 $7A
    jp   func_01F_7A25                            ; $6C2F: $C3 $25 $7A

jr_01F_6C32:
    call func_01F_7AAC                            ; $6C32: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $6C35: $CA $01 $7A

    ld   a, $01                                   ; $6C38: $3E $01
    ld   [bc], a                                  ; $6C3A: $02
    jr   jr_01F_6C29                              ; $6C3B: $18 $EC

Data_01F_6C3D::
dw   Data_01F_6C46
    dw   Data_01F_6C49

Data_01F_6C41::
    db   $00, $C0, $58, $80, $02

Data_01F_6C46::
    db   $68, $80, $02

Data_01F_6C49::
    db   $58, $80, $02

func_01F_6C4C::
    ld   a, $78                                   ; $6C4C: $3E $78
    ld   [$D3BF], a                               ; $6C4E: $EA $BF $D3
    ld   hl, Data_01F_6C87                        ; $6C51: $21 $87 $6C
    jp   func_01F_79E4                            ; $6C54: $C3 $E4 $79

func_01F_6C57::
    call DecrementValueAtDE                       ; $6C57: $CD $71 $7A
    ret  nz                                       ; $6C5A: $C0

    call IncrementValueAtBC                       ; $6C5B: $CD $75 $7A
    cp   $03                                      ; $6C5E: $FE $03
    jr   z, jr_01F_6C6B                           ; $6C60: $28 $09

jr_01F_6C62:
    ld   hl, Data_01F_6C83                        ; $6C62: $21 $83 $6C
    call GetHandlerAddressInTable                 ; $6C65: $CD $64 $7A
    jp   func_01F_7A25                            ; $6C68: $C3 $25 $7A

jr_01F_6C6B:
    call func_01F_7AAC                            ; $6C6B: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $6C6E: $CA $01 $7A

    cp   $18                                      ; $6C71: $FE $18
    jr   z, jr_01F_6C7A                           ; $6C73: $28 $05

    ld   a, $01                                   ; $6C75: $3E $01
    ld   [bc], a                                  ; $6C77: $02
    jr   jr_01F_6C62                              ; $6C78: $18 $E8

jr_01F_6C7A:
    ld   a, $01                                   ; $6C7A: $3E $01
    ld   [bc], a                                  ; $6C7C: $02
    ld   hl, Data_01F_6C8C                        ; $6C7D: $21 $8C $6C
    jp   WriteChannel4AndDE                       ; $6C80: $C3 $8B $7A

Data_01F_6C83::
dw   Data_01F_6C91
    dw   Data_01F_6C94

Data_01F_6C87::
    db   $00, $2C, $7C, $80, $02

Data_01F_6C8C::
    db   $00, $F7, $7C, $80, $02

Data_01F_6C91::
    db   $7D, $00, $02

Data_01F_6C94::
    db   $7C, $00, $02

func_01F_6C97::
    ld   a, [$D379]                               ; $6C97: $FA $79 $D3
    and  a                                        ; $6C9A: $A7
    jp   nz, label_01F_7A2C                       ; $6C9B: $C2 $2C $7A

    ld   hl, Data_01F_6CBA                        ; $6C9E: $21 $BA $6C
    jp   label_01F_79E9                           ; $6CA1: $C3 $E9 $79

func_01F_6CA4::
    ld   a, [$C50E]                               ; $6CA4: $FA $0E $C5
    and  a                                        ; $6CA7: $A7
    jr   z, jr_01F_6CB1                           ; $6CA8: $28 $07

    call DecrementValueAtDE                       ; $6CAA: $CD $71 $7A
    ret  nz                                       ; $6CAD: $C0

    jp   func_01F_7A07                            ; $6CAE: $C3 $07 $7A

jr_01F_6CB1:
    ld   hl, Data_01F_6CBF                        ; $6CB1: $21 $BF $6C
    call WriteChannel4AndDE                       ; $6CB4: $CD $8B $7A
    jp   func_01F_7A07                            ; $6CB7: $C3 $07 $7A

Data_01F_6CBA::
    db   $08, $60, $00, $C0, $0C

Data_01F_6CBF::
    db   $00, $67, $00, $00, $20

func_01F_6CC4::
    ld   a, $14                                   ; $6CC4: $3E $14
    ld   [$D3BF], a                               ; $6CC6: $EA $BF $D3
    ld   hl, Data_01F_6CFB                        ; $6CC9: $21 $FB $6C
    jp   label_01F_79E9                           ; $6CCC: $C3 $E9 $79

func_01F_6CCF::
    call IncrementValueAtBC                       ; $6CCF: $CD $75 $7A
    cp   $03                                      ; $6CD2: $FE $03
    jr   z, jr_01F_6CDF                           ; $6CD4: $28 $09

jr_01F_6CD6:
    ld   hl, Data_01F_6CF7                        ; $6CD6: $21 $F7 $6C
    call GetHandlerAddressInTable                 ; $6CD9: $CD $64 $7A
    jp   func_01F_7A25                            ; $6CDC: $C3 $25 $7A

jr_01F_6CDF:
    call func_01F_7AAC                            ; $6CDF: $CD $AC $7A
    jp   z, func_01F_7A07                         ; $6CE2: $CA $07 $7A

    cp   $0E                                      ; $6CE5: $FE $0E
    jr   z, jr_01F_6CEE                           ; $6CE7: $28 $05

    ld   a, $01                                   ; $6CE9: $3E $01
    ld   [bc], a                                  ; $6CEB: $02
    jr   jr_01F_6CD6                              ; $6CEC: $18 $E8

jr_01F_6CEE:
    ld   a, $01                                   ; $6CEE: $3E $01
    ld   [bc], a                                  ; $6CF0: $02
    ld   hl, Data_01F_6D00                        ; $6CF1: $21 $00 $6D
    jp   WriteChannel4AndDE                       ; $6CF4: $C3 $8B $7A

Data_01F_6CF7::
    dw   Data_01F_6D05
    dw   Data_01F_6D08

Data_01F_6CFB::
    db   $00, $1A, $06, $80, $01

Data_01F_6D00::
    db   $00, $64, $06, $80, $01

Data_01F_6D05::
    db   $06, $00, $01

Data_01F_6D08::
    db   $48, $00, $01

func_01F_6D0B::
    ld   hl, Data_01F_6D2A                        ; $6D0B: $21 $2A $6D
    jp   label_01F_79E9                           ; $6D0E: $C3 $E9 $79

func_01F_6D11::
    call IncrementValueAtBC                       ; $6D11: $CD $75 $7A
    cp   $03                                      ; $6D14: $FE $03
    jr   z, jr_01F_6D21                           ; $6D16: $28 $09

jr_01F_6D18:
    ld   hl, Data_01F_6D26                        ; $6D18: $21 $26 $6D
    call GetHandlerAddressInTable                 ; $6D1B: $CD $64 $7A
    jp   func_01F_7A25                            ; $6D1E: $C3 $25 $7A

jr_01F_6D21:
    ld   a, $01                                   ; $6D21: $3E $01
    ld   [bc], a                                  ; $6D23: $02
    jr   jr_01F_6D18                              ; $6D24: $18 $F2

Data_01F_6D26::
    dw   Data_01F_6D2F
    dw   Data_01F_6D32

Data_01F_6D2A::
    db   $00, $50, $0B, $80, $01

Data_01F_6D2F::
    db   $0C, $00, $01

Data_01F_6D32::
    db   $0B, $00, $01

func_01F_6D35::
    ld   hl, Data_01F_6D60                        ; $6D35: $21 $60 $6D
    jp   func_01F_79E4                            ; $6D38: $C3 $E4 $79

func_01F_6D3B::
    call DecrementValueAtDE                       ; $6D3B: $CD $71 $7A
    ret  nz                                       ; $6D3E: $C0

    call IncrementValueAtBC                       ; $6D3F: $CD $75 $7A
    cp   $05                                      ; $6D42: $FE $05
    jp   z, func_01F_7A07                         ; $6D44: $CA $07 $7A

    ld   hl, Data_01F_6D58                        ; $6D47: $21 $58 $6D
    call GetHandlerAddressInTable                 ; $6D4A: $CD $64 $7A
    ld   a, [$D398]                               ; $6D4D: $FA $98 $D3
    cp   $01                                      ; $6D50: $FE $01
    jp   z, WriteChannel4AndDE                    ; $6D52: $CA $8B $7A

    jp   func_01F_7A25                            ; $6D55: $C3 $25 $7A

Data_01F_6D58::
    dw   Data_01F_6D65
    dw   Data_01F_6D6A
    dw   Data_01F_6D6D
    dw   Data_01F_6D70

Data_01F_6D60::
    db   $00, $0F, $60, $80, $38

Data_01F_6D65::
    db   $00, $F6, $60, $80, $0C

Data_01F_6D6A::
    db   $61, $00, $0C

Data_01F_6D6D::
    db   $62, $00, $0C

Data_01F_6D70::
    db   $63, $00, $38

func_01F_6D73::
    ld   hl, Data_01F_6D8B                        ; $6D73: $21 $8B $6D
    jp   func_01F_79E4                            ; $6D76: $C3 $E4 $79

func_01F_6D79::
    call DecrementValueAtDE                       ; $6D79: $CD $71 $7A
    ret  nz                                       ; $6D7C: $C0

    call IncrementValueAtBC                       ; $6D7D: $CD $75 $7A
    cp   $02                                      ; $6D80: $FE $02
    jp   z, func_01F_7A01                         ; $6D82: $CA $01 $7A

    ld   hl, Data_01F_6D90                        ; $6D85: $21 $90 $6D
    jp   WriteChannel4AndDE                       ; $6D88: $C3 $8B $7A

Data_01F_6D8B::
    db   $00, $0F, $A8, $80, $A0

Data_01F_6D90::
    db   $00, $F7, $A8, $80, $60

func_01F_6D95::
    ld   hl, Data_01F_6DAD                        ; $6D95: $21 $AD $6D
    jp   label_01F_79E9                           ; $6D98: $C3 $E9 $79

func_01F_6D9B::
    call DecrementValueAtDE                       ; $6D9B: $CD $71 $7A
    ret  nz                                       ; $6D9E: $C0

    call IncrementValueAtBC                       ; $6D9F: $CD $75 $7A
    cp   $02                                      ; $6DA2: $FE $02
    jp   z, func_01F_7A07                         ; $6DA4: $CA $07 $7A

    ld   hl, Data_01F_6DB2                        ; $6DA7: $21 $B2 $6D
    jp   WriteChannel4AndDE                       ; $6DAA: $C3 $8B $7A

Data_01F_6DAD::
    db   $00, $29, $07, $80, $08

Data_01F_6DB2::
    db   $00, $A7, $05, $80, $50

func_01F_6DB7::
    ld   hl, Data_01F_6E20                        ; $6DB7: $21 $20 $6E
    jp   func_01F_79E4                            ; $6DBA: $C3 $E4 $79

func_01F_6DBD::
    call DecrementValueAtDE                       ; $6DBD: $CD $71 $7A
    ret  nz                                       ; $6DC0: $C0

    call IncrementValueAtBC                       ; $6DC1: $CD $75 $7A
    cp   $24                                      ; $6DC4: $FE $24
    jp   z, func_01F_7A01                         ; $6DC6: $CA $01 $7A

    ld   hl, Data_01F_6DDA                        ; $6DC9: $21 $DA $6D
    call GetHandlerAddressInTable                 ; $6DCC: $CD $64 $7A
    ld   a, [$D398]                               ; $6DCF: $FA $98 $D3
    cp   $1E                                      ; $6DD2: $FE $1E
    jp   z, WriteChannel4AndDE                    ; $6DD4: $CA $8B $7A

    jp   func_01F_7A25                            ; $6DD7: $C3 $25 $7A

Data_01F_6DDA::
    dw   Data_01F_6E2B
    dw   Data_01F_6E2E
    dw   Data_01F_6E31
    dw   Data_01F_6E2E
    dw   Data_01F_6E2B
    dw   Data_01F_6E28
    dw   Data_01F_6E2B
    dw   Data_01F_6E2E
    dw   Data_01F_6E31
    dw   Data_01F_6E2E
    dw   Data_01F_6E2B
    dw   Data_01F_6E28
    dw   Data_01F_6E2B
    dw   Data_01F_6E31
    dw   Data_01F_6E34
    dw   Data_01F_6E31
    dw   Data_01F_6E2B
    dw   Data_01F_6E28
    dw   Data_01F_6E2B
    dw   Data_01F_6E31
    dw   Data_01F_6E34
    dw   Data_01F_6E31
    dw   Data_01F_6E2B
    dw   Data_01F_6E25
    dw   Data_01F_6E2B
    dw   Data_01F_6E2E
    dw   Data_01F_6E31
    dw   Data_01F_6E34
    dw   Data_01F_6E37
    dw   Data_01F_6E3A
    dw   Data_01F_6E3F
    dw   Data_01F_6E42
    dw   Data_01F_6E45
    dw   Data_01F_6E48
    dw   Data_01F_6E4B

Data_01F_6E20::
    db   $00, $F0, $8C, $80, $5C

Data_01F_6E25::
    db   $8C, $00, $08

Data_01F_6E28::
    db   $8C, $00, $0C

Data_01F_6E2B::
    db   $7E, $00, $04

Data_01F_6E2E::
    db   $7C, $00, $04

Data_01F_6E31::
    db   $6E, $00, $04

Data_01F_6E34::
    db   $6D, $00, $04

Data_01F_6E37::
    db   $6C, $00, $04

Data_01F_6E3A::
    db   $00, $F7, $6B, $80, $0C

Data_01F_6E3F::
    db   $6C, $00, $0C

Data_01F_6E42::
    db   $6D, $00, $0C

Data_01F_6E45::
    db   $6E, $00, $0C

Data_01F_6E48::
    db   $7C, $00, $0C

Data_01F_6E4B::
    db   $7E, $00, $34

func_01F_6E4E::
    ld   a, $40                                   ; $6E4E: $3E $40
    ld   [$D3BF], a                               ; $6E50: $EA $BF $D3
    ld   hl, Data_01F_6E7C                        ; $6E53: $21 $7C $6E
    jp   label_01F_79E9                           ; $6E56: $C3 $E9 $79

func_01F_6E59::
    call DecrementValueAtDE                       ; $6E59: $CD $71 $7A
    ret  nz                                       ; $6E5C: $C0

    call IncrementValueAtBC                       ; $6E5D: $CD $75 $7A

jr_01F_6E60:
    cp   $03                                      ; $6E60: $FE $03
    jr   z, jr_01F_6E6D                           ; $6E62: $28 $09

jr_01F_6E64:
    ld   hl, Data_01F_6E78                        ; $6E64: $21 $78 $6E
    call GetHandlerAddressInTable                 ; $6E67: $CD $64 $7A
    jp   func_01F_7A25                            ; $6E6A: $C3 $25 $7A

jr_01F_6E6D:
    call func_01F_7AAC                            ; $6E6D: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $6E70: $CA $01 $7A

    ld   a, $01                                   ; $6E73: $3E $01
    ld   [bc], a                                  ; $6E75: $02
    jr   jr_01F_6E64                              ; $6E76: $18 $EC

Data_01F_6E78::
    dw   Data_01F_6E81
    dw   Data_01F_6E84

Data_01F_6E7C::
    db   $00, $80, $3A, $80, $01

Data_01F_6E81::
    db   $39, $80, $02

Data_01F_6E84::
    db   $3A, $80, $01

func_01F_6E87::
    ld   hl, Data_01F_6EBA                        ; $6E87: $21 $BA $6E
    jp   label_01F_79E9                           ; $6E8A: $C3 $E9 $79

func_01F_6E8D::
    call DecrementValueAtDE                       ; $6E8D: $CD $71 $7A
    ret  nz                                       ; $6E90: $C0

    call IncrementValueAtBC                       ; $6E91: $CD $75 $7A
    cp   $0D                                      ; $6E94: $FE $0D
    jp   z, func_01F_7A07                         ; $6E96: $CA $07 $7A

    ld   hl, Data_01F_6EA2                        ; $6E99: $21 $A2 $6E
    call GetHandlerAddressInTable                 ; $6E9C: $CD $64 $7A
    jp   func_01F_7A25                            ; $6E9F: $C3 $25 $7A

Data_01F_6EA2::
    dw   Data_01F_6EBF
    dw   Data_01F_6EC2
    dw   Data_01F_6EC5
    dw   Data_01F_6EC2
    dw   Data_01F_6EBF
    dw   Data_01F_6EC8
    dw   Data_01F_6ECB
    dw   Data_01F_6ECE
    dw   Data_01F_6ED1
    dw   Data_01F_6ED4
    dw   Data_01F_6ED7
    dw   Data_01F_6EDA

Data_01F_6EBA::
    db   $00, $C2, $5D, $80, $01

Data_01F_6EBF::
    db   $5C, $00, $01

Data_01F_6EC2::
    db   $4F, $00, $01

Data_01F_6EC5::
    db   $4E, $00, $01

Data_01F_6EC8::
    db   $5D, $00, $01

Data_01F_6ECB::
    db   $5E, $00, $01

Data_01F_6ECE::
    db   $5F, $00, $01

Data_01F_6ED1::
    db   $6C, $00, $01

Data_01F_6ED4::
    db   $6D, $00, $01

Data_01F_6ED7::
    db   $6E, $00, $01

Data_01F_6EDA::
    db   $6F, $00, $10

func_01F_6EDD::
    ld   a, $05                                   ; $6EDD: $3E $05
    ld   [$D3BF], a                               ; $6EDF: $EA $BF $D3
    ld   hl, Data_01F_6F1D                        ; $6EE2: $21 $1D $6F
    jp   label_01F_79E9                           ; $6EE5: $C3 $E9 $79

func_01F_6EE8::
    call DecrementValueAtDE                       ; $6EE8: $CD $71 $7A
    ret  nz                                       ; $6EEB: $C0

    call IncrementValueAtBC                       ; $6EEC: $CD $75 $7A
    cp   $0C                                      ; $6EEF: $FE $0C
    jr   z, jr_01F_6EFC                           ; $6EF1: $28 $09

jr_01F_6EF3:
    ld   hl, Data_01F_6F07                        ; $6EF3: $21 $07 $6F
    call GetHandlerAddressInTable                 ; $6EF6: $CD $64 $7A
    jp   func_01F_7A25                            ; $6EF9: $C3 $25 $7A

jr_01F_6EFC:
    call func_01F_7AAC                            ; $6EFC: $CD $AC $7A
    jp   z, func_01F_7A07                         ; $6EFF: $CA $07 $7A

    ld   a, $04                                   ; $6F02: $3E $04
    ld   [bc], a                                  ; $6F04: $02
    jr   jr_01F_6EF3                              ; $6F05: $18 $EC

Data_01F_6F07::
    dw   Data_01F_6F25
    dw   Data_01F_6F28
    dw   Data_01F_6F2B
    dw   Data_01F_6F2E
    dw   Data_01F_6F2B
    dw   Data_01F_6F28
    dw   Data_01F_6F25
    dw   Data_01F_6F22
    dw   Data_01F_6F25
    dw   Data_01F_6F28
    dw   Data_01F_6F2B

Data_01F_6F1D::
    db   $00, $67, $6C, $80, $01

Data_01F_6F22::
    db   $6C, $00, $01

Data_01F_6F25::
    db   $6B, $00, $01

Data_01F_6F28::
    db   $6A, $00, $01

Data_01F_6F2B::
    db   $69, $00, $01

Data_01F_6F2E::
    db   $68, $00, $02

func_01F_6F31::
    ld   a, $05                                   ; $6F31: $3E $05
    ld   [$D3BF], a                               ; $6F33: $EA $BF $D3
    ld   hl, Data_01F_6F67                        ; $6F36: $21 $67 $6F
    jp   func_01F_79E4                            ; $6F39: $C3 $E4 $79

func_01F_6F3C::
    call DecrementValueAtDE                       ; $6F3C: $CD $71 $7A
    ret  nz                                       ; $6F3F: $C0

    call IncrementValueAtBC                       ; $6F40: $CD $75 $7A
    cp   $07                                      ; $6F43: $FE $07
    jr   z, jr_01F_6F50                           ; $6F45: $28 $09

jr_01F_6F47:
    ld   hl, Data_01F_6F5B                        ; $6F47: $21 $5B $6F
    call GetHandlerAddressInTable                 ; $6F4A: $CD $64 $7A
    jp   func_01F_7A25                            ; $6F4D: $C3 $25 $7A

jr_01F_6F50:
    call func_01F_7AAC                            ; $6F50: $CD $AC $7A
    jp   z, func_01F_7A07                         ; $6F53: $CA $07 $7A

    ld   a, $01                                   ; $6F56: $3E $01
    ld   [bc], a                                  ; $6F58: $02
    jr   jr_01F_6F47                              ; $6F59: $18 $EC

Data_01F_6F5B::
    dw   Data_01F_6F6C
    dw   Data_01F_6F6F
    dw   Data_01F_6F6C
    dw   Data_01F_6F72
    dw   Data_01F_6F6C
    dw   Data_01F_6F75

Data_01F_6F67::
    db   $00, $F4, $68, $80, $02

Data_01F_6F6C::
    db   $6F, $00, $02

Data_01F_6F6F::
    db   $69, $00, $02

Data_01F_6F72::
    db   $6A, $00, $02

Data_01F_6F75::
    db   $68, $00, $02

func_01F_6F78::
    ld   a, $08                                   ; $6F78: $3E $08

jr_01F_6F7A:
    ld   [$D3BF], a                               ; $6F7A: $EA $BF $D3
    ld   hl, Data_01F_6FBE                        ; $6F7D: $21 $BE $6F
    jp   func_01F_79E4                            ; $6F80: $C3 $E4 $79

func_01F_6F83::
    call DecrementValueAtDE                       ; $6F83: $CD $71 $7A
    ret  nz                                       ; $6F86: $C0

    call IncrementValueAtBC                       ; $6F87: $CD $75 $7A

jr_01F_6F8A:
    cp   $0A                                      ; $6F8A: $FE $0A
    jr   z, jr_01F_6F9F                           ; $6F8C: $28 $11

jr_01F_6F8E:
    ld   hl, Data_01F_6FAA                        ; $6F8E: $21 $AA $6F
    call GetHandlerAddressInTable                 ; $6F91: $CD $64 $7A
    ld   a, [$D398]                               ; $6F94: $FA $98 $D3
    cp   $01                                      ; $6F97: $FE $01
    jp   z, WriteChannel4AndDE                    ; $6F99: $CA $8B $7A

    jp   func_01F_7A25                            ; $6F9C: $C3 $25 $7A

jr_01F_6F9F:
    call func_01F_7AAC                            ; $6F9F: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $6FA2: $CA $01 $7A

    ld   a, $02                                   ; $6FA5: $3E $02
    ld   [bc], a                                  ; $6FA7: $02
    jr   jr_01F_6F8E                              ; $6FA8: $18 $E4

Data_01F_6FAA::
    dw   Data_01F_6FC3
    dw   Data_01F_6FC8
    dw   Data_01F_6FCE
    dw   Data_01F_6FD4
    dw   Data_01F_6FDA
    dw   Data_01F_6FD7
    dw   Data_01F_6FD4
    dw   Data_01F_6FD1
    dw   Data_01F_6FCE
    dw   Data_01F_6FCB

Data_01F_6FBE::
    db   $00, $C0, $7F, $80, $88

Data_01F_6FC3::
    db   $00, $F4, $6D, $80, $01

Data_01F_6FC8::
    db   $74, $00, $01

Data_01F_6FCB::
    db   $5F, $00, $01

Data_01F_6FCE::
    db   $66, $00, $01

Data_01F_6FD1::
    db   $5D, $00, $01

Data_01F_6FD4::
    db   $64, $00, $01

Data_01F_6FD7::
    db   $4F, $00, $01

Data_01F_6FDA::
    db   $62, $00, $01

func_01F_6FDD::
    ld   hl, Data_01F_6FEA                        ; $6FDD: $21 $EA $6F
    jp   label_01F_79E9                           ; $6FE0: $C3 $E9 $79

func_01F_6FE3::
    call DecrementValueAtDE                       ; $6FE3: $CD $71 $7A
    ret  nz                                       ; $6FE6: $C0

    jp   func_01F_7A07                            ; $6FE7: $C3 $07 $7A

Data_01F_6FEA::
    db   $00, $F4, $7D, $80, $40

func_01F_6FEF::
    ld   hl, Data_01F_7038                        ; $6FEF: $21 $38 $70
    jp   label_01F_79E9                           ; $6FF2: $C3 $E9 $79

func_01F_6FF5::
    call DecrementValueAtDE                       ; $6FF5: $CD $71 $7A
    ret  nz                                       ; $6FF8: $C0

    call IncrementValueAtBC                       ; $6FF9: $CD $75 $7A
    cp   $14                                      ; $6FFC: $FE $14
    jp   z, func_01F_7A01                         ; $6FFE: $CA $01 $7A

    ld   hl, Data_01F_7012                        ; $7001: $21 $12 $70
    call GetHandlerAddressInTable                 ; $7004: $CD $64 $7A
    ld   a, [$D398]                               ; $7007: $FA $98 $D3
    cp   $13                                      ; $700A: $FE $13
    jp   z, WriteChannel4AndDE                    ; $700C: $CA $8B $7A

    jp   func_01F_7A25                            ; $700F: $C3 $25 $7A

Data_01F_7012::
    dw   Data_01F_703D
    dw   Data_01F_7040
    dw   Data_01F_7043
    dw   Data_01F_7046
    dw   Data_01F_7049
    dw   Data_01F_704C
    dw   Data_01F_704F
    dw   Data_01F_7052
    dw   Data_01F_7055
    dw   Data_01F_7058
    dw   Data_01F_705B
    dw   Data_01F_705E
    dw   Data_01F_7061
    dw   Data_01F_7064
    dw   Data_01F_7067
    dw   Data_01F_706A
    dw   Data_01F_706D
    dw   Data_01F_7070
    dw   Data_01F_7073

Data_01F_7038::
    db   $26, $40, $37, $80, $06

Data_01F_703D::
    db   $36, $80, $06

Data_01F_7040::
    db   $35, $80, $06

Data_01F_7043::
    db   $34, $80, $06

Data_01F_7046::
    db   $27, $80, $06

Data_01F_7049::
    db   $26, $80, $06

Data_01F_704C::
    db   $25, $80, $06

Data_01F_704F::
    db   $24, $80, $06

Data_01F_7052::
    db   $17, $80, $06

Data_01F_7055::
    db   $16, $80, $06

Data_01F_7058::
    db   $15, $80, $06

Data_01F_705B::
    db   $14, $80, $06

Data_01F_705E::
    db   $07, $80, $06

Data_01F_7061::
    db   $06, $00, $06

Data_01F_7064::
    db   $05, $00, $06

Data_01F_7067::
    db   $04, $00, $06

Data_01F_706A::
    db   $03, $00, $06

Data_01F_706D::
    db   $02, $00, $06

Data_01F_7070::
    db   $01, $00, $06

Data_01F_7073::
    db   $00, $47, $00, $80, $20

func_01F_7078::
    ld   hl, Data_01F_70A1                        ; $7078: $21 $A1 $70
    jp   label_01F_79E9                           ; $707B: $C3 $E9 $79

func_01F_707E::
    call DecrementValueAtDE                       ; $707E: $CD $71 $7A
    ret  nz                                       ; $7081: $C0

    call IncrementValueAtBC                       ; $7082: $CD $75 $7A
    cp   $08                                      ; $7085: $FE $08
    jp   z, func_01F_7A07                         ; $7087: $CA $07 $7A

    ld   hl, Data_01F_7093                        ; $708A: $21 $93 $70
    call GetHandlerAddressInTable                 ; $708D: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7090: $C3 $8B $7A

Data_01F_7093::
    dw    Data_01F_70A6
    dw    Data_01F_70AB
    dw    Data_01F_70B0
    dw    Data_01F_70B5
    dw    Data_01F_70BA
    dw    Data_01F_70AB
    dw    Data_01F_70BF

Data_01F_70A1::
    db   $26, $29, $40, $C0, $04

Data_01F_70A6::
    db   $26, $10, $40, $C0, $02

Data_01F_70AB::
    db   $26, $29, $10, $C0, $04

Data_01F_70B0::
    db   $26, $10, $10, $C0, $02

Data_01F_70B5::
    db   $26, $19, $60, $C0, $04

Data_01F_70BA::
    db   $26, $10, $60, $C0, $02

Data_01F_70BF::
    db   $26, $10, $10, $C0, $03

func_01F_70C4::
    ld   a, $08                                   ; $70C4: $3E $08
    ld   [$D3BF], a                               ; $70C6: $EA $BF $D3
    ld   hl, Data_01F_710C                        ; $70C9: $21 $0C $71
    jp   func_01F_79E4                            ; $70CC: $C3 $E4 $79

func_01F_70CF::
    call DecrementValueAtDE                       ; $70CF: $CD $71 $7A
    ret  nz                                       ; $70D2: $C0

    call IncrementValueAtBC                       ; $70D3: $CD $75 $7A
    cp   $0C                                      ; $70D6: $FE $0C
    jr   z, jr_01F_70EB                           ; $70D8: $28 $11

jr_01F_70DA:
    ld   hl, Data_01F_70F6                        ; $70DA: $21 $F6 $70
    call GetHandlerAddressInTable                 ; $70DD: $CD $64 $7A
    ld   a, [$D398]                               ; $70E0: $FA $98 $D3
    cp   $02                                      ; $70E3: $FE $02
    jp   z, WriteChannel4AndDE                    ; $70E5: $CA $8B $7A

    jp   func_01F_7A25                            ; $70E8: $C3 $25 $7A

jr_01F_70EB:
    call func_01F_7AAC                            ; $70EB: $CD $AC $7A
    jp   z, func_01F_7A01                         ; $70EE: $CA $01 $7A

    ld   a, $03                                   ; $70F1: $3E $03
    ld   [bc], a                                  ; $70F3: $02
    jr   jr_01F_70DA                              ; $70F4: $18 $E4

Data_01F_70F6::
    dw    Data_01F_7111
    dw    Data_01F_6FC3
    dw    Data_01F_6FC8
    dw    Data_01F_6FCE
    dw    Data_01F_6FD4
    dw    Data_01F_6FDA
    dw    Data_01F_6FD7
    dw    Data_01F_6FD4
    dw    Data_01F_6FD1
    dw    Data_01F_6FCE
    dw    Data_01F_6FCB

Data_01F_710C::
    db   $00, $C0, $7F, $80, $FF

Data_01F_7111::
    db   $7F, $80, $34

func_01F_7114::
    ld   hl, Data_01F_712C                        ; $7114: $21 $2C $71
    jp   label_01F_79E9                           ; $7117: $C3 $E9 $79

func_01F_711A::
    call DecrementValueAtDE                       ; $711A: $CD $71 $7A
    ret  nz                                       ; $711D: $C0

    call IncrementValueAtBC                       ; $711E: $CD $75 $7A
    cp   $02                                      ; $7121: $FE $02
    jp   z, func_01F_7A01                         ; $7123: $CA $01 $7A

    ld   hl, Data_01F_7131                        ; $7126: $21 $31 $71
    jp   WriteChannel4AndDE                       ; $7129: $C3 $8B $7A

Data_01F_712C::
    db   $00, $19, $50, $80, $06

Data_01F_7131::
    db   $00, $65, $50, $80, $20

func_01F_7136::
    ld   hl, Data_01F_7195                        ; $7136: $21 $95 $71
    jp   label_01F_79E9                           ; $7139: $C3 $E9 $79

func_01F_713C::
    call DecrementValueAtDE                       ; $713C: $CD $71 $7A
    ret  nz                                       ; $713F: $C0

    call IncrementValueAtBC                       ; $7140: $CD $75 $7A
    cp   $23                                      ; $7143: $FE $23
    jp   z, func_01F_7A07                         ; $7145: $CA $07 $7A

    ld   hl, Data_01F_7151                        ; $7148: $21 $51 $71
    call GetHandlerAddressInTable                 ; $714B: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $714E: $C3 $8B $7A

Data_01F_7151::
    dw    Data_01F_719A
    dw    Data_01F_71BD
    dw    Data_01F_719F
    dw    Data_01F_71BD
    dw    Data_01F_71A4
    dw    Data_01F_71BD
    dw    Data_01F_71A9
    dw    Data_01F_71BD
    dw    Data_01F_71A9
    dw    Data_01F_71BD
    dw    Data_01F_71AE
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2
    dw    Data_01F_71B8
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2
    dw    Data_01F_71AE
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2
    dw    Data_01F_71B8
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2
    dw    Data_01F_71AE
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2
    dw    Data_01F_71B8
    dw    Data_01F_71C2
    dw    Data_01F_71B3
    dw    Data_01F_71C2

Data_01F_7195::
    db   $00, $1C, $60, $80, $18

Data_01F_719A::
    db   $00, $19, $50, $80, $0A

Data_01F_719F::
    db   $00, $19, $30, $80, $09

Data_01F_71A4::
    db   $00, $19, $40, $80, $07

Data_01F_71A9::
    db   $00, $19, $50, $80, $06

Data_01F_71AE::
    db   $00, $19, $60, $80, $06

Data_01F_71B3::
    db   $00, $19, $60, $80, $04

Data_01F_71B8::
    db   $00, $19, $50, $80, $02

Data_01F_71BD::
    db   $37, $40, $20, $C0, $02

Data_01F_71C2::
    db   $37, $20, $20, $C0, $02

func_01F_71C7::
    ld   hl, Data_01F_7216                        ; $71C7: $21 $16 $72
    jp   func_01F_79E4                            ; $71CA: $C3 $E4 $79

func_01F_71CD::
    call DecrementValueAtDE                       ; $71CD: $CD $71 $7A
    ret  nz                                       ; $71D0: $C0

    call IncrementValueAtBC                       ; $71D1: $CD $75 $7A
    cp   $1B                                      ; $71D4: $FE $1B
    jp   z, func_01F_7A01                         ; $71D6: $CA $01 $7A

    ld   hl, Data_01F_71E2                        ; $71D9: $21 $E2 $71
    call GetHandlerAddressInTable                 ; $71DC: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $71DF: $C3 $8B $7A

Data_01F_71E2::
    dw    Data_01F_721B
    dw    Data_01F_71BD
    dw    Data_01F_7220
    dw    Data_01F_71BD
    dw    Data_01F_7225
    dw    Data_01F_71BD
    dw    Data_01F_722A
    dw    Data_01F_71BD
    dw    Data_01F_722A
    dw    Data_01F_71BD
    dw    Data_01F_722F
    dw    Data_01F_71C2
    dw    Data_01F_7234
    dw    Data_01F_71C2
    dw    Data_01F_7239
    dw    Data_01F_71C2
    dw    Data_01F_7234
    dw    Data_01F_71C2
    dw    Data_01F_722F
    dw    Data_01F_71C2
    dw    Data_01F_7234
    dw    Data_01F_71C2
    dw    Data_01F_7239
    dw    Data_01F_71C2
    dw    Data_01F_7234
    dw    Data_01F_71C2

Data_01F_7216::
    db   $00, $00, $00, $80, $20

Data_01F_721B::
    db   $00, $19, $27, $80, $0A

Data_01F_7220::
    db   $00, $19, $26, $80, $09

Data_01F_7225::
    db   $00, $19, $24, $80, $08

Data_01F_722A::
    db   $00, $19, $23, $80, $07

Data_01F_722F::
    db   $00, $19, $17, $80, $06

Data_01F_7234::
    db   $00, $19, $17, $80, $04

Data_01F_7239::
    db   $00, $19, $16, $80, $02

func_01F_723E::
    ld   hl, Data_01F_726D                        ; $723E: $21 $6D $72
    jp   label_01F_79E9                           ; $7241: $C3 $E9 $79

func_01F_7244::
    call DecrementValueAtDE                       ; $7244: $CD $71 $7A
    ret  nz                                       ; $7247: $C0

    call IncrementValueAtBC                       ; $7248: $CD $75 $7A
    cp   $0B                                      ; $724B: $FE $0B
    jp   z, func_01F_7A07                         ; $724D: $CA $07 $7A

    ld   hl, Data_01F_7259                        ; $7250: $21 $59 $72
    call GetHandlerAddressInTable                 ; $7253: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7256: $C3 $8B $7A

Data_01F_7259::
    dw   Data_01F_7272
    dw   Data_01F_7277
    dw   Data_01F_727C
    dw   Data_01F_7277
    dw   Data_01F_7272
    dw   Data_01F_726D
    dw   Data_01F_7290
    dw   Data_01F_728B
    dw   Data_01F_7286
    dw   Data_01F_7281

Data_01F_726D::
    db   $00, $20, $30, $80, $02

Data_01F_7272::
    db   $00, $40, $40, $80, $03

Data_01F_7277::
    db   $00, $80, $50, $80, $04

Data_01F_727C::
    db   $00, $C0, $60, $80, $05

Data_01F_7281::
    db   $37, $10, $30, $C0, $02

Data_01F_7286::
    db   $00, $10, $40, $80, $03

Data_01F_728B::
    db   $00, $10, $50, $80, $04

Data_01F_7290::
    db   $00, $10, $60, $80, $05

func_01F_7295::
    ld   hl, Data_01F_72CE                        ; $7295: $21 $CE $72
    jp   label_01F_79E9                           ; $7298: $C3 $E9 $79

func_01F_729B::
    call DecrementValueAtDE                       ; $729B: $CD $71 $7A
    ret  nz                                       ; $729E: $C0

    call IncrementValueAtBC                       ; $729F: $CD $75 $7A
    cp   $0C                                      ; $72A2: $FE $0C
    jp   z, func_01F_7A01                         ; $72A4: $CA $01 $7A

    ld   hl, Data_01F_72B8                        ; $72A7: $21 $B8 $72
    call GetHandlerAddressInTable                 ; $72AA: $CD $64 $7A
    ld   a, [$D398]                               ; $72AD: $FA $98 $D3
    cp   $06                                      ; $72B0: $FE $06
    jp   z, WriteChannel4AndDE                    ; $72B2: $CA $8B $7A

    jp   func_01F_7A25                            ; $72B5: $C3 $25 $7A

Data_01F_72B8::
    dw   Data_01F_72D6
    dw   Data_01F_72D3
    dw   Data_01F_72D9
    dw   Data_01F_72D6
    dw   Data_01F_72DC
    dw   Data_01F_72DF
    dw   Data_01F_72D6
    dw   Data_01F_72D3
    dw   Data_01F_72D9
    dw   Data_01F_72D6
    dw   Data_01F_72DC

Data_01F_72CE::
    db   $00, $80, $48, $80, $02

Data_01F_72D3::
    db   $49, $80, $02

Data_01F_72D6::
    db   $4A, $80, $02

Data_01F_72D9::
    db   $4B, $80, $02

Data_01F_72DC::
    db   $4C, $80, $02

Data_01F_72DF::
    db   $00, $20, $48, $80, $02

func_01F_72E4::
    ld   a, $2B                                   ; $72E4: $3E $2B
    ld   [$D3DF], a                               ; $72E6: $EA $DF $D3
    ld   a, $15                                   ; $72E9: $3E $15
    ld   [$D3E0], a                               ; $72EB: $EA $E0 $D3
    ld   hl, Data_01F_7415                        ; $72EE: $21 $15 $74
    jp   label_01F_79E9                           ; $72F1: $C3 $E9 $79

func_01F_72F4::
    call DecrementValueAtDE                       ; $72F4: $CD $71 $7A
    ret  nz                                       ; $72F7: $C0

    call IncrementValueAtBC                       ; $72F8: $CD $75 $7A
    cp   $05                                      ; $72FB: $FE $05
    jr   z, jr_01F_733B                           ; $72FD: $28 $3C

    cp   $0D                                      ; $72FF: $FE $0D
    jr   z, jr_01F_7363                           ; $7301: $28 $60

    cp   $1A                                      ; $7303: $FE $1A
    jr   z, jr_01F_734A                           ; $7305: $28 $43

    cp   $52                                      ; $7307: $FE $52
    jp   z, func_01F_7A01                         ; $7309: $CA $01 $7A

jr_01F_730C:
    ld   hl, Data_01F_7373                        ; $730C: $21 $73 $73
    call GetHandlerAddressInTable                 ; $730F: $CD $64 $7A
    ld   a, [$D398]                               ; $7312: $FA $98 $D3
    cp   $1A                                      ; $7315: $FE $1A
    jp   z, WriteChannel4AndDE                    ; $7317: $CA $8B $7A

    cp   $22                                      ; $731A: $FE $22
    jp   z, WriteChannel4AndDE                    ; $731C: $CA $8B $7A

    cp   $2A                                      ; $731F: $FE $2A
    jp   z, WriteChannel4AndDE                    ; $7321: $CA $8B $7A

    cp   $32                                      ; $7324: $FE $32
    jp   z, WriteChannel4AndDE                    ; $7326: $CA $8B $7A

    cp   $3A                                      ; $7329: $FE $3A
    jp   z, WriteChannel4AndDE                    ; $732B: $CA $8B $7A

    cp   $42                                      ; $732E: $FE $42
    jp   z, WriteChannel4AndDE                    ; $7330: $CA $8B $7A

    cp   $4A                                      ; $7333: $FE $4A
    jp   z, WriteChannel4AndDE                    ; $7335: $CA $8B $7A

    jp   func_01F_7A25                            ; $7338: $C3 $25 $7A

jr_01F_733B:
    push de                                       ; $733B: $D5
    ld   de, $D3DF                                ; $733C: $11 $DF $D3
    call DecrementValueAtDE                       ; $733F: $CD $71 $7A
    pop  de                                       ; $7342: $D1
    jr   z, jr_01F_7359                           ; $7343: $28 $14

    ld   a, $01                                   ; $7345: $3E $01
    ld   [bc], a                                  ; $7347: $02
    jr   jr_01F_730C                              ; $7348: $18 $C2

jr_01F_734A:
    push de                                       ; $734A: $D5
    ld   de, $D3E0                                ; $734B: $11 $E0 $D3
    call DecrementValueAtDE                       ; $734E: $CD $71 $7A
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
    call PlayActiveWaveSfx                        ; $7368: $CD $ED $53
    ld   bc, $D398                                ; $736B: $01 $98 $D3
    ld   de, $D393                                ; $736E: $11 $93 $D3
    jr   jr_01F_730C                              ; $7371: $18 $99

Data_01F_7373::
    dw   Data_01F_741A
    dw   Data_01F_741D
    dw   Data_01F_7420
    dw   Data_01F_7423
    dw   Data_01F_7426
    dw   Data_01F_7429
    dw   Data_01F_742C
    dw   Data_01F_742F
    dw   Data_01F_7432
    dw   Data_01F_7435
    dw   Data_01F_7438
    dw   Data_01F_743B
    dw   Data_01F_743E
    dw   Data_01F_7441
    dw   Data_01F_7444
    dw   Data_01F_7447
    dw   Data_01F_744A
    dw   Data_01F_744D
    dw   Data_01F_7450
    dw   Data_01F_7453
    dw   Data_01F_7456
    dw   Data_01F_7459
    dw   Data_01F_7456
    dw   Data_01F_7453
    dw   Data_01F_7450
    dw   Data_01F_745C
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_746D
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_7472
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_7477
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_747C
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_7481
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461
    dw   Data_01F_7486
    dw   Data_01F_7461
    dw   Data_01F_7464
    dw   Data_01F_7467
    dw   Data_01F_746A
    dw   Data_01F_7467
    dw   Data_01F_7464
    dw   Data_01F_7461

Data_01F_7415::
    db   $00, $80, $9C, $80, $01

Data_01F_741A::
    db   $8E, $00, $01

Data_01F_741D::
    db   $7E, $00, $01

Data_01F_7420::
    db   $8C, $00, $01

Data_01F_7423::
    db   $7C, $00, $01

Data_01F_7426::
    db   $6F, $00, $01

Data_01F_7429::
    db   $6D, $00, $01

Data_01F_742C::
    db   $5F, $00, $01

Data_01F_742F::
    db   $5D, $00, $01

Data_01F_7432::
    db   $4F, $00, $01

Data_01F_7435::
    db   $4D, $00, $01

Data_01F_7438::
    db   $3F, $00, $01

Data_01F_743B::
    db   $3D, $00, $01

Data_01F_743E::
    db   $37, $80, $02

Data_01F_7441::
    db   $35, $80, $02

Data_01F_7444::
    db   $27, $80, $02

Data_01F_7447::
    db   $25, $80, $02

Data_01F_744A::
    db   $17, $80, $02

Data_01F_744D::
    db   $15, $80, $02

Data_01F_7450::
    db   $14, $80, $02

Data_01F_7453::
    db   $07, $80, $02

Data_01F_7456::
    db   $06, $80, $02

Data_01F_7459::
    db   $05, $80, $02

Data_01F_745C::
    db   $00, $70, $15, $80, $02

Data_01F_7461::
    db   $14, $80, $02

Data_01F_7464::
    db   $07, $80, $02

Data_01F_7467::
    db   $06, $80, $02

Data_01F_746A::
    db   $05, $80, $02

Data_01F_746D::
    db   $00, $60, $15, $80, $02

Data_01F_7472::
    db   $00, $50, $15, $80, $02

Data_01F_7477::
    db   $00, $40, $15, $80, $02

Data_01F_747C::
    db   $00, $30, $15, $80, $02

Data_01F_7481::
    db   $00, $20, $15, $80, $02

Data_01F_7486::
    db   $00, $10, $15, $80, $02

func_01F_748B::
    ld   a, $40                                   ; $748B: $3E $40
    ld   [$D3BF], a                               ; $748D: $EA $BF $D3
    ld   hl, Data_01F_74EB                        ; $7490: $21 $EB $74
    jp   label_01F_79E9                           ; $7493: $C3 $E9 $79

func_01F_7496::
    call DecrementValueAtDE                       ; $7496: $CD $71 $7A

jr_01F_7499:
    ret  nz                                       ; $7499: $C0

    call IncrementValueAtBC                       ; $749A: $CD $75 $7A
    cp   $21                                      ; $749D: $FE $21
    jp   z, func_01F_7A01                         ; $749F: $CA $01 $7A

    ld   hl, Data_01F_74AB                        ; $74A2: $21 $AB $74
    call GetHandlerAddressInTable                 ; $74A5: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $74A8: $C3 $8B $7A

Data_01F_74AB::
    dw    Data_01F_74F0
    dw    Data_01F_74F5
    dw    Data_01F_74FA
    dw    Data_01F_74FF
    dw    Data_01F_7504
    dw    Data_01F_7509
    dw    Data_01F_750E
    dw    Data_01F_7513
    dw    Data_01F_7518
    dw    Data_01F_751D
    dw    Data_01F_7522
    dw    Data_01F_7527
    dw    Data_01F_752C
    dw    Data_01F_7531
    dw    Data_01F_7536
    dw    Data_01F_753B
    dw    Data_01F_7540
    dw    Data_01F_7545
    dw    Data_01F_754A
    dw    Data_01F_754F
    dw    Data_01F_7554
    dw    Data_01F_7559
    dw    Data_01F_755E
    dw    Data_01F_7563
    dw    Data_01F_7568
    dw    Data_01F_756D
    dw    Data_01F_7572
    dw    Data_01F_7577
    dw    Data_01F_757C
    dw    Data_01F_7581
    dw    Data_01F_7586
    dw    Data_01F_758B

Data_01F_74EB::
    db   $00, $20, $67, $80, $02

Data_01F_74F0::
    db   $00, $20, $66, $80, $02

Data_01F_74F5::
    db   $00, $20, $65, $80, $02

Data_01F_74FA::
    db   $00, $20, $64, $80, $03

Data_01F_74FF::
    db   $00, $20, $57, $80, $03

Data_01F_7504::
    db   $00, $20, $56, $80, $03

Data_01F_7509::
    db   $00, $20, $55, $80, $04

Data_01F_750E::
    db   $00, $20, $54, $80, $04

Data_01F_7513::
    db   $00, $20, $47, $80, $04

Data_01F_7518::
    db   $00, $20, $46, $80, $05

Data_01F_751D::
    db   $00, $20, $45, $80, $05

Data_01F_7522::
    db   $00, $20, $44, $80, $05

Data_01F_7527::
    db   $00, $20, $37, $80, $06

Data_01F_752C::
    db   $00, $20, $36, $80, $06

Data_01F_7531::
    db   $00, $20, $35, $80, $06

Data_01F_7536::
    db   $00, $20, $34, $80, $08

Data_01F_753B::
    db   $00, $20, $27, $80, $08

Data_01F_7540::
    db   $00, $20, $26, $80, $0A

Data_01F_7545::
    db   $00, $20, $25, $80, $0A

Data_01F_754A::
    db   $00, $20, $24, $80, $0C

Data_01F_754F::
    db   $00, $20, $17, $80, $0C

Data_01F_7554::
    db   $00, $20, $16, $80, $0E

Data_01F_7559::
    db   $00, $20, $15, $80, $0E

Data_01F_755E::
    db   $00, $20, $14, $80, $10

Data_01F_7563::
    db   $00, $20, $07, $80, $10

Data_01F_7568::
    db   $00, $20, $06, $80, $12

Data_01F_756D::
    db   $00, $20, $05, $80, $12

Data_01F_7572::
    db   $00, $20, $04, $80, $14

Data_01F_7577::
    db   $00, $20, $03, $80, $14

Data_01F_757C::
    db   $00, $20, $02, $80, $16

Data_01F_7581::
    db   $00, $20, $01, $80, $16

Data_01F_7586::
    db   $00, $20, $00, $80, $18

Data_01F_758B::
    db   $00, $10, $00, $80, $20

func_01F_7590::
    ld   a, $07                                   ; $7590: $3E $07
    ld   [$D3BF], a                               ; $7592: $EA $BF $D3
    ld   hl, Data_01F_75C6                        ; $7595: $21 $C6 $75
    jp   func_01F_79E4                            ; $7598: $C3 $E4 $79

func_01F_759B::
    call IncrementValueAtBC                       ; $759B: $CD $75 $7A
    cp   $09                                      ; $759E: $FE $09
    jr   z, jr_01F_75AB                           ; $75A0: $28 $09

jr_01F_75A2:
    ld   hl, Data_01F_75B6                        ; $75A2: $21 $B6 $75
    call GetHandlerAddressInTable                 ; $75A5: $CD $64 $7A
    jp   func_01F_7A25                            ; $75A8: $C3 $25 $7A

jr_01F_75AB:
    call func_01F_7AAC                            ; $75AB: $CD $AC $7A
    jp   z, func_01F_7A07                         ; $75AE: $CA $07 $7A

    ld   a, $01                                   ; $75B1: $3E $01
    ld   [bc], a                                  ; $75B3: $02
    jr   jr_01F_75A2                              ; $75B4: $18 $EC

Data_01F_75B6::
    dw    Data_01F_75CB
    dw    Data_01F_75CE
    dw    Data_01F_75D1
    dw    Data_01F_75D4
    dw    Data_01F_75D7
    dw    Data_01F_75D4
    dw    Data_01F_75D1
    dw    Data_01F_75CE

Data_01F_75C6::
    db   $00, $F4, $0F, $80, $01

Data_01F_75CB::
    db   $0E, $00, $01

Data_01F_75CE::
    db   $0D, $00, $01

Data_01F_75D1::
    db   $0C, $00, $01

Data_01F_75D4::
    db   $0B, $00, $01

Data_01F_75D7::
    db   $0A, $00, $01

func_01F_75DA::
    ld   a, $07                                   ; $75DA: $3E $07
    ld   [$D3BF], a                               ; $75DC: $EA $BF $D3
    call func_01F_7A33                            ; $75DF: $CD $33 $7A
    ld   hl, Data_01F_6217                        ; $75E2: $21 $17 $62
    call func_01F_7AD0                            ; $75E5: $CD $D0 $7A
    jp   WriteChannel2AndDE                       ; $75E8: $C3 $7F $7A

func_01F_75EB::
    call IncrementValueAtBC                       ; $75EB: $CD $75 $7A
    cp   $09                                      ; $75EE: $FE $09
    jr   z, jr_01F_75FC                           ; $75F0: $28 $0A

    cp   $0A                                      ; $75F2: $FE $0A
    jr   z, jr_01F_7605                           ; $75F4: $28 $0F

jr_01F_75F6:
    ld   hl, Data_01F_6205                        ; $75F6: $21 $05 $62
    jp   func_01F_7B11                            ; $75F9: $C3 $11 $7B

jr_01F_75FC:
    call func_01F_7AAC                            ; $75FC: $CD $AC $7A
    jp   z, label_01F_7A51                        ; $75FF: $CA $51 $7A

    ld   a, [bc]                                  ; $7602: $0A
    jr   jr_01F_75F6                              ; $7603: $18 $F1

jr_01F_7605:
    ld   a, $01                                   ; $7605: $3E $01
    ld   [bc], a                                  ; $7607: $02
    jr   jr_01F_75F6                              ; $7608: $18 $EC

func_01F_760A::
    ld   hl, Data_01F_7647                        ; $760A: $21 $47 $76
    jp   label_01F_79E9                           ; $760D: $C3 $E9 $79

func_01F_7610::
    call DecrementValueAtDE                       ; $7610: $CD $71 $7A
    ret  nz                                       ; $7613: $C0

    call IncrementValueAtBC                       ; $7614: $CD $75 $7A
    cp   $12                                      ; $7617: $FE $12
    jp   z, func_01F_7A07                         ; $7619: $CA $07 $7A

    ld   hl, Data_01F_7625                        ; $761C: $21 $25 $76
    call GetHandlerAddressInTable                 ; $761F: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7622: $C3 $8B $7A

Data_01F_7625::
    dw    Data_01F_764C
    dw    Data_01F_7651
    dw    Data_01F_7656
    dw    Data_01F_765B
    dw    Data_01F_7660
    dw    Data_01F_7665
    dw    Data_01F_766A
    dw    Data_01F_766F
    dw    Data_01F_7674
    dw    Data_01F_7679
    dw    Data_01F_767E
    dw    Data_01F_7683
    dw    Data_01F_7688
    dw    Data_01F_768D
    dw    Data_01F_7692
    dw    Data_01F_7697
    dw    Data_01F_769C

Data_01F_7647::
    db   $00, $20, $0C, $80, $01

Data_01F_764C::
    db   $00, $40, $0D, $80, $01

Data_01F_7651::
    db   $00, $60, $0E, $80, $01

Data_01F_7656::
    db   $00, $80, $0F, $80, $01

Data_01F_765B::
    db   $00, $A0, $1C, $80, $01

Data_01F_7660::
    db   $00, $E0, $1D, $80, $01

Data_01F_7665::
    db   $00, $C0, $1E, $80, $02

Data_01F_766A::
    db   $00, $B0, $1F, $80, $02

Data_01F_766F::
    db   $00, $A0, $2C, $80, $02

Data_01F_7674::
    db   $00, $90, $2D, $80, $02

Data_01F_7679::
    db   $00, $80, $2E, $80, $02

Data_01F_767E::
    db   $00, $70, $2F, $80, $02

Data_01F_7683::
    db   $00, $60, $3C, $80, $02

Data_01F_7688::
    db   $00, $50, $3D, $80, $02

Data_01F_768D::
    db   $00, $40, $3E, $80, $02

Data_01F_7692::
    db   $00, $30, $3F, $80, $02

Data_01F_7697::
    db   $00, $20, $4C, $80, $02

Data_01F_769C::
    db   $37, $10, $4D, $C0, $02

func_01F_76A1::
    ld   hl, Data_01F_76D6                        ; $76A1: $21 $D6 $76
    jp   label_01F_79E9                           ; $76A4: $C3 $E9 $79

func_01F_76A7::
    call DecrementValueAtDE                       ; $76A7: $CD $71 $7A
    ret  nz                                       ; $76AA: $C0

    call IncrementValueAtBC                       ; $76AB: $CD $75 $7A
    cp   $0E                                      ; $76AE: $FE $0E
    jp   z, func_01F_7A07                         ; $76B0: $CA $07 $7A

    ld   hl, Data_01F_76BC                        ; $76B3: $21 $BC $76
    call GetHandlerAddressInTable                 ; $76B6: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $76B9: $C3 $8B $7A

Data_01F_76BC::
    dw   Data_01F_76DB
    dw   Data_01F_76E0
    dw   Data_01F_76E5
    dw   Data_01F_76EA
    dw   Data_01F_76EF
    dw   Data_01F_76F4
    dw   Data_01F_76F9
    dw   Data_01F_76FE
    dw   Data_01F_7703
    dw   Data_01F_7708
    dw   Data_01F_770D
    dw   Data_01F_7712
    dw   Data_01F_7717

Data_01F_76D6::
    db   $00, $30, $3D, $80, $02

Data_01F_76DB::
    db   $00, $60, $3F, $80, $02

Data_01F_76E0::
    db   $00, $90, $3D, $80, $02

Data_01F_76E5::
    db   $00, $C0, $3F, $80, $02

Data_01F_76EA::
    db   $00, $F0, $3D, $80, $02

Data_01F_76EF::
    db   $00, $D0, $3F, $80, $02

Data_01F_76F4::
    db   $00, $B0, $3D, $80, $02

Data_01F_76F9::
    db   $00, $90, $3F, $80, $02

Data_01F_76FE::
    db   $00, $70, $3D, $80, $03

Data_01F_7703::
    db   $00, $50, $3F, $80, $03

Data_01F_7708::
    db   $00, $40, $3D, $80, $04

Data_01F_770D::
    db   $00, $30, $3F, $80, $04

Data_01F_7712::
    db   $00, $20, $3D, $80, $04

Data_01F_7717::
    db   $2F, $10, $3F, $C0, $04

func_01F_771C::
    xor  a                                        ; $771C: $AF
    ld   [$D361], a                               ; $771D: $EA $61 $D3
    ld   hl, $D31F                                ; $7720: $21 $1F $D3
    set  7, [hl]                                  ; $7723: $CB $FE
    ld   a, $01                                   ; $7725: $3E $01
    ld   [$D3C6], a                               ; $7727: $EA $C6 $D3
    ld   hl, Data_01F_775E                        ; $772A: $21 $5E $77
    jp   func_01F_79E4                            ; $772D: $C3 $E4 $79

func_01F_7730::
    call DecrementValueAtDE                       ; $7730: $CD $71 $7A
    ret  nz                                       ; $7733: $C0

    call IncrementValueAtBC                       ; $7734: $CD $75 $7A
    cp   $03                                      ; $7737: $FE $03
    jr   z, jr_01F_774C                           ; $7739: $28 $11

    ld   hl, Data_01F_775A                        ; $773B: $21 $5A $77
    call GetHandlerAddressInTable                 ; $773E: $CD $64 $7A
    ld   a, [$D398]                               ; $7741: $FA $98 $D3
    cp   $01                                      ; $7744: $FE $01
    jp   z, WriteChannel1AndDE                    ; $7746: $CA $79 $7A

    jp   WriteChannel4AndDE                       ; $7749: $C3 $8B $7A

jr_01F_774C:
    xor  a                                        ; $774C: $AF
    ldh  [rNR10], a                               ; $774D: $E0 $10

jr_01F_774F:
    ld   [$D3C6], a                               ; $774F: $EA $C6 $D3

jr_01F_7752:
    ld   hl, $D31F                                ; $7752: $21 $1F $D3
    res  7, [hl]                                  ; $7755: $CB $BE
    jp   func_01F_7A07                            ; $7757: $C3 $07 $7A

Data_01F_775A::
    dw    Data_01F_7763
    dw    Data_01F_7769

Data_01F_775E::
    db   $00, $20, $70, $80, $01

Data_01F_7763::
    db   $1D, $51, $82, $59, $C7, $03

Data_01F_7769::
    db   $00, $42, $50, $80, $08

func_01F_776E::
    xor  a                                        ; $776E: $AF
    ld   [$D361], a                               ; $776F: $EA $61 $D3
    ld   hl, $D31F                                ; $7772: $21 $1F $D3
    set  7, [hl]                                  ; $7775: $CB $FE
    ld   a, $01                                   ; $7777: $3E $01
    ld   [$D3C6], a                               ; $7779: $EA $C6 $D3
    ld   hl, Data_01F_77D6                        ; $777C: $21 $D6 $77
    call func_01F_79E4                            ; $777F: $CD $E4 $79
    ld   a, $F0                                   ; $7782: $3E $F0
    ld   [$D3BF], a                               ; $7784: $EA $BF $D3
    ld   hl, Data_01F_77E0                        ; $7787: $21 $E0 $77
    call func_01F_7AB7                            ; $778A: $CD $B7 $7A
    jp   WriteChannel1AndDE                       ; $778D: $C3 $79 $7A

func_01F_7790::
    ld   hl, $D3E6                                ; $7790: $21 $E6 $D3
    ld   a, [hl]                                  ; $7793: $7E
    and  a                                        ; $7794: $A7
    jr   z, func_01F_77C0                         ; $7795: $28 $29

    xor  a                                        ; $7797: $AF
    ld   [hl], a                                  ; $7798: $77
    call func_01F_7AAC                            ; $7799: $CD $AC $7A
    jr   z, func_01F_77C0                         ; $779C: $28 $22

    cp   $E0                                      ; $779E: $FE $E0
    jr   z, jr_01F_77B3                           ; $77A0: $28 $11

    cp   $D8                                      ; $77A2: $FE $D8
    jr   nc, jr_01F_77AF                          ; $77A4: $30 $09

    ld   a, $02                                   ; $77A6: $3E $02

jr_01F_77A8:
    ld   [bc], a                                  ; $77A8: $02
    ld   hl, Data_01F_77D2                        ; $77A9: $21 $D2 $77
    jp   func_01F_7AE1                            ; $77AC: $C3 $E1 $7A

jr_01F_77AF:
    ld   a, $01                                   ; $77AF: $3E $01
    jr   jr_01F_77A8                              ; $77B1: $18 $F5

jr_01F_77B3:
    ld   hl, Data_01F_77DB                        ; $77B3: $21 $DB $77
    call WriteChannel4AndDE                       ; $77B6: $CD $8B $7A
    ld   a, $01                                   ; $77B9: $3E $01
    ld   bc, $D398                                ; $77BB: $01 $98 $D3
    jr   jr_01F_77A8                              ; $77BE: $18 $E8

func_01F_77C0::
    xor  a                                        ; $77C0: $AF
    ld   [$D3C6], a                               ; $77C1: $EA $C6 $D3
    ld   hl, $D31F                                ; $77C4: $21 $1F $D3
    res  7, [hl]                                  ; $77C7: $CB $BE
    ld   hl, Data_01F_53D9                        ; $77C9: $21 $D9 $53
    call WriteChannel1AndDE                       ; $77CC: $CD $79 $7A
    jp   func_01F_7A01                            ; $77CF: $C3 $01 $7A

Data_01F_77D2::
    db   $00, $02, $00, $00

Data_01F_77D6::
    db   $00, $1D, $20, $80, $01

Data_01F_77DB::
    db   $00, $60, $20, $80, $01

Data_01F_77E0::
    db   $00, $40, $10, $A0, $87, $01

func_01F_77E6::
    ld   hl, Data_01F_78A3                        ; $77E6: $21 $A3 $78
    jp   func_01F_79E4                            ; $77E9: $C3 $E4 $79

func_01F_77EC::
    call DecrementValueAtDE                       ; $77EC: $CD $71 $7A
    ret  nz                                       ; $77EF: $C0

    call IncrementValueAtBC                       ; $77F0: $CD $75 $7A
    cp   $51                                      ; $77F3: $FE $51
    jp   z, func_01F_7A01                         ; $77F5: $CA $01 $7A

    ld   hl, Data_01F_7801                        ; $77F8: $21 $01 $78
    call GetHandlerAddressInTable                 ; $77FB: $CD $64 $7A
    jp   func_01F_7A25                            ; $77FE: $C3 $25 $7A

Data_01F_7801::
    dw    Data_01F_78A8
    dw    Data_01F_78AB
    dw    Data_01F_78AE
    dw    Data_01F_78B1
    dw    Data_01F_78B4
    dw    Data_01F_78B7
    dw    Data_01F_78B4
    dw    Data_01F_78B1
    dw    Data_01F_78AE
    dw    Data_01F_78B1
    dw    Data_01F_78B4
    dw    Data_01F_78B7
    dw    Data_01F_78BA
    dw    Data_01F_78BD
    dw    Data_01F_78C0
    dw    Data_01F_78BD
    dw    Data_01F_78BA
    dw    Data_01F_78B7
    dw    Data_01F_78BA
    dw    Data_01F_78BD
    dw    Data_01F_78C0
    dw    Data_01F_78C3
    dw    Data_01F_78C6
    dw    Data_01F_78C9
    dw    Data_01F_78C6
    dw    Data_01F_78C3
    dw    Data_01F_78C0
    dw    Data_01F_78C3
    dw    Data_01F_78C6
    dw    Data_01F_78C9
    dw    Data_01F_78CC
    dw    Data_01F_78CF
    dw    Data_01F_78D2
    dw    Data_01F_78CF
    dw    Data_01F_78CC
    dw    Data_01F_78C9
    dw    Data_01F_78CC
    dw    Data_01F_78CF
    dw    Data_01F_78D2
    dw    Data_01F_78D5
    dw    Data_01F_78D8
    dw    Data_01F_78DB
    dw    Data_01F_78D8
    dw    Data_01F_78D5
    dw    Data_01F_78D2
    dw    Data_01F_78D5
    dw    Data_01F_78D8
    dw    Data_01F_78DB
    dw    Data_01F_78DE
    dw    Data_01F_78E1
    dw    Data_01F_78E4
    dw    Data_01F_78E1
    dw    Data_01F_78DE
    dw    Data_01F_78DB
    dw    Data_01F_78DE
    dw    Data_01F_78E1
    dw    Data_01F_78E4
    dw    Data_01F_78E7
    dw    Data_01F_78EA
    dw    Data_01F_78ED
    dw    Data_01F_78EA
    dw    Data_01F_78E7
    dw    Data_01F_78E4
    dw    Data_01F_78E7
    dw    Data_01F_78EA
    dw    Data_01F_78ED
    dw    Data_01F_78F0
    dw    Data_01F_78F3
    dw    Data_01F_78F6
    dw    Data_01F_78F3
    dw    Data_01F_78F0
    dw    Data_01F_78ED
    dw    Data_01F_78F0
    dw    Data_01F_78F3
    dw    Data_01F_78F6
    dw    Data_01F_78F9
    dw    Data_01F_78FC
    dw    Data_01F_78FF
    dw    Data_01F_7902
    dw    Data_01F_78FF
    dw    Data_01F_7902

Data_01F_78A3::
    db   $38, $80, $24, $80, $02

Data_01F_78A8::
    db   $25, $80, $02

Data_01F_78AB::
    db   $26, $80, $02

Data_01F_78AE::
    db   $27, $80, $02

Data_01F_78B1::
    db   $34, $80, $02

Data_01F_78B4::
    db   $35, $80, $02

Data_01F_78B7::
    db   $36, $80, $02

Data_01F_78BA::
    db   $37, $80, $02

Data_01F_78BD::
    db   $44, $80, $02

Data_01F_78C0::
    db   $45, $80, $02

Data_01F_78C3::
    db   $46, $80, $02

Data_01F_78C6::
    db   $47, $80, $02

Data_01F_78C9::
    db   $3C, $80, $03

Data_01F_78CC::
    db   $3D, $80, $03

Data_01F_78CF::
    db   $3E, $80, $03

Data_01F_78D2::
    db   $3F, $80, $03

Data_01F_78D5::
    db   $4C, $80, $03

Data_01F_78D8::
    db   $4D, $80, $03

Data_01F_78DB::
    db   $4E, $80, $03

Data_01F_78DE::
    db   $4F, $80, $03

Data_01F_78E1::
    db   $5C, $80, $03

Data_01F_78E4::
    db   $5D, $80, $03

Data_01F_78E7::
    db   $5E, $80, $03

Data_01F_78EA::
    db   $5F, $80, $03

Data_01F_78ED::
    db   $6C, $80, $03

Data_01F_78F0::
    db   $6D, $C0, $03

Data_01F_78F3::
    db   $6E, $C0, $03

Data_01F_78F6::
    db   $6F, $C0, $03

Data_01F_78F9::
    db   $7C, $C0, $03

Data_01F_78FC::
    db   $7D, $C0, $03

Data_01F_78FF::
    db   $7E, $C0, $03

Data_01F_7902::
    db   $7F, $C0, $03

func_01F_7905::
    ld   hl, Data_01F_7933                        ; $7905: $21 $33 $79
    jp   func_01F_79E4                            ; $7908: $C3 $E4 $79

func_01F_790B::
    ld   a, [$D3E8]                               ; $790B: $FA $E8 $D3
    and  a                                        ; $790E: $A7
    ret  nz                                       ; $790F: $C0

    call DecrementValueAtDE                       ; $7910: $CD $71 $7A
    ret  nz                                       ; $7913: $C0

    call IncrementValueAtBC                       ; $7914: $CD $75 $7A
    cp   $08                                      ; $7917: $FE $08
    jp   z, func_01F_7A07                         ; $7919: $CA $07 $7A

    ld   hl, Data_01F_7925                        ; $791C: $21 $25 $79
    call GetHandlerAddressInTable                 ; $791F: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7922: $C3 $8B $7A

Data_01F_7925::
    dw    Data_01F_7938
    dw    Data_01F_793D
    dw    Data_01F_7942
    dw    Data_01F_7947
    dw    Data_01F_794C
    dw    Data_01F_7951
    dw    Data_01F_7956

Data_01F_7933::
    db   $00, $1F, $7F, $80, $01

Data_01F_7938::
    db   $00, $E0, $44, $80, $06

Data_01F_793D::
    db   $00, $C0, $45, $80, $06

Data_01F_7942::
    db   $00, $A0, $46, $80, $06

Data_01F_7947::
    db   $00, $80, $47, $80, $06

Data_01F_794C::
    db   $00, $60, $54, $80, $06

Data_01F_7951::
    db   $00, $40, $55, $80, $06

Data_01F_7956::
    db   $38, $20, $56, $C0, $06

func_01F_795B::
    ld   hl, Data_01F_7994                        ; $795B: $21 $94 $79
    jp   func_01F_79E4                            ; $795E: $C3 $E4 $79

func_01F_7961::
    call DecrementValueAtDE                       ; $7961: $CD $71 $7A
    ret  nz                                       ; $7964: $C0

    call IncrementValueAtBC                       ; $7965: $CD $75 $7A
    cp   $10                                      ; $7968: $FE $10
    jp   z, func_01F_7A07                         ; $796A: $CA $07 $7A

    ld   hl, Data_01F_7976                        ; $796D: $21 $76 $79
    call GetHandlerAddressInTable                 ; $7970: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7973: $C3 $8B $7A

Data_01F_7976::
    dw    Data_01F_7999
    dw    Data_01F_799E
    dw    Data_01F_79A3
    dw    Data_01F_79A8
    dw    Data_01F_79AD
    dw    Data_01F_79B2
    dw    Data_01F_79B7
    dw    Data_01F_79BC
    dw    Data_01F_79C1
    dw    Data_01F_79C6
    dw    Data_01F_79CB
    dw    Data_01F_79D0
    dw    Data_01F_79D5
    dw    Data_01F_79DA
    dw    Data_01F_79DF

Data_01F_7994::
    db   $00, $20, $27, $80, $02

Data_01F_7999::
    db   $00, $40, $25, $80, $02

Data_01F_799E::
    db   $00, $60, $17, $80, $02

Data_01F_79A3::
    db   $00, $80, $15, $80, $02

Data_01F_79A8::
    db   $00, $A0, $17, $80, $02

Data_01F_79AD::
    db   $00, $C0, $25, $80, $04

Data_01F_79B2::
    db   $00, $B0, $27, $80, $04

Data_01F_79B7::
    db   $00, $A0, $25, $80, $04

Data_01F_79BC::
    db   $00, $90, $17, $80, $04

Data_01F_79C1::
    db   $00, $80, $15, $C0, $04

Data_01F_79C6::
    db   $00, $70, $17, $80, $04

Data_01F_79CB::
    db   $00, $60, $25, $80, $04

Data_01F_79D0::
    db   $00, $50, $27, $80, $04

Data_01F_79D5::
    db   $00, $40, $25, $80, $04

Data_01F_79DA::
    db   $00, $30, $17, $80, $04

Data_01F_79DF::
    db   $2F, $20, $15, $C0, $04

func_01F_79E4::
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
    jp   WriteChannel4AndDE                       ; $79FE: $C3 $8B $7A

func_01F_7A01::
    ld   hl, Data_01F_7A20                        ; $7A01: $21 $20 $7A
    call WriteChannel4AndDE                       ; $7A04: $CD $8B $7A

func_01F_7A07::
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

Data_01F_7A20::
    db   $00, $00, $00, $00, $01

func_01F_7A25::
    ld   b, $02                                   ; $7A25: $06 $02
    ld   c, $22                                   ; $7A27: $0E $22
    jp   WriteIOAndDE                             ; $7A29: $C3 $91 $7A

label_01F_7A2C:
    xor  a                                        ; $7A2C: $AF
    ld   [wActiveNoiseSfx], a                     ; $7A2D: $EA $78 $D3
    jp   PlayActiveNoiseSfx                       ; $7A30: $C3 $EC $64

func_01F_7A33::
    ld   a, [wActiveNoiseSfx]                     ; $7A33: $FA $78 $D3
    ld   [$D379], a                               ; $7A36: $EA $79 $D3
    ld   hl, $D32F                                ; $7A39: $21 $2F $D3
    set  7, [hl]                                  ; $7A3C: $CB $FE
    ld   a, $01                                   ; $7A3E: $3E $01
    ld   [$D3C9], a                               ; $7A40: $EA $C9 $D3
    xor  a                                        ; $7A43: $AF
    ld   [$D393], a                               ; $7A44: $EA $93 $D3
    ld   [$D398], a                               ; $7A47: $EA $98 $D3
    ld   hl, Data_01F_7A20                        ; $7A4A: $21 $20 $7A
    call WriteChannel4AndDE                       ; $7A4D: $CD $8B $7A
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

WriteChannel1AndDE::
    ld   b, $05                                   ; $7A79: $06 $05
    ld   c, $10                                   ; $7A7B: $0E $10
    jr   WriteIOAndDE                             ; $7A7D: $18 $12

WriteChannel2AndDE::
    ld   b, $04                                   ; $7A7F: $06 $04
    ld   c, $16                                   ; $7A81: $0E $16
    jr   WriteIOAndDE                             ; $7A83: $18 $0C

WriteChannel3AndDE::
    ld   b, $05                                   ; $7A85: $06 $05
    ld   c, $1A                                   ; $7A87: $0E $1A
    jr   WriteIOAndDE                             ; $7A89: $18 $06

WriteChannel4AndDE::
    ld   b, $04                                   ; $7A8B: $06 $04
    ld   c, $20                                   ; $7A8D: $0E $20
    jr   WriteIOAndDE                             ; $7A8F: $18 $00

WriteIOAndDE::
.loop
    ld   a, [hl+]                                 ; $7A91: $2A
    ld   [c], a                                   ; $7A92: $E2
    inc  c                                        ; $7A93: $0C
    dec  b                                        ; $7A94: $05
    jr   nz, .loop                                ; $7A95: $20 $FA

    ld   a, [hl]                                  ; $7A97: $7E
    ld   [de], a                                  ; $7A98: $12
    ret                                           ; $7A99: $C9

func_01F_7A9A::
    push de                                       ; $7A9A: $D5
    ld   de, $D3BC                                ; $7A9B: $11 $BC $D3
    jr   jr_01F_7AB2                              ; $7A9E: $18 $12

    push de                                       ; $7AA0: $D5
    ld   de, $D3BD                                ; $7AA1: $11 $BD $D3
    jr   jr_01F_7AB2                              ; $7AA4: $18 $0C

func_01F_7AA6::
    push de                                       ; $7AA6: $D5
    ld   de, $D3BE                                ; $7AA7: $11 $BE $D3
    jr   jr_01F_7AB2                              ; $7AAA: $18 $06

func_01F_7AAC::
    push de                                       ; $7AAC: $D5
    ld   de, $D3BF                                ; $7AAD: $11 $BF $D3
    jr   jr_01F_7AB2                              ; $7AB0: $18 $00

jr_01F_7AB2:
    call DecrementValueAtDE                       ; $7AB2: $CD $71 $7A
    pop  de                                       ; $7AB5: $D1
    ret                                           ; $7AB6: $C9

func_01F_7AB7::
    push de                                       ; $7AB7: $D5
    ld   de, $D3C0                                ; $7AB8: $11 $C0 $D3
    jr   jr_01F_7AC1                              ; $7ABB: $18 $04

func_01F_7ABD::
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

func_01F_7AD0::
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

func_01F_7AE1::
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

func_01F_7B11::
    push de                                       ; $7B11: $D5
    ld   de, $D3C3                                ; $7B12: $11 $C3 $D3
    ld   a, [bc]                                  ; $7B15: $0A
    ld   c, $18                                   ; $7B16: $0E $18
    push bc                                       ; $7B18: $C5
    jr   jr_01F_7AF5                              ; $7B19: $18 $DA

func_01F_7B1B::
    ld   hl, Data_01F_7B3E                        ; $7B1B: $21 $3E $7B
    jp   label_01F_79E9                           ; $7B1E: $C3 $E9 $79

func_01F_7B21::
    call DecrementValueAtDE                       ; $7B21: $CD $71 $7A
    ret  nz                                       ; $7B24: $C0

    call IncrementValueAtBC                       ; $7B25: $CD $75 $7A
    cp   $05                                      ; $7B28: $FE $05
    jp   z, func_01F_7A01                         ; $7B2A: $CA $01 $7A

    ld   hl, Data_01F_7B36                        ; $7B2D: $21 $36 $7B
    call GetHandlerAddressInTable                 ; $7B30: $CD $64 $7A
    jp   WriteChannel4AndDE                       ; $7B33: $C3 $8B $7A

Data_01F_7B36::
    dw    Data_01F_7B48
    dw    Data_01F_7B4D
    dw    Data_01F_7B52
    dw    Data_01F_7B57

Data_01F_7B3E::
    db   $00, $F8, $1D, $80, $01, $00, $F8, $1D, $80, $01

Data_01F_7B48::
    db   $00, $F8, $01, $80, $01

Data_01F_7B4D::
    db   $00, $59, $11, $80, $03

Data_01F_7B52::
    db   $01, $C8, $17, $80, $01

Data_01F_7B57::
    db   $00, $F5, $11, $80, $01

func_01F_7B5C::
    ld   a, $FF                                   ; $7B5C: $3E $FF
    ldh  [rNR51], a                               ; $7B5E: $E0 $25
    ld   a, $03                                   ; $7B60: $3E $03
    ld   [$D355], a                               ; $7B62: $EA $55 $D3
    xor  a                                        ; $7B65: $AF
    ld   [wActiveMusicIndex], a                   ; $7B66: $EA $69 $D3
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
    ld   [wActiveMusicTableIndex], a              ; $7B85: $EA $D9 $D3
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
    ldh  [rNR30], a                                 ; $7BFE: $E0 $00
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

func_01F_7F80::
    ldh  a, [hMusicFadeOutTimer]                               ; $7F80: $F0 $A8
    and  a                                        ; $7F82: $A7
    jr   z, jr_01F_7F9E                           ; $7F83: $28 $19

    sub  $01                                      ; $7F85: $D6 $01
    ldh  [hMusicFadeOutTimer], a                               ; $7F87: $E0 $A8
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
    ldh  a, [hMusicFadeInTimer]                   ; $7F9E: $F0 $AB
    and  a                                        ; $7FA0: $A7
    jr   z, jr_01F_7FBE                           ; $7FA1: $28 $1B

    sub  $01                                      ; $7FA3: $D6 $01
    ldh  [hMusicFadeInTimer], a                   ; $7FA5: $E0 $AB
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
