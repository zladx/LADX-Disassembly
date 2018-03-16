
RGB: macro
    db (\1) + (\2) << 5 + (\3) << 10
endm

; The games uses code stored at $0000 to go to the jump table handler,
; which means reseting the PC to 0 activates the jump table.
;
; See the JumpTable function for details and usage.
JP_TABLE: macro
    rst 0
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
