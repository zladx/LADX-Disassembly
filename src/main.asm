; The source code found here assembles to main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.


include "constants.asm"

include "code/rst.asm"
include "code/header.asm"


section "Main", rom0

Start:
	; There should be some code here. In the meantime, loop forever.
	; Disable interrupts and halt to conserve battery.

	di
.loop
	halt
	jr .loop
