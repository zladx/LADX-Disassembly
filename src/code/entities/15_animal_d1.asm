; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
AnimalD1SpriteVariants::
.variant0
    db $74, $03
    db $76, $03
.variant1
    db $70, $03
    db $72, $03
.variant2
    db $76, $23
    db $74, $23
.variant3
    db $72, $23
    db $70, $23

AnimalD1EntityHandler::
    ld   a, [wIsMarinInAnimalVillage]             ; $7F96: $FA $74 $DB
    and  a                                        ; $7F99: $A7
    jp   z, ClearEntityStatus_15                  ; $7F9A: $CA $31 $7C

    ld   de, AnimalD1SpriteVariants               ; $7F9D: $11 $86 $7F
    call RenderActiveEntitySpritesPair            ; $7FA0: $CD $C0 $3B
    ld   a, [wMarinEntityIndex]                   ; $7FA3: $FA $0F $C5
    ld   e, a                                     ; $7FA6: $5F
    ld   d, b                                     ; $7FA7: $50
    ld   hl, wEntitiesPosXTable                   ; $7FA8: $21 $00 $C2
    add  hl, de                                   ; $7FAB: $19
    ldh  a, [hActiveEntityPosX]                   ; $7FAC: $F0 $EE
    ld   e, $00                                   ; $7FAE: $1E $00
    cp   [hl]                                     ; $7FB0: $BE
    jr   nc, .jr_7FB5                             ; $7FB1: $30 $02

    ld   e, $02                                   ; $7FB3: $1E $02

.jr_7FB5
    ldh  a, [hFrameCounter]                       ; $7FB5: $F0 $E7
    rra                                           ; $7FB7: $1F
    rra                                           ; $7FB8: $1F
    rra                                           ; $7FB9: $1F
    rra                                           ; $7FBA: $1F
    rra                                           ; $7FBB: $1F
    and  $01                                      ; $7FBC: $E6 $01
    add  e                                        ; $7FBE: $83
    call SetEntitySpriteVariant                   ; $7FBF: $CD $0C $3B
    call PushLinkOutOfEntity_15                   ; $7FC2: $CD $6E $7A

    call ShouldLinkTalkToEntity_15                ; $7FC5: $CD $BC $7A
    ret  nc                                       ; $7FC8: $D0
    jp_open_dialog Dialog196                      ; $7FC9
