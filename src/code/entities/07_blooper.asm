; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BlooperSpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

BlooperEntityHandler::
    ld   de, BlooperSpriteVariants                ;; 07:5BF9 $11 $F1 $5B
    call RenderActiveEntitySpritesPair            ;; 07:5BFC $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:5BFF $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:5C02 $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:5C05 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:5C08 $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:5C0B $CD $23 $3B
    ld   hl, wEntitiesGroundStatusTable           ;; 07:5C0E $21 $70 $C4
    add  hl, bc                                   ;; 07:5C11 $09
    ld   a, [hl]                                  ;; 07:5C12 $7E
    and  a                                        ;; 07:5C13 $A7
    jr   nz, .underwater                          ;; 07:5C14 $20 $14
    
    ; If moving would put the Blooper out of the water, undo the movement
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 07:5C16 $21 $80 $C4
    add  hl, bc                                   ;; 07:5C19 $09
    ld   [hl], $10                                ;; 07:5C1A $36 $10
    ldh  a, [hActiveEntityPosX]                   ;; 07:5C1C $F0 $EE
    ld   hl, wEntitiesPosXTable                   ;; 07:5C1E $21 $00 $C2
    add  hl, bc                                   ;; 07:5C21 $09
    ld   [hl], a                                  ;; 07:5C22 $77
    ldh  a, [hActiveEntityPosY]                   ;; 07:5C23 $F0 $EF
    ld   hl, wEntitiesPosYTable                   ;; 07:5C25 $21 $10 $C2
    add  hl, bc                                   ;; 07:5C28 $09
    ld   [hl], a                                  ;; 07:5C29 $77

.underwater
    xor  a                                        ;; 07:5C2A $AF
    call SetEntitySpriteVariant                   ;; 07:5C2B $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ;; 07:5C2E $F0 $F0
    JP_TABLE                                      ;; 07:5C30
._00 dw BlooperState0Handler                      ;; 07:5C31
._01 dw BlooperState1Handler                      ;; 07:5C33

BlooperState0Handler::
    call GetEntityTransitionCountdown             ;; 07:5C35 $CD $05 $0C
    jr   nz, .skipSwimUp                          ;; 07:5C38 $20 $1E

    call GetEntityYDistanceToLink_07              ;; 07:5C3A $CD $6D $7E
    ld   a, e                                     ;; 07:5C3D $7B
    cp   $03                                      ;; 07:5C3E $FE $03
    jr   z, .skipSwimUp                           ;; 07:5C40 $28 $16

    call ClearEntitySpeed                         ;; 07:5C42 $CD $7F $3D
    call GetEntityTransitionCountdown             ;; 07:5C45 $CD $05 $0C
    ld   [hl], $25                                ;; 07:5C48 $36 $25
    call GetEntityXDistanceToLink_07              ;; 07:5C4A $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:5C4D $21 $80 $C3
    add  hl, bc                                   ;; 07:5C50 $09
    ld   [hl], e                                  ;; 07:5C51 $73
    call IncrementEntityState                     ;; 07:5C52 $CD $12 $3B
    ld   [hl], $01                                ;; 07:5C55 $36 $01
    ret                                           ;; 07:5C57 $C9

.skipSwimUp
    ; If y speed < 4, increase, if > 4, decrease, else, do nothing
    call GetEntitySpeedYAddress                   ;; 07:5C58 $CD $05 $40
    ld   a, [hl]                                  ;; 07:5C5B $7E
    sub  $04                                      ;; 07:5C5C $D6 $04
    jr   z, .skipUpdateSpeedY                     ;; 07:5C5E $28 $07

    and  $80                                      ;; 07:5C60 $E6 $80
    jr   z, .decSpeedY                            ;; 07:5C62 $28 $02

    inc  [hl]                                     ;; 07:5C64 $34
    inc  [hl]                                     ;; 07:5C65 $34

.decSpeedY
    dec  [hl]                                     ;; 07:5C66 $35

.skipUpdateSpeedY
    ; If x speed < 0, increase, if > 0, decrease, else, do nothing
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5C67 $21 $40 $C2
    add  hl, bc                                   ;; 07:5C6A $09
    ld   a, [hl]                                  ;; 07:5C6B $7E
    and  a                                        ;; 07:5C6C $A7
    jr   z, .skipUpdateSpeedX                     ;; 07:5C6D $28 $07

    and  $80                                      ;; 07:5C6F $E6 $80
    jr   z, .decSpeedX                            ;; 07:5C71 $28 $02

    inc  [hl]                                     ;; 07:5C73 $34
    inc  [hl]                                     ;; 07:5C74 $34

.decSpeedX
    dec  [hl]                                     ;; 07:5C75 $35

.skipUpdateSpeedX
    ret                                           ;; 07:5C76 $C9

BlooperSpeedXPerDirection::
    db   $01, $FF

BlooperState1Handler::
    call GetEntityTransitionCountdown             ;; 07:5C79 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:5C7C $20 $07

    ld   [hl], $40                                ;; 07:5C7E $36 $40
    call IncrementEntityState                     ;; 07:5C80 $CD $12 $3B
    ld   [hl], b                                  ;; 07:5C83 $70
    ret                                           ;; 07:5C84 $C9

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 07:5C85 $F0 $E7
    and  $01                                      ;; 07:5C87 $E6 $01
    jr   nz, .oddFrame                            ;; 07:5C89 $20 $15

    call GetEntitySpeedYAddress                   ;; 07:5C8B $CD $05 $40
    dec  [hl]                                     ;; 07:5C8E $35
    ld   hl, wEntitiesDirectionTable              ;; 07:5C8F $21 $80 $C3
    add  hl, bc                                   ;; 07:5C92 $09
    ld   e, [hl]                                  ;; 07:5C93 $5E
    ld   d, b                                     ;; 07:5C94 $50
    ld   hl, BlooperSpeedXPerDirection            ;; 07:5C95 $21 $77 $5C
    add  hl, de                                   ;; 07:5C98 $19
    ld   a, [hl]                                  ;; 07:5C99 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5C9A $21 $40 $C2
    add  hl, bc                                   ;; 07:5C9D $09
    add  [hl]                                     ;; 07:5C9E $86
    ld   [hl], a                                  ;; 07:5C9F $77

.oddFrame
    ld   a, $01                                   ;; 07:5CA0 $3E $01
    jp   SetEntitySpriteVariant                   ;; 07:5CA2 $C3 $0C $3B
