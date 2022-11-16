; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SparkSpriteVariants::
.variant0
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5C, OAM_GBC_PAL_4 | OAMF_PAL1
    db $5C, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP

Data_006_661D::
    db   $00, $10, $00, $F0, $00, $F0, $00, $10

Data_006_6625::
    db   $10, $00, $F0, $00, $10, $00, $F0, $00

Data_006_662D::
    db   $01, $08, $02, $04, $01, $04, $02, $08

SparkClockwiseEntityHandler::
SparkCounterClockwiseEntityHandler::
    ld   a, $01                                   ; $6635: $3E $01
    ldh  [hActiveEntityNoBGCollision], a          ; $6637: $E0 $BE
    ldh  a, [hFrameCounter]                       ; $6639: $F0 $E7
    rra                                           ; $663B: $1F
    and  $01                                      ; $663C: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $663E: $E0 $F1
    ld   de, SparkSpriteVariants                  ; $6640: $11 $15 $66
    call RenderActiveEntitySpritesPair            ; $6643: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $6646: $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ; $6649: $CD $F7 $64
    call label_3B44                               ; $664C: $CD $44 $3B
    call UpdateEntityPosWithSpeed_06              ; $664F: $CD $41 $65
    call func_006_66CC                            ; $6652: $CD $CC $66
    ld   hl, wEntitiesPrivateState1Table          ; $6655: $21 $B0 $C2
    add  hl, bc                                   ; $6658: $09
    ld   a, [hl]                                  ; $6659: $7E
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    ld   hl, wEntitiesPrivateState2Table          ; $665C: $21 $C0 $C2
    add  hl, bc                                   ; $665F: $09
    add  [hl]                                     ; $6660: $86
    ld   e, a                                     ; $6661: $5F
    ld   hl, Data_006_662D                        ; $6662: $21 $2D $66
    add  hl, de                                   ; $6665: $19
    push hl                                       ; $6666: $E5
    ld   hl, wEntitiesCollisionsTable             ; $6667: $21 $A0 $C2
    add  hl, bc                                   ; $666A: $09
    ld   a, [hl]                                  ; $666B: $7E
    pop  hl                                       ; $666C: $E1
    and  [hl]                                     ; $666D: $A6
    jr   nz, .jr_6685                             ; $666E: $20 $15

    call GetEntityTransitionCountdown             ; $6670: $CD $05 $0C
    jr   nz, jr_006_6690                          ; $6673: $20 $1B

    ld   hl, wEntitiesCollisionsTable             ; $6675: $21 $A0 $C2
    add  hl, bc                                   ; $6678: $09
    ld   a, [hl]                                  ; $6679: $7E
    and  $0F                                      ; $667A: $E6 $0F
    jr   nz, jr_006_669D                          ; $667C: $20 $1F

    call GetEntityTransitionCountdown             ; $667E: $CD $05 $0C
    ld   [hl], $09                                ; $6681: $36 $09
    jr   jr_006_669D                              ; $6683: $18 $18

.jr_6685
    ld   hl, wEntitiesPrivateState1Table          ; $6685: $21 $B0 $C2
    add  hl, bc                                   ; $6688: $09
    inc  [hl]                                     ; $6689: $34
    ld   a, [hl]                                  ; $668A: $7E
    and  $03                                      ; $668B: $E6 $03
    ld   [hl], a                                  ; $668D: $77
    jr   jr_006_669D                              ; $668E: $18 $0D

jr_006_6690:
    cp   $06                                      ; $6690: $FE $06
    jr   nz, jr_006_669D                          ; $6692: $20 $09

    ld   hl, wEntitiesPrivateState1Table          ; $6694: $21 $B0 $C2
    add  hl, bc                                   ; $6697: $09
    dec  [hl]                                     ; $6698: $35
    ld   a, [hl]                                  ; $6699: $7E
    and  $03                                      ; $669A: $E6 $03
    ld   [hl], a                                  ; $669C: $77

jr_006_669D:
    ld   hl, wEntitiesPrivateState1Table          ; $669D: $21 $B0 $C2
    add  hl, bc                                   ; $66A0: $09
    ld   a, [hl]                                  ; $66A1: $7E
    ld   e, a                                     ; $66A2: $5F
    ld   d, b                                     ; $66A3: $50
    ld   hl, wEntitiesPrivateState2Table          ; $66A4: $21 $C0 $C2
    add  hl, bc                                   ; $66A7: $09
    add  [hl]                                     ; $66A8: $86
    ld   e, a                                     ; $66A9: $5F
    ld   hl, Data_006_661D                        ; $66AA: $21 $1D $66
    add  hl, de                                   ; $66AD: $19
    ld   a, [hl]                                  ; $66AE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $66AF: $21 $50 $C2
    add  hl, bc                                   ; $66B2: $09
    ld   [hl], a                                  ; $66B3: $77
    ld   hl, wEntitiesPrivateState1Table          ; $66B4: $21 $B0 $C2
    add  hl, bc                                   ; $66B7: $09
    ld   a, [hl]                                  ; $66B8: $7E
    ld   e, a                                     ; $66B9: $5F
    ld   d, b                                     ; $66BA: $50
    ld   hl, wEntitiesPrivateState2Table          ; $66BB: $21 $C0 $C2
    add  hl, bc                                   ; $66BE: $09
    add  [hl]                                     ; $66BF: $86
    ld   e, a                                     ; $66C0: $5F
    ld   hl, Data_006_6625                        ; $66C1: $21 $25 $66
    add  hl, de                                   ; $66C4: $19
    ld   a, [hl]                                  ; $66C5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $66C6: $21 $40 $C2
    add  hl, bc                                   ; $66C9: $09
    ld   [hl], a                                  ; $66CA: $77
    ret                                           ; $66CB: $C9

func_006_66CC::
    ld   hl, wEntitiesSpeedXTable                 ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    push af                                       ; $66D1: $F5
    ld   [hl], $01                                ; $66D2: $36 $01
    ld   hl, wEntitiesSpeedYTable                 ; $66D4: $21 $50 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    push af                                       ; $66D9: $F5
    ld   [hl], $01                                ; $66DA: $36 $01
    call label_3B23                               ; $66DC: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66DF: $21 $A0 $C2
    add  hl, bc                                   ; $66E2: $09
    ld   a, [hl]                                  ; $66E3: $7E
    push af                                       ; $66E4: $F5
    ld   hl, wEntitiesSpeedXTable                 ; $66E5: $21 $40 $C2
    add  hl, bc                                   ; $66E8: $09
    ld   [hl], $FF                                ; $66E9: $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ; $66EB: $21 $50 $C2
    add  hl, bc                                   ; $66EE: $09
    ld   [hl], $FF                                ; $66EF: $36 $FF
    call label_3B23                               ; $66F1: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66F4: $21 $A0 $C2
    add  hl, bc                                   ; $66F7: $09
    pop  af                                       ; $66F8: $F1
    or   [hl]                                     ; $66F9: $B6
    ld   [hl], a                                  ; $66FA: $77
    pop  af                                       ; $66FB: $F1
    ld   hl, wEntitiesSpeedYTable                 ; $66FC: $21 $50 $C2
    add  hl, bc                                   ; $66FF: $09
    ld   [hl], a                                  ; $6700: $77
    pop  af                                       ; $6701: $F1
    ld   hl, wEntitiesSpeedXTable                 ; $6702: $21 $40 $C2
    add  hl, bc                                   ; $6705: $09
    ld   [hl], a                                  ; $6706: $77
    ret                                           ; $6707: $C9
