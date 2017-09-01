; Copy DMA routine to HRAM
WriteDMACodeToHRAM::
    ld   c, hDMARoutine % $100 ; offset
    ld   b, DMARoutineEnd - DMARoutine ; number of bytes to copy
    ld   hl, DMARoutine ; start
.copy
    ld   a, [hli]
    ld   [$FF00+C], a
    inc  c
    dec  b
    jr   nz, .copy
    ret

; Transfer $60 bytes from OAM buffer to OAM memory
DMARoutine:
    ; Initiate DMA
    ld   a, wOAMBuffer / $100 ;
    ld   [rDMA], a

    ; Wait for DMA to finish
    ld   a, $28
.wait
    dec  a
    jr   nz, .wait
    ret
DMARoutineEnd:
