; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GhiniSpriteVariants::
.variant0
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0

GhiniTargetXSpeeds::
    db   $0C, $F4

GhiniTargetYSpeeds::
    db   $08, $F8

GiantGhiniEntityHandler::
    call RenderGiantGhini                         ;; 04:5C08 $CD $A6 $5D
    jr   GhiniEntityHandler.sharedGhiniBehavior   ;; 04:5C0B $18 $09

HidingGhiniEntityHandler::
GhiniEntityHandler::
    call GhiniUpdateFlipAttribute                 ;; 04:5C0D $CD $90 $7F
    ld   de, GhiniSpriteVariants                  ;; 04:5C10 $11 $FC $5B
    call RenderActiveEntitySpritesPair            ;; 04:5C13 $CD $C0 $3B

.sharedGhiniBehavior
    ldh  a, [hActiveEntityState]                  ;; 04:5C16 $F0 $F0
    and  a                                        ;; 04:5C18 $A7
    jr   z, GhiniVisibleHandler                   ;; 04:5C19 $28 $28

    ; Hiding
    ld   a, $FF                                   ;; 04:5C1B $3E $FF
    call SetEntitySpriteVariant                   ;; 04:5C1D $CD $0C $3B
    call GetEntityXDistanceToLink_04              ;; 04:5C20 $CD $35 $6E
    add  $10                                      ;; 04:5C23 $C6 $10
    cp   $20                                      ;; 04:5C25 $FE $20
    jr   nc, .return                              ;; 04:5C27 $30 $19

    call GetEntityYDistanceToLink_04              ;; 04:5C29 $CD $45 $6E
    add  $10                                      ;; 04:5C2C $C6 $10
    cp   $20                                      ;; 04:5C2E $FE $20
    jr   nc, .return                              ;; 04:5C30 $30 $10

    ld   a, [wCollisionType]                      ;; 04:5C32 $FA $33 $C1
    and  a                                        ;; 04:5C35 $A7
    jr   z, .return                               ;; 04:5C36 $28 $0A

    call IncrementEntityState                     ;; 04:5C38 $CD $12 $3B
    ld   [hl], b                                  ;; 04:5C3B $70
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:5C3C $21 $00 $C3
    add  hl, bc                                   ;; 04:5C3F $09
    ld   [hl], $30                                ;; 04:5C40 $36 $30

.return
    ret                                           ;; 04:5C42 $C9

GhiniVisibleHandler:
    ldh  a, [hFrameCounter]                       ;; 04:5C43 $F0 $E7
    rra                                           ;; 04:5C45 $1F
    rra                                           ;; 04:5C46 $1F
    rra                                           ;; 04:5C47 $1F
    rra                                           ;; 04:5C48 $1F
    xor  c                                        ;; 04:5C49 $A9
    and  $01                                      ;; 04:5C4A $E6 $01
    call SetEntitySpriteVariant                   ;; 04:5C4C $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 04:5C4F $F0 $E7
    and  $00                                      ;; 04:5C51 $E6 $00
    jr   z, .visible                              ;; 04:5C53 $28 $05

    ld   a, $FF                                   ;; 04:5C55 $3E $FF
    call SetEntitySpriteVariant                   ;; 04:5C57 $CD $0C $3B

.visible
    call ReturnIfNonInteractive_04                ;; 04:5C5A $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ;; 04:5C5D $CD $80 $6D
    call label_3B70                               ;; 04:5C60 $CD $70 $3B

.move
    call UpdateEntityPosWithSpeed_04              ;; 04:5C63 $CD $CA $6D
    call AddEntityZSpeedToPos_04                  ;; 04:5C66 $CD $03 $6E
    call GhiniCorrectZPosition                    ;; 04:5C69 $CD $08 $5D
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:5C6C $21 $00 $C3
    add  hl, bc                                   ;; 04:5C6F $09
    ld   a, [hl]                                  ;; 04:5C70 $7E
    and  a                                        ;; 04:5C71 $A7
    jp   nz, .return                              ;; 04:5C72 $C2 $07 $5D

    call label_3B44                               ;; 04:5C75 $CD $44 $3B
    call GetEntityTransitionCountdown             ;; 04:5C78 $CD $05 $0C
    jr   nz, .updateTargetXDirectionEnd           ;; 04:5C7B $20 $0F

    call GetRandomByte                            ;; 04:5C7D $CD $0D $28
    and  $1F                                      ;; 04:5C80 $E6 $1F
    add  $20                                      ;; 04:5C82 $C6 $20
    ld   [hl], a                                  ;; 04:5C84 $77
    and  $01                                      ;; 04:5C85 $E6 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5C87 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5C8A $09
    ld   [hl], a                                  ;; 04:5C8B $77

.updateTargetXDirectionEnd
    call GetEntityPrivateCountdown1               ;; 04:5C8C $CD $00 $0C
    jr   nz, .updateTargetYDirectionEnd           ;; 04:5C8F $20 $0F

    call GetRandomByte                            ;; 04:5C91 $CD $0D $28
    and  $0F                                      ;; 04:5C94 $E6 $0F
    add  $18                                      ;; 04:5C96 $C6 $18
    ld   [hl], a                                  ;; 04:5C98 $77
    and  $01                                      ;; 04:5C99 $E6 $01
    ld   hl, wEntitiesPrivateState2Table          ;; 04:5C9B $21 $C0 $C2
    add  hl, bc                                   ;; 04:5C9E $09
    ld   [hl], a                                  ;; 04:5C9F $77

.updateTargetYDirectionEnd
    ldh  a, [hFrameCounter]                       ;; 04:5CA0 $F0 $E7
    xor  c                                        ;; 04:5CA2 $A9
    and  $03                                      ;; 04:5CA3 $E6 $03
    jr   nz, .return                              ;; 04:5CA5 $20 $60

    ld   hl, wEntitiesPrivateState1Table          ;; 04:5CA7 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5CAA $09
    ldh  a, [hActiveEntityPosX]                   ;; 04:5CAB $F0 $EE
    cp   $28                                      ;; 04:5CAD $FE $28
    jr   nc, .nearLeftEdgeEnd                     ;; 04:5CAF $30 $04

    ld   [hl], $00                                ;; 04:5CB1 $36 $00
    jr   .turnedAroundAtVerticalEdge              ;; 04:5CB3 $18 $06

.nearLeftEdgeEnd
    cp   $78                                      ;; 04:5CB5 $FE $78
    jr   c, .nearVerticalEdgeEnd                  ;; 04:5CB7 $38 $07

    ld   [hl], $01                                ;; 04:5CB9 $36 $01

.turnedAroundAtVerticalEdge
    call GetEntityTransitionCountdown             ;; 04:5CBB $CD $05 $0C
    ld   [hl], $20                                ;; 04:5CBE $36 $20

.nearVerticalEdgeEnd
    ld   hl, wEntitiesPrivateState2Table          ;; 04:5CC0 $21 $C0 $C2
    add  hl, bc                                   ;; 04:5CC3 $09
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:5CC4 $F0 $EC
    cp   $28                                      ;; 04:5CC6 $FE $28
    jr   nc, .nearTopEdgeEnd                      ;; 04:5CC8 $30 $04

    ld   [hl], $00                                ;; 04:5CCA $36 $00
    jr   .turnedAroundAtHorizontalEdge            ;; 04:5CCC $18 $06

.nearTopEdgeEnd
    cp   $60                                      ;; 04:5CCE $FE $60
    jr   c, .nearHorizontalEdgeEnd                ;; 04:5CD0 $38 $07

    ld   [hl], $01                                ;; 04:5CD2 $36 $01

.turnedAroundAtHorizontalEdge
    call GetEntityPrivateCountdown1               ;; 04:5CD4 $CD $00 $0C
    ld   [hl], $20                                ;; 04:5CD7 $36 $20

.nearHorizontalEdgeEnd
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5CD9 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5CDC $09
    ld   e, [hl]                                  ;; 04:5CDD $5E
    ld   d, b                                     ;; 04:5CDE $50
    ld   hl, GhiniTargetXSpeeds                   ;; 04:5CDF $21 $04 $5C
    add  hl, de                                   ;; 04:5CE2 $19
    ld   a, [hl]                                  ;; 04:5CE3 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:5CE4 $21 $40 $C2
    add  hl, bc                                   ;; 04:5CE7 $09
    sub  [hl]                                     ;; 04:5CE8 $96
    and  $80                                      ;; 04:5CE9 $E6 $80
    jr   nz, .decSpeedX                           ;; 04:5CEB $20 $02

    inc  [hl]                                     ;; 04:5CED $34
    inc  [hl]                                     ;; 04:5CEE $34

.decSpeedX
    dec  [hl]                                     ;; 04:5CEF $35
    ld   hl, wEntitiesPrivateState2Table          ;; 04:5CF0 $21 $C0 $C2
    add  hl, bc                                   ;; 04:5CF3 $09
    ld   e, [hl]                                  ;; 04:5CF4 $5E
    ld   d, b                                     ;; 04:5CF5 $50
    ld   hl, GhiniTargetYSpeeds                   ;; 04:5CF6 $21 $06 $5C
    add  hl, de                                   ;; 04:5CF9 $19
    ld   a, [hl]                                  ;; 04:5CFA $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:5CFB $21 $50 $C2
    add  hl, bc                                   ;; 04:5CFE $09
    sub  [hl]                                     ;; 04:5CFF $96
    and  $80                                      ;; 04:5D00 $E6 $80
    jr   nz, .decSpeedY                           ;; 04:5D02 $20 $02

    inc  [hl]                                     ;; 04:5D04 $34
    inc  [hl]                                     ;; 04:5D05 $34

.decSpeedY
    dec  [hl]                                     ;; 04:5D06 $35

.return
    ret                                           ;; 04:5D07 $C9

GhiniCorrectZPosition::
    ldh  a, [hFrameCounter]                       ;; 04:5D08 $F0 $E7
    and  $03                                      ;; 04:5D0A $E6 $03
    jr   nz, .return                              ;; 04:5D0C $20 $17

    ld   hl, wEntitiesPosZTable                   ;; 04:5D0E $21 $10 $C3
    add  hl, bc                                   ;; 04:5D11 $09
    ld   a, [hl]                                  ;; 04:5D12 $7E
    cp   $10                                      ;; 04:5D13 $FE $10
    jr   z, .return                               ;; 04:5D15 $28 $0E

    bit  7, a                                     ;; 04:5D17 $CB $7F
    jr   z, .positive                             ;; 04:5D19 $28 $03

    inc  [hl]                                     ;; 04:5D1B $34
    jr   .return                                  ;; 04:5D1C $18 $07

.positive
    cp   $10                                      ;; 04:5D1E $FE $10
    jr   nc, .moveDown                            ;; 04:5D20 $30 $02

    inc  [hl]                                     ;; 04:5D22 $34
    ret                                           ;; 04:5D23 $C9

.moveDown
    dec  [hl]                                     ;; 04:5D24 $35

.return:
    ret                                           ;; 04:5D25 $C9

GiantGhiniSpriteRectVariants::
.variant0
    db   $F8, $F8, $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $00, $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $08, $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $10, $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $F8, $64, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $00, $66, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $08, $68, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $10, $6A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db   $F8, $F8, $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $00, $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $08, $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $10, $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $F8, $64, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $00, $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $08, $6E, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $08, $10, $6A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant0_flipped
    db   $F8, $F8, $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $00, $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $08, $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $10, $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $F8, $6A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $00, $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $08, $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $10, $64, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1_flipped
    db   $F8, $F8, $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $00, $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $F8, $08, $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $10, $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $F8, $6A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $00, $6E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $08, $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $10, $64, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

RenderGiantGhini::
    call GhiniUpdateFlipAttribute                 ;; 04:5DA6 $CD $90 $7F
    ldh  a, [hActiveEntityFlipAttribute]          ;; 04:5DA9 $F0 $ED
    push af                                       ;; 04:5DAB $F5
    rla                                           ;; 04:5DAC $17
    and  $40                                      ;; 04:5DAD $E6 $40
    ldh  [hMultiPurpose0], a                      ;; 04:5DAF $E0 $D7
    pop  af                                       ;; 04:5DB1 $F1
    and  OAMF_BANK1 | OAMF_PALMASK                ;; 04:5DB2 $E6 $0F
    ldh  [hActiveEntityFlipAttribute], a          ;; 04:5DB4 $E0 $ED
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:5DB6 $21 $B0 $C3
    add  hl, bc                                   ;; 04:5DB9 $09
    ld   a, [hl]                                  ;; 04:5DBA $7E
    rla                                           ;; 04:5DBB $17
    rla                                           ;; 04:5DBC $17
    rla                                           ;; 04:5DBD $17
    rla                                           ;; 04:5DBE $17
    rla                                           ;; 04:5DBF $17
    and  $E0                                      ;; 04:5DC0 $E6 $E0
    ld   hl, hMultiPurpose0                       ;; 04:5DC2 $21 $D7 $FF
    add  [hl]                                     ;; 04:5DC5 $86
    ld   e, a                                     ;; 04:5DC6 $5F
    ld   d, b                                     ;; 04:5DC7 $50
    ld   hl, GiantGhiniSpriteRectVariants         ;; 04:5DC8 $21 $26 $5D
    add  hl, de                                   ;; 04:5DCB $19
    ld   c, $08                                   ;; 04:5DCC $0E $08
    jp   RenderActiveEntitySpritesRect            ;; 04:5DCE $C3 $E6 $3C
