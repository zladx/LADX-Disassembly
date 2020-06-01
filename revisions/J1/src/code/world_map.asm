;
; Code for the world map displayed when pressing SELECT.
;

WorldMapEntryPoint::
    xor  a
    ld   [wOAMNextAvailableSlot], a

    ; Ignore inputs until the minimap is displayed
    ld   a, [wGameplaySubtype]
    cp   $05
    jr   z, .ignoreInputsEnd
    xor  a
    ldh  [hPressedButtonsMask], a
    ldh  [hJoypadState], a
    ld   a, [wGameplaySubtype]
.ignoreInputsEnd

    JP_TABLE
._00 dw WorldMapState0Handler
._01 dw WorldMapState1Handler
._02 dw WorldMapState2Handler
._03 dw WorldMapState3Handler
._04 dw WorldMapState4Handler
._05 dw WorldMapInteractiveHandler
._06 dw FileSaveFadeOut

WorldMapState0Handler::
    call IncrementGameplaySubtype
    ldh  a, [hIsGBC]
    and  a
    jr   z, WorldMapState1Handler
    ld   hl, $DC10
    ld   c, $80
    di
    ld   a, $03
    ld   [rSVBK], a
    ld   a, [$D000]
    and  a
    jr   nz, jr_001_5674

jr_001_5660::
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
    jr   nz, jr_001_5660
    ld   a, $01
    ld   [$D000], a

jr_001_5674::
    xor  a
    ld   [rSVBK], a
    ei

WorldMapState1Handler::
    call DrawLinkSprite
    call AnimateEntitiesAndRestoreBank01
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_56F3
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
    ld   hl, MapSpecialLocationNamesTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, jr_001_56D9
    swap a
    and  $07
    inc  a
    cp   $01
    jr   nz, jr_001_56D9
    ld   a, [$C5A2]
    and  a
    ld   a, $00
    jr   nz, jr_001_56D9
    ld   hl, wOverworldRoomStatus
    add  hl, de
    ld   a, [hl]
    and  $20
    ld   a, $00
    jr   z, jr_001_56D9
    ld   a, $01

jr_001_56D9::
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    ld   a, [$FF40]
    and  $DF
    ld   [wLCDControl], a
    ld   [rLCDC], a
    call func_001_5888
    ld   a, $08
    ld   [wBGMapToLoad], a

jr_001_56F3::
    ret

WorldMapState2Handler::
    ld   a, $0B
    ld   [wTileMapToLoad], a
    call IncrementGameplaySubtype
    ret

WorldMapState3Handler::
    ld   a, $0E
    ld   [wTileMapToLoad], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype
    ret

WorldMapState4Handler::
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, .return
    call IncrementGameplaySubtype
    call PlayValidationJingle
.return
    ret

WorldMapInteractiveHandler::
.debugEnd

    ld   a, [wDialogState]
    and  a
    jp   nz, label_001_5818
    ldh  a, [hJoypadState]
    and  J_A
    jr   z, jr_001_57B7
    ld   a, [$DBB4]
    ld   e, a
    ld   d, $00
    ld   hl, MapSpecialLocationNamesTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, jr_001_576F
    ld   e, a
    and  $F0
    jr   nz, jr_001_5766
    ld   a, [$C5A2]
    and  a
    jr   nz, jr_001_576F
    push de
    ld   a, [$DBB4]
    ld   e, a
    ld   hl, wOverworldRoomStatus
    add  hl, de
    pop  de
    ld   a, [hl]
    and  $20
    jr   z, jr_001_576F

jr_001_5766::
    ld   d, $00
    ld   hl, MapSpecialLocationNamesLookupTable
    add  hl, de
    ld   a, [hl]
    jr   jr_001_5792

jr_001_576F::
    ld   a, [$DBB4]
    cp   $24
    jr   z, jr_001_577A
    cp   $34
    jr   nz, jr_001_577E

jr_001_577A::
    ld   a, $76
    jr   jr_001_5792

jr_001_577E::
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
    ld   hl, MapLocationNamesTable
    add  hl, de
    ld   a, [hl]

jr_001_5792::
    call OpenDialog
    ld   a, [$C173]
    cp   $A7
    jr   z, jr_001_57A3
    ld   a, [$DBB4]
    cp   $37
    jr   nz, jr_001_57A8

jr_001_57A3::
    ld   a, $01
    ld   [$C112], a

jr_001_57A8::
    ld   a, [$DBB4]
    cp   $70
    ld   a, $01
    jr   nc, jr_001_57B3
    ld   a, $81

jr_001_57B3::
    ld   [$C19F], a
    ret

; POI: Debug code to warp to any room on the map by pushing B + Select (on the map screen)
jr_001_57B7::
    ld   a, [ROM_DebugTool1]                    ; If we weren't pushing A above, then
    and  a                                      ; Check the first debug flag
    jr   z, jr_001_57FA                         ; If the debug flag is off, skip this
    ldh  a, [hPressedButtonsMask]               ; Otherwise, are we holding SELECT / B?
    cp   J_SELECT | J_B
    jr   nz, jr_001_57FA                        ; If yes, skip this too
    ld   a, GAMEPLAY_WORLD                      ; Otherwise, warp somewhere
    ld   [wGameplayType], a
    call ApplyMapFadeOutTransition
    ld   a, $00
    ld   [wWarp0MapCategory], a
    ld   [wWarp0Map], a
    ld   a, [$DBB4]
    ld   [wWarp0Room], a
    ld   a, $48
    ld   [wWarp0DestinationX], a
    ld   a, $52
    ld   [wWarp0DestinationY], a
    ldh  a, [hLinkPositionX]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [hLinkPositionY]
    sub  a, $08
    and  $F0
    or   e
    ld   [wWarp0PositionTileIndex], a
    ld   a, $07
    ld   [wGameplaySubtype], a
    ret

jr_001_57FA::
    ld   e, J_SELECT
    ld   a, [ROM_DebugTool1]
    and  a
    jr   nz, jr_001_5804
    ld   e, J_SELECT | J_B

jr_001_5804::
    ldh  a, [hJoypadState]
    and  e
    jr   z, label_001_5818
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype

label_001_5818::
    call func_001_58A8
    call func_001_5A71
    call func_001_5C49
    ret
