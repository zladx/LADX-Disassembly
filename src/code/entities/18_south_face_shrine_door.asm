SouthFaceShrineDoorEntityHandler::
    call ReturnIfNonInteractive_18                ; $5DE9: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $5DEC: $F0 $E7
    and  $03                                      ; $5DEE: $E6 $03
    jr   nz, .return                              ; $5DF0: $20 $04

    ld   hl, wScrollXOffset                       ; $5DF2: $21 $BF $C1
    inc  [hl]                                     ; $5DF5: $34

.return
    ret                                           ; $5DF6: $C9
