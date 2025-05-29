; Entity handler for both the Masked Mimic and Goriya
MaskedMimicGoriyaSpriteVariants::
.variant0
    db $6A, $22
    db $68, $22
.variant1
    db $6E, $22
    db $6C, $22
.variant2
    db $68, $02
    db $6A, $02
.variant3
    db $6C, $02
    db $6E, $02
.variant4
    db $64, $02
    db $66, $02
.variant5
    db $66, $22
    db $64, $22
.variant6
    db $60, $02
    db $62, $02
.variant7
    db $62, $22
    db $60, $22

Data_019_47B6::
    db   $00, $F4, $0C

Data_019_47B9::
    db   $00, $0C, $F4

MaskedMimicGoriyaEntityHandler::
    ldh  a, [hMapId]                              ;; 19:47BC $F0 $F7
    cp   MAP_CAVE_WATER                           ;; 19:47BE $FE $1F
    jp   z, GoriyaEntityHandler                   ;; 19:47C0 $CA $E4 $45

    ld   de, MaskedMimicGoriyaSpriteVariants      ;; 19:47C3 $11 $96 $47
    call RenderActiveEntitySpritesPair            ;; 19:47C6 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:47C9 $CD $3D $7D
    call ApplyRecoilIfNeeded_19                   ;; 19:47CC $CD $6E $7D
    ld   hl, wEntitiesOptions1Table               ;; 19:47CF $21 $30 $C4
    add  hl, bc                                   ;; 19:47D2 $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_SPLASH_IN_WATER ;; 19:47D3 $36 $48
    call func_019_7E3A                            ;; 19:47D5 $CD $3A $7E
    ld   hl, wEntitiesDirectionTable              ;; 19:47D8 $21 $80 $C3
    add  hl, bc                                   ;; 19:47DB $09
    ld   a, [hl]                                  ;; 19:47DC $7E
    xor  $01                                      ;; 19:47DD $EE $01
    cp   e                                        ;; 19:47DF $BB
    jr   nz, .jr_47E8                             ;; 19:47E0 $20 $06

    ld   hl, wEntitiesOptions1Table               ;; 19:47E2 $21 $30 $C4
    add  hl, bc                                   ;; 19:47E5 $09
    ld   [hl], ENTITY_OPT1_SPLASH_IN_WATER        ;; 19:47E6 $36 $08

.jr_47E8
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 19:47E8 $CD $39 $3B
    ld   a, [wCollisionType]                      ;; 19:47EB $FA $33 $C1
    and  a                                        ;; 19:47EE $A7
    ret  nz                                       ;; 19:47EF $C0

    ldh  a, [hPressedButtonsMask]                 ;; 19:47F0 $F0 $CB
    and  $0F                                      ;; 19:47F2 $E6 $0F
    ret  z                                        ;; 19:47F4 $C8

    and  $03                                      ;; 19:47F5 $E6 $03
    ld   e, a                                     ;; 19:47F7 $5F
    ld   d, b                                     ;; 19:47F8 $50
    ld   hl, Data_019_47B6                        ;; 19:47F9 $21 $B6 $47
    add  hl, de                                   ;; 19:47FC $19
    ld   a, [hl]                                  ;; 19:47FD $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:47FE $21 $40 $C2
    add  hl, bc                                   ;; 19:4801 $09
    ld   [hl], a                                  ;; 19:4802 $77
    ldh  a, [hPressedButtonsMask]                 ;; 19:4803 $F0 $CB
    rra                                           ;; 19:4805 $1F
    rra                                           ;; 19:4806 $1F
    and  $03                                      ;; 19:4807 $E6 $03
    ld   e, a                                     ;; 19:4809 $5F
    ld   d, b                                     ;; 19:480A $50
    ld   hl, Data_019_47B9                        ;; 19:480B $21 $B9 $47
    add  hl, de                                   ;; 19:480E $19
    ld   a, [hl]                                  ;; 19:480F $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:4810 $21 $50 $C2
    add  hl, bc                                   ;; 19:4813 $09
    ld   [hl], a                                  ;; 19:4814 $77
    call UpdateEntityPosWithSpeed_19              ;; 19:4815 $CD $B8 $7D
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:4818 $CD $23 $3B
    ldh  a, [hLinkDirection]                      ;; 19:481B $F0 $9E
    xor  $01                                      ;; 19:481D $EE $01
    ld   hl, wEntitiesDirectionTable              ;; 19:481F $21 $80 $C3
    add  hl, bc                                   ;; 19:4822 $09
    ld   [hl], a                                  ;; 19:4823 $77
    rla                                           ;; 19:4824 $17
    and  $06                                      ;; 19:4825 $E6 $06
    ld   e, a                                     ;; 19:4827 $5F
    ld   hl, wEntitiesInertiaTable                ;; 19:4828 $21 $D0 $C3
    add  hl, bc                                   ;; 19:482B $09
    inc  [hl]                                     ;; 19:482C $34
    ld   a, [hl]                                  ;; 19:482D $7E
    rra                                           ;; 19:482E $1F
    rra                                           ;; 19:482F $1F
    rra                                           ;; 19:4830 $1F
    rra                                           ;; 19:4831 $1F
    and  $01                                      ;; 19:4832 $E6 $01
    or   e                                        ;; 19:4834 $B3
    jp   SetEntitySpriteVariant                   ;; 19:4835 $C3 $0C $3B
