Data_007_7112::
    db   $12, $14, $16, $18, $19, $1A, $1A, $1A, $1A, $1A

FireballShooterEntityHandler::
    call ReturnIfNonInteractive_07                ; $711C: $CD $96 $7D
    call EntityLinkPositionXDifference_07         ; $711F: $CD $5D $7E
    add  $20                                      ; $7122: $C6 $20
    cp   $40                                      ; $7124: $FE $40
    jr   nc, .jr_7131                             ; $7126: $30 $09

    call EntityLinkPositionYDifference_07         ; $7128: $CD $6D $7E
    add  $20                                      ; $712B: $C6 $20
    cp   $40                                      ; $712D: $FE $40
    jr   c, ret_007_7197                          ; $712F: $38 $66

.jr_7131
    ld   hl, wEntitiesSpriteVariantTable          ; $7131: $21 $B0 $C3
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    inc  a                                        ; $7136: $3C
    ld   [hl], a                                  ; $7137: $77
    and  $7F                                      ; $7138: $E6 $7F
    ret  nz                                       ; $713A: $C0

    ld   e, $0F                                   ; $713B: $1E $0F
    ld   d, b                                     ; $713D: $50

jr_007_713E:
    ld   hl, wEntitiesTypeTable                   ; $713E: $21 $A0 $C3
    add  hl, de                                   ; $7141: $19
    ld   a, [hl]                                  ; $7142: $7E
    cp   $82                                      ; $7143: $FE $82
    jr   z, .jr_7161                              ; $7145: $28 $1A

    cp   $9E                                      ; $7147: $FE $9E
    jr   z, .jr_7161                              ; $7149: $28 $16

    cp   $7D                                      ; $714B: $FE $7D
    jr   z, .jr_7161                              ; $714D: $28 $12

    ld   hl, wEntitiesPhysicsFlagsTable           ; $714F: $21 $40 $C3
    add  hl, de                                   ; $7152: $19
    ld   a, [hl]                                  ; $7153: $7E
    and  ENTITY_PHYSICS_HARMLESS                  ; $7154: $E6 $80
    jr   nz, .jr_7161                             ; $7156: $20 $09

    ld   hl, wEntitiesStatusTable                 ; $7158: $21 $80 $C2
    add  hl, de                                   ; $715B: $19
    ld   a, [hl]                                  ; $715C: $7E
    cp   $05                                      ; $715D: $FE $05
    jr   z, jr_007_7168                           ; $715F: $28 $07

.jr_7161
    dec  e                                        ; $7161: $1D
    ld   a, e                                     ; $7162: $7B
    cp   $FF                                      ; $7163: $FE $FF
    jr   nz, jr_007_713E                          ; $7165: $20 $D7

    ret                                           ; $7167: $C9

jr_007_7168:
    ld   a, [wRoomEventEffectExecuted]            ; $7168: $FA $8F $C1
    and  a                                        ; $716B: $A7
    ret  nz                                       ; $716C: $C0

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $716D: $3E $7D
    call SpawnNewEntity_trampoline                ; $716F: $CD $86 $3B
    jr   c, ret_007_7197                          ; $7172: $38 $23

    ldh  a, [hMultiPurpose0]                      ; $7174: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7176: $21 $00 $C2
    add  hl, de                                   ; $7179: $19
    ld   [hl], a                                  ; $717A: $77
    ldh  a, [hMultiPurpose1]                      ; $717B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $717D: $21 $10 $C2
    add  hl, de                                   ; $7180: $19
    ld   [hl], a                                  ; $7181: $77
    push bc                                       ; $7182: $C5
    ld   c, e                                     ; $7183: $4B
    ld   b, d                                     ; $7184: $42
    ldh  a, [hMapId]                              ; $7185: $F0 $F7
    ld   e, a                                     ; $7187: $5F
    ld   a, $14                                   ; $7188: $3E $14
    cp   $0A                                      ; $718A: $FE $0A
    jr   nc, .jr_7193                             ; $718C: $30 $05

    ld   hl, Data_007_7112                        ; $718E: $21 $12 $71
    add  hl, de                                   ; $7191: $19
    ld   a, [hl]                                  ; $7192: $7E

.jr_7193
    call ApplyVectorTowardsLink_trampoline        ; $7193: $CD $AA $3B
    pop  bc                                       ; $7196: $C1

ret_007_7197:
    ret                                           ; $7197: $C9
