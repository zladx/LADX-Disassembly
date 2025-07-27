; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LeeverSpriteVariants::
.variant0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

LeeverEntityHandler::
    ld   de, LeeverSpriteVariants                 ;; 04:7EF5 $11 $E5 $7E
    call RenderActiveEntitySpritesPair            ;; 04:7EF8 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:7EFB $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ;; 04:7EFE $CD $80 $6D
    call UpdateEntityPosWithSpeed_04              ;; 04:7F01 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:7F04 $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 04:7F07 $F0 $F0
    and  $03                                      ;; 04:7F09 $E6 $03
    JP_TABLE                                      ;; 04:7F0B
._00 dw LeeverHidingHandler                       ;; 04:7F0C
._01 dw LeeverEmergingHandler                     ;; 04:7F0E
._02 dw LeeverChasingHandler                      ;; 04:7F10
._03 dw LeeverBurrowingHandler                    ;; 04:7F12

LeeverHidingHandler::
    ld   a, $FF                                   ;; 04:7F14 $3E $FF
    call SetEntitySpriteVariant                   ;; 04:7F16 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 04:7F19 $CD $05 $0C
    ret  nz                                       ;; 04:7F1C $C0

    ld   [hl], $1F                                ;; 04:7F1D $36 $1F
    call IncrementEntityState                     ;; 04:7F1F $CD $12 $3B
    jp   ClearEntitySpeed                         ;; 04:7F22 $C3 $7F $3D

LeeverEmergingSpriteVariantIndexes::
    db   $01, $00

LeeverEmergingHandler::
    call GetEntityTransitionCountdown             ;; 04:7F27 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:7F2A $20 $0B

    call GetRandomByte                            ;; 04:7F2C $CD $0D $28
    and  $3F                                      ;; 04:7F2F $E6 $3F
    add  $70                                      ;; 04:7F31 $C6 $70
    ld   [hl], a                                  ;; 04:7F33 $77
    jp   IncrementEntityState                     ;; 04:7F34 $C3 $12 $3B

.skipIncrementState
    ld   hl, LeeverEmergingSpriteVariantIndexes   ;; 04:7F37 $21 $25 $7F

.setSpriteVariant
    srl  a                                        ;; 04:7F3A $CB $3F
    srl  a                                        ;; 04:7F3C $CB $3F
    srl  a                                        ;; 04:7F3E $CB $3F
    srl  a                                        ;; 04:7F40 $CB $3F
    ld   e, a                                     ;; 04:7F42 $5F
    ld   d, b                                     ;; 04:7F43 $50
    add  hl, de                                   ;; 04:7F44 $19
    ld   a, [hl]                                  ;; 04:7F45 $7E
    jp   SetEntitySpriteVariant                   ;; 04:7F46 $C3 $0C $3B

LeeverChasingHandler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:7F49 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 04:7F4C $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:7F4F $20 $08

    ld   [hl], $1F                                ;; 04:7F51 $36 $1F
    call IncrementEntityState                     ;; 04:7F53 $CD $12 $3B
    jp   ClearEntitySpeed                         ;; 04:7F56 $C3 $7F $3D

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 04:7F59 $F0 $E7
    xor  c                                        ;; 04:7F5B $A9
    push af                                       ;; 04:7F5C $F5
    and  $0F                                      ;; 04:7F5D $E6 $0F
    jr   nz, .skipUpdateSpeed                     ;; 04:7F5F $20 $05

    ld   a, $08                                   ;; 04:7F61 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 04:7F63 $CD $AA $3B

.skipUpdateSpeed
    pop  af                                       ;; 04:7F66 $F1
    srl  a                                        ;; 04:7F67 $CB $3F
    srl  a                                        ;; 04:7F69 $CB $3F
    and  $01                                      ;; 04:7F6B $E6 $01
    call SetEntitySpriteVariant                   ;; 04:7F6D $CD $0C $3B
    inc  [hl]                                     ;; 04:7F70 $34
    inc  [hl]                                     ;; 04:7F71 $34
    ret                                           ;; 04:7F72 $C9

LeeverBurrowingSpriteVariantIndexes::
    db   $00, $01

LeeverBurrowingHandler::
    call GetEntityTransitionCountdown             ;; 04:7F75 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:7F78 $20 $10

    call GetRandomByte                            ;; 04:7F7A $CD $0D $28
    and  $1F                                      ;; 04:7F7D $E6 $1F
    add  $30                                      ;; 04:7F7F $C6 $30
    ld   [hl], a                                  ;; 04:7F81 $77
    call IncrementEntityState                     ;; 04:7F82 $CD $12 $3B
    ld   a, $08                                   ;; 04:7F85 $3E $08
    jp   ApplyVectorTowardsLink_trampoline        ;; 04:7F87 $C3 $AA $3B

.skipIncrementState
    ld   hl, LeeverBurrowingSpriteVariantIndexes  ;; 04:7F8A $21 $73 $7F
    jp   LeeverEmergingHandler.setSpriteVariant   ;; 04:7F8D $C3 $3A $7F
