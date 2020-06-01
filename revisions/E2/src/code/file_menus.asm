; Screens for save files:
;  - selection
;  - creation
;  - copy
;  - deletion


; -----------------------------------------------------------------------------
;
; FILE SELECTION
; Screen for selecting a save file
;
; -----------------------------------------------------------------------------


FileSelectionEntryPoint::
    call func_5DC0
    ld   a, [wGameplaySubtype]
    JP_TABLE
._00 dw FileSelectionPrepare0
._01 dw FileSelectionPrepare1
._02 dw FileSelectionPrepare2
._03 dw FileSelectionPrepare3
._04 dw CopyDeathCountsToBG
._05 dw FileSelectionPrepare5
._06 dw FileSelectionPrepare6
._07 dw FileSelectionInteractiveHandler
._08 dw FileSelectionExecuteChoice
._09 dw FileSelectionLoadSavedFile

FileSelectionPrepare0::
    ; Load tilemap 4
    ld   a, $04
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$D000], a
    jp   IncrementGameplaySubtypeAndReturn

FileSelectionPrepare1::
    ; Load tilemap 8
    ld   a, $08
    ld   [wTileMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn

FileSelectionPrepare2::
    call func_001_4DA6
    call func_001_4DBE
    jp   IncrementGameplaySubtypeAndReturn

FileSelectionPrepare3::
    call func_001_4DD6
    jp   IncrementGameplaySubtypeAndReturn

CopyDeathCountsToBG::
    ld   a, [wSaveFilesCount]
    and  $01
    jr   z, .file2

    ld   a, [wFile1DeathCountHigh]
    ld   h, a
    ld   a, [wFile1DeathCountLow]
    ld   l, a
    ld   de, vBGMap0 + $00E7
    call CopyDigitsToFileScreenBG

.file2
    ld   a, [wSaveFilesCount]
    and  $02
    jr   z, .file3

    ld   a, [wFile2DeathCountHigh]
    ld   h, a
    ld   a, [wFile2DeathCountLow]
    ld   l, a
    ld   de, vBGMap0 + $0147
    call CopyDigitsToFileScreenBG

.file3
    ld   a, [wSaveFilesCount]
    and  $04
    jr   z, .return

    ld   a, [wFile3DeathCountHigh]
    ld   h, a
    ld   a, [wFile3DeathCountLow]
    ld   l, a
    ld   de, vBGMap0 + $01A7
    call CopyDigitsToFileScreenBG

.return
    jp   IncrementGameplaySubtypeAndReturn
    ; Unused
    ret

FileSelectionPrepare5::
    jp   FileDeletionState4Handler

func_4852::
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

.loop
    ldh  [hScratch0], a
    ld   a, [de]
    and  a
    ld   a, $7E
    jr   z, .skipDE
    ld   a, [de]
    dec  a
    push bc
    push hl
    ld   c, a
    ld   b, $00
    call ReadTileValueFromAsciiTable
    pop  hl
    pop  bc
.skipDE

    ldi  [hl], a
    inc  de
    ldh  a, [hScratch0]
    dec  a
    jr   nz, .loop
    ld   a, b
    ldi  [hl], a
    ld   a, c
    sub  a, $20
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    pop  de
    ld   a, $05

jr_001_4894::
    ldh  [hScratch0], a
    ld   a, [de]
    and  a
    jr   jr_001_489D
    dec  a
    and  $C0

jr_001_489D::
    ld   a, $7E
    jr   jr_001_48A9
    ld   a, [de]
    and  $80
    ld   a, $C8
    jr   z, jr_001_48A9
    inc  a

jr_001_48A9::
    ldi  [hl], a
    inc  de
    ldh  a, [hScratch0]
    dec  a
    jr   nz, jr_001_4894
    xor  a
    ld   [hl], a
    ret

FileSelectionPrepare6::
    ; If the music track should set overriden…
    ld   a, [wForceFileSelectionScreenMusic]
    and  a
    jr   z, .dontForceMusicTrack
    ; … clear the flag…
    xor  a
    ld   [wForceFileSelectionScreenMusic], a
    ; … and set the music to the file menu selection track
    ld   a, MUSIC_FILE_SELECT
    ld   [wMusicTrackToPlay], a
.dontForceMusicTrack

    ; If there are no saved files yet…
    ld   a, [wSaveFilesCount]
    and  a
    ; … use background map 3,
    ld   a, $03
    jr   z, .BGMapEnd
    ; else use background map 4.
    ld   a, $04
.BGMapEnd

    ; Load background and palette
    ld   [wBGMapToLoad], a
    ld   a, $E4
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E4
    ld   [wOBJ1Palette], a
    call LoadFileMenuBG_trampoline
    jp   IncrementGameplaySubtypeAndReturn

Data_001_48E4::
    dec  sp
    ld   d, e
    ld   l, e
    add  a, e

FileSelectionInteractiveHandler::
    call func_001_6BA8
    ldh  a, [hJoypadState]
    and  $90
    jr   z, jr_001_48F4
    jp   IncrementGameplaySubtypeAndReturn

jr_001_48F4::
    ldh  a, [hJoypadState]
    and  $0C
    jr   z, jr_001_4920
    ld   c, $02
    ld   a, [wSaveFilesCount]
    and  a
    jr   z, jr_001_4903
    inc  c

jr_001_4903::
    ldh  a, [hJoypadState]
    bit  2, a
    jr   nz, jr_001_4915
    ld   a, [wSaveSlot]
    add  a, $01
    inc  c
    cp   c
    jr   c, jr_001_491D
    xor  a
    jr   jr_001_491D

jr_001_4915::
    ld   a, [wSaveSlot]
    sub  a, $01
    jr   nc, jr_001_491D
    ld   a, c

jr_001_491D::
    ld   [wSaveSlot], a

jr_001_4920::
    ld   a, [wSaveSlot]
    cp   $03
    jr   nz, func_001_4954
    ldh  a, [hJoypadState]
    and  $03
    jr   z, jr_001_4938
    call func_001_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

jr_001_4938::
    ldh  a, [hFrameCounter]
    and  $10
    jr   nz, func_001_4954
    ld   a, [$D000]
    and  a
    ld   a, $2C
    jr   z, jr_001_4948
    ld   a, $64

jr_001_4948::
    ld   hl, $C008
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

func_001_4954::
    ld   a, [wSaveSlot]
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_48E4
    add  hl, de
    ldh  a, [hFrameCounter]
    and  $08
    jr   z, jr_001_497B
    ld   a, [hl]
    ld   hl, wOAMBuffer
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

jr_001_497B::
    ld   a, [hl]
    ld   hl, wOAMBuffer
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

FileSelectionExecuteChoice::
    ; If the COPY or ERASE menu item was selected, handle this.
    ld   a, [wSaveSlot]
    cp   $03
    jr   z, HandleFileSelectionCommand

    ; The player selected an actual save file.
    ld   a, [wSaveSlot]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   c, $05
    ld   hl, $DB80
    add  hl, de

.loop
    ld   a, [hli]
    and  a
    jr   nz, LoadSelectedFile
    dec  c
    jr   nz, .loop

    ; Go to the file new dialog
    xor  a
    ld   [wGameplaySubtype], a
    ld   a, GAMEPLAY_FILE_NEW
    ld   [wGameplayType], a

PlayValidationJingle::
PlayValidationJingleAndReturn::
    ld   a, JINGLE_VALIDATE
    ldh  [hJingle], a
    ret

LoadSelectedFile::
    call PlayValidationJingle

    ld   a, $00
    ld   [wBGPalette], a
    ld   [wOBJ0Palette], a
    ld   [wOBJ1Palette], a
    ld   a, $01
    call ClearFileMenuBG_trampoline

    ld   a, $05
    ld   [wTileMapToLoad], a
    jp   IncrementGameplaySubtypeAndReturn

HandleFileSelectionCommand::
    ; Clear Gameplay Subtype
    xor  a
    ld   [wGameplaySubtype], a
    ; If the arrow is not the COPY item…
    ld   a, [wIsFileSelectionArrowShifted]
    and  a
    ; … go to the File Deletion screen,
    ld   a, GAMEPLAY_FILE_DELETE
    jr   z, .nextScreenEnd
    ; else go to the File Copy screen.
    ld   a, GAMEPLAY_FILE_COPY
.nextScreenEnd

    ; Move to the Game Start stage
    ld   [wGameplayType], a
    jp   PlayValidationJingleAndReturn

; File creation data
Data_001_49F2::
    dec  b
    and  h
    or   d
    and  a
    ld   e, a
    xor  e

Data_001_49F8::
    dec  b
    and  c
    or   d
    and  h
    ld   e, a
    xor  b

; Part of file copy
Data_001_49FE::
    db 0, $A1, $AD, $A4, $5A, $A8

FileSelectionLoadSavedFile::
    jp   LoadSavedFile


; -----------------------------------------------------------------------------
;
; FILE CREATION
; Screen for creating a new file
;
; -----------------------------------------------------------------------------


FileCreationEntryPoint::
    ld   a, [wGameplaySubtype]
    JP_TABLE
._00 dw FileCreationInit1Handler
._01 dw FileCreationInit2Handler
._02 dw FileCreationInteractiveHandler

FileCreationInit1Handler::
    call IncrementGameplaySubtype
    ld   a, $08
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DBA8], a
    ld   [$DBA9], a
    ld   [$DBAA], a
    ret

FileCreationInit2Handler::
    ld   a, $05
    ld   [wBGMapToLoad], a
    ld   hl, $D601
    ld   a, $98
    ldi  [hl], a
    ld   a, $49
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, [wSaveSlot]
    add  a, $AB
    ldi  [hl], a
    xor  a
    ld   [hl], a
    jp   IncrementGameplaySubtypeAndReturn

; Write a single byte to the save file.
; Inputs:
;   hl   address of the save file start
;   bc   offset
;   a    value to write
WriteByteToExternalRAM::
    push hl
    add  hl, bc
    call EnableExternalRAMWriting
    ld   [hl], a
    pop  hl
    ret

label_4A47::
    ld   bc, DebugSaveFileData
    ld   e, DEBUG_SAVE_FILE_SIZE
    push hl

jr_001_4A4D::
    call EnableExternalRAMWriting
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    ld   a, e
    and  a
    jr   nz, jr_001_4A4D
    pop  hl
    ld   bc, $4E
    ld   a, $01
    call WriteByteToExternalRAM
    ld   bc, $44
    call WriteByteToExternalRAM
    ld   bc, $43
    ld   a, $02
    call WriteByteToExternalRAM
    ld   bc, $4D
    ld   a, $59
    call WriteByteToExternalRAM
    ld   bc, $77
    call WriteByteToExternalRAM
    ld   bc, $78
    call WriteByteToExternalRAM
    ld   bc, $45
    call WriteByteToExternalRAM
    ld   bc, $76
    ld   a, $39
    call WriteByteToExternalRAM
    ld   bc, $4C
    call WriteByteToExternalRAM
    ret

Data_001_4A98::
    db   $00, $05, $0A

FileCreationInteractiveHandler::
    ld   a, [wSaveSlot]
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_4A98
    add  hl, de
    ld   e, [hl]
    ld   hl, $DB80
    add  hl, de
    ld   e, l
    ld   d, h
    ld   bc, $984A
    call func_4852

    ldh  a, [hJoypadState]
    and  J_START
    jr   z, jr_001_4B29
    call PlayValidationJingle
    ld   a, [wSaveSlot]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_49F2
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    push hl
    ld   de, $4F
    add  hl, de
    push hl
    ld   a, [wSaveSlot]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $DB80
    add  hl, de
    ; Checks if the chosen name is 'ZELDA' and plays the easter egg music if this is the case.
    ld   a, [hli]
    cp   "Z" + $01
    jr   nz, jr_001_4AFE
    ld   a, [hli]
    cp   "E" + $01
    jr   nz, jr_001_4AFE
    ld   a, [hli]
    cp   "L" + $01
    jr   nz, jr_001_4AFE
    ld   a, [hli]
    cp   "D" + $01
    jr   nz, jr_001_4AFE
    ld   a, [hli]
    cp   "A" + $01
    jr   nz, jr_001_4AFE
    ld   a, MUSIC_ZELDA_NICKNAME_EASTER_EGG
    ld   [wMusicTrackToPlay], a

jr_001_4AFE::
    ld   hl, $DB80
    add  hl, de
    pop  bc
    ld   e, $05

jr_001_4B05::
    call EnableExternalRAMWriting
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, jr_001_4B05
    pop  hl
    push hl
    ld   de, $5A
    add  hl, de
    ld   [hl], $18  ; write new save current health
    pop  hl
    push hl
    ld   de, $5B
    add  hl, de

Data_001_4B1C::
    ld   [hl], $03  ; write new save max health
    pop  hl
    ld   de, $57
    add  hl, de
    xor  a
    ldi  [hl], a
    ld   [hl], a
    jp   label_001_4555

jr_001_4B29::
    call func_001_4BF5
    call func_001_4C8A
    ret

Data_001_4B30::
    db   $38, $38, $38, $38, $38, $38, $38, $38   ; $4B30
    db   $38, $38, $38, $38, $38, $38, $38, $38   ; $4B38
    db   $48, $48, $48, $48, $48, $48, $48, $48   ; $4B40
    db   $48, $48, $48, $48, $48, $48, $48, $48   ; $4B48
    db   $58, $58, $58, $58, $58, $58, $58, $58   ; $4B50
    db   $58, $58, $58, $58, $58, $58, $58, $58   ; $4B58
    db   $68, $68, $68, $68, $68, $68, $68, $68   ; $4B60
    db   $68, $68, $68, $68, $68, $68, $68, $68   ; $4B68

Data_001_4B70::
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B70
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B78
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B80
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B88
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4B90
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4B98
    db   $14, $1C, $24, $2C, $34, $3C, $44, $4C   ; $4BA0
    db   $54, $5C, $64, $6C, $74, $7C, $84, $8C   ; $4BA8

Data_001_4BB0::
    db   $4C, $54, $5C, $64, $6C                  ; $4BB0

NameEntryCharacterTable::
    ; Used to translate cursor position -> name letter
    ; on the name entry menu. Does not actually represent
    ; the graphics - this is just the letter that is chosen
    ; when you push A
    PUSHC
    SETCHARMAP NameEntryCharmap
    db   "ABCDEFG",  0,0, "abcdefg"
    db   "HIJKLMN",  0,0, "hijklmn"
    db   "OPQRSTU",  0,0, "opqrstu"
    db   "VWXYZ",0,0,0,0, "vwxyz",0,0
    POPC

func_001_4BF5::
    ldh  a, [hJoypadState]

jr_001_4BF7::
    ldh  [hScratch0], a
    ldh  a, [hScratch0]
    and  $0C
    jr   nz, jr_001_4C41
    ldh  a, [hScratch0]
    and  $03
    jr   nz, jr_001_4C21
    ldh  a, [hPressedButtonsMask]
    ld   hl, $C182
    and  $0F
    jr   nz, jr_001_4C12
    xor  a
    ld   [hl], a
    jr   jr_001_4C1F

jr_001_4C12::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, jr_001_4C1F
    ld   [hl], $15
    ldh  a, [hPressedButtonsMask]
    jr   jr_001_4BF7

jr_001_4C1F::
    jr   jr_001_4C63

jr_001_4C21::
    call func_001_6BAE
    bit  1, a
    jr   nz, jr_001_4C34
    ld   a, [$DBA9]
    add  a, $01
    cp   $40
    jr   c, jr_001_4C5E
    xor  a
    jr   jr_001_4C5E

jr_001_4C34::
    ld   a, [$DBA9]
    sub  a, $01
    cp   $FF
    jr   nz, jr_001_4C5E
    ld   a, $3F
    jr   jr_001_4C5E

jr_001_4C41::
    call func_001_6BAE
    bit  2, a
    jr   z, jr_001_4C53
    ld   a, [$DBA9]
    sub  a, $10
    jr   nc, jr_001_4C5E
    add  a, $40
    jr   jr_001_4C5E

jr_001_4C53::
    ld   a, [$DBA9]
    add  a, $10
    cp   $40
    jr   c, jr_001_4C5E
    sub  a, $40

jr_001_4C5E::
    ld   [$DBA9], a
    jr   jr_001_4C63

jr_001_4C63::
    ld   a, [$DBA9]
    ld   hl, Data_001_4B70
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ld   a, [$DBA9]
    ld   hl, Data_001_4B30
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   d, [hl]
    ld   hl, wOAMBuffer
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

func_001_4C8A::                            ; "Enter Name" screen
    ldh  a, [hJoypadState]              ; Check inputs...
    and  J_A | J_B                      ; Was A or B pushed?
    jr   z, jr_001_4CB7                  ; If no, bail
    bit  5, a                           ; Was B pushed?
    jr   nz, jr_001_4CA7                 ; If yes, backspace
    call PlayValidationJingle           ; Otherwise, A was pushed
    call func_001_4CDA                     ; so add the current letter
    ld   a, [$DBAA]
    add  a, $01
    cp   $05                            ; Prevent cursor from going > 5th place
    jr   c, jr_001_4CB4
    ld   a, $04
    jr   jr_001_4CB4

jr_001_4CA7::
    ; B button when inputting filename
    call PlayValidationJingle
    ld   a, [$DBAA]
    sub  a, $01
    cp   $FF
    jr   nz, jr_001_4CB4
    xor  a                              ; Prevent cursor from going < 1st place

jr_001_4CB4::
    ld   [$DBAA], a

jr_001_4CB7::
    ld   a, [$DBAA]
    ld   hl, Data_001_4BB0
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ldh  a, [hFrameCounter]
    and  $10
    jr   z, .return
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

.return
    ret

func_001_4CDA::
    ld   a, [$DBA9]
    ld   c, a
    ld   b, $00
    ld   hl, NameEntryCharacterTable
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   a, [wSaveSlot]
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


; -----------------------------------------------------------------------------
;
; FILE DELETION
; Screen for deleting a file
;
; -----------------------------------------------------------------------------


FileDeletionEntryPoint::
    call func_5DC0                                ; $4CFB: $CD $C0 $5D
    ld   a, [wGameplaySubtype]                    ; $4CFE: $FA $96 $DB
    JP_TABLE                                      ; $4D01
._00 dw FileDeletionState0Handler
._01 dw FileDeletionState1Handler
._02 dw FileDeletionState2Handler
._03 dw FileDeletionState3Handler
._04 dw FileDeletionState4Handler
._05 dw FileDeletionState5Handler
._06 dw FileDeletionState6Handler
._07 dw FileDeletionState7Handler
._08 dw FileDeletionState8Handler
._09 dw FileDeletionState9Handler
._0A dw FileDeletionState10Handler
._0B dw FileDeletionState11Handler

FileDeletionState0Handler::
    ldh  a, [hIsGBC]                              ; $4D1A: $F0 $FE
    and  a                                        ; $4D1C: $A7
    jr   z, jr_001_4D53                            ; $4D1D: $28 $34

    ld   a, $01                                   ; $4D1F: $3E $01
    call ClearFileMenuBG_trampoline               ; $4D21: $CD $FA $08
    ld   a, $01                                   ; $4D24: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D26: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D29: $C3 $D6 $44

FileDeletionState1Handler::
    ldh  a, [hIsGBC]                              ; $4D2C: $F0 $FE
    and  a                                        ; $4D2E: $A7
    jr   z, jr_001_4D53                            ; $4D2F: $28 $22

    ld   a, $02                                   ; $4D31: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D33: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D36: $C3 $D6 $44

FileDeletionState8Handler::
    ldh  a, [hIsGBC]                              ; $4D39: $F0 $FE
    and  a                                        ; $4D3B: $A7
    jr   z, jr_001_4D53                            ; $4D3C: $28 $15

    call LoadFileMenuBG_trampoline                ; $4D3E: $CD $05 $09
    ld   a, $01                                   ; $4D41: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4D43: $EA $D1 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $4D46: $C3 $D6 $44

FileDeletionState9Handler::
    ldh  a, [hIsGBC]                              ; $4D49: $F0 $FE
    and  a                                        ; $4D4B: $A7
    jr   z, jr_001_4D53                            ; $4D4C: $28 $05

    ld   a, $02                                   ; $4D4E: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4D50: $EA $D1 $DD

jr_001_4D53::
    jp   IncrementGameplaySubtypeAndReturn        ; $4D53: $C3 $D6 $44

FileDeletionState2Handler::
    ld   a, $08                                   ; $4D56: $3E $08
    ld   [wTileMapToLoad], a                      ; $4D58: $EA $FE $D6
    xor  a                                        ; $4D5B: $AF
    ld   [wSaveSlot], a                           ; $4D5C: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4D5F: $EA $00 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4D62: $C3 $D6 $44

FileDeletionState3Handler::
    ld   a, $06                                   ; $4D65: $3E $06
    ld   [wBGMapToLoad], a                        ; $4D67: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4D6A: $C3 $D6 $44

FileDeletionState4Handler::
    call func_001_4D8B                               ; $4D6D: $CD $8B $4D
    call func_001_4D94                               ; $4D70: $CD $94 $4D
    call func_001_4D9D                               ; $4D73: $CD $9D $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D76: $C3 $D6 $44

FileDeletionState5Handler::
    call func_001_4DA6                               ; $4D79: $CD $A6 $4D
    call func_001_4DBE                               ; $4D7C: $CD $BE $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D7F: $C3 $D6 $44

FileDeletionState6Handler::
    call func_001_4DD6                               ; $4D82: $CD $D6 $4D
    jp   IncrementGameplaySubtypeAndReturn        ; $4D85: $C3 $D6 $44

FileDeletionState7Handler::
    jp   CopyDeathCountsToBG                      ; $4D88: $C3 $0C $48

func_001_4D8B::
    ld   bc, $98C5                                ; $4D8B: $01 $C5 $98
    ld   de, $DB80                                ; $4D8E: $11 $80 $DB
    jp   func_4852                                ; $4D91: $C3 $52 $48

func_001_4D94::
    ld   bc, $9925                                ; $4D94: $01 $25 $99
    ld   de, $DB85                                ; $4D97: $11 $85 $DB
    jp   func_4852                                ; $4D9A: $C3 $52 $48

func_001_4D9D::
    ld   bc, $9985                                ; $4D9D: $01 $85 $99
    ld   de, $DB8A                                ; $4DA0: $11 $8A $DB
    jp   func_4852                                ; $4DA3: $C3 $52 $48

func_001_4DA6::
    ld   a, [wSaveFilesCount]                     ; $4DA6: $FA $A7 $DB
    and  $01                                      ; $4DA9: $E6 $01
    ret z

    xor a
   ld hl, $dc06                                  ; $4db0: $21 $06 $dc
    ld de, $dc09                                  ; $4db3: $11 $09 $dc
jr_001_4db6:
    ldh [hScratch4], a                            ; $4db6: $e0 $db
    ld a, [hl]                                    ; $4db8: $7e
    ldh [hScratch2], a                            ; $4db9: $e0 $d9
    ld a, [de]                                    ; $4dbb: $1a
    cp $03                                        ; $4dbc: $fe $03
    jr nc, jr_001_4dc2                            ; $4dbe: $30 $02
jr_001_4DBD::
    ld a, $03                                     ; $4dc0: $3e $03

jr_001_4dc2:
    cp $0e                                        ; $4dc2: $fe $0e
    jr c, jr_001_4dc8                             ; $4dc4: $38 $02

    ld a, $0e                                     ; $4dc6: $3e $0e

jr_001_4dc8:
    ld [de], a                                    ; $4dc8: $12
    ldh [hScratch3], a                            ; $4dc9: $e0 $da
    swap a                                        ; $4dcb: $cb $37
    srl a                                         ; $4dcd: $cb $3f
    cp [hl]                                       ; $4dcf: $be
    jp nc, label_001_5D53                            ; $4dd0: $d2 $8b $5d

    ld [hl], a                                    ; $4dd3: $77
    ldh [hScratch2], a                            ; $4dd4: $e0 $d9
    jp label_001_5D53                                ; $4dd6: $c3 $8b $5d


func_001_4DBE::
    ld   a, [wSaveFilesCount]                     ; $4DBE: $FA $A7 $DB
    and  $02                                      ; $4DC1: $E6 $02
    ret z

    ld a, $01
    ld hl, $dc07
    ld de, $dc0a
    jr jr_001_4db6

func_001_4DD6::
    ld   a, [wSaveFilesCount]                     ; $4DD6: $FA $A7 $DB
    and  $04                                      ; $4DD9: $E6 $04
    ret z

    ld a, $02
    ld hl, $dc08                                  ; $4df1: $21 $08 $dc
    ld de, $dc0b                                  ; $4df4: $11 $0b $dc
    jr jr_001_4db6                                ; $4df7: $18 $bd

Data_001_4DEE::
    db   $98, $A5, $44, $7E, $98, $C5, $44, $7E   ; $4DEE
    db   $99, $05, $44, $7E, $99, $25, $44, $7E   ; $4DF6
    db   $99, $65, $44, $7E, $99, $85, $44, $7E   ; $4DFE

FileDeletionState10Handler::
    call func_001_6BA8                               ; $4E06: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $4E09: $F0 $CC
    and  $08                                      ; $4E0B: $E6 $08
    jr   z, jr_001_4E18                            ; $4E0D: $28 $09

    ld   a, [wSaveSlot]                           ; $4E0F: $FA $A6 $DB
    inc  a                                        ; $4E12: $3C
    and  $03                                      ; $4E13: $E6 $03
    ld   [wSaveSlot], a                           ; $4E15: $EA $A6 $DB

jr_001_4E18::
    ldh  a, [hJoypadState]                        ; $4E18: $F0 $CC
    and  $04                                      ; $4E1A: $E6 $04
    jr   z, jr_001_4E2B                            ; $4E1C: $28 $0D

    ld   a, [wSaveSlot]                           ; $4E1E: $FA $A6 $DB
    dec  a                                        ; $4E21: $3D
    cp   $FF                                      ; $4E22: $FE $FF
    jr   nz, jr_001_4E28                           ; $4E24: $20 $02

    ld   a, $03                                   ; $4E26: $3E $03

jr_001_4E28::
    ld   [wSaveSlot], a                           ; $4E28: $EA $A6 $DB

jr_001_4E2B::
    ldh  a, [hJoypadState]                        ; $4E2B: $F0 $CC
    and  $90                                      ; $4E2D: $E6 $90
    jr   z, jr_001_4E67                            ; $4E2F: $28 $36

    ld   a, [wSaveSlot]                           ; $4E31: $FA $A6 $DB
    cp   $03                                      ; $4E34: $FE $03
    jr   nz, jr_001_4E3B                           ; $4E36: $20 $03

    jp   label_001_4555                               ; $4E38: $C3 $55 $45

jr_001_4E3B::
    call PlayValidationJingleAndReturn            ; $4E3B: $CD $BE $49
    call IncrementGameplaySubtype                 ; $4E3E: $CD $D6 $44
    jr   label_001_4E55                               ; $4E41: $18 $12

Data_001_4E43::
    db   $99, $E4, $0D, $7E, $7E, $10, $14, $08   ; $4E43
    db   $13, $7E, $7E, $7E, $7E, $0E, $0A, $7E   ; $4E4B
    db   $7E, $00                                 ; $4E53

label_001_4E55::
    ld   hl, wRequestDestinationHigh              ; $4E55: $21 $01 $D6
    ld   de, Data_001_4E43                        ; $4E58: $11 $43 $4E
    ld   c, $11                                   ; $4E5B: $0E $11

.loop
    ld   a, [de]                                  ; $4E5D: $1A
    inc  de                                       ; $4E5E: $13
    ld   [hl+], a                                 ; $4E5F: $22
    dec  c                                        ; $4E60: $0D
    ld   a, c                                     ; $4E61: $79
    cp   $FF                                      ; $4E62: $FE $FF
    jr   nz, .loop                                ; $4E64: $20 $F7

    ret                                           ; $4E66: $C9

jr_001_4E67::
    call func_001_4954                               ; $4E67: $CD $54 $49
    ret                                           ; $4E6A: $C9

FileDeletionState11Handler::
    ldh  a, [hJoypadState]                        ; $4E6B: $F0 $CC
    bit  5, a                                     ; $4E6D: $CB $6F
    jr   nz, jr_001_4E9E                           ; $4E6F: $20 $2D

    and  $90                                      ; $4E71: $E6 $90
    jr   z, jr_001_4ED9                            ; $4E73: $28 $64

    ld   a, [wCreditsScratch0]                    ; $4E75: $FA $00 $D0
    and  a                                        ; $4E78: $A7
    jp   z, label_001_4555                            ; $4E79: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $4E7C: $CD $BE $49
    ld   a, [wSaveSlot]                           ; $4E7F: $FA $A6 $DB
    sla  a                                        ; $4E82: $CB $27
    ld   e, a                                     ; $4E84: $5F
    ld   d, $00                                   ; $4E85: $16 $00
    ld   hl, Data_001_49F8                           ; $4E87: $21 $F8 $49
    add  hl, de                                   ; $4E8A: $19
    ld   a, [hl+]                                 ; $4E8B: $2A
    ld   h, [hl]                                  ; $4E8C: $66
    ld   l, a                                     ; $4E8D: $6F
    ld   de, $3a8                                 ; $4E8E: $11 $A8 $03

jr_001_4E91::
    call EnableExternalRAMWriting                 ; $4E91: $CD $D0 $27
    xor  a                                        ; $4E94: $AF
    ld   [hl+], a                                 ; $4E95: $22
    dec  de                                       ; $4E96: $1B
    ld   a, e                                     ; $4E97: $7B
    or   d                                        ; $4E98: $B2
    jr   nz, jr_001_4E91                           ; $4E99: $20 $F6

    jp   label_001_4555                               ; $4E9B: $C3 $55 $45

jr_001_4E9E::
    call func_001_4EE5                               ; $4E9E: $CD $E5 $4E
    call func_001_4EBB                               ; $4EA1: $CD $BB $4E
    ld   hl, wGameplaySubtype                     ; $4EA4: $21 $96 $DB
    dec  [hl]                                     ; $4EA7: $35
    ret                                           ; $4EA8: $C9

Data_001_4EA9::
    db   $99, $E4, $0D, $11, $04, $13, $14, $11   ; $4EA9
    db   $0D, $7E, $13, $0E, $7E, $0C, $04, $0D   ; $4EB1
    db   $14, $00                                 ; $4EB9

func_001_4EBB::
    ld   a, [wRequests]                           ; $4EBB: $FA $00 $D6
    ld   e, a                                     ; $4EBE: $5F
    add  $11                                      ; $4EBF: $C6 $11
    ld   [wRequests], a                           ; $4EC1: $EA $00 $D6
    ld   d, $00                                   ; $4EC4: $16 $00
    ld   hl, wRequestDestinationHigh              ; $4EC6: $21 $01 $D6
    add  hl, de                                   ; $4EC9: $19
    ld   de, Data_001_4EA9                        ; $4ECA: $11 $A9 $4E
    ld   c, $11                                   ; $4ECD: $0E $11

.loop
    ld   a, [de]                                  ; $4ECF: $1A
    inc  de                                       ; $4ED0: $13
    ld   [hl+], a                                 ; $4ED1: $22
    dec  c                                        ; $4ED2: $0D
    ld   a, c                                     ; $4ED3: $79
    cp   $FF                                      ; $4ED4: $FE $FF
    jr   nz, .loop                                ; $4ED6: $20 $F7

    ret                                           ; $4ED8: $C9

jr_001_4ED9::
    call func_001_4F0C                               ; $4ED9: $CD $0C $4F
    call func_001_4954                               ; $4EDC: $CD $54 $49
    ldh  a, [hFrameCounter]                       ; $4EDF: $F0 $E7
    and  $10                                      ; $4EE1: $E6 $10
    jr   z, jr_001_4EEF                            ; $4EE3: $28 $0A

func_001_4EE5::
    ld   a, [wSaveSlot]                           ; $4EE5: $FA $A6 $DB
    JP_TABLE                                      ; $4EE8
._00 dw func_001_4D8B                                ; $4EE9
._01 dw func_001_4D94                                ; $4EEB
._02 dw func_001_4D9D                                ; $4EED

jr_001_4EEF::
    ld   a, [wSaveSlot]                           ; $4EEF: $FA $A6 $DB
    rla                                           ; $4EF2: $17
    rla                                           ; $4EF3: $17
    rla                                           ; $4EF4: $17
    and  $F8                                      ; $4EF5: $E6 $F8
    ld   e, a                                     ; $4EF7: $5F
    ld   d, $00                                   ; $4EF8: $16 $00
    ld   hl, Data_001_4DEE                        ; $4EFA: $21 $EE $4D
    add  hl, de                                   ; $4EFD: $19
    ld   de, wRequestDestinationHigh              ; $4EFE: $11 $01 $D6
    ld   c, $08                                   ; $4F01: $0E $08

jr_001_4F03::
    ld   a, [hl+]                                 ; $4F03: $2A
    ld   [de], a                                  ; $4F04: $12
    inc  de                                       ; $4F05: $13
    dec  c                                        ; $4F06: $0D
    jr   nz, jr_001_4F03                           ; $4F07: $20 $FA

    xor  a                                        ; $4F09: $AF
    ld   [de], a                                  ; $4F0A: $12
    ret                                           ; $4F0B: $C9

func_001_4F0C::
    ldh  a, [hJoypadState]                        ; $4F0C: $F0 $CC
    and  $03                                      ; $4F0E: $E6 $03
    jr   z, jr_001_4F1D                            ; $4F10: $28 $0B

    call func_001_6BAE                               ; $4F12: $CD $AE $6B
    ld   a, [wCreditsScratch0]                    ; $4F15: $FA $00 $D0
    xor  $01                                      ; $4F18: $EE $01
    ld   [wCreditsScratch0], a                    ; $4F1A: $EA $00 $D0

jr_001_4F1D::
    ldh  a, [hFrameCounter]                       ; $4F1D: $F0 $E7
    and  $10                                      ; $4F1F: $E6 $10
    jr   nz, jr_001_4F3A                           ; $4F21: $20 $17

    ld   a, [wCreditsScratch0]                    ; $4F23: $FA $00 $D0
    ld   e, a                                     ; $4F26: $5F
    ld   a, $28                                   ; $4F27: $3E $28
    dec  e                                        ; $4F29: $1D
    jr   nz, jr_001_4F2E                           ; $4F2A: $20 $02

    ld   a, $6C                                   ; $4F2C: $3E $6C

jr_001_4F2E::
    ld   hl, $C00C                                ; $4F2E: $21 $0C $C0
    ld   [hl], $88                                ; $4F31: $36 $88
    inc  hl                                       ; $4F33: $23
    ld   [hl+], a                                 ; $4F34: $22
    ld   a, $BE                                   ; $4F35: $3E $BE
    ld   [hl+], a                                 ; $4F37: $22
    xor  a                                        ; $4F38: $AF
    ld   [hl], a                                  ; $4F39: $77

jr_001_4F3A::
    ret                                           ; $4F3A: $C9

Data_001_4F3B::
    db   $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7   ; $4F3B
    db   $B8, $B9                                 ; $4F43

CopyDigitsToFileScreenBG::
    push hl                                       ; $4F45: $E5
    ld   a, [wRequests]                           ; $4F46: $FA $00 $D6
    ld   c, a                                     ; $4F49: $4F
    add  $06                                      ; $4F4A: $C6 $06
    ld   [wRequests], a                           ; $4F4C: $EA $00 $D6
    ld   b, $00                                   ; $4F4F: $06 $00
    ld   hl, wRequestDestinationHigh              ; $4F51: $21 $01 $D6
    add  hl, bc                                   ; $4F54: $09
    ld   a, d                                     ; $4F55: $7A
    ld   [hl+], a                                 ; $4F56: $22
    ld   a, e                                     ; $4F57: $7B
    ld   [hl+], a                                 ; $4F58: $22
    ld   a, $02                                   ; $4F59: $3E $02
    ld   [hl+], a                                 ; $4F5B: $22
    pop  bc                                       ; $4F5C: $C1
    push hl                                       ; $4F5D: $E5
    ld   a, c                                     ; $4F5E: $79
    and  $0F                                      ; $4F5F: $E6 $0F
    ld   e, a                                     ; $4F61: $5F
    ld   d, $00                                   ; $4F62: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F64: $21 $3B $4F
    add  hl, de                                   ; $4F67: $19
    ld   a, [hl]                                  ; $4F68: $7E
    pop  hl                                       ; $4F69: $E1
    ld   [hl+], a                                 ; $4F6A: $22
    push hl                                       ; $4F6B: $E5
    ld   a, b                                     ; $4F6C: $78
    and  $F0                                      ; $4F6D: $E6 $F0
    swap a                                        ; $4F6F: $CB $37
    ld   e, a                                     ; $4F71: $5F
    ld   d, $00                                   ; $4F72: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F74: $21 $3B $4F
    add  hl, de                                   ; $4F77: $19
    ld   a, [hl]                                  ; $4F78: $7E
    pop  hl                                       ; $4F79: $E1
    ld   [hl+], a                                 ; $4F7A: $22
    push hl                                       ; $4F7B: $E5
    ld   a, b                                     ; $4F7C: $78
    and  $0F                                      ; $4F7D: $E6 $0F
    ld   e, a                                     ; $4F7F: $5F
    ld   d, $00                                   ; $4F80: $16 $00
    ld   hl, Data_001_4F3B                        ; $4F82: $21 $3B $4F
    add  hl, de                                   ; $4F85: $19
    ld   a, [hl]                                  ; $4F86: $7E
    pop  hl                                       ; $4F87: $E1
    ld   [hl+], a                                 ; $4F88: $22
    xor  a                                        ; $4F89: $AF
    ld   [hl], a                                  ; $4F8A: $77
    ret                                           ; $4F8B: $C9


; -----------------------------------------------------------------------------
;
; FILE COPY
; Screen for copying a saved file
;
; -----------------------------------------------------------------------------


FileCopyEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $4F8C: $FA $96 $DB
    JP_TABLE
._00 dw FileDeletionState0Handler
._01 dw FileDeletionState1Handler
._02 dw FileCopyState2Handler
._03 dw FileCopyState3Handler
._04 dw FileCopyState4Handler
._05 dw FileCopyState5Handler
._06 dw FileDeletionState8Handler
._07 dw FileDeletionState9Handler
._08 dw FileCopyState8Handler
._09 dw FileCopyState9Handler
._0A dw FileCopyStateAHandler

FileCopyState2Handler::
    ld   a, $08                                   ; $4FA6: $3E $08
    ld   [wTileMapToLoad], a                      ; $4FA8: $EA $FE $D6
    xor  a                                        ; $4FAB: $AF
    ld   [wSaveSlot], a                           ; $4FAC: $EA $A6 $DB
    ld   [wCreditsScratch0], a                    ; $4FAF: $EA $00 $D0
    ld   [wIntroTimer], a                         ; $4FB2: $EA $01 $D0
    ld   [wIntroSubTimer], a                      ; $4FB5: $EA $02 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $4FB8: $C3 $D6 $44

FileCopyState3Handler::
    ld   a, $0C                                   ; $4FBB: $3E $0C
    ld   [wBGMapToLoad], a                        ; $4FBD: $EA $FF $D6
    jp   IncrementGameplaySubtypeAndReturn        ; $4FC0: $C3 $D6 $44

FileCopyState4Handler::
    ld   bc, $98C4                                ; $4FC3: $01 $C4 $98
    ld   de, $DB80                                ; $4FC6: $11 $80 $DB
    call func_4852                                ; $4FC9: $CD $52 $48
    ld   bc, $9924                                ; $4FCC: $01 $24 $99
    ld   de, $DB85                                ; $4FCF: $11 $85 $DB
    call func_4852                                ; $4FD2: $CD $52 $48
    ld   bc, $9984                                ; $4FD5: $01 $84 $99
    ld   de, $DB8A                                ; $4FD8: $11 $8A $DB
    call func_4852                                ; $4FDB: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FDE: $C3 $D6 $44

FileCopyState5Handler::
    ld   bc, $98CD                                ; $4FE1: $01 $CD $98
    ld   de, $DB80                                ; $4FE4: $11 $80 $DB
    call func_4852                                ; $4FE7: $CD $52 $48
    ld   bc, $992D                                ; $4FEA: $01 $2D $99
    ld   de, $DB85                                ; $4FED: $11 $85 $DB
    call func_4852                                ; $4FF0: $CD $52 $48
    ld   bc, $998D                                ; $4FF3: $01 $8D $99
    ld   de, $DB8A                                ; $4FF6: $11 $8A $DB
    call func_4852                                ; $4FF9: $CD $52 $48
    jp   IncrementGameplaySubtypeAndReturn        ; $4FFC: $C3 $D6 $44

FileCopyState8Handler::
    call func_001_6BA8                               ; $4FFF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $5002: $F0 $CC
    and  $08                                      ; $5004: $E6 $08
    jr   z, jr_001_500E                            ; $5006: $28 $06

    ld   a, [wIntroTimer]                         ; $5008: $FA $01 $D0
    inc  a                                        ; $500B: $3C
    jr   jr_001_5018                               ; $500C: $18 $0A

jr_001_500E::
    ldh  a, [hJoypadState]                        ; $500E: $F0 $CC
    and  $04                                      ; $5010: $E6 $04
    jr   z, jr_001_501D                            ; $5012: $28 $09

    ld   a, [wIntroTimer]                         ; $5014: $FA $01 $D0
    dec  a                                        ; $5017: $3D

jr_001_5018::
    and  $03                                      ; $5018: $E6 $03
    ld   [wIntroTimer], a                         ; $501A: $EA $01 $D0

jr_001_501D::
    ldh  a, [hJoypadState]                        ; $501D: $F0 $CC
    and  $90                                      ; $501F: $E6 $90
    jr   z, jr_001_5055                            ; $5021: $28 $32

    ld   a, [wIntroTimer]                         ; $5023: $FA $01 $D0
    cp   $03                                      ; $5026: $FE $03
    jp   z, label_001_4555                            ; $5028: $CA $55 $45

    ld   hl, $DB80                                ; $502B: $21 $80 $DB
    ld   b, $00                                   ; $502E: $06 $00
    ld   a, [wIntroTimer]                         ; $5030: $FA $01 $D0
    and  a                                        ; $5033: $A7
    jr   z, jr_001_5042                            ; $5034: $28 $0C

    cp   $01                                      ; $5036: $FE $01
    jr   z, jr_001_503F                            ; $5038: $28 $05

    ld   hl, $DB8A                                ; $503A: $21 $8A $DB
    jr   jr_001_5042                               ; $503D: $18 $03

jr_001_503F::
    ld   hl, $DB85                                ; $503F: $21 $85 $DB

jr_001_5042::
    xor  a                                        ; $5042: $AF
    or  [hl]                                     ; $5043: $86
    inc  hl                                       ; $5044: $23
    or  [hl]                                     ; $5045: $86
    inc  hl                                       ; $5046: $23
    or  [hl]                                     ; $5047: $86
    inc  hl                                       ; $5048: $23
    or  [hl]                                     ; $5049: $86
    inc  hl                                       ; $504A: $23
    or  [hl]                                     ; $504B: $86
    and  a                                        ; $504C: $A7
    jr   z, jr_001_5055                            ; $504D: $28 $06

    call IncrementGameplaySubtype                 ; $504F: $CD $D6 $44
    call PlayValidationJingleAndReturn            ; $5052: $CD $BE $49

jr_001_5055::
    ld   a, [wIntroTimer]                         ; $5055: $FA $01 $D0
    ld   e, a                                     ; $5058: $5F
    ld   d, $00                                   ; $5059: $16 $00
    ld   hl, Data_001_48E4                           ; $505B: $21 $E4 $48
    add  hl, de                                   ; $505E: $19
    ldh  a, [hFrameCounter]                       ; $505F: $F0 $E7
    and  $08                                      ; $5061: $E6 $08
    ld   a, [hl]                                  ; $5063: $7E
    ld   hl, wLinkOAMBuffer                       ; $5064: $21 $00 $C0

label_001_5067::
    jr   z, jr_001_507D                            ; $5067: $28 $14

    push af                                       ; $5069: $F5
    ld   [hl+], a                                 ; $506A: $22
    ld   a, $10                                   ; $506B: $3E $10
    ld   [hl+], a                                 ; $506D: $22
    xor  a                                        ; $506E: $AF
    ld   [hl+], a                                 ; $506F: $22
    ld   [hl+], a                                 ; $5070: $22
    pop  af                                       ; $5071: $F1
    ld   [hl+], a                                 ; $5072: $22
    ld   a, $18                                   ; $5073: $3E $18
    ld   [hl+], a                                 ; $5075: $22
    ld   a, $02                                   ; $5076: $3E $02
    ld   [hl+], a                                 ; $5078: $22
    ld   a, $00                                   ; $5079: $3E $00
    ld   [hl], a                                  ; $507B: $77
    ret                                           ; $507C: $C9

jr_001_507D::
    push af                                       ; $507D: $F5
    ld   [hl+], a                                 ; $507E: $22
    ld   a, $10                                   ; $507F: $3E $10
    ld   [hl+], a                                 ; $5081: $22
    ld   a, $02                                   ; $5082: $3E $02
    ld   [hl+], a                                 ; $5084: $22
    ld   a, $20                                   ; $5085: $3E $20
    ld   [hl+], a                                 ; $5087: $22
    pop  af                                       ; $5088: $F1
    ld   [hl+], a                                 ; $5089: $22
    ld   a, $18                                   ; $508A: $3E $18
    ld   [hl+], a                                 ; $508C: $22
    ld   a, $00                                   ; $508D: $3E $00
    ld   [hl+], a                                 ; $508F: $22
    ld   a, $20                                   ; $5090: $3E $20
    ld   [hl], a                                  ; $5092: $77
    ret                                           ; $5093: $C9

func_001_5094::
    ld   a, [wIntroTimer]                         ; $5094: $FA $01 $D0
    ld   e, a                                     ; $5097: $5F
    ld   d, $00                                   ; $5098: $16 $00
    ld   hl, Data_001_48E4                           ; $509A: $21 $E4 $48
    add  hl, de                                   ; $509D: $19
    ld   a, [hl]                                  ; $509E: $7E
    ld   hl, wLinkOAMBuffer                       ; $509F: $21 $00 $C0
    add  $05                                      ; $50A2: $C6 $05
    ld   [hl+], a                                 ; $50A4: $22
    ld   a, $14                                   ; $50A5: $3E $14
    ld   [hl+], a                                 ; $50A7: $22
    ld   a, $BE                                   ; $50A8: $3E $BE
    ld   [hl+], a                                 ; $50AA: $22
    ld   a, $00                                   ; $50AB: $3E $00
    ld   [hl], a                                  ; $50AD: $77
    ret                                           ; $50AE: $C9

Data_001_50AF::
    db   $98, $A4, $44, $7E, $98, $C4, $44, $7E   ; $50AF
    db   $99, $04, $44, $7E, $99, $24, $44, $7E   ; $50B7
    db   $99, $64, $44, $7E, $99, $84, $44, $7E   ; $50BF

Data_001_50C7::
    db   $98, $AD, $44, $7E, $98, $CD, $44, $7E   ; $50C7
    db   $99, $0D, $44, $7E, $99, $2D, $44, $7E   ; $50CF
    db   $99, $6D, $44, $7E, $99, $8D, $44, $7E   ; $50D7

FileCopyState9Handler::
    call func_001_6BA8                               ; $50DF: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $50E2: $F0 $CC
    and  $08                                      ; $50E4: $E6 $08
    jr   z, jr_001_50F1                            ; $50E6: $28 $09

    ld   a, [wIntroSubTimer]                      ; $50E8: $FA $02 $D0
    inc  a                                        ; $50EB: $3C
    and  $03                                      ; $50EC: $E6 $03
    ld   [wIntroSubTimer], a                      ; $50EE: $EA $02 $D0

jr_001_50F1::
    ldh  a, [hJoypadState]                        ; $50F1: $F0 $CC
    and  $04                                      ; $50F3: $E6 $04
    jr   z, jr_001_5104                            ; $50F5: $28 $0D

    ld   a, [wIntroSubTimer]                      ; $50F7: $FA $02 $D0
    dec  a                                        ; $50FA: $3D
    cp   $FF                                      ; $50FB: $FE $FF
    jr   nz, jr_001_5101                           ; $50FD: $20 $02

    ld   a, $03                                   ; $50FF: $3E $03

jr_001_5101::
    ld   [wIntroSubTimer], a                      ; $5101: $EA $02 $D0

jr_001_5104::
    call func_001_5094                               ; $5104: $CD $94 $50
    ldh  a, [hJoypadState]                        ; $5107: $F0 $CC
    bit  5, a                                     ; $5109: $CB $6F
    jr   z, jr_001_5114                            ; $510B: $28 $07

    ld   hl, wGameplaySubtype                     ; $510D: $21 $96 $DB
    dec  [hl]                                     ; $5110: $35
    jp   label_001_514F                               ; $5111: $C3 $4F $51

jr_001_5114::
    and  $90                                      ; $5114: $E6 $90
    jr   z, jr_001_5129                            ; $5116: $28 $11

    ld   a, [wIntroSubTimer]                      ; $5118: $FA $02 $D0
    cp   $03                                      ; $511B: $FE $03
    jp   z, label_001_4555                            ; $511D: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $5120: $CD $BE $49
    call IncrementGameplaySubtype                 ; $5123: $CD $D6 $44
    jp   label_001_4E55                               ; $5126: $C3 $55 $4E

jr_001_5129::
    call func_001_5175                               ; $5129: $CD $75 $51

func_001_512C::
    ldh  a, [hFrameCounter]                       ; $512C: $F0 $E7
    and  $10                                      ; $512E: $E6 $10
    jr   z, label_001_514F                            ; $5130: $28 $1D

    ld   a, [wIntroTimer]                         ; $5132: $FA $01 $D0
    rla                                           ; $5135: $17
    rla                                           ; $5136: $17
    rla                                           ; $5137: $17
    and  $F8                                      ; $5138: $E6 $F8
    ld   e, a                                     ; $513A: $5F
    ld   d, $00                                   ; $513B: $16 $00
    ld   hl, Data_001_50AF                        ; $513D: $21 $AF $50
    add  hl, de                                   ; $5140: $19
    ld   de, wRequestDestinationHigh              ; $5141: $11 $01 $D6
    ld   c, $08                                   ; $5144: $0E $08

jr_001_5146::
    ld   a, [hl+]                                 ; $5146: $2A
    ld   [de], a                                  ; $5147: $12
    inc  de                                       ; $5148: $13
    dec  c                                        ; $5149: $0D
    jr   nz, jr_001_5146                           ; $514A: $20 $FA

    xor  a                                        ; $514C: $AF
    ld   [de], a                                  ; $514D: $12
    ret                                           ; $514E: $C9

label_001_514F::
    ld   a, [wIntroTimer]                         ; $514F: $FA $01 $D0
    cp   $01                                      ; $5152: $FE $01
    jr   z, jr_001_5163                            ; $5154: $28 $0D

    cp   $02                                      ; $5156: $FE $02
    jr   z, jr_001_516C                            ; $5158: $28 $12

    ld   bc, $98C4                                ; $515A: $01 $C4 $98
    ld   de, $DB80                                ; $515D: $11 $80 $DB
    jp   func_4852                                ; $5160: $C3 $52 $48

jr_001_5163::
    ld   bc, $9924                                ; $5163: $01 $24 $99
    ld   de, $DB85                                ; $5166: $11 $85 $DB
    jp   func_4852                                ; $5169: $C3 $52 $48

jr_001_516C::
    ld   bc, $9984                                ; $516C: $01 $84 $99
    ld   de, $DB8A                                ; $516F: $11 $8A $DB
    jp   func_4852                                ; $5172: $C3 $52 $48

func_001_5175::
    ld   a, [wIntroSubTimer]                      ; $5175: $FA $02 $D0
    ld   e, a                                     ; $5178: $5F
    ld   d, $00                                   ; $5179: $16 $00
    ld   hl, Data_001_48E4                           ; $517B: $21 $E4 $48
    add  hl, de                                   ; $517E: $19
    ld   a, [wIntroSubTimer]                      ; $517F: $FA $02 $D0
    cp   $03                                      ; $5182: $FE $03
    jp   z, label_001_51C3                            ; $5184: $CA $C3 $51

    ldh  a, [hFrameCounter]                       ; $5187: $F0 $E7
    and  $08                                      ; $5189: $E6 $08
    jr   z, jr_001_51A8                            ; $518B: $28 $1B

    ld   a, [hl]                                  ; $518D: $7E
    ld   hl, $C008                                ; $518E: $21 $08 $C0
    push af                                       ; $5191: $F5
    ld   [hl+], a                                 ; $5192: $22
    ld   a, $58                                   ; $5193: $3E $58
    ld   [hl+], a                                 ; $5195: $22
    ld   a, $00                                   ; $5196: $3E $00
    ld   [hl+], a                                 ; $5198: $22
    ld   a, $00                                   ; $5199: $3E $00
    ld   [hl+], a                                 ; $519B: $22
    pop  af                                       ; $519C: $F1
    ld   [hl+], a                                 ; $519D: $22
    ld   a, $60                                   ; $519E: $3E $60
    ld   [hl+], a                                 ; $51A0: $22
    ld   a, $02                                   ; $51A1: $3E $02
    ld   [hl+], a                                 ; $51A3: $22
    ld   a, $00                                   ; $51A4: $3E $00
    ld   [hl], a                                  ; $51A6: $77
    ret                                           ; $51A7: $C9

jr_001_51A8::
    ld   a, [hl]                                  ; $51A8: $7E
    ld   hl, $C008                                ; $51A9: $21 $08 $C0
    push af                                       ; $51AC: $F5
    ld   [hl+], a                                 ; $51AD: $22
    ld   a, $58                                   ; $51AE: $3E $58
    ld   [hl+], a                                 ; $51B0: $22
    ld   a, $02                                   ; $51B1: $3E $02
    ld   [hl+], a                                 ; $51B3: $22
    ld   a, $20                                   ; $51B4: $3E $20
    ld   [hl+], a                                 ; $51B6: $22
    pop  af                                       ; $51B7: $F1
    ld   [hl+], a                                 ; $51B8: $22
    ld   a, $60                                   ; $51B9: $3E $60
    ld   [hl+], a                                 ; $51BB: $22
    ld   a, $00                                   ; $51BC: $3E $00
    ld   [hl+], a                                 ; $51BE: $22
    ld   a, $20                                   ; $51BF: $3E $20
    ld   [hl], a                                  ; $51C1: $77
    ret                                           ; $51C2: $C9

label_001_51C3::
    ldh  a, [hFrameCounter]                       ; $51C3: $F0 $E7
    and  $08                                      ; $51C5: $E6 $08
    ld   a, [hl]                                  ; $51C7: $7E
    ld   hl, $C008                                ; $51C8: $21 $08 $C0
    jp   label_001_5067                               ; $51CB: $C3 $67 $50

func_001_51CE::
    ld   a, [wIntroSubTimer]                      ; $51CE: $FA $02 $D0
    ld   e, a                                     ; $51D1: $5F
    ld   d, $00                                   ; $51D2: $16 $00
    ld   hl, Data_001_48E4                           ; $51D4: $21 $E4 $48
    add  hl, de                                   ; $51D7: $19
    ld   a, [hl]                                  ; $51D8: $7E
    ld   hl, $C008                                ; $51D9: $21 $08 $C0
    add  $05                                      ; $51DC: $C6 $05
    ld   [hl+], a                                 ; $51DE: $22
    ld   a, $5C                                   ; $51DF: $3E $5C
    ld   [hl+], a                                 ; $51E1: $22
    ld   a, $BE                                   ; $51E2: $3E $BE
    ld   [hl+], a                                 ; $51E4: $22
    ld   a, $00                                   ; $51E5: $3E $00
    ld   [hl], a                                  ; $51E7: $77
    ret                                           ; $51E8: $C9

FileCopyStateAHandler::
    call func_001_5094                               ; $51E9: $CD $94 $50
    call func_001_51CE                               ; $51EC: $CD $CE $51
    call func_001_4F0C                               ; $51EF: $CD $0C $4F
    ldh  a, [hJoypadState]                        ; $51F2: $F0 $CC
    and  $90                                      ; $51F4: $E6 $90
    jr   z, jr_001_5235                            ; $51F6: $28 $3D

    ld   a, [wCreditsScratch0]                    ; $51F8: $FA $00 $D0
    and  a                                        ; $51FB: $A7
    jp   z, label_001_4555                            ; $51FC: $CA $55 $45

    call PlayValidationJingleAndReturn            ; $51FF: $CD $BE $49
    ld   a, [wIntroTimer]                         ; $5202: $FA $01 $D0
    sla  a                                        ; $5205: $CB $27
    ld   e, a                                     ; $5207: $5F
    ld   d, $00                                   ; $5208: $16 $00
    ld   hl, Data_001_49FE                           ; $520A: $21 $FE $49
    add  hl, de                                   ; $520D: $19
    ld   c, [hl]                                  ; $520E: $4E
    inc  hl                                       ; $520F: $23
    ld   b, [hl]                                  ; $5210: $46
    ld   a, [wIntroSubTimer]                      ; $5211: $FA $02 $D0
    sla  a                                        ; $5214: $CB $27
    ld   e, a                                     ; $5216: $5F
    ld   d, $00                                   ; $5217: $16 $00
    ld   hl, Data_001_49FE                           ; $5219: $21 $FE $49
    add  hl, de                                   ; $521C: $19
    ld   a, [hl]                                  ; $521D: $7E
    inc  hl                                       ; $521E: $23
    ld   h, [hl]                                  ; $521F: $66
    ld   l, a                                     ; $5220: $6F
    ld   de, $3ad                                 ; $5221: $11 $AD $03

jr_001_5224::
    call EnableExternalRAMWriting                 ; $5224: $CD $D0 $27
    ld   a, [bc]                                  ; $5227: $0A
    inc  bc                                       ; $5228: $03
    call EnableExternalRAMWriting                 ; $5229: $CD $D0 $27
    ld   [hl+], a                                 ; $522C: $22
    dec  de                                       ; $522D: $1B
    ld   a, e                                     ; $522E: $7B
    or   d                                        ; $522F: $B2
    jr   nz, jr_001_5224                           ; $5230: $20 $F2

    jp   label_001_4555                               ; $5232: $C3 $55 $45

jr_001_5235::
    ldh  a, [hJoypadState]                        ; $5235: $F0 $CC
    bit  5, a                                     ; $5237: $CB $6F
    jr   z, jr_001_5249                            ; $5239: $28 $0E

    ld   hl, wGameplaySubtype                     ; $523B: $21 $96 $DB
    dec  [hl]                                     ; $523E: $35
    xor  a                                        ; $523F: $AF
    ld   [wCreditsScratch0], a                    ; $5240: $EA $00 $D0
    call func_001_4EBB                               ; $5243: $CD $BB $4E
    jp   label_001_526F                               ; $5246: $C3 $6F $52

jr_001_5249::
    call func_001_512C                               ; $5249: $CD $2C $51
    ldh  a, [hFrameCounter]                       ; $524C: $F0 $E7
    and  $10                                      ; $524E: $E6 $10
    jr   z, label_001_526F                            ; $5250: $28 $1D

    ld   a, [wIntroSubTimer]                      ; $5252: $FA $02 $D0
    rla                                           ; $5255: $17
    rla                                           ; $5256: $17
    rla                                           ; $5257: $17
    and  $F8                                      ; $5258: $E6 $F8
    ld   e, a                                     ; $525A: $5F
    ld   d, $00                                   ; $525B: $16 $00
    ld   hl, Data_001_50C7                        ; $525D: $21 $C7 $50
    add  hl, de                                   ; $5260: $19
    ld   de, $D609                                ; $5261: $11 $09 $D6
    ld   c, $08                                   ; $5264: $0E $08

jr_001_5266::
    ld   a, [hl+]                                 ; $5266: $2A
    ld   [de], a                                  ; $5267: $12
    inc  de                                       ; $5268: $13
    dec  c                                        ; $5269: $0D
    jr   nz, jr_001_5266                           ; $526A: $20 $FA

    xor  a                                        ; $526C: $AF
    ld   [de], a                                  ; $526D: $12
    ret                                           ; $526E: $C9

label_001_526F::
    ld   a, [wIntroSubTimer]                      ; $526F: $FA $02 $D0
    cp   $01                                      ; $5272: $FE $01
    jr   z, jr_001_5283                            ; $5274: $28 $0D

    cp   $02                                      ; $5276: $FE $02
    jr   z, jr_001_528C                            ; $5278: $28 $12

    ld   bc, $98CD                                ; $527A: $01 $CD $98
    ld   de, $DB80                                ; $527D: $11 $80 $DB
    jp   func_4852                                ; $5280: $C3 $52 $48

jr_001_5283::
    ld   bc, $992D                                ; $5283: $01 $2D $99
    ld   de, $DB85                                ; $5286: $11 $85 $DB
    jp   func_4852                                ; $5289: $C3 $52 $48

jr_001_528C::
    ld   bc, $998D                                ; $528C: $01 $8D $99
    ld   de, $DB8A                                ; $528F: $11 $8A $DB
    jp   func_4852                                ; $5292: $C3 $52 $48
