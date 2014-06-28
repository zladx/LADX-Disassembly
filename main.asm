; The source code found here is assembled into main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.

section "Entry", rom0 [$100]
; This is the entry point to the program.
	nop
	jr Start

section "Main", rom0 [$150]
Start:
; There should be some code here. In the meantime, loop forever.
; Disable interrupts and halt to conserve battery.
	di
.loop
	halt
	jr .loop
