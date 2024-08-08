SouthFaceShrineDoorEntityHandler::
    call ReturnIfNonInteractive_18                ;; 18:5DE9 $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ;; 18:5DEC $F0 $E7
    and  $03                                      ;; 18:5DEE $E6 $03
    jr   nz, .return                              ;; 18:5DF0 $20 $04

    ld   hl, wScrollXOffset                       ;; 18:5DF2 $21 $BF $C1
    inc  [hl]                                     ;; 18:5DF5 $34

.return
    ret                                           ;; 18:5DF6 $C9
