; 1. drop this in `src/code/macros.asm`
; 2. put this before a line of 8 bytes, like this:
;           db   $FF, $47, $00, $00, $A2, $22, $FF, $46
;     rawToRgb   $FF, $47, $00, $00, $A2, $22, $FF, $46
; 3. you'll get this in the console:
;           rgb   #F8F888, #000000, #10A840, #F8B888
macro rawToRgb
    redef packed_color equ \1 + \2 << 8
    redef red equ ((packed_color & %0000000000011111) >>  0) * 8
    redef grn equ ((packed_color & %0000001111100000) >>  5) * 8
    redef blu equ ((packed_color & %0111110000000000) >> 10) * 8
    redef friendly_color equ red << 16 | grn << 8 | blu << 0
    print "    rgb   #{06:friendly_color}"

    redef packed_color equ \3 + \4 << 8
    redef red equ ((packed_color & %0000000000011111) >>  0) * 8
    redef grn equ ((packed_color & %0000001111100000) >>  5) * 8
    redef blu equ ((packed_color & %0111110000000000) >> 10) * 8
    redef friendly_color equ red << 16 | grn << 8 | blu << 0
    print ", #{06:friendly_color}"

    redef packed_color equ \5 + \6 << 8
    redef red equ ((packed_color & %0000000000011111) >>  0) * 8
    redef grn equ ((packed_color & %0000001111100000) >>  5) * 8
    redef blu equ ((packed_color & %0111110000000000) >> 10) * 8
    redef friendly_color equ red << 16 | grn << 8 | blu << 0
    print ", #{06:friendly_color}"
    
    redef packed_color equ \7 + \8 << 8
    redef red equ ((packed_color & %0000000000011111) >>  0) * 8
    redef grn equ ((packed_color & %0000001111100000) >>  5) * 8
    redef blu equ ((packed_color & %0111110000000000) >> 10) * 8
    redef friendly_color equ red << 16 | grn << 8 | blu << 0
    println ", #{06:friendly_color}"
endm
