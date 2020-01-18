;
; Cinematic sequence when reading the Face Shrine mural
;

FaceShrineMuralEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw label_6B0A
._1 dw label_6B2B
._2 dw label_6B52
._3 dw label_6B6F
._4 dw label_6B81
._5 dw label_6B9A
._6 dw FileSaveFadeOut

label_6B0A::
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6B2B
    ld   hl, $DC10
    ld   c, $80
    di

label_6B18::
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
    jr   nz, label_6B18
    xor  a
    ld   [rSVBK], a
    ei

label_6B2B::
    ld   a, $01
    ld   [$C167], a
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B51
    call label_5888
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    ld   a, $14
    ld   [wTileMapToLoad], a

label_6B51::
    ret

label_6B52::
    ld   a, $15
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn

label_6B6F::
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B80
    call IncrementGameplaySubtype
    xor  a
    ld   [$C3C4], a

label_6B80::
    ret

label_6B81::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C3C4]
    inc  a
    ld   [$C3C4], a
    jp   z, IncrementGameplaySubtype
    cp   $80
    jr   nz, label_6B99
    ld   a, $E7
    call OpenDialog

label_6B99::
    ret

label_6B9A::
    ldh  a, [$FFCC]
    and  $B0
    jr   z, label_6BA7
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a
    call label_68D9

label_6BA7::
    ret
