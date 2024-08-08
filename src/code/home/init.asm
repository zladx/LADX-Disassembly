;
; Game entry point.
;

; After the boot ROM code is done executing, control
; is transfered to address $100, which immediatly jumps here.
; (See header.asm)
Start::
    ; Switch CPU to double-speed if needed
    cp   BOOTUP_A_CGB ; running on Game Boy Color? ;; 00:0150 $FE $11
    jr   nz, .notGBC                              ;; 00:0152 $20 $1A
    ldh  a, [rKEY1]                               ;; 00:0154 $F0 $4D
    and  KEY1F_DBLSPEED       ; do we need to     ;; 00:0156 $E6 $80
    jr   nz, .speedSwitchDone ; switch CPU speed? ;; 00:0158 $20 $0D
    ld   a, P1F_5 | P1F_4 ; \                     ;; 00:015A $3E $30
    ldh  [rP1], a         ; |                     ;; 00:015C $E0 $00
    ld   a, KEY1F_PREPARE ; |                     ;; 00:015E $3E $01
    ldh  [rKEY1], a       ; | Prepare CPU speed   ;; 00:0160 $E0 $4D
    xor  a                ; |                     ;; 00:0162 $AF
    ldh  [rIE], a         ; |                     ;; 00:0163 $E0 $FF
    stop                  ; / Switch CPU speed    ;; 00:0165 $10 $00

.speedSwitchDone
    xor  a                                        ;; 00:0167 $AF
    ldh  [rSVBK], a                               ;; 00:0168 $E0 $70
    ld   a, $01 ; isGBC = true                    ;; 00:016A $3E $01
    jr   Init                                     ;; 00:016C $18 $01

.notGBC
    xor  a ; isGBC = false                        ;; 00:016E $AF

Init::
    ldh  [hIsGBC], a ; Save isGBC value           ;; 00:016F $E0 $FE
    call LCDOff      ; Turn off screen            ;; 00:0171 $CD $CF $28
    ld   sp, wStackTop   ; Init stack pointer         ;; 00:0174 $31 $FF $DF

    ; Super GameBoy detection and initialization
    callsb SuperGameBoyInit                       ;; 00:0177 $3E $3C $EA $00 $21 $CD $22 $6A

    ; Clear registers
    xor  a                                        ;; 00:017F $AF
    ldh  [rBGP], a                                ;; 00:0180 $E0 $47
    ldh  [rOBP0], a                               ;; 00:0182 $E0 $48
    ldh  [rOBP1], a                               ;; 00:0184 $E0 $49

    ; Clear Tiles
    ld   hl, vTiles0                              ;; 00:0186 $21 $00 $80
    ld   bc, $1800                                ;; 00:0189 $01 $00 $18
    call ClearBytes                               ;; 00:018C $CD $DF $29

    ; Clear BG Map
    callsb FillBGMapAttributesWhite               ;; 00:018F $3E $24 $EA $00 $21 $CD $00 $5C
    call FillBGMapWhite                           ;; 00:0197 $CD $F7 $28

    call ClearHRAMAndWRAM                         ;; 00:019A $CD $D0 $29

    ; Copy DMA routine to HRAM
    callsb WriteDMACodeToHRAM                     ;; 00:019D $3E $01 $EA $00 $21 $CD $32 $6D

    ; Initiate DMA transfer
    call hDMARoutine                              ;; 00:01A5 $CD $C0 $FF

    call LCDOn                                    ;; 00:01A8 $CD $0D $41

    ; Load default tiles
    call LoadBaseTiles                            ;; 00:01AB $CD $CF $2B

    ; Initialize LCD Status register
    ;   Bit 6: LYC coincidence interrupt enabled
    ;   Bit 5: Mode 2 OAM interrupt disabled
    ;   Bit 4: Mode 1 V-Blank interrupt disabled
    ;   Bit 3: Mode 0 H-Blank interrupt disabled
    ;   Bit 2-0: read-only
    ld   a, STATF_LYC | STATF_LYCF                ;; 00:01AE $3E $44
    ldh  [rSTAT], a                               ;; 00:01B0 $E0 $41

    ; Initialize LY Compare register
    ; Request a STAT interrupt when LY equals $4F
    ld   a, $4F                                   ;; 00:01B2 $3E $4F
    ldh  [rLYC], a                                ;; 00:01B4 $E0 $45

    ; Initialize wCurrentBank
    ld   a, $01                                   ;; 00:01B6 $3E $01
    ld   [wCurrentBank], a                        ;; 00:01B8 $EA $AF $DB

    ; Initialize Interrupts
    ;   Bit 4: Joypad interrupt disabled
    ;   Bit 3: Serial interrupt disabled
    ;   Bit 2: Timer interrupt disabled
    ;   Bit 1: LCD STAT interrupt disabled
    ;   Bit 0: V-Blank interrupt enabled
    ld   a, IEF_VBLANK                            ;; 00:01BB $3E $01
    ldh  [rIE], a                                 ;; 00:01BD $E0 $FF

    ; Initialize save files
    call InitSaveFiles                            ;; 00:01BF $CD $AA $46

    ; Initialize sound
    callsb SoundSystemInit                        ;; 00:01C2 $3E $1F $EA $00 $21 $CD $00 $40

    ; Ignore joypad input during 24 frames
    ld   a, 24                                    ;; 00:01CA $3E $18
    ldh  [hButtonsInactiveDelay], a               ;; 00:01CC $E0 $B5

    ; Enable interrupts
    ei                                            ;; 00:01CE $FB

    ; On GBC, reset WRAM bank 5
    callsb ClearWRAMBank5                         ;; 00:01CF $3E $20 $EA $00 $21 $CD $54 $48

    ; Start the game loop
    jp   RenderLoop.waitForNextFrame              ;; 00:01D7 $C3 $5F $03
