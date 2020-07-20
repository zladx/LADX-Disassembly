; Array indexed by hActiveEntitySpriteVariant
;  byte 0: tile n°
;  byte 1: OAM attribute (palette index and flags)
ButterflyOAMAttributes::
._00 db $5E, %001
._01 db $5E, %001 | OAMF_YFLIP

; Randomly-selected X or Y speed
ButterflyPossibleSpeeds::
    db $04, -$04, $03, -$03, $02, -$02, $05, -$06

ButterflyEntityHandler::
    ; If the butterfly wings are downwards…
    ldh  a, [hActiveEntitySpriteVariant]          ; $6BC9
    cp   $01                                      ; $6BCB: $FE $01
    jr   nz, .downwardsEnd                        ; $6BCD: $20 $06
    ; … hActiveEntityVisualPosY = hActiveEntityVisualPosY - 0 (unused?)
    ldh  a, [hActiveEntityVisualPosY]             ; $6BCF: $F0 $EC
    sub  $00                                      ; $6BD1: $D6 $00
    ldh  [hActiveEntityVisualPosY], a             ; $6BD3: $E0 $EC
.downwardsEnd

    ld   de, ButterflyOAMAttributes                     ; $6BD5: $11 $BD $6B
    call RenderActiveEntitySprite                 ; $6BD8: $CD $77 $3C
    call func_006_64C6                            ; $6BDB: $CD $C6 $64

    ;
    ; Flip the wings every $1F frames
    ;

    ; [hActiveEntityState] = [hFrameCounter] + (c * 8)
    ld   a, c                                     ; $6BDE: $79
    sla  a                                        ; $6BDF: $CB $27
    sla  a                                        ; $6BE1: $CB $27
    sla  a                                        ; $6BE3: $CB $27
    ld   hl, hFrameCounter                        ; $6BE5: $21 $E7 $FF
    add  [hl]                                     ; $6BE8: $86
    ldh  [hActiveEntityState], a                  ; $6BE9: $E0 $F0

    rra                                           ; $6BEB: $1F
    rra                                           ; $6BEC: $1F
    rra                                           ; $6BED: $1F
    and  $01                                      ; $6BEE: $E6 $01
    call SetEntitySpriteVariant                   ; $6BF0: $CD $0C $3B
    call UpdateEntityPosWithSpeed_06              ; $6BF3: $CD $41 $65

    ; If [hActiveEntityState] & $1F == 0…
    ldh  a, [hActiveEntityState]                  ; $6BF6: $F0 $F0
    and  $1F                                      ; $6BF8: $E6 $1F
    jr   nz, .speedXEnd                           ; $6BFA: $20 $16
    ; Set a random horizontal speed
    call GetRandomByte                            ; $6BFC: $CD $0D $28
    and  $07                                      ; $6BFF: $E6 $07
    ld   e, a                                     ; $6C01: $5F
    ld   d, b                                     ; $6C02: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C03: $21 $C1 $6B
    add  hl, de                                   ; $6C06: $19
    ld   a, [hl]                                  ; $6C07: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6C08: $21 $B0 $C2
    add  hl, bc                                   ; $6C0B: $09
    add  [hl]                                     ; $6C0C: $86
    ld   hl, wEntitiesSpeedXTable                       ; $6C0D: $21 $40 $C2
    add  hl, bc                                   ; $6C10: $09
    ld   [hl], a                                  ; $6C11: $77
.speedXEnd

    ; If [hActiveEntityState] + $10 & $1F == 0…
    ldh  a, [hActiveEntityState]                  ; $6C12: $F0 $F0
    add  $10                                      ; $6C14: $C6 $10
    and  $1F                                      ; $6C16: $E6 $1F
    jr   nz, .speedYEnd                           ; $6C18: $20 $16
    ; Set a random vertical speed
    call GetRandomByte                            ; $6C1A: $CD $0D $28
    and  $07                                      ; $6C1D: $E6 $07
    ld   e, a                                     ; $6C1F: $5F
    ld   d, b                                     ; $6C20: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C21: $21 $C1 $6B
    add  hl, de                                   ; $6C24: $19
    ld   a, [hl]                                  ; $6C25: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $6C26: $21 $C0 $C2
    add  hl, bc                                   ; $6C29: $09
    add  [hl]                                     ; $6C2A: $86
    ld   hl, wEntitiesSpeedYTable                       ; $6C2B: $21 $50 $C2
    add  hl, bc                                   ; $6C2E: $09
    ld   [hl], a                                  ; $6C2F: $77
.speedYEnd

    ;
    ; Move closer to Link every $3F frame
    ;

    ; If [hActiveEntityState] & $3F == 0…
    ldh  a, [hActiveEntityState]                  ; $6C30: $F0 $F0
    and  $3F                                      ; $6C32: $E6 $3F
    jr   nz, .moveCloserToLinkEnd                 ; $6C34: $20 $36

    ldh  a, [hLinkPositionX]                      ; $6C36: $F0 $98
    push af                                       ; $6C38: $F5
    ldh  a, [hLinkPositionY]                      ; $6C39: $F0 $99
    push af                                       ; $6C3B: $F5
    ld   a, [$C50F]                               ; $6C3C: $FA $0F $C5
    cp   $FF                                      ; $6C3F: $FE $FF
    jr   z, .C50FEnd                              ; $6C41: $28 $10

    ld   e, a                                     ; $6C43: $5F
    ld   d, b                                     ; $6C44: $50
    ld   hl, wEntitiesPosXTable                   ; $6C45: $21 $00 $C2
    add  hl, de                                   ; $6C48: $19
    ld   a, [hl]                                  ; $6C49: $7E
    ldh  [hLinkPositionX], a                      ; $6C4A: $E0 $98
    ld   hl, wEntitiesPosYTable                   ; $6C4C: $21 $10 $C2
    add  hl, de                                   ; $6C4F: $19
    ld   a, [hl]                                  ; $6C50: $7E
    ldh  [hLinkPositionY], a                      ; $6C51: $E0 $99
.C50FEnd

    ; Move closer to Link by $02 pixels
    ld   a, $02                                   ; $6C53: $3E $02
    call GetVectorTowardsLink_trampoline          ; $6C55: $CD $B5 $3B
    pop  af                                       ; $6C58: $F1
    ldh  [hLinkPositionY], a                      ; $6C59: $E0 $99
    pop  af                                       ; $6C5B: $F1
    ldh  [hLinkPositionX], a                      ; $6C5C: $E0 $98
    ; wEntitiesPrivateState2Table[c] = [hScratch0]
    ldh  a, [hScratch0]                           ; $6C5E: $F0 $D7
    ld   hl, wEntitiesPrivateState2Table          ; $6C60: $21 $C0 $C2
    add  hl, bc                                   ; $6C63: $09
    ld   [hl], a                                  ; $6C64: $77
    ; wEntitiesPrivateState1Table[c] = [hScratch1]
    ldh  a, [hScratch1]                           ; $6C65: $F0 $D8
    ld   hl, wEntitiesPrivateState1Table          ; $6C67: $21 $B0 $C2
    add  hl, bc                                   ; $6C6A: $09
    ld   [hl], a                                  ; $6C6B: $77
.moveCloserToLinkEnd
    ret                                           ; $6C6C: $C9
