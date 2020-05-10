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
    jr   z, LCDOn_return
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
