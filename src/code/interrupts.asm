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
