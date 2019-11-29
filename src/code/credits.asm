; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

Data_017_4000::
    db   $18, $05, $37, $20, $36, $0E, $1E, $2B, $25, $14, $1F, $12, $15, $2C, $31, $3F
    db   $0C, $30, $01, $33, $04, $27, $08, $1D, $38, $17, $3E, $28, $11, $00, $3A, $3D
    db   $2A, $0B, $1B, $0A, $34, $07, $22, $0F, $1C, $23, $2F, $3B, $2D, $16, $3C, $32
    db   $10, $29, $02, $2E, $0D, $19, $09, $26, $24, $06, $13, $21, $1A, $03, $39, $35

Data_017_4040::
    db   $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

Data_017_4048::
    db   $50, $91, $60, $90, $70, $90, $80, $90
    db   $90, $90, $A0, $90, $F0, $91, $60, $91
    db   $70, $91, $80, $91, $90, $91, $A0, $91
    db   $40, $94

AnimateCreditsIslandFadeTiles::
    ld   a, [$D00B]                               ; $4062: $FA $0B $D0
    ld   e, a                                     ; $4065: $5F
    ld   d, $00                                   ; $4066: $16 $00
    ld   hl, Data_017_4000                        ; $4068: $21 $00 $40
    add  hl, de                                   ; $406B: $19
    ld   a, [hl]                                  ; $406C: $7E
    rra                                           ; $406D: $1F
    rra                                           ; $406E: $1F
    and  $0E                                      ; $406F: $E6 $0E
    ld   b, a                                     ; $4071: $47
    ld   a, [hl]                                  ; $4072: $7E
    and  $07                                      ; $4073: $E6 $07
    ld   e, a                                     ; $4075: $5F
    ld   hl, Data_017_4040                        ; $4076: $21 $40 $40
    add  hl, de                                   ; $4079: $19
    ld   c, [hl]                                  ; $407A: $4E
    xor  a                                        ; $407B: $AF
    ld   d, a                                     ; $407C: $57

jr_017_407D:
    ldh  [hScratch2], a                               ; $407D: $E0 $D9
    sla  a                                        ; $407F: $CB $27
    ld   e, a                                     ; $4081: $5F
    ld   hl, Data_017_4048                        ; $4082: $21 $48 $40
    add  hl, de                                   ; $4085: $19
    ld   a, [hl+]                                 ; $4086: $2A
    ld   h, [hl]                                  ; $4087: $66
    add  b                                        ; $4088: $80
    ld   l, a                                     ; $4089: $6F
    ld   a, [hl]                                  ; $408A: $7E
    and  c                                        ; $408B: $A1
    ld   [hl+], a                                 ; $408C: $22
    ld   a, [hl]                                  ; $408D: $7E
    and  c                                        ; $408E: $A1
    ld   [hl], a                                  ; $408F: $77
    ldh  a, [hScratch2]                           ; $4090: $F0 $D9
    inc  a                                        ; $4092: $3C
    cp   $0D                                      ; $4093: $FE $0D
    jr   nz, jr_017_407D                          ; $4095: $20 $E6

    xor  a                                        ; $4097: $AF
    ldh  [$FFA5], a                               ; $4098: $E0 $A5
    ret                                           ; $409A: $C9

include "text/credits.asm"

func_017_448B:
jr_017_448B:
    ld   a, [$D009]                               ; $448B: $FA $09 $D0
    and  a                                        ; $448E: $A7
    ret  nz                                       ; $448F: $C0

    ld   a, [$D01E]                               ; $4490: $FA $1E $D0

jr_017_4493:
    and  a                                        ; $4493: $A7
    jr   nz, jr_017_449C                          ; $4494: $20 $06

    call func_017_469D                            ; $4496: $CD $9D $46
    call func_017_4784                            ; $4499: $CD $84 $47

jr_017_449C:
    ld   a, [$D012]                               ; $449C: $FA $12 $D0
    JP_TABLE                                      ; $449F: $C7
._00 dw Func_017_44FC
._01 dw Func_017_457D
._02 dw Func_017_4594
._03 dw Func_017_45BA
._04 dw Func_017_4630
._05 dw Func_017_4678

Data_017_44AC::
    db   $00, $01, $02, $03, $04, $04, $04, $05, $05, $06, $07, $08, $09, $09, $09, $0A
    db   $0A, $0B, $0C, $02, $0D, $03, $03, $04, $04, $05, $05, $06, $06, $06, $0E, $09
    db   $0A, $0A, $0A, $0A, $0A, $0F, $10, $11

Data_017_44D4::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
    db   $10, $11, $00, $01, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D
    db   $1E, $1F, $20, $21, $22, $23, $24, $25

Func_017_44FC::
    ld   a, [$D008]                               ; $44FC: $FA $08 $D0
    and  a                                        ; $44FF: $A7
    ret  nz                                       ; $4500: $C0

    ld   c, $00                                   ; $4501: $0E $00
    ld   a, [$D00A]                               ; $4503: $FA $0A $D0
    ld   e, a                                     ; $4506: $5F
    cp   $25                                      ; $4507: $FE $25

jr_017_4509:
    jr   c, jr_017_4519                           ; $4509: $38 $0E

    cp   $27                                      ; $450B: $FE $27
    jr   nz, jr_017_4514                          ; $450D: $20 $05

    ldh  a, [hIsGBC]                               ; $450F: $F0 $FE
    and  a                                        ; $4511: $A7
    jr   z, jr_017_4519                           ; $4512: $28 $05

jr_017_4514:
    ld   a, $0C                                   ; $4514: $3E $0C
    ld   [$D01E], a                               ; $4516: $EA $1E $D0

jr_017_4519:
    ld   d, $00                                   ; $4519: $16 $00
    ld   hl, Data_017_44AC                        ; $451B: $21 $AC $44
    add  hl, de                                   ; $451E: $19
    ld   a, [$D010]                               ; $451F: $FA $10 $D0
    cp   [hl]                                     ; $4522: $BE
    jr   nz, jr_017_4526                          ; $4523: $20 $01

    inc  c                                        ; $4525: $0C

jr_017_4526:
    ld   a, c                                     ; $4526: $79
    ld   [$D005], a                               ; $4527: $EA $05 $D0
    ld   a, [hl]                                  ; $452A: $7E
    ld   [$D010], a                               ; $452B: $EA $10 $D0
    ld   hl, Data_017_44D4                        ; $452E: $21 $D4 $44
    add  hl, de                                   ; $4531: $19
    ld   a, [hl]                                  ; $4532: $7E
    ld   [$D011], a                               ; $4533: $EA $11 $D0
    xor  a                                        ; $4536: $AF
    ld   [$D000], a                               ; $4537: $EA $00 $D0
    jp   label_017_45B5                           ; $453A: $C3 $B5 $45

Data_017_453D::
    db   $00, $00, $00, $00, $04, $04, $04, $04  ; $453D |........|
    db   $19, $19, $19, $19, $1E, $1E, $1E, $1E  ; $4545 |........|
    db   $FF, $FF, $FF, $FF, $AF, $AF, $AF, $AF  ; $454D |........|
    db   $5A, $5A, $5A, $5A, $1E, $1E, $1E, $1E  ; $4555 |ZZZZ....|
    db   $1E, $1E, $1E, $1E, $19, $19, $19, $19  ; $455D |........|
    db   $04, $04, $04, $04, $00, $00, $00, $00  ; $4565 |........|
    db   $1E, $1E, $1E, $1E, $6F, $6F, $6F, $6F  ; $456D |....oooo|
    db   $BF, $BF, $BF, $BF, $FF, $FF, $FF, $FF  ; $4575 |........|

Func_017_457D::
    ld   a, $B0                                   ; $457D: $3E $B0
    ld   [$D008], a                               ; $457F: $EA $08 $D0
    call func_017_45B5                            ; $4582: $CD $B5 $45
    ld   a, [$D00A]                               ; $4585: $FA $0A $D0
    cp   $27                                      ; $4588: $FE $27
    jr   nz, jr_017_458E                          ; $458A: $20 $02

    ld   [hl], $04                                ; $458C: $36 $04

jr_017_458E:
    ld   a, $1E                                   ; $458E: $3E $1E
    ld   [wOBJ1Palette], a                               ; $4590: $EA $99 $DB
    ret                                           ; $4593: $C9

Func_017_4594::
    ld   a, [$D008]                               ; $4594: $FA $08 $D0
    and  a                                        ; $4597: $A7
    ret  nz                                       ; $4598: $C0

    ld   c, $00                                   ; $4599: $0E $00
    ld   a, [$D00A]                               ; $459B: $FA $0A $D0
    inc  a                                        ; $459E: $3C
    ld   e, a                                     ; $459F: $5F
    ld   d, $00                                   ; $45A0: $16 $00
    ld   hl, Data_017_44AC                        ; $45A2: $21 $AC $44
    add  hl, de                                   ; $45A5: $19
    ld   a, [$D010]                               ; $45A6: $FA $10 $D0
    cp   [hl]                                     ; $45A9: $BE
    jr   nz, jr_017_45AD                          ; $45AA: $20 $01

    inc  c                                        ; $45AC: $0C

jr_017_45AD:
    ld   a, c                                     ; $45AD: $79
    ld   [$D005], a                               ; $45AE: $EA $05 $D0
    xor  a                                        ; $45B1: $AF
    ld   [$D000], a                               ; $45B2: $EA $00 $D0

func_017_45B5:
label_017_45B5:
    ld   hl, $D012                                ; $45B5: $21 $12 $D0
    inc  [hl]                                     ; $45B8: $34
    ret                                           ; $45B9: $C9

Func_017_45BA::
    ld   a, [$D00A]                               ; $45BA: $FA $0A $D0
    ldh  [hScratchD], a                           ; $45BD: $E0 $E4
    cp   $26                                      ; $45BF: $FE $26
    jr   c, jr_017_45F9                           ; $45C1: $38 $36

    ldh  a, [hIsGBC]                               ; $45C3: $F0 $FE
    and  a                                        ; $45C5: $A7
    jr   z, jr_017_45E8                           ; $45C6: $28 $20

    ld   hl, $DB57                                ; $45C8: $21 $57 $DB
    ld   a, [hl+]                                 ; $45CB: $2A
    or   [hl]                                     ; $45CC: $B6
    jr   z, jr_017_45F9                           ; $45CD: $28 $2A

    ldh  a, [hFrameCounter]                               ; $45CF: $F0 $E7
    and  $03                                      ; $45D1: $E6 $03
    jr   nz, jr_017_4612                          ; $45D3: $20 $3D

    call func_017_7FA9                            ; $45D5: $CD $A9 $7F
    ldh  a, [hFrameCounter]                               ; $45D8: $F0 $E7
    and  $04                                      ; $45DA: $E6 $04
    jr   z, jr_017_45E3                           ; $45DC: $28 $05

    ld   a, $02                                   ; $45DE: $3E $02
    ld   [$DDD1], a                               ; $45E0: $EA $D1 $DD

jr_017_45E3:
    ld   a, [$D00A]                               ; $45E3: $FA $0A $D0
    ldh  [hScratchD], a                           ; $45E6: $E0 $E4

jr_017_45E8:
    ldh  a, [hFrameCounter]                               ; $45E8: $F0 $E7
    and  $07                                      ; $45EA: $E6 $07
    jr   nz, jr_017_4612                          ; $45EC: $20 $24

    ld   a, [$D000]                               ; $45EE: $FA $00 $D0
    inc  a                                        ; $45F1: $3C
    ld   [$D000], a                               ; $45F2: $EA $00 $D0
    cp   $0C                                      ; $45F5: $FE $0C
    jr   nz, jr_017_4612                          ; $45F7: $20 $19

jr_017_45F9:
    ldh  a, [hScratchD]                           ; $45F9: $F0 $E4
    cp   $26                                      ; $45FB: $FE $26
    ld   a, $10                                   ; $45FD: $3E $10
    jr   c, jr_017_4603                           ; $45FF: $38 $02

    ld   a, $80                                   ; $4601: $3E $80

jr_017_4603:
    ld   [$D008], a                               ; $4603: $EA $08 $D0
    ld   a, $00                                   ; $4606: $3E $00
    ld   [$D012], a                               ; $4608: $EA $12 $D0
    ld   a, [$D00A]                               ; $460B: $FA $0A $D0
    inc  a                                        ; $460E: $3C
    ld   [$D00A], a                               ; $460F: $EA $0A $D0

jr_017_4612:
    ld   a, [$D000]                               ; $4612: $FA $00 $D0
    ld   e, a                                     ; $4615: $5F
    ldh  a, [hFrameCounter]                               ; $4616: $F0 $E7
    and  $03                                      ; $4618: $E6 $03
    add  e                                        ; $461A: $83
    ld   e, a                                     ; $461B: $5F
    ld   d, $00                                   ; $461C: $16 $00
    ldh  a, [hScratchD]                           ; $461E: $F0 $E4
    cp   $26                                      ; $4620: $FE $26
    jr   c, jr_017_462F                           ; $4622: $38 $0B

    ld   hl, $456D                                ; $4624: $21 $6D $45
    add  hl, de                                   ; $4627: $19
    ld   a, [hl]                                  ; $4628: $7E
    ld   [wBGPalette], a                               ; $4629: $EA $97 $DB
    ld   [wOBJ1Palette], a                               ; $462C: $EA $99 $DB

jr_017_462F:
    ret                                           ; $462F: $C9

Func_017_4630::
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $4630: $3E $E8
    call SpawnNewEntity_trampoline                ; $4632: $CD $86 $3B

    ld   hl, wEntitiesPosXTable                   ; $4635: $21 $00 $C2
    add  hl, de                                   ; $4638: $19
    ld   [hl], $E0                                ; $4639: $36 $E0
    ld   hl, wEntitiesPosYTable                                ; $463B: $21 $10 $C2
    add  hl, de                                   ; $463E: $19
    ld   [hl], $10                                ; $463F: $36 $10
    ld   hl, wEntitiesSpeedXTable                                ; $4641: $21 $40 $C2
    add  hl, de                                   ; $4644: $19
    ld   [hl], $08                                ; $4645: $36 $08
    ld   hl, wEntitiesSpeedYTable                                ; $4647: $21 $50 $C2
    add  hl, de                                   ; $464A: $19
    ld   [hl], $08                                ; $464B: $36 $08
    ld   hl, $C2B0                                ; $464D: $21 $B0 $C2
    add  hl, de                                   ; $4650: $19
    ld   [hl], $10                                ; $4651: $36 $10
    ldh  a, [hIsGBC]                               ; $4653: $F0 $FE
    and  a                                        ; $4655: $A7
    jp   z, label_017_45B5                        ; $4656: $CA $B5 $45

    ld   hl, wEntitiesSpeedYTable                                ; $4659: $21 $50 $C2
    add  hl, de                                   ; $465C: $19
    ld   [hl], $F8                                ; $465D: $36 $F8
    ld   hl, $DB57                                ; $465F: $21 $57 $DB
    ld   a, [hl+]                                 ; $4662: $2A
    or   [hl]                                     ; $4663: $B6
    jr   nz, jr_017_466A                          ; $4664: $20 $04

    ld   a, $3C                                   ; $4666: $3E $3C
    jr   jr_017_466B                              ; $4668: $18 $01

jr_017_466A:
    xor  a                                        ; $466A: $AF

jr_017_466B:
    ld   [$D01E], a                               ; $466B: $EA $1E $D0
    xor  a                                        ; $466E: $AF
    ld   [wCreditsSubscene], a                               ; $466F: $EA $0E $D0
    call ResetCreditsSceneVariables                            ; $4672: $CD $A5 $4D
    jp   IncrementCreditsGameplaySubtypeAndReturn                           ; $4675: $C3 $5B $4C

Func_017_4678::
    ret                                           ; $4678: $C9

Data_017_4679::
    db   $40, $18, $41, $42, $43, $19, $44, $45  ; $4679 |@.ABC.DE|
    db   $46, $00, $47, $48, $49, $4A, $4B, $50  ; $4681 |F.GHIJKP|
    db   $00, $51, $52, $53, $54, $55, $2F, $3F  ; $4689 |.QRSTU/?|
    db   $00, $00, $00, $1A, $00, $1C, $00, $00  ; $4691 |........|
    db   $00, $00, $1D, $1B                      ; $4699 |....|

func_017_469D:
    ld   a, [$D010]                               ; $469D: $FA $10 $D0
    cp   $FF                                      ; $46A0: $FE $FF
    ret  z                                        ; $46A2: $C8

    rla                                           ; $46A3: $17
    and  $FE                                      ; $46A4: $E6 $FE
    ld   e, a                                     ; $46A6: $5F
    ld   d, $00                                   ; $46A7: $16 $00
    rla                                           ; $46A9: $17
    rl   d                                        ; $46AA: $CB $12
    rla                                           ; $46AC: $17
    rl   d                                        ; $46AD: $CB $12
    rla                                           ; $46AF: $17
    rl   d                                        ; $46B0: $CB $12
    and  $F0                                      ; $46B2: $E6 $F0
    add  e                                        ; $46B4: $83
    ld   e, a                                     ; $46B5: $5F
    ld   a, d                                     ; $46B6: $7A
    adc  $00                                      ; $46B7: $CE $00
    ld   d, a                                     ; $46B9: $57
    ld   hl, NewStaffRoles                        ; $46BA: $21 $9B $40

jr_017_46BD:
    add  hl, de                                   ; $46BD: $19
    ld   de, wDynamicOAMBuffer                    ; $46BE: $11 $30 $C0
    ldh  a, [hIsGBC]                               ; $46C1: $F0 $FE
    and  a                                        ; $46C3: $A7
    jr   z, jr_017_46C9                           ; $46C4: $28 $03

    ld   de, wOAMBuffer                                ; $46C6: $11 $00 $C0

jr_017_46C9:
    ldh  a, [hFrameCounter]                               ; $46C9: $F0 $E7
    and  $01                                      ; $46CB: $E6 $01
    ld   a, $10                                   ; $46CD: $3E $10
    jr   z, jr_017_46D4                           ; $46CF: $28 $03

    inc  hl                                       ; $46D1: $23
    ld   a, $18                                   ; $46D2: $3E $18

jr_017_46D4:
    ldh  [hScratch0], a                               ; $46D4: $E0 $D7
    ld   c, $09                                   ; $46D6: $0E $09

jr_017_46D8:
    ld   a, $40                                   ; $46D8: $3E $40
    ld   [de], a                                  ; $46DA: $12
    inc  de                                       ; $46DB: $13
    ldh  a, [hScratch0]                               ; $46DC: $F0 $D7
    ld   [de], a                                  ; $46DE: $12
    inc  de                                       ; $46DF: $13
    add  $10                                      ; $46E0: $C6 $10
    ldh  [hScratch0], a                               ; $46E2: $E0 $D7
    ld   a, [hl+]                                 ; $46E4: $2A
    inc  hl                                       ; $46E5: $23
    push hl                                       ; $46E6: $E5
    push de                                       ; $46E7: $D5
    cp   $30                                      ; $46E8: $FE $30
    jr   c, jr_017_46F6                           ; $46EA: $38 $0A

    cp   $3A                                      ; $46EC: $FE $3A
    jr   nc, jr_017_46F6                          ; $46EE: $30 $06

    sub  $30                                      ; $46F0: $D6 $30
    add  $1A                                      ; $46F2: $C6 $1A
    jr   jr_017_4700                              ; $46F4: $18 $0A

jr_017_46F6:
    cp   $20                                      ; $46F6: $FE $20
    jr   nz, jr_017_46FE                          ; $46F8: $20 $04

    ld   a, $0F                                   ; $46FA: $3E $0F
    jr   jr_017_4708                              ; $46FC: $18 $0A

jr_017_46FE:
    sub  $41                                      ; $46FE: $D6 $41

jr_017_4700:
    ld   e, a                                     ; $4700: $5F
    ld   d, $00                                   ; $4701: $16 $00
    ld   hl, Data_017_4679                        ; $4703: $21 $79 $46
    add  hl, de                                   ; $4706: $19
    ld   a, [hl]                                  ; $4707: $7E

jr_017_4708:
    pop  de                                       ; $4708: $D1
    pop  hl                                       ; $4709: $E1
    ld   [de], a                                  ; $470A: $12
    inc  de                                       ; $470B: $13
    ld   a, $10                                   ; $470C: $3E $10
    ld   [de], a                                  ; $470E: $12
    inc  de                                       ; $470F: $13
    dec  c                                        ; $4710: $0D
    jr   nz, jr_017_46D8                          ; $4711: $20 $C5

    ret                                           ; $4713: $C9

Data_017_4714::
    db   $20, $30, $21, $31, $22, $22, $23, $33  ; $4714 | 0!1""#3|
    db   $24, $34, $24, $35, $22, $32, $36, $30  ; $471C |$4$5"260|
    db   $27, $27, $28, $38, $29, $39, $16, $17  ; $4724 |''(8)9..|
    db   $2A, $3A, $2B, $3B, $20, $20, $21, $35  ; $472C |*:+;  !5|
    db   $00, $00, $21, $26, $2C, $3C, $2D, $3D  ; $4734 |..!&,<-=|
    db   $36, $20, $00, $00, $2E, $3E, $00, $00  ; $473C |6 ...>..|
    db   $36, $25, $37, $37, $14, $15, $12, $13  ; $4744 |6%77....|
    db   $10, $10, $10, $10, $10, $50, $10, $10  ; $474C |.....P..|
    db   $10, $10, $10, $10, $10, $10, $50, $10  ; $4754 |......P.|
    db   $10, $50, $10, $10, $10, $10, $10, $10  ; $475C |.P......|
    db   $10, $10, $10, $10, $10, $50, $10, $10  ; $4764 |.....P..|
    db   $10, $10, $10, $10, $10, $10, $10, $10  ; $476C |........|
    db   $50, $50, $10, $10, $10, $10, $10, $10  ; $4774 |PP......|
    db   $50, $10, $10, $70, $10, $10, $10, $10  ; $477C |P..p....|

func_017_4784:
    ld   a, [$D011]                               ; $4784: $FA $11 $D0
    rla                                           ; $4787: $17
    and  $FE                                      ; $4788: $E6 $FE
    ld   e, a                                     ; $478A: $5F
    ld   d, $00                                   ; $478B: $16 $00
    rla                                           ; $478D: $17
    rl   d                                        ; $478E: $CB $12
    rla                                           ; $4790: $17
    rl   d                                        ; $4791: $CB $12
    rla                                           ; $4793: $17
    rl   d                                        ; $4794: $CB $12
    and  $F0                                      ; $4796: $E6 $F0
    add  e                                        ; $4798: $83
    ld   e, a                                     ; $4799: $5F
    ld   a, d                                     ; $479A: $7A
    adc  $00                                      ; $479B: $CE $00
    ld   d, a                                     ; $479D: $57
    ld   hl, NewStaffPeople                       ; $479E: $21 $DF $41
    add  hl, de                                   ; $47A1: $19
    push hl                                       ; $47A2: $E5
    xor  a                                        ; $47A3: $AF
    ldh  [hScratch1], a                               ; $47A4: $E0 $D8
    ld   de, $C054                                ; $47A6: $11 $54 $C0
    ldh  a, [hIsGBC]                               ; $47A9: $F0 $FE
    and  a                                        ; $47AB: $A7
    jr   z, jr_017_47B1                           ; $47AC: $28 $03

    ld   de, $C024                                ; $47AE: $11 $24 $C0

jr_017_47B1:
    ld   a, $55                                   ; $47B1: $3E $55
    call func_017_47C8                            ; $47B3: $CD $C8 $47
    ld   hl, hScratch1                                ; $47B6: $21 $D8 $FF
    inc  [hl]                                     ; $47B9: $34
    pop  hl                                       ; $47BA: $E1
    ld   de, $C078                                ; $47BB: $11 $78 $C0
    ldh  a, [hIsGBC]                               ; $47BE: $F0 $FE
    and  a                                        ; $47C0: $A7
    jr   z, jr_017_47C6                           ; $47C1: $28 $03

    ld   de, $C048                                ; $47C3: $11 $48 $C0

jr_017_47C6:
    ld   a, $5D                                   ; $47C6: $3E $5D

func_017_47C8:
    ldh  [$FFE9], a                               ; $47C8: $E0 $E9
    ld   c, $12                                   ; $47CA: $0E $12
    ld   b, $08                                   ; $47CC: $06 $08
    ld   a, [$D011]                               ; $47CE: $FA $11 $D0
    cp   $25                                      ; $47D1: $FE $25
    ld   a, $38                                   ; $47D3: $3E $38
    jr   z, jr_017_47E6                           ; $47D5: $28 $0F

    ld   c, $09                                   ; $47D7: $0E $09
    ld   b, $10                                   ; $47D9: $06 $10
    ldh  a, [hFrameCounter]                               ; $47DB: $F0 $E7
    and  $01                                      ; $47DD: $E6 $01
    ld   a, $10                                   ; $47DF: $3E $10
    jr   z, jr_017_47E6                           ; $47E1: $28 $03

    inc  hl                                       ; $47E3: $23
    ld   a, $18                                   ; $47E4: $3E $18

jr_017_47E6:
    ldh  [hScratch0], a                               ; $47E6: $E0 $D7

jr_017_47E8:
    ldh  a, [$FFE9]                               ; $47E8: $F0 $E9
    ld   [de], a                                  ; $47EA: $12
    inc  de                                       ; $47EB: $13
    ldh  a, [hScratch0]                               ; $47EC: $F0 $D7
    ld   [de], a                                  ; $47EE: $12
    inc  de                                       ; $47EF: $13
    add  b                                        ; $47F0: $80
    ldh  [hScratch0], a                               ; $47F1: $E0 $D7
    ld   a, [$D011]                               ; $47F3: $FA $11 $D0
    cp   $25                                      ; $47F6: $FE $25
    ld   a, [hl+]                                 ; $47F8: $2A
    jr   z, jr_017_47FC                           ; $47F9: $28 $01

    inc  hl                                       ; $47FB: $23

jr_017_47FC:
    push hl                                       ; $47FC: $E5
    push de                                       ; $47FD: $D5
    cp   $26                                      ; $47FE: $FE $26
    jr   nz, jr_017_4806                          ; $4800: $20 $04

    ld   a, $1A                                   ; $4802: $3E $1A
    jr   jr_017_4818                              ; $4804: $18 $12

jr_017_4806:
    cp   $32                                      ; $4806: $FE $32
    jr   nz, jr_017_480E                          ; $4808: $20 $04

    ld   a, $1B                                   ; $480A: $3E $1B
    jr   jr_017_4818                              ; $480C: $18 $0A

jr_017_480E:
    cp   $20                                      ; $480E: $FE $20
    jr   nz, jr_017_4816                          ; $4810: $20 $04

    ld   a, $0F                                   ; $4812: $3E $0F
    jr   jr_017_482D                              ; $4814: $18 $17

jr_017_4816:
    sub  $41                                      ; $4816: $D6 $41

jr_017_4818:
    sla  a                                        ; $4818: $CB $27
    ld   hl, hScratch1                                ; $481A: $21 $D8 $FF
    add  [hl]                                     ; $481D: $86
    ld   e, a                                     ; $481E: $5F
    ld   d, $00                                   ; $481F: $16 $00
    ld   hl, $474C                                ; $4821: $21 $4C $47
    add  hl, de                                   ; $4824: $19
    ld   a, [hl]                                  ; $4825: $7E
    ldh  [$FFE8], a                               ; $4826: $E0 $E8
    ld   hl, Data_017_4714                        ; $4828: $21 $14 $47
    add  hl, de                                   ; $482B: $19
    ld   a, [hl]                                  ; $482C: $7E

jr_017_482D:
    pop  de                                       ; $482D: $D1
    pop  hl                                       ; $482E: $E1
    ld   [de], a                                  ; $482F: $12
    inc  de                                       ; $4830: $13
    ldh  a, [$FFE8]                               ; $4831: $F0 $E8
    ld   [de], a                                  ; $4833: $12
    inc  de                                       ; $4834: $13
    dec  c                                        ; $4835: $0D
    jr   nz, jr_017_47E8                          ; $4836: $20 $B0

    ret                                           ; $4838: $C9

func_017_4839:
    ld   a, [$C114]                               ; $4839: $FA $14 $C1
    inc  a                                        ; $483C: $3C
    cp   $C0                                      ; $483D: $FE $C0
    jr   c, jr_017_4846                           ; $483F: $38 $05

    ld   a, $0F                                   ; $4841: $3E $0F
    ldh  [hNoiseSfx], a                               ; $4843: $E0 $F4
    xor  a                                        ; $4845: $AF

jr_017_4846:
    ld   [$C114], a                               ; $4846: $EA $14 $C1
    ld   a, [$D466]                               ; $4849: $FA $66 $D4
    and  a                                        ; $484C: $A7
    jr   nz, jr_017_485D                          ; $484D: $20 $0E

    ld   a, JINGLE_SEAGULL                        ; $484F: $3E $21
    ldh  [hJingle], a                             ; $4851: $E0 $F2
    call GetRandomByte                            ; $4853: $CD $0D $28
    and  $7F                                      ; $4856: $E6 $7F
    add  $50                                      ; $4858: $C6 $50
    ld   [$D466], a                               ; $485A: $EA $66 $D4

jr_017_485D:
    dec  a                                        ; $485D: $3D
    ld   [$D466], a                               ; $485E: $EA $66 $D4
    ret                                           ; $4861: $C9

Data_017_4862::
    db   $92, $93, $92, $93, $92, $93, $92, $93  ; $4862 |........|
    db   $92, $93, $92, $93, $92, $93, $92, $93  ; $486A |........|
    db   $92, $93, $92, $93, $92, $82, $83, $82  ; $4872 |........|
    db   $83, $82, $83, $82, $83, $82, $83, $82  ; $487A |........|
    db   $83, $82, $83, $82, $83, $82, $83, $82  ; $4882 |........|
    db   $83, $82                                ; $488A |..|

func_017_488C:
    ldh  a, [hFrameCounter]                               ; $488C: $F0 $E7
    and  $0F                                      ; $488E: $E6 $0F
    cp   $02                                      ; $4890: $FE $02
    jr   nz, jr_017_48CC                          ; $4892: $20 $38

    push de                                       ; $4894: $D5
    ld   hl, $D601                                ; $4895: $21 $01 $D6
    ld   a, d                                     ; $4898: $7A
    ld   [hl+], a                                 ; $4899: $22
    ld   a, e                                     ; $489A: $7B
    ld   [hl+], a                                 ; $489B: $22
    ld   a, $13                                   ; $489C: $3E $13
    ld   [hl+], a                                 ; $489E: $22
    ld   de, Data_017_4862                        ; $489F: $11 $62 $48
    ldh  a, [hFrameCounter]                               ; $48A2: $F0 $E7
    and  $10                                      ; $48A4: $E6 $10
    jr   z, jr_017_48A9                           ; $48A6: $28 $01

    inc  de                                       ; $48A8: $13

jr_017_48A9:
    ld   c, $14                                   ; $48A9: $0E $14

jr_017_48AB:
    ld   a, [de]                                  ; $48AB: $1A
    ld   [hl+], a                                 ; $48AC: $22
    dec  c                                        ; $48AD: $0D
    jr   nz, jr_017_48AB                          ; $48AE: $20 $FB

    pop  de                                       ; $48B0: $D1
    ld   a, d                                     ; $48B1: $7A
    ld   [hl+], a                                 ; $48B2: $22
    ld   a, e                                     ; $48B3: $7B
    sub  $20                                      ; $48B4: $D6 $20
    ld   [hl+], a                                 ; $48B6: $22
    ld   a, $13                                   ; $48B7: $3E $13
    ld   [hl+], a                                 ; $48B9: $22
    ld   de, $4877                                ; $48BA: $11 $77 $48
    ldh  a, [hFrameCounter]                               ; $48BD: $F0 $E7
    and  $10                                      ; $48BF: $E6 $10
    jr   z, jr_017_48C4                           ; $48C1: $28 $01

    inc  de                                       ; $48C3: $13

jr_017_48C4:
    ld   c, $14                                   ; $48C4: $0E $14

jr_017_48C6:
    ld   a, [de]                                  ; $48C6: $1A
    ld   [hl+], a                                 ; $48C7: $22
    dec  c                                        ; $48C8: $0D
    jr   nz, jr_017_48C6                          ; $48C9: $20 $FB

    ld   [hl], c                                  ; $48CB: $71

jr_017_48CC:
    ret                                           ; $48CC: $C9

Data_017_48CD::
    db   $F4, $F4, $F5, $F6, $F7, $F7, $F8, $F8  ; $48CD
    db   $F8, $F8, $F7, $F7, $F6, $F5, $F4, $F4  ; $48D5

; Apply the waving visual effect when the Wind Fish appears
; or disappears.
ApplyWindFishVfx::
    ldh  a, [hFrameCounter]                               ; $48DD: $F0 $E7
    rra                                           ; $48DF: $1F
    rra                                           ; $48E0: $1F
    rra                                           ; $48E1: $1F
    nop                                           ; $48E2: $00
    and  $0F                                      ; $48E3: $E6 $0F
    ld   e, a                                     ; $48E5: $5F
    ld   d, $00                                   ; $48E6: $16 $00
    ld   hl, Data_017_48CD                        ; $48E8: $21 $CD $48
    add  hl, de                                   ; $48EB: $19
    ld   a, [hl]                                  ; $48EC: $7E
    sub  $05                                      ; $48ED: $D6 $05
    ldh  [rSCY], a                                ; $48EF: $E0 $42
    ldh  [$FFE8], a                               ; $48F1: $E0 $E8
    ld   a, [$C17F]                               ; $48F3: $FA $7F $C1
    cp   $FE                                      ; $48F6: $FE $FE
    ret  z                                        ; $48F8: $C8

    ld   a, [$C180]                               ; $48F9: $FA $80 $C1
    inc  a                                        ; $48FC: $3C
    ld   [$C180], a                               ; $48FD: $EA $80 $C1
    ld   a, [$D005]                               ; $4900: $FA $05 $D0
    ldh  [hScratch1], a                               ; $4903: $E0 $D8
    ld   hl, $C17C                                ; $4905: $21 $7C $C1
    xor  a                                        ; $4908: $AF
    ld   [hl+], a                                 ; $4909: $22
    ld   [hl+], a                                 ; $490A: $22
    ld   [hl+], a                                 ; $490B: $22
    ldh  a, [hIsGBC]                               ; $490C: $F0 $FE
    and  a                                        ; $490E: $A7
    jr   nz, jr_017_4964                          ; $490F: $20 $53

jr_017_4911:
    ldh  a, [rSTAT]                               ; $4911: $F0 $41
    and  $03                                      ; $4913: $E6 $03
    jr   nz, jr_017_4911                          ; $4915: $20 $FA

    ld   d, $00                                   ; $4917: $16 $00

jr_017_4919:
    ld   a, [$C17E]                               ; $4919: $FA $7E $C1
    inc  a                                        ; $491C: $3C
    ld   [$C17E], a                               ; $491D: $EA $7E $C1
    and  $01                                      ; $4920: $E6 $01
    jr   nz, jr_017_4919                          ; $4922: $20 $F5

    ld   a, [$C17C]                               ; $4924: $FA $7C $C1
    add  $01                                      ; $4927: $C6 $01
    ld   [$C17C], a                               ; $4929: $EA $7C $C1
    ld   a, [$C17D]                               ; $492C: $FA $7D $C1
    adc  $00                                      ; $492F: $CE $00
    ld   [$C17D], a                               ; $4931: $EA $7D $C1
    ld   a, [$C17C]                               ; $4934: $FA $7C $C1
    cp   $50                                      ; $4937: $FE $50
    jr   z, jr_017_4960                           ; $4939: $28 $25

    ld   hl, $C180                                ; $493B: $21 $80 $C1
    ld   a, [$C17C]                               ; $493E: $FA $7C $C1
    add  [hl]                                     ; $4941: $86
    and  $1F                                      ; $4942: $E6 $1F
    ld   hl, hScratch1                                ; $4944: $21 $D8 $FF
    or   [hl]                                     ; $4947: $B6
    ld   e, a                                     ; $4948: $5F
    ld   hl, Data_017_49B7                        ; $4949: $21 $B7 $49
    add  hl, de                                   ; $494C: $19
    ld   a, [hl]                                  ; $494D: $7E
    push af                                       ; $494E: $F5
    ld   hl, $FF96                                ; $494F: $21 $96 $FF
    add  [hl]                                     ; $4952: $86
    ldh  [rSCX], a                                ; $4953: $E0 $43
    pop  af                                       ; $4955: $F1
    sra  a                                        ; $4956: $CB $2F
    ld   hl, $FFE8                                ; $4958: $21 $E8 $FF
    add  [hl]                                     ; $495B: $86
    ldh  [rSCY], a                                ; $495C: $E0 $42
    jr   jr_017_4911                              ; $495E: $18 $B1

jr_017_4960:
    xor  a                                        ; $4960: $AF
    ldh  [rSCX], a                                ; $4961: $E0 $43
    ret                                           ; $4963: $C9

jr_017_4964:
    ldh  a, [rSTAT]                               ; $4964: $F0 $41
    and  $03                                      ; $4966: $E6 $03
    jr   nz, jr_017_4964                          ; $4968: $20 $FA

    ld   d, $00                                   ; $496A: $16 $00

jr_017_496C:
    ld   a, [$C17E]                               ; $496C: $FA $7E $C1
    inc  a                                        ; $496F: $3C
    ld   [$C17E], a                               ; $4970: $EA $7E $C1
    and  $01                                      ; $4973: $E6 $01
    jr   nz, jr_017_496C                          ; $4975: $20 $F5

    ld   a, [$C17C]                               ; $4977: $FA $7C $C1
    add  $01                                      ; $497A: $C6 $01
    ld   [$C17C], a                               ; $497C: $EA $7C $C1
    ld   a, [$C17D]                               ; $497F: $FA $7D $C1
    adc  $00                                      ; $4982: $CE $00
    ld   [$C17D], a                               ; $4984: $EA $7D $C1
    ld   a, [$C17C]                               ; $4987: $FA $7C $C1
    cp   $60                                      ; $498A: $FE $60
    jr   z, jr_017_49B3                           ; $498C: $28 $25

    ld   hl, $C180                                ; $498E: $21 $80 $C1
    ld   a, [$C17C]                               ; $4991: $FA $7C $C1
    add  [hl]                                     ; $4994: $86
    and  $1F                                      ; $4995: $E6 $1F
    ld   hl, hScratch1                                ; $4997: $21 $D8 $FF
    or   [hl]                                     ; $499A: $B6
    ld   e, a                                     ; $499B: $5F
    ld   hl, Data_017_49B7                        ; $499C: $21 $B7 $49
    add  hl, de                                   ; $499F: $19
    ld   a, [hl]                                  ; $49A0: $7E
    push af                                       ; $49A1: $F5
    ld   hl, $FF96                                ; $49A2: $21 $96 $FF
    add  [hl]                                     ; $49A5: $86
    ldh  [rSCX], a                                ; $49A6: $E0 $43
    pop  af                                       ; $49A8: $F1
    sra  a                                        ; $49A9: $CB $2F
    ld   hl, $FFE8                                ; $49AB: $21 $E8 $FF
    add  [hl]                                     ; $49AE: $86
    ldh  [rSCY], a                                ; $49AF: $E0 $42
    jr   jr_017_4964                              ; $49B1: $18 $B1

jr_017_49B3:
    xor  a                                        ; $49B3: $AF
    ldh  [rSCX], a                                ; $49B4: $E0 $43
    ret                                           ; $49B6: $C9

Data_017_49B7::
    db   $00, $05, $09, $0C, $0D, $0E, $0E, $0F  ; $49B7
    db   $0F, $0F, $0E, $0E, $0D, $0C, $09, $05  ; $49BF
    db   $00, $FB, $F7, $F4, $F3, $F2, $F2, $F1  ; $49C7
    db   $F1, $F1, $F2, $F2, $F3, $F4, $F7, $FB  ; $49CF
    db   $00, $04, $07, $09, $0B, $0C, $0C, $0D  ; $49D7
    db   $0D, $0D, $0C, $0C, $0B, $09, $07, $04  ; $49DF
    db   $00, $FC, $F9, $F7, $F5, $F4, $F4, $F3  ; $49E7
    db   $F3, $F3, $F4, $F4, $F5, $F7, $F9, $FC  ; $49EF
    db   $00, $03, $05, $07, $08, $09, $0A, $0B  ; $49F7
    db   $0B, $0B, $0A, $09, $08, $07, $05, $03  ; $49FF
    db   $00, $FD, $FB, $F9, $F8, $F7, $F6, $F5  ; $4A07
    db   $F5, $F5, $F6, $F7, $F8, $F9, $FB, $FD  ; $4A0F
    db   $00, $03, $05, $06, $07, $08, $08, $09  ; $4A17
    db   $09, $09, $08, $08, $07, $06, $05, $03  ; $4A1F
    db   $00, $FD, $FB, $FA, $F9, $F8, $F8, $F7  ; $4A27
    db   $F7, $F7, $F8, $F8, $F9, $FA, $FB, $FD  ; $4A2F
    db   $00, $02, $04, $05, $05, $06, $06, $07  ; $4A37
    db   $07, $07, $06, $06, $05, $05, $04, $02  ; $4A3F
    db   $00, $FE, $FC, $FB, $FB, $FA, $FA, $F9  ; $4A47
    db   $F9, $F9, $FA, $FA, $FB, $FB, $FC, $FE  ; $4A4F
    db   $00, $01, $02, $03, $03, $04, $04, $05  ; $4A57
    db   $05, $05, $04, $04, $03, $03, $02, $01  ; $4A5F
    db   $00, $FF, $FE, $FD, $FD, $FC, $FC, $FB  ; $4A67
    db   $FB, $FB, $FC, $FC, $FD, $FD, $FE, $FF  ; $4A6F
    db   $00, $01, $01, $01, $02, $02, $02, $03  ; $4A77
    db   $03, $03, $02, $02, $02, $01, $01, $01  ; $4A7F
    db   $00, $FF, $FF, $FF, $FE, $FE, $FE, $FD  ; $4A87
    db   $FD, $FD, $FE, $FE, $FE, $FF, $FF, $FF  ; $4A8F
    db   $00, $00, $00, $00, $01, $01, $01, $01  ; $4A97
    db   $01, $01, $01, $01, $01, $00, $00, $00  ; $4A9F
    db   $00, $00, $00, $00, $FF, $FF, $FF, $FF  ; $4AA7
    db   $FF, $FF, $FF, $FF, $FF, $00, $00, $00  ; $4AAF

EndCreditsEntryPoint::
    ldh  a, [$FFCC]                               ; $4AB7: $F0 $CC
    and  $0C                                      ; $4AB9: $E6 $0C
    jr   z, jr_017_4AC7                           ; $4ABB: $28 $0A

    ld   a, [ROM_DebugTool2]                      ; $4ABD: $FA $04 $00
    and  a                                        ; $4AC0: $A7
    jr   z, jr_017_4AC7                           ; $4AC1: $28 $04

    xor  a                                        ; $4AC3: $AF
    ld   [wGameplaySubtype], a                               ; $4AC4: $EA $96 $DB

jr_017_4AC7:
    ldh  a, [$FFCC]                               ; $4AC7: $F0 $CC
    and  $03                                      ; $4AC9: $E6 $03
    jr   z, jr_017_4AD6                           ; $4ACB: $28 $09

    ld   a, [$0004]                               ; $4ACD: $FA $04 $00
    and  a                                        ; $4AD0: $A7
    jr   z, jr_017_4AD6                           ; $4AD1: $28 $03

    call func_017_64DE                            ; $4AD3: $CD $DE $64

jr_017_4AD6:
    ld   a, [$D006]                               ; $4AD6: $FA $06 $D0
    and  a                                        ; $4AD9: $A7
    jr   z, jr_017_4AE0                           ; $4ADA: $28 $04

    dec  a                                        ; $4ADC: $3D
    ld   [$D006], a                               ; $4ADD: $EA $06 $D0

jr_017_4AE0:
    ld   a, [$D007]                               ; $4AE0: $FA $07 $D0
    and  a                                        ; $4AE3: $A7
    jr   z, jr_017_4AEA                           ; $4AE4: $28 $04

    dec  a                                        ; $4AE6: $3D
    ld   [$D007], a                               ; $4AE7: $EA $07 $D0

jr_017_4AEA:
    ld   a, [$D008]                               ; $4AEA: $FA $08 $D0
    and  a                                        ; $4AED: $A7
    jr   z, jr_017_4AF4                           ; $4AEE: $28 $04

    dec  a                                        ; $4AF0: $3D
    ld   [$D008], a                               ; $4AF1: $EA $08 $D0

jr_017_4AF4:
    ldh  a, [hFrameCounter]                               ; $4AF4: $F0 $E7
    and  $03                                      ; $4AF6: $E6 $03
    jr   nz, jr_017_4B04                          ; $4AF8: $20 $0A

    ld   a, [$D009]                               ; $4AFA: $FA $09 $D0
    and  a                                        ; $4AFD: $A7
    jr   z, jr_017_4B04                           ; $4AFE: $28 $04

    dec  a                                        ; $4B00: $3D
    ld   [$D009], a                               ; $4B01: $EA $09 $D0

jr_017_4B04:
    ldh  a, [hFrameCounter]                               ; $4B04: $F0 $E7
    and  $0F                                      ; $4B06: $E6 $0F
    jr   nz, jr_017_4B14                          ; $4B08: $20 $0A

    ld   a, [$D013]                               ; $4B0A: $FA $13 $D0
    and  a                                        ; $4B0D: $A7
    jr   z, jr_017_4B14                           ; $4B0E: $28 $04

    dec  a                                        ; $4B10: $3D
    ld   [$D013], a                               ; $4B11: $EA $13 $D0

jr_017_4B14:
    ld   a, [$D01E]                               ; $4B14: $FA $1E $D0
    and  a                                        ; $4B17: $A7
    jr   z, jr_017_4B22                           ; $4B18: $28 $08

    dec  a                                        ; $4B1A: $3D
    ld   [$D01E], a                               ; $4B1B: $EA $1E $D0
    ld   hl, $D008                                ; $4B1E: $21 $08 $D0
    inc  [hl]                                     ; $4B21: $34

jr_017_4B22:
    ld   a, [wGameplaySubtype]                    ; $4B22: $FA $96 $DB
    JP_TABLE                                      ; $4B25: $C7
._00 dw CreditsInitHandler
._01 dw CreditsFadeoutHandler
._02 dw CreditsWindFishHandler
._03 dw CreditsSunAboveHandler
._04 dw CreditsLinkOnSeaLargeHandler
._05 dw CreditsLinkOnSeaCloseHandler
._06 dw CreditsLinkSeatedOnLogHandler
._07 dw CreditsLinkFaceCloseUpHandler
._08 dw CreditsRollHandler
._09 dw CreditsTheEndHandler

Data_017_4B3A::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00
    db   $E4, $E4, $E4, $E4, $94, $94, $94, $94, $40, $40, $40, $40, $00, $00, $00, $00
    db   $1C, $1C, $1C, $1C, $18, $18, $18, $18, $04, $04, $04, $04, $00, $00, $00, $00

CreditsInitHandler::
    call ResetCreditsSceneVariables                            ; $4BDA: $CD $A5 $4D
    jp   IncrementCreditsGameplaySubtypeAndReturn ; $4BDD: $C3 $5B $4C

CreditsFadeoutHandler::
    call AnimateEntitiesAndRestoreBank17          ; $4BE0: $CD $ED $0E
    ldh  a, [hFrameCounter]                               ; $4BE3: $F0 $E7
    and  $03                                      ; $4BE5: $E6 $03
    jr   nz, jr_017_4C03                          ; $4BE7: $20 $1A

    ld   a, [$D001]                               ; $4BE9: $FA $01 $D0
    inc  a                                        ; $4BEC: $3C
    ld   [$D001], a                               ; $4BED: $EA $01 $D0
    cp   $0D                                      ; $4BF0: $FE $0D
    jr   nz, jr_017_4BF7                          ; $4BF2: $20 $03

    jp   label_017_4C22                           ; $4BF4: $C3 $22 $4C

jr_017_4BF7:
    ldh  a, [hIsGBC]                               ; $4BF7: $F0 $FE
    and  a                                        ; $4BF9: $A7
    jr   z, jr_017_4C03                           ; $4BFA: $28 $07

    ld   a, [$D001]                               ; $4BFC: $FA $01 $D0
    dec  a                                        ; $4BFF: $3D
    jp   label_017_7F30                           ; $4C00: $C3 $30 $7F

jr_017_4C03:
    ld   a, [$D001]                               ; $4C03: $FA $01 $D0
    ld   e, a                                     ; $4C06: $5F
    ldh  a, [hFrameCounter]                               ; $4C07: $F0 $E7
    and  $03                                      ; $4C09: $E6 $03
    add  e                                        ; $4C0B: $83
    ld   e, a                                     ; $4C0C: $5F
    ld   d, b                                     ; $4C0D: $50
    ld   hl, $4BBA                                ; $4C0E: $21 $BA $4B
    add  hl, de                                   ; $4C11: $19
    ld   a, [hl]                                  ; $4C12: $7E
    ld   [wBGPalette], a                               ; $4C13: $EA $97 $DB
    ld   [wOBJ1Palette], a                               ; $4C16: $EA $99 $DB
    ld   hl, $4BCA                                ; $4C19: $21 $CA $4B
    add  hl, de                                   ; $4C1C: $19
    ld   a, [hl]                                  ; $4C1D: $7E
    ld   [wOBJ0Palette], a                               ; $4C1E: $EA $98 $DB
    ret                                           ; $4C21: $C9

label_017_4C22:
    call ClearLowerAndMiddleWRAM                  ; $4C22: $CD $C1 $29
    ld   hl, $D700                                ; $4C25: $21 $00 $D7
    ld   de, $4B3A                                ; $4C28: $11 $3A $4B
    ld   c, $80                                   ; $4C2B: $0E $80
    ld   a, $01                                   ; $4C2D: $3E $01

jr_017_4C2F:
    ld   a, [de]                                  ; $4C2F: $1A
    inc  de                                       ; $4C30: $13
    ld   [hl+], a                                 ; $4C31: $22
    dec  c                                        ; $4C32: $0D
    jr   nz, jr_017_4C2F                          ; $4C33: $20 $FA

    call label_27F2                               ; $4C35: $CD $F2 $27
    ld   a, $01                                   ; $4C38: $3E $01
    ldh  [rIE], a                                 ; $4C3A: $E0 $FF
    ld   a, $00                                   ; $4C3C: $3E $00
    ldh  [rLYC], a                                ; $4C3E: $E0 $45
    ld   hl, $D6FD                                ; $4C40: $21 $FD $D6
    res  3, [hl]                                  ; $4C43: $CB $9E
    call ResetCreditsSceneVariables                            ; $4C45: $CD $A5 $4D
    call IncrementCreditsGameplaySubtype                 ; $4C48: $CD $5B $4C
    ld   a, $59                                   ; $4C4B: $3E $59
    ld   [$D368], a                               ; $4C4D: $EA $68 $D3
    ld   a, $40                                   ; $4C50: $3E $40
    ld   [$D006], a                               ; $4C52: $EA $06 $D0
    ld   a, $04                                   ; $4C55: $3E $04
    ld   [$C16B], a                               ; $4C57: $EA $6B $C1
    ret                                           ; $4C5A: $C9

IncrementCreditsGameplaySubtype::
IncrementCreditsGameplaySubtypeAndReturn::
    ld   hl, wGameplaySubtype                     ; $4C5B: $21 $96 $DB
    inc  [hl]                                     ; $4C5E: $34
    ret                                           ; $4C5F: $C9

; Owl speech, Wind Fish speech, song of awakening sequence
CreditsWindFishHandler::
    ld   a, $80                                   ; $4C60: $3E $80
    ld   [wIsBowWowFollowingLink], a              ; $4C62: $EA $56 $DB
    xor  a                                        ; $4C65: $AF
    ld   [wIsIndoor], a                           ; $4C66: $EA $A5 $DB
    ldh  [hRoomStatus], a                         ; $4C69: $E0 $F8
    ld   a, $01                                   ; $4C6B: $3E $01
    ld   [$C3C8], a                               ; $4C6D: $EA $C8 $C3
    ld   a, $92                                   ; $4C70: $3E $92
    ldh  [$FFF6], a                               ; $4C72: $E0 $F6
    ld   a, $FF                                   ; $4C74: $3E $FF
    ld   [$DBC7], a                               ; $4C76: $EA $C7 $DB
    call AnimateEntitiesAndRestoreBank17                                    ; $4C79: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $4C7C: $FA $0E $D0
    JP_TABLE                                      ; $4C7F: $C7
._00 dw CreditsStairsPrepare1Handler              ; $4C80
._01 dw CreditsStairsPrepare2Handler              ; $4C82
._02 dw CreditsStairsFadeInHandler                ; $4C84
._03 dw CreditsStairsClimbingHandler              ; $4C86
._04 dw CreditsStairsReachingPlatformHandler      ; $4C88
._05 dw CreditsStairsOwlSpeechHandler             ; $4C8A
._06 dw CreditsWindFishPrepare1Handler            ; $4C8C
._07 dw CreditsWindFishPrepare2Handler            ; $4C8E
._08 dw CreditsWindFishPrepare3Handler            ; $4C90
._09 dw CreditsWindFishApparitionHandler          ; $4C92
._0A dw CreditsWindFishFloatingHandler            ; $4C94
._0B dw CreditsWindFishSpeechHandler              ; $4C96
._0C dw CreditsWindFishPrepareDisapparitionHandler ; $4C98
._0D dw CreditsWindFishDisapparitionHandler       ; $4C9A
._0E dw CreditsWindFishDisappearedHandler         ; $4C9C
._0F dw CreditsPlayInstrumentsDialogHandler       ; $4C9E
._10 dw CreditsLinkTurnsToPlayHandler             ; $4CA0
._11 dw CreditsLinkPreparesToPlayHandler          ; $4CA2
._12 dw CreditsLinkShowsInstrumentsHandler        ; $4CA4
._13 dw CreditsInstrumentsPlayingHandler          ; $4CA6
._14 dw CreditsWaterAppearingHandler              ; $4CA8
._15 dw CreditsWaterSplashingHandler              ; $4CAA
._16 dw CreditsWaterMovingUpHandler               ; $4CAC
._17 dw CreditsWaterFadeToWhiteHandler            ; $4CAE
._18 dw CreditsWaterNoiseFadingOutHandler         ; $4CB0

CreditsStairsPrepare1Handler::
    ; Hide the Window
    ld   a, $FF                                   ; $4CB2: $3E $FF
    ld   [wWindowY], a                            ; $4CB4: $EA $9A $DB

    ; Prepare the loading of tilemap and palette
    ld   a, $1F                                   ; $4CB7: $3E $1F
    ld   [wTileMapToLoad], a                      ; $4CB9: $EA $FE $D6
    ld   a, $01                                   ; $4CBC: $3E $01
    ld   [wPaletteUnknownE], a                    ; $4CBE: $EA $D5 $DD

    ; Clear scroll variables
    xor  a                                        ; $4CC1: $AF
    ldh  [hBaseScrollX], a                        ; $4CC2: $E0 $96
    ld   [wScreenShakeHorizontal], a              ; $4CC4: $EA $55 $C1
    ld   [wScreenShakeVertical], a                ; $4CC7: $EA $56 $C1
    ldh  [hBaseScrollY], a                        ; $4CCA: $E0 $97

    ; Clear $0C bytes starting from wRoomTransitionState
    ld   hl, wRoomTransitionState                 ; $4CCC: $21 $24 $C1
    ld   e, $00                                   ; $4CCF: $1E $00
.loop
    xor  a                                        ; $4CD1: $AF
    ld   [hl+], a                                 ; $4CD2: $22
    inc  e                                        ; $4CD3: $1C
    ld   a, e                                     ; $4CD4: $7B
    cp   $0C                                      ; $4CD5: $FE $0C
    jr   nz, .loop                                ; $4CD7: $20 $F8

IncrementCreditsSubscene::
IncrementCreditsSubsceneAndReturn::
    ld   hl, wCreditsSubscene                     ; $4CD9: $21 $0E $D0
    inc  [hl]                                     ; $4CDC: $34
    ret                                           ; $4CDD: $C9

CreditsStairsPrepare2Handler::
    ; Prepare loading of background map
    ld   a, $16                                   ; $4CDE: $3E $16
    ld   [wBGMapToLoad], a                        ; $4CE0: $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $4CE3: $3E $E8
    call SpawnNewEntity_trampoline                ; $4CE5: $CD $86 $3B

    ;
    ; Set Link initial position
    ;

    ld   hl, wEntitiesPosXTable                   ; $4CE8: $21 $00 $C2
    add  hl, de                                   ; $4CEB: $19
    ld   [hl], $40                                ; $4CEC: $36 $40

    ld   hl, wEntitiesPosYTable                   ; $4CEE: $21 $10 $C2
    add  hl, de                                   ; $4CF1: $19
    ld   [hl], $E0                                ; $4CF2: $36 $E0

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $4CF4: $3E $E8
    call SpawnNewEntity_trampoline                ; $4CF6: $CD $86 $3B

    ld   hl, wEntitiesSubstate1Table              ; $4CF9: $21 $B0 $C2
    add  hl, de                                   ; $4CFC: $19
    inc  [hl]                                     ; $4CFD: $34
    ld   a, $50                                   ; $4CFE: $3E $50
    ldh  [hLinkPositionX], a                      ; $4D00: $E0 $98
    ld   a, $98                                   ; $4D02: $3E $98
    ldh  [hLinkPositionY], a                      ; $4D04: $E0 $99
    jp   IncrementCreditsSubsceneAndReturn                   ; $4D06: $C3 $D9 $4C

Data_017_4D09::
    db   $00, $00, $00, $00, $01, $01, $01, $01  ; $4D09 |........|
    db   $16, $16, $16, $16, $27, $27, $27, $27  ; $4D11 |....''''|
    db   $00, $00, $00, $00, $04, $04, $04, $04  ; $4D19 |........|
    db   $18, $18, $18, $18, $1C, $1C, $1C, $1C  ; $4D21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $4D29 |........|
    db   $50, $50, $50, $50, $90, $90, $90, $90  ; $4D31 |PPPP....|

CreditsStairsFadeInHandler::
    ld   a, [$D006]                               ; $4D39: $FA $06 $D0
    ld   e, a                                     ; $4D3C: $5F

jr_017_4D3D:
    ldh  a, [hFrameCounter]                               ; $4D3D: $F0 $E7
    and  $07                                      ; $4D3F: $E6 $07
    or   e                                        ; $4D41: $B3
    jr   nz, jr_017_4D5E                          ; $4D42: $20 $1A

    ld   a, [$D001]                               ; $4D44: $FA $01 $D0
    inc  a                                        ; $4D47: $3C
    ld   [$D001], a                               ; $4D48: $EA $01 $D0
    cp   $0C                                      ; $4D4B: $FE $0C
    jr   nz, jr_017_4D52                          ; $4D4D: $20 $03

    call IncrementCreditsSubscene                            ; $4D4F: $CD $D9 $4C

jr_017_4D52:
    ldh  a, [hIsGBC]                               ; $4D52: $F0 $FE
    and  a                                        ; $4D54: $A7
    jr   z, jr_017_4D5E                           ; $4D55: $28 $07

    ld   a, [$D001]                               ; $4D57: $FA $01 $D0
    dec  a                                        ; $4D5A: $3D
    jp   label_017_7E80                           ; $4D5B: $C3 $80 $7E

jr_017_4D5E:
    ld   a, [$D001]                               ; $4D5E: $FA $01 $D0
    ld   e, a                                     ; $4D61: $5F
    ldh  a, [hFrameCounter]                               ; $4D62: $F0 $E7
    and  $03                                      ; $4D64: $E6 $03
    add  e                                        ; $4D66: $83
    ld   e, a                                     ; $4D67: $5F
    ld   d, b                                     ; $4D68: $50
    ld   hl, Data_017_4D09                        ; $4D69: $21 $09 $4D
    add  hl, de                                   ; $4D6C: $19
    ld   a, [hl]                                  ; $4D6D: $7E
    ld   [wBGPalette], a                               ; $4D6E: $EA $97 $DB
    ld   hl, $4D19                                ; $4D71: $21 $19 $4D
    add  hl, de                                   ; $4D74: $19
    ld   a, [hl]                                  ; $4D75: $7E
    ld   [wOBJ0Palette], a                               ; $4D76: $EA $98 $DB
    ld   hl, $4D29                                ; $4D79: $21 $29 $4D
    add  hl, de                                   ; $4D7C: $19
    ld   a, [hl]                                  ; $4D7D: $7E
    ld   [wOBJ1Palette], a                               ; $4D7E: $EA $99 $DB

CreditsStairsClimbingHandler::
    ld   a, [$D003]                               ; $4D81: $FA $03 $D0
    add  $18                                      ; $4D84: $C6 $18
    ld   [$D003], a                               ; $4D86: $EA $03 $D0
    jr   nc, jr_017_4D8F                          ; $4D89: $30 $04

    ld   hl, $C21E                                ; $4D8B: $21 $1E $C2
    inc  [hl]                                     ; $4D8E: $34

jr_017_4D8F:
    ld   a, [$D002]                               ; $4D8F: $FA $02 $D0
    add  $40                                      ; $4D92: $C6 $40
    ld   [$D002], a                               ; $4D94: $EA $02 $D0
    jr   nc, jr_017_4DD0                          ; $4D97: $30 $37

    ldh  a, [hBaseScrollY]                               ; $4D99: $F0 $97
    dec  a                                        ; $4D9B: $3D
    ldh  [hBaseScrollY], a                               ; $4D9C: $E0 $97
    cp   $90                                      ; $4D9E: $FE $90
    jr   nz, jr_017_4DD0                          ; $4DA0: $20 $2E

    call IncrementCreditsSubscene                            ; $4DA2: $CD $D9 $4C

ResetCreditsSceneVariables::
    xor  a                                        ; $4DA5: $AF
    ld   [$D000], a                               ; $4DA6: $EA $00 $D0
    ld   [$D001], a                               ; $4DA9: $EA $01 $D0
    ld   [$D002], a                               ; $4DAC: $EA $02 $D0
    ld   [$D003], a                               ; $4DAF: $EA $03 $D0
    ld   [$D004], a                               ; $4DB2: $EA $04 $D0
    ld   [$D005], a                               ; $4DB5: $EA $05 $D0
    ld   [$D00A], a                               ; $4DB8: $EA $0A $D0
    ld   [$D00B], a                               ; $4DBB: $EA $0B $D0
    ld   [$D00C], a                               ; $4DBE: $EA $0C $D0
    ld   [$D00D], a                               ; $4DC1: $EA $0D $D0
    ld   [$D006], a                               ; $4DC4: $EA $06 $D0
    ld   [$D007], a                               ; $4DC7: $EA $07 $D0
    ld   [$D008], a                               ; $4DCA: $EA $08 $D0
    ld   [$D009], a                               ; $4DCD: $EA $09 $D0

jr_017_4DD0:
    ret                                           ; $4DD0: $C9

Data_017_4DD1::
    db   $98, $00, $53, $A0, $98, $20, $53, $A0  ; $4DD1 |..S.. S.|
    db   $98, $40, $53, $A0, $98, $60, $53, $A0  ; $4DD9 |.@S..`S.|
    db   $98, $80, $53, $A0, $98, $A0, $53, $A0  ; $4DE1 |..S...S.|
    db   $98, $C0, $53, $A0, $98, $E0, $53, $A0  ; $4DE9 |..S...S.|
    db   $99, $00, $53, $A0, $99, $20, $53, $A0  ; $4DF1 |..S.. S.|
    db   $99, $40, $53, $A0, $99, $60, $53, $A0  ; $4DF9 |.@S..`S.|
    db   $99, $80, $53, $A0, $99, $A0, $53, $A0  ; $4E01 |..S...S.|
    db   $99, $C0, $53, $A0, $99, $E0, $53, $A0  ; $4E09 |..S...S.|
    db   $9A, $00, $53, $A0, $9A, $20, $53, $A0  ; $4E11 |..S.. S.|

CreditsStairsReachingPlatformHandler::
    ld   a, [$D000]                               ; $4E19: $FA $00 $D0
    cp   $09                                      ; $4E1C: $FE $09
    jr   nz, jr_017_4E27                          ; $4E1E: $20 $07

    ld   a, $F0                                   ; $4E20: $3E $F0
    ldh  [hBaseScrollY], a                               ; $4E22: $E0 $97
    jp   IncrementCreditsSubsceneAndReturn                           ; $4E24: $C3 $D9 $4C

jr_017_4E27:
    ld   e, a                                     ; $4E27: $5F
    inc  a                                        ; $4E28: $3C
    ld   [$D000], a                               ; $4E29: $EA $00 $D0
    sla  e                                        ; $4E2C: $CB $23
    sla  e                                        ; $4E2E: $CB $23
    sla  e                                        ; $4E30: $CB $23
    ld   d, $00                                   ; $4E32: $16 $00
    ld   hl, Data_017_4DD1                        ; $4E34: $21 $D1 $4D
    add  hl, de                                   ; $4E37: $19
    ld   de, $D601                                ; $4E38: $11 $01 $D6
    ld   c, $08                                   ; $4E3B: $0E $08

jr_017_4E3D:
    ld   a, [hl+]                                 ; $4E3D: $2A
    ld   [de], a                                  ; $4E3E: $12
    inc  de                                       ; $4E3F: $13
    dec  c                                        ; $4E40: $0D
    jr   nz, jr_017_4E3D                          ; $4E41: $20 $FA

    xor  a                                        ; $4E43: $AF
    ld   [de], a                                  ; $4E44: $12
    ret                                           ; $4E45: $C9

CreditsStairsOwlSpeechHandler::
    ldh  a, [hIsGBC]                               ; $4E46: $F0 $FE
    and  a                                        ; $4E48: $A7
    ret  z                                        ; $4E49: $C8

    ld   a, [$D014]                               ; $4E4A: $FA $14 $D0
    cp   $0E                                      ; $4E4D: $FE $0E
    ret  z                                        ; $4E4F: $C8

    ld   bc, $D601                                ; $4E50: $01 $01 $D6
    ld   de, $DC91                                ; $4E53: $11 $91 $DC
    ld   hl, $9880                                ; $4E56: $21 $80 $98
    swap a                                        ; $4E59: $CB $37
    sla  a                                        ; $4E5B: $CB $27
    push af                                       ; $4E5D: $F5
    ld   a, h                                     ; $4E5E: $7C
    adc  $00                                      ; $4E5F: $CE $00
    ld   h, a                                     ; $4E61: $67
    pop  af                                       ; $4E62: $F1
    add  l                                        ; $4E63: $85
    ld   l, a                                     ; $4E64: $6F
    ld   a, h                                     ; $4E65: $7C
    adc  $00                                      ; $4E66: $CE $00
    ld   [bc], a                                  ; $4E68: $02
    ld   [de], a                                  ; $4E69: $12
    inc  bc                                       ; $4E6A: $03

jr_017_4E6B:
    inc  de                                       ; $4E6B: $13
    ld   a, l                                     ; $4E6C: $7D
    ld   [bc], a                                  ; $4E6D: $02
    ld   [de], a                                  ; $4E6E: $12
    inc  bc                                       ; $4E6F: $03
    inc  de                                       ; $4E70: $13
    ld   a, $53                                   ; $4E71: $3E $53
    ld   [bc], a                                  ; $4E73: $02
    ld   [de], a                                  ; $4E74: $12
    inc  bc                                       ; $4E75: $03
    inc  de                                       ; $4E76: $13
    ld   a, $A0                                   ; $4E77: $3E $A0
    ld   [bc], a                                  ; $4E79: $02
    xor  a                                        ; $4E7A: $AF
    ld   [de], a                                  ; $4E7B: $12
    inc  bc                                       ; $4E7C: $03
    inc  de                                       ; $4E7D: $13
    ld   [bc], a                                  ; $4E7E: $02
    ld   [de], a                                  ; $4E7F: $12
    ld   hl, $D014                                ; $4E80: $21 $14 $D0
    inc  [hl]                                     ; $4E83: $34
    ret                                           ; $4E84: $C9

CreditsWindFishPrepare1Handler::
    call ResetCreditsSceneVariables                            ; $4E85: $CD $A5 $4D
    ld   a, $08                                   ; $4E88: $3E $08
    ld   [$D006], a                               ; $4E8A: $EA $06 $D0
    call func_017_4E93                            ; $4E8D: $CD $93 $4E
    jp   IncrementCreditsSubsceneAndReturn                           ; $4E90: $C3 $D9 $4C

func_017_4E93:
    ldh  a, [hIsGBC]                               ; $4E93: $F0 $FE
    and  a                                        ; $4E95: $A7
    ret  z                                        ; $4E96: $C8

    ld   hl, $DC10                                ; $4E97: $21 $10 $DC
    ld   b, $40                                   ; $4E9A: $06 $40
    xor  a                                        ; $4E9C: $AF

.loop
    ld   [hl+], a                                 ; $4E9D: $22
    dec  b                                        ; $4E9E: $05
    jr   nz, .loop                                ; $4E9F: $20 $FC

    ld   hl, $DC1E                                ; $4EA1: $21 $1E $DC
    dec  a                                        ; $4EA4: $3D
    ld   [hl+], a                                 ; $4EA5: $22
    ld   a, $47                                   ; $4EA6: $3E $47
    ld   [hl], a                                  ; $4EA8: $77
    xor  a                                        ; $4EA9: $AF
    ld   [$DDD3], a                               ; $4EAA: $EA $D3 $DD
    ld   a, $20                                   ; $4EAD: $3E $20
    ld   [$DDD4], a                               ; $4EAF: $EA $D4 $DD
    ld   a, $81                                   ; $4EB2: $3E $81
    ld   [$DDD1], a                               ; $4EB4: $EA $D1 $DD
    ret                                           ; $4EB7: $C9

    daa                                           ; $4EB8: $27
    daa                                           ; $4EB9: $27
    db   $EB                                      ; $4EBA: $EB
    rst  $38                                      ; $4EBB: $FF
    rst  $38                                      ; $4EBC: $FF
    rst  $38                                      ; $4EBD: $FF

CreditsWindFishPrepare2Handler::
    ldh  a, [hFrameCounter]                               ; $4EBE: $F0 $E7
    and  $01                                      ; $4EC0: $E6 $01
    ld   e, a                                     ; $4EC2: $5F
    ld   a, [$D00A]                               ; $4EC3: $FA $0A $D0
    add  e                                        ; $4EC6: $83
    ld   e, a                                     ; $4EC7: $5F
    ld   d, $00                                   ; $4EC8: $16 $00
    ld   hl, $4EB8                                ; $4ECA: $21 $B8 $4E
    add  hl, de                                   ; $4ECD: $19
    ld   a, [hl]                                  ; $4ECE: $7E
    ld   [wBGPalette], a                               ; $4ECF: $EA $97 $DB
    ld   a, [$D006]                               ; $4ED2: $FA $06 $D0
    and  a                                        ; $4ED5: $A7
    jr   nz, jr_017_4EEE                          ; $4ED6: $20 $16

    ld   a, $08                                   ; $4ED8: $3E $08
    ld   [$D006], a                               ; $4EDA: $EA $06 $D0
    ld   a, [$D00A]                               ; $4EDD: $FA $0A $D0
    inc  a                                        ; $4EE0: $3C
    ld   [$D00A], a                               ; $4EE1: $EA $0A $D0
    cp   $05                                      ; $4EE4: $FE $05
    jr   nz, jr_017_4EEE                          ; $4EE6: $20 $06

    call ResetCreditsSceneVariables                            ; $4EE8: $CD $A5 $4D
    jp   IncrementCreditsSubsceneAndReturn                           ; $4EEB: $C3 $D9 $4C

jr_017_4EEE:
    ret                                           ; $4EEE: $C9

Data_017_4EEF::
    db   $9B, $C0, $13, $A0, $A0, $A0, $A0, $A0  ; $4EEF |........|
    db   $A0, $A0, $A0, $A0, $A0, $72, $73, $74  ; $4EF7 |.....rst|
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $4EFF |........|
    db   $9B, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $4F07 |........|
    db   $A0, $A0, $A0, $A0, $A0, $7B, $7C, $7D  ; $4F0F |.....{|}|
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $4F17 |........|
    db   $98, $00, $13, $A0, $A0, $A0, $A0, $A0  ; $4F1F |........|
    db   $A0, $A0, $05, $06, $07, $08, $09, $0A  ; $4F27 |........|
    db   $0B, $0C, $0D, $0E, $A0, $A0, $A0, $00  ; $4F2F |........|
    db   $98, $20, $13, $A0, $A0, $A0, $A0, $A0  ; $4F37 |. ......|
    db   $13, $14, $15, $16, $17, $18, $19, $1A  ; $4F3F |........|
    db   $1B, $1C, $1D, $1E, $1F, $A0, $A0, $00  ; $4F47 |........|
    db   $98, $40, $13, $A0, $A0, $A0, $A0, $22  ; $4F4F |.@....."|
    db   $23, $24, $25, $26, $27, $28, $29, $2A  ; $4F57 |#$%&'()*|
    db   $2B, $2C, $2D, $2E, $2F, $A0, $A0, $00  ; $4F5F |+,-./...|
    db   $98, $60, $13, $A0, $A0, $A0, $31, $32  ; $4F67 |.`....12|
    db   $33, $34, $35, $36, $37, $38, $39, $3A  ; $4F6F |3456789:|
    db   $3B, $3C, $3D, $3E, $3F, $A0, $A0, $00  ; $4F77 |;<=>?...|
    db   $98, $80, $13, $A0, $A0, $40, $41, $42  ; $4F7F |.....@AB|
    db   $43, $44, $45, $46, $47, $48, $49, $4A  ; $4F87 |CDEFGHIJ|
    db   $4B, $4C, $4D, $4E, $4F, $A0, $A0, $00  ; $4F8F |KLMNO...|
    db   $98, $A0, $13, $A0, $A0, $50, $51, $52  ; $4F97 |.....PQR|
    db   $53, $54, $55, $56, $57, $58, $59, $A0  ; $4F9F |STUVWXY.|
    db   $5B, $5C, $5D, $5E, $5F, $A0, $A0, $00  ; $4FA7 |[\]^_...|
    db   $98, $C0, $13, $A0, $A0, $60, $61, $62  ; $4FAF |.....`ab|
    db   $63, $64, $65, $66, $67, $68, $69, $6A  ; $4FB7 |cdefghij|
    db   $A0, $6C, $6D, $6E, $6F, $A0, $A0, $00  ; $4FBF |.lmno...|
    db   $98, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $4FC7 |........|
    db   $A0, $A0, $75, $76, $77, $78, $79, $7A  ; $4FCF |..uvwxyz|
    db   $A0, $A0, $A0, $7E, $AF, $A0, $A0, $00  ; $4FD7 |...~....|
    db   $9B, $C0, $13, $00, $00, $00, $00, $00  ; $4FDF |........|
    db   $00, $00, $00, $00, $00, $03, $03, $03  ; $4FE7 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $4FEF |........|
    db   $9B, $E0, $13, $00, $00, $00, $00, $00  ; $4FF7 |........|
    db   $00, $00, $00, $00, $00, $03, $03, $03  ; $4FFF |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5007 |........|
    db   $98, $00, $13, $00, $00, $00, $00, $00  ; $500F |........|
    db   $00, $00, $01, $01, $04, $05, $05, $05  ; $5017 |........|
    db   $05, $05, $04, $04, $00, $00, $00, $00  ; $501F |........|
    db   $98, $20, $13, $00, $00, $00, $00, $00  ; $5027 |. ......|
    db   $01, $01, $01, $07, $04, $06, $06, $06  ; $502F |........|
    db   $06, $06, $04, $04, $05, $00, $00, $00  ; $5037 |........|
    db   $98, $40, $13, $00, $00, $00, $00, $01  ; $503F |.@......|
    db   $07, $07, $07, $02, $04, $04, $04, $04  ; $5047 |........|
    db   $04, $04, $04, $04, $05, $00, $00, $00  ; $504F |........|
    db   $98, $60, $13, $00, $00, $00, $03, $03  ; $5057 |.`......|
    db   $02, $02, $02, $02, $04, $00, $02, $03  ; $505F |........|
    db   $03, $00, $00, $04, $03, $00, $00, $00  ; $5067 |........|
    db   $98, $80, $13, $00, $00, $03, $03, $03  ; $506F |........|
    db   $03, $03, $03, $04, $05, $03, $03, $03  ; $5077 |........|
    db   $03, $05, $05, $03, $03, $00, $00, $00  ; $507F |........|
    db   $98, $A0, $13, $00, $00, $00, $00, $00  ; $5087 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $508F |........|
    db   $05, $05, $05, $05, $05, $00, $00, $00  ; $5097 |........|
    db   $98, $C0, $13, $00, $00, $00, $00, $00  ; $509F |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $50A7 |........|
    db   $00, $05, $05, $05, $05, $00, $00, $00  ; $50AF |........|
    db   $98, $E0, $13, $00, $00, $00, $00, $00  ; $50B7 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $50BF |........|
    db   $00, $00, $00, $00, $05, $00, $00, $00  ; $50C7 |........|

CreditsWindFishPrepare3Handler::
    ld   a, [$D000]                               ; $50CF: $FA $00 $D0
    cp   $0A                                      ; $50D2: $FE $0A
    jr   nz, jr_017_50F9                          ; $50D4: $20 $23

    ld   a, $F0                                   ; $50D6: $3E $F0
    ldh  [hBaseScrollY], a                               ; $50D8: $E0 $97
    call ResetCreditsSceneVariables                            ; $50DA: $CD $A5 $4D
    ld   a, $01                                   ; $50DD: $3E $01
    ldh  [rIE], a                                 ; $50DF: $E0 $FF
    ld   a, $56                                   ; $50E1: $3E $56
    ldh  [rLYC], a                                ; $50E3: $E0 $45
    ld   a, $0C                                   ; $50E5: $3E $0C
    ld   [$D006], a                               ; $50E7: $EA $06 $D0
    ld   a, $FF                                   ; $50EA: $3E $FF
    ld   [$C17F], a                               ; $50EC: $EA $7F $C1
    ld   a, $09                                   ; $50EF: $3E $09
    ld   [wCreditsSubscene], a                               ; $50F1: $EA $0E $D0
    ld   a, $1F                                   ; $50F4: $3E $1F
    ldh  [hWaveSfx], a                               ; $50F6: $E0 $F3
    ret                                           ; $50F8: $C9

jr_017_50F9:
    ld   e, a                                     ; $50F9: $5F
    inc  a                                        ; $50FA: $3C
    ld   [$D000], a                               ; $50FB: $EA $00 $D0
    sla  e                                        ; $50FE: $CB $23
    sla  e                                        ; $5100: $CB $23
    sla  e                                        ; $5102: $CB $23
    ld   a, e                                     ; $5104: $7B
    sla  e                                        ; $5105: $CB $23
    add  e                                        ; $5107: $83
    ld   e, a                                     ; $5108: $5F
    ld   d, $00                                   ; $5109: $16 $00
    ld   hl, Data_017_4EEF                        ; $510B: $21 $EF $4E
    add  hl, de                                   ; $510E: $19
    push de                                       ; $510F: $D5
    ld   de, $D601                                ; $5110: $11 $01 $D6
    ld   c, $18                                   ; $5113: $0E $18

jr_017_5115:
    ld   a, [hl+]                                 ; $5115: $2A
    ld   [de], a                                  ; $5116: $12
    inc  de                                       ; $5117: $13
    dec  c                                        ; $5118: $0D
    jr   nz, jr_017_5115                          ; $5119: $20 $FA

    pop  de                                       ; $511B: $D1
    ldh  a, [hIsGBC]                               ; $511C: $F0 $FE
    and  a                                        ; $511E: $A7
    ret  z                                        ; $511F: $C8

    ld   hl, $4FDF                                ; $5120: $21 $DF $4F
    add  hl, de                                   ; $5123: $19
    ld   de, $DC91                                ; $5124: $11 $91 $DC
    ld   c, $18                                   ; $5127: $0E $18

jr_017_5129:
    ld   a, [hl+]                                 ; $5129: $2A
    ld   [de], a                                  ; $512A: $12
    inc  de                                       ; $512B: $13
    dec  c                                        ; $512C: $0D
    jr   nz, jr_017_5129                          ; $512D: $20 $FA

    ret                                           ; $512F: $C9

Data_017_5130::
    db   $FF, $FF, $FF, $FF, $BF, $BF, $BF, $BF  ; $5130
    db   $6B, $6B, $6B, $6B, $27, $27, $27, $27  ; $5138

CreditsWindFishApparitionHandler::
    ldh  a, [hFrameCounter]                               ; $5140: $F0 $E7
    and  $03                                      ; $5142: $E6 $03
    ld   e, a                                     ; $5144: $5F
    ldh  a, [hIsGBC]                               ; $5145: $F0 $FE
    and  a                                        ; $5147: $A7
    jr   z, jr_017_5151                           ; $5148: $28 $07

    ld   a, $01                                   ; $514A: $3E $01
    call func_017_53A7                            ; $514C: $CD $A7 $53
    jr   jr_017_5160                              ; $514F: $18 $0F

jr_017_5151:
    ld   a, [$D00A]                               ; $5151: $FA $0A $D0
    add  e                                        ; $5154: $83
    ld   e, a                                     ; $5155: $5F
    ld   d, $00                                   ; $5156: $16 $00
    ld   hl, Data_017_5130                        ; $5158: $21 $30 $51
    add  hl, de                                   ; $515B: $19
    ld   a, [hl]                                  ; $515C: $7E
    ld   [wBGPalette], a                               ; $515D: $EA $97 $DB

jr_017_5160:
    ld   a, [$D006]                               ; $5160: $FA $06 $D0
    and  a                                        ; $5163: $A7
    jr   nz, jr_017_5176                          ; $5164: $20 $10

    ld   a, [$D00A]                               ; $5166: $FA $0A $D0
    cp   $0C                                      ; $5169: $FE $0C
    jr   z, jr_017_5176                           ; $516B: $28 $09

    inc  a                                        ; $516D: $3C
    ld   [$D00A], a                               ; $516E: $EA $0A $D0
    ld   a, $0C                                   ; $5171: $3E $0C
    ld   [$D006], a                               ; $5173: $EA $06 $D0

jr_017_5176:
    ld   a, [$D00A]                               ; $5176: $FA $0A $D0
    cp   $07                                      ; $5179: $FE $07
    jr   c, jr_017_51A6                           ; $517B: $38 $29

    ld   a, [$D00B]                               ; $517D: $FA $0B $D0
    inc  a                                        ; $5180: $3C
    ld   [$D00B], a                               ; $5181: $EA $0B $D0
    and  $0F                                      ; $5184: $E6 $0F
    jr   nz, jr_017_51A6                          ; $5186: $20 $1E

    ld   a, [$D005]                               ; $5188: $FA $05 $D0
    add  $20                                      ; $518B: $C6 $20
    ld   [$D005], a                               ; $518D: $EA $05 $D0
    jr   nz, jr_017_51A6                          ; $5190: $20 $14

    ld   a, $FE                                   ; $5192: $3E $FE
    ld   [$C17F], a                               ; $5194: $EA $7F $C1
    call ResetCreditsSceneVariables                            ; $5197: $CD $A5 $4D
    ld   a, $40                                   ; $519A: $3E $40
    ld   [$D006], a                               ; $519C: $EA $06 $D0
    ld   a, $03                                   ; $519F: $3E $03
    ldh  [rIE], a                                 ; $51A1: $E0 $FF
    jp   IncrementCreditsSubsceneAndReturn                           ; $51A3: $C3 $D9 $4C

jr_017_51A6:
    ret                                           ; $51A6: $C9

Data_017_51A7::
    db   $00, $00, $E0, $41, $E7, $1C, $FE, $73  ; $51A7
    db   $00, $00, $DF, $38, $70, $1C, $FF, $47  ; $51AF
    db   $EF, $22, $B5, $02, $E7, $1C, $FE, $73  ; $51B7
    db   $00, $00, $EF, $22, $E7, $1C, $FE, $73  ; $51BF
    db   $00, $00, $14, $2C, $E7, $1C, $FE, $73  ; $51C7
    db   $00, $00, $0F, $7C, $E7, $1C, $FE, $73  ; $51CF
    db   $14, $2C, $0F, $7C, $E7, $1C, $FE, $73  ; $51D7
    db   $B5, $02, $DF, $38, $70, $1C, $FE, $73  ; $51DF
    db   $00, $00, $A0, $39, $C6, $18, $7A, $63  ; $51E7
    db   $00, $00, $DB, $30, $6E, $18, $FF, $47  ; $51EF
    db   $8D, $1E, $52, $02, $C6, $18, $7A, $63  ; $51F7
    db   $00, $00, $8D, $1E, $C6, $18, $7A, $63  ; $51FF
    db   $00, $00, $12, $28, $C6, $18, $7A, $63  ; $5207
    db   $00, $00, $0D, $6C, $C6, $18, $7A, $63  ; $520F
    db   $12, $28, $0D, $6C, $C6, $18, $7A, $63  ; $5217
    db   $52, $02, $DB, $30, $6E, $18, $7A, $63  ; $521F
    db   $00, $00, $60, $31, $A5, $14, $F6, $52  ; $5227
    db   $00, $00, $B7, $28, $6C, $14, $FF, $47  ; $522F
    db   $2B, $1A, $EF, $01, $A5, $14, $F6, $52  ; $5237
    db   $00, $00, $2B, $1A, $A5, $14, $F6, $52  ; $523F
    db   $00, $00, $0F, $20, $A5, $14, $F6, $52  ; $5247
    db   $00, $00, $0B, $5C, $A5, $14, $F6, $52  ; $524F
    db   $0F, $20, $0B, $5C, $A5, $14, $F6, $52  ; $5257
    db   $EF, $01, $B7, $28, $6C, $14, $F6, $52  ; $525F
    db   $00, $00, $20, $29, $84, $10, $52, $42  ; $5267
    db   $00, $00, $92, $20, $4A, $10, $FF, $47  ; $526F
    db   $C9, $15, $8C, $01, $84, $10, $52, $42  ; $5277
    db   $00, $00, $C9, $15, $84, $10, $52, $42  ; $527F
    db   $00, $00, $0C, $1C, $84, $10, $52, $42  ; $5287
    db   $00, $00, $09, $48, $84, $10, $52, $42  ; $528F
    db   $0C, $1C, $09, $48, $84, $10, $52, $42  ; $5297
    db   $8C, $01, $92, $20, $4A, $10, $52, $42  ; $529F
    db   $00, $00, $E0, $1C, $63, $0C, $CD, $31  ; $52A7
    db   $00, $00, $6E, $18, $47, $0C, $FF, $47  ; $52AF
    db   $47, $11, $29, $01, $63, $0C, $CD, $31  ; $52B7
    db   $00, $00, $47, $11, $63, $0C, $CD, $31  ; $52BF
    db   $00, $00, $09, $14, $63, $0C, $CD, $31  ; $52C7
    db   $00, $00, $07, $38, $63, $0C, $CD, $31  ; $52CF
    db   $09, $14, $07, $38, $63, $0C, $CD, $31  ; $52D7
    db   $29, $01, $6E, $18, $47, $0C, $CD, $31  ; $52DF
    db   $00, $00, $A0, $14, $42, $08, $29, $21  ; $52E7
    db   $00, $00, $49, $10, $25, $08, $FF, $47  ; $52EF
    db   $E5, $0C, $C6, $00, $42, $08, $29, $21  ; $52F7
    db   $00, $00, $E5, $0C, $42, $08, $29, $21  ; $52FF
    db   $00, $00, $06, $10, $42, $08, $29, $21  ; $5307
    db   $00, $00, $05, $24, $42, $08, $29, $21  ; $530F
    db   $06, $10, $05, $24, $42, $08, $29, $21  ; $5317
    db   $C6, $00, $49, $10, $25, $08, $29, $21  ; $531F
    db   $00, $00, $60, $0C, $21, $04, $A5, $10  ; $5327
    db   $00, $00, $25, $08, $23, $04, $FF, $47  ; $532F
    db   $83, $08, $63, $00, $21, $04, $A5, $10  ; $5337
    db   $00, $00, $83, $08, $21, $04, $A5, $10  ; $533F
    db   $00, $00, $03, $08, $21, $04, $A5, $10  ; $5347
    db   $00, $00, $03, $14, $21, $04, $A5, $10  ; $534F
    db   $03, $08, $03, $14, $21, $04, $A5, $10  ; $5357
    db   $63, $00, $25, $08, $23, $04, $A5, $10  ; $535F
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5367
    db   $00, $00, $00, $00, $00, $00, $FF, $47  ; $536F
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5377
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $537F
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5387
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $538F
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5397
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $539F

func_017_53A7:
    and  a                                        ; $53A7: $A7
    jr   z, jr_017_53B3                           ; $53A8: $28 $09

    ld   a, [$D00A]                               ; $53AA: $FA $0A $D0
    inc  a                                        ; $53AD: $3C
    inc  a                                        ; $53AE: $3C
    xor  $0F                                      ; $53AF: $EE $0F
    jr   jr_017_53B8                              ; $53B1: $18 $05

jr_017_53B3:
    ld   a, [$D00A]                               ; $53B3: $FA $0A $D0
    inc  a                                        ; $53B6: $3C
    inc  a                                        ; $53B7: $3C

jr_017_53B8:
    and  $FE                                      ; $53B8: $E6 $FE
    swap a                                        ; $53BA: $CB $37
    sla  a                                        ; $53BC: $CB $27
    ld   c, a                                     ; $53BE: $4F
    ld   a, $00                                   ; $53BF: $3E $00
    adc  $00                                      ; $53C1: $CE $00
    ld   b, a                                     ; $53C3: $47
    ld   hl, Data_017_51A7                        ; $53C4: $21 $A7 $51
    add  hl, bc                                   ; $53C7: $09
    ld   bc, $40                                ; $53C8: $01 $40 $00
    ld   de, $DC10                                ; $53CB: $11 $10 $DC
    call CopyData                                 ; $53CE: $CD $14 $29
    xor  a                                        ; $53D1: $AF
    ld   [$DDD3], a                               ; $53D2: $EA $D3 $DD
    ld   a, $20                                   ; $53D5: $3E $20
    ld   [$DDD4], a                               ; $53D7: $EA $D4 $DD
    ld   a, $81                                   ; $53DA: $3E $81
    ld   [$DDD1], a                               ; $53DC: $EA $D1 $DD
    ret                                           ; $53DF: $C9

CreditsWindFishFloatingHandler::
    ld   a, [$D006]                               ; $53E0: $FA $06 $D0
    and  a                                        ; $53E3: $A7
    jr   nz, jr_017_53F2                          ; $53E4: $20 $0C

    call IncrementCreditsSubscene                 ; $53E6: $CD $D9 $4C

    ; Open Wind Fish Speech
    ld   a, $D0                                   ; $53E9: $3E $D0

CreditsOpenWindFishDialog::
    call CreditsOpenDialog                        ; $53EB: $CD $F0 $7C
    ld   a, $17                                   ; $53EE: $3E $17
    ldh  [hWaveSfx], a                               ; $53F0: $E0 $F3

jr_017_53F2:
    ret                                           ; $53F2: $C9

CreditsWindFishSpeechHandler::
    ld   a, [$C19F]                               ; $53F3: $FA $9F $C1
    and  a                                        ; $53F6: $A7
    jr   nz, jr_017_53FC                          ; $53F7: $20 $03

    call IncrementCreditsSubscene                            ; $53F9: $CD $D9 $4C

jr_017_53FC:
    ret                                           ; $53FC: $C9

CreditsWindFishPrepareDisapparitionHandler::
    ld   a, [$C19F]                               ; $53FD: $FA $9F $C1
    and  a                                        ; $5400: $A7
    jr   nz, jr_017_541D                          ; $5401: $20 $1A

    ld   a, $01                                   ; $5403: $3E $01
    ldh  [rIE], a                                 ; $5405: $E0 $FF
    ld   a, $FF                                   ; $5407: $3E $FF
    ld   [$C17F], a                               ; $5409: $EA $7F $C1
    ld   a, $E0                                   ; $540C: $3E $E0
    ld   [$D005], a                               ; $540E: $EA $05 $D0
    ld   a, $50                                   ; $5411: $3E $50
    ld   [$D006], a                               ; $5413: $EA $06 $D0
    ld   a, $1F                                   ; $5416: $3E $1F
    ldh  [hWaveSfx], a                               ; $5418: $E0 $F3
    call IncrementCreditsSubscene                            ; $541A: $CD $D9 $4C

jr_017_541D:
    ret                                           ; $541D: $C9

Data_017_541E::
    db   $27, $27, $27, $27, $6B, $6B, $6B, $6B  ; $541E |''''kkkk|
    db   $BF, $BF, $BF, $BF, $FF, $FF, $FF, $FF  ; $5426 |........|

CreditsWindFishDisapparitionHandler::
    ldh  a, [hFrameCounter]                               ; $542E: $F0 $E7
    and  $03                                      ; $5430: $E6 $03
    ld   e, a                                     ; $5432: $5F
    ldh  a, [hIsGBC]                               ; $5433: $F0 $FE
    and  a                                        ; $5435: $A7
    jr   z, jr_017_543E                           ; $5436: $28 $06

    xor  a                                        ; $5438: $AF
    call func_017_53A7                            ; $5439: $CD $A7 $53
    jr   jr_017_544D                              ; $543C: $18 $0F

jr_017_543E:
    ld   a, [$D00A]                               ; $543E: $FA $0A $D0
    add  e                                        ; $5441: $83
    ld   e, a                                     ; $5442: $5F
    ld   d, $00                                   ; $5443: $16 $00
    ld   hl, Data_017_541E                        ; $5445: $21 $1E $54
    add  hl, de                                   ; $5448: $19
    ld   a, [hl]                                  ; $5449: $7E
    ld   [wBGPalette], a                               ; $544A: $EA $97 $DB

jr_017_544D:
    ld   a, [$D005]                               ; $544D: $FA $05 $D0
    cp   $A0                                      ; $5450: $FE $A0
    jr   nc, jr_017_547D                          ; $5452: $30 $29

    ld   a, [$D006]                               ; $5454: $FA $06 $D0
    and  a                                        ; $5457: $A7
    jr   nz, jr_017_547D                          ; $5458: $20 $23

    ld   a, $0C                                   ; $545A: $3E $0C
    ld   [$D006], a                               ; $545C: $EA $06 $D0
    ld   a, [$D00A]                               ; $545F: $FA $0A $D0
    inc  a                                        ; $5462: $3C
    ld   [$D00A], a                               ; $5463: $EA $0A $D0
    cp   $0D                                      ; $5466: $FE $0D
    jr   nz, jr_017_547D                          ; $5468: $20 $13

    xor  a                                        ; $546A: $AF
    ld   [$C17F], a                               ; $546B: $EA $7F $C1
    call ResetCreditsSceneVariables                            ; $546E: $CD $A5 $4D
    ld   a, $30                                   ; $5471: $3E $30
    ld   [$D006], a                               ; $5473: $EA $06 $D0
    ld   a, $01                                   ; $5476: $3E $01
    ldh  [rIE], a                                 ; $5478: $E0 $FF
    jp   IncrementCreditsSubsceneAndReturn                           ; $547A: $C3 $D9 $4C

jr_017_547D:
    ld   a, [$D00B]                               ; $547D: $FA $0B $D0
    inc  a                                        ; $5480: $3C
    ld   [$D00B], a                               ; $5481: $EA $0B $D0
    and  $0F                                      ; $5484: $E6 $0F
    jr   nz, jr_017_5493                          ; $5486: $20 $0B

    ld   a, [$D005]                               ; $5488: $FA $05 $D0
    and  a                                        ; $548B: $A7
    jr   z, jr_017_5493                           ; $548C: $28 $05

    sub  $20                                      ; $548E: $D6 $20
    ld   [$D005], a                               ; $5490: $EA $05 $D0

jr_017_5493:
    ret                                           ; $5493: $C9

Data_017_5494::
    db   $9B, $C0, $53, $A0, $9B, $E0, $53, $A0  ; $5494
    db   $98, $00, $53, $A0, $98, $20, $53, $A0  ; $549C
    db   $98, $40, $53, $A0, $98, $60, $53, $A0  ; $54A4
    db   $98, $80, $53, $A0, $98, $A0, $53, $A0  ; $54AC
    db   $98, $C0, $53, $A0, $98, $E0, $53, $A0  ; $54B4

CreditsWindFishDisappearedHandler::
    ld   a, [$D006]                               ; $54BC: $FA $06 $D0
    and  a                                        ; $54BF: $A7
    ret  nz                                       ; $54C0: $C0

    ld   a, [$D000]                               ; $54C1: $FA $00 $D0
    cp   $0A                                      ; $54C4: $FE $0A
    jr   nz, jr_017_54D5                          ; $54C6: $20 $0D

    ; Open the "Play the intruments!" dialog
    ld   a, $D2                                   ; $54C8: $3E $D2
    call CreditsOpenWindFishDialog                ; $54CA: $CD $EB $53

    ld   a, $27                                   ; $54CD: $3E $27
    ld   [wBGPalette], a                               ; $54CF: $EA $97 $DB
    jp   IncrementCreditsSubsceneAndReturn                           ; $54D2: $C3 $D9 $4C

jr_017_54D5:
    ld   e, a                                     ; $54D5: $5F
    inc  a                                        ; $54D6: $3C
    ld   [$D000], a                               ; $54D7: $EA $00 $D0
    sla  e                                        ; $54DA: $CB $23
    sla  e                                        ; $54DC: $CB $23
    ld   d, $00                                   ; $54DE: $16 $00
    ld   hl, Data_017_5494                        ; $54E0: $21 $94 $54
    add  hl, de                                   ; $54E3: $19
    push de                                       ; $54E4: $D5
    ld   de, $D601                                ; $54E5: $11 $01 $D6
    ld   c, $04                                   ; $54E8: $0E $04

jr_017_54EA:
    ld   a, [hl+]                                 ; $54EA: $2A
    ld   [de], a                                  ; $54EB: $12
    inc  de                                       ; $54EC: $13
    dec  c                                        ; $54ED: $0D
    jr   nz, jr_017_54EA                          ; $54EE: $20 $FA

    xor  a                                        ; $54F0: $AF
    ld   [de], a                                  ; $54F1: $12
    pop  de                                       ; $54F2: $D1
    ldh  a, [hIsGBC]                               ; $54F3: $F0 $FE
    and  a                                        ; $54F5: $A7

jr_017_54F6:
    ret  z                                        ; $54F6: $C8

    ld   hl, Data_017_5494                        ; $54F7: $21 $94 $54
    add  hl, de                                   ; $54FA: $19
    ld   de, $DC91                                ; $54FB: $11 $91 $DC
    ld   c, $03                                   ; $54FE: $0E $03

jr_017_5500:
    ld   a, [hl+]                                 ; $5500: $2A
    ld   [de], a                                  ; $5501: $12
    inc  de                                       ; $5502: $13
    dec  c                                        ; $5503: $0D
    jr   nz, jr_017_5500                          ; $5504: $20 $FA

    xor  a                                        ; $5506: $AF
    ld   [de], a                                  ; $5507: $12
    inc  de                                       ; $5508: $13
    ld   [de], a                                  ; $5509: $12
    ret                                           ; $550A: $C9

CreditsPlayInstrumentsDialogHandler::
    ld   a, [$C19F]                               ; $550B: $FA $9F $C1
    and  a                                        ; $550E: $A7
    jr   nz, jr_017_551F                          ; $550F: $20 $0E

    call ResetCreditsSceneVariables                            ; $5511: $CD $A5 $4D
    ld   a, $03                                   ; $5514: $3E $03
    ldh  [$FF9D], a                               ; $5516: $E0 $9D
    ld   a, $0C                                   ; $5518: $3E $0C
    ldh  [$FFA5], a                               ; $551A: $E0 $A5
    call IncrementCreditsSubscene                            ; $551C: $CD $D9 $4C

jr_017_551F:
    ret                                           ; $551F: $C9

CreditsLinkTurnsToPlayHandler::
    ld   a, [$D000]                               ; $5520: $FA $00 $D0
    cp   $07                                      ; $5523: $FE $07
    jr   nz, jr_017_5532                          ; $5525: $20 $0B

    call ResetCreditsSceneVariables                            ; $5527: $CD $A5 $4D
    ld   a, $80                                   ; $552A: $3E $80
    ld   [$D006], a                               ; $552C: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $552F: $C3 $D9 $4C

jr_017_5532:
    inc  a                                        ; $5532: $3C
    ld   [$D000], a                               ; $5533: $EA $00 $D0
    ld   a, $0C                                   ; $5536: $3E $0C
    ldh  [$FFA5], a                               ; $5538: $E0 $A5
    ret                                           ; $553A: $C9

Data_017_553B::
    db   $48, $58, $60, $60, $58, $48, $40, $40  ; $553B

Data_017_5543::
    db   $40, $40, $48, $58, $60, $60, $58, $48  ; $5543

Data_017_554B::
    db   $FF, $01, $02, $02, $01, $FF, $FE, $FE  ; $554B

Data_017_5553::
    db   $FE, $FE, $FF, $01, $02, $02, $01, $FF  ; $5553

Data_017_555B::
    db   $00, $01, $02, $03, $04, $05, $06, $07  ; $555B

Data_017_5563::
    db   $00, $08, $10, $18, $20, $28, $30, $38  ; $5563

CreditsLinkPreparesToPlayHandler::
    ld   a, [$D006]                               ; $556B: $FA $06 $D0
    and  a                                        ; $556E: $A7
    jr   nz, jr_017_55E9                          ; $556F: $20 $78

    ld   a, $04                                   ; $5571: $3E $04
    ldh  [$FF9D], a                               ; $5573: $E0 $9D
    ld   a, $3F                                   ; $5575: $3E $3F
    ld   [$D368], a                               ; $5577: $EA $68 $D3

jr_017_557A:
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $557A: $3E $E8
    call SpawnNewEntity_trampoline                ; $557C: $CD $86 $3B

    ld   a, [$D000]                               ; $557F: $FA $00 $D0
    ld   c, a                                     ; $5582: $4F
    ld   b, $00                                   ; $5583: $06 $00
    ld   hl, Data_017_553B                        ; $5585: $21 $3B $55
    add  hl, bc                                   ; $5588: $09
    ld   a, [hl]                                  ; $5589: $7E
    ld   hl, wEntitiesPosXTable                                ; $558A: $21 $00 $C2
    add  hl, de                                   ; $558D: $19
    ld   [hl], a                                  ; $558E: $77
    ld   hl, Data_017_5543                        ; $558F: $21 $43 $55
    add  hl, bc                                   ; $5592: $09
    ld   a, [hl]                                  ; $5593: $7E
    ld   hl, wEntitiesPosYTable                                ; $5594: $21 $10 $C2
    add  hl, de                                   ; $5597: $19
    sub  $20                                      ; $5598: $D6 $20
    ld   [hl], a                                  ; $559A: $77
    ld   hl, Data_017_554B                        ; $559B: $21 $4B $55
    add  hl, bc                                   ; $559E: $09
    ld   a, [hl]                                  ; $559F: $7E
    ld   hl, wEntitiesSpeedXTable                                ; $55A0: $21 $40 $C2

jr_017_55A3:
    add  hl, de                                   ; $55A3: $19
    ld   [hl], a                                  ; $55A4: $77
    ld   hl, Data_017_5553                        ; $55A5: $21 $53 $55
    add  hl, bc                                   ; $55A8: $09
    ld   a, [hl]                                  ; $55A9: $7E
    ld   hl, wEntitiesSpeedYTable                                ; $55AA: $21 $50 $C2
    add  hl, de                                   ; $55AD: $19
    ld   [hl], a                                  ; $55AE: $77
    ld   hl, Data_017_555B                        ; $55AF: $21 $5B $55
    add  hl, bc                                   ; $55B2: $09
    ld   a, [hl]                                  ; $55B3: $7E
    ld   hl, $C3B0                                ; $55B4: $21 $B0 $C3
    add  hl, de                                   ; $55B7: $19
    ld   [hl], a                                  ; $55B8: $77
    ld   hl, Data_017_5563                        ; $55B9: $21 $63 $55
    add  hl, bc                                   ; $55BC: $09
    ld   a, [hl]                                  ; $55BD: $7E
    ld   hl, $C2C0                                ; $55BE: $21 $C0 $C2
    add  hl, de                                   ; $55C1: $19
    ld   [hl], a                                  ; $55C2: $77
    ld   hl, $C2B0                                ; $55C3: $21 $B0 $C2
    add  hl, de                                   ; $55C6: $19
    ld   [hl], $03                                ; $55C7: $36 $03
    ld   hl, wEntitiesPhysicsFlagsTable           ; $55C9: $21 $40 $C3
    add  hl, de                                   ; $55CC: $19
    ld   [hl], $C2                                ; $55CD: $36 $C2
    ld   hl, wEntitiesDropTimerTable                                ; $55CF: $21 $50 $C4
    add  hl, de                                   ; $55D2: $19
    ld   [hl], $20                                ; $55D3: $36 $20
    ld   a, c                                     ; $55D5: $79
    inc  a                                        ; $55D6: $3C
    ld   [$D000], a                               ; $55D7: $EA $00 $D0
    cp   $08                                      ; $55DA: $FE $08
    jr   nz, jr_017_557A                          ; $55DC: $20 $9C

    call ResetCreditsSceneVariables                            ; $55DE: $CD $A5 $4D
    ld   a, $A0                                   ; $55E1: $3E $A0
    ld   [$D006], a                               ; $55E3: $EA $06 $D0
    call IncrementCreditsSubscene                            ; $55E6: $CD $D9 $4C

jr_017_55E9:
    ret                                           ; $55E9: $C9

CreditsLinkShowsInstrumentsHandler::
    ld   a, [$D006]                               ; $55EA: $FA $06 $D0
    cp   $9E                                      ; $55ED: $FE $9E
    jr   nz, jr_017_55F6                          ; $55EF: $20 $05

    ld   hl, hJingle                                ; $55F1: $21 $F2 $FF
    ld   [hl], $34                                ; $55F4: $36 $34

jr_017_55F6:
    and  a                                        ; $55F6: $A7
    jr   nz, jr_017_55FC                          ; $55F7: $20 $03

    call IncrementCreditsSubscene                            ; $55F9: $CD $D9 $4C

jr_017_55FC:
    ret                                           ; $55FC: $C9

; Handles:
; - the fade-to-white of Link on the stairs
; - the various views ok Koholint
; - the island disappearing
; - link's platform rumbling
CreditsInstrumentsPlayingHandler::
    ld   a, [$D000]                              ; $55FD: $FA $00 $D0
    JP_TABLE                                     ; $5600
._00 dw Func_017_5665                            ; $5601
._01 dw MrsMeowMeowsHouseSceneHandler            ; $5603
._02 dw Func_017_5728                            ; $5605
._03 dw KidsSceneHandler                         ; $5607
._04 dw Func_017_5794                            ; $5609
._05 dw BeachSceneHandler                        ; $560B
._06 dw Func_017_57F9                            ; $560D
._07 dw TarinSceneHandler                        ; $560F
._08 dw Func_017_583C                            ; $5611
._09 dw MarinSingingSceneHandler                 ; $5613
._0A dw Func_017_58C3                            ; $5615
._0B dw Func_017_58D1                            ; $5617
._0C dw Func_017_58F0                            ; $5619
._0D dw Func_017_58F8                            ; $561B
._0E dw Func_017_590B                            ; $561D
._0F dw Func_017_5938                            ; $561F
._10 dw Func_017_5A66                            ; $5621
._11 dw Func_017_5ACD                            ; $5623

IncrementD000AndReturn::                         ; Sources: jp @ $5686, jp @ $5725, jp @ $5732, jp @ $5790, jp @ $579E, jp @ $57F5, jp @ $5803, jp @ $5838, jp @ $5846, jp @ $58BF, jp @ $58CD, jp @ $58EC, jp @ $58F5, jp @ $5907, jp @ $5935, jp @ $594C, jp @ $5ACA
    ld   hl, $D000                               ; $5625 (17): $21 $00 $D0
    inc  [hl]                                    ; $5628 (17): $34
    ret                                          ; $5629 (17): $C9

DisableAllEntities::
    ; For each entity, set the state to 0 (ENTITY_STATUS_DISABLED)
    ld   e, MAX_ENTITIES                          ; $562A: $1E $10
    ld   hl, wEntitiesStatusTable                 ; $562C: $21 $80 $C2
    xor  a                                        ; $562F: $AF
.loop
    ld   [hl+], a                                 ; $5630: $22
    dec  e                                        ; $5631: $1D
    jr   nz, .loop                                ; $5632: $20 $FC
    ret                                           ; $5634: $C9

Data_017_5635::
    db   $FF, $FF, $FF, $FF, $AA, $AA, $AA, $AA  ; $5635
    db   $55, $55, $55, $55, $00, $00, $00, $00  ; $563D

Data_017_5645::
    db   $1C, $1C, $1C, $1C, $18, $18, $18, $18  ; $5645
    db   $04, $04, $04, $04, $00, $00, $00, $00  ; $564D

Data_017_5655
    db   $90, $90, $90, $90, $50, $50, $50, $50  ; $5655
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $565D

Func_017_5665::
    ldh  a, [hFrameCounter]                               ; $5665: $F0 $E7
    and  $07                                      ; $5667: $E6 $07
    jr   nz, jr_017_5695                          ; $5669: $20 $2A

    ld   a, [$D00A]                               ; $566B: $FA $0A $D0
    inc  a                                        ; $566E: $3C
    ld   [$D00A], a                               ; $566F: $EA $0A $D0
    cp   $0C                                      ; $5672: $FE $0C
    jr   nz, jr_017_5689                          ; $5674: $20 $13

    ld   a, $1D                                   ; $5676: $3E $1D
    ld   [wTileMapToLoad], a                               ; $5678: $EA $FE $D6
    ld   a, $01                                   ; $567B: $3E $01
    ld   [$DDD5], a                               ; $567D: $EA $D5 $DD
    xor  a                                        ; $5680: $AF
    ldh  [hBaseScrollY], a                               ; $5681: $E0 $97
    call DisableAllEntities                       ; $5683: $CD $2A $56
    jp   IncrementD000AndReturn                       ; $5686: $C3 $25 $56

jr_017_5689:
    ldh  a, [hIsGBC]                               ; $5689: $F0 $FE
    and  a                                        ; $568B: $A7
    jr   z, jr_017_5695                           ; $568C: $28 $07

    ld   a, [$D00A]                               ; $568E: $FA $0A $D0
    dec  a                                        ; $5691: $3D
    jp   label_017_7F30                           ; $5692: $C3 $30 $7F

jr_017_5695:
    ldh  a, [hFrameCounter]                               ; $5695: $F0 $E7
    and  $03                                      ; $5697: $E6 $03
    ld   e, a                                     ; $5699: $5F
    ld   a, [$D00A]                               ; $569A: $FA $0A $D0
    add  e                                        ; $569D: $83
    ld   e, a                                     ; $569E: $5F
    ld   d, $00                                   ; $569F: $16 $00
    ld   hl, Data_017_5635                        ; $56A1: $21 $35 $56
    add  hl, de                                   ; $56A4: $19
    ld   a, [hl]                                  ; $56A5: $7E
    ld   [wBGPalette], a                               ; $56A6: $EA $97 $DB
    ld   hl, Data_017_5645                        ; $56A9: $21 $45 $56
    add  hl, de                                   ; $56AC: $19
    ld   a, [hl]                                  ; $56AD: $7E
    ld   [wOBJ0Palette], a                               ; $56AE: $EA $98 $DB
    ld   hl, Data_017_5655                        ; $56B1: $21 $55 $56
    add  hl, de                                   ; $56B4: $19
    ld   a, [hl]                                  ; $56B5: $7E
    ld   [wOBJ1Palette], a                               ; $56B6: $EA $99 $DB
    ret                                           ; $56B9: $C9

label_017_56BA:
    ldh  a, [hFrameCounter]                               ; $56BA: $F0 $E7
    ld   e, $01                                   ; $56BC: $1E $01
    and  $04                                      ; $56BE: $E6 $04
    jr   z, jr_017_56C4                           ; $56C0: $28 $02

    ld   e, $FE                                   ; $56C2: $1E $FE

jr_017_56C4:
    ld   hl, $C155                                ; $56C4: $21 $55 $C1
    ld   [hl], e                                  ; $56C7: $73
    ret                                           ; $56C8: $C9

MrsMeowMeowsHouseSceneHandler::
    xor  a                                        ; $56C9: $AF
    ld   [$D00A], a                               ; $56CA: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $56CD: $F0 $FE
    and  a                                        ; $56CF: $A7
    jr   z, jr_017_56D7                           ; $56D0: $28 $05

    call func_017_5B00                            ; $56D2: $CD $00 $5B
    jr   jr_017_56DC                              ; $56D5: $18 $05

jr_017_56D7:
    ld   a, $20                                   ; $56D7: $3E $20
    ld   [wBGMapToLoad], a                               ; $56D9: $EA $FF $D6

jr_017_56DC:
    ld   a, ENTITY_BOW_WOW                        ; $56DC: $3E $6D
    call SpawnNewEntity_trampoline                ; $56DE: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $56E1: $21 $00 $C2
    add  hl, de                                   ; $56E4: $19
    ld   [hl], $48                                ; $56E5: $36 $48
    ld   hl, wEntitiesPosYTable                                ; $56E7: $21 $10 $C2
    add  hl, de                                   ; $56EA: $19
    ld   [hl], $50                                ; $56EB: $36 $50

    ld   a, ENTITY_DOG                            ; $56ED: $3E $6F
    call SpawnNewEntity_trampoline                ; $56EF: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $56F2: $21 $00 $C2
    add  hl, de                                   ; $56F5: $19
    ld   [hl], $68                                ; $56F6: $36 $68
    ld   hl, wEntitiesPosYTable                                ; $56F8: $21 $10 $C2
    add  hl, de                                   ; $56FB: $19
    ld   [hl], $30                                ; $56FC: $36 $30

    ld   a, ENTITY_YIP_YIP                        ; $56FE: $3E $78
    call SpawnNewEntity_trampoline                ; $5700: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $5703: $21 $00 $C2
    add  hl, de                                   ; $5706: $19
    ld   [hl], $2C                                ; $5707: $36 $2C
    ld   hl, wEntitiesPosYTable                                ; $5709: $21 $10 $C2
    add  hl, de                                   ; $570C: $19
    ld   [hl], $58                                ; $570D: $36 $58

    ld   a, ENTITY_YIP_YIP                        ; $570F: $3E $78
    call SpawnNewEntity_trampoline                ; $5711: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $5714: $21 $00 $C2
    add  hl, de                                   ; $5717: $19
    ld   [hl], $60                                ; $5718: $36 $60
    ld   hl, wEntitiesPosYTable                                ; $571A: $21 $10 $C2
    add  hl, de                                   ; $571D: $19
    ld   [hl], $52                                ; $571E: $36 $52
    ld   hl, $C2B0                                ; $5720: $21 $B0 $C2
    add  hl, de                                   ; $5723: $19
    inc  [hl]                                     ; $5724: $34
    jp   IncrementD000AndReturn                                    ; $5725: $C3 $25 $56

Func_017_5728::
    call func_017_5970                            ; $5728: $CD $70 $59
    jr   nz, jr_017_5735                          ; $572B: $20 $08

    ld   a, $50                                   ; $572D: $3E $50
    ld   [$D006], a                               ; $572F: $EA $06 $D0
    jp   IncrementD000AndReturn                                    ; $5732: $C3 $25 $56

jr_017_5735:
    ret                                           ; $5735: $C9

func_017_5736:
    ldh  a, [$FFCB]                               ; $5736: $F0 $CB
    and  $30                                      ; $5738: $E6 $30
    ret  nz                                       ; $573A: $C0

    nop                                           ; $573B: $00
    ret                                           ; $573C: $C9

KidsSceneHandler::
    ld   a, [$D006]                               ; $573D: $FA $06 $D0
    and  a                                        ; $5740: $A7
    jr   nz, jr_017_5793                          ; $5741: $20 $50

    call func_017_5736                            ; $5743: $CD $36 $57
    call func_017_59FD                            ; $5746: $CD $FD $59
    jr   nz, jr_017_5793                          ; $5749: $20 $48

    ldh  a, [hIsGBC]                               ; $574B: $F0 $FE
    and  a                                        ; $574D: $A7
    jr   z, jr_017_5755                           ; $574E: $28 $05

    call func_017_5B00                            ; $5750: $CD $00 $5B
    jr   jr_017_575A                              ; $5753: $18 $05

jr_017_5755:
    ld   a, $1E                                   ; $5755: $3E $1E
    ld   [wBGMapToLoad], a                               ; $5757: $EA $FF $D6

jr_017_575A:
    call DisableAllEntities                       ; $575A: $CD $2A $56

    ld   a, ENTITY_KID_71                         ; $575D: $3E $71
    call SpawnNewEntity_trampoline                ; $575F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $5762: $21 $00 $C2
    add  hl, de                                   ; $5765: $19
    ld   [hl], $48                                ; $5766: $36 $48
    ld   hl, wEntitiesPosYTable                   ; $5768: $21 $10 $C2
    add  hl, de                                   ; $576B: $19
    ld   [hl], $50                                ; $576C: $36 $50
    ld   hl, $C290                                ; $576E: $21 $90 $C2
    add  hl, de                                   ; $5771: $19
    inc  [hl]                                     ; $5772: $34
    ld   hl, $C2E0                                ; $5773: $21 $E0 $C2
    add  hl, de                                   ; $5776: $19
    ld   [hl], $20                                ; $5777: $36 $20
    ld   hl, wEntitiesDirectionTable              ; $5779: $21 $80 $C3
    add  hl, de                                   ; $577C: $19
    ld   [hl], $02                                ; $577D: $36 $02

    ld   a, ENTITY_KID_72                         ; $577F: $3E $72
    call SpawnNewEntity_trampoline                ; $5781: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $5784: $21 $00 $C2
    add  hl, de                                   ; $5787: $19
    ld   [hl], $78                                ; $5788: $36 $78
    ld   hl, wEntitiesPosYTable                   ; $578A: $21 $10 $C2
    add  hl, de                                   ; $578D: $19
    ld   [hl], $50                                ; $578E: $36 $50
    jp   IncrementD000AndReturn                   ; $5790: $C3 $25 $56

jr_017_5793:
    ret                                           ; $5793: $C9

Func_017_5794::
    call func_017_5970                            ; $5794: $CD $70 $59
    jr   nz, jr_017_57A1                          ; $5797: $20 $08

    ld   a, $50                                   ; $5799: $3E $50
    ld   [$D006], a                               ; $579B: $EA $06 $D0
    jp   IncrementD000AndReturn                                    ; $579E: $C3 $25 $56

jr_017_57A1:
    ret                                           ; $57A1: $C9

BeachSceneHandler::
    ld   a, [$D006]                               ; $57A2: $FA $06 $D0
    and  a                                        ; $57A5: $A7
    jr   nz, jr_017_57F8                          ; $57A6: $20 $50

    call func_017_5736                            ; $57A8: $CD $36 $57
    call func_017_59FD                            ; $57AB: $CD $FD $59
    jr   nz, jr_017_57F8                          ; $57AE: $20 $48

    ldh  a, [hIsGBC]                               ; $57B0: $F0 $FE
    and  a                                        ; $57B2: $A7
    jr   z, jr_017_57BA                           ; $57B3: $28 $05

    call func_017_5B00                            ; $57B5: $CD $00 $5B
    jr   jr_017_57BF                              ; $57B8: $18 $05

jr_017_57BA:
    ld   a, $22                                   ; $57BA: $3E $22
    ld   [wBGMapToLoad], a                               ; $57BC: $EA $FF $D6

jr_017_57BF:
    call DisableAllEntities                       ; $57BF: $CD $2A $56

    ld   a, ENTITY_URCHIN                         ; $57C2: $3E $C5
    call SpawnNewEntity_trampoline                ; $57C4: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $57C7: $21 $00 $C2
    add  hl, de                                   ; $57CA: $19
    ld   [hl], $28                                ; $57CB: $36 $28
    ld   hl, wEntitiesPosYTable                                ; $57CD: $21 $10 $C2
    add  hl, de                                   ; $57D0: $19
    ld   [hl], $40                                ; $57D1: $36 $40

    ld   a, ENTITY_OCTOROCK                       ; $57D3: $3E $09
    call SpawnNewEntity_trampoline                ; $57D5: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $57D8: $21 $00 $C2
    add  hl, de                                   ; $57DB: $19
    ld   [hl], $48                                ; $57DC: $36 $48
    ld   hl, wEntitiesPosYTable                                ; $57DE: $21 $10 $C2
    add  hl, de                                   ; $57E1: $19
    ld   [hl], $50                                ; $57E2: $36 $50

    ld   a, ENTITY_OCTOROCK                       ; $57E4: $3E $09
    call SpawnNewEntity_trampoline                ; $57E6: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $57E9: $21 $00 $C2
    add  hl, de                                   ; $57EC: $19
    ld   [hl], $68                                ; $57ED: $36 $68
    ld   hl, wEntitiesPosYTable                   ; $57EF: $21 $10 $C2
    add  hl, de                                   ; $57F2: $19
    ld   [hl], $60                                ; $57F3: $36 $60
    jp   IncrementD000AndReturn                   ; $57F5: $C3 $25 $56

jr_017_57F8:
    ret                                           ; $57F8: $C9

Func_017_57F9::
    call func_017_5970                            ; $57F9: $CD $70 $59
    jr   nz, jr_017_5806                          ; $57FC: $20 $08

    ld   a, $50                                   ; $57FE: $3E $50
    ld   [$D006], a                               ; $5800: $EA $06 $D0
    jp   IncrementD000AndReturn                                    ; $5803: $C3 $25 $56

jr_017_5806:
    ret                                           ; $5806: $C9

TarinSceneHandler::
    ld   a, [$D006]                               ; $5807: $FA $06 $D0
    and  a                                        ; $580A: $A7
    jr   nz, jr_017_583B                          ; $580B: $20 $2E

    call func_017_5736                            ; $580D: $CD $36 $57
    call func_017_59FD                            ; $5810: $CD $FD $59
    jr   nz, jr_017_583B                          ; $5813: $20 $26

    ldh  a, [hIsGBC]                               ; $5815: $F0 $FE
    and  a                                        ; $5817: $A7
    jr   z, jr_017_581F                           ; $5818: $28 $05

    call func_017_5B00                            ; $581A: $CD $00 $5B
    jr   jr_017_5824                              ; $581D: $18 $05

jr_017_581F:
    ld   a, $21                                   ; $581F: $3E $21
    ld   [wBGMapToLoad], a                               ; $5821: $EA $FF $D6

jr_017_5824:
    call DisableAllEntities                       ; $5824: $CD $2A $56

    ld   a, ENTITY_RACOON                         ; $5827: $3E $3F
    call SpawnNewEntity_trampoline                ; $5829: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $582C: $21 $00 $C2
    add  hl, de                                   ; $582F: $19
    ld   [hl], $78                                ; $5830: $36 $78
    ld   hl, wEntitiesPosYTable                                ; $5832: $21 $10 $C2
    add  hl, de                                   ; $5835: $19
    ld   [hl], $50                                ; $5836: $36 $50
    jp   IncrementD000AndReturn                                    ; $5838: $C3 $25 $56

jr_017_583B:
    ret                                           ; $583B: $C9

Func_017_583C::
    call func_017_5970                            ; $583C: $CD $70 $59
    jr   nz, jr_017_5849                          ; $583F: $20 $08

    ld   a, $50                                   ; $5841: $3E $50
    ld   [$D006], a                               ; $5843: $EA $06 $D0
    jp   IncrementD000AndReturn                                    ; $5846: $C3 $25 $56

jr_017_5849:
    ret                                           ; $5849: $C9

MarinSingingSceneHandler
    ld   a, [$D006]                               ; $584A: $FA $06 $D0
    and  a                                        ; $584D: $A7
    jr   nz, jr_017_58C2                          ; $584E: $20 $72

    call func_017_5736                            ; $5850: $CD $36 $57
    call func_017_59FD                            ; $5853: $CD $FD $59
    jr   nz, jr_017_58C2                          ; $5856: $20 $6A

    ldh  a, [hIsGBC]                               ; $5858: $F0 $FE
    and  a                                        ; $585A: $A7
    jr   z, jr_017_5862                           ; $585B: $28 $05

    call func_017_5B00                            ; $585D: $CD $00 $5B
    jr   jr_017_5867                              ; $5860: $18 $05

jr_017_5862:
    ld   a, $1F                                   ; $5862: $3E $1F
    ld   [wBGMapToLoad], a                               ; $5864: $EA $FF $D6

jr_017_5867:
    call DisableAllEntities                       ; $5867: $CD $2A $56

    ld   a, ENTITY_MARIN                          ; $586A: $3E $3E
    call SpawnNewEntity_trampoline                ; $586C: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $586F: $21 $00 $C2
    add  hl, de                                   ; $5872: $19
    ld   [hl], $28                                ; $5873: $36 $28
    ld   hl, wEntitiesPosYTable                                ; $5875: $21 $10 $C2
    add  hl, de                                   ; $5878: $19
    ld   [hl], $50                                ; $5879: $36 $50

    ld   a, ENTITY_BUTTERFLY                      ; $587B: $3E $6E
    call SpawnNewEntity_trampoline                ; $587D: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $5880: $21 $00 $C2
    add  hl, de                                   ; $5883: $19
    ld   [hl], $18                                ; $5884: $36 $18
    ld   hl, wEntitiesPosYTable                                ; $5886: $21 $10 $C2
    add  hl, de                                   ; $5889: $19
    ld   [hl], $4C                                ; $588A: $36 $4C

    ld   a, ENTITY_BUTTERFLY                      ; $588C: $3E $6E
    call SpawnNewEntity_trampoline                ; $588E: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $5891: $21 $00 $C2
    add  hl, de                                   ; $5894: $19
    ld   [hl], $38                                ; $5895: $36 $38
    ld   hl, wEntitiesPosYTable                                ; $5897: $21 $10 $C2
    add  hl, de                                   ; $589A: $19
    ld   [hl], $54                                ; $589B: $36 $54

    ld   a, ENTITY_BUTTERFLY                      ; $589D: $3E $6E
    call SpawnNewEntity_trampoline                ; $589F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $58A2: $21 $00 $C2
    add  hl, de                                   ; $58A5: $19
    ld   [hl], $28                                ; $58A6: $36 $28
    ld   hl, wEntitiesPosYTable                                ; $58A8: $21 $10 $C2
    add  hl, de                                   ; $58AB: $19
    ld   [hl], $30                                ; $58AC: $36 $30

    ld   a, ENTITY_DOG                            ; $58AE: $3E $6F
    call SpawnNewEntity_trampoline                ; $58B0: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $58B3: $21 $00 $C2
    add  hl, de                                   ; $58B6: $19
    ld   [hl], $78                                ; $58B7: $36 $78
    ld   hl, wEntitiesPosYTable                                ; $58B9: $21 $10 $C2
    add  hl, de                                   ; $58BC: $19
    ld   [hl], $60                                ; $58BD: $36 $60
    jp   IncrementD000AndReturn                                    ; $58BF: $C3 $25 $56

jr_017_58C2:
    ret                                           ; $58C2: $C9

Func_017_58C3::
    call func_017_5970                            ; $58C3: $CD $70 $59
    jr   nz, jr_017_58D0                          ; $58C6: $20 $08

    ld   a, $C0                                   ; $58C8: $3E $C0
    ld   [$D006], a                               ; $58CA: $EA $06 $D0
    jp   IncrementD000AndReturn                                    ; $58CD: $C3 $25 $56

jr_017_58D0:
    ret                                           ; $58D0: $C9

Func_017_58D1::
    ld   a, [$D006]                               ; $58D1: $FA $06 $D0
    and  a                                        ; $58D4: $A7
    jr   nz, jr_017_58EF                          ; $58D5: $20 $18

    call func_017_5736                            ; $58D7: $CD $36 $57
    call func_017_59FD                            ; $58DA: $CD $FD $59
    jr   nz, jr_017_58EF                          ; $58DD: $20 $10

    ld   a, $1E                                   ; $58DF: $3E $1E
    ld   [wTileMapToLoad], a                               ; $58E1: $EA $FE $D6
    ld   a, $01                                   ; $58E4: $3E $01
    ld   [$DDD5], a                               ; $58E6: $EA $D5 $DD
    call DisableAllEntities                       ; $58E9: $CD $2A $56
    jp   IncrementD000AndReturn                                    ; $58EC: $C3 $25 $56

jr_017_58EF:
    ret                                           ; $58EF: $C9

Func_017_58F0::
    ld   a, $01                                   ; $58F0: $3E $01
    ld   [wBGMapToLoad], a                               ; $58F2: $EA $FF $D6
    jp   IncrementD000AndReturn                                    ; $58F5: $C3 $25 $56

Func_017_58F8::
    call func_017_59A9                            ; $58F8: $CD $A9 $59
    jr   nz, jr_017_590A                          ; $58FB: $20 $0D

    ld   a, $A0                                   ; $58FD: $3E $A0
    ld   [$D006], a                               ; $58FF: $EA $06 $D0
    ld   a, $FF                                   ; $5902: $3E $FF
    ld   [$D00B], a                               ; $5904: $EA $0B $D0
    jp   IncrementD000AndReturn                                    ; $5907: $C3 $25 $56

jr_017_590A:
    ret                                           ; $590A: $C9

Func_017_590B::
    ld   a, [$D006]                               ; $590B: $FA $06 $D0
    cp   $01                                      ; $590E: $FE $01
    jr   nz, jr_017_5917                          ; $5910: $20 $05

    ld   hl, hNoiseSfx                                ; $5912: $21 $F4 $FF
    ld   [hl], $35                                ; $5915: $36 $35

jr_017_5917:
    and  a                                        ; $5917: $A7
    jr   nz, jr_017_594F                          ; $5918: $20 $35

    ldh  a, [hFrameCounter]                               ; $591A: $F0 $E7
    and  $03                                      ; $591C: $E6 $03
    jr   nz, jr_017_594F                          ; $591E: $20 $2F

    ld   a, [$D00B]                               ; $5920: $FA $0B $D0
    cp   $3F                                      ; $5923: $FE $3F
    jr   z, jr_017_5930                           ; $5925: $28 $09

    inc  a                                        ; $5927: $3C
    ld   [$D00B], a                               ; $5928: $EA $0B $D0
    ld   a, $0E                                   ; $592B: $3E $0E
    ldh  [$FFA5], a                               ; $592D: $E0 $A5
    ret                                           ; $592F: $C9

jr_017_5930:
    ld   a, $40                                   ; $5930: $3E $40
    ld   [$D006], a                               ; $5932: $EA $06 $D0
    jp   IncrementD000AndReturn                   ; $5935: $C3 $25 $56

Func_017_5938::
    ld   a, [$D006]                               ; $5938: $FA $06 $D0
    and  a                                        ; $593B: $A7
    ret  nz                                       ; $593C: $C0

    xor  a                                        ; $593D: $AF
    ld   [wBGPalette], a                          ; $593E: $EA $97 $DB
    ld   [wOBJ0Palette], a                        ; $5941: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $5944: $EA $99 $DB
    ld   a, BANK(Func_017_5938)                   ; $5947: $3E $17
    call ClearFileMenuBG_trampoline               ; $5949: $CD $FA $08
    jp   IncrementD000AndReturn                   ; $594C: $C3 $25 $56

jr_017_594F:
    ret                                           ; $594F: $C9

    nop                                           ; $5950: $00
    nop                                           ; $5951: $00
    nop                                           ; $5952: $00
    nop                                           ; $5953: $00
    ld   b, b                                     ; $5954: $40
    ld   b, b                                     ; $5955: $40
    ld   b, b                                     ; $5956: $40
    ld   b, b                                     ; $5957: $40
    sub  h                                        ; $5958: $94
    sub  h                                        ; $5959: $94
    sub  h                                        ; $595A: $94
    sub  h                                        ; $595B: $94
    db   $E4                                      ; $595C: $E4
    db   $E4                                      ; $595D: $E4
    db   $E4                                      ; $595E: $E4
    db   $E4                                      ; $595F: $E4
    nop                                           ; $5960: $00
    nop                                           ; $5961: $00
    nop                                           ; $5962: $00
    nop                                           ; $5963: $00
    inc  b                                        ; $5964: $04
    inc  b                                        ; $5965: $04
    inc  b                                        ; $5966: $04
    inc  b                                        ; $5967: $04
    jr   jr_017_5982                              ; $5968: $18 $18

    jr   @+$1A                                    ; $596A: $18 $18

    inc  e                                        ; $596C: $1C
    inc  e                                        ; $596D: $1C
    inc  e                                        ; $596E: $1C
    inc  e                                        ; $596F: $1C

func_017_5970:
    ldh  a, [hFrameCounter]                               ; $5970: $F0 $E7
    and  $01                                      ; $5972: $E6 $01
    jr   nz, jr_017_598F                          ; $5974: $20 $19

    ld   a, [$D00A]                               ; $5976: $FA $0A $D0
    inc  a                                        ; $5979: $3C
    ld   [$D00A], a                               ; $597A: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $597D: $F0 $FE
    and  a                                        ; $597F: $A7
    jr   z, jr_017_598F                           ; $5980: $28 $0D

jr_017_5982:
    ld   a, [$D00A]                               ; $5982: $FA $0A $D0
    cp   $02                                      ; $5985: $FE $02
    ret  c                                        ; $5987: $D8

    dec  a                                        ; $5988: $3D
    call func_017_7E80                            ; $5989: $CD $80 $7E
    jp   label_017_5A32                           ; $598C: $C3 $32 $5A

jr_017_598F:
    ldh  a, [hFrameCounter]                               ; $598F: $F0 $E7
    and  $03                                      ; $5991: $E6 $03
    ld   e, a                                     ; $5993: $5F
    ld   a, [$D00A]                               ; $5994: $FA $0A $D0
    add  e                                        ; $5997: $83
    ld   e, a                                     ; $5998: $5F
    ld   d, $00                                   ; $5999: $16 $00
    ld   hl, $5950                                ; $599B: $21 $50 $59
    add  hl, de                                   ; $599E: $19
    ld   a, [hl]                                  ; $599F: $7E
    ld   [wBGPalette], a                               ; $59A0: $EA $97 $DB
    ld   hl, $5960                                ; $59A3: $21 $60 $59
    jp   label_017_5A32                           ; $59A6: $C3 $32 $5A

func_017_59A9:
    ldh  a, [hFrameCounter]                               ; $59A9: $F0 $E7
    and  $03                                      ; $59AB: $E6 $03
    jr   nz, jr_017_59C7                          ; $59AD: $20 $18

    ld   a, [$D00A]                               ; $59AF: $FA $0A $D0
    inc  a                                        ; $59B2: $3C
    ld   [$D00A], a                               ; $59B3: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $59B6: $F0 $FE
    and  a                                        ; $59B8: $A7
    jr   z, jr_017_59C7                           ; $59B9: $28 $0C

    ld   a, [$D00A]                               ; $59BB: $FA $0A $D0
    cp   $02                                      ; $59BE: $FE $02
    ret  c                                        ; $59C0: $D8

    dec  a                                        ; $59C1: $3D
    call func_017_7E80                            ; $59C2: $CD $80 $7E
    jr   jr_017_5A32                              ; $59C5: $18 $6B

jr_017_59C7:
    ldh  a, [hFrameCounter]                               ; $59C7: $F0 $E7
    and  $03                                      ; $59C9: $E6 $03
    ld   e, a                                     ; $59CB: $5F
    ld   a, [$D00A]                               ; $59CC: $FA $0A $D0
    add  e                                        ; $59CF: $83
    ld   e, a                                     ; $59D0: $5F
    ld   d, $00                                   ; $59D1: $16 $00
    ld   hl, $6ED8                                ; $59D3: $21 $D8 $6E
    add  hl, de                                   ; $59D6: $19
    ld   a, [hl]                                  ; $59D7: $7E
    ld   [wBGPalette], a                               ; $59D8: $EA $97 $DB
    jr   jr_017_5A37                              ; $59DB: $18 $5A

    db   $E4                                      ; $59DD: $E4
    db   $E4                                      ; $59DE: $E4
    db   $E4                                      ; $59DF: $E4
    db   $E4                                      ; $59E0: $E4
    sub  h                                        ; $59E1: $94
    sub  h                                        ; $59E2: $94
    sub  h                                        ; $59E3: $94
    sub  h                                        ; $59E4: $94
    ld   b, b                                     ; $59E5: $40
    ld   b, b                                     ; $59E6: $40
    ld   b, b                                     ; $59E7: $40
    ld   b, b                                     ; $59E8: $40
    nop                                           ; $59E9: $00
    nop                                           ; $59EA: $00
    nop                                           ; $59EB: $00
    nop                                           ; $59EC: $00
    inc  e                                        ; $59ED: $1C
    inc  e                                        ; $59EE: $1C
    inc  e                                        ; $59EF: $1C
    inc  e                                        ; $59F0: $1C
    jr   @+$1A                                    ; $59F1: $18 $18

    jr   jr_017_5A0D                              ; $59F3: $18 $18

    inc  b                                        ; $59F5: $04
    inc  b                                        ; $59F6: $04
    inc  b                                        ; $59F7: $04
    inc  b                                        ; $59F8: $04
    nop                                           ; $59F9: $00
    nop                                           ; $59FA: $00
    nop                                           ; $59FB: $00
    nop                                           ; $59FC: $00

func_017_59FD:
    ldh  a, [hFrameCounter]                               ; $59FD: $F0 $E7
    and  $0F                                      ; $59FF: $E6 $0F
    jr   nz, jr_017_5A1B                          ; $5A01: $20 $18

    ld   a, [$D00A]                               ; $5A03: $FA $0A $D0
    inc  a                                        ; $5A06: $3C
    ld   [$D00A], a                               ; $5A07: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $5A0A: $F0 $FE
    and  a                                        ; $5A0C: $A7

jr_017_5A0D:
    jr   z, jr_017_5A1B                           ; $5A0D: $28 $0C

    ld   a, [$D00A]                               ; $5A0F: $FA $0A $D0
    cp   $02                                      ; $5A12: $FE $02
    ret  c                                        ; $5A14: $D8

    dec  a                                        ; $5A15: $3D
    call func_017_7F30                            ; $5A16: $CD $30 $7F
    jr   jr_017_5A37                              ; $5A19: $18 $1C

jr_017_5A1B:
    ldh  a, [hFrameCounter]                               ; $5A1B: $F0 $E7
    and  $03                                      ; $5A1D: $E6 $03
    ld   e, a                                     ; $5A1F: $5F
    ld   a, [$D00A]                               ; $5A20: $FA $0A $D0
    add  e                                        ; $5A23: $83
    ld   e, a                                     ; $5A24: $5F
    ld   d, $00                                   ; $5A25: $16 $00
    ld   hl, $59DD                                ; $5A27: $21 $DD $59
    add  hl, de                                   ; $5A2A: $19
    ld   a, [hl]                                  ; $5A2B: $7E
    ld   [wBGPalette], a                               ; $5A2C: $EA $97 $DB
    ld   hl, $59ED                                ; $5A2F: $21 $ED $59

label_017_5A32:
jr_017_5A32:
    add  hl, de                                   ; $5A32: $19
    ld   a, [hl]                                  ; $5A33: $7E
    ld   [wOBJ0Palette], a                               ; $5A34: $EA $98 $DB

jr_017_5A37:
    ld   a, [$D00A]                               ; $5A37: $FA $0A $D0
    cp   $0C                                      ; $5A3A: $FE $0C
    jr   nz, jr_017_5A42                          ; $5A3C: $20 $04

    xor  a                                        ; $5A3E: $AF
    ld   [$D00A], a                               ; $5A3F: $EA $0A $D0

jr_017_5A42:
    ret                                           ; $5A42: $C9

    ldh  a, [hFrameCounter]                               ; $5A43: $F0 $E7
    and  $07                                      ; $5A45: $E6 $07
    jr   nz, jr_017_5A50                          ; $5A47: $20 $07

    ld   a, [$D00A]                               ; $5A49: $FA $0A $D0
    inc  a                                        ; $5A4C: $3C
    ld   [$D00A], a                               ; $5A4D: $EA $0A $D0

jr_017_5A50:
    ldh  a, [hFrameCounter]                               ; $5A50: $F0 $E7
    and  $03                                      ; $5A52: $E6 $03
    ld   e, a                                     ; $5A54: $5F
    ld   a, [$D00A]                               ; $5A55: $FA $0A $D0
    add  e                                        ; $5A58: $83
    ld   e, a                                     ; $5A59: $5F
    ld   d, $00                                   ; $5A5A: $16 $00
    ld   hl, $6456                                ; $5A5C: $21 $56 $64
    add  hl, de                                   ; $5A5F: $19
    ld   a, [hl]                                  ; $5A60: $7E
    ld   [wBGPalette], a                               ; $5A61: $EA $97 $DB
    jr   jr_017_5A37                              ; $5A64: $18 $D1

Func_017_5A66::
    ld   a, $C9                                   ; $5A66: $3E $C9
    ld   [wBGPalette], a                               ; $5A68: $EA $97 $DB
    ld   a, $1C                                   ; $5A6B: $3E $1C
    ld   [wOBJ0Palette], a                               ; $5A6D: $EA $98 $DB
    ld   a, $90                                   ; $5A70: $3E $90
    ld   [wOBJ1Palette], a                               ; $5A72: $EA $99 $DB
    ld   a, [$D006]                               ; $5A75: $FA $06 $D0
    and  a                                        ; $5A78: $A7
    jp   nz, label_017_56BA                       ; $5A79: $C2 $BA $56

    ld   a, $00                                   ; $5A7C: $3E $00
    ld   [$C155], a                               ; $5A7E: $EA $55 $C1
    ld   a, $00                                   ; $5A81: $3E $00
    ldh  [$FF9D], a                               ; $5A83: $E0 $9D
    ld   a, $15                                   ; $5A85: $3E $15
    ld   [wTileMapToLoad], a                               ; $5A87: $EA $FE $D6
    xor  a                                        ; $5A8A: $AF
    ld   [$DDD5], a                               ; $5A8B: $EA $D5 $DD
    ld   a, $E8                                   ; $5A8E: $3E $E8
    call SpawnNewEntity_trampoline                ; $5A90: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $5A93: $21 $00 $C2
    add  hl, de                                   ; $5A96: $19
    ld   [hl], $40                                ; $5A97: $36 $40
    ld   hl, wEntitiesPosYTable                                ; $5A99: $21 $10 $C2
    add  hl, de                                   ; $5A9C: $19
    ld   [hl], $60                                ; $5A9D: $36 $60
    ld   hl, $C290                                ; $5A9F: $21 $90 $C2
    add  hl, de                                   ; $5AA2: $19
    ld   [hl], $02                                ; $5AA3: $36 $02
    ld   a, $E8                                   ; $5AA5: $3E $E8
    call SpawnNewEntity_trampoline                ; $5AA7: $CD $86 $3B
    ld   hl, $C2B0                                ; $5AAA: $21 $B0 $C2
    add  hl, de                                   ; $5AAD: $19
    inc  [hl]                                     ; $5AAE: $34
    ld   a, $50                                   ; $5AAF: $3E $50
    ldh  [hLinkPositionX], a                               ; $5AB1: $E0 $98
    ld   hl, $D6FD                                ; $5AB3: $21 $FD $D6
    set  3, [hl]                                  ; $5AB6: $CB $DE
    ld   a, $A0                                   ; $5AB8: $3E $A0
    ld   [$D006], a                               ; $5ABA: $EA $06 $D0
    ld   a, $FF                                   ; $5ABD: $3E $FF
    ld   [wBGPalette], a                               ; $5ABF: $EA $97 $DB
    ld   a, $5C                                   ; $5AC2: $3E $5C
    ldh  [hLinkPositionY], a                               ; $5AC4: $E0 $99

    ld   a, $34                                   ; $5AC6: $3E $34
    ldh  [hNoiseSfx], a                               ; $5AC8: $E0 $F4

    jp   IncrementD000AndReturn                                    ; $5ACA: $C3 $25 $56

Func_017_5ACD::
    ld   a, [$D006]                               ; $5ACD: $FA $06 $D0
    and  a                                        ; $5AD0: $A7
    jp   nz, label_017_56BA                       ; $5AD1: $C2 $BA $56

    ld   [$C155], a                               ; $5AD4: $EA $55 $C1
    call ResetCreditsSceneVariables                            ; $5AD7: $CD $A5 $4D
    jp   IncrementCreditsSubsceneAndReturn                           ; $5ADA: $C3 $D9 $4C

CreditsWaterAppearingHandler::
    ldh  a, [hLinkPositionY]                               ; $5ADD: $F0 $99
    sub  $02                                      ; $5ADF: $D6 $02
    ldh  [hLinkPositionY], a                               ; $5AE1: $E0 $99
    ldh  a, [hBaseScrollY]                               ; $5AE3: $F0 $97
    add  $08                                      ; $5AE5: $C6 $08
    ldh  [hBaseScrollY], a                               ; $5AE7: $E0 $97
    cp   $60                                      ; $5AE9: $FE $60
    jr   nz, jr_017_5AFC                          ; $5AEB: $20 $0F

    ld   a, [$C29F]                               ; $5AED: $FA $9F $C2
    inc  a                                        ; $5AF0: $3C
    ld   [$C29F], a                               ; $5AF1: $EA $9F $C2
    ld   a, $40                                   ; $5AF4: $3E $40
    ld   [$D009], a                               ; $5AF6: $EA $09 $D0
    call IncrementCreditsSubscene                            ; $5AF9: $CD $D9 $4C

jr_017_5AFC:
    call func_017_5B96                            ; $5AFC: $CD $96 $5B
    ret                                           ; $5AFF: $C9

func_017_5B00:
    call LCDOff                                   ; $5B00: $CD $CF $28
    call CreditsLoadBGMap                         ; $5B03: $CD $19 $5B
    call func_017_5B37                            ; $5B06: $CD $37 $5B
    ld   a, [$D6FD]                               ; $5B09: $FA $FD $D6
    ldh  [rLCDC], a                               ; $5B0C: $E0 $40
    ret                                           ; $5B0E: $C9

    ld   b, b                                     ; $5B0F: $40
    ld   [hl], e                                  ; $5B10: $73
    ret  nc                                       ; $5B11: $D0

    ld   l, d                                     ; $5B12: $6A
    and  b                                        ; $5B13: $A0
    ld   l, l                                     ; $5B14: $6D
    ld   [hl], b                                  ; $5B15: $70
    ld   [hl], b                                  ; $5B16: $70
    nop                                           ; $5B17: $00
    ld   l, b                                     ; $5B18: $68

CreditsLoadBGMap:
    ; Source address
    ld   hl, $5B0F                                ; $5B19: $21 $0F $5B
    ld   a, [$D000]                               ; $5B1C: $FA $00 $D0
    dec  a                                        ; $5B1F: $3D
    ld   e, a                                     ; $5B20: $5F
    ld   d, $00                                   ; $5B21: $16 $00
    add  hl, de                                   ; $5B23: $19
    ld   a, [hl+]                                 ; $5B24: $2A
    ld   b, a                                     ; $5B25: $47
    ; Return bank to restore
    ld   a, BANK(CreditsLoadBGMap)                   ; $5B26: $3E $17
    ldh  [hScratchF], a                           ; $5B28: $E0 $E6
    ld   h, [hl]                                  ; $5B2A: $66
    ld   l, b                                     ; $5B2B: $68
    ; Source bank
    ld   a, $23                                   ; $5B2C: $3E $23
    call CopyBGMapFromBank                        ; $5B2E: $CD $69 $0B
    ret                                           ; $5B31: $C9

    nop                                           ; $5B32: $00
    nop                                           ; $5B33: $00
    sbc  a                                        ; $5B34: $9F
    and  b                                        ; $5B35: $A0
    and  c                                        ; $5B36: $A1

func_017_5B37:
    ld   hl, $5B32                                ; $5B37: $21 $32 $5B
    ld   a, [$D000]                               ; $5B3A: $FA $00 $D0
    dec  a                                        ; $5B3D: $3D
    srl  a                                        ; $5B3E: $CB $3F
    ld   d, $00                                   ; $5B40: $16 $00
    ld   e, a                                     ; $5B42: $5F
    add  hl, de                                   ; $5B43: $19
    ld   a, [hl]                                  ; $5B44: $7E
    and  a                                        ; $5B45: $A7
    ret  z                                        ; $5B46: $C8

    ld   [$DDD2], a                               ; $5B47: $EA $D2 $DD
    ret                                           ; $5B4A: $C9

    ld   b, e                                     ; $5B4B: $43
    inc  de                                       ; $5B4C: $13
    rlca                                          ; $5B4D: $07
    add  e                                        ; $5B4E: $83
    inc  hl                                       ; $5B4F: $23
    dec  bc                                       ; $5B50: $0B
    ld   d, e                                     ; $5B51: $53
    rla                                           ; $5B52: $17
    ld   b, a                                     ; $5B53: $47
    daa                                           ; $5B54: $27
    ld   c, e                                     ; $5B55: $4B
    sub  e                                        ; $5B56: $93
    ld   h, b                                     ; $5B57: $60
    ld   h, b                                     ; $5B58: $60
    ld   h, c                                     ; $5B59: $61
    ld   h, d                                     ; $5B5A: $62
    ld   h, e                                     ; $5B5B: $63
    ld   h, h                                     ; $5B5C: $64
    ld   h, l                                     ; $5B5D: $65
    ld   h, l                                     ; $5B5E: $65
    ld   h, l                                     ; $5B5F: $65
    ld   h, l                                     ; $5B60: $65
    ld   h, h                                     ; $5B61: $64
    ld   h, e                                     ; $5B62: $63
    ld   h, d                                     ; $5B63: $62
    ld   h, c                                     ; $5B64: $61
    ld   h, b                                     ; $5B65: $60
    ld   h, b                                     ; $5B66: $60

CreditsWaterSplashingHandler::
    call func_017_5B96                            ; $5B67: $CD $96 $5B
    ld   a, [$D009]                               ; $5B6A: $FA $09 $D0
    and  a                                        ; $5B6D: $A7
    jr   nz, jr_017_5B73                          ; $5B6E: $20 $03

    jp   IncrementCreditsSubsceneAndReturn                           ; $5B70: $C3 $D9 $4C

jr_017_5B73:
    ld   a, [$C21E]                               ; $5B73: $FA $1E $C2
    add  $08                                      ; $5B76: $C6 $08
    ld   [$C21E], a                               ; $5B78: $EA $1E $C2
    ld   a, [$D00A]                               ; $5B7B: $FA $0A $D0
    inc  a                                        ; $5B7E: $3C
    ld   [$D00A], a                               ; $5B7F: $EA $0A $D0
    rra                                           ; $5B82: $1F
    rra                                           ; $5B83: $1F
    rra                                           ; $5B84: $1F
    nop                                           ; $5B85: $00
    and  $0F                                      ; $5B86: $E6 $0F
    ld   e, a                                     ; $5B88: $5F
    ld   d, $00                                   ; $5B89: $16 $00
    ld   hl, $5B57                                ; $5B8B: $21 $57 $5B
    add  hl, de                                   ; $5B8E: $19
    ld   a, [hl]                                  ; $5B8F: $7E
    ldh  [hBaseScrollY], a                               ; $5B90: $E0 $97
    call func_017_5BE2                            ; $5B92: $CD $E2 $5B
    ret                                           ; $5B95: $C9

func_017_5B96:
    ldh  a, [hFrameCounter]                               ; $5B96: $F0 $E7
    rra                                           ; $5B98: $1F
    rra                                           ; $5B99: $1F
    rra                                           ; $5B9A: $1F
    and  $07                                      ; $5B9B: $E6 $07
    add  $05                                      ; $5B9D: $C6 $05
    ldh  [$FF9D], a                               ; $5B9F: $E0 $9D
    ld   a, [$D006]                               ; $5BA1: $FA $06 $D0
    and  a                                        ; $5BA4: $A7
    jr   nz, jr_017_5BBB                          ; $5BA5: $20 $14

    ld   a, $03                                   ; $5BA7: $3E $03
    ld   [$D006], a                               ; $5BA9: $EA $06 $D0
    ld   a, [$D000]                               ; $5BAC: $FA $00 $D0
    inc  a                                        ; $5BAF: $3C
    ld   [$D000], a                               ; $5BB0: $EA $00 $D0
    cp   $03                                      ; $5BB3: $FE $03
    jr   nz, jr_017_5BBB                          ; $5BB5: $20 $04

    xor  a                                        ; $5BB7: $AF
    ld   [$D000], a                               ; $5BB8: $EA $00 $D0

jr_017_5BBB:
    ldh  a, [hIsGBC]                               ; $5BBB: $F0 $FE
    and  a                                        ; $5BBD: $A7
    jp   nz, label_017_5BD0                       ; $5BBE: $C2 $D0 $5B

    ld   a, [$D000]                               ; $5BC1: $FA $00 $D0
    ld   e, a                                     ; $5BC4: $5F
    ld   d, $00                                   ; $5BC5: $16 $00
    ld   hl, $5B54                                ; $5BC7: $21 $54 $5B
    add  hl, de                                   ; $5BCA: $19
    ld   a, [hl]                                  ; $5BCB: $7E
    ld   [wBGPalette], a                               ; $5BCC: $EA $97 $DB
    ret                                           ; $5BCF: $C9

label_017_5BD0:
    ld   hl, $DE01                                ; $5BD0: $21 $01 $DE
    ld   a, $20                                   ; $5BD3: $3E $20
    ld   [hl+], a                                 ; $5BD5: $22
    ld   a, $78                                   ; $5BD6: $3E $78
    ld   [hl+], a                                 ; $5BD8: $22
    ld   a, $ED                                   ; $5BD9: $3E $ED
    ld   [hl+], a                                 ; $5BDB: $22
    ld   a, $17                                   ; $5BDC: $3E $17
    ld   [hl], a                                  ; $5BDE: $77
    jp   $0BD7                                    ; $5BDF: $C3 $D7 $0B

func_017_5BE2:
    ldh  a, [hBaseScrollY]                               ; $5BE2: $F0 $97
    cpl                                           ; $5BE4: $2F
    inc  a                                        ; $5BE5: $3C
    sub  $A0                                      ; $5BE6: $D6 $A0
    add  $3C                                      ; $5BE8: $C6 $3C
    ldh  [hLinkPositionY], a                               ; $5BEA: $E0 $99
    ret                                           ; $5BEC: $C9

Data_017_5BED::
    db   $9C, $00, $13, $A0, $A0, $A0, $A0, $A0  ; $5BED |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5BF5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5BFD |........|
    db   $9C, $20, $13, $A0, $A0, $A0, $A0, $A0  ; $5C05 |. ......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5C0D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C15 |........|
    db   $9C, $40, $13, $A0, $A0, $A0, $A0, $A0  ; $5C1D |.@......|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5C25 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C2D |........|
    db   $9C, $60, $13, $A0, $A0, $A0, $A0, $A0  ; $5C35 |.`......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5C3D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C45 |........|
    db   $9C, $80, $13, $A0, $A0, $A0, $A0, $A0  ; $5C4D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5C55 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C5D |........|
    db   $9C, $A0, $13, $A0, $A0, $A0, $A0, $A0  ; $5C65 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5C6D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C75 |........|
    db   $9C, $C0, $13, $A0, $A0, $A0, $A0, $A0  ; $5C7D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5C85 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5C8D |........|
    db   $9C, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $5C95 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5C9D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5CA5 |........|
    db   $9D, $00, $13, $A0, $A0, $A0, $A0, $A0  ; $5CAD |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5CB5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5CBD |........|
    db   $9D, $20, $13, $A0, $A0, $A0, $A0, $A0  ; $5CC5 |. ......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5CCD |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5CD5 |........|
    db   $9D, $40, $13, $A0, $A0, $A0, $A0, $A0  ; $5CDD |.@......|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5CE5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5CED |........|
    db   $9D, $60, $13, $A0, $A0, $A0, $A0, $A0  ; $5CF5 |.`......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5CFD |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D05 |........|
    db   $9D, $80, $13, $A0, $A0, $A0, $A0, $A0  ; $5D0D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5D15 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D1D |........|
    db   $9D, $A0, $13, $A0, $A0, $A0, $A0, $A0  ; $5D25 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5D2D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D35 |........|
    db   $9D, $C0, $13, $A0, $A0, $A0, $A0, $A0  ; $5D3D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5D45 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D4D |........|
    db   $9D, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $5D55 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5D5D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D65 |........|
    db   $9E, $00, $13, $A0, $A0, $A0, $A0, $A0  ; $5D6D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5D75 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D7D |........|
    db   $9E, $20, $13, $A0, $A0, $A0, $A0, $A0  ; $5D85 |. ......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5D8D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5D95 |........|
    db   $9E, $40, $13, $A0, $A0, $A0, $A0, $A0  ; $5D9D |.@......|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5DA5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5DAD |........|
    db   $9E, $60, $13, $A0, $A0, $A0, $A0, $A0  ; $5DB5 |.`......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5DBD |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5DC5 |........|
    db   $9E, $80, $13, $A0, $A0, $A0, $A0, $A0  ; $5DCD |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5DD5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5DDD |........|
    db   $9E, $A0, $13, $A0, $A0, $A0, $A0, $A0  ; $5DE5 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5DED |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5DF5 |........|
    db   $9E, $C0, $13, $A0, $A0, $A0, $A0, $A0  ; $5DFD |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5E05 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E0D |........|
    db   $9E, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $5E15 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5E1D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E25 |........|
    db   $9F, $00, $13, $A0, $A0, $A0, $A0, $A0  ; $5E2D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5E35 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E3D |........|
    db   $9F, $20, $13, $A0, $A0, $A0, $A0, $A0  ; $5E45 |. ......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5E4D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E55 |........|
    db   $9F, $40, $13, $A0, $A0, $A0, $A0, $A0  ; $5E5D |.@......|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5E65 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E6D |........|
    db   $9F, $60, $13, $A0, $A0, $A0, $A0, $A0  ; $5E75 |.`......|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5E7D |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E85 |........|
    db   $9F, $80, $13, $A0, $A0, $A0, $A0, $A0  ; $5E8D |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5E95 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5E9D |........|
    db   $9F, $A0, $13, $A0, $A0, $A0, $A0, $A0  ; $5EA5 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5EAD |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5EB5 |........|
    db   $9F, $C0, $13, $A0, $A0, $A0, $A0, $A0  ; $5EBD |........|
    db   $A0, $80, $81, $80, $81, $80, $81, $80  ; $5EC5 |........|
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5ECD |........|
    db   $9F, $E0, $13, $A0, $A0, $A0, $A0, $A0  ; $5ED5 |........|
    db   $A0, $90, $91, $90, $91, $90, $91, $90  ; $5EDD |........|
    db   $91, $A0, $A0, $A0, $A0, $A0, $A0, $00  ; $5EE5 |........|
    db   $00, $00, $00, $00, $00, $00, $02, $01  ; $5EED |........|
    db   $00, $00, $00, $00, $01, $02, $00, $00  ; $5EF5 |........|
    db   $00, $00, $00, $00, $00                 ; $5EFD |.....|

CreditsWaterMovingUpHandler::
    call func_017_5B96                            ; $5F02: $CD $96 $5B
    ld   a, [$C21E]                               ; $5F05: $FA $1E $C2
    add  $04                                      ; $5F08: $C6 $04
    ld   [$C21E], a                               ; $5F0A: $EA $1E $C2
    ld   a, [$D00B]                               ; $5F0D: $FA $0B $D0
    inc  a                                        ; $5F10: $3C
    ld   [$D00B], a                               ; $5F11: $EA $0B $D0
    and  $07                                      ; $5F14: $E6 $07
    jr   nz, jr_017_5F23                          ; $5F16: $20 $0B

    ld   a, [$D00C]                               ; $5F18: $FA $0C $D0
    cp   $08                                      ; $5F1B: $FE $08
    jr   z, jr_017_5F23                           ; $5F1D: $28 $04

    inc  a                                        ; $5F1F: $3C
    ld   [$D00C], a                               ; $5F20: $EA $0C $D0

jr_017_5F23:
    ld   a, [$D00C]                               ; $5F23: $FA $0C $D0
    ld   e, a                                     ; $5F26: $5F
    ldh  a, [hBaseScrollY]                               ; $5F27: $F0 $97
    add  e                                        ; $5F29: $83
    ldh  [hBaseScrollY], a                               ; $5F2A: $E0 $97
    call func_017_5BE2                            ; $5F2C: $CD $E2 $5B
    ldh  a, [hLinkPositionY]                               ; $5F2F: $F0 $99
    cp   $F0                                      ; $5F31: $FE $F0
    jr   c, jr_017_5F39                           ; $5F33: $38 $04

    xor  a                                        ; $5F35: $AF
    ld   [$C28F], a                               ; $5F36: $EA $8F $C2

jr_017_5F39:
    ld   a, [$D00B]                               ; $5F39: $FA $0B $D0
    and  $01                                      ; $5F3C: $E6 $01
    ret  nz                                       ; $5F3E: $C0

    ld   a, [$D001]                               ; $5F3F: $FA $01 $D0
    cp   $20                                      ; $5F42: $FE $20
    jr   nz, jr_017_5F4D                          ; $5F44: $20 $07

    call ResetCreditsSceneVariables                            ; $5F46: $CD $A5 $4D
    call IncrementCreditsSubscene                            ; $5F49: $CD $D9 $4C
    ret                                           ; $5F4C: $C9

jr_017_5F4D:
    ld   e, a                                     ; $5F4D: $5F
    inc  a                                        ; $5F4E: $3C
    ld   [$D001], a                               ; $5F4F: $EA $01 $D0
    ld   d, $00                                   ; $5F52: $16 $00
    sla  e                                        ; $5F54: $CB $23
    rl   d                                        ; $5F56: $CB $12
    sla  e                                        ; $5F58: $CB $23
    rl   d                                        ; $5F5A: $CB $12
    sla  e                                        ; $5F5C: $CB $23
    rl   d                                        ; $5F5E: $CB $12
    ld   a, e                                     ; $5F60: $7B
    sla  e                                        ; $5F61: $CB $23
    rl   d                                        ; $5F63: $CB $12
    add  e                                        ; $5F65: $83
    ld   e, a                                     ; $5F66: $5F
    ld   a, d                                     ; $5F67: $7A
    adc  $00                                      ; $5F68: $CE $00
    ld   d, a                                     ; $5F6A: $57
    ld   hl, Data_017_5BED                        ; $5F6B: $21 $ED $5B
    add  hl, de                                   ; $5F6E: $19
    push hl                                       ; $5F6F: $E5
    ld   de, $D601                                ; $5F70: $11 $01 $D6
    ld   c, $18                                   ; $5F73: $0E $18

jr_017_5F75:
    ld   a, [hl+]                                 ; $5F75: $2A
    ld   [de], a                                  ; $5F76: $12
    inc  de                                       ; $5F77: $13
    dec  c                                        ; $5F78: $0D
    jr   nz, jr_017_5F75                          ; $5F79: $20 $FA

    pop  hl                                       ; $5F7B: $E1
    ldh  a, [hIsGBC]                               ; $5F7C: $F0 $FE
    and  a                                        ; $5F7E: $A7
    ret  z                                        ; $5F7F: $C8

    ld   de, $DC91                                ; $5F80: $11 $91 $DC
    ld   a, [hl+]                                 ; $5F83: $2A
    ld   [de], a                                  ; $5F84: $12
    inc  de                                       ; $5F85: $13
    ld   a, [hl+]                                 ; $5F86: $2A
    ld   [de], a                                  ; $5F87: $12
    inc  de                                       ; $5F88: $13
    ld   a, $13                                   ; $5F89: $3E $13
    ld   [de], a                                  ; $5F8B: $12
    inc  de                                       ; $5F8C: $13
    ld   hl, $5EED                                ; $5F8D: $21 $ED $5E
    ld   c, $15                                   ; $5F90: $0E $15

jr_017_5F92:
    ld   a, [hl+]                                 ; $5F92: $2A
    ld   [de], a                                  ; $5F93: $12
    inc  de                                       ; $5F94: $13
    dec  c                                        ; $5F95: $0D
    jr   nz, jr_017_5F92                          ; $5F96: $20 $FA

    ret                                           ; $5F98: $C9

Data_017_5F99::
    db   $27, $27, $27, $27, $16, $16, $16, $16  ; $5F99 |''''....|
    db   $01, $01, $01, $01, $00, $00, $00, $00  ; $5FA1 |........|
    db   $1C, $1C, $1C, $1C, $1C, $1C, $18, $18  ; $5FA9 |........|
    db   $08, $08, $08, $08, $00, $00, $00, $00  ; $5FB1 |........|
    db   $90, $90, $90, $90, $50, $50, $50, $50  ; $5FB9 |....PPPP|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $5FC1 |........|

CreditsWaterFadeToWhiteHandler::
jr_017_5FC9:
    ld   a, [$C21E]                               ; $5FC9: $FA $1E $C2
    add  $02                                      ; $5FCC: $C6 $02
    ld   [$C21E], a                               ; $5FCE: $EA $1E $C2
    ldh  a, [hBaseScrollY]                               ; $5FD1: $F0 $97
    add  $04                                      ; $5FD3: $C6 $04
    ldh  [hBaseScrollY], a                               ; $5FD5: $E0 $97
    ldh  a, [hFrameCounter]                               ; $5FD7: $F0 $E7
    and  $07                                      ; $5FD9: $E6 $07
    jr   nz, jr_017_5FFF                          ; $5FDB: $20 $22

    ld   a, [$D00A]                               ; $5FDD: $FA $0A $D0
    cp   $0C                                      ; $5FE0: $FE $0C
    jr   nz, jr_017_5FEF                          ; $5FE2: $20 $0B

    call ResetCreditsSceneVariables                            ; $5FE4: $CD $A5 $4D
    ld   a, $C0                                   ; $5FE7: $3E $C0
    ld   [$D006], a                               ; $5FE9: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $5FEC: $C3 $D9 $4C

jr_017_5FEF:
    inc  a                                        ; $5FEF: $3C
    ld   [$D00A], a                               ; $5FF0: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $5FF3: $F0 $FE
    and  a                                        ; $5FF5: $A7
    jr   z, jr_017_5FFF                           ; $5FF6: $28 $07

    ld   a, [$D00A]                               ; $5FF8: $FA $0A $D0
    dec  a                                        ; $5FFB: $3D
    jp   label_017_7F30                           ; $5FFC: $C3 $30 $7F

jr_017_5FFF:
    ldh  a, [hFrameCounter]                               ; $5FFF: $F0 $E7
    and  $03                                      ; $6001: $E6 $03
    ld   e, a                                     ; $6003: $5F
    ld   a, [$D00A]                               ; $6004: $FA $0A $D0
    add  e                                        ; $6007: $83
    ld   e, a                                     ; $6008: $5F
    ld   d, $00                                   ; $6009: $16 $00
    ld   hl, Data_017_5F99                        ; $600B: $21 $99 $5F
    add  hl, de                                   ; $600E: $19
    ld   a, [hl]                                  ; $600F: $7E
    ld   [wBGPalette], a                               ; $6010: $EA $97 $DB
    ld   hl, $5FA9                                ; $6013: $21 $A9 $5F
    add  hl, de                                   ; $6016: $19
    ld   a, [hl]                                  ; $6017: $7E
    ld   [wOBJ0Palette], a                               ; $6018: $EA $98 $DB
    ld   hl, $5FB9                                ; $601B: $21 $B9 $5F
    add  hl, de                                   ; $601E: $19
    ld   a, [hl]                                  ; $601F: $7E
    ld   [wOBJ1Palette], a                               ; $6020: $EA $99 $DB
    ret                                           ; $6023: $C9

CreditsWaterNoiseFadingOutHandler::
    ld   a, [$D006]                               ; $6024: $FA $06 $D0
    and  a                                        ; $6027: $A7
    jr   nz, jr_017_6045                          ; $6028: $20 $1B

    xor  a                                        ; $602A: $AF
    ld   [wCreditsSubscene], a                               ; $602B: $EA $0E $D0
    ld   [$C28E], a                               ; $602E: $EA $8E $C2
    ld   [$C28F], a                               ; $6031: $EA $8F $C2
    ld   [$C114], a                               ; $6034: $EA $14 $C1
    ld   a, $80                                   ; $6037: $3E $80
    ld   [$D466], a                               ; $6039: $EA $66 $D4
    ld   hl, $D6FD                                ; $603C: $21 $FD $D6
    res  3, [hl]                                  ; $603F: $CB $9E
    ld   hl, wGameplaySubtype                                ; $6041: $21 $96 $DB
    inc  [hl]                                     ; $6044: $34

jr_017_6045:
    ret                                           ; $6045: $C9

CreditsLinkOnSeaLargeHandler::
    call func_017_4839                            ; $6046: $CD $39 $48
    ld   de, $98E0                                ; $6049: $11 $E0 $98
    call func_017_488C                            ; $604C: $CD $8C $48
    call AnimateEntitiesAndRestoreBank17                                    ; $604F: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $6052: $FA $0E $D0
    JP_TABLE                                      ; $6055: $C7
._00 dw LinkOnSeaLarge0Handler                    ; $6056
._01 dw LinkOnSeaLarge1Handler                    ; $6058
._02 dw LinkOnSeaLarge2Handler                    ; $605A
._03 dw LinkOnSeaLarge3Handler                    ; $605C

LinkOnSeaLarge0Handler::
    ld   a, $16                                   ; $605E: $3E $16
    ld   [wTileMapToLoad], a                               ; $6060: $EA $FE $D6
    xor  a                                        ; $6063: $AF
    ld   [$DDD5], a                               ; $6064: $EA $D5 $DD
    call ResetCreditsSceneVariables                            ; $6067: $CD $A5 $4D
    ldh  a, [hIsGBC]                               ; $606A: $F0 $FE
    and  a                                        ; $606C: $A7
    jp   z, IncrementCreditsSubsceneAndReturn     ; $606D: $CA $D9 $4C

    ld   hl, $D6FD                                ; $6070: $21 $FD $D6
    res  2, [hl]                                  ; $6073: $CB $96
    jp   IncrementCreditsSubsceneAndReturn                           ; $6075: $C3 $D9 $4C

LinkOnSeaLarge1Handler::
    ld   a, $17                                   ; $6078: $3E $17
    ld   [wBGMapToLoad], a                               ; $607A: $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $607D: $3E $E8
    call SpawnNewEntity_trampoline                ; $607F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6082: $21 $00 $C2
    add  hl, de                                   ; $6085: $19
    ld   [hl], $48                                ; $6086: $36 $48
    ld   hl, wEntitiesPosYTable                                ; $6088: $21 $10 $C2
    add  hl, de                                   ; $608B: $19
    ld   [hl], $60                                ; $608C: $36 $60
    ld   hl, $C2B0                                ; $608E: $21 $B0 $C2
    add  hl, de                                   ; $6091: $19
    ld   [hl], $04                                ; $6092: $36 $04

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $6094: $3E $E8
    call SpawnNewEntity_trampoline                ; $6096: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6099: $21 $00 $C2
    add  hl, de                                   ; $609C: $19
    ld   [hl], $28                                ; $609D: $36 $28
    ld   hl, wEntitiesPosYTable                                ; $609F: $21 $10 $C2
    add  hl, de                                   ; $60A2: $19
    ld   [hl], $68                                ; $60A3: $36 $68
    ld   hl, $C2B0                                ; $60A5: $21 $B0 $C2
    add  hl, de                                   ; $60A8: $19
    ld   [hl], $05                                ; $60A9: $36 $05

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $60AB: $3E $E8
    call SpawnNewEntity_trampoline                ; $60AD: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $60B0: $21 $00 $C2
    add  hl, de                                   ; $60B3: $19
    ld   [hl], $78                                ; $60B4: $36 $78
    ld   hl, wEntitiesPosYTable                                ; $60B6: $21 $10 $C2
    add  hl, de                                   ; $60B9: $19
    ld   [hl], $60                                ; $60BA: $36 $60
    ld   hl, $C2B0                                ; $60BC: $21 $B0 $C2
    add  hl, de                                   ; $60BF: $19
    ld   [hl], $05                                ; $60C0: $36 $05
    ld   hl, $C3B0                                ; $60C2: $21 $B0 $C3
    add  hl, de                                   ; $60C5: $19
    inc  [hl]                                     ; $60C6: $34
    jp   IncrementCreditsSubsceneAndReturn                           ; $60C7: $C3 $D9 $4C

; Palettes indices
Data_017_60CA::
    db   $00, $00, $00, $00, $05, $05, $05, $05  ; $60CA |........|
    db   $19, $19, $1A, $1A, $1E, $1E, $1E, $1E  ; $60D2 |........|

; Palettes indices
Data_017_60DA::
    db   $00, $00, $00, $00, $00, $01, $01, $01  ; $60DA |........|
    db   $51, $51, $52, $52, $92, $92, $92, $92  ; $60E2 |QQRR....|

LinkOnSeaLarge2Handler::
    call ResetCreditsSceneVariables                            ; $60EA: $CD $A5 $4D
    ld   a, $60                                   ; $60ED: $3E $60
    ld   [$D009], a                               ; $60EF: $EA $09 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $60F2: $C3 $D9 $4C

LinkOnSeaLarge3Handler::
    ld   a, [$D009]                               ; $60F5: $FA $09 $D0
    and  a                                        ; $60F8: $A7
    jr   nz, jr_017_6114                          ; $60F9: $20 $19

    xor  a                                        ; $60FB: $AF
    ld   [wCreditsSubscene], a                               ; $60FC: $EA $0E $D0
    ld   [$C28C], a                               ; $60FF: $EA $8C $C2
    ld   [$C28D], a                               ; $6102: $EA $8D $C2
    ld   [$C28E], a                               ; $6105: $EA $8E $C2
    ld   [$C28F], a                               ; $6108: $EA $8F $C2

    ld   a, BANK(LinkOnSeaLarge3Handler)          ; $610B: $3E $17
    call ClearFileMenuBG_trampoline               ; $610D: $CD $FA $08

    ld   hl, wGameplaySubtype                     ; $6110: $21 $96 $DB
    inc  [hl]                                     ; $6113: $34

jr_017_6114:
    ret                                           ; $6114: $C9

CreditsSunAboveHandler::
    call func_017_4839                            ; $6115: $CD $39 $48
    call AnimateEntitiesAndRestoreBank17                                    ; $6118: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $611B: $FA $0E $D0
    JP_TABLE                                      ; $611E: $C7
._00 dw CreditsSunAbove0Handler
._01 dw CreditsSunAbove1Handler
._02 dw CreditsSunAbove2Handler
._03 dw CreditsSunAbove3Handler
._04 dw CreditsSunAbove4Handler

CreditsSunAbove0Handler::
    ld   a, $17                                   ; $6129: $3E $17
    ld   [wTileMapToLoad], a                               ; $612B: $EA $FE $D6
    ld   a, $01                                   ; $612E: $3E $01
    ld   [$DDD5], a                               ; $6130: $EA $D5 $DD
    xor  a                                        ; $6133: $AF
    ldh  [$FF96], a                               ; $6134: $E0 $96
    ldh  [hBaseScrollY], a                               ; $6136: $E0 $97
    ld   [$C155], a                               ; $6138: $EA $55 $C1
    ld   [$C156], a                               ; $613B: $EA $56 $C1
    ld   a, $3D                                   ; $613E: $3E $3D
    ld   [$D368], a                               ; $6140: $EA $68 $D3
    call ResetCreditsSceneVariables                            ; $6143: $CD $A5 $4D
    jp   IncrementCreditsSubsceneAndReturn                           ; $6146: $C3 $D9 $4C

CreditsSunAbove1Handler::
    ld   a, $18                                   ; $6149: $3E $18
    ld   [wBGMapToLoad], a                        ; $614B: $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $614E: $3E $E8
    call SpawnNewEntity_trampoline                ; $6150: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6153: $21 $00 $C2
    add  hl, de                                   ; $6156: $19
    ld   [hl], $18                                ; $6157: $36 $18
    ld   hl, wEntitiesPosYTable                                ; $6159: $21 $10 $C2
    add  hl, de                                   ; $615C: $19
    ld   [hl], $20                                ; $615D: $36 $20
    ld   hl, $C2B0                                ; $615F: $21 $B0 $C2
    add  hl, de                                   ; $6162: $19
    ld   [hl], $06                                ; $6163: $36 $06
    ld   hl, wEntitiesSpeedXTable                                ; $6165: $21 $40 $C2
    add  hl, de                                   ; $6168: $19
    ld   [hl], $03                                ; $6169: $36 $03

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $616B: $3E $E8
    call SpawnNewEntity_trampoline                ; $616D: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6170: $21 $00 $C2
    add  hl, de                                   ; $6173: $19
    ld   [hl], $78                                ; $6174: $36 $78
    ld   hl, wEntitiesPosYTable                                ; $6176: $21 $10 $C2
    add  hl, de                                   ; $6179: $19
    ld   [hl], $78                                ; $617A: $36 $78
    ld   hl, $C2B0                                ; $617C: $21 $B0 $C2
    add  hl, de                                   ; $617F: $19
    ld   [hl], $06                                ; $6180: $36 $06
    ld   hl, wEntitiesSpeedXTable                                ; $6182: $21 $40 $C2
    add  hl, de                                   ; $6185: $19
    ld   [hl], $FD                                ; $6186: $36 $FD
    ld   hl, $C3B0                                ; $6188: $21 $B0 $C3

jr_017_618B:
    add  hl, de                                   ; $618B: $19
    ld   [hl], $03                                ; $618C: $36 $03
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $618E: $3E $E8
    call SpawnNewEntity_trampoline                ; $6190: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6193: $21 $00 $C2
    add  hl, de                                   ; $6196: $19
    ld   [hl], $68                                ; $6197: $36 $68
    ld   hl, wEntitiesPosYTable                                ; $6199: $21 $10 $C2
    add  hl, de                                   ; $619C: $19
    ld   [hl], $60                                ; $619D: $36 $60
    ld   hl, $C2B0                                ; $619F: $21 $B0 $C2
    add  hl, de                                   ; $61A2: $19
    ld   [hl], $07                                ; $61A3: $36 $07
    ld   a, $60                                   ; $61A5: $3E $60
    ld   [$D009], a                               ; $61A7: $EA $09 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $61AA: $C3 $D9 $4C

; Palettes indices
Data_017_61AD::
    db   $00, $00, $00, $00, $05, $05, $05, $05  ; $61AD
    db   $05, $05, $05, $05, $19, $19, $1A, $1A  ; $61B5
    db   $1E, $1E, $1E, $1E                      ; $61BD

; Palettes indices
Data_017_61C1::
    db   $00, $00, $00, $00
    db   $00, $01, $01, $01, $01, $01, $01, $01  ; $61C1
    db   $51, $51, $51, $52, $52, $92, $92, $92  ; $61CD
    db   $92                                     ; $61D5

CreditsSunAbove2Handler::
    ldh  a, [hFrameCounter]                               ; $61D6: $F0 $E7
    and  $0F                                      ; $61D8: $E6 $0F
    jr   nz, jr_017_61FE                          ; $61DA: $20 $22

    ld   a, [$D00A]                               ; $61DC: $FA $0A $D0
    cp   $10                                      ; $61DF: $FE $10
    jr   nz, jr_017_61EE                          ; $61E1: $20 $0B

    call ResetCreditsSceneVariables                            ; $61E3: $CD $A5 $4D
    ld   a, $60                                   ; $61E6: $3E $60
    ld   [$D009], a                               ; $61E8: $EA $09 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $61EB: $C3 $D9 $4C

jr_017_61EE:
    inc  a                                        ; $61EE: $3C
    ld   [$D00A], a                               ; $61EF: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $61F2: $F0 $FE
    and  a                                        ; $61F4: $A7
    jr   z, jr_017_61FE                           ; $61F5: $28 $07

    ld   a, [$D00A]                               ; $61F7: $FA $0A $D0
    dec  a                                        ; $61FA: $3D
    jp   label_017_7E80                           ; $61FB: $C3 $80 $7E

jr_017_61FE:
    ldh  a, [hFrameCounter]                               ; $61FE: $F0 $E7
    and  $03                                      ; $6200: $E6 $03
    ld   e, a                                     ; $6202: $5F
    ld   a, [$D00A]                               ; $6203: $FA $0A $D0
    add  e                                        ; $6206: $83
    ld   e, a                                     ; $6207: $5F
    ld   d, $00                                   ; $6208: $16 $00
    ld   hl, Data_017_61AD                        ; $620A: $21 $AD $61
    add  hl, de                                   ; $620D: $19
    ld   a, [hl]                                  ; $620E: $7E
    ld   [wBGPalette], a                          ; $620F: $EA $97 $DB
    ld   hl, Data_017_61AD                        ; $6212: $21 $AD $61
    add  hl, de                                   ; $6215: $19
    ld   a, [hl]                                  ; $6216: $7E
    ld   [wOBJ0Palette], a                        ; $6217: $EA $98 $DB
    ld   hl, Data_017_61C1                        ; $621A: $21 $C1 $61
    add  hl, de                                   ; $621D: $19
    ld   a, [hl]                                  ; $621E: $7E
    ld   [wOBJ1Palette], a                               ; $621F: $EA $99 $DB
    ret                                           ; $6222: $C9

CreditsSunAbove3Handler::
    ld   a, [$D009]                               ; $6223: $FA $09 $D0
    and  a                                        ; $6226: $A7
    jr   nz, jr_017_622F                          ; $6227: $20 $06

    call ResetCreditsSceneVariables                            ; $6229: $CD $A5 $4D
    jp   IncrementCreditsSubsceneAndReturn                           ; $622C: $C3 $D9 $4C

jr_017_622F:
    ret                                           ; $622F: $C9

CreditsSunAbove4Handler::
    call ResetCreditsSceneVariables                            ; $6230: $CD $A5 $4D
    xor  a                                        ; $6233: $AF
    ld   [wCreditsSubscene], a                               ; $6234: $EA $0E $D0
    ld   [$C28D], a                               ; $6237: $EA $8D $C2
    ld   [$C28E], a                               ; $623A: $EA $8E $C2
    ld   [$C28F], a                               ; $623D: $EA $8F $C2
    ld   a, $17                                   ; $6240: $3E $17
    call ClearFileMenuBG_trampoline               ; $6242: $CD $FA $08
    ld   hl, wGameplaySubtype                                ; $6245: $21 $96 $DB
    inc  [hl]                                     ; $6248: $34
    ret                                           ; $6249: $C9

CreditsLinkOnSeaCloseHandler::
    call func_017_4839                            ; $624A: $CD $39 $48
    ld   de, $98E0                                ; $624D: $11 $E0 $98
    call func_017_488C                            ; $6250: $CD $8C $48
    call AnimateEntitiesAndRestoreBank17                                    ; $6253: $CD $ED $0E
    ld   a, [$D00F]                               ; $6256: $FA $0F $D0
    inc  a                                        ; $6259: $3C
    ld   [$D00F], a                               ; $625A: $EA $0F $D0
    cp   $05                                      ; $625D: $FE $05
    jr   c, jr_017_6271                           ; $625F: $38 $10

    xor  a                                        ; $6261: $AF
    ld   [$D00F], a                               ; $6262: $EA $0F $D0
    ld   a, [$D00A]                               ; $6265: $FA $0A $D0
    inc  a                                        ; $6268: $3C
    cp   $2B                                      ; $6269: $FE $2B
    jr   nz, jr_017_626E                          ; $626B: $20 $01

    xor  a                                        ; $626D: $AF

jr_017_626E:
    ld   [$D00A], a                               ; $626E: $EA $0A $D0

jr_017_6271:
    ld   a, [$D00A]                               ; $6271: $FA $0A $D0
    ld   e, a                                     ; $6274: $5F
    ld   d, $00                                   ; $6275: $16 $00
    ld   hl, Data_017_634C                        ; $6277: $21 $4C $63
    add  hl, de                                   ; $627A: $19
    ld   a, [hl]                                  ; $627B: $7E
    add  $00                                      ; $627C: $C6 $00
    ld   [$D000], a                               ; $627E: $EA $00 $D0
    call func_017_7971                            ; $6281: $CD $71 $79
    ld   a, [wCreditsSubscene]                               ; $6284: $FA $0E $D0
    rst  $00                                      ; $6287: $C7
    sub  d                                        ; $6288: $92
    ld   h, d                                     ; $6289: $62
    sbc  [hl]                                     ; $628A: $9E
    ld   h, d                                     ; $628B: $62
    cp   h                                        ; $628C: $BC
    ld   h, e                                     ; $628D: $63
    db   $76                                      ; $628E: $76
    ld   h, h                                     ; $628F: $64
    ret  c                                        ; $6290: $D8

    ld   h, h                                     ; $6291: $64
    ld   a, $18                                   ; $6292: $3E $18
    ld   [wTileMapToLoad], a                               ; $6294: $EA $FE $D6
    xor  a                                        ; $6297: $AF
    ld   [$DDD5], a                               ; $6298: $EA $D5 $DD
    jp   IncrementCreditsSubsceneAndReturn                           ; $629B: $C3 $D9 $4C

    ld   a, $19                                   ; $629E: $3E $19
    ld   [wBGMapToLoad], a                               ; $62A0: $EA $FF $D6
    ld   hl, $FFFF                                ; $62A3: $21 $FF $FF
    set  1, [hl]                                  ; $62A6: $CB $CE
    ld   a, $42                                   ; $62A8: $3E $42
    ldh  [rLYC], a                                ; $62AA: $E0 $45

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $62AC: $3E $E8
    call SpawnNewEntity_trampoline                ; $62AE: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $62B1: $21 $00 $C2
    add  hl, de                                   ; $62B4: $19
    ld   [hl], $18                                ; $62B5: $36 $18
    ld   hl, wEntitiesPosYTable                                ; $62B7: $21 $10 $C2
    add  hl, de                                   ; $62BA: $19
    ld   [hl], $55                                ; $62BB: $36 $55
    ld   hl, $C2B0                                ; $62BD: $21 $B0 $C2
    add  hl, de                                   ; $62C0: $19
    ld   [hl], $08                                ; $62C1: $36 $08
    ld   hl, $C3B0                                ; $62C3: $21 $B0 $C3
    add  hl, de                                   ; $62C6: $19
    ld   [hl], $02                                ; $62C7: $36 $02

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $62C9: $3E $E8
    call SpawnNewEntity_trampoline                ; $62CB: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $62CE: $21 $00 $C2
    add  hl, de                                   ; $62D1: $19
    ld   [hl], $68                                ; $62D2: $36 $68
    ld   hl, wEntitiesPosYTable                                ; $62D4: $21 $10 $C2
    add  hl, de                                   ; $62D7: $19
    ld   [hl], $58                                ; $62D8: $36 $58
    ld   hl, $C2B0                                ; $62DA: $21 $B0 $C2
    add  hl, de                                   ; $62DD: $19
    ld   [hl], $08                                ; $62DE: $36 $08
    ld   hl, $C3B0                                ; $62E0: $21 $B0 $C3
    add  hl, de                                   ; $62E3: $19
    inc  [hl]                                     ; $62E4: $34

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $62E5: $3E $E8
    call SpawnNewEntity_trampoline                ; $62E7: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $62EA: $21 $00 $C2
    add  hl, de                                   ; $62ED: $19
    ld   [hl], $88                                ; $62EE: $36 $88
    ld   hl, wEntitiesPosYTable                                ; $62F0: $21 $10 $C2
    add  hl, de                                   ; $62F3: $19
    ld   [hl], $60                                ; $62F4: $36 $60
    ld   hl, $C2B0                                ; $62F6: $21 $B0 $C2
    add  hl, de                                   ; $62F9: $19
    ld   [hl], $08                                ; $62FA: $36 $08

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $62FC: $3E $E8
    call SpawnNewEntity_trampoline                ; $62FE: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6301: $21 $00 $C2
    add  hl, de                                   ; $6304: $19
    ld   [hl], $08                                ; $6305: $36 $08
    ld   hl, wEntitiesPosYTable                                ; $6307: $21 $10 $C2
    add  hl, de                                   ; $630A: $19
    ld   [hl], $50                                ; $630B: $36 $50
    ld   hl, $C2B0                                ; $630D: $21 $B0 $C2
    add  hl, de                                   ; $6310: $19
    ld   [hl], $09                                ; $6311: $36 $09
    ld   hl, wEntitiesSpeedXTable                                ; $6313: $21 $40 $C2
    add  hl, de                                   ; $6316: $19
    ld   [hl], $08                                ; $6317: $36 $08
    ld   hl, wEntitiesSpeedYTable                                ; $6319: $21 $50 $C2
    add  hl, de                                   ; $631C: $19
    ld   [hl], $F8                                ; $631D: $36 $F8
    call ResetCreditsSceneVariables                            ; $631F: $CD $A5 $4D
    ld   a, $50                                   ; $6322: $3E $50
    ld   [$D009], a                               ; $6324: $EA $09 $D0
    ldh  a, [hIsGBC]                               ; $6327: $F0 $FE
    and  a                                        ; $6329: $A7
    jp   z, IncrementCreditsSubsceneAndReturn                        ; $632A: $CA $D9 $4C

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $632D: $3E $E8
    call SpawnNewEntity_trampoline                ; $632F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6332: $21 $00 $C2
    add  hl, de                                   ; $6335: $19
    ld   [hl], $40                                ; $6336: $36 $40
    ld   hl, wEntitiesPosYTable                                ; $6338: $21 $10 $C2
    add  hl, de                                   ; $633B: $19
    ld   [hl], $70                                ; $633C: $36 $70
    ld   hl, $C2B0                                ; $633E: $21 $B0 $C2
    add  hl, de                                   ; $6341: $19
    ld   [hl], $11                                ; $6342: $36 $11
    ld   hl, $D6FD                                ; $6344: $21 $FD $D6
    res  2, [hl]                                  ; $6347: $CB $96
    jp   IncrementCreditsSubsceneAndReturn                           ; $6349: $C3 $D9 $4C

Data_017_634C::
    db   $00, $00, $00, $00, $01, $01, $01, $02  ; $634C |........|
    db   $02, $03, $03, $04, $05, $06, $07, $08  ; $6354 |........|
    db   $09, $0A, $0A, $0B, $0B, $0C, $0C, $0C  ; $635C |........|
    db   $0B, $0B, $0A, $0A, $09, $08, $07, $06  ; $6364 |........|
    db   $05, $04, $03, $03, $02, $02, $01, $01  ; $636C |........|
    db   $01, $00, $00, $00, $00, $00, $00, $00  ; $6374 |........|
    db   $0D, $4C, $4D, $4E, $4F, $4C, $4D, $4E  ; $637C |.LMNOLMN|
    db   $4F, $4C, $4D, $4E, $4F, $4C, $4D, $00  ; $6384 |OLMNOLM.|
    db   $0D, $5C, $5D, $5E, $5F, $5C, $5D, $5E  ; $638C |.\]^_\]^|
    db   $5F, $5C, $5D, $5E, $5F, $5C, $5D, $00  ; $6394 |_\]^_\].|
    db   $0D, $6C, $6D, $6E, $6F, $6C, $6D, $6E  ; $639C |.lmnolmn|
    db   $6F, $6C, $6D, $6E, $6F, $6C, $6D, $00  ; $63A4 |olmnolm.|
    db   $0D, $7C, $7D, $7E, $7F, $7C, $7D, $7E  ; $63AC |.|}~.|}~|
    db   $7F, $7C, $7D, $7E, $7F, $7C, $7D, $00  ; $63B4 |.|}~.|}.|

    ldh  a, [hFrameCounter]                               ; $63BC: $F0 $E7
    and  $07                                      ; $63BE: $E6 $07
    jr   nz, jr_017_63EE                          ; $63C0: $20 $2C

    ld   hl, $D601                                ; $63C2: $21 $01 $D6
    ld   a, $9A                                   ; $63C5: $3E $9A
    ld   [hl+], a                                 ; $63C7: $22
    ld   a, $23                                   ; $63C8: $3E $23
    ld   [hl+], a                                 ; $63CA: $22
    ld   a, [$D00B]                               ; $63CB: $FA $0B $D0
    inc  a                                        ; $63CE: $3C
    and  $03                                      ; $63CF: $E6 $03
    ld   [$D00B], a                               ; $63D1: $EA $0B $D0
    rla                                           ; $63D4: $17
    rla                                           ; $63D5: $17
    rla                                           ; $63D6: $17
    rla                                           ; $63D7: $17
    and  $F0                                      ; $63D8: $E6 $F0
    ld   e, a                                     ; $63DA: $5F
    ld   d, $00                                   ; $63DB: $16 $00
    ld   hl, $637C                                ; $63DD: $21 $7C $63
    add  hl, de                                   ; $63E0: $19
    ld   de, $D603                                ; $63E1: $11 $03 $D6
    ld   c, $10                                   ; $63E4: $0E $10

jr_017_63E6:
    ld   a, [hl+]                                 ; $63E6: $2A
    ld   [de], a                                  ; $63E7: $12
    inc  de                                       ; $63E8: $13
    dec  c                                        ; $63E9: $0D
    jr   nz, jr_017_63E6                          ; $63EA: $20 $FA

    jr   jr_017_63F1                              ; $63EC: $18 $03

jr_017_63EE:
    call func_017_67CA                            ; $63EE: $CD $CA $67

jr_017_63F1:
    ld   a, [$D001]                               ; $63F1: $FA $01 $D0
    JP_TABLE                                      ; $63F4: $C7
._00 dw Func_017_63FB                             ; $63F5
._01 dw Func_017_641E                             ; $63F7
._02 dw Func_017_6447                             ; $63F9

Func_017_63FB::
    ld   a, [$D009]                               ; $63FB: $FA $09 $D0
    and  a                                        ; $63FE: $A7
    jr   nz, jr_017_6405                          ; $63FF: $20 $04

label_017_6401:
    ld   hl, $D001                                ; $6401: $21 $01 $D0
    inc  [hl]                                     ; $6404: $34

jr_017_6405:
    ret                                           ; $6405: $C9

Data_017_6406::
    db   $01, $00, $01, $02, $01, $02, $03, $04  ; $6406
    db   $05, $06, $07, $08, $20, $18, $20, $18  ; $640E
    db   $18, $18, $20, $40, $0C, $0C, $0C, $40  ; $6416

Func_017_641E::
    ld   a, [$D006]                               ; $641E: $FA $06 $D0
    and  a                                        ; $6421: $A7
    jr   nz, jr_017_6446                          ; $6422: $20 $22

    ld   a, [$D00D]                               ; $6424: $FA $0D $D0
    ld   e, a                                     ; $6427: $5F
    ld   d, $00                                   ; $6428: $16 $00
    ld   hl, Data_017_6406                        ; $642A: $21 $06 $64
    add  hl, de                                   ; $642D: $19

jr_017_642E:
    ld   a, [hl]                                  ; $642E: $7E
    ld   [$D002], a                               ; $642F: $EA $02 $D0
    ld   hl, $6412                                ; $6432: $21 $12 $64
    add  hl, de                                   ; $6435: $19
    ld   a, [hl]                                  ; $6436: $7E
    ld   [$D006], a                               ; $6437: $EA $06 $D0
    ld   a, e                                     ; $643A: $7B
    inc  a                                        ; $643B: $3C
    ld   [$D00D], a                               ; $643C: $EA $0D $D0
    cp   $0C                                      ; $643F: $FE $0C
    jr   nz, jr_017_6446                          ; $6441: $20 $03

    jp   label_017_6401                           ; $6443: $C3 $01 $64

jr_017_6446:
    ret                                           ; $6446: $C9

Func_017_6447::
    ld   a, [$D006]                               ; $6447: $FA $06 $D0
    and  a                                        ; $644A: $A7
    jr   nz, jr_017_6455                          ; $644B: $20 $08

    xor  a                                        ; $644D: $AF
    ld   [$D005], a                               ; $644E: $EA $05 $D0
    call IncrementCreditsSubscene                            ; $6451: $CD $D9 $4C
    ret                                           ; $6454: $C9

jr_017_6455:
    ret                                           ; $6455: $C9

; Palettes indices
Data_017_6456::
    db   $1E, $1E, $1E, $1E, $1A, $1A, $19, $19  ; $6456
    db   $05, $05, $05, $05, $00, $00, $00, $00  ; $645E

; Palettes indices
Data_017_6466::
    db   $92, $92, $92, $92, $92, $92, $51, $51  ; $6466
    db   $41, $41, $00, $00, $00, $00, $00, $00  ; $646E

    ld   a, [$D01F]                               ; $6476: $FA $1F $D0
    and  a                                        ; $6479: $A7
    jp   nz, label_017_7F30                       ; $647A: $C2 $30 $7F

    ldh  a, [hFrameCounter]                               ; $647D: $F0 $E7
    and  $07                                      ; $647F: $E6 $07
    jr   nz, jr_017_64B3                          ; $6481: $20 $30

    ld   a, [$D005]                               ; $6483: $FA $05 $D0
    cp   $0C                                      ; $6486: $FE $0C
    jr   nz, jr_017_649C                          ; $6488: $20 $12

    ld   a, $C0                                   ; $648A: $3E $C0
    ld   [$D006], a                               ; $648C: $EA $06 $D0
    xor  a                                        ; $648F: $AF
    ld   [wBGPalette], a                               ; $6490: $EA $97 $DB
    ld   [wOBJ0Palette], a                               ; $6493: $EA $98 $DB
    ld   [wOBJ1Palette], a                               ; $6496: $EA $99 $DB
    jp   IncrementCreditsSubsceneAndReturn                           ; $6499: $C3 $D9 $4C

jr_017_649C:
    inc  a                                        ; $649C: $3C
    ld   [$D005], a                               ; $649D: $EA $05 $D0
    ldh  a, [hIsGBC]                               ; $64A0: $F0 $FE
    and  a                                        ; $64A2: $A7
    jr   z, jr_017_64B3                           ; $64A3: $28 $0E

    ld   a, [$D005]                               ; $64A5: $FA $05 $D0
    dec  a                                        ; $64A8: $3D
    and  $01                                      ; $64A9: $E6 $01
    ret  nz                                       ; $64AB: $C0

    ld   hl, $D01F                                ; $64AC: $21 $1F $D0
    inc  [hl]                                     ; $64AF: $34
    jp   label_017_7F30                           ; $64B0: $C3 $30 $7F

jr_017_64B3:
    ldh  a, [hFrameCounter]                               ; $64B3: $F0 $E7
    and  $03                                      ; $64B5: $E6 $03
    ld   e, a                                     ; $64B7: $5F
    ld   a, [$D005]                               ; $64B8: $FA $05 $D0
    add  e                                        ; $64BB: $83
    ld   e, a                                     ; $64BC: $5F
    ld   d, $00                                   ; $64BD: $16 $00
    ld   hl, Data_017_6456                        ; $64BF: $21 $56 $64
    add  hl, de                                   ; $64C2: $19
    ld   a, [hl]                                  ; $64C3: $7E
    ld   [wBGPalette], a                          ; $64C4: $EA $97 $DB
    ld   hl, Data_017_6456                        ; $64C7: $21 $56 $64
    add  hl, de                                   ; $64CA: $19
    ld   a, [hl]                                  ; $64CB: $7E
    ld   [wOBJ0Palette], a                        ; $64CC: $EA $98 $DB
    ld   hl, Data_017_6466                        ; $64CF: $21 $66 $64
    add  hl, de                                   ; $64D2: $19
    ld   a, [hl]                                  ; $64D3: $7E
    ld   [wOBJ1Palette], a                        ; $64D4: $EA $99 $DB
    ret                                           ; $64D7: $C9

    ld   a, [$D006]                               ; $64D8: $FA $06 $D0
    and  a                                        ; $64DB: $A7
    jr   nz, jr_017_651D                          ; $64DC: $20 $3F

func_017_64DE:
label_017_64DE:
    xor  a                                        ; $64DE: $AF
    ld   [wCreditsSubscene], a                               ; $64DF: $EA $0E $D0
    ld   [$C287], a                               ; $64E2: $EA $87 $C2
    ld   [$C288], a                               ; $64E5: $EA $88 $C2
    ld   [$C289], a                               ; $64E8: $EA $89 $C2
    ld   [$C28A], a                               ; $64EB: $EA $8A $C2
    ld   [$C28B], a                               ; $64EE: $EA $8B $C2
    ld   [$C28C], a                               ; $64F1: $EA $8C $C2
    ld   [$C28D], a                               ; $64F4: $EA $8D $C2
    ld   [$C28E], a                               ; $64F7: $EA $8E $C2
    ld   [$C28F], a                               ; $64FA: $EA $8F $C2
    ldh  [hBaseScrollY], a                               ; $64FD: $E0 $97
    ld   [$D00F], a                               ; $64FF: $EA $0F $D0
    ld   [$D00F], a                               ; $6502: $EA $0F $D0
    call ResetCreditsSceneVariables                            ; $6505: $CD $A5 $4D
    ld   hl, $FFFF                                ; $6508: $21 $FF $FF
    res  1, [hl]                                  ; $650B: $CB $8E
    ld   hl, $D6FD                                ; $650D: $21 $FD $D6
    set  2, [hl]                                  ; $6510: $CB $D6
    ld   hl, wGameplaySubtype                                ; $6512: $21 $96 $DB
    inc  [hl]                                     ; $6515: $34
    ld   a, [hl]                                  ; $6516: $7E
    cp   $0A                                      ; $6517: $FE $0A
    jr   nz, jr_017_651D                          ; $6519: $20 $02

    ld   [hl], $00                                ; $651B: $36 $00

jr_017_651D:
    ret                                           ; $651D: $C9

Data_017_651E::
    db   $99, $46, $05, $AC, $AC, $AC, $AC, $AC  ; $651E |.F......|
    db   $AC, $99, $66, $05, $AC, $AC, $86, $87  ; $6526 |..f.....|
    db   $88, $89, $99, $86, $05, $94, $95, $96  ; $652E |........|
    db   $97, $98, $99, $99, $A6, $05, $A4, $A5  ; $6536 |........|
    db   $A6, $A7, $A8, $A9, $99, $C6, $05, $B4  ; $653E |........|
    db   $B5, $B6, $B7, $B8, $B9, $99, $E6, $05  ; $6546 |........|
    db   $C4, $C5, $C6, $C7, $C8, $C9, $99, $46  ; $654E |.......F|
    db   $05, $AC, $AC, $AC, $AC, $AC, $AC, $99  ; $6556 |........|
    db   $66, $05, $AC, $AC, $86, $87, $88, $89  ; $655E |f.......|
    db   $99, $86, $05, $94, $95, $96, $97, $98  ; $6566 |........|
    db   $99, $99, $A6, $05, $A4, $A5, $A6, $A7  ; $656E |........|
    db   $A8, $A9, $99, $C6, $05, $B4, $B5, $8A  ; $6576 |........|
    db   $8B, $B8, $B9, $99, $E6, $05, $C4, $C5  ; $657E |........|
    db   $9A, $9B, $C8, $C9, $99, $46, $05, $AC  ; $6586 |.....F..|
    db   $AC, $AC, $AC, $AC, $AC, $99, $66, $05  ; $658E |......f.|
    db   $AC, $AC, $86, $87, $88, $89, $99, $86  ; $6596 |........|
    db   $05, $94, $95, $96, $97, $98, $99, $99  ; $659E |........|
    db   $A6, $05, $A4, $A5, $A6, $A7, $A8, $A9  ; $65A6 |........|
    db   $99, $C6, $05, $B4, $B5, $8C, $8D, $B8  ; $65AE |........|
    db   $B9, $99, $E6, $05, $C4, $C5, $9C, $C7  ; $65B6 |........|
    db   $C8, $C9, $99, $46, $05, $AC, $AC, $AC  ; $65BE |...F....|
    db   $AC, $AC, $AC, $99, $66, $05, $AC, $AC  ; $65C6 |....f...|
    db   $86, $87, $88, $89, $99, $86, $05, $94  ; $65CE |........|
    db   $95, $96, $97, $98, $99, $99, $A6, $05  ; $65D6 |........|
    db   $A4, $A5, $A6, $A7, $A8, $A9, $99, $C6  ; $65DE |........|
    db   $05, $B4, $B5, $8E, $8F, $B8, $B9, $99  ; $65E6 |........|
    db   $E6, $05, $C4, $C5, $9E, $C7, $C8, $C9  ; $65EE |........|
    db   $99, $46, $05, $AC, $AC, $AC, $AC, $AC  ; $65F6 |.F......|
    db   $AC, $99, $66, $05, $AC, $AC, $86, $87  ; $65FE |..f.....|
    db   $88, $89, $99, $86, $05, $94, $95, $96  ; $6606 |........|
    db   $97, $98, $99, $99, $A6, $05, $A4, $A5  ; $660E |........|
    db   $A6, $A7, $A8, $A9, $99, $C6, $05, $B4  ; $6616 |........|
    db   $B5, $E9, $EA, $B8, $B9, $99, $E6, $05  ; $661E |........|
    db   $C4, $C5, $F9, $C7, $C8, $C9, $99, $46  ; $6626 |.......F|
    db   $05, $AC, $AC, $AC, $AC, $AC, $AC, $99  ; $662E |........|
    db   $66, $05, $AC, $AC, $86, $87, $88, $89  ; $6636 |f.......|
    db   $99, $86, $05, $94, $95, $96, $97, $98  ; $663E |........|
    db   $99, $99, $A6, $05, $A4, $A5, $A6, $A7  ; $6646 |........|
    db   $A8, $A9, $99, $C6, $05, $B4, $B5, $EB  ; $664E |........|
    db   $EC, $B8, $B9, $99, $E6, $05, $C4, $C5  ; $6656 |........|
    db   $FB, $C7, $C8, $C9, $99, $46, $05, $AC  ; $665E |.....F..|
    db   $AC, $AC, $AC, $AC, $AC, $99, $66, $05  ; $6666 |......f.|
    db   $AC, $AC, $86, $87, $88, $89, $99, $86  ; $666E |........|
    db   $05, $94, $95, $96, $97, $98, $99, $99  ; $6676 |........|
    db   $A6, $05, $A4, $A5, $A6, $A7, $A8, $A9  ; $667E |........|
    db   $99, $C6, $05, $B4, $B5, $ED, $EE, $B8  ; $6686 |........|
    db   $B9, $99, $E6, $05, $C4, $C5, $FB, $C7  ; $668E |........|
    db   $C8, $C9, $99, $46, $05, $AC, $AC, $AC  ; $6696 |...F....|
    db   $AC, $AC, $AC, $99, $66, $05, $00, $01  ; $669E |....f...|
    db   $02, $03, $04, $AC, $99, $86, $05, $10  ; $66A6 |........|
    db   $11, $12, $13, $14, $15, $99, $A6, $05  ; $66AE |........|
    db   $20, $21, $22, $23, $24, $25, $99, $C6  ; $66B6 | !"#$%..|
    db   $05, $30, $31, $32, $33, $34, $35, $99  ; $66BE |.012345.|
    db   $E6, $05, $40, $41, $42, $43, $44, $C9  ; $66C6 |..@ABCD.|
    db   $99, $46, $05, $0C, $0D, $1C, $1D, $AC  ; $66CE |.F......|
    db   $AC, $99, $66, $05, $06, $07, $08, $09  ; $66D6 |..f.....|
    db   $0A, $AC, $99, $86, $05, $16, $17, $18  ; $66DE |........|
    db   $19, $1A, $1B, $99, $A6, $05, $26, $27  ; $66E6 |......&'|
    db   $28, $29, $2A, $2B, $99, $C6, $05, $36  ; $66EE |()*+...6|
    db   $37, $38, $39, $3A, $3B, $99, $E6, $05  ; $66F6 |789:;...|
    db   $46, $47, $48, $49, $4A, $C9, $1E, $65  ; $66FE |FGHIJ..e|
    db   $54, $65, $8A, $65, $C0, $65, $F6, $65  ; $6706 |Te.e.e.e|
    db   $2C, $66, $62, $66, $98, $66, $CE, $66  ; $670E |,fbf.f.f|
    db   $99, $46, $05, $04, $04, $04, $04, $04  ; $6716 |.F......|
    db   $04, $99, $66, $05, $04, $04, $03, $03  ; $671E |..f.....|
    db   $03, $03, $99, $86, $05, $01, $01, $01  ; $6726 |........|
    db   $05, $05, $03, $99, $A6, $05, $01, $01  ; $672E |........|
    db   $05, $05, $05, $02, $99, $C6, $05, $01  ; $6736 |........|
    db   $01, $05, $05, $01, $02, $99, $E6, $05  ; $673E |........|
    db   $02, $02, $05, $05, $02, $02, $99, $46  ; $6746 |.......F|
    db   $05, $04, $04, $04, $04, $04, $04, $99  ; $674E |........|
    db   $66, $05, $01, $07, $03, $03, $03, $03  ; $6756 |f.......|
    db   $99, $86, $05, $01, $01, $01, $01, $05  ; $675E |........|
    db   $03, $99, $A6, $05, $01, $01, $05, $05  ; $6766 |........|
    db   $05, $02, $99, $C6, $05, $07, $07, $05  ; $676E |........|
    db   $05, $05, $02, $99, $E6, $05, $02, $02  ; $6776 |........|
    db   $02, $02, $02, $02, $99, $46, $05, $07  ; $677E |.....F..|
    db   $01, $07, $07, $04, $04, $99, $66, $05  ; $6786 |......f.|
    db   $01, $01, $01, $01, $07, $04, $99, $86  ; $678E |........|
    db   $05, $01, $05, $05, $01, $07, $03, $99  ; $6796 |........|
    db   $A6, $05, $01, $05, $05, $05, $07, $02  ; $679E |........|
    db   $99, $C6, $05, $07, $05, $05, $05, $05  ; $67A6 |........|
    db   $02, $99, $E6, $05, $02, $02, $02, $02  ; $67AE |........|
    db   $02, $02, $16, $67, $16, $67, $16, $67  ; $67B6 |...g.g.g|
    db   $16, $67, $16, $67, $16, $67, $16, $67  ; $67BE |.g.g.g.g|
    db   $4C, $67, $82, $67                      ; $67C6 |Lg.g|

func_017_67CA:
    ldh  a, [hFrameCounter]                               ; $67CA: $F0 $E7
    and  $01                                      ; $67CC: $E6 $01
    cp   $01                                      ; $67CE: $FE $01
    jr   nz, jr_017_6808                          ; $67D0: $20 $36

    ld   a, [$D002]                               ; $67D2: $FA $02 $D0
    sla  a                                        ; $67D5: $CB $27
    ld   e, a                                     ; $67D7: $5F
    ld   d, $00                                   ; $67D8: $16 $00
    push de                                       ; $67DA: $D5
    ld   hl, $6704                                ; $67DB: $21 $04 $67
    add  hl, de                                   ; $67DE: $19
    ld   a, [hl+]                                 ; $67DF: $2A
    ld   h, [hl]                                  ; $67E0: $66
    ld   l, a                                     ; $67E1: $6F
    ld   de, $D601                                ; $67E2: $11 $01 $D6
    ld   c, $36                                   ; $67E5: $0E $36

jr_017_67E7:
    ld   a, [hl+]                                 ; $67E7: $2A
    ld   [de], a                                  ; $67E8: $12
    inc  de                                       ; $67E9: $13
    dec  c                                        ; $67EA: $0D
    jr   nz, jr_017_67E7                          ; $67EB: $20 $FA

    xor  a                                        ; $67ED: $AF
    ld   [de], a                                  ; $67EE: $12
    pop  de                                       ; $67EF: $D1
    ldh  a, [hIsGBC]                               ; $67F0: $F0 $FE
    and  a                                        ; $67F2: $A7
    ret  z                                        ; $67F3: $C8

    ld   hl, $67B8                                ; $67F4: $21 $B8 $67
    add  hl, de                                   ; $67F7: $19
    ld   a, [hl+]                                 ; $67F8: $2A
    ld   h, [hl]                                  ; $67F9: $66
    ld   l, a                                     ; $67FA: $6F
    ld   de, $DC91                                ; $67FB: $11 $91 $DC
    ld   c, $36                                   ; $67FE: $0E $36

jr_017_6800:
    ld   a, [hl+]                                 ; $6800: $2A
    ld   [de], a                                  ; $6801: $12
    inc  de                                       ; $6802: $13
    dec  c                                        ; $6803: $0D
    jr   nz, jr_017_6800                          ; $6804: $20 $FA

    xor  a                                        ; $6806: $AF
    ld   [de], a                                  ; $6807: $12

jr_017_6808:
    ret                                           ; $6808: $C9

CreditsLinkSeatedOnLogHandler::
    call AnimateEntitiesAndRestoreBank17                                    ; $6809: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $680C: $FA $0E $D0
    rst  $00                                      ; $680F: $C7
._00 dw LinkSeatedOnLog0Handler                   ; $6810
._01 dw LinkSeatedOnLog1Handler                   ; $6812
._02 dw LinkSeatedOnLog2Handler                   ; $6814
._03 dw LinkSeatedOnLog3Handler                   ; $6816
._04 dw LinkSeatedOnLog4Handler                   ; $6818
._05 dw LinkSeatedOnLog5Handler                   ; $681A
._06 dw LinkSeatedOnLog6Handler                   ; $681C
._07 dw LinkSeatedOnLog7Handler                   ; $681E
._08 dw LinkSeatedOnLog8Handler                   ; $6820

LinkSeatedOnLog0Handler::
    ld   a, $19                                   ; $6822: $3E $19
    ld   [wTileMapToLoad], a                               ; $6824: $EA $FE $D6
    ld   a, $01                                   ; $6827: $3E $01
    ld   [$DDD5], a                               ; $6829: $EA $D5 $DD
    jp   IncrementCreditsSubsceneAndReturn                           ; $682C: $C3 $D9 $4C

LinkSeatedOnLog1Handler::
    ld   a, $1A                                   ; $682F: $3E $1A
    ld   [wBGMapToLoad], a                        ; $6831: $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $6834: $3E $E8
    call SpawnNewEntity_trampoline                ; $6836: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6839: $21 $00 $C2
    add  hl, de                                   ; $683C: $19
    ld   [hl], $40                                ; $683D: $36 $40
    ld   hl, wEntitiesPosYTable                                ; $683F: $21 $10 $C2
    add  hl, de                                   ; $6842: $19
    ld   [hl], $4E                                ; $6843: $36 $4E
    ld   hl, $C2B0                                ; $6845: $21 $B0 $C2
    add  hl, de                                   ; $6848: $19
    ld   [hl], $0A                                ; $6849: $36 $0A
    jp   IncrementCreditsSubsceneAndReturn                           ; $684B: $C3 $D9 $4C

LinkSeatedOnLog2Handler
    ld   de, $9960                                ; $684E: $11 $60 $99
    call func_017_488C                            ; $6851: $CD $8C $48
    ldh  a, [hFrameCounter]                               ; $6854: $F0 $E7
    and  $03                                      ; $6856: $E6 $03
    jr   nz, jr_017_687C                          ; $6858: $20 $22

    ld   a, [$D00A]                               ; $685A: $FA $0A $D0
    cp   $0C                                      ; $685D: $FE $0C
    jr   nz, jr_017_686C                          ; $685F: $20 $0B

    call ResetCreditsSceneVariables                            ; $6861: $CD $A5 $4D
    ld   a, $60                                   ; $6864: $3E $60
    ld   [$D009], a                               ; $6866: $EA $09 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6869: $C3 $D9 $4C

jr_017_686C:
    inc  a                                        ; $686C: $3C
    ld   [$D00A], a                               ; $686D: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $6870: $F0 $FE
    and  a                                        ; $6872: $A7
    jr   z, jr_017_687C                           ; $6873: $28 $07

    ld   a, [$D00A]                               ; $6875: $FA $0A $D0
    dec  a                                        ; $6878: $3D
    jp   label_017_7E80                           ; $6879: $C3 $80 $7E

jr_017_687C:
    ldh  a, [hFrameCounter]                               ; $687C: $F0 $E7
    and  $03                                      ; $687E: $E6 $03
    ld   e, a                                     ; $6880: $5F
    ld   a, [$D00A]                               ; $6881: $FA $0A $D0
    add  e                                        ; $6884: $83
    ld   e, a                                     ; $6885: $5F
    ld   d, $00                                   ; $6886: $16 $00
    ld   hl, Data_017_60CA                        ; $6888: $21 $CA $60
    add  hl, de                                   ; $688B: $19
    ld   a, [hl]                                  ; $688C: $7E
    ld   [wBGPalette], a                          ; $688D: $EA $97 $DB
    ld   [wOBJ0Palette], a                        ; $6890: $EA $98 $DB
    ld   hl, Data_017_60CA                        ; $6893: $21 $CA $60
    add  hl, de                                   ; $6896: $19
    ld   a, [hl]                                  ; $6897: $7E
    ld   [wOBJ0Palette], a                        ; $6898: $EA $98 $DB
    ld   hl, Data_017_60DA                        ; $689B: $21 $DA $60
    add  hl, de                                   ; $689E: $19
    ld   a, [hl]                                  ; $689F: $7E
    ld   [wOBJ1Palette], a                        ; $68A0: $EA $99 $DB
    ret                                           ; $68A3: $C9

LinkSeatedOnLog3Handler::
    ld   de, $9960                                ; $68A4: $11 $60 $99
    call func_017_488C                            ; $68A7: $CD $8C $48
    ld   a, [$D009]                               ; $68AA: $FA $09 $D0
    and  a                                        ; $68AD: $A7
    jr   nz, jr_017_68B6                          ; $68AE: $20 $06

    call ResetCreditsSceneVariables                            ; $68B0: $CD $A5 $4D
    jp   IncrementCreditsSubsceneAndReturn                           ; $68B3: $C3 $D9 $4C

jr_017_68B6:
    ret                                           ; $68B6: $C9

; Palettes indices
Data_017_68B7::
    db   $1E, $1E, $1E, $1E, $2E, $2E, $2E, $2E  ; $68B7
    db   $6E, $6E, $6E, $6E                      ; $68BF

LinkSeatedOnLog4Handler::
    ld   de, $9960                                ; $68C3: $11 $60 $99
    call func_017_488C                            ; $68C6: $CD $8C $48
    ldh  a, [hFrameCounter]                               ; $68C9: $F0 $E7
    and  $07                                      ; $68CB: $E6 $07
    jr   nz, jr_017_68EB                          ; $68CD: $20 $1C

    ld   a, [$D00A]                               ; $68CF: $FA $0A $D0
    cp   $08                                      ; $68D2: $FE $08
    jr   nz, jr_017_68E1                          ; $68D4: $20 $0B

    call ResetCreditsSceneVariables                            ; $68D6: $CD $A5 $4D
    ld   a, $20                                   ; $68D9: $3E $20
    ld   [$D006], a                               ; $68DB: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $68DE: $C3 $D9 $4C

jr_017_68E1:
    inc  a                                        ; $68E1: $3C
    ld   [$D00A], a                               ; $68E2: $EA $0A $D0
    ldh  a, [hIsGBC]                               ; $68E5: $F0 $FE
    and  a                                        ; $68E7: $A7
    jp   nz, label_017_6A80                       ; $68E8: $C2 $80 $6A

jr_017_68EB:
    ldh  a, [hFrameCounter]                               ; $68EB: $F0 $E7
    and  $03                                      ; $68ED: $E6 $03
    ld   e, a                                     ; $68EF: $5F
    ld   a, [$D00A]                               ; $68F0: $FA $0A $D0
    add  e                                        ; $68F3: $83
    ld   e, a                                     ; $68F4: $5F
    ld   d, $00                                   ; $68F5: $16 $00
    ld   hl, Data_017_68B7                        ; $68F7: $21 $B7 $68
    add  hl, de                                   ; $68FA: $19
    ld   a, [hl]                                  ; $68FB: $7E
    ld   [wOBJ0Palette], a                               ; $68FC: $EA $98 $DB
    ret                                           ; $68FF: $C9

Data_017_6900::
    db   $C5, $4C, $FF, $7F, $AB, $56, $E0, $41  ; $6900 |.L...V.A|
    db   $B3, $7E, $00, $00, $00, $31, $28, $32  ; $6908 |.~...1(2|
    db   $B3, $7E, $00, $00, $1F, $12, $FE, $27  ; $6910 |.~.....'|
    db   $B3, $7E, $00, $00, $BF, $21, $1F, $4B  ; $6918 |.~...!.K|
    db   $B3, $7E, $00, $00, $6B, $04, $15, $19  ; $6920 |.~..k...|
    db   $B3, $7E, $00, $00, $15, $19, $1F, $4B  ; $6928 |.~.....K|
    db   $C5, $4C, $FF, $7F, $8B, $52, $C0, $3D  ; $6930 |.L...R.=|
    db   $B3, $7E, $00, $00, $00, $2D, $08, $2E  ; $6938 |.~...-..|
    db   $B3, $7E, $00, $00, $FD, $11, $BC, $27  ; $6940 |.~.....'|
    db   $B3, $7E, $00, $00, $9D, $21, $DD, $46  ; $6948 |.~...!.F|
    db   $B3, $7E, $00, $00, $6A, $04, $13, $19  ; $6950 |.~..j...|
    db   $B3, $7E, $00, $00, $13, $19, $DD, $46  ; $6958 |.~.....F|
    db   $C5, $4C, $FF, $7F, $4A, $4A, $A0, $39  ; $6960 |.L..JJ.9|
    db   $B3, $7E, $00, $00, $E0, $28, $C7, $29  ; $6968 |.~...(.)|
    db   $B3, $7E, $00, $00, $DA, $11, $59, $23  ; $6970 |.~....Y#|
    db   $B3, $7E, $00, $00, $7A, $1D, $9A, $3E  ; $6978 |.~..z..>|
    db   $B3, $7E, $00, $00, $69, $04, $F1, $14  ; $6980 |.~..i...|
    db   $B3, $7E, $00, $00, $F1, $14, $9A, $3E  ; $6988 |.~.....>|
    db   $C5, $4C, $FF, $7F, $09, $42, $60, $31  ; $6990 |.L...B`1|
    db   $B3, $7E, $00, $00, $C0, $24, $A6, $25  ; $6998 |.~...$.%|
    db   $B3, $7E, $00, $00, $97, $11, $F6, $1E  ; $69A0 |.~......|
    db   $B3, $7E, $00, $00, $57, $19, $57, $36  ; $69A8 |.~..W.W6|
    db   $B3, $7E, $00, $00, $68, $04, $CF, $14  ; $69B0 |.~..h...|
    db   $B3, $7E, $00, $00, $CF, $14, $57, $36  ; $69B8 |.~....W6|
    db   $C5, $4C, $FF, $7F, $E8, $3D, $40, $2D  ; $69C0 |.L...=@-|
    db   $B3, $7E, $00, $00, $C0, $20, $66, $21  ; $69C8 |.~... f!|
    db   $B3, $7E, $00, $00, $74, $0D, $93, $1A  ; $69D0 |.~..t...|
    db   $B3, $7E, $00, $00, $34, $19, $F4, $31  ; $69D8 |.~..4..1|
    db   $B3, $7E, $00, $00, $47, $04, $CD, $10  ; $69E0 |.~..G...|
    db   $B3, $7E, $00, $00, $CD, $10, $F4, $31  ; $69E8 |.~.....1|
    db   $C5, $4C, $FF, $7F, $A7, $35, $00, $25  ; $69F0 |.L...5.%|
    db   $B3, $7E, $00, $00, $A0, $1C, $45, $1D  ; $69F8 |.~....E.|
    db   $B3, $7E, $00, $00, $31, $0D, $30, $16  ; $6A00 |.~..1.0.|
    db   $B3, $7E, $00, $00, $11, $15, $B1, $29  ; $6A08 |.~.....)|
    db   $B3, $7E, $00, $00, $46, $04, $AB, $10  ; $6A10 |.~..F...|
    db   $B3, $7E, $00, $00, $AB, $10, $B1, $29  ; $6A18 |.~.....)|
    db   $C5, $4C, $FF, $7F, $66, $2D, $E0, $20  ; $6A20 |.L..f-. |
    db   $B3, $7E, $00, $00, $80, $18, $04, $19  ; $6A28 |.~......|
    db   $B3, $7E, $00, $00, $0E, $0D, $CD, $11  ; $6A30 |.~......|
    db   $B3, $7E, $00, $00, $EE, $10, $6E, $21  ; $6A38 |.~....n!|
    db   $B3, $7E, $00, $00, $45, $04, $89, $0C  ; $6A40 |.~..E...|
    db   $B3, $7E, $00, $00, $89, $0C, $6E, $21  ; $6A48 |.~....n!|
    db   $C5, $4C, $FF, $7F, $25, $25, $A0, $18  ; $6A50 |.L..%%..|
    db   $B3, $7E, $00, $00, $60, $10, $C3, $10  ; $6A58 |.~..`...|
    db   $B3, $7E, $00, $00, $CB, $08, $6A, $0D  ; $6A60 |.~....j.|
    db   $B3, $7E, $00, $00, $AB, $0C, $0B, $19  ; $6A68 |.~......|
    db   $B3, $7E, $00, $00, $24, $04, $67, $08  ; $6A70 |.~..$.g.|
    db   $B3, $7E, $00, $00, $67, $08, $0B, $19  ; $6A78 |.~..g...|

label_017_6A80:
    ld   a, [$D00A]                               ; $6A80: $FA $0A $D0
    dec  a                                        ; $6A83: $3D
    swap a                                        ; $6A84: $CB $37
    ld   c, a                                     ; $6A86: $4F
    sla  a                                        ; $6A87: $CB $27
    add  c                                        ; $6A89: $81
    ld   c, a                                     ; $6A8A: $4F
    ld   a, $00                                   ; $6A8B: $3E $00
    adc  $00                                      ; $6A8D: $CE $00
    ld   b, a                                     ; $6A8F: $47
    ld   hl, Data_017_6900                        ; $6A90: $21 $00 $69
    add  hl, bc                                   ; $6A93: $09
    ld   bc, $0030                                ; $6A94: $01 $30 $00
    ld   de, $DC50                                ; $6A97: $11 $50 $DC
    call CopyData                                 ; $6A9A: $CD $14 $29
    xor  a                                        ; $6A9D: $AF
    ld   [$DDD3], a                               ; $6A9E: $EA $D3 $DD
    ld   a, $18                                   ; $6AA1: $3E $18
    ld   [$DDD4], a                               ; $6AA3: $EA $D4 $DD
    ld   a, $82                                   ; $6AA6: $3E $82
    ld   [$DDD1], a                               ; $6AA8: $EA $D1 $DD
    ret                                           ; $6AAB: $C9

LinkSeatedOnLog5Handler::
    ld   de, $9960                                ; $6AAC: $11 $60 $99
    call func_017_488C                            ; $6AAF: $CD $8C $48
    ld   a, [$D006]                               ; $6AB2: $FA $06 $D0
    and  a                                        ; $6AB5: $A7
    jr   nz, jr_017_6AD0                          ; $6AB6: $20 $18

    ld   a, $0A                                   ; $6AB8: $3E $0A
    ld   [$D006], a                               ; $6ABA: $EA $06 $D0
    ld   a, [$D000]                               ; $6ABD: $FA $00 $D0
    inc  a                                        ; $6AC0: $3C
    ld   [$D000], a                               ; $6AC1: $EA $00 $D0
    cp   $02                                      ; $6AC4: $FE $02
    jr   nz, jr_017_6AD0                          ; $6AC6: $20 $08

    ld   a, $20                                   ; $6AC8: $3E $20
    ld   [$D006], a                               ; $6ACA: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6ACD: $C3 $D9 $4C

jr_017_6AD0:
    ret                                           ; $6AD0: $C9

LinkSeatedOnLog6Handler::
    ld   de, $9960                                ; $6AD1: $11 $60 $99
    call func_017_488C                            ; $6AD4: $CD $8C $48
    ld   a, [$D006]                               ; $6AD7: $FA $06 $D0
    and  a                                        ; $6ADA: $A7
    jr   nz, jr_017_6AE0                          ; $6ADB: $20 $03

    jp   IncrementCreditsSubsceneAndReturn                           ; $6ADD: $C3 $D9 $4C

jr_017_6AE0:
    ret                                           ; $6AE0: $C9

Data_017_6AE1::
    db   $02, $04, $06, $08, $0A, $0C, $0E, $10  ; $6AE1 |........|
    db   $12, $14, $16, $18, $1A, $1C, $1E, $20  ; $6AE9 |....... |
    db   $22, $24, $26, $28, $28, $28, $28, $28  ; $6AF1 |"$&(((((|
    db   $28, $28, $28, $28, $28, $28, $28, $28  ; $6AF9 |((((((((|
    db   $28, $28, $28, $28, $28, $28, $28, $28  ; $6B01 |((((((((|
    db   $28, $28, $28, $28, $28, $28, $28, $28  ; $6B09 |((((((((|
    db   $28, $28, $28, $27, $26, $25, $24, $23  ; $6B11 |((('&%$#|
    db   $22, $21, $20, $1F, $1E, $1D, $1C, $1B  ; $6B19 |"! .....|
    db   $1A, $19, $18, $17, $16, $15, $14, $13  ; $6B21 |........|
    db   $12, $11, $10, $0F, $0E, $0D, $0C, $0B  ; $6B29 |........|
    db   $0A, $09, $08, $07, $06, $05, $04, $04  ; $6B31 |........|
    db   $04, $04, $04, $04, $00, $00, $00, $00  ; $6B39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $6B41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $6B49 |........|
    db   $00, $00, $00, $00, $00, $00, $01, $01  ; $6B51 |........|
    db   $01, $01, $01, $01, $01, $01, $01, $01  ; $6B59 |........|
    db   $02, $02, $02, $02, $02, $02, $02, $02  ; $6B61 |........|
    db   $02, $02, $03, $03, $03, $03, $03, $03  ; $6B69 |........|
    db   $03, $03, $03, $03, $04, $04, $04, $04  ; $6B71 |........|
    db   $04, $04, $04, $04, $04, $04, $04, $04  ; $6B79 |........|
    db   $04, $04, $04, $04, $04, $04, $04, $04  ; $6B81 |........|
    db   $04, $04, $04, $04, $04, $04, $04, $04  ; $6B89 |........|
    db   $04, $04, $04, $04, $04, $04, $04, $04  ; $6B91 |........|
    db   $04, $04, $04, $04, $04, $04, $04, $04  ; $6B99 |........|
    db   $1E, $1E, $1E, $1E, $1F, $1F, $1F, $1F  ; $6BA1 |........|
    db   $1A, $1A, $1A, $1A, $15, $15, $15, $15  ; $6BA9 |........|
    db   $10, $10, $10, $10, $10, $10, $10, $10  ; $6BB1 |........|
    db   $10, $10, $10, $10, $15, $15, $15, $15  ; $6BB9 |........|
    db   $19, $19, $1A, $1A, $1E, $1E, $1E, $1E  ; $6BC1 |........|

LinkSeatedOnLog7Handler::
    ld   a, [$D00D]                               ; $6BC9: $FA $0D $D0
    cp   $0E                                      ; $6BCC: $FE $0E
    jr   nc, jr_017_6BD6                          ; $6BCE: $30 $06

    ld   de, $9960                                ; $6BD0: $11 $60 $99
    call func_017_488C                            ; $6BD3: $CD $8C $48

jr_017_6BD6:
    ld   a, [$D00D]                               ; $6BD6: $FA $0D $D0
    ld   e, a                                     ; $6BD9: $5F
    ld   d, $00                                   ; $6BDA: $16 $00
    ld   hl, $6B41                                ; $6BDC: $21 $41 $6B
    add  hl, de                                   ; $6BDF: $19
    ld   a, [hl]                                  ; $6BE0: $7E
    ld   [$D00C], a                               ; $6BE1: $EA $0C $D0
    ldh  a, [hFrameCounter]                               ; $6BE4: $F0 $E7
    and  $03                                      ; $6BE6: $E6 $03
    ld   e, a                                     ; $6BE8: $5F
    ld   a, [$D00C]                               ; $6BE9: $FA $0C $D0
    add  e                                        ; $6BEC: $83
    ld   e, a                                     ; $6BED: $5F
    ld   d, $00                                   ; $6BEE: $16 $00
    ld   hl, $6BA1                                ; $6BF0: $21 $A1 $6B
    add  hl, de                                   ; $6BF3: $19
    ld   a, [hl]                                  ; $6BF4: $7E
    ld   [wBGPalette], a                               ; $6BF5: $EA $97 $DB
    ld   a, [$D00D]                               ; $6BF8: $FA $0D $D0
    ld   e, a                                     ; $6BFB: $5F
    ld   d, $00                                   ; $6BFC: $16 $00
    cp   $59                                      ; $6BFE: $FE $59
    jr   nz, jr_017_6C15                          ; $6C00: $20 $13

    ldh  a, [hBaseScrollY]                               ; $6C02: $F0 $97
    cp   $30                                      ; $6C04: $FE $30
    jr   nz, jr_017_6C15                          ; $6C06: $20 $0D

    ld   a, $FF                                   ; $6C08: $3E $FF
    ld   [$D008], a                               ; $6C0A: $EA $08 $D0
    ld   a, $A8                                   ; $6C0D: $3E $A8
    ld   [$D009], a                               ; $6C0F: $EA $09 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6C12: $C3 $D9 $4C

jr_017_6C15:
    ld   hl, Data_017_6AE1                        ; $6C15: $21 $E1 $6A
    add  hl, de                                   ; $6C18: $19
    ld   a, [hl]                                  ; $6C19: $7E
    cpl                                           ; $6C1A: $2F
    inc  a                                        ; $6C1B: $3C
    sla  a                                        ; $6C1C: $CB $27
    ld   [wEntitiesSpeedXTable], a                ; $6C1E: $EA $40 $C2
    ld   bc, $0000                                ; $6C21: $01 $00 $00
    ld   a, [wEntitiesPosXTable]                  ; $6C24: $FA $00 $C2
    push af                                       ; $6C27: $F5
    call func_017_7E3A                            ; $6C28: $CD $3A $7E
    ld   a, [wEntitiesPosXTable]                  ; $6C2B: $FA $00 $C2
    ldh  [hBaseScrollY], a                        ; $6C2E: $E0 $97
    and  $F8                                      ; $6C30: $E6 $F8
    ld   e, a                                     ; $6C32: $5F
    pop  af                                       ; $6C33: $F1
    and  $F8                                      ; $6C34: $E6 $F8
    cp   e                                        ; $6C36: $BB
    ret  z                                        ; $6C37: $C8

    ld   a, [$D00D]                               ; $6C38: $FA $0D $D0
    cp   $59                                      ; $6C3B: $FE $59
    ret  z                                        ; $6C3D: $C8

    inc  a                                        ; $6C3E: $3C
    ld   [$D00D], a                               ; $6C3F: $EA $0D $D0
    ldh  a, [hIsGBC]                               ; $6C42: $F0 $FE
    and  a                                        ; $6C44: $A7
    jr   z, jr_017_6C4A                           ; $6C45: $28 $03

    call func_017_6C85                            ; $6C47: $CD $85 $6C

jr_017_6C4A:
    ld   a, [$D00D]                               ; $6C4A: $FA $0D $D0
    cp   $44                                      ; $6C4D: $FE $44
    jr   nz, jr_017_6C73                          ; $6C4F: $20 $22

    ld   a, $E3                                   ; $6C51: $3E $E3
    ld   [wOBJ1Palette], a                               ; $6C53: $EA $99 $DB
    ld   a, $E8                                   ; $6C56: $3E $E8
    call SpawnNewEntity_trampoline                ; $6C58: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6C5B: $21 $00 $C2
    add  hl, de                                   ; $6C5E: $19
    ld   [hl], $50                                ; $6C5F: $36 $50
    ld   hl, wEntitiesPosYTable                                ; $6C61: $21 $10 $C2
    add  hl, de                                   ; $6C64: $19
    ld   [hl], $80                                ; $6C65: $36 $80
    ld   hl, $C2B0                                ; $6C67: $21 $B0 $C2
    add  hl, de                                   ; $6C6A: $19
    ld   [hl], $0B                                ; $6C6B: $36 $0B
    ld   hl, $C2E0                                ; $6C6D: $21 $E0 $C2
    add  hl, de                                   ; $6C70: $19
    ld   [hl], $A8                                ; $6C71: $36 $A8

jr_017_6C73:
    ld   hl, $DE01                                ; $6C73: $21 $01 $DE
    ld   a, $23                                   ; $6C76: $3E $23
    ld   [hl+], a                                 ; $6C78: $22
    ld   a, $7E                                   ; $6C79: $3E $7E
    ld   [hl+], a                                 ; $6C7B: $22
    ld   a, $95                                   ; $6C7C: $3E $95
    ld   [hl+], a                                 ; $6C7E: $22
    ld   a, $17                                   ; $6C7F: $3E $17
    ld   [hl], a                                  ; $6C81: $77
    jp   $0BD7                                    ; $6C82: $C3 $D7 $0B

func_017_6C85:
    ld   hl, $DE01                                ; $6C85: $21 $01 $DE
    ld   a, $20                                   ; $6C88: $3E $20
    ld   [hl+], a                                 ; $6C8A: $22
    ld   a, $7C                                   ; $6C8B: $3E $7C
    ld   [hl+], a                                 ; $6C8D: $22
    ld   a, $26                                   ; $6C8E: $3E $26
    ld   [hl+], a                                 ; $6C90: $22
    ld   a, $17                                   ; $6C91: $3E $17
    ld   [hl], a                                  ; $6C93: $77
    jp   $0BD7                                    ; $6C94: $C3 $D7 $0B

LinkSeatedOnLog8Handler::
    ld   a, [$D009]                               ; $6C97: $FA $09 $D0
    and  a                                        ; $6C9A: $A7
    jr   nz, jr_017_6CA9                          ; $6C9B: $20 $0C

    xor  a                                        ; $6C9D: $AF
    ld   [wBGPalette], a                               ; $6C9E: $EA $97 $DB
    ld   a, $17                                   ; $6CA1: $3E $17
    call ClearFileMenuBG_trampoline               ; $6CA3: $CD $FA $08
    jp   label_017_64DE                           ; $6CA6: $C3 $DE $64

jr_017_6CA9:
    ldh  a, [hFrameCounter]                               ; $6CA9: $F0 $E7
    and  $03                                      ; $6CAB: $E6 $03
    ld   e, a                                     ; $6CAD: $5F
    ld   a, [$D00C]                               ; $6CAE: $FA $0C $D0
    add  e                                        ; $6CB1: $83
    ld   e, a                                     ; $6CB2: $5F
    ld   d, $00                                   ; $6CB3: $16 $00
    ld   hl, $6BA1                                ; $6CB5: $21 $A1 $6B
    add  hl, de                                   ; $6CB8: $19
    ld   a, [hl]                                  ; $6CB9: $7E
    ld   [wBGPalette], a                               ; $6CBA: $EA $97 $DB
    ld   a, [$D008]                               ; $6CBD: $FA $08 $D0
    and  a                                        ; $6CC0: $A7
    jr   nz, jr_017_6D0A                          ; $6CC1: $20 $47

    ld   a, [$D00B]                               ; $6CC3: $FA $0B $D0
    inc  a                                        ; $6CC6: $3C
    ld   [$D00B], a                               ; $6CC7: $EA $0B $D0
    and  $07                                      ; $6CCA: $E6 $07
    jr   nz, jr_017_6D0A                          ; $6CCC: $20 $3C

    ld   a, [$D00C]                               ; $6CCE: $FA $0C $D0
    cp   $24                                      ; $6CD1: $FE $24
    jr   z, jr_017_6D0A                           ; $6CD3: $28 $35

    ldh  a, [hIsGBC]                               ; $6CD5: $F0 $FE
    and  a                                        ; $6CD7: $A7
    jr   z, jr_017_6CDD                           ; $6CD8: $28 $03

    call func_017_6D0B                            ; $6CDA: $CD $0B $6D

jr_017_6CDD:
    ld   a, [$D00C]                               ; $6CDD: $FA $0C $D0
    inc  a                                        ; $6CE0: $3C
    ld   [$D00C], a                               ; $6CE1: $EA $0C $D0
    cp   $05                                      ; $6CE4: $FE $05
    jr   nz, jr_017_6D0A                          ; $6CE6: $20 $22

    ld   a, $1E                                   ; $6CE8: $3E $1E
    ld   [wOBJ0Palette], a                        ; $6CEA: $EA $98 $DB
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $6CED: $3E $E8
    call SpawnNewEntity_trampoline                ; $6CEF: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6CF2: $21 $00 $C2
    add  hl, de                                   ; $6CF5: $19
    ld   [hl], $62                                ; $6CF6: $36 $62
    ld   hl, wEntitiesPosYTable                                ; $6CF8: $21 $10 $C2
    add  hl, de                                   ; $6CFB: $19
    ld   [hl], $5A                                ; $6CFC: $36 $5A
    ld   hl, $C2B0                                ; $6CFE: $21 $B0 $C2
    add  hl, de                                   ; $6D01: $19
    ld   [hl], $0C                                ; $6D02: $36 $0C
    ld   hl, $C2E0                                ; $6D04: $21 $E0 $C2
    add  hl, de                                   ; $6D07: $19
    ld   [hl], $60                                ; $6D08: $36 $60

jr_017_6D0A:
    ret                                           ; $6D0A: $C9

func_017_6D0B:
    ld   hl, $DE01                                ; $6D0B: $21 $01 $DE
    ld   a, $24                                   ; $6D0E: $3E $24
    ld   [hl+], a                                 ; $6D10: $22
    ld   a, $78                                   ; $6D11: $3E $78
    ld   [hl+], a                                 ; $6D13: $22
    ld   a, $01                                   ; $6D14: $3E $01
    ld   [hl+], a                                 ; $6D16: $22
    ld   a, $17                                   ; $6D17: $3E $17
    ld   [hl], a                                  ; $6D19: $77
    jp   $0BD7                                    ; $6D1A: $C3 $D7 $0B

CreditsLinkFaceCloseUpHandler::
    call AnimateEntitiesAndRestoreBank17                                    ; $6D1D: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $6D20: $FA $0E $D0
    JP_TABLE                                      ; $6D23: $C7
._00 dw CreditsLinkFaceCloseUp0Handler            ; $6D24
._01 dw CreditsLinkFaceCloseUp1Handler            ; $6D26
._02 dw CreditsLinkFaceCloseUp2Handler            ; $6D28
._03 dw CreditsLinkFaceCloseUp3Handler            ; $6D2A
._04 dw CreditsLinkFaceCloseUp4Handler            ; $6D2C
._05 dw CreditsLinkFaceCloseUp5Handler            ; $6D2E
._06 dw CreditsLinkFaceCloseUp6Handler            ; $6D30

CreditsLinkFaceCloseUp0Handler::
    ld   a, $1A                                   ; $6D32: $3E $1A
    ld   [wTileMapToLoad], a                               ; $6D34: $EA $FE $D6
    xor  a                                        ; $6D37: $AF
    ld   [$DDD5], a                               ; $6D38: $EA $D5 $DD
    dec  a                                        ; $6D3B: $3D
    ld   [$D022], a                               ; $6D3C: $EA $22 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6D3F: $C3 $D9 $4C

CreditsLinkFaceCloseUp1Handler::
    ld   a, $1B                                   ; $6D42: $3E $1B
    ld   [wBGMapToLoad], a                               ; $6D44: $EA $FF $D6
    call ResetCreditsSceneVariables                            ; $6D47: $CD $A5 $4D
    ld   a, $1E                                   ; $6D4A: $3E $1E
    ld   [wBGPalette], a                               ; $6D4C: $EA $97 $DB
    ld   a, $6E                                   ; $6D4F: $3E $6E
    ld   [wOBJ0Palette], a                               ; $6D51: $EA $98 $DB

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $6D54: $3E $E8
    call SpawnNewEntity_trampoline                ; $6D56: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6D59: $21 $00 $C2
    add  hl, de                                   ; $6D5C: $19
    ld   [hl], $38                                ; $6D5D: $36 $38
    ld   hl, wEntitiesPosYTable                                ; $6D5F: $21 $10 $C2
    add  hl, de                                   ; $6D62: $19
    ld   [hl], $50                                ; $6D63: $36 $50
    ld   hl, $C2B0                                ; $6D65: $21 $B0 $C2
    add  hl, de                                   ; $6D68: $19
    ld   [hl], $0D                                ; $6D69: $36 $0D
    ld   a, $20                                   ; $6D6B: $3E $20
    ld   [$D006], a                               ; $6D6D: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6D70: $C3 $D9 $4C

CreditsLinkFaceCloseUp2Handler::
    ld   a, [$D006]                               ; $6D73: $FA $06 $D0
    and  a                                        ; $6D76: $A7
    jr   nz, jr_017_6D7C                          ; $6D77: $20 $03

    call IncrementCreditsSubscene                            ; $6D79: $CD $D9 $4C

func_017_6D7C:
jr_017_6D7C:
    ldh  a, [hFrameCounter]                               ; $6D7C: $F0 $E7
    and  $03                                      ; $6D7E: $E6 $03
    jr   nz, jr_017_6D8E                          ; $6D80: $20 $0C

    ld   a, [$D00F]                               ; $6D82: $FA $0F $D0
    inc  a                                        ; $6D85: $3C
    cp   $31                                      ; $6D86: $FE $31
    jr   nz, jr_017_6D8B                          ; $6D88: $20 $01

    xor  a                                        ; $6D8A: $AF

jr_017_6D8B:
    ld   [$D00F], a                               ; $6D8B: $EA $0F $D0

jr_017_6D8E:
    ld   a, [$D00F]                               ; $6D8E: $FA $0F $D0
    ld   e, a                                     ; $6D91: $5F
    ld   d, b                                     ; $6D92: $50
    ld   hl, $76AD                                ; $6D93: $21 $AD $76
    add  hl, de                                   ; $6D96: $19
    ld   a, [hl]                                  ; $6D97: $7E
    sra  a                                        ; $6D98: $CB $2F
    ldh  [hBaseScrollY], a                               ; $6D9A: $E0 $97
    ret                                           ; $6D9C: $C9

    ld   l, [hl]                                  ; $6D9D: $6E
    ld   l, [hl]                                  ; $6D9E: $6E
    ld   l, [hl]                                  ; $6D9F: $6E
    ld   l, [hl]                                  ; $6DA0: $6E
    ld   e, $1E                                   ; $6DA1: $1E $1E
    ld   e, $1E                                   ; $6DA3: $1E $1E

CreditsLinkFaceCloseUp3Handler::
    call func_017_6D7C                            ; $6DA5: $CD $7C $6D
    ldh  a, [hFrameCounter]                               ; $6DA8: $F0 $E7
    and  $07                                      ; $6DAA: $E6 $07
    jr   nz, jr_017_6DC1                          ; $6DAC: $20 $13

    ld   a, [$D00A]                               ; $6DAE: $FA $0A $D0
    inc  a                                        ; $6DB1: $3C
    ld   [$D00A], a                               ; $6DB2: $EA $0A $D0
    cp   $04                                      ; $6DB5: $FE $04
    jr   nz, jr_017_6DC1                          ; $6DB7: $20 $08

    ld   a, $FF                                   ; $6DB9: $3E $FF
    ld   [$D006], a                               ; $6DBB: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6DBE: $C3 $D9 $4C

jr_017_6DC1:
    ldh  a, [hIsGBC]                               ; $6DC1: $F0 $FE
    and  a                                        ; $6DC3: $A7
    jr   nz, jr_017_6DDB                          ; $6DC4: $20 $15

    ldh  a, [hFrameCounter]                               ; $6DC6: $F0 $E7
    and  $03                                      ; $6DC8: $E6 $03
    ld   e, a                                     ; $6DCA: $5F
    ld   a, [$D00A]                               ; $6DCB: $FA $0A $D0
    add  e                                        ; $6DCE: $83
    ld   e, a                                     ; $6DCF: $5F
    ld   d, $00                                   ; $6DD0: $16 $00
    ld   hl, $6D9D                                ; $6DD2: $21 $9D $6D
    add  hl, de                                   ; $6DD5: $19
    ld   a, [hl]                                  ; $6DD6: $7E
    ld   [wOBJ0Palette], a                               ; $6DD7: $EA $98 $DB
    ret                                           ; $6DDA: $C9

func_017_6DDB:
jr_017_6DDB:
    ld   hl, $DE01                                ; $6DDB: $21 $01 $DE
    ld   a, $24                                   ; $6DDE: $3E $24
    ld   [hl+], a                                 ; $6DE0: $22
    ld   a, $7A                                   ; $6DE1: $3E $7A
    ld   [hl+], a                                 ; $6DE3: $22
    ld   a, $40                                   ; $6DE4: $3E $40
    ld   [hl+], a                                 ; $6DE6: $22
    ld   a, $17                                   ; $6DE7: $3E $17
    ld   [hl], a                                  ; $6DE9: $77
    jp   $0BD7                                    ; $6DEA: $C3 $D7 $0B

CreditsLinkFaceCloseUp4Handler::
    call func_017_6D7C                            ; $6DED: $CD $7C $6D
    ldh  a, [hIsGBC]                               ; $6DF0: $F0 $FE
    and  a                                        ; $6DF2: $A7
    jr   z, jr_017_6DF8                           ; $6DF3: $28 $03

    call func_017_6DDB                            ; $6DF5: $CD $DB $6D

jr_017_6DF8:
    ld   a, [$D006]                               ; $6DF8: $FA $06 $D0
    and  a                                        ; $6DFB: $A7
    jr   nz, jr_017_6E07                          ; $6DFC: $20 $09

    ld   a, $E0                                   ; $6DFE: $3E $E0
    ld   [$D006], a                               ; $6E00: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6E03: $C3 $D9 $4C

    ret                                           ; $6E06: $C9

jr_017_6E07:
    cp   $44                                      ; $6E07: $FE $44
    jr   z, jr_017_6E0F                           ; $6E09: $28 $04

    cp   $50                                      ; $6E0B: $FE $50
    jr   nz, jr_017_6E13                          ; $6E0D: $20 $04

jr_017_6E0F:
    ld   hl, $D003                                ; $6E0F: $21 $03 $D0
    inc  [hl]                                     ; $6E12: $34

jr_017_6E13:
    ret                                           ; $6E13: $C9

CreditsLinkFaceCloseUp5Handler::
    call func_017_6D7C                            ; $6E14: $CD $7C $6D
    ld   hl, $D006                                ; $6E17: $21 $06 $D0
    ldh  a, [hFrameCounter]                               ; $6E1A: $F0 $E7
    and  $07                                      ; $6E1C: $E6 $07
    or   [hl]                                     ; $6E1E: $B6
    jr   nz, jr_017_6E40                          ; $6E1F: $20 $1F

    ld   a, [$D002]                               ; $6E21: $FA $02 $D0
    inc  a                                        ; $6E24: $3C
    ld   [$D002], a                               ; $6E25: $EA $02 $D0
    cp   $0C                                      ; $6E28: $FE $0C
    jr   nz, jr_017_6E34                          ; $6E2A: $20 $08

    ld   a, $40                                   ; $6E2C: $3E $40
    ld   [$D006], a                               ; $6E2E: $EA $06 $D0
    call IncrementCreditsSubscene                            ; $6E31: $CD $D9 $4C

jr_017_6E34:
    ldh  a, [hIsGBC]                               ; $6E34: $F0 $FE
    and  a                                        ; $6E36: $A7
    jr   z, jr_017_6E40                           ; $6E37: $28 $07

    ld   a, [$D002]                               ; $6E39: $FA $02 $D0
    dec  a                                        ; $6E3C: $3D
    jp   label_017_7F30                           ; $6E3D: $C3 $30 $7F

jr_017_6E40:
    ldh  a, [hFrameCounter]                               ; $6E40: $F0 $E7
    and  $03                                      ; $6E42: $E6 $03
    ld   e, a                                     ; $6E44: $5F
    ld   a, [$D002]                               ; $6E45: $FA $02 $D0
    add  e                                        ; $6E48: $83
    ld   e, a                                     ; $6E49: $5F
    ld   d, $00                                   ; $6E4A: $16 $00
    ld   hl, $6456                                ; $6E4C: $21 $56 $64
    add  hl, de                                   ; $6E4F: $19
    ld   a, [hl]                                  ; $6E50: $7E
    ld   [wBGPalette], a                               ; $6E51: $EA $97 $DB
    ld   hl, $6456                                ; $6E54: $21 $56 $64
    add  hl, de                                   ; $6E57: $19
    ld   a, [hl]                                  ; $6E58: $7E
    ld   [wOBJ0Palette], a                               ; $6E59: $EA $98 $DB
    ld   hl, $6466                                ; $6E5C: $21 $66 $64
    add  hl, de                                   ; $6E5F: $19
    ld   a, [hl]                                  ; $6E60: $7E
    ld   [wOBJ1Palette], a                               ; $6E61: $EA $99 $DB
    ret                                           ; $6E64: $C9

CreditsLinkFaceCloseUp6Handler::
    ld   a, [$D006]                               ; $6E65: $FA $06 $D0
    and  a                                        ; $6E68: $A7
    jr   nz, jr_017_6E6E                          ; $6E69: $20 $03

    jp   label_017_64DE                           ; $6E6B: $C3 $DE $64

jr_017_6E6E:
    ret                                           ; $6E6E: $C9

CreditsRollHandler::
    ld   de, $99A0                                ; $6E6F: $11 $A0 $99
    call func_017_488C                            ; $6E72: $CD $8C $48
    call func_017_448B                            ; $6E75: $CD $8B $44
    ld   a, [wGameplaySubtype]                    ; $6E78: $FA $96 $DB
    cp   $09                                      ; $6E7B: $FE $09
    ret  z                                        ; $6E7D: $C8

    call AnimateEntitiesAndRestoreBank17                                    ; $6E7E: $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ; $6E81
    JP_TABLE                                      ; $6E84
._00 dw CreditsRollLoadHandler                    ; $6E85
._01 dw CreditsRoll1Handler                       ; $6E87
._02 dw CreditsRoll2Handler                       ; $6E89
._03 dw CreditsRoll3Handler                       ; $6E8B
._04 dw CreditsRoll4Handler                       ; $6E8D
._05 dw CreditsRoll5Handler                       ; $6E8F

CreditsRollLoadHandler::
    ld   a, $1B                                   ; $6E91: $3E $1B
    ld   [wTileMapToLoad], a                               ; $6E93: $EA $FE $D6
    ld   a, $01                                   ; $6E96: $3E $01
    ld   [$DDD5], a                               ; $6E98: $EA $D5 $DD
    ld   hl, $D6FD                                ; $6E9B: $21 $FD $D6
    res  2, [hl]                                  ; $6E9E: $CB $96
    jp   IncrementCreditsSubsceneAndReturn                           ; $6EA0: $C3 $D9 $4C

CreditsRoll1Handler::
    ld   a, $1C                                   ; $6EA3: $3E $1C
    ld   [wBGMapToLoad], a                               ; $6EA5: $EA $FF $D6
    call ResetCreditsSceneVariables                            ; $6EA8: $CD $A5 $4D
    ld   a, $E8                                   ; $6EAB: $3E $E8
    call SpawnNewEntity_trampoline                ; $6EAD: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                                ; $6EB0: $21 $00 $C2
    add  hl, de                                   ; $6EB3: $19
    ld   [hl], $50                                ; $6EB4: $36 $50
    ld   hl, wEntitiesPosYTable                                ; $6EB6: $21 $10 $C2
    add  hl, de                                   ; $6EB9: $19
    ld   [hl], $78                                ; $6EBA: $36 $78
    ld   hl, $C2B0                                ; $6EBC: $21 $B0 $C2
    add  hl, de                                   ; $6EBF: $19
    ld   [hl], $0E                                ; $6EC0: $36 $0E
    xor  a                                        ; $6EC2: $AF
    ld   [$D012], a                               ; $6EC3: $EA $12 $D0
    dec  a                                        ; $6EC6: $3D
    ld   [$D010], a                               ; $6EC7: $EA $10 $D0
    ld   a, $B0                                   ; $6ECA: $3E $B0
    ld   [$D009], a                               ; $6ECC: $EA $09 $D0
    xor  a                                        ; $6ECF: $AF
    ldh  [hFrameCounter], a                               ; $6ED0: $E0 $E7
    ld   [wOBJ1Palette], a                               ; $6ED2: $EA $99 $DB
    jp   IncrementCreditsSubsceneAndReturn                           ; $6ED5: $C3 $D9 $4C

; Palettes indices
Data_017_6ED8::
    db   $00, $00, $00, $00, $04, $04, $04, $04  ; $6ED8 |........|
    db   $19, $19, $19, $19, $1E, $1E, $1E, $1E  ; $6EE0 |........|

CreditsRoll2Handler::
    ldh  a, [hFrameCounter]                       ; $6EE8: $F0 $E7
    and  $07                                      ; $6EEA: $E6 $07
    jr   nz, jr_017_6F10                          ; $6EEC: $20 $22

    ld   a, [$D002]                               ; $6EEE: $FA $02 $D0
    inc  a                                        ; $6EF1: $3C
    ld   [$D002], a                               ; $6EF2: $EA $02 $D0
    cp   $0C                                      ; $6EF5: $FE $0C
    jr   nz, jr_017_6F04                          ; $6EF7: $20 $0B

    ld   a, $FF                                   ; $6EF9: $3E $FF
    ld   [$D013], a                               ; $6EFB: $EA $13 $D0
    xor  a                                        ; $6EFE: $AF
    ldh  [hFrameCounter], a                               ; $6EFF: $E0 $E7
    call IncrementCreditsSubscene                            ; $6F01: $CD $D9 $4C

jr_017_6F04:
    ldh  a, [hIsGBC]                               ; $6F04: $F0 $FE
    and  a                                        ; $6F06: $A7
    jr   z, jr_017_6F10                           ; $6F07: $28 $07

    ld   a, [$D002]                               ; $6F09: $FA $02 $D0
    dec  a                                        ; $6F0C: $3D
    jp   label_017_7E80                           ; $6F0D: $C3 $80 $7E

jr_017_6F10:
    ldh  a, [hFrameCounter]                               ; $6F10: $F0 $E7
    and  $03                                      ; $6F12: $E6 $03
    ld   e, a                                     ; $6F14: $5F
    ld   a, [$D002]                               ; $6F15: $FA $02 $D0
    add  e                                        ; $6F18: $83
    ld   e, a                                     ; $6F19: $5F
    ld   d, $00                                   ; $6F1A: $16 $00
    ld   hl, Data_017_6ED8                        ; $6F1C: $21 $D8 $6E
    add  hl, de                                   ; $6F1F: $19
    ld   a, [hl]                                  ; $6F20: $7E
    ld   [wBGPalette], a                               ; $6F21: $EA $97 $DB
    ld   [wOBJ0Palette], a                               ; $6F24: $EA $98 $DB
    ret                                           ; $6F27: $C9

CreditsRoll3Handler::
    ld   a, [$D013]                               ; $6F28: $FA $13 $D0
    and  a                                        ; $6F2B: $A7
    jr   nz, jr_017_6F67                          ; $6F2C: $20 $39

    ldh  a, [hFrameCounter]                               ; $6F2E: $F0 $E7
    and  $07                                      ; $6F30: $E6 $07
    jr   nz, jr_017_6F67                          ; $6F32: $20 $33

    ld   hl, hBaseScrollY                                ; $6F34: $21 $97 $FF
    dec  [hl]                                     ; $6F37: $35
    ld   a, [hl]                                  ; $6F38: $7E
    cp   $70                                      ; $6F39: $FE $70
    jr   nz, jr_017_6F40                          ; $6F3B: $20 $03

    jp   IncrementCreditsSubsceneAndReturn                           ; $6F3D: $C3 $D9 $4C

jr_017_6F40:
    cp   $A0                                      ; $6F40: $FE $A0
    jr   nz, jr_017_6F4C                          ; $6F42: $20 $08

    ld   hl, $C28F                                ; $6F44: $21 $8F $C2
    ld   [hl], $00                                ; $6F47: $36 $00
    jp   label_017_6F9F                           ; $6F49: $C3 $9F $6F

jr_017_6F4C:
    cp   $C0                                      ; $6F4C: $FE $C0
    jr   nz, jr_017_6F67                          ; $6F4E: $20 $17

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $6F50: $3E $E8
    call SpawnNewEntity_trampoline                ; $6F52: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $6F55: $21 $00 $C2
    add  hl, de                                   ; $6F58: $19
    ld   [hl], $18                                ; $6F59: $36 $18
    ld   hl, wEntitiesPosYTable                   ; $6F5B: $21 $10 $C2
    add  hl, de                                   ; $6F5E: $19
    ld   [hl], $B0                                ; $6F5F: $36 $B0
    ld   hl, $C2B0                                ; $6F61: $21 $B0 $C2
    add  hl, de                                   ; $6F64: $19
    ld   [hl], $0F                                ; $6F65: $36 $0F

jr_017_6F67:
    ret                                           ; $6F67: $C9

CreditsRoll4Handler::
    ret                                           ; $6F68: $C9

CreditsRoll5Handler::
    ret                                           ; $6F69: $C9

Data_017_6F6A::
    db   $99, $C1, $05, $58, $59, $5A, $5B, $5C  ; $6F6A |...XYZ[\|
    db   $5D, $99, $E1, $05, $68, $69, $6A, $6B  ; $6F72 |]...hijk|
    db   $6C, $6D, $99, $F1, $02, $58, $59, $5A  ; $6F7A |lm...XYZ|
    db   $9A, $11, $02, $68, $69, $6A, $9A, $20  ; $6F82 |...hij. |
    db   $01, $5C, $5D, $00, $99, $C0, $53, $00  ; $6F8A |.\]...S.|
    db   $99, $E0, $53, $00, $9A, $00, $53, $00  ; $6F92 |..S...S.|
    db   $9A, $20, $53, $00, $00                 ; $6F9A |. S..|

label_017_6F9F:
    ld   hl, Data_017_6F6A                        ; $6F9F: $21 $6A $6F
    ld   de, $D601                                ; $6FA2: $11 $01 $D6
    ld   c, $24                                   ; $6FA5: $0E $24

jr_017_6FA7:
    ld   a, [hl+]                                 ; $6FA7: $2A
    ld   [de], a                                  ; $6FA8: $12
    inc  de                                       ; $6FA9: $13
    dec  c                                        ; $6FAA: $0D
    jr   nz, jr_017_6FA7                          ; $6FAB: $20 $FA

    ldh  a, [hIsGBC]                               ; $6FAD: $F0 $FE
    and  a                                        ; $6FAF: $A7
    ret  z                                        ; $6FB0: $C8

    ld   hl, $6F8E                                ; $6FB1: $21 $8E $6F
    ld   de, $DC91                                ; $6FB4: $11 $91 $DC
    ld   c, $11                                   ; $6FB7: $0E $11

jr_017_6FB9:
    ld   a, [hl+]                                 ; $6FB9: $2A
    ld   [de], a                                  ; $6FBA: $12
    inc  de                                       ; $6FBB: $13
    dec  c                                        ; $6FBC: $0D
    jr   nz, jr_017_6FB9                          ; $6FBD: $20 $FA

    ret                                           ; $6FBF: $C9

CreditsTheEndHandler::
    ld   a, [wCreditsSubscene]                               ; $6FC0: $FA $0E $D0
    JP_TABLE                                      ; $6FC3: $C7
._00 dw CreditsTheEnd0Handler                     ; $6FC4 (jumpTable [0]) $D2 $6F
._01 dw CreditsTheEnd1Handler                     ; $6FC6 (jumpTable [1]) $F7 $6F
._02 dw CreditsTheEnd2Handler                     ; $6FC8 (jumpTable [2]) $18 $70
._03 dw CreditsTheEnd3Handler                     ; $6FCA (jumpTable [3]) $21 $70
._04 dw CreditsTheEnd4Handler                     ; $6FCC (jumpTable [4]) $36 $70
._05 dw CreditsTheEnd5Handler                     ; $6FCE (jumpTable [5]) $B1 $70
._06 dw CreditsTheEnd6Handler                     ; $6FD0 (jumpTable [6]) $D0 $70

CreditsTheEnd0Handler::
    ld   a, [$D01E]                               ; $6FD2: $FA $1E $D0
    and  a                                        ; $6FD5: $A7
    ret  nz                                       ; $6FD6: $C0

    ld   hl, $DC56                                ; $6FD7: $21 $56 $DC
    ld   a, $FF                                   ; $6FDA: $3E $FF
    ld   [hl+], a                                 ; $6FDC: $22
    ld   a, $7F                                   ; $6FDD: $3E $7F
    ld   [hl], a                                  ; $6FDF: $77
    ld   a, $03                                   ; $6FE0: $3E $03
    ld   [$DDD3], a                               ; $6FE2: $EA $D3 $DD
    ld   a, $01                                   ; $6FE5: $3E $01
    ld   [$DDD4], a                               ; $6FE7: $EA $D4 $DD
    ld   a, $82                                   ; $6FEA: $3E $82
    ld   [$DDD1], a                               ; $6FEC: $EA $D1 $DD
    ld   a, $B4                                   ; $6FEF: $3E $B4
    ld   [$D006], a                               ; $6FF1: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $6FF4: $C3 $D9 $4C

CreditsTheEnd1Handler::
    call func_017_469D                            ; $6FF7: $CD $9D $46
    call func_017_4784                            ; $6FFA: $CD $84 $47
    ld   hl, $DB57                                ; $6FFD: $21 $57 $DB
    ld   a, [hl+]                                 ; $7000: $2A
    or   [hl]                                     ; $7001: $B6
    ret  nz                                       ; $7002: $C0

    ld   a, [$D006]                               ; $7003: $FA $06 $D0
    and  a                                        ; $7006: $A7
    ret  nz                                       ; $7007: $C0

    ld   a, $07                                   ; $7008: $3E $07
    ldh  [$FFA9], a                               ; $700A: $E0 $A9
    swap a                                        ; $700C: $CB $37
    ldh  [$FFAA], a                               ; $700E: $E0 $AA
    ld   a, $B4                                   ; $7010: $3E $B4
    ld   [$D006], a                               ; $7012: $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn                           ; $7015: $C3 $D9 $4C

CreditsTheEnd2Handler::
    ld   a, [$D006]                               ; $7018: $FA $06 $D0
    and  a                                        ; $701B: $A7
    ret  nz                                       ; $701C: $C0

    call AnimateEntitiesAndRestoreBank17                                    ; $701D: $CD $ED $0E
    ret                                           ; $7020: $C9

CreditsTheEnd3Handler::
    ldh  a, [hFrameCounter]                               ; $7021: $F0 $E7
    and  $07                                      ; $7023: $E6 $07
    ret  nz                                       ; $7025: $C0

    call func_017_7FA9                            ; $7026: $CD $A9 $7F
    ld   a, [$D01F]                               ; $7029: $FA $1F $D0
    inc  a                                        ; $702C: $3C
    ld   [$D01F], a                               ; $702D: $EA $1F $D0
    cp   $10                                      ; $7030: $FE $10
    jp   z, IncrementCreditsSubsceneAndReturn                        ; $7032: $CA $D9 $4C

    ret                                           ; $7035: $C9

CreditsTheEnd4Handler::
    ld   a, $23                                   ; $7036: $3E $23
    ld   [wTileMapToLoad], a                               ; $7038: $EA $FE $D6
    ld   hl, $DC18                                ; $703B: $21 $18 $DC
    ld   a, $FF                                   ; $703E: $3E $FF
    ld   [hl+], a                                 ; $7040: $22
    ld   a, $47                                   ; $7041: $3E $47
    ld   [hl], a                                  ; $7043: $77
    ld   a, $04                                   ; $7044: $3E $04
    ld   [$DDD3], a                               ; $7046: $EA $D3 $DD
    ld   a, $01                                   ; $7049: $3E $01
    ld   [$DDD4], a                               ; $704B: $EA $D4 $DD
    ld   a, $81                                   ; $704E: $3E $81
    ld   [$DDD1], a                               ; $7050: $EA $D1 $DD
    ld   a, $FA                                   ; $7053: $3E $FA
    ldh  [$FF96], a                               ; $7055: $E0 $96
    xor  a                                        ; $7057: $AF
    ldh  [hBaseScrollY], a                               ; $7058: $E0 $97
    jp   IncrementCreditsSubsceneAndReturn                           ; $705A: $C3 $D9 $4C

Data_017_705D::
    db   $98, $A2, $0E, $01, $02, $03, $00, $04  ; $705D |........|
    db   $05, $06, $07, $08, $09, $0A, $0B, $0C  ; $7065 |........|
    db   $0D, $0E, $98, $E2, $0E, $0E, $10, $11  ; $706D |........|
    db   $12, $00, $13, $14, $15, $16, $17, $00  ; $7075 |........|
    db   $18, $19, $1A, $1B, $99, $22, $0B, $1C  ; $707D |....."..|
    db   $1D, $00, $1E, $1F, $20, $21, $22, $00  ; $7085 |.... !".|
    db   $23, $24, $25, $99, $62, $0B, $26, $27  ; $708D |#$%.b.&'|
    db   $28, $00, $29, $2A, $2B, $2C, $2D, $2E  ; $7095 |(.)*+,-.|
    db   $2F, $0F, $00, $98, $A2, $4E, $01, $98  ; $709D |/....N..|
    db   $E2, $4E, $01, $99, $22, $4B, $01, $99  ; $70A5 |.N.."K..|
    db   $62, $4B, $01, $00                      ; $70AD |bK..|

CreditsTheEnd5Handler::
    ld   hl, $705D                               ; $70B1
    ld   de, $D601                               ; $70B4
    ld   c, $43                                  ; $70B7

.loop_017_70B9
    ld   a, [hl+]                                 ; $70B9: $2A
    ld   [de], a                                  ; $70BA: $12
    inc  de                                       ; $70BB: $13
    dec  c                                        ; $70BC: $0D
    jr   nz, .loop_017_70B9                       ; $70BD: $20 $FA

    ld   hl, $70A0                                ; $70BF: $21 $A0 $70
    ld   de, $DC91                                ; $70C2: $11 $91 $DC
    ld   c, $11                                   ; $70C5: $0E $11

.loop_017_70C7
    ld   a, [hl+]                                 ; $70C7: $2A
    ld   [de], a                                  ; $70C8: $12
    inc  de                                       ; $70C9: $13
    dec  c                                        ; $70CA: $0D
    jr   nz, .loop_017_70C7                       ; $70CB: $20 $FA

    jp   IncrementCreditsSubsceneAndReturn                           ; $70CD: $C3 $D9 $4C

CreditsTheEnd6Handler::
    ret                                           ; $70D0: $C9

Data_017_70D1::
    db   $08, $00, $5C, $00, $10, $00, $5D, $00  ; $70D1 |..\...].|
    db   $00, $08, $C0, $00, $08, $08, $C1, $00  ; $70D9 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $70E1 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $70E9 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $70F1 |. ... ..|
    db   $08, $00, $5E, $00, $10, $00, $5F, $00  ; $70F9 |..^..._.|
    db   $00, $08, $C0, $00, $08, $08, $C1, $00  ; $7101 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7109 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7111 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7119 |. ... ..|
    db   $08, $00, $EC, $00, $10, $00, $ED, $00  ; $7121 |........|
    db   $00, $08, $D0, $00, $08, $08, $D1, $00  ; $7129 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7131 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7139 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7141 |. ... ..|
    db   $08, $00, $EE, $00, $10, $00, $EF, $00  ; $7149 |........|
    db   $00, $08, $D0, $00, $08, $08, $D1, $00  ; $7151 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7159 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7161 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7169 |. ... ..|

    ld   a, $3C                                   ; $7171: $3E $3C
    ld   [$C3C0], a                               ; $7173: $EA $C0 $C3
    ldh  a, [hBaseScrollY]                        ; $7176: $F0 $97
    ld   e, a                                     ; $7178: $5F
    ldh  a, [$FFEC]                               ; $7179: $F0 $EC
    sub  e                                        ; $717B: $93
    ldh  [$FFEC], a                               ; $717C: $E0 $EC
    ldh  a, [hIsGBC]                               ; $717E: $F0 $FE
    and  a                                        ; $7180: $A7
    jr   z, jr_017_7188                           ; $7181: $28 $05

    call func_017_71CD                            ; $7183: $CD $CD $71
    jr   jr_017_71AC                              ; $7186: $18 $24

jr_017_7188:
    ldh  a, [hFrameCounter]                       ; $7188: $F0 $E7
    rra                                           ; $718A: $1F
    rra                                           ; $718B: $1F
    rra                                           ; $718C: $1F
    rra                                           ; $718D: $1F
    rra                                           ; $718E: $1F
    and  $03                                      ; $718F: $E6 $03
    rla                                           ; $7191: $17
    rla                                           ; $7192: $17
    rla                                           ; $7193: $17
    and  $F8                                      ; $7194: $E6 $F8
    ld   e, a                                     ; $7196: $5F
    rla                                           ; $7197: $17
    rla                                           ; $7198: $17
    and  $E0                                      ; $7199: $E6 $E0
    add  e                                        ; $719B: $83
    ld   e, a                                     ; $719C: $5F
    ld   d, b                                     ; $719D: $50
    ld   hl, Data_017_70D1                        ; $719E: $21 $D1 $70
    add  hl, de                                   ; $71A1: $19
    ld   c, $0A                                   ; $71A2: $0E $0A
    call label_3CE0                               ; $71A4: $CD $E0 $3C
    ld   a, $0A                                   ; $71A7: $3E $0A
    call label_3DA0                               ; $71A9: $CD $A0 $3D

jr_017_71AC:
    ldh  a, [hFrameCounter]                       ; $71AC: $F0 $E7
    and  $01                                      ; $71AE: $E6 $01
    jr   nz, jr_017_71CC                          ; $71B0: $20 $1A

    ld   hl, wEntitiesSpeedXTable                 ; $71B2: $21 $40 $C2
    add  hl, bc                                   ; $71B5: $09
    ld   [hl], $04                                ; $71B6: $36 $04
    ld   hl, wEntitiesSpeedYTable                 ; $71B8: $21 $50 $C2
    add  hl, bc                                   ; $71BB: $09
    ld   [hl], $FF                                ; $71BC: $36 $FF
    call func_017_7E2D                            ; $71BE: $CD $2D $7E
    ldh  a, [$FFEE]                               ; $71C1: $F0 $EE
    cp   $A8                                      ; $71C3: $FE $A8
    ret  c                                        ; $71C5: $D8

    call IncrementCreditsSubscene                            ; $71C6: $CD $D9 $4C
    jp   label_017_7CC2                           ; $71C9: $C3 $C2 $7C

jr_017_71CC:
    ret                                           ; $71CC: $C9

func_017_71CD:
    ld   hl, $DE01                                ; $71CD: $21 $01 $DE
    ld   a, $20                                   ; $71D0: $3E $20
    ld   [hl+], a                                 ; $71D2: $22
    ld   a, $7D                                   ; $71D3: $3E $7D
    ld   [hl+], a                                 ; $71D5: $22
    ld   a, $1C                                   ; $71D6: $3E $1C
    ld   [hl+], a                                 ; $71D8: $22
    ld   a, $17                                   ; $71D9: $3E $17
    ld   [hl], a                                  ; $71DB: $77
    jp   $0BD7                                    ; $71DC: $C3 $D7 $0B

Data_017_71DF::
    db   $00, $00                                ; $71DF |>.w.....|
    db   $00, $00, $08, $00, $01, $00, $00, $08  ; $71E1 |........|
    db   $02, $00, $08, $08, $03, $00, $00, $FA  ; $71E9 |........|
    db   $10, $00, $08, $FA, $11, $00, $00, $0E  ; $71F1 |........|
    db   $10, $20, $08, $0E, $11, $20, $00, $00  ; $71F9 |. ... ..|
    db   $00, $00, $08, $00, $01, $00, $00, $08  ; $7201 |........|
    db   $02, $00, $08, $08, $03, $00, $08, $FA  ; $7209 |........|
    db   $10, $40, $00, $FA, $11, $40, $08, $0E  ; $7211 |.@...@..|
    db   $10, $60, $00, $0E, $11, $60, $00, $08  ; $7219 |.`...`..|
    db   $00, $20, $08, $08, $01, $20, $00, $00  ; $7221 |. ... ..|
    db   $02, $20, $08, $00, $03, $20, $00, $FA  ; $7229 |. ... ..|
    db   $10, $00, $08, $FA, $11, $00, $00, $0E  ; $7231 |........|
    db   $10, $20, $08, $0E, $11, $20, $00, $08  ; $7239 |. ... ..|
    db   $00, $20, $08, $08, $01, $20, $00, $00  ; $7241 |. ... ..|
    db   $02, $20, $08, $00, $03, $20, $08, $FA  ; $7249 |. ... ..|
    db   $10, $40, $00, $FA, $11, $40, $08, $0E  ; $7251 |.@...@..|
    db   $10, $60, $00

Func_017_725C::
    ld   c, $11                                   ; $725C: $0E $11
    ld   h, b                                     ; $725E: $60
    ld   hl, $DB57                                ; $725F: $21 $57 $DB
    ld   a, [hl+]                                 ; $7262: $2A
    or   [hl]                                     ; $7263: $B6
    jr   nz, jr_017_7293                          ; $7264: $20 $2D

    ldh  a, [hIsGBC]                               ; $7266: $F0 $FE
    and  a                                        ; $7268: $A7
    jr   nz, jr_017_72BD                          ; $7269: $20 $52

    ld   a, $1C                                   ; $726B: $3E $1C
    ld   [wOBJ0Palette], a                               ; $726D: $EA $98 $DB
    ld   a, $3C                                   ; $7270: $3E $3C
    ld   [$C3C0], a                               ; $7272: $EA $C0 $C3
    ldh  a, [hFrameCounter]                               ; $7275: $F0 $E7
    rra                                           ; $7277: $1F
    rra                                           ; $7278: $1F
    rra                                           ; $7279: $1F
    and  $03                                      ; $727A: $E6 $03
    rla                                           ; $727C: $17
    rla                                           ; $727D: $17
    rla                                           ; $727E: $17
    rla                                           ; $727F: $17
    rla                                           ; $7280: $17
    and  $E0                                      ; $7281: $E6 $E0
    ld   e, a                                     ; $7283: $5F
    ld   d, b                                     ; $7284: $50
    ld   hl, Data_017_71DF                        ; $7285: $21 $DF $71
    add  hl, de                                   ; $7288: $19
    ld   c, $08                                   ; $7289: $0E $08
    call label_3CE0                               ; $728B: $CD $E0 $3C
    ld   a, $08                                   ; $728E: $3E $08
    call label_3DA0                               ; $7290: $CD $A0 $3D

jr_017_7293:
    call func_017_7E2D                            ; $7293: $CD $2D $7E
    ldh  a, [hFrameCounter]                               ; $7296: $F0 $E7
    and  $0F                                      ; $7298: $E6 $0F
    jr   nz, jr_017_72A6                          ; $729A: $20 $0A

    ld   hl, wEntitiesSpeedYTable                                ; $729C: $21 $50 $C2
    add  hl, bc                                   ; $729F: $09
    ld   a, [hl]                                  ; $72A0: $7E
    cp   $FC                                      ; $72A1: $FE $FC
    jr   z, jr_017_72A6                           ; $72A3: $28 $01

    dec  [hl]                                     ; $72A5: $35

jr_017_72A6:
    ldh  a, [$FFEE]                               ; $72A6: $F0 $EE
    cp   $A8                                      ; $72A8: $FE $A8
    jp   z, label_017_7CC2                        ; $72AA: $CA $C2 $7C

    ld   hl, wEntitiesUnknowTableY                ; $72AD: $21 $D0 $C3
    add  hl, bc                                   ; $72B0: $09
    ld   a, [hl]                                  ; $72B1: $7E
    inc  a                                        ; $72B2: $3C
    ld   [hl], a                                  ; $72B3: $77
    and  $7F                                      ; $72B4: $E6 $7F
    jr   nz, jr_017_72BC                          ; $72B6: $20 $04

    ld   a, JINGLE_SEAGULL                        ; $72B8: $3E $21
    ldh  [hJingle], a                             ; $72BA: $E0 $F2

jr_017_72BC:
    ret                                           ; $72BC: $C9

jr_017_72BD:
    ld   hl, $DE01                                ; $72BD: $21 $01 $DE
    ld   a, $27                                   ; $72C0: $3E $27
    ld   [hl+], a                                 ; $72C2: $22
    ld   [$DBAF], a                               ; $72C3: $EA $AF $DB
    ld   a, $78                                   ; $72C6: $3E $78
    ld   [hl+], a                                 ; $72C8: $22
    ld   a, $54                                   ; $72C9: $3E $54
    ld   [hl+], a                                 ; $72CB: $22
    ld   a, $17                                   ; $72CC: $3E $17
    ld   [hl], a                                  ; $72CE: $77
    call label_BD7                                ; $72CF: $CD $D7 $0B
    ld   a, $17                                   ; $72D2: $3E $17
    ld   [$DBAF], a                               ; $72D4: $EA $AF $DB
    ret                                           ; $72D7: $C9

Data_017_72D8::
    db   $00  ; $72D8
    db   $00, $4C, $00, $08, $00, $4D, $00, $00  ; $72D9 |.L...M..|
    db   $08, $4E, $00, $08, $08, $4F, $00, $10  ; $72E1 |.N...O..|
    db   $F8, $60, $00, $18, $F8, $61, $00, $10  ; $72E9 |.`...a..|
    db   $00, $62, $00, $18, $00, $63, $00, $10  ; $72F1 |.b...c..|
    db   $08, $64, $00, $18, $08, $65, $00, $10  ; $72F9 |.d...e..|
    db   $10, $66, $00, $18, $10, $67, $00, $00  ; $7301 |.f...g..|
    db   $00, $4C, $00, $08, $00, $4D, $00, $00  ; $7309 |.L...M..|
    db   $08, $4E, $00, $08, $08, $4F, $00, $10  ; $7311 |.N...O..|
    db   $F8, $68, $00, $18, $F8, $69, $00, $10  ; $7319 |.h...i..|
    db   $00, $6A, $00, $18, $00, $6B, $00, $10  ; $7321 |.j...k..|
    db   $08, $6C, $00, $18, $08, $6D, $00, $10  ; $7329 |.l...m..|
    db   $10, $6E, $00, $18, $10, $6F, $00, $00  ; $7331 |.n...o..|
    db   $00, $4C, $00, $08, $00, $4D, $00, $00  ; $7339 |.L...M..|
    db   $08, $4E, $00, $08, $08, $4F, $00, $10  ; $7341 |.N...O..|
    db   $F8, $70, $00, $18, $F8, $71, $00, $10  ; $7349 |.p...q..|
    db   $00, $72, $00, $18, $00, $73, $00, $10  ; $7351 |.r...s..|
    db   $08, $74, $00, $18, $08, $75, $00, $10  ; $7359 |.t...u..|
    db   $10, $76, $00, $18, $10, $77, $00, $00  ; $7361 |.v...w..|
    db   $00, $4C, $00, $08, $00, $4D, $00, $00  ; $7369 |.L...M..|
    db   $08, $4E, $00, $08, $08, $4F, $00, $10  ; $7371 |.N...O..|
    db   $F8, $78, $00, $18, $F8, $79, $00, $10  ; $7379 |.x...y..|
    db   $00, $7A, $00, $18, $00, $7B, $00, $10  ; $7381 |.z...{..|
    db   $08, $7C, $00, $18, $08, $7D, $00, $10  ; $7389 |.|...}..|
    db   $10, $7E, $00, $18, $10, $7F, $00

Func_017_7398::
    ld   a, $3C                                   ; $7398: $3E $3C
    ld   [$C3C0], a                               ; $739A: $EA $C0 $C3
    ldh  a, [hFrameCounter]                               ; $739D: $F0 $E7
    and  $03                                      ; $739F: $E6 $03
    jr   nz, jr_017_73AF                          ; $73A1: $20 $0C

    ld   a, [$D00F]                               ; $73A3: $FA $0F $D0

jr_017_73A6:
    inc  a                                        ; $73A6: $3C
    cp   $31                                      ; $73A7: $FE $31
    jr   c, jr_017_73AC                           ; $73A9: $38 $01

    xor  a                                        ; $73AB: $AF

jr_017_73AC:
    ld   [$D00F], a                               ; $73AC: $EA $0F $D0

jr_017_73AF:
    ld   a, [$D00F]                               ; $73AF: $FA $0F $D0
    ld   e, a                                     ; $73B2: $5F
    ld   d, b                                     ; $73B3: $50
    ld   hl, $76AD                                ; $73B4: $21 $AD $76
    add  hl, de                                   ; $73B7: $19
    ldh  a, [hBaseScrollY]                               ; $73B8: $F0 $97
    ld   d, a                                     ; $73BA: $57
    ld   a, [hl]                                  ; $73BB: $7E
    sra  a                                        ; $73BC: $CB $2F
    ld   e, a                                     ; $73BE: $5F
    ldh  a, [$FFEC]                               ; $73BF: $F0 $EC
    add  e                                        ; $73C1: $83
    sub  d                                        ; $73C2: $92
    ldh  [$FFEC], a                               ; $73C3: $E0 $EC
    ldh  a, [hIsGBC]                               ; $73C5: $F0 $FE
    and  a                                        ; $73C7: $A7
    jr   nz, jr_017_73ED                          ; $73C8: $20 $23

    ldh  a, [hFrameCounter]                               ; $73CA: $F0 $E7
    rra                                           ; $73CC: $1F
    rra                                           ; $73CD: $1F
    rra                                           ; $73CE: $1F
    and  $03                                      ; $73CF: $E6 $03
    rla                                           ; $73D1: $17
    rla                                           ; $73D2: $17
    rla                                           ; $73D3: $17
    rla                                           ; $73D4: $17
    and  $F0                                      ; $73D5: $E6 $F0
    ld   e, a                                     ; $73D7: $5F
    rla                                           ; $73D8: $17
    and  $E0                                      ; $73D9: $E6 $E0
    add  e                                        ; $73DB: $83
    ld   e, a                                     ; $73DC: $5F
    ld   d, b                                     ; $73DD: $50
    ld   hl, Data_017_72D8                        ; $73DE: $21 $D8 $72
    add  hl, de                                   ; $73E1: $19
    ld   c, $0C                                   ; $73E2: $0E $0C
    call label_3CE0                                    ; $73E4: $CD $E0 $3C
    ld   a, $0C                                   ; $73E7: $3E $0C
    call label_3DA0                                    ; $73E9: $CD $A0 $3D
    ret                                           ; $73EC: $C9

jr_017_73ED:
    ld   hl, $DE01                                ; $73ED: $21 $01 $DE
    ld   a, $27                                   ; $73F0: $3E $27
    ld   [hl+], a                                 ; $73F2: $22
    ld   a, $78                                   ; $73F3: $3E $78
    ld   [hl+], a                                 ; $73F5: $22
    ld   a, $2E                                   ; $73F6: $3E $2E
    ld   [hl+], a                                 ; $73F8: $22
    ld   a, $17                                   ; $73F9: $3E $17
    ld   [hl], a                                  ; $73FB: $77
    jp   $0BD7                                    ; $73FC: $C3 $D7 $0B

    nop                                           ; $73FF: $00
    nop                                           ; $7400: $00
    nop                                           ; $7401: $00
    nop                                           ; $7402: $00
    nop                                           ; $7403: $00
    ld   [$0002], sp                              ; $7404: $08 $02 $00
    nop                                           ; $7407: $00
    db   $10                                      ; $7408: $10
    inc  b                                        ; $7409: $04
    nop                                           ; $740A: $00
    nop                                           ; $740B: $00
    jr   jr_017_7414                              ; $740C: $18 $06

    nop                                           ; $740E: $00
    nop                                           ; $740F: $00
    jr   nz, jr_017_741A                          ; $7410: $20 $08

    nop                                           ; $7412: $00
    nop                                           ; $7413: $00

jr_017_7414:
    jr   z, @+$0C                                 ; $7414: $28 $0A

    nop                                           ; $7416: $00
    db   $10                                      ; $7417: $10
    jr   nz, jr_017_742E                          ; $7418: $20 $14

jr_017_741A:
    nop                                           ; $741A: $00
    db   $10                                      ; $741B: $10
    jr   z, @+$18                                 ; $741C: $28 $16

    nop                                           ; $741E: $00
    jr   nz, jr_017_7441                          ; $741F: $20 $20

    ld   e, $00                                   ; $7421: $1E $00
    jr   nz, @+$2A                                ; $7423: $20 $28

    jr   nz, jr_017_7427                          ; $7425: $20 $00

jr_017_7427:
    jr   nc, jr_017_7429                          ; $7427: $30 $00

jr_017_7429:
    ld   d, b                                     ; $7429: $50
    nop                                           ; $742A: $00
    jr   nc, jr_017_7435                          ; $742B: $30 $08

    ld   [hl+], a                                 ; $742D: $22

jr_017_742E:
    nop                                           ; $742E: $00
    jr   nc, jr_017_7441                          ; $742F: $30 $10

    inc  h                                        ; $7431: $24
    nop                                           ; $7432: $00
    jr   nc, @+$1A                                ; $7433: $30 $18

jr_017_7435:
    ld   h, $00                                   ; $7435: $26 $00
    jr   nc, @+$22                                ; $7437: $30 $20

    jr   z, jr_017_743B                           ; $7439: $28 $00

jr_017_743B:
    jr   nc, @+$2A                                ; $743B: $30 $28

    ld   a, [hl+]                                 ; $743D: $2A
    nop                                           ; $743E: $00
    jr   nc, @+$32                                ; $743F: $30 $30

jr_017_7441:
    inc  l                                        ; $7441: $2C
    nop                                           ; $7442: $00
    jr   nc, jr_017_747D                          ; $7443: $30 $38

    ld   l, $00                                   ; $7445: $2E $00
    ld   b, b                                     ; $7447: $40
    nop                                           ; $7448: $00
    jr   nc, jr_017_744B                          ; $7449: $30 $00

jr_017_744B:
    ld   b, b                                     ; $744B: $40
    ld   [$0032], sp                              ; $744C: $08 $32 $00
    ld   b, b                                     ; $744F: $40
    db   $10                                      ; $7450: $10
    inc  [hl]                                     ; $7451: $34
    nop                                           ; $7452: $00
    ld   b, b                                     ; $7453: $40
    jr   @+$38                                    ; $7454: $18 $36

    nop                                           ; $7456: $00
    ld   b, b                                     ; $7457: $40
    jr   nz, @+$3A                                ; $7458: $20 $38

    nop                                           ; $745A: $00
    ld   b, b                                     ; $745B: $40
    jr   z, jr_017_7498                           ; $745C: $28 $3A

    nop                                           ; $745E: $00
    ld   b, b                                     ; $745F: $40
    jr   nc, @+$3E                                ; $7460: $30 $3C

    nop                                           ; $7462: $00
    ld   b, b                                     ; $7463: $40
    jr   c, @+$40                                 ; $7464: $38 $3E

    nop                                           ; $7466: $00
    ld   b, b                                     ; $7467: $40
    ld   b, b                                     ; $7468: $40
    ld   b, b                                     ; $7469: $40
    nop                                           ; $746A: $00
    stop                                          ; $746B: $10 $00
    inc  c                                        ; $746D: $0C
    nop                                           ; $746E: $00
    db   $10                                      ; $746F: $10
    ld   [$000E], sp                              ; $7470: $08 $0E $00
    db   $10                                      ; $7473: $10
    db   $10                                      ; $7474: $10
    stop                                          ; $7475: $10 $00
    db   $10                                      ; $7477: $10
    jr   @+$14                                    ; $7478: $18 $12

    nop                                           ; $747A: $00
    jr   nz, jr_017_7485                          ; $747B: $20 $08

jr_017_747D:
    jr   jr_017_747F                              ; $747D: $18 $00

jr_017_747F:
    jr   nz, @+$12                                ; $747F: $20 $10

    ld   a, [de]                                  ; $7481: $1A
    nop                                           ; $7482: $00
    jr   nz, jr_017_749D                          ; $7483: $20 $18

jr_017_7485:
    inc  e                                        ; $7485: $1C
    nop                                           ; $7486: $00
    rst  $38                                      ; $7487: $FF
    rst  $38                                      ; $7488: $FF
    rst  $38                                      ; $7489: $FF
    rst  $38                                      ; $748A: $FF
    stop                                          ; $748B: $10 $00
    inc  c                                        ; $748D: $0C
    nop                                           ; $748E: $00
    db   $10                                      ; $748F: $10
    ld   [$0042], sp                              ; $7490: $08 $42 $00
    db   $10                                      ; $7493: $10
    db   $10                                      ; $7494: $10
    ld   b, h                                     ; $7495: $44
    nop                                           ; $7496: $00
    db   $10                                      ; $7497: $10

jr_017_7498:
    jr   jr_017_74E0                              ; $7498: $18 $46

    nop                                           ; $749A: $00
    jr   nz, jr_017_74A5                          ; $749B: $20 $08

jr_017_749D:
    jr   jr_017_749F                              ; $749D: $18 $00

jr_017_749F:
    jr   nz, @+$12                                ; $749F: $20 $10

    ld   c, b                                     ; $74A1: $48
    nop                                           ; $74A2: $00
    jr   nz, jr_017_74BD                          ; $74A3: $20 $18

jr_017_74A5:
    ld   c, d                                     ; $74A5: $4A
    nop                                           ; $74A6: $00
    rst  $38                                      ; $74A7: $FF
    rst  $38                                      ; $74A8: $FF
    rst  $38                                      ; $74A9: $FF
    rst  $38                                      ; $74AA: $FF
    stop                                          ; $74AB: $10 $00
    inc  c                                        ; $74AD: $0C
    nop                                           ; $74AE: $00
    db   $10                                      ; $74AF: $10
    ld   [$0052], sp                              ; $74B0: $08 $52 $00
    db   $10                                      ; $74B3: $10
    db   $10                                      ; $74B4: $10
    ld   d, h                                     ; $74B5: $54
    nop                                           ; $74B6: $00
    db   $10                                      ; $74B7: $10
    jr   @+$58                                    ; $74B8: $18 $56

    nop                                           ; $74BA: $00
    jr   nz, jr_017_74C5                          ; $74BB: $20 $08

jr_017_74BD:
    jr   jr_017_74BF                              ; $74BD: $18 $00

jr_017_74BF:
    jr   nz, @+$12                                ; $74BF: $20 $10

    ld   e, b                                     ; $74C1: $58
    nop                                           ; $74C2: $00
    jr   nz, jr_017_74DD                          ; $74C3: $20 $18

jr_017_74C5:
    ld   e, d                                     ; $74C5: $5A
    nop                                           ; $74C6: $00
    rst  $38                                      ; $74C7: $FF
    rst  $38                                      ; $74C8: $FF
    rst  $38                                      ; $74C9: $FF
    rst  $38                                      ; $74CA: $FF
    ld   a, [$D00F]                               ; $74CB: $FA $0F $D0
    ld   e, a                                     ; $74CE: $5F
    ld   d, b                                     ; $74CF: $50
    ld   hl, $76AD                                ; $74D0: $21 $AD $76
    add  hl, de                                   ; $74D3: $19
    ld   a, [hl]                                  ; $74D4: $7E
    sra  a                                        ; $74D5: $CB $2F
    ld   e, a                                     ; $74D7: $5F
    ldh  a, [$FFEC]                               ; $74D8: $F0 $EC
    add  e                                        ; $74DA: $83
    ldh  [$FFEC], a                               ; $74DB: $E0 $EC

jr_017_74DD:
    ldh  a, [hIsGBC]                               ; $74DD: $F0 $FE
    and  a                                        ; $74DF: $A7

jr_017_74E0:
    jr   nz, jr_017_750F                          ; $74E0: $20 $2D

    ld   hl, $73FF                                ; $74E2: $21 $FF $73
    ld   c, $1B                                   ; $74E5: $0E $1B
    call label_3CE0                               ; $74E7: $CD $E0 $3C
    ld   a, $1B                                   ; $74EA: $3E $1B
    call label_3DA0                               ; $74EC: $CD $A0 $3D
    ld   a, [$D003]                               ; $74EF: $FA $03 $D0
    rla                                           ; $74F2: $17
    rla                                           ; $74F3: $17
    rla                                           ; $74F4: $17
    rla                                           ; $74F5: $17
    rla                                           ; $74F6: $17
    and  $E0                                      ; $74F7: $E6 $E0
    ld   e, a                                     ; $74F9: $5F
    ld   d, b                                     ; $74FA: $50
    ld   hl, $746B                                ; $74FB: $21 $6B $74
    add  hl, de                                   ; $74FE: $19
    ld   c, $07                                   ; $74FF: $0E $07
    ld   a, $40                                   ; $7501: $3E $40
    ld   [$C3C0], a                               ; $7503: $EA $C0 $C3
    call label_3CE6                               ; $7506: $CD $E6 $3C
    ld   a, $07                                   ; $7509: $3E $07
    call label_3DA0                               ; $750B: $CD $A0 $3D
    ret                                           ; $750E: $C9

jr_017_750F:
    ld   hl, $DE01                                ; $750F: $21 $01 $DE
    ld   a, $27                                   ; $7512: $3E $27
    ld   [hl+], a                                 ; $7514: $22
    ld   a, $77                                   ; $7515: $3E $77
    ld   [hl+], a                                 ; $7517: $22
    ld   a, $4C                                   ; $7518: $3E $4C
    ld   [hl+], a                                 ; $751A: $22
    ld   a, $17                                   ; $751B: $3E $17
    ld   [hl], a                                  ; $751D: $77
    jp   $0BD7                                    ; $751E: $C3 $D7 $0B

    nop                                           ; $7521: $00
    nop                                           ; $7522: $00
    ld   [hl], b                                  ; $7523: $70
    rlca                                          ; $7524: $07
    nop                                           ; $7525: $00
    nop                                           ; $7526: $00
    ld   [hl], b                                  ; $7527: $70
    rlca                                          ; $7528: $07
    nop                                           ; $7529: $00
    nop                                           ; $752A: $00
    ld   [hl], b                                  ; $752B: $70
    rlca                                          ; $752C: $07
    nop                                           ; $752D: $00
    nop                                           ; $752E: $00
    ld   [hl], b                                  ; $752F: $70
    rlca                                          ; $7530: $07
    ld   [$5C08], sp                              ; $7531: $08 $08 $5C
    rlca                                          ; $7534: $07
    ld   [$5C08], sp                              ; $7535: $08 $08 $5C
    rlca                                          ; $7538: $07
    nop                                           ; $7539: $00
    nop                                           ; $753A: $00
    ld   [hl], b                                  ; $753B: $70
    rlca                                          ; $753C: $07
    ld   [$5E08], sp                              ; $753D: $08 $08 $5E
    rlca                                          ; $7540: $07
    ld   [$6010], sp                              ; $7541: $08 $10 $60
    rlca                                          ; $7544: $07
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7545: $21 $40 $C3
    add  hl, bc                                   ; $7548: $09
    ld   [hl], $C3                                ; $7549: $36 $C3
    ldh  a, [$FFF1]                               ; $754B: $F0 $F1
    rla                                           ; $754D: $17
    rla                                           ; $754E: $17
    and  $FC                                      ; $754F: $E6 $FC
    ld   e, a                                     ; $7551: $5F
    rla                                           ; $7552: $17
    and  $F8                                      ; $7553: $E6 $F8
    add  e                                        ; $7555: $83
    ld   e, a                                     ; $7556: $5F
    ld   d, b                                     ; $7557: $50
    ld   hl, $7521                                ; $7558: $21 $21 $75
    add  hl, de                                   ; $755B: $19
    ld   c, $03                                   ; $755C: $0E $03
    call label_3CE6                               ; $755E: $CD $E6 $3C
    call GetEntityTransitionCountdown             ; $7561: $CD $05 $0C
    cp   $01                                      ; $7564: $FE $01
    jr   z, jr_017_756C                           ; $7566: $28 $04

    cp   $30                                      ; $7568: $FE $30
    jr   nz, jr_017_7571                          ; $756A: $20 $05

jr_017_756C:
    ld   hl, $C3B0                                ; $756C: $21 $B0 $C3
    add  hl, bc                                   ; $756F: $09
    inc  [hl]                                     ; $7570: $34

jr_017_7571:
    ret                                           ; $7571: $C9

    nop                                           ; $7572: $00
    nop                                           ; $7573: $00
    ld   h, d                                     ; $7574: $62
    stop                                          ; $7575: $10 $00
    ld   [$3062], sp                              ; $7577: $08 $62 $30
    db   $10                                      ; $757A: $10
    ldh  a, [$FF64]                               ; $757B: $F0 $64
    db   $10                                      ; $757D: $10
    db   $10                                      ; $757E: $10
    ld   hl, sp+$66                               ; $757F: $F8 $66
    db   $10                                      ; $7581: $10

jr_017_7582:
    stop                                          ; $7582: $10 $00
    ld   l, b                                     ; $7584: $68
    db   $10                                      ; $7585: $10
    db   $10                                      ; $7586: $10
    ld   [$3068], sp                              ; $7587: $08 $68 $30
    db   $10                                      ; $758A: $10
    db   $10                                      ; $758B: $10
    ld   h, [hl]                                  ; $758C: $66
    jr   nc, @+$12                                ; $758D: $30 $10

    jr   jr_017_75F5                              ; $758F: $18 $64

    jr   nc, jr_017_75B3                          ; $7591: $30 $20

    nop                                           ; $7593: $00
    ld   l, d                                     ; $7594: $6A
    db   $10                                      ; $7595: $10
    jr   nz, jr_017_75A0                          ; $7596: $20 $08

    ld   l, d                                     ; $7598: $6A
    jr   nc, @+$32                                ; $7599: $30 $30

    ld   hl, sp+$6C                               ; $759B: $F8 $6C
    db   $10                                      ; $759D: $10
    jr   nc, jr_017_75A0                          ; $759E: $30 $00

jr_017_75A0:
    ld   l, [hl]                                  ; $75A0: $6E
    db   $10                                      ; $75A1: $10

jr_017_75A2:
    jr   nc, @+$0A                                ; $75A2: $30 $08

    ld   l, [hl]                                  ; $75A4: $6E
    jr   nc, jr_017_75D7                          ; $75A5: $30 $30

    db   $10                                      ; $75A7: $10

jr_017_75A8:
    ld   l, h                                     ; $75A8: $6C
    jr   nc, @-$4F                                ; $75A9: $30 $AF

    ld   [$C3C0], a                               ; $75AB: $EA $C0 $C3
    ld   hl, hBaseScrollY                                ; $75AE: $21 $97 $FF
    ldh  a, [$FFEC]                               ; $75B1: $F0 $EC

jr_017_75B3:
    sub  [hl]                                     ; $75B3: $96

jr_017_75B4:
    ldh  [$FFEC], a                               ; $75B4: $E0 $EC
    ld   hl, $7572                                ; $75B6: $21 $72 $75
    ld   c, $0E                                   ; $75B9: $0E $0E
    call label_3CE6                               ; $75BB: $CD $E6 $3C
    ld   a, $0E                                   ; $75BE: $3E $0E
    call label_3DA0                               ; $75C0: $CD $A0 $3D
    ld   hl, wEntitiesSpeedYTable                                ; $75C3: $21 $50 $C2
    add  hl, bc                                   ; $75C6: $09
    ld   [hl], $FE                                ; $75C7: $36 $FE
    call func_017_7E30                            ; $75C9: $CD $30 $7E
    ldh  a, [hActiveEntityState]                               ; $75CC: $F0 $F0
    cp   $02                                      ; $75CE: $FE $02
    jr   nc, jr_017_75E0                          ; $75D0: $30 $0E

    call GetEntityTransitionCountdown             ; $75D2: $CD $05 $0C
    jr   nz, jr_017_75E0                          ; $75D5: $20 $09

jr_017_75D7:
    ld   [hl], $C0                                ; $75D7: $36 $C0
    call IncrementEntityState                     ; $75D9: $CD $12 $3B
    ld   a, $17                                   ; $75DC: $3E $17
    ldh  [hWaveSfx], a                               ; $75DE: $E0 $F3

jr_017_75E0:
    ret                                           ; $75E0: $C9

    nop                                           ; $75E1: $00
    ld   [$00B2], sp                              ; $75E2: $08 $B2 $00
    nop                                           ; $75E5: $00
    db   $10                                      ; $75E6: $10
    or   h                                        ; $75E7: $B4
    nop                                           ; $75E8: $00
    nop                                           ; $75E9: $00
    jr   jr_017_75A2                              ; $75EA: $18 $B6

    nop                                           ; $75EC: $00
    nop                                           ; $75ED: $00
    jr   nz, jr_017_75A8                          ; $75EE: $20 $B8

    nop                                           ; $75F0: $00
    db   $10                                      ; $75F1: $10
    db   $10                                      ; $75F2: $10
    cp   d                                        ; $75F3: $BA
    nop                                           ; $75F4: $00

jr_017_75F5:
    db   $10                                      ; $75F5: $10

jr_017_75F6:
    jr   jr_017_75B4                              ; $75F6: $18 $BC

    nop                                           ; $75F8: $00
    db   $10                                      ; $75F9: $10
    jr   nz, jr_017_7582                          ; $75FA: $20 $86

jr_017_75FC:
    nop                                           ; $75FC: $00
    jr   nz, jr_017_75FF                          ; $75FD: $20 $00

jr_017_75FF:
    adc  b                                        ; $75FF: $88
    nop                                           ; $7600: $00
    jr   nz, jr_017_760B                          ; $7601: $20 $08

    adc  d                                        ; $7603: $8A
    nop                                           ; $7604: $00
    jr   nz, jr_017_7617                          ; $7605: $20 $10

    adc  h                                        ; $7607: $8C

jr_017_7608:
    nop                                           ; $7608: $00
    jr   nz, jr_017_7623                          ; $7609: $20 $18

jr_017_760B:
    adc  [hl]                                     ; $760B: $8E
    nop                                           ; $760C: $00
    jr   nz, @+$22                                ; $760D: $20 $20

    sub  h                                        ; $760F: $94
    nop                                           ; $7610: $00
    jr   nc, jr_017_7613                          ; $7611: $30 $00

jr_017_7613:
    sbc  b                                        ; $7613: $98
    nop                                           ; $7614: $00
    jr   nc, jr_017_761F                          ; $7615: $30 $08

jr_017_7617:
    sbc  d                                        ; $7617: $9A
    nop                                           ; $7618: $00
    jr   nc, jr_017_762B                          ; $7619: $30 $10

    and  h                                        ; $761B: $A4
    nop                                           ; $761C: $00
    jr   nc, jr_017_7637                          ; $761D: $30 $18

jr_017_761F:
    xor  b                                        ; $761F: $A8
    nop                                           ; $7620: $00
    jr   nc, jr_017_7643                          ; $7621: $30 $20

jr_017_7623:
    xor  d                                        ; $7623: $AA
    nop                                           ; $7624: $00
    nop                                           ; $7625: $00
    ld   [$00C2], sp                              ; $7626: $08 $C2 $00
    nop                                           ; $7629: $00

jr_017_762A:
    db   $10                                      ; $762A: $10

jr_017_762B:
    call nz, $00                                  ; $762B: $C4 $00 $00
    jr   jr_017_75F6                              ; $762E: $18 $C6

    nop                                           ; $7630: $00
    nop                                           ; $7631: $00
    jr   nz, jr_017_75FC                          ; $7632: $20 $C8

    nop                                           ; $7634: $00
    db   $10                                      ; $7635: $10
    db   $10                                      ; $7636: $10

jr_017_7637:
    jp   z, $1000                                 ; $7637: $CA $00 $10

    jr   jr_017_7608                              ; $763A: $18 $CC

    nop                                           ; $763C: $00
    db   $10                                      ; $763D: $10
    jr   nz, @-$68                                ; $763E: $20 $96

    nop                                           ; $7640: $00
    jr   nz, jr_017_7643                          ; $7641: $20 $00

jr_017_7643:
    adc  b                                        ; $7643: $88
    nop                                           ; $7644: $00
    jr   nz, jr_017_764F                          ; $7645: $20 $08

    adc  d                                        ; $7647: $8A
    nop                                           ; $7648: $00
    jr   nz, jr_017_765B                          ; $7649: $20 $10

    adc  h                                        ; $764B: $8C
    nop                                           ; $764C: $00
    jr   nz, jr_017_7667                          ; $764D: $20 $18

jr_017_764F:
    adc  [hl]                                     ; $764F: $8E

jr_017_7650:
    nop                                           ; $7650: $00
    jr   nz, @+$22                                ; $7651: $20 $20

    sub  h                                        ; $7653: $94
    nop                                           ; $7654: $00
    jr   nc, jr_017_7657                          ; $7655: $30 $00

jr_017_7657:
    sbc  b                                        ; $7657: $98
    nop                                           ; $7658: $00
    jr   nc, jr_017_7663                          ; $7659: $30 $08

jr_017_765B:
    sbc  d                                        ; $765B: $9A

jr_017_765C:
    nop                                           ; $765C: $00
    jr   nc, jr_017_766F                          ; $765D: $30 $10

    and  h                                        ; $765F: $A4
    nop                                           ; $7660: $00
    jr   nc, jr_017_767B                          ; $7661: $30 $18

jr_017_7663:
    xor  b                                        ; $7663: $A8
    nop                                           ; $7664: $00
    jr   nc, jr_017_7687                          ; $7665: $30 $20

jr_017_7667:
    xor  d                                        ; $7667: $AA
    nop                                           ; $7668: $00
    nop                                           ; $7669: $00
    ld   [$00D2], sp                              ; $766A: $08 $D2 $00
    nop                                           ; $766D: $00
    db   $10                                      ; $766E: $10

jr_017_766F:
    call nc, $00                                  ; $766F: $D4 $00 $00
    jr   @-$28                                    ; $7672: $18 $D6

    nop                                           ; $7674: $00
    nop                                           ; $7675: $00
    jr   nz, jr_017_7650                          ; $7676: $20 $D8

    nop                                           ; $7678: $00
    db   $10                                      ; $7679: $10
    db   $10                                      ; $767A: $10

jr_017_767B:
    jp   c, $1000                                 ; $767B: $DA $00 $10

    jr   jr_017_765C                              ; $767E: $18 $DC

    nop                                           ; $7680: $00
    db   $10                                      ; $7681: $10
    jr   nz, jr_017_762A                          ; $7682: $20 $A6

    nop                                           ; $7684: $00
    jr   nz, jr_017_7687                          ; $7685: $20 $00

jr_017_7687:
    adc  b                                        ; $7687: $88
    nop                                           ; $7688: $00
    jr   nz, jr_017_7693                          ; $7689: $20 $08

    adc  d                                        ; $768B: $8A
    nop                                           ; $768C: $00
    jr   nz, jr_017_769F                          ; $768D: $20 $10

    adc  h                                        ; $768F: $8C
    nop                                           ; $7690: $00
    jr   nz, jr_017_76AB                          ; $7691: $20 $18

jr_017_7693:
    adc  [hl]                                     ; $7693: $8E
    nop                                           ; $7694: $00
    jr   nz, @+$22                                ; $7695: $20 $20

    sub  h                                        ; $7697: $94
    nop                                           ; $7698: $00
    jr   nc, jr_017_769B                          ; $7699: $30 $00

jr_017_769B:
    sbc  b                                        ; $769B: $98
    nop                                           ; $769C: $00
    jr   nc, jr_017_76A7                          ; $769D: $30 $08

jr_017_769F:
    sbc  d                                        ; $769F: $9A
    nop                                           ; $76A0: $00
    jr   nc, jr_017_76B3                          ; $76A1: $30 $10

    and  h                                        ; $76A3: $A4
    nop                                           ; $76A4: $00
    jr   nc, jr_017_76BF                          ; $76A5: $30 $18

jr_017_76A7:
    xor  b                                        ; $76A7: $A8
    nop                                           ; $76A8: $00
    jr   nc, @+$22                                ; $76A9: $30 $20

jr_017_76AB:
    xor  d                                        ; $76AB: $AA
    nop                                           ; $76AC: $00
    nop                                           ; $76AD: $00
    nop                                           ; $76AE: $00
    nop                                           ; $76AF: $00
    nop                                           ; $76B0: $00
    nop                                           ; $76B1: $00
    nop                                           ; $76B2: $00

jr_017_76B3:
    ld   bc, $0101                                ; $76B3: $01 $01 $01
    ld   bc, $0202                                ; $76B6: $01 $02 $02
    ld   [bc], a                                  ; $76B9: $02
    inc  bc                                       ; $76BA: $03
    inc  bc                                       ; $76BB: $03
    inc  b                                        ; $76BC: $04
    dec  b                                        ; $76BD: $05
    dec  b                                        ; $76BE: $05

jr_017_76BF:
    ld   b, $06                                   ; $76BF: $06 $06
    ld   b, $07                                   ; $76C1: $06 $07
    rlca                                          ; $76C3: $07
    rlca                                          ; $76C4: $07
    rlca                                          ; $76C5: $07
    ld   [$0808], sp                              ; $76C6: $08 $08 $08
    ld   [$0808], sp                              ; $76C9: $08 $08 $08
    rlca                                          ; $76CC: $07
    rlca                                          ; $76CD: $07
    rlca                                          ; $76CE: $07
    rlca                                          ; $76CF: $07
    ld   b, $06                                   ; $76D0: $06 $06
    ld   b, $05                                   ; $76D2: $06 $05
    dec  b                                        ; $76D4: $05
    inc  b                                        ; $76D5: $04
    inc  bc                                       ; $76D6: $03
    ld   [bc], a                                  ; $76D7: $02
    ld   [bc], a                                  ; $76D8: $02
    ld   [bc], a                                  ; $76D9: $02
    ld   bc, $0101                                ; $76DA: $01 $01 $01
    ld   bc, $003E                                ; $76DD: $01 $3E $00
    ld   [$C3C0], a                               ; $76E0: $EA $C0 $C3
    ldh  a, [hBaseScrollY]                               ; $76E3: $F0 $97
    ld   d, a                                     ; $76E5: $57
    sra  a                                        ; $76E6: $CB $2F
    add  d                                        ; $76E8: $82
    ldh  [hScratch0], a                               ; $76E9: $E0 $D7
    ldh  a, [hFrameCounter]                               ; $76EB: $F0 $E7
    and  $03                                      ; $76ED: $E6 $03
    jr   nz, jr_017_76FD                          ; $76EF: $20 $0C

    ld   a, [$D00F]                               ; $76F1: $FA $0F $D0
    inc  a                                        ; $76F4: $3C
    cp   $31                                      ; $76F5: $FE $31
    jr   c, jr_017_76FA                           ; $76F7: $38 $01

    xor  a                                        ; $76F9: $AF

jr_017_76FA:
    ld   [$D00F], a                               ; $76FA: $EA $0F $D0

jr_017_76FD:
    ld   a, [$D00F]                               ; $76FD: $FA $0F $D0
    ld   e, a                                     ; $7700: $5F
    ld   d, b                                     ; $7701: $50
    ld   hl, $76AD                                ; $7702: $21 $AD $76
    add  hl, de                                   ; $7705: $19
    ldh  a, [$FFEC]                               ; $7706: $F0 $EC
    add  [hl]                                     ; $7708: $86
    ld   hl, hScratch0                                ; $7709: $21 $D7 $FF
    sub  [hl]                                     ; $770C: $96
    ldh  [$FFEC], a                               ; $770D: $E0 $EC
    cp   $A8                                      ; $770F: $FE $A8
    jp   nc, label_017_7CC2                       ; $7711: $D2 $C2 $7C

    ldh  a, [hIsGBC]                               ; $7714: $F0 $FE
    and  a                                        ; $7716: $A7
    jr   nz, jr_017_7739                          ; $7717: $20 $20

    ld   a, [$D000]                               ; $7719: $FA $00 $D0
    rla                                           ; $771C: $17
    rla                                           ; $771D: $17
    and  $FC                                      ; $771E: $E6 $FC
    ld   e, a                                     ; $7720: $5F
    rla                                           ; $7721: $17
    rla                                           ; $7722: $17
    rla                                           ; $7723: $17
    rla                                           ; $7724: $17
    and  $C0                                      ; $7725: $E6 $C0
    add  e                                        ; $7727: $83
    ld   e, a                                     ; $7728: $5F
    ld   d, b                                     ; $7729: $50
    ld   hl, $75E1                                ; $772A: $21 $E1 $75
    add  hl, de                                   ; $772D: $19
    ld   c, $11                                   ; $772E: $0E $11
    call label_3CE6                                    ; $7730: $CD $E6 $3C
    ld   a, $11                                   ; $7733: $3E $11
    call label_3DA0                                    ; $7735: $CD $A0 $3D
    ret                                           ; $7738: $C9

jr_017_7739:
    ld   hl, $DE01                                ; $7739: $21 $01 $DE
    ld   a, $27                                   ; $773C: $3E $27
    ld   [hl+], a                                 ; $773E: $22
    ld   a, $76                                   ; $773F: $3E $76
    ld   [hl+], a                                 ; $7741: $22
    ld   a, $60                                   ; $7742: $3E $60
    ld   [hl+], a                                 ; $7744: $22
    ld   a, $17                                   ; $7745: $3E $17
    ld   [hl], a                                  ; $7747: $77
    jp   $0BD7                                    ; $7748: $C3 $D7 $0B

    nop                                           ; $774B: $00
    nop                                           ; $774C: $00
    ld   [hl], b                                  ; $774D: $70
    rlca                                          ; $774E: $07
    ld   [$5E08], sp                              ; $774F: $08 $08 $5E
    rlca                                          ; $7752: $07
    ld   [$6010], sp                              ; $7753: $08 $10 $60
    rlca                                          ; $7756: $07
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7757: $21 $40 $C3
    add  hl, bc                                   ; $775A: $09
    ld   [hl], $C3                                ; $775B: $36 $C3
    ld   hl, $774B                                ; $775D: $21 $4B $77
    ld   c, $03                                   ; $7760: $0E $03
    call label_3CE6                                    ; $7762: $CD $E6 $3C
    ret                                           ; $7765: $C9

    ld   d, b                                     ; $7766: $50
    nop                                           ; $7767: $00
    ld   d, d                                     ; $7768: $52
    nop                                           ; $7769: $00
    ld   d, h                                     ; $776A: $54
    nop                                           ; $776B: $00
    ld   d, [hl]                                  ; $776C: $56
    nop                                           ; $776D: $00
    ld   d, a                                     ; $776E: $57
    nop                                           ; $776F: $00
    ld   e, d                                     ; $7770: $5A
    nop                                           ; $7771: $00
    ldh  a, [hFrameCounter]                               ; $7772: $F0 $E7
    and  $07                                      ; $7774: $E6 $07
    jr   nz, jr_017_7784                          ; $7776: $20 $0C

    ld   hl, $C3B0                                ; $7778: $21 $B0 $C3
    add  hl, bc                                   ; $777B: $09
    ld   a, [hl]                                  ; $777C: $7E
    inc  a                                        ; $777D: $3C
    cp   $06                                      ; $777E: $FE $06
    jr   nz, jr_017_7783                          ; $7780: $20 $01

    xor  a                                        ; $7782: $AF

jr_017_7783:
    ld   [hl], a                                  ; $7783: $77

jr_017_7784:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7784: $21 $40 $C3
    add  hl, bc                                   ; $7787: $09
    ld   [hl], $C1                                ; $7788: $36 $C1
    ld   hl, wEntitiesSpeedXTable                                ; $778A: $21 $40 $C2
    add  hl, bc                                   ; $778D: $09
    ld   a, [hl]                                  ; $778E: $7E
    and  $80                                      ; $778F: $E6 $80
    jr   z, jr_017_7798                           ; $7791: $28 $05

    ld   hl, $FFED                                ; $7793: $21 $ED $FF
    set  5, [hl]                                  ; $7796: $CB $EE

jr_017_7798:
    ld   de, $7766                                ; $7798: $11 $66 $77
    call RenderSimpleEntityWithSpriteVariantToOAM                                    ; $779B: $CD $77 $3C
    call func_017_7E3A                            ; $779E: $CD $3A $7E
    ldh  a, [$FFEE]                               ; $77A1: $F0 $EE
    cp   $B0                                      ; $77A3: $FE $B0
    jp   nc, label_017_7CC2                       ; $77A5: $D2 $C2 $7C

    ret                                           ; $77A8: $C9

    nop                                           ; $77A9: $00
    ld   [$000E], sp                              ; $77AA: $08 $0E $00
    nop                                           ; $77AD: $00
    db   $10                                      ; $77AE: $10
    ld   e, $00                                   ; $77AF: $1E $00
    nop                                           ; $77B1: $00
    jr   jr_017_77E2                              ; $77B2: $18 $2E

    nop                                           ; $77B4: $00
    stop                                          ; $77B5: $10 $00
    ld   d, b                                     ; $77B7: $50
    nop                                           ; $77B8: $00
    db   $10                                      ; $77B9: $10
    ld   [$0052], sp                              ; $77BA: $08 $52 $00
    db   $10                                      ; $77BD: $10
    db   $10                                      ; $77BE: $10
    ld   d, h                                     ; $77BF: $54
    nop                                           ; $77C0: $00
    db   $10                                      ; $77C1: $10
    jr   @+$5A                                    ; $77C2: $18 $58

    nop                                           ; $77C4: $00
    nop                                           ; $77C5: $00
    ld   [$000E], sp                              ; $77C6: $08 $0E $00
    nop                                           ; $77C9: $00
    db   $10                                      ; $77CA: $10
    ld   e, $00                                   ; $77CB: $1E $00
    nop                                           ; $77CD: $00
    jr   jr_017_77FE                              ; $77CE: $18 $2E

    nop                                           ; $77D0: $00
    stop                                          ; $77D1: $10 $00
    ld   h, b                                     ; $77D3: $60
    nop                                           ; $77D4: $00
    db   $10                                      ; $77D5: $10
    ld   [$0062], sp                              ; $77D6: $08 $62 $00
    db   $10                                      ; $77D9: $10
    db   $10                                      ; $77DA: $10
    ld   h, h                                     ; $77DB: $64
    nop                                           ; $77DC: $00
    db   $10                                      ; $77DD: $10
    jr   @+$6A                                    ; $77DE: $18 $68

    nop                                           ; $77E0: $00
    nop                                           ; $77E1: $00

jr_017_77E2:
    nop                                           ; $77E2: $00
    nop                                           ; $77E3: $00
    ld   bc, $0202                                ; $77E4: $01 $02 $02
    ld   [bc], a                                  ; $77E7: $02
    ld   bc, $0000                                ; $77E8: $01 $00 $00
    nop                                           ; $77EB: $00
    nop                                           ; $77EC: $00
    ld   bc, $0101                                ; $77ED: $01 $01 $01
    ld   bc, $4021                                ; $77F0: $01 $21 $40
    jp   $3609                                    ; $77F3: $C3 $09 $36

    rst  $00                                      ; $77F6: $C7
    ld   a, $00                                   ; $77F7: $3E $00
    ld   [$C3C0], a                               ; $77F9: $EA $C0 $C3
    ldh  a, [hFrameCounter]                               ; $77FC: $F0 $E7

jr_017_77FE:
    rra                                           ; $77FE: $1F
    rra                                           ; $77FF: $1F
    rra                                           ; $7800: $1F
    rra                                           ; $7801: $1F
    and  $07                                      ; $7802: $E6 $07
    ld   e, a                                     ; $7804: $5F
    ld   d, b                                     ; $7805: $50
    ld   hl, $77E1                                ; $7806: $21 $E1 $77
    add  hl, de                                   ; $7809: $19
    ldh  a, [$FFEC]                               ; $780A: $F0 $EC
    add  [hl]                                     ; $780C: $86
    ldh  [$FFEC], a                               ; $780D: $E0 $EC
    ldh  a, [hIsGBC]                               ; $780F: $F0 $FE
    and  a                                        ; $7811: $A7
    jr   nz, jr_017_7826                          ; $7812: $20 $12

    ld   hl, $77A9                                ; $7814: $21 $A9 $77
    ldh  a, [hFrameCounter]                               ; $7817: $F0 $E7
    and  $10                                      ; $7819: $E6 $10
    jr   z, jr_017_7820                           ; $781B: $28 $03

    ld   hl, $77C5                                ; $781D: $21 $C5 $77

jr_017_7820:
    ld   c, $07                                   ; $7820: $0E $07
    call label_3CE6                                    ; $7822: $CD $E6 $3C
    ret                                           ; $7825: $C9

jr_017_7826:
    ld   hl, $DE01                                ; $7826: $21 $01 $DE
    ld   a, $27                                   ; $7829: $3E $27
    ld   [hl+], a                                 ; $782B: $22
    ld   a, $72                                   ; $782C: $3E $72
    ld   [hl+], a                                 ; $782E: $22
    ld   a, $E4                                   ; $782F: $3E $E4
    ld   [hl+], a                                 ; $7831: $22
    ld   a, $17                                   ; $7832: $3E $17
    ld   [hl], a                                  ; $7834: $77
    jp   $0BD7                                    ; $7835: $C3 $D7 $0B

    ld   e, d                                     ; $7838: $5A
    inc  bc                                       ; $7839: $03
    ld   l, d                                     ; $783A: $6A
    inc  bc                                       ; $783B: $03
    ld   hl, wEntitiesPhysicsFlagsTable           ; $783C: $21 $40 $C3
    add  hl, bc                                   ; $783F: $09
    ld   [hl], $C1                                ; $7840: $36 $C1
    ld   a, c                                     ; $7842: $79
    rla                                           ; $7843: $17
    and  $06                                      ; $7844: $E6 $06
    ld   e, a                                     ; $7846: $5F
    ldh  a, [hFrameCounter]                               ; $7847: $F0 $E7
    rra                                           ; $7849: $1F
    rra                                           ; $784A: $1F
    rra                                           ; $784B: $1F
    rra                                           ; $784C: $1F
    add  e                                        ; $784D: $83
    and  $07                                      ; $784E: $E6 $07
    ld   e, a                                     ; $7850: $5F
    ld   d, b                                     ; $7851: $50
    ld   hl, $77E9                                ; $7852: $21 $E9 $77
    add  hl, de                                   ; $7855: $19
    ldh  a, [$FFEC]                               ; $7856: $F0 $EC
    add  [hl]                                     ; $7858: $86
    ldh  [$FFEC], a                               ; $7859: $E0 $EC
    ldh  a, [hIsGBC]                               ; $785B: $F0 $FE
    and  a                                        ; $785D: $A7
    jr   nz, jr_017_7867                          ; $785E: $20 $07

    ld   de, $7838                                ; $7860: $11 $38 $78
    call RenderSimpleEntityWithSpriteVariantToOAM                                    ; $7863: $CD $77 $3C
    ret                                           ; $7866: $C9

jr_017_7867:
    ld   hl, $DE01                                ; $7867: $21 $01 $DE
    ld   a, $27                                   ; $786A: $3E $27
    ld   [hl+], a                                 ; $786C: $22
    ld   a, $73                                   ; $786D: $3E $73
    ld   [hl+], a                                 ; $786F: $22
    ld   a, $06                                   ; $7870: $3E $06
    ld   [hl+], a                                 ; $7872: $22
    ld   a, $17                                   ; $7873: $3E $17
    ld   [hl], a                                  ; $7875: $77
    jp   $0BD7                                    ; $7876: $C3 $D7 $0B

    ld   d, h                                     ; $7879: $54
    inc  b                                        ; $787A: $04
    ld   h, h                                     ; $787B: $64
    inc  b                                        ; $787C: $04
    ld   h, h                                     ; $787D: $64
    inc  h                                        ; $787E: $24
    ld   d, h                                     ; $787F: $54
    inc  h                                        ; $7880: $24
    ld   c, [hl]                                  ; $7881: $4E
    inc  b                                        ; $7882: $04
    ld   a, [hl]                                  ; $7883: $7E
    inc  b                                        ; $7884: $04
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7885: $21 $40 $C3
    add  hl, bc                                   ; $7888: $09
    ld   [hl], $C2                                ; $7889: $36 $C2
    ldh  a, [$FFF1]                               ; $788B: $F0 $F1
    cp   $01                                      ; $788D: $FE $01
    jr   z, jr_017_78B7                           ; $788F: $28 $26

    cp   $02                                      ; $7891: $FE $02
    jr   z, jr_017_78C4                           ; $7893: $28 $2F

    ld   a, [$D00A]                               ; $7895: $FA $0A $D0

jr_017_7898:
    ld   e, a                                     ; $7898: $5F
    ld   d, b                                     ; $7899: $50
    ld   hl, Data_017_634C                        ; $789A: $21 $4C $63
    add  hl, de                                   ; $789D: $19
    ld   a, [hl]                                  ; $789E: $7E
    sub  $04                                      ; $789F: $D6 $04

jr_017_78A1:
    cpl                                           ; $78A1: $2F
    inc  a                                        ; $78A2: $3C
    sra  a                                        ; $78A3: $CB $2F
    ld   e, a                                     ; $78A5: $5F
    ldh  a, [$FFEC]                               ; $78A6: $F0 $EC
    add  e                                        ; $78A8: $83
    ldh  [$FFEC], a                               ; $78A9: $E0 $EC
    ldh  a, [hIsGBC]                               ; $78AB: $F0 $FE
    and  a                                        ; $78AD: $A7
    jr   nz, jr_017_78DD                          ; $78AE: $20 $2D

    ld   de, $7879                                ; $78B0: $11 $79 $78
    call RenderAnimatedActiveEntity               ; $78B3: $CD $C0 $3B
    ret                                           ; $78B6: $C9

jr_017_78B7:
    ld   a, [$D00A]                               ; $78B7: $FA $0A $D0
    add  $06                                      ; $78BA: $C6 $06
    cp   $2B                                      ; $78BC: $FE $2B
    jr   c, jr_017_78C2                           ; $78BE: $38 $02

    sub  $2B                                      ; $78C0: $D6 $2B

jr_017_78C2:
    jr   jr_017_7898                              ; $78C2: $18 $D4

jr_017_78C4:
    ld   a, [$D00A]                               ; $78C4: $FA $0A $D0
    add  $18                                      ; $78C7: $C6 $18
    cp   $2B                                      ; $78C9: $FE $2B
    jr   c, jr_017_78CF                           ; $78CB: $38 $02

    sub  $2B                                      ; $78CD: $D6 $2B

jr_017_78CF:
    ld   e, a                                     ; $78CF: $5F
    ld   d, $00                                   ; $78D0: $16 $00
    ld   hl, Data_017_634C                        ; $78D2: $21 $4C $63
    add  hl, de                                   ; $78D5: $19
    ld   a, [hl]                                  ; $78D6: $7E
    sub  $04                                      ; $78D7: $D6 $04
    sra  a                                        ; $78D9: $CB $2F
    jr   jr_017_78A1                              ; $78DB: $18 $C4

jr_017_78DD:
    ld   hl, $DE01                                ; $78DD: $21 $01 $DE
    ld   a, $27                                   ; $78E0: $3E $27
    ld   [hl+], a                                 ; $78E2: $22
    ld   a, $73                                   ; $78E3: $3E $73
    ld   [hl+], a                                 ; $78E5: $22
    ld   a, $4B                                   ; $78E6: $3E $4B
    ld   [hl+], a                                 ; $78E8: $22
    ld   a, $17                                   ; $78E9: $3E $17
    ld   [hl], a                                  ; $78EB: $77
    jp   $0BD7                                    ; $78EC: $C3 $D7 $0B

    ld   [hl], d                                  ; $78EF: $72
    nop                                           ; $78F0: $00
    ld   [hl], d                                  ; $78F1: $72
    jr   nz, @+$76                                ; $78F2: $20 $74

    nop                                           ; $78F4: $00
    ld   [hl], h                                  ; $78F5: $74
    jr   nz, @+$78                                ; $78F6: $20 $76

    nop                                           ; $78F8: $00
    db   $76                                      ; $78F9: $76
    jr   nz, jr_017_7974                          ; $78FA: $20 $78

    nop                                           ; $78FC: $00
    ld   a, b                                     ; $78FD: $78
    jr   nz, jr_017_797A                          ; $78FE: $20 $7A

    nop                                           ; $7900: $00
    ld   a, d                                     ; $7901: $7A
    jr   nz, jr_017_7980                          ; $7902: $20 $7C

    nop                                           ; $7904: $00
    ld   a, h                                     ; $7905: $7C
    jr   nz, @+$0A                                ; $7906: $20 $08

    ld   b, $06                                   ; $7908: $06 $06
    ld   b, $06                                   ; $790A: $06 $06
    ld   [$4021], sp                              ; $790C: $08 $21 $40
    jp   $3609                                    ; $790F: $C3 $09 $36

    jp   nz, $FEF0                                ; $7912: $C2 $F0 $FE

    and  a                                        ; $7915: $A7
    jr   z, jr_017_791D                           ; $7916: $28 $05

    call func_017_795E                            ; $7918: $CD $5E $79
    jr   jr_017_7923                              ; $791B: $18 $06

jr_017_791D:
    ld   de, $78EF                                ; $791D: $11 $EF $78
    call RenderAnimatedActiveEntity               ; $7920: $CD $C0 $3B

jr_017_7923:
    call GetEntityTransitionCountdown             ; $7923: $CD $05 $0C
    jr   nz, jr_017_793E                          ; $7926: $20 $16

    push hl                                       ; $7928: $E5
    ld   hl, $C3B0                                ; $7929: $21 $B0 $C3
    add  hl, bc                                   ; $792C: $09
    ld   a, [hl]                                  ; $792D: $7E
    inc  a                                        ; $792E: $3C
    cp   $06                                      ; $792F: $FE $06
    jr   nz, jr_017_7934                          ; $7931: $20 $01

    xor  a                                        ; $7933: $AF

jr_017_7934:
    ld   [hl], a                                  ; $7934: $77
    ld   e, a                                     ; $7935: $5F
    ld   d, b                                     ; $7936: $50
    ld   hl, $7907                                ; $7937: $21 $07 $79
    add  hl, de                                   ; $793A: $19
    ld   a, [hl]                                  ; $793B: $7E
    pop  hl                                       ; $793C: $E1
    ld   [hl], a                                  ; $793D: $77

jr_017_793E:
    ld   hl, wEntitiesUnknowTableY                ; $793E: $21 $D0 $C3
    add  hl, bc                                   ; $7941: $09
    ld   a, [hl]                                  ; $7942: $7E
    inc  a                                        ; $7943: $3C
    ld   [hl], a                                  ; $7944: $77
    and  $1F                                      ; $7945: $E6 $1F
    jr   nz, jr_017_7953                          ; $7947: $20 $0A

    ld   hl, wEntitiesSpeedYTable                                ; $7949: $21 $50 $C2
    add  hl, bc                                   ; $794C: $09
    ld   a, [hl]                                  ; $794D: $7E
    cp   $FF                                      ; $794E: $FE $FF
    jr   z, jr_017_7953                           ; $7950: $28 $01

    inc  [hl]                                     ; $7952: $34

jr_017_7953:
    call func_017_7E2D                            ; $7953: $CD $2D $7E
    ldh  a, [$FFEE]                               ; $7956: $F0 $EE
    cp   $B0                                      ; $7958: $FE $B0
    jp   nc, label_017_7CC2                       ; $795A: $D2 $C2 $7C

    ret                                           ; $795D: $C9

func_017_795E:
    ld   hl, $DE01                                ; $795E: $21 $01 $DE
    ld   a, $27                                   ; $7961: $3E $27
    ld   [hl+], a                                 ; $7963: $22
    ld   a, $73                                   ; $7964: $3E $73
    ld   [hl+], a                                 ; $7966: $22
    ld   a, $C7                                   ; $7967: $3E $C7
    ld   [hl+], a                                 ; $7969: $22
    ld   a, $17                                   ; $796A: $3E $17
    ld   [hl], a                                  ; $796C: $77
    jp   $0BD7                                    ; $796D: $C3 $D7 $0B

    ret                                           ; $7970: $C9

func_017_7971:
    ldh  a, [hIsGBC]                               ; $7971: $F0 $FE
    and  a                                        ; $7973: $A7

jr_017_7974:
    ret  z                                        ; $7974: $C8

    ld   hl, $DE01                                ; $7975: $21 $01 $DE
    ld   a, $27                                   ; $7978: $3E $27

jr_017_797A:
    ld   [hl+], a                                 ; $797A: $22
    ld   a, $74                                   ; $797B: $3E $74
    ld   [hl+], a                                 ; $797D: $22
    ld   a, $E3                                   ; $797E: $3E $E3

jr_017_7980:
    ld   [hl+], a                                 ; $7980: $22
    ld   a, $17                                   ; $7981: $3E $17
    ld   [hl], a                                  ; $7983: $77
    jp   $0BD7                                    ; $7984: $C3 $D7 $0B

Data_017_7987::
    db   $D0, $01, $D2, $01, $D4, $01, $D6, $01  ; $7987
    db   $D8, $01, $DA, $01, $DC, $01, $DE, $01  ; $798F
    db   $E0, $01, $E2, $01, $E4, $01, $E6, $01  ; $7997
    db   $E8, $01, $EA, $01, $EC

Func_017_79A4::
    ld   bc, $01EE                                ; $79A4: $01 $EE $01
    ld   hl, $C2C0                                ; $79A7: $21 $C0 $C2
    add  hl, bc                                   ; $79AA: $09
    ld   a, [hl]                                  ; $79AB: $7E
    add  $50                                      ; $79AC: $C6 $50
    ldh  [hScratch0], a                               ; $79AE: $E0 $D7
    call func_017_7A01                            ; $79B0: $CD $01 $7A
    ld   de, Data_017_7987                        ; $79B3: $11 $87 $79
    call func_017_7A29                            ; $79B6: $CD $29 $7A
    call label_BFB                                ; $79B9: $CD $FB $0B
    ret  z                                        ; $79BC: $C8

    call func_017_7E2D                            ; $79BD: $CD $2D $7E
    ret                                           ; $79C0: $C9

    add  b                                        ; $79C1: $80
    ld   h, $95                                   ; $79C2: $26 $95
    ld   h, e                                     ; $79C4: $63
    jr   nz, jr_017_7A01                          ; $79C5: $20 $3A

    ld   [hl], l                                  ; $79C7: $75
    ld   l, e                                     ; $79C8: $6B
    and  b                                        ; $79C9: $A0
    ld   d, c                                     ; $79CA: $51
    dec  [hl]                                     ; $79CB: $35
    ld   [hl], e                                  ; $79CC: $73
    ld   [$187D], sp                              ; $79CD: $08 $7D $18
    ld   a, a                                     ; $79D0: $7F
    xor  l                                        ; $79D1: $AD
    ld   a, b                                     ; $79D2: $78
    ld   sp, hl                                   ; $79D3: $F9
    ld   a, [hl]                                  ; $79D4: $7E
    ld   d, b                                     ; $79D5: $50
    ld   e, h                                     ; $79D6: $5C
    jp   c, $1276                                 ; $79D7: $DA $76 $12

    ld   b, b                                     ; $79DA: $40
    cp   e                                        ; $79DB: $BB
    ld   l, d                                     ; $79DC: $6A
    dec  d                                        ; $79DD: $15
    jr   nc, @-$42                                ; $79DE: $30 $BC

    ld   h, [hl]                                  ; $79E0: $66
    rla                                           ; $79E1: $17
    inc  d                                        ; $79E2: $14
    cp   l                                        ; $79E3: $BD
    ld   e, [hl]                                  ; $79E4: $5E
    rst  $10                                      ; $79E5: $D7
    inc  b                                        ; $79E6: $04
    db   $FD                                      ; $79E7: $FD
    ld   d, [hl]                                  ; $79E8: $56
    scf                                           ; $79E9: $37
    dec  b                                        ; $79EA: $05
    dec  e                                        ; $79EB: $1D
    ld   d, a                                     ; $79EC: $57
    sub  a                                        ; $79ED: $97
    add  hl, bc                                   ; $79EE: $09
    dec  a                                        ; $79EF: $3D
    ld   e, e                                     ; $79F0: $5B
    push af                                       ; $79F1: $F5
    add  hl, bc                                   ; $79F2: $09
    ld   e, h                                     ; $79F3: $5C
    ld   e, e                                     ; $79F4: $5B
    db   $10                                      ; $79F5: $10
    ld   a, [bc]                                  ; $79F6: $0A
    ld   e, d                                     ; $79F7: $5A
    ld   e, e                                     ; $79F8: $5B
    ld   c, e                                     ; $79F9: $4B
    ld   b, $79                                   ; $79FA: $06 $79
    ld   d, a                                     ; $79FC: $57
    and  b                                        ; $79FD: $A0
    ld   [bc], a                                  ; $79FE: $02
    sub  l                                        ; $79FF: $95
    ld   d, a                                     ; $7A00: $57

func_017_7A01:
jr_017_7A01:
    ldh  a, [hIsGBC]                               ; $7A01: $F0 $FE
    and  a                                        ; $7A03: $A7
    ret  z                                        ; $7A04: $C8

    ld   a, [wCreditsSubscene]                               ; $7A05: $FA $0E $D0
    cp   $13                                      ; $7A08: $FE $13
    ret  nc                                       ; $7A0A: $D0

    ldh  a, [hFrameCounter]                               ; $7A0B: $F0 $E7
    srl  a                                        ; $7A0D: $CB $3F
    and  $3C                                      ; $7A0F: $E6 $3C
    ld   e, a                                     ; $7A11: $5F
    ld   d, $00                                   ; $7A12: $16 $00
    ld   hl, $79C1                                ; $7A14: $21 $C1 $79
    add  hl, de                                   ; $7A17: $19
    ld   de, $DC5C                                ; $7A18: $11 $5C $DC

jr_017_7A1B:
    ld   a, [hl+]                                 ; $7A1B: $2A
    ld   [de], a                                  ; $7A1C: $12
    inc  de                                       ; $7A1D: $13
    ld   a, e                                     ; $7A1E: $7B
    and  $03                                      ; $7A1F: $E6 $03
    jr   nz, jr_017_7A1B                          ; $7A21: $20 $F8

    ld   a, $02                                   ; $7A23: $3E $02
    ld   [$DDD1], a                               ; $7A25: $EA $D1 $DD
    ret                                           ; $7A28: $C9

func_017_7A29:
    push bc                                       ; $7A29: $C5
    push de                                       ; $7A2A: $D5
    ldh  a, [hScratch0]                               ; $7A2B: $F0 $D7
    ld   e, a                                     ; $7A2D: $5F
    ld   d, b                                     ; $7A2E: $50
    ld   hl, wOAMBuffer                                ; $7A2F: $21 $00 $C0
    add  hl, de                                   ; $7A32: $19
    push hl                                       ; $7A33: $E5
    pop  de                                       ; $7A34: $D1
    ldh  a, [$FFEC]                               ; $7A35: $F0 $EC
    ld   [de], a                                  ; $7A37: $12
    inc  de                                       ; $7A38: $13
    ld   a, [$C155]                               ; $7A39: $FA $55 $C1
    ld   c, a                                     ; $7A3C: $4F
    ldh  a, [$FFED]                               ; $7A3D: $F0 $ED
    and  $20                                      ; $7A3F: $E6 $20
    rra                                           ; $7A41: $1F
    rra                                           ; $7A42: $1F
    ld   hl, $FFEE                                ; $7A43: $21 $EE $FF
    add  [hl]                                     ; $7A46: $86
    sub  c                                        ; $7A47: $91
    ld   [de], a                                  ; $7A48: $12
    inc  de                                       ; $7A49: $13
    ldh  a, [$FFF1]                               ; $7A4A: $F0 $F1
    ld   c, a                                     ; $7A4C: $4F
    ld   b, $00                                   ; $7A4D: $06 $00
    sla  c                                        ; $7A4F: $CB $21
    rl   b                                        ; $7A51: $CB $10
    sla  c                                        ; $7A53: $CB $21
    rl   b                                        ; $7A55: $CB $10
    pop  hl                                       ; $7A57: $E1
    add  hl, bc                                   ; $7A58: $09
    ld   a, [hl+]                                 ; $7A59: $2A
    ld   [de], a                                  ; $7A5A: $12
    inc  de                                       ; $7A5B: $13
    ld   a, [hl+]                                 ; $7A5C: $2A
    push hl                                       ; $7A5D: $E5
    ld   hl, $FFED                                ; $7A5E: $21 $ED $FF
    xor  [hl]                                     ; $7A61: $AE
    ld   [de], a                                  ; $7A62: $12
    inc  de                                       ; $7A63: $13
    ldh  a, [$FFEC]                               ; $7A64: $F0 $EC
    ld   [de], a                                  ; $7A66: $12
    inc  de                                       ; $7A67: $13
    ld   a, [$C155]                               ; $7A68: $FA $55 $C1
    ld   c, a                                     ; $7A6B: $4F
    ldh  a, [$FFED]                               ; $7A6C: $F0 $ED
    and  $20                                      ; $7A6E: $E6 $20
    xor  $20                                      ; $7A70: $EE $20
    rra                                           ; $7A72: $1F
    rra                                           ; $7A73: $1F
    ld   hl, $FFEE                                ; $7A74: $21 $EE $FF
    sub  c                                        ; $7A77: $91
    add  [hl]                                     ; $7A78: $86
    ld   [de], a                                  ; $7A79: $12
    inc  de                                       ; $7A7A: $13
    pop  hl                                       ; $7A7B: $E1
    ld   a, [hl+]                                 ; $7A7C: $2A
    ld   [de], a                                  ; $7A7D: $12
    inc  de                                       ; $7A7E: $13
    ld   a, [hl]                                  ; $7A7F: $7E
    ld   hl, $FFED                                ; $7A80: $21 $ED $FF
    xor  [hl]                                     ; $7A83: $AE
    ld   [de], a                                  ; $7A84: $12
    pop  bc                                       ; $7A85: $C1
    ret                                           ; $7A86: $C9

EndingOwlStairClimbingEntityHandler::
    ld   hl, $C2B0                                ; $7A87: $21 $B0 $C2
    add  hl, bc                                   ; $7A8A: $09
    ld   a, [hl]                                  ; $7A8B: $7E
    JP_TABLE                                      ; $7A8C: $C7
._00 dw Func_017_7AB1
._01 dw $7B99
._02 dw $7C1B
._03 dw $79A7
._04 dw $77F1
._05 dw $783C
._06 dw $7772
._07 dw $7757
._08 dw $7885
._09 dw $790D
._0A dw $76DE
._0B dw $75AA
._0C dw $7545
._0D dw $74CB
._0E dw $7398
._0F dw $7171
._10 dw $725F
._11 dw $7970

Func_017_7AB1::
    call func_017_7B5F                            ; $7AB1: $CD $5F $7B
    ldh  a, [hActiveEntityState]                  ; $7AB4: $F0 $F0
    JP_TABLE                                      ; $7AB6: $C7
._00 dw Func_017_7AC1
._01 dw Func_017_7B06
._02 dw Func_017_7B41
._03 dw Func_017_7B43
._04 dw Func_017_7B5B

Func_017_7AC1::
    ldh  a, [$FFEC]                               ; $7AC1: $F0 $EC
    cp   $60                                      ; $7AC3: $FE $60
    jp   z, $3B12                                 ; $7AC5: $CA $12 $3B

    ld   hl, wEntitiesSpeedYTable                                ; $7AC8: $21 $50 $C2
    add  hl, bc                                   ; $7ACB: $09
    ld   [hl], $08                                ; $7ACC: $36 $08
    call func_017_7E30                            ; $7ACE: $CD $30 $7E
    ld   hl, wEntitiesPosYTable                                ; $7AD1: $21 $10 $C2
    add  hl, bc                                   ; $7AD4: $09
    ld   a, [hl]                                  ; $7AD5: $7E
    cp   $F0                                      ; $7AD6: $FE $F0
    jr   nz, jr_017_7AEB                          ; $7AD8: $20 $11

    ld   hl, $C2C0                                ; $7ADA: $21 $C0 $C2
    add  hl, bc                                   ; $7ADD: $09
    ld   a, [hl]                                  ; $7ADE: $7E
    cp   $08                                      ; $7ADF: $FE $08
    jr   nc, jr_017_7AEB                          ; $7AE1: $30 $08

    inc  a                                        ; $7AE3: $3C
    ld   [hl], a                                  ; $7AE4: $77
    ld   hl, wEntitiesPosYTable                                ; $7AE5: $21 $10 $C2
    add  hl, bc                                   ; $7AE8: $09
    ld   [hl], $E0                                ; $7AE9: $36 $E0

jr_017_7AEB:
    ld   a, $FF                                   ; $7AEB: $3E $FF
    ldh  [$FF9B], a                               ; $7AED: $E0 $9B

func_017_7AEF:
    ldh  a, [hFrameCounter]                               ; $7AEF: $F0 $E7
    rra                                           ; $7AF1: $1F
    rra                                           ; $7AF2: $1F
    rra                                           ; $7AF3: $1F
    and  $01                                      ; $7AF4: $E6 $01
    add  $00                                      ; $7AF6: $C6 $00
    ldh  [$FF9D], a                               ; $7AF8: $E0 $9D

func_017_7AFA:
    push bc                                       ; $7AFA: $C5
    xor  a                                        ; $7AFB: $AF
    ldh  [$FF9A], a                               ; $7AFC: $E0 $9A
    call UpdateFinalLinkPosition                  ; $7AFE: $CD $A8 $21
    call Func_017_7D34                            ; $7B01: $CD $34 $7D
    pop  bc                                       ; $7B04: $C1
    ret                                           ; $7B05: $C9

Func_017_7B06::
    ld   a, $F8                                   ; $7B06: $3E $F8
    ldh  [$FF9B], a                               ; $7B08: $E0 $9B
    call func_017_7AEF                            ; $7B0A: $CD $EF $7A
    ldh  a, [hLinkPositionY]                               ; $7B0D: $F0 $99
    cp   $5C                                      ; $7B0F: $FE $5C
    jr   nz, jr_017_7B40                          ; $7B11: $20 $2D

    xor  a                                        ; $7B13: $AF
    ldh  [$FF9B], a                               ; $7B14: $E0 $9B
    ld   a, $02                                   ; $7B16: $3E $02
    ldh  [$FF9D], a                               ; $7B18: $E0 $9D

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ; $7B1A: $3E $E8
    call SpawnNewEntity_trampoline                ; $7B1C: $CD $86 $3B
    ld   hl, $C2B0                                ; $7B1F: $21 $B0 $C2
    add  hl, de                                   ; $7B22: $19
    ld   [hl], $02                                ; $7B23: $36 $02
    ld   hl, wEntitiesPosXTable                                ; $7B25: $21 $00 $C2
    add  hl, de                                   ; $7B28: $19
    ld   [hl], $50                                ; $7B29: $36 $50
    ld   hl, wEntitiesPosYTable                                ; $7B2B: $21 $10 $C2
    add  hl, de                                   ; $7B2E: $19
    ld   [hl], $00                                ; $7B2F: $36 $00
    ld   hl, wEntitiesSpeedYTable                                ; $7B31: $21 $50 $C2
    add  hl, de                                   ; $7B34: $19
    ld   [hl], $14                                ; $7B35: $36 $14
    ld   hl, $C2E0                                ; $7B37: $21 $E0 $C2
    add  hl, de                                   ; $7B3A: $19
    ld   [hl], $30                                ; $7B3B: $36 $30
    call IncrementEntityState                     ; $7B3D: $CD $12 $3B

jr_017_7B40:
    ret                                           ; $7B40: $C9

Func_017_7B41::
    jr   Func_017_7B5B                            ; $7B41: $18 $18

Func_017_7B43::
    call func_017_7AFA                            ; $7B43: $CD $FA $7A
    call GetEntityTransitionCountdown             ; $7B46: $CD $05 $0C
    jr   nz, Func_017_7B5B                        ; $7B49: $20 $10

    ld   [hl], $08                                ; $7B4B: $36 $08
    ld   hl, $C3B0                                ; $7B4D: $21 $B0 $C3
    add  hl, bc                                   ; $7B50: $09
    ld   a, [hl]                                  ; $7B51: $7E
    inc  a                                        ; $7B52: $3C
    ld   [hl], a                                  ; $7B53: $77
    cp   $05                                      ; $7B54: $FE $05
    jr   nz, Func_017_7B5B                        ; $7B56: $20 $03

    call IncrementEntityState                     ; $7B58: $CD $12 $3B

Func_017_7B5B::
    call func_017_7AFA                            ; $7B5B: $CD $FA $7A
    ret                                           ; $7B5E: $C9

func_017_7B5F:
    ld   hl, $DE01                                ; $7B5F: $21 $01 $DE
    ld   a, $20                                   ; $7B62: $3E $20
    ld   [hl+], a                                 ; $7B64: $22
    ld   a, $7B                                   ; $7B65: $3E $7B
    ld   [hl+], a                                 ; $7B67: $22
    ld   a, $A5                                   ; $7B68: $3E $A5
    ld   [hl+], a                                 ; $7B6A: $22
    ld   a, $17                                   ; $7B6B: $3E $17
    ld   [hl], a                                  ; $7B6D: $77
    jp   $0BD7                                    ; $7B6E: $C3 $D7 $0B

    jr   nz, @+$42                                ; $7B71: $20 $40

    ld   h, b                                     ; $7B73: $60
    ld   a, b                                     ; $7B74: $78
    db   $10                                      ; $7B75: $10
    ld   c, b                                     ; $7B76: $48
    ld   l, b                                     ; $7B77: $68
    sub  b                                        ; $7B78: $90
    jr   nc, jr_017_7BCB                          ; $7B79: $30 $50

    add  b                                        ; $7B7B: $80
    sub  b                                        ; $7B7C: $90
    jr   jr_017_7BB7                              ; $7B7D: $18 $38

    ld   l, b                                     ; $7B7F: $68
    ld   a, b                                     ; $7B80: $78
    jr   z, jr_017_7B8B                           ; $7B81: $28 $08

    jr   z, jr_017_7B85                           ; $7B83: $28 $00

jr_017_7B85:
    ld   c, b                                     ; $7B85: $48
    ld   b, b                                     ; $7B86: $40
    ld   c, h                                     ; $7B87: $4C
    jr   c, jr_017_7BF2                           ; $7B88: $38 $68

    ld   [hl], b                                  ; $7B8A: $70

jr_017_7B8B:
    ld   e, b                                     ; $7B8B: $58
    ld   l, b                                     ; $7B8C: $68
    ld   a, b                                     ; $7B8D: $78
    adc  b                                        ; $7B8E: $88
    sbc  b                                        ; $7B8F: $98
    add  b                                        ; $7B90: $80
    ld   e, $1E                                   ; $7B91: $1E $1E
    ld   e, $2E                                   ; $7B93: $1E $2E
    ld   l, $3E                                   ; $7B95: $2E $3E
    ld   l, $2E                                   ; $7B97: $2E $2E
    ld   de, $C090                                ; $7B99: $11 $90 $C0
    push bc                                       ; $7B9C: $C5
    ldh  a, [hFrameCounter]                               ; $7B9D: $F0 $E7
    and  $01                                      ; $7B9F: $E6 $01
    ld   c, a                                     ; $7BA1: $4F

jr_017_7BA2:
    ld   hl, $7B81                                ; $7BA2: $21 $81 $7B
    add  hl, bc                                   ; $7BA5: $09
    ldh  a, [$FFEC]                               ; $7BA6: $F0 $EC
    add  [hl]                                     ; $7BA8: $86
    cp   $98                                      ; $7BA9: $FE $98
    jr   c, jr_017_7BAF                           ; $7BAB: $38 $02

    sub  $88                                      ; $7BAD: $D6 $88

jr_017_7BAF:
    ld   [de], a                                  ; $7BAF: $12
    inc  de                                       ; $7BB0: $13
    ld   hl, $7B71                                ; $7BB1: $21 $71 $7B
    add  hl, bc                                   ; $7BB4: $09
    ld   a, [hl]                                  ; $7BB5: $7E
    ld   [de], a                                  ; $7BB6: $12

jr_017_7BB7:
    inc  de                                       ; $7BB7: $13
    push bc                                       ; $7BB8: $C5
    ldh  a, [hFrameCounter]                               ; $7BB9: $F0 $E7
    rra                                           ; $7BBB: $1F
    rra                                           ; $7BBC: $1F
    rra                                           ; $7BBD: $1F
    rra                                           ; $7BBE: $1F
    nop                                           ; $7BBF: $00
    xor  c                                        ; $7BC0: $A9
    and  $07                                      ; $7BC1: $E6 $07
    ld   c, a                                     ; $7BC3: $4F
    ld   b, $00                                   ; $7BC4: $06 $00
    ld   hl, $7B91                                ; $7BC6: $21 $91 $7B
    add  hl, bc                                   ; $7BC9: $09
    ld   a, [hl]                                  ; $7BCA: $7E

jr_017_7BCB:
    ld   [de], a                                  ; $7BCB: $12
    inc  de                                       ; $7BCC: $13
    pop  bc                                       ; $7BCD: $C1
    ld   a, $96                                   ; $7BCE: $3E $96
    ld   [de], a                                  ; $7BD0: $12
    inc  de                                       ; $7BD1: $13
    inc  c                                        ; $7BD2: $0C
    inc  c                                        ; $7BD3: $0C
    ld   a, c                                     ; $7BD4: $79
    cp   $10                                      ; $7BD5: $FE $10
    jr   c, jr_017_7BA2                           ; $7BD7: $38 $C9

    pop  bc                                       ; $7BD9: $C1
    ret                                           ; $7BDA: $C9

    nop                                           ; $7BDB: $00
    ld   hl, sp+$58                               ; $7BDC: $F8 $58
    ld   bc, $0000                                ; $7BDE: $01 $00 $00
    ld   l, b                                     ; $7BE1: $68
    ld   bc, $0800                                ; $7BE2: $01 $00 $08
    ld   l, b                                     ; $7BE5: $68
    ld   hl, $1000                                ; $7BE6: $21 $00 $10
    ld   e, b                                     ; $7BE9: $58
    ld   hl, $F800                                ; $7BEA: $21 $00 $F8
    ld   e, d                                     ; $7BED: $5A
    ld   bc, $0000                                ; $7BEE: $01 $00 $00
    ld   l, d                                     ; $7BF1: $6A

jr_017_7BF2:
    ld   bc, $0800                                ; $7BF2: $01 $00 $08
    ld   l, d                                     ; $7BF5: $6A
    ld   hl, $1000                                ; $7BF6: $21 $00 $10
    ld   e, d                                     ; $7BF9: $5A
    ld   hl, $F800                                ; $7BFA: $21 $00 $F8
    ld   e, h                                     ; $7BFD: $5C
    ld   bc, $0000                                ; $7BFE: $01 $00 $00
    ld   l, h                                     ; $7C01: $6C
    ld   bc, $0800                                ; $7C02: $01 $00 $08
    ld   l, h                                     ; $7C05: $6C
    ld   hl, $1000                                ; $7C06: $21 $00 $10
    ld   e, h                                     ; $7C09: $5C
    ld   hl, $F800                                ; $7C0A: $21 $00 $F8
    ld   e, [hl]                                  ; $7C0D: $5E
    ld   bc, $0000                                ; $7C0E: $01 $00 $00
    ld   l, [hl]                                  ; $7C11: $6E
    ld   bc, $0800                                ; $7C12: $01 $00 $08
    ld   l, [hl]                                  ; $7C15: $6E
    ld   hl, $1000                                ; $7C16: $21 $00 $10
    ld   e, [hl]                                  ; $7C19: $5E
    ld   hl, $503E                                ; $7C1A: $21 $3E $50
    ld   [$C3C0], a                               ; $7C1D: $EA $C0 $C3
    ld   hl, $7BDB                                ; $7C20: $21 $DB $7B
    ldh  a, [$FFF1]                               ; $7C23: $F0 $F1
    rla                                           ; $7C25: $17
    rla                                           ; $7C26: $17
    rla                                           ; $7C27: $17
    rla                                           ; $7C28: $17
    and  $F0                                      ; $7C29: $E6 $F0
    ld   e, a                                     ; $7C2B: $5F
    ld   d, b                                     ; $7C2C: $50
    add  hl, de                                   ; $7C2D: $19
    ld   c, $04                                   ; $7C2E: $0E $04
    call label_3CE6                                    ; $7C30: $CD $E6 $3C
    ld   a, $04                                   ; $7C33: $3E $04
    call label_3DA0                                    ; $7C35: $CD $A0 $3D
    ldh  a, [hFrameCounter]                               ; $7C38: $F0 $E7
    rra                                           ; $7C3A: $1F
    rra                                           ; $7C3B: $1F
    rra                                           ; $7C3C: $1F
    and  $03                                      ; $7C3D: $E6 $03
    call SetEntitySpriteVariant                                    ; $7C3F: $CD $0C $3B
    ldh  a, [hActiveEntityState]                               ; $7C42: $F0 $F0
    rst  $00                                      ; $7C44: $C7
    ld   c, l                                     ; $7C45: $4D
    ld   a, h                                     ; $7C46: $7C
    ld   a, e                                     ; $7C47: $7B
    ld   a, h                                     ; $7C48: $7C
    and  l                                        ; $7C49: $A5
    ld   a, h                                     ; $7C4A: $7C
    or   a                                        ; $7C4B: $B7
    ld   a, h                                     ; $7C4C: $7C
    call GetEntityTransitionCountdown             ; $7C4D: $CD $05 $0C
    jr   nz, jr_017_7C6A                          ; $7C50: $20 $18

    call func_017_7E30                            ; $7C52: $CD $30 $7E
    ldh  a, [hFrameCounter]                               ; $7C55: $F0 $E7
    and  $03                                      ; $7C57: $E6 $03
    jr   nz, jr_017_7C6A                          ; $7C59: $20 $0F

    ld   hl, wEntitiesSpeedYTable                                ; $7C5B: $21 $50 $C2
    add  hl, bc                                   ; $7C5E: $09
    dec  [hl]                                     ; $7C5F: $35
    jr   nz, jr_017_7C6A                          ; $7C60: $20 $08

    call GetEntityTransitionCountdown             ; $7C62: $CD $05 $0C
    ld   [hl], $80                                ; $7C65: $36 $80
    call IncrementEntityState                     ; $7C67: $CD $12 $3B

jr_017_7C6A:
    ret                                           ; $7C6A: $C9

    nop                                           ; $7C6B: $00
    nop                                           ; $7C6C: $00
    nop                                           ; $7C6D: $00
    ld   bc, $0201                                ; $7C6E: $01 $01 $02
    inc  bc                                       ; $7C71: $03
    inc  bc                                       ; $7C72: $03
    inc  b                                        ; $7C73: $04
    inc  b                                        ; $7C74: $04
    inc  b                                        ; $7C75: $04
    inc  bc                                       ; $7C76: $03
    inc  bc                                       ; $7C77: $03
    ld   [bc], a                                  ; $7C78: $02
    ld   bc, $CD01                                ; $7C79: $01 $01 $CD
    dec  b                                        ; $7C7C: $05
    inc  c                                        ; $7C7D: $0C
    jr   nz, jr_017_7C8D                          ; $7C7E: $20 $0D

    ; Open Owl Speech dialog
    ld   a, $CF                                   ; $7C80: $3E $CF
    call CreditsOpenDialog                        ; $7C82: $CD $F0 $7C

    ld   a, $19                                   ; $7C85: $3E $19
    ld   [$C5AB], a                               ; $7C87: $EA $AB $C5
    call IncrementEntityState                     ; $7C8A: $CD $12 $3B

func_017_7C8D:
jr_017_7C8D:
    ld   hl, wEntitiesUnknowTableY                ; $7C8D: $21 $D0 $C3
    add  hl, bc                                   ; $7C90: $09
    ld   a, [hl]                                  ; $7C91: $7E
    ld   a, [hl]                                  ; $7C92: $7E
    inc  [hl]                                     ; $7C93: $34
    rra                                           ; $7C94: $1F
    rra                                           ; $7C95: $1F
    and  $0F                                      ; $7C96: $E6 $0F
    ld   e, a                                     ; $7C98: $5F
    ld   d, b                                     ; $7C99: $50
    ld   hl, $7C6B                                ; $7C9A: $21 $6B $7C
    add  hl, de                                   ; $7C9D: $19
    ld   a, [hl]                                  ; $7C9E: $7E
    ld   hl, $C310                                ; $7C9F: $21 $10 $C3
    add  hl, bc                                   ; $7CA2: $09
    ld   [hl], a                                  ; $7CA3: $77
    ret                                           ; $7CA4: $C9

    call func_017_7C8D                            ; $7CA5: $CD $8D $7C
    ld   a, [$C19F]                               ; $7CA8: $FA $9F $C1
    and  a                                        ; $7CAB: $A7
    jr   nz, jr_017_7CB6                          ; $7CAC: $20 $08

    call GetEntityTransitionCountdown             ; $7CAE: $CD $05 $0C
    ld   [hl], $FF                                ; $7CB1: $36 $FF
    call IncrementEntityState                     ; $7CB3: $CD $12 $3B

jr_017_7CB6:
    ret                                           ; $7CB6: $C9

    call func_017_7C8D                            ; $7CB7: $CD $8D $7C
    call GetEntityTransitionCountdown             ; $7CBA: $CD $05 $0C
    jr   nz, jr_017_7CC8                          ; $7CBD: $20 $09

jr_017_7CBF:
    call IncrementCreditsSubscene                            ; $7CBF: $CD $D9 $4C

label_017_7CC2:
    ld   hl, $C280                                ; $7CC2: $21 $80 $C2
    add  hl, bc                                   ; $7CC5: $09
    ld   [hl], b                                  ; $7CC6: $70
    ret                                           ; $7CC7: $C9

jr_017_7CC8:
    cp   $E0                                      ; $7CC8: $FE $E0
    jr   nc, jr_017_7CEF                          ; $7CCA: $30 $23

    cp   $DF                                      ; $7CCC: $FE $DF
    jr   nz, jr_017_7CD4                          ; $7CCE: $20 $04

    ld   a, $26                                   ; $7CD0: $3E $26
    ldh  [hJingle], a                               ; $7CD2: $E0 $F2

jr_017_7CD4:
    ld   hl, $C2D0                                ; $7CD4: $21 $D0 $C2
    add  hl, bc                                   ; $7CD7: $09
    ld   e, [hl]                                  ; $7CD8: $5E
    ld   a, [hl]                                  ; $7CD9: $7E
    cp   $FC                                      ; $7CDA: $FE $FC
    jr   nc, jr_017_7CBF                          ; $7CDC: $30 $E1

    add  $02                                      ; $7CDE: $C6 $02
    ld   [hl], a                                  ; $7CE0: $77
    ld   hl, wEntitiesUnknowTableP                ; $7CE1: $21 $40 $C4
    add  hl, bc                                   ; $7CE4: $09
    ld   a, [hl]                                  ; $7CE5: $7E
    add  e                                        ; $7CE6: $83
    ld   [hl], a                                  ; $7CE7: $77
    jr   nc, jr_017_7CEF                          ; $7CE8: $30 $05

    ld   a, $FF                                   ; $7CEA: $3E $FF
    call SetEntitySpriteVariant                                    ; $7CEC: $CD $0C $3B

jr_017_7CEF:
    ret                                           ; $7CEF: $C9

CreditsOpenDialog::
    ld   e, a                                     ; $7CF0: $5F
    ldh  a, [hLinkPositionY]                               ; $7CF1: $F0 $99
    push af                                       ; $7CF3: $F5
    ld   a, $10                                   ; $7CF4: $3E $10
    ldh  [hLinkPositionY], a                               ; $7CF6: $E0 $99
    ld   a, e                                     ; $7CF8: $7B
    call OpenDialog                               ; $7CF9: $CD $85 $23
    pop  af                                       ; $7CFC: $F1
    ldh  [hLinkPositionY], a                               ; $7CFD: $E0 $99
    ret                                           ; $7CFF: $C9

    nop                                           ; $7D00: $00
    nop                                           ; $7D01: $00
    ld   [bc], a                                  ; $7D02: $02
    nop                                           ; $7D03: $00
    ld   [bc], a                                  ; $7D04: $02
    jr   nz, jr_017_7D07                          ; $7D05: $20 $00

jr_017_7D07:
    jr   nz, jr_017_7D4D                          ; $7D07: $20 $44

    nop                                           ; $7D09: $00
    ld   b, [hl]                                  ; $7D0A: $46
    nop                                           ; $7D0B: $00
    ld   c, b                                     ; $7D0C: $48

jr_017_7D0D:
    nop                                           ; $7D0D: $00
    ld   c, d                                     ; $7D0E: $4A
    nop                                           ; $7D0F: $00
    ld   c, h                                     ; $7D10: $4C
    nop                                           ; $7D11: $00
    ld   c, h                                     ; $7D12: $4C
    jr   nz, @-$26                                ; $7D13: $20 $D8

    jr   nz, @-$28                                ; $7D15: $20 $D6

    jr   nz, @-$2A                                ; $7D17: $20 $D4

    nop                                           ; $7D19: $00
    call nc, $D620                                ; $7D1A: $D4 $20 $D6
    nop                                           ; $7D1D: $00
    ret  c                                        ; $7D1E: $D8

    nop                                           ; $7D1F: $00
    jp   c, $DC00                                 ; $7D20: $DA $00 $DC

    nop                                           ; $7D23: $00
    sbc  $00                                      ; $7D24: $DE $00
    ldh  [rP1], a                                 ; $7D26: $E0 $00
    ld   [c], a                                   ; $7D28: $E2
    nop                                           ; $7D29: $00
    ld   [c], a                                   ; $7D2A: $E2
    jr   nz, jr_017_7D0D                          ; $7D2B: $20 $E0

    jr   nz, jr_017_7D0D                          ; $7D2D: $20 $DE

    jr   nz, jr_017_7D0D                          ; $7D2F: $20 $DC

    jr   nz, jr_017_7D0D                          ; $7D31: $20 $DA

    db   $20                                      ; $7D33: $20

Func_017_7D34::
    ldh  a, [hLinkAnimationState]                 ; $7D34: $F0 $9D
    rla                                           ; $7D36: $17
    rla                                           ; $7D37: $17
    and  $FC                                      ; $7D38: $E6 $FC
    ld   e, a                                     ; $7D3A: $5F
    ld   d, $00                                   ; $7D3B: $16 $00
    ld   hl, $7D00                                ; $7D3D: $21 $00 $7D
    add  hl, de                                   ; $7D40: $19
    push hl                                       ; $7D41: $E5
    pop  de                                       ; $7D42: $D1
    ld   hl, $C004                                ; $7D43: $21 $04 $C0
    ldh  a, [hLinkPositionY]                               ; $7D46: $F0 $99
    ld   [hl+], a                                 ; $7D48: $22
    ld   a, [$C155]                               ; $7D49: $FA $55 $C1
    ld   c, a                                     ; $7D4C: $4F

jr_017_7D4D:
    ldh  a, [hLinkPositionX]                               ; $7D4D: $F0 $98
    sub  c                                        ; $7D4F: $91
    ld   [hl+], a                                 ; $7D50: $22
    ld   a, [de]                                  ; $7D51: $1A
    inc  de                                       ; $7D52: $13
    ld   [hl+], a                                 ; $7D53: $22
    push hl                                       ; $7D54: $E5
    ld   hl, hScratch0                                ; $7D55: $21 $D7 $FF
    ld   a, [$DC0F]                               ; $7D58: $FA $0F $DC
    and  a                                        ; $7D5B: $A7
    jr   z, jr_017_7D5F                           ; $7D5C: $28 $01

    inc  a                                        ; $7D5E: $3C

jr_017_7D5F:
    ld   [hl], a                                  ; $7D5F: $77
    ld   a, [de]                                  ; $7D60: $1A
    or   [hl]                                     ; $7D61: $B6
    pop  hl                                       ; $7D62: $E1
    inc  de                                       ; $7D63: $13
    ld   [hl+], a                                 ; $7D64: $22
    ldh  a, [hLinkPositionY]                               ; $7D65: $F0 $99
    ld   [hl+], a                                 ; $7D67: $22
    ldh  a, [hLinkPositionX]                               ; $7D68: $F0 $98
    sub  c                                        ; $7D6A: $91
    add  $08                                      ; $7D6B: $C6 $08
    ld   [hl+], a                                 ; $7D6D: $22
    ld   a, [de]                                  ; $7D6E: $1A
    inc  de                                       ; $7D6F: $13
    ld   [hl+], a                                 ; $7D70: $22
    push hl                                       ; $7D71: $E5
    ld   hl, hScratch0                                ; $7D72: $21 $D7 $FF
    ld   a, [de]                                  ; $7D75: $1A
    or   [hl]                                     ; $7D76: $B6
    pop  hl                                       ; $7D77: $E1
    ld   [hl], a                                  ; $7D78: $77
    ret                                           ; $7D79: $C9

    scf                                           ; $7D7A: $37
    ld   a, a                                     ; $7D7B: $7F
    ldh  a, [hFrameCounter]                               ; $7D7C: $F0 $E7
    and  $10                                      ; $7D7E: $E6 $10
    ret  nz                                       ; $7D80: $C0

    ld   e, $00                                   ; $7D81: $1E $00
    ld   a, [$C19F]                               ; $7D83: $FA $9F $C1
    and  $80                                      ; $7D86: $E6 $80
    jr   z, jr_017_7D8B                           ; $7D88: $28 $01

    inc  e                                        ; $7D8A: $1C

jr_017_7D8B:
    ld   d, $00                                   ; $7D8B: $16 $00
    ld   a, [$DB95]                               ; $7D8D: $FA $95 $DB
    cp   $01                                      ; $7D90: $FE $01
    jr   z, jr_017_7DAC                           ; $7D92: $28 $18

    ld   hl, $7D7A                                ; $7D94: $21 $7A $7D
    add  hl, de                                   ; $7D97: $19
    ld   a, [hl]                                  ; $7D98: $7E
    ld   [$C018], a                               ; $7D99: $EA $18 $C0
    ld   a, $97                                   ; $7D9C: $3E $97
    ld   [$C019], a                               ; $7D9E: $EA $19 $C0
    ld   a, $A2                                   ; $7DA1: $3E $A2
    ld   [$C01A], a                               ; $7DA3: $EA $1A $C0
    ld   a, $42                                   ; $7DA6: $3E $42
    ld   [$C01B], a                               ; $7DA8: $EA $1B $C0
    ret                                           ; $7DAB: $C9

jr_017_7DAC:
    ld   hl, $7D7A                                ; $7DAC: $21 $7A $7D
    add  hl, de                                   ; $7DAF: $19
    ld   a, [hl]                                  ; $7DB0: $7E
    ld   hl, hBaseScrollY                                ; $7DB1: $21 $97 $FF
    sub  [hl]                                     ; $7DB4: $96
    ld   [wOAMBuffer], a                               ; $7DB5: $EA $00 $C0
    ld   a, $97                                   ; $7DB8: $3E $97
    ld   [$C001], a                               ; $7DBA: $EA $01 $C0
    ld   a, $FE                                   ; $7DBD: $3E $FE
    ld   [$C002], a                               ; $7DBF: $EA $02 $C0
    ld   a, $40                                   ; $7DC2: $3E $40
    ld   [$C003], a                               ; $7DC4: $EA $03 $C0
    ret                                           ; $7DC7: $C9

    jr   nc, jr_017_7E42                          ; $7DC8: $30 $78

    jr   nc, jr_017_7E24                          ; $7DCA: $30 $58

    ld   e, $00                                   ; $7DCC: $1E $00
    ld   a, [$C19F]                               ; $7DCE: $FA $9F $C1
    and  $80                                      ; $7DD1: $E6 $80
    jr   z, jr_017_7DD6                           ; $7DD3: $28 $01

    inc  e                                        ; $7DD5: $1C

jr_017_7DD6:
    ld   d, $00                                   ; $7DD6: $16 $00
    ld   a, [$DB95]                               ; $7DD8: $FA $95 $DB
    cp   $01                                      ; $7DDB: $FE $01
    jr   z, jr_017_7E04                           ; $7DDD: $28 $25

    ld   hl, $7DC8                                ; $7DDF: $21 $C8 $7D
    add  hl, de                                   ; $7DE2: $19
    ld   a, [hl]                                  ; $7DE3: $7E
    ld   [$C018], a                               ; $7DE4: $EA $18 $C0
    ld   e, $00                                   ; $7DE7: $1E $00
    ld   a, [$C177]                               ; $7DE9: $FA $77 $C1
    and  $01                                      ; $7DEC: $E6 $01
    jr   z, jr_017_7DF1                           ; $7DEE: $28 $01

    inc  e                                        ; $7DF0: $1C

jr_017_7DF1:
    ld   hl, $7DCA                                ; $7DF1: $21 $CA $7D
    add  hl, de                                   ; $7DF4: $19
    ld   a, [hl]                                  ; $7DF5: $7E
    ld   [$C019], a                               ; $7DF6: $EA $19 $C0
    ld   a, $3E                                   ; $7DF9: $3E $3E
    ld   [$C01A], a                               ; $7DFB: $EA $1A $C0
    ld   a, $00                                   ; $7DFE: $3E $00
    ld   [$C01B], a                               ; $7E00: $EA $1B $C0
    ret                                           ; $7E03: $C9

jr_017_7E04:
    ld   hl, $7DC8                                ; $7E04: $21 $C8 $7D
    add  hl, de                                   ; $7E07: $19
    ld   a, [hl]                                  ; $7E08: $7E
    ld   hl, hBaseScrollY                                ; $7E09: $21 $97 $FF
    sub  [hl]                                     ; $7E0C: $96
    ld   [wOAMBuffer], a                               ; $7E0D: $EA $00 $C0
    ld   e, $00                                   ; $7E10: $1E $00
    ld   a, [$C177]                               ; $7E12: $FA $77 $C1
    and  $01                                      ; $7E15: $E6 $01
    jr   z, jr_017_7E1A                           ; $7E17: $28 $01

    inc  e                                        ; $7E19: $1C

jr_017_7E1A:
    ld   hl, $7DCA                                ; $7E1A: $21 $CA $7D
    add  hl, de                                   ; $7E1D: $19
    ld   a, [hl]                                  ; $7E1E: $7E
    ld   [$C001], a                               ; $7E1F: $EA $01 $C0
    ld   a, $9E                                   ; $7E22: $3E $9E

jr_017_7E24:
    ld   [$C002], a                               ; $7E24: $EA $02 $C0
    ld   a, $00                                   ; $7E27: $3E $00
    ld   [$C003], a                               ; $7E29: $EA $03 $C0
    ret                                           ; $7E2C: $C9

func_017_7E2D:
    call func_017_7E3A                            ; $7E2D: $CD $3A $7E

func_017_7E30:
    push bc                                       ; $7E30: $C5
    ld   a, c                                     ; $7E31: $79
    add  $10                                      ; $7E32: $C6 $10
    ld   c, a                                     ; $7E34: $4F
    call func_017_7E3A                            ; $7E35: $CD $3A $7E
    pop  bc                                       ; $7E38: $C1
    ret                                           ; $7E39: $C9

func_017_7E3A:
    ld   hl, wEntitiesSpeedXTable                                ; $7E3A: $21 $40 $C2
    add  hl, bc                                   ; $7E3D: $09
    ld   a, [hl]                                  ; $7E3E: $7E
    and  a                                        ; $7E3F: $A7
    jr   z, jr_017_7E65                           ; $7E40: $28 $23

jr_017_7E42:
    push af                                       ; $7E42: $F5
    swap a                                        ; $7E43: $CB $37
    and  $F0                                      ; $7E45: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $7E47: $21 $60 $C2
    add  hl, bc                                   ; $7E4A: $09
    add  [hl]                                     ; $7E4B: $86
    ld   [hl], a                                  ; $7E4C: $77
    rl   d                                        ; $7E4D: $CB $12
    ld   hl, wEntitiesPosXTable                                ; $7E4F: $21 $00 $C2

jr_017_7E52:
    add  hl, bc                                   ; $7E52: $09
    pop  af                                       ; $7E53: $F1
    ld   e, $00                                   ; $7E54: $1E $00
    bit  7, a                                     ; $7E56: $CB $7F
    jr   z, jr_017_7E5C                           ; $7E58: $28 $02

    ld   e, $F0                                   ; $7E5A: $1E $F0

jr_017_7E5C:
    swap a                                        ; $7E5C: $CB $37
    and  $0F                                      ; $7E5E: $E6 $0F
    or   e                                        ; $7E60: $B3
    rr   d                                        ; $7E61: $CB $1A
    adc  [hl]                                     ; $7E63: $8E
    ld   [hl], a                                  ; $7E64: $77

jr_017_7E65:
    ret                                           ; $7E65: $C9

    ld   hl, $C320                                ; $7E66: $21 $20 $C3
    add  hl, bc                                   ; $7E69: $09
    ld   a, [hl]                                  ; $7E6A: $7E
    and  a                                        ; $7E6B: $A7
    jr   z, jr_017_7E65                           ; $7E6C: $28 $F7

    push af                                       ; $7E6E: $F5
    swap a                                        ; $7E6F: $CB $37
    and  $F0                                      ; $7E71: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $7E73: $21 $30 $C3
    add  hl, bc                                   ; $7E76: $09
    add  [hl]                                     ; $7E77: $86
    ld   [hl], a                                  ; $7E78: $77
    rl   d                                        ; $7E79: $CB $12
    ld   hl, $C310                                ; $7E7B: $21 $10 $C3
    jr   jr_017_7E52                              ; $7E7E: $18 $D2

func_017_7E80:
label_017_7E80:
    and  $01                                      ; $7E80: $E6 $01
    jr   z, jr_017_7E88                           ; $7E82: $28 $04

    ld   a, $02                                   ; $7E84: $3E $02
    jr   jr_017_7EA0                              ; $7E86: $18 $18

jr_017_7E88:
    ld   a, $06                                   ; $7E88: $3E $06
    ldh  [hScratchD], a                           ; $7E8A: $E0 $E4
    ld   a, $0C                                   ; $7E8C: $3E $0C
    ldh  [$FFE5], a                               ; $7E8E: $E0 $E5
    ld   a, $18                                   ; $7E90: $3E $18
    ldh  [$FFE6], a                               ; $7E92: $E0 $E6
    ld   hl, $DC10                                ; $7E94: $21 $10 $DC
    ld   a, $40                                   ; $7E97: $3E $40
    ldh  [hScratch3], a                               ; $7E99: $E0 $DA
    call func_017_7EA4                            ; $7E9B: $CD $A4 $7E
    ld   a, $01                                   ; $7E9E: $3E $01

jr_017_7EA0:
    ld   [$DDD1], a                               ; $7EA0: $EA $D1 $DD
    ret                                           ; $7EA3: $C9

func_017_7EA4:
label_017_7EA4:
    push hl                                       ; $7EA4: $E5
    ld   a, $02                                   ; $7EA5: $3E $02
    ldh  [rSVBK], a                               ; $7EA7: $E0 $70
    ld   a, [hl+]                                 ; $7EA9: $2A
    ld   e, a                                     ; $7EAA: $5F
    ld   a, [hl]                                  ; $7EAB: $7E
    ld   d, a                                     ; $7EAC: $57
    dec  hl                                       ; $7EAD: $2B
    xor  a                                        ; $7EAE: $AF
    ldh  [rSVBK], a                               ; $7EAF: $E0 $70
    ldh  a, [hScratchD]                           ; $7EB1: $F0 $E4
    ld   c, a                                     ; $7EB3: $4F
    ld   a, e                                     ; $7EB4: $7B
    and  $1F                                      ; $7EB5: $E6 $1F
    ld   b, a                                     ; $7EB7: $47
    ld   a, [hl]                                  ; $7EB8: $7E
    and  $1F                                      ; $7EB9: $E6 $1F
    cp   b                                        ; $7EBB: $B8
    jr   c, jr_017_7EC6                           ; $7EBC: $38 $08

    jr   z, jr_017_7EC6                           ; $7EBE: $28 $06

    sub  c                                        ; $7EC0: $91
    jr   c, jr_017_7EC6                           ; $7EC1: $38 $03

    cp   b                                        ; $7EC3: $B8
    jr   nc, jr_017_7EC7                          ; $7EC4: $30 $01

jr_017_7EC6:
    ld   a, b                                     ; $7EC6: $78

jr_017_7EC7:
    ldh  [hScratch0], a                               ; $7EC7: $E0 $D7
    ld   a, e                                     ; $7EC9: $7B
    and  $E0                                      ; $7ECA: $E6 $E0
    swap a                                        ; $7ECC: $CB $37
    ld   b, a                                     ; $7ECE: $47
    ld   a, d                                     ; $7ECF: $7A
    and  $03                                      ; $7ED0: $E6 $03
    swap a                                        ; $7ED2: $CB $37
    or   b                                        ; $7ED4: $B0
    ld   b, a                                     ; $7ED5: $47
    ld   a, [hl+]                                 ; $7ED6: $2A
    and  $E0                                      ; $7ED7: $E6 $E0
    swap a                                        ; $7ED9: $CB $37
    ld   c, a                                     ; $7EDB: $4F
    ld   a, [hl]                                  ; $7EDC: $7E
    and  $03                                      ; $7EDD: $E6 $03
    swap a                                        ; $7EDF: $CB $37
    or   c                                        ; $7EE1: $B1
    push af                                       ; $7EE2: $F5
    ldh  a, [$FFE5]                               ; $7EE3: $F0 $E5
    ld   c, a                                     ; $7EE5: $4F
    pop  af                                       ; $7EE6: $F1
    cp   b                                        ; $7EE7: $B8
    jr   c, jr_017_7EF2                           ; $7EE8: $38 $08

    jr   z, jr_017_7EF2                           ; $7EEA: $28 $06

    sub  c                                        ; $7EEC: $91
    jr   c, jr_017_7EF2                           ; $7EED: $38 $03

    cp   b                                        ; $7EEF: $B8
    jr   nc, jr_017_7EF3                          ; $7EF0: $30 $01

jr_017_7EF2:
    ld   a, b                                     ; $7EF2: $78

jr_017_7EF3:
    ldh  [hScratch1], a                               ; $7EF3: $E0 $D8
    ldh  a, [$FFE6]                               ; $7EF5: $F0 $E6
    ld   c, a                                     ; $7EF7: $4F
    ld   a, d                                     ; $7EF8: $7A
    and  $7C                                      ; $7EF9: $E6 $7C
    ld   b, a                                     ; $7EFB: $47
    ld   a, [hl]                                  ; $7EFC: $7E
    and  $7C                                      ; $7EFD: $E6 $7C
    cp   b                                        ; $7EFF: $B8
    jr   c, jr_017_7F0A                           ; $7F00: $38 $08

    jr   z, jr_017_7F0A                           ; $7F02: $28 $06

    sub  c                                        ; $7F04: $91
    jr   c, jr_017_7F0A                           ; $7F05: $38 $03

    cp   b                                        ; $7F07: $B8
    jr   nc, jr_017_7F0B                          ; $7F08: $30 $01

jr_017_7F0A:
    ld   a, b                                     ; $7F0A: $78

jr_017_7F0B:
    ldh  [hScratch2], a                               ; $7F0B: $E0 $D9
    pop  hl                                       ; $7F0D: $E1
    ldh  a, [hScratch0]                               ; $7F0E: $F0 $D7
    ld   b, a                                     ; $7F10: $47
    ldh  a, [hScratch1]                               ; $7F11: $F0 $D8
    swap a                                        ; $7F13: $CB $37
    ld   c, a                                     ; $7F15: $4F
    and  $E0                                      ; $7F16: $E6 $E0
    or   b                                        ; $7F18: $B0
    ld   [hl+], a                                 ; $7F19: $22
    ldh  a, [hScratch2]                               ; $7F1A: $F0 $D9
    ld   b, a                                     ; $7F1C: $47
    ld   a, c                                     ; $7F1D: $79
    and  $03                                      ; $7F1E: $E6 $03
    or   b                                        ; $7F20: $B0
    ld   [hl+], a                                 ; $7F21: $22
    ldh  a, [hScratch3]                               ; $7F22: $F0 $DA
    dec  a                                        ; $7F24: $3D
    ldh  [hScratch3], a                               ; $7F25: $E0 $DA
    and  a                                        ; $7F27: $A7
    jp   nz, label_017_7EA4                       ; $7F28: $C2 $A4 $7E

    xor  a                                        ; $7F2B: $AF
    ld   [$DDD5], a                               ; $7F2C: $EA $D5 $DD
    ret                                           ; $7F2F: $C9

func_017_7F30:
label_017_7F30:
    and  $01                                      ; $7F30: $E6 $01
    jr   z, jr_017_7F3C                           ; $7F32: $28 $08

    xor  a                                        ; $7F34: $AF
    ld   [$D01F], a                               ; $7F35: $EA $1F $D0
    ld   a, $02                                   ; $7F38: $3E $02
    jr   jr_017_7F52                              ; $7F3A: $18 $16

jr_017_7F3C:
    ld   a, $06                                   ; $7F3C: $3E $06
    ldh  [hScratchD], a                           ; $7F3E: $E0 $E4
    ld   a, $0C                                   ; $7F40: $3E $0C
    ldh  [$FFE5], a                               ; $7F42: $E0 $E5
    ld   a, $18                                   ; $7F44: $3E $18
    ldh  [$FFE6], a                               ; $7F46: $E0 $E6
    ld   hl, $DC10                                ; $7F48: $21 $10 $DC
    ld   d, $40                                   ; $7F4B: $16 $40
    call func_017_7F57                            ; $7F4D: $CD $57 $7F
    ld   a, $01                                   ; $7F50: $3E $01

jr_017_7F52:
    ld   [$DDD1], a                               ; $7F52: $EA $D1 $DD
    xor  a                                        ; $7F55: $AF
    ret                                           ; $7F56: $C9

func_017_7F57:
jr_017_7F57:
    push hl                                       ; $7F57: $E5
    ldh  a, [hScratchD]                           ; $7F58: $F0 $E4
    ld   c, a                                     ; $7F5A: $4F
    ld   a, [hl]                                  ; $7F5B: $7E
    and  $1F                                      ; $7F5C: $E6 $1F
    add  c                                        ; $7F5E: $81
    cp   $20                                      ; $7F5F: $FE $20
    jr   c, jr_017_7F65                           ; $7F61: $38 $02

    ld   a, $1F                                   ; $7F63: $3E $1F

jr_017_7F65:
    ldh  [hScratch0], a                               ; $7F65: $E0 $D7
    ldh  a, [$FFE5]                               ; $7F67: $F0 $E5
    ld   c, a                                     ; $7F69: $4F
    ld   a, [hl+]                                 ; $7F6A: $2A
    and  $E0                                      ; $7F6B: $E6 $E0
    swap a                                        ; $7F6D: $CB $37
    ld   b, a                                     ; $7F6F: $47
    ld   a, [hl]                                  ; $7F70: $7E
    and  $03                                      ; $7F71: $E6 $03
    swap a                                        ; $7F73: $CB $37
    or   b                                        ; $7F75: $B0
    and  $3E                                      ; $7F76: $E6 $3E
    add  c                                        ; $7F78: $81
    cp   $40                                      ; $7F79: $FE $40
    jr   c, jr_017_7F7F                           ; $7F7B: $38 $02

    ld   a, $3E                                   ; $7F7D: $3E $3E

jr_017_7F7F:
    ldh  [hScratch1], a                               ; $7F7F: $E0 $D8
    ldh  a, [$FFE6]                               ; $7F81: $F0 $E6
    ld   c, a                                     ; $7F83: $4F
    ld   a, [hl]                                  ; $7F84: $7E
    and  $7C                                      ; $7F85: $E6 $7C
    add  c                                        ; $7F87: $81
    cp   $80                                      ; $7F88: $FE $80
    jr   c, jr_017_7F8E                           ; $7F8A: $38 $02

    ld   a, $7C                                   ; $7F8C: $3E $7C

jr_017_7F8E:
    ldh  [hScratch2], a                               ; $7F8E: $E0 $D9
    pop  hl                                       ; $7F90: $E1
    ldh  a, [hScratch0]                               ; $7F91: $F0 $D7
    ld   b, a                                     ; $7F93: $47
    ldh  a, [hScratch1]                               ; $7F94: $F0 $D8
    swap a                                        ; $7F96: $CB $37
    ld   c, a                                     ; $7F98: $4F
    and  $E0                                      ; $7F99: $E6 $E0
    or   b                                        ; $7F9B: $B0
    ld   [hl+], a                                 ; $7F9C: $22
    ldh  a, [hScratch2]                               ; $7F9D: $F0 $D9
    ld   b, a                                     ; $7F9F: $47
    ld   a, c                                     ; $7FA0: $79
    and  $03                                      ; $7FA1: $E6 $03
    or   b                                        ; $7FA3: $B0
    ld   [hl+], a                                 ; $7FA4: $22
    dec  d                                        ; $7FA5: $15
    jr   nz, jr_017_7F57                          ; $7FA6: $20 $AF

    ret                                           ; $7FA8: $C9

func_017_7FA9:
    ld   hl, $DE01                                ; $7FA9: $21 $01 $DE
    ld   a, $20                                   ; $7FAC: $3E $20
    ld   [hl+], a                                 ; $7FAE: $22
    ld   a, $7D                                   ; $7FAF: $3E $7D
    ld   [hl+], a                                 ; $7FB1: $22
    ld   a, $7C                                   ; $7FB2: $3E $7C
    ld   [hl+], a                                 ; $7FB4: $22
    ld   a, $17                                   ; $7FB5: $3E $17
    ld   [hl], a                                  ; $7FB7: $77
    jp   $0BD7                                    ; $7FB8: $C3 $D7 $0B
