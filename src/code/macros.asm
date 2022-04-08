
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

; Store an address and the associated bank.
; First 2 bytes: memory address; third byte: bank id
far_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
endm

far_pointer_null: macro
    db $00, $00, $00
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

; Define a pointer to a dialog in a pointers table.
;
; This macro:
; - emits a `dw DialogXXX` word with the pointer,
; - defines a `DialogXXX_IndexOffset` label, to allow looking up the dialog by index.
;
; Usage:
;   dialog_pointer Dialog123
dialog_pointer: macro
\1_IdxOffset:
    dw \1
endm

; Open a dialog in the correct dialogs table (using a `call` instruction)
; Usage:
;   call_open_dialog Dialog123 ; emits "ld a, $23 \n call OpenDialogInTable1"
call_open_dialog: macro
    ld   a, LOW((\1_IdxOffset - DialogPointerTable) / 2)
    ; Ihe code needs to call the correct function, but the exact dialog index isn't available at compile-time
    ; (only at link-time), so we can't use IF().
    ; Instead multiply the functions by a boolean, that resolves either to 0 or 1 at link-time.
    call (OpenDialogInTable0 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 0)) \
       | (OpenDialogInTable1 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 1)) \
       | (OpenDialogInTable2 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 2))
endm

; Open a dialog in the correct dialogs table (using a `jp` instruction)
; Usage:
;   jp_open_dialog Dialog123 ; emits "ld a, $23 \n jp OpenDialogInTable1"
jp_open_dialog: macro
    ld   a, LOW((\1_IdxOffset - DialogPointerTable) / 2)
    jp  (OpenDialogInTable0 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 0)) \
      | (OpenDialogInTable1 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 1)) \
      | (OpenDialogInTable2 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 2))
endm
