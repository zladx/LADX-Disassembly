;
; Charmap used on the name entry table
; Space is 0, other values seem to just map to A
; (but 0 in a charmap makes rgbds truncate the rest of the string, doh)
;
; If you look at this and go "wow, it's ASCII but off by one!" ... yep.
;
PUSHC
NEWCHARMAP NameEntryCharmap
CHARMAP " ", $00
CHARMAP "Ä", $C5
CHARMAP "Ö", $D7
CHARMAP "Ü", $DD
CHARMAP "ß", $E0
CHARMAP "ä", $E5
CHARMAP "ö", $F7
CHARMAP "ü", $FD

CHARMAP "A", $42
CHARMAP "B", $43
CHARMAP "C", $44
CHARMAP "D", $45
CHARMAP "E", $46
CHARMAP "F", $47
CHARMAP "G", $48
CHARMAP "H", $49
CHARMAP "I", $4A
CHARMAP "J", $4B
CHARMAP "K", $4C
CHARMAP "L", $4D
CHARMAP "M", $4E
CHARMAP "N", $4F
CHARMAP "O", $50
CHARMAP "P", $51
CHARMAP "Q", $52
CHARMAP "R", $53
CHARMAP "S", $54
CHARMAP "T", $55
CHARMAP "U", $56
CHARMAP "V", $57
CHARMAP "W", $58
CHARMAP "X", $59
CHARMAP "Y", $5A
CHARMAP "Z", $5B
CHARMAP "a", $62
CHARMAP "b", $63
CHARMAP "c", $64
CHARMAP "d", $65
CHARMAP "e", $66
CHARMAP "f", $67
CHARMAP "g", $68
CHARMAP "h", $69
CHARMAP "i", $6A
CHARMAP "j", $6B
CHARMAP "k", $6C
CHARMAP "l", $6D
CHARMAP "m", $6E
CHARMAP "n", $6F
CHARMAP "o", $70
CHARMAP "p", $71
CHARMAP "q", $72
CHARMAP "r", $73
CHARMAP "s", $74
CHARMAP "t", $75
CHARMAP "u", $76
CHARMAP "v", $77
CHARMAP "w", $78
CHARMAP "x", $79
CHARMAP "y", $7A
CHARMAP "z", $7B

POPC
