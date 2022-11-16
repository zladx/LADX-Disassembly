;
; Cinematic where Marin discusses with Link on the beach
;

MarinBeachEntryPoint::
    ld   a, [wDialogState]                        ; $6203: $FA $9F $C1
    and  a                                        ; $6206: $A7
    jr   nz, .jr_6213                             ; $6207: $20 $0A
    ld   a, [wC3C7]                               ; $6209: $FA $C7 $C3
    and  a                                        ; $620C: $A7
    jr   z, .jr_6213                              ; $620D: $28 $04
    dec  a                                        ; $620F: $3D
    ld   [wC3C7], a                               ; $6210: $EA $C7 $C3

.jr_6213::
    ld   a, [wC3C4]                               ; $6213: $FA $C4 $C3
    and  a                                        ; $6216: $A7
    jr   z, .jr_621D                              ; $6217: $28 $04
    dec  a                                        ; $6219: $3D
    ld   [wC3C4], a                               ; $621A: $EA $C4 $C3

.jr_621D::
    ld   a, [wGameplaySubtype]                    ; $621D: $FA $96 $DB
    JP_TABLE                                      ; $6220: $C7
._00 dw MarinBeachPrepare0                       ; $6221
._01 dw MarinBeachPrepare1                       ; $6223
._02 dw MarinBeachPrepare2                       ; $6225
._03 dw MarinBeachPrepare3                       ; $6227
._04 dw MarinBeachScroll1                        ; $6229
._05 dw MarinBeachScroll2                        ; $622B
._06 dw MarinBeachScrollStop                     ; $622D
._07 dw MarinBeachDialog1                        ; $622F
._08 dw MarinBeachPause1                         ; $6231
._09 dw MarinBeachDialog2                        ; $6233
._0A dw MarinBeachPause2                         ; $6235
._0B dw MarinBeachAreYouListening                ; $6237
._0C dw MarinBeachDialog3                        ; $6239
._0D dw MarinBeachDialog4                        ; $623B
._0E dw FileSaveFadeOut                           ; $623D

MarinBeachPrepare0::
    call IncrementGameplaySubtype                 ; $623F: $CD $D6 $44
    ldh  a, [hIsGBC]                              ; $6242: $F0 $FE
    and  a                                        ; $6244: $A7
    jr   z, MarinBeachPrepare1                    ; $6245: $28 $19

    ld   hl, wBGPal1                              ; $6247: $21 $10 $DC
    ld   c, $80                                   ; $624A: $0E $80
    di                                            ; $624C: $F3

.loop_624D
    xor  a                                        ; $624D: $AF
    ld   [rSVBK], a                               ; $624E: $E0 $70
    ld   b, [hl]                                  ; $6250: $46
    ld   a, $03                                   ; $6251: $3E $03
    ld   [rSVBK], a                               ; $6253: $E0 $70
    ld   [hl], b                                  ; $6255: $70
    inc  hl                                       ; $6256: $23
    dec  c                                        ; $6257: $0D
    ld   a, c                                     ; $6258: $79
    and  a                                        ; $6259: $A7
    jr   nz, .loop_624D                           ; $625A: $20 $F1
    xor  a                                        ; $625C: $AF
    ld   [rSVBK], a                               ; $625D: $E0 $70
    ei                                            ; $625F: $FB

MarinBeachPrepare1::
    ld   a, $01                                   ; $6260: $3E $01
    ld   [wC167], a                               ; $6262: $EA $67 $C1
    call func_1A22                                ; $6265: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $6268: $FA $6B $C1
    cp   $04                                      ; $626B: $FE $04
    jr   nz, .return                              ; $626D: $20 $12
    call IncrementGameplaySubtype                 ; $626F: $CD $D6 $44
    xor  a                                        ; $6272: $AF
    ld   [wScrollXOffset], a                      ; $6273: $EA $BF $C1
    call func_001_5888                            ; $6276: $CD $88 $58
    call func_001_64FF                            ; $6279: $CD $FF $64
    ld   a, TILESET_0F                            ; $627C: $3E $0F
    ld   [wTilesetToLoad], a                      ; $627E: $EA $FE $D6
.return
    ret                                           ; $6281: $C9

MarinBeachPrepare2::
    ld   a, TILESET_MARIN_BEACH                   ; $6282: $3E $13
    ld   [wTilesetToLoad], a                      ; $6284: $EA $FE $D6
    xor  a                                        ; $6287: $AF
    ld   [wC13F], a                               ; $6288: $EA $3F $C1
    jp   IncrementGameplaySubtypeAndReturn        ; $628B: $C3 $D6 $44

MarinBeachPrepare3::
    ld   a, TILEMAP_MARIN_BEACH                   ; $628E: $3E $13
    ld   [wBGMapToLoad], a                        ; $6290: $EA $FF $D6

    ld   a, $FF                                   ; $6293: $3E $FF
    ld   [wWindowY], a                            ; $6295: $EA $9A $DB

    xor  a                                        ; $6298: $AF
    ldh  [hBaseScrollX], a                        ; $6299: $E0 $96
    ld   [wTransitionSequenceCounter], a          ; $629B: $EA $6B $C1
    ld   [wC16C], a                               ; $629E: $EA $6C $C1
    ld   a, $90                                   ; $62A1: $3E $90
    ldh  [hBaseScrollY], a                        ; $62A3: $E0 $97
    ld   a, $40                                   ; $62A5: $3E $40
    ld   [wNoiseSfxSeaWavesCounter], a            ; $62A7: $EA $14 $C1
    ld   a, $A0                                   ; $62AA: $3E $A0
    ld   [wD466], a                               ; $62AC: $EA $66 $D4
    ld   a, $01                                   ; $62AF: $3E $01
    ld   [wPaletteUnknownE], a                    ; $62B1: $EA $D5 $DD
    ld   a, $E0                                   ; $62B4: $3E $E0
    ld   [wTranscientVfxPosYTable], a             ; $62B6: $EA $40 $C5
    ld   a, $00                                   ; $62B9: $3E $00
    ld   [wTranscientVfxPosXTable], a             ; $62BB: $EA $30 $C5
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $62BE: $3E $01
    ld   [wTranscientVfxTypeTable], a             ; $62C0: $EA $10 $C5
    ld   a, $0C                                   ; $62C3: $3E $0C
    ld   [wC560], a                               ; $62C5: $EA $60 $C5
    ld   a, $08                                   ; $62C8: $3E $08
    ld   [wC550], a                               ; $62CA: $EA $50 $C5
    ld   a, $00                                   ; $62CD: $3E $00
    ld   [wTranscientVfxCountdownTable], a        ; $62CF: $EA $20 $C5
    ld   [wD200], a                               ; $62D2: $EA $00 $D2
    ld   a, $20                                   ; $62D5: $3E $20
    ld   [wTranscientVfxPosYTable+1], a           ; $62D7: $EA $41 $C5
    ld   a, $A0                                   ; $62DA: $3E $A0
    ld   [wTranscientVfxPosXTable+1], a           ; $62DC: $EA $31 $C5
    ld   a, $01                                   ; $62DF: $3E $01
    ld   [wTranscientVfxTypeTable+1], a           ; $62E1: $EA $11 $C5
    ld   a, $08                                   ; $62E4: $3E $08
    ld   [wC560+1], a                             ; $62E6: $EA $61 $C5
    ld   a, $F8                                   ; $62E9: $3E $F8
    ld   [wC550+1], a                             ; $62EB: $EA $51 $C5
    ld   a, $40                                   ; $62EE: $3E $40
    ld   [wTranscientVfxCountdownTable+1], a      ; $62F0: $EA $21 $C5
    ld   a, $24                                   ; $62F3: $3E $24
    ld   [wD201], a                               ; $62F5: $EA $01 $D2
    ld   a, $48                                   ; $62F8: $3E $48
    ld   [wTranscientVfxPosYTable+2], a           ; $62FA: $EA $42 $C5
    ld   a, $30                                   ; $62FD: $3E $30
    ld   [wTranscientVfxPosXTable+2], a           ; $62FF: $EA $32 $C5
    ld   a, $02                                   ; $6302: $3E $02
    ld   [wTranscientVfxTypeTable+2], a           ; $6304: $EA $12 $C5
    ld   a, $00                                   ; $6307: $3E $00
    ld   [wC560+2], a                             ; $6309: $EA $62 $C5
    ld   a, $00                                   ; $630C: $3E $00
    ld   [wC550+2], a                             ; $630E: $EA $52 $C5
    ld   a, $00                                   ; $6311: $3E $00
    ld   [wTranscientVfxCountdownTable+2], a      ; $6313: $EA $22 $C5
    ld   a, $02                                   ; $6316: $3E $02
    ld   [wD202], a                               ; $6318: $EA $02 $D2
    ld   a, $3C                                   ; $631B: $3E $3C
    ld   [wTranscientVfxPosYTable+3], a           ; $631D: $EA $43 $C5
    ld   a, $40                                   ; $6320: $3E $40
    ld   [wTranscientVfxPosXTable+3], a           ; $6322: $EA $33 $C5
    ld   a, $02                                   ; $6325: $3E $02
    ld   [wTranscientVfxTypeTable+3], a           ; $6327: $EA $13 $C5
    ld   a, $00                                   ; $632A: $3E $00
    ld   [wC560+3], a                             ; $632C: $EA $63 $C5
    ld   a, $00                                   ; $632F: $3E $00
    ld   [wC550+3], a                             ; $6331: $EA $53 $C5
    ld   a, $00                                   ; $6334: $3E $00
    ld   [wTranscientVfxCountdownTable+3], a      ; $6336: $EA $23 $C5
    ld   a, $00                                   ; $6339: $3E $00
    ld   [wD203], a                               ; $633B: $EA $03 $D2
    ld   a, $40                                   ; $633E: $3E $40
    ld   [wTranscientVfxPosYTable+4], a           ; $6340: $EA $44 $C5
    ld   a, $50                                   ; $6343: $3E $50
    ld   [wTranscientVfxPosXTable+4], a           ; $6345: $EA $34 $C5
    ld   a, $02                                   ; $6348: $3E $02
    ld   [wTranscientVfxTypeTable+4], a           ; $634A: $EA $14 $C5
    ld   a, $00                                   ; $634D: $3E $00
    ld   [wC560+4], a                             ; $634F: $EA $64 $C5
    ld   a, $00                                   ; $6352: $3E $00
    ld   [wC550+4], a                             ; $6354: $EA $54 $C5
    ld   a, $00                                   ; $6357: $3E $00
    ld   [wTranscientVfxCountdownTable+4], a      ; $6359: $EA $24 $C5
    ld   a, $00                                   ; $635C: $3E $00
    ld   [wD204], a                               ; $635E: $EA $04 $D2
    ld   a, $3C                                   ; $6361: $3E $3C
    ld   [wTranscientVfxPosYTable+5], a           ; $6363: $EA $45 $C5
    ld   a, $60                                   ; $6366: $3E $60
    ld   [wTranscientVfxPosXTable+5], a           ; $6368: $EA $35 $C5
    ld   a, $02                                   ; $636B: $3E $02
    ld   [wTranscientVfxTypeTable+5], a           ; $636D: $EA $15 $C5
    ld   a, $00                                   ; $6370: $3E $00
    ld   [wC560+5], a                             ; $6372: $EA $65 $C5
    ld   a, $00                                   ; $6375: $3E $00
    ld   [wC550+5], a                             ; $6377: $EA $55 $C5
    ld   a, $00                                   ; $637A: $3E $00
    ld   [wTranscientVfxCountdownTable+5], a      ; $637C: $EA $25 $C5
    ld   a, $00                                   ; $637F: $3E $00
    ld   [wD205], a                               ; $6381: $EA $05 $D2
    ld   a, $44                                   ; $6384: $3E $44
    ld   [wTranscientVfxPosYTable+6], a           ; $6386: $EA $46 $C5
    ld   a, $68                                   ; $6389: $3E $68
    ld   [wTranscientVfxPosXTable+6], a           ; $638B: $EA $36 $C5
    ld   a, $02                                   ; $638E: $3E $02
    ld   [wTranscientVfxTypeTable+6], a           ; $6390: $EA $16 $C5
    ld   a, $00                                   ; $6393: $3E $00
    ld   [wC560+6], a                             ; $6395: $EA $66 $C5
    ld   a, $00                                   ; $6398: $3E $00
    ld   [wC550+6], a                             ; $639A: $EA $56 $C5
    ld   a, $00                                   ; $639D: $3E $00
    ld   [wTranscientVfxCountdownTable+6], a      ; $639F: $EA $26 $C5
    ld   a, $00                                   ; $63A2: $3E $00
    ld   [wD206], a                               ; $63A4: $EA $06 $D2
    jp   IncrementGameplaySubtypeAndReturn        ; $63A7: $C3 $D6 $44

Data_001_63AA::
    db 0, 0, 0, 0, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4 ; $63AA

Data_001_63BA::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C ; $63BA

MarinBeachScroll1::
    ldh  a, [hIsGBC]                              ; $63CA: $F0 $FE
    and  a                                        ; $63CC: $A7
    jr   z, .jr_63E4                              ; $63CD: $28 $15
    ldh  a, [hFrameCounter]                       ; $63CF: $F0 $E7
    and  $07                                      ; $63D1: $E6 $07
    jr   nz, MarinBeachScroll2                    ; $63D3: $20 $42
    call func_1A39                                ; $63D5: $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $63D8: $FA $6B $C1
    cp   $04                                      ; $63DB: $FE $04
    jr   nz, MarinBeachScroll2                    ; $63DD: $20 $38
    call IncrementGameplaySubtype                 ; $63DF: $CD $D6 $44
    jr   MarinBeachScroll2                        ; $63E2: $18 $33

.jr_63E4::
    ldh  a, [hFrameCounter]                       ; $63E4: $F0 $E7
    and  $07                                      ; $63E6: $E6 $07
    jr   nz, .jr_63F8                             ; $63E8: $20 $0E
    ld   a, [wC3C5]                               ; $63EA: $FA $C5 $C3
    inc  a                                        ; $63ED: $3C
    ld   [wC3C5], a                               ; $63EE: $EA $C5 $C3
    cp   $0C                                      ; $63F1: $FE $0C
    jr   nz, .jr_63F8                             ; $63F3: $20 $03
    call IncrementGameplaySubtype                 ; $63F5: $CD $D6 $44

.jr_63F8::
    ldh  a, [hFrameCounter]                       ; $63F8: $F0 $E7
    and  $03                                      ; $63FA: $E6 $03
    ld   e, a                                     ; $63FC: $5F
    ld   a, [wC3C5]                               ; $63FD: $FA $C5 $C3
    add  a, e                                     ; $6400: $83
    ld   e, a                                     ; $6401: $5F
    ld   d, $00                                   ; $6402: $16 $00
    ld   hl, Data_001_63AA                        ; $6404: $21 $AA $63
    add  hl, de                                   ; $6407: $19
    ld   a, [hl]                                  ; $6408: $7E
    ld   [wBGPalette], a                          ; $6409: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $640C: $EA $99 $DB
    ld   hl, Data_001_63BA                        ; $640F: $21 $BA $63
    add  hl, de                                   ; $6412: $19
    ld   a, [hl]                                  ; $6413: $7E
    ld   [wOBJ0Palette], a                        ; $6414: $EA $98 $DB

MarinBeachScroll2::
    ldh  a, [hFrameCounter]                       ; $6417: $F0 $E7
    and  $03                                      ; $6419: $E6 $03
    jr   nz, .jr_642E                             ; $641B: $20 $11
    ldh  a, [hBaseScrollY]                        ; $641D: $F0 $97
    inc  a                                        ; $641F: $3C
    ldh  [hBaseScrollY], a                        ; $6420: $E0 $97
    cp   $00                                      ; $6422: $FE $00
    jr   nz, .jr_642E                             ; $6424: $20 $08
    ld   a, $80                                   ; $6426: $3E $80
    ld   [wC3C7], a                               ; $6428: $EA $C7 $C3
    call IncrementGameplaySubtype                 ; $642B: $CD $D6 $44

.jr_642E::
    call func_001_651E                            ; $642E: $CD $1E $65
    ret                                           ; $6431: $C9

MarinBeachScrollStop::
    call func_001_651E                            ; $6432: $CD $1E $65
    ld   a, [wDialogState]                        ; $6435: $FA $9F $C1
    and  a                                        ; $6438: $A7
    jr   nz, jr_001_644A                          ; $6439: $20 $0F
    ld   a, [wC3C7]                               ; $643B: $FA $C7 $C3
    and  a                                        ; $643E: $A7
    jr   nz, .ret_6449                            ; $643F: $20 $08
    ld_dialog_low a, Dialog1D8                    ; $6441: $3E $D8
    call OpenMarinBeachDialog                     ; $6443: $CD $DE $67
    call IncrementGameplaySubtype                 ; $6446: $CD $D6 $44

.ret_6449
    ret                                           ; $6449: $C9

jr_001_644A::
    ld   a, $02                                   ; $644A: $3E $02
    ld   [wC3C4], a                               ; $644C: $EA $C4 $C3
    ret                                           ; $644F: $C9

MarinBeachDialog1::
    call func_001_651E                            ; $6450: $CD $1E $65
    ld   a, [wDialogState]                        ; $6453: $FA $9F $C1
    and  a                                        ; $6456: $A7
    jr   nz, .ret_6466                            ; $6457: $20 $0D
    ld   a, $80                                   ; $6459: $3E $80
    ld   [wC3C4], a                               ; $645B: $EA $C4 $C3
    ld   a, $C0                                   ; $645E: $3E $C0
    ld   [wC3C7], a                               ; $6460: $EA $C7 $C3
    call IncrementGameplaySubtype                 ; $6463: $CD $D6 $44

.ret_6466
    ret                                           ; $6466: $C9

MarinBeachPause1::
    call func_001_651E                            ; $6467: $CD $1E $65
    ld   a, [wC3C7]                               ; $646A: $FA $C7 $C3
    and  a                                        ; $646D: $A7
    jr   nz, .ret_6478                            ; $646E: $20 $08
    ld_dialog_low a, Dialog1D9                    ; $6470: $3E $D9
    call OpenMarinBeachDialog                     ; $6472: $CD $DE $67
    jp   IncrementGameplaySubtypeAndReturn        ; $6475: $C3 $D6 $44

.ret_6478
    ret                                           ; $6478: $C9

MarinBeachDialog2::
    call func_001_651E                            ; $6479: $CD $1E $65
    ld   a, [wDialogState]                        ; $647C: $FA $9F $C1
    and  a                                        ; $647F: $A7
    jr   nz, .ret_648F                            ; $6480: $20 $0D
    ld   a, $80                                   ; $6482: $3E $80
    ld   [wC3C4], a                               ; $6484: $EA $C4 $C3
    ld   a, $C0                                   ; $6487: $3E $C0
    ld   [wC3C7], a                               ; $6489: $EA $C7 $C3
    call IncrementGameplaySubtype                 ; $648C: $CD $D6 $44

.ret_648F
    ret                                           ; $648F: $C9

MarinBeachPause2::
    call func_001_651E                            ; $6490: $CD $1E $65
    ld   a, [wC3C7]                               ; $6493: $FA $C7 $C3
    and  a                                        ; $6496: $A7
    jr   nz, .ret_64A1                            ; $6497: $20 $08
    ld_dialog_low a, Dialog1DA                    ; $6499: $3E $DA
    call OpenMarinBeachDialog                     ; $649B: $CD $DE $67
    jp   IncrementGameplaySubtypeAndReturn        ; $649E: $C3 $D6 $44

.ret_64A1
    ret                                           ; $64A1: $C9

MarinBeachAreYouListening::
    call func_001_651E                            ; $64A2: $CD $1E $65
    ld   a, [wDialogState]                        ; $64A5: $FA $9F $C1
    and  a                                        ; $64A8: $A7
    jr   nz, jr_001_64CA                          ; $64A9: $20 $1F
    ld   a, [wDialogAskSelectionIndex]            ; $64AB: $FA $77 $C1
    and  a                                        ; $64AE: $A7
    jr   nz, .jr_64BA                             ; $64AF: $20 $09
    ld_dialog_low a, Dialog1DB                    ; $64B1: $3E $DB
    call OpenMarinBeachDialog                     ; $64B3: $CD $DE $67
    call IncrementGameplaySubtype                 ; $64B6: $CD $D6 $44
    ret                                           ; $64B9: $C9

.jr_64BA::
    ld_dialog_low a, Dialog1DE                    ; $64BA: $3E $DE
    call OpenMarinBeachDialog                     ; $64BC: $CD $DE $67
    ld   a, $06                                   ; $64BF: $3E $06
    ld   [wGameplaySubtype], a                    ; $64C1: $EA $96 $DB
    ld   a, $05                                   ; $64C4: $3E $05
    ld   [wC3C7], a                               ; $64C6: $EA $C7 $C3
    ret                                           ; $64C9: $C9

jr_001_64CA::
    ld   a, $02                                   ; $64CA: $3E $02
    ld   [wC3C4], a                               ; $64CC: $EA $C4 $C3
    ret                                           ; $64CF: $C9

MarinBeachDialog3::
    call func_001_651E                            ; $64D0: $CD $1E $65
    ld   a, [wDialogState]                        ; $64D3: $FA $9F $C1
    and  a                                        ; $64D6: $A7
    jr   nz, .ret_64E6                            ; $64D7: $20 $0D
    ld_dialog_low a, Dialog1DC                    ; $64D9: $3E $DC
    call OpenMarinBeachDialog                     ; $64DB: $CD $DE $67
    ld   a, $30                                   ; $64DE: $3E $30
    ld   [wC3C7], a                               ; $64E0: $EA $C7 $C3
    call IncrementGameplaySubtype                 ; $64E3: $CD $D6 $44

.ret_64E6
    ret                                           ; $64E6: $C9

MarinBeachDialog4::
    call func_001_651E                            ; $64E7: $CD $1E $65
    ld   a, $02                                   ; $64EA: $3E $02
    ld   [wC3C4], a                               ; $64EC: $EA $C4 $C3
    ld   a, [wC3C7]                               ; $64EF: $FA $C7 $C3
    and  a                                        ; $64F2: $A7
    ret  nz                                       ; $64F3: $C0
    call label_27F2                               ; $64F4: $CD $F2 $27
    call func_001_68D9                            ; $64F7: $CD $D9 $68
    ld   a, $01                                   ; $64FA: $3E $01
    ld   [wIsMarinFollowingLink], a               ; $64FC: $EA $73 $DB

func_001_64FF::
    ld   e, $10                                   ; $64FF: $1E $10
    ld   hl, wTranscientVfxTypeTable              ; $6501: $21 $10 $C5
    xor  a                                        ; $6504: $AF

.loop_6505
    ldi  [hl], a                                  ; $6505: $22
    dec  e                                        ; $6506: $1D
    jr   nz, .loop_6505                           ; $6507: $20 $FC
    ret                                           ; $6509: $C9

;
; Seagull animations and sounds
;

Data_001_650A::
    db $40, 1, $40, $21                           ; $650A

Data_001_650E::
    db $46, 1, $48, 1                             ; $650E

Data_001_6512::
    db $42, 0, $44, 0                             ; $6512

Data_001_6516::
    db $42, 2, $44, 2                             ; $6516

Data_001_651A::
    db $42, 3, $44, 3                             ; $651A

func_001_651E::
    call func_001_65AE                            ; $651E: $CD $AE $65
    ld   a, [wNoiseSfxSeaWavesCounter]            ; $6521: $FA $14 $C1
    inc  a                                        ; $6524: $3C
    cp   $A0                                      ; $6525: $FE $A0
    jr   nz, .jr_652E                             ; $6527: $20 $05
    ld   a, NOISE_SFX_SEA_WAVES                   ; $6529: $3E $0F
    ldh  [hNoiseSfx], a                           ; $652B: $E0 $F4
    xor  a                                        ; $652D: $AF

.jr_652E::
    ld   [wNoiseSfxSeaWavesCounter], a            ; $652E: $EA $14 $C1
    ld   a, [wD466]                               ; $6531: $FA $66 $D4
    and  a                                        ; $6534: $A7
    jr   nz, .jr_6545                             ; $6535: $20 $0E
    ld   a, JINGLE_SEAGULL                        ; $6537: $3E $21
    ldh  [hJingle], a                             ; $6539: $E0 $F2
    call GetRandomByte                            ; $653B: $CD $0D $28
    and  $7F                                      ; $653E: $E6 $7F
    add  a, $60                                   ; $6540: $C6 $60
    ld   [wD466], a                               ; $6542: $EA $66 $D4

.jr_6545::
    dec  a                                        ; $6545: $3D
    ld   [wD466], a                               ; $6546: $EA $66 $D4
    ldh  a, [hBaseScrollY]                        ; $6549: $F0 $97
    dec  a                                        ; $654B: $3D
    cp   $C0                                      ; $654C: $FE $C0
    ret  c                                        ; $654E: $D8
    ld   de, Data_001_650A                        ; $654F: $11 $0A $65
    ld   a, [wC3C4]                               ; $6552: $FA $C4 $C3
    and  a                                        ; $6555: $A7
    jr   z, .jr_655F                              ; $6556: $28 $07
    cp   $60                                      ; $6558: $FE $60
    jr   nc, .jr_655F                             ; $655A: $30 $03
    ld   de, Data_001_650E                        ; $655C: $11 $0E $65

.jr_655F::
    ld   a, $7C                                   ; $655F: $3E $7C
    ldh  [hActiveEntityVisualPosY], a             ; $6561: $E0 $EC
    ld   a, $58                                   ; $6563: $3E $58
    ldh  [hActiveEntityPosX], a                   ; $6565: $E0 $EE
    ld   hl, wDynamicOAMBuffer                    ; $6567: $21 $30 $C0
    call func_001_658B                            ; $656A: $CD $8B $65
    ld   a, $48                                   ; $656D: $3E $48
    ldh  [hActiveEntityPosX], a                   ; $656F: $E0 $EE
    ; TUNIC_GREEN
    ld   de, Data_001_6512                        ; $6571: $11 $12 $65
    ld   a, [wTunicType]                          ; $6574: $FA $0F $DC
    and  a                                        ; $6577: $A7
    jr   z, .loadTunic                            ; $6578: $28 $0A
    ld   de, Data_001_6516                        ; $657A: $11 $16 $65
    cp   TUNIC_RED                                ; $657D: $FE $01
    jr   z, .loadTunic                            ; $657F: $28 $03
    ; TUNIC_BLUE
    ld   de, Data_001_651A                        ; $6581: $11 $1A $65

.loadTunic::
    ld   hl, wDynamicOAMBuffer+8                  ; $6584: $21 $38 $C0
    call func_001_658B                            ; $6587: $CD $8B $65
    ret                                           ; $658A: $C9

func_001_658B::
    push bc                                       ; $658B: $C5
    ldh  a, [hBaseScrollY]                        ; $658C: $F0 $97
    ld   c, a                                     ; $658E: $4F
    ldh  a, [hActiveEntityVisualPosY]             ; $658F: $F0 $EC
    sub  a, c                                     ; $6591: $91
    ldh  [hMultiPurposeG], a                      ; $6592: $E0 $E8
    ldi  [hl], a                                  ; $6594: $22
    ldh  a, [hActiveEntityPosX]                   ; $6595: $F0 $EE
    ldi  [hl], a                                  ; $6597: $22
    ld   a, [de]                                  ; $6598: $1A
    inc  de                                       ; $6599: $13
    ldi  [hl], a                                  ; $659A: $22
    ld   a, [de]                                  ; $659B: $1A
    inc  de                                       ; $659C: $13
    ldi  [hl], a                                  ; $659D: $22
    ldh  a, [hActiveEntityVisualPosY]             ; $659E: $F0 $EC
    sub  a, c                                     ; $65A0: $91
    ldi  [hl], a                                  ; $65A1: $22
    ldh  a, [hActiveEntityPosX]                   ; $65A2: $F0 $EE
    add  a, $08                                   ; $65A4: $C6 $08
    ldi  [hl], a                                  ; $65A6: $22
    ld   a, [de]                                  ; $65A7: $1A
    inc  de                                       ; $65A8: $13
    ldi  [hl], a                                  ; $65A9: $22
    ld   a, [de]                                  ; $65AA: $1A
    ld   [hl], a                                  ; $65AB: $77
    pop  bc                                       ; $65AC: $C1
    ret                                           ; $65AD: $C9

func_001_65AE::
    ld   c, $08                                   ; $65AE: $0E $08
    ld   b, $00                                   ; $65B0: $06 $00

jr_001_65B2::
    ld   hl, wTranscientVfxTypeTable              ; $65B2: $21 $10 $C5
    add  hl, bc                                   ; $65B5: $09
    ld   a, [hl]                                  ; $65B6: $7E
    and  a                                        ; $65B7: $A7
    jr   z, jr_001_65D6                           ; $65B8: $28 $1C
    push af                                       ; $65BA: $F5
    ld   hl, wTranscientVfxPosXTable              ; $65BB: $21 $30 $C5
    add  hl, bc                                   ; $65BE: $09
    ld   a, [hl]                                  ; $65BF: $7E
    ldh  [hActiveEntityPosX], a                   ; $65C0: $E0 $EE
    ld   hl, wTranscientVfxPosYTable              ; $65C2: $21 $40 $C5
    add  hl, bc                                   ; $65C5: $09
    ld   a, [hl]                                  ; $65C6: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $65C7: $E0 $EC
    ld   hl, wTranscientVfxCountdownTable         ; $65C9: $21 $20 $C5
    add  hl, bc                                   ; $65CC: $09
    ld   a, [hl]                                  ; $65CD: $7E
    and  a                                        ; $65CE: $A7
    jr   z, .jr_65D2                              ; $65CF: $28 $01
    dec  [hl]                                     ; $65D1: $35

.jr_65D2::
    pop  af                                       ; $65D2: $F1
    call func_001_65DD                            ; $65D3: $CD $DD $65

jr_001_65D6::
    dec  c                                        ; $65D6: $0D
    ld   a, c                                     ; $65D7: $79
    cp   $FF                                      ; $65D8: $FE $FF
    jr   nz, jr_001_65B2                          ; $65DA: $20 $D6
    ret                                           ; $65DC: $C9

func_001_65DD::
    dec a                                         ; $65DD: $3D
    JP_TABLE                                      ; $65DE: $C7
._00 dw func_001_6673                             ; $65DF
._01 dw func_001_66FD                             ; $65E1

Data_001_65E3::
    dw Data_001_65EF                              ; $65E3
    dw Data_001_65F3                              ; $65E5
    dw Data_001_65F7                              ; $65E7
    dw Data_001_65FB                              ; $65E9
    dw Data_001_65FF                              ; $65EB
    dw Data_001_6603                              ; $65ED

Data_001_65EF:
    db $50, 0, $50, $20                           ; $65EF

Data_001_65F3:
    db $52, 0, $52, $20                           ; $65F3

Data_001_65F7:
    db $54, 0, $54, $20                           ; $65F7

Data_001_65FB:
    db $56, 0, $56, $20                           ; $65FB

Data_001_65FF:
    db $58, 0, $58, $20                           ; $65FF

Data_001_6603:
    db $5A, 0, $5A, $20                           ; $6603

Data_001_6607::
    db 3, 3, 3, 3                                 ; $6607

jr_001_660B::
    db 3, 3, 3, 3, 3, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1 ; $660B
    db 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5 ; $661B
    db 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3 ; $662B
    db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3            ; $663B

jr_001_6646::
    db 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0 ; $6646
    db 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4 ; $6656
    db 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5      ; $6666

func_001_6673::
    ld   hl, wTranscientVfxCountdownTable         ; $6673: $21 $20 $C5
    add  hl, bc                                   ; $6676: $09
    ld   a, [hl]                                  ; $6677: $7E
    and  a                                        ; $6678: $A7
    ret  nz                                       ; $6679: $C0
    ld   hl, wD210                                ; $667A: $21 $10 $D2
    add  hl, bc                                   ; $667D: $09
    ld   a, [hl]                                  ; $667E: $7E
    inc  a                                        ; $667F: $3C
    ld   [hl], a                                  ; $6680: $77
    cp   $06                                      ; $6681: $FE $06
    jr   c, .jr_668B                              ; $6683: $38 $06
    ld   [hl], b                                  ; $6685: $70
    ld   hl, wD200                                ; $6686: $21 $00 $D2
    add  hl, bc                                   ; $6689: $09
    inc  [hl]                                     ; $668A: $34

.jr_668B::
    ld   hl, wD200                                ; $668B: $21 $00 $D2
    add  hl, bc                                   ; $668E: $09
    ld   e, [hl]                                  ; $668F: $5E
    ld   d, b                                     ; $6690: $50
    ld   hl, Data_001_6607                        ; $6691: $21 $07 $66
    add  hl, de                                   ; $6694: $19
    ld   e, [hl]                                  ; $6695: $5E
    sla  e                                        ; $6696: $CB $23
    ld   d, b                                     ; $6698: $50
    ld   hl, Data_001_65E3                        ; $6699: $21 $E3 $65
    add  hl, de                                   ; $669C: $19
    ld   a, [hli]                                 ; $669D: $2A
    ld   d, [hl]                                  ; $669E: $56
    ld   e, a                                     ; $669F: $5F
    push de                                       ; $66A0: $D5
    ld   hl, wDynamicOAMBuffer+$10                ; $66A1: $21 $40 $C0
    ld   a, c                                     ; $66A4: $79
    rla                                           ; $66A5: $17
    rla                                           ; $66A6: $17
    rla                                           ; $66A7: $17
    and  $78                                      ; $66A8: $E6 $78
    ld   e, a                                     ; $66AA: $5F
    ld   d, b                                     ; $66AB: $50
    add  hl, de                                   ; $66AC: $19
    pop  de                                       ; $66AD: $D1
    call func_001_658B                            ; $66AE: $CD $8B $65
    call func_001_67A8                            ; $66B1: $CD $A8 $67
    ldh  a, [hFrameCounter]                       ; $66B4: $F0 $E7
    and  $07                                      ; $66B6: $E6 $07
    jr   nz, .jr_66C4                             ; $66B8: $20 $0A
    ld   hl, wC560                                ; $66BA: $21 $60 $C5
    add  hl, bc                                   ; $66BD: $09
    ld   a, [hl]                                  ; $66BE: $7E
    cp   $FB                                      ; $66BF: $FE $FB
    jr   z, .jr_66C4                              ; $66C1: $28 $01
    dec  [hl]                                     ; $66C3: $35

.jr_66C4::
    ldh  a, [hMultiPurposeG]                      ; $66C4: $F0 $E8
    cp   $F0                                      ; $66C6: $FE $F0
    jr   c, .ret_66D7                             ; $66C8: $38 $0D
    ld   hl, wC560                                ; $66CA: $21 $60 $C5
    add  hl, bc                                   ; $66CD: $09
    ld   a, [hl]                                  ; $66CE: $7E
    and  $80                                      ; $66CF: $E6 $80
    ret  z                                        ; $66D1: $C8
    ld   hl, wTranscientVfxTypeTable              ; $66D2: $21 $10 $C5
    add  hl, bc                                   ; $66D5: $09
    ld   [hl], b                                  ; $66D6: $70

.ret_66D7
    ret                                           ; $66D7: $C9

Data_001_66D8::
    dw Data_001_66E0                              ; $66D8
    dw Data_001_66E4                              ; $66DA
    dw Data_001_66E8                              ; $66DC
    dw Data_001_66EC                              ; $66DE

Data_001_66E0:
    db $4C, 0, $4C, $20                           ; $66E0

Data_001_66E4:
    db $4E, 0, $4E, $20                           ; $66E4

Data_001_66E8:
    db $5C, 0, $5C, $20                           ; $66E8

Data_001_66EC:
    db $5E, 0, $5E, $20                           ; $66EC

Data_001_66F0::
    db 1, $FF                                     ; $66F0

jr_001_66F2::
    db 1, $FF, $FE, 2                             ; $66F2

Data_001_66F6::
    db 1, $FF, $4C, $52, $58, $5C, $60            ; $66F6

func_001_66FD::
    ld   hl, wC560                                ; $66FD: $21 $60 $C5
    add  hl, bc                                   ; $6700: $09
    ld   a, [hl]                                  ; $6701: $7E
    ld   e, $03                                   ; $6702: $1E $03
    and  $80                                      ; $6704: $E6 $80
    jr   z, jr_001_6718                           ; $6706: $28 $10
    ld   hl, wD200                                ; $6708: $21 $00 $D2
    add  hl, bc                                   ; $670B: $09
    ldh  a, [hFrameCounter]                       ; $670C: $F0 $E7
    and  $07                                      ; $670E: $E6 $07
    jr   nz, .jr_6717                             ; $6710: $20 $05
    ld   a, [hl]                                  ; $6712: $7E
    inc  a                                        ; $6713: $3C
    and  $03                                      ; $6714: $E6 $03
    ld   [hl], a                                  ; $6716: $77

.jr_6717::
    ld   e, [hl]                                  ; $6717: $5E

jr_001_6718::
    sla  e                                        ; $6718: $CB $23
    ld   d, b                                     ; $671A: $50
    ld   hl, Data_001_66D8                        ; $671B: $21 $D8 $66
    add  hl, de                                   ; $671E: $19
    ld   a, [hli]                                 ; $671F: $2A
    ld   d, [hl]                                  ; $6720: $56
    ld   e, a                                     ; $6721: $5F
    push de                                       ; $6722: $D5
    ld   hl, wDynamicOAMBuffer+$10                ; $6723: $21 $40 $C0
    ld   a, c                                     ; $6726: $79
    rla                                           ; $6727: $17
    rla                                           ; $6728: $17
    rla                                           ; $6729: $17
    and  $78                                      ; $672A: $E6 $78
    ld   e, a                                     ; $672C: $5F
    ld   d, b                                     ; $672D: $50
    add  hl, de                                   ; $672E: $19
    pop  de                                       ; $672F: $D1
    call func_001_658B                            ; $6730: $CD $8B $65

.jr_6733::
    call func_001_67A8                            ; $6733: $CD $A8 $67
    ld   a, c                                     ; $6736: $79
    sla  a                                        ; $6737: $CB $27
    sla  a                                        ; $6739: $CB $27
    sla  a                                        ; $673B: $CB $27
    sla  a                                        ; $673D: $CB $27
    ld   e, a                                     ; $673F: $5F
    ldh  a, [hFrameCounter]                       ; $6740: $F0 $E7
    add  a, e                                     ; $6742: $83
    ldh  [hMultiPurposeH], a                      ; $6743: $E0 $E9

.jr_6745::
    and  $3F                                      ; $6745: $E6 $3F
    jr   nz, .jr_675A                             ; $6747: $20 $11
    call GetRandomByte                            ; $6749: $CD $0D $28
    and  $07                                      ; $674C: $E6 $07
    ld   e, a                                     ; $674E: $5F
    ld   d, b                                     ; $674F: $50
    ld   hl, Data_001_66F0                        ; $6750: $21 $F0 $66
    add  hl, de                                   ; $6753: $19
    ld   a, [hl]                                  ; $6754: $7E
    ld   hl, wC550                                ; $6755: $21 $50 $C5
    add  hl, bc                                   ; $6758: $09
    ld   [hl], a                                  ; $6759: $77

.jr_675A::
    ldh  a, [hMultiPurposeH]                      ; $675A: $F0 $E9
    add  a, $40                                   ; $675C: $C6 $40
    and  $3F                                      ; $675E: $E6 $3F
    jr   nz, .jr_6773                             ; $6760: $20 $11
    call GetRandomByte                            ; $6762: $CD $0D $28
    and  $07                                      ; $6765: $E6 $07
    ld   e, a                                     ; $6767: $5F
    ld   d, b                                     ; $6768: $50
    ld   hl, Data_001_66F0                        ; $6769: $21 $F0 $66
    add  hl, de                                   ; $676C: $19
    ld   a, [hl]                                  ; $676D: $7E
    ld   hl, wC560                                ; $676E: $21 $60 $C5
    add  hl, bc                                   ; $6771: $09
    ld   [hl], a                                  ; $6772: $77

.jr_6773::
    ld   hl, wC590                                ; $6773: $21 $90 $C5
    add  hl, bc                                   ; $6776: $09
    ld   a, [hl]                                  ; $6777: $7E
    inc  a                                        ; $6778: $3C
    ld   [hl], a                                  ; $6779: $77
    cp   $13                                      ; $677A: $FE $13
    jr   c, ret_001_67A7                          ; $677C: $38 $29
    ld   [hl], b                                  ; $677E: $70
    ld   hl, Data_001_66F6                        ; $677F: $21 $F6 $66
    add  hl, bc                                   ; $6782: $09
    ld   d, [hl]                                  ; $6783: $56
    ld   hl, wTranscientVfxPosXTable              ; $6784: $21 $30 $C5
    add  hl, bc                                   ; $6787: $09
    ld   a, [hl]                                  ; $6788: $7E
    sub  a, d                                     ; $6789: $92
    ld   e, $01                                   ; $678A: $1E $01
    and  $80                                      ; $678C: $E6 $80
    jr   nz, .jr_6792                             ; $678E: $20 $02
    ld   e, $FF                                   ; $6790: $1E $FF

.jr_6792::
    ld   a, [hl]                                  ; $6792: $7E
    add  a, e                                     ; $6793: $83
    ld   [hl], a                                  ; $6794: $77
    ld   hl, wTranscientVfxPosYTable              ; $6795: $21 $40 $C5
    add  hl, bc                                   ; $6798: $09
    ld   a, [hl]                                  ; $6799: $7E
    sub  a, $48                                   ; $679A: $D6 $48
    ld   e, $01                                   ; $679C: $1E $01
    and  $80                                      ; $679E: $E6 $80
    jr   nz, .jr_67A4                             ; $67A0: $20 $02
    ld   e, $FF                                   ; $67A2: $1E $FF

.jr_67A4::
    ld   a, [hl]                                  ; $67A4: $7E
    add  a, e                                     ; $67A5: $83
    ld   [hl], a                                  ; $67A6: $77

ret_001_67A7::
    ret                                           ; $67A7: $C9

func_001_67A8::
    call func_001_67B5                            ; $67A8: $CD $B5 $67
    push bc                                       ; $67AB: $C5
    ld   a, c                                     ; $67AC: $79
    add  a, $10                                   ; $67AD: $C6 $10
    ld   c, a                                     ; $67AF: $4F
    call func_001_67B5                            ; $67B0: $CD $B5 $67
    pop  bc                                       ; $67B3: $C1
    ret                                           ; $67B4: $C9

func_001_67B5::
    ld   hl, wC550                                ; $67B5: $21 $50 $C5
    add  hl, bc                                   ; $67B8: $09
    ld   a, [hl]                                  ; $67B9: $7E
    push af                                       ; $67BA: $F5
    swap a                                        ; $67BB: $CB $37
    and  $F0                                      ; $67BD: $E6 $F0
    ld   hl, wC570                                ; $67BF: $21 $70 $C5
    add  hl, bc                                   ; $67C2: $09
    add  a, [hl]                                  ; $67C3: $86
    ld   [hl], a                                  ; $67C4: $77
    rl   d                                        ; $67C5: $CB $12
    ld   hl, wTranscientVfxPosXTable              ; $67C7: $21 $30 $C5
    add  hl, bc                                   ; $67CA: $09
    pop  af                                       ; $67CB: $F1
    ld   e, $00                                   ; $67CC: $1E $00
    bit  7, a                                     ; $67CE: $CB $7F
    jr   z, .jr_67D4                              ; $67D0: $28 $02
    ld   e, $F0                                   ; $67D2: $1E $F0

.jr_67D4::
    swap a                                        ; $67D4: $CB $37
    and  $0F                                      ; $67D6: $E6 $0F
    or   e                                        ; $67D8: $B3
    rr   d                                        ; $67D9: $CB $1A
    adc  a, [hl]                                  ; $67DB: $8E
    ld   [hl], a                                  ; $67DC: $77
    ret                                           ; $67DD: $C9

OpenMarinBeachDialog::
    ld   e, a                                     ; $67DE: $5F
    ldh  a, [hLinkPositionY]                      ; $67DF: $F0 $99
    push af                                       ; $67E1: $F5
    ld   a, $60                                   ; $67E2: $3E $60
    ldh  [hLinkPositionY], a                      ; $67E4: $E0 $99
    ld   a, e                                     ; $67E6: $7B
    call OpenDialogInTable1                       ; $67E7: $CD $73 $23
    pop  af                                       ; $67EA: $F1
    ldh  [hLinkPositionY], a                      ; $67EB: $E0 $99
    ret                                           ; $67ED: $C9
