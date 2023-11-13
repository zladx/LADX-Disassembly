; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CrystalSwitchSpriteVariants::
.variant0
    db $58, $03
    db $58, $23

CrystalSwitchEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $4324: $21 $60 $C3
    add  hl, bc                                   ; $4327: $09
    ld   [hl], $FF                                ; $4328: $36 $FF
    call GetEntityTransitionCountdown             ; $432A: $CD $05 $0C
    rla                                           ; $432D: $17
    and  OAMF_PAL1                                ; $432E: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4330: $E0 $ED
    ld   de, CrystalSwitchSpriteVariants         ; $4332: $11 $20 $43
    call RenderActiveEntitySpritesPair            ; $4335: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4338: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $433B: $CD $56 $0C
    call label_3B70                               ; $433E: $CD $70 $3B
    call PushLinkOutOfEntity_15                   ; $4341: $CD $6E $7A
    call label_3B23                               ; $4344: $CD $23 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $4347: $21 $20 $C4
    add  hl, bc                                   ; $434A: $09
    ld   a, [hl]                                  ; $434B: $7E
    and  a                                        ; $434C: $A7
    jr   z, .ret_4364                             ; $434D: $28 $15

    ld   [hl], b                                  ; $434F: $70
    ld   a, [wSwitchableObjectAnimationStage]     ; $4350: $FA $F8 $D6
    and  a                                        ; $4353: $A7
    jr   nz, .ret_4364                            ; $4354: $20 $0E

    ld   a, $01                                   ; $4356: $3E $01
    ld   [wSwitchableObjectAnimationStage], a     ; $4358: $EA $F8 $D6
    call GetEntityTransitionCountdown             ; $435B: $CD $05 $0C
    ld   [hl], $18                                ; $435E: $36 $18
    ld   a, WAVE_SFX_FLOOR_SWITCH                 ; $4360: $3E $0E
    ldh  [hWaveSfx], a                            ; $4362: $E0 $F3

.ret_4364
    ret                                           ; $4364: $C9
