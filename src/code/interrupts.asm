;  0000,0008,0010,0018,0020,0028,0030,0038   for RST commands
;  0040,0048,0050,0058,0060                  for Interrupts

section "RST 0x0000", rom0 [$0000]
    jp   TableJump

section "Interrupt VBlank", rom0 [$0040]
    jp   InterruptVBlank

section "Interrupt LCD Stat", rom0 [$0048]
    jp   InterruptLCDStatus

section "Interrupt Timer", rom0 [$0050]
    reti

section "Interrupt Serial", rom0 [$0058]
    jp   InterruptSerial

section "Interrupt Joypad", rom0 [$0060]
    reti


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
    ld   [$FF90], a
    ld   [$FF92], a
    ld   a, $0C
    ld   [$2100], a
    ret
