KanaletBombableWallEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $7198: $21 $60 $C4
    add  hl, bc                                   ; $719B: $09
    ld   a, [hl]                                  ; $719C: $7E
    cp   $00                                      ; $719D: $FE $00
    jr   nz, .jr_71B4                             ; $719F: $20 $13

    ldh  a, [hRoomStatus]                         ; $71A1: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $71A3: $E6 $10
    jp   nz, ClearEntityStatus_07                 ; $71A5: $C2 $A4 $7E

    ld   hl, wEntitiesLoadOrderTable              ; $71A8: $21 $60 $C4
    add  hl, bc                                   ; $71AB: $09
    ld   [hl], $FF                                ; $71AC: $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ; $71AE: $21 $E0 $C4
    add  hl, bc                                   ; $71B1: $09
    ld   [hl], $3C                                ; $71B2: $36 $3C

.jr_71B4
    call ReturnIfNonInteractive_07                ; $71B4: $CD $96 $7D
    ld   hl, wEntitiesSpriteVariantTable          ; $71B7: $21 $B0 $C3
    add  hl, bc                                   ; $71BA: $09
    ld   [hl], b                                  ; $71BB: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $71BC: $21 $10 $C4
    add  hl, bc                                   ; $71BF: $09
    ld   a, [hl]                                  ; $71C0: $7E
    and  a                                        ; $71C1: $A7
    jp   z, ret_007_7246                          ; $71C2: $CA $46 $72

    ld   a, ENTITY_MOBLIN_SWORD                   ; $71C5: $3E $14
    call SpawnNewEntity_trampoline                ; $71C7: $CD $86 $3B
    jr   c, ret_007_7246                          ; $71CA: $38 $7A

    ld   hl, wEntitiesDroppedItemTable            ; $71CC: $21 $E0 $C4
    add  hl, bc                                   ; $71CF: $09
    ld   a, [hl]                                  ; $71D0: $7E
    ld   hl, wEntitiesDroppedItemTable            ; $71D1: $21 $E0 $C4
    add  hl, de                                   ; $71D4: $19
    ld   [hl], a                                  ; $71D5: $77
    ldh  a, [hMultiPurpose0]                      ; $71D6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $71D8: $21 $00 $C2
    add  hl, de                                   ; $71DB: $19
    ld   [hl], a                                  ; $71DC: $77
    ldh  a, [hMultiPurpose1]                      ; $71DD: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $71DF: $21 $10 $C2
    add  hl, de                                   ; $71E2: $19
    add  $08                                      ; $71E3: $C6 $08
    ld   [hl], a                                  ; $71E5: $77
    call label_3E34                               ; $71E6: $CD $34 $3E
    ldh  a, [hActiveEntityPosX]                   ; $71E9: $F0 $EE
    sub  $08                                      ; $71EB: $D6 $08
    ldh  [hIntersectedObjectLeft], a              ; $71ED: $E0 $CE
    ldh  a, [hActiveEntityPosY]                   ; $71EF: $F0 $EF
    sub  $10                                      ; $71F1: $D6 $10
    ldh  [hIntersectedObjectTop], a               ; $71F3: $E0 $CD
    ldh  a, [hIntersectedObjectLeft]              ; $71F5: $F0 $CE
    swap a                                        ; $71F7: $CB $37
    and  $0F                                      ; $71F9: $E6 $0F
    ld   e, a                                     ; $71FB: $5F
    ldh  a, [hIntersectedObjectTop]               ; $71FC: $F0 $CD
    and  $F0                                      ; $71FE: $E6 $F0
    or   e                                        ; $7200: $B3
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, wRoomObjects                         ; $7203: $21 $11 $D7
    add  hl, de                                   ; $7206: $19
    ld   [hl], $91                                ; $7207: $36 $91
    call label_2887                               ; $7209: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $720C: $F0 $FE
    and  a                                        ; $720E: $A7
    jr   z, .jr_721D                              ; $720F: $28 $0C

    push bc                                       ; $7211: $C5
    ld   a, $91                                   ; $7212: $3E $91
    ld   [wDDD8], a                               ; $7214: $EA $D8 $DD
    ld   a, $07                                   ; $7217: $3E $07
    call func_91D                                 ; $7219: $CD $1D $09
    pop  bc                                       ; $721C: $C1

.jr_721D
    ld   a, [wDrawCommandsSize]                   ; $721D: $FA $00 $D6
    ld   e, a                                     ; $7220: $5F
    ld   d, $00                                   ; $7221: $16 $00
    ld   hl, wDrawCommand                         ; $7223: $21 $01 $D6
    add  hl, de                                   ; $7226: $19
    add  $0A                                      ; $7227: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $7229: $EA $00 $D6
    ld   e, $08                                   ; $722C: $1E $08
    call func_007_7233                            ; $722E: $CD $33 $72
    ld   e, $09                                   ; $7231: $1E $09

func_007_7233::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $7233: $F0 $CF
    ld   [hl+], a                                 ; $7235: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $7236: $F0 $D0
    ld   [hl+], a                                 ; $7238: $22
    inc  a                                        ; $7239: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $723A: $E0 $D0
    ld   a, $81                                   ; $723C: $3E $81
    ld   [hl+], a                                 ; $723E: $22
    ld   a, e                                     ; $723F: $7B
    ld   [hl+], a                                 ; $7240: $22
    inc  a                                        ; $7241: $3C
    inc  a                                        ; $7242: $3C
    ld   [hl+], a                                 ; $7243: $22
    xor  a                                        ; $7244: $AF
    ld   [hl], a                                  ; $7245: $77

ret_007_7246:
    ret                                           ; $7246: $C9
