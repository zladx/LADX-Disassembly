; Note: this entity, unlike most others, use all 4 spriteslots.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
ManboAndFishesEntityHandler::
    ldh  a, [hActiveEntityVisualPosY]             ; $4500: $F0 $EC
    cp   $50                                      ; $4502: $FE $50
    jp   nc, label_018_48C8                       ; $4504: $D2 $C8 $48

    ld   hl, wEntitiesPosYTable                   ; $4507: $21 $10 $C2
    add  hl, bc                                   ; $450A: $09
    ld   [hl], $3E                                ; $450B: $36 $3E
    ld   a, [wD214]                               ; $450D: $FA $14 $D2
    and  a                                        ; $4510: $A7
    jr   z, .jr_4517                              ; $4511: $28 $04

    dec  a                                        ; $4513: $3D
    ld   [wD214], a                               ; $4514: $EA $14 $D2

.jr_4517
    ld   a, [wD218]                               ; $4517: $FA $18 $D2
    and  a                                        ; $451A: $A7
    jr   z, .jr_4521                              ; $451B: $28 $04

    dec  a                                        ; $451D: $3D
    ld   [wD218], a                               ; $451E: $EA $18 $D2

.jr_4521
    call func_018_4833                            ; $4521: $CD $33 $48
    call PushLinkOutOfEntity_18                   ; $4524: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4527: $F0 $F0
    JP_TABLE                                      ; $4529
._00 dw ManboAndFishesState0Handler
._01 dw ManboAndFishesState1Handler
._02 dw ManboAndFishesSingHandler
._03 dw ManboAndFishesState3Handler
._04 dw ManboAndFishesGrantSongHandler
._05 dw ManboAndFishesState5Handler

ManboAndFishesState0Handler::
    ld   a, [wOcarinaSongFlags]                   ; $4536: $FA $49 $DB
    and  MANBO_MAMBO_FLAG                         ; $4539: $E6 $02
    jr   z, .jr_4547                              ; $453B: $28 $0A

    call func_018_7D7C                            ; $453D: $CD $7C $7D
    jr   nc, func_018_455C                        ; $4540: $30 $1A

    jp_open_dialog Dialog189                      ; $4542

.jr_4547
IF __PATCH_0__
    ld   a, $02
    ld   [wC167], a
ENDC
    ldh  a, [hLinkPositionX]                      ; $4547: $F0 $98
    cp   $30                                      ; $4549: $FE $30
    jr   c, func_018_455C                         ; $454B: $38 $0F

    ld   a, $2F                                   ; $454D: $3E $2F
    ldh  [hLinkPositionX], a                      ; $454F: $E0 $98
    call ClearLinkPositionIncrement               ; $4551: $CD $8E $17
    call_open_dialog Dialog185                    ; $4554
    call IncrementEntityState                     ; $4559: $CD $12 $3B

func_018_455C::
    ldh  a, [hFrameCounter]                       ; $455C: $F0 $E7
    rra                                           ; $455E: $1F
    rra                                           ; $455F: $1F
    rra                                           ; $4560: $1F
    and  $01                                      ; $4561: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4563: $C3 $0C $3B

ManboAndFishesState1Handler::
    ld   a, [wDialogState]                        ; $4566: $FA $9F $C1
    and  a                                        ; $4569: $A7
    ret  nz                                       ; $456A: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $456B: $FA $77 $C1
    and  a                                        ; $456E: $A7
    jr   nz, jr_018_4581                          ; $456F: $20 $10

    ld   e, INVENTORY_SLOT_COUNT - 1              ; $4571: $1E $0B
    ld   hl, wInventoryItems.BButtonSlot          ; $4573: $21 $00 $DB

.loop_4576
    ld   a, [hl+]                                 ; $4576: $2A
    cp   INVENTORY_OCARINA                        ; $4577: $FE $09
    jr   z, jr_018_458A                           ; $4579: $28 $0F

    dec  e                                        ; $457B: $1D
    ld   a, e                                     ; $457C: $7B
    cp   $FF                                      ; $457D: $FE $FF
    jr   nz, .loop_4576                           ; $457F: $20 $F5

jr_018_4581:
    call IncrementEntityState                     ; $4581: $CD $12 $3B
    ld   [hl], b                                  ; $4584: $70
    jp_open_dialog Dialog18A                      ; $4585

jr_018_458A:
    call IncrementEntityState                     ; $458A: $CD $12 $3B
    jp_open_dialog Dialog187                      ; $458D

; Manbo singing his song
ManboAndFishesSingHandler::
    ld   a, [wDialogState]                        ; $4592: $FA $9F $C1
    and  a                                        ; $4595: $A7
    jr   nz, ret_018_45B6                         ; $4596: $20 $1E

    ld   a, MUSIC_MANBOS_MAMBO                    ; $4598: $3E $30
    ld   [wMusicTrackToPlay], a                   ; $459A: $EA $68 $D3
    call IncrementEntityState                     ; $459D: $CD $12 $3B

func_018_45A0::
    xor  a                                        ; $45A0: $AF
    ld   [wD210], a                               ; $45A1: $EA $10 $D2
    ld   [wD211], a                               ; $45A4: $EA $11 $D2
    ld   [wD212], a                               ; $45A7: $EA $12 $D2
    ld   [wD213], a                               ; $45AA: $EA $13 $D2
    ld   [wD217], a                               ; $45AD: $EA $17 $D2
    ld   [wD214], a                               ; $45B0: $EA $14 $D2
    ld   [wD218], a                               ; $45B3: $EA $18 $D2

ret_018_45B6:
    ret                                           ; $45B6: $C9

Data_018_45B7::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00, $00, $00

Data_018_4605::
    db   $02, $01, $02, $01, $02, $01, $02, $01, $00, $00, $00, $00, $00, $01, $00, $01
    db   $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $02, $02, $02, $02, $02, $02, $02

Data_018_4653::
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $02, $03, $02, $03
    db   $02, $03, $02, $03, $02, $03, $02, $02, $03, $04, $05, $06, $05, $06, $05, $06
    db   $05, $06, $05, $06, $05, $06, $05, $06, $05, $06, $04, $02, $03, $02, $03, $02
    db   $03, $02, $03, $02, $03, $02, $03, $02, $04, $05, $04, $05, $03, $02, $03, $02
    db   $03, $02, $03, $02, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ManboAndFishesState3Handler::
    ld   a, $02                                   ; $46A1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $46A3: $E0 $A1
    ld   [wC167], a                               ; $46A5: $EA $67 $C1
    ld   a, [wD210]                               ; $46A8: $FA $10 $D2
    add  $01                                      ; $46AB: $C6 $01
    ld   [wD210], a                               ; $46AD: $EA $10 $D2
    ld   a, [wD211]                               ; $46B0: $FA $11 $D2
    adc  $00                                      ; $46B3: $CE $00
    ld   [wD211], a                               ; $46B5: $EA $11 $D2
    ld   a, [wD211]                               ; $46B8: $FA $11 $D2
    cp   $05                                      ; $46BB: $FE $05
    jr   nz, .jr_46CF                             ; $46BD: $20 $10

    ld   a, [wD210]                               ; $46BF: $FA $10 $D2
    cp   $F0                                      ; $46C2: $FE $F0
    jr   nz, .jr_46CF                             ; $46C4: $20 $09

    call IncrementEntityState                     ; $46C6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $46C9: $CD $05 $0C
    ld   [hl], $20                                ; $46CC: $36 $20
    ret                                           ; $46CE: $C9

.jr_46CF
    ld   a, [wD212]                               ; $46CF: $FA $12 $D2
    inc  a                                        ; $46D2: $3C
    cp   $14                                      ; $46D3: $FE $14
    jr   nz, .jr_46DF                             ; $46D5: $20 $08

    ld   a, [wD213]                               ; $46D7: $FA $13 $D2
    inc  a                                        ; $46DA: $3C
    ld   [wD213], a                               ; $46DB: $EA $13 $D2
    xor  a                                        ; $46DE: $AF

.jr_46DF
    ld   [wD212], a                               ; $46DF: $EA $12 $D2
    ld   a, [wD213]                               ; $46E2: $FA $13 $D2
    ld   e, a                                     ; $46E5: $5F
    ld   d, b                                     ; $46E6: $50
    ld   hl, Data_018_4605                        ; $46E7: $21 $05 $46
    add  hl, de                                   ; $46EA: $19
    ld   a, [hl]                                  ; $46EB: $7E
    call SetEntitySpriteVariant                   ; $46EC: $CD $0C $3B
    ld   hl, Data_018_45B7                        ; $46EF: $21 $B7 $45
    add  hl, de                                   ; $46F2: $19
    ld   a, [hl]                                  ; $46F3: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $46F4: $21 $B0 $C2
    add  hl, bc                                   ; $46F7: $09
    ld   [hl], a                                  ; $46F8: $77
    ld   hl, Data_018_4653                        ; $46F9: $21 $53 $46
    add  hl, de                                   ; $46FC: $19
    ld   a, [hl]                                  ; $46FD: $7E
    ld   [wD215], a                               ; $46FE: $EA $15 $D2
    ld   a, [wD211]                               ; $4701: $FA $11 $D2
    ld   d, a                                     ; $4704: $57
    ld   a, [wD210]                               ; $4705: $FA $10 $D2
    ld   e, a                                     ; $4708: $5F
    cp   $CC                                      ; $4709: $FE $CC
    jr   nz, .jr_4712                             ; $470B: $20 $05

    ld   a, d                                     ; $470D: $7A
    cp   $00                                      ; $470E: $FE $00
    jr   z, jr_018_4722                           ; $4710: $28 $10

.jr_4712
    ld   a, e                                     ; $4712: $7B
    cp   $BE                                      ; $4713: $FE $BE
    jr   nz, .ret_471C                            ; $4715: $20 $05

    ld   a, d                                     ; $4717: $7A
    cp   $05                                      ; $4718: $FE $05
    jr   z, jr_018_471D                           ; $471A: $28 $01

.ret_471C
    ret                                           ; $471C: $C9

jr_018_471D:
    ld   a, $28                                   ; $471D: $3E $28
    ld   [wD214], a                               ; $471F: $EA $14 $D2

jr_018_4722:
    call GetEntityPrivateCountdown1               ; $4722: $CD $00 $0C
    ld   [hl], $28                                ; $4725: $36 $28
    ret                                           ; $4727: $C9

Data_018_4728::
    db   $00, $00, $40, $00, $00, $08, $42, $00, $00, $10, $44, $00

ManboAndFishesGrantSongHandler::
    call GetEntityTransitionCountdown             ; $4734: $CD $05 $0C
    jr   nz, .jr_4746                             ; $4737: $20 $0D

    ld   [hl], $70                                ; $4739: $36 $70
    ld   a, MUSIC_OBTAIN_ITEM                     ; $473B: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $473D: $EA $68 $D3
    ld   [wC167], a                               ; $4740: $EA $67 $C1
    call IncrementEntityState                     ; $4743: $CD $12 $3B

.jr_4746
    ld   a, $02                                   ; $4746: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4748: $E0 $A1
    jp   func_018_455C                            ; $474A: $C3 $5C $45

Data_018_474D::
    db   $90, $17

ManboAndFishesState5Handler::
    call func_018_455C                            ; $474F: $CD $5C $45
    call GetEntityTransitionCountdown             ; $4752: $CD $05 $0C
    jr   nz, .jr_476A                             ; $4755: $20 $13

    ld   a, FROGS_SONG_OF_THE_SOUL_FLAG           ; $4757: $3E $01
    ld   [wSelectedSongIndex], a                  ; $4759: $EA $4A $DB
    ld   hl, wOcarinaSongFlags                    ; $475C: $21 $49 $DB
    set  MANBO_MAMBO_FLAG_BIT, [hl]               ; $475F: $CB $CE
    xor  a                                        ; $4761: $AF
    ld   [wC167], a                               ; $4762: $EA $67 $C1
    call IncrementEntityState                     ; $4765: $CD $12 $3B
    ld   [hl], b                                  ; $4768: $70
    ret                                           ; $4769: $C9

.jr_476A
    cp   $08                                      ; $476A: $FE $08
    jr   nz, .jr_4774                             ; $476C: $20 $06

    dec  [hl]                                     ; $476E: $35
    call_open_dialog Dialog188                    ; $476F

.jr_4774
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ; $4774: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4776: $E0 $9D
    ld   a, $02                                   ; $4778: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $477A: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $477C: $F0 $98
    ldh  [hActiveEntityPosX], a                   ; $477E: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4780: $F0 $99
    sub  $0C                                      ; $4782: $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ; $4784: $E0 $EC
    ld   de, Data_018_474D                        ; $4786: $11 $4D $47
    xor  a                                        ; $4789: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $478A: $E0 $F1
    jp   RenderActiveEntitySprite                 ; $478C: $C3 $77 $3C

Data_018_478F::
    db   $00, $00, $50, $00, $00, $08, $52, $00, $10, $00, $54, $00, $10, $08, $56, $00
    db   $F8, $10, $58, $00, $08, $10, $5A, $00, $18, $10, $5C, $00, $00, $18, $5E, $00
    db   $10, $18, $5E, $40, $00, $00, $50, $00, $00, $08, $52, $00, $10, $00, $4A, $00
    db   $10, $08, $4C, $00, $F8, $10, $58, $00, $08, $10, $4E, $00, $18, $10, $5C, $00
    db   $00, $18, $5E, $00, $10, $18, $5E, $40, $00, $00, $50, $00, $00, $08, $52, $00
    db   $10, $00, $54, $00, $10, $08, $56, $00, $F8, $10, $60, $00, $08, $10, $5A, $00
    db   $18, $10, $62, $00, $00, $18, $5E, $00, $10, $18, $5E, $40, $00, $00, $46, $00
    db   $00, $08, $48, $00, $10, $00, $4A, $00, $10, $08, $4C, $00, $F8, $10, $60, $00
    db   $08, $10, $4E, $00, $18, $10, $62, $00, $00, $18, $5E, $00, $10, $18, $5E, $40

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ManboAndFishes1SpriteVariants::
.variant0
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
.variant1
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.varaiant2
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
.variant3
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant4
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

func_018_4833::
    ld   hl, wEntitiesPrivateState1Table          ; $4833: $21 $B0 $C2
    add  hl, bc                                   ; $4836: $09
    ld   a, [hl]                                  ; $4837: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4838: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $483A: $F0 $EC
    add  $03                                      ; $483C: $C6 $03
    ldh  [hActiveEntityVisualPosY], a             ; $483E: $E0 $EC
    ld   de, ManboAndFishes1SpriteVariants        ; $4840: $11 $1F $48
    call RenderActiveEntitySpritesPair            ; $4843: $CD $C0 $3B
    ld   a, $02                                   ; $4846: $3E $02
    call func_015_7964_trampoline                 ; $4848: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $484B: $CD $8A $3D
    call GetEntityPrivateCountdown1               ; $484E: $CD $00 $0C
    jr   z, jr_018_4857                           ; $4851: $28 $04

    ld   a, $03                                   ; $4853: $3E $03

.jr_4855
    jr   jr_018_485C                              ; $4855: $18 $05

jr_018_4857:
    ld   hl, wEntitiesSpriteVariantTable          ; $4857: $21 $B0 $C3
    add  hl, bc                                   ; $485A: $09
    ld   a, [hl]                                  ; $485B: $7E

jr_018_485C:
    rla                                           ; $485C: $17
    rla                                           ; $485D: $17
    and  $FC                                      ; $485E: $E6 $FC
    ld   e, a                                     ; $4860: $5F
    rla                                           ; $4861: $17
    rla                                           ; $4862: $17
    rla                                           ; $4863: $17
    and  $E0                                      ; $4864: $E6 $E0
    add  e                                        ; $4866: $83
    ld   e, a                                     ; $4867: $5F
    ld   d, b                                     ; $4868: $50
    ld   hl, Data_018_478F                        ; $4869: $21 $8F $47
    add  hl, de                                   ; $486C: $19
    ld   c, $09                                   ; $486D: $0E $09
    call RenderActiveEntitySpritesRect            ; $486F: $CD $E6 $3C
    ld   a, $09                                   ; $4872: $3E $09
    call func_015_7964_trampoline                 ; $4874: $CD $A0 $3D
    call GetEntityPrivateCountdown1               ; $4877: $CD $00 $0C
    ret  z                                        ; $487A: $C8

    ldh  a, [hActiveEntityPosX]                   ; $487B: $F0 $EE
    sub  $18                                      ; $487D: $D6 $18
    ldh  [hActiveEntityPosX], a                   ; $487F: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $4881: $F0 $EC
    sub  $10                                      ; $4883: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4885: $E0 $EC
    ld   hl, Data_018_4728                        ; $4887: $21 $28 $47
    ld   c, $03                                   ; $488A: $0E $03
    call RenderActiveEntitySpritesRect            ; $488C: $CD $E6 $3C
    ld   a, $03                                   ; $488F: $3E $03
    jp   func_015_7964_trampoline                 ; $4891: $C3 $A0 $3D

Data_018_4894::
    db   $00, $FC, $76, $00, $00, $04, $78, $00, $00, $0C, $7A, $00

Data_018_48A0::
    db   $00, $FC, $7C, $00

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ManboAndFishes2SpriteVariants::
.variant0
    db $00, OAM_GBC_PAL_4 | OAMF_PAL0
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $00, OAM_GBC_PAL_4 | OAMF_PAL0 | OAMF_BANK1
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.varaiant7
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
.variant8
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

label_018_48C8::
    call func_018_48DE
    ldh  a, [hFrameCounter]                       ; $48CB: $F0 $E7
    rra                                           ; $48CD: $1F
    rra                                           ; $48CE: $1F
    rra                                           ; $48CF: $1F
    rra                                           ; $48D0: $1F
    and  $01                                      ; $48D1: $E6 $01
    call SetEntitySpriteVariant                   ; $48D3: $CD $0C $3B
    ld   a, [wD215]                               ; $48D6: $FA $15 $D2
    and  a                                        ; $48D9: $A7
    ret  z                                        ; $48DA: $C8

    jp   SetEntitySpriteVariant                   ; $48DB: $C3 $0C $3B

func_018_48DE::
    ld   a, [wD214]                               ; $48DE: $FA $14 $D2
    and  a                                        ; $48E1: $A7
    jr   z, .jr_4904                              ; $48E2: $28 $20

    ldh  a, [hActiveEntityPosX]                   ; $48E4: $F0 $EE
    sub  $18                                      ; $48E6: $D6 $18
    ldh  [hActiveEntityPosX], a                   ; $48E8: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $48EA: $F0 $EC
    sub  $10                                      ; $48EC: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $48EE: $E0 $EC
    ld   hl, Data_018_4728                        ; $48F0: $21 $28 $47
    ld   c, $03                                   ; $48F3: $0E $03
    call RenderActiveEntitySpritesRect            ; $48F5: $CD $E6 $3C
    ld   a, $03                                   ; $48F8: $3E $03
    call func_015_7964_trampoline                 ; $48FA: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $48FD: $CD $8A $3D
    ld   a, $07                                   ; $4900: $3E $07
    ldh  [hActiveEntitySpriteVariant], a          ; $4902: $E0 $F1

.jr_4904
    ldh  a, [hActiveEntitySpriteVariant]          ; $4904: $F0 $F1
    cp   $02                                      ; $4906: $FE $02
    jr   nc, jr_018_491D                          ; $4908: $30 $13

    ld   hl, Data_018_4894                        ; $490A: $21 $94 $48
    dec  a                                        ; $490D: $3D
    jr   nz, .jr_4913                             ; $490E: $20 $03

    ld   hl, Data_018_48A0                        ; $4910: $21 $A0 $48

.jr_4913
    ld   c, $03                                   ; $4913: $0E $03
    call RenderActiveEntitySpritesRect            ; $4915: $CD $E6 $3C
    ld   a, $03                                   ; $4918: $3E $03
    jp   func_015_7964_trampoline                 ; $491A: $C3 $A0 $3D

jr_018_491D:
    ld   de, ManboAndFishes2SpriteVariants        ; $491D: $11 $A4 $48
    call RenderActiveEntitySpritesPair            ; $4920: $CD $C0 $3B

.jr_4923
    ld   a, $02                                   ; $4923: $3E $02
    jp   func_015_7964_trampoline                 ; $4925: $C3 $A0 $3D
