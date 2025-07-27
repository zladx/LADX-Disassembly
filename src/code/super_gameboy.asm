;
; Super Game Boy code
;

; During initialization, detect the Super Game Boy
; and upload the colored frame data if needed.
SuperGameBoyInit::
    ; If running on GBC, return immediately
    ldh  a, [hIsGBC]                              ;; 3C:6A22 $F0 $FE
    and  a                                        ;; 3C:6A24 $A7
    ret  nz                                       ;; 3C:6A25 $C0

    ; Wait for 30 frames
    ld   bc, $1E                                  ;; 3C:6A26 $01 $1E $00
    call WaitForBCFrames                          ;; 3C:6A29 $CD $92 $6B

    ld   hl, SGBRequestTwoPlayersCmd              ;; 3C:6A2C $21 $12 $6A
    call SendUploadCommand                        ;; 3C:6A2F $CD $51 $6B
    call WaitFor3Frames                           ;; 3C:6A32 $CD $86 $6B

    ; Try to detect the Super GameBoy by reading from the joypad
    ldh  a, [rP1]                                 ;; 3C:6A35 $F0 $00
    and  J_RIGHT | J_LEFT                         ;; 3C:6A37 $E6 $03
    cp   J_RIGHT | J_LEFT                         ;; 3C:6A39 $FE $03
    jr   nz, .superGameBoyDetected                ;; 3C:6A3B $20 $39
    ld   a, J_B                                   ;; 3C:6A3D $3E $20
    ldh  [rP1], a                                 ;; 3C:6A3F $E0 $00
    ldh  a, [rP1]                                 ;; 3C:6A41 $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A43 $F0 $00
    ld   a, J_A | J_B                             ;; 3C:6A45 $3E $30
    ldh  [rP1], a                                 ;; 3C:6A47 $E0 $00
    ld   a, J_A                                   ;; 3C:6A49 $3E $10
    ldh  [rP1], a                                 ;; 3C:6A4B $E0 $00
    ldh  a, [rP1]                                 ;; 3C:6A4D $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A4F $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A51 $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A53 $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A55 $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A57 $F0 $00
    ld   a, J_A | J_B                             ;; 3C:6A59 $3E $30
    ldh  [rP1], a                                 ;; 3C:6A5B $E0 $00
    ldh  a, [rP1]                                 ;; 3C:6A5D $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A5F $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A61 $F0 $00
    ldh  a, [rP1]                                 ;; 3C:6A63 $F0 $00
    and  J_RIGHT | J_LEFT                         ;; 3C:6A65 $E6 $03
    cp   J_RIGHT | J_LEFT                         ;; 3C:6A67 $FE $03
    jr   nz, .superGameBoyDetected                ;; 3C:6A69 $20 $0B

    ; No valid Super GameBoy detected.
    ; Reset the multiplayer configuration (just in case) and return.
    ld   hl, SGBRequestOnePlayerCmd               ;; 3C:6A6B $21 $02 $6A
    call SendUploadCommand                        ;; 3C:6A6E $CD $51 $6B
    call WaitFor3Frames                           ;; 3C:6A71 $CD $86 $6B
    sub  a                                        ;; 3C:6A74 $97
    ret                                           ;; 3C:6A75 $C9

.superGameBoyDetected
    ; Now that the detection is over, return to single-player mode.
    ld   hl, SGBRequestOnePlayerCmd               ;; 3C:6A76 $21 $02 $6A
    call SendUploadCommand                        ;; 3C:6A79 $CD $51 $6B
    call WaitFor3Frames                           ;; 3C:6A7C $CD $86 $6B

    ; Make the displayed screen black,
    ; while we are messing with VRAM for data transfers.
    ld   hl, SGBSetScreenMaskBlackCmd             ;; 3C:6A7F $21 $60 $68
    call SendUploadCommand                        ;; 3C:6A82 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6A85 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6A88 $CD $92 $6B

    ; Give priority to the ROM-defined Color Palette
    ; (instead of the player-defined palette)
    ld   hl, SGBForceApplicationPaletteCmd        ;; 3C:6A8B $21 $60 $69
    call SendUploadCommand                        ;; 3C:6A8E $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6A91 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6A94 $CD $92 $6B

    ;
    ; Most Super GameBoy enhanced games send the following sequence of DATA_SND commands at startup.
    ; It appears to be part of the SGB devkit.
    ;
    ; These commands patch the SGB itself with SNES machine-code.
    ; See:
    ;  - https://tcrf.net/Notes:Super_Game_Boy#DATA_SND
    ;  - https://forums.nesdev.com/viewtopic.php?f=12&t=16610#p206526
    ;

    ld   hl, SGBPatch1Cmd                         ;; 3C:6A97 $21 $80 $68
    call SendUploadCommand                        ;; 3C:6A9A $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6A9D $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AA0 $CD $92 $6B

    ld   hl, SGBPatch2Cmd                         ;; 3C:6AA3 $21 $90 $68
    call SendUploadCommand                        ;; 3C:6AA6 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AA9 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AAC $CD $92 $6B

    ld   hl, SGBPatch3Cmd                         ;; 3C:6AAF $21 $A0 $68
    call SendUploadCommand                        ;; 3C:6AB2 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AB5 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AB8 $CD $92 $6B

    ld   hl, SGBPatch4Cmd                         ;; 3C:6ABB $21 $B0 $68
    call SendUploadCommand                        ;; 3C:6ABE $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AC1 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AC4 $CD $92 $6B

    ld   hl, SGBPatch5Cmd                         ;; 3C:6AC7 $21 $C0 $68
    call SendUploadCommand                        ;; 3C:6ACA $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6ACD $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AD0 $CD $92 $6B

    ld   hl, SGBPatch6Cmd                         ;; 3C:6AD3 $21 $D0 $68
    call SendUploadCommand                        ;; 3C:6AD6 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AD9 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6ADC $CD $92 $6B

    ld   hl, SGBPatch7Cmd                         ;; 3C:6ADF $21 $E0 $68
    call SendUploadCommand                        ;; 3C:6AE2 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AE5 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AE8 $CD $92 $6B

    ld   hl, SGBPatch8Cmd                         ;; 3C:6AEB $21 $F0 $68
    call SendUploadCommand                        ;; 3C:6AEE $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AF1 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6AF4 $CD $92 $6B

    ; Upload the standard palette used by the game
    ld   hl, SGBSetPal01Cmd                       ;; 3C:6AF7 $21 $00 $69
    call SendUploadCommand                        ;; 3C:6AFA $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6AFD $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6B00 $CD $92 $6B

    ld   hl, SGBSetLinesPalettesCmd               ;; 3C:6B03 $21 $10 $69
    call SendUploadCommand                        ;; 3C:6B06 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6B09 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6B0C $CD $92 $6B

    ; Upload the first part of the frame tiles data
    ld   hl, SGBFrameTilesA                       ;; 3C:6B0F $21 $00 $40
    ld   de, SGBTransfertToTiles0Cmd              ;; 3C:6B12 $11 $30 $69
    call SendVRAMCommand                          ;; 3C:6B15 $CD $A3 $6B

    ; Upload the second part of the frame tiles data
    ld   hl, SGBFrameTilesB                       ;; 3C:6B18 $21 $00 $50
    ld   de, SGBTransfertToTiles1Cmd              ;; 3C:6B1B $11 $40 $69
    call SendVRAMCommand                          ;; 3C:6B1E $CD $A3 $6B

    ; Upload frame tilemap and palettes
    ld   hl, SGBFrameTilemap                      ;; 3C:6B21 $21 $00 $60
    ld   de, SGBTransfertBorderCmd                ;; 3C:6B24 $11 $50 $69
    call SendVRAMCommand                          ;; 3C:6B27 $CD $A3 $6B

    ld   hl, vTiles0                              ;; 3C:6B2A $21 $00 $80
    ld   bc, $2000                                ;; 3C:6B2D $01 $00 $20
.loop_6B30_3C
    xor  a                                        ;; 3C:6B30 $AF
    ldi  [hl], a                                  ;; 3C:6B31 $22
    dec  bc                                       ;; 3C:6B32 $0B
    ld   a, c                                     ;; 3C:6B33 $79
    or   b                                        ;; 3C:6B34 $B0
    jr   nz, .loop_6B30_3C                        ;; 3C:6B35 $20 $F9

    ld   a, LCDCF_ON | LCDCF_BGON                 ;; 3C:6B37 $3E $81
    ldh  [rLCDC], a                               ;; 3C:6B39 $E0 $40
    ld   bc, $06                                  ;; 3C:6B3B $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6B3E $CD $92 $6B

    ; Make the SGB display active again
    ld   hl, SGBCancelMaskCmd                     ;; 3C:6B41 $21 $70 $68
    call SendUploadCommand                        ;; 3C:6B44 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6B47 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6B4A $CD $92 $6B

    ; Disable all LCD Control flags
    xor  a                                        ;; 3C:6B4D $AF
    ldh  [rLCDC], a                               ;; 3C:6B4E $E0 $40
    ret                                           ;; 3C:6B50 $C9

SendUploadCommand::
    ld   a, [hl]                                  ;; 3C:6B51 $7E
    and  %00000111                                ;; 3C:6B52 $E6 $07
    ret  z                                        ;; 3C:6B54 $C8
    ld   b, a                                     ;; 3C:6B55 $47
    ld   c, $00                                   ;; 3C:6B56 $0E $00
.func_03C_6B58::
    push bc                                       ;; 3C:6B58 $C5
    xor  a                                        ;; 3C:6B59 $AF
    ldh  [$ff00+c], a                             ;; 3C:6B5A $E2
    ld   a, $30                                   ;; 3C:6B5B $3E $30
    ldh  [$ff00+c], a                             ;; 3C:6B5D $E2
    ld   b, $10                                   ;; 3C:6B5E $06 $10
.loop_6B60_3C
    ld   e, $08                                   ;; 3C:6B60 $1E $08
    ldi  a, [hl]                                  ;; 3C:6B62 $2A
    ld   d, a                                     ;; 3C:6B63 $57
.loop_6B64_3C
    bit  0, d                                     ;; 3C:6B64 $CB $42
    ld   a, $10                                   ;; 3C:6B66 $3E $10
    jr   nz, .else_6B6C_3C                        ;; 3C:6B68 $20 $02
    ld   a, $20                                   ;; 3C:6B6A $3E $20
.else_6B6C_3C:
    ldh  [$ff00+c], a                             ;; 3C:6B6C $E2
    ld   a, $30                                   ;; 3C:6B6D $3E $30
    ldh  [$ff00+c], a                             ;; 3C:6B6F $E2
    rr   d                                        ;; 3C:6B70 $CB $1A
    dec  e                                        ;; 3C:6B72 $1D
    jr   nz, .loop_6B64_3C                        ;; 3C:6B73 $20 $EF
    dec  b                                        ;; 3C:6B75 $05
    jr   nz, .loop_6B60_3C                        ;; 3C:6B76 $20 $E8
    ld   a, $20                                   ;; 3C:6B78 $3E $20
    ldh  [$ff00+c], a                             ;; 3C:6B7A $E2
    ld   a, $30                                   ;; 3C:6B7B $3E $30
    ldh  [$ff00+c], a                             ;; 3C:6B7D $E2
    pop  bc                                       ;; 3C:6B7E $C1
    dec  b                                        ;; 3C:6B7F $05
    ret  z                                        ;; 3C:6B80 $C8
    call WaitFor3Frames                           ;; 3C:6B81 $CD $86 $6B
    jr   .func_03C_6B58                           ;; 3C:6B84 $18 $D2

WaitFor3Frames::
    ld   de, $1B58                                ;; 3C:6B86 $11 $58 $1B
.loop_6B89_3C
    nop                                           ;; 3C:6B89 $00
    nop                                           ;; 3C:6B8A $00
    nop                                           ;; 3C:6B8B $00
    dec  de                                       ;; 3C:6B8C $1B
    ld   a, d                                     ;; 3C:6B8D $7A
    or   e                                        ;; 3C:6B8E $B3
    jr   nz, .loop_6B89_3C                        ;; 3C:6B8F $20 $F8
    ret                                           ;; 3C:6B91 $C9

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

    ld   de, $6D6                                 ;; 3C:6B92 $11 $D6 $06
    ; Loop while (de-- != 0)
.whileDE
    ; (the instructions in this loop take 36 clock cycles)
    nop                                           ;; 3C:6B95 $00
    nop                                           ;; 3C:6B96 $00
    nop                                           ;; 3C:6B97 $00
    dec  de                                       ;; 3C:6B98 $1B
    ld   a, d                                     ;; 3C:6B99 $7A
    or   e                                        ;; 3C:6B9A $B3
    jr   nz, .whileDE                             ;; 3C:6B9B $20 $F8

    ; Repeat the inner loop while the number of frames is > 0
    dec  bc                                       ;; 3C:6B9D $0B
    ld   a, b                                     ;; 3C:6B9E $78
    or   c                                        ;; 3C:6B9F $B1
    jr   nz, WaitForBCFrames                      ;; 3C:6BA0 $20 $F0
    ret                                           ;; 3C:6BA2 $C9

; Copy some data to VRAM, then send an SGB command to transfer
; the VRAM content to the SGB memory.
; Inputs:
;   hl   data origin address
;   de   addess of the SGB command to send
SendVRAMCommand::
    push de                                       ;; 3C:6BA3 $D5
    ld   a, $E4                                   ;; 3C:6BA4 $3E $E4
    ldh  [rBGP], a                                ;; 3C:6BA6 $E0 $47
    ld   de, $8800                                ;; 3C:6BA8 $11 $00 $88
    ld   bc, $1000                                ;; 3C:6BAB $01 $00 $10
    call CopyData                                 ;; 3C:6BAE $CD $14 $29
    ld   hl, vBGMap0                              ;; 3C:6BB1 $21 $00 $98
    ld   de, $0C                                  ;; 3C:6BB4 $11 $0C $00
    ld   a, $80                                   ;; 3C:6BB7 $3E $80
    ld   c, $0D                                   ;; 3C:6BB9 $0E $0D
.loop_6BBB_3C
    ld   b, $14                                   ;; 3C:6BBB $06 $14
.loop_6BBD_3C
    ldi  [hl], a                                  ;; 3C:6BBD $22
    inc  a                                        ;; 3C:6BBE $3C
    dec  b                                        ;; 3C:6BBF $05
    jr   nz, .loop_6BBD_3C                        ;; 3C:6BC0 $20 $FB
    add  hl, de                                   ;; 3C:6BC2 $19
    dec  c                                        ;; 3C:6BC3 $0D
    jr   nz, .loop_6BBB_3C                        ;; 3C:6BC4 $20 $F5
    ld   a, LCDCF_ON | LCDCF_BGON                 ;; 3C:6BC6 $3E $81
    ldh  [rLCDC], a                               ;; 3C:6BC8 $E0 $40
    ld   bc, $05                                  ;; 3C:6BCA $01 $05 $00
    call WaitForBCFrames                          ;; 3C:6BCD $CD $92 $6B
    pop  hl                                       ;; 3C:6BD0 $E1
    call SendUploadCommand                        ;; 3C:6BD1 $CD $51 $6B
    ld   bc, $06                                  ;; 3C:6BD4 $01 $06 $00
    call WaitForBCFrames                          ;; 3C:6BD7 $CD $92 $6B
    xor  a                                        ;; 3C:6BDA $AF
    ldh  [rLCDC], a                               ;; 3C:6BDB $E0 $40
    ret                                           ;; 3C:6BDD $C9
