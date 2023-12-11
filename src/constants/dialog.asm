; Constants used for displaying dialog boxes

; Dialog states, used as values for wDialogState
DEF DIALOG_CLOSED              EQU $00
DEF DIALOG_OPENING_1           EQU $01
DEF DIALOG_OPENING_2           EQU $02
DEF DIALOG_OPENING_3           EQU $03
DEF DIALOG_OPENING_4           EQU $04
DEF DIALOG_OPENING_5           EQU $05
DEF DIALOG_LETTER_IN_1         EQU $06
DEF DIALOG_LETTER_IN_2         EQU $07
DEF DIALOG_LETTER_IN_3         EQU $08
DEF DIALOG_BREAK               EQU $09 ; press A to continue
DEF DIALOG_SCROLLING_1         EQU $0A
DEF DIALOG_SCROLLING_2         EQU $0B
DEF DIALOG_END                 EQU $0C ; press A to close
DEF DIALOG_CHOICE              EQU $0D ; press A to choose
DEF DIALOG_CLOSING_1           EQU $0E
DEF DIALOG_CLOSING_2           EQU $0F

; Bit 7 of wDialogState is a flag denoting whether the dialog box
; should be displayed at the bottom of the screen instead of the top
; (this flag is combined with one of the above states)
DEF DIALOG_BOX_BOTTOM_FLAG     EQU $80
DEF DIALOG_BOX_BOTTOM_BIT      EQU 7

; Tiles used as the dialog background color
DEF DIALOG_BG_TILE_DARK        EQU $7E
DEF DIALOG_BG_TILE_LIGHT       EQU $7F

; Tiles used for diacritics above regular characters
; Note that the order of the tiles in the tilemap are reversed from
; the diacritic number, which is used in the CodepointToDiacritic table
DEF DIALOG_DIACRITIC_1         EQU $C9
DEF DIALOG_DIACRITIC_2         EQU $C8

; Values for wDialogGotItem
DEF DIALOG_GOT_PIECE_OF_POWER EQU $01
DEF DIALOG_GOT_TOADSTOOL      EQU $02
DEF DIALOG_GOT_MAGIC_POWDER   EQU $03
DEF DIALOG_GOT_ROD            EQU $04
DEF DIALOG_GOT_GUARDIAN_ACORN EQU $05

; Cooldown time for dialog boxes
DEF DIALOG_COOLDOWN              EQU $18

; Flag for denoting a dialog as unskippable,
; set as the high bit of the dialog bank
; (see dialog_banks.asm)
DEF DIALOG_UNSKIPPABLE EQU $80

; Dialog box position and size
DEF DIALOG_BOX_HEIGHT       EQU $28
DEF DIALOG_BOX_TOP_Y        EQU $08
DEF DIALOG_BOX_BOTTOM_Y     EQU $60