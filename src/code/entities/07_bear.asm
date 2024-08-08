Data_007_4B6B::
    db   $FA, $00, $70, $03, $FA, $08, $72, $03, $FA, $10, $74, $03, $FA, $18, $70, $23
    db   $0A, $00, $76, $03, $0A, $08, $78, $03, $0A, $10, $78, $23, $0A, $18, $76, $23

Data_007_4B8B::
    db   $FA, $00, $70, $03, $FA, $08, $74, $23, $FA, $10, $72, $23, $FA, $18, $70, $23
    db   $0A, $00, $76, $03, $0A, $08, $78, $03, $0A, $10, $78, $23, $0A, $18, $76, $23

Data_007_4BAB::
    db   $7E, $07

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Bear1SpriteVariants::
.variant0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Bear2SpriteVariants::
.variant0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

BearEntityHandler::
    xor  a                                        ;; 07:4BB5 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4BB6 $E0 $F1
    ld   a, $4A                                   ;; 07:4BB8 $3E $4A
    ldh  [hActiveEntityVisualPosY], a             ;; 07:4BBA $E0 $EC
    ld   de, Bear1SpriteVariants                  ;; 07:4BBC $11 $AD $4B
    call RenderActiveEntitySpritesPair            ;; 07:4BBF $CD $C0 $3B
    ld   a, $68                                   ;; 07:4BC2 $3E $68
    ldh  [hActiveEntityPosX], a                   ;; 07:4BC4 $E0 $EE
    ld   de, Bear2SpriteVariants                  ;; 07:4BC6 $11 $B1 $4B
    call RenderActiveEntitySpritesPair            ;; 07:4BC9 $CD $C0 $3B
    ld   a, [wTradeSequenceItem]                  ;; 07:4BCC $FA $0E $DB
    cp   TRADING_ITEM_HONEYCOMB                   ;; 07:4BCF $FE $06
    jr   nz, .jr_4BE1                             ;; 07:4BD1 $20 $0E

    ld   a, $74                                   ;; 07:4BD3 $3E $74
    ldh  [hActiveEntityPosX], a                   ;; 07:4BD5 $E0 $EE
    ld   a, $38                                   ;; 07:4BD7 $3E $38
    ldh  [hActiveEntityVisualPosY], a             ;; 07:4BD9 $E0 $EC
    ld   de, Data_007_4BAB                        ;; 07:4BDB $11 $AB $4B
    call RenderActiveEntitySprite                 ;; 07:4BDE $CD $77 $3C

.jr_4BE1
    call CopyEntityPositionToActivePosition       ;; 07:4BE1 $CD $8A $3D
    ld   hl, wEntitiesSpriteVariantTable          ;; 07:4BE4 $21 $B0 $C3
    add  hl, bc                                   ;; 07:4BE7 $09
    ld   a, [hl]                                  ;; 07:4BE8 $7E
    ld   hl, Data_007_4B6B                        ;; 07:4BE9 $21 $6B $4B
    and  a                                        ;; 07:4BEC $A7
    jr   z, .jr_4BF2                              ;; 07:4BED $28 $03

    ld   hl, Data_007_4B8B                        ;; 07:4BEF $21 $8B $4B

.jr_4BF2
    ld   c, $08                                   ;; 07:4BF2 $0E $08
    call RenderActiveEntitySpritesRect            ;; 07:4BF4 $CD $E6 $3C
    ld   a, $06                                   ;; 07:4BF7 $3E $06
    call func_015_7964_trampoline                 ;; 07:4BF9 $CD $A0 $3D
    xor  a                                        ;; 07:4BFC $AF
    call SetEntitySpriteVariant                   ;; 07:4BFD $CD $0C $3B

.jr_4C00
    call ReturnIfNonInteractive_07                ;; 07:4C00 $CD $96 $7D
    ldh  a, [hFrameCounter]                       ;; 07:4C03 $F0 $E7
    and  $20                                      ;; 07:4C05 $E6 $20
    call SetEntitySpriteVariant                   ;; 07:4C07 $CD $0C $3B
    call PushLinkOutOfEntity_07                   ;; 07:4C0A $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ;; 07:4C0D $F0 $F0
    JP_TABLE                                      ;; 07:4C0F
._00 dw func_007_4C16                             ;; 07:4C10
._01 dw func_007_4C49                             ;; 07:4C12
._02 dw func_007_4C70                             ;; 07:4C14

func_007_4C16::
    call func_007_7D36                            ;; 07:4C16 $CD $36 $7D
    ret  nc                                       ;; 07:4C19 $D0

    ld_dialog_low e, Dialog1D3                    ;; 07:4C1A $1E $D3
    ld   a, [wOverworldRoomStatus + $FD]          ;; 07:4C1C $FA $FD $D8
    and  OW_ROOM_STATUS_CHANGED | OW_ROOM_STATUS_OWL_TALKED ;; 07:4C1F $E6 $30
    jr   nz, func_007_4C43.openDialog             ;; 07:4C21 $20 $22

    ld   a, [wTradeSequenceItem]                  ;; 07:4C23 $FA $0E $DB
    cp   TRADING_ITEM_HONEYCOMB                   ;; 07:4C26 $FE $06
    jr   nz, .jr_4C32                             ;; 07:4C28 $20 $08

    ld_dialog_low a, Dialog1CF                    ;; 07:4C2A $3E $CF
    call BearOpenDialog                           ;; 07:4C2C $CD $83 $4C
    jp   IncrementEntityState                     ;; 07:4C2F $C3 $12 $3B

.jr_4C32
    ld_dialog_low e, Dialog1D4                    ;; 07:4C32 $1E $D4
    ld   a, [wIsMarinFollowingLink]               ;; 07:4C34 $FA $73 $DB
    and  a                                        ;; 07:4C37 $A7
    jr   nz, func_007_4C43.openDialog             ;; 07:4C38 $20 $0B

    ld_dialog_low e, Dialog1CE                    ;; 07:4C3A $1E $CE
    ld   a, [wTradeSequenceItem]                  ;; 07:4C3C $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ;; 07:4C3F $FE $07
    jr   nz, func_007_4C43.openDialog             ;; 07:4C41 $20 $02

func_007_4C43::
    ld_dialog_low e, Dialog1D2                    ;; 07:4C43 $1E $D2

.openDialog
    ld   a, e                                     ;; 07:4C45 $7B
    jp   BearOpenDialog                           ;; 07:4C46 $C3 $83 $4C

func_007_4C49::
    ld   a, [wDialogState]                        ;; 07:4C49 $FA $9F $C1
    and  a                                        ;; 07:4C4C $A7
    jr   nz, ret_007_4C6F                         ;; 07:4C4D $20 $20

    call IncrementEntityState                     ;; 07:4C4F $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 07:4C52 $FA $77 $C1
    and  a                                        ;; 07:4C55 $A7
    jr   z, .jr_4C5E                              ;; 07:4C56 $28 $06

    ld   [hl], b                                  ;; 07:4C58 $70
    ld_dialog_low a, Dialog1D1                    ;; 07:4C59 $3E $D1
    jp   BearOpenDialog                           ;; 07:4C5B $C3 $83 $4C

.jr_4C5E
    ld   a, TRADING_ITEM_PINEAPPLE                ;; 07:4C5E $3E $07
    ld   [wTradeSequenceItem], a                  ;; 07:4C60 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 07:4C63 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 07:4C65 $E0 $A5
    call CreateTradingItemEntity                  ;; 07:4C67 $CD $0C $0C
    call GetEntityTransitionCountdown             ;; 07:4C6A $CD $05 $0C
    ld   [hl], $70                                ;; 07:4C6D $36 $70

ret_007_4C6F:
    ret                                           ;; 07:4C6F $C9

func_007_4C70::
    call GetEntityTransitionCountdown             ;; 07:4C70 $CD $05 $0C
    jr   nz, .ret_4C82                            ;; 07:4C73 $20 $0D

    ld   a, [wDialogState]                        ;; 07:4C75 $FA $9F $C1
    and  a                                        ;; 07:4C78 $A7
    jr   nz, .ret_4C82                            ;; 07:4C79 $20 $07

    call func_007_4C43                            ;; 07:4C7B $CD $43 $4C
    call IncrementEntityState                     ;; 07:4C7E $CD $12 $3B
    ld   [hl], b                                  ;; 07:4C81 $70

.ret_4C82
    ret                                           ;; 07:4C82 $C9

; Open a dialog for the bear
; Inputs:
;   a    index of the dialog to open
BearOpenDialog::
    ld   e, a                                     ;; 07:4C83 $5F

    ; Move Link 16px to the bottom
    ; (for the dialog box not to overlap the bear?)
    ldh  a, [hLinkPositionY]                      ;; 07:4C84 $F0 $99
    push af                                       ;; 07:4C86 $F5
    ld   a, $10                                   ;; 07:4C87 $3E $10
    ldh  [hLinkPositionY], a                      ;; 07:4C89 $E0 $99
    ld   a, e                                     ;; 07:4C8B $7B

    ; Open the dialog
    call OpenDialogInTable1                       ;; 07:4C8C $CD $73 $23

    ; Restore Link's position
    pop  af                                       ;; 07:4C8F $F1
    ldh  [hLinkPositionY], a                      ;; 07:4C90 $E0 $99

    ret                                           ;; 07:4C92 $C9
