Data_006_5B56::
    db   $60, $01, $62, $01, $62, $21, $60, $21, $64, $01, $66, $01, $66, $21, $64, $21
    db   $68, $01, $6A, $01, $6C, $01, $6E, $01, $6A, $21, $68, $21, $6E, $21, $6C, $21

MadamMeowMeowEntityHandler::
    call GetEntityTransitionCountdown             ; $5B76: $CD $05 $0C
    cp   $01                                      ; $5B79: $FE $01
    jr   nz, jr_006_5B83                          ; $5B7B: $20 $06

    ld   [hl], b                                  ; $5B7D: $70
    ld   a, $FF                                   ; $5B7E: $3E $FF
    ld   [wAddHealthBuffer], a                    ; $5B80: $EA $93 $DB

jr_006_5B83:
    ldh  a, [hFrameCounter]                       ; $5B83: $F0 $E7
    and  $1F                                      ; $5B85: $E6 $1F
    jr   nz, jr_006_5B91                          ; $5B87: $20 $08

    call func_006_65B4                            ; $5B89: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $5B8C: $21 $80 $C3
    add  hl, bc                                   ; $5B8F: $09
    ld   [hl], e                                  ; $5B90: $73

jr_006_5B91:
    call SetEntitySpriteVariantForDirection                            ; $5B91: $CD $41 $64
    ld   de, Data_006_5B56                        ; $5B94: $11 $56 $5B
    call RenderActiveEntitySpritesPair            ; $5B97: $CD $C0 $3B
    ld   a, [wIsBowWowFollowingLink]              ; $5B9A: $FA $56 $DB
    cp   $80                                      ; $5B9D: $FE $80
    jr   nz, jr_006_5BC4                          ; $5B9F: $20 $23

    call func_006_657A                            ; $5BA1: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5BA4: $21 $20 $C3
    add  hl, bc                                   ; $5BA7: $09
    dec  [hl]                                     ; $5BA8: $35
    dec  [hl]                                     ; $5BA9: $35
    ld   hl, wEntitiesPosZTable                   ; $5BAA: $21 $10 $C3
    add  hl, bc                                   ; $5BAD: $09
    ld   a, [hl]                                  ; $5BAE: $7E
    and  a                                        ; $5BAF: $A7
    jr   z, jr_006_5BB6                           ; $5BB0: $28 $04

    and  $80                                      ; $5BB2: $E6 $80
    jr   z, jr_006_5BC4                           ; $5BB4: $28 $0E

jr_006_5BB6:
    ld   [hl], b                                  ; $5BB6: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5BB7: $21 $20 $C3
    add  hl, bc                                   ; $5BBA: $09
    ld   [hl], b                                  ; $5BBB: $70
    ldh  a, [hFrameCounter]                       ; $5BBC: $F0 $E7
    and  $3F                                      ; $5BBE: $E6 $3F
    jr   nz, jr_006_5BC4                          ; $5BC0: $20 $02

    ld   [hl], $10                                ; $5BC2: $36 $10

jr_006_5BC4:
    call func_006_64C6                            ; $5BC4: $CD $C6 $64
    ldh  a, [hActiveEntityPosY]                   ; $5BC7: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $5BC9: $E0 $EC
    call func_006_641A                            ; $5BCB: $CD $1A $64
    call CopyEntityPositionToActivePosition       ; $5BCE: $CD $8A $3D
    call func_006_645D                            ; $5BD1: $CD $5D $64
    ret  nc                                       ; $5BD4: $D0

    ld   e, $30                                   ; $5BD5: $1E $30
    ld   a, [wHasInstrument2]                     ; $5BD7: $FA $66 $DB
    and  $02                                      ; $5BDA: $E6 $02
    jr   z, jr_006_5BF2                           ; $5BDC: $28 $14

    ld   a, [wIsBowWowFollowingLink]              ; $5BDE: $FA $56 $DB
    cp   $01                                      ; $5BE1: $FE $01
    jr   nz, jr_006_5BF2                          ; $5BE3: $20 $0D

    xor  a                                        ; $5BE5: $AF
    ld   [wIsBowWowFollowingLink], a              ; $5BE6: $EA $56 $DB
    call GetEntityTransitionCountdown             ; $5BE9: $CD $05 $0C
    ld   [hl], $10                                ; $5BEC: $36 $10
    ld   e, $2F                                   ; $5BEE: $1E $2F
    jr   jr_006_5C00                              ; $5BF0: $18 $0E

jr_006_5BF2:
    ld   a, [wIsBowWowFollowingLink]              ; $5BF2: $FA $56 $DB
    and  a                                        ; $5BF5: $A7
    jr   z, jr_006_5C00                           ; $5BF6: $28 $08

    ld   e, $31                                   ; $5BF8: $1E $31
    cp   $01                                      ; $5BFA: $FE $01
    jr   nz, jr_006_5C00                          ; $5BFC: $20 $02

    ld   e, $32                                   ; $5BFE: $1E $32

jr_006_5C00:
    ld   a, e                                     ; $5C00: $7B
    jp   label_006_5C04                           ; $5C01: $C3 $04 $5C

label_006_5C04:
    ld   a, e                                     ; $5C04: $7B
    call OpenDialogInTable1                       ; $5C05: $CD $73 $23
    ld   hl, wDialogState                         ; $5C08: $21 $9F $C1
    set  7, [hl]                                  ; $5C0B: $CB $FE
    ret                                           ; $5C0D: $C9
