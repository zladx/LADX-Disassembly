; This entity only spawns the flying tiles. The actual tiles are part of the Facade entity.
FlyingTilesEntityHandler::
    call ReturnIfNonInteractive_07                ; $7406: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $7409: $F0 $F0
    JP_TABLE                                      ; $740B
._00 dw func_007_7410                             ; $740C
._01 dw func_007_74A8                             ; $740E

func_007_7410::
    ldh  a, [hActiveEntityPosX]                   ; $7410: $F0 $EE
    and  $70                                      ; $7412: $E6 $70
    ld   [wD201], a                               ; $7414: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $7417: $CD $05 $0C
    ld   [hl], $80                                ; $741A: $36 $80
    jp   IncrementEntityState                     ; $741C: $C3 $12 $3B

Data_007_741F::
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $21, $28, $53, $56, $34, $45, $35, $44, $31, $48, $38, $41, $14, $66, $15, $63
    db   $31, $45, $38, $44, $13, $56, $16, $53, $27, $42, $47, $22, $65, $33, $64, $36
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54

Data_007_749F::
    db   $30, $30, $30, $30, $30, $30, $30, $28, $28

func_007_74A8::
    ld   hl, wEntitiesInertiaTable                ; $74A8: $21 $D0 $C3
    add  hl, bc                                   ; $74AB: $09
    ld   a, [hl]                                  ; $74AC: $7E
    cp   $10                                      ; $74AD: $FE $10
    jp   z, ClearEntityStatus_07                  ; $74AF: $CA $A4 $7E

    call GetEntityTransitionCountdown             ; $74B2: $CD $05 $0C
    jr   nz, ret_007_752C                         ; $74B5: $20 $75

    push hl                                       ; $74B7: $E5
    ldh  a, [hMapId]                              ; $74B8: $F0 $F7
    ld   e, a                                     ; $74BA: $5F
    ld   d, b                                     ; $74BB: $50
    ld   hl, Data_007_749F                        ; $74BC: $21 $9F $74
    add  hl, de                                   ; $74BF: $19
    ld   a, [hl]                                  ; $74C0: $7E
    pop  hl                                       ; $74C1: $E1
    ld   [hl], a                                  ; $74C2: $77
    ld   a, ENTITY_FACADE                         ; $74C3: $3E $5A
    call SpawnNewEntity_trampoline                ; $74C5: $CD $86 $3B
    jr   c, ret_007_752C                          ; $74C8: $38 $62

.jr_74CA
    ld   hl, wEntitiesPrivateState1Table          ; $74CA: $21 $B0 $C2
    add  hl, de                                   ; $74CD: $19
    ld   [hl], $02                                ; $74CE: $36 $02
    push bc                                       ; $74D0: $C5

.jr_74D1
    ld   a, [wD201]                               ; $74D1: $FA $01 $D2
    ld   hl, wEntitiesInertiaTable                ; $74D4: $21 $D0 $C3
    add  hl, bc                                   ; $74D7: $09
    add  [hl]                                     ; $74D8: $86
    inc  [hl]                                     ; $74D9: $34
    ld   c, a                                     ; $74DA: $4F
    ld   hl, wEntitiesPrivateState4Table          ; $74DB: $21 $40 $C4
    add  hl, de                                   ; $74DE: $19
    ldh  a, [hActiveEntityPosY]                   ; $74DF: $F0 $EF
    sub  $10                                      ; $74E1: $D6 $10
    and  $F0                                      ; $74E3: $E6 $F0
    jr   z, .jr_74E8                              ; $74E5: $28 $01

    ld   [hl], a                                  ; $74E7: $77

.jr_74E8
    ld   a, c                                     ; $74E8: $79
    cp   $0F                                      ; $74E9: $FE $0F
    jr   nz, .jr_74F8                             ; $74EB: $20 $0B

    ld   a, [wRoomEvent]                          ; $74ED: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $74F0: $E6 $1F
    cp   TRIGGER_STEP_ON_BUTTON                   ; $74F2: $FE $03
    jr   nz, .jr_74F8                             ; $74F4: $20 $02

    ld   [hl], $01                                ; $74F6: $36 $01

.jr_74F8
    ld   hl, Data_007_741F                        ; $74F8: $21 $1F $74
    add  hl, bc                                   ; $74FB: $09
    ld   a, [hl]                                  ; $74FC: $7E
    push af                                       ; $74FD: $F5
    swap a                                        ; $74FE: $CB $37
    and  $F0                                      ; $7500: $E6 $F0
    or   $08                                      ; $7502: $F6 $08
    ld   hl, wEntitiesPosXTable                   ; $7504: $21 $00 $C2
    add  hl, de                                   ; $7507: $19
    ld   [hl], a                                  ; $7508: $77
    pop  af                                       ; $7509: $F1
    and  $F0                                      ; $750A: $E6 $F0
    add  $10                                      ; $750C: $C6 $10
    ld   hl, wEntitiesPosYTable                   ; $750E: $21 $10 $C2
    add  hl, de                                   ; $7511: $19
    ld   [hl], a                                  ; $7512: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7513: $21 $40 $C3
    add  hl, de                                   ; $7516: $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ; $7517: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $7519: $21 $50 $C3
    add  hl, de                                   ; $751C: $19
    ld   [hl], $00                                ; $751D: $36 $00
    ld   hl, wEntitiesOptions1Table               ; $751F: $21 $30 $C4
    add  hl, de                                   ; $7522: $19
    ld   [hl], ENTITY_OPT1_NONE                   ; $7523: $36 $00
    ld   hl, wEntitiesHealthGroup                 ; $7525: $21 $D0 $C4
    add  hl, de                                   ; $7528: $19
    ld   [hl], $00                                ; $7529: $36 $00
    pop  bc                                       ; $752B: $C1

ret_007_752C:
    ret                                           ; $752C: $C9
