; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StalfosEvasive2SpriteVariants::
.variant0
    db $4A, $01
    db $4C, $01
.variant1
    db $4C, $21
    db $4A, $21
.variant2
    db $4E, $01
    db $4E, $21

Data_015_4E89::
    db   $00, $06, $FA, $FA, $06

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StalfosEvasive1SpriteVariants::
.variant0
    db $48, $01
    db $48, $61
.variant1
    db $48, $41
    db $48, $21

StalfosEvasiveEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $4E96: $21 $B0 $C2
    add  hl, bc                                   ; $4E99: $09
    ld   a, [hl]                                  ; $4E9A: $7E
    and  a                                        ; $4E9B: $A7
    jr   z, jr_015_4EEE                           ; $4E9C: $28 $50

    ld   de, StalfosEvasive1SpriteVariants        ; $4E9E: $11 $8E $4E
    call RenderActiveEntitySpritesPair            ; $4EA1: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4EA4: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $4EA7: $F0 $E7
    rra                                           ; $4EA9: $1F
    rra                                           ; $4EAA: $1F
    rra                                           ; $4EAB: $1F
    and  $01                                      ; $4EAC: $E6 $01
    call SetEntitySpriteVariant                   ; $4EAE: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $4EB1: $CD $88 $7B
    call label_3B23                               ; $4EB4: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4EB7: $21 $A0 $C2
    add  hl, bc                                   ; $4EBA: $09
    ld   a, [hl]                                  ; $4EBB: $7E
    and  a                                        ; $4EBC: $A7
    jp   nz, label_015_4ECB                       ; $4EBD: $C2 $CB $4E

    call label_3B39                               ; $4EC0: $CD $39 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4EC3: $21 $10 $C4
    add  hl, bc                                   ; $4EC6: $09
    ld   a, [hl]                                  ; $4EC7: $7E
    and  a                                        ; $4EC8: $A7
    jr   z, jr_015_4EDF                           ; $4EC9: $28 $14

label_015_4ECB:
    ldh  a, [hActiveEntityPosX]                   ; $4ECB: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4ECD: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4ECF: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4ED1: $E0 $D8
    ld   a, JINGLE_SWORD_POKING                   ; $4ED3: $3E $07
    ldh  [hJingle], a                             ; $4ED5: $E0 $F2
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $4ED7: $3E $05
    call AddTranscientVfx                         ; $4ED9: $CD $C7 $0C
    jp   ClearEntityStatus_15                     ; $4EDC: $C3 $31 $7C

jr_015_4EDF:
    ldh  a, [hActiveEntityPosX]                   ; $4EDF: $F0 $EE
    cp   $A8                                      ; $4EE1: $FE $A8
    jp   nc, ClearEntityStatus_15                 ; $4EE3: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $4EE6: $F0 $EC
    cp   $84                                      ; $4EE8: $FE $84
    jp   nc, ClearEntityStatus_15                 ; $4EEA: $D2 $31 $7C

    ret                                           ; $4EED: $C9

jr_015_4EEE:
    ld   de, StalfosEvasive2SpriteVariants        ; $4EEE: $11 $7D $4E
    call RenderActiveEntitySpritesPair            ; $4EF1: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4EF4: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $4EF7: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4EFA: $CD $05 $0C
    jr   nz, .jr_4F02                             ; $4EFD: $20 $03

    call label_3B39                               ; $4EFF: $CD $39 $3B

.jr_4F02
    call GetEntityPrivateCountdown1               ; $4F02: $CD $00 $0C
    cp   $01                                      ; $4F05: $FE $01
    jr   nz, .jr_4F50                             ; $4F07: $20 $47

    ldh  a, [hMapId]                              ; $4F09: $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ; $4F0B: $FE $03
    ret  c                                        ; $4F0D: $D8

    ld   a, ENTITY_STALFOS_EVASIVE                ; $4F0E: $3E $1E
    call SpawnNewEntity_trampoline                ; $4F10: $CD $86 $3B
    ret  c                                        ; $4F13: $D8

    ld   a, NOISE_SFX_WHOOSH                      ; $4F14: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4F16: $E0 $F4
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4F18: $21 $10 $C4
    add  hl, de                                   ; $4F1B: $19
    ld   [hl], b                                  ; $4F1C: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4F1D: $21 $40 $C3
    add  hl, de                                   ; $4F20: $19
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $4F21: $CB $F6
    set  ENTITY_PHYSICS_B_SHADOW, [hl]            ; $4F23: $CB $E6
    ld   hl, wEntitiesOptions1Table               ; $4F25: $21 $30 $C4
    add  hl, de                                   ; $4F28: $19
    set  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl] ; $4F29: $CB $CE
    set  4, [hl]                                  ; $4F2B: $CB $E6
    ldh  a, [hMultiPurpose0]                      ; $4F2D: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4F2F: $21 $00 $C2
    add  hl, de                                   ; $4F32: $19
    ld   [hl], a                                  ; $4F33: $77
    ldh  a, [hMultiPurpose1]                      ; $4F34: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4F36: $21 $10 $C2
    add  hl, de                                   ; $4F39: $19
    ld   [hl], a                                  ; $4F3A: $77
    ldh  a, [hMultiPurpose3]                      ; $4F3B: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $4F3D: $21 $10 $C3
    add  hl, de                                   ; $4F40: $19
    ld   [hl], a                                  ; $4F41: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4F42: $21 $B0 $C2
    add  hl, de                                   ; $4F45: $19
    inc  [hl]                                     ; $4F46: $34
    push bc                                       ; $4F47: $C5
    ld   c, e                                     ; $4F48: $4B
    ld   b, d                                     ; $4F49: $42
    ld   a, $18                                   ; $4F4A: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $4F4C: $CD $AA $3B
    pop  bc                                       ; $4F4F: $C1

.jr_4F50
    ld   hl, wEntitiesInertiaTable                ; $4F50: $21 $D0 $C3
    add  hl, bc                                   ; $4F53: $09
    ld   a, [hl]                                  ; $4F54: $7E
    JP_TABLE                                      ; $4F55
._00 dw func_015_4F5A                             ; $4F56
._01 dw func_015_501A                             ; $4F58

func_015_4F5A::
    call UpdateEntityPosWithSpeed_15              ; $4F5A: $CD $88 $7B
    call label_3B23                               ; $4F5D: $CD $23 $3B
    ldh  a, [hJoypadState]                        ; $4F60: $F0 $CC
    and  J_A | J_B                                ; $4F62: $E6 $30
    jr   z, .jr_4FAE                              ; $4F64: $28 $48

    call func_015_7BDB                            ; $4F66: $CD $DB $7B
    add  $24                                      ; $4F69: $C6 $24
    cp   $48                                      ; $4F6B: $FE $48
    jr   nc, .jr_4FAE                             ; $4F6D: $30 $3F

    call func_015_7BEB                            ; $4F6F: $CD $EB $7B
    add  $24                                      ; $4F72: $C6 $24
    cp   $48                                      ; $4F74: $FE $48
    jr   nc, .jr_4FAE                             ; $4F76: $30 $36

    call GetEntityTransitionCountdown             ; $4F78: $CD $05 $0C
    ld   [hl], $08                                ; $4F7B: $36 $08
    call GetEntityPrivateCountdown1               ; $4F7D: $CD $00 $0C
    ld   [hl], b                                  ; $4F80: $70
    ld   hl, wEntitiesInertiaTable                ; $4F81: $21 $D0 $C3
    add  hl, bc                                   ; $4F84: $09
    inc  [hl]                                     ; $4F85: $34
    ld   hl, wEntitiesSpeedZTable                 ; $4F86: $21 $20 $C3
    add  hl, bc                                   ; $4F89: $09
    ld   [hl], $15                                ; $4F8A: $36 $15
    ld   a, JINGLE_JUMP                           ; $4F8C: $3E $24
    ldh  [hJingle], a                             ; $4F8E: $E0 $F2
    ld   a, $12                                   ; $4F90: $3E $12
    call GetVectorTowardsLink_trampoline          ; $4F92: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4F95: $F0 $D7
    cpl                                           ; $4F97: $2F
    inc  a                                        ; $4F98: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $4F99: $21 $50 $C2
    add  hl, bc                                   ; $4F9C: $09
    ld   [hl], a                                  ; $4F9D: $77
    ldh  a, [hMultiPurpose1]                      ; $4F9E: $F0 $D8
    cpl                                           ; $4FA0: $2F
    inc  a                                        ; $4FA1: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $4FA2: $21 $40 $C2
    add  hl, bc                                   ; $4FA5: $09
    ld   [hl], a                                  ; $4FA6: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $4FA7: $21 $B0 $C3
    add  hl, bc                                   ; $4FAA: $09
    ld   [hl], $02                                ; $4FAB: $36 $02
    ret                                           ; $4FAD: $C9

.jr_4FAE
    ld   hl, wEntitiesCollisionsTable             ; $4FAE: $21 $A0 $C2
    add  hl, bc                                   ; $4FB1: $09
    ld   a, [hl]                                  ; $4FB2: $7E
    and  $03                                      ; $4FB3: $E6 $03
    jr   nz, .jr_4FC6                             ; $4FB5: $20 $0F

    ld   a, [hl]                                  ; $4FB7: $7E
    and  $0C                                      ; $4FB8: $E6 $0C
    jr   z, jr_015_4FCE                           ; $4FBA: $28 $12

    ld   hl, wEntitiesSpeedYTable                 ; $4FBC: $21 $50 $C2
    add  hl, bc                                   ; $4FBF: $09
    ld   a, [hl]                                  ; $4FC0: $7E
    xor  $F0                                      ; $4FC1: $EE $F0
    ld   [hl], a                                  ; $4FC3: $77
    jr   jr_015_4FCE                              ; $4FC4: $18 $08

.jr_4FC6
    ld   hl, wEntitiesSpeedXTable                 ; $4FC6: $21 $40 $C2
    add  hl, bc                                   ; $4FC9: $09
    ld   a, [hl]                                  ; $4FCA: $7E
    xor  $F0                                      ; $4FCB: $EE $F0
    ld   [hl], a                                  ; $4FCD: $77

jr_015_4FCE:
    ld   hl, wEntitiesStateTable                  ; $4FCE: $21 $90 $C2
    add  hl, bc                                   ; $4FD1: $09
    ld   a, [hl]                                  ; $4FD2: $7E
    and  a                                        ; $4FD3: $A7
    jr   nz, .jr_4FDD                             ; $4FD4: $20 $07

    call GetRandomByte                            ; $4FD6: $CD $0D $28
    and  $2F                                      ; $4FD9: $E6 $2F
    jr   nz, jr_015_500A                          ; $4FDB: $20 $2D

.jr_4FDD
    xor  a                                        ; $4FDD: $AF
    ld   hl, wEntitiesSpeedYTable                 ; $4FDE: $21 $50 $C2
    add  hl, bc                                   ; $4FE1: $09
    ld   [hl], a                                  ; $4FE2: $77
    call GetRandomByte                            ; $4FE3: $CD $0D $28
    and  $03                                      ; $4FE6: $E6 $03
    ld   e, a                                     ; $4FE8: $5F
    ld   d, b                                     ; $4FE9: $50
    ld   hl, Data_015_4E89                        ; $4FEA: $21 $89 $4E
    add  hl, de                                   ; $4FED: $19
    ld   a, [hl]                                  ; $4FEE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4FEF: $21 $40 $C2
    add  hl, bc                                   ; $4FF2: $09
    ld   [hl], a                                  ; $4FF3: $77
    and  a                                        ; $4FF4: $A7
    jr   nz, jr_015_500A                          ; $4FF5: $20 $13

    call GetRandomByte                            ; $4FF7: $CD $0D $28
    and  $01                                      ; $4FFA: $E6 $01
    add  $03                                      ; $4FFC: $C6 $03
    ld   e, a                                     ; $4FFE: $5F
    ld   d, b                                     ; $4FFF: $50
    ld   hl, Data_015_4E89                        ; $5000: $21 $89 $4E
    add  hl, de                                   ; $5003: $19
    ld   a, [hl]                                  ; $5004: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5005: $21 $50 $C2
    add  hl, bc                                   ; $5008: $09
    ld   [hl], a                                  ; $5009: $77

jr_015_500A:
    ld   hl, wEntitiesStateTable                  ; $500A: $21 $90 $C2
    add  hl, bc                                   ; $500D: $09
    xor  a                                        ; $500E: $AF
    ld   [hl], a                                  ; $500F: $77
    ldh  a, [hFrameCounter]                       ; $5010: $F0 $E7
    rra                                           ; $5012: $1F
    rra                                           ; $5013: $1F
    rra                                           ; $5014: $1F
    and  $01                                      ; $5015: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5017: $C3 $0C $3B

func_015_501A::
    call UpdateEntityPosWithSpeed_15              ; $501A: $CD $88 $7B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $501D: $21 $10 $C4
    add  hl, bc                                   ; $5020: $09
    ld   a, [hl]                                  ; $5021: $7E
    push hl                                       ; $5022: $E5
    ld   [hl], $01                                ; $5023: $36 $01
    call label_3B23                               ; $5025: $CD $23 $3B
    pop  hl                                       ; $5028: $E1
    ld   [hl], b                                  ; $5029: $70
    call AddEntityZSpeedToPos_15                  ; $502A: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $502D: $21 $20 $C3
    add  hl, bc                                   ; $5030: $09
    dec  [hl]                                     ; $5031: $35
    ld   hl, wEntitiesPosZTable                   ; $5032: $21 $10 $C3
    add  hl, bc                                   ; $5035: $09
    ld   a, [hl]                                  ; $5036: $7E
    and  $80                                      ; $5037: $E6 $80
    jr   z, .ret_5057                             ; $5039: $28 $1C

    ld   [hl], b                                  ; $503B: $70
    ld   hl, wEntitiesSpeedZTable                 ; $503C: $21 $20 $C3
    add  hl, bc                                   ; $503F: $09
    ld   [hl], b                                  ; $5040: $70
    ld   hl, wEntitiesSpeedYTable                 ; $5041: $21 $50 $C2
    add  hl, bc                                   ; $5044: $09
    ld   [hl], $08                                ; $5045: $36 $08
    ld   hl, wEntitiesSpeedXTable                 ; $5047: $21 $40 $C2
    add  hl, bc                                   ; $504A: $09
    ld   [hl], $08                                ; $504B: $36 $08
    ld   hl, wEntitiesInertiaTable                ; $504D: $21 $D0 $C3
    add  hl, bc                                   ; $5050: $09
    ld   [hl], b                                  ; $5051: $70
    call GetEntityPrivateCountdown1               ; $5052: $CD $00 $0C
    ld   [hl], $10                                ; $5055: $36 $10

.ret_5057
    ret                                           ; $5057: $C9
