; Table of "You got item XXX!" dialogs, indexed by (wTradeSequenceItem - 1)
TradingItemDialogs::
._0 db_dialog_low Dialog044
._1 db_dialog_low Dialog129
._2 db_dialog_low Dialog182
._3 db_dialog_low Dialog1CB
._4 db_dialog_low Dialog164
._5 db_dialog_low Dialog1C1
._6 db_dialog_low Dialog1D0
._7 db_dialog_low Dialog174
._8 db_dialog_low Dialog16A
._9 db_dialog_low Dialog136
._A db_dialog_low Dialog15E
._B db_dialog_low Dialog1EC
._C db_dialog_low Dialog1F5
._D db_dialog_low Dialog09D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TradingItem1SpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_6 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_6 | OAMF_PAL1

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TradingItem2SpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TradingItem3SpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant1
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant2
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant3
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant4
    db $9A, OAM_GBC_PAL_4 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_4 | OAMF_PAL1
.variant5
    db $9A, OAM_GBC_PAL_4 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_4 | OAMF_PAL1
.variant6
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant7
    db $9A, OAM_GBC_PAL_4 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_4 | OAMF_PAL1
.variant8
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant9
    db $9A, OAM_GBC_PAL_6 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_6 | OAMF_PAL1
.variant10
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant11
    db $9A, OAM_GBC_PAL_6 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_6 | OAMF_PAL1
.variant12
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1
.variant13
    db $9A, OAM_GBC_PAL_7 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_7 | OAMF_PAL1

TradingItemEntityHandler::
    ld   a, [wIsIndoor]                           ;; 07:5510 $FA $A5 $DB
    and  a                                        ;; 07:5513 $A7
    jr   nz, .jr_007_552E                         ;; 07:5514 $20 $18

    ldh  a, [hMapRoom]                            ;; 07:5516 $F0 $F6
    cp   ROOM_OW_KANALET_KIKI_BRIDGE_NORTH        ;; 07:5518 $FE $6B
    jr   z, .jr_007_5528                          ;; 07:551A $28 $0C
    cp   ROOM_OW_KANALET_MOAT_EAST_OF_GATE        ;; 07:551C $FE $7A
    jr   z, .jr_007_5528                          ;; 07:551E $28 $08
    cp   ROOM_OW_SEASHELL_MANSION_EAST_SHELL      ;; 07:5520 $FE $8B
    jr   z, .jr_007_5528                          ;; 07:5522 $28 $04
    cp   ROOM_OW_KANALET_KIKI_BRIDGE              ;; 07:5524 $FE $7B
    jr   nz, .jr_007_552E                         ;; 07:5526 $20 $06

.jr_007_5528
    ld   a, [wOverworldRoomStatus + ROOM_OW_KANALET_KIKI_BRIDGE] ;; 07:5528 $FA $7B $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 07:552B $E6 $10
    ret  z                                        ;; 07:552D $C8

.jr_007_552E
    ldh  a, [hRoomStatus]                         ;; 07:552E $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 07:5530 $E6 $20
    jp   nz, ClearEntityStatus_07                 ;; 07:5532 $C2 $A4 $7E

    ldh  a, [hIsGBC]                              ;; 07:5535 $F0 $FE
    and  a                                        ;; 07:5537 $A7
    jr   z, .jr_007_555A                          ;; 07:5538 $28 $20

    ldh  a, [hIsSideScrolling]                    ;; 07:553A $F0 $F9
    and  a                                        ;; 07:553C $A7
    jr   z, .jr_007_5545                          ;; 07:553D $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ;; 07:553F $F0 $EC
    add  $02                                      ;; 07:5541 $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ;; 07:5543 $E0 $EC

.jr_007_5545
    push hl                                       ;; 07:5545 $E5
    ld   de, TradingItem3SpriteVariants           ;; 07:5546 $11 $D8 $54
    ld   a, [wTradeSequenceItem]                  ;; 07:5549 $FA $0E $DB
    dec  a                                        ;; 07:554C $3D
    sla  a                                        ;; 07:554D $CB $27
    sla  a                                        ;; 07:554F $CB $27
    ld   l, a                                     ;; 07:5551 $6F
    ld   h, $00                                   ;; 07:5552 $26 $00
    add  hl, de                                   ;; 07:5554 $19
    ld   e, l                                     ;; 07:5555 $5D
    ld   d, h                                     ;; 07:5556 $54
    pop  hl                                       ;; 07:5557 $E1
    jr   .render                                  ;; 07:5558 $18 $18

.jr_007_555A
    ld   de, TradingItem2SpriteVariants           ;; 07:555A $11 $D4 $54
    ld   a, [wTradeSequenceItem]                  ;; 07:555D $FA $0E $DB
    cp   TRADING_ITEM_BANANAS                     ;; 07:5560 $FE $04
    jr   z, .render                               ;; 07:5562 $28 $0E

    ldh  a, [hIsSideScrolling]                    ;; 07:5564 $F0 $F9
    and  a                                        ;; 07:5566 $A7
    jr   z, .jr_007_556F                          ;; 07:5567 $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5569 $F0 $EC
    add  $02                                      ;; 07:556B $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ;; 07:556D $E0 $EC

.jr_007_556F
    ld   de, TradingItem1SpriteVariants           ;; 07:556F $11 $D0 $54

.render
    call RenderActiveEntitySpritesPair            ;; 07:5572 $CD $C0 $3B
    call GetEntityTransitionCountdown             ;; 07:5575 $CD $05 $0C
    jr   nz, .openDialog                          ;; 07:5578 $20 $20

    call CheckLinkCollisionWithEnemy_trampoline   ;; 07:557A $CD $5A $3B
    jr   nc, .return                              ;; 07:557D $30 $1A

    ld   a, MUSIC_OBTAIN_ITEM                     ;; 07:557F $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 07:5581 $EA $68 $D3
    ld   [wC167], a                               ;; 07:5584 $EA $67 $C1
    ldh  a, [hNextDefaultMusicTrack]              ;; 07:5587 $F0 $BF
    ldh  [hDefaultMusicTrack], a                  ;; 07:5589 $E0 $B0
    call GetEntityTransitionCountdown             ;; 07:558B $CD $05 $0C
    ld   a, $68                                   ;; 07:558E $3E $68
    ld   [hl], a                                  ;; 07:5590 $77
    ld   a, $66                                   ;; 07:5591 $3E $66
    ld   [wC111], a                               ;; 07:5593 $EA $11 $C1
    jp   ResetSpinAttack                          ;; 07:5596 $C3 $AF $0C

.return
    ret                                           ;; 07:5599 $C9

.openDialog
    cp   $10                                      ;; 07:559A $FE $10
    jr   nz, jr_007_55BA                          ;; 07:559C $20 $1C

    dec  [hl]                                     ;; 07:559E $35
    ld   a, [wTradeSequenceItem]                  ;; 07:559F $FA $0E $DB
    ld   e, a                                     ;; 07:55A2 $5F
    ld   d, b                                     ;; 07:55A3 $50
    ld   hl, TradingItemDialogs - 1               ;; 07:55A4 $21 $C1 $54
    add  hl, de                                   ;; 07:55A7 $19
    ld   a, [hl]                                  ;; 07:55A8 $7E
    cp_dialog_low Dialog09D                       ;; 07:55A9 $FE $9D
    jr   z, .openDialogInTable0                   ;; 07:55AB $28 $04

    cp_dialog_low Dialog044                       ;; 07:55AD $FE $44
    jr   nz, .openDialogInTable1                  ;; 07:55AF $20 $05
.openDialogInTable0
    call OpenDialogInTable0                       ;; 07:55B1 $CD $85 $23
    jr   .dialogEnd                               ;; 07:55B4 $18 $03
.openDialogInTable1
    call OpenDialogInTable1                       ;; 07:55B6 $CD $73 $23
.dialogEnd

    xor  a                                        ;; 07:55B9 $AF

jr_007_55BA:
    dec  a                                        ;; 07:55BA $3D
    jr   nz, .jr_55CD                             ;; 07:55BB $20 $10

    xor  a                                        ;; 07:55BD $AF
    ld   [wExchangingTradeSequenceItem], a        ;; 07:55BE $EA $7F $DB
    ld   [wC167], a                               ;; 07:55C1 $EA $67 $C1
    call func_007_560D                            ;; 07:55C4 $CD $0D $56
    or   $20                                      ;; 07:55C7 $F6 $20
    ld   [hl], a                                  ;; 07:55C9 $77
    jp   ClearEntityStatus_07                     ;; 07:55CA $C3 $A4 $7E

.jr_55CD
    ldh  a, [hLinkPositionX]                      ;; 07:55CD $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 07:55CF $21 $00 $C2
    add  hl, bc                                   ;; 07:55D2 $09
    ld   [hl], a                                  ;; 07:55D3 $77
    ldh  a, [hMapRoom]                            ;; 07:55D4 $F0 $F6
    cp   ROOM_OW_SIREN                            ;; 07:55D6 $FE $C9
    jr   nz, .jr_55DF                             ;; 07:55D8 $20 $05

    ld   a, $04                                   ;; 07:55DA $3E $04
    ld   [wC13B], a                               ;; 07:55DC $EA $3B $C1

.jr_55DF
    ld   hl, wC13B                                ;; 07:55DF $21 $3B $C1
    ldh  a, [hLinkPositionY]                      ;; 07:55E2 $F0 $99
    add  [hl]                                     ;; 07:55E4 $86
    ld   hl, wEntitiesPosYTable                   ;; 07:55E5 $21 $10 $C2
    add  hl, bc                                   ;; 07:55E8 $09
    sub  $10                                      ;; 07:55E9 $D6 $10
    ld   [hl], a                                  ;; 07:55EB $77
    ldh  a, [hLinkPositionZ]                      ;; 07:55EC $F0 $A2
    ld   hl, wEntitiesPosZTable                   ;; 07:55EE $21 $10 $C3
    add  hl, bc                                   ;; 07:55F1 $09
    ld   [hl], a                                  ;; 07:55F2 $77
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 07:55F3 $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 07:55F5 $E0 $9D
    ld   a, $02                                   ;; 07:55F7 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:55F9 $E0 $A1
    ld   a, $03                                   ;; 07:55FB $3E $03
    ldh  [hLinkDirection], a                      ;; 07:55FD $E0 $9E
    ; reset sword parameter
    xor  a                                        ;; 07:55FF $AF
    ld   [wSwordAnimationState], a                ;; 07:5600 $EA $37 $C1
    ld   [wC16A], a                               ;; 07:5603 $EA $6A $C1
    ld   [wSwordCharge], a                        ;; 07:5606 $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ;; 07:5609 $EA $21 $C1
    ret                                           ;; 07:560C $C9

func_007_560D::
    ld   hl, wOverworldRoomStatus                 ;; 07:560D $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 07:5610 $F0 $F6
    ld   e, a                                     ;; 07:5612 $5F
    ld   a, [wIsIndoor]                           ;; 07:5613 $FA $A5 $DB
    ld   d, a                                     ;; 07:5616 $57

    ldh  a, [hMapId]                              ;; 07:5617 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 07:5619 $FE $1A
    jr   nc, .indoorBEnd                          ;; 07:561B $30 $05
    cp   MAP_INDOORS_B_START                      ;; 07:561D $FE $06
    jr   c, .indoorBEnd                           ;; 07:561F $38 $01
    inc  d                                        ;; 07:5621 $14
.indoorBEnd

    add  hl, de                                   ;; 07:5622 $19
    ld   a, [hl]                                  ;; 07:5623 $7E
    ret                                           ;; 07:5624 $C9
