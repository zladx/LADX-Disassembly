; Constants used for displaying dialog boxes

; Dialog states, used as values for wDialogState
DIALOG_CLOSED              equ $00
DIALOG_OPENING_1           equ $01
DIALOG_OPENING_2           equ $02
DIALOG_OPENING_3           equ $03
DIALOG_OPENING_4           equ $04
DIALOG_OPENING_5           equ $05
DIALOG_LETTER_IN_1         equ $06
DIALOG_LETTER_IN_2         equ $07
DIALOG_LETTER_IN_3         equ $08
DIALOG_BREAK               equ $09 ; press A to continue
DIALOG_SCROLLING_1         equ $0A
DIALOG_SCROLLING_2         equ $0B
DIALOG_END                 equ $0C ; press A to close
DIALOG_CHOICE              equ $0D ; press A to choose
DIALOG_CLOSING_1           equ $0E
DIALOG_CLOSING_2           equ $0F

; Bit 7 of wDialogState is a flag denoting whether the dialog box
; should be displayed at the bottom of the screen instead of the top
; (this flag is combined with one of the above states)
DIALOG_BOX_BOTTOM_FLAG     equ $80
DIALOG_BOX_BOTTOM_BIT      equ 7

; Tiles used as the dialog background color
DIALOG_BG_TILE_DARK        equ $7E
DIALOG_BG_TILE_LIGHT       equ $7F

; Tiles used for diacritics above regular characters
; Note that the order of the tiles in the tilemap are reversed from
; the diacritic number, which is used in the CodepointToDiacritic table
DIALOG_DIACRITIC_1         equ $C9
DIALOG_DIACRITIC_2         equ $C8

; Values for wDialogGotItem
DIALOG_GOT_PIECE_OF_POWER equ $01
DIALOG_GOT_TOADSTOOL      equ $02
DIALOG_GOT_MAGIC_POWDER   equ $03
DIALOG_GOT_ROD            equ $04
DIALOG_GOT_GUARDIAN_ACORN equ $05

; Cooldown time for dialog boxes
DIALOG_COOLDOWN              equ $18

; Flag for denoting a dialog as unskippable,
; set as the high bit of the dialog bank
; (see dialog_banks.asm)
DIALOG_UNSKIPPABLE equ $80

; Dialog box position and size
DIALOG_BOX_HEIGHT       equ $28
DIALOG_BOX_TOP_Y        equ $08
DIALOG_BOX_BOTTOM_Y     equ $60