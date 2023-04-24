BombEntityHandler::
    ; If bomb is outside of the screen, clear it.
    ldh  a, [hActiveEntityVisualPosY]             ; $6696: $F0 $EC
    add  $10                                      ; $6698: $C6 $10
    cp   $A0                                      ; $669A: $FE $A0
    jp   nc, UnloadEntity                         ; $669C: $D2 $8D $3F

    call GetEntityTransitionCountdown             ; $669F: $CD $05 $0C
    cp   $18                                      ; $66A2: $FE $18
    jp   c, label_003_65E2                        ; $66A4: $DA $E2 $65

    jr   nz, .jr_66AD                             ; $66A7: $20 $04

    dec  [hl]                                     ; $66A9: $35
    call PlayBombExplosionSfx                     ; $66AA: $CD $4B $0C

.jr_66AD
    ld   hl, wHasPlacedBomb                       ; $66AD: $21 $4E $C1
    inc  [hl]                                     ; $66B0: $34
    cp   $22                                      ; $66B1: $FE $22
    jr   c, jr_003_668C                           ; $66B3: $38 $D7

    cp   $48                                      ; $66B5: $FE $48
    jr   nz, .jr_66BF                             ; $66B7: $20 $06

    ld   hl, wEntitiesFlashCountdownTable         ; $66B9: $21 $20 $C4
    add  hl, bc                                   ; $66BC: $09
    ld   [hl], $30                                ; $66BD: $36 $30

.jr_66BF
    call func_003_6711                            ; $66BF: $CD $11 $67
    call CheckForEntityFallingDownQuicksandHole   ; $66C2: $CD $EA $5C
    call ReturnIfNonInteractive_03                ; $66C5: $CD $78 $7F
    call func_003_60B3                            ; $66C8: $CD $B3 $60
    ld   hl, wEntitiesPrivateCountdown2Table      ; $66CB: $21 $00 $C3
    add  hl, bc                                   ; $66CE: $09
    ld   [hl], $FF                                ; $66CF: $36 $FF
    call GetEntityPrivateCountdown1               ; $66D1: $CD $00 $0C
    ld   hl, wEntitiesPrivateState4Table          ; $66D4: $21 $40 $C4
    add  hl, bc                                   ; $66D7: $09
    or   [hl]                                     ; $66D8: $B6
    jr   nz, jr_003_66FA                          ; $66D9: $20 $1F

    ld   a, [wInventoryItems.BButtonSlot]         ; $66DB: $FA $00 $DB
    cp   INVENTORY_BOMBS                          ; $66DE: $FE $02
    jr   nz, .jr_66EA                             ; $66E0: $20 $08

    ldh  a, [hJoypadState]                        ; $66E2: $F0 $CC
    and  J_B                                      ; $66E4: $E6 $20
    jr   nz, jr_003_66F7                          ; $66E6: $20 $0F

    jr   jr_003_66FA                              ; $66E8: $18 $10

.jr_66EA
    ld   a, [wInventoryItems.AButtonSlot]         ; $66EA: $FA $01 $DB
    cp   INVENTORY_BOMBS                          ; $66ED: $FE $02
    jr   nz, jr_003_66FA                          ; $66EF: $20 $09

    ldh  a, [hJoypadState]                        ; $66F1: $F0 $CC
    and  J_A                                      ; $66F3: $E6 $10
    jr   z, jr_003_66FA                           ; $66F5: $28 $03

jr_003_66F7:
    call func_003_4E35                            ; $66F7: $CD $35 $4E

func_003_66FA::
jr_003_66FA:
    ld   hl, wEntitiesCollisionsTable             ; $66FA: $21 $A0 $C2
    add  hl, bc                                   ; $66FD: $09
    ld   a, [hl]                                  ; $66FE: $7E
    and  $03                                      ; $66FF: $E6 $03
    jr   z, .jr_6706                              ; $6701: $28 $03

    call func_003_6B34                            ; $6703: $CD $34 $6B

.jr_6706
    ldh  a, [hIsSideScrolling]                    ; $6706: $F0 $F9
    and  a                                        ; $6708: $A7
    ret  nz                                       ; $6709: $C0

    ld   a, [hl]                                  ; $670A: $7E
    and  $0C                                      ; $670B: $E6 $0C
    ret  z                                        ; $670D: $C8

    jp   func_003_6B43                            ; $670E: $C3 $43 $6B
