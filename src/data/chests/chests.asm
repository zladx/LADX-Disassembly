;
; Tables for what item is contained in a given map room's chest
;
; Each room can have one item in a chest that appears.
; It's defined per room, rather than as part of the chest itself.
;
; Each table is $10 x $10 (the full size of a 'map'),
; except for the color dungeon which is smaller.
;
; The 'default' is $00 (Power Bracelet).
;

include "data/chests/overworld.asm"
include "data/chests/indoors_a.asm"
include "data/chests/indoors_b.asm"
include "data/chests/color_dungeon.asm"
