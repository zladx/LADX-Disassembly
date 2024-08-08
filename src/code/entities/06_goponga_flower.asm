; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GopongaFlowerSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

GopongaFlowerEntityHandler::
    ld   de, GopongaFlowerSpriteVariants          ;; 06:63FC $11 $F4 $63
    call RenderActiveEntitySpritesPair            ;; 06:63FF $CD $C0 $3B

    call ReturnIfNonInteractive_06                ;; 06:6402 $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:6405 $CD $56 $0C
    call label_3B70                               ;; 06:6408 $CD $70 $3B
    call PushLinkOutOfEntity_06                   ;; 06:640B $CD $1A $64

    ; Every 48 frame…
    ldh  a, [hFrameCounter]                       ;; 06:640E $F0 $E7
    ld   e, b                                     ;; 06:6410 $58
    and  $30                                      ;; 06:6411 $E6 $30
    jr   z, .flipStateEnd                         ;; 06:6413 $28 $01
    ; alternate between the open flower and the closed flower.
    inc  e                                        ;; 06:6415 $1C
.flipStateEnd
    ld   a, e                                     ;; 06:6416 $7B
    jp   SetEntitySpriteVariant                   ;; 06:6417 $C3 $0C $3B

