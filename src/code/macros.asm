
; GBC palette entry
; usage: 
;    rgb   #F8F888, #000000, #10A840, #F8B888
; outputs:
;    db   $FF, $47, $00, $00, $A2, $22, $FF, $46
macro rgb
    REPT _NARG
      REDEF eval EQUS STRRPL("\1", "#", "$")
      REDEF arg EQU {eval}
      redef red equ ((arg & $FF0000) >> 16) / 8
      redef grn equ ((arg & $00FF00) >>  8) / 8
      redef blu equ ((arg & $0000FF) >>  0) / 8
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
