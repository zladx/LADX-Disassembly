; Constants used for displaying dialog boxes

; Dialog states, used as values for wDialogState
def DIALOG_CLOSED              equ $00
def DIALOG_OPENING_1           equ $01
def DIALOG_OPENING_2           equ $02
def DIALOG_OPENING_3           equ $03
def DIALOG_OPENING_4           equ $04
def DIALOG_OPENING_5           equ $05
def DIALOG_LETTER_IN_1         equ $06
def DIALOG_LETTER_IN_2         equ $07
def DIALOG_LETTER_IN_3         equ $08
def DIALOG_BREAK               equ $09 ; press A to continue
def DIALOG_SCROLLING_1         equ $0A
def DIALOG_SCROLLING_2         equ $0B
def DIALOG_END                 equ $0C ; press A to close
def DIALOG_CHOICE              equ $0D ; press A to choose
def DIALOG_CLOSING_1           equ $0E
def DIALOG_CLOSING_2           equ $0F

; Bit 7 of wDialogState is a flag denoting whether the dialog box
; should be displayed at the bottom of the screen instead of the top
; (this flag is combined with one of the above states)
def DIALOG_BOX_BOTTOM_FLAG     equ $80
def DIALOG_BOX_BOTTOM_BIT      equ 7

; Tiles used as the dialog background color
def DIALOG_BG_TILE_DARK        equ $7E
def DIALOG_BG_TILE_LIGHT       equ $7F

; Tiles used for diacritics above regular characters
; Note that the order of the tiles in the tilemap are reversed from
; the diacritic number, which is used in the CodepointToDiacritic table
def DIALOG_DIACRITIC_1         equ $C9
def DIALOG_DIACRITIC_2         equ $C8

; Values for wDialogGotItem
def DIALOG_GOT_PIECE_OF_POWER equ $01
def DIALOG_GOT_TOADSTOOL      equ $02
def DIALOG_GOT_MAGIC_POWDER   equ $03
def DIALOG_GOT_ROD            equ $04
def DIALOG_GOT_GUARDIAN_ACORN equ $05

; Cooldown time for dialog boxes
def DIALOG_COOLDOWN              equ $18

; Flag for denoting a dialog as unskippable,
; set as the high bit of the dialog bank
; (see dialog_banks.asm)
def DIALOG_UNSKIPPABLE equ $80

; Dialog box position and size
def DIALOG_BOX_HEIGHT       equ $28
def DIALOG_BOX_TOP_Y        equ $08
def DIALOG_BOX_BOTTOM_Y     equ $60