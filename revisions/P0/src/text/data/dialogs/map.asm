;
; Each 2x2 section of the overworld is assigned a dialogue index
; that will be shown when you push A on the map screen.
; e.g. bottom right = $68 = Dialog068 = "Yarna Desert"
;
MapLocationNamesTable::
    ;   0    2    4    6    8    A    C    E
    db $6C, $6C, $6C, $6B, $6C, $6C, $6C, $6C ; 00
    db $76, $76, $79, $79, $79, $79, $79, $79 ; 20
    db $6A, $6A, $72, $7A, $78, $78, $71, $71 ; 40
    db $6A, $6A, $72, $70, $78, $78, $71, $71 ; 60
    db $6A, $6E, $69, $69, $69, $69, $77, $71 ; 80
    db $6E, $6E, $69, $69, $69, $69, $77, $77 ; A0
    db $7B, $7B, $6D, $62, $74, $74, $6F, $68 ; C0
    db $73, $73, $73, $74, $74, $74, $75, $68 ; E0

;
; Lookup table for what dialogue message to show when examining a location on the map screen
; "Owl" icons are only visible if you've seen that particular event, though
;
; For (as of yet) unknown reasons, A7 actually maps to Dialog1A7 rather than 0A7
; POI: Unused entries that don't appear in MapSpecialLocationNamesTable anywhere
; 0F ("Enter the Egg!", maybe manually overridden?)
; 31 (Duplicate of 3E, "Wind Fish's Egg")
; 32 (Dialog05F and Dialog060 both point to "Mountain Bridge", hmm...!)
;
MapSpecialLocationNamesLookupTable::
    ;   0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
    db   0, $D9, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD  ; 00 - Owl reminders
    db   0, $56, $57, $58, $59, $5A, $5B, $5C, $5D,   0,   0,   0,   0,   0,   0,   0  ; 10 - Dungeon icons
    db   0, $7C, $67,   0,   0, $80, $65,   0, $64, $88, $7D,   0,   0,   0,   0,   0  ; 20 - Shop icons
    db   0, $5E, $5F, $7F, $7E, $7D, $82, $84, $85, $86, $87, $81, $66, $A7, $5E, $63  ; 30 - "!?" icons
    db   0, $61, $7C,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 40 - "!?" icons

;
; Table for map squares that have special text instead of the generic name from MapLocationNamesTable.
; Rather than directly indexing the dialogue entry, for some reason these are instead lookup values
; for *another* table (just above this one), MapSpecialLocationNamesLookupTable, which has the dialogue indexes...
;
MapSpecialLocationNamesTable::
    ;   0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
    db   0,   0,   0,   0,   0,   0, $3E,   0, $0E,   0, $39,   0,   0,   0, $17,   0 ; 00
    db $18, $3D,   0,   0,   0,   0, $06, $0C,   0,   0,   0,   0,   0,   0,   0,   0 ; 10
    db   0,   0,   0,   0, $12,   0,   0,   0, $07,   0,   0, $14,   0,   0,   0,   0 ; 20
    db $33, $3D,   0,   0,   0,   0, $05, $2A,   0,   0,   0,   0,   0,   0,   0, $29 ; 30
    db   0, $03,   0,   0,   0, $25,   0,   0,   0,   0,   0, $3D,   0,   0,   0,   0 ; 40
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 50
    db   0,   0,   0,   0, $0D, $22,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 60
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 70
    db $02, $42, $3B, $36,   0,   0,   0,   0, $3D,   0, $37,   0, $16,   0,   0,   0 ; 80
    db   0,   0,   0, $26,   0,   0,   0,   0,   0,   0,   0, $09, $0B, $09,   0,   0 ; 90
    db   0, $35, $3C,   0, $3D,   0,   0,   0,   0,   0,   0,   0, $0A,   0,   0,   0 ; A0
    db $3A, $34, $3D, $28,   0, $13, $07,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; B0
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; C0
    db   0,   0, $04, $11,   0,   0, $38,   0,   0, $15,   0, $3D,   0,   0,   0,   0 ; D0
    db   0,   0,   0, $41,   0,   0,   0,   0, $3D,   0,   0,   0,   0,   0, $08,   0 ; E0
    db   0,   0, $01,   0,   0,   0, $3F,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; F0
