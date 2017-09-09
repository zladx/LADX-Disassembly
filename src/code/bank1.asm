; Code for bank 1.
; Contains main engine support code.

data_380   equ $0380

; Code for save file screen.
; Displays the "Return to Game / Save and Quit" screen.
FileSaveHandlerEntryPoint::
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
    call label_EFC
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_4072
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

label_4072::
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
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, .return
    call IncrementGameplaySubtype
.return
    ret

FileSaveInteractive::
    call label_412A
    ldh  a, [$FFCC]
    and  $B0
    jr   z, LCDOn_return
    ld   a, $13
    ldh  [$FFF2], a
    ld   a, [$C13F]
    cp   $01
    jr   z, label_40F9
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [$DBA5]
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
    ld   [$DB99], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ldh  a, [$FF98]
    ld   [$DB9D], a
    ldh  a, [$FF99]
    ld   [$DB9E], a
    call label_52A4
    ld   a, $80
    ld   [$DBC7], a
    ret

label_40F9::
    call label_27F2
    call label_5DE6
    call ClearWRAMAndLowerHRAM
    xor  a
    ldh  [$FFF5], a
    ld   a, $01
    ld   [$DBAF], a
    call label_6162

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
LCDOn_return:
    ret

label_4128::
    ld   c, b
    ld   e, b

label_412A::
    ld   hl, $C13F
    call label_6BA8
    ldh  a, [$FFCC]
    and  $0C
    jr   z, label_413B
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a

label_413B::
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_4128
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
    jp   nz, label_41BB
    ld   e, $70

label_4158::
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
    jr   nz, label_4158
    ld   e, $30

label_417E::
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, label_417E
    ld   e, $30

label_4187::
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, label_4187
    ld   e, $FF

label_4190::
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
    jr   nz, label_4190
    ld   e, $30

label_41AB::
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, label_41AB
    ld   e, $30

label_41B4::
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, label_41B4

label_41BB::
    xor  a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ret


    db $f0, $9c, $c7, $03, $42, $91, $42, $9b
    db $42, $ca, $42, $d9, $42


label_41CF::
    db $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a
    db $6a, $6a, $00, $00, $00, $0a, $04, $06
    db $00, $0a, $04, $06, $00, $0a, $04, $06


label_41E7::
    db $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1c
    db $1c, $1c

    dec  de
    ld   a, [de]
    add  hl, de
    jr   label_420D
    ld   d, $15
    inc  d
    inc  de
    ld   [de], a
    db   $11
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $af ; Undefined instruction
    ld   [wScreenShakeHorizontal], a
    ld   [wScreenShakeVertical], a
    ldh  a, [$FFB7]
    and  a

label_420D::
    jr   nz, label_4259
    ld   a, $10
    ldh  [$FFB7], a
    ld   a, $01
    ldh  [$FF9C], a
    ld   a, $0F
    ld   [wTileMapToLoad], a
    ld   a, $FF
    ldh  [hLinkAnimationState], a
    ld   a, [$DB57]
    add  a, $01
    daa
    ld   [$DB57], a
    ld   a, [$DB58]
    adc  a, $00
    daa
    ld   [$DB58], a
    cp   $10
    jr   c, label_4240
    ld   a, $99
    ld   [$DB57], a
    ld   a, $09
    ld   [$DB58], a

label_4240::
    xor  a
    ld   [$C1BF], a
    ld   [$D415], a
    ld   [$D47C], a
    ld   [$D47A], a
    ld   [$C3CB], a
    ld   [$C3CC], a
    ld   [$C3CD], a
    ld   [rOBP0], a
    ret

label_4259::
    rra
    rra
    rra
    and  $3F
    ld   e, a
    ld   d, $00
    ld   hl, label_41CF
    add  hl, de
    ld   a, [hl]
    ldh  [hLinkAnimationState], a
    ldh  a, [$FFB7]
    rra
    rra
    rra
    and  $1F
    ld   e, a
    ld   hl, label_41E7
    add  hl, de
    ld   a, [hl]
    ld   [$C3CD], a
    ld   a, $01
    ld   [$C3CB], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, [wBGPalette]
    ld   [$DB99], a
    ld   e, $08
    call label_8D7
    call label_90F
    ret
    ld   a, $0D
    ld   [wTileMapToLoad], a
    ld   hl, $FF9C
    inc  [hl]
    ret
    ld   a, $E4
    ld   [wBGPalette], a
    ld   a, $0A
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   hl, $FF9C
    inc  [hl]
    call label_905
    call label_2802
    ret
    nop
    cp   $FD
    cp   $00
    ld   [bc], a
    inc  bc
    ld   [bc], a
    nop
    inc  b
    ld   [$100C], sp
    inc  c
    ld   [$F004], sp
    or   a
    and  a
    jr   nz, label_42D8
    ld   hl, $FF9C
    inc  [hl]
    ld   a, $03
    ld   [$D368], a

label_42D8::
    ret
    call label_4339
    ldh  a, [$FFCC]
    and  $B0
    jr   z, label_4335
    ld   a, [$C13F]
    cp   $01
    jr   z, label_432C
    cp   $00
    jr   z, label_42F2
    ld   [$DBD1], a
    jr   label_42F5

label_42F2::
    call label_5DE6

label_42F5::
    xor  a
    ld   hl, wEntitiesTypeTable
    ld   e, $10

label_42FB::
    ldi  [hl], a
    dec  e
    jr   nz, label_42FB
    ld   [wOBJ0Palette], a
    ld   [$DB99], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ld   [$D6FB], a
    ld   [$D475], a
    ldh  a, [$FF98]
    ld   [$DB9D], a
    ldh  a, [$FF99]
    ld   [$DB9E], a
    call label_52A4
    ld   a, $01
    call label_8FA
    ld   a, $80
    ld   [$DBC7], a
    ret

label_432C::
    call label_5DE6
    xor  a
    ldh  [$FFF5], a
    call label_6162

label_4335::
    ret

label_4336::
    ld   d, b
    ld   h, b
    ld   [hl], b

label_4339::
    ld   hl, $C13F
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_434D
    ld   a, [hl]
    inc  a
    cp   $03
    jr   nz, label_434C
    xor  a

label_434C::
    ld   [hl], a

label_434D::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_435C
    ld   a, [hl]
    dec  a
    cp   $FF
    jr   nz, label_435B
    ld   a, $02

label_435B::
    ld   [hl], a

label_435C::
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_4336
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

OverworldHandlerEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw label_4395
._1 dw label_442B
._2 dw label_44B4
._3 dw label_44DB
._4 dw label_44F9
._5 dw label_4500
._6 dw label_4507
._7 dw label_F48

label_4385::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_438D

label_438D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_4395::
    call label_27F2
    call IncrementGameplaySubtype
    ld   a, [ROM_DebugTool2]
    and  a
    jr   z, label_43A7
    ld   a, $0B
    ld   [wBGMapToLoad], a
    ret

label_43A7::
    ld   a, [$DBA5]
    and  a
    jr   z, label_4414
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_43B8
    ld   hl, $DDDA
    jr   label_43C5

label_43B8::
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $DB16
    add  hl, de

label_43C5::
    ld   de, $DBCC
    ld   c, $05

label_43CA::
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_43DB
    cp   $08
    jr   z, label_43D8
    cp   $0A
    jr   c, label_43DB

label_43D8::
    xor  a
    jr   z, label_43DC

label_43DB::
    ld   a, [hli]

label_43DC::
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_43CA
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_43E9
    ld   a, $0F

label_43E9::
    ld   e, a
    ld   d, $00
    ld   hl, label_4385
    add  hl, de
    ld   a, [hl]
    ld   [$DBB0], a
    ldh  a, [$FFF7]
    cp   $FF
    jr   z, label_440B
    cp   $08
    jr   z, label_4425
    cp   $0A
    jr   nc, label_4425
    cp   $06
    jr   nz, label_440B
    ldh  a, [$FFF9]
    and  a
    jr   nz, label_4425

label_440B::
    call label_5511
    ld   a, $07
    ld   [wBGMapToLoad], a
    ret

label_4414::
    ld   a, $02
    ld   [wBGMapToLoad], a
    call GetRandomByte
    ld   hl, hFrameCounter
    or   [hl]
    and  $03
    ldh  [$FFB9], a
    ret

label_4425::
    ld   a, $09
    ld   [wBGMapToLoad], a
    ret

label_442B::
    call ClearLowerWRAM
    xor  a
    ld   [$C11C], a
    call IncrementGameplaySubtype
    ld   a, [$DB9D]
    ldh  [$FF98], a
    ld   [$DBB1], a
    ld   a, [$DB9E]
    ldh  [$FF99], a
    ld   [$DBB2], a
    ld   a, [$DBC8]
    ldh  [$FFA2], a
    and  a
    jr   z, label_4452
    ld   a, $02
    ld   [$C146], a

label_4452::
    ld   a, $04
    ld   [$C125], a
    call label_30F4
    call label_37FE
    call label_5FB3
    ld   a, $FF
    ldh  [$FFA6], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_44A6
    ld   d, a
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_4475
    ld   d, $00
    jr   label_447E

label_4475::
    cp   $1A
    jr   nc, label_447E
    cp   $06
    jr   c, label_447E
    inc  d

label_447E::
    ldh  a, [$FFF6]
    ld   e, a
    call label_29ED
    cp   $1A
    jr   z, label_4495
    cp   $19
    jr   z, label_4495
    ld   a, [$C18E]
    and  $E0
    cp   $80
    jr   nz, label_44A6

label_4495::
    ld   a, [$DBCD]
    and  a
    jr   z, label_44A6
    ldh  a, [$FFF8]
    and  $10
    jr   nz, label_44A6
    ld   a, $0C
    ld   [$D462], a

label_44A6::
    ld   a, [$DBA5]
    and  a
    ld   a, $06
    jr   nz, label_44B0
    ld   a, $07

label_44B0::
    ld   [wTileMapToLoad], a
    ret

label_44B4::
    ld   a, $0F
    ldh  [$FF94], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_44C9
    di
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

label_44C9::
    call label_D1E
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [hNeedsUpdatingEnnemiesTiles], a
    ld   a, $09
    ld   [wTileMapToLoad], a

IncrementGameplaySubtype::
IncrementGameplaySubtypeAndReturn::
    ld   hl, wGameplaySubtype
    inc  [hl]
    ret

label_44DB::
    ld   a, $01
    ld   [wTileMapToLoad], a
    ld   a, [$D6FA]
    and  a
    jr   z, label_44F5
    ld   a, $05
    ld   [$D6F8], a
    ld   a, [$C1CB]
    and  a
    jr   z, label_44F5
    ld   a, $03
    ldh  [$FFA5], a

label_44F5::
    call IncrementGameplaySubtype
    ret

label_44F9::
    call label_3E3F
    call IncrementGameplaySubtype
    ret

label_4500::
    call label_3E5A
    call IncrementGameplaySubtype
    ret

label_4507::
    call label_5895
    ld   a, [$FF40]
    or   $20
    ld   [wLCDControl], a
    ld   [rLCDC], a
    call IncrementGameplaySubtype
    ld   a, [$C11C]
    ld   [$D463], a
    ld   a, $04
    ld   [$C11C], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [$C3CB]
    and  a
    jr   z, label_4548
    ld   a, [$C5AD]
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E4
    ld   [$DB99], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_4548
    ld   a, $04
    ld   [$C16B], a

label_4548::
    jp   label_27DD
    ldh  a, [$FFCC]
    and  $90
    jp   z, TransitionReturn

TransitionToFileMenu::
    ld   [$D47B], a

label_4555::
    call EnableExternalRAMWriting
    ld   a, [$A454]
    ld   [$DB80], a
    call EnableExternalRAMWriting
    ld   a, [$A455]
    ld   [$DB81], a
    call EnableExternalRAMWriting
    ld   a, [$A456]
    ld   [$DB82], a
    call EnableExternalRAMWriting
    ld   a, [$A457]
    ld   [$DB83], a
    call EnableExternalRAMWriting
    ld   a, [$A458]
    ld   [$DB84], a
    call EnableExternalRAMWriting
    ld   a, [$A45F]
    ld   [$DC06], a
    call EnableExternalRAMWriting
    ld   a, [$A460]
    ld   [$DC09], a
    call EnableExternalRAMWriting
    ld   a, [$A45C]
    ld   [$DC00], a
    call EnableExternalRAMWriting
    ld   a, [$A45D]
    ld   [$DC01], a
    call EnableExternalRAMWriting
    ld   a, [$A801]
    ld   [$DB85], a
    call EnableExternalRAMWriting
    ld   a, [$A802]
    ld   [$DB86], a
    call EnableExternalRAMWriting
    ld   a, [$A803]
    ld   [$DB87], a
    call EnableExternalRAMWriting
    ld   a, [$A804]
    ld   [$DB88], a
    call EnableExternalRAMWriting
    ld   a, [$A805]
    ld   [$DB89], a
    call EnableExternalRAMWriting
    ld   a, [$A80C]
    ld   [$DC07], a
    call EnableExternalRAMWriting
    ld   a, [$A80D]
    ld   [$DC0A], a
    call EnableExternalRAMWriting
    ld   a, [$A809]
    ld   [$DC02], a
    call EnableExternalRAMWriting
    ld   a, [$A80A]
    ld   [$DC03], a
    call EnableExternalRAMWriting
    ld   a, [$ABAE]
    ld   [$DB8A], a
    call EnableExternalRAMWriting
    ld   a, [$ABAF]
    ld   [$DB8B], a
    call EnableExternalRAMWriting
    ld   a, [$ABB0]
    ld   [$DB8C], a
    call EnableExternalRAMWriting
    ld   a, [$ABB1]
    ld   [$DB8D], a
    call EnableExternalRAMWriting
    ld   a, [$ABB2]
    ld   [$DB8E], a
    call EnableExternalRAMWriting
    ld   a, [$ABB9]
    ld   [$DC08], a
    call EnableExternalRAMWriting
    ld   a, [$ABBA]
    ld   [$DC0B], a
    call EnableExternalRAMWriting
    ld   a, [$ABB6]
    ld   [$DC04], a
    call EnableExternalRAMWriting
    ld   a, [$ABB7]
    ld   [$DC05], a
    ld   a, GAMEPLAY_FILE_SELECT
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    xor  a
    ldh  [$FF97], a
    ldh  [hBaseScrollX], a
    ld   a, $00
    ld   [wBGPalette], a
    ld   [wOBJ0Palette], a
    ld   [$DB99], a
    ld   a, $01
    call label_8FA
TransitionReturn::
    ret

label_4667::
    db 4, 1, 2, 3, 5, 6, 7, 8, 9, $A, $B, $C, 1, 1, 1, 0
    db 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2
    db 1, 1, 1, 1, 3, 1, 1, 1, 1, 4, 1, 1, 1, 1, 5, 1
    db 1, 1, 1, 6, 1, 1, 1, 1, 7, 1, 1, 1, 1, 8, 1, 1
    db 1, 1, 9

; Initialize save files, and load debug save file if needed
InitSaveFiles::
    ; Initialize the battery-backed memory used for save files
    ld   de, $0000
    call label_4794
    ld   de, $3AD
    call label_4794
    ld   de, $75A
    call label_4794

    ; If DebugTool1 is enabled,
    ; write a default save file with everything unlocked
    ld   a, [ROM_DebugTool1]
    and  a
    jp   z, .return

    ld   e, $00
    ld   d, $00
    ld   bc, $A405
.loop
    ld   hl, label_4667
    add  hl, de
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    inc  e
    ld   a, e
    cp   $43
    jr   nz, .loop

    ld   a, $01
    ld   [$A453], a
    ld   a, $01
    ld   [$A449], a
    ld   a, $02
    ld   [$A448], a

    ld   hl, $A46A
    ld   e, $09
    ld   a, $02
.loop2
    ldi  [hl], a
    dec  e
    jr   nz, .loop2

    ld   a, $60
    ld   [$A452], a
    ld   [$A47D], a
    ld   [$A47C], a
    ld   [$A44A], a
    ld   a, $40
    ld   [$A47B], a
    ld   [$A451], a
    ld   a, $89
    ld   [$A44C], a
    xor  a
    ld   [$A414], a
    ld   a, $07
    ld   [$A44E], a
    ld   a, $05
    ld   [$A462], a
    ld   a, $09
    ld   [$A463], a
    ld   a, $01
    ld   [$A44D], a
    ld   a, $50
    ld   [$A45F], a
    ld   a, $0A
    ld   [$A460], a

    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_NEW
    jr   z, .notOnNewFileScreen
    ld   a, $5B
    ld   [$A454], a
    ld   a, $46
    ld   [$A455], a
    ld   a, $4D
    ld   [$A456], a
    ld   a, $45
    ld   [$A457], a
    ld   a, $42
    ld   [$A458], a

.notOnNewFileScreen
    xor  a
    ld   [$A45C], a
    ld   [$A45D], a
    ld   [$A45B], a
    ld   [$A464], a
    ld   [$A465], a
    ld   a, $92
    ld   [$A466], a
    ld   a, $48
    ld   [$A467], a
    ld   a, $62
    ld   [$A468], a

    ld   hl, $A105
    ld   a, $80
    ld   e, $00
.loop3
    ldi  [hl], a
    dec  e
    jr   nz, .loop3

    ld   a, $01
    ld   [$DDDA], a
    ld   [$DDDB], a
    ld   [$DDDC], a
    ld   [$DDDD], a
    ld   [$DDDE], a
    ld   a, $FF
    ld   [wPhotos1], a
    ld   a, $0F
    ld   [wPhotos2], a

.return
    ret

label_4794::
    ld   c, $01
    ld   b, $05
    ld   hl, $A100
    add  hl, de

label_479C::
    call EnableExternalRAMWriting
    ld   a, [hli]
    cp   c
    jr   nz, label_47AA
    inc  c
    inc  c
    dec  b
    jr   nz, label_479C
    jr   label_47CD

label_47AA::
    push de
    ld   hl, $A105
    add  hl, de
    ld   de, label_3A8

label_47B2::
    call EnableExternalRAMWriting
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_47B2
    pop  de
    ld   hl, $A100
    add  hl, de
    ld   a, $01

label_47C3::
    call EnableExternalRAMWriting
    ldi  [hl], a
    inc  a
    inc  a
    cp   $0B
    jr   c, label_47C3

label_47CD::
    ret
    call label_5DC0
    ld   a, [wGameplaySubtype]
    JP_TABLE
    ; Code below is actually data for the jump table
    jp   hl
    ld   b, a
    push af
    ld   b, a
    db   $FD ; Undefined instruction
    ld   b, a
    ld   b, $48
    inc  c
    ld   c, b
    ld   c, a
    ld   c, b
    or   e
    ld   c, b
    db   $E8 ; add  sp, d
    ld   c, b
    sub  a, l
    ld   c, c
    inc  b
    ld   c, d
    ld   a, $04
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$D000], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $08
    ld   [wTileMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn
    call label_4DA6
    call label_4DBE
    jp   IncrementGameplaySubtypeAndReturn
    call label_4DD6
    jp   IncrementGameplaySubtypeAndReturn

label_480C::
    ld   a, [$DBA7]
    and  $01
    jr   z, label_4821
    ld   a, [$DC00]
    ld   h, a
    ld   a, [$DC01]
    ld   l, a
    ld   de, $98E7
    call label_4F45

label_4821::
    ld   a, [$DBA7]
    and  $02
    jr   z, label_4836
    ld   a, [$DC02]
    ld   h, a
    ld   a, [$DC03]
    ld   l, a
    ld   de, $9947
    call label_4F45

label_4836::
    ld   a, [$DBA7]
    and  $04
    jr   z, label_484B
    ld   a, [$DC04]
    ld   h, a
    ld   a, [$DC05]
    ld   l, a
    ld   de, $99A7
    call label_4F45

label_484B::
    jp   IncrementGameplaySubtypeAndReturn
    ret
    jp   label_4D6D

label_4852::
    push de
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $10
    ld   [$D600], a
    ld   a, b
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    pop  de
    push de
    ld   a, $05

label_486D::
    ldh  [$FFD7], a
    ld   a, [de]
    and  a
    ld   a, $7E
    jr   z, label_4881
    ld   a, [de]
    dec  a
    push bc
    push hl
    ld   c, a
    ld   b, $00
    call label_C25
    pop  hl
    pop  bc

label_4881::
    ldi  [hl], a
    inc  de
    ldh  a, [$FFD7]
    dec  a
    jr   nz, label_486D
    ld   a, b
    ldi  [hl], a
    ld   a, c
    sub  a, $20
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    pop  de
    ld   a, $05

label_4894::
    ldh  [$FFD7], a
    ld   a, [de]
    and  a
    jr   label_489D
    dec  a
    and  $C0

label_489D::
    ld   a, $7E
    jr   label_48A9
    ld   a, [de]
    and  $80
    ld   a, $C8
    jr   z, label_48A9
    inc  a

label_48A9::
    ldi  [hl], a
    inc  de
    ldh  a, [$FFD7]
    dec  a
    jr   nz, label_4894
    xor  a
    ld   [hl], a
    ret
    ld   a, [$D47B]
    and  a
    jr   z, label_48C2
    xor  a
    ld   [$D47B], a
    ld   a, $11
    ld   [$D368], a

label_48C2::
    ld   a, [$DBA7]
    and  a
    ld   a, $03
    jr   z, label_48CC
    ld   a, $04

label_48CC::
    ld   [wBGMapToLoad], a
    ld   a, $E4
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E4
    ld   [$DB99], a
    call label_905
    jp   IncrementGameplaySubtypeAndReturn

label_48E4::
    dec  sp
    ld   d, e
    ld   l, e
    add  a, e
    call label_6BA8
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_48F4
    jp   IncrementGameplaySubtypeAndReturn

label_48F4::
    ldh  a, [$FFCC]
    and  $0C
    jr   z, label_4920
    ld   c, $02
    ld   a, [$DBA7]
    and  a
    jr   z, label_4903
    inc  c

label_4903::
    ldh  a, [$FFCC]
    bit  2, a
    jr   nz, label_4915
    ld   a, [$DBA6]
    add  a, $01
    inc  c
    cp   c
    jr   c, label_491D
    xor  a
    jr   label_491D

label_4915::
    ld   a, [$DBA6]
    sub  a, $01
    jr   nc, label_491D
    ld   a, c

label_491D::
    ld   [$DBA6], a

label_4920::
    ld   a, [$DBA6]
    cp   $03
    jr   nz, label_4954
    ldh  a, [$FFCC]
    and  $03
    jr   z, label_4938
    call label_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

label_4938::
    ldh  a, [hFrameCounter]
    and  $10
    jr   nz, label_4954
    ld   a, [$D000]
    and  a
    ld   a, $2C
    jr   z, label_4948
    ld   a, $64

label_4948::
    ld   hl, $C008
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4954::
    ld   a, [$DBA6]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ldh  a, [hFrameCounter]
    and  $08
    jr   z, label_497B
    ld   a, [hl]
    ld   hl, $C000
    push af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_497B::
    ld   a, [hl]
    ld   hl, $C000
    push af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret
    ld   a, [$DBA6]
    cp   $03
    jr   z, label_49DE
    ld   a, [$DBA6]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   c, $05
    ld   hl, $DB80
    add  hl, de

label_49AE::
    ld   a, [hli]
    and  a
    jr   nz, label_49C3
    dec  c
    jr   nz, label_49AE
    xor  a
    ld   [wGameplaySubtype], a
    ld   a, GAMEPLAY_FILE_NEW
    ld   [wGameplayType], a

label_49BE::
    ld   a, $13
    ldh  [$FFF2], a
    ret

label_49C3::
    call label_49BE
    ld   a, $00
    ld   [wBGPalette], a
    ld   [wOBJ0Palette], a
    ld   [$DB99], a
    ld   a, $01
    call label_8FA
    ld   a, $05
    ld   [wTileMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn

label_49DE::
    xor  a
    ld   [wGameplaySubtype], a
    ld   a, [$D000]
    and  a
    ld   a, $04
    jr   z, label_49EC
    ld   a, GAMEPLAY_FILE_COPY

label_49EC::
    ld   [wGameplayType], a
    jp   label_49BE

label_49F2::
    dec  b
    and  h
    or   d
    and  a
    ld   e, a
    xor  e

label_49F8::
    dec  b
    and  c
    or   d
    and  h
    ld   e, a
    xor  b

label_49FE::
    db 0, $A1, $AD, $A4, $5A, $A8, $C3, $A4, $52

label_4A07::
    ld   a, [wGameplaySubtype]
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   de, label_244A
    ld   c, d
    sbc  a, e
    ld   c, d
    call IncrementGameplaySubtype
    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DBA8], a
    ld   [$DBA9], a
    ld   [$DBAA], a
    ret
    ld   a, $05
    ld   [wBGMapToLoad], a
    ld   hl, $D601
    ld   a, $98
    ldi  [hl], a
    ld   a, $49
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, [$DBA6]
    add  a, $AB
    ldi  [hl], a
    xor  a
    ld   [hl], a
    jp   IncrementGameplaySubtypeAndReturn

label_4A3F::
    push hl
    add  hl, bc
    call EnableExternalRAMWriting
    ld   [hl], a
    pop  hl
    ret
    ld   bc, label_4667
    ld   e, $43
    push hl

label_4A4D::
    call EnableExternalRAMWriting
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    ld   a, e
    and  a
    jr   nz, label_4A4D
    pop  hl
    ld   bc, $004E
    ld   a, $01
    call label_4A3F
    ld   bc, $0044
    call label_4A3F
    ld   bc, $0043
    ld   a, $02
    call label_4A3F
    ld   bc, $004D
    ld   a, $59
    call label_4A3F
    ld   bc, $0077
    call label_4A3F
    ld   bc, $0078
    call label_4A3F
    ld   bc, $0045
    call label_4A3F
    ld   bc, $0076
    ld   a, $39
    call label_4A3F
    ld   bc, $004C
    call label_4A3F
    ret

label_4A98::
    nop
    dec  b
    ld   a, [bc]
    ld   a, [$DBA6]
    ld   e, a
    ld   d, $00
    ld   hl, label_4A98
    add  hl, de
    ld   e, [hl]
    ld   hl, $DB80
    add  hl, de
    ld   e, l
    ld   d, h
    ld   bc, $984A
    call label_4852
    ldh  a, [$FFCC]
    and  $80
    jr   z, label_4B29
    call label_49BE
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F2
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    push hl
    ld   de, $004F
    add  hl, de
    push hl
    ld   a, [$DBA6]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $DB80
    add  hl, de
    ld   a, [hli]
    cp   $5B
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $46
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $4D
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $45
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $42
    jr   nz, label_4AFE
    ld   a, $60
    ld   [$D368], a

label_4AFE::
    ld   hl, $DB80
    add  hl, de
    pop  bc
    ld   e, $05

label_4B05::
    call EnableExternalRAMWriting
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, label_4B05
    pop  hl
    push hl
    ld   de, $005A
    add  hl, de
    ld   [hl], $18
    pop  hl
    push hl
    ld   de, $005B
    add  hl, de

label_4B1C::
    ld   [hl], $03
    pop  hl
    ld   de, $0057
    add  hl, de
    xor  a
    ldi  [hl], a
    ld   [hl], a
    jp   label_4555

label_4B29::
    call label_4BF5
    call label_4C8A
    ret

label_4B30::
    jr   c, label_4B6A
    jr   c, label_4B6C
    jr   c, label_4B6E
    jr   c, label_4B70
    jr   c, label_4B72
    jr   c, label_4B74
    jr   c, label_4B76
    jr   c, label_4B78
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b

label_4B6A::
    ld   l, b
    ld   l, b

label_4B6C::
    ld   l, b
    ld   l, b

label_4B6E::
    ld   l, b
    ld   l, b

label_4B70::
    inc  d
    inc  e

label_4B72::
    inc  h
    inc  l

label_4B74::
    inc  [hl]
    inc  a

label_4B76::
    ld   b, h
    ld   c, h

label_4B78::
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h

label_4BB0::
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h

label_4BB5::
    db $42, $43, $44, $45, $46, $47, $48, $00
    db $00, $62, $63, $64, $65, $66, $67, $68
    db $49, $4a, $4b, $4c, $4d, $4e, $4f, $00
    db $00, $69, $6a, $6b, $6c, $6d, $6e, $6f
    db $50, $51, $52, $53, $54, $55, $56, $00
    db $00, $70, $71, $72, $73, $74, $75, $76
    db $57, $58, $59, $5a, $5b, $00, $00, $00
    db $00, $77, $78, $79, $7a, $7b, $00, $00


label_4BF5::
    ldh  a, [$FFCC]

label_4BF7::
    ldh  [$FFD7], a
    ldh  a, [$FFD7]
    and  $0C
    jr   nz, label_4C41
    ldh  a, [$FFD7]
    and  $03
    jr   nz, label_4C21
    ldh  a, [$FFCB]
    ld   hl, $C182
    and  $0F
    jr   nz, label_4C12
    xor  a
    ld   [hl], a
    jr   label_4C1F

label_4C12::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, label_4C1F
    ld   [hl], $15
    ldh  a, [$FFCB]
    jr   label_4BF7

label_4C1F::
    jr   label_4C63

label_4C21::
    call label_6BAE
    bit  1, a
    jr   nz, label_4C34
    ld   a, [$DBA9]
    add  a, $01
    cp   $40
    jr   c, label_4C5E
    xor  a
    jr   label_4C5E

label_4C34::
    ld   a, [$DBA9]
    sub  a, $01
    cp   $FF
    jr   nz, label_4C5E
    ld   a, $3F
    jr   label_4C5E

label_4C41::
    call label_6BAE
    bit  2, a
    jr   z, label_4C53
    ld   a, [$DBA9]
    sub  a, $10
    jr   nc, label_4C5E
    add  a, $40
    jr   label_4C5E

label_4C53::
    ld   a, [$DBA9]
    add  a, $10
    cp   $40
    jr   c, label_4C5E
    sub  a, $40

label_4C5E::
    ld   [$DBA9], a
    jr   label_4C63

label_4C63::
    ld   a, [$DBA9]
    ld   hl, label_4B70
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ld   a, [$DBA9]
    ld   hl, label_4B30
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   d, [hl]
    ld   hl, $C000
    ld   a, d
    add  a, $0B
    ldi  [hl], a
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, $E0
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_4C8A::
    ldh  a, [$FFCC]
    and  $30
    jr   z, label_4CB7
    bit  5, a
    jr   nz, label_4CA7
    call label_49BE
    call label_4CDA
    ld   a, [$DBAA]
    add  a, $01
    cp   $05
    jr   c, label_4CB4
    ld   a, $04
    jr   label_4CB4

label_4CA7::
    call label_49BE
    ld   a, [$DBAA]
    sub  a, $01
    cp   $FF
    jr   nz, label_4CB4
    xor  a

label_4CB4::
    ld   [$DBAA], a

label_4CB7::
    ld   a, [$DBAA]
    ld   hl, label_4BB0
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_4CD9
    ld   hl, $C004
    ld   a, $18
    add  a, $0B
    ldi  [hl], a
    ld   a, e
    add  a, $0C
    ldi  [hl], a
    ld   a, $E0
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4CD9::
    ret

label_4CDA::
    ld   a, [$DBA9]
    ld   c, a
    ld   b, $00
    ld   hl, label_4BB5
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   a, [$DBA6]
    ld   c, a
    sla  a
    sla  a
    add  a, c
    ld   c, a
    ld   hl, $DB80
    add  hl, bc
    ld   a, [$DBAA]
    ld   c, a
    add  hl, bc
    ld   [hl], e
    ret
    call label_5DC0
    ld   a, [wGameplaySubtype]
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   a, [de]
    ld   c, l
    inc  l
    ld   c, l
    ld   d, [hl]
    ld   c, l
    ld   h, l
    ld   c, l
    ld   l, l
    ld   c, l
    ld   a, c
    ld   c, l
    add  a, d
    ld   c, l
    adc  a, b
    ld   c, l
    add  hl, sp
    ld   c, l
    ld   c, c
    ld   c, l
    ld   b, $4E
    ld   l, e
    ld   c, [hl]
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $01
    call label_8FA
    ld   a, $01
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    call label_905
    ld   a, $01
    ld   [$DDD1], a
    jp   IncrementGameplaySubtypeAndReturn
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a

label_4D53::
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DBA6], a
    ld   [$D000], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $06
    ld   [wBGMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn

label_4D6D::
    call label_4D8B
    call label_4D94
    call label_4D9D

label_4D79::
    jp   IncrementGameplaySubtypeAndReturn

label_4D7A::
    call label_4DA6
    call label_4DBE
    jp   IncrementGameplaySubtypeAndReturn
    call label_4DD6
    jp   IncrementGameplaySubtypeAndReturn
    jp   label_480C

label_4D8B::
    ld   bc, $98C5
    ld   de, $DB80
    jp   label_4852

label_4D94::
    ld   bc, $9925
    ld   de, $DB85
    jp   label_4852

label_4D9D::
    ld   bc, $9985
    ld   de, $DB8A
    jp   label_4852

label_4DA6::
    ld   a, [$DBA7]
    and  $01
    jr   z, label_4DBD
    xor  a
    ldh  [$FFDB], a
    ld   a, [$DC06]
    ldh  [$FFD9], a
    ld   a, [$DC09]
    ldh  [$FFDA], a
    jp   label_5D53

label_4DBD::
    ret

label_4DBE::
    ld   a, [$DBA7]
    and  $02
    jr   z, label_4DBD
    ld   a, $01
    ldh  [$FFDB], a
    ld   a, [$DC07]
    ldh  [$FFD9], a
    ld   a, [$DC0A]
    ldh  [$FFDA], a
    jp   label_5D53

label_4DD6::
    ld   a, [$DBA7]
    and  $04
    jr   z, label_4DBD
    ld   a, $02
    ldh  [$FFDB], a
    ld   a, [$DC08]
    ldh  [$FFD9], a
    ld   a, [$DC0B]
    ldh  [$FFDA], a
    jp   label_5D53

label_4DEE::
    sbc  a, b
    and  l
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    push bc
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  b
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   h, l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    add  a, l
    ld   b, h
    ld   a, [hl]
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_4E18
    ld   a, [$DBA6]
    inc  a
    and  $03
    ld   [$DBA6], a

label_4E18::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_4E2B
    ld   a, [$DBA6]
    dec  a
    cp   $FF
    jr   nz, label_4E28
    ld   a, $03

label_4E28::
    ld   [$DBA6], a

label_4E2B::
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_4E67
    ld   a, [$DBA6]
    cp   $03
    jr   nz, label_4E3B
    jp   label_4555

label_4E3B::
    call label_49BE
    call IncrementGameplaySubtype
    jr   label_4E55

label_4E43::
    db $99, $E4, $D, $7E, $7E, $10, $14, 8, $13, $7E, $7E, $7E, $7E, $E, $A, $7E, $7E, $00

label_4E55::
    ld   hl, $D601
    ld   de, label_4E43
    ld   c, $11

label_4E5D::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4E5D
    ret

label_4E67::
    call label_4954
    ret
    ldh  a, [$FFCC]
    bit  5, a
    jr   nz, label_4E9E
    and  $90
    jr   z, label_4ED9
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call label_49BE
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, label_3A8

label_4E91::
    call EnableExternalRAMWriting
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_4E91
    jp   label_4555

label_4E9E::
    call label_4EE5
    call label_4EBB
    ld   hl, wGameplaySubtype
    dec  [hl]
    ret

label_4EA9::
    db $99, $E4, $D, $11, 4, $13, $14, $11, $D, $7E, $13, $E, $7E, $C, 4, $D
    db $14, 0

label_4EBB::
    ld   a, [$D600]
    ld   e, a
    add  a, $11
    ld   [$D600], a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    ld   de, label_4EA9
    ld   c, $11

label_4ECF::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4ECF
    ret

label_4ED9::
    call label_4F0C
    call label_4954
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_4EEF

label_4EE5::
    ld   a, [$DBA6]
    JP_TABLE
    ; Code below is actually data for the jump table
    adc  a, e
    ld   c, l
    sub  a, h
    ld   c, l
    sbc  a, l
    ld   c, l

label_4EEF::
    ld   a, [$DBA6]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_4DEE
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_4F03::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_4F03
    xor  a
    ld   [de], a
    ret

label_4F0C::
    ldh  a, [$FFCC]
    and  $03
    jr   z, label_4F1D
    call label_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

label_4F1D::
    ldh  a, [hFrameCounter]
    and  $10
    jr   nz, label_4F3A
    ld   a, [$D000]
    ld   e, a
    ld   a, $28
    dec  e
    jr   nz, label_4F2E
    ld   a, $6C

label_4F2E::
    ld   hl, $C00C
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4F3A::
    ret

label_4F3B::
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c

label_4F45::
    push hl
    ld   a, [$D600]
    ld   c, a
    add  a, $06
    ld   [$D600], a
    ld   b, $00
    ld   hl, $D601
    add  hl, bc
    ld   a, d
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    pop  bc
    push hl
    ld   a, c
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $F0
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

    db $fa, $96, $db, $c7, $1a, $4d, $2c, $4d
    db $a6, $4f, $bb, $4f, $c3, $4f, $e1, $4f
    db $39, $4d, $49, $4d, $ff, $4f, $df, $50
    db $e9, $51


    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DBA6], a
    ld   [$D000], a
    ld   [$D001], a
    ld   [$D002], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $0C
    ld   [wBGMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   bc, $98C4
    ld   de, $DB80
    call label_4852
    ld   bc, $9924
    ld   de, $DB85
    call label_4852
    ld   bc, $9984
    ld   de, $DB8A
    call label_4852
    jp   IncrementGameplaySubtypeAndReturn
    ld   bc, $98CD
    ld   de, $DB80
    call label_4852
    ld   bc, $992D
    ld   de, $DB85
    call label_4852
    ld   bc, $998D
    ld   de, $DB8A
    call label_4852
    jp   IncrementGameplaySubtypeAndReturn
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_500E
    ld   a, [$D001]
    inc  a
    jr   label_5018

label_500E::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_501D
    ld   a, [$D001]
    dec  a

label_5018::
    and  $03
    ld   [$D001], a

label_501D::
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_5055
    ld   a, [$D001]
    cp   $03
    jp   z, label_4555
    ld   hl, $DB80
    ld   b, $00
    ld   a, [$D001]
    and  a
    jr   z, label_5042
    cp   $01
    jr   z, label_503F
    ld   hl, $DB8A
    jr   label_5042

label_503F::
    ld   hl, $DB85

label_5042::
    xor  a
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    and  a
    jr   z, label_5055
    call IncrementGameplaySubtype
    call label_49BE

label_5055::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ldh  a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, $C000

label_5067::
    jr   z, label_507D
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_507D::
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_5094::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C000
    add  a, $05
    ldi  [hl], a
    ld   a, $14
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_50AF::
    sbc  a, b
    and  h
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    call nz, label_7E44
    sbc  a, c
    inc  b
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    inc  h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   h, h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    add  a, h
    ld   b, h
    ld   a, [hl]

label_50C7::
    sbc  a, b
    xor  l
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    call label_7E44
    sbc  a, c
    dec  c
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   l, l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    adc  a, l
    ld   b, h
    ld   a, [hl]
    call label_6BA8
    ldh  a, [$FFCC]
    and  $08
    jr   z, label_50F1
    ld   a, [$D002]
    inc  a
    and  $03
    ld   [$D002], a

label_50F1::
    ldh  a, [$FFCC]
    and  $04
    jr   z, label_5104
    ld   a, [$D002]
    dec  a
    cp   $FF
    jr   nz, label_5101
    ld   a, $03

label_5101::
    ld   [$D002], a

label_5104::
    call label_5094
    ldh  a, [$FFCC]
    bit  5, a
    jr   z, label_5114
    ld   hl, wGameplaySubtype
    dec  [hl]
    jp   label_514F

label_5114::
    and  $90
    jr   z, label_5129
    ld   a, [$D002]
    cp   $03
    jp   z, label_4555
    call label_49BE
    call IncrementGameplaySubtype
    jp   label_4E55

label_5129::
    call label_5175

label_512C::
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_514F
    ld   a, [$D001]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_50AF
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_5146::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5146
    xor  a
    ld   [de], a
    ret

label_514F::
    ld   a, [$D001]
    cp   $01
    jr   z, label_5163
    cp   $02
    jr   z, label_516C
    ld   bc, $98C4
    ld   de, $DB80
    jp   label_4852

label_5163::
    ld   bc, $9924
    ld   de, $DB85
    jp   label_4852

label_516C::
    ld   bc, $9984
    ld   de, $DB8A
    jp   label_4852

label_5175::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [$D002]
    cp   $03
    jp   z, label_51C3
    ldh  a, [hFrameCounter]
    and  $08
    jr   z, label_51A8
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_51A8::
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_51C3::
    ldh  a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, $C008
    jp   label_5067

label_51CE::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C008
    add  a, $05
    ldi  [hl], a
    ld   a, $5C
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret
    call label_5094
    call label_51CE
    call label_4F0C
    ldh  a, [$FFCC]
    and  $90
    jr   z, label_5235
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call label_49BE
    ld   a, [$D001]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   a, [hl]
    inc  hl
    ld   h, [hl]
    ld   l, a
    ld   de, label_3AD

label_5224::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5224
    jp   label_4555

label_5235::
    ldh  a, [$FFCC]
    bit  5, a
    jr   z, label_5249
    ld   hl, wGameplaySubtype
    dec  [hl]
    xor  a
    ld   [$D000], a
    call label_4EBB
    jp   label_526F

label_5249::
    call label_512C
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, label_526F
    ld   a, [$D002]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_50C7
    add  hl, de
    ld   de, $D609
    ld   c, $08

label_5266::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5266
    xor  a
    ld   [de], a
    ret

label_526F::
    ld   a, [$D002]
    cp   $01
    jr   z, label_5283
    cp   $02
    jr   z, label_528C
    ld   bc, $98CD
    ld   de, $DB80
    jp   label_4852

label_5283::
    ld   bc, $992D
    ld   de, $DB85
    jp   label_4852

label_528C::
    ld   bc, $998D
    ld   de, $DB8A
    jp   label_4852

label_5295::
    db $18, $18, $18, $18, $18, $18, $28, $28, $28, $28, $38, $38, $38, $38, $50

label_52A4::
    xor  a
    ldh  [$FFF9], a
    ld   a, [$DB5A]
    and  a
    jr   nz, label_52BB
    ld   a, [$DB5B]
    ld   e, a

label_52B1::
    ld   d, $00

label_52B3::
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [$DB5A], a

label_52BB::
    ld   hl, $DBD1
    ld   a, [hl]
    ld   [hl], $00
    and  a
    jr   nz, label_531D
    ld   a, [$DBA6]

label_52C7::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   hl, $D800
    ld   de, data_380

label_52D9::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52D9
    ld   hl, $DDDA
    ld   de, $0005

label_52EA::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52EA
    ld   hl, $DDE0
    ld   de, $0020

label_52FB::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52FB
    call EnableExternalRAMWriting
    ld   a, [bc]
    ld   [$DC0F], a
    inc  bc
    call EnableExternalRAMWriting
    ld   a, [bc]
    ld   [$DC0C], a
    inc  bc
    call EnableExternalRAMWriting
    ld   a, [bc]
    ld   [$DC0D], a

label_531D::
    ld   a, GAMEPLAY_OVERWORLD
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    xor  a
    ld   [$C11C], a
    ldh  [$FF9C], a
    ld   [wSubstractRupeeBufferLow], a
    ld   [$DB94], a
    ld   [wAddRupeeBufferHigh], a
    ld   [$DB8F], a
    ld   [wSubstractRupeeBufferHigh], a
    ld   [wAddRupeeBufferLow], a
    ld   a, [$DB6F]
    and  a
    jr   nz, label_5353
    ld   a, $16
    ld   [$DB6F], a
    ld   a, $50
    ld   [$DB70], a
    ld   a, $27
    ld   [$DB71], a

label_5353::
    ld   a, [$DB62]
    and  a
    jr   z, label_5394
    ld   [$DB9D], a
    ld   a, [$DB63]
    ld   [$DB9E], a
    ld   a, [$DB61]
    ldh  [$FFF6], a
    ld   [$DB9C], a
    ld   a, [$DB60]
    ldh  [$FFF7], a
    ld   a, [$DB64]
    ld   [$DBAE], a
    xor  a
    ldh  [$FFF9], a
    ld   a, $03
    ldh  [$FF9E], a
    ld   a, [$DB5F]
    and  $01
    ld   [$DBA5], a
    jr   z, label_538E
    ld   a, $04
    ldh  [hLinkAnimationState], a
    ld   a, $02
    ldh  [$FF9E], a

label_538E::
    ld   a, $02
    ld   [wBGMapToLoad], a
    ret

label_5394::
    ld   a, $30
    ld   [$DB78], a
    ld   a, $30
    ld   [$DB77], a
    ld   a, $20
    ld   [$DB76], a
    ld   a, $A3
    ld   [$DB9C], a
    ldh  [$FFF6], a
    ld   [$DB54], a
    ld   a, $01
    ld   [$DBA5], a
    ld   a, $10
    ldh  [$FFF7], a
    ld   a, $50
    ld   [$DB9D], a
    ld   a, $60
    ld   [$DB9E], a
    xor  a
    ldh  [hLinkAnimationState], a
    ld   a, $03
    ldh  [$FF9E], a
    ld   a, $16
    ld   [$DB6F], a
    ld   a, $50
    ld   [$DB70], a
    ld   a, $27
    ld   [$DB71], a
    jr   label_538E

label_53D8::
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    rst  $38

label_53E8::
    ldd  [hl], a
    ldd  [hl], a
    add  hl, bc
    rst  $38
    ld   l, $2E
    add  hl, bc
    rst  $38
    adc  a, d
    ldd  [hl], a
    jp   hl
    rst  $38
    adc  a, d
    ld   l, $E9
    rst  $38

label_53F8::
    ret  z
    ret  z
    nop
    rst  $38
    ret  z
    ret  z
    nop
    rst  $38
    ld   c, b
    ret  z
    nop
    rst  $38
    ld   c, b
    ret  z
    nop
    rst  $38

label_5408::
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38

label_5418::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    sbc  a, l
    sbc  a, l
    rst  $38
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, h
    rst  $38
    nop
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    rst  $38

label_545C::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    dec  c
    ld   [de], a
    rst  $38
    nop
    dec  c
    ld   de, rNR12
    sub  a, d
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    sub  a, d
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    sub  a, c
    sub  a, d
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    sub  a, c
    sub  a, d
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38

label_54A0::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    db   $E8 ; add  sp, d
    jp   hl
    rst  $38
    nop
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    jp   hl
    rst  $38
    nop
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    jp   hl
    rst  $38
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    ld   [$E9EC], a
    rst  $38

label_54E4::
    sbc  a, l
    sbc  a, h

label_54E6::
    db $A, $EA

label_54E8::
    db $9C, $E9, $49, $7F, $9D, 9, $49, $7F, $9D, $29, $49, $7F, $9D, $49, $49, $7F
    db $9D, $69, $49, $7F, $9D, $89, $49, $7F, $9D, $A9, $49, $7F, $9D, $C9, $49, $7F
    db $9D, $E9, $49, $7F, $9E, 9, $49, $7F, 0

label_5511::
    ld   hl, label_54E8
    ld   de, $D650
    ld   c, $29

label_5519::
    ld   a, [hli]
    inc  de
    ld   [de], a
    dec  c
    jr   nz, label_5519
    push de
    xor  a
    ldh  [$FFD7], a
    ldh  [$FFD8], a
    ldh  [$FFD9], a
    ldh  [$FFDA], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [$DBB0]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, label_5543

label_5538::
    ld   a, c
    add  a, $04
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_5538
    ld   b, $00

label_5543::
    pop  hl

label_5544::
    push hl
    ld   hl, label_53D8
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD7], a
    ld   hl, label_53E8
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD8], a
    ld   hl, label_53F8
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD9], a
    ld   hl, label_5408
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFDA], a
    pop  hl
    call label_5619
    push hl
    ld   hl, label_53D8
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, label_5544
    xor  a
    ld   [hl], a
    xor  a
    ldh  [$FFD7], a
    ldh  [$FFD8], a
    ldh  [$FFD9], a
    ldh  [$FFDA], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [$DBB0]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, label_55EA

label_558C::
    ld   b, $00
    ld   a, c
    add  a, $08
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_558C
    ld   a, [$DBB0]
    and  $03
    jr   z, label_55C0
    ld   a, [$DBB0]
    and  $30
    cp   $30
    jr   z, label_55AF
    ld   a, c
    add  a, $04
    ld   c, a
    ld   b, $00
    jr   label_55C0

label_55AF::
    ld   a, [$DBB0]
    and  $03
    ld   e, a

label_55B5::
    ld   b, $00
    ld   a, c
    add  a, $0B
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_55B5

label_55C0::
    push hl
    ld   hl, label_5418
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD7], a
    ld   hl, label_545C
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD8], a
    xor  a
    ldh  [$FFD9], a
    ld   hl, label_54A0
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFDA], a
    pop  hl
    call label_5619
    push hl
    ld   hl, label_5418
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, label_55C0

label_55EA::
    xor  a
    ld   b, a
    ld   c, a
    ld   a, [$DBB0]
    bit  5, a
    jr   z, label_55F5
    inc  bc

label_55F5::
    push hl
    ld   hl, label_54E4
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD7], a
    ld   hl, label_54E6

label_5600::
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD8], a
    ld   a, $01
    ldh  [$FFD9], a
    ldh  a, [$FFF7]
    add  a, $B1
    ldh  [$FFDA], a
    pop  hl
    call label_5619
    inc  hl
    ld   a, $7F
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_5619::
    ldh  a, [$FFD7]
    ldi  [hl], a
    ldh  a, [$FFD8]
    ldi  [hl], a
    ldh  a, [$FFD9]
    ldi  [hl], a
    ldh  a, [$FFDA]
    ld   [hl], a
    ret
    xor  a
    ld   [$C3C0], a
    ld   a, [wGameplaySubtype]
    cp   $05
    jr   z, label_5639
    xor  a
    ldh  [$FFCB], a
    ldh  [$FFCC], a
    ld   a, [wGameplaySubtype]

label_5639::
    JP_TABLE
    ; Code below is actually data for the jump table
    ld   c, b
    ld   d, [hl]
    ld   a, b
    ld   d, [hl]
    db   $F4 ; Undefined instruction
    ld   d, [hl]
    db   $FD ; Undefined instruction
    ld   d, [hl]
    dec  bc
    ld   d, a
    inc  e
    ld   d, a
    dec  h
    ld   e, b
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_5678
    ld   hl, $DC10
    ld   c, $80
    di
    ld   a, $03
    ld   [rSVBK], a
    ld   a, [$D000]
    and  a
    jr   nz, label_5674

label_5660::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_5660
    ld   a, $01
    ld   [$D000], a

label_5674::
    xor  a
    ld   [rSVBK], a
    ei

label_5678::
    call DrawLinkSprite
    call label_EFC
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_56F3
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ldh  [hBaseScrollX], a
    ld   [$C1BF], a
    ldh  [$FF97], a
    ld   [wInventoryAppearing], a
    ld   [$C1B2], a
    ld   [$C1B3], a
    ld   a, [$DB54]
    ld   [$DBB4], a
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_56D9
    swap a
    and  $07
    inc  a
    cp   $01
    jr   nz, label_56D9
    ld   a, [$C5A2]
    and  a
    ld   a, $00
    jr   nz, label_56D9
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    and  $20
    ld   a, $00
    jr   z, label_56D9
    ld   a, $01

label_56D9::
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    ld   a, [$FF40]
    and  $DF
    ld   [wLCDControl], a
    ld   [rLCDC], a
    call label_5888
    ld   a, $08
    ld   [wBGMapToLoad], a

label_56F3::
    ret
    ld   a, $0B
    ld   [wTileMapToLoad], a
    call IncrementGameplaySubtype
    ret
    ld   a, $0E
    ld   [wTileMapToLoad], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype
    ret
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_571B
    call IncrementGameplaySubtype
    call label_49BE

label_571B::
    ret
    ld   a, [ROM_DebugTool3]
    and  a
    jr   z, label_5731
    ldh  a, [$FFCC]
    bit  7, a
    jr   z, label_5731
    xor  a
    ld   [wGameplaySubtype], a
    inc  a
    ld   [wGameplayType], a
    ret

label_5731::
    ld   a, [$C19F]
    and  a
    jp   nz, label_5818
    ldh  a, [$FFCC]
    and  $10
    jr   z, label_57B7
    ld   a, [$DBB4]
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_576F
    ld   e, a
    and  $F0
    jr   nz, label_5766
    ld   a, [$C5A2]
    and  a
    jr   nz, label_576F
    push de
    ld   a, [$DBB4]
    ld   e, a
    ld   hl, $D800
    add  hl, de
    pop  de
    ld   a, [hl]
    and  $20
    jr   z, label_576F

label_5766::
    ld   d, $00
    ld   hl, label_5909
    add  hl, de
    ld   a, [hl]
    jr   label_5792

label_576F::
    ld   a, [$DBB4]
    cp   $24
    jr   z, label_577A
    cp   $34
    jr   nz, label_577E

label_577A::
    ld   a, $76
    jr   label_5792

label_577E::
    rra
    and  $07
    ld   e, a
    ld   a, [$DBB4]
    rra
    rra
    and  $38
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, label_58C9
    add  hl, de
    ld   a, [hl]

label_5792::
    call label_2385
    ld   a, [$C173]
    cp   $A7
    jr   z, label_57A3
    ld   a, [$DBB4]
    cp   $37
    jr   nz, label_57A8

label_57A3::
    ld   a, $01
    ld   [$C112], a

label_57A8::
    ld   a, [$DBB4]
    cp   $70
    ld   a, $01
    jr   nc, label_57B3
    ld   a, $81

label_57B3::
    ld   [$C19F], a
    ret

label_57B7::
    ld   a, [ROM_DebugTool1]
    and  a
    jr   z, label_57FA
    ldh  a, [$FFCB]
    cp   $60
    jr   nz, label_57FA
    ld   a, GAMEPLAY_OVERWORLD
    ld   [wGameplayType], a
    call label_C7D
    ld   a, $00
    ld   [$D401], a
    ld   [$D402], a
    ld   a, [$DBB4]
    ld   [$D403], a
    ld   a, $48
    ld   [$D404], a
    ld   a, $52
    ld   [$D405], a
    ldh  a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    ld   [$D416], a
    ld   a, $07
    ld   [wGameplaySubtype], a
    ret

label_57FA::
    ld   e, $40
    ld   a, [ROM_DebugTool1]
    and  a
    jr   nz, label_5804
    ld   e, $60

label_5804::
    ldh  a, [$FFCC]
    and  e
    jr   z, label_5818
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype

label_5818::
    call label_58A8
    call label_5A71
    call label_5C49
    ret
    call label_6A7C

FileSaveFadeOut::
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_58A7
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_5854
    ld   hl, $DC10
    ld   c, $80
    di

label_583A::
    ld   a, $03
    ld   [rSVBK], a
    ld   b, [hl]
    dec  a
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_583A
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

label_5854::
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$C50A], a
    ld   [$C116], a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [$C167], a
    ld   a, $07
    ldh  [hWindowYUnused], a
    ld   a, $70
    ldh  [hWindowXUnused], a
    ld   a, GAMEPLAY_OVERWORLD
    ld   [wGameplayType], a
    ldh  [$FFBC], a
    ld   a, $02
    ld   [wGameplaySubtype], a
    ld   a, [$DBA5]
    and  a
    ld   a, $06
    jr   nz, label_5885
    ld   a, $07

label_5885::
    ld   [wTileMapToLoad], a

label_5888::
    ld   hl, wMapSlideTransitionState
    ld   e, $00

label_588D::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_588D

label_5895::
    ld   a, $80
    ld   [wWindowY], a
    ld   a, $07
    ld   [rWX], a
    ld   a, $08
    ld   [$C150], a
    xor  a
    ld   [wInventoryAppearing], a

label_58A7::
    ret

label_58A8::
    ld   hl, $C09C
    ld   a, [$DB54]
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   a, [$DB54]
    swap a
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   [hl], $3E
    inc  hl
    ldh  a, [hFrameCounter]
    rla
    and  $10
    ld   [hl], a
    ret

label_58C9::
    db $6C, $6C, $6C, $6B, $6C, $6C, $6C, $6C, $76, $76, $79, $79, $79, $79, $79, $79
    db $6A, $6A, $72, $7A, $78, $78, $71, $71, $6A, $6A, $72, $70, $78, $78, $71, $71
    db $6A, $6E, $69, $69, $69, $69, $77, $71, $6E, $6E, $69, $69, $69, $69, $77, $77
    db $7B, $7B, $6D, $62, $74, $74, $6F, $68, $73, $73, $73, $74, $74, $74, $75, $68

label_5909::
    db 0, $D9, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD
    db 0, $56, $57, $58, $59, $5A, $5B, $5C, $5D, 0, 0, 0, 0, 0, 0, 0
    db 0, $7C, $67, 0, 0, $80, $65, 0, $64, $88, $7D, 0, 0, 0, 0, 0
    db 0, $5E, $5F, $7F, $7E, $7D, $82, $84, $85, $86, $87, $81, $66, $A7, $5E, $63
    db 0, $61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

label_5959::
    db 0, 0, 0, 0, 0, 0, $3E, 0, $E, 0, $39, 0, 0, 0, $17, 0
    db $18, $3D, 0, 0, 0, 0, 6, $C, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, $12, 0, 0, 0, 7, 0, 0, $14, 0, 0, 0, 0
    db $33, $3D, 0, 0, 0, 0, 5, $2A, 0, 0, 0, 0, 0, 0, 0, $29
    db 0, 3, 0, 0, 0, $25, 0, 0, 0, 0, 0, $3D, 0, 0, 0

label_59A8::
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, $D, $22, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 2, $21, $3B, $36, 0, 0, 0, 0, $3D, 0, $37, 0, $16, 0, 0
    db 0, 0, 0, 0, $26, 0, 0, 0, 0, 0, 0, 0, 9, $B, 9, 0
    db 0, 0, $35, $3C, 0, $3D, 0, 0, 0, 0, 0, 0, 0, $A, 0, 0
    db 0, $3A, $34, $3D, $28, 0

label_5A0E::
    db $13, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, $11, 0
    db 0, $38, 0

label_5A31::
    db 0, $15, 0, $3D, 0, 0, 0, 0, 0, 0, 0, $41, 0, 0, 0, 0
    db $3D, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1, 0, 0, 0, $3F, 0
    db 0, 0, 0, 0, 0, 0, 0, 0

label_5A59::
    ldh  a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   e, [hl]
    ld   hl, label_5909
    add  hl, de
    ld   a, [hl]
    jp   label_2385

label_5A6B::
    db 0, 1, $FF

label_5A6E::
    db 0, $F0, $10

label_5A71::
    ld   a, [$DBB4]
    ldh  [$FFD7], a
    ld   a, [$C1B3]
    ld   hl, $C1B2
    or   [hl]
    ld   hl, $C19F
    or   [hl]
    jp   nz, label_5B3F
    ldh  a, [$FFCB]
    ld   c, a
    ld   hl, $C182
    and  $0F
    jr   nz, label_5A92
    xor  a
    ld   [hl], a
    jr   label_5A9D

label_5A92::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, label_5A9D
    ld   [hl], $15
    jr   label_5AA0

label_5A9D::
    ldh  a, [$FFCC]
    ld   c, a

label_5AA0::
    ld   a, c
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_5A6B
    add  hl, de
    ld   a, [$DBB4]
    ld   d, a
    and  $F0
    ld   e, a
    ld   a, d
    add  a, [hl]
    and  $0F
    or   e
    ld   [$DBB4], a
    ld   a, c
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_5A6E
    add  hl, de
    ld   a, [$DBB4]
    add  a, [hl]
    ld   hl, $FFD7
    ld   [$DBB4], a
    cp   [hl]
    jr   z, label_5B3F
    ld   e, a
    ld   d, $00
    ld   hl, $D800
    add  hl, de
    ld   a, [$C5A2]
    and  a
    jr   nz, label_5AF5
    ld   a, [hl]
    and  $FF
    jr   nz, label_5AF5
    ld   a, [wFreeMovementMode]
    and  a
    jr   nz, label_5AF5
    ld   a, $09
    ldh  [$FFF2], a
    ldh  a, [$FFD7]
    ld   [$DBB4], a
    jr   label_5B3F

label_5AF5::
    call label_6BAE
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_5B30
    swap a
    and  $07
    inc  a
    ld   c, a
    cp   $01
    jr   nz, label_5B19
    ld   a, [$C5A2]
    and  a
    jr   nz, label_5B30
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    and  $20
    jr   z, label_5B30

label_5B19::
    ld   a, [$C1B1]
    and  a
    jr   nz, label_5B24
    ld   a, $10
    ld   [$C1B2], a

label_5B24::
    ld   a, c
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    jr   label_5B3F

label_5B30::
    ld   a, [$C1B1]
    and  a
    jr   z, label_5B3F
    xor  a
    ld   [$C1B1], a
    ld   a, $10
    ld   [$C1B3], a

label_5B3F::
    ld   hl, $C080
    ld   a, [$DBB4]
    rra
    and  $78
    add  a, $14
    ld   e, a
    ld   a, [$DBB4]
    swap a
    rra
    and  $78
    add  a, $14
    ld   d, a
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a
    ld   [hl], $F0
    inc  hl
    ld   [hl], $00
    inc  hl
    ld   a, e
    ldi  [hl], a
    ld   a, d
    add  a, $08
    ldi  [hl], a
    ld   [hl], $F0
    inc  hl
    ld   [hl], $20
    ldh  a, [hFrameCounter]
    and  $10
    jr   nz, label_5BAC
    ld   hl, $C088
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, d
    add  a, $F6
    ldi  [hl], a
    ld   a, $F6
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, d
    add  a, $13
    ldi  [hl], a
    ld   a, $F6
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    ld   a, e
    add  a, $F6
    ldi  [hl], a
    ld   a, d
    add  a, $04
    ldi  [hl], a
    ld   a, $F8
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, e
    add  a, $0B
    ldi  [hl], a
    ld   a, d
    add  a, $04
    ldi  [hl], a
    ld   a, $F8
    ldi  [hl], a
    ld   a, $40
    ldi  [hl], a

label_5BAC::
    ret

label_5BAD::
    db $F8, $F8, $F2, 4, $F8, 0, $F4, 4, $F8, 8, $F4, $24, $F8, $10, $F2, $24
    db 8, $F8, $F2, $44, 8, 0, $F4, $44, 8, 8, $F4, $64, 8, $10, $F2, $64
    db $FA, $FA, $F2, 4, $FA, 2, $F4, 4, $FA, 6, $F4, $24, $FA, $E, $F2, $24
    db 6, $FA, $F2, $44, 6, 2, $F4, $44, 6, 6, $F4, $64, 6, $E, $F2, $64
    db $FC, $FC, $F2, 4, $FC, 4, $F4, 4, $FC, 4, $F4, $24, $FC, $C, $F2, $24
    db 4, $FC, $F2, $44, 4, 4, $F4, $44, 4, 4, $F4, $64, 4, $C, $F2, $64
    db $FE, $FE, $F2, 4, $FE, 4, $F4, 4, $FE, 4, $F4, $24, $FE, $A, $F2, $24
    db 2, $FE, $F2, $44, 2, 4, $F4, $44, 2, 4, $F4, $64, 2, $A, $F2, $64

label_5C2D::
    db $20, 1, $22

label_5C30::
    db 1, $24, 6, $26, 6, $28, 7, $2A, 7, $2C, 5, $2E, 5, $2C

label_5C3E::
    db 5, $2E, 5

label_5C41::
    db $28, $78, $28, $78

label_5C45::
    db $28, $28, $78, $78

label_5C49::
    ld   a, [$C340]
    push af
    call label_5C55
    pop  af
    ld   [$C340], a
    ret

label_5C55::
    ld   a, [$C1B3]
    and  a
    jr   z, label_5C62
    dec  a
    ld   [$C1B3], a
    cpl
    jr   label_5C6C

label_5C62::
    ld   a, [$C1B2]
    and  a
    jr   z, label_5C72
    dec  a
    ld   [$C1B2], a

label_5C6C::
    rra
    rra
    and  $03
    jr   label_5C7B

label_5C72::
    ld   a, [$C1B1]
    and  a
    jp   z, label_5D13
    ld   a, $00

label_5C7B::
    ld   [$C1B0], a
    ldh  [$FFF1], a
    ld   a, $00
    ld   [$C3C0], a
    ld   a, $08
    ld   [$C340], a
    ld   a, $00
    ld   [$C123], a
    ldh  [$FFED], a
    ld   e, $00
    ld   a, [$C1B4]
    cp   $70
    jr   c, label_5C9C
    ld   e, $02

label_5C9C::
    and  $0F
    cp   $08
    jr   nc, label_5CA3
    inc  e

label_5CA3::
    ld   d, $00
    ld   hl, label_5C41
    add  hl, de
    ld   a, [hl]
    ldh  [$FFEE], a
    ld   hl, label_5C45
    add  hl, de
    ld   a, [hl]
    ldh  [$FFEC], a
    ld   a, [$C1B0]
    rla
    rla
    rla
    rla
    rla

label_5CBB::
    and  $E0

label_5CBD::
    ld   e, a
    ld   d, $00
    ld   hl, label_5BAD
    add  hl, de
    ld   a, $08
    ld   [$C3C0], a
    xor  a
    ldh  [$FFF5], a
    ld   c, $08
    call label_3CE6
    ld   a, [$C1B0]
    cp   $00
    jr   nz, label_5D13
    ld   a, [$C1B1]
    dec  a
    cp   $80
    jr   nc, label_5D13
    ldh  [$FFF1], a
    ld   de, $C030
    ldh  a, [$FFEC]
    ld   [de], a
    inc  de
    ldh  a, [$FFEE]
    ld   [de], a
    inc  de
    ldh  a, [$FFF1]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, label_5C2D
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ldh  a, [$FFEC]
    ld   [de], a
    inc  de
    ldh  a, [$FFEE]
    add  a, $08
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a

label_5D13::
    ret

label_5D14::
    sbc  a, b
    rlc  [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    db   $EB ; Undefined instruction
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D29::
    sbc  a, c
    dec  hl
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    ld   c, e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D3E::
    sbc  a, c
    adc  a, e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    xor  e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D53::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $14
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    push de
    ld   bc, label_5D14
    ldh  a, [$FFDB]
    and  a
    jr   z, label_5D75
    ld   bc, label_5D29
    cp   $01
    jr   z, label_5D75
    ld   bc, label_5D3E

label_5D75::
    ld   e, $15

label_5D77::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_5D77
    pop  de
    ld   hl, $D604
    add  hl, de
    ld   c, $00
    ldh  a, [$FFD9]
    and  a
    jr   z, label_5DAB
    ldh  [$FFD7], a

label_5D8B::
    ldh  a, [$FFD7]
    sub  a, $08
    ldh  [$FFD7], a
    jr   c, label_5DA2
    ld   a, $AE
    ldi  [hl], a
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_5DA0
    ld   a, l
    add  a, $03
    ld   l, a

label_5DA0::
    jr   label_5D8B

label_5DA2::
    add  a, $08
    jr   z, label_5DAB
    ld   a, $AE
    ldi  [hl], a
    jr   label_5DB3

label_5DAB::
    ldh  a, [$FFDA]
    cp   c
    jr   z, label_5DBF
    ld   a, $AE
    ldi  [hl], a

label_5DB3::
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_5DBD
    ld   a, l
    add  a, $03
    ld   l, a

label_5DBD::
    jr   label_5DAB

label_5DBF::
    ret

label_5DC0::
    xor  a
    ld   de, $DBA7
    ld   [de], a
    ld   b, $01
    ld   c, $00
    ld   hl, $DB80

label_5DCC::
    ld   a, [hli]
    and  a
    jr   z, label_5DD3
    ld   a, [de]
    or   b
    ld   [de], a

label_5DD3::
    inc  c
    ld   a, c
    cp   $05
    jr   nz, label_5DDB
    ld   b, $02

label_5DDB::
    cp   $0A
    jr   nz, label_5DE1
    ld   b, $04

label_5DE1::
    cp   $0F
    jr   nz, label_5DCC
    ret

label_5DE6::
    ld   a, [$DB5A]
    and  a
    jr   nz, label_5DFA
    ld   a, [$DB5B]
    ld   e, a
    ld   d, $00
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [$DB5A], a

label_5DFA::
    call label_2802
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   bc, $D800
    ld   de, data_380

label_5E12::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E12
    ld   bc, $DDDA
    ld   de, $0005

label_5E26::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E26
    ld   bc, $DDE0
    ld   de, $0020

label_5E3A::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E3A
    call EnableExternalRAMWriting
    ld   a, [$DC0F]
    call EnableExternalRAMWriting
    ldi  [hl], a
    call EnableExternalRAMWriting
    ld   a, [$DC0C]
    call EnableExternalRAMWriting
    ldi  [hl], a
    call EnableExternalRAMWriting
    ld   a, [$DC0D]
    call EnableExternalRAMWriting
    ldi  [hl], a
    ret
    push bc
    ld   a, [$DBA5]
    and  a
    jr   z, label_5E95
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_5E79
    ld   hl, $DDDA
    jr   label_5E8A

label_5E79::
    cp   $0A
    jr   nc, label_5E95
    ld   hl, $DB16
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    add  hl, de

label_5E8A::
    ld   de, $DBCC
    ld   c, $05

label_5E8F::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_5E8F

label_5E95::
    pop  bc
    ret

label_5E97::
    and  b
    ld   h, b
    nop
    nop
    nop

label_5E9C::
    nop
    rst  $38
    nop
    nop
    nop

label_5EA1::
    nop
    nop
    add  a, b
    add  a, b
    nop

label_5EA6::
    nop
    nop
    rst  $38
    nop
    nop
    ld   hl, $C460
    add  hl, de
    ldh  a, [$FFE4]
    ld   [hl], a
    inc  a
    ldh  [$FFE4], a
    push bc
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, label_5E97
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD7], a
    ld   hl, label_5E9C
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD8], a
    ld   hl, label_5EA1
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFD9], a
    ld   hl, label_5EA6
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFDA], a
    ld   hl, $C200
    add  hl, de
    ldh  a, [$FFD7]
    add  a, [hl]
    ld   [hl], a
    rr   c
    ld   hl, $C220
    add  hl, de
    ldh  a, [$FFD8]
    rl   c
    adc  a, [hl]
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ldh  a, [$FFD9]
    add  a, [hl]
    ld   [hl], a
    rr   c
    ld   hl, $C230
    add  hl, de
    ldh  a, [$FFDA]
    rl   c
    adc  a, [hl]
    ld   [hl], a
    pop  bc
    ret
    ld   c, $06
    ldh  a, [$FFF6]
    ld   hl, $CE81

label_5F09::
    cp   [hl]
    jr   z, label_5F2D
    inc  hl
    dec  c
    jr   nz, label_5F09
    ld   a, [$CE80]
    inc  a
    cp   $06
    jr   nz, label_5F19
    xor  a

label_5F19::
    ld   [$CE80], a
    ld   e, a
    ld   d, $00
    ld   hl, $CE81
    add  hl, de
    ld   e, [hl]
    ldh  a, [$FFF6]
    ld   [hl], a
    ld   hl, $CF00
    add  hl, de
    ld   [hl], $00

label_5F2D::
    ret

label_5F2E::
    ld   hl, $0000
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_5F3A
    ld   [hl], $00
    jr   label_5F3C

label_5F3A::
    ld   [hl], $FF

label_5F3C::
    ld   b, $28
    ld   a, $F4
    ld   hl, $C000

label_5F43::
    ldi  [hl], a
    inc  hl
    inc  hl
    inc  hl
    dec  b
    jr   nz, label_5F43
    ret

UpdateWindowPosition::
    ld   a, [wInventoryAppearing]
    and  a
    jr   z, label_5F6A
    ld   hl, $C000
    ld   a, [wWindowY]
    add  a, $08
    ld   d, a
    ld   e, $28

label_5F5C::
    ld   a, [hl]
    cp   d
    jr   c, label_5F62
    ld   [hl], $00

label_5F62::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, label_5F5C
    ret

label_5F6A::
    ld   a, [wWindowY]
    and  a
    ret  z
    ld   a, [$C19F]
    and  a
    ret  z
    ld   d, $3E
    ld   a, [$C19F]
    and  $80
    jr   z, label_5F7F
    ld   d, $58

label_5F7F::
    ld   e, $1F
    ld   hl, $C024

label_5F84::
    ld   a, [hl]
    cp   d
    ld   a, [$C19F]
    bit  7, a
    jr   nz, label_5F8E
    ccf

label_5F8E::
    jr   c, label_5FAB
    ld   a, [$C173]
    cp   $4F
    jr   nz, label_5FA9
    ld   a, [$C112]
    and  a
    jr   nz, label_5FA9
    inc  hl
    inc  hl
    db   $3A ; ldd  a, [hl]
    dec  hl
    cp   $9A
    jr   c, label_5FA9
    cp   $A0
    jr   c, label_5FAB

label_5FA9::
    ld   [hl], $00

label_5FAB::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, label_5F84
    ret

label_5FB3::
    ld   a, [$DBA5]
    and  a
    jr   z, label_5FD3
    ldh  a, [$FFF9]
    and  a
    ret  nz
    ldh  a, [$FFF7]
    cp   $16
    ret  z
    cp   $14
    ret  z
    cp   $13
    ret  z
    cp   $0A
    ret  c
    ldh  a, [$FFF6]
    cp   $FD
    ret  z
    cp   $B1
    ret  z

label_5FD3::
    ld   a, [$DB7B]
    cp   $01
    jr   nz, label_6014
    ld   e, $0F
    ld   d, $00

label_5FDE::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $D5
    jr   nz, label_5FF0
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_5FF0
    ld   [hl], d

label_5FF0::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_5FDE
    ld   a, $D5
    call label_3B86
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ldh  a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_6014::
    ld   a, [$DB79]
    cp   $01
    jr   z, label_6043
    cp   $02
    jr   nz, label_607F
    ld   a, [$DBA5]
    and  a
    jr   nz, label_607F
    ldh  a, [$FFF6]
    cp   $40
    jr   c, label_607F
    ld   a, [$DB68]
    and  $02
    jr   z, label_607F
    ld   a, [wPowerBraceletLevel]
    cp   $02
    jr   c, label_603C
    xor  a
    jr   label_603E

label_603C::
    ld   a, $01

label_603E::
    ld   [$DB79], a
    jr   label_607F

label_6043::
    ld   e, $0F
    ld   d, $00

label_6047::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $D4
    jr   nz, label_6059
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_6059
    ld   [hl], d

label_6059::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_6047
    ld   a, $D4
    call label_3B86
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, $2D
    ldh  [$FFF2], a

label_607F::
    ld   a, [$DB73]
    and  a
    jp   z, label_611F
    ld   e, $0F
    ld   d, $00

label_608A::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $C1
    jr   nz, label_609C
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_609C
    ld   [hl], d

label_609C::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_608A
    ld   a, $C1
    call label_3B86
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $D155
    call label_6118
    ldh  a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $D175
    call label_6118
    ldh  a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $D195
    call label_6118
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0C
    ldh  a, [$FFF6]
    cp   $A4
    jr   nz, label_60F7
    ldh  a, [$FFF7]
    cp   $11
    jr   nz, label_60F7
    ld   a, $08
    ldh  [$FFF2], a
    ld   [$C167], a
    ld   hl, $C300
    add  hl, de
    ld   [hl], $79

label_60F7::
    ldh  a, [$FF9E]
    ld   hl, $D1B5
    call label_6118
    ld   a, [$DB10]
    and  a
    jr   z, label_6117
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    add  a, $20
    ld   [hl], a
    ldh  a, [$FF99]
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a

label_6117::
    ret

label_6118::
    ld   c, $10

label_611A::
    ldi  [hl], a
    dec  c
    jr   nz, label_611A
    ret

label_611F::
    ldh  a, [$FFF6]
    cp   $A7
    ret  z
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_6161
    ld   e, $0F
    ld   d, $00

label_612F::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $6D
    jr   nz, label_6141
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_6141
    ld   [hl], d

label_6141::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_612F
    ld   a, $6D
    call label_3B86
    ldh  a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a

label_6161::
    ret

; Reset?
label_6162::
    call label_27F2
    xor  a
    ld   [wGameplayType], a
    ld   [wGameplaySubtype], a
    ld   [wOBJ0Palette], a
    ld   [$DB99], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ldh  [$FF97], a
    ldh  [hBaseScrollX], a
    ld   [$D6FB], a
    ld   [$D6F8], a
    ld   a, $18
    ldh  [$FFB5], a
    ret

label_618A::
    db 0, $57, $10, $57, $20, $57, $30, $57, $40, $57, $50, $57, $60, $57, $70, $57
    db $80, $57, $90, $57, 0, $58, $10, $58, $20, $58, $30, $58, $40, $58, $50, $58

label_61AA::
    ld   a, [$C109]
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96D0  ; destination
    ld   bc, $0010  ; count
    ld   a, $0F     ; bank
    call CopyDataFromBank
    ld   a, [$C109]
    swap a
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96C0 ; destination
    ld   bc, $0010 ; count
    ld   a, $0F    ; bank
    call CopyDataFromBank
    ld   a, $6C
    ld   [$9909], a

label_61E9::
    inc  a
    ld   [$990A], a
    ret
    ld   a, [$C11C]
    cp   $00
    jr   nz, label_6202
    ld   a, [wFreeMovementMode]
    and  a
    jr   nz, label_6202
    ldh  a, [$FFF7]
    add  a, $56
    call label_2385

label_6202::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_6213
    ld   a, [$C3C7]
    and  a
    jr   z, label_6213
    dec  a
    ld   [$C3C7], a

label_6213::
    ld   a, [$C3C4]
    and  a
    jr   z, label_621D
    dec  a
    ld   [$C3C4], a

label_621D::
    db $FA, $96, $DB, $C7, $3F, $62, $60, $62, $82, $62, $8E, $62, $CA, $63, $17, $64
    db $32, $64, $50, $64, $67, $64, $79, $64, $90, $64, $A2, $64, $D0, $64, $E7, $64
    db $25, $58, $CD, $D6, $44, $F0, $FE, $A7, $28, $19, $21, $10, $DC, $E, $80, $F3

label_624D::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_624D
    xor  a
    ld   [rSVBK], a
    ei

label_6260::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6281
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    call label_5888
    call label_64FF
    ld   a, $0F
    ld   [wTileMapToLoad], a

label_6281::
    ret
    ld   a, $13
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$C13F], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   a, $13
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $90
    ldh  [$FF97], a
    ld   a, $40
    ld   [$C114], a
    ld   a, $A0
    ld   [$D466], a
    ld   a, $01
    ld   [$DDD5], a
    ld   a, $E0
    ld   [$C540], a
    ld   a, $00
    ld   [$C530], a
    ld   a, $01
    ld   [$C510], a
    ld   a, $0C
    ld   [$C560], a
    ld   a, $08
    ld   [$C550], a
    ld   a, $00
    ld   [$C520], a
    ld   [$D200], a
    ld   a, $20
    ld   [$C541], a
    ld   a, $A0
    ld   [$C531], a
    ld   a, $01
    ld   [$C511], a
    ld   a, $08
    ld   [$C561], a
    ld   a, $F8
    ld   [$C551], a
    ld   a, $40
    ld   [$C521], a
    ld   a, $24
    ld   [$D201], a
    ld   a, $48
    ld   [$C542], a
    ld   a, $30
    ld   [$C532], a
    ld   a, $02
    ld   [$C512], a
    ld   a, $00
    ld   [$C562], a
    ld   a, $00
    ld   [$C552], a
    ld   a, $00
    ld   [$C522], a
    ld   a, $02
    ld   [$D202], a
    ld   a, $3C
    ld   [$C543], a
    ld   a, $40
    ld   [$C533], a
    ld   a, $02
    ld   [$C513], a
    ld   a, $00
    ld   [$C563], a
    ld   a, $00
    ld   [$C553], a
    ld   a, $00
    ld   [$C523], a
    ld   a, $00
    ld   [$D203], a
    ld   a, $40
    ld   [$C544], a
    ld   a, $50
    ld   [$C534], a
    ld   a, $02
    ld   [$C514], a
    ld   a, $00
    ld   [$C564], a
    ld   a, $00
    ld   [$C554], a
    ld   a, $00
    ld   [$C524], a
    ld   a, $00
    ld   [$D204], a
    ld   a, $3C
    ld   [$C545], a
    ld   a, $60
    ld   [$C535], a
    ld   a, $02
    ld   [$C515], a
    ld   a, $00
    ld   [$C565], a
    ld   a, $00
    ld   [$C555], a
    ld   a, $00
    ld   [$C525], a
    ld   a, $00
    ld   [$D205], a
    ld   a, $44
    ld   [$C546], a
    ld   a, $68
    ld   [$C536], a
    ld   a, $02
    ld   [$C516], a
    ld   a, $00
    ld   [$C566], a
    ld   a, $00
    ld   [$C556], a
    ld   a, $00
    ld   [$C526], a
    ld   a, $00
    ld   [$D206], a
    jp   IncrementGameplaySubtypeAndReturn

label_63AA::
    db 0, 0, 0, 0, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4

label_63BA::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

label_6C3A::
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_63E4
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_6417
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6417
    call IncrementGameplaySubtype
    jr   label_6417

label_63E4::
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_63F8
    ld   a, [$C3C5]
    inc  a
    ld   [$C3C5], a
    cp   $0C
    jr   nz, label_63F8
    call IncrementGameplaySubtype

label_63F8::
    ldh  a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$C3C5]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_63AA
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   [$DB99], a
    ld   hl, label_63BA
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a

label_6417::
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, label_642E
    ldh  a, [$FF97]
    inc  a
    ldh  [$FF97], a
    cp   $00
    jr   nz, label_642E
    ld   a, $80
    ld   [$C3C7], a
    call IncrementGameplaySubtype

label_642E::
    call label_651E
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_644A
    ld   a, [$C3C7]
    and  a
    jr   nz, label_6449
    ld   a, $D8
    call label_67DE
    call IncrementGameplaySubtype

label_6449::
    ret

label_644A::
    ld   a, $02
    ld   [$C3C4], a
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_6466
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call IncrementGameplaySubtype

label_6466::
    ret
    call label_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, label_6478
    ld   a, $D9
    call label_67DE
    jp   IncrementGameplaySubtypeAndReturn

label_6478::
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_648F
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call IncrementGameplaySubtype

label_648F::
    ret
    call label_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, label_64A1
    ld   a, $DA
    call label_67DE
    jp   IncrementGameplaySubtypeAndReturn

label_64A1::
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_64CA
    ld   a, [$C177]
    and  a
    jr   nz, label_64BA
    ld   a, $DB
    call label_67DE
    call IncrementGameplaySubtype
    ret

label_64BA::
    ld   a, $DE
    call label_67DE
    ld   a, $06
    ld   [wGameplaySubtype], a
    ld   a, $05
    ld   [$C3C7], a
    ret

label_64CA::
    ld   a, $02
    ld   [$C3C4], a
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_64E6
    ld   a, $DC
    call label_67DE
    ld   a, $30
    ld   [$C3C7], a
    call IncrementGameplaySubtype

label_64E6::
    ret
    call label_651E
    ld   a, $02
    ld   [$C3C4], a
    ld   a, [$C3C7]
    and  a
    ret  nz
    call label_27F2
    call label_68D9
    ld   a, $01
    ld   [$DB73], a

label_64FF::
    ld   e, $10
    ld   hl, $C510
    xor  a

label_6505::
    ldi  [hl], a
    dec  e
    jr   nz, label_6505
    ret

label_650A::
    db $40, 1, $40, $21

label_650E::
    db $46, 1, $48, 1

label_6512::
    db $42, 0, $44, 0

label_6516::
    db $42, 2, $44, 2

label_651A::
    db $42, 3, $44, 3

label_651E::
    call label_65AE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, label_652E
    ld   a, $0F
    ldh  [$FFF4], a
    xor  a

label_652E::
    ld   [$C114], a
    ld   a, [$D466]
    and  a
    jr   nz, label_6545
    ld   a, $21
    ldh  [$FFF2], a
    call GetRandomByte
    and  $7F
    add  a, $60
    ld   [$D466], a

label_6545::
    dec  a
    ld   [$D466], a
    ldh  a, [$FF97]
    dec  a
    cp   $C0
    ret  c
    ld   de, label_650A
    ld   a, [$C3C4]
    and  a
    jr   z, label_655F
    cp   $60
    jr   nc, label_655F
    ld   de, label_650E

label_655F::
    ld   a, $7C
    ldh  [$FFEC], a
    ld   a, $58
    ldh  [$FFEE], a
    ld   hl, $C030
    call label_658B
    ld   a, $48
    ldh  [$FFEE], a
    ld   de, label_6512
    ld   a, [$DC0F]
    and  a
    jr   z, label_6584
    ld   de, label_6516
    cp   $01
    jr   z, label_6584
    ld   de, label_651A

label_6584::
    ld   hl, $C038
    call label_658B
    ret

label_658B::
    push bc
    ldh  a, [$FF97]
    ld   c, a
    ldh  a, [$FFEC]
    sub  a, c
    ldh  [$FFE8], a
    ldi  [hl], a
    ldh  a, [$FFEE]
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ldh  a, [$FFEC]
    sub  a, c
    ldi  [hl], a
    ldh  a, [$FFEE]
    add  a, $08
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ld   [hl], a
    pop  bc
    ret

label_65AE::
    ld   c, $08
    ld   b, $00

label_65B2::
    ld   hl, $C510
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_65D6
    push af
    ld   hl, $C530
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEE], a
    ld   hl, $C540
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEC], a
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_65D2
    dec  [hl]

label_65D2::
    pop  af
    call label_65DD

label_65D6::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_65B2
    ret

label_65DD::
    db $3D, $C7, $73, $66, $FD, $66

label_65E3::
    db $EF, $65, $F3, $65, $F7, $65, $FB, $65, $FF, $65, 3, $66, $50, 0, $50, $20
    db $52, 0, $52, $20, $54, 0, $54, $20, $56, 0, $56, $20, $58, 0, $58, $20
    db $5A, 0, $5A, $20

label_6607::
    db 3, 3, 3, 3

label_660B::
    db 3, 3, 3, 3, 3, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1
    db 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5
    db 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3
    db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3

label_6646::
    db 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0
    db 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4
    db 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5

label_6673::
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   hl, $D210
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $06
    jr   c, label_668B
    ld   [hl], b
    ld   hl, $D200
    add  hl, bc
    inc  [hl]

label_668B::
    ld   hl, $D200
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_6607
    add  hl, de
    ld   e, [hl]
    sla  e
    ld   d, b
    ld   hl, label_65E3
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call label_658B
    call label_67A8
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_66C4
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    cp   $FB
    jr   z, label_66C4
    dec  [hl]

label_66C4::
    ldh  a, [$FFE8]
    cp   $F0
    jr   c, label_66D7
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   hl, $C510
    add  hl, bc
    ld   [hl], b

label_66D7::
    ret

label_66D8::
    db $E0, $66, $E4, $66, $E8, $66, $EC, $66, $4C, 0, $4C, $20, $4E, 0, $4E, $20
    db $5C, 0, $5C, $20, $5E, 0, $5E, $20

label_66F0::
    db 1, $FF

label_66F2::
    db 1, $FF, $FE, 2

label_66F6::
    db 1, $FF, $4C, $52, $58, $5C, $60

label_66FD::
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    ld   e, $03
    and  $80
    jr   z, label_6718
    ld   hl, $D200
    add  hl, bc
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_6717
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_6717::
    ld   e, [hl]

label_6718::
    sla  e
    ld   d, b
    ld   hl, label_66D8
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call label_658B

label_6733::
    call label_67A8
    ld   a, c
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    ldh  a, [hFrameCounter]
    add  a, e
    ldh  [$FFE9], a

label_6745::
    and  $3F
    jr   nz, label_675A
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C550
    add  hl, bc
    ld   [hl], a

label_675A::
    ldh  a, [$FFE9]
    add  a, $40
    and  $3F
    jr   nz, label_6773
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C560
    add  hl, bc
    ld   [hl], a

label_6773::
    ld   hl, $C590
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $13
    jr   c, label_67A7
    ld   [hl], b
    ld   hl, label_66F6
    add  hl, bc
    ld   d, [hl]
    ld   hl, $C530
    add  hl, bc
    ld   a, [hl]
    sub  a, d
    ld   e, $01
    and  $80
    jr   nz, label_6792
    ld   e, $FF

label_6792::
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    ld   hl, $C540
    add  hl, bc
    ld   a, [hl]
    sub  a, $48
    ld   e, $01
    and  $80
    jr   nz, label_67A4
    ld   e, $FF

label_67A4::
    ld   a, [hl]
    add  a, e
    ld   [hl], a

label_67A7::
    ret

label_67A8::
    call label_67B5
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_67B5
    pop  bc
    ret

label_67B5::
    ld   hl, $C550
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C570
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C530
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_67D4
    ld   e, $F0

label_67D4::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

label_67DE::
    ld   e, a
    ldh  a, [$FF99]
    push af
    ld   a, $60
    ldh  [$FF99], a
    ld   a, e
    call label_2373
    pop  af
    ldh  [$FF99], a
    ret

label_67EE::
    db $FA, $96, $DB, $C7, 8, $68, $29, $68, $56, $68, $73, $68, $AA, $68, $C0, $68
    db $25, $58, $E4, $68, 8, $69, $45, $69, $22, $58, $CD, $D6, $44

label_680B::
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6829
    ld   hl, $DC10
    ld   c, $80
    di

label_6816::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_6816
    xor  a
    ld   [rSVBK], a
    ei

label_6829::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6855
    call label_5888
    ldh  a, [$FFF7]
    cp   $06
    jr   z, label_6849
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a

label_6849::
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    ld   a, $0F
    ld   [wTileMapToLoad], a

label_6855::
    ret
    ld   e, $21
    ldh  a, [$FFF7]
    cp   $06
    jr   z, label_6868
    ldh  a, [$FFF6]
    cp   $DD
    ld   e, $12
    jr   nz, label_6868
    ld   e, $20

label_6868::
    ld   a, e
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$C13F], a
    jp   IncrementGameplaySubtypeAndReturn
    ld   e, $24
    ldh  a, [$FFF7]
    cp   $06
    jr   z, label_6885
    ldh  a, [$FFF6]
    cp   $DD
    ld   e, $12
    jr   nz, label_6885
    ld   e, $23

label_6885::
    ld   a, e
    ld   [wBGMapToLoad], a
    ld   a, $FF
    ld   [wWindowY], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   e, $08
    ld   hl, $D210

label_689E::
    ldi  [hl], a
    dec  e
    jr   nz, label_689E
    ld   a, $01
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn
    call label_6A7C
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_68BF
    call IncrementGameplaySubtype
    ld   a, $80
    ld   [$D210], a

label_68BF::
    ret
    ldh  a, [$FFF7]
    cp   $06
    jr   nz, label_68CF
    call label_6A7C
    ld   a, $07
    ld   [wGameplaySubtype], a
    ret

label_68CF::
    ldh  a, [$FFCC]
    and  $B0
    jr   z, label_68E3
    ld   a, $13
    ldh  [$FFF2], a

label_68D9::
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a

label_68E3::
    ret
    call label_6A7C
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, label_68FB
    ld   [wScreenShakeVertical], a
    ld   a, $20
    ld   [$D210], a
    jp   IncrementGameplaySubtypeAndReturn

label_68FB::
    ld   e, $00
    and  $04
    jr   z, label_6903
    ld   e, $FE

label_6903::
    ld   a, e
    ld   [wScreenShakeVertical], a
    ret
    call label_6A7C
    call label_695B
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, label_6944
    call label_C4B
    ld   a, $30
    ld   [$D210], a
    ld   a, $30
    ld   [$D214], a
    ld   a, $18
    ld   [$D215], a
    ld   a, [$D211]
    add  a, $08
    ld   [$D211], a
    ld   a, [$D213]
    inc  a
    ld   [$D213], a
    cp   $04
    jr   nz, label_6944
    ld   a, $80
    ld   [$D210], a
    call IncrementGameplaySubtype

label_6944::
    ret
    call label_6A7C
    call label_695B
    ld   hl, $D210
    dec  [hl]
    ret  nz
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ret

label_695B::
    xor  a
    ld   [wScreenShakeVertical], a
    ld   a, [$D215]
    and  a
    jr   z, label_6975
    dec  a
    ld   [$D215], a
    ld   e, $FE
    and  $04
    jr   z, label_6971
    ld   e, $00

label_6971::
    ld   a, e
    ld   [wScreenShakeVertical], a

label_6975::
    ret

label_6976::
    db $14, $14, $10, $10, $0c, $0c

label_697C::
    db $17, $17, $13

label_697F::
    db $13, $0f, $0f

label_6982::
    db 0, 0, $CC, $10, 0, 8, $CE, $10, 0, $10, $DC, $10, 0, $18, $CC, $30
    db $10, 0, $DE, $10, $10, 8, $E0, $10, $10, $10, $E2, $10, $10, $18, $DE, $30
    db $20

label_69A3::
    db 0, $E4, $10, $20, 8, $E6, $10, $20, $10, $E8, $10, $20

label_69AF::
    db $18, $E4, $30, $30, 0, $DE, $10, $30, 8, $E0, $10, $30, $10

label_69BC::
    db $E0, $30, $30, $18

label_69C0::
    db $DE, $30, $40

label_69C3::
    db 0, $DE, $10, $40, 8, $E0, $10, $40, $10, $E0, $30, $40, $18, $DE, $30

label_69D2::
    db 0

label_69D3::
    db $10, $DC, $16, $10, $10, $E2, $16, $20, $10, $E8, $16, 0, 0, $CC, $15, 0

label_69E3::
    db 8, $CE, $15, 0, $10, $CE, $35, 0, $18, $CC, $35, $10, 0, $DE, $15, $10
    db 8, $E0, $15, $10, $10, $E0, $35, $10, $18, $DE, $35, $20, 0

label_6A00::
    db $E4, $15, $20, 8, $E6, $15, $20, $10, $E6, $35, $20, $18

label_6A0C::
    db $E4, $35, $30, 0

label_6A10::
    db $DE, $15, $30, 8, $E0, $15, $30, $10

label_6A18::
    db $E0, $35, $30, $18

label_6A1C::
    db $DE, $35, $40, 0, $DE, $15, $40, 8, $E0, $15, $40, $10, $E0, $35, $40, $18
    db $DE

label_6A2D::
    db $35, $48, 8, $F0, 7, $48

label_6A33::
    db $10, $F2, 7, $48, $18, $F4, 7, $48, $20, $F4, $27, $48, $28, $F2, $27, $48
    db $30, $F0, $27, $48, 8, $F6, 7, $48

label_6A4B::
    db $10, $F8, 7, $48

label_6A4F::
    db $18, $FA

label_6A51::
    db $07, $48

label_6A53::
    db $20, $FA, $27, $48

label_6A57::
    db $28, $F8, $27, $48

label_6A5B::
    db $30, $F6, $27, $48, 8, $FC, 7, $48, $10, $FE, 7, $48, $18, $EE, 7, $48
    db $20, $EE, $27, $48

label_6A6F::
    db $28, $FE

label_6A71::
    daa
    ld   c, b
    jr   nc, label_6A71
    daa

label_6A76::
    ld   l, $6A
    ld   b, [hl]
    ld   l, d
    ld   e, [hl]
    ld   l, d

label_6A7C::
    ldh  a, [$FFF7]
    cp   $06
    ret  nz
    xor  a
    ldh  [$FFF1], a
    ldh  [$FFED], a
    ldh  [$FFF5], a
    ld   a, $38
    ldh  [$FFEE], a
    ld   a, [wScreenShakeVertical]
    ld   e, a
    ld   a, $20
    sub  a, e
    ldh  [$FFEC], a
    ld   a, [$D214]
    and  a
    jr   z, label_6AC2
    dec  a
    ld   [$D214], a
    ldh  a, [hFrameCounter]
    and  $07
    ld   a, [$D212]
    jr   nz, label_6AAE
    inc  a
    cp   $03
    jr   nz, label_6AAE
    xor  a

label_6AAE::
    ld   [$D212], a
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_6A76
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   c, $06
    call label_3CE0

label_6AC2::
    ld   a, $48
    ldh  [$FFEE], a
    ld   a, [wScreenShakeVertical]
    ld   e, a
    ld   a, [$D211]
    add  a, $20
    sub  a, e
    ldh  [$FFEC], a
    ld   a, [$D213]
    ld   e, a
    ld   d, $00
    ld   hl, label_6976
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6AE3
    ld   hl, label_697C

label_6AE3::
    add  hl, de
    ld   c, [hl]
    xor  a
    ld   [$C3C0], a
    ld   hl, label_6982
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6AF4
    ld   hl, label_69D2

label_6AF4::
    call label_3CE6
    ret

label_6AF8::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw label_6B0A
._1 dw label_6B2B
._2 dw label_6B52
._3 dw label_6B6F
._4 dw label_6B81
._5 dw label_6B9A
._6 dw FileSaveFadeOut

label_6B0A::
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6B2B
    ld   hl, $DC10
    ld   c, $80
    di

label_6B18::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $03
    ld   [rSVBK], a
    ld   [hl], b
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_6B18
    xor  a
    ld   [rSVBK], a
    ei

label_6B2B::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B51
    call label_5888
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    ld   a, $14
    ld   [wTileMapToLoad], a

label_6B51::
    ret

label_6B52::
    ld   a, $15
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

label_6B6F::
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B80
    call IncrementGameplaySubtype
    xor  a
    ld   [$C3C4], a

label_6B80::
    ret

label_6B81::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C3C4]
    inc  a
    ld   [$C3C4], a
    jp   z, IncrementGameplaySubtype
    cp   $80
    jr   nz, label_6B99
    ld   a, $E7
    call label_2385

label_6B99::
    ret

label_6B9A::
    ldh  a, [$FFCC]
    and  $B0
    jr   z, label_6BA7
    ld   a, $13
    ldh  [$FFF2], a
    call label_68D9

label_6BA7::
    ret

label_6BA8::
    ldh  a, [$FFCC]
    and  $0C
    jr   z, label_6BB4

label_6BAE::
    push af
    ld   a, $0A
    ldh  [$FFF2], a
    pop  af

label_6BB4::
    ret
    ldh  a, [$FF92]
    cp   $08
    jp  c, label_6C77
    jr   nz, label_6BC6
    call label_6BF0
    ld   hl, $FF92
    inc  [hl]
    ret

label_6BC6::
    call label_6BEA
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [$FF92], a
    ret

label_6BCF::
    db $F, $51, $B1, $EF, $EC, $AA, $4A, $C

label_6BD7::
    db $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8

label_6BDF::
    db $D0, $D2, $D4, $D6, $D8, $DA, $DC, $DE

label_6BE7::
    db 1, $1F, 1

label_6BEA::
    db $E, 8, $1E, 4, $18, 4

label_6BF0::
    db $E, 4, $1E, 0

label_6BF4::
    ld   a, c
    ldh  [$FFE0], a
    ld   d, $00

label_6BF9::
    xor  a
    ldh  [$FFD7], a
    ldh  [$FFD8], a
    ldh  [$FFD9], a
    ldh  [$FFDA], a
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    bit  1, a
    jp   nz, label_6C2A
    ld   c, $00
    ld   b, c
    ld   hl, label_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   a, $7C
    ldh  [$FFD7], a
    ldh  [$FFD8], a
    ldh  [$FFD9], a
    ld   hl, label_6BD7
    add  hl, de
    ld   a, [hl]
    ldh  [$FFDA], a
    pop  hl
    jr   label_6C48

label_6C2A::
    ld   c, $00
    ld   b, c
    ld   hl, label_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   hl, label_6BDF
    add  hl, de
    ld   a, [hl]
    ldh  [$FFD7], a
    inc  a
    ldh  [$FFD8], a
    add  a, $0F
    ldh  [$FFD9], a
    inc  a
    ldh  [$FFDA], a
    pop  hl

label_6C48::
    ldh  a, [$FFD7]
    ld   [hl], a
    call label_6C69
    ldh  a, [$FFD8]
    ld   [hl], a
    inc  c
    call label_6C69
    ldh  a, [$FFD9]
    ld   [hl], a
    inc  c
    call label_6C69
    ldh  a, [$FFDA]
    ld   [hl], a
    inc  e
    ld   a, e
    ld   hl, $FFE0
    cp   [hl]
    jp   nz, label_6BF9
    ret

label_6C69::
    push hl
    ld   hl, label_6BE7
    add  hl, bc
    ld   a, [hl]
    pop  hl
    add  a, l
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ret

label_6C77::
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
    ld   hl, label_4D00
    add  hl, bc
    call label_C3A
    ldh  a, [$FF92]
    inc  a
    ldh  [$FF92], a
    ret

label_6CA5::
    db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B, $10, $1B, $20, $2B
    db $30, $3B, $40, $4B, $50, $5B, $60, $6B, $70, $7B, $80, $8B, $90, $91, $92, $93
    db $94, $95, $96, $97, $98, $99, $9A, $9B, $FF, 1, $A5, $6C

label_6CD1::
    ld   a, [bc]
    cp   $FF
    jr   z, label_6CE2
    ld   e, a
    ld   d, $00
    ld   hl, $D700
    add  hl, de
    ld   [hl], $FF
    inc  bc

label_6CE0::
    jr   label_6CD1

label_6CE2::
    ret
    ld   bc, label_400
    ld   hl, $9800

label_6CE9::
    ld   e, $00
    ld   a, l
    and  $20
    jr   z, label_6CF1
    inc  e

label_6CF1::
    ld   d, $AE
    ld   a, l
    and  $01
    xor  e
    jr   z, label_6CFA
    inc  d

label_6CFA::
    ld   a, l
    and  $1F
    cp   $14
    jr   nc, label_6D02
    ld   [hl], d

label_6D02::
    inc  hl
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_6CE9
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6D10
    call label_6D11

label_6D10::
    ret

label_6D11::
    ld   d, $05
    ld   a, [wGameplayType]
    cp   GAMEPLAY_OVERWORLD
    jr   z, label_6D1C
    ld   d, $06

label_6D1C::
    ld   a, $01
    ld   [rVBK], a
    ld   hl, $9800
    ld   bc, label_400

label_6D26::
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_6D26
    ld   a, $00
    ld   [rVBK], a
    ret

include "src/code/oam_dma.asm"

label_6D4A::
    db $80, $80, $40, $40, $20, $20, $10, $10, 8, 8, 4, 4, 2, 2, 1, 1
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db $80, $80, $40, $40, $20, $20

label_6D70::
    db $10, $10, 8, 8, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $80, $80, $40, $40, $20, $20

label_6D90::
    db $10, $10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $80, $80, $40, $40, $20, $20

label_6DB0::
    db $10, $10, 8, 8, 4, 4, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

label_6DCA::
    db $E, $9E, $D, $9E, $C, $9E

label_6DD0::
    db $E, $9E, $12, $9E, $E, $9E, $C, $9E, $E, $9E, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, $D, $9E

label_6DEA::
    ld   a, [ROM_DebugTool2]
    and  a
    ret  nz
    ld   a, [$DBA5]
    and  a
    jr   z, label_6E18
    ldh  a, [$FFF7]
    cp   $FF
    jr   nz, label_6DFF
    ld   a, $0F
    jr   label_6E03

label_6DFF::
    cp   $08
    jr   nc, label_6E18

label_6E03::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_6DCA
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   [hl], $A3
    ldh  a, [$FFF9]
    and  a
    jr   z, label_6E18
    ld   [hl], $7F

label_6E18::
    ret

IntroSeaPaletteTable::
    db $C6, $C2, $C0, $C2

IntroHandlerEntryPoint::
    ldh  a, [hButtonsInactiveDelay]
    and  a  ; if ButtonsInactiveDelay == 0
    jr   z, IntroCheckJoypad
    ; ButtonsInactiveDelay != 0
    dec  a
    ldh  [hButtonsInactiveDelay], a
    jp   RenderIntroFrame

IntroCheckJoypad::
    ldh  a, [$FFCC]  ; unknow joypad-related value
    and  $80  ; If not pressing Start
    jp   z, RenderIntroFrame
    ; Start button pressed
    call label_27F2
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_TITLE  ; if on Title Screen
    jr   z, .transitionToFileMenu
    ; Transition to Title screen
    ld   a, 40  ; Ignore joypad for the next 40 frames
    ldh  [hButtonsInactiveDelay], a
    ld   a, $11
    ld   [wBGMapToLoad], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .isGBC
    ; Not GBC
    ld   a, [label_789B]
    ld   [wOBJ0Palette], a
    ld   a, [label_789F]
    ld   [$DB99], a
    ld   a, $04
    jr   .transitionToTitleScreen

.isGBC
    ld   a, $01
    call label_8FA
    xor  a
    ld   [$DDD5], a
    ld   a, $08

.transitionToTitleScreen
    ld   [$D013], a
    ld   a, $0D
    ld   [wGameplaySubtype], a
    xor  a
    ld   [wEntitiesTypeTable], a
    ld   [$C281], a
    ld   [$C282], a
    ld   [$C283], a
    ld   [$C284], a
    ld   [rBGP], a
    ld   [wBGPalette], a
    ld   a, $10
    ld   [$C17E], a
    call ResetIntroTimers
    ld   a, $0D
    ld   [$D368], a
    ld   [$D00F], a
    call label_7D4E
    jr   .enableVBlankInterruptAndReturn

.transitionToFileMenu
    jp   TransitionToFileMenu
    ; Jump to End Sequence (dead code, never reached)
    xor  a
    ld   [wGameplaySubtype], a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [rBGP], a
    ld   [wBGPalette], a
    ld   hl, wGameplayType
    inc  [hl]

.enableVBlankInterruptAndReturn
    ld   a, $01
    ld   [rIE], a ; Enable VBlank interrupt only
    ld   a, $4F
    ld   [rLYC], a
    ret

RenderIntroFrame::
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_SEA
    jr   c, IntroSceneJumpTable
    cp   $05
    jr   nc, IntroSceneJumpTable
    ; Check $D000 counter value
    ld   a, [$D000]
    and  a
    jr   z, label_6EC6
    dec  a
    ld   [$D000], a

label_6EC6::
    rra
    nop
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, IntroSeaPaletteTable
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    call label_8F0 ; Load BG palette

IntroSceneJumpTable::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw label_6EF8
._1 dw label_6F2A
._2 dw label_6F36
._3 dw IntroShipOnSeaHandler
._4 dw IntroLinkFaceHandler
._5 dw label_711A ; transition?
._6 dw label_7158 ; transition?
._7 dw IntroBeachHandler
._8 dw label_7272 ; title screen animation?
._9 dw label_7355 ; title screen animation?
._A dw $7376 ; title screen animation?
._B dw TitleScreenHandler
._C dw $743A
._D dw $7448

label_6EF8::
    call ClearLowerAndMiddleWRAM
    call label_27F2
    ld   a, $01
    call label_8FA
    ld   a, $1A
    call label_27C3
    ld   a, $02
    ld   [wTileMapToLoad], a
    xor  a
    ldh  [hFrameCounter], a
    ld   a, $A2
    ld   [$C13D], a
    ld   a, [$FF40]
    and  $DF
    ld   [wLCDControl], a
    ld   [rLCDC], a
    ld   a, $B4
    ld   [$D016], a
    xor  a
    ld   [$D017], a
    jp   IncrementGameplaySubtypeAndReturn

label_6F2A::
    ld   a, $10
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn

label_6F36::
    call label_7D01
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_6F42
    ld   a, $25
    jr   label_6F44

label_6F42::
    ld   a, $0E

label_6F44::
    ld   [wBGMapToLoad], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E0
    ld   [$DB99], a
    ld   a, $03
    ld   [rIE], a
    ld   a, $00
    ld   [rLYC], a
    ld   e, $11
    ld   hl, $D000
    xor  a

label_6F5F::
    ldi  [hl], a
    dec  e
    jr   nz, label_6F5F
    ld   [wEntitiesTypeTable], a
    ld   [$C281], a
    ld   [$C3B0], a
    ld   [$C3B1], a
    ld   [$C3B2], a
    ldh  [$FFED], a
    ld   a, $05
    ld   [$C282], a
    ld   a, $C0
    ld   [$C202], a
    ld   a, $4E
    ld   [$C212], a
    xor  a
    ld   [$C340], a
    ld   [$C341], a
    ld   [$C342], a
    ld   [$C343], a
    jp   IncrementGameplaySubtypeAndReturn

label_6F93::
    add  a, c
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6F9C::
    ld   [label_808], sp
    inc  b
    nop
    nop
    nop
    nop
    nop

IntroShipOnSeaHandler::
    call RenderRain
    call RenderIntroEntities
    ld   a, [wIntroSubTimer]
    and  a
    jr   z, label_7014
    inc  a
    ld   [wIntroSubTimer], a ; Increment subtimer
    cp   $18
    jr   c, label_7013
    sub  a, $18
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_6F93
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, label_6F9C
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    call label_8D7
    ld   a, e
    cp   $08
    jp   nz, label_7013
    xor  a
    ld   [wEntitiesTypeTable], a
    ld   [$C281], a
    ld   [$C282], a
    ld   [$C290], a
    ld   a, $05
    ld   [wGameplaySubtype], a
    ld   [$D00F], a
    call label_7D4E
    ld   a, $11
    ld   [wTileMapToLoad], a
    ld   a, $FF
    ld   [wIntroTimer], a
    xor  a
    ldh  [hBaseScrollX], a
    ld   [wScrollXOffsetForSection], a
    ld   [$C102], a
    ld   [$C103], a
    ld   a, $92
    ld   [$C101], a
    ld   a, $03
    ld   [rIE], a

label_7013::
    ret

label_7014::
    ld   a, [wIntroShipPosX]
    cp   $50
    jr   nz, label_7031
    ; If IntroShipPosX == $50
    ; Transition to next sequence
    ld   a, $FF
    ld   [rBGP], a
    ld   a, GAMEPLAY_INTRO_LINK_FACE
    ld   [wGameplaySubtype], a
    ld   a, $0F
    ld   [wBGMapToLoad], a
    ld   a, $01
    ld   [rIE], a
    xor  a
    ldh  [hBaseScrollX], a
    ret

label_7031::
    call label_7D01
    ldh  a, [hFrameCounter]
    and  $07
    jp   nz, label_70B1
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   hl, $C200
    dec  [hl]
    inc  hl
    dec  [hl]
    inc  hl
    dec  [hl]
    ld   c, $00
    ldh  a, [hBaseScrollX]
    cp   $10
    jr   z, label_7068
    inc  c
    cp   $30
    jr   z, label_7068
    inc  c
    cp   $38
    jr   z, label_7068
    inc  c
    cp   $58
    jr   z, label_7068
    inc  c
    cp   $5A
    jr   z, label_7068
    inc  c
    cp   $69
    jr   nz, label_70B1

label_7068::
    ld   e, $01
    ld   d, $00

label_706C::
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_7087
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_706C
    ret

label_707B::
    db $28, $78, $60, $38, $68
    db $58 ; X

label_7081::
    db 4, 2, 1, 4, 3, 1

label_7087::
    ld   b, 0
    ld   hl, label_7081
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   [hl], a
    ld   hl, label_707B
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

label_70A9::
    ld   a, $1C
    ld   [$D000], a
    call label_C4B

label_70B1::
    ret

IntroLinkFaceHandler::
    call RenderRain
    ld   a, [wIntroTimer]
    inc  a
    ld   [wIntroTimer], a
    cp   128
    jr   nz, .continue
    ; If IntroTimer == 128 frames
    push af
    call IntroLinkScream
    pop  af

.continue
    cp   144
    jr   nz, .continue2
    ; If IntroTimer == 144 frames
    ; Lightning over Link's face
    call label_70A9

.continue2
    cp   160
    jr   nz, .continue4
    ; If FrameCounter == 160 frames
    ; Move back to sea sequence
    ld   a, GAMEPLAY_INTRO_SEA
    ld   [wGameplaySubtype], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC
    ld   a, $25
    jr   .continue3

.notGBC
    ld   a, $0E

.continue3
    ld   [wBGMapToLoad], a
    call label_7108
    ld   a, $03
    ld   [rIE], a ; Enable interrupts on VBlank and LCDStat
    xor  a
    ld   [wEntitiesTypeTable], a
    ld   [$C281], a
    ld   a, $01
    ld   [wIntroSubTimer], a
    ret

.continue4
    ldh  a, [hFrameCounter]
    and  $7F
    jr   nz, .return
    ; FrameCounter == $7F
    call GetRandomByte
    and  $00
    jr   nz, .return ; always false
    call label_70A9

.return
    ret

label_7108::
    ld   hl, $DE01
    ld   a, $00
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    ld   a, $3A
    ldi  [hl], a
    ld   a, $01
    ld   [hl], a
    jp   label_BD7

label_711A::
    ld   a, $10
    ld   [wBGMapToLoad], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype
    ret

label_7128::
    db 0, 0, 0, 0, $40, $40, $40, $80, $85, $85, $85, $C5, $C9, $C9, $C9, $C9

label_7138::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

label_7148::
    db 0, 0, 0, 0, $40, $40, $40, $40, $90, $90, $90, $90

label_7154::
    ldh  [$FFE0], a
    ldh  [$FFE0], a

label_7158::
    call label_71C7
    ld   a, [$D001]
    cp   $A0
    jr   nz, label_7168
    push af
    ld   a, $02
    ld   [rLYC], a
    pop  af

label_7168::
    dec  a
    ld   [$D001], a
    jr   nz, label_7188
    ld   a, $07
    ld   [wGameplaySubtype], a
    ld   a, $06
    ld   [wEntitiesTypeTable], a
    ld   a, $B0
    ld   [$C200], a
    ld   a, $68
    ld   [$C210], a
    ld   a, $01
    ld   [$C3D0], a
    ret

label_7188::
    cp   $34
    jr   nc, label_71C2
    and  $03
    jr   nz, label_719B
    ld   a, [$D010]
    cp   $0C
    jr   z, label_719B
    inc  a
    ld   [$D010], a

label_719B::
    ldh  a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$D010]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_7128
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, label_7138
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, label_7148
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    call label_8E6

label_71C2::
    ret

IntroBeachHandler::
    call RenderIntroEntities
    ret

label_71C7::
    ld   a, [$C291]
    cp   $02
    jr   nc, label_71DE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, label_71DB
    ld   a, $0F
    ldh  [$FFF4], a
    xor  a

label_71DB::
    ld   [$C114], a

label_71DE::
    ret

label_71DF::
    db $9A, $16, $F, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C
    db $8D, $8E, $8F, $9A, $36, $F, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99
    db $9A, $9B, $9C, $9D, $9E, $9F, $9A, $56, $F, $A0, $A1, $A2, $A3, $A4, $A5, $A6
    db $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $9A, $76, $F, $B0, $B1, $B2, $B3
    db $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $9A, $96, $F, $C0
    db $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, $9A
    db $B6, $F, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD
    db $DE, $DF, $9A, $D6, $F, $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA
    db $EB, $EC, $ED, $EE, $EF

label_7264::
    db $18, $72

label_7266::
    db 5, $72, $2B, $72, $F2, $71, $3E, $72, $DF, $71, $51

label_7271::
    ld   [hl], d

label_7272::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_7264
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $D601
    ld   c, $13

label_7286::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_7286
    ld   [hl], $00
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_7296
    call label_7338

label_7296::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $07
    jr   nz, label_72A4
    call IncrementGameplaySubtype

label_72A4::
    ret
    sbc  a, d
    ld   d, $0F
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
    sbc  a, d
    ld   [hl], $0F
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
    sbc  a, d
    ld   d, [hl]
    rrca
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

label_72D8::
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    db $76, $0f
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
    sbc  a, d
    sub  a, [hl]
    rrca
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
    sbc  a, d
    or   [hl]
    rrca
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
    sbc  a, d
    sub  a, $0F
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

label_732A::
    sbc  a, $72
    bit  6, d
    pop  af
    ld   [hl], d
    cp   b
    ld   [hl], d
    inc  b
    ld   [hl], e
    and  l
    ld   [hl], d
    rla
    ld   [hl], e

label_7338::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_732A
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $DC91
    ld   c, $13

label_734C::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_734C
    ld   [hl], $00
    ret

label_7355::
    ld   a, [$C17E]
    cp   $10
    jr   c, label_7363
    ld   a, $19
    ldh  [$FFF4], a
    call IncrementGameplaySubtype

label_7363::
    ret

label_7364::
    sbc  a, e
    or   a
    dec  c
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    nop
    ld   de, label_7364
    ld   hl, $D601
    ld   c, $12

label_737E::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_737E
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_738E
    call label_79AE
    jr   label_7395

label_738E::
    xor  a
    call label_79C2
    call label_73B1

label_7395::
    ld   a, $3C
    ld   [$D015], a
    call IncrementGameplaySubtype

ResetIntroTimers::
    ld   a, $A0
    ld   [wIntroTimer], a
    xor  a
    ld   [wIntroSubTimer], a
    ld   a, $FF
    ld   [$D003], a
    ret

label_73AC::
    sbc  a, e
    or   a
    ld   c, l
    rlca
    nop

label_73B1::
    ld   de, label_73AC
    ld   hl, $DC91
    ld   c, $12

label_73B9::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_73B9
    ret

label_73C0::
    db $18, $18, $38, $40, $58, $60, $80, $88

label_73C8::
    db $20, $48, $44, $28, $44, $28, $28, $40

TitleScreenHandler::
    call RenderIntroEntities
    call label_7920
    ldh  a, [hFrameCounter]
    and  $3F
    jr   nz, label_7418
    ld   e, $01
    ld   d, $00

label_73E0::
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_73F0
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_73E0
    jr   label_7418

label_73F0::
    ld   [hl], $08
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $3F
    ld   a, [$D003]
    inc  a
    ld   [$D003], a
    and  $07
    ld   c, a
    ld   b, $00

label_7404::
    ld   hl, label_73C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_73C8

label_7411::
    add  hl, bc

label_7412::
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_7418::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    and  $0F
    jr   nz, label_7439
    ld   a, [$D001]
    dec  a
    ld   [$D001], a
    jr   nz, label_7439
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    call label_27EA

label_7439::
    ret
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_7447
    jp   label_6162

label_7447::
    ret
    ld   a, $11
    ld   [wTileMapToLoad], a
    ld   a, $0B
    ld   [wGameplaySubtype], a
    ld   a, $C9
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    dec  a
    ld   [$D018], a
    ret

RenderRain::
    call GetRandomByte
    and  $18
    add  a, $10
    ldh  [$FFD8], a
    call GetRandomByte
    and  $18
    add  a, $10
    ldh  [$FFD7], a
    ld   hl, $C04C
    ; On the sea, limit the rain to the top section of the screen ($10)
    ld   c, $10
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_LINK_FACE ; if GameplaySubtype != LINK_FACE
    jr   nz, .loop
    ; On Link's face, the rain covers all the $15 rows of the screen
    ld   c, $15

.loop
    ldh  a, [$FFD8]
    ldi  [hl], a
    ldh  a, [$FFD7]
    ldi  [hl], a
    call GetRandomByte
    and  $01       ; if random(0,1) == 0
    ld   a, $28
    jr   z, .next  ;   jump to next
    call GetRandomByte
    and  $06
    add  a, $70

.next
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ldh  a, [$FFD7]
    add  a, $1C
    ldh  [$FFD7], a
    cp   $A0
    jr   c, .continue
    sub  a, $98
    ldh  [$FFD7], a
    ldh  a, [$FFD8]
    add  a, $25
    ldh  [$FFD8], a

.continue
    dec  c
    jr   nz, .loop
    ret

label_74B8::
    db $99, $2B, $83, $1E, $20, $22, $24, $99, $2C, $83, $1F, $21, $23, $25, 0

IntroLinkScream::
    ld   de, $D601
    ld   hl, label_74B8
    ld   c, $0F

label_74CF::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_74CF
    ret

RenderIntroEntities::
    xor  a
    ld   [$C3C0], a
    ld   c, $02  ; Entities count
    ld   b, $00
.loop
    ld   a, c
    ld   [$C123], a
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .continue ; If no entity at this table index, continue
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEE], a ; EntityOffsetX?
    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFEC], a ; EntityOffsetY?
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFF1], a
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    ldh  [$FFF0], a
    call RenderIntroEntity
.continue
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, .loop
    ret

; Inputs:
;   bc: index of entity in entities table
RenderIntroEntity::
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    cp   ENTITY_INTRO_SHIP
    jr   z, RenderIntroShip
    cp   ENTITY_INTRO_MARIN
    jp   z, RenderIntroMarin
    cp   ENTITY_INTRO_INERT_LINK
    jp   z, RenderIntroInertLink
    cp   ENTITY_INTRO_SPARKLE
    jp   z, RenderIntroSparkle
    call IsEntityFrameCounterZero
    jr   nz, label_7533
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   [hl], b
    ret

label_7533::
    dec  [hl]
    call label_762B
    ret

data_7538::
    db 0, 0

label_753A::
    db $1C, 2, 0, 8, $1E, 2, $10, $F8, $20, 2, $10, 0

label_7546::
    db $22, 2, $10, 8, $24, 2, $10, $10, $26, 2

data_7550::
    db $F8, 4, $32, 1, $E8, 4, $32, 1, $D8, 4, $32, 1, $C8, 4, $32, 1

ShipHeaveTable::
    db 2, 1, 0, 0, 0, 1, 2, 2

RenderIntroShip::
    ld   a, [wIntroSubTimer]
    and  a
    ld   a, $00
    jr   nz, .skip
    ldh  a, [hFrameCounter]
    add  a, $D0
    rra
    rra
    rra
    rra
    and  $07
.skip
    ld   e, a
    ld   d, $00
    ld   hl, ShipHeaveTable
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   hl, data_7538
    ld   de, $C000
    push bc
    ld   c, $06

.loop
    ldh  a, [$FFEC]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ldh  a, [$FFEE]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, .loop

    ld   a, [wIntroSubTimer]
    cp   $10
    jr   c, .return
    ld   hl, data_7550
    ld   de, $C018
    ld   c, $04
.loop2
    ldh  a, [$FFEC]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ldh  a, [$FFEE]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, .loop2

.return
    pop  bc
    ret

label_75CB::
    db 0, 0, $34, 1, 0, 8

label_75D1::
    db $36, 1, $10, 0, $2C, 1, $20, $F8, $2C, 1, $28, 0, $2E, $21, $30, $F0
    db $2E, 1, 8, 0, $36, $21, 8, 8, $34, $21, $18, 0, $30, 1, $18, 8
    db $2C, $21, $28, $10, $2E, $21, $28, $10

label_75F9::
    db $2E, $21, 0, 8, $34, $21, 0, 0, $36, $21, $10, 8, $2C, $21, $20, $10
    db $2C

label_7609::
    db $21, $28, 8, $2E, 1, $30, $18, $2E, $21, 8, 8, $36, 1, 8, 0, $34
    db 1, $18, 8, $30, $21, $18, 0

label_7621::
    inc  l
    ld   bc, $F828
    ld   l, $01
    jr   z, label_7621

label_7629::
    ld   l, $01

label_762B::
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    dec  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_75CB

label_7640::
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, [$C3C0]
    add  a, $18
    ld   [$C3C0], a
    ret

label_764F::
    db 0, 3, 2, 3, 4, 3, 6, 3, 8, 3, $A, 3, $C, 3, $E, 3

RenderIntroMarin::
    call label_71C7
    xor  a
    ld   [$C340], a
    ld   de, label_764F
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a
    ldh  a, [$FFF0]
    JP_TABLE
._0 dw label_7681
._1 dw label_76AB
._3 dw label_76D6
._4 dw label_7711
._5 dw label_7781

label_7681::
    call label_7D9C
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ldh  a, [$FFEE]
    cp   $48
    jr   nc, label_769C
    call IsEntityFrameCounterZero
    ld   [hl], $40
    call IncrementEntityWalkingAttr

label_769C::
    ld   hl, $C3D0
    add  hl, bc
    dec  [hl]
    jr   nz, label_76AA
    ld   [hl], $04
    ld   hl, $C200
    add  hl, bc
    dec  [hl]

label_76AA::
    ret

label_76AB::
    call label_7D46
    ld   a, $01
    call label_3B0C
    call IsEntityFrameCounterZero
    jr   nz, label_76D4
    call IncrementEntityWalkingAttr
    ld   a, $07
    ld   [$C281], a
    ld   a, $FE
    ld   [$C201], a
    ld   a, $6E
    ld   [$C211], a
    xor  a
    ld   [$C291], a
    ld   [$C2E1], a
    ldh  [hFrameCounter], a
    ret

label_76D4::
    dec  [hl]
    ret

label_76D6::
    call label_7D9C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, label_7707
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   a, [hl]
    cp   $30
    jr   nz, label_76F7
    call IsEntityFrameCounterZero
    ld   [hl], $40
    jp   IncrementEntityWalkingAttr

label_76F7::
    cp   $20
    jr   nz, label_76FF
    call label_7A16
    xor  a

label_76FF::
    cp   $22
    jr   nz, label_7707
    call label_7A11
    xor  a

label_7707::
    ldh  a, [hFrameCounter]
    rra
    rra
    and  $01
    call label_3B0C
    ret

label_7711::
    call IsEntityFrameCounterZero
    jr   nz, label_7778
    call label_7DCF
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, label_776C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, label_776C
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   a, [hl]
    cp   $40
    jr   z, label_7740
    cp   $3A
    jr   nz, label_7745
    call IsEntityFrameCounterZero
    ld   [hl], $30
    jr   label_7745

label_7740::
    call IsEntityFrameCounterZero
    ld   [hl], $50

label_7745::
    ldh  a, [hBaseScrollX]
    cp   $56
    jr   nz, label_775C
    ld   a, $A0
    ld   [hl], a
    ld   [rSCX], a
    ld   a, $01
    ld   [rIE], a
    call IsEntityFrameCounterZero
    ld   [hl], $E0
    jp   IncrementEntityWalkingAttr

label_775C::
    cp   $20
    jr   nz, label_7764
    call label_7A16
    xor  a

label_7764::
    cp   $22
    jr   nz, label_776C
    call label_7A11
    xor  a

label_776C::
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ret

label_7778::
    dec  [hl]
    call label_7D46
    ld   a, $01
    jp   label_3B0C

label_7781::
    call label_7D46
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, label_77BC
    ld   a, $02
    call label_3B0C
    ld   a, $00
    ld   [$C3B1], a
    call IsEntityFrameCounterZero
    jr   z, label_779A
    dec  [hl]

label_779A::
    cp   $A0
    jr   nc, label_77BC
    cp   $90
    jr   nc, label_77B2
    cp   $50
    jr   nc, label_77BC
    cp   $4A
    jr   nc, label_77B2
    cp   $3C
    jr   nc, label_77BC
    cp   $36
    jr   c, label_77BC

label_77B2::
    ld   a, $03
    call label_3B0C
    ld   a, $01
    ld   [$C3B1], a

label_77BC::
    ret

label_77BD::
    jr   c, label_77BF

label_77BF::
    db $38, $20, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $3c, $00, $3e, $00, $3c, $00
    db $3e, $00, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $38, $00, $38, $20


RenderIntroSparkle::
    xor  a
    ld   [$C3C1], a

label_77E1::
    call IsEntityFrameCounterZero
    dec  [hl]
    jr   nz, label_77ED
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   [hl], b
    ret

label_77ED::
    ld   a, [hl]
    rra
    rra
    rra
    and  $07
    ldh  [$FFF1], a
    xor  a
    ld   [$C340], a
    ld   de, label_77BD
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a
    ret

label_7808::
    db   $10, $18, $2e, $05, $00, $18, $2c, $05

label_7810::
    db   $10, $10

label_7812::
    db $2A, 5, 0, $10, $28, 5, $10, 8, $26, 5, 0, 8, $24, 5, $10, 0
    db $22, 5, 0, 0, $20, 5

label_7828::
    db 0, $28, $52, $16, 0

label_782D::
    db $20, $50, $16, $10, $18, $4E, $16, 0, $18, $4C, $16, $10, $10, $4A

label_783B::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7850::
    db $10, $18, $2E, 5, 0, $18, $2C, 5, $10, $10, $2A, 5, 0, $10, $28, 5
    db $10, 8, $26, 5, 0, 8, $24, 5, $10, 0, $22, 5, 0, 0, $20, 5

label_7870::
    db 0, $28, $52, $16, 0

label_7875::
    db $20, $50, $16, $10, $18, $4E, $16, 0

label_787D::
    db $18, $4C

label_787F::
    db $16, $10

label_7881::
    db   $10, $4A ; Undefined instruction

label_7883::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7898::
    db $54, $58, $68

label_789B::
    db $1C

label_789C::
    db 0, 4

label_789E::
    db $18

label_789F::
    db $6C ; l

label_78A0::
    db $f5, $7a, $8d, $7d, $8d, $7d, $8d, $7d
    db $f5, $7a, $ff, $7f, $ff, $7f, $ff, $7f
    db $f5, $7a, $6c, $6d, $8d, $71, $cf, $75
    db $f5, $7a, $7b, $6f, $bd, $73, $ff, $77
    db $f5, $7a, $2a, $5d, $8e

label_78C5::
    ld   h, l
    ld   [de], a

label_78C7::
    ld   l, [hl]
    push af

label_78C9::
    ld   a, d
    rst  $30

label_78CB::
    db $5E, $5B, $67, $DF, $6F, $F5, $7A, $E8, $48, $8E, $59, $54, $66, $F5, $7A, $52
    db $4A, $19, $5B, $BF, $67, $F5, $7A, $C6, $38, $8F, $49, $97, $5A, $F5, $7A, $CE
    db $39, $B7, $4A, $BF, $5B, $F5, $7A, $84, $24, $8F, $3D, $D9, $52, $F5, $7A, $29
    db $25, $75, $3E, $9F, $53, $F5, $7A, $42, $14, $90, $31, $1C, $4B, $F5, $7A, $A5
    db $14

label_790C::
    db $13, $32, $7F, $4B, $F5, $7A, 0, 0, $B1, $21, $5F, $3F, $F5, $7A, 0, 0
    db $B1, $21, $5F, $3F

label_7920::
    ld   hl, $D015
    ld   a, [hl]
    and  a
    jr   z, label_7929
    dec  [hl]
    ret

label_7929::
    ld   a, $78
    ldh  [$FFEE], a
    ld   hl, $D018
    ld   a, $59
    add  a, [hl]
    ldh  [$FFEC], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_795D
    ld   a, [$D013]
    cp   $04
    jr   z, label_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $0C
    jp   nz, label_7997
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jp   z, label_7997
    call label_79AE
    jp   label_7997

label_795D::
    ld   a, [$D013]
    cp   $08
    jr   z, label_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, label_797D
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   z, label_797D
    call label_79C2
    jr   label_797D

label_797D::
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_7997
    ld   a, [$D013]
    cp   $08
    jr   z, label_7990
    ld   hl, label_7850
    ld   c, $12
    jr   label_79AA

label_7990::
    ld   hl, label_7870
    ld   c, $0A
    jr   label_79AA

label_7997::
    ld   a, [$D013]
    cp   $03
    jr   nc, label_79A5
    ld   hl, label_7808
    ld   c, $12
    jr   label_79AA

label_79A5::
    ld   hl, label_7828
    ld   c, $0A

label_79AA::
    call label_3CE6
    ret

label_79AE::
    ld   b, $00
    ld   c, a
    ld   hl, label_7898
    add  hl, bc
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, label_789C
    add  hl, bc
    ld   a, [hl]
    ld   [$DB99], a
    ret

label_79C2::
    sla  a
    sla  a
    sla  a
    sla  a
    ld   b, $00
    ld   c, a
    ld   hl, label_78A0
    add  hl, bc
    ld   bc, $DC78
    ld   e, $10

label_79D6::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, label_79D6
    ld   a, $14
    ld   [$DDD3], a
    ld   a, $08
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret

label_79EC::
    sbc  a, b
    nop
    ld   b, e
    ld   a, l
    sbc  a, b
    jr   nz, label_7A36
    ld   a, l
    sbc  a, b
    ld   b, b
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, b
    ld   b, e
    ld   a, l
    nop

label_79FD::
    sbc  a, b
    inc  b
    inc  bc
    ld   a, l
    ld   a, l
    ld   c, h
    ld   c, l
    sbc  a, b
    inc  h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   b, h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, h
    ld   b, e
    ld   a, l
    nop

label_7A11::
    ld   hl, label_79FD
    jr   label_7A19

label_7A16::
    ld   hl, label_79EC

label_7A19::
    ld   de, $D601
    push bc
    ld   c, $18

label_7A1F::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_7A1F
    pop  bc
    ret

label_7A27::
    stop
    ld   [de], a
    nop
    inc  d
    nop
    ld   d, $00

RenderIntroInertLink::
    ldh  a, [$FFEE]
    cp   $F0
    jr   nc, label_7A47
    xor  a

label_7A36::
    ld   [$C340], a
    ld   de, label_7A27
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a

label_7A47::
    ldh  a, [$FFF0]
    JP_TABLE
    dw $7a52
    dw $7a5e
    dw $7a6e
    dw $7ac4

    call IsEntityFrameCounterZero
    dec  [hl]
    jr   nz, label_7A5D
    ld   [hl], $90
    call IncrementEntityWalkingAttr

label_7A5D::
    ret
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, label_7A6A
    call IsEntityFrameCounterZero
    dec  [hl]
    jr   z, label_7A6B

label_7A6A::
    ret

label_7A6B::
    jp   IncrementEntityWalkingAttr
    ld   a, [$D00A]
    cp   $13
    jr   z, label_7AB3
    ld   a, [$D00E]
    inc  a
    ld   [$D00E], a
    and  $03
    jr   nz, label_7AB2
    ld   a, [$C210]
    cp   $A0
    jr   nc, label_7A8B
    inc  a
    ld   [$C210], a

label_7A8B::
    ld   a, [$C211]
    cp   $A0
    jr   nc, label_7A96
    inc  a
    ld   [$C211], a

label_7A96::
    ldh  a, [$FF97]
    push af
    dec  a
    ldh  [$FF97], a
    pop  af
    and  $07
    jr   nz, label_7AB2
    push bc
    call label_7C60
    pop  bc
    ld   a, [$D00A]
    cp   $0B
    jr   nz, label_7AB2
    ld   a, $01
    ld   [$D368], a

label_7AB2::
    ret

label_7AB3::
    call IncrementEntityWalkingAttr
    call IsEntityFrameCounterZero
    ld   [hl], $17
    ld   a, $07
    ldh  [hWindowYUnused], a
    ld   a, $70
    ldh  [hWindowXUnused], a
    ret
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, label_7AE3
    call IsEntityFrameCounterZero
    dec  [hl]
    jr   nz, label_7AE3
    call IncrementGameplaySubtype
    xor  a
    ld   [$D002], a
    ld   [$D003], a
    ld   [$D004], a
    ld   [wEntitiesTypeTable], a
    ld   [$C281], a

label_7AE3::
    ret

label_7AE4::
    db $7c, $7c, $44, $45, $7d, $7d, $7d, $7d
    db $7d, $7d, $7d, $7d, $7d, $7d, $7d, $7d
    db $4c, $4d, $7c, $7c, $7c, $7c, $7c, $7c
    db $44, $45, $7d, $2d, $2e, $2d, $2e, $2d
    db $2e, $7d, $4c, $4d, $7c, $7c, $7c, $7c
    db $7c, $7c, $7c, $7c, $7c, $77, $46, $7e
    db $7e, $7e, $7e, $7e, $7e, $4b, $79, $7c
    db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $77
    db $75, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $75, $78, $7c, $7c, $7c
    db $7c, $7c, $77, $7a, $7a, $74, $73, $74
    db $5c, $5d, $5e, $5f, $73, $74, $73, $7a
    db $7e, $78, $7c, $7c, $7c, $7c, $73, $75
    db $78, $77, $78, $79, $58, $59, $5a, $5b
    db $79, $79, $77, $75, $7e, $74, $7c, $7c
    db $7c, $7c, $7c, $73, $74, $76, $73, $7a
    db $54, $55, $56, $57, $7a, $74, $76, $73
    db $74, $7c, $7c, $7c, $77, $78, $7c, $79
    db $7c, $7c, $7c, $7c, $50, $51, $52, $53
    db $7c, $7c, $7c, $7c, $7c, $7c, $77, $78
    db $7e, $7e, $75, $7e, $78, $77, $75, $78
    db $79, $2b, $2c, $79, $79, $77, $75, $78
    db $77, $75, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e


label_7C60::
    ld   a, [$D00A]
    and  a
    jr   nz, label_7C70
    ld   a, $F4
    ld   [$D00B], a
    ld   a, $9B
    ld   [$D00C], a

label_7C70::
    ld   a, [$D00A]
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a, e
    sla  e
    rl   d
    sla  e
    rl   d
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   c, $00
    ld   hl, $D601
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a

label_7C9D::
    push hl
    ld   hl, label_7AE4
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    inc  de
    inc  c
    ld   a, c
    cp   $14
    jr   nz, label_7C9D
    ld   [hl], $00
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_7CB6
    call label_7CCB

label_7CB6::
    ld   hl, $D00A
    inc  [hl]
    ld   a, [$D00B]
    sub  a, $20
    ld   [$D00B], a
    ld   a, [$D00C]
    sbc  a, $00
    ld   [$D00C], a
    ret

label_7CCB::
    ld   hl, $DC91
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    sub  a, $14
    ldi  [hl], a
    ld   a, $5F
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   [hl], $00
    ret

label_7CE1::
    db 0, $50, $80, $50, 0, $51, $80, $51

label_7CE9::
    db 0, $52, $80, $52, 0, $53, $80, $53

label_7CF1::
    db 0, 2, 4, 6, 6, 4, 2, 0

; During the Intro sea sequence, the sea tiles are animated vertically, to simulate waves
; passing behind each others.
; To keep the horizon at a constant level, this vertical motion needs to be compensated.
;
; This table defines by which amount the Background should be shifted vertically when
; drawing the bottom section of the screen, so that the horizon looks constant.
IntroBGVerticalOffsetTable::
    db 3, 2, 1, 0, 0, 1, 2, 3

label_7D01::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_7D0B
    inc  [hl]

label_7D0B::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, label_7D13
    inc  [hl]

label_7D13::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $1F
    jr   nz, label_7D1B
    inc  [hl]

label_7D1B::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, label_7D23
    inc  [hl]

label_7D23::
    inc  hl
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, label_7D2F
    inc  [hl]

label_7D2F::
    ldh  a, [hFrameCounter]
    add  a, $FC
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, IntroBGVerticalOffsetTable
    add  hl, de
    ld   a, $00
    sub  a, [hl]
    ld   [wIntroBGYOffset], a

label_7D46::
    ldh  a, [hFrameCounter]
    and  $0F
    cp   $04
    jr   c, label_7D9B

label_7D4E::
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_7CF1
    add  hl, de
    ld   e, [hl]
    ld   hl, label_7CE1
    ld   a, [$D00F]
    and  a
    jr   z, label_7D6A
    ld   hl, label_7CE9

label_7D6A::
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $8900
    ld   a, [$D00F]
    and  a
    jr   z, label_7D7A
    ld   de, $9300

label_7D7A::
    ldh  a, [hFrameCounter]
    and  $03
    sla  a
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    add  a, l
    ld   l, a
    ld   a, l
    ld   [$D006], a
    ld   a, h
    ld   [$D007], a
    ld   a, e
    ld   [$D008], a
    ld   a, d
    ld   [$D009], a

label_7D9B::
    ret

label_7D9C::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, label_7DA6
    inc  [hl]

label_7DA6::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $50
    ld   [$D004], a
    jr   nc, label_7DB4
    inc  [hl]

label_7DB4::
    inc  hl
    ld   a, [$D005]
    add  a, $58
    ld   [$D005], a
    jr   nc, label_7DC0
    inc  [hl]

label_7DC0::
    inc  hl
    ld   a, [$D00D]
    add  a, $B0
    ld   [$D00D], a
    jr   nc, label_7DCC
    inc  [hl]

label_7DCC::
    jp   label_7D46

label_7DCF::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, label_7DD9
    inc  [hl]

label_7DD9::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, label_7DE7
    inc  [hl]

label_7DE7::
    inc  hl
    ld   a, [$D005]
    add  a, $2C
    ld   [$D005], a
    jr   nc, label_7DF3
    inc  [hl]

label_7DF3::
    inc  hl
    ld   a, [$D00D]
    add  a, $58
    ld   [$D00D], a
    jr   nc, label_7DFF
    inc  [hl]

label_7DFF::
    jp   label_7D46

