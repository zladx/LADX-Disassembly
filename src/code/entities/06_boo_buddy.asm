; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BooBuddySpriteVariants::
.variant0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0

BooBuddyEntityHandler::
    ld   de, BooBuddySpriteVariants               ;; 06:79A9 $11 $89 $79
    call RenderActiveEntitySpritesPair            ;; 06:79AC $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:79AF $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:79B2 $CD $F7 $64
    call UpdateEntityPosWithSpeed_06              ;; 06:79B5 $CD $41 $65
    call func_006_5E54                            ;; 06:79B8 $CD $54 $5E
    ldh  a, [hActiveEntityState]                  ;; 06:79BB $F0 $F0
    JP_TABLE                                      ;; 06:79BD
._00 dw BooBuddyState0Handler
._01 dw BooBuddyState1Handler

BooBuddyState0Handler::
    ld   a, [wC1A2]                               ;; 06:79C2 $FA $A2 $C1
    and  a                                        ;; 06:79C5 $A7
    jp   nz, label_006_7A38                       ;; 06:79C6 $C2 $38 $7A

    call GetEntityTransitionCountdown             ;; 06:79C9 $CD $05 $0C
    jr   nz, jr_006_7A11                          ;; 06:79CC $20 $43

    call GetEntityPrivateCountdown1               ;; 06:79CE $CD $00 $0C
    jr   nz, jr_006_7A21                          ;; 06:79D1 $20 $4E
    ; if in swing middle animation state jump to jr_006_79FA
    ld   a, [wSwordAnimationState]                ;; 06:79D3 $FA $37 $C1
    cp   SWORD_ANIMATION_STATE_SWING_MIDDLE       ;; 06:79D6 $FE $03
    jr   z, jr_006_79FA                           ;; 06:79D8 $28 $20

    call GetRandomByte                            ;; 06:79DA $CD $0D $28
    xor  c                                        ;; 06:79DD $A9
    and  $07                                      ;; 06:79DE $E6 $07
    add  $06                                      ;; 06:79E0 $C6 $06
    call GetVectorTowardsLink_trampoline          ;; 06:79E2 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:79E5 $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ;; 06:79E7 $21 $50 $C2
    call func_006_7A79                            ;; 06:79EA $CD $79 $7A
    ldh  a, [hMultiPurpose1]                      ;; 06:79ED $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 06:79EF $21 $40 $C2

.jr_79F2
    call func_006_7A79                            ;; 06:79F2 $CD $79 $7A
    call label_3B44                               ;; 06:79F5 $CD $44 $3B
    jr   jr_006_7A27                              ;; 06:79F8 $18 $2D

jr_006_79FA:
    call GetEntityXDistanceToLink_06              ;; 06:79FA $CD $94 $65
    add  $24                                      ;; 06:79FD $C6 $24
    cp   $48                                      ;; 06:79FF $FE $48
    jr   nc, jr_006_7A27                          ;; 06:7A01 $30 $24

    call GetEntityYDistanceToLink_06              ;; 06:7A03 $CD $A4 $65
    add  $24                                      ;; 06:7A06 $C6 $24

.jr_7A08
    cp   $48                                      ;; 06:7A08 $FE $48
    jr   nc, jr_006_7A27                          ;; 06:7A0A $30 $1B

    call GetEntityTransitionCountdown             ;; 06:7A0C $CD $05 $0C
    ld   [hl], $20                                ;; 06:7A0F $36 $20

jr_006_7A11:
    call ClearEntitySpeed                         ;; 06:7A11 $CD $7F $3D
    call func_006_7AB0                            ;; 06:7A14 $CD $B0 $7A
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7A17 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7A1A $09
    ld   a, [hl]                                  ;; 06:7A1B $7E
    and  a                                        ;; 06:7A1C $A7
    ret  z                                        ;; 06:7A1D $C8

    call func_006_7A8C                            ;; 06:7A1E $CD $8C $7A

jr_006_7A21:
    call ClearEntitySpeed                         ;; 06:7A21 $CD $7F $3D
    jp   func_006_7AB0                            ;; 06:7A24 $C3 $B0 $7A

jr_006_7A27:
    call GetEntityXDistanceToLink_06              ;; 06:7A27 $CD $94 $65
    sla  e                                        ;; 06:7A2A $CB $23
    ldh  a, [hFrameCounter]                       ;; 06:7A2C $F0 $E7
    rra                                           ;; 06:7A2E $1F
    rra                                           ;; 06:7A2F $1F
    rra                                           ;; 06:7A30 $1F
    rra                                           ;; 06:7A31 $1F
    and  $01                                      ;; 06:7A32 $E6 $01
    add  e                                        ;; 06:7A34 $83
    jp   SetEntitySpriteVariant                   ;; 06:7A35 $C3 $0C $3B

label_006_7A38:
    call IncrementEntityState                     ;; 06:7A38 $CD $12 $3B
    ld   [hl], $01                                ;; 06:7A3B $36 $01
    ret                                           ;; 06:7A3D $C9

BooBuddyState1Handler::
    ld   a, [wC1A2]                               ;; 06:7A3E $FA $A2 $C1
    and  a                                        ;; 06:7A41 $A7
    jr   z, .jr_7A74                              ;; 06:7A42 $28 $30

    ld   hl, wEntitiesHealthTable                 ;; 06:7A44 $21 $60 $C3
    add  hl, bc                                   ;; 06:7A47 $09
    ld   [hl], $01                                ;; 06:7A48 $36 $01
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:7A4A $CD $39 $3B
    ld   a, $04                                   ;; 06:7A4D $3E $04
    call GetVectorTowardsLink_trampoline          ;; 06:7A4F $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:7A52 $F0 $D7
    cpl                                           ;; 06:7A54 $2F
    inc  a                                        ;; 06:7A55 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 06:7A56 $21 $50 $C2
    add  hl, bc                                   ;; 06:7A59 $09
    ld   [hl], a                                  ;; 06:7A5A $77
    ldh  a, [hMultiPurpose1]                      ;; 06:7A5B $F0 $D8
    cpl                                           ;; 06:7A5D $2F
    inc  a                                        ;; 06:7A5E $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7A5F $21 $40 $C2
    add  hl, bc                                   ;; 06:7A62 $09
    ld   [hl], a                                  ;; 06:7A63 $77
    ldh  a, [hFrameCounter]                       ;; 06:7A64 $F0 $E7
    rra                                           ;; 06:7A66 $1F
    rra                                           ;; 06:7A67 $1F
    rra                                           ;; 06:7A68 $1F
    rra                                           ;; 06:7A69 $1F
    and  $01                                      ;; 06:7A6A $E6 $01
    add  $04                                      ;; 06:7A6C $C6 $04
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:7A6E $21 $B0 $C3
    add  hl, bc                                   ;; 06:7A71 $09
    ld   [hl], a                                  ;; 06:7A72 $77
    ret                                           ;; 06:7A73 $C9

.jr_7A74
    call IncrementEntityState                     ;; 06:7A74 $CD $12 $3B
    ld   [hl], b                                  ;; 06:7A77 $70
    ret                                           ;; 06:7A78 $C9

func_006_7A79::
    add  hl, bc                                   ;; 06:7A79 $09
    sub  [hl]                                     ;; 06:7A7A $96
    jr   z, ret_006_7A8B                          ;; 06:7A7B $28 $0E

    bit  7, a                                     ;; 06:7A7D $CB $7F
    jr   z, .jr_7A87                              ;; 06:7A7F $28 $06

    dec  [hl]                                     ;; 06:7A81 $35
    dec  [hl]                                     ;; 06:7A82 $35
    dec  [hl]                                     ;; 06:7A83 $35
    dec  [hl]                                     ;; 06:7A84 $35
    jr   ret_006_7A8B                             ;; 06:7A85 $18 $04

.jr_7A87
    inc  [hl]                                     ;; 06:7A87 $34
    inc  [hl]                                     ;; 06:7A88 $34
    inc  [hl]                                     ;; 06:7A89 $34
    inc  [hl]                                     ;; 06:7A8A $34

ret_006_7A8B:
    ret                                           ;; 06:7A8B $C9

func_006_7A8C::
    call GetEntityPrivateCountdown1               ;; 06:7A8C $CD $00 $0C
    ld   [hl], $20                                ;; 06:7A8F $36 $20
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7A91 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7A94 $09
    ld   [hl], $00                                ;; 06:7A95 $36 $00
    ld   hl, wEntitiesPosYTable                   ;; 06:7A97 $21 $10 $C2
    add  hl, bc                                   ;; 06:7A9A $09
    ld   a, [hl]                                  ;; 06:7A9B $7E
    sub  $48                                      ;; 06:7A9C $D6 $48
    ld   e, a                                     ;; 06:7A9E $5F
    ld   a, $48                                   ;; 06:7A9F $3E $48
    sub  e                                        ;; 06:7AA1 $93
    ld   [hl], a                                  ;; 06:7AA2 $77
    ld   hl, wEntitiesPosXTable                   ;; 06:7AA3 $21 $00 $C2
    add  hl, bc                                   ;; 06:7AA6 $09
    ld   a, [hl]                                  ;; 06:7AA7 $7E
    sub  $50                                      ;; 06:7AA8 $D6 $50
    ld   e, a                                     ;; 06:7AAA $5F
    ld   a, $50                                   ;; 06:7AAB $3E $50
    sub  e                                        ;; 06:7AAD $93
    ld   [hl], a                                  ;; 06:7AAE $77
    ret                                           ;; 06:7AAF $C9

func_006_7AB0::
    ldh  a, [hFrameCounter]                       ;; 06:7AB0 $F0 $E7
    rra                                           ;; 06:7AB2 $1F
    rra                                           ;; 06:7AB3 $1F
    and  $01                                      ;; 06:7AB4 $E6 $01
    jr   z, jr_006_7AC7                           ;; 06:7AB6 $28 $0F

    call GetEntityXDistanceToLink_06              ;; 06:7AB8 $CD $94 $65
    srl  e                                        ;; 06:7ABB $CB $3B
    jr   c, .jr_7AC3                              ;; 06:7ABD $38 $04

    ld   a, $06                                   ;; 06:7ABF $3E $06
    jr   jr_006_7AC9                              ;; 06:7AC1 $18 $06

.jr_7AC3
    ld   a, $07                                   ;; 06:7AC3 $3E $07
    jr   jr_006_7AC9                              ;; 06:7AC5 $18 $02

jr_006_7AC7:
    ld   a, $FF                                   ;; 06:7AC7 $3E $FF

jr_006_7AC9:
    call SetEntitySpriteVariant                   ;; 06:7AC9 $CD $0C $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 06:7ACC $21 $B0 $C2
    add  hl, bc                                   ;; 06:7ACF $09
    ld   [hl], b                                  ;; 06:7AD0 $70

Data_006_7AD1::  ; this data pointer is used (by mistake?) by the Floating Item entity
    call GetEntityTransitionCountdown             ;; 06:7AD1 $CD $05 $0C
    cp   $01                                      ;; 06:7AD4 $FE $01
    ret  nz                                       ;; 06:7AD6 $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 06:7AD7 $21 $B0 $C2
    add  hl, bc                                   ;; 06:7ADA $09
    inc  [hl]                                     ;; 06:7ADB $34
    ret                                           ;; 06:7ADC $C9
