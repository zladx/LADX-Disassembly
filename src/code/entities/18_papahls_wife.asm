Data_018_4E2B::
    db   $00, $F8, $60, $01, $00, $00, $62, $01, $00, $08, $64, $01, $00, $F8, $66, $01
    db   $00, $00, $68, $01, $00, $08, $6A, $01, $02, $00, $06, $04

PapahlsWifeEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:4E47 $F0 $F1
    sla  a                                        ;; 18:4E49 $CB $27
    sla  a                                        ;; 18:4E4B $CB $27
    ld   e, a                                     ;; 18:4E4D $5F
    sla  a                                        ;; 18:4E4E $CB $27
    add  e                                        ;; 18:4E50 $83
    ld   e, a                                     ;; 18:4E51 $5F
    ld   d, b                                     ;; 18:4E52 $50
    ld   hl, Data_018_4E2B                        ;; 18:4E53 $21 $2B $4E
    add  hl, de                                   ;; 18:4E56 $19
    ld   c, $03                                   ;; 18:4E57 $0E $03
    call RenderActiveEntitySpritesRect            ;; 18:4E59 $CD $E6 $3C

    ldh  a, [hFrameCounter]                       ;; 18:4E5C $F0 $E7
    rra                                           ;; 18:4E5E $1F
    rra                                           ;; 18:4E5F $1F
    rra                                           ;; 18:4E60 $1F
    rra                                           ;; 18:4E61 $1F
    and  $01                                      ;; 18:4E62 $E6 $01
    call SetEntitySpriteVariant                   ;; 18:4E64 $CD $0C $3B

    call ReturnIfNonInteractive_18                ;; 18:4E67 $CD $E8 $7D
    call PushLinkOutOfEntity_18                   ;; 18:4E6A $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:4E6D $F0 $F0
    JP_TABLE                                      ;; 18:4E6F
._00 dw PapahlsWifeState0Handler
._01 dw PapahlsWifeState1Handler
._02 dw PapahlsWifeState2Handler

PapahlsWifeState0Handler::
    call func_018_7D95                            ;; 18:4E76 $CD $95 $7D
    ret  nc                                       ;; 18:4E79 $D0

    ld   a, [wTradeSequenceItem]                  ;; 18:4E7A $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 18:4E7D $FE $08
    jr   nc, label_018_4E91                       ;; 18:4E7F $30 $10

    cp   TRADING_ITEM_YOSHI_DOLL                  ;; 18:4E81 $FE $01
    jr   z, jr_018_4E9F                           ;; 18:4E83 $28 $1A

    ld   a, [wHasInstrument3]                     ;; 18:4E85 $FA $67 $DB
    and  $02                                      ;; 18:4E88 $E6 $02
    jp   z, label_018_4E91                        ;; 18:4E8A $CA $91 $4E

    ld_dialog_low e, Dialog1EE                    ;; 18:4E8D $1E $EE
    jr   jr_018_4EA4                              ;; 18:4E8F $18 $13

label_018_4E91:
    ld   a, [wTradeSequenceItem]                  ;; 18:4E91 $FA $0E $DB
    and  a                                        ;; 18:4E94 $A7
    ld_dialog_low e, Dialog12A                    ;; 18:4E95 $1E $2A
    jr   z, jr_018_4EA4                           ;; 18:4E97 $28 $0B

    ld_dialog_low e, Dialog12C                    ;; 18:4E99 $1E $2C
    cp   $01                                      ;; 18:4E9B $FE $01
    jr   nz, jr_018_4EA4                          ;; 18:4E9D $20 $05

jr_018_4E9F:
    call IncrementEntityState                     ;; 18:4E9F $CD $12 $3B
    ld_dialog_low e, Dialog12B                    ;; 18:4EA2 $1E $2B

jr_018_4EA4:
    ld   a, e                                     ;; 18:4EA4 $7B
    jp   OpenDialogInTable1                       ;; 18:4EA5 $C3 $73 $23

PapahlsWifeState1Handler::
    ld   a, [wDialogState]                        ;; 18:4EA8 $FA $9F $C1
    and  a                                        ;; 18:4EAB $A7
    jr   nz, ret_018_4ECE                         ;; 18:4EAC $20 $20

    ld   a, [wDialogAskSelectionIndex]            ;; 18:4EAE $FA $77 $C1
    and  a                                        ;; 18:4EB1 $A7
    jr   nz, .jr_4EC5                             ;; 18:4EB2 $20 $11

    ld   a, TRADING_ITEM_RIBBON                   ;; 18:4EB4 $3E $02
    ld   [wTradeSequenceItem], a                  ;; 18:4EB6 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 18:4EB9 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 18:4EBB $E0 $A5
    call_open_dialog Dialog128                    ;; 18:4EBD
    jp   IncrementEntityState                     ;; 18:4EC2 $C3 $12 $3B

.jr_4EC5
    call_open_dialog Dialog127                    ;; 18:4EC5
    call IncrementEntityState                     ;; 18:4ECA $CD $12 $3B
    ld   [hl], b                                  ;; 18:4ECD $70

ret_018_4ECE:
    ret                                           ;; 18:4ECE $C9

PapahlsWifeState2Handler::
    ld   a, [wDialogState]                        ;; 18:4ECF $FA $9F $C1
    and  a                                        ;; 18:4ED2 $A7
    jr   nz, .ret_4EDC                            ;; 18:4ED3 $20 $07

    call CreateTradingItemEntity                  ;; 18:4ED5 $CD $0C $0C
    call IncrementEntityState                     ;; 18:4ED8 $CD $12 $3B
    ld   [hl], b                                  ;; 18:4EDB $70

.ret_4EDC
    ret                                           ;; 18:4EDC $C9
