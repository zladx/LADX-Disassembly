;
; Mapping from Unicode to the codepoints used by the ROM (French flavored).
; Mostly matches ASCII.
;
PUSHC
NEWCHARMAP DialogCharmap

charmap "<tab>", $09

charmap " ", $20
charmap "!", $21
charmap "\"", $22
charmap "#", $23

charmap "â", $24
charmap "à", $25

charmap "&", $26

charmap "(", $28
charmap ")", $29

charmap "é", $2a
charmap "è", $2b

charmap ",", $2C
charmap "-", $2D
charmap ".", $2E

charmap "î", $2F

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
charmap ":", $3A

charmap "<hash>", $3B
charmap "ê", $3C
charmap "ù", $3D

charmap "?", $3F

charmap "Ç", $40

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

charmap "ï", $5B
charmap "û", $5C
charmap "ô", $5D
charmap "'", $5E
charmap "ç", $5F

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

charmap "<star>", $7C
charmap "Ó", $7D

charmap "+", $7F

charmap ";", $ad
charmap "<tri1>", $ae
charmap "<tri2>", $af
charmap "É", $ce
charmap "<heart>", $cf
charmap "<skull>", $dc
charmap "<link>", $dd
charmap "<marin>", $de
charmap "<yoshi>", $e0
charmap "<ribbon>", $e1
charmap "<dogfood>", $e2
charmap "<bananas>", $e3
charmap "<stick>", $e4
charmap "<honeycomb>", $e5
charmap "<pineapple>", $e6
charmap "<flower>", $e7
charmap "<broom>", $e8
charmap "<fishhook>", $e9
charmap "<bra>", $ea
charmap "<letter>", $ed
charmap "<dpad>", $ee
charmap "/", $ef
charmap "<up>", $f0
charmap "<down>", $f1
charmap "<left>", $f2
charmap "<right>", $f3
charmap "<ask>", $fe
charmap "@", $ff

POPC
