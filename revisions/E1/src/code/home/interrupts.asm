;
; Interrupt handlers
;

IntroSeaScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the sea intro sequence.
    db $20, $30, $40, $60, 0 ; upper clouds, lower clouds, sea, upper waves, lower waves

IntroBeachScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the beach intro sequence.
    db $30, $56, $68, 0 ; moutains, trees, beach, waves

;
; InterruptLCDStatus
;
; Manipulate the Background's scrollX and scrollY value during HBlank,
; to create various effects like differential scrolling.
;

InterruptLCDStatus::
    di
    push af
    push hl
    push de
    push bc
    ld   a, [rSVBK]  ; Save current WRAM Bank to c
    ld   c, a        ;
    xor  a           ; Load WRAM Bank 1 (as "0" fallbacks to loading bank 1)
    ld   [rSVBK], a  ;
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS ; if GameplayType != GAMEPLAY_CREDITS
    jr   nz, .skipScrollY
    ; GameplayType == CREDITS
    ld   a, [wGameplaySubtype]
    cp   $05 ; if GameplaySubtype != 5
    jr   nz, .setStandardScrollY
    ; GameplaySubtype == 5
    ld   a, [$D000]  ; override scrollY with WRA1:$D000 value
    jr   .setScrollY

.setStandardScrollY
    ; Set standard scrollY, without specific offset
    ldh  a, [hBaseScrollY]

.setScrollY
    ld   [rSCY], a ; scrollY
    jp   .clearBGTilesFlag

.skipScrollY
    cp   GAMEPLAY_INTRO    ; if not during the introduction sequence
    jr   nz, .clearScrollX  ;   skip
    ; GameplayType == INTRO
    ; Apply differential scrolling to each section:
    ; load and apply the scrollX offset for the current screen section being drawn
    ld   a, [wLCDSectionIndex]
    ld   e, a             ; hl = ScrollXOffsetForSection + LCDSectionIndex
    ld   d, $00           ;
    ld   hl, wScrollXOffsetForSection
    add  hl, de           ;
    ld   a, [hl]
    ld   hl, hBaseScrollX ; a = hBaseScrollX + [hl]
    add  a, [hl]
    ld   [rSCX], a        ; set scrollX
    ld   a, [wGameplaySubtype]
    cp   $06  ; if GameplaySubtype < 6 (intro sea)
    jr   c, .setupNextInterruptForIntroSea
    ; If TransitionCounter >= 6 (intro beach),
    ; setup next interrupt for the beach sequence
    ld   hl, IntroBeachScreenSections
    add  hl, de        ; hl = ScreenSectionsTable + SectionIndex
    ld   a, [hl]       ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section
    ld   a, e          ; a = SectionIndex + 1
    inc  a             ;
    and  $03           ; a = a % 4
    ld   [wLCDSectionIndex], a ; save SectionIndex
    jr   .clearBGTilesFlag

.setupNextInterruptForIntroSea
    ld   hl, IntroSeaScreenSections
    add  hl, de        ; hl = LCDScreenSectionsTable + SectionIndex
    ld   a, [hl]       ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section
    ld   a, e          ; a = SectionIndex + 1
    inc  a             ;
    cp   $05           ; if SectionIndex != 5
    jr   nz, .skipResetSectionIndex ; skip
    ; If SectionIndex reached 5, reset it to 0
    xor  a             ; a = 0

.skipResetSectionIndex
    ld   [wLCDSectionIndex], a ; save SectionIndex
    nop
    cp   $04           ; if SectionIndex != 4
    jr   nz, .clearBGTilesFlag ; skip
    ; If we are drawing the last section (4)
    ld   a, [wIntroBGYOffset] ; Apply the Y offset to compensate for sea vertical movement
    ld   [rSCY], a               ; (so that the horizon position stays constant).
    cpl                ; a = $FF - a + $61
    inc  a             ;
    add  a, $60        ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next transition step
    jr   .clearBGTilesFlag

.clearScrollX
    xor  a
    ld   [rSCX], a ; scrollX

.clearBGTilesFlag
    ; Restore banks and register
    ld   a, c
    ld   [rSVBK], a
    pop  bc
    pop  de
    pop  hl
    pop  af
    ei
    reti

;
; InterruptSerial
;
; Dispatches to the Game Boy Printer routines.
;

InterruptSerial::
    push af
    callsb PrinterInterruptSerial
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    pop  af
    reti

; Load tileset, background, sprites while the LCD screen is off.
; Inputs:
;  - wTileMapToLoad: number of the map to load
LoadMapData::
    ld   a, [wTileMapToLoad]
    and  a
    jr   z, .LoadTileMapZero

    ; Copy tile map number to the palette-loading variable
    ld   [wPaletteToLoadForTileMap], a

    ; if wTileMapToLoad != $23, turn off LCD
    cp   $23
    jr   z, .LCDOffEnd
    push af
    call LCDOff
    pop  af
.LCDOffEnd

    call .executeMapLoadHandler
    jr   .clearFlagsAndReturn

.executeMapLoadHandler
    ld   e, a
    callsb GetTilemapHandlerAddress
    ; Jump to the tilemap loading handler
    jp   hl ; tail-call

    ; Special case for loading map n° 0
.LoadTileMapZero
    call LCDOff
    callsb LoadBGMapAttributes

    ; Read and execute a wRequest for loading wBGMapToLoad.
    callsb GetBGCopyRequest
    ld   a, $08
    ld   [MBC3SelectBank], a
    call ExecuteBackgroundCopyRequest.noMapTransition

    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

.clearFlagsAndReturn
    xor  a
    ld   [wBGMapToLoad], a
    ld   [wTileMapToLoad], a
    ld   a, [wLCDControl]
    ld   [rLCDC], a
.return
    ret

data_046A::
    db   7, 9

;
; InterruptVBlank
;
; Load tiles and map data in the background, and handle photo album effects.
;

InterruptVBlank::
    push af
    push bc
    push de
    push hl

    ; Ensure the RAM bank is in a valid range
    ld   a, [rSVBK]
    and  $07
    ld   c, a
    xor  a
    ld   [rSVBK], a
    push bc

    di

    ;
    ; Photo Album handling
    ;
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   nz, .continue
    ; GameplayType == PHOTO_ALBUM
    ld   a, [wGameplaySubtype]
    cp   $09
    jr   c, .continue
    cp   $12
    jp  c, PhotoAlbumVBlankHandler

.continue
    ldh  a, [hDidRenderFrame]
    and  a
    jp   nz, WaitForVBlankAndReturn  ; if not already waiting for next frame, do

    ;
    ; Dialog handling
    ;
    ld   a, [wDialogState]
    and  $7F  ; If dialog is closed
    jr   z, vBlankContinue
    cp   DIALOG_OPENING_1  ; If DialogState == 1
    jr   z, vBlankContinue
    cp   DIALOG_OPENING_5  ; If DialogState > 5
    jr   nc, .renderDialogText
    ; DialogState < 5
    ; Open dialog
    call label_23E4
    ld   hl, wDialogState
    inc  [hl]  ; Increment DialogState
    jp   WaitForVBlankAndReturn

.renderDialogText
    cp   DIALOG_SCROLLING_1  ; if DialogState != Scrolling
    jr   nz, .renderDialogTextContinue
    ; DialogState == Scrolling
    call DialogBeginScrolling
    jp   WaitForVBlankAndReturn

.renderDialogTextContinue
    cp   DIALOG_SCROLLING_2  ; if DialogState != Scrolling2
    jr   nz, vBlankContinue
    ld   a, [wDialogScrollDelay]
    and  a  ; if DialogScrollDelay == 0
    jr   z, .DialogFinishScrolling
    ; DialogScrollDelay > 0
    dec  a  ; decrement the delay
    ld   [wDialogScrollDelay], a
    jr   vBlankContinue

.DialogFinishScrolling
    call DialogFinishScrolling
    jp   WaitForVBlankAndReturn

    ;
    ; Photo Picture handling
    ;
vBlankContinue::
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_DIZZY_LINK  ; If GameplayType < Photo Picture
    jr   c, .gameplayNotAPhoto
    ; GameplayType is one of the Pictures
    ld   a, [wGameplaySubtype]
    cp   $06
    jr   c, .animateTilesEnd
    callsb func_038_785A
    jr   .animateTilesEnd
.gameplayNotAPhoto

    ;
    ; Standard gameplay (i.e. not Photos) handling
    ;
    ld   a, [wTileMapToLoad]
    and  a
    jr   nz, WaitForVBlankAndReturn

    ; If NeedsUpdatingBGTiles or NeedsUpdatingEnnemiesTiles or NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]
    ldh  [$FFE8], a
    ld   hl, hNeedsUpdatingEnnemiesTiles
    or   [hl]
    ld   hl, wNeedsUpdatingNPCTiles
    or   [hl]
    jr   z, .noTilesToUpdate

    ; Load tiles (?)
    call LoadTiles

    ; If $FFE8 >= 8, skip drawing of Link sprite
    ldh  a, [$FFE8]
    cp   $08
    jr   nc, .linkSpriteclearBGTilesFlag
.drawLinkSprite
    call DrawLinkSprite
.linkSpriteclearBGTilesFlag

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine
    ; And we're clearBGTilesFlag.
    jr   WaitForVBlankAndReturn

.noTilesToUpdate
    ; Otherwise, when there are not tiles to update, we can perform a bit
    ; more GFX code – like animating the tiles and palettes.

    ; If $FFBB == 0, move on
    ldh  a, [$FFBB]
    and  a
    jr   z, .animateTiles

    ; Decrement $FFBB
    dec  a
    ldh  [$FFBB], a

    ; Read [data_046A + A]
    ld   e, a
    ld   d, $00
    ld   hl, data_046A
    add  hl, de
    ld   a, [hl]
    ; Store this value to $D6F8
    ld   [$D6F8], a
    ; Switch Link's sprite ?
    call label_1ED7
    jr   .drawLinkSprite

.animateTiles
    ; If GameplayType != PHOTO_ALBUM, animate tiles
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   z, .animateTilesEnd
    call AnimateTiles
.animateTilesEnd

    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbcEnd
    ; Change BG column palette
    callsb func_024_5C1A
.gbcEnd

    ld   de, wRequest
    call ExecuteBackgroundCopyRequest ; Load BG column tiles
    xor  a
    ld   [wRequests], a
    ld   [wRequest], a
    ld   [$DC90], a
    ld   [$DC91], a

    ; On Overworld, copy some palette data to OAM buffer
    callsb func_036_72BA

    ; Copy the content of wOAMBuffer to the OAM memory
    call hDMARoutine

    ; If on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, WaitForVBlankAndReturn
    callsb CopyPalettesToHardware
    ; Restore the current bank
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a

WaitForVBlankAndReturn::
    ei
.interruptsEnabled
    ; Restore the RAM bank
    pop  bc
    ld   a, c
    ld   [rSVBK], a

    ; Restore registers
    pop  hl
    pop  de
    pop  bc

    ld   a, $01
    ldh  [hNeedsRenderingFrame], a

    pop  af
    reti

PhotoAlbumVBlankHandler::
    ld   a, [wCurrentBank]
    push af
    ldh  a, [hDidRenderFrame]
    and  a
    jr   nz, .clearBGTilesFlag

    call hDMARoutine

    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbcEnd
    callsw CopyPalettesToHardware
    callsw func_024_5C1A
.gbcEnd

    ld   de, wRequest
    call ExecuteBackgroundCopyRequest
    xor  a
    ld   [wRequests], a
    ld   [wRequest], a
    ld   [$DC90], a
    ld   [$DC91], a

.clearBGTilesFlag
    callsw PrinterInterruptVBlank
    pop  af
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    jr   WaitForVBlankAndReturn.interruptsEnabled

; Execute tile-loading commands for BG tiles, enemy tiles and NPC tiles
LoadTiles::
    ;
    ; Execute BG Tiles command
    ;

    ; If there are no BG tiles to load, move to the OAM tiles.
    ldh  a, [hNeedsUpdatingBGTiles]
    and  a
    jp   z, LoadOAMTiles

    cp   $07
    jp   z, label_7B0
    cp   $03
    jp   z, LoadPieceOfHeartMeterTiles1
    cp   $04
    jp   z, LoadPieceOfHeartMeterTiles2
    cp   $05
    jp   z, ClearPieceOfHeartMeterTiles1
    cp   $06
    jp   z, ClearPieceOfHeartMeterTiles2
    cp   $08
    jp   nc, LoadTilesCommands8ToD

    ld   a, [wIsIndoor]
    and  a
    jr   z, LoadOverworldBGTiles
    ldh  a, [hNeedsUpdatingBGTiles]
    cp   $02
    jp   z, LoadDungeonMinimapTiles

    ld   a, BANK(Dungeons2Tiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [hBGTilesLoadingStage]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $9000
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, Dungeons2Tiles

    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    callsb GetColorDungeonTilesAddress
    ld   [MBC3SelectBank], a
    jr   .copyData
.colorDungeonEnd

    ldh  a, [hWorldTileset]
    add  a, $50
    ld   h, a
    add  hl, bc

    ldh  a, [$FFBB]
    and  a
    jr   z, .copyData
    ldh  a, [hBGTilesLoadingStage]
    dec  a
    cp   $02
    jr   c, .incrementBGTileLoadingStage
.copyData

    ld   bc, $40
    call CopyData

.incrementBGTileLoadingStage
    ldh  a, [hBGTilesLoadingStage]
    inc  a
    ldh  [hBGTilesLoadingStage], a
    cp   $04
    jr   nz, .return
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [hBGTilesLoadingStage], a

.return
    ret

LoadOverworldBGTiles::
    ld   a, $0F
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ; de = vTiles2 + [hBGTilesLoadingStage] * 6
    ldh  a, [hBGTilesLoadingStage]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, vTiles2
    add  hl, bc
    ld   e, l
    ld   d, h

    ldh  a, [hWorldTileset]
    add  a, $40
    ld   h, a
    ld   l, $00
    add  hl, bc
    ld   bc, TILE_SIZE * $4
    call CopyData

    ; Increment the loading stage
    ldh  a, [hBGTilesLoadingStage]
    inc  a
    ldh  [hBGTilesLoadingStage], a
    ; If the loading stage >= $08, we're clearBGTilesFlag
    cp   $08
    jr   nz, .return
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [hBGTilesLoadingStage], a
.return
    ret

LoadOAMTiles::
    ; If on GBC and inside the Color Dungeon…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .colorDungeonEnd
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd

    callsb func_020_475A
    xor  a
    ld   [wNeedsUpdatingNPCTiles], a
    ld   [$C10F], a
    ld   hl, vTiles2
    ld   bc, $00
    call GetColorDungeonTilesAddress
    ld   c, $90
    ld   b, h
    ld   h, $00
    call Copy100BytesFromBankAtA
    jr   .clearEnemiesTilesLoadCommand
.colorDungeonEnd

    ;
    ; Execute Enemies Tiles command
    ;

    ldh  a, [hNeedsUpdatingEnnemiesTiles]
    and  a
    jr   z, label_73E
    ld   a, [$C197]
    ld   e, a
    ld   d, $00
    ld   hl, $C193
    add  hl, de
    ld   a, [hl]
    push af
    and  $3F
    ld   d, a
    ld   e, $00
    pop  af
    swap a
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, NpcTilesBankTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .adjustBankEnd
    call AdjustBankNumberForGBC
.adjustBankEnd

    ld   [MBC3SelectBank], a
    ldh  a, [hEnemiesTilesLoadingStage]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, NpcTilesDataStart
    add  hl, bc
    add  hl, de
    push hl
    ld   a, [$C197]
    ld   d, a
    ld   hl, vTiles0 + $400
    add  hl, bc
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   bc, $40
    call CopyData

    ; Increment the enemies tiles loading stage
    ldh  a, [hEnemiesTilesLoadingStage]
    inc  a
    ldh  [hEnemiesTilesLoadingStage], a
    ; If the loading stage is >= $04, we're clearBGTilesFlag
    cp   $04
    jr   nz, .return

.clearEnemiesTilesLoadCommand
    xor  a
    ldh  [hNeedsUpdatingEnnemiesTiles], a
    ldh  [hEnemiesTilesLoadingStage], a

.return
    ret

label_73E::
    ld   a, [$C10D]
    ld   e, a
    ld   d, $00
    ld   hl, $C193
    add  hl, de
    ld   a, [hl]
    push af
    and  $3F
    ld   d, a
    ld   e, $00
    pop  af
    swap a
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, NpcTilesBankTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .jp_0764
    call AdjustBankNumberForGBC
.jp_0764

    ld   [MBC3SelectBank], a
    ld   a, [$C10F]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, NpcTilesDataStart
    add  hl, bc
    add  hl, de
    push hl
    ld   a, [$C10D]
    ld   d, a
    ld   hl, $8400
    add  hl, bc
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   bc, $40
    call CopyData
    ld   a, [$C10F]
    inc  a
    ld   [$C10F], a
    cp   $04
    jr   nz, .return
    xor  a
    ld   [wNeedsUpdatingNPCTiles], a
    ld   [$C10F], a
.return
    ret

label_7B0::
    callsb func_001_6BB5
    jp   CopyTilesToPieceOfHeartMeter.restoreBank0C

; Data origin table (in bank $0C)
TilesGfxSource::
; Inventory icons for ocarina songs
._08 dw OcarinaSymbolsTiles
._09 dw OcarinaSymbolsTiles + $40
._0A dw OcarinaSymbolsTiles + $60
; Shared GFX: shadows, explosions, etc.
._0B dw CharacterVfxTiles
._0C dw CharacterVfxTiles + $40
._0D dw CharacterVfxTiles + $60

; Data destination table
TilesDestination::
._08 dw vTiles0 + $200
._09 dw vTiles0 + $240
._0A dw vTiles0 + $260
._0B dw vTiles0 + $200
._0C dw vTiles0 + $240
._0D dw vTiles0 + $260

; Execute tile loading commands 08 to OD.
;   08-0A: copy part of the ocarina inventory icon
;   0B-0D: copy part of the shared gfx
; The command is incremented at the end.
LoadTilesCommands8ToD::
    ; de = (a - 8) * 2
    sub  a, $08
    sla  a
    ld   e, a
    ld   d, $00
    ; Data destination
    ld   hl, TilesGfxSource
    add  hl, de
    push hl
    ld   hl, TilesDestination
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    ; Data origin
    pop  hl
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ; Data length
    ld   bc, $40
    call CopyData

    ldh  a, [hNeedsUpdatingBGTiles]
    cp   $0A
    jr   z, .clearBGTilesFlag
    cp   $0D
    jr   z, .clearBGTilesFlag

    ; Increment BG Tiles flag
    ldh  a, [hNeedsUpdatingBGTiles]
    inc  a
    ldh  [hNeedsUpdatingBGTiles], a
    ret

.clearBGTilesFlag
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ret
