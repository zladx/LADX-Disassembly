;
; Super GameBoy pre-defined commands
;

; -------------------------------------------------
; Macros
; -------------------------------------------------

; Defines a Super Game Boy command.
; Usage:
;   sgb_cmd <command code>, <length>
sgb_cmd: macro
    db   (\1) << 3 + (\2)
endm

; Defines a Super Game Boy 'Data Send' command.
; Usage:
;   sgb_data_snd <SNES destination address>, <SNES destination bank>, <data length>
sgb_data_send_cmd: macro
    sgb_cmd SGB_DATA_SND, 1
    dw  \1 ; SNES destination address
    db  \2 ; SNES destination bank
    db  \3 ; data length
endm

; -------------------------------------------------
; Commands
; -------------------------------------------------

; Displays a black screen, regardless of the VRAM content.
SGBSetScreenMaskBlackCmd::
    sgb_cmd SGB_MASK_EN, 1
    db   2  ; black-screen mask
    ds   14 ; padding

; Make the Super Game Boy display the GB screen again.
SGBCancelMaskCmd::
    sgb_cmd SGB_MASK_EN, 1
    db   0  ; cancel mask
    ds   14 ; padding

; Commands for patching the SGB code itself,
; by transferring SNES code to the RAM.
;
; It appears to fix a bug in the SGB code
; (see https://forums.nesdev.com/viewtopic.php?f=12&t=16610#p206526)
SGBPatch1Cmd::
    sgb_data_send_cmd $085d, $0, 11
    db  $8C                 ; cpx #$8c (2)
    db  $D0, $F4            ; bne -$0c
    db  $60                 ; rts
    ds  7

SGBPatch2Cmd::
    sgb_data_send_cmd $0852, $0, 11
    db  $A9, $E7            ; lda #$e7
    db  $9F, $01, $C0, $7E  ; sta $7ec001, x
    db  $E8                 ; inx
    db  $E8                 ; inx
    db  $E8                 ; inx
    db  $E8                 ; inx
    db  $E0                 ; cpx #$8c (1)

SGBPatch3Cmd::
    sgb_data_send_cmd $0847, $0, 11
    db  $C4                 ; cmp #$c4 (2)
    db  $D0, $16            ; bne +$16
    db  $A5                 ; lda dp
    db  $CB                 ; wai
    db  $C9, $05            ; cmp #$05
    db  $D0, $10            ; bne +$10
    db  $A2, $28            ; ldx #$28

SGBPatch4Cmd::
    sgb_data_send_cmd $083c, $0, 11
    db  $F0, $12            ; beq +$12
    db  $A5                 ; lda dp
    db  $C9, $C9            ; cmp #$c9
    db  $C8                 ; iny
    db  $D0, $1C            ; bne +$1c
    db  $A5                 ; lda dp
    db  $CA                 ; dex
    db  $C9                 ; cmp #$c4 (1)

SGBPatch5Cmd::
    sgb_data_send_cmd $0831, $0, 11
    db  $0C, $A5, $CA       ; tsb $caa5
    db  $C9, $7E            ; cmp #$7e
    db  $D0, $06            ; bne +$06
    db  $A5                 ; lda dp
    db  $CB                 ; wai
    db  $C9, $7E            ; cmp #$7e

SGBPatch6Cmd::
    sgb_data_send_cmd $0826, $0, 11
    db  $39                 ; bne +$39 (2)
    db  $CD, $48, $0C       ; cmp $0c48
    db  $D0, $34            ; bne +$34
    db  $A5                 ; lda dp
    db  $C9, $C9            ; cmp #$c9
    db  $80, $D0            ; bra -$30

SGBPatch7Cmd::
    sgb_data_send_cmd $081b, $0, 11
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $A9, $01            ; lda #01
    db  $CD, $4F, $0C       ; cmp $c4f
    db  $D0                 ; bne +$39 (1)

SGBPatch8Cmd::
    sgb_data_send_cmd $0810, $0, 11
    db  $4C, $20, $08       ; jmp $0820
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $EA                 ; nop
    db  $60                 ; rts
    db  $EA                 ; nop
    db  $EA                 ; nop

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
    ds   12 ; padding

; Unused command
    sgb_cmd SGB_ICON_EN, 1
    db   (0 << 2) + (1 << 1) + (1 << 0) ; Disable use of SGB-Built-in Color Palettes, Disable Controller Set-up Screen
    ds   14 ; padding

; Transfer tiles data from VRAM to Tiles area 0
SGBTransfertToTiles0Cmd::
    sgb_cmd SGB_CHR_TRN, 1
    db   0  ; tiles area 0
    ds   14 ; padding

; Transfer tiles data from VRAM to Tiles area 1
SGBTransfertToTiles1Cmd::
    sgb_cmd SGB_CHR_TRN, 1
    db   1  ; tiles area 1
    ds   14 ; padding

; Transfert border tilemap and palettes from VRAM to SGB
SGBTransfertBorderCmd::
    sgb_cmd SGB_PCT_TRN, 1
    ds   15 ; padding

; Specifies the priority of the color palette for the application
; and the color palette selected by the player.
;   0: priority to Player-Selected Color Palette (default)
;   1: priority to Application Color Palette
SGBForceApplicationPaletteCmd::
    sgb_cmd SGB_PAL_PRI, 1
    db   1
    ds   14 ; padding

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
    db   0  ; players count
    ds   14 ; padding

SGBRequestTwoPlayersCmd::
    sgb_cmd SGB_MLT_REQ, 1
    db   1  ; players count
    ds   14 ; padding
