Data_018_77ED::
    db   $00, $FC, $70, $02, $00, $04, $72, $02, $00, $0C, $70, $22, $00, $FC, $74, $02
    db   $00, $04, $72, $02, $00, $0C, $74, $22, $00, $FC, $76, $02, $00, $04, $72, $02
    db   $00, $0C, $76, $22, $00, $FC, $74, $02, $00, $04, $72, $02, $00, $0C, $74, $22

Data_018_781D::
    db   $10, $11, $12, $11

BomberEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7821: $F0 $F1
    rla                                           ; $7823: $17
    rla                                           ; $7824: $17
    and  $FC                                      ; $7825: $E6 $FC
    ld   e, a                                     ; $7827: $5F
    rla                                           ; $7828: $17
    and  $F8                                      ; $7829: $E6 $F8
    add  e                                        ; $782B: $83
    ld   e, a                                     ; $782C: $5F
    ld   d, b                                     ; $782D: $50
    ld   hl, Data_018_77ED                        ; $782E: $21 $ED $77
    add  hl, de                                   ; $7831: $19
    ld   c, $03                                   ; $7832: $0E $03
    call RenderActiveEntitySpritesRect            ; $7834: $CD $E6 $3C
    call ReturnIfNonInteractive_18                ; $7837: $CD $E8 $7D
    call label_3CD9                               ; $783A: $CD $D9 $3C
    ld   hl, wEntitiesInertiaTable                ; $783D: $21 $D0 $C3
    add  hl, bc                                   ; $7840: $09
    ld   a, [hl]                                  ; $7841: $7E
    rra                                           ; $7842: $1F
    rra                                           ; $7843: $1F
    rra                                           ; $7844: $1F
    and  $03                                      ; $7845: $E6 $03
    ld   e, a                                     ; $7847: $5F
    ld   d, b                                     ; $7848: $50
    ld   hl, Data_018_781D                        ; $7849: $21 $1D $78
    add  hl, de                                   ; $784C: $19
    ld   a, [hl]                                  ; $784D: $7E
    ld   hl, wEntitiesPosZTable                   ; $784E: $21 $10 $C3
    add  hl, bc                                   ; $7851: $09
    ld   [hl], a                                  ; $7852: $77
    call ApplyRecoilIfNeeded_18                   ; $7853: $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ; $7856: $CD $5F $7E
    call label_3B23                               ; $7859: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $785C: $F0 $F0
    JP_TABLE                                      ; $785E
._00 dw BomberState0Handler
._01 dw BomberState1Handler
._02 dw BomberState2Handler

Data_018_7865::
    db   $F8, $FA

Data_018_7867::
    db   $00, $06, $08, $06, $00, $FA, $F8, $FA

BomberState0Handler::
    call GetEntityTransitionCountdown             ; $786F: $CD $05 $0C
    jr   nz, label_018_78A6                       ; $7872: $20 $32

    call GetRandomByte                            ; $7874: $CD $0D $28
    and  $1F                                      ; $7877: $E6 $1F
    add  $20                                      ; $7879: $C6 $20
    ld   [hl], a                                  ; $787B: $77
    and  $07                                      ; $787C: $E6 $07
    ld   e, a                                     ; $787E: $5F
    ld   d, b                                     ; $787F: $50
    ld   hl, Data_018_7867                        ; $7880: $21 $67 $78
    add  hl, de                                   ; $7883: $19
    ld   a, [hl]                                  ; $7884: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7885: $21 $40 $C2
    add  hl, bc                                   ; $7888: $09
    ld   [hl], a                                  ; $7889: $77
    ld   hl, Data_018_7865                        ; $788A: $21 $65 $78
    add  hl, de                                   ; $788D: $19
    ld   a, [hl]                                  ; $788E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $788F: $21 $50 $C2
    add  hl, bc                                   ; $7892: $09
    ld   [hl], a                                  ; $7893: $77
    ld   hl, wEntitiesPrivateState1Table          ; $7894: $21 $B0 $C2
    add  hl, bc                                   ; $7897: $09
    inc  [hl]                                     ; $7898: $34
    ld   a, [hl]                                  ; $7899: $7E
    and  $07                                      ; $789A: $E6 $07
    jr   nz, .jr_78A3                             ; $789C: $20 $05

    ld   a, $0A                                   ; $789E: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $78A0: $CD $AA $3B

.jr_78A3
    call IncrementEntityState                     ; $78A3: $CD $12 $3B

label_018_78A6:
    ld   hl, wEntitiesInertiaTable                ; $78A6: $21 $D0 $C3
    add  hl, bc                                   ; $78A9: $09
    ld   a, [hl]                                  ; $78AA: $7E
    inc  [hl]                                     ; $78AB: $34
    and  $7F                                      ; $78AC: $E6 $7F
    jr   nz, .jr_78F1                             ; $78AE: $20 $41

    ld   a, ENTITY_BOMB                           ; $78B0: $3E $02
    call SpawnNewEntity_trampoline                ; $78B2: $CD $86 $3B
    jr   c, .jr_78F1                              ; $78B5: $38 $3A

    ld   hl, wEntitiesOptions1Table               ; $78B7: $21 $30 $C4
    add  hl, de                                   ; $78BA: $19
    res  0, [hl]                                  ; $78BB: $CB $86
    ldh  a, [hMultiPurpose0]                      ; $78BD: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $78BF: $21 $00 $C2
    add  hl, de                                   ; $78C2: $19
    ld   [hl], a                                  ; $78C3: $77
    ldh  a, [hMultiPurpose1]                      ; $78C4: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $78C6: $21 $10 $C2
    add  hl, de                                   ; $78C9: $19
    ld   [hl], a                                  ; $78CA: $77
    ldh  a, [hMultiPurpose3]                      ; $78CB: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $78CD: $21 $10 $C3
    add  hl, de                                   ; $78D0: $19
    ld   [hl], a                                  ; $78D1: $77
    ld   hl, wEntitiesSpeedZTable                 ; $78D2: $21 $20 $C3
    add  hl, de                                   ; $78D5: $19
    ld   [hl], $08                                ; $78D6: $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ; $78D8: $21 $E0 $C2
    add  hl, de                                   ; $78DB: $19
    ld   [hl], $40                                ; $78DC: $36 $40
    ld   hl, wEntitiesPrivateState4Table          ; $78DE: $21 $40 $C4
    add  hl, de                                   ; $78E1: $19
    ld   [hl], $01                                ; $78E2: $36 $01
    push bc                                       ; $78E4: $C5
    ld   c, e                                     ; $78E5: $4B
    ld   b, d                                     ; $78E6: $42
    ld   a, $10                                   ; $78E7: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $78E9: $CD $AA $3B
    pop  bc                                       ; $78EC: $C1
    ld   a, JINGLE_FALL_DOWN                      ; $78ED: $3E $08
    ldh  [hJingle], a                             ; $78EF: $E0 $F2

.jr_78F1
    call func_018_7EE1                            ; $78F1: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $78F4: $F0 $9E
    xor  $01                                      ; $78F6: $EE $01
    cp   e                                        ; $78F8: $BB
    jr   nz, .jr_7935                             ; $78F9: $20 $3A

    call func_018_7EB2                            ; $78FB: $CD $B2 $7E
    add  $20                                      ; $78FE: $C6 $20
    cp   $40                                      ; $7900: $FE $40
    jr   nc, .jr_7935                             ; $7902: $30 $31

    call func_018_7ED2                            ; $7904: $CD $D2 $7E
    add  $20                                      ; $7907: $C6 $20
    cp   $40                                      ; $7909: $FE $40
    jr   nc, .jr_7935                             ; $790B: $30 $28
    ; if wSwordAnimationState == SWORD_ANIMATION_STATE_NONE jump to .jr_7935
    ld   a, [wSwordAnimationState]                ; $790D: $FA $37 $C1
    and  a                                        ; $7910: $A7
    jr   z, .jr_7935                              ; $7911: $28 $22

    call IncrementEntityState                     ; $7913: $CD $12 $3B
    ld   [hl], $02                                ; $7916: $36 $02
    call GetEntityTransitionCountdown             ; $7918: $CD $05 $0C
    ld   [hl], $12                                ; $791B: $36 $12
    ld   a, $20                                   ; $791D: $3E $20
    call GetVectorTowardsLink_trampoline          ; $791F: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7922: $F0 $D7
    cpl                                           ; $7924: $2F
    inc  a                                        ; $7925: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $7926: $21 $50 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77
    ldh  a, [hMultiPurpose1]                      ; $792B: $F0 $D8
    cpl                                           ; $792D: $2F
    inc  a                                        ; $792E: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $792F: $21 $40 $C2
    add  hl, bc                                   ; $7932: $09
    ld   [hl], a                                  ; $7933: $77
    ret                                           ; $7934: $C9

.jr_7935
    call label_3B39                               ; $7935: $CD $39 $3B

label_018_7938:
    ldh  a, [hFrameCounter]                       ; $7938: $F0 $E7
    rra                                           ; $793A: $1F
    rra                                           ; $793B: $1F
    and  $03                                      ; $793C: $E6 $03
    jp   SetEntitySpriteVariant                   ; $793E: $C3 $0C $3B

BomberState1Handler::
    call GetEntityTransitionCountdown             ; $7941: $CD $05 $0C
    jr   nz, .jr_794F                             ; $7944: $20 $09

    ld   [hl], $20                                ; $7946: $36 $20
    call IncrementEntityState                     ; $7948: $CD $12 $3B
    ld   [hl], b                                  ; $794B: $70
    call ClearEntitySpeed                         ; $794C: $CD $7F $3D

.jr_794F
    jp   label_018_78A6                           ; $794F: $C3 $A6 $78

BomberState2Handler::
    call GetEntityTransitionCountdown             ; $7952: $CD $05 $0C
    jr   nz, .jr_795B                             ; $7955: $20 $04

    call IncrementEntityState                     ; $7957: $CD $12 $3B
    ld   [hl], b                                  ; $795A: $70

.jr_795B
    jp   label_018_7938                           ; $795B: $C3 $38 $79
