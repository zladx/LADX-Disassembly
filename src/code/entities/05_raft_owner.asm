; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RaftOwnerIndoorSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant6
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; Handler for Raft Owner (and also the raft itself?)
EntityRaftOwnerHandler::
    ld   a, [wIsIndoor]                           ;; 05:535E $FA $A5 $DB
    and  a                                        ;; 05:5361 $A7
    jr   z, raftOnOverworld                       ;; 05:5362 $28 $78

    ldh  a, [hFrameCounter]                       ;; 05:5364 $F0 $E7
    and  $1F                                      ;; 05:5366 $E6 $1F
    jr   nz, .jr_5372                             ;; 05:5368 $20 $08

    call GetEntityDirectionToLink_05              ;; 05:536A $CD $24 $7B
    ld   hl, wEntitiesDirectionTable              ;; 05:536D $21 $80 $C3
    add  hl, bc                                   ;; 05:5370 $09
    ld   [hl], e                                  ;; 05:5371 $73

.jr_5372
    call SetEntityVariantForDirection_05          ;; 05:5372 $CD $EA $54
    ld   de, RaftOwnerIndoorSpriteVariants        ;; 05:5375 $11 $3E $53
    call RenderActiveEntitySpritesPair            ;; 05:5378 $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:537B $CD $3A $7A
    call PushLinkOutOfEntity_05                   ;; 05:537E $CD $C3 $54
    ldh  a, [hActiveEntityState]                  ;; 05:5381 $F0 $F0
    JP_TABLE                                      ;; 05:5383
._00 dw func_005_538A                             ;; 05:5384
._01 dw func_005_539C                             ;; 05:5386
._02 dw func_005_53CB                             ;; 05:5388

func_005_538A::
    ld   a, [wD477]                               ;; 05:538A $FA $77 $D4
    and  a                                        ;; 05:538D $A7
    jr   nz, func_005_53CB                        ;; 05:538E $20 $3B

    call ShouldLinkTalkToEntity_05                ;; 05:5390 $CD $06 $55
    ret  nc                                       ;; 05:5393 $D0

    call_open_dialog Dialog0F0 ; "Want a ride?"   ;; 05:5394 $3E $F0 $CD $85 $23
    jp   IncrementEntityState                     ;; 05:5399 $C3 $12 $3B

func_005_539C::
    ld   a, [wDialogState]                        ;; 05:539C $FA $9F $C1
    and  a                                        ;; 05:539F $A7
    ret  nz                                       ;; 05:53A0 $C0

    call IncrementEntityState                     ;; 05:53A1 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 05:53A4 $FA $77 $C1
    and  a                                        ;; 05:53A7 $A7
    jr   z, jr_005_53AC                           ;; 05:53A8 $28 $02

    ld   [hl], b                                  ;; 05:53AA $70

.ret_53AB
    ret                                           ;; 05:53AB $C9

jr_005_53AC:
    ld   a, [wRupeeCountLow]                      ;; 05:53AC $FA $5E $DB
    sub  $00                                      ;; 05:53AF $D6 $00

.jr_53B1
    ld   a, [wRupeeCountHigh]                     ;; 05:53B1 $FA $5D $DB
    sbc  $01                                      ;; 05:53B4 $DE $01
    jr   c, .jr_53C5                              ;; 05:53B6 $38 $0D

    ld   a, RAFT_GAME_PRICE                       ;; 05:53B8 $3E $64
    ld   [wSubstractRupeeBufferLow], a            ;; 05:53BA $EA $92 $DB
    ld_dialog_low a, Dialog0F1 ; "Raft is ready"  ;; 05:53BD $3E $F1
    ld   [wD477], a                               ;; 05:53BF $EA $77 $D4
    jp   OpenDialogInTable0                       ;; 05:53C2 $C3 $85 $23

.jr_53C5
    ld   [hl], b                                  ;; 05:53C5 $70
    jp_open_dialog Dialog04E ; "Short on Rupees?" ;; 05:53C6 $3E $4E $C3 $85 $23

func_005_53CB::
    call ShouldLinkTalkToEntity_05                ;; 05:53CB $CD $06 $55
    ret  nc                                       ;; 05:53CE $D0

    jp_open_dialog Dialog0F1                      ;; 05:53CF

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RaftOwnerOnOverworldSpriteVariants:: ;; 05:53D4
.variant0
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

raftOnOverworld:
    ld   hl, wEntitiesPrivateState4Table          ;; 05:53DC $21 $40 $C4
    add  hl, bc                                   ;; 05:53DF $09
    ld   a, [wD477]                               ;; 05:53E0 $FA $77 $D4
    or   [hl]                                     ;; 05:53E3 $B6
    jr   nz, jr_005_5411                          ;; 05:53E4 $20 $2B

    ld   e, $0F                                   ;; 05:53E6 $1E $0F
    ld   d, b                                     ;; 05:53E8 $50

jr_005_53E9:
    ld   a, e                                     ;; 05:53E9 $7B
    cp   c                                        ;; 05:53EA $B9
    jr   z, .jr_53FF                              ;; 05:53EB $28 $12

    ld   hl, wEntitiesStatusTable                 ;; 05:53ED $21 $80 $C2
    add  hl, de                                   ;; 05:53F0 $19
    ld   a, [hl]                                  ;; 05:53F1 $7E
    and  a                                        ;; 05:53F2 $A7
    jr   z, .jr_53FF                              ;; 05:53F3 $28 $0A

    ld   hl, wEntitiesTypeTable                   ;; 05:53F5 $21 $A0 $C3
    add  hl, de                                   ;; 05:53F8 $19
    ld   a, [hl]                                  ;; 05:53F9 $7E
    cp   $6A                                      ;; 05:53FA $FE $6A
    jp   z, ClearEntityStatus_05                  ;; 05:53FC $CA $4B $7B

.jr_53FF
    dec  e                                        ;; 05:53FF $1D
    ld   a, e                                     ;; 05:5400 $7B
    cp   $FF                                      ;; 05:5401 $FE $FF
    jr   nz, jr_005_53E9                          ;; 05:5403 $20 $E4

    ld   de, RaftOwnerOnOverworldSpriteVariants   ;; 05:5405 $11 $D4 $53
    call RenderActiveEntitySpritesPair            ;; 05:5408 $CD $C0 $3B
    call ReturnIfNonInteractive_05                ;; 05:540B $CD $3A $7A
    jp   PushLinkOutOfEntity_05                   ;; 05:540E $C3 $C3 $54

jr_005_5411:
    ldh  a, [hFrameCounter]                       ;; 05:5411 $F0 $E7
    rra                                           ;; 05:5413 $1F
    rra                                           ;; 05:5414 $1F
    rra                                           ;; 05:5415 $1F
    rra                                           ;; 05:5416 $1F
    and  $01                                      ;; 05:5417 $E6 $01
    call SetEntitySpriteVariant                   ;; 05:5419 $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ;; 05:541C $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 05:541E $21 $EE $FF
    sub  [hl]                                     ;; 05:5421 $96
    add  $10                                      ;; 05:5422 $C6 $10
    cp   $20                                      ;; 05:5424 $FE $20
    jr   nc, .jr_5440                             ;; 05:5426 $30 $18

    ldh  a, [hLinkPositionY]                      ;; 05:5428 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 05:542A $21 $EF $FF
    sub  [hl]                                     ;; 05:542D $96
    add  $14                                      ;; 05:542E $C6 $14
    cp   $1C                                      ;; 05:5430 $FE $1C
    jr   nc, .jr_5440                             ;; 05:5432 $30 $0C

    ld   a, $80                                   ;; 05:5434 $3E $80
    ld   [wItemUsageContext], a                   ;; 05:5436 $EA $AD $C1
    ldh  a, [hLinkPositionX]                      ;; 05:5439 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 05:543B $21 $00 $C2
    add  hl, bc                                   ;; 05:543E $09
    ld   [hl], a                                  ;; 05:543F $77

.jr_5440
    ld   a, [wLinkGroundStatus]                   ;; 05:5440 $FA $1F $C1
    and  a                                        ;; 05:5443 $A7
    jr   z, .jr_544C                              ;; 05:5444 $28 $06

    call IncrementEntityState                     ;; 05:5446 $CD $12 $3B
    ld   [hl], b                                  ;; 05:5449 $70
    jr   jr_005_5487                              ;; 05:544A $18 $3B

.jr_544C
    ldh  a, [hActiveEntityState]                  ;; 05:544C $F0 $F0
    JP_TABLE                                      ;; 05:544E
._00 dw func_005_5455                             ;; 05:544F
._01 dw func_005_546C                             ;; 05:5451
._02 dw func_005_5490                             ;; 05:5453

func_005_5455::
    call GetEntityToLinkPositionDeltaX_05         ;; 05:5455 $CD $04 $7B
    add  $08                                      ;; 05:5458 $C6 $08
    cp   $10                                      ;; 05:545A $FE $10
    jr   nc, .jr_546A                             ;; 05:545C $30 $0C

    call GetEntityToLinkPositionDeltaY_05         ;; 05:545E $CD $14 $7B
    add  $09                                      ;; 05:5461 $C6 $09
    cp   $12                                      ;; 05:5463 $FE $12
    jr   nc, .jr_546A                             ;; 05:5465 $30 $03

    call IncrementEntityState                     ;; 05:5467 $CD $12 $3B

.jr_546A
    jr   jr_005_5487                              ;; 05:546A $18 $1B

func_005_546C::
    ldh  a, [hActiveEntityPosX]                   ;; 05:546C $F0 $EE
    ldh  [hLinkPositionX], a                      ;; 05:546E $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:5470 $F0 $EC
    sub  $05                                      ;; 05:5472 $D6 $05
    ldh  [hLinkPositionY], a                      ;; 05:5474 $E0 $99
    call IncrementEntityState                     ;; 05:5476 $CD $12 $3B
    ld   hl, wEntitiesPrivateState4Table          ;; 05:5479 $21 $40 $C4
    add  hl, bc                                   ;; 05:547C $09
    ld   [hl], $01                                ;; 05:547D $36 $01
    xor  a                                        ;; 05:547F $AF
    ld   [wD477], a                               ;; 05:5480 $EA $77 $D4

jr_005_5483:
    ld   a, $01                                   ;; 05:5483 $3E $01
    ldh  [hLinkSlowWalkingSpeed], a               ;; 05:5485 $E0 $B2

jr_005_5487:
    call CopyEntityPositionToActivePosition       ;; 05:5487 $CD $8A $3D
    ld   de, RaftOwnerOnOverworldSpriteVariants   ;; 05:548A $11 $D4 $53
    jp   RenderActiveEntitySpritesPair            ;; 05:548D $C3 $C0 $3B

func_005_5490::
    ldh  a, [hFrameCounter]                       ;; 05:5490 $F0 $E7
    rra                                           ;; 05:5492 $1F
    rra                                           ;; 05:5493 $1F
    rra                                           ;; 05:5494 $1F
    rra                                           ;; 05:5495 $1F
    and  $01                                      ;; 05:5496 $E6 $01
    ld   [wC13B], a                               ;; 05:5498 $EA $3B $C1
    ldh  a, [hMapRoom]                            ;; 05:549B $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 05:549D $21 $E0 $C3
    add  hl, bc                                   ;; 05:54A0 $09
    ld   [hl], a                                  ;; 05:54A1 $77
    ldh  a, [hLinkPositionX]                      ;; 05:54A2 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 05:54A4 $21 $00 $C2
    add  hl, bc                                   ;; 05:54A7 $09
    ld   [hl], a                                  ;; 05:54A8 $77
    ldh  a, [hLinkPositionY]                      ;; 05:54A9 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 05:54AB $21 $10 $C2
    add  hl, bc                                   ;; 05:54AE $09
    add  $05                                      ;; 05:54AF $C6 $05
    ld   [hl], a                                  ;; 05:54B1 $77
    ld   hl, wEntitiesPosZTable                   ;; 05:54B2 $21 $10 $C3
    add  hl, bc                                   ;; 05:54B5 $09
    ld   [hl], b                                  ;; 05:54B6 $70
    ld   a, [wLinkMotionState]                    ;; 05:54B7 $FA $1C $C1
    cp   $02                                      ;; 05:54BA $FE $02
    jr   nz, .jr_54C1                             ;; 05:54BC $20 $03

    ldh  a, [hLinkPositionZ]                      ;; 05:54BE $F0 $A2
    ld   [hl], a                                  ;; 05:54C0 $77

.jr_54C1
    jr   jr_005_5483                              ;; 05:54C1 $18 $C0

