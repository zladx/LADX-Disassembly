
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MimicSpriteVariants::
.variant0
    db $60, $01
    db $62, $01
.variant1
    db $62, $21
    db $60, $21
.variant2
    db $64, $01
    db $66, $01
.variant3
    db $66, $21
    db $64, $21
.variant4
    db $68, $01
    db $6A, $01
.variant5
    db $6C, $01
    db $6E, $01
.variant6
    db $6A, $21
    db $68, $21
.variant7
    db $6E, $21
    db $6C; $21 from next line

Data_019_6AAC::
    db   $21, $F0, $10

; This entity is used for both:
; - Arm-Mimic
; - Eagle's Tower opening animation
MimicEntityHandler::
    ; If entity private state 2 != 0, this is actually
    ; a door opening animation.
    ld   hl, wEntitiesPrivateState2Table          ;; 19:6AAF $21 $C0 $C2
    add  hl, bc                                   ;; 19:6AB2 $09
    ld   a, [hl]                                  ;; 19:6AB3 $7E
    and  a                                        ;; 19:6AB4 $A7
    jp   nz, AnimateDungeonDoorOpening            ;; 19:6AB5 $C2 $41 $68

    ldh  a, [hMapId]                              ;; 19:6AB8 $F0 $F7
    cp   MAP_CAVE_B                               ;; 19:6ABA $FE $0A
    jr   nz, jr_019_6ACE                          ;; 19:6ABC $20 $10

    ldh  a, [hMapRoom]                            ;; 19:6ABE $F0 $F6
    cp   ROOM_INDOOR_B_UNDER_MERMAID_STATUE       ;; 19:6AC0 $FE $97
    jr   z, .jr_6AC8                              ;; 19:6AC2 $28 $04

    cp   ROOM_INDOOR_B_MAGNIFYING_GLASS           ;; 19:6AC4 $FE $98
    jr   nz, jr_019_6ACE                          ;; 19:6AC6 $20 $06

.jr_6AC8
    ld   a, [wExchangingTradeSequenceItem]        ;; 19:6AC8 $FA $7F $DB
    and  a                                        ;; 19:6ACB $A7
    jr   nz, jr_019_6AD4                          ;; 19:6ACC $20 $06

jr_019_6ACE:
    ld   de, MimicSpriteVariants                  ;; 19:6ACE $11 $8D $6A
    call RenderActiveEntitySpritesPair            ;; 19:6AD1 $CD $C0 $3B

jr_019_6AD4:
    call ReturnIfNonInteractive_19                ;; 19:6AD4 $CD $3D $7D
    call ApplyRecoilIfNeeded_19                   ;; 19:6AD7 $CD $6E $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 19:6ADA $CD $39 $3B
    call UpdateEntityPosWithSpeed_19              ;; 19:6ADD $CD $B8 $7D
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:6AE0 $CD $23 $3B
    ld   a, [wCollisionType]                      ;; 19:6AE3 $FA $33 $C1
    and  a                                        ;; 19:6AE6 $A7
    jr   nz, jr_019_6B41                          ;; 19:6AE7 $20 $58

    ldh  a, [hPressedButtonsMask]                 ;; 19:6AE9 $F0 $CB
    and  $03                                      ;; 19:6AEB $E6 $03
    jr   z, .jr_6B11                              ;; 19:6AED $28 $22

    ld   e, a                                     ;; 19:6AEF $5F
    ld   d, b                                     ;; 19:6AF0 $50
    ld   hl, Data_019_6AAC                        ;; 19:6AF1 $21 $AC $6A
    add  hl, de                                   ;; 19:6AF4 $19
    ld   a, [hl]                                  ;; 19:6AF5 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6AF6 $21 $40 $C2
    add  hl, bc                                   ;; 19:6AF9 $09
    ld   [hl], a                                  ;; 19:6AFA $77
    ld   hl, wEntitiesSpeedYTable                 ;; 19:6AFB $21 $50 $C2
    add  hl, bc                                   ;; 19:6AFE $09
    ld   [hl], b                                  ;; 19:6AFF $70
    ld   a, e                                     ;; 19:6B00 $7B
    and  $02                                      ;; 19:6B01 $E6 $02
    add  $04                                      ;; 19:6B03 $C6 $04
    ld   e, a                                     ;; 19:6B05 $5F
    ldh  a, [hFrameCounter]                       ;; 19:6B06 $F0 $E7
    rra                                           ;; 19:6B08 $1F
    rra                                           ;; 19:6B09 $1F
    rra                                           ;; 19:6B0A $1F
    and  $01                                      ;; 19:6B0B $E6 $01
    add  e                                        ;; 19:6B0D $83
    jp   SetEntitySpriteVariant                   ;; 19:6B0E $C3 $0C $3B

.jr_6B11
    ldh  a, [hPressedButtonsMask]                 ;; 19:6B11 $F0 $CB
    and  $0F                                      ;; 19:6B13 $E6 $0F
    jr   z, jr_019_6B41                           ;; 19:6B15 $28 $2A

    rra                                           ;; 19:6B17 $1F
    rra                                           ;; 19:6B18 $1F
    cpl                                           ;; 19:6B19 $2F
    and  $03                                      ;; 19:6B1A $E6 $03
    ld   e, a                                     ;; 19:6B1C $5F
    ld   d, b                                     ;; 19:6B1D $50
    ld   hl, Data_019_6AAC                        ;; 19:6B1E $21 $AC $6A
    add  hl, de                                   ;; 19:6B21 $19
    ld   a, [hl]                                  ;; 19:6B22 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:6B23 $21 $50 $C2
    add  hl, bc                                   ;; 19:6B26 $09
    ld   [hl], a                                  ;; 19:6B27 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6B28 $21 $40 $C2
    add  hl, bc                                   ;; 19:6B2B $09
    ld   [hl], b                                  ;; 19:6B2C $70
    ld   a, e                                     ;; 19:6B2D $7B
    dec  a                                        ;; 19:6B2E $3D
    xor  $01                                      ;; 19:6B2F $EE $01
    sra  a                                        ;; 19:6B31 $CB $2F
    rla                                           ;; 19:6B33 $17
    rla                                           ;; 19:6B34 $17
    ld   e, a                                     ;; 19:6B35 $5F
    ldh  a, [hFrameCounter]                       ;; 19:6B36 $F0 $E7
    rra                                           ;; 19:6B38 $1F
    rra                                           ;; 19:6B39 $1F
    rra                                           ;; 19:6B3A $1F
    and  $01                                      ;; 19:6B3B $E6 $01
    add  e                                        ;; 19:6B3D $83
    jp   SetEntitySpriteVariant                   ;; 19:6B3E $C3 $0C $3B

jr_019_6B41:
    jp   ClearEntitySpeed                         ;; 19:6B41 $C3 $7F $3D
