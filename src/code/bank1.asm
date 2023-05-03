;
; TODO: move these pieces of code to named files
; (instead of the generic "bank1.asm")
;

DebugSaveFileData::
    db INVENTORY_SHIELD          ; B button       ; $4667
    db INVENTORY_SWORD           ; A button       ; $4668
    db INVENTORY_BOMBS           ; Inventory slots ; $4669
    db INVENTORY_POWER_BRACELET  ; .              ; $466A
    db INVENTORY_BOW             ; .              ; $466B
    db INVENTORY_HOOKSHOT        ; .              ; $466C
    db INVENTORY_MAGIC_ROD       ; .              ; $466D
    db INVENTORY_PEGASUS_BOOTS   ; .              ; $466E
    db INVENTORY_OCARINA         ; .              ; $466F
    db INVENTORY_ROCS_FEATHER    ; .              ; $4670
    db INVENTORY_SHOVEL          ; .              ; $4671
    db INVENTORY_MAGIC_POWDER    ; .              ; $4672

    db 1  ; Have Flippers                         ; $4673
    db 1  ; Have Medicine                         ; $4674
    db 1  ; Trading item = Yoshi doll             ; $4675
    db 0  ; 0 Secret Seashells                    ; $4676
    db 0  ; (@TODO "Medicine count: found?")      ; $4677
    db 1  ; Have Tail Key                         ; $4678
    db 1  ; Have Angler Key                       ; $4679
    db 1  ; Have Face Key                         ; $467A
    db 1  ; Have Bird Key                         ; $467B
    db 0  ; 0 Golden Leaves / no Slime Key        ; $467C

    ; Dungeon flags ...
    ;  +-------------- Map
    ;  |  +----------- Compass
    ;  |  |  +-------- Owl Beak / Stone Tablet
    ;  |  |  |  +----- Nightmare Key
    ;  |  |  |  |  +-- Small keys
    ;  |  |  |  |  |
    db 1, 1, 1, 1, 1 ; Tail Cave                  ; $467D
    db 1, 1, 1, 1, 2 ; Bottle Grotto              ; $4682
    db 1, 1, 1, 1, 3 ; Key Cavern                 ; $4687
    db 1, 1, 1, 1, 4 ; Angler's Tunnel            ; $468C
    db 1, 1, 1, 1, 5 ; Catfish's Maw              ; $4691
    db 1, 1, 1, 1, 6 ; Face Shrine                ; $4696
    db 1, 1, 1, 1, 7 ; Eagle's Tower              ; $469B
    db 1, 1, 1, 1, 8 ; Turtle Rock                ; $46A0
    db 1, 1, 1, 1, 9 ; POI: unused? (9th dungeon?) ; $46A5

DEBUG_SAVE_FILE_SIZE equ @ - DebugSaveFileData


; Initialize save files, and load debug save file if needed
InitSaveFiles::
    ; Initialize the battery-backed memory used for save files
    ld   de, SaveGame1 - SaveGame1                ; $46AA: $11 $00 $00
    call func_001_4794                            ; $46AD: $CD $94 $47
    ld   de, SaveGame2 - SaveGame1                ; $46B0: $11 $AD $03
    call func_001_4794                            ; $46B3: $CD $94 $47
    ld   de, SaveGame3 - SaveGame1                ; $46B6: $11 $5A $07
    call func_001_4794                            ; $46B9: $CD $94 $47

    ; POI: If DebugTool1 is enabled,
    ; write a default save file with everything unlocked
    ld   a, [ROM_DebugTool1]                      ; $46BC: $FA $03 $00
    and  a                                        ; $46BF: $A7
    jp   z, .return                               ; $46C0: $CA $93 $47

    ld   e, $00                                   ; $46C3: $1E $00
    ld   d, $00                                   ; $46C5: $16 $00
    ld   bc, SaveGame1.main + wInventoryItems.BButtonSlot - wOverworldRoomStatus ; $46C7: $01 $05 $A4
.loop
    ld   hl, DebugSaveFileData                    ; $46CA: $21 $67 $46
    add  hl, de                                   ; $46CD: $19
    ld   a, [hli]                                 ; $46CE: $2A
    ld   [bc], a                                  ; $46CF: $02
    inc  bc                                       ; $46D0: $03
    inc  e                                        ; $46D1: $1C
    ld   a, e                                     ; $46D2: $7B
    cp   DEBUG_SAVE_FILE_SIZE                     ; $46D3: $FE $43
    jr   nz, .loop                                ; $46D5: $20 $F3

    ; Set some other parts of the first save file ...
    ld   a, $01                                   ; $46D7: $3E $01
    ld   [SaveGame1.main + wSwordLevel - wOverworldRoomStatus], a ; Sword level 1               ; $46D9: $EA $53 $A4
    ld   a, $01                                   ; $46DC: $3E $01
    ld   [SaveGame1.main + wShieldLevel - wOverworldRoomStatus], a ; Shield level 1              ; $46DE: $EA $49 $A4
    ld   a, $02                                   ; $46E1: $3E $02
    ld   [SaveGame1.main + wPowerBraceletLevel - wOverworldRoomStatus], a ; Power bracelet level 2      ; $46E3: $EA $48 $A4

    ; Set boss flags for all dungeons
    ld   hl, SaveGame1.main + wHasInstrument1 - wOverworldRoomStatus ; Dungeon boss flags = 00000010 ; $46E6: $21 $6A $A4
    ld   e, $09 ; POI: Sets 9 flags (but only 8 dungeons...?) ; $46E9: $1E $09
    ld   a, $02 ; Sets 46A~447                    ; $46EB: $3E $02
.drawEmptyHeartsLoop
    ldi  [hl], a                                  ; $46ED: $22
    dec  e                                        ; $46EE: $1D
    jr   nz, .drawEmptyHeartsLoop                 ; $46EF: $20 $FC

    ld   a, DEBUG_SAVE_BOMB_COUNT                 ; $46F1: $3E $60
    ld   [SaveGame1.main + wBombCount - wOverworldRoomStatus], a ; 60 bombs                    ; $46F3: $EA $52 $A4
IF DEBUG_SAVE_SWITCH_ARROWS
    ld   [SaveGame1.main + wMaxBombs - wOverworldRoomStatus], a ; 60 max bombs
    ld   [SaveGame1.main + wMaxArrows - wOverworldRoomStatus], a ; 60 max arrows
ELSE
    ld   [SaveGame1.main + wMaxArrows - wOverworldRoomStatus], a ; 60 max arrows               ; $46F6: $EA $7D $A4
    ld   [SaveGame1.main + wMaxBombs - wOverworldRoomStatus], a ; 60 max bombs                ; $46F9: $EA $7C $A4
ENDC
    ld   [SaveGame1.main + wArrowCount - wOverworldRoomStatus], a ; 60 arrows                   ; $46FC: $EA $4A $A4
    ld   a, DEBUG_SAVE_MAGIC_COUNT                ; $46FF: $3E $40
    ld   [SaveGame1.main + wMaxMagicPowder - wOverworldRoomStatus], a ; 40 max magic powder         ; $4701: $EA $7B $A4
    ld   [SaveGame1.main + wMagicPowderCount - wOverworldRoomStatus], a ; 40 magic powder             ; $4704: $EA $51 $A4
IF !LANG_JP
    ld   a, $89                                   ; $4707: $3E $89
    ld   [SaveGame1.main + wDB47 - wOverworldRoomStatus], a ; "time/animation?" (unknown) ; $4709: $EA $4C $A4
ENDC
    xor  a                                        ; $470C: $AF
    ld   [SaveGame1.main + wSeashellsCount - wOverworldRoomStatus], a ; 0 secret seashells          ; $470D: $EA $14 $A4
    ld   a, %00000111 ; @TODO Ocarina song constants? ; $4710: $3E $07
    ld   [SaveGame1.main + wOcarinaSongFlags - wOverworldRoomStatus], a ; all 3 Ocarina songs         ; $4712: $EA $4E $A4
    ld   a, $05                                   ; $4715: $3E $05
    ld   [SaveGame1.main + wRupeeCountHigh - wOverworldRoomStatus], a ; 5xx rupees                  ; $4717: $EA $62 $A4
    ld   a, $09                                   ; $471A: $3E $09
    ld   [SaveGame1.main + wRupeeCountLow - wOverworldRoomStatus], a ; x09 rupees                  ; $471C: $EA $63 $A4
    ld   a, $01                                   ; $471F: $3E $01
    ld   [SaveGame1.main + wDB48 - wOverworldRoomStatus], a ; "Tarin at home flag"        ; $4721: $EA $4D $A4
    ld   a, $50                                   ; $4724: $3E $50
    ld   [SaveGame1.main + wHealth - wOverworldRoomStatus], a ; 10 hearts of health         ; $4726: $EA $5F $A4
    ld   a, $0A                                   ; $4729: $3E $0A
    ld   [SaveGame1.main + wMaxHearts - wOverworldRoomStatus], a ; 10 heart containers         ; $472B: $EA $60 $A4

    ld   a, [wGameplayType]                       ; $472E: $FA $95 $DB
    cp   GAMEPLAY_FILE_NEW                        ; $4731: $FE $03
    jr   z, .notOnNewFileScreen                   ; $4733: $28 $19

    ; Set save file name; "ZELDA" in NA, "えすばはら" in JP
    ; POI: "えすばはら" = "Esubahara" - possibly Takamitsu Kuzuhara?
    ; (credited as "Programmer")
INDEX = 0
REPT 5
    ld   a, CHARSUB("{DEBUG_SAVE_FILE_NAME}", INDEX + 1) + 1
    ld   [SaveGame1.main + wName - wOverworldRoomStatus + INDEX], a
INDEX = INDEX + 1
ENDR

.notOnNewFileScreen
    xor  a                                        ; $474E: $AF
    ld   [SaveGame1.main + wDeathCount - wOverworldRoomStatus], a ; death counter = 0           ; $474F: $EA $5C $A4
    ld   [SaveGame1.main + wDeathCount + 1 - wOverworldRoomStatus], a ; death counter = 0           ; $4752: $EA $5D $A4
    ld   [SaveGame1.main + wIsBowWowFollowingLink - wOverworldRoomStatus], a ; bowwow flag = off           ; $4755: $EA $5B $A4
    ld   [SaveGame1.main + wSpawnIsIndoor - wOverworldRoomStatus], a ; current map = overworld     ; $4758: $EA $64 $A4
    ld   [SaveGame1.main + wSpawnMapId - wOverworldRoomStatus], a ; current submap = none       ; $475B: $EA $65 $A4
    ld   a, $92                                   ; $475E: $3E $92
    ld   [SaveGame1.main + wSpawnMapRoom - wOverworldRoomStatus], a ; saved room = flying rooster in mabe village ; $4760: $EA $66 $A4
    ld   a, $48                                   ; $4763: $3E $48
    ld   [SaveGame1.main + wSpawnPositionX - wOverworldRoomStatus], a ; saved y position            ; $4765: $EA $67 $A4
    ld   a, $62                                   ; $4768: $3E $62
    ld   [SaveGame1.main + wSpawnPositionY - wOverworldRoomStatus], a ; saved x position            ; $476A: $EA $68 $A4

    ; Set all overworld map tiles as seen (80)
    ld   hl, SaveGame1.main                       ; $476D: $21 $05 $A1
    ld   a, $80                                   ; $4770: $3E $80
    ld   e, $00                                   ; $4772: $1E $00
.loop3
    ldi  [hl], a                                  ; $4774: $22
    dec  e                                        ; $4775: $1D
    jr   nz, .loop3                               ; $4776: $20 $FC

    ld   a, $01                                   ; $4778: $3E $01
    ld   [wColorDungeonItemFlags], a              ; $477A: $EA $DA $DD
    ld   [wColorDungeonItemFlags + 1], a          ; $477D: $EA $DB $DD
    ld   [wColorDungeonItemFlags + 2], a          ; $4780: $EA $DC $DD
    ld   [wColorDungeonItemFlags + 3], a          ; $4783: $EA $DD $DD
    ld   [wColorDungeonItemFlags + 4], a          ; $4786: $EA $DE $DD
    ld   a, $FF                                   ; $4789: $3E $FF
    ld   [wPhotos1], a                            ; $478B: $EA $0C $DC
    ld   a, $0F                                   ; $478E: $3E $0F
    ld   [wPhotos2], a                            ; $4790: $EA $0D $DC

.return
    ret                                           ; $4793: $C9

func_001_4794::
    ld   c, $01                                   ; $4794: $0E $01
    ld   b, SAVE_PREFIX_SIZE                      ; $4796: $06 $05
    ld   hl, SaveGame1                            ; $4798: $21 $00 $A1
    add  hl, de                                   ; $479B: $19

.loop_479C
    call EnableSRAM                               ; $479C: $CD $D0 $27
    ld   a, [hli]                                 ; $479F: $2A
    cp   c                                        ; $47A0: $B9
    jr   nz, .jr_47AA                             ; $47A1: $20 $07
    inc  c                                        ; $47A3: $0C
    inc  c                                        ; $47A4: $0C
    dec  b                                        ; $47A5: $05
    jr   nz, .loop_479C                           ; $47A6: $20 $F4
    jr   ret_001_47CD                             ; $47A8: $18 $23

.jr_47AA::
    push de                                       ; $47AA: $D5
    ; hl = savefile
    ld   hl, SaveGame1.main                       ; $47AB: $21 $05 $A1
    add  hl, de                                   ; $47AE: $19

    ; de = sizeof(save)
    ld   de, SaveGame2 - SaveGame1.main           ; $47AF: $11 $A8 $03

.loop_47B2
    call EnableSRAM                               ; $47B2: $CD $D0 $27
    xor  a                                        ; $47B5: $AF
    ldi  [hl], a                                  ; $47B6: $22
    dec  de                                       ; $47B7: $1B
    ld   a, e                                     ; $47B8: $7B
    or   d                                        ; $47B9: $B2
    jr   nz, .loop_47B2                           ; $47BA: $20 $F6
    pop  de                                       ; $47BC: $D1
    ld   hl, SaveGame1                            ; $47BD: $21 $00 $A1
    add  hl, de                                   ; $47C0: $19
    ld   a, $01                                   ; $47C1: $3E $01

    ; Store the sequence 1,3,5,7,9 into the prefix.
.loop_47C3
    call EnableSRAM                               ; $47C3: $CD $D0 $27
    ldi  [hl], a                                  ; $47C6: $22
    inc  a                                        ; $47C7: $3C
    inc  a                                        ; $47C8: $3C
    cp   SAVE_PREFIX_SIZE * 2 + 1                 ; $47C9: $FE $0B
    jr   c, .loop_47C3                            ; $47CB: $38 $F6

ret_001_47CD::
    ret                                           ; $47CD: $C9

include "code/file_menus.asm"

; Table that determines how much health you have after a game over.
; New files always start with 3 hearts / 3 max hearts, but after that
; the health you're provided on respawning depends on your max:
MaxHeartsToStartingHealthTable::
    db  3 FULL_HEARTS  ;  0 heart containers      ; $5295
    db  3 FULL_HEARTS  ;  1 heart container       ; $5296
    db  3 FULL_HEARTS  ;  2 heart containers      ; $5297
    db  3 FULL_HEARTS  ;  3 heart containers      ; $5298
    db  3 FULL_HEARTS  ;  4 heart containers      ; $5299
    db  3 FULL_HEARTS  ;  5 heart containers      ; $529A

    db  5 FULL_HEARTS  ;  6 heart containers      ; $529B
    db  5 FULL_HEARTS  ;  7 heart containers      ; $529C
    db  5 FULL_HEARTS  ;  8 heart containers      ; $529D
    db  5 FULL_HEARTS  ;  9 heart containers      ; $529E

    db  7 FULL_HEARTS  ; 10 heart containers      ; $529F
    db  7 FULL_HEARTS  ; 11 heart containers      ; $52A0
    db  7 FULL_HEARTS  ; 12 heart containers      ; $52A1
    db  7 FULL_HEARTS  ; 13 heart containers      ; $52A2

    db 10 FULL_HEARTS  ; 14 heart containers      ; $52A3

; Main entry point for loading a saved game
LoadSavedFile::
    xor  a                                      ; Can never save in a side-scrolling area ; $52A4: $AF
    ldh  [hIsSideScrolling], a                  ; so make sure that flag is not set ; $52A5: $E0 $F9
    ld   a, [wHealth]                           ; Does the player have any health? ; $52A7: $FA $5A $DB
    and  a                                      ; If yes, skip this ; $52AA: $A7
    jr   nz, .skipHealthReset                     ; $52AB: $20 $0E
    ld   a, [wMaxHearts]                        ; Otherwise, get their max health... ; $52AD: $FA $5B $DB
    ld   e, a                                     ; $52B0: $5F
    ld   d, $00                                   ; $52B1: $16 $00
    ld   hl, MaxHeartsToStartingHealthTable     ; and use it as an index into the table ; $52B3: $21 $95 $52
    add  hl, de                                 ; to provide the starting health value. ; $52B6: $19
    ld   a, [hl]                                  ; $52B7: $7E
    ld   [wHealth], a                             ; $52B8: $EA $5A $DB

.skipHealthReset:
    ld   hl, wDBD1                                ; $52BB: $21 $D1 $DB
    ld   a, [hl]                                  ; $52BE: $7E
    ld   [hl], $00                                ; $52BF: $36 $00
    and  a                                        ; $52C1: $A7
    jr   nz, jr_001_531D                          ; $52C2: $20 $59
    ld   a, [wSaveSlot]                           ; $52C4: $FA $A6 $DB

.jr_52C7::
    sla  a                                        ; $52C7: $CB $27
    ld   e, a                                     ; $52C9: $5F
    ld   d, $00                                   ; $52CA: $16 $00
    ld   hl, SaveGameTable                        ; $52CC: $21 $F8 $49
    add  hl, de                                   ; $52CF: $19
    ld   c, [hl]                                  ; $52D0: $4E
    inc  hl                                       ; $52D1: $23
    ld   b, [hl]                                  ; $52D2: $46
    ld   hl, wOverworldRoomStatus                 ; $52D3: $21 $00 $D8
    ld   de, SAVE_MAIN_SIZE                       ; $52D6: $11 $80 $03

.loopLoadMain
    call EnableSRAM                               ; $52D9: $CD $D0 $27
    ld   a, [bc]                                  ; $52DC: $0A
    inc  bc                                       ; $52DD: $03
    ldi  [hl], a                                  ; $52DE: $22
    dec  de                                       ; $52DF: $1B
    ld   a, e                                     ; $52E0: $7B
    or   d                                        ; $52E1: $B2
    jr   nz, .loopLoadMain                        ; $52E2: $20 $F5

IF __RECALCULATE_MAX_HEARTS__
    ; Clamp max health before loading
    ld   de, wMaxHearts
    ld   hl, wHealth
    ld   a, [de]
    cp   MIN_HEARTS
    jr   nc, .min

    ld   a, MIN_HEARTS

.min:
    cp   MAX_HEARTS
    jr   c, .max

    ld   a, MAX_HEARTS

.max:
    ld   [de], a
    swap a
    srl  a
    cp   [hl]
    jr   nc, .prepareLoadDX1

    ld   [hl], a
ENDC

.prepareLoadDX1:
    ld   hl, wColorDungeonItemFlags               ; $52E4: $21 $DA $DD
    ld   de, SAVE_DX1_SIZE                        ; $52E7: $11 $05 $00

.loopLoadDX1
    call EnableSRAM                               ; $52EA: $CD $D0 $27
    ld   a, [bc]                                  ; $52ED: $0A
    inc  bc                                       ; $52EE: $03
    ldi  [hl], a                                  ; $52EF: $22
    dec  de                                       ; $52F0: $1B
    ld   a, e                                     ; $52F1: $7B
    or   d                                        ; $52F2: $B2
    jr   nz, .loopLoadDX1                         ; $52F3: $20 $F5
    ld   hl, wColorDungeonRoomStatus              ; $52F5: $21 $E0 $DD
    ld   de, SAVE_DX2_SIZE                        ; $52F8: $11 $20 $00

.loopLoadDX2
    call EnableSRAM                               ; $52FB: $CD $D0 $27
    ld   a, [bc]                                  ; $52FE: $0A
    inc  bc                                       ; $52FF: $03
    ldi  [hl], a                                  ; $5300: $22
    dec  de                                       ; $5301: $1B
    ld   a, e                                     ; $5302: $7B
    or   d                                        ; $5303: $B2
    jr   nz, .loopLoadDX2                         ; $5304: $20 $F5
    call EnableSRAM                               ; $5306: $CD $D0 $27
    ld   a, [bc]                                  ; $5309: $0A
    ld   [wTunicType], a                          ; $530A: $EA $0F $DC
    inc  bc                                       ; $530D: $03
    call EnableSRAM                               ; $530E: $CD $D0 $27
    ld   a, [bc]                                  ; $5311: $0A
    ld   [wPhotos1], a                            ; $5312: $EA $0C $DC
    inc  bc                                       ; $5315: $03
    call EnableSRAM                               ; $5316: $CD $D0 $27
    ld   a, [bc]                                  ; $5319: $0A
    ld   [wPhotos2], a                            ; $531A: $EA $0D $DC

jr_001_531D::
    ld   a, GAMEPLAY_WORLD                        ; $531D: $3E $0B
    ld   [wGameplayType], a                       ; $531F: $EA $95 $DB
    xor  a                                        ; $5322: $AF
    ld   [wGameplaySubtype], a                    ; $5323: $EA $96 $DB
    xor  a                                        ; $5326: $AF
    ld   [wLinkMotionState], a                    ; $5327: $EA $1C $C1
    ldh  [hLinkPhysicsModifier], a                ; $532A: $E0 $9C
    ld   [wAddHealthBuffer], a                    ; $532C: $EA $93 $DB
    ld   [wSubtractHealthBuffer], a               ; $532F: $EA $94 $DB
    ld   [wAddRupeeBufferLow], a                  ; $5332: $EA $90 $DB
    ld   [wAddRupeeBufferHigh], a                 ; $5335: $EA $8F $DB
    ld   [wSubstractRupeeBufferLow], a            ; $5338: $EA $92 $DB
    ld   [wSubstractRupeeBufferHigh], a           ; $533B: $EA $91 $DB
    ld   a, [wWreckingBallRoom]                   ; $533E: $FA $6F $DB
    and  a                                        ; $5341: $A7
    jr   nz, .setStartingPoint                    ; $5342: $20 $0F
    ld   a, $16                                   ; $5344: $3E $16
    ld   [wWreckingBallRoom], a                   ; $5346: $EA $6F $DB
    ld   a, $50                                   ; $5349: $3E $50
    ld   [wWreckingBallPosX], a                   ; $534B: $EA $70 $DB
    ld   a, $27                                   ; $534E: $3E $27
    ld   [wWreckingBallPosY], a                   ; $5350: $EA $71 $DB

.setStartingPoint
    ld   a, [wSpawnPositionX]                     ; $5353: $FA $62 $DB
    and  a                                        ; $5356: $A7
    jr   z, .initNewGame                          ; $5357: $28 $3B
    ld   [wMapEntrancePositionX], a               ; $5359: $EA $9D $DB

    ld   a, [wSpawnPositionY]                     ; $535C: $FA $63 $DB
    ld   [wMapEntrancePositionY], a               ; $535F: $EA $9E $DB

    ld   a, [wSpawnMapRoom]                       ; $5362: $FA $61 $DB
    ldh  [hMapRoom], a                            ; $5365: $E0 $F6
    ld   [wMapEntranceRoom], a                    ; $5367: $EA $9C $DB

    ld   a, [wSpawnMapId]                         ; $536A: $FA $60 $DB
    ldh  [hMapId], a                              ; $536D: $E0 $F7

    ld   a, [wSpawnIndoorRoom]                    ; $536F: $FA $64 $DB
    ld   [wIndoorRoom], a                         ; $5372: $EA $AE $DB

    xor  a                                        ; $5375: $AF
    ldh  [hIsSideScrolling], a                    ; $5376: $E0 $F9

    ld   a, DIRECTION_DOWN                        ; $5378: $3E $03
    ldh  [hLinkDirection], a                      ; $537A: $E0 $9E

    ld   a, [wSpawnIsIndoor]                      ; $537C: $FA $5F $DB
    and  TRUE                                     ; $537F: $E6 $01
    ld   [wIsIndoor], a                           ; $5381: $EA $A5 $DB

    jr   z, .finish                               ; $5384: $28 $08

    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ; $5386: $3E $04
    ldh  [hLinkAnimationState], a                 ; $5388: $E0 $9D

    ld   a, DIRECTION_UP                          ; $538A: $3E $02
    ldh  [hLinkDirection], a                      ; $538C: $E0 $9E

.finish
    ld   a, TILEMAP_INVENTORY                     ; $538E: $3E $02
    ld   [wBGMapToLoad], a                        ; $5390: $EA $FF $D6
    ret                                           ; $5393: $C9

; Initializes some stuff related to starting a new game
; 30 max arrows, 30 max bombs, 20 max magic powder,
; places you in Marin's room in the bed, etc
.initNewGame
    ld   a, $30                                   ; $5394: $3E $30
    ld   [wMaxArrows], a                          ; $5396: $EA $78 $DB
    ld   a, $30                                   ; $5399: $3E $30
    ld   [wMaxBombs], a                           ; $539B: $EA $77 $DB
    ld   a, $20                                   ; $539E: $3E $20
    ld   [wMaxMagicPowder], a                     ; $53A0: $EA $76 $DB
    ld   a, ROOM_INDOOR_B_MARIN_HOUSE             ; $53A3: $3E $A3
    ld   [wMapEntranceRoom], a                    ; $53A5: $EA $9C $DB
    ldh  [hMapRoom], a                            ; $53A8: $E0 $F6
    ld   [wDB54], a                               ; $53AA: $EA $54 $DB
    ld   a, TRUE                                  ; $53AD: $3E $01
    ld   [wIsIndoor], a                           ; $53AF: $EA $A5 $DB
    ld   a, MAP_HOUSE                             ; $53B2: $3E $10
    ldh  [hMapId], a                              ; $53B4: $E0 $F7
    ld   a, $50                                   ; $53B6: $3E $50
    ld   [wMapEntrancePositionX], a               ; $53B8: $EA $9D $DB
    ld   a, $60                                   ; $53BB: $3E $60
    ld   [wMapEntrancePositionY], a               ; $53BD: $EA $9E $DB
    xor  a                                        ; $53C0: $AF
    ldh  [hLinkAnimationState], a                 ; $53C1: $E0 $9D
    ld   a, DIRECTION_DOWN                        ; $53C3: $3E $03
    ldh  [hLinkDirection], a                      ; $53C5: $E0 $9E
    ld   a, $16                                   ; $53C7: $3E $16
    ld   [wWreckingBallRoom], a                   ; $53C9: $EA $6F $DB
    ld   a, $50                                   ; $53CC: $3E $50
    ld   [wWreckingBallPosX], a                   ; $53CE: $EA $70 $DB
    ld   a, $27                                   ; $53D1: $3E $27
    ld   [wWreckingBallPosY], a                   ; $53D3: $EA $71 $DB
    jr   .finish                                  ; $53D6: $18 $B6

Data_001_53D8::
    db   $9D, $9D, $9D, $FF, $9D, $9D, $9D, $FF   ; $53D8 ; $53D8
    db   $9D, $9D, $9C, $FF, $9D, $9D, $9C, $FF   ; $53E0 ; $53E0

Data_001_53E8::
    db   $32, $32, $09, $FF, $2E, $2E, $09, $FF   ; $53E8 ; $53E8
    db   $8A, $32, $E9, $FF, $8A, $2E, $E9, $FF   ; $53F0 ; $53F0

Data_001_53F8::
    db   $C8, $C8, $00, $FF, $C8, $C8, $00, $FF   ; $53F8 ; $53F8
    db   $48, $C8, $00, $FF, $48, $C8, $00, $FF   ; $5400 ; $5400

Data_001_5408::
    db   $7F, $7F, $BA, $FF, $7F, $7F, $BA, $FF   ; $5408 ; $5408
    db   $7F, $7F, $BA, $FF, $7F, $7F, $BA, $FF   ; $5410 ; $5410

;
; Series of three tables:
; HIGH
; LOW
; TILE
; Unsure of exact method this is read by, but used by subscreen dungeon map layouts.
; Contains some changes based on language for the (unused) floor markers
;
Data_001_5418::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $5418 ; $5418
    db   $9D, $9D, $FF, $00, $9D, $9D, $9D, $FF   ; $5420 ; $5420
    db   $9D, $9C, $FF, $00, $9D, $9C, $9C, $FF   ; $5428 ; $5428
    db   $9D, $9D, $9C, $9C, $FF, $00, $00, $00   ; $5430 ; $5430
    db   $00, $00, $00, $9D, $9D, $9C, $9C, $9C   ; $5438 ; $5438
    db   $9C, $FF, $00, $00, $00, $00, $9D, $9D   ; $5440 ; $5440
    db   $9C, $9C, $9D, $9D, $9C, $9C, $FF, $00   ; $5448 ; $5448
    db   $00, $9D, $9D, $9C, $9C, $9D, $9D, $9C   ; $5450 ; $5450
    db   $9C, $9C, $9C, $FF                       ; $5458 ; $5458

Data_001_545C::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $545C ; $545C
    db   $0D, $12, $FF, $00, $0D, $11, $12, $FF   ; $5464 ; $5464
    db   $92, $F2, $FF, $00, $92, $F1, $F2, $FF   ; $546C ; $546C
    db   $8D, $92, $ED, $F2, $FF, $00, $00, $00   ; $5474 ; $5474
    db   $00, $00, $00, $8D, $92, $ED, $F2, $F1   ; $547C ; $547C
    db   $F2, $FF, $00, $00, $00, $00, $8D, $92   ; $5484 ; $5484
    db   $ED, $F2, $91, $92, $F1, $F2, $FF, $00   ; $548C ; $548C
    db   $00, $8D, $92, $ED, $F2, $91, $92, $EC   ; $5494 ; $5494
    db   $ED, $F1, $F2, $FF                       ; $549C ; $549C

Data_001_54A0::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $54A0 ; $54A0
    db   $E8, $E9, $FF, $00, $E8, MINIMAP_VAR_0, MINIMAP_VAR_1, $FF   ; $54A8 ; $54A8
    db   $E8, $E9, $FF, $00, $E8, $EC, MINIMAP_VAR_2, $FF   ; $54B0 ; $54B0
    db   $E8, $EA, $E9, $EB, $FF, $00, $00, $00   ; $54B8 ; $54B8
    db   $00, $00, $00, $E8, $EA, $E9, $EB, $EC   ; $54C0 ; $54C0
    db   $E8, $FF, $00, $00, $00, $00, $E8, $EA   ; $54C8 ; $54C8
    db   $E9, $EB, $EC, $E8, $EC, $E9, $FF, $00   ; $54D0 ; $54D0
    db   $00, $E8, $EA, $E9, $EB, $EC, $E8, $EC   ; $54D8 ; $54D8
    db   $EA, $EC, $E9, $FF                       ; $54E0 ; $54E0

; Addresses of where to write the dungeon numeral on the subscreen
; (that is, the number part of "L-?", next to the dungeon map)
; First address: used for most maps
; Second address: used when the minimap is split (e.g. Eagle's Tower)
Data_001_54E4::
    db   HIGH(vBGMap1 + $10A), HIGH(vBGMap1 + $EA) ; $54E4

Data_001_54E6::
    db   LOW(vBGMap1 + $10A), LOW(vBGMap1 + $EA)  ; $54E6

Data_001_54E8::
    db $9C, $E9, $49, $7F, $9D, $09, $49, $7F, $9D, $29, $49, $7F, $9D, $49, $49, $7F ; $54E8
    db $9D, $69, $49, $7F, $9D, $89, $49, $7F, $9D, $A9, $49, $7F, $9D, $C9, $49, $7F ; $54F8
    db $9D, $E9, $49, $7F, $9E, $09, $49, $7F, $00 ; $5508

; Create an in-memory tilemap of the dungeon minimap,
; plus the place the "L-?" dungeon label and entrance arrow.
;
; As this depends on which dungeon, this tilemap is built dynamically.
;
; This tilemap is copied to VRAM later, using the wBGMapToLoad variable.
; See data/backgrounds/tilemap_pointers.asm
CreateMinimapTilemap::
    ; Copy $29 bytes from Data_001_54E8 to wMinimapTilemap
    ; (wMinimapTilemap is normally in the middle of wDrawCommand.data - but is here used as some temporary free memory
    ; to store the tilemap)
    ;
    ; This will later be used by the BGMapToLoad 7 (see tilemaps_pointers.asm)
    ld   hl, Data_001_54E8                        ; $5511: $21 $E8 $54
    ld   de, wMinimapTilemap - 1                  ; $5514: $11 $50 $D6
    ld   c, $29                                   ; $5517: $0E $29
.copyLoop
    ld   a, [hli]                                 ; $5519: $2A
    inc  de                                       ; $551A: $13
    ld   [de], a                                  ; $551B: $12
    dec  c                                        ; $551C: $0D
    jr   nz, .copyLoop                            ; $551D: $20 $FA

    push de                                       ; $551F: $D5
    xor  a                                        ; $5520: $AF
    ldh  [hMultiPurpose0], a                      ; $5521: $E0 $D7
    ldh  [hMultiPurpose1], a                      ; $5523: $E0 $D8
    ldh  [hMultiPurpose2], a                      ; $5525: $E0 $D9
    ldh  [hMultiPurpose3], a                      ; $5527: $E0 $DA
    ld   c, a                                     ; $5529: $4F
    ld   b, a                                     ; $552A: $47
    ld   e, a                                     ; $552B: $5F
    ld   d, a                                     ; $552C: $57
    ld   a, [wMinimapLayout]                      ; $552D: $FA $B0 $DB
    swap a                                        ; $5530: $CB $37
    and  $03                                      ; $5532: $E6 $03
    ld   e, a                                     ; $5534: $5F
    and  a                                        ; $5535: $A7
    jr   z, .jr_001_5543                          ; $5536: $28 $0B

.loop
    ld   a, c                                     ; $5538: $79
    add  a, $04                                   ; $5539: $C6 $04
    ld   c, a                                     ; $553B: $4F
    dec  e                                        ; $553C: $1D
    ld   a, e                                     ; $553D: $7B
    and  a                                        ; $553E: $A7
    jr   nz, .loop                                ; $553F: $20 $F7
    ld   b, $00                                   ; $5541: $06 $00

.jr_001_5543
    pop  hl                                       ; $5543: $E1

.drawEmptyHeartsLoop
    push hl                                       ; $5544: $E5
    ld   hl, Data_001_53D8                        ; $5545: $21 $D8 $53
    add  hl, bc                                   ; $5548: $09
    ld   a, [hl]                                  ; $5549: $7E
    ldh  [hMultiPurpose0], a                      ; $554A: $E0 $D7
    ld   hl, Data_001_53E8                        ; $554C: $21 $E8 $53
    add  hl, bc                                   ; $554F: $09
    ld   a, [hl]                                  ; $5550: $7E
    ldh  [hMultiPurpose1], a                      ; $5551: $E0 $D8
    ld   hl, Data_001_53F8                        ; $5553: $21 $F8 $53
    add  hl, bc                                   ; $5556: $09
    ld   a, [hl]                                  ; $5557: $7E
    ldh  [hMultiPurpose2], a                      ; $5558: $E0 $D9
    ld   hl, Data_001_5408                        ; $555A: $21 $08 $54
    add  hl, bc                                   ; $555D: $09
    ld   a, [hl]                                  ; $555E: $7E
    ldh  [hMultiPurpose3], a                      ; $555F: $E0 $DA
    pop  hl                                       ; $5561: $E1
    call func_001_5619                            ; $5562: $CD $19 $56
    push hl                                       ; $5565: $E5
    ld   hl, Data_001_53D8                        ; $5566: $21 $D8 $53
    inc  bc                                       ; $5569: $03
    add  hl, bc                                   ; $556A: $09
    ld   a, [hl]                                  ; $556B: $7E
    pop  hl                                       ; $556C: $E1
    inc  hl                                       ; $556D: $23
    cp   $FF                                      ; $556E: $FE $FF
    jr   nz, .drawEmptyHeartsLoop                 ; $5570: $20 $D2

    xor  a                                        ; $5572: $AF
    ld   [hl], a                                  ; $5573: $77
    xor  a                                        ; $5574: $AF
    ldh  [hMultiPurpose0], a                      ; $5575: $E0 $D7
    ldh  [hMultiPurpose1], a                      ; $5577: $E0 $D8
    ldh  [hMultiPurpose2], a                      ; $5579: $E0 $D9
    ldh  [hMultiPurpose3], a                      ; $557B: $E0 $DA
    ld   c, a                                     ; $557D: $4F
    ld   b, a                                     ; $557E: $47
    ld   e, a                                     ; $557F: $5F
    ld   d, a                                     ; $5580: $57
    ld   a, [wMinimapLayout]                      ; $5581: $FA $B0 $DB
    swap a                                        ; $5584: $CB $37
    and  $03                                      ; $5586: $E6 $03
    ld   e, a                                     ; $5588: $5F
    and  a                                        ; $5589: $A7
    jr   z, .jr_001_55E                           ; $558A: $28 $5E

.loop3
    ld   b, $00                                   ; $558C: $06 $00
    ld   a, c                                     ; $558E: $79
    add  a, $08                                   ; $558F: $C6 $08
    ld   c, a                                     ; $5591: $4F
    dec  e                                        ; $5592: $1D
    ld   a, e                                     ; $5593: $7B
    and  a                                        ; $5594: $A7
    jr   nz, .loop3                               ; $5595: $20 $F5

    ld   a, [wMinimapLayout]                      ; $5597: $FA $B0 $DB
    and  $03                                      ; $559A: $E6 $03
    jr   z, .loop4                                ; $559C: $28 $22
    ld   a, [wMinimapLayout]                      ; $559E: $FA $B0 $DB
    and  $30                                      ; $55A1: $E6 $30
    cp   $30                                      ; $55A3: $FE $30
    jr   z, .jr_001_55AF                          ; $55A5: $28 $08
    ld   a, c                                     ; $55A7: $79
    add  a, $04                                   ; $55A8: $C6 $04
    ld   c, a                                     ; $55AA: $4F
    ld   b, $00                                   ; $55AB: $06 $00
    jr   .loop4                                   ; $55AD: $18 $11

.jr_001_55AF
    ld   a, [wMinimapLayout]                      ; $55AF: $FA $B0 $DB
    and  $03                                      ; $55B2: $E6 $03
    ld   e, a                                     ; $55B4: $5F

.jr_001_55B5
    ld   b, $00                                   ; $55B5: $06 $00
    ld   a, c                                     ; $55B7: $79
    add  a, $0B                                   ; $55B8: $C6 $0B
    ld   c, a                                     ; $55BA: $4F
    dec  e                                        ; $55BB: $1D
    ld   a, e                                     ; $55BC: $7B
    and  a                                        ; $55BD: $A7
    jr   nz, .jr_001_55B5                         ; $55BE: $20 $F5

.loop4
    push hl                                       ; $55C0: $E5
    ld   hl, Data_001_5418                        ; $55C1: $21 $18 $54
    add  hl, bc                                   ; $55C4: $09
    ld   a, [hl]                                  ; $55C5: $7E
    ldh  [hMultiPurpose0], a                      ; $55C6: $E0 $D7
    ld   hl, Data_001_545C                        ; $55C8: $21 $5C $54
    add  hl, bc                                   ; $55CB: $09
    ld   a, [hl]                                  ; $55CC: $7E
    ldh  [hMultiPurpose1], a                      ; $55CD: $E0 $D8
    xor  a                                        ; $55CF: $AF
    ldh  [hMultiPurpose2], a                      ; $55D0: $E0 $D9
    ld   hl, Data_001_54A0                        ; $55D2: $21 $A0 $54
    add  hl, bc                                   ; $55D5: $09
    ld   a, [hl]                                  ; $55D6: $7E
    ldh  [hMultiPurpose3], a                      ; $55D7: $E0 $DA
    pop  hl                                       ; $55D9: $E1
    call func_001_5619 ; ???                      ; $55DA: $CD $19 $56
    push hl                                       ; $55DD: $E5
    ld   hl, Data_001_5418                        ; $55DE: $21 $18 $54
    inc  bc                                       ; $55E1: $03
    add  hl, bc                                   ; $55E2: $09
    ld   a, [hl]                                  ; $55E3: $7E
    pop  hl                                       ; $55E4: $E1
    inc  hl                                       ; $55E5: $23
    cp   $FF                                      ; $55E6: $FE $FF
    jr   nz, .loop4                               ; $55E8: $20 $D6

.jr_001_55E
    xor  a                                        ; $55EA: $AF
    ld   b, a                                     ; $55EB: $47
    ld   c, a                                     ; $55EC: $4F
    ld   a, [wMinimapLayout]                      ; $55ED: $FA $B0 $DB
    bit  5, a                                     ; $55F0: $CB $6F
    jr   z, .jr_001_55F5                          ; $55F2: $28 $01
    inc  bc                                       ; $55F4: $03

.jr_001_55F5
    push hl                                       ; $55F5: $E5
    ld   hl, Data_001_54E4                        ; $55F6: $21 $E4 $54
    add  hl, bc                                   ; $55F9: $09
    ld   a, [hl]                                  ; $55FA: $7E
    ldh  [hMultiPurpose0], a                      ; $55FB: $E0 $D7
    ld   hl, Data_001_54E6                        ; $55FD: $21 $E6 $54
    add  hl, bc                                   ; $5600: $09
    ld   a, [hl]                                  ; $5601: $7E
    ldh  [hMultiPurpose1], a                      ; $5602: $E0 $D8
    ld   a, $01                                   ; $5604: $3E $01
    ldh  [hMultiPurpose2], a                      ; $5606: $E0 $D9
    ldh  a, [hMapId]                              ; $5608: $F0 $F7
    add  a, $B1                                   ; $560A: $C6 $B1
    ldh  [hMultiPurpose3], a                      ; $560C: $E0 $DA
    pop  hl                                       ; $560E: $E1
    call func_001_5619 ;show dungeon map no       ; $560F: $CD $19 $56
IF LANG_JP
    push hl
    pop  hl
ENDC
    inc  hl                                       ; $5612: $23
    ld   a, $7F                                   ; $5613: $3E $7F
    ldi  [hl], a                                  ; $5615: $22
    xor  a                                        ; $5616: $AF
    ld   [hl], a                                  ; $5617: $77
    ret                                           ; $5618: $C9

func_001_5619::
    ldh  a, [hMultiPurpose0]                      ; $5619: $F0 $D7
    ldi  [hl], a                                  ; $561B: $22
    ldh  a, [hMultiPurpose1]                      ; $561C: $F0 $D8
    ldi  [hl], a                                  ; $561E: $22
    ldh  a, [hMultiPurpose2]                      ; $561F: $F0 $D9
    ldi  [hl], a                                  ; $5621: $22
    ldh  a, [hMultiPurpose3]                      ; $5622: $F0 $DA
    ld   [hl], a                                  ; $5624: $77
    ret                                           ; $5625: $C9

include "code/world_map.asm"

PeachPictureStateAHandler::
    call func_6A7C                                ; $5822: $CD $7C $6A

FileSaveFadeOut::
    call func_1A22                                ; $5825: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $5828: $FA $6B $C1
    cp   $04                                      ; $582B: $FE $04
    jr   nz, ret_001_58A7                         ; $582D: $20 $78
    ldh  a, [hIsGBC]                              ; $582F: $F0 $FE
    and  a                                        ; $5831: $A7
    jr   z, jr_001_5854                           ; $5832: $28 $20
    ld   hl, wBGPal1                              ; $5834: $21 $10 $DC
    ld   c, $80                                   ; $5837: $0E $80
    di                                            ; $5839: $F3

.loop_583A
    ld   a, $03                                   ; $583A: $3E $03
    ld   [rSVBK], a                               ; $583C: $E0 $70
    ld   b, [hl]                                  ; $583E: $46
    dec  a                                        ; $583F: $3D
    ld   [rSVBK], a                               ; $5840: $E0 $70
    ld   [hl], b                                  ; $5842: $70
    inc  hl                                       ; $5843: $23
    dec  c                                        ; $5844: $0D
    ld   a, c                                     ; $5845: $79
    and  a                                        ; $5846: $A7
    jr   nz, .loop_583A                           ; $5847: $20 $F1
    ld   a, $03                                   ; $5849: $3E $03
    ld   [rSVBK], a                               ; $584B: $E0 $70
    xor  a                                        ; $584D: $AF
    ld   [wIsFileSelectionArrowShifted], a        ; $584E: $EA $00 $D0
    ld   [rSVBK], a                               ; $5851: $E0 $70
    ei                                            ; $5853: $FB

jr_001_5854::
    ld   a, $01                                   ; $5854: $3E $01
    ld   [wPaletteUnknownE], a                    ; $5856: $EA $D5 $DD
    xor  a                                        ; $5859: $AF
    ld   [wBlockItemUsage], a                     ; $585A: $EA $0A $C5
    ld   [wC116], a                               ; $585D: $EA $16 $C1
    ldh  [hBaseScrollX], a                        ; $5860: $E0 $96
    ldh  [hBaseScrollY], a                        ; $5862: $E0 $97
    ld   [wC167], a                               ; $5864: $EA $67 $C1
    ld   a, $07                                   ; $5867: $3E $07
    ldh  [hVolumeRight], a                        ; $5869: $E0 $A9
    ld   a, $70                                   ; $586B: $3E $70
    ldh  [hVolumeLeft], a                         ; $586D: $E0 $AA
    ld   a, GAMEPLAY_WORLD                        ; $586F: $3E $0B
    ld   [wGameplayType], a                       ; $5871: $EA $95 $DB
    ldh  [hContinueMusicAfterWarp], a             ; $5874: $E0 $BC
    ld   a, GAMEPLAY_WORLD_LOAD_2                 ; $5876: $3E $02
    ld   [wGameplaySubtype], a                    ; $5878: $EA $96 $DB

    ld   a, [wIsIndoor]                           ; $587B: $FA $A5 $DB
    and  a                                        ; $587E: $A7
    ld   a, TILESET_INDOOR                        ; $587F: $3E $06
    jr   nz, .jr_5885                             ; $5881: $20 $02
    ld   a, TILESET_BASE_OVERWORLD_DUP            ; $5883: $3E $07
.jr_5885::
    ld   [wTilesetToLoad], a                      ; $5885: $EA $FE $D6

func_001_5888::
    ld   hl, wRoomTransitionState                 ; $5888: $21 $24 $C1
    ld   e, $00                                   ; $588B: $1E $00

.loop_588D
    xor  a                                        ; $588D: $AF
    ldi  [hl], a                                  ; $588E: $22
    inc  e                                        ; $588F: $1C
    ld   a, e                                     ; $5890: $7B
    cp   $0C                                      ; $5891: $FE $0C
    jr   nz, .loop_588D                           ; $5893: $20 $F8

InitializeInventoryBar::
    ; Set the window to the bottom of the screen
    ld   a, $80                                   ; $5895: $3E $80
    ld   [wWindowY], a                            ; $5897: $EA $9A $DB
    ld   a, $07                                   ; $589A: $3E $07
    ld   [rWX], a                                 ; $589C: $E0 $4B
    ; Set wSubscreenScrollIncrement to be $08 (closing/closed), so it's
    ; ready to be flipped to $F8 if inventory is opened
    ld   a, $08                                   ; $589E: $3E $08
    ld   [wSubscreenScrollIncrement], a           ; $58A0: $EA $50 $C1
    ; Inventory is not currently appearing
    xor  a                                        ; $58A3: $AF
    ld   [wInventoryAppearing], a                 ; $58A4: $EA $4F $C1

ret_001_58A7::
    ret                                           ; $58A7: $C9

func_001_58A8::
    ld   hl, wDynamicOAMBuffer+$6C                ; $58A8: $21 $9C $C0
    ld   a, [wDB54]                               ; $58AB: $FA $54 $DB
    rra                                           ; $58AE: $1F
    and  $78                                      ; $58AF: $E6 $78
    add  a, $18                                   ; $58B1: $C6 $18
    ldi  [hl], a                                  ; $58B3: $22
    ld   a, [wDB54]                               ; $58B4: $FA $54 $DB
    swap a                                        ; $58B7: $CB $37
    rra                                           ; $58B9: $1F
    and  $78                                      ; $58BA: $E6 $78
    add  a, $18                                   ; $58BC: $C6 $18
    ldi  [hl], a                                  ; $58BE: $22
    ld   [hl], $3E                                ; $58BF: $36 $3E
    inc  hl                                       ; $58C1: $23
IF __PATCH_0__
    ldh  a, [hIsGBC]
    and  a
    jr   z, .endIfGBC

    ld   a, $00
    ld   [hl], a
    ldh  a, [hFrameCounter]
    and  $08
    ret  z

    ld   a, $03
    ld   [hl], a
    ret
ENDC

.endIfGBC
    ldh  a, [hFrameCounter]                       ; $58C2: $F0 $E7
    rla                                           ; $58C4: $17
    and  $10                                      ; $58C5: $E6 $10
    ld   [hl], a                                  ; $58C7: $77
    ret                                           ; $58C8: $C9

include "data/dialogs/map.asm"

func_001_5A59::
    ldh  a, [hMapRoom]                            ; $5A59: $F0 $F6
    ld   e, a                                     ; $5A5B: $5F
    ld   d, $00                                   ; $5A5C: $16 $00
    ld   hl, MapSpecialLocationNamesTable         ; $5A5E: $21 $59 $59
    add  hl, de                                   ; $5A61: $19
    ld   e, [hl]                                  ; $5A62: $5E
    ld   hl, MapSpecialLocationNamesLookupTable   ; $5A63: $21 $09 $59
    add  hl, de                                   ; $5A66: $19
    ld   a, [hl]                                  ; $5A67: $7E
    jp   OpenDialogInTable0                       ; $5A68: $C3 $85 $23

Data_001_5A6B::
    db 0, 1, $FF                                  ; $5A6B

Data_001_5A6E::
    db 0, $F0, $10                                ; $5A6E

func_001_5A71::
    ld   a, [wDBB4]                               ; $5A71: $FA $B4 $DB
    ldh  [hMultiPurpose0], a                      ; $5A74: $E0 $D7
    ld   a, [wC1B3]                               ; $5A76: $FA $B3 $C1
    ld   hl, wC1B2                                ; $5A79: $21 $B2 $C1
    or   [hl]                                     ; $5A7C: $B6
    ld   hl, wDialogState                         ; $5A7D: $21 $9F $C1
    or   [hl]                                     ; $5A80: $B6
    jp   nz, label_001_5B3F                       ; $5A81: $C2 $3F $5B
    ldh  a, [hPressedButtonsMask]                 ; $5A84: $F0 $CB
    ld   c, a                                     ; $5A86: $4F
    ld   hl, wC182                                ; $5A87: $21 $82 $C1
    and  $0F                                      ; $5A8A: $E6 $0F
    jr   nz, .jr_5A92                             ; $5A8C: $20 $04
    xor  a                                        ; $5A8E: $AF
    ld   [hl], a                                  ; $5A8F: $77
    jr   jr_001_5A9D                              ; $5A90: $18 $0B

.jr_5A92::
    ld   a, [hl]                                  ; $5A92: $7E
    inc  a                                        ; $5A93: $3C
    ld   [hl], a                                  ; $5A94: $77
    cp   $18                                      ; $5A95: $FE $18
    jr   nz, jr_001_5A9D                          ; $5A97: $20 $04
    ld   [hl], $15                                ; $5A99: $36 $15
    jr   jr_001_5AA0                              ; $5A9B: $18 $03

jr_001_5A9D::
    ldh  a, [hJoypadState]                        ; $5A9D: $F0 $CC
    ld   c, a                                     ; $5A9F: $4F

jr_001_5AA0::
    ld   a, c                                     ; $5AA0: $79
    and  $03                                      ; $5AA1: $E6 $03
    ld   e, a                                     ; $5AA3: $5F
    ld   d, $00                                   ; $5AA4: $16 $00
    ld   hl, Data_001_5A6B                        ; $5AA6: $21 $6B $5A
    add  hl, de                                   ; $5AA9: $19
    ld   a, [wDBB4]                               ; $5AAA: $FA $B4 $DB
    ld   d, a                                     ; $5AAD: $57
    and  $F0                                      ; $5AAE: $E6 $F0
    ld   e, a                                     ; $5AB0: $5F
    ld   a, d                                     ; $5AB1: $7A
    add  a, [hl]                                  ; $5AB2: $86
    and  $0F                                      ; $5AB3: $E6 $0F
    or   e                                        ; $5AB5: $B3
    ld   [wDBB4], a                               ; $5AB6: $EA $B4 $DB
    ld   a, c                                     ; $5AB9: $79
    rra                                           ; $5ABA: $1F
    rra                                           ; $5ABB: $1F
    and  $03                                      ; $5ABC: $E6 $03
    ld   e, a                                     ; $5ABE: $5F
    ld   d, $00                                   ; $5ABF: $16 $00
    ld   hl, Data_001_5A6E                        ; $5AC1: $21 $6E $5A
    add  hl, de                                   ; $5AC4: $19
    ld   a, [wDBB4]                               ; $5AC5: $FA $B4 $DB
    add  a, [hl]                                  ; $5AC8: $86
    ld   hl, hMultiPurpose0                       ; $5AC9: $21 $D7 $FF
    ld   [wDBB4], a                               ; $5ACC: $EA $B4 $DB
    cp   [hl]                                     ; $5ACF: $BE
    jr   z, label_001_5B3F                        ; $5AD0: $28 $6D
    ld   e, a                                     ; $5AD2: $5F
    ld   d, $00                                   ; $5AD3: $16 $00
    ld   hl, wOverworldRoomStatus                 ; $5AD5: $21 $00 $D8
    add  hl, de                                   ; $5AD8: $19
    ld   a, [wC5A2]                               ; $5AD9: $FA $A2 $C5
    and  a                                        ; $5ADC: $A7
    jr   nz, .jr_5AF5                             ; $5ADD: $20 $16
    ld   a, [hl]                                  ; $5ADF: $7E
    and  $FF                                      ; $5AE0: $E6 $FF
    jr   nz, .jr_5AF5                             ; $5AE2: $20 $11
    ld   a, [wFreeMovementMode]                   ; $5AE4: $FA $7B $C1
    and  a                                        ; $5AE7: $A7
    jr   nz, .jr_5AF5                             ; $5AE8: $20 $0B
    ld   a, JINGLE_BUMP                           ; $5AEA: $3E $09
    ldh  [hJingle], a                             ; $5AEC: $E0 $F2
    ldh  a, [hMultiPurpose0]                      ; $5AEE: $F0 $D7
    ld   [wDBB4], a                               ; $5AF0: $EA $B4 $DB
    jr   label_001_5B3F                           ; $5AF3: $18 $4A

.jr_5AF5::
    call MoveSelect.playMoveSelectionJingle       ; $5AF5: $CD $AE $6B
    ld   hl, MapSpecialLocationNamesTable         ; $5AF8: $21 $59 $59
    add  hl, de                                   ; $5AFB: $19
    ld   a, [hl]                                  ; $5AFC: $7E
    and  a                                        ; $5AFD: $A7
    jr   z, jr_001_5B30                           ; $5AFE: $28 $30
    swap a                                        ; $5B00: $CB $37
    and  $07                                      ; $5B02: $E6 $07
    inc  a                                        ; $5B04: $3C
    ld   c, a                                     ; $5B05: $4F
    cp   $01                                      ; $5B06: $FE $01
    jr   nz, .jr_5B19                             ; $5B08: $20 $0F
    ld   a, [wC5A2]                               ; $5B0A: $FA $A2 $C5
    and  a                                        ; $5B0D: $A7
    jr   nz, jr_001_5B30                          ; $5B0E: $20 $20
    ld   hl, wOverworldRoomStatus                 ; $5B10: $21 $00 $D8
    add  hl, de                                   ; $5B13: $19
    ld   a, [hl]                                  ; $5B14: $7E
    and  $20                                      ; $5B15: $E6 $20
    jr   z, jr_001_5B30                           ; $5B17: $28 $17

.jr_5B19::
    ld   a, [wC1B1]                               ; $5B19: $FA $B1 $C1
    and  a                                        ; $5B1C: $A7
    jr   nz, .jr_5B24                             ; $5B1D: $20 $05
    ld   a, $10                                   ; $5B1F: $3E $10
    ld   [wC1B2], a                               ; $5B21: $EA $B2 $C1

.jr_5B24::
    ld   a, c                                     ; $5B24: $79
    ld   [wC1B1], a                               ; $5B25: $EA $B1 $C1
    ld   a, [wDBB4]                               ; $5B28: $FA $B4 $DB
    ld   [wC1B4], a                               ; $5B2B: $EA $B4 $C1
    jr   label_001_5B3F                           ; $5B2E: $18 $0F

jr_001_5B30::
    ld   a, [wC1B1]                               ; $5B30: $FA $B1 $C1
    and  a                                        ; $5B33: $A7
    jr   z, label_001_5B3F                        ; $5B34: $28 $09
    xor  a                                        ; $5B36: $AF
    ld   [wC1B1], a                               ; $5B37: $EA $B1 $C1
    ld   a, $10                                   ; $5B3A: $3E $10
    ld   [wC1B3], a                               ; $5B3C: $EA $B3 $C1

label_001_5B3F::
    ld   hl, wDynamicOAMBuffer+$50                ; $5B3F: $21 $80 $C0
    ld   a, [wDBB4]                               ; $5B42: $FA $B4 $DB
    rra                                           ; $5B45: $1F
    and  $78                                      ; $5B46: $E6 $78
    add  a, $14                                   ; $5B48: $C6 $14
    ld   e, a                                     ; $5B4A: $5F
    ld   a, [wDBB4]                               ; $5B4B: $FA $B4 $DB
    swap a                                        ; $5B4E: $CB $37
    rra                                           ; $5B50: $1F
    and  $78                                      ; $5B51: $E6 $78
    add  a, $14                                   ; $5B53: $C6 $14
    ld   d, a                                     ; $5B55: $57
    ld   a, e                                     ; $5B56: $7B
    ldi  [hl], a                                  ; $5B57: $22
    ld   a, d                                     ; $5B58: $7A
    ldi  [hl], a                                  ; $5B59: $22
    ld   [hl], $F0                                ; $5B5A: $36 $F0
    inc  hl                                       ; $5B5C: $23
    ld   [hl], $00                                ; $5B5D: $36 $00
    inc  hl                                       ; $5B5F: $23
    ld   a, e                                     ; $5B60: $7B
    ldi  [hl], a                                  ; $5B61: $22
    ld   a, d                                     ; $5B62: $7A
    add  a, $08                                   ; $5B63: $C6 $08
    ldi  [hl], a                                  ; $5B65: $22
    ld   [hl], $F0                                ; $5B66: $36 $F0
    inc  hl                                       ; $5B68: $23
    ld   [hl], $20                                ; $5B69: $36 $20
    ldh  a, [hFrameCounter]                       ; $5B6B: $F0 $E7
    and  $10                                      ; $5B6D: $E6 $10
    jr   nz, .ret_5BAC                            ; $5B6F: $20 $3B
    ld   hl, wDynamicOAMBuffer+$58                ; $5B71: $21 $88 $C0
    ld   a, e                                     ; $5B74: $7B
    add  a, $04                                   ; $5B75: $C6 $04
    ldi  [hl], a                                  ; $5B77: $22
    ld   a, d                                     ; $5B78: $7A
    add  a, $F6                                   ; $5B79: $C6 $F6
    ldi  [hl], a                                  ; $5B7B: $22
    ld   a, $F6                                   ; $5B7C: $3E $F6
    ldi  [hl], a                                  ; $5B7E: $22
    ld   a, $00                                   ; $5B7F: $3E $00
    ldi  [hl], a                                  ; $5B81: $22
    ld   a, e                                     ; $5B82: $7B
    add  a, $04                                   ; $5B83: $C6 $04
    ldi  [hl], a                                  ; $5B85: $22
    ld   a, d                                     ; $5B86: $7A
    add  a, $13                                   ; $5B87: $C6 $13
    ldi  [hl], a                                  ; $5B89: $22
    ld   a, $F6                                   ; $5B8A: $3E $F6
    ldi  [hl], a                                  ; $5B8C: $22
    ld   a, $20                                   ; $5B8D: $3E $20
    ldi  [hl], a                                  ; $5B8F: $22
    ld   a, e                                     ; $5B90: $7B
    add  a, $F6                                   ; $5B91: $C6 $F6
    ldi  [hl], a                                  ; $5B93: $22
    ld   a, d                                     ; $5B94: $7A
    add  a, $04                                   ; $5B95: $C6 $04
    ldi  [hl], a                                  ; $5B97: $22
    ld   a, $F8                                   ; $5B98: $3E $F8
    ldi  [hl], a                                  ; $5B9A: $22
    ld   a, $00                                   ; $5B9B: $3E $00
    ldi  [hl], a                                  ; $5B9D: $22
    ld   a, e                                     ; $5B9E: $7B
    add  a, $0B                                   ; $5B9F: $C6 $0B
    ldi  [hl], a                                  ; $5BA1: $22
    ld   a, d                                     ; $5BA2: $7A
    add  a, $04                                   ; $5BA3: $C6 $04
    ldi  [hl], a                                  ; $5BA5: $22
    ld   a, $F8                                   ; $5BA6: $3E $F8
    ldi  [hl], a                                  ; $5BA8: $22
    ld   a, $40                                   ; $5BA9: $3E $40
    ldi  [hl], a                                  ; $5BAB: $22

.ret_5BAC
    ret                                           ; $5BAC: $C9

Data_001_5BAD::
    db $F8, $F8, $F2, 4, $F8, 0, $F4, 4, $F8, 8, $F4, $24, $F8, $10, $F2, $24 ; $5BAD
    db 8, $F8, $F2, $44, 8, 0, $F4, $44, 8, 8, $F4, $64, 8, $10, $F2, $64 ; $5BBD
    db $FA, $FA, $F2, 4, $FA, 2, $F4, 4, $FA, 6, $F4, $24, $FA, $E, $F2, $24 ; $5BCD
    db 6, $FA, $F2, $44, 6, 2, $F4, $44, 6, 6, $F4, $64, 6, $E, $F2, $64 ; $5BDD
    db $FC, $FC, $F2, 4, $FC, 4, $F4, 4, $FC, 4, $F4, $24, $FC, $C, $F2, $24 ; $5BED
    db 4, $FC, $F2, $44, 4, 4, $F4, $44, 4, 4, $F4, $64, 4, $C, $F2, $64 ; $5BFD
    db $FE, $FE, $F2, 4, $FE, 4, $F4, 4, $FE, 4, $F4, $24, $FE, $A, $F2, $24 ; $5C0D
    db 2, $FE, $F2, $44, 2, 4, $F4, $44, 2, 4, $F4, $64, 2, $A, $F2, $64 ; $5C1D

Data_001_5C2D::
    db $20, 1, $22                                ; $5C2D

jr_001_5C30::
    db 1, $24, 6, $26, 6, $28, 7, $2A, 7, $2C, 5, $2E, 5, $2C ; $5C30

jr_001_5C3E::
    db 5, $2E, 5                                  ; $5C3E

Data_001_5C41::
    db $28, $78, $28, $78                         ; $5C41

Data_001_5C45::
    db $28, $28, $78, $78                         ; $5C45

func_001_5C49::
    ld   a, [wEntitiesPhysicsFlagsTable]          ; $5C49: $FA $40 $C3
    push af                                       ; $5C4C: $F5
    call func_001_5C55                            ; $5C4D: $CD $55 $5C
    pop  af                                       ; $5C50: $F1
    ld   [wEntitiesPhysicsFlagsTable], a          ; $5C51: $EA $40 $C3
    ret                                           ; $5C54: $C9

func_001_5C55::
    ld   a, [wC1B3]                               ; $5C55: $FA $B3 $C1
    and  a                                        ; $5C58: $A7
    jr   z, .jr_5C62                              ; $5C59: $28 $07
    dec  a                                        ; $5C5B: $3D
    ld   [wC1B3], a                               ; $5C5C: $EA $B3 $C1
    cpl                                           ; $5C5F: $2F
    jr   jr_001_5C6C                              ; $5C60: $18 $0A

.jr_5C62::
    ld   a, [wC1B2]                               ; $5C62: $FA $B2 $C1
    and  a                                        ; $5C65: $A7
    jr   z, jr_001_5C72                           ; $5C66: $28 $0A
    dec  a                                        ; $5C68: $3D
    ld   [wC1B2], a                               ; $5C69: $EA $B2 $C1

jr_001_5C6C::
    rra                                           ; $5C6C: $1F
    rra                                           ; $5C6D: $1F
    and  $03                                      ; $5C6E: $E6 $03
    jr   jr_001_5C7B                              ; $5C70: $18 $09

jr_001_5C72::
    ld   a, [wC1B1]                               ; $5C72: $FA $B1 $C1
    and  a                                        ; $5C75: $A7
    jp   z, label_001_5D13                        ; $5C76: $CA $13 $5D
    ld   a, $00                                   ; $5C79: $3E $00

jr_001_5C7B::
    ld   [wC1B0], a                               ; $5C7B: $EA $B0 $C1
    ldh  [hActiveEntitySpriteVariant], a          ; $5C7E: $E0 $F1
    ld   a, $00                                   ; $5C80: $3E $00
    ld   [wOAMNextAvailableSlot], a               ; $5C82: $EA $C0 $C3
    ld   a, $08                                   ; $5C85: $3E $08
    ld   [wEntitiesPhysicsFlagsTable], a          ; $5C87: $EA $40 $C3
    ld   a, $00                                   ; $5C8A: $3E $00
    ld   [wActiveEntityIndex], a                  ; $5C8C: $EA $23 $C1
    ldh  [hActiveEntityFlipAttribute], a          ; $5C8F: $E0 $ED
    ld   e, $00                                   ; $5C91: $1E $00
    ld   a, [wC1B4]                               ; $5C93: $FA $B4 $C1
    cp   $70                                      ; $5C96: $FE $70
    jr   c, .jr_5C9C                              ; $5C98: $38 $02
    ld   e, $02                                   ; $5C9A: $1E $02

.jr_5C9C::
    and  $0F                                      ; $5C9C: $E6 $0F
    cp   $08                                      ; $5C9E: $FE $08
    jr   nc, .jr_5CA3                             ; $5CA0: $30 $01
    inc  e                                        ; $5CA2: $1C

.jr_5CA3::
    ld   d, $00                                   ; $5CA3: $16 $00
    ld   hl, Data_001_5C41                        ; $5CA5: $21 $41 $5C
    add  hl, de                                   ; $5CA8: $19
    ld   a, [hl]                                  ; $5CA9: $7E
    ldh  [hActiveEntityPosX], a                   ; $5CAA: $E0 $EE
    ld   hl, Data_001_5C45                        ; $5CAC: $21 $45 $5C
    add  hl, de                                   ; $5CAF: $19
    ld   a, [hl]                                  ; $5CB0: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5CB1: $E0 $EC
    ld   a, [wC1B0]                               ; $5CB3: $FA $B0 $C1
    rla                                           ; $5CB6: $17
    rla                                           ; $5CB7: $17
    rla                                           ; $5CB8: $17
    rla                                           ; $5CB9: $17
    rla                                           ; $5CBA: $17

.jr_5CBB::
    and  $E0                                      ; $5CBB: $E6 $E0

.jr_5CBD::
    ld   e, a                                     ; $5CBD: $5F
    ld   d, $00                                   ; $5CBE: $16 $00
    ld   hl, Data_001_5BAD                        ; $5CC0: $21 $AD $5B
    add  hl, de                                   ; $5CC3: $19
    ld   a, $08                                   ; $5CC4: $3E $08
    ld   [wOAMNextAvailableSlot], a               ; $5CC6: $EA $C0 $C3
    xor  a                                        ; $5CC9: $AF
    ldh  [hActiveEntityTilesOffset], a            ; $5CCA: $E0 $F5
    ld   c, $08                                   ; $5CCC: $0E $08
    call RenderActiveEntitySpritesRect            ; $5CCE: $CD $E6 $3C
    ld   a, [wC1B0]                               ; $5CD1: $FA $B0 $C1
    cp   $00                                      ; $5CD4: $FE $00
    jr   nz, label_001_5D13                       ; $5CD6: $20 $3B
    ld   a, [wC1B1]                               ; $5CD8: $FA $B1 $C1
    dec  a                                        ; $5CDB: $3D
    cp   $80                                      ; $5CDC: $FE $80
    jr   nc, label_001_5D13                       ; $5CDE: $30 $33
    ldh  [hActiveEntitySpriteVariant], a          ; $5CE0: $E0 $F1
    ld   de, wDynamicOAMBuffer                    ; $5CE2: $11 $30 $C0
    ldh  a, [hActiveEntityVisualPosY]             ; $5CE5: $F0 $EC
    ld   [de], a                                  ; $5CE7: $12
    inc  de                                       ; $5CE8: $13
    ldh  a, [hActiveEntityPosX]                   ; $5CE9: $F0 $EE
    ld   [de], a                                  ; $5CEB: $12
    inc  de                                       ; $5CEC: $13
    ldh  a, [hActiveEntitySpriteVariant]          ; $5CED: $F0 $F1
    ld   c, a                                     ; $5CEF: $4F
    ld   b, $00                                   ; $5CF0: $06 $00
    sla  c                                        ; $5CF2: $CB $21
    rl   b                                        ; $5CF4: $CB $10
    sla  c                                        ; $5CF6: $CB $21
    rl   b                                        ; $5CF8: $CB $10
    ld   hl, Data_001_5C2D                        ; $5CFA: $21 $2D $5C
    add  hl, bc                                   ; $5CFD: $09
    ld   a, [hli]                                 ; $5CFE: $2A
    ld   [de], a                                  ; $5CFF: $12
    inc  de                                       ; $5D00: $13
    ld   a, [hli]                                 ; $5D01: $2A
    ld   [de], a                                  ; $5D02: $12
    inc  de                                       ; $5D03: $13
    ldh  a, [hActiveEntityVisualPosY]             ; $5D04: $F0 $EC
    ld   [de], a                                  ; $5D06: $12
    inc  de                                       ; $5D07: $13
    ldh  a, [hActiveEntityPosX]                   ; $5D08: $F0 $EE
    add  a, $08                                   ; $5D0A: $C6 $08
    ld   [de], a                                  ; $5D0C: $12
    inc  de                                       ; $5D0D: $13
    ld   a, [hli]                                 ; $5D0E: $2A
    ld   [de], a                                  ; $5D0F: $12
    inc  de                                       ; $5D10: $13
    ld   a, [hl]                                  ; $5D11: $7E
    ld   [de], a                                  ; $5D12: $12

label_001_5D13::
    ret                                           ; $5D13: $C9

SaveSlot1HeartsDrawData::
    ; First row:
    db  $98 ; wDrawCommand.destinationHigh
    db  $CB ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
    ; Second row:
    db  $98 ; wDrawCommand.destinationHigh
    db  $EB ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
.end
    db  $00

SaveSlot2HeartsDrawData::
    ; First row:
    db  $99 ; wDrawCommand.destinationHigh
    db  $2B ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
    ; Second row:
    db  $99 ; wDrawCommand.destinationHigh
    db  $4B ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
.end
    db  $00

SaveSlot3HeartsDrawData::
    ; First row:
    db  $99 ; wDrawCommand.destinationHigh
    db  $8B ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
    ; Second row:
    db  $99 ; wDrawCommand.destinationHigh
    db  $AB ; wDrawCommand.destinationLow
    db  $06 ; wDrawCommand.length
    db  $7E, $7E, $7E, $7E, $7E, $7E, $7E ; wDrawCommand.data, empty tiles
.end
    db  $00

; Builds a wDrawCommand to draw hearts next to the save files.
;
; Draws one full heart per full heart remaining in the actual health,
; then one full heart if there's half a heart remaining of the actual health,
; then one full heart per empty heart of the max health.
;
; This seems to have originally supported drawing the actual health of the
; player at the time of saving, but the final code (in all revisions of both
; the original game and DX) simply draws full hearts for all Heart Containers.
;
; Arguments:
; - hMultiPurpose2 = Health
; - hMultiPurpose3 = Max health
; - hMultiPurpose4 = Save slot
BuildSaveSlotHeartsDrawCommand::
    ; Set up draw command
    ld   a, [wDrawCommandsSize]                   ; $5D53: $FA $00 $D6
    ld   e, a                                     ; $5D56: $5F
    ld   d, $00                                   ; $5D57: $16 $00
    add  a, SaveSlot1HeartsDrawData.end - SaveSlot1HeartsDrawData ; $5D59: $C6 $14
    ld   [wDrawCommandsSize], a                   ; $5D5B: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $5D5E: $21 $01 $D6
    add  hl, de                                   ; $5D61: $19
    push de                                       ; $5D62: $D5

    ; Select correct save slot
    ld   bc, SaveSlot1HeartsDrawData              ; $5D63: $01 $14 $5D
    ldh  a, [hMultiPurpose4]                      ; $5D66: $F0 $DB
    and  a                                        ; $5D68: $A7
    jr   z, .initCopyDrawDataLoop                 ; $5D69: $28 $0A
    ld   bc, SaveSlot2HeartsDrawData              ; $5D6B: $01 $29 $5D
    cp   $01                                      ; $5D6E: $FE $01
    jr   z, .initCopyDrawDataLoop                 ; $5D70: $28 $03
    ld   bc, SaveSlot3HeartsDrawData              ; $5D72: $01 $3E $5D

.initCopyDrawDataLoop::
    ld   e, $15 ; loop counter                    ; $5D75: $1E $15

.copyDrawDataLoop
    ; Copy draw data to wDrawCommand
    ld   a, [bc]                                  ; $5D77: $0A
    inc  bc                                       ; $5D78: $03
    ldi  [hl], a                                  ; $5D79: $22
    dec  e                                        ; $5D7A: $1D
    jr   nz, .copyDrawDataLoop                    ; $5D7B: $20 $FA

    ; Prepare replacing empty tiles in draw command with hearts
    pop  de                                       ; $5D7D: $D1
    ld   hl, wDrawCommand.data                    ; $5D7E: $21 $04 $D6
    add  hl, de                                   ; $5D81: $19
    ld   c, 0 ; loop counter                      ; $5D82: $0E $00
    ldh  a, [hMultiPurpose2]                      ; $5D84: $F0 $D9
    and  a                                        ; $5D86: $A7
    jr   z, .drawEmptyHeartsLoop                  ; $5D87: $28 $22
    ldh  [hMultiPurpose0], a                      ; $5D89: $E0 $D7

    ; Replace empty tiles in wDrawCommand with heart tiles
    ; corresponding to the save file's max health
.drawFullHeartsLoop::
    ; Decrement health (one heart = 8 health)
    ; to see if there's just half a heart left of it
    ldh  a, [hMultiPurpose0]                      ; $5D8B: $F0 $D7
    sub  a, ONE_HEART                             ; $5D8D: $D6 $08
    ldh  [hMultiPurpose0], a                      ; $5D8F: $E0 $D7
    jr   c, .drawHalfHeart                        ; $5D91: $38 $0F

    ; Draw one full heart
    ld   a, $AE ; Heart tile                      ; $5D93: $3E $AE
    ldi  [hl], a                                  ; $5D95: $22

    ; Increment loop counter
    inc  c                                        ; $5D96: $0C
    ld   a, c                                     ; $5D97: $79
    cp   7                                        ; $5D98: $FE $07
    jr   nz, .drawFullHeartsLoopContinue          ; $5D9A: $20 $04

    ; End of first row (we've drawn 7 hearts),
    ; go to next wDrawCommand.data by skipping the three
    ; bytes of metadata
    ld   a, l                                     ; $5D9C: $7D
    add  a, wDrawCommand.data - wDrawCommand      ; $5D9D: $C6 $03
    ld   l, a                                     ; $5D9F: $6F

.drawFullHeartsLoopContinue::
    jr   .drawFullHeartsLoop                      ; $5DA0: $18 $E9

.drawHalfHeart::
    add  a, ONE_HEART                             ; $5DA2: $C6 $08
    jr   z, .drawEmptyHeartsLoop                  ; $5DA4: $28 $05

    ; Draw full heart; this was presumably originally
    ; the half heart tile $CE
    ld   a, $AE ; Heart tile                      ; $5DA6: $3E $AE
    ldi  [hl], a                                  ; $5DA8: $22
    jr   .nextEmptyHeart                          ; $5DA9: $18 $08

.drawEmptyHeartsLoop::
    ldh  a, [hMultiPurpose3]                      ; $5DAB: $F0 $DA
    cp   c                                        ; $5DAD: $B9
    jr   z, .return                               ; $5DAE: $28 $0F

    ; Draw full heart; this was presumably originally
    ; the empty heart tile $CD
    ld   a, $AE ; Heart tile                      ; $5DB0: $3E $AE
    ldi  [hl], a                                  ; $5DB2: $22

.nextEmptyHeart::
    ; Increment loop counter
    inc  c                                        ; $5DB3: $0C
    ld   a, c                                     ; $5DB4: $79
    cp   7                                        ; $5DB5: $FE $07
    jr   nz, .drawEmptyHeartsLoopContinue         ; $5DB7: $20 $04

    ; End of first row (we've drawn 7 hearts),
    ; go to next wDrawCommand.data by skipping the three
    ; bytes of metadata
    ld   a, l                                     ; $5DB9: $7D
    add  a, wDrawCommand.data - wDrawCommand      ; $5DBA: $C6 $03
    ld   l, a                                     ; $5DBC: $6F

.drawEmptyHeartsLoopContinue::
    jr   .drawEmptyHeartsLoop                     ; $5DBD: $18 $EC

.return::
    ret                                           ; $5DBF: $C9

func_5DC0::
    xor  a                                        ; $5DC0: $AF
    ld   de, wSaveFilesCount                      ; $5DC1: $11 $A7 $DB
    ld   [de], a                                  ; $5DC4: $12
    ld   b, $01                                   ; $5DC5: $06 $01
    ld   c, $00                                   ; $5DC7: $0E $00
    ld   hl, wSaveSlotNames                       ; $5DC9: $21 $80 $DB

jr_001_5DCC::
    ld   a, [hli]                                 ; $5DCC: $2A
    and  a                                        ; $5DCD: $A7
    jr   z, .jr_5DD3                              ; $5DCE: $28 $03
    ld   a, [de]                                  ; $5DD0: $1A
    or   b                                        ; $5DD1: $B0
    ld   [de], a                                  ; $5DD2: $12

.jr_5DD3::
    inc  c                                        ; $5DD3: $0C
    ld   a, c                                     ; $5DD4: $79
    cp   $05                                      ; $5DD5: $FE $05
    jr   nz, .jr_5DDB                             ; $5DD7: $20 $02
    ld   b, $02                                   ; $5DD9: $06 $02

.jr_5DDB::
    cp   $0A                                      ; $5DDB: $FE $0A
    jr   nz, .jr_5DE1                             ; $5DDD: $20 $02
    ld   b, $04                                   ; $5DDF: $06 $04

.jr_5DE1::
    cp   $0F                                      ; $5DE1: $FE $0F
    jr   nz, jr_001_5DCC                          ; $5DE3: $20 $E7
    ret                                           ; $5DE5: $C9

SaveGameToFile::
IF __RECALCULATE_MAX_HEARTS__
    ; Recalculate max health before saving
    call RecalculateMaxHearts
ENDC
    ; Does the player have any health?
    ld   a, [wHealth]                             ; $5DE6: $FA $5A $DB
    and  a                                        ; $5DE9: $A7
    jr   nz, .skipHealthReset                     ; $5DEA: $20 $0E
    ; If not, get the current max health
    ld   a, [wMaxHearts]                          ; $5DEC: $FA $5B $DB
    ld   e, a                                     ; $5DEF: $5F
    ld   d, $00                                   ; $5DF0: $16 $00
    ; and use it as an index into the table
    ld   hl, MaxHeartsToStartingHealthTable       ; $5DF2: $21 $95 $52
    add  hl, de                                   ; $5DF5: $19
    ; to provide the starting health value.
    ld   a, [hl]                                  ; $5DF6: $7E
    ld   [wHealth], a                             ; $5DF7: $EA $5A $DB

.skipHealthReset:
    call SynchronizeDungeonsItemFlags_trampoline  ; $5DFA: $CD $02 $28
    ld   a, [wSaveSlot]                           ; $5DFD: $FA $A6 $DB
    sla  a                                        ; $5E00: $CB $27
    ld   e, a                                     ; $5E02: $5F
    ld   d, $00                                   ; $5E03: $16 $00
    ld   hl, SaveGameTable                        ; $5E05: $21 $F8 $49
    add  hl, de                                   ; $5E08: $19
    ld   a, [hli]                                 ; $5E09: $2A
    ld   h, [hl]                                  ; $5E0A: $66
    ld   l, a                                     ; $5E0B: $6F
    ld   bc, wOverworldRoomStatus                 ; $5E0C: $01 $00 $D8
    ld   de, SAVE_MAIN_SIZE                       ; $5E0F: $11 $80 $03

.loopSaveMain
    call EnableSRAM                               ; $5E12: $CD $D0 $27
    ld   a, [bc]                                  ; $5E15: $0A
    inc  bc                                       ; $5E16: $03
    call EnableSRAM                               ; $5E17: $CD $D0 $27
    ldi  [hl], a                                  ; $5E1A: $22
    dec  de                                       ; $5E1B: $1B
    ld   a, e                                     ; $5E1C: $7B
    or   d                                        ; $5E1D: $B2
    jr   nz, .loopSaveMain                        ; $5E1E: $20 $F2
    ld   bc, wColorDungeonItemFlags               ; $5E20: $01 $DA $DD
    ld   de, SAVE_DX1_SIZE                        ; $5E23: $11 $05 $00

.loopSaveDX1
    call EnableSRAM                               ; $5E26: $CD $D0 $27
    ld   a, [bc]                                  ; $5E29: $0A
    inc  bc                                       ; $5E2A: $03
    call EnableSRAM                               ; $5E2B: $CD $D0 $27
    ldi  [hl], a                                  ; $5E2E: $22
    dec  de                                       ; $5E2F: $1B
    ld   a, e                                     ; $5E30: $7B
    or   d                                        ; $5E31: $B2
    jr   nz, .loopSaveDX1                         ; $5E32: $20 $F2
    ld   bc, wColorDungeonRoomStatus              ; $5E34: $01 $E0 $DD
    ld   de, SAVE_DX2_SIZE                        ; $5E37: $11 $20 $00

.loopSaveDX2
    call EnableSRAM                               ; $5E3A: $CD $D0 $27
    ld   a, [bc]                                  ; $5E3D: $0A
    inc  bc                                       ; $5E3E: $03
    call EnableSRAM                               ; $5E3F: $CD $D0 $27
    ldi  [hl], a                                  ; $5E42: $22
    dec  de                                       ; $5E43: $1B
    ld   a, e                                     ; $5E44: $7B
    or   d                                        ; $5E45: $B2
    jr   nz, .loopSaveDX2                         ; $5E46: $20 $F2
    call EnableSRAM                               ; $5E48: $CD $D0 $27
    ld   a, [wTunicType]                          ; $5E4B: $FA $0F $DC
    call EnableSRAM                               ; $5E4E: $CD $D0 $27
    ldi  [hl], a                                  ; $5E51: $22
    call EnableSRAM                               ; $5E52: $CD $D0 $27
    ld   a, [wPhotos1]                            ; $5E55: $FA $0C $DC
    call EnableSRAM                               ; $5E58: $CD $D0 $27
    ldi  [hl], a                                  ; $5E5B: $22
    call EnableSRAM                               ; $5E5C: $CD $D0 $27
    ld   a, [wPhotos2]                            ; $5E5F: $FA $0D $DC
    call EnableSRAM                               ; $5E62: $CD $D0 $27
    ldi  [hl], a                                  ; $5E65: $22
    ret                                           ; $5E66: $C9

IF __RECALCULATE_MAX_HEARTS__
;
; Recalculates player's Max HP based on two tables; one for boss rooms,
; one for piece of heart rooms. Checks the save data's room flags to check
; if the boss has been defeated or the heart piece was collected,
; then resets max HP to 3 + (bosses) + (PoH / 4).
;
BossRoomTable:
    dw wIndoorARoomStatus + $06 ; moldorm
    dw wIndoorARoomStatus + $2b ; genie
    dw wIndoorARoomStatus + $5a
    dw wIndoorARoomStatus + $ff
    dw wIndoorARoomStatus + $85
    dw wIndoorARoomStatus + $bc
    dw wIndoorBRoomStatus + $e8
    dw wIndoorBRoomStatus + $34 ; hothead

PieceOfHeartRoomTable:
    dw wIndoorBRoomStatus + $a4
    dw wIndoorBRoomStatus + $b1
    dw wOverworldRoomStatus + $44
    dw wIndoorBRoomStatus + $ab
    dw wIndoorBRoomStatus + $e5
    dw wIndoorARoomStatus + $e8
    dw wOverworldRoomStatus + $78
    dw wIndoorARoomStatus + $f2
    dw wIndoorBRoomStatus + $e6
    dw wIndoorBRoomStatus + $df
    dw wIndoorBRoomStatus + $ba
    dw wOverworldRoomStatus + $00

RecalculateMaxHearts:
    ; full heart containers
    ld a, $03                                     ; $5ECA: $3E $03
    ldh [hMultiPurpose0], a                       ; $5ECC: $E0 $D7
    xor a                                         ; $5ECE: $AF
    ldh [hMultiPurpose1], a                       ; $5ECF: $E0 $D8
    ld c, $08                                     ; $5ED1: $0E $08
    ld hl, BossRoomTable                          ; $5ED3: $21 $A2 $5E

.bossLoop
    ld a, [hl+]                                   ; $5ED6: $2A
    ld e, a                                       ; $5ED7: $5F
    ld a, [hl+]                                   ; $5ED8: $2A
    ld d, a                                       ; $5ED9: $57
    ld a, [de]                                    ; $5EDA: $1A
    and ROOM_STATUS_EVENT_2 ; Boss defeated
    jr z, .endIfBossDefeated                      ; $5EDD: $28 $05
    ldh a, [hMultiPurpose0]                       ; $5EDF: $F0 $D7
    inc a                                         ; $5EE1: $3C
    ldh [hMultiPurpose0], a                       ; $5EE2: $E0 $D7
.endIfBossDefeated:

    dec c                                         ; $5EE4: $0D
    jr nz, .bossLoop                              ; $5EE5: $20 $EF

    ld c, $0c                                     ; $5EE7: $0E $0C
    ld hl, PieceOfHeartRoomTable                  ; $5EE9: $21 $B2 $5E

.heartPieceLoop
    ld a, [hl+]                                   ; $5EEC: $2A
    ld e, a                                       ; $5EED: $5F
    ld a, [hl+]                                   ; $5EEE: $2A
    ld d, a                                       ; $5EEF: $57
    ld a, [de]                                    ; $5EF0: $1A
    and OW_ROOM_STATUS_CHANGED                    ; $5EF1: $E6 $10
    jr z, .endIfHeartPieceTaken                   ; $5EF3: $28 $0F

    ldh a, [hMultiPurpose1]                       ; $5EF5: $F0 $D8
    inc a                                         ; $5EF7: $3C
    cp $04                                        ; $5EF8: $FE $04
    jr nz, .endIf4heartPieces                     ; $5EFA: $20 $06

    ldh a, [hMultiPurpose0]                       ; $5EFC: $F0 $D7
    inc a                                         ; $5EFE: $3C
    ldh [hMultiPurpose0], a                       ; $5EFF: $E0 $D7
    xor a                                         ; $5F01: $AF
.endIf4heartPieces

    ldh [hMultiPurpose1], a                       ; $5F02: $E0 $D8

.endIfHeartPieceTaken
    dec c                                         ; $5F04: $0D
    jr nz, .heartPieceLoop                        ; $5F05: $20 $E5

    ldh a, [hMultiPurpose0]                       ; $5F07: $F0 $D7
    call ClampMaxHearts                           ; $5F09: $CD $1C $5F
    ld [wMaxHearts], a                            ; $5F0C: $EA $5B $DB
    cp $0e                                        ; $5F0F: $FE $0E
    jr nz, jr_001_5f16                            ; $5F11: $20 $03

    xor a                                         ; $5F13: $AF
    jr jr_001_5f18                                ; $5F14: $18 $02

jr_001_5f16:
    ldh a, [hMultiPurpose1]                       ; $5F16: $F0 $D8

jr_001_5f18:
    ld [wHeartPiecesCount], a                     ; $5F18: $EA $5C $DB
    ret                                           ; $5F1B: $C9


; clamps max health between 3 and 14
ClampMaxHearts:
    cp $03                                        ; $5F1C: $FE $03
    jr nc, .upperBound                            ; $5F1E: $30 $03

    ld a, $03                                     ; $5F20: $3E $03
    ret                                           ; $5F22: $C9

.upperBound:
    cp $0e                                        ; $5F23: $FE $0E
    jr c, .return                                 ; $5F25: $38 $02
    ld a, $0e                                     ; $5F27: $3E $0E

.return:
    ret                                           ; $5F29: $C9
ENDC


; Copy the current dungeon item flags to the global and persistent
; dungeons item flags table.
SynchronizeDungeonsItemFlags::
    push bc                                       ; $5E67: $C5

    ; If on overworld, do nothing
    ld   a, [wIsIndoor]                           ; $5E68: $FA $A5 $DB
    and  a                                        ; $5E6B: $A7
    jr   z, .return                               ; $5E6C: $28 $27

    ; If inside the Color dungeon…
    ldh  a, [hMapId]                              ; $5E6E: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5E70: $FE $FF
    jr   nz, .notColorDungeon                     ; $5E72: $20 $05

    ; hl = wColorDungeonItemFlags
    ld   hl, wColorDungeonItemFlags               ; $5E74: $21 $DA $DD
    jr   .endIf                                   ; $5E77: $18 $11

.notColorDungeon
    ; If the map is not a dungeon, return.
    cp   MAP_CAVE_B                               ; $5E79: $FE $0A
    jr   nc, .return                              ; $5E7B: $30 $18

    ; Select the correct item flags slot for the current dungeon
    ; hl = wDungeonItemFlags + (hMapId * 5)
IF !LANG_DE
    ld   hl, wDungeonItemFlags                    ; $5E7D: $21 $16 $DB
ENDC
    ld   e, a                                     ; $5E80: $5F
    sla  a                                        ; $5E81: $CB $27
    sla  a                                        ; $5E83: $CB $27
    add  a, e                                     ; $5E85: $83
    ld   e, a                                     ; $5E86: $5F
    ld   d, $00                                   ; $5E87: $16 $00
IF LANG_DE
    ld   hl, wDungeonItemFlags
ENDC
    add  hl, de                                   ; $5E89: $19
.endIf

    ; Copy 5 values from wCurrentDungeonItemFlags to wDungeonItemFlags
    ld   de, wCurrentDungeonItemFlags             ; $5E8A: $11 $CC $DB
    ld   c, $05                                   ; $5E8D: $0E $05
.loop
    ld   a, [de]                                  ; $5E8F: $1A
    inc  de                                       ; $5E90: $13
    ldi  [hl], a                                  ; $5E91: $22
    ; loop while c > 0
    dec  c                                        ; $5E92: $0D
    jr   nz, .loop                                ; $5E93: $20 $FA

.return
    pop  bc                                       ; $5E95: $C1
    ret                                           ; $5E96: $C9

EntityPosXOffsetTable::
.right:  db $A0                                   ; $5E97
.left:   db $60                                   ; $5E98
.top     db $00                                   ; $5E99
.bottom  db $00                                   ; $5E9A
.default db $00                                   ; $5E9B

EntityPosXSignTable::
.right:  db $00                                   ; $5E9C
.left:   db $FF                                   ; $5E9D
.top     db $00                                   ; $5E9E
.bottom  db $00                                   ; $5E9F
.default db $00                                   ; $5EA0

EntityPosYOffsetTable::
.right:  db $00                                   ; $5EA1
.left:   db $00                                   ; $5EA2
.top     db $80                                   ; $5EA3
.bottom  db $80                                   ; $5EA4
.default db $00                                   ; $5EA5

EntityPosYSignTable::
.right:  db $00                                   ; $5EA6
.left:   db $00                                   ; $5EA7
.top     db $FF                                   ; $5EA8
.bottom  db $00                                   ; $5EA9
.default db $00                                   ; $5EAA

; Configure the position a newly created entity position before a room transition.
;
; Input:
;   de:  entity index
PrepareEntityPositionForRoomTransition::
    ; Set the entity load order
    ld   hl, wEntitiesLoadOrderTable              ; $5EAB: $21 $60 $C4
    add  hl, de                                   ; $5EAE: $19
    ldh  a, [hMultiPurposeD]                      ; $5EAF: $F0 $E4
    ld   [hl], a                                  ; $5EB1: $77

    ; Increment the load order
    inc  a                                        ; $5EB2: $3C
    ldh  [hMultiPurposeD], a                      ; $5EB3: $E0 $E4

    push bc                                       ; $5EB5: $C5
    ; bc = wRoomTransitionDirection
    ld   a, [wRoomTransitionDirection]            ; $5EB6: $FA $25 $C1
    ld   c, a                                     ; $5EB9: $4F
    ld   b, $00                                   ; $5EBA: $06 $00

    ; hMultiPurpose0 = EntityPosXOffsetTable[wRoomTransitionDirection]
    ld   hl, EntityPosXOffsetTable                ; $5EBC: $21 $97 $5E
    add  hl, bc                                   ; $5EBF: $09
    ld   a, [hl]                                  ; $5EC0: $7E
    ldh  [hMultiPurpose0], a                      ; $5EC1: $E0 $D7

    ; hMultiPurpose1 = EntityPosXSignTable[wRoomTransitionDirection]
    ld   hl, EntityPosXSignTable                  ; $5EC3: $21 $9C $5E
    add  hl, bc                                   ; $5EC6: $09
    ld   a, [hl]                                  ; $5EC7: $7E
    ldh  [hMultiPurpose1], a                      ; $5EC8: $E0 $D8

    ; hMultiPurpose2 = EntityPosYOffsetTable[wRoomTransitionDirection]
    ld   hl, EntityPosYOffsetTable                ; $5ECA: $21 $A1 $5E
    add  hl, bc                                   ; $5ECD: $09
    ld   a, [hl]                                  ; $5ECE: $7E
    ldh  [hMultiPurpose2], a                      ; $5ECF: $E0 $D9

    ; hMultiPurpose3 = EntityPosYSignTable[wRoomTransitionDirection]
    ld   hl, EntityPosYSignTable                  ; $5ED1: $21 $A6 $5E
    add  hl, bc                                   ; $5ED4: $09
    ld   a, [hl]                                  ; $5ED5: $7E
    ldh  [hMultiPurpose3], a                      ; $5ED6: $E0 $DA

    ; [wEntitiesPosXTable + de] += [hMultiPurpose0]
    ld   hl, wEntitiesPosXTable                   ; $5ED8: $21 $00 $C2
    add  hl, de                                   ; $5EDB: $19
    ldh  a, [hMultiPurpose0]                      ; $5EDC: $F0 $D7
    add  a, [hl]                                  ; $5EDE: $86
    ld   [hl], a                                  ; $5EDF: $77

    ; [wEntitiesPosXSignTable + de] += [hMultiPurpose1] + carry
    rr   c                                        ; $5EE0: $CB $19
    ld   hl, wEntitiesPosXSignTable               ; $5EE2: $21 $20 $C2
    add  hl, de                                   ; $5EE5: $19
    ldh  a, [hMultiPurpose1]                      ; $5EE6: $F0 $D8
    rl   c                                        ; $5EE8: $CB $11
    adc  a, [hl]                                  ; $5EEA: $8E
    ld   [hl], a                                  ; $5EEB: $77

    ; [wEntitiesPosYTable + de] += [hMultiPurpose2]
    ld   hl, wEntitiesPosYTable                   ; $5EEC: $21 $10 $C2
    add  hl, de                                   ; $5EEF: $19
    ldh  a, [hMultiPurpose2]                      ; $5EF0: $F0 $D9
    add  a, [hl]                                  ; $5EF2: $86
    ld   [hl], a                                  ; $5EF3: $77

    ; [wEntitiesPosYSignTable + de] += [hMultiPurpose3] + carry
    rr   c                                        ; $5EF4: $CB $19
    ld   hl, wEntitiesPosYSignTable               ; $5EF6: $21 $30 $C2
    add  hl, de                                   ; $5EF9: $19
    ldh  a, [hMultiPurpose3]                      ; $5EFA: $F0 $DA
    rl   c                                        ; $5EFC: $CB $11
    adc  a, [hl]                                  ; $5EFE: $8E
    ld   [hl], a                                  ; $5EFF: $77

    pop  bc                                       ; $5F00: $C1
    ret                                           ; $5F01: $C9

; Add the current room to the recent rooms list (if not already present).
UpdateRecentRoomsList::
    ; The recent rooms list has 6 slots
    ld   c, $06                                   ; $5F02: $0E $06
    ldh  a, [hMapRoom]                            ; $5F04: $F0 $F6
    ld   hl, wRecentRooms                         ; $5F06: $21 $81 $CE

    ; For each slot…
.findRoomInList
    ; if the slot already contains the current room,
    ; don't add it again and simply return.
    cp   [hl]                                     ; $5F09: $BE
    jr   z, .return                               ; $5F0A: $28 $21
    inc  hl                                       ; $5F0C: $23
    dec  c                                        ; $5F0D: $0D
    jr   nz, .findRoomInList                      ; $5F0E: $20 $F9

    ;
    ; Append the current room to the recents rooms list
    ;

    ; Increment the index of the next slot
    ld   a, [wRecentRoomsIndex]                   ; $5F10: $FA $80 $CE
    inc  a                                        ; $5F13: $3C
    ; (if the index goes past 5, reset it to 0)
    cp   $06                                      ; $5F14: $FE $06
    jr   nz, .wrapIndexEnd                        ; $5F16: $20 $01
    xor  a                                        ; $5F18: $AF
.wrapIndexEnd
    ld   [wRecentRoomsIndex], a                   ; $5F19: $EA $80 $CE

    ; Read the previous value of the slot into DE
    ld   e, a                                     ; $5F1C: $5F
    ld   d, $00                                   ; $5F1D: $16 $00
    ld   hl, wRecentRooms                         ; $5F1F: $21 $81 $CE
    add  hl, de                                   ; $5F22: $19
    ld   e, [hl]                                  ; $5F23: $5E

    ; Write the current room id to the slot
    ldh  a, [hMapRoom]                            ; $5F24: $F0 $F6
    ld   [hl], a                                  ; $5F26: $77

    ; Clear the flag indicating cleared entities for the evicted room.
    ; (This means that enemies will not respawn in a room before 6
    ; other different rooms have been visited.)
    ld   hl, wEntitiesClearedRooms                ; $5F27: $21 $00 $CF
    add  hl, de                                   ; $5F2A: $19
    ld   [hl], $00                                ; $5F2B: $36 $00

.return
    ret                                           ; $5F2D: $C9

HideAllSprites::
    ; $0000 controls whether to enable external RAM
    ld   hl, rRAMG                                ; $5F2E: $21 $00 $00

    ; If CGB…
    ldh  a, [hIsGBC]                              ; $5F31: $F0 $FE
    and  a                                        ; $5F33: $A7
    jr   z, .enableSRAM                           ; $5F34: $28 $04
    ; disable external RAM
    ; (probably because an extra RAM bank available on CGB can be used)
    ld   [hl], CART_SRAM_DISABLE                  ; $5F36: $36 $00
    jr   .endIf                                   ; $5F38: $18 $02

.enableSRAM
    ; else write $FF to rRAMG, which also should disable
    ; external RAM; only a value of $0A enables external
    ; RAM (SRAM) on MBC5 according to Pandocs. SRAM is also
    ; not used in this subroutine. What's actually going on
    ; here? Stubbed out code that hasn't been removed even
    ; though it's run every frame?
    ld   [hl], $FF                                ; $5F3A: $36 $FF
.endIf

    ; loop counter
    ld   b, OAM_COUNT                             ; $5F3C: $06 $28
    ; value to write
    ld   a, $F4                                   ; $5F3E: $3E $F4
    ; address
    ld   hl, wOAMBuffer                           ; $5F40: $21 $00 $C0

    ; Write $F4 to every first byte (Y position) of the OAM buffer
    ; This ensures the sprite is hidden.
.loop
    ldi  [hl], a                                  ; $5F43: $22
    inc  hl                                       ; $5F44: $23
    inc  hl                                       ; $5F45: $23
    inc  hl                                       ; $5F46: $23
    dec  b                                        ; $5F47: $05
    jr   nz, .loop                                ; $5F48: $20 $F9
    ret                                           ; $5F4A: $C9

; Hide sprites that should be obscured by the inventory window
; or the dialog box.
; 
; Note that this code checks if wInventoryAppearing is true, and if
; so, it hides sprites based on wWindowY, ie. the window's Y position.
; This is likely a remnant from the DMG version of the game, where
; the inventory screen scrolled in from the bottom, and wWindowY could
; have many different values. In DX, wWindowY can only be 0 (ie. fully
; open inventory) while wInventoryAppearing is true.
HideSprites::
    ; Is the inventory window currently opening?
    ld   a, [wInventoryAppearing]                 ; $5F4B: $FA $4F $C1
    and  a                                        ; $5F4E: $A7
    jr   z, HideSpritesUnderDialog                ; $5F4F: $28 $19
    ; If so, calculate what sprites should be hidden
    ld   hl, wOAMBuffer                           ; $5F51: $21 $00 $C0
    ; Sprites are 16 pixels tall, and their Y position
    ; is 16 less than actual screen position, so check if
    ; at least half of the sprite overlaps the window
    ld   a, [wWindowY]                            ; $5F54: $FA $9A $DB
    add  a, OAM_Y_OFS / 2                         ; $5F57: $C6 $08
    ld   d, a                                     ; $5F59: $57
    ; Loop counter
    ld   e, OAM_COUNT                             ; $5F5A: $1E $28

.hideSpritesLoop::
    ld   a, [hl]                                  ; $5F5C: $7E
    cp   d                                        ; $5F5D: $BA
    jr   c, .nextSprite                           ; $5F5E: $38 $02
    ; Set sprite's Y position to 0 (off-screen)
    ld   [hl], $00                                ; $5F60: $36 $00

.nextSprite
    inc  hl                                       ; $5F62: $23
    inc  hl                                       ; $5F63: $23
    inc  hl                                       ; $5F64: $23
    inc  hl                                       ; $5F65: $23
    dec  e                                        ; $5F66: $1D
    jr   nz, .hideSpritesLoop                     ; $5F67: $20 $F3
    ret                                           ; $5F69: $C9

; The window is not opening, so we potentially need to hide sprites
; under a dialog box instead.
HideSpritesUnderDialog::
    ; If wWindowY == 0, the inventory window is fully open, so
    ; there is no dialog box
    ld   a, [wWindowY]                            ; $5F6A: $FA $9A $DB
    and  a                                        ; $5F6D: $A7
    ret  z                                        ; $5F6E: $C8
    ; If wDialogState == 0 (DIALOG_CLOSED),
    ; there is no dialog box
    ld   a, [wDialogState]                        ; $5F6F: $FA $9F $C1
    and  a                                        ; $5F72: $A7
    ret  z                                        ; $5F73: $C8
    ; Compare sprites' Y positions with either the bottom of
    ; the dialog box at the top of the screen (but allow two
    ; pixels of the sprite to overlap)...
    ld   d, DIALOG_BOX_TOP_Y + DIALOG_BOX_HEIGHT + OAM_Y_OFS - 2 ; $5F74: $16 $3E
    ld   a, [wDialogState]                        ; $5F76: $FA $9F $C1
    ; ... or the top of the dialog box at the bottom of the screen
    ; (allow up to half the sprite to overlap here)
    and  DIALOG_BOX_BOTTOM_FLAG                   ; $5F79: $E6 $80
    jr   z, .hideSpritesUnderDialog               ; $5F7B: $28 $02
    ld   d, DIALOG_BOX_BOTTOM_Y - (OAM_Y_OFS / 2) ; $5F7D: $16 $58

.hideSpritesUnderDialog::
    ; Skip the first 9 OAM entries, as those include parts of wLinkOAMBuffer
    ; (Link will never be on top of the dialog box) which is also used for
    ; sprites that should be on top of the dialog box (like the prompt arrow)
    ld   e, OAM_COUNT - 9 ; loop counter          ; $5F7F: $1E $1F
    ld   hl, wOAMBuffer + (sizeof_OAM_ATTRS * 9)  ; $5F81: $21 $24 $C0

.hideSpritesLoop::
    ; Check if the sprite's Y position is sufficiently more
    ; than the comparison value (below)...
    ld   a, [hl]                                  ; $5F84: $7E
    cp   d                                        ; $5F85: $BA
    ; ...or, if the dialog box is on the bottom of the screen...
    ld   a, [wDialogState]                        ; $5F86: $FA $9F $C1
    bit  DIALOG_BOX_BOTTOM_BIT, a                 ; $5F89: $CB $7F
    jr   nz, .checkPieceOfHeart                   ; $5F8B: $20 $01
    ; ...if the sprite's Y position is sufficiently less (above)...
    ccf                                           ; $5F8D: $3F

.checkPieceOfHeart::
    ; ...then don't hide the sprite.
    jr   c, .nextSprite                           ; $5F8E: $38 $1B
    ; Check if the dialog being displayed is Dialog04F,
    ; ie. the "You've got a Piece of Heart" text
    ld   a, [wDialogIndex]                        ; $5F90: $FA $73 $C1
    cp_dialog_low Dialog04F                       ; $5F93: $FE $4F
    jr   nz, .hideSprite                          ; $5F95: $20 $12
    ld   a, [wDialogIndexHi]                      ; $5F97: $FA $12 $C1
    and  a                                        ; $5F9A: $A7
    jr   nz, .hideSprite                          ; $5F9B: $20 $0C
    ; Get the sprite's tile number
    inc  hl                                       ; $5F9D: $23
    inc  hl                                       ; $5F9E: $23
    ld   a, [hl-]                                 ; $5F9F
    dec  hl                                       ; $5FA0: $2B
    ; If the sprite is the Piece of Heart graphic, ie. tile numbers
    ; $9A to $9F, which is supposed to overlay the relevant dialog,
    ; don't hide it
    cp   $9A                                      ; $5FA1: $FE $9A
    jr   c, .hideSprite                           ; $5FA3: $38 $04
    cp   $A0                                      ; $5FA5: $FE $A0
    jr   c, .nextSprite                           ; $5FA7: $38 $02

.hideSprite::
    ; Set sprite's Y position to 0 (off-screen)
    ld   [hl], $00                                ; $5FA9: $36 $00

.nextSprite::
    inc  hl                                       ; $5FAB: $23
    inc  hl                                       ; $5FAC: $23
    inc  hl                                       ; $5FAD: $23
    inc  hl                                       ; $5FAE: $23
    dec  e                                        ; $5FAF: $1D
    jr   nz, .hideSpritesLoop                     ; $5FB0: $20 $D2
    ret                                           ; $5FB2: $C9

; Create the entity for the NPC currently following Link (if any).
; This can be either:
;  - The Flying Rooster
;  - The friendly Ghost
;  - Marin
;  - Bow-Wow
CreateFollowingNpcEntity::
    ; If indoors…
    ld   a, [wIsIndoor]                           ; $5FB3: $FA $A5 $DB
    and  a                                        ; $5FB6: $A7
    jr   z, .excludedRoomsEnd                     ; $5FB7: $28 $1A
    ; Exclude side-scrolling rooms
    ldh  a, [hIsSideScrolling]                    ; $5FB9: $F0 $F9
    and  a                                        ; $5FBB: $A7
    ret  nz                                       ; $5FBC: $C0
    ; Exclude some maps
    ldh  a, [hMapId]                              ; $5FBD: $F0 $F7
    cp   MAP_S_FACE_SHRINE                        ; $5FBF: $FE $16
    ret  z                                        ; $5FC1: $C8
    cp   MAP_KANALET                              ; $5FC2: $FE $14
    ret  z                                        ; $5FC4: $C8
    cp   MAP_DREAM_SHRINE                         ; $5FC5: $FE $13
    ret  z                                        ; $5FC7: $C8
    cp   MAP_CAVE_B                               ; $5FC8: $FE $0A
    ret  c                                        ; $5FCA: $D8
    ; Exclude some rooms
    ; POI: Curiously, these should be excluded by the
    ; check against side-scrolling rooms...
    ldh  a, [hMapRoom]                            ; $5FCB: $F0 $F6
    cp   ROOM_INDOOR_B_MANBO                      ; $5FCD: $FE $FD
    ret  z                                        ; $5FCF: $C8
    cp   ROOM_INDOOR_B_FISHING_MINIGAME           ; $5FD0: $FE $B1
    ret  z                                        ; $5FD2: $C8
.excludedRoomsEnd

    ;
    ; Flying Rooster entity
    ;

    ; If the Rooster is following Link…
    ld   a, [wIsRoosterFollowingLink]             ; $5FD3: $FA $7B $DB
    cp   TRUE                                     ; $5FD6: $FE $01
    jr   nz, .roosterEnd                          ; $5FD8: $20 $3A

    ; Search existing entities for an already loaded Roster
    ld   e, $0F                                   ; $5FDA: $1E $0F
    ld   d, $00                                   ; $5FDC: $16 $00
.roosterSearchLoop
    ld   hl, wEntitiesTypeTable                   ; $5FDE: $21 $A0 $C3
    add  hl, de                                   ; $5FE1: $19
    ld   a, [hl]                                  ; $5FE2: $7E
    cp   ENTITY_ROOSTER                           ; $5FE3: $FE $D5
    jr   nz, .roosterContinue                     ; $5FE5: $20 $09
    ld   hl, wEntitiesStatusTable                 ; $5FE7: $21 $80 $C2
    add  hl, de                                   ; $5FEA: $19
    ld   a, [hl]                                  ; $5FEB: $7E
    and  a                                        ; $5FEC: $A7
    jr   z, .roosterContinue                      ; $5FED: $28 $01
    ld   [hl], d                                  ; $5FEF: $72
.roosterContinue
    dec  e                                        ; $5FF0: $1D
    ld   a, e                                     ; $5FF1: $7B
    cp   $FF                                      ; $5FF2: $FE $FF
    jr   nz, .roosterSearchLoop                   ; $5FF4: $20 $E8

    ; Create the new Rooster entity
    ld   a, ENTITY_ROOSTER                        ; $5FF6: $3E $D5
    call SpawnNewEntity_trampoline                ; $5FF8: $CD $86 $3B

    ; Configure the entity
    ldh  a, [hLinkPositionX]                      ; $5FFB: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $5FFD: $21 $00 $C2
    add  hl, de                                   ; $6000: $19
    ld   [hl], a                                  ; $6001: $77
    ldh  a, [hLinkPositionZ]                      ; $6002: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $6004: $21 $10 $C3
    add  hl, de                                   ; $6007: $19
    ld   [hl], a                                  ; $6008: $77
    ldh  a, [hLinkPositionY]                      ; $6009: $F0 $99
    ld   hl, wC13B                                ; $600B: $21 $3B $C1
    add  a, [hl]                                  ; $600E: $86
    ld   hl, wEntitiesPosYTable                   ; $600F: $21 $10 $C2
    add  hl, de                                   ; $6012: $19
    ld   [hl], a                                  ; $6013: $77
.roosterEnd

    ;
    ; Ghost entity
    ;

    ld   a, [wIsGhostFollowingLink]               ; $6014: $FA $79 $DB
    cp   $01                                      ; $6017: $FE $01
    jr   z, .createGhostEntity                    ; $6019: $28 $28
    cp   $02                                      ; $601B: $FE $02
    jr   nz, .ghostEnd                            ; $601D: $20 $60
    ld   a, [wIsIndoor]                           ; $601F: $FA $A5 $DB
    and  a                                        ; $6022: $A7
    jr   nz, .ghostEnd                            ; $6023: $20 $5A
    ldh  a, [hMapRoom]                            ; $6025: $F0 $F6
    cp   ROOM_SECTION_OW_GHOST_TRIGGER            ; $6027: $FE $40
    jr   c, .ghostEnd                             ; $6029: $38 $54
    ld   a, [wHasInstrument4]                     ; $602B: $FA $68 $DB
    and  $02                                      ; $602E: $E6 $02
    jr   z, .ghostEnd                             ; $6030: $28 $4D
    ld   a, [wPowerBraceletLevel]                 ; $6032: $FA $43 $DB
    cp   $02                                      ; $6035: $FE $02
    jr   c, .markGhostAsFollowing                 ; $6037: $38 $03
    ; Mark Ghost as not following Link anymore
    xor  a                                        ; $6039: $AF
    jr   .ghostStatusEnd                          ; $603A: $18 $02
.markGhostAsFollowing
    ; Mark Ghost as following Link
    ld   a, $01                                   ; $603C: $3E $01
.ghostStatusEnd

    ld   [wIsGhostFollowingLink], a               ; $603E: $EA $79 $DB
    jr   .ghostEnd                                ; $6041: $18 $3C

.createGhostEntity
    ld   e, $0F                                   ; $6043: $1E $0F
    ld   d, $00                                   ; $6045: $16 $00

    ; Search for an existing Ghost entity
.ghostSearchLoop
    ld   hl, wEntitiesTypeTable                   ; $6047: $21 $A0 $C3
    add  hl, de                                   ; $604A: $19
    ld   a, [hl]                                  ; $604B: $7E
    cp   ENTITY_GHOST                             ; $604C: $FE $D4
    jr   nz, .ghostContinue                       ; $604E: $20 $09
    ld   hl, wEntitiesStatusTable                 ; $6050: $21 $80 $C2
    add  hl, de                                   ; $6053: $19
    ld   a, [hl]                                  ; $6054: $7E
    and  a                                        ; $6055: $A7
    jr   z, .ghostContinue                        ; $6056: $28 $01
    ld   [hl], d                                  ; $6058: $72
.ghostContinue
    dec  e                                        ; $6059: $1D
    ld   a, e                                     ; $605A: $7B
    cp   -1                                       ; $605B: $FE $FF
    jr   nz, .ghostSearchLoop                     ; $605D: $20 $E8

    ; Create the Ghost entity
    ld   a, ENTITY_GHOST                          ; $605F: $3E $D4
    call SpawnNewEntity_trampoline                ; $6061: $CD $86 $3B

    ; Configure the entity
    ldh  a, [hLinkPositionX]                      ; $6064: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $6066: $21 $00 $C2
    add  hl, de                                   ; $6069: $19
    ld   [hl], a                                  ; $606A: $77
    ldh  a, [hLinkPositionY]                      ; $606B: $F0 $99
    ld   hl, wC13B                                ; $606D: $21 $3B $C1
    add  a, [hl]                                  ; $6070: $86
    ld   hl, wEntitiesPosYTable                   ; $6071: $21 $10 $C2
    add  hl, de                                   ; $6074: $19
    ld   [hl], a                                  ; $6075: $77
    ld   hl, wEntitiesPrivateState1Table          ; $6076: $21 $B0 $C2
    add  hl, de                                   ; $6079: $19
    inc  [hl]                                     ; $607A: $34

    ; Play the eerie ghost sound effect
    ld   a, JINGLE_GHOST_PRESENCE                 ; $607B: $3E $2D
    ldh  [hJingle], a                             ; $607D: $E0 $F2
.ghostEnd

    ;
    ; Marin entity
    ;

    ; If Marin is following Link…
    ld   a, [wIsMarinFollowingLink]               ; $607F: $FA $73 $DB
    and  a                                        ; $6082: $A7
    jp   z, .marinEnd                             ; $6083: $CA $1F $61

    ; Search for an existing Marin entity
    ld   e, $0F                                   ; $6086: $1E $0F
    ld   d, $00                                   ; $6088: $16 $00
.marinSearchLoop
    ld   hl, wEntitiesTypeTable                   ; $608A: $21 $A0 $C3
    add  hl, de                                   ; $608D: $19
    ld   a, [hl]                                  ; $608E: $7E
    cp   ENTITY_MARIN_AT_THE_SHORE                ; $608F: $FE $C1
    jr   nz, .marinContinue                       ; $6091: $20 $09
    ld   hl, wEntitiesStatusTable                 ; $6093: $21 $80 $C2
    add  hl, de                                   ; $6096: $19
    ld   a, [hl]                                  ; $6097: $7E
    and  a                                        ; $6098: $A7
    jr   z, .marinContinue                        ; $6099: $28 $01
    ld   [hl], d                                  ; $609B: $72
.marinContinue
    dec  e                                        ; $609C: $1D
    ld   a, e                                     ; $609D: $7B
    cp   -1                                       ; $609E: $FE $FF
    jr   nz, .marinSearchLoop                     ; $60A0: $20 $E8

    ; Create a new Marin entity
    ld   a, ENTITY_MARIN_AT_THE_SHORE             ; $60A2: $3E $C1
    call SpawnNewEntity_trampoline                ; $60A4: $CD $86 $3B

    ; Configure the entity
    ldh  a, [hLinkPositionX]                      ; $60A7: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $60A9: $21 $00 $C2
    add  hl, de                                   ; $60AC: $19
    ld   [hl], a                                  ; $60AD: $77
    ld   hl, wLinkPositionXHistory                ; $60AE: $21 $55 $D1
    call .decrementConsecutiveBytes               ; $60B1: $CD $18 $61

    ldh  a, [hLinkPositionY]                      ; $60B4: $F0 $99
    ld   hl, wC13B                                ; $60B6: $21 $3B $C1
    add  a, [hl]                                  ; $60B9: $86
    ld   hl, wEntitiesPosYTable                   ; $60BA: $21 $10 $C2
    add  hl, de                                   ; $60BD: $19
    ld   [hl], a                                  ; $60BE: $77
    ld   hl, wLinkPositionYHistory                ; $60BF: $21 $75 $D1
    call .decrementConsecutiveBytes               ; $60C2: $CD $18 $61

    ldh  a, [hLinkPositionZ]                      ; $60C5: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $60C7: $21 $10 $C3
    add  hl, de                                   ; $60CA: $19
    ld   [hl], a                                  ; $60CB: $77
    ld   hl, wLinkPositionZHistory                ; $60CC: $21 $95 $D1
    call .decrementConsecutiveBytes               ; $60CF: $CD $18 $61

    ld   hl, wEntitiesPrivateState4Table          ; $60D2: $21 $40 $C4
    add  hl, de                                   ; $60D5: $19
    ld   [hl], $01                                ; $60D6: $36 $01
    ld   hl, wEntitiesPrivateCountdown1Table      ; $60D8: $21 $F0 $C2
    add  hl, de                                   ; $60DB: $19
    ld   [hl], $0C                                ; $60DC: $36 $0C

    ; If on room $A4 (bottom of the well),
    ; make Marin being dropped from above.
    ldh  a, [hMapRoom]                            ; $60DE: $F0 $F6
    cp   UNKNOWN_ROOM_A4                          ; $60E0: $FE $A4
    jr   nz, .marinFallEnd                        ; $60E2: $20 $13
    ldh  a, [hMapId]                              ; $60E4: $F0 $F7
    cp   MAP_CAVE_C                               ; $60E6: $FE $11
    jr   nz, .marinFallEnd                        ; $60E8: $20 $0D
    ld   a, JINGLE_FALL_DOWN                      ; $60EA: $3E $08
    ldh  [hJingle], a                             ; $60EC: $E0 $F2
    ld   [wC167], a                               ; $60EE: $EA $67 $C1
    ld   hl, wEntitiesPrivateCountdown2Table      ; $60F1: $21 $00 $C3
    add  hl, de                                   ; $60F4: $19
    ld   [hl], $79                                ; $60F5: $36 $79
.marinFallEnd

    ldh  a, [hLinkDirection]                      ; $60F7: $F0 $9E
    ld   hl, wLinkDirectionHistory                ; $60F9: $21 $B5 $D1
    call .decrementConsecutiveBytes               ; $60FC: $CD $18 $61
    ld   a, [wDB10]                               ; $60FF: $FA $10 $DB
    and  a                                        ; $6102: $A7
    jr   z, .jp_6117                              ; $6103: $28 $12
    ldh  a, [hLinkPositionX]                      ; $6105: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $6107: $21 $00 $C2
    add  hl, de                                   ; $610A: $19
    add  a, $20                                   ; $610B: $C6 $20
    ld   [hl], a                                  ; $610D: $77
    ldh  a, [hLinkPositionY]                      ; $610E: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $6110: $21 $10 $C2
    add  hl, de                                   ; $6113: $19
    add  a, $10                                   ; $6114: $C6 $10
    ld   [hl], a                                  ; $6116: $77
.jp_6117
    ret                                           ; $6117: $C9

.decrementConsecutiveBytes
    ld   c, $10                                   ; $6118: $0E $10
.loop
    ldi  [hl], a                                  ; $611A: $22
    dec  c                                        ; $611B: $0D
    jr   nz, .loop                                ; $611C: $20 $FC
    ret                                           ; $611E: $C9

.marinEnd

    ;
    ; Bow-Wow entity
    ;

    ; If inside Mrs. Meow-Meow house, never load Bow-Wow
    ldh  a, [hMapRoom]                            ; $611F: $F0 $F6
    cp   ROOM_INDOOR_B_MRS_MEOW_MEOW              ; $6121: $FE $A7
    ret  z                                        ; $6123: $C8

    ; If Bow-Wow is following Link…
    ld   a, [wIsBowWowFollowingLink]              ; $6124: $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ; $6127: $FE $01
    jr   nz, .bowWowEnd                           ; $6129: $20 $36

    ; Search for an existing Bow-Wow entity
    ld   e, $0F                                   ; $612B: $1E $0F
    ld   d, $00                                   ; $612D: $16 $00
.bowWowSearchLoop
    ld   hl, wEntitiesTypeTable                   ; $612F: $21 $A0 $C3
    add  hl, de                                   ; $6132: $19
    ld   a, [hl]                                  ; $6133: $7E
    cp   ENTITY_BOW_WOW                           ; $6134: $FE $6D
    jr   nz, .bowWowContinue                      ; $6136: $20 $09
    ld   hl, wEntitiesStatusTable                 ; $6138: $21 $80 $C2
    add  hl, de                                   ; $613B: $19
    ld   a, [hl]                                  ; $613C: $7E
    and  a                                        ; $613D: $A7
    jr   z, .bowWowContinue                       ; $613E: $28 $01
    ld   [hl], d                                  ; $6140: $72
.bowWowContinue
    dec  e                                        ; $6141: $1D
    ld   a, e                                     ; $6142: $7B
    cp   -1                                       ; $6143: $FE $FF
    jr   nz, .bowWowSearchLoop                    ; $6145: $20 $E8

    ; Create a new Bow-Wow entity
    ld   a, ENTITY_BOW_WOW                        ; $6147: $3E $6D
    call SpawnNewEntity_trampoline                ; $6149: $CD $86 $3B

    ; Configure the entity
    ldh  a, [hLinkPositionX]                      ; $614C: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $614E: $21 $00 $C2
    add  hl, de                                   ; $6151: $19
    ld   [hl], a                                  ; $6152: $77
    ldh  a, [hLinkPositionY]                      ; $6153: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $6155: $21 $10 $C2
    add  hl, de                                   ; $6158: $19
    ld   [hl], a                                  ; $6159: $77
    ldh  a, [hLinkPositionZ]                      ; $615A: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $615C: $21 $10 $C3
    add  hl, de                                   ; $615F: $19
    ld   [hl], a                                  ; $6160: $77

.bowWowEnd
    ret                                           ; $6161: $C9

; Reset?
func_001_6162::
    call label_27F2                               ; $6162: $CD $F2 $27
    xor  a                                        ; $6165: $AF
    ld   [wGameplayType], a                       ; $6166: $EA $95 $DB
    ld   [wGameplaySubtype], a                    ; $6169: $EA $96 $DB
    ld   [wOBJ0Palette], a                        ; $616C: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $616F: $EA $99 $DB
    ld   [wBGPalette], a                          ; $6172: $EA $97 $DB
    ld   [rBGP], a                                ; $6175: $E0 $47
    ld   [rOBP0], a                               ; $6177: $E0 $48
    ld   [rOBP1], a                               ; $6179: $E0 $49
    ldh  [hBaseScrollY], a                        ; $617B: $E0 $97
    ldh  [hBaseScrollX], a                        ; $617D: $E0 $96
    ld   [wSwitchBlocksState], a                  ; $617F: $EA $FB $D6
    ld   [wSwitchableObjectAnimationStage], a     ; $6182: $EA $F8 $D6
    ld   a, $18                                   ; $6185: $3E $18
    ldh  [hButtonsInactiveDelay], a               ; $6187: $E0 $B5
    ret                                           ; $6189: $C9

Data_001_618A::
    db 0, $57, $10, $57, $20, $57, $30, $57, $40, $57, $50, $57, $60, $57, $70, $57 ; $618A
    db $80, $57, $90, $57, 0, $58, $10, $58, $20, $58, $30, $58, $40, $58, $50, $58 ; $619A

LoadCounterAnimatedTiles::
    ld   a, [wTextDebuggerDialogId]               ; $61AA: $FA $09 $C1
    and  $0F                                      ; $61AD: $E6 $0F
    sla  a                                        ; $61AF: $CB $27
    ld   e, a                                     ; $61B1: $5F
    ld   d, $00                                   ; $61B2: $16 $00
    ld   hl, Data_001_618A                        ; $61B4: $21 $8A $61
    add  hl, de                                   ; $61B7: $19
    ld   a, [hli]                                 ; $61B8: $2A
    ld   h, [hl]                                  ; $61B9: $66
    ld   l, a                                     ; $61BA: $6F
    ld   de, $96D0  ; destination                 ; $61BB: $11 $D0 $96
    ld   bc, $10    ; count                       ; $61BE: $01 $10 $00
    ld   a, $0F     ; bank                        ; $61C1: $3E $0F
    call CopyDataFromBank                         ; $61C3: $CD $08 $29
    ld   a, [wTextDebuggerDialogId]               ; $61C6: $FA $09 $C1
    swap a                                        ; $61C9: $CB $37
    and  $0F                                      ; $61CB: $E6 $0F
    sla  a                                        ; $61CD: $CB $27
    ld   e, a                                     ; $61CF: $5F
    ld   d, $00                                   ; $61D0: $16 $00
    ld   hl, Data_001_618A                        ; $61D2: $21 $8A $61
    add  hl, de                                   ; $61D5: $19
    ld   a, [hli]                                 ; $61D6: $2A
    ld   h, [hl]                                  ; $61D7: $66
    ld   l, a                                     ; $61D8: $6F
    ld   de, $96C0 ; destination                  ; $61D9: $11 $C0 $96
    ld   bc, $10   ; count                        ; $61DC: $01 $10 $00
    ld   a, $0F    ; bank                         ; $61DF: $3E $0F
    call CopyDataFromBank                         ; $61E1: $CD $08 $29
    ld   a, $6C                                   ; $61E4: $3E $6C
    ld   [$9909], a                               ; $61E6: $EA $09 $99

.jr_61E9::
    inc  a                                        ; $61E9: $3C
    ld   [$990A], a                               ; $61EA: $EA $0A $99
    ret                                           ; $61ED: $C9

OpenDungeonNameDialog::
    ; If wLinkMotionState == LINK_MOTION_DEFAULT…
    ld   a, [wLinkMotionState]                    ; $61EE: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $61F1: $FE $00
    jr   nz, .return                              ; $61F3: $20 $0D
    ; … and Free Movement Mode is disabled…
    ld   a, [wFreeMovementMode]                   ; $61F5: $FA $7B $C1
    and  a                                        ; $61F8: $A7
    jr   nz, .return                              ; $61F9: $20 $07
    ; Open Dialog n° (Dialog056 + hMapId)
    ldh  a, [hMapId]                              ; $61FB: $F0 $F7
    add  a, LOW($056)                             ; $61FD: $C6 $56
    call OpenDialogInTable0                       ; $61FF: $CD $85 $23
.return
    ret                                           ; $6202: $C9

include "code/marin_beach.asm"

PeachPictureEntryPoint::
    ld a, [wGameplaySubtype]                      ; $67EE: $FA $96 $DB
    JP_TABLE                                      ; $67F1: $C7
._00 dw PeachPictureState0Handler                 ; $67F2
._01 dw PeachPictureState1Handler                 ; $67F4
._02 dw PeachPictureState2Handler                 ; $67F6
._03 dw PeachPictureState3Handler                 ; $67F8
._04 dw PeachPictureState4Handler                 ; $67FA
._05 dw PeachPictureState5Handler                 ; $67FC
._06 dw FileSaveFadeOut                           ; $67FE
._07 dw PeachPictureState7Handler                 ; $6800
._08 dw PeachPictureState8Handler                 ; $6802
._09 dw PeachPictureState9Handler                 ; $6804
._0A dw PeachPictureStateAHandler                 ; $6806

PeachPictureState0Handler::
    call IncrementGameplaySubtype                 ; $6808: $CD $D6 $44

    ldh  a, [hIsGBC]                              ; $680B: $F0 $FE
    and  a                                        ; $680D: $A7
    jr   z, PeachPictureState1Handler             ; $680E: $28 $19
    ld   hl, wBGPal1                              ; $6810: $21 $10 $DC
    ld   c, $80                                   ; $6813: $0E $80
    di                                            ; $6815: $F3

.loop_6816
    xor  a                                        ; $6816: $AF
    ld   [rSVBK], a                               ; $6817: $E0 $70
    ld   b, [hl]                                  ; $6819: $46
    ld   a, $03                                   ; $681A: $3E $03
    ld   [rSVBK], a                               ; $681C: $E0 $70
    ld   [hl], b                                  ; $681E: $70
    inc  hl                                       ; $681F: $23
    dec  c                                        ; $6820: $0D
    ld   a, c                                     ; $6821: $79
    and  a                                        ; $6822: $A7
    jr   nz, .loop_6816                           ; $6823: $20 $F1
    xor  a                                        ; $6825: $AF
    ld   [rSVBK], a                               ; $6826: $E0 $70
    ei                                            ; $6828: $FB

PeachPictureState1Handler::
    ld   a, $01                                   ; $6829: $3E $01
    ld   [wC167], a                               ; $682B: $EA $67 $C1
    call func_1A22                                ; $682E: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $6831: $FA $6B $C1
    cp   $04                                      ; $6834: $FE $04
    jr   nz, ret_001_6855                         ; $6836: $20 $1D
    call func_001_5888                            ; $6838: $CD $88 $58
    ldh  a, [hMapId]                              ; $683B: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $683D: $FE $06
    jr   z, .jr_6849                              ; $683F: $28 $08
    ld   a, $03                                   ; $6841: $3E $03
    ldh  [hVolumeRight], a                        ; $6843: $E0 $A9
    ld   a, $30                                   ; $6845: $3E $30
    ldh  [hVolumeLeft], a                         ; $6847: $E0 $AA

.jr_6849::
    call IncrementGameplaySubtype                 ; $6849: $CD $D6 $44
    xor  a                                        ; $684C: $AF
    ld   [wScrollXOffset], a                      ; $684D: $EA $BF $C1
    ld   a, TILESET_0F                            ; $6850: $3E $0F
    ld   [wTilesetToLoad], a                      ; $6852: $EA $FE $D6

ret_001_6855::
    ret                                           ; $6855: $C9
PeachPictureState2Handler::     ; This is for full-screen images ...
    ld   e, TILESET_EAGLES_TOWER_TOP ; First, check if it's Eagle's Tower ; $6856: $1E $21
    ldh  a, [hMapId]            ; If so, load the tower graphics for when the pillars are knocked out ; $6858: $F0 $F7
    cp   MAP_EAGLES_TOWER       ; Otherwise, check if it's room $DD (Schule's house) ; $685A: $FE $06
    jr   z, .jr_6868         ; If it is, load the ... whatever it is painting ; $685C: $28 $0A
    ldh  a, [hMapRoom]          ; Otherwise, load the Christine picture ; $685E: $F0 $F6
    cp   ROOM_INDOOR_B_SCHULE_HOUSE               ; $6860: $FE $DD
    ld   e, TILESET_CHRISTINE                     ; $6862: $1E $12
    jr   nz, .jr_6868                             ; $6864: $20 $02
    ld   e, TILESET_SCHULE_PAINTING               ; $6866: $1E $20

.jr_6868::
    ld   a, e                                     ; $6868: $7B
    ld   [wTilesetToLoad], a                      ; $6869: $EA $FE $D6
    xor  a                                        ; $686C: $AF
    ld   [wC13F], a                               ; $686D: $EA $3F $C1
    jp   IncrementGameplaySubtypeAndReturn        ; $6870: $C3 $D6 $44

PeachPictureState3Handler::     ; Determines the tilemap to load (?)
    ld   e, TILEMAP_EAGLES_TOWER_COLLAPSE         ; $6873: $1E $24
    ldh  a, [hMapId]                              ; $6875: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $6877: $FE $06
    jr   z, .jr_6885                              ; $6879: $28 $0A
    ldh  a, [hMapRoom]                            ; $687B: $F0 $F6
    cp   ROOM_INDOOR_B_SCHULE_HOUSE               ; $687D: $FE $DD
    ld   e, TILEMAP_PEACH                         ; $687F: $1E $12
    jr   nz, .jr_6885                             ; $6881: $20 $02
    ld   e, TILEMAP_SCHULE_PAINTING               ; $6883: $1E $23

.jr_6885::
    ld   a, e                                     ; $6885: $7B
    ld   [wBGMapToLoad], a                        ; $6886: $EA $FF $D6
    ld   a, $FF                                   ; $6889: $3E $FF
    ld   [wWindowY], a                            ; $688B: $EA $9A $DB
    xor  a                                        ; $688E: $AF
    ldh  [hBaseScrollX], a                        ; $688F: $E0 $96
    ldh  [hBaseScrollY], a                        ; $6891: $E0 $97
    ld   [wTransitionSequenceCounter], a          ; $6893: $EA $6B $C1
    ld   [wC16C], a                               ; $6896: $EA $6C $C1
    ld   e, $08                                   ; $6899: $1E $08
    ld   hl, wD210                                ; $689B: $21 $10 $D2

.loop_689E
    ldi  [hl], a                                  ; $689E: $22
    dec  e                                        ; $689F: $1D
    jr   nz, .loop_689E                           ; $68A0: $20 $FC
    ld   a, $01                                   ; $68A2: $3E $01
    ld   [wPaletteUnknownE], a                    ; $68A4: $EA $D5 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $68A7: $C3 $D6 $44

PeachPictureState4Handler::
    call func_6A7C                                ; $68AA: $CD $7C $6A
    call func_1A39                                ; $68AD: $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $68B0: $FA $6B $C1
    cp   $04                                      ; $68B3: $FE $04
    jr   nz, .ret_68BF                            ; $68B5: $20 $08
    call IncrementGameplaySubtype                 ; $68B7: $CD $D6 $44
    ld   a, $80                                   ; $68BA: $3E $80
    ld   [wD210], a                               ; $68BC: $EA $10 $D2

.ret_68BF
    ret                                           ; $68BF: $C9

PeachPictureState5Handler::
    ldh  a, [hMapId]                              ; $68C0: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $68C2: $FE $06
    jr   nz, .jr_68CF                             ; $68C4: $20 $09

    call func_6A7C                                ; $68C6: $CD $7C $6A
    ld   a, $07                                   ; $68C9: $3E $07
    ld   [wGameplaySubtype], a                    ; $68CB: $EA $96 $DB
    ret                                           ; $68CE: $C9

.jr_68CF::
    ldh  a, [hJoypadState]                        ; $68CF: $F0 $CC
    and  J_A | J_B | J_START                      ; $68D1: $E6 $B0
    jr   z, ret_001_68E3                          ; $68D3: $28 $0E
    ld   a, JINGLE_VALIDATE                       ; $68D5: $3E $13
    ldh  [hJingle], a                             ; $68D7: $E0 $F2

func_001_68D9::
    call IncrementGameplaySubtype                 ; $68D9: $CD $D6 $44
    xor  a                                        ; $68DC: $AF
    ld   [wTransitionSequenceCounter], a          ; $68DD: $EA $6B $C1
    ld   [wC16C], a                               ; $68E0: $EA $6C $C1

ret_001_68E3::
    ret                                           ; $68E3: $C9
PeachPictureState7Handler::
    call func_6A7C                                ; $68E4: $CD $7C $6A
    ld   a, [wD210]                               ; $68E7: $FA $10 $D2
    dec  a                                        ; $68EA: $3D
    ld   [wD210], a                               ; $68EB: $EA $10 $D2
    jr   nz, .jr_68FB                             ; $68EE: $20 $0B
    ld   [wScreenShakeVertical], a                ; $68F0: $EA $56 $C1
    ld   a, $20                                   ; $68F3: $3E $20
    ld   [wD210], a                               ; $68F5: $EA $10 $D2
    jp   IncrementGameplaySubtypeAndReturn        ; $68F8: $C3 $D6 $44

.jr_68FB::
    ld   e, $00                                   ; $68FB: $1E $00
    and  $04                                      ; $68FD: $E6 $04
    jr   z, .jr_6903                              ; $68FF: $28 $02
    ld   e, $FE                                   ; $6901: $1E $FE

.jr_6903::
    ld   a, e                                     ; $6903: $7B
    ld   [wScreenShakeVertical], a                ; $6904: $EA $56 $C1
    ret                                           ; $6907: $C9
PeachPictureState8Handler::
    call func_6A7C                                ; $6908: $CD $7C $6A
    call func_001_695B                            ; $690B: $CD $5B $69
    ld   a, [wD210]                               ; $690E: $FA $10 $D2
    dec  a                                        ; $6911: $3D
    ld   [wD210], a                               ; $6912: $EA $10 $D2
    jr   nz, .ret_6944                            ; $6915: $20 $2D
    call PlayBombExplosionSfx                     ; $6917: $CD $4B $0C
    ld   a, $30                                   ; $691A: $3E $30
    ld   [wD210], a                               ; $691C: $EA $10 $D2
    ld   a, $30                                   ; $691F: $3E $30
    ld   [wD214], a                               ; $6921: $EA $14 $D2
    ld   a, $18                                   ; $6924: $3E $18
    ld   [wD215], a                               ; $6926: $EA $15 $D2
    ld   a, [wD211]                               ; $6929: $FA $11 $D2
    add  a, $08                                   ; $692C: $C6 $08
    ld   [wD211], a                               ; $692E: $EA $11 $D2
    ld   a, [wD213]                               ; $6931: $FA $13 $D2
    inc  a                                        ; $6934: $3C
    ld   [wD213], a                               ; $6935: $EA $13 $D2
    cp   $04                                      ; $6938: $FE $04
    jr   nz, .ret_6944                            ; $693A: $20 $08
    ld   a, $80                                   ; $693C: $3E $80
    ld   [wD210], a                               ; $693E: $EA $10 $D2
    call IncrementGameplaySubtype                 ; $6941: $CD $D6 $44

.ret_6944
    ret                                           ; $6944: $C9
PeachPictureState9Handler::
    call func_6A7C                                ; $6945: $CD $7C $6A
    call func_001_695B                            ; $6948: $CD $5B $69
    ld   hl, wD210                                ; $694B: $21 $10 $D2
    dec  [hl]                                     ; $694E: $35
    ret  nz                                       ; $694F: $C0
    call IncrementGameplaySubtype                 ; $6950: $CD $D6 $44
    xor  a                                        ; $6953: $AF
    ld   [wTransitionSequenceCounter], a          ; $6954: $EA $6B $C1
    ld   [wC16C], a                               ; $6957: $EA $6C $C1
    ret                                           ; $695A: $C9

func_001_695B::
    xor  a                                        ; $695B: $AF
    ld   [wScreenShakeVertical], a                ; $695C: $EA $56 $C1
    ld   a, [wD215]                               ; $695F: $FA $15 $D2
    and  a                                        ; $6962: $A7
    jr   z, ret_001_6975                          ; $6963: $28 $10
    dec  a                                        ; $6965: $3D
    ld   [wD215], a                               ; $6966: $EA $15 $D2
    ld   e, $FE                                   ; $6969: $1E $FE
    and  $04                                      ; $696B: $E6 $04
    jr   z, .jr_6971                              ; $696D: $28 $02
    ld   e, $00                                   ; $696F: $1E $00

.jr_6971::
    ld   a, e                                     ; $6971: $7B
    ld   [wScreenShakeVertical], a                ; $6972: $EA $56 $C1

ret_001_6975::
    ret                                           ; $6975: $C9

Data_001_6976::
    db $14, $14, $10, $10, $0c, $0c               ; $6976

Data_001_697C::
    db $17, $17, $13                              ; $697C
    db $13, $0f, $0f                              ; $697F

Data_6982::
    db   $00, $00, $CC, $10                       ; $6982
    db   $00, $08, $CE, $10                       ; $6986
    db   $00, $10, $DC, $10                       ; $698A
    db   $00, $18, $CC, $30                       ; $698E
    db   $10, $00, $DE, $10                       ; $6992
    db   $10, $08, $E0, $10                       ; $6996
    db   $10, $10, $E2, $10                       ; $699A
    db   $10, $18, $DE, $30                       ; $699E
    db   $20, $00, $E4, $10                       ; $69A2
    db   $20, $08, $E6, $10                       ; $69A6
    db   $20, $10, $E8, $10                       ; $69AA
    db   $20, $18, $E4, $30                       ; $69AE
    db   $30, $00, $DE, $10                       ; $69B2
    db   $30, $08, $E0, $10                       ; $69B6
    db   $30, $10, $E0, $30                       ; $69BA
    db   $30, $18, $DE, $30                       ; $69BE
    db   $40, $00, $DE, $10                       ; $69C2
    db   $40, $08, $E0, $10                       ; $69C6
    db   $40, $10, $E0, $30                       ; $69CA
    db   $40, $18, $DE, $30                       ; $69CE

Data_69D2::
    db   $00, $10, $DC, $16                       ; $69D2
    db   $10, $10, $E2, $16                       ; $69D6
    db   $20, $10, $E8, $16                       ; $69DA
    db   $00, $00, $CC, $15                       ; $69DE
    db   $00, $08, $CE, $15                       ; $69E2
    db   $00, $10, $CE, $35                       ; $69E6
    db   $00, $18, $CC, $35                       ; $69EA
    db   $10, $00, $DE, $15                       ; $69EE
    db   $10, $08, $E0, $15                       ; $69F2
    db   $10, $10, $E0, $35                       ; $69F6
    db   $10, $18, $DE, $35                       ; $69FA
    db   $20, $00, $E4, $15                       ; $69FE
    db   $20, $08, $E6, $15                       ; $6A02
    db   $20, $10, $E6, $35                       ; $6A06
    db   $20, $18, $E4, $35                       ; $6A0A
    db   $30, $00, $DE, $15                       ; $6A0E
    db   $30, $08, $E0, $15                       ; $6A12
    db   $30, $10, $E0, $35                       ; $6A16
    db   $30, $18, $DE, $35                       ; $6A1A
    db   $40, $00, $DE, $15                       ; $6A1E
    db   $40, $08, $E0, $15                       ; $6A22
    db   $40, $10, $E0, $35                       ; $6A26
    db   $40, $18, $DE, $35                       ; $6A2A

Data_6A2E::
    db   $48, $08, $F0, $07                       ; $6A2E
    db   $48, $10, $F2, $07                       ; $6A32
    db   $48, $18, $F4, $07                       ; $6A36
    db   $48, $20, $F4, $27                       ; $6A3A
    db   $48, $28, $F2, $27                       ; $6A3E
    db   $48, $30, $F0, $27                       ; $6A42

Data_6A46::
    db   $48, $08, $F6, $07                       ; $6A46
    db   $48, $10, $F8, $07                       ; $6A4A
    db   $48, $18, $FA, $07                       ; $6A4E
    db   $48, $20, $FA, $27                       ; $6A52
    db   $48, $28, $F8, $27                       ; $6A56
    db   $48, $30, $F6, $27                       ; $6A5A

Data_6A5E::
    db   $48, $08, $FC, $07                       ; $6A5E
    db   $48, $10, $FE, $07                       ; $6A62
    db   $48, $18, $EE, $07                       ; $6A66
    db   $48, $20, $EE, $27                       ; $6A6A
    db   $48, $28, $FE, $27                       ; $6A6E
    db   $48, $30, $FC, $27                       ; $6A72

Data_6A76::
    dw Data_6A2E                                  ; $6A76
    dw Data_6A46                                  ; $6A78
    dw Data_6A5E                                  ; $6A7A

func_6A7C::
    ldh  a, [hMapId]                              ; $6A7C: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $6A7E: $FE $06
    ret  nz                                       ; $6A80: $C0

    xor  a                                        ; $6A81: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $6A82: $E0 $F1
    ldh  [hActiveEntityFlipAttribute], a          ; $6A84: $E0 $ED
    ldh  [hActiveEntityTilesOffset], a            ; $6A86: $E0 $F5
    ld   a, $38                                   ; $6A88: $3E $38
    ldh  [hActiveEntityPosX], a                   ; $6A8A: $E0 $EE
    ld   a, [wScreenShakeVertical]                ; $6A8C: $FA $56 $C1
    ld   e, a                                     ; $6A8F: $5F
    ld   a, $20                                   ; $6A90: $3E $20
    sub  a, e                                     ; $6A92: $93
    ldh  [hActiveEntityVisualPosY], a             ; $6A93: $E0 $EC
    ld   a, [wD214]                               ; $6A95: $FA $14 $D2
    and  a                                        ; $6A98: $A7
    jr   z, .jr_6AC2                              ; $6A99: $28 $27
    dec  a                                        ; $6A9B: $3D
    ld   [wD214], a                               ; $6A9C: $EA $14 $D2

    ldh  a, [hFrameCounter]                       ; $6A9F: $F0 $E7
    and  $07                                      ; $6AA1: $E6 $07
    ld   a, [wD212]                               ; $6AA3: $FA $12 $D2
    jr   nz, .jr_6AAE                             ; $6AA6: $20 $06
    inc  a                                        ; $6AA8: $3C
    cp   $03                                      ; $6AA9: $FE $03
    jr   nz, .jr_6AAE                             ; $6AAB: $20 $01
    xor  a                                        ; $6AAD: $AF
.jr_6AAE

    ld   [wD212], a                               ; $6AAE: $EA $12 $D2
    rla                                           ; $6AB1: $17
    and  $06                                      ; $6AB2: $E6 $06
    ld   e, a                                     ; $6AB4: $5F
    ld   d, b                                     ; $6AB5: $50
    ld   hl, Data_6A76                            ; $6AB6: $21 $76 $6A
    add  hl, de                                   ; $6AB9: $19
    ld   a, [hli]                                 ; $6ABA: $2A
    ld   h, [hl]                                  ; $6ABB: $66
    ld   l, a                                     ; $6ABC: $6F
    ld   c, $06                                   ; $6ABD: $0E $06
    call RenderActiveEntitySpritesRectUsingAllOAM ; $6ABF: $CD $E0 $3C

.jr_6AC2
    ld   a, $48                                   ; $6AC2: $3E $48
    ldh  [hActiveEntityPosX], a                   ; $6AC4: $E0 $EE
    ld   a, [wScreenShakeVertical]                ; $6AC6: $FA $56 $C1
    ld   e, a                                     ; $6AC9: $5F
    ld   a, [wD211]                               ; $6ACA: $FA $11 $D2
    add  a, $20                                   ; $6ACD: $C6 $20
    sub  a, e                                     ; $6ACF: $93
    ldh  [hActiveEntityVisualPosY], a             ; $6AD0: $E0 $EC
    ld   a, [wD213]                               ; $6AD2: $FA $13 $D2
    ld   e, a                                     ; $6AD5: $5F
    ld   d, $00                                   ; $6AD6: $16 $00
    ld   hl, Data_001_6976                        ; $6AD8: $21 $76 $69
    ldh  a, [hIsGBC]                              ; $6ADB: $F0 $FE
    and  a                                        ; $6ADD: $A7
    jr   z, .jr_6AE3                              ; $6ADE: $28 $03
    ld   hl, Data_001_697C                        ; $6AE0: $21 $7C $69

.jr_6AE3
    add  hl, de                                   ; $6AE3: $19
    ld   c, [hl]                                  ; $6AE4: $4E
    xor  a                                        ; $6AE5: $AF
    ld   [wOAMNextAvailableSlot], a               ; $6AE6: $EA $C0 $C3
    ld   hl, Data_6982                            ; $6AE9: $21 $82 $69
    ldh  a, [hIsGBC]                              ; $6AEC: $F0 $FE
    and  a                                        ; $6AEE: $A7
    jr   z, .jr_6AF4                              ; $6AEF: $28 $03
    ld   hl, Data_69D2                            ; $6AF1: $21 $D2 $69

.jr_6AF4
    call RenderActiveEntitySpritesRect            ; $6AF4: $CD $E6 $3C
    ret                                           ; $6AF7: $C9

include "code/face_shrine_mural.asm"

; Move selection marker and play the corresponding jingle
; This only checks for movement up/down, but several places
; in the code checks for left/right separately and then calls
; into MoveSelect.playMoveSelectionJingle to just play the jingle
MoveSelect::
    ldh  a, [hJoypadState]                        ; $6BA8: $F0 $CC
    and  J_UP | J_DOWN                            ; $6BAA: $E6 $0C
    jr   z, .return                               ; $6BAC: $28 $06
.playMoveSelectionJingle::
    push af                                       ; $6BAE: $F5
    ld   a, JINGLE_MOVE_SELECTION                 ; $6BAF: $3E $0A
    ldh  [hJingle], a                             ; $6BB1: $E0 $F2
    pop  af                                       ; $6BB3: $F1
.return::
    ret                                           ; $6BB4: $C9

; Copy the tiles and BG map for the inventory Siren Instruments to VRAM.
LoadSirenInstruments::
    ; If hBGTilesLoadingStage < 8, load tiles
    ldh  a, [hBGTilesLoadingStage]                ; $6BB5: $F0 $92
    cp   $08                                      ; $6BB7: $FE $08
    jp   c, LoadSirenInstrumentTiles              ; $6BB9: $DA $77 $6C
    ; else if hBGTilesLoadingStage > 8,
    ; load BG left side and finish
    jr   nz, .loadLeftSide                        ; $6BBC: $20 $08
    ; else if if hBGTilesLoadingStage == 8,
    ; load BG right side and increment
    call LoadInstrumentsBG.rightSide              ; $6BBE: $CD $F0 $6B
    ld   hl, hBGTilesLoadingStage                 ; $6BC1: $21 $92 $FF
    inc  [hl]                                     ; $6BC4: $34
    ret                                           ; $6BC5: $C9

.loadLeftSide
    call LoadInstrumentsBG.leftSide               ; $6BC6: $CD $EA $6B
    xor  a                                        ; $6BC9: $AF
    ldh  [hNeedsUpdatingBGTiles], a               ; $6BCA: $E0 $90
    ldh  [hBGTilesLoadingStage], a                ; $6BCC: $E0 $92
    ret                                           ; $6BCE: $C9

Data_001_6BCF::  ; Instrument on inventory menu position ($9D00 is added to get to background position)
    db $0F, $51, $B1, $EF, $EC, $AA, $4A, $0C     ; $6BCF

Data_001_6BD7::  ; Instrument on inventory menu, number tile
    db $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8     ; $6BD7

Data_001_6BDF::  ; Instrument on inventory menu, instrument tile (top left corner)
    db $D0, $D2, $D4, $D6, $D8, $DA, $DC, $DE     ; $6BDF

Data_001_6BE7::
    db 1, $1F, 1                                  ; $6BE7

; CopyToBG the BG map for the Siren Instruments in the inventory.
;
; The BG map for 4 instruments will be loaded–either for instruments
; on the left side of the inventory, or for those on the right side.
LoadInstrumentsBG::
.leftSide
    ; loop from 8 to 4
    ld   c, $08                                   ; $6BEA
    ld   e, $04                                   ; $6BEC
    jr   LoadInstrumentsBG.start                  ; $6BEE

.rightSide
    ; loop from 4 to 0
    ld   c, $04                                   ; $6BF0
    ld   e, $00                                   ; $6BF2

.start
    ; hMultiPurpose9 = c (loop counter)
    ld   a, c                                     ; $6BF4: $79
    ldh  [hMultiPurpose9], a                      ; $6BF5: $E0 $E0
    ld   d, $00                                   ; $6BF7: $16 $00

.loop
    xor  a                                        ; $6BF9: $AF
    ldh  [hMultiPurpose0], a                      ; $6BFA: $E0 $D7
    ldh  [hMultiPurpose1], a                      ; $6BFC: $E0 $D8
    ldh  [hMultiPurpose2], a                      ; $6BFE: $E0 $D9
    ldh  [hMultiPurpose3], a                      ; $6C00: $E0 $DA

    ; If the player got the instrument already, display its picture;
    ; otherwise display a numbered placeholder.
    ld   hl, wHasInstrument1                      ; $6C02: $21 $65 $DB
    add  hl, de                                   ; $6C05: $19
    ld   a, [hl]                                  ; $6C06: $7E
    bit  1, a                                     ; $6C07: $CB $4F
    jp   nz, .loadInstrumentTilemap               ; $6C09: $C2 $2A $6C

.loadPlaceholderTilemap
    ld   c, $00                                   ; $6C0C: $0E $00
    ld   b, c                                     ; $6C0E: $41
    ld   hl, Data_001_6BCF                        ; $6C0F: $21 $CF $6B
    add  hl, de                                   ; $6C12: $19
    ld   a, [hl]                                  ; $6C13: $7E
    ld   l, a                                     ; $6C14: $6F
    ld   h, $9D                                   ; $6C15: $26 $9D
    push hl                                       ; $6C17: $E5
    ld   a, $7C                                   ; $6C18: $3E $7C
    ldh  [hMultiPurpose0], a                      ; $6C1A: $E0 $D7
    ldh  [hMultiPurpose1], a                      ; $6C1C: $E0 $D8
    ldh  [hMultiPurpose2], a                      ; $6C1E: $E0 $D9
    ld   hl, Data_001_6BD7                        ; $6C20: $21 $D7 $6B
    add  hl, de                                   ; $6C23: $19
    ld   a, [hl]                                  ; $6C24: $7E
    ldh  [hMultiPurpose3], a                      ; $6C25: $E0 $DA
    pop  hl                                       ; $6C27: $E1
    jr   .copyToBG                                ; $6C28: $18 $1E

.loadInstrumentTilemap
    ld   c, $00                                   ; $6C2A: $0E $00
    ld   b, c                                     ; $6C2C: $41
    ld   hl, Data_001_6BCF                        ; $6C2D: $21 $CF $6B
    add  hl, de                                   ; $6C30: $19
    ld   a, [hl]                                  ; $6C31: $7E
    ld   l, a                                     ; $6C32: $6F
    ld   h, $9D                                   ; $6C33: $26 $9D
    push hl                                       ; $6C35: $E5
    ld   hl, Data_001_6BDF                        ; $6C36: $21 $DF $6B
    add  hl, de                                   ; $6C39: $19
    ld   a, [hl]                                  ; $6C3A: $7E
    ldh  [hMultiPurpose0], a                      ; $6C3B: $E0 $D7
    inc  a                                        ; $6C3D: $3C
    ldh  [hMultiPurpose1], a                      ; $6C3E: $E0 $D8
    add  a, $0F                                   ; $6C40: $C6 $0F
    ldh  [hMultiPurpose2], a                      ; $6C42: $E0 $D9
    inc  a                                        ; $6C44: $3C
    ldh  [hMultiPurpose3], a                      ; $6C45: $E0 $DA
    pop  hl                                       ; $6C47: $E1

.copyToBG
    ldh  a, [hMultiPurpose0]                      ; $6C48: $F0 $D7
    ld   [hl], a                                  ; $6C4A: $77
    call GetInstrumentNextBGAddress               ; $6C4B: $CD $69 $6C
    ldh  a, [hMultiPurpose1]                      ; $6C4E: $F0 $D8
    ld   [hl], a                                  ; $6C50: $77
    inc  c                                        ; $6C51: $0C
    call GetInstrumentNextBGAddress               ; $6C52: $CD $69 $6C
    ldh  a, [hMultiPurpose2]                      ; $6C55: $F0 $D9
    ld   [hl], a                                  ; $6C57: $77
    inc  c                                        ; $6C58: $0C
    call GetInstrumentNextBGAddress               ; $6C59: $CD $69 $6C
    ldh  a, [hMultiPurpose3]                      ; $6C5C: $F0 $DA
    ld   [hl], a                                  ; $6C5E: $77

    ; loop while c > e
    inc  e                                        ; $6C5F: $1C
    ld   a, e                                     ; $6C60: $7B
    ld   hl, hMultiPurpose9                       ; $6C61: $21 $E0 $FF
    cp   [hl]                                     ; $6C64: $BE
    jp   nz, .loop                                ; $6C65: $C2 $F9 $6B

    ret                                           ; $6C68: $C9

; Return the address of the next BG location for an instrument.
GetInstrumentNextBGAddress::
    push hl                                       ; $6C69: $E5
    ld   hl, Data_001_6BE7                        ; $6C6A: $21 $E7 $6B
    add  hl, bc                                   ; $6C6D: $09
    ld   a, [hl]                                  ; $6C6E: $7E
    pop  hl                                       ; $6C6F: $E1
    add  a, l                                     ; $6C70: $85
    ld   l, a                                     ; $6C71: $6F
    ld   a, h                                     ; $6C72: $7C
    adc  a, $00                                   ; $6C73: $CE $00
    ld   h, a                                     ; $6C75: $67
    ret                                           ; $6C76: $C9

; Copy tiles for a siren instrument to VRAM,
; then increment hBGTilesLoadingStage.
;
; Inputs:
;   a    index of the instrument to load
LoadSirenInstrumentTiles::
    ld   c, a                                     ; $6C77: $4F
    ld   b, $00                                   ; $6C78: $06 $00
    sla  c                                        ; $6C7A: $CB $21
    rl   b                                        ; $6C7C: $CB $10
    sla  c                                        ; $6C7E: $CB $21
    rl   b                                        ; $6C80: $CB $10
    sla  c                                        ; $6C82: $CB $21
    rl   b                                        ; $6C84: $CB $10
    sla  c                                        ; $6C86: $CB $21
    rl   b                                        ; $6C88: $CB $10
    sla  c                                        ; $6C8A: $CB $21
    rl   b                                        ; $6C8C: $CB $10
    sla  c                                        ; $6C8E: $CB $21
    rl   b                                        ; $6C90: $CB $10
    ld   hl, $8D00                                ; $6C92: $21 $00 $8D
    add  hl, bc                                   ; $6C95: $09
    ld   e, l                                     ; $6C96: $5D
    ld   d, h                                     ; $6C97: $54
    ld   hl, SirenInstrumentsTiles                ; $6C98: $21 $00 $4D
    add  hl, bc                                   ; $6C9B: $09
    call CopySirenInstrumentTiles                 ; $6C9C: $CD $3A $0C
    ldh  a, [hBGTilesLoadingStage]                ; $6C9F: $F0 $92
    inc  a                                        ; $6CA1: $3C
    ldh  [hBGTilesLoadingStage], a                ; $6CA2: $E0 $92
    ret                                           ; $6CA4: $C9

; Coordinates of the borders surrounding the room objects
RoomBorderCoordinates::
    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B ; $6CA5
    db $10,                                                   $1B ; $6CB1
    db $20,                                                   $2B ; $6CB3
    db $30,                                                   $3B ; $6CB5
    db $40,                                                   $4B ; $6CB7
    db $50,                                                   $5B ; $6CB9
    db $60,                                                   $6B ; $6CBB
    db $70,                                                   $7B ; $6CBD
    db $80,                                                   $8B ; $6CBF
    db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B ; $6CC1
    db $FF                                        ; $6CCD

; Surround the objects area defining a room by ROOM_BORDER values
PadRoomObjectsArea::
    ld   bc, RoomBorderCoordinates                ; $6CCE: $01 $A5 $6C
.loop
    ; a = next border coordinate
    ld   a, [bc]                                  ; $6CD1: $0A

    ; if the border reached $FF, exit loop
    cp   $FF                                      ; $6CD2: $FE $FF
    jr   z, .end                                  ; $6CD4: $28 $0C

    ; hl = wRoomObjectsArea + next border coordinate
    ld   e, a                                     ; $6CD6: $5F
    ld   d, $00                                   ; $6CD7: $16 $00
    ld   hl, wRoomObjectsArea                     ; $6CD9: $21 $00 $D7
    add  hl, de                                   ; $6CDC: $19

    ; write the border
    ld   [hl], ROOM_BORDER                        ; $6CDD: $36 $FF

    ; increment and roosterContinue
    inc  bc                                       ; $6CDF: $03
    jr   .loop                                    ; $6CE0: $18 $EF
.end
    ret                                           ; $6CE2: $C9

; Fade from white?
;
; Used when:
; - Displaying a menu
; - Displaying a static picture (peach, eagle's tower collapse)
LoadTileset0F::
    ld   bc, $400                                 ; $6CE3: $01 $00 $04
    ld   hl, vBGMap0                              ; $6CE6: $21 $00 $98

.loop
    ld   e, $00                                   ; $6CE9: $1E $00
    ld   a, l                                     ; $6CEB: $7D
    and  $20                                      ; $6CEC: $E6 $20
    jr   z, .jr_001_6CF1                          ; $6CEE: $28 $01
    inc  e                                        ; $6CF0: $1C

.jr_001_6CF1
    ld   d, $AE                                   ; $6CF1: $16 $AE
    ld   a, l                                     ; $6CF3: $7D
    and  $01                                      ; $6CF4: $E6 $01
    xor  e                                        ; $6CF6: $AB
    jr   z, .jr_001_6CFA                          ; $6CF7: $28 $01
    inc  d                                        ; $6CF9: $14

.jr_001_6CFA
    ld   a, l                                     ; $6CFA: $7D
    and  $1F                                      ; $6CFB: $E6 $1F
    cp   $14                                      ; $6CFD: $FE $14
    jr   nc, .jr_001_6D02                         ; $6CFF: $30 $01
    ld   [hl], d                                  ; $6D01: $72

.jr_001_6D02
    inc  hl                                       ; $6D02: $23
    dec  bc                                       ; $6D03: $0B
    ld   a, b                                     ; $6D04: $78
    or   c                                        ; $6D05: $B1
    jr   nz, .loop                                ; $6D06: $20 $E1

    ldh  a, [hIsGBC]                              ; $6D08: $F0 $FE
    and  a                                        ; $6D0A: $A7
    jr   z, .jr_001_6D10                          ; $6D0B: $28 $03
    call func_001_6D11                            ; $6D0D: $CD $11 $6D

.jr_001_6D10
    ret                                           ; $6D10: $C9

func_001_6D11::
    ld   d, $05                                   ; $6D11: $16 $05
    ld   a, [wGameplayType]                       ; $6D13: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $6D16: $FE $0B
    jr   z, .jr_6D1C                              ; $6D18: $28 $02
    ld   d, $06                                   ; $6D1A: $16 $06

.jr_6D1C::
    ld   a, $01                                   ; $6D1C: $3E $01
    ld   [rVBK], a                                ; $6D1E: $E0 $4F
    ld   hl, vBGMap0                              ; $6D20: $21 $00 $98
    ld   bc, $400                                 ; $6D23: $01 $00 $04

.loop_6D26
    ld   a, d                                     ; $6D26: $7A
    ldi  [hl], a                                  ; $6D27: $22
    dec  bc                                       ; $6D28: $0B
    ld   a, b                                     ; $6D29: $78
    or   c                                        ; $6D2A: $B1
    jr   nz, .loop_6D26                           ; $6D2B: $20 $F9
    ld   a, $00                                   ; $6D2D: $3E $00
    ld   [rVBK], a                                ; $6D2F: $E0 $4F
    ret                                           ; $6D31: $C9

include "code/oam_dma.asm"

IntroRainTiles::
incbin "src/gfx/intro/rain.2bpp"

; Background tile where the Dungeon entrance arrow should be displayed
MinimapEntrancePosition::
    dw vBGMap1 + $20B + MINIMAP_ARROW_TAIL_CAVE   ; $6DCA
    dw vBGMap1 + $20B + MINIMAP_ARROW_BOTTLE_GROTTO ; $6DCC
    dw vBGMap1 + $20B + MINIMAP_ARROW_KEY_CAVERN  ; $6DCE
    dw vBGMap1 + $20B + MINIMAP_ARROW_ANGLERS_TUNNEL ; $6DD0
    dw vBGMap1 + $20B + MINIMAP_ARROW_CATFISHS_MAW ; $6DD2
    dw vBGMap1 + $20B + MINIMAP_ARROW_FACE_SHRINE ; $6DD4
    dw vBGMap1 + $20B + MINIMAP_ARROW_EAGLES_TOWER ; $6DD6
    dw vBGMap1 + $20B + MINIMAP_ARROW_TURTLE_ROCK ; $6DD8
    dw $0    ; (unused)                           ; $6DDA
    dw $0    ; (unused)                           ; $6DDC
    dw $0    ; (unused)                           ; $6DDE
    dw $0    ; (unused)                           ; $6DE0
    dw $0    ; (unused)                           ; $6DE2
    dw $0    ; (unused)                           ; $6DE4
    dw $0    ; (unused)                           ; $6DE6
    dw vBGMap1 + $20B + MINIMAP_ARROW_COLOR_DUNGEON ; $6DE8

; Called after tiles are copied to the BG when loading a map all at once
UpdateMinimapEntranceArrowAndReturn::
    ; If DebugTool2 is enabled, return immediately
    ld   a, [ROM_DebugTool2]                      ; $6DEA: $FA $04 $00
    and  a                                        ; $6DED: $A7
    ret  nz                                       ; $6DEE: $C0

    ; If IsIndoor…
    ld   a, [wIsIndoor]                           ; $6DEF: $FA $A5 $DB
    and  a                                        ; $6DF2: $A7
    jr   z, .return                               ; $6DF3: $28 $23
    ; then a = (MapId == MAP_COLOR_DUNGEON ? $0F : MapId)
    ldh  a, [hMapId]                              ; $6DF5: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $6DF7: $FE $FF
    jr   nz, .notColorDungeon                     ; $6DF9: $20 $04
    ld   a, $0F                                   ; $6DFB: $3E $0F
    jr   .endIf                                   ; $6DFD: $18 $04

.notColorDungeon
    ; If MapId >= 8 (not a dungeon), return
    cp   $08                                      ; $6DFF: $FE $08
    jr   nc, .return                              ; $6E01: $30 $15
.endIf

    ; hl = MinimapEntrancePosition[MapId]
    sla  a                                        ; $6E03: $CB $27
    ld   e, a                                     ; $6E05: $5F
    ld   d, $00                                   ; $6E06: $16 $00
    ld   hl, MinimapEntrancePosition              ; $6E08: $21 $CA $6D
    add  hl, de                                   ; $6E0B: $19
    ld   a, [hli]                                 ; $6E0C: $2A
    ld   h, [hl]                                  ; $6E0D: $66
    ld   l, a                                     ; $6E0E: $6F

    ; Display the Minimap Arrow tile ($A3) at the target address
    ld   [hl], $A3                                ; $6E0F: $36 $A3

    ; If IsSideScrolling…
    ldh  a, [hIsSideScrolling]                    ; $6E11: $F0 $F9
    and  a                                        ; $6E13: $A7
    jr   z, .return                               ; $6E14: $28 $02
    ; … hide the arrow.
    ld   [hl], $7F                                ; $6E16: $36 $7F

.return
    ret                                           ; $6E18: $C9

include "code/intro.asm"
