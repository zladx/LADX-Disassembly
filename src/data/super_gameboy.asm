;
; Super GameBoy pre-defined commands
;

; Defines a Super Game Boy command.
; Usage:
;   sgb_cmd <command code>, <length>
sgb_cmd: macro
    db   (\1) << 3 + (\2)
endm

; Displays a black screen, regardless of the VRAM content.
SGBSetScreenMaskBlackCmd::
    sgb_cmd SGB_MASK_EN, 1
    db   2
    ds   14

; Make the Super Game Boy display the GB screen again.
SGBCancelMaskCmd::
    sgb_cmd SGB_MASK_EN, 1
    db   0
    ds   14

INIT1::
    db   $79, $5D, $08, $00, $0B, $8C, $D0, $F4  ; $6880 |y]......|
    db   $60, $00, $00, $00, $00, $00, $00, $00  ; $6888 |`.......|

INIT2::
    db   $79, $52, $08, $00, $0B, $A9, $E7, $9F  ; $6890 |yR......|
    db   $01, $C0, $7E, $E8, $E8, $E8, $E8, $E0  ; $6898 |..~.....|

INIT3::
    db   $79, $47, $08, $00, $0B, $C4, $D0, $16  ; $68A0 |yG......|
    db   $A5, $CB, $C9, $05, $D0, $10, $A2, $28  ; $68A8 |.......(|

INIT4::
    db   $79, $3C, $08, $00, $0B, $F0, $12, $A5  ; $68B0 |y<......|
    db   $C9, $C9, $C8, $D0, $1C, $A5, $CA, $C9  ; $68B8 |........|

INIT5::
    db   $79, $31, $08, $00, $0B, $0C, $A5, $CA  ; $68C0 |y1......|
    db   $C9, $7E, $D0, $06, $A5, $CB, $C9, $7E  ; $68C8 |.~.....~|

INIT6::
    db   $79, $26, $08, $00, $0B, $39, $CD, $48  ; $68D0 |y&...9.H|
    db   $0C, $D0, $34, $A5, $C9, $C9, $80, $D0  ; $68D8 |..4.....|

INIT7::
    db   $79, $1B, $08, $00, $0B, $EA, $EA, $EA  ; $68E0 |y.......|
    db   $EA, $EA, $A9, $01, $CD, $4F, $0C, $D0  ; $68E8 |.....O..|

INIT8::
    db   $79, $10, $08, $00, $0B, $4C, $20, $08  ; $68F0 |y....L .|
    db   $EA, $EA, $EA, $EA, $EA, $60, $EA, $EA  ; $68F8 |.....`..|

SGBSetPal01Cmd::
    sgb_cmd SGB_PAL01, 1
; Palette0
    db   $FF, $5B
    db   $0F, $3F
    db   $2D, $22
    db   $EB, $10
; Palette1
    db   $0F, $3F
    db   $2D, $22
    db   $EB, $10
    db   $00

SGBSetLinesPalettesCmd::
    ; Result of this command is invisible, due to the PAL0 and PAL1 being the same
    ; parameters seem to come from the Game Boy Programming Manual
    sgb_cmd SGB_ATTR_LIN, 1
    db   $02 ; Number of data groups: 2
    db   (1 << 7) + (1 << 5) + 15 ; horizontal line 15 uses palette 1
    db   (0 << 7) + (0 << 5) + 2 ; vertical line 2 uses palette 0
    ds   12

; Unused command
    sgb_cmd SGB_ICON_EN, 1
    db   (0 << 2) + (1 << 1) + (1 << 0) ; Disable use of SGB-Built-in Color Palettes, Disable Controller Set-up Screen
    ds   14

; Transfer tiles data from VRAM to Tiles area 0
SGBTransfertToTiles0Cmd::
    sgb_cmd SGB_CHR_TRN, 1
    db   0
    ds   14 ; padding

; Transfer tiles data from VRAM to Tiles area 1
SGBTransfertToTiles1Cmd::
    sgb_cmd SGB_CHR_TRN, 1
    db   1
    ds   14 ; padding

; Transfert border tilemap and palettes from VRAM to SGB
SGBTransfertBorderCmd::
    sgb_cmd SGB_PCT_TRN, 1
    ds   15

; Specifies the priority of the color palette for the application
; and the color palette selected by the player.
;   0: priority to Player-Selected Color Palette (default)
;   1: priority to Application Color Palette
SGBForceApplicationPaletteCmd::
    sgb_cmd SGB_PAL_PRI, 1
    db   1
    ds   14

; Unknown data
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $6970 |........|
    db   $00, $00, $4F, $FF, $F0, $FF, $F0, $4F  ; $6978 |..O....O|
    db   $FF, $F0, $FF, $F0, $4F, $FF, $FF, $FF  ; $6980 |....O...|
    db   $00, $4F, $FF, $FF, $FF, $00, $4F, $FF  ; $6988 |.O....O.|
    db   $7E, $BF, $F0, $4A, $FF, $7E, $BF, $F0  ; $6990 |~..J.~..|
    db   $4A, $FD, $7F, $FF, $F0, $4F, $FD, $7F  ; $6998 |J....O..|
    db   $FF, $F0, $4F, $FD, $FF, $DF, $F0, $4F  ; $69A0 |..O....O|
    db   $FD, $FF, $DF, $F0, $4F, $FF, $FF, $D5  ; $69A8 |....O...|
    db   $F0, $4F, $FF, $FF, $D5, $F0, $4F, $FF  ; $69B0 |.O....O.|
    db   $FF, $DF, $F0, $4F, $FF, $FF, $DF, $F0  ; $69B8 |...O....|
    db   $55, $55, $55, $55, $55, $00, $00, $00  ; $69C0 |UUUUU...|
    db   $00, $00, $FF, $5B, $0F, $3F, $2D, $22  ; $69C8 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69D0 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69D8 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69E0 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69E8 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69F0 |...[.?-"|
    db   $EB, $10, $FF, $5B, $0F, $3F, $2D, $22  ; $69F8 |...[.?-"|
    db   $EB, $10

SGBRequestOnePlayerCmd::
    sgb_cmd SGB_MLT_REQ, 1
.playersCount
    db   $00
.padding
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

SGBRequestTwoPlayersCmd::
    sgb_cmd SGB_MLT_REQ, 1
.playersCount
    db   $01
.padding
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
