; Screens for save files:
;  - selection
;  - creation
;  - copy
;  - deletion


; -----------------------------------------------------------------------------
;
; GAMEPLAY_FILE_SELECT
; Screen for selecting a save file
;
; -----------------------------------------------------------------------------

DEF NameEntryCharacterTableSize EQUS "(NameEntryCharacterTable.end - NameEntryCharacterTable)"

FileSelectionEntryPoint::
    call func_5DC0                                ; $47CE: $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ; $47D1: $FA $96 $DB
    JP_TABLE                                      ; $47D4: $C7
._00 dw FileSelectionPrepare0                     ; $47D5
._01 dw FileSelectionPrepare1                     ; $47D7
._02 dw FileSelectionPrepare2                     ; $47D9
._03 dw FileSelectionPrepare3                     ; $47DB
._04 dw CopyDeathCountsToBG                       ; $47DD
._05 dw FileSelectionPrepare5                     ; $47DF
._06 dw FileSelectionPrepare6                     ; $47E1
._07 dw FileSelectionInteractiveHandler           ; $47E3
._08 dw FileSelectionExecuteChoice                ; $47E5
._09 dw FileSelectionLoadSavedFile                ; $47E7

FileSelectionPrepare0::
    ld   a, TILESET_MENU                          ; $47E9: $3E $04
    ld   [wTilesetToLoad], a                      ; $47EB: $EA $FE $D6

    xor  a                                        ; $47EE: $AF
    ld   [wIsFileSelectionArrowShifted], a        ; $47EF: $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $47F2: $C3 $D6 $44

FileSelectionPrepare1::
    ld   a, TILESET_FILL_TILEMAP                  ; $47F5: $3E $08
    ld   [wTilesetToLoad], a                      ; $47F7: $EA $FE $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $47FA: $C3 $D6 $44

FileSelectionPrepare2::
    call DrawSaveSlot1MaxHearts                   ; $47FD: $CD $A6 $4D
    call DrawSaveSlot2MaxHearts                   ; $4800: $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4803: $C3 $D6 $44

FileSelectionPrepare3::
    call DrawSaveSlot3MaxHearts                   ; $4806: $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4809: $C3 $D6 $44

CopyDeathCountsToBG::
    ld   a, [wSaveFilesCount]                     ; $480C: $FA $A7 $DB
    and  $01                                      ; $480F: $E6 $01
    jr   z, .file2                                ; $4811: $28 $0E

    ld   a, [wFile1DeathCountHigh]                ; $4813: $FA $00 $DC
    ld   h, a                                     ; $4816: $67
    ld   a, [wFile1DeathCountLow]                 ; $4817: $FA $01 $DC
    ld   l, a                                     ; $481A: $6F
    ld   de, vBGMap0 + $0E7                       ; $481B: $11 $E7 $98
    call CopyDigitsToFileScreenBG                 ; $481E: $CD $45 $4F

.file2
    ld   a, [wSaveFilesCount]                     ; $4821: $FA $A7 $DB
    and  $02                                      ; $4824: $E6 $02
    jr   z, .file3                                ; $4826: $28 $0E

    ld   a, [wFile2DeathCountHigh]                ; $4828: $FA $02 $DC
    ld   h, a                                     ; $482B: $67
    ld   a, [wFile2DeathCountLow]                 ; $482C: $FA $03 $DC
    ld   l, a                                     ; $482F: $6F
    ld   de, vBGMap0 + $147                       ; $4830: $11 $47 $99
    call CopyDigitsToFileScreenBG                 ; $4833: $CD $45 $4F

.file3
    ld   a, [wSaveFilesCount]                     ; $4836: $FA $A7 $DB
    and  $04                                      ; $4839: $E6 $04
    jr   z, .return                               ; $483B: $28 $0E

    ld   a, [wFile3DeathCountHigh]                ; $483D: $FA $04 $DC
    ld   h, a                                     ; $4840: $67
    ld   a, [wFile3DeathCountLow]                 ; $4841: $FA $05 $DC
    ld   l, a                                     ; $4844: $6F
    ld   de, vBGMap0 + $1A7                       ; $4845: $11 $A7 $99
    call CopyDigitsToFileScreenBG                 ; $4848: $CD $45 $4F

.return
    jp   IncrementGameplaySubtypeAndReturn        ; $484B: $C3 $D6 $44
    ; Unused
    ret                                           ; $484E: $C9

FileSelectionPrepare5::
    jp   FileDeletionState4Handler                ; $484F: $C3 $6D $4D

DrawSaveSlotName::
    push de                                       ; $4852: $D5
    ld   a, [wDrawCommandsSize]                   ; $4853: $FA $00 $D6
    ld   e, a                                     ; $4856: $5F
    ld   d, $00                                   ; $4857: $16 $00
    ld   hl, wDrawCommand                         ; $4859: $21 $01 $D6
    add  hl, de                                   ; $485C: $19
    add  a, $10                                   ; $485D: $C6 $10
    ld   [wDrawCommandsSize], a                   ; $485F: $EA $00 $D6
    ld   a, b                                     ; $4862: $78
    ldi  [hl], a                                  ; $4863: $22
    ld   a, c                                     ; $4864: $79
    ldi  [hl], a                                  ; $4865: $22
    ld   a, $04                                   ; $4866: $3E $04
    ldi  [hl], a                                  ; $4868: $22
    pop  de                                       ; $4869: $D1
    push de                                       ; $486A: $D5
    ld   a, $05                                   ; $486B: $3E $05

.drawCharacterRowLoop
    ldh  [hMultiPurpose0], a                      ; $486D: $E0 $D7
    ld   a, [de]                                  ; $486F: $1A
    and  a                                        ; $4870: $A7
    ld   a, DIALOG_BG_TILE_DARK                   ; $4871: $3E $7E
    jr   z, .drawCharacterTile                    ; $4873: $28 $0C
    ld   a, [de]                                  ; $4875: $1A
    dec  a                                        ; $4876: $3D
    push bc                                       ; $4877: $C5
    push hl                                       ; $4878: $E5
    ld   c, a                                     ; $4879: $4F
    ld   b, $00                                   ; $487A: $06 $00
    call ReadTileValueFromAsciiTable              ; $487C: $CD $25 $0C
    pop  hl                                       ; $487F: $E1
    pop  bc                                       ; $4880: $C1

.drawCharacterTile
    ldi  [hl], a                                  ; $4881: $22
    inc  de                                       ; $4882: $13
    ldh  a, [hMultiPurpose0]                      ; $4883: $F0 $D7
    dec  a                                        ; $4885: $3D
    jr   nz, .drawCharacterRowLoop                ; $4886: $20 $E5
    ld   a, b                                     ; $4888: $78
    ldi  [hl], a                                  ; $4889: $22
    ld   a, c                                     ; $488A: $79
    sub  a, $20                                   ; $488B: $D6 $20
    ldi  [hl], a                                  ; $488D: $22
    ld   a, $04                                   ; $488E: $3E $04
    ldi  [hl], a                                  ; $4890: $22
    pop  de                                       ; $4891: $D1
    ld   a, $05                                   ; $4892: $3E $05

.drawSpacingRowLoop
    ; Draw the empty row above the save slot name;
    ; might contain diacritics
    ldh  [hMultiPurpose0], a                      ; $4894: $E0 $D7
    ld   a, [de]                                  ; $4896: $1A
    and  a                                        ; $4897: $A7

IF LANG_EN
    jr   .selectSpacingTile                       ; $4898: $18 $03
    ; Unreachable code:
    dec  a                                        ; $489A: $3D
    and  $C0                                      ; $489B: $E6 $C0
ELSE
    jr   z, .selectSpacingTile
    dec  a
    push hl
    push bc
    ld   c, a
    ld   b, $00
    call ReadTileValueFromDiacriticsTable
IF __DIACRITICS_SUPPORT__
    ldh  [hDialogBackgroundTile], a
ENDC
    pop  bc
    pop  hl
    cp   $00
ENDC

.selectSpacingTile::
    ; Select what tile to draw above the current character
IF __DIACRITICS_SUPPORT__
    ld   a, DIALOG_BG_TILE_DARK
    jr   z, .drawSpacingTile   ; Jump if no diacritic
    ldh  a, [hDialogBackgroundTile] ; Load value from CodepointToDiacritics table
    cp   2                     ; Check if diacritic had value 2
    ld   a, DIALOG_DIACRITIC_2 ; First diacritic tile
    jr   z, .drawSpacingTile   ; Jump if diacritic 2
    inc  a                     ; DIALOG_DIACRITIC_1
ELIF LANG_FR
    ld   a, DIALOG_BG_TILE_DARK
    jr   z, .drawSpacingTile   ; Jump if no diacritic
    ld   a, DIALOG_DIACRITIC_1 ; Second diacritic tile
ELSE
    ld   a, DIALOG_BG_TILE_DARK                   ; $489D: $3E $7E
    jr   .drawSpacingTile                         ; $489F: $18 $08
    ; Unreachable code, likely early diacritics
    ; support that has been stubbed out:
    ld   a, [de]                                  ; $48A1: $1A
    and  $80                                      ; $48A2: $E6 $80
    ld   a, DIALOG_DIACRITIC_2                    ; $48A4: $3E $C8
    jr   z, .drawSpacingTile                      ; $48A6: $28 $01
    inc  a                                        ; $48A8: $3C
ENDC

.drawSpacingTile::
    ldi  [hl], a                                  ; $48A9: $22
    inc  de                                       ; $48AA: $13
    ldh  a, [hMultiPurpose0]                      ; $48AB: $F0 $D7
    dec  a                                        ; $48AD: $3D
    jr   nz, .drawSpacingRowLoop                  ; $48AE: $20 $E4
    xor  a                                        ; $48B0: $AF
    ld   [hl], a                                  ; $48B1: $77
    ret                                           ; $48B2: $C9

FileSelectionPrepare6::
    ; If the music track should set overriden…
    ld   a, [wForceFileSelectionScreenMusic]      ; $48B3: $FA $7B $D4
    and  a                                        ; $48B6: $A7
    jr   z, .dontForceMusicTrack                  ; $48B7: $28 $09
    ; … clear the flag…
    xor  a                                        ; $48B9: $AF
    ld   [wForceFileSelectionScreenMusic], a      ; $48BA: $EA $7B $D4
    ; … and set the music to the file menu selection track
    ld   a, MUSIC_FILE_SELECT                     ; $48BD: $3E $11
    ld   [wMusicTrackToPlay], a                   ; $48BF: $EA $68 $D3
.dontForceMusicTrack

    ; If there are no saved files yet…
    ld   a, [wSaveFilesCount]                     ; $48C2: $FA $A7 $DB
IF LANG_DE
    ldh [hLinkInteractiveMotionBlocked], a
ENDC
    and  a                                        ; $48C5: $A7
    ; … draw the file selection without the copy/erase commands,
    ld   a, TILEMAP_MENU_FILE_SELECTION           ; $48C6: $3E $03
    jr   z, .BGMapEnd                             ; $48C8: $28 $02
    ; … else draw the file selection with the commands.
    ld   a, TILEMAP_MENU_FILE_SELECTION_COMMANDS  ; $48CA: $3E $04
.BGMapEnd

    ; Load background and palette
    ld   [wBGMapToLoad], a                        ; $48CC: $EA $FF $D6
    ld   a, $E4                                   ; $48CF: $3E $E4
    ld   [wBGPalette], a                          ; $48D1: $EA $97 $DB
    ld   a, $1C                                   ; $48D4: $3E $1C
    ld   [wOBJ0Palette], a                        ; $48D6: $EA $98 $DB
    ld   a, $E4                                   ; $48D9: $3E $E4
    ld   [wOBJ1Palette], a                        ; $48DB: $EA $99 $DB
    call LoadFileMenuBG_trampoline                ; $48DE: $CD $05 $09
    jp   IncrementGameplaySubtypeAndReturn        ; $48E1: $C3 $D6 $44

Data_001_48E4::
    dec  sp                                       ; $48E4: $3B
    ld   d, e                                     ; $48E5: $53
    ld   l, e                                     ; $48E6: $6B
    add  a, e                                     ; $48E7: $83

IF LANG_DE
Data_001_48EB:
    ; bg copy requests
    db   $99, $C6, $00, $AA
    db   $99, $C7, $00, $AF
    db   $00
.end
ENDC



FileSelectionInteractiveHandler::
IF LANG_DE
    ldh a, [hLinkInteractiveMotionBlocked]
    and a
    jr z, .start

    xor a
    ldh [hLinkInteractiveMotionBlocked], a
    ld hl, wDrawCommand
    ld de, Data_001_48EB
    ld c, Data_001_48EB.end - Data_001_48EB

.copyLoop
    ld a, [de]
    inc de
    ld [hl+], a
    dec c
    jr nz, .copyLoop
ENDC

.start
    call MoveSelect                               ; $48E8: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $48EB: $F0 $CC
    and  J_A | J_START                            ; $48ED: $E6 $90
    jr   z, .jr_48F4                              ; $48EF: $28 $03
    jp   IncrementGameplaySubtypeAndReturn        ; $48F1: $C3 $D6 $44

.jr_48F4::
    ldh  a, [hJoypadState]                        ; $48F4: $F0 $CC
    and  J_UP | J_DOWN                            ; $48F6: $E6 $0C
    jr   z, jr_001_4920                           ; $48F8: $28 $26
    ld   c, $02                                   ; $48FA: $0E $02
    ld   a, [wSaveFilesCount]                     ; $48FC: $FA $A7 $DB
    and  a                                        ; $48FF: $A7
    jr   z, .jr_4903                              ; $4900: $28 $01
    inc  c                                        ; $4902: $0C

.jr_4903::
    ldh  a, [hJoypadState]                        ; $4903: $F0 $CC
    bit  J_BIT_UP, a                              ; $4905: $CB $57
    jr   nz, .jr_4915                             ; $4907: $20 $0C
    ld   a, [wSaveSlot]                           ; $4909: $FA $A6 $DB
    add  a, $01                                   ; $490C: $C6 $01
    inc  c                                        ; $490E: $0C
    cp   c                                        ; $490F: $B9
    jr   c, jr_001_491D                           ; $4910: $38 $0B
    xor  a                                        ; $4912: $AF
    jr   jr_001_491D                              ; $4913: $18 $08

.jr_4915::
    ld   a, [wSaveSlot]                           ; $4915: $FA $A6 $DB
    sub  a, $01                                   ; $4918: $D6 $01
    jr   nc, jr_001_491D                          ; $491A: $30 $01
    ld   a, c                                     ; $491C: $79

jr_001_491D::
    ld   [wSaveSlot], a                           ; $491D: $EA $A6 $DB

jr_001_4920::
    ld   a, [wSaveSlot]                           ; $4920: $FA $A6 $DB
    cp   $03                                      ; $4923: $FE $03
    jr   nz, func_001_4954                        ; $4925: $20 $2D
    ldh  a, [hJoypadState]                        ; $4927: $F0 $CC
    and  J_RIGHT | J_LEFT                         ; $4929: $E6 $03
    jr   z, .jr_4938                              ; $492B: $28 $0B
    call MoveSelect.playMoveSelectionJingle       ; $492D: $CD $AE $6B
    ld   a, [wIsFileSelectionArrowShifted]        ; $4930: $FA $00 $D0
    xor  $01                                      ; $4933: $EE $01
    ld   [wIsFileSelectionArrowShifted], a        ; $4935: $EA $00 $D0

.jr_4938::
    ldh  a, [hFrameCounter]                       ; $4938: $F0 $E7
    and  $10                                      ; $493A: $E6 $10
    jr   nz, func_001_4954                        ; $493C: $20 $16
    ld   a, [wIsFileSelectionArrowShifted]        ; $493E: $FA $00 $D0
    and  a                                        ; $4941: $A7
    ld   a, FILE_2C                               ; $4942: $3E $2C
    jr   z, .jr_4948                              ; $4944: $28 $02
    ld   a, FILE_64                               ; $4946: $3E $64

.jr_4948::
    ld   hl, wOAMBuffer + $8 ; Arrow sprite              ; $4948: $21 $08 $C0
    ld   [hl], $88 ; y                            ; $494B: $36 $88
    inc  hl                                       ; $494D: $23
    ldi  [hl], a ; x                              ; $494E: $22
    ld   a, $BE                                   ; $494F: $3E $BE
    ldi  [hl], a ; Tile                           ; $4951: $22
    xor  a                                        ; $4952: $AF
    ld   [hl], a                                  ; $4953: $77

func_001_4954::
    ld   a, [wSaveSlot]                           ; $4954: $FA $A6 $DB
    ld   e, a                                     ; $4957: $5F
    ld   d, $00                                   ; $4958: $16 $00
    ld   hl, Data_001_48E4                        ; $495A: $21 $E4 $48
    add  hl, de                                   ; $495D: $19
    ldh  a, [hFrameCounter]                       ; $495E: $F0 $E7
    and  $08                                      ; $4960: $E6 $08
    jr   z, .jr_497B                              ; $4962: $28 $17
    ld   a, [hl]                                  ; $4964: $7E
    ld   hl, wOAMBuffer                           ; $4965: $21 $00 $C0
    push af                                       ; $4968: $F5
    ldi  [hl], a                                  ; $4969: $22
    ld   a, $18                                   ; $496A: $3E $18
    ldi  [hl], a                                  ; $496C: $22
    xor  a                                        ; $496D: $AF
    ldi  [hl], a                                  ; $496E: $22
    ldi  [hl], a                                  ; $496F: $22
    pop  af                                       ; $4970: $F1
    ldi  [hl], a                                  ; $4971: $22
    ld   a, $20                                   ; $4972: $3E $20
    ldi  [hl], a                                  ; $4974: $22
    ld   a, $02                                   ; $4975: $3E $02
    ldi  [hl], a                                  ; $4977: $22
    xor  a                                        ; $4978: $AF
    ld   [hl], a                                  ; $4979: $77
    ret                                           ; $497A: $C9

.jr_497B::
    ld   a, [hl]                                  ; $497B: $7E
    ld   hl, wOAMBuffer                           ; $497C: $21 $00 $C0
    push af                                       ; $497F: $F5
    ldi  [hl], a                                  ; $4980: $22
    ld   a, $18                                   ; $4981: $3E $18
    ldi  [hl], a                                  ; $4983: $22
    ld   a, $02                                   ; $4984: $3E $02
    ldi  [hl], a                                  ; $4986: $22
    ld   a, $20                                   ; $4987: $3E $20
    ldi  [hl], a                                  ; $4989: $22
    pop  af                                       ; $498A: $F1
    ldi  [hl], a                                  ; $498B: $22
    ld   a, $20                                   ; $498C: $3E $20
    ldi  [hl], a                                  ; $498E: $22
    xor  a                                        ; $498F: $AF
    ldi  [hl], a                                  ; $4990: $22
    ld   a, $20                                   ; $4991: $3E $20
    ld   [hl], a                                  ; $4993: $77
    ret                                           ; $4994: $C9

FileSelectionExecuteChoice::
    ; If the COPY or ERASE menu item was selected, handle this.
    ld   a, [wSaveSlot]                           ; $4995: $FA $A6 $DB
    cp   $03                                      ; $4998: $FE $03
    jr   z, HandleFileSelectionCommand            ; $499A: $28 $42

    ; The player selected an actual save file.
    ld   a, [wSaveSlot]                           ; $499C: $FA $A6 $DB
    ld   e, a                                     ; $499F: $5F
    sla  a                                        ; $49A0: $CB $27
    sla  a                                        ; $49A2: $CB $27
    add  a, e                                     ; $49A4: $83
    ld   e, a                                     ; $49A5: $5F
    ld   d, $00                                   ; $49A6: $16 $00
    ld   c, $05                                   ; $49A8: $0E $05
    ld   hl, wSaveSlotNames                       ; $49AA: $21 $80 $DB
    add  hl, de                                   ; $49AD: $19

.loop
    ld   a, [hli]                                 ; $49AE: $2A
    and  a                                        ; $49AF: $A7
    jr   nz, LoadSelectedFile                     ; $49B0: $20 $11
    dec  c                                        ; $49B2: $0D
    jr   nz, .loop                                ; $49B3: $20 $F9

    ; Go to the file new dialog
    xor  a                                        ; $49B5: $AF
    ld   [wGameplaySubtype], a                    ; $49B6: $EA $96 $DB
    ld   a, GAMEPLAY_FILE_NEW                     ; $49B9: $3E $03
    ld   [wGameplayType], a                       ; $49BB: $EA $95 $DB

PlayValidationJingle::
PlayValidationJingleAndReturn::
    ld   a, JINGLE_VALIDATE                       ; $49BE: $3E $13
    ldh  [hJingle], a                             ; $49C0: $E0 $F2
    ret                                           ; $49C2: $C9

LoadSelectedFile::
    call PlayValidationJingle                     ; $49C3: $CD $BE $49

    ld   a, $00                                   ; $49C6: $3E $00
    ld   [wBGPalette], a                          ; $49C8: $EA $97 $DB
    ld   [wOBJ0Palette], a                        ; $49CB: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $49CE: $EA $99 $DB
    ld   a, $01                                   ; $49D1: $3E $01
    call ClearFileMenuBG_trampoline               ; $49D3: $CD $FA $08

    ld   a, TILESET_BASE_OVERWORLD                ; $49D6: $3E $05
    ld   [wTilesetToLoad], a                      ; $49D8: $EA $FE $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $49DB: $C3 $D6 $44

HandleFileSelectionCommand::
    ; Clear Gameplay Subtype
    xor  a                                        ; $49DE: $AF
    ld   [wGameplaySubtype], a                    ; $49DF: $EA $96 $DB
    ; If the arrow is not the COPY item…
    ld   a, [wIsFileSelectionArrowShifted]        ; $49E2: $FA $00 $D0
    and  a                                        ; $49E5: $A7
    ; … go to the File Deletion screen,
    ld   a, GAMEPLAY_FILE_DELETE                  ; $49E6: $3E $04
    jr   z, .nextScreenEnd                        ; $49E8: $28 $02
    ; else go to the File Copy screen.
    ld   a, GAMEPLAY_FILE_COPY                    ; $49EA: $3E $05
.nextScreenEnd

    ; Move to the Game Start stage
    ld   [wGameplayType], a                       ; $49EC: $EA $95 $DB
    jp   PlayValidationJingleAndReturn            ; $49EF: $C3 $BE $49

; File creation data
Data_001_49F2::
    dw   SaveGame1.main + wInventoryItems.BButtonSlot - wOverworldRoomStatus
    dw   SaveGame2.main + wInventoryItems.BButtonSlot - wOverworldRoomStatus
    dw   SaveGame3.main + wInventoryItems.BButtonSlot - wOverworldRoomStatus

SaveGameTable::
    dw   SaveGame1.main
    dw   SaveGame2.main
    dw   SaveGame3.main

; Part of file copy
Data_001_49FE::
    dw   SaveGame1                                ; $49FE
    dw   SaveGame2                                ; $4A00
    dw   SaveGame3                                ; $4A02

FileSelectionLoadSavedFile::
    jp   LoadSavedFile                            ; $4A04: $C3 $A4 $52


; -----------------------------------------------------------------------------
;
; GAMEPLAY_FILE_NEW
; Screen for creating a new file
;
; -----------------------------------------------------------------------------

; Address of the tile indicating the save slot index in the BG Map
DEF FILE_NEW_SAVE_SLOT_INDEX_BG EQU vBGMap0 + $49
; Offset of the tile indicating the save slot index "1" in the "menu.dmg.2bpp" tileset
; The tiles for index "2" and "3" follow next in the tileset.
DEF FILE_NEW_SAVE_SLOT_1_TILE EQU $AB

FileCreationEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $4A07: $FA $96 $DB
    JP_TABLE                                      ; $4A0A: $C7
._00 dw FileCreationInit1Handler                  ; $4A0B
._01 dw FileCreationInit2Handler                  ; $4A0D
._02 dw FileCreationInteractiveHandler            ; $4A0F

FileCreationInit1Handler::
    call IncrementGameplaySubtype                 ; $4A11: $CD $D6 $44
    ld   a, TILESET_FILL_TILEMAP                  ; $4A14: $3E $08
    ld   [wTilesetToLoad], a                      ; $4A16: $EA $FE $D6
    xor  a                                        ; $4A19: $AF
    ld   [wDBA8], a                               ; $4A1A: $EA $A8 $DB
    ld   [wNameEntryCurrentChar], a               ; $4A1D: $EA $A9 $DB
    ld   [wSaveSlotNameCharIndex], a              ; $4A20: $EA $AA $DB
    ret                                           ; $4A23: $C9

FileCreationInit2Handler::
    ld   a, TILEMAP_MENU_FILE_CREATION            ; $4A24: $3E $05
    ld   [wBGMapToLoad], a                        ; $4A26: $EA $FF $D6

    ;
    ; Write the proper tile for the save file number at the top
    ;

    ; Configure a wDrawCommand to copy the tile number to the BG map
    ; during the next vblank period.
    ld   hl, wDrawCommand                         ; $4A29: $21 $01 $D6
    ld   a, HIGH(FILE_NEW_SAVE_SLOT_INDEX_BG)     ; $4A2C: $3E $98
    ldi  [hl], a ; wDrawCommandDestinationHigh    ; $4A2E: $22
    ld   a, LOW(FILE_NEW_SAVE_SLOT_INDEX_BG)      ; $4A2F: $3E $49
    ldi  [hl], a ; wDrawCommand.destinationLow    ; $4A31: $22
    xor  a                                        ; $4A32: $AF
    ldi  [hl], a ; wDrawCommand.length            ; $4A33: $22
    ld   a, [wSaveSlot]                           ; $4A34: $FA $A6 $DB
    add  a, FILE_NEW_SAVE_SLOT_1_TILE             ; $4A37: $C6 $AB
    ldi  [hl], a ; wDrawCommandData[0]            ; $4A39: $22
    xor  a                                        ; $4A3A: $AF
    ld   [hl], a ; wDrawCommandData[1]            ; $4A3B: $77
    jp   IncrementGameplaySubtypeAndReturn        ; $4A3C: $C3 $D6 $44

IF !LANG_DE
; Write a single byte to the save file.
; Inputs:
;   hl   address of the save file start
;   bc   offset
;   a    value to write
WriteByteToSRAM::
    push hl                                       ; $4A3F: $E5
    add  hl, bc                                   ; $4A40: $09
    call EnableSRAM                               ; $4A41: $CD $D0 $27
    ld   [hl], a                                  ; $4A44: $77
    pop  hl                                       ; $4A45: $E1
    ret                                           ; $4A46: $C9

label_4A47::
    ld   bc, DebugSaveFileData                    ; $4A47: $01 $67 $46
    ld   e, DEBUG_SAVE_FILE_SIZE                  ; $4A4A: $1E $43
    push hl                                       ; $4A4C: $E5

.loop_4A4D
    call EnableSRAM                               ; $4A4D: $CD $D0 $27
    ld   a, [bc]                                  ; $4A50: $0A
    ldi  [hl], a                                  ; $4A51: $22
    inc  bc                                       ; $4A52: $03
    dec  e                                        ; $4A53: $1D
    ld   a, e                                     ; $4A54: $7B
    and  a                                        ; $4A55: $A7
    jr   nz, .loop_4A4D                           ; $4A56: $20 $F5
    pop  hl                                       ; $4A58: $E1
    ld   bc, $4E                                  ; $4A59: $01 $4E $00
    ld   a, $01                                   ; $4A5C: $3E $01
    call WriteByteToSRAM                          ; $4A5E: $CD $3F $4A
    ld   bc, $44                                  ; $4A61: $01 $44 $00
    call WriteByteToSRAM                          ; $4A64: $CD $3F $4A
    ld   bc, $43                                  ; $4A67: $01 $43 $00
    ld   a, $02                                   ; $4A6A: $3E $02
    call WriteByteToSRAM                          ; $4A6C: $CD $3F $4A
    ld   bc, $4D                                  ; $4A6F: $01 $4D $00
    ld   a, $59                                   ; $4A72: $3E $59
    call WriteByteToSRAM                          ; $4A74: $CD $3F $4A
    ld   bc, $77                                  ; $4A77: $01 $77 $00
    call WriteByteToSRAM                          ; $4A7A: $CD $3F $4A
    ld   bc, $78                                  ; $4A7D: $01 $78 $00
    call WriteByteToSRAM                          ; $4A80: $CD $3F $4A
    ld   bc, $45                                  ; $4A83: $01 $45 $00
    call WriteByteToSRAM                          ; $4A86: $CD $3F $4A
    ld   bc, $76                                  ; $4A89: $01 $76 $00
    ld   a, $39                                   ; $4A8C: $3E $39
    call WriteByteToSRAM                          ; $4A8E: $CD $3F $4A
    ld   bc, $4C                                  ; $4A91: $01 $4C $00
    call WriteByteToSRAM                          ; $4A94: $CD $3F $4A
    ret                                           ; $4A97: $C9
ENDC

; Index of the 5-letters save file name in memory.
; Indexed by wSaveSlot
SaveSlotNameAddresses::
._01 db  wSaveSlot1Name - wSaveSlotNames
._02 db  wSaveSlot2Name - wSaveSlotNames
._03 db  wSaveSlot3Name - wSaveSlotNames                           ; $4A98

macro CHECKNAME
    ld   hl, wSaveSlotNames
    add  hl, de
FOR I, NAME_LENGTH
    ld   a, [hli]
IF CHARLEN(\1) < I + 1
    cp   0
ELSE
    cp   CHARSUB(\1, 1 + I) + $01
ENDC
    jr   nz, \3
ENDR
    ld   a, \2
ENDM

FileCreationInteractiveHandler::
    ; hl = address of the save file name for the current slot
    ld   a, [wSaveSlot]                           ; $4A9B: $FA $A6 $DB
    ld   e, a                                     ; $4A9E: $5F
    ld   d, $00                                   ; $4A9F: $16 $00
    ld   hl, SaveSlotNameAddresses                ; $4AA1: $21 $98 $4A
    add  hl, de                                   ; $4AA4: $19
    ld   e, [hl]                                  ; $4AA5: $5E
    ld   hl, wSaveSlotNames                       ; $4AA6: $21 $80 $DB
    add  hl, de                                   ; $4AA9: $19
    ld   e, l                                     ; $4AAA: $5D
    ld   d, h                                     ; $4AAB: $54
    ld   bc, $984A                                ; $4AAC: $01 $4A $98
    call DrawSaveSlotName                         ; $4AAF: $CD $52 $48

    ; If START is pressed, record the save file name
    ldh  a, [hJoypadState]                        ; $4AB2: $F0 $CC
    and  J_START                                  ; $4AB4: $E6 $80
IF __DIACRITICS_SUPPORT__
    jp   z, .validationEnd
ELSE
    jr   z, .validationEnd                        ; $4AB6: $28 $71
ENDC
    call PlayValidationJingle                     ; $4AB8: $CD $BE $49
    ld   a, [wSaveSlot]                           ; $4ABB: $FA $A6 $DB
    sla  a                                        ; $4ABE: $CB $27
    ld   e, a                                     ; $4AC0: $5F
    ld   d, $00                                   ; $4AC1: $16 $00
    ld   hl, Data_001_49F2                        ; $4AC3: $21 $F2 $49
    add  hl, de                                   ; $4AC6: $19
    ld   a, [hli]                                 ; $4AC7: $2A
    ld   h, [hl]                                  ; $4AC8: $66
    ld   l, a                                     ; $4AC9: $6F
    push hl                                       ; $4ACA: $E5
    ld   de, wName - wInventoryItems.BButtonSlot  ; $4ACB: $11 $4F $00
    add  hl, de                                   ; $4ACE: $19
    push hl                                       ; $4ACF: $E5
    ld   a, [wSaveSlot]                           ; $4AD0: $FA $A6 $DB
    ld   e, a                                     ; $4AD3: $5F
    sla  a                                        ; $4AD4: $CB $27
    sla  a                                        ; $4AD6: $CB $27
    add  a, e                                     ; $4AD8: $83
    ld   e, a                                     ; $4AD9: $5F
    ld   d, $00                                   ; $4ADA: $16 $00

IF (DEF(EASTER_EGG_FILENAME_2))
    CHECKNAME "{EASTER_EGG_FILENAME_1}", EASTER_EGG_SONG_1, .checkOtherName
    jr .foundName
.checkOtherName
    CHECKNAME "{EASTER_EGG_FILENAME_2}", EASTER_EGG_SONG_2, .easterEggEnd
ELSE
    CHECKNAME "{EASTER_EGG_FILENAME_1}", EASTER_EGG_SONG_1, .easterEggEnd
ENDC

.foundName
    ld   [wMusicTrackToPlay], a                   ; $4AFB: $EA $68 $D3
.easterEggEnd

    ; Write the slot name to the save file
    ld   hl, wSaveSlotNames                       ; $4AFE: $21 $80 $DB
    add  hl, de                                   ; $4B01: $19
    pop  bc                                       ; $4B02: $C1
    ld   e, NAME_LENGTH                           ; $4B03: $1E $05
.loop
    call EnableSRAM                               ; $4B05: $CD $D0 $27
    ld   a, [hli]                                 ; $4B08: $2A
    ld   [bc], a                                  ; $4B09: $02
    inc  bc                                       ; $4B0A: $03
    dec  e                                        ; $4B0B: $1D
    jr   nz, .loop                                ; $4B0C: $20 $F7

    pop  hl                                       ; $4B0E: $E1
    push hl                                       ; $4B0F: $E5
    ld   de, wHealth - wInventoryItems.BButtonSlot ; $4B10: $11 $5A $00
    add  hl, de                                   ; $4B13: $19
    ld   [hl], $18  ; write new save current health ; $4B14: $36 $18
    pop  hl                                       ; $4B16: $E1
    push hl                                       ; $4B17: $E5
    ld   de, wMaxHearts - wInventoryItems.BButtonSlot ; $4B18: $11 $5B $00
    add  hl, de                                   ; $4B1B: $19
    ld   [hl], $03  ; write new save max health   ; $4B1C: $36 $03
    pop  hl                                       ; $4B1E: $E1
    ld   de, wDeathCount - wInventoryItems.BButtonSlot ; $4B1F: $11 $57 $00
    add  hl, de                                   ; $4B22: $19
    xor  a                                        ; $4B23: $AF
    ldi  [hl], a                                  ; $4B24: $22
    ld   [hl], a                                  ; $4B25: $77
    jp   label_001_4555                           ; $4B26: $C3 $55 $45

.validationEnd
    call func_001_4BF5                            ; $4B29: $CD $F5 $4B
    call func_001_4C8A                            ; $4B2C: $CD $8A $4C
    ret                                           ; $4B2F: $C9

Data_001_4B30::
    db   $38, $38, $38, $38, $38, $38, $38, $38   ; $4B30 ; $4B30
    db   $38, $38, $38, $38, $38, $38, $38, $38   ; $4B38 ; $4B38
    db   $48, $48, $48, $48, $48, $48, $48, $48   ; $4B40 ; $4B40
    db   $48, $48, $48, $48, $48, $48, $48, $48   ; $4B48 ; $4B48
    db   $58, $58, $58, $58, $58, $58, $58, $58   ; $4B50 ; $4B50
    db   $58, $58, $58, $58, $58, $58, $58, $58   ; $4B58 ; $4B58
    db   $68, $68, $68, $68, $68, $68, $68, $68   ; $4B60 ; $4B60
    db   $68, $68, $68, $68, $68, $68, $68, $68   ; $4B68 ; $4B68
IF __DIACRITICS_SUPPORT__
    db   $78, $78, $78, $78, $78, $78, $78, $78
    db   $78, $78, $78, $78, $78, $78, $78, $78
ENDC

Data_001_4B70::
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B70 ; $4B70
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B78 ; $4B78
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B80 ; $4B80
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B88 ; $4B88
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B90 ; $4B90
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B98 ; $4B98
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4BA0 ; $4BA0
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4BA8 ; $4BA8
IF __DIACRITICS_SUPPORT__
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C
ENDC

Data_001_4BB0::
    db   $4C, $54, $5C, $64, $6C                  ; $4BB0 ; $4BB0

NameEntryCharacterTable::
include "data/name_entry_characters.asm"
.end

func_001_4BF5::
    ldh  a, [hJoypadState]                        ; $4BF5: $F0 $CC

jr_001_4BF7::
    ldh  [hMultiPurpose0], a                      ; $4BF7: $E0 $D7
    ldh  a, [hMultiPurpose0]                      ; $4BF9: $F0 $D7
    and  $0C                                      ; $4BFB: $E6 $0C
    jr   nz, jr_001_4C41                          ; $4BFD: $20 $42
    ldh  a, [hMultiPurpose0]                      ; $4BFF: $F0 $D7
    and  $03                                      ; $4C01: $E6 $03
    jr   nz, jr_001_4C21                          ; $4C03: $20 $1C
    ldh  a, [hPressedButtonsMask]                 ; $4C05: $F0 $CB
    ld   hl, wC182                                ; $4C07: $21 $82 $C1
    and  $0F                                      ; $4C0A: $E6 $0F
    jr   nz, .jr_4C12                             ; $4C0C: $20 $04
    xor  a                                        ; $4C0E: $AF
    ld   [hl], a                                  ; $4C0F: $77
    jr   jr_001_4C1F                              ; $4C10: $18 $0D

.jr_4C12::
    ld   a, [hl]                                  ; $4C12: $7E
    inc  a                                        ; $4C13: $3C
    ld   [hl], a                                  ; $4C14: $77
    cp   $18                                      ; $4C15: $FE $18
    jr   nz, jr_001_4C1F                          ; $4C17: $20 $06
    ld   [hl], $15                                ; $4C19: $36 $15
    ldh  a, [hPressedButtonsMask]                 ; $4C1B: $F0 $CB
    jr   jr_001_4BF7                              ; $4C1D: $18 $D8

jr_001_4C1F::
    jr   jr_001_4C63                              ; $4C1F: $18 $42

jr_001_4C21::
    call MoveSelect.playMoveSelectionJingle       ; $4C21: $CD $AE $6B
    bit  1, a                                     ; $4C24: $CB $4F
    jr   nz, .jr_4C34                             ; $4C26: $20 $0C
    ld   a, [wNameEntryCurrentChar]               ; $4C28: $FA $A9 $DB
    add  a, $01                                   ; $4C2B: $C6 $01
    cp   NameEntryCharacterTableSize              ; $4C2D: $FE $40
    jr   c, jr_001_4C5E                           ; $4C2F: $38 $2D
    xor  a                                        ; $4C31: $AF
    jr   jr_001_4C5E                              ; $4C32: $18 $2A

.jr_4C34::
    ld   a, [wNameEntryCurrentChar]               ; $4C34: $FA $A9 $DB
    sub  a, $01                                   ; $4C37: $D6 $01
    cp   $FF                                      ; $4C39: $FE $FF
    jr   nz, jr_001_4C5E                          ; $4C3B: $20 $21
    ld   a, NameEntryCharacterTableSize - 1       ; $4C3D: $3E $3F
    jr   jr_001_4C5E                              ; $4C3F: $18 $1D

jr_001_4C41::
    call MoveSelect.playMoveSelectionJingle       ; $4C41: $CD $AE $6B
    bit  2, a                                     ; $4C44: $CB $57
    jr   z, .jr_4C53                              ; $4C46: $28 $0B
    ld   a, [wNameEntryCurrentChar]               ; $4C48: $FA $A9 $DB
    sub  a, $10                                   ; $4C4B: $D6 $10
    jr   nc, jr_001_4C5E                          ; $4C4D: $30 $0F
    add  a, NameEntryCharacterTableSize           ; $4C4F: $C6 $40
    jr   jr_001_4C5E                              ; $4C51: $18 $0B

.jr_4C53::
    ld   a, [wNameEntryCurrentChar]               ; $4C53: $FA $A9 $DB
    add  a, $10                                   ; $4C56: $C6 $10
    cp   NameEntryCharacterTableSize              ; $4C58: $FE $40
    jr   c, jr_001_4C5E                           ; $4C5A: $38 $02
    sub  a, NameEntryCharacterTableSize           ; $4C5C: $D6 $40

jr_001_4C5E::
    ld   [wNameEntryCurrentChar], a               ; $4C5E: $EA $A9 $DB
    jr   jr_001_4C63                              ; $4C61: $18 $00

jr_001_4C63::
    ld   a, [wNameEntryCurrentChar]               ; $4C63: $FA $A9 $DB
    ld   hl, Data_001_4B70                        ; $4C66: $21 $70 $4B
    ld   c, a                                     ; $4C69: $4F
    ld   b, $00                                   ; $4C6A: $06 $00
    add  hl, bc                                   ; $4C6C: $09
    ld   e, [hl]                                  ; $4C6D: $5E
    ld   a, [wNameEntryCurrentChar]               ; $4C6E: $FA $A9 $DB
    ld   hl, Data_001_4B30                        ; $4C71: $21 $30 $4B
    ld   c, a                                     ; $4C74: $4F
    ld   b, $00                                   ; $4C75: $06 $00
    add  hl, bc                                   ; $4C77: $09
    ld   d, [hl]                                  ; $4C78: $56
    ld   hl, wOAMBuffer                           ; $4C79: $21 $00 $C0
    ld   a, d                                     ; $4C7C: $7A
    add  a, $0B                                   ; $4C7D: $C6 $0B
    ldi  [hl], a                                  ; $4C7F: $22
    ld   a, e                                     ; $4C80: $7B
    add  a, $04                                   ; $4C81: $C6 $04
    ldi  [hl], a                                  ; $4C83: $22
    ld   a, $E0                                   ; $4C84: $3E $E0
    ldi  [hl], a                                  ; $4C86: $22
    xor  a                                        ; $4C87: $AF
    ld   [hl], a                                  ; $4C88: $77
    ret                                           ; $4C89: $C9

func_001_4C8A:: ; "Enter Name" screen
    ldh  a, [hJoypadState] ; Check inputs...      ; $4C8A: $F0 $CC
    and  J_A | J_B ; Was A or B pushed?           ; $4C8C: $E6 $30
    jr   z, jr_001_4CB7 ; If no, bail             ; $4C8E: $28 $27
    bit  J_BIT_B, a ; Was B pushed?               ; $4C90: $CB $6F
    jr   nz, .jr_4CA7 ; If yes, backspace         ; $4C92: $20 $13
    call PlayValidationJingle ; Otherwise, A was pushed ; $4C94: $CD $BE $49
    call func_001_4CDA ; so add the current letter ; $4C97: $CD $DA $4C
    ld   a, [wSaveSlotNameCharIndex]              ; $4C9A: $FA $AA $DB
    add  a, $01                                   ; $4C9D: $C6 $01
    cp   NAME_LENGTH ; Prevent cursor from going > 5th place ; $4C9F: $FE $05
    jr   c, jr_001_4CB4                           ; $4CA1: $38 $11
    ld   a, $04                                   ; $4CA3: $3E $04
    jr   jr_001_4CB4                              ; $4CA5: $18 $0D

.jr_4CA7::
    ; B button when inputting filename
    call PlayValidationJingle                     ; $4CA7: $CD $BE $49
    ld   a, [wSaveSlotNameCharIndex]              ; $4CAA: $FA $AA $DB
    sub  a, $01                                   ; $4CAD: $D6 $01
    cp   $FF                                      ; $4CAF: $FE $FF
    jr   nz, jr_001_4CB4                          ; $4CB1: $20 $01
    xor  a ; Prevent cursor from going < 1st place ; $4CB3: $AF

jr_001_4CB4::
    ld   [wSaveSlotNameCharIndex], a              ; $4CB4: $EA $AA $DB

jr_001_4CB7::
    ld   a, [wSaveSlotNameCharIndex]              ; $4CB7: $FA $AA $DB
    ld   hl, Data_001_4BB0                        ; $4CBA: $21 $B0 $4B
    ld   c, a                                     ; $4CBD: $4F
    ld   b, $00                                   ; $4CBE: $06 $00
    add  hl, bc                                   ; $4CC0: $09
    ld   e, [hl]                                  ; $4CC1: $5E
    ldh  a, [hFrameCounter]                       ; $4CC2: $F0 $E7
    and  $10                                      ; $4CC4: $E6 $10
    jr   z, .return                               ; $4CC6: $28 $11
    ld   hl, wOAMBuffer+4                         ; $4CC8: $21 $04 $C0
    ld   a, $18                                   ; $4CCB: $3E $18
    add  a, $0B                                   ; $4CCD: $C6 $0B
    ldi  [hl], a                                  ; $4CCF: $22
    ld   a, e                                     ; $4CD0: $7B
    add  a, $0C                                   ; $4CD1: $C6 $0C
    ldi  [hl], a                                  ; $4CD3: $22
    ld   a, $E0                                   ; $4CD4: $3E $E0
    ldi  [hl], a                                  ; $4CD6: $22
    xor  a                                        ; $4CD7: $AF
    ld   [hl], a                                  ; $4CD8: $77

.return
    ret                                           ; $4CD9: $C9

func_001_4CDA::
    ld   a, [wNameEntryCurrentChar]               ; $4CDA: $FA $A9 $DB
    ld   c, a                                     ; $4CDD: $4F
    ld   b, $00                                   ; $4CDE: $06 $00
    ld   hl, NameEntryCharacterTable              ; $4CE0: $21 $B5 $4B
    add  hl, bc                                   ; $4CE3: $09
    ld   a, [hl]                                  ; $4CE4: $7E
    ld   e, a                                     ; $4CE5: $5F
    ld   a, [wSaveSlot]                           ; $4CE6: $FA $A6 $DB
    ld   c, a                                     ; $4CE9: $4F
    sla  a                                        ; $4CEA: $CB $27
    sla  a                                        ; $4CEC: $CB $27
    add  a, c                                     ; $4CEE: $81
    ld   c, a                                     ; $4CEF: $4F
    ld   hl, wSaveSlot1Name                       ; $4CF0: $21 $80 $DB
    add  hl, bc                                   ; $4CF3: $09
    ld   a, [wSaveSlotNameCharIndex]              ; $4CF4: $FA $AA $DB
    ld   c, a                                     ; $4CF7: $4F
    add  hl, bc                                   ; $4CF8: $09
    ld   [hl], e                                  ; $4CF9: $73
    ret                                           ; $4CFA: $C9


; -----------------------------------------------------------------------------
;
; GAMEPLAY_FILE_DELETE
; Screen for deleting a file
;
; -----------------------------------------------------------------------------


FileDeletionEntryPoint::
    call func_5DC0                                ; $4CFB: $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ; $4CFE: $FA $96 $DB
    JP_TABLE                                      ; $4D01: $C7
._00 dw FileDeletionState0Handler                 ; $4D02
._01 dw FileDeletionState1Handler                 ; $4D04
._02 dw FileDeletionState2Handler                 ; $4D06
._03 dw FileDeletionState3Handler                 ; $4D08
._04 dw FileDeletionState4Handler                 ; $4D0A
._05 dw FileDeletionState5Handler                 ; $4D0C
._06 dw FileDeletionState6Handler                 ; $4D0E
._07 dw FileDeletionState7Handler                 ; $4D10
._08 dw FileDeletionState8Handler                 ; $4D12
._09 dw FileDeletionState9Handler                 ; $4D14
._0A dw FileDeletionState10Handler                ; $4D16
._0B dw FileDeletionState11Handler                ; $4D18

FileDeletionState0Handler::
    ldh  a, [hIsGBC]                              ; $4D1A: $F0 $FE ; $4D1A: $F0 $FE
    and  a                                        ; $4D1C: $A7 ; $4D1C: $A7
    jr   z, jr_001_4D53                           ; $4D1D: $28 $34 ; $4D1D: $28 $34

    ld   a, $01                                   ; $4D1F: $3E $01 ; $4D1F: $3E $01
    call ClearFileMenuBG_trampoline               ; $4D21: $CD $FA $08 ; $4D21: $CD $FA $08
    ld   a, $01                                   ; $4D24: $3E $01 ; $4D24: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D26: $EA $D1 $DD ; $4D26: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D29: $C3 $D6 $44 ; $4D29: $C3 $D6 $44

FileDeletionState1Handler::
    ldh  a, [hIsGBC]                              ; $4D2C: $F0 $FE ; $4D2C: $F0 $FE
    and  a                                        ; $4D2E: $A7 ; $4D2E: $A7
    jr   z, jr_001_4D53                           ; $4D2F: $28 $22 ; $4D2F: $28 $22

    ld   a, $02                                   ; $4D31: $3E $02 ; $4D31: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D33: $EA $D1 $DD ; $4D33: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D36: $C3 $D6 $44 ; $4D36: $C3 $D6 $44

FileDeletionState8Handler::
    ldh  a, [hIsGBC]                              ; $4D39: $F0 $FE ; $4D39: $F0 $FE
    and  a                                        ; $4D3B: $A7 ; $4D3B: $A7
    jr   z, jr_001_4D53                           ; $4D3C: $28 $15 ; $4D3C: $28 $15

    call LoadFileMenuBG_trampoline                ; $4D3E: $CD $05 $09 ; $4D3E: $CD $05 $09
    ld   a, $01                                   ; $4D41: $3E $01 ; $4D41: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D43: $EA $D1 $DD ; $4D43: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D46: $C3 $D6 $44 ; $4D46: $C3 $D6 $44

FileDeletionState9Handler::
    ldh  a, [hIsGBC]                              ; $4D49: $F0 $FE ; $4D49: $F0 $FE
    and  a                                        ; $4D4B: $A7 ; $4D4B: $A7
    jr   z, jr_001_4D53                           ; $4D4C: $28 $05 ; $4D4C: $28 $05

    ld   a, $02                                   ; $4D4E: $3E $02 ; $4D4E: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D50: $EA $D1 $DD ; $4D50: $EA $D1 $DD

jr_001_4D53::
    jp   IncrementGameplaySubtypeAndReturn        ; $4D53: $C3 $D6 $44 ; $4D53: $C3 $D6 $44

FileDeletionState2Handler::
    ld   a, TILESET_FILL_TILEMAP                  ; $4D56: $3E $08 ; $4D56: $3E $08
    ld   [wTilesetToLoad], a                      ; $4D58: $EA $FE $D6 ; $4D58: $EA $FE $D6
    xor  a                                        ; $4D5B: $AF ; $4D5B: $AF
    ld   [wSaveSlot], a                           ; $4D5C: $EA $A6 $DB ; $4D5C: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4D5F: $EA $00 $D0 ; $4D5F: $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4D62: $C3 $D6 $44 ; $4D62: $C3 $D6 $44

FileDeletionState3Handler::
    ld   a, TILEMAP_MENU_FILE_ERASE               ; $4D65: $3E $06 ; $4D65: $3E $06
    ld   [wBGMapToLoad], a                        ; $4D67: $EA $FF $D6 ; $4D67: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4D6A: $C3 $D6 $44 ; $4D6A: $C3 $D6 $44

FileDeletionState4Handler::
    call DrawSaveSlot1Name                        ; $4D6D: $CD $8B $4D ; $4D6D: $CD $8B $4D
    call DrawSaveSlot2Name                        ; $4D70: $CD $94 $4D ; $4D70: $CD $94 $4D
    call DrawSaveSlot3Name                        ; $4D73: $CD $9D $4D ; $4D73: $CD $9D $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D76: $C3 $D6 $44 ; $4D76: $C3 $D6 $44

FileDeletionState5Handler::
    call DrawSaveSlot1MaxHearts                   ; $4D79: $CD $A6 $4D
    call DrawSaveSlot2MaxHearts                   ; $4D7C: $CD $BE $4D ; $4D7C: $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D7F: $C3 $D6 $44 ; $4D7F: $C3 $D6 $44

FileDeletionState6Handler::
    call DrawSaveSlot3MaxHearts                   ; $4D82: $CD $D6 $4D ; $4D82: $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D85: $C3 $D6 $44 ; $4D85: $C3 $D6 $44

FileDeletionState7Handler::
    jp   CopyDeathCountsToBG                      ; $4D88: $C3 $0C $48 ; $4D88: $C3 $0C $48

DrawSaveSlot1Name::
    ld   bc, $98C5                                ; $4D8B: $01 $C5 $98 ; $4D8B: $01 $C5 $98
    ld   de, wSaveSlot1Name                       ; $4D8E: $11 $80 $DB ; $4D8E: $11 $80 $DB
    jp   DrawSaveSlotName                         ; $4D91: $C3 $52 $48 ; $4D91: $C3 $52 $48

DrawSaveSlot2Name::
    ld   bc, $9925                                ; $4D94: $01 $25 $99 ; $4D94: $01 $25 $99
    ld   de, wSaveSlot2Name                       ; $4D97: $11 $85 $DB ; $4D97: $11 $85 $DB
    jp   DrawSaveSlotName                         ; $4D9A: $C3 $52 $48 ; $4D9A: $C3 $52 $48

DrawSaveSlot3Name::
    ld   bc, $9985                                ; $4D9D: $01 $85 $99 ; $4D9D: $01 $85 $99
    ld   de, wSaveSlot3Name                       ; $4DA0: $11 $8A $DB ; $4DA0: $11 $8A $DB
    jp   DrawSaveSlotName                         ; $4DA3: $C3 $52 $48 ; $4DA3: $C3 $52 $48

DrawSaveSlot1MaxHearts::
    ld   a, [wSaveFilesCount]                     ; $4DA6: $FA $A7 $DB ; $4DA6: $FA $A7 $DB
    and  $01                                      ; $4DA9: $E6 $01 ; $4DA9: $E6 $01

; If the __RECALCULATE_MAX_HEARTS__ patch is enabled, also clamp
; the maximum number of hearts before drawing:
IF __RECALCULATE_MAX_HEARTS__
    ret  z
    xor  a
    ld   hl, wFile1Health
    ld   de, wFile1MaxHearts

.clamp:
    ldh [hMultiPurpose4], a
    ld a, [hl]
    ldh [hMultiPurpose2], a
    ld a, [de]
    cp MIN_HEARTS
    jr nc, .max
    ld a, MIN_HEARTS
.max:
    cp MAX_HEARTS
    jr c, .prepareDrawCommand

    ld a, MAX_HEARTS

.prepareDrawCommand:
    ld [de], a
    ldh [hMultiPurpose3], a
    swap a
    srl a
    cp [hl]
    jp nc, BuildSaveSlotHeartsDrawCommand

    ld [hl], a
    ldh [hMultiPurpose2], a
    jp BuildSaveSlotHeartsDrawCommand
ELSE
    jr   z, .return                               ; $4DAB: $28 $10

    xor  a                                        ; $4DAD: $AF
    ldh  [hMultiPurpose4], a                      ; $4DAE: $E0 $DB
    ld   a, [wFile1Health]                        ; $4DB0: $FA $06 $DC
    ldh  [hMultiPurpose2], a                      ; $4DB3: $E0 $D9
    ld   a, [wFile1MaxHearts]                     ; $4DB5: $FA $09 $DC
    ldh  [hMultiPurpose3], a                      ; $4DB8: $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ; $4DBA: $C3 $53 $5D

.return::
    ret                                           ; $4DBD: $C9 ; $4DBD: $C9
ENDC

DrawSaveSlot2MaxHearts::
    ld   a, [wSaveFilesCount]                     ; $4DBE: $FA $A7 $DB ; $4DBE: $FA $A7 $DB
    and  $02                                      ; $4DC1: $E6 $02 ; $4DC1: $E6 $02
; If the __RECALCULATE_MAX_HEARTS__ patch is enabled, also clamp
; the maximum number of hearts before drawing (jumps into
; DrawSaveSlot1MaxHearts to avoid code duplication):
IF __RECALCULATE_MAX_HEARTS__
    ret  z
    ld   a, $01
    ld   hl, wFile2Health
    ld   de, wFile2MaxHearts
    jr   DrawSaveSlot1MaxHearts.clamp
ELSE
    jr   z, DrawSaveSlot1MaxHearts.return         ; $4DC3: $28 $F8

    ld   a, $01                                   ; $4DC5: $3E $01 ; $4DC5: $3E $01
    ldh  [hMultiPurpose4], a                      ; $4DC7: $E0 $DB ; $4DC7: $E0 $DB
    ld   a, [wFile2Health]                        ; $4DC9: $FA $07 $DC ; $4DC9: $FA $07 $DC
    ldh  [hMultiPurpose2], a                      ; $4DCC: $E0 $D9 ; $4DCC: $E0 $D9
    ld   a, [wFile2MaxHearts]                     ; $4DCE: $FA $0A $DC ; $4DCE: $FA $0A $DC
    ldh  [hMultiPurpose3], a                      ; $4DD1: $E0 $DA ; $4DD1: $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ; $4DD3: $C3 $53 $5D ; $4DD3: $C3 $53 $5D
ENDC

DrawSaveSlot3MaxHearts::
    ld   a, [wSaveFilesCount]                     ; $4DD6: $FA $A7 $DB ; $4DD6: $FA $A7 $DB
    and  $04                                      ; $4DD9: $E6 $04 ; $4DD9: $E6 $04
; If the __RECALCULATE_MAX_HEARTS__ patch is enabled, also clamp
; the maximum number of hearts before drawing (jumps into
; DrawSaveSlot1MaxHearts to avoid code duplication):
IF __RECALCULATE_MAX_HEARTS__
    ret  z
    ld   a, $02
    ld   hl, wFile3Health
    ld   de, wFile3MaxHearts
    jr   DrawSaveSlot1MaxHearts.clamp
ELSE
    jr   z, DrawSaveSlot1MaxHearts.return         ; $4DDB: $28 $E0

    ld   a, $02                                   ; $4DDD: $3E $02 ; $4DDD: $3E $02
    ldh  [hMultiPurpose4], a                      ; $4DDF: $E0 $DB ; $4DDF: $E0 $DB
    ld   a, [wFile3Health]                        ; $4DE1: $FA $08 $DC ; $4DE1: $FA $08 $DC
    ldh  [hMultiPurpose2], a                      ; $4DE4: $E0 $D9 ; $4DE4: $E0 $D9
    ld   a, [wFile3MaxHearts]                     ; $4DE6: $FA $0B $DC ; $4DE6: $FA $0B $DC
    ldh  [hMultiPurpose3], a                      ; $4DE9: $E0 $DA ; $4DE9: $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ; $4DEB: $C3 $53 $5D ; $4DEB: $C3 $53 $5D
ENDC

Data_001_4DEE::
    db   $98, $A5, $44, $7E, $98, $C5, $44, $7E   ; $4DEE ; $4DEE
    db   $99, $05, $44, $7E, $99, $25, $44, $7E   ; $4DF6 ; $4DF6
    db   $99, $65, $44, $7E, $99, $85, $44, $7E   ; $4DFE ; $4DFE

FileDeletionState10Handler::
    call MoveSelect                               ; $4E06: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $4E09: $F0 $CC ; $4E09: $F0 $CC
    and  J_DOWN                                   ; $4E0B: $E6 $08 ; $4E0B: $E6 $08
    jr   z, .jr_4E18                              ; $4E0D: $28 $09 ; $4E0D: $28 $09

    ld   a, [wSaveSlot]                           ; $4E0F: $FA $A6 $DB ; $4E0F: $FA $A6 $DB
    inc  a                                        ; $4E12: $3C ; $4E12: $3C
    and  $03                                      ; $4E13: $E6 $03 ; $4E13: $E6 $03
    ld   [wSaveSlot], a                           ; $4E15: $EA $A6 $DB ; $4E15: $EA $A6 $DB

.jr_4E18::
    ldh  a, [hJoypadState]                        ; $4E18: $F0 $CC ; $4E18: $F0 $CC
    and  J_UP                                     ; $4E1A: $E6 $04 ; $4E1A: $E6 $04
    jr   z, jr_001_4E2B                           ; $4E1C: $28 $0D ; $4E1C: $28 $0D

    ld   a, [wSaveSlot]                           ; $4E1E: $FA $A6 $DB ; $4E1E: $FA $A6 $DB
    dec  a                                        ; $4E21: $3D ; $4E21: $3D
    cp   $FF                                      ; $4E22: $FE $FF ; $4E22: $FE $FF
    jr   nz, .jr_4E28                             ; $4E24: $20 $02 ; $4E24: $20 $02

    ld   a, $03                                   ; $4E26: $3E $03 ; $4E26: $3E $03

.jr_4E28::
    ld   [wSaveSlot], a                           ; $4E28: $EA $A6 $DB ; $4E28: $EA $A6 $DB

jr_001_4E2B::
    ldh  a, [hJoypadState]                        ; $4E2B: $F0 $CC ; $4E2B: $F0 $CC
    and  J_A | J_START                            ; $4E2D: $E6 $90 ; $4E2D: $E6 $90
    jr   z, jr_001_4E67                           ; $4E2F: $28 $36 ; $4E2F: $28 $36

    ld   a, [wSaveSlot]                           ; $4E31: $FA $A6 $DB ; $4E31: $FA $A6 $DB
    cp   $03                                      ; $4E34: $FE $03 ; $4E34: $FE $03
    jr   nz, .jr_4E3B                             ; $4E36: $20 $03 ; $4E36: $20 $03

    jp   label_001_4555                           ; $4E38: $C3 $55 $45 ; $4E38: $C3 $55 $45

.jr_4E3B::
    call PlayValidationJingleAndReturn            ; $4E3B: $CD $BE $49 ; $4E3B: $CD $BE $49
    call IncrementGameplaySubtype                 ; $4E3E: $CD $D6 $44 ; $4E3E: $CD $D6 $44

IF LANG_JP
CopyQuitOkTilemap::
    ld hl, wDrawCommand
    ld a, HIGH(vBGMap0 + $1EE)
    ld [hl+], a
    ld a, LOW(vBGMap0 + $1EE)
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld a, $BA
    ld [hl+], a
    ld a, $BB
    ld [hl+], a
    ld a, $3D

    ld [hl+], a                                   ; $4EB9: $22
    xor a                                         ; $4EBA: $AF
    ld [hl], a                                    ; $4EBB: $77
    ret                                           ; $4EBC: $C9
ELSE
    jr   CopyQuitOkTilemap                        ; $4E41: $18 $12 ; $4E41: $18 $12

; Tilemap for the "QUIT / OK" text, formatted as wDrawCommand data
FileMenuQuitOkTilemap::
include "data/file_menu_quit_ok.asm"
.end

CopyQuitOkTilemap::
    ld   hl, wDrawCommand                         ; $4E55: $21 $01 $D6
    ld   de, FileMenuQuitOkTilemap                ; $4E58: $11 $43 $4E
IF LANG_EN
    ld   c, FileMenuQuitOkTilemap.end - FileMenuQuitOkTilemap - 1 ; $4E5B: $0E $11
ELSE
    ld   c, FileMenuQuitOkTilemap.end - FileMenuQuitOkTilemap
ENDC

.loop
    ld   a, [de]                                  ; $4E5D: $1A
    inc  de                                       ; $4E5E: $13
    ld   [hl+], a                                 ; $4E5F: $22
    dec  c                                        ; $4E60: $0D
IF LANG_EN
    ld   a, c                                     ; $4E61: $79
    cp   -1                                       ; $4E62: $FE $FF
ENDC
    jr   nz, .loop                                ; $4E64: $20 $F7
    ret                                           ; $4E66: $C9
ENDC

jr_001_4E67::
    call func_001_4954                            ; $4E67: $CD $54 $49 ; $4E67: $CD $54 $49
    ret                                           ; $4E6A: $C9 ; $4E6A: $C9

FileDeletionState11Handler::
    ldh  a, [hJoypadState]                        ; $4E6B: $F0 $CC ; $4E6B: $F0 $CC
    bit  J_BIT_B, a                               ; $4E6D: $CB $6F ; $4E6D: $CB $6F
    jr   nz, jr_001_4E9E                          ; $4E6F: $20 $2D ; $4E6F: $20 $2D

    and  J_A | J_START                            ; $4E71: $E6 $90 ; $4E71: $E6 $90
IF LANG_DE
    jp   z, jr_001_4ED9
ELSE
    jr   z, jr_001_4ED9                           ; $4E73: $28 $64 ; $4E73: $28 $64
ENDC

    ld   a, [wCreditsScratch0]                    ; $4E75: $FA $00 $D0 ; $4E75: $FA $00 $D0
    and  a                                        ; $4E78: $A7 ; $4E78: $A7
    jp   z, label_001_4555                        ; $4E79: $CA $55 $45 ; $4E79: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $4E7C: $CD $BE $49 ; $4E7C: $CD $BE $49
    ld   a, [wSaveSlot]                           ; $4E7F: $FA $A6 $DB ; $4E7F: $FA $A6 $DB
    sla  a                                        ; $4E82: $CB $27 ; $4E82: $CB $27
    ld   e, a                                     ; $4E84: $5F ; $4E84: $5F
    ld   d, $00                                   ; $4E85: $16 $00 ; $4E85: $16 $00
    ld   hl, SaveGameTable                        ; $4E87: $21 $F8 $49 ; $4E87: $21 $F8 $49
    add  hl, de                                   ; $4E8A: $19 ; $4E8A: $19
    ld   a, [hl+]                                 ; $4E8B: $2A ; $4E8B: $2A
    ld   h, [hl]                                  ; $4E8C: $66 ; $4E8C: $66
    ld   l, a                                     ; $4E8D: $6F ; $4E8D: $6F
    ld   de, SaveGame1.end - SaveGame1.main       ; $4E8E: $11 $A8 $03 ; $4E8E: $11 $A8 $03

.loop_4E91:: ; Clear the save
    call EnableSRAM                               ; $4E91: $CD $D0 $27 ; $4E91: $CD $D0 $27
    xor  a                                        ; $4E94: $AF ; $4E94: $AF
    ld   [hl+], a                                 ; $4E95: $22 ; $4E95: $22
    dec  de                                       ; $4E96: $1B ; $4E96: $1B
    ld   a, e                                     ; $4E97: $7B ; $4E97: $7B
    or   d                                        ; $4E98: $B2 ; $4E98: $B2
    jr   nz, .loop_4E91                           ; $4E99: $20 $F6 ; $4E99: $20 $F6

    jp   label_001_4555                           ; $4E9B: $C3 $55 $45 ; $4E9B: $C3 $55 $45

jr_001_4E9E::
    call func_001_4EE5                            ; $4E9E: $CD $E5 $4E ; $4E9E: $CD $E5 $4E
    call CopyReturnToMenuTilemap                  ; $4EA1: $CD $BB $4E ; $4EA1: $CD $BB $4E
    ld   hl, wGameplaySubtype                     ; $4EA4: $21 $96 $DB ; $4EA4: $21 $96 $DB
    dec  [hl]                                     ; $4EA7: $35 ; $4EA7: $35
    ret                                           ; $4EA8: $C9 ; $4EA8: $C9

IF LANG_JP
CopyReturnToMenuTilemap::
    ld   a, [wDrawCommandsSize]                   ; $4EFF: $FA $00 $D6
    ld   e, a                                     ; $4F02: $5F
    add  $04                                      ; $4F03: $C6 $04
    ld   [wDrawCommandsSize], a                   ; $4F05: $EA $00 $D6
    ld   d, $00                                   ; $4F08: $16 $00
    ld   hl, wDrawCommand                         ; $4F0A: $21 $01 $D6
    add  hl, de                                   ; $4F0D: $19
    ld   a, HIGH(vBGMap0 + $1EE)                  ; $4F0E: $3E $99
    ld   [hl+], a                                 ; $4F10: $22
    ld   a, LOW(vBGMap0 + $1EE)                   ; $4F11: $3E $EE
    ld   [hl+], a                                 ; $4F13: $22
    ld   a, $42                                   ; $4F14: $3E $42
    ld   [hl+], a                                 ; $4F16: $22
    ld   a, $7E                                   ; $4F17: $3E $7E
    ld   [hl+], a                                 ; $4F19: $22
    xor  a                                        ; $4F1A: $AF
    ld   [hl], a                                  ; $4F1B: $77
    ret                                           ; $4F1C: $C9
ELSE

; Tilemap for the "RETURN TO MENU" text, formatted as wDrawCommand data
FileReturnToMenuTilemap::
include "data/file_menu_return_to_menu.asm"
.end

IF LANG_DE
FileReturnToMenuTilemap_alt::
include "data/file_menu_return_to_menu_alt.asm"
.end
ENDC

CopyReturnToMenuTilemap::
    ld   a, [wDrawCommandsSize]                   ; $4EBB: $FA $00 $D6
    ld   e, a                                     ; $4EBE: $5F
    add  FileReturnToMenuTilemap.end - FileReturnToMenuTilemap - 1 ; $4EBF: $C6 $11
    ld   [wDrawCommandsSize], a                   ; $4EC1: $EA $00 $D6
    ld   d, $00                                   ; $4EC4: $16 $00
    ld   hl, wDrawCommand                         ; $4EC6: $21 $01 $D6
    add  hl, de                                   ; $4EC9: $19
    ld   de, FileReturnToMenuTilemap              ; $4ECA: $11 $A9 $4E

IF LANG_DE
    ; On German version, if on the File Copy screen, use an alternate version
    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_COPY
    jr   nz, .fileCopyEnd
    ld   de, FileReturnToMenuTilemap_alt
.fileCopyEnd
ENDC

IF LANG_EN
    ld   c, FileReturnToMenuTilemap.end - FileReturnToMenuTilemap - 1 ; $4ECD: $0E $11
ELSE
    ld   c, FileReturnToMenuTilemap.end - FileReturnToMenuTilemap
ENDC
.loop
    ld   a, [de]                                  ; $4ECF: $1A ; $4ECF: $1A
    inc  de                                       ; $4ED0: $13 ; $4ED0: $13
    ld   [hl+], a                                 ; $4ED1: $22 ; $4ED1: $22
    dec  c                                        ; $4ED2: $0D ; $4ED2: $0D
IF LANG_EN
    ld   a, c                                     ; $4ED3: $79 ; $4ED3: $79
    cp   -1                                       ; $4ED4: $FE $FF ; $4ED4: $FE $FF
ENDC
    jr   nz, .loop                                ; $4ED6: $20 $F7 ; $4ED6: $20 $F7

    ret                                           ; $4ED8: $C9 ; $4ED8: $C9
ENDC

jr_001_4ED9::
    call func_001_4F0C                            ; $4ED9: $CD $0C $4F ; $4ED9: $CD $0C $4F
    call func_001_4954                            ; $4EDC: $CD $54 $49 ; $4EDC: $CD $54 $49
    ldh  a, [hFrameCounter]                       ; $4EDF: $F0 $E7 ; $4EDF: $F0 $E7
    and  $10                                      ; $4EE1: $E6 $10 ; $4EE1: $E6 $10
    jr   z, jr_001_4EEF                           ; $4EE3: $28 $0A ; $4EE3: $28 $0A

func_001_4EE5::
    ld   a, [wSaveSlot]                           ; $4EE5: $FA $A6 $DB ; $4EE5: $FA $A6 $DB
    JP_TABLE                                      ; $4EE8 ; $4EE8: $C7
._00 dw DrawSaveSlot1Name                                ; $4EE9 ; $4EE9
._01 dw DrawSaveSlot2Name                                ; $4EEB ; $4EEB
._02 dw DrawSaveSlot3Name                                ; $4EED ; $4EED

jr_001_4EEF::
    ld   a, [wSaveSlot]                           ; $4EEF: $FA $A6 $DB ; $4EEF: $FA $A6 $DB
    rla                                           ; $4EF2: $17 ; $4EF2: $17
    rla                                           ; $4EF3: $17 ; $4EF3: $17
    rla                                           ; $4EF4: $17 ; $4EF4: $17
    and  $F8                                      ; $4EF5: $E6 $F8 ; $4EF5: $E6 $F8
    ld   e, a                                     ; $4EF7: $5F ; $4EF7: $5F
    ld   d, $00                                   ; $4EF8: $16 $00 ; $4EF8: $16 $00
    ld   hl, Data_001_4DEE                        ; $4EFA: $21 $EE $4D ; $4EFA: $21 $EE $4D
    add  hl, de                                   ; $4EFD: $19 ; $4EFD: $19
    ld   de, wDrawCommand                         ; $4EFE: $11 $01 $D6 ; $4EFE: $11 $01 $D6
    ld   c, $08                                   ; $4F01: $0E $08 ; $4F01: $0E $08

.loop_4F03
    ld   a, [hl+]                                 ; $4F03: $2A ; $4F03: $2A
    ld   [de], a                                  ; $4F04: $12 ; $4F04: $12
    inc  de                                       ; $4F05: $13 ; $4F05: $13
    dec  c                                        ; $4F06: $0D ; $4F06: $0D
    jr   nz, .loop_4F03                           ; $4F07: $20 $FA ; $4F07: $20 $FA

    xor  a                                        ; $4F09: $AF ; $4F09: $AF
    ld   [de], a                                  ; $4F0A: $12 ; $4F0A: $12
    ret                                           ; $4F0B: $C9 ; $4F0B: $C9

func_001_4F0C::
    ldh  a, [hJoypadState]                        ; $4F0C: $F0 $CC ; $4F0C: $F0 $CC
    and  J_RIGHT | J_LEFT                         ; $4F0E: $E6 $03 ; $4F0E: $E6 $03
    jr   z, .jr_4F1D                              ; $4F10: $28 $0B ; $4F10: $28 $0B

    call MoveSelect.playMoveSelectionJingle       ; $4F12: $CD $AE $6B
    ld   a, [wCreditsScratch0]                    ; $4F15: $FA $00 $D0 ; $4F15: $FA $00 $D0
    xor  $01                                      ; $4F18: $EE $01 ; $4F18: $EE $01
    ld   [wCreditsScratch0], a                    ; $4F1A: $EA $00 $D0 ; $4F1A: $EA $00 $D0

.jr_4F1D::
    ldh  a, [hFrameCounter]                       ; $4F1D: $F0 $E7 ; $4F1D: $F0 $E7
    and  $10                                      ; $4F1F: $E6 $10 ; $4F1F: $E6 $10
    jr   nz, ret_001_4F3A                         ; $4F21: $20 $17 ; $4F21: $20 $17

    ld   a, [wCreditsScratch0]                    ; $4F23: $FA $00 $D0 ; $4F23: $FA $00 $D0
    ld   e, a                                     ; $4F26: $5F ; $4F26: $5F
IF LANG_JP
    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_COPY
    ld   a, $1c
    jr   nz, .jr_4f76
ENDC
    ld   a, FILE_28                               ; $4F27: $3E $28 ; $4F27: $3E $28

.jr_4f76
    dec  e                                        ; $4F29: $1D ; $4F29: $1D
    jr   nz, .jr_4F2E                             ; $4F2A: $20 $02 ; $4F2A: $20 $02

    ld   a, FILE_6C                               ; $4F2C: $3E $6C ; $4F2C: $3E $6C

.jr_4F2E::
    ld   hl, wOAMBuffer+12                        ; $4F2E: $21 $0C $C0 ; $4F2E: $21 $0C $C0
    ld   [hl], $88                                ; $4F31: $36 $88 ; $4F31: $36 $88
    inc  hl                                       ; $4F33: $23 ; $4F33: $23
    ld   [hl+], a                                 ; $4F34: $22 ; $4F34: $22
    ld   a, $BE                                   ; $4F35: $3E $BE ; $4F35: $3E $BE
    ld   [hl+], a                                 ; $4F37: $22 ; $4F37: $22
    xor  a                                        ; $4F38: $AF ; $4F38: $AF
    ld   [hl], a                                  ; $4F39: $77 ; $4F39: $77

ret_001_4F3A::
    ret                                           ; $4F3A: $C9 ; $4F3A: $C9

Data_001_4F3B::
    db   $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7   ; $4F3B ; $4F3B
    db   $B8, $B9                                 ; $4F43 ; $4F43

CopyDigitsToFileScreenBG::
    push hl                                       ; $4F45: $E5 ; $4F45: $E5
    ld   a, [wDrawCommandsSize]                   ; $4F46: $FA $00 $D6 ; $4F46: $FA $00 $D6
    ld   c, a                                     ; $4F49: $4F ; $4F49: $4F
    add  $06                                      ; $4F4A: $C6 $06 ; $4F4A: $C6 $06
    ld   [wDrawCommandsSize], a                   ; $4F4C: $EA $00 $D6 ; $4F4C: $EA $00 $D6
    ld   b, $00                                   ; $4F4F: $06 $00 ; $4F4F: $06 $00
    ld   hl, wDrawCommand                         ; $4F51: $21 $01 $D6 ; $4F51: $21 $01 $D6
    add  hl, bc                                   ; $4F54: $09 ; $4F54: $09
    ld   a, d                                     ; $4F55: $7A ; $4F55: $7A
    ld   [hl+], a                                 ; $4F56: $22 ; $4F56: $22
    ld   a, e                                     ; $4F57: $7B ; $4F57: $7B
    ld   [hl+], a                                 ; $4F58: $22 ; $4F58: $22
    ld   a, $02                                   ; $4F59: $3E $02 ; $4F59: $3E $02
    ld   [hl+], a                                 ; $4F5B: $22 ; $4F5B: $22
    pop  bc                                       ; $4F5C: $C1 ; $4F5C: $C1
    push hl                                       ; $4F5D: $E5 ; $4F5D: $E5
    ld   a, c                                     ; $4F5E: $79 ; $4F5E: $79
    and  $0F                                      ; $4F5F: $E6 $0F ; $4F5F: $E6 $0F
    ld   e, a                                     ; $4F61: $5F ; $4F61: $5F
    ld   d, $00                                   ; $4F62: $16 $00 ; $4F62: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F64: $21 $3B $4F ; $4F64: $21 $3B $4F
    add  hl, de                                   ; $4F67: $19 ; $4F67: $19
    ld   a, [hl]                                  ; $4F68: $7E ; $4F68: $7E
    pop  hl                                       ; $4F69: $E1 ; $4F69: $E1
    ld   [hl+], a                                 ; $4F6A: $22 ; $4F6A: $22
    push hl                                       ; $4F6B: $E5 ; $4F6B: $E5
    ld   a, b                                     ; $4F6C: $78 ; $4F6C: $78
    and  $F0                                      ; $4F6D: $E6 $F0 ; $4F6D: $E6 $F0
    swap a                                        ; $4F6F: $CB $37 ; $4F6F: $CB $37
    ld   e, a                                     ; $4F71: $5F ; $4F71: $5F
    ld   d, $00                                   ; $4F72: $16 $00 ; $4F72: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F74: $21 $3B $4F ; $4F74: $21 $3B $4F
    add  hl, de                                   ; $4F77: $19 ; $4F77: $19
    ld   a, [hl]                                  ; $4F78: $7E ; $4F78: $7E
    pop  hl                                       ; $4F79: $E1 ; $4F79: $E1
    ld   [hl+], a                                 ; $4F7A: $22 ; $4F7A: $22
    push hl                                       ; $4F7B: $E5 ; $4F7B: $E5
    ld   a, b                                     ; $4F7C: $78 ; $4F7C: $78
    and  $0F                                      ; $4F7D: $E6 $0F ; $4F7D: $E6 $0F
    ld   e, a                                     ; $4F7F: $5F ; $4F7F: $5F
    ld   d, $00                                   ; $4F80: $16 $00 ; $4F80: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F82: $21 $3B $4F ; $4F82: $21 $3B $4F
    add  hl, de                                   ; $4F85: $19 ; $4F85: $19
    ld   a, [hl]                                  ; $4F86: $7E ; $4F86: $7E
    pop  hl                                       ; $4F87: $E1 ; $4F87: $E1
    ld   [hl+], a                                 ; $4F88: $22 ; $4F88: $22
    xor  a                                        ; $4F89: $AF ; $4F89: $AF
    ld   [hl], a                                  ; $4F8A: $77 ; $4F8A: $77
    ret                                           ; $4F8B: $C9 ; $4F8B: $C9


; -----------------------------------------------------------------------------
;
; FILE COPY
; Screen for copying a saved file
;
; -----------------------------------------------------------------------------


FileCopyEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $4F8C: $FA $96 $DB ; $4F8C: $FA $96 $DB
    JP_TABLE                                      ; $4F8F: $C7
._00 dw FileDeletionState0Handler                 ; $4F90
._01 dw FileDeletionState1Handler                 ; $4F92
._02 dw FileCopyState2Handler                     ; $4F94
._03 dw FileCopyState3Handler                     ; $4F96
._04 dw FileCopyState4Handler                     ; $4F98
._05 dw FileCopyState5Handler                     ; $4F9A
._06 dw FileDeletionState8Handler                 ; $4F9C
._07 dw FileDeletionState9Handler                 ; $4F9E
._08 dw FileCopyState8Handler                     ; $4FA0
._09 dw FileCopyState9Handler                     ; $4FA2
._0A dw FileCopyStateAHandler                     ; $4FA4

FileCopyState2Handler::
    ld   a, TILESET_FILL_TILEMAP                  ; $4FA6: $3E $08 ; $4FA6: $3E $08
    ld   [wTilesetToLoad], a                      ; $4FA8: $EA $FE $D6 ; $4FA8: $EA $FE $D6
    xor  a                                        ; $4FAB: $AF ; $4FAB: $AF
    ld   [wSaveSlot], a                           ; $4FAC: $EA $A6 $DB ; $4FAC: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4FAF: $EA $00 $D0 ; $4FAF: $EA $00 $D0
    ld   [wIntroTimer], a                         ; $4FB2: $EA $01 $D0 ; $4FB2: $EA $01 $D0
    ld   [wIntroSubTimer], a                      ; $4FB5: $EA $02 $D0 ; $4FB5: $EA $02 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4FB8: $C3 $D6 $44 ; $4FB8: $C3 $D6 $44

FileCopyState3Handler::
    ld   a, TILEMAP_MENU_FILE_COPY                ; $4FBB: $3E $0C ; $4FBB: $3E $0C
    ld   [wBGMapToLoad], a                        ; $4FBD: $EA $FF $D6 ; $4FBD: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4FC0: $C3 $D6 $44 ; $4FC0: $C3 $D6 $44

FileCopyState4Handler::
    ld   bc, $98C4                                ; $4FC3: $01 $C4 $98 ; $4FC3: $01 $C4 $98
    ld   de, wSaveSlot1Name                       ; $4FC6: $11 $80 $DB ; $4FC6: $11 $80 $DB
    call DrawSaveSlotName                         ; $4FC9: $CD $52 $48 ; $4FC9: $CD $52 $48
    ld   bc, $9924                                ; $4FCC: $01 $24 $99 ; $4FCC: $01 $24 $99
    ld   de, wSaveSlot2Name                       ; $4FCF: $11 $85 $DB ; $4FCF: $11 $85 $DB
    call DrawSaveSlotName                         ; $4FD2: $CD $52 $48 ; $4FD2: $CD $52 $48
    ld   bc, $9984                                ; $4FD5: $01 $84 $99 ; $4FD5: $01 $84 $99
    ld   de, wSaveSlot3Name                       ; $4FD8: $11 $8A $DB ; $4FD8: $11 $8A $DB
    call DrawSaveSlotName                         ; $4FDB: $CD $52 $48 ; $4FDB: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FDE: $C3 $D6 $44 ; $4FDE: $C3 $D6 $44

FileCopyState5Handler::
    ld   bc, $98CD                                ; $4FE1: $01 $CD $98 ; $4FE1: $01 $CD $98
    ld   de, wSaveSlot1Name                       ; $4FE4: $11 $80 $DB ; $4FE4: $11 $80 $DB
    call DrawSaveSlotName                         ; $4FE7: $CD $52 $48 ; $4FE7: $CD $52 $48
    ld   bc, $992D                                ; $4FEA: $01 $2D $99 ; $4FEA: $01 $2D $99
    ld   de, wSaveSlot2Name                       ; $4FED: $11 $85 $DB ; $4FED: $11 $85 $DB
    call DrawSaveSlotName                         ; $4FF0: $CD $52 $48 ; $4FF0: $CD $52 $48
    ld   bc, $998D                                ; $4FF3: $01 $8D $99 ; $4FF3: $01 $8D $99
    ld   de, wSaveSlot3Name                       ; $4FF6: $11 $8A $DB ; $4FF6: $11 $8A $DB
    call DrawSaveSlotName                         ; $4FF9: $CD $52 $48 ; $4FF9: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FFC: $C3 $D6 $44 ; $4FFC: $C3 $D6 $44

FileCopyState8Handler::
    call MoveSelect                               ; $4FFF: $CD $A8 $6B ; $4FFF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $5002: $F0 $CC ; $5002: $F0 $CC
    and  J_DOWN                                   ; $5004: $E6 $08 ; $5004: $E6 $08
    jr   z, .jr_500E                              ; $5006: $28 $06 ; $5006: $28 $06

    ld   a, [wIntroTimer]                         ; $5008: $FA $01 $D0 ; $5008: $FA $01 $D0
    inc  a                                        ; $500B: $3C ; $500B: $3C
    jr   jr_001_5018                              ; $500C: $18 $0A ; $500C: $18 $0A

.jr_500E::
    ldh  a, [hJoypadState]                        ; $500E: $F0 $CC ; $500E: $F0 $CC
    and  J_UP                                     ; $5010: $E6 $04 ; $5010: $E6 $04
    jr   z, jr_001_501D                           ; $5012: $28 $09 ; $5012: $28 $09

    ld   a, [wIntroTimer]                         ; $5014: $FA $01 $D0 ; $5014: $FA $01 $D0
    dec  a                                        ; $5017: $3D ; $5017: $3D

jr_001_5018::
    and  $03                                      ; $5018: $E6 $03 ; $5018: $E6 $03
    ld   [wIntroTimer], a                         ; $501A: $EA $01 $D0 ; $501A: $EA $01 $D0

jr_001_501D::
    ldh  a, [hJoypadState]                        ; $501D: $F0 $CC ; $501D: $F0 $CC
    and  J_A | J_START                            ; $501F: $E6 $90 ; $501F: $E6 $90
    jr   z, jr_001_5055                           ; $5021: $28 $32 ; $5021: $28 $32

    ld   a, [wIntroTimer]                         ; $5023: $FA $01 $D0 ; $5023: $FA $01 $D0
    cp   $03                                      ; $5026: $FE $03 ; $5026: $FE $03
    jp   z, label_001_4555                        ; $5028: $CA $55 $45 ; $5028: $CA $55 $45

    ld   hl, wSaveSlot1Name                       ; $502B: $21 $80 $DB ; $502B: $21 $80 $DB
    ld   b, $00                                   ; $502E: $06 $00 ; $502E: $06 $00
    ld   a, [wIntroTimer]                         ; $5030: $FA $01 $D0 ; $5030: $FA $01 $D0
    and  a                                        ; $5033: $A7 ; $5033: $A7
    jr   z, jr_001_5042                           ; $5034: $28 $0C ; $5034: $28 $0C

    cp   $01                                      ; $5036: $FE $01 ; $5036: $FE $01
    jr   z, .jr_503F                              ; $5038: $28 $05 ; $5038: $28 $05

    ld   hl, wSaveSlot3Name                       ; $503A: $21 $8A $DB ; $503A: $21 $8A $DB
    jr   jr_001_5042                              ; $503D: $18 $03 ; $503D: $18 $03

.jr_503F::
    ld   hl, wSaveSlot2Name                       ; $503F: $21 $85 $DB ; $503F: $21 $85 $DB

jr_001_5042::
    xor  a                                        ; $5042: $AF ; $5042: $AF
IF __PATCH_4__
    ; This patch changes ADD to OR, presumably just for clarity
    ; (the two opcodes use the same number of cycles, and differ
    ; only in that ADD sets the H and C flags, but those aren't
    ; used after this point anyway)
    or   [hl]
    inc  hl
    or   [hl]
    inc  hl
    or   [hl]
    inc  hl
    or   [hl]
    inc  hl
    or   [hl]
ELSE
    add  [hl]                                     ; $5043: $86 ; $5043: $86
    inc  hl                                       ; $5044: $23 ; $5044: $23
    add  [hl]                                     ; $5045: $86 ; $5045: $86
    inc  hl                                       ; $5046: $23 ; $5046: $23
    add  [hl]                                     ; $5047: $86 ; $5047: $86
    inc  hl                                       ; $5048: $23 ; $5048: $23
    add  [hl]                                     ; $5049: $86 ; $5049: $86
    inc  hl                                       ; $504A: $23 ; $504A: $23
    add  [hl]                                     ; $504B: $86 ; $504B: $86
ENDC
    and  a                                        ; $504C: $A7 ; $504C: $A7
    jr   z, jr_001_5055                           ; $504D: $28 $06 ; $504D: $28 $06

    call IncrementGameplaySubtype                 ; $504F: $CD $D6 $44 ; $504F: $CD $D6 $44
    call PlayValidationJingleAndReturn            ; $5052: $CD $BE $49 ; $5052: $CD $BE $49

jr_001_5055::
    ld   a, [wIntroTimer]                         ; $5055: $FA $01 $D0 ; $5055: $FA $01 $D0
    ld   e, a                                     ; $5058: $5F ; $5058: $5F
    ld   d, $00                                   ; $5059: $16 $00 ; $5059: $16 $00
    ld   hl, Data_001_48E4                        ; $505B: $21 $E4 $48 ; $505B: $21 $E4 $48
    add  hl, de                                   ; $505E: $19 ; $505E: $19
    ldh  a, [hFrameCounter]                       ; $505F: $F0 $E7 ; $505F: $F0 $E7
    and  $08                                      ; $5061: $E6 $08 ; $5061: $E6 $08
    ld   a, [hl]                                  ; $5063: $7E ; $5063: $7E
    ld   hl, wOAMBuffer                           ; $5064: $21 $00 $C0 ; $5064: $21 $00 $C0

label_001_5067::
    jr   z, .jr_507D                              ; $5067: $28 $14 ; $5067: $28 $14

    push af                                       ; $5069: $F5 ; $5069: $F5
    ld   [hl+], a                                 ; $506A: $22 ; $506A: $22
    ld   a, $10                                   ; $506B: $3E $10 ; $506B: $3E $10
    ld   [hl+], a                                 ; $506D: $22 ; $506D: $22
    xor  a                                        ; $506E: $AF ; $506E: $AF
    ld   [hl+], a                                 ; $506F: $22 ; $506F: $22
    ld   [hl+], a                                 ; $5070: $22 ; $5070: $22
    pop  af                                       ; $5071: $F1 ; $5071: $F1
    ld   [hl+], a                                 ; $5072: $22 ; $5072: $22
    ld   a, $18                                   ; $5073: $3E $18 ; $5073: $3E $18
    ld   [hl+], a                                 ; $5075: $22 ; $5075: $22
    ld   a, $02                                   ; $5076: $3E $02 ; $5076: $3E $02
    ld   [hl+], a                                 ; $5078: $22 ; $5078: $22
    ld   a, $00                                   ; $5079: $3E $00 ; $5079: $3E $00
    ld   [hl], a                                  ; $507B: $77 ; $507B: $77
    ret                                           ; $507C: $C9 ; $507C: $C9

.jr_507D::
    push af                                       ; $507D: $F5 ; $507D: $F5
    ld   [hl+], a                                 ; $507E: $22 ; $507E: $22
    ld   a, $10                                   ; $507F: $3E $10 ; $507F: $3E $10
    ld   [hl+], a                                 ; $5081: $22 ; $5081: $22
    ld   a, $02                                   ; $5082: $3E $02 ; $5082: $3E $02
    ld   [hl+], a                                 ; $5084: $22 ; $5084: $22
    ld   a, $20                                   ; $5085: $3E $20 ; $5085: $3E $20
    ld   [hl+], a                                 ; $5087: $22 ; $5087: $22
    pop  af                                       ; $5088: $F1 ; $5088: $F1
    ld   [hl+], a                                 ; $5089: $22 ; $5089: $22
    ld   a, $18                                   ; $508A: $3E $18 ; $508A: $3E $18
    ld   [hl+], a                                 ; $508C: $22 ; $508C: $22
    ld   a, $00                                   ; $508D: $3E $00 ; $508D: $3E $00
    ld   [hl+], a                                 ; $508F: $22 ; $508F: $22
    ld   a, $20                                   ; $5090: $3E $20 ; $5090: $3E $20
    ld   [hl], a                                  ; $5092: $77 ; $5092: $77
    ret                                           ; $5093: $C9 ; $5093: $C9

func_001_5094::
    ld   a, [wIntroTimer]                         ; $5094: $FA $01 $D0 ; $5094: $FA $01 $D0
    ld   e, a                                     ; $5097: $5F ; $5097: $5F
    ld   d, $00                                   ; $5098: $16 $00 ; $5098: $16 $00
    ld   hl, Data_001_48E4                        ; $509A: $21 $E4 $48 ; $509A: $21 $E4 $48
    add  hl, de                                   ; $509D: $19 ; $509D: $19
    ld   a, [hl]                                  ; $509E: $7E ; $509E: $7E
    ld   hl, wOAMBuffer                           ; $509F: $21 $00 $C0 ; $509F: $21 $00 $C0
    add  $05                                      ; $50A2: $C6 $05 ; $50A2: $C6 $05
    ld   [hl+], a                                 ; $50A4: $22 ; $50A4: $22
    ld   a, $14                                   ; $50A5: $3E $14 ; $50A5: $3E $14
    ld   [hl+], a                                 ; $50A7: $22 ; $50A7: $22
    ld   a, $BE                                   ; $50A8: $3E $BE ; $50A8: $3E $BE
    ld   [hl+], a                                 ; $50AA: $22 ; $50AA: $22
    ld   a, $00                                   ; $50AB: $3E $00 ; $50AB: $3E $00
    ld   [hl], a                                  ; $50AD: $77 ; $50AD: $77
    ret                                           ; $50AE: $C9 ; $50AE: $C9

Data_001_50AF::
    db   $98, $A4, $44, $7E, $98, $C4, $44, $7E   ; $50AF ; $50AF
    db   $99, $04, $44, $7E, $99, $24, $44, $7E   ; $50B7 ; $50B7
    db   $99, $64, $44, $7E, $99, $84, $44, $7E   ; $50BF ; $50BF

Data_001_50C7::
    db   $98, $AD, $44, $7E, $98, $CD, $44, $7E   ; $50C7 ; $50C7
    db   $99, $0D, $44, $7E, $99, $2D, $44, $7E   ; $50CF ; $50CF
    db   $99, $6D, $44, $7E, $99, $8D, $44, $7E   ; $50D7 ; $50D7

FileCopyState9Handler::
    call MoveSelect                               ; $50DF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $50E2: $F0 $CC ; $50E2: $F0 $CC
    and  J_DOWN                                   ; $50E4: $E6 $08 ; $50E4: $E6 $08
    jr   z, .jr_50F1                              ; $50E6: $28 $09 ; $50E6: $28 $09

    ld   a, [wIntroSubTimer]                      ; $50E8: $FA $02 $D0 ; $50E8: $FA $02 $D0
    inc  a                                        ; $50EB: $3C ; $50EB: $3C
    and  $03                                      ; $50EC: $E6 $03 ; $50EC: $E6 $03
    ld   [wIntroSubTimer], a                      ; $50EE: $EA $02 $D0 ; $50EE: $EA $02 $D0

.jr_50F1::
    ldh  a, [hJoypadState]                        ; $50F1: $F0 $CC ; $50F1: $F0 $CC
    and  $04                                      ; $50F3: $E6 $04 ; $50F3: $E6 $04
    jr   z, jr_001_5104                           ; $50F5: $28 $0D ; $50F5: $28 $0D

    ld   a, [wIntroSubTimer]                      ; $50F7: $FA $02 $D0 ; $50F7: $FA $02 $D0
    dec  a                                        ; $50FA: $3D ; $50FA: $3D
    cp   $FF                                      ; $50FB: $FE $FF ; $50FB: $FE $FF
    jr   nz, .jr_5101                             ; $50FD: $20 $02 ; $50FD: $20 $02

    ld   a, $03                                   ; $50FF: $3E $03 ; $50FF: $3E $03

.jr_5101::
    ld   [wIntroSubTimer], a                      ; $5101: $EA $02 $D0 ; $5101: $EA $02 $D0

jr_001_5104::
    call func_001_5094                            ; $5104: $CD $94 $50 ; $5104: $CD $94 $50
    ldh  a, [hJoypadState]                        ; $5107: $F0 $CC ; $5107: $F0 $CC
    bit  J_BIT_B, a                               ; $5109: $CB $6F ; $5109: $CB $6F
    jr   z, .jr_5114                              ; $510B: $28 $07 ; $510B: $28 $07

    ld   hl, wGameplaySubtype                     ; $510D: $21 $96 $DB ; $510D: $21 $96 $DB
    dec  [hl]                                     ; $5110: $35 ; $5110: $35
    jp   label_001_514F                           ; $5111: $C3 $4F $51 ; $5111: $C3 $4F $51

.jr_5114::
    and  $90                                      ; $5114: $E6 $90 ; $5114: $E6 $90
    jr   z, .jr_5129                              ; $5116: $28 $11 ; $5116: $28 $11

    ld   a, [wIntroSubTimer]                      ; $5118: $FA $02 $D0 ; $5118: $FA $02 $D0
    cp   $03                                      ; $511B: $FE $03 ; $511B: $FE $03
    jp   z, label_001_4555                        ; $511D: $CA $55 $45 ; $511D: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $5120: $CD $BE $49 ; $5120: $CD $BE $49
    call IncrementGameplaySubtype                 ; $5123: $CD $D6 $44 ; $5123: $CD $D6 $44
    jp   CopyQuitOkTilemap                        ; $5126: $C3 $55 $4E ; $5126: $C3 $55 $4E

.jr_5129::
    call func_001_5175                            ; $5129: $CD $75 $51 ; $5129: $CD $75 $51

func_001_512C::
    ldh  a, [hFrameCounter]                       ; $512C: $F0 $E7 ; $512C: $F0 $E7
    and  $10                                      ; $512E: $E6 $10 ; $512E: $E6 $10
    jr   z, label_001_514F                        ; $5130: $28 $1D ; $5130: $28 $1D

    ld   a, [wIntroTimer]                         ; $5132: $FA $01 $D0 ; $5132: $FA $01 $D0
    rla                                           ; $5135: $17 ; $5135: $17
    rla                                           ; $5136: $17 ; $5136: $17
    rla                                           ; $5137: $17 ; $5137: $17
    and  $F8                                      ; $5138: $E6 $F8 ; $5138: $E6 $F8
    ld   e, a                                     ; $513A: $5F ; $513A: $5F
    ld   d, $00                                   ; $513B: $16 $00 ; $513B: $16 $00
    ld   hl, Data_001_50AF                        ; $513D: $21 $AF $50 ; $513D: $21 $AF $50
    add  hl, de                                   ; $5140: $19 ; $5140: $19
    ld   de, wDrawCommand                         ; $5141: $11 $01 $D6 ; $5141: $11 $01 $D6
    ld   c, $08                                   ; $5144: $0E $08 ; $5144: $0E $08

.loop_5146
    ld   a, [hl+]                                 ; $5146: $2A ; $5146: $2A
    ld   [de], a                                  ; $5147: $12 ; $5147: $12
    inc  de                                       ; $5148: $13 ; $5148: $13
    dec  c                                        ; $5149: $0D ; $5149: $0D
    jr   nz, .loop_5146                           ; $514A: $20 $FA ; $514A: $20 $FA

    xor  a                                        ; $514C: $AF ; $514C: $AF
    ld   [de], a                                  ; $514D: $12 ; $514D: $12
    ret                                           ; $514E: $C9 ; $514E: $C9

label_001_514F::
    ld   a, [wIntroTimer]                         ; $514F: $FA $01 $D0 ; $514F: $FA $01 $D0
    cp   $01                                      ; $5152: $FE $01 ; $5152: $FE $01
    jr   z, .jr_5163                              ; $5154: $28 $0D ; $5154: $28 $0D

    cp   $02                                      ; $5156: $FE $02 ; $5156: $FE $02
    jr   z, jr_001_516C                           ; $5158: $28 $12 ; $5158: $28 $12

    ld   bc, $98C4                                ; $515A: $01 $C4 $98 ; $515A: $01 $C4 $98
    ld   de, wSaveSlot1Name                       ; $515D: $11 $80 $DB ; $515D: $11 $80 $DB
    jp   DrawSaveSlotName                         ; $5160: $C3 $52 $48 ; $5160: $C3 $52 $48

.jr_5163::
    ld   bc, $9924                                ; $5163: $01 $24 $99 ; $5163: $01 $24 $99
    ld   de, wSaveSlot2Name                       ; $5166: $11 $85 $DB ; $5166: $11 $85 $DB
    jp   DrawSaveSlotName                         ; $5169: $C3 $52 $48 ; $5169: $C3 $52 $48

jr_001_516C::
    ld   bc, $9984                                ; $516C: $01 $84 $99 ; $516C: $01 $84 $99
    ld   de, wSaveSlot3Name                       ; $516F: $11 $8A $DB ; $516F: $11 $8A $DB
    jp   DrawSaveSlotName                         ; $5172: $C3 $52 $48 ; $5172: $C3 $52 $48

func_001_5175::
    ld   a, [wIntroSubTimer]                      ; $5175: $FA $02 $D0 ; $5175: $FA $02 $D0
    ld   e, a                                     ; $5178: $5F ; $5178: $5F
    ld   d, $00                                   ; $5179: $16 $00 ; $5179: $16 $00
    ld   hl, Data_001_48E4                        ; $517B: $21 $E4 $48 ; $517B: $21 $E4 $48
    add  hl, de                                   ; $517E: $19 ; $517E: $19
    ld   a, [wIntroSubTimer]                      ; $517F: $FA $02 $D0 ; $517F: $FA $02 $D0
    cp   $03                                      ; $5182: $FE $03 ; $5182: $FE $03
    jp   z, label_001_51C3                        ; $5184: $CA $C3 $51 ; $5184: $CA $C3 $51

    ldh  a, [hFrameCounter]                       ; $5187: $F0 $E7 ; $5187: $F0 $E7
    and  $08                                      ; $5189: $E6 $08 ; $5189: $E6 $08
    jr   z, .jr_51A8                              ; $518B: $28 $1B ; $518B: $28 $1B

    ld   a, [hl]                                  ; $518D: $7E ; $518D: $7E
    ld   hl, wOAMBuffer+8                         ; $518E: $21 $08 $C0 ; $518E: $21 $08 $C0
    push af                                       ; $5191: $F5 ; $5191: $F5
    ld   [hl+], a                                 ; $5192: $22 ; $5192: $22
    ld   a, $58                                   ; $5193: $3E $58 ; $5193: $3E $58
    ld   [hl+], a                                 ; $5195: $22 ; $5195: $22
    ld   a, $00                                   ; $5196: $3E $00 ; $5196: $3E $00
    ld   [hl+], a                                 ; $5198: $22 ; $5198: $22
    ld   a, $00                                   ; $5199: $3E $00 ; $5199: $3E $00
    ld   [hl+], a                                 ; $519B: $22 ; $519B: $22
    pop  af                                       ; $519C: $F1 ; $519C: $F1
    ld   [hl+], a                                 ; $519D: $22 ; $519D: $22
    ld   a, $60                                   ; $519E: $3E $60 ; $519E: $3E $60
    ld   [hl+], a                                 ; $51A0: $22 ; $51A0: $22
    ld   a, $02                                   ; $51A1: $3E $02 ; $51A1: $3E $02
    ld   [hl+], a                                 ; $51A3: $22 ; $51A3: $22
    ld   a, $00                                   ; $51A4: $3E $00 ; $51A4: $3E $00
    ld   [hl], a                                  ; $51A6: $77 ; $51A6: $77
    ret                                           ; $51A7: $C9 ; $51A7: $C9

.jr_51A8::
    ld   a, [hl]                                  ; $51A8: $7E ; $51A8: $7E
    ld   hl, wOAMBuffer+8                         ; $51A9: $21 $08 $C0 ; $51A9: $21 $08 $C0
    push af                                       ; $51AC: $F5 ; $51AC: $F5
    ld   [hl+], a                                 ; $51AD: $22 ; $51AD: $22
    ld   a, $58                                   ; $51AE: $3E $58 ; $51AE: $3E $58
    ld   [hl+], a                                 ; $51B0: $22 ; $51B0: $22
    ld   a, $02                                   ; $51B1: $3E $02 ; $51B1: $3E $02
    ld   [hl+], a                                 ; $51B3: $22 ; $51B3: $22
    ld   a, $20                                   ; $51B4: $3E $20 ; $51B4: $3E $20
    ld   [hl+], a                                 ; $51B6: $22 ; $51B6: $22
    pop  af                                       ; $51B7: $F1 ; $51B7: $F1
    ld   [hl+], a                                 ; $51B8: $22 ; $51B8: $22
    ld   a, $60                                   ; $51B9: $3E $60 ; $51B9: $3E $60
    ld   [hl+], a                                 ; $51BB: $22 ; $51BB: $22
    ld   a, $00                                   ; $51BC: $3E $00 ; $51BC: $3E $00
    ld   [hl+], a                                 ; $51BE: $22 ; $51BE: $22
    ld   a, $20                                   ; $51BF: $3E $20 ; $51BF: $3E $20
    ld   [hl], a                                  ; $51C1: $77 ; $51C1: $77
    ret                                           ; $51C2: $C9 ; $51C2: $C9

label_001_51C3::
    ldh  a, [hFrameCounter]                       ; $51C3: $F0 $E7 ; $51C3: $F0 $E7
    and  $08                                      ; $51C5: $E6 $08 ; $51C5: $E6 $08
    ld   a, [hl]                                  ; $51C7: $7E ; $51C7: $7E
    ld   hl, wOAMBuffer+8                         ; $51C8: $21 $08 $C0 ; $51C8: $21 $08 $C0
    jp   label_001_5067                           ; $51CB: $C3 $67 $50 ; $51CB: $C3 $67 $50

func_001_51CE::
    ld   a, [wIntroSubTimer]                      ; $51CE: $FA $02 $D0 ; $51CE: $FA $02 $D0
    ld   e, a                                     ; $51D1: $5F ; $51D1: $5F
    ld   d, $00                                   ; $51D2: $16 $00 ; $51D2: $16 $00
    ld   hl, Data_001_48E4                        ; $51D4: $21 $E4 $48 ; $51D4: $21 $E4 $48
    add  hl, de                                   ; $51D7: $19 ; $51D7: $19
    ld   a, [hl]                                  ; $51D8: $7E ; $51D8: $7E
    ld   hl, wOAMBuffer+8                         ; $51D9: $21 $08 $C0 ; $51D9: $21 $08 $C0
    add  $05                                      ; $51DC: $C6 $05 ; $51DC: $C6 $05
    ld   [hl+], a                                 ; $51DE: $22 ; $51DE: $22
    ld   a, $5C                                   ; $51DF: $3E $5C ; $51DF: $3E $5C
    ld   [hl+], a                                 ; $51E1: $22 ; $51E1: $22
    ld   a, $BE                                   ; $51E2: $3E $BE ; $51E2: $3E $BE
    ld   [hl+], a                                 ; $51E4: $22 ; $51E4: $22
    ld   a, $00                                   ; $51E5: $3E $00 ; $51E5: $3E $00
    ld   [hl], a                                  ; $51E7: $77 ; $51E7: $77
    ret                                           ; $51E8: $C9 ; $51E8: $C9

FileCopyStateAHandler::
    call func_001_5094                            ; $51E9: $CD $94 $50 ; $51E9: $CD $94 $50
    call func_001_51CE                            ; $51EC: $CD $CE $51 ; $51EC: $CD $CE $51
    call func_001_4F0C                            ; $51EF: $CD $0C $4F ; $51EF: $CD $0C $4F
    ldh  a, [hJoypadState]                        ; $51F2: $F0 $CC ; $51F2: $F0 $CC
    and  J_A | J_START                            ; $51F4: $E6 $90 ; $51F4: $E6 $90
    jr   z, jr_001_5235                           ; $51F6: $28 $3D ; $51F6: $28 $3D

    ld   a, [wCreditsScratch0]                    ; $51F8: $FA $00 $D0 ; $51F8: $FA $00 $D0
    and  a                                        ; $51FB: $A7 ; $51FB: $A7
    jp   z, label_001_4555                        ; $51FC: $CA $55 $45 ; $51FC: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $51FF: $CD $BE $49 ; $51FF: $CD $BE $49
    ld   a, [wIntroTimer]                         ; $5202: $FA $01 $D0 ; $5202: $FA $01 $D0
    sla  a                                        ; $5205: $CB $27 ; $5205: $CB $27
    ld   e, a                                     ; $5207: $5F ; $5207: $5F
    ld   d, $00                                   ; $5208: $16 $00 ; $5208: $16 $00
    ld   hl, Data_001_49FE                        ; $520A: $21 $FE $49 ; $520A: $21 $FE $49
    add  hl, de                                   ; $520D: $19 ; $520D: $19
    ld   c, [hl]                                  ; $520E: $4E ; $520E: $4E
    inc  hl                                       ; $520F: $23 ; $520F: $23
    ld   b, [hl]                                  ; $5210: $46 ; $5210: $46
    ld   a, [wIntroSubTimer]                      ; $5211: $FA $02 $D0 ; $5211: $FA $02 $D0
    sla  a                                        ; $5214: $CB $27 ; $5214: $CB $27
    ld   e, a                                     ; $5216: $5F ; $5216: $5F
    ld   d, $00                                   ; $5217: $16 $00 ; $5217: $16 $00
    ld   hl, Data_001_49FE                        ; $5219: $21 $FE $49 ; $5219: $21 $FE $49
    add  hl, de                                   ; $521C: $19 ; $521C: $19
    ld   a, [hl]                                  ; $521D: $7E ; $521D: $7E
    inc  hl                                       ; $521E: $23 ; $521E: $23
    ld   h, [hl]                                  ; $521F: $66 ; $521F: $66
    ld   l, a                                     ; $5220: $6F ; $5220: $6F

    ; sizeof save data
    ld   de, (SaveGame2 - SaveGame1)              ; $5221: $11 $AD $03 ; $5221: $11 $AD $03

.loop_5224
    call EnableSRAM                               ; $5224: $CD $D0 $27 ; $5224: $CD $D0 $27
    ld   a, [bc]                                  ; $5227: $0A ; $5227: $0A
    inc  bc                                       ; $5228: $03 ; $5228: $03
    call EnableSRAM                               ; $5229: $CD $D0 $27 ; $5229: $CD $D0 $27
    ld   [hl+], a                                 ; $522C: $22 ; $522C: $22
    dec  de                                       ; $522D: $1B ; $522D: $1B
    ld   a, e                                     ; $522E: $7B ; $522E: $7B
    or   d                                        ; $522F: $B2 ; $522F: $B2
    jr   nz, .loop_5224                           ; $5230: $20 $F2 ; $5230: $20 $F2

    jp   label_001_4555                           ; $5232: $C3 $55 $45 ; $5232: $C3 $55 $45

jr_001_5235::
    ldh  a, [hJoypadState]                        ; $5235: $F0 $CC ; $5235: $F0 $CC
    bit  J_BIT_B, a                               ; $5237: $CB $6F ; $5237: $CB $6F
    jr   z, .jr_5249                              ; $5239: $28 $0E ; $5239: $28 $0E

    ld   hl, wGameplaySubtype                     ; $523B: $21 $96 $DB ; $523B: $21 $96 $DB
    dec  [hl]                                     ; $523E: $35 ; $523E: $35
    xor  a                                        ; $523F: $AF ; $523F: $AF
    ld   [wCreditsScratch0], a                    ; $5240: $EA $00 $D0 ; $5240: $EA $00 $D0
    call CopyReturnToMenuTilemap                  ; $5243: $CD $BB $4E ; $5243: $CD $BB $4E
    jp   label_001_526F                           ; $5246: $C3 $6F $52 ; $5246: $C3 $6F $52

.jr_5249::
    call func_001_512C                            ; $5249: $CD $2C $51 ; $5249: $CD $2C $51
    ldh  a, [hFrameCounter]                       ; $524C: $F0 $E7 ; $524C: $F0 $E7
    and  $10                                      ; $524E: $E6 $10 ; $524E: $E6 $10
    jr   z, label_001_526F                        ; $5250: $28 $1D ; $5250: $28 $1D

    ld   a, [wIntroSubTimer]                      ; $5252: $FA $02 $D0 ; $5252: $FA $02 $D0
    rla                                           ; $5255: $17 ; $5255: $17
    rla                                           ; $5256: $17 ; $5256: $17
    rla                                           ; $5257: $17 ; $5257: $17
    and  $F8                                      ; $5258: $E6 $F8 ; $5258: $E6 $F8
    ld   e, a                                     ; $525A: $5F ; $525A: $5F
    ld   d, $00                                   ; $525B: $16 $00 ; $525B: $16 $00
    ld   hl, Data_001_50C7                        ; $525D: $21 $C7 $50 ; $525D: $21 $C7 $50
    add  hl, de                                   ; $5260: $19 ; $5260: $19
    ld   de, wDrawCommand.data + 5                ; $5261: $11 $09 $D6 ; $5261: $11 $09 $D6
    ld   c, $08                                   ; $5264: $0E $08 ; $5264: $0E $08

.loop_5266
    ld   a, [hl+]                                 ; $5266: $2A ; $5266: $2A
    ld   [de], a                                  ; $5267: $12 ; $5267: $12
    inc  de                                       ; $5268: $13 ; $5268: $13
    dec  c                                        ; $5269: $0D ; $5269: $0D
    jr   nz, .loop_5266                           ; $526A: $20 $FA ; $526A: $20 $FA

    xor  a                                        ; $526C: $AF ; $526C: $AF
    ld   [de], a                                  ; $526D: $12 ; $526D: $12
    ret                                           ; $526E: $C9 ; $526E: $C9

label_001_526F::
    ld   a, [wIntroSubTimer]                      ; $526F: $FA $02 $D0 ; $526F: $FA $02 $D0
    cp   $01                                      ; $5272: $FE $01 ; $5272: $FE $01
    jr   z, .jr_5283                              ; $5274: $28 $0D ; $5274: $28 $0D

    cp   $02                                      ; $5276: $FE $02 ; $5276: $FE $02
    jr   z, jr_001_528C                           ; $5278: $28 $12 ; $5278: $28 $12

    ld   bc, $98CD                                ; $527A: $01 $CD $98 ; $527A: $01 $CD $98
    ld   de, wSaveSlot1Name                       ; $527D: $11 $80 $DB ; $527D: $11 $80 $DB
    jp   DrawSaveSlotName                         ; $5280: $C3 $52 $48 ; $5280: $C3 $52 $48

.jr_5283::
    ld   bc, $992D                                ; $5283: $01 $2D $99 ; $5283: $01 $2D $99
    ld   de, wSaveSlot2Name                       ; $5286: $11 $85 $DB ; $5286: $11 $85 $DB
    jp   DrawSaveSlotName                         ; $5289: $C3 $52 $48 ; $5289: $C3 $52 $48

jr_001_528C::
    ld   bc, $998D                                ; $528C: $01 $8D $99 ; $528C: $01 $8D $99
    ld   de, wSaveSlot3Name                       ; $528F: $11 $8A $DB ; $528F: $11 $8A $DB
    jp   DrawSaveSlotName                         ; $5292: $C3 $52 $48 ; $5292: $C3 $52 $48
