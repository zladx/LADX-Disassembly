; Array indexed by hActiveEntitySpriteVariant
;  byte 0: tile n°
;  byte 1: OAM attribute (palette index and flags)
ButterflyOAMAttributes::
;       n°   OAM
._00 db $5E, OAM_GBC_PAL_1
._01 db $5E, OAM_GBC_PAL_1 | OAMF_YFLIP

; Randomly-selected X or Y speed
ButterflyPossibleSpeeds::
    db $04, -$04, $03, -$03, $02, -$02, $05, -$06

ButterflyEntityHandler::
    ; If the butterfly wings are downwards…
    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:6BC9
    cp   $01                                      ;; 06:6BCB $FE $01
    jr   nz, .downwardsEnd                        ;; 06:6BCD $20 $06
    ; … hActiveEntityVisualPosY = hActiveEntityVisualPosY - 0 (unused?)
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:6BCF $F0 $EC
    sub  $00                                      ;; 06:6BD1 $D6 $00
    ldh  [hActiveEntityVisualPosY], a             ;; 06:6BD3 $E0 $EC
.downwardsEnd

    ld   de, ButterflyOAMAttributes               ;; 06:6BD5 $11 $BD $6B
    call RenderActiveEntitySprite                 ;; 06:6BD8 $CD $77 $3C
    call ReturnIfNonInteractive_06                ;; 06:6BDB $CD $C6 $64

    ;
    ; Flip the wings every $1F frames
    ;

    ; [hActiveEntityState] = [hFrameCounter] + (c * 8)
    ld   a, c                                     ;; 06:6BDE $79
    sla  a                                        ;; 06:6BDF $CB $27
    sla  a                                        ;; 06:6BE1 $CB $27
    sla  a                                        ;; 06:6BE3 $CB $27
    ld   hl, hFrameCounter                        ;; 06:6BE5 $21 $E7 $FF
    add  [hl]                                     ;; 06:6BE8 $86
    ldh  [hActiveEntityState], a                  ;; 06:6BE9 $E0 $F0

    rra                                           ;; 06:6BEB $1F
    rra                                           ;; 06:6BEC $1F
    rra                                           ;; 06:6BED $1F
    and  $01                                      ;; 06:6BEE $E6 $01
    call SetEntitySpriteVariant                   ;; 06:6BF0 $CD $0C $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:6BF3 $CD $41 $65

    ; If [hActiveEntityState] & $1F == 0…
    ldh  a, [hActiveEntityState]                  ;; 06:6BF6 $F0 $F0
    and  $1F                                      ;; 06:6BF8 $E6 $1F
    jr   nz, .speedXEnd                           ;; 06:6BFA $20 $16
    ; Set a random horizontal speed
    call GetRandomByte                            ;; 06:6BFC $CD $0D $28
    and  $07                                      ;; 06:6BFF $E6 $07
    ld   e, a                                     ;; 06:6C01 $5F
    ld   d, b                                     ;; 06:6C02 $50
    ld   hl, ButterflyPossibleSpeeds              ;; 06:6C03 $21 $C1 $6B
    add  hl, de                                   ;; 06:6C06 $19
    ld   a, [hl]                                  ;; 06:6C07 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6C08 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6C0B $09
    add  [hl]                                     ;; 06:6C0C $86
    ld   hl, wEntitiesSpeedXTable                 ;; 06:6C0D $21 $40 $C2
    add  hl, bc                                   ;; 06:6C10 $09
    ld   [hl], a                                  ;; 06:6C11 $77
.speedXEnd

    ; If [hActiveEntityState] + $10 & $1F == 0…
    ldh  a, [hActiveEntityState]                  ;; 06:6C12 $F0 $F0
    add  $10                                      ;; 06:6C14 $C6 $10
    and  $1F                                      ;; 06:6C16 $E6 $1F
    jr   nz, .speedYEnd                           ;; 06:6C18 $20 $16
    ; Set a random vertical speed
    call GetRandomByte                            ;; 06:6C1A $CD $0D $28
    and  $07                                      ;; 06:6C1D $E6 $07
    ld   e, a                                     ;; 06:6C1F $5F
    ld   d, b                                     ;; 06:6C20 $50
    ld   hl, ButterflyPossibleSpeeds              ;; 06:6C21 $21 $C1 $6B
    add  hl, de                                   ;; 06:6C24 $19
    ld   a, [hl]                                  ;; 06:6C25 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 06:6C26 $21 $C0 $C2
    add  hl, bc                                   ;; 06:6C29 $09
    add  [hl]                                     ;; 06:6C2A $86
    ld   hl, wEntitiesSpeedYTable                 ;; 06:6C2B $21 $50 $C2
    add  hl, bc                                   ;; 06:6C2E $09
    ld   [hl], a                                  ;; 06:6C2F $77
.speedYEnd

    ;
    ; Move closer to Link every $3F frame
    ;

    ; If [hActiveEntityState] & $3F == 0…
    ldh  a, [hActiveEntityState]                  ;; 06:6C30 $F0 $F0
    and  $3F                                      ;; 06:6C32 $E6 $3F
    jr   nz, .moveCloserToLinkEnd                 ;; 06:6C34 $20 $36

    ldh  a, [hLinkPositionX]                      ;; 06:6C36 $F0 $98
    push af                                       ;; 06:6C38 $F5
    ldh  a, [hLinkPositionY]                      ;; 06:6C39 $F0 $99
    push af                                       ;; 06:6C3B $F5

    ; If Marin is following Link…
    ld   a, [wMarinEntityIndex]                   ;; 06:6C3C $FA $0F $C5
    cp   $FF                                      ;; 06:6C3F $FE $FF
    jr   z, .moveTowardsMarinEnd                  ;; 06:6C41 $28 $10
    ; … move towards Marin instead
    ld   e, a                                     ;; 06:6C43 $5F
    ld   d, b                                     ;; 06:6C44 $50
    ld   hl, wEntitiesPosXTable                   ;; 06:6C45 $21 $00 $C2
    add  hl, de                                   ;; 06:6C48 $19
    ld   a, [hl]                                  ;; 06:6C49 $7E
    ldh  [hLinkPositionX], a                      ;; 06:6C4A $E0 $98
    ld   hl, wEntitiesPosYTable                   ;; 06:6C4C $21 $10 $C2
    add  hl, de                                   ;; 06:6C4F $19
    ld   a, [hl]                                  ;; 06:6C50 $7E
    ldh  [hLinkPositionY], a                      ;; 06:6C51 $E0 $99
.moveTowardsMarinEnd

    ; Move closer to Link by $02 pixels
    ld   a, $02                                   ;; 06:6C53 $3E $02
    call GetVectorTowardsLink_trampoline          ;; 06:6C55 $CD $B5 $3B
    pop  af                                       ;; 06:6C58 $F1
    ldh  [hLinkPositionY], a                      ;; 06:6C59 $E0 $99
    pop  af                                       ;; 06:6C5B $F1
    ldh  [hLinkPositionX], a                      ;; 06:6C5C $E0 $98
    ; wEntitiesPrivateState2Table[c] = [hMultiPurpose0]
    ldh  a, [hMultiPurpose0]                      ;; 06:6C5E $F0 $D7
    ld   hl, wEntitiesPrivateState2Table          ;; 06:6C60 $21 $C0 $C2
    add  hl, bc                                   ;; 06:6C63 $09
    ld   [hl], a                                  ;; 06:6C64 $77
    ; wEntitiesPrivateState1Table[c] = [hMultiPurpose1]
    ldh  a, [hMultiPurpose1]                      ;; 06:6C65 $F0 $D8
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6C67 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6C6A $09
    ld   [hl], a                                  ;; 06:6C6B $77
.moveCloserToLinkEnd
    ret                                           ;; 06:6C6C $C9
