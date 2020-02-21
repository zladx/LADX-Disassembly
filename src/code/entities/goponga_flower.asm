Data_006_63F4::
    db   $50, $02
    db   $50, $22
    db   $52, $02
    db   $52, $22

GopongaFlowerEntityHandler::
    ld   de, Data_006_63F4                        ; $63FC: $11 $F4 $63
    call RenderActiveEntitySpritesPair            ; $63FF: $CD $C0 $3B

    call func_006_64C6                            ; $6402: $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ; $6405: $CD $56 $0C
    call label_3B70                               ; $6408: $CD $70 $3B
    call func_006_641A                            ; $640B: $CD $1A $64

    ; Every 48 frame…
    ldh  a, [hFrameCounter]                       ; $640E: $F0 $E7
    ld   e, b                                     ; $6410: $58
    and  $30                                      ; $6411: $E6 $30
    jr   z, .flipStateEnd                         ; $6413: $28 $01
    ; alternate between the open flower and the closed flower.
    inc  e                                        ; $6415: $1C
.flipStateEnd
    ld   a, e                                     ; $6416: $7B
    jp   SetEntitySpriteVariant                   ; $6417: $C3 $0C $3B

