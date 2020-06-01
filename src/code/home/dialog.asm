;
; Dialog display
;

ExecuteDialog::
    ; If DialogState == 0, don't do anything.
    ld   a, [wDialogState]
    and  a
    ret  z

    ; Configure the dialog background color
    ld   e, a
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    ; By default use a dark background
    ld   a, DIALOG_BG_TILE_DARK
    jr   nz, .writeBackgroundTile
.lightBackground
    ; but during credits use a light background
    ld   a, DIALOG_BG_TILE_LIGHT
.writeBackgroundTile
    ldh  [hDialogBackgroundTile], a

    ; If the character index is > 20 (i.e. past the first two lines),
    ; mask wDialogNextCharPosition around $10
    ld   a, [wDialogCharacterIndexHi]
    and  a
    ld   a, [wDialogCharacterIndex]
    jr   nz, .wrapPosition
    cp   $20
    jr   c, .writePosition
.wrapPosition
    and  $0F
    or   $10
.writePosition
    ld   [wDialogNextCharPosition], a

    ; Discard wDialogState lower byte
    ld   a, e
    and  $7F

    ; Dispatch according to the dialog state
    dec  a
    JP_TABLE
._00 dw DialogOpenAnimationStartHandler
._01 dw DialogOpenAnimationHandler
._02 dw DialogOpenAnimationHandler
._03 dw DialogOpenAnimationHandler
._04 dw DialogOpenAnimationEndHandler
._05 dw DialogLetterAnimationStartHandler
._06 dw DialogLetterAnimationEndHandler
._07 dw DialogDrawNextCharacterHandler
._08 dw DialogBreakHandler
._09 dw DialogScrollingStartHandler
._0A dw DialogScrollingEndHandler
._0B dw DialogFinishedHandler
._0C dw DialogChoiceHandler
._0D dw DialogClosingBeginHandler
._0E dw DialogClosingEndHandler

DialogOpenAnimationStartHandler::
    jpsb DialogOpenAnimationStart

; Open a dialog in the $100-$1FF range
; Input:
;   a: dialog index in table 1
OpenDialogInTable1::
    call OpenDialog
    ld   a, $01
    ld   [wDialogIndexHi], a
    ret

; Open a dialog in the $200-$2FF range
; Input:
;   a: dialog index in table 2
OpenDialogInTable2::
    call OpenDialog
    ld   a, $02
    ld   [wDialogIndexHi], a
    ret

; Open a dialog in the $00-$FF range
; Input:
;   a: dialog index in table 0
OpenDialog::
    ; Clear $C177
    push af
    xor  a
    ld   [$C177], a
    pop  af

    ; Save the dialog index
    ld   [wDialogIndex], a

    ; Initialize dialog variables
    xor  a
    ld   [$C16F], a
    ld   [wDialogCharacterIndex], a
    ld   [wDialogCharacterIndexHi], a
    ld   [$C108], a
    ld   [wDialogIndexHi], a
    ld   a, $0F
    ld   [$C5AB], a
    ; Determine if the dialog is displayed on top or bottom
    ; wDialogState = hLinkPositionY < $48 ? $81 : $01
    ldh  a, [hLinkPositionY]
    cp   $48
    rra
    and  $80
    or   $01
    ld   [wDialogState], a
    ret

DialogOpenAnimationHandler::
    ret

DialogClosingEndHandler::
    xor  a
    ld   [wDialogState], a
    ld   a, $18
    ld   [$C134], a
    ldh  a, [hIsGBC]
    and  a
    ret  z

    ld   a, [wGameplayType]
    cp   a, GAMEPLAY_WORLD
    ret  nz

    ld   a, [$C3CC]
    cp   a, $08
    ret  c

    jpsb func_021_53CF

; This array actually begins two bytes before,
; in the middle of the `jp` instruction,
; and so has two extra bytes at the begining ($CF, $53).
data_23D2::
    db   $00, $24
    db   $48, $00

data_23D6::
    db   $24, $48, $98, $98, $98, $99

data_23DC::
    db   $99, $99, $21, $61, $A1, $41, $81, $C1

; Open dialog animation
; Saves tiles under the dialog box?
label_23E4::
    ld   a, [wDialogState]
    bit  7, a
    jr   z, label_23EF
    and  $7F
    add  a, $03

label_23EF::
    ld   e, a
    ld   d, $00
    ld   hl, data_23D2 - $02
    add  hl, de
    ld   a, [hl]
    add  a, $00
    ld   c, a
    ld   a, $D5
    adc  a, $00
    ld   b, a
    ld   hl, data_23DC
    add  hl, de
    ld   a, [wBGOriginLow]
    add  a, [hl]
    ld   l, a
    ldh  [hScratch0], a
    ld   hl, data_23D6
    add  hl, de
    ld   a, [wBGOriginHigh]
    add  a, [hl]
    ld   h, a
    ldh  a, [hScratch0]
    ld   l, a
    xor  a
    ld   e, a
    ld   d, a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, label_2444

label_241E::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, l
    and  $1F
    jr   nz, label_242B
    ld   a, l
    dec  a
    and  $E0
    ld   l, a

label_242B::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_241E
    ld   e, $00
    ldh  a, [hScratch0]
    add  a, $20
    ldh  [hScratch0], a
    jr   nc, label_243C
    inc  h

label_243C::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_241E
    ret

label_2444::
    ld   a, [hl]
    ld   [bc], a
    ld   a, $01
    ld   [rVBK], a

label_244A::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hl]
    ld   [bc], a
    xor  a
    ld   [rVBK], a
    ld   [rSVBK], a
    inc  bc
    ld   a, l
    add  a, $01
    and  $1F
    jr   nz, label_2463
    ld   a, l
    and  $E0
    ld   l, a
    jr   label_2464

label_2463::
    inc  l

label_2464::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_2444
    ld   e, $00
    ldh  a, [hScratch0]
    add  a, $20
    ldh  [hScratch0], a
    jr   nc, label_2475
    inc  h

label_2475::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_2444
    ret

DialogOpenAnimationEndHandler::
    jpsb DialogOpenAnimationEnd

IncrementDialogState::
IncrementDialogStateAndReturn::
    ld   hl, wDialogState
    inc  [hl]
    ret

DialogFinishedHandler::
    ; If $C1AB == 0...
    ld   a, [$C1AB]
    and  a
    jr   nz, UpdateDialogState_return
    ; ... and A or B is pressed...
    ldh  a, [hJoypadState]
    and  J_A | J_B
    jr   z, UpdateDialogState_return
    ; ... update dialog state

UpdateDialogState::
    ; Clear $C16F
    xor  a
    ld   [$C16F], a

.if
    ; If GameplayType == PHOTO_ALBUM
    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   nz, .else
.then
    ; A = 0
    xor  a
    jr   .fi
.else
    ; A = (wDialogState & $F0) | $E
    ld   a, [wDialogState]
    and  $F0
    or   $0E
.fi
    ; Set dialog state
    ld   [wDialogState], a

UpdateDialogState_return:
    ret

DialogClosingBeginHandler::
    jpsb func_01C_4AA8

DialogLetterAnimationStartHandler::
    ld   a, BANK(func_01C_49F1)
    ld   [MBC3SelectBank], a
    ld   a, [wDialogScrollDelay]
    and  a
    jr   z, .delayOver
    dec  a
    ld   [wDialogScrollDelay], a
    ret

.delayOver
    call func_01C_49F1
    jp   IncrementDialogStateAndReturn

DialogLetterAnimationEndHandler::
    ld   a, $1C
    ld   [MBC3SelectBank], a
    ld   a, [wDialogState]
    ld   c, a
    ld   a, [wDialogNextCharPosition]
    bit  7, c
    jr   z, .jp_24DF
    add  a, $20

.jp_24DF
    ; bc = [wDialogNextCharPosition]
    ld   c, a
    ld   b, $00
    ; de = $01
    ld   e, $01
    ld   d, $00
    ld   a, [wBGOriginHigh]
    ld   hl, Data_01C_45C1
    add  hl, bc
    add  a, [hl]
    ld   hl, wRequests
    add  hl, de
    ldi  [hl], a
    ld   [$C175], a
    push hl
    ld   hl, Data_01C_4601
    add  hl, bc
    ld   a, [hl]
    and  $E0
    add  a, $20
    ld   e, a
    ld   a, [wBGOriginLow]
    add  a, [hl]
    ld   d, a
    cp   e
    jr   c, .jp_250D
    ld   a, d
    sub  a, $20
    ld   d, a

.jp_250D
    ld   a, d
    ld   [$C176], a
    pop  hl
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    push hl
    ld   a, [wDialogCharacterIndex]
    and  $1F
    ld   c, a
    ld   hl, Data_01C_45A1
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    call IncrementDialogState
    jp   DialogDrawNextCharacterHandler

DialogDrawNextCharacterHandler::
    ld   a, BANK(DialogPointerTable)
    ld   [MBC3SelectBank], a
    ld   a, [wDialogCharacterIndex]
    and  $1F
    ld   c, a
    ld   b, $00
    ld   e, $05
    ld   d, $00
    ld   hl, DialogCharacterYTable
    add  hl, bc
    ld   a, [hl]

    ld   hl, wRequests
    add  hl, de
    ldi  [hl], a ; high byte of tile destination address
    push hl
    ld   hl, DialogCharacterXTable
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a ; low byte of tile destination address
    ld   a, $0F
    ldi  [hl], a ; number of bytes
    push hl
    ld   a, [wDialogIndexHi]
    ld   d, a
    ld   a, [wDialogIndex]
    ld   e, a
    sla  e
    rl   d
    ld   hl, DialogPointerTable
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   d, [hl]
    push de
    ld   a, [wDialogIndex]
    ld   e, a
    ld   a, [wDialogIndexHi]
    ld   d, a
    ld   hl, DialogBankTable
    add  hl, de
    ld   a, [hl] ; bank
    and  $3f
    ld   [MBC3SelectBank], a
    pop  hl
    ld   a, [wDialogCharacterIndex]
    ld   e, a
    ld   a, [wDialogCharacterIndexHi]
    ld   d, a
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   [$C3C3], a ; upcoming character, used in code for the arrow
    call ReloadSavedBank
    ld   a, e
    ldh  [hScratch0], a
    cp   "<ask>" ; $fe
    jr   nz, .notChoice
    pop  hl
    xor  a
    ld   [wRequest], a

.choice
    ld   a, [wDialogState]
    and  $F0
    or   DIALOG_CHOICE
    ld   [wDialogState], a

.endDialog
    ld   a, JINGLE_DIALOG_BREAK
    ldh  [hJingle], a
    ret

.notChoice
    cp   "@" ; $ff
    jr   nz, .notEnd
    pop  hl
    xor  a
    ld   [wRequest], a

.label_25AD::
    ld   a, [wDialogState]
    and  $F0
    or   $0C
    ld   [wDialogState], a
    ret

.ThiefString::
PUSHC
SETCHARMAP NameEntryCharmap
    db "THIEF"
POPC

.notEnd
    cp   " "
    jr   z, .noSFX
    push af
    ld   a, [wDialogSFX]
    ld   d, a
    ld   e, $01
    cp   WAVE_SFX_TYPEWRITER
    jr   z, .handleFrequency
    ld   e, $07
    cp   WAVE_SFX_HOOT
    jr   z, .handleFrequency
    ld   e, $03
.handleFrequency
    ld   a, [wDialogCharacterIndex]
    add  a, $04
    and  e
    jr   nz, .skipSFX
    ld   a, d
    ldh  [hWaveSfx], a
.skipSFX
    pop  af

.noSFX
    ld   d, $00
    cp   "#" ; character of player name
    jr   nz, .notName
    ld   a, [wNameIndex]
    ld   e, a
    inc  a
    cp   NAME_LENGTH
    jr   nz, .notOver
    xor  a
.notOver
    ld   [wNameIndex], a
    ld   hl, wName
    ld   a, [wIsThief]
    and  a
    jr   z, .notThief
    ld   hl, .ThiefString
.notThief
    add  hl, de
    ld   a, [hl]
    dec  a
    cp   "@"
    jr   nz, .handleNameChar
    ld   a, " "
.handleNameChar

.notName
    ldh  [hScratch1], a
    ld   e, a
    ld   a, BANK(AsciiToTileMap)
    ld   [MBC3SelectBank], a
    ld   hl, AsciiToTileMap
    add  hl, de
    ld   e, [hl]
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    call ReloadSavedBank
    ld   hl, FontTiles
    add  hl, de
    ld   c, l
    ld   b, h
    pop  hl
    ld   e, $10
    ; copy character tile data to wRequestData
.copyTileLoop
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    jr   nz, .copyTileLoop
    ld   [hl], $00
    push hl

     ; stubbed out bit of code accessing a table for (han)dakutens
    ld   a, $1C ; BANK(DakutenTable)
    ld   [MBC3SelectBank], a ; current character
    ldh  a, [hScratch1]
    ld   e, a
    ld   d, $00
    xor  a
    pop  hl
    and  a
    jr   z, .noDakuten
    ld   e, a
    ld   a, [$C175]
    ldi  [hl], a
    ld   a, [$C176]
    sub  a, $20
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $C9
    rr   e
    jr   c, .handleDakutenTile
    dec  a  ; dakuten ($C8)

.handleDakutenTile
    ldi  [hl], a
    ld   [hl], $00

.noDakuten
    ld   a, [wDialogCharacterIndex]
    add  a, $01
    ld   [wDialogCharacterIndex], a
    ld   a, [wDialogCharacterIndexHi]
    adc  a, $00
    ld   [wDialogCharacterIndexHi], a
    xor  a
    ; $C1CC = 01 when an unfinished textbox is waiting for a button press to continue.
    ld   [$C1CC], a
    ld   a, [wDialogNextCharPosition]
    cp   $1F
    jr   z, label_268E

label_267E::
    ld   a, [wDialogState]
    and  $F0
    or   $06
    ld   [wDialogState], a
    ld   a, $00
    ld   [wDialogScrollDelay], a
    ret

label_268E::
    jp   IncrementDialogStateAndReturn

data_2691::
    db $22, $42

data_2693::
    db $98, $99

DialogBreakHandler::
    ld   a, [wDialogCharacterIndex]
    and  $1F
    jr   nz, .jp_26E1
    ld   a, [$C3C3]
    cp   $FF
    jp   z, DialogDrawNextCharacterHandler.label_25AD
    cp   $FE
    jp   z, DialogDrawNextCharacterHandler.choice
    ; $C1CC = 01 when an unfinished textbox is waiting for a button press to continue.
    ld   a, [$C1CC]
    and  a
    jr   nz, .jp_26B6
    inc  a
    ; $C1CC = 01 when an unfinished textbox is waiting for a button press to continue.
    ld   [$C1CC], a
    call DialogDrawNextCharacterHandler.endDialog

.jp_26B6
    call func_27BB
    ; If
    ldh  a, [hJoypadState]
    bit  4, a
    jr   nz, .jp_26E1
    bit  5, a
    jr   z, DialogScrollingStartHandler
    ld   a, BANK(DialogBankTable)
    ld   [MBC3SelectBank], a
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD_MAP
    jp   z, label_278B
    ld   a, [wDialogIndex]
    ld   e, a
    ld   a, [wDialogIndexHi]
    ld   d, a
    ld   hl, DialogBankTable
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_278B

.jp_26E1
    ; Build a BG Data transfert request for the dialog background

    ; e = (wDialogState == DIALOG_CLOSED ? 0 : 1)
    ld   e, $00
    ld   a, [wDialogState]
    and  $80
    jr   z, .closed
    inc  e
.closed

    ld   d, $00
    ld   hl, data_2693
    add  hl, de
    ld   a, [wBGOriginHigh]
    add  a, [hl]
    ld   [wRequestDestinationHigh], a
    ld   hl, data_2691
    add  hl, de
    ld   a, [wBGOriginLow]
    add  a, [hl]
    ld   [wRequestDestinationLow], a
    ld   a, BG_COPY_MODE_ROW_SINGLE_VALUE | $0F
    ld   [wRequestLength], a
    ldh  a, [hDialogBackgroundTile]
    ld   [wRequestLength + 1], a
    xor  a
    ld   [$D605], a
    call IncrementDialogState

DialogScrollingStartHandler::
    ret

data_2715::
    db $62, $82

data_2717::
    db $98, $99

; Scroll dialog line?
DialogBeginScrolling::
    ld   e, $00
    ld   a, [wDialogState]
    and  $80
    jr   z, label_2723
    inc  e

label_2723::
    ld   d, $00
    ld   hl, data_2717
    add  hl, de
    ld   a, [wBGOriginHigh]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2715

label_2731::
    add  hl, de
    ld   a, [wBGOriginLow]
    add  a, [hl]
    ld   c, a
    ld   e, $10

label_2739::
    ld   a, c
    sub  a, $20
    ld   l, a
    ld   h, b
    ld   a, [bc]
    ld   [hl], a
    push bc
    ld   a, c
    add  a, $20
    ld   c, a
    ld   a, l
    add  a, $20
    ld   l, a
    ld   a, [bc]
    ld   [hl], a
    ld   a, l
    add  a, $20
    ld   l, a
    ldh  a, [hDialogBackgroundTile]
    ld   [hl], a
    pop  bc
    inc  bc
    ld   a, c
    and  $1F
    jr   nz, label_275D
    ld   a, c
    sub  a, $20
    ld   c, a

label_275D::
    dec  e
    jr   nz, label_2739
    ld   a, $08  ; Pause the scrolling for 8 frames
    ld   [wDialogScrollDelay], a
    jp   IncrementDialogStateAndReturn

DialogScrollingEndHandler::
    ret

data_2769::
    db $42, $62

data_276B::
    db $98, $99

DialogFinishScrolling::
    ld   e, 0
    ld   a, [$C0FB+$A4]
    and  $80 ; 'Ç'
    jr   z, label_2777
    inc  e

label_2777::
    ld   d, $00
    ld   hl, data_276B
    add  hl, de
    ld   a, [wBGOriginHigh]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2769
    call label_2731
    jp   label_267E

label_278B::
    ld   a, $02
    ld   [$C177], a
    jp   UpdateDialogState

DialogChoiceHandler::
    ldh  a, [hJoypadState]
    bit  4, a               ; Was A pushed?
    jp   nz, .jp_27B7
    and  J_LEFT | J_RIGHT
    jr   z, .jp_27AA
    ld   hl, $C177
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    ld   a, JINGLE_MOVE_SELECTION
    ldh  [hJingle], a

.jp_27AA
    ldh  a, [hFrameCounter]
    and  $10
    ret  z
    jpsb func_017_7DCC

.jp_27B7
    call UpdateDialogState
    ret

func_27BB::
    jpsb func_017_7D7C
