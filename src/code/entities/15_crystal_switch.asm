; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CrystalSwitchSpriteVariants::
.variant0
    db $58, $03
    db $58, $23

CrystalSwitchEntityHandler::
    ld   hl, wEntitiesHealthTable                 ;; 15:4324 $21 $60 $C3
    add  hl, bc                                   ;; 15:4327 $09
    ld   [hl], $FF                                ;; 15:4328 $36 $FF
    call GetEntityTransitionCountdown             ;; 15:432A $CD $05 $0C
    rla                                           ;; 15:432D $17
    and  OAMF_PAL1                                ;; 15:432E $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 15:4330 $E0 $ED
    ld   de, CrystalSwitchSpriteVariants          ;; 15:4332 $11 $20 $43
    call RenderActiveEntitySpritesPair            ;; 15:4335 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4338 $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ;; 15:433B $CD $56 $0C
    call label_3B70                               ;; 15:433E $CD $70 $3B
    call PushLinkOutOfEntity_15                   ;; 15:4341 $CD $6E $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:4344 $CD $23 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 15:4347 $21 $20 $C4
    add  hl, bc                                   ;; 15:434A $09
    ld   a, [hl]                                  ;; 15:434B $7E
    and  a                                        ;; 15:434C $A7
    jr   z, .ret_4364                             ;; 15:434D $28 $15

    ld   [hl], b                                  ;; 15:434F $70
    ld   a, [wSwitchableObjectAnimationStage]     ;; 15:4350 $FA $F8 $D6
    and  a                                        ;; 15:4353 $A7
    jr   nz, .ret_4364                            ;; 15:4354 $20 $0E

    ld   a, $01                                   ;; 15:4356 $3E $01
    ld   [wSwitchableObjectAnimationStage], a     ;; 15:4358 $EA $F8 $D6
    call GetEntityTransitionCountdown             ;; 15:435B $CD $05 $0C
    ld   [hl], $18                                ;; 15:435E $36 $18
    ld   a, WAVE_SFX_FLOOR_SWITCH                 ;; 15:4360 $3E $0E
    ldh  [hWaveSfx], a                            ;; 15:4362 $E0 $F3

.ret_4364
    ret                                           ;; 15:4364 $C9
