;
; Memory-clearing functions
;

; Clear $1600 bytes of WRAM (from $C000 to $D600)
ClearLowerAndMiddleWRAM::
    ld   bc, $1600
    jr   ClearWRAMBytes

; Clear $1300 bytes of WRAM (from $C000 to $D300)
ClearLowerWRAM::
    ld   bc, $1300
    jr   ClearWRAMBytes

; Clear lower values of HRAM (from $FF90 to $FFBF) and all WRAM
ClearWRAMAndLowerHRAM::
    ld   bc, $2F
    jr   ClearHRAMBytesAndWRAM

; Clear all values from HRAM and WRAM
; (only `hIsGBC` is kept)
ClearHRAMAndWRAM::
    ; Set all bytes of HRAM (from $FF90 to $FFFD) to zero
    ld   bc, $6D

ClearHRAMBytesAndWRAM
    ; Set BC bytes of HRAM (starting from $FF90) to zero
    ld   hl, hGameValuesSection
    call ClearBytes
    ; Set all bytes of WRAM (from $C000 to $DF00) to zero
    ld   bc, $1F00

; Set BC bytes of WRAM (starting from $C000) to zero
ClearWRAMBytes::
    ld   hl, wram0Section

; Set BC bytes of memory starting from HL to zero
ClearBytes::
    ldh  a, [hIsGBC]
    push af

.loop
    xor  a
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, .loop
    pop  af
    ldh  [hIsGBC], a
    ret
