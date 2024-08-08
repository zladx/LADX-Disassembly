;
; Cinematic sequence when reading the Face Shrine mural
;

FaceShrineMuralEntryPoint::
    ld   a, [wGameplaySubtype]                    ;; 01:6AF8 $FA $96 $DB
    JP_TABLE                                      ;; 01:6AFB $C7
._0 dw FaceShrineMuralStage0Handler               ;; 01:6AFC
._1 dw FaceShrineMuralStage1Handler               ;; 01:6AFE
._2 dw FaceShrineMuralStage2Handler               ;; 01:6B00
._3 dw FaceShrineMuralStage3Handler               ;; 01:6B02
._4 dw FaceShrineMuralStage4Handler               ;; 01:6B04
._5 dw FaceShrineMuralStage5Handler               ;; 01:6B06
._6 dw FileSaveFadeOut                            ;; 01:6B08

FaceShrineMuralStage0Handler::
    call IncrementGameplaySubtype                 ;; 01:6B0A $CD $D6 $44
    ldh  a, [hIsGBC]                              ;; 01:6B0D $F0 $FE
    and  a                                        ;; 01:6B0F $A7
    jr   z, FaceShrineMuralStage1Handler          ;; 01:6B10 $28 $19
    ld   hl, wBGPal1                              ;; 01:6B12 $21 $10 $DC
    ld   c, $80                                   ;; 01:6B15 $0E $80
    di                                            ;; 01:6B17 $F3

.loop_6B18
    xor  a                                        ;; 01:6B18 $AF
    ldh  [rSVBK], a                               ;; 01:6B19 $E0 $70
    ld   b, [hl]                                  ;; 01:6B1B $46
    ld   a, $03                                   ;; 01:6B1C $3E $03
    ldh  [rSVBK], a                               ;; 01:6B1E $E0 $70
    ld   [hl], b                                  ;; 01:6B20 $70
    inc  hl                                       ;; 01:6B21 $23
    dec  c                                        ;; 01:6B22 $0D
    ld   a, c                                     ;; 01:6B23 $79
    and  a                                        ;; 01:6B24 $A7
    jr   nz, .loop_6B18                           ;; 01:6B25 $20 $F1
    xor  a                                        ;; 01:6B27 $AF
    ldh  [rSVBK], a                               ;; 01:6B28 $E0 $70
    ei                                            ;; 01:6B2A $FB

FaceShrineMuralStage1Handler::
    ld   a, $01                                   ;; 01:6B2B $3E $01
    ld   [wC167], a                               ;; 01:6B2D $EA $67 $C1
    call func_1A22                                ;; 01:6B30 $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:6B33 $FA $6B $C1
    cp   $04                                      ;; 01:6B36 $FE $04
    jr   nz, .ret_6B51                            ;; 01:6B38 $20 $17
    call func_001_5888                            ;; 01:6B3A $CD $88 $58
    ld   a, $03                                   ;; 01:6B3D $3E $03
    ldh  [hVolumeRight], a                        ;; 01:6B3F $E0 $A9
    ld   a, $30                                   ;; 01:6B41 $3E $30
    ldh  [hVolumeLeft], a                         ;; 01:6B43 $E0 $AA
    call IncrementGameplaySubtype                 ;; 01:6B45 $CD $D6 $44
    xor  a                                        ;; 01:6B48 $AF
    ld   [wScrollXOffset], a                      ;; 01:6B49 $EA $BF $C1
    ld   a, TILESET_FACE_SHRINE_MURAL             ;; 01:6B4C $3E $14
    ld   [wTilesetToLoad], a                      ;; 01:6B4E $EA $FE $D6

.ret_6B51
    ret                                           ;; 01:6B51 $C9

FaceShrineMuralStage2Handler::
    ld   a, TILEMAP_FACE_SHRINE_MURAL             ;; 01:6B52 $3E $15
    ld   [wBGMapToLoad], a                        ;; 01:6B54 $EA $FF $D6

    ld   a, $FF                                   ;; 01:6B57 $3E $FF
    ld   [wWindowY], a                            ;; 01:6B59 $EA $9A $DB
    xor  a                                        ;; 01:6B5C $AF
    ldh  [hBaseScrollX], a                        ;; 01:6B5D $E0 $96
    ldh  [hBaseScrollY], a                        ;; 01:6B5F $E0 $97
    ld   [wTransitionSequenceCounter], a          ;; 01:6B61 $EA $6B $C1
    ld   [wC16C], a                               ;; 01:6B64 $EA $6C $C1
    ld   a, $01                                   ;; 01:6B67 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 01:6B69 $EA $D5 $DD
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:6B6C $C3 $D6 $44

FaceShrineMuralStage3Handler::
    call func_1A39                                ;; 01:6B6F $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:6B72 $FA $6B $C1
    cp   $04                                      ;; 01:6B75 $FE $04
    jr   nz, .ret_6B80                            ;; 01:6B77 $20 $07
    call IncrementGameplaySubtype                 ;; 01:6B79 $CD $D6 $44
    xor  a                                        ;; 01:6B7C $AF
    ld   [wC3C4], a                               ;; 01:6B7D $EA $C4 $C3

.ret_6B80
    ret                                           ;; 01:6B80 $C9

FaceShrineMuralStage4Handler::
    ld   a, [wDialogState]                        ;; 01:6B81 $FA $9F $C1
    and  a                                        ;; 01:6B84 $A7
    ret  nz                                       ;; 01:6B85 $C0
    ld   a, [wC3C4]                               ;; 01:6B86 $FA $C4 $C3
    inc  a                                        ;; 01:6B89 $3C
    ld   [wC3C4], a                               ;; 01:6B8A $EA $C4 $C3
    jp   z, IncrementGameplaySubtype              ;; 01:6B8D $CA $D6 $44
    cp   $80                                      ;; 01:6B90 $FE $80
    jr   nz, .ret_6B99                            ;; 01:6B92 $20 $05
    call_open_dialog Dialog0E7                    ;; 01:6B94 $3E $E7 $CD $85 $23

.ret_6B99
    ret                                           ;; 01:6B99 $C9

FaceShrineMuralStage5Handler::
    ldh  a, [hJoypadState]                        ;; 01:6B9A $F0 $CC
    and  J_A | J_B | J_START                      ;; 01:6B9C $E6 $B0
    jr   z, .return                               ;; 01:6B9E $28 $07
    ld   a, JINGLE_VALIDATE                       ;; 01:6BA0 $3E $13
    ldh  [hJingle], a                             ;; 01:6BA2 $E0 $F2
    call func_001_68D9                            ;; 01:6BA4 $CD $D9 $68
.return
    ret                                           ;; 01:6BA7 $C9
