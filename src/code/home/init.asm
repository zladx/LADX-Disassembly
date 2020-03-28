;
; Game entry point.
;

; After the boot ROM code is done executing, control
; is transfered to address $100, which immediatly jumps here.
; (See header.asm)
Start::
    ; Switch CPU to double-speed if needed
    cp   GBC ; is running on Game Boy Color?
    jr   nz, .notGBC
    ld   a, [rKEY1]
    and  $80 ; do we need to switch the CPU speed?
    jr   nz, .speedSwitchDone
    ld   a, $30      ; \
    ld   [rP1], a  ; |
    ld   a, $01      ; |
    ld   [rKEY1], a  ; | Switch the CPU speed
    xor  a           ; |
    ld   [rIE], a    ; |
    stop             ; /

.speedSwitchDone
    xor  a
    ld   [rSVBK], a
    ld   a, $01 ; isGBC = true
    jr   Init

.notGBC
    xor  a ; isGBC = false

Init::
    ldh  [hIsGBC], a ; Save isGBC value
    call LCDOff      ; Turn off screen
    ld   sp, $DFFF   ; Init stack pointer

    ; Super GameBoy detection and initialization
    callsb SuperGameBoyInit

    ; Clear registers
    xor  a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a

    ; Clear Tiles Map 0
    ld   hl, vTiles0
    ld   bc, $1800
    call ClearBytes

    ; Clear Background Maps
    callsb ClearBGMap0Attributes
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

    ; Initialize save files
    call InitSaveFiles

    ; Initialize sound
    callsb SoundSystemInit

    ; Ignore joypad input during 24 frames
    ld   a, 24
    ldh  [hButtonsInactiveDelay], a

    ; Enable interrupts
    ei

    ; On GBC, reset WRAM bank 5
    callsb ClearWRAMBank5

    ; Start rendering
    jp   WaitForNextFrame
