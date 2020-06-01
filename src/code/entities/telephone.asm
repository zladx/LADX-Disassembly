Data_006_6A78::
    db   $50, $02, $52, $02

TelephoneEntityHandler::
    ldh  a, [hActiveEntityVisualPosY]             ; $6A7C: $F0 $EC
    sub  $05                                      ; $6A7E: $D6 $05
    ldh  [hActiveEntityVisualPosY], a             ; $6A80: $E0 $EC
    ld   de, Data_006_6A78                        ; $6A82: $11 $78 $6A
    call RenderActiveEntitySpritesPair            ; $6A85: $CD $C0 $3B
    call func_006_64C6                            ; $6A88: $CD $C6 $64
    call func_006_645D                            ; $6A8B: $CD $5D $64
    ret  nc                                       ; $6A8E: $D0

    ld   e, $FD                                   ; $6A8F: $1E $FD
    ldh  a, [hMapRoom]                            ; $6A91: $F0 $F6
    cp   $A9                           ; Ulrira's house
    jp   z, label_006_6BAD                        ; $6A95: $CA $AD $6B

    ld   e, $6E                                   ; $6A98: $1E $6E
    ld   a, [wTradeSequenceItem]                  ; $6A9A: $FA $0E $DB
    cp   TRADING_ITEM_BROOM
    jr   nz, jr_006_6AA9                          ; $6A9F: $20 $08

    ld   a, [wHasInstrument5]                     ; $6AA1: $FA $69 $DB
    and  $02                                      ; $6AA4: $E6 $02
    jp   nz, label_006_6BAD                       ; $6AA6: $C2 $AD $6B

jr_006_6AA9:
    ld   e, $41                                   ; $6AA9: $1E $41
    ld   a, [wIndoorBRoomStatus + $A9]                               ; $6AAB: $FA $A9 $DA
    and  $20                                      ; $6AAE: $E6 $20
    jp   z, label_006_6BAD                        ; $6AB0: $CA $AD $6B

    ld   e, $46                                   ; $6AB3: $1E $46
    ld   a, [wHasInstrument1]                     ; $6AB5: $FA $65 $DB
    and  $02                                      ; $6AB8: $E6 $02
    jp   z, label_006_6BAD                        ; $6ABA: $CA $AD $6B

    ld   e, $42                                   ; $6ABD: $1E $42
    ld   a, [wIsBowWowFollowingLink]              ; $6ABF: $FA $56 $DB
    cp   $80                                      ; $6AC2: $FE $80
    jp   z, label_006_6BAD                        ; $6AC4: $CA $AD $6B

    ld   e, $43                                   ; $6AC7: $1E $43
    ld   a, [wHasInstrument2]                     ; $6AC9: $FA $66 $DB
    and  $02                                      ; $6ACC: $E6 $02
    jp   z, label_006_6BAD                        ; $6ACE: $CA $AD $6B

    ld   e, $44                                   ; $6AD1: $1E $44
    ld   a, [wIsBowWowFollowingLink]              ; $6AD3: $FA $56 $DB
    cp   $01                                      ; $6AD6: $FE $01
    jp   z, label_006_6BB3                        ; $6AD8: $CA $B3 $6B

    ld   e, $44                                   ; $6ADB: $1E $44
    ld   a, [wRichardSpokenFlag]                  ; $6ADD: $FA $55 $DB
    cp   $02                                      ; $6AE0: $FE $02
    jp   nz, label_006_6BAD                       ; $6AE2: $C2 $AD $6B

    ld   e, $45                                   ; $6AE5: $1E $45
    ld   a, [wTradeSequenceItem]                  ; $6AE7: $FA $0E $DB
    cp   TRADING_ITEM_STICK
    jp   c, label_006_6BAD                        ; $6AEC: $DA $AD $6B

    ld   a, [wGoldenLeavesCount]                  ; $6AEF: $FA $15 $DB
    cp   $05                                      ; $6AF2: $FE $05
    jr   nc, jr_006_6B09                          ; $6AF4: $30 $13

    ld   hl, wEntitiesPrivateState1Table          ; $6AF6: $21 $B0 $C2
    add  hl, bc                                   ; $6AF9: $09
    inc  [hl]                                     ; $6AFA: $34
    ld   a, [hl]                                  ; $6AFB: $7E
    cp   $03                                      ; $6AFC: $FE $03
    jr   nz, jr_006_6B02                          ; $6AFE: $20 $02

    xor  a                                        ; $6B00: $AF
    ld   [hl], a                                  ; $6B01: $77

jr_006_6B02:
    ld   e, $28                                   ; $6B02: $1E $28
    add  e                                        ; $6B04: $83
    ld   e, a                                     ; $6B05: $5F
    jp   label_006_6BB3                           ; $6B06: $C3 $B3 $6B

jr_006_6B09:
    ld   e, $48                                   ; $6B09: $1E $48
    jp   z, label_006_6BAD                        ; $6B0B: $CA $AD $6B

    cp   $06                                      ; $6B0E: $FE $06
    jp   nz, label_006_6BAD                       ; $6B10: $C2 $AD $6B

    ld   e, $49                                   ; $6B13: $1E $49
    ld   a, [wHasInstrument3]                     ; $6B15: $FA $67 $DB
    and  $02                                      ; $6B18: $E6 $02
    jp   z, label_006_6BAD                        ; $6B1A: $CA $AD $6B

    ld   e, $4A                                   ; $6B1D: $1E $4A
    ld   a, [wHasAnglerKey]                       ; $6B1F: $FA $12 $DB
    and  a                                        ; $6B22: $A7
    jp   z, label_006_6BAD                        ; $6B23: $CA $AD $6B

    ld   e, $40                                   ; $6B26: $1E $40
    ld   a, [wHasInstrument4]                     ; $6B28: $FA $68 $DB
    and  $02                                      ; $6B2B: $E6 $02
    jp   z, label_006_6BB3                        ; $6B2D: $CA $B3 $6B

    ld   a, [wIsGhostFollowingLink]               ; $6B30: $FA $79 $DB
    and  a                                        ; $6B33: $A7
    jr   z, jr_006_6B3F                           ; $6B34: $28 $09

    ld   e, $4B                                   ; $6B36: $1E $4B
    ld   a, [wIndoorARoomStatus + $E3]                               ; $6B38: $FA $E3 $D9
    and  $40                                      ; $6B3B: $E6 $40
    jr   z, label_006_6BAD                        ; $6B3D: $28 $6E

jr_006_6B3F:
    ld   e, $4C                                   ; $6B3F: $1E $4C
    ld   a, [wHasInstrument5]                     ; $6B41: $FA $69 $DB
    and  $02                                      ; $6B44: $E6 $02
    jr   z, label_006_6BAD                        ; $6B46: $28 $65

    ld   e, $45                                   ; $6B48: $1E $45
    ld   a, [wOcarinaSongFlags]                   ; $6B4A: $FA $49 $DB
    and  $01                                      ; $6B4D: $E6 $01
    jp   z, label_006_6BB3                        ; $6B4F: $CA $B3 $6B

    ld   e, $4D                                   ; $6B52: $1E $4D
    ld   a, [wHasInstrument6]                     ; $6B54: $FA $6A $DB
    and  $02                                      ; $6B57: $E6 $02
    jr   z, label_006_6BAD                        ; $6B59: $28 $52

    ld   e, $4E                                   ; $6B5B: $1E $4E
    ld   a, [wIsRoosterFollowingLink]             ; $6B5D: $FA $7B $DB
    and  a                                        ; $6B60: $A7
    jr   z, jr_006_6B6E                           ; $6B61: $28 $0B

    ld   e, $46                                   ; $6B63: $1E $46
    ld   a, [wHasBirdKey]                         ; $6B65: $FA $14 $DB
    and  a                                        ; $6B68: $A7
    jp   z, label_006_6BB3                        ; $6B69: $CA $B3 $6B

    ld   e, $41                                   ; $6B6C: $1E $41

jr_006_6B6E:
    ld   a, [wHasInstrument7]                     ; $6B6E: $FA $6B $DB
    and  $02                                      ; $6B71: $E6 $02
    jr   nz, jr_006_6B7C                          ; $6B73: $20 $07

    ld   a, e                                     ; $6B75: $7B
    cp   $4E                                      ; $6B76: $FE $4E
    jr   z, label_006_6BAD                        ; $6B78: $28 $33

    jr   label_006_6BB3                           ; $6B7A: $18 $37

jr_006_6B7C:
    ld   e, $4F                                   ; $6B7C: $1E $4F
    ld   a, [wOverworldRoomStatus + $10]                               ; $6B7E: $FA $10 $D8
    and  $30                                      ; $6B81: $E6 $30
    jr   z, label_006_6BAD                        ; $6B83: $28 $28

    ld   e, $48                                   ; $6B85: $1E $48
    ld   a, [wHasInstrument8]                     ; $6B87: $FA $6C $DB
    and  $02                                      ; $6B8A: $E6 $02
    jr   z, label_006_6BB3                        ; $6B8C: $28 $25

    ld   e, $42                                   ; $6B8E: $1E $42
    ld   a, [wOverworldRoomStatus + $06]                               ; $6B90: $FA $06 $D8
    and  $30                                      ; $6B93: $E6 $30
    jr   z, label_006_6BB3                        ; $6B95: $28 $1C

    ld   e, $43                                   ; $6B97: $1E $43
    ld   a, [wIndoorBRoomStatus + $74]                               ; $6B99: $FA $74 $DA
    and  $40                                      ; $6B9C: $E6 $40
    jr   z, label_006_6BB3                        ; $6B9E: $28 $13

    ld   e, $47                                   ; $6BA0: $1E $47
    ld   a, [wSwordLevel]                         ; $6BA2: $FA $4E $DB
    cp   $02                                      ; $6BA5: $FE $02
    jr   c, label_006_6BB3                        ; $6BA7: $38 $0A

    ld   e, $48                                   ; $6BA9: $1E $48
    jr   label_006_6BB3                           ; $6BAB: $18 $06

label_006_6BAD:
    ld   a, e                                     ; $6BAD: $7B
    call OpenDialogInTable1                       ; $6BAE: $CD $73 $23
    jr   jr_006_6BB7                              ; $6BB1: $18 $04

label_006_6BB3:
    ld   a, e                                     ; $6BB3: $7B
    call OpenDialogInTable2                       ; $6BB4: $CD $7C $23

jr_006_6BB7:
    ld   hl, wIndoorBRoomStatus + $A9                                ; $6BB7: $21 $A9 $DA
    set  5, [hl]                                  ; $6BBA: $CB $EE
    ret                                           ; $6BBC: $C9
