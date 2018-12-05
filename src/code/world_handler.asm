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

data_4385::
    db $00, $00, $00, $00, $00, $00, $30, $00, $00, $00, $00, $00, $00, $00, $00, $00

GameplayWorldSubtype0Handler::
    call label_27F2
    call IncrementGameplaySubtype
    ld   a, [ROM_DebugTool2]
    and  a
    jr   z, label_43A7
    ld   a, $0B
    ld   [wBGMapToLoad], a
    ret

label_43A7::
    ld   a, [wIsIndoor]
    and  a
    jr   z, label_4414
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
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
    ld   hl, wDungeonItemFlags
    add  hl, de

label_43C5::
    ld   de, $DBCC
    ld   c, $05

label_43CA::
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, label_43DB
    cp   MAP_WINDFISHS_EGG
    jr   z, label_43D8
    cp   MAP_CAVE_B
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, label_43E9
    ld   a, $0F

label_43E9::
    ld   e, a
    ld   d, $00
    ld   hl, data_4385
    add  hl, de
    ld   a, [hl]
    ld   [$DBB0], a
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, label_440B
    cp   MAP_WINDFISHS_EGG
    jr   z, label_4425
    cp   MAP_CAVE_B
    jr   nc, label_4425
    cp   MAP_EAGLES_TOWER
    jr   nz, label_440B
    ldh  a, [hIsSideScrolling]
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
    ldh  [$FFA2], a
    and  a
    jr   z, label_4452
    ld   a, $02
    ld   [$C146], a

label_4452::
    ld   a, $04
    ld   [wRoomTransitionDirection], a
    call LoadRoom
    call LoadRoomEntities
    call label_5FB3
    ld   a, $FF
    ldh  [hAnimatedTilesFrameCount], a
    ld   a, [wIsIndoor]
    and  a
    jr   z, label_44A6
    ld   d, a
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
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
    ldh  a, [hMapRoom]
    ld   e, a
    call GetChestsStatusForRoom
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
    ldh  a, [hRoomStatus]
    and  $10
    jr   nz, label_44A6
    ld   a, $0C
    ld   [wCompassSfxCountdown], a

label_44A6::
    ld   a, [wIsIndoor]
    and  a
    ld   a, $06
    jr   nz, label_44B0
    ld   a, $07

label_44B0::
    ld   [wTileMapToLoad], a
    ret

GameplayWorldSubtype2Handler::
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
    call LoadRoomSprites
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

GameplayWorldSubtype4Handler::
    call label_3E3F
    call IncrementGameplaySubtype
    ret

GameplayWorldSubtype5Handler::
    call label_3E5A
    call IncrementGameplaySubtype
    ret

GameplayWorldSubtype6Handler::
    call label_5895
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
    jr   z, label_4548
    ld   a, [$C5AD]
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E4
    ld   [wOBJ1Palette], a
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
    ld   [wForceFileSelectionScreenMusic], a

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
