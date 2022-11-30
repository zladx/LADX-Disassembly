;
; Map codepoints (bytes of text as stored in the ROM) to diacritic tiles.
;
; The French text uses two diacritic tiles:
; - 1: ` (Grave accent on uppercase letter, tile $C9)
; - 2: ´ (Acute accent on uppercase letter, tile $C8)
;
; The two diacritic tiles are on these tilesheets:
; - `F0/src/gfx/items/inventory_overworld_items.dmg.png`
; - `F0/src/gfx/items/inventory_indoor_items.dmg.png`
; - `F0/src/gfx/ending/ending_1.dmg.png`
;
; However diacritics support for the French version is actually disabled:
; this table, as well as the associated diacritics, is unused.
;
; This is probably because, even if the French text has accentuated
; capitals like "É" in some places, supporting diacritics on all
; capital letters would require three diacritics (´, ` and ^), where
; the tilemap only reserve space for two. In the retail version, all
; french capital letters are left unaccentuated.
;
; See: DialogCharmap, CodepointToTileMap
;
CodepointToDiacritic::
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;                                    (unused) Ó
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;                                                É
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
