Data_007_5CF8::
    db   $00, $00, $4C, $07, $00, $08, $4C, $27, $F0, $00, $4A, $07, $F0, $08, $4A, $27
    db   $E0, $00, $4A, $07, $E0, $08, $4A, $27, $D0, $00, $4A, $07, $D0, $08, $4A, $27
    db   $C0, $00, $48, $07, $C0, $08, $48, $27, $00, $00, $4A, $07, $00, $08, $4A, $27
    db   $F0, $00, $4A, $07, $F0, $08, $4A, $27, $E0, $00, $4A, $07, $E0, $08, $4A, $27
    db   $D0, $00, $48, $07, $D0, $08, $48, $27, $C0, $00, $FF, $07, $C0, $08, $FF, $27
    db   $00, $00, $4A, $07, $00, $08, $4A, $27, $F0, $00, $4A, $07, $F0, $08, $4A, $27
    db   $E0, $00, $48, $07, $E0, $08, $48, $27, $D0, $00, $FF, $07, $D0, $08, $FF, $27
    db   $C0, $00, $FF, $07, $C0, $08, $FF, $27, $00, $00, $4A, $07, $00, $08, $4A, $27
    db   $F0, $00, $48, $07, $F0, $08, $48, $27, $E0, $00, $FF, $07, $E0, $08, $FF, $27
    db   $D0, $00, $FF, $07, $D0, $08, $FF, $27, $C0, $00, $FF, $07, $C0, $08, $FF, $27
    db   $00, $00, $48, $07, $00, $08, $48, $27, $F0, $00, $FF, $07, $F0, $08, $FF, $27
    db   $E0, $00, $FF, $07, $E0, $08, $FF, $27, $D0, $00, $FF, $07, $D0, $08, $FF, $27
    db   $C0, $00, $FF, $07, $C0, $08, $FF, $27

SmashablePillarEntityHandler::
    ldh  a, [hLinkPositionY]                      ; $5DC0: $F0 $99
    ld   e, a                                     ; $5DC2: $5F
    ld   hl, wEntitiesPosYTable                   ; $5DC3: $21 $10 $C2
    add  hl, bc                                   ; $5DC6: $09
    ld   a, [hl]                                  ; $5DC7: $7E
    sub  e                                        ; $5DC8: $93
    jr   c, .jr_5DD0                              ; $5DC9: $38 $05

    ld   a, $01                                   ; $5DCB: $3E $01
    ld   [wDE00], a                               ; $5DCD: $EA $00 $DE

.jr_5DD0
    ld   hl, wEntitiesPrivateState1Table          ; $5DD0: $21 $B0 $C2
    add  hl, bc                                   ; $5DD3: $09
    ld   a, [hl]                                  ; $5DD4: $7E
    cp   $02                                      ; $5DD5: $FE $02
    jp   z, label_007_5FAB                        ; $5DD7: $CA $AB $5F

    and  a                                        ; $5DDA: $A7
    jp   nz, label_007_5F4D                       ; $5DDB: $C2 $4D $5F

    ldh  a, [hRoomStatus]                         ; $5DDE: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $5DE0: $E6 $20
    jp   nz, ClearEntityStatus_07                 ; $5DE2: $C2 $A4 $7E

    ld   a, [wRoomTransitionState]                ; $5DE5: $FA $24 $C1
    and  a                                        ; $5DE8: $A7
    jr   nz, .jr_5DF5                             ; $5DE9: $20 $0A

    ld   hl, wEntitiesRoomTable                   ; $5DEB: $21 $E0 $C3
    add  hl, bc                                   ; $5DEE: $09
    ldh  a, [hMapRoom]                            ; $5DEF: $F0 $F6
    cp   [hl]                                     ; $5DF1: $BE
    jp   nz, ClearEntityStatus_07                 ; $5DF2: $C2 $A4 $7E

.jr_5DF5
    ldh  a, [hActiveEntitySpriteVariant]          ; $5DF5: $F0 $F1
    cp   $05                                      ; $5DF7: $FE $05
    jr   nc, jr_007_5E12                          ; $5DF9: $30 $17

    rla                                           ; $5DFB: $17
    rla                                           ; $5DFC: $17
    and  $FC                                      ; $5DFD: $E6 $FC
    sla  a                                        ; $5DFF: $CB $27
    ld   e, a                                     ; $5E01: $5F
    sla  a                                        ; $5E02: $CB $27
    sla  a                                        ; $5E04: $CB $27
    add  e                                        ; $5E06: $83
    ld   e, a                                     ; $5E07: $5F
    ld   d, b                                     ; $5E08: $50

label_007_5E09:
    ld   hl, Data_007_5CF8                        ; $5E09: $21 $F8 $5C
    add  hl, de                                   ; $5E0C: $19
    ld   c, $0A                                   ; $5E0D: $0E $0A
    call func_007_5CA5                            ; $5E0F: $CD $A5 $5C

jr_007_5E12:
    call DecrementEntityIgnoreHitsCountdown       ; $5E12: $CD $56 $0C
    call label_3B70                               ; $5E15: $CD $70 $3B
    call PushLinkOutOfEntity_07                   ; $5E18: $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ; $5E1B: $F0 $F0
    JP_TABLE                                      ; $5E1D
._00 dw func_007_5E2A                             ; $5E1E
._01 dw func_007_5E2B                             ; $5E20
._02 dw func_007_5E43                             ; $5E22
._03 dw func_007_5EC5                             ; $5E24
._04 dw func_007_5EF2                             ; $5E26
._05 dw func_007_5F11                             ; $5E28

func_007_5E2A::
    ret

func_007_5E2B::
    call func_007_5EEA                            ; $5E2B: $CD $EA $5E
    call GetEntityTransitionCountdown             ; $5E2E: $CD $05 $0C
    jr   nz, func_007_5E36                        ; $5E31: $20 $03

    jp   IncrementEntityState                     ; $5E33: $C3 $12 $3B

func_007_5E36::
    ld   e, $00                                   ; $5E36: $1E $00
    and  $04                                      ; $5E38: $E6 $04
    jr   z, .jr_5E3E                              ; $5E3A: $28 $02

    ld   e, $02                                   ; $5E3C: $1E $02

.jr_5E3E
    ld   a, e                                     ; $5E3E: $7B
    ld   [wScreenShakeHorizontal], a              ; $5E3F: $EA $55 $C1
    ret                                           ; $5E42: $C9

func_007_5E43::
    call func_007_5EEA                            ; $5E43: $CD $EA $5E
    ldh  a, [hFrameCounter]                       ; $5E46: $F0 $E7
    call func_007_5E36                            ; $5E48: $CD $36 $5E
    ldh  a, [hFrameCounter]                       ; $5E4B: $F0 $E7
    and  $1F                                      ; $5E4D: $E6 $1F
    jr   nz, .jr_5E67                             ; $5E4F: $20 $16

    ld   hl, wEntitiesSpriteVariantTable          ; $5E51: $21 $B0 $C3
    add  hl, bc                                   ; $5E54: $09
    ld   a, [hl]                                  ; $5E55: $7E
    inc  a                                        ; $5E56: $3C
    ld   [hl], a                                  ; $5E57: $77
    cp   $05                                      ; $5E58: $FE $05
    jp   z, label_007_5EA7                        ; $5E5A: $CA $A7 $5E

    call GetRandomByte                            ; $5E5D: $CD $0D $28
    and  $03                                      ; $5E60: $E6 $03
    jr   z, .jr_5E67                              ; $5E62: $28 $03

    call func_007_5F61                            ; $5E64: $CD $61 $5F

.jr_5E67
    ldh  a, [hFrameCounter]                       ; $5E67: $F0 $E7
    and  $03                                      ; $5E69: $E6 $03
    jr   nz, .ret_5EA6                            ; $5E6B: $20 $39

    ld   a, ENTITY_SMASHABLE_PILLAR               ; $5E6D: $3E $A7
    call SpawnNewEntity_trampoline                ; $5E6F: $CD $86 $3B
    jr   c, .ret_5EA6                             ; $5E72: $38 $32

    call GetRandomByte                            ; $5E74: $CD $0D $28
    and  $07                                      ; $5E77: $E6 $07
    sub  $04                                      ; $5E79: $D6 $04
    ld   hl, hMultiPurpose1                       ; $5E7B: $21 $D8 $FF
    add  [hl]                                     ; $5E7E: $86
    ld   hl, wEntitiesPosYTable                   ; $5E7F: $21 $10 $C2
    add  hl, de                                   ; $5E82: $19
    ld   [hl], a                                  ; $5E83: $77
    call GetRandomByte                            ; $5E84: $CD $0D $28
    and  $1F                                      ; $5E87: $E6 $1F
    sub  $10                                      ; $5E89: $D6 $10
    ld   hl, hMultiPurpose0                       ; $5E8B: $21 $D7 $FF
    add  [hl]                                     ; $5E8E: $86
    ld   hl, wEntitiesPosXTable                   ; $5E8F: $21 $00 $C2
    add  hl, de                                   ; $5E92: $19
    ld   [hl], a                                  ; $5E93: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5E94: $21 $40 $C3
    add  hl, de                                   ; $5E97: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5E98: $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ; $5E9A: $21 $E0 $C2
    add  hl, de                                   ; $5E9D: $19
    ld   [hl], $10                                ; $5E9E: $36 $10
    ld   hl, wEntitiesPrivateState1Table          ; $5EA0: $21 $B0 $C2
    add  hl, de                                   ; $5EA3: $19
    ld   [hl], $01                                ; $5EA4: $36 $01

.ret_5EA6
    ret                                           ; $5EA6: $C9

label_007_5EA7:
    ld   a, $00                                   ; $5EA7: $3E $00
    ld   [wScreenShakeHorizontal], a              ; $5EA9: $EA $55 $C1
    ld   a, [wNumberOfDungeon7PillarsDestroyed]   ; $5EAC: $FA $72 $DB
    inc  a                                        ; $5EAF: $3C
    ld   [wNumberOfDungeon7PillarsDestroyed], a   ; $5EB0: $EA $72 $DB
    cp   $04                                      ; $5EB3: $FE $04
    jr   c, .jr_5EBF                              ; $5EB5: $38 $08

    call GetEntityTransitionCountdown             ; $5EB7: $CD $05 $0C
    ld   [hl], $20                                ; $5EBA: $36 $20
    jp   IncrementEntityState                     ; $5EBC: $C3 $12 $3B

.jr_5EBF
    call func_007_6E7F                            ; $5EBF: $CD $7F $6E
    jp   ClearEntityStatus_07                     ; $5EC2: $C3 $A4 $7E

func_007_5EC5::
    call GetEntityTransitionCountdown             ; $5EC5: $CD $05 $0C
    jr   nz, .jr_5EDE                             ; $5EC8: $20 $14

    ld   [hl], $20                                ; $5ECA: $36 $20
    ld   a, GAMEPLAY_CUTSCENE                     ; $5ECC: $3E $08
    ld   [wGameplayType], a                       ; $5ECE: $EA $95 $DB
    xor  a                                        ; $5ED1: $AF
    ld   [wTransitionSequenceCounter], a          ; $5ED2: $EA $6B $C1
    ld   [wC16C], a                               ; $5ED5: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $5ED8: $EA $96 $DB
    jp   IncrementEntityState                     ; $5EDB: $C3 $12 $3B

.jr_5EDE
    ld   e, $00                                   ; $5EDE: $1E $00
    and  $04                                      ; $5EE0: $E6 $04
    jr   z, .jr_5EE6                              ; $5EE2: $28 $02

    ld   e, $02                                   ; $5EE4: $1E $02

.jr_5EE6
    ld   a, e                                     ; $5EE6: $7B
    ld   [wScreenShakeHorizontal], a              ; $5EE7: $EA $55 $C1

func_007_5EEA::
    ld   a, $02                                   ; $5EEA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5EEC: $E0 $A1
    ld   [wC111], a                               ; $5EEE: $EA $11 $C1
    ret                                           ; $5EF1: $C9

func_007_5EF2::
    xor  a                                        ; $5EF2: $AF
    ld   [wScreenShakeHorizontal], a              ; $5EF3: $EA $55 $C1
    call GetEntityTransitionCountdown             ; $5EF6: $CD $05 $0C
    jr   nz, .jr_5F06                             ; $5EF9: $20 $0B

    call func_007_6E7F                            ; $5EFB: $CD $7F $6E
    ld   hl, wHasInstrument7                      ; $5EFE: $21 $6B $DB
    set  2, [hl]                                  ; $5F01: $CB $D6
    jp   ClearEntityStatus_07                     ; $5F03: $C3 $A4 $7E

.jr_5F06
    jp   func_007_5EEA                            ; $5F06: $C3 $EA $5E

Data_007_5F09::
    db   $00, $02, $04, $06, $06, $04, $02, $00

func_007_5F11::
    xor  a                                        ; $5F11: $AF
    ld   [wScreenShakeVertical], a                ; $5F12: $EA $56 $C1
    call GetEntityTransitionCountdown             ; $5F15: $CD $05 $0C
    jr   nz, .jr_5F1D                             ; $5F18: $20 $03

    jp   ClearEntityStatus_07                     ; $5F1A: $C3 $A4 $7E

.jr_5F1D
    push af                                       ; $5F1D: $F5
    and  $07                                      ; $5F1E: $E6 $07
    ld   e, a                                     ; $5F20: $5F
    ld   d, b                                     ; $5F21: $50
    ld   hl, Data_007_5F09                        ; $5F22: $21 $09 $5F
    add  hl, de                                   ; $5F25: $19
    ld   a, [hl]                                  ; $5F26: $7E
    ld   [wScreenShakeVertical], a                ; $5F27: $EA $56 $C1
    pop  af                                       ; $5F2A: $F1
    cp   $20                                      ; $5F2B: $FE $20
    jr   nc, .jr_5F37                             ; $5F2D: $30 $08

    and  $03                                      ; $5F2F: $E6 $03
    jr   nz, .jr_5F37                             ; $5F31: $20 $04

    call func_007_5F61                            ; $5F33: $CD $61 $5F
    xor  a                                        ; $5F36: $AF

.jr_5F37
    cp   $40                                      ; $5F37: $FE $40
    jr   c, .ret_5F44                             ; $5F39: $38 $09

    and  $07                                      ; $5F3B: $E6 $07
    jr   nz, .ret_5F44                            ; $5F3D: $20 $05

    ld   hl, hNoiseSfx                            ; $5F3F: $21 $F4 $FF
    ld   [hl], NOISE_SFX_EXPLOSION                ; $5F42: $36 $0C

.ret_5F44
    ret                                           ; $5F44: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown101SpriteVariants::
.variant0
    db $30, OAM_GBC_PAL_1 | OAMF_PAL0
    db $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $32, OAM_GBC_PAL_1 | OAMF_PAL0
    db $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

label_007_5F4D:
    ld   de, Unknown101SpriteVariants             ; $5F4D: $11 $45 $5F
    call RenderActiveEntitySpritesPair            ; $5F50: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $5F53: $CD $05 $0C
    jp   z, ClearEntityStatus_07                  ; $5F56: $CA $A4 $7E

    cp   $04                                      ; $5F59: $FE $04
    ret  nz                                       ; $5F5B: $C0

    ld   a, $01                                   ; $5F5C: $3E $01
    jp   SetEntitySpriteVariant                   ; $5F5E: $C3 $0C $3B

func_007_5F61::
    ld   a, ENTITY_SMASHABLE_PILLAR               ; $5F61: $3E $A7
    call SpawnNewEntity_trampoline                ; $5F63: $CD $86 $3B
    jr   c, .ret_5F9A                             ; $5F66: $38 $32

    ld   hl, wEntitiesPrivateState1Table          ; $5F68: $21 $B0 $C2
    add  hl, de                                   ; $5F6B: $19
    ld   [hl], $02                                ; $5F6C: $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F6E: $21 $40 $C3
    add  hl, de                                   ; $5F71: $19
    ld   [hl], 1 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5F72: $36 $D1
    ld   hl, wEntitiesPosZTable                   ; $5F74: $21 $10 $C3
    add  hl, de                                   ; $5F77: $19
    ld   [hl], $70                                ; $5F78: $36 $70
    call GetRandomByte                            ; $5F7A: $CD $0D $28
    and  $3F                                      ; $5F7D: $E6 $3F
    sub  $20                                      ; $5F7F: $D6 $20
    ld   hl, hMultiPurpose0                       ; $5F81: $21 $D7 $FF
    add  [hl]                                     ; $5F84: $86
    ld   hl, wEntitiesPosXTable                   ; $5F85: $21 $00 $C2
    add  hl, de                                   ; $5F88: $19
    ld   [hl], a                                  ; $5F89: $77
    call GetRandomByte                            ; $5F8A: $CD $0D $28
    and  $3F                                      ; $5F8D: $E6 $3F
    sub  $20                                      ; $5F8F: $D6 $20
    ld   hl, hMultiPurpose1                       ; $5F91: $21 $D8 $FF
    add  [hl]                                     ; $5F94: $86
    ld   hl, wEntitiesPosYTable                   ; $5F95: $21 $10 $C2
    add  hl, de                                   ; $5F98: $19
    ld   [hl], a                                  ; $5F99: $77

.ret_5F9A
    ret                                           ; $5F9A: $C9

Data_007_5F9B::
    db   $16, $03, $16, $23

Data_007_5F9F::
    db   $18, $10, $0C, $08

Data_007_5FA3::
    db   $0C, $F4, $0C, $F4

Data_007_5FA7::
    db   $F4, $F4, $0C, $0C

label_007_5FAB:
    ldh  a, [hActiveEntityVisualPosY]             ; $5FAB: $F0 $EC
    add  $08                                      ; $5FAD: $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $5FAF: $E0 $EC

.jr_5FB1
    ld   de, Data_007_5F9B                        ; $5FB1: $11 $9B $5F
    call RenderActiveEntitySprite                 ; $5FB4: $CD $77 $3C
    call UpdateEntityPosWithVelocity_07           ; $5FB7: $CD $0A $7E
    call AddEntityZVelocityToPos_07               ; $5FBA: $CD $43 $7E
    ld   hl, wEntitiesVelocityZTable              ; $5FBD: $21 $20 $C3
    add  hl, bc                                   ; $5FC0: $09
    dec  [hl]                                     ; $5FC1: $35
    dec  [hl]                                     ; $5FC2: $35
    ld   hl, wEntitiesPosZTable                   ; $5FC3: $21 $10 $C3
    add  hl, bc                                   ; $5FC6: $09
    ld   a, [hl]                                  ; $5FC7: $7E
    and  $80                                      ; $5FC8: $E6 $80
    ret  z                                        ; $5FCA: $C8

    ld   [hl], b                                  ; $5FCB: $70
    ld   hl, wEntitiesStateTable                  ; $5FCC: $21 $90 $C2
    add  hl, bc                                   ; $5FCF: $09
    ld   a, [hl]                                  ; $5FD0: $7E
    inc  [hl]                                     ; $5FD1: $34
    cp   $04                                      ; $5FD2: $FE $04
    jp   z, ClearEntityStatus_07                  ; $5FD4: $CA $A4 $7E

    ld   e, a                                     ; $5FD7: $5F
    ld   d, b                                     ; $5FD8: $50
    ld   hl, Data_007_5F9F                        ; $5FD9: $21 $9F $5F
    add  hl, de                                   ; $5FDC: $19
    ld   a, [hl]                                  ; $5FDD: $7E
    ld   hl, wEntitiesVelocityZTable              ; $5FDE: $21 $20 $C3
    add  hl, bc                                   ; $5FE1: $09
    ld   [hl], a                                  ; $5FE2: $77
    call GetRandomByte                            ; $5FE3: $CD $0D $28
    and  $03                                      ; $5FE6: $E6 $03
    ld   e, a                                     ; $5FE8: $5F
    ld   d, b                                     ; $5FE9: $50
    ld   hl, Data_007_5FA3                        ; $5FEA: $21 $A3 $5F
    add  hl, de                                   ; $5FED: $19
    ld   a, [hl]                                  ; $5FEE: $7E
    ld   hl, wEntitiesVelocityXTable              ; $5FEF: $21 $40 $C2
    add  hl, bc                                   ; $5FF2: $09
    ld   [hl], a                                  ; $5FF3: $77
    ld   hl, Data_007_5FA7                        ; $5FF4: $21 $A7 $5F
    add  hl, de                                   ; $5FF7: $19

.jr_5FF8
    ld   a, [hl]                                  ; $5FF8: $7E
    call GetEntityVelocityYAddress                ; $5FF9: $CD $05 $40
    ld   [hl], a                                  ; $5FFC: $77
    ld   a, e                                     ; $5FFD: $7B
    and  $01                                      ; $5FFE: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6000: $C3 $0C $3B
