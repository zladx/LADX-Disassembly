; This entity only spawns the flying tiles. The actual tiles are part of the Facade entity.
FlyingTilesEntityHandler::
    call ReturnIfNonInteractive_07                ;; 07:7406 $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ;; 07:7409 $F0 $F0
    JP_TABLE                                      ;; 07:740B
._00 dw func_007_7410                             ;; 07:740C
._01 dw func_007_74A8                             ;; 07:740E

func_007_7410::
    ldh  a, [hActiveEntityPosX]                   ;; 07:7410 $F0 $EE
    and  $70                                      ;; 07:7412 $E6 $70
    ld   [wD201], a                               ;; 07:7414 $EA $01 $D2
    call GetEntityTransitionCountdown             ;; 07:7417 $CD $05 $0C
    ld   [hl], $80                                ;; 07:741A $36 $80
    jp   IncrementEntityState                     ;; 07:741C $C3 $12 $3B

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
    ld   hl, wEntitiesInertiaTable                ;; 07:74A8 $21 $D0 $C3
    add  hl, bc                                   ;; 07:74AB $09
    ld   a, [hl]                                  ;; 07:74AC $7E
    cp   $10                                      ;; 07:74AD $FE $10
    jp   z, ClearEntityStatus_07                  ;; 07:74AF $CA $A4 $7E

    call GetEntityTransitionCountdown             ;; 07:74B2 $CD $05 $0C
    jr   nz, ret_007_752C                         ;; 07:74B5 $20 $75

    push hl                                       ;; 07:74B7 $E5
    ldh  a, [hMapId]                              ;; 07:74B8 $F0 $F7
    ld   e, a                                     ;; 07:74BA $5F
    ld   d, b                                     ;; 07:74BB $50
    ld   hl, Data_007_749F                        ;; 07:74BC $21 $9F $74
    add  hl, de                                   ;; 07:74BF $19
    ld   a, [hl]                                  ;; 07:74C0 $7E
    pop  hl                                       ;; 07:74C1 $E1
    ld   [hl], a                                  ;; 07:74C2 $77
    ld   a, ENTITY_FACADE                         ;; 07:74C3 $3E $5A
    call SpawnNewEntity_trampoline                ;; 07:74C5 $CD $86 $3B
    jr   c, ret_007_752C                          ;; 07:74C8 $38 $62

.jr_74CA
    ld   hl, wEntitiesPrivateState1Table          ;; 07:74CA $21 $B0 $C2
    add  hl, de                                   ;; 07:74CD $19
    ld   [hl], $02                                ;; 07:74CE $36 $02
    push bc                                       ;; 07:74D0 $C5

.jr_74D1
    ld   a, [wD201]                               ;; 07:74D1 $FA $01 $D2
    ld   hl, wEntitiesInertiaTable                ;; 07:74D4 $21 $D0 $C3
    add  hl, bc                                   ;; 07:74D7 $09
    add  [hl]                                     ;; 07:74D8 $86
    inc  [hl]                                     ;; 07:74D9 $34
    ld   c, a                                     ;; 07:74DA $4F
    ld   hl, wEntitiesPrivateState4Table          ;; 07:74DB $21 $40 $C4
    add  hl, de                                   ;; 07:74DE $19
    ldh  a, [hActiveEntityPosY]                   ;; 07:74DF $F0 $EF
    sub  $10                                      ;; 07:74E1 $D6 $10
    and  $F0                                      ;; 07:74E3 $E6 $F0
    jr   z, .jr_74E8                              ;; 07:74E5 $28 $01

    ld   [hl], a                                  ;; 07:74E7 $77

.jr_74E8
    ld   a, c                                     ;; 07:74E8 $79
    cp   $0F                                      ;; 07:74E9 $FE $0F
    jr   nz, .jr_74F8                             ;; 07:74EB $20 $0B

    ld   a, [wRoomEvent]                          ;; 07:74ED $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 07:74F0 $E6 $1F
    cp   TRIGGER_STEP_ON_BUTTON                   ;; 07:74F2 $FE $03
    jr   nz, .jr_74F8                             ;; 07:74F4 $20 $02

    ld   [hl], $01                                ;; 07:74F6 $36 $01

.jr_74F8
    ld   hl, Data_007_741F                        ;; 07:74F8 $21 $1F $74
    add  hl, bc                                   ;; 07:74FB $09
    ld   a, [hl]                                  ;; 07:74FC $7E
    push af                                       ;; 07:74FD $F5
    swap a                                        ;; 07:74FE $CB $37
    and  $F0                                      ;; 07:7500 $E6 $F0
    or   $08                                      ;; 07:7502 $F6 $08
    ld   hl, wEntitiesPosXTable                   ;; 07:7504 $21 $00 $C2
    add  hl, de                                   ;; 07:7507 $19
    ld   [hl], a                                  ;; 07:7508 $77
    pop  af                                       ;; 07:7509 $F1
    and  $F0                                      ;; 07:750A $E6 $F0
    add  $10                                      ;; 07:750C $C6 $10
    ld   hl, wEntitiesPosYTable                   ;; 07:750E $21 $10 $C2
    add  hl, de                                   ;; 07:7511 $19
    ld   [hl], a                                  ;; 07:7512 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:7513 $21 $40 $C3
    add  hl, de                                   ;; 07:7516 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 07:7517 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:7519 $21 $50 $C3
    add  hl, de                                   ;; 07:751C $19
    ld   [hl], $00                                ;; 07:751D $36 $00
    ld   hl, wEntitiesOptions1Table               ;; 07:751F $21 $30 $C4
    add  hl, de                                   ;; 07:7522 $19
    ld   [hl], ENTITY_OPT1_NONE                   ;; 07:7523 $36 $00
    ld   hl, wEntitiesHealthGroup                 ;; 07:7525 $21 $D0 $C4
    add  hl, de                                   ;; 07:7528 $19
    ld   [hl], $00                                ;; 07:7529 $36 $00
    pop  bc                                       ;; 07:752B $C1

ret_007_752C:
    ret                                           ;; 07:752C $C9
