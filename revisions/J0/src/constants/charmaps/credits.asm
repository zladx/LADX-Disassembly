;
; Mapping from Unicode to the codepoints used in the ROM.
;
PUSHC
NEWCHARMAP CreditsCharmap

; Credits-specific charmap patches for Japanese
; Just a subset of the English Dialog charmap
charmap " ", $20

charmap "&", $26

charmap "0", $30
charmap "1", $31
charmap "2", $32
charmap "3", $33
charmap "4", $34
charmap "5", $35
charmap "6", $36
charmap "7", $37
charmap "8", $38
charmap "9", $39

charmap "A", $41
charmap "B", $42
charmap "C", $43
charmap "D", $44
charmap "E", $45
charmap "F", $46
charmap "G", $47
charmap "H", $48
charmap "I", $49
charmap "J", $4A
charmap "K", $4B
charmap "L", $4C
charmap "M", $4D
charmap "N", $4E
charmap "O", $4F
charmap "P", $50
charmap "Q", $51
charmap "R", $52
charmap "S", $53
charmap "T", $54
charmap "U", $55
charmap "V", $56
charmap "W", $57
charmap "X", $58
charmap "Y", $59
charmap "Z", $5A

charmap "a", $61
charmap "b", $62
charmap "c", $63
charmap "d", $64
charmap "e", $65
charmap "f", $66
charmap "g", $67
charmap "h", $68
charmap "i", $69
charmap "j", $6A
charmap "k", $6B
charmap "l", $6C
charmap "m", $6D
charmap "n", $6E
charmap "o", $6F
charmap "p", $70
charmap "q", $71
charmap "r", $72
charmap "s", $73
charmap "t", $74
charmap "u", $75
charmap "v", $76
charmap "w", $77
charmap "x", $78
charmap "y", $79
charmap "z", $7A

POPC
