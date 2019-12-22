; Super GameBoy background image: tilemap and palettes

; 1: Command code
; 2: Number of packets
sgb_cmd: macro
    db   (\2) + (\1) << 3
endm

PAL01    equ $00 ; Set SGB Palette 0,1 Data
ATTR_LIN equ $05 ; "Line" Area Designation Mode
ICON_EN  equ $0E ; SGB Function

; Requests multiplayer mode.
MLT_REQ: macro
    sgb_cmd $11 , 1
    db   \1
    ds   14
endm

; Transfer Character Font Data
; arg0: 0: Data for characters 0x00 – 0x7F
;       1: Data for characters 0x80 – 0xFF
CHR_TRN: macro
    sgb_cmd $13, 1
    db   \1
    ds   14
endm

; Set Screen Data Color Data
PCT_TRN: macro
    sgb_cmd $14, 1
    ds   15
endm

; Game Boy Window Mask
; 0 ; Cancels masking
; $02 ; Masks by setting all SGB color palette color codes to black.
MASK_EN: macro
    sgb_cmd $17, 1
    db   \1
    ds   14
endm

; Specifies the priority of the color palette for the application and the color palette selected by the player.
; 0 -> Priority to Player-Selected Color Palette (default)
; 1 -> Priority to Application Color Palette
PAL_PRI: macro
    sgb_cmd $19, 1
    db   \1
    ds   14
endm

MaskEnBlack:
    MASK_EN 2

MaskEnCancel:
    MASK_EN 0

INIT1:
    db   $79, $5D, $08, $00, $0B, $8C, $D0, $F4  ; $6880 |y]......|
    db   $60, $00, $00, $00, $00, $00, $00, $00  ; $6888 |`.......|

INIT2:
    db   $79, $52, $08, $00, $0B, $A9, $E7, $9F  ; $6890 |yR......|
    db   $01, $C0, $7E, $E8, $E8, $E8, $E8, $E0  ; $6898 |..~.....|

INIT3:
    db   $79, $47, $08, $00, $0B, $C4, $D0, $16  ; $68A0 |yG......|
    db   $A5, $CB, $C9, $05, $D0, $10, $A2, $28  ; $68A8 |.......(|

INIT4:
    db   $79, $3C, $08, $00, $0B, $F0, $12, $A5  ; $68B0 |y<......|
    db   $C9, $C9, $C8, $D0, $1C, $A5, $CA, $C9  ; $68B8 |........|

INIT5:
    db   $79, $31, $08, $00, $0B, $0C, $A5, $CA  ; $68C0 |y1......|
    db   $C9, $7E, $D0, $06, $A5, $CB, $C9, $7E  ; $68C8 |.~.....~|

INIT6:
    db   $79, $26, $08, $00, $0B, $39, $CD, $48  ; $68D0 |y&...9.H|
    db   $0C, $D0, $34, $A5, $C9, $C9, $80, $D0  ; $68D8 |..4.....|

INIT7:
    db   $79, $1B, $08, $00, $0B, $EA, $EA, $EA  ; $68E0 |y.......|
    db   $EA, $EA, $A9, $01, $CD, $4F, $0C, $D0  ; $68E8 |.....O..|

INIT8:
    db   $79, $10, $08, $00, $0B, $4C, $20, $08  ; $68F0 |y....L .|
    db   $EA, $EA, $EA, $EA, $EA, $60, $EA, $EA  ; $68F8 |.....`..|

SetGamePalette:
    sgb_cmd PAL01, 1
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

SetLinePal:
    ; result of this command is invisble, due to the PAL0 and PAL1 being the same
    ; parameters seem to come from the Game Boy Programming Manual
    sgb_cmd ATTR_LIN, 1
    db   $02 ; Number of data groups: 2
    db   (1 << 7) + (1 << 5) + 15 ; horizontal line 15 uses palette 1
    db   (0 << 7) + (0 << 5) + 2 ; vertical line 2 uses palette 0
    ds   12

; unused cmd
    sgb_cmd ICON_EN, 1
    db   (0 << 2) + (1 << 1) + (1 << 0) ; Disable use of SGB-Built-in Color Palettes, Disable Controller Set-up Screen
    ds   14

ChrTrn1:
    CHR_TRN 0

ChrTrn2:
    CHR_TRN 1

PctTrn:
    PCT_TRN

ForceApplicationPalette:
    PAL_PRI 1


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

MltReqOnePlayer:
    MLT_REQ 0

MltReqTwoPlayers:
    MLT_REQ 1
