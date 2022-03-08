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

Data_018_4B95::
    db   $7A, $02, $7C, $02

Data_018_4B99::
    db   $7E, $02, $7E, $22

MrWriteEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4B9D: $F0 $F1
    rla                                           ; $4B9F: $17
    rla                                           ; $4BA0: $17
    rla                                           ; $4BA1: $17
    rla                                           ; $4BA2: $17
    and  $F0                                      ; $4BA3: $E6 $F0
    ld   e, a                                     ; $4BA5: $5F
    ld   d, b                                     ; $4BA6: $50
    ldh  a, [hMapRoom]                            ; $4BA7: $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ; $4BA9: $FE $A8
    jr   nz, jr_018_4BB2                          ; $4BAB: $20 $05

    ld   hl, Data_018_4B55                        ; $4BAD: $21 $55 $4B
    jr   jr_018_4BB5                              ; $4BB0: $18 $03

jr_018_4BB2:
    ld   hl, Data_018_4B15                        ; $4BB2: $21 $15 $4B

jr_018_4BB5:
    add  hl, de                                   ; $4BB5: $19
    ld   c, $04                                   ; $4BB6: $0E $04
    call RenderActiveEntitySpritesRect            ; $4BB8: $CD $E6 $3C
    ld   a, $04                                   ; $4BBB: $3E $04
    call func_015_7964_trampoline                 ; $4BBD: $CD $A0 $3D
    ldh  a, [hFrameCounter]                       ; $4BC0: $F0 $E7
    rra                                           ; $4BC2: $1F
    rra                                           ; $4BC3: $1F
    rra                                           ; $4BC4: $1F
    rra                                           ; $4BC5: $1F
    rra                                           ; $4BC6: $1F
    and  $01                                      ; $4BC7: $E6 $01
    call SetEntitySpriteVariant                   ; $4BC9: $CD $0C $3B
    call func_018_7EC2                            ; $4BCC: $CD $C2 $7E
    add  $0C                                      ; $4BCF: $C6 $0C
    cp   $18                                      ; $4BD1: $FE $18
    jr   nc, jr_018_4BE4                          ; $4BD3: $30 $0F

    call func_018_7EB2                            ; $4BD5: $CD $B2 $7E
    add  $10                                      ; $4BD8: $C6 $10
    cp   $20                                      ; $4BDA: $FE $20
    jr   nc, jr_018_4BE4                          ; $4BDC: $30 $06

    ld   a, e                                     ; $4BDE: $7B
    add  $02                                      ; $4BDF: $C6 $02
    call SetEntitySpriteVariant                   ; $4BE1: $CD $0C $3B

jr_018_4BE4:
    call func_018_7D36                            ; $4BE4: $CD $36 $7D
    ldh  a, [hMapRoom]                            ; $4BE7: $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ; $A8 = Mr. Write's house
    jp   z, label_018_4C75                        ; $4BEB: $CA $75 $4C

    ld   de, Data_018_4B95                        ; $4BEE: $11 $95 $4B
    ld   a, [wTradeSequenceItem]                  ; $4BF1: $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ; $4BF4: $FE $09
    jr   nc, jr_018_4BFB                          ; $4BF6: $30 $03

    ld   de, Data_018_4B99                        ; $4BF8: $11 $99 $4B

jr_018_4BFB:
    xor  a                                        ; $4BFB: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4BFC: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $4BFE: $F0 $EE
    add  $18                                      ; $4C00: $C6 $18
    ldh  [hActiveEntityPosX], a                   ; $4C02: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $4C04: $F0 $EC
    add  $08                                      ; $4C06: $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $4C08: $E0 $EC
    call RenderActiveEntitySpritesPair            ; $4C0A: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4C0D: $CD $8A $3D
    call ReturnIfNonInteractive_18                ; $4C10: $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ; $4C13: $F0 $F0
    JP_TABLE                                      ; $4C15
._00 dw MrWriteState0Handler
._01 dw MrWriteState1Handler
._02 dw MrWriteState2Handler

MrWriteState0Handler::
    ld   a, [wGameplayType]                       ; $4C1C: $FA $95 $DB
    cp   $0B                                      ; $4C1F: $FE $0B
    ret  nz                                       ; $4C21: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4C22: $FA $6B $C1
    cp   $04                                      ; $4C25: $FE $04
    ret  nz                                       ; $4C27: $C0

    call ShouldLinkTalkToEntity_18                ; $4C28: $CD $89 $7D
    ret  nc                                       ; $4C2B: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C2C: $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ; $4C2F: $FE $08
    jr   nz, jr_018_4C3B                          ; $4C31: $20 $08

    call_open_dialog $167                         ; $4C33
    jp   IncrementEntityState                     ; $4C38: $C3 $12 $3B

jr_018_4C3B:
    ld   a, $66                                   ; $4C3B: $3E $66
    jr   c, jr_018_4C41                           ; $4C3D: $38 $02

    ld   a, $6B                                   ; $4C3F: $3E $6B

jr_018_4C41:
    jp   OpenDialogInTable1                       ; $4C41: $C3 $73 $23

MrWriteState1Handler::
    ld   a, [wDialogState]                        ; $4C44: $FA $9F $C1
    and  a                                        ; $4C47: $A7
    jr   nz, jr_018_4C58                          ; $4C48: $20 $0E

    call IncrementEntityState                     ; $4C4A: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $4C4D: $FA $77 $C1
    and  a                                        ; $4C50: $A7
    jr   nz, jr_018_4C58                          ; $4C51: $20 $05

    jp_open_dialog $168                           ; $4C53

jr_018_4C58:
    ld   [hl], b                                  ; $4C58: $70
    jp_open_dialog $169                           ; $4C59

MrWriteState2Handler::
    ld   a, [wDialogState]                        ; $4C5E: $FA $9F $C1
    and  a                                        ; $4C61: $A7
    jr   nz, jr_018_4C74                          ; $4C62: $20 $10

    call IncrementEntityState                     ; $4C64: $CD $12 $3B
    ld   [hl], b                                  ; $4C67: $70
    call CreateTradingItemEntity                  ; $4C68: $CD $0C $0C
    ld   a, TRADING_ITEM_LETTER                   ; $4C6B: $3E $09
    ld   [wTradeSequenceItem], a                  ; $4C6D: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4C70: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4C72: $E0 $A5

ret_018_4C74:
    ret                                           ; $4C74: $C9

label_018_4C75:
    call ReturnIfNonInteractive_18                ; $4C75: $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ; $4C78: $F0 $F0
    JP_TABLE                                      ; $4C7A
._00 dw func_018_4C87                             ; $4C7B
._01 dw func_018_4CA3                             ; $4C7D
._02 dw func_018_4CAB                             ; $4C7F
._03 dw func_018_4CBE                             ; $4C81
._04 dw func_018_4CD1                             ; $4C83
._05 dw func_018_4CF2                             ; $4C85

func_018_4C87::
    call ShouldLinkTalkToEntity_18                ; $4C87: $CD $89 $7D
    ret  nc                                       ; $4C8A: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C8B: $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ; $4C8E: $FE $09
    jr   nz, jr_018_4C9A                          ; $4C90: $20 $08

    call_open_dialog $134                         ; $4C92
    jp   IncrementEntityState                     ; $4C97: $C3 $12 $3B

jr_018_4C9A:
    ld   a, $33                                   ; $4C9A: $3E $33
    jr   c, jr_018_4CA0                           ; $4C9C: $38 $02

    ld   a, $39                                   ; $4C9E: $3E $39

jr_018_4CA0:
    jp   OpenDialogInTable1                       ; $4CA0: $C3 $73 $23

func_018_4CA3::
    ld   a, [wDialogState]                        ; $4CA3: $FA $9F $C1
    and  a                                        ; $4CA6: $A7
    ret  nz                                       ; $4CA7: $C0

    jp   IncrementEntityState                     ; $4CA8: $C3 $12 $3B

func_018_4CAB::
    call IncrementEntityState                     ; $4CAB: $CD $12 $3B
    ld   a, $08                                   ; $4CAE: $3E $08

func_018_4CB0::
    ld   [wGameplayType], a                       ; $4CB0: $EA $95 $DB
    xor  a                                        ; $4CB3: $AF
    ld   [wTransitionSequenceCounter], a          ; $4CB4: $EA $6B $C1
    ld   [wC16C], a                               ; $4CB7: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $4CBA: $EA $96 $DB
    ret                                           ; $4CBD: $C9

func_018_4CBE::
    ld   a, [wTransitionSequenceCounter]          ; $4CBE: $FA $6B $C1
    cp   $04                                      ; $4CC1: $FE $04
    ret  nz                                       ; $4CC3: $C0

    ld   a, [wDialogState]                        ; $4CC4: $FA $9F $C1
    and  a                                        ; $4CC7: $A7
    ret  nz                                       ; $4CC8: $C0

    call IncrementEntityState                     ; $4CC9: $CD $12 $3B
    jp_open_dialog $135                           ; $4CCC

func_018_4CD1::
    ld   a, [wDialogState]                        ; $4CD1: $FA $9F $C1
    and  a                                        ; $4CD4: $A7
    ret  nz                                       ; $4CD5: $C0

    call IncrementEntityState                     ; $4CD6: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $4CD9: $FA $77 $C1
    and  a                                        ; $4CDC: $A7
    jr   nz, jr_018_4CEC                          ; $4CDD: $20 $0D

    call CreateTradingItemEntity                  ; $4CDF: $CD $0C $0C
    ld   a, TRADING_ITEM_BROOM                    ; $4CE2: $3E $0A
    ld   [wTradeSequenceItem], a                  ; $4CE4: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4CE7: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4CE9: $E0 $A5
    ret                                           ; $4CEB: $C9

jr_018_4CEC:
    dec  [hl]                                     ; $4CEC: $35
    jp_open_dialog $137                           ; $4CED

func_018_4CF2::
    call ShouldLinkTalkToEntity_18                ; $4CF2: $CD $89 $7D
    ret  nc                                       ; $4CF5: $D0

    jp_open_dialog $138                           ; $4CF6
