
; GBC palette entry
; usage:
;    rgb   #F8F888, #000000, #10A840, #F8B888
; outputs:
;    db   $FF, $47, $00, $00, $A2, $22, $FF, $46
macro rgb
    REPT _NARG
      REDEF eval EQUS STRRPL("\1", "#", "$")
      REDEF arg EQU {eval}
      REDEF red EQU ((arg & $FF0000) >> 16) / 8
      REDEF grn EQU ((arg & $00FF00) >>  8) / 8
      REDEF blu EQU ((arg & $0000FF) >>  0) / 8
      dw (red) + (grn) << 5 + (blu) << 10
      SHIFT 1
    ENDR
endm

; Farcall using direct bank selection
macro callsb
    ld   a, BANK(\1)
    ld   [rSelectROMBank], a
    call \1
endm

; Farcall using direct bank selection with hl
macro callhl
    ld   hl, rSelectROMBank
    ld   [hl], BANK(\1)
    call \1
endm

; Farcall using SwitchBank
macro callsw
    ld   a, BANK(\1)
    call SwitchBank
    call \1
endm

; Jump using SwitchBank
macro jpsb
    ld   a, BANK(\1)
    ld   [rSelectROMBank], a
    jp   \1
endm

; Jump using SwitchBank
macro jpsw
    ld   a, BANK(\1)
    call SwitchBank
    jp   \1
endm

; The games uses code stored at $0000 to go to the jump table handler,
; which means reseting the PC to 0 activates the jump table.
;
; See the JumpTable function for details and usage.
macro JP_TABLE
    rst 0
endm

; Store an address and the associated bank.
; First 2 bytes: memory address; third byte: bank id
macro far_pointer
    db LOW(\1), HIGH(\1), BANK(\1)
endm

macro far_pointer_null
    db $00, $00, $00
endm

; Define an entity in an entities list
; Usage:
;   entity <vertical-position>, <horizontal-position>, <type>
macro entity
    db   \1 * $10 + \2, \3
endm

macro entities_end
    db   ENTITIES_END
endm

; Define a pointer to a dialog in a pointers table.
;
; This macro:
; - emits a `dw DialogXXX` word with the pointer,
; - defines a `DialogXXX_IndexOffset` label, to allow looking up the dialog by index.
;
; Usage:
;   dialog_pointer Dialog123 ; Emits: "Dialog123_IdxOffset: dw Dialog123"
macro dialog_pointer
\1_IdxOffset:
    dw \1
endm

; Load the low part of a dialog index into the given register.
; Usage:
;   ld_dialog_low a, Dialog123 ; Emits "ld a, $23"
;
; NB: if rgbasm ever supports user-defined functions, then we'll replace this by:
;   ld a, DIALOG_ID_LOW(Dialog123)
macro ld_dialog_low
  ld \1, LOW((\2_IdxOffset - DialogPointerTable) / 2)
endm

; Store the low part of a dialog index as a db instruction.
; Usage:
;   db_dialog_low Dialog123 ; Emits "db $23"
;
; NB: if rgbasm ever supports user-defined functions, then we'll replace this by:
;   db DIALOG_ID_LOW(Dialog123)
macro db_dialog_low
  db LOW((\1_IdxOffset - DialogPointerTable) / 2)
endm

; Compare the low part of a dialog index.
; Usage:
;   cp_dialog_low Dialog123 ; Emits "cp $23"
;
; NB: if rgbasm ever supports user-defined functions, then we'll replace this by:
;   cp DIALOG_ID_LOW(Dialog123)
macro cp_dialog_low
  cp LOW((\1_IdxOffset - DialogPointerTable) / 2)
endm

; Open a dialog in the correct dialogs table (using a `call` instruction)
; Usage:
;   call_open_dialog Dialog123 ; Emits "ld a, $23 \n call OpenDialogInTable1"
macro call_open_dialog
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
macro jp_open_dialog
    ld   a, LOW((\1_IdxOffset - DialogPointerTable) / 2)
    jp  (OpenDialogInTable0 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 0)) \
      | (OpenDialogInTable1 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 1)) \
      | (OpenDialogInTable2 * (HIGH((\1_IdxOffset - DialogPointerTable) / 2) == 2))
endm


def DIALOG_LINE_LEN equ 16

; Main macro for dialog line wrapping. See dialog_text or dialog_ask_line for usage.
MACRO dialog_string_wrapping
    : ; Since each line pads for the previous one, pretend there is an empty line so the first line doesn't emit any padding.

    REPT _NARG
        def paragraph equs \1
        shift ; Process the next argument on the next iteration.

        REPT strlen(#paragraph) ; Not the real iteration count, but we need an upper bound since there is no `WHILE`.
            ; Pad from the last line's end.
            ds (DIALOG_LINE_LEN - (@ - :-)) % DIALOG_LINE_LEN, ' '
            : ; Mark the beginning of this line for the next one.

            redef line equs ""
            redef unit equs ""
            IF charlen(#paragraph) <= DIALOG_LINE_LEN ; If we are guaranteed to finish the line...
                db #paragraph ; ...then emit whatever's left...
                BREAK ; ...and stop!
            ENDC

            ; Otherwise, build up the line from charmap units.
            FOR i, DIALOG_LINE_LEN
                redef unit equs strchar(#paragraph, i)
                assert charsize(#unit) == 1, "'{unit}' maps to more than one byte!!"

                IF #unit === " "
                    def line_len = strlen(#line) ; It is possible to break *before* this char.
                    def cut_at = line_len + 1 ; ...but then the next line begins *after* it!
                ELIF #unit === "-"
                    def line_len = strlen(#line) + 1 ; It is possible to break *after* hyphens.
                    def cut_at = line_len ; ...and they thus don't get ignored.
                ENDC

                redef line equs #line ++ #unit ; Append the unit.
            ENDR
            IF strchar(#paragraph, DIALOG_LINE_LEN) === " " ; Check if the *next* char is a space!
                def line_len = strlen(#line)
                def cut_at = line_len + 1 ; The space isn't going to be included in the line, so that's okay.
            ENDC
            assert def(line_len), "Line too long! (No breakable char found in \"{line}\")"

            db strslice(#line, 0, line_len) ; Emit the wrapped line...
            redef paragraph equs strslice(#paragraph, cut_at)
            purge line_len, cut_at ; So they aren't left over for the next iteration.
        ENDR

        purge paragraph, line, unit ; Delete temporaries.
    ENDR
ENDM

; Use this macro to auto line basic wrap dialog lines.
; You can supply multiple strings to implement manual line breaks.
; Example:
;   dialog_text "Welcome #####, stay a while and listen."
;   dialog_text ".", "..", "...", "Why are you here?"
MACRO dialog_text
    dialog_string_wrapping \#
    db "@"
ENDM

; Use this macro to end off a dialog with a question.
; Should be used in combination with dialog_string_wrapping
; Takes 2 arguments, for the first and second option
; Example:
;   dialog_string_wrapping "Do you want to buy the deluxe shovel?"
;   dialog_ask_line "Yes", "Nah."
MACRO dialog_ask_line
    assert charlen(\1) <= 4, "First ask choice too long"
    assert charlen(\2) <= 7, "Second ask choice too long"
    ds (DIALOG_LINE_LEN - (@ - :-)) % DIALOG_LINE_LEN, ' '
    ds 4, ' ' ; Padding till the first choice
    db \1     ; First choice
    ds 5 - charlen(\1), ' '
    db \2     ; Second choice
    db "<ask>"
ENDM
