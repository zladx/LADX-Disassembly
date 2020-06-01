;
; TODO: move these pieces of code to named files
; (instead of the generic "bank1.asm")
;

DebugSaveFileData::
    db INVENTORY_SHIELD          ; B button
    db INVENTORY_SWORD           ; A button
    db INVENTORY_BOMBS           ; Inventory slots
    db INVENTORY_POWER_BRACELET  ; .
    db INVENTORY_BOW             ; .
    db INVENTORY_HOOKSHOT        ; .
    db INVENTORY_MAGIC_ROD       ; .
    db INVENTORY_PEGASUS_BOOTS   ; .
    db INVENTORY_OCARINA         ; .
    db INVENTORY_ROCS_FEATHER    ; .
    db INVENTORY_SHOVEL          ; .
    db INVENTORY_MAGIC_POWDER    ; .

    db 1  ; Have Flippers
    db 1  ; Have Medicine
    db 1  ; Trading item = Yoshi doll
    db 0  ; 0 Secret Seashells
    db 0  ; (@TODO "Medicine count: found?")
    db 1  ; Have Tail Key
    db 1  ; Have Angler Key
    db 1  ; Have Face Key
    db 1  ; Have Bird Key
    db 0  ; 0 Golden Leaves / no Slime Key

    ; Dungeon flags ...
    ;  +-------------- Map
    ;  |  +----------- Compass
    ;  |  |  +-------- Owl Beak / Stone Tablet
    ;  |  |  |  +----- Nightmare Key
    ;  |  |  |  |  +-- Small keys
    ;  |  |  |  |  |
    db 1, 1, 1, 1, 1 ; Tail Cave
    db 1, 1, 1, 1, 2 ; Bottle Grotto
    db 1, 1, 1, 1, 3 ; Key Cavern
    db 1, 1, 1, 1, 4 ; Angler's Tunnel
    db 1, 1, 1, 1, 5 ; Catfish's Maw
    db 1, 1, 1, 1, 6 ; Face Shrine
    db 1, 1, 1, 1, 7 ; Eagle's Tower
    db 1, 1, 1, 1, 8 ; Turtle Rock
    db 1, 1, 1, 1, 9 ; POI: unused? (9th dungeon?)

DEBUG_SAVE_FILE_SIZE equ @ - DebugSaveFileData


; Initialize save files, and load debug save file if needed
InitSaveFiles::
    ; Initialize the battery-backed memory used for save files
    ld   de, $00
    call func_001_4794
    ld   de, $3AD
    call func_001_4794
    ld   de, $75A
    call func_001_4794

    ; POI: If DebugTool1 is enabled,
    ; write a default save file with everything unlocked
    ld   a, [ROM_DebugTool1]
    and  a
    jp   z, .return

    ld   e, $00
    ld   d, $00
    ld   bc, $A405
.loop
    ld   hl, DebugSaveFileData
    add  hl, de
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    inc  e
    ld   a, e
    cp   DEBUG_SAVE_FILE_SIZE
    jr   nz, .loop

    ; Set some other parts of the first save file ...
    ld   a, $01
    ld   [$A453], a ; Sword level 1
    ld   a, $01
    ld   [$A449], a ; Shield level 1
    ld   a, $02
    ld   [$A448], a ; Power bracelet level 2

    ; Set boss flags for all dungeons
    ld   hl, $A46A ; Dungeon boss flags = 00000010
    ld   e, $09 ; POI: Sets 9 flags (but only 8 dungeons...?)
    ld   a, $02 ; Sets 46A~447
.loop2
    ldi  [hl], a
    dec  e
    jr   nz, .loop2

    ld   a, $60
    ld   [$A452], a ; 60 bombs
    ld   [$A47C], a ; 60 max bombs
    ld   [$A47D], a ; 60 max arrows
    ld   [$A44A], a ; 60 arrows
    ld   a, $40
    ld   [$A47B], a ; 40 max magic powder
    ld   [$A451], a ; 40 magic powder
    ld   a, $89
    ld   [$A44C], a ; "time/animation?" (unknown)
    xor  a
    ld   [$A414], a ; 0 secret seashells
    ld   a, %00000111 ; @TODO Ocarina song constants?
    ld   [$A44E], a ; all 3 Ocarina songs
    ld   a, $05
    ld   [$A462], a ; 5xx rupees
    ld   a, $09
    ld   [$A463], a ; x09 rupees
    ld   a, $01
    ld   [$A44D], a ; "Tarin at home flag"
    ld   a, $50
    ld   [$A45F], a ; 10 hearts of health
    ld   a, $0A
    ld   [$A460], a ; 10 heart containers

    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_NEW
PUSHC
SETCHARMAP NameEntryCharmap
    jr   z, .notOnNewFileScreen
    ld   a, "Z"     ; Set save file name to "ZELDA"
    ld   [$A454], a
    ld   a, "E"
    ld   [$A455], a
    ld   a, "L"
    ld   [$A456], a
    ld   a, "D"
    ld   [$A457], a
    ld   a, "A"
    ld   [$A458], a
POPC
.notOnNewFileScreen
    xor  a
    ld   [$A45C], a ; death counter = 0
    ld   [$A45D], a ; death counter = 0
    ld   [$A45B], a ; bowwow flag = off
    ld   [$A464], a ; current map = overworld
    ld   [$A465], a ; current submap = none
    ld   a, $92
    ld   [$A466], a ; saved room = flying rooster in mabe village
    ld   a, $48
    ld   [$A467], a ; saved y position
    ld   a, $62
    ld   [$A468], a ; saved x position

    ; Set all overworld map tiles as seen (80)
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

func_001_4794::
    ld   c, $01
    ld   b, $05
    ld   hl, $A100
    add  hl, de

jr_001_479C::
    call EnableExternalRAMWriting
    ld   a, [hli]
    cp   c
    jr   nz, jr_001_47AA
    inc  c
    inc  c
    dec  b
    jr   nz, jr_001_479C
    jr   jr_001_47CD

jr_001_47AA::
    push de
    ; hl = savefile
    ld   hl, $A105
    add  hl, de

    ; de = sizeof(save)
    ld   de, $3A8

jr_001_47B2::
    call EnableExternalRAMWriting
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_47B2
    pop  de
    ld   hl, $A100
    add  hl, de
    ld   a, $01

jr_001_47C3::
    call EnableExternalRAMWriting
    ldi  [hl], a
    inc  a
    inc  a
    cp   $0B
    jr   c, jr_001_47C3

jr_001_47CD::
    ret

include "code/file_menus.asm"

; Table that determines how much health you have after a game over.
; New files always start with 3 HP / 3 MAX HP, but after that
; the health you're provided on respawning depends on your max:
MaxHealthToStartingHealthTable::
    db  3 FULL_HEARTS  ;  0 heart containers
    db  3 FULL_HEARTS  ;  1 heart container
    db  3 FULL_HEARTS  ;  2 heart containers
    db  3 FULL_HEARTS  ;  3 heart containers
    db  3 FULL_HEARTS  ;  4 heart containers
    db  3 FULL_HEARTS  ;  5 heart containers

    db  5 FULL_HEARTS  ;  6 heart containers
    db  5 FULL_HEARTS  ;  7 heart containers
    db  5 FULL_HEARTS  ;  8 heart containers
    db  5 FULL_HEARTS  ;  9 heart containers

    db  7 FULL_HEARTS  ; 10 heart containers
    db  7 FULL_HEARTS  ; 11 heart containers
    db  7 FULL_HEARTS  ; 12 heart containers
    db  7 FULL_HEARTS  ; 13 heart containers

    db 10 FULL_HEARTS  ; 14 heart containers

; Main entry point for loading a saved game
LoadSavedFile::
    xor  a                                      ; Can never save in a side-scrolling area
    ldh  [hIsSideScrolling], a                  ; so make sure that flag is not set
    ld   a, [wHealth]                           ; Does the player have any health?
    and  a                                      ; If yes, skip this
    jr   nz, .skipHealthReset
    ld   a, [wMaxHealth]                        ; Otherwise, get their max health...
    ld   e, a
    ld   d, $00
    ld   hl, MaxHealthToStartingHealthTable     ; and use it as an index into the table
    add  hl, de                                 ; to provide the starting health value.
    ld   a, [hl]
    ld   [wHealth], a

.skipHealthReset:
    ld   hl, $DBD1
    ld   a, [hl]
    ld   [hl], $00
    and  a
    jr   nz, jr_001_531D
    ld   a, [wSaveSlot]

jr_001_52C7::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_49F8
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   hl, wOverworldRoomStatus
    ld   de, $0380

jr_001_52D9::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_52D9

    ld de, wMaxHealth
    ld hl, wHealth
    ld a, [de]
    cp $03
    jr nc, jr_001_5355

    ld a, $03

jr_001_5355:
    cp $0e
    jr c, jr_001_535b

    ld a, $0e

jr_001_535b:
    ld [de], a
    swap a
    srl a
    cp [hl]
    jr nc, jr_001_5364

    ld [hl], a
jr_001_5364:

    ld   hl, $DDDA
    ld   de, $05

jr_001_52EA::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_52EA
    ld   hl, $DDE0
    ld   de, $20

jr_001_52FB::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_52FB
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

jr_001_531D::
    ld   a, GAMEPLAY_WORLD
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    xor  a
    ld   [wLinkMotionState], a
    ldh  [$FF9C], a
    ld   [wAddHealthBuffer], a
    ld   [wSubtractHealthBuffer], a
    ld   [wAddRupeeBufferLow], a
    ld   [wAddRupeeBufferHigh], a
    ld   [wSubstractRupeeBufferLow], a
    ld   [wSubstractRupeeBufferHigh], a
    ld   a, [wWreckingBallRoom]
    and  a
    jr   nz, .setStartingPoint
    ld   a, $16
    ld   [wWreckingBallRoom], a
    ld   a, $50
    ld   [wWreckingBallPosX], a
    ld   a, $27
    ld   [wWreckingBallPosY], a

.setStartingPoint
    ld   a, [wSpawnPositionX]
    and  a
    jr   z, .initNewGame
    ld   [wMapEntrancePositionX], a

    ld   a, [wSpawnPositionY]
    ld   [wMapEntrancePositionY], a

    ld   a, [wSpawnMapRoom]
    ldh  [hMapRoom], a
    ld   [wMapEntranceRoom], a

    ld   a, [wSpawnMapId]
    ldh  [hMapId], a

    ld   a, [wSpawnIndoorRoom]
    ld   [wIndoorRoom], a

    xor  a
    ldh  [hIsSideScrolling], a

    ld   a, $03
    ldh  [hLinkDirection], a

    ld   a, [wSpawnIsIndoor]
    and  $01
    ld   [wIsIndoor], a

    jr   z, .finish

    ld   a, $04
    ldh  [hLinkAnimationState], a

    ld   a, $02
    ldh  [hLinkDirection], a

.finish
    ld   a, $02
    ld   [wBGMapToLoad], a
    ret

; Initializes some stuff related to starting a new game
; 30 max arrows, 30 max bombs, 20 max magic powder,
; places you in Marin's room in the bed, etc
.initNewGame
    ld   a, $30
    ld   [wMaxArrows], a
    ld   a, $30
    ld   [wMaxBombs], a
    ld   a, $20
    ld   [wMaxMagicPowder], a
    ld   a, $A3
    ld   [wMapEntranceRoom], a
    ldh  [hMapRoom], a
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
    ldh  [hLinkDirection], a
    ld   a, $16
    ld   [wWreckingBallRoom], a
    ld   a, $50
    ld   [wWreckingBallPosX], a
    ld   a, $27
    ld   [wWreckingBallPosY], a
    jr   .finish


Data_001_53D8::
    db   $9D, $9D, $9D, $FF, $9D, $9D, $9D, $FF   ; $53D8
    db   $9D, $9D, $9C, $FF, $9D, $9D, $9C, $FF   ; $53E0

Data_001_53E8::
    db   $32, $32, $09, $FF, $2E, $2E, $09, $FF   ; $53E8
    db   $8A, $32, $E9, $FF, $8A, $2E, $E9, $FF   ; $53F0

Data_001_53F8::
    db   $C8, $C8, $00, $FF, $C8, $C8, $00, $FF   ; $53F8
    db   $48, $C8, $00, $FF, $48, $C8, $00, $FF   ; $5400

Data_001_5408::
    db   $7F, $7F, $BA, $FF, $7F, $7F, $BA, $FF   ; $5408
    db   $7F, $7F, $BA, $FF, $7F, $7F, $BA, $FF   ; $5410

Data_001_5418::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $5418
    db   $9D, $9D, $FF, $00, $9D, $9D, $9D, $FF   ; $5420
    db   $9D, $9C, $FF, $00, $9D, $9C, $9C, $FF   ; $5428
    db   $9D, $9D, $9C, $9C, $FF, $00, $00, $00   ; $5430
    db   $00, $00, $00, $9D, $9D, $9C, $9C, $9C   ; $5438
    db   $9C, $FF, $00, $00, $00, $00, $9D, $9D   ; $5440
    db   $9C, $9C, $9D, $9D, $9C, $9C, $FF, $00   ; $5448
    db   $00, $9D, $9D, $9C, $9C, $9D, $9D, $9C   ; $5450
    db   $9C, $9C, $9C, $FF                       ; $5458

Data_001_545C::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $545C
    db   $0D, $12, $FF, $00, $0D, $11, $12, $FF   ; $5464
    db   $92, $F2, $FF, $00, $92, $F1, $F2, $FF   ; $546C
    db   $8D, $92, $ED, $F2, $FF, $00, $00, $00   ; $5474
    db   $00, $00, $00, $8D, $92, $ED, $F2, $F1   ; $547C
    db   $F2, $FF, $00, $00, $00, $00, $8D, $92   ; $5484
    db   $ED, $F2, $91, $92, $F1, $F2, $FF, $00   ; $548C
    db   $00, $8D, $92, $ED, $F2, $91, $92, $EC   ; $5494
    db   $ED, $F1, $F2, $FF                       ; $549C

Data_001_54A0::
    db   $00, $00, $00, $FF, $00, $00, $00, $FF   ; $54A0
    db   $E8, $E9, $FF, $00, $E8, $7F, $EC, $FF   ; $54A8
    db   $E8, $E9, $FF, $00, $E8, $EC, $E8, $FF   ; $54B0
    db   $E8, $EA, $E9, $EB, $FF, $00, $00, $00   ; $54B8
    db   $00, $00, $00, $E8, $EA, $E9, $EB, $EC   ; $54C0
    db   $E8, $FF, $00, $00, $00, $00, $E8, $EA   ; $54C8
    db   $E9, $EB, $EC, $E8, $EC, $E9, $FF, $00   ; $54D0
    db   $00, $E8, $EA, $E9, $EB, $EC, $E8, $EC   ; $54D8
    db   $EA, $EC, $E9, $FF                       ; $54E0

Data_001_54E4::
    db   $9D, $9C                                 ; $54E4

Data_001_54E6::
    db $A, $EA

Data_001_54E8::
    db $9C, $E9, $49, $7F, $9D, $09, $49, $7F, $9D, $29, $49, $7F, $9D, $49, $49, $7F
    db $9D, $69, $49, $7F, $9D, $89, $49, $7F, $9D, $A9, $49, $7F, $9D, $C9, $49, $7F
    db $9D, $E9, $49, $7F, $9E, $09, $49, $7F, $00

func_001_5511::
    ; Copy $29 bytes from Data_001_54E8 to $D650
    ld   hl, Data_001_54E8
    ld   de, $D650
    ld   c, $29
.copyLoop
    ld   a, [hli]
    inc  de
    ld   [de], a
    dec  c
    jr   nz, .copyLoop

    push de
    xor  a
    ldh  [hScratch0], a
    ldh  [hScratch1], a
    ldh  [hScratch2], a
    ldh  [hScratch3], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [wMinimapLayout]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, jr_001_5543

.loop
    ld   a, c
    add  a, $04
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, .loop
    ld   b, $00

jr_001_5543::
    pop  hl

jr_001_5544::
    push hl
    ld   hl, Data_001_53D8
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch0], a
    ld   hl, Data_001_53E8
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch1], a
    ld   hl, Data_001_53F8
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch2], a
    ld   hl, Data_001_5408
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch3], a
    pop  hl
    call func_001_5619
    push hl
    ld   hl, Data_001_53D8
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, jr_001_5544
    xor  a
    ld   [hl], a
    xor  a
    ldh  [hScratch0], a
    ldh  [hScratch1], a
    ldh  [hScratch2], a
    ldh  [hScratch3], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [wMinimapLayout]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, jr_001_55EA

jr_001_558C::
    ld   b, $00
    ld   a, c
    add  a, $08
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, jr_001_558C
    ld   a, [wMinimapLayout]
    and  $03
    jr   z, jr_001_55C0
    ld   a, [wMinimapLayout]
    and  $30
    cp   $30
    jr   z, jr_001_55AF
    ld   a, c
    add  a, $04
    ld   c, a
    ld   b, $00
    jr   jr_001_55C0

jr_001_55AF::
    ld   a, [wMinimapLayout]
    and  $03
    ld   e, a

jr_001_55B5::
    ld   b, $00
    ld   a, c
    add  a, $0B
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, jr_001_55B5

jr_001_55C0::
    push hl
    ld   hl, Data_001_5418
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch0], a
    ld   hl, Data_001_545C
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch1], a
    xor  a
    ldh  [hScratch2], a
    ld   hl, Data_001_54A0
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch3], a
    pop  hl
    call func_001_5619
    push hl
    ld   hl, Data_001_5418
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, jr_001_55C0

jr_001_55EA::
    xor  a
    ld   b, a
    ld   c, a
    ld   a, [wMinimapLayout]
    bit  5, a
    jr   z, jr_001_55F5
    inc  bc

jr_001_55F5::
    push hl
    ld   hl, Data_001_54E4
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch0], a
    ld   hl, Data_001_54E6
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch1], a
    ld   a, $01
    ldh  [hScratch2], a
    ldh  a, [hMapId]
    add  a, $B1
    ldh  [hScratch3], a
    pop  hl
    call func_001_5619
    inc  hl
    ld   a, $7F
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

func_001_5619::
    ldh  a, [hScratch0]
    ldi  [hl], a
    ldh  a, [hScratch1]
    ldi  [hl], a
    ldh  a, [hScratch2]
    ldi  [hl], a
    ldh  a, [hScratch3]
    ld   [hl], a
    ret

include "code/world_map.asm"

PeachPictureStateAHandler::
    call func_6A7C

FileSaveFadeOut::
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_58A7
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_001_5854
    ld   hl, $DC10
    ld   c, $80
    di

jr_001_583A::
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
    jr   nz, jr_001_583A
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

jr_001_5854::
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
    jr   nz, jr_001_5885
    ld   a, $07

jr_001_5885::
    ld   [wTileMapToLoad], a

func_001_5888::
    ld   hl, wRoomTransitionState
    ld   e, $00

jr_001_588D::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, jr_001_588D

func_001_5895::
    ld   a, $80
    ld   [wWindowY], a
    ld   a, $07
    ld   [rWX], a
    ld   a, $08
    ld   [wC150], a
    xor  a
    ld   [wInventoryAppearing], a

jr_001_58A7::
    ret

func_001_58A8::
    ld   hl, $C09C
    ld   a, [wDB54]
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   a, [wDB54]
    swap a
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   [hl], $3E
    inc  hl
    ldh a, [hIsGBC]
    and a
    jr z, jr_001_592f
    ld a, $00
    ld [hl], a
    ldh a, [hFrameCounter]
    and $08
    ret z

    ld a, $03
    ld [hl], a
    ret

jr_001_592f:
    ldh a, [hFrameCounter]
    rla
    and $10
    ld [hl], a
    ret

;
; Each 2x2 section of the overworld is assigned a dialogue index
; that will be shown when you push A on the map screen.
; e.g. bottom right = $68 = Dialog068 = "Yarna Desert"
;
MapLocationNamesTable::
    ;   0    2    4    6    8    A    C    E
    db $6C, $6C, $6C, $6B, $6C, $6C, $6C, $6C ; 00
    db $76, $76, $79, $79, $79, $79, $79, $79 ; 20
    db $6A, $6A, $72, $7A, $78, $78, $71, $71 ; 40
    db $6A, $6A, $72, $70, $78, $78, $71, $71 ; 60
    db $6A, $6E, $69, $69, $69, $69, $77, $71 ; 80
    db $6E, $6E, $69, $69, $69, $69, $77, $77 ; A0
    db $7B, $7B, $6D, $62, $74, $74, $6F, $68 ; C0
    db $73, $73, $73, $74, $74, $74, $75, $68 ; E0

;
; Lookup table for what dialogue message to show when examining a location on the map screen
; "Owl" icons are only visible if you've seen that particular event, though
;
; For (as of yet) unknown reasons, A7 actually maps to Dialog1A7 rather than 0A7
; POI: Unused entries that don't appear in MapSpecialLocationNamesTable anywhere
; 0F ("Enter the Egg!", maybe manually overridden?)
; 31 (Duplicate of 3E, "Wind Fish's Egg")
; 32 (Dialog05F and Dialog060 both point to "Mountain Bridge", hmm...!)
;
MapSpecialLocationNamesLookupTable::
    ;   0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
    db   0, $D9, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD  ; 00 - Owl reminders
    db   0, $56, $57, $58, $59, $5A, $5B, $5C, $5D,   0,   0,   0,   0,   0,   0,   0  ; 10 - Dungeon icons
    db   0, $7C, $67,   0,   0, $80, $65,   0, $64, $88, $7D,   0,   0,   0,   0,   0  ; 20 - Shop icons
    db   0, $5E, $5F, $7F, $7E, $7D, $82, $84, $85, $86, $87, $81, $66, $A7, $5E, $63  ; 30 - "!?" icons
    db   0, $61, $7C,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 40 - "!?" icons

;
; Table for map squares that have special text instead of the generic name from MapLocationNamesTable.
; Rather than directly indexing the dialogue entry, for some reason these are instead lookup values
; for *another* table (just above this one), MapSpecialLocationNamesLookupTable, which has the dialogue indexes...
;
MapSpecialLocationNamesTable::
    ;   0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
    db   0,   0,   0,   0,   0,   0, $3E,   0, $0E,   0, $39,   0,   0,   0, $17,   0 ; 00
    db $18, $3D,   0,   0,   0,   0, $06, $0C,   0,   0,   0,   0,   0,   0,   0,   0 ; 10
    db   0,   0,   0,   0, $12,   0,   0,   0, $07,   0,   0, $14,   0,   0,   0,   0 ; 20
    db $33, $3D,   0,   0,   0,   0, $05, $2A,   0,   0,   0,   0,   0,   0,   0, $29 ; 30
    db   0, $03,   0,   0,   0, $25,   0,   0,   0,   0,   0, $3D,   0,   0,   0,   0 ; 40
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 50
    db   0,   0,   0,   0, $0D, $22,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 60
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; 70
    db $02, $42, $3B, $36,   0,   0,   0,   0, $3D,   0, $37,   0, $16,   0,   0,   0 ; 80
    db   0,   0,   0, $26,   0,   0,   0,   0,   0,   0,   0, $09, $0B, $09,   0,   0 ; 90
    db   0, $35, $3C,   0, $3D,   0,   0,   0,   0,   0,   0,   0, $0A,   0,   0,   0 ; A0
    db $3A, $34, $3D, $28,   0, $13, $07,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; B0
    db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; C0
    db   0,   0, $04, $11,   0,   0, $38,   0,   0, $15,   0, $3D,   0,   0,   0,   0 ; D0
    db   0,   0,   0, $41,   0,   0,   0,   0, $3D,   0,   0,   0,   0,   0, $08,   0 ; E0
    db   0,   0, $01,   0,   0,   0, $3F,   0,   0,   0,   0,   0,   0,   0,   0,   0 ; F0

func_001_5A59::
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ld   hl, MapSpecialLocationNamesTable
    add  hl, de
    ld   e, [hl]
    ld   hl, MapSpecialLocationNamesLookupTable
    add  hl, de
    ld   a, [hl]
    jp   OpenDialog

Data_001_5A6B::
    db 0, 1, $FF

Data_001_5A6E::
    db 0, $F0, $10

func_001_5A71::
    ld   a, [$DBB4]
    ldh  [hScratch0], a
    ld   a, [$C1B3]
    ld   hl, $C1B2
    or   [hl]
    ld   hl, $C19F
    or   [hl]
    jp   nz, label_001_5B3F
    ldh  a, [hPressedButtonsMask]
    ld   c, a
    ld   hl, $C182
    and  $0F
    jr   nz, jr_001_5A92
    xor  a
    ld   [hl], a
    jr   jr_001_5A9D

jr_001_5A92::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, jr_001_5A9D
    ld   [hl], $15
    jr   jr_001_5AA0

jr_001_5A9D::
    ldh  a, [hJoypadState]
    ld   c, a

jr_001_5AA0::
    ld   a, c
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_5A6B
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
    ld   hl, Data_001_5A6E
    add  hl, de
    ld   a, [$DBB4]
    add  a, [hl]
    ld   hl, hScratch0
    ld   [$DBB4], a
    cp   [hl]
    jr   z, label_001_5B3F
    ld   e, a
    ld   d, $00
    ld   hl, wOverworldRoomStatus
    add  hl, de
    ld   a, [$C5A2]
    and  a
    jr   nz, jr_001_5AF5
    ld   a, [hl]
    and  $FF
    jr   nz, jr_001_5AF5
    ld   a, [wFreeMovementMode]
    and  a
    jr   nz, jr_001_5AF5
    ld   a, JINGLE_BUMP
    ldh  [hJingle], a
    ldh  a, [hScratch0]
    ld   [$DBB4], a
    jr   label_001_5B3F

jr_001_5AF5::
    call func_001_6BAE
    ld   hl, MapSpecialLocationNamesTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, jr_001_5B30
    swap a
    and  $07
    inc  a
    ld   c, a
    cp   $01
    jr   nz, jr_001_5B19
    ld   a, [$C5A2]
    and  a
    jr   nz, jr_001_5B30
    ld   hl, wOverworldRoomStatus
    add  hl, de
    ld   a, [hl]
    and  $20
    jr   z, jr_001_5B30

jr_001_5B19::
    ld   a, [$C1B1]
    and  a
    jr   nz, jr_001_5B24
    ld   a, $10
    ld   [$C1B2], a

jr_001_5B24::
    ld   a, c
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    jr   label_001_5B3F

jr_001_5B30::
    ld   a, [$C1B1]
    and  a
    jr   z, label_001_5B3F
    xor  a
    ld   [$C1B1], a
    ld   a, $10
    ld   [$C1B3], a

label_001_5B3F::
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
    jr   nz, jr_001_5BAC
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

jr_001_5BAC::
    ret

Data_001_5BAD::
    db $F8, $F8, $F2, 4, $F8, 0, $F4, 4, $F8, 8, $F4, $24, $F8, $10, $F2, $24
    db 8, $F8, $F2, $44, 8, 0, $F4, $44, 8, 8, $F4, $64, 8, $10, $F2, $64
    db $FA, $FA, $F2, 4, $FA, 2, $F4, 4, $FA, 6, $F4, $24, $FA, $E, $F2, $24
    db 6, $FA, $F2, $44, 6, 2, $F4, $44, 6, 6, $F4, $64, 6, $E, $F2, $64
    db $FC, $FC, $F2, 4, $FC, 4, $F4, 4, $FC, 4, $F4, $24, $FC, $C, $F2, $24
    db 4, $FC, $F2, $44, 4, 4, $F4, $44, 4, 4, $F4, $64, 4, $C, $F2, $64
    db $FE, $FE, $F2, 4, $FE, 4, $F4, 4, $FE, 4, $F4, $24, $FE, $A, $F2, $24
    db 2, $FE, $F2, $44, 2, 4, $F4, $44, 2, 4, $F4, $64, 2, $A, $F2, $64

Data_001_5C2D::
    db $20, 1, $22

jr_001_5C30::
    db 1, $24, 6, $26, 6, $28, 7, $2A, 7, $2C, 5, $2E, 5, $2C

jr_001_5C3E::
    db 5, $2E, 5

Data_001_5C41::
    db $28, $78, $28, $78

Data_001_5C45::
    db $28, $28, $78, $78

func_001_5C49::
    ld   a, [wEntitiesPhysicsFlagsTable]
    push af
    call func_001_5C55
    pop  af
    ld   [wEntitiesPhysicsFlagsTable], a
    ret

func_001_5C55::
    ld   a, [$C1B3]
    and  a
    jr   z, jr_001_5C62
    dec  a
    ld   [$C1B3], a
    cpl
    jr   jr_001_5C6C

jr_001_5C62::
    ld   a, [$C1B2]
    and  a
    jr   z, jr_001_5C72
    dec  a
    ld   [$C1B2], a

jr_001_5C6C::
    rra
    rra
    and  $03
    jr   jr_001_5C7B

jr_001_5C72::
    ld   a, [$C1B1]
    and  a
    jp   z, label_001_5D13
    ld   a, $00

jr_001_5C7B::
    ld   [$C1B0], a
    ldh  [hActiveEntitySpriteVariant], a
    ld   a, $00
    ld   [wOAMNextAvailableSlot], a
    ld   a, $08
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   a, $00
    ld   [wActiveEntityIndex], a
    ldh  [hActiveEntityFlipAttribute], a
    ld   e, $00
    ld   a, [$C1B4]
    cp   $70
    jr   c, jr_001_5C9C
    ld   e, $02

jr_001_5C9C::
    and  $0F
    cp   $08
    jr   nc, jr_001_5CA3
    inc  e

jr_001_5CA3::
    ld   d, $00
    ld   hl, Data_001_5C41
    add  hl, de
    ld   a, [hl]
    ldh  [hActiveEntityPosX], a
    ld   hl, Data_001_5C45
    add  hl, de
    ld   a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ld   a, [$C1B0]
    rla
    rla
    rla
    rla
    rla

jr_001_5CBB::
    and  $E0

jr_001_5CBD::
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_5BAD
    add  hl, de
    ld   a, $08
    ld   [wOAMNextAvailableSlot], a
    xor  a
    ldh  [hActiveEntityTilesOffset], a
    ld   c, $08
    call RenderActiveEntitySpritesRect
    ld   a, [$C1B0]
    cp   $00
    jr   nz, label_001_5D13
    ld   a, [$C1B1]
    dec  a
    cp   $80
    jr   nc, label_001_5D13
    ldh  [hActiveEntitySpriteVariant], a
    ld   de, wDynamicOAMBuffer
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntityPosX]
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntitySpriteVariant]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, Data_001_5C2D
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntityPosX]
    add  a, $08
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a

label_001_5D13::
    ret

Data_001_5D14::
    db  $98, $CB, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $98, $EB, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $00

Data_001_5D29::
    db  $99, $2B, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $99, $4B, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $00

Data_001_5D3E::
    db  $99, $8B, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $99, $AB, $06, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db  $00

label_001_5D53::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $14
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    push de
    ld   bc, Data_001_5D14
    ldh  a, [$FFDB]
    and  a
    jr   z, jr_001_5D75
    ld   bc, Data_001_5D29
    cp   $01
    jr   z, jr_001_5D75
    ld   bc, Data_001_5D3E

jr_001_5D75::
    ld   e, $15

jr_001_5D77::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, jr_001_5D77
    pop  de
    ld   hl, $D604
    add  hl, de
    ld   c, $00
    ldh  a, [hScratch2]
    and  a
    jr   z, jr_001_5DAB
    ldh  [hScratch0], a

jr_001_5D8B::
    ldh  a, [hScratch0]
    sub  a, $08
    ldh  [hScratch0], a
    jr   c, jr_001_5DA2
    ld   a, $AE
    ldi  [hl], a
    inc  c
    ld   a, c
    cp   $07
    jr   nz, jr_001_5DA0
    ld   a, l
    add  a, $03
    ld   l, a

jr_001_5DA0::
    jr   jr_001_5D8B

jr_001_5DA2::
    add  a, $08
    jr   z, jr_001_5DAB
    ld   a, $AE
    ldi  [hl], a
    jr   jr_001_5DB3

jr_001_5DAB::
    ldh  a, [hScratch3]
    cp   c
    jr   z, jr_001_5DBF
    ld   a, $AE
    ldi  [hl], a

jr_001_5DB3::
    inc  c
    ld   a, c
    cp   $07
    jr   nz, jr_001_5DBD
    ld   a, l
    add  a, $03
    ld   l, a

jr_001_5DBD::
    jr   jr_001_5DAB

jr_001_5DBF::
    ret

func_5DC0::
    xor  a
    ld   de, wSaveFilesCount
    ld   [de], a
    ld   b, $01
    ld   c, $00
    ld   hl, $DB80

jr_001_5DCC::
    ld   a, [hli]
    and  a
    jr   z, jr_001_5DD3
    ld   a, [de]
    or   b
    ld   [de], a

jr_001_5DD3::
    inc  c
    ld   a, c
    cp   $05
    jr   nz, jr_001_5DDB
    ld   b, $02

jr_001_5DDB::
    cp   $0A
    jr   nz, jr_001_5DE1
    ld   b, $04

jr_001_5DE1::
    cp   $0F
    jr   nz, jr_001_5DCC
    ret

func_001_5DE6::
    call Call_001_5eca
    ld   a, [wHealth]                           ; Does the player have any health?
    and  a                                      ; If yes, skip this
    jr   nz, .skipHealthReset
    ld   a, [wMaxHealth]                        ; Otherwise, get their max health...
    ld   e, a
    ld   d, $00
    ld   hl, MaxHealthToStartingHealthTable     ; and use it as an index into the table
    add  hl, de                                 ; to provide the starting health value.
    ld   a, [hl]
    ld   [wHealth], a

.skipHealthReset:
    call SynchronizeDungeonsItemFlags_trampoline
    ld   a, [wSaveSlot]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   bc, wOverworldRoomStatus
    ld   de, $0380

jr_001_5E12::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_5E12
    ld   bc, $DDDA
    ld   de, $05

jr_001_5E26::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_5E26
    ld   bc, $DDE0
    ld   de, $20

jr_001_5E3A::
    call EnableExternalRAMWriting
    ld   a, [bc]
    inc  bc
    call EnableExternalRAMWriting
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, jr_001_5E3A
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

Data_001_5ea2:
    dw wIndoorARoomStatus + $06 ; moldorm
    dw wIndoorARoomStatus + $2b ; genie
    dw wIndoorARoomStatus + $5a
    dw wIndoorARoomStatus + $ff
    dw wIndoorARoomStatus + $85
    dw wIndoorARoomStatus + $bc
    dw wIndoorBRoomStatus + $e8
    dw wIndoorBRoomStatus + $34 ; hothead

Data_001_5eb2:
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

Call_001_5eca:
    ; full heart containers
    ld a, $03                                     ; $5eca: $3e $03
    ldh [hScratch0], a                            ; $5ecc: $e0 $d7
    xor a                                         ; $5ece: $af
    ldh [hScratch1], a                            ; $5ecf: $e0 $d8
    ld c, $08                                     ; $5ed1: $0e $08
    ld hl, Data_001_5ea2                                   ; $5ed3: $21 $a2 $5e

.bossLoop
    ld a, [hl+]                                   ; $5ed6: $2a
    ld e, a                                       ; $5ed7: $5f
    ld a, [hl+]                                   ; $5ed8: $2a
    ld d, a                                       ; $5ed9: $57
    ld a, [de]                                    ; $5eda: $1a
    and $20 ; ROOM_STATUS_BOSS_DEFEATED
    jr z, .endIfBossDefeated                             ; $5edd: $28 $05
    ldh a, [hScratch0]                            ; $5edf: $f0 $d7
    inc a                                         ; $5ee1: $3c
    ldh [hScratch0], a                            ; $5ee2: $e0 $d7
.endIfBossDefeated:

    dec c                                         ; $5ee4: $0d
    jr nz, .bossLoop                                   ; $5ee5: $20 $ef

    ld c, $0c                                     ; $5ee7: $0e $0c
    ld hl, Data_001_5eb2                                  ; $5ee9: $21 $b2 $5e

.heartPieceLoop
    ld a, [hl+]                                   ; $5eec: $2a
    ld e, a                                       ; $5eed: $5f
    ld a, [hl+]                                   ; $5eee: $2a
    ld d, a                                       ; $5eef: $57
    ld a, [de]                                    ; $5ef0: $1a
    and ROOM_STATUS_CHANGED                       ; $5ef1: $e6 $10
    jr z, .endIfHeartPieceTaken                             ; $5ef3: $28 $0f

    ldh a, [hScratch1]                            ; $5ef5: $f0 $d8
    inc a                                         ; $5ef7: $3c
    cp $04                                        ; $5ef8: $fe $04
    jr nz, .endIf4heartPieces                            ; $5efa: $20 $06
    ldh a, [hScratch0]                            ; $5efc: $f0 $d7
    inc a                                         ; $5efe: $3c
    ldh [hScratch0], a                            ; $5eff: $e0 $d7
    xor a                                         ; $5f01: $af
.endIf4heartPieces

    ldh [hScratch1], a                            ; $5f02: $e0 $d8

.endIfHeartPieceTaken
    dec c                                         ; $5f04: $0d
    jr nz, .heartPieceLoop                            ; $5f05: $20 $e5

    ldh a, [hScratch0]                            ; $5f07: $f0 $d7
    call Call_001_5f1c                            ; $5f09: $cd $1c $5f
    ld [wMaxHealth], a                            ; $5f0c: $ea $5b $db
    cp $0e                                        ; $5f0f: $fe $0e
    jr nz, jr_001_5f16                            ; $5f11: $20 $03

    xor a                                         ; $5f13: $af
    jr jr_001_5f18                                ; $5f14: $18 $02

jr_001_5f16:
    ldh a, [hScratch1]                            ; $5f16: $f0 $d8

jr_001_5f18:
    ld [wHeartPiecesCount], a                     ; $5f18: $ea $5c $db
    ret                                           ; $5f1b: $c9


; clamps max health between 3 and 14
Call_001_5f1c:
    cp $03                                        ; $5f1c: $fe $03
    jr nc, jr_001_5f23                            ; $5f1e: $30 $03

    ld a, $03                                     ; $5f20: $3e $03
    ret                                           ; $5f22: $c9


jr_001_5f23:
    cp $0e                                        ; $5f23: $fe $0e
    jr c, jr_001_5f29                             ; $5f25: $38 $02

    ld a, $0e                                     ; $5f27: $3e $0e

jr_001_5f29:
    ret                                           ; $5f29: $c9



; Copy the current dungeon item flags to the global and persistent
; dungeons item flags table.
SynchronizeDungeonsItemFlags::
    push bc

    ; If on overworld, do nothing
    ld   a, [wIsIndoor]
    and  a
    jr   z, .return

    ; If inside the Color dungeon…
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .notColorDungeon

    ; hl = $DDDA
    ld   hl, $DDDA
    jr   .endIf

.notColorDungeon
    ; If the map is not a dungeon, return.
    cp   MAP_CAVE_B
    jr   nc, .return

    ; Select the correct item flags slot for the current dungeon
    ; hl = wDungeonItemFlags + (hMapId * 5)
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, wDungeonItemFlags
    add  hl, de
.endIf

    ; Copy 5 values from wCurrentDungeonItemFlags to wDungeonItemFlags
    ld   de, wCurrentDungeonItemFlags
    ld   c, $05
.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ; loop while c > 0
    dec  c
    jr   nz, .loop

.return
    pop  bc
    ret

EntityPosXOffsetTable::
.right   db $A0
.left    db $60
.top     db $00
.bottom  db $00
.default db $00

EntityPosXSignTable::
.right   db $00
.left    db $FF
.top     db $00
.bottom  db $00
.default db $00

EntityPosYOffsetTable::
.right   db $00
.left    db $00
.top     db $80
.bottom  db $80
.default db $00

EntityPosYSignTable::
.right   db $00
.left    db $00
.top     db $FF
.bottom  db $00
.default db $00

; Configure the position a newly created entity position before a room transition.
;
; Input:
;   de:  entity index
PrepareEntityPositionForRoomTransition::
    ; Set the entity load order
    ld   hl, wEntitiesLoadOrderTable
    add  hl, de
    ldh  a, [hScratchD]
    ld   [hl], a

    ; Increment the load order
    inc  a
    ldh  [hScratchD], a

    push bc
    ; bc = wRoomTransitionDirection
    ld   a, [wRoomTransitionDirection]
    ld   c, a
    ld   b, $00

    ; hScratch0 = EntityPosXOffsetTable[wRoomTransitionDirection]
    ld   hl, EntityPosXOffsetTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch0], a

    ; hScratch1 = EntityPosXSignTable[wRoomTransitionDirection]
    ld   hl, EntityPosXSignTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch1], a

    ; hScratch2 = EntityPosYOffsetTable[wRoomTransitionDirection]
    ld   hl, EntityPosYOffsetTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch2], a

    ; hScratch3 = EntityPosYSignTable[wRoomTransitionDirection]
    ld   hl, EntityPosYSignTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hScratch3], a

    ; [wEntitiesPosXTable + de] += [hScratch0]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ldh  a, [hScratch0]
    add  a, [hl]
    ld   [hl], a

    ; [wEntitiesPosXSignTable + de] += [hScratch1] + carry
    rr   c
    ld   hl, wEntitiesPosXSignTable
    add  hl, de
    ldh  a, [hScratch1]
    rl   c
    adc  a, [hl]
    ld   [hl], a

    ; [wEntitiesPosYTable + de] += [hScratch2]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ldh  a, [hScratch2]
    add  a, [hl]
    ld   [hl], a

    ; [wEntitiesPosYSignTable + de] += [hScratch3] + carry
    rr   c
    ld   hl, wEntitiesPosYSignTable
    add  hl, de
    ldh  a, [hScratch3]
    rl   c
    adc  a, [hl]
    ld   [hl], a

    pop  bc
    ret

; Add the current room to the recent rooms list (if not already present).
UpdateRecentRoomsList::
    ; The recent rooms list has 6 slots
    ld   c, $06
    ldh  a, [hMapRoom]
    ld   hl, wRecentRooms

    ; For each slot…
.findRoomInList
    ; if the slot already contains the current room,
    ; don't add it again and simply return.
    cp   [hl]
    jr   z, .return
    inc  hl
    dec  c
    jr   nz, .findRoomInList

    ;
    ; Append the current room to the recents rooms list
    ;

    ; Increment the index of the next slot
    ld   a, [wRecentRoomsIndex]
    inc  a
    ; (if the index goes past 5, reset it to 0)
    cp   $06
    jr   nz, .wrapIndexEnd
    xor  a
.wrapIndexEnd
    ld   [wRecentRoomsIndex], a

    ; Read the previous value of the slot into DE
    ld   e, a
    ld   d, $00
    ld   hl, wRecentRooms
    add  hl, de
    ld   e, [hl]

    ; Write the current room id to the slot
    ldh  a, [hMapRoom]
    ld   [hl], a

    ; Clear the flag indicating cleared entities for the evicted room.
    ; (This means that enemies will not respawn in a room before 6
    ; other different rooms have been visited.)
    ld   hl, wEntitiesClearedRooms
    add  hl, de
    ld   [hl], $00

.return
    ret

HideAllSprites::
    ; $0000 controls whether to enable external RAM writing
    ld   hl, MBC3SRamEnable

    ; If CGB…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .enableExternalRAMWriting
    ; disable external RAM writing
    ; (probably because an extra RAM bank available on CGB can be used)
    ld   [hl], SRAM_DISABLE
    jr   .endIf

.enableExternalRAMWriting
    ; else enable external RAM writing
    ld   [hl], $FF
.endIf

    ; loop counter
    ld   b, $28
    ; value to write
    ld   a, $F4
    ; address
    ld   hl, wOAMBuffer

    ; Write $F4 to every first byte (Y position) of the OAM buffer
    ; This ensures the sprite is hidden.
.loop
    ldi  [hl], a
    inc  hl
    inc  hl
    inc  hl
    dec  b
    jr   nz, .loop
    ret

UpdateWindowPosition::
    ld   a, [wInventoryAppearing]
    and  a
    jr   z, jr_001_5F6A
    ld   hl, wOAMBuffer
    ld   a, [wWindowY]
    add  a, $08
    ld   d, a
    ld   e, $28

jr_001_5F5C::
    ld   a, [hl]
    cp   d
    jr   c, jr_001_5F62
    ld   [hl], $00

jr_001_5F62::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, jr_001_5F5C
    ret

jr_001_5F6A::
    ld   a, [wWindowY]
    and  a
    ret  z
    ld   a, [$C19F]
    and  a
    ret  z
    ld   d, $3E
    ld   a, [$C19F]
    and  $80
    jr   z, jr_001_5F7F
    ld   d, $58

jr_001_5F7F::
    ld   e, $1F
    ld   hl, $C024

jr_001_5F84::
    ld   a, [hl]
    cp   d
    ld   a, [$C19F]
    bit  7, a
    jr   nz, jr_001_5F8E
    ccf

jr_001_5F8E::
    jr   c, jr_001_5FAB
    ld   a, [$C173]
    cp   $4F
    jr   nz, jr_001_5FA9
    ld   a, [$C112]
    and  a
    jr   nz, jr_001_5FA9
    inc  hl
    inc  hl
    db   $3A ; ldd  a, [hl]
    dec  hl
    cp   $9A
    jr   c, jr_001_5FA9
    cp   $A0
    jr   c, jr_001_5FAB

jr_001_5FA9::
    ld   [hl], $00

jr_001_5FAB::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, jr_001_5F84
    ret

; Create the entity for the NPC currently following Link (if any).
; This can be either:
;  - The Flying Rooster
;  - The friendly Ghost
;  - Marin
;  - Bow-Wow
CreateFollowingNpcEntity::
    ; If indoors…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .excludedRoomsEnd
    ; Exclude side-scrolling rooms
    ldh  a, [hIsSideScrolling]
    and  a
    ret  nz
    ; Exclude some maps
    ldh  a, [hMapId]
    cp   MAP_S_FACE_SHRINE
    ret  z
    cp   MAP_KANALET
    ret  z
    cp   MAP_DREAM_SHRINE
    ret  z
    cp   MAP_CAVE_B
    ret  c
    ; Exclude some rooms
    ; POI: Curiously, these should be excluded by the
    ; check against side-scrolling rooms...
    ldh  a, [hMapRoom]
    cp   $FD ; Mambo the Sun Fish
    ret  z
    cp   $B1 ; Fishing minigame
    ret  z
.excludedRoomsEnd

    ;
    ; Flying Rooster entity
    ;

    ; If the Rooster is following Link…
    ld   a, [wIsRoosterFollowingLink]
    cp   $01
    jr   nz, .roosterEnd

    ; Search existing entities for an already loaded Roster
    ld   e, $0F
    ld   d, $00
.roosterSearchLoop
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    cp   ENTITY_ROOSTER
    jr   nz, .roosterContinue
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .roosterContinue
    ld   [hl], d
.roosterContinue
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, .roosterSearchLoop

    ; Create the new Rooster entity
    ld   a, ENTITY_ROOSTER
    call SpawnNewEntity_trampoline

    ; Configure the entity
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionZ]
    ld   hl, wEntitiesPosZTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
.roosterEnd

    ;
    ; Ghost entity
    ;

    ld   a, [wIsGhostFollowingLink]
    cp   $01
    jr   z, .createGhostEntity
    cp   $02
    jr   nz, .ghostEnd
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .ghostEnd
    ldh  a, [hMapRoom]
    cp   $40
    jr   c, .ghostEnd
    ld   a, [$DB68]
    and  $02
    jr   z, .ghostEnd
    ld   a, [wPowerBraceletLevel]
    cp   $02
    jr   c, .markGhostAsFollowing
    ; Mark Ghost as not following Link anymore
    xor  a
    jr   .ghostStatusEnd
.markGhostAsFollowing
    ; Mark Ghost as following Link
    ld   a, $01
.ghostStatusEnd

    ld   [wIsGhostFollowingLink], a
    jr   .ghostEnd

.createGhostEntity
    ld   e, $0F
    ld   d, $00

    ; Search for an existing Ghost entity
.ghostSearchLoop
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    cp   ENTITY_GHOST
    jr   nz, .ghostContinue
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .ghostContinue
    ld   [hl], d
.ghostContinue
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .ghostSearchLoop

    ; Create the Ghost entity
    ld   a, ENTITY_GHOST
    call SpawnNewEntity_trampoline

    ; Configure the entity
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]

    ; Play the eerie ghost sound effect
    ld   a, JINGLE_GHOST_PRESENCE
    ldh  [hJingle], a
.ghostEnd

    ;
    ; Marin entity
    ;

    ; If Marin is following Link…
    ld   a, [wIsMarinFollowingLink]
    and  a
    jp   z, .marinEnd

    ; Search for an existing Marin entity
    ld   e, $0F
    ld   d, $00
.marinSearchLoop
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    cp   ENTITY_MARIN_AT_THE_SHORE
    jr   nz, .marinContinue
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .marinContinue
    ld   [hl], d
.marinContinue
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .marinSearchLoop

    ; Create a new Marin entity
    ld   a, ENTITY_MARIN_AT_THE_SHORE
    call SpawnNewEntity_trampoline

    ; Configure the entity
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, $D155
    call .decrementConsecutiveBytes
    ldh  a, [hLinkPositionY]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    ld   hl, $D175
    call .decrementConsecutiveBytes
    ldh  a, [hLinkPositionZ]
    ld   hl, wEntitiesPosZTable
    add  hl, de
    ld   [hl], a
    ld   hl, $D195
    call .decrementConsecutiveBytes
    ld   hl, wEntitiesUnknowTableP
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0C

    ; If on room $A4 (bottom of the well),
    ; make Marin being dropped from above.
    ldh  a, [hMapRoom]
    cp   $A4
    jr   nz, .marinFallEnd
    ldh  a, [hMapId]
    cp   MAP_CAVE_C
    jr   nz, .marinFallEnd
    ld   a, JINGLE_JUMP_DOWN
    ldh  [hJingle], a
    ld   [$C167], a
    ld   hl, $C300
    add  hl, de
    ld   [hl], $79
.marinFallEnd

    ldh  a, [hLinkDirection]
    ld   hl, $D1B5
    call .decrementConsecutiveBytes
    ld   a, [$DB10]
    and  a
    jr   z, .jp_6117
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    add  a, $20
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    add  a, $10
    ld   [hl], a
.jp_6117
    ret

.decrementConsecutiveBytes
    ld   c, $10
.loop
    ldi  [hl], a
    dec  c
    jr   nz, .loop
    ret

.marinEnd

    ;
    ; Bow-Wow entity
    ;

    ; If inside Mrs. Meow-Meow house, never load Bow-Wow
    ldh  a, [hMapRoom]
    cp   $A7
    ret  z

    ; If Bow-Wow is following Link…
    ld   a, [wIsBowWowFollowingLink]
    cp   $01
    jr   nz, .bowWowEnd

    ; Search for an existing Bow-Wow entity
    ld   e, $0F
    ld   d, $00
.bowWowSearchLoop
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [hl]
    cp   ENTITY_BOW_WOW
    jr   nz, .bowWowContinue
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .bowWowContinue
    ld   [hl], d
.bowWowContinue
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .bowWowSearchLoop

    ; Create a new Bow-Wow entity
    ld   a, ENTITY_BOW_WOW
    call SpawnNewEntity_trampoline

    ; Configure the entity
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionZ]
    ld   hl, wEntitiesPosZTable
    add  hl, de
    ld   [hl], a

.bowWowEnd
    ret

; Reset?
func_001_6162::
    call label_27F2
    xor  a
    ld   [wGameplayType], a
    ld   [wGameplaySubtype], a
    ld   [wOBJ0Palette], a
    ld   [wOBJ1Palette], a
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

Data_001_618A::
    db 0, $57, $10, $57, $20, $57, $30, $57, $40, $57, $50, $57, $60, $57, $70, $57
    db $80, $57, $90, $57, 0, $58, $10, $58, $20, $58, $30, $58, $40, $58, $50, $58

LoadCounterAnimatedTiles::
    ld   a, [$C109]
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96D0  ; destination
    ld   bc, $10    ; count
    ld   a, $0F     ; bank
    call CopyDataFromBank
    ld   a, [$C109]
    swap a
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96C0 ; destination
    ld   bc, $10   ; count
    ld   a, $0F    ; bank
    call CopyDataFromBank
    ld   a, $6C
    ld   [$9909], a

jr_001_61E9::
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
    ld a, [wGameplaySubtype]
    JP_TABLE
._00 dw PeachPictureState0Handler
._01 dw PeachPictureState1Handler
._02 dw PeachPictureState2Handler
._03 dw PeachPictureState3Handler
._04 dw PeachPictureState4Handler
._05 dw PeachPictureState5Handler
._06 dw FileSaveFadeOut
._07 dw PeachPictureState7Handler
._08 dw PeachPictureState8Handler
._09 dw PeachPictureState9Handler
._0A dw PeachPictureStateAHandler

PeachPictureState0Handler::
    call IncrementGameplaySubtype

    ldh  a, [hIsGBC]
    and  a
    jr   z, PeachPictureState1Handler
    ld   hl, $DC10
    ld   c, $80
    di

jr_001_6816::
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
    jr   nz, jr_001_6816
    xor  a
    ld   [rSVBK], a
    ei

PeachPictureState1Handler::
    ld   a, $01
    ld   [$C167], a
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_6855
    call func_001_5888
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   z, jr_001_6849
    ld   a, $03
    ldh  [hWindowYUnused], a
    ld   a, $30
    ldh  [hWindowXUnused], a

jr_001_6849::
    call IncrementGameplaySubtype
    xor  a
    ld   [$C1BF], a
    ld   a, $0F
    ld   [wTileMapToLoad], a

jr_001_6855::
    ret
PeachPictureState2Handler::     ; This is for full-screen images ...
    ld   e, $21                 ; First, check if it's Eagle's Tower
    ldh  a, [hMapId]            ; If so, load the tower graphics for when the pillars are knocked out
    cp   MAP_EAGLES_TOWER       ; Otherwise, check if it's room $DD (Schule's house)
    jr   z, jr_001_6868         ; If it is, load the ... whatever it is painting
    ldh  a, [hMapRoom]          ; Otherwise, load the Christine picture
    cp   $DD
    ld   e, $12
    jr   nz, jr_001_6868
    ld   e, $20

jr_001_6868::
    ld   a, e
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$C13F], a
    jp   IncrementGameplaySubtypeAndReturn
PeachPictureState3Handler::     ; Determines the tilemap to load (?)
    ld   e, $24
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   z, jr_001_6885
    ldh  a, [hMapRoom]
    cp   $DD
    ld   e, $12
    jr   nz, jr_001_6885
    ld   e, $23

jr_001_6885::
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

jr_001_689E::
    ldi  [hl], a
    dec  e
    jr   nz, jr_001_689E
    ld   a, $01
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn

PeachPictureState4Handler::
    call func_6A7C
    call func_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_68BF
    call IncrementGameplaySubtype
    ld   a, $80
    ld   [$D210], a

jr_001_68BF::
    ret

PeachPictureState5Handler::
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   nz, jr_001_68CF

    call func_6A7C
    ld   a, $07
    ld   [wGameplaySubtype], a
    ret

jr_001_68CF::
    ldh  a, [hJoypadState]
    and  $B0
    jr   z, jr_001_68E3
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a

func_001_68D9::
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a

jr_001_68E3::
    ret
PeachPictureState7Handler::
    call func_6A7C
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, jr_001_68FB
    ld   [wScreenShakeVertical], a
    ld   a, $20
    ld   [$D210], a
    jp   IncrementGameplaySubtypeAndReturn

jr_001_68FB::
    ld   e, $00
    and  $04
    jr   z, jr_001_6903
    ld   e, $FE

jr_001_6903::
    ld   a, e
    ld   [wScreenShakeVertical], a
    ret
PeachPictureState8Handler::
    call func_6A7C
    call func_001_695B
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, jr_001_6944
    call PlayBombExplosionSfx
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
    jr   nz, jr_001_6944
    ld   a, $80
    ld   [$D210], a
    call IncrementGameplaySubtype

jr_001_6944::
    ret
PeachPictureState9Handler::
    call func_6A7C
    call func_001_695B
    ld   hl, $D210
    dec  [hl]
    ret  nz
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ret

func_001_695B::
    xor  a
    ld   [wScreenShakeVertical], a
    ld   a, [$D215]
    and  a
    jr   z, jr_001_6975
    dec  a
    ld   [$D215], a
    ld   e, $FE
    and  $04
    jr   z, jr_001_6971
    ld   e, $00

jr_001_6971::
    ld   a, e
    ld   [wScreenShakeVertical], a

jr_001_6975::
    ret

Data_001_6976::
    db $14, $14, $10, $10, $0c, $0c

Data_001_697C::
    db $17, $17, $13
    db $13, $0f, $0f

Data_6982::
    db   $00, $00, $CC, $10
    db   $00, $08, $CE, $10
    db   $00, $10, $DC, $10
    db   $00, $18, $CC, $30
    db   $10, $00, $DE, $10
    db   $10, $08, $E0, $10
    db   $10, $10, $E2, $10
    db   $10, $18, $DE, $30
    db   $20, $00, $E4, $10
    db   $20, $08, $E6, $10
    db   $20, $10, $E8, $10
    db   $20, $18, $E4, $30
    db   $30, $00, $DE, $10
    db   $30, $08, $E0, $10
    db   $30, $10, $E0, $30
    db   $30, $18, $DE, $30
    db   $40, $00, $DE, $10
    db   $40, $08, $E0, $10
    db   $40, $10, $E0, $30
    db   $40, $18, $DE, $30

Data_69D2::
    db   $00, $10, $DC, $16
    db   $10, $10, $E2, $16
    db   $20, $10, $E8, $16
    db   $00, $00, $CC, $15
    db   $00, $08, $CE, $15
    db   $00, $10, $CE, $35
    db   $00, $18, $CC, $35
    db   $10, $00, $DE, $15
    db   $10, $08, $E0, $15
    db   $10, $10, $E0, $35
    db   $10, $18, $DE, $35
    db   $20, $00, $E4, $15
    db   $20, $08, $E6, $15
    db   $20, $10, $E6, $35
    db   $20, $18, $E4, $35
    db   $30, $00, $DE, $15
    db   $30, $08, $E0, $15
    db   $30, $10, $E0, $35
    db   $30, $18, $DE, $35
    db   $40, $00, $DE, $15
    db   $40, $08, $E0, $15
    db   $40, $10, $E0, $35
    db   $40, $18, $DE, $35

Data_6A2E::
    db   $48, $08, $F0, $07
    db   $48, $10, $F2, $07
    db   $48, $18, $F4, $07
    db   $48, $20, $F4, $27
    db   $48, $28, $F2, $27
    db   $48, $30, $F0, $27

Data_6A46::
    db   $48, $08, $F6, $07
    db   $48, $10, $F8, $07
    db   $48, $18, $FA, $07
    db   $48, $20, $FA, $27
    db   $48, $28, $F8, $27
    db   $48, $30, $F6, $27

Data_6A5E::
    db   $48, $08, $FC, $07
    db   $48, $10, $FE, $07
    db   $48, $18, $EE, $07
    db   $48, $20, $EE, $27
    db   $48, $28, $FE, $27
    db   $48, $30, $FC, $27

Data_6A76::
    dw Data_6A2E
    dw Data_6A46
    dw Data_6A5E

func_6A7C::
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    ret  nz

    xor  a
    ldh  [hActiveEntitySpriteVariant], a
    ldh  [hActiveEntityFlipAttribute], a
    ldh  [hActiveEntityTilesOffset], a
    ld   a, $38
    ldh  [hActiveEntityPosX], a
    ld   a, [wScreenShakeVertical]
    ld   e, a
    ld   a, $20
    sub  a, e
    ldh  [hActiveEntityVisualPosY], a
    ld   a, [$D214]
    and  a
    jr   z, .jr_6AC2
    dec  a
    ld   [$D214], a

    ldh  a, [hFrameCounter]
    and  $07
    ld   a, [$D212]
    jr   nz, .jr_6AAE
    inc  a
    cp   $03
    jr   nz, .jr_6AAE
    xor  a
.jr_6AAE

    ld   [$D212], a
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, Data_6A76
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   c, $06
    call RenderActiveEntitySpritesRectUsingAllOAM

.jr_6AC2
    ld   a, $48
    ldh  [hActiveEntityPosX], a
    ld   a, [wScreenShakeVertical]
    ld   e, a
    ld   a, [$D211]
    add  a, $20
    sub  a, e
    ldh  [hActiveEntityVisualPosY], a
    ld   a, [$D213]
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_6976
    ldh  a, [hIsGBC]
    and  a
    jr   z, .jr_6AE3
    ld   hl, Data_001_697C

.jr_6AE3
    add  hl, de
    ld   c, [hl]
    xor  a
    ld   [wOAMNextAvailableSlot], a
    ld   hl, Data_6982
    ldh  a, [hIsGBC]
    and  a
    jr   z, .jr_6AF4
    ld   hl, Data_69D2

.jr_6AF4
    call RenderActiveEntitySpritesRect
    ret

include "code/face_shrine_mural.asm"

func_001_6BA8::
    ldh  a, [hJoypadState]
    and  $0C
    jr   z, jr_001_6BB4

func_001_6BAE::
    push af
    ld   a, JINGLE_MOVE_SELECTION
    ldh  [hJingle], a
    pop  af

jr_001_6BB4::
    ret

func_001_6BB5::
    ldh  a, [hBGTilesLoadingStage]
    cp   $08
    jp  c, LoadSirenInstrumentTiles
    jr   nz, jr_001_6BC6
    call func_001_6BF0
    ld   hl, hBGTilesLoadingStage
    inc  [hl]
    ret

jr_001_6BC6::
    call func_001_6BEA
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [hBGTilesLoadingStage], a
    ret

Data_001_6BCF::
    db $F, $51, $B1, $EF, $EC, $AA, $4A, $C

Data_001_6BD7::
    db $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8

Data_001_6BDF::
    db $D0, $D2, $D4, $D6, $D8, $DA, $DC, $DE

Data_001_6BE7::
    db 1, $1F, 1

func_001_6BEA::
    db $E, 8, $1E, 4, $18, 4

func_001_6BF0::
    db $E, 4, $1E, 0

jr_001_6BF4::
    ld   a, c
    ldh  [hScratch9], a
    ld   d, $00

label_001_6BF9::
    xor  a
    ldh  [hScratch0], a
    ldh  [hScratch1], a
    ldh  [hScratch2], a
    ldh  [hScratch3], a
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    bit  1, a
    jp   nz, label_001_6C2A
    ld   c, $00
    ld   b, c
    ld   hl, Data_001_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   a, $7C
    ldh  [hScratch0], a
    ldh  [hScratch1], a
    ldh  [hScratch2], a
    ld   hl, Data_001_6BD7
    add  hl, de
    ld   a, [hl]
    ldh  [hScratch3], a
    pop  hl
    jr   jr_001_6C48

label_001_6C2A::
    ld   c, $00
    ld   b, c
    ld   hl, Data_001_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   hl, Data_001_6BDF
    add  hl, de
    ld   a, [hl]
    ldh  [hScratch0], a
    inc  a
    ldh  [hScratch1], a
    add  a, $0F
    ldh  [hScratch2], a
    inc  a
    ldh  [hScratch3], a
    pop  hl

jr_001_6C48::
    ldh  a, [hScratch0]
    ld   [hl], a
    call func_001_6C69
    ldh  a, [hScratch1]
    ld   [hl], a
    inc  c
    call func_001_6C69
    ldh  a, [hScratch2]
    ld   [hl], a
    inc  c
    call func_001_6C69
    ldh  a, [hScratch3]
    ld   [hl], a
    inc  e
    ld   a, e
    ld   hl, hScratch9
    cp   [hl]
    jp   nz, label_001_6BF9
    ret

func_001_6C69::
    push hl
    ld   hl, Data_001_6BE7
    add  hl, bc
    ld   a, [hl]
    pop  hl
    add  a, l
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ret

; Copy tiles for a siren instrument to VRAM,
; then increment hBGTilesLoadingStage.
;
; Inputs:
;   a    index of the instrument to load
LoadSirenInstrumentTiles::
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
    ld   hl, SirenInstrumentsTiles
    add  hl, bc
    call CopySirenInstrumentTiles
    ldh  a, [hBGTilesLoadingStage]
    inc  a
    ldh  [hBGTilesLoadingStage], a
    ret

; Coordinates of the borders surrounding the room objects
RoomBorderCoordinates::
    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B
    db $10,                                                   $1B
    db $20,                                                   $2B
    db $30,                                                   $3B
    db $40,                                                   $4B
    db $50,                                                   $5B
    db $60,                                                   $6B
    db $70,                                                   $7B
    db $80,                                                   $8B
    db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B
    db $FF

; Surround the objects area defining a room by ROOM_BORDER values
PadRoomObjectsArea::
    ld   bc, RoomBorderCoordinates
.loop
    ; a = next border coordinate
    ld   a, [bc]

    ; if the border reached $FF, exit loop
    cp   $FF
    jr   z, .end

    ; hl = wRoomObjectsArea + next border coordinate
    ld   e, a
    ld   d, $00
    ld   hl, wRoomObjectsArea
    add  hl, de

    ; write the border
    ld   [hl], ROOM_BORDER

    ; increment and roosterContinue
    inc  bc
    jr   .loop
.end
    ret

LoadTileset0F::
    ld   bc, $400
    ld   hl, $9800

jr_001_6CE9::
    ld   e, $00
    ld   a, l
    and  $20
    jr   z, jr_001_6CF1
    inc  e

jr_001_6CF1::
    ld   d, $AE
    ld   a, l
    and  $01
    xor  e
    jr   z, jr_001_6CFA
    inc  d

jr_001_6CFA::
    ld   a, l
    and  $1F
    cp   $14
    jr   nc, jr_001_6D02
    ld   [hl], d

jr_001_6D02::
    inc  hl
    dec  bc
    ld   a, b
    or   c
    jr   nz, jr_001_6CE9
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_001_6D10
    call func_001_6D11

jr_001_6D10::
    ret

func_001_6D11::
    ld   d, $05
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    jr   z, jr_001_6D1C
    ld   d, $06

jr_001_6D1C::
    ld   a, $01
    ld   [rVBK], a
    ld   hl, $9800
    ld   bc, $400

jr_001_6D26::
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, jr_001_6D26
    ld   a, $00
    ld   [rVBK], a
    ret

include "code/oam_dma.asm"

IntroRainTiles::
incbin "src/gfx/intro/rain.2bpp"

; Background tile where the Dungeon entrance arrow should be displayed
MinimapEntrancePosition::
    dw vBGMap1 + $20B + MINIMAP_ARROW_TAIL_CAVE
    dw vBGMap1 + $20B + MINIMAP_ARROW_BOTTLE_GROTTO
    dw vBGMap1 + $20B + MINIMAP_ARROW_KEY_CAVERN
    dw vBGMap1 + $20B + MINIMAP_ARROW_ANGLERS_TUNNEL
    dw vBGMap1 + $20B + MINIMAP_ARROW_CATFISHS_MAW
    dw vBGMap1 + $20B + MINIMAP_ARROW_FACE_SHRINE
    dw vBGMap1 + $20B + MINIMAP_ARROW_EAGLES_TOWER
    dw vBGMap1 + $20B + MINIMAP_ARROW_TURTLE_ROCK
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw $0    ; (unused)
    dw vBGMap1 + $20B + MINIMAP_ARROW_COLOR_DUNGEON

; Called after tiles are copied to the BG when loading a map all at once
UpdateMinimapEntranceArrowAndReturn::
    ; If DebugTool2 is enabled, return immediately
    ld   a, [ROM_DebugTool2]
    and  a
    ret  nz

    ; If IsIndoor…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .return
    ; then a = (MapId == MAP_COLOR_DUNGEON ? $0F : MapId)
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .notColorDungeon
    ld   a, $0F
    jr   .endIf

.notColorDungeon
    ; If MapId >= 8 (not a dungeon), return
    cp   $08
    jr   nc, .return
.endIf

    ; hl = MinimapEntrancePosition[MapId]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, MinimapEntrancePosition
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a

    ; Display the Minimap Arrow tile ($A3) at the target address
    ld   [hl], $A3

    ; If IsSideScrolling…
    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, .return
    ; … hide the arrow.
    ld   [hl], $7F

.return
    ret

include "code/intro.asm"
