Data_018_4B15::
    db   $00, $00, $70, $01, $00, $08, $72, $01, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $72, $21, $00, $08, $70, $21, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $78, $21, $00, $08, $76, $21, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $76, $01, $00, $08, $78, $01, $10, $00, $74, $01, $10, $08, $74, $21

Data_018_4B55::
    db   $00, $00, $70, $00, $00, $08, $72, $00, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $72, $20, $00, $08, $70, $20, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $78, $20, $00, $08, $76, $20, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $76, $00, $00, $08, $78, $00, $10, $00, $74, $00, $10, $08, $74, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWrite2SpriteVariants::
.variant0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWrite1SpriteVariants::
.variant0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; Entity handler for both Mr Write and the Goat
MrWriteEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:4B9D $F0 $F1
    rla                                           ;; 18:4B9F $17
    rla                                           ;; 18:4BA0 $17
    rla                                           ;; 18:4BA1 $17
    rla                                           ;; 18:4BA2 $17
    and  $F0                                      ;; 18:4BA3 $E6 $F0
    ld   e, a                                     ;; 18:4BA5 $5F
    ld   d, b                                     ;; 18:4BA6 $50
    ldh  a, [hMapRoom]                            ;; 18:4BA7 $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ;; 18:4BA9 $FE $A8
    jr   nz, .jr_4BB2                             ;; 18:4BAB $20 $05

    ld   hl, Data_018_4B55                        ;; 18:4BAD $21 $55 $4B
    jr   jr_018_4BB5                              ;; 18:4BB0 $18 $03

.jr_4BB2
    ld   hl, Data_018_4B15                        ;; 18:4BB2 $21 $15 $4B

jr_018_4BB5:
    add  hl, de                                   ;; 18:4BB5 $19
    ld   c, $04                                   ;; 18:4BB6 $0E $04
    call RenderActiveEntitySpritesRect            ;; 18:4BB8 $CD $E6 $3C
    ld   a, $04                                   ;; 18:4BBB $3E $04
    call func_015_7964_trampoline                 ;; 18:4BBD $CD $A0 $3D
    ldh  a, [hFrameCounter]                       ;; 18:4BC0 $F0 $E7
    rra                                           ;; 18:4BC2 $1F
    rra                                           ;; 18:4BC3 $1F
    rra                                           ;; 18:4BC4 $1F
    rra                                           ;; 18:4BC5 $1F
    rra                                           ;; 18:4BC6 $1F
    and  $01                                      ;; 18:4BC7 $E6 $01
    call SetEntitySpriteVariant                   ;; 18:4BC9 $CD $0C $3B
    call func_018_7EC2                            ;; 18:4BCC $CD $C2 $7E
    add  $0C                                      ;; 18:4BCF $C6 $0C
    cp   $18                                      ;; 18:4BD1 $FE $18
    jr   nc, .jr_4BE4                             ;; 18:4BD3 $30 $0F

    call func_018_7EB2                            ;; 18:4BD5 $CD $B2 $7E
    add  $10                                      ;; 18:4BD8 $C6 $10
    cp   $20                                      ;; 18:4BDA $FE $20
    jr   nc, .jr_4BE4                             ;; 18:4BDC $30 $06

    ld   a, e                                     ;; 18:4BDE $7B
    add  $02                                      ;; 18:4BDF $C6 $02
    call SetEntitySpriteVariant                   ;; 18:4BE1 $CD $0C $3B

.jr_4BE4
    call PushLinkOutOfEntity_18                   ;; 18:4BE4 $CD $36 $7D
    ldh  a, [hMapRoom]                            ;; 18:4BE7 $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ; $A8 = Mr. Write's house
    jp   z, label_018_4C75                        ;; 18:4BEB $CA $75 $4C

    ld   de, MrWrite2SpriteVariants               ;; 18:4BEE $11 $95 $4B
    ld   a, [wTradeSequenceItem]                  ;; 18:4BF1 $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ;; 18:4BF4 $FE $09
    jr   nc, .jr_4BFB                             ;; 18:4BF6 $30 $03

    ld   de, MrWrite1SpriteVariants               ;; 18:4BF8 $11 $99 $4B

.jr_4BFB
    xor  a                                        ;; 18:4BFB $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 18:4BFC $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ;; 18:4BFE $F0 $EE
    add  $18                                      ;; 18:4C00 $C6 $18
    ldh  [hActiveEntityPosX], a                   ;; 18:4C02 $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:4C04 $F0 $EC
    add  $08                                      ;; 18:4C06 $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 18:4C08 $E0 $EC
    call RenderActiveEntitySpritesPair            ;; 18:4C0A $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 18:4C0D $CD $8A $3D
    call ReturnIfNonInteractive_18                ;; 18:4C10 $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:4C13 $F0 $F0
    JP_TABLE                                      ;; 18:4C15
._00 dw MrWriteState0Handler
._01 dw MrWriteState1Handler
._02 dw MrWriteState2Handler

MrWriteState0Handler::
    ld   a, [wGameplayType]                       ;; 18:4C1C $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 18:4C1F $FE $0B
    ret  nz                                       ;; 18:4C21 $C0

    ld   a, [wTransitionSequenceCounter]          ;; 18:4C22 $FA $6B $C1
    cp   $04                                      ;; 18:4C25 $FE $04
    ret  nz                                       ;; 18:4C27 $C0

    call ShouldLinkTalkToEntity_18                ;; 18:4C28 $CD $89 $7D
    ret  nc                                       ;; 18:4C2B $D0

    ld   a, [wTradeSequenceItem]                  ;; 18:4C2C $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ;; 18:4C2F $FE $08
    jr   nz, .jr_4C3B                             ;; 18:4C31 $20 $08

    call_open_dialog Dialog167                    ;; 18:4C33
    jp   IncrementEntityState                     ;; 18:4C38 $C3 $12 $3B

.jr_4C3B
    ld_dialog_low a, Dialog166 ; "You don't know the etiquette" ;; 18:4C3B $3E $66
    jr   c, .jr_4C41                              ;; 18:4C3D $38 $02

    ld_dialog_low a, Dialog16B ; "I can't help eating paper" ;; 18:4C3F $3E $6B

.jr_4C41
    jp   OpenDialogInTable1                       ;; 18:4C41 $C3 $73 $23

MrWriteState1Handler::
    ld   a, [wDialogState]                        ;; 18:4C44 $FA $9F $C1
    and  a                                        ;; 18:4C47 $A7
    jr   nz, .jr_4C58                             ;; 18:4C48 $20 $0E

    call IncrementEntityState                     ;; 18:4C4A $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 18:4C4D $FA $77 $C1
    and  a                                        ;; 18:4C50 $A7
    jr   nz, .jr_4C58                             ;; 18:4C51 $20 $05

    jp_open_dialog Dialog168                      ;; 18:4C53

.jr_4C58
    ld   [hl], b                                  ;; 18:4C58 $70
    jp_open_dialog Dialog169                      ;; 18:4C59

MrWriteState2Handler::
    ld   a, [wDialogState]                        ;; 18:4C5E $FA $9F $C1
    and  a                                        ;; 18:4C61 $A7
    jr   nz, .ret_4C74                            ;; 18:4C62 $20 $10

    call IncrementEntityState                     ;; 18:4C64 $CD $12 $3B
    ld   [hl], b                                  ;; 18:4C67 $70
    call CreateTradingItemEntity                  ;; 18:4C68 $CD $0C $0C
    ld   a, TRADING_ITEM_LETTER                   ;; 18:4C6B $3E $09
    ld   [wTradeSequenceItem], a                  ;; 18:4C6D $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 18:4C70 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 18:4C72 $E0 $A5

.ret_4C74
    ret                                           ;; 18:4C74 $C9

label_018_4C75:
    call ReturnIfNonInteractive_18                ;; 18:4C75 $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:4C78 $F0 $F0
    JP_TABLE                                      ;; 18:4C7A
._00 dw func_018_4C87                             ;; 18:4C7B
._01 dw func_018_4CA3                             ;; 18:4C7D
._02 dw func_018_4CAB                             ;; 18:4C7F
._03 dw func_018_4CBE                             ;; 18:4C81
._04 dw func_018_4CD1                             ;; 18:4C83
._05 dw func_018_4CF2                             ;; 18:4C85

func_018_4C87::
    call ShouldLinkTalkToEntity_18                ;; 18:4C87 $CD $89 $7D
    ret  nc                                       ;; 18:4C8A $D0

    ld   a, [wTradeSequenceItem]                  ;; 18:4C8B $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ;; 18:4C8E $FE $09
    jr   nz, .jr_4C9A                             ;; 18:4C90 $20 $08

    call_open_dialog Dialog134                    ;; 18:4C92
    jp   IncrementEntityState                     ;; 18:4C97 $C3 $12 $3B

.jr_4C9A
    ld_dialog_low a, Dialog133 ; "My name's Write!" ;; 18:4C9A $3E $33
    jr   c, .jr_4CA0                              ;; 18:4C9C $38 $02

    ld_dialog_low a, Dialog139 ; "I'm writing back to Christine" ;; 18:4C9E $3E $39

.jr_4CA0
    jp   OpenDialogInTable1                       ;; 18:4CA0 $C3 $73 $23

func_018_4CA3::
    ld   a, [wDialogState]                        ;; 18:4CA3 $FA $9F $C1
    and  a                                        ;; 18:4CA6 $A7
    ret  nz                                       ;; 18:4CA7 $C0

    jp   IncrementEntityState                     ;; 18:4CA8 $C3 $12 $3B

func_018_4CAB::
    call IncrementEntityState                     ;; 18:4CAB $CD $12 $3B
    ld   a, GAMEPLAY_CUTSCENE                     ;; 18:4CAE $3E $08

func_018_4CB0::
    ld   [wGameplayType], a                       ;; 18:4CB0 $EA $95 $DB
    xor  a                                        ;; 18:4CB3 $AF
    ld   [wTransitionSequenceCounter], a          ;; 18:4CB4 $EA $6B $C1
    ld   [wC16C], a                               ;; 18:4CB7 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 18:4CBA $EA $96 $DB
    ret                                           ;; 18:4CBD $C9

func_018_4CBE::
    ld   a, [wTransitionSequenceCounter]          ;; 18:4CBE $FA $6B $C1
    cp   $04                                      ;; 18:4CC1 $FE $04
    ret  nz                                       ;; 18:4CC3 $C0

    ld   a, [wDialogState]                        ;; 18:4CC4 $FA $9F $C1
    and  a                                        ;; 18:4CC7 $A7
    ret  nz                                       ;; 18:4CC8 $C0

    call IncrementEntityState                     ;; 18:4CC9 $CD $12 $3B
    jp_open_dialog Dialog135                      ;; 18:4CCC

func_018_4CD1::
    ld   a, [wDialogState]                        ;; 18:4CD1 $FA $9F $C1
    and  a                                        ;; 18:4CD4 $A7
    ret  nz                                       ;; 18:4CD5 $C0

    call IncrementEntityState                     ;; 18:4CD6 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 18:4CD9 $FA $77 $C1
    and  a                                        ;; 18:4CDC $A7
    jr   nz, .jr_4CEC                             ;; 18:4CDD $20 $0D

    call CreateTradingItemEntity                  ;; 18:4CDF $CD $0C $0C
    ld   a, TRADING_ITEM_BROOM                    ;; 18:4CE2 $3E $0A
    ld   [wTradeSequenceItem], a                  ;; 18:4CE4 $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 18:4CE7 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 18:4CE9 $E0 $A5
    ret                                           ;; 18:4CEB $C9

.jr_4CEC
    dec  [hl]                                     ;; 18:4CEC $35
    jp_open_dialog Dialog137                      ;; 18:4CED

func_018_4CF2::
    call ShouldLinkTalkToEntity_18                ;; 18:4CF2 $CD $89 $7D
    ret  nc                                       ;; 18:4CF5 $D0

    jp_open_dialog Dialog138                      ;; 18:4CF6
