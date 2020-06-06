; Dialog characters positions
DialogCharacterXTable::
    db   $00, $10, $20, $30, $40, $50, $60, $70
    db   $80, $90, $A0, $B0, $C0, $D0, $E0, $F0
    db   $00, $10, $20, $30, $40, $50, $60, $70
    db   $80, $90, $A0, $B0, $C0, $D0, $E0, $F0

DialogCharacterYTable::
    db   $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D
    db   $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D
    db   $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E
    db   $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E

Data_01C_45A1::
    db   $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7
    db   $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF
    db   $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7
    db   $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF

Data_01C_45C1::
    db   $98, $98, $98, $98, $98, $98, $98, $98
    db   $98, $98, $98, $98, $98, $98, $98, $98
    db   $98, $98, $98, $98, $98, $98, $98, $98
    db   $98, $98, $98, $98, $98, $98, $98, $98
    db   $99, $99, $99, $99, $99, $99, $99, $99
    db   $99, $99, $99, $99, $99, $99, $99, $99
    db   $99, $99, $99, $99, $99, $99, $99, $99
    db   $99, $99, $99, $99, $99, $99, $99, $99

Data_01C_4601::
    db   $42, $43, $44, $45, $46, $47, $48, $49
    db   $4A, $4B, $4C, $4D, $4E, $4F, $50, $51
    db   $82, $83, $84, $85, $86, $87, $88, $89
    db   $8A, $8B, $8C, $8D, $8E, $8F, $90, $91
    db   $62, $63, $64, $65, $66, $67, $68, $69
    db   $6A, $6B, $6C, $6D, $6E, $6F, $70, $71
    db   $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9
    db   $AA, $AB, $AC, $AD, $AE, $AF, $B0, $B1

AsciiToTileMap::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
    db   $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
    db   $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $30, $2C, $05, $06
    db   $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $19, $1A, $1B
    db   $1C, $1D, $19, $1A, $1B, $1C, $1D, $3E, $2F, $2D, $2E, $00, $00, $00, $00, $00
    db   $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
    db   $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F
    db   $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6A, $6B, $31, $6C, $45, $46
    db   $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $59, $5A, $5B
    db   $5C, $5D, $59, $5A, $5B, $5C, $5D, $32, $6F, $6D, $6E, $00, $00, $00, $00, $00
    db   $3D, $3C, $3F, $7E, $39, $3A, $3B, $7A, $7B, $00, $00, $00, $00, $00, $00, $00
    db   $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $9B, $9C, $9D, $9E, $9F, $38
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F
    db   $88, $90, $91, $92, $93, $94, $95, $89, $96, $97, $98, $99, $9A, $87, $86, $00
    db   $34, $35, $36, $37, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7E, $00, $00

DakutenTable:
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $02, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $02, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00