; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LaserSpriteVariants::
; Down
.variant0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Down-left
.variant1
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0
; Left
.variant2
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
; Up-left
.variant3
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
; Up
.variant4
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Up-right
.variant5
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Right
.variant6
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Down-right
.variant7
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

; Approximately 0x10 * cos(pi/8 * index)
LaserLinkSensorYSpeeds::
    db   $10, $0E, $0C, $06

; Approximately 0x10 * sin(pi/8 * index)
LaserLinkSensorXSpeeds::
    db   $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E, $10, $0E, $0C, $06

LaserEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 04:6C61 $F0 $F0
    and  a                                        ;; 04:6C63 $A7
    jp   nz, LaserLinkSensorHandler               ;; 04:6C64 $C2 $0F $6D

    ld   de, LaserSpriteVariants                  ;; 04:6C67 $11 $2D $6C
    call RenderActiveEntitySpritesPair            ;; 04:6C6A $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:6C6D $CD $A3 $7F
    call label_3B44                               ;; 04:6C70 $CD $44 $3B
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:6C73 $CD $23 $3B
    call GetEntityTransitionCountdown             ;; 04:6C76 $CD $05 $0C
    jr   z, LaserSpinningHandler                  ;; 04:6C79 $28 $39

    cp   $10                                      ;; 04:6C7B $FE $10
    jr   nz, .return                              ;; 04:6C7D $20 $34

    ld   a, ENTITY_LASER_BEAM                     ;; 04:6C7F $3E $2B
    call SpawnNewEntity_trampoline                ;; 04:6C81 $CD $86 $3B
    jr   c, .return                               ;; 04:6C84 $38 $2D

    ld   a, NOISE_SFX_BEAMOS_LASER                ;; 04:6C86 $3E $08
    ldh  [hNoiseSfx], a                           ;; 04:6C88 $E0 $F4
    ldh  a, [hMultiPurpose0]                      ;; 04:6C8A $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:6C8C $21 $00 $C2
    add  hl, de                                   ;; 04:6C8F $19
    ld   [hl], a                                  ;; 04:6C90 $77
    ldh  a, [hMultiPurpose1]                      ;; 04:6C91 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:6C93 $21 $10 $C2
    add  hl, de                                   ;; 04:6C96 $19
    ld   [hl], a                                  ;; 04:6C97 $77
    ldh  a, [hMultiPurpose2]                      ;; 04:6C98 $F0 $D9
    ld   hl, wEntitiesDirectionTable              ;; 04:6C9A $21 $80 $C3
    add  hl, de                                   ;; 04:6C9D $19
    ld   [hl], a                                  ;; 04:6C9E $77
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6C9F $21 $40 $C2
    add  hl, bc                                   ;; 04:6CA2 $09
    ld   a, [hl]                                  ;; 04:6CA3 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6CA4 $21 $40 $C2
    add  hl, de                                   ;; 04:6CA7 $19
    ld   [hl], a                                  ;; 04:6CA8 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 04:6CA9 $21 $50 $C2
    add  hl, bc                                   ;; 04:6CAC $09
    ld   a, [hl]                                  ;; 04:6CAD $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:6CAE $21 $50 $C2
    add  hl, de                                   ;; 04:6CB1 $19
    ld   [hl], a                                  ;; 04:6CB2 $77

.return  
    ret                                           ;; 04:6CB3 $C9

LaserSpinningHandler:
    ; Every 8 frames...
    ld   hl, wEntitiesInertiaTable                ;; 04:6CB4 $21 $D0 $C3
    add  hl, bc                                   ;; 04:6CB7 $09
    ld   a, [hl]                                  ;; 04:6CB8 $7E
    inc  a                                        ;; 04:6CB9 $3C
    ld   [hl], a                                  ;; 04:6CBA $77
    and  $07                                      ;; 04:6CBB $E6 $07
    jr   nz, .return                              ;; 04:6CBD $20 $4F

    ; ...update direction and spawn an invisible and intangible Link-sensing entity
    ld   hl, wEntitiesDirectionTable              ;; 04:6CBF $21 $80 $C3
    add  hl, bc                                   ;; 04:6CC2 $09
    ld   a, [hl]                                  ;; 04:6CC3 $7E
    inc  a                                        ;; 04:6CC4 $3C
    and  $0F                                      ;; 04:6CC5 $E6 $0F
    ld   [hl], a                                  ;; 04:6CC7 $77
    srl  a                                        ;; 04:6CC8 $CB $3F
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:6CCA $21 $B0 $C3
    add  hl, bc                                   ;; 04:6CCD $09
    ld   [hl], a                                  ;; 04:6CCE $77
    ld   a, ENTITY_LASER                          ;; 04:6CCF $3E $2A
    call SpawnNewEntity_trampoline                ;; 04:6CD1 $CD $86 $3B
    jr   c, .return                               ;; 04:6CD4 $38 $38

    ldh  a, [hMultiPurpose0]                      ;; 04:6CD6 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:6CD8 $21 $00 $C2
    add  hl, de                                   ;; 04:6CDB $19
    ld   [hl], a                                  ;; 04:6CDC $77
    ldh  a, [hMultiPurpose1]                      ;; 04:6CDD $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:6CDF $21 $10 $C2
    add  hl, de                                   ;; 04:6CE2 $19
    ld   [hl], a                                  ;; 04:6CE3 $77
    ld   hl, wEntitiesStateTable                  ;; 04:6CE4 $21 $90 $C2
    add  hl, de                                   ;; 04:6CE7 $19
    ld   [hl], $01                                ;; 04:6CE8 $36 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6CEA $21 $B0 $C2
    add  hl, de                                   ;; 04:6CED $19
    ld   [hl], c                                  ;; 04:6CEE $71
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:6CEF $21 $40 $C3
    add  hl, de                                   ;; 04:6CF2 $19
    ld   [hl], ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 04:6CF3 $36 $C0
    push bc                                       ;; 04:6CF5 $C5
    ldh  a, [hMultiPurpose2]                      ;; 04:6CF6 $F0 $D9
    ld   c, a                                     ;; 04:6CF8 $4F
    ld   hl, LaserLinkSensorXSpeeds               ;; 04:6CF9 $21 $51 $6C
    add  hl, bc                                   ;; 04:6CFC $09
    ld   a, [hl]                                  ;; 04:6CFD $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6CFE $21 $40 $C2
    add  hl, de                                   ;; 04:6D01 $19
    ld   [hl], a                                  ;; 04:6D02 $77
    ld   hl, LaserLinkSensorYSpeeds               ;; 04:6D03 $21 $4D $6C
    add  hl, bc                                   ;; 04:6D06 $09
    ld   a, [hl]                                  ;; 04:6D07 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:6D08 $21 $50 $C2
    add  hl, de                                   ;; 04:6D0B $19
    ld   [hl], a                                  ;; 04:6D0C $77
    pop  bc                                       ;; 04:6D0D $C1

.return  
    ret                                           ;; 04:6D0E $C9

; When entity state = 1, the entity is instead an invisible, intangible sensor
; used to detect Link and tell the parent Laser entity to fire a beam.
LaserLinkSensorHandler:
    call label_3B2E                               ;; 04:6D0F $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:6D12 $21 $A0 $C2
    add  hl, bc                                   ;; 04:6D15 $09
    ld   a, [hl]                                  ;; 04:6D16 $7E
    and  a                                        ;; 04:6D17 $A7
    jp   nz, ClearEntityStatusBank04              ;; 04:6D18 $C2 $7A $6D

    ; If  horizontally...
    ldh  a, [hActiveEntityPosX]                   ;; 04:6D1B $F0 $EE
    ld   hl, hLinkPositionX                       ;; 04:6D1D $21 $98 $FF
    sub  [hl]                                     ;; 04:6D20 $96
    add  $10                                      ;; 04:6D21 $C6 $10
    cp   $20                                      ;; 04:6D23 $FE $20
    jr   nc, .jr_6D5C                             ;; 04:6D25 $30 $35

    ; ...and vertically near Link...
    ldh  a, [hActiveEntityPosY]                   ;; 04:6D27 $F0 $EF
    ld   hl, hLinkPositionY                       ;; 04:6D29 $21 $99 $FF
    sub  [hl]                                     ;; 04:6D2C $96
    add  $10                                      ;; 04:6D2D $C6 $10
    cp   $20                                      ;; 04:6D2F $FE $20
    jr   nc, .jr_6D5C                             ;; 04:6D31 $30 $29

    ; ...and Link is not invincible...
    call ClearEntityStatusBank04                  ;; 04:6D33 $CD $7A $6D
    ld   a, [wInvincibilityCounter]               ;; 04:6D36 $FA $C7 $DB
    and  a                                        ;; 04:6D39 $A7
    jr   nz, .jr_6D5C                             ;; 04:6D3A $20 $20

    ; ...and the transition countdown of the parent Laser entity is zero (isn't firing)...
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6D3C $21 $B0 $C2
    add  hl, bc                                   ;; 04:6D3F $09
    ld   e, [hl]                                  ;; 04:6D40 $5E
    ld   d, b                                     ;; 04:6D41 $50
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:6D42 $21 $E0 $C2
    add  hl, de                                   ;; 04:6D45 $19
    ld   a, [hl]                                  ;; 04:6D46 $7E
    and  a                                        ;; 04:6D47 $A7
    jr   nz, .jr_6D5C                             ;; 04:6D48 $20 $12

    ; ...make the parent Laser entity start flashing (about to fire)
    ; and update its speed.
    ld   [hl], $20                                ;; 04:6D4A $36 $20
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:6D4C $21 $20 $C4
    add  hl, de                                   ;; 04:6D4F $19
    ld   [hl], $10                                ;; 04:6D50 $36 $10
    push bc                                       ;; 04:6D52 $C5
    ld   c, e                                     ;; 04:6D53 $4B
    ld   b, d                                     ;; 04:6D54 $42
    ld   a, $40                                   ;; 04:6D55 $3E $40
    call ApplyVectorTowardsLink_trampoline        ;; 04:6D57 $CD $AA $3B
    pop  bc                                       ;; 04:6D5A $C1
    ret                                           ;; 04:6D5B $C9

.jr_6D5C
    ; Otherwise, keep moving.
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6D5C $21 $40 $C2
    add  hl, bc                                   ;; 04:6D5F $09
    ld   a, [hl]                                  ;; 04:6D60 $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:6D61 $21 $00 $C2
    add  hl, bc                                   ;; 04:6D64 $09
    add  [hl]                                     ;; 04:6D65 $86
    ld   [hl], a                                  ;; 04:6D66 $77
    cp   $9C                                      ;; 04:6D67 $FE $9C
    jp   nc, ClearEntityStatusBank04              ;; 04:6D69 $D2 $7A $6D

    ld   hl, wEntitiesSpeedYTable                 ;; 04:6D6C $21 $50 $C2
    add  hl, bc                                   ;; 04:6D6F $09
    ld   a, [hl]                                  ;; 04:6D70 $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:6D71 $21 $10 $C2
    add  hl, bc                                   ;; 04:6D74 $09
    add  [hl]                                     ;; 04:6D75 $86
    ld   [hl], a                                  ;; 04:6D76 $77
    cp   $78                                      ;; 04:6D77 $FE $78
    ret  c                                        ;; 04:6D79 $D8

    ; fall trough to ClearEntityStatusBank04
assert @ == ClearEntityStatusBank04
