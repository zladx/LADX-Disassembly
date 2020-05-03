;
; Code for copy file screen.
;

FileCopyEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $4F8C: $FA $96 $DB
    JP_TABLE
._00 dw label_4D1A
._01 dw label_4D2C
._02 dw label_4FA6
._03 dw label_4FBB
._04 dw label_4FC3
._05 dw label_4FE1
._06 dw label_4D39
._07 dw label_4D49
._08 dw label_4FFF
._09 dw label_50DF
._0A dw label_51E9

label_4FA6::
    ld   a, $08                                   ; $4FA6: $3E $08
    ld   [wTileMapToLoad], a                      ; $4FA8: $EA $FE $D6
    xor  a                                        ; $4FAB: $AF
    ld   [wSaveSlot], a                           ; $4FAC: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4FAF: $EA $00 $D0
    ld   [wIntroTimer], a                         ; $4FB2: $EA $01 $D0
    ld   [wIntroSubTimer], a                      ; $4FB5: $EA $02 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4FB8: $C3 $D6 $44

label_4FBB::
    ld   a, $0C                                   ; $4FBB: $3E $0C
    ld   [wBGMapToLoad], a                        ; $4FBD: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4FC0: $C3 $D6 $44

label_4FC3::
    ld   bc, $98C4                                ; $4FC3: $01 $C4 $98
    ld   de, $DB80                                ; $4FC6: $11 $80 $DB
    call func_4852                                ; $4FC9: $CD $52 $48
    ld   bc, $9924                                ; $4FCC: $01 $24 $99
    ld   de, $DB85                                ; $4FCF: $11 $85 $DB
    call func_4852                                ; $4FD2: $CD $52 $48
    ld   bc, $9984                                ; $4FD5: $01 $84 $99
    ld   de, $DB8A                                ; $4FD8: $11 $8A $DB
    call func_4852                                ; $4FDB: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FDE: $C3 $D6 $44

label_4FE1::
    ld   bc, $98CD                                ; $4FE1: $01 $CD $98
    ld   de, $DB80                                ; $4FE4: $11 $80 $DB
    call func_4852                                ; $4FE7: $CD $52 $48
    ld   bc, $992D                                ; $4FEA: $01 $2D $99
    ld   de, $DB85                                ; $4FED: $11 $85 $DB
    call func_4852                                ; $4FF0: $CD $52 $48
    ld   bc, $998D                                ; $4FF3: $01 $8D $99
    ld   de, $DB8A                                ; $4FF6: $11 $8A $DB
    call func_4852                                ; $4FF9: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FFC: $C3 $D6 $44

label_4FFF::
    call label_6BA8                               ; $4FFF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $5002: $F0 $CC
    and  $08                                      ; $5004: $E6 $08
    jr   z, label_500E                            ; $5006: $28 $06

    ld   a, [wIntroTimer]                         ; $5008: $FA $01 $D0
    inc  a                                        ; $500B: $3C
    jr   label_5018                               ; $500C: $18 $0A

label_500E::
    ldh  a, [hJoypadState]                        ; $500E: $F0 $CC
    and  $04                                      ; $5010: $E6 $04
    jr   z, label_501D                            ; $5012: $28 $09

    ld   a, [wIntroTimer]                         ; $5014: $FA $01 $D0
    dec  a                                        ; $5017: $3D

label_5018::
    and  $03                                      ; $5018: $E6 $03
    ld   [wIntroTimer], a                         ; $501A: $EA $01 $D0

label_501D::
    ldh  a, [hJoypadState]                        ; $501D: $F0 $CC
    and  $90                                      ; $501F: $E6 $90
    jr   z, label_5055                            ; $5021: $28 $32

    ld   a, [wIntroTimer]                         ; $5023: $FA $01 $D0
    cp   $03                                      ; $5026: $FE $03
    jp   z, label_4555                            ; $5028: $CA $55 $45

    ld   hl, $DB80                                ; $502B: $21 $80 $DB
    ld   b, $00                                   ; $502E: $06 $00
    ld   a, [wIntroTimer]                         ; $5030: $FA $01 $D0
    and  a                                        ; $5033: $A7
    jr   z, label_5042                            ; $5034: $28 $0C

    cp   $01                                      ; $5036: $FE $01
    jr   z, label_503F                            ; $5038: $28 $05

    ld   hl, $DB8A                                ; $503A: $21 $8A $DB
    jr   label_5042                               ; $503D: $18 $03

label_503F::
    ld   hl, $DB85                                ; $503F: $21 $85 $DB

label_5042::
    xor  a                                        ; $5042: $AF
    add  [hl]                                     ; $5043: $86
    inc  hl                                       ; $5044: $23
    add  [hl]                                     ; $5045: $86
    inc  hl                                       ; $5046: $23
    add  [hl]                                     ; $5047: $86
    inc  hl                                       ; $5048: $23
    add  [hl]                                     ; $5049: $86
    inc  hl                                       ; $504A: $23
    add  [hl]                                     ; $504B: $86
    and  a                                        ; $504C: $A7
    jr   z, label_5055                            ; $504D: $28 $06

    call IncrementGameplaySubtypeAndReturn        ; $504F: $CD $D6 $44
    call PlayValidationJingleAndReturn            ; $5052: $CD $BE $49

label_5055::
    ld   a, [wIntroTimer]                         ; $5055: $FA $01 $D0
    ld   e, a                                     ; $5058: $5F
    ld   d, $00                                   ; $5059: $16 $00
    ld   hl, label_48E4                           ; $505B: $21 $E4 $48
    add  hl, de                                   ; $505E: $19
    ldh  a, [hFrameCounter]                       ; $505F: $F0 $E7
    and  $08                                      ; $5061: $E6 $08
    ld   a, [hl]                                  ; $5063: $7E
    ld   hl, wLinkOAMBuffer                       ; $5064: $21 $00 $C0

label_5067::
    jr   z, label_507D                            ; $5067: $28 $14

    push af                                       ; $5069: $F5
    ld   [hl+], a                                 ; $506A: $22
    ld   a, $10                                   ; $506B: $3E $10
    ld   [hl+], a                                 ; $506D: $22
    xor  a                                        ; $506E: $AF
    ld   [hl+], a                                 ; $506F: $22
    ld   [hl+], a                                 ; $5070: $22
    pop  af                                       ; $5071: $F1
    ld   [hl+], a                                 ; $5072: $22
    ld   a, $18                                   ; $5073: $3E $18
    ld   [hl+], a                                 ; $5075: $22
    ld   a, $02                                   ; $5076: $3E $02
    ld   [hl+], a                                 ; $5078: $22
    ld   a, $00                                   ; $5079: $3E $00
    ld   [hl], a                                  ; $507B: $77
    ret                                           ; $507C: $C9

label_507D::
    push af                                       ; $507D: $F5
    ld   [hl+], a                                 ; $507E: $22
    ld   a, $10                                   ; $507F: $3E $10
    ld   [hl+], a                                 ; $5081: $22
    ld   a, $02                                   ; $5082: $3E $02
    ld   [hl+], a                                 ; $5084: $22
    ld   a, $20                                   ; $5085: $3E $20
    ld   [hl+], a                                 ; $5087: $22
    pop  af                                       ; $5088: $F1
    ld   [hl+], a                                 ; $5089: $22
    ld   a, $18                                   ; $508A: $3E $18
    ld   [hl+], a                                 ; $508C: $22
    ld   a, $00                                   ; $508D: $3E $00
    ld   [hl+], a                                 ; $508F: $22
    ld   a, $20                                   ; $5090: $3E $20
    ld   [hl], a                                  ; $5092: $77
    ret                                           ; $5093: $C9

label_5094::
    ld   a, [wIntroTimer]                         ; $5094: $FA $01 $D0
    ld   e, a                                     ; $5097: $5F
    ld   d, $00                                   ; $5098: $16 $00
    ld   hl, label_48E4                           ; $509A: $21 $E4 $48
    add  hl, de                                   ; $509D: $19
    ld   a, [hl]                                  ; $509E: $7E
    ld   hl, wLinkOAMBuffer                       ; $509F: $21 $00 $C0
    add  $05                                      ; $50A2: $C6 $05
    ld   [hl+], a                                 ; $50A4: $22
    ld   a, $14                                   ; $50A5: $3E $14
    ld   [hl+], a                                 ; $50A7: $22
    ld   a, $BE                                   ; $50A8: $3E $BE
    ld   [hl+], a                                 ; $50AA: $22
    ld   a, $00                                   ; $50AB: $3E $00
    ld   [hl], a                                  ; $50AD: $77
    ret                                           ; $50AE: $C9

Data_001_50AF::
    db   $98, $A4, $44, $7E, $98, $C4, $44, $7E   ; $50AF
    db   $99, $04, $44, $7E, $99, $24, $44, $7E   ; $50B7
    db   $99, $64, $44, $7E, $99, $84, $44, $7E   ; $50BF

Data_001_50C7::
    db   $98, $AD, $44, $7E, $98, $CD, $44, $7E   ; $50C7
    db   $99, $0D, $44, $7E, $99, $2D, $44, $7E   ; $50CF
    db   $99, $6D, $44, $7E, $99, $8D, $44, $7E   ; $50D7

label_50DF::
    call label_6BA8                               ; $50DF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $50E2: $F0 $CC
    and  $08                                      ; $50E4: $E6 $08
    jr   z, label_50F1                            ; $50E6: $28 $09

    ld   a, [wIntroSubTimer]                      ; $50E8: $FA $02 $D0
    inc  a                                        ; $50EB: $3C
    and  $03                                      ; $50EC: $E6 $03
    ld   [wIntroSubTimer], a                      ; $50EE: $EA $02 $D0

label_50F1::
    ldh  a, [hJoypadState]                        ; $50F1: $F0 $CC
    and  $04                                      ; $50F3: $E6 $04
    jr   z, label_5104                            ; $50F5: $28 $0D

    ld   a, [wIntroSubTimer]                      ; $50F7: $FA $02 $D0
    dec  a                                        ; $50FA: $3D
    cp   $FF                                      ; $50FB: $FE $FF
    jr   nz, label_5101                           ; $50FD: $20 $02

    ld   a, $03                                   ; $50FF: $3E $03

label_5101::
    ld   [wIntroSubTimer], a                      ; $5101: $EA $02 $D0

label_5104::
    call label_5094                               ; $5104: $CD $94 $50
    ldh  a, [hJoypadState]                        ; $5107: $F0 $CC
    bit  5, a                                     ; $5109: $CB $6F
    jr   z, label_5114                            ; $510B: $28 $07

    ld   hl, wGameplaySubtype                     ; $510D: $21 $96 $DB
    dec  [hl]                                     ; $5110: $35
    jp   label_514F                               ; $5111: $C3 $4F $51

label_5114::
    and  $90                                      ; $5114: $E6 $90
    jr   z, label_5129                            ; $5116: $28 $11

    ld   a, [wIntroSubTimer]                      ; $5118: $FA $02 $D0
    cp   $03                                      ; $511B: $FE $03
    jp   z, label_4555                            ; $511D: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $5120: $CD $BE $49
    call IncrementGameplaySubtypeAndReturn        ; $5123: $CD $D6 $44
    jp   label_4E55                               ; $5126: $C3 $55 $4E

label_5129::
    call label_5175                               ; $5129: $CD $75 $51

label_512C::
    ldh  a, [hFrameCounter]                       ; $512C: $F0 $E7
    and  $10                                      ; $512E: $E6 $10
    jr   z, label_514F                            ; $5130: $28 $1D

    ld   a, [wIntroTimer]                         ; $5132: $FA $01 $D0
    rla                                           ; $5135: $17
    rla                                           ; $5136: $17
    rla                                           ; $5137: $17
    and  $F8                                      ; $5138: $E6 $F8
    ld   e, a                                     ; $513A: $5F
    ld   d, $00                                   ; $513B: $16 $00
    ld   hl, Data_001_50AF                        ; $513D: $21 $AF $50
    add  hl, de                                   ; $5140: $19
    ld   de, wRequestDestinationHigh              ; $5141: $11 $01 $D6
    ld   c, $08                                   ; $5144: $0E $08

label_5146::
    ld   a, [hl+]                                 ; $5146: $2A
    ld   [de], a                                  ; $5147: $12
    inc  de                                       ; $5148: $13
    dec  c                                        ; $5149: $0D
    jr   nz, label_5146                           ; $514A: $20 $FA

    xor  a                                        ; $514C: $AF
    ld   [de], a                                  ; $514D: $12
    ret                                           ; $514E: $C9

label_514F::
    ld   a, [wIntroTimer]                         ; $514F: $FA $01 $D0
    cp   $01                                      ; $5152: $FE $01
    jr   z, label_5163                            ; $5154: $28 $0D

    cp   $02                                      ; $5156: $FE $02
    jr   z, label_516C                            ; $5158: $28 $12

    ld   bc, $98C4                                ; $515A: $01 $C4 $98
    ld   de, $DB80                                ; $515D: $11 $80 $DB
    jp   func_4852                                ; $5160: $C3 $52 $48

label_5163::
    ld   bc, $9924                                ; $5163: $01 $24 $99
    ld   de, $DB85                                ; $5166: $11 $85 $DB
    jp   func_4852                                ; $5169: $C3 $52 $48

label_516C::
    ld   bc, $9984                                ; $516C: $01 $84 $99
    ld   de, $DB8A                                ; $516F: $11 $8A $DB
    jp   func_4852                                ; $5172: $C3 $52 $48

label_5175::
    ld   a, [wIntroSubTimer]                      ; $5175: $FA $02 $D0
    ld   e, a                                     ; $5178: $5F
    ld   d, $00                                   ; $5179: $16 $00
    ld   hl, label_48E4                           ; $517B: $21 $E4 $48
    add  hl, de                                   ; $517E: $19
    ld   a, [wIntroSubTimer]                      ; $517F: $FA $02 $D0
    cp   $03                                      ; $5182: $FE $03
    jp   z, label_51C3                            ; $5184: $CA $C3 $51

    ldh  a, [hFrameCounter]                       ; $5187: $F0 $E7
    and  $08                                      ; $5189: $E6 $08
    jr   z, label_51A8                            ; $518B: $28 $1B

    ld   a, [hl]                                  ; $518D: $7E
    ld   hl, $C008                                ; $518E: $21 $08 $C0
    push af                                       ; $5191: $F5
    ld   [hl+], a                                 ; $5192: $22
    ld   a, $58                                   ; $5193: $3E $58
    ld   [hl+], a                                 ; $5195: $22
    ld   a, $00                                   ; $5196: $3E $00
    ld   [hl+], a                                 ; $5198: $22
    ld   a, $00                                   ; $5199: $3E $00
    ld   [hl+], a                                 ; $519B: $22
    pop  af                                       ; $519C: $F1
    ld   [hl+], a                                 ; $519D: $22
    ld   a, $60                                   ; $519E: $3E $60
    ld   [hl+], a                                 ; $51A0: $22
    ld   a, $02                                   ; $51A1: $3E $02
    ld   [hl+], a                                 ; $51A3: $22
    ld   a, $00                                   ; $51A4: $3E $00
    ld   [hl], a                                  ; $51A6: $77
    ret                                           ; $51A7: $C9

label_51A8::
    ld   a, [hl]                                  ; $51A8: $7E
    ld   hl, $C008                                ; $51A9: $21 $08 $C0
    push af                                       ; $51AC: $F5
    ld   [hl+], a                                 ; $51AD: $22
    ld   a, $58                                   ; $51AE: $3E $58
    ld   [hl+], a                                 ; $51B0: $22
    ld   a, $02                                   ; $51B1: $3E $02
    ld   [hl+], a                                 ; $51B3: $22
    ld   a, $20                                   ; $51B4: $3E $20
    ld   [hl+], a                                 ; $51B6: $22
    pop  af                                       ; $51B7: $F1
    ld   [hl+], a                                 ; $51B8: $22
    ld   a, $60                                   ; $51B9: $3E $60
    ld   [hl+], a                                 ; $51BB: $22
    ld   a, $00                                   ; $51BC: $3E $00
    ld   [hl+], a                                 ; $51BE: $22
    ld   a, $20                                   ; $51BF: $3E $20
    ld   [hl], a                                  ; $51C1: $77
    ret                                           ; $51C2: $C9

label_51C3::
    ldh  a, [hFrameCounter]                       ; $51C3: $F0 $E7
    and  $08                                      ; $51C5: $E6 $08
    ld   a, [hl]                                  ; $51C7: $7E
    ld   hl, $C008                                ; $51C8: $21 $08 $C0
    jp   label_5067                               ; $51CB: $C3 $67 $50

label_51CE::
    ld   a, [wIntroSubTimer]                      ; $51CE: $FA $02 $D0
    ld   e, a                                     ; $51D1: $5F
    ld   d, $00                                   ; $51D2: $16 $00
    ld   hl, label_48E4                           ; $51D4: $21 $E4 $48
    add  hl, de                                   ; $51D7: $19
    ld   a, [hl]                                  ; $51D8: $7E
    ld   hl, $C008                                ; $51D9: $21 $08 $C0
    add  $05                                      ; $51DC: $C6 $05
    ld   [hl+], a                                 ; $51DE: $22
    ld   a, $5C                                   ; $51DF: $3E $5C
    ld   [hl+], a                                 ; $51E1: $22
    ld   a, $BE                                   ; $51E2: $3E $BE
    ld   [hl+], a                                 ; $51E4: $22
    ld   a, $00                                   ; $51E5: $3E $00
    ld   [hl], a                                  ; $51E7: $77
    ret                                           ; $51E8: $C9

label_51E9::
    call label_5094                               ; $51E9: $CD $94 $50
    call label_51CE                               ; $51EC: $CD $CE $51
    call label_4F0C                               ; $51EF: $CD $0C $4F
    ldh  a, [hJoypadState]                        ; $51F2: $F0 $CC
    and  $90                                      ; $51F4: $E6 $90
    jr   z, label_5235                            ; $51F6: $28 $3D

    ld   a, [wCreditsScratch0]                    ; $51F8: $FA $00 $D0
    and  a                                        ; $51FB: $A7
    jp   z, label_4555                            ; $51FC: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $51FF: $CD $BE $49
    ld   a, [wIntroTimer]                         ; $5202: $FA $01 $D0
    sla  a                                        ; $5205: $CB $27
    ld   e, a                                     ; $5207: $5F
    ld   d, $00                                   ; $5208: $16 $00
    ld   hl, label_49FE                           ; $520A: $21 $FE $49
    add  hl, de                                   ; $520D: $19
    ld   c, [hl]                                  ; $520E: $4E
    inc  hl                                       ; $520F: $23
    ld   b, [hl]                                  ; $5210: $46
    ld   a, [wIntroSubTimer]                      ; $5211: $FA $02 $D0
    sla  a                                        ; $5214: $CB $27
    ld   e, a                                     ; $5216: $5F
    ld   d, $00                                   ; $5217: $16 $00
    ld   hl, label_49FE                           ; $5219: $21 $FE $49
    add  hl, de                                   ; $521C: $19
    ld   a, [hl]                                  ; $521D: $7E
    inc  hl                                       ; $521E: $23
    ld   h, [hl]                                  ; $521F: $66
    ld   l, a                                     ; $5220: $6F
    ld   de, InterruptLCDStatus.skipScrollY       ; $5221: $11 $AD $03

label_5224::
    call EnableExternalRAMWriting                 ; $5224: $CD $D0 $27
    ld   a, [bc]                                  ; $5227: $0A
    inc  bc                                       ; $5228: $03
    call EnableExternalRAMWriting                 ; $5229: $CD $D0 $27
    ld   [hl+], a                                 ; $522C: $22
    dec  de                                       ; $522D: $1B
    ld   a, e                                     ; $522E: $7B
    or   d                                        ; $522F: $B2
    jr   nz, label_5224                           ; $5230: $20 $F2

    jp   label_4555                               ; $5232: $C3 $55 $45

label_5235::
    ldh  a, [hJoypadState]                        ; $5235: $F0 $CC
    bit  5, a                                     ; $5237: $CB $6F
    jr   z, label_5249                            ; $5239: $28 $0E

    ld   hl, wGameplaySubtype                     ; $523B: $21 $96 $DB
    dec  [hl]                                     ; $523E: $35
    xor  a                                        ; $523F: $AF
    ld   [wCreditsScratch0], a                    ; $5240: $EA $00 $D0
    call label_4EBB                               ; $5243: $CD $BB $4E
    jp   label_526F                               ; $5246: $C3 $6F $52

label_5249::
    call label_512C                               ; $5249: $CD $2C $51
    ldh  a, [hFrameCounter]                       ; $524C: $F0 $E7
    and  $10                                      ; $524E: $E6 $10
    jr   z, label_526F                            ; $5250: $28 $1D

    ld   a, [wIntroSubTimer]                      ; $5252: $FA $02 $D0
    rla                                           ; $5255: $17
    rla                                           ; $5256: $17
    rla                                           ; $5257: $17
    and  $F8                                      ; $5258: $E6 $F8
    ld   e, a                                     ; $525A: $5F
    ld   d, $00                                   ; $525B: $16 $00
    ld   hl, Data_001_50C7                        ; $525D: $21 $C7 $50
    add  hl, de                                   ; $5260: $19
    ld   de, $D609                                ; $5261: $11 $09 $D6
    ld   c, $08                                   ; $5264: $0E $08

label_5266::
    ld   a, [hl+]                                 ; $5266: $2A
    ld   [de], a                                  ; $5267: $12
    inc  de                                       ; $5268: $13
    dec  c                                        ; $5269: $0D
    jr   nz, label_5266                           ; $526A: $20 $FA

    xor  a                                        ; $526C: $AF
    ld   [de], a                                  ; $526D: $12
    ret                                           ; $526E: $C9

label_526F::
    ld   a, [wIntroSubTimer]                      ; $526F: $FA $02 $D0
    cp   $01                                      ; $5272: $FE $01
    jr   z, label_5283                            ; $5274: $28 $0D

    cp   $02                                      ; $5276: $FE $02
    jr   z, label_528C                            ; $5278: $28 $12

    ld   bc, $98CD                                ; $527A: $01 $CD $98
    ld   de, $DB80                                ; $527D: $11 $80 $DB
    jp   func_4852                                ; $5280: $C3 $52 $48

label_5283::
    ld   bc, $992D                                ; $5283: $01 $2D $99
    ld   de, $DB85                                ; $5286: $11 $85 $DB
    jp   func_4852                                ; $5289: $C3 $52 $48

label_528C::
    ld   bc, $998D                                ; $528C: $01 $8D $99
    ld   de, $DB8A                                ; $528F: $11 $8A $DB
    jp   func_4852                                ; $5292: $C3 $52 $48
