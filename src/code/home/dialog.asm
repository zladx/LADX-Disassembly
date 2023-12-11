;
; Dialog display
;

ExecuteDialog::
    ; If DialogState == 0, don't do anything.
    ld   a, [wDialogState]                        ; $2321: $FA $9F $C1
    and  a                                        ; $2324: $A7
    ret  z                                        ; $2325: $C8

    ; Configure the dialog background color
    ld   e, a                                     ; $2326: $5F
    ld   a, [wGameplayType]                       ; $2327: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $232A: $FE $01
    ; By default use a dark background
    ld   a, DIALOG_BG_TILE_DARK                   ; $232C: $3E $7E
    jr   nz, .writeBackgroundTile                 ; $232E: $20 $02
.lightBackground
    ; but during credits use a light background
    ld   a, DIALOG_BG_TILE_LIGHT                  ; $2330: $3E $7F
.writeBackgroundTile
    ldh  [hDialogBackgroundTile], a               ; $2332: $E0 $E8

    ; If the character index is > 20 (i.e. past the first two lines),
    ; mask wDialogNextCharPosition around $10
    ld   a, [wDialogCharacterIndexHi]             ; $2334: $FA $64 $C1
    and  a                                        ; $2337: $A7
    ld   a, [wDialogCharacterIndex]               ; $2338: $FA $70 $C1
    jr   nz, .wrapPosition                        ; $233B: $20 $04
    cp   $20                                      ; $233D: $FE $20
    jr   c, .writePosition                        ; $233F: $38 $04
.wrapPosition
    and  $0F                                      ; $2341: $E6 $0F
    or   $10                                      ; $2343: $F6 $10
.writePosition
    ld   [wDialogNextCharPosition], a             ; $2345: $EA $71 $C1

    ; Discard wDialogState upper bit (dialog displayed on bottom)
    ld   a, e                                     ; $2348: $7B
    and  ~DIALOG_BOX_BOTTOM_FLAG                  ; $2349: $E6 $7F

    ; Dispatch according to the dialog state
    dec  a                                        ; $234B: $3D
    JP_TABLE                                      ; $234C: $C7
._00 dw DialogOpenAnimationStartHandler           ; $234D
._01 dw DialogOpenAnimationHandler                ; $234F
._02 dw DialogOpenAnimationHandler                ; $2351
._03 dw DialogOpenAnimationHandler                ; $2353
._04 dw DialogOpenAnimationEndHandler             ; $2355
._05 dw DialogLetterAnimationStartHandler         ; $2357
._06 dw DialogLetterAnimationEndHandler           ; $2359
._07 dw DialogDrawNextCharacterHandler            ; $235B
._08 dw DialogBreakHandler                        ; $235D
._09 dw DialogScrollingStartHandler               ; $235F
._0A dw DialogScrollingEndHandler                 ; $2361
._0B dw DialogFinishedHandler                     ; $2363
._0C dw DialogChoiceHandler                       ; $2365
._0D dw DialogClosingBeginHandler                 ; $2367
._0E dw DialogClosingEndHandler                   ; $2369

DialogOpenAnimationStartHandler::
    jpsb DialogOpenAnimationStart                 ; $236B: $3E $14 $EA $00 $21 $C3 $49 $54

; Open a dialog in the $100-$1FF range
; Input:
;   a: dialog index in table 1
OpenDialogInTable1::
    call OpenDialogInTable0                       ; $2373: $CD $85 $23
    ; Overwrite the table number
    ld   a, $01                                   ; $2376: $3E $01
    ld   [wDialogIndexHi], a                      ; $2378: $EA $12 $C1
    ret                                           ; $237B: $C9

; Open a dialog in the $200-$2FF range
; Input:
;   a: dialog index in table 2
OpenDialogInTable2::
    call OpenDialogInTable0                       ; $237C: $CD $85 $23
    ; Overwrite the table number
    ld   a, $02                                   ; $237F: $3E $02
    ld   [wDialogIndexHi], a                      ; $2381: $EA $12 $C1
    ret                                           ; $2384: $C9

; Open a dialog in the $00-$FF range
; Input:
;   a: dialog index in table 0
OpenDialogInTable0::
    ; Clear wDialogAskSelectionIndex
    push af                                       ; $2385: $F5
    xor  a                                        ; $2386: $AF
    ld   [wDialogAskSelectionIndex], a            ; $2387: $EA $77 $C1
    pop  af                                       ; $238A: $F1

    ; Save the dialog index
    ld   [wDialogIndex], a                        ; $238B: $EA $73 $C1

    ; Initialize dialog variables
    xor  a                                        ; $238E: $AF
    ld   [wDialogOpenCloseAnimationFrame], a      ; $238F: $EA $6F $C1
    ld   [wDialogCharacterIndex], a               ; $2392: $EA $70 $C1
    ld   [wDialogCharacterIndexHi], a             ; $2395: $EA $64 $C1
    ld   [wNameIndex], a                          ; $2398: $EA $08 $C1
    ld   [wDialogIndexHi], a                      ; $239B: $EA $12 $C1

    ld   a, $0F                                   ; $239E: $3E $0F
    ld   [wDialogSFX], a                          ; $23A0: $EA $AB $C5

    ; Determine if the dialog is displayed on top or bottom
    ; wDialogState = hLinkPositionY < $48 ? $81 : $01
    ldh  a, [hLinkPositionY]                      ; $23A3: $F0 $99
    cp   $48                                      ; $23A5: $FE $48
    rra                                           ; $23A7: $1F
    and  DIALOG_BOX_BOTTOM_FLAG                   ; $23A8: $E6 $80
    or   DIALOG_OPENING_1                         ; $23AA: $F6 $01
    ld   [wDialogState], a                        ; $23AC: $EA $9F $C1

    ret                                           ; $23AF: $C9

DialogOpenAnimationHandler::
    ret                                           ; $23B0: $C9

DialogClosingEndHandler::
    xor  a                                        ; $23B1: $AF
    ld   [wDialogState], a                        ; $23B2: $EA $9F $C1
    ld   a, DIALOG_COOLDOWN                       ; $23B5: $3E $18
    ld   [wDialogCooldown], a                     ; $23B7: $EA $34 $C1
    ldh  a, [hIsGBC]                              ; $23BA: $F0 $FE
    and  a                                        ; $23BC: $A7
    ret  z                                        ; $23BD: $C8

    ld   a, [wGameplayType]                       ; $23BE: $FA $95 $DB
    cp   a, GAMEPLAY_WORLD                        ; $23C1: $FE $0B
    ret  nz                                       ; $23C3: $C0

    ld   a, [wBGPaletteEffectAddress]             ; $23C4: $FA $CC $C3
    cp   a, $08                                   ; $23C7: $FE $08
    ret  c                                        ; $23C9: $D8

    jpsb func_021_53CF                            ; $23CA: $3E $21 $EA $00 $21 $C3 $CF $53

; This array actually begins two bytes before,
; in the middle of the `jp` instruction,
; and so has two extra bytes at the beginning ($CF, $53).
data_23D2::
    db   $00, $24                                 ; $23D2
    db   $48, $00                                 ; $23D4

data_23D6::
    db   $24, $48, $98, $98, $98, $99             ; $23D6

data_23DC::
    db   $99, $99, $21, $61, $A1, $41, $81, $C1   ; $23DC

; Open dialog animation
; Saves tiles under the dialog box?
func_23E4::
    ld   a, [wDialogState]                        ; $23E4: $FA $9F $C1
    bit  DIALOG_BOX_BOTTOM_BIT, a                 ; $23E7: $CB $7F
    jr   z, .jr_23EF                              ; $23E9: $28 $04
    and  ~DIALOG_BOX_BOTTOM_FLAG                  ; $23EB: $E6 $7F
    add  a, $03                                   ; $23ED: $C6 $03
.jr_23EF

    ld   e, a                                     ; $23EF: $5F
    ld   d, $00                                   ; $23F0: $16 $00
    ld   hl, data_23D2 - $02                      ; $23F2: $21 $D0 $23
    add  hl, de                                   ; $23F5: $19
    ld   a, [hl]                                  ; $23F6: $7E
    add  a, LOW(wD500)                            ; $23F7: $C6 $00
    ld   c, a                                     ; $23F9: $4F
    ld   a, HIGH(wD500)                           ; $23FA: $3E $D5
    adc  a, $00                                   ; $23FC: $CE $00
    ld   b, a                                     ; $23FE: $47

    ld   hl, data_23DC                            ; $23FF: $21 $DC $23
    add  hl, de                                   ; $2402: $19
    ld   a, [wBGOriginLow]                        ; $2403: $FA $2F $C1
    add  a, [hl]                                  ; $2406: $86
    ld   l, a                                     ; $2407: $6F
    ldh  [hMultiPurpose0], a                      ; $2408: $E0 $D7
    ld   hl, data_23D6                            ; $240A: $21 $D6 $23
    add  hl, de                                   ; $240D: $19
    ld   a, [wBGOriginHigh]                       ; $240E: $FA $2E $C1
    add  a, [hl]                                  ; $2411: $86
    ld   h, a                                     ; $2412: $67
    ldh  a, [hMultiPurpose0]                      ; $2413: $F0 $D7
    ld   l, a                                     ; $2415: $6F
    xor  a                                        ; $2416: $AF
    ld   e, a                                     ; $2417: $5F
    ld   d, a                                     ; $2418: $57
    ldh  a, [hIsGBC]                              ; $2419: $F0 $FE
    and  a                                        ; $241B: $A7
    jr   nz, label_2444                           ; $241C: $20 $26

    ; DMG version of the loop
.loop
    ld   a, [hli]                                 ; $241E: $2A
    ld   [bc], a                                  ; $241F: $02
    inc  bc                                       ; $2420: $03

    ld   a, l                                     ; $2421: $7D
    and  $1F                                      ; $2422: $E6 $1F
    jr   nz, .jr_242B                             ; $2424: $20 $05
    ld   a, l                                     ; $2426: $7D
    dec  a                                        ; $2427: $3D
    and  $E0                                      ; $2428: $E6 $E0
    ld   l, a                                     ; $242A: $6F
.jr_242B

    inc  e                                        ; $242B: $1C
    ld   a, e                                     ; $242C: $7B
    cp   $12                                      ; $242D: $FE $12
    jr   nz, .loop                                ; $242F: $20 $ED

    ld   e, $00                                   ; $2431: $1E $00
    ldh  a, [hMultiPurpose0]                      ; $2433: $F0 $D7
    add  a, $20                                   ; $2435: $C6 $20
    ldh  [hMultiPurpose0], a                      ; $2437: $E0 $D7
    jr   nc, .jr_243C                             ; $2439: $30 $01
    inc  h                                        ; $243B: $24
.jr_243C

    ld   l, a                                     ; $243C: $6F
    inc  d                                        ; $243D: $14
    ld   a, d                                     ; $243E: $7A
    cp   $02                                      ; $243F: $FE $02
    jr   nz, .loop                                ; $2441: $20 $DB
    ret                                           ; $2443: $C9

label_2444::
    ld   a, [hl]                                  ; $2444: $7E
    ld   [bc], a                                  ; $2445: $02
    ld   a, $01                                   ; $2446: $3E $01
    ldh  [rVBK], a                                ; $2448: $E0 $4F

label_244A::
    ld   a, $02                                   ; $244A: $3E $02
    ldh  [rSVBK], a                               ; $244C: $E0 $70
    ld   a, [hl]                                  ; $244E: $7E
    ld   [bc], a                                  ; $244F: $02
    xor  a                                        ; $2450: $AF
    ldh  [rVBK], a                                ; $2451: $E0 $4F
    ldh  [rSVBK], a                               ; $2453: $E0 $70
    inc  bc                                       ; $2455: $03
    ld   a, l                                     ; $2456: $7D
    add  a, $01                                   ; $2457: $C6 $01
    and  $1F                                      ; $2459: $E6 $1F
    jr   nz, label_2463                           ; $245B: $20 $06
    ld   a, l                                     ; $245D: $7D
    and  $E0                                      ; $245E: $E6 $E0
    ld   l, a                                     ; $2460: $6F
    jr   label_2464                               ; $2461: $18 $01

label_2463::
    inc  l                                        ; $2463: $2C

label_2464::
    inc  e                                        ; $2464: $1C
    ld   a, e                                     ; $2465: $7B
    cp   $12                                      ; $2466: $FE $12
    jr   nz, label_2444                           ; $2468: $20 $DA
    ld   e, $00                                   ; $246A: $1E $00
    ldh  a, [hMultiPurpose0]                      ; $246C: $F0 $D7
    add  a, $20                                   ; $246E: $C6 $20
    ldh  [hMultiPurpose0], a                      ; $2470: $E0 $D7
    jr   nc, label_2475                           ; $2472: $30 $01
    inc  h                                        ; $2474: $24

label_2475::
    ld   l, a                                     ; $2475: $6F
    inc  d                                        ; $2476: $14
    ld   a, d                                     ; $2477: $7A
    cp   $02                                      ; $2478: $FE $02
    jr   nz, label_2444                           ; $247A: $20 $C8
    ret                                           ; $247C: $C9

DialogOpenAnimationEndHandler::
    jpsb DialogOpenAnimationEnd                   ; $247D: $3E $1C $EA $00 $21 $C3 $2C $4A

IncrementDialogState::
IncrementDialogStateAndReturn::
    ld   hl, wDialogState                         ; $2485: $21 $9F $C1
    inc  [hl]                                     ; $2488: $34
    ret                                           ; $2489: $C9

DialogFinishedHandler::
    ; If wC1AB == 0...
    ld   a, [wC1AB]                               ; $248A: $FA $AB $C1
    and  a                                        ; $248D: $A7
    jr   nz, UpdateDialogState_return             ; $248E: $20 $1E
    ; ... and A or B is pressed...
    ldh  a, [hJoypadState]                        ; $2490: $F0 $CC
    and  J_A | J_B                                ; $2492: $E6 $30
    jr   z, UpdateDialogState_return              ; $2494: $28 $18
    ; ... update dialog state

UpdateDialogState::
    ; Clear wDialogOpenCloseAnimationFrame
    xor  a                                        ; $2496: $AF
    ld   [wDialogOpenCloseAnimationFrame], a      ; $2497: $EA $6F $C1

.if
    ; If GameplayType == PHOTO_ALBUM
    ld   a, [wGameplayType]                       ; $249A: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ; $249D: $FE $0D
    jr   nz, .else                                ; $249F: $20 $03
.then
    ; A = 0
    xor  a                                        ; $24A1: $AF
    jr   .fi                                      ; $24A2: $18 $07
.else
    ; A = (wDialogState & $F0) | $E
    ld   a, [wDialogState]                        ; $24A4: $FA $9F $C1
    and  $F0                                      ; $24A7: $E6 $F0
    or   $0E                                      ; $24A9: $F6 $0E
.fi
    ; Set dialog state
    ld   [wDialogState], a                        ; $24AB: $EA $9F $C1

UpdateDialogState_return:
    ret                                           ; $24AE: $C9

DialogClosingBeginHandler::
    jpsb AnimateDialogClosing                     ; $24AF: $3E $1C $EA $00 $21 $C3 $A8 $4A

DialogLetterAnimationStartHandler::
    ld   a, BANK(ClearLetterPixels)               ; $24B7: $3E $1C
    ld   [rSelectROMBank], a                      ; $24B9: $EA $00 $21
    ld   a, [wDialogScrollDelay]                  ; $24BC: $FA $72 $C1
    and  a                                        ; $24BF: $A7
    jr   z, .delayOver                            ; $24C0: $28 $05
    dec  a                                        ; $24C2: $3D
    ld   [wDialogScrollDelay], a                  ; $24C3: $EA $72 $C1
    ret                                           ; $24C6: $C9

.delayOver
    call ClearLetterPixels                        ; $24C7: $CD $F1 $49
    jp   IncrementDialogStateAndReturn            ; $24CA: $C3 $85 $24

DialogLetterAnimationEndHandler::
    ld   a, BANK(DialogPointerTable)              ; $24CD: $3E $1C
    ld   [rSelectROMBank], a                      ; $24CF: $EA $00 $21
    ld   a, [wDialogState]                        ; $24D2: $FA $9F $C1
    ld   c, a                                     ; $24D5: $4F
    ld   a, [wDialogNextCharPosition]             ; $24D6: $FA $71 $C1
    bit  DIALOG_BOX_BOTTOM_BIT, c                 ; $24D9: $CB $79
    jr   z, .jp_24DF                              ; $24DB: $28 $02
    add  a, $20                                   ; $24DD: $C6 $20

.jp_24DF
    ; bc = [wDialogNextCharPosition]
    ld   c, a                                     ; $24DF: $4F
    ld   b, $00                                   ; $24E0: $06 $00
    ; de = $01
    ld   e, $01                                   ; $24E2: $1E $01
    ld   d, $00                                   ; $24E4: $16 $00
    ld   a, [wBGOriginHigh]                       ; $24E6: $FA $2E $C1
    ld   hl, Data_01C_45C1                        ; $24E9: $21 $C1 $45
    add  hl, bc                                   ; $24EC: $09
    add  a, [hl]                                  ; $24ED: $86
    ld   hl, wDrawCommandsSize                    ; $24EE: $21 $00 $D6
    add  hl, de                                   ; $24F1: $19
    ldi  [hl], a                                  ; $24F2: $22
    ld   [wC175], a                               ; $24F3: $EA $75 $C1
    push hl                                       ; $24F6: $E5
    ld   hl, Data_01C_4601                        ; $24F7: $21 $01 $46
    add  hl, bc                                   ; $24FA: $09
    ld   a, [hl]                                  ; $24FB: $7E
    and  $E0                                      ; $24FC: $E6 $E0
    add  a, $20                                   ; $24FE: $C6 $20
    ld   e, a                                     ; $2500: $5F
    ld   a, [wBGOriginLow]                        ; $2501: $FA $2F $C1
    add  a, [hl]                                  ; $2504: $86
    ld   d, a                                     ; $2505: $57
    cp   e                                        ; $2506: $BB
    jr   c, .jp_250D                              ; $2507: $38 $04
    ld   a, d                                     ; $2509: $7A
    sub  a, $20                                   ; $250A: $D6 $20
    ld   d, a                                     ; $250C: $57

.jp_250D
    ld   a, d                                     ; $250D: $7A
    ld   [wC176], a                               ; $250E: $EA $76 $C1
    pop  hl                                       ; $2511: $E1
    ldi  [hl], a                                  ; $2512: $22
    xor  a                                        ; $2513: $AF
    ldi  [hl], a                                  ; $2514: $22
    push hl                                       ; $2515: $E5
    ld   a, [wDialogCharacterIndex]               ; $2516: $FA $70 $C1
    and  $1F                                      ; $2519: $E6 $1F
    ld   c, a                                     ; $251B: $4F
    ld   hl, Data_01C_45A1                        ; $251C: $21 $A1 $45
    add  hl, bc                                   ; $251F: $09
    ld   a, [hl]                                  ; $2520: $7E
    pop  hl                                       ; $2521: $E1
    ldi  [hl], a                                  ; $2522: $22
    call IncrementDialogState                     ; $2523: $CD $85 $24
    jp   DialogDrawNextCharacterHandler           ; $2526: $C3 $29 $25

DialogDrawNextCharacterHandler::
    ld   a, BANK(DialogPointerTable)              ; $2529: $3E $1C
    ld   [rSelectROMBank], a                      ; $252B: $EA $00 $21
    ld   a, [wDialogCharacterIndex]               ; $252E: $FA $70 $C1
    and  $1F                                      ; $2531: $E6 $1F
    ld   c, a                                     ; $2533: $4F
    ld   b, $00                                   ; $2534: $06 $00
    ld   e, $05                                   ; $2536: $1E $05
    ld   d, $00                                   ; $2538: $16 $00
    ld   hl, DialogCharacterYTable                ; $253A: $21 $81 $45
    add  hl, bc                                   ; $253D: $09
    ld   a, [hl]                                  ; $253E: $7E

    ld   hl, wDrawCommandsSize                    ; $253F: $21 $00 $D6
    add  hl, de                                   ; $2542: $19
    ldi  [hl], a ; high byte of tile destination address ; $2543: $22
    push hl                                       ; $2544: $E5
    ld   hl, DialogCharacterXTable                ; $2545: $21 $61 $45
    add  hl, bc                                   ; $2548: $09
    ld   a, [hl]                                  ; $2549: $7E
    pop  hl                                       ; $254A: $E1
    ldi  [hl], a ; low byte of tile destination address ; $254B: $22
    ld   a, $0F                                   ; $254C: $3E $0F
    ldi  [hl], a ; number of bytes                ; $254E: $22
    push hl                                       ; $254F: $E5
    ld   a, [wDialogIndexHi]                      ; $2550: $FA $12 $C1
    ld   d, a                                     ; $2553: $57
    ld   a, [wDialogIndex]                        ; $2554: $FA $73 $C1
    ld   e, a                                     ; $2557: $5F
    sla  e                                        ; $2558: $CB $23
    rl   d                                        ; $255A: $CB $12
    ld   hl, DialogPointerTable                   ; $255C: $21 $01 $40
    add  hl, de                                   ; $255F: $19
    ld   a, [hli]                                 ; $2560: $2A
    ld   e, a                                     ; $2561: $5F
    ld   d, [hl]                                  ; $2562: $56
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
    push de                                       ; $2563: $D5
    ld   a, [wDialogIndex]                        ; $2564: $FA $73 $C1
    ld   e, a                                     ; $2567: $5F
    ld   a, [wDialogIndexHi]                      ; $2568: $FA $12 $C1
    ld   d, a                                     ; $256B: $57
    ld   hl, DialogBankTable                      ; $256C: $21 $41 $47
    add  hl, de                                   ; $256F: $19
    ld   a, [hl] ; bank                           ; $2570: $7E
    ; Mask out DIALOG_UNSKIPPABLE flag
    and  $3F                                      ; $2571: $E6 $3F
    ld   [rSelectROMBank], a                      ; $2573: $EA $00 $21
    pop  hl                                       ; $2576: $E1
ENDC
    ld   a, [wDialogCharacterIndex]               ; $2577: $FA $70 $C1
    ld   e, a                                     ; $257A: $5F
    ld   a, [wDialogCharacterIndexHi]             ; $257B: $FA $64 $C1
    ld   d, a                                     ; $257E: $57
    add  hl, de                                   ; $257F: $19
    ld   a, [hli]                                 ; $2580: $2A
    ld   e, a                                     ; $2581: $5F
    ; Peek ahead and store the next character in
    ; the dialog, for later use in DialogBreakHandler
    ld   a, [hl]                                  ; $2582: $7E
    ld   [wDialogNextChar], a                     ; $2583: $EA $C3 $C3
    call ReloadSavedBank                          ; $2586: $CD $1D $08
    ld   a, e                                     ; $2589: $7B
    ldh  [hMultiPurpose0], a                      ; $258A: $E0 $D7
    cp   "<ask>" ; $fe                            ; $258C: $FE $FE
    jr   nz, .notChoice                           ; $258E: $20 $14
    pop  hl                                       ; $2590: $E1
    xor  a                                        ; $2591: $AF
    ld   [wDrawCommand], a                        ; $2592: $EA $01 $D6

.choice
    ld   a, [wDialogState]                        ; $2595: $FA $9F $C1
    ; Keep DIALOG_BOX_BOTTOM_FLAG
    and  $F0                                      ; $2598: $E6 $F0
    or   DIALOG_CHOICE                            ; $259A: $F6 $0D
    ld   [wDialogState], a                        ; $259C: $EA $9F $C1

.endDialog
    ld   a, JINGLE_DIALOG_BREAK                   ; $259F: $3E $15
    ldh  [hJingle], a                             ; $25A1: $E0 $F2
    ret                                           ; $25A3: $C9

.notChoice
    cp   "@" ; $ff                                ; $25A4: $FE $FF
    jr   nz, .notEnd                              ; $25A6: $20 $15
    pop  hl                                       ; $25A8: $E1
    xor  a                                        ; $25A9: $AF
    ld   [wDrawCommand], a                        ; $25AA: $EA $01 $D6

.end
    ld   a, [wDialogState]                        ; $25AD: $FA $9F $C1
    ; Keep DIALOG_BOX_BOTTOM_FLAG
    and  $F0                                      ; $25B0: $E6 $F0
    or   DIALOG_END                               ; $25B2: $F6 $0C
    ld   [wDialogState], a                        ; $25B4: $EA $9F $C1
    ret                                           ; $25B7: $C9

.ThiefString::
FOR INDEX, 5
    IF CHARLEN("{THIEF_NAME}") < INDEX + 1
        db 0
    ELSE
        db CHARSUB("{THIEF_NAME}", INDEX + 1) + 1 ; $25B8
    ENDC
ENDR

.notEnd
    cp   " "                                      ; $25BD: $FE $20
    jr   z, .noSFX                                ; $25BF: $28 $1F
    push af                                       ; $25C1: $F5
    ld   a, [wDialogSFX]                          ; $25C2: $FA $AB $C5
    ld   d, a                                     ; $25C5: $57
    ld   e, $01                                   ; $25C6: $1E $01
    cp   WAVE_SFX_TEXT_PRINT                      ; $25C8: $FE $0F
    jr   z, .handleFrequency                      ; $25CA: $28 $08
    ld   e, $07                                   ; $25CC: $1E $07
    cp   WAVE_SFX_OWL_HOOT                        ; $25CE: $FE $19
    jr   z, .handleFrequency                      ; $25D0: $28 $02
    ld   e, $03                                   ; $25D2: $1E $03
.handleFrequency
    ld   a, [wDialogCharacterIndex]               ; $25D4: $FA $70 $C1
    add  a, $04                                   ; $25D7: $C6 $04
    and  e                                        ; $25D9: $A3
    jr   nz, .skipSFX                             ; $25DA: $20 $03
    ld   a, d                                     ; $25DC: $7A
    ldh  [hWaveSfx], a                            ; $25DD: $E0 $F3
.skipSFX
    pop  af                                       ; $25DF: $F1

.noSFX
    ld   d, $00                                   ; $25E0: $16 $00
    cp   "#" ; character of player name           ; $25E2: $FE $23
    jr   nz, .notName                             ; $25E4: $20 $22
    ld   a, [wNameIndex]                          ; $25E6: $FA $08 $C1
    ld   e, a                                     ; $25E9: $5F
    inc  a                                        ; $25EA: $3C
    cp   NAME_LENGTH                              ; $25EB: $FE $05
    jr   nz, .notOver                             ; $25ED: $20 $01
    xor  a                                        ; $25EF: $AF
.notOver
    ld   [wNameIndex], a                          ; $25F0: $EA $08 $C1
    ld   hl, wName                                ; $25F3: $21 $4F $DB
    ld   a, [wIsThief]                            ; $25F6: $FA $6E $DB
    and  a                                        ; $25F9: $A7
    jr   z, .notThief                             ; $25FA: $28 $03
    ld   hl, .ThiefString                         ; $25FC: $21 $B8 $25
.notThief
    add  hl, de                                   ; $25FF: $19
    ld   a, [hl]                                  ; $2600: $7E
    ; Name characters are from NameEntryCharmap
    ; which is ASCII + 1, so decrement it here to
    ; convert it to DialogCharmap which is ASCII
    dec  a                                        ; $2601: $3D
    ; Convert NameEntryCharmap space ($00) to
    ; DialogCharmap/ASCII space ($20)
    PUSHC
    SETCHARMAP NameEntryCharmap
    cp   " " - 1                                  ; $2602: $FE $FF
    POPC
    jr   nz, .handleNameChar                      ; $2604: $20 $02
    ld   a, " "                                   ; $2606: $3E $20
.handleNameChar

.notName
    ldh  [hMultiPurpose1], a                      ; $2608: $E0 $D8
    ld   e, a                                     ; $260A: $5F
    ld   a, BANK(CodepointToTileMap)              ; $260B: $3E $1C
    ld   [rSelectROMBank], a                      ; $260D: $EA $00 $21
    ld   hl, CodepointToTileMap                   ; $2610: $21 $41 $46
    add  hl, de                                   ; $2613: $19
    ld   e, [hl]                                  ; $2614: $5E
    ld   d, $00                                   ; $2615: $16 $00
    sla  e                                        ; $2617: $CB $23
    rl   d                                        ; $2619: $CB $12
    sla  e                                        ; $261B: $CB $23
    rl   d                                        ; $261D: $CB $12
    sla  e                                        ; $261F: $CB $23
    rl   d                                        ; $2621: $CB $12
    sla  e                                        ; $2623: $CB $23
    rl   d                                        ; $2625: $CB $12
    call ReloadSavedBank                          ; $2627: $CD $1D $08
    ld   hl, FontTiles                            ; $262A: $21 $00 $50
    add  hl, de                                   ; $262D: $19
    ld   c, l                                     ; $262E: $4D
    ld   b, h                                     ; $262F: $44
    pop  hl                                       ; $2630: $E1
    ld   e, $10                                   ; $2631: $1E $10
    ; copy character tile data to wDrawCommandData
.copyTileLoop
    ld   a, [bc]                                  ; $2633: $0A
    ldi  [hl], a                                  ; $2634: $22
    inc  bc                                       ; $2635: $03
    dec  e                                        ; $2636: $1D
    jr   nz, .copyTileLoop                        ; $2637: $20 $FA
    ld   [hl], $00                                ; $2639: $36 $00
    push hl                                       ; $263B: $E5

    ; Check if the current character has a diacritic tile above
    ; (if compiled with support for diacritics)
    ld   a, BANK(CodepointToDiacritic)            ; $263C: $3E $1C
    ld   [rSelectROMBank], a ; current character  ; $263E: $EA $00 $21
    ldh  a, [hMultiPurpose1]                      ; $2641: $F0 $D8
    ld   e, a                                     ; $2643: $5F
    ld   d, $00                                   ; $2644: $16 $00
IF __DIACRITICS_SUPPORT__
    ld   hl, CodepointToDiacritic
    add  hl, de
    ld   a, [hl]
ELSE
    xor  a                                        ; $2646: $AF
ENDC
    pop  hl                                       ; $2647: $E1
    and  a                                        ; $2648: $A7
    jr   z, .noDiacritic                          ; $2649: $28 $18
    ld   e, a                                     ; $264B: $5F
    ld   a, [wC175]                               ; $264C: $FA $75 $C1
    ldi  [hl], a                                  ; $264F: $22
    ld   a, [wC176]                               ; $2650: $FA $76 $C1
    sub  a, $20                                   ; $2653: $D6 $20
    ldi  [hl], a                                  ; $2655: $22
    ld   a, $00                                   ; $2656: $3E $00
    ldi  [hl], a                                  ; $2658: $22
    ld   a, DIALOG_DIACRITIC_1                    ; $2659: $3E $C9
    rr   e                                        ; $265B: $CB $1B
    jr   c, .handleDiacriticTile                  ; $265D: $38 $01
    dec  a ; DIALOG_DIACRITIC_2                   ; $265F: $3D

.handleDiacriticTile
    ldi  [hl], a                                  ; $2660: $22
    ld   [hl], $00                                ; $2661: $36 $00

.noDiacritic
    ld   a, [wDialogCharacterIndex]               ; $2663: $FA $70 $C1
    ; increment character index
    ; (add is used because inc doesn't set the carry flag)
    add  a, $01                                   ; $2666: $C6 $01
    ld   [wDialogCharacterIndex], a               ; $2668: $EA $70 $C1
    ld   a, [wDialogCharacterIndexHi]             ; $266B: $FA $64 $C1
    adc  a, $00                                   ; $266E: $CE $00
    ld   [wDialogCharacterIndexHi], a             ; $2670: $EA $64 $C1
    xor  a                                        ; $2673: $AF
    ld   [wDialogIsWaitingForButtonPress], a      ; $2674: $EA $CC $C1
    ; check if we've filled the dialog box with 32 characters
    ld   a, [wDialogNextCharPosition]             ; $2677: $FA $71 $C1
    cp   $1F                                      ; $267A: $FE $1F
    jr   z, .dialogBoxFull                        ; $267C: $28 $10

.nextCharacter
    ld   a, [wDialogState]                        ; $267E: $FA $9F $C1
    and  $F0 ; mask DIALOG_BOX_BOTTOM_FLAG        ; $2681: $E6 $F0
    or   DIALOG_LETTER_IN_1                       ; $2683: $F6 $06
    ld   [wDialogState], a                        ; $2685: $EA $9F $C1
    ld   a, $00                                   ; $2688: $3E $00
    ld   [wDialogScrollDelay], a                  ; $268A: $EA $72 $C1
    ret                                           ; $268D: $C9

.dialogBoxFull
    jp   IncrementDialogStateAndReturn            ; $268E: $C3 $85 $24

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
    ld   a, [wDialogCharacterIndex]               ; $2695: $FA $70 $C1
    and  $1F                                      ; $2698: $E6 $1F
    jr   nz, .buildDrawCommand                    ; $269A: $20 $45
    ld   a, [wDialogNextChar]                     ; $269C: $FA $C3 $C3
    cp   "@"                                      ; $269F: $FE $FF
    jp   z, DialogDrawNextCharacterHandler.end    ; $26A1: $CA $AD $25
    cp   "<ask>"                                  ; $26A4: $FE $FE
    jp   z, DialogDrawNextCharacterHandler.choice ; $26A6: $CA $95 $25
    ld   a, [wDialogIsWaitingForButtonPress]      ; $26A9: $FA $CC $C1
    and  a                                        ; $26AC: $A7
    jr   nz, .dialogButtonPressHandler            ; $26AD: $20 $07
    inc  a                                        ; $26AF: $3C
    ld   [wDialogIsWaitingForButtonPress], a      ; $26B0: $EA $CC $C1
    call DialogDrawNextCharacterHandler.endDialog ; $26B3: $CD $9F $25

.dialogButtonPressHandler
    call DrawDialogArrowTrampoline                ; $26B6: $CD $BB $27
    ldh  a, [hJoypadState]                        ; $26B9: $F0 $CC
    bit  J_BIT_A, a                               ; $26BB: $CB $67
    jr   nz, .buildDrawCommand                    ; $26BD: $20 $22
    bit  J_BIT_B, a                               ; $26BF: $CB $6F
    jr   z, DialogScrollingStartHandler           ; $26C1: $28 $51
    ; The following code looks up whether the
    ; current dialog can be skipped with the B
    ; button, but this information is only used
    ; if __SKIP_DIALOG_SUPPORT__ is set.
    ld   a, BANK(DialogBankTable)                 ; $26C3: $3E $1C
    ld   [rSelectROMBank], a                      ; $26C5: $EA $00 $21
    ld   a, [wGameplayType]                       ; $26C8: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $26CB: $FE $07
    jp   z, SkipDialog                            ; $26CD: $CA $8B $27
    ld   a, [wDialogIndex]                        ; $26D0: $FA $73 $C1
    ld   e, a                                     ; $26D3: $5F
    ld   a, [wDialogIndexHi]                      ; $26D4: $FA $12 $C1
    ld   d, a                                     ; $26D7: $57
    ld   hl, DialogBankTable                      ; $26D8: $21 $41 $47
    add  hl, de                                   ; $26DB: $19
IF __SKIP_DIALOG_SUPPORT__
    bit  7, [hl]
ELSE
    ld   a, [hl]                                  ; $26DC: $7E
    and  a                                        ; $26DD: $A7
ENDC
    jp   z, SkipDialog                            ; $26DE: $CA $8B $27

.buildDrawCommand
    ; Build a draw command for the dialog background

    ; e = (wDialogState == DIALOG_CLOSED ? 0 : 1)
    ld   e, $00                                   ; $26E1: $1E $00
    ld   a, [wDialogState]                        ; $26E3: $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ; $26E6: $E6 $80
    jr   z, .closed                               ; $26E8: $28 $01
    inc  e                                        ; $26EA: $1C
.closed

    ld   d, $00                                   ; $26EB: $16 $00
    ld   hl, DialogBoxOrigin.high                 ; $26ED: $21 $93 $26
    add  hl, de                                   ; $26F0: $19
    ld   a, [wBGOriginHigh]                       ; $26F1: $FA $2E $C1
    add  a, [hl]                                  ; $26F4: $86
    ld   [wDrawCommand.destinationHigh], a        ; $26F5: $EA $01 $D6
    ld   hl, DialogBoxOrigin.low                  ; $26F8: $21 $91 $26
    add  hl, de                                   ; $26FB: $19
    ld   a, [wBGOriginLow]                        ; $26FC: $FA $2F $C1
    add  a, [hl]                                  ; $26FF: $86
    ld   [wDrawCommand.destinationLow], a         ; $2700: $EA $02 $D6
    ld   a, DC_FILL_ROW | $0F                     ; $2703: $3E $4F
    ld   [wDrawCommand.length], a                 ; $2705: $EA $03 $D6
    ldh  a, [hDialogBackgroundTile]               ; $2708: $F0 $E8
    ld   [wDrawCommand.length+ 1], a              ; $270A: $EA $04 $D6
    xor  a                                        ; $270D: $AF
    ld   [wDrawCommand.data + 1], a               ; $270E: $EA $05 $D6
IF __OPTIMIZATIONS_2__
    jp   IncrementDialogState
ELSE
    call IncrementDialogState                     ; $2711: $CD $85 $24
    ; fallthrough
ENDC

DialogScrollingStartHandler::
    ret                                           ; $2714: $C9

DialogBoxMidOrigin::
    ; The BG tile map address of the line inbetween
    ; the first and second lines of text in a dialog box,
    ; which is temporarily filled with the second line
    ; when scrolling text after a break in the dialog
.low
    db   $62 ; top
    db   $82 ; bottom                                  ; $2715
.high
    db   $98 ; top
    db   $99 ; bottom                                  ; $2717

; Scroll dialog line?
DialogBeginScrolling::
    ld   e, $00                                   ; $2719: $1E $00
    ld   a, [wDialogState]                        ; $271B: $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ; $271E: $E6 $80
    jr   z, label_2723                            ; $2720: $28 $01
    inc  e                                        ; $2722: $1C

label_2723::
    ld   d, $00                                   ; $2723: $16 $00
    ld   hl, DialogBoxMidOrigin.high              ; $2725: $21 $17 $27
    add  hl, de                                   ; $2728: $19
    ld   a, [wBGOriginHigh]                       ; $2729: $FA $2E $C1
    add  a, [hl]                                  ; $272C: $86
    ld   b, a                                     ; $272D: $47
    ld   hl, DialogBoxMidOrigin.low               ; $272E: $21 $15 $27

label_2731::
    add  hl, de                                   ; $2731: $19
    ld   a, [wBGOriginLow]                        ; $2732: $FA $2F $C1
    add  a, [hl]                                  ; $2735: $86
    ld   c, a                                     ; $2736: $4F
    ld   e, $10                                   ; $2737: $1E $10

label_2739::
    ld   a, c                                     ; $2739: $79
    sub  a, $20                                   ; $273A: $D6 $20
    ld   l, a                                     ; $273C: $6F
    ld   h, b                                     ; $273D: $60
    ld   a, [bc]                                  ; $273E: $0A
    ld   [hl], a                                  ; $273F: $77
    push bc                                       ; $2740: $C5
    ld   a, c                                     ; $2741: $79
    add  a, $20                                   ; $2742: $C6 $20
    ld   c, a                                     ; $2744: $4F
    ld   a, l                                     ; $2745: $7D
    add  a, $20                                   ; $2746: $C6 $20
    ld   l, a                                     ; $2748: $6F
    ld   a, [bc]                                  ; $2749: $0A
    ld   [hl], a                                  ; $274A: $77
    ld   a, l                                     ; $274B: $7D
    add  a, $20                                   ; $274C: $C6 $20
    ld   l, a                                     ; $274E: $6F
    ldh  a, [hDialogBackgroundTile]               ; $274F: $F0 $E8
    ld   [hl], a                                  ; $2751: $77
    pop  bc                                       ; $2752: $C1
    inc  bc                                       ; $2753: $03
    ld   a, c                                     ; $2754: $79
    and  $1F                                      ; $2755: $E6 $1F
    jr   nz, label_275D                           ; $2757: $20 $04
    ld   a, c                                     ; $2759: $79
    sub  a, $20                                   ; $275A: $D6 $20
    ld   c, a                                     ; $275C: $4F

label_275D::
    dec  e                                        ; $275D: $1D
    jr   nz, label_2739                           ; $275E: $20 $D9
    ld   a, $08  ; Pause the scrolling for 8 frames ; $2760: $3E $08
    ld   [wDialogScrollDelay], a                  ; $2762: $EA $72 $C1
    jp   IncrementDialogStateAndReturn            ; $2765: $C3 $85 $24

DialogScrollingEndHandler::
    ret                                           ; $2768: $C9

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
    ld   e, 0                                     ; $276D: $1E $00
    ld   a, [wDialogState]                        ; $276F: $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ; $2772: $E6 $80
    jr   z, label_2777                            ; $2774: $28 $01
    inc  e                                        ; $2776: $1C

label_2777::
    ld   d, $00                                   ; $2777: $16 $00
    ld   hl, DialogBoxFirstLineOrigin.high        ; $2779: $21 $6B $27
    add  hl, de                                   ; $277C: $19
    ld   a, [wBGOriginHigh]                       ; $277D: $FA $2E $C1
    add  a, [hl]                                  ; $2780: $86
    ld   b, a                                     ; $2781: $47
    ld   hl, DialogBoxFirstLineOrigin.low         ; $2782: $21 $69 $27
    call label_2731                               ; $2785: $CD $31 $27
    jp   DialogDrawNextCharacterHandler.nextCharacter ; $2788: $C3 $7E $26

SkipDialog::
    ld   a, $02                                   ; $278B: $3E $02
    ld   [wDialogAskSelectionIndex], a            ; $278D: $EA $77 $C1
    jp   UpdateDialogState                        ; $2790: $C3 $96 $24

DialogChoiceHandler::
    ; Was A pushed?
    ldh  a, [hJoypadState]                        ; $2793: $F0 $CC
    bit  J_BIT_A, a                               ; $2795: $CB $67
    jp   nz, .jp_27B7                             ; $2797: $C2 $B7 $27
    and  J_RIGHT | J_LEFT                         ; $279A: $E6 $03
    jr   z, .jp_27AA                              ; $279C: $28 $0C
    ld   hl, wDialogAskSelectionIndex             ; $279E: $21 $77 $C1
    ld   a, [hl]                                  ; $27A1: $7E
    inc  a                                        ; $27A2: $3C
    and  $01                                      ; $27A3: $E6 $01
    ld   [hl], a                                  ; $27A5: $77
    ld   a, JINGLE_MOVE_SELECTION                 ; $27A6: $3E $0A
    ldh  [hJingle], a                             ; $27A8: $E0 $F2

.jp_27AA
    ldh  a, [hFrameCounter]                       ; $27AA: $F0 $E7
    and  $10                                      ; $27AC: $E6 $10
    ret  z                                        ; $27AE: $C8
    jpsb DrawDialogChoiceMarker                   ; $27AF: $3E $17 $EA $00 $21 $C3 $CC $7D

.jp_27B7
IF __OPTIMIZATIONS_2__
    jp   UpdateDialogState
ELSE
    call UpdateDialogState                        ; $27B7: $CD $96 $24
    ret                                           ; $27BA: $C9
ENDC

DrawDialogArrowTrampoline::
    jpsb DrawDialogArrow                          ; $27BB: $3E $17 $EA $00 $21 $C3 $7C $7D
