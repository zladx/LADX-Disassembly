; The source code found here assembles to main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.


include "constants.asm"

include "code/rst.asm"
include "code/header.asm"


section "Main", rom0

Start:
    cp    a, $11
    jr    nz, .loc_61E
    ld    a, [rKEY1]

.loc_61E
    xor   a

	di
.loop
	halt
	jr .loop

section "bank1",romx,bank[$1]
    xor    a

