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
    call func_5DC0                                ;; 01:47CE $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ;; 01:47D1 $FA $96 $DB
    JP_TABLE                                      ;; 01:47D4 $C7
._00 dw FileSelectionPrepare0                     ;; 01:47D5
._01 dw FileSelectionPrepare1                     ;; 01:47D7
._02 dw FileSelectionPrepare2                     ;; 01:47D9
._03 dw FileSelectionPrepare3                     ;; 01:47DB
._04 dw CopyDeathCountsToBG                       ;; 01:47DD
._05 dw FileSelectionPrepare5                     ;; 01:47DF
._06 dw FileSelectionPrepare6                     ;; 01:47E1
._07 dw FileSelectionInteractiveHandler           ;; 01:47E3
._08 dw FileSelectionExecuteChoice                ;; 01:47E5
._09 dw FileSelectionLoadSavedFile                ;; 01:47E7

FileSelectionPrepare0::
    ld   a, TILESET_MENU                          ;; 01:47E9 $3E $04
    ld   [wTilesetToLoad], a                      ;; 01:47EB $EA $FE $D6

    xor  a                                        ;; 01:47EE $AF
    ld   [wIsFileSelectionArrowShifted], a        ;; 01:47EF $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:47F2 $C3 $D6 $44

FileSelectionPrepare1::
    ld   a, TILESET_FILL_TILEMAP                  ;; 01:47F5 $3E $08
    ld   [wTilesetToLoad], a                      ;; 01:47F7 $EA $FE $D6
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:47FA $C3 $D6 $44

FileSelectionPrepare2::
    call DrawSaveSlot1MaxHearts                   ;; 01:47FD $CD $A6 $4D
    call DrawSaveSlot2MaxHearts                   ;; 01:4800 $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4803 $C3 $D6 $44

FileSelectionPrepare3::
    call DrawSaveSlot3MaxHearts                   ;; 01:4806 $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4809 $C3 $D6 $44

CopyDeathCountsToBG::
    ld   a, [wSaveFilesCount]                     ;; 01:480C $FA $A7 $DB
    and  $01                                      ;; 01:480F $E6 $01
    jr   z, .file2                                ;; 01:4811 $28 $0E

    ld   a, [wFile1DeathCountHigh]                ;; 01:4813 $FA $00 $DC
    ld   h, a                                     ;; 01:4816 $67
    ld   a, [wFile1DeathCountLow]                 ;; 01:4817 $FA $01 $DC
    ld   l, a                                     ;; 01:481A $6F
    ld   de, vBGMap0 + $0E7                       ;; 01:481B $11 $E7 $98
    call CopyDigitsToFileScreenBG                 ;; 01:481E $CD $45 $4F

.file2
    ld   a, [wSaveFilesCount]                     ;; 01:4821 $FA $A7 $DB
    and  $02                                      ;; 01:4824 $E6 $02
    jr   z, .file3                                ;; 01:4826 $28 $0E

    ld   a, [wFile2DeathCountHigh]                ;; 01:4828 $FA $02 $DC
    ld   h, a                                     ;; 01:482B $67
    ld   a, [wFile2DeathCountLow]                 ;; 01:482C $FA $03 $DC
    ld   l, a                                     ;; 01:482F $6F
    ld   de, vBGMap0 + $147                       ;; 01:4830 $11 $47 $99
    call CopyDigitsToFileScreenBG                 ;; 01:4833 $CD $45 $4F

.file3
    ld   a, [wSaveFilesCount]                     ;; 01:4836 $FA $A7 $DB
    and  $04                                      ;; 01:4839 $E6 $04
    jr   z, .return                               ;; 01:483B $28 $0E

    ld   a, [wFile3DeathCountHigh]                ;; 01:483D $FA $04 $DC
    ld   h, a                                     ;; 01:4840 $67
    ld   a, [wFile3DeathCountLow]                 ;; 01:4841 $FA $05 $DC
    ld   l, a                                     ;; 01:4844 $6F
    ld   de, vBGMap0 + $1A7                       ;; 01:4845 $11 $A7 $99
    call CopyDigitsToFileScreenBG                 ;; 01:4848 $CD $45 $4F

.return
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:484B $C3 $D6 $44
    ; Unused
    ret                                           ;; 01:484E $C9

FileSelectionPrepare5::
    jp   FileDeletionState4Handler                ;; 01:484F $C3 $6D $4D

DrawSaveSlotName::
    push de                                       ;; 01:4852 $D5
    ld   a, [wDrawCommandsSize]                   ;; 01:4853 $FA $00 $D6
    ld   e, a                                     ;; 01:4856 $5F
    ld   d, $00                                   ;; 01:4857 $16 $00
    ld   hl, wDrawCommand                         ;; 01:4859 $21 $01 $D6
    add  hl, de                                   ;; 01:485C $19
    add  a, $10                                   ;; 01:485D $C6 $10
    ld   [wDrawCommandsSize], a                   ;; 01:485F $EA $00 $D6
    ld   a, b                                     ;; 01:4862 $78
    ldi  [hl], a                                  ;; 01:4863 $22
    ld   a, c                                     ;; 01:4864 $79
    ldi  [hl], a                                  ;; 01:4865 $22
    ld   a, $04                                   ;; 01:4866 $3E $04
    ldi  [hl], a                                  ;; 01:4868 $22
    pop  de                                       ;; 01:4869 $D1
    push de                                       ;; 01:486A $D5
    ld   a, $05                                   ;; 01:486B $3E $05

.drawCharacterRowLoop
    ldh  [hMultiPurpose0], a                      ;; 01:486D $E0 $D7
    ld   a, [de]                                  ;; 01:486F $1A
    and  a                                        ;; 01:4870 $A7
    ld   a, DIALOG_BG_TILE_DARK                   ;; 01:4871 $3E $7E
    jr   z, .drawCharacterTile                    ;; 01:4873 $28 $0C
    ld   a, [de]                                  ;; 01:4875 $1A
    dec  a                                        ;; 01:4876 $3D
    push bc                                       ;; 01:4877 $C5
    push hl                                       ;; 01:4878 $E5
    ld   c, a                                     ;; 01:4879 $4F
    ld   b, $00                                   ;; 01:487A $06 $00
    call ReadTileValueFromAsciiTable              ;; 01:487C $CD $25 $0C
    pop  hl                                       ;; 01:487F $E1
    pop  bc                                       ;; 01:4880 $C1

.drawCharacterTile
    ldi  [hl], a                                  ;; 01:4881 $22
    inc  de                                       ;; 01:4882 $13
    ldh  a, [hMultiPurpose0]                      ;; 01:4883 $F0 $D7
    dec  a                                        ;; 01:4885 $3D
    jr   nz, .drawCharacterRowLoop                ;; 01:4886 $20 $E5
    ld   a, b                                     ;; 01:4888 $78
    ldi  [hl], a                                  ;; 01:4889 $22
    ld   a, c                                     ;; 01:488A $79
    sub  a, $20                                   ;; 01:488B $D6 $20
    ldi  [hl], a                                  ;; 01:488D $22
    ld   a, $04                                   ;; 01:488E $3E $04
    ldi  [hl], a                                  ;; 01:4890 $22
    pop  de                                       ;; 01:4891 $D1
    ld   a, $05                                   ;; 01:4892 $3E $05

.drawSpacingRowLoop
    ; Draw the empty row above the save slot name;
    ; might contain diacritics
    ldh  [hMultiPurpose0], a                      ;; 01:4894 $E0 $D7
    ld   a, [de]                                  ;; 01:4896 $1A
    and  a                                        ;; 01:4897 $A7

IF LANG_EN
    jr   .selectSpacingTile                       ;; 01:4898 $18 $03
    ; Unreachable code:
    dec  a                                        ;; 01:489A $3D
    and  $C0                                      ;; 01:489B $E6 $C0
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
    ld   a, DIALOG_BG_TILE_DARK                   ;; 01:489D $3E $7E
    jr   .drawSpacingTile                         ;; 01:489F $18 $08
    ; Unreachable code, likely early diacritics
    ; support that has been stubbed out:
    ld   a, [de]                                  ;; 01:48A1 $1A
    and  $80                                      ;; 01:48A2 $E6 $80
    ld   a, DIALOG_DIACRITIC_2                    ;; 01:48A4 $3E $C8
    jr   z, .drawSpacingTile                      ;; 01:48A6 $28 $01
    inc  a                                        ;; 01:48A8 $3C
ENDC

.drawSpacingTile::
    ldi  [hl], a                                  ;; 01:48A9 $22
    inc  de                                       ;; 01:48AA $13
    ldh  a, [hMultiPurpose0]                      ;; 01:48AB $F0 $D7
    dec  a                                        ;; 01:48AD $3D
    jr   nz, .drawSpacingRowLoop                  ;; 01:48AE $20 $E4
    xor  a                                        ;; 01:48B0 $AF
    ld   [hl], a                                  ;; 01:48B1 $77
    ret                                           ;; 01:48B2 $C9

FileSelectionPrepare6::
    ; If the music track should set overriden…
    ld   a, [wForceFileSelectionScreenMusic]      ;; 01:48B3 $FA $7B $D4
    and  a                                        ;; 01:48B6 $A7
    jr   z, .dontForceMusicTrack                  ;; 01:48B7 $28 $09
    ; … clear the flag…
    xor  a                                        ;; 01:48B9 $AF
    ld   [wForceFileSelectionScreenMusic], a      ;; 01:48BA $EA $7B $D4
    ; … and set the music to the file menu selection track
    ld   a, MUSIC_FILE_SELECT                     ;; 01:48BD $3E $11
    ld   [wMusicTrackToPlay], a                   ;; 01:48BF $EA $68 $D3
.dontForceMusicTrack

    ; If there are no saved files yet…
    ld   a, [wSaveFilesCount]                     ;; 01:48C2 $FA $A7 $DB
IF LANG_DE
    ldh [hLinkInteractiveMotionBlocked], a
ENDC
    and  a                                        ;; 01:48C5 $A7
    ; … draw the file selection without the copy/erase commands,
    ld   a, TILEMAP_MENU_FILE_SELECTION           ;; 01:48C6 $3E $03
    jr   z, .BGMapEnd                             ;; 01:48C8 $28 $02
    ; … else draw the file selection with the commands.
    ld   a, TILEMAP_MENU_FILE_SELECTION_COMMANDS  ;; 01:48CA $3E $04
.BGMapEnd

    ; Load background and palette
    ld   [wBGMapToLoad], a                        ;; 01:48CC $EA $FF $D6
    ld   a, $E4                                   ;; 01:48CF $3E $E4
    ld   [wBGPalette], a                          ;; 01:48D1 $EA $97 $DB
    ld   a, $1C                                   ;; 01:48D4 $3E $1C
    ld   [wOBJ0Palette], a                        ;; 01:48D6 $EA $98 $DB
    ld   a, $E4                                   ;; 01:48D9 $3E $E4
    ld   [wOBJ1Palette], a                        ;; 01:48DB $EA $99 $DB
    call LoadFileMenuBG_trampoline                ;; 01:48DE $CD $05 $09
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:48E1 $C3 $D6 $44

Data_001_48E4::
    dec  sp                                       ;; 01:48E4 $3B
    ld   d, e                                     ;; 01:48E5 $53
    ld   l, e                                     ;; 01:48E6 $6B
    add  a, e                                     ;; 01:48E7 $83

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
    call MoveSelect                               ;; 01:48E8 $CD $A8 $6B
    ldh  a, [hJoypadState]                        ;; 01:48EB $F0 $CC
    and  J_A | J_START                            ;; 01:48ED $E6 $90
    jr   z, .jr_48F4                              ;; 01:48EF $28 $03
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:48F1 $C3 $D6 $44

.jr_48F4::
    ldh  a, [hJoypadState]                        ;; 01:48F4 $F0 $CC
    and  J_UP | J_DOWN                            ;; 01:48F6 $E6 $0C
    jr   z, jr_001_4920                           ;; 01:48F8 $28 $26
    ld   c, $02                                   ;; 01:48FA $0E $02
    ld   a, [wSaveFilesCount]                     ;; 01:48FC $FA $A7 $DB
    and  a                                        ;; 01:48FF $A7
    jr   z, .jr_4903                              ;; 01:4900 $28 $01
    inc  c                                        ;; 01:4902 $0C

.jr_4903::
    ldh  a, [hJoypadState]                        ;; 01:4903 $F0 $CC
    bit  J_BIT_UP, a                              ;; 01:4905 $CB $57
    jr   nz, .jr_4915                             ;; 01:4907 $20 $0C
    ld   a, [wSaveSlot]                           ;; 01:4909 $FA $A6 $DB
    add  a, $01                                   ;; 01:490C $C6 $01
    inc  c                                        ;; 01:490E $0C
    cp   c                                        ;; 01:490F $B9
    jr   c, jr_001_491D                           ;; 01:4910 $38 $0B
    xor  a                                        ;; 01:4912 $AF
    jr   jr_001_491D                              ;; 01:4913 $18 $08

.jr_4915::
    ld   a, [wSaveSlot]                           ;; 01:4915 $FA $A6 $DB
    sub  a, $01                                   ;; 01:4918 $D6 $01
    jr   nc, jr_001_491D                          ;; 01:491A $30 $01
    ld   a, c                                     ;; 01:491C $79

jr_001_491D::
    ld   [wSaveSlot], a                           ;; 01:491D $EA $A6 $DB

jr_001_4920::
    ld   a, [wSaveSlot]                           ;; 01:4920 $FA $A6 $DB
    cp   $03                                      ;; 01:4923 $FE $03
    jr   nz, func_001_4954                        ;; 01:4925 $20 $2D
    ldh  a, [hJoypadState]                        ;; 01:4927 $F0 $CC
    and  J_RIGHT | J_LEFT                         ;; 01:4929 $E6 $03
    jr   z, .jr_4938                              ;; 01:492B $28 $0B
    call MoveSelect.playMoveSelectionJingle       ;; 01:492D $CD $AE $6B
    ld   a, [wIsFileSelectionArrowShifted]        ;; 01:4930 $FA $00 $D0
    xor  $01                                      ;; 01:4933 $EE $01
    ld   [wIsFileSelectionArrowShifted], a        ;; 01:4935 $EA $00 $D0

.jr_4938::
    ldh  a, [hFrameCounter]                       ;; 01:4938 $F0 $E7
    and  $10                                      ;; 01:493A $E6 $10
    jr   nz, func_001_4954                        ;; 01:493C $20 $16
    ld   a, [wIsFileSelectionArrowShifted]        ;; 01:493E $FA $00 $D0
    and  a                                        ;; 01:4941 $A7
    ld   a, FILE_2C                               ;; 01:4942 $3E $2C
    jr   z, .jr_4948                              ;; 01:4944 $28 $02
    ld   a, FILE_64                               ;; 01:4946 $3E $64

.jr_4948::
    ld   hl, wOAMBuffer + $8 ; Arrow sprite              ;; 01:4948 $21 $08 $C0
    ld   [hl], $88 ; y                            ;; 01:494B $36 $88
    inc  hl                                       ;; 01:494D $23
    ldi  [hl], a ; x                              ;; 01:494E $22
    ld   a, $BE                                   ;; 01:494F $3E $BE
    ldi  [hl], a ; Tile                           ;; 01:4951 $22
    xor  a                                        ;; 01:4952 $AF
    ld   [hl], a                                  ;; 01:4953 $77

func_001_4954::
    ld   a, [wSaveSlot]                           ;; 01:4954 $FA $A6 $DB
    ld   e, a                                     ;; 01:4957 $5F
    ld   d, $00                                   ;; 01:4958 $16 $00
    ld   hl, Data_001_48E4                        ;; 01:495A $21 $E4 $48
    add  hl, de                                   ;; 01:495D $19
    ldh  a, [hFrameCounter]                       ;; 01:495E $F0 $E7
    and  $08                                      ;; 01:4960 $E6 $08
    jr   z, .jr_497B                              ;; 01:4962 $28 $17
    ld   a, [hl]                                  ;; 01:4964 $7E
    ld   hl, wOAMBuffer                           ;; 01:4965 $21 $00 $C0
    push af                                       ;; 01:4968 $F5
    ldi  [hl], a                                  ;; 01:4969 $22
    ld   a, $18                                   ;; 01:496A $3E $18
    ldi  [hl], a                                  ;; 01:496C $22
    xor  a                                        ;; 01:496D $AF
    ldi  [hl], a                                  ;; 01:496E $22
    ldi  [hl], a                                  ;; 01:496F $22
    pop  af                                       ;; 01:4970 $F1
    ldi  [hl], a                                  ;; 01:4971 $22
    ld   a, $20                                   ;; 01:4972 $3E $20
    ldi  [hl], a                                  ;; 01:4974 $22
    ld   a, $02                                   ;; 01:4975 $3E $02
    ldi  [hl], a                                  ;; 01:4977 $22
    xor  a                                        ;; 01:4978 $AF
    ld   [hl], a                                  ;; 01:4979 $77
    ret                                           ;; 01:497A $C9

.jr_497B::
    ld   a, [hl]                                  ;; 01:497B $7E
    ld   hl, wOAMBuffer                           ;; 01:497C $21 $00 $C0
    push af                                       ;; 01:497F $F5
    ldi  [hl], a                                  ;; 01:4980 $22
    ld   a, $18                                   ;; 01:4981 $3E $18
    ldi  [hl], a                                  ;; 01:4983 $22
    ld   a, $02                                   ;; 01:4984 $3E $02
    ldi  [hl], a                                  ;; 01:4986 $22
    ld   a, $20                                   ;; 01:4987 $3E $20
    ldi  [hl], a                                  ;; 01:4989 $22
    pop  af                                       ;; 01:498A $F1
    ldi  [hl], a                                  ;; 01:498B $22
    ld   a, $20                                   ;; 01:498C $3E $20
    ldi  [hl], a                                  ;; 01:498E $22
    xor  a                                        ;; 01:498F $AF
    ldi  [hl], a                                  ;; 01:4990 $22
    ld   a, $20                                   ;; 01:4991 $3E $20
    ld   [hl], a                                  ;; 01:4993 $77
    ret                                           ;; 01:4994 $C9

FileSelectionExecuteChoice::
    ; If the COPY or ERASE menu item was selected, handle this.
    ld   a, [wSaveSlot]                           ;; 01:4995 $FA $A6 $DB
    cp   $03                                      ;; 01:4998 $FE $03
    jr   z, HandleFileSelectionCommand            ;; 01:499A $28 $42

    ; The player selected an actual save file.
    ld   a, [wSaveSlot]                           ;; 01:499C $FA $A6 $DB
    ld   e, a                                     ;; 01:499F $5F
    sla  a                                        ;; 01:49A0 $CB $27
    sla  a                                        ;; 01:49A2 $CB $27
    add  a, e                                     ;; 01:49A4 $83
    ld   e, a                                     ;; 01:49A5 $5F
    ld   d, $00                                   ;; 01:49A6 $16 $00
    ld   c, $05                                   ;; 01:49A8 $0E $05
    ld   hl, wSaveSlotNames                       ;; 01:49AA $21 $80 $DB
    add  hl, de                                   ;; 01:49AD $19

.loop
    ld   a, [hli]                                 ;; 01:49AE $2A
    and  a                                        ;; 01:49AF $A7
    jr   nz, LoadSelectedFile                     ;; 01:49B0 $20 $11
    dec  c                                        ;; 01:49B2 $0D
    jr   nz, .loop                                ;; 01:49B3 $20 $F9

    ; Go to the file new dialog
    xor  a                                        ;; 01:49B5 $AF
    ld   [wGameplaySubtype], a                    ;; 01:49B6 $EA $96 $DB
    ld   a, GAMEPLAY_FILE_NEW                     ;; 01:49B9 $3E $03
    ld   [wGameplayType], a                       ;; 01:49BB $EA $95 $DB

PlayValidationJingle::
PlayValidationJingleAndReturn::
    ld   a, JINGLE_VALIDATE                       ;; 01:49BE $3E $13
    ldh  [hJingle], a                             ;; 01:49C0 $E0 $F2
    ret                                           ;; 01:49C2 $C9

LoadSelectedFile::
    call PlayValidationJingle                     ;; 01:49C3 $CD $BE $49

    ld   a, $00                                   ;; 01:49C6 $3E $00
    ld   [wBGPalette], a                          ;; 01:49C8 $EA $97 $DB
    ld   [wOBJ0Palette], a                        ;; 01:49CB $EA $98 $DB
    ld   [wOBJ1Palette], a                        ;; 01:49CE $EA $99 $DB
    ld   a, $01                                   ;; 01:49D1 $3E $01
    call ClearFileMenuBG_trampoline               ;; 01:49D3 $CD $FA $08

    ld   a, TILESET_BASE_OVERWORLD                ;; 01:49D6 $3E $05
    ld   [wTilesetToLoad], a                      ;; 01:49D8 $EA $FE $D6
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:49DB $C3 $D6 $44

HandleFileSelectionCommand::
    ; Clear Gameplay Subtype
    xor  a                                        ;; 01:49DE $AF
    ld   [wGameplaySubtype], a                    ;; 01:49DF $EA $96 $DB
    ; If the arrow is not the COPY item…
    ld   a, [wIsFileSelectionArrowShifted]        ;; 01:49E2 $FA $00 $D0
    and  a                                        ;; 01:49E5 $A7
    ; … go to the File Deletion screen,
    ld   a, GAMEPLAY_FILE_DELETE                  ;; 01:49E6 $3E $04
    jr   z, .nextScreenEnd                        ;; 01:49E8 $28 $02
    ; else go to the File Copy screen.
    ld   a, GAMEPLAY_FILE_COPY                    ;; 01:49EA $3E $05
.nextScreenEnd

    ; Move to the Game Start stage
    ld   [wGameplayType], a                       ;; 01:49EC $EA $95 $DB
    jp   PlayValidationJingleAndReturn            ;; 01:49EF $C3 $BE $49

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
    dw   SaveGame1                                ;; 01:49FE
    dw   SaveGame2                                ;; 01:4A00
    dw   SaveGame3                                ;; 01:4A02

FileSelectionLoadSavedFile::
    jp   LoadSavedFile                            ;; 01:4A04 $C3 $A4 $52


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
    ld   a, [wGameplaySubtype]                    ;; 01:4A07 $FA $96 $DB
    JP_TABLE                                      ;; 01:4A0A $C7
._00 dw FileCreationInit1Handler                  ;; 01:4A0B
._01 dw FileCreationInit2Handler                  ;; 01:4A0D
._02 dw FileCreationInteractiveHandler            ;; 01:4A0F

FileCreationInit1Handler::
    call IncrementGameplaySubtype                 ;; 01:4A11 $CD $D6 $44
    ld   a, TILESET_FILL_TILEMAP                  ;; 01:4A14 $3E $08
    ld   [wTilesetToLoad], a                      ;; 01:4A16 $EA $FE $D6
    xor  a                                        ;; 01:4A19 $AF
    ld   [wDBA8], a                               ;; 01:4A1A $EA $A8 $DB
    ld   [wNameEntryCurrentChar], a               ;; 01:4A1D $EA $A9 $DB
    ld   [wSaveSlotNameCharIndex], a              ;; 01:4A20 $EA $AA $DB
    ret                                           ;; 01:4A23 $C9

FileCreationInit2Handler::
    ld   a, TILEMAP_MENU_FILE_CREATION            ;; 01:4A24 $3E $05
    ld   [wBGMapToLoad], a                        ;; 01:4A26 $EA $FF $D6

    ;
    ; Write the proper tile for the save file number at the top
    ;

    ; Configure a wDrawCommand to copy the tile number to the BG map
    ; during the next vblank period.
    ld   hl, wDrawCommand                         ;; 01:4A29 $21 $01 $D6
    ld   a, HIGH(FILE_NEW_SAVE_SLOT_INDEX_BG)     ;; 01:4A2C $3E $98
    ldi  [hl], a ; wDrawCommandDestinationHigh    ;; 01:4A2E $22
    ld   a, LOW(FILE_NEW_SAVE_SLOT_INDEX_BG)      ;; 01:4A2F $3E $49
    ldi  [hl], a ; wDrawCommand.destinationLow    ;; 01:4A31 $22
    xor  a                                        ;; 01:4A32 $AF
    ldi  [hl], a ; wDrawCommand.length            ;; 01:4A33 $22
    ld   a, [wSaveSlot]                           ;; 01:4A34 $FA $A6 $DB
    add  a, FILE_NEW_SAVE_SLOT_1_TILE             ;; 01:4A37 $C6 $AB
    ldi  [hl], a ; wDrawCommandData[0]            ;; 01:4A39 $22
    xor  a                                        ;; 01:4A3A $AF
    ld   [hl], a ; wDrawCommandData[1]            ;; 01:4A3B $77
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4A3C $C3 $D6 $44

IF !LANG_DE
; Write a single byte to the save file.
; Inputs:
;   hl   address of the save file start
;   bc   offset
;   a    value to write
WriteByteToSRAM::
    push hl                                       ;; 01:4A3F $E5
    add  hl, bc                                   ;; 01:4A40 $09
    call EnableSRAM                               ;; 01:4A41 $CD $D0 $27
    ld   [hl], a                                  ;; 01:4A44 $77
    pop  hl                                       ;; 01:4A45 $E1
    ret                                           ;; 01:4A46 $C9

label_4A47::
    ld   bc, DebugSaveFileData                    ;; 01:4A47 $01 $67 $46
    ld   e, DEBUG_SAVE_FILE_SIZE                  ;; 01:4A4A $1E $43
    push hl                                       ;; 01:4A4C $E5

.loop_4A4D
    call EnableSRAM                               ;; 01:4A4D $CD $D0 $27
    ld   a, [bc]                                  ;; 01:4A50 $0A
    ldi  [hl], a                                  ;; 01:4A51 $22
    inc  bc                                       ;; 01:4A52 $03
    dec  e                                        ;; 01:4A53 $1D
    ld   a, e                                     ;; 01:4A54 $7B
    and  a                                        ;; 01:4A55 $A7
    jr   nz, .loop_4A4D                           ;; 01:4A56 $20 $F5
    pop  hl                                       ;; 01:4A58 $E1
    ld   bc, $4E                                  ;; 01:4A59 $01 $4E $00
    ld   a, $01                                   ;; 01:4A5C $3E $01
    call WriteByteToSRAM                          ;; 01:4A5E $CD $3F $4A
    ld   bc, $44                                  ;; 01:4A61 $01 $44 $00
    call WriteByteToSRAM                          ;; 01:4A64 $CD $3F $4A
    ld   bc, $43                                  ;; 01:4A67 $01 $43 $00
    ld   a, $02                                   ;; 01:4A6A $3E $02
    call WriteByteToSRAM                          ;; 01:4A6C $CD $3F $4A
    ld   bc, $4D                                  ;; 01:4A6F $01 $4D $00
    ld   a, $59                                   ;; 01:4A72 $3E $59
    call WriteByteToSRAM                          ;; 01:4A74 $CD $3F $4A
    ld   bc, $77                                  ;; 01:4A77 $01 $77 $00
    call WriteByteToSRAM                          ;; 01:4A7A $CD $3F $4A
    ld   bc, $78                                  ;; 01:4A7D $01 $78 $00
    call WriteByteToSRAM                          ;; 01:4A80 $CD $3F $4A
    ld   bc, $45                                  ;; 01:4A83 $01 $45 $00
    call WriteByteToSRAM                          ;; 01:4A86 $CD $3F $4A
    ld   bc, $76                                  ;; 01:4A89 $01 $76 $00
    ld   a, $39                                   ;; 01:4A8C $3E $39
    call WriteByteToSRAM                          ;; 01:4A8E $CD $3F $4A
    ld   bc, $4C                                  ;; 01:4A91 $01 $4C $00
    call WriteByteToSRAM                          ;; 01:4A94 $CD $3F $4A
    ret                                           ;; 01:4A97 $C9
ENDC

; Index of the 5-letters save file name in memory.
; Indexed by wSaveSlot
SaveSlotNameAddresses::
._01 db  wSaveSlot1Name - wSaveSlotNames
._02 db  wSaveSlot2Name - wSaveSlotNames
._03 db  wSaveSlot3Name - wSaveSlotNames                           ;; 01:4A98

macro CHECKNAME
    ld   hl, wSaveSlotNames
    add  hl, de
FOR I, NAME_LENGTH
    ld   a, [hli]
IF CHARLEN(\1) < I + 1
    cp   0
ELSE
    cp   CHARVAL(STRCHAR(\1, I)) + 1
ENDC
    jr   nz, \3
ENDR
    ld   a, \2
ENDM

FileCreationInteractiveHandler::
    ; hl = address of the save file name for the current slot
    ld   a, [wSaveSlot]                           ;; 01:4A9B $FA $A6 $DB
    ld   e, a                                     ;; 01:4A9E $5F
    ld   d, $00                                   ;; 01:4A9F $16 $00
    ld   hl, SaveSlotNameAddresses                ;; 01:4AA1 $21 $98 $4A
    add  hl, de                                   ;; 01:4AA4 $19
    ld   e, [hl]                                  ;; 01:4AA5 $5E
    ld   hl, wSaveSlotNames                       ;; 01:4AA6 $21 $80 $DB
    add  hl, de                                   ;; 01:4AA9 $19
    ld   e, l                                     ;; 01:4AAA $5D
    ld   d, h                                     ;; 01:4AAB $54
    ld   bc, $984A                                ;; 01:4AAC $01 $4A $98
    call DrawSaveSlotName                         ;; 01:4AAF $CD $52 $48

    ; If START is pressed, record the save file name
    ldh  a, [hJoypadState]                        ;; 01:4AB2 $F0 $CC
    and  J_START                                  ;; 01:4AB4 $E6 $80
IF __DIACRITICS_SUPPORT__
    jp   z, .validationEnd
ELSE
    jr   z, .validationEnd                        ;; 01:4AB6 $28 $71
ENDC
    call PlayValidationJingle                     ;; 01:4AB8 $CD $BE $49
    ld   a, [wSaveSlot]                           ;; 01:4ABB $FA $A6 $DB
    sla  a                                        ;; 01:4ABE $CB $27
    ld   e, a                                     ;; 01:4AC0 $5F
    ld   d, $00                                   ;; 01:4AC1 $16 $00
    ld   hl, Data_001_49F2                        ;; 01:4AC3 $21 $F2 $49
    add  hl, de                                   ;; 01:4AC6 $19
    ld   a, [hli]                                 ;; 01:4AC7 $2A
    ld   h, [hl]                                  ;; 01:4AC8 $66
    ld   l, a                                     ;; 01:4AC9 $6F
    push hl                                       ;; 01:4ACA $E5
    ld   de, wName - wInventoryItems.BButtonSlot  ;; 01:4ACB $11 $4F $00
    add  hl, de                                   ;; 01:4ACE $19
    push hl                                       ;; 01:4ACF $E5
    ld   a, [wSaveSlot]                           ;; 01:4AD0 $FA $A6 $DB
    ld   e, a                                     ;; 01:4AD3 $5F
    sla  a                                        ;; 01:4AD4 $CB $27
    sla  a                                        ;; 01:4AD6 $CB $27
    add  a, e                                     ;; 01:4AD8 $83
    ld   e, a                                     ;; 01:4AD9 $5F
    ld   d, $00                                   ;; 01:4ADA $16 $00

IF (DEF(EASTER_EGG_FILENAME_2))
    CHECKNAME #EASTER_EGG_FILENAME_1, EASTER_EGG_SONG_1, .checkOtherName
    jr .foundName
.checkOtherName
    CHECKNAME #EASTER_EGG_FILENAME_2, EASTER_EGG_SONG_2, .easterEggEnd
ELSE
    CHECKNAME #EASTER_EGG_FILENAME_1, EASTER_EGG_SONG_1, .easterEggEnd
ENDC

.foundName
    ld   [wMusicTrackToPlay], a                   ;; 01:4AFB $EA $68 $D3
.easterEggEnd

    ; Write the slot name to the save file
    ld   hl, wSaveSlotNames                       ;; 01:4AFE $21 $80 $DB
    add  hl, de                                   ;; 01:4B01 $19
    pop  bc                                       ;; 01:4B02 $C1
    ld   e, NAME_LENGTH                           ;; 01:4B03 $1E $05
.loop
    call EnableSRAM                               ;; 01:4B05 $CD $D0 $27
    ld   a, [hli]                                 ;; 01:4B08 $2A
    ld   [bc], a                                  ;; 01:4B09 $02
    inc  bc                                       ;; 01:4B0A $03
    dec  e                                        ;; 01:4B0B $1D
    jr   nz, .loop                                ;; 01:4B0C $20 $F7

    pop  hl                                       ;; 01:4B0E $E1
    push hl                                       ;; 01:4B0F $E5
    ld   de, wHealth - wInventoryItems.BButtonSlot ;; 01:4B10 $11 $5A $00
    add  hl, de                                   ;; 01:4B13 $19
    ld   [hl], $18  ; write new save current health ;; 01:4B14 $36 $18
    pop  hl                                       ;; 01:4B16 $E1
    push hl                                       ;; 01:4B17 $E5
    ld   de, wMaxHearts - wInventoryItems.BButtonSlot ;; 01:4B18 $11 $5B $00
    add  hl, de                                   ;; 01:4B1B $19
    ld   [hl], $03  ; write new save max health   ;; 01:4B1C $36 $03
    pop  hl                                       ;; 01:4B1E $E1
    ld   de, wDeathCount - wInventoryItems.BButtonSlot ;; 01:4B1F $11 $57 $00
    add  hl, de                                   ;; 01:4B22 $19
    xor  a                                        ;; 01:4B23 $AF
    ldi  [hl], a                                  ;; 01:4B24 $22
    ld   [hl], a                                  ;; 01:4B25 $77
    jp   label_001_4555                           ;; 01:4B26 $C3 $55 $45

.validationEnd
    call func_001_4BF5                            ;; 01:4B29 $CD $F5 $4B
    call func_001_4C8A                            ;; 01:4B2C $CD $8A $4C
    ret                                           ;; 01:4B2F $C9

Data_001_4B30::
    db   $38, $38, $38, $38, $38, $38, $38, $38   ;; 01:4B30
    db   $38, $38, $38, $38, $38, $38, $38, $38   ;; 01:4B38
    db   $48, $48, $48, $48, $48, $48, $48, $48   ;; 01:4B40
    db   $48, $48, $48, $48, $48, $48, $48, $48   ;; 01:4B48
    db   $58, $58, $58, $58, $58, $58, $58, $58   ;; 01:4B50
    db   $58, $58, $58, $58, $58, $58, $58, $58   ;; 01:4B58
    db   $68, $68, $68, $68, $68, $68, $68, $68   ;; 01:4B60
    db   $68, $68, $68, $68, $68, $68, $68, $68   ;; 01:4B68
IF __DIACRITICS_SUPPORT__
    db   $78, $78, $78, $78, $78, $78, $78, $78
    db   $78, $78, $78, $78, $78, $78, $78, $78
ENDC

Data_001_4B70::
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ;; 01:4B70
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ;; 01:4B78
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ;; 01:4B80
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ;; 01:4B88
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ;; 01:4B90
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ;; 01:4B98
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ;; 01:4BA0
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ;; 01:4BA8
IF __DIACRITICS_SUPPORT__
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C
ENDC

Data_001_4BB0::
    db   $4C, $54, $5C, $64, $6C                  ;; 01:4BB0

NameEntryCharacterTable::
include "data/name_entry_characters.asm"
.end

func_001_4BF5::
    ldh  a, [hJoypadState]                        ;; 01:4BF5 $F0 $CC

jr_001_4BF7::
    ldh  [hMultiPurpose0], a                      ;; 01:4BF7 $E0 $D7
    ldh  a, [hMultiPurpose0]                      ;; 01:4BF9 $F0 $D7
    and  $0C                                      ;; 01:4BFB $E6 $0C
    jr   nz, jr_001_4C41                          ;; 01:4BFD $20 $42
    ldh  a, [hMultiPurpose0]                      ;; 01:4BFF $F0 $D7
    and  $03                                      ;; 01:4C01 $E6 $03
    jr   nz, jr_001_4C21                          ;; 01:4C03 $20 $1C
    ldh  a, [hPressedButtonsMask]                 ;; 01:4C05 $F0 $CB
    ld   hl, wC182                                ;; 01:4C07 $21 $82 $C1
    and  $0F                                      ;; 01:4C0A $E6 $0F
    jr   nz, .jr_4C12                             ;; 01:4C0C $20 $04
    xor  a                                        ;; 01:4C0E $AF
    ld   [hl], a                                  ;; 01:4C0F $77
    jr   jr_001_4C1F                              ;; 01:4C10 $18 $0D

.jr_4C12::
    ld   a, [hl]                                  ;; 01:4C12 $7E
    inc  a                                        ;; 01:4C13 $3C
    ld   [hl], a                                  ;; 01:4C14 $77
    cp   $18                                      ;; 01:4C15 $FE $18
    jr   nz, jr_001_4C1F                          ;; 01:4C17 $20 $06
    ld   [hl], $15                                ;; 01:4C19 $36 $15
    ldh  a, [hPressedButtonsMask]                 ;; 01:4C1B $F0 $CB
    jr   jr_001_4BF7                              ;; 01:4C1D $18 $D8

jr_001_4C1F::
    jr   jr_001_4C63                              ;; 01:4C1F $18 $42

jr_001_4C21::
    call MoveSelect.playMoveSelectionJingle       ;; 01:4C21 $CD $AE $6B
    bit  1, a                                     ;; 01:4C24 $CB $4F
    jr   nz, .jr_4C34                             ;; 01:4C26 $20 $0C
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C28 $FA $A9 $DB
    add  a, $01                                   ;; 01:4C2B $C6 $01
    cp   NameEntryCharacterTableSize              ;; 01:4C2D $FE $40
    jr   c, jr_001_4C5E                           ;; 01:4C2F $38 $2D
    xor  a                                        ;; 01:4C31 $AF
    jr   jr_001_4C5E                              ;; 01:4C32 $18 $2A

.jr_4C34::
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C34 $FA $A9 $DB
    sub  a, $01                                   ;; 01:4C37 $D6 $01
    cp   $FF                                      ;; 01:4C39 $FE $FF
    jr   nz, jr_001_4C5E                          ;; 01:4C3B $20 $21
    ld   a, NameEntryCharacterTableSize - 1       ;; 01:4C3D $3E $3F
    jr   jr_001_4C5E                              ;; 01:4C3F $18 $1D

jr_001_4C41::
    call MoveSelect.playMoveSelectionJingle       ;; 01:4C41 $CD $AE $6B
    bit  2, a                                     ;; 01:4C44 $CB $57
    jr   z, .jr_4C53                              ;; 01:4C46 $28 $0B
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C48 $FA $A9 $DB
    sub  a, $10                                   ;; 01:4C4B $D6 $10
    jr   nc, jr_001_4C5E                          ;; 01:4C4D $30 $0F
    add  a, NameEntryCharacterTableSize           ;; 01:4C4F $C6 $40
    jr   jr_001_4C5E                              ;; 01:4C51 $18 $0B

.jr_4C53::
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C53 $FA $A9 $DB
    add  a, $10                                   ;; 01:4C56 $C6 $10
    cp   NameEntryCharacterTableSize              ;; 01:4C58 $FE $40
    jr   c, jr_001_4C5E                           ;; 01:4C5A $38 $02
    sub  a, NameEntryCharacterTableSize           ;; 01:4C5C $D6 $40

jr_001_4C5E::
    ld   [wNameEntryCurrentChar], a               ;; 01:4C5E $EA $A9 $DB
    jr   jr_001_4C63                              ;; 01:4C61 $18 $00

jr_001_4C63::
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C63 $FA $A9 $DB
    ld   hl, Data_001_4B70                        ;; 01:4C66 $21 $70 $4B
    ld   c, a                                     ;; 01:4C69 $4F
    ld   b, $00                                   ;; 01:4C6A $06 $00
    add  hl, bc                                   ;; 01:4C6C $09
    ld   e, [hl]                                  ;; 01:4C6D $5E
    ld   a, [wNameEntryCurrentChar]               ;; 01:4C6E $FA $A9 $DB
    ld   hl, Data_001_4B30                        ;; 01:4C71 $21 $30 $4B
    ld   c, a                                     ;; 01:4C74 $4F
    ld   b, $00                                   ;; 01:4C75 $06 $00
    add  hl, bc                                   ;; 01:4C77 $09
    ld   d, [hl]                                  ;; 01:4C78 $56
    ld   hl, wOAMBuffer                           ;; 01:4C79 $21 $00 $C0
    ld   a, d                                     ;; 01:4C7C $7A
    add  a, $0B                                   ;; 01:4C7D $C6 $0B
    ldi  [hl], a                                  ;; 01:4C7F $22
    ld   a, e                                     ;; 01:4C80 $7B
    add  a, $04                                   ;; 01:4C81 $C6 $04
    ldi  [hl], a                                  ;; 01:4C83 $22
    ld   a, $E0                                   ;; 01:4C84 $3E $E0
    ldi  [hl], a                                  ;; 01:4C86 $22
    xor  a                                        ;; 01:4C87 $AF
    ld   [hl], a                                  ;; 01:4C88 $77
    ret                                           ;; 01:4C89 $C9

func_001_4C8A:: ; "Enter Name" screen
    ldh  a, [hJoypadState] ; Check inputs...      ;; 01:4C8A $F0 $CC
    and  J_A | J_B ; Was A or B pushed?           ;; 01:4C8C $E6 $30
    jr   z, jr_001_4CB7 ; If no, bail             ;; 01:4C8E $28 $27
    bit  J_BIT_B, a ; Was B pushed?               ;; 01:4C90 $CB $6F
    jr   nz, .jr_4CA7 ; If yes, backspace         ;; 01:4C92 $20 $13
    call PlayValidationJingle ; Otherwise, A was pushed ;; 01:4C94 $CD $BE $49
    call func_001_4CDA ; so add the current letter ;; 01:4C97 $CD $DA $4C
    ld   a, [wSaveSlotNameCharIndex]              ;; 01:4C9A $FA $AA $DB
    add  a, $01                                   ;; 01:4C9D $C6 $01
    cp   NAME_LENGTH ; Prevent cursor from going > 5th place ;; 01:4C9F $FE $05
    jr   c, jr_001_4CB4                           ;; 01:4CA1 $38 $11
    ld   a, $04                                   ;; 01:4CA3 $3E $04
    jr   jr_001_4CB4                              ;; 01:4CA5 $18 $0D

.jr_4CA7::
    ; B button when inputting filename
    call PlayValidationJingle                     ;; 01:4CA7 $CD $BE $49
    ld   a, [wSaveSlotNameCharIndex]              ;; 01:4CAA $FA $AA $DB
    sub  a, $01                                   ;; 01:4CAD $D6 $01
    cp   $FF                                      ;; 01:4CAF $FE $FF
    jr   nz, jr_001_4CB4                          ;; 01:4CB1 $20 $01
    xor  a ; Prevent cursor from going < 1st place ;; 01:4CB3 $AF

jr_001_4CB4::
    ld   [wSaveSlotNameCharIndex], a              ;; 01:4CB4 $EA $AA $DB

jr_001_4CB7::
    ld   a, [wSaveSlotNameCharIndex]              ;; 01:4CB7 $FA $AA $DB
    ld   hl, Data_001_4BB0                        ;; 01:4CBA $21 $B0 $4B
    ld   c, a                                     ;; 01:4CBD $4F
    ld   b, $00                                   ;; 01:4CBE $06 $00
    add  hl, bc                                   ;; 01:4CC0 $09
    ld   e, [hl]                                  ;; 01:4CC1 $5E
    ldh  a, [hFrameCounter]                       ;; 01:4CC2 $F0 $E7
    and  $10                                      ;; 01:4CC4 $E6 $10
    jr   z, .return                               ;; 01:4CC6 $28 $11
    ld   hl, wOAMBuffer+4                         ;; 01:4CC8 $21 $04 $C0
    ld   a, $18                                   ;; 01:4CCB $3E $18
    add  a, $0B                                   ;; 01:4CCD $C6 $0B
    ldi  [hl], a                                  ;; 01:4CCF $22
    ld   a, e                                     ;; 01:4CD0 $7B
    add  a, $0C                                   ;; 01:4CD1 $C6 $0C
    ldi  [hl], a                                  ;; 01:4CD3 $22
    ld   a, $E0                                   ;; 01:4CD4 $3E $E0
    ldi  [hl], a                                  ;; 01:4CD6 $22
    xor  a                                        ;; 01:4CD7 $AF
    ld   [hl], a                                  ;; 01:4CD8 $77

.return
    ret                                           ;; 01:4CD9 $C9

func_001_4CDA::
    ld   a, [wNameEntryCurrentChar]               ;; 01:4CDA $FA $A9 $DB
    ld   c, a                                     ;; 01:4CDD $4F
    ld   b, $00                                   ;; 01:4CDE $06 $00
    ld   hl, NameEntryCharacterTable              ;; 01:4CE0 $21 $B5 $4B
    add  hl, bc                                   ;; 01:4CE3 $09
    ld   a, [hl]                                  ;; 01:4CE4 $7E
    ld   e, a                                     ;; 01:4CE5 $5F
    ld   a, [wSaveSlot]                           ;; 01:4CE6 $FA $A6 $DB
    ld   c, a                                     ;; 01:4CE9 $4F
    sla  a                                        ;; 01:4CEA $CB $27
    sla  a                                        ;; 01:4CEC $CB $27
    add  a, c                                     ;; 01:4CEE $81
    ld   c, a                                     ;; 01:4CEF $4F
    ld   hl, wSaveSlot1Name                       ;; 01:4CF0 $21 $80 $DB
    add  hl, bc                                   ;; 01:4CF3 $09
    ld   a, [wSaveSlotNameCharIndex]              ;; 01:4CF4 $FA $AA $DB
    ld   c, a                                     ;; 01:4CF7 $4F
    add  hl, bc                                   ;; 01:4CF8 $09
    ld   [hl], e                                  ;; 01:4CF9 $73
    ret                                           ;; 01:4CFA $C9


; -----------------------------------------------------------------------------
;
; GAMEPLAY_FILE_DELETE
; Screen for deleting a file
;
; -----------------------------------------------------------------------------


FileDeletionEntryPoint::
    call func_5DC0                                ;; 01:4CFB $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ;; 01:4CFE $FA $96 $DB
    JP_TABLE                                      ;; 01:4D01 $C7
._00 dw FileDeletionState0Handler                 ;; 01:4D02
._01 dw FileDeletionState1Handler                 ;; 01:4D04
._02 dw FileDeletionState2Handler                 ;; 01:4D06
._03 dw FileDeletionState3Handler                 ;; 01:4D08
._04 dw FileDeletionState4Handler                 ;; 01:4D0A
._05 dw FileDeletionState5Handler                 ;; 01:4D0C
._06 dw FileDeletionState6Handler                 ;; 01:4D0E
._07 dw FileDeletionState7Handler                 ;; 01:4D10
._08 dw FileDeletionState8Handler                 ;; 01:4D12
._09 dw FileDeletionState9Handler                 ;; 01:4D14
._0A dw FileDeletionState10Handler                ;; 01:4D16
._0B dw FileDeletionState11Handler                ;; 01:4D18

FileDeletionState0Handler::
    ldh  a, [hIsGBC]                              ;; 01:4D1A $F0 $FE
    and  a                                        ;; 01:4D1C $A7
    jr   z, jr_001_4D53                           ;; 01:4D1D $28 $34

    ld   a, $01                                   ;; 01:4D1F $3E $01
    call ClearFileMenuBG_trampoline               ;; 01:4D21 $CD $FA $08
    ld   a, $01                                   ;; 01:4D24 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 01:4D26 $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D29 $C3 $D6 $44

FileDeletionState1Handler::
    ldh  a, [hIsGBC]                              ;; 01:4D2C $F0 $FE
    and  a                                        ;; 01:4D2E $A7
    jr   z, jr_001_4D53                           ;; 01:4D2F $28 $22

    ld   a, $02                                   ;; 01:4D31 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 01:4D33 $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D36 $C3 $D6 $44

FileDeletionState8Handler::
    ldh  a, [hIsGBC]                              ;; 01:4D39 $F0 $FE
    and  a                                        ;; 01:4D3B $A7
    jr   z, jr_001_4D53                           ;; 01:4D3C $28 $15

    call LoadFileMenuBG_trampoline                ;; 01:4D3E $CD $05 $09
    ld   a, $01                                   ;; 01:4D41 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 01:4D43 $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D46 $C3 $D6 $44

FileDeletionState9Handler::
    ldh  a, [hIsGBC]                              ;; 01:4D49 $F0 $FE
    and  a                                        ;; 01:4D4B $A7
    jr   z, jr_001_4D53                           ;; 01:4D4C $28 $05

    ld   a, $02                                   ;; 01:4D4E $3E $02
    ld   [wPaletteDataFlags], a                   ;; 01:4D50 $EA $D1 $DD

jr_001_4D53::
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D53 $C3 $D6 $44

FileDeletionState2Handler::
    ld   a, TILESET_FILL_TILEMAP                  ;; 01:4D56 $3E $08
    ld   [wTilesetToLoad], a                      ;; 01:4D58 $EA $FE $D6
    xor  a                                        ;; 01:4D5B $AF
    ld   [wSaveSlot], a                           ;; 01:4D5C $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ;; 01:4D5F $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D62 $C3 $D6 $44

FileDeletionState3Handler::
    ld   a, TILEMAP_MENU_FILE_ERASE               ;; 01:4D65 $3E $06
    ld   [wBGMapToLoad], a                        ;; 01:4D67 $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D6A $C3 $D6 $44

FileDeletionState4Handler::
    call DrawSaveSlot1Name                        ;; 01:4D6D $CD $8B $4D
    call DrawSaveSlot2Name                        ;; 01:4D70 $CD $94 $4D
    call DrawSaveSlot3Name                        ;; 01:4D73 $CD $9D $4D
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D76 $C3 $D6 $44

FileDeletionState5Handler::
    call DrawSaveSlot1MaxHearts                   ;; 01:4D79 $CD $A6 $4D
    call DrawSaveSlot2MaxHearts                   ;; 01:4D7C $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D7F $C3 $D6 $44

FileDeletionState6Handler::
    call DrawSaveSlot3MaxHearts                   ;; 01:4D82 $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4D85 $C3 $D6 $44

FileDeletionState7Handler::
    jp   CopyDeathCountsToBG                      ;; 01:4D88 $C3 $0C $48

DrawSaveSlot1Name::
    ld   bc, $98C5                                ;; 01:4D8B $01 $C5 $98
    ld   de, wSaveSlot1Name                       ;; 01:4D8E $11 $80 $DB
    jp   DrawSaveSlotName                         ;; 01:4D91 $C3 $52 $48

DrawSaveSlot2Name::
    ld   bc, $9925                                ;; 01:4D94 $01 $25 $99
    ld   de, wSaveSlot2Name                       ;; 01:4D97 $11 $85 $DB
    jp   DrawSaveSlotName                         ;; 01:4D9A $C3 $52 $48

DrawSaveSlot3Name::
    ld   bc, $9985                                ;; 01:4D9D $01 $85 $99
    ld   de, wSaveSlot3Name                       ;; 01:4DA0 $11 $8A $DB
    jp   DrawSaveSlotName                         ;; 01:4DA3 $C3 $52 $48

DrawSaveSlot1MaxHearts::
    ld   a, [wSaveFilesCount]                     ;; 01:4DA6 $FA $A7 $DB
    and  $01                                      ;; 01:4DA9 $E6 $01

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
    jr   z, .return                               ;; 01:4DAB $28 $10

    xor  a                                        ;; 01:4DAD $AF
    ldh  [hMultiPurpose4], a                      ;; 01:4DAE $E0 $DB
    ld   a, [wFile1Health]                        ;; 01:4DB0 $FA $06 $DC
    ldh  [hMultiPurpose2], a                      ;; 01:4DB3 $E0 $D9
    ld   a, [wFile1MaxHearts]                     ;; 01:4DB5 $FA $09 $DC
    ldh  [hMultiPurpose3], a                      ;; 01:4DB8 $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ;; 01:4DBA $C3 $53 $5D

.return::
    ret                                           ;; 01:4DBD $C9
ENDC

DrawSaveSlot2MaxHearts::
    ld   a, [wSaveFilesCount]                     ;; 01:4DBE $FA $A7 $DB
    and  $02                                      ;; 01:4DC1 $E6 $02
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
    jr   z, DrawSaveSlot1MaxHearts.return         ;; 01:4DC3 $28 $F8

    ld   a, $01                                   ;; 01:4DC5 $3E $01
    ldh  [hMultiPurpose4], a                      ;; 01:4DC7 $E0 $DB
    ld   a, [wFile2Health]                        ;; 01:4DC9 $FA $07 $DC
    ldh  [hMultiPurpose2], a                      ;; 01:4DCC $E0 $D9
    ld   a, [wFile2MaxHearts]                     ;; 01:4DCE $FA $0A $DC
    ldh  [hMultiPurpose3], a                      ;; 01:4DD1 $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ;; 01:4DD3 $C3 $53 $5D
ENDC

DrawSaveSlot3MaxHearts::
    ld   a, [wSaveFilesCount]                     ;; 01:4DD6 $FA $A7 $DB
    and  $04                                      ;; 01:4DD9 $E6 $04
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
    jr   z, DrawSaveSlot1MaxHearts.return         ;; 01:4DDB $28 $E0

    ld   a, $02                                   ;; 01:4DDD $3E $02
    ldh  [hMultiPurpose4], a                      ;; 01:4DDF $E0 $DB
    ld   a, [wFile3Health]                        ;; 01:4DE1 $FA $08 $DC
    ldh  [hMultiPurpose2], a                      ;; 01:4DE4 $E0 $D9
    ld   a, [wFile3MaxHearts]                     ;; 01:4DE6 $FA $0B $DC
    ldh  [hMultiPurpose3], a                      ;; 01:4DE9 $E0 $DA
    jp   BuildSaveSlotHeartsDrawCommand           ;; 01:4DEB $C3 $53 $5D
ENDC

Data_001_4DEE::
    db   $98, $A5, $44, $7E, $98, $C5, $44, $7E   ;; 01:4DEE
    db   $99, $05, $44, $7E, $99, $25, $44, $7E   ;; 01:4DF6
    db   $99, $65, $44, $7E, $99, $85, $44, $7E   ;; 01:4DFE

FileDeletionState10Handler::
    call MoveSelect                               ;; 01:4E06 $CD $A8 $6B
    ldh  a, [hJoypadState]                        ;; 01:4E09 $F0 $CC
    and  J_DOWN                                   ;; 01:4E0B $E6 $08
    jr   z, .jr_4E18                              ;; 01:4E0D $28 $09

    ld   a, [wSaveSlot]                           ;; 01:4E0F $FA $A6 $DB
    inc  a                                        ;; 01:4E12 $3C
    and  $03                                      ;; 01:4E13 $E6 $03
    ld   [wSaveSlot], a                           ;; 01:4E15 $EA $A6 $DB

.jr_4E18::
    ldh  a, [hJoypadState]                        ;; 01:4E18 $F0 $CC
    and  J_UP                                     ;; 01:4E1A $E6 $04
    jr   z, jr_001_4E2B                           ;; 01:4E1C $28 $0D

    ld   a, [wSaveSlot]                           ;; 01:4E1E $FA $A6 $DB
    dec  a                                        ;; 01:4E21 $3D
    cp   $FF                                      ;; 01:4E22 $FE $FF
    jr   nz, .jr_4E28                             ;; 01:4E24 $20 $02

    ld   a, $03                                   ;; 01:4E26 $3E $03

.jr_4E28::
    ld   [wSaveSlot], a                           ;; 01:4E28 $EA $A6 $DB

jr_001_4E2B::
    ldh  a, [hJoypadState]                        ;; 01:4E2B $F0 $CC
    and  J_A | J_START                            ;; 01:4E2D $E6 $90
    jr   z, jr_001_4E67                           ;; 01:4E2F $28 $36

    ld   a, [wSaveSlot]                           ;; 01:4E31 $FA $A6 $DB
    cp   $03                                      ;; 01:4E34 $FE $03
    jr   nz, .jr_4E3B                             ;; 01:4E36 $20 $03

    jp   label_001_4555                           ;; 01:4E38 $C3 $55 $45

.jr_4E3B::
    call PlayValidationJingleAndReturn            ;; 01:4E3B $CD $BE $49
    call IncrementGameplaySubtype                 ;; 01:4E3E $CD $D6 $44

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

    ld [hl+], a                                   ;; 01:4EB9 $22
    xor a                                         ;; 01:4EBA $AF
    ld [hl], a                                    ;; 01:4EBB $77
    ret                                           ;; 01:4EBC $C9
ELSE
    jr   CopyQuitOkTilemap                        ;; 01:4E41 $18 $12

; Tilemap for the "QUIT / OK" text, formatted as wDrawCommand data
FileMenuQuitOkTilemap::
include "data/file_menu_quit_ok.asm"
.end

CopyQuitOkTilemap::
    ld   hl, wDrawCommand                         ;; 01:4E55 $21 $01 $D6
    ld   de, FileMenuQuitOkTilemap                ;; 01:4E58 $11 $43 $4E
IF LANG_EN
    ld   c, FileMenuQuitOkTilemap.end - FileMenuQuitOkTilemap - 1 ;; 01:4E5B $0E $11
ELSE
    ld   c, FileMenuQuitOkTilemap.end - FileMenuQuitOkTilemap
ENDC

.loop
    ld   a, [de]                                  ;; 01:4E5D $1A
    inc  de                                       ;; 01:4E5E $13
    ld   [hl+], a                                 ;; 01:4E5F $22
    dec  c                                        ;; 01:4E60 $0D
IF LANG_EN
    ld   a, c                                     ;; 01:4E61 $79
    cp   -1                                       ;; 01:4E62 $FE $FF
ENDC
    jr   nz, .loop                                ;; 01:4E64 $20 $F7
    ret                                           ;; 01:4E66 $C9
ENDC

jr_001_4E67::
    call func_001_4954                            ;; 01:4E67 $CD $54 $49
    ret                                           ;; 01:4E6A $C9

FileDeletionState11Handler::
    ldh  a, [hJoypadState]                        ;; 01:4E6B $F0 $CC
    bit  J_BIT_B, a                               ;; 01:4E6D $CB $6F
    jr   nz, jr_001_4E9E                          ;; 01:4E6F $20 $2D

    and  J_A | J_START                            ;; 01:4E71 $E6 $90
IF LANG_DE
    jp   z, jr_001_4ED9
ELSE
    jr   z, jr_001_4ED9                           ;; 01:4E73 $28 $64
ENDC

    ld   a, [wCreditsScratch0]                    ;; 01:4E75 $FA $00 $D0
    and  a                                        ;; 01:4E78 $A7
    jp   z, label_001_4555                        ;; 01:4E79 $CA $55 $45

    call PlayValidationJingleAndReturn            ;; 01:4E7C $CD $BE $49
    ld   a, [wSaveSlot]                           ;; 01:4E7F $FA $A6 $DB
    sla  a                                        ;; 01:4E82 $CB $27
    ld   e, a                                     ;; 01:4E84 $5F
    ld   d, $00                                   ;; 01:4E85 $16 $00
    ld   hl, SaveGameTable                        ;; 01:4E87 $21 $F8 $49
    add  hl, de                                   ;; 01:4E8A $19
    ld   a, [hl+]                                 ;; 01:4E8B $2A
    ld   h, [hl]                                  ;; 01:4E8C $66
    ld   l, a                                     ;; 01:4E8D $6F
    ld   de, SaveGame1.end - SaveGame1.main       ;; 01:4E8E $11 $A8 $03

.loop_4E91:: ; Clear the save
    call EnableSRAM                               ;; 01:4E91 $CD $D0 $27
    xor  a                                        ;; 01:4E94 $AF
    ld   [hl+], a                                 ;; 01:4E95 $22
    dec  de                                       ;; 01:4E96 $1B
    ld   a, e                                     ;; 01:4E97 $7B
    or   d                                        ;; 01:4E98 $B2
    jr   nz, .loop_4E91                           ;; 01:4E99 $20 $F6

    jp   label_001_4555                           ;; 01:4E9B $C3 $55 $45

jr_001_4E9E::
    call func_001_4EE5                            ;; 01:4E9E $CD $E5 $4E
    call CopyReturnToMenuTilemap                  ;; 01:4EA1 $CD $BB $4E
    ld   hl, wGameplaySubtype                     ;; 01:4EA4 $21 $96 $DB
    dec  [hl]                                     ;; 01:4EA7 $35
    ret                                           ;; 01:4EA8 $C9

IF LANG_JP
CopyReturnToMenuTilemap::
    ld   a, [wDrawCommandsSize]                   ;; 01:4EFF $FA $00 $D6
    ld   e, a                                     ;; 01:4F02 $5F
    add  $04                                      ;; 01:4F03 $C6 $04
    ld   [wDrawCommandsSize], a                   ;; 01:4F05 $EA $00 $D6
    ld   d, $00                                   ;; 01:4F08 $16 $00
    ld   hl, wDrawCommand                         ;; 01:4F0A $21 $01 $D6
    add  hl, de                                   ;; 01:4F0D $19
    ld   a, HIGH(vBGMap0 + $1EE)                  ;; 01:4F0E $3E $99
    ld   [hl+], a                                 ;; 01:4F10 $22
    ld   a, LOW(vBGMap0 + $1EE)                   ;; 01:4F11 $3E $EE
    ld   [hl+], a                                 ;; 01:4F13 $22
    ld   a, $42                                   ;; 01:4F14 $3E $42
    ld   [hl+], a                                 ;; 01:4F16 $22
    ld   a, $7E                                   ;; 01:4F17 $3E $7E
    ld   [hl+], a                                 ;; 01:4F19 $22
    xor  a                                        ;; 01:4F1A $AF
    ld   [hl], a                                  ;; 01:4F1B $77
    ret                                           ;; 01:4F1C $C9
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
    ld   a, [wDrawCommandsSize]                   ;; 01:4EBB $FA $00 $D6
    ld   e, a                                     ;; 01:4EBE $5F
    add  FileReturnToMenuTilemap.end - FileReturnToMenuTilemap - 1 ;; 01:4EBF $C6 $11
    ld   [wDrawCommandsSize], a                   ;; 01:4EC1 $EA $00 $D6
    ld   d, $00                                   ;; 01:4EC4 $16 $00
    ld   hl, wDrawCommand                         ;; 01:4EC6 $21 $01 $D6
    add  hl, de                                   ;; 01:4EC9 $19
    ld   de, FileReturnToMenuTilemap              ;; 01:4ECA $11 $A9 $4E

IF LANG_DE
    ; On German version, if on the File Copy screen, use an alternate version
    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_COPY
    jr   nz, .fileCopyEnd
    ld   de, FileReturnToMenuTilemap_alt
.fileCopyEnd
ENDC

IF LANG_EN
    ld   c, FileReturnToMenuTilemap.end - FileReturnToMenuTilemap - 1 ;; 01:4ECD $0E $11
ELSE
    ld   c, FileReturnToMenuTilemap.end - FileReturnToMenuTilemap
ENDC
.loop
    ld   a, [de]                                  ;; 01:4ECF $1A
    inc  de                                       ;; 01:4ED0 $13
    ld   [hl+], a                                 ;; 01:4ED1 $22
    dec  c                                        ;; 01:4ED2 $0D
IF LANG_EN
    ld   a, c                                     ;; 01:4ED3 $79
    cp   -1                                       ;; 01:4ED4 $FE $FF
ENDC
    jr   nz, .loop                                ;; 01:4ED6 $20 $F7

    ret                                           ;; 01:4ED8 $C9
ENDC

jr_001_4ED9::
    call func_001_4F0C                            ;; 01:4ED9 $CD $0C $4F
    call func_001_4954                            ;; 01:4EDC $CD $54 $49
    ldh  a, [hFrameCounter]                       ;; 01:4EDF $F0 $E7
    and  $10                                      ;; 01:4EE1 $E6 $10
    jr   z, jr_001_4EEF                           ;; 01:4EE3 $28 $0A

func_001_4EE5::
    ld   a, [wSaveSlot]                           ;; 01:4EE5 $FA $A6 $DB
    JP_TABLE                                      ;; 01:4EE8 $C7
._00 dw DrawSaveSlot1Name                         ;; 01:4EE9
._01 dw DrawSaveSlot2Name                         ;; 01:4EEB
._02 dw DrawSaveSlot3Name                         ;; 01:4EED

jr_001_4EEF::
    ld   a, [wSaveSlot]                           ;; 01:4EEF $FA $A6 $DB
    rla                                           ;; 01:4EF2 $17
    rla                                           ;; 01:4EF3 $17
    rla                                           ;; 01:4EF4 $17
    and  $F8                                      ;; 01:4EF5 $E6 $F8
    ld   e, a                                     ;; 01:4EF7 $5F
    ld   d, $00                                   ;; 01:4EF8 $16 $00
    ld   hl, Data_001_4DEE                        ;; 01:4EFA $21 $EE $4D
    add  hl, de                                   ;; 01:4EFD $19
    ld   de, wDrawCommand                         ;; 01:4EFE $11 $01 $D6
    ld   c, $08                                   ;; 01:4F01 $0E $08

.loop_4F03
    ld   a, [hl+]                                 ;; 01:4F03 $2A
    ld   [de], a                                  ;; 01:4F04 $12
    inc  de                                       ;; 01:4F05 $13
    dec  c                                        ;; 01:4F06 $0D
    jr   nz, .loop_4F03                           ;; 01:4F07 $20 $FA

    xor  a                                        ;; 01:4F09 $AF
    ld   [de], a                                  ;; 01:4F0A $12
    ret                                           ;; 01:4F0B $C9

func_001_4F0C::
    ldh  a, [hJoypadState]                        ;; 01:4F0C $F0 $CC
    and  J_RIGHT | J_LEFT                         ;; 01:4F0E $E6 $03
    jr   z, .jr_4F1D                              ;; 01:4F10 $28 $0B

    call MoveSelect.playMoveSelectionJingle       ;; 01:4F12 $CD $AE $6B
    ld   a, [wCreditsScratch0]                    ;; 01:4F15 $FA $00 $D0
    xor  $01                                      ;; 01:4F18 $EE $01
    ld   [wCreditsScratch0], a                    ;; 01:4F1A $EA $00 $D0

.jr_4F1D::
    ldh  a, [hFrameCounter]                       ;; 01:4F1D $F0 $E7
    and  $10                                      ;; 01:4F1F $E6 $10
    jr   nz, ret_001_4F3A                         ;; 01:4F21 $20 $17

    ld   a, [wCreditsScratch0]                    ;; 01:4F23 $FA $00 $D0
    ld   e, a                                     ;; 01:4F26 $5F
IF LANG_JP
    ld   a, [wGameplayType]
    cp   GAMEPLAY_FILE_COPY
    ld   a, $1c
    jr   nz, .jr_4f76
ENDC
    ld   a, FILE_28                               ;; 01:4F27 $3E $28

.jr_4f76
    dec  e                                        ;; 01:4F29 $1D
    jr   nz, .jr_4F2E                             ;; 01:4F2A $20 $02

    ld   a, FILE_6C                               ;; 01:4F2C $3E $6C

.jr_4F2E::
    ld   hl, wOAMBuffer+12                        ;; 01:4F2E $21 $0C $C0
    ld   [hl], $88                                ;; 01:4F31 $36 $88
    inc  hl                                       ;; 01:4F33 $23
    ld   [hl+], a                                 ;; 01:4F34 $22
    ld   a, $BE                                   ;; 01:4F35 $3E $BE
    ld   [hl+], a                                 ;; 01:4F37 $22
    xor  a                                        ;; 01:4F38 $AF
    ld   [hl], a                                  ;; 01:4F39 $77

ret_001_4F3A::
    ret                                           ;; 01:4F3A $C9

Data_001_4F3B::
    db   $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7   ;; 01:4F3B
    db   $B8, $B9                                 ;; 01:4F43

CopyDigitsToFileScreenBG::
    push hl                                       ;; 01:4F45 $E5
    ld   a, [wDrawCommandsSize]                   ;; 01:4F46 $FA $00 $D6
    ld   c, a                                     ;; 01:4F49 $4F
    add  $06                                      ;; 01:4F4A $C6 $06
    ld   [wDrawCommandsSize], a                   ;; 01:4F4C $EA $00 $D6
    ld   b, $00                                   ;; 01:4F4F $06 $00
    ld   hl, wDrawCommand                         ;; 01:4F51 $21 $01 $D6
    add  hl, bc                                   ;; 01:4F54 $09
    ld   a, d                                     ;; 01:4F55 $7A
    ld   [hl+], a                                 ;; 01:4F56 $22
    ld   a, e                                     ;; 01:4F57 $7B
    ld   [hl+], a                                 ;; 01:4F58 $22
    ld   a, $02                                   ;; 01:4F59 $3E $02
    ld   [hl+], a                                 ;; 01:4F5B $22
    pop  bc                                       ;; 01:4F5C $C1
    push hl                                       ;; 01:4F5D $E5
    ld   a, c                                     ;; 01:4F5E $79
    and  $0F                                      ;; 01:4F5F $E6 $0F
    ld   e, a                                     ;; 01:4F61 $5F
    ld   d, $00                                   ;; 01:4F62 $16 $00
    ld   hl, Data_001_4F3B                        ;; 01:4F64 $21 $3B $4F
    add  hl, de                                   ;; 01:4F67 $19
    ld   a, [hl]                                  ;; 01:4F68 $7E
    pop  hl                                       ;; 01:4F69 $E1
    ld   [hl+], a                                 ;; 01:4F6A $22
    push hl                                       ;; 01:4F6B $E5
    ld   a, b                                     ;; 01:4F6C $78
    and  $F0                                      ;; 01:4F6D $E6 $F0
    swap a                                        ;; 01:4F6F $CB $37
    ld   e, a                                     ;; 01:4F71 $5F
    ld   d, $00                                   ;; 01:4F72 $16 $00
    ld   hl, Data_001_4F3B                        ;; 01:4F74 $21 $3B $4F
    add  hl, de                                   ;; 01:4F77 $19
    ld   a, [hl]                                  ;; 01:4F78 $7E
    pop  hl                                       ;; 01:4F79 $E1
    ld   [hl+], a                                 ;; 01:4F7A $22
    push hl                                       ;; 01:4F7B $E5
    ld   a, b                                     ;; 01:4F7C $78
    and  $0F                                      ;; 01:4F7D $E6 $0F
    ld   e, a                                     ;; 01:4F7F $5F
    ld   d, $00                                   ;; 01:4F80 $16 $00
    ld   hl, Data_001_4F3B                        ;; 01:4F82 $21 $3B $4F
    add  hl, de                                   ;; 01:4F85 $19
    ld   a, [hl]                                  ;; 01:4F86 $7E
    pop  hl                                       ;; 01:4F87 $E1
    ld   [hl+], a                                 ;; 01:4F88 $22
    xor  a                                        ;; 01:4F89 $AF
    ld   [hl], a                                  ;; 01:4F8A $77
    ret                                           ;; 01:4F8B $C9


; -----------------------------------------------------------------------------
;
; FILE COPY
; Screen for copying a saved file
;
; -----------------------------------------------------------------------------


FileCopyEntryPoint::
    ld   a, [wGameplaySubtype]                    ;; 01:4F8C $FA $96 $DB
    JP_TABLE                                      ;; 01:4F8F $C7
._00 dw FileDeletionState0Handler                 ;; 01:4F90
._01 dw FileDeletionState1Handler                 ;; 01:4F92
._02 dw FileCopyState2Handler                     ;; 01:4F94
._03 dw FileCopyState3Handler                     ;; 01:4F96
._04 dw FileCopyState4Handler                     ;; 01:4F98
._05 dw FileCopyState5Handler                     ;; 01:4F9A
._06 dw FileDeletionState8Handler                 ;; 01:4F9C
._07 dw FileDeletionState9Handler                 ;; 01:4F9E
._08 dw FileCopyState8Handler                     ;; 01:4FA0
._09 dw FileCopyState9Handler                     ;; 01:4FA2
._0A dw FileCopyStateAHandler                     ;; 01:4FA4

FileCopyState2Handler::
    ld   a, TILESET_FILL_TILEMAP                  ;; 01:4FA6 $3E $08
    ld   [wTilesetToLoad], a                      ;; 01:4FA8 $EA $FE $D6
    xor  a                                        ;; 01:4FAB $AF
    ld   [wSaveSlot], a                           ;; 01:4FAC $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ;; 01:4FAF $EA $00 $D0
    ld   [wIntroTimer], a                         ;; 01:4FB2 $EA $01 $D0
    ld   [wIntroSubTimer], a                      ;; 01:4FB5 $EA $02 $D0
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4FB8 $C3 $D6 $44

FileCopyState3Handler::
    ld   a, TILEMAP_MENU_FILE_COPY                ;; 01:4FBB $3E $0C
    ld   [wBGMapToLoad], a                        ;; 01:4FBD $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4FC0 $C3 $D6 $44

FileCopyState4Handler::
    ld   bc, $98C4                                ;; 01:4FC3 $01 $C4 $98
    ld   de, wSaveSlot1Name                       ;; 01:4FC6 $11 $80 $DB
    call DrawSaveSlotName                         ;; 01:4FC9 $CD $52 $48
    ld   bc, $9924                                ;; 01:4FCC $01 $24 $99
    ld   de, wSaveSlot2Name                       ;; 01:4FCF $11 $85 $DB
    call DrawSaveSlotName                         ;; 01:4FD2 $CD $52 $48
    ld   bc, $9984                                ;; 01:4FD5 $01 $84 $99
    ld   de, wSaveSlot3Name                       ;; 01:4FD8 $11 $8A $DB
    call DrawSaveSlotName                         ;; 01:4FDB $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4FDE $C3 $D6 $44

FileCopyState5Handler::
    ld   bc, $98CD                                ;; 01:4FE1 $01 $CD $98
    ld   de, wSaveSlot1Name                       ;; 01:4FE4 $11 $80 $DB
    call DrawSaveSlotName                         ;; 01:4FE7 $CD $52 $48
    ld   bc, $992D                                ;; 01:4FEA $01 $2D $99
    ld   de, wSaveSlot2Name                       ;; 01:4FED $11 $85 $DB
    call DrawSaveSlotName                         ;; 01:4FF0 $CD $52 $48
    ld   bc, $998D                                ;; 01:4FF3 $01 $8D $99
    ld   de, wSaveSlot3Name                       ;; 01:4FF6 $11 $8A $DB
    call DrawSaveSlotName                         ;; 01:4FF9 $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4FFC $C3 $D6 $44

FileCopyState8Handler::
    call MoveSelect                               ;; 01:4FFF $CD $A8 $6B
    ldh  a, [hJoypadState]                        ;; 01:5002 $F0 $CC
    and  J_DOWN                                   ;; 01:5004 $E6 $08
    jr   z, .jr_500E                              ;; 01:5006 $28 $06

    ld   a, [wIntroTimer]                         ;; 01:5008 $FA $01 $D0
    inc  a                                        ;; 01:500B $3C
    jr   jr_001_5018                              ;; 01:500C $18 $0A

.jr_500E::
    ldh  a, [hJoypadState]                        ;; 01:500E $F0 $CC
    and  J_UP                                     ;; 01:5010 $E6 $04
    jr   z, jr_001_501D                           ;; 01:5012 $28 $09

    ld   a, [wIntroTimer]                         ;; 01:5014 $FA $01 $D0
    dec  a                                        ;; 01:5017 $3D

jr_001_5018::
    and  $03                                      ;; 01:5018 $E6 $03
    ld   [wIntroTimer], a                         ;; 01:501A $EA $01 $D0

jr_001_501D::
    ldh  a, [hJoypadState]                        ;; 01:501D $F0 $CC
    and  J_A | J_START                            ;; 01:501F $E6 $90
    jr   z, jr_001_5055                           ;; 01:5021 $28 $32

    ld   a, [wIntroTimer]                         ;; 01:5023 $FA $01 $D0
    cp   $03                                      ;; 01:5026 $FE $03
    jp   z, label_001_4555                        ;; 01:5028 $CA $55 $45

    ld   hl, wSaveSlot1Name                       ;; 01:502B $21 $80 $DB
    ld   b, $00                                   ;; 01:502E $06 $00
    ld   a, [wIntroTimer]                         ;; 01:5030 $FA $01 $D0
    and  a                                        ;; 01:5033 $A7
    jr   z, jr_001_5042                           ;; 01:5034 $28 $0C

    cp   $01                                      ;; 01:5036 $FE $01
    jr   z, .jr_503F                              ;; 01:5038 $28 $05

    ld   hl, wSaveSlot3Name                       ;; 01:503A $21 $8A $DB
    jr   jr_001_5042                              ;; 01:503D $18 $03

.jr_503F::
    ld   hl, wSaveSlot2Name                       ;; 01:503F $21 $85 $DB

jr_001_5042::
    xor  a                                        ;; 01:5042 $AF
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
    add  [hl]                                     ;; 01:5043 $86
    inc  hl                                       ;; 01:5044 $23
    add  [hl]                                     ;; 01:5045 $86
    inc  hl                                       ;; 01:5046 $23
    add  [hl]                                     ;; 01:5047 $86
    inc  hl                                       ;; 01:5048 $23
    add  [hl]                                     ;; 01:5049 $86
    inc  hl                                       ;; 01:504A $23
    add  [hl]                                     ;; 01:504B $86
ENDC
    and  a                                        ;; 01:504C $A7
    jr   z, jr_001_5055                           ;; 01:504D $28 $06

    call IncrementGameplaySubtype                 ;; 01:504F $CD $D6 $44
    call PlayValidationJingleAndReturn            ;; 01:5052 $CD $BE $49

jr_001_5055::
    ld   a, [wIntroTimer]                         ;; 01:5055 $FA $01 $D0
    ld   e, a                                     ;; 01:5058 $5F
    ld   d, $00                                   ;; 01:5059 $16 $00
    ld   hl, Data_001_48E4                        ;; 01:505B $21 $E4 $48
    add  hl, de                                   ;; 01:505E $19
    ldh  a, [hFrameCounter]                       ;; 01:505F $F0 $E7
    and  $08                                      ;; 01:5061 $E6 $08
    ld   a, [hl]                                  ;; 01:5063 $7E
    ld   hl, wOAMBuffer                           ;; 01:5064 $21 $00 $C0

label_001_5067::
    jr   z, .jr_507D                              ;; 01:5067 $28 $14

    push af                                       ;; 01:5069 $F5
    ld   [hl+], a                                 ;; 01:506A $22
    ld   a, $10                                   ;; 01:506B $3E $10
    ld   [hl+], a                                 ;; 01:506D $22
    xor  a                                        ;; 01:506E $AF
    ld   [hl+], a                                 ;; 01:506F $22
    ld   [hl+], a                                 ;; 01:5070 $22
    pop  af                                       ;; 01:5071 $F1
    ld   [hl+], a                                 ;; 01:5072 $22
    ld   a, $18                                   ;; 01:5073 $3E $18
    ld   [hl+], a                                 ;; 01:5075 $22
    ld   a, $02                                   ;; 01:5076 $3E $02
    ld   [hl+], a                                 ;; 01:5078 $22
    ld   a, $00                                   ;; 01:5079 $3E $00
    ld   [hl], a                                  ;; 01:507B $77
    ret                                           ;; 01:507C $C9

.jr_507D::
    push af                                       ;; 01:507D $F5
    ld   [hl+], a                                 ;; 01:507E $22
    ld   a, $10                                   ;; 01:507F $3E $10
    ld   [hl+], a                                 ;; 01:5081 $22
    ld   a, $02                                   ;; 01:5082 $3E $02
    ld   [hl+], a                                 ;; 01:5084 $22
    ld   a, $20                                   ;; 01:5085 $3E $20
    ld   [hl+], a                                 ;; 01:5087 $22
    pop  af                                       ;; 01:5088 $F1
    ld   [hl+], a                                 ;; 01:5089 $22
    ld   a, $18                                   ;; 01:508A $3E $18
    ld   [hl+], a                                 ;; 01:508C $22
    ld   a, $00                                   ;; 01:508D $3E $00
    ld   [hl+], a                                 ;; 01:508F $22
    ld   a, $20                                   ;; 01:5090 $3E $20
    ld   [hl], a                                  ;; 01:5092 $77
    ret                                           ;; 01:5093 $C9

func_001_5094::
    ld   a, [wIntroTimer]                         ;; 01:5094 $FA $01 $D0
    ld   e, a                                     ;; 01:5097 $5F
    ld   d, $00                                   ;; 01:5098 $16 $00
    ld   hl, Data_001_48E4                        ;; 01:509A $21 $E4 $48
    add  hl, de                                   ;; 01:509D $19
    ld   a, [hl]                                  ;; 01:509E $7E
    ld   hl, wOAMBuffer                           ;; 01:509F $21 $00 $C0
    add  $05                                      ;; 01:50A2 $C6 $05
    ld   [hl+], a                                 ;; 01:50A4 $22
    ld   a, $14                                   ;; 01:50A5 $3E $14
    ld   [hl+], a                                 ;; 01:50A7 $22
    ld   a, $BE                                   ;; 01:50A8 $3E $BE
    ld   [hl+], a                                 ;; 01:50AA $22
    ld   a, $00                                   ;; 01:50AB $3E $00
    ld   [hl], a                                  ;; 01:50AD $77
    ret                                           ;; 01:50AE $C9

Data_001_50AF::
    db   $98, $A4, $44, $7E, $98, $C4, $44, $7E   ;; 01:50AF
    db   $99, $04, $44, $7E, $99, $24, $44, $7E   ;; 01:50B7
    db   $99, $64, $44, $7E, $99, $84, $44, $7E   ;; 01:50BF

Data_001_50C7::
    db   $98, $AD, $44, $7E, $98, $CD, $44, $7E   ;; 01:50C7
    db   $99, $0D, $44, $7E, $99, $2D, $44, $7E   ;; 01:50CF
    db   $99, $6D, $44, $7E, $99, $8D, $44, $7E   ;; 01:50D7

FileCopyState9Handler::
    call MoveSelect                               ;; 01:50DF $CD $A8 $6B
    ldh  a, [hJoypadState]                        ;; 01:50E2 $F0 $CC
    and  J_DOWN                                   ;; 01:50E4 $E6 $08
    jr   z, .jr_50F1                              ;; 01:50E6 $28 $09

    ld   a, [wIntroSubTimer]                      ;; 01:50E8 $FA $02 $D0
    inc  a                                        ;; 01:50EB $3C
    and  $03                                      ;; 01:50EC $E6 $03
    ld   [wIntroSubTimer], a                      ;; 01:50EE $EA $02 $D0

.jr_50F1::
    ldh  a, [hJoypadState]                        ;; 01:50F1 $F0 $CC
    and  $04                                      ;; 01:50F3 $E6 $04
    jr   z, jr_001_5104                           ;; 01:50F5 $28 $0D

    ld   a, [wIntroSubTimer]                      ;; 01:50F7 $FA $02 $D0
    dec  a                                        ;; 01:50FA $3D
    cp   $FF                                      ;; 01:50FB $FE $FF
    jr   nz, .jr_5101                             ;; 01:50FD $20 $02

    ld   a, $03                                   ;; 01:50FF $3E $03

.jr_5101::
    ld   [wIntroSubTimer], a                      ;; 01:5101 $EA $02 $D0

jr_001_5104::
    call func_001_5094                            ;; 01:5104 $CD $94 $50
    ldh  a, [hJoypadState]                        ;; 01:5107 $F0 $CC
    bit  J_BIT_B, a                               ;; 01:5109 $CB $6F
    jr   z, .jr_5114                              ;; 01:510B $28 $07

    ld   hl, wGameplaySubtype                     ;; 01:510D $21 $96 $DB
    dec  [hl]                                     ;; 01:5110 $35
    jp   label_001_514F                           ;; 01:5111 $C3 $4F $51

.jr_5114::
    and  $90                                      ;; 01:5114 $E6 $90
    jr   z, .jr_5129                              ;; 01:5116 $28 $11

    ld   a, [wIntroSubTimer]                      ;; 01:5118 $FA $02 $D0
    cp   $03                                      ;; 01:511B $FE $03
    jp   z, label_001_4555                        ;; 01:511D $CA $55 $45

    call PlayValidationJingleAndReturn            ;; 01:5120 $CD $BE $49
    call IncrementGameplaySubtype                 ;; 01:5123 $CD $D6 $44
    jp   CopyQuitOkTilemap                        ;; 01:5126 $C3 $55 $4E

.jr_5129::
    call func_001_5175                            ;; 01:5129 $CD $75 $51

func_001_512C::
    ldh  a, [hFrameCounter]                       ;; 01:512C $F0 $E7
    and  $10                                      ;; 01:512E $E6 $10
    jr   z, label_001_514F                        ;; 01:5130 $28 $1D

    ld   a, [wIntroTimer]                         ;; 01:5132 $FA $01 $D0
    rla                                           ;; 01:5135 $17
    rla                                           ;; 01:5136 $17
    rla                                           ;; 01:5137 $17
    and  $F8                                      ;; 01:5138 $E6 $F8
    ld   e, a                                     ;; 01:513A $5F
    ld   d, $00                                   ;; 01:513B $16 $00
    ld   hl, Data_001_50AF                        ;; 01:513D $21 $AF $50
    add  hl, de                                   ;; 01:5140 $19
    ld   de, wDrawCommand                         ;; 01:5141 $11 $01 $D6
    ld   c, $08                                   ;; 01:5144 $0E $08

.loop_5146
    ld   a, [hl+]                                 ;; 01:5146 $2A
    ld   [de], a                                  ;; 01:5147 $12
    inc  de                                       ;; 01:5148 $13
    dec  c                                        ;; 01:5149 $0D
    jr   nz, .loop_5146                           ;; 01:514A $20 $FA

    xor  a                                        ;; 01:514C $AF
    ld   [de], a                                  ;; 01:514D $12
    ret                                           ;; 01:514E $C9

label_001_514F::
    ld   a, [wIntroTimer]                         ;; 01:514F $FA $01 $D0
    cp   $01                                      ;; 01:5152 $FE $01
    jr   z, .jr_5163                              ;; 01:5154 $28 $0D

    cp   $02                                      ;; 01:5156 $FE $02
    jr   z, jr_001_516C                           ;; 01:5158 $28 $12

    ld   bc, $98C4                                ;; 01:515A $01 $C4 $98
    ld   de, wSaveSlot1Name                       ;; 01:515D $11 $80 $DB
    jp   DrawSaveSlotName                         ;; 01:5160 $C3 $52 $48

.jr_5163::
    ld   bc, $9924                                ;; 01:5163 $01 $24 $99
    ld   de, wSaveSlot2Name                       ;; 01:5166 $11 $85 $DB
    jp   DrawSaveSlotName                         ;; 01:5169 $C3 $52 $48

jr_001_516C::
    ld   bc, $9984                                ;; 01:516C $01 $84 $99
    ld   de, wSaveSlot3Name                       ;; 01:516F $11 $8A $DB
    jp   DrawSaveSlotName                         ;; 01:5172 $C3 $52 $48

func_001_5175::
    ld   a, [wIntroSubTimer]                      ;; 01:5175 $FA $02 $D0
    ld   e, a                                     ;; 01:5178 $5F
    ld   d, $00                                   ;; 01:5179 $16 $00
    ld   hl, Data_001_48E4                        ;; 01:517B $21 $E4 $48
    add  hl, de                                   ;; 01:517E $19
    ld   a, [wIntroSubTimer]                      ;; 01:517F $FA $02 $D0
    cp   $03                                      ;; 01:5182 $FE $03
    jp   z, label_001_51C3                        ;; 01:5184 $CA $C3 $51

    ldh  a, [hFrameCounter]                       ;; 01:5187 $F0 $E7
    and  $08                                      ;; 01:5189 $E6 $08
    jr   z, .jr_51A8                              ;; 01:518B $28 $1B

    ld   a, [hl]                                  ;; 01:518D $7E
    ld   hl, wOAMBuffer+8                         ;; 01:518E $21 $08 $C0
    push af                                       ;; 01:5191 $F5
    ld   [hl+], a                                 ;; 01:5192 $22
    ld   a, $58                                   ;; 01:5193 $3E $58
    ld   [hl+], a                                 ;; 01:5195 $22
    ld   a, $00                                   ;; 01:5196 $3E $00
    ld   [hl+], a                                 ;; 01:5198 $22
    ld   a, $00                                   ;; 01:5199 $3E $00
    ld   [hl+], a                                 ;; 01:519B $22
    pop  af                                       ;; 01:519C $F1
    ld   [hl+], a                                 ;; 01:519D $22
    ld   a, $60                                   ;; 01:519E $3E $60
    ld   [hl+], a                                 ;; 01:51A0 $22
    ld   a, $02                                   ;; 01:51A1 $3E $02
    ld   [hl+], a                                 ;; 01:51A3 $22
    ld   a, $00                                   ;; 01:51A4 $3E $00
    ld   [hl], a                                  ;; 01:51A6 $77
    ret                                           ;; 01:51A7 $C9

.jr_51A8::
    ld   a, [hl]                                  ;; 01:51A8 $7E
    ld   hl, wOAMBuffer+8                         ;; 01:51A9 $21 $08 $C0
    push af                                       ;; 01:51AC $F5
    ld   [hl+], a                                 ;; 01:51AD $22
    ld   a, $58                                   ;; 01:51AE $3E $58
    ld   [hl+], a                                 ;; 01:51B0 $22
    ld   a, $02                                   ;; 01:51B1 $3E $02
    ld   [hl+], a                                 ;; 01:51B3 $22
    ld   a, $20                                   ;; 01:51B4 $3E $20
    ld   [hl+], a                                 ;; 01:51B6 $22
    pop  af                                       ;; 01:51B7 $F1
    ld   [hl+], a                                 ;; 01:51B8 $22
    ld   a, $60                                   ;; 01:51B9 $3E $60
    ld   [hl+], a                                 ;; 01:51BB $22
    ld   a, $00                                   ;; 01:51BC $3E $00
    ld   [hl+], a                                 ;; 01:51BE $22
    ld   a, $20                                   ;; 01:51BF $3E $20
    ld   [hl], a                                  ;; 01:51C1 $77
    ret                                           ;; 01:51C2 $C9

label_001_51C3::
    ldh  a, [hFrameCounter]                       ;; 01:51C3 $F0 $E7
    and  $08                                      ;; 01:51C5 $E6 $08
    ld   a, [hl]                                  ;; 01:51C7 $7E
    ld   hl, wOAMBuffer+8                         ;; 01:51C8 $21 $08 $C0
    jp   label_001_5067                           ;; 01:51CB $C3 $67 $50

func_001_51CE::
    ld   a, [wIntroSubTimer]                      ;; 01:51CE $FA $02 $D0
    ld   e, a                                     ;; 01:51D1 $5F
    ld   d, $00                                   ;; 01:51D2 $16 $00
    ld   hl, Data_001_48E4                        ;; 01:51D4 $21 $E4 $48
    add  hl, de                                   ;; 01:51D7 $19
    ld   a, [hl]                                  ;; 01:51D8 $7E
    ld   hl, wOAMBuffer+8                         ;; 01:51D9 $21 $08 $C0
    add  $05                                      ;; 01:51DC $C6 $05
    ld   [hl+], a                                 ;; 01:51DE $22
    ld   a, $5C                                   ;; 01:51DF $3E $5C
    ld   [hl+], a                                 ;; 01:51E1 $22
    ld   a, $BE                                   ;; 01:51E2 $3E $BE
    ld   [hl+], a                                 ;; 01:51E4 $22
    ld   a, $00                                   ;; 01:51E5 $3E $00
    ld   [hl], a                                  ;; 01:51E7 $77
    ret                                           ;; 01:51E8 $C9

FileCopyStateAHandler::
    call func_001_5094                            ;; 01:51E9 $CD $94 $50
    call func_001_51CE                            ;; 01:51EC $CD $CE $51
    call func_001_4F0C                            ;; 01:51EF $CD $0C $4F
    ldh  a, [hJoypadState]                        ;; 01:51F2 $F0 $CC
    and  J_A | J_START                            ;; 01:51F4 $E6 $90
    jr   z, jr_001_5235                           ;; 01:51F6 $28 $3D

    ld   a, [wCreditsScratch0]                    ;; 01:51F8 $FA $00 $D0
    and  a                                        ;; 01:51FB $A7
    jp   z, label_001_4555                        ;; 01:51FC $CA $55 $45

    call PlayValidationJingleAndReturn            ;; 01:51FF $CD $BE $49
    ld   a, [wIntroTimer]                         ;; 01:5202 $FA $01 $D0
    sla  a                                        ;; 01:5205 $CB $27
    ld   e, a                                     ;; 01:5207 $5F
    ld   d, $00                                   ;; 01:5208 $16 $00
    ld   hl, Data_001_49FE                        ;; 01:520A $21 $FE $49
    add  hl, de                                   ;; 01:520D $19
    ld   c, [hl]                                  ;; 01:520E $4E
    inc  hl                                       ;; 01:520F $23
    ld   b, [hl]                                  ;; 01:5210 $46
    ld   a, [wIntroSubTimer]                      ;; 01:5211 $FA $02 $D0
    sla  a                                        ;; 01:5214 $CB $27
    ld   e, a                                     ;; 01:5216 $5F
    ld   d, $00                                   ;; 01:5217 $16 $00
    ld   hl, Data_001_49FE                        ;; 01:5219 $21 $FE $49
    add  hl, de                                   ;; 01:521C $19
    ld   a, [hl]                                  ;; 01:521D $7E
    inc  hl                                       ;; 01:521E $23
    ld   h, [hl]                                  ;; 01:521F $66
    ld   l, a                                     ;; 01:5220 $6F

    ; sizeof save data
    ld   de, (SaveGame2 - SaveGame1)              ;; 01:5221 $11 $AD $03

.loop_5224
    call EnableSRAM                               ;; 01:5224 $CD $D0 $27
    ld   a, [bc]                                  ;; 01:5227 $0A
    inc  bc                                       ;; 01:5228 $03
    call EnableSRAM                               ;; 01:5229 $CD $D0 $27
    ld   [hl+], a                                 ;; 01:522C $22
    dec  de                                       ;; 01:522D $1B
    ld   a, e                                     ;; 01:522E $7B
    or   d                                        ;; 01:522F $B2
    jr   nz, .loop_5224                           ;; 01:5230 $20 $F2

    jp   label_001_4555                           ;; 01:5232 $C3 $55 $45

jr_001_5235::
    ldh  a, [hJoypadState]                        ;; 01:5235 $F0 $CC
    bit  J_BIT_B, a                               ;; 01:5237 $CB $6F
    jr   z, .jr_5249                              ;; 01:5239 $28 $0E

    ld   hl, wGameplaySubtype                     ;; 01:523B $21 $96 $DB
    dec  [hl]                                     ;; 01:523E $35
    xor  a                                        ;; 01:523F $AF
    ld   [wCreditsScratch0], a                    ;; 01:5240 $EA $00 $D0
    call CopyReturnToMenuTilemap                  ;; 01:5243 $CD $BB $4E
    jp   label_001_526F                           ;; 01:5246 $C3 $6F $52

.jr_5249::
    call func_001_512C                            ;; 01:5249 $CD $2C $51
    ldh  a, [hFrameCounter]                       ;; 01:524C $F0 $E7
    and  $10                                      ;; 01:524E $E6 $10
    jr   z, label_001_526F                        ;; 01:5250 $28 $1D

    ld   a, [wIntroSubTimer]                      ;; 01:5252 $FA $02 $D0
    rla                                           ;; 01:5255 $17
    rla                                           ;; 01:5256 $17
    rla                                           ;; 01:5257 $17
    and  $F8                                      ;; 01:5258 $E6 $F8
    ld   e, a                                     ;; 01:525A $5F
    ld   d, $00                                   ;; 01:525B $16 $00
    ld   hl, Data_001_50C7                        ;; 01:525D $21 $C7 $50
    add  hl, de                                   ;; 01:5260 $19
    ld   de, wDrawCommand.data + 5                ;; 01:5261 $11 $09 $D6
    ld   c, $08                                   ;; 01:5264 $0E $08

.loop_5266
    ld   a, [hl+]                                 ;; 01:5266 $2A
    ld   [de], a                                  ;; 01:5267 $12
    inc  de                                       ;; 01:5268 $13
    dec  c                                        ;; 01:5269 $0D
    jr   nz, .loop_5266                           ;; 01:526A $20 $FA

    xor  a                                        ;; 01:526C $AF
    ld   [de], a                                  ;; 01:526D $12
    ret                                           ;; 01:526E $C9

label_001_526F::
    ld   a, [wIntroSubTimer]                      ;; 01:526F $FA $02 $D0
    cp   $01                                      ;; 01:5272 $FE $01
    jr   z, .jr_5283                              ;; 01:5274 $28 $0D

    cp   $02                                      ;; 01:5276 $FE $02
    jr   z, jr_001_528C                           ;; 01:5278 $28 $12

    ld   bc, $98CD                                ;; 01:527A $01 $CD $98
    ld   de, wSaveSlot1Name                       ;; 01:527D $11 $80 $DB
    jp   DrawSaveSlotName                         ;; 01:5280 $C3 $52 $48

.jr_5283::
    ld   bc, $992D                                ;; 01:5283 $01 $2D $99
    ld   de, wSaveSlot2Name                       ;; 01:5286 $11 $85 $DB
    jp   DrawSaveSlotName                         ;; 01:5289 $C3 $52 $48

jr_001_528C::
    ld   bc, $998D                                ;; 01:528C $01 $8D $99
    ld   de, wSaveSlot3Name                       ;; 01:528F $11 $8A $DB
    jp   DrawSaveSlotName                         ;; 01:5292 $C3 $52 $48
