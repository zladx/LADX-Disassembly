; Code for bank 1.
; Contains main engine support code.

data_380   equ $0380

include "code/file_save_screen.asm"

; Unused code?
label_40D6::
    xor  a
    ld   [wOBJ0Palette], a
    ld   [$DB99], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ldh  a, [hLinkPositionX]
    ld   [wMapEntrancePositionX], a
    ldh  a, [hLinkPositionY]
    ld   [wMapEntrancePositionY], a
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

include "code/game_over.asm"
include "code/world_handler.asm"

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
    ld   de, $3A8

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
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a
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
    ld   de, $3A8

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
    call nz, $7E44
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
    call $7E44
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
    ld   de, $3AD

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
    ldh  [hIsSideScrolling], a
    ld   a, [wHealth]
    and  a
    jr   nz, label_52BB
    ld   a, [wMaxHealth]
    ld   e, a

label_52B1::
    ld   d, $00

label_52B3::
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [wHealth], a

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
    ld   a, GAMEPLAY_WORLD
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    xor  a
    ld   [wLinkMotionState], a
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
    ld   [wMapEntrancePositionX], a
    ld   a, [$DB63]
    ld   [wMapEntrancePositionY], a
    ld   a, [$DB61]
    ldh  [$FFF6], a
    ld   [$DB9C], a
    ld   a, [$DB60]
    ldh  [hMapId], a
    ld   a, [$DB64]
    ld   [wIndoorRoom], a
    xor  a
    ldh  [hIsSideScrolling], a
    ld   a, $03
    ldh  [$FF9E], a
    ld   a, [$DB5F]
    and  $01
    ld   [wIsIndoor], a
    jr   z, label_538E
    ld   a, $04
    ldh  [hLinkAnimationState], a
    ld   a, $02
    ldh  [$FF9E], a

label_538E::
    ld   a, $02
    ld   [wBGMapToLoad], a
    ret

; Write default save?
label_5394::
    ld   a, $30
    ld   [wMaxArrows], a
    ld   a, $30
    ld   [wMaxBombs], a
    ld   a, $20
    ld   [wMaxMagicPowder], a
    ld   a, $A3
    ld   [$DB9C], a
    ldh  [$FFF6], a
    ld   [$DB54], a
    ld   a, $01
    ld   [wIsIndoor], a
    ld   a, MAP_HOUSE
    ldh  [hMapId], a
    ld   a, $50
    ld   [wMapEntrancePositionX], a
    ld   a, $60
    ld   [wMapEntrancePositionY], a
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
    ldh  a, [hMapId]
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

MinimapEntryPoint::
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
    call OpenDialog
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
    ld   a, GAMEPLAY_WORLD
    ld   [wGameplayType], a
    call ApplyMapFadeOutTransition
    ld   a, $00
    ld   [$D401], a
    ld   [$D402], a
    ld   a, [$DBB4]
    ld   [$D403], a
    ld   a, $48
    ld   [$D404], a
    ld   a, $52
    ld   [$D405], a
    ldh  a, [hLinkPositionX]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [hLinkPositionY]
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
    ld   a, GAMEPLAY_WORLD
    ld   [wGameplayType], a
    ldh  [hFFBC], a
    ld   a, $02
    ld   [wGameplaySubtype], a
    ld   a, [wIsIndoor]
    and  a
    ld   a, $06
    jr   nz, label_5885
    ld   a, $07

label_5885::
    ld   [wTileMapToLoad], a

label_5888::
    ld   hl, wRoomTransitionState
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
    jp   OpenDialog

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
    ld   a, JINGLE_BUMP
    ldh  [hJingle], a
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
    ld   a, [wHealth]
    and  a
    jr   nz, label_5DFA
    ld   a, [wMaxHealth]
    ld   e, a
    ld   d, $00
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [wHealth], a

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

label_5E67::
    push bc
    ld   a, [wIsIndoor]
    and  a
    jr   z, label_5E95
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
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
    ld   a, [wRoomTransitionDirection]
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
    ld   a, [wIsIndoor]
    and  a
    jr   z, label_5FD3
    ldh  a, [hIsSideScrolling]
    and  a
    ret  nz
    ldh  a, [hMapId]
    cp   MAP_S_FACE_SHRINE
    ret  z
    cp   MAP_KANALET
    ret  z
    cp   MAP_DREAM_SHRINE
    ret  z
    cp   MAP_CAVE_B
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
    ldh  a, [hLinkPositionX]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
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
    ld   a, [wIsIndoor]
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
    ldh  a, [hLinkPositionX]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, $2D
    ldh  [hJingle], a

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
    ldh  a, [hLinkPositionX]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $D155
    call label_6118
    ldh  a, [hLinkPositionY]
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
    ldh  a, [hMapId]
    cp   MAP_CAVE_C
    jr   nz, label_60F7
    ld   a, JINGLE_JUMP_DOWN
    ldh  [hJingle], a
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
    ldh  a, [hLinkPositionX]
    ld   hl, $C200
    add  hl, de
    add  a, $20
    ld   [hl], a
    ldh  a, [hLinkPositionY]
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
    ldh  a, [hLinkPositionX]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
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

LoadCounterAnimatedTiles::
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

OpenDungeonNameDialog::
    ; If wLinkMotionState == LINK_MOTION_INTERACTIVE…
    ld   a, [wLinkMotionState]
    cp   $00
    jr   nz, .return
    ; … and Free Movement Mode is disabled…
    ld   a, [wFreeMovementMode]
    and  a
    jr   nz, .return
    ; Open Dialog n° (hMapId + $56)
    ldh  a, [hMapId]
    add  a, $56
    call OpenDialog
.return
    ret

include "code/marin_beach.asm"

PeachPictureEntryPoint::
    ; Actually code for a jump table
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
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
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
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
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
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
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
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   nz, label_68CF
    call label_6A7C
    ld   a, $07
    ld   [wGameplaySubtype], a
    ret

label_68CF::
    ldh  a, [$FFCC]
    and  $B0
    jr   z, label_68E3
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a

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
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
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

include "code/face_shrine_mural.asm"

label_6BA8::
    ldh  a, [$FFCC]
    and  $0C
    jr   z, label_6BB4

label_6BAE::
    push af
    ld   a, JINGLE_MOVE_SELECTION
    ldh  [hJingle], a
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
    ld   hl, $4D00
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
    ld   bc, $400
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
    cp   GAMEPLAY_WORLD
    jr   z, label_6D1C
    ld   d, $06

label_6D1C::
    ld   a, $01
    ld   [rVBK], a
    ld   hl, $9800
    ld   bc, $400

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
    ld   a, [wIsIndoor]
    and  a
    jr   z, label_6E18
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
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
    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, label_6E18
    ld   [hl], $7F

label_6E18::
    ret

include "code/intro.asm"
