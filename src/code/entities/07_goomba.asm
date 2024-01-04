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
    xor  a                                        ; $6523: $AF
    ldh  [hBaseScrollX], a                        ; $6524: $E0 $96
    ldh  [hBaseScrollY], a                        ; $6526: $E0 $97
    ld   [wBGOriginLow], a                        ; $6528: $EA $2F $C1
    ld   [wBGOriginHigh], a                       ; $652B: $EA $2E $C1
    ld   hl, wLCDControl                          ; $652E: $21 $FD $D6
    res  LCDCB_WINON, [hl]                        ; $6531: $CB $AE
    ld   hl, wEntitiesInertiaTable                ; $6533: $21 $D0 $C3
    add  hl, bc                                   ; $6536: $09
    ld   a, [hl]                                  ; $6537: $7E
    cp   $09                                      ; $6538: $FE $09
if __OPTIMIZATIONS_1__
    jp   z, jr_007_659D                           ; $653A: $28 $61
ELSE
    jr   z, jr_007_659D                           ; $653A: $28 $61
ENDC

    ld   a, [wDrawCommandsSize]                   ; $653C: $FA $00 $D6
    ld   e, a                                     ; $653F: $5F
    add  $08                                      ; $6540: $C6 $08
    ld   [wDrawCommandsSize], a                   ; $6542: $EA $00 $D6
    ld   d, b                                     ; $6545: $50
    push bc                                       ; $6546: $C5
    ld   hl, wEntitiesInertiaTable                ; $6547: $21 $D0 $C3
    add  hl, bc                                   ; $654A: $09
    ld   c, [hl]                                  ; $654B: $4E
    sla  c                                        ; $654C: $CB $21
    sla  c                                        ; $654E: $CB $21
    sla  c                                        ; $6550: $CB $21
    ld   hl, Data_007_6493                        ; $6552: $21 $93 $64
    add  hl, bc                                   ; $6555: $09
    ld   c, l                                     ; $6556: $4D
    ld   b, h                                     ; $6557: $44
    ld   hl, wDrawCommand                         ; $6558: $21 $01 $D6
    add  hl, de                                   ; $655B: $19
    ld   e, $08                                   ; $655C: $1E $08

.loop_655E
    ld   a, [bc]                                  ; $655E: $0A
    inc  bc                                       ; $655F: $03
    ld   [hl+], a                                 ; $6560: $22
    dec  e                                        ; $6561: $1D
    jr   nz, .loop_655E                           ; $6562: $20 $FA

    ld   [hl], $00                                ; $6564: $36 $00
    ldh  a, [hIsGBC]                              ; $6566: $F0 $FE
    and  a                                        ; $6568: $A7
    jr   z, jr_007_6596                           ; $6569: $28 $2B

    pop  bc                                       ; $656B: $C1
    ld   a, [wDrawCommandsAltSize]                ; $656C: $FA $90 $DC
    ld   e, a                                     ; $656F: $5F
    add  $08                                      ; $6570: $C6 $08
    ld   [wDrawCommandsAltSize], a                ; $6572: $EA $90 $DC
    ld   d, b                                     ; $6575: $50
    push bc                                       ; $6576: $C5
    ld   hl, wEntitiesInertiaTable                ; $6577: $21 $D0 $C3
    add  hl, bc                                   ; $657A: $09
    ld   c, [hl]                                  ; $657B: $4E
    sla  c                                        ; $657C: $CB $21
    sla  c                                        ; $657E: $CB $21
    sla  c                                        ; $6580: $CB $21
IF __PATCH_0__
    ld   hl, Data_007_64F6
ELSE
    ld   hl, Data_007_6493                        ; $6582: $21 $93 $64
ENDC
    add  hl, bc                                   ; $6585: $09
    ld   c, l                                     ; $6586: $4D
    ld   b, h                                     ; $6587: $44
    ld   hl, wDrawCommandAlt                      ; $6588: $21 $91 $DC
    add  hl, de                                   ; $658B: $19
    ld   e, $08                                   ; $658C: $1E $08

.loop_658E
    ld   a, [bc]                                  ; $658E: $0A
    inc  bc                                       ; $658F: $03
    ld   [hl+], a                                 ; $6590: $22
    dec  e                                        ; $6591: $1D
    jr   nz, .loop_658E                           ; $6592: $20 $FA

    ld   [hl], $00                                ; $6594: $36 $00

jr_007_6596:
    pop  bc                                       ; $6596: $C1
    ld   hl, wEntitiesInertiaTable                ; $6597: $21 $D0 $C3
    add  hl, bc                                   ; $659A: $09
    inc  [hl]                                     ; $659B: $34
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
    ret                                           ; $659C: $C9

jr_007_659D:
    call GetEntityTransitionCountdown             ; $659D: $CD $05 $0C
    ret  nz                                       ; $65A0: $C0

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
    ldh  a, [hMapId]                              ; $65A1: $F0 $F7
    add  LOW($150)                                ; $65A3: $C6 $50
    call OpenDialogInTable1                       ; $65A5: $CD $73 $23

    ld   a, $E4                                   ; $65A8: $3E $E4
    ld   [wBGPalette], a                          ; $65AA: $EA $97 $DB
    ldh  a, [hIsGBC]                              ; $65AD: $F0 $FE
    and  a                                        ; $65AF: $A7
    jr   z, jr_007_65CB                           ; $65B0: $28 $19

    ld   de, wBGPal2                              ; $65B2: $11 $18 $DC
    ld   hl, rSVBK                                ; $65B5: $21 $70 $FF
    di                                            ; $65B8: $F3

.loop_65B9
    ld   [hl], $02                                ; $65B9: $36 $02
    ld   a, [de]                                  ; $65BB: $1A
    ld   [hl], $00                                ; $65BC: $36 $00
    ld   [de], a                                  ; $65BE: $12
    inc  de                                       ; $65BF: $13
    ld   a, e                                     ; $65C0: $7B
    and  $07                                      ; $65C1: $E6 $07
    jr   nz, .loop_65B9                           ; $65C3: $20 $F4

    ld   a, $01                                   ; $65C5: $3E $01
    ld   [wPaletteDataFlags], a                   ; $65C7: $EA $D1 $DD
    ei                                            ; $65CA: $FB

jr_007_65CB:
    jp   ClearEntityStatus_07                     ; $65CB: $C3 $A4 $7E

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
    ld   hl, wEntitiesPrivateState1Table          ; $65DA: $21 $B0 $C2
    add  hl, bc                                   ; $65DD: $09
    ld   a, [hl]                                  ; $65DE: $7E
    and  a                                        ; $65DF: $A7
    jp   nz, label_007_6523                       ; $65E0: $C2 $23 $65

    ld   de, GoombaSpriteVariants                 ; $65E3: $11 $CE $65
    call RenderActiveEntitySpritesPair            ; $65E6: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $65E9: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $65EC: $CD $C3 $7D
    ldh  a, [hIsSideScrolling]                    ; $65EF: $F0 $F9
    and  a                                        ; $65F1: $A7
    jp   nz, label_007_6693                       ; $65F2: $C2 $93 $66

    ldh  a, [hActiveEntityState]                  ; $65F5: $F0 $F0
    JP_TABLE                                      ; $65F7
._00 dw func_007_6606                             ; $65F8
._01 dw func_007_6649                             ; $65FA
._02 dw func_007_666B                             ; $65FC

Data_007_65FE::
    db   $08, $F8, $00, $00

Data_007_6602::
    db   $00, $00, $F8, $08

func_007_6606::
    call label_3B70                               ; $6606: $CD $70 $3B
    call func_007_66F2                            ; $6609: $CD $F2 $66
    call GetEntityTransitionCountdown             ; $660C: $CD $05 $0C
    jr   nz, jr_007_6647                          ; $660F: $20 $36

    call GetRandomByte                            ; $6611: $CD $0D $28
    and  $3F                                      ; $6614: $E6 $3F
    add  $30                                      ; $6616: $C6 $30
    ld   [hl], a                                  ; $6618: $77
    ld   hl, wEntitiesInertiaTable                ; $6619: $21 $D0 $C3
    add  hl, bc                                   ; $661C: $09
    ld   a, [hl]                                  ; $661D: $7E
    inc  a                                        ; $661E: $3C
    ld   [hl], a                                  ; $661F: $77
    cp   $04                                      ; $6620: $FE $04
    jr   nz, .jr_662A                             ; $6622: $20 $06

    ld   [hl], b                                  ; $6624: $70
    call func_007_7E7D                            ; $6625: $CD $7D $7E
    jr   jr_007_6630                              ; $6628: $18 $06

.jr_662A
    call GetRandomByte                            ; $662A: $CD $0D $28
    and  $03                                      ; $662D: $E6 $03
    ld   e, a                                     ; $662F: $5F

jr_007_6630:
    ld   d, b                                     ; $6630: $50
    ld   hl, Data_007_65FE                        ; $6631: $21 $FE $65
    add  hl, de                                   ; $6634: $19
    ld   a, [hl]                                  ; $6635: $7E
    ld   hl, wEntitiesVelocityXTable              ; $6636: $21 $40 $C2
    add  hl, bc                                   ; $6639: $09
    ld   [hl], a                                  ; $663A: $77
    ld   hl, Data_007_6602                        ; $663B: $21 $02 $66
    add  hl, de                                   ; $663E: $19
    ld   a, [hl]                                  ; $663F: $7E
    call GetEntityVelocityYAddress                ; $6640: $CD $05 $40
    ld   [hl], a                                  ; $6643: $77
    call IncrementEntityState                     ; $6644: $CD $12 $3B

jr_007_6647:
    jr   label_007_6660                           ; $6647: $18 $17

func_007_6649::
    call label_3B70                               ; $6649: $CD $70 $3B
    call func_007_66F2                            ; $664C: $CD $F2 $66
    call GetEntityTransitionCountdown             ; $664F: $CD $05 $0C
    jr   nz, .jr_665A                             ; $6652: $20 $06

    ld   [hl], $20                                ; $6654: $36 $20
    call IncrementEntityState                     ; $6656: $CD $12 $3B
    ld   [hl], b                                  ; $6659: $70

.jr_665A
    call UpdateEntityPosWithVelocity_07           ; $665A: $CD $0A $7E
    call DefaultEntityPhysics_trampoline          ; $665D: $CD $23 $3B

label_007_6660:
    ldh  a, [hFrameCounter]                       ; $6660: $F0 $E7
    rra                                           ; $6662: $1F
    rra                                           ; $6663: $1F
    rra                                           ; $6664: $1F
    rra                                           ; $6665: $1F
    and  $01                                      ; $6666: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6668: $C3 $0C $3B

func_007_666B::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $666B: $21 $40 $C3
    add  hl, bc                                   ; $666E: $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $666F: $36 $C2
    call GetEntityTransitionCountdown             ; $6671: $CD $05 $0C
    jr   nz, .jr_668E                             ; $6674: $20 $18

    ld   hl, wEntitiesDroppedItemTable            ; $6676: $21 $E0 $C4
    add  hl, bc                                   ; $6679: $09
    ld   [hl], ENTITY_DROPPABLE_HEART             ; $667A: $36 $2D
    ld   hl, wEntitiesPrivateCountdown3Table      ; $667C: $21 $80 $C4
    add  hl, bc                                   ; $667F: $09
    ld   [hl], $0C                                ; $6680: $36 $0C
    ld   hl, wEntitiesStatusTable                 ; $6682: $21 $80 $C2
    add  hl, bc                                   ; $6685: $09
    ld   [hl], $01                                ; $6686: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6688: $21 $40 $C3
    add  hl, bc                                   ; $668B: $09
    ld   [hl], 4                                  ; $668C: $36 $04

.jr_668E
    ld   a, $02                                   ; $668E: $3E $02
    jp   SetEntitySpriteVariant                   ; $6690: $C3 $0C $3B

label_007_6693:
    ldh  a, [hActiveEntityState]                  ; $6693: $F0 $F0
    cp   $02                                      ; $6695: $FE $02
    jr   z, func_007_666B                         ; $6697: $28 $D2

    call label_3B70                               ; $6699: $CD $70 $3B
    call func_007_66FE                            ; $669C: $CD $FE $66
    ldh  a, [hActiveEntityState]                  ; $669F: $F0 $F0
    JP_TABLE                                      ; $66A1
._00 dw func_007_66A6                             ; $66A2
._01 dw func_007_66B8                             ; $66A4

func_007_66A6::
    call EntityLinkPositionXDifference_07         ; $66A6: $CD $5D $7E
    ld   a, $08                                   ; $66A9: $3E $08
    dec  e                                        ; $66AB: $1D
    jr   nz, .jr_66B0                             ; $66AC: $20 $02

    ld   a, $F8                                   ; $66AE: $3E $F8

.jr_66B0
    ld   hl, wEntitiesVelocityXTable              ; $66B0: $21 $40 $C2
    add  hl, bc                                   ; $66B3: $09
    ld   [hl], a                                  ; $66B4: $77
    jp   IncrementEntityState                     ; $66B5: $C3 $12 $3B

func_007_66B8::
    call UpdateEntityPosWithVelocity_07           ; $66B8: $CD $0A $7E
    call GetEntityVelocityYAddress                ; $66BB: $CD $05 $40
    inc  [hl]                                     ; $66BE: $34
    inc  [hl]                                     ; $66BF: $34
    call DefaultEntityPhysics_trampoline          ; $66C0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66C3: $21 $A0 $C2
    add  hl, bc                                   ; $66C6: $09
    ld   a, [hl]                                  ; $66C7: $7E
    and  $03                                      ; $66C8: $E6 $03
    jr   z, .jr_66D4                              ; $66CA: $28 $08

    ld   hl, wEntitiesVelocityXTable              ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    cpl                                           ; $66D1: $2F
    inc  a                                        ; $66D2: $3C
    ld   [hl], a                                  ; $66D3: $77

.jr_66D4
    ld   hl, wEntitiesCollisionsTable             ; $66D4: $21 $A0 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    and  $08                                      ; $66D9: $E6 $08
    jr   z, .jr_66EE                              ; $66DB: $28 $11

    ld   hl, wEntitiesPosYTable                   ; $66DD: $21 $10 $C2
    add  hl, bc                                   ; $66E0: $09
    ld   a, [hl]                                  ; $66E1: $7E
    and  $F0                                      ; $66E2: $E6 $F0
    add  $03                                      ; $66E4: $C6 $03
    ld   [hl], a                                  ; $66E6: $77
    call GetEntityVelocityYAddress                ; $66E7: $CD $05 $40
    ld   [hl], b                                  ; $66EA: $70
    jp   label_007_6660                           ; $66EB: $C3 $60 $66

.jr_66EE
    xor  a                                        ; $66EE: $AF
    jp   SetEntitySpriteVariant                   ; $66EF: $C3 $0C $3B

func_007_66F2::
    ldh  a, [hLinkPositionZ]                      ; $66F2: $F0 $A2
    and  a                                        ; $66F4: $A7
    jp   z, CheckLinkCollisionWithEnemy_trampoline ; $66F5: $CA $5A $3B

    cp   $08                                      ; $66F8: $FE $08
    jp   c, CheckLinkCollisionWithEnemy_trampoline ; $66FA: $DA $5A $3B

    ret                                           ; $66FD: $C9

func_007_66FE::
    jp   CheckLinkCollisionWithEnemy_trampoline   ; $66FE: $C3 $5A $3B
