; Spatial position of rooms on a given indoor map

MapLayout0::
    ; Tail Cave
    db     0,   0,   0,   0,   0, $18, $19,   0
    db     0,   0,   0,   0,   0, $1A, $1B,   0
    db     0,   0,   0,   0,   0,   0, $02,   0
    db     0, $03, $04, $05,   0,   0, $06,   0
    db   $1D,   0, $07, $08, $09, $0A, $0B,   0
    db   $1C, $0C, $0D, $0E, $0F, $10, $11,   0
    db   $01,   0, $12, $13, $14,   0,   0,   0
    db     0, $15, $16, $17,   0,   0,   0,   0

MapLayout1::
    ; Bottle Grotto
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0, $20, $21, $22, $23, $24, $25,   0
    db     0,   0, $26,   0,   0, $27,   0,   0
    db     0, $28, $29, $3A, $3B, $2A, $2B,   0
    db     0, $2C,   0, $3C, $3D,   0, $2D,   0
    db     0, $2E,   0, $3E, $3F,   0, $2F,   0
    db     0, $30, $31, $32, $33, $34, $35,   0
    db     0,   0, $36, $37, $38, $39,   0,   0

MapLayout2::
    ; Key Cavern
    db   $40, $41, $42, $43,   0, $AA, $AB,   0
    db   $44, $45, $46, $47,   0,   0,   0,   0
    db   $48, $49, $4A, $4B,   0,   0, $54,   0
    db     0, $4C, $4D,   0,   0, $55, $56, $57
    db     0, $4E,   0,   0,   0,   0, $58,   0
    db     0, $4F, $50,   0,   0,   0, $59,   0
    db     0, $51,   0,   0,   0,   0, $5A,   0
    db     0, $52, $53,   0,   0,   0, $5B, $5C

MapLayout3::
    ; Angler's Tunnel
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0, $60, $61,   0,   0,   0
    db     0, $62,   0, $63, $64,   0, $65,   0
    db   $EF, $66, $67, $68, $69, $6A, $6B,   0
    db   $FF, $6C, $6D, $6E, $6F, $70, $71,   0
    db   $7C, $7D, $72, $73, $74, $75,   0,   0
    db   $1E, $1F, $76, $77, $78, $79,   0,   0
    db   $5E, $5F,   0, $7A, $7B,   0,   0,   0

MapLayout4::
    ; Catfish's Maw
    db     0, $80, $81, $82, $83, $84,   0,   0
    db     0,   0,   0, $85, $86, $87, $88,   0
    db     0, $89, $8A, $8B, $8C, $8D, $8E, $8F
    db     0,   0,   0,   0,   0, $90, $91, $92
    db   $A2, $A3,   0, $93, $94, $95, $96,   0
    db   $A4, $A5, $97, $98, $99, $9A,   0,   0
    db   $A6, $A7,   0, $9B, $9C, $9D,   0,   0
    db   $A8, $A9,   0,   0, $9E, $9F, $A0, $A1

MapLayout5::
    ; Face Shrine
    db   $D8, $D9, $DA, $DB, $DC, $DD,   0,   0
    db   $B0,   0,   0,   0,   0,   0,   0, $B1
    db   $B2, $B3,   0, $B4, $B5,   0, $B6, $B7
    db   $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF
    db   $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7
    db     0, $C8, $C9, $CA, $CB, $CC, $CD,   0
    db     0, $CE, $CF,   0,   0, $D0, $D1,   0
    db     0, $D2, $D3, $D4, $D5, $D6, $D7,   0

MapLayout6::
    ; Eagle's Tower (intact)
    db     0, $11, $12,   0,   0,   0,   0, $E8
    db   $13, $14, $15, $16,   0, $2B, $2C, $F8
    db   $17, $18, $19, $1A,   0, $2D, $2E,   0
    db   $1B, $1C, $1D, $1E,   0,   0,   0,   0
    db   $01, $02, $03, $04,   0, $1F, $20,   0
    db   $05, $06, $07, $08, $21, $22, $23, $24 ; POI: $23 is an unused room
    db   $09, $0A, $0B, $0C, $25, $26, $27, $28
    db   $0D, $0E, $0F, $10,   0, $29, $2A,   0

MapLayout7::
    ; Turtle Rock
    db   $60, $61,   0, $30, $31,   0, $62, $63
    db   $32, $64, $65, $34, $35, $66, $67, $37 ; POI: $33 and $36 aren't used, potentially
    db   $38, $39, $3A, $3B, $3C, $3D, $3E, $3F ; were originally positioned where the side-scrolling
    db     0, $40, $41, $42, $43, $44, $45,   0 ; rooms are. Hm.
    db     0, $46, $47, $48, $49, $4A, $4B,   0
    db   $4C, $4D, $4E, $4F, $50, $51, $52, $53
    db   $54, $55, $56, $57, $58, $59, $5A, $5B
    db   $5C, $68, $69, $5D, $5E, $6A, $6B, $5F

MapLayout8::
    ; Wind Fish's Egg
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0, $74,   0,   0,   0,   0
    db     0,   0,   0, $73,   0,   0,   0,   0
    db     0,   0,   0, $71,   0,   0,   0,   0
    db     0,   0,   0, $72,   0,   0,   0,   0
    db     0,   0,   0, $76,   0,   0,   0,   0 ; $76 contains an exit too
    db     0,   0,   0, $75,   0,   0,   0,   0
    db     0,   0,   0, $70,   0,   0,   0,   0 ; $70 contains an exit

MapLayout9::
    ; Empty (unused)
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0

MapLayout10::
    ; "Caves" - used to piece together random passages
    db   $B6, $B7, $B8, $B9, $85, $86, $FD, $F3
    db   $ED, $EE, $EA, $EB, $EC, $87, $F1, $F2
    db   $FE, $EF, $BA, $BB, $BC, $8D, $F9, $FA
    db   $80, $81, $82, $83, $84, $8C, $88, $8A
    db   $90, $91, $92,   0, $8E, $9A, $89, $8B
    db   $97, $93, $94, $95, $96,   0, $AB, $AC
    db   $98, $7A, $7B,   0, $E6, $E7,   0, $BD
    db     0, $7C, $7D, $7E, $F6, $F7, $DE, $DF

MapLayout11::
    ; Color Dungeon
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0,   0,   0,   0,   0,   0,   0,   0
    db     0, $00, $01,   0,   0, $02, $03,   0   ; Not a formatting error. Room 0 is the boss room
    db     0, $04, $05, $06, $07, $08, $09,   0   ; but is also the 'filler' room - this shows intent
    db     0,   0, $0A, $0B, $0C, $0D,   0,   0
    db     0,   0, $0E, $0F, $10, $11,   0,   0
    db     0,   0, $12, $13, $14, $15,   0,   0

MapLayout12::
    ; Eagle's Tower post-collapse
    db     0, $11, $12,   0,   0,   0,   0, $E8
    db   $13, $14, $15, $16,   0,   0,   0, $F8
    db   $17, $18, $19, $1A,   0,   0,   0,   0
    db   $1B, $1C, $1D, $1E,   0,   0,   0,   0
    db   $01, $02, $03, $04,   0, $1F, $20,   0
    db   $05, $06, $07, $08, $21, $2B, $2C, $24
    db   $09, $0A, $0B, $0C, $25, $2D, $2E, $28
    db   $0D, $0E, $0F, $10,   0, $29, $2A,   0
