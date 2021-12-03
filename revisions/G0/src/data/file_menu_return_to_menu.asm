; destination
db $99, $C6
; length
db $0B
; tilemap (top row, for the umlauts)
db $A9, $6F, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $6F

; destination
db $99, $E4
; length
db $0D
; tilemap (bottom row, for the actual letters)
db $19, $14, $11, $14, $02, $0A, $6B, $6C, $6D, $6E, $0C, $04, $0D, $14

; end
db $00

; padding
db $00
