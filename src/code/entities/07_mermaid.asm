; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Mermaid1SpriteVariants::
.variant0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Mermaid2SpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $74, OAM_GBC_PAL_0 | OAMF_PAL1
    db $74, OAM_GBC_PAL_0 | OAMF_PAL1 | OAMF_XFLIP

Data_007_469B::
    db   $00, $FC, $7A, $01, $00, $04, $7C, $01, $00, $0C, $7E, $01, $00, $FC, $7E, $21
    db   $00, $04, $7C, $21, $00, $0C, $7A, $21

Data_007_46B3::
    db   $00, $00, $01, $02, $02, $02, $01, $00

MermaidEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ;; 07:46BB $21 $D0 $C2
    add  hl, bc                                   ;; 07:46BE $09
    ld   a, [hl]                                  ;; 07:46BF $7E
    and  a                                        ;; 07:46C0 $A7
    jp   nz, label_007_490F                       ;; 07:46C1 $C2 $0F $49

    ldh  a, [hActiveEntityState]                  ;; 07:46C4 $F0 $F0
    cp   $02                                      ;; 07:46C6 $FE $02
    jr   nc, jr_007_46E4                          ;; 07:46C8 $30 $1A

    ldh  a, [hRoomStatus]                         ;; 07:46CA $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 07:46CC $E6 $20
    jr   z, .jr_46D2                              ;; 07:46CE $28 $02

    inc  [hl]                                     ;; 07:46D0 $34
    ret                                           ;; 07:46D1 $C9

.jr_46D2
    ldh  a, [hFrameCounter]                       ;; 07:46D2 $F0 $E7
    rra                                           ;; 07:46D4 $1F
    rra                                           ;; 07:46D5 $1F
    rra                                           ;; 07:46D6 $1F
    and  $07                                      ;; 07:46D7 $E6 $07
    ld   e, a                                     ;; 07:46D9 $5F
    ld   d, b                                     ;; 07:46DA $50
    ld   hl, Data_007_46B3                        ;; 07:46DB $21 $B3 $46
    add  hl, de                                   ;; 07:46DE $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:46DF $F0 $EC
    add  [hl]                                     ;; 07:46E1 $86
    ldh  [hActiveEntityVisualPosY], a             ;; 07:46E2 $E0 $EC

jr_007_46E4:
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:46E4 $F0 $F1

.jr_46E6
    cp   $04                                      ;; 07:46E6 $FE $04
    jr   c, .jr_4702                              ;; 07:46E8 $38 $18

    sub  $04                                      ;; 07:46EA $D6 $04
    rla                                           ;; 07:46EC $17
    rla                                           ;; 07:46ED $17
    and  $FC                                      ;; 07:46EE $E6 $FC
    ld   e, a                                     ;; 07:46F0 $5F
    rla                                           ;; 07:46F1 $17
    and  $F8                                      ;; 07:46F2 $E6 $F8
    add  e                                        ;; 07:46F4 $83
    ld   e, a                                     ;; 07:46F5 $5F
    ld   d, b                                     ;; 07:46F6 $50
    ld   hl, Data_007_469B                        ;; 07:46F7 $21 $9B $46
    add  hl, de                                   ;; 07:46FA $19
    ld   c, $03                                   ;; 07:46FB $0E $03
    call RenderActiveEntitySpritesRect            ;; 07:46FD $CD $E6 $3C
    jr   jr_007_470B                              ;; 07:4700 $18 $09

.jr_4702
    ld   de, Mermaid1SpriteVariants               ;; 07:4702 $11 $83 $46
    call RenderActiveEntitySpritesPair            ;; 07:4705 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4708 $CD $8A $3D

jr_007_470B:
    ldh  a, [hActiveEntityState]                  ;; 07:470B $F0 $F0
    cp   $05                                      ;; 07:470D $FE $05
    jr   z, .jr_4715                              ;; 07:470F $28 $04

    cp   $03                                      ;; 07:4711 $FE $03
    jr   nc, jr_007_4727                          ;; 07:4713 $30 $12

.jr_4715
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4715 $F0 $EC
    add  $0B                                      ;; 07:4717 $C6 $0B
    ldh  [hActiveEntityVisualPosY], a             ;; 07:4719 $E0 $EC
    xor  a                                        ;; 07:471B $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:471C $E0 $F1
    ld   de, Mermaid2SpriteVariants               ;; 07:471E $11 $93 $46
    call RenderActiveEntitySpritesPair            ;; 07:4721 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4724 $CD $8A $3D

jr_007_4727:
    ldh  a, [hActiveEntityState]                  ;; 07:4727 $F0 $F0
    cp   $07                                      ;; 07:4729 $FE $07
    jr   c, .jr_4734                              ;; 07:472B $38 $07

    ld   a, $02                                   ;; 07:472D $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:472F $E0 $A1
    ld   [wC167], a                               ;; 07:4731 $EA $67 $C1

.jr_4734
    call ReturnIfNonInteractive_07                ;; 07:4734 $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ;; 07:4737 $F0 $F0
    JP_TABLE                                      ;; 07:4739
._00 dw func_007_4750                             ;; 07:473A
._01 dw func_007_4759                             ;; 07:473C
._02 dw func_007_47AE                             ;; 07:473E
._03 dw func_007_47B1                             ;; 07:4740
._04 dw func_007_47D9                             ;; 07:4742
._05 dw func_007_47F5                             ;; 07:4744
._06 dw func_007_480A                             ;; 07:4746
._07 dw func_007_4867                             ;; 07:4748
._08 dw func_007_488E                             ;; 07:474A
._09 dw func_007_48B0                             ;; 07:474C
._0A dw func_007_48CA                             ;; 07:474E

func_007_4750::
    ld   hl, wEntitiesPrivateState1Table
    add  hl, bc
    ld   [hl], $30
    jp   IncrementEntityState

func_007_4759::
    ld   a, [wGameplayType]                       ;; 07:4759 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 07:475C $FE $0B
    ret  nz                                       ;; 07:475E $C0

    ld   a, [wTransitionSequenceCounter]          ;; 07:475F $FA $6B $C1
    cp   $04                                      ;; 07:4762 $FE $04
    ret  nz                                       ;; 07:4764 $C0

    call GetEntityXDistanceToLink_07              ;; 07:4765 $CD $5D $7E
    ld   a, e                                     ;; 07:4768 $7B
    call SetEntitySpriteVariant                   ;; 07:4769 $CD $0C $3B
    call PushLinkOutOfEntity_07                   ;; 07:476C $CD $F0 $7C
    call GetEntityXDistanceToLink_07              ;; 07:476F $CD $5D $7E
    add  $12                                      ;; 07:4772 $C6 $12
    cp   $24                                      ;; 07:4774 $FE $24
    jr   nc, .jr_4793                             ;; 07:4776 $30 $1B

    call GetEntityYDistanceToLink_07              ;; 07:4778 $CD $6D $7E
    add  $12                                      ;; 07:477B $C6 $12
    cp   $24                                      ;; 07:477D $FE $24
    jr   nc, .jr_4793                             ;; 07:477F $30 $12

    ldh  a, [hLinkPhysicsModifier]                ;; 07:4781 $F0 $9C
    and  a                                        ;; 07:4783 $A7
    jr   z, .jr_4793                              ;; 07:4784 $28 $0D

    call IncrementEntityState                     ;; 07:4786 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:4789 $CD $05 $0C
    ld   [hl], $14                                ;; 07:478C $36 $14
    jp_open_dialog Dialog1F1                      ;; 07:478E

.jr_4793
    call func_007_7D43                            ;; 07:4793 $CD $43 $7D
    ret  nc                                       ;; 07:4796 $D0

    ld   a, [wTradeSequenceItem]                  ;; 07:4797 $FA $0E $DB
    cp   TRADING_ITEM_NECKLACE                    ;; 07:479A $FE $0C
    jr   nz, .jr_47A9                             ;; 07:479C $20 $0B

    call_open_dialog Dialog1F2                    ;; 07:479E
    call IncrementEntityState                     ;; 07:47A3 $CD $12 $3B
    ld   [hl], $05                                ;; 07:47A6 $36 $05
    ret                                           ;; 07:47A8 $C9

.jr_47A9
    jp_open_dialog Dialog1F0                      ;; 07:47A9

func_007_47AE::
    jp   IncrementEntityState                     ;; 07:47AE $C3 $12 $3B

func_007_47B1::
    ld   a, [wDialogState]                        ;; 07:47B1 $FA $9F $C1
    and  a                                        ;; 07:47B4 $A7
    ret  nz                                       ;; 07:47B5 $C0

    call GetEntityTransitionCountdown             ;; 07:47B6 $CD $05 $0C
    jr   nz, .jr_47C8                             ;; 07:47B9 $20 $0D

    ld   [hl], $40                                ;; 07:47BB $36 $40
    call func_007_48FD                            ;; 07:47BD $CD $FD $48
    call IncrementEntityState                     ;; 07:47C0 $CD $12 $3B
    ld   a, $FF                                   ;; 07:47C3 $3E $FF
    jp   SetEntitySpriteVariant                   ;; 07:47C5 $C3 $0C $3B

.jr_47C8
    ld   e, $FF                                   ;; 07:47C8 $1E $FF
    cp   $10                                      ;; 07:47CA $FE $10
    jr   nc, .jr_47D5                             ;; 07:47CC $30 $07

    ld   e, $02                                   ;; 07:47CE $1E $02
    cp   $08                                      ;; 07:47D0 $FE $08
    jr   c, .jr_47D5                              ;; 07:47D2 $38 $01

    inc  e                                        ;; 07:47D4 $1C

.jr_47D5
    ld   a, e                                     ;; 07:47D5 $7B
    jp   SetEntitySpriteVariant                   ;; 07:47D6 $C3 $0C $3B

func_007_47D9::
    call GetEntityTransitionCountdown             ;; 07:47D9 $CD $05 $0C
    ret  nz                                       ;; 07:47DC $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 07:47DD $21 $B0 $C2
    add  hl, bc                                   ;; 07:47E0 $09
    ld   a, [hl]                                  ;; 07:47E1 $7E
    cpl                                           ;; 07:47E2 $2F
    inc  a                                        ;; 07:47E3 $3C
    ld   [hl], a                                  ;; 07:47E4 $77
    ld   hl, wEntitiesPosXTable                   ;; 07:47E5 $21 $00 $C2
    add  hl, bc                                   ;; 07:47E8 $09
    add  [hl]                                     ;; 07:47E9 $86
    ld   [hl], a                                  ;; 07:47EA $77
    ldh  [hActiveEntityPosX], a                   ;; 07:47EB $E0 $EE
    call IncrementEntityState                     ;; 07:47ED $CD $12 $3B
    ld   [hl], $01                                ;; 07:47F0 $36 $01
    jp   func_007_48FD                            ;; 07:47F2 $C3 $FD $48

func_007_47F5::
    call IncrementEntityState                     ;; 07:47F5 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 07:47F8 $FA $77 $C1
    and  a                                        ;; 07:47FB $A7
    jr   nz, .jr_4804                             ;; 07:47FC $20 $06

    call GetEntityTransitionCountdown             ;; 07:47FE $CD $05 $0C
    ld   [hl], $C0                                ;; 07:4801 $36 $C0
    ret                                           ;; 07:4803 $C9

.jr_4804
    ld   [hl], b                                  ;; 07:4804 $70
    jp_open_dialog Dialog1F4                      ;; 07:4805

func_007_480A::
    ld   a, [wDialogState]                        ;; 07:480A $FA $9F $C1
    and  a                                        ;; 07:480D $A7
    ret  nz                                       ;; 07:480E $C0

    call GetEntityTransitionCountdown             ;; 07:480F $CD $05 $0C
    jr   z, jr_007_4854                           ;; 07:4812 $28 $40

    cp   $70                                      ;; 07:4814 $FE $70
    jr   nz, .jr_4820                             ;; 07:4816 $20 $08

    dec  [hl]                                     ;; 07:4818 $35
    push af                                       ;; 07:4819 $F5
    call_open_dialog Dialog1F3                    ;; 07:481A
    pop  af                                       ;; 07:481F $F1

.jr_4820
    cp   $90                                      ;; 07:4820 $FE $90
    jr   nz, .jr_483A                             ;; 07:4822 $20 $16

    ldh  a, [hLinkPositionY]                      ;; 07:4824 $F0 $99
    sub  $03                                      ;; 07:4826 $D6 $03
    ldh  [hMultiPurpose1], a                      ;; 07:4828 $E0 $D8
    ldh  a, [hLinkPositionX]                      ;; 07:482A $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 07:482C $E0 $D7
    ld   a, JINGLE_WATER_SPLASH                   ;; 07:482E $3E $0E
    ldh  [hJingle], a                             ;; 07:4830 $E0 $F2
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 07:4832 $3E $01
    call AddTranscientVfx                         ;; 07:4834 $CD $C7 $0C
    call GetEntityTransitionCountdown             ;; 07:4837 $CD $05 $0C

.jr_483A
    ld   e, $00                                   ;; 07:483A $1E $00
    cp   $20                                      ;; 07:483C $FE $20
    jr   c, .jr_4846                              ;; 07:483E $38 $06

    cp   $90                                      ;; 07:4840 $FE $90
    jr   nc, .jr_4846                             ;; 07:4842 $30 $02

    ld   e, $01                                   ;; 07:4844 $1E $01

.jr_4846
    ld   a, e                                     ;; 07:4846 $7B
    ldh  [hLinkPhysicsModifier], a                ;; 07:4847 $E0 $9C
    ld   hl, hLinkInteractiveMotionBlocked        ;; 07:4849 $21 $A1 $FF
    ld   [hl], $02                                ;; 07:484C $36 $02
    ld   a, $04                                   ;; 07:484E $3E $04
    ld   [wC13B], a                               ;; 07:4850 $EA $3B $C1
    ret                                           ;; 07:4853 $C9

jr_007_4854:
    ld   a, TRADING_ITEM_SCALE & REPLACE_TILES_TRADING_ITEM ;; 07:4854 $3E $0D
    ; both of these defines are $0D, so save an ld instruction
    ld   [wTradeSequenceItem], a                  ;; 07:4856 $EA $0E $DB
    ldh  [hReplaceTiles], a                       ;; 07:4859 $E0 $A5
    call CreateTradingItemEntity                  ;; 07:485B $CD $0C $0C
    call IncrementEntityState                     ;; 07:485E $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:4861 $CD $05 $0C
    ld   [hl], $30                                ;; 07:4864 $36 $30
    ret                                           ;; 07:4866 $C9

func_007_4867::
    call GetEntityTransitionCountdown             ;; 07:4867 $CD $05 $0C
    ret  nz                                       ;; 07:486A $C0

    call IncrementEntityState                     ;; 07:486B $CD $12 $3B
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:486E $F0 $F1
    add  $04                                      ;; 07:4870 $C6 $04
    call SetEntitySpriteVariant                   ;; 07:4872 $CD $0C $3B
    ld   e, $08                                   ;; 07:4875 $1E $08
    cp   $04                                      ;; 07:4877 $FE $04
    jr   nz, .jr_487D                             ;; 07:4879 $20 $02

    ld   e, $F8                                   ;; 07:487B $1E $F8

.jr_487D
    ld   hl, wEntitiesSpeedXTable                 ;; 07:487D $21 $40 $C2
    add  hl, bc                                   ;; 07:4880 $09
    ld   [hl], e                                  ;; 07:4881 $73
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4882 $21 $20 $C3
    add  hl, bc                                   ;; 07:4885 $09
    ld   [hl], $20                                ;; 07:4886 $36 $20
    call func_007_48FD                            ;; 07:4888 $CD $FD $48
    jp   func_007_733F                            ;; 07:488B $C3 $3F $73

func_007_488E::
    call UpdateEntityPosWithSpeed_07              ;; 07:488E $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ;; 07:4891 $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4894 $21 $20 $C3
    add  hl, bc                                   ;; 07:4897 $09
    dec  [hl]                                     ;; 07:4898 $35
    dec  [hl]                                     ;; 07:4899 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:489A $21 $10 $C3
    add  hl, bc                                   ;; 07:489D $09
    ld   a, [hl]                                  ;; 07:489E $7E
    and  $80                                      ;; 07:489F $E6 $80
    jr   z, .ret_48AF                             ;; 07:48A1 $28 $0C

    ld   [hl], b                                  ;; 07:48A3 $70
    call IncrementEntityState                     ;; 07:48A4 $CD $12 $3B
    call func_007_48FD                            ;; 07:48A7 $CD $FD $48
    call GetEntityTransitionCountdown             ;; 07:48AA $CD $05 $0C
    ld   [hl], $10                                ;; 07:48AD $36 $10

.ret_48AF
    ret                                           ;; 07:48AF $C9

func_007_48B0::
    call GetEntityTransitionCountdown             ;; 07:48B0 $CD $05 $0C
    jr   nz, .jr_48BF                             ;; 07:48B3 $20 $0A

    ld   [hl], $20                                ;; 07:48B5 $36 $20
    ld   a, $FF                                   ;; 07:48B7 $3E $FF
    call SetEntitySpriteVariant                   ;; 07:48B9 $CD $0C $3B
    jp   IncrementEntityState                     ;; 07:48BC $C3 $12 $3B

.jr_48BF
    ld   e, $02                                   ;; 07:48BF $1E $02
    cp   $08                                      ;; 07:48C1 $FE $08
    jr   nc, .jr_48C6                             ;; 07:48C3 $30 $01

    inc  e                                        ;; 07:48C5 $1C

.jr_48C6
    ld   a, e                                     ;; 07:48C6 $7B
    jp   SetEntitySpriteVariant                   ;; 07:48C7 $C3 $0C $3B

func_007_48CA::
    call GetEntityTransitionCountdown             ;; 07:48CA $CD $05 $0C
    ret  nz                                       ;; 07:48CD $C0

    ld   hl, wEntitiesPrivateState5Table          ;; 07:48CE $21 $90 $C3
    add  hl, bc                                   ;; 07:48D1 $09
    ld   a, [hl]                                  ;; 07:48D2 $7E
    cp   $03                                      ;; 07:48D3 $FE $03
    jr   nz, .jr_48E0                             ;; 07:48D5 $20 $09

    xor  a                                        ;; 07:48D7 $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:48D8 $E0 $A1
    ld   [wC167], a                               ;; 07:48DA $EA $67 $C1
    jp   ClearEntityStatus_07                     ;; 07:48DD $C3 $A4 $7E

.jr_48E0
    inc  [hl]                                     ;; 07:48E0 $34
    call GetRandomByte                            ;; 07:48E1 $CD $0D $28
    and  $01                                      ;; 07:48E4 $E6 $01
    call SetEntitySpriteVariant                   ;; 07:48E6 $CD $0C $3B
    ld   e, $10                                   ;; 07:48E9 $1E $10
    and  a                                        ;; 07:48EB $A7
    jr   z, .jr_48F0                              ;; 07:48EC $28 $02

    ld   e, $F0                                   ;; 07:48EE $1E $F0

.jr_48F0
    ld   hl, wEntitiesPosYTable                   ;; 07:48F0 $21 $10 $C2
    add  hl, bc                                   ;; 07:48F3 $09
    ld   a, [hl]                                  ;; 07:48F4 $7E
    add  e                                        ;; 07:48F5 $83
    ld   [hl], a                                  ;; 07:48F6 $77
    call IncrementEntityState                     ;; 07:48F7 $CD $12 $3B
    ld   [hl], $07                                ;; 07:48FA $36 $07
    ret                                           ;; 07:48FC $C9

func_007_48FD::
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:48FD $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 07:48FF $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ;; 07:4901 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 07:4903 $E0 $D7
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 07:4905 $3E $01
    call AddTranscientVfx                         ;; 07:4907 $CD $C7 $0C
    ld   a, JINGLE_WATER_SPLASH                   ;; 07:490A $3E $0E
    ldh  [hJingle], a                             ;; 07:490C $E0 $F2
    ret                                           ;; 07:490E $C9

label_007_490F:
    push bc                                       ;; 07:490F $C5
    sla  c                                        ;; 07:4910 $CB $21
    sla  c                                        ;; 07:4912 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 07:4914 $21 $80 $D5
    add  hl, bc                                   ;; 07:4917 $09
    inc  hl                                       ;; 07:4918 $23
    ld   a, $0A                                   ;; 07:4919 $3E $0A
    ld   [hl+], a                                 ;; 07:491B $22
    ld   a, $FC                                   ;; 07:491C $3E $FC
    ld   [hl+], a                                 ;; 07:491E $22
    ld   a, $10                                   ;; 07:491F $3E $10
    ld   [hl], a                                  ;; 07:4921 $77
    pop  bc                                       ;; 07:4922 $C1
    ldh  a, [hActiveEntityState]                  ;; 07:4923 $F0 $F0
    JP_TABLE                                      ;; 07:4925
._00 dw func_007_492E                             ;; 07:4926
._01 dw func_007_4945                             ;; 07:4928
._02 dw func_007_4959                             ;; 07:492A
._03 dw func_007_4982                             ;; 07:492C

func_007_492E::
    call ReturnIfNonInteractive_07                ;; 07:492E $CD $96 $7D
    ld   hl, wEntitiesPosXTable                   ;; 07:4931 $21 $00 $C2
    add  hl, bc                                   ;; 07:4934 $09
    ld   [hl], $58                                ;; 07:4935 $36 $58
    ld   hl, wEntitiesPosYTable                   ;; 07:4937 $21 $10 $C2
    add  hl, bc                                   ;; 07:493A $09
    ld   [hl], $80                                ;; 07:493B $36 $80
    ld   a, [wC130]                               ;; 07:493D $FA $30 $C1
    and  a                                        ;; 07:4940 $A7
    ret  z                                        ;; 07:4941 $C8

    jp   IncrementEntityState                     ;; 07:4942 $C3 $12 $3B

func_007_4945::
    call ReturnIfNonInteractive_07                ;; 07:4945 $CD $96 $7D
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4948 $21 $20 $C3
    add  hl, bc                                   ;; 07:494B $09
    ld   [hl], $20                                ;; 07:494C $36 $20
    call GetEntitySpeedYAddress                   ;; 07:494E $CD $05 $40
    ld   [hl], $FC                                ;; 07:4951 $36 $FC
    call func_007_48FD                            ;; 07:4953 $CD $FD $48
    jp   IncrementEntityState                     ;; 07:4956 $C3 $12 $3B

func_007_4959::
    call func_007_49DC                            ;; 07:4959 $CD $DC $49
    call ReturnIfNonInteractive_07                ;; 07:495C $CD $96 $7D
    call UpdateEntityPosWithSpeed_07              ;; 07:495F $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ;; 07:4962 $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4965 $21 $20 $C3
    add  hl, bc                                   ;; 07:4968 $09
    dec  [hl]                                     ;; 07:4969 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:496A $21 $10 $C3
    add  hl, bc                                   ;; 07:496D $09
    ld   a, [hl]                                  ;; 07:496E $7E
    and  $80                                      ;; 07:496F $E6 $80
    jr   z, .jr_4977                              ;; 07:4971 $28 $04

    ld   [hl], b                                  ;; 07:4973 $70
    call IncrementEntityState                     ;; 07:4974 $CD $12 $3B

.jr_4977
    ldh  a, [hFrameCounter]                       ;; 07:4977 $F0 $E7
    rra                                           ;; 07:4979 $1F
    rra                                           ;; 07:497A $1F
    rra                                           ;; 07:497B $1F
    rra                                           ;; 07:497C $1F
    and  $01                                      ;; 07:497D $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:497F $C3 $0C $3B

func_007_4982::
    call PushLinkOutOfEntity_07                   ;; 07:4982 $CD $F0 $7C
    call GetEntityXDistanceToLink_07              ;; 07:4985 $CD $5D $7E
    ld   a, e                                     ;; 07:4988 $7B
    add  $02                                      ;; 07:4989 $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:498B $E0 $F1
    call func_007_49DC                            ;; 07:498D $CD $DC $49
    call ReturnIfNonInteractive_07                ;; 07:4990 $CD $96 $7D
    call func_007_7D43                            ;; 07:4993 $CD $43 $7D
    ret  nc                                       ;; 07:4996 $D0

    jp_open_dialog Dialog1F7                      ;; 07:4997

Data_007_499C::
    db   $F0, $00, $70, $01, $F0, $08, $72, $01, $00, $00, $74, $01, $00, $08, $76, $01
    db   $F0, $00, $72, $21, $F0, $08, $70, $21, $00, $00, $76, $21, $00, $08, $74, $21
    db   $F0, $FF, $72, $21, $F0, $07, $70, $21, $00, $00, $7A, $21, $00, $08, $78, $21
    db   $F0, $01, $70, $01, $F0, $09, $72, $01, $00, $00, $78, $01, $00, $08, $7A, $01

func_007_49DC::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:49DC $F0 $F1
    rla                                           ;; 07:49DE $17
    rla                                           ;; 07:49DF $17
    rla                                           ;; 07:49E0 $17
    rla                                           ;; 07:49E1 $17
    and  $F0                                      ;; 07:49E2 $E6 $F0
    ld   e, a                                     ;; 07:49E4 $5F
    ld   d, b                                     ;; 07:49E5 $50
    ld   hl, Data_007_499C                        ;; 07:49E6 $21 $9C $49
    add  hl, de                                   ;; 07:49E9 $19
    ld   c, $04                                   ;; 07:49EA $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 07:49EC $C3 $E6 $3C
