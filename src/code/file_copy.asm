;
; Code for copy file screen.
;

FileCopyEntryPoint::
    db $fa, $96, $db, $c7, $1a, $4d, $2c, $4d
    db $a6, $4f, $bb, $4f, $c3, $4f, $e1, $4f
    db $39, $4d, $49, $4d, $ff, $4f, $df, $50
    db $e9, $51

    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [wSaveSlot], a
    ld   [$D000], a
    ld   [$D001], a
    ld   [$D002], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $0C
    ld   [wBGMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   bc, $98C4
    ld   de, $DB80
    call func_4852
    ld   bc, $9924
    ld   de, $DB85
    call func_4852
    ld   bc, $9984
    ld   de, $DB8A
    call func_4852
    jp   IncrementGameplaySubtypeAndReturn
    ld   bc, $98CD
    ld   de, $DB80
    call func_4852
    ld   bc, $992D
    ld   de, $DB85
    call func_4852
    ld   bc, $998D
    ld   de, $DB8A
    call func_4852
    jp   IncrementGameplaySubtypeAndReturn
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_500E
    ld   a, [$D001]
    inc  a
    jr   label_5018

label_500E::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_501D
    ld   a, [$D001]
    dec  a

label_5018::
    and  $03
    ld   [$D001], a

label_501D::
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_5055
    ld   a, [$D001]
    cp   $03
    jp   z, label_4555
    ld   hl, $DB80
    ld   b, $00
    ld   a, [$D001]
    and  a
    jr   z, label_5042
    cp   $01
    jr   z, label_503F
    ld   hl, $DB8A
    jr   label_5042

label_503F::
    ld   hl, $DB85

label_5042::
    xor  a
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    and  a
    jr   z, label_5055
    call IncrementGameplaySubtype
    call PlayValidationJingle

label_5055::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ldh  a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, wOAMBuffer

label_5067::
    jr   z, label_507D
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_507D::
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_5094::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, wOAMBuffer
    add  a, $05
    ldi  [hl], a
    ld   a, $14
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

Data_001_50AF::
    db   $98, $A4, $44, $7E, $98, $C4, $44, $7E   ; $50AF
    db   $99, $04, $44, $7E, $99, $24, $44, $7E   ; $50B7
    db   $99, $64, $44, $7E, $99, $84, $44, $7E   ; $50BF

Data_001_50C7::
    db   $98, $AD, $44, $7E, $98, $CD, $44, $7E   ; $50C7
    db   $99, $0D, $44, $7E, $99, $2D, $44, $7E   ; $50CF
    db   $99, $6D, $44, $7E, $99, $8D, $44, $7E   ; $50D7

func_001_50DF::
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_50F1
    ld   a, [$D002]
    inc  a
    and  $03
    ld   [$D002], a

label_50F1::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_5104
    ld   a, [$D002]
    dec  a
    cp   $FF
    jr   nz, label_5101
    ld   a, $03

label_5101::
    ld   [$D002], a

label_5104::
    call label_5094
    ldh  a, [$FFCC]
    bit  5, a
    jr   z, label_5114
    ld   hl, wGameplaySubtype
    dec  [hl]
    jp   label_514F

label_5114::
    and  $90
    jr   z, label_5129
    ld   a, [$D002]
    cp   $03
    jp   z, label_4555
    call PlayValidationJingle
    call IncrementGameplaySubtype
    jp   label_4E55

label_5129::
    call label_5175

label_512C::
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_514F
    ld   a, [$D001]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_50AF
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_5146::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5146
    xor  a
    ld   [de], a
    ret

label_514F::
    ld   a, [$D001]
    cp   $01
    jr   z, label_5163
    cp   $02
    jr   z, label_516C
    ld   bc, $98C4
    ld   de, $DB80
    jp   func_4852

label_5163::
    ld   bc, $9924
    ld   de, $DB85
    jp   func_4852

label_516C::
    ld   bc, $9984
    ld   de, $DB8A
    jp   func_4852

label_5175::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [$D002]
    cp   $03
    jp   z, label_51C3
    ldh  a, [hFrameCounter]
    and  $08
    jr   z, label_51A8
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_51A8::
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_51C3::
    ldh  a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, $C008
    jp   label_5067

label_51CE::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C008
    add  a, $05
    ldi  [hl], a
    ld   a, $5C
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret
    call label_5094
    call label_51CE
    call label_4F0C
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_5235
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call PlayValidationJingle
    ld   a, [$D001]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   a, [hl]
    inc  hl
    ld   h, [hl]
    ld   l, a
    ld   de, $3AD

label_5224::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5224
    jp   label_4555

label_5235::
    ldh  a, [$FFCC]
    bit  5, a
    jr   z, label_5249
    ld   hl, wGameplaySubtype
    dec  [hl]
    xor  a
    ld   [$D000], a
    call label_4EBB
    jp   label_526F

label_5249::
    call label_512C
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_526F
    ld   a, [$D002]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_50C7
    add  hl, de
    ld   de, $D609
    ld   c, $08

label_5266::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5266
    xor  a
    ld   [de], a
    ret

label_526F::
    ld   a, [$D002]
    cp   $01
    jr   z, label_5283
    cp   $02
    jr   z, label_528C
    ld   bc, $98CD
    ld   de, $DB80
    jp   func_4852

label_5283::
    ld   bc, $992D
    ld   de, $DB85
    jp   func_4852

label_528C::
    ld   bc, $998D
    ld   de, $DB8A
    jp   func_4852
