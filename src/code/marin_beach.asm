;
; Cinematic where Marin discuss with Link of the beach
;

MarineBeachEntryPoint::
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_6213
    ld   a, [$C3C7]
    and  a
    jr   z, jr_001_6213
    dec  a
    ld   [$C3C7], a

jr_001_6213::
    ld   a, [$C3C4]
    and  a
    jr   z, jr_001_621D
    dec  a
    ld   [$C3C4], a

jr_001_621D::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._00 dw MarineBeachPrepare0
._01 dw MarineBeachPrepare1
._02 dw MarineBeachPrepare2
._03 dw MarineBeachPrepare3
._04 dw MarineBeachScroll1
._05 dw MarineBeachScroll2
._06 dw MarineBeachScrollStop
._07 dw MarineBeachDialog1
._08 dw MarineBeachPause1
._09 dw MarineBeachDialog2
._0A dw MarineBeachPause2
._0B dw MarineBeachAreYouListening
._0C dw MarineBeachDialog3
._0D dw MarineBeachDialog4
._0E dw FileSaveFadeOut

MarineBeachPrepare0::
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, MarineBeachPrepare1

    ld   hl, $DC10
    ld   c, $80
    di

jr_001_624D::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, jr_001_624D
    xor  a
    ld   [rSVBK], a
    ei

MarineBeachPrepare1::
    ld   a, $01
    ld   [$C167], a
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, .return
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    call func_001_5888
    call func_001_64FF
    ld   a, $0F
    ld   [wTileMapToLoad], a
.return
    ret

MarineBeachPrepare2::
    ld   a, $13
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$C13F], a
    jp   IncrementGameplaySubtypeAndReturn

MarineBeachPrepare3::
    ld   a, $13
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $90
    ldh  [$FF97], a
    ld   a, $40
    ld   [$C114], a
    ld   a, $A0
    ld   [$D466], a
    ld   a, $01
    ld   [$DDD5], a
    ld   a, $E0
    ld   [wTranscientVfxPosYTable], a
    ld   a, $00
    ld   [wTranscientVfxPosXTable], a
    ld   a, TRANSCIENT_VFX_WATER_SPLASH
    ld   [wTranscientVfxTypeTable], a
    ld   a, $0C
    ld   [$C560], a
    ld   a, $08
    ld   [$C550], a
    ld   a, $00
    ld   [wTranscientVfxCountdownTable], a
    ld   [$D200], a
    ld   a, $20
    ld   [$C541], a
    ld   a, $A0
    ld   [$C531], a
    ld   a, $01
    ld   [$C511], a
    ld   a, $08
    ld   [$C561], a
    ld   a, $F8
    ld   [$C551], a
    ld   a, $40
    ld   [$C521], a
    ld   a, $24
    ld   [$D201], a
    ld   a, $48
    ld   [$C542], a
    ld   a, $30
    ld   [$C532], a
    ld   a, $02
    ld   [$C512], a
    ld   a, $00
    ld   [$C562], a
    ld   a, $00
    ld   [$C552], a
    ld   a, $00
    ld   [$C522], a
    ld   a, $02
    ld   [$D202], a
    ld   a, $3C
    ld   [$C543], a
    ld   a, $40
    ld   [$C533], a
    ld   a, $02
    ld   [$C513], a
    ld   a, $00
    ld   [$C563], a
    ld   a, $00
    ld   [$C553], a
    ld   a, $00
    ld   [$C523], a
    ld   a, $00
    ld   [$D203], a
    ld   a, $40
    ld   [$C544], a
    ld   a, $50
    ld   [$C534], a
    ld   a, $02
    ld   [$C514], a
    ld   a, $00
    ld   [$C564], a
    ld   a, $00
    ld   [$C554], a
    ld   a, $00
    ld   [$C524], a
    ld   a, $00
    ld   [$D204], a
    ld   a, $3C
    ld   [$C545], a
    ld   a, $60
    ld   [$C535], a
    ld   a, $02
    ld   [$C515], a
    ld   a, $00
    ld   [$C565], a
    ld   a, $00
    ld   [$C555], a
    ld   a, $00
    ld   [$C525], a
    ld   a, $00
    ld   [$D205], a
    ld   a, $44
    ld   [$C546], a
    ld   a, $68
    ld   [$C536], a
    ld   a, $02
    ld   [$C516], a
    ld   a, $00
    ld   [$C566], a
    ld   a, $00
    ld   [$C556], a
    ld   a, $00
    ld   [$C526], a
    ld   a, $00
    ld   [$D206], a
    jp   IncrementGameplaySubtypeAndReturn

Data_001_63AA::
    db 0, 0, 0, 0, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4

Data_001_63BA::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

MarineBeachScroll1::
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_001_63E4
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, MarineBeachScroll2
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, MarineBeachScroll2
    call IncrementGameplaySubtype
    jr   MarineBeachScroll2

jr_001_63E4::
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, jr_001_63F8
    ld   a, [$C3C5]
    inc  a
    ld   [$C3C5], a
    cp   $0C
    jr   nz, jr_001_63F8
    call IncrementGameplaySubtype

jr_001_63F8::
    ldh  a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$C3C5]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_63AA
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   [wOBJ1Palette], a
    ld   hl, Data_001_63BA
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a

MarineBeachScroll2::
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, jr_001_642E
    ldh  a, [$FF97]
    inc  a
    ldh  [$FF97], a
    cp   $00
    jr   nz, jr_001_642E
    ld   a, $80
    ld   [$C3C7], a
    call IncrementGameplaySubtype

jr_001_642E::
    call func_001_651E
    ret

MarineBeachScrollStop::
    call func_001_651E
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_644A
    ld   a, [$C3C7]
    and  a
    jr   nz, jr_001_6449
    ld   a, $D8
    call OpenMarinBeachDialog
    call IncrementGameplaySubtype

jr_001_6449::
    ret

jr_001_644A::
    ld   a, $02
    ld   [$C3C4], a
    ret

MarineBeachDialog1::
    call func_001_651E
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_6466
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call IncrementGameplaySubtype

jr_001_6466::
    ret

MarineBeachPause1::
    call func_001_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, jr_001_6478
    ld   a, $D9
    call OpenMarinBeachDialog
    jp   IncrementGameplaySubtypeAndReturn

jr_001_6478::
    ret

MarineBeachDialog2::
    call func_001_651E
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_648F
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call IncrementGameplaySubtype

jr_001_648F::
    ret

MarineBeachPause2::
    call func_001_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, jr_001_64A1
    ld   a, $DA
    call OpenMarinBeachDialog
    jp   IncrementGameplaySubtypeAndReturn

jr_001_64A1::
    ret

MarineBeachAreYouListening::
    call func_001_651E
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_64CA
    ld   a, [$C177]
    and  a
    jr   nz, jr_001_64BA
    ld   a, $DB
    call OpenMarinBeachDialog
    call IncrementGameplaySubtype
    ret

jr_001_64BA::
    ld   a, $DE
    call OpenMarinBeachDialog
    ld   a, $06
    ld   [wGameplaySubtype], a
    ld   a, $05
    ld   [$C3C7], a
    ret

jr_001_64CA::
    ld   a, $02
    ld   [$C3C4], a
    ret

MarineBeachDialog3::
    call func_001_651E
    ld   a, [$C19F]
    and  a
    jr   nz, jr_001_64E6
    ld   a, $DC
    call OpenMarinBeachDialog
    ld   a, $30
    ld   [$C3C7], a
    call IncrementGameplaySubtype

jr_001_64E6::
    ret

MarineBeachDialog4::
    call func_001_651E
    ld   a, $02
    ld   [$C3C4], a
    ld   a, [$C3C7]
    and  a
    ret  nz
    call label_27F2
    call func_001_68D9
    ld   a, $01
    ld   [wIsMarinFollowingLink], a

func_001_64FF::
    ld   e, $10
    ld   hl, wTranscientVfxTypeTable
    xor  a

jr_001_6505::
    ldi  [hl], a
    dec  e
    jr   nz, jr_001_6505
    ret

;
; Seagull animations and sounds
;

Data_001_650A::
    db $40, 1, $40, $21

Data_001_650E::
    db $46, 1, $48, 1

Data_001_6512::
    db $42, 0, $44, 0

Data_001_6516::
    db $42, 2, $44, 2

Data_001_651A::
    db $42, 3, $44, 3

func_001_651E::
    call func_001_65AE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, jr_001_652E
    ld   a, NOISE_SFX_SEA_WAVES
    ldh  [hNoiseSfx], a
    xor  a

jr_001_652E::
    ld   [$C114], a
    ld   a, [$D466]
    and  a
    jr   nz, jr_001_6545
    ld   a, JINGLE_SEAGULL
    ldh  [hJingle], a
    call GetRandomByte
    and  $7F
    add  a, $60
    ld   [$D466], a

jr_001_6545::
    dec  a
    ld   [$D466], a
    ldh  a, [$FF97]
    dec  a
    cp   $C0
    ret  c
    ld   de, Data_001_650A
    ld   a, [$C3C4]
    and  a
    jr   z, jr_001_655F
    cp   $60
    jr   nc, jr_001_655F
    ld   de, Data_001_650E

jr_001_655F::
    ld   a, $7C
    ldh  [hActiveEntityVisualPosY], a
    ld   a, $58
    ldh  [hActiveEntityPosX], a
    ld   hl, wDynamicOAMBuffer
    call func_001_658B
    ld   a, $48
    ldh  [hActiveEntityPosX], a
    ld   de, Data_001_6512
    ld   a, [$DC0F]
    and  a
    jr   z, jr_001_6584
    ld   de, Data_001_6516
    cp   $01
    jr   z, jr_001_6584
    ld   de, Data_001_651A

jr_001_6584::
    ld   hl, $C038
    call func_001_658B
    ret

func_001_658B::
    push bc
    ldh  a, [$FF97]
    ld   c, a
    ldh  a, [hActiveEntityVisualPosY]
    sub  a, c
    ldh  [$FFE8], a
    ldi  [hl], a
    ldh  a, [hActiveEntityPosX]
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ldh  a, [hActiveEntityVisualPosY]
    sub  a, c
    ldi  [hl], a
    ldh  a, [hActiveEntityPosX]
    add  a, $08
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ld   [hl], a
    pop  bc
    ret

func_001_65AE::
    ld   c, $08
    ld   b, $00

jr_001_65B2::
    ld   hl, wTranscientVfxTypeTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, jr_001_65D6
    push af
    ld   hl, wTranscientVfxPosXTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosX], a
    ld   hl, wTranscientVfxPosYTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ld   hl, wTranscientVfxCountdownTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, jr_001_65D2
    dec  [hl]

jr_001_65D2::
    pop  af
    call func_001_65DD

jr_001_65D6::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, jr_001_65B2
    ret

func_001_65DD::
    dec a
    JP_TABLE
._00 dw func_001_6673
._01 dw func_001_66FD

Data_001_65E3::
    dw Data_001_65EF
    dw Data_001_65F3
    dw Data_001_65F7
    dw Data_001_65FB
    dw Data_001_65FF
    dw Data_001_6603

Data_001_65EF:
    db $50, 0, $50, $20

Data_001_65F3:
    db $52, 0, $52, $20

Data_001_65F7:
    db $54, 0, $54, $20

Data_001_65FB:
    db $56, 0, $56, $20

Data_001_65FF:
    db $58, 0, $58, $20

Data_001_6603:
    db $5A, 0, $5A, $20

Data_001_6607::
    db 3, 3, 3, 3

jr_001_660B::
    db 3, 3, 3, 3, 3, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1
    db 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5
    db 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3
    db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3

jr_001_6646::
    db 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0
    db 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4
    db 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5

func_001_6673::
    ld   hl, wTranscientVfxCountdownTable
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   hl, $D210
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $06
    jr   c, jr_001_668B
    ld   [hl], b
    ld   hl, $D200
    add  hl, bc
    inc  [hl]

jr_001_668B::
    ld   hl, $D200
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, Data_001_6607
    add  hl, de
    ld   e, [hl]
    sla  e
    ld   d, b
    ld   hl, Data_001_65E3
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call func_001_658B
    call func_001_67A8
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, jr_001_66C4
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    cp   $FB
    jr   z, jr_001_66C4
    dec  [hl]

jr_001_66C4::
    ldh  a, [$FFE8]
    cp   $F0
    jr   c, jr_001_66D7
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   hl, wTranscientVfxTypeTable
    add  hl, bc
    ld   [hl], b

jr_001_66D7::
    ret

Data_001_66D8::
    dw Data_001_66E0
    dw Data_001_66E4
    dw Data_001_66E8
    dw Data_001_66EC

Data_001_66E0:
    db $4C, 0, $4C, $20

Data_001_66E4:
    db $4E, 0, $4E, $20

Data_001_66E8:
    db $5C, 0, $5C, $20

Data_001_66EC:
    db $5E, 0, $5E, $20

Data_001_66F0::
    db 1, $FF

jr_001_66F2::
    db 1, $FF, $FE, 2

Data_001_66F6::
    db 1, $FF, $4C, $52, $58, $5C, $60

func_001_66FD::
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    ld   e, $03
    and  $80
    jr   z, jr_001_6718
    ld   hl, $D200
    add  hl, bc
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, jr_001_6717
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

jr_001_6717::
    ld   e, [hl]

jr_001_6718::
    sla  e
    ld   d, b
    ld   hl, Data_001_66D8
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call func_001_658B

jr_001_6733::
    call func_001_67A8
    ld   a, c
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    ldh  a, [hFrameCounter]
    add  a, e
    ldh  [$FFE9], a

jr_001_6745::
    and  $3F
    jr   nz, jr_001_675A
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, Data_001_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C550
    add  hl, bc
    ld   [hl], a

jr_001_675A::
    ldh  a, [$FFE9]
    add  a, $40
    and  $3F
    jr   nz, jr_001_6773
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, Data_001_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C560
    add  hl, bc
    ld   [hl], a

jr_001_6773::
    ld   hl, $C590
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $13
    jr   c, jr_001_67A7
    ld   [hl], b
    ld   hl, Data_001_66F6
    add  hl, bc
    ld   d, [hl]
    ld   hl, wTranscientVfxPosXTable
    add  hl, bc
    ld   a, [hl]
    sub  a, d
    ld   e, $01
    and  $80
    jr   nz, jr_001_6792
    ld   e, $FF

jr_001_6792::
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    ld   hl, wTranscientVfxPosYTable
    add  hl, bc
    ld   a, [hl]
    sub  a, $48
    ld   e, $01
    and  $80
    jr   nz, jr_001_67A4
    ld   e, $FF

jr_001_67A4::
    ld   a, [hl]
    add  a, e
    ld   [hl], a

jr_001_67A7::
    ret

func_001_67A8::
    call func_001_67B5
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call func_001_67B5
    pop  bc
    ret

func_001_67B5::
    ld   hl, $C550
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C570
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, wTranscientVfxPosXTable
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, jr_001_67D4
    ld   e, $F0

jr_001_67D4::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

OpenMarinBeachDialog::
    ld   e, a
    ldh  a, [hLinkPositionY]
    push af
    ld   a, $60
    ldh  [hLinkPositionY], a
    ld   a, e
    call OpenDialogInTable1
    pop  af
    ldh  [hLinkPositionY], a
    ret
