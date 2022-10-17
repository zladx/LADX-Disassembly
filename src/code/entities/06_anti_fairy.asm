; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
AntiFairySpriteVariants::
.variant1
    db   $5A, OAM_GBC_PAL_0
    db   $5A, OAM_GBC_PAL_0 | OAMF_XFLIP
.variant2
    db   $5A, OAM_GBC_PAL_4 | OAMF_PAL1
    db   $5A, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP

AntiFairyEntityHandler::
    ld   de, AntiFairySpriteVariants              ; $7876: $11 $6E $78
    call RenderActiveEntitySpritesPair            ; $7879: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $787C: $CD $C6 $64

.jr_787F
    call ApplyRecoilIfNeeded_06                   ; $787F: $CD $F7 $64
    call label_3B39                               ; $7882: $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ; $7885: $CD $41 $65
    call label_3B23                               ; $7888: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $788B: $21 $A0 $C2
    add  hl, bc                                   ; $788E: $09
    ld   a, [hl]                                  ; $788F: $7E
    and  $03                                      ; $7890: $E6 $03
    jr   nz, .jr_789B                             ; $7892: $20 $07

    ld   a, [hl]                                  ; $7894: $7E
    and  $0C                                      ; $7895: $E6 $0C
    jr   nz, jr_006_78A5                          ; $7897: $20 $0C

    jr   jr_006_78AD                              ; $7899: $18 $12

.jr_789B
    ld   hl, wEntitiesSpeedXTable                 ; $789B: $21 $40 $C2
    add  hl, bc                                   ; $789E: $09
    ld   a, [hl]                                  ; $789F: $7E
    cpl                                           ; $78A0: $2F
    inc  a                                        ; $78A1: $3C
    ld   [hl], a                                  ; $78A2: $77
    jr   jr_006_78AD                              ; $78A3: $18 $08

jr_006_78A5:
    ld   hl, wEntitiesSpeedYTable                 ; $78A5: $21 $50 $C2
    add  hl, bc                                   ; $78A8: $09
    ld   a, [hl]                                  ; $78A9: $7E
    cpl                                           ; $78AA: $2F
    inc  a                                        ; $78AB: $3C
    ld   [hl], a                                  ; $78AC: $77

jr_006_78AD:
    ldh  a, [hFrameCounter]                       ; $78AD: $F0 $E7
    rra                                           ; $78AF: $1F
    rra                                           ; $78B0: $1F
    rra                                           ; $78B1: $1F
    and  $01                                      ; $78B2: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78B4: $C3 $0C $3B
