MazeSignpostEntityPosition::
    db   $65, $64, $54, $52, $22, $22, $32, $37, $37, $37, $57, $56, $26, $21

MazeSignpostEntityRoom::
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D4
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D5
    db   UNKNOWN_ROOM_C5, UNKNOWN_ROOM_C4
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D4

MazeSignpostEntityDialog::
    db   $AB, $A9, $AC, $AA, $AB, $A9, $AB, $AA, $AC, $A9, $AB, $A9, $AC, $AE

MazeSignpostEntityHandler::
    call ReturnIfNonInteractive_18
    ldh  a, [hMapRoom]
    cp   UNKNOWN_ROOM_B4                          ; are we in the starting room?
    jr   nz, .in_maze_proper

    xor  a                                        ; if so, then re-initialize
    ld   [wMazeSignpostGoal], a
    ld   [wMazeSignpostPos], a

.in_maze_proper:
    ld   a, [wMazeSignpostPos]                    ; $62A2: $FA $73 $D4
    and  a                                        ; $62A5: $A7
    jr   z, .skip

    ld   a, [wMazeSignpostGoal]                   ; $62A8: $FA $72 $D4
    ld   e, a                                     ; $62AB: $5F
    ld   d, b                                     ; $62AC: $50
    ld   hl, MazeSignpostEntityPosition           ; $62AD: $21 $68 $62
    add  hl, de                                   ; $62B0: $19
    ld   a, [wMazeSignpostPos]                    ; $62B1: $FA $73 $D4
    cp   [hl]                                     ; $62B4: $BE
    jr   nz, .wrong                               ; $62B5: $20 $2D

    ld   hl, MazeSignpostEntityRoom               ; $62B7: $21 $76 $62
    add  hl, de                                   ; $62BA: $19
    ldh  a, [hMapRoom]                            ; $62BB: $F0 $F6
    cp   [hl]                                     ; $62BD: $BE
    jr   nz, .wrong                               ; $62BE: $20 $24

    ; correct sign
    xor  a                                        ; $62C0: $AF
    ld   [wMazeSignpostPos], a                    ; $62C1: $EA $73 $D4
    ld   a, [wMazeSignpostGoal]                   ; $62C4: $FA $72 $D4
    inc  a                                        ; $62C7: $3C
    ld   [wMazeSignpostGoal], a                   ; $62C8: $EA $72 $D4
    cp   $0E                                      ; $62CB: $FE $0E
    jr   nz, .dialog                              ; $62CD: $20 $0D

    ; maze solved
    xor  a                                        ; $62CF: $AF
    ld   [wMazeSignpostGoal], a                   ; $62D0: $EA $72 $D4
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $62D3: $3E $02
    ldh  [hJingle], a                             ; $62D5: $E0 $F2
    push de                                       ; $62D7: $D5
    call RevealMamuCave                           ; $62D8: $CD $F5 $62
    pop  de                                       ; $62DB: $D1

.dialog:
    ld   hl, MazeSignpostEntityDialog             ; $62DC: $21 $84 $62
    add  hl, de                                   ; $62DF: $19
    ld   a, [hl]                                  ; $62E0: $7E
    jp   OpenDialogInTable1                       ; $62E1: $C3 $73 $23

.wrong:
    xor  a                                        ; $62E4: $AF
    ld   [wMazeSignpostGoal], a                   ; $62E5: $EA $72 $D4
    ld   [wMazeSignpostPos], a                    ; $62E8: $EA $73 $D4
    ld   a, JINGLE_WRONG_ANSWER                   ; $62EB: $3E $1D
    ldh  [hJingle], a                             ; $62ED: $E0 $F2
    call_open_dialog $1AD                         ; "try again from the start"

.skip:
    ret

RevealMamuCave::
    ld   hl, $D739                                ; $62F5: $21 $39 $D7
    ld   [hl], $C6                                ; $62F8: $36 $C6
    ld   a, $98                                   ; $62FA: $3E $98
    call func_2BF                                 ; $62FC: $CD $2F $0B
    ld   a, $28                                   ; $62FF: $3E $28
    ld   [wWarp0PositionTileIndex], a             ; $6301: $EA $16 $D4
    ld   a, $20                                   ; $6304: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $6306: $E0 $CD
    add  $10                                      ; $6308: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $630A: $E0 $D8
    ld   a, $80                                   ; $630C: $3E $80
    ldh  [hSwordIntersectedAreaX], a              ; $630E: $E0 $CE
    add  $08                                      ; $6310: $C6 $08
    ldh  [hMultiPurpose0], a                      ; $6312: $E0 $D7
    ld   a, TRANSCIENT_VFX_POOF                   ; $6314: $3E $02
    call AddTranscientVfx                         ; $6316: $CD $C7 $0C
    call label_2887                               ; $6319: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $631C: $F0 $FE
    and  a                                        ; $631E: $A7
    jr   z, jr_018_632D                           ; $631F: $28 $0C

    push bc                                       ; $6321: $C5
    ld   a, $C6                                   ; $6322: $3E $C6
    ld   [wDDD8], a                               ; $6324: $EA $D8 $DD
    ld   a, $18                                   ; $6327: $3E $18
    call func_91D                                 ; $6329: $CD $1D $09
    pop  bc                                       ; $632C: $C1

jr_018_632D:
    ld   hl, wRequestDestinationHigh              ; $632D: $21 $01 $D6
    ld   a, [wRequests]                           ; $6330: $FA $00 $D6
    ld   e, a                                     ; $6333: $5F
    add  $0A                                      ; $6334: $C6 $0A
    ld   [wRequests], a                           ; $6336: $EA $00 $D6
    ld   d, $00                                   ; $6339: $16 $00
    add  hl, de                                   ; $633B: $19
    ldh  a, [hFFCF]                               ; $633C: $F0 $CF
    ld   [hl+], a                                 ; $633E: $22
    ldh  a, [hFFD0]                               ; $633F: $F0 $D0
    ld   [hl+], a                                 ; $6341: $22
    ld   a, $81                                   ; $6342: $3E $81
    ld   [hl+], a                                 ; $6344: $22
    ld   a, $68                                   ; $6345: $3E $68
    ld   [hl+], a                                 ; $6347: $22
    ld   a, $77                                   ; $6348: $3E $77
    ld   [hl+], a                                 ; $634A: $22
    ldh  a, [hFFCF]                               ; $634B: $F0 $CF
    ld   [hl+], a                                 ; $634D: $22
    ldh  a, [hFFD0]                               ; $634E: $F0 $D0
    inc  a                                        ; $6350: $3C
    ld   [hl+], a                                 ; $6351: $22
    ld   a, $81                                   ; $6352: $3E $81
    ld   [hl+], a                                 ; $6354: $22
    ld   a, $69                                   ; $6355: $3E $69
    ld   [hl+], a                                 ; $6357: $22
    ld   a, $4B                                   ; $6358: $3E $4B
    ld   [hl+], a                                 ; $635A: $22
    ld   [hl], $00                                ; $635B: $36 $00
    ld   a, STAIRCASE_INACTIVE                    ; $635D: $3E $01
    ldh  [hStaircase], a                          ; $635F: $E0 $AC
    ldh  a, [hSwordIntersectedAreaY]              ; $6361: $F0 $CD
    and  $F0                                      ; $6363: $E6 $F0
    add  $10                                      ; $6365: $C6 $10
    ldh  [hStaircasePosY], a                      ; $6367: $E0 $AE
    ldh  a, [hSwordIntersectedAreaX]              ; $6369: $F0 $CE
    and  $F0                                      ; $636B: $E6 $F0
    add  $08                                      ; $636D: $C6 $08
    ldh  [hStaircasePosX], a                      ; $636F: $E0 $AD
    ldh  a, [hMapRoom]                            ; $6371: $F0 $F6
    ld   e, a                                     ; $6373: $5F
    ld   d, $00                                   ; $6374: $16 $00
    ld   hl, wOverworldRoomStatus                 ; $6376: $21 $00 $D8
    add  hl, de                                   ; $6379: $19
    set  ROOM_STATUS_DOOR_OPEN_UP, [hl]            ; $637A: $CB $E6
    ret                                           ; $637C: $C9
