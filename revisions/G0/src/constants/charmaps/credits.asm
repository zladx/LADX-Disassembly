;
; Mapping from Unicode to the codepoints used in the ROM.
;
PUSHC
NEWCHARMAP CreditsCharmap

SETCHARMAP DialogCharmap

; Credits-specific charmap patches for German
charmap "[", $5B
charmap "\\", $5C
charmap "]", $5D
charmap "^", $5E

POPC
