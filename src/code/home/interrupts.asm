;
; Interrupt handlers
;

IntroSeaScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the sea intro sequence.
    db $20, $30, $40, $60, 0 ; upper clouds, lower clouds, sea, upper waves, lower waves ;; 00:037F

IntroBeachScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the beach intro sequence.
    db $30, $56, $68, 0 ; moutains, trees, beach, waves ;; 00:0384

;
; InterruptLCDStatus
;
; Manipulate the Background's scrollX and scrollY value during mode 2 (Searching OAM-RAM),
; to create various effects like differential scrolling.
;

InterruptLCDStatus::
    di                                            ;; 00:0388 $F3
    push af                                       ;; 00:0389 $F5
    push hl                                       ;; 00:038A $E5
    push de                                       ;; 00:038B $D5
    push bc                                       ;; 00:038C $C5
    ldh  a, [rSVBK]  ; Save current WRAM Bank to c ;; 00:038D $F0 $70
    ld   c, a        ;                            ;; 00:038F $4F
    xor  a           ; Load WRAM Bank 1 (as "0" fallbacks to loading bank 1) ;; 00:0390 $AF
    ldh  [rSVBK], a  ;                            ;; 00:0391 $E0 $70
    ld   a, [wGameplayType]                       ;; 00:0393 $FA $95 $DB
    cp   GAMEPLAY_CREDITS ; if GameplayType != GAMEPLAY_CREDITS ;; 00:0396 $FE $01
    jr   nz, .skipScrollY                         ;; 00:0398 $20 $13
    ; GameplayType == CREDITS
    ld   a, [wGameplaySubtype]                    ;; 00:039A $FA $96 $DB
    cp   $05 ; if GameplaySubtype != 5            ;; 00:039D $FE $05
    jr   nz, .setStandardScrollY                  ;; 00:039F $20 $05
    ; GameplaySubtype == 5
    ld   a, [wIsFileSelectionArrowShifted]  ; override scrollY with WRA1:wIsFileSelectionArrowShifted value ;; 00:03A1 $FA $00 $D0
    jr   .setScrollY                              ;; 00:03A4 $18 $02

.setStandardScrollY
    ; Set standard scrollY, without specific offset
    ldh  a, [hBaseScrollY]                        ;; 00:03A6 $F0 $97

.setScrollY
    ldh  [rSCY], a ; scrollY                      ;; 00:03A8 $E0 $42
    jp   .clearBGTilesFlag                        ;; 00:03AA $C3 $FF $03

.skipScrollY
    cp   GAMEPLAY_INTRO    ; if not during the introduction sequence ;; 00:03AD $FE $00
    jr   nz, .clearScrollX  ;   skip              ;; 00:03AF $20 $4B
    ; GameplayType == INTRO
    ; Apply differential scrolling to each section:
    ; load and apply the scrollX offset for the current screen section being drawn
    ld   a, [wLCDSectionIndex]                    ;; 00:03B1 $FA $05 $C1
    ld   e, a             ; hl = ScrollXOffsetForSection + LCDSectionIndex ;; 00:03B4 $5F
    ld   d, $00           ;                       ;; 00:03B5 $16 $00
    ld   hl, wScrollXOffsetForSection             ;; 00:03B7 $21 $00 $C1
    add  hl, de           ;                       ;; 00:03BA $19
    ld   a, [hl]                                  ;; 00:03BB $7E
    ld   hl, hBaseScrollX ; a = hBaseScrollX + [hl] ;; 00:03BC $21 $96 $FF
    add  a, [hl]                                  ;; 00:03BF $86
    ldh  [rSCX], a        ; set scrollX           ;; 00:03C0 $E0 $43
    ld   a, [wGameplaySubtype]                    ;; 00:03C2 $FA $96 $DB
    cp   $06  ; if GameplaySubtype < 6 (intro sea) ;; 00:03C5 $FE $06
    jr   c, .setupNextInterruptForIntroSea        ;; 00:03C7 $38 $10
    ; If TransitionCounter >= 6 (intro beach),
    ; setup next interrupt for the beach sequence
    ld   hl, IntroBeachScreenSections             ;; 00:03C9 $21 $84 $03
    add  hl, de        ; hl = ScreenSectionsTable + SectionIndex ;; 00:03CC $19
    ld   a, [hl]       ;                          ;; 00:03CD $7E
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section ;; 00:03CE $E0 $45
    ld   a, e          ; a = SectionIndex + 1     ;; 00:03D0 $7B
    inc  a             ;                          ;; 00:03D1 $3C
    and  $03           ; a = a % 4                ;; 00:03D2 $E6 $03
    ld   [wLCDSectionIndex], a ; save SectionIndex ;; 00:03D4 $EA $05 $C1
    jr   .clearBGTilesFlag                        ;; 00:03D7 $18 $26

.setupNextInterruptForIntroSea
    ld   hl, IntroSeaScreenSections               ;; 00:03D9 $21 $7F $03
    add  hl, de        ; hl = LCDScreenSectionsTable + SectionIndex ;; 00:03DC $19
    ld   a, [hl]       ;                          ;; 00:03DD $7E
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section ;; 00:03DE $E0 $45
    ld   a, e          ; a = SectionIndex + 1     ;; 00:03E0 $7B
    inc  a             ;                          ;; 00:03E1 $3C
    cp   $05           ; if SectionIndex != 5     ;; 00:03E2 $FE $05
    jr   nz, .skipResetSectionIndex ; skip        ;; 00:03E4 $20 $01
    ; If SectionIndex reached 5, reset it to 0
    xor  a             ; a = 0                    ;; 00:03E6 $AF

.skipResetSectionIndex
    ld   [wLCDSectionIndex], a ; save SectionIndex ;; 00:03E7 $EA $05 $C1
    nop                                           ;; 00:03EA $00
    cp   $04           ; if SectionIndex != 4     ;; 00:03EB $FE $04
    jr   nz, .clearBGTilesFlag ; skip             ;; 00:03ED $20 $10
    ; If we are drawing the last section (4)
    ld   a, [wIntroBGYOffset] ; Apply the Y offset to compensate for sea vertical movement ;; 00:03EF $FA $06 $C1
    ldh  [rSCY], a               ; (so that the horizon position stays constant). ;; 00:03F2 $E0 $42
    cpl                ; a = $FF - a + $61        ;; 00:03F4 $2F
    inc  a             ;                          ;; 00:03F5 $3C
    add  a, $60        ;                          ;; 00:03F6 $C6 $60
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next transition step ;; 00:03F8 $E0 $45
    jr   .clearBGTilesFlag                        ;; 00:03FA $18 $03

.clearScrollX
    xor  a                                        ;; 00:03FC $AF
    ldh  [rSCX], a ; scrollX                      ;; 00:03FD $E0 $43

.clearBGTilesFlag
    ; Restore banks and register
    ld   a, c                                     ;; 00:03FF $79
    ldh  [rSVBK], a                               ;; 00:0400 $E0 $70
    pop  bc                                       ;; 00:0402 $C1
    pop  de                                       ;; 00:0403 $D1
    pop  hl                                       ;; 00:0404 $E1
    pop  af                                       ;; 00:0405 $F1
    ei                                            ;; 00:0406 $FB
    reti                                          ;; 00:0407 $D9

;
; InterruptSerial
;
; Dispatches to the Game Boy Printer routines.
;

InterruptSerial::
    push af                                       ;; 00:0408 $F5
    callsb PrinterInterruptSerial                 ;; 00:0409 $3E $28 $EA $00 $21 $CD $01 $46
    ld   a, [wCurrentBank]                        ;; 00:0411 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:0414 $EA $00 $21
    pop  af                                       ;; 00:0417 $F1
    reti                                          ;; 00:0418 $D9

; Copy either a tileset or a BG map to VRAM.
;
; If a tileset is requested, it is copied to VRAM.
; Otherwise, the requested BG map is copied to VRAM.
;
; NB: this function is not called from the vblank interrupt handler,
; but by the render loop, outside of the vblank period.
; (This is why it needs to unlock access to VRAM by disabling the LCD screen.)
;
; Inputs:
;  - wTilesetToLoad: index of the tileset to load
;  - wBGMapToLoad:   index of the BG map to load
LoadRequestedGfx::
    ld   a, [wTilesetToLoad]                      ;; 00:0419 $FA $FE $D6
    and  a                                        ;; 00:041C $A7
    jr   z, .loadBGMap                            ;; 00:041D $28 $1B

    ;
    ; Copy the requested tileset to VRAM
    ;

    ; Copy tile map number to the palette-loading variable
    ld   [wPaletteToLoadForTileMap], a            ;; 00:041F $EA $D2 $DD

    ; if wTilesetToLoad != TILESET_THANKS_FOR_PLAYING, turn off LCD
    cp   TILESET_THANKS_FOR_PLAYING               ;; 00:0422 $FE $23
    jr   z, .LCDOffEnd                            ;; 00:0424 $28 $05
    push af                                       ;; 00:0426 $F5
    call LCDOff                                   ;; 00:0427 $CD $CF $28
    pop  af                                       ;; 00:042A $F1
.LCDOffEnd

    call .executeTilesetLoadHandler               ;; 00:042B $CD $30 $04
    jr   .clearFlagsAndReturn                     ;; 00:042E $18 $2D

.executeTilesetLoadHandler
    ld   e, a                                     ;; 00:0430 $5F
    callsb GetTilesetHandlerAddress               ;; 00:0431 $3E $20 $EA $00 $21 $CD $57 $46
    ; Jump to the tilemap loading handler and return
    jp   hl                                       ;; 00:0439 $E9

.loadBGMap

    ;
    ; No tileset to load:
    ; copy the requested BG map and attributes to VRAM
    ;

    call LCDOff                                   ;; 00:043A $CD $CF $28
    callsb LoadBGMapAttributes                    ;; 00:043D $3E $24 $EA $00 $21 $CD $2C $5C

    ; Read and execute a wDrawCommand for loading wBGMapToLoad.
    callsb GetBGCopyRequest                       ;; 00:0445 $3E $20 $EA $00 $21 $CD $77 $45
    ld   a, BANK(BGTilemaps)                      ;; 00:044D $3E $08
    ld   [rSelectROMBank], a                      ;; 00:044F $EA $00 $21
    call ExecuteDrawCommands.noRoomTransition     ;; 00:0452 $CD $2D $29

    ; Restore tilesets bank
    ld   a, $0C                                   ;; 00:0455 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:0457 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:045A $EA $00 $21

.clearFlagsAndReturn
    xor  a                                        ;; 00:045D $AF
    ld   [wBGMapToLoad], a                        ;; 00:045E $EA $FF $D6
    ld   [wTilesetToLoad], a                      ;; 00:0461 $EA $FE $D6
    ld   a, [wLCDControl]                         ;; 00:0464 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 00:0467 $E0 $40
.return
    ret                                           ;; 00:0469 $C9

; Animation stage to update the tiles of each kind of switch block in
; their final state.
; Indexed by hSwitchBlockNeedingUpdate
;
; See wSwitchableObjectAnimationStage
BlockUpdateAnimationStageTable:: ;; 00:046A
.kindA db 07
.kindB db 09

;
; InterruptVBlank
;
; Load tiles and map data in the background, and handle photo album effects.
;

InterruptVBlank::
    push af                                       ;; 00:046C $F5
    push bc                                       ;; 00:046D $C5
    push de                                       ;; 00:046E $D5
    push hl                                       ;; 00:046F $E5

    ; Save the current RAM bank, and switch to RAM0
    ldh  a, [rSVBK]                               ;; 00:0470 $F0 $70
    and  $07                                      ;; 00:0472 $E6 $07
    ld   c, a                                     ;; 00:0474 $4F
    xor  a                                        ;; 00:0475 $AF
    ldh  [rSVBK], a                               ;; 00:0476 $E0 $70
    push bc                                       ;; 00:0478 $C5

    di                                            ;; 00:0479 $F3

    ;
    ; Photo Album handling
    ;
    ld   a, [wGameplayType]                       ;; 00:047A $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ;; 00:047D $FE $0D
    jr   nz, .photoAlbumEnd                       ;; 00:047F $20 $0C
    ; GameplayType == PHOTO_ALBUM
    ld   a, [wGameplaySubtype]                    ;; 00:0481 $FA $96 $DB
    cp   $09                                      ;; 00:0484 $FE $09
    jr   c, .photoAlbumEnd                        ;; 00:0486 $38 $05
    cp   $12                                      ;; 00:0488 $FE $12
    jp  c, PhotoAlbumVBlankHandler                ;; 00:048A $DA $77 $05
.photoAlbumEnd

    ;
    ; If the next frame is still being computed, drop this frame.
    ;
    ldh  a, [hIsComputingFrame]                   ;; 00:048D $F0 $FD
    and  a                                        ;; 00:048F $A7
    jp   nz, .vblankDone                          ;; 00:0490 $C2 $69 $05

    ;
    ; Dialog handling
    ;
    ld   a, [wDialogState]                        ;; 00:0493 $FA $9F $C1
    and  ~DIALOG_BOX_BOTTOM_FLAG ; If dialog is closed ;; 00:0496 $E6 $7F
    jr   z, .dialogEnd                            ;; 00:0498 $28 $32
    cp   DIALOG_OPENING_1                         ;; 00:049A $FE $01
    jr   z, .dialogEnd                            ;; 00:049C $28 $2E
    cp   DIALOG_OPENING_5  ; If DialogState > 5   ;; 00:049E $FE $05
    jr   nc, .renderDialogText                    ;; 00:04A0 $30 $0A
    ; DialogState < 5
    ; Open dialog
    call func_23E4                                ;; 00:04A2 $CD $E4 $23
    ld   hl, wDialogState                         ;; 00:04A5 $21 $9F $C1
    inc  [hl]  ; Increment DialogState            ;; 00:04A8 $34
    jp   .vblankDone                              ;; 00:04A9 $C3 $69 $05

.renderDialogText

    cp   DIALOG_SCROLLING_1                       ;; 00:04AC $FE $0A
    jr   nz, .dialogScrolling1End                 ;; 00:04AE $20 $06
    ; DialogState == Scrolling1
    call DialogBeginScrolling                     ;; 00:04B0 $CD $19 $27
    jp   .vblankDone                              ;; 00:04B3 $C3 $69 $05
.dialogScrolling1End

    cp   DIALOG_SCROLLING_2                       ;; 00:04B6 $FE $0B
    jr   nz, .dialogEnd                           ;; 00:04B8 $20 $12
    ; DialogState == Scrolling2
    ld   a, [wDialogScrollDelay]                  ;; 00:04BA $FA $72 $C1
    and  a  ; if DialogScrollDelay == 0           ;; 00:04BD $A7
    jr   z, .dialogFinishScrolling                ;; 00:04BE $28 $06
    ; DialogScrollDelay > 0
    dec  a  ; decrement the delay                 ;; 00:04C0 $3D
    ld   [wDialogScrollDelay], a                  ;; 00:04C1 $EA $72 $C1
    jr   .dialogEnd                               ;; 00:04C4 $18 $06

.dialogFinishScrolling
    call DialogFinishScrolling                    ;; 00:04C6 $CD $6D $27
    jp   .vblankDone                              ;; 00:04C9 $C3 $69 $05
.dialogEnd

    ;
    ; Photo Picture handling
    ;
    ld   a, [wGameplayType]                       ;; 00:04CC $FA $95 $DB
    cp   GAMEPLAY_PHOTO_DIZZY_LINK  ; If GameplayType < Photo Picture ;; 00:04CF $FE $0E
    jr   c, .gameplayNotAPhoto                    ;; 00:04D1 $38 $11
    ; GameplayType is one of the Pictures
    ld   a, [wGameplaySubtype]                    ;; 00:04D3 $FA $96 $DB
    cp   $06                                      ;; 00:04D6 $FE $06
    jr   c, .animateTilesEnd                      ;; 00:04D8 $38 $51
    callsb func_038_785A                          ;; 00:04DA $3E $38 $EA $00 $21 $CD $5A $78
    jr   .animateTilesEnd                         ;; 00:04E2 $18 $47
.gameplayNotAPhoto

    ;
    ; Standard gameplay (i.e. not Photos) handling
    ;

    ; If there's a tileset to load, it will be handled when returning
    ; to the main game loop. Exit now.
    ld   a, [wTilesetToLoad]                      ;; 00:04E4 $FA $FE $D6
    and  a                                        ;; 00:04E7 $A7
    jr   nz, .vblankDone                          ;; 00:04E8 $20 $7F

    ; If NeedsUpdatingBGTiles or NeedsUpdatingEnnemiesTiles or NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:04EA $F0 $90
    ldh  [hMultiPurposeG], a                      ;; 00:04EC $E0 $E8
    ld   hl, hNeedsUpdatingEntityTilesA           ;; 00:04EE $21 $91 $FF
    or   [hl]                                     ;; 00:04F1 $B6
    ld   hl, wNeedsUpdatingEntityTilesB           ;; 00:04F2 $21 $0E $C1
    or   [hl]                                     ;; 00:04F5 $B6
    jr   z, .noTilesToUpdate                      ;; 00:04F6 $28 $11

    ; Load tiles (?)
    call LoadTiles                                ;; 00:04F8 $CD $BC $05

    ; If hNeedsUpdatingBGTiles >= 8, skip drawing of Link sprite
    ldh  a, [hMultiPurposeG]                      ;; 00:04FB $F0 $E8
    cp   $08                                      ;; 00:04FD $FE $08
    jr   nc, .drawLinkSpriteEnd                   ;; 00:04FF $30 $03
.drawLinkSprite
    call DrawLinkSprite                           ;; 00:0501 $CD $2E $1D
.drawLinkSpriteEnd

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine                              ;; 00:0504 $CD $C0 $FF
    ; And we're clearBGTilesFlag.
    jr   .vblankDone                              ;; 00:0507 $18 $60

.noTilesToUpdate
    ; Otherwise, when there are not tiles to update, we can perform a bit
    ; more GFX code – like animating the tiles and palettes.

    ;
    ; Update tiles for switch blocks
    ;

    ; If switch block tiles don't need to be updated, move on
    ldh  a, [hSwitchBlockNeedingUpdate]           ;; 00:0509 $F0 $BB
    and  a                                        ;; 00:050B $A7
    jr   z, .switchBlockEnd                       ;; 00:050C $28 $13

    ; Decrement hSwitchBlockNeedingUpdate
    ;
    ; This means it will go either:
    ; - from 2 to 1 (so that next step is updating blocks of kind B)
    ; - from 1 to 0 (so that next step is updating blocks of kind A)
    dec  a                                        ;; 00:050E $3D
    ldh  [hSwitchBlockNeedingUpdate], a           ;; 00:050F $E0 $BB

    ; wSwitchableObjectAnimationStage = BlockUpdateAnimationStageTable[hSwitchBlockNeedingUpdate]
    ld   e, a                                     ;; 00:0511 $5F
    ld   d, $00                                   ;; 00:0512 $16 $00
    ld   hl, BlockUpdateAnimationStageTable       ;; 00:0514 $21 $6A $04
    add  hl, de                                   ;; 00:0517 $19
    ld   a, [hl]                                  ;; 00:0518 $7E
    ; Store the stage to wSwitchableObjectAnimationStage
    ld   [wSwitchableObjectAnimationStage], a     ;; 00:0519 $EA $F8 $D6

    call UpdateSwitchBlockTiles                   ;; 00:051C $CD $D7 $1E

    jr   .drawLinkSprite                          ;; 00:051F $18 $E0
.switchBlockEnd

    ; If GameplayType != PHOTO_ALBUM, animate tiles
    ld   a, [wGameplayType]                       ;; 00:0521 $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ;; 00:0524 $FE $0D
    jr   z, .animateTilesEnd                      ;; 00:0526 $28 $03
    call AnimateTiles                             ;; 00:0528 $CD $0D $1B
.animateTilesEnd

    ldh  a, [hIsGBC]                              ;; 00:052B $F0 $FE
    and  a                                        ;; 00:052D $A7
    jr   z, .gbcEnd                               ;; 00:052E $28 $08
    ; Change BG column palette
    callsb ChangeBGColumnPalette                  ;; 00:0530 $3E $24 $EA $00 $21 $CD $1A $5C
.gbcEnd

    ld   de, wDrawCommand                         ;; 00:0538 $11 $01 $D6
    call ExecuteDrawCommands; Load BG column tiles ;; 00:053B $CD $27 $29
    xor  a                                        ;; 00:053E $AF
    ld   [wDrawCommandsSize], a                   ;; 00:053F $EA $00 $D6
    ld   [wDrawCommand], a                        ;; 00:0542 $EA $01 $D6
    ld   [wDrawCommandsVRAM1Size], a              ;; 00:0545 $EA $90 $DC
    ld   [wDrawCommandVRAM1], a                   ;; 00:0548 $EA $91 $DC

    ; On Overworld, copy some palette data to OAM buffer
    callsb func_036_72BA                          ;; 00:054B $3E $36 $EA $00 $21 $CD $BA $72

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine                              ;; 00:0553 $CD $C0 $FF

    ; On GBC, copy palettes to VRAM
    ldh  a, [hIsGBC]                              ;; 00:0556 $F0 $FE
    and  a                                        ;; 00:0558 $A7
    jr   z, .vblankDone                           ;; 00:0559 $28 $0E
    callsb CopyPalettesToVRAM                     ;; 00:055B $3E $21 $EA $00 $21 $CD $00 $40
    ld   a, [wCurrentBank]                        ;; 00:0563 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:0566 $EA $00 $21

.vblankDone
    ei                                            ;; 00:0569 $FB
.vblankDoneInterruptsEnabled
    ; Restore the RAM bank
    pop  bc                                       ;; 00:056A $C1
    ld   a, c                                     ;; 00:056B $79
    ldh  [rSVBK], a                               ;; 00:056C $E0 $70

    ; Restore registers
    pop  hl                                       ;; 00:056E $E1
    pop  de                                       ;; 00:056F $D1
    pop  bc                                       ;; 00:0570 $C1

    ld   a, TRUE                                  ;; 00:0571 $3E $01
    ldh  [hVBlankOccurred], a                     ;; 00:0573 $E0 $D1

    pop  af                                       ;; 00:0575 $F1
    reti                                          ;; 00:0576 $D9

PhotoAlbumVBlankHandler::
    ld   a, [wCurrentBank]                        ;; 00:0577 $FA $AF $DB
    push af                                       ;; 00:057A $F5
    ldh  a, [hIsComputingFrame]                   ;; 00:057B $F0 $FD
    and  a                                        ;; 00:057D $A7
    jr   nz, .clearBGTilesFlag                    ;; 00:057E $20 $2B

    call hDMARoutine                              ;; 00:0580 $CD $C0 $FF

    ldh  a, [hIsGBC]                              ;; 00:0583 $F0 $FE
    and  a                                        ;; 00:0585 $A7
    jr   z, .gbcEnd                               ;; 00:0586 $28 $10
    callsw CopyPalettesToVRAM                     ;; 00:0588 $3E $21 $CD $0C $08 $CD $00 $40
    callsw ChangeBGColumnPalette                  ;; 00:0590 $3E $24 $CD $0C $08 $CD $1A $5C
.gbcEnd

    ld   de, wDrawCommand                         ;; 00:0598 $11 $01 $D6
    call ExecuteDrawCommands                      ;; 00:059B $CD $27 $29
    xor  a                                        ;; 00:059E $AF
    ld   [wDrawCommandsSize], a                   ;; 00:059F $EA $00 $D6
    ld   [wDrawCommand], a                        ;; 00:05A2 $EA $01 $D6
    ld   [wDrawCommandsVRAM1Size], a              ;; 00:05A5 $EA $90 $DC
    ld   [wDrawCommandVRAM1], a                   ;; 00:05A8 $EA $91 $DC

.clearBGTilesFlag
    callsw PrinterInterruptVBlank                 ;; 00:05AB $3E $28 $CD $0C $08 $CD $16 $46
    pop  af                                       ;; 00:05B3 $F1
    ld   [wCurrentBank], a                        ;; 00:05B4 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:05B7 $EA $00 $21
    jr   InterruptVBlank.vblankDoneInterruptsEnabled ;; 00:05BA $18 $AE

; Copy requested BG tiles or entity tiles to VRAM during V-Blank.
;
; Only a single copy operation is executed on each call.
; By priority order, the function looks for:
;  - hNeedsUpdatingBGTiles
;  - hNeedsUpdatingEntityTilesA
;  - wNeedsUpdatingEntityTilesB
; It then copies $40 bytes from the higher priority request to VRAM.
;
; The V-Blank interval is quite short, so this function splits the
; copies into several stages. Calling this function several times
; will execute the stages successively.
LoadTiles::
    ;
    ; Execute BG Tiles command
    ;

    ; If there are no BG tiles to load, move to the entity tiles.
    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:05BC $F0 $90
    and  a                                        ;; 00:05BE $A7
    jp   z, LoadEntityTiles                       ;; 00:05BF $CA $9E $06

    cp   TILESET_LOAD_INVENTORY                   ;; 00:05C2 $FE $07
    jp   z, LoadInventorySirenInstruments         ;; 00:05C4 $CA $B0 $07
    cp   TILESET_LOAD_PIECE_OF_HEART_1            ;; 00:05C7 $FE $03
    jp   z, LoadPieceOfHeartMeterTiles1           ;; 00:05C9 $CA $62 $00
    cp   TILESET_LOAD_PIECE_OF_HEART_2            ;; 00:05CC $FE $04
    jp   z, LoadPieceOfHeartMeterTiles2           ;; 00:05CE $CA $6A $00
    cp   TILESET_CLEAR_PIECE_OF_HEART_1           ;; 00:05D1 $FE $05
    jp   z, ClearPieceOfHeartMeterTiles1          ;; 00:05D3 $CA $72 $00
    cp   TILESET_CLEAR_PIECE_OF_HEART_2           ;; 00:05D6 $FE $06
    jp   z, ClearPieceOfHeartMeterTiles2          ;; 00:05D8 $CA $7A $00
    cp   TILESET_LOAD_INVENTORY_SONG_1            ;; 00:05DB $FE $08
    jp   nc, LoadBGTilesCommands8ToD              ;; 00:05DD $D2 $D3 $07

    ld   a, [wIsIndoor]                           ;; 00:05E0 $FA $A5 $DB
    and  a                                        ;; 00:05E3 $A7
IF __OPTIMIZATIONS_1__
    jr   z, LoadOverworldBGTiles
ELSE
    jp   z, LoadOverworldBGTiles                  ;; 00:05E4 $CA $56 $06
ENDC
    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:05E7 $F0 $90
    cp   TILESET_LOAD_DUNGEON_MINIMAP             ;; 00:05E9 $FE $02
    jp   z, LoadDungeonMinimapTiles               ;; 00:05EB $CA $26 $08

    ld   a, BANK(IndoorTiles)                     ;; 00:05EE $3E $0D
    call AdjustBankNumberForGBC                   ;; 00:05F0 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:05F3 $EA $00 $21
    ldh  a, [hBGTilesLoadingStage]                ;; 00:05F6 $F0 $92
    ld   c, a                                     ;; 00:05F8 $4F
    ld   b, $00                                   ;; 00:05F9 $06 $00
    sla  c                                        ;; 00:05FB $CB $21
    rl   b                                        ;; 00:05FD $CB $10
    sla  c                                        ;; 00:05FF $CB $21
    rl   b                                        ;; 00:0601 $CB $10
    sla  c                                        ;; 00:0603 $CB $21
    rl   b                                        ;; 00:0605 $CB $10
    sla  c                                        ;; 00:0607 $CB $21
    rl   b                                        ;; 00:0609 $CB $10
    sla  c                                        ;; 00:060B $CB $21
    rl   b                                        ;; 00:060D $CB $10
    sla  c                                        ;; 00:060F $CB $21
    rl   b                                        ;; 00:0611 $CB $10
    ld   hl, $9000                                ;; 00:0613 $21 $00 $90
    add  hl, bc                                   ;; 00:0616 $09
    ld   e, l                                     ;; 00:0617 $5D
    ld   d, h                                     ;; 00:0618 $54
    ld   hl, IndoorTiles                          ;; 00:0619 $21 $00 $50

    ldh  a, [hMapId]                              ;; 00:061C $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:061E $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:0620 $20 $0D
    callsb GetColorDungeonTilesAddress            ;; 00:0622 $3E $20 $EA $00 $21 $CD $16 $46
    ld   [rSelectROMBank], a                      ;; 00:062A $EA $00 $21
    jr   .copyData                                ;; 00:062D $18 $12
.colorDungeonEnd

    ldh  a, [hWorldTileset]                       ;; 00:062F $F0 $94
    add  a, $50                                   ;; 00:0631 $C6 $50
    ld   h, a                                     ;; 00:0633 $67
    add  hl, bc                                   ;; 00:0634 $09

    ldh  a, [hSwitchBlockNeedingUpdate]           ;; 00:0635 $F0 $BB
    and  a                                        ;; 00:0637 $A7
    jr   z, .copyData                             ;; 00:0638 $28 $07
    ldh  a, [hBGTilesLoadingStage]                ;; 00:063A $F0 $92
    dec  a                                        ;; 00:063C $3D
    cp   $02                                      ;; 00:063D $FE $02
    jr   c, .incrementBGTileLoadingStage          ;; 00:063F $38 $06
.copyData

    ld   bc, $40                                  ;; 00:0641 $01 $40 $00
    call CopyData                                 ;; 00:0644 $CD $14 $29

.incrementBGTileLoadingStage
    ldh  a, [hBGTilesLoadingStage]                ;; 00:0647 $F0 $92
    inc  a                                        ;; 00:0649 $3C
    ldh  [hBGTilesLoadingStage], a                ;; 00:064A $E0 $92
    cp   $04                                      ;; 00:064C $FE $04
    jr   nz, .return                              ;; 00:064E $20 $05
    xor  a                                        ;; 00:0650 $AF
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0651 $E0 $90
    ldh  [hBGTilesLoadingStage], a                ;; 00:0653 $E0 $92

.return
    ret                                           ;; 00:0655 $C9

LoadOverworldBGTiles::
    ld   a, BANK(Overworld2Tiles)                 ;; 00:0656 $3E $0F
    call AdjustBankNumberForGBC                   ;; 00:0658 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:065B $EA $00 $21
    ; de = vTiles2 + [hBGTilesLoadingStage] * 6
    ldh  a, [hBGTilesLoadingStage]                ;; 00:065E $F0 $92
    ld   c, a                                     ;; 00:0660 $4F
    ld   b, $00                                   ;; 00:0661 $06 $00
    sla  c                                        ;; 00:0663 $CB $21
    rl   b                                        ;; 00:0665 $CB $10
    sla  c                                        ;; 00:0667 $CB $21
    rl   b                                        ;; 00:0669 $CB $10
    sla  c                                        ;; 00:066B $CB $21
    rl   b                                        ;; 00:066D $CB $10
    sla  c                                        ;; 00:066F $CB $21
    rl   b                                        ;; 00:0671 $CB $10
    sla  c                                        ;; 00:0673 $CB $21
    rl   b                                        ;; 00:0675 $CB $10
    sla  c                                        ;; 00:0677 $CB $21
    rl   b                                        ;; 00:0679 $CB $10
    ld   hl, vTiles2                              ;; 00:067B $21 $00 $90
    add  hl, bc                                   ;; 00:067E $09
    ld   e, l                                     ;; 00:067F $5D
    ld   d, h                                     ;; 00:0680 $54

    ldh  a, [hWorldTileset]                       ;; 00:0681 $F0 $94
    add  a, $40                                   ;; 00:0683 $C6 $40
    ld   h, a                                     ;; 00:0685 $67
    ld   l, $00                                   ;; 00:0686 $2E $00
    add  hl, bc                                   ;; 00:0688 $09
    ld   bc, TILE_SIZE * $4                       ;; 00:0689 $01 $40 $00
    call CopyData                                 ;; 00:068C $CD $14 $29

    ; Increment the loading stage
    ldh  a, [hBGTilesLoadingStage]                ;; 00:068F $F0 $92
    inc  a                                        ;; 00:0691 $3C
    ldh  [hBGTilesLoadingStage], a                ;; 00:0692 $E0 $92
    ; If the loading stage >= $08, we're clearBGTilesFlag
    cp   $08                                      ;; 00:0694 $FE $08
    jr   nz, .return                              ;; 00:0696 $20 $05
    xor  a                                        ;; 00:0698 $AF
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0699 $E0 $90
    ldh  [hBGTilesLoadingStage], a                ;; 00:069B $E0 $92
.return
    ret                                           ;; 00:069D $C9

LoadEntityTiles::
    ; If on GBC and inside the Color Dungeon…
    ldh  a, [hIsGBC]                              ;; 00:069E $F0 $FE
    and  a                                        ;; 00:06A0 $A7
    jr   z, .colorDungeonEnd                      ;; 00:06A1 $28 $28
    ldh  a, [hMapId]                              ;; 00:06A3 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:06A5 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:06A7 $20 $22
    ; … skip the defined commands, and load hardcoded titles
    ; for the Color Dungeon objects and entities.
    callsb LoadColorDungeonTiles                  ;; 00:06A9 $3E $20 $EA $00 $21 $CD $5A $47
    xor  a                                        ;; 00:06B1 $AF
    ld   [wNeedsUpdatingEntityTilesB], a          ;; 00:06B2 $EA $0E $C1
    ld   [wEntityTilesLoadingStageB], a           ;; 00:06B5 $EA $0F $C1
    ld   hl, vTiles2                              ;; 00:06B8 $21 $00 $90
    ld   bc, $00                                  ;; 00:06BB $01 $00 $00
    call GetColorDungeonTilesAddress              ;; 00:06BE $CD $16 $46
    ld   c, $90                                   ;; 00:06C1 $0E $90
    ld   b, h                                     ;; 00:06C3 $44
    ld   h, $00                                   ;; 00:06C4 $26 $00
    call CopyDataToVRAM                           ;; 00:06C6 $CD $13 $0A
    jr   .clearEnemiesTilesLoadCommand            ;; 00:06C9 $18 $6D
.colorDungeonEnd

    ;
    ; Copy requested entity tiles to VRAM
    ; (Variant for hNeedsUpdatingEntityTilesA)
    ;

    ; If hNeedsUpdatingEntityTilesA is empty,
    ; use wNeedsUpdatingEntityTilesB.
    ldh  a, [hNeedsUpdatingEntityTilesA]          ;; 00:06CB $F0 $91
    and  a                                        ;; 00:06CD $A7
IF __OPTIMIZATIONS_1__
    jr   z, UpdateEntityTilesB
ELSE
    jp   z, UpdateEntityTilesB                    ;; 00:06CE $CA $3E $07
ENDC
    ld   a, [wEntityTilesSpriteslotIndexA]        ;; 00:06D1 $FA $97 $C1
    ld   e, a                                     ;; 00:06D4 $5F
    ld   d, $00                                   ;; 00:06D5 $16 $00

    ld   hl, wLoadedEntitySpritesheets            ;; 00:06D7 $21 $93 $C1
    add  hl, de                                   ;; 00:06DA $19
    ld   a, [hl]                                  ;; 00:06DB $7E
    push af                                       ;; 00:06DC $F5
    and  $3F                                      ;; 00:06DD $E6 $3F
    ld   d, a                                     ;; 00:06DF $57
    ld   e, $00                                   ;; 00:06E0 $1E $00
    pop  af                                       ;; 00:06E2 $F1
    swap a                                        ;; 00:06E3 $CB $37
    rra                                           ;; 00:06E5 $1F
    rra                                           ;; 00:06E6 $1F
    and  $03                                      ;; 00:06E7 $E6 $03
    ld   c, a                                     ;; 00:06E9 $4F
    ld   b, $00                                   ;; 00:06EA $06 $00
    ld   hl, NpcTilesBankTable                    ;; 00:06EC $21 $6F $2E
    add  hl, bc                                   ;; 00:06EF $09
    ld   a, [hl]                                  ;; 00:06F0 $7E
    and  a                                        ;; 00:06F1 $A7
    jr   z, .adjustBankEnd                        ;; 00:06F2 $28 $03
    call AdjustBankNumberForGBC                   ;; 00:06F4 $CD $0B $0B
.adjustBankEnd

    ld   [rSelectROMBank], a                      ;; 00:06F7 $EA $00 $21
    ldh  a, [hEntityTilesLoadingStageA]           ;; 00:06FA $F0 $93
    ld   c, a                                     ;; 00:06FC $4F
    ld   b, $00                                   ;; 00:06FD $06 $00
    sla  c                                        ;; 00:06FF $CB $21
    rl   b                                        ;; 00:0701 $CB $10
    sla  c                                        ;; 00:0703 $CB $21
    rl   b                                        ;; 00:0705 $CB $10
    sla  c                                        ;; 00:0707 $CB $21
    rl   b                                        ;; 00:0709 $CB $10
    sla  c                                        ;; 00:070B $CB $21
    rl   b                                        ;; 00:070D $CB $10
    sla  c                                        ;; 00:070F $CB $21
    rl   b                                        ;; 00:0711 $CB $10
    sla  c                                        ;; 00:0713 $CB $21
    rl   b                                        ;; 00:0715 $CB $10
    ld   hl, NpcTilesDataStart                    ;; 00:0717 $21 $00 $40
    add  hl, bc                                   ;; 00:071A $09
    add  hl, de                                   ;; 00:071B $19
    push hl                                       ;; 00:071C $E5
    ld   a, [wEntityTilesSpriteslotIndexA]        ;; 00:071D $FA $97 $C1
    ld   d, a                                     ;; 00:0720 $57
    ld   hl, vTilesSpriteslots                    ;; 00:0721 $21 $00 $84
    add  hl, bc                                   ;; 00:0724 $09
    add  hl, de                                   ;; 00:0725 $19
    ld   e, l                                     ;; 00:0726 $5D
    ld   d, h                                     ;; 00:0727 $54
    pop  hl                                       ;; 00:0728 $E1
    ld   bc, $40                                  ;; 00:0729 $01 $40 $00
    call CopyData                                 ;; 00:072C $CD $14 $29

    ; Increment the loading stage
    ldh  a, [hEntityTilesLoadingStageA]           ;; 00:072F $F0 $93
    inc  a                                        ;; 00:0731 $3C
    ldh  [hEntityTilesLoadingStageA], a           ;; 00:0732 $E0 $93
    ; If the loading stage is >= $04, we're done
    cp   $04                                      ;; 00:0734 $FE $04
    jr   nz, .return                              ;; 00:0736 $20 $05

.clearEnemiesTilesLoadCommand
    xor  a                                        ;; 00:0738 $AF
    ldh  [hNeedsUpdatingEntityTilesA], a          ;; 00:0739 $E0 $91
    ldh  [hEntityTilesLoadingStageA], a           ;; 00:073B $E0 $93

.return
    ret                                           ;; 00:073D $C9

    ;
    ; Copy requested entity tiles to VRAM
    ; (Variant for wNeedsUpdatingEntityTilesB)
    ;

UpdateEntityTilesB::
    ld   a, [wEntityTilesSpriteslotIndexB]        ;; 00:073E $FA $0D $C1
    ld   e, a                                     ;; 00:0741 $5F
    ld   d, $00                                   ;; 00:0742 $16 $00
    ld   hl, wLoadedEntitySpritesheets            ;; 00:0744 $21 $93 $C1
    add  hl, de                                   ;; 00:0747 $19
    ld   a, [hl]                                  ;; 00:0748 $7E
    push af                                       ;; 00:0749 $F5
    and  $3F                                      ;; 00:074A $E6 $3F
    ld   d, a                                     ;; 00:074C $57
    ld   e, $00                                   ;; 00:074D $1E $00
    pop  af                                       ;; 00:074F $F1
    swap a                                        ;; 00:0750 $CB $37
    rra                                           ;; 00:0752 $1F
    rra                                           ;; 00:0753 $1F
    and  $03                                      ;; 00:0754 $E6 $03
    ld   c, a                                     ;; 00:0756 $4F
    ld   b, $00                                   ;; 00:0757 $06 $00
    ld   hl, NpcTilesBankTable                    ;; 00:0759 $21 $6F $2E
    add  hl, bc                                   ;; 00:075C $09
    ld   a, [hl]                                  ;; 00:075D $7E
    and  a                                        ;; 00:075E $A7
    jr   z, .jp_0764                              ;; 00:075F $28 $03
    call AdjustBankNumberForGBC                   ;; 00:0761 $CD $0B $0B
.jp_0764

    ld   [rSelectROMBank], a                      ;; 00:0764 $EA $00 $21
    ld   a, [wEntityTilesLoadingStageB]           ;; 00:0767 $FA $0F $C1
    ld   c, a                                     ;; 00:076A $4F
    ld   b, $00                                   ;; 00:076B $06 $00
    sla  c                                        ;; 00:076D $CB $21
    rl   b                                        ;; 00:076F $CB $10
    sla  c                                        ;; 00:0771 $CB $21
    rl   b                                        ;; 00:0773 $CB $10
    sla  c                                        ;; 00:0775 $CB $21
    rl   b                                        ;; 00:0777 $CB $10
    sla  c                                        ;; 00:0779 $CB $21
    rl   b                                        ;; 00:077B $CB $10
    sla  c                                        ;; 00:077D $CB $21
    rl   b                                        ;; 00:077F $CB $10
    sla  c                                        ;; 00:0781 $CB $21
    rl   b                                        ;; 00:0783 $CB $10
    ld   hl, NpcTilesDataStart                    ;; 00:0785 $21 $00 $40
    add  hl, bc                                   ;; 00:0788 $09
    add  hl, de                                   ;; 00:0789 $19
    push hl                                       ;; 00:078A $E5
    ld   a, [wEntityTilesSpriteslotIndexB]        ;; 00:078B $FA $0D $C1
    ld   d, a                                     ;; 00:078E $57
    ld   hl, vTilesSpriteslots                    ;; 00:078F $21 $00 $84
    add  hl, bc                                   ;; 00:0792 $09
    add  hl, de                                   ;; 00:0793 $19
    ld   e, l                                     ;; 00:0794 $5D
    ld   d, h                                     ;; 00:0795 $54
    pop  hl                                       ;; 00:0796 $E1
    ld   bc, $40                                  ;; 00:0797 $01 $40 $00
    call CopyData                                 ;; 00:079A $CD $14 $29

    ; Increment the loading stage
    ld   a, [wEntityTilesLoadingStageB]           ;; 00:079D $FA $0F $C1
    inc  a                                        ;; 00:07A0 $3C
    ; If the loading stage is >= $04, we're done
    ld   [wEntityTilesLoadingStageB], a           ;; 00:07A1 $EA $0F $C1
    cp   $04                                      ;; 00:07A4 $FE $04
    jr   nz, .return                              ;; 00:07A6 $20 $07
    xor  a                                        ;; 00:07A8 $AF
    ld   [wNeedsUpdatingEntityTilesB], a          ;; 00:07A9 $EA $0E $C1
    ld   [wEntityTilesLoadingStageB], a           ;; 00:07AC $EA $0F $C1
.return
    ret                                           ;; 00:07AF $C9

LoadInventorySirenInstruments::
    callsb LoadSirenInstruments                   ;; 00:07B0 $3E $01 $EA $00 $21 $CD $B5 $6B
    jp   CopyTilesToPieceOfHeartMeter.restoreBank0C ;; 00:07B8 $C3 $8B $00

; Data origin table (in bank $0C)
TilesGfxSource::
; Inventory icons for ocarina songs
._08 dw OcarinaSymbolsTiles                       ;; 00:07BB
._09 dw OcarinaSymbolsTiles + $40                 ;; 00:07BD
._0A dw OcarinaSymbolsTiles + $60                 ;; 00:07BF
; Shared GFX: shadows, explosions, etc.
._0B dw CharacterVfxTiles                         ;; 00:07C1
._0C dw CharacterVfxTiles + $40                   ;; 00:07C3
._0D dw CharacterVfxTiles + $60                   ;; 00:07C5

; Data destination table
TilesDestination::
._08 dw vTiles0 + $200                            ;; 00:07C7
._09 dw vTiles0 + $240                            ;; 00:07C9
._0A dw vTiles0 + $260                            ;; 00:07CB
._0B dw vTiles0 + $200                            ;; 00:07CD
._0C dw vTiles0 + $240                            ;; 00:07CF
._0D dw vTiles0 + $260                            ;; 00:07D1

; Execute tile loading commands 08 to OD.
;   08-0A: copy part of the ocarina inventory icon
;   0B-0D: copy part of the shared gfx
; The command is incremented at the end.
LoadBGTilesCommands8ToD::
    ; de = (a - 8) * 2
    sub  a, $08                                   ;; 00:07D3 $D6 $08
    sla  a                                        ;; 00:07D5 $CB $27
    ld   e, a                                     ;; 00:07D7 $5F
    ld   d, $00                                   ;; 00:07D8 $16 $00
    ; Data destination
    ld   hl, TilesGfxSource                       ;; 00:07DA $21 $BB $07
    add  hl, de                                   ;; 00:07DD $19
    push hl                                       ;; 00:07DE $E5
    ld   hl, TilesDestination                     ;; 00:07DF $21 $C7 $07
    add  hl, de                                   ;; 00:07E2 $19
    ld   e, [hl]                                  ;; 00:07E3 $5E
    inc  hl                                       ;; 00:07E4 $23
    ld   d, [hl]                                  ;; 00:07E5 $56
    ; Data origin
    pop  hl                                       ;; 00:07E6 $E1
    ld   a, [hli]                                 ;; 00:07E7 $2A
    ld   h, [hl]                                  ;; 00:07E8 $66
    ld   l, a                                     ;; 00:07E9 $6F
    ld   a, $0C                                   ;; 00:07EA $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:07EC $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:07EF $EA $00 $21
    ; Data length
    ld   bc, $40                                  ;; 00:07F2 $01 $40 $00
    call CopyData                                 ;; 00:07F5 $CD $14 $29

    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:07F8 $F0 $90
    cp   TILESET_LOAD_INVENTORY_SONG_3            ;; 00:07FA $FE $0A
    jr   z, .clearBGTilesFlag                     ;; 00:07FC $28 $0A
    cp   TILESET_LOAD_SHARED_GFX_3                ;; 00:07FE $FE $0D
    jr   z, .clearBGTilesFlag                     ;; 00:0800 $28 $06

    ; Increment BG Tiles flag
    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:0802 $F0 $90
    inc  a                                        ;; 00:0804 $3C
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0805 $E0 $90
    ret                                           ;; 00:0807 $C9

.clearBGTilesFlag
    xor  a                                        ;; 00:0808 $AF
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0809 $E0 $90
    ret                                           ;; 00:080B $C9
