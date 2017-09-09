; Code for bank 0 ("Home").
; Unlike other banks, this code is always adressable at `0000:xxxx`, without
; the need to switch banks.

Start:: ;
    ; Switch CPU to double-speed if needed
    cp   GBC ; is running on Game Boy Color?
    jr   nz, .notGBC
    ld   a, [rKEY1]
    and  $80 ; do we need to switch the CPU speed?
    jr   nz, .speedSwitchDone
    ld   a, $30      ; \
    ld   [rJOYP], a  ; |
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

    ; Call 003C:6A22
    ld   a, $3C
    ld   [MBC3SelectBank], a
    call label_6A22

    ; Clear registers
    xor  a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a

    ; Clear Tiles Map 0
    ld   hl, vTiles0
    ld   bc, $1800
    call ClearBytes

    ; Clear Tiles Map 1 (if GBC)
    ld   a, $24
    ld   [MBC3SelectBank], a
    call ClearTilesMap1

    ; Clear Background Map
    call ClearBGMap
    call ClearHRAMAndWRAM

    ; Copy DMA routine to HRAM
    ld   a, $01
    ld   [MBC3SelectBank], a
    call WriteDMACodeToHRAM

    ; Initiate DMA transfer
    call hDMARoutine

    call LCDOn

    ; Load default tiles
    call LoadBank0CTiles

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
    ; (calls 001F:4000)
    ld   a, $1F
    ld   [MBC3SelectBank], a
    call label_4000

    ; Ignore joypad input during 24 frames
    ld   a, 24
    ldh  [hButtonsInactiveDelay], a

    ; Enable interrupts
    ei

    ; If GBC, clear WRAM Bank 5
    ; (calls 20:4854)
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4854

    ; Start rendering
    jp   WaitForNextFrame

RenderLoop::
    ; Set DidRenderFrame
    ld   a, 1
    ldh  [hDidRenderFrame], a

    ; Special case for $C500 == 1 (alternate background position)
    ; If $C500 != 0...
    ld   a, [$C500]
    and  a
    jr   z, .applyRegularScrollYOffset
    ; and GameplayType == OVERWORLD...
    ld   a, [wGameplayType]
    cp   GAMEPLAY_OVERWORLD
    jr   nz, .applyRegularScrollYOffset
    ; set scroll Y to $00 or $80 alternatively every other frame.
    ldh  a, [hFrameCounter]
    rrca
    and  $80
    jr   .setScrollY

.applyRegularScrollYOffset
    ; Compose the base offset and the screen shake offset
    ld   hl, wScreenShakeVertical
    ldh  a, [hBaseScrollY]
    add  a, [hl]

.setScrollY
    ld   [rSCY], a ; scrollY

    ; Set ScrollX
    ldh  a, [hBaseScrollX]
    ld   hl, wScreenShakeHorizontal
    add  a, [hl]
    ld   hl, $C1BF
    add  a, [hl]
    ld   [rSCX], a ; scrollX

    ; If the LCD screen is off, load new map data
    ld   a, [$D6FE]
    and  a   ; if $D6FE != 0, LoadNewMap
    jr   nz, RenderLoopLoadNewMap
    ld   a, [$D6FF] ; tilemap to load?
    cp   $00 ; if $D6FF != 0, LoadNewMap
    jr   z, RenderFrame

RenderLoopLoadNewMap::
    ; Control audio during the transition
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MARIN_BEACH
    jr   z, .playAudioStep
    cp   GAMEPLAY_FILE_SAVE
    jr   c, .playAudioStep
    cp   GAMEPLAY_OVERWORLD
    jr   nz, .skipAudio
    ; GameplayType == OVERWORLD
    ld   a, [wGameplaySubtype]
    cp   $07
    jr   nc, .skipAudio

.playAudioStep
    call PlayAudioStep
    call PlayAudioStep

.skipAudio
    di
    call LoadMapData
    ei
    call PlayAudioStep
    call PlayAudioStep
    jp   WaitForNextFrame

RenderFrame::
    ; Update LCD status flags
    ld   a, [wLCDControl]
    and  $7F
    ld   e, a
    ld   a, [rLCDC]
    and  $80
    or   e
    ld   [rLCDC], a

    ; Increment the global frame counter
    ld   hl, hFrameCounter
    inc  [hl]

    ; Special case for the intro screen sprites
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INTRO
    jr   nz, RenderWarpTransition
    ; GameplayType == INTRO
    ld   a, [wGameplaySubtype]
    cp   $08
    jr   c, RenderWarpTransition
    ; GameplaySubtype > GAMEPLAY_INTRO_BEACH
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_5257 ; position sprites for the title screen?

RenderWarpTransition::
    ld   a, [wWarpTransition]
    and  a
    jp   z, RenderInteractiveFrame
    inc  a
    jr   nz, label_279

label_26E::
    ld   a, $17
    ld   [MBC3SelectBank], a
    call label_48DD
    jp   RenderInteractiveFrame

label_279::
    inc  a
    jr   z, label_26E
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   a, [$C180]
    inc  a
    ld   [$C180], a
    cp   $C0
    jr   nz, label_2A0
    ld   a, [wWarpTransition]
    cp   $02
    jr   nz, label_296
    call label_4E51

label_296::
    xor  a
    ld   [wWarpTransition], a
    ld   [$C3CA], a
    jp   RenderInteractiveFrame

label_2A0::
    push af
    cp   $60
    jr   c, label_2B7
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B4
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6CA7
    jr   label_2B7

label_2B4::
    call label_4FE8

label_2B7::
    ld   a, $14
    ld   [MBC3SelectBank], a
    pop  af
    call label_5038
    call PlayAudioStep
    ld   a, [wBGPalette]
    ld   [rBGP], a
    ld   a, [wOBJ0Palette]
    ld   [rOBP0], a
    ld   a, [wOBJ1Palette]
    ld   [rOBP1], a
    jp   WaitForNextFrame

RenderInteractiveFrame::
    ; Update graphics registers from game values
    ld   a, [wWindowY]
    ld   [rWY], a
    ld   a, [wBGPalette]
    ld   [rBGP], a
    ld   a, [wOBJ0Palette]
    ld   [rOBP0], a
    ld   a, [wOBJ1Palette]
    ld   [rOBP1], a

    call PlayAudioStep
    call ReadJoypadState

    ; If NeedsUpdatingBGTiles or NeedsUpdatingEnnemiesTiles or NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]
    ld   hl, hNeedsUpdatingEnnemiesTiles
    or   [hl]
    ld   hl, wneedsUpdatingNPCTiles
    or   [hl]
    ; skip further rendering: the vblank interrupt will load the required data
    jr   nz, WaitForNextFrame

    ; Debug functions
    ld   a, [ROM_DebugTool1]
    and  a  ; Is debug mode disabled?
    jr   z, RenderUpdateSprites

    ld   a, [wEnginePaused]
    and  a  ; Is engine already paused?
    jr   nz, .engineIsPaused

    ldh  a, [hPressedButtonsMask]
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN ; Are none of the directional keys pressed?
    jr   z, .saveEngineStatus

.engineIsPaused
    ldh  a, [$FFCC]
    and  J_SELECT  ; Was Select button just pressed?
    jr   z, .saveEngineStatus

    ; If Select button was just pressed,
    ; toogle engine paused status.
    ld   a, [wEnginePaused]
    xor  $01
    ld   [wEnginePaused], a

    ; If the engine was just paused, skip the rest of the render loop
    jr   nz, WaitForNextFrame

    ; If the engine was just unpaused,
    ; toggle Free-movement mode.
    ld   a, [wFreeMovementMode]
    xor  $10
    ld   [wFreeMovementMode], a
    jr   WaitForNextFrame

.saveEngineStatus
    ; If the engine is paused, skip the rest of the render loop
    ld   a, [wEnginePaused]
    and  a
    jr   nz, WaitForNextFrame

RenderUpdateSprites::
    ; If not in Inventory, update sprites
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INVENTORY
    jr   nz, .updateSprites

    ; If Inventory is actually visible, skip sprites update
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INVENTORY_DELAY1
    jr   c, RenderGameplay

.updateSprites
    ld   a, $01
    call SwitchBank
    call label_5F2E ; sprite-related-method

RenderGameplay::
    call ExecuteGameplayHandler

RenderPalettes::
    ; If isGBC
    ldh  a, [hIsGBC]
    and  a
    jr   z, .resetDDD2
    ; update palettes
    ld   a, $21
    call SwitchBank
    call label_406E ; update palette set defined in $DDD2?

.resetDDD2
    xor  a
    ld   [$DDD2], a

RenderWindow::
    ld   a, $01
    call SwitchBank
    call UpdateWindowPosition

WaitForNextFrame::
    ; Animate inventory window
    ; (calls 1F:7F80)
    ld   a, $1F
    call SwitchBank
    call label_7F80

    ; Switch to first graphics bank ($0C on DMG, $2C on GBC)
    ld   a, $0C
    call AdjustBankNumberForGBC
    call SwitchBank

    ; Reset didRenderFrame flag
    xor  a
    ldh  [hDidRenderFrame], a

    ; Stop the CPU until the next interrupt
    halt

    ; Loop until hNeedsRenderingFrame != 0
.pollNeedsRenderingFrame
    ldh  a, [hNeedsRenderingFrame]
    and  a
    jr   z, .pollNeedsRenderingFrame

    ; Clear hNeedsRenderingFrame
    xor  a
    ldh  [hNeedsRenderingFrame], a

    ; Jump to the top of the render loop
    jp   RenderLoop

IntroSeaScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the sea intro sequence.
    db $20, $30, $40, $60, 0 ; upper clouds, lower clouds, sea, upper waves, lower waves

IntroBeachScreenSections::
    ; Indexes of rows to divide the screen in horizontal sections.
    ; This is used to enable differential scrolling during the beach intro sequence.
    db $30, $56, $68, 0 ; moutains, trees, beach, waves

InterruptLCDStatus::
    ; Manipulate the Background's scrollX and scrollY value while the screen is drawn,
    ; to create various effects like differential scrolling.
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
    jr   nz, skipScrollY
    ; GameplayType == CREDITS
    ld   a, [wGameplaySubtype]
    cp   $05 ; if GameplaySubtype != 5
    jr   nz, setStandardScrollY
    ; GameplaySubtype == 5
    ld   a, [$D000]  ; override scrollY with WRA1:$D000 value
    jr   setScrollY

setStandardScrollY::
    ; Set standard scrollY, without specific offset
    ldh  a, [hBaseScrollY]

setScrollY::
    ld   [rSCY], a ; scrollY
    jp   restoreSavedWRAMBankAndReturn

skipScrollY::
    cp   GAMEPLAY_INTRO    ; if not during the introduction sequence
    jr   nz, clearScrollX  ;   skip
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
    jr   c, setupNextInterruptForIntroSea
    ; If TransitionCounter >= 6 (intro beach)
setupNextInterruptForIntroBeach::
    ld   hl, IntroBeachScreenSections
    add  hl, de        ; hl = ScreenSectionsTable + SectionIndex
    ld   a, [hl]       ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section
    ld   a, e          ; a = SectionIndex + 1
    inc  a             ;
    and  $03           ; a = a % 4
    ld   [wLCDSectionIndex], a ; save SectionIndex
    jr   restoreSavedWRAMBankAndReturn

setupNextInterruptForIntroSea::
    ld   hl, IntroSeaScreenSections
    add  hl, de        ; hl = LCDScreenSectionsTable + SectionIndex
    ld   a, [hl]       ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next section
    ld   a, e          ; a = SectionIndex + 1
    inc  a             ;
    cp   $05           ; if SectionIndex != 5
    jr   nz, skipResetSectionIndex ; skip
    ; If SectionIndex reached 5, reset it to 0
    xor  a             ; a = 0

skipResetSectionIndex::
    ld   [wLCDSectionIndex], a ; save SectionIndex
    nop
    cp   $04           ; if SectionIndex != 4
    jr   nz, restoreSavedWRAMBankAndReturn ; skip
    ; If we are drawing the last section (4)
    ld   a, [wIntroBGYOffset] ; Apply the Y offset to compensate for sea vertical movement
    ld   [rSCY], a               ; (so that the horizon position stays constant).
    cpl                ; a = $FF - a + $61
    inc  a             ;
    add  a, $60        ;
    ld   [rLYC], a     ; Fire LCD Y-compare interrupt when reaching the row for the next transition step
    jr   restoreSavedWRAMBankAndReturn

clearScrollX::
    xor  a
    ld   [rSCX], a ; scrollX

restoreSavedWRAMBankAndReturn::
    ld   a, c
    ld   [rSVBK], a
    pop  bc
    pop  de
    pop  hl
    pop  af
    ei
    reti

InterruptSerial::
    push af
    ld   a, $28
    ld   [MBC3SelectBank], a
    call label_4601
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    pop  af
    reti

; Load tileset, background, sprites while the LCD screen is off
LoadMapData::
    ld   a, [$D6FE]
    and  a
    jr   z, .commonCase

    ;
    ; $D6FE != 0: special case
    ;
    ld   [$DDD2], a
    cp   $23 ; if $D6FE == $23
    jr   z, .skipLCDOff
    push af
    call LCDOff
    pop  af

.skipLCDOff
    call .executeMapLoadFunction
    jr   .clearValuesAndReturn

.executeMapLoadFunction
    ld   e, a
    ld   a, $20
    ld   [MBC3SelectBank], a
    ; label_4657
    ;   input:  $D6FE in e
    ;   output: address to jump to in hl
    ; Table address: 20:4664
    ; Table values:
    ;   01  $309B
    ;   02  $28F7
    ;   03  $2BCF
    ;   04  $2C03
    ;   05  $2D2D
    ;   06  $2C28
    ;   07  $2D2D
    ;   08  $28F0
    ;   09  $2E73
    ;   ...
    call label_4657
    jp   hl

    ;
    ; $D6FE == 0: common case
    ;
.commonCase
    call LCDOff
    ld   a, $24
    ld   [MBC3SelectBank], a
    call label_5C2C
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4577
    ld   a, $08
    ld   [MBC3SelectBank], a
    call label_292D
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

.clearValuesAndReturn
    xor  a
    ld   [$D6FF], a
    ld   [$D6FE], a
    ld   a, [wLCDControl]
    ld   [rLCDC], a
    ret

data_046A::
    db   7, 9

InterruptVBlank::
    push af
    push bc
    push de
    push hl

    ; Adjust loaded bank
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
    jr   c, .continue3
    ; GameplayType is one of the Pictures
    ld   a, [wGameplaySubtype]
    cp   $06
    jr   c, label_52B
    ld   a, $38
    ld   [MBC3SelectBank], a
    call label_785A
    jr   label_52B

.continue3
    ld   a, [$D6FE]
    and  a
    jr   nz, WaitForVBlankAndReturn
    ldh  a, [hNeedsUpdatingBGTiles]
    ldh  [$FFE8], a
    ld   hl, hNeedsUpdatingEnnemiesTiles
    or   [hl]
    ld   hl, wneedsUpdatingNPCTiles
    or   [hl]
    jr   z, label_509
    call label_5BC ; Copy tiles?
    ldh  a, [$FFE8]
    cp   $08
    jr   nc, label_504

label_501::
    call DrawLinkSprite

label_504::
    call hDMARoutine
    jr   WaitForVBlankAndReturn

label_509::
    ldh  a, [$FFBB]
    and  a
    jr   z, label_521
    dec  a
    ldh  [$FFBB], a
    ld   e, a
    ld   d, $00
    ld   hl, data_046A
    add  hl, de
    ld   a, [hl]
    ld   [$D6F8], a
    call label_1ED7
    jr   label_501

label_521::
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   z, label_52B
    call AnimateTiles

label_52B::
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC
    ld   a, $24
    ld   [MBC3SelectBank], a
    call label_5C1A ; Change BG column palette. Triggered by an interrupt?
.notGBC
    ld   de, $D601
    call label_2927 ; Load BG column tiles
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_72BA
    call hDMARoutine
    ldh  a, [hIsGBC]
    and  a
    jr   z, WaitForVBlankAndReturn
    ld   a, $21
    ld   [MBC3SelectBank], a
    call label_4000
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a

WaitForVBlankAndReturn::
    ei

WaitForVBlankAndReturn_direct::
    pop  bc
    ld   a, c
    ld   [rSVBK], a
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
    jr   nz, label_5AB
    call hDMARoutine
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_598
    ld   a, $21
    call SwitchBank
    call label_4000
    ld   a, $24
    call SwitchBank
    call label_5C1A

label_598::
    ld   de, $D601
    call label_2927
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a

label_5AB::
    ld   a, $28
    call SwitchBank
    call label_4616
    pop  af
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    jr   WaitForVBlankAndReturn_direct

; Copy tiles?
label_5BC::
    ldh  a, [hNeedsUpdatingBGTiles]
    and  a
    jp   z, label_69E
    cp   $07
    jp   z, label_7B0
    cp   $03
    jp   z, $0062
    cp   $04
    jp   z, $006A
    cp   $05
    jp   z, $0072
    cp   $06
    jp   z, $007A
    cp   $08
    jp   nc, label_7D3
    ld   a, [$DBA5]
    and  a
    jp   z, label_656
    ldh  a, [hNeedsUpdatingBGTiles]
    cp   $02
    jp   z, label_826
    ld   a, $0D
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [$FF92]
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
    ld   hl, $5000
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_62F
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4616
    ld   [MBC3SelectBank], a
    jr   label_641

label_62F::
    ldh  a, [$FF94]
    add  a, $50
    ld   h, a
    add  hl, bc
    ldh  a, [$FFBB]
    and  a
    jr   z, label_641
    ldh  a, [$FF92]
    dec  a
    cp   $02
    jr   c, label_647

label_641::
    ld   bc, $0040
    call CopyData

label_647::
    ldh  a, [$FF92]
    inc  a
    ldh  [$FF92], a
    cp   $04
    jr   nz, label_655
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [$FF92], a

label_655::
    ret

label_656::
    ld   a, $0F
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [$FF92]
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
    ldh  a, [$FF94]
    add  a, $40
    ld   h, a
    ld   l, $00
    add  hl, bc
    ld   bc, $0040
    call CopyData
    ldh  a, [$FF92]
    inc  a
    ldh  [$FF92], a
    cp   $08
    jr   nz, label_69D
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [$FF92], a

label_69D::
    ret

label_69E::
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6CB
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_6CB
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_475A
    xor  a
    ld   [wneedsUpdatingNPCTiles], a
    ld   [$C10F], a
    ld   hl, $9000
    ld   bc, $0000
    call label_4616
    ld   c, $90
    ld   b, h
    ld   h, $00
    call label_A13
    jr   label_738

label_6CB::
    ldh  a, [hNeedsUpdatingEnnemiesTiles]
    and  a
    jp   z, label_73E
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
    ld   hl, data_2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_6F7
    call AdjustBankNumberForGBC

label_6F7::
    ld   [MBC3SelectBank], a
    ldh  a, [$FF93]
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
    ld   hl, $4000
    add  hl, bc
    add  hl, de
    push hl
    ld   a, [$C197]
    ld   d, a
    ld   hl, $8400
    add  hl, bc
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   bc, $0040
    call CopyData
    ldh  a, [$FF93]
    inc  a
    ldh  [$FF93], a
    cp   $04
    jr   nz, label_73D

label_738::
    xor  a
    ldh  [hNeedsUpdatingEnnemiesTiles], a
    ldh  [$FF93], a

label_73D::
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
    ld   hl, data_2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_764
    call AdjustBankNumberForGBC

label_764::
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
    ld   hl, $4000
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
    ld   bc, $0040
    call CopyData
    ld   a, [$C10F]
    inc  a
    ld   [$C10F], a
    cp   $04
    jr   nz, label_7AF
    xor  a
    ld   [wneedsUpdatingNPCTiles], a
    ld   [$C10F], a

label_7AF::
    ret

label_7B0::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_6BB5
    jp   $008B

data_07BB::
    db   $60, $69, $A0, $69, $C0, $69, 0, $42, $40, $42, $60, $42

data_07C7::
    db   0, $82, $40, $82, $60, $82, 0, $82, $40, $82, $60, $82

label_7D3::
    sub  a, $08
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, data_07BB
    add  hl, de
    push hl
    ld   hl, data_07C7
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    pop  hl
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   bc, $0040
    call CopyData
    ldh  a, [hNeedsUpdatingBGTiles]
    cp   $0A
    jr   z, label_808
    cp   $0D

label_800::
    jr   z, label_808

label_802::
    ldh  a, [hNeedsUpdatingBGTiles]
    inc  a

label_805::
    ldh  [hNeedsUpdatingBGTiles], a
    ret

label_808::
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ret

; Switch to the bank defined in a, and save the active bank
SwitchBank::
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ret

; Switch to the bank defined in a, depending on GB or GBC mode
SwitchAdjustedBank::
    call AdjustBankNumberForGBC

SwitchBank_duplicate::
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ret

ReloadSavedBank::
    push af
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    pop  af
    ret

label_826::
    ld   a, $12
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [$FF92]
    cp   $08
    jr   c, label_873
    jr   nz, label_843
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_6843

label_83E::
    ld   hl, $FF92
    inc  [hl]
    ret

label_843::
    cp   $09
    jr   nz, label_854
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_6827
    ld   hl, $FF92
    inc  [hl]
    ret

label_854::
    cp   $0A
    jr   nz, label_865
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_680B
    ld   hl, $FF92
    inc  [hl]
    ret

label_865::
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_67E5
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [$FF92], a
    ret

label_873::
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
    ld   hl, $8D00
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, $7E00
    add  hl, bc
    ld   bc, $0040
    call CopyData
    ldh  a, [$FF92]
    inc  a
    ldh  [$FF92], a
    ret

PlayAudioStep::
    ld   a, $1F
    call SwitchBank
    call label_4006
    ldh  a, [$FFF3]
    and  a
    jr   nz, label_8D6
    ld   a, [$C10B]
    and  a
    jr   z, label_8C6
    cp   $02
    jr   nz, label_8C3
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, label_8D6
    jr   label_8C6

label_8C3::
    call label_8C6

label_8C6::
    ld   a, $1B
    call SwitchBank
    call label_4006
    ld   a, $1E
    call SwitchBank
    call label_4006

label_8D6::
    ret

label_8D7::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6A30

restoreBankAndReturn::
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

label_8E6::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6AC1
    jr   restoreBankAndReturn

; Load BG palette?
label_8F0::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6BA4
    jr   restoreBankAndReturn

label_8FA::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6BDC
    jr   RestoreStackedBankAndReturn

label_905::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6C00
    jr   LoadBank1AndReturn

label_90F::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6C24

LoadBank1AndReturn::
    ld   a, $01
    ld   [MBC3SelectBank], a
    ret

label_91D::
    push af
    ld   b, $00
    ld   a, [$DDD8]
    sla  a
    rl   b
    sla  a
    rl   b
    ld   c, a
    jr   label_92F
    push af

label_92F::
    ld   a, $1A
    ld   [MBC3SelectBank], a
    call label_6576
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   e, a
    add  a, $0A
    ld   [$DC90], a
    ld   d, $00
    add  hl, de
    ldh  a, [$FFE0]
    ld   d, a
    ldh  a, [$FFE1]
    ld   e, a
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    dec  de
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    xor  a
    ldi  [hl], a

; Restore bank saved on stack and return
RestoreStackedBankAndReturn::
    pop  af
    ld   [MBC3SelectBank], a
    ret

label_978::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6D0E
    jr   RestoreStackedBankAndReturn

label_983::
    ld   a, $1A
    ld   [MBC3SelectBank], a
    call label_6710
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    ldh  a, [$FFE0]
    ld   h, a
    ldh  a, [$FFE1]
    ld   l, a
    ld   a, [hl]
    inc  de
    ret

label_999::
    push af
    push bc
    call label_983
    ldh  [$FFD7], a
    pop  bc
    call label_983
    ldh  [$FFD8], a
    ld   a, [$DC90]
    ld   c, a
    ld   b, $00
    add  a, $05
    ld   [$DC90], a
    ld   hl, $DC91
    add  hl, bc
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ldh  a, [$FFD7]
    ldi  [hl], a
    ldh  a, [$FFD8]
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    jr   RestoreStackedBankAndReturn

label_9C8::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4985
    jr   RestoreStackedBankAndReturn

label_9D3::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4518
    jr   RestoreStackedBankAndReturn

label_9DE::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4874
    jr   RestoreStackedBankAndReturn

label_9E9::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4954
    jp   RestoreStackedBankAndReturn

label_9F5::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_482D
    jp   RestoreStackedBankAndReturn

label_A01::
    push hl
    ld   l, $00
    ld   e, l
    ld   h, b
    ld   a, c
    add  a, $80
    ld   d, a
    ld   bc, $0100
    call CopyData
    pop  hl
    jr   label_A2D

label_A13::
    ld   [MBC3SelectBank], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_A01
    ld   a, b
    ld   [rHDMA1], a
    ld   a, $00
    ld   [rHDMA2], a
    ld   a, c
    ld   [rHDMA3], a
    ld   a, $00
    ld   [rHDMA4], a
    ld   a, $0F
    ld   [rHDMA5], a

label_A2D::
    ld   a, h
    ld   [MBC3SelectBank], a
    ret

label_A32::
    push af
    ld   a, $35
    ld   [MBC3SelectBank], a
    ld   hl, $4F00
    ld   de, $DCC0
    ld   bc, $0020
    call CopyData
    jp   RestoreStackedBankAndReturn

label_A47::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_505F
    jp   RestoreStackedBankAndReturn

label_A53::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_4F9B
    jp   RestoreStackedBankAndReturn

label_A5F::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_3CE6
    jp   RestoreStackedBankAndReturn

label_A6B::
    push af
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_5A2E
    jp   RestoreStackedBankAndReturn

label_A77::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_4F68
    jp   RestoreStackedBankAndReturn

label_A83::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6D52
    jp   RestoreStackedBankAndReturn

label_A8F::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_4BE8
    jp   RestoreStackedBankAndReturn

label_A9B::
    push af
    ld   a, $0F
    call SwitchBank
    call label_2321
    jp   RestoreStackedBankAndReturn

label_AA7::
    push af
    ld   a, $36
    call SwitchBank
    call label_705A

label_AB0::
    pop  af
    call SwitchBank
    ret

label_AB5::
    push af
    ld   a, $24
    ld   [MBC3SelectBank], a
    call label_5C1A
    ld   de, $D601
    call label_2927
    jr   label_AB0

label_AC6::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_703E
    jp   RestoreStackedBankAndReturn

label_AD2::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_70D6
    jp   RestoreStackedBankAndReturn

label_ADE::
    push af
    ld   a, $36
    call SwitchBank
    call label_4A77
    jp   RestoreStackedBankAndReturn

label_AEA::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_4A4C
    jp   RestoreStackedBankAndReturn

label_AF6::
    push af
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_7161
    jp   RestoreStackedBankAndReturn

label_B02::
    ld   a, $3D
    ld   [MBC3SelectBank], a
    call label_4029
    ret

; Toogle an extra byte to the bank number on GBC (on GB, does nothing)
; Input:  a: the bank number to adjust
; Output: a: the adjusted bank number
AdjustBankNumberForGBC::
    push bc
    ld   b, a
    ldh  a, [hIsGBC]
    and  a           ; if !isGBC
    jr   z, .notGBC  ;   handle standard GB
    ld   a, b        ; else
    or   $20         ;   set 6-th bit of `a` to 1
    pop  bc          ;   restore registers
    ret              ;   return a
.notGBC
    ld   a, b        ; return the original value of a
    pop  bc
    ret

label_0B1A::
    ldh  a, [$FFD7]
    ld   [MBC3SelectBank], a
    ld   a, $02
    ld   [rSVBK], a
    call CopyData
    xor  a
    ld   [rSVBK], a
    ld   a, $20
    ld   [MBC3SelectBank], a
    ret

label_B2F::
    ldh  [$FFD9], a
    ldh  a, [hIsGBC]
    and  a
    ret  z
    ld   a, [$DBA5]
    and  a
    ret  nz
    push bc
    ldh  a, [$FFD9]
    and  $80
    jr   nz, label_B4B
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6E50
    jr   c, label_B54

label_B4B::
    ld   b, [hl]
    ld   a, $02
    ld   [rSVBK], a
    ld   [hl], b
    xor  a
    ld   [rSVBK], a

label_B54::
    ldh  a, [$FFD9]
    and  $7F
    ld   [MBC3SelectBank], a
    pop  bc
    ret
    ld   [MBC3SelectBank], a
    call CopyData
    ld   a, $28
    ld   [MBC3SelectBank], a
    ret
    push hl
    ld   [MBC3SelectBank], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_B80
    ld   de, $0168
    add  hl, de
    ld   a, $01
    ld   [rVBK], a
    call label_B96
    xor  a
    ld   [rVBK], a

label_B80::
    pop  hl
    push hl
    call label_B96
    pop  hl
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   nz, label_B90
    call label_BB5

label_B90::
    ldh  a, [$FFE6]
    ld   [MBC3SelectBank], a
    ret

label_B96::
    ld   de, vBGMap0

label_B99::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e
    and  $1F
    cp   $14
    jr   nz, label_B99
    ld   a, e
    add  a, $0C
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    cp   $9A
    jr   nz, label_B99
    ld   a, e
    cp   $40
    jr   nz, label_B99
    ret

label_BB5::
    ld   bc, $0168
    ld   de, $D000
    jp   CopyData
    push af
    call LoadBank0CTiles
    jp   RestoreStackedBankAndReturn
    ld   a, [$D16A]
    ld   [MBC3SelectBank], a

label_BCB::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  b
    jr   nz, label_BCB
    ld   a, $28
    ld   [MBC3SelectBank], a
    ret

label_BD7::
    ld   a, [$DE01]
    ld   [MBC3SelectBank], a
    call label_BE7
    ld   a, [$DE04]
    ld   [MBC3SelectBank], a
    ret

label_BE7::
    ld   a, [$DE02]
    ld   h, a
    ld   a, [$DE03]
    ld   l, a
    jp   hl
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_1A50
    jp   ReloadSavedBank

label_BFB::
    ld   hl, $C450
    jr   label_C08

label_C00::
    ld   hl, $C2F0
    jr   label_C08

label_C05::
    ld   hl, $C2E0

label_C08::
    add  hl, bc
    ld   a, [hl]
    and  a
    ret
    ld   a, $AF
    call label_3B86
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ret

label_C20::
    ld   a, $1D
    ldh  [$FFF2], a
    ret

label_C25::
    ld   hl, $4641
    jr   label_C2D

label_C2A::
    ld   hl, $4741

label_C2D::
    ld   a, $1C
    ld   [MBC3SelectBank], a
    add  hl, bc
    ld   a, [hl]
    ld   hl, MBC3SelectBank
    ld   [hl], $01
    ret

label_C3A::
    ld   a, $0C
    ld   [MBC3SelectBank], a
    ld   bc, $0040
    call CopyData
    ld   a, $01
    ld   [MBC3SelectBank], a
    ret

label_C4B::
    ld   hl, $FFF4
    ld   [hl], $0C

label_C50::
    ld   hl, $C502
    ld   [hl], $04
    ret

label_C56::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_C5F
    dec  [hl]

label_C5F::
    ret

label_C60::
    push af
    ld   a, [$C18F]
    and  a
    jr   nz, label_C7B
    ld   [$C1CF], a
    inc  a
    ld   [$C18F], a
    ld   [$C5A6], a
    ld   a, [$C19D]
    and  a
    jr   nz, label_C7B
    ld   a, $02
    ldh  [$FFF2], a

label_C7B::
    pop  af
    ret

label_C7D::
    ld   a, $30
    ldh  [$FFA8], a
    jr   label_C9A
    ld   a, $30
    ldh  [$FFA8], a
    jr   label_C9E
    ld   a, [$D401]
    cp   $01
    jr   nz, label_C7D
    ld   a, [$DBA5]
    and  a
    jr   z, label_C7D
    ld   a, $01
    ldh  [$FFBC], a

label_C9A::
    ld   a, $06
    ldh  [$FFF4], a

label_C9E::
    ld   a, $03
    ld   [$C11C], a
    xor  a
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [$D478], a
    and  a
    ret

label_CAF::
    xor  a
    ld   [wIsUsingSpinAttack], a
    ld   [$C122], a

label_CB6::
    xor  a
    ld   [$C14B], a
    ld   [$C14A], a
    ret

label_CBE::
    ldh  a, [$FF9F]
    ldh  [$FF98], a
    ldh  a, [$FFA0]
    ldh  [$FF99], a
    ret

label_CC7::
    push af
    ld   e, $0F
    ld   d, $00

label_CCC::
    ld   hl, $C510
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_CEC
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_CCC
    ld   hl, $C5C0
    dec  [hl]
    ld   a, [hl]
    cp   $FF
    jr   nz, label_CE8
    ld   a, $0F
    ld   [$C5C0], a

label_CE8::
    ld   a, [$C5C0]
    ld   e, a

label_CEC::
    pop  af
    ld   hl, $C510
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFD8]
    ld   hl, $C540
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFD7]
    ld   hl, $C530
    add  hl, de
    ld   [hl], a
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    ret

label_D07::
    ld   a, [$C140]
    sub  a, $08
    ldh  [$FFD7], a
    ld   a, [$C142]
    sub  a, $08
    ldh  [$FFD8], a

label_D15::
    ld   a, $07
    ldh  [$FFF2], a
    ld   a, $05
    jp   label_CC7

label_D1E::
    ld   a, $20
    ld   [MBC3SelectBank], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_D59
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $6EB3
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_D3C
    ld   hl, $70B3
    jr   label_D45

label_D3C::
    cp   $1A
    jr   nc, label_D45
    cp   $06
    jr   c, label_D45
    inc  h

label_D45::
    add  hl, de
    ldh  a, [$FF94]
    ld   e, a
    ld   a, [hl]
    cp   e
    jr   z, label_D57
    ldh  [$FF94], a
    cp   $FF
    jr   z, label_D57
    ld   a, $01
    ldh  [hNeedsUpdatingBGTiles], a

label_D57::
    jr   label_D91

label_D59::
    ldh  a, [$FFF6]
    cp   $07
    jr   nz, label_D60
    inc  a

label_D60::
    ld   d, a
    srl  a
    srl  a
    and  $F8
    ld   e, a
    ld   a, d
    srl  a
    and  $07
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $6E73
    add  hl, de
    ldh  a, [$FF94]
    ld   e, a
    ld   a, [hl]
    cp   e
    jr   z, label_D91
    cp   $0F
    jr   z, label_D91
    cp   $1A
    jr   nz, label_D8B
    ldh  a, [$FFF6]
    cp   $37
    jr   nz, label_D91
    ld   a, [hl]

label_D8B::
    ldh  [$FF94], a
    ld   a, $01
    ldh  [hNeedsUpdatingBGTiles], a

label_D91::
    xor  a
    ldh  [$FFD7], a
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $70D3
    ld   a, [$DBA5]
    ld   d, a
    ldh  a, [$FFF7]
    cp   $1A
    jr   nc, label_DAB
    cp   $06
    jr   c, label_DAB
    inc  d

label_DAB::
    add  hl, de
    ld   e, [hl]
    ld   a, d
    and  a
    jr   z, label_DC1
    ldh  a, [$FFF7]
    cp   $10
    jr   nz, label_DDB
    ldh  a, [$FFF6]
    cp   $B5
    jr   nz, label_DDB
    ld   e, $3D
    jr   label_DDB

label_DC1::
    ld   a, e
    cp   $23
    jr   nz, label_DCE
    ld   a, [$D8C9]
    and  $20
    jr   z, label_DCE
    inc  e

label_DCE::
    ld   a, e
    cp   $21
    jr   nz, label_DDB
    ld   a, [$D8FD]
    and  $20
    jr   z, label_DDB
    inc  e

label_DDB::
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_DF1
    ld   a, $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a
    jr   label_E31

label_DF1::
    ld   hl, $73F3
    ld   a, [$DBA5]
    and  a
    jr   z, label_DFD
    ld   hl, $763B

label_DFD::
    add  hl, de
    ld   d, $00
    ld   bc, $C193

label_E03::
    ld   e, [hl]
    ld   a, [bc]
    cp   e
    jr   z, label_E29
    ld   a, e
    cp   $FF
    jr   z, label_E29
    ld   [bc], a
    ldh  a, [$FFD7]
    and  a
    jr   z, label_E1E
    ld   a, d
    ld   [$C10D], a
    ld   a, $01
    ld   [wneedsUpdatingNPCTiles], a
    jr   label_E29

label_E1E::
    inc  a
    ldh  [$FFD7], a
    ld   a, d
    ld   [$C197], a
    ld   a, $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a

label_E29::
    inc  hl
    inc  bc
    inc  d
    ld   a, d
    cp   $04
    jr   nz, label_E03

label_E31::
    jp   ReloadSavedBank

ExecuteGameplayHandler::
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MINI_MAP ; If GameplayType < MINI_MAP
    jr   c, jumpToGameplayHandler
    cp   GAMEPLAY_OVERWORLD ; If GameplayType != Overworld
    jr   nz, presentSaveScreenIfNeeded
    ; If GameplayType == OVERWORLD
    ld   a, [wGameplaySubtype]
    cp   $07 ; If GameplaySubtype != 7 (standard overworld gameplay)
    jr   nz, jumpToGameplayHandler

presentSaveScreenIfNeeded::
    ; If a indoor/outdoor transition is running
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, jumpToGameplayHandler

    ; If a dialog is visible, or the screen is animating from one map to another
    ld   a, [wDialogState]
    ld   hl, $C167
    or   [hl]
    ld   hl, wMapSlideTransitionState
    or   [hl]
    jr   nz, jumpToGameplayHandler

    ; If GameplayType > INVENTORY (i.e. photo album and pictures)
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INVENTORY
    jr   nc, jumpToGameplayHandler

    ; If not all A + B + Start + Select buttons are pressed
    ldh  a, [hPressedButtonsMask]
    cp   J_A | J_B | J_START | J_SELECT
    jr   nz, jumpToGameplayHandler

    ; If $D474 != 0
    ld   a, [$D474]
    and  a
    jr   nz, jumpToGameplayHandler

    ; If $D464 != 0
    ld   a, [$D464]
    and  a
    jr   nz, jumpToGameplayHandler

    ; Present save screen
    xor  a ; Clear variables
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [wDialogState], a
    ld   [wGameplaySubtype], a
    ld   a, GAMEPLAY_FILE_SAVE ; Set GameplayType to FILE_SAVE
    ld   [wGameplayType], a

jumpToGameplayHandler::
    ld   a, [wGameplayType]
    JP_TABLE
._00 dw IntroHandler
._01 dw EndCreditsHandler
._02 dw FileSelectionHandler
._03 dw FileCreationHandler
._04 dw FileDeletionHandler
._05 dw FileCopyHandler
._06 dw FileSaveHandler
._07 dw MinimapHandler
._08 dw PeachPictureHandler
._09 dw MarinBeachHandler
._0A dw FaceShrineMuralHandler
._0B dw OverworldHandler
._0C dw InventoryHandler
._0D dw PhotoAlbumHandler
._0E dw PhotoPictureHandler ; Dizzy Link photo
._0F dw PhotoPictureHandler ; Good-looking Link photo
._10 dw PhotoPictureHandler ; Marin cliff photo (with cutscene)
._11 dw PhotoPictureHandler ; Marin well photo
._12 dw PhotoPictureHandler ; Mabe village photo (with cutscene)
._13 dw PhotoPictureHandler ; Ulrira photo
._14 dw PhotoPictureHandler ; Bow-wow photo (with cutscene)
._15 dw PhotoPictureHandler ; Thief photo
._16 dw PhotoPictureHandler ; Fisherman photo
._17 dw PhotoPictureHandler ; Zora photo
._18 dw PhotoPictureHandler ; Kanalet Castle photo (with cutscene)
._19 dw PhotoPictureHandler ; Ghost photo
._1A dw PhotoPictureHandler ; Bridge photo

FaceShrineMuralHandler::
    call label_6AF8
    jp   returnFromGameplayHandler

PeachPictureHandler::
    call label_67EE
    jp   returnFromGameplayHandler

MarinBeachHandler::
    call label_6203
    jp   returnFromGameplayHandler

MinimapHandler::
    call label_5626
    jp   returnFromGameplayHandler

FileSaveHandler::
    ld   a, $01
    call SwitchBank
    jp   label_4000

IntroHandler::
    jp   IntroHandlerEntryPoint

EndCreditsHandler::
    ld   a, $17
    call SwitchBank
    call label_4AB7
    jp   returnFromGameplayHandler

label_EED::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $17

label_EF4::
    push af
    call label_398D
    pop  af
    jp   SwitchBank

label_EFC::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $01
    jr   label_EF4

label_F05::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $02
    jr   label_EF4

FileSelectionHandler::
    jp   label_47CE

FileCreationHandler::
    jp   label_4A07

FileDeletionHandler::
    jp   label_4CFB

FileCopyHandler::
    jp   label_4F8C

OverworldHandler::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_4C4B
    call label_4ABC
    ld   a, $01
    call SwitchBank
    jp   OverworldHandlerEntryPoint

InventoryHandler::
    ld   a, $20
    call SwitchBank
    jp   label_5904

PhotoAlbumHandler::
    ld   a, $28
    call SwitchBank
    call label_4000
    jp   returnFromGameplayHandler

PhotoPictureHandler::
    ld   a, $37
    call SwitchBank
    jp   label_4000

label_F48::
    ld   a, $02
    call SwitchBank
    ld   a, [wDialogState]
    and  a
    jr   nz, label_F8F
    ; Dialog is closed
    ld   hl, $FFB4
    ld   a, [hl]
    and  a
    jr   z, label_F75
    ld   a, [wWindowY]
    cp   $80
    jr   nz, label_F75
    ld   a, [wInventoryAppearing]
    and  a
    jr   nz, label_F75
    dec  [hl]
    jr   nz, label_F75
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_61EE
    call ReloadSavedBank

label_F75::
    ld   a, [wDialogState]
    and  a
    jr   nz, label_F8F
    ld   a, [$C1BC]
    and  a
    jr   z, label_F8F
    ld   hl, $FFA1
    ld   [hl], $02
    dec  a
    ld   [$C1BC], a
    jr   nz, label_F8F
    jp   label_C7D

label_F8F::
    ld   hl, $DBC7
    ld   a, [hl]
    and  a
    jr   z, label_F97
    dec  [hl]

label_F97::
    ldh  a, [$FF98]
    ldh  [$FF9F], a
    ldh  a, [$FF99]
    ldh  [$FFA0], a
    ld   hl, $FFA2
    sub  a, [hl]
    ldh  [$FFB3], a
    call label_60E0
    xor  a
    ld   [$C140], a
    ld   [$C13C], a
    ld   [$C13B], a
    ld   hl, $C11D
    res  7, [hl]
    ld   hl, $C11E
    res  7, [hl]
    call label_593B
    ld   a, $02
    call SwitchBank
    call label_78E8
    call label_1033
    ld   a, [$C15C]
    ld   [$C3CF], a
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4B1F
    ld   a, $19
    call SwitchBank
    call label_7A9A
    call label_398D
    ld   a, $02
    call SwitchBank
    call label_5487
    ld   hl, $D601
    ldh  a, [hFrameCounter]
    and  $03
    or   [hl]
    jr   nz, label_1012
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_1012
    ld   c, $01
    ld   b, $00

label_1000::
    ld   e, $00
    ldh  a, [hFrameCounter]
    and  $04

label_1006::
    jr   z, label_100A
    dec  c
    dec  e

label_100A::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_5C9C

label_1012::
    ld   a, $14
    call SwitchBank
    call label_54F8

returnFromGameplayHandler::
    ld   a, $0F
    call SwitchBank

label_101F::
    call label_2321
    ldh  a, [hIsGBC]
    and  a
    ret  z
    ld   a, $24
    call SwitchBank
    jp   label_7405 ; will return to main game loop

label_102E::
    ld   [$990E], sp
    jr   z, label_101F

label_1033::
    ldh  a, [$FF99]
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$C145], a
    ld   a, [$C1A9]
    and  a
    jr   z, label_107F
    ld   a, [wDialogState]
    and  a
    jr   nz, label_106D
    ld   hl, $C1AA
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, label_1061
    ld   a, [$C1A9]
    ld   e, a
    ld   d, $00
    ld   hl, $102D
    add  hl, de
    ld   a, [hl]
    call label_2385
    ld   a, $01

label_1061::
    and  a
    jr   nz, label_106D
    xor  a
    ld   [$C1A9], a
    ld   [$C1A8], a
    jr   label_107F

label_106D::
    ld   a, [$C1A9]
    ld   [$C1A8], a
    dec  a
    JP_TABLE
    ; Code below is actually data for the jump table
    cp   h
    ld   d, c
    rst  0
    ld   d, c
    rst  0
    ld   d, c
    rst  0
    ld   d, c
    cp   h
    ld   d, c

label_107F::
    ldh  a, [hPressedButtonsMask]
    and  $B0
    jr   nz, label_10DB
    ldh  a, [hPressedButtonsMask]
    and  $40
    jr   z, label_10DB
    ld   a, [$D45F]
    inc  a
    ld   [$D45F], a
    cp   $04
    jr   c, label_10DF
    ldh  a, [$FFA1]
    cp   $02
    jr   z, label_10DB
    ldh  a, [hLinkAnimationState]
    cp   $FF
    jr   z, label_10DB
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_10DB
    ld   a, [wDialogState]
    ld   hl, $C167
    or   [hl]
    ld   hl, wMapSlideTransitionState
    or   [hl]
    jr   nz, label_10DB
    ld   a, [$D464]
    and  a
    jr   nz, label_10DB
    xor  a
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [wGameplaySubtype], a
    ld   a, $07
    ld   [wGameplayType], a
    ld   a, GAMEPLAY_FILE_SELECT
    ld   [MBC3SelectBank], a
    call label_755B
    call DrawLinkSprite
    call label_398D
    pop  af
    ret

label_10DB::
    xor  a
    ld   [$D45F], a

label_10DF::
    ldh  a, [$FFB7]
    and  a
    jr   z, label_10E7
    dec  a
    ldh  [$FFB7], a

label_10E7::
    ldh  a, [$FFB6]
    and  a
    jr   z, label_10EF
    dec  a
    ldh  [$FFB6], a

label_10EF::
    ld   a, [wDialogState]
    and  a
    jp   nz, label_1794
    ld   a, [wMapSlideTransitionState]
    and  a
    jp   nz, label_114F
    ld   a, [$C11C]
    cp   $07
    jr   z, label_1138
    ld   a, [$DB5A]
    ld   hl, $C50A
    or   [hl]
    ld   hl, wInventoryAppearing
    or   [hl]
    jr   nz, label_1135
    ld   a, $07
    ld   [$C11C], a
    ld   a, $BF
    ldh  [$FFB7], a
    ld   a, $10
    ld   [$C3CC], a
    xor  a

label_1120::
    ld   [$DBC7], a
    ldh  [$FF9C], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   [$D464], a
    call label_27F2
    ld   a, $08
    ldh  [$FFF3], a

label_1135::
    ld   a, [$C11C]

label_1138::
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   h, l
    ld   de, $4F30
    ld   h, b
    ld   c, c
    scf
    jr   label_1120
    add  hl, de
    ld   l, l
    ld   c, [hl]
    call nc, label_5D50
    ld   de, $5267
    ld   d, l
    ld   de, $50A3

label_114F::
    call label_1794
    jp   DrawLinkSpriteAndReturn
    ld   a, $19
    call SwitchBank
    jp   $5D6A
    ld   a, $01
    call SwitchBank
    jp   $41C2
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_725A
    and  a
    ret  z
    ld   a, $02
    call SwitchBank
    jp   $4287
    ld   a, [$C50A]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C1A4
    or   [hl]
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   z, label_11BC
    ld   a, [wBButtonSlot]
    cp   $01
    jr   z, label_11AA
    ld   a, [wAButtonSlot]
    cp   $01
    jr   z, label_11AA
    ld   a, [wBButtonSlot]
    cp   $04
    jr   z, label_11A5
    ld   a, [wAButtonSlot]
    cp   $04
    jr   nz, label_11BA

label_11A5::
    call label_1340
    jr   label_11BA

label_11AA::
    ld   a, [$C137]
    dec  a
    cp   $04
    jr   c, label_11BA
    ld   a, $05
    ld   [$C137], a
    ld   [$C16A], a

label_11BA::
    jr   label_11C3

label_11BC::
    xor  a
    ld   [wIsUsingShield], a
    ld   [wHasMirrorShield], a

label_11C3::
    ld   a, [$C117]
    and  a
    jp   nz, label_12ED
    ld   a, [$C15C]
    and  a
    jp   nz, label_12ED
    ld   a, [$C137]
    and  a
    jr   z, label_11E2
    cp   $03
    jr   nz, label_11E2
    ld   a, [$C138]
    cp   $03
    jr   nc, label_11E8

label_11E2::
    ldh  a, [$FFA1]
    and  a
    jp   nz, label_12ED

label_11E8::
    ld   a, [wAButtonSlot]
    cp   $08
    jr   nz, label_11FE
    ldh  a, [hPressedButtonsMask]
    and  $20
    jr   z, label_11FA
    call label_1705
    jr   label_11FE

label_11FA::
    xor  a
    ld   [$C14B], a

label_11FE::
    ld   a, [wBButtonSlot]
    cp   $08
    jr   nz, label_1214
    ldh  a, [hPressedButtonsMask]
    and  $10
    jr   z, label_1210
    call label_1705

label_120E::
    jr   label_1214

label_1210::
    xor  a
    ld   [$C14B], a

label_1214::
    ld   a, [wBButtonSlot]
    cp   $04
    jr   nz, label_1235
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ldh  a, [hPressedButtonsMask]
    and  $10
    jr   z, label_1235
    ld   a, [$C1AD]
    cp   $01
    jr   z, label_1235
    cp   $02
    jr   z, label_1235
    call label_1340

label_1235::
    ld   a, [wAButtonSlot]
    cp   $04
    jr   nz, label_124B
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ldh  a, [hPressedButtonsMask]
    and  $20
    jr   z, label_124B
    call label_1340

label_124B::
    ldh  a, [$FFCC]
    and  $20
    jr   z, label_125E
    ld   a, [$C1AD]
    cp   $02
    jr   z, label_125E
    ld   a, [wAButtonSlot]
    call ItemFunction

label_125E::
    ldh  a, [$FFCC]
    and  $10
    jr   z, label_1275
    ld   a, [$C1AD]
    cp   $01
    jr   z, label_1275
    cp   $02
    jr   z, label_1275
    ld   a, [wBButtonSlot]
    call ItemFunction

label_1275::
    ldh  a, [hPressedButtonsMask]
    and  $20
    jr   z, label_1281
    ld   a, [wAButtonSlot]
    call label_1321

label_1281::
    ldh  a, [hPressedButtonsMask]
    and  $10
    jr   z, label_128D
    ld   a, [wBButtonSlot]
    call label_1321

label_128D::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_48CA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

ItemFunction::
    ld   c, a
    cp   $01
    jp   z, UseSword
    cp   $04
    jp   z, UseShield
    cp   $02
    jp   z, PlaceBomb
    cp   $03
    jp   z, UsePowerBracelet
    cp   $05
    jp   z, ShootArrow
    cp   $0D
    jp   z, UseBoomerang
    cp   $06
    jp   z, UseHookshot
    cp   $0A
    jp   z, UseRocksFeather
    cp   $09
    jp   z, label_41FC ; Ocarina
    cp   $0C
    jp   z, UseMagicPowder
    cp   $0B
    jp   z, UseShovel
    cp   $07 ; Magic wand
    jr   nz, label_12ED
    ld   hl, $C137
    ld   a, [$C19B]
    or   [hl]
    jr   nz, label_12ED
    ld   a, [wProjectileCount]
    cp   $02
    jr   nc, label_12ED
    ld   a, $8E
    ld   [$C19B], a

label_12ED::
    ret

UseShield::
    ld   a, [$C144]
    and  a
    ret  nz
    ld   a, $16
    ldh  [$FFF4], a
    ret

UseShovel::
    ld   a, [$C1C7]
    ld   hl, $C146
    or   [hl]
    ret  nz

label_1300::
    call label_4D20
    jr   nc, label_130B
    ld   a, $07
    ldh  [$FFF2], a
    jr   label_130F

label_130B::
    ld   a, $0E
    ldh  [$FFF4], a

label_130F::
    ld   a, $01
    ld   [$C1C7], a
    xor  a
    ld   [$C1C8], a
    ret

UseHookshot::
    ld   a, [$C1A4]
    and  a
    ret  nz
    jp   $4254

label_1321::
    cp   $01
    ret  nz
    ld   hl, $C137
    ld   a, [$C1AD]
    and  $03
    or   [hl]
    ret  nz
    ld   a, [$C160]
    and  a
    ret  nz
    xor  a
    ld   [$C1AC], a
    ld   a, $05
    ld   [$C137], a
    ld   [$C5B0], a
    ret

label_1340::
    ld   a, $01
    ld   [wIsUsingShield], a
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4B4A
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

PlaceBomb::
    ld   a, [wHasPlacedBomb]
    cp   $01
    ret  nc
    ld   a, [wBombCount]
    and  a
    jp   z, label_C20
    sub  a, $01
    daa
    ld   [wBombCount], a
    ld   a, $02
    call label_142F
    ret  c
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4B81
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

UsePowerBracelet::
    ret

UseBoomerang::
    ld   a, [wProjectileCount]
    and  a

label_1387::
    ret  nz
    ld   a, $01
    call label_142F
    ret  c
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4BFF
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

data_139D::
    db   0, 0, 0, 0

data_13A1::
    db   0, 0, 0, 0

data_13A5::
    db   $20, $E0, 0, 0

data_13A9::
    db   0, 0, $E0, $20

data_13AD::
    db   $30, $D0, 0, 0, $40, $C0, 0, 0

data_13B5::
    db   0, 0, $D0, $30, 0, 0, $C0, $40

ShootArrow::
    ld   a, [wIsShootingArrow]
    and  a
    ret  nz
    ld   a, [wProjectileCount]
    cp   $02
    jr   nc, label_142E
    ld   a, $10
    ld   [wIsShootingArrow], a
    ld   a, [wArrowCount]
    and  a
    jp   z, label_C20
    sub  a, $01
    daa
    ld   [wArrowCount], a
    call label_157C
    ld   a, $00
    call label_142F
    ret  c
    ld   a, e
    ld   [$C1C2], a
    ld   a, [$C1C0]
    and  a
    jr   z, label_1401
    ld   a, [$C1C1]
    ld   c, a
    ld   b, d
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   [hl], b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    xor  a
    jr   label_1407

label_1401::
    ld   a, $0A
    ldh  [$FFF4], a
    ld   a, $06

label_1407::
    ld   [$C1C0], a
    ldh  a, [$FF9E]
    ld   c, a
    ld   b, $00

label_140F::
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_141A
    ld   a, c
    add  a, $04
    ld   c, a

label_141A::
    ld   hl, data_13AD
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, data_13B5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_142E::
    ret

label_142F::
    call label_3B86
    ret  c
    ld   a, $0C
    ld   [$C19B], a
    push bc
    ldh  a, [$FF9E]
    ld   c, a
    ld   b, $00
    ld   hl, data_139D
    add  hl, bc
    ldh  a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A1
    add  hl, bc
    ldh  a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFA2]
    inc  a
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A9
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ldh  a, [$FF9E]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   hl, $C5D0
    add  hl, de
    ld   [hl], a
    ld   hl, $C4F0
    add  hl, de
    ld   [hl], $01
    pop  bc
    scf
    ccf
    ret

UseMagicPowder::
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB4B]
    and  a
    jr   z, label_14A7
    ldh  a, [$FFA2]
    and  a
    ret  nz
    ld   a, $02
    ld   [$C1A9], a
    ld   a, $2A
    ld   [$C1AA], a
    ret

label_14A7::
    ld   a, [$DB4C]
    and  a
    jp   z, label_C20
    ld   a, $08
    call label_3B86
    ret  c
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4C47
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

data_14C3::
    db $1C, $E4, 0, 0

data_14C7::
    db 0, 0, $E4, $1C

UseRocksFeather::
    ld   a, [$C130]
    cp   $07
    ret  z
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, $01
    ld   [$C146], a
    xor  a
    ld   [$C152], a
    ld   [$C153], a
    ld   a, $0D
    ldh  [$FFF2], a
    ldh  a, [$FFF9]
    and  a
    jr   z, label_1508
    call label_1508
    ldh  a, [hPressedButtonsMask]
    and  $03
    ld   a, $EA
    jr   z, label_14F8
    ld   a, $E8

label_14F8::
    ldh  [$FF9B], a
    xor  a
    ldh  [$FFA3], a
    call label_21A8
    ld   a, $02
    call SwitchBank
    jp   $6C75

label_1508::
    ld   a, $20
    ldh  [$FFA3], a
    ld   a, [$C14A]
    and  a
    ret  z
    ldh  a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, data_14C3
    add  hl, de
    ld   a, [hl]
    ldh  [$FF9A], a
    ld   hl, data_14C7
    add  hl, de
    ld   a, [hl]
    ldh  [$FF9B], a

label_1523::
    ret

data_1524::
    db   2, $14, $15, $18

UseSword::
    ld   a, [$C16D]
    ld   hl, wIsUsingSpinAttack
    or   [hl]
    ret  nz
    ld   a, $03
    ld   [$C138], a

label_1535::
    ld   a, $01
    ld   [$C137], a
    ld   [$C5B0], a
    xor  a
    ld   [$C160], a
    ld   [$C1AC], a
    call GetRandomByte
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_1524
    add  hl, de
    ld   a, [hl]
    ldh  [$FFF4], a
    call label_157C
    ld   a, [$C146]
    and  a
    jr   nz, label_1562
    call label_CAF
    call label_178E

label_1562::
    ld   a, [wProjectileCount]
    and  a
    ret  nz
    ld   a, [$C5A9]
    and  a
    ret  z
    ld   a, [$DB4E]
    cp   $02
    ret  nz
    ld   a, $DF
    call label_142F
    xor  a
    ld   [$C19B], a
    ret

label_157C::
    ldh  a, [hPressedButtonsMask]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, $4905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, label_158E
    ldh  [$FF9E], a

label_158E::
    ret

label_158F::
    ld   d, $FA
    ld   [label_1608], sp
    ld   d, $08
    ld   a, [$FAFA]
    ld   [SwitchBank_duplicate], sp
    ld   [label_16FA], sp
    ld   [label_1616], sp
    ld   d, $08
    ld   a, [$FAFA]
    call label_15AF
    ld   a, $02
    jp   SwitchBank

label_15AF::
    ld   a, [$C1C4]
    and  a
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   nz, label_15C0
    ld   a, [$C16A]
    cp   $05
    ret  z

label_15C0::
    ld   a, [wIsUsingSpinAttack]
    and  a
    jr   z, label_15CD
    ld   a, [$C136]
    add  a, $04
    jr   label_15CF

label_15CD::
    ldh  a, [$FF9E]

label_15CF::
    ld   e, a
    ld   d, $00
    ld   hl, $158F ; TODO: Check this
    add  hl, de
    ldh  a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ldh  [$FFCE], a
    swap a
    ld   c, a
    ld   hl, $159B ; TODO: Check this
    add  hl, de
    ldh  a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ldh  [$FFCD], a
    or   c
    ld   e, a
    ld   hl, wTileMap
    add  hl, de
    ld   a, h
    cp   $D7
    ret  nz
    push de
    ld   a, [hl]
    ldh  [$FFAF], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    pop  de
    cp   $D0

label_1608::
    db   $DA ; +
    db   $10
    db   $16
    db   $FE ; ¦
    db   $D4 ; +
    db   $DA ; +
    db   $C2 ; -
    db   $16
    db   $FE ; ¦
    db   $90 ; É
    db   $D2 ; -
    db   $C2 ; -
    db   $16
    db   $FE ; ¦

label_1616::
    ld   bc, $C2CA
    ld   d, $E
    nop
    ld   a, [$DBA5]
    and  a
    ldh  a, [$FFAF]
    jr   z, label_1629
    cp   $DD
    jr   z, label_1637
    ret

label_1629::
    inc  c
    cp   $D3
    jr   z, label_1637
    cp   $5C
    jr   z, label_1637
    cp   $0A
    ret  nz
    ld   c, $FF

label_1637::
    ld   a, c
    ldh  [$FFF1], a
    call label_2178
    ld   a, [$C14A]
    and  a
    jr   nz, label_1653
    ld   a, [$C16A]
    cp   $05
    jr   nz, label_1653
    xor  a
    ld   [$C122], a
    ld   a, $0C
    ld   [$C16D], a

label_1653::
    ld   a, $05
    call label_142F
    jr   c, label_167C
    xor  a
    ld   [$C19B], a
    ld   hl, $C200
    add  hl, de
    ldh  a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ldh  a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ldh  a, [$FFF1]
    ld   [hl], a
    ld   c, e
    ld   b, d
    call label_3942

label_167C::
    call GetRandomByte
    and  $07
    ret  nz
    ldh  a, [$FFAF]
    cp   $D3
    ret  z
    call GetRandomByte
    rra
    ld   a, $2E
    jr   nc, label_1691
    ld   a, $2D

label_1691::
    call label_3B86
    ret  c
    ld   hl, $C200
    add  hl, de
    ldh  a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ldh  a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $18
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ret

data_16BA::
    db $12, $EE, $FC, 4

data_16BE::
    db 4, 4, $EE, $12

label_16C2::
    ld   c, a
    ld   a, [$C16D]
    and  a
    ret  z
    ldh  a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_16BA
    add  hl, de
    ldh  a, [$FF98]
    add  a, [hl]
    ldh  [$FFD7], a
    ld   hl, data_16BE
    add  hl, de
    ldh  a, [$FF99]
    add  a, [hl]
    ldh  [$FFD8], a

label_16DF::
    ld   a, $04
    ld   [$C502], a
    call label_D15
    ld   a, $10
    ld   [$C1C4], a
    ld   a, c
    and  $F0
    cp   $90
    jr   z, label_16F8
    ld   a, $07
    ldh  [$FFF2], a
    ret

label_16F8::
    ld   a, $17

label_16FA::
    ldh  [$FFF4], a
    ret

data_16FD::
    db   $20, $E0, 0, 0

data_1701::
    db   0, 0, $E0, $20

label_1705::
    ldh  a, [$FFF9]
    and  a
    jr   z, label_1713
    ldh  a, [$FF9C]
    and  a
    ret  nz
    ldh  a, [$FF9E]
    and  $02
    ret  nz

label_1713::
    ld   a, [$C14A]
    and  a
    ret  nz
    ldh  a, [$FFA2]
    ld   hl, $C146
    or   [hl]
    ret  nz
    ld   a, [$C120]
    add  a, $02
    ld   [$C120], a
    call label_1756
    ld   a, [$C14B]
    inc  a
    ld   [$C14B], a
    cp   $20
    ret  nz
    ld   [$C14A], a
    xor  a
    ld   [wIsUsingSpinAttack], a
    ld   [$C122], a
    ldh  a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_16FD
    add  hl, de
    ld   a, [hl]
    ldh  [$FF9A], a
    ld   hl, data_1701
    add  hl, de
    ld   a, [hl]
    ldh  [$FF9B], a
    xor  a
    ld   [$C1AC], a
    ret

label_1756::
    ldh  a, [hFrameCounter]
    and  $07
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $FFA1
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ret  nz
    ldh  a, [$FF98]
    ldh  [$FFD7], a
    ld   a, [$C181]
    cp   $05
    jr   z, label_1781
    ld   a, $07
    ldh  [$FFF4], a
    ldh  a, [$FF99]
    add  a, $06
    ldh  [$FFD8], a
    ld   a, $0B
    jp   label_CC7

label_1781::
    ldh  a, [$FF99]
    ldh  [$FFD8], a
    ld   a, $0E
    ldh  [$FFF2], a
    ld   a, $0C
    jp   label_CC7

label_178E::
    xor  a
    ldh  [$FF9A], a
    ldh  [$FF9B], a
    ret

label_1794::
    call label_753A
    ld   a, [$C11C]
    cp   $01
    ret  z
    ld   a, [$C16A]
    and  a
    jr   z, label_17DB
    ld   bc, $C010
    ld   a, [$C145]
    ld   hl, $C13B
    add  a, [hl]
    ldh  [$FFD7], a
    ldh  a, [$FF98]
    ldh  [$FFD8], a
    ld   hl, $FFDA
    ld   [hl], $00
    ld   a, [$C122]
    cp   $28
    jr   c, label_17C6
    ldh  a, [hFrameCounter]
    rla
    rla
    and  $10
    ld   [hl], a

label_17C6::
    ld   a, [$C139]
    ld   h, a
    ld   a, [$C13A]
    ld   l, a
    ld   a, [$C136]
    ldh  [$FFD9], a
    ldh  a, [$FF99]
    cp   $88
    ret  nc
    jp   label_1819

label_17DB::
    ld   a, [$C19B]
    push af
    bit  7, a
    jp   z, label_1814
    ld   a, $02
    call SwitchBank
    call label_5310
    ld   a, [$C19B]
    and  $7F
    cp   $0C
    jr   nz, label_1814
    ld   hl, wDialogState
    ld   a, [wMapSlideTransitionState]
    or   [hl]
    jr   nz, label_1814
    call label_157C
    ld   a, $04
    call label_142F
    jr   c, label_1814
    ld   a, $0D
    ldh  [$FFF4], a
    ld   a, $02
    call SwitchBank
    call label_538B

label_1814::
    pop  af
    ld   [$C19B], a
    ret

label_1819::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4AB3
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_49BA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret
    call label_754F
    ld   a, [$C3C9]
    and  a
    jr   z, label_1847
    xor  a
    ld   [$C3C9], a
    jp   label_C7D

label_1847::
    call label_1A22
    xor  a
    ld   [$C157], a
    inc  a
    ld   [$C1A8], a
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jp   nz, label_19D9
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [hBaseScrollY], a
    ldh  [$FFB4], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   e, $10
    ld   hl, wEntitiesTypeTable

label_186C::
    ldi  [hl], a
    dec  e
    jr   nz, label_186C
    ld   a, [$C509]
    and  a
    jr   z, label_1898
    push af
    ld   a, $04
    call SwitchBank
    pop  af
    call label_7A5F
    ld   hl, $DB6E
    inc  [hl]
    ld   hl, $DB46
    inc  [hl]
    ld   a, [$DC0C]
    or   $40
    ld   [$DC0C], a
    ld   a, $01
    ld   [wDidStealItem], a
    xor  a
    ldh  [hLinkAnimationState], a

label_1898::
    ldh  a, [$FFF9]
    ldh  [$FFE4], a
    ld   a, GAMEPLAY_OVERWORLD
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    ld   [$C3CB], a
    ldh  [$FFF9], a
    ld   hl, $D401
    ld   a, [$DBA5]
    ldh  [$FFE6], a
    and  a
    jr   nz, label_18DF
    ld   hl, $D416
    ld   c, $00

label_18BA::
    ldh  a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    cp   [hl]
    jr   z, label_18D2
    inc  hl
    inc  c
    ld   a, c
    cp   $04
    jr   nz, label_18BA

label_18D2::
    ld   a, c
    sla  a
    sla  a
    add  a, c
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de

label_18DF::
    push hl
    ld   a, [hli]
    ld   [$DBA5], a
    cp   $02
    jr   nz, label_18F2
    ldh  [$FFF9], a
    dec  a
    ld   [$DBA5], a
    ld   a, $01
    ldh  [$FF9C], a

label_18F2::
    ld   a, [hli]
    ldh  [$FFF7], a
    ld   a, [$DBA5]
    and  a
    ld   a, [hli]
    ldh  [$FFF6], a
    jr   nz, label_1909
    ldh  a, [$FFE6]
    and  a
    jr   z, label_1907
    xor  a
    ld   [$D47C], a

label_1907::
    jr   label_196F

label_1909::
    ld   c, a
    ld   a, $14
    call SwitchBank
    push hl
    ldh  a, [$FFF7]
    swap a
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $4220
    add  hl, de
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_192E
    ld   hl, $44E0
    jr   label_193C

label_192E::
    cp   $06
    jr   nz, label_193C
    ld   a, [$DB6B]
    and  $04
    jr   z, label_193C
    ld   hl, $4520

label_193C::
    ld   e, $00

label_193E::
    ld   a, [hli]
    cp   c
    jr   z, label_1948
    inc  e
    ld   a, e
    cp   $40
    jr   nz, label_193E

label_1948::
    ld   a, e
    ld   [$DBAE], a
    ldh  a, [$FFE6]
    and  a
    jr   nz, label_196E
    xor  a
    ld   [$D47C], a
    ldh  a, [$FFF7]
    cp   $0A
    jr   nc, label_196E
    ld   a, $02
    call SwitchBank
    call label_6709
    ld   a, $30
    ldh  [$FFB4], a
    xor  a
    ld   [$D6FB], a
    ld   [$D6F8], a

label_196E::
    pop  hl

label_196F::
    ld   a, [hli]
    ld   [$DB9D], a
    ld   a, [hl]
    ld   [$DB9E], a
    pop  hl
    ldh  a, [$FFF9]
    and  a
    jr   nz, label_19DA
    ldh  a, [$FFE4]
    and  a
    jr   nz, label_19D9
    ld   a, [$DBA5]
    and  a
    jr   z, label_19C2
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_1993
    ld   hl, $4E3C
    jr   label_19A4

label_1993::
    cp   $0A
    jr   nc, label_19C2
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $4DF1
    add  hl, de

label_19A4::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_19C2
    push de
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_19B7
    ld   a, $3A
    jr   label_19BF

label_19B7::
    ld   e, a
    ld   d, $00
    ld   hl, $4E41
    add  hl, de
    ld   a, [hl]

label_19BF::
    pop  de
    ld   [de], a
    ret

label_19C2::
    ld   a, $00
    ldh  [$FFD7], a
    ld   de, $DB5F

label_19C9::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ldh  a, [$FFD7]
    inc  a
    ldh  [$FFD7], a
    cp   $05
    jr   nz, label_19C9
    ld   a, [$DBAE]
    ld   [de], a

label_19D9::
    ret

label_19DA::
    xor  a
    ldh  [$FF9E], a
    ret
    call label_754F
    ld   a, [$D474]
    and  a
    jr   z, label_19FC
    xor  a
    ld   [$D474], a
    ld   a, $30
    ld   [$C180], a
    ld   a, $03
    ld   [wWarpTransition], a
    ld   a, $04
    ld   [wTransitionSequenceCounter], a
    jr   label_1A06

label_19FC::
    call label_1A39
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, label_1A21

label_1A06::
    ld   a, [$D463]
    cp   $01
    jr   z, label_1A0F
    ld   a, $00

label_1A0F::
    ld   [$C11C], a
    ld   a, [wDidStealItem]
    and  a
    jr   z, label_1A21
    xor  a
    ld   [wDidStealItem], a
    ld   a, $36
    jp   label_2385

label_1A21::
    ret

label_1A22::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6C4F
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_55CA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

label_1A39::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6C7A
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_563B
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

label_1A50::
    ld   a, [$C120]
    sra  a
    sra  a
    sra  a
    and  $01
    ld   d, a
    ldh  a, [$FF9E]
    sla  a
    or   d
    ld   c, a
    ld   b, $00
    ld   hl, $4948
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_1A78
    ldh  a, [$FF9C]
    and  a
    jr   z, label_1A76
    ld   hl, $4950

label_1A76::
    jr   label_1AC7

label_1A78::
    ldh  a, [$FFF9]
    and  a
    jr   z, label_1A88
    ldh  a, [$FF9C]
    cp   $02
    jr   nz, label_1A88
    ld   hl, $4958
    jr   label_1AC7

label_1A88::
    ld   a, [$C15C]
    cp   $01
    jr   z, label_1AC4
    ldh  a, [$FFB2]
    and  a
    jr   nz, label_1A9A
    ld   a, [$C144]
    and  a
    jr   nz, label_1ABF

label_1A9A::
    ld   a, [wHasMirrorShield]
    and  a
    jr   nz, label_1AA5
    ld   hl, $4910
    jr   label_1AC7

label_1AA5::
    ld   hl, $4918
    cp   $02
    jr   nz, label_1AAF
    ld   hl, $4928

label_1AAF::
    ld   a, [wIsUsingShield]
    and  a
    jr   z, label_1ABD
    ld   a, l
    add  a, $08
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a

label_1ABD::
    jr   label_1AC7

label_1ABF::
    ld   hl, $4938
    jr   label_1AC7

label_1AC4::
    ld   hl, $4940

label_1AC7::
    add  hl, bc
    ld   a, [hl]
    ldh  [hLinkAnimationState], a
    ret

AnimateMarinBeachTiles::
    ld   a, [$D601]
    and  a
    ret  nz
    ld   a, $10
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6500
    ld   de, $9500
    ldh  a, [hFrameCounter]
    and  $0F
    jr   z, .skip
    cp   $08
    ret  nz
    ld   l, $40
    ld   e, l

.skip
    ldh  a, [hFrameCounter]
    and  $30
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    add  hl, bc
    ld   bc, $0040
    jp   CopyData
    jr   nz, AnimateTilesStep4
    and  b
    ldh  [$FFE0], a
    ldh  [$FFA0], a
    ld   h, b

AnimateTiles::
    ;
    ; Animate Marin dialog on beach tiles
    ;

    ; If GameplayType == MARIN_BEACH, handle special case
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MARIN_BEACH
    jr   z, AnimateMarinBeachTiles

    ;
    ; Animate Intro sequence tiles
    ;

    ; If GameplayType != INTRO, skip
    cp   GAMEPLAY_INTRO
    jr   nz, AnimateTilesStep2

    ; GameplayType == INTRO
    ld   a, [$D601]
    and  a                ; if $D601 != 0
    jp   nz, .returnEarly ;   return immediatly
    ldh  a, [hFrameCounter]
    and  $0F
    cp   $04              ; else if FrameCounter 4-lower-bits < 4
    jr   c, .returnEarly  ;   return immediately
    ld   a, $10
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
; Copy 32 bytes of data from address stored at $D006 to address stored at $D008
    ld   a, [$D006]
    ld   l, a
    ld   a, [$D007]
    ld   h, a
    ld   a, [$D008]
    ld   e, a
    ld   a, [$D009]
    ld   d, a
    ld   bc, $0020
    jp   CopyData
.returnEarly
    ret

AnimateTilesStep2::
    ;
    ; Animate End Credits tiles
    ;

    ; If GameplayType != CREDITS, skip
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    jr   nz, AnimateTilesStep3

    ; GameplayType == CREDITS
    ldh  a, [$FFA5]
    and  a                          ; if $FFA5 != 0
    jr   nz, AnimateEndCreditsTiles ;   handle end credits animated tiles
    ret

AnimateTilesStep3::
    ;
    ; Animate Overworld tiles
    ;

    ; If GameplayType > OVERWORLD
    cp   GAMEPLAY_OVERWORLD
    jp   c, AnimateTilesReturn ; return immediately

    ; If the Inventory window is overlapping the screen
    ld   a, [wWindowY]
    cp   $80
    jp   nz, AnimateTilesReturn ; return immediately

    ; If the Inventory apparition animation is running
    ld   a, [wInventoryAppearing]
    and  a
    jp   nz, DrawLinkSpriteAndReturn

AnimateTilesStep4::
    ld   hl, wMapSlideTransitionState
    ld   a, [$D601]
    or   [hl]
    jp   nz, DrawLinkSpriteAndReturn

    ld   a, [$D6F8]
    and  a
    jr   z, label_1B7D
    call label_1ED7
    jp   DrawLinkSpriteAndReturn

label_1B7D::
    ldh  a, [$FFA5]
    and  a
    jr   z, label_1BCD

AnimateEndCreditsTiles::
    ; a == $FFA5
    cp   $01
    jp   z, label_3F93
    cp   $02
    jp   z, label_3FA9
    cp   $03
    jp   z, label_1EB5
    cp   $04
    jp   z, label_1EBC
    cp   $08
    jp   z, label_1E69
    cp   $09
    jp   z, label_1EA1
    cp   $0A
    jp   z, label_1E2B
    cp   $0B
    jp   z, label_1E8D
    cp   $0C
    jp   z, label_1E33
    cp   $0D
    jp   z, label_1E01
    cp   $0E
    jr   z, label_1BC5
    cp   $0F
    jp   z, label_1DF0
    cp   $10
    jp   z, label_1DE9
    jp   DrawLinkSpriteAndReturn

label_1BC5::
    ld   a, $17
    ld   [MBC3SelectBank], a
    jp   $4062

label_1BCD::
    ; Increment $FFA6 (count of tiles animations run?)
    ldh  a, [$FFA6]
    inc  a
    ldh  [$FFA6], a

label_1BD2::
    ldh  a, [$FFA4]
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   e, $1D
    ld   sp, hl
    dec  de
    ld   d, $1C
    ld   a, [de]
    inc  e
    add  hl, sp
    inc  e
    adc  a, d
    inc  e
    adc  a, [hl]
    inc  e
    xor  c
    inc  e
    add  a, $1C
    push de
    inc  e
    db   $E4 ; Undefined instruction
    inc  e
    ldi  [hl], a
    inc  e
    ld   e, $1C
    rst  $28
    inc  e
    ei
    inc  e
    di
    inc  e
    rst  $30
    inc  e
    rst  $38
    inc  e
    ldh  a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_61AA
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn

label_1C13::
    ld   l, a
    jr   label_1C51
    ld   h, $6B
    jr   label_1C24
    ld   h, $6C
    jr   label_1C24
    ld   h, $73
    jr   label_1C24
    ld   h, $6A

label_1C24::
    ldh  a, [$FFA6]
    and  $0F
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13

data_1C31::
    db 0, $40, $80, $C0, $C0, $C0, $80, $40

label_1C39::
    ldh  a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    ldh  a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, data_1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6D

label_1C51::
    ld   de, $96C0

label_1C54::
    ld   bc, $0040
    call CopyData
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_1C87
    ld   a, $20
    ld   [MBC3SelectBank], a
    ld   b, $01
    call label_47F7
    jr   z, label_1C72
    ld   [MBC3SelectBank], a
    call CopyData

label_1C72::
    ld   a, $20
    ld   [MBC3SelectBank], a
    ld   b, $00
    call label_47F7
    jr   z, label_1C87
    ld   [MBC3SelectBank], a
    ld   de, $96C0
    call CopyData

label_1C87::
    jp   DrawLinkSpriteAndReturn
    ld   h, $6E
    jr   label_1C24
    ldh  a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    ldh  a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, data_1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6F
    jp   label_1C51
    ld   hl, $DCC0
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_1CB8
    ld   de, $8400
    jp   label_1C54

label_1CB8::
    ldh  a, [$FFA6]
    inc  a
    and  $03
    jp   nz, label_1C39
    ld   de, $90C0
    jp   label_1C54
    ld   h, $70

label_1CC8::
    ldh  a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13
    ld   h, $71

label_1CD7::
    ldh  a, [$FFA6]
    and  $03
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13
    ld   h, $72
    jr   label_1CD7

label_1CE8::
    ldh  a, [$FFA7]
    add  a, $40
    ldh  [$FFA7], a
    ret
    ld   h, $75
    jr   label_1CD7
    ld   h, $74
    jr   label_1CC8
    ld   h, $77
    jr   label_1CC8
    ld   h, $76
    jr   label_1CC8
    ld   a, $38
    ld   [MBC3SelectBank], a
    call label_7830
    jp   DrawLinkSpriteAndReturn
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

label_1D12::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  d
    jr   nz, label_1D12
    ld   a, $20
    ld   [MBC3SelectBank], a
    ret

label_1D1E::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_54F5
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

DrawLinkSprite::
DrawLinkSpriteAndReturn::
    ldh  a, [hLinkAnimationState]
    inc  a
    ret  z
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1D42
    ld   a, [$DBC7]
    and  $04
    jr   z, label_1D49
    ld   a, $04
    jr   label_1D49

label_1D42::
    ld   a, [$DBC7]
    rla
    rla
    and  $10

label_1D49::
    ld   [$C135], a
    ld   hl, $C008
    ld   a, [$C13B]
    ld   c, a
    ld   a, [$C145]
    add  a, c
    cp   $88
    ret  nc
    push af
    ldi  [hl], a
    ld   a, [$C13C]
    ld   c, a
    ldh  a, [$FF98]
    add  a, c
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11D]
    or   d
    ld   [hl], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1DA1
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DA1
    ldh  a, [hLinkAnimationState]
    cp   $50
    jr   c, label_1D8C
    cp   $55
    jr   nc, label_1D8C
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DA1

label_1D8C::
    ld   a, [wTunicType]
    and  a
    jr   z, label_1D95
    inc  a
    or   [hl]
    ld   [hl], a

label_1D95::
    ldh  a, [hLinkAnimationState]
    cp   $4E
    jr   z, label_1D9F
    cp   $4F
    jr   nz, label_1DA1

label_1D9F::
    ld   [hl], $03

label_1DA1::
    inc  hl
    pop  af
    ldi  [hl], a
    ldh  a, [$FF98]
    add  a, c
    add  a, $08
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11E]
    or   d
    ld   [hl], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1DE7
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DE7
    ldh  a, [hLinkAnimationState]
    cp   $50
    jr   c, label_1DD2
    cp   $55
    jr   nc, label_1DD2
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DE7

label_1DD2::
    ld   a, [wTunicType]
    and  a
    jr   z, label_1DDB
    inc  a
    or   [hl]
    ld   [hl], a

label_1DDB::
    ldh  a, [hLinkAnimationState]
    cp   $4E
    jr   z, label_1DE5
    cp   $4F
    jr   nz, label_1DE7

label_1DE5::
    ld   [hl], $23

label_1DE7::
    inc  hl

AnimateTilesReturn::
    ret

label_1DE9::
    ld   hl, $4F00
    ld   a, $0E
    jr   label_1DF5

label_1DF0::
    ld   a, $12
    ld   hl, $6080

label_1DF5::
    ld   [MBC3SelectBank], a
    ld   de, $8400
    ld   bc, $0040
    jp   label_1F3B

label_1E01::
    ld   a, [wTradeSequenceItem]
    cp   $02
    jp  c, label_1F3E
    sub  a, $02
    ld   d, a
    ld   e, $00
    sra  d
    rr   e
    sra  d
    rr   e
    ld   hl, $4400
    add  hl, de
    ld   de, $89A0
    ld   bc, $0040
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    jp   label_1F3B

label_1E2B::
    ld   hl, $68C0
    ld   de, $88E0
    jr   label_1EA7

label_1E33::
    ld   a, $11
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $5000

label_1E55::
    add  hl, de
    pop  de
    ld   bc, $0040
    call CopyData
    xor  a
    ldh  [$FFA5], a
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ret

label_1E69::
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $4D00
    jr   label_1E55

label_1E8D::
    ld   hl, $48E0
    ld   de, $88E0
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   bc, $0020
    jp   label_1F3B

label_1EA1::
    ld   hl, $68E0
    ld   de, $8CA0

label_1EA7::
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   bc, $0020
    jp   label_1F3B

label_1EB5::
    ld   hl, $7F00
    ld   a, $12
    jr   label_1EC1

label_1EBC::
    ld   hl, $4C40
    ld   a, $0D

label_1EC1::
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   de, $9140
    jp   label_1F38

data_1ECD::
    db $40, $68, $40, $68

data_1ED1::
    db 0, $68

data_1ED3::
    db $80, $68, 0, $68

label_1ED7::
    push af
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    pop  af
    ld   hl, $FFA1
    ld   [hl], $01
    ld   hl, $D6FB
    ld   e, [hl]
    ld   d, $00
    inc  a
    cp   $03
    jr   nz, label_1EFB
    push af
    ld   a, [$D6FB]
    xor  $02
    ld   [$D6FB], a
    pop  af

label_1EFB::
    ld   [$D6F8], a
    cp   $04

label_1F00::
    jr   nz, label_1F07
    ld   hl, data_1ECD
    jr   label_1F0E

label_1F07::
    cp   $08
    jr   nz, label_1F14
    ld   hl, data_1ED1

label_1F0E::
    add  hl, de
    ld   de, $9040
    jr   label_1F2C

label_1F14::
    cp   $06
    jr   nz, label_1F1D
    ld   hl, data_1ECD
    jr   label_1F28

label_1F1D::
    cp   $0A
    jr   nz, label_1F35
    xor  a
    ld   [$D6F8], a
    ld   hl, data_1ED3

label_1F28::
    add  hl, de
    ld   de, $9080

label_1F2C::
    ld   bc, $0040
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    jp   CopyData

label_1F35::
    jp   DrawLinkSpriteAndReturn

label_1F38::
    ld   bc, $0040

label_1F3B::
    call CopyData

label_1F3E::
    xor  a
    ldh  [$FFA5], a
    ld   a, $0C
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn

data_1F49::
    db   $C, 3, 8, 8

data_1F4D::
    db   $A, $A, 5, $10

data_1F51::
    db   $36, $38, $3A, $3C

data_1F55::
    db   2, 1, 8, 4

data_1F59::
    db   $FC, 4, 0, 0

data_1F5D::
    db   0, 0, 4, 0

label_1F61::
    call label_1F69
    ld   a, 2
    jp   SwitchBank

label_1F69::
    ld   hl, $C14A
    ld   a, [$C15C]
    or   [hl]
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $C11C
    or   [hl]
    jp   nz, label_2177
    ldh  a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_1F49
    add  hl, de
    ldh  a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ldh  [$FFCE], a
    swap a
    ld   c, a
    ld   hl, data_1F4D
    add  hl, de
    ldh  a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ldh  [$FFCD], a
    or   c
    ld   e, a
    ldh  [$FFD8], a
    ld   hl, wTileMap
    add  hl, de
    ld   a, h
    cp   $D7
    jp   nz, label_214E
    ld   a, [hl]
    ldh  [$FFD7], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    ldh  [$FFDC], a
    ldh  a, [$FFD7]
    cp   $9A
    jr   z, label_1FFE
    ldh  a, [$FFDC]
    cp   $00
    jp   z, label_214E
    cp   $01
    jr   z, label_1FE6
    cp   $50
    jp   z, label_214E
    cp   $51
    jp   z, label_214E
    cp   $11
    jp  c, label_214E
    cp   $D4
    jp   nc, label_214E
    cp   $D0
    jr   nc, label_1FE6
    cp   $7C
    jp   nc, label_214E

label_1FE6::
    ldh  a, [$FFD7]
    ld   e, a
    cp   $6F
    jr   z, label_1FF6
    cp   $5E
    jr   z, label_1FF6
    cp   $D4
    jp   nz, label_2098

label_1FF6::
    ld   a, [$DBA5]
    and  a
    ld   a, e
    jp   nz, label_2098

label_1FFE::
    ld   e, a
    ldh  a, [$FF9E]
    cp   $02
    jp   nz, label_20CF
    ld   a, $02
    ld   [$C1AD], a
    ldh  a, [$FFCC]
    and  $30
    jp   z, label_20CF
    ld   a, e
    cp   $5E
    ld   a, $8E
    jr   z, label_2088
    ld   a, e
    cp   $6F
    jr   z, label_2049
    cp   $D4
    jr   z, label_2049
    ld   a, [wIsMarinFollowingLink]
    and  a
    jr   z, label_2030
    ld   a, $78
    call label_237C
    jp   label_20CF

label_2030::
    ld   a, [$DB4E]
    and  a
    ldh  a, [$FFF6]
    jr   nz, label_203E
    ld   e, $FF
    cp   $A3
    jr   z, label_2046

label_203E::
    ld   e, $FC
    cp   $FA
    jr   z, label_2046
    ld   e, $FD

label_2046::
    ld   a, e
    jr   label_208E

label_2049::
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   hl, $5118
    add  hl, de
    ld   a, [$DB49]
    ld   e, a
    ld   a, [hl]
    cp   $A9
    jr   nz, label_2066
    bit  0, e
    jr   z, label_2066
    ld   a, $AF

label_2066::
    cp   $AF
    jr   nz, label_2080
    bit  0, e
    jr   nz, label_2080
    ldh  a, [$FFCE]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [$FFCD]
    and  $F0
    or   e
    ld   [$D473], a
    jp   label_20CF

label_2080::
    cp   $83
    jr   z, label_208E
    cp   $2D
    jr   z, label_2093

label_2088::
    call label_2373
    jp   label_20CF

label_208E::
    call label_2385
    jr   label_20CF

label_2093::
    call label_237C
    jr   label_20CF

label_2098::
    cp   $A0
    jr   nz, label_20CF
    ld   a, [$C18E]
    and  $1F
    cp   $0D
    jr   z, label_20CF
    ldh  a, [$FF9E]
    cp   $02
    jr   nz, label_20CF
    ld   [$C1AD], a
    ldh  a, [$FFCC]
    and  $30
    jr   z, label_20CF
    ldh  a, [$FFF9]
    and  a
    jr   nz, label_20BF
    ldh  a, [$FF9E]
    cp   $02
    jr   nz, label_20CF

label_20BF::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_5900
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_41D0

label_20CF::
    ld   a, [wAButtonSlot]
    cp   $03
    jr   nz, label_20DD
    ldh  a, [hPressedButtonsMask]
    and  $20
    jr   nz, label_20EC
    ret

label_20DD::
    ld   a, [wBButtonSlot]
    cp   $03
    jp   nz, label_2177
    ldh  a, [hPressedButtonsMask]
    and  $10
    jp   z, label_2177

label_20EC::
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_48B0
    ld   a, $01
    ldh  [$FFA1], a
    ldh  a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_1F51

    add  hl, de
    ld   a, [hl]
    ldh  [hLinkAnimationState], a
    ld   hl, data_1F55
    add  hl, de
    ldh  a, [hPressedButtonsMask]
    and  [hl]
    jr   z, label_214E
    ld   hl, data_1F59
    add  hl, de
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, data_1F5D
    add  hl, de
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, hLinkAnimationState
    inc  [hl]
    ld   e, $08
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_212C
    ld   e, $03

label_212C::
    ld   hl, $C15F
    inc  [hl]
    ld   a, [hl]
    cp   e
    jr   c, label_214D
    xor  a
    ldh  [$FFE5], a
    ldh  a, [$FFD7]
    cp   $8E
    jr   z, label_2153
    cp   $20
    jr   z, label_2153
    ld   a, [$DBA5]
    and  a
    jr   nz, label_214D
    ldh  a, [$FFD7]
    cp   $5C
    jr   z, label_2161

label_214D::
    ret

label_214E::
    xor  a
    ld   [$C15F], a
    ret

label_2153::
    call label_2165
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_50C3
    jp   ReloadSavedBank

label_2161::
    ld   a, $01
    ldh  [$FFE5], a

label_2165::
    ldh  a, [$FFD8]
    ld   e, a
    ldh  a, [$FFD7]
    ldh  [$FFAF], a
    call label_2178
    ldh  a, [$FF9E]
    ld   [$C15D], a
    jp   label_2183

label_2177::
    ret

label_2178::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_5526
    jp   ReloadSavedBank

label_2183::
    ld   a, $05
    call label_142F
    jr   c, label_21A7
    ld   a, $02
    ldh  [$FFF3], a
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   [hl], $07
    ld   hl, $C3B0
    add  hl, de
    ldh  a, [$FFE5]
    ld   [hl], a
    ld   c, e
    ld   b, d
    ld   e, $01
    ld   a, $03
    call SwitchBank
    jp   $5795

label_21A7::
    ret

label_21A8::
    ld   a, [wInventoryAppearing]
    and  a
    ret  nz
    ld   c, $01
    call label_21B6
    ld   c, $00
    ldh  [$FFD7], a

label_21B6::
    ld   b, $00
    ld   hl, $FF9A
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C11A
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $FF98
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_21D7
    ld   e, $F0

label_21D7::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret
    ldh  a, [$FFA3]
    push af
    swap a
    and  $F0
    ld   hl, $C149
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $FFA2
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_21FB
    ld   e, $F0

label_21FB::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

data_2205::
    db   $10, $10, 1, 1, $3E, 8, $EA, 0, $21, $CD, $34, $22, $C3, $1D, 8

label_2214::
    ld   a, [$C127]
    and  $20
    jr   z, label_221D
    inc  hl
    inc  hl

label_221D::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret

label_2224::
    ld   a, [$C127]
    and  $01
    jr   z, label_222C
    inc  hl

label_222C::
    ld   a, [hli]
    ld   [bc], a
    inc  hl
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4A76
    ld   a, $08
    ld   [MBC3SelectBank], a

label_2241::
    push bc
    push de
    ldh  a, [$FFD9]
    ld   c, a
    ld   b, $00
    ld   hl, wTileMap
    add  hl, bc
    ld   b, $00
    ld   c, [hl]
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2262
    ld   a, [$DBA5]
    and  a
    jr   nz, label_2262
    ld   a, $02
    ld   [rSVBK], a
    ld   c, [hl]
    xor  a
    ld   [rSVBK], a

label_2262::
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a, [$DBA5]
    and  a
    jr   z, label_2286
    ld   hl, $4000
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2299
    ld   hl, $43B0
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2291
    ld   hl, $4760
    jr   label_2291

label_2286::
    ld   hl, $6749
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2299
    ld   hl, $6B1D

label_2291::
    ld   a, $1A
    ld   [MBC3SelectBank], a
    call label_6576

label_2299::
    call label_3905
    add  hl, bc
    pop  de
    pop  bc
    ld   a, [$C125]
    and  $02
    jr   z, label_22D3
    call label_2214
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_22D1
    push bc
    push de
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_49D9
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    call label_2214
    ld   a, b
    ldh  [$FFE2], a
    ld   a, c
    ldh  [$FFE3], a
    ld   a, d
    ldh  [$FFE4], a
    ld   a, e
    ldh  [$FFE5], a
    call label_3905
    pop  de
    pop  bc

label_22D1::
    jr   label_22FE

label_22D3::
    call label_2224
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_22FE
    push bc
    push de
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_49D9
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    call label_2224
    ld   a, b
    ldh  [$FFE2], a
    ld   a, c
    ldh  [$FFE3], a
    ld   a, d
    ldh  [$FFE4], a
    ld   a, e
    ldh  [$FFE5], a
    call label_3905
    pop  de
    pop  bc

label_22FE::
    push bc
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, data_2205
    add  hl, bc
    ldh  a, [$FFD9]
    add  a, [hl]
    ldh  [$FFD9], a
    pop  bc
    ld   a, [$C128]
    dec  a
    ld   [$C128], a
    jp   nz, label_2241
    ld   a, $20
    ld   [MBC3SelectBank], a
    jp   $5570

label_2321::
    ld   a, [wDialogState]
    and  a
    ret  z
    ld   e, a
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    ld   a, $7E
    jr   nz, label_2332
    ld   a, $7F

label_2332::
    ldh  [$FFE8], a
    ld   a, [$C164]
    and  a
    ld   a, [$C170]
    jr   nz, label_2341
    cp   $20
    jr   c, label_2345

label_2341::
    and  $0F
    or   $10

label_2345::
    ld   [$C171], a
    ld   a, e
    and  $7F
    dec  a
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   l, e
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    ld   a, l
    inc  h
    or   a
    inc  h
    call label_2924
    dec  h
    sub  a, l
    ld   h, $14
    daa
    ld   l, b
    daa
    adc  a, d
    inc  h
    sub  a, e
    daa
    xor  a
    inc  h
    or   c
    inc  hl
    ld   a, $14
    ld   [MBC3SelectBank], a
    jp   $5449

label_2373::
    call label_2385
    ld   a, $01
    ld   [$C112], a
    ret

label_237C::
    call label_2385
    ld   a, $02
    ld   [$C112], a
    ret

label_2385::
    push af
    xor  a
    ld   [$C177], a
    pop  af
    ld   [$C173], a
    xor  a
    ld   [$C16F], a
    ld   [$C170], a
    ld   [$C164], a
    ld   [$C108], a
    ld   [$C112], a
    ld   a, $0F
    ld   [$C5AB], a
    ldh  a, [$FF99]
    cp   $48
    rra
    and  $80
    or   $01
    ld   [wDialogState], a
    ret

data_23B0::
    db   $C9, $AF, $EA, $9F, $C1, $3E, $18, $EA, $34, $C1, $F0, $FE, $A7, $C8, $FA, $95
    db   $DB, $FE, $B, $C0, $FA, $CC, $C3, $FE, 8, $D8, $3E, $21, $EA, 0, $21, $C3

data_23D0::
    db   $CF, $53, 0, $24, $48, 0

data_23D6::
    db   $24, $48, $98, $98, $98, $99

data_23DC::
    db   $99, $99, $21, $61, $A1, $41, $81, $C1

; Open dialog animation
; Saves tiles under the dialog box?
label_23E4::
    ld   a, [wDialogState]
    bit  7, a
    jr   z, label_23EF
    and  $7F
    add  a, $03

label_23EF::
    ld   e, a
    ld   d, $00
    ld   hl, data_23D0
    add  hl, de
    ld   a, [hl]
    add  a, $00
    ld   c, a
    ld   a, $D5
    adc  a, $00
    ld   b, a
    ld   hl, data_23DC
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   l, a
    ldh  [$FFD7], a
    ld   hl, data_23D6
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   h, a
    ldh  a, [$FFD7]
    ld   l, a
    xor  a
    ld   e, a
    ld   d, a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_2444

label_241E::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, l
    and  $1F
    jr   nz, label_242B
    ld   a, l
    dec  a
    and  $E0
    ld   l, a

label_242B::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_241E
    ld   e, $00
    ldh  a, [$FFD7]
    add  a, $20
    ldh  [$FFD7], a
    jr   nc, label_243C
    inc  h

label_243C::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_241E
    ret

label_2444::
    ld   a, [hl]
    ld   [bc], a
    ld   a, $01
    ld   [rVBK], a

label_244A::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hl]
    ld   [bc], a
    xor  a
    ld   [rVBK], a
    ld   [rSVBK], a
    inc  bc
    ld   a, l
    add  a, $01
    and  $1F
    jr   nz, label_2463
    ld   a, l
    and  $E0
    ld   l, a
    jr   label_2464

label_2463::
    inc  l

label_2464::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_2444
    ld   e, $00
    ldh  a, [$FFD7]
    add  a, $20
    ldh  [$FFD7], a
    jr   nc, label_2475
    inc  h

label_2475::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_2444
    ret
    ld   a, $1C
    ld   [MBC3SelectBank], a
    jp   $4A2C

label_2485::
    ld   hl, wDialogState
    inc  [hl]
    ret
    ld   a, [$C1AB]
    and  a
    jr   nz, label_24AE
    ldh  a, [$FFCC]
    and  $30
    jr   z, label_24AE

label_2496::
    xor  a
    ld   [$C16F], a
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   nz, label_24A4
    xor  a
    jr   label_24AB

label_24A4::
    ld   a, [wDialogState]
    and  $F0
    or   $0E

label_24AB::
    ld   [wDialogState], a

label_24AE::
    ret
    ld   a, $1C
    ld   [MBC3SelectBank], a
    jp   $4AA8
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   a, [wDialogScrollDelay]
    and  a
    jr   z, label_24C7
    dec  a
    ld   [wDialogScrollDelay], a
    ret

label_24C7::
    call label_49F1
    jp   label_2485
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   a, [wDialogState]
    ld   c, a
    ld   a, [$C171]
    bit  7, c
    jr   z, label_24DF
    add  a, $20

label_24DF::
    ld   c, a
    ld   b, $00
    ld   e, $01
    ld   d, $00
    ld   a, [$C12E]
    ld   hl, $45C1
    add  hl, bc
    add  a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    ld   [$C175], a
    push hl
    ld   hl, $4601
    add  hl, bc
    ld   a, [hl]
    and  $E0
    add  a, $20
    ld   e, a
    ld   a, [$C12F]
    add  a, [hl]
    ld   d, a
    cp   e
    jr   c, label_250D
    ld   a, d
    sub  a, $20
    ld   d, a

label_250D::
    ld   a, d
    ld   [$C176], a
    pop  hl
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    push hl
    ld   a, [$C170]
    and  $1F
    ld   c, a
    ld   hl, $45A1
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    call label_2485
    jp   label_2529

label_2529::
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   a, [$C170]
    and  $1F
    ld   c, a
    ld   b, $00
    ld   e, $05
    ld   d, $00
    ld   hl, $4581
    add  hl, bc
    ld   a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    push hl
    ld   hl, $4561
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    push hl
    ld   a, [$C112]
    ld   d, a
    ld   a, [$C173]
    ld   e, a
    sla  e
    rl   d
    ld   hl, $4001
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   d, [hl]
    push de
    ld   a, [$C173]
    ld   e, a
    ld   a, [$C112]
    ld   d, a
    ld   hl, $4741
    add  hl, de
    ld   a, [hl]
    and  $3F
    ld   [MBC3SelectBank], a
    pop  hl
    ld   a, [$C170]
    ld   e, a
    ld   a, [$C164]
    ld   d, a
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   [$C3C3], a
    call ReloadSavedBank
    ld   a, e
    ldh  [$FFD7], a
    cp   $FE
    jr   nz, label_25A4
    pop  hl
    xor  a
    ld   [$D601], a

label_2595::
    ld   a, [wDialogState]
    and  $F0
    or   $0D
    ld   [wDialogState], a

label_259F::
    ld   a, $15
    ldh  [$FFF2], a
    ret

label_25A4::
    cp   $FF
    jr   nz, label_25BD
    pop  hl
    xor  a
    ld   [$D601], a

label_25AD::
    ld   a, [wDialogState]
    and  $F0
    or   $0C
    ld   [wDialogState], a
    ret

data_25B8::
    db $55, $49, $4A, $46, $47

label_25BD::
    cp   $20
    jr   z, label_25E0
    push af
    ld   a, [$C5AB]
    ld   d, a
    ld   e, $01
    cp   $0F
    jr   z, label_25D4
    ld   e, $07
    cp   $19
    jr   z, label_25D4
    ld   e, $03

label_25D4::
    ld   a, [$C170]
    add  a, $04
    and  e
    jr   nz, label_25DF
    ld   a, d
    ldh  [$FFF3], a

label_25DF::
    pop  af

label_25E0::
    ld   d, $00
    cp   $23
    jr   nz, label_2608
    ld   a, [$C108]
    ld   e, a
    inc  a
    cp   $05
    jr   nz, label_25F0
    xor  a

label_25F0::
    ld   [$C108], a
    ld   hl, $DB4F
    ld   a, [$DB6E]
    and  a
    jr   z, label_25FF
    ld   hl, data_25B8

label_25FF::
    add  hl, de
    ld   a, [hl]
    dec  a
    cp   $FF
    jr   nz, label_2608
    ld   a, $20

label_2608::
    ldh  [$FFD8], a
    ld   e, a
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   hl, $4641
    add  hl, de
    ld   e, [hl]
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    call ReloadSavedBank
    ld   hl, $5000
    add  hl, de
    ld   c, l
    ld   b, h
    pop  hl
    ld   e, $10

label_2633::
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    jr   nz, label_2633
    ld   [hl], $00
    push hl
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ldh  a, [$FFD8]
    ld   e, a
    ld   d, $00
    xor  a
    pop  hl
    and  a
    jr   z, label_2663
    ld   e, a
    ld   a, [$C175]
    ldi  [hl], a
    ld   a, [$C176]
    sub  a, $20
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $C9
    rr   e
    jr   c, label_2660
    dec  a

label_2660::
    ldi  [hl], a
    ld   [hl], $00

label_2663::
    ld   a, [$C170]
    add  a, $01
    ld   [$C170], a
    ld   a, [$C164]
    adc  a, $00
    ld   [$C164], a
    xor  a
    ld   [$C1CC], a
    ld   a, [$C171]
    cp   $1F
    jr   z, label_268E

label_267E::
    ld   a, [wDialogState]
    and  $F0
    or   $06
    ld   [wDialogState], a
    ld   a, $00
    ld   [wDialogScrollDelay], a
    ret

label_268E::
    jp   label_2485

data_2691::
    db $22, $42

data_2693::
    db $98, $99

label_2695::
    ld   a, [$C170]
    and  $1F
    jr   nz, label_26E1
    ld   a, [$C3C3]
    cp   $FF
    jp   z, label_25AD
    cp   $FE
    jp   z, label_2595
    ld   a, [$C1CC]
    and  a
    jr   nz, label_26B6
    inc  a
    ld   [$C1CC], a
    call label_259F

label_26B6::
    call label_27BB
    ldh  a, [$FFCC]
    bit  4, a
    jr   nz, label_26E1
    bit  5, a
    jr   z, label_2714
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MINI_MAP
    jp   z, label_278B
    ld   a, [$C173]
    ld   e, a
    ld   a, [$C112]
    ld   d, a
    ld   hl, $4741
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_278B

label_26E1::
    ld   e, $00
    ld   a, [wDialogState]
    and  $80
    jr   z, label_26EB
    inc  e

label_26EB::
    ld   d, $00
    ld   hl, data_2693
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   [$D601], a
    ld   hl, data_2691
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   [$D602], a
    ld   a, $4F
    ld   [$D603], a
    ldh  a, [$FFE8]
    ld   [$D604], a
    xor  a
    ld   [$D605], a
    call label_2485

label_2714::
    ret

data_2715::
    db $62, $82

data_2717::
    db $98, $99

; Scroll dialog line?
DialogBeginScrolling::
    ld   e, $00
    ld   a, [wDialogState]
    and  $80
    jr   z, label_2723
    inc  e

label_2723::
    ld   d, $00
    ld   hl, data_2717
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2715

label_2731::
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   c, a
    ld   e, $10

label_2739::
    ld   a, c
    sub  a, $20
    ld   l, a
    ld   h, b
    ld   a, [bc]
    ld   [hl], a
    push bc
    ld   a, c
    add  a, $20
    ld   c, a
    ld   a, l
    add  a, $20
    ld   l, a
    ld   a, [bc]
    ld   [hl], a
    ld   a, l
    add  a, $20
    ld   l, a
    ldh  a, [$FFE8]
    ld   [hl], a
    pop  bc
    inc  bc
    ld   a, c
    and  $1F
    jr   nz, label_275D
    ld   a, c
    sub  a, $20
    ld   c, a

label_275D::
    dec  e
    jr   nz, label_2739
    ld   a, $08  ; Pause the scrolling for 8 frames
    ld   [wDialogScrollDelay], a
    jp   label_2485
    ret

data_2769::
    db $42, $62

data_276B::
    db $98, $99

DialogFinishScrolling::
    ld   e, 0
    ld   a, [$C0FB+$A4]
    and  $80 ; 'Ç'
    jr   z, label_2777
    inc  e

label_2777::
    ld   d, $00
    ld   hl, data_276B
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2769
    call label_2731
    jp   label_267E

label_278B::
    ld   a, $02
    ld   [$C177], a
    jp   label_2496
    ldh  a, [$FFCC]
    bit  4, a
    jp   nz, label_27B7
    and  $03
    jr   z, label_27AA
    ld   hl, $C177
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    ld   a, $0A
    ldh  [$FFF2], a

label_27AA::
    ldh  a, [hFrameCounter]
    and  $10
    ret  z
    ld   a, $17
    ld   [MBC3SelectBank], a
    jp   $7DCC

label_27B7::
    call label_2496
    ret

label_27BB::
    ld   a, $17
    ld   [MBC3SelectBank], a
    jp   $7D7C

; Set overworld music track?
label_27C3::
    ld   [wOverworldMusic], a
    ldh  [$FFBF], a
    ld   a, $38
    ldh  [$FFAB], a
    xor  a
    ldh  [$FFA8], a
    ret

EnableExternalRAMWriting::
    push hl
    ld   hl, $4000
    ld   [hl], $00 ; Switch to RAM bank 0
    ld   hl, $0000
    ld   [hl], $0A ; Enable external RAM writing
    pop  hl
    ret

label_27DD::
    ld   a, $02
    ld   [MBC3SelectBank], a
    push bc
    call label_4146
    pop  bc
    jp   ReloadSavedBank

label_27EA::
    ld   a, $38
    ldh  [$FFA8], a
    xor  a
    ldh  [$FFAB], a
    ret

label_27F2::
    ldh  a, [$FFBC]
    and  a
    jr   nz, .skip
    ld   a, $1F
    ld   [MBC3SelectBank], a
    call label_4003
.skip
    jp   ReloadSavedBank

label_2802::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_5E67
    jp   ReloadSavedBank

; Return a random number in `a`
GetRandomByte::
    push hl
    ldh  a, [hFrameCounter]
    ld   hl, wRandomSeed
    add  a, [hl]
    ld   hl, rLY
    add  a, [hl]
    rrca
    ld   [wRandomSeed], a ; wRandomSeed += FrameCounter + rrca(rLY)
    pop  hl
    ret

ReadJoypadState::
    ld   a, [wMapSlideTransitionState]
    and  a
    jr   nz, label_2886 ; return
    ld   a, [wGameplayType]
    cp   GAMEPLAY_OVERWORLD
    jr   nz, label_2852
    ld   a, [wGameplaySubtype]
    cp   $07
    jr   nz, label_284C
    ld   a, [$C11C]
    cp   $07
    jr   nz, label_283F
    ldh  a, [$FF9C]
    cp   $04
    jr   z, label_2852

label_283F::
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, label_284C
    ld   a, [$DDD5]
    and  a
    jr   z, label_2852

label_284C::
    xor  a
    ldh  [hPressedButtonsMask], a
    ldh  [$FFCC], a
    ret

label_2852::
    ld   a, $20
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    cpl
    and  $0F
    ld   b, a
    ld   a, $10
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    swap a
    cpl
    and  $F0
    or   b
    ld   c, a
    ldh  a, [hPressedButtonsMask]
    xor  c
    and  c
    ldh  [$FFCC], a
    ld   a, c
    ldh  [hPressedButtonsMask], a
    ld   a, $30
    ld   [rJOYP], a

label_2886::
    ret

label_2887::
    push bc
    ldh  a, [$FFCD]
    ld   hl, hBaseScrollY
    add  a, [hl]
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $0000
    ld   e, a
    ld   hl, vBGMap0
    ld   b, $20

label_289F::
    add  hl, de
    dec  b
    jr   nz, label_289F
    push hl
    ldh  a, [$FFCE]
    ld   hl, hBaseScrollX
    add  a, [hl]
    pop  hl
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $0000
    ld   e, a
    add  hl, de
    ld   a, h
    ldh  [$FFCF], a
    ld   a, l
    ldh  [$FFD0], a
    pop  bc
    ret

; Jump to the routine defined at the given index in the jump table.
;
; Usage:
;   ld   a, <routine_index>
;   rst  0
;   dw   $0E00 ; jump address for index 0
;   dw   $0F00 ; jump address for index 1
;   ...
;
; Input:
;   a:  index of the routine address in the jump table
TableJump::
    ld   e, a    ; \
    ld   d, $00  ; | Multiply the index by 2, and store it in de
    sla  e       ; |
    rl   d       ; /
    pop  hl
    add  hl, de  ; Add the base address and the offset
    ld   e, [hl] ; Load the low byte of the target address
    inc  hl
    ld   d, [hl] ; Load the high byte of the target address
    ld   l, e
    ld   h, d
    jp   hl    ; Jump to the target address

; Turn off LCD at next vertical blanking
LCDOff::
    ld   a, [rIE]
    ldh  [$FFD2], a ; Save interrupts configuration
    res  0, a
    ld   [rIE], a   ; Disable all interrupts
.waitForEndOfLine
    ld   a, [rLY]
    cp   $91
    jr   nz, .waitForEndOfLine ; Wait for row 145
    ld   a, [rLCDC]  ; \
    and  $7F         ; | Switch off LCD screen
    ld   [rLCDC], a  ; /
    ldh  a, [$FFD2]
    ld   [rIE], a    ; Restore interrupts configuration
    ret

label_28E8::
    ld   a, $01
    call SwitchBank
    jp   $6CE3

label_28F0:: ; label accessed directly by a jump table
    ld   a, $7E    ; value
    ld   bc, $0400 ; count
    jr   ClearMap

; Fill the Background Map with all 7Fs
ClearBGMap::
    ld   a, $7F    ; value
    ld   bc, $0800 ; count

; Fill the Background Map with a value
; Inputs:
;   a  : value to fill
;   bc : count
ClearMap::
    ld   d, a
    ld   hl, vBGMap0
.clearMap_loop
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, .clearMap_loop
    ret

include "code/home/copy_data.asm"

label_291D::
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de

label_2924::
    call label_2941

label_2927::
    ld   a, [wMapSlideTransitionState]
    and  a
    jr   nz, label_293C

label_292D::
    ld   a, [de]
    and  a
    jr   nz, label_291D
    ret

label_2932::
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de
    call label_2991

label_293C::
    ld   a, [de]
    and  a
    jr   nz, label_2932
    ret

label_2941::
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    rlca
    rlca
    and  $03
    jr   z, label_2955
    dec  a
    jr   z, label_2966
    dec  a
    jr   z, label_2977
    jr   label_2984

label_2955::
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_2961
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_2961::
    inc  de
    dec  b
    jr   nz, label_2955
    ret

label_2966::
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_2972
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_2972::
    dec  b
    jr   nz, label_2966
    inc  de
    ret

label_2977::
    ld   a, [de]
    ld   [hl], a
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, label_2977
    ret

label_2984::
    ld   a, [de]
    ld   [hl], a
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, label_2984
    inc  de
    ret

label_2991::
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    and  $80
    jr   nz, UpdateNextBGColumnWithTiles

label_299B::
    ld   a, [de]
    cp   $EE
    jr   z, label_29AB
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_29AB
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_29AB::
    inc  de
    dec  b
    jr   nz, label_299B
    ret

UpdateNextBGColumnWithTiles::
    ld   a, [de]
    cp   $EE
    jr   z, .UpdateNextBGColumnWithTiles_continue
    ld   [hl], a

.UpdateNextBGColumnWithTiles_continue
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, UpdateNextBGColumnWithTiles
    ret

include "src/code/home/clear_memory.asm"

label_29ED::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_5884
    jp   ReloadSavedBank

label_29F8::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4C98
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

label_2A07::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_5A59
    jp   ReloadSavedBank

label_2A12::
    ld   a, $08
    ld   [MBC3SelectBank], a
    ld   hl, $4AD4
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2A23
    ld   hl, $4BD4

label_2A23::
    add  hl, de
    ld   a, [hl]
    ret

label_2A26::
    call label_2A12
    jp   ReloadSavedBank

label_2A2C::
    call label_2A12
    push af
    ld   a, $03
    ld   [MBC3SelectBank], a
    pop  af
    ret

label_2A37::
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    jp   CopyData

label_2A57::
    call label_2A66
    ld   de, $8400
    ld   hl, $7600
    ld   bc, $0100
    jp   CopyData

label_2A66::
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $4000
    ld   de, $8000
    ld   bc, $1800
    call CopyData
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $57E0
    ld   de, $97F0
    ld   bc, $0010
    call CopyData
    ld   a, $12
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $7500
    ld   de, $8000
    ld   bc, $0040
    call CopyData
    ld   de, $8D00
    ld   hl, $7500
    ld   bc, $0200
    jp   CopyData
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ld   a, $12
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6000
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $0F
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6000
    ld   de, $8800
    ld   bc, $0800
    jp   CopyData
    ld   hl, $4000
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B01
    ld   hl, $6800
    ld   a, $35
    jr   label_2B06
    ld   hl, $4800
    jr   label_2B01
    ld   hl, $6000

label_2B01::
    ld   a, $13
    call AdjustBankNumberForGBC

label_2B06::
    ld   [MBC3SelectBank], a
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $5800
    ld   de, $8800
    ld   bc, $1000
    jp   CopyData
    call PlayAudioStep
    ld   hl, $6800
    ld   a, $10
    call label_2B92
    call PlayAudioStep
    ld   a, $12
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6600
    ld   de, $8000
    ld   bc, $0080
    call CopyData
    call PlayAudioStep
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_2B61
    ld   a, $10
    ld   [MBC3SelectBank], a
    ld   hl, $6900
    ld   de, $8100
    ld   bc, $0700
    jp   CopyData

label_2B61::
    ld   a, $38
    ld   [MBC3SelectBank], a
    ld   hl, $5000
    ld   de, $8000
    ld   bc, $0800
    jp   CopyData
    ld   hl, $7800
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B90
    ld   hl, $7800
    ld   a, $35
    jr   label_2B95
    ld   hl, $4800
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B90
    ld   hl, $7000
    ld   a, $35
    jr   label_2B95

label_2B90::
    ld   a, $13

label_2B92::
    call AdjustBankNumberForGBC

label_2B95::
    ld   [MBC3SelectBank], a
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    call CopyData
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData

label_2BC1::
    push bc
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_5838
    call ReloadSavedBank
    pop  bc
    ret

; Load tiles from bank $0C to Tiles Map
LoadBank0CTiles::
    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, $0C
    call SwitchAdjustedBank
    ; Copy $400 bytes from the first tile sheet to Tiles map 0
    ld   hl, $4000
    ld   de, vTiles0
    ld   bc, $0400
    call CopyData

    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, $0C
    call SwitchAdjustedBank
    ; Copy $1000 bytes from the second tile sheet to Tiles Map 1
    ld   hl, $4800
    ld   de, vTiles1
    ld   bc, $1000
    call CopyData

    ; Copy $20 bytes from $47A0 to a portion of Tiles Map 1 ($8E00)
    ld   hl, $47A0
    ld   de, vTiles1 + $600
    ld   bc, $0020
    call CopyData

    ; Select bank 1
    ld   a, $01
    call SwitchBank
    ret

    call LoadBank0CTiles
    ld   a, $0F
    call SwitchAdjustedBank
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $0400
    call CopyData
    ld   a, $0F
    call SwitchAdjustedBank
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData

label_2C28::
    ld   a, $20
    call SwitchBank
    ld   hl, $4589
    ldh  a, [$FFF7]
    ld   e, a
    ld   d, $00
    cp   $FF
    jr   nz, label_2C53
    ld   a, $35
    ld   [MBC3SelectBank], a
    ld   hl, $6200
    ld   de, $9000
    ld   bc, $0100
    call CopyData
    ld   e, $00
    ld   d, e
    ld   hl, $6000
    push de
    jr   label_2C5D

label_2C53::
    push de
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $0D
    call SwitchAdjustedBank

label_2C5D::
    ld   de, $9100
    ld   bc, $0100
    call CopyData
    ld   a, $0D
    call SwitchAdjustedBank
    ld   hl, $4000
    ld   de, $9200
    ld   bc, $0600
    call CopyData
    ld   a, $20
    ld   [MBC3SelectBank], a
    pop  de
    push de
    ld   hl, $45A9
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2C8A
    ld   hl, $45C9

label_2C8A::
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    call ReloadSavedBank
    ld   de, $9200
    ld   bc, $0200
    call CopyData
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $47C0
    ld   de, $DCC0
    ld   bc, $0040
    call CopyData
    call label_2D50
    ld   a, $20
    ld   [MBC3SelectBank], a
    pop  de
    ld   hl, $45CA
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $12
    call SwitchAdjustedBank
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2CD1
    ld   hl, $6100
    ld   a, $35
    ld   [MBC3SelectBank], a

label_2CD1::
    ld   de, $8F00
    ld   bc, $0100
    call CopyData
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ld   hl, $7D00
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_2CF5
    cp   $0A
    jr   c, label_2CF5
    ld   a, $0C
    call SwitchAdjustedBank
    ld   hl, $4C00

label_2CF5::
    ld   de, $8C00
    ld   bc, $0300
    call CopyData

label_2CFE::
    ld   a, [$DB4B]
    and  a
    jr   z, label_2D07
    call label_1E2B

label_2D07::
    ld   a, [$DBA5]
    and  a
    jr   z, label_2D17
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_2D21
    cp   $0A
    jr   c, label_2D21

label_2D17::
    ld   a, [$DB15]
    cp   $06
    jr   c, label_2D21
    call label_1EA1

label_2D21::
    ld   a, [wTradeSequenceItem]
    cp   $02
    jr   c, label_2D2C
    ld   a, $0D
    ldh  [$FFA5], a

label_2D2C::
    ret
    ld   a, $0C
    call SwitchAdjustedBank
    ld   hl, $5200
    ld   de, $9200
    ld   bc, $0600
    call CopyData
    ld   hl, $4C00
    ld   de, $8C00
    ld   bc, $0400
    call CopyData
    call label_2D50
    jp   label_2CFE

label_2D50::
    xor  a
    ldh  [$FFA6], a
    ldh  [$FFA7], a
    call label_1BD2
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $4800
    ld   de, $8800
    ld   bc, $0800
    call CopyData
    ld   hl, $4200
    ld   de, $8200
    ld   bc, $0100
    call CopyData
    ret
    ld   a, $01
    call SwitchBank
    ld   hl, $6D4A
    ld   de, $8700
    ld   bc, $0080
    call CopyData
    ld   a, $10
    call SwitchAdjustedBank
    ld   hl, $5400
    ld   de, $8000
    ld   bc, $0600
    call CopyData
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $1000
    jp   CopyData
    ld   a, $0F
    call SwitchAdjustedBank
    ld   hl, $4900
    ld   de, $8800
    ld   bc, $0700
    call CopyData
    ld   a, $38
    call SwitchBank
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_2DC7
    ld   hl, $5C00
    jr   label_2DCA

label_2DC7::
    ld   hl, $5800

label_2DCA::
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_2DDD
    ld   hl, $6600
    jr   label_2DE0

label_2DDD::
    ld   hl, $6500

label_2DE0::
    ld   de, $8200
    ld   bc, $0100
    jp   CopyData
    ld   a, $0C
    call SwitchAdjustedBank
    ld   hl, $7800
    ld   de, $8F00
    ld   bc, $0800
    call CopyData
    ld   hl, $5000
    ld   de, $8200
    ld   bc, $0100
    jp   CopyData
    ld   hl, $7000
    jr   label_2E13
    ld   hl, $7800
    jr   label_2E13
    ld   hl, $5800

label_2E13::
    ld   a, $10
    call SwitchAdjustedBank
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData
    ld   a, $13
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $7C00
    ld   de, $8C00
    ld   bc, $0400
    call CopyData
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0400
    jp   CopyData
    ld   a, $10
    call SwitchAdjustedBank
    ld   hl, $6700
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ld   hl, $6000
    ld   de, $9000
    ld   bc, $0600
    jp   CopyData
    ld   a, $0F
    call SwitchBank
    ld   hl, $4400
    ld   de, $8800
    ld   bc, $0500
    jp   CopyData

data_2E6F::
    db 0

label_2E70::
    ld   de, $120E

label_2E73::
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2E84
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_475A
    jp   label_2F12

label_2E84::
    xor  a

label_2E85::
    ldh  [$FFD7], a
    ld   hl, $C193
    ld   e, a
    ld   d, $00
    add  hl, de
    and  a
    jr   nz, label_2ED3
    ld   a, [$DBA5]
    and  a
    jr   z, label_2EB0
    ldh  a, [$FFF9]
    and  a
    jr   nz, label_2ED3
    ldh  a, [$FFF7]
    cp   $14
    jr   z, label_2ED3
    cp   $0A
    jr   c, label_2ED3
    ldh  a, [$FFF6]
    cp   $FD
    jr   z, label_2ED3
    cp   $B1
    jr   z, label_2ED3

label_2EB0::
    ld   a, [wIsBowWowFollowingLink]
    cp   $01
    ld   a, $A4
    jr   z, label_2ED1
    ld   a, [wIsGhostFollowingLink]
    and  a
    ld   a, $D8
    jr   nz, label_2ED1
    ld   a, [wIsRoosterFollowingLink]
    and  a
    ld   a, $DD
    jr   nz, label_2ED1
    ld   a, [wIsMarinFollowingLink]
    and  a
    jr   z, label_2ED3
    ld   a, $8F

label_2ED1::
    jr   label_2ED4

label_2ED3::
    ld   a, [hl]

label_2ED4::
    and  a
    jr   z, label_2F0A
    push af
    and  $3F
    ld   b, a
    ld   c, $00
    pop  af
    swap a
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_2E6F
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_2EF2
    call AdjustBankNumberForGBC

label_2EF2::
    ld   [MBC3SelectBank], a
    ldh  a, [$FFD7]
    ld   d, a
    ld   e, $00
    ld   hl, $8400
    add  hl, de
    ld   e, l
    ld   d, h
    ld   hl, $4000
    add  hl, bc
    ld   bc, $0100
    call CopyData

label_2F0A::
    ldh  a, [$FFD7]
    inc  a
    cp   $04
    jp   nz, label_2E85

label_2F12::
    ld   de, $9000
    ld   a, [$DBA5]
    and  a
    jp   z, label_2FAD
    ld   a, $0D
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [$FFF9]
    and  a
    jr   z, label_2F4B
    ld   hl, $7000
    ldh  a, [$FFF7]
    cp   $06
    jr   z, label_2F41
    cp   $0A
    jr   nc, label_2F3B

label_2F36::
    ld   hl, $7800
    jr   label_2F41

label_2F3B::
    ldh  a, [$FFF6]
    cp   $E9
    jr   z, label_2F36

label_2F41::
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ret

label_2F4B::
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_2F57
    ldh  a, [$FFF6]
    cp   $12
    jr   nz, label_2F69

label_2F57::
    ld   hl, $5000
    ldh  a, [$FF94]
    cp   $FF
    jr   z, label_2F69
    add  a, $50
    ld   h, a
    ld   bc, $0100
    call CopyData

label_2F69::
    ldh  a, [$FFF7]
    cp   $10
    jr   nz, label_2F87
    ldh  a, [$FFF6]
    cp   $B5
    jr   nz, label_2F87
    ld   a, $35
    ld   [MBC3SelectBank], a
    ld   hl, $6600
    ld   de, $8F00
    ld   bc, $0200
    call CopyData
    ret

label_2F87::
    ldh  a, [hIsGBC]
    and  a
    ret  z
    ldh  a, [$FFF7]
    and  a
    ret  nz
    ld   a, $35
    ld   [MBC3SelectBank], a
    ld   hl, $6E00
    ld   de, $9690
    ld   bc, $0010
    call CopyData
    ld   hl, $6E10
    ld   de, $9790
    ld   bc, $0010
    call CopyData
    ret

label_2FAD::
    ld   a, $0F
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ldh  a, [$FF94]
    cp   $0F
    jr   z, label_2FC6
    add  a, $40
    ld   h, a
    ld   l, $00
    ld   bc, $0200
    call CopyData

label_2FC6::
    ret

label_2FC7::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ret

label_2FCD::
    ld   a, [hl]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $6749
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_2FEC
    cp   $10
    jr   nz, label_2FF1
    ldh  a, [$FFF6]
    cp   $B5
    jr   nz, label_2FF1

label_2FEC::
    ld   hl, $4760
    jr   label_2FFA

label_2FF1::
    ld   a, [$DBA5]
    and  a
    jr   z, label_2FFA
    ld   hl, $4000

label_2FFA::
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a
    ret

label_300E::
    ld   a, $02
    ld   [rSVBK], a
    ld   c, [hl]
    xor  a
    ld   [rSVBK], a
    jr   label_3019

label_3018::
    ld   c, [hl]

label_3019::
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a, $1A
    ld   [MBC3SelectBank], a
    call label_6576
    call label_3905
    ld   a, [$DBA5]
    and  a
    jr   z, label_304C
    ld   hl, $43B0
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_3047
    cp   $10
    jr   nz, label_304F
    ldh  a, [$FFF6]
    cp   $B5
    jr   nz, label_304F

label_3047::
    ld   hl, $4760
    jr   label_304F

label_304C::
    ld   hl, $6B1D

label_304F::
    push de
    add  hl, bc
    call label_2FC7
    pop  de
    push hl
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    ldh  a, [$FFE0]
    ld   h, a
    ldh  a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call label_2FC7
    xor  a
    ld   [rVBK], a
    call label_3905
    ld   a, h
    ldh  [$FFE0], a
    ld   a, l
    ldh  [$FFE1], a
    pop  hl
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    push de
    call label_2FC7
    pop  de
    ldh  a, [$FFDF]
    ld   [MBC3SelectBank], a
    ldh  a, [$FFE0]
    ld   h, a
    ldh  a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call label_2FC7
    xor  a
    ld   [rVBK], a
    call label_3905
    ret

label_309B::
    call label_3905
    call SwitchBank
    ld   de, vBGMap0
    ld   hl, wTileMap
    ld   c, $80

label_30A9::
    push de
    push hl
    push bc
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_30B6
    call label_2FCD
    jr   label_30C4

label_30B6::
    ld   a, [$DBA5]
    and  a
    jr   z, label_30C1
    call label_3018
    jr   label_30C4

label_30C1::
    call label_300E

label_30C4::
    pop  bc
    pop  hl
    pop  de
    inc  hl
    ld   a, l
    and  $0F
    cp   $0B
    jr   nz, label_30D5
    ld   a, l
    and  $F0
    add  a, $11
    ld   l, a

label_30D5::
    ld   a, e
    add  a, $02
    ld   e, a
    and  $1F
    cp   $14
    jr   nz, label_30E9
    ld   a, e
    and  $E0
    add  a, $40
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

label_30E9::
    dec  c
    jr   nz, label_30A9
    ld   a, $01
    ld   [MBC3SelectBank], a
    jp   label_6DEA

label_30F4::
    ld   a, $01
    ld   [rIE], a
    ld   hl, $D47F
    inc  [hl]
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4CA3
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3119
    ld   a, $21
    ld   [MBC3SelectBank], a
    call label_40B3
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_6DAF

label_3119::
    ld   a, $09
    ld   [MBC3SelectBank], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_313A
    ld   a, $14
    ld   [MBC3SelectBank], a
    ldh  [$FFE8], a
    call label_5897
    ld   e, a
    ld   hl, wKillCount2

label_3132::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $11
    jr   nz, label_3132

label_313A::
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, wMinimapTiles
    ld   a, [$DBA5]
    and  a
    jr   z, label_3161
    ld   hl, $D900
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_3156
    ld   hl, $DDE0
    jr   label_3161

label_3156::
    cp   $1A
    jr   nc, label_3161
    cp   $06
    jr   c, label_3161
    ld   hl, $DA00

label_3161::
    add  hl, de
    ldh  a, [$FFF9]
    and  a
    ld   a, [hl]
    jr   nz, label_316B
    or   $80
    ld   [hl], a

label_316B::
    ldh  [$FFF8], a
    ldh  a, [$FFF6]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    ld   a, [$DBA5]
    and  a
    jr   z, label_31BF
    ld   a, $0A
    ld   [MBC3SelectBank], a
    ldh  [$FFE8], a
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_318F
    ld   hl, $7B77
    jp   label_3224

label_318F::
    cp   $1F
    jr   nz, label_31A6
    ldh  a, [$FFF6]
    cp   $F5
    jr   nz, label_31A6
    ld   a, [wTradeSequenceItem]
    cp   $0E
    jr   nz, label_31A6
    ld   bc, $7855
    jp   label_323A

label_31A6::
    ld   hl, $4000
    ldh  a, [$FFF7]
    cp   $1A
    jr   nc, label_3224
    cp   $06
    jr   c, label_3224
    ld   a, $0B
    ld   [MBC3SelectBank], a
    ldh  [$FFE8], a
    ld   hl, $4000
    jr   label_3224

label_31BF::
    ldh  a, [$FFF6]
    cp   $0E
    jr   nz, label_31D1
    ld   a, [$D80E]
    and  $10
    jr   z, label_3221
    ld   bc, $47EC
    jr   label_322F

label_31D1::
    cp   $8C
    jr   nz, label_31E1
    ld   a, [$D88C]
    and  $10
    jr   z, label_3221
    ld   bc, $434E
    jr   label_322F

label_31E1::
    cp   $79
    jr   nz, label_31F1
    ld   a, [$D879]
    and  $10
    jr   z, label_3221
    ld   bc, $6513
    jr   label_322F

label_31F1::
    cp   $06
    jr   nz, label_3201
    ld   a, [$D806]
    and  $10
    jr   z, label_3221
    ld   bc, $4496
    jr   label_322F

label_3201::
    cp   $1B
    jr   nz, label_3211
    ld   a, [$D82B]
    and  $10
    jr   z, label_3221
    ld   bc, $4C0F
    jr   label_322F

label_3211::
    cp   $2B
    jr   nz, label_3221
    ld   a, [$D82B]
    and  $10
    jr   z, label_3221
    ld   bc, $509A
    jr   label_322F

label_3221::
    ld   hl, $4000

label_3224::
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_323A

label_322F::
    ldh  a, [$FFF6]
    cp   $80
    jr   c, label_323A
    ld   a, $1A
    ld   [MBC3SelectBank], a

label_323A::
    ld   a, [bc]
    cp   $FE
    jr   z, endOfRoom
    ldh  [$FFA4], a
    inc  bc
    ld   a, [$DBA5]
    and  a
    jr   z, label_3258
    ld   a, [bc]
    and  $0F
    call FillTileMapWith
    ld   a, [bc]
    swap a
    and  $0F
    call label_38EA
    jr   CopyMapToTileMapLoop

label_3258::
    ld   a, [bc]
    call FillTileMapWith

CopyMapToTileMapLoop::
    inc  bc ; tile address
    ld   a, [bc] ; tile type
    and  $FC
    cp   $E0
    jr   nz, CopyMapToTileMapLoop_consecutive_tiles
    ldh  a, [$FFE6]
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de
    ld   a, [bc]
    and  $03
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    ld   a, e
    add  a, $05
    ldh  [$FFE6], a
    jr   CopyMapToTileMapLoop

CopyMapToTileMapLoop_consecutive_tiles::
    ld   a, [bc] ; tile type
    cp   $FE ; end-of-room tile
    jr   z, endOfRoom
    call label_32A9
    jr   CopyMapToTileMapLoop

endOfRoom::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_6CCE
    ld   a, $36
    ld   [MBC3SelectBank], a
    call label_6D4D ; do stuff that returns early if end-of-room
    ld   a, $21
    ld   [MBC3SelectBank], a
    call label_53F3 ; stuff that returns early when DBA5 is 0
    jp   ReloadSavedBank

label_32A9::
    xor  a
    ldh  [$FFD7], a
    ld   a, [bc] ; tile address
    bit  7, a
    jr   z, label_32B8
    bit  4, a
    jr   nz, label_32B8
    ldh  [$FFD7], a
    inc  bc ; increment tile address

label_32B8::
    inc  bc
    ldh  a, [$FFF8]
    ld   e, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_32D9
    ld   a, [bc] ; tile addres
    sub  a, $F5
    jr   c, MoveToNextLine
    ld   a, [bc]
    ld   d, a
    dec  bc
    ld   a, [bc]
    ld   e, a
    inc  bc
    ld   a, $24
    ld   [MBC3SelectBank], a
    call label_7578
    call label_353B
    ret

label_32D9::
    ld   a, [bc]
    sub  a, $EC
    jp  c, label_33CB
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   a, [label_1535]
    ld   [hl], $30
    ld   [hl], $4B
    ld   [hl], $64
    ld   [hl], $77
    ld   [hl], $8A
    ld   [hl], $9D
    ld   [hl], $B2
    ld   [hl], $EA
    ld   [hl], $FE
    ld   [hl], $12
    scf
    ld   h, $37
    ld   e, [hl]
    scf
    ld   l, l
    scf
    ld   a, h
    scf
    and  d
    scf
    or   [hl]
    scf

MoveToNextLine::
    add  a, $F5
    push af
    ld   d, a
    cp   $E9
    jr   nz, MoveToNextLine_notTileE9
    ld   [$C50E], a

MoveToNextLine_notTileE9::
    cp   $5E
    jr   nz, MoveToNextLine_notTile5E
    bit  5, e
    jr   nz, label_337C

MoveToNextLine_notTile5E::
    cp   $91
    jr   nz, MoveToNextLine_notTile91
    bit  5, e
    jr   z, MoveToNextLine_notTile91
    pop  af
    ld   a, $5E
    ld   d, a
    push af

MoveToNextLine_notTile91::
    cp   $DC
    jr   nz, MoveToNextLine_notTileDC
    bit  5, e
    jr   z, MoveToNextLine_notTileDC
    pop  af
    ld   a, $91
    ld   d, a
    push af

MoveToNextLine_notTileDC::
    cp   $D8
    jr   z, label_333D
    cp   $D9
    jr   z, label_333D
    cp   $DA
    jr   nz, label_3346

label_333D::
    bit  4, e
    jr   z, label_3346
    pop  af
    ld   a, $DB
    ld   d, a
    push af

label_3346::
    cp   $C2
    jr   nz, MoveToNextLine_notTileC2
    bit  4, e
    jr   z, MoveToNextLine_notTileC2
    pop  af
    ld   a, $E3
    ld   d, a
    push af

MoveToNextLine_notTileC2::
    ld   a, d
    cp   $BA
    jr   nz, MoveToNextLine_notTileBA
    bit  2, e
    jr   z, MoveToNextLine_notTileBA
    pop  af
    ld   a, $E1
    ld   d, a
    push af

MoveToNextLine_notTileBA::
    ld   a, d
    cp   $D3
    jr   nz, MoveToNextLine_notTileD3
    bit  4, e
    jr   z, MoveToNextLine_notTileD3
    ldh  a, [$FFF6]
    cp   $75
    jr   z, label_337C
    cp   $07
    jr   z, label_337C
    cp   $AA
    jr   z, label_337C
    cp   $4A
    jr   nz, MoveToNextLine_notTileD3

label_337C::
    pop  af
    ld   a, $C6
    ld   d, a
    push af

MoveToNextLine_notTileD3::
    ld   a, d
    ldh  [$FFE0], a
    cp   $C2
    jr   z, label_33A8
    cp   $E1
    jr   z, label_33A8
    cp   $CB
    jr   z, label_33A8
    cp   $BA
    jr   z, label_33A8
    cp   $61
    jr   z, label_33A8
    cp   $C6
    jr   z, label_33A8
    cp   $C5
    jr   z, label_33A8
    cp   $E2
    jr   z, label_33A8
    cp   $E3
    jr   nz, MoveToNextLine_noSpecialTile

label_33A8::
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    inc  bc

MoveToNextLine_noSpecialTile::
    ldh  a, [$FFE0]
    cp   $C5
    jp   z, label_347D
    cp   $C6
    jp   z, label_347D
    jp   MoveToNextLine_finallyBeginSomething

label_33CB::
    add  a, $EC
    ldh  [$FFE0], a
    push af
    cp   $CF
    jr   c, label_33DC
    cp   $D3
    jr   nc, label_33DC
    ld   hl, $C1A5
    inc  [hl]

label_33DC::
    cp   $AB
    jr   nz, label_3407
    xor  a
    ld   [$C3CB], a
    ldh  a, [$FFF6]
    cp   $C4
    ldh  a, [$FFE0]
    jr   z, label_3407
    ld   hl, $DBC9
    inc  [hl]
    ld   [$C3CB], a
    push af
    ld   a, [$C3CD]
    add  a, $04
    ld   [$C3CD], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_3406
    ld   a, $04
    ld   [wTransitionSequenceCounter], a

label_3406::
    pop  af

label_3407::
    cp   $8E
    jr   z, label_341E
    cp   $AA
    jr   z, label_341E
    cp   $DC
    jr   z, label_3417
    cp   $DB
    jr   nz, label_3423

label_3417::
    ld   hl, $D6FA
    ld   [hl], $02
    jr   label_3423

label_341E::
    ld   hl, $D6FA
    ld   [hl], $01

label_3423::
    cp   $3F
    jr   z, label_342B
    cp   $47
    jr   nz, label_342F

label_342B::
    bit  2, e
    jr   nz, label_343B

label_342F::
    cp   $40
    jr   z, label_3437
    cp   $48
    jr   nz, label_343F

label_3437::
    bit  3, e
    jr   z, label_343F

label_343B::
    pop  af
    ld   a, $3D
    push af

label_343F::
    cp   $41
    jr   z, label_3447
    cp   $49
    jr   nz, label_344B

label_3447::
    bit  1, e
    jr   nz, label_3457

label_344B::
    cp   $42
    jr   z, label_3453
    cp   $4A
    jr   nz, label_345B

label_3453::
    bit  0, e
    jr   z, label_345B

label_3457::
    pop  af
    ld   a, $3E
    push af

label_345B::
    cp   $A1
    jr   nz, label_3467
    bit  4, e
    jr   nz, label_3467
    pop  af
    ldh  a, [$FFE9]
    push af

label_3467::
    cp   $BF
    jr   nz, label_3471
    bit  4, e
    jr   nz, label_3471
    pop  af
    ret

label_3471::
    cp   $BE
    jr   z, label_347D
    cp   $BF
    jr   z, label_347D
    cp   $CB
    jr   nz, label_3496

label_347D::
    dec  bc
    ld   a, $01
    ldh  [$FFAC], a
    ld   a, [bc]
    and  $F0
    add  a, $10
    ldh  [$FFAE], a
    ld   a, [bc]
    swap a
    and  $F0
    add  a, $08
    ldh  [$FFAD], a
    inc  bc
    jp   MoveToNextLine_finallyBeginSomething

label_3496::
    cp   $D6
    jr   z, label_349E
    cp   $D5
    jr   nz, label_34A6

label_349E::
    bit  4, e
    jr   nz, label_34A6
    pop  af
    ld   a, $21
    push af

label_34A6::
    cp   $D7
    jr   z, label_34AE
    cp   $D8
    jr   nz, label_34B6

label_34AE::
    bit  4, e
    jr   nz, label_34B6
    pop  af
    ld   a, $22
    push af

label_34B6::
    ldh  a, [$FFF7]
    cp   $0A
    ldh  a, [$FFE0]
    jr   c, label_34C2
    cp   $A9
    jr   z, label_34C6

label_34C2::
    cp   $DE
    jr   nz, MoveToNextLine_finallyBeginSomething

label_34C6::
    bit  6, e
    jr   z, MoveToNextLine_finallyBeginSomething
    pop  af
    ld   a, $0D

label_34CD::
    push af

MoveToNextLine_finallyBeginSomething::
    cp   $A0
    jr   nz, MoveToNextLine_tileTypeNotA0
    bit  4, e
    jr   z, MoveToNextLine_tileTypeNotA0
    pop  af
    ld   a, $A1
    push af

MoveToNextLine_tileTypeNotA0::
    ld   d, $00
    ldh  a, [$FFD7]
    and  a
    jr   z, label_352D
    dec  bc ; decrement tile address
    ld   a, [bc] ; load new tile type
    ld   e, a
    ld   hl, wTileMap ; prepare tile map
    add  hl, de ; add current tile offset
    ldh  a, [$FFD7]
    and  $0F
    ld   e, a ; load repeat count from higher-bits of a
    pop  af ;
    ld   d, a

; fill map with e consecutive tiles of type d
FillMapWithConsecutiveTiles::
    ld   a, d
    ldi  [hl], a
    ldh  a, [$FFD7]
    and  $40
    jr   z, FillMapWithConsecutiveTiles_continue
    ld   a, l
    add  a, $0F ; mirror the tile ?
    ld   l, a

FillMapWithConsecutiveTiles_continue::
    dec  e
    jr   nz, FillMapWithConsecutiveTiles
    inc  bc
    ret

label_3500::
    cp   $04
    ret  z
    cp   $09
    jr   nz, label_350E
    ldh  a, [$FFF6]
    cp   $97
    ret  nz
    jr   label_3527

label_350E::
    cp   $E1
    jr   nz, label_351D
    ldh  a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

label_351D::
    ldh  a, [$FFF6]
    cp   $80
    jr   nc, label_3527
    ld   a, $09
    jr   label_3529

label_3527::
    ld   a, $1A

label_3529::
    call label_B2F
    ret

label_352D::
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, wTileMap
    add  hl, de
    pop  af
    ld   [hl], a
    call label_3500
    inc  bc
    ret

label_353B::
    ldh  a, [$FFF6]
    cp   $80
    jr   nc, label_3545
    ld   a, $09
    jr   label_3547

label_3545::
    ld   a, $1A

label_3547::
    ld   [MBC3SelectBank], a
    ret

label_354B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, label_3560
    cp   $E2
    jr   z, label_3560
    cp   $E3
    jr   nz, label_357C

label_3560::
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

label_357C::
    ld   [hl], a
    call label_3500
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, label_354B
    pop  bc
    ret

label_358B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, label_35A0
    cp   $E2
    jr   z, label_35A0
    cp   $E3
    jr   nz, label_35BC

label_35A0::
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

label_35BC::
    ld   [hl], a
    call label_35CB
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, label_358B
    pop  bc
    ret

label_35CB::
    cp   $04
    ret  z
    cp   $09
    jr   nz, label_35D9
    ldh  a, [$FFF6]
    cp   $97
    ret  nz
    jr   label_35E8

label_35D9::
    cp   $E1
    jr   nz, label_35E8
    ldh  a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

label_35E8::
    ld   a, $24
    call label_B2F
    ret

label_35EE::
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    ld   hl, wTileMap
    add  hl, de
    ret

data_35F8::
    db $2D, $2E

label_35FA::
    ld   e, 0
    call label_373F
    ldh  a, [$FFF8]
    and  $04
    jp   nz, label_36B2
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_35F8
    jp   label_354B

data_3613::
    db   $2F, $30, $1E, 1, $CD, $3F, $37, $F0, $F8, $E6, 8, $C2, $EA, $36, $C5, $CD
    db   $EE, $35, 1, $E1, $37, $11, $13, $36, $C3, $4B, $35

data_362E::
    db   $31, $32, $1E, 2, $CD, $3F, $37, $F0, $F8, $E6, 2, $C2, $FE, $36, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $2E, $36, $C3, $4B, $35

data_3649::
    db   $33, $34, $1E, 3, $CD, $3F, $37, $F0, $F8, $E6, 1, $C2, $12, $37, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $49, $36, $C3, $4B, $35, $1E, 4, $CD, $3F, $37
    db   $FA, $8A, $C1, $F6, 1, $EA, $8A, $C1, $EA, $8B, $C1, $C3, $B2, $36

data_3677::
    db   $1E, 5, $CD, $3F, $37, $FA, $8A, $C1, $F6, 2, $EA, $8A, $C1, $EA, $8B, $C1
    db   $C3, $EA, $36, $1E, 6, $CD, $3F, $37, $FA, $8A, $C1, $F6, 4, $EA, $8A, $C1
    db   $EA, $8B, $C1, $C3, $FE, $36, $1E, 7, $CD, $3F, $37, $FA, $8A, $C1, $F6, 8
    db   $EA, $8A, $C1, $EA, $8B, $C1, $C3, $12, $37

data_36B0::
    db   $43, $44

label_36B2::
    ld   a, $04
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36B0
    jp   label_354B

label_36C4::
    push af
    ld   hl, $D900
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_36D8
    ld   hl, $DDE0
    jr   label_36E1

label_36D8::
    cp   $1A
    jr   nc, label_36E1
    cp   $06
    jr   c, label_36E1
    inc  d

label_36E1::
    add  hl, de
    pop  af
    or   [hl]
    ld   [hl], a
    ldh  [$FFF8], a
    ret

data_36E8::
    db $8C, 8

label_36EA::
    ld   a, 8
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36E8
    jp   label_354B

data_36FC::
    db 9, $A

label_36FE::
    ld   a, $02
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_36FC
    jp   label_354B

data_3710::
    db $B, $C

label_3712::
    ld   a, $01
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_3710
    jp   label_354B

data_3724::
    db $A4, $A5

label_3726::
    ld   e, $08
    call label_373F
    ldh  a, [$FFF8]
    and  $04
    jp   nz, label_36B2
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_3724
    jp   label_354B

label_373F::
    ld   d, $00
    ld   hl, $C1F0
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    push af
    and  $F0
    ld   hl, $C1E0
    add  hl, de
    ld   [hl], a
    pop  af
    swap a
    and  $F0
    ld   hl, $C1D0
    add  hl, de
    ld   [hl], a
    inc  bc
    ret

data_375C::
    db   $AF, $B0, $C5, $CD, $EE, $35, 1, $E4, $37, $11, $5C, $37, $C3, $4B, $35

data_376B::
    db   $B1, $B2, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $6B, $37, $C3, $4B, $35

data_377A::
    db   $45, $46, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $7A, $37, $C3, $4B, $35

data_3789::
    db   0, 1, 2, 3, $10, $11, $12, $13, $20, $21, $22, $23, $FF

data_3796::
    db   $B3, $B4, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $3E, 8, $CD, $C4
    db   $36, $C5, $CD, $EE, $35, 1, $89, $37, $11, $96, $37, $C3, $4B, $35

data_37B4::
    db   $C1, $C2, $F0, $F7, $FE, $1A, $30, $13, $FE, 6, $38, $F, $F0, $F6, $FE, $D3
    db   $20, 9, $FA, $46, $DB, $A7, $28, 3, $C3, $77, $36

data_37CF::
    db   $3E, 1, $CD, $C4, $36, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $B4, $37, $C3
    db   $4B, $35

data_37E1::
    db   0, 1, $FF

data_37E4::
    db   0, $10, $FF

; Fill the tile map with whatever is in register a
FillTileMapWith::
    ldh  [$FFE9], a
    ld   d, TILES_PER_MAP
    ld   hl, wTileMap
    ld   e, a

FillTileMapWith_loop::
    ld   a, l
    and  $0F
    jr   z, FillTileMapWith_continue
    cp   $0B ; TILES_PER_ROW+1
    jr   nc, FillTileMapWith_continue
    ld   [hl], e

FillTileMapWith_continue::
    inc  hl
    dec  d
    jr   nz, FillTileMapWith_loop
    ret

label_37FE::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_5F02
    ld   a, $16
    ld   [MBC3SelectBank], a
    xor  a
    ldh  [$FFE4], a
    ldh  a, [$FFF6]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    ld   hl, $4000
    ld   a, [$DBA5]
    and  a
    jr   z, label_3868
    ldh  a, [$FFF7]
    cp   $06
    jr   nz, label_3850
    ld   a, [$DB6F]
    ld   hl, $FFF6
    cp   [hl]
    jr   nz, label_3850
    ld   a, $A8
    call label_3B86
    ld   a, [$DB70]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$DB71]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    call label_38D4
    ld   hl, $C460
    add  hl, de
    ld   [hl], $FF
    xor  a
    ldh  [$FFE4], a

label_3850::
    ld   hl, $4200
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_385E
    ld   hl, $4600
    jr   label_3868

label_385E::
    cp   $1A
    jr   nc, label_3868
    cp   $06
    jr   c, label_3868
    inc  h
    inc  h

label_3868::
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a

label_386D::
    ld   a, [bc]
    cp   $FF
    jr   z, label_3877
    call label_3883
    jr   label_386D

label_3877::
    call ReloadSavedBank
    ret

data_387B::
    db 1, 2, 4, 8, $10, $20, $40, $80

label_3883::
    ldh  a, [$FFE4]
    cp   $08
    jr   nc, label_389B
    ld   e, a
    ld   d, $00
    ld   hl, data_387B
    add  hl, de
    ldh  a, [$FFF6]
    ld   e, a
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    and  [hl]
    jr   nz, label_38AD

label_389B::
    ld   e, $00
    ld   d, e

label_389E::
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   z, label_38B4
    inc  e
    ld   a, e
    cp   $10
    jr   nz, label_389E

label_38AD::
    ld   hl, $FFE4
    inc  [hl]
    inc  bc
    inc  bc
    ret

label_38B4::
    ld   [hl], $04
    ld   a, [bc]
    and  $F0
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a
    ld   a, [bc]
    inc  bc
    swap a
    and  $F0
    ld   hl, $C200
    add  hl, de
    add  a, $08
    ld   [hl], a
    ld   hl, $C3A0
    add  hl, de
    ld   a, [bc]
    inc  bc
    ld   [hl], a

label_38D4::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6524
    ld   a, $01
    ld   [MBC3SelectBank], a
    call label_5EAB
    ld   a, $16
    ld   [MBC3SelectBank], a
    ret

label_38EA::
    ld   e, a
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   a, e
    push bc
    call label_4880
    pop  bc
    ldh  a, [$FFE8]
    ld   [MBC3SelectBank], a
    ret

    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_588B
    ret

label_3905::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_390F
    ld   a, $1A
    jr   label_3911

label_390F::
    ld   a, $08

label_3911::
    ld   [MBC3SelectBank], a
    ret

label_3915::
    ld   a, $27
    ld   [MBC3SelectBank], a
    jp   $7FC5

label_391D::
    ld   a, $20
    ld   [MBC3SelectBank], a
    jp   $7DE6

label_3925::
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   hl, $5218
    add  hl, de
    ld   a, [hl]
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    ret

label_3935::
    ld   a, $19
    call SwitchBank
    call label_7C50
    ld   a, $03
    jp   SwitchBank

label_3942::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_53E4
    jp   ReloadSavedBank

label_394D::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_54AC
    jp   ReloadSavedBank

label_3958::
    ld   a, $01
    call SwitchBank
    call label_5FB3
    ld   a, $02
    jp   SwitchBank

label_3965::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_485B
    jp   ReloadSavedBank

label_3970::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_7EFE
    jp   ReloadSavedBank

label_397B::
    ld   a, $14
    ld   [MBC3SelectBank], a
    call label_5347
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

data_3989::
    db   0, 8, $10, $18

label_398D::
    ld   hl, $C5A7
    ld   a, [hl]
    and  a
    jr   z, label_399B
    dec  [hl]
    jr   nz, label_399B
    ld   a, $10
    ldh  [$FFF3], a

label_399B::
    ld   a, [wDialogState]
    and  a
    jr   nz, label_39AE
    ld   a, [$C111]
    ld   [$C1A8], a
    and  a
    jr   z, label_39AE
    dec  a
    ld   [$C111], a

label_39AE::
    ld   a, [$C11C]
    cp   $07
    ret  z
    xor  a
    ld   [$C3C1], a
    ldh  a, [$FFF7]
    cp   $0A
    ldh  a, [hFrameCounter]
    jr   c, label_39C1
    xor  a

label_39C1::
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_3989
    add  hl, de
    ld   a, [hl]
    ld   [$C3C0], a
    ld   a, $20
    ld   [MBC3SelectBank], a
    call label_4303
    xor  a
    ld   [MBC3SelectBank], a
    ld   a, [wDialogState]
    and  a
    jr   nz, label_39E3
    ld   [$C1AD], a

label_39E3::
    ld   a, $20
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    call label_6352
    ld   b, $00
    ld   c, $0F

label_39F2::
    ld   a, c
    ld   [$C123], a
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_3A03
    ldh  [$FFEA], a
    call label_3A18

label_3A03::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_39F2
    ret

label_3A0A::
    ld   a, $15
    ld   [MBC3SelectBank], a
    call label_4000
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

label_3A18::
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEB], a
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFF0], a
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFF1], a
    ld   a, $19
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ldh  a, [$FFEB]
    cp   $6A
    jr   nz, label_3A40
    ldh  a, [$FFB2]
    and  a
    jr   nz, label_3A46

label_3A40::
    ldh  a, [$FFEA]
    cp   $07
    jr   nz, label_3A4E

label_3A46::
    call label_7964
    call label_3D8A
    jr   label_3A54

label_3A4E::
    call label_3D8A
    call label_7964

label_3A54::
    ld   a, $14
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    call label_4D73
    ld   a, $03
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ldh  a, [$FFEA]
    cp   $05
    jp   z, label_3A8D
    JP_TABLE
    db 9, $3A, $18, $55, $B6, $4C, $4C, $4C, $B5, $48, $8D, $3A, 7, $4E, $32, $57
    db $94, $4D

label_3A81::
    call label_3A8D
    ld   a, $03
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ret

label_3A8D::
    ld   a, $20
    ld   [MBC3SelectBank], a
    ldh  a, [$FFEB]
    ld   e, a
    ld   d, b
    ld   hl, $4000
    add  hl, de
    add  hl, de
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    inc  hl
    ld   a, [hl]
    ld   l, e
    ld   h, d
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    jp   hl

data_3AAA::
    db   8, 5, 8, 5, 8, $A, 8, $A, 8, $A, 8, $A, 8, $10, 4, $A
    db   8, 2, 8, 2, 8, $13, 8, $13, 8, 6, 6, 8, 8, 7

data_3AC8::
    db   6, $A, 8, 6, $10, $30, 8, 7, 4, $A, $C, 7, $FC, 4, $10

data_3AD7::
    db $10, $C, $12, 8, 8, 2, 8, $10, $C, 8, $10, 8, 7, $C, 8, 8
    db 8, 2, 8

label_3AEA::
    ld      hl, $C350
    add     hl, bc
    ld      a, [hl]
    and     $7C ; '|'
    ld      e, a
    ld      d, b
    ld      hl, data_3AAA
    add     hl, de
    ld      e, l
    ld      d, h
    push    bc
    sla     c
    sla     c
    ld      hl, $D580
    add     hl, bc
    ld      c, 4

label_3B04::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_3B04
    pop  bc
    ret

label_3B0C::
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ret

label_3B12::
    ld   hl, $C290
    add  hl, bc
    inc  [hl]
    ret

label_3B18::
    ld   a, $02
    ld   [MBC3SelectBank], a
    call label_75F5
    jp   ReloadSavedBank

label_3B23::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_7893
    jp   ReloadSavedBank

label_3B2E::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_7CAB
    jp   ReloadSavedBank

label_3B39::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6E28
    jp   ReloadSavedBank

label_3B44::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6C6B
    jp   ReloadSavedBank

label_3B4F::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6BDE
    jp   ReloadSavedBank

label_3B5A::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6C77
    jp   ReloadSavedBank

label_3B65::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_73EB
    jp   ReloadSavedBank

label_3B70::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_6E2B
    jp   ReloadSavedBank

label_3B7B::
    ld   a, $03
    ld   [MBC3SelectBank], a
    call label_75A2
    jp   ReloadSavedBank

label_3B86::
    push af
    ld   a, $03
    ld   [MBC3SelectBank], a
    pop  af
    call label_64CA
    rr   l
    call ReloadSavedBank
    rl   l
    ret

label_3B98::
    push af
    ld   a, $03
    ld   [MBC3SelectBank], a
    pop  af
    call label_64CC
    rr   l
    call ReloadSavedBank
    rl   l
    ret

label_3BAA::
    ld   hl, MBC3SelectBank
    ld   [hl], $03
    call label_7EC7
    jp   ReloadSavedBank

label_3BB5::
    ld   hl, MBC3SelectBank
    ld   [hl], $03
    call label_7E45
    jp   ReloadSavedBank

label_3BC0::
    ldh  a, [$FFF1]
    inc  a
    ret  z
    call label_3D57
    push de
    ld   a, [$C3C0]
    ld   e, a
    ld   d, b
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    ldh  a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ldh  a, [$FFED]
    and  $20
    rra
    rra
    ld   hl, $FFEE
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  de
    ldh  a, [$FFF1]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ldh  a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, label_3C08
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

label_3C08::
    inc  de
    ld   a, [hli]
    push hl
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3C21
    ldh  a, [$FFED]
    and  $10
    jr   z, label_3C21
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3C21::
    inc  de
    ldh  a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ldh  a, [$FFED]
    and  $20
    xor  $20
    rra
    rra
    ld   hl, $FFEE
    sub  a, c
    add  a, [hl]
    ld   [de], a
    inc  de
    pop  hl
    ldh  a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, label_3C4B
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

label_3C4B::
    inc  de
    ld   a, [hl]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3C63
    ldh  a, [$FFED]
    and  $10
    jr   z, label_3C63
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3C63::
    ld   a, [$C123]
    ld   c, a
    ld   b, $00
    ld   a, $15
    ld   [MBC3SelectBank], a
    call label_795D

label_3C71::
    call label_7995
    jp   ReloadSavedBank

label_3C77::
    ldh  a, [$FFF1]
    inc  a
    ret  z
    call label_3D57
    push de
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   bc, $C030
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   a, [$C123]
    ld   c, a
    ld   b, $00
    ldh  a, [$FFF9]
    and  a
    ldh  a, [$FFEC]
    jr   z, label_3C9C
    sub  a, $04
    ldh  [$FFEC], a

label_3C9C::
    ld   [de], a
    inc  de
    ld   a, [wScreenShakeHorizontal]
    ld   h, a
    ldh  a, [$FFEE]
    add  a, $04
    sub  a, h
    ld   [de], a
    inc  de
    ldh  a, [$FFF1]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3CD0
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    jr   z, label_3CD0
    ldh  a, [$FFED]
    and  a
    jr   z, label_3CD0
    ld   a, [hl]
    and  $F8
    or   $04
    ld   [de], a
    jr   label_3CD6

label_3CD0::
    ld   a, [hli]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a

label_3CD6::
    inc  de
    jr   label_3C63

label_3CD9::
    ld   a, $15
    ld   [MBC3SelectBank], a
    jr   label_3C71

label_3CE0::
    push hl
    ld   hl, $C000
    jr   label_3CF6

label_3CE6::
    ldh  a, [$FFF1]
    inc  a
    jr   z, label_3D52
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de

label_3CF6::
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, c
    ldh  [$FFD7], a
    ld   a, [$C123]
    ld   c, a
    call label_3D57
    ldh  a, [$FFD7]
    ld   c, a

label_3D06::
    ldh  a, [$FFEC]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de
    push bc
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ldh  a, [$FFEE]
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de
    ldh  a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    push af
    add  a, c
    ld   [de], a
    pop  af
    cp   $FF
    jr   nz, label_3D28
    dec  de
    xor  a
    ld   [de], a
    inc  de

label_3D28::
    pop  bc
    inc  de
    ldh  a, [$FFED]
    xor  [hl]
    ld   [de], a
    inc  hl
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3D3F
    ldh  a, [$FFED]
    and  a
    jr   z, label_3D3F
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3D3F::
    inc  de
    dec  c
    jr   nz, label_3D06
    ld   a, [$C123]
    ld   c, a
    ld   a, $15
    ld   [MBC3SelectBank], a
    call label_795D
    jp   ReloadSavedBank

label_3D52::
    ld   a, [$C123]
    ld   c, a
    ret

label_3D57::
    push hl
    ld   a, [wMapSlideTransitionState]
    and  a
    jr   z, label_3D7D
    ldh  a, [$FFEE]
    dec  a
    cp   $C0
    jr   nc, label_3D7C
    ldh  a, [$FFEC]
    dec  a
    cp   $88
    jr   nc, label_3D7C
    ld   hl, $C220
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_3D7C
    ld   hl, $C230
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_3D7D

label_3D7C::
    pop  af

label_3D7D::
    pop  hl
    ret

label_3D7F::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ret

label_3D8A::
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEE], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEF], a
    ld   hl, $C310
    add  hl, bc
    sub  a, [hl]
    ldh  [$FFEC], a
    ret

label_3DA0::
    ld   hl, MBC3SelectBank
    ld   [hl], $15
    call label_7964
    jp   ReloadSavedBank

label_3DAB::
    ld   hl, MBC3SelectBank
    ld   [hl], $04
    call label_5A1A
    jp   ReloadSavedBank

label_3DB6::
    ld   hl, MBC3SelectBank
    ld   [hl], $04
    call label_5690
    jp   ReloadSavedBank

label_3DC1::
    ld   hl, MBC3SelectBank
    ld   [hl], $04
    call label_504B
    jp   ReloadSavedBank

label_3DCC::
    ld   hl, MBC3SelectBank
    ld   [hl], $04
    call label_49BD
    jp   ReloadSavedBank

label_3DD7::
    ld   hl, MBC3SelectBank
    ld   [hl], $36
    call label_72AB
    jp   ReloadSavedBank

label_3DE2::
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    call label_6CC6
    jp   ReloadSavedBank

label_3DED::
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    call label_6818
    jp   ReloadSavedBank

label_3DF8::
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    call label_6302
    jp   ReloadSavedBank

label_3E03::
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    call label_5A1E
    jp   ReloadSavedBank

label_3E0E::
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    call label_556B
    jp   ReloadSavedBank

label_3E19::
    ld   a, [wCurrentBank]
    push af
    ld   a, $02
    call SwitchBank
    call label_6C75
    pop  af
    jp   SwitchBank

label_3E29::
    ld   hl, MBC3SelectBank
    ld   [hl], $04
    call label_5C63
    jp   ReloadSavedBank

label_3E34::
    ld   hl, MBC3SelectBank
    ld   [hl], $03
    call label_5407
    jp   ReloadSavedBank

label_3E3F::
    ld   hl, MBC3SelectBank
    ld   [hl], $02
    call label_62CE
    call label_6414
    jp   ReloadSavedBank

label_3E4D::
    ld   a, $02
    call SwitchBank
    call label_41D0
    ld   a, $03
    jp   SwitchBank

label_3E5A::
    ld   hl, MBC3SelectBank
    ld   [hl], $20
    ld   c, $01
    ld   b, $00
    ld   e, $FF
    call label_5C9C
    jp   ReloadSavedBank

label_3E6B::
    ld   hl, MBC3SelectBank
    ld   [hl], $03
    call label_6472
    jp   ReloadSavedBank

label_3E76::
    ld   a, $06
    call SwitchBank
    call label_783C
    ld   a, $03
    jp   SwitchBank

label_3E83::
    ld   e, $10
    ld   hl, wEntitiesTypeTable

label_3E88::
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, label_3E88
    ret

label_3E8E::
    ld   hl, $C4A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ldh  a, [hFrameCounter]
    xor  c
    and  $03
    ret  nz
    ldh  a, [$FFEE]
    ldh  [$FFD7], a
    ldh  a, [$FFEC]
    ldh  [$FFD8], a
    ld   a, $08
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    ret

label_3EAF::
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_3EBA
    cpl
    inc  a

label_3EBA::
    ldh  [$FFD7], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_3EC7
    cpl
    inc  a

label_3EC7::
    ld   e, $03
    ld   hl, $FFD7
    cp   [hl]
    jr   c, label_3ED1
    ld   e, $0C

label_3ED1::
    ld   a, e
    ld   hl, $C2A0
    add  hl, bc
    and  [hl]
    jr   z, label_3EDE
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b

label_3EDE::
    ret

data_3EDF::
    db $B0, $B4, $B1, $B2, $B3, $B6, $BA, $BC, $B8

label_3EE8::
    ld   hl, wInventoryAppearing
    ld   a, [wMapSlideTransitionState]
    or   [hl]
    ret  nz
    ld   a, [$C165]
    and  a
    jr   z, label_3EFB
    dec  a
    ld   [$C165], a
    ret

label_3EFB::
    ld   a, [$C1BD]
    and  a
    ret  nz
    inc  a
    ld   [$C1BD], a
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $04
    ld   a, $19
    jr   z, label_3F11
    ld   a, $50

label_3F11::
    ld   [$D368], a
    ldh  [$FFBD], a
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    ret  nz
    ldh  a, [$FFEB]
    cp   $87
    jr   nz, label_3F26
    ld   a, $DA
    jr   label_3F45

label_3F26::
    cp   $BC
    jr   nz, label_3F2E
    ld   a, $26
    jr   label_3F45

label_3F2E::
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $04
    ret  nz
    ldh  a, [$FFF7]
    cp   $FF
    ret  z
    cp   $05
    ret  z
    ld   e, a
    ld   d, b
    ld   hl, data_3EDF
    add  hl, de
    ld   a, [hl]

label_3F45::
    jp   label_2385

data_3F48::
    db 1, 2, 4, 8, $10, $20, $40, $80

label_3F50::
    ld   a, $03
    ld   [$C113], a
    ld   [MBC3SelectBank], a
    call label_55CF
    call ReloadSavedBank
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_3F8D
    push af
    ld   a, [wKillCount2]
    ld   e, a
    ld   d, b
    inc  a
    ld   [wKillCount2], a
    ld   a, [hl]
    ld   hl, $DBB6
    add  hl, de
    ld   [hl], a
    pop  af

label_3F78::
    cp   $08
    jr   nc, label_3F8D
    ld   e, a
    ld   d, b
    ld   hl, data_3F48
    add  hl, de
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    or   [hl]
    ld   [hl], a

label_3F8D::
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   [hl], b
    ret

label_3F93::
    ld   a, $05
    ld   [MBC3SelectBank], a
    ld   hl, $59DE
    ld   de, $8460
    ld   bc, $0010
    call CopyData
    ld   hl, $59EE
    jr   label_3FBD

label_3FA9::
    ld   a, $05
    ld   [MBC3SelectBank], a
    ld   hl, $59FE
    ld   de, $8460
    ld   bc, $0010
    call CopyData
    ld   hl, $5A0E

label_3FBD::
    ld   de, $8480
    ld   bc, $0010
    call CopyData
    xor  a
    ldh  [$FFA5], a
    ld   a, $0C
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn
    ld   b, $34
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_3FD9
    inc  b

label_3FD9::
    ld   a, b
    ld   [MBC3SelectBank], a
    ld   hl, $4000
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ld   a, $20
    ld   [MBC3SelectBank], a
    ret
