Data_005_7F1E::
    db   $50, $01, $52, $01, $52, $21, $50, $21, $54, $01, $56, $01, $56, $21, $54, $21

AnimalD0EntityHandler::
    ld   a, [$DB74]                               ; $7F2E: $FA $74 $DB
    and  a                                        ; $7F31: $A7
    jp   z, func_005_7B4B                         ; $7F32: $CA $4B $7B

    ld   de, Data_005_7F1E                        ; $7F35: $11 $1E $7F
    call RenderActiveEntitySpritesPair            ; $7F38: $CD $C0 $3B
    ld   a, [$C50F]                               ; $7F3B: $FA $0F $C5
    ld   e, a                                     ; $7F3E: $5F
    ld   d, b                                     ; $7F3F: $50
    ld   hl, wEntitiesPosYTable                   ; $7F40: $21 $10 $C2
    add  hl, de                                   ; $7F43: $19
    ldh  a, [hActiveEntityPosY]                   ; $7F44: $F0 $EF
    ld   e, $00                                   ; $7F46: $1E $00
    cp   [hl]                                     ; $7F48: $BE
    jr   c, jr_005_7F4D                           ; $7F49: $38 $02

    ld   e, $02                                   ; $7F4B: $1E $02

jr_005_7F4D:
    ldh  a, [hFrameCounter]                       ; $7F4D: $F0 $E7
    rra                                           ; $7F4F: $1F
    rra                                           ; $7F50: $1F
    rra                                           ; $7F51: $1F
    rra                                           ; $7F52: $1F
    rra                                           ; $7F53: $1F
    and  $01                                      ; $7F54: $E6 $01
    add  e                                        ; $7F56: $83
    call SetEntitySpriteVariant                   ; $7F57: $CD $0C $3B
    call func_005_54C3                            ; $7F5A: $CD $C3 $54
    call func_005_5506                            ; $7F5D: $CD $06 $55
    ret  nc                                       ; $7F60: $D0

    jp_open_dialog $196                           ; $7F61
