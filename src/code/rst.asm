;  0000,0008,0010,0018,0020,0028,0030,0038   for RST commands
;  0040,0048,0050,0058,0060                  for Interrupts

section "RST 0x0000", rom0 [$0000]
    jp   func_28C0

section "Interrupt Vblank", rom0 [$0040]
    jp   func_046C

section "Interrupt LCD Stat", rom0 [$0048]
    jp   func_0388

section "Interrupt Timer", rom0 [$0050]
    reti

section "Interrupt Serial", rom0 [$0058]
    jp   func_0408

section "Interrupt Joypad", rom0 [$0060]
    reti


section "Something 0x0062", rom0 [$0062]
func_0062::
    ld   hl, $6900
    ld   de, $89A0
    jr   func_0080

func_006A::
    ld   hl, $6930
    ld   de, $89D0
    jr   func_0080

func_0072::
    ld   hl, $49D0
    ld   de, $89D0
    jr   func_0080

func_007A::
    ld   hl, $49A0
    ld   de, $89A0

func_0080::
    ld   bc, $0030
    call CopyData
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a

func_008B::
    ld   a, $0C
    ld   [$2100], a
    ret

