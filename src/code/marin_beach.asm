;
; Cinematic where Marin discusses with Link on the beach
;

MarinBeachEntryPoint::
    ld   a, [wDialogState]                        ;; 01:6203 $FA $9F $C1
    and  a                                        ;; 01:6206 $A7
    jr   nz, .jr_6213                             ;; 01:6207 $20 $0A
    ld   a, [wC3C7]                               ;; 01:6209 $FA $C7 $C3
    and  a                                        ;; 01:620C $A7
    jr   z, .jr_6213                              ;; 01:620D $28 $04
    dec  a                                        ;; 01:620F $3D
    ld   [wC3C7], a                               ;; 01:6210 $EA $C7 $C3

.jr_6213::
    ld   a, [wC3C4]                               ;; 01:6213 $FA $C4 $C3
    and  a                                        ;; 01:6216 $A7
    jr   z, .jr_621D                              ;; 01:6217 $28 $04
    dec  a                                        ;; 01:6219 $3D
    ld   [wC3C4], a                               ;; 01:621A $EA $C4 $C3

.jr_621D::
    ld   a, [wGameplaySubtype]                    ;; 01:621D $FA $96 $DB
    JP_TABLE                                      ;; 01:6220 $C7
._00 dw MarinBeachPrepare0                       ;; 01:6221
._01 dw MarinBeachPrepare1                       ;; 01:6223
._02 dw MarinBeachPrepare2                       ;; 01:6225
._03 dw MarinBeachPrepare3                       ;; 01:6227
._04 dw MarinBeachScroll1                        ;; 01:6229
._05 dw MarinBeachScroll2                        ;; 01:622B
._06 dw MarinBeachScrollStop                     ;; 01:622D
._07 dw MarinBeachDialog1                        ;; 01:622F
._08 dw MarinBeachPause1                         ;; 01:6231
._09 dw MarinBeachDialog2                        ;; 01:6233
._0A dw MarinBeachPause2                         ;; 01:6235
._0B dw MarinBeachAreYouListening                ;; 01:6237
._0C dw MarinBeachDialog3                        ;; 01:6239
._0D dw MarinBeachDialog4                        ;; 01:623B
._0E dw FileSaveFadeOut                           ;; 01:623D

MarinBeachPrepare0::
    call IncrementGameplaySubtype                 ;; 01:623F $CD $D6 $44
    ldh  a, [hIsGBC]                              ;; 01:6242 $F0 $FE
    and  a                                        ;; 01:6244 $A7
    jr   z, MarinBeachPrepare1                    ;; 01:6245 $28 $19

    ld   hl, wBGPal1                              ;; 01:6247 $21 $10 $DC
    ld   c, $80                                   ;; 01:624A $0E $80
    di                                            ;; 01:624C $F3

.loop_624D
    xor  a                                        ;; 01:624D $AF
    ldh  [rSVBK], a                               ;; 01:624E $E0 $70
    ld   b, [hl]                                  ;; 01:6250 $46
    ld   a, $03                                   ;; 01:6251 $3E $03
    ldh  [rSVBK], a                               ;; 01:6253 $E0 $70
    ld   [hl], b                                  ;; 01:6255 $70
    inc  hl                                       ;; 01:6256 $23
    dec  c                                        ;; 01:6257 $0D
    ld   a, c                                     ;; 01:6258 $79
    and  a                                        ;; 01:6259 $A7
    jr   nz, .loop_624D                           ;; 01:625A $20 $F1
    xor  a                                        ;; 01:625C $AF
    ldh  [rSVBK], a                               ;; 01:625D $E0 $70
    ei                                            ;; 01:625F $FB

MarinBeachPrepare1::
    ld   a, $01                                   ;; 01:6260 $3E $01
    ld   [wC167], a                               ;; 01:6262 $EA $67 $C1
    call func_1A22                                ;; 01:6265 $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:6268 $FA $6B $C1
    cp   $04                                      ;; 01:626B $FE $04
    jr   nz, .return                              ;; 01:626D $20 $12
    call IncrementGameplaySubtype                 ;; 01:626F $CD $D6 $44
    xor  a                                        ;; 01:6272 $AF
    ld   [wScrollXOffset], a                      ;; 01:6273 $EA $BF $C1
    call func_001_5888                            ;; 01:6276 $CD $88 $58
    call func_001_64FF                            ;; 01:6279 $CD $FF $64
    ld   a, TILESET_0F                            ;; 01:627C $3E $0F
    ld   [wTilesetToLoad], a                      ;; 01:627E $EA $FE $D6
.return
    ret                                           ;; 01:6281 $C9

MarinBeachPrepare2::
    ld   a, TILESET_MARIN_BEACH                   ;; 01:6282 $3E $13
    ld   [wTilesetToLoad], a                      ;; 01:6284 $EA $FE $D6
    xor  a                                        ;; 01:6287 $AF
    ld   [wC13F], a                               ;; 01:6288 $EA $3F $C1
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:628B $C3 $D6 $44

MarinBeachPrepare3::
    ld   a, TILEMAP_MARIN_BEACH                   ;; 01:628E $3E $13
    ld   [wBGMapToLoad], a                        ;; 01:6290 $EA $FF $D6

    ld   a, $FF                                   ;; 01:6293 $3E $FF
    ld   [wWindowY], a                            ;; 01:6295 $EA $9A $DB

    xor  a                                        ;; 01:6298 $AF
    ldh  [hBaseScrollX], a                        ;; 01:6299 $E0 $96
    ld   [wTransitionSequenceCounter], a          ;; 01:629B $EA $6B $C1
    ld   [wC16C], a                               ;; 01:629E $EA $6C $C1
    ld   a, $90                                   ;; 01:62A1 $3E $90
    ldh  [hBaseScrollY], a                        ;; 01:62A3 $E0 $97
    ld   a, $40                                   ;; 01:62A5 $3E $40
    ld   [wNoiseSfxSeaWavesCounter], a            ;; 01:62A7 $EA $14 $C1
    ld   a, $A0                                   ;; 01:62AA $3E $A0
    ld   [wD466], a                               ;; 01:62AC $EA $66 $D4
    ld   a, $01                                   ;; 01:62AF $3E $01
    ld   [wPaletteUnknownE], a                    ;; 01:62B1 $EA $D5 $DD
    ld   a, $E0                                   ;; 01:62B4 $3E $E0
    ld   [wTranscientVfxPosYTable], a             ;; 01:62B6 $EA $40 $C5
    ld   a, $00                                   ;; 01:62B9 $3E $00
    ld   [wTranscientVfxPosXTable], a             ;; 01:62BB $EA $30 $C5
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 01:62BE $3E $01
    ld   [wTranscientVfxTypeTable], a             ;; 01:62C0 $EA $10 $C5
    ld   a, $0C                                   ;; 01:62C3 $3E $0C
    ld   [wC560], a                               ;; 01:62C5 $EA $60 $C5
    ld   a, $08                                   ;; 01:62C8 $3E $08
    ld   [wC550], a                               ;; 01:62CA $EA $50 $C5
    ld   a, $00                                   ;; 01:62CD $3E $00
    ld   [wTranscientVfxCountdownTable], a        ;; 01:62CF $EA $20 $C5
    ld   [wD200], a                               ;; 01:62D2 $EA $00 $D2
    ld   a, $20                                   ;; 01:62D5 $3E $20
    ld   [wTranscientVfxPosYTable+1], a           ;; 01:62D7 $EA $41 $C5
    ld   a, $A0                                   ;; 01:62DA $3E $A0
    ld   [wTranscientVfxPosXTable+1], a           ;; 01:62DC $EA $31 $C5
    ld   a, $01                                   ;; 01:62DF $3E $01
    ld   [wTranscientVfxTypeTable+1], a           ;; 01:62E1 $EA $11 $C5
    ld   a, $08                                   ;; 01:62E4 $3E $08
    ld   [wC560+1], a                             ;; 01:62E6 $EA $61 $C5
    ld   a, $F8                                   ;; 01:62E9 $3E $F8
    ld   [wC550+1], a                             ;; 01:62EB $EA $51 $C5
    ld   a, $40                                   ;; 01:62EE $3E $40
    ld   [wTranscientVfxCountdownTable+1], a      ;; 01:62F0 $EA $21 $C5
    ld   a, $24                                   ;; 01:62F3 $3E $24
    ld   [wD201], a                               ;; 01:62F5 $EA $01 $D2
    ld   a, $48                                   ;; 01:62F8 $3E $48
    ld   [wTranscientVfxPosYTable+2], a           ;; 01:62FA $EA $42 $C5
    ld   a, $30                                   ;; 01:62FD $3E $30
    ld   [wTranscientVfxPosXTable+2], a           ;; 01:62FF $EA $32 $C5
    ld   a, $02                                   ;; 01:6302 $3E $02
    ld   [wTranscientVfxTypeTable+2], a           ;; 01:6304 $EA $12 $C5
    ld   a, $00                                   ;; 01:6307 $3E $00
    ld   [wC560+2], a                             ;; 01:6309 $EA $62 $C5
    ld   a, $00                                   ;; 01:630C $3E $00
    ld   [wC550+2], a                             ;; 01:630E $EA $52 $C5
    ld   a, $00                                   ;; 01:6311 $3E $00
    ld   [wTranscientVfxCountdownTable+2], a      ;; 01:6313 $EA $22 $C5
    ld   a, $02                                   ;; 01:6316 $3E $02
    ld   [wD202], a                               ;; 01:6318 $EA $02 $D2
    ld   a, $3C                                   ;; 01:631B $3E $3C
    ld   [wTranscientVfxPosYTable+3], a           ;; 01:631D $EA $43 $C5
    ld   a, $40                                   ;; 01:6320 $3E $40
    ld   [wTranscientVfxPosXTable+3], a           ;; 01:6322 $EA $33 $C5
    ld   a, $02                                   ;; 01:6325 $3E $02
    ld   [wTranscientVfxTypeTable+3], a           ;; 01:6327 $EA $13 $C5
    ld   a, $00                                   ;; 01:632A $3E $00
    ld   [wC560+3], a                             ;; 01:632C $EA $63 $C5
    ld   a, $00                                   ;; 01:632F $3E $00
    ld   [wC550+3], a                             ;; 01:6331 $EA $53 $C5
    ld   a, $00                                   ;; 01:6334 $3E $00
    ld   [wTranscientVfxCountdownTable+3], a      ;; 01:6336 $EA $23 $C5
    ld   a, $00                                   ;; 01:6339 $3E $00
    ld   [wD203], a                               ;; 01:633B $EA $03 $D2
    ld   a, $40                                   ;; 01:633E $3E $40
    ld   [wTranscientVfxPosYTable+4], a           ;; 01:6340 $EA $44 $C5
    ld   a, $50                                   ;; 01:6343 $3E $50
    ld   [wTranscientVfxPosXTable+4], a           ;; 01:6345 $EA $34 $C5
    ld   a, $02                                   ;; 01:6348 $3E $02
    ld   [wTranscientVfxTypeTable+4], a           ;; 01:634A $EA $14 $C5
    ld   a, $00                                   ;; 01:634D $3E $00
    ld   [wC560+4], a                             ;; 01:634F $EA $64 $C5
    ld   a, $00                                   ;; 01:6352 $3E $00
    ld   [wC550+4], a                             ;; 01:6354 $EA $54 $C5
    ld   a, $00                                   ;; 01:6357 $3E $00
    ld   [wTranscientVfxCountdownTable+4], a      ;; 01:6359 $EA $24 $C5
    ld   a, $00                                   ;; 01:635C $3E $00
    ld   [wD204], a                               ;; 01:635E $EA $04 $D2
    ld   a, $3C                                   ;; 01:6361 $3E $3C
    ld   [wTranscientVfxPosYTable+5], a           ;; 01:6363 $EA $45 $C5
    ld   a, $60                                   ;; 01:6366 $3E $60
    ld   [wTranscientVfxPosXTable+5], a           ;; 01:6368 $EA $35 $C5
    ld   a, $02                                   ;; 01:636B $3E $02
    ld   [wTranscientVfxTypeTable+5], a           ;; 01:636D $EA $15 $C5
    ld   a, $00                                   ;; 01:6370 $3E $00
    ld   [wC560+5], a                             ;; 01:6372 $EA $65 $C5
    ld   a, $00                                   ;; 01:6375 $3E $00
    ld   [wC550+5], a                             ;; 01:6377 $EA $55 $C5
    ld   a, $00                                   ;; 01:637A $3E $00
    ld   [wTranscientVfxCountdownTable+5], a      ;; 01:637C $EA $25 $C5
    ld   a, $00                                   ;; 01:637F $3E $00
    ld   [wD205], a                               ;; 01:6381 $EA $05 $D2
    ld   a, $44                                   ;; 01:6384 $3E $44
    ld   [wTranscientVfxPosYTable+6], a           ;; 01:6386 $EA $46 $C5
    ld   a, $68                                   ;; 01:6389 $3E $68
    ld   [wTranscientVfxPosXTable+6], a           ;; 01:638B $EA $36 $C5
    ld   a, $02                                   ;; 01:638E $3E $02
    ld   [wTranscientVfxTypeTable+6], a           ;; 01:6390 $EA $16 $C5
    ld   a, $00                                   ;; 01:6393 $3E $00
    ld   [wC560+6], a                             ;; 01:6395 $EA $66 $C5
    ld   a, $00                                   ;; 01:6398 $3E $00
    ld   [wC550+6], a                             ;; 01:639A $EA $56 $C5
    ld   a, $00                                   ;; 01:639D $3E $00
    ld   [wTranscientVfxCountdownTable+6], a      ;; 01:639F $EA $26 $C5
    ld   a, $00                                   ;; 01:63A2 $3E $00
    ld   [wD206], a                               ;; 01:63A4 $EA $06 $D2
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:63A7 $C3 $D6 $44

Data_001_63AA::
    db 0, 0, 0, 0, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4 ;; 01:63AA

Data_001_63BA::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C ;; 01:63BA

MarinBeachScroll1::
    ldh  a, [hIsGBC]                              ;; 01:63CA $F0 $FE
    and  a                                        ;; 01:63CC $A7
    jr   z, .jr_63E4                              ;; 01:63CD $28 $15
    ldh  a, [hFrameCounter]                       ;; 01:63CF $F0 $E7
    and  $07                                      ;; 01:63D1 $E6 $07
    jr   nz, MarinBeachScroll2                    ;; 01:63D3 $20 $42
    call func_1A39                                ;; 01:63D5 $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:63D8 $FA $6B $C1
    cp   $04                                      ;; 01:63DB $FE $04
    jr   nz, MarinBeachScroll2                    ;; 01:63DD $20 $38
    call IncrementGameplaySubtype                 ;; 01:63DF $CD $D6 $44
    jr   MarinBeachScroll2                        ;; 01:63E2 $18 $33

.jr_63E4::
    ldh  a, [hFrameCounter]                       ;; 01:63E4 $F0 $E7
    and  $07                                      ;; 01:63E6 $E6 $07
    jr   nz, .jr_63F8                             ;; 01:63E8 $20 $0E
    ld   a, [wC3C5]                               ;; 01:63EA $FA $C5 $C3
    inc  a                                        ;; 01:63ED $3C
    ld   [wC3C5], a                               ;; 01:63EE $EA $C5 $C3
    cp   $0C                                      ;; 01:63F1 $FE $0C
    jr   nz, .jr_63F8                             ;; 01:63F3 $20 $03
    call IncrementGameplaySubtype                 ;; 01:63F5 $CD $D6 $44

.jr_63F8::
    ldh  a, [hFrameCounter]                       ;; 01:63F8 $F0 $E7
    and  $03                                      ;; 01:63FA $E6 $03
    ld   e, a                                     ;; 01:63FC $5F
    ld   a, [wC3C5]                               ;; 01:63FD $FA $C5 $C3
    add  a, e                                     ;; 01:6400 $83
    ld   e, a                                     ;; 01:6401 $5F
    ld   d, $00                                   ;; 01:6402 $16 $00
    ld   hl, Data_001_63AA                        ;; 01:6404 $21 $AA $63
    add  hl, de                                   ;; 01:6407 $19
    ld   a, [hl]                                  ;; 01:6408 $7E
    ld   [wBGPalette], a                          ;; 01:6409 $EA $97 $DB
    ld   [wOBJ1Palette], a                        ;; 01:640C $EA $99 $DB
    ld   hl, Data_001_63BA                        ;; 01:640F $21 $BA $63
    add  hl, de                                   ;; 01:6412 $19
    ld   a, [hl]                                  ;; 01:6413 $7E
    ld   [wOBJ0Palette], a                        ;; 01:6414 $EA $98 $DB

MarinBeachScroll2::
    ldh  a, [hFrameCounter]                       ;; 01:6417 $F0 $E7
    and  $03                                      ;; 01:6419 $E6 $03
    jr   nz, .jr_642E                             ;; 01:641B $20 $11
    ldh  a, [hBaseScrollY]                        ;; 01:641D $F0 $97
    inc  a                                        ;; 01:641F $3C
    ldh  [hBaseScrollY], a                        ;; 01:6420 $E0 $97
    cp   $00                                      ;; 01:6422 $FE $00
    jr   nz, .jr_642E                             ;; 01:6424 $20 $08
    ld   a, $80                                   ;; 01:6426 $3E $80
    ld   [wC3C7], a                               ;; 01:6428 $EA $C7 $C3
    call IncrementGameplaySubtype                 ;; 01:642B $CD $D6 $44

.jr_642E::
    call func_001_651E                            ;; 01:642E $CD $1E $65
    ret                                           ;; 01:6431 $C9

MarinBeachScrollStop::
    call func_001_651E                            ;; 01:6432 $CD $1E $65
    ld   a, [wDialogState]                        ;; 01:6435 $FA $9F $C1
    and  a                                        ;; 01:6438 $A7
    jr   nz, jr_001_644A                          ;; 01:6439 $20 $0F
    ld   a, [wC3C7]                               ;; 01:643B $FA $C7 $C3
    and  a                                        ;; 01:643E $A7
    jr   nz, .ret_6449                            ;; 01:643F $20 $08
    ld_dialog_low a, Dialog1D8                    ;; 01:6441 $3E $D8
    call OpenMarinBeachDialog                     ;; 01:6443 $CD $DE $67
    call IncrementGameplaySubtype                 ;; 01:6446 $CD $D6 $44

.ret_6449
    ret                                           ;; 01:6449 $C9

jr_001_644A::
    ld   a, $02                                   ;; 01:644A $3E $02
    ld   [wC3C4], a                               ;; 01:644C $EA $C4 $C3
    ret                                           ;; 01:644F $C9

MarinBeachDialog1::
    call func_001_651E                            ;; 01:6450 $CD $1E $65
    ld   a, [wDialogState]                        ;; 01:6453 $FA $9F $C1
    and  a                                        ;; 01:6456 $A7
    jr   nz, .ret_6466                            ;; 01:6457 $20 $0D
    ld   a, $80                                   ;; 01:6459 $3E $80
    ld   [wC3C4], a                               ;; 01:645B $EA $C4 $C3
    ld   a, $C0                                   ;; 01:645E $3E $C0
    ld   [wC3C7], a                               ;; 01:6460 $EA $C7 $C3
    call IncrementGameplaySubtype                 ;; 01:6463 $CD $D6 $44

.ret_6466
    ret                                           ;; 01:6466 $C9

MarinBeachPause1::
    call func_001_651E                            ;; 01:6467 $CD $1E $65
    ld   a, [wC3C7]                               ;; 01:646A $FA $C7 $C3
    and  a                                        ;; 01:646D $A7
    jr   nz, .ret_6478                            ;; 01:646E $20 $08
    ld_dialog_low a, Dialog1D9                    ;; 01:6470 $3E $D9
    call OpenMarinBeachDialog                     ;; 01:6472 $CD $DE $67
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:6475 $C3 $D6 $44

.ret_6478
    ret                                           ;; 01:6478 $C9

MarinBeachDialog2::
    call func_001_651E                            ;; 01:6479 $CD $1E $65
    ld   a, [wDialogState]                        ;; 01:647C $FA $9F $C1
    and  a                                        ;; 01:647F $A7
    jr   nz, .ret_648F                            ;; 01:6480 $20 $0D
    ld   a, $80                                   ;; 01:6482 $3E $80
    ld   [wC3C4], a                               ;; 01:6484 $EA $C4 $C3
    ld   a, $C0                                   ;; 01:6487 $3E $C0
    ld   [wC3C7], a                               ;; 01:6489 $EA $C7 $C3
    call IncrementGameplaySubtype                 ;; 01:648C $CD $D6 $44

.ret_648F
    ret                                           ;; 01:648F $C9

MarinBeachPause2::
    call func_001_651E                            ;; 01:6490 $CD $1E $65
    ld   a, [wC3C7]                               ;; 01:6493 $FA $C7 $C3
    and  a                                        ;; 01:6496 $A7
    jr   nz, .ret_64A1                            ;; 01:6497 $20 $08
    ld_dialog_low a, Dialog1DA                    ;; 01:6499 $3E $DA
    call OpenMarinBeachDialog                     ;; 01:649B $CD $DE $67
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:649E $C3 $D6 $44

.ret_64A1
    ret                                           ;; 01:64A1 $C9

MarinBeachAreYouListening::
    call func_001_651E                            ;; 01:64A2 $CD $1E $65
    ld   a, [wDialogState]                        ;; 01:64A5 $FA $9F $C1
    and  a                                        ;; 01:64A8 $A7
    jr   nz, jr_001_64CA                          ;; 01:64A9 $20 $1F
    ld   a, [wDialogAskSelectionIndex]            ;; 01:64AB $FA $77 $C1
    and  a                                        ;; 01:64AE $A7
    jr   nz, .jr_64BA                             ;; 01:64AF $20 $09
    ld_dialog_low a, Dialog1DB                    ;; 01:64B1 $3E $DB
    call OpenMarinBeachDialog                     ;; 01:64B3 $CD $DE $67
    call IncrementGameplaySubtype                 ;; 01:64B6 $CD $D6 $44
    ret                                           ;; 01:64B9 $C9

.jr_64BA::
    ld_dialog_low a, Dialog1DE                    ;; 01:64BA $3E $DE
    call OpenMarinBeachDialog                     ;; 01:64BC $CD $DE $67
    ld   a, $06                                   ;; 01:64BF $3E $06
    ld   [wGameplaySubtype], a                    ;; 01:64C1 $EA $96 $DB
    ld   a, $05                                   ;; 01:64C4 $3E $05
    ld   [wC3C7], a                               ;; 01:64C6 $EA $C7 $C3
    ret                                           ;; 01:64C9 $C9

jr_001_64CA::
    ld   a, $02                                   ;; 01:64CA $3E $02
    ld   [wC3C4], a                               ;; 01:64CC $EA $C4 $C3
    ret                                           ;; 01:64CF $C9

MarinBeachDialog3::
    call func_001_651E                            ;; 01:64D0 $CD $1E $65
    ld   a, [wDialogState]                        ;; 01:64D3 $FA $9F $C1
    and  a                                        ;; 01:64D6 $A7
    jr   nz, .ret_64E6                            ;; 01:64D7 $20 $0D
    ld_dialog_low a, Dialog1DC                    ;; 01:64D9 $3E $DC
    call OpenMarinBeachDialog                     ;; 01:64DB $CD $DE $67
    ld   a, $30                                   ;; 01:64DE $3E $30
    ld   [wC3C7], a                               ;; 01:64E0 $EA $C7 $C3
    call IncrementGameplaySubtype                 ;; 01:64E3 $CD $D6 $44

.ret_64E6
    ret                                           ;; 01:64E6 $C9

MarinBeachDialog4::
    call func_001_651E                            ;; 01:64E7 $CD $1E $65
    ld   a, $02                                   ;; 01:64EA $3E $02
    ld   [wC3C4], a                               ;; 01:64EC $EA $C4 $C3
    ld   a, [wC3C7]                               ;; 01:64EF $FA $C7 $C3
    and  a                                        ;; 01:64F2 $A7
    ret  nz                                       ;; 01:64F3 $C0
    call label_27F2                               ;; 01:64F4 $CD $F2 $27
    call func_001_68D9                            ;; 01:64F7 $CD $D9 $68
    ld   a, $01                                   ;; 01:64FA $3E $01
    ld   [wIsMarinFollowingLink], a               ;; 01:64FC $EA $73 $DB

func_001_64FF::
    ld   e, $10                                   ;; 01:64FF $1E $10
    ld   hl, wTranscientVfxTypeTable              ;; 01:6501 $21 $10 $C5
    xor  a                                        ;; 01:6504 $AF

.loop_6505
    ldi  [hl], a                                  ;; 01:6505 $22
    dec  e                                        ;; 01:6506 $1D
    jr   nz, .loop_6505                           ;; 01:6507 $20 $FC
    ret                                           ;; 01:6509 $C9

;
; Seagull animations and sounds
;

Data_001_650A::
    db $40, 1, $40, $21                           ;; 01:650A

Data_001_650E::
    db $46, 1, $48, 1                             ;; 01:650E

Data_001_6512::
    db $42, 0, $44, 0                             ;; 01:6512

Data_001_6516::
    db $42, 2, $44, 2                             ;; 01:6516

Data_001_651A::
    db $42, 3, $44, 3                             ;; 01:651A

func_001_651E::
    call func_001_65AE                            ;; 01:651E $CD $AE $65
    ld   a, [wNoiseSfxSeaWavesCounter]            ;; 01:6521 $FA $14 $C1
    inc  a                                        ;; 01:6524 $3C
    cp   $A0                                      ;; 01:6525 $FE $A0
    jr   nz, .jr_652E                             ;; 01:6527 $20 $05
    ld   a, NOISE_SFX_SEA_WAVES                   ;; 01:6529 $3E $0F
    ldh  [hNoiseSfx], a                           ;; 01:652B $E0 $F4
    xor  a                                        ;; 01:652D $AF

.jr_652E::
    ld   [wNoiseSfxSeaWavesCounter], a            ;; 01:652E $EA $14 $C1
    ld   a, [wD466]                               ;; 01:6531 $FA $66 $D4
    and  a                                        ;; 01:6534 $A7
    jr   nz, .jr_6545                             ;; 01:6535 $20 $0E
    ld   a, JINGLE_SEAGULL                        ;; 01:6537 $3E $21
    ldh  [hJingle], a                             ;; 01:6539 $E0 $F2
    call GetRandomByte                            ;; 01:653B $CD $0D $28
    and  $7F                                      ;; 01:653E $E6 $7F
    add  a, $60                                   ;; 01:6540 $C6 $60
    ld   [wD466], a                               ;; 01:6542 $EA $66 $D4

.jr_6545::
    dec  a                                        ;; 01:6545 $3D
    ld   [wD466], a                               ;; 01:6546 $EA $66 $D4
    ldh  a, [hBaseScrollY]                        ;; 01:6549 $F0 $97
    dec  a                                        ;; 01:654B $3D
    cp   $C0                                      ;; 01:654C $FE $C0
    ret  c                                        ;; 01:654E $D8
    ld   de, Data_001_650A                        ;; 01:654F $11 $0A $65
    ld   a, [wC3C4]                               ;; 01:6552 $FA $C4 $C3
    and  a                                        ;; 01:6555 $A7
    jr   z, .jr_655F                              ;; 01:6556 $28 $07
    cp   $60                                      ;; 01:6558 $FE $60
    jr   nc, .jr_655F                             ;; 01:655A $30 $03
    ld   de, Data_001_650E                        ;; 01:655C $11 $0E $65

.jr_655F::
    ld   a, $7C                                   ;; 01:655F $3E $7C
    ldh  [hActiveEntityVisualPosY], a             ;; 01:6561 $E0 $EC
    ld   a, $58                                   ;; 01:6563 $3E $58
    ldh  [hActiveEntityPosX], a                   ;; 01:6565 $E0 $EE
    ld   hl, wDynamicOAMBuffer                    ;; 01:6567 $21 $30 $C0
    call func_001_658B                            ;; 01:656A $CD $8B $65
    ld   a, $48                                   ;; 01:656D $3E $48
    ldh  [hActiveEntityPosX], a                   ;; 01:656F $E0 $EE
    ; TUNIC_GREEN
    ld   de, Data_001_6512                        ;; 01:6571 $11 $12 $65
    ld   a, [wTunicType]                          ;; 01:6574 $FA $0F $DC
    and  a                                        ;; 01:6577 $A7
    jr   z, .loadTunic                            ;; 01:6578 $28 $0A
    ld   de, Data_001_6516                        ;; 01:657A $11 $16 $65
    cp   TUNIC_RED                                ;; 01:657D $FE $01
    jr   z, .loadTunic                            ;; 01:657F $28 $03
    ; TUNIC_BLUE
    ld   de, Data_001_651A                        ;; 01:6581 $11 $1A $65

.loadTunic::
    ld   hl, wDynamicOAMBuffer+8                  ;; 01:6584 $21 $38 $C0
    call func_001_658B                            ;; 01:6587 $CD $8B $65
    ret                                           ;; 01:658A $C9

func_001_658B::
    push bc                                       ;; 01:658B $C5
    ldh  a, [hBaseScrollY]                        ;; 01:658C $F0 $97
    ld   c, a                                     ;; 01:658E $4F
    ldh  a, [hActiveEntityVisualPosY]             ;; 01:658F $F0 $EC
    sub  a, c                                     ;; 01:6591 $91
    ldh  [hMultiPurposeG], a                      ;; 01:6592 $E0 $E8
    ldi  [hl], a                                  ;; 01:6594 $22
    ldh  a, [hActiveEntityPosX]                   ;; 01:6595 $F0 $EE
    ldi  [hl], a                                  ;; 01:6597 $22
    ld   a, [de]                                  ;; 01:6598 $1A
    inc  de                                       ;; 01:6599 $13
    ldi  [hl], a                                  ;; 01:659A $22
    ld   a, [de]                                  ;; 01:659B $1A
    inc  de                                       ;; 01:659C $13
    ldi  [hl], a                                  ;; 01:659D $22
    ldh  a, [hActiveEntityVisualPosY]             ;; 01:659E $F0 $EC
    sub  a, c                                     ;; 01:65A0 $91
    ldi  [hl], a                                  ;; 01:65A1 $22
    ldh  a, [hActiveEntityPosX]                   ;; 01:65A2 $F0 $EE
    add  a, $08                                   ;; 01:65A4 $C6 $08
    ldi  [hl], a                                  ;; 01:65A6 $22
    ld   a, [de]                                  ;; 01:65A7 $1A
    inc  de                                       ;; 01:65A8 $13
    ldi  [hl], a                                  ;; 01:65A9 $22
    ld   a, [de]                                  ;; 01:65AA $1A
    ld   [hl], a                                  ;; 01:65AB $77
    pop  bc                                       ;; 01:65AC $C1
    ret                                           ;; 01:65AD $C9

func_001_65AE::
    ld   c, $08                                   ;; 01:65AE $0E $08
    ld   b, $00                                   ;; 01:65B0 $06 $00

jr_001_65B2::
    ld   hl, wTranscientVfxTypeTable              ;; 01:65B2 $21 $10 $C5
    add  hl, bc                                   ;; 01:65B5 $09
    ld   a, [hl]                                  ;; 01:65B6 $7E
    and  a                                        ;; 01:65B7 $A7
    jr   z, jr_001_65D6                           ;; 01:65B8 $28 $1C
    push af                                       ;; 01:65BA $F5
    ld   hl, wTranscientVfxPosXTable              ;; 01:65BB $21 $30 $C5
    add  hl, bc                                   ;; 01:65BE $09
    ld   a, [hl]                                  ;; 01:65BF $7E
    ldh  [hActiveEntityPosX], a                   ;; 01:65C0 $E0 $EE
    ld   hl, wTranscientVfxPosYTable              ;; 01:65C2 $21 $40 $C5
    add  hl, bc                                   ;; 01:65C5 $09
    ld   a, [hl]                                  ;; 01:65C6 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 01:65C7 $E0 $EC
    ld   hl, wTranscientVfxCountdownTable         ;; 01:65C9 $21 $20 $C5
    add  hl, bc                                   ;; 01:65CC $09
    ld   a, [hl]                                  ;; 01:65CD $7E
    and  a                                        ;; 01:65CE $A7
    jr   z, .jr_65D2                              ;; 01:65CF $28 $01
    dec  [hl]                                     ;; 01:65D1 $35

.jr_65D2::
    pop  af                                       ;; 01:65D2 $F1
    call func_001_65DD                            ;; 01:65D3 $CD $DD $65

jr_001_65D6::
    dec  c                                        ;; 01:65D6 $0D
    ld   a, c                                     ;; 01:65D7 $79
    cp   $FF                                      ;; 01:65D8 $FE $FF
    jr   nz, jr_001_65B2                          ;; 01:65DA $20 $D6
    ret                                           ;; 01:65DC $C9

func_001_65DD::
    dec a                                         ;; 01:65DD $3D
    JP_TABLE                                      ;; 01:65DE $C7
._00 dw func_001_6673                             ;; 01:65DF
._01 dw func_001_66FD                             ;; 01:65E1

Data_001_65E3::
    dw Data_001_65EF                              ;; 01:65E3
    dw Data_001_65F3                              ;; 01:65E5
    dw Data_001_65F7                              ;; 01:65E7
    dw Data_001_65FB                              ;; 01:65E9
    dw Data_001_65FF                              ;; 01:65EB
    dw Data_001_6603                              ;; 01:65ED

Data_001_65EF:
    db $50, 0, $50, $20                           ;; 01:65EF

Data_001_65F3:
    db $52, 0, $52, $20                           ;; 01:65F3

Data_001_65F7:
    db $54, 0, $54, $20                           ;; 01:65F7

Data_001_65FB:
    db $56, 0, $56, $20                           ;; 01:65FB

Data_001_65FF:
    db $58, 0, $58, $20                           ;; 01:65FF

Data_001_6603:
    db $5A, 0, $5A, $20                           ;; 01:6603

Data_001_6607::
    db 3, 3, 3, 3                                 ;; 01:6607

jr_001_660B::
    db 3, 3, 3, 3, 3, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1 ;; 01:660B
    db 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5 ;; 01:661B
    db 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3 ;; 01:662B
    db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3            ;; 01:663B

jr_001_6646::
    db 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0 ;; 01:6646
    db 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4 ;; 01:6656
    db 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5      ;; 01:6666

func_001_6673::
    ld   hl, wTranscientVfxCountdownTable         ;; 01:6673 $21 $20 $C5
    add  hl, bc                                   ;; 01:6676 $09
    ld   a, [hl]                                  ;; 01:6677 $7E
    and  a                                        ;; 01:6678 $A7
    ret  nz                                       ;; 01:6679 $C0
    ld   hl, wD210                                ;; 01:667A $21 $10 $D2
    add  hl, bc                                   ;; 01:667D $09
    ld   a, [hl]                                  ;; 01:667E $7E
    inc  a                                        ;; 01:667F $3C
    ld   [hl], a                                  ;; 01:6680 $77
    cp   $06                                      ;; 01:6681 $FE $06
    jr   c, .jr_668B                              ;; 01:6683 $38 $06
    ld   [hl], b                                  ;; 01:6685 $70
    ld   hl, wD200                                ;; 01:6686 $21 $00 $D2
    add  hl, bc                                   ;; 01:6689 $09
    inc  [hl]                                     ;; 01:668A $34

.jr_668B::
    ld   hl, wD200                                ;; 01:668B $21 $00 $D2
    add  hl, bc                                   ;; 01:668E $09
    ld   e, [hl]                                  ;; 01:668F $5E
    ld   d, b                                     ;; 01:6690 $50
    ld   hl, Data_001_6607                        ;; 01:6691 $21 $07 $66
    add  hl, de                                   ;; 01:6694 $19
    ld   e, [hl]                                  ;; 01:6695 $5E
    sla  e                                        ;; 01:6696 $CB $23
    ld   d, b                                     ;; 01:6698 $50
    ld   hl, Data_001_65E3                        ;; 01:6699 $21 $E3 $65
    add  hl, de                                   ;; 01:669C $19
    ld   a, [hli]                                 ;; 01:669D $2A
    ld   d, [hl]                                  ;; 01:669E $56
    ld   e, a                                     ;; 01:669F $5F
    push de                                       ;; 01:66A0 $D5
    ld   hl, wDynamicOAMBuffer+$10                ;; 01:66A1 $21 $40 $C0
    ld   a, c                                     ;; 01:66A4 $79
    rla                                           ;; 01:66A5 $17
    rla                                           ;; 01:66A6 $17
    rla                                           ;; 01:66A7 $17
    and  $78                                      ;; 01:66A8 $E6 $78
    ld   e, a                                     ;; 01:66AA $5F
    ld   d, b                                     ;; 01:66AB $50
    add  hl, de                                   ;; 01:66AC $19
    pop  de                                       ;; 01:66AD $D1
    call func_001_658B                            ;; 01:66AE $CD $8B $65
    call func_001_67A8                            ;; 01:66B1 $CD $A8 $67
    ldh  a, [hFrameCounter]                       ;; 01:66B4 $F0 $E7
    and  $07                                      ;; 01:66B6 $E6 $07
    jr   nz, .jr_66C4                             ;; 01:66B8 $20 $0A
    ld   hl, wC560                                ;; 01:66BA $21 $60 $C5
    add  hl, bc                                   ;; 01:66BD $09
    ld   a, [hl]                                  ;; 01:66BE $7E
    cp   $FB                                      ;; 01:66BF $FE $FB
    jr   z, .jr_66C4                              ;; 01:66C1 $28 $01
    dec  [hl]                                     ;; 01:66C3 $35

.jr_66C4::
    ldh  a, [hMultiPurposeG]                      ;; 01:66C4 $F0 $E8
    cp   $F0                                      ;; 01:66C6 $FE $F0
    jr   c, .ret_66D7                             ;; 01:66C8 $38 $0D
    ld   hl, wC560                                ;; 01:66CA $21 $60 $C5
    add  hl, bc                                   ;; 01:66CD $09
    ld   a, [hl]                                  ;; 01:66CE $7E
    and  $80                                      ;; 01:66CF $E6 $80
    ret  z                                        ;; 01:66D1 $C8
    ld   hl, wTranscientVfxTypeTable              ;; 01:66D2 $21 $10 $C5
    add  hl, bc                                   ;; 01:66D5 $09
    ld   [hl], b                                  ;; 01:66D6 $70

.ret_66D7
    ret                                           ;; 01:66D7 $C9

Data_001_66D8::
    dw Data_001_66E0                              ;; 01:66D8
    dw Data_001_66E4                              ;; 01:66DA
    dw Data_001_66E8                              ;; 01:66DC
    dw Data_001_66EC                              ;; 01:66DE

Data_001_66E0:
    db $4C, 0, $4C, $20                           ;; 01:66E0

Data_001_66E4:
    db $4E, 0, $4E, $20                           ;; 01:66E4

Data_001_66E8:
    db $5C, 0, $5C, $20                           ;; 01:66E8

Data_001_66EC:
    db $5E, 0, $5E, $20                           ;; 01:66EC

Data_001_66F0::
    db 1, $FF                                     ;; 01:66F0

jr_001_66F2::
    db 1, $FF, $FE, 2                             ;; 01:66F2

Data_001_66F6::
    db 1, $FF, $4C, $52, $58, $5C, $60            ;; 01:66F6

func_001_66FD::
    ld   hl, wC560                                ;; 01:66FD $21 $60 $C5
    add  hl, bc                                   ;; 01:6700 $09
    ld   a, [hl]                                  ;; 01:6701 $7E
    ld   e, $03                                   ;; 01:6702 $1E $03
    and  $80                                      ;; 01:6704 $E6 $80
    jr   z, jr_001_6718                           ;; 01:6706 $28 $10
    ld   hl, wD200                                ;; 01:6708 $21 $00 $D2
    add  hl, bc                                   ;; 01:670B $09
    ldh  a, [hFrameCounter]                       ;; 01:670C $F0 $E7
    and  $07                                      ;; 01:670E $E6 $07
    jr   nz, .jr_6717                             ;; 01:6710 $20 $05
    ld   a, [hl]                                  ;; 01:6712 $7E
    inc  a                                        ;; 01:6713 $3C
    and  $03                                      ;; 01:6714 $E6 $03
    ld   [hl], a                                  ;; 01:6716 $77

.jr_6717::
    ld   e, [hl]                                  ;; 01:6717 $5E

jr_001_6718::
    sla  e                                        ;; 01:6718 $CB $23
    ld   d, b                                     ;; 01:671A $50
    ld   hl, Data_001_66D8                        ;; 01:671B $21 $D8 $66
    add  hl, de                                   ;; 01:671E $19
    ld   a, [hli]                                 ;; 01:671F $2A
    ld   d, [hl]                                  ;; 01:6720 $56
    ld   e, a                                     ;; 01:6721 $5F
    push de                                       ;; 01:6722 $D5
    ld   hl, wDynamicOAMBuffer+$10                ;; 01:6723 $21 $40 $C0
    ld   a, c                                     ;; 01:6726 $79
    rla                                           ;; 01:6727 $17
    rla                                           ;; 01:6728 $17
    rla                                           ;; 01:6729 $17
    and  $78                                      ;; 01:672A $E6 $78
    ld   e, a                                     ;; 01:672C $5F
    ld   d, b                                     ;; 01:672D $50
    add  hl, de                                   ;; 01:672E $19
    pop  de                                       ;; 01:672F $D1
    call func_001_658B                            ;; 01:6730 $CD $8B $65

.jr_6733::
    call func_001_67A8                            ;; 01:6733 $CD $A8 $67
    ld   a, c                                     ;; 01:6736 $79
    sla  a                                        ;; 01:6737 $CB $27
    sla  a                                        ;; 01:6739 $CB $27
    sla  a                                        ;; 01:673B $CB $27
    sla  a                                        ;; 01:673D $CB $27
    ld   e, a                                     ;; 01:673F $5F
    ldh  a, [hFrameCounter]                       ;; 01:6740 $F0 $E7
    add  a, e                                     ;; 01:6742 $83
    ldh  [hMultiPurposeH], a                      ;; 01:6743 $E0 $E9

.jr_6745::
    and  $3F                                      ;; 01:6745 $E6 $3F
    jr   nz, .jr_675A                             ;; 01:6747 $20 $11
    call GetRandomByte                            ;; 01:6749 $CD $0D $28
    and  $07                                      ;; 01:674C $E6 $07
    ld   e, a                                     ;; 01:674E $5F
    ld   d, b                                     ;; 01:674F $50
    ld   hl, Data_001_66F0                        ;; 01:6750 $21 $F0 $66
    add  hl, de                                   ;; 01:6753 $19
    ld   a, [hl]                                  ;; 01:6754 $7E
    ld   hl, wC550                                ;; 01:6755 $21 $50 $C5
    add  hl, bc                                   ;; 01:6758 $09
    ld   [hl], a                                  ;; 01:6759 $77

.jr_675A::
    ldh  a, [hMultiPurposeH]                      ;; 01:675A $F0 $E9
    add  a, $40                                   ;; 01:675C $C6 $40
    and  $3F                                      ;; 01:675E $E6 $3F
    jr   nz, .jr_6773                             ;; 01:6760 $20 $11
    call GetRandomByte                            ;; 01:6762 $CD $0D $28
    and  $07                                      ;; 01:6765 $E6 $07
    ld   e, a                                     ;; 01:6767 $5F
    ld   d, b                                     ;; 01:6768 $50
    ld   hl, Data_001_66F0                        ;; 01:6769 $21 $F0 $66
    add  hl, de                                   ;; 01:676C $19
    ld   a, [hl]                                  ;; 01:676D $7E
    ld   hl, wC560                                ;; 01:676E $21 $60 $C5
    add  hl, bc                                   ;; 01:6771 $09
    ld   [hl], a                                  ;; 01:6772 $77

.jr_6773::
    ld   hl, wC590                                ;; 01:6773 $21 $90 $C5
    add  hl, bc                                   ;; 01:6776 $09
    ld   a, [hl]                                  ;; 01:6777 $7E
    inc  a                                        ;; 01:6778 $3C
    ld   [hl], a                                  ;; 01:6779 $77
    cp   $13                                      ;; 01:677A $FE $13
    jr   c, ret_001_67A7                          ;; 01:677C $38 $29
    ld   [hl], b                                  ;; 01:677E $70
    ld   hl, Data_001_66F6                        ;; 01:677F $21 $F6 $66
    add  hl, bc                                   ;; 01:6782 $09
    ld   d, [hl]                                  ;; 01:6783 $56
    ld   hl, wTranscientVfxPosXTable              ;; 01:6784 $21 $30 $C5
    add  hl, bc                                   ;; 01:6787 $09
    ld   a, [hl]                                  ;; 01:6788 $7E
    sub  a, d                                     ;; 01:6789 $92
    ld   e, $01                                   ;; 01:678A $1E $01
    and  $80                                      ;; 01:678C $E6 $80
    jr   nz, .jr_6792                             ;; 01:678E $20 $02
    ld   e, $FF                                   ;; 01:6790 $1E $FF

.jr_6792::
    ld   a, [hl]                                  ;; 01:6792 $7E
    add  a, e                                     ;; 01:6793 $83
    ld   [hl], a                                  ;; 01:6794 $77
    ld   hl, wTranscientVfxPosYTable              ;; 01:6795 $21 $40 $C5
    add  hl, bc                                   ;; 01:6798 $09
    ld   a, [hl]                                  ;; 01:6799 $7E
    sub  a, $48                                   ;; 01:679A $D6 $48
    ld   e, $01                                   ;; 01:679C $1E $01
    and  $80                                      ;; 01:679E $E6 $80
    jr   nz, .jr_67A4                             ;; 01:67A0 $20 $02
    ld   e, $FF                                   ;; 01:67A2 $1E $FF

.jr_67A4::
    ld   a, [hl]                                  ;; 01:67A4 $7E
    add  a, e                                     ;; 01:67A5 $83
    ld   [hl], a                                  ;; 01:67A6 $77

ret_001_67A7::
    ret                                           ;; 01:67A7 $C9

func_001_67A8::
    call func_001_67B5                            ;; 01:67A8 $CD $B5 $67
    push bc                                       ;; 01:67AB $C5
    ld   a, c                                     ;; 01:67AC $79
    add  a, $10                                   ;; 01:67AD $C6 $10
    ld   c, a                                     ;; 01:67AF $4F
    call func_001_67B5                            ;; 01:67B0 $CD $B5 $67
    pop  bc                                       ;; 01:67B3 $C1
    ret                                           ;; 01:67B4 $C9

func_001_67B5::
    ld   hl, wC550                                ;; 01:67B5 $21 $50 $C5
    add  hl, bc                                   ;; 01:67B8 $09
    ld   a, [hl]                                  ;; 01:67B9 $7E
    push af                                       ;; 01:67BA $F5
    swap a                                        ;; 01:67BB $CB $37
    and  $F0                                      ;; 01:67BD $E6 $F0
    ld   hl, wC570                                ;; 01:67BF $21 $70 $C5
    add  hl, bc                                   ;; 01:67C2 $09
    add  a, [hl]                                  ;; 01:67C3 $86
    ld   [hl], a                                  ;; 01:67C4 $77
    rl   d                                        ;; 01:67C5 $CB $12
    ld   hl, wTranscientVfxPosXTable              ;; 01:67C7 $21 $30 $C5
    add  hl, bc                                   ;; 01:67CA $09
    pop  af                                       ;; 01:67CB $F1
    ld   e, $00                                   ;; 01:67CC $1E $00
    bit  7, a                                     ;; 01:67CE $CB $7F
    jr   z, .jr_67D4                              ;; 01:67D0 $28 $02
    ld   e, $F0                                   ;; 01:67D2 $1E $F0

.jr_67D4::
    swap a                                        ;; 01:67D4 $CB $37
    and  $0F                                      ;; 01:67D6 $E6 $0F
    or   e                                        ;; 01:67D8 $B3
    rr   d                                        ;; 01:67D9 $CB $1A
    adc  a, [hl]                                  ;; 01:67DB $8E
    ld   [hl], a                                  ;; 01:67DC $77
    ret                                           ;; 01:67DD $C9

OpenMarinBeachDialog::
    ld   e, a                                     ;; 01:67DE $5F
    ldh  a, [hLinkPositionY]                      ;; 01:67DF $F0 $99
    push af                                       ;; 01:67E1 $F5
    ld   a, $60                                   ;; 01:67E2 $3E $60
    ldh  [hLinkPositionY], a                      ;; 01:67E4 $E0 $99
    ld   a, e                                     ;; 01:67E6 $7B
    call OpenDialogInTable1                       ;; 01:67E7 $CD $73 $23
    pop  af                                       ;; 01:67EA $F1
    ldh  [hLinkPositionY], a                      ;; 01:67EB $E0 $99
    ret                                           ;; 01:67ED $C9
