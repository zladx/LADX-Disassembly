;
; Mapping from Unicode to the codepoints used in the ROM.
;
PUSHC
NEWCHARMAP CreditsCharmap, DialogCharmap

; Credits-specific charmap patches for French
charmap "[", $5B
charmap "\\", $5C
charmap "]", $5D
charmap "^", $5E

POPC
