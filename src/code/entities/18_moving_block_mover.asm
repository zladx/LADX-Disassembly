MovingBlockMoverEntityHandler::
    call func_018_548A                            ; $18:53CE: $CD $8A $54
    call ReturnIfNonInteractive_18                ; $18:53D1: $CD $E8 $7D
    ld   hl, hLinkPositionX                       ; $18:53D4: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $18:53D7: $F0 $EE
    sub  [hl]                                     ; $18:53D9: $96
    add  $04                                      ; $18:53DA: $C6 $04
    cp   $08                                      ; $18:53DC: $FE $08
    jr   nc, .jr_53ED                             ; $18:53DE: $30 $0D

    ld   hl, hLinkPositionY                       ; $18:53E0: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $18:53E3: $F0 $EC
    add  $04                                      ; $18:53E5: $C6 $04
    sub  [hl]                                     ; $18:53E7: $96
    jr   c, .jr_53ED                              ; $18:53E8: $38 $03

    call PushLinkOutOfEntity_18.forcePush         ; $18:53EA: $CD $3B $7D

.jr_53ED
    ld   hl, hLinkPositionX                       ; $18:53ED: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $18:53F0: $F0 $EE
    sub  [hl]                                     ; $18:53F2: $96
    add  $06                                      ; $18:53F3: $C6 $06
    cp   $0C                                      ; $18:53F5: $FE $0C
    jr   nc, jr_018_5466                          ; $18:53F7: $30 $6D

    ld   hl, hLinkPositionY                       ; $18:53F9: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $18:53FC: $F0 $EC
    sub  [hl]                                     ; $18:53FE: $96
    add  $08                                      ; $18:53FF: $C6 $08
    cp   $04                                      ; $18:5401: $FE $04
    jr   nc, jr_018_5466                          ; $18:5403: $30 $61

    ld   e, J_B                                   ; $18:5405: $1E $20
    ld   a, [wInventoryItems.BButtonSlot]         ; $18:5407: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $18:540A: $FE $03
    jr   z, .jr_5417                              ; $18:540C: $28 $09

    ld   e, J_A                                   ; $18:540E: $1E $10
    ld   a, [wInventoryItems.AButtonSlot]         ; $18:5410: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $18:5413: $FE $03
    jr   nz, jr_018_5466                          ; $18:5415: $20 $4F

.jr_5417
IF __PATCH_0__
    ld   a, [wC3CF]
    and  a
    jr   nz, jr_018_5466
ENDC

    ldh  a, [hPressedButtonsMask]                 ; $18:5417: $F0 $CB
    and  e                                        ; $18:5419: $A3
    jr   z, jr_018_5466                           ; $18:541A: $28 $4A

    ld   a, $02                                   ; $18:541C: $3E $02
    ldh  [hMovingBlockMoverState], a              ; $18:541E: $E0 $BA
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_3A       ; $18:5420: $3E $3A
    ldh  [hLinkAnimationState], a                 ; $18:5422: $E0 $9D
    ld   a, $02                                   ; $18:5424: $3E $02
    ldh  [hLinkDirection], a                      ; $18:5426: $E0 $9E
    ld   a, $01                                   ; $18:5428: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $18:542A: $E0 $A1
    call ResetSpinAttack                          ; $18:542C: $CD $AF $0C
    ldh  a, [hActiveEntityPosX]                   ; $18:542F: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $18:5431: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $18:5433: $F0 $EC
    add  $08                                      ; $18:5435: $C6 $08
    ldh  [hLinkPositionY], a                      ; $18:5437: $E0 $99
    cp   $50                                      ; $18:5439: $FE $50
    jr   nc, jr_018_545F                          ; $18:543B: $30 $22

    ldh  a, [hPressedButtonsMask]                 ; $18:543D: $F0 $CB
    and  $08                                      ; $18:543F: $E6 $08
    jr   z, jr_018_545F                           ; $18:5441: $28 $1C

    ld   hl, wEntitiesInertiaTable                ; $18:5443: $21 $D0 $C3
    add  hl, bc                                   ; $18:5446: $09
    ld   a, [hl]                                  ; $18:5447: $7E
    inc  [hl]                                     ; $18:5448: $34
    and  $18                                      ; $18:5449: $E6 $18
    jr   z, .ret_545E                             ; $18:544B: $28 $11

    ld   hl, hLinkAnimationState                  ; $18:544D: $21 $9D $FF
    inc  [hl]                                     ; $18:5450: $34
    ld   hl, wEntitiesSpeedYTable                 ; $18:5451: $21 $50 $C2
    add  hl, bc                                   ; $18:5454: $09
    ld   [hl], $04                                ; $18:5455: $36 $04
    call UpdateEntityYPosWithSpeed_18             ; $18:5457: $CD $62 $7E
    ld   a, $01                                   ; $18:545A: $3E $01
    ldh  [hMovingBlockMoverState], a              ; $18:545C: $E0 $BA

.ret_545E
    ret                                           ; $18:545E: $C9

jr_018_545F:
    ld   hl, wEntitiesInertiaTable                ; $18:545F: $21 $D0 $C3
    add  hl, bc                                   ; $18:5462: $09
    ld   [hl], $08                                ; $18:5463: $36 $08
    ret                                           ; $18:5465: $C9

jr_018_5466:
    ldh  a, [hActiveEntityVisualPosY]             ; $18:5466: $F0 $EC
    cp   $1B                                      ; $18:5468: $FE $1B
    jr   c, .jr_5479                              ; $18:546A: $38 $0D

    ld   hl, wEntitiesSpeedYTable                 ; $18:546C: $21 $50 $C2
    add  hl, bc                                   ; $18:546F: $09
    ld   [hl], $FD                                ; $18:5470: $36 $FD
    call UpdateEntityYPosWithSpeed_18             ; $18:5472: $CD $62 $7E

IF !__PATCH_0__
    ld   a, $00                                   ; $18:5475: $3E $00
    ldh  [hMovingBlockMoverState], a              ; $18:5477: $E0 $BA
ENDC

.jr_5479
IF __PATCH_0__
    ldh  a, [hActiveEntityVisualPosY]
    cp   $1a
    ret  c
    xor  a
    ldh  [hMovingBlockMoverState], a
ENDC
    ret                                           ; $18:5479: $C9

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
    ldh  a, [hMapId]                              ; $18:548A: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $18:548C: $FE $01
    jr   nz, .jr_5492                             ; $18:548E: $20 $02

    ldh  [hActiveEntitySpriteVariant], a          ; $18:5490: $E0 $F1

.jr_5492
    ld   de, MovingBlockMover1SpriteVariants      ; $18:5492: $11 $7A $54
    call RenderActiveEntitySpritesPair            ; $18:5495: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState2Table          ; $18:5498: $21 $C0 $C2
    add  hl, bc                                   ; $18:549B: $09
    ld   a, [hl]                                  ; $18:549C: $7E
    add  $FC                                      ; $18:549D: $C6 $FC
    cp   $F0                                      ; $18:549F: $FE $F0
    ret  nc                                       ; $18:54A1: $D0

    ldh  [hActiveEntityVisualPosY], a             ; $18:54A2: $E0 $EC

.loop_54A4
    ld   de, MovingBlockMover2SpriteVariants      ; $18:54A4: $11 $82 $54
    call RenderActiveEntitySpritesPair            ; $18:54A7: $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ; $18:54AA: $F0 $EC
    add  $10                                      ; $18:54AC: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $18:54AE: $E0 $EC
    ld   hl, hActiveEntityPosY                    ; $18:54B0: $21 $EF $FF
    cp   [hl]                                     ; $18:54B3: $BE
    jr   c, .loop_54A4                            ; $18:54B4: $38 $EE

    jp   CopyEntityPositionToActivePosition       ; $18:54B6: $C3 $8A $3D

Data_018_54B9::
    db   $24, $00, $3E, $00

label_018_54BD:
    ld   de, Data_018_54B9                        ; $18:54BD: $11 $B9 $54
    call RenderActiveEntitySprite                 ; $18:54C0: $CD $77 $3C
    call ReturnIfNonInteractive_18                ; $18:54C3: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $18:54C6: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $18:54C9: $CA $08 $7F

    ld   e, $01                                   ; $18:54CC: $1E $01
    cp   $40                                      ; $18:54CE: $FE $40
    jr   c, jr_018_54DF                           ; $18:54D0: $38 $0D

    jr   nz, .jr_54DE                             ; $18:54D2: $20 $0A

    ld   hl, wEntitiesPosYTable                   ; $18:54D4: $21 $10 $C2
    add  hl, bc                                   ; $18:54D7: $09
    ld   a, [hl]                                  ; $18:54D8: $7E
    add  $04                                      ; $18:54D9: $C6 $04
    ld   [hl], a                                  ; $18:54DB: $77
    jr   jr_018_54DF                              ; $18:54DC: $18 $01

.jr_54DE
    dec  e                                        ; $18:54DE: $1D

jr_018_54DF:
    ld   a, e                                     ; $18:54DF: $7B
    call SetEntitySpriteVariant                   ; $18:54E0: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $18:54E3: $CD $05 $0C
    ld   e, $FE                                   ; $18:54E6: $1E $FE
    and  $20                                      ; $18:54E8: $E6 $20
    jr   z, .jr_54EE                              ; $18:54EA: $28 $02

    ld   e, $FC                                   ; $18:54EC: $1E $FC

.jr_54EE
    ld   hl, wEntitiesSpeedYTable                 ; $18:54EE: $21 $50 $C2
    add  hl, bc                                   ; $18:54F1: $09
    ld   [hl], e                                  ; $18:54F2: $73
    ld   hl, wEntitiesSpeedXTable                 ; $18:54F3: $21 $40 $C2
    add  hl, bc                                   ; $18:54F6: $09
    ld   [hl], $FF                                ; $18:54F7: $36 $FF
    ldh  a, [hFrameCounter]                       ; $18:54F9: $F0 $E7
    and  $03                                      ; $18:54FB: $E6 $03
    ret  nz                                       ; $18:54FD: $C0

    jp   UpdateEntityPosWithSpeed_18              ; $18:54FE: $C3 $5F $7E
