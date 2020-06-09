;
; Code for save file screen.
; Displays the "Return to Game / Save and Quit" screen.
;

FileSaveEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._01 dw FileSaveMapFadeOut
._02 dw FileSaveDelay1
._03 dw FileSaveDelay2
._04 dw FileSaveVisible
._05 dw FileSaveInteractive
._06 dw FileSaveFadeOut


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
    call func_001_6162
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
