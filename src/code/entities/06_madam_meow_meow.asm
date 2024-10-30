; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MadamMeowMeowSpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $62, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

MadamMeowMeowEntityHandler::
    call GetEntityTransitionCountdown             ;; 06:5B76 $CD $05 $0C
    cp   $01                                      ;; 06:5B79 $FE $01
    jr   nz, .jr_5B83                             ;; 06:5B7B $20 $06

    ld   [hl], b                                  ;; 06:5B7D $70
    ld   a, $FF                                   ;; 06:5B7E $3E $FF
    ld   [wAddHealthBuffer], a                    ;; 06:5B80 $EA $93 $DB

.jr_5B83
    ldh  a, [hFrameCounter]                       ;; 06:5B83 $F0 $E7
    and  $1F                                      ;; 06:5B85 $E6 $1F
    jr   nz, .jr_5B91                             ;; 06:5B87 $20 $08

    call GetEntityDirectionToLink_06              ;; 06:5B89 $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:5B8C $21 $80 $C3
    add  hl, bc                                   ;; 06:5B8F $09
    ld   [hl], e                                  ;; 06:5B90 $73

.jr_5B91
    call SetEntityVariantForDirection_06          ;; 06:5B91 $CD $41 $64
    ld   de, MadamMeowMeowSpriteVariants          ;; 06:5B94 $11 $56 $5B
    call RenderActiveEntitySpritesPair            ;; 06:5B97 $CD $C0 $3B
    ld   a, [wIsBowWowFollowingLink]              ;; 06:5B9A $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 06:5B9D $FE $80
    jr   nz, jr_006_5BC4                          ;; 06:5B9F $20 $23

    call AddEntityZSpeedToPos_06                  ;; 06:5BA1 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5BA4 $21 $20 $C3
    add  hl, bc                                   ;; 06:5BA7 $09
    dec  [hl]                                     ;; 06:5BA8 $35
    dec  [hl]                                     ;; 06:5BA9 $35
    ld   hl, wEntitiesPosZTable                   ;; 06:5BAA $21 $10 $C3
    add  hl, bc                                   ;; 06:5BAD $09
    ld   a, [hl]                                  ;; 06:5BAE $7E
    and  a                                        ;; 06:5BAF $A7
    jr   z, .jr_5BB6                              ;; 06:5BB0 $28 $04

    and  $80                                      ;; 06:5BB2 $E6 $80
    jr   z, jr_006_5BC4                           ;; 06:5BB4 $28 $0E

.jr_5BB6
    ld   [hl], b                                  ;; 06:5BB6 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5BB7 $21 $20 $C3
    add  hl, bc                                   ;; 06:5BBA $09
    ld   [hl], b                                  ;; 06:5BBB $70
    ldh  a, [hFrameCounter]                       ;; 06:5BBC $F0 $E7
    and  $3F                                      ;; 06:5BBE $E6 $3F
    jr   nz, jr_006_5BC4                          ;; 06:5BC0 $20 $02

    ld   [hl], $10                                ;; 06:5BC2 $36 $10

jr_006_5BC4:
    call ReturnIfNonInteractive_06                ;; 06:5BC4 $CD $C6 $64
    ldh  a, [hActiveEntityPosY]                   ;; 06:5BC7 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 06:5BC9 $E0 $EC
    call PushLinkOutOfEntity_06                   ;; 06:5BCB $CD $1A $64
    call CopyEntityPositionToActivePosition       ;; 06:5BCE $CD $8A $3D
    call CheckLinkInteractionWithEntity_06        ;; 06:5BD1 $CD $5D $64
    ret  nc                                       ;; 06:5BD4 $D0

    ld_dialog_low e, Dialog130 ; "My BowWow is so proud" ;; 06:5BD5 $1E $30
    ld   a, [wHasInstrument2]                     ;; 06:5BD7 $FA $66 $DB
    and  $02                                      ;; 06:5BDA $E6 $02
    jr   z, .jr_5BF2                              ;; 06:5BDC $28 $14

    ld   a, [wIsBowWowFollowingLink]              ;; 06:5BDE $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 06:5BE1 $FE $01
    jr   nz, .jr_5BF2                             ;; 06:5BE3 $20 $0D

    ; set status to BOW_WOW_AT_HOME
    xor  a                                        ;; 06:5BE5 $AF
    ld   [wIsBowWowFollowingLink], a              ;; 06:5BE6 $EA $56 $DB
    call GetEntityTransitionCountdown             ;; 06:5BE9 $CD $05 $0C
    ld   [hl], $10                                ;; 06:5BEC $36 $10
    ld_dialog_low e, Dialog12F ; "SMOOOOOOCH!"    ;; 06:5BEE $1E $2F
    jr   .loadDialogIndex                         ;; 06:5BF0 $18 $0E

.jr_5BF2
    ld   a, [wIsBowWowFollowingLink]              ;; 06:5BF2 $FA $56 $DB
    ; check for bow_wow is at home
    and  a                                        ;; 06:5BF5 $A7
    jr   z, .loadDialogIndex                      ;; 06:5BF6 $28 $08

    ; bow_wow is following link
    ld_dialog_low e, Dialog131 ; "My BowWow was kidnapped!" ;; 06:5BF8 $1E $31
    cp   BOW_WOW_FOLLOWING                        ;; 06:5BFA $FE $01
    jr   nz, .loadDialogIndex                     ;; 06:5BFC $20 $02

    ; bow_wow has been kidnapped
    ld_dialog_low e, Dialog132 ; "Oh thank you!"  ;; 06:5BFE $1E $32

.loadDialogIndex
    ld   a, e                                     ;; 06:5C00 $7B
    jp   label_006_5C04                           ;; 06:5C01 $C3 $04 $5C

label_006_5C04:
    ld   a, e                                     ;; 06:5C04 $7B
    call OpenDialogInTable1                       ;; 06:5C05 $CD $73 $23
    ld   hl, wDialogState                         ;; 06:5C08 $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:5C0B $CB $FE
    ret                                           ;; 06:5C0D $C9
