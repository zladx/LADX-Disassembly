;
; Mapping from Unicode to the codepoints used by the ROM.
; Used for the player's name.
; Mostly ASCII, but off by 1.
;
PUSHC
NEWCHARMAP NameEntryCharmap

charmap " ", $00

charmap "A", $41 + 1
charmap "B", $42 + 1
charmap "C", $43 + 1
charmap "D", $44 + 1
charmap "E", $45 + 1
charmap "F", $46 + 1
charmap "G", $47 + 1
charmap "H", $48 + 1
charmap "I", $49 + 1
charmap "J", $4A + 1
charmap "K", $4B + 1
charmap "L", $4C + 1
charmap "M", $4D + 1
charmap "N", $4E + 1
charmap "O", $4F + 1
charmap "P", $50 + 1
charmap "Q", $51 + 1
charmap "R", $52 + 1
charmap "S", $53 + 1
charmap "T", $54 + 1
charmap "U", $55 + 1
charmap "V", $56 + 1
charmap "W", $57 + 1
charmap "X", $58 + 1
charmap "Y", $59 + 1
charmap "Z", $5A + 1

charmap "a", $61 + 1
charmap "b", $62 + 1
charmap "c", $63 + 1
charmap "d", $64 + 1
charmap "e", $65 + 1
charmap "f", $66 + 1
charmap "g", $67 + 1
charmap "h", $68 + 1
charmap "i", $69 + 1
charmap "j", $6A + 1
charmap "k", $6B + 1
charmap "l", $6C + 1
charmap "m", $6D + 1
charmap "n", $6E + 1
charmap "o", $6F + 1
charmap "p", $70 + 1
charmap "q", $71 + 1
charmap "r", $72 + 1
charmap "s", $73 + 1
charmap "t", $74 + 1
charmap "u", $75 + 1
charmap "v", $76 + 1
charmap "w", $77 + 1
charmap "x", $78 + 1
charmap "y", $79 + 1
charmap "z", $7A + 1

charmap "Ä", $c4 + 1
charmap "Ö", $d6 + 1
charmap "Ü", $dc + 1
charmap "ß", $df + 1
charmap "ä", $e4 + 1
charmap "ö", $f6 + 1
charmap "ü", $fc + 1


POPC
