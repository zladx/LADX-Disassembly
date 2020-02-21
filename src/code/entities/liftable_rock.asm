LiftableRockEntityHandler::
    ld   a, c                                     ; $5328: $79
    ld   [$C50C], a                               ; $5329: $EA $0C $C5
    call GetEntityPrivateCountdown1                                      ; $532C: $CD $00 $0C
    ldh  [hScratch0], a                           ; $532F: $E0 $D7
    jp   z, jp_003_53A8                           ; $5331: $CA $A8 $53

    cp   $01                                      ; $5334: $FE $01
    jr   nz, jr_003_5395                          ; $5336: $20 $5D

    ld   hl, wEntitiesUnknowTableR                ; $5338: $21 $90 $C3
    add  hl, bc                                   ; $533B: $09
    ld   a, [hl]                                  ; $533C: $7E
    and  a                                        ; $533D: $A7
    jr   z, jr_003_5369                           ; $533E: $28 $29

    call GetRandomByte                            ; $5340: $CD $0D $28
    and  $03                                      ; $5343: $E6 $03
    jr   nz, jr_003_5369                          ; $5345: $20 $22

    ld   a, ENTITY_DROPPABLE_FAIRY                ; $5347: $3E $2F
    call SpawnNewEntity                           ; $5349: $CD $CA $64
    jr   c, jr_003_5369                           ; $534C: $38 $1B

    ldh  a, [hScratch0]                           ; $534E: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $5350: $21 $00 $C2
    add  hl, de                                   ; $5353: $19
    ld   [hl], a                                  ; $5354: $77
    ldh  a, [hScratch1]                           ; $5355: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5357: $21 $10 $C2
    add  hl, de                                   ; $535A: $19
    ld   [hl], a                                  ; $535B: $77
    ldh  a, [hScratch3]                           ; $535C: $F0 $DA
    ld   hl, wEntitiesPosZTable                                ; $535E: $21 $10 $C3
    add  hl, de                                   ; $5361: $19
    ld   [hl], a                                  ; $5362: $77
    ld   hl, wEntitiesDropTimerTable                                ; $5363: $21 $50 $C4
    add  hl, de                                   ; $5366: $19
    ld   [hl], $80                                ; $5367: $36 $80

jr_003_5369:
    ldh  a, [hActiveEntitySpriteVariant]               ; $5369: $F0 $F1
    and  a                                        ; $536B: $A7
    jr   nz, jr_003_5392                          ; $536C: $20 $24

    ; If not in a house, and not on map MAP_UNKNOWN_1E…
    ldh  a, [hMapId]                              ; $536E: $F0 $F7
    cp   MAP_UNKNOWN_1E                           ; $5370: $FE $1E
    jr   z, jr_003_5378                           ; $5372: $28 $04

    cp   MAP_HOUSE                                ; $5374: $FE $10
    jr   nz, jr_003_5392                          ; $5376: $20 $1A

jr_003_5378:
    ; … and Marin is following Link…
    ld   a, [wIsMarinFollowingLink]               ; $5378: $FA $73 $DB
    and  a                                        ; $537B: $A7
    jr   z, jr_003_5392                           ; $537C: $28 $14

    ; draw a random number
    call GetRandomByte                            ; $537E: $CD $0D $28
    ; … if the random number is < $3F…
    and  $3F                                      ; $5381: $E6 $3F
    jr   nz, .marinReaction2                      ; $5383: $20 $08
    ; Open Marin reaction 1 (Dialog028)
    call_open_dialog $028                         ; $5385
    jp   UnloadEntityAndReturn                    ; $538A: $C3 $8D $3F

.marinReaction2
    ; Open Marin reaction 2
    call_open_dialog $199                         ; $538D

jr_003_5392:
    jp   UnloadEntityAndReturn                    ; $5392: $C3 $8D $3F

jr_003_5395:
    jp   label_3935                               ; $5395: $C3 $35 $39
