; Copy DMA routine to HRAM
WriteDMACodeToHRAM::
    ld   c, hDMARoutine % $100 ; offset           ; $6D32: $0E $C0
    ld   b, DMARoutineEnd - DMARoutine ; number of bytes to copy ; $6D34: $06 $0A
    ld   hl, DMARoutine ; start                   ; $6D36: $21 $40 $6D
.copy
    ld   a, [hli]                                 ; $6D39: $2A
    ldh  [$FF00+c], a                             ; $6D3A: $E2
    inc  c                                        ; $6D3B: $0C
    dec  b                                        ; $6D3C: $05
    jr   nz, .copy                                ; $6D3D: $20 $FA
    ret                                           ; $6D3F: $C9

; Transfer $60 bytes from OAM buffer to OAM memory
DMARoutine:
    ; Initiate DMA
    ld   a, wOAMBuffer / $100 ;                   ; $6D40: $3E $C0
    ldh  [rDMA], a                                ; $6D42: $E0 $46

    ; Wait for DMA to finish
    ld   a, $28                                   ; $6D44: $3E $28
.wait
    dec  a                                        ; $6D46: $3D
    jr   nz, .wait                                ; $6D47: $20 $FD
    ret                                           ; $6D49: $C9
DMARoutineEnd:
