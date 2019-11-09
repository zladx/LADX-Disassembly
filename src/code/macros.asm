
RGB: macro
    db (\1) + (\2) << 5 + (\3) << 10
endm

; Farcall using direct bank selection
callsb: macro
    ld   a, BANK(\1)
    ld   [MBC3SelectBank], a
    call \1
endm

; Farcall using direct bank selection with hl
callhl: macro
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(\1)
    call \1
endm

; Farcall using SwitchBank
callsw: macro
    ld   a, BANK(\1)
    call SwitchBank
    call \1
endm

; Jump using SwitchBank
jpsb: macro
    ld   a, BANK(\1)
    ld   [MBC3SelectBank], a
    jp   \1
endm

; Jump using SwitchBank
jpsw: macro
    ld   a, BANK(\1)
    call SwitchBank
    jp   \1
endm

; The games uses code stored at $0000 to go to the jump table handler,
; which means reseting the PC to 0 activates the jump table.
;
; See the JumpTable function for details and usage.
JP_TABLE: macro
    rst 0
endm

; Define an entity in an entities list
; Usage:
;   entity <vertical-position>, <horizontal-position>, <type>
entity: macro
    db   \1 * $10 + \2, \3
endm

entities_end: macro
    db   ENTITIES_END
endm

; mgbdis macro
; RGBDS optimises instructions like `ld [$FF40],a` to `LDH [$FF00+40],a`,
; so these are encoded as data bytes using a macro to ensure exact
; reproduction of the original ROM.
ld_long: MACRO
    IF STRLWR("\1") == "a"
        ; ld a, [$ff40]
        db $FA
        dw \2
    ELSE
        IF STRLWR("\2") == "a"
            ; ld [$ff40], a
            db $EA
            dw \1
        ENDC
    ENDC
ENDM
