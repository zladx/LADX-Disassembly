;
; Steps for preparing the World display
;

WorldHandlerEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw GameplayWorldSubtype0Handler
._1 dw GameplayWorldSubtype1Handler
._2 dw GameplayWorldSubtype2Handler
._3 dw GameplayWorldSubtype3Handler
._4 dw GameplayWorldSubtype4Handler
._5 dw GameplayWorldSubtype5Handler
._6 dw GameplayWorldSubtype6Handler
._7 dw WorldDefaultHandler

MinimapLayoutTable::
._00 db MINIMAP_STYLE_TAIL_CAVE
._01 db MINIMAP_STYLE_BOTTLE_GROTTO
._02 db MINIMAP_STYLE_KEY_CAVERN
._03 db MINIMAP_STYLE_ANGLERS_TUNNEL
._04 db MINIMAP_STYLE_CATFISHS_MAW
._05 db MINIMAP_STYLE_FACE_SHRINE
._06 db MINIMAP_STYLE_EAGLES_TOWER
._07 db MINIMAP_STYLE_TURTLE_ROCK
._08 db INVENTORY_MINIMAP_SINGLE_FLOOR
._09 db INVENTORY_MINIMAP_SINGLE_FLOOR
._0A db INVENTORY_MINIMAP_SINGLE_FLOOR
._0B db INVENTORY_MINIMAP_SINGLE_FLOOR
._0C db INVENTORY_MINIMAP_SINGLE_FLOOR
._0D db INVENTORY_MINIMAP_SINGLE_FLOOR
._0E db INVENTORY_MINIMAP_SINGLE_FLOOR
._0F db MINIMAP_STYLE_COLOR_DUNGEON ; probably

GameplayWorldSubtype0Handler::
    call label_27F2
    call IncrementGameplaySubtype
    ld   a, [ROM_DebugTool2]
    and  a
    jr   z, jr_001_43A7
    ld   a, $0B
    ld   [wBGMapToLoad], a
    ret

jr_001_43A7::
    ld   a, [wIsIndoor]
    and  a
    jr   z, jr_001_4414
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, jr_001_43B8
    ld   hl, $DDDA
    jr   jr_001_43C5

jr_001_43B8::
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, wDungeonItemFlags
    add  hl, de

jr_001_43C5::
    ld   de, wHasDungeonMap
    ld   c, $05

jr_001_43CA::
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, jr_001_43DB
    cp   MAP_WINDFISHS_EGG
    jr   z, jr_001_43D8
    cp   MAP_CAVE_B
    jr   c, jr_001_43DB

jr_001_43D8::
    xor  a
    jr   z, jr_001_43DC

jr_001_43DB::
    ld   a, [hli]

jr_001_43DC::
    ld   [de], a
    inc  de
    dec  c
    jr   nz, jr_001_43CA

    ; If inside the color dungeon ($FF),
    ; lookup for dungeon $0F in the table instead.
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonIndexEnd
    ld   a, $0F
.colorDungeonIndexEnd

    ; Lookup the minimap layout for the dungeon in a
    ld   e, a
    ld   d, $00
    ld   hl, MinimapLayoutTable
    add  hl, de
    ld   a, [hl]
    ld   [wMinimapLayout], a

    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, jr_001_440B
    cp   MAP_WINDFISHS_EGG
    jr   z, jr_001_4425
    cp   MAP_CAVE_B
    jr   nc, jr_001_4425
    cp   MAP_EAGLES_TOWER
    jr   nz, jr_001_440B
    ldh  a, [hIsSideScrolling]
    and  a
    jr   nz, jr_001_4425

jr_001_440B::
    call func_001_5511
    ld   a, $07
    ld   [wBGMapToLoad], a
    ret

jr_001_4414::
    ld   a, $02
    ld   [wBGMapToLoad], a
    call GetRandomByte
    ld   hl, hFrameCounter
    or   [hl]
    and  $03
    ldh  [$FFB9], a
    ret

jr_001_4425::
    ld   a, $09
    ld   [wBGMapToLoad], a
    ret

GameplayWorldSubtype1Handler::
    call ClearLowerWRAM
    xor  a
    ld   [wLinkMotionState], a
    call IncrementGameplaySubtype
    ld   a, [wMapEntrancePositionX]
    ldh  [hLinkPositionX], a
    ld   [wLinkMapEntryPositionX], a
    ld   a, [wMapEntrancePositionY]
    ldh  [hLinkPositionY], a
    ld   [wLinkMapEntryPositionY], a
    ld   a, [$DBC8]
    ldh  [hLinkPositionZ], a
    and  a
    jr   z, jr_001_4452
    ld   a, $02
    ld   [$C146], a

jr_001_4452::
    ld   a, $04
    ld   [wRoomTransitionDirection], a
    call LoadRoom
    call LoadRoomEntities
    call CreateFollowingNpcEntity
    ld   a, $FF
    ldh  [hAnimatedTilesFrameCount], a
    ld   a, [wIsIndoor]
    and  a
    jr   z, jr_001_44A6
    ld   d, a
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, jr_001_4475
    ld   d, $00
    jr   jr_001_447E

jr_001_4475::
    cp   $1A
    jr   nc, jr_001_447E
    cp   $06
    jr   c, jr_001_447E
    inc  d

jr_001_447E::
    ldh  a, [hMapRoom]
    ld   e, a
    call GetChestsStatusForRoom_trampoline
    cp   $1A
    jr   z, jr_001_4495
    cp   $19
    jr   z, jr_001_4495
    ld   a, [wRoomEvent]
    and  EVENT_EFFECT_MASK
    cp   EFFECT_DROP_KEY
    jr   nz, jr_001_44A6

jr_001_4495::
    ld   a, [$DBCD]
    and  a
    jr   z, jr_001_44A6
    ldh  a, [hRoomStatus]
    and  $10
    jr   nz, jr_001_44A6
    ld   a, $0C
    ld   [wCompassSfxCountdown], a

jr_001_44A6::
    ld   a, [wIsIndoor]
    and  a
    ld   a, $06
    jr   nz, jr_001_44B0
    ld   a, $07

jr_001_44B0::
    ld   [wTileMapToLoad], a
    ret

GameplayWorldSubtype2Handler::
    ld   a, $0F
    ldh  [hWorldTileset], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_001_44C9
    di
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

jr_001_44C9::
    call LoadRoomTiles
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

GameplayWorldSubtype3Handler::
    ld   a, $01
    ld   [wTileMapToLoad], a
    ld   a, [wRoomSwitchableObject]
    and  a
    jr   z, jr_001_44F5
    ld   a, $05
    ld   [$D6F8], a
    ld   a, [$C1CB]
    and  a
    jr   z, jr_001_44F5
    ld   a, $03
    ldh  [$FFA5], a

jr_001_44F5::
    call IncrementGameplaySubtype
    ret

GameplayWorldSubtype4Handler::
    call IncrementGameplaySubtype
    ld a, [ROM_DebugTool2]
    and a
    ret nz

    call LoadHeartsAndRuppeesCount
    ret

GameplayWorldSubtype5Handler::
    call IncrementGameplaySubtype
    ld a, [ROM_DebugTool2]
    and a
    ret nz
    call label_3E5A
    ret

GameplayWorldSubtype6Handler::
    call func_001_5895
    ld   a, [$FF40]
    or   $20
    ld   [wLCDControl], a
    ld   [rLCDC], a
    call IncrementGameplaySubtype
    ld   a, [wLinkMotionState]
    ld   [$D463], a
    ld   a, $04
    ld   [wLinkMotionState], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [wObjectAffectingBGPalette]
    and  a
    jr   z, jr_001_4548
    ld   a, [$C5AD]
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E4
    ld   [wOBJ1Palette], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, jr_001_4548
    ld   a, $04
    ld   [$C16B], a

jr_001_4548::
    jp   label_27DD
    ldh  a, [hJoypadState]
    and  $90
    jp   z, TransitionReturn

TransitionToFileMenu::
    ld   [wForceFileSelectionScreenMusic], a

label_001_4555::
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
    ld   [wFile1DeathCountHigh], a
    call EnableExternalRAMWriting
    ld   a, [$A45D]
    ld   [wFile1DeathCountLow], a
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
    ld   [wFile2DeathCountHigh], a
    call EnableExternalRAMWriting
    ld   a, [$A80A]
    ld   [wFile2DeathCountLow], a
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
    ld   [wFile3DeathCountHigh], a
    call EnableExternalRAMWriting
    ld   a, [$ABB7]
    ld   [wFile3DeathCountLow], a
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
    ld   [wOBJ1Palette], a
    ld   a, $01
    call ClearFileMenuBG_trampoline
TransitionReturn::
    ret
