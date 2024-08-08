; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
AnimalD0SpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

AnimalD0EntityHandler::
    ld   a, [wIsMarinInAnimalVillage]             ;; 05:7F2E $FA $74 $DB
    and  a                                        ;; 05:7F31 $A7
    jp   z, ClearEntityStatus_05                  ;; 05:7F32 $CA $4B $7B

    ld   de, AnimalD0SpriteVariants               ;; 05:7F35 $11 $1E $7F
    call RenderActiveEntitySpritesPair            ;; 05:7F38 $CD $C0 $3B
    ld   a, [wMarinEntityIndex]                   ;; 05:7F3B $FA $0F $C5
    ld   e, a                                     ;; 05:7F3E $5F
    ld   d, b                                     ;; 05:7F3F $50
    ld   hl, wEntitiesPosYTable                   ;; 05:7F40 $21 $10 $C2
    add  hl, de                                   ;; 05:7F43 $19
    ldh  a, [hActiveEntityPosY]                   ;; 05:7F44 $F0 $EF
    ld   e, $00                                   ;; 05:7F46 $1E $00
    cp   [hl]                                     ;; 05:7F48 $BE
    jr   c, .jr_7F4D                              ;; 05:7F49 $38 $02

    ld   e, $02                                   ;; 05:7F4B $1E $02

.jr_7F4D
    ldh  a, [hFrameCounter]                       ;; 05:7F4D $F0 $E7
    rra                                           ;; 05:7F4F $1F
    rra                                           ;; 05:7F50 $1F
    rra                                           ;; 05:7F51 $1F
    rra                                           ;; 05:7F52 $1F
    rra                                           ;; 05:7F53 $1F
    and  $01                                      ;; 05:7F54 $E6 $01
    add  e                                        ;; 05:7F56 $83
    call SetEntitySpriteVariant                   ;; 05:7F57 $CD $0C $3B
    call PushLinkOutOfEntity_05                   ;; 05:7F5A $CD $C3 $54
    call ShouldLinkTalkToEntity_05                ;; 05:7F5D $CD $06 $55
    ret  nc                                       ;; 05:7F60 $D0

    jp_open_dialog Dialog196                      ;; 05:7F61
