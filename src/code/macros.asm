
; GBC palette entry
; RGB r, g, b
; values: 0 ~ 31
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

; Open a dialog in the correct dialogs table (using a `call` instruction)
; Usage:
;   call_open_dialog $123 ; will open Dialog123
call_open_dialog: macro
    ld   a, LOW(\1)
    if HIGH(\1) == 1
        call OpenDialogInTable1
    elif HIGH(\1) == 2
        call OpenDialogInTable2
    else
        call OpenDialog
    endc
endm

; Open a dialog in the correct dialogs table (using a `jp` instruction)
; Usage:
;   jp_open_dialog $123 ; will open Dialog123
jp_open_dialog: macro
    ld   a, LOW(\1)
    if HIGH(\1) == 1
        jp   OpenDialogInTable1
    elif HIGH(\1) == 2
        jp   OpenDialogInTable2
    else
        jp   OpenDialog
    endc
endm
