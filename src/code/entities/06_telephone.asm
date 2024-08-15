; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TelephoneSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0

TelephoneEntityHandler::
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:6A7C $F0 $EC
    sub  $05                                      ;; 06:6A7E $D6 $05
    ldh  [hActiveEntityVisualPosY], a             ;; 06:6A80 $E0 $EC
    ld   de, TelephoneSpriteVariants              ;; 06:6A82 $11 $78 $6A
    call RenderActiveEntitySpritesPair            ;; 06:6A85 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:6A88 $CD $C6 $64
    call CheckLinkInteractionWithEntity_06        ;; 06:6A8B $CD $5D $64
    ret  nc                                       ;; 06:6A8E $D0

    ld_dialog_low e, Dialog1FD                    ;; 06:6A8F $1E $FD
    ldh  a, [hMapRoom]                            ;; 06:6A91 $F0 $F6
    cp   UNKNOWN_ROOM_A9                          ; Ulrira's house
    jp   z, .openDialogInTable1                   ;; 06:6A95 $CA $AD $6B

    ld_dialog_low e, Dialog16E                    ;; 06:6A98 $1E $6E
    ld   a, [wTradeSequenceItem]                  ;; 06:6A9A $FA $0E $DB
    cp   TRADING_ITEM_BROOM
    jr   nz, .jr_6AA9                             ;; 06:6A9F $20 $08

    ld   a, [wHasInstrument5]                     ;; 06:6AA1 $FA $69 $DB
    and  $02                                      ;; 06:6AA4 $E6 $02
    jp   nz, .openDialogInTable1                  ;; 06:6AA6 $C2 $AD $6B

.jr_6AA9
    ld_dialog_low e, Dialog141                    ;; 06:6AA9 $1E $41
    ld   a, [wIndoorBRoomStatus + $A9]            ;; 06:6AAB $FA $A9 $DA
    and  $20                                      ;; 06:6AAE $E6 $20
    jp   z, .openDialogInTable1                   ;; 06:6AB0 $CA $AD $6B

    ld_dialog_low e, Dialog146                    ;; 06:6AB3 $1E $46
    ld   a, [wHasInstrument1]                     ;; 06:6AB5 $FA $65 $DB
    and  $02                                      ;; 06:6AB8 $E6 $02
    jp   z, .openDialogInTable1                   ;; 06:6ABA $CA $AD $6B

    ld_dialog_low e, Dialog142                    ;; 06:6ABD $1E $42
    ld   a, [wIsBowWowFollowingLink]              ;; 06:6ABF $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 06:6AC2 $FE $80
    jp   z, .openDialogInTable1                   ;; 06:6AC4 $CA $AD $6B

    ld_dialog_low e, Dialog143                    ;; 06:6AC7 $1E $43
    ld   a, [wHasInstrument2]                     ;; 06:6AC9 $FA $66 $DB
    and  $02                                      ;; 06:6ACC $E6 $02
    jp   z, .openDialogInTable1                   ;; 06:6ACE $CA $AD $6B

    ld_dialog_low e, Dialog144                    ;; 06:6AD1 $1E $44
    ld   a, [wIsBowWowFollowingLink]              ;; 06:6AD3 $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 06:6AD6 $FE $01
    jp   z, .openDialogInTable2                   ;; 06:6AD8 $CA $B3 $6B

    ld_dialog_low e, Dialog144                    ;; 06:6ADB $1E $44
    ld   a, [wRichardSpokenFlag]                  ;; 06:6ADD $FA $55 $DB
    cp   $02                                      ;; 06:6AE0 $FE $02
    jp   nz, .openDialogInTable1                  ;; 06:6AE2 $C2 $AD $6B

    ld_dialog_low e, Dialog145                    ;; 06:6AE5 $1E $45
    ld   a, [wTradeSequenceItem]                  ;; 06:6AE7 $FA $0E $DB
    cp   TRADING_ITEM_STICK
    jp   c, .openDialogInTable1                   ;; 06:6AEC $DA $AD $6B

    ld   a, [wGoldenLeavesCount]                  ;; 06:6AEF $FA $15 $DB
    cp   GOLDEN_LEAVES_5                          ;; 06:6AF2 $FE $05
    jr   nc, .jr_006_6B09                         ;; 06:6AF4 $30 $13

    ld   hl, wEntitiesPrivateState1Table          ;; 06:6AF6 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6AF9 $09
    inc  [hl]                                     ;; 06:6AFA $34
    ld   a, [hl]                                  ;; 06:6AFB $7E
    cp   $03                                      ;; 06:6AFC $FE $03
    jr   nz, .jr_6B02                             ;; 06:6AFE $20 $02

    xor  a                                        ;; 06:6B00 $AF
    ld   [hl], a                                  ;; 06:6B01 $77

.jr_6B02
    ld_dialog_low e, Dialog228                    ;; 06:6B02 $1E $28
    add  e                                        ;; 06:6B04 $83
    ld   e, a                                     ;; 06:6B05 $5F
    jp   .openDialogInTable2                      ;; 06:6B06 $C3 $B3 $6B

.jr_006_6B09
    ld_dialog_low e, Dialog148                    ;; 06:6B09 $1E $48
    jp   z, .openDialogInTable1                   ;; 06:6B0B $CA $AD $6B

    cp   $06                                      ;; 06:6B0E $FE $06
    jp   nz, .openDialogInTable1                  ;; 06:6B10 $C2 $AD $6B

    ld_dialog_low e, Dialog149                    ;; 06:6B13 $1E $49
    ld   a, [wHasInstrument3]                     ;; 06:6B15 $FA $67 $DB
    and  $02                                      ;; 06:6B18 $E6 $02
    jp   z, .openDialogInTable1                   ;; 06:6B1A $CA $AD $6B

    ld_dialog_low e, Dialog14A                    ;; 06:6B1D $1E $4A
    ld   a, [wHasAnglerKey]                       ;; 06:6B1F $FA $12 $DB
    and  a                                        ;; 06:6B22 $A7
    jp   z, .openDialogInTable1                   ;; 06:6B23 $CA $AD $6B

    ld_dialog_low e, Dialog240                    ;; 06:6B26 $1E $40
    ld   a, [wHasInstrument4]                     ;; 06:6B28 $FA $68 $DB
    and  $02                                      ;; 06:6B2B $E6 $02
    jp   z, .openDialogInTable2                   ;; 06:6B2D $CA $B3 $6B

    ld   a, [wIsGhostFollowingLink]               ;; 06:6B30 $FA $79 $DB
    and  a                                        ;; 06:6B33 $A7
    jr   z, .jr_6B3F                              ;; 06:6B34 $28 $09

    ld_dialog_low e, Dialog14B                    ;; 06:6B36 $1E $4B
    ld   a, [wIndoorARoomStatus + $E3]            ;; 06:6B38 $FA $E3 $D9
    and  $40                                      ;; 06:6B3B $E6 $40
    jr   z, .openDialogInTable1                   ;; 06:6B3D $28 $6E

.jr_6B3F
    ld_dialog_low e, Dialog14C                    ;; 06:6B3F $1E $4C
    ld   a, [wHasInstrument5]                     ;; 06:6B41 $FA $69 $DB
    and  $02                                      ;; 06:6B44 $E6 $02
    jr   z, .openDialogInTable1                   ;; 06:6B46 $28 $65

    ld_dialog_low e, Dialog245                    ;; 06:6B48 $1E $45
    ld   a, [wOcarinaSongFlags]                   ;; 06:6B4A $FA $49 $DB
    and  FROGS_SONG_OF_THE_SOUL_FLAG              ;; 06:6B4D $E6 $01
    jp   z, .openDialogInTable2                   ;; 06:6B4F $CA $B3 $6B

    ld_dialog_low e, Dialog14D                    ;; 06:6B52 $1E $4D
    ld   a, [wHasInstrument6]                     ;; 06:6B54 $FA $6A $DB
    and  $02                                      ;; 06:6B57 $E6 $02
    jr   z, .openDialogInTable1                   ;; 06:6B59 $28 $52

    ld_dialog_low e, Dialog14E                    ;; 06:6B5B $1E $4E
    ld   a, [wIsRoosterFollowingLink]             ;; 06:6B5D $FA $7B $DB
    and  a                                        ;; 06:6B60 $A7
    jr   z, .jr_6B6E                              ;; 06:6B61 $28 $0B

    ld_dialog_low e, Dialog246                    ;; 06:6B63 $1E $46
    ld   a, [wHasBirdKey]                         ;; 06:6B65 $FA $14 $DB
    and  a                                        ;; 06:6B68 $A7
    jp   z, .openDialogInTable2                   ;; 06:6B69 $CA $B3 $6B

    ld_dialog_low e, Dialog241                    ;; 06:6B6C $1E $41

.jr_6B6E
    ld   a, [wHasInstrument7]                     ;; 06:6B6E $FA $6B $DB
    and  $02                                      ;; 06:6B71 $E6 $02
    jr   nz, .jr_6B7C                             ;; 06:6B73 $20 $07

    ld   a, e                                     ;; 06:6B75 $7B
    cp   $4E                                      ;; 06:6B76 $FE $4E
    jr   z, .openDialogInTable1                   ;; 06:6B78 $28 $33

    jr   .openDialogInTable2                      ;; 06:6B7A $18 $37

.jr_6B7C
    ld_dialog_low e, Dialog14F                    ;; 06:6B7C $1E $4F
    ld   a, [wOverworldRoomStatus + $10]          ;; 06:6B7E $FA $10 $D8
    and  OW_ROOM_STATUS_CHANGED | OW_ROOM_STATUS_OWL_TALKED ;; 06:6B81 $E6 $30
    jr   z, .openDialogInTable1                   ;; 06:6B83 $28 $28

    ld_dialog_low e, Dialog248                    ;; 06:6B85 $1E $48
    ld   a, [wHasInstrument8]                     ;; 06:6B87 $FA $6C $DB
    and  $02                                      ;; 06:6B8A $E6 $02
    jr   z, .openDialogInTable2                   ;; 06:6B8C $28 $25

    ld_dialog_low e, Dialog242                    ;; 06:6B8E $1E $42
    ld   a, [wOverworldRoomStatus + $06]          ;; 06:6B90 $FA $06 $D8
    and  OW_ROOM_STATUS_CHANGED | OW_ROOM_STATUS_OWL_TALKED ;; 06:6B93 $E6 $30
    jr   z, .openDialogInTable2                   ;; 06:6B95 $28 $1C

    ld_dialog_low e, Dialog243                    ;; 06:6B97 $1E $43
    ld   a, [wIndoorBRoomStatus + $74]            ;; 06:6B99 $FA $74 $DA
    and  OW_ROOM_STATUS_UNKNOWN                   ;; 06:6B9C $E6 $40
    jr   z, .openDialogInTable2                   ;; 06:6B9E $28 $13

    ld_dialog_low e, Dialog247                    ;; 06:6BA0 $1E $47
    ld   a, [wSwordLevel]                         ;; 06:6BA2 $FA $4E $DB
    cp   $02                                      ;; 06:6BA5 $FE $02
    jr   c, .openDialogInTable2                   ;; 06:6BA7 $38 $0A

    ld_dialog_low e, Dialog248                    ;; 06:6BA9 $1E $48
    jr   .openDialogInTable2                      ;; 06:6BAB $18 $06

.openDialogInTable1
    ld   a, e                                     ;; 06:6BAD $7B
    call OpenDialogInTable1                       ;; 06:6BAE $CD $73 $23
    jr   .done                                    ;; 06:6BB1 $18 $04

.openDialogInTable2
    ld   a, e                                     ;; 06:6BB3 $7B
    call OpenDialogInTable2                       ;; 06:6BB4 $CD $7C $23

.done
    ld   hl, wIndoorBRoomStatus + $A9 ; Ulrira's house interior ;; 06:6BB7 $21 $A9 $DA
    set  5, [hl]                                  ;; 06:6BBA $CB $EE
    ret                                           ;; 06:6BBC $C9
