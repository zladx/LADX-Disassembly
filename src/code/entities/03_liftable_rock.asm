; A pot is a specialy-configured liftable rock.
PotEntityHandler::
    ld   d, $03                                   ; $5326: $16 $03
    ; fallthrough

LiftableRockEntityHandler::
    ld   a, c                                     ; $5328: $79
    ld   [wPickedUpRockIndex], a                  ; $5329: $EA $0C $C5
    call GetEntityPrivateCountdown1               ; $532C: $CD $00 $0C
    ldh  [hMultiPurpose0], a                      ; $532F: $E0 $D7
    jp   z, jp_003_53A8                           ; $5331: $CA $A8 $53

    cp   $01                                      ; $5334: $FE $01
    jr   nz, jr_003_5395                          ; $5336: $20 $5D

    ld   hl, wEntitiesPrivateState5Table          ; $5338: $21 $90 $C3
    add  hl, bc                                   ; $533B: $09
    ld   a, [hl]                                  ; $533C: $7E
    and  a                                        ; $533D: $A7
    jr   z, .jr_5369                              ; $533E: $28 $29

    call GetRandomByte                            ; $5340: $CD $0D $28
    and  $03                                      ; $5343: $E6 $03
    jr   nz, .jr_5369                             ; $5345: $20 $22

    ld   a, ENTITY_DROPPABLE_FAIRY                ; $5347: $3E $2F
    call SpawnNewEntity                           ; $5349: $CD $CA $64
    jr   c, .jr_5369                              ; $534C: $38 $1B

    ldh  a, [hMultiPurpose0]                      ; $534E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5350: $21 $00 $C2
    add  hl, de                                   ; $5353: $19
    ld   [hl], a                                  ; $5354: $77
    ldh  a, [hMultiPurpose1]                      ; $5355: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5357: $21 $10 $C2
    add  hl, de                                   ; $535A: $19
    ld   [hl], a                                  ; $535B: $77
    ldh  a, [hMultiPurpose3]                      ; $535C: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $535E: $21 $10 $C3
    add  hl, de                                   ; $5361: $19
    ld   [hl], a                                  ; $5362: $77
    ld   hl, wEntitiesDropTimerTable              ; $5363: $21 $50 $C4
    add  hl, de                                   ; $5366: $19
    ld   [hl], $80                                ; $5367: $36 $80

.jr_5369
    ldh  a, [hActiveEntitySpriteVariant]          ; $5369: $F0 $F1
    and  a                                        ; $536B: $A7
    jr   nz, .marinReactionEnd                    ; $536C: $20 $24

    ; If inside a house…
    ldh  a, [hMapId]                              ; $536E: $F0 $F7
    cp   MAP_GHOST_HOUSE                          ; $5370: $FE $1E
    jr   z, .insideHouse                          ; $5372: $28 $04

    cp   MAP_HOUSE                                ; $5374: $FE $10
    jr   nz, .marinReactionEnd                    ; $5376: $20 $1A

.insideHouse
    ; … and Marin is following Link…
    ld   a, [wIsMarinFollowingLink]               ; $5378: $FA $73 $DB
    and  a                                        ; $537B: $A7
    jr   z, .marinReactionEnd                     ; $537C: $28 $14

    ; draw a random number
    call GetRandomByte                            ; $537E: $CD $0D $28
    ; … if the random number is < $3F…
    and  $3F                                      ; $5381: $E6 $3F
    jr   nz, .marinReaction2                      ; $5383: $20 $08
    ; Open Marin reaction 1 (Dialog028)
    call_open_dialog Dialog028                    ; $5385
    jp   UnloadEntityAndReturn                    ; $538A: $C3 $8D $3F

.marinReaction2
    ; Open Marin reaction 2
    call_open_dialog Dialog199                    ; $538D

.marinReactionEnd
    jp   UnloadEntityAndReturn                    ; $5392: $C3 $8D $3F

jr_003_5395:
    jp   label_3935                               ; $5395: $C3 $35 $39

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; maybe for rock or pot entity
Unknown007SpriteVariants::
.variant0
    db $F0, OAM_GBC_PAL_7 | OAMF_PAL1
    db $F2, OAM_GBC_PAL_7 | OAMF_PAL1
.variant1
    db $F4, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F6, OAM_GBC_PAL_6 | OAMF_PAL1

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; maybe for rock or pot entity
Unknown008SpriteVariants::
.variant0
    db $F0, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F2, OAM_GBC_PAL_6 | OAMF_PAL1
.variant1
    db $F4, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F6, OAM_GBC_PAL_6 | OAMF_PAL1

jp_003_53A8::
IF __OPTIMIZATIONS_3__
    ld   de, Unknown007SpriteVariants
    ld   a, [wIsIndoor]
    and  a
    jr   z, .render
    ld   de, Unknown008SpriteVariants
ELSE
    ld   a, [wIsIndoor]                           ; $53A8: $FA $A5 $DB
    and  a                                        ; $53AB: $A7
    jr   z, .isNotIndoor                          ; $53AC: $28 $05
    ld   de, Unknown008SpriteVariants             ; $53AE: $11 $A0 $53
    jr   .render                                  ; $53B1: $18 $03

.isNotIndoor
    ld   de, Unknown007SpriteVariants             ; $53B3: $11 $98 $53
ENDC

.render
    call RenderActiveEntitySpritesPair            ; $53B6: $CD $C0 $3B
    call ReturnIfNonInteractive_03                ; $53B9: $CD $78 $7F
    ld   a, $0B                                   ; $53BC: $3E $0B
    ld   [wC19E], a                               ; $53BE: $EA $9E $C1
    call func_003_75A2                            ; $53C1: $CD $A2 $75
    call func_003_60B3                            ; $53C4: $CD $B3 $60
    ld   hl, wEntitiesStatusTable                 ; $53C7: $21 $80 $C2
    add  hl, bc                                   ; $53CA: $09
    ld   a, [hl]                                  ; $53CB: $7E
    cp   $02                                      ; $53CC: $FE $02
    jp   z, ret_003_5406                          ; $53CE: $CA $06 $54

    ld   hl, wEntitiesPosZTable                   ; $53D1: $21 $10 $C3
    add  hl, bc                                   ; $53D4: $09
    ld   a, [hl]                                  ; $53D5: $7E
    and  a                                        ; $53D6: $A7
    jr   z, func_003_53E4                         ; $53D7: $28 $0B

    ld   hl, wEntitiesCollisionsTable             ; $53D9: $21 $A0 $C2
    add  hl, bc                                   ; $53DC: $09
    ld   a, [hl]                                  ; $53DD: $7E
    and  a                                        ; $53DE: $A7
    jr   z, ret_003_5406                          ; $53DF: $28 $25

    call func_003_5438                            ; $53E1: $CD $38 $54
