;
; A set of functions that updates the palettes of the
; whole screen during specific scenes:
;
; - Credits
; - Mad Batter upgrades
;

; Palette data
Data_024_7711::
    db   $07, $41, $29, $31, $29, $31, $31, $42
    db   $8B, $45, $29, $31, $29, $31, $73, $46
    db   $0F, $4A, $08, $2D, $08, $2D, $B5, $4A
    db   $73, $4E, $08, $2D, $08, $2D, $18, $4F
    db   $F7, $52, $08, $2D, $08, $2D, $5A, $53
    db   $7B, $57, $E7, $28, $E7, $28, $9C, $57
    db   $FF, $5B, $E7, $28, $E7, $28, $FF, $5B
    db   $FF, $5B, $E7, $28, $E7, $28, $FF, $5B
    db   $BC, $5F, $08, $2D, $08, $2D, $FF, $5F
    db   $59, $63, $4A, $35, $4A, $35, $FF, $63
    db   $F6, $66, $6B, $3D, $6B, $3D, $FF, $67
    db   $92, $6E, $AD, $45, $AD, $45, $FF, $6F
    db   $2F, $72, $CE, $4D, $CE, $4D, $FF, $73
    db   $CC, $75, $10, $56, $10, $56, $FF, $77
    db   $68, $7D, $52, $5E, $52, $5E, $FF, $7F

; Palette data
Data_024_7789::
    db   $07, $41, $79, $16, $FF, $37, $FF, $73
    db   $8B, $45, $BA, $22, $FF, $3B, $FF, $6F
    db   $0F, $4A, $FB, $2E, $FF, $43, $FF, $6B
    db   $73, $4E, $3C, $37, $FF, $47, $FF, $67
    db   $F7, $52, $7D, $43, $FF, $4F, $FF, $63
    db   $7B, $57, $BE, $4F, $FF, $53, $FF, $5F
    db   $FF, $5B, $FF, $5B, $FF, $5B, $FF, $5B
    db   $FF, $5B, $FF, $5B, $FF, $5B, $FF, $5B
    db   $BC, $5F, $BE, $4F, $FF, $53, $FF, $5F
    db   $59, $63, $7D, $43, $FF, $4F, $FF, $63
    db   $F6, $66, $3C, $37, $FF, $47, $FF, $67
    db   $92, $6E, $FB, $2E, $FF, $43, $FF, $6B
    db   $2F, $72, $BA, $22, $FF, $3B, $FF, $6F
    db   $CC, $75, $79, $16, $FF, $37, $FF, $73
    db   $68, $7D, $39, $0E, $FF, $33, $FF, $77

func_024_7801::
    ld   a, [wD00C]                               ;; 24:7801 $FA $0C $D0
    cp   $22                                      ;; 24:7804 $FE $22
    ret  nc                                       ;; 24:7806 $D0

    sbc  $04                                      ;; 24:7807 $DE $04
    ld   b, a                                     ;; 24:7809 $47
    and  $01                                      ;; 24:780A $E6 $01
    ret  nz                                       ;; 24:780C $C0

    ld   a, b                                     ;; 24:780D $78
    sla  a                                        ;; 24:780E $CB $27
    sla  a                                        ;; 24:7810 $CB $27
    ld   c, a                                     ;; 24:7812 $4F
    ld   b, $00                                   ;; 24:7813 $06 $00

func_024_7815::
    push bc                                       ;; 24:7815 $C5
    ld   hl, Data_024_7711                        ;; 24:7816 $21 $11 $77
    add  hl, bc                                   ;; 24:7819 $09
    ld   bc, $08                                  ;; 24:781A $01 $08 $00
    ld   de, wBGPal1                              ;; 24:781D $11 $10 $DC
    call CopyData                                 ;; 24:7820 $CD $14 $29
    pop  bc                                       ;; 24:7823 $C1
    ld   hl, Data_024_7789                        ;; 24:7824 $21 $89 $77
    add  hl, bc                                   ;; 24:7827 $09
    ld   bc, $08                                  ;; 24:7828 $01 $08 $00
    ld   de, wBGPal8                              ;; 24:782B $11 $48 $DC
    call CopyData                                 ;; 24:782E $CD $14 $29
    xor  a                                        ;; 24:7831 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 24:7832 $EA $D3 $DD
    ld   a, $20                                   ;; 24:7835 $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 24:7837 $EA $D4 $DD
    ld   a, $81                                   ;; 24:783A $3E $81
    ld   [wPaletteDataFlags], a                   ;; 24:783C $EA $D1 $DD
    ret                                           ;; 24:783F $C9

; Palette data
Data_024_7840::
    db   $B3, $7E, $00, $00, $C3, $10, $0B, $19
    db   $B3, $7E, $00, $00, $CB, $08, $67, $08
    db   $B3, $7E, $00, $00, $67, $08, $24, $04
    db   $B3, $7E, $00, $00, $C3, $10, $60, $10
    db   $B3, $7E, $00, $00, $AB, $0C, $0B, $19
    db   $B3, $7E, $00, $00, $67, $08, $C3, $10
    db   $B3, $7E, $00, $00, $60, $10, $0B, $19
    db   $B3, $7E, $00, $00, $60, $10, $67, $08
    db   $B3, $7E, $00, $00, $04, $19, $6E, $21
    db   $B3, $7E, $00, $00, $0E, $0D, $89, $0C
    db   $B3, $7E, $00, $00, $89, $0C, $45, $04
    db   $B3, $7E, $00, $00, $04, $19, $80, $18
    db   $B3, $7E, $00, $00, $EE, $10, $6E, $21
    db   $B3, $7E, $00, $00, $89, $0C, $04, $19
    db   $B3, $7E, $00, $00, $80, $18, $6E, $21
    db   $B3, $7E, $00, $00, $80, $18, $89, $0C
    db   $B3, $7E, $00, $00, $45, $1D, $B1, $29
    db   $B3, $7E, $00, $00, $31, $0D, $AB, $10
    db   $B3, $7E, $00, $00, $AB, $10, $46, $04
    db   $B3, $7E, $00, $00, $45, $1D, $A0, $1C
    db   $B3, $7E, $00, $00, $11, $15, $B1, $29
    db   $B3, $7E, $00, $00, $AB, $10, $45, $1D
    db   $B3, $7E, $00, $00, $A0, $1C, $B1, $29
    db   $B3, $7E, $00, $00, $A0, $1C, $AB, $10
    db   $B3, $7E, $00, $00, $66, $21, $F4, $31
    db   $B3, $7E, $00, $00, $74, $0D, $CD, $10
    db   $B3, $7E, $00, $00, $CD, $10, $47, $04
    db   $B3, $7E, $00, $00, $66, $21, $C0, $20
    db   $B3, $7E, $00, $00, $34, $19, $F4, $31
    db   $B3, $7E, $00, $00, $CD, $10, $66, $21
    db   $B3, $7E, $00, $00, $C0, $20, $F4, $31
    db   $B3, $7E, $00, $00, $C0, $20, $CD, $10
    db   $B3, $7E, $00, $00, $A6, $25, $57, $36
    db   $B3, $7E, $00, $00, $97, $11, $CF, $14
    db   $B3, $7E, $00, $00, $CF, $14, $68, $04
    db   $B3, $7E, $00, $00, $A6, $25, $C0, $24
    db   $B3, $7E, $00, $00, $57, $19, $57, $36
    db   $B3, $7E, $00, $00, $CF, $14, $A6, $25
    db   $B3, $7E, $00, $00, $C0, $24, $57, $36
    db   $B3, $7E, $00, $00, $C0, $24, $CF, $14
    db   $B3, $7E, $00, $00, $C7, $29, $9A, $3E
    db   $B3, $7E, $00, $00, $DA, $11, $F1, $14
    db   $B3, $7E, $00, $00, $F1, $14, $69, $04
    db   $B3, $7E, $00, $00, $C7, $29, $E0, $28
    db   $B3, $7E, $00, $00, $7A, $1D, $9A, $3E
    db   $B3, $7E, $00, $00, $F1, $14, $C7, $29
    db   $B3, $7E, $00, $00, $E0, $28, $9A, $3E
    db   $B3, $7E, $00, $00, $E0, $28, $F1, $14
    db   $B3, $7E, $00, $00, $08, $2E, $DD, $46
    db   $B3, $7E, $00, $00, $FD, $11, $13, $19
    db   $B3, $7E, $00, $00, $13, $19, $6A, $04
    db   $B3, $7E, $00, $00, $08, $2E, $00, $2D
    db   $B3, $7E, $00, $00, $9D, $21, $DD, $46
    db   $B3, $7E, $00, $00, $13, $19, $08, $2E
    db   $B3, $7E, $00, $00, $00, $2D, $DD, $46
    db   $B3, $7E, $00, $00, $00, $2D, $13, $19
    db   $C5, $4C, $00, $00, $28, $32, $1F, $4B
    db   $B3, $7E, $00, $00, $1F, $12, $15, $19
    db   $B3, $7E, $00, $00, $15, $19, $6B, $04
    db   $B3, $7E, $00, $00, $28, $32, $00, $31
    db   $B3, $7E, $00, $00, $BF, $21, $1F, $4B
    db   $B3, $7E, $00, $00, $15, $19, $28, $32
    db   $B3, $7E, $00, $00, $00, $31, $1F, $4B
    db   $B3, $7E, $00, $00, $00, $31, $15, $19

func_024_7A40::
    ldh  a, [hFrameCounter]                       ;; 24:7A40 $F0 $E7
    and  $07                                      ;; 24:7A42 $E6 $07
    ret  nz                                       ;; 24:7A44 $C0

    ld   hl, wD022                                ;; 24:7A45 $21 $22 $D0
    ld   a, [hl]                                  ;; 24:7A48 $7E
    cp   $07                                      ;; 24:7A49 $FE $07
    ret  z                                        ;; 24:7A4B $C8

    inc  a                                        ;; 24:7A4C $3C
    ld   [hl], a                                  ;; 24:7A4D $77
    swap a                                        ;; 24:7A4E $CB $37
    ld   c, a                                     ;; 24:7A50 $4F
    ld   b, $00                                   ;; 24:7A51 $06 $00
    sla  c                                        ;; 24:7A53 $CB $21
    rl   b                                        ;; 24:7A55 $CB $10
    sla  c                                        ;; 24:7A57 $CB $21
    rl   b                                        ;; 24:7A59 $CB $10
    ld   hl, Data_024_7840                        ;; 24:7A5B $21 $40 $78
    add  hl, bc                                   ;; 24:7A5E $09
    ld   bc, $40                                  ;; 24:7A5F $01 $40 $00
    ld   de, wObjPal1                             ;; 24:7A62 $11 $50 $DC
    call CopyData                                 ;; 24:7A65 $CD $14 $29
    xor  a                                        ;; 24:7A68 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 24:7A69 $EA $D3 $DD
    ld   a, $20                                   ;; 24:7A6C $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 24:7A6E $EA $D4 $DD
    ld   a, $82                                   ;; 24:7A71 $3E $82
    ld   [wPaletteDataFlags], a                   ;; 24:7A73 $EA $D1 $DD
    ret                                           ;; 24:7A76 $C9

; Palette data for the normal and inverted BG colors in the Mad Batter scene.
; These are copied to palette memory in two steps.
MadBatterBGPalettes::
.start
.normal1
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $B5, $32, $00, $00, $B5, $32, $FF, $47
    db   $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F
    db   $B5, $32, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47

.normal2
    db   $6B, $19, $6B, $19, $B5, $32, $00, $00
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $6B, $19, $B5, $32, $00, $00, $FF, $47
    db   $00, $00, $6B, $19, $B5, $32, $FF, $47
    db   $6B, $19, $6B, $19, $B5, $32, $FF, $47

.inverted1
    db   $FF, $47, $FD, $2E, $B5, $15, $00, $00
    db   $FF, $47, $31, $52, $C5, $28, $00, $00
    db   $FF, $47, $7F, $2C, $0E, $14, $00, $00
    db   $FF, $47, $D9, $11, $CE, $10, $00, $00
    db   $F4, $09, $FF, $7F, $F4, $09, $00, $00
    db   $FF, $7F, $FF, $7F, $FF, $7F, $FF, $7F
    db   $FD, $2E, $36, $7F, $45, $7D, $00, $00
    db   $FE, $63, $C4, $26, $21, $15, $00, $00
    db   $39, $0E, $F3, $51, $67, $28, $00, $00

.inverted2
    db   $FF, $47, $F3, $51, $67, $28, $00, $00
    db   $FF, $47, $17, $14, $08, $10, $00, $00
    db   $FF, $47, $D9, $11, $CE, $10, $00, $00
    db   $7F, $3B, $FF, $7C, $10, $28, $00, $00
    db   $39, $0E, $11, $19, $FE, $63, $00, $00
    db   $0D, $76, $45, $7D, $A4, $3C, $00, $00
    db   $39, $0E, $C4, $26, $21, $15, $00, $00

; On CGB, replace the whole BG palettes with an inverted version,
; for a flashing effect.
;
; Each set of palettes (normal and inverted) is copied in two passes.
;
; Inputs:
;   d    which palettes set to copy (0 for normal, 1 for inverted)
MadBatterReplaceScenePalettes::
    push bc                                       ;; 24:7B77 $C5
    ld   hl, MadBatterBGPalettes.normal1          ;; 24:7B78 $21 $77 $7A
    ld   b, $00                                   ;; 24:7B7B $06 $00
    ld   c, MadBatterBGPalettes.inverted1 - MadBatterBGPalettes.start ;; 24:7B7D $0E $80

    ld   a, d                                     ;; 24:7B7F $7A
    bit  1, a                                     ;; 24:7B80 $CB $4F
    jr   nz, .jr_024_7B85                         ;; 24:7B82 $20 $01
    add  hl, bc                                   ;; 24:7B84 $09
.jr_024_7B85

    ldh  a, [hMapRoom]                            ;; 24:7B85 $F0 $F6
    cp   UNKNOWN_ROOM_A1                          ;; 24:7B87 $FE $A1
    jr   z, .jr_024_7B8E                          ;; 24:7B89 $28 $03
    ld   c, MadBatterBGPalettes.normal2 - MadBatterBGPalettes.start ;; 24:7B8B $0E $40
    add  hl, bc                                   ;; 24:7B8D $09
.jr_024_7B8E

    ld   bc, $40                                  ;; 24:7B8E $01 $40 $00
    ld   de, wBGPal1                              ;; 24:7B91 $11 $10 $DC
    call CopyData                                 ;; 24:7B94 $CD $14 $29

    xor  a                                        ;; 24:7B97 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 24:7B98 $EA $D3 $DD
    ld   a, $20                                   ;; 24:7B9B $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 24:7B9D $EA $D4 $DD
    ld   a, $81                                   ;; 24:7BA0 $3E $81
    ld   [wPaletteDataFlags], a                   ;; 24:7BA2 $EA $D1 $DD
    pop  bc                                       ;; 24:7BA5 $C1
    ret                                           ;; 24:7BA6 $C9
