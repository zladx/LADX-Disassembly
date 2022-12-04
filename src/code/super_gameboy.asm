;
; Super Game Boy code
;

; During initialization, detect the Super Game Boy
; and upload the colored frame data if needed.
SuperGameBoyInit::
    ; If running on GBC, return immediately
    ldh  a, [hIsGBC]                              ; $6A22: $F0 $FE
    and  a                                        ; $6A24: $A7
    ret  nz                                       ; $6A25: $C0

    ; Wait for 30 frames
    ld   bc, $1E                                  ; $6A26: $01 $1E $00
    call WaitForBCFrames                          ; $6A29: $CD $92 $6B

    ld   hl, SGBRequestTwoPlayersCmd              ; $6A2C: $21 $12 $6A
    call SendUploadCommand                        ; $6A2F: $CD $51 $6B
    call WaitFor3Frames                           ; $6A32: $CD $86 $6B

    ; Try to detect the Super GameBoy by reading from the joypad
    ld   a, [rP1]                                 ; $6A35: $F0 $00
    and  J_RIGHT | J_LEFT                         ; $6A37: $E6 $03
    cp   J_RIGHT | J_LEFT                         ; $6A39: $FE $03
    jr   nz, .superGameBoyDetected                ; $6A3B: $20 $39
    ld   a, J_B                                   ; $6A3D: $3E $20
    ld   [rP1], a                                 ; $6A3F: $E0 $00
    ld   a, [rP1]                                 ; $6A41: $F0 $00
    ld   a, [rP1]                                 ; $6A43: $F0 $00
    ld   a, J_A | J_B                             ; $6A45: $3E $30
    ld   [rP1], a                                 ; $6A47: $E0 $00
    ld   a, J_A                                   ; $6A49: $3E $10
    ld   [rP1], a                                 ; $6A4B: $E0 $00
    ld   a, [rP1]                                 ; $6A4D: $F0 $00
    ld   a, [rP1]                                 ; $6A4F: $F0 $00
    ld   a, [rP1]                                 ; $6A51: $F0 $00
    ld   a, [rP1]                                 ; $6A53: $F0 $00
    ld   a, [rP1]                                 ; $6A55: $F0 $00
    ld   a, [rP1]                                 ; $6A57: $F0 $00
    ld   a, J_A | J_B                             ; $6A59: $3E $30
    ld   [rP1], a                                 ; $6A5B: $E0 $00
    ld   a, [rP1]                                 ; $6A5D: $F0 $00
    ld   a, [rP1]                                 ; $6A5F: $F0 $00
    ld   a, [rP1]                                 ; $6A61: $F0 $00
    ld   a, [rP1]                                 ; $6A63: $F0 $00
    and  J_RIGHT | J_LEFT                         ; $6A65: $E6 $03
    cp   J_RIGHT | J_LEFT                         ; $6A67: $FE $03
    jr   nz, .superGameBoyDetected                ; $6A69: $20 $0B

    ; No valid Super GameBoy detected.
    ; Reset the multiplayer configuration (just in case) and return.
    ld   hl, SGBRequestOnePlayerCmd               ; $6A6B: $21 $02 $6A
    call SendUploadCommand                        ; $6A6E: $CD $51 $6B
    call WaitFor3Frames                           ; $6A71: $CD $86 $6B
    sub  a                                        ; $6A74: $97
    ret                                           ; $6A75: $C9

.superGameBoyDetected
    ; Now that the detection is over, return to single-player mode.
    ld   hl, SGBRequestOnePlayerCmd               ; $6A76: $21 $02 $6A
    call SendUploadCommand                        ; $6A79: $CD $51 $6B
    call WaitFor3Frames                           ; $6A7C: $CD $86 $6B

    ; Make the displayed screen black,
    ; while we are messing with VRAM for data transfers.
    ld   hl, SGBSetScreenMaskBlackCmd             ; $6A7F: $21 $60 $68
    call SendUploadCommand                        ; $6A82: $CD $51 $6B
    ld   bc, $06                                  ; $6A85: $01 $06 $00
    call WaitForBCFrames                          ; $6A88: $CD $92 $6B

    ; Give priority to the ROM-defined Color Palette
    ; (instead of the player-defined palette)
    ld   hl, SGBForceApplicationPaletteCmd        ; $6A8B: $21 $60 $69
    call SendUploadCommand                        ; $6A8E: $CD $51 $6B
    ld   bc, $06                                  ; $6A91: $01 $06 $00
    call WaitForBCFrames                          ; $6A94: $CD $92 $6B

    ;
    ; Most Super GameBoy enhanced games send the following sequence of DATA_SND commands at startup.
    ; It appears to be part of the SGB devkit.
    ;
    ; These commands patch the SGB itself with SNES machine-code.
    ; See:
    ;  - https://tcrf.net/Notes:Super_Game_Boy#DATA_SND
    ;  - https://forums.nesdev.com/viewtopic.php?f=12&t=16610#p206526
    ;

    ld   hl, SGBPatch1Cmd                         ; $6A97: $21 $80 $68
    call SendUploadCommand                        ; $6A9A: $CD $51 $6B
    ld   bc, $06                                  ; $6A9D: $01 $06 $00
    call WaitForBCFrames                          ; $6AA0: $CD $92 $6B

    ld   hl, SGBPatch2Cmd                         ; $6AA3: $21 $90 $68
    call SendUploadCommand                        ; $6AA6: $CD $51 $6B
    ld   bc, $06                                  ; $6AA9: $01 $06 $00
    call WaitForBCFrames                          ; $6AAC: $CD $92 $6B

    ld   hl, SGBPatch3Cmd                         ; $6AAF: $21 $A0 $68
    call SendUploadCommand                        ; $6AB2: $CD $51 $6B
    ld   bc, $06                                  ; $6AB5: $01 $06 $00
    call WaitForBCFrames                          ; $6AB8: $CD $92 $6B

    ld   hl, SGBPatch4Cmd                         ; $6ABB: $21 $B0 $68
    call SendUploadCommand                        ; $6ABE: $CD $51 $6B
    ld   bc, $06                                  ; $6AC1: $01 $06 $00
    call WaitForBCFrames                          ; $6AC4: $CD $92 $6B

    ld   hl, SGBPatch5Cmd                         ; $6AC7: $21 $C0 $68
    call SendUploadCommand                        ; $6ACA: $CD $51 $6B
    ld   bc, $06                                  ; $6ACD: $01 $06 $00
    call WaitForBCFrames                          ; $6AD0: $CD $92 $6B

    ld   hl, SGBPatch6Cmd                         ; $6AD3: $21 $D0 $68
    call SendUploadCommand                        ; $6AD6: $CD $51 $6B
    ld   bc, $06                                  ; $6AD9: $01 $06 $00
    call WaitForBCFrames                          ; $6ADC: $CD $92 $6B

    ld   hl, SGBPatch7Cmd                         ; $6ADF: $21 $E0 $68
    call SendUploadCommand                        ; $6AE2: $CD $51 $6B
    ld   bc, $06                                  ; $6AE5: $01 $06 $00
    call WaitForBCFrames                          ; $6AE8: $CD $92 $6B

    ld   hl, SGBPatch8Cmd                         ; $6AEB: $21 $F0 $68
    call SendUploadCommand                        ; $6AEE: $CD $51 $6B
    ld   bc, $06                                  ; $6AF1: $01 $06 $00
    call WaitForBCFrames                          ; $6AF4: $CD $92 $6B

    ; Upload the standard palette used by the game
    ld   hl, SGBSetPal01Cmd                       ; $6AF7: $21 $00 $69
    call SendUploadCommand                        ; $6AFA: $CD $51 $6B
    ld   bc, $06                                  ; $6AFD: $01 $06 $00
    call WaitForBCFrames                          ; $6B00: $CD $92 $6B

    ld   hl, SGBSetLinesPalettesCmd               ; $6B03: $21 $10 $69
    call SendUploadCommand                        ; $6B06: $CD $51 $6B
    ld   bc, $06                                  ; $6B09: $01 $06 $00
    call WaitForBCFrames                          ; $6B0C: $CD $92 $6B

    ; Upload the first part of the frame tiles data
    ld   hl, SGBFrameTilesA                       ; $6B0F: $21 $00 $40
    ld   de, SGBTransfertToTiles0Cmd              ; $6B12: $11 $30 $69
    call SendVRAMCommand                          ; $6B15: $CD $A3 $6B

    ; Upload the second part of the frame tiles data
    ld   hl, SGBFrameTilesB                       ; $6B18: $21 $00 $50
    ld   de, SGBTransfertToTiles1Cmd              ; $6B1B: $11 $40 $69
    call SendVRAMCommand                          ; $6B1E: $CD $A3 $6B

    ; Upload frame tilemap and palettes
    ld   hl, SGBFrameTilemap                      ; $6B21: $21 $00 $60
    ld   de, SGBTransfertBorderCmd                ; $6B24: $11 $50 $69
    call SendVRAMCommand                          ; $6B27: $CD $A3 $6B

    ld   hl, vTiles0                              ; $6B2A: $21 $00 $80
    ld   bc, $2000                                ; $6B2D: $01 $00 $20
.loop_6B30_3C
    xor  a                                        ; $6B30: $AF
    ldi  [hl], a                                  ; $6B31: $22
    dec  bc                                       ; $6B32: $0B
    ld   a, c                                     ; $6B33: $79
    or   b                                        ; $6B34: $B0
    jr   nz, .loop_6B30_3C                        ; $6B35: $20 $F9

    ld   a, LCDCF_ON | LCDCF_BGON                 ; $6B37: $3E $81
    ld   [rLCDC], a                               ; $6B39: $E0 $40
    ld   bc, $06                                  ; $6B3B: $01 $06 $00
    call WaitForBCFrames                          ; $6B3E: $CD $92 $6B

    ; Make the SGB display active again
    ld   hl, SGBCancelMaskCmd                     ; $6B41: $21 $70 $68
    call SendUploadCommand                        ; $6B44: $CD $51 $6B
    ld   bc, $06                                  ; $6B47: $01 $06 $00
    call WaitForBCFrames                          ; $6B4A: $CD $92 $6B

    ; Disable all LCD Control flags
    xor  a                                        ; $6B4D: $AF
    ld   [rLCDC], a                               ; $6B4E: $E0 $40
    ret                                           ; $6B50: $C9

SendUploadCommand::
    ld   a, [hl]                                  ; $6B51: $7E
    and  %00000111                                ; $6B52: $E6 $07
    ret  z                                        ; $6B54: $C8
    ld   b, a                                     ; $6B55: $47
    ld   c, $00                                   ; $6B56: $0E $00
.func_03C_6B58::
    push bc                                       ; $6B58: $C5
    xor  a                                        ; $6B59: $AF
    ld   [$ff00+c], a                             ; $6B5A: $E2
    ld   a, $30                                   ; $6B5B: $3E $30
    ld   [$ff00+c], a                             ; $6B5D: $E2
    ld   b, $10                                   ; $6B5E: $06 $10
.loop_6B60_3C
    ld   e, $08                                   ; $6B60: $1E $08
    ldi  a, [hl]                                  ; $6B62: $2A
    ld   d, a                                     ; $6B63: $57
.loop_6B64_3C
    bit  0, d                                     ; $6B64: $CB $42
    ld   a, $10                                   ; $6B66: $3E $10
    jr   nz, .else_6B6C_3C                        ; $6B68: $20 $02
    ld   a, $20                                   ; $6B6A: $3E $20
.else_6B6C_3C:
    ld   [$ff00+c], a                             ; $6B6C: $E2
    ld   a, $30                                   ; $6B6D: $3E $30
    ld   [$ff00+c], a                             ; $6B6F: $E2
    rr   d                                        ; $6B70: $CB $1A
    dec  e                                        ; $6B72: $1D
    jr   nz, .loop_6B64_3C                        ; $6B73: $20 $EF
    dec  b                                        ; $6B75: $05
    jr   nz, .loop_6B60_3C                        ; $6B76: $20 $E8
    ld   a, $20                                   ; $6B78: $3E $20
    ld   [$ff00+c], a                             ; $6B7A: $E2
    ld   a, $30                                   ; $6B7B: $3E $30
    ld   [$ff00+c], a                             ; $6B7D: $E2
    pop  bc                                       ; $6B7E: $C1
    dec  b                                        ; $6B7F: $05
    ret  z                                        ; $6B80: $C8
    call WaitFor3Frames                           ; $6B81: $CD $86 $6B
    jr   .func_03C_6B58                           ; $6B84: $18 $D2

WaitFor3Frames::
    ld   de, $1B58                                ; $6B86: $11 $58 $1B
.loop_6B89_3C
    nop                                           ; $6B89: $00
    nop                                           ; $6B8A: $00
    nop                                           ; $6B8B: $00
    dec  de                                       ; $6B8C: $1B
    ld   a, d                                     ; $6B8D: $7A
    or   e                                        ; $6B8E: $B3
    jr   nz, .loop_6B89_3C                        ; $6B8F: $20 $F8
    ret                                           ; $6B91: $C9

; Busy-loop the duration required for the number of
; frames in BC.
;
; Inputs:
;  - bc:   the number of frames to wait for
WaitForBCFrames::
    ; Inner loop: wait for one frame.
    ;
    ; As the LCD screen is off, we can't use VBlank for timing.
    ; Instead, as we know the number of cycles per frame is 69905,
    ; let's way for approximately this number of cycles.

    ld   de, $6D6                                 ; $6B92: $11 $D6 $06
    ; Loop while (de-- != 0)
.whileDE
    ; (the instructions in this loop take 36 clock cycles)
    nop                                           ; $6B95: $00
    nop                                           ; $6B96: $00
    nop                                           ; $6B97: $00
    dec  de                                       ; $6B98: $1B
    ld   a, d                                     ; $6B99: $7A
    or   e                                        ; $6B9A: $B3
    jr   nz, .whileDE                             ; $6B9B: $20 $F8

    ; Repeat the inner loop while the number of frames is > 0
    dec  bc                                       ; $6B9D: $0B
    ld   a, b                                     ; $6B9E: $78
    or   c                                        ; $6B9F: $B1
    jr   nz, WaitForBCFrames                      ; $6BA0: $20 $F0
    ret                                           ; $6BA2: $C9

; Copy some data to VRAM, then send an SGB command to transfer
; the VRAM content to the SGB memory.
; Inputs:
;   hl   data origin address
;   de   addess of the SGB command to send
SendVRAMCommand::
    push de                                       ; $6BA3: $D5
    ld   a, $E4                                   ; $6BA4: $3E $E4
    ld   [rBGP], a                                ; $6BA6: $E0 $47
    ld   de, $8800                                ; $6BA8: $11 $00 $88
    ld   bc, $1000                                ; $6BAB: $01 $00 $10
    call CopyData                                 ; $6BAE: $CD $14 $29
    ld   hl, vBGMap0                              ; $6BB1: $21 $00 $98
    ld   de, $0C                                  ; $6BB4: $11 $0C $00
    ld   a, $80                                   ; $6BB7: $3E $80
    ld   c, $0D                                   ; $6BB9: $0E $0D
.loop_6BBB_3C
    ld   b, $14                                   ; $6BBB: $06 $14
.loop_6BBD_3C
    ldi  [hl], a                                  ; $6BBD: $22
    inc  a                                        ; $6BBE: $3C
    dec  b                                        ; $6BBF: $05
    jr   nz, .loop_6BBD_3C                        ; $6BC0: $20 $FB
    add  hl, de                                   ; $6BC2: $19
    dec  c                                        ; $6BC3: $0D
    jr   nz, .loop_6BBB_3C                        ; $6BC4: $20 $F5
    ld   a, LCDCF_ON | LCDCF_BGON                 ; $6BC6: $3E $81
    ld   [rLCDC], a                               ; $6BC8: $E0 $40
    ld   bc, $05                                  ; $6BCA: $01 $05 $00
    call WaitForBCFrames                          ; $6BCD: $CD $92 $6B
    pop  hl                                       ; $6BD0: $E1
    call SendUploadCommand                        ; $6BD1: $CD $51 $6B
    ld   bc, $06                                  ; $6BD4: $01 $06 $00
    call WaitForBCFrames                          ; $6BD7: $CD $92 $6B
    xor  a                                        ; $6BDA: $AF
    ld   [rLCDC], a                               ; $6BDB: $E0 $40
    ret                                           ; $6BDD: $C9
