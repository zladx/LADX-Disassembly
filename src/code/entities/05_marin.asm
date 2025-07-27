; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinIndoorSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinCreditsSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant8
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant9
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant10
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

Data_005_4E56::
    db   $08, $08, $08, $09, $0A, $0A, $0A, $09

Data_005_4E5E::
    db   $08, $F8

Data_005_4E60::
    db   $06, $01

MarinEntityHandler::
    ld   a, [wGameplayType]                       ;; 05:4E62 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 05:4E65 $FE $01
    jp   z, .renderSinging                        ;; 05:4E67 $CA $E0 $4E

    ; Marin is handled by the follower system: remove the entity
    ld   a, [wIsMarinFollowingLink]               ;; 05:4E6A $FA $73 $DB
    and  a                                        ;; 05:4E6D $A7
    jp   nz, ClearEntityStatus_05                 ;; 05:4E6E $C2 $4B $7B

    ; Marin is indoor
    ld   a, [wIsIndoor]                           ;; 05:4E71 $FA $A5 $DB
    and  a                                        ;; 05:4E74 $A7
    jp   nz, MarinEntityHandler_Indoor            ;; 05:4E75 $C2 $CE $51

    ; Didn't find sword yet: remove the outdoor entity
    ld   a, [wSwordLevel]                         ;; 05:4E78 $FA $4E $DB
    and  a                                        ;; 05:4E7B $A7
    jp   z, ClearEntityStatus_05                  ;; 05:4E7C $CA $4B $7B

    ; Not in a village, saved Marin and found the Pineapple: remove the outdoor entity
    ldh  a, [hMapRoom]                            ;; 05:4E7F $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:4E81 $FE $C0
    jr   c, .notInAnyVillage                      ;; 05:4E83 $38 $02
    jr   .villagesEnd                             ;; 05:4E85 $18 $0F
.notInAnyVillage
    ld   a, [wOverworldRoomStatus + ROOM_OW_MARIN_BRIDGE] ;; 05:4E87 $FA $08 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 05:4E8A $E6 $10
    jr   nz, .villagesEnd                         ;; 05:4E8C $20 $08
    ld   a, [wTradeSequenceItem]                  ;; 05:4E8E $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ;; 05:4E91 $FE $07
    jp   nc, ClearEntityStatus_05                 ;; 05:4E93 $D2 $4B $7B
.villagesEnd

    push bc                                       ;; 05:4E96 $C5
    sla  c                                        ;; 05:4E97 $CB $21
    rl   b                                        ;; 05:4E99 $CB $10
    sla  c                                        ;; 05:4E9B $CB $21
    rl   b                                        ;; 05:4E9D $CB $10
    ld   hl, wEntitiesHitboxPositionTable         ;; 05:4E9F $21 $80 $D5
    add  hl, bc                                   ;; 05:4EA2 $09
    inc  hl                                       ;; 05:4EA3 $23
    inc  hl                                       ;; 05:4EA4 $23
    ld   [hl], $08                                ;; 05:4EA5 $36 $08
    inc  hl                                       ;; 05:4EA7 $23
    ld   [hl], $0B                                ;; 05:4EA8 $36 $0B
    pop  bc                                       ;; 05:4EAA $C1
    ldh  a, [hFrameCounter]                       ;; 05:4EAB $F0 $E7
    and  $1F                                      ;; 05:4EAD $E6 $1F
    jr   nz, .jr_4ED1                             ;; 05:4EAF $20 $20

    ld   hl, wEntitiesDirectionTable              ;; 05:4EB1 $21 $80 $C3
    add  hl, bc                                   ;; 05:4EB4 $09
    ld   [hl], $03                                ;; 05:4EB5 $36 $03
    call GetEntityToLinkPositionDeltaX_05         ;; 05:4EB7 $CD $04 $7B
    add  $14                                      ;; 05:4EBA $C6 $14
    cp   $28                                      ;; 05:4EBC $FE $28
    jr   nc, .jr_4ED1                             ;; 05:4EBE $30 $11

    call GetEntityToLinkPositionDeltaY_05         ;; 05:4EC0 $CD $14 $7B
    add  $14                                      ;; 05:4EC3 $C6 $14
    cp   $28                                      ;; 05:4EC5 $FE $28
    jr   nc, .jr_4ED1                             ;; 05:4EC7 $30 $08

    call GetEntityDirectionToLink_05              ;; 05:4EC9 $CD $24 $7B
    ld   hl, wEntitiesDirectionTable              ;; 05:4ECC $21 $80 $C3
    add  hl, bc                                   ;; 05:4ECF $09
    ld   [hl], e                                  ;; 05:4ED0 $73
.jr_4ED1

    ;
    ; Spawn music notes when Marin is singing
    ;

    call SetEntityVariantForDirection_05          ;; 05:4ED1 $CD $EA $54
    ld   a, [wIsMarinSinging]                     ;; 05:4ED4 $FA $C8 $C3
    cp   $01                                      ;; 05:4ED7 $FE $01
    jr   nz, .singingEnd                          ;; 05:4ED9 $20 $5E

    call GetEntityPrivateCountdown1               ;; 05:4EDB $CD $00 $0C
    jr   nz, .singingEnd                          ;; 05:4EDE $20 $59

.renderSinging
    ldh  a, [hFrameCounter]                       ;; 05:4EE0 $F0 $E7
    rra                                           ;; 05:4EE2 $1F
    rra                                           ;; 05:4EE3 $1F
    rra                                           ;; 05:4EE4 $1F
    rra                                           ;; 05:4EE5 $1F
    and  $07                                      ;; 05:4EE6 $E6 $07
    ld   e, a                                     ;; 05:4EE8 $5F
    ld   d, b                                     ;; 05:4EE9 $50
    ld   hl, Data_005_4E56                        ;; 05:4EEA $21 $56 $4E
    add  hl, de                                   ;; 05:4EED $19
    ld   a, [hl]                                  ;; 05:4EEE $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:4EEF $E0 $F1
    ldh  a, [hFrameCounter]                       ;; 05:4EF1 $F0 $E7
    add  $10                                      ;; 05:4EF3 $C6 $10
    and  $1F                                      ;; 05:4EF5 $E6 $1F
    jr   nz, .singingEnd                          ;; 05:4EF7 $20 $40

    ld   a, ENTITY_MUSICAL_NOTE                   ;; 05:4EF9 $3E $C9
    call SpawnNewEntity_trampoline                ;; 05:4EFB $CD $86 $3B
    jr   c, .singingEnd                           ;; 05:4EFE $38 $39

    ldh  a, [hMultiPurpose1]                      ;; 05:4F00 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:4F02 $21 $10 $C2
    add  hl, de                                   ;; 05:4F05 $19
    sub  $08                                      ;; 05:4F06 $D6 $08
    ld   [hl], a                                  ;; 05:4F08 $77
    push bc                                       ;; 05:4F09 $C5
    ldh  a, [hFrameCounter]                       ;; 05:4F0A $F0 $E7
    add  $10                                      ;; 05:4F0C $C6 $10
    rra                                           ;; 05:4F0E $1F
    rra                                           ;; 05:4F0F $1F
    rra                                           ;; 05:4F10 $1F
    rra                                           ;; 05:4F11 $1F
    rra                                           ;; 05:4F12 $1F
    and  $01                                      ;; 05:4F13 $E6 $01
    ld   c, a                                     ;; 05:4F15 $4F
    ld   hl, Data_005_4E5E                        ;; 05:4F16 $21 $5E $4E
    add  hl, bc                                   ;; 05:4F19 $09
    ldh  a, [hMultiPurpose0]                      ;; 05:4F1A $F0 $D7
    add  [hl]                                     ;; 05:4F1C $86
    ld   hl, wEntitiesPosXTable                   ;; 05:4F1D $21 $00 $C2
    add  hl, de                                   ;; 05:4F20 $19
    ld   [hl], a                                  ;; 05:4F21 $77
    ld   hl, Data_005_4E60                        ;; 05:4F22 $21 $60 $4E
    add  hl, bc                                   ;; 05:4F25 $09
    ld   a, [hl]                                  ;; 05:4F26 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:4F27 $21 $40 $C2
    add  hl, de                                   ;; 05:4F2A $19
    ld   [hl], a                                  ;; 05:4F2B $77
    ld   hl, wEntitiesSpeedYTable                 ;; 05:4F2C $21 $50 $C2
    add  hl, de                                   ;; 05:4F2F $19
    ld   [hl], $FC                                ;; 05:4F30 $36 $FC
    ld   hl, wEntitiesInertiaTable                ;; 05:4F32 $21 $D0 $C3
    add  hl, de                                   ;; 05:4F35 $19
    ld   [hl], $40                                ;; 05:4F36 $36 $40
    pop  bc                                       ;; 05:4F38 $C1
.singingEnd

    ; Save Marin's entity index
    ld   a, c                                     ;; 05:4F39 $79
    ld   [wMarinEntityIndex], a                   ;; 05:4F3A $EA $0F $C5

    ; Render Marin
    ld   de, MarinCreditsSpriteVariants           ;; 05:4F3D $11 $2A $4E
    call RenderActiveEntitySpritesPair            ;; 05:4F40 $CD $C0 $3B

    ; Do physics
    call PushLinkOutOfEntity_05                   ;; 05:4F43 $CD $C3 $54

    ;
    ; Do behavior
    ;

    ld   a, [wGameplayType]                       ;; 05:4F46 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 05:4F49 $FE $07
    ret  z                                        ;; 05:4F4B $C8

    cp   GAMEPLAY_WORLD                           ;; 05:4F4C $FE $0B
    ret  nz                                       ;; 05:4F4E $C0

    ld   a, [wTransitionSequenceCounter]          ;; 05:4F4F $FA $6B $C1
    cp   $04                                      ;; 05:4F52 $FE $04
    ret  nz                                       ;; 05:4F54 $C0

    ldh  a, [hActiveEntityState]                  ;; 05:4F55 $F0 $F0
    JP_TABLE                                      ;; 05:4F57
._00 dw func_005_4F64                             ;; 05:4F58
._01 dw func_005_5020                             ;; 05:4F5A
._02 dw func_005_5059                             ;; 05:4F5C
._03 dw func_005_512B                             ;; 05:4F5E
._04 dw func_005_5161                             ;; 05:4F60
._05 dw func_005_51BC                             ;; 05:4F62

func_005_4F64::
    ldh  a, [hMapRoom]                            ;; 05:4F64 $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:4F66 $FE $C0
    jr   nc, .jr_4F6F                             ;; 05:4F68 $30 $05

    ld   a, [wIsMarinSinging]                     ;; 05:4F6A $FA $C8 $C3
    and  a                                        ;; 05:4F6D $A7
    ret  nz                                       ;; 05:4F6E $C0

.jr_4F6F
    call ShouldLinkTalkToEntity_05                ;; 05:4F6F $CD $06 $55
    ret  nc                                       ;; 05:4F72 $D0

    ld   a, [wOverworldRoomStatus + $08]          ;; 05:4F73 $FA $08 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 05:4F76 $E6 $10
    jr   z, .jr_005_4FA7                          ;; 05:4F78 $28 $2D

    ld   hl, wOverworldRoomStatus + $92           ;; 05:4F7A $21 $92 $D8
    ld   a, [hl]                                  ;; 05:4F7D $7E
    and  OW_ROOM_STATUS_UNKNOWN                   ;; 05:4F7E $E6 $40
    jr   nz, .jr_4F89                             ;; 05:4F80 $20 $07

    set  OW_ROOM_STATUS_FLAG_UNKNOWN_6, [hl]      ;; 05:4F82 $CB $F6
    jp_open_dialog Dialog194                      ;; 05:4F84

.jr_4F89
    ld   a, [wOcarinaSongFlags]                   ;; 05:4F89 $FA $49 $DB
    and  BALLAD_OF_THE_WIND_FISH_FLAG             ;; 05:4F8C $E6 $04
    jr   z, .jr_005_4F95                          ;; 05:4F8E $28 $05

.jr_005_4F90
    jp_open_dialog Dialog195                      ;; 05:4F90

.jr_005_4F95
    ld   e, INVENTORY_SLOT_COUNT - 1              ;; 05:4F95 $1E $0B
    ld   hl, wInventoryItems.BButtonSlot          ;; 05:4F97 $21 $00 $DB

.loop_4F9A
    ld   a, [hl+]                                 ;; 05:4F9A $2A
    cp   INVENTORY_OCARINA                        ;; 05:4F9B $FE $09
    jr   z, .jr_005_4FA7                          ;; 05:4F9D $28 $08

    dec  e                                        ;; 05:4F9F $1D
    ld   a, e                                     ;; 05:4FA0 $7B
    cp   $FF                                      ;; 05:4FA1 $FE $FF
    jr   nz, .loop_4F9A                           ;; 05:4FA3 $20 $F5

    jr   .jr_005_4F90                             ;; 05:4FA5 $18 $E9

.jr_005_4FA7
    call GetEntityPrivateCountdown1               ;; 05:4FA7 $CD $00 $0C
    ld   [hl], $10                                ;; 05:4FAA $36 $10

.jr_4FAC
    ld   d, $2F                                   ;; 05:4FAC $16 $2F
    ld_dialog_low e, Dialog003                    ;; 05:4FAE $1E $03
    ld   a, [wTarinFlag]                          ;; 05:4FB0 $FA $48 $DB
    and  a                                        ;; 05:4FB3 $A7
    jr   z, .openDialog                           ;; 05:4FB4 $28 $45

    ld   e, $06                                   ;; 05:4FB6 $1E $06
    cp   $02                                      ;; 05:4FB8 $FE $02
    jr   nz, .jr_4FD0                             ;; 05:4FBA $20 $14

    ld   e, $05                                   ;; 05:4FBC $1E $05
    ldh  a, [hMapRoom]                            ;; 05:4FBE $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:4FC0 $FE $C0
    jr   c, .jr_4FD0                              ;; 05:4FC2 $38 $0C

    push de                                       ;; 05:4FC4 $D5
    call label_27DD                               ;; 05:4FC5 $CD $DD $27
    pop  de                                       ;; 05:4FC8 $D1
    ld   hl, wEntitiesPrivateState3Table          ;; 05:4FC9 $21 $D0 $C2
    add  hl, bc                                   ;; 05:4FCC $09
    ld   [hl], b                                  ;; 05:4FCD $70
    ld   e, $92                                   ;; 05:4FCE $1E $92

.jr_4FD0
    push bc                                       ;; 05:4FD0 $C5
    ld   c, INVENTORY_SLOT_COUNT - 1              ;; 05:4FD1 $0E $0B
    ld   hl, wInventoryItems.BButtonSlot          ;; 05:4FD3 $21 $00 $DB

.jr_005_4FD6
    ld   a, [hl+]                                 ;; 05:4FD6 $2A
    cp   INVENTORY_OCARINA                        ;; 05:4FD7 $FE $09
    jr   nz, .jr_4FF4                             ;; 05:4FD9 $20 $19

    ld_dialog_low e, Dialog004 ; "Nice ocarina!"  ;; 05:4FDB $1E $04
    ld   d, $4A                                   ;; 05:4FDD $16 $4A
    ld   a, [wOcarinaSongFlags]                   ;; 05:4FDF $FA $49 $DB
    and  BALLAD_OF_THE_WIND_FISH_FLAG             ;; 05:4FE2 $E6 $04
    jr   z, .jr_005_4FFA                          ;; 05:4FE4 $28 $14

    ld_dialog_low e, Dialog005 ; "I just love to sing!" ;; 05:4FE6 $1E $05
    ld   d, $2F                                   ;; 05:4FE8 $16 $2F
    ldh  a, [hMapRoom]                            ;; 05:4FEA $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:4FEC $FE $C0
    jr   c, .jr_005_4FFA                          ;; 05:4FEE $38 $0A

    ld_dialog_low e, Dialog192 ; "I often come to this village" ;; 05:4FF0 $1E $92
    jr   .jr_005_4FFA                             ;; 05:4FF2 $18 $06

.jr_4FF4
    dec  c                                        ;; 05:4FF4 $0D
    ld   a, c                                     ;; 05:4FF5 $79
    cp   $FF                                      ;; 05:4FF6 $FE $FF
    jr   nz, .jr_005_4FD6                         ;; 05:4FF8 $20 $DC

.jr_005_4FFA
    pop  bc                                       ;; 05:4FFA $C1

.openDialog
    ld   a, e                                     ;; 05:4FFB $7B
    cp   $80                                      ;; 05:4FFC $FE $80
    jr   c, .openDialogInTable0                   ;; 05:4FFE $38 $05
    call OpenDialogInTable1                       ;; 05:5000 $CD $73 $23
    jr   .openDialogEnd                           ;; 05:5003 $18 $03
.openDialogInTable0
    call OpenDialogInTable0                       ;; 05:5005 $CD $85 $23
.openDialogEnd

    ldh  a, [hMapRoom]                            ;; 05:5008 $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:500A $FE $C0
    jr   c, .jr_5018                              ;; 05:500C $38 $0A

    ld   hl, wEntitiesPrivateState3Table          ;; 05:500E $21 $D0 $C2
    add  hl, bc                                   ;; 05:5011 $09
    ld   [hl], b                                  ;; 05:5012 $70
    push de                                       ;; 05:5013 $D5
    call label_27DD                               ;; 05:5014 $CD $DD $27
    pop  de                                       ;; 05:5017 $D1

.jr_5018
    ld   hl, wEntitiesPrivateState4Table          ;; 05:5018 $21 $40 $C4
    add  hl, bc                                   ;; 05:501B $09
    ld   [hl], d                                  ;; 05:501C $72
    jp   IncrementEntityState                     ;; 05:501D $C3 $12 $3B

func_005_5020::
    call ReturnIfNonInteractive_05                ;; 05:5020 $CD $3A $7A
    ld   hl, wEntitiesPrivateState4Table          ;; 05:5023 $21 $40 $C4
    add  hl, bc                                   ;; 05:5026 $09
    ld   d, [hl]                                  ;; 05:5027 $56
    ld   hl, wEntitiesPrivateState3Table          ;; 05:5028 $21 $D0 $C2
    add  hl, bc                                   ;; 05:502B $09
    ld   a, [hl]                                  ;; 05:502C $7E
    and  a                                        ;; 05:502D $A7
    ld   a, d                                     ;; 05:502E $7A
    jr   nz, .jr_503E                             ;; 05:502F $20 $0D

    inc  [hl]                                     ;; 05:5031 $34
    ld   [wMusicTrackToPlay], a                   ;; 05:5032 $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ;; 05:5035 $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ;; 05:5037 $E0 $BD
    ld   hl, wIsMarinSinging                      ;; 05:5039 $21 $C8 $C3
    ld   [hl], $01                                ;; 05:503C $36 $01

.jr_503E
    cp   $4A                                      ;; 05:503E $FE $4A
    jr   nz, .jr_5054                             ;; 05:5040 $20 $12

    ld   a, [wOcarinaSongFlags]                   ;; 05:5042 $FA $49 $DB
    and  BALLAD_OF_THE_WIND_FISH_FLAG             ;; 05:5045 $E6 $04
    jr   nz, .jr_5054                             ;; 05:5047 $20 $0B

    call IncrementEntityState                     ;; 05:5049 $CD $12 $3B
    xor  a                                        ;; 05:504C $AF
    ld   [wD210], a                               ;; 05:504D $EA $10 $D2
    ld   [wD211], a                               ;; 05:5050 $EA $11 $D2
    ret                                           ;; 05:5053 $C9

.jr_5054
    call IncrementEntityState                     ;; 05:5054 $CD $12 $3B
    ld   [hl], b                                  ;; 05:5057 $70

func_005_5058::
    ret                                           ;; 05:5058 $C9

func_005_5059::
    ld   a, $02                                   ;; 05:5059 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:505B $E0 $A1
    ld   [wC167], a                               ;; 05:505D $EA $67 $C1
    push bc                                       ;; 05:5060 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 05:5061 $CD $F0 $0B
    pop  bc                                       ;; 05:5064 $C1
    ld   a, [wD211]                               ;; 05:5065 $FA $11 $D2
    cp   $07                                      ;; 05:5068 $FE $07
    jr   nz, .jr_508A                             ;; 05:506A $20 $1E

    ld   a, [wD210]                               ;; 05:506C $FA $10 $D2
    cp   $E8                                      ;; 05:506F $FE $E8
    jr   nz, .jr_508A                             ;; 05:5071 $20 $17

    call_open_dialog Dialog016 ; "How do you like it?" ;; 05:5073 $3E $16 $CD $85 $23
    push bc                                       ;; 05:5078 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 05:5079 $CD $F0 $0B
    pop  bc                                       ;; 05:507C $C1
    xor  a                                        ;; 05:507D $AF
    ld   [wD210], a                               ;; 05:507E $EA $10 $D2
    ld   [wD211], a                               ;; 05:5081 $EA $11 $D2
    call label_27F2                               ;; 05:5084 $CD $F2 $27
    jp   IncrementEntityState                     ;; 05:5087 $C3 $12 $3B

.jr_508A
    call GetEntityDirectionToLink_05              ;; 05:508A $CD $24 $7B
    ld   a, e                                     ;; 05:508D $7B
    xor  $01                                      ;; 05:508E $EE $01
    ldh  [hLinkDirection], a                      ;; 05:5090 $E0 $9E
    ld   a, [wD210]                               ;; 05:5092 $FA $10 $D2
    add  $01                                      ;; 05:5095 $C6 $01
    ld   [wD210], a                               ;; 05:5097 $EA $10 $D2
    ld   e, a                                     ;; 05:509A $5F
    ld   a, [wD211]                               ;; 05:509B $FA $11 $D2
    adc  $00                                      ;; 05:509E $CE $00
    ld   [wD211], a                               ;; 05:50A0 $EA $11 $D2
    ld   d, a                                     ;; 05:50A3 $57
    ld   a, [wD211]                               ;; 05:50A4 $FA $11 $D2
    cp   $07                                      ;; 05:50A7 $FE $07
    jr   nz, .jr_50B7                             ;; 05:50A9 $20 $0C

    ld   a, [wD210]                               ;; 05:50AB $FA $10 $D2
    cp   $E0                                      ;; 05:50AE $FE $E0
    jr   c, .jr_50B7                              ;; 05:50B0 $38 $05

    xor  a                                        ;; 05:50B2 $AF
    ld   [wIsMarinSinging], a                     ;; 05:50B3 $EA $C8 $C3
    ret                                           ;; 05:50B6 $C9

.jr_50B7
    ld   hl, wIsMarinSinging                      ;; 05:50B7 $21 $C8 $C3
    ld   [hl], $01                                ;; 05:50BA $36 $01
    ld   a, e                                     ;; 05:50BC $7B
    srl  d                                        ;; 05:50BD $CB $3A
    rra                                           ;; 05:50BF $1F
    srl  d                                        ;; 05:50C0 $CB $3A
    rra                                           ;; 05:50C2 $1F
    srl  d                                        ;; 05:50C3 $CB $3A
    rra                                           ;; 05:50C5 $1F
    srl  d                                        ;; 05:50C6 $CB $3A
    rra                                           ;; 05:50C8 $1F
    cp   $1D                                      ;; 05:50C9 $FE $1D
    jr   c, .jr_50D2                              ;; 05:50CB $38 $05

    cp   $3B                                      ;; 05:50CD $FE $3B
    jr   nc, .jr_50D2                             ;; 05:50CF $30 $01

    inc  [hl]                                     ;; 05:50D1 $34

.jr_50D2
    cp   $1D                                      ;; 05:50D2 $FE $1D
    ret  c                                        ;; 05:50D4 $D8

    ld   a, LINK_ANIMATION_STATE_STANDING_DOWN    ;; 05:50D5 $3E $00
    ldh  [hLinkAnimationState], a                 ;; 05:50D7 $E0 $9D
    ldh  a, [hFrameCounter]                       ;; 05:50D9 $F0 $E7
    ld   e, LINK_ANIMATION_STATE_UNKNOWN_75       ;; 05:50DB $1E $75
    and  $40                                      ;; 05:50DD $E6 $40
    jr   z, .jr_50E2                              ;; 05:50DF $28 $01
    inc  e                                        ;; 05:50E1 $1C

.jr_50E2
    ld   a, e                                     ;; 05:50E2 $7B
    ldh  [hLinkAnimationState], a                 ;; 05:50E3 $E0 $9D
    ldh  a, [hFrameCounter]                       ;; 05:50E5 $F0 $E7
    and  $1F                                      ;; 05:50E7 $E6 $1F
    jr   nz, .ret_512A                            ;; 05:50E9 $20 $3F

    ld   a, ENTITY_MUSICAL_NOTE                   ;; 05:50EB $3E $C9
    call SpawnNewEntity_trampoline                ;; 05:50ED $CD $86 $3B
    jr   c, .ret_512A                             ;; 05:50F0 $38 $38

    ldh  a, [hLinkPositionY]                      ;; 05:50F2 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 05:50F4 $21 $10 $C2
    add  hl, de                                   ;; 05:50F7 $19
    sub  $08                                      ;; 05:50F8 $D6 $08
    ld   [hl], a                                  ;; 05:50FA $77
    push bc                                       ;; 05:50FB $C5
    ldh  a, [hFrameCounter]                       ;; 05:50FC $F0 $E7
    rra                                           ;; 05:50FE $1F
    rra                                           ;; 05:50FF $1F
    rra                                           ;; 05:5100 $1F
    rra                                           ;; 05:5101 $1F
    rra                                           ;; 05:5102 $1F
    and  $01                                      ;; 05:5103 $E6 $01
    ld   c, a                                     ;; 05:5105 $4F
    ld   b, d                                     ;; 05:5106 $42
    ld   hl, Data_005_4E5E                        ;; 05:5107 $21 $5E $4E
    add  hl, bc                                   ;; 05:510A $09
    ldh  a, [hLinkPositionX]                      ;; 05:510B $F0 $98
    add  [hl]                                     ;; 05:510D $86
    ld   hl, wEntitiesPosXTable                   ;; 05:510E $21 $00 $C2
    add  hl, de                                   ;; 05:5111 $19
    ld   [hl], a                                  ;; 05:5112 $77
    ld   hl, Data_005_4E60                        ;; 05:5113 $21 $60 $4E
    add  hl, bc                                   ;; 05:5116 $09
    ld   a, [hl]                                  ;; 05:5117 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:5118 $21 $40 $C2
    add  hl, de                                   ;; 05:511B $19
    ld   [hl], a                                  ;; 05:511C $77
    pop  bc                                       ;; 05:511D $C1
    ld   hl, wEntitiesSpeedYTable                 ;; 05:511E $21 $50 $C2
    add  hl, de                                   ;; 05:5121 $19
    ld   [hl], $FC                                ;; 05:5122 $36 $FC
    ld   hl, wEntitiesInertiaTable                ;; 05:5124 $21 $D0 $C3
    add  hl, de                                   ;; 05:5127 $19
    ld   [hl], $40                                ;; 05:5128 $36 $40

.ret_512A
    ret                                           ;; 05:512A $C9

func_005_512B::
    ld   a, [wDialogState]                        ;; 05:512B $FA $9F $C1
    and  a                                        ;; 05:512E $A7
    jr   nz, ret_005_515E                         ;; 05:512F $20 $2D

    call IncrementEntityState                     ;; 05:5131 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 05:5134 $FA $77 $C1
    and  a                                        ;; 05:5137 $A7
    jr   nz, .jr_514F                             ;; 05:5138 $20 $15

    ld   a, $01                                   ;; 05:513A $3E $01
    ld   [wDE00], a                               ;; 05:513C $EA $00 $DE
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 05:513F $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 05:5141 $EA $68 $D3
    ld   a, $05                                   ;; 05:5144 $3E $05
    call func_036_703E_trampoline                 ;; 05:5146 $CD $C6 $0A
    call GetEntityTransitionCountdown             ;; 05:5149 $CD $05 $0C
    ld   [hl], $80                                ;; 05:514C $36 $80
    ret                                           ;; 05:514E $C9

.jr_514F
    call_open_dialog Dialog015 ; "I want you to learn it" ;; 05:514F $3E $15 $CD $85 $23
    call IncrementEntityState                     ;; 05:5154 $CD $12 $3B
    ld   [hl], $01                                ;; 05:5157 $36 $01
    ld   hl, wEntitiesPrivateState3Table          ;; 05:5159 $21 $D0 $C2
    add  hl, bc                                   ;; 05:515C $09
    ld   [hl], b                                  ;; 05:515D $70

ret_005_515E:
    ret                                           ;; 05:515E $C9

Data_005_515F::
    db   $90, $17

func_005_5161::
    ld   a, $01                                   ;; 05:5161 $3E $01
    ld   [wDE00], a                               ;; 05:5163 $EA $00 $DE
    call GetEntityTransitionCountdown             ;; 05:5166 $CD $05 $0C
    jr   nz, jr_005_5197                          ;; 05:5169 $20 $2C

    ld   a, [wDialogState]                        ;; 05:516B $FA $9F $C1
    and  a                                        ;; 05:516E $A7
    ret  nz                                       ;; 05:516F $C0

    ld   hl, wOcarinaSongFlags                    ;; 05:5170 $21 $49 $DB
    set  BALLAD_OF_THE_WIND_FISH_FLAG_BIT, [hl]   ;; 05:5173 $CB $D6
    xor  a                                        ;; 05:5175 $AF
    ld   [wSelectedSongIndex], a                  ;; 05:5176 $EA $4A $DB
    call IncrementEntityState                     ;; 05:5179 $CD $12 $3B
    ldh  a, [hMapRoom]                            ;; 05:517C $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:517E $FE $C0
    jr   c, .jr_5183                              ;; 05:5180 $38 $01

    ld   [hl], b                                  ;; 05:5182 $70

.jr_5183
    xor  a                                        ;; 05:5183 $AF
    ld   [wC167], a                               ;; 05:5184 $EA $67 $C1
    ldh  a, [hMapRoom]                            ;; 05:5187 $F0 $F6
    cp   ROOM_SECTION_OW_VILLAGES                 ;; 05:5189 $FE $C0
    jr   nc, .jr_5192                             ;; 05:518B $30 $05

    jp_open_dialog Dialog014

.jr_5192
    jp_open_dialog Dialog193

jr_005_5197:
    cp   $08                                      ;; 05:5197 $FE $08
    jr   nz, .jr_51A1                             ;; 05:5199 $20 $06

    dec  [hl]                                     ;; 05:519B $35
    call_open_dialog Dialog013

.jr_51A1
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 05:51A1 $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 05:51A3 $E0 $9D
    ld   a, $02                                   ;; 05:51A5 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:51A7 $E0 $A1
    ldh  a, [hLinkPositionX]                      ;; 05:51A9 $F0 $98
    ldh  [hActiveEntityPosX], a                   ;; 05:51AB $E0 $EE
    ldh  a, [hLinkPositionY]                      ;; 05:51AD $F0 $99
    sub  $0C                                      ;; 05:51AF $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ;; 05:51B1 $E0 $EC
    ld   de, Data_005_515F                        ;; 05:51B3 $11 $5F $51
    xor  a                                        ;; 05:51B6 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:51B7 $E0 $F1
    jp   RenderActiveEntitySprite                 ;; 05:51B9 $C3 $77 $3C

func_005_51BC::
    ld   a, [wDialogState]                        ;; 05:51BC $FA $9F $C1
    and  a                                        ;; 05:51BF $A7
    ret  nz                                       ;; 05:51C0 $C0

    call ShouldLinkTalkToEntity_05                ;; 05:51C1 $CD $06 $55
    ret  nc                                       ;; 05:51C4 $D0

    jp_open_dialog Dialog197

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinLetterSpritesPair::
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; State of the entity during the "Link waking up" animation
DEF MARIN_LINK_INITIAL_STATE    EQU 0
DEF MARIN_LINK_TOSSING_STATE    EQU 1
DEF MARIN_LINK_AWAKE_STATE      EQU 2
DEF MARIN_LINK_OUT_OF_BED_STATE EQU 3

MarinEntityHandler_Indoor::
    ;
    ; In Marin's house, when Marin is at the beach, display a letter instead.
    ;

    ; If not got the pineapple yet…
    ld   a, [wTradeSequenceItem]                  ;; 05:51CE $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ;; 05:51D1 $FE $07
    jr   c, .letterEnd                            ;; 05:51D3 $38 $26
    ; … and the Walrus is sleeping,
    ld   a, [wOverworldRoomStatus + ROOM_OW_WALRUS] ;; 05:51D5 $FA $FD $D8
    and  OW_ROOM_STATUS_CHANGED | OW_ROOM_STATUS_OWL_TALKED ;; 05:51D8 $E6 $30
    jp   nz, ClearEntityStatus_05                 ;; 05:51DA $C2 $4B $7B

    ; Display the letter on the table
    ld   hl, wEntitiesPosYTable                   ;; 05:51DD $21 $10 $C2
    add  hl, bc                                   ;; 05:51E0 $09
    ld   [hl], $60                                ;; 05:51E1 $36 $60
    ld   hl, wEntitiesPosXTable                   ;; 05:51E3 $21 $00 $C2
    add  hl, bc                                   ;; 05:51E6 $09
    ld   [hl], $7A                                ;; 05:51E7 $36 $7A
    ld   de, MarinLetterSpritesPair               ;; 05:51E9 $11 $CA $51
    call RenderActiveEntitySpritesPair            ;; 05:51EC $CD $C0 $3B

    ; Open a dialog with the letter content if needed
    call ReturnIfNonInteractive_05                ;; 05:51EF $CD $3A $7A
    call ShouldLinkTalkToEntity_05                ;; 05:51F2 $CD $06 $55
    ret  nc                                       ;; 05:51F5 $D0
    jp_open_dialog Dialog1D7 ; "At the beach..."  ;; 05:51F6 $3E $D7
.letterEnd

    ;
    ; After Link retrieves his sword, Marin is no longer home. Remove the entity.
    ;
    ld   a, [wSwordLevel]                         ;; 05:51FB $FA $4E $DB
    and  a                                        ;; 05:51FE $A7
    jp   nz, ClearEntityStatus_05                 ;; 05:51FF $C2 $4B $7B

    ; After Link retrieves his shield, set the state directly to MARIN_LINK_OUT_OF_BED_STATE
    ld   a, [wShieldLevel]                        ;; 05:5202 $FA $44 $DB
    and  a                                        ;; 05:5205 $A7
    jr   z, .shieldEnd                            ;; 05:5206 $28 $09
    ld   hl, wEntitiesStateTable                  ;; 05:5208 $21 $90 $C2
    add  hl, bc                                   ;; 05:520B $09
    ld   a, MARIN_LINK_OUT_OF_BED_STATE           ;; 05:520C $3E $03
    ld   [hl], a                                  ;; 05:520E $77
    ldh  [hActiveEntityState], a                  ;; 05:520F $E0 $F0
.shieldEnd

    ;
    ; If the state is MARIN_LINK_STATE_INITIAL, set the initial state and return.
    ;

    ldh  a, [hActiveEntityState]                  ;; 05:5211 $F0 $F0
    and  a                                        ;; 05:5213 $A7
    jr   nz, .initialStateEnd                     ;; 05:5214 $20 $21
    ; Set a countdown for 127 frames
    call GetEntitySlowTransitionCountdown         ;; 05:5216 $CD $FB $0B
    ld   [hl], 127                                ;; 05:5219 $36 $7F
    ; Marin looks to the left
    ld   hl, wEntitiesDirectionTable              ;; 05:521B $21 $80 $C3
    add  hl, bc                                   ;; 05:521E $09
    ld   [hl], DIRECTION_LEFT                     ;; 05:521F $36 $01
    ; Shift Marin's position 8px to the bottom and to the right
    ld   hl, wEntitiesPosXTable                   ;; 05:5221 $21 $00 $C2
    add  hl, bc                                   ;; 05:5224 $09
    ld   a, [hl]                                  ;; 05:5225 $7E
    sub  8                                        ;; 05:5226 $D6 $08
    ld   [hl], a                                  ;; 05:5228 $77
    ld   hl, wEntitiesPosYTable                   ;; 05:5229 $21 $10 $C2
    add  hl, bc                                   ;; 05:522C $09
    ld   a, [hl]                                  ;; 05:522D $7E
    sub  8                                        ;; 05:522E $D6 $08
    ld   [hl], a                                  ;; 05:5230 $77
    ld   [wC167], a                               ;; 05:5231 $EA $67 $C1
    ; Move to MARIN_LINK_TOSSING_STATE
    jp   IncrementEntityState                     ;; 05:5234 $C3 $12 $3B
.initialStateEnd

    ldh  a, [hFrameCounter]                       ;; 05:5237 $F0 $E7
    and  $1F                                      ;; 05:5239 $E6 $1F
    jr   nz, .directionEnd                        ;; 05:523B $20 $08
    call GetEntityDirectionToLink_05              ;; 05:523D $CD $24 $7B
    ld   hl, wEntitiesDirectionTable              ;; 05:5240 $21 $80 $C3
    add  hl, bc                                   ;; 05:5243 $09
    ld   [hl], e                                  ;; 05:5244 $73
.directionEnd

    ; Render Marin's sprite
    call SetEntityVariantForDirection_05          ;; 05:5245 $CD $EA $54
    ld   de, MarinIndoorSpriteVariants            ;; 05:5248 $11 $0A $4E
    call RenderActiveEntitySpritesPair            ;; 05:524B $CD $C0 $3B

    ; Animate and render Link in the bed (see MARIN_LINK_*_STATE constants)
    ldh  a, [hActiveEntityState]                  ;; 05:524E $F0 $F0
    dec  a                                        ;; 05:5250 $3D
    JP_TABLE                                      ;; 05:5251
._01 dw MarinLinkTossingHandler                   ;; 05:5252
._02 dw MarinLinkAwakeInBedHandler                ;; 05:5254
._03 dw MarinLinkOutOfBedHandler                  ;; 05:5256

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LinksBedSpriteVariants::
.variant0 ; turning right
    db $40, OAM_GBC_PAL_7 | OAMF_PAL0
    db $42, OAM_GBC_PAL_7 | OAMF_PAL0
.variant1 ; turning left
    db $42, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $40, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant2 ; raised
    db $44, OAM_GBC_PAL_0 | OAMF_PAL0
    db $46, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3 ; looking at Marin
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4 ; looking at Marin, blinking
    db $48, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4C, OAM_GBC_PAL_0 | OAMF_PAL0

; define sprites and there OAM Attributes in a list
LinksBedMattressSpriteRect::
    ;  x    y    n°   OAM
    db $00, $00, $4E, OAM_GBC_PAL_6 | OAMF_PAL0
    db $00, $08, $4E, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP

; List of variants for playing the animation of Link tossing and turning in bed.
LinkInBedVariantsAnimation::
    db   $03, $03, $03, $03, $03, $04, $03, $04, $03, $03, $03, $02, $02, $02, $02, $02
    db   $00, $00, $01, $01, $00, $00, $01, $01, $00, $00, $01, $01, $00, $00, $01, $01

MarinLinkTossingHandler::
    ; On countdown end, open the "What a relief!" dialog and move to the next state
    call GetEntitySlowTransitionCountdown         ;; 05:5294 $CD $FB $0B
    jr   nz, .dialogEnd                           ;; 05:5297 $20 $0B
    call_open_dialog Dialog001 ; "What a relief!" ;; 05:5299 $3E $01
    ld   [hl], $40                                ;; 05:529E $36 $40
    ; Move to MARIN_LINK_AWAKE_STATE state
    call IncrementEntityState                     ;; 05:52A0 $CD $12 $3B
    xor  a                                        ;; 05:52A3 $AF
.dialogEnd

    rra                                           ;; 05:52A4 $1F
    rra                                           ;; 05:52A5 $1F
    and  $1F                                      ;; 05:52A6 $E6 $1F
    ld   e, a                                     ;; 05:52A8 $5F
    ld   d, b                                     ;; 05:52A9 $50
    ld   hl, LinkInBedVariantsAnimation           ;; 05:52AA $21 $74 $52
    add  hl, de                                   ;; 05:52AD $19
    ld   a, [hl]                                  ;; 05:52AE $7E
    ; fallthrough

; Render Link in bed
;
; Inputs:
;   a    sprite variant
RenderLinkInBedSprites::
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:52AF $E0 $F1
    ld   a, $38                                   ;; 05:52B1 $3E $38
    ldh  [hActiveEntityPosX], a                   ;; 05:52B3 $E0 $EE
    ldh  [hLinkPositionX], a                      ;; 05:52B5 $E0 $98
    ld   a, $34                                   ;; 05:52B7 $3E $34
    ldh  [hActiveEntityVisualPosY], a             ;; 05:52B9 $E0 $EC
    ldh  [hLinkPositionY], a                      ;; 05:52BB $E0 $99

    ld   a, $02                                   ;; 05:52BD $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:52BF $E0 $A1

    ld   a, LINK_ANIMATION_STATE_HIDDEN           ;; 05:52C1 $3E $FF
    ldh  [hLinkAnimationState], a                 ;; 05:52C3 $E0 $9D

    ld   de, LinksBedSpriteVariants               ;; 05:52C5 $11 $58 $52
    call RenderActiveEntitySpritesPair            ;; 05:52C8 $CD $C0 $3B

    ldh  a, [hIsGBC]                              ;; 05:52CB $F0 $FE
    and  a                                        ;; 05:52CD $A7
    jr   z, .gbcEnd                               ;; 05:52CE $28 $08
    ; Render Link's mattress, as a sprite under Link
    ld   hl, LinksBedMattressSpriteRect           ;; 05:52D0 $21 $6C $52
    ld   c, $02                                   ;; 05:52D3 $0E $02
    call RenderActiveEntitySpritesRect            ;; 05:52D5 $CD $E6 $3C
.gbcEnd

    jp   CopyEntityPositionToActivePosition       ;; 05:52D8 $C3 $8A $3D

MarinLinkAwakeInBedHandler::
    ld   a, $03                                   ;; 05:52DB $3E $03
    call RenderLinkInBedSprites                   ;; 05:52DD $CD $AF $52

    ; The dialog is still visible: return
    call GetEntityTransitionCountdown             ;; 05:52E0 $CD $05 $0C
    ld   hl, wDialogState                         ;; 05:52E3 $21 $9F $C1
    or   [hl]                                     ;; 05:52E6 $B6
    jr   nz, .return                              ;; 05:52E7 $20 $28

    ; No direction button pressed: return
    ldh  a, [hPressedButtonsMask]                 ;; 05:52E9 $F0 $CB
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 05:52EB $E6 $0F
    jr   z, .return                               ;; 05:52ED $28 $22

    ; Move to MARIN_LINK_OUT_OF_BED_STATE
    call IncrementEntityState                     ;; 05:52EF $CD $12 $3B

    ; Make Link jump out of the bed
    ld   a, $01                                   ;; 05:52F2 $3E $01
    ldh  [hLinkPositionZ], a                      ;; 05:52F4 $E0 $A2
    ld   a, $02                                   ;; 05:52F6 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 05:52F8 $EA $46 $C1
    ld   a, $12                                   ;; 05:52FB $3E $12
    ldh  [hLinkVelocityZ], a                      ;; 05:52FD $E0 $A3
    ld   a, $0C                                   ;; 05:52FF $3E $0C
    ldh  [hLinkSpeedX], a                         ;; 05:5301 $E0 $9A
    xor  a                                        ;; 05:5303 $AF
    ldh  [hLinkSpeedY], a                         ;; 05:5304 $E0 $9B
    ld   a, DIRECTION_RIGHT                       ;; 05:5306 $3E $00
    ldh  [hLinkDirection], a                      ;; 05:5308 $E0 $9E
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:530A $E0 $A1
    ld   a, $01                                   ;; 05:530C $3E $01
    ld   [wC10A], a                               ;; 05:530E $EA $0A $C1

.return
    ret                                           ;; 05:5311 $C9

MarinLinkOutOfBedHandler::
    call ReturnIfNonInteractive_05                ;; 05:5312 $CD $3A $7A
    call PushLinkOutOfEntity_05                   ;; 05:5315 $CD $C3 $54
    call ShouldLinkTalkToEntity_05                ;; 05:5318 $CD $06 $55
    ret  nc                                       ;; 05:531B $D0
    jp_open_dialog Dialog002 ; "Follow the lane south" ;; 05:531C

; Add item to inventory slot (used for assigning the shield)
AssignItemToSlot:
    ld   hl, wInventoryItems.BButtonSlot          ;; 05:5321 $21 $00 $DB
    ld   e, INVENTORY_SLOT_COUNT                  ;; 05:5324 $1E $0C

    ; Search if a matching item exists in inventory
.searchLoop
    ld   a, [hl+]                                 ;; 05:5326 $2A
    cp   d                                        ;; 05:5327 $BA
    jr   z, .return                               ;; 05:5328 $28 $13

    dec  e                                        ;; 05:532A $1D
    jr   nz, .searchLoop                          ;; 05:532B $20 $F9

    ld   hl, wInventoryItems.BButtonSlot          ;; 05:532D $21 $00 $DB

    ; Check for first empty slot, add item to it and return
.assignLoop
    ld   a, [hl]                                  ;; 05:5330 $7E
    and  a                                        ;; 05:5331 $A7
    jr   nz, .slotFound                           ;; 05:5332 $20 $02

    ld   [hl], d                                  ;; 05:5334 $72
    ret                                           ;; 05:5335 $C9

.slotFound
    inc  hl                                       ;; 05:5336 $23
    inc  e                                        ;; 05:5337 $1C
    ld   a, e                                     ;; 05:5338 $7B
    cp   INVENTORY_SLOT_COUNT                     ;; 05:5339 $FE $0C
    jr   nz, .assignLoop                          ;; 05:533B $20 $F3

.return
    ret                                           ;; 05:533D $C9
