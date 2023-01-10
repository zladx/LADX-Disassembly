; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ArmosStatueSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_7 | OAMF_PAL0
    db $62, OAM_GBC_PAL_7 | OAMF_PAL0
.variant1
    db $64, OAM_GBC_PAL_7 | OAMF_PAL0
    db $66, OAM_GBC_PAL_7 | OAMF_PAL0

ArmosStatueEntityHandler::
    ld   de, ArmosStatueSpriteVariants            ; $744E: $11 $46 $74
    call RenderActiveEntitySpritesPair            ; $7451: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $7454: $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ; $7457: $CD $F7 $64
    xor  a                                        ; $745A: $AF
    ldh  [hMultiPurposeG], a                      ; $745B: $E0 $E8
    call label_3B70                               ; $745D: $CD $70 $3B
    call CheckLinkCollisionWithEnemy_trampoline   ; $7460: $CD $5A $3B
    jr   nc, .jr_7472                             ; $7463: $30 $0D

    ld   a, $01                                   ; $7465: $3E $01
    ldh  [hMultiPurposeG], a                      ; $7467: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $7469: $F0 $F0
    cp   $02                                      ; $746B: $FE $02
    jr   nc, .jr_7472                             ; $746D: $30 $03

    call CopyLinkFinalPositionToPosition          ; $746F: $CD $BE $0C

.jr_7472
    call UpdateEntityPosWithSpeed_06              ; $7472: $CD $41 $65
    call label_3B23                               ; $7475: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $7478: $F0 $F0
    JP_TABLE                                      ; $747A
._00 dw ArmosStatueState0Handler
._01 dw ArmosStatueState1Handler
._02 dw ArmosStatueState2Handler

ArmosStatueState0Handler::
    ldh  a, [hMultiPurposeG]
    and  a
    jr   z, .return                               ; $7484: $28 $0E

    call IncrementEntityState                     ; $7486: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7489: $CD $05 $0C
    ld   [hl], $30                                ; $748C: $36 $30
    ld   hl, wEntitiesFlashCountdownTable         ; $748E: $21 $20 $C4
    add  hl, bc                                   ; $7491: $09
    ld   [hl], $18                                ; $7492: $36 $18

.return
    ret                                           ; $7494: $C9

ArmosStatueState1Handler::
    call GetEntityTransitionCountdown             ; $7495: $CD $05 $0C
    jr   nz, .jr_74B2                             ; $7498: $20 $18

    call IncrementEntityState                     ; $749A: $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $749D: $21 $40 $C3
    add  hl, bc                                   ; $74A0: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $74A1: $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ; $74A3: $21 $50 $C3
    add  hl, bc                                   ; $74A6: $09
    res  7, [hl]                                  ; $74A7: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $74A9: $21 $30 $C4
    add  hl, bc                                   ; $74AC: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $74AD: $CB $B6
    jp   ClearEntitySpeed                         ; $74AF: $C3 $7F $3D

.jr_74B2
    ld   e, $08                                   ; $74B2: $1E $08
    and  $04                                      ; $74B4: $E6 $04
    jr   z, .jr_74BA                              ; $74B6: $28 $02

    ld   e, $F8                                   ; $74B8: $1E $F8

.jr_74BA
    ld   hl, wEntitiesSpeedXTable                 ; $74BA: $21 $40 $C2
    add  hl, bc                                   ; $74BD: $09
    ld   [hl], e                                  ; $74BE: $73
    ret                                           ; $74BF: $C9

Data_006_74C0::
    db   $F8, $FA

Data_006_74C2::
    db   $00, $06, $08, $06, $00, $FA, $F8, $FA

ArmosStatueState2Handler::
    call GetEntityTransitionCountdown             ; $74CA: $CD $05 $0C
    jr   nz, jr_006_74EF                          ; $74CD: $20 $20

    call GetRandomByte                            ; $74CF: $CD $0D $28
    and  $3F                                      ; $74D2: $E6 $3F
    add  $20                                      ; $74D4: $C6 $20
    ld   [hl], a                                  ; $74D6: $77
    and  $07                                      ; $74D7: $E6 $07
    ld   e, a                                     ; $74D9: $5F
    ld   d, b                                     ; $74DA: $50
    ld   hl, Data_006_74C2                        ; $74DB: $21 $C2 $74
    add  hl, de                                   ; $74DE: $19
    ld   a, [hl]                                  ; $74DF: $7E

.jr_74E0
    ld   hl, wEntitiesSpeedXTable                 ; $74E0: $21 $40 $C2
    add  hl, bc                                   ; $74E3: $09
    ld   [hl], a                                  ; $74E4: $77
    ld   hl, Data_006_74C0                        ; $74E5: $21 $C0 $74
    add  hl, de                                   ; $74E8: $19
    ld   a, [hl]                                  ; $74E9: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $74EA: $21 $50 $C2
    add  hl, bc                                   ; $74ED: $09
    ld   [hl], a                                  ; $74EE: $77

jr_006_74EF:
    ldh  a, [hFrameCounter]                       ; $74EF: $F0 $E7
    rra                                           ; $74F1: $1F
    rra                                           ; $74F2: $1F
    rra                                           ; $74F3: $1F
    rra                                           ; $74F4: $1F
    and  $01                                      ; $74F5: $E6 $01
    jp   SetEntitySpriteVariant                   ; $74F7: $C3 $0C $3B
