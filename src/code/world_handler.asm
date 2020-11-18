;
; Steps for preparing the World display
;

WorldHandlerEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $4371: $FA $96 $DB
    JP_TABLE                                      ; $4374: $C7
._0 dw GameplayWorldSubtype0Handler               ; $4375
._1 dw GameplayWorldSubtype1Handler               ; $4377
._2 dw GameplayWorldSubtype2Handler               ; $4379
._3 dw GameplayWorldSubtype3Handler               ; $437B
._4 dw GameplayWorldSubtype4Handler               ; $437D
._5 dw GameplayWorldSubtype5Handler               ; $437F
._6 dw GameplayWorldSubtype6Handler               ; $4381
._7 dw WorldDefaultHandler                        ; $4383

MinimapLayoutTable::
._00 db MINIMAP_STYLE_TAIL_CAVE                   ; $4385
._01 db MINIMAP_STYLE_BOTTLE_GROTTO               ; $4386
._02 db MINIMAP_STYLE_KEY_CAVERN                  ; $4387
._03 db MINIMAP_STYLE_ANGLERS_TUNNEL              ; $4388
._04 db MINIMAP_STYLE_CATFISHS_MAW                ; $4389
._05 db MINIMAP_STYLE_FACE_SHRINE                 ; $438A
._06 db MINIMAP_STYLE_EAGLES_TOWER                ; $438B
._07 db MINIMAP_STYLE_TURTLE_ROCK                 ; $438C
._08 db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $438D
._09 db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $438E
._0A db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $438F
._0B db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $4390
._0C db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $4391
._0D db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $4392
._0E db INVENTORY_MINIMAP_SINGLE_FLOOR            ; $4393
._0F db MINIMAP_STYLE_COLOR_DUNGEON ; probably    ; $4394

GameplayWorldSubtype0Handler::
    call label_27F2                               ; $4395: $CD $F2 $27
    call IncrementGameplaySubtype                 ; $4398: $CD $D6 $44
IF !__PATCH_5__
    ; POI: This is where debug flag 2 messes up the subscreen
    ld   a, [ROM_DebugTool2]                      ; $439B: $FA $04 $00
    and  a                                        ; $439E: $A7
    jr   z, jr_001_43A7                           ; $439F: $28 $06
    ld   a, $0B                                   ; $43A1: $3E $0B
    ld   [wBGMapToLoad], a                        ; $43A3: $EA $FF $D6
    ret                                           ; $43A6: $C9
jr_001_43A7::
ENDC
    ld   a, [wIsIndoor]                           ; $43A7: $FA $A5 $DB
    and  a                                        ; $43AA: $A7
    jr   z, jr_001_4414                           ; $43AB: $28 $67
    ldh  a, [hMapId]                              ; $43AD: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $43AF: $FE $FF
    jr   nz, jr_001_43B8                          ; $43B1: $20 $05
    ld   hl, $DDDA                                ; $43B3: $21 $DA $DD
    jr   jr_001_43C5                              ; $43B6: $18 $0D

jr_001_43B8::
    ld   e, a                                     ; $43B8: $5F
    sla  a                                        ; $43B9: $CB $27
    sla  a                                        ; $43BB: $CB $27
    add  a, e                                     ; $43BD: $83
    ld   e, a                                     ; $43BE: $5F
    ld   d, $00                                   ; $43BF: $16 $00
    ld   hl, wDungeonItemFlags                    ; $43C1: $21 $16 $DB
    add  hl, de                                   ; $43C4: $19

jr_001_43C5::
    ld   de, wHasDungeonMap                       ; $43C5: $11 $CC $DB
    ld   c, $05                                   ; $43C8: $0E $05

jr_001_43CA::
    ldh  a, [hMapId]                              ; $43CA: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $43CC: $FE $FF
    jr   z, jr_001_43DB                           ; $43CE: $28 $0B
    cp   MAP_WINDFISHS_EGG                        ; $43D0: $FE $08
    jr   z, jr_001_43D8                           ; $43D2: $28 $04
    cp   MAP_CAVE_B                               ; $43D4: $FE $0A
    jr   c, jr_001_43DB                           ; $43D6: $38 $03

jr_001_43D8::
    xor  a                                        ; $43D8: $AF
    jr   z, jr_001_43DC                           ; $43D9: $28 $01

jr_001_43DB::
    ld   a, [hli]                                 ; $43DB: $2A

jr_001_43DC::
    ld   [de], a                                  ; $43DC: $12
    inc  de                                       ; $43DD: $13
    dec  c                                        ; $43DE: $0D
    jr   nz, jr_001_43CA                          ; $43DF: $20 $E9

    ; If inside the color dungeon ($FF),
    ; lookup for dungeon $0F in the table instead.
    ldh  a, [hMapId]                              ; $43E1: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $43E3: $FE $FF
    jr   nz, .colorDungeonIndexEnd                ; $43E5: $20 $02
    ld   a, $0F                                   ; $43E7: $3E $0F
.colorDungeonIndexEnd

    ; Lookup the minimap layout for the dungeon in a
    ld   e, a                                     ; $43E9: $5F
    ld   d, $00                                   ; $43EA: $16 $00
    ld   hl, MinimapLayoutTable                   ; $43EC: $21 $85 $43
    add  hl, de                                   ; $43EF: $19
    ld   a, [hl]                                  ; $43F0: $7E
    ld   [wMinimapLayout], a                      ; $43F1: $EA $B0 $DB

    ldh  a, [hMapId]                              ; $43F4: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $43F6: $FE $FF
    jr   z, jr_001_440B                           ; $43F8: $28 $11
    cp   MAP_WINDFISHS_EGG                        ; $43FA: $FE $08
    jr   z, jr_001_4425                           ; $43FC: $28 $27
    cp   MAP_CAVE_B                               ; $43FE: $FE $0A
    jr   nc, jr_001_4425                          ; $4400: $30 $23
    cp   MAP_EAGLES_TOWER                         ; $4402: $FE $06
    jr   nz, jr_001_440B                          ; $4404: $20 $05
    ldh  a, [hIsSideScrolling]                    ; $4406: $F0 $F9
    and  a                                        ; $4408: $A7
    jr   nz, jr_001_4425                          ; $4409: $20 $1A

jr_001_440B::
    call func_001_5511                            ; $440B: $CD $11 $55
    ld   a, $07                                   ; $440E: $3E $07
    ld   [wBGMapToLoad], a                        ; $4410: $EA $FF $D6
    ret                                           ; $4413: $C9

jr_001_4414::
    ld   a, $02                                   ; $4414: $3E $02
    ld   [wBGMapToLoad], a                        ; $4416: $EA $FF $D6
    call GetRandomByte                            ; $4419: $CD $0D $28
    ld   hl, hFrameCounter                        ; $441C: $21 $E7 $FF
    or   [hl]                                     ; $441F: $B6
    and  $03                                      ; $4420: $E6 $03
    ldh  [hFFB9], a                               ; $4422: $E0 $B9
    ret                                           ; $4424: $C9

jr_001_4425::
    ld   a, $09                                   ; $4425: $3E $09
    ld   [wBGMapToLoad], a                        ; $4427: $EA $FF $D6
    ret                                           ; $442A: $C9

GameplayWorldSubtype1Handler::
    call ClearLowerWRAM                           ; $442B: $CD $C6 $29
    xor  a                                        ; $442E: $AF
    ld   [wLinkMotionState], a                    ; $442F: $EA $1C $C1
    call IncrementGameplaySubtype                 ; $4432: $CD $D6 $44
    ld   a, [wMapEntrancePositionX]               ; $4435: $FA $9D $DB
    ldh  [hLinkPositionX], a                      ; $4438: $E0 $98
    ld   [wLinkMapEntryPositionX], a              ; $443A: $EA $B1 $DB
    ld   a, [wMapEntrancePositionY]               ; $443D: $FA $9E $DB
    ldh  [hLinkPositionY], a                      ; $4440: $E0 $99
    ld   [wLinkMapEntryPositionY], a              ; $4442: $EA $B2 $DB
    ld   a, [wDBC8]                               ; $4445: $FA $C8 $DB
    ldh  [hLinkPositionZHigh], a                      ; $4448: $E0 $A2
    and  a                                        ; $444A: $A7
    jr   z, jr_001_4452                           ; $444B: $28 $05
    ld   a, $02                                   ; $444D: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $444F: $EA $46 $C1

jr_001_4452::
    ld   a, $04                                   ; $4452: $3E $04
    ld   [wRoomTransitionDirection], a            ; $4454: $EA $25 $C1
    call LoadRoom                                 ; $4457: $CD $F4 $30
    call LoadRoomEntities                         ; $445A: $CD $FE $37
    call CreateFollowingNpcEntity                 ; $445D: $CD $B3 $5F
    ld   a, $FF                                   ; $4460: $3E $FF
    ldh  [hAnimatedTilesFrameCount], a            ; $4462: $E0 $A6
    ld   a, [wIsIndoor]                           ; $4464: $FA $A5 $DB
    and  a                                        ; $4467: $A7
    jr   z, jr_001_44A6                           ; $4468: $28 $3C
    ld   d, a                                     ; $446A: $57
    ldh  a, [hMapId]                              ; $446B: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $446D: $FE $FF
    jr   nz, jr_001_4475                          ; $446F: $20 $04
    ld   d, $00                                   ; $4471: $16 $00
    jr   jr_001_447E                              ; $4473: $18 $09

jr_001_4475::
    cp   $1A                                      ; $4475: $FE $1A
    jr   nc, jr_001_447E                          ; $4477: $30 $05
    cp   $06                                      ; $4479: $FE $06
    jr   c, jr_001_447E                           ; $447B: $38 $01
    inc  d                                        ; $447D: $14

jr_001_447E::
    ldh  a, [hMapRoom]                            ; $447E: $F0 $F6
    ld   e, a                                     ; $4480: $5F
    call GetChestsStatusForRoom_trampoline        ; $4481: $CD $ED $29
    cp   $1A                                      ; $4484: $FE $1A
    jr   z, jr_001_4495                           ; $4486: $28 $0D
    cp   $19                                      ; $4488: $FE $19
    jr   z, jr_001_4495                           ; $448A: $28 $09
    ld   a, [wRoomEvent]                          ; $448C: $FA $8E $C1
    and  EVENT_EFFECT_MASK                        ; $448F: $E6 $E0
    cp   EFFECT_DROP_KEY                          ; $4491: $FE $80
    jr   nz, jr_001_44A6                          ; $4493: $20 $11

jr_001_4495::
    ld   a, [$DBCD]                               ; $4495: $FA $CD $DB
    and  a                                        ; $4498: $A7
    jr   z, jr_001_44A6                           ; $4499: $28 $0B
    ldh  a, [hRoomStatus]                         ; $449B: $F0 $F8
    and  $10                                      ; $449D: $E6 $10
    jr   nz, jr_001_44A6                          ; $449F: $20 $05
    ld   a, $0C                                   ; $44A1: $3E $0C
    ld   [wCompassSfxCountdown], a                ; $44A3: $EA $62 $D4

jr_001_44A6::
    ld   a, [wIsIndoor]                           ; $44A6: $FA $A5 $DB
    and  a                                        ; $44A9: $A7
    ld   a, $06                                   ; $44AA: $3E $06
    jr   nz, jr_001_44B0                          ; $44AC: $20 $02
    ld   a, $07                                   ; $44AE: $3E $07

jr_001_44B0::
    ld   [wTilesetToLoad], a                      ; $44B0: $EA $FE $D6
    ret                                           ; $44B3: $C9

GameplayWorldSubtype2Handler::
    ld   a, $0F                                   ; $44B4: $3E $0F
    ldh  [hWorldTileset], a                       ; $44B6: $E0 $94
    ldh  a, [hIsGBC]                              ; $44B8: $F0 $FE
    and  a                                        ; $44BA: $A7
    jr   z, jr_001_44C9                           ; $44BB: $28 $0C
    di                                            ; $44BD: $F3
    ld   a, $03                                   ; $44BE: $3E $03
    ld   [rSVBK], a                               ; $44C0: $E0 $70
    xor  a                                        ; $44C2: $AF
    ld   [wIsFileSelectionArrowShifted], a                               ; $44C3: $EA $00 $D0
    ld   [rSVBK], a                               ; $44C6: $E0 $70
    ei                                            ; $44C8: $FB

jr_001_44C9::
    call SelectRoomTilesets                       ; $44C9: $CD $1E $0D

    xor  a                                        ; $44CC: $AF
    ldh  [hNeedsUpdatingBGTiles], a               ; $44CD: $E0 $90
    ldh  [hNeedsUpdatingEnnemiesTiles], a         ; $44CF: $E0 $91

    ld   a, TILESET_ROOM_SPECIFIC                 ; $44D1: $3E $09
    ld   [wTilesetToLoad], a                      ; $44D3: $EA $FE $D6

IncrementGameplaySubtype::
IncrementGameplaySubtypeAndReturn::
    ld   hl, wGameplaySubtype                     ; $44D6: $21 $96 $DB
    inc  [hl]                                     ; $44D9: $34
    ret                                           ; $44DA: $C9

GameplayWorldSubtype3Handler::
    ld   a, $01                                   ; $44DB: $3E $01
    ld   [wTilesetToLoad], a                      ; $44DD: $EA $FE $D6
    ld   a, [wRoomSwitchableObject]               ; $44E0: $FA $FA $D6
    and  a                                        ; $44E3: $A7
    jr   z, jr_001_44F5                           ; $44E4: $28 $0F
    ld   a, $05                                   ; $44E6: $3E $05
    ld   [$D6F8], a                               ; $44E8: $EA $F8 $D6
    ld   a, [wC1CB]                               ; $44EB: $FA $CB $C1
    and  a                                        ; $44EE: $A7
    jr   z, jr_001_44F5                           ; $44EF: $28 $04
    ld   a, $03                                   ; $44F1: $3E $03
    ldh  [hFFA5], a                               ; $44F3: $E0 $A5

jr_001_44F5::
    call IncrementGameplaySubtype                 ; $44F5: $CD $D6 $44
    ret                                           ; $44F8: $C9

GameplayWorldSubtype4Handler::
IF __PATCH_A__ == 1
    call IncrementGameplaySubtype
    ld a, [ROM_DebugTool2]
    and a
    ret nz
    call LoadHeartsAndRuppeesCount
ELIF __PATCH_A__ == 2
    call IncrementGameplaySubtype
    call LoadHeartsAndRuppeesCount
ELSE
    call LoadHeartsAndRuppeesCount                ; $44F9: $CD $3F $3E
    call IncrementGameplaySubtype                 ; $44FC: $CD $D6 $44
ENDC
    ret                                           ; $44FF: $C9

GameplayWorldSubtype5Handler::
IF __PATCH_A__ == 1
    call IncrementGameplaySubtype
    ld a, [ROM_DebugTool2]
    and a
    ret nz
    call label_3E5A
ELIF __PATCH_A__ == 2
    call IncrementGameplaySubtype
    call label_3E5A
ELSE
    call label_3E5A                               ; $4500: $CD $5A $3E
    call IncrementGameplaySubtype                 ; $4503: $CD $D6 $44
ENDC
    ret                                           ; $4506: $C9

GameplayWorldSubtype6Handler::
    call func_001_5895                            ; $4507: $CD $95 $58
    ld   a, [$FF40]                               ; $450A: $F0 $40
    or   $20                                      ; $450C: $F6 $20
    ld   [wLCDControl], a                         ; $450E: $EA $FD $D6
    ld   [rLCDC], a                               ; $4511: $E0 $40
    call IncrementGameplaySubtype                 ; $4513: $CD $D6 $44
    ld   a, [wLinkMotionState]                    ; $4516: $FA $1C $C1
    ld   [wD463], a                               ; $4519: $EA $63 $D4
    ld   a, $04                                   ; $451C: $3E $04
    ld   [wLinkMotionState], a                    ; $451E: $EA $1C $C1
    xor  a                                        ; $4521: $AF
    ld   [wTransitionSequenceCounter], a                               ; $4522: $EA $6B $C1
    ld   [wC16C], a                               ; $4525: $EA $6C $C1
    ld   a, [wObjectAffectingBGPalette]           ; $4528: $FA $CB $C3
    and  a                                        ; $452B: $A7
    jr   z, jr_001_4548                           ; $452C: $28 $1A
    ld   a, [wC5AD]                               ; $452E: $FA $AD $C5
    ld   [wBGPalette], a                          ; $4531: $EA $97 $DB
    ld   a, $1C                                   ; $4534: $3E $1C
    ld   [wOBJ0Palette], a                        ; $4536: $EA $98 $DB
    ld   a, $E4                                   ; $4539: $3E $E4
    ld   [wOBJ1Palette], a                        ; $453B: $EA $99 $DB
    ldh  a, [hIsGBC]                              ; $453E: $F0 $FE
    and  a                                        ; $4540: $A7
    jr   nz, jr_001_4548                          ; $4541: $20 $05
    ld   a, $04                                   ; $4543: $3E $04
    ld   [wTransitionSequenceCounter], a                               ; $4545: $EA $6B $C1

jr_001_4548::
    jp   label_27DD                               ; $4548: $C3 $DD $27
    ldh  a, [hJoypadState]                        ; $454B: $F0 $CC
    and  J_A | J_START                                      ; $454D: $E6 $90
    jp   z, TransitionReturn                      ; $454F: $CA $66 $46

TransitionToFileMenu::
    ld   [wForceFileSelectionScreenMusic], a      ; $4552: $EA $7B $D4

label_001_4555::
    call EnableExternalRAMWriting                 ; $4555: $CD $D0 $27
    ld   a, [$A454]                               ; $4558: $FA $54 $A4
    ld   [wDB80], a                               ; $455B: $EA $80 $DB
    call EnableExternalRAMWriting                 ; $455E: $CD $D0 $27
    ld   a, [$A455]                               ; $4561: $FA $55 $A4
    ld   [wDB80+1], a                               ; $4564: $EA $81 $DB
    call EnableExternalRAMWriting                 ; $4567: $CD $D0 $27
    ld   a, [$A456]                               ; $456A: $FA $56 $A4
    ld   [wDB80+2], a                               ; $456D: $EA $82 $DB
    call EnableExternalRAMWriting                 ; $4570: $CD $D0 $27
    ld   a, [$A457]                               ; $4573: $FA $57 $A4
    ld   [wDB80+3], a                               ; $4576: $EA $83 $DB
    call EnableExternalRAMWriting                 ; $4579: $CD $D0 $27
    ld   a, [$A458]                               ; $457C: $FA $58 $A4
    ld   [wDB80+4], a                               ; $457F: $EA $84 $DB
    call EnableExternalRAMWriting                 ; $4582: $CD $D0 $27
    ld   a, [$A45F]                               ; $4585: $FA $5F $A4
    ld   [wDC06], a                               ; $4588: $EA $06 $DC
    call EnableExternalRAMWriting                 ; $458B: $CD $D0 $27
    ld   a, [$A460]                               ; $458E: $FA $60 $A4
    ld   [wDC09], a                               ; $4591: $EA $09 $DC
    call EnableExternalRAMWriting                 ; $4594: $CD $D0 $27
    ld   a, [$A45C]                               ; $4597: $FA $5C $A4
    ld   [wFile1DeathCountHigh], a                ; $459A: $EA $00 $DC
    call EnableExternalRAMWriting                 ; $459D: $CD $D0 $27
    ld   a, [$A45D]                               ; $45A0: $FA $5D $A4
    ld   [wFile1DeathCountLow], a                 ; $45A3: $EA $01 $DC
    call EnableExternalRAMWriting                 ; $45A6: $CD $D0 $27
    ld   a, [$A801]                               ; $45A9: $FA $01 $A8
    ld   [wDB85], a                               ; $45AC: $EA $85 $DB
    call EnableExternalRAMWriting                 ; $45AF: $CD $D0 $27
    ld   a, [$A802]                               ; $45B2: $FA $02 $A8
    ld   [wDB85+1], a                               ; $45B5: $EA $86 $DB
    call EnableExternalRAMWriting                 ; $45B8: $CD $D0 $27
    ld   a, [$A803]                               ; $45BB: $FA $03 $A8
    ld   [wDB85+2], a                               ; $45BE: $EA $87 $DB
    call EnableExternalRAMWriting                 ; $45C1: $CD $D0 $27
    ld   a, [$A804]                               ; $45C4: $FA $04 $A8
    ld   [wDB85+3], a                               ; $45C7: $EA $88 $DB
    call EnableExternalRAMWriting                 ; $45CA: $CD $D0 $27
    ld   a, [$A805]                               ; $45CD: $FA $05 $A8
    ld   [wDB85+4], a                               ; $45D0: $EA $89 $DB
    call EnableExternalRAMWriting                 ; $45D3: $CD $D0 $27
    ld   a, [$A80C]                               ; $45D6: $FA $0C $A8
    ld   [wDC07], a                               ; $45D9: $EA $07 $DC
    call EnableExternalRAMWriting                 ; $45DC: $CD $D0 $27
    ld   a, [$A80D]                               ; $45DF: $FA $0D $A8
    ld   [wDC0A], a                               ; $45E2: $EA $0A $DC
    call EnableExternalRAMWriting                 ; $45E5: $CD $D0 $27
    ld   a, [$A809]                               ; $45E8: $FA $09 $A8
    ld   [wFile2DeathCountHigh], a                ; $45EB: $EA $02 $DC
    call EnableExternalRAMWriting                 ; $45EE: $CD $D0 $27
    ld   a, [$A80A]                               ; $45F1: $FA $0A $A8
    ld   [wFile2DeathCountLow], a                 ; $45F4: $EA $03 $DC
    call EnableExternalRAMWriting                 ; $45F7: $CD $D0 $27
    ld   a, [$ABAE]                               ; $45FA: $FA $AE $AB
    ld   [wDB8A], a                               ; $45FD: $EA $8A $DB
    call EnableExternalRAMWriting                 ; $4600: $CD $D0 $27
    ld   a, [$ABAF]                               ; $4603: $FA $AF $AB
    ld   [wDB8A+1], a                               ; $4606: $EA $8B $DB
    call EnableExternalRAMWriting                 ; $4609: $CD $D0 $27
    ld   a, [$ABB0]                               ; $460C: $FA $B0 $AB
    ld   [wDB8A+2], a                               ; $460F: $EA $8C $DB
    call EnableExternalRAMWriting                 ; $4612: $CD $D0 $27
    ld   a, [$ABB1]                               ; $4615: $FA $B1 $AB
    ld   [wDB8A+3], a                               ; $4618: $EA $8D $DB
    call EnableExternalRAMWriting                 ; $461B: $CD $D0 $27
    ld   a, [$ABB2]                               ; $461E: $FA $B2 $AB
    ld   [wDB8A+4], a                               ; $4621: $EA $8E $DB
    call EnableExternalRAMWriting                 ; $4624: $CD $D0 $27
    ld   a, [$ABB9]                               ; $4627: $FA $B9 $AB
    ld   [wDC08], a                               ; $462A: $EA $08 $DC
    call EnableExternalRAMWriting                 ; $462D: $CD $D0 $27
    ld   a, [$ABBA]                               ; $4630: $FA $BA $AB
    ld   [wDC0B], a                               ; $4633: $EA $0B $DC
    call EnableExternalRAMWriting                 ; $4636: $CD $D0 $27
    ld   a, [$ABB6]                               ; $4639: $FA $B6 $AB
    ld   [wFile3DeathCountHigh], a                ; $463C: $EA $04 $DC
    call EnableExternalRAMWriting                 ; $463F: $CD $D0 $27
    ld   a, [$ABB7]                               ; $4642: $FA $B7 $AB
    ld   [wFile3DeathCountLow], a                 ; $4645: $EA $05 $DC
    ld   a, GAMEPLAY_FILE_SELECT                  ; $4648: $3E $02
    ld   [wGameplayType], a                       ; $464A: $EA $95 $DB
    xor  a                                        ; $464D: $AF
    ld   [wGameplaySubtype], a                    ; $464E: $EA $96 $DB
    xor  a                                        ; $4651: $AF
    ldh  [hBaseScrollY], a                               ; $4652: $E0 $97
    ldh  [hBaseScrollX], a                        ; $4654: $E0 $96
    ld   a, $00                                   ; $4656: $3E $00
    ld   [wBGPalette], a                          ; $4658: $EA $97 $DB
    ld   [wOBJ0Palette], a                        ; $465B: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $465E: $EA $99 $DB
    ld   a, $01                                   ; $4661: $3E $01
    call ClearFileMenuBG_trampoline               ; $4663: $CD $FA $08
TransitionReturn::
    ret                                           ; $4666: $C9
