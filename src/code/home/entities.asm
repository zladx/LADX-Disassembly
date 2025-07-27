;
; Code for the entities system.
;

; Tell if Bow-Wow can eat an entity of the given type.
; Inputs:
;   de   entity type
; Return:
;   a    value read from BowWowEatableEntitiesTable
CanBowWowEatEntity::
    ld   a, $14                                   ;; 00:3925 $3E $14
    ld   [rSelectROMBank], a                      ;; 00:3927 $EA $00 $21
    ld   hl, BowWowEatableEntitiesTable           ;; 00:392A $21 $18 $52
    add  hl, de                                   ;; 00:392D $19
    ld   a, [hl]                                  ;; 00:392E $7E
    ld   hl, rSelectROMBank                       ;; 00:392F $21 $00 $21
    ld   [hl], $05                                ;; 00:3932 $36 $05
    ret                                           ;; 00:3934 $C9

label_3935::
    callsw func_019_7C50                          ;; 00:3935 $3E $19 $CD $0C $08 $CD $50 $7C
    ld   a, $03                                   ;; 00:393D $3E $03
    jp   SwitchBank                               ;; 00:393F $C3 $0C $08

label_3942::
    callsb func_003_53E4                          ;; 00:3942 $3E $03 $EA $00 $21 $CD $E4 $53
    jp   ReloadSavedBank                          ;; 00:394A $C3 $1D $08

label_394D::
    callsb func_014_54AC                          ;; 00:394D $3E $14 $EA $00 $21 $CD $AC $54
    jp   ReloadSavedBank                          ;; 00:3955 $C3 $1D $08

CreateFollowingNpcEntity_trampoline::
    callsw CreateFollowingNpcEntity               ;; 00:3958 $3E $01 $CD $0C $08 $CD $B3 $5F
    ld   a, $02                                   ;; 00:3960 $3E $02
    jp   SwitchBank                               ;; 00:3962 $C3 $0C $08

ConfigureNewEntity_trampoline::
    callsb ConfigureNewEntity                     ;; 00:3965 $3E $03 $EA $00 $21 $CD $5B $48
    jp   ReloadSavedBank                          ;; 00:396D $C3 $1D $08

; Unused
GetEntityDirectionToLink_trampoline::
    callsb GetEntityDirectionToLink_03            ;; 00:3970 $3E $03 $EA $00 $21 $CD $FE $7E
    jp   ReloadSavedBank                          ;; 00:3978 $C3 $1D $08

label_397B::
    callsb func_014_5347                          ;; 00:397B $3E $14 $EA $00 $21 $CD $47 $53
    ld   a, $03                                   ;; 00:3983 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:3985 $EA $00 $21
    ret                                           ;; 00:3988 $C9

data_3989::
    db   0, 8, $10, $18                           ;; 00:3989

; Loop through all active entities, and call the relevant handler depending
; on their state.
AnimateEntities::
    ; Play the Boss Agony audio effect if needed
    ld   hl, wBossAgonySFXCountdown               ;; 00:398D $21 $A7 $C5
    ld   a, [hl]                                  ;; 00:3990 $7E
    and  a                                        ;; 00:3991 $A7
    jr   z, .bossAgonyEnd                         ;; 00:3992 $28 $07
    dec  [hl]                                     ;; 00:3994 $35
    jr   nz, .bossAgonyEnd                        ;; 00:3995 $20 $04
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ;; 00:3997 $3E $10
    ldh  [hWaveSfx], a                            ;; 00:3999 $E0 $F3
.bossAgonyEnd

    ; If no dialog is open…
    ld   a, [wDialogState]                        ;; 00:399B $FA $9F $C1
    and  a                                        ;; 00:399E $A7
    jr   nz, .C111End                             ;; 00:399F $20 $0D
    ; … decrement wC111
    ld   a, [wC111]                               ;; 00:39A1 $FA $11 $C1
    ld   [wC1A8], a                               ;; 00:39A4 $EA $A8 $C1
    and  a                                        ;; 00:39A7 $A7
    jr   z, .C111End                              ;; 00:39A8 $28 $04
    dec  a                                        ;; 00:39AA $3D
    ld   [wC111], a                               ;; 00:39AB $EA $11 $C1
.C111End

    ; If Link is passing out, return
    ld   a, [wLinkMotionState]                    ;; 00:39AE $FA $1C $C1
    cp   LINK_MOTION_PASS_OUT                     ;; 00:39B1 $FE $07
    ret  z                                        ;; 00:39B3 $C8

    xor  a                                        ;; 00:39B4 $AF
    ld   [wC3C1], a                               ;; 00:39B5 $EA $C1 $C3
    ldh  a, [hMapId]                              ;; 00:39B8 $F0 $F7
    cp   MAP_CAVE_B                               ;; 00:39BA $FE $0A
    ldh  a, [hFrameCounter]                       ;; 00:39BC $F0 $E7
    jr   c, .label_39C1                           ;; 00:39BE $38 $01
    xor  a                                        ;; 00:39C0 $AF

.label_39C1
    and  $03                                      ;; 00:39C1 $E6 $03
    ld   e, a                                     ;; 00:39C3 $5F
    ld   d, $00                                   ;; 00:39C4 $16 $00
    ld   hl, data_3989                            ;; 00:39C6 $21 $89 $39
    add  hl, de                                   ;; 00:39C9 $19
    ld   a, [hl]                                  ;; 00:39CA $7E
    ld   [wOAMNextAvailableSlot], a               ;; 00:39CB $EA $C0 $C3
    callsb func_020_4303                          ;; 00:39CE $3E $20 $EA $00 $21 $CD $03 $43
    xor  a                                        ;; 00:39D6 $AF
    ld   [rSelectROMBank], a                      ;; 00:39D7 $EA $00 $21
    ld   a, [wDialogState]                        ;; 00:39DA $FA $9F $C1
    and  a                                        ;; 00:39DD $A7
    jr   nz, .label_39E3                          ;; 00:39DE $20 $03
    ld   [wItemUsageContext], a                   ;; 00:39E0 $EA $AD $C1

.label_39E3
    ld   a, BANK(func_020_6352)                   ;; 00:39E3 $3E $20
    ld   [wCurrentBank], a                        ;; 00:39E5 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:39E8 $EA $00 $21
    call func_020_6352                            ;; 00:39EB $CD $52 $63

    ; Initialize the entities counter
    ld   b, $00                                   ;; 00:39EE $06 $00
    ld   c, MAX_ENTITIES - 1                      ;; 00:39F0 $0E $0F

    ; For each entity slot…
.loop
    ; Save the active entity index
    ld   a, c                                     ;; 00:39F2 $79
    ld   [wActiveEntityIndex], a                  ;; 00:39F3 $EA $23 $C1

    ; Read the entity state
    ld   hl, wEntitiesStatusTable                 ;; 00:39F6 $21 $80 $C2
    add  hl, bc                                   ;; 00:39F9 $09
    ld   a, [hl]                                  ;; 00:39FA $7E

    ; If state != 0…
    and  a                                        ;; 00:39FB $A7
    jr   z, .AnimateEntityEnd                     ;; 00:39FC $28 $05

    ; animate the entity.
    ldh  [hActiveEntityStatus], a                 ;; 00:39FE $E0 $EA
    call AnimateEntity                            ;; 00:3A00 $CD $18 $3A
.AnimateEntityEnd

    ; While c >= 0, loop
    dec  c                                        ;; 00:3A03 $0D
    ld   a, c                                     ;; 00:3A04 $79
    cp   $FF                                      ;; 00:3A05 $FE $FF
    jr   nz, .loop                                ;; 00:3A07 $20 $E9

.return
    ret                                           ;; 00:3A09 $C9

ResetEntity_trampoline::
    callsb ResetEntity                            ;; 00:3A0A $3E $15 $EA $00 $21 $CD $00 $40
    ld   a, $03                                   ;; 00:3A12 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:3A14 $EA $00 $21
    ret                                           ;; 00:3A17 $C9

; For a given entity slot, call the relevant entity handler
; (depending on the entity state).
;
; Inputs:
;   bc   entity index
AnimateEntity::
    ld   hl, wEntitiesTypeTable                   ;; 00:3A18 $21 $A0 $C3
    add  hl, bc                                   ;; 00:3A1B $09
    ld   a, [hl]                                  ;; 00:3A1C $7E
    ldh  [hActiveEntityType], a                   ;; 00:3A1D $E0 $EB

    ld   hl, wEntitiesStateTable                  ;; 00:3A1F $21 $90 $C2
    add  hl, bc                                   ;; 00:3A22 $09
    ld   a, [hl]                                  ;; 00:3A23 $7E
    ldh  [hActiveEntityState], a                  ;; 00:3A24 $E0 $F0

    ld   hl, wEntitiesSpriteVariantTable          ;; 00:3A26 $21 $B0 $C3
    add  hl, bc                                   ;; 00:3A29 $09
    ld   a, [hl]                                  ;; 00:3A2A $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 00:3A2B $E0 $F1

    ld   a, BANK(UpdateEntityPositionForRoomTransition) ;; 00:3A2D $3E $19
    ld   [wCurrentBank], a                        ;; 00:3A2F $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:3A32 $EA $00 $21

    ldh  a, [hActiveEntityType]                   ;; 00:3A35 $F0 $EB
    cp   ENTITY_RAFT_RAFT_OWNER                   ;; 00:3A37 $FE $6A
    jr   nz, .raftManEnd                          ;; 00:3A39 $20 $05
    ldh  a, [hLinkSlowWalkingSpeed]               ;; 00:3A3B $F0 $B2
    and  a                                        ;; 00:3A3D $A7
    jr   nz, .entityLifted                        ;; 00:3A3E $20 $06
.raftManEnd

    ldh  a, [hActiveEntityStatus]                 ;; 00:3A40 $F0 $EA
    cp   ENTITY_STATUS_LIFTED                     ;; 00:3A42 $FE $07
    jr   nz, .notLifted                           ;; 00:3A44 $20 $08
.entityLifted
    call UpdateEntityPositionForRoomTransition    ;; 00:3A46 $CD $64 $79
    call CopyEntityPositionToActivePosition       ;; 00:3A49 $CD $8A $3D
    jr   .liftedEnd                               ;; 00:3A4C $18 $06
.notLifted
    call CopyEntityPositionToActivePosition       ;; 00:3A4E $CD $8A $3D
    call UpdateEntityPositionForRoomTransition    ;; 00:3A51 $CD $64 $79
.liftedEnd

    ld   a, BANK(UpdateEntityTimers)              ;; 00:3A54 $3E $14
    ld   [wCurrentBank], a                        ;; 00:3A56 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:3A59 $EA $00 $21
    call UpdateEntityTimers                       ;; 00:3A5C $CD $73 $4D

    ; Select bank 3
    ld   a, $03                                   ;; 00:3A5F $3E $03
    ld   [wCurrentBank], a                        ;; 00:3A61 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:3A64 $EA $00 $21

    ldh  a, [hActiveEntityStatus]                 ;; 00:3A67 $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 00:3A69 $FE $05
    jp   z, ExecuteActiveEntityHandler            ;; 00:3A6B $CA $8D $3A
    JP_TABLE                                      ;; 00:3A6E $C7
._00 dw AnimateEntities.return                    ;; 00:3A6F
._01 dw EntityDeathHandler                        ;; 00:3A71
._02 dw EntityFallHandler                         ;; 00:3A73
._03 dw EntityDestructionHandler                  ;; 00:3A75
._04 dw EntityInitHandler                         ;; 00:3A77
._05 dw ExecuteActiveEntityHandler                ;; 00:3A79
._06 dw EntityStunnedHandler                      ;; 00:3A7B
._07 dw EntityLiftedHandler                       ;; 00:3A7D
._08 dw EntityThrownHandler                       ;; 00:3A7F

; Execute active entity handler, then return to bank 3
ExecuteActiveEntityHandler_trampoline::
    call ExecuteActiveEntityHandler               ;; 00:3A81 $CD $8D $3A
    ld   a, $03                                   ;; 00:3A84 $3E $03
    ld   [wCurrentBank], a                        ;; 00:3A86 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:3A89 $EA $00 $21
    ret                                           ;; 00:3A8C $C9

; Read the entity handler address in the handlers table,
; then jump to execution.
ExecuteActiveEntityHandler::
    ld   a, BANK(EntityHandlersTable)             ;; 00:3A8D $3E $20
    ld   [rSelectROMBank], a                      ;; 00:3A8F $EA $00 $21

    ; de = active entity id
    ldh  a, [hActiveEntityType]                   ;; 00:3A92 $F0 $EB
    ld   e, a                                     ;; 00:3A94 $5F
    ld   d, b                                     ;; 00:3A95 $50

    ; hl = de * 3
    ld   hl, EntityHandlersTable                  ;; 00:3A96 $21 $00 $40
    add  hl, de                                   ;; 00:3A99 $19
    add  hl, de                                   ;; 00:3A9A $19
    add  hl, de                                   ;; 00:3A9B $19

    ; Read values from the entities pointers table:
    ; a = entity handler bank
    ; d = entity handler address (high)
    ; e = entity handler address (low)
    ld   e, [hl]                                  ;; 00:3A9C $5E
    inc  hl                                       ;; 00:3A9D $23
    ld   d, [hl]                                  ;; 00:3A9E $56
    inc  hl                                       ;; 00:3A9F $23
    ld   a, [hl]                                  ;; 00:3AA0 $7E

    ; Select entity handler bank
    ld   l, e                                     ;; 00:3AA1 $6B
    ld   h, d                                     ;; 00:3AA2 $62
    ld   [wCurrentBank], a                        ;; 00:3AA3 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:3AA6 $EA $00 $21

    ; Jump to the entity handler
    jp   hl                                       ;; 00:3AA9 $E9

; Types of entity hitboxes
; Array indexed par (wEntitiesHitboxFlagsTable & $7C)
; Content goes into wEntitiesHitboxPositionTable
; Values:
;  - hitbox X
;  - hitbox Y
;  - ???
;  - ???
HitboxPositions::
._00 db   $08, $05, $08, $05                      ;; 00:3AAA
._04 db   $08, $0A, $08, $0A                      ;; 00:3AAE
._08 db   $08, $0A, $08, $0A                      ;; 00:3AB2
._0C db   $08, $10, $04, $0A                      ;; 00:3AB6
._10 db   $08, $02, $08, $02                      ;; 00:3ABA
._14 db   $08, $13, $08, $13                      ;; 00:3ABE
._18 db   $08, $06, $06, $08                      ;; 00:3AC2
._1C db   $08, $07, $06, $0A                      ;; 00:3AC6
._20 db   $08, $06, $10, $30                      ;; 00:3ACA
._24 db   $08, $07, $04, $0A                      ;; 00:3ACE
._28 db   $0C, $07, $FC, $04                      ;; 00:3AD2
._2C db   $10, $10, $0C, $12                      ;; 00:3AD6
._30 db   $08, $08, $02, $08                      ;; 00:3ADA
._34 db   $10, $0C, $08, $10                      ;; 00:3ADE
._38 db   $08, $07, $0C, $08                      ;; 00:3AE2
._3C db   $08, $08, $02, $08                      ;; 00:3AE6

; Read hitbox params from the hitbox types table, and copy them
; to the entities hitbox table.
; Inputs:
;   bc    entity index
ConfigureEntityHitbox::
    ; de = HitboxPositions[wEntitiesHitboxFlagsTable & $7C]
    ld   hl, wEntitiesHitboxFlagsTable            ;; 00:3AEA $21 $50 $C3
    add  hl, bc                                   ;; 00:3AED $09
    ld   a, [hl]                                  ;; 00:3AEE $7E
    and  $7C ; '|'                                ;; 00:3AEF $E6 $7C
    ld   e, a                                     ;; 00:3AF1 $5F
    ld   d, b                                     ;; 00:3AF2 $50
    ld   hl, HitboxPositions                      ;; 00:3AF3 $21 $AA $3A
    add  hl, de                                   ;; 00:3AF6 $19
    ld   e, l                                     ;; 00:3AF7 $5D
    ld   d, h                                     ;; 00:3AF8 $54
    push bc                                       ;; 00:3AF9 $C5
    ; c = c * 4
    sla  c                                        ;; 00:3AFA $CB $21
    sla  c                                        ;; 00:3AFC $CB $21
    ; Destination: hl = wEntitiesHitboxPositionTable + (entity index * 4)
    ld   hl, wEntitiesHitboxPositionTable         ;; 00:3AFE $21 $80 $D5
    add  hl, bc                                   ;; 00:3B01 $09

    ; Copy 4 bytes from HitboxPositions to wEntitiesHitboxPositionTable
    ld   c, 4                                     ;; 00:3B02 $0E $04
    ; While c != 0
.loop
    ld   a, [de]                                  ;; 00:3B04 $1A
    inc  de                                       ;; 00:3B05 $13
    ldi  [hl], a                                  ;; 00:3B06 $22
    dec  c                                        ;; 00:3B07 $0D
    jr   nz, .loop                                ;; 00:3B08 $20 $FA
    pop  bc                                       ;; 00:3B0A $C1
    ret                                           ;; 00:3B0B $C9

; Set the given value to the entity sprite variants table.
;
; Inputs:
;   a    variant value
;   bc   entity index
SetEntitySpriteVariant::
    ld   hl, wEntitiesSpriteVariantTable          ;; 00:3B0C $21 $B0 $C3
    add  hl, bc                                   ;; 00:3B0F $09
    ld   [hl], a                                  ;; 00:3B10 $77
    ret                                           ;; 00:3B11 $C9

; Increment the state attribute of the given entity
; Input:
;   bc   entity index
; Output:
;   hl   address of the state for this entity
IncrementEntityState::
    ld   hl, wEntitiesStateTable                  ;; 00:3B12 $21 $90 $C2
    add  hl, bc                                   ;; 00:3B15 $09
    inc  [hl]                                     ;; 00:3B16 $34
    ret                                           ;; 00:3B17 $C9

HurtBySpikes_trampoline::
    callsb HurtBySpikes                           ;; 00:3B18 $3E $02 $EA $00 $21 $CD $F5 $75
    jp   ReloadSavedBank                          ;; 00:3B20 $C3 $1D $08

ApplyEntityInteractionWithBackground_trampoline::
    callsb ApplyEntityInteractionWithBackground   ;; 00:3B23 $3E $03 $EA $00 $21 $CD $93 $78
    jp   ReloadSavedBank                          ;; 00:3B2B $C3 $1D $08

label_3B2E::
    callsb ApplySwordIntersectionWithObjects      ;; 00:3B2E $3E $03 $EA $00 $21 $CD $AB $7C
    jp   ReloadSavedBank                          ;; 00:3B36 $C3 $1D $08

DefaultEnemyDamageCollisionHandler_trampoline::
    callsb DefaultEnemyDamageCollisionHandler     ;; 00:3B39 $3E $03 $EA $00 $21 $CD $28 $6E
    jp   ReloadSavedBank                          ;; 00:3B41 $C3 $1D $08

label_3B44::
    callsb func_003_6C6B                          ;; 00:3B44 $3E $03 $EA $00 $21 $CD $6B $6C
    jp   ReloadSavedBank                          ;; 00:3B4C $C3 $1D $08

CheckLinkCollisionWithProjectile_trampoline::
    callsb CheckLinkCollisionWithProjectile       ;; 00:3B4F $3E $03 $EA $00 $21 $CD $DE $6B
    jp   ReloadSavedBank                          ;; 00:3B57 $C3 $1D $08

CheckLinkCollisionWithEnemy_trampoline::
    callsb CheckLinkCollisionWithEnemy.collisionEvenInTheAir ;; 00:3B5A $3E $03 $EA $00 $21 $CD $77 $6C
    jp   ReloadSavedBank                          ;; 00:3B62 $C3 $1D $08

label_3B65::
    callsb func_003_73EB                          ;; 00:3B65 $3E $03 $EA $00 $21 $CD $EB $73
    jp   ReloadSavedBank                          ;; 00:3B6D $C3 $1D $08

label_3B70::
    callsb func_003_6E2B                          ;; 00:3B70 $3E $03 $EA $00 $21 $CD $2B $6E
    jp   ReloadSavedBank                          ;; 00:3B78 $C3 $1D $08

label_3B7B::
    callsb func_003_75A2                          ;; 00:3B7B $3E $03 $EA $00 $21 $CD $A2 $75
    jp   ReloadSavedBank                          ;; 00:3B83 $C3 $1D $08

SpawnNewEntity_trampoline::
    push af                                       ;; 00:3B86 $F5
    ld   a, BANK(SpawnNewEntity)                  ;; 00:3B87 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:3B89 $EA $00 $21
    pop  af                                       ;; 00:3B8C $F1
    call SpawnNewEntity                           ;; 00:3B8D $CD $CA $64
    rr   l                                        ;; 00:3B90 $CB $1D
    call ReloadSavedBank                          ;; 00:3B92 $CD $1D $08
    rl   l                                        ;; 00:3B95 $CB $15
    ret                                           ;; 00:3B97 $C9

SpawnNewEntityInRange_trampoline::
    push af                                       ;; 00:3B98 $F5
    ld   a, BANK(SpawnNewEntityInRange)           ;; 00:3B99 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:3B9B $EA $00 $21
    pop  af                                       ;; 00:3B9E $F1
    call SpawnNewEntityInRange                    ;; 00:3B9F $CD $CC $64
    rr   l                                        ;; 00:3BA2 $CB $1D
    call ReloadSavedBank                          ;; 00:3BA4 $CD $1D $08
    rl   l                                        ;; 00:3BA7 $CB $15
    ret                                           ;; 00:3BA9 $C9

ApplyVectorTowardsLink_trampoline::
    callhl ApplyVectorTowardsLink                 ;; 00:3BAA $21 $00 $21 $36 $03 $CD $C7 $7E
    jp   ReloadSavedBank                          ;; 00:3BB2 $C3 $1D $08

GetVectorTowardsLink_trampoline::
    callhl GetVectorTowardsLink                   ;; 00:3BB5 $21 $00 $21 $36 $03 $CD $45 $7E
    jp   ReloadSavedBank                          ;; 00:3BBD $C3 $1D $08

; Render a pair of sprites for the active entity to the OAM buffer.
;
; The main input is a display list containing OAM attributes (2 bytes each).
; Each display list item is a pair of OAM attributes (one for each sprite).
;
; The entity variant is used to animate the entity, by selecting one of
; the different pairs in the display list.
;
; Inputs:
;   de                          address of the display list
;   hActiveEntitySpriteVariant  the sprite variant to use
RenderActiveEntitySpritesPair::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:3BC0 $F0 $F1
    inc  a                                        ;; 00:3BC2 $3C
    ret  z                                        ;; 00:3BC3 $C8

    call SkipDisabledEntityDuringRoomTransition   ;; 00:3BC4 $CD $57 $3D

    push de                                       ;; 00:3BC7 $D5

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]               ;; 00:3BC8 $FA $C0 $C3
    ld   e, a                                     ;; 00:3BCB $5F
    ld   d, b                                     ;; 00:3BCC $50
    ld   hl, wDynamicOAMBuffer                    ;; 00:3BCD $21 $30 $C0
    add  hl, de                                   ;; 00:3BD0 $19
    ld   e, l                                     ;; 00:3BD1 $5D
    ld   d, h                                     ;; 00:3BD2 $54

    ; Sprite 0: set OAM byte 0 (Y position)
    ; [de] = [hActiveEntityVisualPosY]
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3BD3 $F0 $EC
    ld   [de], a                                  ;; 00:3BD5 $12
    inc  de                                       ;; 00:3BD6 $13

    ; Sprite 0: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]              ;; 00:3BD7 $FA $55 $C1
    ld   c, a                                     ;; 00:3BDA $4F
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3BDB $F0 $ED
    and  OAMF_XFLIP                               ;; 00:3BDD $E6 $20
    rra                                           ;; 00:3BDF $1F
    rra                                           ;; 00:3BE0 $1F
    ld   hl, hActiveEntityPosX                    ;; 00:3BE1 $21 $EE $FF
    add  a, [hl]                                  ;; 00:3BE4 $86
    sub  a, c                                     ;; 00:3BE5 $91
    ld   [de], a                                  ;; 00:3BE6 $12
    inc  de                                       ;; 00:3BE7 $13

    ; hl = pop de + [hActiveEntitySpriteVariant] * 2
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:3BE8 $F0 $F1
    ld   c, a                                     ;; 00:3BEA $4F
    ld   b, $00                                   ;; 00:3BEB $06 $00
    sla  c                                        ;; 00:3BED $CB $21
    rl   b                                        ;; 00:3BEF $CB $10
    sla  c                                        ;; 00:3BF1 $CB $21
    rl   b                                        ;; 00:3BF3 $CB $10
    pop  hl                                       ;; 00:3BF5 $E1
    add  hl, bc                                   ;; 00:3BF6 $09

    ; Sprite 0: set OAM byte 2 (tile n°)
    ; [de] = [hl++] + [hActiveEntityTilesOffset]
    ldh  a, [hActiveEntityTilesOffset]            ;; 00:3BF7 $F0 $F5
    ld   c, a                                     ;; 00:3BF9 $4F
    ld   a, [hli]                                 ;; 00:3BFA $2A
    add  a, c                                     ;; 00:3BFB $81
    ld   [de], a                                  ;; 00:3BFC $12
    and  $0F                                      ;; 00:3BFD $E6 $0F
    cp   $0F                                      ;; 00:3BFF $FE $0F
    jr   nz, .jr_3C08                             ;; 00:3C01 $20 $05
    dec  de                                       ;; 00:3C03 $1B
    ld   a, $F0                                   ;; 00:3C04 $3E $F0
    ld   [de], a                                  ;; 00:3C06 $12
    inc  de                                       ;; 00:3C07 $13
.jr_3C08

    inc  de                                       ;; 00:3C08 $13

    ; Sprite 0: set OAM byte 3 (tile attribute)
    ld   a, [hli]                                 ;; 00:3C09 $2A
    push hl                                       ;; 00:3C0A $E5
    ld   hl, hActiveEntityFlipAttribute           ;; 00:3C0B $21 $ED $FF
    xor  [hl]                                     ;; 00:3C0E $AE
    ld   [de], a                                  ;; 00:3C0F $12
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]                              ;; 00:3C10 $F0 $FE
    and  a                                        ;; 00:3C12 $A7
    jr   z, .paletteFlip0End                      ;; 00:3C13 $28 $0C
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3C15 $F0 $ED
    and  OAMF_PAL1                                ;; 00:3C17 $E6 $10
    jr   z, .paletteFlip0End                      ;; 00:3C19 $28 $06
    ; …invert the color palette data and set 3th bit.
    ld   a, [de]                                  ;; 00:3C1B $1A
    and  $FF ^ OAMF_PALMASK                       ;; 00:3C1C $E6 $F8
    or   OAM_GBC_PAL_4                            ;; 00:3C1E $F6 $04
    ld   [de], a                                  ;; 00:3C20 $12
.paletteFlip0End
    inc  de                                       ;; 00:3C21 $13

    ; Sprite 1: set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3C22 $F0 $EC
    ld   [de], a                                  ;; 00:3C24 $12
    inc  de                                       ;; 00:3C25 $13

    ; Sprite 1: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]              ;; 00:3C26 $FA $55 $C1
    ld   c, a                                     ;; 00:3C29 $4F
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3C2A $F0 $ED
    and  OAMF_XFLIP                               ;; 00:3C2C $E6 $20
    xor  OAMF_XFLIP                               ;; 00:3C2E $EE $20
    rra                                           ;; 00:3C30 $1F
    rra                                           ;; 00:3C31 $1F
    ld   hl, hActiveEntityPosX                    ;; 00:3C32 $21 $EE $FF
    sub  a, c                                     ;; 00:3C35 $91
    add  a, [hl]                                  ;; 00:3C36 $86
    ld   [de], a                                  ;; 00:3C37 $12
    inc  de                                       ;; 00:3C38 $13

    ; Sprite 1: set OAM byte 2 (tile n°)
    pop  hl                                       ;; 00:3C39 $E1
    ldh  a, [hActiveEntityTilesOffset]            ;; 00:3C3A $F0 $F5
    ld   c, a                                     ;; 00:3C3C $4F
    ld   a, [hli]                                 ;; 00:3C3D $2A
    add  a, c                                     ;; 00:3C3E $81
    ld   [de], a                                  ;; 00:3C3F $12
    and  $0F                                      ;; 00:3C40 $E6 $0F
    cp   $0F                                      ;; 00:3C42 $FE $0F
    jr   nz, .jr_3C4B                             ;; 00:3C44 $20 $05
    dec  de                                       ;; 00:3C46 $1B
    ld   a, $F0                                   ;; 00:3C47 $3E $F0
    ld   [de], a                                  ;; 00:3C49 $12
    inc  de                                       ;; 00:3C4A $13
.jr_3C4B

    inc  de                                       ;; 00:3C4B $13

    ; Sprite 1: set OAM byte 3 (tile attribute)
    ld   a, [hl]                                  ;; 00:3C4C $7E
    ld   hl, hActiveEntityFlipAttribute           ;; 00:3C4D $21 $ED $FF
    xor  [hl]                                     ;; 00:3C50 $AE
    ld   [de], a                                  ;; 00:3C51 $12
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]                              ;; 00:3C52 $F0 $FE
    and  a                                        ;; 00:3C54 $A7
    jr   z, .paletteFlip1End                      ;; 00:3C55 $28 $0C
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3C57 $F0 $ED
    and  OAMF_PAL1                                ;; 00:3C59 $E6 $10
    jr   z, .paletteFlip1End                      ;; 00:3C5B $28 $06
    ; …invert the color palette data.
    ld   a, [de]                                  ;; 00:3C5D $1A
    and  $FF ^ OAMF_PALMASK                       ;; 00:3C5E $E6 $F8
    or   $04                                      ;; 00:3C60 $F6 $04
    ld   [de], a                                  ;; 00:3C62 $12
.paletteFlip1End

    ; Restore the entity index to bc
    ld   a, [wActiveEntityIndex]                  ;; 00:3C63 $FA $23 $C1
    ld   c, a                                     ;; 00:3C66 $4F
    ld   b, $00                                   ;; 00:3C67 $06 $00

    callsb func_015_795D                          ;; 00:3C69 $3E $15 $EA $00 $21 $CD $5D $79
    ; fallthrough

label_3C71::
    call func_015_7995                            ;; 00:3C71 $CD $95 $79

    ; Reload saved bank and return
    jp   ReloadSavedBank                          ;; 00:3C74 $C3 $1D $08

; Render a single sprite for the active entity to the OAM buffer.
;
; The main input is a display list, containing OAM attributes (2 bytes each).
; There is one OAM attribute per variant.
;
; The entity variant is used to animate the entity, by selecting a sprite
; among the different attributes in the display list.
;
; Inputs:
;   de                          address of the display list
;   wActiveEntityIndex          index
;   hActiveEntitySpriteVariant  the sprite variant to use
;   wOAMNextAvailableSlot       index of the dynamically allocated OAM slot
RenderActiveEntitySprite::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:3C77 $F0 $F1
    inc  a                                        ;; 00:3C79 $3C
    ret  z                                        ;; 00:3C7A $C8

    call SkipDisabledEntityDuringRoomTransition   ;; 00:3C7B $CD $57 $3D

    push de                                       ;; 00:3C7E $D5

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]               ;; 00:3C7F $FA $C0 $C3
    ld   l, a                                     ;; 00:3C82 $6F
    ld   h, $00                                   ;; 00:3C83 $26 $00
    ld   bc, wDynamicOAMBuffer                    ;; 00:3C85 $01 $30 $C0
    add  hl, bc                                   ;; 00:3C88 $09
    ld   e, l                                     ;; 00:3C89 $5D
    ld   d, h                                     ;; 00:3C8A $54
    ; bc = [wActiveEntityIndex]
    ld   a, [wActiveEntityIndex]                  ;; 00:3C8B $FA $23 $C1
    ld   c, a                                     ;; 00:3C8E $4F
    ld   b, $00                                   ;; 00:3C8F $06 $00

    ; Set OAM byte 0 (Y position)

    ; If in a side-scrolling room…
    ldh  a, [hIsSideScrolling]                    ;; 00:3C91 $F0 $F9
    and  a                                        ;; 00:3C93 $A7
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3C94 $F0 $EC
    jr   z, .sideScrollingEnd                     ;; 00:3C96 $28 $04
    ; … hActiveEntityVisualPosY -= 4
    sub  a, $04                                   ;; 00:3C98 $D6 $04
    ldh  [hActiveEntityVisualPosY], a             ;; 00:3C9A $E0 $EC
.sideScrollingEnd
    ld   [de], a                                  ;; 00:3C9C $12
    inc  de                                       ;; 00:3C9D $13

    ; Set OAM byte 1 (X position)
    ld   a, [wScreenShakeHorizontal]              ;; 00:3C9E $FA $55 $C1
    ld   h, a                                     ;; 00:3CA1 $67
    ldh  a, [hActiveEntityPosX]                   ;; 00:3CA2 $F0 $EE
    add  a, $04                                   ;; 00:3CA4 $C6 $04
    sub  a, h                                     ;; 00:3CA6 $94
    ld   [de], a                                  ;; 00:3CA7 $12
    inc  de                                       ;; 00:3CA8 $13

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:3CA9 $F0 $F1
    ld   c, a                                     ;; 00:3CAB $4F
    ld   b, $00                                   ;; 00:3CAC $06 $00
    sla  c                                        ;; 00:3CAE $CB $21
    rl   b                                        ;; 00:3CB0 $CB $10
    pop  hl                                       ;; 00:3CB2 $E1
    add  hl, bc                                   ;; 00:3CB3 $09
    ld   a, [hli]                                 ;; 00:3CB4 $2A
    ld   [de], a                                  ;; 00:3CB5 $12

    ; Set OAM byte 3 (tile attribute)

    ; If on GBC…
    inc  de                                       ;; 00:3CB6 $13
    ldh  a, [hIsGBC]                              ;; 00:3CB7 $F0 $FE
    and  a                                        ;; 00:3CB9 $A7
    jr   z, .paletteFlipEnd                       ;; 00:3CBA $28 $14
    ; and not during credits…
    ld   a, [wGameplayType]                       ;; 00:3CBC $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 00:3CBF $FE $01
    jr   z, .paletteFlipEnd                       ;; 00:3CC1 $28 $0D
    ; and hActiveEntityFlipAttribute != 0…
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3CC3 $F0 $ED
    and  a                                        ;; 00:3CC5 $A7
    jr   z, .paletteFlipEnd                       ;; 00:3CC6 $28 $08
    ; …invert the color palette data and set the 3th bit.
    ld   a, [hl]                                  ;; 00:3CC8 $7E
    and  $FF ^ OAMF_PALMASK                       ;; 00:3CC9 $E6 $F8
    or   OAM_GBC_PAL_4                            ;; 00:3CCB $F6 $04
    ld   [de], a                                  ;; 00:3CCD $12
    jr   .functionEnd                             ;; 00:3CCE $18 $06
.paletteFlipEnd

    ld   a, [hli]                                 ;; 00:3CD0 $2A
    ld   hl, hActiveEntityFlipAttribute           ;; 00:3CD1 $21 $ED $FF
    xor  [hl]                                     ;; 00:3CD4 $AE
    ld   [de], a                                  ;; 00:3CD5 $12

.functionEnd
    inc  de                                       ;; 00:3CD6 $13
    jr   RenderActiveEntitySpritesPair.paletteFlip1End ;; 00:3CD7 $18 $8A

label_3CD9::
    ld   a, $15                                   ;; 00:3CD9 $3E $15
    ld   [rSelectROMBank], a                      ;; 00:3CDB $EA $00 $21
    jr   label_3C71                               ;; 00:3CDE $18 $91

; Render a large rectangle of sprites using the entire OAM buffer.
;
; The sprites are allocated starting from the very start of the OAM buffer,
; overwriting even the part dedicated to Link's sprites.
;
; This is mainly used when displaying a large sprite on a screen where Link
; is not present.
;
; See RenderActiveEntitySpritesRect for details.
RenderActiveEntitySpritesRectUsingAllOAM::
    push hl                                       ;; 00:3CE0 $E5
    ld   hl, wOAMBuffer                           ;; 00:3CE1 $21 $00 $C0
    jr   RenderActiveEntitySpritesRect.withDestination ;; 00:3CE4 $18 $10

; Render a large rectangle of sprites for the active entity to the OAM buffer.
;
; This function takes a display list of OAM attributes.
; Each item of the display list is a tupple of [x (?), y(?), tile n°, tile attributes] values.
;
; The display list is processed regardless of the active sprite variant.
; Variants must be managed by the caller itself.
;
; The sprites are allocated starting from the next available slot
; in the dynamic part of the OAM buffer.
;
; Inputs:
;   hl  the oam attributes display list
;   c   the number of sprites
;
; Return value:
;   c   [wActiveEntityIndex]
RenderActiveEntitySpritesRect::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:3CE6 $F0 $F1
    inc  a                                        ;; 00:3CE8 $3C
    jr   z, .return                               ;; 00:3CE9 $28 $67

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    push hl                                       ;; 00:3CEB $E5
    ld   a, [wOAMNextAvailableSlot]               ;; 00:3CEC $FA $C0 $C3
    ld   e, a                                     ;; 00:3CEF $5F
    ld   d, $00                                   ;; 00:3CF0 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 00:3CF2 $21 $30 $C0
    add  hl, de                                   ;; 00:3CF5 $19
.withDestination
    ld   e, l                                     ;; 00:3CF6 $5D
    ld   d, h                                     ;; 00:3CF7 $54
    pop  hl                                       ;; 00:3CF8 $E1

    ; Save counter to hMultiPurpose0
    ld   a, c                                     ;; 00:3CF9 $79
    ldh  [hMultiPurpose0], a                      ;; 00:3CFA $E0 $D7

    ld   a, [wActiveEntityIndex]                  ;; 00:3CFC $FA $23 $C1
    ld   c, a                                     ;; 00:3CFF $4F
    call SkipDisabledEntityDuringRoomTransition   ;; 00:3D00 $CD $57 $3D

    ; Restore counter from hMultiPurpose0
    ldh  a, [hMultiPurpose0]                      ;; 00:3D03 $F0 $D7
    ld   c, a                                     ;; 00:3D05 $4F

.loop
    ; Set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3D06 $F0 $EC
    add  a, [hl]                                  ;; 00:3D08 $86
    ld   [de], a                                  ;; 00:3D09 $12
    inc  hl                                       ;; 00:3D0A $23
    inc  de                                       ;; 00:3D0B $13

    ; Set OAM byte 1 (X position)
    push bc                                       ;; 00:3D0C $C5
    ld   a, [wScreenShakeHorizontal]              ;; 00:3D0D $FA $55 $C1
    ld   c, a                                     ;; 00:3D10 $4F
    ldh  a, [hActiveEntityPosX]                   ;; 00:3D11 $F0 $EE
    add  a, [hl]                                  ;; 00:3D13 $86
    sub  a, c                                     ;; 00:3D14 $91
    ld   [de], a                                  ;; 00:3D15 $12
    inc  hl                                       ;; 00:3D16 $23
    inc  de                                       ;; 00:3D17 $13

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntityTilesOffset]            ;; 00:3D18 $F0 $F5
    ld   c, a                                     ;; 00:3D1A $4F
    ld   a, [hli]                                 ;; 00:3D1B $2A
    push af                                       ;; 00:3D1C $F5
    add  a, c                                     ;; 00:3D1D $81
    ld   [de], a                                  ;; 00:3D1E $12
    pop  af                                       ;; 00:3D1F $F1
    cp   $FF                                      ;; 00:3D20 $FE $FF
    jr   nz, .jp_3D28                             ;; 00:3D22 $20 $04
    dec  de                                       ;; 00:3D24 $1B
    xor  a                                        ;; 00:3D25 $AF
    ld   [de], a                                  ;; 00:3D26 $12
    inc  de                                       ;; 00:3D27 $13
.jp_3D28
    pop  bc                                       ;; 00:3D28 $C1
    inc  de                                       ;; 00:3D29 $13

    ; Set OAM byte 3 (tile attribute)
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3D2A $F0 $ED
    xor  [hl]                                     ;; 00:3D2C $AE
    ld   [de], a                                  ;; 00:3D2D $12
    inc  hl                                       ;; 00:3D2E $23
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]                              ;; 00:3D2F $F0 $FE
    and  a                                        ;; 00:3D31 $A7
    jr   z, .paletteFlipEnd                       ;; 00:3D32 $28 $0B
    ldh  a, [hActiveEntityFlipAttribute]          ;; 00:3D34 $F0 $ED
    and  a                                        ;; 00:3D36 $A7
    jr   z, .paletteFlipEnd                       ;; 00:3D37 $28 $06
    ; …invert the color palette data and set the 3th bit.
    ld   a, [de]                                  ;; 00:3D39 $1A
    and  $FF ^ OAMF_PALMASK                       ;; 00:3D3A $E6 $F8
    or   OAM_GBC_PAL_4                            ;; 00:3D3C $F6 $04
    ld   [de], a                                  ;; 00:3D3E $12
.paletteFlipEnd

    inc  de                                       ;; 00:3D3F $13
    dec  c                                        ;; 00:3D40 $0D
    jr   nz, .loop                                ;; 00:3D41 $20 $C3

    ld   a, [wActiveEntityIndex]                  ;; 00:3D43 $FA $23 $C1
    ld   c, a                                     ;; 00:3D46 $4F
    callsb func_015_795D                          ;; 00:3D47 $3E $15 $EA $00 $21 $CD $5D $79
    jp   ReloadSavedBank                          ;; 00:3D4F $C3 $1D $08

.return
    ld   a, [wActiveEntityIndex]                  ;; 00:3D52 $FA $23 $C1
    ld   c, a                                     ;; 00:3D55 $4F
    ret                                           ;; 00:3D56 $C9

; If the active entity rendering is disabled during
; the room transition, return to the parent of the caller.
; Otherwise, return to caller normally.
;
; Inputs:
;  bc:   active entity index?
SkipDisabledEntityDuringRoomTransition::
    ; If no room transition is active, return.
    push hl                                       ;; 00:3D57 $E5
    ld   a, [wRoomTransitionState]                ;; 00:3D58 $FA $24 $C1
    and  a                                        ;; 00:3D5B $A7
    jr   z, .return                               ;; 00:3D5C $28 $1F

    ; If hActiveEntityPosX - 1 is outside of screen, skip
    ldh  a, [hActiveEntityPosX]                   ;; 00:3D5E $F0 $EE
    dec  a                                        ;; 00:3D60 $3D
    cp   $C0                                      ;; 00:3D61 $FE $C0
    jr   nc, .skip                                ;; 00:3D63 $30 $17

    ; If hActiveEntityVisualPosY - 1 is outside of the screen, skip
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3D65 $F0 $EC
    dec  a                                        ;; 00:3D67 $3D
    cp   $88                                      ;; 00:3D68 $FE $88
    jr   nc, .skip                                ;; 00:3D6A $30 $10

    ; If wEntitiesPosXSignTable[c] != 0, skip
    ld   hl, wEntitiesPosXSignTable               ;; 00:3D6C $21 $20 $C2
    add  hl, bc                                   ;; 00:3D6F $09
    ld   a, [hl]                                  ;; 00:3D70 $7E
    and  a                                        ;; 00:3D71 $A7
    jr   nz, .skip                                ;; 00:3D72 $20 $08

    ; If wEntitiesPosYSignTable[c] != 0, skip
    ld   hl, wEntitiesPosYSignTable               ;; 00:3D74 $21 $30 $C2
    add  hl, bc                                   ;; 00:3D77 $09
    ld   a, [hl]                                  ;; 00:3D78 $7E
    and  a                                        ;; 00:3D79 $A7

    ; Otherwise, don't skip and simply return to caller.
    jr   z, .return                               ;; 00:3D7A $28 $01

.skip
    ; Pop the caller return address.
    ; The next value to be popped will be the parent caller
    ; address, thus returning to the parent of the parent early.
    pop  af                                       ;; 00:3D7C $F1

.return
    pop  hl                                       ;; 00:3D7D $E1
    ret                                           ;; 00:3D7E $C9

; Inputs:
;   bc   entity slot index
ClearEntitySpeed::
    ld   hl, wEntitiesSpeedXTable                 ;; 00:3D7F $21 $40 $C2
    add  hl, bc                                   ;; 00:3D82 $09
    ld   [hl], b                                  ;; 00:3D83 $70
    ld   hl, wEntitiesSpeedYTable                 ;; 00:3D84 $21 $50 $C2
    add  hl, bc                                   ;; 00:3D87 $09
    ld   [hl], b                                  ;; 00:3D88 $70
    ret                                           ;; 00:3D89 $C9

CopyEntityPositionToActivePosition::
    ld   hl, wEntitiesPosXTable                   ;; 00:3D8A $21 $00 $C2
    add  hl, bc                                   ;; 00:3D8D $09
    ld   a, [hl]                                  ;; 00:3D8E $7E
    ldh  [hActiveEntityPosX], a                   ;; 00:3D8F $E0 $EE
    ld   hl, wEntitiesPosYTable                   ;; 00:3D91 $21 $10 $C2
    add  hl, bc                                   ;; 00:3D94 $09
    ld   a, [hl]                                  ;; 00:3D95 $7E
    ldh  [hActiveEntityPosY], a                   ;; 00:3D96 $E0 $EF
    ld   hl, wEntitiesPosZTable                   ;; 00:3D98 $21 $10 $C3
    add  hl, bc                                   ;; 00:3D9B $09
    sub  a, [hl]                                  ;; 00:3D9C $96
    ldh  [hActiveEntityVisualPosY], a             ;; 00:3D9D $E0 $EC
    ret                                           ;; 00:3D9F $C9

func_015_7964_trampoline::
    callhl func_015_7964                          ;; 00:3DA0 $21 $00 $21 $36 $15 $CD $64 $79
    jp   ReloadSavedBank                          ;; 00:3DA8 $C3 $1D $08

EntityInitMiniMoldorm_trampoline::
    callhl EntityInitMiniMoldorm                  ;; 00:3DAB $21 $00 $21 $36 $04 $CD $1A $5A
    jp   ReloadSavedBank                          ;; 00:3DB3 $C3 $1D $08

EntityInitMoldorm_trampoline::
    callhl EntityInitMoldorm                      ;; 00:3DB6 $21 $00 $21 $36 $04 $CD $90 $56
    jp   ReloadSavedBank                          ;; 00:3DBE $C3 $1D $08

EntityInitFacade_trampoline::
    callhl EntityInitFacade                       ;; 00:3DC1 $21 $00 $21 $36 $04 $CD $4B $50
    jp   ReloadSavedBank                          ;; 00:3DC9 $C3 $1D $08

EntityInitSlimeEye_trampoline::
    callhl EntityInitSlimeEye                     ;; 00:3DCC $21 $00 $21 $36 $04 $CD $BD $49
    jp   ReloadSavedBank                          ;; 00:3DD4 $C3 $1D $08

EntityInitGenie_trampoline::
    callhl EntityInitGenie                        ;; 00:3DD7 $21 $00 $21 $36 $36 $CD $AB $72
    jp   ReloadSavedBank                          ;; 00:3DDF $C3 $1D $08

EntityInitSlimeEel_trampoline::
    callhl EntityInitSlimeEel                     ;; 00:3DE2 $21 $00 $21 $36 $05 $CD $C6 $6C
    jp   ReloadSavedBank                          ;; 00:3DEA $C3 $1D $08

EntityInitDodongoSnake_trampoline::
    callhl EntityInitDodongoSnake                 ;; 00:3DED $21 $00 $21 $36 $05 $CD $18 $68
    jp   ReloadSavedBank                          ;; 00:3DF5 $C3 $1D $08

EntityInitHotHead_trampoline::
    callhl EntityInitHotHead                      ;; 00:3DF8 $21 $00 $21 $36 $05 $CD $02 $63
    jp   ReloadSavedBank                          ;; 00:3E00 $C3 $1D $08

EntityInitEvilEagle_trampoline::
    callhl EntityInitEvilEagle                    ;; 00:3E03 $21 $00 $21 $36 $05 $CD $1E $5A
    jp   ReloadSavedBank                          ;; 00:3E0B $C3 $1D $08

Entity67Handler_trampoline::
    callhl Entity67Handler                        ;; 00:3E0E $21 $00 $21 $36 $05 $CD $6B $55
    jp   ReloadSavedBank                          ;; 00:3E16 $C3 $1D $08

CheckPositionForMapTransition_trampoline::
    ld   a, [wCurrentBank]                        ;; 00:3E19 $FA $AF $DB
    push af                                       ;; 00:3E1C $F5
    callsw CheckPositionForMapTransition          ;; 00:3E1D $3E $02 $CD $0C $08 $CD $75 $6C
    pop  af                                       ;; 00:3E25 $F1
    jp   SwitchBank                               ;; 00:3E26 $C3 $0C $08

; Unused
GhiniMovement_trampoline::
    callhl GhiniVisibleHandler.move               ;; 00:3E29 $21 $00 $21 $36 $04 $CD $63 $5C
    jp   ReloadSavedBank                          ;; 00:3E31 $C3 $1D $08

label_3E34::
    callhl SmashRock                              ;; 00:3E34 $21 $00 $21 $36 $03 $CD $07 $54
    jp   ReloadSavedBank                          ;; 00:3E3C $C3 $1D $08

LoadHeartsAndRupeesCount::
    callhl LoadRupeesDigits                       ;; 00:3E3F $21 $00 $21 $36 $02 $CD $CE $62
    call LoadHeartsCount                          ;; 00:3E47 $CD $14 $64
    jp   ReloadSavedBank                          ;; 00:3E4A $C3 $1D $08

label_3E4D::
    callsw SpawnChestWithItem                     ;; 00:3E4D $3E $02 $CD $0C $08 $CD $D0 $41
    ld   a, $03                                   ;; 00:3E55 $3E $03
    jp   SwitchBank                               ;; 00:3E57 $C3 $0C $08

; Draw the items in the A and B button slots
; Actually a trampoline to DrawInventorySlots
DrawABButtonSlots::
    ld   hl, rSelectROMBank                       ;; 00:3E5A $21 $00 $21
    ld   [hl], BANK(DrawInventorySlots)           ;; 00:3E5D $36 $20
    ; Set bc to $01, which only draws wInventoryItems.BButtonSlot and wInventoryItems.AButtonSlot
    ld   c, $01                                   ;; 00:3E5F $0E $01
    ld   b, $00                                   ;; 00:3E61 $06 $00
    ld   e, $FF                                   ;; 00:3E63 $1E $FF
    call DrawInventorySlots                       ;; 00:3E65 $CD $9C $5C
    jp   ReloadSavedBank                          ;; 00:3E68 $C3 $1D $08

GiveInventoryItem_trampoline::                ; @TODO Give player item in reg d
    callhl GiveInventoryItem                      ;; 00:3E6B $21 $00 $21 $36 $03 $CD $72 $64
    jp   ReloadSavedBank                          ;; 00:3E73 $C3 $1D $08

func_006_783C_trampoline::
    callsw func_006_783C                          ;; 00:3E76 $3E $06 $CD $0C $08 $CD $3C $78
    ld   a, $03                                   ;; 00:3E7E $3E $03
    jp   SwitchBank                               ;; 00:3E80 $C3 $0C $08

UnloadAllEntities::
    ld   e, MAX_ENTITIES                          ;; 00:3E83 $1E $10
    ld   hl, wEntitiesStatusTable                 ;; 00:3E85 $21 $80 $C2

.loop
    xor  a                                        ;; 00:3E88 $AF
    ldi  [hl], a                                  ;; 00:3E89 $22
    dec  e                                        ;; 00:3E8A $1D
    jr   nz, .loop                                ;; 00:3E8B $20 $FB

    ret                                           ;; 00:3E8D $C9

label_3E8E::
    ld   hl, wEntitiesPowerRecoilingTable         ;; 00:3E8E $21 $A0 $C4
    add  hl, bc                                   ;; 00:3E91 $09
    ld   a, [hl]                                  ;; 00:3E92 $7E
    and  a                                        ;; 00:3E93 $A7
    ret  z                                        ;; 00:3E94 $C8

    ldh  a, [hFrameCounter]                       ;; 00:3E95 $F0 $E7
    xor  c                                        ;; 00:3E97 $A9
    and  $03                                      ;; 00:3E98 $E6 $03
    ret  nz                                       ;; 00:3E9A $C0

    ldh  a, [hActiveEntityPosX]                   ;; 00:3E9B $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 00:3E9D $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 00:3E9F $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 00:3EA1 $E0 $D8
    ld   a, TRANSCIENT_VFX_SMOKE                  ;; 00:3EA3 $3E $08
    call AddTranscientVfx                         ;; 00:3EA5 $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ;; 00:3EA8 $21 $20 $C5
    add  hl, de                                   ;; 00:3EAB $19
    ld   [hl], $0F                                ;; 00:3EAC $36 $0F
    ret                                           ;; 00:3EAE $C9

; Clear the entity "ignore hits" countdown when the entity is
; recoiling, but collisions with something.
StopEntityRecoilOnCollision::
    ; [hMultiPurpose0] = abs(wEntitiesRecoilVelocityX[bc])
    ld   hl, wEntitiesRecoilVelocityX             ;; 00:3EAF $21 $F0 $C3
    add  hl, bc                                   ;; 00:3EB2 $09
    ld   a, [hl]                                  ;; 00:3EB3 $7E

    bit  7, a                                     ;; 00:3EB4 $CB $7F
    jr   z, .negativeTEnd                         ;; 00:3EB6 $28 $02
    cpl                                           ;; 00:3EB8 $2F
    inc  a                                        ;; 00:3EB9 $3C
.negativeTEnd
    ldh  [hMultiPurpose0], a                      ;; 00:3EBA $E0 $D7

    ; a = abs(wEntitiesRecoilVelocityY[bc])
    ld   hl, wEntitiesRecoilVelocityY             ;; 00:3EBC $21 $00 $C4
    add  hl, bc                                   ;; 00:3EBF $09
    ld   a, [hl]                                  ;; 00:3EC0 $7E

    bit  7, a                                     ;; 00:3EC1 $CB $7F
    jr   z, .negativeSEnd                         ;; 00:3EC3 $28 $02
    cpl                                           ;; 00:3EC5 $2F
    inc  a                                        ;; 00:3EC6 $3C
.negativeSEnd

    ; if the entity is mostly recoiling horizontaly, check horizontal directions;
    ; else check vertical directions.
    ld   e, $03 ; directions: right | left        ;; 00:3EC7 $1E $03
    ld   hl, hMultiPurpose0                       ;; 00:3EC9 $21 $D7 $FF
    cp   [hl]                                     ;; 00:3ECC $BE
    jr   c, .checkHorizontalCollisions            ;; 00:3ECD $38 $02
    ; check vertical collisions
    ld   e, $0C  ; directions: top | bottom       ;; 00:3ECF $1E $0C
.checkHorizontalCollisions
    ld   a, e                                     ;; 00:3ED1 $7B

    ; Check if the entity is collisionning in the given directions
    ld   hl, wEntitiesCollisionsTable             ;; 00:3ED2 $21 $A0 $C2
    add  hl, bc                                   ;; 00:3ED5 $09
    and  [hl]                                     ;; 00:3ED6 $A6
    jr   z, .return                               ;; 00:3ED7 $28 $05

    ; If collisionning, clear the entity "Ignore hits" countdown
    ; (by setting wEntitiesIgnoreHitsCountdownTable[bc] to 0)
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 00:3ED9 $21 $10 $C4
    add  hl, bc                                   ;; 00:3EDC $09
    ld   [hl], b                                  ;; 00:3EDD $70

.return
    ret                                           ;; 00:3EDE $C9

BossIntroDialogTable::
    ; Indexed by hMapId. Last entry might be unused?
    db $B0, $B4, $B1, $B2, $B3, $B6, $BA, $BC, $B8 ;; 00:3EDF

; Start the boss music and show the boss's intro dialog
BossIntro::
    ld   hl, wInventoryAppearing                  ;; 00:3EE8 $21 $4F $C1
    ld   a, [wRoomTransitionState]                ;; 00:3EEB $FA $24 $C1
    or   [hl]                                     ;; 00:3EEE $B6
    ret  nz                                       ;; 00:3EEF $C0

    ld   a, [wBossIntroDelay]                     ;; 00:3EF0 $FA $65 $C1
    and  a                                        ;; 00:3EF3 $A7
    jr   z, .endOfDelay                           ;; 00:3EF4 $28 $05
    dec  a                                        ;; 00:3EF6 $3D
    ld   [wBossIntroDelay], a                     ;; 00:3EF7 $EA $65 $C1
    ret                                           ;; 00:3EFA $C9
.endOfDelay:

    ; don't do this twice
    ld   a, [wDidBossIntro]                       ;; 00:3EFB $FA $BD $C1
    and  a                                        ;; 00:3EFE $A7
    ret  nz                                       ;; 00:3EFF $C0
    inc  a                                        ;; 00:3F00 $3C
    ld   [wDidBossIntro], a                       ;; 00:3F01 $EA $BD $C1

    ; boss music
    ld   hl, wEntitiesOptions1Table               ;; 00:3F04 $21 $30 $C4
    add  hl, bc                                   ;; 00:3F07 $09
    ld   a, [hl]                                  ;; 00:3F08 $7E
    and  $04                                      ;; 00:3F09 $E6 $04
    ld   a, MUSIC_BOSS                            ;; 00:3F0B $3E $19

    jr   z, .endIf                                ;; 00:3F0D $28 $02
    ld   a, MUSIC_MINIBOSS                        ;; 00:3F0F $3E $50

.endIf:
    ld   [wMusicTrackToPlay], a                   ;; 00:3F11 $EA $68 $D3

    ldh  [hDefaultMusicTrackAlt], a               ;; 00:3F14 $E0 $BD
    ld   a, [wTransitionSequenceCounter]          ;; 00:3F16 $FA $6B $C1
    cp   $04                                      ;; 00:3F19 $FE $04
    ret  nz                                       ;; 00:3F1B $C0

    ; opening monologue
    ldh  a, [hActiveEntityType]                   ;; 00:3F1C $F0 $EB
    cp   ENTITY_DESERT_LANMOLA                    ;; 00:3F1E $FE $87
    jr   nz, .endDesertLanmola                    ;; 00:3F20 $20 $04
    ld_dialog_low a, Dialog0DA                    ;; 00:3F22 $3E $DA
    jr   .openDialog                              ;; 00:3F24 $18 $1F
.endDesertLanmola:

    cp   ENTITY_GRIM_CREEPER                      ;; 00:3F26 $FE $BC
    jr   nz, .endGrimCreeper                      ;; 00:3F28 $20 $04
    ld_dialog_low a, Dialog026                    ;; 00:3F2A $3E $26
    jr   .openDialog                              ;; 00:3F2C $18 $17
.endGrimCreeper:

    ld   hl, wEntitiesOptions1Table               ;; 00:3F2E $21 $30 $C4
    add  hl, bc                                   ;; 00:3F31 $09
    ld   a, [hl]                                  ;; 00:3F32 $7E
    and  $04                                      ;; 00:3F33 $E6 $04
    ret  nz                     ; other minibosses are silent ;; 00:3F35 $C0
    ldh  a, [hMapId]                              ;; 00:3F36 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:3F38 $FE $FF
    ret  z                                        ;; 00:3F3A $C8
    cp   MAP_FACE_SHRINE                          ;; 00:3F3B $FE $05
    ret  z                                        ;; 00:3F3D $C8
    ld   e, a                                     ;; 00:3F3E $5F
    ld   d, b                                     ;; 00:3F3F $50
    ld   hl, BossIntroDialogTable                 ;; 00:3F40 $21 $DF $3E
    add  hl, de                                   ;; 00:3F43 $19
    ld   a, [hl]                                  ;; 00:3F44 $7E
.openDialog:
    jp   OpenDialogInTable0                       ;; 00:3F45 $C3 $85 $23

data_3F48::
    db 1, 2, 4, 8, $10, $20, $40, $80             ;; 00:3F48

DidKillEnemy::
    ld   a, BANK(SpawnEnemyDrop)                  ;; 00:3F50 $3E $03
    ld   [wEnemyWasKilled], a                     ;; 00:3F52 $EA $13 $C1
    ld   [rSelectROMBank], a                      ;; 00:3F55 $EA $00 $21
    call SpawnEnemyDrop                           ;; 00:3F58 $CD $CF $55
    call ReloadSavedBank                          ;; 00:3F5B $CD $1D $08

.label_3F5E
    ld   hl, wEntitiesLoadOrderTable              ;; 00:3F5E $21 $60 $C4
    add  hl, bc                                   ;; 00:3F61 $09
    ld   a, [hl]                                  ;; 00:3F62 $7E
    cp   $FF                                      ;; 00:3F63 $FE $FF
    jr   z, UnloadEntity                          ;; 00:3F65 $28 $26
    ; Increase wKillCount
    push af                                       ;; 00:3F67 $F5
    ld   a, [wKillCount]                          ;; 00:3F68 $FA $B5 $DB
    ld   e, a                                     ;; 00:3F6B $5F
    ld   d, b                                     ;; 00:3F6C $50
    inc  a                                        ;; 00:3F6D $3C
    ld   [wKillCount], a                          ;; 00:3F6E $EA $B5 $DB
    ; Append entity ID to wKillOrder array
    ; There's a bug here: The bounds of wKillOrder
    ; isn't checked, and can overflow, which can
    ; cause the so-called "Tunic Glitch" among others.
    ld   a, [hl]                                  ;; 00:3F71 $7E
    ld   hl, wKillOrder                           ;; 00:3F72 $21 $B6 $DB
    add  hl, de                                   ;; 00:3F75 $19
    ld   [hl], a                                  ;; 00:3F76 $77
    pop  af                                       ;; 00:3F77 $F1

.label_3F78
    cp   $08                                      ;; 00:3F78 $FE $08
    jr   nc, UnloadEntity                         ;; 00:3F7A $30 $11
    ld   e, a                                     ;; 00:3F7C $5F
    ld   d, b                                     ;; 00:3F7D $50
    ld   hl, data_3F48                            ;; 00:3F7E $21 $48 $3F
    add  hl, de                                   ;; 00:3F81 $19
    ldh  a, [hMapRoom]                            ;; 00:3F82 $F0 $F6
    ld   e, a                                     ;; 00:3F84 $5F
    ld   d, b                                     ;; 00:3F85 $50
    ld   a, [hl]                                  ;; 00:3F86 $7E
    ld   hl, wEntitiesClearedRooms                ;; 00:3F87 $21 $00 $CF
    add  hl, de                                   ;; 00:3F8A $19
    or   [hl]                                     ;; 00:3F8B $B6
    ld   [hl], a                                  ;; 00:3F8C $77
    ; fall through UnloadEntity

; Unload an entity by setting its status to 0 (ENTITY_STATUS_DISABLED)
; Input:
;   bc:  index of the entity
UnloadEntity::
UnloadEntityAndReturn::
    ld   hl, wEntitiesStatusTable                 ;; 00:3F8D $21 $80 $C2
    add  hl, bc                                   ;; 00:3F90 $09
    ld   [hl], b                                  ;; 00:3F91 $70
    ret                                           ;; 00:3F92 $C9
