section "Entry", rom0 [$100]

	; This is the entry point to the program.

	nop
	jp Start


section "Header", rom0 [$104]

	; The header is created by rgbfix.
	; The space here is allocated as a placeholder.

	ds $150 - $104
