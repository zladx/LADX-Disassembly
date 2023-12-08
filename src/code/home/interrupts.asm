;
; Interrupt handlers
;

IntroSeaScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the sea intro sequence.
    db $20, $30, $40, $60, 0 ; upper clouds, lower clouds, sea, upper waves, lower waves ; $037F

IntroBeachScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the beach intro sequence.
    db $30, $56, $68, 0 ; moutains, trees, beach, waves ; $0384

;
; InterruptLCDStatus
;
; Manipulate the Background's scrollX and scrollY value during mode 2 (Searching OAM-RAM),
; to create various effects like differential scrolling.
;

InterruptLCDStatus::
    di                                            ; $0388: $F3
    push af                                       ; $0389: $F5
    push hl                                       ; $038A: $E5
    push de                                       ; $038B: $D5
    push bc                                       ; $038C: $C5
    ldh  a, [rSVBK]  ; Save current WRAM Bank to c ; $038D: $F0 $70
    ld   c, a        ;                            ; $038F: $4F
    xor  a           ; Load WRAM Bank 1 (as "0" fallbacks to loading bank 1) ; $0390: $AF
    ldh  [rSVBK], a  ;                            ; $0391: $E0 $70
    ld   a, [wGameplayType]                       ; $0393: $FA $95 $DB
    cp   GAMEPLAY_CREDITS ; if GameplayType != GAMEPLAY_CREDITS ; $0396: $FE $01
    jr   nz, .skipScrollY                         ; $0398: $20 $13
    ; GameplayType == CREDITS
    ld   a, [wGameplaySubtype]                    ; $039A: $FA $96 $DB
    cp   $05 ; if GameplaySubtype != 5            ; $039D: $FE $05
    jr   nz, .setStandardScrollY                  ; $039F: $20 $05
    ; GameplaySubtype == 5
    ld   a, [wIsFileSelectionArrowShifted]  ; override scrollY with WRA1:wIsFileSelectionArrowShifted value ; $03A1: $FA $00 $D0
    jr   .setScrollY                              ; $03A4: $18 $02

.setStandardScrollY
    ; Set standard scrollY, without specific offset
    ldh  a, [hBaseScrollY]                        ; $03A6: $F0 $97

.setScrollY
    ldh  [rSCY], a ; scrollY                      ; $03A8: $E0 $42
    jp   .clearBGTilesFlag                        ; $03AA: $C3 $FF $03

.skipScrollY
    cp   GAMEPLAY_INTRO    ; if not during the introduction sequence ; $03AD: $FE $00
    jr   nz, .clearScrollX  ;   skip              ; $03AF: $20 $4B
    ; GameplayType == INTRO
    ; Apply differential scrolling to each section:
    ; load and apply the scrollX offset for the current screen section being drawn
    ld   a, [wLCDSectionIndex]                    ; $03B1: $FA $05 $C1
    ld   e, a             ; hl = ScrollXOffsetForSection + LCDSectionIndex ; $03B4: $5F
    ld   d, $00           ;                       ; $03B5: $16 $00
    ld   hl, wScrollXOffsetForSection             ; $03B7: $21 $00 $C1
    add  hl, de           ;                       ; $03BA: $19
    ld   a, [hl]                                  ; $03BB: $7E
    ld   hl, hBaseScrollX ; a = hBaseScrollX + [hl] ; $03BC: $21 $96 $FF
    add  a, [hl]                                  ; $03BF: $86
    ldh  [rSCX], a        ; set scrollX           ; $03C0: $E0 $43
    ld   a, [wGameplaySubtype]                    ; $03C2: $FA $96 $DB
    cp   $06  ; if GameplaySubtype < 6 (intro sea) ; $03C5: $FE $06
    jr   c, .setupNextInterruptForIntroSea        ; $03C7: $38 $10
    ; If TransitionCounter >= 6 (intro beach),
    ; setup next interrupt for the beach sequence
    ld   hl, IntroBeachScreenSections             ; $03C9: $21 $84 $03
    add  hl, de        ; hl = ScreenSectionsTable + SectionIndex ; $03CC: $19
    ld   a, [hl]       ;                          ; $03CD: $7E
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section ; $03CE: $E0 $45
    ld   a, e          ; a = SectionIndex + 1     ; $03D0: $7B
    inc  a             ;                          ; $03D1: $3C
    and  $03           ; a = a % 4                ; $03D2: $E6 $03
    ld   [wLCDSectionIndex], a ; save SectionIndex ; $03D4: $EA $05 $C1
    jr   .clearBGTilesFlag                        ; $03D7: $18 $26

.setupNextInterruptForIntroSea
    ld   hl, IntroSeaScreenSections               ; $03D9: $21 $7F $03
    add  hl, de        ; hl = LCDScreenSectionsTable + SectionIndex ; $03DC: $19
    ld   a, [hl]       ;                          ; $03DD: $7E
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section ; $03DE: $E0 $45
    ld   a, e          ; a = SectionIndex + 1     ; $03E0: $7B
    inc  a             ;                          ; $03E1: $3C
    cp   $05           ; if SectionIndex != 5     ; $03E2: $FE $05
    jr   nz, .skipResetSectionIndex ; skip        ; $03E4: $20 $01
    ; If SectionIndex reached 5, reset it to 0
    xor  a             ; a = 0                    ; $03E6: $AF

.skipResetSectionIndex
    ld   [wLCDSectionIndex], a ; save SectionIndex ; $03E7: $EA $05 $C1
    nop                                           ; $03EA: $00
    cp   $04           ; if SectionIndex != 4     ; $03EB: $FE $04
    jr   nz, .clearBGTilesFlag ; skip             ; $03ED: $20 $10
    ; If we are drawing the last section (4)
    ld   a, [wIntroBGYOffset] ; Apply the Y offset to compensate for sea vertical movement ; $03EF: $FA $06 $C1
    ldh  [rSCY], a               ; (so that the horizon position stays constant). ; $03F2: $E0 $42
    cpl                ; a = $FF - a + $61        ; $03F4: $2F
    inc  a             ;                          ; $03F5: $3C
    add  a, $60        ;                          ; $03F6: $C6 $60
    ldh  [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next transition step ; $03F8: $E0 $45
    jr   .clearBGTilesFlag                        ; $03FA: $18 $03

.clearScrollX
    xor  a                                        ; $03FC: $AF
    ldh  [rSCX], a ; scrollX                      ; $03FD: $E0 $43

.clearBGTilesFlag
    ; Restore banks and register
    ld   a, c                                     ; $03FF: $79
    ldh  [rSVBK], a                               ; $0400: $E0 $70
    pop  bc                                       ; $0402: $C1
    pop  de                                       ; $0403: $D1
    pop  hl                                       ; $0404: $E1
    pop  af                                       ; $0405: $F1
    ei                                            ; $0406: $FB
    reti                                          ; $0407: $D9

;
; InterruptSerial
;
; Dispatches to the Game Boy Printer routines.
;

InterruptSerial::
    push af                                       ; $0408: $F5
    callsb PrinterInterruptSerial                 ; $0409: $3E $28 $EA $00 $21 $CD $01 $46
    ld   a, [wCurrentBank]                        ; $0411: $FA $AF $DB
    ld   [rSelectROMBank], a                      ; $0414: $EA $00 $21
    pop  af                                       ; $0417: $F1
    reti                                          ; $0418: $D9

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
    ld   a, [wTilesetToLoad]                      ; $0419: $FA $FE $D6
    and  a                                        ; $041C: $A7
    jr   z, .loadBGMap                            ; $041D: $28 $1B

    ;
    ; Copy the requested tileset to VRAM
    ;

    ; Copy tile map number to the palette-loading variable
    ld   [wPaletteToLoadForTileMap], a            ; $041F: $EA $D2 $DD

    ; if wTilesetToLoad != TILESET_THANKS_FOR_PLAYING, turn off LCD
    cp   TILESET_THANKS_FOR_PLAYING               ; $0422: $FE $23
    jr   z, .LCDOffEnd                            ; $0424: $28 $05
    push af                                       ; $0426: $F5
    call LCDOff                                   ; $0427: $CD $CF $28
    pop  af                                       ; $042A: $F1
.LCDOffEnd

    call .executeTilesetLoadHandler               ; $042B: $CD $30 $04
    jr   .clearFlagsAndReturn                     ; $042E: $18 $2D

.executeTilesetLoadHandler
    ld   e, a                                     ; $0430: $5F
    callsb GetTilesetHandlerAddress               ; $0431: $3E $20 $EA $00 $21 $CD $57 $46
    ; Jump to the tilemap loading handler and return
    jp   hl                                       ; $0439: $E9

.loadBGMap

    ;
    ; No tileset to load:
    ; copy the requested BG map and attributes to VRAM
    ;

    call LCDOff                                   ; $043A: $CD $CF $28
    callsb LoadBGMapAttributes                    ; $043D: $3E $24 $EA $00 $21 $CD $2C $5C

    ; Read and execute a wDrawCommand for loading wBGMapToLoad.
    callsb GetBGCopyRequest                       ; $0445: $3E $20 $EA $00 $21 $CD $77 $45
    ld   a, BANK(BGTilemaps)                      ; $044D: $3E $08
    ld   [rSelectROMBank], a                      ; $044F: $EA $00 $21
    call ExecuteDrawCommands.noRoomTransition     ; $0452: $CD $2D $29

    ; Restore tilesets bank
    ld   a, $0C                                   ; $0455: $3E $0C
    call AdjustBankNumberForGBC                   ; $0457: $CD $0B $0B
    ld   [rSelectROMBank], a                      ; $045A: $EA $00 $21

.clearFlagsAndReturn
    xor  a                                        ; $045D: $AF
    ld   [wBGMapToLoad], a                        ; $045E: $EA $FF $D6
    ld   [wTilesetToLoad], a                      ; $0461: $EA $FE $D6
    ld   a, [wLCDControl]                         ; $0464: $FA $FD $D6
    ldh  [rLCDC], a                               ; $0467: $E0 $40
.return
    ret                                           ; $0469: $C9

; Animation stage to update the tiles of each kind of switch block in
; their final state.
; Indexed by hSwitchBlockNeedingUpdate
;
; See wSwitchableObjectAnimationStage
BlockUpdateAnimationStageTable:: ; $046A
.kindA db 07
.kindB db 09

;
; InterruptVBlank
;
; Load tiles and map data in the background, and handle photo album effects.
;

InterruptVBlank::
    push af                                       ; $046C: $F5
    push bc                                       ; $046D: $C5
    push de                                       ; $046E: $D5
    push hl                                       ; $046F: $E5

    ; Save the current RAM bank, and switch to RAM0
    ldh  a, [rSVBK]                               ; $0470: $F0 $70
    and  $07                                      ; $0472: $E6 $07
    ld   c, a                                     ; $0474: $4F
    xor  a                                        ; $0475: $AF
    ldh  [rSVBK], a                               ; $0476: $E0 $70
    push bc                                       ; $0478: $C5

    di                                            ; $0479: $F3

    ;
    ; Photo Album handling
    ;
    ld   a, [wGameplayType]                       ; $047A: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ; $047D: $FE $0D
    jr   nz, .photoAlbumEnd                       ; $047F: $20 $0C
    ; GameplayType == PHOTO_ALBUM
    ld   a, [wGameplaySubtype]                    ; $0481: $FA $96 $DB
    cp   $09                                      ; $0484: $FE $09
    jr   c, .photoAlbumEnd                        ; $0486: $38 $05
    cp   $12                                      ; $0488: $FE $12
    jp  c, PhotoAlbumVBlankHandler                ; $048A: $DA $77 $05
.photoAlbumEnd

    ;
    ; If the next frame is still being rendered, drop this frame.
    ;
    ldh  a, [hIsRenderingFrame]                   ; $048D: $F0 $FD
    and  a                                        ; $048F: $A7
    jp   nz, .vblankDone                          ; $0490: $C2 $69 $05

    ;
    ; Dialog handling
    ;
    ld   a, [wDialogState]                        ; $0493: $FA $9F $C1
    and  ~DIALOG_BOX_BOTTOM_FLAG ; If dialog is closed ; $0496: $E6 $7F
    jr   z, .dialogEnd                            ; $0498: $28 $32
    cp   DIALOG_OPENING_1                         ; $049A: $FE $01
    jr   z, .dialogEnd                            ; $049C: $28 $2E
    cp   DIALOG_OPENING_5  ; If DialogState > 5   ; $049E: $FE $05
    jr   nc, .renderDialogText                    ; $04A0: $30 $0A
    ; DialogState < 5
    ; Open dialog
    call func_23E4                                ; $04A2: $CD $E4 $23
    ld   hl, wDialogState                         ; $04A5: $21 $9F $C1
    inc  [hl]  ; Increment DialogState            ; $04A8: $34
    jp   .vblankDone                              ; $04A9: $C3 $69 $05

.renderDialogText

    cp   DIALOG_SCROLLING_1                       ; $04AC: $FE $0A
    jr   nz, .dialogScrolling1End                 ; $04AE: $20 $06
    ; DialogState == Scrolling1
    call DialogBeginScrolling                     ; $04B0: $CD $19 $27
    jp   .vblankDone                              ; $04B3: $C3 $69 $05
.dialogScrolling1End

    cp   DIALOG_SCROLLING_2                       ; $04B6: $FE $0B
    jr   nz, .dialogEnd                           ; $04B8: $20 $12
    ; DialogState == Scrolling2
    ld   a, [wDialogScrollDelay]                  ; $04BA: $FA $72 $C1
    and  a  ; if DialogScrollDelay == 0           ; $04BD: $A7
    jr   z, .dialogFinishScrolling                ; $04BE: $28 $06
    ; DialogScrollDelay > 0
    dec  a  ; decrement the delay                 ; $04C0: $3D
    ld   [wDialogScrollDelay], a                  ; $04C1: $EA $72 $C1
    jr   .dialogEnd                               ; $04C4: $18 $06

.dialogFinishScrolling
    call DialogFinishScrolling                    ; $04C6: $CD $6D $27
    jp   .vblankDone                              ; $04C9: $C3 $69 $05
.dialogEnd

    ;
    ; Photo Picture handling
    ;
    ld   a, [wGameplayType]                       ; $04CC: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_DIZZY_LINK  ; If GameplayType < Photo Picture ; $04CF: $FE $0E
    jr   c, .gameplayNotAPhoto                    ; $04D1: $38 $11
    ; GameplayType is one of the Pictures
    ld   a, [wGameplaySubtype]                    ; $04D3: $FA $96 $DB
    cp   $06                                      ; $04D6: $FE $06
    jr   c, .animateTilesEnd                      ; $04D8: $38 $51
    callsb func_038_785A                          ; $04DA: $3E $38 $EA $00 $21 $CD $5A $78
    jr   .animateTilesEnd                         ; $04E2: $18 $47
.gameplayNotAPhoto

    ;
    ; Standard gameplay (i.e. not Photos) handling
    ;

    ; If there's a tileset to load, it will be handled when returning
    ; to the main game loop. Exit now.
    ld   a, [wTilesetToLoad]                      ; $04E4: $FA $FE $D6
    and  a                                        ; $04E7: $A7
    jr   nz, .vblankDone                          ; $04E8: $20 $7F

    ; If NeedsUpdatingBGTiles or NeedsUpdatingEnnemiesTiles or NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]               ; $04EA: $F0 $90
    ldh  [hMultiPurposeG], a                      ; $04EC: $E0 $E8
    ld   hl, hNeedsUpdatingEntityTilesA           ; $04EE: $21 $91 $FF
    or   [hl]                                     ; $04F1: $B6
    ld   hl, wNeedsUpdatingEntityTilesB           ; $04F2: $21 $0E $C1
    or   [hl]                                     ; $04F5: $B6
    jr   z, .noTilesToUpdate                      ; $04F6: $28 $11

    ; Load tiles (?)
    call LoadTiles                                ; $04F8: $CD $BC $05

    ; If hNeedsUpdatingBGTiles >= 8, skip drawing of Link sprite
    ldh  a, [hMultiPurposeG]                      ; $04FB: $F0 $E8
    cp   $08                                      ; $04FD: $FE $08
    jr   nc, .drawLinkSpriteEnd                   ; $04FF: $30 $03
.drawLinkSprite
    call DrawLinkSprite                           ; $0501: $CD $2E $1D
.drawLinkSpriteEnd

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine                              ; $0504: $CD $C0 $FF
    ; And we're clearBGTilesFlag.
    jr   .vblankDone                              ; $0507: $18 $60

.noTilesToUpdate
    ; Otherwise, when there are not tiles to update, we can perform a bit
    ; more GFX code – like animating the tiles and palettes.

    ;
    ; Update tiles for switch blocks
    ;

    ; If switch block tiles don't need to be updated, move on
    ldh  a, [hSwitchBlockNeedingUpdate]           ; $0509: $F0 $BB
    and  a                                        ; $050B: $A7
    jr   z, .switchBlockEnd                       ; $050C: $28 $13

    ; Decrement hSwitchBlockNeedingUpdate
    ;
    ; This means it will go either:
    ; - from 2 to 1 (so that next step is updating blocks of kind B)
    ; - from 1 to 0 (so that next step is updating blocks of kind A)
    dec  a                                        ; $050E: $3D
    ldh  [hSwitchBlockNeedingUpdate], a           ; $050F: $E0 $BB

    ; wSwitchableObjectAnimationStage = BlockUpdateAnimationStageTable[hSwitchBlockNeedingUpdate]
    ld   e, a                                     ; $0511: $5F
    ld   d, $00                                   ; $0512: $16 $00
    ld   hl, BlockUpdateAnimationStageTable       ; $0514: $21 $6A $04
    add  hl, de                                   ; $0517: $19
    ld   a, [hl]                                  ; $0518: $7E
    ; Store the stage to wSwitchableObjectAnimationStage
    ld   [wSwitchableObjectAnimationStage], a     ; $0519: $EA $F8 $D6

    call UpdateSwitchBlockTiles                   ; $051C: $CD $D7 $1E

    jr   .drawLinkSprite                          ; $051F: $18 $E0
.switchBlockEnd

    ; If GameplayType != PHOTO_ALBUM, animate tiles
    ld   a, [wGameplayType]                       ; $0521: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ; $0524: $FE $0D
    jr   z, .animateTilesEnd                      ; $0526: $28 $03
    call AnimateTiles                             ; $0528: $CD $0D $1B
.animateTilesEnd

    ldh  a, [hIsGBC]                              ; $052B: $F0 $FE
    and  a                                        ; $052D: $A7
    jr   z, .gbcEnd                               ; $052E: $28 $08
    ; Change BG column palette
    callsb ChangeBGColumnPalette                  ; $0530: $3E $24 $EA $00 $21 $CD $1A $5C
.gbcEnd

    ld   de, wDrawCommand                         ; $0538: $11 $01 $D6
    call ExecuteDrawCommands; Load BG column tiles ; $053B: $CD $27 $29
    xor  a                                        ; $053E: $AF
    ld   [wDrawCommandsSize], a                   ; $053F: $EA $00 $D6
    ld   [wDrawCommand], a                        ; $0542: $EA $01 $D6
    ld   [wDrawCommandsAltSize], a                ; $0545: $EA $90 $DC
    ld   [wDrawCommandAlt], a                     ; $0548: $EA $91 $DC

    ; On Overworld, copy some palette data to OAM buffer
    callsb func_036_72BA                          ; $054B: $3E $36 $EA $00 $21 $CD $BA $72

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine                              ; $0553: $CD $C0 $FF

    ; On GBC, copy palettes to VRAM
    ldh  a, [hIsGBC]                              ; $0556: $F0 $FE
    and  a                                        ; $0558: $A7
    jr   z, .vblankDone                           ; $0559: $28 $0E
    callsb CopyPalettesToVRAM                     ; $055B: $3E $21 $EA $00 $21 $CD $00 $40
    ld   a, [wCurrentBank]                        ; $0563: $FA $AF $DB
    ld   [rSelectROMBank], a                      ; $0566: $EA $00 $21

.vblankDone
    ei                                            ; $0569: $FB
.vblankDoneInterruptsEnabled
    ; Restore the RAM bank
    pop  bc                                       ; $056A: $C1
    ld   a, c                                     ; $056B: $79
    ldh  [rSVBK], a                               ; $056C: $E0 $70

    ; Restore registers
    pop  hl                                       ; $056E: $E1
    pop  de                                       ; $056F: $D1
    pop  bc                                       ; $0570: $C1

    ld   a, TRUE                                  ; $0571: $3E $01
    ldh  [hNeedsRenderingFrame], a                ; $0573: $E0 $D1

    pop  af                                       ; $0575: $F1
    reti                                          ; $0576: $D9

PhotoAlbumVBlankHandler::
    ld   a, [wCurrentBank]                        ; $0577: $FA $AF $DB
    push af                                       ; $057A: $F5
    ldh  a, [hIsRenderingFrame]                   ; $057B: $F0 $FD
    and  a                                        ; $057D: $A7
    jr   nz, .clearBGTilesFlag                    ; $057E: $20 $2B

    call hDMARoutine                              ; $0580: $CD $C0 $FF

    ldh  a, [hIsGBC]                              ; $0583: $F0 $FE
    and  a                                        ; $0585: $A7
    jr   z, .gbcEnd                               ; $0586: $28 $10
    callsw CopyPalettesToVRAM                     ; $0588: $3E $21 $CD $0C $08 $CD $00 $40
    callsw ChangeBGColumnPalette                  ; $0590: $3E $24 $CD $0C $08 $CD $1A $5C
.gbcEnd

    ld   de, wDrawCommand                         ; $0598: $11 $01 $D6
    call ExecuteDrawCommands                      ; $059B: $CD $27 $29
    xor  a                                        ; $059E: $AF
    ld   [wDrawCommandsSize], a                   ; $059F: $EA $00 $D6
    ld   [wDrawCommand], a                        ; $05A2: $EA $01 $D6
    ld   [wDrawCommandsAltSize], a                ; $05A5: $EA $90 $DC
    ld   [wDrawCommandAlt], a                     ; $05A8: $EA $91 $DC

.clearBGTilesFlag
    callsw PrinterInterruptVBlank                 ; $05AB: $3E $28 $CD $0C $08 $CD $16 $46
    pop  af                                       ; $05B3: $F1
    ld   [wCurrentBank], a                        ; $05B4: $EA $AF $DB
    ld   [rSelectROMBank], a                      ; $05B7: $EA $00 $21
    jr   InterruptVBlank.vblankDoneInterruptsEnabled ; $05BA: $18 $AE

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
    ldh  a, [hNeedsUpdatingBGTiles]               ; $05BC: $F0 $90
    and  a                                        ; $05BE: $A7
    jp   z, LoadEntityTiles                       ; $05BF: $CA $9E $06

    cp   TILESET_LOAD_INVENTORY                   ; $05C2: $FE $07
    jp   z, LoadInventorySirenInstruments         ; $05C4: $CA $B0 $07
    cp   TILESET_LOAD_PIECE_OF_HEART_1            ; $05C7: $FE $03
    jp   z, LoadPieceOfHeartMeterTiles1           ; $05C9: $CA $62 $00
    cp   TILESET_LOAD_PIECE_OF_HEART_2            ; $05CC: $FE $04
    jp   z, LoadPieceOfHeartMeterTiles2           ; $05CE: $CA $6A $00
    cp   TILESET_CLEAR_PIECE_OF_HEART_1           ; $05D1: $FE $05
    jp   z, ClearPieceOfHeartMeterTiles1          ; $05D3: $CA $72 $00
    cp   TILESET_CLEAR_PIECE_OF_HEART_2           ; $05D6: $FE $06
    jp   z, ClearPieceOfHeartMeterTiles2          ; $05D8: $CA $7A $00
    cp   TILESET_LOAD_INVENTORY_SONG_1            ; $05DB: $FE $08
    jp   nc, LoadBGTilesCommands8ToD              ; $05DD: $D2 $D3 $07

    ld   a, [wIsIndoor]                           ; $05E0: $FA $A5 $DB
    and  a                                        ; $05E3: $A7
IF __OPTIMIZATIONS_1__
    jr   z, LoadOverworldBGTiles
ELSE
    jp   z, LoadOverworldBGTiles                  ; $05E4: $CA $56 $06
ENDC
    ldh  a, [hNeedsUpdatingBGTiles]               ; $05E7: $F0 $90
    cp   TILESET_LOAD_DUNGEON_MINIMAP             ; $05E9: $FE $02
    jp   z, LoadDungeonMinimapTiles               ; $05EB: $CA $26 $08

    ld   a, BANK(IndoorTiles)                     ; $05EE: $3E $0D
    call AdjustBankNumberForGBC                   ; $05F0: $CD $0B $0B
    ld   [rSelectROMBank], a                      ; $05F3: $EA $00 $21
    ldh  a, [hBGTilesLoadingStage]                ; $05F6: $F0 $92
    ld   c, a                                     ; $05F8: $4F
    ld   b, $00                                   ; $05F9: $06 $00
    sla  c                                        ; $05FB: $CB $21
    rl   b                                        ; $05FD: $CB $10
    sla  c                                        ; $05FF: $CB $21
    rl   b                                        ; $0601: $CB $10
    sla  c                                        ; $0603: $CB $21
    rl   b                                        ; $0605: $CB $10
    sla  c                                        ; $0607: $CB $21
    rl   b                                        ; $0609: $CB $10
    sla  c                                        ; $060B: $CB $21
    rl   b                                        ; $060D: $CB $10
    sla  c                                        ; $060F: $CB $21
    rl   b                                        ; $0611: $CB $10
    ld   hl, $9000                                ; $0613: $21 $00 $90
    add  hl, bc                                   ; $0616: $09
    ld   e, l                                     ; $0617: $5D
    ld   d, h                                     ; $0618: $54
    ld   hl, IndoorTiles                          ; $0619: $21 $00 $50

    ldh  a, [hMapId]                              ; $061C: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $061E: $FE $FF
    jr   nz, .colorDungeonEnd                     ; $0620: $20 $0D
    callsb GetColorDungeonTilesAddress            ; $0622: $3E $20 $EA $00 $21 $CD $16 $46
    ld   [rSelectROMBank], a                      ; $062A: $EA $00 $21
    jr   .copyData                                ; $062D: $18 $12
.colorDungeonEnd

    ldh  a, [hWorldTileset]                       ; $062F: $F0 $94
    add  a, $50                                   ; $0631: $C6 $50
    ld   h, a                                     ; $0633: $67
    add  hl, bc                                   ; $0634: $09

    ldh  a, [hSwitchBlockNeedingUpdate]           ; $0635: $F0 $BB
    and  a                                        ; $0637: $A7
    jr   z, .copyData                             ; $0638: $28 $07
    ldh  a, [hBGTilesLoadingStage]                ; $063A: $F0 $92
    dec  a                                        ; $063C: $3D
    cp   $02                                      ; $063D: $FE $02
    jr   c, .incrementBGTileLoadingStage          ; $063F: $38 $06
.copyData

    ld   bc, $40                                  ; $0641: $01 $40 $00
    call CopyData                                 ; $0644: $CD $14 $29

.incrementBGTileLoadingStage
    ldh  a, [hBGTilesLoadingStage]                ; $0647: $F0 $92
    inc  a                                        ; $0649: $3C
    ldh  [hBGTilesLoadingStage], a                ; $064A: $E0 $92
    cp   $04                                      ; $064C: $FE $04
    jr   nz, .return                              ; $064E: $20 $05
    xor  a                                        ; $0650: $AF
    ldh  [hNeedsUpdatingBGTiles], a               ; $0651: $E0 $90
    ldh  [hBGTilesLoadingStage], a                ; $0653: $E0 $92

.return
    ret                                           ; $0655: $C9

LoadOverworldBGTiles::
    ld   a, BANK(Overworld2Tiles)                 ; $0656: $3E $0F
    call AdjustBankNumberForGBC                   ; $0658: $CD $0B $0B
    ld   [rSelectROMBank], a                      ; $065B: $EA $00 $21
    ; de = vTiles2 + [hBGTilesLoadingStage] * 6
    ldh  a, [hBGTilesLoadingStage]                ; $065E: $F0 $92
    ld   c, a                                     ; $0660: $4F
    ld   b, $00                                   ; $0661: $06 $00
    sla  c                                        ; $0663: $CB $21
    rl   b                                        ; $0665: $CB $10
    sla  c                                        ; $0667: $CB $21
    rl   b                                        ; $0669: $CB $10
    sla  c                                        ; $066B: $CB $21
    rl   b                                        ; $066D: $CB $10
    sla  c                                        ; $066F: $CB $21
    rl   b                                        ; $0671: $CB $10
    sla  c                                        ; $0673: $CB $21
    rl   b                                        ; $0675: $CB $10
    sla  c                                        ; $0677: $CB $21
    rl   b                                        ; $0679: $CB $10
    ld   hl, vTiles2                              ; $067B: $21 $00 $90
    add  hl, bc                                   ; $067E: $09
    ld   e, l                                     ; $067F: $5D
    ld   d, h                                     ; $0680: $54

    ldh  a, [hWorldTileset]                       ; $0681: $F0 $94
    add  a, $40                                   ; $0683: $C6 $40
    ld   h, a                                     ; $0685: $67
    ld   l, $00                                   ; $0686: $2E $00
    add  hl, bc                                   ; $0688: $09
    ld   bc, TILE_SIZE * $4                       ; $0689: $01 $40 $00
    call CopyData                                 ; $068C: $CD $14 $29

    ; Increment the loading stage
    ldh  a, [hBGTilesLoadingStage]                ; $068F: $F0 $92
    inc  a                                        ; $0691: $3C
    ldh  [hBGTilesLoadingStage], a                ; $0692: $E0 $92
    ; If the loading stage >= $08, we're clearBGTilesFlag
    cp   $08                                      ; $0694: $FE $08
    jr   nz, .return                              ; $0696: $20 $05
    xor  a                                        ; $0698: $AF
    ldh  [hNeedsUpdatingBGTiles], a               ; $0699: $E0 $90
    ldh  [hBGTilesLoadingStage], a                ; $069B: $E0 $92
.return
    ret                                           ; $069D: $C9

LoadEntityTiles::
    ; If on GBC and inside the Color Dungeon…
    ldh  a, [hIsGBC]                              ; $069E: $F0 $FE
    and  a                                        ; $06A0: $A7
    jr   z, .colorDungeonEnd                      ; $06A1: $28 $28
    ldh  a, [hMapId]                              ; $06A3: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $06A5: $FE $FF
    jr   nz, .colorDungeonEnd                     ; $06A7: $20 $22
    ; … skip the defined commands, and load hardcoded titles
    ; for the Color Dungeon objects and entities.
    callsb LoadColorDungeonTiles                  ; $06A9: $3E $20 $EA $00 $21 $CD $5A $47
    xor  a                                        ; $06B1: $AF
    ld   [wNeedsUpdatingEntityTilesB], a          ; $06B2: $EA $0E $C1
    ld   [wEntityTilesLoadingStageB], a           ; $06B5: $EA $0F $C1
    ld   hl, vTiles2                              ; $06B8: $21 $00 $90
    ld   bc, $00                                  ; $06BB: $01 $00 $00
    call GetColorDungeonTilesAddress              ; $06BE: $CD $16 $46
    ld   c, $90                                   ; $06C1: $0E $90
    ld   b, h                                     ; $06C3: $44
    ld   h, $00                                   ; $06C4: $26 $00
    call CopyDataToVRAM                           ; $06C6: $CD $13 $0A
    jr   .clearEnemiesTilesLoadCommand            ; $06C9: $18 $6D
.colorDungeonEnd

    ;
    ; Copy requested entity tiles to VRAM
    ; (Variant for hNeedsUpdatingEntityTilesA)
    ;

    ; If hNeedsUpdatingEntityTilesA is empty,
    ; use wNeedsUpdatingEntityTilesB.
    ldh  a, [hNeedsUpdatingEntityTilesA]          ; $06CB: $F0 $91
    and  a                                        ; $06CD: $A7
IF __OPTIMIZATIONS_1__
    jr   z, UpdateEntityTilesB
ELSE
    jp   z, UpdateEntityTilesB                    ; $06CE: $CA $3E $07
ENDC
    ld   a, [wEntityTilesSpriteslotIndexA]        ; $06D1: $FA $97 $C1
    ld   e, a                                     ; $06D4: $5F
    ld   d, $00                                   ; $06D5: $16 $00

    ld   hl, wLoadedEntitySpritesheets            ; $06D7: $21 $93 $C1
    add  hl, de                                   ; $06DA: $19
    ld   a, [hl]                                  ; $06DB: $7E
    push af                                       ; $06DC: $F5
    and  $3F                                      ; $06DD: $E6 $3F
    ld   d, a                                     ; $06DF: $57
    ld   e, $00                                   ; $06E0: $1E $00
    pop  af                                       ; $06E2: $F1
    swap a                                        ; $06E3: $CB $37
    rra                                           ; $06E5: $1F
    rra                                           ; $06E6: $1F
    and  $03                                      ; $06E7: $E6 $03
    ld   c, a                                     ; $06E9: $4F
    ld   b, $00                                   ; $06EA: $06 $00
    ld   hl, NpcTilesBankTable                    ; $06EC: $21 $6F $2E
    add  hl, bc                                   ; $06EF: $09
    ld   a, [hl]                                  ; $06F0: $7E
    and  a                                        ; $06F1: $A7
    jr   z, .adjustBankEnd                        ; $06F2: $28 $03
    call AdjustBankNumberForGBC                   ; $06F4: $CD $0B $0B
.adjustBankEnd

    ld   [rSelectROMBank], a                      ; $06F7: $EA $00 $21
    ldh  a, [hEntityTilesLoadingStageA]           ; $06FA: $F0 $93
    ld   c, a                                     ; $06FC: $4F
    ld   b, $00                                   ; $06FD: $06 $00
    sla  c                                        ; $06FF: $CB $21
    rl   b                                        ; $0701: $CB $10
    sla  c                                        ; $0703: $CB $21
    rl   b                                        ; $0705: $CB $10
    sla  c                                        ; $0707: $CB $21
    rl   b                                        ; $0709: $CB $10
    sla  c                                        ; $070B: $CB $21
    rl   b                                        ; $070D: $CB $10
    sla  c                                        ; $070F: $CB $21
    rl   b                                        ; $0711: $CB $10
    sla  c                                        ; $0713: $CB $21
    rl   b                                        ; $0715: $CB $10
    ld   hl, NpcTilesDataStart                    ; $0717: $21 $00 $40
    add  hl, bc                                   ; $071A: $09
    add  hl, de                                   ; $071B: $19
    push hl                                       ; $071C: $E5
    ld   a, [wEntityTilesSpriteslotIndexA]        ; $071D: $FA $97 $C1
    ld   d, a                                     ; $0720: $57
    ld   hl, vTilesSpriteslots                    ; $0721: $21 $00 $84
    add  hl, bc                                   ; $0724: $09
    add  hl, de                                   ; $0725: $19
    ld   e, l                                     ; $0726: $5D
    ld   d, h                                     ; $0727: $54
    pop  hl                                       ; $0728: $E1
    ld   bc, $40                                  ; $0729: $01 $40 $00
    call CopyData                                 ; $072C: $CD $14 $29

    ; Increment the loading stage
    ldh  a, [hEntityTilesLoadingStageA]           ; $072F: $F0 $93
    inc  a                                        ; $0731: $3C
    ldh  [hEntityTilesLoadingStageA], a           ; $0732: $E0 $93
    ; If the loading stage is >= $04, we're done
    cp   $04                                      ; $0734: $FE $04
    jr   nz, .return                              ; $0736: $20 $05

.clearEnemiesTilesLoadCommand
    xor  a                                        ; $0738: $AF
    ldh  [hNeedsUpdatingEntityTilesA], a          ; $0739: $E0 $91
    ldh  [hEntityTilesLoadingStageA], a           ; $073B: $E0 $93

.return
    ret                                           ; $073D: $C9

    ;
    ; Copy requested entity tiles to VRAM
    ; (Variant for wNeedsUpdatingEntityTilesB)
    ;

UpdateEntityTilesB::
    ld   a, [wEntityTilesSpriteslotIndexB]        ; $073E: $FA $0D $C1
    ld   e, a                                     ; $0741: $5F
    ld   d, $00                                   ; $0742: $16 $00
    ld   hl, wLoadedEntitySpritesheets            ; $0744: $21 $93 $C1
    add  hl, de                                   ; $0747: $19
    ld   a, [hl]                                  ; $0748: $7E
    push af                                       ; $0749: $F5
    and  $3F                                      ; $074A: $E6 $3F
    ld   d, a                                     ; $074C: $57
    ld   e, $00                                   ; $074D: $1E $00
    pop  af                                       ; $074F: $F1
    swap a                                        ; $0750: $CB $37
    rra                                           ; $0752: $1F
    rra                                           ; $0753: $1F
    and  $03                                      ; $0754: $E6 $03
    ld   c, a                                     ; $0756: $4F
    ld   b, $00                                   ; $0757: $06 $00
    ld   hl, NpcTilesBankTable                    ; $0759: $21 $6F $2E
    add  hl, bc                                   ; $075C: $09
    ld   a, [hl]                                  ; $075D: $7E
    and  a                                        ; $075E: $A7
    jr   z, .jp_0764                              ; $075F: $28 $03
    call AdjustBankNumberForGBC                   ; $0761: $CD $0B $0B
.jp_0764

    ld   [rSelectROMBank], a                      ; $0764: $EA $00 $21
    ld   a, [wEntityTilesLoadingStageB]           ; $0767: $FA $0F $C1
    ld   c, a                                     ; $076A: $4F
    ld   b, $00                                   ; $076B: $06 $00
    sla  c                                        ; $076D: $CB $21
    rl   b                                        ; $076F: $CB $10
    sla  c                                        ; $0771: $CB $21
    rl   b                                        ; $0773: $CB $10
    sla  c                                        ; $0775: $CB $21
    rl   b                                        ; $0777: $CB $10
    sla  c                                        ; $0779: $CB $21
    rl   b                                        ; $077B: $CB $10
    sla  c                                        ; $077D: $CB $21
    rl   b                                        ; $077F: $CB $10
    sla  c                                        ; $0781: $CB $21
    rl   b                                        ; $0783: $CB $10
    ld   hl, NpcTilesDataStart                    ; $0785: $21 $00 $40
    add  hl, bc                                   ; $0788: $09
    add  hl, de                                   ; $0789: $19
    push hl                                       ; $078A: $E5
    ld   a, [wEntityTilesSpriteslotIndexB]        ; $078B: $FA $0D $C1
    ld   d, a                                     ; $078E: $57
    ld   hl, vTilesSpriteslots                    ; $078F: $21 $00 $84
    add  hl, bc                                   ; $0792: $09
    add  hl, de                                   ; $0793: $19
    ld   e, l                                     ; $0794: $5D
    ld   d, h                                     ; $0795: $54
    pop  hl                                       ; $0796: $E1
    ld   bc, $40                                  ; $0797: $01 $40 $00
    call CopyData                                 ; $079A: $CD $14 $29

    ; Increment the loading stage
    ld   a, [wEntityTilesLoadingStageB]           ; $079D: $FA $0F $C1
    inc  a                                        ; $07A0: $3C
    ; If the loading stage is >= $04, we're done
    ld   [wEntityTilesLoadingStageB], a           ; $07A1: $EA $0F $C1
    cp   $04                                      ; $07A4: $FE $04
    jr   nz, .return                              ; $07A6: $20 $07
    xor  a                                        ; $07A8: $AF
    ld   [wNeedsUpdatingEntityTilesB], a          ; $07A9: $EA $0E $C1
    ld   [wEntityTilesLoadingStageB], a           ; $07AC: $EA $0F $C1
.return
    ret                                           ; $07AF: $C9

LoadInventorySirenInstruments::
    callsb LoadSirenInstruments                   ; $07B0: $3E $01 $EA $00 $21 $CD $B5 $6B
    jp   CopyTilesToPieceOfHeartMeter.restoreBank0C ; $07B8: $C3 $8B $00

; Data origin table (in bank $0C)
TilesGfxSource::
; Inventory icons for ocarina songs
._08 dw OcarinaSymbolsTiles                       ; $07BB
._09 dw OcarinaSymbolsTiles + $40                 ; $07BD
._0A dw OcarinaSymbolsTiles + $60                 ; $07BF
; Shared GFX: shadows, explosions, etc.
._0B dw CharacterVfxTiles                         ; $07C1
._0C dw CharacterVfxTiles + $40                   ; $07C3
._0D dw CharacterVfxTiles + $60                   ; $07C5

; Data destination table
TilesDestination::
._08 dw vTiles0 + $200                            ; $07C7
._09 dw vTiles0 + $240                            ; $07C9
._0A dw vTiles0 + $260                            ; $07CB
._0B dw vTiles0 + $200                            ; $07CD
._0C dw vTiles0 + $240                            ; $07CF
._0D dw vTiles0 + $260                            ; $07D1

; Execute tile loading commands 08 to OD.
;   08-0A: copy part of the ocarina inventory icon
;   0B-0D: copy part of the shared gfx
; The command is incremented at the end.
LoadBGTilesCommands8ToD::
    ; de = (a - 8) * 2
    sub  a, $08                                   ; $07D3: $D6 $08
    sla  a                                        ; $07D5: $CB $27
    ld   e, a                                     ; $07D7: $5F
    ld   d, $00                                   ; $07D8: $16 $00
    ; Data destination
    ld   hl, TilesGfxSource                       ; $07DA: $21 $BB $07
    add  hl, de                                   ; $07DD: $19
    push hl                                       ; $07DE: $E5
    ld   hl, TilesDestination                     ; $07DF: $21 $C7 $07
    add  hl, de                                   ; $07E2: $19
    ld   e, [hl]                                  ; $07E3: $5E
    inc  hl                                       ; $07E4: $23
    ld   d, [hl]                                  ; $07E5: $56
    ; Data origin
    pop  hl                                       ; $07E6: $E1
    ld   a, [hli]                                 ; $07E7: $2A
    ld   h, [hl]                                  ; $07E8: $66
    ld   l, a                                     ; $07E9: $6F
    ld   a, $0C                                   ; $07EA: $3E $0C
    call AdjustBankNumberForGBC                   ; $07EC: $CD $0B $0B
    ld   [rSelectROMBank], a                      ; $07EF: $EA $00 $21
    ; Data length
    ld   bc, $40                                  ; $07F2: $01 $40 $00
    call CopyData                                 ; $07F5: $CD $14 $29

    ldh  a, [hNeedsUpdatingBGTiles]               ; $07F8: $F0 $90
    cp   TILESET_LOAD_INVENTORY_SONG_3            ; $07FA: $FE $0A
    jr   z, .clearBGTilesFlag                     ; $07FC: $28 $0A
    cp   TILESET_LOAD_SHARED_GFX_3                ; $07FE: $FE $0D
    jr   z, .clearBGTilesFlag                     ; $0800: $28 $06

    ; Increment BG Tiles flag
    ldh  a, [hNeedsUpdatingBGTiles]               ; $0802: $F0 $90
    inc  a                                        ; $0804: $3C
    ldh  [hNeedsUpdatingBGTiles], a               ; $0805: $E0 $90
    ret                                           ; $0807: $C9

.clearBGTilesFlag
    xor  a                                        ; $0808: $AF
    ldh  [hNeedsUpdatingBGTiles], a               ; $0809: $E0 $90
    ret                                           ; $080B: $C9
