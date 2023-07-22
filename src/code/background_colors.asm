; -------------------------------------------------------
; Background Attributes
; -------------------------------------------------------

FillBGMapAttributesWhite::
    ldh  a, [hIsGBC]                              ; $5C00: $F0 $FE
    and  a                                        ; $5C02: $A7
    ret  z                                        ; $5C03: $C8

    ld   a, $01                                   ; $5C04: $3E $01
    ldh  [rVBK], a                                ; $5C06: $E0 $4F
    ld   bc, $800                                 ; $5C08: $01 $00 $08
    ld   hl, vBGMap0                              ; $5C0B: $21 $00 $98

.loop
    ld   a, $00                                   ; $5C0E: $3E $00
    ld   [hl+], a                                 ; $5C10: $22
    dec  bc                                       ; $5C11: $0B
    ld   a, b                                     ; $5C12: $78
    or   c                                        ; $5C13: $B1
    jr   nz, .loop                                ; $5C14: $20 $F8

    xor  a                                        ; $5C16: $AF
    ldh  [rVBK], a                                ; $5C17: $E0 $4F
    ret                                           ; $5C19: $C9

; Change BG column palette during v-blank
ChangeBGColumnPalette::
    ldh  a, [hIsGBC]                              ; $5C1A: $F0 $FE
    and  a                                        ; $5C1C: $A7
    ret  z                                        ; $5C1D: $C8

    ; Select VRAM bank 1 (CGB tile attributes)
    ld   a, 1                                     ; $5C1E: $3E $01
    ldh  [rVBK], a                                ; $5C20: $E0 $4F
    ld   de, wDrawCommandAlt                      ; $5C22: $11 $91 $DC
    call ExecuteDrawCommands                      ; $5C25: $CD $27 $29
    ; Select VRAM bank 0
    xor  a                                        ; $5C28: $AF
    ldh  [rVBK], a                                ; $5C29: $E0 $4F
    ret                                           ; $5C2B: $C9

; Load CGB attributes for a Background map at wBGMapToLoad
LoadBGMapAttributes::
    ldh  a, [hIsGBC]                              ; $5C2C: $F0 $FE
    and  a                                        ; $5C2E: $A7
    ret  z                                        ; $5C2F: $C8

    ld   a, $01                                   ; $5C30: $3E $01
    ldh  [rVBK], a                                ; $5C32: $E0 $4F
    ld   hl, AttrmapsPointersTable                ; $5C34: $21 $4B $5C
    ld   b, $00                                   ; $5C37: $06 $00
    ld   a, [wBGMapToLoad]                        ; $5C39: $FA $FF $D6
    sla  a                                        ; $5C3C: $CB $27
    ld   c, a                                     ; $5C3E: $4F
    add  hl, bc                                   ; $5C3F: $09
    ld   a, [hl+]                                 ; $5C40: $2A
    ld   e, a                                     ; $5C41: $5F
    ld   a, [hl]                                  ; $5C42: $7E
    ld   d, a                                     ; $5C43: $57
    call ExecuteDrawCommands.noRoomTransition     ; $5C44: $CD $2D $29
    xor  a                                        ; $5C47: $AF
    ldh  [rVBK], a                                ; $5C48: $E0 $4F
    ret                                           ; $5C4A: $C9

include "data/backgrounds/attrmaps_pointers.asm"
include "data/backgrounds/attrmaps_list.asm"

; -------------------------------------------------------
; Background Palettes
; -------------------------------------------------------

include "data/backgrounds/forest_palette_pointers.asm"

BGPaletteDestinationsTable::
    dw   wBGPal1                                  ; $73F9
    dw   wBGPal5                                  ; $73FB
    dw   wBGPal1                                  ; $73FD
    dw   wBGPal5                                  ; $73FF
    dw   wBGPal1                                  ; $7401
    dw   wBGPal5                                  ; $7403

LoadBGPalettes::
    ld   a, [wIsIndoor]                           ; $7405: $FA $A5 $DB
    and  a                                        ; $7408: $A7
    ret  nz                                       ; $7409: $C0

    ld   a, [wBGPaletteTransitionEffect]          ; $740A: $FA $D6 $DD
    and  a                                        ; $740D: $A7
    ret  z                                        ; $740E: $C8

    ld   a, [wDDD7]                               ; $740F: $FA $D7 $DD
    dec  a                                        ; $7412: $3D
    ld   [wDDD7], a                               ; $7413: $EA $D7 $DD
    jr   z, .jr_741B                              ; $7416: $28 $03

    cp   $01                                      ; $7418: $FE $01
    ret  nz                                       ; $741A: $C0
.jr_741B

    ld   a, [wBGPaletteTransitionEffect]          ; $741B: $FA $D6 $DD
    bit  7, a                                     ; $741E: $CB $7F
    jr   nz, .jr_7427                             ; $7420: $20 $05
    ld   hl, BGPaletteFadeOverworldToForestTable  ; $7422: $21 $E1 $73
    jr   jr_024_742A                              ; $7425: $18 $03
.jr_7427
    ld   hl, BGPaletteFadeForestToOverworldTable  ; $7427: $21 $ED $73
jr_024_742A:

    ld   a, [wDDD7]                               ; $742A: $FA $D7 $DD
    cp   $01                                      ; $742D: $FE $01
    jr   z, .jr_7436                              ; $742F: $28 $05

    ld   a, $0B                                   ; $7431: $3E $0B
    ld   [wDDD7], a                               ; $7433: $EA $D7 $DD

.jr_7436
    push hl                                       ; $7436: $E5
    ld   a, [wBGPaletteTransitionEffect]          ; $7437: $FA $D6 $DD
    and  $3F                                      ; $743A: $E6 $3F
    sla  a                                        ; $743C: $CB $27
    ld   c, a                                     ; $743E: $4F
    ld   b, $00                                   ; $743F: $06 $00
    ld   hl, BGPaletteDestinationsTable           ; $7441: $21 $F9 $73
    add  hl, bc                                   ; $7444: $09
    ld   a, [hl+]                                 ; $7445: $2A
    ld   e, a                                     ; $7446: $5F
    ld   d, [hl]                                  ; $7447: $56
    pop  hl                                       ; $7448: $E1
    add  hl, bc                                   ; $7449: $09
    ld   a, [hl+]                                 ; $744A: $2A
    ld   h, [hl]                                  ; $744B: $66
    ld   l, a                                     ; $744C: $6F
    ld   bc, $20                                  ; $744D: $01 $20 $00
    call CopyData                                 ; $7450: $CD $14 $29
    ld   a, [wBGPaletteTransitionEffect]          ; $7453: $FA $D6 $DD
    and  $01                                      ; $7456: $E6 $01
    swap a                                        ; $7458: $CB $37

    ld   [wPalettePartialCopyColorIndexStart], a  ; $745A: $EA $D3 $DD
    ld   a, $10                                   ; $745D: $3E $10
    ld   [wPalettePartialCopyColorCount], a       ; $745F: $EA $D4 $DD
    ld   a, $81                                   ; $7462: $3E $81
    ld   [wPaletteDataFlags], a                   ; $7464: $EA $D1 $DD
    ld   a, [wBGPaletteTransitionEffect]          ; $7467: $FA $D6 $DD
    inc  a                                        ; $746A: $3C
    ld   [wBGPaletteTransitionEffect], a          ; $746B: $EA $D6 $DD
    and  $3F                                      ; $746E: $E6 $3F
    cp   $06                                      ; $7470: $FE $06
    ret  nz                                       ; $7472: $C0

    xor  a                                        ; $7473: $AF
    ld   [wBGPaletteTransitionEffect], a          ; $7474: $EA $D6 $DD
    ret                                           ; $7477: $C9
