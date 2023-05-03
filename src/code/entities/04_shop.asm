; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ShopOwnerSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_3 | OAMF_PAL0
    db $62, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $62, OAM_GBC_PAL_3 | OAMF_PAL0 |OAMF_XFLIP
    db $60, OAM_GBC_PAL_3 | OAMF_PAL0 |OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_3 | OAMF_PAL0
    db $66, OAM_GBC_PAL_3 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant6
    db $6A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

ShopOwnerEntityHandler::
    ld   a, [wBlockItemUsage]                     ; $76EB: $FA $0A $C5
    and  a                                        ; $76EE: $A7
    jr   nz, .jr_76F9                             ; $76EF: $20 $08

    ld   a, $01                                   ; $76F1: $3E $01
    ld   [wBlockItemUsage], a                     ; $76F3: $EA $0A $C5
    call func_004_788E                            ; $76F6: $CD $8E $78

.jr_76F9
    ld   a, [wSwordLevel]                         ; $76F9: $FA $4E $DB
    and  a                                        ; $76FC: $A7
    jr   z, .jr_7705                              ; $76FD: $28 $06

    ldh  a, [hFrameCounter]                       ; $76FF: $F0 $E7
    and  $5F                                      ; $7701: $E6 $5F
    jr   nz, jr_004_770E                          ; $7703: $20 $09

.jr_7705
    call func_004_6E55                            ; $7705: $CD $55 $6E
    ld   a, e                                     ; $7708: $7B
    ld   hl, wEntitiesDirectionTable              ; $7709: $21 $80 $C3
    add  hl, bc                                   ; $770C: $09
    ld   [hl], a                                  ; $770D: $77

jr_004_770E:
    call func_004_7C98                            ; $770E: $CD $98 $7C
    ld   de, ShopOwnerSpriteVariants              ; $7711: $11 $CB $76
    call RenderActiveEntitySpritesPair            ; $7714: $CD $C0 $3B
    call func_004_7B70                            ; $7717: $CD $70 $7B
    ldh  a, [hActiveEntityState]                  ; $771A: $F0 $F0
    cp   $04                                      ; $771C: $FE $04
    jr   nc, .jr_7723                             ; $771E: $30 $03

    call PushLinkOutOfEntity_04                   ; $7720: $CD $E3 $7B

.jr_7723
    ldh  a, [hActiveEntityState]                  ; $7723: $F0 $F0
    JP_TABLE                                      ; $7725
._00 dw func_004_77F8                             ; $7726
._01 dw func_004_78AF                             ; $7728
._02 dw func_004_795D                             ; $772A
._03 dw func_004_7ADD                             ; $772C
._04 dw func_004_7AED                             ; $772E
._05 dw func_004_7B40                             ; $7730

Data_004_7732::
    ; Per shop item type the data to write to the background. Each entry is 11 bytes.
    db   $98, $63, $02, $B2, $B0, $B0, $98, $A4, $01, $7F, $7F
    db   $98, $67, $02, $B1, $B0, $7F, $98, $A8, $01, $0A, $B3
    db   $98, $6A, $02, $7F, $B2, $B0, $98, $AC, $01, $BA, $B1
    db   $98, $6E, $02, $B1, $B0, $7F, $98, $B0, $01, $0A, $09
    db   $98, $63, $02, $B9, $B8, $B0, $98, $A4, $01, $7F, $7F
    db   $98, $63, $02, $B1, $B0, $7F, $98, $A4, $01, $0A, $09
    db   $00

Data_004_7775::
    ; Per shop item position, data to write to the background when the item is picked up.
    db   $98, $62, $43, $7F, $98, $83, $42, $7F, $98, $A3, $42, $7F, $00, $00, $00, $00
    db   $98, $66, $43, $7F, $98, $87, $42, $7F, $98, $A7, $42, $7F, $00, $00, $00, $00
    db   $98, $6A, $43, $7F, $98, $8B, $42, $7F, $98, $AB, $42, $7F, $00, $00, $00, $00
    db   $98, $6E, $43, $7F, $98, $8F, $42, $7F, $98, $AF, $42, $7F, $00, $00, $00, $00

Data_004_77B5::             ; @TODO Shop item "for sale" table.
    db   $01, $02, $03, $00 ; Shovel,    3 hearts, shield    (nothing)
    db   $01, $02, $03, $04 ; Shovel,    3 hearts, shield,   10 bombs
    db   $05, $02, $03, $04 ; Bow,       3 hearts, shield,   10 bombs
    db   $06, $02, $03, $04 ; 10 arrows, 3 hearts, shield,   10 bombs
    db   $07, $08, $09, $0A ; Ocarina,   Acorn,    Medicine, (glitch)
    ; POI: Unused shop layout (?)


; 01  Shovel
; 02  3 Hearts
; 03  Shield
; 04  10 Bombs
; 05  Bow
; 06  10 Arrows
; 07  Ocarina
; 08  Guardian Acorn (in appearance only)
; 09  Medicine

; @POI: Ocarina has a dialog index assigned (39), but
; it's the message about the Kanalet castle gate opening.
; (Comes right after the "I wasn't kidding when I said pay" message, though...)
;
; @TODO: Shop dialogue indexes (table 0) when about to buy
ShopItemPresentationDialogs::
._0 db_dialog_low Dialog030 ; Shovel
._1 db_dialog_low Dialog031 ; 3 hearts
._2 db_dialog_low Dialog032 ; Shield
._3 db_dialog_low Dialog033 ; 10 bombs
._4 db_dialog_low Dialog02C ; Bow and Arrow
._5 db_dialog_low Dialog02D ; 10 arrows
._6 db_dialog_low Dialog039 ; unused (Ocarina, but has Kanalet castle message)
._7 db_dialog_low Dialog000 ; unused
._8 db_dialog_low Dialog000 ; unused
._9 db_dialog_low Dialog000 ; unused

    ;    ---  Shvl 3Hrt Shld 10bm Bow 10awo Ocar Acrn Medc
    ;     0    1    2    3    4    5    6    7    8    9
Data_004_77D3::     ; Price (dec, high) ?
    db   $00, $02, $00, $00, $00, $09, $00, $00, $00
Data_004_77DC::     ; Price (dec, low) ?
    db   $00, $00, $10, $20, $10, $80, $10, $00, $00
Data_004_77E5::     ; Price (high) ?
    db   $00, $00, $00, $00, $00, $03, $00, $00, $00
Data_004_77EE::     ; Price (low) ?
    db   $00, $C8, $0A, $14, $0A, $D4, $0A, $00, $00, $00

func_004_77F8::
    ld   a, [wHasStolenFromShop]                  ; $77F8: $FA $46 $DB
    and  a                                        ; $77FB: $A7

.jr_77FC
    jr   z, jr_004_7839                           ; $77FC: $28 $3B

    ld   hl, wEntitiesPosYTable                   ; $77FE: $21 $10 $C2
    add  hl, bc                                   ; $7801: $09
    ld   [hl], $40                                ; $7802: $36 $40
    ld   hl, wEntitiesPosXTable                   ; $7804: $21 $00 $C2
    add  hl, bc                                   ; $7807: $09
    ld   [hl], $50                                ; $7808: $36 $50
    ld   hl, wEntitiesDirectionTable              ; $780A: $21 $80 $C3
    add  hl, bc                                   ; $780D: $09
    ld   [hl], $03                                ; $780E: $36 $03
    ld   a, $02                                   ; $7810: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7812: $E0 $A1
    ld   [wC167], a                               ; $7814: $EA $67 $C1
    ld   a, [wTransitionSequenceCounter]          ; $7817: $FA $6B $C1
    cp   $04                                      ; $781A: $FE $04
    jr   nz, .ret_7838                            ; $781C: $20 $1A

    ldh  a, [hLinkPositionY]                      ; $781E: $F0 $99
    sub  $01                                      ; $7820: $D6 $01
    ldh  [hLinkPositionY], a                      ; $7822: $E0 $99
    cp   $74                                      ; $7824: $FE $74
    jr   nz, .ret_7838                            ; $7826: $20 $10

    call_open_dialog Dialog038                    ; $7828
    ld   hl, wEntitiesStateTable                  ; $782D: $21 $90 $C2
    add  hl, bc                                   ; $7830: $09
    ld   [hl], $04                                ; $7831: $36 $04
    ld   a, MUSIC_BOSS                            ; $7833: $3E $19
    ld   [wMusicTrackToPlay], a                   ; $7835: $EA $68 $D3

.ret_7838
    ret                                           ; $7838: $C9

jr_004_7839:
    ld   e, $00                                   ; $7839: $1E $00
    ld   d, b                                     ; $783B: $50
    ld   a, [wHasInstrument2]                     ; $783C: $FA $66 $DB
    and  $02                                      ; $783F: $E6 $02
    jr   z, .jr_7845                              ; $7841: $28 $02

    ld   e, $04                                   ; $7843: $1E $04

.jr_7845
    push bc                                       ; $7845: $C5
    ld   hl, wInventoryItems.BButtonSlot          ; $7846: $21 $00 $DB
    ld   c, INVENTORY_SLOT_COUNT - 1              ; $7849: $0E $0B

jr_004_784B:
    ld   a, [wBoomerangTradedItem]                ; $784B: $FA $7D $DB
    cp   INVENTORY_SHOVEL                         ; $784E: $FE $0B
    jr   z, .jr_7857                              ; $7850: $28 $05

    ld   a, [hl+]                                 ; $7852: $2A
    cp   INVENTORY_SHOVEL                         ; $7853: $FE $0B
    jr   nz, jr_004_7859                          ; $7855: $20 $02

.jr_7857
    ld   e, $08                                   ; $7857: $1E $08

jr_004_7859:
    dec  c                                        ; $7859: $0D
    ld   a, c                                     ; $785A: $79
    cp   $FF                                      ; $785B: $FE $FF
    jr   nz, jr_004_784B                          ; $785D: $20 $EC

    ld   hl, wInventoryItems.BButtonSlot          ; $785F: $21 $00 $DB
    ld   c, INVENTORY_SLOT_COUNT - 1              ; $7862: $0E $0B

jr_004_7864:
    ld   a, [wBoomerangTradedItem]                ; $7864: $FA $7D $DB
    cp   INVENTORY_BOW                            ; $7867: $FE $05
    jr   z, .jr_7870                              ; $7869: $28 $05

    ld   a, [hl+]                                 ; $786B: $2A
    cp   INVENTORY_BOW                            ; $786C: $FE $05
    jr   nz, jr_004_7872                          ; $786E: $20 $02

.jr_7870
    ld   e, $0C                                   ; $7870: $1E $0C

jr_004_7872:
    dec  c                                        ; $7872: $0D
    ld   a, c                                     ; $7873: $79
    cp   $FF                                      ; $7874: $FE $FF
    jr   nz, jr_004_7864                          ; $7876: $20 $EC

    ld   hl, Data_004_77B5                        ; $7878: $21 $B5 $77
    add  hl, de                                   ; $787B: $19
    ld   de, wShopItemList                        ; $787C: $11 $05 $C5
    ld   c, $04                                   ; $787F: $0E $04

.loop_7881
    ld   a, [hl+]                                 ; $7881: $2A
    ld   [de], a                                  ; $7882: $12
    inc  de                                       ; $7883: $13
    dec  c                                        ; $7884: $0D
    jr   nz, .loop_7881                           ; $7885: $20 $FA

    pop  bc                                       ; $7887: $C1
    call IncrementEntityState                     ; $7888: $CD $12 $3B
    jp   func_004_788E                            ; $788B: $C3 $8E $78

func_004_788E::
    ld   de, wDrawCommand                         ; $788E: $11 $01 $D6
    push bc                                       ; $7891: $C5
    ld   hl, wShopItemList                        ; $7892: $21 $05 $C5
    ld   c, $04                                   ; $7895: $0E $04

jr_004_7897:
    ld   a, [hl+]                                 ; $7897: $2A
    and  a                                        ; $7898: $A7
    jr   z, .jr_78A0                              ; $7899: $28 $05

    push hl                                       ; $789B: $E5
    call func_004_798B                            ; $789C: $CD $8B $79
    pop  hl                                       ; $789F: $E1

.jr_78A0
    dec  c                                        ; $78A0: $0D
    jr   nz, jr_004_7897                          ; $78A1: $20 $F4

    pop  bc                                       ; $78A3: $C1
    ret                                           ; $78A4: $C9

Data_004_78A5::
    db   $00, $00, $00, $01, $01, $02, $02, $03, $03, $03

func_004_78AF::
    ld   a, [wItemPickedUpInShop]                 ; $78AF: $FA $09 $C5
    and  a                                        ; $78B2: $A7
    jr   z, .jr_78D4                              ; $78B3: $28 $1F

    ld   hl, wEntitiesDirectionTable              ; $78B5: $21 $80 $C3
    add  hl, bc                                   ; $78B8: $09
    ld   a, [hl]                                  ; $78B9: $7E
    and  $01                                      ; $78BA: $E6 $01
    jr   z, .jr_78D4                              ; $78BC: $28 $16

    ld   a, [wLinkMotionState]                    ; $78BE: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $78C1: $FE $00
    jr   nz, .jr_78D4                             ; $78C3: $20 $0F

    ldh  a, [hLinkPositionY]                      ; $78C5: $F0 $99
    cp   $7B                                      ; $78C7: $FE $7B
    jr   c, .jr_78D4                              ; $78C9: $38 $09

    sub  $02                                      ; $78CB: $D6 $02
    ldh  [hLinkPositionY], a                      ; $78CD: $E0 $99
    jp_open_dialog Dialog02F                      ; @TODO Text used when you're trying to steal stuff

.jr_78D4
    ldh  a, [hLinkPositionY]                      ; $78D4: $F0 $99
    cp   $48                                      ; $78D6: $FE $48
    jr   nc, jr_004_7940                          ; $78D8: $30 $66

    ldh  a, [hLinkDirection]                      ; $78DA: $F0 $9E
    cp   DIRECTION_UP                             ; $78DC: $FE $02
    jr   nz, jr_004_7940                          ; $78DE: $20 $60

    ldh  a, [hJoypadState]                        ; $78E0: $F0 $CC
    and  J_A | J_B                                ; $78E2: $E6 $30
    jr   z, jr_004_7940                           ; $78E4: $28 $5A

    ld   a, [wItemPickedUpInShop]                 ; $78E6: $FA $09 $C5
    and  a                                        ; $78E9: $A7
    jr   z, .jr_7907                              ; $78EA: $28 $1B

    ldh  a, [hLinkPositionX]                      ; $78EC: $F0 $98
    add  $00                                      ; $78EE: $C6 $00
    swap a                                        ; $78F0: $CB $37
    and  $0F                                      ; $78F2: $E6 $0F
    ld   e, a                                     ; $78F4: $5F
    ld   d, b                                     ; $78F5: $50
    ld   hl, Data_004_78A5                        ; $78F6: $21 $A5 $78
    add  hl, de                                   ; $78F9: $19
    ld   a, [wIndexPickedUpInShop]                ; $78FA: $FA $0B $C5
    cp   [hl]                                     ; $78FD: $BE
    jr   nz, jr_004_7940                          ; $78FE: $20 $40

    ld   a, JINGLE_VALIDATE                       ; $7900: $3E $13
    ldh  [hJingle], a                             ; $7902: $E0 $F2
    jp   label_004_796D                           ; $7904: $C3 $6D $79

.jr_7907
IF __PATCH_0__
    ld   a, [wC3CF]
    and  a
    jr   nz, jr_004_7940
ENDC

IF __PATCH_3__
    ld   a, [wIsCarryingLiftedObject]
    and  a
    jr   nz, jr_004_7940
ENDC

    ldh  a, [hLinkPositionX]                      ; $7907: $F0 $98
    add  $00                                      ; $7909: $C6 $00
    swap a                                        ; $790B: $CB $37
    and  $0F                                      ; $790D: $E6 $0F
    ld   e, a                                     ; $790F: $5F
    ld   d, b                                     ; $7910: $50
    ld   hl, Data_004_78A5                        ; $7911: $21 $A5 $78
    add  hl, de                                   ; $7914: $19
    ld   a, [hl]                                  ; $7915: $7E
    ld   [wIndexPickedUpInShop], a                ; $7916: $EA $0B $C5
    ld   e, a                                     ; $7919: $5F
    ld   d, b                                     ; $791A: $50
    ld   hl, wShopItemList                        ; $791B: $21 $05 $C5
    add  hl, de                                   ; $791E: $19
    ld   a, [hl]                                  ; $791F: $7E
    ld   [wItemPickedUpInShop], a                 ; $7920: $EA $09 $C5
    ld   [hl], b                                  ; $7923: $70
    and  a                                        ; $7924: $A7
    jr   z, .jr_792B                              ; $7925: $28 $04

    ld   a, JINGLE_VALIDATE                       ; $7927: $3E $13
    ldh  [hJingle], a                             ; $7929: $E0 $F2

.jr_792B
    push bc                                       ; $792B: $C5
    ld   a, e                                     ; $792C: $7B
    swap a                                        ; $792D: $CB $37
    ld   e, a                                     ; $792F: $5F
    ld   hl, Data_004_7775                        ; $7930: $21 $75 $77
    add  hl, de                                   ; $7933: $19
    ld   de, wDrawCommand                         ; $7934: $11 $01 $D6
    ld   c, $0D                                   ; $7937: $0E $0D

.loop_7939
    ld   a, [hl+]                                 ; $7939: $2A
    ld   [de], a                                  ; $793A: $12
    inc  de                                       ; $793B: $13
    dec  c                                        ; $793C: $0D
    jr   nz, .loop_7939                           ; $793D: $20 $FA

    pop  bc                                       ; $793F: $C1

jr_004_7940:
    call func_004_7C06                            ; $7940: $CD $06 $7C
    ret  nc                                       ; $7943: $D0

    ld   a, [wItemPickedUpInShop]                 ; $7944: $FA $09 $C5
    and  a                                        ; $7947: $A7
    jr   z, .jr_7958                              ; $7948: $28 $0E

    dec  a                                        ; $794A: $3D
    ld   e, a                                     ; $794B: $5F
    ld   d, b                                     ; $794C: $50
    ld   hl, ShopItemPresentationDialogs          ; $794D: $21 $C9 $77
    add  hl, de                                   ; $7950: $19
    ld   a, [hl]                                  ; $7951: $7E
    call OpenDialogInTable0                       ; $7952: $CD $85 $23
    jp   IncrementEntityState                     ; $7955: $C3 $12 $3B

.jr_7958
    jp_open_dialog Dialog02E                      ; $7958

func_004_795D::
    ld   a, [wDialogState]                        ; $795D: $FA $9F $C1
    and  a                                        ; $7960: $A7
    ret  nz                                       ; $7961: $C0

    ld   a, [wDialogAskSelectionIndex]            ; $7962: $FA $77 $C1
    cp   $00                                      ; $7965: $FE $00
    jr   z, jr_004_79AB                           ; $7967: $28 $42

    cp   $02                                      ; $7969: $FE $02
    jr   z, jr_004_7984                           ; $796B: $28 $17

label_004_796D:
    ld   a, [wIndexPickedUpInShop]                ; $796D: $FA $0B $C5
    ld   e, a                                     ; $7970: $5F
    ld   d, b                                     ; $7971: $50
    ld   hl, wShopItemList                        ; $7972: $21 $05 $C5
    add  hl, de                                   ; $7975: $19
    ld   a, [wItemPickedUpInShop]                 ; $7976: $FA $09 $C5
    ld   [hl], a                                  ; $7979: $77
    ld   de, wDrawCommand                         ; $797A: $11 $01 $D6
    call func_004_798B                            ; $797D: $CD $8B $79
    xor  a                                        ; $7980: $AF
    ld   [wItemPickedUpInShop], a                 ; $7981: $EA $09 $C5

jr_004_7984:
    ld   hl, wEntitiesStateTable                  ; $7984: $21 $90 $C2
    add  hl, bc                                   ; $7987: $09
    ld   [hl], $01                                ; $7988: $36 $01
    ret                                           ; $798A: $C9

func_004_798B::
    push de                                       ; $798B: $D5
    dec  a                                        ; $798C: $3D
    ld   d, a                                     ; $798D: $57
    sla  a                                        ; $798E: $CB $27
    ld   e, a                                     ; $7990: $5F
    sla  a                                        ; $7991: $CB $27
    sla  a                                        ; $7993: $CB $27
    add  e                                        ; $7995: $83
    add  d                                        ; $7996: $82
    ld   e, a                                     ; $7997: $5F
    ld   d, b                                     ; $7998: $50
    ld   hl, Data_004_7732                        ; $7999: $21 $32 $77
    add  hl, de                                   ; $799C: $19
    pop  de                                       ; $799D: $D1
    push bc                                       ; $799E: $C5
    ld   c, $0B                                   ; $799F: $0E $0B

.loop_79A1
    ld   a, [hl+]                                 ; $79A1: $2A
    ld   [de], a                                  ; $79A2: $12
    inc  de                                       ; $79A3: $13
    dec  c                                        ; $79A4: $0D
    jr   nz, .loop_79A1                           ; $79A5: $20 $FA

    xor  a                                        ; $79A7: $AF
    ld   [de], a                                  ; $79A8: $12
    pop  bc                                       ; $79A9: $C1
    ret                                           ; $79AA: $C9

jr_004_79AB:
    ld   a, [wItemPickedUpInShop]                 ; $79AB: $FA $09 $C5
    ld   e, a                                     ; $79AE: $5F
    cp   $02                                      ; $79AF: $FE $02
    jr   nz, .jr_79BB                             ; $79B1: $20 $08

    ld   a, [wC5A9]                               ; $79B3: $FA $A9 $C5
    and  a                                        ; $79B6: $A7
    jr   nz, jr_004_7A05                          ; $79B7: $20 $4C

    jr   jr_004_7A0C                              ; $79B9: $18 $51

.jr_79BB
    cp   $04                                      ; $79BB: $FE $04
    jr   nz, jr_004_79D9                          ; $79BD: $20 $1A

    ld   hl, wInventoryItems.BButtonSlot          ; $79BF: $21 $00 $DB
    ld   d, INVENTORY_SLOT_COUNT                  ; $79C2: $16 $0C

.loop_79C4
    ld   a, [hl+]                                 ; $79C4: $2A
    cp   INVENTORY_BOMBS                          ; $79C5: $FE $02
    jr   z, .jr_79CE                              ; $79C7: $28 $05

    dec  d                                        ; $79C9: $15
    jr   nz, .loop_79C4                           ; $79CA: $20 $F8

    jr   jr_004_7A0C                              ; $79CC: $18 $3E

.jr_79CE
    ld   a, [wBombCount]                          ; $79CE: $FA $4D $DB
    ld   hl, wMaxBombs                            ; $79D1: $21 $77 $DB
    cp   [hl]                                     ; $79D4: $BE
    jr   nc, jr_004_7A05                          ; $79D5: $30 $2E

    jr   jr_004_7A0C                              ; $79D7: $18 $33

jr_004_79D9:
    cp   $06                                      ; $79D9: $FE $06
    jr   nz, jr_004_79F7                          ; $79DB: $20 $1A

    ld   hl, wInventoryItems.BButtonSlot          ; $79DD: $21 $00 $DB
    ld   d, INVENTORY_SLOT_COUNT                  ; $79E0: $16 $0C

.loop_79E2
    ld   a, [hl+]                                 ; $79E2: $2A
    cp   INVENTORY_BOW                            ; $79E3: $FE $05
    jr   z, .jr_79EC                              ; $79E5: $28 $05

    dec  d                                        ; $79E7: $15
    jr   nz, .loop_79E2                           ; $79E8: $20 $F8

    jr   jr_004_7A0C                              ; $79EA: $18 $20

.jr_79EC
    ld   a, [wArrowCount]                         ; $79EC: $FA $45 $DB
    ld   hl, wMaxArrows                           ; $79EF: $21 $78 $DB
    cp   [hl]                                     ; $79F2: $BE
    jr   nc, jr_004_7A05                          ; $79F3: $30 $10

    jr   jr_004_7A0C                              ; $79F5: $18 $15

jr_004_79F7:
    cp   $03                                      ; $79F7: $FE $03
    jr   nz, jr_004_7A0C                          ; $79F9: $20 $11

    ld   hl, wInventoryItems.BButtonSlot          ; $79FB: $21 $00 $DB
    ld   d, INVENTORY_SLOT_COUNT                  ; $79FE: $16 $0C

jr_004_7A00:
    ld   a, [hl+]                                 ; $7A00: $2A
    cp   INVENTORY_SHIELD                         ; $7A01: $FE $04
    jr   nz, jr_004_7A09                          ; $7A03: $20 $04

jr_004_7A05:
    ld_dialog_low a, Dialog029 ; "Aye Caramba!"   ; $7A05: $3E $29
    jr   jr_004_7A24                              ; $7A07: $18 $1B

jr_004_7A09:
    dec  d                                        ; $7A09: $15
    jr   nz, jr_004_7A00                          ; $7A0A: $20 $F4

jr_004_7A0C:
    ld   d, b                                     ; $7A0C: $50
    ld   hl, Data_004_77D3                        ; $7A0D: $21 $D3 $77
    add  hl, de                                   ; $7A10: $19
    ld   a, [hl]                                  ; $7A11: $7E
    ld   hl, Data_004_77DC                        ; $7A12: $21 $DC $77
    add  hl, de                                   ; $7A15: $19
    ld   e, [hl]                                  ; $7A16: $5E
    ld   d, a                                     ; $7A17: $57
    ld   a, [wRupeeCountLow]                      ; $7A18: $FA $5E $DB
    sub  e                                        ; $7A1B: $93
    ld   a, [wRupeeCountHigh]                     ; $7A1C: $FA $5D $DB
    sbc  d                                        ; $7A1F: $9A
    jr   nc, jr_004_7A2E                          ; $7A20: $30 $0C

    ld_dialog_low a, Dialog034 ; "You don't have the Rupees" ; $7A22: $3E $34

jr_004_7A24:
    call OpenDialogInTable0                       ; $7A24: $CD $85 $23
    ld   hl, wEntitiesStateTable                  ; $7A27: $21 $90 $C2
    add  hl, bc                                   ; $7A2A: $09
    ld   [hl], $03                                ; $7A2B: $36 $03
    ret                                           ; $7A2D: $C9

jr_004_7A2E:
    ld   hl, wItemPickedUpInShop                  ; $7A2E: $21 $09 $C5
    ld   a, [hl]                                  ; $7A31: $7E
    push af                                       ; $7A32: $F5
    ld   [hl], $00                                ; $7A33: $36 $00
    ld   e, a                                     ; $7A35: $5F
    ld   d, b                                     ; $7A36: $50
    ld   hl, Data_004_77EE                        ; $7A37: $21 $EE $77
    add  hl, de                                   ; $7A3A: $19
    ld   a, [wSubstractRupeeBufferLow]            ; $7A3B: $FA $92 $DB
    add  [hl]                                     ; $7A3E: $86
    ld   [wSubstractRupeeBufferLow], a            ; $7A3F: $EA $92 $DB
    rl   a                                        ; $7A42: $CB $17
    ld   hl, Data_004_77E5                        ; $7A44: $21 $E5 $77
    add  hl, de                                   ; $7A47: $19
    rr   a                                        ; $7A48: $CB $1F
    ld   a, [wSubstractRupeeBufferHigh]           ; $7A4A: $FA $91 $DB
    adc  [hl]                                     ; $7A4D: $8E
    ld   [wSubstractRupeeBufferHigh], a           ; $7A4E: $EA $91 $DB
    ld   hl, wEntitiesStateTable                  ; $7A51: $21 $90 $C2
    add  hl, bc                                   ; $7A54: $09
    ld   [hl], $01                                ; $7A55: $36 $01
    pop  af                                       ; $7A57: $F1
    push af                                       ; $7A58: $F5
    call_open_dialog Dialog035                    ; $7A59
    pop  af                                       ; $7A5E: $F1

label_004_7A5F:                         ; @TODO What to do after buying a shopkeeper item
    dec  a                              ; (see: C505~C508 (what item is in each shop slot))
    JP_TABLE                            ; POI: The last 3 entries are not used (normally)
._00 dw boughtShovel                    ; 01  Shovel
._01 dw bought3Hearts                   ; 02  3 Hearts
._02 dw boughtShield                    ; 03  Shield
._03 dw bought10Bombs                   ; 04  10 Bombs
._04 dw boughtBow                       ; 05  Bow
._05 dw bought10Arrows                  ; 06  10 Arrows
._06 dw boughtOcarina                   ; 07  Ocarina
._07 dw boughtShop08                    ; 08  Guardian Acorn (in appearance only)
._08 dw boughtMedicine                  ; 09  Medicine

boughtBow:
    ld   d, INVENTORY_BOW                         ; $7A73: $16 $05
    call GiveInventoryItem_trampoline             ; $7A75: $CD $6B $3E
    ld   a, $20                                   ; $7A78: $3E $20
    ld   [wArrowCount], a                         ; $7A7A: $EA $45 $DB
    ret                                           ; $7A7D: $C9

bought10Arrows:
    ld   a, [wArrowCount]                         ; $7A7E: $FA $45 $DB
    add  $0A                                      ; $7A81: $C6 $0A
    daa                                           ; $7A83: $27
    jr   nc, .jr_7A88                             ; $7A84: $30 $02

    ld   a, $99                                   ; POI: ?? Checks for going over 99 (normal max 60)?

.jr_7A88
    ld   [wArrowCount], a                         ; $7A88: $EA $45 $DB
    ret                                           ; $7A8B: $C9

boughtOcarina:
    ld   d, INVENTORY_OCARINA                     ; $7A8C: $16 $09
    jp   GiveInventoryItem_trampoline             ; $7A8E: $C3 $6B $3E

boughtShop08:                           ; POI: Appears as a guardian acorn, but...???
    ld   a, [wDB47]                     ; Add 10 to DB47 (?)
    add  $0A                            ; This code is similar to that for adding bought arrows
    daa                                 ; But DB47 isn't one of those (?)
    jr   nc, .jr_7A9B                ; Still attempts to cap to 99

    ld   a, $99                         ; ????????

.jr_7A9B
    ld   [wDB47], a                               ; $7A9B: $EA $47 $DB
    ret                                           ; $7A9E: $C9

boughtMedicine:
    ld   a, [wHasMedicine]              ; POI: Medicine not bought in shops, and not tracked like this
    add  $01                            ; Adds one to value with BCD
    daa                                           ; $7AA4: $27
    ld   [wHasMedicine], a                        ; $7AA5: $EA $0D $DB
    ret                                           ; $7AA8: $C9

boughtShovel:
    ld   d, INVENTORY_SHOVEL                      ; $7AA9: $16 $0B
    jp   GiveInventoryItem_trampoline             ; $7AAB: $C3 $6B $3E

bought10Bombs:
    ld   a, [wBombCount]                          ; $7AAE: $FA $4D $DB
    add  $0A                                      ; $7AB1: $C6 $0A
    daa                                           ; $7AB3: $27
    jr   nc, .jr_7AB8                             ; $7AB4: $30 $02

    ld   a, $99                                   ; $7AB6: $3E $99

.jr_7AB8
    ld   [wBombCount], a                          ; $7AB8: $EA $4D $DB
    ld   d, INVENTORY_BOMBS                       ; $7ABB: $16 $02
    jp   GiveInventoryItem_trampoline             ; $7ABD: $C3 $6B $3E

; POI: Dead code??? Seems to give 10 arrows, then gives you Magic Powder too (!?)
    ld   a, [wArrowCount]                         ; ???????????????????
    add  $0A                                      ; $7AC3: $C6 $0A
    daa                                           ; $7AC5: $27
    jr   nc, .jr_7ACA                             ; $7AC6: $30 $02

    ld   a, $99                                   ; $7AC8: $3E $99

.jr_7ACA
    ld   [wArrowCount], a                         ; $7ACA: $EA $45 $DB
    ld   d, INVENTORY_MAGIC_POWDER                ; $7ACD: $16 $0C
    jp   GiveInventoryItem_trampoline             ; $7ACF: $C3 $6B $3E

bought3Hearts:
    ld   a, 3 FULL_HEARTS                         ; $7AD2: $3E $18
    ld   [wAddHealthBuffer], a                    ; $7AD4: $EA $93 $DB
    ret                                           ; $7AD7: $C9

boughtShield::
    ld   d, INVENTORY_SHIELD                      ; $7AD8: $16 $04
    jp   GiveInventoryItem_trampoline             ; $7ADA: $C3 $6B $3E

func_004_7ADD::
    ld   a, [wDialogState]                        ; $7ADD: $FA $9F $C1
    and  a                                        ; $7AE0: $A7
    ret  nz                                       ; $7AE1: $C0

    jp   label_004_796D                           ; $7AE2: $C3 $6D $79

Data_004_7AE5:: ; @TODO Palette data
    db   $33, $62, $1A, $01, $FF, $0F, $FF, $7F

func_004_7AED::
    ld   a, [wDialogState]                        ; $7AED: $FA $9F $C1
    and  a                                        ; $7AF0: $A7
    jr   nz, ret_004_7B3F                         ; $7AF1: $20 $4C

    ld   a, ENTITY_MAD_BATTER                     ; $7AF3: $3E $CA
    call SpawnNewEntity_trampoline                ; $7AF5: $CD $86 $3B
    ld   a, NOISE_SFX_ELECTRIC_BEAM               ; $7AF8: $3E $26
    ldh  [hNoiseSfx], a                           ; $7AFA: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $7AFC: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7AFE: $21 $00 $C2
    add  hl, de                                   ; $7B01: $19
    ld   [hl], a                                  ; $7B02: $77
    ldh  a, [hMultiPurpose1]                      ; $7B03: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7B05: $21 $10 $C2
    add  hl, de                                   ; $7B08: $19
    ld   [hl], a                                  ; $7B09: $77
    ld   hl, wEntitiesPrivateState3Table          ; $7B0A: $21 $D0 $C2
    add  hl, de                                   ; $7B0D: $19
    ld   [hl], $01                                ; $7B0E: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $7B10: $21 $E0 $C2
    add  hl, de                                   ; $7B13: $19
    ld   [hl], $C0                                ; $7B14: $36 $C0
    call GetEntityTransitionCountdown             ; $7B16: $CD $05 $0C
    ld   [hl], $C0                                ; $7B19: $36 $C0
    call IncrementEntityState                     ; $7B1B: $CD $12 $3B
    xor  a                                        ; $7B1E: $AF
    ld   [wHasMedicine], a                        ; $7B1F: $EA $0D $DB
    ld   a, $FF                                   ; $7B22: $3E $FF
    ld   [wSubtractHealthBuffer], a               ; $7B24: $EA $94 $DB
    ldh  a, [hIsGBC]                              ; $7B27: $F0 $FE
    and  a                                        ; $7B29: $A7
    jr   z, ret_004_7B3F                          ; $7B2A: $28 $13

    ld   hl, wObjPal8                             ; $7B2C: $21 $88 $DC
    ld   de, Data_004_7AE5                        ; $7B2F: $11 $E5 $7A

.loop_7B32
    ld   a, [de]                                  ; $7B32: $1A
    ld   [hl+], a                                 ; $7B33: $22
    inc  de                                       ; $7B34: $13
    ld   a, l                                     ; $7B35: $7D
    and  $07                                      ; $7B36: $E6 $07
    jr   nz, .loop_7B32                           ; $7B38: $20 $F8

    ld   a, $02                                   ; $7B3A: $3E $02
    ld   [wPaletteDataFlags], a                   ; $7B3C: $EA $D1 $DD

ret_004_7B3F:
    ret                                           ; $7B3F: $C9

func_004_7B40::
    ld   a, $02                                   ; $7B40: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7B42: $E0 $A1
    call GetEntityTransitionCountdown             ; $7B44: $CD $05 $0C
    ret  nz                                       ; $7B47: $C0

    ld   a, [wHealth]                             ; $7B48: $FA $5A $DB
    and  a                                        ; $7B4B: $A7
    ret  nz                                       ; $7B4C: $C0

    ld   [wHasStolenFromShop], a                  ; $7B4D: $EA $46 $DB
    ld   [wBlockItemUsage], a                     ; $7B50: $EA $0A $C5
    jp   ClearEntityStatusBank04                  ; $7B53: $C3 $7A $6D ; 6D is double used also as data in Data_004_7B55

Data_004_7B56::
    db   $1D, $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; overlaps with the next list
Unknown091SpriteVariants::
.variant0
    db $5D, OAM_GBC_PAL_5 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP

Data_004_7B5A::
    db $96, OAM_GBC_PAL_7 | OAMF_PAL1
    db $A8, OAM_GBC_PAL_4 | OAMF_PAL1
    db $86, OAM_GBC_PAL_7 | OAMF_PAL1
    db $80, OAM_GBC_PAL_7 | OAMF_PAL1
    db $88, OAM_GBC_PAL_6 | OAMF_PAL1
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
    db $90, OAM_GBC_PAL_0 | OAMF_PAL1
    db $AE, OAM_GBC_PAL_0 | OAMF_PAL1
    db $A0, OAM_GBC_PAL_0 | OAMF_PAL1
    db $2A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP
    db $2A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

func_004_7B70::
    ld   a, $04                                   ; $7B70: $3E $04

jr_004_7B72:
    ldh  [hFreeWarpDataAddress], a                ; $7B72: $E0 $E6
    ld   e, a                                     ; $7B74: $5F
    ld   d, b                                     ; $7B75: $50
    ld   hl, wShopItemList - 1                    ; $7B76: $21 $04 $C5
    add  hl, de                                   ; $7B79: $19
    ld   a, [hl]                                  ; $7B7A: $7E
    and  a                                        ; $7B7B: $A7
    jr   z, jr_004_7BAC                           ; $7B7C: $28 $2E

    dec  a                                        ; $7B7E: $3D
    ldh  [hActiveEntitySpriteVariant], a          ; $7B7F: $E0 $F1
    ld   hl, Data_004_7B56 -1                     ; $7B81: $21 $55 $7B
    ldh  a, [hFreeWarpDataAddress]                ; $7B84: $F0 $E6
    ld   e, a                                     ; $7B86: $5F
    add  hl, de                                   ; $7B87: $19
    ld   a, [hl]                                  ; $7B88: $7E
    ldh  [hActiveEntityPosX], a                   ; $7B89: $E0 $EE
    ld   a, $32                                   ; $7B8B: $3E $32
    ldh  [hActiveEntityVisualPosY], a             ; $7B8D: $E0 $EC
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B8F: $F0 $F1
    cp   $01                                      ; $7B91: $FE $01
    jr   nz, .jr_7B9A                             ; $7B93: $20 $05

    ld   hl, hActiveEntityVisualPosY              ; $7B95: $21 $EC $FF
    ld   [hl], $2F                                ; $7B98: $36 $2F

.jr_7B9A
    cp   $05                                      ; $7B9A: $FE $05
    jr   nz, .jr_7BA6                             ; $7B9C: $20 $08

    ld   de, Unknown091SpriteVariants             ; $7B9E: $11 $58 $7B
    call RenderActiveEntitySpritesPair            ; $7BA1: $CD $C0 $3B
    jr   jr_004_7BAC                              ; $7BA4: $18 $06

.jr_7BA6
    ld   de, Data_004_7B5A                        ; $7BA6: $11 $5A $7B
    call RenderActiveEntitySprite                 ; $7BA9: $CD $77 $3C

jr_004_7BAC:
    ldh  a, [hFreeWarpDataAddress]                ; $7BAC: $F0 $E6
    dec  a                                        ; $7BAE: $3D
    jr   nz, jr_004_7B72                          ; $7BAF: $20 $C1

    call func_004_7BB7                            ; $7BB1: $CD $B7 $7B
    jp   CopyEntityPositionToActivePosition       ; $7BB4: $C3 $8A $3D

func_004_7BB7::
    ld   a, [wItemPickedUpInShop]                 ; $7BB7: $FA $09 $C5
    and  a                                        ; $7BBA: $A7
    ret  z                                        ; $7BBB: $C8

    dec  a                                        ; $7BBC: $3D
    ldh  [hActiveEntitySpriteVariant], a          ; $7BBD: $E0 $F1
    ld   a, $01                                   ; $7BBF: $3E $01
    ld   [wIsCarryingLiftedObject], a             ; $7BC1: $EA $5C $C1
    call ResetSpinAttack                          ; $7BC4: $CD $AF $0C
    ldh  a, [hLinkPositionX]                      ; $7BC7: $F0 $98
    ldh  [hActiveEntityPosX], a                   ; $7BC9: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $7BCB: $F0 $99
    sub  $0E                                      ; $7BCD: $D6 $0E
    ldh  [hActiveEntityVisualPosY], a             ; $7BCF: $E0 $EC
    ldh  a, [hActiveEntitySpriteVariant]          ; $7BD1: $F0 $F1
    cp   $05                                      ; $7BD3: $FE $05
    jr   nz, .jr_7BDD                             ; $7BD5: $20 $06

    ld   de, Unknown091SpriteVariants             ; $7BD7: $11 $58 $7B
    jp   RenderActiveEntitySpritesPair            ; $7BDA: $C3 $C0 $3B

.jr_7BDD
    ld   de, Data_004_7B5A                        ; $7BDD: $11 $5A $7B
    jp   RenderActiveEntitySprite                 ; $7BE0: $C3 $77 $3C

; Disallow Link going through a solid object
PushLinkOutOfEntity_04::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7BE3: $CD $5A $3B
    jr   nc, .ret_7C05                            ; $7BE6: $30 $1D

    call CopyLinkFinalPositionToPosition          ; $7BE8: $CD $BE $0C
    call ResetPegasusBoots                        ; $7BEB: $CD $B6 $0C
    ld   a, [wC1A6]                               ; $7BEE: $FA $A6 $C1
    and  a                                        ; $7BF1: $A7
    jr   z, .ret_7C05                             ; $7BF2: $28 $11

    ld   e, a                                     ; $7BF4: $5F
    ld   d, b                                     ; $7BF5: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7BF6: $21 $9F $C3
    add  hl, de                                   ; $7BF9: $19
    ld   a, [hl]                                  ; $7BFA: $7E
    cp   $03                                      ; $7BFB: $FE $03
    jr   nz, .ret_7C05                            ; $7BFD: $20 $06

    ld   hl, wEntitiesStatusTable+15              ; $7BFF: $21 $8F $C2
    add  hl, de                                   ; $7C02: $19
    ld   [hl], $00                                ; $7C03: $36 $00

.ret_7C05
    ret                                           ; $7C05: $C9

func_004_7C06::
    ldh  a, [hLinkPositionX]                      ; $7C06: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7C08: $21 $EE $FF
    sub  [hl]                                     ; $7C0B: $96
    add  $20                                      ; $7C0C: $C6 $20
    cp   $30                                      ; $7C0E: $FE $30
    jr   nc, .jr_7C49                             ; $7C10: $30 $37

    ldh  a, [hLinkPositionY]                      ; $7C12: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7C14: $21 $EF $FF
    sub  [hl]                                     ; $7C17: $96
    add  $10                                      ; $7C18: $C6 $10
    cp   $20                                      ; $7C1A: $FE $20
    jr   nc, .jr_7C49                             ; $7C1C: $30 $2B

    call func_004_6E55                            ; $7C1E: $CD $55 $6E
    ldh  a, [hLinkDirection]                      ; $7C21: $F0 $9E
    xor  $01                                      ; $7C23: $EE $01
    cp   e                                        ; $7C25: $BB
    jr   nz, .jr_7C49                             ; $7C26: $20 $21

    ld   hl, wItemUsageContext                    ; $7C28: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7C2B: $36 $01
    ld   a, [wDialogState]                        ; $7C2D: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7C30: $21 $4F $C1
    or   [hl]                                     ; $7C33: $B6
    ld   hl, wDialogCooldown                      ; $7C34: $21 $34 $C1
    or   [hl]                                     ; $7C37: $B6
    jr   nz, .jr_7C49                             ; $7C38: $20 $0F

    ld   a, [wWindowY]                            ; $7C3A: $FA $9A $DB
    cp   $80                                      ; $7C3D: $FE $80
    jr   nz, .jr_7C49                             ; $7C3F: $20 $08

    ldh  a, [hJoypadState]                        ; $7C41: $F0 $CC
    and  J_A                                      ; $7C43: $E6 $10
    jr   z, .jr_7C49                              ; $7C45: $28 $02

    scf                                           ; $7C47: $37
    ret                                           ; $7C48: $C9

.jr_7C49
    and  a                                        ; $7C49: $A7
    ret                                           ; $7C4A: $C9
