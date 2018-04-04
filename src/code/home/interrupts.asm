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

;
; InterruptSerial
;
; Dispatches to the Game Boy Printer routines.
;

InterruptSerial::
    push af
    ld   a, $28
    ld   [MBC3SelectBank], a
    call $4601
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
    jr   z, .LoadMapZero

    ; Copy map number to the palette-loading variable
    ld   [$DDD2], a

    ; if wTileMapToLoad != $23, turn of LCD
    cp   $23
    jr   z, .LCDOffEnd
    push af
    call LCDOff
    pop  af
.LCDOffEnd

    call .ExecuteMapLoadHandler
    jr   .ClearValuesAndReturn

.ExecuteMapLoadHandler:
    ld   e, a
    ld   a, $20
    ld   [MBC3SelectBank], a
    ; $4657
    ;   input:  wTileMapToLoad in e
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
    ;   10  LoadIntroSequenceTiles
    call $4657
    jp   hl ; tail-call ; will return when done.

    ; Special case for loading map n° 0
.LoadMapZero:
    call LCDOff
    ; Do some GBC-only stuff (calls 24:5C2C)
    ld   a, $24
    ld   [MBC3SelectBank], a
    call $5C2C

    ; Manipulate wBGMapToLoad (calls 20:4577)
    ld   a, $20
    ld   [MBC3SelectBank], a
    call $4577

    ld   a, $08
    ld   [MBC3SelectBank], a
    call ExecuteBackgroundCopyRequest.noMapTransition

    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

.ClearValuesAndReturn:
    xor  a
    ld   [wBGMapToLoad], a
    ld   [wTileMapToLoad], a
    ld   a, [wLCDControl]
    ld   [rLCDC], a
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
    jr   c, .gameplayNotAPhoto
    ; GameplayType is one of the Pictures
    ld   a, [wGameplaySubtype]
    cp   $06
    jr   c, label_52B
    ld   a, $38
    ld   [MBC3SelectBank], a
    call $785A
    jr   label_52B
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
    call label_5BC

    ; If $FFE8 >= 8, skip drawing of Link sprite
    ldh  a, [$FFE8]
    cp   $08
    jr   nc, .linkSpriteDone
.drawLinkSprite
    call DrawLinkSprite
.linkSpriteDone

    ; Copy tiles to OAM memory
    call hDMARoutine
    ; And we're done.
    jr   WaitForVBlankAndReturn

.noTilesToUpdate
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
    jr   z, label_52B
    call AnimateTiles

label_52B::
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC
    ld   a, $24
    ld   [MBC3SelectBank], a
    ; Change BG column palette. Triggered by an interrupt?
    call $5C1A
.notGBC
    ld   de, wRequest
    call ExecuteBackgroundCopyRequest ; Load BG column tiles
    xor  a
    ld   [wRequests], a
    ld   [wRequest], a
    ld   [$DC90], a
    ld   [$DC91], a

    ld   a, $36
    ld   [MBC3SelectBank], a
    call $72BA
    call hDMARoutine
    ldh  a, [hIsGBC]
    and  a
    jr   z, WaitForVBlankAndReturn
    ld   a, $21
    ld   [MBC3SelectBank], a
    call $4000
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
    call $4000
    ld   a, $24
    call SwitchBank
    call $5C1A

label_598::
    ld   de, wRequest
    call ExecuteBackgroundCopyRequest
    xor  a
    ld   [wRequests], a
    ld   [wRequest], a
    ld   [$DC90], a
    ld   [$DC91], a

label_5AB::
    ld   a, $28
    call SwitchBank
    call $4616
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
    ld   a, [wIsIndoor]
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, label_62F
    ld   a, $20
    ld   [MBC3SelectBank], a
    call $4616
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, label_6CB
    ld   a, $20
    ld   [MBC3SelectBank], a
    call $475A
    xor  a
    ld   [wNeedsUpdatingNPCTiles], a
    ld   [$C10F], a
    ld   hl, $9000
    ld   bc, $0000
    call $4616
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
    ld   [wNeedsUpdatingNPCTiles], a
    ld   [$C10F], a

label_7AF::
    ret

label_7B0::
    ld   a, $01
    ld   [MBC3SelectBank], a
    call $6BB5
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
