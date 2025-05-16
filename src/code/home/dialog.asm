;
; Dialog display
;

ExecuteDialog::
    ; If DialogState == 0, don't do anything.
    ld   a, [wDialogState]                        ;; 00:2321 $FA $9F $C1
    and  a                                        ;; 00:2324 $A7
    ret  z                                        ;; 00:2325 $C8

    ; Configure the dialog background color
    ld   e, a                                     ;; 00:2326 $5F
    ld   a, [wGameplayType]                       ;; 00:2327 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 00:232A $FE $01
    ; By default use a dark background
    ld   a, DIALOG_BG_TILE_DARK                   ;; 00:232C $3E $7E
    jr   nz, .writeBackgroundTile                 ;; 00:232E $20 $02
.lightBackground
    ; but during credits use a light background
    ld   a, DIALOG_BG_TILE_LIGHT                  ;; 00:2330 $3E $7F
.writeBackgroundTile
    ldh  [hDialogBackgroundTile], a               ;; 00:2332 $E0 $E8

    ; If the character index is > 20 (i.e. past the first two lines),
    ; mask wDialogNextCharPosition around $10
    ld   a, [wDialogCharacterIndexHi]             ;; 00:2334 $FA $64 $C1
    and  a                                        ;; 00:2337 $A7
    ld   a, [wDialogCharacterIndex]               ;; 00:2338 $FA $70 $C1
    jr   nz, .wrapPosition                        ;; 00:233B $20 $04
    cp   $20                                      ;; 00:233D $FE $20
    jr   c, .writePosition                        ;; 00:233F $38 $04
.wrapPosition
    and  $0F                                      ;; 00:2341 $E6 $0F
    or   $10                                      ;; 00:2343 $F6 $10
.writePosition
    ld   [wDialogNextCharPosition], a             ;; 00:2345 $EA $71 $C1

    ; Discard wDialogState upper bit (dialog displayed on bottom)
    ld   a, e                                     ;; 00:2348 $7B
    and  ~DIALOG_BOX_BOTTOM_FLAG                  ;; 00:2349 $E6 $7F

    ; Dispatch according to the dialog state
    dec  a                                        ;; 00:234B $3D
    JP_TABLE                                      ;; 00:234C $C7
._00 dw DialogOpenAnimationStartHandler           ;; 00:234D
._01 dw DialogOpenAnimationHandler                ;; 00:234F
._02 dw DialogOpenAnimationHandler                ;; 00:2351
._03 dw DialogOpenAnimationHandler                ;; 00:2353
._04 dw DialogOpenAnimationEndHandler             ;; 00:2355
._05 dw DialogLetterAnimationStartHandler         ;; 00:2357
._06 dw DialogLetterAnimationEndHandler           ;; 00:2359
._07 dw DialogDrawNextCharacterHandler            ;; 00:235B
._08 dw DialogBreakHandler                        ;; 00:235D
._09 dw DialogScrollingStartHandler               ;; 00:235F
._0A dw DialogScrollingEndHandler                 ;; 00:2361
._0B dw DialogFinishedHandler                     ;; 00:2363
._0C dw DialogChoiceHandler                       ;; 00:2365
._0D dw DialogClosingBeginHandler                 ;; 00:2367
._0E dw DialogClosingEndHandler                   ;; 00:2369

DialogOpenAnimationStartHandler::
    jpsb DialogOpenAnimationStart                 ;; 00:236B $3E $14 $EA $00 $21 $C3 $49 $54

; Open a dialog in the $100-$1FF range
; Input:
;   a: dialog index in table 1
OpenDialogInTable1::
    call OpenDialogInTable0                       ;; 00:2373 $CD $85 $23
    ; Overwrite the table number
    ld   a, $01                                   ;; 00:2376 $3E $01
    ld   [wDialogIndexHi], a                      ;; 00:2378 $EA $12 $C1
    ret                                           ;; 00:237B $C9

; Open a dialog in the $200-$2FF range
; Input:
;   a: dialog index in table 2
OpenDialogInTable2::
    call OpenDialogInTable0                       ;; 00:237C $CD $85 $23
    ; Overwrite the table number
    ld   a, $02                                   ;; 00:237F $3E $02
    ld   [wDialogIndexHi], a                      ;; 00:2381 $EA $12 $C1
    ret                                           ;; 00:2384 $C9

; Open a dialog in the $00-$FF range
; Input:
;   a: dialog index in table 0
OpenDialogInTable0::
    ; Clear wDialogAskSelectionIndex
    push af                                       ;; 00:2385 $F5
    xor  a                                        ;; 00:2386 $AF
    ld   [wDialogAskSelectionIndex], a            ;; 00:2387 $EA $77 $C1
    pop  af                                       ;; 00:238A $F1

    ; Save the dialog index
    ld   [wDialogIndex], a                        ;; 00:238B $EA $73 $C1

    ; Initialize dialog variables
    xor  a                                        ;; 00:238E $AF
    ld   [wDialogOpenCloseAnimationFrame], a      ;; 00:238F $EA $6F $C1
    ld   [wDialogCharacterIndex], a               ;; 00:2392 $EA $70 $C1
    ld   [wDialogCharacterIndexHi], a             ;; 00:2395 $EA $64 $C1
    ld   [wNameIndex], a                          ;; 00:2398 $EA $08 $C1
    ld   [wDialogIndexHi], a                      ;; 00:239B $EA $12 $C1

    ld   a, $0F                                   ;; 00:239E $3E $0F
    ld   [wDialogSFX], a                          ;; 00:23A0 $EA $AB $C5

    ; Determine if the dialog is displayed on top or bottom
    ; wDialogState = hLinkPositionY < $48 ? $81 : $01
    ldh  a, [hLinkPositionY]                      ;; 00:23A3 $F0 $99
    cp   $48                                      ;; 00:23A5 $FE $48
    rra                                           ;; 00:23A7 $1F
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 00:23A8 $E6 $80
    or   DIALOG_OPENING_1                         ;; 00:23AA $F6 $01
    ld   [wDialogState], a                        ;; 00:23AC $EA $9F $C1

    ret                                           ;; 00:23AF $C9

DialogOpenAnimationHandler::
    ret                                           ;; 00:23B0 $C9

DialogClosingEndHandler::
    xor  a                                        ;; 00:23B1 $AF
    ld   [wDialogState], a                        ;; 00:23B2 $EA $9F $C1
    ld   a, DIALOG_COOLDOWN                       ;; 00:23B5 $3E $18
    ld   [wDialogCooldown], a                     ;; 00:23B7 $EA $34 $C1
    ldh  a, [hIsGBC]                              ;; 00:23BA $F0 $FE
    and  a                                        ;; 00:23BC $A7
    ret  z                                        ;; 00:23BD $C8

    ld   a, [wGameplayType]                       ;; 00:23BE $FA $95 $DB
    cp   a, GAMEPLAY_WORLD                        ;; 00:23C1 $FE $0B
    ret  nz                                       ;; 00:23C3 $C0

    ld   a, [wBGPaletteEffectAddress]             ;; 00:23C4 $FA $CC $C3
    cp   a, $08                                   ;; 00:23C7 $FE $08
    ret  c                                        ;; 00:23C9 $D8

    jpsb func_021_53CF                            ;; 00:23CA $3E $21 $EA $00 $21 $C3 $CF $53

; This array actually begins two bytes before,
; in the middle of the `jp` instruction,
; and so has two extra bytes at the beginning ($CF, $53).
data_23D2::
    db   $00, $24                                 ;; 00:23D2
    db   $48, $00                                 ;; 00:23D4

data_23D6::
    db   $24, $48, $98, $98, $98, $99             ;; 00:23D6

data_23DC::
    db   $99, $99, $21, $61, $A1, $41, $81, $C1   ;; 00:23DC

; Open dialog animation
; Saves tiles under the dialog box?
func_23E4::
    ld   a, [wDialogState]                        ;; 00:23E4 $FA $9F $C1
    bit  DIALOG_BOX_BOTTOM_BIT, a                 ;; 00:23E7 $CB $7F
    jr   z, .jr_23EF                              ;; 00:23E9 $28 $04
    and  ~DIALOG_BOX_BOTTOM_FLAG                  ;; 00:23EB $E6 $7F
    add  a, $03                                   ;; 00:23ED $C6 $03
.jr_23EF

    ld   e, a                                     ;; 00:23EF $5F
    ld   d, $00                                   ;; 00:23F0 $16 $00
    ld   hl, data_23D2 - $02                      ;; 00:23F2 $21 $D0 $23
    add  hl, de                                   ;; 00:23F5 $19
    ld   a, [hl]                                  ;; 00:23F6 $7E
    add  a, LOW(wD500)                            ;; 00:23F7 $C6 $00
    ld   c, a                                     ;; 00:23F9 $4F
    ld   a, HIGH(wD500)                           ;; 00:23FA $3E $D5
    adc  a, $00                                   ;; 00:23FC $CE $00
    ld   b, a                                     ;; 00:23FE $47

    ld   hl, data_23DC                            ;; 00:23FF $21 $DC $23
    add  hl, de                                   ;; 00:2402 $19
    ld   a, [wBGOriginLow]                        ;; 00:2403 $FA $2F $C1
    add  a, [hl]                                  ;; 00:2406 $86
    ld   l, a                                     ;; 00:2407 $6F
    ldh  [hMultiPurpose0], a                      ;; 00:2408 $E0 $D7
    ld   hl, data_23D6                            ;; 00:240A $21 $D6 $23
    add  hl, de                                   ;; 00:240D $19
    ld   a, [wBGOriginHigh]                       ;; 00:240E $FA $2E $C1
    add  a, [hl]                                  ;; 00:2411 $86
    ld   h, a                                     ;; 00:2412 $67
    ldh  a, [hMultiPurpose0]                      ;; 00:2413 $F0 $D7
    ld   l, a                                     ;; 00:2415 $6F
    xor  a                                        ;; 00:2416 $AF
    ld   e, a                                     ;; 00:2417 $5F
    ld   d, a                                     ;; 00:2418 $57
    ldh  a, [hIsGBC]                              ;; 00:2419 $F0 $FE
    and  a                                        ;; 00:241B $A7
    jr   nz, label_2444                           ;; 00:241C $20 $26

    ; DMG version of the loop
.loop
    ld   a, [hli]                                 ;; 00:241E $2A
    ld   [bc], a                                  ;; 00:241F $02
    inc  bc                                       ;; 00:2420 $03

    ld   a, l                                     ;; 00:2421 $7D
    and  $1F                                      ;; 00:2422 $E6 $1F
    jr   nz, .jr_242B                             ;; 00:2424 $20 $05
    ld   a, l                                     ;; 00:2426 $7D
    dec  a                                        ;; 00:2427 $3D
    and  $E0                                      ;; 00:2428 $E6 $E0
    ld   l, a                                     ;; 00:242A $6F
.jr_242B

    inc  e                                        ;; 00:242B $1C
    ld   a, e                                     ;; 00:242C $7B
    cp   $12                                      ;; 00:242D $FE $12
    jr   nz, .loop                                ;; 00:242F $20 $ED

    ld   e, $00                                   ;; 00:2431 $1E $00
    ldh  a, [hMultiPurpose0]                      ;; 00:2433 $F0 $D7
    add  a, $20                                   ;; 00:2435 $C6 $20
    ldh  [hMultiPurpose0], a                      ;; 00:2437 $E0 $D7
    jr   nc, .jr_243C                             ;; 00:2439 $30 $01
    inc  h                                        ;; 00:243B $24
.jr_243C

    ld   l, a                                     ;; 00:243C $6F
    inc  d                                        ;; 00:243D $14
    ld   a, d                                     ;; 00:243E $7A
    cp   $02                                      ;; 00:243F $FE $02
    jr   nz, .loop                                ;; 00:2441 $20 $DB
    ret                                           ;; 00:2443 $C9

label_2444::
    ld   a, [hl]                                  ;; 00:2444 $7E
    ld   [bc], a                                  ;; 00:2445 $02
    ld   a, $01                                   ;; 00:2446 $3E $01
    ldh  [rVBK], a                                ;; 00:2448 $E0 $4F

label_244A::
    ld   a, $02                                   ;; 00:244A $3E $02
    ldh  [rSVBK], a                               ;; 00:244C $E0 $70
    ld   a, [hl]                                  ;; 00:244E $7E
    ld   [bc], a                                  ;; 00:244F $02
    xor  a                                        ;; 00:2450 $AF
    ldh  [rVBK], a                                ;; 00:2451 $E0 $4F
    ldh  [rSVBK], a                               ;; 00:2453 $E0 $70
    inc  bc                                       ;; 00:2455 $03
    ld   a, l                                     ;; 00:2456 $7D
    add  a, $01                                   ;; 00:2457 $C6 $01
    and  $1F                                      ;; 00:2459 $E6 $1F
    jr   nz, label_2463                           ;; 00:245B $20 $06
    ld   a, l                                     ;; 00:245D $7D
    and  $E0                                      ;; 00:245E $E6 $E0
    ld   l, a                                     ;; 00:2460 $6F
    jr   label_2464                               ;; 00:2461 $18 $01

label_2463::
    inc  l                                        ;; 00:2463 $2C

label_2464::
    inc  e                                        ;; 00:2464 $1C
    ld   a, e                                     ;; 00:2465 $7B
    cp   $12                                      ;; 00:2466 $FE $12
    jr   nz, label_2444                           ;; 00:2468 $20 $DA
    ld   e, $00                                   ;; 00:246A $1E $00
    ldh  a, [hMultiPurpose0]                      ;; 00:246C $F0 $D7
    add  a, $20                                   ;; 00:246E $C6 $20
    ldh  [hMultiPurpose0], a                      ;; 00:2470 $E0 $D7
    jr   nc, label_2475                           ;; 00:2472 $30 $01
    inc  h                                        ;; 00:2474 $24

label_2475::
    ld   l, a                                     ;; 00:2475 $6F
    inc  d                                        ;; 00:2476 $14
    ld   a, d                                     ;; 00:2477 $7A
    cp   $02                                      ;; 00:2478 $FE $02
    jr   nz, label_2444                           ;; 00:247A $20 $C8
    ret                                           ;; 00:247C $C9

DialogOpenAnimationEndHandler::
    jpsb DialogOpenAnimationEnd                   ;; 00:247D $3E $1C $EA $00 $21 $C3 $2C $4A

IncrementDialogState::
IncrementDialogStateAndReturn::
    ld   hl, wDialogState                         ;; 00:2485 $21 $9F $C1
    inc  [hl]                                     ;; 00:2488 $34
    ret                                           ;; 00:2489 $C9

DialogFinishedHandler::
    ; If wC1AB == 0...
    ld   a, [wC1AB]                               ;; 00:248A $FA $AB $C1
    and  a                                        ;; 00:248D $A7
    jr   nz, UpdateDialogState_return             ;; 00:248E $20 $1E
    ; ... and A or B is pressed...
    ldh  a, [hJoypadState]                        ;; 00:2490 $F0 $CC
    and  J_A | J_B                                ;; 00:2492 $E6 $30
    jr   z, UpdateDialogState_return              ;; 00:2494 $28 $18
    ; ... update dialog state

UpdateDialogState::
    ; Clear wDialogOpenCloseAnimationFrame
    xor  a                                        ;; 00:2496 $AF
    ld   [wDialogOpenCloseAnimationFrame], a      ;; 00:2497 $EA $6F $C1

.if
    ; If GameplayType == PHOTO_ALBUM
    ld   a, [wGameplayType]                       ;; 00:249A $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ;; 00:249D $FE $0D
    jr   nz, .else                                ;; 00:249F $20 $03
.then
    ; A = 0
    xor  a                                        ;; 00:24A1 $AF
    jr   .fi                                      ;; 00:24A2 $18 $07
.else
    ; A = (wDialogState & $F0) | $E
    ld   a, [wDialogState]                        ;; 00:24A4 $FA $9F $C1
    and  $F0                                      ;; 00:24A7 $E6 $F0
    or   $0E                                      ;; 00:24A9 $F6 $0E
.fi
    ; Set dialog state
    ld   [wDialogState], a                        ;; 00:24AB $EA $9F $C1

UpdateDialogState_return:
    ret                                           ;; 00:24AE $C9

DialogClosingBeginHandler::
    jpsb AnimateDialogClosing                     ;; 00:24AF $3E $1C $EA $00 $21 $C3 $A8 $4A

DialogLetterAnimationStartHandler::
    ld   a, BANK(ClearLetterPixels)               ;; 00:24B7 $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:24B9 $EA $00 $21
    ld   a, [wDialogScrollDelay]                  ;; 00:24BC $FA $72 $C1
    and  a                                        ;; 00:24BF $A7
    jr   z, .delayOver                            ;; 00:24C0 $28 $05
    dec  a                                        ;; 00:24C2 $3D
    ld   [wDialogScrollDelay], a                  ;; 00:24C3 $EA $72 $C1
    ret                                           ;; 00:24C6 $C9

.delayOver
    call ClearLetterPixels                        ;; 00:24C7 $CD $F1 $49
    jp   IncrementDialogStateAndReturn            ;; 00:24CA $C3 $85 $24

DialogLetterAnimationEndHandler::
    ld   a, BANK(DialogPointerTable)              ;; 00:24CD $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:24CF $EA $00 $21
    ld   a, [wDialogState]                        ;; 00:24D2 $FA $9F $C1
    ld   c, a                                     ;; 00:24D5 $4F
    ld   a, [wDialogNextCharPosition]             ;; 00:24D6 $FA $71 $C1
    bit  DIALOG_BOX_BOTTOM_BIT, c                 ;; 00:24D9 $CB $79
    jr   z, .jp_24DF                              ;; 00:24DB $28 $02
    add  a, $20                                   ;; 00:24DD $C6 $20

.jp_24DF
    ; bc = [wDialogNextCharPosition]
    ld   c, a                                     ;; 00:24DF $4F
    ld   b, $00                                   ;; 00:24E0 $06 $00
    ; de = $01
    ld   e, $01                                   ;; 00:24E2 $1E $01
    ld   d, $00                                   ;; 00:24E4 $16 $00
    ld   a, [wBGOriginHigh]                       ;; 00:24E6 $FA $2E $C1
    ld   hl, Data_01C_45C1                        ;; 00:24E9 $21 $C1 $45
    add  hl, bc                                   ;; 00:24EC $09
    add  a, [hl]                                  ;; 00:24ED $86
    ld   hl, wDrawCommandsSize                    ;; 00:24EE $21 $00 $D6
    add  hl, de                                   ;; 00:24F1 $19
    ldi  [hl], a                                  ;; 00:24F2 $22
    ld   [wC175], a                               ;; 00:24F3 $EA $75 $C1
    push hl                                       ;; 00:24F6 $E5
    ld   hl, Data_01C_4601                        ;; 00:24F7 $21 $01 $46
    add  hl, bc                                   ;; 00:24FA $09
    ld   a, [hl]                                  ;; 00:24FB $7E
    and  $E0                                      ;; 00:24FC $E6 $E0
    add  a, $20                                   ;; 00:24FE $C6 $20
    ld   e, a                                     ;; 00:2500 $5F
    ld   a, [wBGOriginLow]                        ;; 00:2501 $FA $2F $C1
    add  a, [hl]                                  ;; 00:2504 $86
    ld   d, a                                     ;; 00:2505 $57
    cp   e                                        ;; 00:2506 $BB
    jr   c, .jp_250D                              ;; 00:2507 $38 $04
    ld   a, d                                     ;; 00:2509 $7A
    sub  a, $20                                   ;; 00:250A $D6 $20
    ld   d, a                                     ;; 00:250C $57

.jp_250D
    ld   a, d                                     ;; 00:250D $7A
    ld   [wC176], a                               ;; 00:250E $EA $76 $C1
    pop  hl                                       ;; 00:2511 $E1
    ldi  [hl], a                                  ;; 00:2512 $22
    xor  a                                        ;; 00:2513 $AF
    ldi  [hl], a                                  ;; 00:2514 $22
    push hl                                       ;; 00:2515 $E5
    ld   a, [wDialogCharacterIndex]               ;; 00:2516 $FA $70 $C1
    and  $1F                                      ;; 00:2519 $E6 $1F
    ld   c, a                                     ;; 00:251B $4F
    ld   hl, Data_01C_45A1                        ;; 00:251C $21 $A1 $45
    add  hl, bc                                   ;; 00:251F $09
    ld   a, [hl]                                  ;; 00:2520 $7E
    pop  hl                                       ;; 00:2521 $E1
    ldi  [hl], a                                  ;; 00:2522 $22
    call IncrementDialogState                     ;; 00:2523 $CD $85 $24
    jp   DialogDrawNextCharacterHandler           ;; 00:2526 $C3 $29 $25

DialogDrawNextCharacterHandler::
    ld   a, BANK(DialogPointerTable)              ;; 00:2529 $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:252B $EA $00 $21
    ld   a, [wDialogCharacterIndex]               ;; 00:252E $FA $70 $C1
    and  $1F                                      ;; 00:2531 $E6 $1F
    ld   c, a                                     ;; 00:2533 $4F
    ld   b, $00                                   ;; 00:2534 $06 $00
    ld   e, $05                                   ;; 00:2536 $1E $05
    ld   d, $00                                   ;; 00:2538 $16 $00
    ld   hl, DialogCharacterYTable                ;; 00:253A $21 $81 $45
    add  hl, bc                                   ;; 00:253D $09
    ld   a, [hl]                                  ;; 00:253E $7E

    ld   hl, wDrawCommandsSize                    ;; 00:253F $21 $00 $D6
    add  hl, de                                   ;; 00:2542 $19
    ldi  [hl], a ; high byte of tile destination address ;; 00:2543 $22
    push hl                                       ;; 00:2544 $E5
    ld   hl, DialogCharacterXTable                ;; 00:2545 $21 $61 $45
    add  hl, bc                                   ;; 00:2548 $09
    ld   a, [hl]                                  ;; 00:2549 $7E
    pop  hl                                       ;; 00:254A $E1
    ldi  [hl], a ; low byte of tile destination address ;; 00:254B $22
    ld   a, $0F                                   ;; 00:254C $3E $0F
    ldi  [hl], a ; number of bytes                ;; 00:254E $22
    push hl                                       ;; 00:254F $E5
    ld   a, [wDialogIndexHi]                      ;; 00:2550 $FA $12 $C1
    ld   d, a                                     ;; 00:2553 $57
    ld   a, [wDialogIndex]                        ;; 00:2554 $FA $73 $C1
    ld   e, a                                     ;; 00:2557 $5F
    sla  e                                        ;; 00:2558 $CB $23
    rl   d                                        ;; 00:255A $CB $12
    ld   hl, DialogPointerTable                   ;; 00:255C $21 $01 $40
    add  hl, de                                   ;; 00:255F $19
    ld   a, [hli]                                 ;; 00:2560 $2A
    ld   e, a                                     ;; 00:2561 $5F
    ld   d, [hl]                                  ;; 00:2562 $56
IF __USE_FIXED_DIALOG_BANKS__
    ld   l, e
    ld   h, d
    ld   e, BANK(Dialog000)
    ld   a, [wDialogIndexHi]
    and  a
    jr   z, .foundBank
    ld   e,  BANK(Dialog100)
    cp   $01
    jr   z, .foundBank
    ld   e,  BANK(Dialog200)
.foundBank
    ld   a, e
    ld   [rSelectROMBank], a
ELSE
    push de                                       ;; 00:2563 $D5
    ld   a, [wDialogIndex]                        ;; 00:2564 $FA $73 $C1
    ld   e, a                                     ;; 00:2567 $5F
    ld   a, [wDialogIndexHi]                      ;; 00:2568 $FA $12 $C1
    ld   d, a                                     ;; 00:256B $57
    ld   hl, DialogBankTable                      ;; 00:256C $21 $41 $47
    add  hl, de                                   ;; 00:256F $19
    ld   a, [hl] ; bank                           ;; 00:2570 $7E
    ; Mask out DIALOG_UNSKIPPABLE flag
    and  $3F                                      ;; 00:2571 $E6 $3F
    ld   [rSelectROMBank], a                      ;; 00:2573 $EA $00 $21
    pop  hl                                       ;; 00:2576 $E1
ENDC
    ld   a, [wDialogCharacterIndex]               ;; 00:2577 $FA $70 $C1
    ld   e, a                                     ;; 00:257A $5F
    ld   a, [wDialogCharacterIndexHi]             ;; 00:257B $FA $64 $C1
    ld   d, a                                     ;; 00:257E $57
    add  hl, de                                   ;; 00:257F $19
    ld   a, [hli]                                 ;; 00:2580 $2A
    ld   e, a                                     ;; 00:2581 $5F
    ; Peek ahead and store the next character in
    ; the dialog, for later use in DialogBreakHandler
    ld   a, [hl]                                  ;; 00:2582 $7E
    ld   [wDialogNextChar], a                     ;; 00:2583 $EA $C3 $C3
    call ReloadSavedBank                          ;; 00:2586 $CD $1D $08
    ld   a, e                                     ;; 00:2589 $7B
    ldh  [hMultiPurpose0], a                      ;; 00:258A $E0 $D7
    cp   "<ask>" ; $fe                            ;; 00:258C $FE $FE
    jr   nz, .notChoice                           ;; 00:258E $20 $14
    pop  hl                                       ;; 00:2590 $E1
    xor  a                                        ;; 00:2591 $AF
    ld   [wDrawCommand], a                        ;; 00:2592 $EA $01 $D6

.choice
    ld   a, [wDialogState]                        ;; 00:2595 $FA $9F $C1
    ; Keep DIALOG_BOX_BOTTOM_FLAG
    and  $F0                                      ;; 00:2598 $E6 $F0
    or   DIALOG_CHOICE                            ;; 00:259A $F6 $0D
    ld   [wDialogState], a                        ;; 00:259C $EA $9F $C1

.endDialog
    ld   a, JINGLE_DIALOG_BREAK                   ;; 00:259F $3E $15
    ldh  [hJingle], a                             ;; 00:25A1 $E0 $F2
    ret                                           ;; 00:25A3 $C9

.notChoice
    cp   "@" ; $ff                                ;; 00:25A4 $FE $FF
    jr   nz, .notEnd                              ;; 00:25A6 $20 $15
    pop  hl                                       ;; 00:25A8 $E1
    xor  a                                        ;; 00:25A9 $AF
    ld   [wDrawCommand], a                        ;; 00:25AA $EA $01 $D6

.end
    ld   a, [wDialogState]                        ;; 00:25AD $FA $9F $C1
    ; Keep DIALOG_BOX_BOTTOM_FLAG
    and  $F0                                      ;; 00:25B0 $E6 $F0
    or   DIALOG_END                               ;; 00:25B2 $F6 $0C
    ld   [wDialogState], a                        ;; 00:25B4 $EA $9F $C1
    ret                                           ;; 00:25B7 $C9

.ThiefString::
FOR INDEX, 5
    IF CHARLEN("{THIEF_NAME}") < INDEX + 1
        db 0
    ELSE
        db STRCHAR("{THIEF_NAME}", INDEX) + 1     ;; 00:25B8
    ENDC
ENDR

.notEnd
    cp   " "                                      ;; 00:25BD $FE $20
    jr   z, .noSFX                                ;; 00:25BF $28 $1F
    push af                                       ;; 00:25C1 $F5
    ld   a, [wDialogSFX]                          ;; 00:25C2 $FA $AB $C5
    ld   d, a                                     ;; 00:25C5 $57
    ld   e, $01                                   ;; 00:25C6 $1E $01
    cp   WAVE_SFX_TEXT_PRINT                      ;; 00:25C8 $FE $0F
    jr   z, .handleFrequency                      ;; 00:25CA $28 $08
    ld   e, $07                                   ;; 00:25CC $1E $07
    cp   WAVE_SFX_OWL_HOOT                        ;; 00:25CE $FE $19
    jr   z, .handleFrequency                      ;; 00:25D0 $28 $02
    ld   e, $03                                   ;; 00:25D2 $1E $03
.handleFrequency
    ld   a, [wDialogCharacterIndex]               ;; 00:25D4 $FA $70 $C1
    add  a, $04                                   ;; 00:25D7 $C6 $04
    and  e                                        ;; 00:25D9 $A3
    jr   nz, .skipSFX                             ;; 00:25DA $20 $03
    ld   a, d                                     ;; 00:25DC $7A
    ldh  [hWaveSfx], a                            ;; 00:25DD $E0 $F3
.skipSFX
    pop  af                                       ;; 00:25DF $F1

.noSFX
    ld   d, $00                                   ;; 00:25E0 $16 $00
    cp   "#" ; character of player name           ;; 00:25E2 $FE $23
    jr   nz, .notName                             ;; 00:25E4 $20 $22
    ld   a, [wNameIndex]                          ;; 00:25E6 $FA $08 $C1
    ld   e, a                                     ;; 00:25E9 $5F
    inc  a                                        ;; 00:25EA $3C
    cp   NAME_LENGTH                              ;; 00:25EB $FE $05
    jr   nz, .notOver                             ;; 00:25ED $20 $01
    xor  a                                        ;; 00:25EF $AF
.notOver
    ld   [wNameIndex], a                          ;; 00:25F0 $EA $08 $C1
    ld   hl, wName                                ;; 00:25F3 $21 $4F $DB
    ld   a, [wIsThief]                            ;; 00:25F6 $FA $6E $DB
    and  a                                        ;; 00:25F9 $A7
    jr   z, .notThief                             ;; 00:25FA $28 $03
    ld   hl, .ThiefString                         ;; 00:25FC $21 $B8 $25
.notThief
    add  hl, de                                   ;; 00:25FF $19
    ld   a, [hl]                                  ;; 00:2600 $7E
    ; Name characters are from NameEntryCharmap
    ; which is ASCII + 1, so decrement it here to
    ; convert it to DialogCharmap which is ASCII
    dec  a                                        ;; 00:2601 $3D
    ; Convert NameEntryCharmap space ($00) to
    ; DialogCharmap/ASCII space ($20)
    PUSHC
    SETCHARMAP NameEntryCharmap
    cp   " " - 1                                  ;; 00:2602 $FE $FF
    POPC
    jr   nz, .handleNameChar                      ;; 00:2604 $20 $02
    ld   a, " "                                   ;; 00:2606 $3E $20
.handleNameChar

.notName
    ldh  [hMultiPurpose1], a                      ;; 00:2608 $E0 $D8
    ld   e, a                                     ;; 00:260A $5F
    ld   a, BANK(CodepointToTileMap)              ;; 00:260B $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:260D $EA $00 $21
    ld   hl, CodepointToTileMap                   ;; 00:2610 $21 $41 $46
    add  hl, de                                   ;; 00:2613 $19
    ld   e, [hl]                                  ;; 00:2614 $5E
    ld   d, $00                                   ;; 00:2615 $16 $00
    sla  e                                        ;; 00:2617 $CB $23
    rl   d                                        ;; 00:2619 $CB $12
    sla  e                                        ;; 00:261B $CB $23
    rl   d                                        ;; 00:261D $CB $12
    sla  e                                        ;; 00:261F $CB $23
    rl   d                                        ;; 00:2621 $CB $12
    sla  e                                        ;; 00:2623 $CB $23
    rl   d                                        ;; 00:2625 $CB $12
    call ReloadSavedBank                          ;; 00:2627 $CD $1D $08
    ld   hl, FontTiles                            ;; 00:262A $21 $00 $50
    add  hl, de                                   ;; 00:262D $19
    ld   c, l                                     ;; 00:262E $4D
    ld   b, h                                     ;; 00:262F $44
    pop  hl                                       ;; 00:2630 $E1
    ld   e, $10                                   ;; 00:2631 $1E $10
    ; copy character tile data to wDrawCommandData
.copyTileLoop
    ld   a, [bc]                                  ;; 00:2633 $0A
    ldi  [hl], a                                  ;; 00:2634 $22
    inc  bc                                       ;; 00:2635 $03
    dec  e                                        ;; 00:2636 $1D
    jr   nz, .copyTileLoop                        ;; 00:2637 $20 $FA
    ld   [hl], $00                                ;; 00:2639 $36 $00
    push hl                                       ;; 00:263B $E5

    ; Check if the current character has a diacritic tile above
    ; (if compiled with support for diacritics)
    ld   a, BANK(CodepointToDiacritic)            ;; 00:263C $3E $1C
    ld   [rSelectROMBank], a ; current character  ;; 00:263E $EA $00 $21
    ldh  a, [hMultiPurpose1]                      ;; 00:2641 $F0 $D8
    ld   e, a                                     ;; 00:2643 $5F
    ld   d, $00                                   ;; 00:2644 $16 $00
IF __DIACRITICS_SUPPORT__
    ld   hl, CodepointToDiacritic
    add  hl, de
    ld   a, [hl]
ELSE
    xor  a                                        ;; 00:2646 $AF
ENDC
    pop  hl                                       ;; 00:2647 $E1
    and  a                                        ;; 00:2648 $A7
    jr   z, .noDiacritic                          ;; 00:2649 $28 $18
    ld   e, a                                     ;; 00:264B $5F
    ld   a, [wC175]                               ;; 00:264C $FA $75 $C1
    ldi  [hl], a                                  ;; 00:264F $22
    ld   a, [wC176]                               ;; 00:2650 $FA $76 $C1
    sub  a, $20                                   ;; 00:2653 $D6 $20
    ldi  [hl], a                                  ;; 00:2655 $22
    ld   a, $00                                   ;; 00:2656 $3E $00
    ldi  [hl], a                                  ;; 00:2658 $22
    ld   a, DIALOG_DIACRITIC_1                    ;; 00:2659 $3E $C9
    rr   e                                        ;; 00:265B $CB $1B
    jr   c, .handleDiacriticTile                  ;; 00:265D $38 $01
    dec  a ; DIALOG_DIACRITIC_2                   ;; 00:265F $3D

.handleDiacriticTile
    ldi  [hl], a                                  ;; 00:2660 $22
    ld   [hl], $00                                ;; 00:2661 $36 $00

.noDiacritic
    ld   a, [wDialogCharacterIndex]               ;; 00:2663 $FA $70 $C1
    ; increment character index
    ; (add is used because inc doesn't set the carry flag)
    add  a, $01                                   ;; 00:2666 $C6 $01
    ld   [wDialogCharacterIndex], a               ;; 00:2668 $EA $70 $C1
    ld   a, [wDialogCharacterIndexHi]             ;; 00:266B $FA $64 $C1
    adc  a, $00                                   ;; 00:266E $CE $00
    ld   [wDialogCharacterIndexHi], a             ;; 00:2670 $EA $64 $C1
    xor  a                                        ;; 00:2673 $AF
    ld   [wDialogIsWaitingForButtonPress], a      ;; 00:2674 $EA $CC $C1
    ; check if we've filled the dialog box with 32 characters
    ld   a, [wDialogNextCharPosition]             ;; 00:2677 $FA $71 $C1
    cp   $1F                                      ;; 00:267A $FE $1F
    jr   z, .dialogBoxFull                        ;; 00:267C $28 $10

.nextCharacter
    ld   a, [wDialogState]                        ;; 00:267E $FA $9F $C1
    and  $F0 ; mask DIALOG_BOX_BOTTOM_FLAG        ;; 00:2681 $E6 $F0
    or   DIALOG_LETTER_IN_1                       ;; 00:2683 $F6 $06
    ld   [wDialogState], a                        ;; 00:2685 $EA $9F $C1
    ld   a, $00                                   ;; 00:2688 $3E $00
    ld   [wDialogScrollDelay], a                  ;; 00:268A $EA $72 $C1
    ret                                           ;; 00:268D $C9

.dialogBoxFull
    jp   IncrementDialogStateAndReturn            ;; 00:268E $C3 $85 $24

DialogBoxOrigin::
    ; Background tile map address of the beginning of the
    ; text in a dialog box (one line above regular text, to
    ; make room for diacritics?)
.low
    db   $22 ; top
    db   $42 ; bottom
.high
    db   $98 ; top
    db   $99 ; bottom

; Handle a break in the dialog, ie. the dialog box is full but
; there is more text left to print (wDialogState == DIALOG_BREAK)
;
; This routine checks the next character to see if it's more
; text, and if so, display arrow and wait for the player to press A.
;
; If the next character instead is a terminating character like
; "@" or "<ask>", then we don't have an actual break in the dialog.
; This allows terminators to lie beyond the maximum line
; length of 16 characters without starting a new line; otherwise
; a final line of exactly 16 characters followed by "@" would print
; an extra empty line.
;
; However, there's a potential bug here; the check for the terminator
; is done after checking if two full lines of characters have been
; printed, so it only triggers on even-numbered lines. Dialog ending
; on an odd-numbered line will still print an empty line at the end.
DialogBreakHandler::
    ; @bug: This check should be done after the next two
    ; checks for terminators to trigger on odd-numbered lines as well.
    ld   a, [wDialogCharacterIndex]               ;; 00:2695 $FA $70 $C1
    and  $1F                                      ;; 00:2698 $E6 $1F
    jr   nz, .buildDrawCommand                    ;; 00:269A $20 $45
    ld   a, [wDialogNextChar]                     ;; 00:269C $FA $C3 $C3
    cp   "@"                                      ;; 00:269F $FE $FF
    jp   z, DialogDrawNextCharacterHandler.end    ;; 00:26A1 $CA $AD $25
    cp   "<ask>"                                  ;; 00:26A4 $FE $FE
    jp   z, DialogDrawNextCharacterHandler.choice ;; 00:26A6 $CA $95 $25
    ld   a, [wDialogIsWaitingForButtonPress]      ;; 00:26A9 $FA $CC $C1
    and  a                                        ;; 00:26AC $A7
    jr   nz, .dialogButtonPressHandler            ;; 00:26AD $20 $07
    inc  a                                        ;; 00:26AF $3C
    ld   [wDialogIsWaitingForButtonPress], a      ;; 00:26B0 $EA $CC $C1
    call DialogDrawNextCharacterHandler.endDialog ;; 00:26B3 $CD $9F $25

.dialogButtonPressHandler
    call DrawDialogArrowTrampoline                ;; 00:26B6 $CD $BB $27
    ldh  a, [hJoypadState]                        ;; 00:26B9 $F0 $CC
    bit  J_BIT_A, a                               ;; 00:26BB $CB $67
    jr   nz, .buildDrawCommand                    ;; 00:26BD $20 $22
    bit  J_BIT_B, a                               ;; 00:26BF $CB $6F
    jr   z, DialogScrollingStartHandler           ;; 00:26C1 $28 $51
    ; The following code looks up whether the
    ; current dialog can be skipped with the B
    ; button, but this information is only used
    ; if __SKIP_DIALOG_SUPPORT__ is set.
    ld   a, BANK(DialogBankTable)                 ;; 00:26C3 $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:26C5 $EA $00 $21
    ld   a, [wGameplayType]                       ;; 00:26C8 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 00:26CB $FE $07
    jp   z, SkipDialog                            ;; 00:26CD $CA $8B $27
    ld   a, [wDialogIndex]                        ;; 00:26D0 $FA $73 $C1
    ld   e, a                                     ;; 00:26D3 $5F
    ld   a, [wDialogIndexHi]                      ;; 00:26D4 $FA $12 $C1
    ld   d, a                                     ;; 00:26D7 $57
    ld   hl, DialogBankTable                      ;; 00:26D8 $21 $41 $47
    add  hl, de                                   ;; 00:26DB $19
IF __SKIP_DIALOG_SUPPORT__
    bit  7, [hl]
ELSE
    ld   a, [hl]                                  ;; 00:26DC $7E
    and  a                                        ;; 00:26DD $A7
ENDC
    jp   z, SkipDialog                            ;; 00:26DE $CA $8B $27

.buildDrawCommand
    ; Build a draw command for the dialog background

    ; e = (wDialogState == DIALOG_CLOSED ? 0 : 1)
    ld   e, $00                                   ;; 00:26E1 $1E $00
    ld   a, [wDialogState]                        ;; 00:26E3 $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 00:26E6 $E6 $80
    jr   z, .closed                               ;; 00:26E8 $28 $01
    inc  e                                        ;; 00:26EA $1C
.closed

    ld   d, $00                                   ;; 00:26EB $16 $00
    ld   hl, DialogBoxOrigin.high                 ;; 00:26ED $21 $93 $26
    add  hl, de                                   ;; 00:26F0 $19
    ld   a, [wBGOriginHigh]                       ;; 00:26F1 $FA $2E $C1
    add  a, [hl]                                  ;; 00:26F4 $86
    ld   [wDrawCommand.destinationHigh], a        ;; 00:26F5 $EA $01 $D6
    ld   hl, DialogBoxOrigin.low                  ;; 00:26F8 $21 $91 $26
    add  hl, de                                   ;; 00:26FB $19
    ld   a, [wBGOriginLow]                        ;; 00:26FC $FA $2F $C1
    add  a, [hl]                                  ;; 00:26FF $86
    ld   [wDrawCommand.destinationLow], a         ;; 00:2700 $EA $02 $D6
    ld   a, DC_FILL_ROW | $0F                     ;; 00:2703 $3E $4F
    ld   [wDrawCommand.length], a                 ;; 00:2705 $EA $03 $D6
    ldh  a, [hDialogBackgroundTile]               ;; 00:2708 $F0 $E8
    ld   [wDrawCommand.length+ 1], a              ;; 00:270A $EA $04 $D6
    xor  a                                        ;; 00:270D $AF
    ld   [wDrawCommand.data + 1], a               ;; 00:270E $EA $05 $D6
IF __OPTIMIZATIONS_2__
    jp   IncrementDialogState
ELSE
    call IncrementDialogState                     ;; 00:2711 $CD $85 $24
    ; fallthrough
ENDC

DialogScrollingStartHandler::
    ret                                           ;; 00:2714 $C9

DialogBoxMidOrigin::
    ; The BG tile map address of the line inbetween
    ; the first and second lines of text in a dialog box,
    ; which is temporarily filled with the second line
    ; when scrolling text after a break in the dialog
.low
    db   $62 ; top
    db   $82 ; bottom                                  ;; 00:2715
.high
    db   $98 ; top
    db   $99 ; bottom                                  ;; 00:2717

; Scroll dialog line?
DialogBeginScrolling::
    ld   e, $00                                   ;; 00:2719 $1E $00
    ld   a, [wDialogState]                        ;; 00:271B $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 00:271E $E6 $80
    jr   z, label_2723                            ;; 00:2720 $28 $01
    inc  e                                        ;; 00:2722 $1C

label_2723::
    ld   d, $00                                   ;; 00:2723 $16 $00
    ld   hl, DialogBoxMidOrigin.high              ;; 00:2725 $21 $17 $27
    add  hl, de                                   ;; 00:2728 $19
    ld   a, [wBGOriginHigh]                       ;; 00:2729 $FA $2E $C1
    add  a, [hl]                                  ;; 00:272C $86
    ld   b, a                                     ;; 00:272D $47
    ld   hl, DialogBoxMidOrigin.low               ;; 00:272E $21 $15 $27

label_2731::
    add  hl, de                                   ;; 00:2731 $19
    ld   a, [wBGOriginLow]                        ;; 00:2732 $FA $2F $C1
    add  a, [hl]                                  ;; 00:2735 $86
    ld   c, a                                     ;; 00:2736 $4F
    ld   e, $10                                   ;; 00:2737 $1E $10

label_2739::
    ld   a, c                                     ;; 00:2739 $79
    sub  a, $20                                   ;; 00:273A $D6 $20
    ld   l, a                                     ;; 00:273C $6F
    ld   h, b                                     ;; 00:273D $60
    ld   a, [bc]                                  ;; 00:273E $0A
    ld   [hl], a                                  ;; 00:273F $77
    push bc                                       ;; 00:2740 $C5
    ld   a, c                                     ;; 00:2741 $79
    add  a, $20                                   ;; 00:2742 $C6 $20
    ld   c, a                                     ;; 00:2744 $4F
    ld   a, l                                     ;; 00:2745 $7D
    add  a, $20                                   ;; 00:2746 $C6 $20
    ld   l, a                                     ;; 00:2748 $6F
    ld   a, [bc]                                  ;; 00:2749 $0A
    ld   [hl], a                                  ;; 00:274A $77
    ld   a, l                                     ;; 00:274B $7D
    add  a, $20                                   ;; 00:274C $C6 $20
    ld   l, a                                     ;; 00:274E $6F
    ldh  a, [hDialogBackgroundTile]               ;; 00:274F $F0 $E8
    ld   [hl], a                                  ;; 00:2751 $77
    pop  bc                                       ;; 00:2752 $C1
    inc  bc                                       ;; 00:2753 $03
    ld   a, c                                     ;; 00:2754 $79
    and  $1F                                      ;; 00:2755 $E6 $1F
    jr   nz, label_275D                           ;; 00:2757 $20 $04
    ld   a, c                                     ;; 00:2759 $79
    sub  a, $20                                   ;; 00:275A $D6 $20
    ld   c, a                                     ;; 00:275C $4F

label_275D::
    dec  e                                        ;; 00:275D $1D
    jr   nz, label_2739                           ;; 00:275E $20 $D9
    ld   a, $08  ; Pause the scrolling for 8 frames ;; 00:2760 $3E $08
    ld   [wDialogScrollDelay], a                  ;; 00:2762 $EA $72 $C1
    jp   IncrementDialogStateAndReturn            ;; 00:2765 $C3 $85 $24

DialogScrollingEndHandler::
    ret                                           ;; 00:2768 $C9

DialogBoxFirstLineOrigin::
    ; Background tile map address of the beginning of the
    ; actual first line text in a dialog box
.low
    db   $42 ; top
    db   $62 ; bottom
.high
    db   $98 ; top
    db   $99 ; bottom

DialogFinishScrolling::
    ld   e, 0                                     ;; 00:276D $1E $00
    ld   a, [wDialogState]                        ;; 00:276F $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 00:2772 $E6 $80
    jr   z, label_2777                            ;; 00:2774 $28 $01
    inc  e                                        ;; 00:2776 $1C

label_2777::
    ld   d, $00                                   ;; 00:2777 $16 $00
    ld   hl, DialogBoxFirstLineOrigin.high        ;; 00:2779 $21 $6B $27
    add  hl, de                                   ;; 00:277C $19
    ld   a, [wBGOriginHigh]                       ;; 00:277D $FA $2E $C1
    add  a, [hl]                                  ;; 00:2780 $86
    ld   b, a                                     ;; 00:2781 $47
    ld   hl, DialogBoxFirstLineOrigin.low         ;; 00:2782 $21 $69 $27
    call label_2731                               ;; 00:2785 $CD $31 $27
    jp   DialogDrawNextCharacterHandler.nextCharacter ;; 00:2788 $C3 $7E $26

SkipDialog::
    ld   a, $02                                   ;; 00:278B $3E $02
    ld   [wDialogAskSelectionIndex], a            ;; 00:278D $EA $77 $C1
    jp   UpdateDialogState                        ;; 00:2790 $C3 $96 $24

DialogChoiceHandler::
    ; Was A pushed?
    ldh  a, [hJoypadState]                        ;; 00:2793 $F0 $CC
    bit  J_BIT_A, a                               ;; 00:2795 $CB $67
    jp   nz, .jp_27B7                             ;; 00:2797 $C2 $B7 $27
    and  J_RIGHT | J_LEFT                         ;; 00:279A $E6 $03
    jr   z, .jp_27AA                              ;; 00:279C $28 $0C
    ld   hl, wDialogAskSelectionIndex             ;; 00:279E $21 $77 $C1
    ld   a, [hl]                                  ;; 00:27A1 $7E
    inc  a                                        ;; 00:27A2 $3C
    and  $01                                      ;; 00:27A3 $E6 $01
    ld   [hl], a                                  ;; 00:27A5 $77
    ld   a, JINGLE_MOVE_SELECTION                 ;; 00:27A6 $3E $0A
    ldh  [hJingle], a                             ;; 00:27A8 $E0 $F2

.jp_27AA
    ldh  a, [hFrameCounter]                       ;; 00:27AA $F0 $E7
    and  $10                                      ;; 00:27AC $E6 $10
    ret  z                                        ;; 00:27AE $C8
    jpsb DrawDialogChoiceMarker                   ;; 00:27AF $3E $17 $EA $00 $21 $C3 $CC $7D

.jp_27B7
IF __OPTIMIZATIONS_2__
    jp   UpdateDialogState
ELSE
    call UpdateDialogState                        ;; 00:27B7 $CD $96 $24
    ret                                           ;; 00:27BA $C9
ENDC

DrawDialogArrowTrampoline::
    jpsb DrawDialogArrow                          ;; 00:27BB $3E $17 $EA $00 $21 $C3 $7C $7D
