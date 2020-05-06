;
; Cinematic sequence when reading the Face Shrine mural
;

FaceShrineMuralEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw FaceShrineMuralStage0Handler
._1 dw FaceShrineMuralStage1Handler
._2 dw FaceShrineMuralStage2Handler
._3 dw FaceShrineMuralStage3Handler
._4 dw FaceShrineMuralStage4Handler
._5 dw FaceShrineMuralStage5Handler
._6 dw FileSaveFadeOut

FaceShrineMuralStage0Handler::
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, FaceShrineMuralStage1Handler
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

FaceShrineMuralStage1Handler::
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

FaceShrineMuralStage2Handler::
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

FaceShrineMuralStage3Handler::
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B80
    call IncrementGameplaySubtype
    xor  a
    ld   [$C3C4], a

label_6B80::
    ret

FaceShrineMuralStage4Handler::
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

FaceShrineMuralStage5Handler::
    ldh  a, [hJoypadState]
    and  $B0
    jr   z, .return
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a
    call label_68D9
.return
    ret
