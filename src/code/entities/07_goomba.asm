;Note that the goomba code contains some full screen fadeout effect as well, unrelated to the goomba.
; Currently needs more investigation.

Data_007_6493::
    ; bg fill commands
    db   $98, $00, $53, $7F
    db   $98, $20, $53, $7F
    db   $98, $40, $53, $7F
    db   $98, $60, $53, $7F
    db   $98, $80, $53, $7F
    db   $98, $A0, $53, $7F
    db   $98, $C0, $53, $7F
    db   $98, $E0, $53, $7F
    db   $99, $00, $53, $7F
    db   $99, $20, $53, $7F
    db   $99, $40, $53, $7F
    db   $99, $60, $53, $7F
    db   $99, $80, $53, $7F
    db   $99, $A0, $53, $7F
    db   $99, $C0, $53, $7F
    db   $99, $E0, $53, $7F
    db   $9A, $00, $53, $7F
    db   $9A, $20, $53, $7F

IF __PATCH_0__
    DEF TILE = $00
ELSE
    DEF TILE = $01
ENDC

Data_007_64F6:
    ; bg fill commands
    db   $98, $00, $53, TILE
    db   $98, $20, $53, TILE
    db   $98, $40, $53, TILE
    db   $98, $60, $53, TILE
    db   $98, $80, $53, TILE
    db   $98, $A0, $53, TILE
    db   $98, $C0, $53, TILE
    db   $98, $E0, $53, TILE
    db   $99, $00, $53, TILE
    db   $99, $20, $53, TILE
    db   $99, $40, $53, TILE
    db   $99, $60, $53, TILE
    db   $99, $80, $53, TILE
    db   $99, $A0, $53, TILE
    db   $99, $C0, $53, TILE
    db   $99, $E0, $53, TILE
    db   $9A, $00, $53, TILE
    db   $9A, $20, $53, TILE


label_007_6523:
    xor  a                                        ;; 07:6523 $AF
    ldh  [hBaseScrollX], a                        ;; 07:6524 $E0 $96
    ldh  [hBaseScrollY], a                        ;; 07:6526 $E0 $97
    ld   [wBGOriginLow], a                        ;; 07:6528 $EA $2F $C1
    ld   [wBGOriginHigh], a                       ;; 07:652B $EA $2E $C1
    ld   hl, wLCDControl                          ;; 07:652E $21 $FD $D6
    res  LCDCB_WINON, [hl]                        ;; 07:6531 $CB $AE
    ld   hl, wEntitiesInertiaTable                ;; 07:6533 $21 $D0 $C3
    add  hl, bc                                   ;; 07:6536 $09
    ld   a, [hl]                                  ;; 07:6537 $7E
    cp   $09                                      ;; 07:6538 $FE $09
if __OPTIMIZATIONS_1__
    jp   z, jr_007_659D                           ;; 07:653A $28 $61
ELSE
    jr   z, jr_007_659D                           ;; 07:653A $28 $61
ENDC

    ld   a, [wDrawCommandsSize]                   ;; 07:653C $FA $00 $D6
    ld   e, a                                     ;; 07:653F $5F
    add  $08                                      ;; 07:6540 $C6 $08
    ld   [wDrawCommandsSize], a                   ;; 07:6542 $EA $00 $D6
    ld   d, b                                     ;; 07:6545 $50
    push bc                                       ;; 07:6546 $C5
    ld   hl, wEntitiesInertiaTable                ;; 07:6547 $21 $D0 $C3
    add  hl, bc                                   ;; 07:654A $09
    ld   c, [hl]                                  ;; 07:654B $4E
    sla  c                                        ;; 07:654C $CB $21
    sla  c                                        ;; 07:654E $CB $21
    sla  c                                        ;; 07:6550 $CB $21
    ld   hl, Data_007_6493                        ;; 07:6552 $21 $93 $64
    add  hl, bc                                   ;; 07:6555 $09
    ld   c, l                                     ;; 07:6556 $4D
    ld   b, h                                     ;; 07:6557 $44
    ld   hl, wDrawCommand                         ;; 07:6558 $21 $01 $D6
    add  hl, de                                   ;; 07:655B $19
    ld   e, $08                                   ;; 07:655C $1E $08

.loop_655E
    ld   a, [bc]                                  ;; 07:655E $0A
    inc  bc                                       ;; 07:655F $03
    ld   [hl+], a                                 ;; 07:6560 $22
    dec  e                                        ;; 07:6561 $1D
    jr   nz, .loop_655E                           ;; 07:6562 $20 $FA

    ld   [hl], $00                                ;; 07:6564 $36 $00
    ldh  a, [hIsGBC]                              ;; 07:6566 $F0 $FE
    and  a                                        ;; 07:6568 $A7
    jr   z, jr_007_6596                           ;; 07:6569 $28 $2B

    pop  bc                                       ;; 07:656B $C1
    ld   a, [wDrawCommandsVRAM1Size]              ;; 07:656C $FA $90 $DC
    ld   e, a                                     ;; 07:656F $5F
    add  $08                                      ;; 07:6570 $C6 $08
    ld   [wDrawCommandsVRAM1Size], a              ;; 07:6572 $EA $90 $DC
    ld   d, b                                     ;; 07:6575 $50
    push bc                                       ;; 07:6576 $C5
    ld   hl, wEntitiesInertiaTable                ;; 07:6577 $21 $D0 $C3
    add  hl, bc                                   ;; 07:657A $09
    ld   c, [hl]                                  ;; 07:657B $4E
    sla  c                                        ;; 07:657C $CB $21
    sla  c                                        ;; 07:657E $CB $21
    sla  c                                        ;; 07:6580 $CB $21
IF __PATCH_0__
    ld   hl, Data_007_64F6
ELSE
    ld   hl, Data_007_6493                        ;; 07:6582 $21 $93 $64
ENDC
    add  hl, bc                                   ;; 07:6585 $09
    ld   c, l                                     ;; 07:6586 $4D
    ld   b, h                                     ;; 07:6587 $44
    ld   hl, wDrawCommandVRAM1                    ;; 07:6588 $21 $91 $DC
    add  hl, de                                   ;; 07:658B $19
    ld   e, $08                                   ;; 07:658C $1E $08

.loop_658E
    ld   a, [bc]                                  ;; 07:658E $0A
    inc  bc                                       ;; 07:658F $03
    ld   [hl+], a                                 ;; 07:6590 $22
    dec  e                                        ;; 07:6591 $1D
    jr   nz, .loop_658E                           ;; 07:6592 $20 $FA

    ld   [hl], $00                                ;; 07:6594 $36 $00

jr_007_6596:
    pop  bc                                       ;; 07:6596 $C1
    ld   hl, wEntitiesInertiaTable                ;; 07:6597 $21 $D0 $C3
    add  hl, bc                                   ;; 07:659A $09
    inc  [hl]                                     ;; 07:659B $34
IF __PATCH_0__
    ld   a, [hl]
    cp   $09
    ret  nz

    ldh  a, [hIsGBC]
    and  a
    ret  z

    ld   hl, wObjPal3 + 2*2
    ld   a, $3f
    ld   [hl+], a
    ld   a, $14
    ld   [hl], a
    ld   a, $0a
    ld   [wPalettePartialCopyColorIndexStart], a
    ld   a, $01
    ld   [wPalettePartialCopyColorCount], a
    ld   a, $82
    ld   [wPaletteDataFlags], a
ENDC
    ret                                           ;; 07:659C $C9

jr_007_659D:
    call GetEntityTransitionCountdown             ;; 07:659D $CD $05 $0C
    ret  nz                                       ;; 07:65A0 $C0

    ; Open dialog with next hint
    ;
    ; Dialog id is (Dialog150 + mapId). This gives us:
    ; Dialog150
    ; Dialog151
    ; Dialog152
    ; Dialog153
    ; Dialog154
    ; Dialog155
    ; Dialog156
    ; Dialog157
    ldh  a, [hMapId]                              ;; 07:65A1 $F0 $F7
    add  LOW($150)                                ;; 07:65A3 $C6 $50
    call OpenDialogInTable1                       ;; 07:65A5 $CD $73 $23

    ld   a, $E4                                   ;; 07:65A8 $3E $E4
    ld   [wBGPalette], a                          ;; 07:65AA $EA $97 $DB
    ldh  a, [hIsGBC]                              ;; 07:65AD $F0 $FE
    and  a                                        ;; 07:65AF $A7
    jr   z, jr_007_65CB                           ;; 07:65B0 $28 $19

    ld   de, wBGPal2                              ;; 07:65B2 $11 $18 $DC
    ld   hl, rSVBK                                ;; 07:65B5 $21 $70 $FF
    di                                            ;; 07:65B8 $F3

.loop_65B9
    ld   [hl], $02                                ;; 07:65B9 $36 $02
    ld   a, [de]                                  ;; 07:65BB $1A
    ld   [hl], $00                                ;; 07:65BC $36 $00
    ld   [de], a                                  ;; 07:65BE $12
    inc  de                                       ;; 07:65BF $13
    ld   a, e                                     ;; 07:65C0 $7B
    and  $07                                      ;; 07:65C1 $E6 $07
    jr   nz, .loop_65B9                           ;; 07:65C3 $20 $F4

    ld   a, $01                                   ;; 07:65C5 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 07:65C7 $EA $D1 $DD
    ei                                            ;; 07:65CA $FB

jr_007_65CB:
    jp   ClearEntityStatus_07                     ;; 07:65CB $C3 $A4 $7E

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GoombaSpriteVariants::
.variant0
    db $4A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $4C, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $4C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $4A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $4E, OAM_GBC_PAL_2 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

GoombaEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 07:65DA $21 $B0 $C2
    add  hl, bc                                   ;; 07:65DD $09
    ld   a, [hl]                                  ;; 07:65DE $7E
    and  a                                        ;; 07:65DF $A7
    jp   nz, label_007_6523                       ;; 07:65E0 $C2 $23 $65

    ld   de, GoombaSpriteVariants                 ;; 07:65E3 $11 $CE $65
    call RenderActiveEntitySpritesPair            ;; 07:65E6 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:65E9 $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:65EC $CD $C3 $7D
    ldh  a, [hIsSideScrolling]                    ;; 07:65EF $F0 $F9
    and  a                                        ;; 07:65F1 $A7
    jp   nz, label_007_6693                       ;; 07:65F2 $C2 $93 $66

    ldh  a, [hActiveEntityState]                  ;; 07:65F5 $F0 $F0
    JP_TABLE                                      ;; 07:65F7
._00 dw func_007_6606                             ;; 07:65F8
._01 dw func_007_6649                             ;; 07:65FA
._02 dw func_007_666B                             ;; 07:65FC

Data_007_65FE::
    db   $08, $F8, $00, $00

Data_007_6602::
    db   $00, $00, $F8, $08

func_007_6606::
    call label_3B70                               ;; 07:6606 $CD $70 $3B
    call func_007_66F2                            ;; 07:6609 $CD $F2 $66
    call GetEntityTransitionCountdown             ;; 07:660C $CD $05 $0C
    jr   nz, jr_007_6647                          ;; 07:660F $20 $36

    call GetRandomByte                            ;; 07:6611 $CD $0D $28
    and  $3F                                      ;; 07:6614 $E6 $3F
    add  $30                                      ;; 07:6616 $C6 $30
    ld   [hl], a                                  ;; 07:6618 $77
    ld   hl, wEntitiesInertiaTable                ;; 07:6619 $21 $D0 $C3
    add  hl, bc                                   ;; 07:661C $09
    ld   a, [hl]                                  ;; 07:661D $7E
    inc  a                                        ;; 07:661E $3C
    ld   [hl], a                                  ;; 07:661F $77
    cp   $04                                      ;; 07:6620 $FE $04
    jr   nz, .jr_662A                             ;; 07:6622 $20 $06

    ld   [hl], b                                  ;; 07:6624 $70
    call GetEntityDirectionToLink_07              ;; 07:6625 $CD $7D $7E
    jr   jr_007_6630                              ;; 07:6628 $18 $06

.jr_662A
    call GetRandomByte                            ;; 07:662A $CD $0D $28
    and  $03                                      ;; 07:662D $E6 $03
    ld   e, a                                     ;; 07:662F $5F

jr_007_6630:
    ld   d, b                                     ;; 07:6630 $50
    ld   hl, Data_007_65FE                        ;; 07:6631 $21 $FE $65
    add  hl, de                                   ;; 07:6634 $19
    ld   a, [hl]                                  ;; 07:6635 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:6636 $21 $40 $C2
    add  hl, bc                                   ;; 07:6639 $09
    ld   [hl], a                                  ;; 07:663A $77
    ld   hl, Data_007_6602                        ;; 07:663B $21 $02 $66
    add  hl, de                                   ;; 07:663E $19
    ld   a, [hl]                                  ;; 07:663F $7E
    call GetEntitySpeedYAddress                   ;; 07:6640 $CD $05 $40
    ld   [hl], a                                  ;; 07:6643 $77
    call IncrementEntityState                     ;; 07:6644 $CD $12 $3B

jr_007_6647:
    jr   label_007_6660                           ;; 07:6647 $18 $17

func_007_6649::
    call label_3B70                               ;; 07:6649 $CD $70 $3B
    call func_007_66F2                            ;; 07:664C $CD $F2 $66
    call GetEntityTransitionCountdown             ;; 07:664F $CD $05 $0C
    jr   nz, .jr_665A                             ;; 07:6652 $20 $06

    ld   [hl], $20                                ;; 07:6654 $36 $20
    call IncrementEntityState                     ;; 07:6656 $CD $12 $3B
    ld   [hl], b                                  ;; 07:6659 $70

.jr_665A
    call UpdateEntityPosWithSpeed_07              ;; 07:665A $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:665D $CD $23 $3B

label_007_6660:
    ldh  a, [hFrameCounter]                       ;; 07:6660 $F0 $E7
    rra                                           ;; 07:6662 $1F
    rra                                           ;; 07:6663 $1F
    rra                                           ;; 07:6664 $1F
    rra                                           ;; 07:6665 $1F
    and  $01                                      ;; 07:6666 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:6668 $C3 $0C $3B

func_007_666B::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:666B $21 $40 $C3
    add  hl, bc                                   ;; 07:666E $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 07:666F $36 $C2
    call GetEntityTransitionCountdown             ;; 07:6671 $CD $05 $0C
    jr   nz, .jr_668E                             ;; 07:6674 $20 $18

    ld   hl, wEntitiesDroppedItemTable            ;; 07:6676 $21 $E0 $C4
    add  hl, bc                                   ;; 07:6679 $09
    ld   [hl], ENTITY_DROPPABLE_HEART             ;; 07:667A $36 $2D
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 07:667C $21 $80 $C4
    add  hl, bc                                   ;; 07:667F $09
    ld   [hl], $0C                                ;; 07:6680 $36 $0C
    ld   hl, wEntitiesStatusTable                 ;; 07:6682 $21 $80 $C2
    add  hl, bc                                   ;; 07:6685 $09
    ld   [hl], $01                                ;; 07:6686 $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:6688 $21 $40 $C3
    add  hl, bc                                   ;; 07:668B $09
    ld   [hl], 4                                  ;; 07:668C $36 $04

.jr_668E
    ld   a, $02                                   ;; 07:668E $3E $02
    jp   SetEntitySpriteVariant                   ;; 07:6690 $C3 $0C $3B

label_007_6693:
    ldh  a, [hActiveEntityState]                  ;; 07:6693 $F0 $F0
    cp   $02                                      ;; 07:6695 $FE $02
    jr   z, func_007_666B                         ;; 07:6697 $28 $D2

    call label_3B70                               ;; 07:6699 $CD $70 $3B
    call func_007_66FE                            ;; 07:669C $CD $FE $66
    ldh  a, [hActiveEntityState]                  ;; 07:669F $F0 $F0
    JP_TABLE                                      ;; 07:66A1
._00 dw func_007_66A6                             ;; 07:66A2
._01 dw func_007_66B8                             ;; 07:66A4

func_007_66A6::
    call GetEntityXDistanceToLink_07              ;; 07:66A6 $CD $5D $7E
    ld   a, $08                                   ;; 07:66A9 $3E $08
    dec  e                                        ;; 07:66AB $1D
    jr   nz, .jr_66B0                             ;; 07:66AC $20 $02

    ld   a, $F8                                   ;; 07:66AE $3E $F8

.jr_66B0
    ld   hl, wEntitiesSpeedXTable                 ;; 07:66B0 $21 $40 $C2
    add  hl, bc                                   ;; 07:66B3 $09
    ld   [hl], a                                  ;; 07:66B4 $77
    jp   IncrementEntityState                     ;; 07:66B5 $C3 $12 $3B

func_007_66B8::
    call UpdateEntityPosWithSpeed_07              ;; 07:66B8 $CD $0A $7E
    call GetEntitySpeedYAddress                   ;; 07:66BB $CD $05 $40
    inc  [hl]                                     ;; 07:66BE $34
    inc  [hl]                                     ;; 07:66BF $34
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:66C0 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 07:66C3 $21 $A0 $C2
    add  hl, bc                                   ;; 07:66C6 $09
    ld   a, [hl]                                  ;; 07:66C7 $7E
    and  $03                                      ;; 07:66C8 $E6 $03
    jr   z, .jr_66D4                              ;; 07:66CA $28 $08

    ld   hl, wEntitiesSpeedXTable                 ;; 07:66CC $21 $40 $C2
    add  hl, bc                                   ;; 07:66CF $09
    ld   a, [hl]                                  ;; 07:66D0 $7E
    cpl                                           ;; 07:66D1 $2F
    inc  a                                        ;; 07:66D2 $3C
    ld   [hl], a                                  ;; 07:66D3 $77

.jr_66D4
    ld   hl, wEntitiesCollisionsTable             ;; 07:66D4 $21 $A0 $C2
    add  hl, bc                                   ;; 07:66D7 $09
    ld   a, [hl]                                  ;; 07:66D8 $7E
    and  $08                                      ;; 07:66D9 $E6 $08
    jr   z, .jr_66EE                              ;; 07:66DB $28 $11

    ld   hl, wEntitiesPosYTable                   ;; 07:66DD $21 $10 $C2
    add  hl, bc                                   ;; 07:66E0 $09
    ld   a, [hl]                                  ;; 07:66E1 $7E
    and  $F0                                      ;; 07:66E2 $E6 $F0
    add  $03                                      ;; 07:66E4 $C6 $03
    ld   [hl], a                                  ;; 07:66E6 $77
    call GetEntitySpeedYAddress                   ;; 07:66E7 $CD $05 $40
    ld   [hl], b                                  ;; 07:66EA $70
    jp   label_007_6660                           ;; 07:66EB $C3 $60 $66

.jr_66EE
    xor  a                                        ;; 07:66EE $AF
    jp   SetEntitySpriteVariant                   ;; 07:66EF $C3 $0C $3B

func_007_66F2::
    ldh  a, [hLinkPositionZ]                      ;; 07:66F2 $F0 $A2
    and  a                                        ;; 07:66F4 $A7
    jp   z, CheckLinkCollisionWithEnemy_trampoline ;; 07:66F5 $CA $5A $3B

    cp   $08                                      ;; 07:66F8 $FE $08
    jp   c, CheckLinkCollisionWithEnemy_trampoline ;; 07:66FA $DA $5A $3B

    ret                                           ;; 07:66FD $C9

func_007_66FE::
    jp   CheckLinkCollisionWithEnemy_trampoline   ;; 07:66FE $C3 $5A $3B
