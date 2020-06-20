    ; Used to translate cursor position -> name letter
    ; on the name entry menu. Does not actually represent
    ; the graphics - this is just the letter that is chosen
    ; when you push A
    PUSHC
    SETCHARMAP NameEntryCharmap
    db $01, $06, $0b, $10, $15, $1a, $1f, $24, $27, $2c, $00, $2f, $34, $39, $3e, $43
    db $02, $07, $0c, $11, $16, $1b, $20, $25, $28, $2e, $00, $30, $35, $3a, $3f, $44
    db $03, $08, $0d, $12, $17, $1c, $21, $26, $29, $48, $00, $31, $36, $3b, $40, $45
    db $04, $09, $0e, $13, $18, $1d, $22, $4b, $2a, $49, $00, $32, $37, $3c, $41, $46
    db $05, $0a, $0f, $14, $19, $1e, $23, $a3, $2b, $4a, $00, $33, $38, $3d, $42, $47
    POPC
