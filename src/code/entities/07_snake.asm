; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SnakeSpriteVariants::
.variant0
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0
    db $46, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0
    db $48, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $46, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $48, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

SnakeEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $684E: $21 $80 $C3
    add  hl, bc                                   ; $6851: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6852: $F0 $F1
    add  [hl]                                     ; $6854: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $6855: $E0 $F1
    ld   de, SnakeSpriteVariants                  ; $6857: $11 $3E $68
    call RenderActiveEntitySpritesPair            ; $685A: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $685D: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $6860: $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ; $6863: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $6866: $CD $0A $7E
    call DefaultEntityPhysics_trampoline          ; $6869: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $686C: $21 $A0 $C2
    add  hl, bc                                   ; $686F: $09
    ld   a, [hl]                                  ; $6870: $7E
    and  a                                        ; $6871: $A7
    jr   z, .noCollision                          ; $6872: $28 $0E

    call IncrementEntityState                     ; $6874: $CD $12 $3B
    ld   [hl], b                                  ; $6877: $70
    call GetEntityTransitionCountdown             ; $6878: $CD $05 $0C
    ld   [hl], $08                                ; $687B: $36 $08
    call GetEntityPrivateCountdown1               ; $687D: $CD $00 $0C
    ld   [hl], $20                                ; $6880: $36 $20

.noCollision
    ldh  a, [hActiveEntityState]                  ; $6882: $F0 $F0
    JP_TABLE                                      ; $6884
._00 dw SnakeState0Handler                        ; $6885
._01 dw SnakeState1Handler                        ; $6887
._02 dw SnakeState2Handler                        ; $6889

SnakeXSpeeds::
    db   $08, $F8, $00, $00

SnakeYSpeeds::
    db   $00, $00, $F8, $08

SnakeDirections::
    db   $02, $00, $FF, $FF

; Idle
SnakeState0Handler::
    call GetEntityTransitionCountdown             ; $6897: $CD $05 $0C
    jr   nz, .skipIncrementState                  ; $689A: $20 $34

    call IncrementEntityState                     ; $689C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $689F: $CD $05 $0C
    call GetRandomByte                            ; $68A2: $CD $0D $28
    and  $1F                                      ; $68A5: $E6 $1F
    add  $30                                      ; $68A7: $C6 $30
    ld   [hl], a                                  ; $68A9: $77
    and  $03                                      ; $68AA: $E6 $03
    ld   e, a                                     ; $68AC: $5F

.updateSpeed
    ld   d, b                                     ; $68AD: $50
    ld   hl, SnakeXSpeeds                         ; $68AE: $21 $8B $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $68B3: $21 $40 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, SnakeYSpeeds                         ; $68B8: $21 $8F $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    call GetEntitySpeedYAddress                   ; $68BD: $CD $05 $40
    ld   [hl], a                                  ; $68C0: $77
    ld   hl, SnakeDirections                      ; $68C1: $21 $93 $68
    add  hl, de                                   ; $68C4: $19
    ld   a, [hl]                                  ; $68C5: $7E
    cp   $FF                                      ; $68C6: $FE $FF
    jr   z, .return                               ; $68C8: $28 $05

    ld   hl, wEntitiesDirectionTable              ; $68CA: $21 $80 $C3
    add  hl, bc                                   ; $68CD: $09
    ld   [hl], a                                  ; $68CE: $77

.return
    ret                                           ; $68CF: $C9

.skipIncrementState
    call ClearEntitySpeed                         ; $68D0: $CD $7F $3D
    call SnakeStartDashIfNeeded                   ; $68D3: $CD $F0 $68
    jr   AnimateSnake                             ; $68D6: $18 $0E

; Crawling
SnakeState1Handler::
    call GetEntityTransitionCountdown             ; $68D8: $CD $05 $0C
    jr   nz, .skipIncrementState                  ; $68DB: $20 $06

    ld   [hl], $18                                ; $68DD: $36 $18
    call IncrementEntityState                     ; $68DF: $CD $12 $3B
    ld   [hl], b                                  ; $68E2: $70

.skipIncrementState
    call SnakeStartDashIfNeeded                   ; $68E3: $CD $F0 $68

AnimateSnake::
    ldh  a, [hFrameCounter]                       ; $68E6: $F0 $E7
    rra                                           ; $68E8: $1F
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    and  $01                                      ; $68EB: $E6 $01
    jp   SetEntitySpriteVariant                   ; $68ED: $C3 $0C $3B

SnakeStartDashIfNeeded::
    call GetEntityPrivateCountdown1               ; $68F0: $CD $00 $0C
    jr   nz, .return                              ; $68F3: $20 $24

    call GetEntityXDistanceToLink_07              ; $68F5: $CD $5D $7E
    add  $08                                      ; $68F8: $C6 $08
    cp   $10                                      ; $68FA: $FE $10
    jr   nc, .verticalDashEnd                     ; $68FC: $30 $1C

    call GetEntityYDistanceToLink_07              ; $68FE: $CD $6D $7E

.updateSpeedAndIncrementState
    call SnakeState0Handler.updateSpeed           ; $6901: $CD $AD $68
    ld   hl, wEntitiesSpeedXTable                 ; $6904: $21 $40 $C2
    add  hl, bc                                   ; $6907: $09
    sla  [hl]                                     ; $6908: $CB $26
    call GetEntitySpeedYAddress                   ; $690A: $CD $05 $40
    sla  [hl]                                     ; $690D: $CB $26
    call IncrementEntityState                     ; $690F: $CD $12 $3B
    ld   [hl], $02                                ; $6912: $36 $02
    call GetEntityTransitionCountdown             ; $6914: $CD $05 $0C
    ld   [hl], $30                                ; $6917: $36 $30

.return
    ret                                           ; $6919: $C9

.verticalDashEnd
    call GetEntityYDistanceToLink_07              ; $691A: $CD $6D $7E
    add  $08                                      ; $691D: $C6 $08
    cp   $10                                      ; $691F: $FE $10
    jr   nc, .return2                             ; $6921: $30 $05

    call GetEntityXDistanceToLink_07              ; $6923: $CD $5D $7E
    jr   .updateSpeedAndIncrementState            ; $6926: $18 $D9

.return2
    ret                                           ; $6928: $C9

; Dashing
SnakeState2Handler::
    call GetEntityTransitionCountdown             ; $6929: $CD $05 $0C
    jr   nz, .skipIncrementState                  ; $692C: $20 $0B

    ld   [hl], $20                                ; $692E: $36 $20
    call IncrementEntityState                     ; $6930: $CD $12 $3B
    ld   [hl], b                                  ; $6933: $70
    call GetEntityPrivateCountdown1               ; $6934: $CD $00 $0C
    ld   [hl], $40                                ; $6937: $36 $40

.skipIncrementState
    ldh  a, [hFrameCounter]                       ; $6939: $F0 $E7
    rra                                           ; $693B: $1F
    rra                                           ; $693C: $1F
    and  $01                                      ; $693D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $693F: $C3 $0C $3B
