; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SandCrabSpriteVariants::
    db $58, $02
    db $58, $22
    db $5A, $02
    db $5A, $22

Data_015_7328::
    db   $10, $F0, $00, $00

Data_015_732C::
    db   $00, $00, $FB, $05

SandCrabEntityHandler::
    ld   de, SandCrabSpriteVariants               ;; 15:7330 $11 $20 $73
    call RenderActiveEntitySpritesPair            ;; 15:7333 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:7336 $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ;; 15:7339 $CD $3E $7B
    call UpdateEntityPosWithSpeed_15              ;; 15:733C $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:733F $CD $23 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 15:7342 $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 15:7345 $F0 $E7
    rra                                           ;; 15:7347 $1F
    rra                                           ;; 15:7348 $1F
    rra                                           ;; 15:7349 $1F
    and  $01                                      ;; 15:734A $E6 $01
    call SetEntitySpriteVariant                   ;; 15:734C $CD $0C $3B
    ld   hl, wEntitiesCollisionsTable             ;; 15:734F $21 $A0 $C2
    add  hl, bc                                   ;; 15:7352 $09
    ld   a, [hl]                                  ;; 15:7353 $7E
    and  a                                        ;; 15:7354 $A7
    jr   nz, .jr_735C                             ;; 15:7355 $20 $05

    call GetEntityTransitionCountdown             ;; 15:7357 $CD $05 $0C
    jr   nz, ret_015_7382                         ;; 15:735A $20 $26

.jr_735C
    call GetEntityTransitionCountdown             ;; 15:735C $CD $05 $0C
    call GetRandomByte                            ;; 15:735F $CD $0D $28
    and  $7F                                      ;; 15:7362 $E6 $7F
    add  $30                                      ;; 15:7364 $C6 $30
    ld   [hl], a                                  ;; 15:7366 $77
    call GetRandomByte                            ;; 15:7367 $CD $0D $28
    and  $03                                      ;; 15:736A $E6 $03
    ld   e, a                                     ;; 15:736C $5F
    ld   d, b                                     ;; 15:736D $50
    ld   hl, Data_015_7328                        ;; 15:736E $21 $28 $73
    add  hl, de                                   ;; 15:7371 $19
    ld   a, [hl]                                  ;; 15:7372 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:7373 $21 $40 $C2
    add  hl, bc                                   ;; 15:7376 $09
    ld   [hl], a                                  ;; 15:7377 $77
    ld   hl, Data_015_732C                        ;; 15:7378 $21 $2C $73
    add  hl, de                                   ;; 15:737B $19
    ld   a, [hl]                                  ;; 15:737C $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:737D $21 $50 $C2
    add  hl, bc                                   ;; 15:7380 $09
    ld   [hl], a                                  ;; 15:7381 $77

ret_015_7382:
    ret                                           ;; 15:7382 $C9
