ArrowEntityHandler::
    ; Increment the active projectiles count
    ld   hl, wActiveProjectileCount               ; $6A34: $21 $4D $C1
    inc  [hl]                                     ; $6A37: $34

    ; If hActiveEntityState == 1…
    ldh  a, [hActiveEntityState]                  ; $6A38: $F0 $F0
    and  a                                        ; $6A3A: $A7
    jr   nz, BombArrowEntityHandler               ; $6A3B: $20 $33

    ; If GetEntityTransitionCountdown != 0…
    call GetEntityTransitionCountdown             ; $6A3D: $CD $05 $0C
    ; call LoadMobilArrowSpriteVariants and return
    jp   nz, LoadMobilArrowSpriteVariants         ; $6A40: $C2 $D4 $6A

    ;
    ; hActiveEntityState == 0 and GetEntityTransitionCountdown == 0
    ;

    ld   a, $05                                   ; $6A43: $3E $05
    ld   [wC19E], a                               ; $6A45: $EA $9E $C1
    call func_003_75A2                            ; $6A48: $CD $A2 $75
    call LoadMobilArrowSpriteVariants             ; $6A4B: $CD $D4 $6A

    ;
    ; Allow shooting the Dungeon 8 statue in the eye
    ;

    ; If hActiveEntitySpriteVariant == 2…
    ldh  a, [hActiveEntitySpriteVariant]          ; $6A4E: $F0 $F1
    cp   $02                                      ; $6A50: $FE $02
    ret  nz                                       ; $6A52: $C0
    ; and the event trigger is TRIGGER_SHOOT_STATUE_EYE…
    ld   a, [wRoomEvent]                          ; $6A53: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $6A56: $E6 $1F
    cp   TRIGGER_SHOOT_STATUE_EYE                 ; $6A58: $FE $0F
    ret  nz                                       ; $6A5A: $C0
    ; and hObjectUnderEntity == OBJECT_ONE_EYED_STATUE…
    ldh  a, [hObjectUnderEntity]                  ; $6A5B: $F0 $AF
    cp   OBJECT_ONE_EYED_STATUE                   ; $6A5D: $FE $C0
    ret  nz                                       ; $6A5F: $C0
    ; call MarkTriggerAsResolved, and clear entity
    call MarkTriggerAsResolved                    ; $6A60: $CD $60 $0C
    jp   UnloadEntityAndReturn                    ; $6A63: $C3 $8D $3F

Data_003_6A66::
    db   $80, $15

Data_003_6A68::
    db   $04, $FC, $00, $00

Data_003_6A6C::
    db   $FE, $FE, $FA, $04

BombArrowEntityHandler::
    call GetEntityTransitionCountdown             ; $6A70: $CD $05 $0C
    jr   z, .notExploding                         ; $6A73: $28 $21

    ld   a, ENTITY_BOMB                           ; $6A75: $3E $02
    call SpawnNewEntity                           ; $6A77: $CD $CA $64
    jr   c, .bombSpawnFailed                      ; $6A7A: $38 $17

    ldh  a, [hMultiPurpose0]                      ; $6A7C: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6A7E: $21 $00 $C2
    add  hl, de                                   ; $6A81: $19
    ld   [hl], a                                  ; $6A82: $77
    ldh  a, [hMultiPurpose1]                      ; $6A83: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6A85: $21 $10 $C2
    add  hl, de                                   ; $6A88: $19
    ld   [hl], a                                  ; $6A89: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A8A: $21 $E0 $C2
    add  hl, de                                   ; $6A8D: $19
    ld   [hl], $17                                ; $6A8E: $36 $17
    call PlayBombExplosionSfx                     ; $6A90: $CD $4B $0C

.bombSpawnFailed
    jp   UnloadEntityAndReturn                    ; $6A93: $C3 $8D $3F

.notExploding
    ldh  a, [hActiveEntitySpriteVariant]          ; $6A96: $F0 $F1
    push af                                       ; $6A98: $F5
    ld   e, a                                     ; $6A99: $5F
    ld   d, b                                     ; $6A9A: $50
    xor  a                                        ; $6A9B: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $6A9C: $E0 $F1
    ld   hl, Data_003_6A68                        ; $6A9E: $21 $68 $6A
    add  hl, de                                   ; $6AA1: $19
    ldh  a, [hActiveEntityPosX]                   ; $6AA2: $F0 $EE
    add  [hl]                                     ; $6AA4: $86
    ldh  [hActiveEntityPosX], a                   ; $6AA5: $E0 $EE
    ld   hl, Data_003_6A6C                        ; $6AA7: $21 $6C $6A
    add  hl, de                                   ; $6AAA: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $6AAB: $F0 $EC
    add  [hl]                                     ; $6AAD: $86
    ldh  [hActiveEntityVisualPosY], a             ; $6AAE: $E0 $EC
    ld   de, Data_003_6A66                        ; $6AB0: $11 $66 $6A
    call RenderActiveEntitySprite                 ; $6AB3: $CD $77 $3C
    call CopyEntityPositionToActivePosition       ; $6AB6: $CD $8A $3D
    pop  af                                       ; $6AB9: $F1
    ldh  [hActiveEntitySpriteVariant], a          ; $6ABA: $E0 $F1
    ld   de, EntityMoblinArrowSpriteVariants      ; $6ABC: $11 $C6 $6B
    call RenderActiveEntitySpritesPair            ; $6ABF: $CD $C0 $3B
    ld   a, $0C                                   ; $6AC2: $3E $0C
    ld   [wC19E], a                               ; $6AC4: $EA $9E $C1
    call func_003_75A2                            ; $6AC7: $CD $A2 $75
    jr   jr_003_6ADA                              ; $6ACA: $18 $0E
