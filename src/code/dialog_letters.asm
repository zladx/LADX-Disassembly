
    ret                                         ; $4A17: $C9

func_01C_4A76::
    ld   hl, $DC90                              ; $4A76: $21 $90 $DC
    ld   de, $D600                              ; $4A79: $11 $00 $D6
    ld   b, $04                                 ; $4A7C: $06 $04
.loop_4A7E_1C:
    ld   a, [de]                                ; $4A7E: $1A
    ldi  [hl], a                                ; $4A7F: $22
    inc  de                                     ; $4A80: $13
    dec  b                                      ; $4A81: $05
    jr   nz, .loop_4A7E_1C                      ; $4A82: $20 $FA

    ld   a, $01                                 ; $4A84: $3E $01
    ldi  [hl], a                                ; $4A86: $22
    xor  a                                      ; $4A87: $AF
    ld   [hl], a                                ; $4A88: $77
    ret                                         ; $4A89: $C9

func_01C_4B02::
    push bc                                     ; $4B02: $C5
    ld   hl, $DC90                              ; $4B03: $21 $90 $DC
    ld   de, $D600                              ; $4B06: $11 $00 $D6
    ld   b, $04                                 ; $4B09: $06 $04
.loop_4B0B_1C:
    ld   a, [de]                                ; $4B0B: $1A
    ldi  [hl], a                                ; $4B0C: $22
    inc  de                                     ; $4B0D: $13
    dec  b                                      ; $4B0E: $05
    jr   nz, .loop_4B0B_1C                      ; $4B0F: $20 $FA

    pop  bc                                     ; $4B11: $C1
    ld   a, c                                   ; $4B12: $79
    sub  $12                                    ; $4B13: $D6 $12
    ld   c, a                                   ; $4B15: $4F
    ld   e, $12                                 ; $4B16: $1E $12
.loop_4B18_1C:
    ld   a, $02                                 ; $4B18: $3E $02
    ld   [rSVBK], a                             ; $4B1A: $E0 $70
    ld   a, [bc]                                ; $4B1C: $0A
    ld   d, a                                   ; $4B1D: $57
    xor  a                                      ; $4B1E: $AF
    ld   [rSVBK], a                             ; $4B1F: $E0 $70
    ld   a, d                                   ; $4B21: $7A
    ldi  [hl], a                                ; $4B22: $22
    inc  bc                                     ; $4B23: $03
    dec  e                                      ; $4B24: $1D
    jr   nz, .loop_4B18_1C                      ; $4B25: $20 $F1

    ld   [hl], $00                              ; $4B27: $36 $00
    ret                                         ; $4B29: $C9
