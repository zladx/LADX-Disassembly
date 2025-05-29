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
    ld   hl, wEntitiesDirectionTable              ;; 07:684E $21 $80 $C3
    add  hl, bc                                   ;; 07:6851 $09
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:6852 $F0 $F1
    add  [hl]                                     ;; 07:6854 $86
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:6855 $E0 $F1
    ld   de, SnakeSpriteVariants                  ;; 07:6857 $11 $3E $68
    call RenderActiveEntitySpritesPair            ;; 07:685A $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:685D $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:6860 $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:6863 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:6866 $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:6869 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 07:686C $21 $A0 $C2
    add  hl, bc                                   ;; 07:686F $09
    ld   a, [hl]                                  ;; 07:6870 $7E
    and  a                                        ;; 07:6871 $A7
    jr   z, .noCollision                          ;; 07:6872 $28 $0E

    call IncrementEntityState                     ;; 07:6874 $CD $12 $3B
    ld   [hl], b                                  ;; 07:6877 $70
    call GetEntityTransitionCountdown             ;; 07:6878 $CD $05 $0C
    ld   [hl], $08                                ;; 07:687B $36 $08
    call GetEntityPrivateCountdown1               ;; 07:687D $CD $00 $0C
    ld   [hl], $20                                ;; 07:6880 $36 $20

.noCollision
    ldh  a, [hActiveEntityState]                  ;; 07:6882 $F0 $F0
    JP_TABLE                                      ;; 07:6884
._00 dw SnakeState0Handler                        ;; 07:6885
._01 dw SnakeState1Handler                        ;; 07:6887
._02 dw SnakeState2Handler                        ;; 07:6889

SnakeXSpeeds::
    db   $08, $F8, $00, $00

SnakeYSpeeds::
    db   $00, $00, $F8, $08

SnakeDirections::
    db   $02, $00, $FF, $FF

; Idle
SnakeState0Handler::
    call GetEntityTransitionCountdown             ;; 07:6897 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:689A $20 $34

    call IncrementEntityState                     ;; 07:689C $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:689F $CD $05 $0C
    call GetRandomByte                            ;; 07:68A2 $CD $0D $28
    and  $1F                                      ;; 07:68A5 $E6 $1F
    add  $30                                      ;; 07:68A7 $C6 $30
    ld   [hl], a                                  ;; 07:68A9 $77
    and  $03                                      ;; 07:68AA $E6 $03
    ld   e, a                                     ;; 07:68AC $5F

.updateSpeed
    ld   d, b                                     ;; 07:68AD $50
    ld   hl, SnakeXSpeeds                         ;; 07:68AE $21 $8B $68
    add  hl, de                                   ;; 07:68B1 $19
    ld   a, [hl]                                  ;; 07:68B2 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:68B3 $21 $40 $C2
    add  hl, bc                                   ;; 07:68B6 $09
    ld   [hl], a                                  ;; 07:68B7 $77
    ld   hl, SnakeYSpeeds                         ;; 07:68B8 $21 $8F $68
    add  hl, de                                   ;; 07:68BB $19
    ld   a, [hl]                                  ;; 07:68BC $7E
    call GetEntitySpeedYAddress                   ;; 07:68BD $CD $05 $40
    ld   [hl], a                                  ;; 07:68C0 $77
    ld   hl, SnakeDirections                      ;; 07:68C1 $21 $93 $68
    add  hl, de                                   ;; 07:68C4 $19
    ld   a, [hl]                                  ;; 07:68C5 $7E
    cp   $FF                                      ;; 07:68C6 $FE $FF
    jr   z, .return                               ;; 07:68C8 $28 $05

    ld   hl, wEntitiesDirectionTable              ;; 07:68CA $21 $80 $C3
    add  hl, bc                                   ;; 07:68CD $09
    ld   [hl], a                                  ;; 07:68CE $77

.return
    ret                                           ;; 07:68CF $C9

.skipIncrementState
    call ClearEntitySpeed                         ;; 07:68D0 $CD $7F $3D
    call SnakeStartDashIfNeeded                   ;; 07:68D3 $CD $F0 $68
    jr   AnimateSnake                             ;; 07:68D6 $18 $0E

; Crawling
SnakeState1Handler::
    call GetEntityTransitionCountdown             ;; 07:68D8 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:68DB $20 $06

    ld   [hl], $18                                ;; 07:68DD $36 $18
    call IncrementEntityState                     ;; 07:68DF $CD $12 $3B
    ld   [hl], b                                  ;; 07:68E2 $70

.skipIncrementState
    call SnakeStartDashIfNeeded                   ;; 07:68E3 $CD $F0 $68

AnimateSnake::
    ldh  a, [hFrameCounter]                       ;; 07:68E6 $F0 $E7
    rra                                           ;; 07:68E8 $1F
    rra                                           ;; 07:68E9 $1F
    rra                                           ;; 07:68EA $1F
    and  $01                                      ;; 07:68EB $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:68ED $C3 $0C $3B

SnakeStartDashIfNeeded::
    call GetEntityPrivateCountdown1               ;; 07:68F0 $CD $00 $0C
    jr   nz, .return                              ;; 07:68F3 $20 $24

    call GetEntityXDistanceToLink_07              ;; 07:68F5 $CD $5D $7E
    add  $08                                      ;; 07:68F8 $C6 $08
    cp   $10                                      ;; 07:68FA $FE $10
    jr   nc, .verticalDashEnd                     ;; 07:68FC $30 $1C

    call GetEntityYDistanceToLink_07              ;; 07:68FE $CD $6D $7E

.updateSpeedAndIncrementState
    call SnakeState0Handler.updateSpeed           ;; 07:6901 $CD $AD $68
    ld   hl, wEntitiesSpeedXTable                 ;; 07:6904 $21 $40 $C2
    add  hl, bc                                   ;; 07:6907 $09
    sla  [hl]                                     ;; 07:6908 $CB $26
    call GetEntitySpeedYAddress                   ;; 07:690A $CD $05 $40
    sla  [hl]                                     ;; 07:690D $CB $26
    call IncrementEntityState                     ;; 07:690F $CD $12 $3B
    ld   [hl], $02                                ;; 07:6912 $36 $02
    call GetEntityTransitionCountdown             ;; 07:6914 $CD $05 $0C
    ld   [hl], $30                                ;; 07:6917 $36 $30

.return
    ret                                           ;; 07:6919 $C9

.verticalDashEnd
    call GetEntityYDistanceToLink_07              ;; 07:691A $CD $6D $7E
    add  $08                                      ;; 07:691D $C6 $08
    cp   $10                                      ;; 07:691F $FE $10
    jr   nc, .return2                             ;; 07:6921 $30 $05

    call GetEntityXDistanceToLink_07              ;; 07:6923 $CD $5D $7E
    jr   .updateSpeedAndIncrementState            ;; 07:6926 $18 $D9

.return2
    ret                                           ;; 07:6928 $C9

; Dashing
SnakeState2Handler::
    call GetEntityTransitionCountdown             ;; 07:6929 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:692C $20 $0B

    ld   [hl], $20                                ;; 07:692E $36 $20
    call IncrementEntityState                     ;; 07:6930 $CD $12 $3B
    ld   [hl], b                                  ;; 07:6933 $70
    call GetEntityPrivateCountdown1               ;; 07:6934 $CD $00 $0C
    ld   [hl], $40                                ;; 07:6937 $36 $40

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 07:6939 $F0 $E7
    rra                                           ;; 07:693B $1F
    rra                                           ;; 07:693C $1F
    and  $01                                      ;; 07:693D $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:693F $C3 $0C $3B
