; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LaserSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
.variant3
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant4
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

Data_004_6C4D::
    db   $10, $0E, $0C, $06

Data_004_6C51::
    db   $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E, $10, $0E, $0C, $06

LaserEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $6C61: $F0 $F0
    and  a                                        ; $6C63: $A7
    jp   nz, label_004_6D0F                       ; $6C64: $C2 $0F $6D

    ld   de, LaserSpriteVariants                  ; $6C67: $11 $2D $6C
    call RenderActiveEntitySpritesPair            ; $6C6A: $CD $C0 $3B
    call ReturnIfNonInteractive_04                ; $6C6D: $CD $A3 $7F
    call label_3B44                               ; $6C70: $CD $44 $3B
    call DefaultEntityPhysics_trampoline          ; $6C73: $CD $23 $3B
    call GetEntityTransitionCountdown             ; $6C76: $CD $05 $0C
    jr   z, jr_004_6CB4                           ; $6C79: $28 $39

    cp   $10                                      ; $6C7B: $FE $10
    jr   nz, .ret_6CB3                            ; $6C7D: $20 $34

    ld   a, ENTITY_LASER_BEAM                     ; $6C7F: $3E $2B
    call SpawnNewEntity_trampoline                ; $6C81: $CD $86 $3B
    jr   c, .ret_6CB3                             ; $6C84: $38 $2D

    ld   a, NOISE_SFX_BEAMOS_LASER                ; $6C86: $3E $08
    ldh  [hNoiseSfx], a                           ; $6C88: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $6C8A: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6C8C: $21 $00 $C2
    add  hl, de                                   ; $6C8F: $19
    ld   [hl], a                                  ; $6C90: $77
    ldh  a, [hMultiPurpose1]                      ; $6C91: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6C93: $21 $10 $C2
    add  hl, de                                   ; $6C96: $19
    ld   [hl], a                                  ; $6C97: $77
    ldh  a, [hMultiPurpose2]                      ; $6C98: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $6C9A: $21 $80 $C3
    add  hl, de                                   ; $6C9D: $19
    ld   [hl], a                                  ; $6C9E: $77
    ld   hl, wEntitiesVelocityXTable              ; $6C9F: $21 $40 $C2
    add  hl, bc                                   ; $6CA2: $09
    ld   a, [hl]                                  ; $6CA3: $7E
    ld   hl, wEntitiesVelocityXTable              ; $6CA4: $21 $40 $C2
    add  hl, de                                   ; $6CA7: $19
    ld   [hl], a                                  ; $6CA8: $77
    ld   hl, wEntitiesVelocityYTable              ; $6CA9: $21 $50 $C2
    add  hl, bc                                   ; $6CAC: $09
    ld   a, [hl]                                  ; $6CAD: $7E
    ld   hl, wEntitiesVelocityYTable              ; $6CAE: $21 $50 $C2
    add  hl, de                                   ; $6CB1: $19
    ld   [hl], a                                  ; $6CB2: $77

.ret_6CB3
    ret                                           ; $6CB3: $C9

jr_004_6CB4:
    ld   hl, wEntitiesInertiaTable                ; $6CB4: $21 $D0 $C3
    add  hl, bc                                   ; $6CB7: $09
    ld   a, [hl]                                  ; $6CB8: $7E
    inc  a                                        ; $6CB9: $3C
    ld   [hl], a                                  ; $6CBA: $77
    and  $07                                      ; $6CBB: $E6 $07
    jr   nz, .ret_6D0E                            ; $6CBD: $20 $4F

    ld   hl, wEntitiesDirectionTable              ; $6CBF: $21 $80 $C3
    add  hl, bc                                   ; $6CC2: $09
    ld   a, [hl]                                  ; $6CC3: $7E
    inc  a                                        ; $6CC4: $3C
    and  $0F                                      ; $6CC5: $E6 $0F
    ld   [hl], a                                  ; $6CC7: $77
    srl  a                                        ; $6CC8: $CB $3F
    ld   hl, wEntitiesSpriteVariantTable          ; $6CCA: $21 $B0 $C3
    add  hl, bc                                   ; $6CCD: $09
    ld   [hl], a                                  ; $6CCE: $77
    ld   a, ENTITY_LASER                          ; $6CCF: $3E $2A
    call SpawnNewEntity_trampoline                ; $6CD1: $CD $86 $3B
    jr   c, .ret_6D0E                             ; $6CD4: $38 $38

    ldh  a, [hMultiPurpose0]                      ; $6CD6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6CD8: $21 $00 $C2
    add  hl, de                                   ; $6CDB: $19
    ld   [hl], a                                  ; $6CDC: $77
    ldh  a, [hMultiPurpose1]                      ; $6CDD: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6CDF: $21 $10 $C2
    add  hl, de                                   ; $6CE2: $19
    ld   [hl], a                                  ; $6CE3: $77
    ld   hl, wEntitiesStateTable                  ; $6CE4: $21 $90 $C2
    add  hl, de                                   ; $6CE7: $19
    ld   [hl], $01                                ; $6CE8: $36 $01
    ld   hl, wEntitiesPrivateState1Table          ; $6CEA: $21 $B0 $C2
    add  hl, de                                   ; $6CED: $19
    ld   [hl], c                                  ; $6CEE: $71
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6CEF: $21 $40 $C3
    add  hl, de                                   ; $6CF2: $19
    ld   [hl], ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6CF3: $36 $C0
    push bc                                       ; $6CF5: $C5
    ldh  a, [hMultiPurpose2]                      ; $6CF6: $F0 $D9
    ld   c, a                                     ; $6CF8: $4F
    ld   hl, Data_004_6C51                        ; $6CF9: $21 $51 $6C
    add  hl, bc                                   ; $6CFC: $09
    ld   a, [hl]                                  ; $6CFD: $7E
    ld   hl, wEntitiesVelocityXTable              ; $6CFE: $21 $40 $C2
    add  hl, de                                   ; $6D01: $19
    ld   [hl], a                                  ; $6D02: $77
    ld   hl, Data_004_6C4D                        ; $6D03: $21 $4D $6C
    add  hl, bc                                   ; $6D06: $09
    ld   a, [hl]                                  ; $6D07: $7E
    ld   hl, wEntitiesVelocityYTable              ; $6D08: $21 $50 $C2
    add  hl, de                                   ; $6D0B: $19
    ld   [hl], a                                  ; $6D0C: $77
    pop  bc                                       ; $6D0D: $C1

.ret_6D0E
    ret                                           ; $6D0E: $C9

label_004_6D0F:
    call label_3B2E                               ; $6D0F: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $6D12: $21 $A0 $C2
    add  hl, bc                                   ; $6D15: $09
    ld   a, [hl]                                  ; $6D16: $7E
    and  a                                        ; $6D17: $A7
    jp   nz, ClearEntityStatusBank04              ; $6D18: $C2 $7A $6D

    ldh  a, [hActiveEntityPosX]                   ; $6D1B: $F0 $EE
    ld   hl, hLinkPositionX                       ; $6D1D: $21 $98 $FF
    sub  [hl]                                     ; $6D20: $96
    add  $10                                      ; $6D21: $C6 $10
    cp   $20                                      ; $6D23: $FE $20
    jr   nc, .jr_6D5C                             ; $6D25: $30 $35

    ldh  a, [hActiveEntityPosY]                   ; $6D27: $F0 $EF
    ld   hl, hLinkPositionY                       ; $6D29: $21 $99 $FF
    sub  [hl]                                     ; $6D2C: $96
    add  $10                                      ; $6D2D: $C6 $10
    cp   $20                                      ; $6D2F: $FE $20
    jr   nc, .jr_6D5C                             ; $6D31: $30 $29

    call ClearEntityStatusBank04                  ; $6D33: $CD $7A $6D
    ld   a, [wInvincibilityCounter]               ; $6D36: $FA $C7 $DB
    and  a                                        ; $6D39: $A7
    jr   nz, .jr_6D5C                             ; $6D3A: $20 $20

    ld   hl, wEntitiesPrivateState1Table          ; $6D3C: $21 $B0 $C2
    add  hl, bc                                   ; $6D3F: $09
    ld   e, [hl]                                  ; $6D40: $5E
    ld   d, b                                     ; $6D41: $50
    ld   hl, wEntitiesTransitionCountdownTable    ; $6D42: $21 $E0 $C2
    add  hl, de                                   ; $6D45: $19
    ld   a, [hl]                                  ; $6D46: $7E
    and  a                                        ; $6D47: $A7
    jr   nz, .jr_6D5C                             ; $6D48: $20 $12

    ld   [hl], $20                                ; $6D4A: $36 $20
    ld   hl, wEntitiesFlashCountdownTable         ; $6D4C: $21 $20 $C4
    add  hl, de                                   ; $6D4F: $19
    ld   [hl], $10                                ; $6D50: $36 $10
    push bc                                       ; $6D52: $C5
    ld   c, e                                     ; $6D53: $4B
    ld   b, d                                     ; $6D54: $42
    ld   a, $40                                   ; $6D55: $3E $40
    call ApplyVectorTowardsLink_trampoline        ; $6D57: $CD $AA $3B
    pop  bc                                       ; $6D5A: $C1
    ret                                           ; $6D5B: $C9

.jr_6D5C
    ld   hl, wEntitiesVelocityXTable              ; $6D5C: $21 $40 $C2
    add  hl, bc                                   ; $6D5F: $09
    ld   a, [hl]                                  ; $6D60: $7E
    ld   hl, wEntitiesPosXTable                   ; $6D61: $21 $00 $C2
    add  hl, bc                                   ; $6D64: $09
    add  [hl]                                     ; $6D65: $86
    ld   [hl], a                                  ; $6D66: $77
    cp   $9C                                      ; $6D67: $FE $9C
    jp   nc, ClearEntityStatusBank04              ; $6D69: $D2 $7A $6D

    ld   hl, wEntitiesVelocityYTable              ; $6D6C: $21 $50 $C2
    add  hl, bc                                   ; $6D6F: $09
    ld   a, [hl]                                  ; $6D70: $7E
    ld   hl, wEntitiesPosYTable                   ; $6D71: $21 $10 $C2
    add  hl, bc                                   ; $6D74: $09
    add  [hl]                                     ; $6D75: $86
    ld   [hl], a                                  ; $6D76: $77
    cp   $78                                      ; $6D77: $FE $78
    ret  c                                        ; $6D79: $D8

    ; fall trough to ClearEntityStatusBank04
assert @ == ClearEntityStatusBank04
