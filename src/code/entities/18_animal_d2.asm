; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
AnimalD2SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $7E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

AnimalD2EntityHandler::
    call func_018_51B0                            ; $526B: $CD $B0 $51
    ld   de, AnimalD2SpriteVariants               ; $526E: $11 $5B $52
    call RenderActiveEntitySpritesPair            ; $5271: $CD $C0 $3B
    ld   a, [wMarinEntityIndex]                   ; $5274: $FA $0F $C5
    ld   e, a                                     ; $5277: $5F
    ld   d, b                                     ; $5278: $50
    ld   hl, wEntitiesPosXTable                   ; $5279: $21 $00 $C2
    add  hl, de                                   ; $527C: $19
    ldh  a, [hActiveEntityPosX]                   ; $527D: $F0 $EE
    ld   e, $00                                   ; $527F: $1E $00
    cp   [hl]                                     ; $5281: $BE
    jr   nc, .jr_5286                             ; $5282: $30 $02

    ld   e, $02                                   ; $5284: $1E $02

.jr_5286
    ldh  a, [hFrameCounter]                       ; $5286: $F0 $E7
    rra                                           ; $5288: $1F
    rra                                           ; $5289: $1F
    rra                                           ; $528A: $1F
    rra                                           ; $528B: $1F
    rra                                           ; $528C: $1F
    and  $01                                      ; $528D: $E6 $01
    add  e                                        ; $528F: $83
    call SetEntitySpriteVariant                   ; $5290: $CD $0C $3B
    jp   label_018_51A4                           ; $5293: $C3 $A4 $51
