Data_015_4B17::
    db   $E8, $FE, $74, $00, $E8, $06, $74, $20, $F4, $01, $76, $00, $F4, $09, $76, $20
    db   $00, $00, $76, $00, $00, $08, $76, $20, $E8, $00, $74, $00, $E8, $08, $74, $20
    db   $F4, $00, $76, $00, $F4, $08, $76, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $E8, $02, $74, $00, $E8, $0A, $74, $20, $F4, $FF, $76, $00, $F4, $07, $76, $20
    db   $00, $00, $76, $00, $00, $08, $76, $20, $E8, $00, $74, $00, $E8, $08, $74, $20
    db   $F4, $00, $76, $00, $F4, $08, $76, $20, $00, $00, $76, $00, $00, $08, $76, $20

Data_015_4B77::
    db   $F4, $FF, $74, $00, $F4, $07, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $00, $74, $00, $F4, $08, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $01, $74, $00, $F4, $09, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20
    db   $F4, $00, $74, $00, $F4, $08, $74, $20, $00, $00, $76, $00, $00, $08, $76, $20

Data_015_4BB7::
    db   $00, $FF, $74, $00, $00, $07, $74, $20, $00, $00, $74, $00, $00, $08, $74, $20
    db   $00, $01, $74, $00, $00, $09, $74, $20, $00, $00, $74, $00, $00, $08, $74, $20

Data_015_4BD7::
    db   $FA, $FC

Data_015_4BD9::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

PokeyEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4BE1: $21 $B0 $C2
    add  hl, bc                                   ; $4BE4: $09
    ld   a, [hl]                                  ; $4BE5: $7E
    and  a                                        ; $4BE6: $A7
    jp   nz, label_015_4CD9                       ; $4BE7: $C2 $D9 $4C

    call func_015_4C85                            ; $4BEA: $CD $85 $4C
    call ReturnIfNonInteractive_15                ; $4BED: $CD $0D $7B
    ld   hl, wEntitiesInertiaTable                ; $4BF0: $21 $D0 $C3
    add  hl, bc                                   ; $4BF3: $09
    ld   a, [hl]                                  ; $4BF4: $7E
    cp   $02                                      ; $4BF5: $FE $02
    jr   nc, .jr_4C49                             ; $4BF7: $30 $50

    ld   hl, wEntitiesHealthTable                 ; $4BF9: $21 $60 $C3
    add  hl, bc                                   ; $4BFC: $09
    ld   [hl], $02                                ; $4BFD: $36 $02
    ld   hl, wEntitiesFlashCountdownTable         ; $4BFF: $21 $20 $C4
    add  hl, bc                                   ; $4C02: $09
    ld   a, [hl]                                  ; $4C03: $7E
    cp   $14                                      ; $4C04: $FE $14
    jr   nz, .jr_4C49                             ; $4C06: $20 $41

    dec  [hl]                                     ; $4C08: $35
    ld   hl, wEntitiesInertiaTable                ; $4C09: $21 $D0 $C3
    add  hl, bc                                   ; $4C0C: $09
    inc  [hl]                                     ; $4C0D: $34

    ld   a, ENTITY_POKEY                          ; $4C0E: $3E $E3
    call SpawnNewEntity_trampoline                ; $4C10: $CD $86 $3B
    jr   c, .jr_4C49                              ; $4C13: $38 $34

    ldh  a, [hMultiPurpose0]                      ; $4C15: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4C17: $21 $00 $C2
    add  hl, de                                   ; $4C1A: $19
    ld   [hl], a                                  ; $4C1B: $77
    ldh  a, [hMultiPurpose1]                      ; $4C1C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4C1E: $21 $10 $C2
    add  hl, de                                   ; $4C21: $19
    ld   [hl], a                                  ; $4C22: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4C23: $21 $B0 $C2
    add  hl, de                                   ; $4C26: $19
    inc  [hl]                                     ; $4C27: $34
    push bc                                       ; $4C28: $C5
    ld   c, e                                     ; $4C29: $4B
    ld   b, d                                     ; $4C2A: $42
    ld   a, $20                                   ; $4C2B: $3E $20
    call GetVectorTowardsLink_trampoline          ; $4C2D: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ; $4C30: $F0 $D8
    cpl                                           ; $4C32: $2F
    inc  a                                        ; $4C33: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $4C34: $21 $40 $C2
    add  hl, bc                                   ; $4C37: $09
    ld   [hl], a                                  ; $4C38: $77
    ldh  a, [hMultiPurpose0]                      ; $4C39: $F0 $D7
    cpl                                           ; $4C3B: $2F
    inc  a                                        ; $4C3C: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $4C3D: $21 $50 $C2
    add  hl, bc                                   ; $4C40: $09
    ld   [hl], a                                  ; $4C41: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4C42: $21 $E0 $C2
    add  hl, bc                                   ; $4C45: $09
    ld   [hl], $18                                ; $4C46: $36 $18
    pop  bc                                       ; $4C48: $C1

.jr_4C49
    call DecrementEntityIgnoreHitsCountdown       ; $4C49: $CD $56 $0C
    call label_3B39                               ; $4C4C: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $4C4F: $F0 $E7
    rra                                           ; $4C51: $1F
    rra                                           ; $4C52: $1F
    rra                                           ; $4C53: $1F
    nop                                           ; $4C54: $00
    and  $03                                      ; $4C55: $E6 $03
    call SetEntitySpriteVariant                   ; $4C57: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $4C5A: $CD $05 $0C
    jr   nz, .jr_4C7F                             ; $4C5D: $20 $20

    call GetRandomByte                            ; $4C5F: $CD $0D $28
    and  $3F                                      ; $4C62: $E6 $3F
    add  $30                                      ; $4C64: $C6 $30
    ld   [hl], a                                  ; $4C66: $77
    and  $07                                      ; $4C67: $E6 $07
    ld   e, a                                     ; $4C69: $5F
    ld   d, b                                     ; $4C6A: $50
    ld   hl, Data_015_4BD9                        ; $4C6B: $21 $D9 $4B
    add  hl, de                                   ; $4C6E: $19
    ld   a, [hl]                                  ; $4C6F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4C70: $21 $40 $C2
    add  hl, bc                                   ; $4C73: $09
    ld   [hl], a                                  ; $4C74: $77
    ld   hl, Data_015_4BD7                        ; $4C75: $21 $D7 $4B
    add  hl, de                                   ; $4C78: $19
    ld   a, [hl]                                  ; $4C79: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4C7A: $21 $50 $C2
    add  hl, bc                                   ; $4C7D: $09
    ld   [hl], a                                  ; $4C7E: $77

.jr_4C7F
    call UpdateEntityPosWithSpeed_15              ; $4C7F: $CD $88 $7B
    jp   label_3B23                               ; $4C82: $C3 $23 $3B

func_015_4C85::
    ld   d, b                                     ; $4C85: $50
    ld   hl, wEntitiesInertiaTable                ; $4C86: $21 $D0 $C3
    add  hl, bc                                   ; $4C89: $09
    ld   a, [hl]                                  ; $4C8A: $7E
    and  a                                        ; $4C8B: $A7
    jr   nz, .jr_4CA9                             ; $4C8C: $20 $1B

    ldh  a, [hActiveEntitySpriteVariant]          ; $4C8E: $F0 $F1
    rla                                           ; $4C90: $17
    rla                                           ; $4C91: $17
    rla                                           ; $4C92: $17
    and  $F8                                      ; $4C93: $E6 $F8
    ld   e, a                                     ; $4C95: $5F
    rla                                           ; $4C96: $17
    and  $F0                                      ; $4C97: $E6 $F0
    add  e                                        ; $4C99: $83
    ld   e, a                                     ; $4C9A: $5F
    ld   hl, Data_015_4B17                        ; $4C9B: $21 $17 $4B
    add  hl, de                                   ; $4C9E: $19
    ld   c, $06                                   ; $4C9F: $0E $06
    call RenderActiveEntitySpritesRect            ; $4CA1: $CD $E6 $3C
    ld   a, $04                                   ; $4CA4: $3E $04
    jp   func_015_7964_trampoline                 ; $4CA6: $C3 $A0 $3D

.jr_4CA9
    cp   $02                                      ; $4CA9: $FE $02
    jr   z, .jr_4CC4                              ; $4CAB: $28 $17

    ldh  a, [hActiveEntitySpriteVariant]          ; $4CAD: $F0 $F1
    rla                                           ; $4CAF: $17
    rla                                           ; $4CB0: $17
    rla                                           ; $4CB1: $17
    rla                                           ; $4CB2: $17
    and  $F0                                      ; $4CB3: $E6 $F0
    ld   e, a                                     ; $4CB5: $5F
    ld   hl, Data_015_4B77                        ; $4CB6: $21 $77 $4B
    add  hl, de                                   ; $4CB9: $19
    ld   c, $04                                   ; $4CBA: $0E $04
    call RenderActiveEntitySpritesRect            ; $4CBC: $CD $E6 $3C
    ld   a, $02                                   ; $4CBF: $3E $02
    jp   func_015_7964_trampoline                 ; $4CC1: $C3 $A0 $3D

.jr_4CC4
    ldh  a, [hActiveEntitySpriteVariant]          ; $4CC4: $F0 $F1
    rla                                           ; $4CC6: $17
    rla                                           ; $4CC7: $17
    rla                                           ; $4CC8: $17
    and  $F8                                      ; $4CC9: $E6 $F8
    ld   e, a                                     ; $4CCB: $5F
    ld   hl, Data_015_4BB7                        ; $4CCC: $21 $B7 $4B
    add  hl, de                                   ; $4CCF: $19
    ld   c, $02                                   ; $4CD0: $0E $02
    jp   RenderActiveEntitySpritesRect            ; $4CD2: $C3 $E6 $3C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown044SpriteVariants::
.variant0
    db $76, $00
    db $76, $20

label_015_4CD9:
    ld   de, Unknown044SpriteVariants
    call RenderActiveEntitySpritesPair            ; $4CDC: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4CDF: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $4CE2: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4CE5: $CD $05 $0C
    jr   nz, .jr_4CED                             ; $4CE8: $20 $03

    call label_3B39                               ; $4CEA: $CD $39 $3B

.jr_4CED
    call UpdateEntityPosWithSpeed_15              ; $4CED: $CD $88 $7B
    call label_3B23                               ; $4CF0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4CF3: $21 $A0 $C2
    add  hl, bc                                   ; $4CF6: $09
    ld   a, [hl]                                  ; $4CF7: $7E
    and  $03                                      ; $4CF8: $E6 $03
    jr   z, .jr_4D03                              ; $4CFA: $28 $07

    ld   hl, wEntitiesSpeedXTable                 ; $4CFC: $21 $40 $C2
    call func_015_4D0F                            ; $4CFF: $CD $0F $4D
    ret  c                                        ; $4D02: $D8

.jr_4D03
    ld   hl, wEntitiesCollisionsTable             ; $4D03: $21 $A0 $C2
    add  hl, bc                                   ; $4D06: $09
    ld   a, [hl]                                  ; $4D07: $7E
    and  $0C                                      ; $4D08: $E6 $0C
    jr   z, jr_015_4D39                           ; $4D0A: $28 $2D

    ld   hl, wEntitiesSpeedYTable                 ; $4D0C: $21 $50 $C2

func_015_4D0F::
    add  hl, bc                                   ; $4D0F: $09
    ld   a, [hl]                                  ; $4D10: $7E
    cpl                                           ; $4D11: $2F
    inc  a                                        ; $4D12: $3C
    ld   [hl], a                                  ; $4D13: $77
    ld   a, JINGLE_BUMP                           ; $4D14: $3E $09
    ldh  [hJingle], a                             ; $4D16: $E0 $F2
    ld   hl, wEntitiesInertiaTable                ; $4D18: $21 $D0 $C3
    add  hl, bc                                   ; $4D1B: $09
    ld   a, [hl]                                  ; $4D1C: $7E
    inc  a                                        ; $4D1D: $3C
    ld   [hl], a                                  ; $4D1E: $77
    cp   $03                                      ; $4D1F: $FE $03
    jr   c, jr_015_4D39                           ; $4D21: $38 $16

    ldh  a, [hActiveEntityPosX]                   ; $4D23: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4D25: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4D27: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4D29: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4D2B: $3E $02
    call AddTranscientVfx                         ; $4D2D: $CD $C7 $0C
    ld   a, JINGLE_POOF                           ; $4D30: $3E $2F
    ldh  [hJingle], a                             ; $4D32: $E0 $F2
    call ClearEntityStatus_15                     ; $4D34: $CD $31 $7C
    scf                                           ; $4D37: $37
    ret                                           ; $4D38: $C9

jr_015_4D39:
    and  a                                        ; $4D39: $A7
    ret                                           ; $4D3A: $C9
