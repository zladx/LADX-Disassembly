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
    ld   a, $01                                   ;; 06:6635 $3E $01
    ldh  [hActiveEntityNoBGCollision], a          ;; 06:6637 $E0 $BE
    ldh  a, [hFrameCounter]                       ;; 06:6639 $F0 $E7
    rra                                           ;; 06:663B $1F
    and  $01                                      ;; 06:663C $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:663E $E0 $F1
    ld   de, SparkSpriteVariants                  ;; 06:6640 $11 $15 $66
    call RenderActiveEntitySpritesPair            ;; 06:6643 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:6646 $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:6649 $CD $F7 $64
    call label_3B44                               ;; 06:664C $CD $44 $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:664F $CD $41 $65
    call func_006_66CC                            ;; 06:6652 $CD $CC $66
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6655 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6658 $09
    ld   a, [hl]                                  ;; 06:6659 $7E
    ld   e, a                                     ;; 06:665A $5F
    ld   d, b                                     ;; 06:665B $50
    ld   hl, wEntitiesPrivateState2Table          ;; 06:665C $21 $C0 $C2
    add  hl, bc                                   ;; 06:665F $09
    add  [hl]                                     ;; 06:6660 $86
    ld   e, a                                     ;; 06:6661 $5F
    ld   hl, Data_006_662D                        ;; 06:6662 $21 $2D $66
    add  hl, de                                   ;; 06:6665 $19
    push hl                                       ;; 06:6666 $E5
    ld   hl, wEntitiesCollisionsTable             ;; 06:6667 $21 $A0 $C2
    add  hl, bc                                   ;; 06:666A $09
    ld   a, [hl]                                  ;; 06:666B $7E
    pop  hl                                       ;; 06:666C $E1
    and  [hl]                                     ;; 06:666D $A6
    jr   nz, .jr_6685                             ;; 06:666E $20 $15

    call GetEntityTransitionCountdown             ;; 06:6670 $CD $05 $0C
    jr   nz, jr_006_6690                          ;; 06:6673 $20 $1B

    ld   hl, wEntitiesCollisionsTable             ;; 06:6675 $21 $A0 $C2
    add  hl, bc                                   ;; 06:6678 $09
    ld   a, [hl]                                  ;; 06:6679 $7E
    and  $0F                                      ;; 06:667A $E6 $0F
    jr   nz, jr_006_669D                          ;; 06:667C $20 $1F

    call GetEntityTransitionCountdown             ;; 06:667E $CD $05 $0C
    ld   [hl], $09                                ;; 06:6681 $36 $09
    jr   jr_006_669D                              ;; 06:6683 $18 $18

.jr_6685
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6685 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6688 $09
    inc  [hl]                                     ;; 06:6689 $34
    ld   a, [hl]                                  ;; 06:668A $7E
    and  $03                                      ;; 06:668B $E6 $03
    ld   [hl], a                                  ;; 06:668D $77
    jr   jr_006_669D                              ;; 06:668E $18 $0D

jr_006_6690:
    cp   $06                                      ;; 06:6690 $FE $06
    jr   nz, jr_006_669D                          ;; 06:6692 $20 $09

    ld   hl, wEntitiesPrivateState1Table          ;; 06:6694 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6697 $09
    dec  [hl]                                     ;; 06:6698 $35
    ld   a, [hl]                                  ;; 06:6699 $7E
    and  $03                                      ;; 06:669A $E6 $03
    ld   [hl], a                                  ;; 06:669C $77

jr_006_669D:
    ld   hl, wEntitiesPrivateState1Table          ;; 06:669D $21 $B0 $C2
    add  hl, bc                                   ;; 06:66A0 $09
    ld   a, [hl]                                  ;; 06:66A1 $7E
    ld   e, a                                     ;; 06:66A2 $5F
    ld   d, b                                     ;; 06:66A3 $50
    ld   hl, wEntitiesPrivateState2Table          ;; 06:66A4 $21 $C0 $C2
    add  hl, bc                                   ;; 06:66A7 $09
    add  [hl]                                     ;; 06:66A8 $86
    ld   e, a                                     ;; 06:66A9 $5F
    ld   hl, Data_006_661D                        ;; 06:66AA $21 $1D $66
    add  hl, de                                   ;; 06:66AD $19
    ld   a, [hl]                                  ;; 06:66AE $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:66AF $21 $50 $C2
    add  hl, bc                                   ;; 06:66B2 $09
    ld   [hl], a                                  ;; 06:66B3 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 06:66B4 $21 $B0 $C2
    add  hl, bc                                   ;; 06:66B7 $09
    ld   a, [hl]                                  ;; 06:66B8 $7E
    ld   e, a                                     ;; 06:66B9 $5F
    ld   d, b                                     ;; 06:66BA $50
    ld   hl, wEntitiesPrivateState2Table          ;; 06:66BB $21 $C0 $C2
    add  hl, bc                                   ;; 06:66BE $09
    add  [hl]                                     ;; 06:66BF $86
    ld   e, a                                     ;; 06:66C0 $5F
    ld   hl, Data_006_6625                        ;; 06:66C1 $21 $25 $66
    add  hl, de                                   ;; 06:66C4 $19
    ld   a, [hl]                                  ;; 06:66C5 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:66C6 $21 $40 $C2
    add  hl, bc                                   ;; 06:66C9 $09
    ld   [hl], a                                  ;; 06:66CA $77
    ret                                           ;; 06:66CB $C9

func_006_66CC::
    ld   hl, wEntitiesSpeedXTable                 ;; 06:66CC $21 $40 $C2
    add  hl, bc                                   ;; 06:66CF $09
    ld   a, [hl]                                  ;; 06:66D0 $7E
    push af                                       ;; 06:66D1 $F5
    ld   [hl], $01                                ;; 06:66D2 $36 $01
    ld   hl, wEntitiesSpeedYTable                 ;; 06:66D4 $21 $50 $C2
    add  hl, bc                                   ;; 06:66D7 $09
    ld   a, [hl]                                  ;; 06:66D8 $7E
    push af                                       ;; 06:66D9 $F5
    ld   [hl], $01                                ;; 06:66DA $36 $01
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:66DC $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:66DF $21 $A0 $C2
    add  hl, bc                                   ;; 06:66E2 $09
    ld   a, [hl]                                  ;; 06:66E3 $7E
    push af                                       ;; 06:66E4 $F5
    ld   hl, wEntitiesSpeedXTable                 ;; 06:66E5 $21 $40 $C2
    add  hl, bc                                   ;; 06:66E8 $09
    ld   [hl], $FF                                ;; 06:66E9 $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ;; 06:66EB $21 $50 $C2
    add  hl, bc                                   ;; 06:66EE $09
    ld   [hl], $FF                                ;; 06:66EF $36 $FF
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:66F1 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:66F4 $21 $A0 $C2
    add  hl, bc                                   ;; 06:66F7 $09
    pop  af                                       ;; 06:66F8 $F1
    or   [hl]                                     ;; 06:66F9 $B6
    ld   [hl], a                                  ;; 06:66FA $77
    pop  af                                       ;; 06:66FB $F1
    ld   hl, wEntitiesSpeedYTable                 ;; 06:66FC $21 $50 $C2
    add  hl, bc                                   ;; 06:66FF $09
    ld   [hl], a                                  ;; 06:6700 $77
    pop  af                                       ;; 06:6701 $F1
    ld   hl, wEntitiesSpeedXTable                 ;; 06:6702 $21 $40 $C2
    add  hl, bc                                   ;; 06:6705 $09
    ld   [hl], a                                  ;; 06:6706 $77
    ret                                           ;; 06:6707 $C9
