; Copy DMA routine to HRAM
WriteDMACodeToHRAM::
    ld   c, hDMARoutine % $100 ; offset           ;; 01:6D32 $0E $C0
    ld   b, DMARoutineEnd - DMARoutine ; number of bytes to copy ;; 01:6D34 $06 $0A
    ld   hl, DMARoutine ; start                   ;; 01:6D36 $21 $40 $6D
.copy
    ld   a, [hli]                                 ;; 01:6D39 $2A
    ldh  [$FF00+c], a                             ;; 01:6D3A $E2
    inc  c                                        ;; 01:6D3B $0C
    dec  b                                        ;; 01:6D3C $05
    jr   nz, .copy                                ;; 01:6D3D $20 $FA
    ret                                           ;; 01:6D3F $C9

; Transfer $60 bytes from OAM buffer to OAM memory
DMARoutine:
    ; Initiate DMA
    ld   a, wOAMBuffer / $100 ;                   ;; 01:6D40 $3E $C0
    ldh  [rDMA], a                                ;; 01:6D42 $E0 $46

    ; Wait for DMA to finish
    ld   a, $28                                   ;; 01:6D44 $3E $28
.wait
    dec  a                                        ;; 01:6D46 $3D
    jr   nz, .wait                                ;; 01:6D47 $20 $FD
    ret                                           ;; 01:6D49 $C9
DMARoutineEnd:
