;
; Code for save file screen.
; Displays the "Return to Game / Save and Quit" screen.
;

FileSaveEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._00 dw FileSaveInitial
._01 dw FileSaveMapFadeOut
._02 dw FileSaveDelay1
._03 dw FileSaveDelay2
._04 dw FileSaveVisible
._05 dw FileSaveInteractive
._06 dw FileSaveFadeOut

FileSaveInitial::
    call IncrementGameplaySubtype

    ; If running on grayscale GB, jump directly to the
    ; next state (map fade-out).
    ldh  a, [hIsGBC]
    and  a
    jr   z, FileSaveMapFadeOut

    ; Running on GBC: copy data from WRAM0 to WRAM3
    ld   hl, $DC10 ; start address
    ld   c, $80    ; bytes count

    ; Disable interrupts
    di

    ; Select WRAM Bank 3
    ld   a, $03
    ld   [rSVBK], a

    ; If $D000 == 0...
    ld   a, [$D000]
    and  a
    jr   nz, .done

    ; Copy $80 bytes from 00:DC10 to 03:DC10
.loop
    ; Switch to WRAM bank 0
    xor  a
    ld   [rSVBK], a
    ; Read a byte
    ld   b, [hl]
    ; Switch to WRAM bank 3
    ld   a, $03
    ld   [rSVBK], a
    ; Write a byte
    ld   [hl], b
    ; Increment the pointer, and loop until done.
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, .loop

    ; Set $D000 to 1
    ld   a, $01
    ld   [$D000], a

.done
    ; Switch back to WRAM bank 0
    xor  a
    ld   [rSVBK], a
    ; Enable interrupts
    ei

FileSaveMapFadeOut::
    call DrawLinkSprite
    call AnimateEntitiesAndRestoreBank01
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_4072
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    ld   [wInventoryAppearing], a
    ld   [$C1B8], a
    ld   [$C1B9], a
    ld   [$C1B5], a
    ld   a, $0F
    ld   [wTileMapToLoad], a

jr_001_4072::
    ret

FileSaveDelay1::
    ld   a, $0D
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$C13F], a
    jp   IncrementGameplaySubtypeAndReturn

FileSaveDelay2::
    ld   a, $0D
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn

FileSaveVisible::
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, .return
    call IncrementGameplaySubtype
.return
    ret

FileSaveInteractive::
    call func_001_412A
    ldh  a, [hJoypadState]
    and  $B0
    jr   z, LCDOn.return
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a
    ld   a, [$C13F]
    cp   $01
    jr   z, jr_001_40F9
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [wIsIndoor]
    and  a
    jr   z, .done
    xor  a
    ld   [$C50A], a
    ld   [$C116], a
.done
    ret

; Unused code?
label_40D6::
    xor  a
    ld   [wOBJ0Palette], a
    ld   [wOBJ1Palette], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ldh  a, [hLinkPositionX]
    ld   [wMapEntrancePositionX], a
    ldh  a, [hLinkPositionY]
    ld   [wMapEntrancePositionY], a
    call LoadSavedFile
    ld   a, $80
    ld   [wInvincibilityCounter], a
    ret

jr_001_40F9::
    call label_27F2
    call func_001_5DE6
    call ClearWRAMAndLowerHRAM
    xor  a
    ldh  [hActiveEntityTilesOffset], a
    ld   a, $01
    ld   [$DBAF], a
    call func_001_6162
    call LCDOff
    ; fallthrough

; Enable LCD Screen
LCDOn::
    ; Configure LCD control register
    ;   Bit 7: Enable LDC display
    ;   Bit 6: Window tile map to $9C00-$9FFF
    ;   Bit 5: Window display disabled
    ;   Bit 4: Background & Window Tile Data to $8800-$97FF
    ;   Bit 3: Background Tile Map to $9800-$9BFF
    ;   Bit 2: Sprite size 8x16
    ;   Bit 1: Sprite displayed enabled
    ;   Bit 0: Background display enabled
    ld   a, %11000111
    ld   [rLCDC], a
    ld   [wLCDControl], a

    ; Set Window X position
    ld   a, $07
    ld   [rWX], a

    ; Set Windows Y position
    ld   a, $80
    ld   [wWindowY], a
    ld   [rWY], a

    ; Configure Window
    ld   a, $07
    ldh  [hWindowYUnused], a
    ld   a, $70
    ldh  [hWindowXUnused], a
.return
    ret

Data_001_4128::
    ld   c, b
    ld   e, b

; Called by FileSaveInteractive
func_001_412A::
    ld   hl, $C13F
    call func_001_6BA8
    ldh  a, [hJoypadState]
    and  $0C
    jr   z, jr_001_413B
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a

jr_001_413B::
    ld   e, [hl]
    ld   d, $00
    ld   hl, Data_001_4128
    add  hl, de
    ld   a, [hl]
    ld   hl, $C018
    ldi  [hl], a
    ld   a, $24
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   [hl], $00
    ret
    ldh  a, [$FFB7]
    and  a
    jp   nz, .cleanup
    ld   e, $70

.wait1
    xor  a
    ld   [rBGP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  e
    jr   nz, .wait1
    ld   e, $30

.loop1
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, .loop1
    ld   e, $30

.loop2
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, .loop2
    ld   e, $FF

.wait2
    ld   a, $C0
    ld   [rBGP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  e
    jr   nz, .wait2
    ld   e, $30

.loop3
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, .loop3
    ld   e, $30

.loop4
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, .loop4

.cleanup
    xor  a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ret
