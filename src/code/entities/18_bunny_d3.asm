; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BunnyD3SpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

BunnyD3EntityHandler::
    ld   a, [wIsMarinInAnimalVillage]             ; $51D8: $FA $74 $DB
    and  a                                        ; $51DB: $A7
    jp   nz, ClearEntityStatusBank18              ; $51DC: $C2 $08 $7F

    ld   de, BunnyD3SpriteVariants                ; $51DF: $11 $B8 $51
    call RenderActiveEntitySpritesPair            ; $51E2: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $51E5: $F0 $E7
    and  $3F                                      ; $51E7: $E6 $3F
    jr   nz, .jr_51F3                             ; $51E9: $20 $08

    call func_018_7EE1                            ; $51EB: $CD $E1 $7E
    ld   hl, wEntitiesDirectionTable              ; $51EE: $21 $80 $C3
    add  hl, bc                                   ; $51F1: $09
    ld   [hl], e                                  ; $51F2: $73

.jr_51F3
    call func_018_7D60                            ; $51F3: $CD $60 $7D
    call ReturnIfNonInteractive_18                ; $51F6: $CD $E8 $7D
    call AddEntityZVelocityToPos_18               ; $51F9: $CD $98 $7E
    ld   hl, wEntitiesVelocityZTable              ; $51FC: $21 $20 $C3
    add  hl, bc                                   ; $51FF: $09
    dec  [hl]                                     ; $5200: $35
    dec  [hl]                                     ; $5201: $35
    ld   hl, wEntitiesPosZTable                   ; $5202: $21 $10 $C3
    add  hl, bc                                   ; $5205: $09
    ld   a, [hl]                                  ; $5206: $7E
    and  a                                        ; $5207: $A7
    jr   z, .jr_520E                              ; $5208: $28 $04

    and  $80                                      ; $520A: $E6 $80
    jr   z, jr_018_521C                           ; $520C: $28 $0E

.jr_520E
    ld   [hl], b                                  ; $520E: $70
    ld   hl, wEntitiesVelocityZTable              ; $520F: $21 $20 $C3
    add  hl, bc                                   ; $5212: $09
    ld   [hl], b                                  ; $5213: $70
    ldh  a, [hFrameCounter]                       ; $5214: $F0 $E7
    and  $1F                                      ; $5216: $E6 $1F
    jr   nz, jr_018_521C                          ; $5218: $20 $02

    ld   [hl], $0C                                ; $521A: $36 $0C

jr_018_521C:
    ldh  a, [hActiveEntityPosY]                   ; $521C: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $521E: $E0 $EC
    call PushLinkOutOfEntity_18                   ; $5220: $CD $36 $7D
    call CopyEntityPositionToActivePosition       ; $5223: $CD $8A $3D
    call func_018_7D95                            ; $5226: $CD $95 $7D
    ret  nc                                       ; $5229: $D0

    ld   e, $00                                   ; $522A: $1E $00
    ld   a, [wIsIndoor]                           ; $522C: $FA $A5 $DB
    and  a                                        ; $522F: $A7
    jr   nz, .jr_523F                             ; $5230: $20 $0D

    inc  e                                        ; $5232: $1C
    ldh  a, [hMapRoom]                            ; $5233: $F0 $F6
    cp   UNKNOWN_ROOM_CC                          ; $5235: $FE $CC
    jr   z, .jr_523F                              ; $5237: $28 $06
    inc  e                                        ; $5239: $1C
    cp   UNKNOWN_ROOM_CD                          ; $523A: $FE $CD
    jr   z, .jr_523F                              ; $523C: $28 $01
    inc  e                                        ; $523E: $1C

.jr_523F
    ld   a, [wHasInstrument6]                     ; $523F: $FA $6A $DB
    and  $02                                      ; $5242: $E6 $02
    jr   z, .jr_524A                              ; $5244: $28 $04

    ld   a, e                                     ; $5246: $7B
    add  $04                                      ; $5247: $C6 $04
    ld   e, a                                     ; $5249: $5F

.jr_524A
    ld   a, [wIsMarinFollowingLink]               ; $524A: $FA $73 $DB
    and  a                                        ; $524D: $A7
    jr   z, .jr_5255                              ; $524E: $28 $05

    jp_open_dialog Dialog252                      ; $5250

.jr_5255
    ld   a, e                                     ; $5255: $7B
    add  $4A ; open Dialog24A, Dialog24B, Dialog24C or Dialog24D ; $5256: $C6 $4A
    jp   OpenDialogInTable2                       ; $5258: $C3 $7C $23
