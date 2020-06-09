;
; Game entry point.
;

; After the boot ROM code is done executing, control
; is transfered to address $100, which immediatly jumps here.
; (See header.asm)
Start::
    call LCDOff      ; Turn off screen
    ld   sp, $DFFF   ; Init stack pointer

    ; Clear registers
    xor  a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a

    ; Clear Tiles Map 0
    ld   hl, vTiles0
    ld   bc, $1800
    call ClearBytes

    call ClearBGMap

    call ClearHRAMAndWRAM

    ; Copy DMA routine to HRAM
    callsb WriteDMACodeToHRAM

    ; Initiate DMA transfer
    call hDMARoutine

    call LCDOn

    ; Load default tiles
    call LoadBaseTiles

    ; Initialize LCD Status register
    ;   Bit 6: LYC coincidence interrupt enabled
    ;   Bit 5: Mode 2 OAM interrupt disabled
    ;   Bit 4: Mode 1 V-Blank interrupt disabled
    ;   Bit 3: Mode 0 H-Blank interrupt disabled
    ;   Bit 2-0: read-only
    ld   a, %01000100
    ld   [rSTAT], a

    ; Initialize LY Compare register
    ; Request a STAT interrupt when LY equals $4F
    ld   a, $4F
    ld   [rLYC], a

    ; Initialize wCurrentBank
    ld   a, $01
    ld   [wCurrentBank], a

    ; Initialize Interrupts
    ;   Bit 4: Joypad interrupt disabled
    ;   Bit 3: Serial interrupt disabled
    ;   Bit 2: Timer interrupt disabled
    ;   Bit 1: LCD STAT interrupt disabled
    ;   Bit 0: V-Blank interrupt enabled
    ld   a, %00001
    ld   [rIE], a

    callsb SoundSystemInit

    ; Initialize sound
    callsb SoundSystemInit

    ; Ignore joypad input during 24 frames
    ld   a, 24
    ldh  [hButtonsInactiveDelay], a

    ; Enable interrupts
    ei

    ; Start rendering
    jp   WaitForNextFrame
