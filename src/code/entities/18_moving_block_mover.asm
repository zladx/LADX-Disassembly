MovingBlockMoverEntityHandler::
    call func_018_548A                            ; $53CE: $CD $8A $54
    call ReturnIfNonInteractive_18                ; $53D1: $CD $E8 $7D
    ld   hl, hLinkPositionX                       ; $53D4: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $53D7: $F0 $EE
    sub  [hl]                                     ; $53D9: $96
    add  $04                                      ; $53DA: $C6 $04
    cp   $08                                      ; $53DC: $FE $08
    jr   nc, .jr_53ED                             ; $53DE: $30 $0D

    ld   hl, hLinkPositionY                       ; $53E0: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $53E3: $F0 $EC
    add  $04                                      ; $53E5: $C6 $04
    sub  [hl]                                     ; $53E7: $96
    jr   c, .jr_53ED                              ; $53E8: $38 $03

    call PushLinkOutOfEntity_18.forcePush         ; $53EA: $CD $3B $7D

.jr_53ED
    ld   hl, hLinkPositionX                       ; $53ED: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $53F0: $F0 $EE
    sub  [hl]                                     ; $53F2: $96
    add  $06                                      ; $53F3: $C6 $06
    cp   $0C                                      ; $53F5: $FE $0C
    jr   nc, jr_018_5466                          ; $53F7: $30 $6D

    ld   hl, hLinkPositionY                       ; $53F9: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $53FC: $F0 $EC
    sub  [hl]                                     ; $53FE: $96
    add  $08                                      ; $53FF: $C6 $08
    cp   $04                                      ; $5401: $FE $04
    jr   nc, jr_018_5466                          ; $5403: $30 $61

    ld   e, J_B                                   ; $5405: $1E $20
    ld   a, [wInventoryItems.BButtonSlot]         ; $5407: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $540A: $FE $03
    jr   z, .jr_5417                              ; $540C: $28 $09

    ld   e, J_A                                   ; $540E: $1E $10
    ld   a, [wInventoryItems.AButtonSlot]         ; $5410: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $5413: $FE $03
    jr   nz, jr_018_5466                          ; $5415: $20 $4F

.jr_5417
IF __PATCH_0__
    ld   a, [wC3CF]
    and  a
    jr   nz, jr_018_5466
ENDC

    ldh  a, [hPressedButtonsMask]                 ; $5417: $F0 $CB
    and  e                                        ; $5419: $A3
    jr   z, jr_018_5466                           ; $541A: $28 $4A

    ld   a, $02                                   ; $541C: $3E $02
    ldh  [hMovingBlockMoverState], a              ; $541E: $E0 $BA
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_3A       ; $5420: $3E $3A
    ldh  [hLinkAnimationState], a                 ; $5422: $E0 $9D
    ld   a, $02                                   ; $5424: $3E $02
    ldh  [hLinkDirection], a                      ; $5426: $E0 $9E
    ld   a, $01                                   ; $5428: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $542A: $E0 $A1
    call ResetSpinAttack                          ; $542C: $CD $AF $0C
    ldh  a, [hActiveEntityPosX]                   ; $542F: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $5431: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $5433: $F0 $EC
    add  $08                                      ; $5435: $C6 $08
    ldh  [hLinkPositionY], a                      ; $5437: $E0 $99
    cp   $50                                      ; $5439: $FE $50
    jr   nc, jr_018_545F                          ; $543B: $30 $22

    ldh  a, [hPressedButtonsMask]                 ; $543D: $F0 $CB
    and  $08                                      ; $543F: $E6 $08
    jr   z, jr_018_545F                           ; $5441: $28 $1C

    ld   hl, wEntitiesInertiaTable                ; $5443: $21 $D0 $C3
    add  hl, bc                                   ; $5446: $09
    ld   a, [hl]                                  ; $5447: $7E
    inc  [hl]                                     ; $5448: $34
    and  $18                                      ; $5449: $E6 $18
    jr   z, .ret_545E                             ; $544B: $28 $11

    ld   hl, hLinkAnimationState                  ; $544D: $21 $9D $FF
    inc  [hl]                                     ; $5450: $34
    ld   hl, wEntitiesSpeedYTable                 ; $5451: $21 $50 $C2
    add  hl, bc                                   ; $5454: $09
    ld   [hl], $04                                ; $5455: $36 $04
    call UpdateEntityYPosWithSpeed_18             ; $5457: $CD $62 $7E
    ld   a, $01                                   ; $545A: $3E $01
    ldh  [hMovingBlockMoverState], a              ; $545C: $E0 $BA

.ret_545E
    ret                                           ; $545E: $C9

jr_018_545F:
    ld   hl, wEntitiesInertiaTable                ; $545F: $21 $D0 $C3
    add  hl, bc                                   ; $5462: $09
    ld   [hl], $08                                ; $5463: $36 $08
    ret                                           ; $5465: $C9

jr_018_5466:
    ldh  a, [hActiveEntityVisualPosY]             ; $5466: $F0 $EC
    cp   $1B                                      ; $5468: $FE $1B
    jr   c, .jr_5479                              ; $546A: $38 $0D

    ld   hl, wEntitiesSpeedYTable                 ; $546C: $21 $50 $C2
    add  hl, bc                                   ; $546F: $09
    ld   [hl], $FD                                ; $5470: $36 $FD
    call UpdateEntityYPosWithSpeed_18             ; $5472: $CD $62 $7E

IF !__PATCH_0__
    ld   a, $00                                   ; $5475: $3E $00
    ldh  [hMovingBlockMoverState], a              ; $5477: $E0 $BA
ENDC

.jr_5479
IF __PATCH_0__
    ldh  a, [hActiveEntityVisualPosY]
    cp   $1a
    ret  c
    xor  a
    ldh  [hMovingBlockMoverState], a
ENDC
    ret                                           ; $5479: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MovingBlockMover1SpriteVariants::
.variant0
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MovingBlockMover2SpriteVariants::
.variant0
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

func_018_548A::
    ldh  a, [hMapId]                              ; $548A: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $548C: $FE $01
    jr   nz, .jr_5492                             ; $548E: $20 $02

    ldh  [hActiveEntitySpriteVariant], a          ; $5490: $E0 $F1

.jr_5492
    ld   de, MovingBlockMover1SpriteVariants      ; $5492: $11 $7A $54
    call RenderActiveEntitySpritesPair            ; $5495: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState2Table          ; $5498: $21 $C0 $C2
    add  hl, bc                                   ; $549B: $09
    ld   a, [hl]                                  ; $549C: $7E
    add  $FC                                      ; $549D: $C6 $FC
    cp   $F0                                      ; $549F: $FE $F0
    ret  nc                                       ; $54A1: $D0

    ldh  [hActiveEntityVisualPosY], a             ; $54A2: $E0 $EC

.loop_54A4
    ld   de, MovingBlockMover2SpriteVariants      ; $54A4: $11 $82 $54
    call RenderActiveEntitySpritesPair            ; $54A7: $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ; $54AA: $F0 $EC
    add  $10                                      ; $54AC: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $54AE: $E0 $EC
    ld   hl, hActiveEntityPosY                    ; $54B0: $21 $EF $FF
    cp   [hl]                                     ; $54B3: $BE
    jr   c, .loop_54A4                            ; $54B4: $38 $EE

    jp   CopyEntityPositionToActivePosition       ; $54B6: $C3 $8A $3D

Data_018_54B9::
    db   $24, $00, $3E, $00

label_018_54BD:
    ld   de, Data_018_54B9                        ; $54BD: $11 $B9 $54
    call RenderActiveEntitySprite                 ; $54C0: $CD $77 $3C
    call ReturnIfNonInteractive_18                ; $54C3: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $54C6: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $54C9: $CA $08 $7F

    ld   e, $01                                   ; $54CC: $1E $01
    cp   $40                                      ; $54CE: $FE $40
    jr   c, jr_018_54DF                           ; $54D0: $38 $0D

    jr   nz, .jr_54DE                             ; $54D2: $20 $0A

    ld   hl, wEntitiesPosYTable                   ; $54D4: $21 $10 $C2
    add  hl, bc                                   ; $54D7: $09
    ld   a, [hl]                                  ; $54D8: $7E
    add  $04                                      ; $54D9: $C6 $04
    ld   [hl], a                                  ; $54DB: $77
    jr   jr_018_54DF                              ; $54DC: $18 $01

.jr_54DE
    dec  e                                        ; $54DE: $1D

jr_018_54DF:
    ld   a, e                                     ; $54DF: $7B
    call SetEntitySpriteVariant                   ; $54E0: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $54E3: $CD $05 $0C
    ld   e, $FE                                   ; $54E6: $1E $FE
    and  $20                                      ; $54E8: $E6 $20
    jr   z, .jr_54EE                              ; $54EA: $28 $02

    ld   e, $FC                                   ; $54EC: $1E $FC

.jr_54EE
    ld   hl, wEntitiesSpeedYTable                 ; $54EE: $21 $50 $C2
    add  hl, bc                                   ; $54F1: $09
    ld   [hl], e                                  ; $54F2: $73
    ld   hl, wEntitiesSpeedXTable                 ; $54F3: $21 $40 $C2
    add  hl, bc                                   ; $54F6: $09
    ld   [hl], $FF                                ; $54F7: $36 $FF
    ldh  a, [hFrameCounter]                       ; $54F9: $F0 $E7
    and  $03                                      ; $54FB: $E6 $03
    ret  nz                                       ; $54FD: $C0

    jp   UpdateEntityPosWithSpeed_18              ; $54FE: $C3 $5F $7E
