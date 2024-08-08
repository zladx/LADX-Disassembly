Data_007_7112::
    db   $12, $14, $16, $18, $19, $1A, $1A, $1A, $1A, $1A

FireballShooterEntityHandler::
    call ReturnIfNonInteractive_07                ;; 07:711C $CD $96 $7D
    call GetEntityXDistanceToLink_07              ;; 07:711F $CD $5D $7E
    add  $20                                      ;; 07:7122 $C6 $20
    cp   $40                                      ;; 07:7124 $FE $40
    jr   nc, .jr_7131                             ;; 07:7126 $30 $09

    call GetEntityYDistanceToLink_07              ;; 07:7128 $CD $6D $7E
    add  $20                                      ;; 07:712B $C6 $20
    cp   $40                                      ;; 07:712D $FE $40
    jr   c, ret_007_7197                          ;; 07:712F $38 $66

.jr_7131
    ld   hl, wEntitiesSpriteVariantTable          ;; 07:7131 $21 $B0 $C3
    add  hl, bc                                   ;; 07:7134 $09
    ld   a, [hl]                                  ;; 07:7135 $7E
    inc  a                                        ;; 07:7136 $3C
    ld   [hl], a                                  ;; 07:7137 $77
    and  $7F                                      ;; 07:7138 $E6 $7F
    ret  nz                                       ;; 07:713A $C0

    ld   e, $0F                                   ;; 07:713B $1E $0F
    ld   d, b                                     ;; 07:713D $50

jr_007_713E:
    ld   hl, wEntitiesTypeTable                   ;; 07:713E $21 $A0 $C3
    add  hl, de                                   ;; 07:7141 $19
    ld   a, [hl]                                  ;; 07:7142 $7E
    cp   $82                                      ;; 07:7143 $FE $82
    jr   z, .jr_7161                              ;; 07:7145 $28 $1A

    cp   $9E                                      ;; 07:7147 $FE $9E
    jr   z, .jr_7161                              ;; 07:7149 $28 $16

    cp   $7D                                      ;; 07:714B $FE $7D
    jr   z, .jr_7161                              ;; 07:714D $28 $12

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:714F $21 $40 $C3
    add  hl, de                                   ;; 07:7152 $19
    ld   a, [hl]                                  ;; 07:7153 $7E
    and  ENTITY_PHYSICS_HARMLESS                  ;; 07:7154 $E6 $80
    jr   nz, .jr_7161                             ;; 07:7156 $20 $09

    ld   hl, wEntitiesStatusTable                 ;; 07:7158 $21 $80 $C2
    add  hl, de                                   ;; 07:715B $19
    ld   a, [hl]                                  ;; 07:715C $7E
    cp   $05                                      ;; 07:715D $FE $05
    jr   z, jr_007_7168                           ;; 07:715F $28 $07

.jr_7161
    dec  e                                        ;; 07:7161 $1D
    ld   a, e                                     ;; 07:7162 $7B
    cp   $FF                                      ;; 07:7163 $FE $FF
    jr   nz, jr_007_713E                          ;; 07:7165 $20 $D7

    ret                                           ;; 07:7167 $C9

jr_007_7168:
    ld   a, [wRoomEventEffectExecuted]            ;; 07:7168 $FA $8F $C1
    and  a                                        ;; 07:716B $A7
    ret  nz                                       ;; 07:716C $C0

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ;; 07:716D $3E $7D
    call SpawnNewEntity_trampoline                ;; 07:716F $CD $86 $3B
    jr   c, ret_007_7197                          ;; 07:7172 $38 $23

    ldh  a, [hMultiPurpose0]                      ;; 07:7174 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 07:7176 $21 $00 $C2
    add  hl, de                                   ;; 07:7179 $19
    ld   [hl], a                                  ;; 07:717A $77
    ldh  a, [hMultiPurpose1]                      ;; 07:717B $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 07:717D $21 $10 $C2
    add  hl, de                                   ;; 07:7180 $19
    ld   [hl], a                                  ;; 07:7181 $77
    push bc                                       ;; 07:7182 $C5
    ld   c, e                                     ;; 07:7183 $4B
    ld   b, d                                     ;; 07:7184 $42
    ldh  a, [hMapId]                              ;; 07:7185 $F0 $F7
    ld   e, a                                     ;; 07:7187 $5F
    ld   a, $14                                   ;; 07:7188 $3E $14
    cp   $0A                                      ;; 07:718A $FE $0A
    jr   nc, .jr_7193                             ;; 07:718C $30 $05

    ld   hl, Data_007_7112                        ;; 07:718E $21 $12 $71
    add  hl, de                                   ;; 07:7191 $19
    ld   a, [hl]                                  ;; 07:7192 $7E

.jr_7193
    call ApplyVectorTowardsLink_trampoline        ;; 07:7193 $CD $AA $3B
    pop  bc                                       ;; 07:7196 $C1

ret_007_7197:
    ret                                           ;; 07:7197 $C9
