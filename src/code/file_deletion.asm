;
; Screen for deleting a saved file
;

FileDeletionEntryPoint::
    call func_5DC0
    ld   a, [wGameplaySubtype]
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   a, [de]
    ld   c, l
    inc  l
    ld   c, l
    ld   d, [hl]
    ld   c, l
    ld   h, l
    ld   c, l
    ld   l, l
    ld   c, l
    ld   a, c
    ld   c, l
    add  a, d
    ld   c, l
    adc  a, b
    ld   c, l
    add  hl, sp
    ld   c, l
    ld   c, c
    ld   c, l
    ld   b, $4E
    ld   l, e
    ld   c, [hl]
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $01
    call ClearFileMenuBG_trampoline
    ld   a, $01
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    call LoadFileMenuBG_trampoline
    ld   a, $01
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a

label_4D53::
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [wSaveSlot], a
    ld   [$D000], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $06
    ld   [wBGMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn

label_4D6D::
    call label_4D8B
    call label_4D94
    call label_4D9D
    jp   IncrementGameplaySubtypeAndReturn

label_4D7A::
    call label_4DA6
    call label_4DBE
    jp   IncrementGameplaySubtypeAndReturn
    call label_4DD6
    jp   IncrementGameplaySubtypeAndReturn
    jp   CopyDeathCountsToBG

label_4D8B::
    ld   bc, $98C5
    ld   de, $DB80
    jp   func_4852

label_4D94::
    ld   bc, $9925
    ld   de, $DB85
    jp   func_4852

label_4D9D::
    ld   bc, $9985
    ld   de, $DB8A
    jp   func_4852

label_4DA6::
    ld   a, [wSaveFilesCount]
    and  $01
    jr   z, label_4DBD
    xor  a
    ldh  [$FFDB], a
    ld   a, [$DC06]
    ldh  [hScratchC], a
    ld   a, [$DC09]
    ldh  [hScratchD], a
    jp   label_5D53

label_4DBD::
    ret

label_4DBE::
    ld   a, [wSaveFilesCount]
    and  $02
    jr   z, label_4DBD
    ld   a, $01
    ldh  [$FFDB], a
    ld   a, [$DC07]
    ldh  [hScratchC], a
    ld   a, [$DC0A]
    ldh  [hScratchD], a
    jp   label_5D53

label_4DD6::
    ld   a, [wSaveFilesCount]
    and  $04
    jr   z, label_4DBD
    ld   a, $02
    ldh  [$FFDB], a
    ld   a, [$DC08]
    ldh  [hScratchC], a
    ld   a, [$DC0B]
    ldh  [hScratchD], a
    jp   label_5D53

label_4DEE::
    sbc  a, b
    and  l
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    push bc
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  b
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   h, l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    add  a, l
    ld   b, h
    ld   a, [hl]
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_4E18
    ld   a, [wSaveSlot]
    inc  a
    and  $03
    ld   [wSaveSlot], a

label_4E18::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_4E2B
    ld   a, [wSaveSlot]
    dec  a
    cp   $FF
    jr   nz, label_4E28
    ld   a, $03

label_4E28::
    ld   [wSaveSlot], a

label_4E2B::
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_4E67
    ld   a, [wSaveSlot]
    cp   $03
    jr   nz, label_4E3B
    jp   label_4555

label_4E3B::
    call PlayValidationJingle
    call IncrementGameplaySubtype
    jr   label_4E55

label_4E43::
    db $99, $E4, $D, $7E, $7E, $10, $14, 8, $13, $7E, $7E, $7E, $7E, $E, $A, $7E, $7E, $00

label_4E55::
    ld   hl, $D601
    ld   de, label_4E43
    ld   c, $11

label_4E5D::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4E5D
    ret

label_4E67::
    call label_4954
    ret
    ldh  a, [$FFCC]
    bit  5, a
    jr   nz, label_4E9E
    and  $90
    jr   z, label_4ED9
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call PlayValidationJingle
    ld   a, [wSaveSlot]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $3A8

label_4E91::
    call EnableExternalRAMWriting
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_4E91
    jp   label_4555

label_4E9E::
    call label_4EE5
    call label_4EBB
    ld   hl, wGameplaySubtype
    dec  [hl]
    ret

label_4EA9::
    db $99, $E4, $D, $11, 4, $13, $14, $11, $D, $7E, $13, $E, $7E, $C, 4, $D
    db $14, 0

label_4EBB::
    ld   a, [$D600]
    ld   e, a
    add  a, $11
    ld   [$D600], a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    ld   de, label_4EA9
    ld   c, $11

label_4ECF::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4ECF
    ret

label_4ED9::
    call label_4F0C
    call label_4954
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_4EEF

label_4EE5::
    ld   a, [wSaveSlot]
    JP_TABLE
    ; Code below is actually data for the jump table
    adc  a, e
    ld   c, l
    sub  a, h
    ld   c, l
    sbc  a, l
    ld   c, l

label_4EEF::
    ld   a, [wSaveSlot]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_4DEE
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_4F03::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_4F03
    xor  a
    ld   [de], a
    ret

label_4F0C::
    ldh  a, [$FFCC]
    and  $03
    jr   z, label_4F1D
    call label_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

label_4F1D::
    ldh  a, [hFrameCounter]
    and  $10
    jr   nz, label_4F3A
    ld   a, [$D000]
    ld   e, a
    ld   a, $28
    dec  e
    jr   nz, label_4F2E
    ld   a, $6C

label_4F2E::
    ld   hl, $C00C
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4F3A::
    ret

label_4F3B::
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c

CopyDigitsToFileScreenBG::
    push hl
    ld   a, [$D600]
    ld   c, a
    add  a, $06
    ld   [$D600], a
    ld   b, $00
    ld   hl, $D601
    add  hl, bc
    ld   a, d
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    pop  bc
    push hl
    ld   a, c
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $F0
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret
