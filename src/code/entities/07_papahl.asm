; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Papahl1SpriteVariants::
.variant0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PapahlDirectionSpriteVariants::
.right
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
.up
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0
.left
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
.down
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0

Papahl2SpriteVariants::
.variant0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Papahl4SpriteVariants::
.variant0
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

PapahlEntityHandler::
    ld   a, [wIsIndoor]                           ;; 07:4A1B $FA $A5 $DB
    and  a                                        ;; 07:4A1E $A7
    jr   z, jr_007_4A69                           ;; 07:4A1F $28 $48

    ld   a, [wTradeSequenceItem]                  ;; 07:4A21 $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 07:4A24 $FE $08
    jr   nc, .jr_4A30                             ;; 07:4A26 $30 $08

    ld   a, [wHasInstrument3]                     ;; 07:4A28 $FA $67 $DB
    and  $02                                      ;; 07:4A2B $E6 $02
    jp   nz, ClearEntityStatus_07                 ;; 07:4A2D $C2 $A4 $7E

.jr_4A30
    ld   de, Papahl2SpriteVariants                ;; 07:4A30 $11 $07 $4A
    ld   a, [wTradeSequenceItem]                  ;; 07:4A33 $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 07:4A36 $FE $08
    jr   nc, .render                              ;; 07:4A38 $30 $09

    call GetEntityXDistanceToLink_07              ;; 07:4A3A $CD $5D $7E
    ld   a, e                                     ;; 07:4A3D $7B
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4A3E $E0 $F1
    ld   de, Papahl1SpriteVariants                ;; 07:4A40 $11 $EF $49

.render
    call RenderActiveEntitySpritesPair            ;; 07:4A43 $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ;; 07:4A46 $F0 $E7
    rra                                           ;; 07:4A48 $1F
    rra                                           ;; 07:4A49 $1F
    rra                                           ;; 07:4A4A $1F
    rra                                           ;; 07:4A4B $1F
    and  $01                                      ;; 07:4A4C $E6 $01
    call SetEntitySpriteVariant                   ;; 07:4A4E $CD $0C $3B
    call PushLinkOutOfEntity_07                   ;; 07:4A51 $CD $F0 $7C
    call func_007_7D43                            ;; 07:4A54 $CD $43 $7D
    ret  nc                                       ;; 07:4A57 $D0

    ld   a, [wTradeSequenceItem]                  ;; 07:4A58 $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 07:4A5B $FE $08
    jr   nc, .jr_4A64                             ;; 07:4A5D $30 $05

    jp_open_dialog Dialog027                      ;; 07:4A5F

.jr_4A64
    jp_open_dialog Dialog176                      ;; 07:4A64

jr_007_4A69:
    ldh  a, [hRoomStatus]                         ;; 07:4A69 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 07:4A6B $E6 $20
    jp   nz, ClearEntityStatus_07                 ;; 07:4A6D $C2 $A4 $7E

    ld   de, PapahlDirectionSpriteVariants        ;; 07:4A70 $11 $F7 $49
    ld   hl, wEntitiesDirectionTable              ;; 07:4A73 $21 $80 $C3
    add  hl, bc                                   ;; 07:4A76 $09
    ld   a, [hl]                                  ;; 07:4A77 $7E
    and  a                                        ;; 07:4A78 $A7
    jr   nz, .render                              ;; 07:4A79 $20 $03

    ld   de, Papahl2SpriteVariants                ;; 07:4A7B $11 $07 $4A

.render:
    call RenderActiveEntitySpritesPair            ;; 07:4A7E $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ;; 07:4A81 $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 07:4A84 $FE $08
    jr   nc, .jr_4AA0                             ;; 07:4A86 $30 $18

    ldh  a, [hActiveEntityPosX]                   ;; 07:4A88 $F0 $EE
    add  $10                                      ;; 07:4A8A $C6 $10
    ldh  [hActiveEntityPosX], a                   ;; 07:4A8C $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4A8E $F0 $EC
    sub  $10                                      ;; 07:4A90 $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 07:4A92 $E0 $EC
    xor  a                                        ;; 07:4A94 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4A95 $E0 $F1
    ld   de, Papahl4SpriteVariants                ;; 07:4A97 $11 $17 $4A
    call RenderActiveEntitySpritesPair            ;; 07:4A9A $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4A9D $CD $8A $3D

.jr_4AA0
    call ReturnIfNonInteractive_07                ;; 07:4AA0 $CD $96 $7D
    call PushLinkOutOfEntity_07                   ;; 07:4AA3 $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ;; 07:4AA6 $F0 $F0
    JP_TABLE                                      ;; 07:4AA8
._00 dw func_007_4AB3                             ;; 07:4AA9
._01 dw func_007_4AF3                             ;; 07:4AAB
._02 dw func_007_4B1C                             ;; 07:4AAD
._03 dw func_007_4B50                             ;; 07:4AAF
._04 dw func_007_4B5B                             ;; 07:4AB1

func_007_4AB3::
    call GetEntityXDistanceToLink_07              ;; 07:4AB3 $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:4AB6 $21 $80 $C3
    add  hl, bc                                   ;; 07:4AB9 $09
    ld   [hl], e                                  ;; 07:4ABA $73
    add  $24                                      ;; 07:4ABB $C6 $24
    cp   $48                                      ;; 07:4ABD $FE $48
    jr   nc, jr_007_4AE9                          ;; 07:4ABF $30 $28

    call GetEntityYDistanceToLink_07              ;; 07:4AC1 $CD $6D $7E
    add  $24                                      ;; 07:4AC4 $C6 $24
    cp   $48                                      ;; 07:4AC6 $FE $48
    jr   nc, jr_007_4AE9                          ;; 07:4AC8 $30 $1F

    call func_007_7D43                            ;; 07:4ACA $CD $43 $7D
    jr   nc, jr_007_4AE5                          ;; 07:4ACD $30 $16

    ld   a, [wTradeSequenceItem]                  ;; 07:4ACF $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ;; 07:4AD2 $FE $07
    ld_dialog_low a, Dialog170 ; "Papahl got lost! Yes/Nope" ;; 07:4AD4 $3E $70
    jr   z, .jr_4ADA                              ;; 07:4AD6 $28 $02

    ld_dialog_low a, Dialog177 ; "Papahl got lost! No/Can't" ;; 07:4AD8 $3E $77

.jr_4ADA
    call OpenDialogInTable1                       ;; 07:4ADA $CD $73 $23
    call IncrementEntityState                     ;; 07:4ADD $CD $12 $3B
    ld   a, $01                                   ;; 07:4AE0 $3E $01
    ld   [wC167], a                               ;; 07:4AE2 $EA $67 $C1

jr_007_4AE5:
    xor  a                                        ;; 07:4AE5 $AF
    jp   SetEntitySpriteVariant                   ;; 07:4AE6 $C3 $0C $3B

jr_007_4AE9:
    ldh  a, [hFrameCounter]                       ;; 07:4AE9 $F0 $E7
    rra                                           ;; 07:4AEB $1F
    rra                                           ;; 07:4AEC $1F
    rra                                           ;; 07:4AED $1F
    and  $01                                      ;; 07:4AEE $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:4AF0 $C3 $0C $3B

func_007_4AF3::
    ld   a, [wDialogAskSelectionIndex]            ;; 07:4AF3 $FA $77 $C1
    and  a                                        ;; 07:4AF6 $A7
    jr   nz, .jr_4B0E                             ;; 07:4AF7 $20 $15

    ld   a, [wTradeSequenceItem]                  ;; 07:4AF9 $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ;; 07:4AFC $FE $07
    jr   nz, .jr_4B0E                             ;; 07:4AFE $20 $0E

    call_open_dialog Dialog172                    ;; 07:4B00
    call IncrementEntityState                     ;; 07:4B05 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:4B08 $CD $05 $0C
    ld   [hl], $C0                                ;; 07:4B0B $36 $C0
    ret                                           ;; 07:4B0D $C9

.jr_4B0E
    call_open_dialog Dialog171                    ;; 07:4B0E
    xor  a                                        ;; 07:4B13 $AF
    ld   [wC167], a                               ;; 07:4B14 $EA $67 $C1
    call IncrementEntityState                     ;; 07:4B17 $CD $12 $3B
    ld   [hl], b                                  ;; 07:4B1A $70
    ret                                           ;; 07:4B1B $C9

func_007_4B1C::
    ld   a, [wDialogState]                        ;; 07:4B1C $FA $9F $C1
    and  a                                        ;; 07:4B1F $A7
    jr   nz, func_007_4B44                        ;; 07:4B20 $20 $22

    call GetEntityTransitionCountdown             ;; 07:4B22 $CD $05 $0C
    jr   nz, .jr_4B3B                             ;; 07:4B25 $20 $14

    ld   [wMusicTrackTiming], a                   ;; 07:4B27 $EA $0B $C1
    call_open_dialog Dialog173                    ;; 07:4B2A
    ld   a, TRADING_ITEM_HIBISCUS                 ;; 07:4B2F $3E $08
    ld   [wTradeSequenceItem], a                  ;; 07:4B31 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 07:4B34 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 07:4B36 $E0 $A5
    jp   IncrementEntityState                     ;; 07:4B38 $C3 $12 $3B

.jr_4B3B
    ld   a, $02                                   ;; 07:4B3B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:4B3D $E0 $A1
    ld   a, $01                                   ;; 07:4B3F $3E $01
    ld   [wMusicTrackTiming], a                   ;; 07:4B41 $EA $0B $C1

func_007_4B44::
    ldh  a, [hFrameCounter]                       ;; 07:4B44 $F0 $E7
    rra                                           ;; 07:4B46 $1F
    rra                                           ;; 07:4B47 $1F
    rra                                           ;; 07:4B48 $1F
    and  $01                                      ;; 07:4B49 $E6 $01
    add  $02                                      ;; 07:4B4B $C6 $02
    jp   SetEntitySpriteVariant                   ;; 07:4B4D $C3 $0C $3B

func_007_4B50::
    ld   a, [wDialogState]                        ;; 07:4B50 $FA $9F $C1
    and  a                                        ;; 07:4B53 $A7
    ret  nz                                       ;; 07:4B54 $C0

    call CreateTradingItemEntity                  ;; 07:4B55 $CD $0C $0C
    jp   IncrementEntityState                     ;; 07:4B58 $C3 $12 $3B

func_007_4B5B::
    call func_007_4B44                            ;; 07:4B5B $CD $44 $4B
    call func_007_7D43                            ;; 07:4B5E $CD $43 $7D
    ret  nc                                       ;; 07:4B61 $D0

    xor  a                                        ;; 07:4B62 $AF
    ld   [wC167], a                               ;; 07:4B63 $EA $67 $C1
    jp_open_dialog Dialog175                      ;; 07:4B66
