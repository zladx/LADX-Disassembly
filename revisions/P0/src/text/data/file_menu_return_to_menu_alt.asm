; destination
db $99, $C6
; length
db $0B
; tilemap (top row, for the umlauts)
db $6F, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $A9, $6F

; destination
db $99, $E3
; length
db $0E
; tilemap (bottom row, for the actual letters)
db $19, $14, $11, $14, $02, $0A, $7E, $19, $14, $0C, $7E, $0C, $04, $0D, $14

; end
db $00
