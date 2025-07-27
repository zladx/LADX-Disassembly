; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KikiTheMonkey2SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KikiTheMonkey1SpriteVariants::
.variant0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

KikiTheMonkeyEntityHandler::
    ldh  a, [hRoomStatus]                         ;; 07:5842 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 07:5844 $E6 $10
    jp   nz, ClearEntityStatus_07                 ;; 07:5846 $C2 $A4 $7E

    ld   de, KikiTheMonkey2SpriteVariants         ;; 07:5849 $11 $1A $58
    ld   hl, wEntitiesDirectionTable              ;; 07:584C $21 $80 $C3
    add  hl, bc                                   ;; 07:584F $09
    ld   a, [hl]                                  ;; 07:5850 $7E
    and  a                                        ;; 07:5851 $A7
    jr   nz, .render                              ;; 07:5852 $20 $03

    ld   de, KikiTheMonkey1SpriteVariants         ;; 07:5854 $11 $2E $58

.render:
    call RenderActiveEntitySpritesPair            ;; 07:5857 $CD $C0 $3B
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 07:585A $21 $80 $C4
    add  hl, bc                                   ;; 07:585D $09
    ld   a, [hl]                                  ;; 07:585E $7E
    and  a                                        ;; 07:585F $A7
    jr   z, .jr_5874                              ;; 07:5860 $28 $12

    xor  a                                        ;; 07:5862 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:5863 $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5865 $F0 $EC
    sub  $0E                                      ;; 07:5867 $D6 $0E
    ldh  [hActiveEntityVisualPosY], a             ;; 07:5869 $E0 $EC
    ld   de, KikiTheMonkey3SpriteVariants         ;; 07:586B $11 $4D $59
    call RenderActiveEntitySpritesPair            ;; 07:586E $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:5871 $CD $8A $3D

.jr_5874
    call ReturnIfNonInteractive_07                ;; 07:5874 $CD $96 $7D
    call AddEntityZSpeedToPos_07                  ;; 07:5877 $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:587A $21 $20 $C3
    add  hl, bc                                   ;; 07:587D $09
    dec  [hl]                                     ;; 07:587E $35
    dec  [hl]                                     ;; 07:587F $35
    ld   hl, wEntitiesPosZTable                   ;; 07:5880 $21 $10 $C3
    add  hl, bc                                   ;; 07:5883 $09
    ld   a, [hl]                                  ;; 07:5884 $7E
    and  $80                                      ;; 07:5885 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 07:5887 $E0 $E8
    jr   z, .jr_5891                              ;; 07:5889 $28 $06

    ld   [hl], b                                  ;; 07:588B $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:588C $21 $20 $C3
    add  hl, bc                                   ;; 07:588F $09
    ld   [hl], b                                  ;; 07:5890 $70

.jr_5891
    ldh  a, [hActiveEntityState]                  ;; 07:5891 $F0 $F0
    JP_TABLE                                      ;; 07:5893
._00 dw func_007_58A8                             ;; 07:5894
._01 dw func_007_591A                             ;; 07:5896
._02 dw func_007_5934                             ;; 07:5898
._03 dw func_007_5951                             ;; 07:589A
._04 dw func_007_5997                             ;; 07:589C
._05 dw func_007_5AAC                             ;; 07:589E
._06 dw func_007_5B25                             ;; 07:58A0
._07 dw func_007_5B69                             ;; 07:58A2
._08 dw func_007_5BD9                             ;; 07:58A4
._09 dw func_007_5BF0                             ;; 07:58A6

func_007_58A8::
    ld   a, [wIsBowWowFollowingLink]              ;; 07:58A8 $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 07:58AB $FE $01
    jr   nz, jr_007_58DE                          ;; 07:58AD $20 $2F

    ld   hl, wEntitiesFlashCountdownTable         ;; 07:58AF $21 $20 $C4
    add  hl, bc                                   ;; 07:58B2 $09
    ld   a, [hl]                                  ;; 07:58B3 $7E
    and  a                                        ;; 07:58B4 $A7
    jr   nz, .jr_58C9                             ;; 07:58B5 $20 $12

    call GetEntityXDistanceToLink_07              ;; 07:58B7 $CD $5D $7E
    add  $18                                      ;; 07:58BA $C6 $18
    cp   $30                                      ;; 07:58BC $FE $30
    jr   nc, KikiOpenDialog.return                ;; 07:58BE $30 $1D

    call GetEntityYDistanceToLink_07              ;; 07:58C0 $CD $6D $7E
    add  $18                                      ;; 07:58C3 $C6 $18
    cp   $30                                      ;; 07:58C5 $FE $30
    jr   nc, KikiOpenDialog.return                ;; 07:58C7 $30 $14

.jr_58C9
    call GetEntityTransitionCountdown             ;; 07:58C9 $CD $05 $0C
    ld   [hl], $10                                ;; 07:58CC $36 $10
    call IncrementEntityState                     ;; 07:58CE $CD $12 $3B
    ld   [hl], $05                                ;; 07:58D1 $36 $05
    ld_dialog_low a, Dialog160 ; "Let's battle!"  ;; 07:58D3 $3E $60

KikiOpenDialog::
    call OpenDialogInTable1                       ;; 07:58D5 $CD $73 $23

    ld   a, $14                                   ;; 07:58D8 $3E $14
    ld   [wDialogSFX], a                          ;; 07:58DA $EA $AB $C5

.return
    ret                                           ;; 07:58DD $C9

jr_007_58DE:
    call PushLinkOutOfEntity_07                   ;; 07:58DE $CD $F0 $7C
    call func_007_7D43                            ;; 07:58E1 $CD $43 $7D
    jr   nc, func_007_58FA                        ;; 07:58E4 $30 $14

    ld   a, [wTradeSequenceItem]                  ;; 07:58E6 $FA $0E $DB
    cp   TRADING_ITEM_BANANAS                     ;; 07:58E9 $FE $04
    jr   nz, .jr_58F5                             ;; 07:58EB $20 $08

    ld_dialog_low a, Dialog165 ; "Give to Kiki?"  ;; 07:58ED $3E $65
    call KikiOpenDialog                           ;; 07:58EF $CD $D5 $58
    jp   IncrementEntityState                     ;; 07:58F2 $C3 $12 $3B

.jr_58F5
    ld_dialog_low a, Dialog161 ; "Hungry!"        ;; 07:58F5 $3E $61
    call KikiOpenDialog                           ;; 07:58F7 $CD $D5 $58

func_007_58FA::
    ldh  a, [hFrameCounter]                       ;; 07:58FA $F0 $E7
    rra                                           ;; 07:58FC $1F
    rra                                           ;; 07:58FD $1F
    rra                                           ;; 07:58FE $1F
    and  $01                                      ;; 07:58FF $E6 $01
    call SetEntitySpriteVariant                   ;; 07:5901 $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 07:5904 $F0 $E7
    and  $1F                                      ;; 07:5906 $E6 $1F
    jr   nz, .ret_5919                            ;; 07:5908 $20 $0F

    call GetRandomByte                            ;; 07:590A $CD $0D $28
    and  $01                                      ;; 07:590D $E6 $01
    jr   nz, .ret_5919                            ;; 07:590F $20 $08

    ld   hl, wEntitiesDirectionTable              ;; 07:5911 $21 $80 $C3
    add  hl, bc                                   ;; 07:5914 $09
    ld   a, [hl]                                  ;; 07:5915 $7E
    xor  $01                                      ;; 07:5916 $EE $01
    ld   [hl], a                                  ;; 07:5918 $77

.ret_5919
    ret                                           ;; 07:5919 $C9

func_007_591A::
    ld   a, [wDialogState]                        ;; 07:591A $FA $9F $C1
    and  a                                        ;; 07:591D $A7
    ret  nz                                       ;; 07:591E $C0

    call IncrementEntityState                     ;; 07:591F $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 07:5922 $FA $77 $C1
    and  a                                        ;; 07:5925 $A7
    jr   nz, .jr_592E                             ;; 07:5926 $20 $06

    call GetEntityTransitionCountdown             ;; 07:5928 $CD $05 $0C
    ld   [hl], $10                                ;; 07:592B $36 $10
    ret                                           ;; 07:592D $C9

.jr_592E
    ld   [hl], b                                  ;; 07:592E $70
    ld_dialog_low a, Dialog161 ; "Hungry!"        ;; 07:592F $3E $61
    jp   KikiOpenDialog                           ;; 07:5931 $C3 $D5 $58

func_007_5934::
    call GetEntityTransitionCountdown             ;; 07:5934 $CD $05 $0C
    jr   nz, .jr_5948                             ;; 07:5937 $20 $0F

    ld   [hl], $80                                ;; 07:5939 $36 $80
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 07:593B $21 $80 $C4
    add  hl, bc                                   ;; 07:593E $09
    ld   [hl], $80                                ;; 07:593F $36 $80
    ld   a, JINGLE_TREASURE_FOUND                 ;; 07:5941 $3E $01
    ldh  [hJingle], a                             ;; 07:5943 $E0 $F2
    call IncrementEntityState                     ;; 07:5945 $CD $12 $3B

.jr_5948
    ld   a, $02                                   ;; 07:5948 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:594A $E0 $A1
    ret                                           ;; 07:594C $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KikiTheMonkey3SpriteVariants::
.variant0
    db $9A, $17
    db $9C, $17

func_007_5951::
    ld   a, $03                                   ;; 07:5951 $3E $03
    call SetEntitySpriteVariant                   ;; 07:5953 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 07:5956 $CD $05 $0C
    jr   nz, .jr_596A                             ;; 07:5959 $20 $0F

    ld   a, MUSIC_MONKEYS_BUILDING_BRIDGE         ;; 07:595B $3E $36
    ld   [wMusicTrackToPlay], a                   ;; 07:595D $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ;; 07:5960 $E0 $B0
    call GetEntitySlowTransitionCountdown         ;; 07:5962 $CD $FB $0B
    ld   [hl], $80                                ;; 07:5965 $36 $80
    jp   IncrementEntityState                     ;; 07:5967 $C3 $12 $3B

.jr_596A
    cp   $10                                      ;; 07:596A $FE $10
    jr   nz, .jr_5973                             ;; 07:596C $20 $05

    ld_dialog_low a, Dialog162 ; "Repay him!"     ;; 07:596E $3E $62
    call KikiOpenDialog                           ;; 07:5970 $CD $D5 $58

.jr_5973
    ld   a, $02                                   ;; 07:5973 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:5975 $E0 $A1
    ret                                           ;; 07:5977 $C9

Data_007_5978::
    db   $48, $48, $48, $48, $48, $48, $48

Data_007_597F::
    db   $18, $20, $28, $30, $38, $40, $48

Data_007_5986::
    db   $00, $78, $28, $58, $40, $30, $60

Data_007_598D::
    db   $00, $00, $80, $80, $00, $80, $00

Data_007_5994::
    db   $10, $30, $20

func_007_5997::
    ld   a, $02                                   ;; 07:5997 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:5999 $E0 $A1
    call func_007_58FA                            ;; 07:599B $CD $FA $58
    call GetEntitySlowTransitionCountdown         ;; 07:599E $CD $FB $0B

.jr_59A1
    jr   nz, jr_007_59C8                          ;; 07:59A1 $20 $25

    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 07:59A3 $3E $02
    ldh  [hJingle], a                             ;; 07:59A5 $E0 $F2
    ld   a, [wOverworldRoomStatus + $7B]          ;; 07:59A7 $FA $7B $D8
    or   OW_ROOM_STATUS_CHANGED                   ;; 07:59AA $F6 $10
    ld   [wOverworldRoomStatus + $7B], a          ;; 07:59AC $EA $7B $D8
    ld   a, $01                                   ;; 07:59AF $3E $01
    ld   [wExchangingTradeSequenceItem], a        ;; 07:59B1 $EA $7F $DB

    ld_dialog_low a, Dialog163 ; "Done!"          ;; 07:59B4 $3E $63
    ld   [wC168], a                               ;; 07:59B6 $EA $68 $C1
    call KikiOpenDialog                           ;; 07:59B9 $CD $D5 $58
    call IncrementEntityState                     ;; 07:59BC $CD $12 $3B

    ld   [hl], $05                                ;; 07:59BF $36 $05
    ld   hl, wEntitiesInertiaTable                ;; 07:59C1 $21 $D0 $C3
    add  hl, bc                                   ;; 07:59C4 $09

.jr_59C5
    ld   [hl], $06                                ;; 07:59C5 $36 $06
    ret                                           ;; 07:59C7 $C9

jr_007_59C8:
    cp   $01                                      ;; 07:59C8 $FE $01
    jr   nz, .jr_59D5                             ;; 07:59CA $20 $09

    ld   a, TRADING_ITEM_STICK                    ;; 07:59CC $3E $05
    ld   [wTradeSequenceItem], a                  ;; 07:59CE $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 07:59D1 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 07:59D3 $E0 $A5

.jr_59D5
    ldh  a, [hFrameCounter]                       ;; 07:59D5 $F0 $E7
    and  $1F                                      ;; 07:59D7 $E6 $1F
    jr   nz, jr_007_5A2A                          ;; 07:59D9 $20 $4F

    ld   hl, wEntitiesPrivateState3Table          ;; 07:59DB $21 $D0 $C2
    add  hl, bc                                   ;; 07:59DE $09
    ld   a, [hl]                                  ;; 07:59DF $7E
    cp   $07                                      ;; 07:59E0 $FE $07

.jr_59E2
    jr   z, jr_007_5A2A                           ;; 07:59E2 $28 $46

    ld   a, ENTITY_KIKI_THE_MONKEY                ;; 07:59E4 $3E $AD
    call SpawnNewEntity_trampoline                ;; 07:59E6 $CD $86 $3B
    jr   c, jr_007_5A2A                           ;; 07:59E9 $38 $3F

    push bc                                       ;; 07:59EB $C5
    call func_007_733F                            ;; 07:59EC $CD $3F $73
    ld   hl, wEntitiesPrivateState3Table          ;; 07:59EF $21 $D0 $C2
    add  hl, bc                                   ;; 07:59F2 $09
    ld   c, [hl]                                  ;; 07:59F3 $4E
    inc  [hl]                                     ;; 07:59F4 $34
    ld   hl, Data_007_5978                        ;; 07:59F5 $21 $78 $59
    add  hl, bc                                   ;; 07:59F8 $09
    ld   a, [hl]                                  ;; 07:59F9 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 07:59FA $21 $B0 $C2
    add  hl, de                                   ;; 07:59FD $19
    ld   [hl], a                                  ;; 07:59FE $77
    ld   hl, Data_007_597F                        ;; 07:59FF $21 $7F $59
    add  hl, bc                                   ;; 07:5A02 $09
    ld   a, [hl]                                  ;; 07:5A03 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 07:5A04 $21 $C0 $C2
    add  hl, de                                   ;; 07:5A07 $19
    ld   [hl], a                                  ;; 07:5A08 $77
    ld   hl, Data_007_5986                        ;; 07:5A09 $21 $86 $59
    add  hl, bc                                   ;; 07:5A0C $09
    ld   a, [hl]                                  ;; 07:5A0D $7E
    ld   hl, wEntitiesPosXTable                   ;; 07:5A0E $21 $00 $C2
    add  hl, de                                   ;; 07:5A11 $19
    ld   [hl], a                                  ;; 07:5A12 $77
    ld   hl, Data_007_598D                        ;; 07:5A13 $21 $8D $59
    add  hl, bc                                   ;; 07:5A16 $09
    ld   a, [hl]                                  ;; 07:5A17 $7E
    ld   hl, wEntitiesPosYTable                   ;; 07:5A18 $21 $10 $C2
    add  hl, de                                   ;; 07:5A1B $19
    ld   [hl], a                                  ;; 07:5A1C $77
    ld   hl, wEntitiesStateTable                  ;; 07:5A1D $21 $90 $C2
    add  hl, de                                   ;; 07:5A20 $19
    ld   [hl], $07                                ;; 07:5A21 $36 $07
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 07:5A23 $21 $00 $C3
    add  hl, de                                   ;; 07:5A26 $19
    ld   [hl], $80                                ;; 07:5A27 $36 $80
    pop  bc                                       ;; 07:5A29 $C1

jr_007_5A2A:
    call GetEntitySlowTransitionCountdown         ;; 07:5A2A $CD $FB $0B
    cp   $40                                      ;; 07:5A2D $FE $40
    ret  nc                                       ;; 07:5A2F $D0

    ldh  a, [hFrameCounter]                       ;; 07:5A30 $F0 $E7
    and  $3F                                      ;; 07:5A32 $E6 $3F
    ret  nz                                       ;; 07:5A34 $C0

    ld   hl, wEntitiesPrivateState4Table          ;; 07:5A35 $21 $40 $C4
    add  hl, bc                                   ;; 07:5A38 $09
    ld   a, [hl]                                  ;; 07:5A39 $7E
    cp   $03                                      ;; 07:5A3A $FE $03
    ret  nc                                       ;; 07:5A3C $D0

    ld   e, a                                     ;; 07:5A3D $5F
    ld   d, b                                     ;; 07:5A3E $50
    inc  [hl]                                     ;; 07:5A3F $34
    ld   hl, Data_007_5994                        ;; 07:5A40 $21 $94 $59
    add  hl, de                                   ;; 07:5A43 $19
    ld   a, [hl]                                  ;; 07:5A44 $7E
    ldh  [hIntersectedObjectTop], a               ;; 07:5A45 $E0 $CD
    ld   a, $40                                   ;; 07:5A47 $3E $40
    ldh  [hIntersectedObjectLeft], a              ;; 07:5A49 $E0 $CE
    call label_2887                               ;; 07:5A4B $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 07:5A4E $F0 $FE
    and  a                                        ;; 07:5A50 $A7
    jr   z, .jr_5A5F                              ;; 07:5A51 $28 $0C

    push bc                                       ;; 07:5A53 $C5
    ld   a, $DB                                   ;; 07:5A54 $3E $DB
    ld   [wDDD8], a                               ;; 07:5A56 $EA $D8 $DD
    ld   a, $07                                   ;; 07:5A59 $3E $07
    call func_91D                                 ;; 07:5A5B $CD $1D $09
    pop  bc                                       ;; 07:5A5E $C1

.jr_5A5F
    ld   hl, wDrawCommand                         ;; 07:5A5F $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 07:5A62 $FA $00 $D6
    ld   e, a                                     ;; 07:5A65 $5F
    add  $0A                                      ;; 07:5A66 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 07:5A68 $EA $00 $D6
    ld   d, $00                                   ;; 07:5A6B $16 $00
    add  hl, de                                   ;; 07:5A6D $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:5A6E $F0 $CF
    ld   [hl+], a                                 ;; 07:5A70 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:5A71 $F0 $D0
    ld   [hl+], a                                 ;; 07:5A73 $22
    ld   a, $81                                   ;; 07:5A74 $3E $81
    ld   [hl+], a                                 ;; 07:5A76 $22
    ld   a, $0C                                   ;; 07:5A77 $3E $0C
    ld   [hl+], a                                 ;; 07:5A79 $22
    ld   a, $1C                                   ;; 07:5A7A $3E $1C
    ld   [hl+], a                                 ;; 07:5A7C $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:5A7D $F0 $CF
    ld   [hl+], a                                 ;; 07:5A7F $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:5A80 $F0 $D0
    inc  a                                        ;; 07:5A82 $3C
    ld   [hl+], a                                 ;; 07:5A83 $22
    ld   a, $81                                   ;; 07:5A84 $3E $81
    ld   [hl+], a                                 ;; 07:5A86 $22
    ld   a, $0D                                   ;; 07:5A87 $3E $0D
    ld   [hl+], a                                 ;; 07:5A89 $22
    ld   a, $1D                                   ;; 07:5A8A $3E $1D
    ld   [hl+], a                                 ;; 07:5A8C $22
    ld   [hl], b                                  ;; 07:5A8D $70
    ld   hl, wRoomObjectsArea + $25               ;; 07:5A8E $21 $25 $D7
    ld   [hl], $DB                                ;; 07:5A91 $36 $DB
    ld   a, $87                                   ;; 07:5A93 $3E $87
    call BackupObjectInRAM2                       ;; 07:5A95 $CD $2F $0B
    ld   hl, wRoomObjectsArea + $35               ;; 07:5A98 $21 $35 $D7
    ld   [hl], $DB                                ;; 07:5A9B $36 $DB
    ld   a, $87                                   ;; 07:5A9D $3E $87
    call BackupObjectInRAM2                       ;; 07:5A9F $CD $2F $0B
    ld   hl, wRoomObjectsArea + $45               ;; 07:5AA2 $21 $45 $D7
    ld   [hl], $DB                                ;; 07:5AA5 $36 $DB
    ld   a, $87                                   ;; 07:5AA7 $3E $87
    jp   BackupObjectInRAM2                       ;; 07:5AA9 $C3 $2F $0B

func_007_5AAC::
    call GetEntityTransitionCountdown             ;; 07:5AAC $CD $05 $0C
    jr   nz, jr_007_5B19                          ;; 07:5AAF $20 $68

    call IncrementEntityState                     ;; 07:5AB1 $CD $12 $3B
    ld   hl, wEntitiesInertiaTable                ;; 07:5AB4 $21 $D0 $C3
    add  hl, bc                                   ;; 07:5AB7 $09
    ld   a, [hl]                                  ;; 07:5AB8 $7E
    cp   $05                                      ;; 07:5AB9 $FE $05
    jr   c, jr_007_5ADE                           ;; 07:5ABB $38 $21

    call GetRandomByte                            ;; 07:5ABD $CD $0D $28
    and  $0F                                      ;; 07:5AC0 $E6 $0F
    add  $10                                      ;; 07:5AC2 $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ;; 07:5AC4 $21 $20 $C3
    add  hl, bc                                   ;; 07:5AC7 $09
    ld   [hl], a                                  ;; 07:5AC8 $77
    ld   e, $10                                   ;; 07:5AC9 $1E $10
    and  $01                                      ;; 07:5ACB $E6 $01
    jr   z, .jr_5AD1                              ;; 07:5ACD $28 $02

    ld   e, $F0                                   ;; 07:5ACF $1E $F0

.jr_5AD1
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5AD1 $21 $40 $C2
    add  hl, bc                                   ;; 07:5AD4 $09
    ld   [hl], e                                  ;; 07:5AD5 $73
    call GetEntitySpeedYAddress                   ;; 07:5AD6 $CD $05 $40
    ld   [hl], $F0                                ;; 07:5AD9 $36 $F0
    jp   func_007_5B08                            ;; 07:5ADB $C3 $08 $5B

jr_007_5ADE:
    ld   hl, wEntitiesSpeedZTable                 ;; 07:5ADE $21 $20 $C3
    add  hl, bc                                   ;; 07:5AE1 $09
    ld   [hl], $18                                ;; 07:5AE2 $36 $18
    ldh  a, [hLinkPositionX]                      ;; 07:5AE4 $F0 $98
    push af                                       ;; 07:5AE6 $F5
    ldh  a, [hLinkPositionY]                      ;; 07:5AE7 $F0 $99
    push af                                       ;; 07:5AE9 $F5
    ld   a, [wD154]                               ;; 07:5AEA $FA $54 $D1
    ld   e, a                                     ;; 07:5AED $5F
    ld   d, b                                     ;; 07:5AEE $50
    ld   hl, wEntitiesPosXTable                   ;; 07:5AEF $21 $00 $C2
    add  hl, de                                   ;; 07:5AF2 $19
    ld   a, [hl]                                  ;; 07:5AF3 $7E
    ldh  [hLinkPositionX], a                      ;; 07:5AF4 $E0 $98
    ld   hl, wEntitiesPosYTable                   ;; 07:5AF6 $21 $10 $C2
    add  hl, de                                   ;; 07:5AF9 $19
    ld   a, [hl]                                  ;; 07:5AFA $7E
    ldh  [hLinkPositionY], a                      ;; 07:5AFB $E0 $99
    ld   a, $14                                   ;; 07:5AFD $3E $14
    call ApplyVectorTowardsLink_trampoline        ;; 07:5AFF $CD $AA $3B
    pop  af                                       ;; 07:5B02 $F1
    ldh  [hLinkPositionY], a                      ;; 07:5B03 $E0 $99
    pop  af                                       ;; 07:5B05 $F1
    ldh  [hLinkPositionX], a                      ;; 07:5B06 $E0 $98

func_007_5B08::
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5B08 $21 $40 $C2
    add  hl, bc                                   ;; 07:5B0B $09
    ld   a, [hl]                                  ;; 07:5B0C $7E
    ld   e, $00                                   ;; 07:5B0D $1E $00
    and  $80                                      ;; 07:5B0F $E6 $80
    jr   z, .jr_5B14                              ;; 07:5B11 $28 $01

    inc  e                                        ;; 07:5B13 $1C

.jr_5B14
    ld   hl, wEntitiesDirectionTable              ;; 07:5B14 $21 $80 $C3
    add  hl, bc                                   ;; 07:5B17 $09
    ld   [hl], e                                  ;; 07:5B18 $73

jr_007_5B19:
    call func_007_58FA                            ;; 07:5B19 $CD $FA $58
    call GetEntityPrivateCountdown1               ;; 07:5B1C $CD $00 $0C
    ret  z                                        ;; 07:5B1F $C8

    ld   a, $04                                   ;; 07:5B20 $3E $04
    jp   SetEntitySpriteVariant                   ;; 07:5B22 $C3 $0C $3B

func_007_5B25::
    call UpdateEntityPosWithSpeed_07              ;; 07:5B25 $CD $0A $7E
    ldh  a, [hActiveEntityPosY]                   ;; 07:5B28 $F0 $EF
    cp   $08                                      ;; 07:5B2A $FE $08
    jp   c, ClearEntityStatus_07                  ;; 07:5B2C $DA $A4 $7E

    ld   hl, wEntitiesInertiaTable                ;; 07:5B2F $21 $D0 $C3
    add  hl, bc                                   ;; 07:5B32 $09
    ld   a, [hl]                                  ;; 07:5B33 $7E
    cp   $05                                      ;; 07:5B34 $FE $05
    jr   nc, .jr_5B3B                             ;; 07:5B36 $30 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 07:5B38 $CD $23 $3B

.jr_5B3B
    ldh  a, [hMultiPurposeG]                      ;; 07:5B3B $F0 $E8
    and  a                                        ;; 07:5B3D $A7
    jr   z, jr_007_5B64                           ;; 07:5B3E $28 $24

    call IncrementEntityState                     ;; 07:5B40 $CD $12 $3B
    ld   [hl], $05                                ;; 07:5B43 $36 $05
    ld   hl, wEntitiesInertiaTable                ;; 07:5B45 $21 $D0 $C3
    add  hl, bc                                   ;; 07:5B48 $09
    ld   a, [hl]                                  ;; 07:5B49 $7E
    cp   $05                                      ;; 07:5B4A $FE $05
    jr   c, .jr_5B59                              ;; 07:5B4C $38 $0B

    call GetEntityTransitionCountdown             ;; 07:5B4E $CD $05 $0C
    ld   [hl], $10                                ;; 07:5B51 $36 $10
    call GetEntityPrivateCountdown1               ;; 07:5B53 $CD $00 $0C
    ld   [hl], $10                                ;; 07:5B56 $36 $10
    ret                                           ;; 07:5B58 $C9

.jr_5B59
    call GetEntityTransitionCountdown             ;; 07:5B59 $CD $05 $0C
    call GetRandomByte                            ;; 07:5B5C $CD $0D $28
    and  $3F                                      ;; 07:5B5F $E6 $3F
    add  $30                                      ;; 07:5B61 $C6 $30
    ld   [hl], a                                  ;; 07:5B63 $77

jr_007_5B64:
    ld   a, $03                                   ;; 07:5B64 $3E $03
    jp   SetEntitySpriteVariant                   ;; 07:5B66 $C3 $0C $3B

func_007_5B69::
    call GetEntityTransitionCountdown             ;; 07:5B69 $CD $05 $0C
    jr   nz, jr_007_5BCA                          ;; 07:5B6C $20 $5C

    ldh  a, [hLinkPositionX]                      ;; 07:5B6E $F0 $98
    push af                                       ;; 07:5B70 $F5
    ldh  a, [hLinkPositionY]                      ;; 07:5B71 $F0 $99
    push af                                       ;; 07:5B73 $F5
    ld   hl, wEntitiesPrivateState1Table          ;; 07:5B74 $21 $B0 $C2
    add  hl, bc                                   ;; 07:5B77 $09
    ld   a, [hl]                                  ;; 07:5B78 $7E
    ldh  [hLinkPositionX], a                      ;; 07:5B79 $E0 $98
    ld   hl, wEntitiesPrivateState2Table          ;; 07:5B7B $21 $C0 $C2
    add  hl, bc                                   ;; 07:5B7E $09
    ld   a, [hl]                                  ;; 07:5B7F $7E
    ldh  [hLinkPositionY], a                      ;; 07:5B80 $E0 $99
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 07:5B82 $21 $00 $C3
    add  hl, bc                                   ;; 07:5B85 $09
    ld   a, [wC168]                               ;; 07:5B86 $FA $68 $C1
    or   [hl]                                     ;; 07:5B89 $B6
    ld   a, $10                                   ;; 07:5B8A $3E $10
    ld   e, $10                                   ;; 07:5B8C $1E $10
    jr   nz, .jr_5B94                             ;; 07:5B8E $20 $04

    ld   a, $08                                   ;; 07:5B90 $3E $08
    ld   e, $08                                   ;; 07:5B92 $1E $08

.jr_5B94
    push de                                       ;; 07:5B94 $D5
    call ApplyVectorTowardsLink_trampoline        ;; 07:5B95 $CD $AA $3B
    pop  de                                       ;; 07:5B98 $D1
    ld   hl, wEntitiesSpeedZTable                 ;; 07:5B99 $21 $20 $C3
    add  hl, bc                                   ;; 07:5B9C $09
    ld   [hl], e                                  ;; 07:5B9D $73
    ld   a, [wC168]                               ;; 07:5B9E $FA $68 $C1
    and  a                                        ;; 07:5BA1 $A7
    jr   z, .jr_5BBE                              ;; 07:5BA2 $28 $1A

    ldh  a, [hMultiPurpose0]                      ;; 07:5BA4 $F0 $D7
    call GetEntitySpeedYAddress                   ;; 07:5BA6 $CD $05 $40
    cpl                                           ;; 07:5BA9 $2F
    inc  a                                        ;; 07:5BAA $3C
    ld   [hl], a                                  ;; 07:5BAB $77
    ldh  a, [hMultiPurpose1]                      ;; 07:5BAC $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5BAE $21 $40 $C2
    add  hl, bc                                   ;; 07:5BB1 $09
    cpl                                           ;; 07:5BB2 $2F
    inc  a                                        ;; 07:5BB3 $3C
    ld   [hl], a                                  ;; 07:5BB4 $77
    ldh  a, [hActiveEntityPosY]                   ;; 07:5BB5 $F0 $EF
    cp   $90                                      ;; 07:5BB7 $FE $90
    jr   c, .jr_5BBE                              ;; 07:5BB9 $38 $03

    call ClearEntityStatus_07                     ;; 07:5BBB $CD $A4 $7E

.jr_5BBE
    pop  af                                       ;; 07:5BBE $F1
    ldh  [hLinkPositionY], a                      ;; 07:5BBF $E0 $99
    pop  af                                       ;; 07:5BC1 $F1
    ldh  [hLinkPositionX], a                      ;; 07:5BC2 $E0 $98
    call IncrementEntityState                     ;; 07:5BC4 $CD $12 $3B
    call func_007_5B08                            ;; 07:5BC7 $CD $08 $5B

jr_007_5BCA:
    call GetEntitySpeedYAddress                   ;; 07:5BCA $CD $05 $40
    ld   a, [hl]                                  ;; 07:5BCD $7E
    and  $80                                      ;; 07:5BCE $E6 $80
    ld   a, $02                                   ;; 07:5BD0 $3E $02
    jr   z, .jr_5BD6                              ;; 07:5BD2 $28 $02

    ld   a, $04                                   ;; 07:5BD4 $3E $04

.jr_5BD6
    jp   SetEntitySpriteVariant                   ;; 07:5BD6 $C3 $0C $3B

func_007_5BD9::
    ldh  a, [hMultiPurposeG]                      ;; 07:5BD9 $F0 $E8
    and  a                                        ;; 07:5BDB $A7
    jr   z, .jr_5BE8                              ;; 07:5BDC $28 $0A

    call GetEntityTransitionCountdown             ;; 07:5BDE $CD $05 $0C
    ld   [hl], $08                                ;; 07:5BE1 $36 $08
    call IncrementEntityState                     ;; 07:5BE3 $CD $12 $3B
    dec  [hl]                                     ;; 07:5BE6 $35
    dec  [hl]                                     ;; 07:5BE7 $35

.jr_5BE8
    ld   a, $03                                   ;; 07:5BE8 $3E $03
    call SetEntitySpriteVariant                   ;; 07:5BEA $CD $0C $3B
    jp   UpdateEntityPosWithSpeed_07              ;; 07:5BED $C3 $0A $7E

func_007_5BF0::
    ret                                           ;; 07:5BF0 $C9
