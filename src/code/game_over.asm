;
; Code for Link passing out when not health remains
;

LinkPassOut::
    ; Actually code, not data
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
    ld   a, [wDeathCount]
    add  a, $01
    daa
    ld   [wDeathCount], a
    ld   a, [$DB58]
    adc  a, $00
    daa
    ld   [$DB58], a
    cp   $10
    jr   c, label_4240
    ld   a, $99
    ld   [wDeathCount], a
    ld   a, $09
    ld   [$DB58], a

label_4240::
    xor  a
    ld   [$C1BF], a
    ld   [wPieceOfPowerKillCount], a
    ld   [wActivePowerUp], a
    ld   [wPowerUpHits], a
    ld   [wObjectAffectingBGPalette], a
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
    ld   [wObjectAffectingBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, [wBGPalette]
    ld   [wOBJ1Palette], a
    ld   e, $08
    call func_020_6A30_trampoline
    call CopyLinkTunicPalette_trampoline
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
    call LoadFileMenuBG_trampoline
    call SynchronizeDungeonsItemFlags_trampoline
    ret
    nop
    cp   $FD
    cp   $00
    ld   [bc], a
    inc  bc
    ld   [bc], a
    nop
    inc  b
    db   $08, $0C, $10
    inc  c
    ld   [$F004], sp
    or   a
    and  a
    jr   nz, label_42D8
    ld   hl, $FF9C
    inc  [hl]
    ld   a, $03
    ld   [wActiveMusicTrack], a

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
    ld   hl, wEntitiesStatusTable
    ld   e, $10

label_42FB::
    ldi  [hl], a
    dec  e
    jr   nz, label_42FB
    ld   [wOBJ0Palette], a
    ld   [wOBJ1Palette], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [wBGPalette], a
    ld   [rBGP], a
    ld   [$D6FB], a
    ld   [$D475], a
    ldh  a, [hLinkPositionX]
    ld   [wMapEntrancePositionX], a
    ldh  a, [hLinkPositionY]
    ld   [wMapEntrancePositionY], a
    call LoadSavedFile
    ld   a, $01
    call ClearFileMenuBG_trampoline
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
