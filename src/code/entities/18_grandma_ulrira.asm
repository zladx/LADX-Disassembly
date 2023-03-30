; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GrandmaUlrira1SpriteVariants::
.variant0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GrandmaUlrira2SpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GrandmaUlrira3SpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_4 | OAMF_PAL1
    db $9C, OAM_GBC_PAL_4 | OAMF_PAL1

GrandmaUlriraEntityHandler::
    ld   hl, wEntitiesPrivateState4Table          ; $4D17: $21 $40 $C4
    add  hl, bc                                   ; $4D1A: $09
    ld   a, [hl]                                  ; $4D1B: $7E
    and  a                                        ; $4D1C: $A7
    jr   nz, jr_018_4D36                          ; $4D1D: $20 $17

    inc  [hl]                                     ; $4D1F: $34
    ld   a, $18                                   ; $4D20: $3E $18
    call SpawnPhotographer_trampoline             ; $4D22: $CD $F6 $0A
    ld   a, [wHasInstrument5]                     ; $4D25: $FA $69 $DB
    ld   d, $B1                                   ; $4D28: $16 $B1
    and  $02                                      ; $4D2A: $E6 $02
    jr   z, .jr_4D30                              ; $4D2C: $28 $02

    ld   d, $CD                                   ; $4D2E: $16 $CD

.jr_4D30
    ldh  a, [hMapRoom]                            ; $4D30: $F0 $F6
    cp   d                                        ; $4D32: $BA
    jp   nz, ClearEntityStatusBank18              ; $4D33: $C2 $08 $7F

jr_018_4D36:
    ld   de, GrandmaUlrira1SpriteVariants         ; $4D36: $11 $FB $4C
    xor  a                                        ; $4D39: $AF
    ldh  [hMultiPurposeG], a                      ; $4D3A: $E0 $E8
    ld   a, [wTradeSequenceItem]                  ; $4D3C: $FA $0E $DB
    cp   TRADING_ITEM_FISHING_HOOK                ; $4D3F: $FE $0B
    jr   nc, jr_018_4D58                          ; $4D41: $30 $15

    ld   a, [wHasInstrument5]                     ; $4D43: $FA $69 $DB
    and  $02                                      ; $4D46: $E6 $02
    jr   nz, .jr_4D51                             ; $4D48: $20 $07

    ld   a, [wTradeSequenceItem]                  ; $4D4A: $FA $0E $DB
    cp   TRADING_ITEM_BROOM                       ; $4D4D: $FE $0A
    jr   c, jr_018_4D58                           ; $4D4F: $38 $07

.jr_4D51
    ld   a, $01                                   ; $4D51: $3E $01
    ldh  [hMultiPurposeG], a                      ; $4D53: $E0 $E8
    ld   de, GrandmaUlrira2SpriteVariants         ; $4D55: $11 $07 $4D

jr_018_4D58:
    call RenderActiveEntitySpritesPair            ; $4D58: $CD $C0 $3B
    call ReturnIfNonInteractive_18                ; $4D5B: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $4D5E: $F0 $E7
    rra                                           ; $4D60: $1F
    rra                                           ; $4D61: $1F
    rra                                           ; $4D62: $1F
    rra                                           ; $4D63: $1F
    and  $01                                      ; $4D64: $E6 $01
    call SetEntitySpriteVariant                   ; $4D66: $CD $0C $3B
    call PushLinkOutOfEntity_18                   ; $4D69: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4D6C: $F0 $F0
    JP_TABLE                                      ; $4D6E
._00 dw GrandmaUlriraState0Handler
._01 dw GrandmaUlriraState1Handler
._02 dw GrandmaUlriraState2Handler
._03 dw GrandmaUlriraState3Handler

GrandmaUlriraState0Handler::
    ld   a, [wGameplayType]                       ; $4D77: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $4D7A: $FE $0B
    ret  nz                                       ; $4D7C: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4D7D: $FA $6B $C1
    cp   $04                                      ; $4D80: $FE $04
    ret  nz                                       ; $4D82: $C0

    call func_018_7D95                            ; $4D83: $CD $95 $7D
    ret  nc                                       ; $4D86: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $4D87: $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ; $4D8A: $FE $80
    ld_dialog_low a, Dialog178 ; "Awful tragedy"  ; $4D8C: $3E $78
    jr   z, .jr_4DA0                              ; $4D8E: $28 $10

    ldh  a, [hMultiPurposeG]                      ; $4D90: $F0 $E8
    and  a                                        ; $4D92: $A7
    jr   nz, jr_018_4DA3                          ; $4D93: $20 $0E

    ld   a, [wTradeSequenceItem]                  ; $4D95: $FA $0E $DB
    cp   TRADING_ITEM_FISHING_HOOK                ; $4D98: $FE $0B
    ld_dialog_low a, Dialog15A ; "I'm fine, and you?" ; $4D9A: $3E $5A
    jr   c, .jr_4DA0                              ; $4D9C: $38 $02

    ld_dialog_low a, Dialog15F ; "A new broom!"   ; $4D9E: $3E $5F

.jr_4DA0
    jp   OpenDialogInTable1                       ; $4DA0: $C3 $73 $23

jr_018_4DA3:
    ld   a, [wTradeSequenceItem]                  ; $4DA3: $FA $0E $DB
    cp   TRADING_ITEM_BROOM                       ; $4DA6: $FE $0A
    jr   nz, .jr_4DB5                             ; $4DA8: $20 $0B

    ld   [wC167], a                               ; $4DAA: $EA $67 $C1
    call_open_dialog Dialog15C                    ; $4DAD
    jp   IncrementEntityState                     ; $4DB2: $C3 $12 $3B

.jr_4DB5
    jp_open_dialog Dialog15B                      ; $4DB5

GrandmaUlriraState1Handler::
    ld   a, [wDialogAskSelectionIndex]            ; $4DBA: $FA $77 $C1
    and  a                                        ; $4DBD: $A7
    jr   nz, .jr_4DCF                             ; $4DBE: $20 $0F

    ld   a, JINGLE_TREASURE_FOUND                 ; $4DC0: $3E $01
    ldh  [hJingle], a                             ; $4DC2: $E0 $F2
    ld   [wExchangingTradeSequenceItem], a        ; $4DC4: $EA $7F $DB
    call GetEntityTransitionCountdown             ; $4DC7: $CD $05 $0C
    ld   [hl], $80                                ; $4DCA: $36 $80
    jp   IncrementEntityState                     ; $4DCC: $C3 $12 $3B

.jr_4DCF
    xor  a                                        ; $4DCF: $AF
    ld   [wC167], a                               ; $4DD0: $EA $67 $C1
    call_open_dialog Dialog159                    ; $4DD3
    call IncrementEntityState                     ; $4DD8: $CD $12 $3B
    ld   [hl], b                                  ; $4DDB: $70
    ret                                           ; $4DDC: $C9

GrandmaUlriraState2Handler::
    call GetEntityTransitionCountdown             ; $4DDD: $CD $05 $0C
    jr   nz, .jr_4DF3                             ; $4DE0: $20 $11

    ld   a, TRADING_ITEM_FISHING_HOOK             ; $4DE2: $3E $0B
    ld   [wTradeSequenceItem], a                  ; $4DE4: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4DE7: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4DE9: $E0 $A5
    call_open_dialog Dialog15D                    ; $4DEB
    jp   IncrementEntityState                     ; $4DF0: $C3 $12 $3B

.jr_4DF3
    ld   a, $02                                   ; $4DF3: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4DF5: $E0 $A1
    ld   [wC167], a                               ; $4DF7: $EA $67 $C1
    xor  a                                        ; $4DFA: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4DFB: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $4DFD: $F0 $EC
    sub  $0E                                      ; $4DFF: $D6 $0E
    ldh  [hActiveEntityVisualPosY], a             ; $4E01: $E0 $EC
    ldh  a, [hActiveEntityPosX]                   ; $4E03: $F0 $EE
    sub  $04                                      ; $4E05: $D6 $04
    ldh  [hActiveEntityPosX], a                   ; $4E07: $E0 $EE
    ld   de, GrandmaUlrira3SpriteVariants         ; $4E09: $11 $13 $4D
    call RenderActiveEntitySpritesPair            ; $4E0C: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4E0F: $CD $8A $3D
    ld   a, $02                                   ; $4E12: $3E $02
    jp   SetEntitySpriteVariant                   ; $4E14: $C3 $0C $3B

GrandmaUlriraState3Handler::
    ld   a, [wDialogState]                        ; $4E17: $FA $9F $C1
    and  a                                        ; $4E1A: $A7
    jr   nz, .ret_4E2A                            ; $4E1B: $20 $0D

    ld   [wExchangingTradeSequenceItem], a        ; $4E1D: $EA $7F $DB
    ld   [wC167], a                               ; $4E20: $EA $67 $C1
    call CreateTradingItemEntity                  ; $4E23: $CD $0C $0C
    call IncrementEntityState                     ; $4E26: $CD $12 $3B
    ld   [hl], b                                  ; $4E29: $70

.ret_4E2A
    ret                                           ; $4E2A: $C9
