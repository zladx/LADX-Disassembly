section "Hardcoded CopyData variants", rom0 [$0062]
Copy6900ToTileMemory89A0::
    ld   hl, $6900
    ld   de, $89A0
    jr   Copy48BytesAndClearFlags

Copy6930ToTileMemory89D0::
    ld   hl, $6930
    ld   de, $89D0
    jr   Copy48BytesAndClearFlags

Copy49D0ToTileMemory89D0::
    ld   hl, $49D0
    ld   de, $89D0
    jr   Copy48BytesAndClearFlags

Copy49A0ToTileMemory89A0::
    ld   hl, $49A0
    ld   de, $89A0

Copy48BytesAndClearFlags::
    ld   bc, $0030
    call CopyData
    xor  a
    ldh  [$FF90], a
    ldh  [$FF92], a
    ld   a, $0C
    ld   [$2100], a
    ret

section "Entry", rom0 [$100]
	; This is the entry point to the program.
	nop
	jp Start


section "Header", rom0 [$104]
	; The header is created by rgbfix.
	; The space here is allocated as a placeholder.
	ds $150 - $104
